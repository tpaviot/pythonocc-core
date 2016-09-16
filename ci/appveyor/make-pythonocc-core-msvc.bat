cd C:\projects\pythonocc-core
mkdir cmake-build
cd cmake-build
cmake -DOCE_DIR=C:\\Python27_32\\Library\\cmake ^
      -G "%generator%" ..
msbuild /m:8 /verbosity:minimal /p:Configuration=%configuration% PYTHONOCC.sln
msbuild /m:4 /verbosity:minimal /p:Configuration=%configuration% INSTALL.vcxproj
