"""Verify optimized Tesselator produces correct results."""
import sys
import os
import json
from xml.etree import ElementTree as ET

# Import OCC.Core modules FIRST (loads OCCT shared libraries)
from OCC.Core.BRepPrimAPI import BRepPrimAPI_MakeBox, BRepPrimAPI_MakeTorus, BRepPrimAPI_MakeSphere
from OCC.Extend.DataExchange import read_step_file

# Then override Tesselator from build dir if available
_build_dir = os.environ.get("TESSELATOR_BUILD_DIR")
if _build_dir:
    sys.path.insert(0, _build_dir)
    import Tesselator
    ShapeTesselator = Tesselator.ShapeTesselator
    print(f"Using Tesselator from: {Tesselator.__file__}")
else:
    from OCC.Core.Tesselator import ShapeTesselator
    print("Using installed Tesselator")

TEST_IO = os.path.join(os.path.dirname(os.path.abspath(__file__)), "test_io")

passed = 0
failed = 0

def check(name, condition, msg=""):
    global passed, failed
    if condition:
        print(f"  PASS: {name}")
        passed += 1
    else:
        print(f"  FAIL: {name} - {msg}")
        failed += 1


# Test 1: Box
a_box = BRepPrimAPI_MakeBox(10, 20, 30).Shape()
tess = ShapeTesselator(a_box)
tess.Compute()
check("box triangle count", tess.ObjGetTriangleCount() == 12, f"got {tess.ObjGetTriangleCount()}")
check("box normal count", tess.ObjGetNormalCount() == 24, f"got {tess.ObjGetNormalCount()}")

# Test 2: Sphere deviation
a_sphere = BRepPrimAPI_MakeSphere(17.12).Shape()
tess = ShapeTesselator(a_sphere)
tess.Compute()
tc_before = tess.ObjGetTriangleCount()
dev_before = tess.GetDeviation()
new_tess = ShapeTesselator(a_sphere)
new_tess.SetDeviation(dev_before / 10)
new_tess.Compute()
check("sphere more triangles", new_tess.ObjGetTriangleCount() > tc_before)

# Test 3: Torus with edges
a_torus = BRepPrimAPI_MakeTorus(10, 4).Shape()
tess = ShapeTesselator(a_torus)
tess.Compute(compute_edges=True)
check("torus triangles > 100", tess.ObjGetTriangleCount() > 100)
check("torus normals > 100", tess.ObjGetNormalCount() > 100)

# Test 4: Bad quality
tess2 = ShapeTesselator(a_torus)
tess2.Compute(mesh_quality=40.0)
check("bad quality triangles", 10 < tess2.ObjGetTriangleCount() < 100,
      f"got {tess2.ObjGetTriangleCount()}")

# Test 5: X3D TriangleSet
a_box2 = BRepPrimAPI_MakeBox(10.0, 10.0, 10.0).Shape()
tess = ShapeTesselator(a_box2)
tess.Compute()
ts = tess.ExportShapeToX3DTriangleSet()
check("X3D starts with TriangleSet", ts.startswith("<TriangleSet"))
check("X3D contains vertex", "0 10 0" in ts)
check("X3D contains normal", "0 0 1" in ts)

# Test 6: JSON export
a_box3 = BRepPrimAPI_MakeBox(10, 20, 30).Shape()
tess = ShapeTesselator(a_box3)
tess.Compute()
json_str = tess.ExportShapeToThreejsJSONString("myshapeid")
try:
    dico = json.loads(json_str)
    arr = dico["data"]["attributes"]["position"]["array"]
    check("JSON array length", len(arr) == 36 * 3, f"got {len(arr)}")
except json.JSONDecodeError as e:
    check("JSON valid", False, str(e))

# Test 7: X3D file valid XML
tess = ShapeTesselator(a_torus)
tess.Compute()
tess.ExportShapeToX3D(os.path.join(TEST_IO, "torus.x3d"))
try:
    with open(os.path.join(TEST_IO, "torus.x3d"), "r") as f:
        ET.fromstring(f.read())
    check("X3D valid XML", True)
except ET.ParseError as e:
    check("X3D valid XML", False, str(e))

# Test 8: STEP file with edges
stp = read_step_file(os.path.join(TEST_IO, "as1_pe_203.stp"))
tess = ShapeTesselator(stp)
tess.Compute(compute_edges=True)
check("STEP file tessellated", tess.ObjGetTriangleCount() > 0)

# Test 9: Tessellate twice
tess = ShapeTesselator(a_torus)
tess.Compute()
tess.Compute()
check("tessellate twice", tess.ObjGetTriangleCount() > 100)

print(f"\nResults: {passed} passed, {failed} failed")
if failed > 0:
    sys.exit(1)
