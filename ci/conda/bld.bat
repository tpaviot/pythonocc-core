mkdir build
cd build

REM Configure step
cmake -G "Ninja" ^
 -DPYTHONOCC_BUILD_TYPE=Release ^
 -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%" ^
 -DCMAKE_LIBRARY_PATH="%LIBRARY_LIB%" ^
 -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
 -DCMAKE_SYSTEM_PREFIX_PATH="%LIBRARY_PREFIX%" ^
 -DPython3_FIND_STRATEGY=LOCATION ^
 -DPython3_FIND_REGISTRY=NEVER ^
 -DSWIG_HIDE_WARNINGS=ON ^
 -DPYTHONOCC_MESHDS_NUMPY=ON ^
 -DPYTHONOCC_VERSION=%OCCT_VERSION% ^
 ..
if errorlevel 1 exit 1
 
REM Build step 
ninja
if errorlevel 1 exit 1

REM Install step
ninja install
if errorlevel 1 exit 1
