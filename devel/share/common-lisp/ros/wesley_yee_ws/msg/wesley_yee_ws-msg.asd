
(cl:in-package :asdf)

(defsystem "wesley_yee_ws-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Num" :depends-on ("_package_Num"))
    (:file "_package_Num" :depends-on ("_package"))
    (:file "scan_range" :depends-on ("_package_scan_range"))
    (:file "_package_scan_range" :depends-on ("_package"))
  ))