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
    	
    	double rad_per_step = 6.28319/720;
    	
    	for (unsigned int i=269; i < 450; i = i+1){
    		if (!std::isinf(scan_msg->ranges[i]) || !std::isnan(scan_msg->ranges[i])){
    			
    			double ttc = std::max(scan_msg->ranges[i]*cos(abs(static_cast<int>(359-i))*rad_per_step)/speed,static_cast<double>(0));
    			
    			ROS_INFO("Time to collision: [%f]",ttc);
    		}
    		
    	}
    	
        // TODO: publish drive/brake message
    }

};
int main(int argc, char ** argv) {
    ros::init(argc, argv, "safety_node");
    Safety sn;
    ros::spin();
    return 0;
}