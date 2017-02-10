mkdir build
cd build
dir "%PREFIX%"/include
REM Remove dot from PY_VER for use in library name
set MY_PY_VER=%PY_VER:.=%
dir "%PREFIX%"/include
REM Configure step
cmake -G "Ninja" -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
 -DCMAKE_BUILD_TYPE=Release ^
 -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%" ^
 -DCMAKE_SYSTEM_PREFIX_PATH="%LIBRARY_PREFIX%" ^
 -DPYTHON_EXECUTABLE:FILEPATH="%PYTHON%" ^
 -DPYTHON_INCLUDE_DIR:PATH="%PREFIX%"/include ^
 -DPYTHON_LIBRARY:FILEPATH="%PREFIX%"/libs/python%MY_PY_VER%.lib ^
 -DPYTHONOCC_WRAP_SMESH=ON ^
 -DSMESH_INCLUDE_PATH:PATH="%PREFIX%"/include/smesh ^
 ..
if errorlevel 1 exit 1
 
REM Build step 
ninja
if errorlevel 1 exit 1

REM Install step
ninja install
if errorlevel 1 exit 1

REM copy the source
cd ..
xcopy src "%LIBRARY_PREFIX%\src\pythonocc-core\src" /s /e /i
if errorlevel 1 exit 1