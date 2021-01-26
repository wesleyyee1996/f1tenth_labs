#include <ros/ros.h>
#include <nav_msgs/Odometry.h>
#include <sensor_msgs/LaserScan.h>
#include <ackermann_msgs/AckermannDriveStamped.h>
#include <std_msgs/Bool.h>
#include <cmath>

// TODO: include ROS msg type headers and libraries

class Safety {
// The class that handles emergency braking
private:
    ros::NodeHandle n;
    double speed;
    ros::Subscriber scan_sub;
    ros::Subscriber odom_sub;
    ros::Publisher brake_pub;
    ros::Publisher bool_pub;
    ackermann_msgs::AckermannDriveStamped drive_stamp;
    std_msgs::Bool bool_brake;
    // TODO: create ROS subscribers and publishers

public:
    Safety() {
        n = ros::NodeHandle();
        speed = 0.0;
        /*
        One publisher should publish to the /brake topic with an
        ackermann_msgs/AckermannDriveStamped brake message.
        One publisher should publish to the /brake_bool topic with a
        std_msgs/Bool message.
        You should also subscribe to the /scan topic to get the
        sensor_msgs/LaserScan messages and the /odom topic to get
        the nav_msgs/Odometry messages
        The subscribers should use the provided odom_callback and 
        scan_callback as callback methods
        NOTE that the x component of the linear velocity in odom is the speed
        */

        // TODO: create ROS subscribers and publishers]
        brake_pub = n.advertise<ackermann_msgs::AckermannDriveStamped>("/brake", 10);
        bool_pub = n.advertise<std_msgs::Bool>("/brake_bool", 10);
        odom_sub = n.subscribe("odom", 10, &Safety::odom_callback, this);
        scan_sub = n.subscribe("scan", 10, &Safety::scan_callback, this);
        
    }
    void odom_callback(const nav_msgs::Odometry::ConstPtr &odom_msg) {
        // TODO: update current speed
        
        double x_vel = odom_msg->twist.twist.linear.x;
        double y_vel = odom_msg->twist.twist.linear.y;
        
        speed = sqrt((x_vel*x_vel)+(y_vel*y_vel));
    }

    void scan_callback(const sensor_msgs::LaserScan::ConstPtr &scan_msg) {
        // TODO: calculate TTC
    	calculate_TTC(scan_msg, 0, 200, 0.3f);
    	calculate_TTC(scan_msg, 400, 600, 0.3f);
    	calculate_TTC(scan_msg, 879, 1079, 0.3f);
    }
    
    void calculate_TTC(const sensor_msgs::LaserScan::ConstPtr &scan_msg, int start, int end, float threshold) {
    	
    	for (unsigned int i=start; i < end; i++){
			if (!std::isinf(scan_msg->ranges[i]) || !std::isnan(scan_msg->ranges[i])){
							
				double rad_per_step = 6.28319/1080;
				//double angle = abs(static_cast<int>(359-i))*rad_per_step;
				double angle = abs(static_cast<int>(i))*rad_per_step;
				
				if (speed > 0){
					//double ttc = std::max((scan_msg->ranges[i]*cos(angle)*rad_per_step)/speed,static_cast<double>(0));
					double ttc = std::max(scan_msg->ranges[i]/speed,static_cast<double>(0));
					
					if (ttc <= threshold){
						ROS_INFO("About to crash! Sending brake message! TTC: [%f], Angle: [%f], Distance: [%f]",ttc,angle*57.2958,scan_msg->ranges[i]);
						drive_stamp.drive.speed = double(0);
						bool_brake.data = true;
						brake_pub.publish(drive_stamp);
						bool_pub.publish(bool_brake);
					}
				}
			}
    	}
    }    

};
int main(int argc, char ** argv) {
    ros::init(argc, argv, "safety_node");
    Safety sn;
    ros::spin();
    return 0;
}