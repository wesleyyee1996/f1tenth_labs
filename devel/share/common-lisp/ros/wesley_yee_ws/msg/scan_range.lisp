; Auto-generated. Do not edit!


(cl:in-package wesley_yee_ws-msg)


;//! \htmlinclude scan_range.msg.html

(cl:defclass <scan_range> (roslisp-msg-protocol:ros-message)
  ((farthest_distance
    :reader farthest_distance
    :initarg :farthest_distance
    :type cl:float
    :initform 0.0)
   (closest_distance
    :reader closest_distance
    :initarg :closest_distance
    :type cl:float
    :initform 0.0))
)

(cl:defclass scan_range (<scan_range>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <scan_range>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'scan_range)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name wesley_yee_ws-msg:<scan_range> is deprecated: use wesley_yee_ws-msg:scan_range instead.")))

(cl:ensure-generic-function 'farthest_distance-val :lambda-list '(m))
(cl:defmethod farthest_distance-val ((m <scan_range>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wesley_yee_ws-msg:farthest_distance-val is deprecated.  Use wesley_yee_ws-msg:farthest_distance instead.")
  (farthest_distance m))

(cl:ensure-generic-function 'closest_distance-val :lambda-list '(m))
(cl:defmethod closest_distance-val ((m <scan_range>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wesley_yee_ws-msg:closest_distance-val is deprecated.  Use wesley_yee_ws-msg:closest_distance instead.")
  (closest_distance m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <scan_range>) ostream)
  "Serializes a message object of type '<scan_range>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'farthest_distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'closest_distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <scan_range>) istream)
  "Deserializes a message object of type '<scan_range>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'farthest_distance) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'closest_distance) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<scan_range>)))
  "Returns string type for a message object of type '<scan_range>"
  "wesley_yee_ws/scan_range")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'scan_range)))
  "Returns string type for a message object of type 'scan_range"
  "wesley_yee_ws/scan_range")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<scan_range>)))
  "Returns md5sum for a message object of type '<scan_range>"
  "52cfcfd2a0bc23fbbffa6ecb4b63c13e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'scan_range)))
  "Returns md5sum for a message object of type 'scan_range"
  "52cfcfd2a0bc23fbbffa6ecb4b63c13e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<scan_range>)))
  "Returns full string definition for message of type '<scan_range>"
  (cl:format cl:nil "float32 farthest_distance~%float32 closest_distance~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'scan_range)))
  "Returns full string definition for message of type 'scan_range"
  (cl:format cl:nil "float32 farthest_distance~%float32 closest_distance~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <scan_range>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <scan_range>))
  "Converts a ROS message object to a list"
  (cl:list 'scan_range
    (cl:cons ':farthest_distance (farthest_distance msg))
    (cl:cons ':closest_distance (closest_distance msg))
))
