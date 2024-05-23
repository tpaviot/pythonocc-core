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

from contextlib import contextmanager
import os
from typing import Any, Iterator
import unittest
import warnings

from OCC.Core.TCollection import TCollection_ExtendedString
from OCC.Core.TDocStd import TDocStd_Document
from OCC.Core.XCAFDoc import (
    XCAFDoc_DocumentTool,
    XCAFDoc_ColorGen,
    XCAFDoc_Material,
)
from OCC.Core.STEPCAFControl import STEPCAFControl_Reader, STEPCAFControl_Writer
from OCC.Core.IFSelect import IFSelect_RetDone
from OCC.Core.Quantity import Quantity_Color, Quantity_TypeOfColor
from OCC.Core.TDF import TDF_LabelSequence
from OCC.Core.XSControl import XSControl_WorkSession
from OCC.Core.STEPControl import STEPControl_AsIs
from OCC.Core.BRepPrimAPI import BRepPrimAPI_MakeBox


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


def test_create_doc() -> None:
    """Creates an OCAF app and an empty document"""
    # create an handle to a document
    doc = TDocStd_Document("MDTV-CAF")
    assert doc is not None


def test_write_step_file() -> None:
    """Exports a colored box into a STEP file"""
    ### initialisation
    doc = TDocStd_Document("pythonocc-doc")
    assert doc is not None

    # Get root assembly
    shape_tool = XCAFDoc_DocumentTool.ShapeTool(doc.Main())
    colors = XCAFDoc_DocumentTool.ColorTool(doc.Main())
    ### create the shape to export
    test_shape = BRepPrimAPI_MakeBox(100.0, 100.0, 100.0).Shape()

    ### add shape
    shp_label = shape_tool.AddShape(test_shape)
    ### set a color for this shape
    r = 1.0
    g = b = 0.5
    red_color = Quantity_Color(r, g, b, Quantity_TypeOfColor.Quantity_TOC_RGB)
    colors.SetColor(shp_label, red_color, XCAFDoc_ColorGen)
    # write file
    WS = XSControl_WorkSession()
    writer = STEPCAFControl_Writer(WS, False)
    writer.Transfer(doc, STEPControl_AsIs)
    status = writer.Write("./test_io/test_ocaf_generated.stp")
    assert status
    assert os.path.isfile("./test_io/test_ocaf_generated.stp")


def test_read_step_file() -> None:
    """Reads the previous step file"""
    # create an handle to a document
    doc = TDocStd_Document("pythonocc-doc")
    # Get root assembly
    shape_tool = XCAFDoc_DocumentTool.ShapeTool(doc.Main())
    l_colors = XCAFDoc_DocumentTool.ColorTool(doc.Main())
    step_reader = STEPCAFControl_Reader()
    step_reader.SetColorMode(True)
    step_reader.SetLayerMode(True)
    step_reader.SetNameMode(True)
    step_reader.SetMatMode(True)
    status = step_reader.ReadFile("./test_io/test_ocaf.stp")
    assert status == IFSelect_RetDone
    step_reader.Transfer(doc)

    labels = TDF_LabelSequence()
    color_labels = TDF_LabelSequence()

    shape_tool.GetFreeShapes(labels)

    assert labels.Length() == 1
    sub_shapes_labels = TDF_LabelSequence()
    assert not shape_tool.IsAssembly(labels.Value(1))
    shape_tool.GetSubShapes(labels.Value(1), sub_shapes_labels)
    assert sub_shapes_labels.Length() == 0

    l_colors.GetColors(color_labels)
    assert color_labels.Length() == 1

    label_shp = labels.Value(1)
    a_shape = shape_tool.GetShape(label_shp)
    assert not a_shape.IsNull()


def test_read_step_file_from_string() -> None:
    """The same as above, using a string"""
    # create an handle to a document
    doc = TDocStd_Document("pythonocc-doc")
    # Get root assembly
    shape_tool = XCAFDoc_DocumentTool.ShapeTool(doc.Main())
    l_colors = XCAFDoc_DocumentTool.ColorTool(doc.Main())
    step_reader = STEPCAFControl_Reader()
    step_reader.SetColorMode(True)
    step_reader.SetLayerMode(True)
    step_reader.SetNameMode(True)
    step_reader.SetMatMode(True)

    # load the step file to a string
    with open("./test_io/test_ocaf.stp", "r", encoding="utf8") as step_file:
        step_file_as_string = step_file.read()
    status = step_reader.ReadStream("pythonocc_stream", step_file_as_string)
    assert status == IFSelect_RetDone
    step_reader.Transfer(doc)

    labels = TDF_LabelSequence()
    color_labels = TDF_LabelSequence()

    shape_tool.GetFreeShapes(labels)

    assert labels.Length() == 1
    sub_shapes_labels = TDF_LabelSequence()
    assert not shape_tool.IsAssembly(labels.Value(1))
    shape_tool.GetSubShapes(labels.Value(1), sub_shapes_labels)
    assert sub_shapes_labels.Length() == 0

    l_colors.GetColors(color_labels)
    assert color_labels.Length() == 1

    label_shp = labels.Value(1)
    a_shape = shape_tool.GetShape(label_shp)
    assert not a_shape.IsNull()


def test_read_step_material() -> None:
    # create an handle to a document
    doc = TDocStd_Document("pythonocc-doc")

    # Get root assembly
    shape_tool = XCAFDoc_DocumentTool.ShapeTool(doc.Main())
    mat_tool = XCAFDoc_DocumentTool.MaterialTool(doc.Main())
    step_reader = STEPCAFControl_Reader()

    status = step_reader.ReadFile("./test_io/eight_cyl.stp")

    assert status == IFSelect_RetDone
    step_reader.Transfer(doc)

    shape_labels = TDF_LabelSequence()
    material_labels = TDF_LabelSequence()

    shape_tool.GetFreeShapes(shape_labels)
    mat_tool.GetMaterialLabels(material_labels)

    number_of_shapes = shape_labels.Length()
    assert number_of_shapes == 8
    for i in range(1, number_of_shapes + 1):
        label = shape_labels.Value(i)
        a_shape = shape_tool.GetShape(label)

    # materials
    number_of_materials = material_labels.Length()
    assert number_of_materials == 8
    for i in range(1, number_of_materials + 1):
        (
            ok,
            material_name,
            material_description,
            material_density,
            material_densname,
            material_densvaltype,
        ) = mat_tool.GetMaterial(material_labels.Value(i))
        assert ok
