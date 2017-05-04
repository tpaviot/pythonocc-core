#!/usr/bin/env python

##Copyright 2017 Thomas Paviot (tpaviot@gmail.com)
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

from OCC.Bnd import Bnd_Box
from OCC.BRepBndLib import brepbndlib_Add
from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox, BRepPrimAPI_MakeCylinder, BRepPrimAPI_MakeTorus
from OCC.BRepMesh import BRepMesh_IncrementalMesh


def get_boundingbox(shape, tol=1e-6, use_mesh=True):
    """ return the bounding box of the TopoDS_Shape `shape`
    Parameters
    ----------
    shape : TopoDS_Shape or a subclass such as TopoDS_Face
        the shape to compute the bounding box from
    tol: float
        tolerance of the computed boundingbox
    use_mesh : bool
        a flag that tells whether or not the shape has first to be meshed before the bbox
        computation. This produces more accurate results
    """
    bbox = Bnd_Box()
    bbox.SetGap(tol)
    if use_mesh:
        mesh = BRepMesh_IncrementalMesh()
        mesh.SetParallel(True)
        mesh.SetShape(shape)
        mesh.Perform()
        assert mesh.IsDone()
    brepbndlib_Add(shape, bbox, use_mesh)

    xmin, ymin, zmin, xmax, ymax, zmax = bbox.Get()
    return xmin, ymin, zmin, xmax, ymax, zmax, xmax-xmin, ymax-ymin, zmax-zmin

print("Box bounding box computation")   
box_shape = BRepPrimAPI_MakeBox(10., 20., 30.).Shape()
bb1 = get_boundingbox(box_shape)
print(bb1)

print("Cylinder bounding box computation")   
cyl_shape = BRepPrimAPI_MakeCylinder(10., 20.).Shape()
bb2 = get_boundingbox(cyl_shape)
print(bb2)

print("Torus bounding box computation")   
torus_shape = BRepPrimAPI_MakeCylinder(15., 5.).Shape()
bb3 = get_boundingbox(torus_shape)
print(bb3)
