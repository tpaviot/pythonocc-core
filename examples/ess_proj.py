#!/usr/bin/env python
# -*- coding: utf-8 -*-  
from OCC.Display.SimpleGui import init_display
from OCC.Core.gp import gp_Pnt
from OCC.Core.BRepPrimAPI import BRepPrimAPI_MakeBox
from OCC.Core.BRepBuilderAPI import BRepBuilderAPI_MakePolygon
from OCC.Core.BRepBuilderAPI import BRepBuilderAPI_MakeFace
from OCC.Core.BRepOffsetAPI import BRepOffsetAPI_NormalProjection

def main():
	# Make Box
	box = BRepPrimAPI_MakeBox(10, 10, 10)
	# Make plane
	plane = make_plane(15, 15)
	# Project box into plane
	proj = BRepOffsetAPI_NormalProjection(plane.Shape())
	proj.Add(box.Shape())
	proj.Build()

	display, start_display, add_menu, add_function_to_menu = init_display()

	display.DisplayShape(box.Shape(), update=True)

	ais_plane = display.DisplayShape(plane.Shape(), update=True)
	display.Context.SetTransparency(ais_plane, 0.5)

	display.DisplayShape(proj.Shape(), update=True)

	start_display()

def make_plane(x, y):
	"""Make a surface (Face) of the cross-section"""
	# Define points on the corners of the cross-section
	p1 = gp_Pnt(-10, -x, -y)
	p2 = gp_Pnt(-10, x, -y)
	p3 = gp_Pnt(-10, x, y)
	p4 = gp_Pnt(-10, -x, y)

	verts = [p1, p2, p3, p4]
	# Make polygon
	pol = BRepBuilderAPI_MakePolygon()

	for v_ix in verts:
		pol.Add(v_ix)

	pol.Close()

	face = BRepBuilderAPI_MakeFace(pol.Wire())
	return face

if __name__ == '__main__':
	main()
