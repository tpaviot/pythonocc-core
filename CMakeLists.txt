##Copyright (c) 2011-2020 Thomas Paviot (tpaviot@gmail.com)
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

cmake_minimum_required(VERSION 3.12)

project(PYTHONOCC)

# set pythonOCC version
set(PYTHONOCC_VERSION_MAJOR 7)
set(PYTHONOCC_VERSION_MINOR 8)
set(PYTHONOCC_VERSION_PATCH 1)

#  Empty for official releases, set to -dev, -rc1, etc for development releases
set(PYTHONOCC_VERSION_DEVEL )

# set OCCT version
set(OCCT_VERSION_MAJOR 7)
set(OCCT_VERSION_MINOR 8)
set(OCCT_VERSION_PATCH 1)

set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake ${CMAKE_MODULE_PATH})

## cmake policies
# CMP0078: UseSWIG generates standard target names.
if (POLICY CMP0078)
    cmake_policy(SET CMP0078 NEW)
endif(POLICY CMP0078)

# CMP0086: UseSWIG honors SWIG_MODULE_NAME via -module
if (POLICY CMP0086)
    cmake_policy(SET CMP0086 NEW)
endif(POLICY CMP0086)

# Force C++ 11
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(BUILD_SHARED_LIBS ON)
include_directories(${CMAKE_CURRENT_SOURCE_DIR})

if(APPLE)
  set(CMAKE_MACOSX_RPATH ON)
  set(CMAKE_SKIP_BUILD_RPATH FALSE)
  set(CMAKE_BUILD_WITH_INSTALL_RPATH FALSE)
  set(CMAKE_INSTALL_RPATH "${CMAKE_INSTALL_PREFIX}/lib;@loader_path/../../../")
  set(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)
endif(APPLE)

#############################
# Option_With_Default macro #
#############################
macro(option_with_default OPTION_NAME OPTION_STRING OPTION_DEFAULT)
  option(${OPTION_NAME} ${OPTION_STRING} ${OPTION_DEFAULT})
endmacro(option_with_default OPTION_NAME OPTION_STRING OPTION_DEFAULT)

#####################################################################
# OpenGL. If available, enable compilation for Visualization module #
#####################################################################
find_package(OpenGL)
include_directories(OPENGL_INCLUDE_DIR)

#################
# Build options #
#################
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/OCCT_Modules.cmake)
# add an option to choose toolkits to compile
if(OPENGL_FOUND)
  option_with_default(PYTHONOCC_WRAP_VISU "Compile Visualisation" ON)
else(OPENGL_FOUND)
  message(WARNING "OpenGL library not found, Visualization compilation is turned OFF")
  set(PYTHONOCC_WRAP_VISU "Compile Visualisation" OFF)
endif(OPENGL_FOUND)
option_with_default(PYTHONOCC_WRAP_DATAEXCHANGE "Compile DataExchange wrapper" ON)
option_with_default(PYTHONOCC_WRAP_OCAF "Compile OCCT Application Framework wrapper" ON)
option_with_default(SWIG_HIDE_WARNINGS "Check this option if you want a less verbose swig output." ON)
option_with_default(OCCT_HIDE_DEPRECATED "Check this option to disable deprecation warnings for OCCT." ON)
option_with_default(PYTHONOCC_MESHDS_NUMPY "Enable using numpy to speed up mesh data source arrays (requires numpy dev libraries and headers)." OFF)

############
# Python 3 #
############
set(Python3_FIND_STRATEGY LOCATION)
set(Python3_FIND_FRAMEWORK NEVER)
if(PYTHONOCC_MESHDS_NUMPY)
    find_package(Python3 COMPONENTS Interpreter Development NumPy REQUIRED)
    include_directories(${Python3_NumPy_INCLUDE_DIRS})
    message(STATUS "Numpy include directory: ${Python3_NumPy_INCLUDE_DIRS}")
    set(CMAKE_SWIG_FLAGS ${CMAKE_SWIG_FLAGS} -DBUILD_MESHDS_NUMPY)
else(PYTHONOCC_MESHDS_NUMPY)
    find_package(Python3 COMPONENTS Interpreter Development REQUIRED)
endif(PYTHONOCC_MESHDS_NUMPY)
message(STATUS "Python3 interpreter:" ${Python3_EXECUTABLE})
message(STATUS "Python include directory: ${Python3_INCLUDE_DIRS}")
message(STATUS "Python library release: ${Python3_LIBRARY_RELEASE}")

########
# SWIG #
########
find_package(SWIG 4.2.1 REQUIRED)
include(${SWIG_USE_FILE})
set(SWIG_FILES_PATH src/SWIG_files/wrapper)
set(CMAKE_SWIG_FLAGS ${CMAKE_SWIG_FLAGS} -fvirtual)
if(SWIG_HIDE_WARNINGS)
  message(STATUS "Disabled SWIG warnings")
  set(CMAKE_SWIG_FLAGS ${CMAKE_SWIG_FLAGS} -w302,401,402,412,314,509,512,504,325,503,520,350,351,383,389,394,395,404)
endif()

if(CMAKE_BUILD_TYPE STREQUAL "Release")
  add_definitions(-DSWIG_PYTHON_SILENT_MEMLEAK)
endif(CMAKE_BUILD_TYPE STREQUAL "Release")

################################
# OCE include and lib location #
################################
if(OCCT_HIDE_DEPRECATED)
  message(STATUS "Disabled deprecation warnings for oce")
  add_definitions(-DOCCT_NO_DEPRECATED)
endif(OCCT_HIDE_DEPRECATED)

if(DEFINED OCCT_INCLUDE_DIR)
  if(NOT DEFINED OCCT_LIBRARY_DIR)
    message(FATAL_ERROR "OCCT_LIBRARY_DIR must be defined")
  endif(NOT DEFINED OCCT_LIBRARY_DIR)
  set(OCCT_INCLUDE_DIR ${OCCT_INCLUDE_DIR} CACHE PATH "OCCT include path")
  set(OCCT_LIBRARY_DIR ${OCCT_LIBRARY_DIR} CACHE PATH "OCCT library path")
  include_directories(${OCCT_INCLUDE_DIR})
  link_directories(${OCCT_LIBRARY_DIR})
# if OCCT_INCLUDE_DIR is not passed at command line,
# find OCE automatically
else(OCCT_INCLUDE_DIR)
  find_package(OpenCASCADE ${OCCT_VERSION_MAJOR}.${OCCT_VERSION_MINOR}.${OCCT_VERSION_PATCH} REQUIRED)
  if(OpenCASCADE_FOUND)
    message(STATUS "OpenCASCADE version found: " ${OpenCASCADE_MAJOR_VERSION} "." ${OpenCASCADE_MINOR_VERSION} "." ${OpenCASCADE_MAINTENANCE_VERSION})
    message(STATUS "OpenCASCADE include directory: " ${OpenCASCADE_INCLUDE_DIR})
    message(STATUS "OpenCASCADE binary directory: " ${OpenCASCADE_BINARY_DIR})
    include_directories(${OpenCASCADE_INCLUDE_DIR})
  else(OpenCASCADE_FOUND)  # set default paths
    set(OCCT_INCLUDE_DIR /usr/local/include/oce CACHE PATH "OCE include path")
    set(OCCT_LIBRARY_DIR /usr/local/lib CACHE PATH "OCE lib path")
    include_directories(${OCCT_INCLUDE_DIR})
    link_directories(${OCCT_LIBRARY_DIR})
  endif(OpenCASCADE_FOUND)
endif(DEFINED OCCT_INCLUDE_DIR)

# After the OCC paths are properly set up,
find_file(OCCT_GP_PNT_HEADER_LOCATION "gp_Pnt.hxx" PATHS ${OpenCASCADE_INCLUDE_DIR} ${OCCT_INCLUDE_DIR})
if(${OCCT_GP_PNT_HEADER_LOCATION} STREQUAL "GP_PNT_HEADER_LOCATION-NOTFOUND")
    message(FATAL_ERROR "gp_Pnt.hxx can not be found.")
endif()

##############################################
# Installation directory                     #
# by default, installed to site-packages/OCC #
##############################################
if(NOT DEFINED PYTHONOCC_INSTALL_DIRECTORY)
    if(DEFINED ENV{SP_DIR} AND WIN32)
      # TODO: following hack is azure specific, a recent update in azure
      # prevent cmake to find correct paths of python3 on windows
      # this should be removed as soon as possible
      message(STATUS "conda-build running, using $ENV{SP_DIR} as install dir")
      set(PYTHONOCC_INSTALL_DIRECTORY $ENV{SP_DIR}/OCC CACHE PATH "pythonocc install directory")
    else(DEFINED ENV{SP_DIR} AND WIN32)
      execute_process(COMMAND ${Python3_EXECUTABLE} -c "from distutils.sysconfig import get_python_lib; from os.path import relpath; print(relpath(get_python_lib(1,prefix='${CMAKE_INSTALL_PREFIX}'),'${CMAKE_INSTALL_PREFIX}'))" OUTPUT_VARIABLE python_lib OUTPUT_STRIP_TRAILING_WHITESPACE)
      set(PYTHONOCC_INSTALL_DIRECTORY ${python_lib}/OCC CACHE PATH "pythonocc install directory")
    endif(DEFINED ENV{SP_DIR} AND WIN32)
endif(NOT DEFINED PYTHONOCC_INSTALL_DIRECTORY)

message(STATUS "pythonocc modules will be installed to: ${PYTHONOCC_INSTALL_DIRECTORY}")

#############################################
# List of OCE shared libraries to link with #
#############################################
set(OCCT_MODEL_LIBRARIES TKernel TKMath TKBRep TKG2d TKG3d TKGeomBase TKBO
                        TKBool TKFeat TKFillet TKGeomAlgo TKHLR TKMesh TKOffset
                        TKPrim TKShHealing TKTopAlgo TKXMesh)
set(OCCT_VISUALIZATION_LIBRARIES TKService TKV3d TKOpenGl TKMeshVS)
set(OCCT_DATAEXCHANGE_LIBRARIES TKDE TKXSBase TKDESTEP TKDEIGES TKDESTL TKDEVRML TKDECascade TKDEOBJ TKDEGLTF TKDEPLY TKLCAF TKXCAF TKXmlXCAF TKBinXCAF TKRWMesh)
set(OCCT_OCAF_LIBRARIES TKCDF TKLCAF TKCAF TKBinL TKXmlL TKBin TKXml TKStdL
                       TKStd TKTObj TKBinTObj TKXmlTObj TKVCAF)

################
# Headers path #
################
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/src/SWIG_files/headers)

######################################################
# Configure Build settings according to the platform #
######################################################

# Mingw64 needs MS_WIN64 to be defined (otherwise link failures)
if(MINGW)
  message(STATUS "MinGW:")
  if(${CMAKE_SIZEOF_VOID_P} MATCHES "8")  # 64 bit check
      add_definitions(-DMS_WIN64)
  endif(${CMAKE_SIZEOF_VOID_P} MATCHES "8")
endif(MINGW)

# MACOSX_DEPLOYEMENT_TARGET
# explicit link to libc++ for recent osx versions
if(APPLE)
  message(STATUS "Explicitly link to libc++ on modern osx versions")
  add_definitions(-stdlib=libc++)
endif(APPLE)

if(UNIX)
  if(APPLE)
    ######### MacOSX ###########
    set(PLATFORM Darwin)
  else(APPLE)
    ######### Unix/Linux ###########
    set(PLATFORM Unix)
  endif(APPLE)
  set(CMAKE_SWIG_FLAGS ${CMAKE_SWIG_FLAGS} -DCSFDB -DHAVE_CONFIG_H -DSWIG_PYTHON_SILENT_MEMLEAK)
  add_definitions(-DHAVE_CONFIG_H -DCSFDB)
else(UNIX)
  if(WIN32)
    ######### Windows ###########
    add_definitions(-DWNT -DWIN32 -D_WINDOWS -DCSFDB -DHAVE_CONFIG_H)
    set(CMAKE_SWIG_FLAGS ${CMAKE_SWIG_FLAGS} -DCSFDB -DWIN32 -D_WINDOWS -DSWIG_PYTHON_SILENT_MEMLEAK)
    set(PLATFORM win)
  else(WIN32)
    message(STATUS "Unknown platform")
  endif(WIN32)
endif(UNIX)

################################################
# Define output path for generated libraries:  #
# platform/compiler-build_type-bits            #
# for instance:                                #
#     ./win32/bin/vc7.1-release-64             #
#     ./win32/bin/vc9-debug-32                 #
#     ./Unix/i386-debug-64                     #
################################################
if(WIN32)
  if(MSVC) # The compiler used is MSVC
    message(STATUS "Found MSVC compiler: ${MSVC} ${MSVC_VERSION}")
    set(LIBRARY_OUTPUT_PATH bin/)
    # prevent bigobj fatal error C1148 issue, and remove C4244 verbose warning
    add_definitions("/bigobj /wd4244 /wd4251 /wd4275 /wd4290")
  elseif (BORLAND) # The compiler used is BORLAND
    set(LIBRARY_OUTPUT_PATH win${BIT}/bin/${CMAKE_BUILD_TYPE})
  else()
    set(LIBRARY_OUTPUT_PATH win${BIT}/bin/${CMAKE_BUILD_TYPE})
  endif()
  set(EXECUTABLE_OUTPUT_PATH ${LIBRARY_OUTPUT_PATH})
else(WIN32)
  set(LIBRARY_OUTPUT_PATH ${PLATFORM}/${CMAKE_SYSTEM_PROCESSOR}-${CMAKE_BUILD_TYPE}-${BIT})
endif(WIN32)
set(CMAKE_SWIG_OUTDIR ${LIBRARY_OUTPUT_PATH})

##################
# MODEL Toolkits #
##################
file(MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/${SWIG_FILES_PATH})
foreach(OCCT_MODULE ${OCCT_TOOLKIT_MODEL})
    set(FILE ${SWIG_FILES_PATH}/${OCCT_MODULE}.i)
    set_source_files_properties(${FILE} PROPERTIES CPLUSPLUS ON)
    swig_add_library (${OCCT_MODULE} LANGUAGE python SOURCES ${FILE} TYPE MODULE)
    swig_link_libraries(${OCCT_MODULE} ${OCCT_MODEL_LIBRARIES} Python3::Module)
endforeach(OCCT_MODULE)

###############
# Tessellator #
###############
execute_process(COMMAND ${CMAKE_COMMAND} -E make_directory src/Tesselator)
set_source_files_properties(${CMAKE_CURRENT_SOURCE_DIR}/src/Tesselator/Tesselator.i PROPERTIES CPLUSPLUS ON)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/src/Tesselator)
set(TESSELATOR_SOURCE_FILES
  ${CMAKE_CURRENT_SOURCE_DIR}/src/Tesselator/Tesselator.i
  ${CMAKE_CURRENT_SOURCE_DIR}/src/Tesselator/ShapeTesselator.cpp)

swig_add_library(Tesselator LANGUAGE python SOURCES ${TESSELATOR_SOURCE_FILES} TYPE MODULE)
swig_link_libraries(Tesselator ${OCCT_MODEL_LIBRARIES} Python3::Module)

#################
# Visualisation #
#################
if(PYTHONOCC_WRAP_VISU)
    find_package(OpenGL REQUIRED)
    include_directories(OPENGL_INCLUDE_DIR)

    foreach(OCCT_MODULE ${OCCT_TOOLKIT_VISUALIZATION})
      set(FILE ${SWIG_FILES_PATH}/${OCCT_MODULE}.i)
      set_source_files_properties(${FILE} PROPERTIES CPLUSPLUS ON)
      swig_add_library (${OCCT_MODULE} LANGUAGE python SOURCES ${FILE} TYPE MODULE)
      swig_link_libraries(${OCCT_MODULE} ${OCCT_MODEL_LIBRARIES} ${OCCT_VISUALIZATION_LIBRARIES} Python3::Module)
    endforeach(OCCT_MODULE)

  # Build third part modules
  # TODO : the following line is strange but necessary
  execute_process(COMMAND ${CMAKE_COMMAND} -E make_directory src/Visualization)
  set_source_files_properties(${CMAKE_CURRENT_SOURCE_DIR}/src/Visualization/Visualization.i PROPERTIES CPLUSPLUS ON)
  include_directories(${CMAKE_CURRENT_SOURCE_DIR}/src/Visualization)
  set(VISUALIZATION_SOURCE_FILES
      ${CMAKE_CURRENT_SOURCE_DIR}/src/Visualization/Visualization.i
      ${CMAKE_CURRENT_SOURCE_DIR}/src/Visualization/Display3d.cpp)

    swig_add_library(Visualization LANGUAGE python SOURCES ${VISUALIZATION_SOURCE_FILES} TYPE MODULE)
    swig_link_libraries(Visualization ${OCCT_MODEL_LIBRARIES} ${OCCT_VISUALIZATION_LIBRARIES} Python3::Module)

  if(APPLE)
    # on OSX, always add /System/Library/Frameworks/Cocoa.framework, even
    # if GLX is enabled
    swig_link_libraries(Visualization /System/Library/Frameworks/Cocoa.framework)
  endif(APPLE)

  ##########################
  # MeshDS module addition #
  ##########################
  execute_process(COMMAND ${CMAKE_COMMAND} -E make_directory src/MeshDataSource)
  set(FILE ${SWIG_FILES_PATH}/MeshDS.i)
  set_source_files_properties(${FILE} PROPERTIES CPLUSPLUS ON)
  include_directories(${CMAKE_CURRENT_SOURCE_DIR}/src/MeshDataSource)
  set(MESHDATASOURCE_SOURCE_FILES
  ${FILE}
  ${CMAKE_CURRENT_SOURCE_DIR}/src/MeshDataSource/MeshDataSource.cpp)

  swig_add_library(MeshDS LANGUAGE python SOURCES ${MESHDATASOURCE_SOURCE_FILES} TYPE MODULE)
  swig_link_libraries(MeshDS ${OCCT_MODEL_LIBRARIES} ${OCCT_VISUALIZATION_LIBRARIES} Python3::Module)

endif(PYTHONOCC_WRAP_VISU)

################
# DataExchange #
################
if(PYTHONOCC_WRAP_DATAEXCHANGE)
  foreach(OCCT_MODULE ${OCCT_TOOLKIT_DATAEXCHANGE})
    set(FILE ${SWIG_FILES_PATH}/${OCCT_MODULE}.i)
    set_source_files_properties(${FILE} PROPERTIES CPLUSPLUS ON)
    swig_add_library(${OCCT_MODULE} LANGUAGE python SOURCES ${FILE} TYPE MODULE)
    swig_link_libraries(${OCCT_MODULE} ${OCCT_MODEL_LIBRARIES} ${OCCT_DATAEXCHANGE_LIBRARIES} Python3::Module)
  endforeach(OCCT_MODULE)
endif(PYTHONOCC_WRAP_DATAEXCHANGE)

########
# OCAF #
########
if(PYTHONOCC_WRAP_OCAF)
  foreach(OCCT_MODULE ${OCCT_TOOLKIT_OCAF})
    set(FILE ${SWIG_FILES_PATH}/${OCCT_MODULE}.i)
    set_source_files_properties(${FILE} PROPERTIES CPLUSPLUS ON)
    swig_add_library(${OCCT_MODULE} LANGUAGE python SOURCES ${FILE} TYPE MODULE)
    swig_link_libraries(${OCCT_MODULE} ${OCCT_MODEL_LIBRARIES} ${OCCT_OCAF_LIBRARIES} Python3::Module)
  endforeach(OCCT_MODULE)
endif(PYTHONOCC_WRAP_OCAF)

##########
# Addons #
##########
execute_process(COMMAND ${CMAKE_COMMAND} -E make_directory src/Addons)
set_source_files_properties(${CMAKE_CURRENT_SOURCE_DIR}/src/Addons/Addons.i PROPERTIES CPLUSPLUS ON)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/src/Addons)
set(ADDONS_SOURCE_FILES
${CMAKE_CURRENT_SOURCE_DIR}/src/Addons/Addons.i
${CMAKE_CURRENT_SOURCE_DIR}/src/Addons/Font3d.cpp
#${CMAKE_CURRENT_SOURCE_DIR}/src/Addons/TextItem.cpp
#${CMAKE_CURRENT_SOURCE_DIR}/src/Addons/LineItem.cpp
#${CMAKE_CURRENT_SOURCE_DIR}/src/Addons/TextureItem.cpp
)

swig_add_library(Addons LANGUAGE python SOURCES ${ADDONS_SOURCE_FILES} TYPE MODULE)
swig_link_libraries(Addons ${OCCT_MODEL_LIBRARIES} ${OCCT_VISUALIZATION_LIBRARIES} Python3::Module)

################
# Installation #
################
if(WIN32)
    set(EXTENSION "pyd")
else(WIN32)
    set(EXTENSION "so")
endif(WIN32)
set(BUILD_DIR ${CMAKE_BINARY_DIR}/${LIBRARY_OUTPUT_PATH})

# install pythonOCC modules
foreach(OCCT_MODULE ${OCCT_TOOLKIT_MODEL})
    install(FILES ${BUILD_DIR}/${OCCT_MODULE}.py DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY}/Core)
    install(TARGETS ${OCCT_MODULE} DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY}/Core)
    install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/src/SWIG_files/wrapper/${OCCT_MODULE}.pyi DESTINATION 
    ${PYTHONOCC_INSTALL_DIRECTORY}/Core)
endforeach(OCCT_MODULE)

# install tesselator
install(FILES ${BUILD_DIR}/Tesselator.py DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY}/Core)
install(TARGETS Tesselator DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY}/Core)

if(PYTHONOCC_WRAP_VISU)
    foreach(OCCT_MODULE ${OCCT_TOOLKIT_VISUALIZATION})
        install(FILES ${BUILD_DIR}/${OCCT_MODULE}.py DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY}/Core)
        install(TARGETS ${OCCT_MODULE} DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY}/Core)
        install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/src/SWIG_files/wrapper/${OCCT_MODULE}.pyi DESTINATION 
        ${PYTHONOCC_INSTALL_DIRECTORY}/Core)
    endforeach(OCCT_MODULE)

    # install MeshDataSource
    install(FILES ${BUILD_DIR}/MeshDS.py DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY}/Core)
    install(TARGETS MeshDS DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY}/Core)
endif(PYTHONOCC_WRAP_VISU)

if(PYTHONOCC_WRAP_DATAEXCHANGE)
    foreach(OCCT_MODULE ${OCCT_TOOLKIT_DATAEXCHANGE})
        install(FILES ${BUILD_DIR}/${OCCT_MODULE}.py DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY}/Core)
        install(TARGETS ${OCCT_MODULE} DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY}/Core)
        install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/src/SWIG_files/wrapper/${OCCT_MODULE}.pyi DESTINATION 
        ${PYTHONOCC_INSTALL_DIRECTORY}/Core)
    endforeach(OCCT_MODULE)
endif(PYTHONOCC_WRAP_DATAEXCHANGE)

if(PYTHONOCC_WRAP_OCAF)
    foreach(OCCT_MODULE ${OCCT_TOOLKIT_OCAF})
        # install the python interface file (python module)
        install(FILES ${BUILD_DIR}/${OCCT_MODULE}.py DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY}/Core)
        install(TARGETS ${OCCT_MODULE} DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY}/Core)
        install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/src/SWIG_files/wrapper/${OCCT_MODULE}.pyi DESTINATION 
        ${PYTHONOCC_INSTALL_DIRECTORY}/Core)
    endforeach(OCCT_MODULE)
endif(PYTHONOCC_WRAP_OCAF)

# install third part modules
if(PYTHONOCC_WRAP_VISU)
    install(FILES ${BUILD_DIR}/Visualization.py DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY}/Core)
    install(TARGETS Visualization DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY}/Core)
endif(PYTHONOCC_WRAP_VISU)

# install addons
install(FILES ${BUILD_DIR}/Addons.py DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY}/Core )
install(TARGETS Addons DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY}/Core )
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/src/Display DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY} )

# install Display
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/src/Display DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY})

# install LICENSE file
install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/LICENSE DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY})

# install AUTHORS file
install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/AUTHORS DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY})

# install Exception.py, __init__ and py.typed
# install __init__.py file
install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/src/PkgBase/__init__.py DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY})
install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/src/PkgBase/__init__.py DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY}/Core)
install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/src/PkgBase/Exception.py DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY}/Core)
# following file is necessary to mypy to use .pyi stub files
install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/src/PkgBase/py.typed DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY}/Core)

# install Extend
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/src/Extend DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY})

# install Wrapper utils
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/src/Wrapper DESTINATION ${PYTHONOCC_INSTALL_DIRECTORY})
