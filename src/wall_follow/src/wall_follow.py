#!/usr/bin/env python
from __future__ import print_function
import sys
import math
import numpy as np

#ROS Imports
import rospy
from sensor_msgs.msg import Image, LaserScan
from ackermann_msgs.msg import AckermannDriveStamped, AckermannDrive

#PID CONTROL PARAMS
kp = 1
kd = 0
ki = 0
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

        self.lidar_sub = rospy.Subscriber(lidarscan_topic, LaserScan, self.lidar_callback)
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
        for laser_data in data.ranges[angle*3-1:angle*3+2]:
            if not np.isinf(laser_data) and not np.isnan(laser_data):
                avg_len += laser_data
                count = count + 1
        if count > 0:
            avg_len = avg_len / count
        
        return avg_len

    def pid_control(self, error, time_increment):
        global kp
        global ki
        global kd
        global prev_error
        global integral
                
        print()
        curr_integral = integral + error * time_increment
        derivative = (error - prev_error)/time_increment
        angle = -(kp*error + ki*curr_integral + kd*derivative)
        
        velocity = 1.0
        
        #TODO: Use kp, ki & kd to implement a PID controller for 
        drive_msg = AckermannDriveStamped()
        drive_msg.header.stamp = rospy.Time.now()
        drive_msg.header.frame_id = "laser"
        drive_msg.drive.steering_angle = angle
        drive_msg.drive.speed = velocity
        rospy.loginfo("Steering angle: "+str(angle)+ ", Speed: "+str(velocity))
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
        alpha = np.arctan((a*np.cos(theta)-b)/a*np.sin(theta))
        Dt = b*np.cos(alpha)
        L = CAR_LENGTH
        return Dt+L*np.sin(alpha)

    def lidar_callback(self, data):
        """ 
        """
        a = self.getRange(data, 220)
        b = self.getRange(data, 270)
        Dt_future = self.calcFutureDistance(a, b, 50)
        error = DESIRED_DISTANCE_LEFT - Dt_future
        
        #send error to pid_control
        global prev_time
        if not prev_time:
            prev_time = rospy.Time.now()
        time_increment = data.header.stamp - prev_time
        self.pid_control(error, time_increment.to_sec())

def main(args):
    rospy.init_node("WallFollow_node", anonymous=True)
    wf = WallFollow()
    rospy.sleep(0.1)
    rospy.spin()

if __name__=='__main__':
	main(sys.argv)
