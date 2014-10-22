#!/usr/bin/env python

##Copyright 2009-2013 Thomas Paviot (tpaviot@gmail.com)
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

import pickle
import unittest

from OCC.Standard import Standard_Transient, Handle_Standard_Transient
from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox
from OCC.BRepBuilderAPI import BRepBuilderAPI_MakeVertex
from OCC.gp import gp_Pnt, gp_Vec, gp_Pnt2d, gp_Lin, gp_Dir
from OCC.STEPControl import STEPControl_Writer
from OCC.Interface import Interface_Static_SetCVal, Interface_Static_CVal
from OCC.GCE2d import GCE2d_MakeSegment
from OCC.ShapeFix import ShapeFix_Solid, ShapeFix_Wire
from OCC.TopoDS import TopoDS_Compound, TopoDS_Builder
from OCC.BRepPrimAPI import BRepPrimAPI_MakeCylinder
from OCC.TColStd import TColStd_Array1OfReal


class TestWrapperFeatures(unittest.TestCase):
    def test_hash(self):
        '''
        Check whether the __hash__ function is equal to HashCode()
        '''
        s = Standard_Transient()
        id_s = id(s)
        hash1_s = s.__hash__()
        self.assertNotEqual(id_s, hash1_s)

    def test_const_Standard_Real_byref(self):
        '''
        Test wrapper for const Standard_Real &
        '''
        t = TColStd_Array1OfReal(1, 10)
        t.SetValue(3, 3.14)
        self.assertEqual(t.Value(3), 3.14)

    def test_list(self):
        '''
        Test python lists features
        '''
        P1 = gp_Pnt(1, 2, 3)
        P2 = gp_Pnt(2, 3, 4)
        P3 = gp_Pnt(5, 7, 8)
        l = [P1, P2]
        self.assertEqual(P1 in l, True)
        self.assertNotEqual(P3 in l, True)
        self.assertEqual(l.index(P1), 0)
        self.assertEqual(l.index(P2), 1)
        # Do the same for Vertices (TopoDS_Shape has
        # a HashCode() method overloaded
        V1 = BRepBuilderAPI_MakeVertex(P1).Vertex()
        V2 = BRepBuilderAPI_MakeVertex(P2).Vertex()
        V3 = BRepBuilderAPI_MakeVertex(P3) .Vertex()
        vl = [V1, V2]
        self.assertEqual(V1 in vl, True)
        self.assertNotEqual(V3 in vl, True)
        # index test()
        self.assertEqual(vl.index(V1), 0)
        self.assertEqual(vl.index(V2), 1)
        # reverse() test
        vl.reverse()
        self.assertEqual(vl.index(V1), 1)
        self.assertEqual(vl.index(V2), 0)

    def test_dict(self):
        '''
        Test python dict features
        '''
        P1 = gp_Pnt(1, 2, 3)
        P2 = gp_Pnt(2, 3, 4)
        d = {P1: 'P1', P2: 'P2'}
        self.assertEqual(d[P1] == 'P1', True)
        self.assertEqual(d[P2] == 'P2', True)

    def test_topology(self):
        '''
        Checks the Topology.py utility script.
        '''
        def get_shape():
            shape = BRepPrimAPI_MakeBox(10., 10., 10.).Shape()
            self.assertEqual(shape.IsNull(), False)
            return shape
        returned_shape = get_shape()
        self.assertEqual(returned_shape.IsNull(), False)

    def test_static_method(self):
        '''
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
        >>> from OCC.Interface import *
        >>> Interface_Static_SetCVal("write.step.schema","AP203")
        '''
        # needs to be inited otherwise the following does not work
        STEPControl_Writer()
        # Note : static methods are wrapped with lowercase convention
        # so SetCVal can be accessed with setcval
        r = Interface_Static_SetCVal("write.step.schema", "AP203")
        self.assertEqual(r, 1)
        l = Interface_Static_CVal("write.step.schema")
        self.assertEqual(l, "AP203")

    def test_ft1(self):
        """ Test: Standard_Integer & by reference transformator """
        p = gp_Pnt(1, 2, 3.2)
        p_coord = p.Coord()
        self.assertEqual(p_coord.X(), 1.)
        self.assertEqual(p_coord.Y(), 2.)
        self.assertEqual(p_coord.Z(), 3.2)

    # TODO : add a testStandardRealByRefPassedReturned
    def test_standard_integer_by_ref_passed_returned(self):
        '''
        Checks the Standard_Integer & byreference return parameter
        '''
        sfs = ShapeFix_Solid()
        sfs.SetFixShellMode(5)
        self.assertEqual(sfs.GetFixShellMode(), 5)

    def testStandardBooleanByRefPassedReturned(self):
        '''
        Checks the Standard_Boolean & byreference return parameter
        '''
        sfw = ShapeFix_Wire()
        sfw.SetModifyGeometryMode(True)
        self.assertEqual(sfw.GetModifyGeometryMode(), True)
        sfw.SetModifyGeometryMode(False)
        self.assertEqual(sfw.GetModifyGeometryMode(), False)

    def testTopoDS_byref_arguments(self):
        '''
        Test byref pass arguments to TopoDS
        '''
        cyl1 = BRepPrimAPI_MakeCylinder(10., 10.).Shape()
        cyl2 = BRepPrimAPI_MakeCylinder(100., 50.).Shape()
        c = TopoDS_Compound()
        bb = TopoDS_Builder()
        bb.MakeCompound(c)
        for child in [cyl1, cyl2]:
            bb.Add(c, child)

    def test_dump_to_string(self):
        '''
        Checks if the pickle python module works for TopoDS_Shapes
        '''
        # Create the shape
        box_shape = BRepPrimAPI_MakeBox(100, 200, 300).Shape()
        shp_dump = pickle.dumps(box_shape)
        # write to file
        output = open("box_shape.brep", "wb")
        output.write(shp_dump)
        output.close()

    def test_pickle_from_file(self):
        '''
        Checks if the pickle python module works for TopoDS_Shapes
        '''
        shp_dump = open("box_shape.brep", "rb")
        box_shape = pickle.load(shp_dump)
        self.assertFalse(box_shape.IsNull())

    def test_sub_class(self):
        """ Test: subclass """
        # Checks that OCC objects can be subclassed, and passed as parameters.
        # In this test, we create
        # a MyPoint and MyVec class, inheriting from gp_Pnt and gp_Vec.

        class MyPoint(gp_Pnt):
            def __init__(self, *kargs):
                gp_Pnt.__init__(self, *kargs)
                self.x = 4

            def get_x(self):
                return self.x

        class MyVec(gp_Vec):
            def __init__(self, *kargs):
                gp_Vec.__init__(self, *kargs)
                self._an_attribute = "something"

            def get_attribute(self):
                return self._an_attribute

        # Create the first point
        point1 = MyPoint(1., 2., 3.)
        point1_coord = point1.Coord()
        self.assertEqual(point1_coord.X(), 1.)
        self.assertEqual(point1_coord.Y(), 2.)
        self.assertEqual(point1_coord.Z(), 3.)
        self.assertEqual(point1.get_x(), 4.)
        # Create the second point
        point2 = MyPoint(2., 2., 3.)
        # Then create the vec from these two points
        # The magnitude of the vector should equal 1.0
        vec = MyVec(point1, point2)
        self.assertEqual(vec.Magnitude(), 1.)
        self.assertEqual(vec.get_attribute(), "something")

    # TODO : doesn't work
    # def testProtectedConstructor(self):
    #     """ Test: protected constructor """
    #     # 1st, class with no subclass
    #     from OCC.TopoDS import TopoDS_Builder
    #     tds_builder = TopoDS_Builder()
    #     self.assertTrue(hasattr(tds_builder, "MakeCompound"))

    def testAutoImportOfDependentModules(self):
        """ Test: automatic import of dependent modules """
        returned_object = GCE2d_MakeSegment(gp_Pnt2d(1, 1),
                                            gp_Pnt2d(3, 4)).Value()
        # for this unittest, don't use the issinstance() function,
        # since the OCC.Geom2d module
        # is *not* manually imported
        returned_object_type = '%s' % type(returned_object)
        self.assertEqual(returned_object_type, "<class 'OCC.Geom2d.Handle_Geom2d_TrimmedCurve'>")

    def test_hash_eq_operator(self):
        ''' test that the == wrapper is ok
        '''
        # test Standard
        h1 = Handle_Standard_Transient()
        s = Standard_Transient()
        h2 = s.GetHandle()
        self.assertTrue(h1 == h1)
        self.assertFalse(h1 == h2)
        self.assertFalse(h1 == 10)
        self.assertTrue(h2 == s)
        # test list.index, that uses __eq__ method
        p1 = gp_Pnt(0., 0., 0.)
        line = gp_Lin(p1, gp_Dir(1., 0., 0.))
        items = [p1, line]
        res = items.index(line)
        self.assertEqual(res, 1.)

    def test_eq_operator(self):
        shape_1 = BRepPrimAPI_MakeBox(10, 20, 30).Shape()
        shape_2 = BRepPrimAPI_MakeBox(10, 20, 30).Shape()
        self.assertFalse(shape_1 == shape_2)
        self.assertTrue(shape_1 == shape_1)
        self.assertFalse(shape_1 == "some_string")

    def test_neq_operator(self):
         # test Standard
        h1 = Handle_Standard_Transient()
        s = Standard_Transient()
        h2 = s.GetHandle()
        self.assertFalse(h1 != h1)
        self.assertTrue(h1 != h2)
        self.assertTrue(h1 != 10)
        self.assertFalse(h2 != s)
        shape_1 = BRepPrimAPI_MakeBox(10, 20, 30).Shape()
        shape_2 = BRepPrimAPI_MakeBox(10, 20, 30).Shape()
        self.assertTrue(shape_1 != shape_2)
        self.assertFalse(shape_1 != shape_1)
        self.assertTrue(shape_1 != "some_string")


def suite():
    test_suite = unittest.TestSuite()
    test_suite.addTest(unittest.makeSuite(TestWrapperFeatures))
    return test_suite

if __name__ == "__main__":
    unittest.main()
