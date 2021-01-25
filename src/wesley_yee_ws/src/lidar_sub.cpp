#include "ros/ros.h"
#include "sensor_msgs/LaserScan.h"
#include "std_msgs/Float32.h"
#include "wesley_yee_ws/scan_range.h"

wesley_yee_ws::scan_range scan;

void scanCallback(const sensor_msgs::LaserScan& msg)
{	
    for(unsigned int i=0 ; i < sizeof(msg.ranges)/sizeof(msg.ranges[0]); i = i + 1){
		if (!std::isinf(msg.ranges[i]) || !std::isnan(msg.ranges[i])){
			if (std::isnan(scan.closest_distance) || msg.ranges[i]<scan.closest_distance){
				scan.closest_distance = msg.ranges[i];
			}
			if (std::isnan(scan.farthest_distance) || msg.ranges[i]>scan.farthest_distance){
				scan.farthest_distance = msg.ranges[i];
			}
		}
    }    
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "lidar_sub");

    ros::NodeHandle n;
    
	ros::Subscriber sub = n.subscribe("scan",100, scanCallback);
	//ROS_INFO("Closest point: "+std::to_string(mind.distance));
	//ROS_INFO("Furthest point: "+std::to_string(maxd.distance));
	ros::Publisher pub = n.advertise<wesley_yee_ws::scan_range>("/scan_range",100);
	
	ros::Rate loop_rate(10); 
	
    while (ros::ok()){
    	pub.publish(scan);
    	
    	ros::spinOnce();
    }
    
    ros::spin();
        
    return 0;
}
