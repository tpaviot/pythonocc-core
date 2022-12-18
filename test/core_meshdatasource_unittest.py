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
import unittest

from OCC.Core.gp import gp_Pnt, gp_Vec
from OCC.Core.MeshDS import MeshDS_DataSource
from OCC.Core.RWStl import rwstl
from OCC.Core.TColStd import TColStd_Array1OfInteger

import numpy as np

STL_BOTTLE_FILENAME = os.path.join(".", "test_io", "bottle_ascii.stl")


class TestMeshDataSource(unittest.TestCase):
    def test_instantiate_from_stl_file(self):
        a_stl_mesh = rwstl.ReadFile(STL_BOTTLE_FILENAME)
        MeshDS_DataSource(a_stl_mesh)

    def test_stl_file_check_bounding_box(self):
        a_stl_mesh = rwstl.ReadFile(STL_BOTTLE_FILENAME)
        a_ds = MeshDS_DataSource(a_stl_mesh)
        bb = a_ds.GetBoundingBox().Get()
        self.assertEqual(bb, (-26.5748, 4.426, -13.6694, 26.5269, 90.2, 13.5885))

    def test_create_mesh_datasource(self):
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
        self.assertTrue(is_ok)
        self.assertEqual(nb_nodes, 4)
        self.assertEqual(node_ids.Value(1), 1)
        self.assertEqual(node_ids.Value(2), 2)
        self.assertEqual(node_ids.Value(3), 5)
        self.assertEqual(node_ids.Value(4), 4)
        is_ok, nb_nodes = a_data_source.GetNodesByElement(2, node_ids)
        self.assertTrue(is_ok)
        self.assertEqual(nb_nodes, 3)
        self.assertEqual(node_ids.Value(1), 2)
        self.assertEqual(node_ids.Value(2), 3)
        self.assertEqual(node_ids.Value(3), 5)
        # check normal of elements
        is_ok, nx, ny, nz = a_data_source.GetNormal(1, 3)
        self.assertTrue(is_ok)
        self.assertEqual(nx, 0.0)
        self.assertEqual(ny, 0.0)
        self.assertEqual(nz, -1.0)
        is_ok, nx, ny, nz = a_data_source.GetNormal(2, 3)
        self.assertTrue(is_ok)
        self.assertEqual(nx, 0.0)
        self.assertEqual(ny, -1.0)
        self.assertEqual(nz, 0.0)
        # check normal of nodes
        is_ok, nx, ny, nz = a_data_source.GetNodeNormal(1, 1)
        self.assertTrue(is_ok)
        self.assertEqual(nx, 0.0)
        self.assertEqual(ny, 0.0)
        self.assertEqual(nz, -1.0)
        is_ok, nx, ny, nz = a_data_source.GetNodeNormal(1, 2)
        self.assertEqual(nx, 0.0)
        self.assertTrue(is_ok)
        # floating point number comparison, rounded to 12 decimals
        self.assertEqual(round(ny, 12), -round(sqrt(2) / 2, 12))
        self.assertEqual(round(nz, 12), -round(sqrt(2) / 2, 12))

    def testset_check_normals(self):
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
        self.assertTrue(is_ok)
        self.assertEqual(nx, 0.0)
        self.assertEqual(ny, 0.0)
        self.assertEqual(nz, 1.0)
        # set and check normal of nodes
        a_data_source.SetNodeNormals(node_normals_data)
        is_ok, nx, ny, nz = a_data_source.GetNodeNormal(1, 2)
        self.assertTrue(is_ok)
        self.assertEqual(nx, 0.0)
        self.assertEqual(ny, 0.0)
        self.assertEqual(nz, -1.0)
        # get all nodes
        all_nodes = a_data_source.GetAllNodes()
        self.assertEqual(all_nodes.NbBuckets(), 101)
        all_nodes.StatisticsToString()
        # get all GetAllElements
        all_elements = a_data_source.GetAllElements()
        all_elements.StatisticsToString()
        self.assertEqual(all_elements.NbBuckets(), 101)

    def test_create_mesh_datasource_from_numpy_ndarray(self):
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
        self.assertTrue(isinstance(a_data_source, MeshDS_DataSource))


def suite():
    """builds the test suite"""
    test_suite = unittest.TestSuite()
    test_suite.addTest(unittest.makeSuite(TestMeshDataSource))
    return test_suite


if __name__ == "__main__":
    unittest.main()
