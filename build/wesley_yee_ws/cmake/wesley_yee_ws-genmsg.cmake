# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "wesley_yee_ws: 2 messages, 0 services")

set(MSG_I_FLAGS "-Iwesley_yee_ws:/home/meam520/catkin_ws/src/wesley_yee_ws/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(wesley_yee_ws_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/meam520/catkin_ws/src/wesley_yee_ws/msg/scan_range.msg" NAME_WE)
add_custom_target(_wesley_yee_ws_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wesley_yee_ws" "/home/meam520/catkin_ws/src/wesley_yee_ws/msg/scan_range.msg" ""
)

get_filename_component(_filename "/home/meam520/catkin_ws/src/wesley_yee_ws/msg/Num.msg" NAME_WE)
add_custom_target(_wesley_yee_ws_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wesley_yee_ws" "/home/meam520/catkin_ws/src/wesley_yee_ws/msg/Num.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(wesley_yee_ws
  "/home/meam520/catkin_ws/src/wesley_yee_ws/msg/scan_range.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wesley_yee_ws
)
_generate_msg_cpp(wesley_yee_ws
  "/home/meam520/catkin_ws/src/wesley_yee_ws/msg/Num.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wesley_yee_ws
)

### Generating Services

### Generating Module File
_generate_module_cpp(wesley_yee_ws
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wesley_yee_ws
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(wesley_yee_ws_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(wesley_yee_ws_generate_messages wesley_yee_ws_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/meam520/catkin_ws/src/wesley_yee_ws/msg/scan_range.msg" NAME_WE)
add_dependencies(wesley_yee_ws_generate_messages_cpp _wesley_yee_ws_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/meam520/catkin_ws/src/wesley_yee_ws/msg/Num.msg" NAME_WE)
add_dependencies(wesley_yee_ws_generate_messages_cpp _wesley_yee_ws_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(wesley_yee_ws_gencpp)
add_dependencies(wesley_yee_ws_gencpp wesley_yee_ws_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS wesley_yee_ws_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(wesley_yee_ws
  "/home/meam520/catkin_ws/src/wesley_yee_ws/msg/scan_range.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wesley_yee_ws
)
_generate_msg_eus(wesley_yee_ws
  "/home/meam520/catkin_ws/src/wesley_yee_ws/msg/Num.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wesley_yee_ws
)

### Generating Services

### Generating Module File
_generate_module_eus(wesley_yee_ws
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wesley_yee_ws
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(wesley_yee_ws_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(wesley_yee_ws_generate_messages wesley_yee_ws_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/meam520/catkin_ws/src/wesley_yee_ws/msg/scan_range.msg" NAME_WE)
add_dependencies(wesley_yee_ws_generate_messages_eus _wesley_yee_ws_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/meam520/catkin_ws/src/wesley_yee_ws/msg/Num.msg" NAME_WE)
add_dependencies(wesley_yee_ws_generate_messages_eus _wesley_yee_ws_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(wesley_yee_ws_geneus)
add_dependencies(wesley_yee_ws_geneus wesley_yee_ws_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS wesley_yee_ws_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(wesley_yee_ws
  "/home/meam520/catkin_ws/src/wesley_yee_ws/msg/scan_range.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wesley_yee_ws
)
_generate_msg_lisp(wesley_yee_ws
  "/home/meam520/catkin_ws/src/wesley_yee_ws/msg/Num.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wesley_yee_ws
)

### Generating Services

### Generating Module File
_generate_module_lisp(wesley_yee_ws
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wesley_yee_ws
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(wesley_yee_ws_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(wesley_yee_ws_generate_messages wesley_yee_ws_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/meam520/catkin_ws/src/wesley_yee_ws/msg/scan_range.msg" NAME_WE)
add_dependencies(wesley_yee_ws_generate_messages_lisp _wesley_yee_ws_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/meam520/catkin_ws/src/wesley_yee_ws/msg/Num.msg" NAME_WE)
add_dependencies(wesley_yee_ws_generate_messages_lisp _wesley_yee_ws_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(wesley_yee_ws_genlisp)
add_dependencies(wesley_yee_ws_genlisp wesley_yee_ws_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS wesley_yee_ws_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(wesley_yee_ws
  "/home/meam520/catkin_ws/src/wesley_yee_ws/msg/scan_range.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/wesley_yee_ws
)
_generate_msg_nodejs(wesley_yee_ws
  "/home/meam520/catkin_ws/src/wesley_yee_ws/msg/Num.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/wesley_yee_ws
)

### Generating Services

### Generating Module File
_generate_module_nodejs(wesley_yee_ws
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/wesley_yee_ws
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(wesley_yee_ws_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(wesley_yee_ws_generate_messages wesley_yee_ws_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/meam520/catkin_ws/src/wesley_yee_ws/msg/scan_range.msg" NAME_WE)
add_dependencies(wesley_yee_ws_generate_messages_nodejs _wesley_yee_ws_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/meam520/catkin_ws/src/wesley_yee_ws/msg/Num.msg" NAME_WE)
add_dependencies(wesley_yee_ws_generate_messages_nodejs _wesley_yee_ws_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(wesley_yee_ws_gennodejs)
add_dependencies(wesley_yee_ws_gennodejs wesley_yee_ws_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS wesley_yee_ws_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(wesley_yee_ws
  "/home/meam520/catkin_ws/src/wesley_yee_ws/msg/scan_range.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wesley_yee_ws
)
_generate_msg_py(wesley_yee_ws
  "/home/meam520/catkin_ws/src/wesley_yee_ws/msg/Num.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wesley_yee_ws
)

### Generating Services

### Generating Module File
_generate_module_py(wesley_yee_ws
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wesley_yee_ws
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(wesley_yee_ws_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(wesley_yee_ws_generate_messages wesley_yee_ws_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/meam520/catkin_ws/src/wesley_yee_ws/msg/scan_range.msg" NAME_WE)
add_dependencies(wesley_yee_ws_generate_messages_py _wesley_yee_ws_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/meam520/catkin_ws/src/wesley_yee_ws/msg/Num.msg" NAME_WE)
add_dependencies(wesley_yee_ws_generate_messages_py _wesley_yee_ws_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(wesley_yee_ws_genpy)
add_dependencies(wesley_yee_ws_genpy wesley_yee_ws_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS wesley_yee_ws_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wesley_yee_ws)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wesley_yee_ws
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(wesley_yee_ws_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wesley_yee_ws)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wesley_yee_ws
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(wesley_yee_ws_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wesley_yee_ws)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wesley_yee_ws
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(wesley_yee_ws_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/wesley_yee_ws)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/wesley_yee_ws
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(wesley_yee_ws_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wesley_yee_ws)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2.7\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wesley_yee_ws\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wesley_yee_ws
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(wesley_yee_ws_generate_messages_py std_msgs_generate_messages_py)
endif()
