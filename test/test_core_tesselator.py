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

import json
import os
from xml.etree import ElementTree as ET

from OCC.Core.BRepPrimAPI import (
    BRepPrimAPI_MakeBox,
    BRepPrimAPI_MakeTorus,
    BRepPrimAPI_MakeSphere,
)
from OCC.Core.Tesselator import ShapeTesselator

from OCC.Extend.DataExchange import read_step_file


def test_tessellate_box():
    """1st test : tessellation of a box"""
    a_box = BRepPrimAPI_MakeBox(10, 20, 30).Shape()
    tess = ShapeTesselator(a_box)
    tess.Compute()
    assert tess.ObjGetTriangleCount() == 12
    assert tess.ObjGetNormalCount() == 24


def test_tessellate_sphere_deviation():
    """Set deviation to control the number of triangles"""
    a_sphere = BRepPrimAPI_MakeSphere(17.12).Shape()
    tess = ShapeTesselator(a_sphere)
    tess.Compute()
    triangle_count_before = tess.ObjGetTriangleCount()
    normal_count_before = tess.ObjGetNormalCount()
    deviation_before = tess.GetDeviation()

    new_tess = ShapeTesselator(a_sphere)
    new_deviation = deviation_before / 10  # smaller deviation, more triangles
    new_tess.SetDeviation(new_deviation)
    assert round(new_tess.GetDeviation(), 8) == round(new_deviation, 8)
    new_tess.Compute()  # recompute
    triangle_count_after = new_tess.ObjGetTriangleCount()
    normal_count_after = new_tess.ObjGetNormalCount()
    assert triangle_count_after > triangle_count_before
    assert normal_count_after > normal_count_before


def test_tessellate_torus():
    """2nd test : tessellation of a torus"""
    a_torus = BRepPrimAPI_MakeTorus(10, 4).Shape()
    tess = ShapeTesselator(a_torus)
    tess.Compute()
    assert tess.ObjGetTriangleCount() > 100
    assert tess.ObjGetNormalCount() > 100


def test_tessellate_torus_with_edges():
    """2nd test : tessellation of a torus"""
    a_torus = BRepPrimAPI_MakeTorus(10, 4).Shape()
    tess = ShapeTesselator(a_torus)
    tess.Compute(compute_edges=True)
    assert tess.ObjGetTriangleCount() > 100
    assert tess.ObjGetNormalCount() > 100


def test_tessellate_torus_with_bad_quality():
    """2nd test : tessellation of a torus"""
    a_torus = BRepPrimAPI_MakeTorus(10, 4).Shape()
    tess = ShapeTesselator(a_torus)
    tess.Compute(mesh_quality=40.0)
    # since mesh quality is much lower, we should count less vertices and
    # triangles
    assert tess.ObjGetTriangleCount() > 10
    assert tess.ObjGetTriangleCount() < 100
    assert tess.ObjGetNormalCount() > 10
    assert tess.ObjGetNormalCount() < 100


def test_export_to_x3d():
    """3rd test : export a sphere to X3D file format"""
    a_sphere = BRepPrimAPI_MakeSphere(10.0).Shape()
    tess = ShapeTesselator(a_sphere)
    tess.Compute()
    tess.ExportShapeToX3D(os.path.join("test_io", "sphere.x3d"))
    assert os.path.exists(os.path.join("test_io", "sphere.x3d"))


def test_export_to_x3d_TriangleSet():
    """3rd test : export a sphere to an X3D TriangleSet triangle mesh"""
    a_sphere = BRepPrimAPI_MakeBox(10.0, 10.0, 10.0).Shape()
    sphere_tess = ShapeTesselator(a_sphere)
    sphere_tess.Compute()
    sphere_triangle_set_string = sphere_tess.ExportShapeToX3DTriangleSet()
    assert sphere_triangle_set_string.startswith("<TriangleSet")
    assert "0 10 0" in sphere_triangle_set_string  # a vertex
    assert "0 0 1" in sphere_triangle_set_string  # a normal


def test_export_to_3js_JSON():
    a_box = BRepPrimAPI_MakeBox(10, 20, 30).Shape()
    tess = ShapeTesselator(a_box)
    tess.Compute()
    # get the JSON string
    json_str = tess.ExportShapeToThreejsJSONString("myshapeid")
    # check the python JSON parser can decode the string
    # i.e. the JSON string is well formed
    dico = json.loads(json_str)
    # after that, check that the number of vertices is ok
    assert len(dico["data"]["attributes"]["position"]["array"]) == 36 * 3


def test_x3d_file_is_valid_xml():
    """use ElementTree to parse X3D output"""
    another_torus = BRepPrimAPI_MakeTorus(10, 4).Shape()
    torus_tess = ShapeTesselator(another_torus)
    torus_tess.Compute()
    output_x3d_filename = os.path.join("test_io", "torus.x3d")
    torus_tess.ExportShapeToX3D(output_x3d_filename)
    assert os.path.exists(output_x3d_filename)
    with open(output_x3d_filename, "r") as x3d_file:
        x3d_content = x3d_file.read()
        ET.fromstring(x3d_content)  # raise an exception if not valid xml


def test_tessellate_STEP_file():
    """loads a step file, tessellate. The as1_pe_203 contains
    free edges"""
    stp_file = os.path.join(os.path.join("test_io", "as1_pe_203.stp"))
    stp_file_shape = read_step_file(stp_file)
    stp_file_tesselator = ShapeTesselator(stp_file_shape)

    # free edges have been excluded, then should work as expected
    stp_file_tesselator.Compute(compute_edges=True)


def test_tessellate_twice():
    """calling Compte() many times should no raise an exception"""
    another_torus = BRepPrimAPI_MakeTorus(10, 4).Shape()
    torus_tess = ShapeTesselator(another_torus)
    torus_tess.Compute()
    torus_tess.Compute()
