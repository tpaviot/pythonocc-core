#!/usr/bin/env python

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

from OCC.gp import gp_Pnt, gp_OX, gp_Vec, gp_Trsf, gp_DZ, gp_Ax2, gp_Ax3, gp_Pnt2d, gp_Dir2d, gp_Ax2d
from OCC.GC import GC_MakeArcOfCircle, GC_MakeSegment
from OCC.GCE2d import GCE2d_MakeSegment
from OCC.Geom import Geom_Plane, Geom_CylindricalSurface, Handle_Geom_Plane, Handle_Geom_Surface
from OCC.Geom2d import Geom2d_Ellipse, Geom2d_TrimmedCurve, Handle_Geom2d_Ellipse, Handle_Geom2d_Curve
from OCC.BRepBuilderAPI import BRepBuilderAPI_MakeEdge, BRepBuilderAPI_MakeWire, BRepBuilderAPI_MakeFace, \
    BRepBuilderAPI_Transform
from OCC.BRepPrimAPI import BRepPrimAPI_MakePrism, BRepPrimAPI_MakeCylinder
from OCC.BRepFilletAPI import BRepFilletAPI_MakeFillet
from OCC.BRepAlgoAPI import BRepAlgoAPI_Fuse
from OCC.BRepOffsetAPI import BRepOffsetAPI_MakeThickSolid, BRepOffsetAPI_ThruSections
from OCC.BRepLib import breplib
from OCC.BRep import BRep_Tool_Surface, BRep_Builder
from OCC.TopoDS import topods, TopoDS_Edge, TopoDS_Compound
from OCC.TopExp import TopExp_Explorer
from OCC.TopAbs import TopAbs_EDGE, TopAbs_FACE
from OCC.TopTools import TopTools_ListOfShape
from OCC.Display.SimpleGui import *


def face_is_plane(face):
    """
    Returns True if the TopoDS_Shape is a plane, False otherwise
    """
    hs = BRep_Tool_Surface(face)
    downcast_result = Handle_Geom_Plane.DownCast(hs)
    # The handle is null if downcast failed or is not possible, that is to say the face is not a plane
    if downcast_result.IsNull():
        return False
    else:
        return True


def geom_plane_from_face(aFace):
    """
    Returns the geometric plane entity from a planar surface
    """
    return Handle_Geom_Plane.DownCast(BRep_Tool_Surface(aFace)).GetObject()


height = 70
width = 50
thickness = 30

# The points we'll use to create the profile of the bottle's body
aPnt1 = gp_Pnt(-width / 2.0, 0, 0)
aPnt2 = gp_Pnt(-width / 2.0, -thickness / 4.0, 0)
aPnt3 = gp_Pnt(0, -thickness / 2.0, 0)
aPnt4 = gp_Pnt(width / 2.0, -thickness / 4.0, 0)
aPnt5 = gp_Pnt(width / 2.0, 0, 0)

aArcOfCircle = GC_MakeArcOfCircle(aPnt2, aPnt3, aPnt4)
aSegment1 = GC_MakeSegment(aPnt1, aPnt2)
aSegment2 = GC_MakeSegment(aPnt4, aPnt5)

# Could also construct the line edges directly using the points instead of the resulting line
aEdge1 = BRepBuilderAPI_MakeEdge(aSegment1.Value())
aEdge2 = BRepBuilderAPI_MakeEdge(aArcOfCircle.Value())
aEdge3 = BRepBuilderAPI_MakeEdge(aSegment2.Value())

# Create a wire out of the edges
aWire = BRepBuilderAPI_MakeWire(aEdge1.Edge(), aEdge2.Edge(), aEdge3.Edge())

# Quick way to specify the X axis
xAxis = gp_OX()

# Set up the mirror
aTrsf = gp_Trsf()
aTrsf.SetMirror(xAxis)

# Apply the mirror transformation
aBRespTrsf = BRepBuilderAPI_Transform(aWire.Wire(), aTrsf)

# Get the mirrored shape back out of the transformation and convert back to a wire
aMirroredShape = aBRespTrsf.Shape()

# A wire instead of a generic shape now
aMirroredWire = topods.Wire(aMirroredShape)

# Combine the two constituent wires
mkWire = BRepBuilderAPI_MakeWire()
mkWire.Add(aWire.Wire())
mkWire.Add(aMirroredWire)
myWireProfile = mkWire.Wire()

# The face that we'll sweep to make the prism
myFaceProfile = BRepBuilderAPI_MakeFace(myWireProfile)

# We want to sweep the face along the Z axis to the height
aPrismVec = gp_Vec(0, 0, height)
myBody = BRepPrimAPI_MakePrism(myFaceProfile.Face(), aPrismVec)

# Add fillets to all edges through the explorer
mkFillet = BRepFilletAPI_MakeFillet(myBody.Shape())
anEdgeExplorer = TopExp_Explorer(myBody.Shape(), TopAbs_EDGE)

while anEdgeExplorer.More():
    anEdge = topods.Edge(anEdgeExplorer.Current())
    mkFillet.Add(thickness / 12.0, anEdge)

    anEdgeExplorer.Next()

myBody = mkFillet

# Create the neck of the bottle
neckLocation = gp_Pnt(0, 0, height)
neckAxis = gp_DZ()
neckAx2 = gp_Ax2(neckLocation, neckAxis)

myNeckRadius = thickness / 4.0
myNeckHeight = height / 10.0

mkCylinder = BRepPrimAPI_MakeCylinder(neckAx2, myNeckRadius, myNeckHeight)

myBody = BRepAlgoAPI_Fuse(myBody.Shape(), mkCylinder.Shape())

# Our goal is to find the highest Z face and remove it
faceToRemove = None
zMax = -1

# We have to work our way through all the faces to find the highest Z face so we can remove it for the shell
aFaceExplorer = TopExp_Explorer(myBody.Shape(), TopAbs_FACE)
while aFaceExplorer.More():
    aFace = topods.Face(aFaceExplorer.Current())

    if face_is_plane(aFace):
        aPlane = geom_plane_from_face(aFace)

        # We want the highest Z face, so compare this to the previous faces
        aPnt = aPlane.Location()
        aZ = aPnt.Z()
        if aZ > zMax:
            zMax = aZ
            faceToRemove = aFace

    aFaceExplorer.Next()

facesToRemove = TopTools_ListOfShape()
facesToRemove.Append(faceToRemove)

myBody = BRepOffsetAPI_MakeThickSolid(myBody.Shape(), facesToRemove, -thickness / 50.0, 0.001)

# Set up our surfaces for the threading on the neck
neckAx2_Ax3 = gp_Ax3(neckLocation, gp_DZ())
aCyl1 = Geom_CylindricalSurface(neckAx2_Ax3, myNeckRadius * 0.99)
aCyl2 = Geom_CylindricalSurface(neckAx2_Ax3, myNeckRadius * 1.05)

# Set up the curves for the threads on the bottle's neck
aPnt = gp_Pnt2d(2.0 * math.pi, myNeckHeight / 2.0)
aDir = gp_Dir2d(2.0 * math.pi, myNeckHeight / 4.0)
anAx2d = gp_Ax2d(aPnt, aDir)

aMajor = 2.0 * math.pi
aMinor = myNeckHeight / 10.0

anEllipse1 = Geom2d_Ellipse(anAx2d, aMajor, aMinor)
anEllipse2 = Geom2d_Ellipse(anAx2d, aMajor, aMinor / 4.0)

anArc1 = Geom2d_TrimmedCurve(Handle_Geom2d_Ellipse(anEllipse1), 0, math.pi)
anArc2 = Geom2d_TrimmedCurve(Handle_Geom2d_Ellipse(anEllipse2), 0, math.pi)

anEllipsePnt1 = anEllipse1.Value(0)
anEllipsePnt2 = anEllipse1.Value(math.pi)

aSegment = GCE2d_MakeSegment(anEllipsePnt1, anEllipsePnt2)

# Build edges and wires for threading
anEdge1OnSurf1 = BRepBuilderAPI_MakeEdge(Handle_Geom2d_Curve(anArc1), Handle_Geom_Surface(aCyl1))
anEdge2OnSurf1 = BRepBuilderAPI_MakeEdge(aSegment.Value(), Handle_Geom_Surface(aCyl1))
anEdge1OnSurf2 = BRepBuilderAPI_MakeEdge(Handle_Geom2d_Curve(anArc2), Handle_Geom_Surface(aCyl2))
anEdge2OnSurf2 = BRepBuilderAPI_MakeEdge(aSegment.Value(), Handle_Geom_Surface(aCyl2))

threadingWire1 = BRepBuilderAPI_MakeWire(anEdge1OnSurf1.Edge(), anEdge2OnSurf1.Edge())
threadingWire2 = BRepBuilderAPI_MakeWire(anEdge1OnSurf2.Edge(), anEdge2OnSurf2.Edge())

# Compute the 3D representations of the edges/wires
breplib.BuildCurves3d(threadingWire1.Shape())
breplib.BuildCurves3d(threadingWire2.Shape())

# Create the surfaces of the threading
aTool = BRepOffsetAPI_ThruSections(True)
aTool.AddWire(threadingWire1.Wire())
aTool.AddWire(threadingWire2.Wire())
aTool.CheckCompatibility(False)
myThreading = aTool.Shape()

# Build the resulting compound
aRes = TopoDS_Compound()
aBuilder = BRep_Builder()
aBuilder.MakeCompound(aRes)
aBuilder.Add(aRes, myBody.Shape())
aBuilder.Add(aRes, myThreading)

display, start_display, add_menu, add_function_to_menu = init_display()
display.DisplayColoredShape(aRes)

start_display()
