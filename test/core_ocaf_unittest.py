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

from __future__ import print_function

import unittest
import os
import warnings
from contextlib import contextmanager

from OCC.Core.TCollection import TCollection_ExtendedString
from OCC.Core.TDocStd import TDocStd_Document
from OCC.Core.XCAFDoc import (XCAFDoc_DocumentTool_ShapeTool,
                              XCAFDoc_DocumentTool_ColorTool,
                              XCAFDoc_ColorGen)
from OCC.Core.STEPCAFControl import STEPCAFControl_Reader, STEPCAFControl_Writer
from OCC.Core.IFSelect import IFSelect_RetDone
from OCC.Core.Quantity import Quantity_Color
from OCC.Core.TDF import TDF_LabelSequence
from OCC.Core.XSControl import XSControl_WorkSession
from OCC.Core.STEPControl import STEPControl_AsIs
from OCC.Core.BRepPrimAPI import BRepPrimAPI_MakeBox


@contextmanager
def assert_warns_deprecated():
    with warnings.catch_warnings(record=True) as w:
        warnings.simplefilter("always")
        yield w
        # Verify some things
        if not issubclass(w[-1].category, DeprecationWarning):
            raise AssertionError("Wrong exception type")
        if not "deprecated" in str(w[-1].message):
            raise AssertionError("deprecated string not in message")


class TestOCAF(unittest.TestCase):
    def test_create_doc(self):
        ''' Creates an OCAF app and an empty document '''
        # create an handle to a document
        doc = TDocStd_Document(TCollection_ExtendedString("MDTV-CAF"))
        self.assertFalse(doc.IsNull())

    def test_write_step_file(self):
        ''' Exports a colored box into a STEP file '''
        ### initialisation
        doc = TDocStd_Document(TCollection_ExtendedString("pythonocc-doc"))
        self.assertTrue(doc is not None)

        # Get root assembly
        shape_tool = XCAFDoc_DocumentTool_ShapeTool(doc.Main())
        colors = XCAFDoc_DocumentTool_ColorTool(doc.Main())
        ### create the shape to export
        test_shape = BRepPrimAPI_MakeBox(100., 100., 100.).Shape()

        ### add shape
        shp_label = shape_tool.AddShape(test_shape)
        ### set a color for this shape
        r = 1
        g = b = 0.5
        red_color = Quantity_Color(r, g, b, 0)
        colors.SetColor(shp_label, red_color, XCAFDoc_ColorGen)
        # write file
        WS = XSControl_WorkSession()
        writer = STEPCAFControl_Writer(WS, False)
        writer.Transfer(doc, STEPControl_AsIs)
        status = writer.Write("./test_io/test_ocaf_generated.stp")
        self.assertTrue(status)
        self.assertTrue(os.path.isfile("./test_io/test_ocaf_generated.stp"))

    def test_read_step_file(self):
        ''' Reads the previous step file '''
        # create an handle to a document
        doc = TDocStd_Document(TCollection_ExtendedString("pythonocc-doc"))
        # Get root assembly
        shape_tool = XCAFDoc_DocumentTool_ShapeTool(doc.Main())
        l_colors = XCAFDoc_DocumentTool_ColorTool(doc.Main())
        step_reader = STEPCAFControl_Reader()
        step_reader.SetColorMode(True)
        step_reader.SetLayerMode(True)
        step_reader.SetNameMode(True)
        step_reader.SetMatMode(True)
        status = step_reader.ReadFile("./test_io/test_ocaf.stp")
        if status == IFSelect_RetDone:
            step_reader.Transfer(doc)

        labels = TDF_LabelSequence()
        color_labels = TDF_LabelSequence()

        shape_tool.GetFreeShapes(labels)

        self.assertEqual(labels.Length(), 1)
        sub_shapes_labels = TDF_LabelSequence()
        self.assertFalse(shape_tool.IsAssembly(labels.Value(1)))
        shape_tool.GetSubShapes(labels.Value(1), sub_shapes_labels)
        self.assertEqual(sub_shapes_labels.Length(), 0)

        l_colors.GetColors(color_labels)
        self.assertEqual(color_labels.Length(), 1)

        label_shp = labels.Value(1)
        a_shape = shape_tool.GetShape(label_shp)
        self.assertFalse(a_shape.IsNull())


def suite():
    suite = unittest.TestSuite()
    suite.addTest(unittest.makeSuite(TestOCAF))
    return suite

if __name__ == "__main__":
    unittest.main()
