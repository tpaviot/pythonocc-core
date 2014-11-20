After cmake and make, you should have many ".cs" files created by swig 
(this will be automated by cmake using FindMono module, someday) that must be compiled:

cd ~/git/pythonocc-core/cmake-build/Unix/x86_64-MinSizeRel-64
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:`pwd`
ldconfig
mcs -platform:x64 -nologo -debug+ -t:library -out:pythonocc.dll *.cs
cd ~/git/pythonocc-core/test/csharp
mcs -platform:x64 -nologo -debug+ -out:testpnt.exe -r:pythonocc.dll testpnt.cs
mono testpnt.exe
# in case of problems: 
MONO_LOG_LEVEL=debug mono testpnt.exe