# Install script for directory: /home/robotics/ros2_cobot/src/mycobot_ros2/mecharm/mecharm_interfaces

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/robotics/ros2_cobot/install/mecharm_interfaces")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ament_index/resource_index/rosidl_interfaces" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/ament_cmake_index/share/ament_index/resource_index/rosidl_interfaces/mecharm_interfaces")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/mecharm_interfaces/mecharm_interfaces" TYPE DIRECTORY FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/rosidl_generator_c/mecharm_interfaces/" REGEX "/[^/]*\\.h$")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/environment" TYPE FILE FILES "/opt/ros/humble/lib/python3.10/site-packages/ament_package/template/environment_hook/library_path.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/environment" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/ament_cmake_environment_hooks/library_path.dsv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_generator_c.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_generator_c.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_generator_c.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/libmecharm_interfaces__rosidl_generator_c.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_generator_c.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_generator_c.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_generator_c.so"
         OLD_RPATH "/opt/ros/humble/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_generator_c.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/mecharm_interfaces/mecharm_interfaces" TYPE DIRECTORY FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/rosidl_typesupport_fastrtps_c/mecharm_interfaces/" REGEX "/[^/]*\\.cpp$" EXCLUDE)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_typesupport_fastrtps_c.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_typesupport_fastrtps_c.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_typesupport_fastrtps_c.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/libmecharm_interfaces__rosidl_typesupport_fastrtps_c.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_typesupport_fastrtps_c.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_typesupport_fastrtps_c.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_typesupport_fastrtps_c.so"
         OLD_RPATH "/home/robotics/ros2_cobot/build/mecharm_interfaces:/opt/ros/humble/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_typesupport_fastrtps_c.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/mecharm_interfaces/mecharm_interfaces" TYPE DIRECTORY FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/rosidl_typesupport_introspection_c/mecharm_interfaces/" REGEX "/[^/]*\\.h$")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_typesupport_introspection_c.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_typesupport_introspection_c.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_typesupport_introspection_c.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/libmecharm_interfaces__rosidl_typesupport_introspection_c.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_typesupport_introspection_c.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_typesupport_introspection_c.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_typesupport_introspection_c.so"
         OLD_RPATH "/home/robotics/ros2_cobot/build/mecharm_interfaces:/opt/ros/humble/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_typesupport_introspection_c.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_typesupport_c.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_typesupport_c.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_typesupport_c.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/libmecharm_interfaces__rosidl_typesupport_c.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_typesupport_c.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_typesupport_c.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_typesupport_c.so"
         OLD_RPATH "/home/robotics/ros2_cobot/build/mecharm_interfaces:/opt/ros/humble/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_typesupport_c.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/mecharm_interfaces/mecharm_interfaces" TYPE DIRECTORY FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/rosidl_generator_cpp/mecharm_interfaces/" REGEX "/[^/]*\\.hpp$")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/mecharm_interfaces/mecharm_interfaces" TYPE DIRECTORY FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/rosidl_typesupport_fastrtps_cpp/mecharm_interfaces/" REGEX "/[^/]*\\.cpp$" EXCLUDE)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_typesupport_fastrtps_cpp.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_typesupport_fastrtps_cpp.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_typesupport_fastrtps_cpp.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/libmecharm_interfaces__rosidl_typesupport_fastrtps_cpp.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_typesupport_fastrtps_cpp.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_typesupport_fastrtps_cpp.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_typesupport_fastrtps_cpp.so"
         OLD_RPATH "/opt/ros/humble/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_typesupport_fastrtps_cpp.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/mecharm_interfaces/mecharm_interfaces" TYPE DIRECTORY FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/rosidl_typesupport_introspection_cpp/mecharm_interfaces/" REGEX "/[^/]*\\.hpp$")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_typesupport_introspection_cpp.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_typesupport_introspection_cpp.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_typesupport_introspection_cpp.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/libmecharm_interfaces__rosidl_typesupport_introspection_cpp.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_typesupport_introspection_cpp.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_typesupport_introspection_cpp.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_typesupport_introspection_cpp.so"
         OLD_RPATH "/opt/ros/humble/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_typesupport_introspection_cpp.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_typesupport_cpp.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_typesupport_cpp.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_typesupport_cpp.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/libmecharm_interfaces__rosidl_typesupport_cpp.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_typesupport_cpp.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_typesupport_cpp.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_typesupport_cpp.so"
         OLD_RPATH "/opt/ros/humble/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_typesupport_cpp.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/environment" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/ament_cmake_environment_hooks/pythonpath.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/environment" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/ament_cmake_environment_hooks/pythonpath.dsv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/local/lib/python3.10/dist-packages/mecharm_interfaces-0.0.0-py3.10.egg-info" TYPE DIRECTORY FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/ament_cmake_python/mecharm_interfaces/mecharm_interfaces.egg-info/")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/local/lib/python3.10/dist-packages/mecharm_interfaces" TYPE DIRECTORY FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/rosidl_generator_py/mecharm_interfaces/" REGEX "/[^/]*\\.pyc$" EXCLUDE REGEX "/\\_\\_pycache\\_\\_$" EXCLUDE)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(
        COMMAND
        "/usr/bin/python3" "-m" "compileall"
        "/home/robotics/ros2_cobot/install/mecharm_interfaces/local/lib/python3.10/dist-packages/mecharm_interfaces"
      )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/local/lib/python3.10/dist-packages/mecharm_interfaces/mecharm_interfaces_s__rosidl_typesupport_fastrtps_c.cpython-310-x86_64-linux-gnu.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/local/lib/python3.10/dist-packages/mecharm_interfaces/mecharm_interfaces_s__rosidl_typesupport_fastrtps_c.cpython-310-x86_64-linux-gnu.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/local/lib/python3.10/dist-packages/mecharm_interfaces/mecharm_interfaces_s__rosidl_typesupport_fastrtps_c.cpython-310-x86_64-linux-gnu.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/local/lib/python3.10/dist-packages/mecharm_interfaces" TYPE SHARED_LIBRARY FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/rosidl_generator_py/mecharm_interfaces/mecharm_interfaces_s__rosidl_typesupport_fastrtps_c.cpython-310-x86_64-linux-gnu.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/local/lib/python3.10/dist-packages/mecharm_interfaces/mecharm_interfaces_s__rosidl_typesupport_fastrtps_c.cpython-310-x86_64-linux-gnu.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/local/lib/python3.10/dist-packages/mecharm_interfaces/mecharm_interfaces_s__rosidl_typesupport_fastrtps_c.cpython-310-x86_64-linux-gnu.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/local/lib/python3.10/dist-packages/mecharm_interfaces/mecharm_interfaces_s__rosidl_typesupport_fastrtps_c.cpython-310-x86_64-linux-gnu.so"
         OLD_RPATH "/home/robotics/ros2_cobot/build/mecharm_interfaces/rosidl_generator_py/mecharm_interfaces:/home/robotics/ros2_cobot/build/mecharm_interfaces:/opt/ros/humble/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/local/lib/python3.10/dist-packages/mecharm_interfaces/mecharm_interfaces_s__rosidl_typesupport_fastrtps_c.cpython-310-x86_64-linux-gnu.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/local/lib/python3.10/dist-packages/mecharm_interfaces/mecharm_interfaces_s__rosidl_typesupport_introspection_c.cpython-310-x86_64-linux-gnu.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/local/lib/python3.10/dist-packages/mecharm_interfaces/mecharm_interfaces_s__rosidl_typesupport_introspection_c.cpython-310-x86_64-linux-gnu.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/local/lib/python3.10/dist-packages/mecharm_interfaces/mecharm_interfaces_s__rosidl_typesupport_introspection_c.cpython-310-x86_64-linux-gnu.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/local/lib/python3.10/dist-packages/mecharm_interfaces" TYPE SHARED_LIBRARY FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/rosidl_generator_py/mecharm_interfaces/mecharm_interfaces_s__rosidl_typesupport_introspection_c.cpython-310-x86_64-linux-gnu.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/local/lib/python3.10/dist-packages/mecharm_interfaces/mecharm_interfaces_s__rosidl_typesupport_introspection_c.cpython-310-x86_64-linux-gnu.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/local/lib/python3.10/dist-packages/mecharm_interfaces/mecharm_interfaces_s__rosidl_typesupport_introspection_c.cpython-310-x86_64-linux-gnu.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/local/lib/python3.10/dist-packages/mecharm_interfaces/mecharm_interfaces_s__rosidl_typesupport_introspection_c.cpython-310-x86_64-linux-gnu.so"
         OLD_RPATH "/home/robotics/ros2_cobot/build/mecharm_interfaces/rosidl_generator_py/mecharm_interfaces:/home/robotics/ros2_cobot/build/mecharm_interfaces:/opt/ros/humble/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/local/lib/python3.10/dist-packages/mecharm_interfaces/mecharm_interfaces_s__rosidl_typesupport_introspection_c.cpython-310-x86_64-linux-gnu.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/local/lib/python3.10/dist-packages/mecharm_interfaces/mecharm_interfaces_s__rosidl_typesupport_c.cpython-310-x86_64-linux-gnu.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/local/lib/python3.10/dist-packages/mecharm_interfaces/mecharm_interfaces_s__rosidl_typesupport_c.cpython-310-x86_64-linux-gnu.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/local/lib/python3.10/dist-packages/mecharm_interfaces/mecharm_interfaces_s__rosidl_typesupport_c.cpython-310-x86_64-linux-gnu.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/local/lib/python3.10/dist-packages/mecharm_interfaces" TYPE SHARED_LIBRARY FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/rosidl_generator_py/mecharm_interfaces/mecharm_interfaces_s__rosidl_typesupport_c.cpython-310-x86_64-linux-gnu.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/local/lib/python3.10/dist-packages/mecharm_interfaces/mecharm_interfaces_s__rosidl_typesupport_c.cpython-310-x86_64-linux-gnu.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/local/lib/python3.10/dist-packages/mecharm_interfaces/mecharm_interfaces_s__rosidl_typesupport_c.cpython-310-x86_64-linux-gnu.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/local/lib/python3.10/dist-packages/mecharm_interfaces/mecharm_interfaces_s__rosidl_typesupport_c.cpython-310-x86_64-linux-gnu.so"
         OLD_RPATH "/home/robotics/ros2_cobot/build/mecharm_interfaces/rosidl_generator_py/mecharm_interfaces:/home/robotics/ros2_cobot/build/mecharm_interfaces:/opt/ros/humble/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/local/lib/python3.10/dist-packages/mecharm_interfaces/mecharm_interfaces_s__rosidl_typesupport_c.cpython-310-x86_64-linux-gnu.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_generator_py.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_generator_py.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_generator_py.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/rosidl_generator_py/mecharm_interfaces/libmecharm_interfaces__rosidl_generator_py.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_generator_py.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_generator_py.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_generator_py.so"
         OLD_RPATH "/home/robotics/ros2_cobot/build/mecharm_interfaces:/opt/ros/humble/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmecharm_interfaces__rosidl_generator_py.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/msg" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/rosidl_adapter/mecharm_interfaces/msg/MecharmAngles.idl")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/msg" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/rosidl_adapter/mecharm_interfaces/msg/MecharmCoords.idl")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/msg" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/rosidl_adapter/mecharm_interfaces/msg/MecharmSetAngles.idl")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/msg" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/rosidl_adapter/mecharm_interfaces/msg/MecharmSetCoords.idl")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/msg" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/rosidl_adapter/mecharm_interfaces/msg/MecharmGripperStatus.idl")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/msg" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/rosidl_adapter/mecharm_interfaces/msg/MecharmPumpStatus.idl")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/srv" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/rosidl_adapter/mecharm_interfaces/srv/GetAngles.idl")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/srv" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/rosidl_adapter/mecharm_interfaces/srv/SetAngles.idl")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/srv" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/rosidl_adapter/mecharm_interfaces/srv/GetCoords.idl")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/srv" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/rosidl_adapter/mecharm_interfaces/srv/SetCoords.idl")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/srv" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/rosidl_adapter/mecharm_interfaces/srv/GripperStatus.idl")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/srv" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/rosidl_adapter/mecharm_interfaces/srv/PumpStatus.idl")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/msg" TYPE FILE FILES "/home/robotics/ros2_cobot/src/mycobot_ros2/mecharm/mecharm_interfaces/msg/MecharmAngles.msg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/msg" TYPE FILE FILES "/home/robotics/ros2_cobot/src/mycobot_ros2/mecharm/mecharm_interfaces/msg/MecharmCoords.msg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/msg" TYPE FILE FILES "/home/robotics/ros2_cobot/src/mycobot_ros2/mecharm/mecharm_interfaces/msg/MecharmSetAngles.msg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/msg" TYPE FILE FILES "/home/robotics/ros2_cobot/src/mycobot_ros2/mecharm/mecharm_interfaces/msg/MecharmSetCoords.msg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/msg" TYPE FILE FILES "/home/robotics/ros2_cobot/src/mycobot_ros2/mecharm/mecharm_interfaces/msg/MecharmGripperStatus.msg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/msg" TYPE FILE FILES "/home/robotics/ros2_cobot/src/mycobot_ros2/mecharm/mecharm_interfaces/msg/MecharmPumpStatus.msg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/srv" TYPE FILE FILES "/home/robotics/ros2_cobot/src/mycobot_ros2/mecharm/mecharm_interfaces/srv/GetAngles.srv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/srv" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/rosidl_cmake/srv/GetAngles_Request.msg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/srv" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/rosidl_cmake/srv/GetAngles_Response.msg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/srv" TYPE FILE FILES "/home/robotics/ros2_cobot/src/mycobot_ros2/mecharm/mecharm_interfaces/srv/SetAngles.srv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/srv" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/rosidl_cmake/srv/SetAngles_Request.msg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/srv" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/rosidl_cmake/srv/SetAngles_Response.msg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/srv" TYPE FILE FILES "/home/robotics/ros2_cobot/src/mycobot_ros2/mecharm/mecharm_interfaces/srv/GetCoords.srv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/srv" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/rosidl_cmake/srv/GetCoords_Request.msg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/srv" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/rosidl_cmake/srv/GetCoords_Response.msg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/srv" TYPE FILE FILES "/home/robotics/ros2_cobot/src/mycobot_ros2/mecharm/mecharm_interfaces/srv/SetCoords.srv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/srv" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/rosidl_cmake/srv/SetCoords_Request.msg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/srv" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/rosidl_cmake/srv/SetCoords_Response.msg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/srv" TYPE FILE FILES "/home/robotics/ros2_cobot/src/mycobot_ros2/mecharm/mecharm_interfaces/srv/GripperStatus.srv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/srv" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/rosidl_cmake/srv/GripperStatus_Request.msg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/srv" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/rosidl_cmake/srv/GripperStatus_Response.msg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/srv" TYPE FILE FILES "/home/robotics/ros2_cobot/src/mycobot_ros2/mecharm/mecharm_interfaces/srv/PumpStatus.srv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/srv" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/rosidl_cmake/srv/PumpStatus_Request.msg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/srv" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/rosidl_cmake/srv/PumpStatus_Response.msg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ament_index/resource_index/package_run_dependencies" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/ament_cmake_index/share/ament_index/resource_index/package_run_dependencies/mecharm_interfaces")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ament_index/resource_index/parent_prefix_path" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/ament_cmake_index/share/ament_index/resource_index/parent_prefix_path/mecharm_interfaces")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/environment" TYPE FILE FILES "/opt/ros/humble/share/ament_cmake_core/cmake/environment_hooks/environment/ament_prefix_path.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/environment" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/ament_cmake_environment_hooks/ament_prefix_path.dsv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/environment" TYPE FILE FILES "/opt/ros/humble/share/ament_cmake_core/cmake/environment_hooks/environment/path.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/environment" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/ament_cmake_environment_hooks/path.dsv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/ament_cmake_environment_hooks/local_setup.bash")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/ament_cmake_environment_hooks/local_setup.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/ament_cmake_environment_hooks/local_setup.zsh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/ament_cmake_environment_hooks/local_setup.dsv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/ament_cmake_environment_hooks/package.dsv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ament_index/resource_index/packages" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/ament_cmake_index/share/ament_index/resource_index/packages/mecharm_interfaces")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake/export_mecharm_interfaces__rosidl_generator_cExport.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake/export_mecharm_interfaces__rosidl_generator_cExport.cmake"
         "/home/robotics/ros2_cobot/build/mecharm_interfaces/CMakeFiles/Export/share/mecharm_interfaces/cmake/export_mecharm_interfaces__rosidl_generator_cExport.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake/export_mecharm_interfaces__rosidl_generator_cExport-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake/export_mecharm_interfaces__rosidl_generator_cExport.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/CMakeFiles/Export/share/mecharm_interfaces/cmake/export_mecharm_interfaces__rosidl_generator_cExport.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/CMakeFiles/Export/share/mecharm_interfaces/cmake/export_mecharm_interfaces__rosidl_generator_cExport-noconfig.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake/export_mecharm_interfaces__rosidl_typesupport_fastrtps_cExport.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake/export_mecharm_interfaces__rosidl_typesupport_fastrtps_cExport.cmake"
         "/home/robotics/ros2_cobot/build/mecharm_interfaces/CMakeFiles/Export/share/mecharm_interfaces/cmake/export_mecharm_interfaces__rosidl_typesupport_fastrtps_cExport.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake/export_mecharm_interfaces__rosidl_typesupport_fastrtps_cExport-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake/export_mecharm_interfaces__rosidl_typesupport_fastrtps_cExport.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/CMakeFiles/Export/share/mecharm_interfaces/cmake/export_mecharm_interfaces__rosidl_typesupport_fastrtps_cExport.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/CMakeFiles/Export/share/mecharm_interfaces/cmake/export_mecharm_interfaces__rosidl_typesupport_fastrtps_cExport-noconfig.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake/mecharm_interfaces__rosidl_typesupport_introspection_cExport.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake/mecharm_interfaces__rosidl_typesupport_introspection_cExport.cmake"
         "/home/robotics/ros2_cobot/build/mecharm_interfaces/CMakeFiles/Export/share/mecharm_interfaces/cmake/mecharm_interfaces__rosidl_typesupport_introspection_cExport.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake/mecharm_interfaces__rosidl_typesupport_introspection_cExport-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake/mecharm_interfaces__rosidl_typesupport_introspection_cExport.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/CMakeFiles/Export/share/mecharm_interfaces/cmake/mecharm_interfaces__rosidl_typesupport_introspection_cExport.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/CMakeFiles/Export/share/mecharm_interfaces/cmake/mecharm_interfaces__rosidl_typesupport_introspection_cExport-noconfig.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake/mecharm_interfaces__rosidl_typesupport_cExport.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake/mecharm_interfaces__rosidl_typesupport_cExport.cmake"
         "/home/robotics/ros2_cobot/build/mecharm_interfaces/CMakeFiles/Export/share/mecharm_interfaces/cmake/mecharm_interfaces__rosidl_typesupport_cExport.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake/mecharm_interfaces__rosidl_typesupport_cExport-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake/mecharm_interfaces__rosidl_typesupport_cExport.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/CMakeFiles/Export/share/mecharm_interfaces/cmake/mecharm_interfaces__rosidl_typesupport_cExport.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/CMakeFiles/Export/share/mecharm_interfaces/cmake/mecharm_interfaces__rosidl_typesupport_cExport-noconfig.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake/export_mecharm_interfaces__rosidl_generator_cppExport.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake/export_mecharm_interfaces__rosidl_generator_cppExport.cmake"
         "/home/robotics/ros2_cobot/build/mecharm_interfaces/CMakeFiles/Export/share/mecharm_interfaces/cmake/export_mecharm_interfaces__rosidl_generator_cppExport.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake/export_mecharm_interfaces__rosidl_generator_cppExport-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake/export_mecharm_interfaces__rosidl_generator_cppExport.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/CMakeFiles/Export/share/mecharm_interfaces/cmake/export_mecharm_interfaces__rosidl_generator_cppExport.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake/export_mecharm_interfaces__rosidl_typesupport_fastrtps_cppExport.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake/export_mecharm_interfaces__rosidl_typesupport_fastrtps_cppExport.cmake"
         "/home/robotics/ros2_cobot/build/mecharm_interfaces/CMakeFiles/Export/share/mecharm_interfaces/cmake/export_mecharm_interfaces__rosidl_typesupport_fastrtps_cppExport.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake/export_mecharm_interfaces__rosidl_typesupport_fastrtps_cppExport-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake/export_mecharm_interfaces__rosidl_typesupport_fastrtps_cppExport.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/CMakeFiles/Export/share/mecharm_interfaces/cmake/export_mecharm_interfaces__rosidl_typesupport_fastrtps_cppExport.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/CMakeFiles/Export/share/mecharm_interfaces/cmake/export_mecharm_interfaces__rosidl_typesupport_fastrtps_cppExport-noconfig.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake/mecharm_interfaces__rosidl_typesupport_introspection_cppExport.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake/mecharm_interfaces__rosidl_typesupport_introspection_cppExport.cmake"
         "/home/robotics/ros2_cobot/build/mecharm_interfaces/CMakeFiles/Export/share/mecharm_interfaces/cmake/mecharm_interfaces__rosidl_typesupport_introspection_cppExport.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake/mecharm_interfaces__rosidl_typesupport_introspection_cppExport-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake/mecharm_interfaces__rosidl_typesupport_introspection_cppExport.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/CMakeFiles/Export/share/mecharm_interfaces/cmake/mecharm_interfaces__rosidl_typesupport_introspection_cppExport.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/CMakeFiles/Export/share/mecharm_interfaces/cmake/mecharm_interfaces__rosidl_typesupport_introspection_cppExport-noconfig.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake/mecharm_interfaces__rosidl_typesupport_cppExport.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake/mecharm_interfaces__rosidl_typesupport_cppExport.cmake"
         "/home/robotics/ros2_cobot/build/mecharm_interfaces/CMakeFiles/Export/share/mecharm_interfaces/cmake/mecharm_interfaces__rosidl_typesupport_cppExport.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake/mecharm_interfaces__rosidl_typesupport_cppExport-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake/mecharm_interfaces__rosidl_typesupport_cppExport.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/CMakeFiles/Export/share/mecharm_interfaces/cmake/mecharm_interfaces__rosidl_typesupport_cppExport.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/CMakeFiles/Export/share/mecharm_interfaces/cmake/mecharm_interfaces__rosidl_typesupport_cppExport-noconfig.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake/export_mecharm_interfaces__rosidl_generator_pyExport.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake/export_mecharm_interfaces__rosidl_generator_pyExport.cmake"
         "/home/robotics/ros2_cobot/build/mecharm_interfaces/CMakeFiles/Export/share/mecharm_interfaces/cmake/export_mecharm_interfaces__rosidl_generator_pyExport.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake/export_mecharm_interfaces__rosidl_generator_pyExport-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake/export_mecharm_interfaces__rosidl_generator_pyExport.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/CMakeFiles/Export/share/mecharm_interfaces/cmake/export_mecharm_interfaces__rosidl_generator_pyExport.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/CMakeFiles/Export/share/mecharm_interfaces/cmake/export_mecharm_interfaces__rosidl_generator_pyExport-noconfig.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/rosidl_cmake/rosidl_cmake-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/ament_cmake_export_dependencies/ament_cmake_export_dependencies-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/ament_cmake_export_include_directories/ament_cmake_export_include_directories-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/ament_cmake_export_libraries/ament_cmake_export_libraries-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/ament_cmake_export_targets/ament_cmake_export_targets-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/rosidl_cmake/rosidl_cmake_export_typesupport_targets-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake" TYPE FILE FILES "/home/robotics/ros2_cobot/build/mecharm_interfaces/rosidl_cmake/rosidl_cmake_export_typesupport_libraries-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces/cmake" TYPE FILE FILES
    "/home/robotics/ros2_cobot/build/mecharm_interfaces/ament_cmake_core/mecharm_interfacesConfig.cmake"
    "/home/robotics/ros2_cobot/build/mecharm_interfaces/ament_cmake_core/mecharm_interfacesConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecharm_interfaces" TYPE FILE FILES "/home/robotics/ros2_cobot/src/mycobot_ros2/mecharm/mecharm_interfaces/package.xml")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/robotics/ros2_cobot/build/mecharm_interfaces/mecharm_interfaces__py/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/robotics/ros2_cobot/build/mecharm_interfaces/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
