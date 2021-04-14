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

import unittest
import os

from OCC.Core.gp import gp_Pnt
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

    # def test_get_nodes_by_element(self):
    #     a_stl_mesh = rwstl_ReadFile(STL_BOTTLE_FILENAME)
    #     a_data_source = Mesh_DataSource(a_stl_mesh)
    #     array_of_integer = TColStd_Array1OfInteger()
    #     self.assertEqual(array_of_integer.Length(), 0)
    #     nb_nodes, result = a_data_source.GetNodesByElement(10, array_of_integer)
    #     self.assertTrue(result)
    #     self.assertEqual(array_of_integer.Length(), 0)


def suite():
    """ builds the test suite """
    test_suite = unittest.TestSuite()
    test_suite.addTest(unittest.makeSuite(TestMeshDataSource))
    return test_suite


if __name__ == '__main__':
    unittest.main()
