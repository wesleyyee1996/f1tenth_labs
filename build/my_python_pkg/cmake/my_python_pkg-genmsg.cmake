# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "my_python_pkg: 1 messages, 1 services")

set(MSG_I_FLAGS "-Imy_python_pkg:/home/meam520/catkin_ws/src/my_python_pkg/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(my_python_pkg_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/meam520/catkin_ws/src/my_python_pkg/msg/Num.msg" NAME_WE)
add_custom_target(_my_python_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "my_python_pkg" "/home/meam520/catkin_ws/src/my_python_pkg/msg/Num.msg" ""
)

get_filename_component(_filename "/home/meam520/catkin_ws/src/my_python_pkg/srv/AddTwoInts.srv" NAME_WE)
add_custom_target(_my_python_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "my_python_pkg" "/home/meam520/catkin_ws/src/my_python_pkg/srv/AddTwoInts.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(my_python_pkg
  "/home/meam520/catkin_ws/src/my_python_pkg/msg/Num.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/my_python_pkg
)

### Generating Services
_generate_srv_cpp(my_python_pkg
  "/home/meam520/catkin_ws/src/my_python_pkg/srv/AddTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/my_python_pkg
)

### Generating Module File
_generate_module_cpp(my_python_pkg
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/my_python_pkg
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(my_python_pkg_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(my_python_pkg_generate_messages my_python_pkg_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/meam520/catkin_ws/src/my_python_pkg/msg/Num.msg" NAME_WE)
add_dependencies(my_python_pkg_generate_messages_cpp _my_python_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/meam520/catkin_ws/src/my_python_pkg/srv/AddTwoInts.srv" NAME_WE)
add_dependencies(my_python_pkg_generate_messages_cpp _my_python_pkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(my_python_pkg_gencpp)
add_dependencies(my_python_pkg_gencpp my_python_pkg_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS my_python_pkg_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(my_python_pkg
  "/home/meam520/catkin_ws/src/my_python_pkg/msg/Num.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/my_python_pkg
)

### Generating Services
_generate_srv_eus(my_python_pkg
  "/home/meam520/catkin_ws/src/my_python_pkg/srv/AddTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/my_python_pkg
)

### Generating Module File
_generate_module_eus(my_python_pkg
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/my_python_pkg
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(my_python_pkg_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(my_python_pkg_generate_messages my_python_pkg_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/meam520/catkin_ws/src/my_python_pkg/msg/Num.msg" NAME_WE)
add_dependencies(my_python_pkg_generate_messages_eus _my_python_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/meam520/catkin_ws/src/my_python_pkg/srv/AddTwoInts.srv" NAME_WE)
add_dependencies(my_python_pkg_generate_messages_eus _my_python_pkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(my_python_pkg_geneus)
add_dependencies(my_python_pkg_geneus my_python_pkg_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS my_python_pkg_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(my_python_pkg
  "/home/meam520/catkin_ws/src/my_python_pkg/msg/Num.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/my_python_pkg
)

### Generating Services
_generate_srv_lisp(my_python_pkg
  "/home/meam520/catkin_ws/src/my_python_pkg/srv/AddTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/my_python_pkg
)

### Generating Module File
_generate_module_lisp(my_python_pkg
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/my_python_pkg
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(my_python_pkg_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(my_python_pkg_generate_messages my_python_pkg_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/meam520/catkin_ws/src/my_python_pkg/msg/Num.msg" NAME_WE)
add_dependencies(my_python_pkg_generate_messages_lisp _my_python_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/meam520/catkin_ws/src/my_python_pkg/srv/AddTwoInts.srv" NAME_WE)
add_dependencies(my_python_pkg_generate_messages_lisp _my_python_pkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(my_python_pkg_genlisp)
add_dependencies(my_python_pkg_genlisp my_python_pkg_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS my_python_pkg_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(my_python_pkg
  "/home/meam520/catkin_ws/src/my_python_pkg/msg/Num.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/my_python_pkg
)

### Generating Services
_generate_srv_nodejs(my_python_pkg
  "/home/meam520/catkin_ws/src/my_python_pkg/srv/AddTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/my_python_pkg
)

### Generating Module File
_generate_module_nodejs(my_python_pkg
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/my_python_pkg
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(my_python_pkg_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(my_python_pkg_generate_messages my_python_pkg_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/meam520/catkin_ws/src/my_python_pkg/msg/Num.msg" NAME_WE)
add_dependencies(my_python_pkg_generate_messages_nodejs _my_python_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/meam520/catkin_ws/src/my_python_pkg/srv/AddTwoInts.srv" NAME_WE)
add_dependencies(my_python_pkg_generate_messages_nodejs _my_python_pkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(my_python_pkg_gennodejs)
add_dependencies(my_python_pkg_gennodejs my_python_pkg_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS my_python_pkg_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(my_python_pkg
  "/home/meam520/catkin_ws/src/my_python_pkg/msg/Num.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/my_python_pkg
)

### Generating Services
_generate_srv_py(my_python_pkg
  "/home/meam520/catkin_ws/src/my_python_pkg/srv/AddTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/my_python_pkg
)

### Generating Module File
_generate_module_py(my_python_pkg
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/my_python_pkg
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(my_python_pkg_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(my_python_pkg_generate_messages my_python_pkg_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/meam520/catkin_ws/src/my_python_pkg/msg/Num.msg" NAME_WE)
add_dependencies(my_python_pkg_generate_messages_py _my_python_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/meam520/catkin_ws/src/my_python_pkg/srv/AddTwoInts.srv" NAME_WE)
add_dependencies(my_python_pkg_generate_messages_py _my_python_pkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(my_python_pkg_genpy)
add_dependencies(my_python_pkg_genpy my_python_pkg_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS my_python_pkg_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/my_python_pkg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/my_python_pkg
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(my_python_pkg_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/my_python_pkg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/my_python_pkg
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(my_python_pkg_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/my_python_pkg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/my_python_pkg
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(my_python_pkg_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/my_python_pkg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/my_python_pkg
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(my_python_pkg_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/my_python_pkg)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/my_python_pkg\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/my_python_pkg
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(my_python_pkg_generate_messages_py std_msgs_generate_messages_py)
endif()
