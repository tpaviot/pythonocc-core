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

from OCC.TCollection import TCollection_ExtendedString

from OCC.TDocStd import Handle_TDocStd_Document
from OCC.XCAFApp import XCAFApp_Application
from OCC.XCAFDoc import (XCAFDoc_DocumentTool_ShapeTool,
                         XCAFDoc_DocumentTool_ColorTool,
                         XCAFDoc_ColorGen)
from OCC.STEPCAFControl import STEPCAFControl_Reader, STEPCAFControl_Writer
from OCC.IFSelect import IFSelect_RetDone
from OCC.Quantity import Quantity_Color
from OCC.TDF import TDF_LabelSequence
from OCC.XSControl import XSControl_WorkSession
from OCC.STEPControl import STEPControl_AsIs
from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox


class TestOCAF(unittest.TestCase):
    def test_create_app(self):
        ''' Creates an OCAF app and an empty document '''
        # create an handle to a document
        h_doc = Handle_TDocStd_Document()
        assert(h_doc.IsNull())
        # Create the application
        app = XCAFApp_Application.GetApplication().GetObject()
        app.NewDocument(TCollection_ExtendedString("MDTV-CAF"), h_doc)

    def test_write_step_file(self):
        ''' Exports a colored box into a STEP file '''
        ### initialisation
        h_doc = Handle_TDocStd_Document()
        assert(h_doc.IsNull())
        # Create the application
        app = XCAFApp_Application.GetApplication().GetObject()
        app.NewDocument(TCollection_ExtendedString("MDTV-CAF"), h_doc)
        # Get root assembly
        doc = h_doc.GetObject()
        h_shape_tool = XCAFDoc_DocumentTool_ShapeTool(doc.Main())
        l_Colors = XCAFDoc_DocumentTool_ColorTool(doc.Main())
        shape_tool = h_shape_tool.GetObject()
        colors = l_Colors.GetObject()
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
        writer = STEPCAFControl_Writer(WS.GetHandle(), False)
        writer.Transfer(h_doc, STEPControl_AsIs)
        status = writer.Write("./test_io/test_ocaf_generated.stp")
        assert status
        assert os.path.isfile("./test_io/test_ocaf_generated.stp")

    def test_read_step_file(self):
        ''' Reads the previous step file '''
        # create an handle to a document
        h_doc = Handle_TDocStd_Document()
        # Create the application
        app = XCAFApp_Application.GetApplication().GetObject()
        app.NewDocument(TCollection_ExtendedString("MDTV-CAF"), h_doc)
        # Get root assembly
        doc = h_doc.GetObject()
        h_shape_tool = XCAFDoc_DocumentTool_ShapeTool(doc.Main())
        l_colors = XCAFDoc_DocumentTool_ColorTool(doc.Main())
        step_reader = STEPCAFControl_Reader()
        step_reader.SetColorMode(True)
        step_reader.SetLayerMode(True)
        step_reader.SetNameMode(True)
        step_reader.SetMatMode(True)
        status = step_reader.ReadFile("./test_io/test_ocaf.stp")
        if status == IFSelect_RetDone:
            step_reader.Transfer(doc.GetHandle())

        labels = TDF_LabelSequence()
        color_labels = TDF_LabelSequence()

        shape_tool = h_shape_tool.GetObject()
        h_shape_tool.GetObject().GetFreeShapes(labels)

        assert(labels.Length() == 1)
        sub_shapes_labels = TDF_LabelSequence()
        assert(not shape_tool.IsAssembly(labels.Value(1)))
        shape_tool.GetSubShapes(labels.Value(1), sub_shapes_labels)
        assert(sub_shapes_labels.Length() == 0)

        l_colors.GetObject().GetColors(color_labels)
        assert(color_labels.Length() == 1)

        label_shp = labels.Value(1)
        a_shape = h_shape_tool.GetObject().GetShape(label_shp)
        assert(not a_shape.IsNull())


def suite():
    suite = unittest.TestSuite()
    suite.addTest(unittest.makeSuite(TestOCAF))
    return suite

if __name__ == "__main__":
    unittest.main()
