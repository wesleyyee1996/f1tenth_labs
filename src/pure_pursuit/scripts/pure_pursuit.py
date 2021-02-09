#!/usr/bin/env python
import rospy
from geometry_msgs.msg import PoseStamped, Point
from ackermann_msgs.msg import AckermannDriveStamped, AckermannDrive
from sensor_msgs.msg import LaserScan
from visualization_msgs.msg import Marker, MarkerArray
import numpy as np
import pandas as pd
import math
from numpy.linalg import norm

# import ROS msg types and libraries
waypoints = None

L = 1.2 #lookahead distance
thresh = 0.1 #lookahead threshold
Kp = 0.5 #proportional gain
Vel = 2.5 #velocity

def read_data():
    global waypoints
    
    df = pd.read_csv("/home/meam520/rcws/logs/test.csv")
        
    waypoints = df.to_numpy()

class PurePursuit(object):
    """
    The class that handles pure pursuit.
    """
    def __init__(self):
        # create ROS subscribers and publishers.
        self.odom_sub = rospy.Subscriber("/gt_pose", PoseStamped, self.pose_callback, queue_size=1)
        self.drive_pub = rospy.Publisher("/nav",  AckermannDriveStamped, queue_size = 10)
        self.vis_pub = rospy.Publisher("/waypoint_vis", Marker, queue_size= 10)
        self.lines_vis_pub = rospy.Publisher("/path_lines", Marker, queue_size = 10)

    def pose_callback(self, pose_msg):
        
        # find the current waypoints to track using methods mentioned in lecture
        lo_idx, hi_idx, length, theta = self.pick_waypoint(pose_msg)
        
        goal_pos_glob = waypoints[hi_idx]
        
        # interpolate the waypoints
        goal_pos_local = self.interpolate_waypoint(lo_idx, hi_idx, theta, pose_msg)
        
        self.publish_visualization(goal_pos_glob)
        # calculate curvature/steering angle
        
        steer_angle = self.calculate_steering(goal_pos_glob, pose_msg, theta, length)

        # publish drive message, don't forget to limit the steering angle between -0.4189 and 0.4189 radians
        self.publish_drive(steer_angle)
        
    def publish_drive(self, steer_angle):
        drive_msg = AckermannDriveStamped()
        drive_msg.header.stamp = rospy.Time.now()
        drive_msg.header.frame_id = "laser"
        drive_msg.drive.steering_angle = steer_angle
        drive_msg.drive.speed = Vel
        self.drive_pub.publish(drive_msg)
        
    def publish_visualization(self, glob_pos):
        marker = Marker()
        marker.header.stamp = rospy.Time.now()
        marker.header.frame_id = "map"
        marker.ns = "my_namespace"
        marker.id = 0
        marker.type = 2
        marker.action = 0
        marker.pose.position.x = glob_pos[0]
        marker.pose.position.y = glob_pos[1]
        marker.pose.position.z = 0
        marker.pose.orientation.x = 0
        marker.pose.orientation.y = 0
        marker.pose.orientation.z = 0
        marker.pose.orientation.w = 1.0
        marker.scale.x = 0.1
        marker.scale.y = 0.1
        marker.scale.z = 0.1
        marker.color.r = 0.0
        marker.color.g = 1.0
        marker.color.b = 0.0
        marker.color.a = 1.0
        self.vis_pub.publish(marker)
        
        #markerArray = MarkerArray()
        marker2 = Marker()
        marker2.header.stamp = rospy.Time.now()
        marker2.header.frame_id = "map"
        marker2.ns = "my_namespace"
        marker2.id = 0
        marker2.type = marker2.LINE_STRIP
        marker2.action = marker2.ADD
        marker2.scale.x = 0.1
        marker2.scale.y = 0.1
        marker2.scale.z = 0.1
        marker2.color.a = 1.0
        marker2.color.b = 1.0
        marker2.color.g = 1.0
        marker2.pose.orientation.w = 1.0
        marker2.pose.position.x = 0
        marker2.pose.position.y = 0
        marker2.pose.position.z = 0
        
        marker2.points=[]
        for i in range(len(waypoints)):
            p = Point()
            p.x = waypoints[i][0]
            p.y = waypoints[i][1]
            p.z = 0
            marker2.points.append(p)
        
        #markerArray.markers.append(marker2)
        self.lines_vis_pub.publish(marker2)

    def calculate_steering(self, goal_pos_glob, pose_msg, theta, length):
        
        curr_x_glob = pose_msg.pose.position.x
        curr_y_glob = pose_msg.pose.position.y
        
        # homogeneous transform to get global frame to car frame
        T = np.array([[np.cos(theta), -np.sin(theta), curr_x_glob],
                         [np.sin(theta), np.cos(theta), curr_y_glob],
                         [0,0,1]])
        
        # get y 
        y = np.dot(np.linalg.inv(T), np.array([goal_pos_glob[0], goal_pos_glob[1], 1]))[1]
        
        # calculate steering angle using formula
        steer_angle = Kp*2*y/length**2
        
        return steer_angle

    def interpolate_waypoint(self, lo, hi, theta, pose_msg):
        
        curr_x = pose_msg.pose.position.x
        curr_y = pose_msg.pose.position.y
        
        # transform lo and hi points to vehicle frame of reference
        Rot = np.array([[np.cos(theta), -np.sin(theta), curr_x],
                         [np.sin(theta), np.cos(theta), curr_y],
                         [0,0,1]])
        
        glob_pos = waypoints[hi][0:2]        
    
        local_pos = np.dot(np.linalg.inv(Rot),np.array([glob_pos[0],glob_pos[1], 1]).T)
        return local_pos
        

    def pick_waypoint(self, pose_msg):
        
        # pose x and y positions
        curr_x = pose_msg.pose.position.x
        curr_y = pose_msg.pose.position.y
        
        # quaternion orientation
        w = pose_msg.pose.orientation.w
        z = pose_msg.pose.orientation.z
        
        # convert quaternion to angle
        t3 = 2*(w*z)
        t4 = 1-2*(z*z)
        theta = math.atan2(t3,t4)
        
        # lookahead forward point
        lookahead_x = L*np.cos(theta) + curr_x
        lookahead_y = L*np.sin(theta) + curr_y
        
        # calculate curr forward vector
        vec1 = [lookahead_x-curr_x, lookahead_y-curr_y]
        
        smallest_over_val = 100
        smallest_over_idx = 0
        largest_under_val = 0
        largest_under_idx = 0
        
        # loop through the list of waypoints     
        for i, p in enumerate(waypoints):
            vec2 = [p[0]-curr_x, p[1]-curr_y]
            normv1 = norm(vec1)
            normv2 = norm(vec2)
            if normv2 <= L+thresh and normv2 >= L-thresh: 
                dot = np.dot(vec1,vec2)/normv1/normv2
                angle = math.acos(dot)
                if (abs(angle) < 0.7):
                    if normv2 <= L and normv2 > largest_under_val:
                        largest_under_val = normv2
                        largest_under_idx = i
                    elif normv2 > L and normv2 < smallest_over_val:
                        smallest_over_val = normv2
                        smallest_over_idx = i
                
        return largest_under_idx, smallest_over_idx, smallest_over_val, theta
        

def main():
    
    rospy.init_node('pure_pursuit_node')
    pp = PurePursuit()
    rospy.spin()
    rospy.sleep(0.1)
    
if __name__ == '__main__':
    read_data()
    main()
