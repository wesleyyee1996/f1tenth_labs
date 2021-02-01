#!/usr/bin/env python
from __future__ import print_function
import sys
import math
import numpy as np

#ROS Imports
import rospy
from sensor_msgs.msg import Image, LaserScan
from ackermann_msgs.msg import AckermannDriveStamped, AckermannDrive

class reactive_follow_gap:
    def __init__(self):
        #Topics & Subscriptions,Publishers
        lidarscan_topic = '/scan'
        drive_topic = '/nav'

        self.lidar_sub = rospy.Subscriber(lidarscan_topic, LaserScan, self.lidar_callback, queue_size=1) #TODO
        self.drive_pub = rospy.Publisher(drive_topic, AckermannDriveStamped, queue_size=10) #TODO
        
        
    
    def preprocess_lidar(self, ranges):
        """ Preprocess the LiDAR scan array. Expert implementation includes:
            1.Setting each value to the mean over some window
            2.Rejecting high values (eg. > 3m)
        """
        proc_ranges = list(ranges)
        
        total = 0
        count = 0
        start = 0
        lowest = 100
        tol = 1
        for i in range(270, 810):
            if not np.isinf(i) and not np.isnan(i):
                curr = ranges[i]
                if (curr < lowest):
                    lowest = curr
                if (abs(curr-lowest) <= tol):
                    total += curr
                    count += 1
                    continue
                else:
                    if i-start > 5:
                        for j in range(start,i):
                            proc_ranges[j] = total/count
                        lowest = 100
                        total = count = 0
                        start = i
                    continue
        
        return proc_ranges

    def find_max_gap(self, free_space_ranges):
        """ Return the start index & end index of the max gap in free_space_ranges
        """
        start = end = 0
        val = 0
        curr_start = 0
        for i in range(len(free_space_ranges)):
            if free_space_ranges[i] != 0:
                if val == free_space_ranges[i]:
                    if (i - curr_start) > end-start:
                        val = free_space_ranges[i]
                        start = curr_start
                        end = i
                else:
                    curr_start = i
                    val = free_space_ranges[i]
        return start, end
    
    def find_best_point(self, start_i, end_i, ranges):
        """Start_i & end_i are start and end indicies of max-gap range, respectively
        Return index of best point in ranges
	Naive: Choose the furthest point within ranges and go there
        """
        max_val = 0
        target = start_i
        for i in range(start_i, end_i):
            if ranges[i] > max_val:
                target = i
                max_val = ranges[i]
                
        angle = abs(540-target)
        return angle

    def lidar_callback(self, data):
        """ Process each LiDAR scan as per the Follow Gap algorithm & publish an AckermannDriveStamped Message
        """
        
        ranges = data.ranges
        proc_ranges = self.preprocess_lidar(ranges)

        closest = 100
        close_start = 0
        close_end = 0
        #Find closest point to LiDAR
        for i in range(len(proc_ranges)):
            if proc_ranges[i] < closest:
                close_start = i
            if proc_ranges[i] == closest:
                close_end = i

        #Eliminate all points inside 'bubble' (set them to zero) 
        for i in range(close_start, close_end):
            proc_ranges[i] = 0
            
        #Find max length gap 
        start, end = self.find_max_gap(proc_ranges)

        #Find the best point in the gap 
        angle = self.find_best_point(start, end, ranges)
        
        VELOCITY = 0
        if (abs(angle) < 0.2):
            VELOCITY = 1.5
        elif abs(angle) >= 0.2 and abs(angle) < 0.3:
            VELOCITY = 1.0
        else:
            VELOCITY = 0.5

        #Publish Drive message
        drive_msg = AckermannDriveStamped()
        drive_msg.header.stamp = rospy.Time.now()
        drive_msg.header.frame_id = "laser"
        drive_msg.drive.steering_angle = angle
        drive_msg.drive.speed = VELOCITY
        self.drive_pub.publish(drive_msg)

def main(args):
    rospy.init_node("FollowGap_node", anonymous=True)
    rfgs = reactive_follow_gap()
    rospy.sleep(0.1)
    rospy.spin()

if __name__ == '__main__':
    main(sys.argv)