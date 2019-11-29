#ifndef AIS_HXX
#define AIS_HXX

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

#include<AIS.hxx>
#include<AIS_AngleDimension.hxx>
#include<AIS_Animation.hxx>
#include<AIS_AnimationCamera.hxx>
#include<AIS_AnimationObject.hxx>
#include<AIS_AnimationTimer.hxx>
#include<AIS_AttributeFilter.hxx>
#include<AIS_BadEdgeFilter.hxx>
#include<AIS_C0RegularityFilter.hxx>
#include<AIS_CameraFrustum.hxx>
#include<AIS_Chamf2dDimension.hxx>
#include<AIS_Chamf3dDimension.hxx>
#include<AIS_Circle.hxx>
#include<AIS_ClearMode.hxx>
#include<AIS_ColorScale.hxx>
#include<AIS_ColoredDrawer.hxx>
#include<AIS_ColoredShape.hxx>
#include<AIS_ConcentricRelation.hxx>
#include<AIS_ConnectStatus.hxx>
#include<AIS_ConnectedInteractive.hxx>
#include<AIS_DataMapIteratorOfDataMapOfIOStatus.hxx>
#include<AIS_DataMapIteratorOfDataMapofIntegerListOfinteractive.hxx>
#include<AIS_DataMapOfIOStatus.hxx>
#include<AIS_DataMapOfShapeDrawer.hxx>
#include<AIS_DataMapofIntegerListOfinteractive.hxx>
#include<AIS_DiameterDimension.hxx>
#include<AIS_Dimension.hxx>
#include<AIS_DimensionOwner.hxx>
#include<AIS_DimensionSelectionMode.hxx>
#include<AIS_DisplayMode.hxx>
#include<AIS_DisplaySpecialSymbol.hxx>
#include<AIS_DisplayStatus.hxx>
#include<AIS_DragAction.hxx>
#include<AIS_EllipseRadiusDimension.hxx>
#include<AIS_EqualDistanceRelation.hxx>
#include<AIS_EqualRadiusRelation.hxx>
#include<AIS_ExclusionFilter.hxx>
#include<AIS_FixRelation.hxx>
#include<AIS_GlobalStatus.hxx>
#include<AIS_GraphicTool.hxx>
#include<AIS_IdenticRelation.hxx>
#include<AIS_IndexedDataMapOfOwnerPrs.hxx>
#include<AIS_InteractiveContext.hxx>
#include<AIS_InteractiveObject.hxx>
#include<AIS_KindOfDimension.hxx>
#include<AIS_KindOfInteractive.hxx>
#include<AIS_KindOfRelation.hxx>
#include<AIS_KindOfSurface.hxx>
#include<AIS_KindOfUnit.hxx>
#include<AIS_LengthDimension.hxx>
#include<AIS_Line.hxx>
#include<AIS_ListIteratorOfListOfInteractive.hxx>
#include<AIS_ListOfInteractive.hxx>
#include<AIS_Manipulator.hxx>
#include<AIS_ManipulatorMode.hxx>
#include<AIS_ManipulatorOwner.hxx>
#include<AIS_MapIteratorOfMapOfInteractive.hxx>
#include<AIS_MapOfInteractive.hxx>
#include<AIS_MaxRadiusDimension.hxx>
#include<AIS_MediaPlayer.hxx>
#include<AIS_MidPointRelation.hxx>
#include<AIS_MinRadiusDimension.hxx>
#include<AIS_MouseGesture.hxx>
#include<AIS_MultipleConnectedInteractive.hxx>
#include<AIS_NListOfEntityOwner.hxx>
#include<AIS_NavigationMode.hxx>
#include<AIS_OffsetDimension.hxx>
#include<AIS_ParallelRelation.hxx>
#include<AIS_PerpendicularRelation.hxx>
#include<AIS_Plane.hxx>
#include<AIS_PlaneTrihedron.hxx>
#include<AIS_Point.hxx>
#include<AIS_PointCloud.hxx>
#include<AIS_RadiusDimension.hxx>
#include<AIS_Relation.hxx>
#include<AIS_RotationMode.hxx>
#include<AIS_RubberBand.hxx>
#include<AIS_SelectStatus.hxx>
#include<AIS_Selection.hxx>
#include<AIS_SelectionModesConcurrency.hxx>
#include<AIS_SequenceOfDimension.hxx>
#include<AIS_SequenceOfInteractive.hxx>
#include<AIS_Shape.hxx>
#include<AIS_SignatureFilter.hxx>
#include<AIS_StandardDatum.hxx>
#include<AIS_StatusOfDetection.hxx>
#include<AIS_StatusOfPick.hxx>
#include<AIS_SymmetricRelation.hxx>
#include<AIS_TangentRelation.hxx>
#include<AIS_TextLabel.hxx>
#include<AIS_TexturedShape.hxx>
#include<AIS_Triangulation.hxx>
#include<AIS_Trihedron.hxx>
#include<AIS_TrihedronOwner.hxx>
#include<AIS_TrihedronSelectionMode.hxx>
#include<AIS_TypeFilter.hxx>
#include<AIS_TypeOfAngle.hxx>
#include<AIS_TypeOfAngleArrowVisibility.hxx>
#include<AIS_TypeOfAttribute.hxx>
#include<AIS_TypeOfAxis.hxx>
#include<AIS_TypeOfDist.hxx>
#include<AIS_TypeOfIso.hxx>
#include<AIS_TypeOfPlane.hxx>
#include<AIS_ViewController.hxx>
#include<AIS_ViewCube.hxx>
#include<AIS_ViewInputBuffer.hxx>
#include<AIS_WalkDelta.hxx>

#endif // AIS_HXX
