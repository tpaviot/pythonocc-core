##Copyright 2021 Thomas Paviot (tpaviot@gmail.com)
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

from math import sqrt
import os

from OCC.Core.gp import gp_Pnt, gp_Vec, gp_Dir
from OCC.Core.MeshDS import MeshDS_DataSource
from OCC.Core.RWStl import rwstl
from OCC.Core.TColStd import TColStd_Array1OfInteger, TColStd_Array1OfReal
from OCC.Core.MeshVS import MeshVS_ET_Face, MeshVS_ET_Node
from OCC.Core.Poly import Poly_Triangulation, Poly_Triangle

import numpy as np
import pytest

STL_BOTTLE_FILENAME = os.path.join(".", "test_io", "bottle_ascii.stl")


def test_instantiate_from_stl_file():
    a_stl_mesh = rwstl.ReadFile(STL_BOTTLE_FILENAME)
    MeshDS_DataSource(a_stl_mesh)


def test_stl_file_check_bounding_box():
    a_stl_mesh = rwstl.ReadFile(STL_BOTTLE_FILENAME)
    a_ds = MeshDS_DataSource(a_stl_mesh)
    bb = a_ds.GetBoundingBox().Get()
    assert bb == [-26.5748, 4.426, -13.6694, 26.5269, 90.2, 13.5885]


def test_create_mesh_datasource():
    # create data
    coord_data = [
        gp_Pnt(0, 0, 0),
        gp_Pnt(0, 1, 0),
        gp_Pnt(0, 1, -1),
        gp_Pnt(1, 0, 0),
        gp_Pnt(1, 1, 0),
    ]
    ele2_node_data = [[0, 1, 4, 3], [1, 2, 4]]
    # create data source
    a_data_source = MeshDS_DataSource(coord_data, ele2_node_data)
    # check node ids and number of elements
    node_ids = TColStd_Array1OfInteger(1, 4)
    is_ok, nb_nodes = a_data_source.GetNodesByElement(1, node_ids)
    assert is_ok
    assert nb_nodes == 4
    assert node_ids.Value(1) == 1
    assert node_ids.Value(2) == 2
    assert node_ids.Value(3) == 5
    assert node_ids.Value(4) == 4
    is_ok, nb_nodes = a_data_source.GetNodesByElement(2, node_ids)
    assert is_ok
    assert nb_nodes == 3
    assert node_ids.Value(1) == 2
    assert node_ids.Value(2) == 3
    assert node_ids.Value(3) == 5
    # check normal of elements
    is_ok, nx, ny, nz = a_data_source.GetNormal(1, 3)
    assert is_ok
    assert nx == 0.0
    assert ny == 0.0
    assert nz == -1.0
    is_ok, nx, ny, nz = a_data_source.GetNormal(2, 3)
    assert is_ok
    assert nx == 0.0
    assert ny == -1.0
    assert nz == 0.0
    # check normal of nodes
    is_ok, nx, ny, nz = a_data_source.GetNodeNormal(1, 1)
    assert is_ok
    assert nx == 0.0
    assert ny == 0.0
    assert nz == -1.0
    is_ok, nx, ny, nz = a_data_source.GetNodeNormal(1, 2)
    assert nx == 0.0
    assert is_ok
    # floating point number comparison, rounded to 12 decimals
    assert round(ny, 12) == -round(sqrt(2) / 2, 12)
    assert round(nz, 12) == -round(sqrt(2) / 2, 12)


def testset_check_normals():
    # create data
    coord_data = [
        gp_Pnt(0, 0, 0),
        gp_Pnt(0, 1, 0),
        gp_Pnt(0, 1, -1),
        gp_Pnt(1, 0, 0),
        gp_Pnt(1, 1, 0),
    ]
    ele2_node_data = [[0, 1, 4, 3], [1, 2, 4]]
    node_normals_data = [
        [gp_Vec(0, 0, -1), gp_Vec(0, 0, -1), gp_Vec(0, 0, -1), gp_Vec(0, 0, -1)],
        [gp_Vec(0, 0, -1), gp_Vec(0, 0, -1), gp_Vec(0, 0, -1)],
    ]
    elem_normals_data = [gp_Vec(0, 0, 1), gp_Vec(0, 0, 1)]
    # create data source
    a_data_source = MeshDS_DataSource(coord_data, ele2_node_data)
    # check node ids and number of elements
    # set and check normal of elements
    a_data_source.SetElemNormals(elem_normals_data)
    is_ok, nx, ny, nz = a_data_source.GetNormal(1, 3)
    assert is_ok
    assert nx == 0.0
    assert ny == 0.0
    assert nz == 1.0
    # set and check normal of nodes
    a_data_source.SetNodeNormals(node_normals_data)
    is_ok, nx, ny, nz = a_data_source.GetNodeNormal(1, 2)
    assert is_ok
    assert nx == 0.0
    assert ny == 0.0
    assert nz == -1.0
    # get all nodes
    all_nodes = a_data_source.GetAllNodes()
    assert all_nodes.NbBuckets() == 101
    # NCollection_PackedMap.Statistics() was removed in OCCT 8.0
    # get all GetAllElements
    all_elements = a_data_source.GetAllElements()
    assert all_elements.NbBuckets() == 101


def test_create_mesh_datasource_from_numpy_ndarray():
    # 8 cube vertices
    v1 = [0, 0, 0]
    v2 = [0, 1, 0]
    v3 = [1, 1, 0]
    v4 = [1, 0, 0]
    v5 = [0, 0, 1]
    v6 = [0, 1, 1]
    v7 = [1, 1, 1]
    v8 = [1, 0, 1]

    # 12 cube faces
    f1 = [7, 3, 0]
    f2 = [0, 4, 7]
    f3 = [0, 1, 2]
    f4 = [0, 2, 3]
    f5 = [4, 5, 6]
    f6 = [4, 6, 7]
    f7 = [6, 5, 1]
    f8 = [6, 2, 1]
    f9 = [4, 0, 5]
    f10 = [0, 1, 5]
    f11 = [3, 6, 7]
    f12 = [2, 3, 6]
    vertices = np.array([v1, v2, v3, v4, v5, v6, v7, v8], dtype=np.float32)
    faces = np.array(
        [f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12], dtype=np.int32
    )

    # create data source
    a_data_source = MeshDS_DataSource(vertices, faces)
    assert isinstance(a_data_source, MeshDS_DataSource)


def test_mesh_datasource_counts_and_geom():
    coord_data = [gp_Pnt(0, 0, 0), gp_Pnt(1, 0, 0), gp_Pnt(1, 1, 0), gp_Pnt(0, 1, 0)]
    a_data_source = MeshDS_DataSource(coord_data, [[0, 1, 2, 3], [0, 1, 2]])
    assert a_data_source.NbNodes() == 4
    assert a_data_source.NbElements() == 2
    # all the nodes of the quadrangle, X, Y, Z of each node in turn
    coords = TColStd_Array1OfReal(1, 12)
    is_ok, nb_nodes, entity_type = a_data_source.GetGeom(1, True, coords)
    assert is_ok and nb_nodes == 4 and entity_type == MeshVS_ET_Face
    assert [coords.Value(i) for i in range(1, 13)] == [
        0,
        0,
        0,
        1,
        0,
        0,
        1,
        1,
        0,
        0,
        1,
        0,
    ]
    # a single node
    is_ok, nb_nodes, entity_type = a_data_source.GetGeom(3, False, coords)
    assert is_ok and nb_nodes == 1 and entity_type == MeshVS_ET_Node
    assert [coords.Value(i) for i in range(1, 4)] == [1, 1, 0]
    # out of range ids and too small arrays are reported, not read
    assert not a_data_source.GetGeom(3, True, coords)[0]
    assert not a_data_source.GetGeom(5, False, coords)[0]
    assert not a_data_source.GetGeom(1, True, TColStd_Array1OfReal(1, 9))[0]
    node_ids = TColStd_Array1OfInteger(1, 3)
    assert not a_data_source.GetNodesByElement(1, node_ids)[0]
    assert a_data_source.GetNodesByElement(2, node_ids)[0]
    # node rank beyond the element nodes
    assert a_data_source.GetNodeNormal(3, 2)[0]
    assert not a_data_source.GetNodeNormal(4, 2)[0]
    assert not a_data_source.GetNormal(1, 2)[0]


def test_mesh_datasource_from_numpy_quadrangles():
    vertices = np.array(
        [[0, 0, 0], [1, 0, 0], [1, 1, 0], [0, 1, 0], [2, 0, 0], [2, 1, 0]],
        dtype=np.float64,
    )
    faces = np.array([[0, 1, 2, 3], [1, 4, 5, 2]], dtype=np.int32)
    a_data_source = MeshDS_DataSource(vertices, faces)
    assert a_data_source.NbNodes() == 6
    assert a_data_source.NbElements() == 2
    node_ids = TColStd_Array1OfInteger(1, 4)
    is_ok, nb_nodes = a_data_source.GetNodesByElement(2, node_ids)
    assert is_ok and nb_nodes == 4
    assert [node_ids.Value(i) for i in range(1, 5)] == [2, 5, 6, 3]
    is_ok, nx, ny, nz = a_data_source.GetNormal(2, 3)
    assert is_ok and (nx, ny, nz) == (0.0, 0.0, 1.0)


def test_mesh_datasource_invalid_input():
    coord_data = [gp_Pnt(0, 0, 0), gp_Pnt(1, 0, 0), gp_Pnt(1, 1, 0)]
    # node index out of range
    with pytest.raises(IndexError):
        MeshDS_DataSource(coord_data, [[0, 1, 3]])
    with pytest.raises(IndexError):
        MeshDS_DataSource(coord_data, [[0, 1, -1]])
    # not a triangle nor a quadrangle
    with pytest.raises(Exception):
        MeshDS_DataSource(coord_data, [[0, 1]])
    with pytest.raises(Exception):
        MeshDS_DataSource(coord_data, [[0, 1, 2, 0, 1]])
    # numpy arrays with a wrong number of columns
    vertices = np.array([[0, 0, 0], [1, 0, 0], [1, 1, 0]], dtype=np.float64)
    with pytest.raises(Exception):
        MeshDS_DataSource(vertices, np.array([[0, 1]], dtype=np.int32))
    with pytest.raises(Exception):
        MeshDS_DataSource(vertices[:, :2].copy(), np.array([[0, 1, 2]], dtype=np.int32))
    with pytest.raises(IndexError):
        MeshDS_DataSource(vertices, np.array([[0, 1, 5]], dtype=np.int32))
    # normals must match the elements
    a_data_source = MeshDS_DataSource(coord_data, [[0, 1, 2]])
    with pytest.raises(Exception):
        a_data_source.SetElemNormals([gp_Vec(0, 0, 1), gp_Vec(0, 0, 1)])
    with pytest.raises(Exception):
        a_data_source.SetNodeNormals([[gp_Vec(0, 0, 1), gp_Vec(0, 0, 1)]])


def test_mesh_datasource_triangulation_normals():
    # the normals of the triangulation are used as node normals
    triangulation = Poly_Triangulation(3, 1, False)
    triangulation.SetNode(1, gp_Pnt(0, 0, 0))
    triangulation.SetNode(2, gp_Pnt(1, 0, 0))
    triangulation.SetNode(3, gp_Pnt(0, 1, 0))
    triangulation.SetTriangle(1, Poly_Triangle(1, 2, 3))
    a_data_source = MeshDS_DataSource(triangulation)
    assert a_data_source.NbNodes() == 3 and a_data_source.NbElements() == 1
    assert a_data_source.GetNormal(1, 3) == [True, 0.0, 0.0, 1.0]
    assert a_data_source.GetNodeNormal(2, 1) == [True, 0.0, 0.0, 1.0]
    triangulation.AddNormals()
    for i in range(1, 4):
        triangulation.SetNormal(i, gp_Dir(0, 0, -1))
    a_data_source = MeshDS_DataSource(triangulation)
    assert a_data_source.GetNodeNormal(2, 1) == [True, 0.0, 0.0, -1.0]
