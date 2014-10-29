##Copyright (c) 2011-2014 Thomas Paviot (tpaviot@gmail.com)
##
##This file is part of pythonOCC.
##
##pythonOCC is free software: you can redistribute it and/or modify
##it under the terms of the GNU General Public License as published by
##the Free Software Foundation, either version 3 of the License, or
##(at your option) any later version.
##
##pythonOCC is distributed in the hope that it will be useful,
##but WITHOUT ANY WARRANTY; without even the implied warranty of
##MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##GNU General Public License for more details.
##
##You should have received a copy of the GNU General Public License
##along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.

# pythonOCC cmake build file
SET(PROJECT_NAME pythonOCC)
PROJECT(${PROJECT_NAME})

# set pythonOCC version
SET(${PROJECT_NAME}_VERSION_MAJOR 0)
SET(${PROJECT_NAME}_VERSION_MINOR 16)
#  Empty for official releases, set to -dev, -rc1, etc for development releases
SET(${PROJECT_NAME}_VERSION_DEVEL -dev)

CMAKE_MINIMUM_REQUIRED(VERSION 2.6)

SET(CMAKE_BUILD_TYPE "MinSizeRel" CACHE STRING "Build type")
MESSAGE(STATUS " ${CMAKE_CXX_FLAGS}") 
SET(BUILD_SHARED_LIBS ON)
INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR})

#############################
# Option_With_Default macro #
#############################
MACRO( OPTION_WITH_DEFAULT OPTION_NAME OPTION_STRING OPTION_DEFAULT )
IF( NOT DEFINED ${OPTION_NAME} )
	SET( ${OPTION_NAME} ${OPTION_DEFAULT} )
ENDIF( NOT DEFINED ${OPTION_NAME} )
	OPTION( ${OPTION_NAME} "${OPTION_STRING}" ${${OPTION_NAME}} )
ENDMACRO( OPTION_WITH_DEFAULT OPTION_NAME OPTION_STRING OPTION_DEFAULT )

##########
# Python #
##########
FIND_PACKAGE(PythonInterp)
FIND_PACKAGE(PythonLibs)
INCLUDE_DIRECTORIES(${PYTHON_INCLUDE_PATH})

##############################################################
# 32/64 bit detection
###############################################################
IF(${CMAKE_SIZEOF_VOID_P} MATCHES "8")
	# If in 64bit mode, we have to define the _OCC64 variable
	ADD_DEFINITIONS(-D_OCC64)
	SET(CMAKE_SWIG_FLAGS ${CMAKE_SWIG_FLAGS} -D_OCC64)
	SET(BIT 64)
ELSE(${CMAKE_SIZEOF_VOID_P} MATCHES "8")
	SET(BIT 32)
ENDIF(${CMAKE_SIZEOF_VOID_P} MATCHES "8")
MESSAGE(STATUS "Build ${BIT}bit")

IF ((NOT MSVC) OR (CMAKE_BUILD_TOOL STREQUAL "nmake"))
	IF( NOT DEFINED ${PROJECT_NAME}_BUILD_TYPE )
		SET( ${PROJECT_NAME}_BUILD_TYPE "MinSizeRel" CACHE STRING "Build type" ) # By default set release build
	ENDIF( NOT DEFINED ${PROJECT_NAME}_BUILD_TYPE )
	SET( CMAKE_BUILD_TYPE ${${PROJECT_NAME}_BUILD_TYPE} CACHE INTERNAL "Build type,
		immutable" FORCE )
ENDIF((NOT MSVC) OR (CMAKE_BUILD_TOOL STREQUAL "nmake"))

########
# SWIG #
########
FIND_PACKAGE(SWIG)
INCLUDE(${SWIG_USE_FILE})
SET(SWIG_FILES_PATH src/SWIG_files/wrapper)
    
################################
# OCE include and lib location #
################################
SET(OCE_INCLUDE_PATH /usr/local/include/oce CACHE PATH "OCE include path" )
SET(OCE_LIB_PATH /usr/local/lib CACHE PATH "OCE lib path" )

##############################################
# Installation directory                     #
# by default, installed to site-packages/OCC #
##############################################
EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from __future__ import print_function; from distutils.sysconfig import get_python_lib; import os;print(get_python_lib())" OUTPUT_VARIABLE python_lib OUTPUT_STRIP_TRAILING_WHITESPACE )
SET(${PROJECT_NAME}_INSTALL_DIRECTORY ${python_lib}/OCC CACHE PATH "pythonOCC install directory" )

# List of OCE shared libraries to link with
# TODO: this should be build from the module list
SET(OCE_MODEL_LIBRARIES TKernel TKMath TKAdvTools TKG2d TKG3d TKGeomBase TKBRep TKGeomAlgo
                  TKTopAlgo TKPrim TKBO TKHLR TKMesh TKShHealing TKXMesh
                  TKBool TKFillet TKFeat TKOffset)
SET(OCE_VISUALIZATION_LIBRARIES TKService TKV3d TKOpenGl)
SET(OCE_DATAEXCHANGE_LIBRARIES TKSTL TKXSBase TKSTEPBase TKIGES TKSTEPAttr TKSTEP209
                  TKSTEP TKVRML)
# Tells CMake where are the required headers
INCLUDE_DIRECTORIES(${PYTHON_INCLUDE_PATH})
INCLUDE_DIRECTORIES(${OCE_INCLUDE_PATH})
LINK_DIRECTORIES(${OCE_LIB_PATH})

######################################################
# Configure Build settings according to the platform #
######################################################
IF(UNIX)
  IF(APPLE)
    ######### MacOSX ###########
	SET(PLATFORM Darwin)
  ELSE(APPLE)
    ######### Unix/Linux ###########
    SET(PLATFORM Unix)
  ENDIF(APPLE)
  SET(CMAKE_SWIG_FLAGS -O -w302,401,314,509,512
        -DCSFDB -DHAVE_CONFIG_H -DOCC_CONVERT_SIGNALS)
  ADD_DEFINITIONS(-DHAVE_CONFIG_H -DCSFDB -DOCC_CONVERT_SIGNALS)
ELSE(UNIX)
  IF(WIN32)
    ######### Windows ###########
    ADD_DEFINITIONS(-DWNT -DWIN32 -D_WINDOWS -DCSFDB -DHAVE_CONFIG_H)
	# specific windows defines for python version >=2.6.0
	EXECUTE_PROCESS(COMMAND python -c "import sys;print (2,6)>=sys.version_info[:2]" OUTPUT_VARIABLE PYTHON_26_OR_HIGHER OUTPUT_STRIP_TRAILING_WHITESPACE)
	IF(${PYTHON_26_OR_HIGHER} MATCHES "True")
	  ADD_DEFINITIONS(-DHAVE_ACOSH -DHAVE_ASINH -DHAVE_ATANH)
	ENDIF(${PYTHON_26_OR_HIGHER} MATCHES "True")
    SET(CMAKE_SWIG_FLAGS -O -w302,401,314,509,512 -DCSFDB -DWIN32 -D_WINDOWS)
    SET(PLATFORM win)
  ELSE(WIN32)
    MESSAGE(STATUS "Unknown platform")
  ENDIF(WIN32)
ENDIF(UNIX)
MESSAGE(STATUS "Platform:" ${PLATFORM})

##################################
# Tells Swig to use py3k option  #
##################################
EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from __future__ import print_function; import sys; print(sys.version_info.major)" OUTPUT_VARIABLE python_version_major OUTPUT_STRIP_TRAILING_WHITESPACE )

IF(${python_version_major} MATCHES "3")
  SET(CMAKE_SWIG_FLAGS ${CMAKE_SWIG_FLAGS} -py3)
ENDIF(${python_version_major} MATCHES "3")

################################################
# Define output path for generated libraries:  #
# platform/compiler-build_type-bits            #
# for instance:                                #
#     ./win32/bin/vc7.1-release-64             #
#     ./win32/bin/vc9-debug-32                 #
#     ./Unix/i386-debug-64                     #
################################################
IF(WIN32)
  IF(MSVC) # The compiler used is MSVC
    MESSAGE(STATUS "Found MSVC compiler: ${MSVC} ${MSVC_VERSION}")
    SET(LIBRARY_OUTPUT_PATH ${CMAKE_BINARY_DIR}/bin/)
  ELSEIF (BORLAND) # The compiler used is BORLAND
    SET(LIBRARY_OUTPUT_PATH ${CMAKE_BINARY_DIR}/win${BIT}/bin/${CMAKE_BUILD_TYPE})
  ELSE()
    SET(LIBRARY_OUTPUT_PATH win${BIT}/bin/${CMAKE_BUILD_TYPE})
  ENDIF()
  SET(EXECUTABLE_OUTPUT_PATH ${LIBRARY_OUTPUT_PATH})
ELSE(WIN32)
  SET(LIBRARY_OUTPUT_PATH ${PLATFORM}/${CMAKE_SYSTEM_PROCESSOR}-${CMAKE_BUILD_TYPE}-${BIT})
ENDIF(WIN32)
SET(CMAKE_SWIG_OUTDIR ${LIBRARY_OUTPUT_PATH})
MESSAGE(STATUS "output_path: ${LIBRARY_OUTPUT_PATH}")

############################
# OpenCASCADE Modules list #
############################
INCLUDE(${CMAKE_CURRENT_SOURCE_DIR}/cmake/OCE_Modules.cmake)
# add an option to choose toolkits to compile
OPTION_WITH_DEFAULT(${PROJECT_NAME}_WRAP_MODEL "Compile Foundation/Model" TRUE)
OPTION_WITH_DEFAULT(${PROJECT_NAME}_WRAP_VISU "Compile Visualisation" TRUE)
OPTION_WITH_DEFAULT(${PROJECT_NAME}_WRAP_DATAEXCHANGE "Compile Data Exchange" TRUE)

###################
# Wrapper Modules #
###################

# MODEL Toolkits
FILE(MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/${SWIG_FILES_PATH})
FOREACH(OCE_MODULE ${OCE_TOOLKIT_MODEL})
	SET(FILE ${SWIG_FILES_PATH}/${OCE_MODULE}.i)
	SET_SOURCE_FILES_PROPERTIES(${FILE} PROPERTIES CPLUSPLUS ON)
    SWIG_ADD_MODULE(${OCE_MODULE} python ${FILE})
    SWIG_LINK_LIBRARIES(${OCE_MODULE} ${PYTHON_LIBRARIES} ${OCE_MODEL_LIBRARIES})
ENDFOREACH(OCE_MODULE)

# Visualisation
IF(${PROJECT_NAME}_WRAP_VISU)
FOREACH(OCE_MODULE ${OCE_TOOLKIT_VISUALIZATION})
    SET(FILE ${SWIG_FILES_PATH}/${OCE_MODULE}.i)
    SET_SOURCE_FILES_PROPERTIES(${FILE} PROPERTIES CPLUSPLUS ON)
    SWIG_ADD_MODULE(${OCE_MODULE} python ${FILE})
    SWIG_LINK_LIBRARIES(${OCE_MODULE} ${PYTHON_LIBRARIES} ${OCE_MODEL_LIBRARIES} ${OCE_VISUALIZATION_LIBRARIES})
ENDFOREACH(OCE_MODULE)
ENDIF(${PROJECT_NAME}_WRAP_VISU)

IF(${PROJECT_NAME}_WRAP_VISU)
# Build third part modules
# TODO : the following line is strange but necessary
EXECUTE_PROCESS(COMMAND ${CMAKE_COMMAND} -E make_directory src/Visualization)
SET_SOURCE_FILES_PROPERTIES(${CMAKE_CURRENT_SOURCE_DIR}/src/Visualization/Visualization.i PROPERTIES CPLUSPLUS ON)
INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR}/src/Visualization)
SET(VISUALIZATION_SOURCE_FILES
	${CMAKE_CURRENT_SOURCE_DIR}/src/Visualization/Visualization.i
	${CMAKE_CURRENT_SOURCE_DIR}/src/Visualization/Display3d.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/src/Visualization/Tesselator.cpp
	)
SWIG_ADD_MODULE(Visualization python ${VISUALIZATION_SOURCE_FILES})
IF(APPLE)
# on OSX, always add /System/Library/Frameworks/Cocoa.framework, even
# if GLX is enabled
SWIG_LINK_LIBRARIES(Visualization ${PYTHON_LIBRARIES} ${OCE_MODEL_LIBRARIES} ${OCE_VISUALIZATION_LIBRARIES} /System/Library/Frameworks/Cocoa.framework)
ELSE(APPLE)
SWIG_LINK_LIBRARIES(Visualization ${PYTHON_LIBRARIES} ${OCE_MODEL_LIBRARIES} ${OCE_VISUALIZATION_LIBRARIES})
ENDIF(APPLE)
ENDIF(${PROJECT_NAME}_WRAP_VISU)

# DataExchange
IF(${PROJECT_NAME}_WRAP_DATAEXCHANGE)
FOREACH(OCE_MODULE ${OCE_TOOLKIT_DATAEXCHANGE})
    SET(FILE ${SWIG_FILES_PATH}/${OCE_MODULE}.i)
    SET_SOURCE_FILES_PROPERTIES(${FILE} PROPERTIES CPLUSPLUS ON)
    SWIG_ADD_MODULE(${OCE_MODULE} python ${FILE})
    SWIG_LINK_LIBRARIES(${OCE_MODULE} ${PYTHON_LIBRARIES} ${OCE_MODEL_LIBRARIES} ${OCE_VISUALIZATION_LIBRARIES} ${OCE_DATAEXCHANGE_LIBRARIES})
ENDFOREACH(OCE_MODULE)
ENDIF(${PROJECT_NAME}_WRAP_DATAEXCHANGE)

################
# Installation #
################
IF(WIN32)
	SET(EXTENSION "pyd")
ELSE(WIN32)
	SET(EXTENSION "so")
ENDIF(WIN32)
SET(BUILD_DIR ${CMAKE_BINARY_DIR}/${LIBRARY_OUTPUT_PATH})

# install pythonOCC modules
FOREACH(OCE_MODULE ${OCE_TOOLKIT_MODEL})
	INSTALL(FILES ${BUILD_DIR}/${OCE_MODULE}.py DESTINATION ${${PROJECT_NAME}_INSTALL_DIRECTORY} )
	INSTALL(FILES ${BUILD_DIR}/_${OCE_MODULE}.${EXTENSION} DESTINATION ${${PROJECT_NAME}_INSTALL_DIRECTORY} )
ENDFOREACH(OCE_MODULE)
IF(${PROJECT_NAME}_WRAP_VISU)
FOREACH(OCE_MODULE ${OCE_TOOLKIT_VISUALIZATION})
    INSTALL(FILES ${BUILD_DIR}/${OCE_MODULE}.py DESTINATION ${${PROJECT_NAME}_INSTALL_DIRECTORY} )
    INSTALL(FILES ${BUILD_DIR}/_${OCE_MODULE}.${EXTENSION} DESTINATION ${${PROJECT_NAME}_INSTALL_DIRECTORY} )
ENDFOREACH(OCE_MODULE)
ENDIF(${PROJECT_NAME}_WRAP_VISU)
IF(${PROJECT_NAME}_WRAP_DATAEXCHANGE)
FOREACH(OCE_MODULE ${OCE_TOOLKIT_DATAEXCHANGE})
    INSTALL(FILES ${BUILD_DIR}/${OCE_MODULE}.py DESTINATION ${${PROJECT_NAME}_INSTALL_DIRECTORY} )
    INSTALL(FILES ${BUILD_DIR}/_${OCE_MODULE}.${EXTENSION} DESTINATION ${${PROJECT_NAME}_INSTALL_DIRECTORY} )
ENDFOREACH(OCE_MODULE)
ENDIF(${PROJECT_NAME}_WRAP_DATAEXCHANGE)

# install third part modules
IF(${PROJECT_NAME}_WRAP_VISU)
INSTALL(FILES ${BUILD_DIR}/Visualization.py DESTINATION ${${PROJECT_NAME}_INSTALL_DIRECTORY} )
INSTALL(FILES ${BUILD_DIR}/_Visualization.${EXTENSION} DESTINATION ${${PROJECT_NAME}_INSTALL_DIRECTORY} )
ENDIF(${PROJECT_NAME}_WRAP_VISU)

# install GC
INSTALL(FILES ${CMAKE_CURRENT_SOURCE_DIR}/src/GarbageCollector.py DESTINATION ${${PROJECT_NAME}_INSTALL_DIRECTORY} )
# install addons
INSTALL(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/src/addons/Display DESTINATION ${${PROJECT_NAME}_INSTALL_DIRECTORY} )
# install LICENSE file
INSTALL(FILES ${CMAKE_CURRENT_SOURCE_DIR}/LICENSE DESTINATION ${${PROJECT_NAME}_INSTALL_DIRECTORY} )
# install __init__.py file
INSTALL(FILES ${CMAKE_CURRENT_SOURCE_DIR}/cmake/__init__.py DESTINATION ${${PROJECT_NAME}_INSTALL_DIRECTORY} )

#######################
# pythonOCC Packaging #
# $ make package      #
#######################
IF(UNIX)
  INCLUDE(InstallRequiredSystemLibraries)
ENDIF(UNIX)
SET(CPACK_PACKAGE_DESCRIPTION_SUMMARY "pythonOCC")
SET(CPACK_PACKAGE_VENDOR "Thomas Paviot")
SET(CPACK_SET_DESTDIR "ON")
SET(CPACK_PACKAGE_VERSION_MAJOR ${${PROJECT_NAME}_VERSION_MAJOR})
SET(CPACK_PACKAGE_VERSION_MINOR ${${PROJECT_NAME}_VERSION_MINOR})
SET(CPACK_PACKAGE_VERSION_PATCH 0)
SET(CPACK_PACKAGE_NAME ${PROJECT_NAME})
SET(CPACK_PACKAGE_CONTACT "pythonOCC users <pythonocc-users@gna.org")
INCLUDE(CPack)
