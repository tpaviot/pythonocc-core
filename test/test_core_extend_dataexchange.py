#!/usr/bin/env python

##Copyright 2009 Thomas Paviot (tpaviot@gmail.com)
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

import os

from OCC.Core.BRepPrimAPI import BRepPrimAPI_MakeTorus
from OCC.Core.TopoDS import TopoDS_Compound

from OCC.Extend.DataExchange import (
    read_step_file,
    read_step_file_with_names_colors,
    read_stl_file,
    read_iges_file,
    read_gltf_file,
    write_step_file,
    write_stl_file,
    write_iges_file,
    write_ply_file,
    write_obj_file,
    write_gltf_file,
    export_shape_to_svg,
)
from OCC.Extend.TopologyUtils import TopologyExplorer

SAMPLES_DIRECTORY = os.path.join(".", "test_io")


def get_test_fullname(filename):
    return os.path.join(SAMPLES_DIRECTORY, filename)


# the sample files
STEP_AP203_SAMPLE_FILE = get_test_fullname("as1_pe_203.stp")
STEP_AP214_SAMPLE_FILE = get_test_fullname("as1-oc-214.stp")
STEP_MULTIPLE_ROOT = get_test_fullname("stp_multiple_shp_at_root.stp")
IGES_SAMPLE_FILE = get_test_fullname("sunglasses_lens.igs")
IGES_45_FACES = get_test_fullname("example_45_faces.iges")
STL_ASCII_SAMPLE_FILE = get_test_fullname("bottle_ascii.stl")
STL_BINARY_SAMPLE_FILE = get_test_fullname("cube_binary.stl")
GLTF_ASCII_SAMPLE_FILE = get_test_fullname("Duck.gltf")
GLTF_BINARY_SAMPLE_FILE = get_test_fullname("Duck.gltf")

# the basic geometry to test exporters
A_TOPODS_SHAPE = BRepPrimAPI_MakeTorus(200, 50).Shape()


def check_is_file(filename):
    assert os.path.isfile(filename)


def test_read_step_file():
    read_step_file(STEP_AP203_SAMPLE_FILE)
    read_step_file(STEP_AP214_SAMPLE_FILE)


def test_read_step_file_multiple_shape_as_root():
    t = read_step_file(STEP_MULTIPLE_ROOT, as_compound=True)
    assert isinstance(t, TopoDS_Compound)

    l = read_step_file(STEP_MULTIPLE_ROOT, as_compound=False)
    assert isinstance(l, list)
    assert len(l) == 3


def test_read_step_file_names_colors():
    read_step_file_with_names_colors(STEP_AP203_SAMPLE_FILE)
    read_step_file_with_names_colors(STEP_AP214_SAMPLE_FILE)


def test_read_iges_file():
    list_of_shapes = read_iges_file(IGES_SAMPLE_FILE)
    assert isinstance(list_of_shapes, list)
    assert len(list_of_shapes) == 1


def test_read_iges_45_shapes():
    all_shapes = read_iges_file(IGES_45_FACES, return_as_shapes=True, verbosity=True)
    assert len(all_shapes) == 45


def test_read_iges_45_shapes_as_one_compound():
    shapes = read_iges_file(IGES_45_FACES, return_as_shapes=False, verbosity=True)
    assert len(shapes) == 1
    assert isinstance(shapes[0], TopoDS_Compound)
    topo_explorer = TopologyExplorer(shapes[0])
    assert topo_explorer.number_of_faces() == 45


def test_read_stl_file():
    read_stl_file(STL_ASCII_SAMPLE_FILE)
    read_stl_file(STL_BINARY_SAMPLE_FILE)


def test_export_shape_to_svg():
    svg_filename = get_test_fullname("sample.svg")
    export_shape_to_svg(A_TOPODS_SHAPE, svg_filename)
    check_is_file(svg_filename)


def test_read_gltf_ascii_file():
    shp = read_gltf_file(GLTF_ASCII_SAMPLE_FILE)
    assert not shp.IsNull()


def test_read_gltf_binary_file():
    shp = read_gltf_file(GLTF_BINARY_SAMPLE_FILE)
    assert not shp.IsNull()


def test_write_step_ap203():
    ap203_filename = get_test_fullname("sample_ap_203.stp")
    write_step_file(A_TOPODS_SHAPE, ap203_filename, application_protocol="AP203")
    check_is_file(ap203_filename)


def test_write_step_ap214():
    as214_filename = get_test_fullname("sample_214.stp")
    write_step_file(A_TOPODS_SHAPE, as214_filename, application_protocol="AP214IS")
    check_is_file(as214_filename)


def test_write_step_ap242():
    ap242_filename = get_test_fullname("sample_242.stp")
    write_step_file(A_TOPODS_SHAPE, ap242_filename, application_protocol="AP242DIS")
    check_is_file(ap242_filename)


def test_write_iges():
    iges_filename = get_test_fullname("sample.igs")
    write_iges_file(A_TOPODS_SHAPE, iges_filename)
    check_is_file(iges_filename)


def test_stl_ascii():
    stl_ascii_filename = get_test_fullname("sample_ascii.stl")
    write_stl_file(A_TOPODS_SHAPE, stl_ascii_filename, mode="ascii")
    check_is_file(stl_ascii_filename)


def test_stl_binary():
    stl_binary_filename = get_test_fullname("sample_binary.stl")
    write_stl_file(A_TOPODS_SHAPE, stl_binary_filename, mode="binary")
    check_is_file(stl_binary_filename)


def test_write_ply():
    ply_filename = get_test_fullname("sample.ply")
    write_ply_file(A_TOPODS_SHAPE, ply_filename)
    check_is_file(ply_filename)


def test_write_obj():
    obj_filename = get_test_fullname("sample.obj")
    write_obj_file(A_TOPODS_SHAPE, obj_filename)
    check_is_file(obj_filename)


def test_write_gltf():
    gltf_filename = get_test_fullname("sample.gltf")
    write_gltf_file(A_TOPODS_SHAPE, gltf_filename)
    check_is_file(gltf_filename)
