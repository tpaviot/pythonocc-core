#---------------------------------------------------------------------------
# the objective of this test is merely validating a succesful pythonocc-core
# install through `conda install pythonocc-core`
# not to be mistaken for unittests...
#---------------------------------------------------------------------------
from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox
my_box = BRepPrimAPI_MakeBox(10., 20., 30.)
my_box.Build()
assert my_box.IsDone()
