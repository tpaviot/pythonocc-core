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

import math
from OCC.Core.gp import gp_Dir, gp_Pln, gp_Ax3, gp_XOY
from OCC.Core.BRepPrimAPI import BRepPrimAPI_MakeBox
from OCC.Core.BRepOffsetAPI import BRepOffsetAPI_DraftAngle
from OCC.Core.Precision import precision_Angular
from OCC.Core.BRep import BRep_Tool_Surface
from OCC.Core.TopExp import TopExp_Explorer
from OCC.Core.TopAbs import TopAbs_FACE
from OCC.Core.Geom import Handle_Geom_Plane_DownCast
from OCC.Core.TopoDS import topods_Face

from OCC.Display.SimpleGui import init_display
display, start_display, add_menu, add_function_to_menu = init_display()


def draft_angle(event=None):
    S = BRepPrimAPI_MakeBox(200., 300., 150.).Shape()
    adraft = BRepOffsetAPI_DraftAngle(S)
    topExp = TopExp_Explorer()
    topExp.Init(S, TopAbs_FACE)
    while topExp.More():
        face = topods_Face(topExp.Current())
        surf = Handle_Geom_Plane_DownCast(BRep_Tool_Surface(face)).GetObject()
        dirf = surf.Pln().Axis().Direction()
        ddd = gp_Dir(0, 0, 1)
        if dirf.IsNormal(ddd, precision_Angular()):
            adraft.Add(face, ddd, math.radians(15), gp_Pln(gp_Ax3(gp_XOY())))
        topExp.Next()
    adraft.Build()
    display.DisplayShape(adraft.Shape(), update=True)


if __name__ == '__main__':
    draft_angle()
    start_display()
