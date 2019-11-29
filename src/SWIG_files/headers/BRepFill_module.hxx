#ifndef BREPFILL_HXX
#define BREPFILL_HXX

/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)

This file is part of pythonOCC.
pythonOCC is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

pythonOCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.
*/

#include<BRepFill.hxx>
#include<BRepFill_ACRLaw.hxx>
#include<BRepFill_AdvancedEvolved.hxx>
#include<BRepFill_ApproxSeewing.hxx>
#include<BRepFill_CompatibleWires.hxx>
#include<BRepFill_ComputeCLine.hxx>
#include<BRepFill_CurveConstraint.hxx>
#include<BRepFill_DataMapIteratorOfDataMapOfNodeDataMapOfShapeShape.hxx>
#include<BRepFill_DataMapIteratorOfDataMapOfNodeShape.hxx>
#include<BRepFill_DataMapIteratorOfDataMapOfOrientedShapeListOfShape.hxx>
#include<BRepFill_DataMapIteratorOfDataMapOfShapeDataMapOfShapeListOfShape.hxx>
#include<BRepFill_DataMapIteratorOfDataMapOfShapeHArray2OfShape.hxx>
#include<BRepFill_DataMapIteratorOfDataMapOfShapeSequenceOfPnt.hxx>
#include<BRepFill_DataMapIteratorOfDataMapOfShapeSequenceOfReal.hxx>
#include<BRepFill_DataMapOfNodeDataMapOfShapeShape.hxx>
#include<BRepFill_DataMapOfNodeShape.hxx>
#include<BRepFill_DataMapOfOrientedShapeListOfShape.hxx>
#include<BRepFill_DataMapOfShapeDataMapOfShapeListOfShape.hxx>
#include<BRepFill_DataMapOfShapeHArray2OfShape.hxx>
#include<BRepFill_DataMapOfShapeSequenceOfPnt.hxx>
#include<BRepFill_DataMapOfShapeSequenceOfReal.hxx>
#include<BRepFill_Draft.hxx>
#include<BRepFill_DraftLaw.hxx>
#include<BRepFill_Edge3DLaw.hxx>
#include<BRepFill_EdgeFaceAndOrder.hxx>
#include<BRepFill_EdgeOnSurfLaw.hxx>
#include<BRepFill_Evolved.hxx>
#include<BRepFill_FaceAndOrder.hxx>
#include<BRepFill_Filling.hxx>
#include<BRepFill_Generator.hxx>
#include<BRepFill_IndexedDataMapOfOrientedShapeListOfShape.hxx>
#include<BRepFill_ListIteratorOfListOfOffsetWire.hxx>
#include<BRepFill_ListOfOffsetWire.hxx>
#include<BRepFill_LocationLaw.hxx>
#include<BRepFill_MultiLine.hxx>
#include<BRepFill_NSections.hxx>
#include<BRepFill_OffsetAncestors.hxx>
#include<BRepFill_OffsetWire.hxx>
#include<BRepFill_Pipe.hxx>
#include<BRepFill_PipeShell.hxx>
#include<BRepFill_Section.hxx>
#include<BRepFill_SectionLaw.hxx>
#include<BRepFill_SectionPlacement.hxx>
#include<BRepFill_SequenceOfEdgeFaceAndOrder.hxx>
#include<BRepFill_SequenceOfFaceAndOrder.hxx>
#include<BRepFill_SequenceOfSection.hxx>
#include<BRepFill_ShapeLaw.hxx>
#include<BRepFill_Sweep.hxx>
#include<BRepFill_TransitionStyle.hxx>
#include<BRepFill_TrimEdgeTool.hxx>
#include<BRepFill_TrimShellCorner.hxx>
#include<BRepFill_TrimSurfaceTool.hxx>
#include<BRepFill_TypeOfContact.hxx>

#endif // BREPFILL_HXX
