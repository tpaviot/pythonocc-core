import random
import os
import os.path
import sys
import time

from OCC.Core.STEPControl import STEPControl_Reader
from OCC.Core.IFSelect import IFSelect_RetDone, IFSelect_ItemsByEntity
from OCC.Core.Visualization import Tesselator
from OCC.Extend.TopologyUtils import TopologyExplorer

def read_step_file(filename):
    """ read the STEP file and returns a compound
    """
    print("loading STEP file... ")
    step_reader = STEPControl_Reader()
    status = step_reader.ReadFile(filename)

    if status == IFSelect_RetDone:  # check status
        failsonly = False

        ok = step_reader.TransferRoot(1)
        _nbs = step_reader.NbShapes()
        aResShape = step_reader.Shape(1)
    else:
        print("Error: can't read file.")
        sys.exit(0)
    print("done.")
    return aResShape

# TEST 1 : one big STEP file into one single compound
# loads the step file
# load twice, not a copy/paste typo. It's because meshes are stored
# the second time, meshing time is much faster
print("TEST 1 ===")
shp = read_step_file(os.path.join('..', 'examples', 'models', 'RC_Buggy_2_front_suspension.stp'))
shp2 = read_step_file(os.path.join('..', 'examples', 'models', 'RC_Buggy_2_front_suspension.stp'))

# tesselate in single thread mode
print("Tesselate in single thread mode")
t_single = Tesselator(shp)
t0 = time.monotonic()
t_single.Compute(parallel=False, mesh_quality=0.5)
t1 = time.monotonic()
delta_single = t1-t0

# tesselate in parallel thread mode
print("Tesselate in parallelized mode")
t_multi = Tesselator(shp2)
t2 = time.monotonic()
t_multi.Compute(parallel=True, mesh_quality=0.5)
t3 = time.monotonic()
delta_multi = t3 - t2

print("Test 1 Results:")
print("  * single thread runtime: %.2fs" % delta_single)
print("  * multi thread runtime: %.2fs" % delta_multi)
print("  * muti/single=%.2f%%" % (delta_multi / delta_single * 100))

# TEST 2 : other step, with a loop over each subshape
print("TEST 2 ===")
shp3 = read_step_file(os.path.join('..', 'examples', 'models', 'RC_Buggy_2_front_suspension.stp'))
shp4 = read_step_file(os.path.join('..', 'examples', 'models', 'RC_Buggy_2_front_suspension.stp'))

topo1 = TopologyExplorer(shp3)
t4 = time.monotonic()
for solid in topo1.solids():
    o = Tesselator(solid)
    o.Compute(parallel=False, mesh_quality=0.5)
t5 = time.monotonic()
delta_single = t5-t4

topo2 = TopologyExplorer(shp4)
t6 = time.monotonic()
for solid in topo2.solids():
    o = Tesselator(solid)
    o.Compute(parallel=True, mesh_quality=0.5)
t7 = time.monotonic()
delta_multi = t7 - t6

print("Test 2 Results:")
print("  * single thread runtime: %.2fs" % delta_single)
print("  * multi thread runtime: %.2fs" % delta_multi)
print("  * muti/single=%.2f%%" % (delta_multi / delta_single * 100))
