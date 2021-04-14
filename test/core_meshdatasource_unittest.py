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
from OCC.Core.MeshDataSource import Mesh_DataSource
from OCC.Core.RWStl import rwstl_ReadFile
from OCC.Core.TColStd import TColStd_Array1OfInteger

STL_BOTTLE_FILENAME = os.path.join('.', 'test_io', 'bottle_ascii.stl')

class TestMeshDataSource(unittest.TestCase):
    def test_instantiate_from_point_and_matrix(self):
        point_list = [gp_Pnt(i, i, i) for i in range(100)]
        int_matrix = [[i for i in range(10)] for j in range(10)]
        Mesh_DataSource(point_list, [[0, 0], [1, 1]])

    def test_instantiate_from_stl_file(self):
        a_stl_mesh = rwstl_ReadFile(STL_BOTTLE_FILENAME)
        Mesh_DataSource(a_stl_mesh)

    def test_create_mesh_datasource(self):
        """ Create a simple mesh data source
        """
        # create data
        coord_data = [gp_Pnt(0, 0, 0), gp_Pnt(0, 1, 0), gp_Pnt(0, 1, -1), gp_Pnt(1, 0, 0), gp_Pnt(1, 1, 0)]
        ele2_node_data = [[0, 1,4 , 3], [1, 2, 4]]
        NodeNormalsData = [[gp_Vec(0, 0, -1), gp_Vec(0, 0, -1), gp_Vec(0, 0, -1), gp_Vec(0, 0, -1)],
                           [gp_Vec(0, 0, -1), gp_Vec(0, 0, -1), gp_Vec(0, 0, -1)]]
        elem_normals_data = [gp_Vec(0, 0, 1), gp_Vec(0, 0, 1)]
        # create data source
        a_data_source = Mesh_DataSource(coord_data,ele2_node_data)
        # check node ids and number of elements
        node_ids = TColStd_Array1OfInteger(1, 4)
        is_ok, nb_nodes = a_data_source.GetNodesByElement(1,node_ids)
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
        self.assertEqual(nx, 0.)
        self.assertEqual(ny, 0.)
        self.assertEqual(nz, -1.)
        is_ok, nx, ny, nz = a_data_source.GetNormal(2, 3)
        self.assertEqual(nx, 0.)
        self.assertEqual(ny, -1.)
        self.assertEqual(nz, 0.)
        # check normal of nodes
        is_ok, nx, ny, nz = a_data_source.GetNodeNormal(1, 1)
        self.assertEqual(nx, 0.)
        self.assertEqual(ny, 0.)
        self.assertEqual(nz, -1.)
        is_ok, nx, ny, nz = a_data_source.GetNodeNormal(1, 2)
        self.assertEqual(nx, 0.)
        # floating point number comparison, rounded to 12 decimals
        self.assertEqual(round(ny, 12), - round(sqrt(2) / 2, 12))
        self.assertEqual(round(nz, 12), - round(sqrt(2) / 2, 12))
        # set and check normal of elements
        a_data_source.SetElemNormals(elem_normals_data)
        is_ok, nx, ny, nz = a_data_source.GetNormal(1, 3)
        self.assertEqual(nx, 0.)
        self.assertEqual(ny, 0.)
        self.assertEqual(nz, 1.)
        # set and check normal of nodes
        a_data_source.SetNodeNormals(NodeNormalsData)
        is_ok, nx, ny, nz = a_data_source.GetNodeNormal(1, 2)
        self.assertEqual(nx, 0.)
        self.assertEqual(ny, 0.)
        self.assertEqual(nz, -1.)


def suite():
    """ builds the test suite """
    test_suite = unittest.TestSuite()
    test_suite.addTest(unittest.makeSuite(TestMeshDataSource))
    return test_suite


if __name__ == '__main__':
    unittest.main()
