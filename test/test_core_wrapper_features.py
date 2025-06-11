#!/usr/bin/env python

##Copyright 2009-2016 Thomas Paviot (tpaviot@gmail.com)
##
##This file is part of pythonOCC.
##
##pythonOCC is free software: you can redistribute it and/or modify
##it under the terms of the GNU Lesser General Public License as published by
##the Free Software Foundation, either version 3 of the License, or
##(at your option) any later version.
##
##pythonOCC is distributed in the hope that it will be useful,
##but WITHOUT ANY WARRANTY; without even the implied warranty of
##MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##GNU Lesser General Public License for more details.
##
##You should have received a copy of the GNU Lesser General Public License
##along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.

from contextlib import contextmanager
import glob
import json
from math import sqrt
import importlib
import os
import pickle
from typing import Any, Iterator, List
import sys
import warnings

import OCC.Core
from OCC.Core.AIS import AIS_Manipulator
from OCC.Core.Standard import Standard_Transient
from OCC.Core.Bnd import Bnd_Box
from OCC.Core.BRepExtrema import BRepExtrema_ShapeProximity
from OCC.Core.BRepAdaptor import BRepAdaptor_Curve, BRepAdaptor_Surface
from OCC.Core.BRepClass import BRepClass_FaceExplorer, BRepClass_Edge
from OCC.Core.BRepOffsetAPI import BRepOffsetAPI_Sewing
from OCC.Core.BRepBndLib import brepbndlib
from OCC.Core.BRepMesh import BRepMesh_IncrementalMesh
from OCC.Core.BRepPrimAPI import (
    BRepPrimAPI_MakeBox,
    BRepPrimAPI_MakeCylinder,
    BRepPrimAPI_MakeSphere,
)
from OCC.Core.BRepBuilderAPI import (
    BRepBuilderAPI_MakeVertex,
    BRepBuilderAPI_MakeEdge,
    BRepBuilderAPI_Sewing,
)
from OCC.Core.BRepTools import BRepTools_ShapeSet, breptools
from OCC.Core.gp import (
    gp_Pnt,
    gp_Vec,
    gp_Pnt2d,
    gp_Lin,
    gp_Dir,
    gp_Ax1,
    gp_Ax2,
    gp_Quaternion,
    gp_QuaternionSLerp,
    gp_XYZ,
    gp_Mat,
    gp,
    gp_OX,
)
from OCC.Core.math import math_Matrix
from OCC.Core.GC import GC_MakeSegment
from OCC.Core.STEPControl import (
    STEPControl_Writer,
    STEPControl_AsIs,
    STEPControl_Reader,
)
from OCC.Core.Interface import Interface_Static
from OCC.Core.GCE2d import GCE2d_MakeSegment
from OCC.Core.ShapeFix import ShapeFix_Solid, ShapeFix_Wire
from OCC.Core.TopoDS import (
    TopoDS_Compound,
    TopoDS_Builder,
    TopoDS_Edge,
    TopoDS_Vertex,
    TopoDS_Shape,
)
from OCC.Core.TColStd import TColStd_Array1OfReal, TColStd_Array1OfInteger
from OCC.Core.TColgp import TColgp_Array1OfPnt
from OCC.Core.TDF import TDF_LabelSequence
from OCC.Core.TopExp import TopExp_Explorer
from OCC.Core.TopAbs import TopAbs_FACE, TopAbs_Orientation
from OCC.Core.GProp import GProp_GProps
from OCC.Core.BRepGProp import brepgprop
from OCC.Core.BRepClass import BRepClass_FaceClassifier
from OCC.Core.ShapeAnalysis import ShapeAnalysis_Curve
from OCC.Core.BRep import BRep_Builder
from OCC.Core.ChFiDS import ChFiDS_ChamfSpine
from OCC.Core.Graphic3d import Graphic3d_RenderingParams
from OCC.Core.BRepCheck import (
    BRepCheck_ListIteratorOfListOfStatus,
    BRepCheck_ListOfStatus,
    BRepCheck_Multiple3DCurve,
    BRepCheck_EmptyWire,
)
from OCC.Core.Geom import Geom_Curve, Geom_Line, Geom_BSplineCurve
from OCC.Core.BRep import BRep_Tool
from OCC.Core.HLRBRep import HLRBRep_Algo, HLRBRep_HLRToShape
from OCC.Core.HLRAlgo import HLRAlgo_EdgeIterator, HLRAlgo_EdgeStatus, HLRAlgo_Projector
from OCC.Core.TopTools import (
    TopTools_HArray1OfShape,
    TopTools_HArray2OfShape,
    TopTools_HSequenceOfShape,
    TopTools_ListOfShape,
    TopTools_ListIteratorOfListOfShape,
)
from OCC.Core.TDF import TDF_LabelNode
from OCC.Core.Quantity import Quantity_NameOfColor, Quantity_Color
from OCC.Core.Exception import (
    methodnotwrapped,
    classnotwrapped,
    MethodNotWrappedError,
    ClassNotWrappedError,
)
from OCC.Core.TDocStd import TDocStd_Document
from OCC.Core.XCAFDoc import XCAFDoc_DocumentTool
from OCC.Core.TDataStd import TDataStd_Name
from OCC.Core.STEPCAFControl import STEPCAFControl_Writer
from OCC.Core.IGESCAFControl import IGESCAFControl_Reader
from OCC.Core.IFSelect import IFSelect_RetDone
from OCC.Core.ShapeAnalysis import ShapeAnalysis_FreeBounds
from OCC.Core.APIHeaderSection import APIHeaderSection_MakeHeader
from OCC.Core.TCollection import TCollection_HAsciiString
from OCC.Core.Interface import Interface_HArray1OfHAsciiString

from OCC.Extend.TopologyUtils import TopologyExplorer

import pytest


@contextmanager
def assert_warns_deprecated() -> Iterator[Any]:
    with warnings.catch_warnings(record=True) as w:
        warnings.simplefilter("always")
        yield w
        # Verify some things
        if not issubclass(w[-1].category, DeprecationWarning):
            raise AssertionError("Wrong exception type")
        if "deprecated" not in str(w[-1].message):
            raise AssertionError("deprecated string not in message")


def test_hash() -> None:
    s = Standard_Transient()
    assert id(s) != hash(s)


def test_const_Standard_Real_byref() -> None:
    """
    Test wrapper for const Standard_Real &
    """
    t = TColStd_Array1OfReal(1, 10)
    t.SetValue(3, 3.14)
    assert t.Value(3) == 3.14


def test_const_Standard_Integer_byref() -> None:
    """
    Test wrapper for const Standard_Integer &
    """
    t = TColStd_Array1OfInteger(1, 2)
    t.SetValue(1, 3)
    t.SetValue(2, 33)
    assert t.Value(1) == 3
    assert t.Value(2) == 33


def test_handle_standard_transient_copy() -> None:
    def evil_function(t: Standard_Transient) -> Standard_Transient:
        handle = Standard_Transient(t)
        return handle

    t = Standard_Transient()
    assert t is not None
    assert evil_function(t) is not None


def test_list() -> None:
    """
    Test python lists features
    """
    P1 = gp_Pnt(1, 2, 3)
    P2 = gp_Pnt(2, 3, 4)
    P3 = gp_Pnt(5, 7, 8)
    list_of_points = [P1, P2]
    assert P1 in list_of_points
    assert P3 not in list_of_points
    assert list_of_points.index(P1) == 0
    assert list_of_points.index(P2) == 1
    # Do the same for Vertices (TopoDS_Shape has
    # a HashCode() method overloaded
    V1 = BRepBuilderAPI_MakeVertex(P1).Vertex()
    V2 = BRepBuilderAPI_MakeVertex(P2).Vertex()
    V3 = BRepBuilderAPI_MakeVertex(P3).Vertex()
    list_of_vertices = [V1, V2]
    assert V1 in list_of_vertices
    assert V3 not in list_of_vertices
    # index test()
    assert list_of_vertices.index(V1) == 0
    assert list_of_vertices.index(V2) == 1
    # reverse() test
    list_of_vertices.reverse()
    assert list_of_vertices.index(V1) == 1
    assert list_of_vertices.index(V2) == 0


def test_dict() -> None:
    """
    Test python dict features
    """
    P1 = gp_Pnt(1, 2, 3)
    P2 = gp_Pnt(2, 3, 4)
    d = {P1: "P1", P2: "P2"}
    assert d[P1] == "P1"
    assert d[P2] == "P2"


def test_topology() -> None:
    """
    Checks the Topology.py utility script.
    """

    def get_shape() -> TopoDS_Shape:
        shape = BRepPrimAPI_MakeBox(10.0, 10.0, 10.0).Shape()
        assert not shape.IsNull()
        return shape

    returned_shape = get_shape()
    assert not returned_shape.IsNull()


def test_gp_Vec_operators() -> None:
    """
    Test gp_Vec division by a float number or an integer
    This test fails on py3k with SWIG versions older than 3.0.8
    SWIG 3.0.9 fixes this issue.
    See https://github.com/tpaviot/pythonocc-core/issues/257
    """
    # division by a float
    v1 = gp_Vec(2.0, 2.0, 2.0)
    v2 = v1 / 2.0
    assert v2.Magnitude() == sqrt(3.0)
    # division by an integer
    v3 = gp_Vec(4, 4, 4)
    v4 = v3 / 2
    assert (v4.X(), v4.Y(), v4.Z()) == (2, 2, 2)
    # adding two gp_Vec
    v5 = gp_Vec(1, 2, 3) + gp_Vec(4, 5, 6)
    assert (v5.X(), v5.Y(), v5.Z()) == (5, 7, 9)
    # subtracting two gp_Vec
    v6 = gp_Vec(1, 2, 3) - gp_Vec(6, 5, 4)
    assert (v6.X(), v6.Y(), v6.Z()) == (-5, -3, -1)


def test_gp_Quaternion() -> None:
    """
    Test Interpolate method of qp_QuaternionSLerp.
    This method takes a by ref parameter q.
    """
    vX = gp_Vec(12, 0, 0)
    vY = gp_Vec(0, 12, 0)

    q = gp_Quaternion()
    q1 = gp_Quaternion(vX, vX)
    q2 = gp_Quaternion(vX, vY)
    interp = gp_QuaternionSLerp(q1, q2)
    interp.Init(q1, q2)
    for i in range(10):
        i__ = i / 10.0
        interp.Interpolate(i__, q)
        if i == 0:
            assert q.X() == 0.0
            assert q.Y() == 0.0
            assert q.Z() == 0.0
            assert q.W() == 1.0
        else:
            assert q.X() == 0.0
            assert q.Y() == 0.0
            assert q.Z() > 0.0
            assert q.W() < 1.0


def test_traverse_box_topology() -> None:
    """
    Test traversing faces for a box. Assert 6 faces are returned
    """
    box_shp = BRepPrimAPI_MakeBox(10.0, 20.0, 30.0).Shape()

    def get_faces(shp) -> List[TopoDS_Shape]:
        ex = TopExp_Explorer(shp, TopAbs_FACE)
        seq = []
        while ex.More():
            s1 = ex.Current()
            seq.append(s1)
            ex.Next()
        return seq

    faces = get_faces(box_shp)
    assert len(faces) == 6
    for f in faces:
        assert not f.IsNull()


def test_static_method() -> None:
    """
    Test wrapper for static methods.

    ... snippet from the SWIG documentation ...

    Static class members present a special problem for Python.
    Prior to Python-2.2, Python classes had no support for static methods
    and no version of Python supports static member variables in a manner
    that
    SWIG can utilize. Therefore, SWIG generates wrappers that try to work
    around
    some of these issues. To illustrate, suppose you have a class like
    this:

    class Spam {
    public:
       static void foo();
       static int bar;
    };
    In Python, the static member can be access in three different ways:

    >>> example.Spam_foo()    # Spam::foo()
    >>> s = example.Spam()
    >>> s.foo()               # Spam::foo() via an instance
    >>> example.Spam.foo()    # Spam::foo(). Python-2.2 only

    ... end snippet ...

    In order that SWIG properly wraps static methods, the keyword 'static'
    must be included in the interface file. For instance, in the
    Interface.i file, the following line:

    static Standard_Boolean SetCVal(const char * name, const char * val);

    makes possible to use the method as:
    >>> from OCC.Core.Interface import *
    >>> Interface_Static_SetCVal("write.step.schema","AP203")
    """
    # needs to be inited otherwise the following does not work
    STEPControl_Writer()
    # Note : static methods are wrapped with lowercase convention
    # so SetCVal can be accessed with setcval
    r = Interface_Static.SetCVal("write.step.schema", "AP203")
    assert r == 1
    l = Interface_Static.CVal("write.step.schema")
    assert l == "AP203"


def test_ft1() -> None:
    """Test: Standard_Integer & by reference transformator"""
    p = gp_Pnt(1, 2, 3.2)
    p_coord = p.Coord()
    assert p_coord[0] == 1.0
    assert p_coord[1] == 2.0
    assert p_coord[2] == 3.2


def test_Standard_Real_by_ref_passed_returned() -> None:
    """
    Check getters and setters for method that take/return
    Standard_Real by reference. Ref github Issue #710
    """
    # create a 2*2 matrix
    #     | -1.    -2. |
    # m = |  4.    5.5 |
    # lower indices are 0, to comply with python list indexing
    mat = math_Matrix(0, 1, 0, 1)
    mat.SetValue(0, 0, -1)
    mat.SetValue(0, 1, -2)
    mat.SetValue(1, 0, 4)
    mat.SetValue(1, 1, 5.5)
    # the returned value should be the same
    assert mat.GetValue(0, 0) == -1
    assert mat.GetValue(0, 1) == -2
    assert mat.GetValue(1, 0) == 4
    assert mat.GetValue(1, 1) == 5.5


def test_Standard_Integer_by_ref_passed_returned() -> None:
    """
    Checks the Standard_Integer & byreference return parameter
    """
    sfs = ShapeFix_Solid()
    sfs.SetFixShellMode(5)
    assert sfs.GetFixShellMode() == 5


def test_Standard_Boolean_by_ref_passed_returned() -> None:
    """
    Checks the Standard_Boolean & byreference return parameter
    """
    sfw = ShapeFix_Wire()
    sfw.SetModifyGeometryMode(True)
    assert sfw.GetModifyGeometryMode()
    sfw.SetModifyGeometryMode(False)
    assert not sfw.GetModifyGeometryMode()


def test_TopoDS_byref_arguments() -> None:
    """
    Test byref pass arguments to TopoDS
    """
    cyl1 = BRepPrimAPI_MakeCylinder(10.0, 10.0).Shape()
    cyl2 = BRepPrimAPI_MakeCylinder(100.0, 50.0).Shape()
    c = TopoDS_Compound()
    assert c.IsNull()
    bb = TopoDS_Builder()
    bb.MakeCompound(c)
    for child in [cyl1, cyl2]:
        bb.Add(c, child)
    assert not c.IsNull()


def test_Standard_Boolean_byref() -> None:
    """
    Test byref returned standard_boolean
    """
    cs = ChFiDS_ChamfSpine()
    cs.SetDistAngle(1.0, 45)
    assert cs.GetDistAngle() == (1.0, 45.0)


def test_pickle_topods_shape_to_from() -> None:
    """
    Checks if the pickle python module works for TopoDS_Shapes
    """
    # Create the shape
    box_shape = BRepPrimAPI_MakeBox(100, 200, 300).Shape()
    shp_dump = pickle.dumps(box_shape)
    # file to dump to/from
    filename = os.path.join(".", "test_io", "box_shape_generated.brep")
    # write to file
    with open(filename, "wb") as output:
        output.write(shp_dump)
    assert os.path.isfile(filename)
    # load from file
    with open(filename, "rb") as dump_from_file:
        pickled_shape = pickle.load(dump_from_file)
    assert not pickled_shape.IsNull()


def test_sub_class() -> None:
    """Test: subclass"""
    # Checks that OCC objects can be subclassed, and passed as parameters.
    # In this test, we create
    # a MyPoint and MyVec class, inheriting from gp_Pnt and gp_Vec.

    class MyPoint(gp_Pnt):
        def __init__(self, *kargs: float) -> None:
            gp_Pnt.__init__(self, *kargs)
            self.x = 4

        def get_x(self) -> int:
            return self.x

    class MyVec(gp_Vec):
        def __init__(self, *kargs: float) -> None:
            gp_Vec.__init__(self, *kargs)
            self._an_attribute = "something"

        def get_attribute(self) -> Any:
            return self._an_attribute

    # Create the first point
    point1 = MyPoint(1.0, 2.0, 3.0)
    point1_coord = point1.Coord()
    assert point1_coord[0] == 1.0
    assert point1_coord[1] == 2.0
    assert point1_coord[2] == 3.0
    assert point1.get_x() == 4.0
    # Create the second point
    point2 = MyPoint(2.0, 2.0, 3.0)
    # Then create the vec from these two points
    # The magnitude of the vector should equal 1.0
    vec = MyVec(point1, point2)
    assert vec.Magnitude() == 1.0
    assert vec.get_attribute() == "something"


def test_protected_constructor() -> None:
    """Test: protected constructor"""
    # 1st, class with no subclass
    tds_builder = TopoDS_Builder()
    assert hasattr(tds_builder, "MakeCompound")


def test_auto_import_of_dependent_modules() -> None:
    """Test: automatic import of dependent modules"""
    returned_object = GCE2d_MakeSegment(gp_Pnt2d(1, 1), gp_Pnt2d(3, 4)).Value()
    # for this unittest, don't use the issinstance() function,
    # since the OCC.Geom2d module
    # is *not* manually imported
    returned_object_type = f"{type(returned_object)}"
    assert returned_object_type == "<class 'OCC.Core.Geom2d.Geom2d_TrimmedCurve'>"


def test_hash_eq_operator() -> None:
    """test that the == wrapper is ok"""
    # test Standard
    s = Standard_Transient()
    s2 = Standard_Transient()
    assert s != s2
    assert s == s
    # test list.index, that uses __eq__ method
    p1 = gp_Pnt(0.0, 0.0, 0.0)
    line = gp_Lin(p1, gp_Dir(1.0, 0.0, 0.0))
    items = [p1, line]
    res = items.index(line)
    assert res == 1.0


def test_eq_operator() -> None:
    shape_1 = BRepPrimAPI_MakeBox(10, 20, 30).Shape()
    shape_2 = BRepPrimAPI_MakeBox(10, 20, 30).Shape()
    assert shape_1 != shape_2
    assert shape_1 == shape_1
    assert shape_1 != "some_string"


def test_neq_operator() -> None:
    # test Standard
    s = Standard_Transient()
    s2 = Standard_Transient()
    assert s != s2
    assert not s != s
    shape_1 = BRepPrimAPI_MakeBox(10, 20, 30).Shape()
    shape_2 = BRepPrimAPI_MakeBox(10, 20, 30).Shape()
    assert shape_1 != shape_2
    assert not shape_1 != shape_1
    assert shape_1 != "some_string"


def test_tshape_hash_operator() -> None:
    shape_1 = BRepPrimAPI_MakeBox(10, 20, 30).Shape()
    shape_2 = BRepPrimAPI_MakeBox(10, 20, 30).Shape()
    # Create a shape that differs from shape_2, but has the same TShape
    shape_3 = shape_2.Reversed()
    assert hash(shape_1.TShape()) == hash(shape_1.TShape())
    assert not hash(shape_1.TShape()) == hash(shape_2.TShape())
    assert hash(shape_2.TShape()) == hash(shape_3.TShape())


def test_tshape_eq_operator() -> None:
    shape_1 = BRepPrimAPI_MakeBox(10, 20, 30).Shape()
    shape_2 = BRepPrimAPI_MakeBox(10, 20, 30).Shape()
    # Create a shape that differs from shape_2, but has the same TShape
    shape_3 = shape_2.Reversed()
    assert shape_1.TShape() == shape_1.TShape()
    assert not shape_1.TShape() == shape_2.TShape()
    assert shape_2.TShape() == shape_3.TShape()
    assert not shape_1.TShape() == "some_string"


def test_tshape_neq_operator() -> None:
    shape_1 = BRepPrimAPI_MakeBox(10, 20, 30).Shape()
    shape_2 = BRepPrimAPI_MakeBox(10, 20, 30).Shape()
    # Create a shape that differs from shape_2, but has the same TShape
    shape_3 = shape_2.Reversed()
    assert not shape_1.TShape() != shape_1.TShape()
    assert shape_1.TShape() != shape_2.TShape()
    assert not shape_2.TShape() != shape_3.TShape()
    assert shape_1.TShape() != "some_string"


def test_inherit_topods_shape() -> None:
    class InheritEdge(TopoDS_Edge):
        def __init__(self, edge: TopoDS_Edge) -> None:
            # following constructor creates an empty TopoDS_Edge
            super(InheritEdge, self).__init__()
            # we need to copy the base shape using the following three
            # lines
            assert self.IsNull()
            self.TShape(edge.TShape())
            self.Location(edge.Location())
            self.Orientation(edge.Orientation())
            assert not self.IsNull()

    # create a line, compute its length
    base_edge = BRepBuilderAPI_MakeEdge(
        gp_Pnt(100.0, 0.0, 0.0), gp_Pnt(150.0, 0.0, 0.0)
    ).Edge()
    inherited_edge = InheritEdge(base_edge)
    g1 = GProp_GProps()
    brepgprop.LinearProperties(inherited_edge, g1)
    length = g1.Mass()
    assert length == 50.0


def test_default_constructor_DEFINE_STANDARD_ALLOC() -> None:
    """OCE classes the defines standard alllocator can be instantiated
    if they're not abstract nor define any protected or private
    constructor"""
    b = BRep_Builder()
    assert isinstance(b, BRep_Builder)
    t = TopoDS_Builder()
    assert isinstance(t, TopoDS_Builder)
    s = ShapeAnalysis_Curve()
    assert isinstance(s, ShapeAnalysis_Curve)


def test_memory_handle_getobject() -> None:
    """
    See https://github.com/tpaviot/pythonocc-generator/pull/24
    This commit tries to fix the issue tpaviot/pythonocc-core#292.
    When we got a handle from ann API function and called GetObject()
    the lifetime of the object was determined only by the handle.
    This lead to crashes, when only a reference to the object was stored.
    The commit registers the handle with its object to prevent premature
    destruction.
    This test case ensures everything is ok. Following lines used to crash
    on pythonocc-0.16.5
    """
    a = gp_Pnt(0.0, 0.0, 0.0)
    b = gp_Pnt(100.0, 100.0, 100.0)
    line3 = GC_MakeSegment(a, b).Value()
    assert line3.FirstParameter() == 0.0
    assert GC_MakeSegment(a, b).Value().FirstParameter() == 0.0
    assert b.IsEqual(line3.EndPoint(), 0.01)
    assert b.IsEqual(GC_MakeSegment(a, b).Value().EndPoint(), 0.01)


def test_local_properties() -> None:
    """Get and modify class local properties"""
    graphic_params = Graphic3d_RenderingParams()
    assert graphic_params.RaytracingDepth == 3
    graphic_params.RaytracingDepth = 5
    assert graphic_params.RaytracingDepth == 5


def test_repr_overload() -> None:
    """Test if repr string is properly returned"""
    p = gp_Pnt(1, 2, 3)
    assert repr(p) == "<class 'gp_Pnt'>"
    empty_shape = TopoDS_Shape()
    assert repr(empty_shape) == "<class 'TopoDS_Shape': Null>"
    shp = BRepPrimAPI_MakeBox(10, 20, 30).Shape()
    assert repr(shp) == "<class 'TopoDS_Solid'>"


def test_downcast_curve() -> None:
    """Test if a GeomCurve can be DownCasted to a GeomLine"""
    edge = BRepBuilderAPI_MakeEdge(gp_Pnt(0, 0, 0), gp_Pnt(1, 0, 0)).Edge()
    curve, _, _ = BRep_Tool.Curve(edge)
    assert isinstance(curve, Geom_Curve)
    # The edge is internally a line, so we should be able to downcast it
    line = Geom_Line.DownCast(curve)
    assert isinstance(line, Geom_Curve)
    # Hence, it should not be possible to downcast it as a B-Spline curve
    if sys.version_info.major == 3 and sys.version_info.minor < 12:
        with pytest.raises(SystemError):
            Geom_BSplineCurve.DownCast(curve)


def test_return_enum() -> None:
    """Check that returned enums are properly handled, whether they're returned
    by reference or not. To check that point, we use the BRepCheck_ListOfStatus class,
    where methods take and return BRepCheck_Status values
    """
    los1 = BRepCheck_ListOfStatus()
    los1.Append(BRepCheck_Multiple3DCurve)
    los1.Append(BRepCheck_EmptyWire)
    assert los1.First() == BRepCheck_Multiple3DCurve
    assert los1.Last() == BRepCheck_EmptyWire
    # then check with an iterator
    los2 = BRepCheck_ListOfStatus()
    los2.Append(BRepCheck_Multiple3DCurve)
    los2.Append(BRepCheck_EmptyWire)
    it = BRepCheck_ListIteratorOfListOfStatus(los2)
    while it.More():
        assert isinstance(it.Value(), int)
        it.Next()


def test_array_iterator() -> None:
    P0 = gp_Pnt(1, 2, 3)
    list_of_points = TColgp_Array1OfPnt(5, 8)
    assert len(list_of_points) == 4

    # set item
    list_of_points[1] = P0

    # then get item
    assert list_of_points[1].Coord() == (1.0, 2.0, 3.0)
    with pytest.raises(IndexError):
        list_of_points[4]
    # iterator creation
    it = iter(list_of_points)
    next(it)

    # test loop over iterable
    for pnt in list_of_points:
        assert isinstance(pnt, gp_Pnt)


def test_repr_for_null_TopoDS_Shape() -> None:
    # create null vertex and shape
    v = TopoDS_Vertex()
    assert "Null" in repr(v)
    s = TopoDS_Shape()
    assert "Null" in repr(s)


def test_in_place_operators() -> None:
    # operator +=
    a = gp_XYZ(1.0, 2.0, 3.0)
    assert a.X() == 1.0
    assert a.Y() == 2.0
    assert a.Z() == 3.0
    a += gp_XYZ(4.0, 5.0, 6.0)
    assert a.X() == 5.0
    assert a.Y() == 7.0
    assert a.Z() == 9.0
    # operator *= with a scalar
    b1 = gp_XYZ(2.0, 4.0, 5.0)
    assert b1.X() == 2.0
    assert b1.Y() == 4.0
    assert b1.Z() == 5.0
    b1 *= 2
    assert b1.X() == 4.0
    assert b1.Y() == 8.0
    assert b1.Z() == 10.0
    # operator *= with a gp_XYZ
    b2 = gp_XYZ(4.0, 5.0, 6.0)
    assert b2.X() == 4.0
    assert b2.Y() == 5.0
    assert b2.Z() == 6.0
    b2 *= gp_XYZ(3.0, 6.0, 7.0)
    assert b2.X() == 12.0
    assert b2.Y() == 30.0
    assert b2.Z() == 42.0
    # operator *= with a gp_Mat
    b3 = gp_XYZ(1.0, 2.0, 3.0)
    assert b3.X() == 1.0
    assert b3.Y() == 2.0
    assert b3.Z() == 3.0
    m_ident = gp_Mat()
    m_ident.SetIdentity()
    b3 *= m_ident
    assert b3.X() == 1.0
    assert b3.Y() == 2.0
    assert b3.Z() == 3.0
    # operator -=
    c = gp_XYZ(3.0, 2.0, 1.0)
    assert c.X() == 3.0
    assert c.Y() == 2.0
    assert c.Z() == 1.0
    c -= gp_XYZ(1.0, 0.5, 1.5)
    assert c.X() == 2.0
    assert c.Y() == 1.5
    assert c.Z() == -0.5
    # operator /=
    d = gp_XYZ(12.0, 14.0, 18.0)
    assert d.X() == 12.0
    assert d.Y() == 14.0
    assert d.Z() == 18.0
    d /= 2.0
    assert d.X() == 6.0
    assert d.Y() == 7.0
    assert d.Z() == 9.0


def test_shape_conversion_as_py_none() -> None:
    """see issue #600 and PR #614
    a null topods_shape should be returned as Py_None by the TopoDS transformer
    the following test case returns a null topods_shape
    """
    box = BRepPrimAPI_MakeBox(1.0, 1.0, 1.0).Shape()
    hlr = HLRBRep_Algo()
    hlr.Add(box)
    projector = HLRAlgo_Projector(gp_Ax2(gp_Pnt(), gp_Dir(-1.75, 1.1, 5)))
    hlr.Projector(projector)
    hlr.Update()
    hlr.Hide()
    hlr_shapes = HLRBRep_HLRToShape(hlr)
    visible_smooth_edges = hlr_shapes.Rg1LineVCompound()
    assert visible_smooth_edges is None


def test_Dump() -> None:
    """some objects can be serialized to a string"""
    math_matrix = math_Matrix(1, 2, 3, 4)
    serialized_matrix = math_matrix.Dump()
    # should output
    expected_output = "math_Matrix of RowNumber = 2 and ColNumber = 2\nmath_Matrix ( 1, 3 ) = 0\nmath_Matrix ( 1, 4 ) = 0\nmath_Matrix ( 2, 3 ) = 0\nmath_Matrix ( 2, 4 ) = 0\n"
    assert expected_output == serialized_matrix


def test_DumpJson() -> None:
    """Since opencascade 7x, some objects can be serialized to json"""
    # create a sphere with a radius of 10.
    sph = BRepPrimAPI_MakeSphere(10.0).Shape()
    # compute the Bnd box for this sphere
    bnd_box = Bnd_Box()
    brepbndlib.Add(sph, bnd_box)
    # check the result
    corner_min = bnd_box.CornerMin()
    assert [
        round(corner_min.X(), 3),
        round(corner_min.Y(), 3),
        round(corner_min.Z(), 3),
    ] == [-10.0, -10.0, -10.0]

    # check dump json export is working
    json_string = bnd_box.DumpJson()
    # try to  the output string
    json_imported_dict = json.loads(json_string)
    assert json_imported_dict["CornerMin"] == [-10, -10, -10]
    assert json_imported_dict["CornerMax"] == [10, 10, 10]


def test_ImportFromJson() -> None:
    """Since opencascade 7x, some objects can be serialized to json"""
    # create a sphere with a radius of 10.
    p1 = gp_Pnt(1.0, 3.14, -5)
    p2 = gp_Pnt()
    p2.InitFromJson(p1.DumpJson())
    assert p2.X() == 1.0
    assert p2.Y() == 3.14
    assert p2.Z() == -5


def test_json_pickle() -> None:
    point = gp_Pnt(-1.0, 0.414, 7.88)
    dmp = pickle.dumps(point)
    res = pickle.loads(dmp)
    assert res.X() == -1.0
    assert res.Y() == 0.414
    assert res.Z() == 7.88


def test_harray1_harray2_hsequence() -> None:
    """Check that special wrappers for harray1, harray2 and hsequence.
    Only check that related classes can be instantiated.
    """
    TopTools_HArray1OfShape(0, 3)
    TopTools_HArray2OfShape(0, 3, 0, 3)
    TopTools_HSequenceOfShape()


def test_NCollection_List() -> None:
    """Check that python proxy for NCollection_List is ok"""
    list_of_shapes = TopTools_ListOfShape()
    shp1 = BRepPrimAPI_MakeBox(10, 20, 30).Shape()
    shp2 = BRepPrimAPI_MakeBox(20, 30, 40).Shape()
    list_of_shapes.Append(shp1)
    list_of_shapes.Append(shp2)
    assert list_of_shapes.Size() == 2
    assert len(list_of_shapes) == 2
    list_of_shapes.RemoveFirst()
    assert len(list_of_shapes) == 1


def test_NCollection_Sequence() -> None:
    """Check that python proxy for NCollection_Sequence is ok"""
    tdf_label_sequence = TDF_LabelSequence()
    assert tdf_label_sequence.Size() == 0
    assert len(tdf_label_sequence) == 0


def test_NCollection_Datamap_extension() -> None:
    """NCollection_DataMap class adds a Keys() method that return keys in a Python List"""
    box1 = BRepPrimAPI_MakeBox(gp_Pnt(0, 0, 0), gp_Pnt(20, 20, 20)).Shape()
    box2 = BRepPrimAPI_MakeBox(gp_Pnt(10, 10, 10), gp_Pnt(30, 30, 30)).Shape()

    # Create meshes for the proximity algorithm
    deflection = 1e-3
    mesher1 = BRepMesh_IncrementalMesh(box1, deflection)
    mesher2 = BRepMesh_IncrementalMesh(box2, deflection)
    mesher1.Perform()
    mesher2.Perform()

    # Perform shape proximity check
    tolerance = 0.1
    isect_test = BRepExtrema_ShapeProximity(box1, box2, tolerance)
    isect_test.Perform()

    # Get intersect faces from Shape1
    overlaps1 = isect_test.OverlapSubShapes1()
    face_indices1 = overlaps1.Keys()
    assert face_indices1 == [1, 3, 5]


def test_class_not_wrapped_exception() -> None:
    """checks that calling a non wrapped class raises
    an ClassNotWrapped exception
    """

    @classnotwrapped
    class TestNotWrapped:
        pass

    with pytest.raises(ClassNotWrappedError):
        TestNotWrapped()

    # now check with some non wrapped classes/methods from occt
    # TDF_LabelNode is excluded from the wrapper.
    # I don't remember why but that's not the point
    with pytest.raises(ClassNotWrappedError):
        TDF_LabelNode()


def test_method_not_wrapped_exception() -> None:
    """checks that calling a non wrapped class raises
    an ClassNotWrapped exception
    """

    class TestClass:
        def meth1(self) -> None:
            pass  # does not raise any exception

        @methodnotwrapped
        def meth2(self) -> None:
            pass  # calling this method will raise an exception

    a = TestClass()
    a.meth1()
    with pytest.raises(MethodNotWrappedError):
        a.meth2()
    # test with OCC
    m = AIS_Manipulator()
    with pytest.raises(MethodNotWrappedError):
        m.TransformBehavior()


def test_import_all_modules() -> None:
    """try to import all modules, and look for linking errors
    or syntax errors in the pytho ninterface generated by SWIG
    """
    pythonocc_core_path = OCC.Core.__path__[0]
    available_core_modules = glob.glob(os.path.join(pythonocc_core_path, "*.py"))
    nb_available_modules = len(available_core_modules)
    # don't know the exact number of modules, it's around 305 or 306
    assert nb_available_modules > 300

    # try to import the module
    for core_module in available_core_modules:
        module_name = os.path.basename(core_module).split(".")[0]
        importlib.import_module(f"OCC.Core.{module_name}")


def test_aliases() -> None:
    """some classes are defined in c++ as typedef, i.e. they are only
    aliases, e.g. BRepOffsetAPI_Sewing is an alias for BRepBuilderAPI_Sewing
    """
    sewing_1 = BRepOffsetAPI_Sewing()
    sewing_2 = BRepBuilderAPI_Sewing()


def test_Standard_Type() -> None:
    """test that Standard_Type returns the correct type name"""
    edge = BRepBuilderAPI_MakeEdge(gp_Pnt(0, 0, 0), gp_Pnt(1, 0, 0)).Edge()
    curve, _, _ = BRep_Tool.Curve(edge)
    line = Geom_Line.DownCast(curve)
    assert line.DynamicType().Name() == "Geom_Line"


def test_BRepClass_FaceClassifier() -> None:
    """ensure BRepClass_FaceClassifier can be instantiated"""
    bfc = BRepClass_FaceClassifier()
    assert isinstance(bfc, BRepClass_FaceClassifier)


def test_wrap_enum() -> None:
    """check that enum integer values match c++ name"""
    red = Quantity_Color(Quantity_NameOfColor.Quantity_NOC_RED)
    assert red.Red() == 1.0
    assert red.Green() == 0.0
    assert red.Blue() == 0.0
    green = Quantity_Color(Quantity_NameOfColor.Quantity_NOC_GREEN)
    assert green.Red() == 0.0
    assert green.Green() == 1.0
    assert green.Blue() == 0.0
    blue = Quantity_Color(Quantity_NameOfColor.Quantity_NOC_BLUE)
    assert blue.Red() == 0.0
    assert blue.Green() == 0.0
    assert blue.Blue() == 1.0
    white = Quantity_Color(Quantity_NameOfColor.Quantity_NOC_WHITE)
    assert white.Red() == 1.0
    assert white.Green() == 1.0
    assert white.Blue() == 1.0


def test_topabs_orientation_byref():
    # see Issue https://github.com/tpaviot/pythonocc-core/issues/1038
    box = BRepPrimAPI_MakeBox(10, 20, 30).Shape()
    box_face = list(TopologyExplorer(box).faces())[0]

    facetopo = BRepClass_FaceExplorer(box_face)
    facetopo.InitWires()  # get ready to explore wires/loops of this face

    edge_1 = BRepClass_Edge()
    edge_2 = BRepClass_Edge()
    edge_3 = BRepClass_Edge()
    edge_4 = BRepClass_Edge()

    facetopo.InitEdges()
    topabs_ori_1 = facetopo.CurrentEdge(edge_1)
    facetopo.NextEdge()
    topabs_ori_2 = facetopo.CurrentEdge(edge_2)
    facetopo.NextEdge()
    topabs_ori_3 = facetopo.CurrentEdge(edge_3)
    facetopo.NextEdge()
    topabs_ori_4 = facetopo.CurrentEdge(edge_4)
    assert topabs_ori_1 == TopAbs_Orientation.TopAbs_REVERSED
    assert topabs_ori_2 == TopAbs_Orientation.TopAbs_REVERSED
    assert topabs_ori_3 == TopAbs_Orientation.TopAbs_FORWARD
    assert topabs_ori_4 == TopAbs_Orientation.TopAbs_FORWARD


def test_Standard_ShortReal_and_Standard_Real_returned_by_reference():
    """the HLRAlgo_EdgeIterator.Visible returns both Standar_Real and Standard_ShortReal
    by references"""
    start = 1.0  # Standard_Real
    tol_start = 2  # Standard_ShortReal
    end = 3.0  # Standard_Real
    tol_end = 4.0  # Standard_ShortReal

    hlralgo_edge_status = HLRAlgo_EdgeStatus(start, tol_start, end, tol_end)
    hlr_edg_it = HLRAlgo_EdgeIterator()
    hlr_edg_it.InitVisible(hlralgo_edge_status)

    # visible should return both 4 floats and doubles
    assert hlr_edg_it.Visible() == (start, tol_start, end, tol_end)


def test_deprecated_static_functions():
    """since pythonocc-core 7.7.1, static functions are not wrapped anymore by a free function.
    e.g., calling gp.OX() should be preferred to gp_OX()"""
    with pytest.warns(DeprecationWarning):
        gp_OX()
    assert isinstance(gp.OX(), gp_Ax1)


def test_wrap_extendedstring_as_pyunicodestring():
    """not necessary anymore to instanciate a TCollection_ExtendedString,
    pass a regular python string"""
    # Create XDE document
    doc = TDocStd_Document("example")
    shape_tool = XCAFDoc_DocumentTool.ShapeTool(doc.Main())
    shape = BRepPrimAPI_MakeBox(10, 10, 10).Shape()
    label = shape_tool.AddShape(shape, False)

    a_unicode_string = "Some text with umlauts äöü and japanese (琵琶)"
    TDataStd_Name.Set(label, a_unicode_string)

    step_writer = STEPCAFControl_Writer()
    Interface_Static.SetIVal("write.stepcaf.subshapes.name", 1)
    Interface_Static.SetCVal("write.step.schema", "AP214")
    Interface_Static.SetCVal("write.step.product.name", "my product")
    step_writer.Transfer(doc, STEPControl_AsIs)

    # Initialize the STEP exporter
    hs = APIHeaderSection_MakeHeader(step_writer.ChangeWriter().Model())
    hs.SetName(TCollection_HAsciiString("model name"))
    hs.SetAuthorValue(1, TCollection_HAsciiString("My name"))
    hs.SetAuthorisation(TCollection_HAsciiString("authorization"))

    descr = Interface_HArray1OfHAsciiString(1, 3)
    descr.SetValue(1, TCollection_HAsciiString("a description"))
    descr.SetValue(2, TCollection_HAsciiString("split into"))
    descr.SetValue(3, TCollection_HAsciiString("three items"))
    hs.SetDescription(descr)

    org = Interface_HArray1OfHAsciiString(1, 1)
    org.SetValue(1, TCollection_HAsciiString("pythonocc organization"))
    hs.SetOrganization(org)

    status = step_writer.Write("compound_with_unicode_label.step")

    if status != IFSelect_RetDone:
        raise AssertionError("write failed")

    # check that the unicode string was actually exported to file
    with open("compound_with_unicode_label.step", "r", encoding="utf8") as f:
        step_file_content = f.read()
        assert a_unicode_string in step_file_content


def test_ReadStream():
    """read a step file from a string"""
    with open(
        os.path.join(".", "test_io", "io1-ug-214.stp"), "r", encoding="utf8"
    ) as step_file:
        step_file_content = step_file.read()
    step_reader = STEPControl_Reader()
    result = step_reader.ReadStream("stream_name", step_file_content)
    assert result == IFSelect_RetDone
    step_reader.TransferRoots()


def test_WriteStream():
    """write a step file to a string"""
    the_shape = BRepPrimAPI_MakeBox(10, 20, 30).Shape()
    step_writer = STEPControl_Writer()
    step_writer.Transfer(the_shape, STEPControl_AsIs)
    result, step_str = step_writer.WriteStream()
    assert result == IFSelect_RetDone
    assert len(step_str) > 15000  # TODO: length depends on architecture?


def test_shape_analysis_free_bounds():
    """test special wrapper for ShapeAnalysis::ConnectEdgesToWires"""
    p1 = gp_Pnt()
    p2 = gp_Pnt(1, 0, 0)
    e1 = BRepBuilderAPI_MakeEdge(p1, p2).Edge()

    p3 = gp_Pnt(1, 1, 0)
    e2 = BRepBuilderAPI_MakeEdge(p2, p3).Edge()

    edges = TopTools_HSequenceOfShape()
    edges.Append(e1)
    edges.Append(e2)

    result = ShapeAnalysis_FreeBounds.ConnectEdgesToWires(edges, 1.0e-7, False)
    assert result.Length() == 1


def test_const_ref_return():
    """const byref should be wrapped as copy constructors to prevent memory issues,
    see issue #1277"""

    def get_bounds(adaptor):
        return list(adaptor.Surface().BSpline().Bounds())

    a_reader = IGESCAFControl_Reader()
    iges_filename = os.path.join(".", "test_io", "testfile.igs")
    if a_reader.ReadFile(iges_filename) != 1:
        raise ValueError("Can't open IGES file.")

    a_doc = TDocStd_Document("iges")
    if not a_reader.Transfer(a_doc):
        raise ValueError("Cannot transfer data from IGES file.")

    shape_tool = XCAFDoc_DocumentTool.ShapeTool(a_doc.Main())

    shp_labels = TDF_LabelSequence()
    shape_tool.GetShapes(shp_labels)

    shape_label = shp_labels.Value(1)
    shape = shape_tool.GetShape(shape_label)

    adaptor = BRepAdaptor_Surface(shape)
    bounds = get_bounds(adaptor)
    # should returns [0.0, 35.53017372307497, 0.0, 27.81101597164092]
    assert bounds == [0.0, 35.53017372307497, 0.0, 27.81101597164092]


def test_const_ref_return_2():
    """See issue #1218"""

    def make_curve():
        p1 = gp_Pnt(5, -5, 0)
        p2 = gp_Pnt(5, 5, 0)
        ed1 = BRepBuilderAPI_MakeEdge(p2, p1).Edge()
        c = BRepAdaptor_Curve(ed1).Curve().Curve()
        return c

    assert isinstance(make_curve(), Geom_Curve)


def test_iterator():
    """See issue #1326"""
    shp1 = BRepPrimAPI_MakeBox(10, 20, 30).Shape()
    shp2 = BRepPrimAPI_MakeBox(20, 30, 40).Shape()

    los = TopTools_ListOfShape()

    los.Append(shp1)
    los.Append(shp2)

    assert los.Size() == 2

    it = TopTools_ListIteratorOfListOfShape(los)

    shps = []
    while it.More():
        next_shp = it.Value()
        assert not next_shp.IsNull()
        shps.append(next_shp)
        it.Next()

    assert shp1.IsSame(shps[0])
    assert shp2.IsSame(shps[1])


def test_breptools_shape_set_extensions():
    with open(os.path.join(".", "test_io", "Motor-c.brep"), "r", encoding="utf8") as f:
        brep_string_content = f.read()
    new_shape_set = BRepTools_ShapeSet()
    new_shape_set.ReadFromString(brep_string_content)


def test_topods_readfromstring_extension():
    box = BRepPrimAPI_MakeBox(100, 100, 100).Shape()
    string = breptools.WriteToString(box)

    # create a new shape each time
    for i in range(10):
        box1 = breptools.ReadFromString(string)

    # same, but fill in the shape
    topods_shape = TopoDS_Shape()
    # create a new shape each time
    for i in range(10):
        breptools.ReadFromString(string, topods_shape)
