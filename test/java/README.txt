After cmake and make, you should have some ".java" files
(this will be automated by cmake using FindJava module, someday) that must be compiled and packaged:

cd ~/git/pythonocc-core/cmake-build/Unix/x86_64-MinSizeRel-64
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:`pwd`
ldconfig
javac -cp `pwd` *.java
jar cf pythonocc.jar *.class

cd ~/git/pythonocc-core/test/java
export CLASSPATH=$CLASSPATH:~/git/pythonocc-core/cmake-build/Unix/x86_64-MinSizeRel-64/pythonocc.jar
javac -cp ~/git/pythonocc-core/cmake-build/Unix/x86_64-MinSizeRel-64/pythonocc.jar TestMakeVertex.java
java TestMakeVertex