;; Auto-generated. Do not edit!


(when (boundp 'wesley_yee_ws::scan_range)
  (if (not (find-package "WESLEY_YEE_WS"))
    (make-package "WESLEY_YEE_WS"))
  (shadow 'scan_range (find-package "WESLEY_YEE_WS")))
(unless (find-package "WESLEY_YEE_WS::SCAN_RANGE")
  (make-package "WESLEY_YEE_WS::SCAN_RANGE"))

(in-package "ROS")
;;//! \htmlinclude scan_range.msg.html


(defclass wesley_yee_ws::scan_range
  :super ros::object
  :slots (_farthest_distance _closest_distance ))

(defmethod wesley_yee_ws::scan_range
  (:init
   (&key
    ((:farthest_distance __farthest_distance) 0.0)
    ((:closest_distance __closest_distance) 0.0)
    )
   (send-super :init)
   (setq _farthest_distance (float __farthest_distance))
   (setq _closest_distance (float __closest_distance))
   self)
  (:farthest_distance
   (&optional __farthest_distance)
   (if __farthest_distance (setq _farthest_distance __farthest_distance)) _farthest_distance)
  (:closest_distance
   (&optional __closest_distance)
   (if __closest_distance (setq _closest_distance __closest_distance)) _closest_distance)
  (:serialization-length
   ()
   (+
    ;; float32 _farthest_distance
    4
    ;; float32 _closest_distance
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _farthest_distance
       (sys::poke _farthest_distance (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _closest_distance
       (sys::poke _closest_distance (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _farthest_distance
     (setq _farthest_distance (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _closest_distance
     (setq _closest_distance (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get wesley_yee_ws::scan_range :md5sum-) "52cfcfd2a0bc23fbbffa6ecb4b63c13e")
(setf (get wesley_yee_ws::scan_range :datatype-) "wesley_yee_ws/scan_range")
(setf (get wesley_yee_ws::scan_range :definition-)
      "float32 farthest_distance
float32 closest_distance

")



(provide :wesley_yee_ws/scan_range "52cfcfd2a0bc23fbbffa6ecb4b63c13e")


