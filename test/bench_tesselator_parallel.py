import os
import os.path
import time
import subprocess

from OCC.Core.BRepAlgoAPI import BRepAlgoAPI_Fuse, BRepAlgoAPI_Common, BRepAlgoAPI_Cut
from OCC.Core.TopTools import TopTools_ListOfShape
from OCC.Core.Tesselator import ShapeTesselator
from OCC.Extend.TopologyUtils import TopologyExplorer
from OCC.Extend.DataExchange import read_step_file

# load (and download if necessary) a big step file
print("TEST 1 ===")
step_filename = "KR600_R2830-4.stp"
url = f"https://raw.githubusercontent.com/tpaviot/pythonocc-demos/master/assets/models/{step_filename}"

step_file = os.path.join("test_io", step_filename)
if not os.path.isfile(step_file):
    subprocess.run(["wget", "-O", step_file, url], check=True)

if not os.path.isfile(step_file):
    raise IOError(f"file {step_file} not found")

# TEST 1 : one big STEP file into one single compound
shp1 = read_step_file(step_file)
shp2 = read_step_file(step_file)

# tesselate in single thread mode
print("Tesselate in single thread mode")
t_single = ShapeTesselator(shp1)
t0 = time.perf_counter()
t_single.Compute(parallel=False, mesh_quality=0.5)
t1 = time.perf_counter()
delta_single = t1 - t0

# tesselate in parallel thread mode
print("Tesselate in parallelized mode")
t_multi = ShapeTesselator(shp2)
t2 = time.perf_counter()
t_multi.Compute(parallel=True, mesh_quality=0.5)
t3 = time.perf_counter()
delta_multi = t3 - t2

print("Test 1 Results:")
print("  * single thread runtime: %.2fs" % delta_single)
print("  * multi thread runtime: %.2fs" % delta_multi)
print("  * muti/single=%.2f%%" % (delta_multi / delta_single * 100))

# TEST 2 : other step, with a loop over each subshape
print("TEST 2 ===")
shp3 = read_step_file(step_file)
shp4 = read_step_file(step_file)

topo1 = TopologyExplorer(shp3)
t4 = time.perf_counter()
for solid in topo1.solids():
    o = ShapeTesselator(solid)
    o.Compute(parallel=False, mesh_quality=0.5)
t5 = time.perf_counter()
delta_single = t5 - t4

topo2 = TopologyExplorer(shp4)
t6 = time.perf_counter()
for solid in topo2.solids():
    o = ShapeTesselator(solid)
    o.Compute(parallel=True, mesh_quality=0.5)
t7 = time.perf_counter()
delta_multi = t7 - t6

print("Test 2 Results:")
print("  * single thread runtime: %.2fs" % delta_single)
print("  * multi thread runtime: %.2fs" % delta_multi)
print("  * muti/single=%.2f%%" % (delta_multi / delta_single * 100))

# Test3 - Cut
shp5 = read_step_file(step_file)
shp6 = read_step_file(os.path.join("test_io", "as1-oc-214.stp"))

# cutter

myCut1 = BRepAlgoAPI_Cut()
aLS = TopTools_ListOfShape()
aLS.Append(shp5)
aLS.Append(shp5)
aLS.Append(shp5)
aLT = TopTools_ListOfShape()
aLT.Append(shp6)
# //
# bRunParallel=BOPTest_Objects::RunParallel();
# aFuzzyValue=BOPTest_Objects::FuzzyValue();
# bNonDestructive = BOPTest_Objects::NonDestructive();
# BOPAlgo_GlueEnum aGlue = BOPTest_Objects::Glue();
# //
# if (anOp!=BOPAlgo_CUT21) {
#   pBuilder->SetArguments(aLS);
#   pBuilder->SetTools(aLT);
# }
# else {
#   pBuilder->SetArguments(aLT);
#   pBuilder->SetTools(aLS);
# }
# //
# pBuilder->SetRunParallel(bRunParallel);
myCut1.SetArguments(aLS)
myCut1.SetTools(aLT)  # shp5, shp6)

t8 = time.perf_counter()
myCut1.SetRunParallel(False)
myCut1.Build()
t9 = time.perf_counter()
myCut1.SetRunParallel(True)
myCut1.Build()
t10 = time.perf_counter()
delta_multi = t10 - t9
print("Test 2 Results:")
print("  * single thread runtime: %.2fs" % delta_single)
print("  * multi thread runtime: %.2fs" % delta_multi)
print("  * muti/single=%.2f%%" % (delta_multi / delta_single * 100))
