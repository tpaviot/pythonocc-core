mkdir build
cd build

REM Configure step
cmake -G "Ninja" -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
 -DPYTHONOCC_BUILD_TYPE=Release ^
 -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%" ^
 -DCMAKE_SYSTEM_PREFIX_PATH="%LIBRARY_PREFIX%" ^
 -DPYTHONOCC_WRAP_SMESH=ON ^
 -DSMESH_INCLUDE_PATH:PATH="%LIBRARY_PREFIX%"/include/smesh ^
 -DPYTHONOCC_WRAP_SMESH_NETGENPLUGIN=OFF ^
 -DPython3_FIND_STRATEGY=LOCATION ^
 -DPython3_FIND_REGISTRY=NEVER ^
 ..
if errorlevel 1 exit 1
 
REM Build step 
ninja
if errorlevel 1 exit 1

REM Install step
ninja install
if errorlevel 1 exit 1

REM copy the source
REM cd ..
REM xcopy src "%LIBRARY_PREFIX%\src\pythonocc-core\src" /s /e /i
REM if errorlevel 1 exit 1