##Copyright 2009-2015 Thomas Paviot (tpaviot@gmail.com)
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

from OCC.gp import gp_Pnt
from OCC.BRepBuilderAPI import BRepBuilderAPI_MakePolygon
from OCC.GeomAbs import GeomAbs_Arc
from OCC.BRepOffsetAPI import BRepOffsetAPI_MakeEvolved

from OCC.Display.SimpleGui import init_display
display, start_display, add_menu, add_function_to_menu = init_display()


def evolved_shape():
    P = BRepBuilderAPI_MakePolygon()
    P.Add(gp_Pnt(0., 0., 0.))
    P.Add(gp_Pnt(200., 0., 0.))
    P.Add(gp_Pnt(200., 200., 0.))
    P.Add(gp_Pnt(0., 200., 0.))
    P.Add(gp_Pnt(0., 0., 0.))
    wprof = BRepBuilderAPI_MakePolygon(gp_Pnt(0., 0., 0.), gp_Pnt(-60., -60., -200.))
    S = BRepOffsetAPI_MakeEvolved(P.Wire(),
                                  wprof.Wire(),
                                  GeomAbs_Arc,
                                  True,
                                  False,
                                  True,
                                  0.0001)
    S.Build()
    display.DisplayShape(S.Shape(), update=True)

if __name__ == '__main__':
    evolved_shape()
    start_display()
