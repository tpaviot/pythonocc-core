import os
import os.path
import time

from OCC.Core.Visualization import Tesselator

from OCC.Extend.TopologyUtils import TopologyExplorer
from OCC.Extend.DataExchange import read_step_file

# TEST 1 : one big STEP file into one single compound
# loads the step file
# load twice, not a copy/paste typo. It's because meshes are stored
# the second time, meshing time is much faster
print("TEST 1 ===")
step_file = os.path.join('..', 'demos', 'assets', 'models', 'RC_Buggy_2_front_suspension.stp')
shp = read_step_file(step_file)
shp2 = read_step_file(step_file)

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
shp3 = read_step_file(step_file)
shp4 = read_step_file(step_file)

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
