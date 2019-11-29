#ifndef HLRBREP_HXX
#define HLRBREP_HXX

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

#include<HLRBRep.hxx>
#include<HLRBRep_Algo.hxx>
#include<HLRBRep_AreaLimit.hxx>
#include<HLRBRep_Array1OfEData.hxx>
#include<HLRBRep_Array1OfFData.hxx>
#include<HLRBRep_BCurveTool.hxx>
#include<HLRBRep_BSurfaceTool.hxx>
#include<HLRBRep_BiPnt2D.hxx>
#include<HLRBRep_BiPoint.hxx>
#include<HLRBRep_CInter.hxx>
#include<HLRBRep_CLProps.hxx>
#include<HLRBRep_CLPropsATool.hxx>
#include<HLRBRep_Curve.hxx>
#include<HLRBRep_CurveTool.hxx>
#include<HLRBRep_Data.hxx>
#include<HLRBRep_EdgeBuilder.hxx>
#include<HLRBRep_EdgeData.hxx>
#include<HLRBRep_EdgeFaceTool.hxx>
#include<HLRBRep_EdgeIList.hxx>
#include<HLRBRep_EdgeInterferenceTool.hxx>
#include<HLRBRep_ExactIntersectionPointOfTheIntPCurvePCurveOfCInter.hxx>
#include<HLRBRep_FaceData.hxx>
#include<HLRBRep_FaceIterator.hxx>
#include<HLRBRep_HLRToShape.hxx>
#include<HLRBRep_Hider.hxx>
#include<HLRBRep_IntConicCurveOfCInter.hxx>
#include<HLRBRep_InterCSurf.hxx>
#include<HLRBRep_InternalAlgo.hxx>
#include<HLRBRep_Intersector.hxx>
#include<HLRBRep_LineTool.hxx>
#include<HLRBRep_ListIteratorOfListOfBPnt2D.hxx>
#include<HLRBRep_ListIteratorOfListOfBPoint.hxx>
#include<HLRBRep_ListOfBPnt2D.hxx>
#include<HLRBRep_ListOfBPoint.hxx>
#include<HLRBRep_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfCInter.hxx>
#include<HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter.hxx>
#include<HLRBRep_PolyAlgo.hxx>
#include<HLRBRep_PolyHLRToShape.hxx>
#include<HLRBRep_SLProps.hxx>
#include<HLRBRep_SLPropsATool.hxx>
#include<HLRBRep_SeqOfShapeBounds.hxx>
#include<HLRBRep_ShapeBounds.hxx>
#include<HLRBRep_ShapeToHLR.hxx>
#include<HLRBRep_Surface.hxx>
#include<HLRBRep_SurfaceTool.hxx>
#include<HLRBRep_TheCSFunctionOfInterCSurf.hxx>
#include<HLRBRep_TheCurveLocatorOfTheProjPCurOfCInter.hxx>
#include<HLRBRep_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfCInter.hxx>
#include<HLRBRep_TheExactInterCSurf.hxx>
#include<HLRBRep_TheIntConicCurveOfCInter.hxx>
#include<HLRBRep_TheIntPCurvePCurveOfCInter.hxx>
#include<HLRBRep_TheInterferenceOfInterCSurf.hxx>
#include<HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter.hxx>
#include<HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter.hxx>
#include<HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter.hxx>
#include<HLRBRep_ThePolygonOfInterCSurf.hxx>
#include<HLRBRep_ThePolygonToolOfInterCSurf.hxx>
#include<HLRBRep_ThePolyhedronOfInterCSurf.hxx>
#include<HLRBRep_ThePolyhedronToolOfInterCSurf.hxx>
#include<HLRBRep_TheProjPCurOfCInter.hxx>
#include<HLRBRep_TheQuadCurvExactInterCSurf.hxx>
#include<HLRBRep_TheQuadCurvFuncOfTheQuadCurvExactInterCSurf.hxx>
#include<HLRBRep_TypeOfResultingEdge.hxx>
#include<HLRBRep_VertexList.hxx>

#endif // HLRBREP_HXX
