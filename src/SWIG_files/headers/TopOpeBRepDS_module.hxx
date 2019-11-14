#ifndef TOPOPEBREPDS_HXX
#define TOPOPEBREPDS_HXX

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

#include<TopOpeBRepDS.hxx>
#include<TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference.hxx>
#include<TopOpeBRepDS_Association.hxx>
#include<TopOpeBRepDS_BuildTool.hxx>
#include<TopOpeBRepDS_Check.hxx>
#include<TopOpeBRepDS_CheckStatus.hxx>
#include<TopOpeBRepDS_Config.hxx>
#include<TopOpeBRepDS_Curve.hxx>
#include<TopOpeBRepDS_CurveData.hxx>
#include<TopOpeBRepDS_CurveExplorer.hxx>
#include<TopOpeBRepDS_CurveIterator.hxx>
#include<TopOpeBRepDS_CurvePointInterference.hxx>
#include<TopOpeBRepDS_DRAW.hxx>
#include<TopOpeBRepDS_DataMapIteratorOfDataMapOfCheckStatus.hxx>
#include<TopOpeBRepDS_DataMapIteratorOfDataMapOfIntegerListOfInterference.hxx>
#include<TopOpeBRepDS_DataMapIteratorOfDataMapOfInterferenceListOfInterference.hxx>
#include<TopOpeBRepDS_DataMapIteratorOfDataMapOfInterferenceShape.hxx>
#include<TopOpeBRepDS_DataMapIteratorOfDataMapOfShapeListOfShapeOn1State.hxx>
#include<TopOpeBRepDS_DataMapIteratorOfDataMapOfShapeState.hxx>
#include<TopOpeBRepDS_DataMapIteratorOfMapOfCurve.hxx>
#include<TopOpeBRepDS_DataMapIteratorOfMapOfIntegerShapeData.hxx>
#include<TopOpeBRepDS_DataMapIteratorOfMapOfPoint.hxx>
#include<TopOpeBRepDS_DataMapIteratorOfMapOfSurface.hxx>
#include<TopOpeBRepDS_DataMapIteratorOfShapeSurface.hxx>
#include<TopOpeBRepDS_DataMapOfCheckStatus.hxx>
#include<TopOpeBRepDS_DataMapOfIntegerListOfInterference.hxx>
#include<TopOpeBRepDS_DataMapOfInterferenceListOfInterference.hxx>
#include<TopOpeBRepDS_DataMapOfInterferenceShape.hxx>
#include<TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State.hxx>
#include<TopOpeBRepDS_DataMapOfShapeState.hxx>
#include<TopOpeBRepDS_DataStructure.hxx>
#include<TopOpeBRepDS_DoubleMapIteratorOfDoubleMapOfIntegerShape.hxx>
#include<TopOpeBRepDS_DoubleMapOfIntegerShape.hxx>
#include<TopOpeBRepDS_Dumper.hxx>
#include<TopOpeBRepDS_EIR.hxx>
#include<TopOpeBRepDS_EXPORT.hxx>
#include<TopOpeBRepDS_Edge3dInterferenceTool.hxx>
#include<TopOpeBRepDS_EdgeInterferenceTool.hxx>
#include<TopOpeBRepDS_EdgeVertexInterference.hxx>
#include<TopOpeBRepDS_Explorer.hxx>
#include<TopOpeBRepDS_FIR.hxx>
#include<TopOpeBRepDS_FaceEdgeInterference.hxx>
#include<TopOpeBRepDS_FaceInterferenceTool.hxx>
#include<TopOpeBRepDS_Filter.hxx>
#include<TopOpeBRepDS_GapFiller.hxx>
#include<TopOpeBRepDS_GapTool.hxx>
#include<TopOpeBRepDS_GeometryData.hxx>
#include<TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference.hxx>
#include<TopOpeBRepDS_HDataStructure.hxx>
#include<TopOpeBRepDS_IndexedDataMapOfShapeWithState.hxx>
#include<TopOpeBRepDS_IndexedDataMapOfVertexPoint.hxx>
#include<TopOpeBRepDS_Interference.hxx>
#include<TopOpeBRepDS_InterferenceIterator.hxx>
#include<TopOpeBRepDS_InterferenceTool.hxx>
#include<TopOpeBRepDS_Kind.hxx>
#include<TopOpeBRepDS_ListIteratorOfListOfInterference.hxx>
#include<TopOpeBRepDS_ListOfInterference.hxx>
#include<TopOpeBRepDS_ListOfShapeOn1State.hxx>
#include<TopOpeBRepDS_MapOfCurve.hxx>
#include<TopOpeBRepDS_MapOfIntegerShapeData.hxx>
#include<TopOpeBRepDS_MapOfPoint.hxx>
#include<TopOpeBRepDS_MapOfShapeData.hxx>
#include<TopOpeBRepDS_MapOfSurface.hxx>
#include<TopOpeBRepDS_Marker.hxx>
#include<TopOpeBRepDS_PDataStructure.hxx>
#include<TopOpeBRepDS_Point.hxx>
#include<TopOpeBRepDS_PointData.hxx>
#include<TopOpeBRepDS_PointExplorer.hxx>
#include<TopOpeBRepDS_PointIterator.hxx>
#include<TopOpeBRepDS_ProcessInterferencesTool.hxx>
#include<TopOpeBRepDS_Reducer.hxx>
#include<TopOpeBRepDS_ShapeData.hxx>
#include<TopOpeBRepDS_ShapeShapeInterference.hxx>
#include<TopOpeBRepDS_ShapeSurface.hxx>
#include<TopOpeBRepDS_ShapeWithState.hxx>
#include<TopOpeBRepDS_SolidSurfaceInterference.hxx>
#include<TopOpeBRepDS_Surface.hxx>
#include<TopOpeBRepDS_SurfaceCurveInterference.hxx>
#include<TopOpeBRepDS_SurfaceData.hxx>
#include<TopOpeBRepDS_SurfaceExplorer.hxx>
#include<TopOpeBRepDS_SurfaceIterator.hxx>
#include<TopOpeBRepDS_TKI.hxx>
#include<TopOpeBRepDS_TOOL.hxx>
#include<TopOpeBRepDS_Transition.hxx>
#include<TopOpeBRepDS_connex.hxx>
#include<TopOpeBRepDS_define.hxx>
#include<TopOpeBRepDS_repvg.hxx>
#include<TopOpeBRepDS_samdom.hxx>

#endif // TOPOPEBREPDS_HXX
