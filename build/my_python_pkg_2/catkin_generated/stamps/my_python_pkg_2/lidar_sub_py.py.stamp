#! /usr/bin/env python

import rospy
import numpy as np
from sensor_msgs.msg import LaserScan
from wesley_yee_ws.msg import scan_range
 

class ScanPubSub(object):
    def __init__(self, pub_close, pub_far):
        self._pub_close = pub_close
        self._pub_far = pub_far
        
    def scanCallback(self, msg):
        closest = farthest = -1
        for data in msg.ranges:
            if not np.isinf(data) and not np.isnan(data):
                if closest < 0 or data < closest:
                    closest = data
                if farthest < 0 or data > farthest:
                    farthest = data
        closest_msg = farthest_msg = scan_range()
        closest_msg.distance = closest
        farthest_msg.distance = farthest
        self._pub_close.publish(closest)
        self._pub_far.publish(farthest)
    
        
def main():
    rospy.init_node('lidar_sub')
    
    pub_close = rospy.Publisher('/closest_node', scan_range, queue_size = 10)
    pub_far = rospy.Publisher('/furthest_node', scan_range, queue_size = 10)
    scanPub = ScanPubSub(pub_close, pub_far)
    
    rospy.Subscriber('/scan', LaserScan, scanPub.scanCallback)
    
    rospy.spin()
        
if __name__ == '__main__':
    main()

