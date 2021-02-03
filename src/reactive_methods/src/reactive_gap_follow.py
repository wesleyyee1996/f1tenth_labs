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

        self.lidar_sub = rospy.Subscriber(lidarscan_topic, LaserScan, self.lidar_callback, queue_size=1) 
        self.drive_pub = rospy.Publisher(drive_topic, AckermannDriveStamped, queue_size=1)
    
    def preprocess_lidar(self, data):
        """ Preprocess the LiDAR scan array. Expert implementation includes:
            1.Setting each value to the mean over some window
            2.Rejecting high values (eg. > 3m)
        """
        ranges = data.ranges
        proc_ranges = list(ranges)
        
        for i in range(len(ranges)):
            if np.isinf(i) or np.isnan(i):
                proc_ranges[i] = 0
            elif ranges[i] > data.range_max:
                proc_ranges[i] = data.range_max
                
        return proc_ranges
    
    def find_closest_point(self, proc_ranges, range_max):
        closest_idx = 200
        closest_dist = range_max * 5
        #Find closest point to LiDAR
        for i in range(200,880):
            dist = proc_ranges[i-2] + proc_ranges[i-1] + proc_ranges[i] + proc_ranges[i+1] + proc_ranges[i+2]
            if dist < closest_dist:
                closest_dist = dist
                closest_idx = i
        
        return closest_idx, closest_dist

    def find_max_gap(self, free_space_ranges):
        """ Return the start index & end index of the max gap in free_space_ranges
        """
        start = end = 200
        curr_start = 200
        #print(free_space_ranges)
        for i in range(201, 880):
            if free_space_ranges[i] != 0:
                if free_space_ranges[i-1] == 0:
                    curr_start = i
                else:
                    if (i-curr_start) > end-start:
                        start = curr_start
                        end = i
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
                
        angle = -(540-target)*3
        return float(angle)/1080, target

    def lidar_callback(self, data):
        """ Process each LiDAR scan as per the Follow Gap algorithm & publish an AckermannDriveStamped Message
        """
        
        proc_ranges = self.preprocess_lidar(data)

        closest_idx, closest_dist = self.find_closest_point(proc_ranges, data.range_max)
        
        bubble_size = int(math.floor(math.atan(0.55/closest_dist)*1080))/2
        
        print("Closest dist: "+str(closest_dist)+", Closest idx: "+str(closest_idx)+", No Go Zone: ["+
              str(closest_idx-bubble_size)+","+str(closest_idx+bubble_size)+"]")
        
        #Eliminate all points inside 'bubble' (set them to zero) 
        for i in range(closest_idx-bubble_size, closest_idx+bubble_size):
            proc_ranges[i] = 0
                        
        #Find max length gap 
        start, end = self.find_max_gap(proc_ranges)

        #Find the best point in the gap 
        angle, target = self.find_best_point(start, end, data.ranges)
        
        rospy.loginfo("Max Length Gap: ["+str(start)+","+str(end)+"] , Target: "+str(target))
        #if (abs(angle) > 0.2):
            #print(proc_ranges[270:810])
        
        #VELOCITY = 1
        if (abs(angle) < 0.05):
            VELOCITY = 1.5
        elif abs(angle) >= 0.05 and abs(angle) < 0.1:
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