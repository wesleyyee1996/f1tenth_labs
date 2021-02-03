#!/usr/bin/env python
from __future__ import print_function
import sys
import math
import numpy as np

#ROS Imports
import rospy
from sensor_msgs.msg import Image, LaserScan
from ackermann_msgs.msg import AckermannDriveStamped, AckermannDrive
from nav_msgs.msg import Odometry

#PID CONTROL PARAMS
ku = 0.1
pu = 1
kp = 1.2
kd = 0.04
ki = 0.0
#ki=0
servo_offset = 0.0
prev_error = 0.0 
error = 0.0
integral = 0.0
prev_time = None

#WALL FOLLOW PARAMS
ANGLE_RANGE = 270 # Hokuyo 10LX has 270 degrees scan
DESIRED_DISTANCE_RIGHT = 0.9 # meters
DESIRED_DISTANCE_LEFT = 0.55
VELOCITY = 2.00 # meters per second
CAR_LENGTH = 0.50 # Traxxas Rally is 20 inches or 0.5 meters

class WallFollow:
    """ Implement Wall Following on the car
    """
    def __init__(self):
        #Topics & Subs, Pubs
        lidarscan_topic = '/scan'
        drive_topic = '/nav'

        self.lidar_sub = rospy.Subscriber(lidarscan_topic, LaserScan, self.lidar_callback, queue_size = 1)
        #self.odom_sub = rospy.Subscriber("/odom", Odometry, self.odom_callback)
        self.drive_pub = rospy.Publisher(drive_topic, AckermannDriveStamped, queue_size = 10)

    def getRange(self, data, angle):
        # data: single message from topic /scan
        # angle: between -45 to 225 degrees, where 0 degrees is directly to the right
        # Outputs length in meters to object with angle in lidar scan field of view
        if angle < 0:
            angle = 90-angle
        else:
            angle = 90+angle
        
        avg_len = 0
        count = 0
        rospy.loginfo("Angle range: "+str(angle*3-1)+" to "+str(angle*3+2))
        for laser_data in data.ranges[(angle*3):(angle*3+2)]:
            if not np.isinf(laser_data) and not np.isnan(laser_data):
                avg_len += laser_data
                count += 1
        if count > 0:
            avg_len = avg_len / count
        return avg_len

    def pid_control(self, error, time_increment):
        global kp
        global ki
        global kd
        global prev_error
        global integral
        global VELOCITY
                
        curr_integral = integral + error * time_increment
        derivative = (error - prev_error)/time_increment
        
        angle = -(kp*error + ki*curr_integral + kd*derivative)
        print("P: "+str(kp*error)+", I: "+str(ki*curr_integral)+", D: "+str(kd*derivative))
        
        if (abs(angle) < 0.2):
            VELOCITY = 1.5
        elif abs(angle) >= 0.2 and abs(angle) < 0.3:
            VELOCITY = 1.0
        else:
            VELOCITY = 0.5
        
        #TODO: Use kp, ki & kd to implement a PID controller for 
        drive_msg = AckermannDriveStamped()
        drive_msg.header.stamp = rospy.Time.now()
        drive_msg.header.frame_id = "laser"
        drive_msg.drive.steering_angle = angle
        drive_msg.drive.speed = VELOCITY
        if angle > 0:
            rospy.loginfo("Going LEFT! Steering angle: "+str(angle))
            #rospy.loginfo("LEFT!")
        else:
            rospy.loginfo("Going RIGHT! Steering angle: "+str(angle))
            #rospy.loginfo("RIGHT!")
        self.drive_pub.publish(drive_msg)
        
        integral = curr_integral
        prev_error = error

# =============================================================================
#     def followLeft(self, data, leftDist):
#         #Follow left wall as per the algorithm 
#         
#         error = 0.0
#         return error
# =============================================================================
    
    # calculates future distance between car and wall
    def calcFutureDistance(self, a, b, theta):
        alpha = math.atan((a*math.cos(theta/57.2958)-b)/(a*math.sin(theta/57.2958)))
        Dt = b*math.cos(alpha)
        #rospy.loginfo("Alpha: "+str(alpha)+ ", Dt: "+str(Dt))
        global VELOCITY
#        L = 0
#        if VELOCITY >= 1.5:
#            L = 5
#        elif VELOCITY == 1.0:
#            L = 3
#        else:
#            L = 1
        L = 0.5
        #rospy.loginfo("L: "+str(L)+", Velocity: "+str(VELOCITY))
        return Dt+L*math.sin(alpha)

    def lidar_callback(self, data):
        
        a = self.getRange(data, 120)
        b = self.getRange(data, 180)
        rospy.loginfo("a: "+str(a)+", b: "+str(b))
        Dt_future = self.calcFutureDistance(a, b, 60)
        #print("Dt_future"+str(Dt_future))
        error = DESIRED_DISTANCE_LEFT - Dt_future
        rospy.loginfo('Dt_future: '+str(Dt_future)+', Error: '+str(error))
        
        #send error to pid_control
        global prev_time
        if not prev_time:
            prev_time = rospy.Time.now()            
        
        time_increment = data.header.stamp - prev_time
        self.pid_control(error, time_increment.to_sec())
        prev_time = data.header.stamp
        
    def odom_callback(self, msg):
        rospy.loginfo("X vel: "+str(msg.twist.twist.linear.x))
        rospy.loginfo("Y vel: "+str(msg.twist.twist.linear.y))

def main(args):
    rospy.init_node("WallFollow_node", anonymous=True)
    wf = WallFollow()
    rospy.sleep(0.1)
    rospy.spin()

if __name__=='__main__':
	main(sys.argv)
