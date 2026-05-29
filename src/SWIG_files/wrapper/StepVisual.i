/*
Copyright 2008-2026 Thomas Paviot (tpaviot@gmail.com)

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
%define STEPVISUALDOCSTRING
"StepVisual module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_stepvisual.html"
%enddef
%module (package="OCC.Core", docstring=STEPVISUALDOCSTRING) StepVisual


%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
#include<StepVisual_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<StepShape_module.hxx>
#include<StepData_module.hxx>
#include<StepRepr_module.hxx>
#include<StepGeom_module.hxx>
#include<TCollection_module.hxx>
#include<StepBasic_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<Message_module.hxx>
#include<Interface_module.hxx>
#include<MoniTool_module.hxx>
#include<TopoDS_module.hxx>
#include<Resource_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import StepShape.i
%import StepData.i
%import StepRepr.i
%import StepGeom.i
%import TCollection.i
%import StepBasic.i
%import TColgp.i
%import TColStd.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum StepVisual_CentralOrParallel {
	StepVisual_copCentral = 0,
	StepVisual_copParallel = 1,
};

enum StepVisual_MarkerType {
	StepVisual_mtDot = 0,
	StepVisual_mtX = 1,
	StepVisual_mtPlus = 2,
	StepVisual_mtAsterisk = 3,
	StepVisual_mtRing = 4,
	StepVisual_mtSquare = 5,
	StepVisual_mtTriangle = 6,
};

enum StepVisual_NullStyle {
	StepVisual_Null = 0,
};

enum StepVisual_ShadingSurfaceMethod {
	StepVisual_ssmConstantShading = 0,
	StepVisual_ssmColourShading = 1,
	StepVisual_ssmDotShading = 2,
	StepVisual_ssmNormalShading = 3,
};

enum StepVisual_SurfaceSide {
	StepVisual_ssNegative = 0,
	StepVisual_ssPositive = 1,
	StepVisual_ssBoth = 2,
};

enum StepVisual_TextPath {
	StepVisual_tpUp = 0,
	StepVisual_tpRight = 1,
	StepVisual_tpDown = 2,
	StepVisual_tpLeft = 3,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class StepVisual_CentralOrParallel(IntEnum):
	StepVisual_copCentral = 0
	StepVisual_copParallel = 1
StepVisual_copCentral = StepVisual_CentralOrParallel.StepVisual_copCentral
StepVisual_copParallel = StepVisual_CentralOrParallel.StepVisual_copParallel

class StepVisual_MarkerType(IntEnum):
	StepVisual_mtDot = 0
	StepVisual_mtX = 1
	StepVisual_mtPlus = 2
	StepVisual_mtAsterisk = 3
	StepVisual_mtRing = 4
	StepVisual_mtSquare = 5
	StepVisual_mtTriangle = 6
StepVisual_mtDot = StepVisual_MarkerType.StepVisual_mtDot
StepVisual_mtX = StepVisual_MarkerType.StepVisual_mtX
StepVisual_mtPlus = StepVisual_MarkerType.StepVisual_mtPlus
StepVisual_mtAsterisk = StepVisual_MarkerType.StepVisual_mtAsterisk
StepVisual_mtRing = StepVisual_MarkerType.StepVisual_mtRing
StepVisual_mtSquare = StepVisual_MarkerType.StepVisual_mtSquare
StepVisual_mtTriangle = StepVisual_MarkerType.StepVisual_mtTriangle

class StepVisual_NullStyle(IntEnum):
	StepVisual_Null = 0
StepVisual_Null = StepVisual_NullStyle.StepVisual_Null

class StepVisual_ShadingSurfaceMethod(IntEnum):
	StepVisual_ssmConstantShading = 0
	StepVisual_ssmColourShading = 1
	StepVisual_ssmDotShading = 2
	StepVisual_ssmNormalShading = 3
StepVisual_ssmConstantShading = StepVisual_ShadingSurfaceMethod.StepVisual_ssmConstantShading
StepVisual_ssmColourShading = StepVisual_ShadingSurfaceMethod.StepVisual_ssmColourShading
StepVisual_ssmDotShading = StepVisual_ShadingSurfaceMethod.StepVisual_ssmDotShading
StepVisual_ssmNormalShading = StepVisual_ShadingSurfaceMethod.StepVisual_ssmNormalShading

class StepVisual_SurfaceSide(IntEnum):
	StepVisual_ssNegative = 0
	StepVisual_ssPositive = 1
	StepVisual_ssBoth = 2
StepVisual_ssNegative = StepVisual_SurfaceSide.StepVisual_ssNegative
StepVisual_ssPositive = StepVisual_SurfaceSide.StepVisual_ssPositive
StepVisual_ssBoth = StepVisual_SurfaceSide.StepVisual_ssBoth

class StepVisual_TextPath(IntEnum):
	StepVisual_tpUp = 0
	StepVisual_tpRight = 1
	StepVisual_tpDown = 2
	StepVisual_tpLeft = 3
StepVisual_tpUp = StepVisual_TextPath.StepVisual_tpUp
StepVisual_tpRight = StepVisual_TextPath.StepVisual_tpRight
StepVisual_tpDown = StepVisual_TextPath.StepVisual_tpDown
StepVisual_tpLeft = StepVisual_TextPath.StepVisual_tpLeft
};
/* end python proxy for enums */

/* handles */
%wrap_handle(StepVisual_AnnotationFillArea)
%wrap_handle(StepVisual_AnnotationText)
%wrap_handle(StepVisual_AreaInSet)
%wrap_handle(StepVisual_CameraImage)
%wrap_handle(StepVisual_CameraModel)
%wrap_handle(StepVisual_CameraModelD3MultiClippingIntersection)
%wrap_handle(StepVisual_CameraModelD3MultiClippingUnion)
%wrap_handle(StepVisual_CameraUsage)
%wrap_handle(StepVisual_Colour)
%wrap_handle(StepVisual_CompositeText)
%wrap_handle(StepVisual_CurveStyle)
%wrap_handle(StepVisual_CurveStyleFont)
%wrap_handle(StepVisual_CurveStyleFontPattern)
%wrap_handle(StepVisual_DraughtingCallout)
%wrap_handle(StepVisual_DraughtingModel)
%wrap_handle(StepVisual_ExternallyDefinedCurveFont)
%wrap_handle(StepVisual_ExternallyDefinedTextFont)
%wrap_handle(StepVisual_FillAreaStyle)
%wrap_handle(StepVisual_FillAreaStyleColour)
%wrap_handle(StepVisual_Invisibility)
%wrap_handle(StepVisual_MarkerMember)
%wrap_handle(StepVisual_NullStyleMember)
%wrap_handle(StepVisual_PlanarExtent)
%wrap_handle(StepVisual_PointStyle)
%wrap_handle(StepVisual_PreDefinedItem)
%wrap_handle(StepVisual_PresentationLayerAssignment)
%wrap_handle(StepVisual_PresentationLayerUsage)
%wrap_handle(StepVisual_PresentationRepresentation)
%wrap_handle(StepVisual_PresentationSet)
%wrap_handle(StepVisual_PresentationSize)
%wrap_handle(StepVisual_PresentationStyleAssignment)
%wrap_handle(StepVisual_PresentedItem)
%wrap_handle(StepVisual_PresentedItemRepresentation)
%wrap_handle(StepVisual_StyledItem)
%wrap_handle(StepVisual_SurfaceSideStyle)
%wrap_handle(StepVisual_SurfaceStyleBoundary)
%wrap_handle(StepVisual_SurfaceStyleControlGrid)
%wrap_handle(StepVisual_SurfaceStyleFillArea)
%wrap_handle(StepVisual_SurfaceStyleParameterLine)
%wrap_handle(StepVisual_SurfaceStyleReflectanceAmbient)
%wrap_handle(StepVisual_SurfaceStyleRendering)
%wrap_handle(StepVisual_SurfaceStyleSegmentationCurve)
%wrap_handle(StepVisual_SurfaceStyleSilhouette)
%wrap_handle(StepVisual_SurfaceStyleTransparent)
%wrap_handle(StepVisual_SurfaceStyleUsage)
%wrap_handle(StepVisual_Template)
%wrap_handle(StepVisual_TemplateInstance)
%wrap_handle(StepVisual_TessellatedItem)
%wrap_handle(StepVisual_TessellatedShapeRepresentation)
%wrap_handle(StepVisual_TextLiteral)
%wrap_handle(StepVisual_TextStyle)
%wrap_handle(StepVisual_TextStyleForDefinedFont)
%wrap_handle(StepVisual_ViewVolume)
%wrap_handle(StepVisual_AnnotationOccurrence)
%wrap_handle(StepVisual_BackgroundColour)
%wrap_handle(StepVisual_CameraImage2dWithScale)
%wrap_handle(StepVisual_CameraImage3dWithScale)
%wrap_handle(StepVisual_CameraModelD2)
%wrap_handle(StepVisual_CameraModelD3)
%wrap_handle(StepVisual_CharacterizedObjAndRepresentationAndDraughtingModel)
%wrap_handle(StepVisual_ColourSpecification)
%wrap_handle(StepVisual_CompositeTextWithExtent)
%wrap_handle(StepVisual_ContextDependentInvisibility)
%wrap_handle(StepVisual_CoordinatesList)
%wrap_handle(StepVisual_MechanicalDesignGeometricPresentationRepresentation)
%wrap_handle(StepVisual_OverRidingStyledItem)
%wrap_handle(StepVisual_PlanarBox)
%wrap_handle(StepVisual_PreDefinedColour)
%wrap_handle(StepVisual_PreDefinedCurveFont)
%wrap_handle(StepVisual_PreDefinedTextFont)
%wrap_handle(StepVisual_PresentationArea)
%wrap_handle(StepVisual_PresentationStyleByContext)
%wrap_handle(StepVisual_PresentationView)
%wrap_handle(StepVisual_RepositionedTessellatedItem)
%wrap_handle(StepVisual_SurfaceStyleReflectanceAmbientDiffuse)
%wrap_handle(StepVisual_SurfaceStyleRenderingWithProperties)
%wrap_handle(StepVisual_TessellatedAnnotationOccurrence)
%wrap_handle(StepVisual_TessellatedCurveSet)
%wrap_handle(StepVisual_TessellatedGeometricSet)
%wrap_handle(StepVisual_TessellatedPointSet)
%wrap_handle(StepVisual_TessellatedShapeRepresentationWithAccuracyParameters)
%wrap_handle(StepVisual_TessellatedShell)
%wrap_handle(StepVisual_TessellatedSolid)
%wrap_handle(StepVisual_TessellatedStructuredItem)
%wrap_handle(StepVisual_TessellatedSurfaceSet)
%wrap_handle(StepVisual_TessellatedWire)
%wrap_handle(StepVisual_TextStyleWithBoxCharacteristics)
%wrap_handle(StepVisual_AnnotationCurveOccurrence)
%wrap_handle(StepVisual_AnnotationFillAreaOccurrence)
%wrap_handle(StepVisual_AnnotationPlane)
%wrap_handle(StepVisual_AnnotationTextOccurrence)
%wrap_handle(StepVisual_CameraModelD3MultiClipping)
%wrap_handle(StepVisual_ColourRgb)
%wrap_handle(StepVisual_ComplexTriangulatedSurfaceSet)
%wrap_handle(StepVisual_ContextDependentOverRidingStyledItem)
%wrap_handle(StepVisual_DraughtingAnnotationOccurrence)
%wrap_handle(StepVisual_DraughtingPreDefinedColour)
%wrap_handle(StepVisual_DraughtingPreDefinedCurveFont)
%wrap_handle(StepVisual_MechanicalDesignGeometricPresentationArea)
%wrap_handle(StepVisual_RepositionedTessellatedGeometricSet)
%wrap_handle(StepVisual_SurfaceStyleReflectanceAmbientDiffuseSpecular)
%wrap_handle(StepVisual_TessellatedEdge)
%wrap_handle(StepVisual_TessellatedFace)
%wrap_handle(StepVisual_TessellatedVertex)
%wrap_handle(StepVisual_TriangulatedSurfaceSet)
%wrap_handle(StepVisual_AnnotationCurveOccurrenceAndGeomReprItem)
%wrap_handle(StepVisual_ComplexTriangulatedFace)
%wrap_handle(StepVisual_CubicBezierTessellatedEdge)
%wrap_handle(StepVisual_CubicBezierTriangulatedFace)
%wrap_handle(StepVisual_TessellatedConnectingEdge)
%wrap_handle(StepVisual_TriangulatedFace)
/* end handles declaration */

/* templates */
%template(StepVisual_Array1OfAnnotationPlaneElement) NCollection_Array1<StepVisual_AnnotationPlaneElement>;
Array1ExtendIter(StepVisual_AnnotationPlaneElement)

%template(StepVisual_Array1OfBoxCharacteristicSelect) NCollection_Array1<StepVisual_BoxCharacteristicSelect>;
Array1ExtendIter(StepVisual_BoxCharacteristicSelect)

%template(StepVisual_Array1OfCameraModelD3MultiClippingInterectionSelect) NCollection_Array1<StepVisual_CameraModelD3MultiClippingInterectionSelect>;
Array1ExtendIter(StepVisual_CameraModelD3MultiClippingInterectionSelect)

%template(StepVisual_Array1OfCameraModelD3MultiClippingUnionSelect) NCollection_Array1<StepVisual_CameraModelD3MultiClippingUnionSelect>;
Array1ExtendIter(StepVisual_CameraModelD3MultiClippingUnionSelect)

%template(StepVisual_Array1OfCurveStyleFontPattern) NCollection_Array1<opencascade::handle<StepVisual_CurveStyleFontPattern>>;
Array1ExtendIter(opencascade::handle<StepVisual_CurveStyleFontPattern>)

%template(StepVisual_Array1OfDirectionCountSelect) NCollection_Array1<StepVisual_DirectionCountSelect>;
Array1ExtendIter(StepVisual_DirectionCountSelect)

%template(StepVisual_Array1OfDraughtingCalloutElement) NCollection_Array1<StepVisual_DraughtingCalloutElement>;
Array1ExtendIter(StepVisual_DraughtingCalloutElement)

%template(StepVisual_Array1OfFillStyleSelect) NCollection_Array1<StepVisual_FillStyleSelect>;
Array1ExtendIter(StepVisual_FillStyleSelect)

%template(StepVisual_Array1OfInvisibleItem) NCollection_Array1<StepVisual_InvisibleItem>;
Array1ExtendIter(StepVisual_InvisibleItem)

%template(StepVisual_Array1OfLayeredItem) NCollection_Array1<StepVisual_LayeredItem>;
Array1ExtendIter(StepVisual_LayeredItem)

%template(StepVisual_Array1OfPresentationStyleAssignment) NCollection_Array1<opencascade::handle<StepVisual_PresentationStyleAssignment>>;
Array1ExtendIter(opencascade::handle<StepVisual_PresentationStyleAssignment>)

%template(StepVisual_Array1OfPresentationStyleSelect) NCollection_Array1<StepVisual_PresentationStyleSelect>;
Array1ExtendIter(StepVisual_PresentationStyleSelect)

%template(StepVisual_Array1OfRenderingPropertiesSelect) NCollection_Array1<StepVisual_RenderingPropertiesSelect>;
Array1ExtendIter(StepVisual_RenderingPropertiesSelect)

%template(StepVisual_Array1OfStyleContextSelect) NCollection_Array1<StepVisual_StyleContextSelect>;
Array1ExtendIter(StepVisual_StyleContextSelect)

%template(StepVisual_Array1OfSurfaceStyleElementSelect) NCollection_Array1<StepVisual_SurfaceStyleElementSelect>;
Array1ExtendIter(StepVisual_SurfaceStyleElementSelect)

%template(StepVisual_Array1OfTessellatedEdgeOrVertex) NCollection_Array1<StepVisual_TessellatedEdgeOrVertex>;
Array1ExtendIter(StepVisual_TessellatedEdgeOrVertex)

%template(StepVisual_Array1OfTessellatedStructuredItem) NCollection_Array1<opencascade::handle<StepVisual_TessellatedStructuredItem>>;
Array1ExtendIter(opencascade::handle<StepVisual_TessellatedStructuredItem>)

%template(StepVisual_Array1OfTextOrCharacter) NCollection_Array1<StepVisual_TextOrCharacter>;
Array1ExtendIter(StepVisual_TextOrCharacter)

/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<StepVisual_AnnotationPlaneElement> StepVisual_Array1OfAnnotationPlaneElement;
typedef NCollection_Array1<StepVisual_BoxCharacteristicSelect> StepVisual_Array1OfBoxCharacteristicSelect;
typedef NCollection_Array1<StepVisual_CameraModelD3MultiClippingInterectionSelect> StepVisual_Array1OfCameraModelD3MultiClippingInterectionSelect;
typedef NCollection_Array1<StepVisual_CameraModelD3MultiClippingUnionSelect> StepVisual_Array1OfCameraModelD3MultiClippingUnionSelect;
typedef NCollection_Array1<opencascade::handle<StepVisual_CurveStyleFontPattern>> StepVisual_Array1OfCurveStyleFontPattern;
typedef NCollection_Array1<StepVisual_DirectionCountSelect> StepVisual_Array1OfDirectionCountSelect;
typedef NCollection_Array1<StepVisual_DraughtingCalloutElement> StepVisual_Array1OfDraughtingCalloutElement;
typedef NCollection_Array1<StepVisual_FillStyleSelect> StepVisual_Array1OfFillStyleSelect;
typedef NCollection_Array1<StepVisual_InvisibleItem> StepVisual_Array1OfInvisibleItem;
typedef NCollection_Array1<StepVisual_LayeredItem> StepVisual_Array1OfLayeredItem;
typedef NCollection_Array1<opencascade::handle<StepVisual_PresentationStyleAssignment>> StepVisual_Array1OfPresentationStyleAssignment;
typedef NCollection_Array1<StepVisual_PresentationStyleSelect> StepVisual_Array1OfPresentationStyleSelect;
typedef NCollection_Array1<StepVisual_RenderingPropertiesSelect> StepVisual_Array1OfRenderingPropertiesSelect;
typedef NCollection_Array1<StepVisual_StyleContextSelect> StepVisual_Array1OfStyleContextSelect;
typedef NCollection_Array1<StepVisual_SurfaceStyleElementSelect> StepVisual_Array1OfSurfaceStyleElementSelect;
typedef NCollection_Array1<StepVisual_TessellatedEdgeOrVertex> StepVisual_Array1OfTessellatedEdgeOrVertex;
typedef NCollection_Array1<opencascade::handle<StepVisual_TessellatedStructuredItem>> StepVisual_Array1OfTessellatedStructuredItem;
typedef NCollection_Array1<StepVisual_TextOrCharacter> StepVisual_Array1OfTextOrCharacter;
typedef NCollection_HArray1<StepVisual_AnnotationPlaneElement> StepVisual_HArray1OfAnnotationPlaneElement;
typedef NCollection_HArray1<StepVisual_BoxCharacteristicSelect> StepVisual_HArray1OfBoxCharacteristicSelect;
typedef NCollection_HArray1<StepVisual_CameraModelD3MultiClippingInterectionSelect> StepVisual_HArray1OfCameraModelD3MultiClippingInterectionSelect;
typedef NCollection_HArray1<StepVisual_CameraModelD3MultiClippingUnionSelect> StepVisual_HArray1OfCameraModelD3MultiClippingUnionSelect;
typedef NCollection_HArray1<opencascade::handle<StepVisual_CurveStyleFontPattern>> StepVisual_HArray1OfCurveStyleFontPattern;
typedef NCollection_HArray1<StepVisual_DirectionCountSelect> StepVisual_HArray1OfDirectionCountSelect;
typedef NCollection_HArray1<StepVisual_DraughtingCalloutElement> StepVisual_HArray1OfDraughtingCalloutElement;
typedef NCollection_HArray1<StepVisual_FillStyleSelect> StepVisual_HArray1OfFillStyleSelect;
typedef NCollection_HArray1<StepVisual_InvisibleItem> StepVisual_HArray1OfInvisibleItem;
typedef NCollection_HArray1<StepVisual_LayeredItem> StepVisual_HArray1OfLayeredItem;
typedef NCollection_HArray1<opencascade::handle<StepVisual_PresentationStyleAssignment>> StepVisual_HArray1OfPresentationStyleAssignment;
typedef NCollection_HArray1<StepVisual_PresentationStyleSelect> StepVisual_HArray1OfPresentationStyleSelect;
typedef NCollection_HArray1<StepVisual_RenderingPropertiesSelect> StepVisual_HArray1OfRenderingPropertiesSelect;
typedef NCollection_HArray1<StepVisual_StyleContextSelect> StepVisual_HArray1OfStyleContextSelect;
typedef NCollection_HArray1<StepVisual_SurfaceStyleElementSelect> StepVisual_HArray1OfSurfaceStyleElementSelect;
typedef NCollection_HArray1<StepVisual_TessellatedEdgeOrVertex> StepVisual_HArray1OfTessellatedEdgeOrVertex;
typedef NCollection_HArray1<opencascade::handle<StepVisual_TessellatedStructuredItem>> StepVisual_HArray1OfTessellatedStructuredItem;
typedef NCollection_HArray1<StepVisual_TextOrCharacter> StepVisual_HArray1OfTextOrCharacter;
/* end typedefs declaration */

/**************************************
* class StepVisual_AnnotationFillArea *
**************************************/
class StepVisual_AnnotationFillArea : public StepShape_GeometricCurveSet {
	public:
		/****** StepVisual_AnnotationFillArea::StepVisual_AnnotationFillArea ******/
		/****** md5 signature: 707299ee72fc5fde632708b68da0d36f ******/
		%feature("compactdefaultargs") StepVisual_AnnotationFillArea;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a AnnotationFillArea.
") StepVisual_AnnotationFillArea;
		 StepVisual_AnnotationFillArea();

};


%make_alias(StepVisual_AnnotationFillArea)

%extend StepVisual_AnnotationFillArea {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class StepVisual_AnnotationPlaneElement *
******************************************/
class StepVisual_AnnotationPlaneElement : public StepData_SelectType {
	public:
		/****** StepVisual_AnnotationPlaneElement::StepVisual_AnnotationPlaneElement ******/
		/****** md5 signature: ce048475b338d8fd2919d43a1446094e ******/
		%feature("compactdefaultargs") StepVisual_AnnotationPlaneElement;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a AnnotationPlaneElement select type.
") StepVisual_AnnotationPlaneElement;
		 StepVisual_AnnotationPlaneElement();

		/****** StepVisual_AnnotationPlaneElement::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a IdAttributeSelect Kind Entity that is: 1 -> DraughtingCallout 2 -> StyledItem 0 else.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepVisual_AnnotationPlaneElement::DraughtingCallout ******/
		/****** md5 signature: dcafc9e5148472aaa32c6a7f0e12127f ******/
		%feature("compactdefaultargs") DraughtingCallout;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_DraughtingCallout>

Description
-----------
returns Value as a DraughtingCallout (Null if another type).
") DraughtingCallout;
		opencascade::handle<StepVisual_DraughtingCallout> DraughtingCallout();

		/****** StepVisual_AnnotationPlaneElement::StyledItem ******/
		/****** md5 signature: 61c7563ce33340acb54e8fd4f4208e5f ******/
		%feature("compactdefaultargs") StyledItem;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_StyledItem>

Description
-----------
returns Value as a StyledItem (Null if another type).
") StyledItem;
		opencascade::handle<StepVisual_StyledItem> StyledItem();

};


%extend StepVisual_AnnotationPlaneElement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class StepVisual_AnnotationText *
**********************************/
class StepVisual_AnnotationText : public StepRepr_MappedItem {
	public:
		/****** StepVisual_AnnotationText::StepVisual_AnnotationText ******/
		/****** md5 signature: e8f0a57ab81f51928e2d9d16dc632ee0 ******/
		%feature("compactdefaultargs") StepVisual_AnnotationText;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a AnnotationText.
") StepVisual_AnnotationText;
		 StepVisual_AnnotationText();

};


%make_alias(StepVisual_AnnotationText)

%extend StepVisual_AnnotationText {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class StepVisual_AreaInSet *
*****************************/
class StepVisual_AreaInSet : public Standard_Transient {
	public:
		/****** StepVisual_AreaInSet::StepVisual_AreaInSet ******/
		/****** md5 signature: 6bd3ed0e3367795e4fc738a6ea2082cf ******/
		%feature("compactdefaultargs") StepVisual_AreaInSet;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a AreaInSet.
") StepVisual_AreaInSet;
		 StepVisual_AreaInSet();

		/****** StepVisual_AreaInSet::Area ******/
		/****** md5 signature: 7c3b8c3fe5bec4dbc522e32daafaa5c8 ******/
		%feature("compactdefaultargs") Area;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_PresentationArea>

Description
-----------
No available documentation.
") Area;
		opencascade::handle<StepVisual_PresentationArea> Area();

		/****** StepVisual_AreaInSet::InSet ******/
		/****** md5 signature: 3fcd983ed074b0c1d012732053dbda10 ******/
		%feature("compactdefaultargs") InSet;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_PresentationSet>

Description
-----------
No available documentation.
") InSet;
		opencascade::handle<StepVisual_PresentationSet> InSet();

		/****** StepVisual_AreaInSet::Init ******/
		/****** md5 signature: 66f984979376799659b1ee12e421f5a4 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aArea: StepVisual_PresentationArea
aInSet: StepVisual_PresentationSet

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepVisual_PresentationArea> & aArea, const opencascade::handle<StepVisual_PresentationSet> & aInSet);

		/****** StepVisual_AreaInSet::SetArea ******/
		/****** md5 signature: 4c0673e54caab46f527e5d3f0c2ff57b ******/
		%feature("compactdefaultargs") SetArea;
		%feature("autodoc", "
Parameters
----------
aArea: StepVisual_PresentationArea

Return
-------
None

Description
-----------
No available documentation.
") SetArea;
		void SetArea(const opencascade::handle<StepVisual_PresentationArea> & aArea);

		/****** StepVisual_AreaInSet::SetInSet ******/
		/****** md5 signature: beb75360c3fe7bff0ee28192917939e5 ******/
		%feature("compactdefaultargs") SetInSet;
		%feature("autodoc", "
Parameters
----------
aInSet: StepVisual_PresentationSet

Return
-------
None

Description
-----------
No available documentation.
") SetInSet;
		void SetInSet(const opencascade::handle<StepVisual_PresentationSet> & aInSet);

};


%make_alias(StepVisual_AreaInSet)

%extend StepVisual_AreaInSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class StepVisual_AreaOrView *
******************************/
class StepVisual_AreaOrView : public StepData_SelectType {
	public:
		/****** StepVisual_AreaOrView::StepVisual_AreaOrView ******/
		/****** md5 signature: 456c8edf42511e27616007d346726dc9 ******/
		%feature("compactdefaultargs") StepVisual_AreaOrView;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a AreaOrView SelectType.
") StepVisual_AreaOrView;
		 StepVisual_AreaOrView();

		/****** StepVisual_AreaOrView::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a AreaOrView Kind Entity that is: 1 -> PresentationArea 2 -> PresentationView 0 else.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepVisual_AreaOrView::PresentationArea ******/
		/****** md5 signature: 6adf2ef7fa0a7b503035224ca0f9247c ******/
		%feature("compactdefaultargs") PresentationArea;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_PresentationArea>

Description
-----------
returns Value as a PresentationArea (Null if another type).
") PresentationArea;
		opencascade::handle<StepVisual_PresentationArea> PresentationArea();

		/****** StepVisual_AreaOrView::PresentationView ******/
		/****** md5 signature: f42d5482c64642bbea3f6f415c07a2aa ******/
		%feature("compactdefaultargs") PresentationView;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_PresentationView>

Description
-----------
returns Value as a PresentationView (Null if another type).
") PresentationView;
		opencascade::handle<StepVisual_PresentationView> PresentationView();

};


%extend StepVisual_AreaOrView {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class StepVisual_BoxCharacteristicSelect *
*******************************************/
class StepVisual_BoxCharacteristicSelect {
	public:
		/****** StepVisual_BoxCharacteristicSelect::StepVisual_BoxCharacteristicSelect ******/
		/****** md5 signature: f127438ff3bfb738f33cb51f7c851012 ******/
		%feature("compactdefaultargs") StepVisual_BoxCharacteristicSelect;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepVisual_BoxCharacteristicSelect;
		 StepVisual_BoxCharacteristicSelect();

		/****** StepVisual_BoxCharacteristicSelect::RealValue ******/
		/****** md5 signature: c2cf21cf42a875e7427474a09b5db0a4 ******/
		%feature("compactdefaultargs") RealValue;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") RealValue;
		double RealValue();

		/****** StepVisual_BoxCharacteristicSelect::SetRealValue ******/
		/****** md5 signature: 7c1eb8b9c3ad2daac293953b68286a40 ******/
		%feature("compactdefaultargs") SetRealValue;
		%feature("autodoc", "
Parameters
----------
aValue: double

Return
-------
None

Description
-----------
No available documentation.
") SetRealValue;
		void SetRealValue(const double aValue);

		/****** StepVisual_BoxCharacteristicSelect::SetTypeOfContent ******/
		/****** md5 signature: 6dccb569e7f32c1b42f23d65ed13370d ******/
		%feature("compactdefaultargs") SetTypeOfContent;
		%feature("autodoc", "
Parameters
----------
aType: int

Return
-------
None

Description
-----------
No available documentation.
") SetTypeOfContent;
		void SetTypeOfContent(const int aType);

		/****** StepVisual_BoxCharacteristicSelect::TypeOfContent ******/
		/****** md5 signature: 3acf67591629cab8025083131fc453b8 ******/
		%feature("compactdefaultargs") TypeOfContent;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") TypeOfContent;
		int TypeOfContent();

};


%extend StepVisual_BoxCharacteristicSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class StepVisual_CameraImage *
*******************************/
class StepVisual_CameraImage : public StepRepr_MappedItem {
	public:
		/****** StepVisual_CameraImage::StepVisual_CameraImage ******/
		/****** md5 signature: 4ed5a7e4bab1f5cb2cebb22e4acc7268 ******/
		%feature("compactdefaultargs") StepVisual_CameraImage;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a CameraImage.
") StepVisual_CameraImage;
		 StepVisual_CameraImage();

};


%make_alias(StepVisual_CameraImage)

%extend StepVisual_CameraImage {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class StepVisual_CameraModel *
*******************************/
class StepVisual_CameraModel : public StepGeom_GeometricRepresentationItem {
	public:
		/****** StepVisual_CameraModel::StepVisual_CameraModel ******/
		/****** md5 signature: 6dd8b113710ac99d130946a8cb5bf88c ******/
		%feature("compactdefaultargs") StepVisual_CameraModel;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a CameraModel.
") StepVisual_CameraModel;
		 StepVisual_CameraModel();

};


%make_alias(StepVisual_CameraModel)

%extend StepVisual_CameraModel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************************
* class StepVisual_CameraModelD3MultiClippingInterectionSelect *
***************************************************************/
class StepVisual_CameraModelD3MultiClippingInterectionSelect : public StepData_SelectType {
	public:
		/****** StepVisual_CameraModelD3MultiClippingInterectionSelect::StepVisual_CameraModelD3MultiClippingInterectionSelect ******/
		/****** md5 signature: a9c296993b7abae4366d9924a3df35b1 ******/
		%feature("compactdefaultargs") StepVisual_CameraModelD3MultiClippingInterectionSelect;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a CameraModelD3MultiClippingInterectionSelect select type.
") StepVisual_CameraModelD3MultiClippingInterectionSelect;
		 StepVisual_CameraModelD3MultiClippingInterectionSelect();

		/****** StepVisual_CameraModelD3MultiClippingInterectionSelect::CameraModelD3MultiClippingUnion ******/
		/****** md5 signature: 88230e0431dc901bb05693437465807b ******/
		%feature("compactdefaultargs") CameraModelD3MultiClippingUnion;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_CameraModelD3MultiClippingUnion>

Description
-----------
returns Value as a CameraModelD3MultiClippingUnion (Null if another type).
") CameraModelD3MultiClippingUnion;
		opencascade::handle<StepVisual_CameraModelD3MultiClippingUnion> CameraModelD3MultiClippingUnion();

		/****** StepVisual_CameraModelD3MultiClippingInterectionSelect::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a IdAttributeSelect Kind Entity that is: 1 -> Plane 2 -> CameraModelD3MultiClippingUnion 0 else.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepVisual_CameraModelD3MultiClippingInterectionSelect::Plane ******/
		/****** md5 signature: ef9462bf5902509743365943aea2b64d ******/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Plane>

Description
-----------
returns Value as a Plane (Null if another type).
") Plane;
		opencascade::handle<StepGeom_Plane> Plane();

};


%extend StepVisual_CameraModelD3MultiClippingInterectionSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************************
* class StepVisual_CameraModelD3MultiClippingIntersection *
**********************************************************/
class StepVisual_CameraModelD3MultiClippingIntersection : public StepGeom_GeometricRepresentationItem {
	public:
		/****** StepVisual_CameraModelD3MultiClippingIntersection::StepVisual_CameraModelD3MultiClippingIntersection ******/
		/****** md5 signature: 47db55288bb3ff8c5ae4fa31d18ec489 ******/
		%feature("compactdefaultargs") StepVisual_CameraModelD3MultiClippingIntersection;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a StepVisual_CameraModelD3MultiClippingIntersection.
") StepVisual_CameraModelD3MultiClippingIntersection;
		 StepVisual_CameraModelD3MultiClippingIntersection();

		/****** StepVisual_CameraModelD3MultiClippingIntersection::Init ******/
		/****** md5 signature: 1b24c4000586a9ec3f7b3a640110dd41 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theShapeClipping: NCollection_HArray1<StepVisual_CameraModelD3MultiClippingInterectionSelect

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<NCollection_HArray1<StepVisual_CameraModelD3MultiClippingInterectionSelect>> & theShapeClipping);

		/****** StepVisual_CameraModelD3MultiClippingIntersection::SetShapeClipping ******/
		/****** md5 signature: 187599a571177f4385040e3ae451bae8 ******/
		%feature("compactdefaultargs") SetShapeClipping;
		%feature("autodoc", "
Parameters
----------
theShapeClipping: NCollection_HArray1<StepVisual_CameraModelD3MultiClippingInterectionSelect

Return
-------
None

Description
-----------
No available documentation.
") SetShapeClipping;
		void SetShapeClipping(const opencascade::handle<NCollection_HArray1<StepVisual_CameraModelD3MultiClippingInterectionSelect>> & theShapeClipping);

		/****** StepVisual_CameraModelD3MultiClippingIntersection::ShapeClipping ******/
		/****** md5 signature: ed107bc4601a5fc64b033b41b9c3a47c ******/
		%feature("compactdefaultargs") ShapeClipping;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<StepVisual_CameraModelD3MultiClippingInterectionSelect>>

Description
-----------
No available documentation.
") ShapeClipping;
		const opencascade::handle<NCollection_HArray1<StepVisual_CameraModelD3MultiClippingInterectionSelect>> ShapeClipping();

};


%make_alias(StepVisual_CameraModelD3MultiClippingIntersection)

%extend StepVisual_CameraModelD3MultiClippingIntersection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class StepVisual_CameraModelD3MultiClippingUnion *
***************************************************/
class StepVisual_CameraModelD3MultiClippingUnion : public StepGeom_GeometricRepresentationItem {
	public:
		/****** StepVisual_CameraModelD3MultiClippingUnion::StepVisual_CameraModelD3MultiClippingUnion ******/
		/****** md5 signature: ca0cf3158bc30c32d6aa32bcd6a25f16 ******/
		%feature("compactdefaultargs") StepVisual_CameraModelD3MultiClippingUnion;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a StepVisual_CameraModelD3MultiClippingUnion.
") StepVisual_CameraModelD3MultiClippingUnion;
		 StepVisual_CameraModelD3MultiClippingUnion();

		/****** StepVisual_CameraModelD3MultiClippingUnion::Init ******/
		/****** md5 signature: c16f9a0ec0b39ddc6b4d053e5c521bd9 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theShapeClipping: NCollection_HArray1<StepVisual_CameraModelD3MultiClippingUnionSelect

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<NCollection_HArray1<StepVisual_CameraModelD3MultiClippingUnionSelect>> & theShapeClipping);

		/****** StepVisual_CameraModelD3MultiClippingUnion::SetShapeClipping ******/
		/****** md5 signature: 469d258a2de2f76d5e0b3e8618989e9d ******/
		%feature("compactdefaultargs") SetShapeClipping;
		%feature("autodoc", "
Parameters
----------
theShapeClipping: NCollection_HArray1<StepVisual_CameraModelD3MultiClippingUnionSelect

Return
-------
None

Description
-----------
No available documentation.
") SetShapeClipping;
		void SetShapeClipping(const opencascade::handle<NCollection_HArray1<StepVisual_CameraModelD3MultiClippingUnionSelect>> & theShapeClipping);

		/****** StepVisual_CameraModelD3MultiClippingUnion::ShapeClipping ******/
		/****** md5 signature: b30ae246e3c8bbf91002b985b4c31a57 ******/
		%feature("compactdefaultargs") ShapeClipping;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<StepVisual_CameraModelD3MultiClippingUnionSelect>>

Description
-----------
No available documentation.
") ShapeClipping;
		const opencascade::handle<NCollection_HArray1<StepVisual_CameraModelD3MultiClippingUnionSelect>> ShapeClipping();

};


%make_alias(StepVisual_CameraModelD3MultiClippingUnion)

%extend StepVisual_CameraModelD3MultiClippingUnion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************************
* class StepVisual_CameraModelD3MultiClippingUnionSelect *
*********************************************************/
class StepVisual_CameraModelD3MultiClippingUnionSelect : public StepData_SelectType {
	public:
		/****** StepVisual_CameraModelD3MultiClippingUnionSelect::StepVisual_CameraModelD3MultiClippingUnionSelect ******/
		/****** md5 signature: b7695837782ea575f599a451b0238b8b ******/
		%feature("compactdefaultargs") StepVisual_CameraModelD3MultiClippingUnionSelect;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a CameraModelD3MultiClippingUnionSelect select type.
") StepVisual_CameraModelD3MultiClippingUnionSelect;
		 StepVisual_CameraModelD3MultiClippingUnionSelect();

		/****** StepVisual_CameraModelD3MultiClippingUnionSelect::CameraModelD3MultiClippingIntersection ******/
		/****** md5 signature: f1eb4518d473d2f1bc0eb4cf37967ce3 ******/
		%feature("compactdefaultargs") CameraModelD3MultiClippingIntersection;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_CameraModelD3MultiClippingIntersection>

Description
-----------
returns Value as a CameraModelD3MultiClippingIntersection (Null if another type).
") CameraModelD3MultiClippingIntersection;
		opencascade::handle<StepVisual_CameraModelD3MultiClippingIntersection> CameraModelD3MultiClippingIntersection();

		/****** StepVisual_CameraModelD3MultiClippingUnionSelect::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a IdAttributeSelect Kind Entity that is: 1 -> Plane 2 -> CameraModelD3MultiClippingIntersection 0 else.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepVisual_CameraModelD3MultiClippingUnionSelect::Plane ******/
		/****** md5 signature: ef9462bf5902509743365943aea2b64d ******/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Plane>

Description
-----------
returns Value as a Plane (Null if another type).
") Plane;
		opencascade::handle<StepGeom_Plane> Plane();

};


%extend StepVisual_CameraModelD3MultiClippingUnionSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class StepVisual_CameraUsage *
*******************************/
class StepVisual_CameraUsage : public StepRepr_RepresentationMap {
	public:
		/****** StepVisual_CameraUsage::StepVisual_CameraUsage ******/
		/****** md5 signature: 45415ac2e87a3f1d1a7026bfe70cf5c6 ******/
		%feature("compactdefaultargs") StepVisual_CameraUsage;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a CameraUsage.
") StepVisual_CameraUsage;
		 StepVisual_CameraUsage();

};


%make_alias(StepVisual_CameraUsage)

%extend StepVisual_CameraUsage {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class StepVisual_Colour *
**************************/
class StepVisual_Colour : public Standard_Transient {
	public:
		/****** StepVisual_Colour::StepVisual_Colour ******/
		/****** md5 signature: a93169512723959304c96e613003b67a ******/
		%feature("compactdefaultargs") StepVisual_Colour;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a Colour.
") StepVisual_Colour;
		 StepVisual_Colour();

};


%make_alias(StepVisual_Colour)

%extend StepVisual_Colour {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class StepVisual_CompositeText *
*********************************/
class StepVisual_CompositeText : public StepGeom_GeometricRepresentationItem {
	public:
		/****** StepVisual_CompositeText::StepVisual_CompositeText ******/
		/****** md5 signature: ae7d3182b6f8ff9b5cadcab92588a16b ******/
		%feature("compactdefaultargs") StepVisual_CompositeText;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a CompositeText.
") StepVisual_CompositeText;
		 StepVisual_CompositeText();

		/****** StepVisual_CompositeText::CollectedText ******/
		/****** md5 signature: 1369f3cb1bcc8ec6ac571a767d0d6cea ******/
		%feature("compactdefaultargs") CollectedText;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<StepVisual_TextOrCharacter>>

Description
-----------
No available documentation.
") CollectedText;
		opencascade::handle<NCollection_HArray1<StepVisual_TextOrCharacter>> CollectedText();

		/****** StepVisual_CompositeText::CollectedTextValue ******/
		/****** md5 signature: cbe4adc2316d59c48f0199ec2a1e2866 ******/
		%feature("compactdefaultargs") CollectedTextValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
StepVisual_TextOrCharacter

Description
-----------
No available documentation.
") CollectedTextValue;
		StepVisual_TextOrCharacter CollectedTextValue(const int num);

		/****** StepVisual_CompositeText::Init ******/
		/****** md5 signature: 9ff10250eae04e5256d63dfbc58e45e2 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aCollectedText: NCollection_HArray1<StepVisual_TextOrCharacter

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<NCollection_HArray1<StepVisual_TextOrCharacter>> & aCollectedText);

		/****** StepVisual_CompositeText::NbCollectedText ******/
		/****** md5 signature: 06e0a83b13e3959ff85d9e254cbe33cb ******/
		%feature("compactdefaultargs") NbCollectedText;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbCollectedText;
		int NbCollectedText();

		/****** StepVisual_CompositeText::SetCollectedText ******/
		/****** md5 signature: 6491a849cdf3cfa79ec65d7af2f4a903 ******/
		%feature("compactdefaultargs") SetCollectedText;
		%feature("autodoc", "
Parameters
----------
aCollectedText: NCollection_HArray1<StepVisual_TextOrCharacter

Return
-------
None

Description
-----------
No available documentation.
") SetCollectedText;
		void SetCollectedText(const opencascade::handle<NCollection_HArray1<StepVisual_TextOrCharacter>> & aCollectedText);

};


%make_alias(StepVisual_CompositeText)

%extend StepVisual_CompositeText {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class StepVisual_CurveStyle *
******************************/
class StepVisual_CurveStyle : public Standard_Transient {
	public:
		/****** StepVisual_CurveStyle::StepVisual_CurveStyle ******/
		/****** md5 signature: 85aa6e5b1944fe6192adb3190916d4c4 ******/
		%feature("compactdefaultargs") StepVisual_CurveStyle;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a CurveStyle.
") StepVisual_CurveStyle;
		 StepVisual_CurveStyle();

		/****** StepVisual_CurveStyle::CurveColour ******/
		/****** md5 signature: 0434c432718ef09a6f61b00546985039 ******/
		%feature("compactdefaultargs") CurveColour;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_Colour>

Description
-----------
No available documentation.
") CurveColour;
		opencascade::handle<StepVisual_Colour> CurveColour();

		/****** StepVisual_CurveStyle::CurveFont ******/
		/****** md5 signature: 2107bd8b73a5abe6d11b55f6e429eed4 ******/
		%feature("compactdefaultargs") CurveFont;
		%feature("autodoc", "Return
-------
StepVisual_CurveStyleFontSelect

Description
-----------
No available documentation.
") CurveFont;
		StepVisual_CurveStyleFontSelect CurveFont();

		/****** StepVisual_CurveStyle::CurveWidth ******/
		/****** md5 signature: 97802a497f663f2bc68739bf2369f40a ******/
		%feature("compactdefaultargs") CurveWidth;
		%feature("autodoc", "Return
-------
StepBasic_SizeSelect

Description
-----------
No available documentation.
") CurveWidth;
		StepBasic_SizeSelect CurveWidth();

		/****** StepVisual_CurveStyle::Init ******/
		/****** md5 signature: e11498a4dc00d8ebafab32181cac5ad3 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aCurveFont: StepVisual_CurveStyleFontSelect
aCurveWidth: StepBasic_SizeSelect
aCurveColour: StepVisual_Colour

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const StepVisual_CurveStyleFontSelect & aCurveFont, const StepBasic_SizeSelect & aCurveWidth, const opencascade::handle<StepVisual_Colour> & aCurveColour);

		/****** StepVisual_CurveStyle::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepVisual_CurveStyle::SetCurveColour ******/
		/****** md5 signature: e12ea3eb92ae412fce7482b84084874b ******/
		%feature("compactdefaultargs") SetCurveColour;
		%feature("autodoc", "
Parameters
----------
aCurveColour: StepVisual_Colour

Return
-------
None

Description
-----------
No available documentation.
") SetCurveColour;
		void SetCurveColour(const opencascade::handle<StepVisual_Colour> & aCurveColour);

		/****** StepVisual_CurveStyle::SetCurveFont ******/
		/****** md5 signature: b8ac1ca16c6ebec6dbf6c90f6e884791 ******/
		%feature("compactdefaultargs") SetCurveFont;
		%feature("autodoc", "
Parameters
----------
aCurveFont: StepVisual_CurveStyleFontSelect

Return
-------
None

Description
-----------
No available documentation.
") SetCurveFont;
		void SetCurveFont(const StepVisual_CurveStyleFontSelect & aCurveFont);

		/****** StepVisual_CurveStyle::SetCurveWidth ******/
		/****** md5 signature: 6bda267d11ee5c873f0daa9fd33e87eb ******/
		%feature("compactdefaultargs") SetCurveWidth;
		%feature("autodoc", "
Parameters
----------
aCurveWidth: StepBasic_SizeSelect

Return
-------
None

Description
-----------
No available documentation.
") SetCurveWidth;
		void SetCurveWidth(const StepBasic_SizeSelect & aCurveWidth);

		/****** StepVisual_CurveStyle::SetName ******/
		/****** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & aName);

};


%make_alias(StepVisual_CurveStyle)

%extend StepVisual_CurveStyle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class StepVisual_CurveStyleFont *
**********************************/
class StepVisual_CurveStyleFont : public Standard_Transient {
	public:
		/****** StepVisual_CurveStyleFont::StepVisual_CurveStyleFont ******/
		/****** md5 signature: 1b693b23440fc7e9a6ed5407e5b3420b ******/
		%feature("compactdefaultargs") StepVisual_CurveStyleFont;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a CurveStyleFont.
") StepVisual_CurveStyleFont;
		 StepVisual_CurveStyleFont();

		/****** StepVisual_CurveStyleFont::Init ******/
		/****** md5 signature: 09da27aa6d757260cf0906e10ba87511 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aPatternList: NCollection_HArray1<

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<NCollection_HArray1<opencascade::handle<StepVisual_CurveStyleFontPattern>> > & aPatternList);

		/****** StepVisual_CurveStyleFont::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepVisual_CurveStyleFont::NbPatternList ******/
		/****** md5 signature: 6d2ffd63162b9c3af74c3aa137466b2c ******/
		%feature("compactdefaultargs") NbPatternList;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPatternList;
		int NbPatternList();

		/****** StepVisual_CurveStyleFont::PatternList ******/
		/****** md5 signature: b17b4a714f499f8fbfb10fe14e2f1287 ******/
		%feature("compactdefaultargs") PatternList;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<opencascade::handle<StepVisual_CurveStyleFontPattern>>>

Description
-----------
No available documentation.
") PatternList;
		opencascade::handle<NCollection_HArray1<opencascade::handle<StepVisual_CurveStyleFontPattern>>> PatternList();

		/****** StepVisual_CurveStyleFont::PatternListValue ******/
		/****** md5 signature: 662e671dfee313d293b92725cd43e3eb ******/
		%feature("compactdefaultargs") PatternListValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<StepVisual_CurveStyleFontPattern>

Description
-----------
No available documentation.
") PatternListValue;
		opencascade::handle<StepVisual_CurveStyleFontPattern> PatternListValue(const int num);

		/****** StepVisual_CurveStyleFont::SetName ******/
		/****** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & aName);

		/****** StepVisual_CurveStyleFont::SetPatternList ******/
		/****** md5 signature: ca4b7868af1c38b3bb140342722887f7 ******/
		%feature("compactdefaultargs") SetPatternList;
		%feature("autodoc", "
Parameters
----------
aPatternList: NCollection_HArray1<

Return
-------
None

Description
-----------
No available documentation.
") SetPatternList;
		void SetPatternList(const opencascade::handle<NCollection_HArray1<opencascade::handle<StepVisual_CurveStyleFontPattern>> > & aPatternList);

};


%make_alias(StepVisual_CurveStyleFont)

%extend StepVisual_CurveStyleFont {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class StepVisual_CurveStyleFontPattern *
*****************************************/
class StepVisual_CurveStyleFontPattern : public Standard_Transient {
	public:
		/****** StepVisual_CurveStyleFontPattern::StepVisual_CurveStyleFontPattern ******/
		/****** md5 signature: fea22a6fc8f31f6187185d7f2004703c ******/
		%feature("compactdefaultargs") StepVisual_CurveStyleFontPattern;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a CurveStyleFontPattern.
") StepVisual_CurveStyleFontPattern;
		 StepVisual_CurveStyleFontPattern();

		/****** StepVisual_CurveStyleFontPattern::Init ******/
		/****** md5 signature: 073c8db0e26cf98da5ded6bb9afe215e ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aVisibleSegmentLength: double
aInvisibleSegmentLength: double

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const double aVisibleSegmentLength, const double aInvisibleSegmentLength);

		/****** StepVisual_CurveStyleFontPattern::InvisibleSegmentLength ******/
		/****** md5 signature: 45d7978d0608431fe2f81fa848f1957c ******/
		%feature("compactdefaultargs") InvisibleSegmentLength;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") InvisibleSegmentLength;
		double InvisibleSegmentLength();

		/****** StepVisual_CurveStyleFontPattern::SetInvisibleSegmentLength ******/
		/****** md5 signature: 84676b6be3fafc1c7a9d5c0637e9f875 ******/
		%feature("compactdefaultargs") SetInvisibleSegmentLength;
		%feature("autodoc", "
Parameters
----------
aInvisibleSegmentLength: double

Return
-------
None

Description
-----------
No available documentation.
") SetInvisibleSegmentLength;
		void SetInvisibleSegmentLength(const double aInvisibleSegmentLength);

		/****** StepVisual_CurveStyleFontPattern::SetVisibleSegmentLength ******/
		/****** md5 signature: c708a53718ceab33e76bb66afbc65e47 ******/
		%feature("compactdefaultargs") SetVisibleSegmentLength;
		%feature("autodoc", "
Parameters
----------
aVisibleSegmentLength: double

Return
-------
None

Description
-----------
No available documentation.
") SetVisibleSegmentLength;
		void SetVisibleSegmentLength(const double aVisibleSegmentLength);

		/****** StepVisual_CurveStyleFontPattern::VisibleSegmentLength ******/
		/****** md5 signature: e8d0a0bc4969c373253f2e649b005d40 ******/
		%feature("compactdefaultargs") VisibleSegmentLength;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") VisibleSegmentLength;
		double VisibleSegmentLength();

};


%make_alias(StepVisual_CurveStyleFontPattern)

%extend StepVisual_CurveStyleFontPattern {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class StepVisual_CurveStyleFontSelect *
****************************************/
class StepVisual_CurveStyleFontSelect : public StepData_SelectType {
	public:
		/****** StepVisual_CurveStyleFontSelect::StepVisual_CurveStyleFontSelect ******/
		/****** md5 signature: 256a5fa863ec7607bb084186b9d94ac3 ******/
		%feature("compactdefaultargs") StepVisual_CurveStyleFontSelect;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a CurveStyleFontSelect SelectType.
") StepVisual_CurveStyleFontSelect;
		 StepVisual_CurveStyleFontSelect();

		/****** StepVisual_CurveStyleFontSelect::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a CurveStyleFontSelect Kind Entity that is: 1 -> CurveStyleFont 2 -> PreDefinedCurveFont 3 -> ExternallyDefinedCurveFont 0 else.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepVisual_CurveStyleFontSelect::CurveStyleFont ******/
		/****** md5 signature: eeccc82a951dd63f3e36805c7a195791 ******/
		%feature("compactdefaultargs") CurveStyleFont;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_CurveStyleFont>

Description
-----------
returns Value as a CurveStyleFont (Null if another type).
") CurveStyleFont;
		opencascade::handle<StepVisual_CurveStyleFont> CurveStyleFont();

		/****** StepVisual_CurveStyleFontSelect::ExternallyDefinedCurveFont ******/
		/****** md5 signature: ac31317e484b0372b70f9c7d87e01bb4 ******/
		%feature("compactdefaultargs") ExternallyDefinedCurveFont;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_ExternallyDefinedCurveFont>

Description
-----------
returns Value as a ExternallyDefinedCurveFont (Null if another type).
") ExternallyDefinedCurveFont;
		opencascade::handle<StepVisual_ExternallyDefinedCurveFont> ExternallyDefinedCurveFont();

		/****** StepVisual_CurveStyleFontSelect::PreDefinedCurveFont ******/
		/****** md5 signature: 7620a50516129f5a0e764c594c83d882 ******/
		%feature("compactdefaultargs") PreDefinedCurveFont;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_PreDefinedCurveFont>

Description
-----------
returns Value as a PreDefinedCurveFont (Null if another type).
") PreDefinedCurveFont;
		opencascade::handle<StepVisual_PreDefinedCurveFont> PreDefinedCurveFont();

};


%extend StepVisual_CurveStyleFontSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class StepVisual_DirectionCountSelect *
****************************************/
class StepVisual_DirectionCountSelect {
	public:
		/****** StepVisual_DirectionCountSelect::StepVisual_DirectionCountSelect ******/
		/****** md5 signature: 10f56f2413fc42c436629b223beabb4b ******/
		%feature("compactdefaultargs") StepVisual_DirectionCountSelect;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepVisual_DirectionCountSelect;
		 StepVisual_DirectionCountSelect();

		/****** StepVisual_DirectionCountSelect::SetTypeOfContent ******/
		/****** md5 signature: 94451abec2f58d721da8db457e5a815f ******/
		%feature("compactdefaultargs") SetTypeOfContent;
		%feature("autodoc", "
Parameters
----------
aTypeOfContent: int

Return
-------
None

Description
-----------
No available documentation.
") SetTypeOfContent;
		void SetTypeOfContent(const int aTypeOfContent);

		/****** StepVisual_DirectionCountSelect::SetUDirectionCount ******/
		/****** md5 signature: 24def81778c523fbe8af22ed90cca532 ******/
		%feature("compactdefaultargs") SetUDirectionCount;
		%feature("autodoc", "
Parameters
----------
aUDirectionCount: int

Return
-------
None

Description
-----------
No available documentation.
") SetUDirectionCount;
		void SetUDirectionCount(const int aUDirectionCount);

		/****** StepVisual_DirectionCountSelect::SetVDirectionCount ******/
		/****** md5 signature: 9a2c203e4e9b4c31b5105661f98b2c19 ******/
		%feature("compactdefaultargs") SetVDirectionCount;
		%feature("autodoc", "
Parameters
----------
aUDirectionCount: int

Return
-------
None

Description
-----------
No available documentation.
") SetVDirectionCount;
		void SetVDirectionCount(const int aUDirectionCount);

		/****** StepVisual_DirectionCountSelect::TypeOfContent ******/
		/****** md5 signature: 3acf67591629cab8025083131fc453b8 ******/
		%feature("compactdefaultargs") TypeOfContent;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") TypeOfContent;
		int TypeOfContent();

		/****** StepVisual_DirectionCountSelect::UDirectionCount ******/
		/****** md5 signature: f6970bc987da266cf5a59de9a227b2df ******/
		%feature("compactdefaultargs") UDirectionCount;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") UDirectionCount;
		int UDirectionCount();

		/****** StepVisual_DirectionCountSelect::VDirectionCount ******/
		/****** md5 signature: 77e93d945004567262268732a761c4bd ******/
		%feature("compactdefaultargs") VDirectionCount;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") VDirectionCount;
		int VDirectionCount();

};


%extend StepVisual_DirectionCountSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class StepVisual_DraughtingCallout *
*************************************/
class StepVisual_DraughtingCallout : public StepGeom_GeometricRepresentationItem {
	public:
		/****** StepVisual_DraughtingCallout::StepVisual_DraughtingCallout ******/
		/****** md5 signature: 479128b3cf76d9fc67402329a058f44f ******/
		%feature("compactdefaultargs") StepVisual_DraughtingCallout;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a DraughtingCallout.
") StepVisual_DraughtingCallout;
		 StepVisual_DraughtingCallout();

		/****** StepVisual_DraughtingCallout::Contents ******/
		/****** md5 signature: 50011107fc6f75ebd8bdb73cd9eee7af ******/
		%feature("compactdefaultargs") Contents;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<StepVisual_DraughtingCalloutElement>>

Description
-----------
Returns field Contents.
") Contents;
		opencascade::handle<NCollection_HArray1<StepVisual_DraughtingCalloutElement>> Contents();

		/****** StepVisual_DraughtingCallout::ContentsValue ******/
		/****** md5 signature: 4ee2f7c50d528d51ed38b7d58a246163 ******/
		%feature("compactdefaultargs") ContentsValue;
		%feature("autodoc", "
Parameters
----------
theNum: int

Return
-------
StepVisual_DraughtingCalloutElement

Description
-----------
Returns Contents with the given number.
") ContentsValue;
		StepVisual_DraughtingCalloutElement ContentsValue(const int theNum);

		/****** StepVisual_DraughtingCallout::Init ******/
		/****** md5 signature: 3ee8526a3d9c176dbec7931fa199baea ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theContents: NCollection_HArray1<StepVisual_DraughtingCalloutElement

Return
-------
None

Description
-----------
Init.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<NCollection_HArray1<StepVisual_DraughtingCalloutElement>> & theContents);

		/****** StepVisual_DraughtingCallout::NbContents ******/
		/****** md5 signature: 5d439066b3851b8c25c15c9ac771bf1f ******/
		%feature("compactdefaultargs") NbContents;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of Contents.
") NbContents;
		int NbContents();

		/****** StepVisual_DraughtingCallout::SetContents ******/
		/****** md5 signature: 6e5b0d2927d1502b9b0011d5e80a3541 ******/
		%feature("compactdefaultargs") SetContents;
		%feature("autodoc", "
Parameters
----------
theContents: NCollection_HArray1<StepVisual_DraughtingCalloutElement

Return
-------
None

Description
-----------
Set field Contents.
") SetContents;
		void SetContents(const opencascade::handle<NCollection_HArray1<StepVisual_DraughtingCalloutElement>> & theContents);

		/****** StepVisual_DraughtingCallout::SetContentsValue ******/
		/****** md5 signature: a73860735bb453a5a6cd5c78af273b7d ******/
		%feature("compactdefaultargs") SetContentsValue;
		%feature("autodoc", "
Parameters
----------
theNum: int
theItem: StepVisual_DraughtingCalloutElement

Return
-------
None

Description
-----------
Sets Contents with given number.
") SetContentsValue;
		void SetContentsValue(const int theNum, const StepVisual_DraughtingCalloutElement & theItem);

};


%make_alias(StepVisual_DraughtingCallout)

%extend StepVisual_DraughtingCallout {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class StepVisual_DraughtingCalloutElement *
********************************************/
class StepVisual_DraughtingCalloutElement : public StepData_SelectType {
	public:
		/****** StepVisual_DraughtingCalloutElement::StepVisual_DraughtingCalloutElement ******/
		/****** md5 signature: a49239e44d9e53e7c66bc767f83d9bde ******/
		%feature("compactdefaultargs") StepVisual_DraughtingCalloutElement;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a DraughtingCalloutElement select type.
") StepVisual_DraughtingCalloutElement;
		 StepVisual_DraughtingCalloutElement();

		/****** StepVisual_DraughtingCalloutElement::AnnotationCurveOccurrence ******/
		/****** md5 signature: d11af034ca7cac23dfd69b1f3d70df7c ******/
		%feature("compactdefaultargs") AnnotationCurveOccurrence;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_AnnotationCurveOccurrence>

Description
-----------
returns Value as a AnnotationCurveOccurrence (Null if another type).
") AnnotationCurveOccurrence;
		opencascade::handle<StepVisual_AnnotationCurveOccurrence> AnnotationCurveOccurrence();

		/****** StepVisual_DraughtingCalloutElement::AnnotationFillAreaOccurrence ******/
		/****** md5 signature: 8fb32aae3b8e74c47bd9bcf5bb76409c ******/
		%feature("compactdefaultargs") AnnotationFillAreaOccurrence;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_AnnotationFillAreaOccurrence>

Description
-----------
returns Value as a AnnotationFillAreaOccurrence.
") AnnotationFillAreaOccurrence;
		opencascade::handle<StepVisual_AnnotationFillAreaOccurrence> AnnotationFillAreaOccurrence();

		/****** StepVisual_DraughtingCalloutElement::AnnotationTextOccurrence ******/
		/****** md5 signature: 4f777e80eb4a0b798f5d02115ebbed97 ******/
		%feature("compactdefaultargs") AnnotationTextOccurrence;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_AnnotationTextOccurrence>

Description
-----------
returns Value as a AnnotationTextOccurrence.
") AnnotationTextOccurrence;
		opencascade::handle<StepVisual_AnnotationTextOccurrence> AnnotationTextOccurrence();

		/****** StepVisual_DraughtingCalloutElement::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a IdAttributeSelect Kind Entity that is: 1 -> AnnotationCurveOccurrence 2 -> AnnotationTextOccurrence 3 -> TessellatedAnnotationOccurrence 4 -> AnnotationFillAreaOccurrence 0 else.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepVisual_DraughtingCalloutElement::TessellatedAnnotationOccurrence ******/
		/****** md5 signature: 9a51ea8427317a0230ff1ad6f1ec5743 ******/
		%feature("compactdefaultargs") TessellatedAnnotationOccurrence;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_TessellatedAnnotationOccurrence>

Description
-----------
returns Value as a TessellatedAnnotationOccurrence.
") TessellatedAnnotationOccurrence;
		opencascade::handle<StepVisual_TessellatedAnnotationOccurrence> TessellatedAnnotationOccurrence();

};


%extend StepVisual_DraughtingCalloutElement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class StepVisual_DraughtingModel *
***********************************/
class StepVisual_DraughtingModel : public StepRepr_Representation {
	public:
		/****** StepVisual_DraughtingModel::StepVisual_DraughtingModel ******/
		/****** md5 signature: 90370651a280a0297ef880071fb1c7a8 ******/
		%feature("compactdefaultargs") StepVisual_DraughtingModel;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepVisual_DraughtingModel;
		 StepVisual_DraughtingModel();

};


%make_alias(StepVisual_DraughtingModel)

%extend StepVisual_DraughtingModel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class StepVisual_EdgeOrCurve *
*******************************/
class StepVisual_EdgeOrCurve : public StepData_SelectType {
	public:
		/****** StepVisual_EdgeOrCurve::StepVisual_EdgeOrCurve ******/
		/****** md5 signature: 7e13a0cec827f21ff30a08609cc6a72e ******/
		%feature("compactdefaultargs") StepVisual_EdgeOrCurve;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepVisual_EdgeOrCurve;
		 StepVisual_EdgeOrCurve();

		/****** StepVisual_EdgeOrCurve::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a kind of EdgeOrCurve select type -- 1 -> Curve -- 2 -> Edge.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepVisual_EdgeOrCurve::Curve ******/
		/****** md5 signature: 29742eb86c60e95cfe724318fdd485f7 ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Curve>

Description
-----------
Returns Value as Curve (or Null if another type).
") Curve;
		opencascade::handle<StepGeom_Curve> Curve();

		/****** StepVisual_EdgeOrCurve::Edge ******/
		/****** md5 signature: 6eccb4cb63dbfc116c3a6a3f77934b1d ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Return
-------
opencascade::handle<StepShape_Edge>

Description
-----------
Returns Value as Edge (or Null if another type).
") Edge;
		opencascade::handle<StepShape_Edge> Edge();

};


%extend StepVisual_EdgeOrCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class StepVisual_ExternallyDefinedCurveFont *
**********************************************/
class StepVisual_ExternallyDefinedCurveFont : public StepBasic_ExternallyDefinedItem {
	public:
		/****** StepVisual_ExternallyDefinedCurveFont::StepVisual_ExternallyDefinedCurveFont ******/
		/****** md5 signature: a80bef727f282348eddcd999e1ebe393 ******/
		%feature("compactdefaultargs") StepVisual_ExternallyDefinedCurveFont;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepVisual_ExternallyDefinedCurveFont;
		 StepVisual_ExternallyDefinedCurveFont();

};


%make_alias(StepVisual_ExternallyDefinedCurveFont)

%extend StepVisual_ExternallyDefinedCurveFont {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class StepVisual_ExternallyDefinedTextFont *
*********************************************/
class StepVisual_ExternallyDefinedTextFont : public StepBasic_ExternallyDefinedItem {
	public:
		/****** StepVisual_ExternallyDefinedTextFont::StepVisual_ExternallyDefinedTextFont ******/
		/****** md5 signature: d5e49916c125350e8679005625fd3e4a ******/
		%feature("compactdefaultargs") StepVisual_ExternallyDefinedTextFont;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepVisual_ExternallyDefinedTextFont;
		 StepVisual_ExternallyDefinedTextFont();

};


%make_alias(StepVisual_ExternallyDefinedTextFont)

%extend StepVisual_ExternallyDefinedTextFont {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class StepVisual_FaceOrSurface *
*********************************/
class StepVisual_FaceOrSurface : public StepData_SelectType {
	public:
		/****** StepVisual_FaceOrSurface::StepVisual_FaceOrSurface ******/
		/****** md5 signature: 63718d0b8a42fdc6a2e024f4a3ffe41a ******/
		%feature("compactdefaultargs") StepVisual_FaceOrSurface;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepVisual_FaceOrSurface;
		 StepVisual_FaceOrSurface();

		/****** StepVisual_FaceOrSurface::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a kind of FaceOrSurface select type -- 1 -> Face -- 2 -> Surface.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepVisual_FaceOrSurface::Face ******/
		/****** md5 signature: cb3fb10fb42f13714d2b79863e6a19e2 ******/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Return
-------
opencascade::handle<StepShape_Face>

Description
-----------
Returns Value as Face (or Null if another type).
") Face;
		opencascade::handle<StepShape_Face> Face();

		/****** StepVisual_FaceOrSurface::Surface ******/
		/****** md5 signature: c2398e6bbff81fe9609620c081466496 ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Surface>

Description
-----------
Returns Value as Surface (or Null if another type).
") Surface;
		opencascade::handle<StepGeom_Surface> Surface();

};


%extend StepVisual_FaceOrSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class StepVisual_FillAreaStyle *
*********************************/
class StepVisual_FillAreaStyle : public Standard_Transient {
	public:
		/****** StepVisual_FillAreaStyle::StepVisual_FillAreaStyle ******/
		/****** md5 signature: 4336473b355d1d0a6b363eaba2ff6e5a ******/
		%feature("compactdefaultargs") StepVisual_FillAreaStyle;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a FillAreaStyle.
") StepVisual_FillAreaStyle;
		 StepVisual_FillAreaStyle();

		/****** StepVisual_FillAreaStyle::FillStyles ******/
		/****** md5 signature: f035ab77cbc830f87524fad58b173e22 ******/
		%feature("compactdefaultargs") FillStyles;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<StepVisual_FillStyleSelect>>

Description
-----------
No available documentation.
") FillStyles;
		opencascade::handle<NCollection_HArray1<StepVisual_FillStyleSelect>> FillStyles();

		/****** StepVisual_FillAreaStyle::FillStylesValue ******/
		/****** md5 signature: a6f877fbcaaca9a027b1cd9dc0682556 ******/
		%feature("compactdefaultargs") FillStylesValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
StepVisual_FillStyleSelect

Description
-----------
No available documentation.
") FillStylesValue;
		StepVisual_FillStyleSelect FillStylesValue(const int num);

		/****** StepVisual_FillAreaStyle::Init ******/
		/****** md5 signature: a22d8eadc9b879d752d79ba6677a3b29 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aFillStyles: NCollection_HArray1<StepVisual_FillStyleSelect

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<NCollection_HArray1<StepVisual_FillStyleSelect>> & aFillStyles);

		/****** StepVisual_FillAreaStyle::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepVisual_FillAreaStyle::NbFillStyles ******/
		/****** md5 signature: c479e3ee4978bd76866b654ca3e31ea4 ******/
		%feature("compactdefaultargs") NbFillStyles;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbFillStyles;
		int NbFillStyles();

		/****** StepVisual_FillAreaStyle::SetFillStyles ******/
		/****** md5 signature: 1af9b9b65b3bb4e68c1228b6cfc97917 ******/
		%feature("compactdefaultargs") SetFillStyles;
		%feature("autodoc", "
Parameters
----------
aFillStyles: NCollection_HArray1<StepVisual_FillStyleSelect

Return
-------
None

Description
-----------
No available documentation.
") SetFillStyles;
		void SetFillStyles(const opencascade::handle<NCollection_HArray1<StepVisual_FillStyleSelect>> & aFillStyles);

		/****** StepVisual_FillAreaStyle::SetName ******/
		/****** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & aName);

};


%make_alias(StepVisual_FillAreaStyle)

%extend StepVisual_FillAreaStyle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class StepVisual_FillAreaStyleColour *
***************************************/
class StepVisual_FillAreaStyleColour : public Standard_Transient {
	public:
		/****** StepVisual_FillAreaStyleColour::StepVisual_FillAreaStyleColour ******/
		/****** md5 signature: 2c2c1dd51151c21997d01628744768cc ******/
		%feature("compactdefaultargs") StepVisual_FillAreaStyleColour;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a FillAreaStyleColour.
") StepVisual_FillAreaStyleColour;
		 StepVisual_FillAreaStyleColour();

		/****** StepVisual_FillAreaStyleColour::FillColour ******/
		/****** md5 signature: bd2101d67ed5ee5b2e9f70fbfb843f2d ******/
		%feature("compactdefaultargs") FillColour;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_Colour>

Description
-----------
No available documentation.
") FillColour;
		opencascade::handle<StepVisual_Colour> FillColour();

		/****** StepVisual_FillAreaStyleColour::Init ******/
		/****** md5 signature: 6fd1c501a81e52ee11e034912ddc052c ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aFillColour: StepVisual_Colour

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepVisual_Colour> & aFillColour);

		/****** StepVisual_FillAreaStyleColour::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepVisual_FillAreaStyleColour::SetFillColour ******/
		/****** md5 signature: 0c8af4b1f10f96936e6080e0be4e0afb ******/
		%feature("compactdefaultargs") SetFillColour;
		%feature("autodoc", "
Parameters
----------
aFillColour: StepVisual_Colour

Return
-------
None

Description
-----------
No available documentation.
") SetFillColour;
		void SetFillColour(const opencascade::handle<StepVisual_Colour> & aFillColour);

		/****** StepVisual_FillAreaStyleColour::SetName ******/
		/****** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & aName);

};


%make_alias(StepVisual_FillAreaStyleColour)

%extend StepVisual_FillAreaStyleColour {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class StepVisual_FillStyleSelect *
***********************************/
class StepVisual_FillStyleSelect : public StepData_SelectType {
	public:
		/****** StepVisual_FillStyleSelect::StepVisual_FillStyleSelect ******/
		/****** md5 signature: c3a89032a828ea6a76e5b5677134a66b ******/
		%feature("compactdefaultargs") StepVisual_FillStyleSelect;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a FillStyleSelect SelectType.
") StepVisual_FillStyleSelect;
		 StepVisual_FillStyleSelect();

		/****** StepVisual_FillStyleSelect::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a FillStyleSelect Kind Entity that is: 1 -> FillAreaStyleColour 2 -> ExternallyDefinedTileStyle 3 -> FillAreaStyleTiles 4 -> ExternallyDefinedHatchStyle 5 -> FillAreaStyleHatching 0 else.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepVisual_FillStyleSelect::FillAreaStyleColour ******/
		/****** md5 signature: e3faf68b401a2aaeb9697abe8bd0a44e ******/
		%feature("compactdefaultargs") FillAreaStyleColour;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_FillAreaStyleColour>

Description
-----------
returns Value as a FillAreaStyleColour (Null if another type).
") FillAreaStyleColour;
		opencascade::handle<StepVisual_FillAreaStyleColour> FillAreaStyleColour();

};


%extend StepVisual_FillStyleSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class StepVisual_FontSelect *
******************************/
class StepVisual_FontSelect : public StepData_SelectType {
	public:
		/****** StepVisual_FontSelect::StepVisual_FontSelect ******/
		/****** md5 signature: dbf28f42ce8760b15bf259ebb7b72b72 ******/
		%feature("compactdefaultargs") StepVisual_FontSelect;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a FontSelect SelectType.
") StepVisual_FontSelect;
		 StepVisual_FontSelect();

		/****** StepVisual_FontSelect::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a FontSelect Kind Entity that is: 1 -> PreDefinedTextFont 2 -> ExternallyDefinedTextFont 0 else.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepVisual_FontSelect::ExternallyDefinedTextFont ******/
		/****** md5 signature: dc1f9c851d899996d490564ecb340dfd ******/
		%feature("compactdefaultargs") ExternallyDefinedTextFont;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_ExternallyDefinedTextFont>

Description
-----------
returns Value as a ExternallyDefinedTextFont (Null if another type).
") ExternallyDefinedTextFont;
		opencascade::handle<StepVisual_ExternallyDefinedTextFont> ExternallyDefinedTextFont();

		/****** StepVisual_FontSelect::PreDefinedTextFont ******/
		/****** md5 signature: f701e1febadd6d827f8ad9082838f3f7 ******/
		%feature("compactdefaultargs") PreDefinedTextFont;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_PreDefinedTextFont>

Description
-----------
returns Value as a PreDefinedTextFont (Null if another type).
") PreDefinedTextFont;
		opencascade::handle<StepVisual_PreDefinedTextFont> PreDefinedTextFont();

};


%extend StepVisual_FontSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class StepVisual_Invisibility *
********************************/
class StepVisual_Invisibility : public Standard_Transient {
	public:
		/****** StepVisual_Invisibility::StepVisual_Invisibility ******/
		/****** md5 signature: a3474cb24273a3875e45818c14f2a810 ******/
		%feature("compactdefaultargs") StepVisual_Invisibility;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a Invisibility.
") StepVisual_Invisibility;
		 StepVisual_Invisibility();

		/****** StepVisual_Invisibility::Init ******/
		/****** md5 signature: ae8bca62fd28c7ec531123dda3302b56 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aInvisibleItems: NCollection_HArray1<StepVisual_InvisibleItem

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<NCollection_HArray1<StepVisual_InvisibleItem>> & aInvisibleItems);

		/****** StepVisual_Invisibility::InvisibleItems ******/
		/****** md5 signature: 11df5d413c1748b0be03ef3cac1a2672 ******/
		%feature("compactdefaultargs") InvisibleItems;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<StepVisual_InvisibleItem>>

Description
-----------
No available documentation.
") InvisibleItems;
		opencascade::handle<NCollection_HArray1<StepVisual_InvisibleItem>> InvisibleItems();

		/****** StepVisual_Invisibility::InvisibleItemsValue ******/
		/****** md5 signature: 7d0bd621e8f8c6d3d8106373d000c342 ******/
		%feature("compactdefaultargs") InvisibleItemsValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
StepVisual_InvisibleItem

Description
-----------
No available documentation.
") InvisibleItemsValue;
		StepVisual_InvisibleItem InvisibleItemsValue(const int num);

		/****** StepVisual_Invisibility::NbInvisibleItems ******/
		/****** md5 signature: bc9ab10935aff5c9ab6793f8b36838c0 ******/
		%feature("compactdefaultargs") NbInvisibleItems;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbInvisibleItems;
		int NbInvisibleItems();

		/****** StepVisual_Invisibility::SetInvisibleItems ******/
		/****** md5 signature: 60551ccc80d801e8737089646bc4a496 ******/
		%feature("compactdefaultargs") SetInvisibleItems;
		%feature("autodoc", "
Parameters
----------
aInvisibleItems: NCollection_HArray1<StepVisual_InvisibleItem

Return
-------
None

Description
-----------
No available documentation.
") SetInvisibleItems;
		void SetInvisibleItems(const opencascade::handle<NCollection_HArray1<StepVisual_InvisibleItem>> & aInvisibleItems);

};


%make_alias(StepVisual_Invisibility)

%extend StepVisual_Invisibility {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class StepVisual_InvisibilityContext *
***************************************/
class StepVisual_InvisibilityContext : public StepData_SelectType {
	public:
		/****** StepVisual_InvisibilityContext::StepVisual_InvisibilityContext ******/
		/****** md5 signature: 242bb7cc06725c2919283fc5c868071a ******/
		%feature("compactdefaultargs") StepVisual_InvisibilityContext;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a InvisibilityContext SelectType.
") StepVisual_InvisibilityContext;
		 StepVisual_InvisibilityContext();

		/****** StepVisual_InvisibilityContext::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a InvisibilityContext Kind Entity that is: 1 -> PresentationRepresentation 2 -> PresentationSet 2 -> DraughtingModel 0 else.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepVisual_InvisibilityContext::DraughtingModel ******/
		/****** md5 signature: 375dc663ce6735b6fbc38731ef539d11 ******/
		%feature("compactdefaultargs") DraughtingModel;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_DraughtingModel>

Description
-----------
returns Value as a PresentationSet (Null if another type).
") DraughtingModel;
		opencascade::handle<StepVisual_DraughtingModel> DraughtingModel();

		/****** StepVisual_InvisibilityContext::PresentationRepresentation ******/
		/****** md5 signature: cc6c70dd495b260c6d02169df44fd1e5 ******/
		%feature("compactdefaultargs") PresentationRepresentation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_PresentationRepresentation>

Description
-----------
returns Value as a PresentationRepresentation (Null if another type).
") PresentationRepresentation;
		opencascade::handle<StepVisual_PresentationRepresentation> PresentationRepresentation();

		/****** StepVisual_InvisibilityContext::PresentationSet ******/
		/****** md5 signature: e22661d0b7db8ea09e8adbe07ae2d793 ******/
		%feature("compactdefaultargs") PresentationSet;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_PresentationSet>

Description
-----------
returns Value as a PresentationSet (Null if another type).
") PresentationSet;
		opencascade::handle<StepVisual_PresentationSet> PresentationSet();

};


%extend StepVisual_InvisibilityContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class StepVisual_InvisibleItem *
*********************************/
class StepVisual_InvisibleItem : public StepData_SelectType {
	public:
		/****** StepVisual_InvisibleItem::StepVisual_InvisibleItem ******/
		/****** md5 signature: d2cbc0b529016c99ba2f24b0dcad3ed5 ******/
		%feature("compactdefaultargs") StepVisual_InvisibleItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a InvisibleItem SelectType.
") StepVisual_InvisibleItem;
		 StepVisual_InvisibleItem();

		/****** StepVisual_InvisibleItem::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a InvisibleItem Kind Entity that is: 1 -> StyledItem 2 -> PresentationLayerAssignment 3 -> PresentationRepresentation 0 else.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepVisual_InvisibleItem::PresentationLayerAssignment ******/
		/****** md5 signature: 49c7f239f0489b439f796bd73a3c191b ******/
		%feature("compactdefaultargs") PresentationLayerAssignment;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_PresentationLayerAssignment>

Description
-----------
returns Value as a PresentationLayerAssignment (Null if another type).
") PresentationLayerAssignment;
		opencascade::handle<StepVisual_PresentationLayerAssignment> PresentationLayerAssignment();

		/****** StepVisual_InvisibleItem::PresentationRepresentation ******/
		/****** md5 signature: cc6c70dd495b260c6d02169df44fd1e5 ******/
		%feature("compactdefaultargs") PresentationRepresentation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_PresentationRepresentation>

Description
-----------
returns Value as a PresentationRepresentation (Null if another type).
") PresentationRepresentation;
		opencascade::handle<StepVisual_PresentationRepresentation> PresentationRepresentation();

		/****** StepVisual_InvisibleItem::StyledItem ******/
		/****** md5 signature: 61c7563ce33340acb54e8fd4f4208e5f ******/
		%feature("compactdefaultargs") StyledItem;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_StyledItem>

Description
-----------
returns Value as a StyledItem (Null if another type).
") StyledItem;
		opencascade::handle<StepVisual_StyledItem> StyledItem();

};


%extend StepVisual_InvisibleItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class StepVisual_LayeredItem *
*******************************/
class StepVisual_LayeredItem : public StepData_SelectType {
	public:
		/****** StepVisual_LayeredItem::StepVisual_LayeredItem ******/
		/****** md5 signature: 93c036723eecdf8e1e30f8876a289d07 ******/
		%feature("compactdefaultargs") StepVisual_LayeredItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a LayeredItem SelectType.
") StepVisual_LayeredItem;
		 StepVisual_LayeredItem();

		/****** StepVisual_LayeredItem::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a LayeredItem Kind Entity that is: 1 -> PresentationRepresentation 2 -> RepresentationItem 0 else.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepVisual_LayeredItem::PresentationRepresentation ******/
		/****** md5 signature: cc6c70dd495b260c6d02169df44fd1e5 ******/
		%feature("compactdefaultargs") PresentationRepresentation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_PresentationRepresentation>

Description
-----------
returns Value as a PresentationRepresentation (Null if another type).
") PresentationRepresentation;
		opencascade::handle<StepVisual_PresentationRepresentation> PresentationRepresentation();

		/****** StepVisual_LayeredItem::RepresentationItem ******/
		/****** md5 signature: 542dc5a7f82620b971e50a23ff46cd55 ******/
		%feature("compactdefaultargs") RepresentationItem;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_RepresentationItem>

Description
-----------
returns Value as a RepresentationItem (Null if another type).
") RepresentationItem;
		opencascade::handle<StepRepr_RepresentationItem> RepresentationItem();

};


%extend StepVisual_LayeredItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class StepVisual_MarkerMember *
********************************/
class StepVisual_MarkerMember : public StepData_SelectInt {
	public:
		/****** StepVisual_MarkerMember::StepVisual_MarkerMember ******/
		/****** md5 signature: daa9cc87ce05af4fe8d8a93b0202878b ******/
		%feature("compactdefaultargs") StepVisual_MarkerMember;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepVisual_MarkerMember;
		 StepVisual_MarkerMember();

		/****** StepVisual_MarkerMember::EnumText ******/
		/****** md5 signature: 87fbaffd80c8fa4d76c26544ce1197f7 ******/
		%feature("compactdefaultargs") EnumText;
		%feature("autodoc", "Return
-------
char *

Description
-----------
No available documentation.
") EnumText;
		const char * EnumText();

		/****** StepVisual_MarkerMember::HasName ******/
		/****** md5 signature: 0fcc7580a7b0aa7df9ee626d148cd8f4 ******/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasName;
		bool HasName();

		/****** StepVisual_MarkerMember::Name ******/
		/****** md5 signature: f81f5718972ea56a52cc674874d73fa6 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
char *

Description
-----------
No available documentation.
") Name;
		const char * Name();

		/****** StepVisual_MarkerMember::SetEnumText ******/
		/****** md5 signature: ff167410ab2a2f7b248146090132a718 ******/
		%feature("compactdefaultargs") SetEnumText;
		%feature("autodoc", "
Parameters
----------
val: int
text: char *

Return
-------
None

Description
-----------
No available documentation.
") SetEnumText;
		virtual void SetEnumText(const int val, const char * const text);

		/****** StepVisual_MarkerMember::SetName ******/
		/****** md5 signature: 43a419e9da8ca16400e117289b098561 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
bool

Description
-----------
No available documentation.
") SetName;
		bool SetName(const char * const name);

		/****** StepVisual_MarkerMember::SetValue ******/
		/****** md5 signature: e50f72140ef69e3beed4121f92905c6a ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
val: StepVisual_MarkerType

Return
-------
None

Description
-----------
No available documentation.
") SetValue;
		void SetValue(const StepVisual_MarkerType val);

		/****** StepVisual_MarkerMember::Value ******/
		/****** md5 signature: 286dad6be4f4f67c96f083f6cc615782 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
StepVisual_MarkerType

Description
-----------
No available documentation.
") Value;
		StepVisual_MarkerType Value();

};


%make_alias(StepVisual_MarkerMember)

%extend StepVisual_MarkerMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class StepVisual_MarkerSelect *
********************************/
class StepVisual_MarkerSelect : public StepData_SelectType {
	public:
		/****** StepVisual_MarkerSelect::StepVisual_MarkerSelect ******/
		/****** md5 signature: b747f2349cdf0119e364732d8207582b ******/
		%feature("compactdefaultargs") StepVisual_MarkerSelect;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a MarkerSelect SelectType.
") StepVisual_MarkerSelect;
		 StepVisual_MarkerSelect();

		/****** StepVisual_MarkerSelect::CaseMem ******/
		/****** md5 signature: 37c055b5b19d1e0f29bc55a1b120999a ******/
		%feature("compactdefaultargs") CaseMem;
		%feature("autodoc", "
Parameters
----------
sm: StepData_SelectMember

Return
-------
int

Description
-----------
Returns 1 for a SelectMember enum, named MARKER_TYPE.
") CaseMem;
		int CaseMem(const opencascade::handle<StepData_SelectMember> & sm);

		/****** StepVisual_MarkerSelect::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a MarkerSelect Kind Entity that is: 0 else.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepVisual_MarkerSelect::MarkerMember ******/
		/****** md5 signature: 904b592dc010a92e404a5231a11e3db0 ******/
		%feature("compactdefaultargs") MarkerMember;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_MarkerMember>

Description
-----------
Gives access to the MarkerMember in order to get/set its value.
") MarkerMember;
		opencascade::handle<StepVisual_MarkerMember> MarkerMember();

		/****** StepVisual_MarkerSelect::NewMember ******/
		/****** md5 signature: 4dce57062553ca704dad3d58f4286daa ******/
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", "Return
-------
opencascade::handle<StepData_SelectMember>

Description
-----------
Returns a new MarkerMember.
") NewMember;
		opencascade::handle<StepData_SelectMember> NewMember();

};


%extend StepVisual_MarkerSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class StepVisual_NullStyleMember *
***********************************/
class StepVisual_NullStyleMember : public StepData_SelectInt {
	public:
		/****** StepVisual_NullStyleMember::StepVisual_NullStyleMember ******/
		/****** md5 signature: db8e9b9d9748c8d6d6acb09afd037958 ******/
		%feature("compactdefaultargs") StepVisual_NullStyleMember;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepVisual_NullStyleMember;
		 StepVisual_NullStyleMember();

		/****** StepVisual_NullStyleMember::EnumText ******/
		/****** md5 signature: 87fbaffd80c8fa4d76c26544ce1197f7 ******/
		%feature("compactdefaultargs") EnumText;
		%feature("autodoc", "Return
-------
char *

Description
-----------
No available documentation.
") EnumText;
		const char * EnumText();

		/****** StepVisual_NullStyleMember::HasName ******/
		/****** md5 signature: bd4b315f6f18a622c3bb84e9a6a133ce ******/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasName;
		bool HasName();

		/****** StepVisual_NullStyleMember::Kind ******/
		/****** md5 signature: 42ae9b06920f935350eb38434723dded ******/
		%feature("compactdefaultargs") Kind;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Kind;
		int Kind();

		/****** StepVisual_NullStyleMember::Name ******/
		/****** md5 signature: 19718bc4bb388d5a1a916f8e4ff42243 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
char *

Description
-----------
No available documentation.
") Name;
		const char * Name();

		/****** StepVisual_NullStyleMember::SetEnumText ******/
		/****** md5 signature: 0e8cc72552245d37177c56972370085a ******/
		%feature("compactdefaultargs") SetEnumText;
		%feature("autodoc", "
Parameters
----------
theValue: int
theText: char *

Return
-------
None

Description
-----------
No available documentation.
") SetEnumText;
		void SetEnumText(const int theValue, const char * const theText);

		/****** StepVisual_NullStyleMember::SetName ******/
		/****** md5 signature: 6e2722badfd64d55b14c15921c94cda5 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
const: char *

Return
-------
bool

Description
-----------
No available documentation.
") SetName;
		bool SetName(const char * const);

		/****** StepVisual_NullStyleMember::SetValue ******/
		/****** md5 signature: 60b2edcaeb2ecfca6564c87df8d43442 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
theValue: StepVisual_NullStyle

Return
-------
None

Description
-----------
No available documentation.
") SetValue;
		void SetValue(const StepVisual_NullStyle theValue);

		/****** StepVisual_NullStyleMember::Value ******/
		/****** md5 signature: 499e66d9d9d247b8575636e45cb31c31 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
StepVisual_NullStyle

Description
-----------
No available documentation.
") Value;
		StepVisual_NullStyle Value();

};


%make_alias(StepVisual_NullStyleMember)

%extend StepVisual_NullStyleMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class StepVisual_PathOrCompositeCurve *
****************************************/
class StepVisual_PathOrCompositeCurve : public StepData_SelectType {
	public:
		/****** StepVisual_PathOrCompositeCurve::StepVisual_PathOrCompositeCurve ******/
		/****** md5 signature: eb73d76ee64d09e5435dcca493c8913e ******/
		%feature("compactdefaultargs") StepVisual_PathOrCompositeCurve;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepVisual_PathOrCompositeCurve;
		 StepVisual_PathOrCompositeCurve();

		/****** StepVisual_PathOrCompositeCurve::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a kind of PathOrCompositeCurve select type -- 1 -> CompositeCurve -- 2 -> Path.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepVisual_PathOrCompositeCurve::CompositeCurve ******/
		/****** md5 signature: 42a10fec5b3fc66e2fe2af9d3d5512d3 ******/
		%feature("compactdefaultargs") CompositeCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_CompositeCurve>

Description
-----------
Returns Value as CompositeCurve (or Null if another type).
") CompositeCurve;
		opencascade::handle<StepGeom_CompositeCurve> CompositeCurve();

		/****** StepVisual_PathOrCompositeCurve::Path ******/
		/****** md5 signature: 70a013beb029bdf0f121d725b800b390 ******/
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "Return
-------
opencascade::handle<StepShape_Path>

Description
-----------
Returns Value as Path (or Null if another type).
") Path;
		opencascade::handle<StepShape_Path> Path();

};


%extend StepVisual_PathOrCompositeCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class StepVisual_PlanarExtent *
********************************/
class StepVisual_PlanarExtent : public StepGeom_GeometricRepresentationItem {
	public:
		/****** StepVisual_PlanarExtent::StepVisual_PlanarExtent ******/
		/****** md5 signature: f88e86cabfb096c37ea044d10729f3d7 ******/
		%feature("compactdefaultargs") StepVisual_PlanarExtent;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a PlanarExtent.
") StepVisual_PlanarExtent;
		 StepVisual_PlanarExtent();

		/****** StepVisual_PlanarExtent::Init ******/
		/****** md5 signature: d218fc1425f28eb3dca81c20fbb268ea ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aSizeInX: double
aSizeInY: double

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const double aSizeInX, const double aSizeInY);

		/****** StepVisual_PlanarExtent::SetSizeInX ******/
		/****** md5 signature: 35bb23f8643b38cf7948214459ed028e ******/
		%feature("compactdefaultargs") SetSizeInX;
		%feature("autodoc", "
Parameters
----------
aSizeInX: double

Return
-------
None

Description
-----------
No available documentation.
") SetSizeInX;
		void SetSizeInX(const double aSizeInX);

		/****** StepVisual_PlanarExtent::SetSizeInY ******/
		/****** md5 signature: 5eee05276803f50104f0192dc18b0745 ******/
		%feature("compactdefaultargs") SetSizeInY;
		%feature("autodoc", "
Parameters
----------
aSizeInY: double

Return
-------
None

Description
-----------
No available documentation.
") SetSizeInY;
		void SetSizeInY(const double aSizeInY);

		/****** StepVisual_PlanarExtent::SizeInX ******/
		/****** md5 signature: 4c9c998f0d0b37a3bb03b7c1f01f8c5c ******/
		%feature("compactdefaultargs") SizeInX;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") SizeInX;
		double SizeInX();

		/****** StepVisual_PlanarExtent::SizeInY ******/
		/****** md5 signature: 715950c0d471bb98239104219cc00c22 ******/
		%feature("compactdefaultargs") SizeInY;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") SizeInY;
		double SizeInY();

};


%make_alias(StepVisual_PlanarExtent)

%extend StepVisual_PlanarExtent {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class StepVisual_PointStyle *
******************************/
class StepVisual_PointStyle : public Standard_Transient {
	public:
		/****** StepVisual_PointStyle::StepVisual_PointStyle ******/
		/****** md5 signature: b77cff766667db83923134b16f1a080f ******/
		%feature("compactdefaultargs") StepVisual_PointStyle;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a PointStyle.
") StepVisual_PointStyle;
		 StepVisual_PointStyle();

		/****** StepVisual_PointStyle::Init ******/
		/****** md5 signature: 9222acf07fcf679d31b16ca30350c4af ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aMarker: StepVisual_MarkerSelect
aMarkerSize: StepBasic_SizeSelect
aMarkerColour: StepVisual_Colour

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const StepVisual_MarkerSelect & aMarker, const StepBasic_SizeSelect & aMarkerSize, const opencascade::handle<StepVisual_Colour> & aMarkerColour);

		/****** StepVisual_PointStyle::Marker ******/
		/****** md5 signature: b0937302b25ee8ac1612524b8e226a27 ******/
		%feature("compactdefaultargs") Marker;
		%feature("autodoc", "Return
-------
StepVisual_MarkerSelect

Description
-----------
No available documentation.
") Marker;
		StepVisual_MarkerSelect Marker();

		/****** StepVisual_PointStyle::MarkerColour ******/
		/****** md5 signature: d338cad7b0da61dca546ce9c4070f00c ******/
		%feature("compactdefaultargs") MarkerColour;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_Colour>

Description
-----------
No available documentation.
") MarkerColour;
		opencascade::handle<StepVisual_Colour> MarkerColour();

		/****** StepVisual_PointStyle::MarkerSize ******/
		/****** md5 signature: a0a261d41a3644442491bc71de2deb49 ******/
		%feature("compactdefaultargs") MarkerSize;
		%feature("autodoc", "Return
-------
StepBasic_SizeSelect

Description
-----------
No available documentation.
") MarkerSize;
		StepBasic_SizeSelect MarkerSize();

		/****** StepVisual_PointStyle::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepVisual_PointStyle::SetMarker ******/
		/****** md5 signature: 73af6a1dd7d9421a136310adef8d2b66 ******/
		%feature("compactdefaultargs") SetMarker;
		%feature("autodoc", "
Parameters
----------
aMarker: StepVisual_MarkerSelect

Return
-------
None

Description
-----------
No available documentation.
") SetMarker;
		void SetMarker(const StepVisual_MarkerSelect & aMarker);

		/****** StepVisual_PointStyle::SetMarkerColour ******/
		/****** md5 signature: a164ea9964492d37ca8c3b4139b0850b ******/
		%feature("compactdefaultargs") SetMarkerColour;
		%feature("autodoc", "
Parameters
----------
aMarkerColour: StepVisual_Colour

Return
-------
None

Description
-----------
No available documentation.
") SetMarkerColour;
		void SetMarkerColour(const opencascade::handle<StepVisual_Colour> & aMarkerColour);

		/****** StepVisual_PointStyle::SetMarkerSize ******/
		/****** md5 signature: 195892a7b46b4af9a849c8231556fdd8 ******/
		%feature("compactdefaultargs") SetMarkerSize;
		%feature("autodoc", "
Parameters
----------
aMarkerSize: StepBasic_SizeSelect

Return
-------
None

Description
-----------
No available documentation.
") SetMarkerSize;
		void SetMarkerSize(const StepBasic_SizeSelect & aMarkerSize);

		/****** StepVisual_PointStyle::SetName ******/
		/****** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & aName);

};


%make_alias(StepVisual_PointStyle)

%extend StepVisual_PointStyle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class StepVisual_PreDefinedItem *
**********************************/
class StepVisual_PreDefinedItem : public Standard_Transient {
	public:
		/****** StepVisual_PreDefinedItem::StepVisual_PreDefinedItem ******/
		/****** md5 signature: bdd452eb322280b48fb60be1f07c5b77 ******/
		%feature("compactdefaultargs") StepVisual_PreDefinedItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a PreDefinedItem.
") StepVisual_PreDefinedItem;
		 StepVisual_PreDefinedItem();

		/****** StepVisual_PreDefinedItem::Init ******/
		/****** md5 signature: e10f4ffe4365262d2d9a5484d96325b8 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName);

		/****** StepVisual_PreDefinedItem::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepVisual_PreDefinedItem::SetName ******/
		/****** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & aName);

};


%make_alias(StepVisual_PreDefinedItem)

%extend StepVisual_PreDefinedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class StepVisual_PresentationLayerAssignment *
***********************************************/
class StepVisual_PresentationLayerAssignment : public Standard_Transient {
	public:
		/****** StepVisual_PresentationLayerAssignment::StepVisual_PresentationLayerAssignment ******/
		/****** md5 signature: bc651d10b86d4455fe50d6f286ba6bad ******/
		%feature("compactdefaultargs") StepVisual_PresentationLayerAssignment;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a PresentationLayerAssignment.
") StepVisual_PresentationLayerAssignment;
		 StepVisual_PresentationLayerAssignment();

		/****** StepVisual_PresentationLayerAssignment::AssignedItems ******/
		/****** md5 signature: 316da28d08640dd7ed7717f795d90995 ******/
		%feature("compactdefaultargs") AssignedItems;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<StepVisual_LayeredItem>>

Description
-----------
No available documentation.
") AssignedItems;
		opencascade::handle<NCollection_HArray1<StepVisual_LayeredItem>> AssignedItems();

		/****** StepVisual_PresentationLayerAssignment::AssignedItemsValue ******/
		/****** md5 signature: 2384d06c0fff07159846e1b9e913321a ******/
		%feature("compactdefaultargs") AssignedItemsValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
StepVisual_LayeredItem

Description
-----------
No available documentation.
") AssignedItemsValue;
		StepVisual_LayeredItem AssignedItemsValue(const int num);

		/****** StepVisual_PresentationLayerAssignment::Description ******/
		/****** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****** StepVisual_PresentationLayerAssignment::Init ******/
		/****** md5 signature: 6f09cc7c3ac129bf91fbad8fbf974e33 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aAssignedItems: NCollection_HArray1<StepVisual_LayeredItem

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<NCollection_HArray1<StepVisual_LayeredItem>> & aAssignedItems);

		/****** StepVisual_PresentationLayerAssignment::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepVisual_PresentationLayerAssignment::NbAssignedItems ******/
		/****** md5 signature: 35286f12ef77e0a11c9b3f2b3bb82ede ******/
		%feature("compactdefaultargs") NbAssignedItems;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbAssignedItems;
		int NbAssignedItems();

		/****** StepVisual_PresentationLayerAssignment::SetAssignedItems ******/
		/****** md5 signature: 463f3c47a81c64ceafa1fa2b84d3105b ******/
		%feature("compactdefaultargs") SetAssignedItems;
		%feature("autodoc", "
Parameters
----------
aAssignedItems: NCollection_HArray1<StepVisual_LayeredItem

Return
-------
None

Description
-----------
No available documentation.
") SetAssignedItems;
		void SetAssignedItems(const opencascade::handle<NCollection_HArray1<StepVisual_LayeredItem>> & aAssignedItems);

		/****** StepVisual_PresentationLayerAssignment::SetDescription ******/
		/****** md5 signature: adddd13a906718df58a2eee683a382cf ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
aDescription: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****** StepVisual_PresentationLayerAssignment::SetName ******/
		/****** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & aName);

};


%make_alias(StepVisual_PresentationLayerAssignment)

%extend StepVisual_PresentationLayerAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class StepVisual_PresentationLayerUsage *
******************************************/
class StepVisual_PresentationLayerUsage : public Standard_Transient {
	public:
		/****** StepVisual_PresentationLayerUsage::StepVisual_PresentationLayerUsage ******/
		/****** md5 signature: df9b42b7b80c08b26a1d3807eac59846 ******/
		%feature("compactdefaultargs") StepVisual_PresentationLayerUsage;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepVisual_PresentationLayerUsage;
		 StepVisual_PresentationLayerUsage();

		/****** StepVisual_PresentationLayerUsage::Assignment ******/
		/****** md5 signature: 247e4ab376d50040ca43f5da78ec8dd3 ******/
		%feature("compactdefaultargs") Assignment;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_PresentationLayerAssignment>

Description
-----------
No available documentation.
") Assignment;
		opencascade::handle<StepVisual_PresentationLayerAssignment> Assignment();

		/****** StepVisual_PresentationLayerUsage::Init ******/
		/****** md5 signature: b5ae4ccbc7f6a2e56e2509e58cff32b6 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aAssignment: StepVisual_PresentationLayerAssignment
aPresentation: StepVisual_PresentationRepresentation

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepVisual_PresentationLayerAssignment> & aAssignment, const opencascade::handle<StepVisual_PresentationRepresentation> & aPresentation);

		/****** StepVisual_PresentationLayerUsage::Presentation ******/
		/****** md5 signature: 9cc4c5796d5f3f127af49d614b82062d ******/
		%feature("compactdefaultargs") Presentation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_PresentationRepresentation>

Description
-----------
No available documentation.
") Presentation;
		opencascade::handle<StepVisual_PresentationRepresentation> Presentation();

		/****** StepVisual_PresentationLayerUsage::SetAssignment ******/
		/****** md5 signature: bd4fba63c1435ca112fa113f1855ab37 ******/
		%feature("compactdefaultargs") SetAssignment;
		%feature("autodoc", "
Parameters
----------
aAssignment: StepVisual_PresentationLayerAssignment

Return
-------
None

Description
-----------
No available documentation.
") SetAssignment;
		void SetAssignment(const opencascade::handle<StepVisual_PresentationLayerAssignment> & aAssignment);

		/****** StepVisual_PresentationLayerUsage::SetPresentation ******/
		/****** md5 signature: 789e3b11b63d0bcb9cffb2a47d25a0d1 ******/
		%feature("compactdefaultargs") SetPresentation;
		%feature("autodoc", "
Parameters
----------
aPresentation: StepVisual_PresentationRepresentation

Return
-------
None

Description
-----------
No available documentation.
") SetPresentation;
		void SetPresentation(const opencascade::handle<StepVisual_PresentationRepresentation> & aPresentation);

};


%make_alias(StepVisual_PresentationLayerUsage)

%extend StepVisual_PresentationLayerUsage {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class StepVisual_PresentationRepresentation *
**********************************************/
class StepVisual_PresentationRepresentation : public StepRepr_Representation {
	public:
		/****** StepVisual_PresentationRepresentation::StepVisual_PresentationRepresentation ******/
		/****** md5 signature: ec69a087912fd220c75e7497d5184397 ******/
		%feature("compactdefaultargs") StepVisual_PresentationRepresentation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a PresentationRepresentation.
") StepVisual_PresentationRepresentation;
		 StepVisual_PresentationRepresentation();

};


%make_alias(StepVisual_PresentationRepresentation)

%extend StepVisual_PresentationRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************************
* class StepVisual_PresentationRepresentationSelect *
****************************************************/
class StepVisual_PresentationRepresentationSelect : public StepData_SelectType {
	public:
		/****** StepVisual_PresentationRepresentationSelect::StepVisual_PresentationRepresentationSelect ******/
		/****** md5 signature: e333b2922b258fe2030184dfb4c49927 ******/
		%feature("compactdefaultargs") StepVisual_PresentationRepresentationSelect;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a PresentationRepresentationSelect SelectType.
") StepVisual_PresentationRepresentationSelect;
		 StepVisual_PresentationRepresentationSelect();

		/****** StepVisual_PresentationRepresentationSelect::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a PresentationRepresentationSelect Kind Entity that is: 1 -> PresentationRepresentation 2 -> PresentationSet 0 else.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepVisual_PresentationRepresentationSelect::PresentationRepresentation ******/
		/****** md5 signature: cc6c70dd495b260c6d02169df44fd1e5 ******/
		%feature("compactdefaultargs") PresentationRepresentation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_PresentationRepresentation>

Description
-----------
returns Value as a PresentationRepresentation (Null if another type).
") PresentationRepresentation;
		opencascade::handle<StepVisual_PresentationRepresentation> PresentationRepresentation();

		/****** StepVisual_PresentationRepresentationSelect::PresentationSet ******/
		/****** md5 signature: e22661d0b7db8ea09e8adbe07ae2d793 ******/
		%feature("compactdefaultargs") PresentationSet;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_PresentationSet>

Description
-----------
returns Value as a PresentationSet (Null if another type).
") PresentationSet;
		opencascade::handle<StepVisual_PresentationSet> PresentationSet();

};


%extend StepVisual_PresentationRepresentationSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class StepVisual_PresentationSet *
***********************************/
class StepVisual_PresentationSet : public Standard_Transient {
	public:
		/****** StepVisual_PresentationSet::StepVisual_PresentationSet ******/
		/****** md5 signature: 076c6267b2a6fa3942cd60742ef1b09f ******/
		%feature("compactdefaultargs") StepVisual_PresentationSet;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a PresentationSet.
") StepVisual_PresentationSet;
		 StepVisual_PresentationSet();

};


%make_alias(StepVisual_PresentationSet)

%extend StepVisual_PresentationSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class StepVisual_PresentationSize *
************************************/
class StepVisual_PresentationSize : public Standard_Transient {
	public:
		/****** StepVisual_PresentationSize::StepVisual_PresentationSize ******/
		/****** md5 signature: 1c30c48e681560b686896ed17114ef3c ******/
		%feature("compactdefaultargs") StepVisual_PresentationSize;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a PresentationSize.
") StepVisual_PresentationSize;
		 StepVisual_PresentationSize();

		/****** StepVisual_PresentationSize::Init ******/
		/****** md5 signature: 134cd61619112c2a6a55025dc64ad2b0 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aUnit: StepVisual_PresentationSizeAssignmentSelect
aSize: StepVisual_PlanarBox

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const StepVisual_PresentationSizeAssignmentSelect & aUnit, const opencascade::handle<StepVisual_PlanarBox> & aSize);

		/****** StepVisual_PresentationSize::SetSize ******/
		/****** md5 signature: ff65fa6988b242450efd1611eab2bd0c ******/
		%feature("compactdefaultargs") SetSize;
		%feature("autodoc", "
Parameters
----------
aSize: StepVisual_PlanarBox

Return
-------
None

Description
-----------
No available documentation.
") SetSize;
		void SetSize(const opencascade::handle<StepVisual_PlanarBox> & aSize);

		/****** StepVisual_PresentationSize::SetUnit ******/
		/****** md5 signature: 044d71873cff349bc0a68a2a68b5c6b3 ******/
		%feature("compactdefaultargs") SetUnit;
		%feature("autodoc", "
Parameters
----------
aUnit: StepVisual_PresentationSizeAssignmentSelect

Return
-------
None

Description
-----------
No available documentation.
") SetUnit;
		void SetUnit(const StepVisual_PresentationSizeAssignmentSelect & aUnit);

		/****** StepVisual_PresentationSize::Size ******/
		/****** md5 signature: d8ca5ccfb2bbc200e10b187d7957d7f0 ******/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_PlanarBox>

Description
-----------
No available documentation.
") Size;
		opencascade::handle<StepVisual_PlanarBox> Size();

		/****** StepVisual_PresentationSize::Unit ******/
		/****** md5 signature: cf870604cf9fa6934ded63a559de4718 ******/
		%feature("compactdefaultargs") Unit;
		%feature("autodoc", "Return
-------
StepVisual_PresentationSizeAssignmentSelect

Description
-----------
No available documentation.
") Unit;
		StepVisual_PresentationSizeAssignmentSelect Unit();

};


%make_alias(StepVisual_PresentationSize)

%extend StepVisual_PresentationSize {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************************
* class StepVisual_PresentationSizeAssignmentSelect *
****************************************************/
class StepVisual_PresentationSizeAssignmentSelect : public StepData_SelectType {
	public:
		/****** StepVisual_PresentationSizeAssignmentSelect::StepVisual_PresentationSizeAssignmentSelect ******/
		/****** md5 signature: 453f954c0690e4b0f530a695065e7e92 ******/
		%feature("compactdefaultargs") StepVisual_PresentationSizeAssignmentSelect;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a PresentationSizeAssignmentSelect SelectType.
") StepVisual_PresentationSizeAssignmentSelect;
		 StepVisual_PresentationSizeAssignmentSelect();

		/****** StepVisual_PresentationSizeAssignmentSelect::AreaInSet ******/
		/****** md5 signature: b745d9b0509ee4b8b0103921950734c4 ******/
		%feature("compactdefaultargs") AreaInSet;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_AreaInSet>

Description
-----------
returns Value as a AreaInSet (Null if another type).
") AreaInSet;
		opencascade::handle<StepVisual_AreaInSet> AreaInSet();

		/****** StepVisual_PresentationSizeAssignmentSelect::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a PresentationSizeAssignmentSelect Kind Entity that is: 1 -> PresentationView 2 -> PresentationArea 3 -> AreaInSet 0 else.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepVisual_PresentationSizeAssignmentSelect::PresentationArea ******/
		/****** md5 signature: 6adf2ef7fa0a7b503035224ca0f9247c ******/
		%feature("compactdefaultargs") PresentationArea;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_PresentationArea>

Description
-----------
returns Value as a PresentationArea (Null if another type).
") PresentationArea;
		opencascade::handle<StepVisual_PresentationArea> PresentationArea();

		/****** StepVisual_PresentationSizeAssignmentSelect::PresentationView ******/
		/****** md5 signature: f42d5482c64642bbea3f6f415c07a2aa ******/
		%feature("compactdefaultargs") PresentationView;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_PresentationView>

Description
-----------
returns Value as a PresentationView (Null if another type).
") PresentationView;
		opencascade::handle<StepVisual_PresentationView> PresentationView();

};


%extend StepVisual_PresentationSizeAssignmentSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class StepVisual_PresentationStyleAssignment *
***********************************************/
class StepVisual_PresentationStyleAssignment : public Standard_Transient {
	public:
		/****** StepVisual_PresentationStyleAssignment::StepVisual_PresentationStyleAssignment ******/
		/****** md5 signature: 1cc58a43e5f19f8803a83422e4c077a0 ******/
		%feature("compactdefaultargs") StepVisual_PresentationStyleAssignment;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a PresentationStyleAssignment.
") StepVisual_PresentationStyleAssignment;
		 StepVisual_PresentationStyleAssignment();

		/****** StepVisual_PresentationStyleAssignment::Init ******/
		/****** md5 signature: 4f2d0da623a220c875e5ea709a7819bf ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aStyles: NCollection_HArray1<StepVisual_PresentationStyleSelect

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<NCollection_HArray1<StepVisual_PresentationStyleSelect>> & aStyles);

		/****** StepVisual_PresentationStyleAssignment::NbStyles ******/
		/****** md5 signature: 97420cad9904f1e553d5bec514daf50b ******/
		%feature("compactdefaultargs") NbStyles;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbStyles;
		int NbStyles();

		/****** StepVisual_PresentationStyleAssignment::SetStyles ******/
		/****** md5 signature: 781b67057dbe1d597de4ce3f65454007 ******/
		%feature("compactdefaultargs") SetStyles;
		%feature("autodoc", "
Parameters
----------
aStyles: NCollection_HArray1<StepVisual_PresentationStyleSelect

Return
-------
None

Description
-----------
No available documentation.
") SetStyles;
		void SetStyles(const opencascade::handle<NCollection_HArray1<StepVisual_PresentationStyleSelect>> & aStyles);

		/****** StepVisual_PresentationStyleAssignment::Styles ******/
		/****** md5 signature: e83d59a316647809580f3751317e12a8 ******/
		%feature("compactdefaultargs") Styles;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<StepVisual_PresentationStyleSelect>>

Description
-----------
No available documentation.
") Styles;
		opencascade::handle<NCollection_HArray1<StepVisual_PresentationStyleSelect>> Styles();

		/****** StepVisual_PresentationStyleAssignment::StylesValue ******/
		/****** md5 signature: 32527a25a2f0309129cd80a9c82cfa72 ******/
		%feature("compactdefaultargs") StylesValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
StepVisual_PresentationStyleSelect

Description
-----------
No available documentation.
") StylesValue;
		StepVisual_PresentationStyleSelect StylesValue(const int num);

};


%make_alias(StepVisual_PresentationStyleAssignment)

%extend StepVisual_PresentationStyleAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class StepVisual_PresentationStyleSelect *
*******************************************/
class StepVisual_PresentationStyleSelect : public StepData_SelectType {
	public:
		/****** StepVisual_PresentationStyleSelect::StepVisual_PresentationStyleSelect ******/
		/****** md5 signature: d698038487ae645487e097c623b624a4 ******/
		%feature("compactdefaultargs") StepVisual_PresentationStyleSelect;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a PresentationStyleSelect SelectType.
") StepVisual_PresentationStyleSelect;
		 StepVisual_PresentationStyleSelect();

		/****** StepVisual_PresentationStyleSelect::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a PresentationStyleSelect Kind Entity that is: 1 -> PointStyle 2 -> CurveStyle 3 -> SurfaceStyleUsage 4 -> SymbolStyle 5 -> FillAreaStyle 6 -> TextStyle 7 -> NullStyle 0 else.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepVisual_PresentationStyleSelect::CurveStyle ******/
		/****** md5 signature: feb37ceb221ce52916abd36c51e4b45e ******/
		%feature("compactdefaultargs") CurveStyle;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_CurveStyle>

Description
-----------
returns Value as a CurveStyle (Null if another type).
") CurveStyle;
		opencascade::handle<StepVisual_CurveStyle> CurveStyle();

		/****** StepVisual_PresentationStyleSelect::NullStyle ******/
		/****** md5 signature: 51d7654dc736b87f87621fc47c7db999 ******/
		%feature("compactdefaultargs") NullStyle;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_NullStyleMember>

Description
-----------
returns Value as a NullStyleMember (Null if another type).
") NullStyle;
		opencascade::handle<StepVisual_NullStyleMember> NullStyle();

		/****** StepVisual_PresentationStyleSelect::PointStyle ******/
		/****** md5 signature: 17b86073a0f884b719f02aa88f468775 ******/
		%feature("compactdefaultargs") PointStyle;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_PointStyle>

Description
-----------
returns Value as a PointStyle (Null if another type).
") PointStyle;
		opencascade::handle<StepVisual_PointStyle> PointStyle();

		/****** StepVisual_PresentationStyleSelect::SurfaceStyleUsage ******/
		/****** md5 signature: 07843196e3a5021749c6b631f17b4cd4 ******/
		%feature("compactdefaultargs") SurfaceStyleUsage;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_SurfaceStyleUsage>

Description
-----------
returns Value as a SurfaceStyleUsage (Null if another type).
") SurfaceStyleUsage;
		opencascade::handle<StepVisual_SurfaceStyleUsage> SurfaceStyleUsage();

};


%extend StepVisual_PresentationStyleSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class StepVisual_PresentedItem *
*********************************/
class StepVisual_PresentedItem : public Standard_Transient {
	public:
};


%make_alias(StepVisual_PresentedItem)

%extend StepVisual_PresentedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class StepVisual_PresentedItemRepresentation *
***********************************************/
class StepVisual_PresentedItemRepresentation : public Standard_Transient {
	public:
		/****** StepVisual_PresentedItemRepresentation::StepVisual_PresentedItemRepresentation ******/
		/****** md5 signature: 6a2c03b6953bc6a0f183bc036b5d02b2 ******/
		%feature("compactdefaultargs") StepVisual_PresentedItemRepresentation;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepVisual_PresentedItemRepresentation;
		 StepVisual_PresentedItemRepresentation();

		/****** StepVisual_PresentedItemRepresentation::Init ******/
		/****** md5 signature: afaf9a1ad462784c057d79ea97d58bd3 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aPresentation: StepVisual_PresentationRepresentationSelect
aItem: StepVisual_PresentedItem

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const StepVisual_PresentationRepresentationSelect & aPresentation, const opencascade::handle<StepVisual_PresentedItem> & aItem);

		/****** StepVisual_PresentedItemRepresentation::Item ******/
		/****** md5 signature: bd45dbe9824d6ba1403f78d43b832cde ******/
		%feature("compactdefaultargs") Item;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_PresentedItem>

Description
-----------
No available documentation.
") Item;
		opencascade::handle<StepVisual_PresentedItem> Item();

		/****** StepVisual_PresentedItemRepresentation::Presentation ******/
		/****** md5 signature: 9ef48fb3f701841293be09e9ddf616a1 ******/
		%feature("compactdefaultargs") Presentation;
		%feature("autodoc", "Return
-------
StepVisual_PresentationRepresentationSelect

Description
-----------
No available documentation.
") Presentation;
		StepVisual_PresentationRepresentationSelect Presentation();

		/****** StepVisual_PresentedItemRepresentation::SetItem ******/
		/****** md5 signature: 7287d7bdd5ae0d68f4c034717ef5e93f ******/
		%feature("compactdefaultargs") SetItem;
		%feature("autodoc", "
Parameters
----------
aItem: StepVisual_PresentedItem

Return
-------
None

Description
-----------
No available documentation.
") SetItem;
		void SetItem(const opencascade::handle<StepVisual_PresentedItem> & aItem);

		/****** StepVisual_PresentedItemRepresentation::SetPresentation ******/
		/****** md5 signature: 55a61dae3a49551206aa8452312894cb ******/
		%feature("compactdefaultargs") SetPresentation;
		%feature("autodoc", "
Parameters
----------
aPresentation: StepVisual_PresentationRepresentationSelect

Return
-------
None

Description
-----------
No available documentation.
") SetPresentation;
		void SetPresentation(const StepVisual_PresentationRepresentationSelect & aPresentation);

};


%make_alias(StepVisual_PresentedItemRepresentation)

%extend StepVisual_PresentedItemRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class StepVisual_RenderingPropertiesSelect *
*********************************************/
class StepVisual_RenderingPropertiesSelect : public StepData_SelectType {
	public:
		/****** StepVisual_RenderingPropertiesSelect::StepVisual_RenderingPropertiesSelect ******/
		/****** md5 signature: 686e9d5183294b53b632dd910cc670c6 ******/
		%feature("compactdefaultargs") StepVisual_RenderingPropertiesSelect;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepVisual_RenderingPropertiesSelect;
		 StepVisual_RenderingPropertiesSelect();

		/****** StepVisual_RenderingPropertiesSelect::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a kind of RenderingPropertiesSelect select type -- 1 -> SurfaceStyleReflectanceAmbient -- 2 -> SurfaceStyleTransparent.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepVisual_RenderingPropertiesSelect::SurfaceStyleReflectanceAmbient ******/
		/****** md5 signature: 9bed639fef414c2878d022d2ab14c51d ******/
		%feature("compactdefaultargs") SurfaceStyleReflectanceAmbient;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_SurfaceStyleReflectanceAmbient>

Description
-----------
Returns Value as SurfaceStyleReflectanceAmbient (or Null if another type).
") SurfaceStyleReflectanceAmbient;
		opencascade::handle<StepVisual_SurfaceStyleReflectanceAmbient> SurfaceStyleReflectanceAmbient();

		/****** StepVisual_RenderingPropertiesSelect::SurfaceStyleTransparent ******/
		/****** md5 signature: 68a06be6ae013949c2e639cdc3d6c875 ******/
		%feature("compactdefaultargs") SurfaceStyleTransparent;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_SurfaceStyleTransparent>

Description
-----------
Returns Value as SurfaceStyleTransparent (or Null if another type).
") SurfaceStyleTransparent;
		opencascade::handle<StepVisual_SurfaceStyleTransparent> SurfaceStyleTransparent();

};


%extend StepVisual_RenderingPropertiesSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class StepVisual_StyleContextSelect *
**************************************/
class StepVisual_StyleContextSelect : public StepData_SelectType {
	public:
		/****** StepVisual_StyleContextSelect::StepVisual_StyleContextSelect ******/
		/****** md5 signature: 245e3c379950dd3775102e67c26aa0b7 ******/
		%feature("compactdefaultargs") StepVisual_StyleContextSelect;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a StyleContextSelect SelectType.
") StepVisual_StyleContextSelect;
		 StepVisual_StyleContextSelect();

		/****** StepVisual_StyleContextSelect::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a StyleContextSelect Kind Entity that is: 1 -> Representation 2 -> RepresentationItem 3 -> PresentationSet 0 else.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepVisual_StyleContextSelect::PresentationSet ******/
		/****** md5 signature: e22661d0b7db8ea09e8adbe07ae2d793 ******/
		%feature("compactdefaultargs") PresentationSet;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_PresentationSet>

Description
-----------
returns Value as a PresentationSet (Null if another type).
") PresentationSet;
		opencascade::handle<StepVisual_PresentationSet> PresentationSet();

		/****** StepVisual_StyleContextSelect::Representation ******/
		/****** md5 signature: b68b8aa0615de130a54bdd2ee7c69058 ******/
		%feature("compactdefaultargs") Representation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_Representation>

Description
-----------
returns Value as a Representation (Null if another type).
") Representation;
		opencascade::handle<StepRepr_Representation> Representation();

		/****** StepVisual_StyleContextSelect::RepresentationItem ******/
		/****** md5 signature: 542dc5a7f82620b971e50a23ff46cd55 ******/
		%feature("compactdefaultargs") RepresentationItem;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_RepresentationItem>

Description
-----------
returns Value as a RepresentationItem (Null if another type).
") RepresentationItem;
		opencascade::handle<StepRepr_RepresentationItem> RepresentationItem();

};


%extend StepVisual_StyleContextSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class StepVisual_StyledItem *
******************************/
class StepVisual_StyledItem : public StepRepr_RepresentationItem {
	public:
		/****** StepVisual_StyledItem::StepVisual_StyledItem ******/
		/****** md5 signature: ba356b13d240ad620cd30b3911a83616 ******/
		%feature("compactdefaultargs") StepVisual_StyledItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a StyledItem.
") StepVisual_StyledItem;
		 StepVisual_StyledItem();

		/****** StepVisual_StyledItem::Init ******/
		/****** md5 signature: 46e65cf6630bd4c5646663caab6db854 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aStyles: NCollection_HArray1<
aItem: Standard_Transient

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<NCollection_HArray1<opencascade::handle<StepVisual_PresentationStyleAssignment>> > & aStyles, const opencascade::handle<Standard_Transient> & aItem);

		/****** StepVisual_StyledItem::Item ******/
		/****** md5 signature: b179c866de84187747718fbbc1a1a674 ******/
		%feature("compactdefaultargs") Item;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_RepresentationItem>

Description
-----------
No available documentation.
") Item;
		const opencascade::handle<StepRepr_RepresentationItem> & Item();

		/****** StepVisual_StyledItem::ItemAP242 ******/
		/****** md5 signature: 1ce5c4413fc2f2d22b54b078fea7862d ******/
		%feature("compactdefaultargs") ItemAP242;
		%feature("autodoc", "Return
-------
StepVisual_StyledItemTarget

Description
-----------
No available documentation.
") ItemAP242;
		StepVisual_StyledItemTarget ItemAP242();

		/****** StepVisual_StyledItem::NbStyles ******/
		/****** md5 signature: a804bdb3bec61420efd3a70e362fe1f5 ******/
		%feature("compactdefaultargs") NbStyles;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbStyles;
		int NbStyles();

		/****** StepVisual_StyledItem::SetItem ******/
		/****** md5 signature: f8751c7ecf676d7196a87836c9ffe6aa ******/
		%feature("compactdefaultargs") SetItem;
		%feature("autodoc", "
Parameters
----------
aItem: StepRepr_RepresentationItem

Return
-------
None

Description
-----------
No available documentation.
") SetItem;
		void SetItem(const opencascade::handle<StepRepr_RepresentationItem> & aItem);

		/****** StepVisual_StyledItem::SetItem ******/
		/****** md5 signature: db406cab8953a05f7213afd42772e1e3 ******/
		%feature("compactdefaultargs") SetItem;
		%feature("autodoc", "
Parameters
----------
aItem: StepVisual_StyledItemTarget

Return
-------
None

Description
-----------
No available documentation.
") SetItem;
		void SetItem(const StepVisual_StyledItemTarget & aItem);

		/****** StepVisual_StyledItem::SetStyles ******/
		/****** md5 signature: 1f1eca0651c19159e80ad7e01f54f9e4 ******/
		%feature("compactdefaultargs") SetStyles;
		%feature("autodoc", "
Parameters
----------
aStyles: NCollection_HArray1<

Return
-------
None

Description
-----------
No available documentation.
") SetStyles;
		void SetStyles(const opencascade::handle<NCollection_HArray1<opencascade::handle<StepVisual_PresentationStyleAssignment>> > & aStyles);

		/****** StepVisual_StyledItem::Styles ******/
		/****** md5 signature: 9dbbc61bd574d20f6183b0d7222d5c92 ******/
		%feature("compactdefaultargs") Styles;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<opencascade::handle<StepVisual_PresentationStyleAssignment>>>

Description
-----------
No available documentation.
") Styles;
		const opencascade::handle<NCollection_HArray1<opencascade::handle<StepVisual_PresentationStyleAssignment>>> & Styles();

		/****** StepVisual_StyledItem::StylesValue ******/
		/****** md5 signature: c25f9b28afba13d2a7dd4ed12fffe090 ******/
		%feature("compactdefaultargs") StylesValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<StepVisual_PresentationStyleAssignment>

Description
-----------
No available documentation.
") StylesValue;
		const opencascade::handle<StepVisual_PresentationStyleAssignment> & StylesValue(const int num);

};


%make_alias(StepVisual_StyledItem)

%extend StepVisual_StyledItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class StepVisual_StyledItemTarget *
************************************/
class StepVisual_StyledItemTarget : public StepData_SelectType {
	public:
		/****** StepVisual_StyledItemTarget::StepVisual_StyledItemTarget ******/
		/****** md5 signature: 2f64081b6dab9fa6e6bbdf0c1008fcc4 ******/
		%feature("compactdefaultargs") StepVisual_StyledItemTarget;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a StyledItemTarget select type.
") StepVisual_StyledItemTarget;
		 StepVisual_StyledItemTarget();

		/****** StepVisual_StyledItemTarget::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a StyledItemTarget Kind Entity that is: 1 -> GeometricRepresentationItem 2 -> MappedItem 3 -> Representation 4 -> TopologicalRepresentationItem 0 else.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepVisual_StyledItemTarget::GeometricRepresentationItem ******/
		/****** md5 signature: 5fe5040cbfbd8308bf2067e8e59f2a57 ******/
		%feature("compactdefaultargs") GeometricRepresentationItem;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_GeometricRepresentationItem>

Description
-----------
returns Value as a GeometricRepresentationItem (Null if another type).
") GeometricRepresentationItem;
		opencascade::handle<StepGeom_GeometricRepresentationItem> GeometricRepresentationItem();

		/****** StepVisual_StyledItemTarget::MappedItem ******/
		/****** md5 signature: 7d3cb5566b070a8a554b734d0e71c9a2 ******/
		%feature("compactdefaultargs") MappedItem;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_MappedItem>

Description
-----------
returns Value as a MappedItem (Null if another type).
") MappedItem;
		opencascade::handle<StepRepr_MappedItem> MappedItem();

		/****** StepVisual_StyledItemTarget::Representation ******/
		/****** md5 signature: b68b8aa0615de130a54bdd2ee7c69058 ******/
		%feature("compactdefaultargs") Representation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_Representation>

Description
-----------
returns Value as a Representation (Null if another type).
") Representation;
		opencascade::handle<StepRepr_Representation> Representation();

		/****** StepVisual_StyledItemTarget::TopologicalRepresentationItem ******/
		/****** md5 signature: c284bfb9f5a9e1919a195be6f2b6b165 ******/
		%feature("compactdefaultargs") TopologicalRepresentationItem;
		%feature("autodoc", "Return
-------
opencascade::handle<StepShape_TopologicalRepresentationItem>

Description
-----------
returns Value as a TopologicalRepresentationItem (Null if another type).
") TopologicalRepresentationItem;
		opencascade::handle<StepShape_TopologicalRepresentationItem> TopologicalRepresentationItem();

};


%extend StepVisual_StyledItemTarget {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class StepVisual_SurfaceSideStyle *
************************************/
class StepVisual_SurfaceSideStyle : public Standard_Transient {
	public:
		/****** StepVisual_SurfaceSideStyle::StepVisual_SurfaceSideStyle ******/
		/****** md5 signature: 4882b15692527097afbf4793122302de ******/
		%feature("compactdefaultargs") StepVisual_SurfaceSideStyle;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a SurfaceSideStyle.
") StepVisual_SurfaceSideStyle;
		 StepVisual_SurfaceSideStyle();

		/****** StepVisual_SurfaceSideStyle::Init ******/
		/****** md5 signature: 2afc516dec2f73c330b51c8090915d24 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aStyles: NCollection_HArray1<StepVisual_SurfaceStyleElementSelect

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<NCollection_HArray1<StepVisual_SurfaceStyleElementSelect>> & aStyles);

		/****** StepVisual_SurfaceSideStyle::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepVisual_SurfaceSideStyle::NbStyles ******/
		/****** md5 signature: 97420cad9904f1e553d5bec514daf50b ******/
		%feature("compactdefaultargs") NbStyles;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbStyles;
		int NbStyles();

		/****** StepVisual_SurfaceSideStyle::SetName ******/
		/****** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & aName);

		/****** StepVisual_SurfaceSideStyle::SetStyles ******/
		/****** md5 signature: 7e34e52758eb81aaa80815ef62cb3b45 ******/
		%feature("compactdefaultargs") SetStyles;
		%feature("autodoc", "
Parameters
----------
aStyles: NCollection_HArray1<StepVisual_SurfaceStyleElementSelect

Return
-------
None

Description
-----------
No available documentation.
") SetStyles;
		void SetStyles(const opencascade::handle<NCollection_HArray1<StepVisual_SurfaceStyleElementSelect>> & aStyles);

		/****** StepVisual_SurfaceSideStyle::Styles ******/
		/****** md5 signature: 0c736cb1bace419a0e6b94fe43432266 ******/
		%feature("compactdefaultargs") Styles;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<StepVisual_SurfaceStyleElementSelect>>

Description
-----------
No available documentation.
") Styles;
		opencascade::handle<NCollection_HArray1<StepVisual_SurfaceStyleElementSelect>> Styles();

		/****** StepVisual_SurfaceSideStyle::StylesValue ******/
		/****** md5 signature: 833adeb2c4773d8d36d5bc8c8071207c ******/
		%feature("compactdefaultargs") StylesValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
StepVisual_SurfaceStyleElementSelect

Description
-----------
No available documentation.
") StylesValue;
		StepVisual_SurfaceStyleElementSelect StylesValue(const int num);

};


%make_alias(StepVisual_SurfaceSideStyle)

%extend StepVisual_SurfaceSideStyle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class StepVisual_SurfaceStyleBoundary *
****************************************/
class StepVisual_SurfaceStyleBoundary : public Standard_Transient {
	public:
		/****** StepVisual_SurfaceStyleBoundary::StepVisual_SurfaceStyleBoundary ******/
		/****** md5 signature: c343f688faa7b3ee856d2f453c3a6cba ******/
		%feature("compactdefaultargs") StepVisual_SurfaceStyleBoundary;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a SurfaceStyleBoundary.
") StepVisual_SurfaceStyleBoundary;
		 StepVisual_SurfaceStyleBoundary();

		/****** StepVisual_SurfaceStyleBoundary::Init ******/
		/****** md5 signature: 1b9f8ef27c6d3a75a114218cd9590b05 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aStyleOfBoundary: StepVisual_CurveStyle

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepVisual_CurveStyle> & aStyleOfBoundary);

		/****** StepVisual_SurfaceStyleBoundary::SetStyleOfBoundary ******/
		/****** md5 signature: c0a6ef03cb2b2676b749dc49eb978fa9 ******/
		%feature("compactdefaultargs") SetStyleOfBoundary;
		%feature("autodoc", "
Parameters
----------
aStyleOfBoundary: StepVisual_CurveStyle

Return
-------
None

Description
-----------
No available documentation.
") SetStyleOfBoundary;
		void SetStyleOfBoundary(const opencascade::handle<StepVisual_CurveStyle> & aStyleOfBoundary);

		/****** StepVisual_SurfaceStyleBoundary::StyleOfBoundary ******/
		/****** md5 signature: 0f849fffb900eb31d4c6a97554a49968 ******/
		%feature("compactdefaultargs") StyleOfBoundary;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_CurveStyle>

Description
-----------
No available documentation.
") StyleOfBoundary;
		opencascade::handle<StepVisual_CurveStyle> StyleOfBoundary();

};


%make_alias(StepVisual_SurfaceStyleBoundary)

%extend StepVisual_SurfaceStyleBoundary {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class StepVisual_SurfaceStyleControlGrid *
*******************************************/
class StepVisual_SurfaceStyleControlGrid : public Standard_Transient {
	public:
		/****** StepVisual_SurfaceStyleControlGrid::StepVisual_SurfaceStyleControlGrid ******/
		/****** md5 signature: 54f14aa7bd79ff4edbf012835da3fc84 ******/
		%feature("compactdefaultargs") StepVisual_SurfaceStyleControlGrid;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a SurfaceStyleControlGrid.
") StepVisual_SurfaceStyleControlGrid;
		 StepVisual_SurfaceStyleControlGrid();

		/****** StepVisual_SurfaceStyleControlGrid::Init ******/
		/****** md5 signature: 5f342d6058c8060a4186e6ca6f45bdca ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aStyleOfControlGrid: StepVisual_CurveStyle

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepVisual_CurveStyle> & aStyleOfControlGrid);

		/****** StepVisual_SurfaceStyleControlGrid::SetStyleOfControlGrid ******/
		/****** md5 signature: 00c64e624d853c2785e0ea625922e2e1 ******/
		%feature("compactdefaultargs") SetStyleOfControlGrid;
		%feature("autodoc", "
Parameters
----------
aStyleOfControlGrid: StepVisual_CurveStyle

Return
-------
None

Description
-----------
No available documentation.
") SetStyleOfControlGrid;
		void SetStyleOfControlGrid(const opencascade::handle<StepVisual_CurveStyle> & aStyleOfControlGrid);

		/****** StepVisual_SurfaceStyleControlGrid::StyleOfControlGrid ******/
		/****** md5 signature: df6b516f2ab3a519941e950f726a1a71 ******/
		%feature("compactdefaultargs") StyleOfControlGrid;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_CurveStyle>

Description
-----------
No available documentation.
") StyleOfControlGrid;
		opencascade::handle<StepVisual_CurveStyle> StyleOfControlGrid();

};


%make_alias(StepVisual_SurfaceStyleControlGrid)

%extend StepVisual_SurfaceStyleControlGrid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class StepVisual_SurfaceStyleElementSelect *
*********************************************/
class StepVisual_SurfaceStyleElementSelect : public StepData_SelectType {
	public:
		/****** StepVisual_SurfaceStyleElementSelect::StepVisual_SurfaceStyleElementSelect ******/
		/****** md5 signature: b170b139d52b64aa4ee6b12b9432e3c8 ******/
		%feature("compactdefaultargs") StepVisual_SurfaceStyleElementSelect;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a SurfaceStyleElementSelect SelectType.
") StepVisual_SurfaceStyleElementSelect;
		 StepVisual_SurfaceStyleElementSelect();

		/****** StepVisual_SurfaceStyleElementSelect::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a SurfaceStyleElementSelect Kind Entity that is: 1 -> SurfaceStyleFillArea 2 -> SurfaceStyleBoundary 3 -> SurfaceStyleParameterLine 4 -> SurfaceStyleSilhouette 5 -> SurfaceStyleSegmentationCurve 6 -> SurfaceStyleControlGrid 7 -> SurfaceStyleRendering 0 else.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepVisual_SurfaceStyleElementSelect::SurfaceStyleBoundary ******/
		/****** md5 signature: 60e2375370484d5abf5ea7b996a7c3ba ******/
		%feature("compactdefaultargs") SurfaceStyleBoundary;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_SurfaceStyleBoundary>

Description
-----------
returns Value as a SurfaceStyleBoundary (Null if another type).
") SurfaceStyleBoundary;
		opencascade::handle<StepVisual_SurfaceStyleBoundary> SurfaceStyleBoundary();

		/****** StepVisual_SurfaceStyleElementSelect::SurfaceStyleFillArea ******/
		/****** md5 signature: 8d8549d10e2597b64c4aa01e379d2517 ******/
		%feature("compactdefaultargs") SurfaceStyleFillArea;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_SurfaceStyleFillArea>

Description
-----------
returns Value as a SurfaceStyleFillArea (Null if another type).
") SurfaceStyleFillArea;
		opencascade::handle<StepVisual_SurfaceStyleFillArea> SurfaceStyleFillArea();

		/****** StepVisual_SurfaceStyleElementSelect::SurfaceStyleParameterLine ******/
		/****** md5 signature: 239f8c574221b0e1ca2ff7de1fe9c988 ******/
		%feature("compactdefaultargs") SurfaceStyleParameterLine;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_SurfaceStyleParameterLine>

Description
-----------
returns Value as a SurfaceStyleParameterLine (Null if another type).
") SurfaceStyleParameterLine;
		opencascade::handle<StepVisual_SurfaceStyleParameterLine> SurfaceStyleParameterLine();

		/****** StepVisual_SurfaceStyleElementSelect::SurfaceStyleRendering ******/
		/****** md5 signature: 5f325ec85c1ede8555ecba2f5cbf6f90 ******/
		%feature("compactdefaultargs") SurfaceStyleRendering;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_SurfaceStyleRendering>

Description
-----------
returns Value as a SurfaceStyleRendering (Null if another type).
") SurfaceStyleRendering;
		opencascade::handle<StepVisual_SurfaceStyleRendering> SurfaceStyleRendering();

};


%extend StepVisual_SurfaceStyleElementSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class StepVisual_SurfaceStyleFillArea *
****************************************/
class StepVisual_SurfaceStyleFillArea : public Standard_Transient {
	public:
		/****** StepVisual_SurfaceStyleFillArea::StepVisual_SurfaceStyleFillArea ******/
		/****** md5 signature: 1f1109cf250681a0a6e78b68c611d8cf ******/
		%feature("compactdefaultargs") StepVisual_SurfaceStyleFillArea;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a SurfaceStyleFillArea.
") StepVisual_SurfaceStyleFillArea;
		 StepVisual_SurfaceStyleFillArea();

		/****** StepVisual_SurfaceStyleFillArea::FillArea ******/
		/****** md5 signature: 7a207f539a4cb9c890bff0e53e6499b7 ******/
		%feature("compactdefaultargs") FillArea;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_FillAreaStyle>

Description
-----------
No available documentation.
") FillArea;
		opencascade::handle<StepVisual_FillAreaStyle> FillArea();

		/****** StepVisual_SurfaceStyleFillArea::Init ******/
		/****** md5 signature: 4984f0131e88fcdb66041d8cc23d0170 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aFillArea: StepVisual_FillAreaStyle

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepVisual_FillAreaStyle> & aFillArea);

		/****** StepVisual_SurfaceStyleFillArea::SetFillArea ******/
		/****** md5 signature: f5c7e3e6095f2cac2d9e4db97e049f66 ******/
		%feature("compactdefaultargs") SetFillArea;
		%feature("autodoc", "
Parameters
----------
aFillArea: StepVisual_FillAreaStyle

Return
-------
None

Description
-----------
No available documentation.
") SetFillArea;
		void SetFillArea(const opencascade::handle<StepVisual_FillAreaStyle> & aFillArea);

};


%make_alias(StepVisual_SurfaceStyleFillArea)

%extend StepVisual_SurfaceStyleFillArea {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class StepVisual_SurfaceStyleParameterLine *
*********************************************/
class StepVisual_SurfaceStyleParameterLine : public Standard_Transient {
	public:
		/****** StepVisual_SurfaceStyleParameterLine::StepVisual_SurfaceStyleParameterLine ******/
		/****** md5 signature: 44bf16f9c49a8f448fe8553474111acc ******/
		%feature("compactdefaultargs") StepVisual_SurfaceStyleParameterLine;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a SurfaceStyleParameterLine.
") StepVisual_SurfaceStyleParameterLine;
		 StepVisual_SurfaceStyleParameterLine();

		/****** StepVisual_SurfaceStyleParameterLine::DirectionCounts ******/
		/****** md5 signature: 090978fea32ed5da2301e6cf5d077acc ******/
		%feature("compactdefaultargs") DirectionCounts;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<StepVisual_DirectionCountSelect>>

Description
-----------
No available documentation.
") DirectionCounts;
		opencascade::handle<NCollection_HArray1<StepVisual_DirectionCountSelect>> DirectionCounts();

		/****** StepVisual_SurfaceStyleParameterLine::DirectionCountsValue ******/
		/****** md5 signature: a4b4ace7dbff46ab767ef134b0010a6d ******/
		%feature("compactdefaultargs") DirectionCountsValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
StepVisual_DirectionCountSelect

Description
-----------
No available documentation.
") DirectionCountsValue;
		StepVisual_DirectionCountSelect DirectionCountsValue(const int num);

		/****** StepVisual_SurfaceStyleParameterLine::Init ******/
		/****** md5 signature: 97735e6d0c6015e9b765aca9c78b1015 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aStyleOfParameterLines: StepVisual_CurveStyle
aDirectionCounts: NCollection_HArray1<StepVisual_DirectionCountSelect

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepVisual_CurveStyle> & aStyleOfParameterLines, const opencascade::handle<NCollection_HArray1<StepVisual_DirectionCountSelect>> & aDirectionCounts);

		/****** StepVisual_SurfaceStyleParameterLine::NbDirectionCounts ******/
		/****** md5 signature: ca03c2788a478390ce838f82a67657a1 ******/
		%feature("compactdefaultargs") NbDirectionCounts;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbDirectionCounts;
		int NbDirectionCounts();

		/****** StepVisual_SurfaceStyleParameterLine::SetDirectionCounts ******/
		/****** md5 signature: 790d3656a9b19b71090797163f1bb455 ******/
		%feature("compactdefaultargs") SetDirectionCounts;
		%feature("autodoc", "
Parameters
----------
aDirectionCounts: NCollection_HArray1<StepVisual_DirectionCountSelect

Return
-------
None

Description
-----------
No available documentation.
") SetDirectionCounts;
		void SetDirectionCounts(const opencascade::handle<NCollection_HArray1<StepVisual_DirectionCountSelect>> & aDirectionCounts);

		/****** StepVisual_SurfaceStyleParameterLine::SetStyleOfParameterLines ******/
		/****** md5 signature: 60991ea2b6f263eb992462d00c39f07a ******/
		%feature("compactdefaultargs") SetStyleOfParameterLines;
		%feature("autodoc", "
Parameters
----------
aStyleOfParameterLines: StepVisual_CurveStyle

Return
-------
None

Description
-----------
No available documentation.
") SetStyleOfParameterLines;
		void SetStyleOfParameterLines(const opencascade::handle<StepVisual_CurveStyle> & aStyleOfParameterLines);

		/****** StepVisual_SurfaceStyleParameterLine::StyleOfParameterLines ******/
		/****** md5 signature: 38c96947560379a3b23831b4ab804eea ******/
		%feature("compactdefaultargs") StyleOfParameterLines;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_CurveStyle>

Description
-----------
No available documentation.
") StyleOfParameterLines;
		opencascade::handle<StepVisual_CurveStyle> StyleOfParameterLines();

};


%make_alias(StepVisual_SurfaceStyleParameterLine)

%extend StepVisual_SurfaceStyleParameterLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class StepVisual_SurfaceStyleReflectanceAmbient *
**************************************************/
class StepVisual_SurfaceStyleReflectanceAmbient : public Standard_Transient {
	public:
		/****** StepVisual_SurfaceStyleReflectanceAmbient::StepVisual_SurfaceStyleReflectanceAmbient ******/
		/****** md5 signature: 71934b99e15908b4c798322bbe56e8d7 ******/
		%feature("compactdefaultargs") StepVisual_SurfaceStyleReflectanceAmbient;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepVisual_SurfaceStyleReflectanceAmbient;
		 StepVisual_SurfaceStyleReflectanceAmbient();

		/****** StepVisual_SurfaceStyleReflectanceAmbient::AmbientReflectance ******/
		/****** md5 signature: 70951726e18d9b458ffacd0c725b33c1 ******/
		%feature("compactdefaultargs") AmbientReflectance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field AmbientReflectance.
") AmbientReflectance;
		double AmbientReflectance();

		/****** StepVisual_SurfaceStyleReflectanceAmbient::Init ******/
		/****** md5 signature: e36595b1dae2051f62dd43207b2371f4 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theAmbientReflectance: double

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const double theAmbientReflectance);

		/****** StepVisual_SurfaceStyleReflectanceAmbient::SetAmbientReflectance ******/
		/****** md5 signature: aed6481acd8947adfde93f05cb7bb9cf ******/
		%feature("compactdefaultargs") SetAmbientReflectance;
		%feature("autodoc", "
Parameters
----------
theAmbientReflectance: double

Return
-------
None

Description
-----------
Sets field AmbientReflectance.
") SetAmbientReflectance;
		void SetAmbientReflectance(const double theAmbientReflectance);

};


%make_alias(StepVisual_SurfaceStyleReflectanceAmbient)

%extend StepVisual_SurfaceStyleReflectanceAmbient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class StepVisual_SurfaceStyleRendering *
*****************************************/
class StepVisual_SurfaceStyleRendering : public Standard_Transient {
	public:
		/****** StepVisual_SurfaceStyleRendering::StepVisual_SurfaceStyleRendering ******/
		/****** md5 signature: 1501071707aa881fd43933f71984dc1a ******/
		%feature("compactdefaultargs") StepVisual_SurfaceStyleRendering;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepVisual_SurfaceStyleRendering;
		 StepVisual_SurfaceStyleRendering();

		/****** StepVisual_SurfaceStyleRendering::Init ******/
		/****** md5 signature: e293b1ce0c8ea41af555cab8fbde959a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRenderingMethod: StepVisual_ShadingSurfaceMethod
theSurfaceColour: StepVisual_Colour

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const StepVisual_ShadingSurfaceMethod theRenderingMethod, const opencascade::handle<StepVisual_Colour> & theSurfaceColour);

		/****** StepVisual_SurfaceStyleRendering::RenderingMethod ******/
		/****** md5 signature: c7b331f67430a0085d411394103847aa ******/
		%feature("compactdefaultargs") RenderingMethod;
		%feature("autodoc", "Return
-------
StepVisual_ShadingSurfaceMethod

Description
-----------
Returns field RenderingMethod.
") RenderingMethod;
		StepVisual_ShadingSurfaceMethod RenderingMethod();

		/****** StepVisual_SurfaceStyleRendering::SetRenderingMethod ******/
		/****** md5 signature: eb3fec1e8fa2531906fc0ab938671f88 ******/
		%feature("compactdefaultargs") SetRenderingMethod;
		%feature("autodoc", "
Parameters
----------
theRenderingMethod: StepVisual_ShadingSurfaceMethod

Return
-------
None

Description
-----------
Sets field RenderingMethod.
") SetRenderingMethod;
		void SetRenderingMethod(const StepVisual_ShadingSurfaceMethod theRenderingMethod);

		/****** StepVisual_SurfaceStyleRendering::SetSurfaceColour ******/
		/****** md5 signature: 6a65727e6f437c63c9a4db20080f7dc8 ******/
		%feature("compactdefaultargs") SetSurfaceColour;
		%feature("autodoc", "
Parameters
----------
theSurfaceColour: StepVisual_Colour

Return
-------
None

Description
-----------
Sets field SurfaceColour.
") SetSurfaceColour;
		void SetSurfaceColour(const opencascade::handle<StepVisual_Colour> & theSurfaceColour);

		/****** StepVisual_SurfaceStyleRendering::SurfaceColour ******/
		/****** md5 signature: 48f1dd93065e855f4e371c669e45d364 ******/
		%feature("compactdefaultargs") SurfaceColour;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_Colour>

Description
-----------
Returns field SurfaceColour.
") SurfaceColour;
		opencascade::handle<StepVisual_Colour> SurfaceColour();

};


%make_alias(StepVisual_SurfaceStyleRendering)

%extend StepVisual_SurfaceStyleRendering {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class StepVisual_SurfaceStyleSegmentationCurve *
*************************************************/
class StepVisual_SurfaceStyleSegmentationCurve : public Standard_Transient {
	public:
		/****** StepVisual_SurfaceStyleSegmentationCurve::StepVisual_SurfaceStyleSegmentationCurve ******/
		/****** md5 signature: b2e636e4e4ecd4c64c1f5e5b81c7356c ******/
		%feature("compactdefaultargs") StepVisual_SurfaceStyleSegmentationCurve;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a SurfaceStyleSegmentationCurve.
") StepVisual_SurfaceStyleSegmentationCurve;
		 StepVisual_SurfaceStyleSegmentationCurve();

		/****** StepVisual_SurfaceStyleSegmentationCurve::Init ******/
		/****** md5 signature: b2ff7c529207d96358b5b664bc9f29f1 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aStyleOfSegmentationCurve: StepVisual_CurveStyle

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepVisual_CurveStyle> & aStyleOfSegmentationCurve);

		/****** StepVisual_SurfaceStyleSegmentationCurve::SetStyleOfSegmentationCurve ******/
		/****** md5 signature: b6d90dcef55f1078cdd65921b7f4fdf4 ******/
		%feature("compactdefaultargs") SetStyleOfSegmentationCurve;
		%feature("autodoc", "
Parameters
----------
aStyleOfSegmentationCurve: StepVisual_CurveStyle

Return
-------
None

Description
-----------
No available documentation.
") SetStyleOfSegmentationCurve;
		void SetStyleOfSegmentationCurve(const opencascade::handle<StepVisual_CurveStyle> & aStyleOfSegmentationCurve);

		/****** StepVisual_SurfaceStyleSegmentationCurve::StyleOfSegmentationCurve ******/
		/****** md5 signature: f301e19409fc020518c4f371ae565aee ******/
		%feature("compactdefaultargs") StyleOfSegmentationCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_CurveStyle>

Description
-----------
No available documentation.
") StyleOfSegmentationCurve;
		opencascade::handle<StepVisual_CurveStyle> StyleOfSegmentationCurve();

};


%make_alias(StepVisual_SurfaceStyleSegmentationCurve)

%extend StepVisual_SurfaceStyleSegmentationCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class StepVisual_SurfaceStyleSilhouette *
******************************************/
class StepVisual_SurfaceStyleSilhouette : public Standard_Transient {
	public:
		/****** StepVisual_SurfaceStyleSilhouette::StepVisual_SurfaceStyleSilhouette ******/
		/****** md5 signature: 552028bfb9ce796746c72b2d436cf459 ******/
		%feature("compactdefaultargs") StepVisual_SurfaceStyleSilhouette;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a SurfaceStyleSilhouette.
") StepVisual_SurfaceStyleSilhouette;
		 StepVisual_SurfaceStyleSilhouette();

		/****** StepVisual_SurfaceStyleSilhouette::Init ******/
		/****** md5 signature: 41c2e4d980f622a85e688c3a3cf95fbc ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aStyleOfSilhouette: StepVisual_CurveStyle

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepVisual_CurveStyle> & aStyleOfSilhouette);

		/****** StepVisual_SurfaceStyleSilhouette::SetStyleOfSilhouette ******/
		/****** md5 signature: 4559334ce9fd74a3bf20bac0dc9dee07 ******/
		%feature("compactdefaultargs") SetStyleOfSilhouette;
		%feature("autodoc", "
Parameters
----------
aStyleOfSilhouette: StepVisual_CurveStyle

Return
-------
None

Description
-----------
No available documentation.
") SetStyleOfSilhouette;
		void SetStyleOfSilhouette(const opencascade::handle<StepVisual_CurveStyle> & aStyleOfSilhouette);

		/****** StepVisual_SurfaceStyleSilhouette::StyleOfSilhouette ******/
		/****** md5 signature: d8382ee77cafadce30346ea47d0117ff ******/
		%feature("compactdefaultargs") StyleOfSilhouette;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_CurveStyle>

Description
-----------
No available documentation.
") StyleOfSilhouette;
		opencascade::handle<StepVisual_CurveStyle> StyleOfSilhouette();

};


%make_alias(StepVisual_SurfaceStyleSilhouette)

%extend StepVisual_SurfaceStyleSilhouette {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class StepVisual_SurfaceStyleTransparent *
*******************************************/
class StepVisual_SurfaceStyleTransparent : public Standard_Transient {
	public:
		/****** StepVisual_SurfaceStyleTransparent::StepVisual_SurfaceStyleTransparent ******/
		/****** md5 signature: a25569b5c11593b7b12c7835b3529298 ******/
		%feature("compactdefaultargs") StepVisual_SurfaceStyleTransparent;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepVisual_SurfaceStyleTransparent;
		 StepVisual_SurfaceStyleTransparent();

		/****** StepVisual_SurfaceStyleTransparent::Init ******/
		/****** md5 signature: 5fd97bfbaab138286e83c607dac0b036 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theTransparency: double

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const double theTransparency);

		/****** StepVisual_SurfaceStyleTransparent::SetTransparency ******/
		/****** md5 signature: 02b4fed6ee1a4240530c7396d8f781a9 ******/
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "
Parameters
----------
theTransparency: double

Return
-------
None

Description
-----------
Sets field Transparency.
") SetTransparency;
		void SetTransparency(const double theTransparency);

		/****** StepVisual_SurfaceStyleTransparent::Transparency ******/
		/****** md5 signature: 080317bfb744c0d6d6d612bb6c05010b ******/
		%feature("compactdefaultargs") Transparency;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field Transparency.
") Transparency;
		double Transparency();

};


%make_alias(StepVisual_SurfaceStyleTransparent)

%extend StepVisual_SurfaceStyleTransparent {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class StepVisual_SurfaceStyleUsage *
*************************************/
class StepVisual_SurfaceStyleUsage : public Standard_Transient {
	public:
		/****** StepVisual_SurfaceStyleUsage::StepVisual_SurfaceStyleUsage ******/
		/****** md5 signature: cd6205afb042cafc42201bc397b0cf78 ******/
		%feature("compactdefaultargs") StepVisual_SurfaceStyleUsage;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a SurfaceStyleUsage.
") StepVisual_SurfaceStyleUsage;
		 StepVisual_SurfaceStyleUsage();

		/****** StepVisual_SurfaceStyleUsage::Init ******/
		/****** md5 signature: df82a537b1243af5e3624ca058d0f7b0 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aSide: StepVisual_SurfaceSide
aStyle: StepVisual_SurfaceSideStyle

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const StepVisual_SurfaceSide aSide, const opencascade::handle<StepVisual_SurfaceSideStyle> & aStyle);

		/****** StepVisual_SurfaceStyleUsage::SetSide ******/
		/****** md5 signature: cd76bd9b534e2074389344c3fb6cdb9a ******/
		%feature("compactdefaultargs") SetSide;
		%feature("autodoc", "
Parameters
----------
aSide: StepVisual_SurfaceSide

Return
-------
None

Description
-----------
No available documentation.
") SetSide;
		void SetSide(const StepVisual_SurfaceSide aSide);

		/****** StepVisual_SurfaceStyleUsage::SetStyle ******/
		/****** md5 signature: 7e98a9b0f7baaac64a9c676e5f748940 ******/
		%feature("compactdefaultargs") SetStyle;
		%feature("autodoc", "
Parameters
----------
aStyle: StepVisual_SurfaceSideStyle

Return
-------
None

Description
-----------
No available documentation.
") SetStyle;
		void SetStyle(const opencascade::handle<StepVisual_SurfaceSideStyle> & aStyle);

		/****** StepVisual_SurfaceStyleUsage::Side ******/
		/****** md5 signature: 0f2dd0ab0a9c85a0cced2c3c04eeb6b3 ******/
		%feature("compactdefaultargs") Side;
		%feature("autodoc", "Return
-------
StepVisual_SurfaceSide

Description
-----------
No available documentation.
") Side;
		StepVisual_SurfaceSide Side();

		/****** StepVisual_SurfaceStyleUsage::Style ******/
		/****** md5 signature: 281ff11a57702f076d3ab4746db9c275 ******/
		%feature("compactdefaultargs") Style;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_SurfaceSideStyle>

Description
-----------
No available documentation.
") Style;
		opencascade::handle<StepVisual_SurfaceSideStyle> Style();

};


%make_alias(StepVisual_SurfaceStyleUsage)

%extend StepVisual_SurfaceStyleUsage {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class StepVisual_Template *
****************************/
class StepVisual_Template : public StepRepr_Representation {
	public:
		/****** StepVisual_Template::StepVisual_Template ******/
		/****** md5 signature: 98a29e9485b572c6d182c550517575b4 ******/
		%feature("compactdefaultargs") StepVisual_Template;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a Template.
") StepVisual_Template;
		 StepVisual_Template();

};


%make_alias(StepVisual_Template)

%extend StepVisual_Template {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class StepVisual_TemplateInstance *
************************************/
class StepVisual_TemplateInstance : public StepRepr_MappedItem {
	public:
		/****** StepVisual_TemplateInstance::StepVisual_TemplateInstance ******/
		/****** md5 signature: 00d5ea8e4e94c157bd72672626e1fe9a ******/
		%feature("compactdefaultargs") StepVisual_TemplateInstance;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a TemplateInstance.
") StepVisual_TemplateInstance;
		 StepVisual_TemplateInstance();

};


%make_alias(StepVisual_TemplateInstance)

%extend StepVisual_TemplateInstance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class StepVisual_TessellatedEdgeOrVertex *
*******************************************/
class StepVisual_TessellatedEdgeOrVertex : public StepData_SelectType {
	public:
		/****** StepVisual_TessellatedEdgeOrVertex::StepVisual_TessellatedEdgeOrVertex ******/
		/****** md5 signature: 364777b104683ec182c5e36348ac6671 ******/
		%feature("compactdefaultargs") StepVisual_TessellatedEdgeOrVertex;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepVisual_TessellatedEdgeOrVertex;
		 StepVisual_TessellatedEdgeOrVertex();

		/****** StepVisual_TessellatedEdgeOrVertex::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a kind of TessellatedEdgeOrVertex select type -- 1 -> TessellatedEdge -- 2 -> TessellatedVertex.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepVisual_TessellatedEdgeOrVertex::TessellatedEdge ******/
		/****** md5 signature: 0fd3afdf3d4017d4a02e01bd9318e50c ******/
		%feature("compactdefaultargs") TessellatedEdge;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_TessellatedEdge>

Description
-----------
Returns Value as TessellatedEdge (or Null if another type).
") TessellatedEdge;
		opencascade::handle<StepVisual_TessellatedEdge> TessellatedEdge();

		/****** StepVisual_TessellatedEdgeOrVertex::TessellatedVertex ******/
		/****** md5 signature: dd46ff2cd474cda5e6eb3b9a96bf936f ******/
		%feature("compactdefaultargs") TessellatedVertex;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_TessellatedVertex>

Description
-----------
Returns Value as TessellatedVertex (or Null if another type).
") TessellatedVertex;
		opencascade::handle<StepVisual_TessellatedVertex> TessellatedVertex();

};


%extend StepVisual_TessellatedEdgeOrVertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class StepVisual_TessellatedItem *
***********************************/
class StepVisual_TessellatedItem : public StepGeom_GeometricRepresentationItem {
	public:
		/****** StepVisual_TessellatedItem::StepVisual_TessellatedItem ******/
		/****** md5 signature: 1f0e50b979ba0e9467d4cc0b2addf872 ******/
		%feature("compactdefaultargs") StepVisual_TessellatedItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a DraughtingCalloutElement select type.
") StepVisual_TessellatedItem;
		 StepVisual_TessellatedItem();

};


%make_alias(StepVisual_TessellatedItem)

%extend StepVisual_TessellatedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class StepVisual_TessellatedShapeRepresentation *
**************************************************/
class StepVisual_TessellatedShapeRepresentation : public StepShape_ShapeRepresentation {
	public:
		/****** StepVisual_TessellatedShapeRepresentation::StepVisual_TessellatedShapeRepresentation ******/
		/****** md5 signature: 6554c259ff46f1389191d79bba4a0f4e ******/
		%feature("compactdefaultargs") StepVisual_TessellatedShapeRepresentation;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepVisual_TessellatedShapeRepresentation;
		 StepVisual_TessellatedShapeRepresentation();

};


%make_alias(StepVisual_TessellatedShapeRepresentation)

%extend StepVisual_TessellatedShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class StepVisual_TextLiteral *
*******************************/
class StepVisual_TextLiteral : public StepGeom_GeometricRepresentationItem {
	public:
		/****** StepVisual_TextLiteral::StepVisual_TextLiteral ******/
		/****** md5 signature: 207c1764223c21381dba0520f18ef5cf ******/
		%feature("compactdefaultargs") StepVisual_TextLiteral;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a TextLiteral.
") StepVisual_TextLiteral;
		 StepVisual_TextLiteral();

		/****** StepVisual_TextLiteral::Alignment ******/
		/****** md5 signature: d9f3be3aca1a7c9762448f0a275713f3 ******/
		%feature("compactdefaultargs") Alignment;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Alignment;
		opencascade::handle<TCollection_HAsciiString> Alignment();

		/****** StepVisual_TextLiteral::Font ******/
		/****** md5 signature: 366cb2d993106a7fbf312f8309637cd0 ******/
		%feature("compactdefaultargs") Font;
		%feature("autodoc", "Return
-------
StepVisual_FontSelect

Description
-----------
No available documentation.
") Font;
		StepVisual_FontSelect Font();

		/****** StepVisual_TextLiteral::Init ******/
		/****** md5 signature: 50bc1c92f84c1ed1a0306b1acc2071f3 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aLiteral: TCollection_HAsciiString
aPlacement: StepGeom_Axis2Placement
aAlignment: TCollection_HAsciiString
aPath: StepVisual_TextPath
aFont: StepVisual_FontSelect

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aLiteral, const StepGeom_Axis2Placement & aPlacement, const opencascade::handle<TCollection_HAsciiString> & aAlignment, const StepVisual_TextPath aPath, const StepVisual_FontSelect & aFont);

		/****** StepVisual_TextLiteral::Literal ******/
		/****** md5 signature: 688a7f87a89d399e30572bd17aed1a6c ******/
		%feature("compactdefaultargs") Literal;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Literal;
		opencascade::handle<TCollection_HAsciiString> Literal();

		/****** StepVisual_TextLiteral::Path ******/
		/****** md5 signature: 7f02336e8e0f17c0b3604233e9a6ba76 ******/
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "Return
-------
StepVisual_TextPath

Description
-----------
No available documentation.
") Path;
		StepVisual_TextPath Path();

		/****** StepVisual_TextLiteral::Placement ******/
		/****** md5 signature: b66e16bd2b866237c0d300c709f8aafe ******/
		%feature("compactdefaultargs") Placement;
		%feature("autodoc", "Return
-------
StepGeom_Axis2Placement

Description
-----------
No available documentation.
") Placement;
		StepGeom_Axis2Placement Placement();

		/****** StepVisual_TextLiteral::SetAlignment ******/
		/****** md5 signature: 9c1731a51a841e791f14a7431af46503 ******/
		%feature("compactdefaultargs") SetAlignment;
		%feature("autodoc", "
Parameters
----------
aAlignment: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetAlignment;
		void SetAlignment(const opencascade::handle<TCollection_HAsciiString> & aAlignment);

		/****** StepVisual_TextLiteral::SetFont ******/
		/****** md5 signature: 0fe285aab50f8b1ec2a13e1e01b1bfac ******/
		%feature("compactdefaultargs") SetFont;
		%feature("autodoc", "
Parameters
----------
aFont: StepVisual_FontSelect

Return
-------
None

Description
-----------
No available documentation.
") SetFont;
		void SetFont(const StepVisual_FontSelect & aFont);

		/****** StepVisual_TextLiteral::SetLiteral ******/
		/****** md5 signature: cc3f88a6291d261365c7e8de00c8c970 ******/
		%feature("compactdefaultargs") SetLiteral;
		%feature("autodoc", "
Parameters
----------
aLiteral: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetLiteral;
		void SetLiteral(const opencascade::handle<TCollection_HAsciiString> & aLiteral);

		/****** StepVisual_TextLiteral::SetPath ******/
		/****** md5 signature: 98ca1e3a731a056bbee1b4e31c4c7c90 ******/
		%feature("compactdefaultargs") SetPath;
		%feature("autodoc", "
Parameters
----------
aPath: StepVisual_TextPath

Return
-------
None

Description
-----------
No available documentation.
") SetPath;
		void SetPath(const StepVisual_TextPath aPath);

		/****** StepVisual_TextLiteral::SetPlacement ******/
		/****** md5 signature: ad02f5eccfb653be4766b095dfa772cf ******/
		%feature("compactdefaultargs") SetPlacement;
		%feature("autodoc", "
Parameters
----------
aPlacement: StepGeom_Axis2Placement

Return
-------
None

Description
-----------
No available documentation.
") SetPlacement;
		void SetPlacement(const StepGeom_Axis2Placement & aPlacement);

};


%make_alias(StepVisual_TextLiteral)

%extend StepVisual_TextLiteral {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class StepVisual_TextOrCharacter *
***********************************/
class StepVisual_TextOrCharacter : public StepData_SelectType {
	public:
		/****** StepVisual_TextOrCharacter::StepVisual_TextOrCharacter ******/
		/****** md5 signature: 263f2a1181da76f8375c0a4586d07791 ******/
		%feature("compactdefaultargs") StepVisual_TextOrCharacter;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a TextOrCharacter SelectType.
") StepVisual_TextOrCharacter;
		 StepVisual_TextOrCharacter();

		/****** StepVisual_TextOrCharacter::AnnotationText ******/
		/****** md5 signature: d828bde976b7e598ba10444740a40a04 ******/
		%feature("compactdefaultargs") AnnotationText;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_AnnotationText>

Description
-----------
returns Value as a AnnotationText (Null if another type).
") AnnotationText;
		opencascade::handle<StepVisual_AnnotationText> AnnotationText();

		/****** StepVisual_TextOrCharacter::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a TextOrCharacter Kind Entity that is: 1 -> AnnotationText 2 -> CompositeText 3 -> TextLiteral 0 else.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepVisual_TextOrCharacter::CompositeText ******/
		/****** md5 signature: 02d79e50e6e540a3c424977d9d1dc388 ******/
		%feature("compactdefaultargs") CompositeText;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_CompositeText>

Description
-----------
returns Value as a CompositeText (Null if another type).
") CompositeText;
		opencascade::handle<StepVisual_CompositeText> CompositeText();

		/****** StepVisual_TextOrCharacter::TextLiteral ******/
		/****** md5 signature: b12e6b464c4c0a143633eaaca9bec8e7 ******/
		%feature("compactdefaultargs") TextLiteral;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_TextLiteral>

Description
-----------
returns Value as a TextLiteral (Null if another type).
") TextLiteral;
		opencascade::handle<StepVisual_TextLiteral> TextLiteral();

};


%extend StepVisual_TextOrCharacter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class StepVisual_TextStyle *
*****************************/
class StepVisual_TextStyle : public Standard_Transient {
	public:
		/****** StepVisual_TextStyle::StepVisual_TextStyle ******/
		/****** md5 signature: 45e828d51e0a5695a9ca7ada3679f9fd ******/
		%feature("compactdefaultargs") StepVisual_TextStyle;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a TextStyle.
") StepVisual_TextStyle;
		 StepVisual_TextStyle();

		/****** StepVisual_TextStyle::CharacterAppearance ******/
		/****** md5 signature: 37d0030d8a8d72f05968330f7e5ab175 ******/
		%feature("compactdefaultargs") CharacterAppearance;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_TextStyleForDefinedFont>

Description
-----------
No available documentation.
") CharacterAppearance;
		opencascade::handle<StepVisual_TextStyleForDefinedFont> CharacterAppearance();

		/****** StepVisual_TextStyle::Init ******/
		/****** md5 signature: 69f213b7c43e1df990719966e51fc47c ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aCharacterAppearance: StepVisual_TextStyleForDefinedFont

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepVisual_TextStyleForDefinedFont> & aCharacterAppearance);

		/****** StepVisual_TextStyle::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepVisual_TextStyle::SetCharacterAppearance ******/
		/****** md5 signature: 9f723407d3433fae13854ccf88fca9da ******/
		%feature("compactdefaultargs") SetCharacterAppearance;
		%feature("autodoc", "
Parameters
----------
aCharacterAppearance: StepVisual_TextStyleForDefinedFont

Return
-------
None

Description
-----------
No available documentation.
") SetCharacterAppearance;
		void SetCharacterAppearance(const opencascade::handle<StepVisual_TextStyleForDefinedFont> & aCharacterAppearance);

		/****** StepVisual_TextStyle::SetName ******/
		/****** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & aName);

};


%make_alias(StepVisual_TextStyle)

%extend StepVisual_TextStyle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class StepVisual_TextStyleForDefinedFont *
*******************************************/
class StepVisual_TextStyleForDefinedFont : public Standard_Transient {
	public:
		/****** StepVisual_TextStyleForDefinedFont::StepVisual_TextStyleForDefinedFont ******/
		/****** md5 signature: 79829fb49193213700846560ced1fe78 ******/
		%feature("compactdefaultargs") StepVisual_TextStyleForDefinedFont;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a TextStyleForDefinedFont.
") StepVisual_TextStyleForDefinedFont;
		 StepVisual_TextStyleForDefinedFont();

		/****** StepVisual_TextStyleForDefinedFont::Init ******/
		/****** md5 signature: f4a79bece49f98e6e24eba3b506f4abc ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aTextColour: StepVisual_Colour

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepVisual_Colour> & aTextColour);

		/****** StepVisual_TextStyleForDefinedFont::SetTextColour ******/
		/****** md5 signature: e3111f08f2715def0709beca5a7da748 ******/
		%feature("compactdefaultargs") SetTextColour;
		%feature("autodoc", "
Parameters
----------
aTextColour: StepVisual_Colour

Return
-------
None

Description
-----------
No available documentation.
") SetTextColour;
		void SetTextColour(const opencascade::handle<StepVisual_Colour> & aTextColour);

		/****** StepVisual_TextStyleForDefinedFont::TextColour ******/
		/****** md5 signature: 37e43acc90f39243ed2cf2ae03be99e0 ******/
		%feature("compactdefaultargs") TextColour;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_Colour>

Description
-----------
No available documentation.
") TextColour;
		opencascade::handle<StepVisual_Colour> TextColour();

};


%make_alias(StepVisual_TextStyleForDefinedFont)

%extend StepVisual_TextStyleForDefinedFont {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class StepVisual_ViewVolume *
******************************/
class StepVisual_ViewVolume : public Standard_Transient {
	public:
		/****** StepVisual_ViewVolume::StepVisual_ViewVolume ******/
		/****** md5 signature: 0785a7fd1db8da789ac608f090a0b641 ******/
		%feature("compactdefaultargs") StepVisual_ViewVolume;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a ViewVolume.
") StepVisual_ViewVolume;
		 StepVisual_ViewVolume();

		/****** StepVisual_ViewVolume::BackPlaneClipping ******/
		/****** md5 signature: 9d2173074052993a1fa074458ab5fc3e ******/
		%feature("compactdefaultargs") BackPlaneClipping;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") BackPlaneClipping;
		bool BackPlaneClipping();

		/****** StepVisual_ViewVolume::BackPlaneDistance ******/
		/****** md5 signature: 3a91404ddc19b3d462c9f0c7742fca8a ******/
		%feature("compactdefaultargs") BackPlaneDistance;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") BackPlaneDistance;
		double BackPlaneDistance();

		/****** StepVisual_ViewVolume::FrontPlaneClipping ******/
		/****** md5 signature: a2b32a533a58863b5c38a4ec269dcd61 ******/
		%feature("compactdefaultargs") FrontPlaneClipping;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") FrontPlaneClipping;
		bool FrontPlaneClipping();

		/****** StepVisual_ViewVolume::FrontPlaneDistance ******/
		/****** md5 signature: 9b6f84d16594f0bd1ece2f47befa6792 ******/
		%feature("compactdefaultargs") FrontPlaneDistance;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") FrontPlaneDistance;
		double FrontPlaneDistance();

		/****** StepVisual_ViewVolume::Init ******/
		/****** md5 signature: 24d9c3a0ab8211e67eb8df6e8316ddbd ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aProjectionType: StepVisual_CentralOrParallel
aProjectionPoint: StepGeom_CartesianPoint
aViewPlaneDistance: double
aFrontPlaneDistance: double
aFrontPlaneClipping: bool
aBackPlaneDistance: double
aBackPlaneClipping: bool
aViewVolumeSidesClipping: bool
aViewWindow: StepVisual_PlanarBox

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const StepVisual_CentralOrParallel aProjectionType, const opencascade::handle<StepGeom_CartesianPoint> & aProjectionPoint, const double aViewPlaneDistance, const double aFrontPlaneDistance, const bool aFrontPlaneClipping, const double aBackPlaneDistance, const bool aBackPlaneClipping, const bool aViewVolumeSidesClipping, const opencascade::handle<StepVisual_PlanarBox> & aViewWindow);

		/****** StepVisual_ViewVolume::ProjectionPoint ******/
		/****** md5 signature: 4314d1b4352760cb5ce3c88148f1e3ec ******/
		%feature("compactdefaultargs") ProjectionPoint;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_CartesianPoint>

Description
-----------
No available documentation.
") ProjectionPoint;
		opencascade::handle<StepGeom_CartesianPoint> ProjectionPoint();

		/****** StepVisual_ViewVolume::ProjectionType ******/
		/****** md5 signature: e0315a1e454ac2a2c3fa65f19c1a43eb ******/
		%feature("compactdefaultargs") ProjectionType;
		%feature("autodoc", "Return
-------
StepVisual_CentralOrParallel

Description
-----------
No available documentation.
") ProjectionType;
		StepVisual_CentralOrParallel ProjectionType();

		/****** StepVisual_ViewVolume::SetBackPlaneClipping ******/
		/****** md5 signature: e571720931b29a4ba9edca8cb6c7eb9d ******/
		%feature("compactdefaultargs") SetBackPlaneClipping;
		%feature("autodoc", "
Parameters
----------
aBackPlaneClipping: bool

Return
-------
None

Description
-----------
No available documentation.
") SetBackPlaneClipping;
		void SetBackPlaneClipping(const bool aBackPlaneClipping);

		/****** StepVisual_ViewVolume::SetBackPlaneDistance ******/
		/****** md5 signature: dbe89224be3ad19caf7469d03440c254 ******/
		%feature("compactdefaultargs") SetBackPlaneDistance;
		%feature("autodoc", "
Parameters
----------
aBackPlaneDistance: double

Return
-------
None

Description
-----------
No available documentation.
") SetBackPlaneDistance;
		void SetBackPlaneDistance(const double aBackPlaneDistance);

		/****** StepVisual_ViewVolume::SetFrontPlaneClipping ******/
		/****** md5 signature: b5a9fbd3d8d2315cb2cd063fb595f88f ******/
		%feature("compactdefaultargs") SetFrontPlaneClipping;
		%feature("autodoc", "
Parameters
----------
aFrontPlaneClipping: bool

Return
-------
None

Description
-----------
No available documentation.
") SetFrontPlaneClipping;
		void SetFrontPlaneClipping(const bool aFrontPlaneClipping);

		/****** StepVisual_ViewVolume::SetFrontPlaneDistance ******/
		/****** md5 signature: 02a314ebfa4eeb94d8cfe1e5f9ad1bc3 ******/
		%feature("compactdefaultargs") SetFrontPlaneDistance;
		%feature("autodoc", "
Parameters
----------
aFrontPlaneDistance: double

Return
-------
None

Description
-----------
No available documentation.
") SetFrontPlaneDistance;
		void SetFrontPlaneDistance(const double aFrontPlaneDistance);

		/****** StepVisual_ViewVolume::SetProjectionPoint ******/
		/****** md5 signature: 88da046078f60f581b65e026335ecd38 ******/
		%feature("compactdefaultargs") SetProjectionPoint;
		%feature("autodoc", "
Parameters
----------
aProjectionPoint: StepGeom_CartesianPoint

Return
-------
None

Description
-----------
No available documentation.
") SetProjectionPoint;
		void SetProjectionPoint(const opencascade::handle<StepGeom_CartesianPoint> & aProjectionPoint);

		/****** StepVisual_ViewVolume::SetProjectionType ******/
		/****** md5 signature: 3a707c0c3f03e6c5db11e789ae6e5506 ******/
		%feature("compactdefaultargs") SetProjectionType;
		%feature("autodoc", "
Parameters
----------
aProjectionType: StepVisual_CentralOrParallel

Return
-------
None

Description
-----------
No available documentation.
") SetProjectionType;
		void SetProjectionType(const StepVisual_CentralOrParallel aProjectionType);

		/****** StepVisual_ViewVolume::SetViewPlaneDistance ******/
		/****** md5 signature: 1b66778eebf2d517f4e56d6118b4c625 ******/
		%feature("compactdefaultargs") SetViewPlaneDistance;
		%feature("autodoc", "
Parameters
----------
aViewPlaneDistance: double

Return
-------
None

Description
-----------
No available documentation.
") SetViewPlaneDistance;
		void SetViewPlaneDistance(const double aViewPlaneDistance);

		/****** StepVisual_ViewVolume::SetViewVolumeSidesClipping ******/
		/****** md5 signature: e3d49ec69afcea159f9bab92e0957bac ******/
		%feature("compactdefaultargs") SetViewVolumeSidesClipping;
		%feature("autodoc", "
Parameters
----------
aViewVolumeSidesClipping: bool

Return
-------
None

Description
-----------
No available documentation.
") SetViewVolumeSidesClipping;
		void SetViewVolumeSidesClipping(const bool aViewVolumeSidesClipping);

		/****** StepVisual_ViewVolume::SetViewWindow ******/
		/****** md5 signature: 136a748355c9fefae97d375748f65d19 ******/
		%feature("compactdefaultargs") SetViewWindow;
		%feature("autodoc", "
Parameters
----------
aViewWindow: StepVisual_PlanarBox

Return
-------
None

Description
-----------
No available documentation.
") SetViewWindow;
		void SetViewWindow(const opencascade::handle<StepVisual_PlanarBox> & aViewWindow);

		/****** StepVisual_ViewVolume::ViewPlaneDistance ******/
		/****** md5 signature: 89aa4913cc7360e0847355b749bebfc2 ******/
		%feature("compactdefaultargs") ViewPlaneDistance;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") ViewPlaneDistance;
		double ViewPlaneDistance();

		/****** StepVisual_ViewVolume::ViewVolumeSidesClipping ******/
		/****** md5 signature: 5825f49939988390cbd0bdf944e0f92a ******/
		%feature("compactdefaultargs") ViewVolumeSidesClipping;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") ViewVolumeSidesClipping;
		bool ViewVolumeSidesClipping();

		/****** StepVisual_ViewVolume::ViewWindow ******/
		/****** md5 signature: 725cc0912678c398b3fece353204acfc ******/
		%feature("compactdefaultargs") ViewWindow;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_PlanarBox>

Description
-----------
No available documentation.
") ViewWindow;
		opencascade::handle<StepVisual_PlanarBox> ViewWindow();

};


%make_alias(StepVisual_ViewVolume)

%extend StepVisual_ViewVolume {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class StepVisual_AnnotationOccurrence *
****************************************/
class StepVisual_AnnotationOccurrence : public StepVisual_StyledItem {
	public:
		/****** StepVisual_AnnotationOccurrence::StepVisual_AnnotationOccurrence ******/
		/****** md5 signature: 1170a3a1953a137ef5dea4fee59f9067 ******/
		%feature("compactdefaultargs") StepVisual_AnnotationOccurrence;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a AnnotationOccurrence.
") StepVisual_AnnotationOccurrence;
		 StepVisual_AnnotationOccurrence();

};


%make_alias(StepVisual_AnnotationOccurrence)

%extend StepVisual_AnnotationOccurrence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class StepVisual_BackgroundColour *
************************************/
class StepVisual_BackgroundColour : public StepVisual_Colour {
	public:
		/****** StepVisual_BackgroundColour::StepVisual_BackgroundColour ******/
		/****** md5 signature: 127c1c50d44bca9a3548d62ac975d8cb ******/
		%feature("compactdefaultargs") StepVisual_BackgroundColour;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a BackgroundColour.
") StepVisual_BackgroundColour;
		 StepVisual_BackgroundColour();

		/****** StepVisual_BackgroundColour::Init ******/
		/****** md5 signature: 028fc5afe2ca9ac48a52f2c46f5726d2 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aPresentation: StepVisual_AreaOrView

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const StepVisual_AreaOrView & aPresentation);

		/****** StepVisual_BackgroundColour::Presentation ******/
		/****** md5 signature: 876aa9ba539473d78fc21599f42ecd29 ******/
		%feature("compactdefaultargs") Presentation;
		%feature("autodoc", "Return
-------
StepVisual_AreaOrView

Description
-----------
No available documentation.
") Presentation;
		StepVisual_AreaOrView Presentation();

		/****** StepVisual_BackgroundColour::SetPresentation ******/
		/****** md5 signature: fc429b3902dffd59d732a58ca794ca03 ******/
		%feature("compactdefaultargs") SetPresentation;
		%feature("autodoc", "
Parameters
----------
aPresentation: StepVisual_AreaOrView

Return
-------
None

Description
-----------
No available documentation.
") SetPresentation;
		void SetPresentation(const StepVisual_AreaOrView & aPresentation);

};


%make_alias(StepVisual_BackgroundColour)

%extend StepVisual_BackgroundColour {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class StepVisual_CameraImage2dWithScale *
******************************************/
class StepVisual_CameraImage2dWithScale : public StepVisual_CameraImage {
	public:
		/****** StepVisual_CameraImage2dWithScale::StepVisual_CameraImage2dWithScale ******/
		/****** md5 signature: 726c3e77e36a5065625ac3580cd81324 ******/
		%feature("compactdefaultargs") StepVisual_CameraImage2dWithScale;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepVisual_CameraImage2dWithScale;
		 StepVisual_CameraImage2dWithScale();

};


%make_alias(StepVisual_CameraImage2dWithScale)

%extend StepVisual_CameraImage2dWithScale {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class StepVisual_CameraImage3dWithScale *
******************************************/
class StepVisual_CameraImage3dWithScale : public StepVisual_CameraImage {
	public:
		/****** StepVisual_CameraImage3dWithScale::StepVisual_CameraImage3dWithScale ******/
		/****** md5 signature: 004c8ecc1fe1a13431b5476203c6e7ca ******/
		%feature("compactdefaultargs") StepVisual_CameraImage3dWithScale;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepVisual_CameraImage3dWithScale;
		 StepVisual_CameraImage3dWithScale();

};


%make_alias(StepVisual_CameraImage3dWithScale)

%extend StepVisual_CameraImage3dWithScale {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class StepVisual_CameraModelD2 *
*********************************/
class StepVisual_CameraModelD2 : public StepVisual_CameraModel {
	public:
		/****** StepVisual_CameraModelD2::StepVisual_CameraModelD2 ******/
		/****** md5 signature: 748a8eaaea8afa45672846794d81c253 ******/
		%feature("compactdefaultargs") StepVisual_CameraModelD2;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a CameraModelD2.
") StepVisual_CameraModelD2;
		 StepVisual_CameraModelD2();

		/****** StepVisual_CameraModelD2::Init ******/
		/****** md5 signature: f18380dfe5832e409fff1e1f5d15d1ed ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aViewWindow: StepVisual_PlanarBox
aViewWindowClipping: bool

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepVisual_PlanarBox> & aViewWindow, const bool aViewWindowClipping);

		/****** StepVisual_CameraModelD2::SetViewWindow ******/
		/****** md5 signature: 136a748355c9fefae97d375748f65d19 ******/
		%feature("compactdefaultargs") SetViewWindow;
		%feature("autodoc", "
Parameters
----------
aViewWindow: StepVisual_PlanarBox

Return
-------
None

Description
-----------
No available documentation.
") SetViewWindow;
		void SetViewWindow(const opencascade::handle<StepVisual_PlanarBox> & aViewWindow);

		/****** StepVisual_CameraModelD2::SetViewWindowClipping ******/
		/****** md5 signature: 166227600b619a404b954286a3d17309 ******/
		%feature("compactdefaultargs") SetViewWindowClipping;
		%feature("autodoc", "
Parameters
----------
aViewWindowClipping: bool

Return
-------
None

Description
-----------
No available documentation.
") SetViewWindowClipping;
		void SetViewWindowClipping(const bool aViewWindowClipping);

		/****** StepVisual_CameraModelD2::ViewWindow ******/
		/****** md5 signature: 725cc0912678c398b3fece353204acfc ******/
		%feature("compactdefaultargs") ViewWindow;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_PlanarBox>

Description
-----------
No available documentation.
") ViewWindow;
		opencascade::handle<StepVisual_PlanarBox> ViewWindow();

		/****** StepVisual_CameraModelD2::ViewWindowClipping ******/
		/****** md5 signature: 0894495f9d462977d3b1d4a75a290da3 ******/
		%feature("compactdefaultargs") ViewWindowClipping;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") ViewWindowClipping;
		bool ViewWindowClipping();

};


%make_alias(StepVisual_CameraModelD2)

%extend StepVisual_CameraModelD2 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class StepVisual_CameraModelD3 *
*********************************/
class StepVisual_CameraModelD3 : public StepVisual_CameraModel {
	public:
		/****** StepVisual_CameraModelD3::StepVisual_CameraModelD3 ******/
		/****** md5 signature: 841a26e60795284278f7070e4fb49a07 ******/
		%feature("compactdefaultargs") StepVisual_CameraModelD3;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a CameraModelD3.
") StepVisual_CameraModelD3;
		 StepVisual_CameraModelD3();

		/****** StepVisual_CameraModelD3::Init ******/
		/****** md5 signature: 2798b9bfb91180a5b3eeffa7cc122059 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aViewReferenceSystem: StepGeom_Axis2Placement3d
aPerspectiveOfVolume: StepVisual_ViewVolume

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepGeom_Axis2Placement3d> & aViewReferenceSystem, const opencascade::handle<StepVisual_ViewVolume> & aPerspectiveOfVolume);

		/****** StepVisual_CameraModelD3::PerspectiveOfVolume ******/
		/****** md5 signature: b9367179fea54fd5444ea2ba436b49b3 ******/
		%feature("compactdefaultargs") PerspectiveOfVolume;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_ViewVolume>

Description
-----------
No available documentation.
") PerspectiveOfVolume;
		opencascade::handle<StepVisual_ViewVolume> PerspectiveOfVolume();

		/****** StepVisual_CameraModelD3::SetPerspectiveOfVolume ******/
		/****** md5 signature: ac3a2531e6d2a743285ffcc4f0285f55 ******/
		%feature("compactdefaultargs") SetPerspectiveOfVolume;
		%feature("autodoc", "
Parameters
----------
aPerspectiveOfVolume: StepVisual_ViewVolume

Return
-------
None

Description
-----------
No available documentation.
") SetPerspectiveOfVolume;
		void SetPerspectiveOfVolume(const opencascade::handle<StepVisual_ViewVolume> & aPerspectiveOfVolume);

		/****** StepVisual_CameraModelD3::SetViewReferenceSystem ******/
		/****** md5 signature: d6fd6fa5b899d15394116f9e86b70115 ******/
		%feature("compactdefaultargs") SetViewReferenceSystem;
		%feature("autodoc", "
Parameters
----------
aViewReferenceSystem: StepGeom_Axis2Placement3d

Return
-------
None

Description
-----------
No available documentation.
") SetViewReferenceSystem;
		void SetViewReferenceSystem(const opencascade::handle<StepGeom_Axis2Placement3d> & aViewReferenceSystem);

		/****** StepVisual_CameraModelD3::ViewReferenceSystem ******/
		/****** md5 signature: 84d34fde6fa2bd63ba5c975b6201f63c ******/
		%feature("compactdefaultargs") ViewReferenceSystem;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Axis2Placement3d>

Description
-----------
No available documentation.
") ViewReferenceSystem;
		opencascade::handle<StepGeom_Axis2Placement3d> ViewReferenceSystem();

};


%make_alias(StepVisual_CameraModelD3)

%extend StepVisual_CameraModelD3 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************************************
* class StepVisual_CharacterizedObjAndRepresentationAndDraughtingModel *
***********************************************************************/
class StepVisual_CharacterizedObjAndRepresentationAndDraughtingModel : public StepVisual_DraughtingModel {
	public:
		/****** StepVisual_CharacterizedObjAndRepresentationAndDraughtingModel::StepVisual_CharacterizedObjAndRepresentationAndDraughtingModel ******/
		/****** md5 signature: 34cb562d413a95c3a37b9fcbd2461f78 ******/
		%feature("compactdefaultargs") StepVisual_CharacterizedObjAndRepresentationAndDraughtingModel;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepVisual_CharacterizedObjAndRepresentationAndDraughtingModel;
		 StepVisual_CharacterizedObjAndRepresentationAndDraughtingModel();

};


%make_alias(StepVisual_CharacterizedObjAndRepresentationAndDraughtingModel)

%extend StepVisual_CharacterizedObjAndRepresentationAndDraughtingModel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class StepVisual_ColourSpecification *
***************************************/
class StepVisual_ColourSpecification : public StepVisual_Colour {
	public:
		/****** StepVisual_ColourSpecification::StepVisual_ColourSpecification ******/
		/****** md5 signature: cfd4e535b8138ca08665d921957c0090 ******/
		%feature("compactdefaultargs") StepVisual_ColourSpecification;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a ColourSpecification.
") StepVisual_ColourSpecification;
		 StepVisual_ColourSpecification();

		/****** StepVisual_ColourSpecification::Init ******/
		/****** md5 signature: e10f4ffe4365262d2d9a5484d96325b8 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName);

		/****** StepVisual_ColourSpecification::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepVisual_ColourSpecification::SetName ******/
		/****** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & aName);

};


%make_alias(StepVisual_ColourSpecification)

%extend StepVisual_ColourSpecification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class StepVisual_CompositeTextWithExtent *
*******************************************/
class StepVisual_CompositeTextWithExtent : public StepVisual_CompositeText {
	public:
		/****** StepVisual_CompositeTextWithExtent::StepVisual_CompositeTextWithExtent ******/
		/****** md5 signature: db03fa0030cb7ff09731453861cbf670 ******/
		%feature("compactdefaultargs") StepVisual_CompositeTextWithExtent;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a CompositeTextWithExtent.
") StepVisual_CompositeTextWithExtent;
		 StepVisual_CompositeTextWithExtent();

		/****** StepVisual_CompositeTextWithExtent::Extent ******/
		/****** md5 signature: 5734b609e25d7e110c6c219f167f280a ******/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_PlanarExtent>

Description
-----------
No available documentation.
") Extent;
		opencascade::handle<StepVisual_PlanarExtent> Extent();

		/****** StepVisual_CompositeTextWithExtent::Init ******/
		/****** md5 signature: c2ad472b89d685f219e285a304744e77 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aCollectedText: NCollection_HArray1<StepVisual_TextOrCharacter
aExtent: StepVisual_PlanarExtent

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<NCollection_HArray1<StepVisual_TextOrCharacter>> & aCollectedText, const opencascade::handle<StepVisual_PlanarExtent> & aExtent);

		/****** StepVisual_CompositeTextWithExtent::SetExtent ******/
		/****** md5 signature: 32a808f68d4795ac572a482545c43c81 ******/
		%feature("compactdefaultargs") SetExtent;
		%feature("autodoc", "
Parameters
----------
aExtent: StepVisual_PlanarExtent

Return
-------
None

Description
-----------
No available documentation.
") SetExtent;
		void SetExtent(const opencascade::handle<StepVisual_PlanarExtent> & aExtent);

};


%make_alias(StepVisual_CompositeTextWithExtent)

%extend StepVisual_CompositeTextWithExtent {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class StepVisual_ContextDependentInvisibility *
************************************************/
class StepVisual_ContextDependentInvisibility : public StepVisual_Invisibility {
	public:
		/****** StepVisual_ContextDependentInvisibility::StepVisual_ContextDependentInvisibility ******/
		/****** md5 signature: 45f5662915ecc05f35fc8f5c289ace90 ******/
		%feature("compactdefaultargs") StepVisual_ContextDependentInvisibility;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a ContextDependentInvisibility.
") StepVisual_ContextDependentInvisibility;
		 StepVisual_ContextDependentInvisibility();

		/****** StepVisual_ContextDependentInvisibility::Init ******/
		/****** md5 signature: b2a660ab6dfefd138eecba3d6fb0dc0d ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aInvisibleItems: NCollection_HArray1<StepVisual_InvisibleItem
aPresentationContext: StepVisual_InvisibilityContext

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<NCollection_HArray1<StepVisual_InvisibleItem>> & aInvisibleItems, const StepVisual_InvisibilityContext & aPresentationContext);

		/****** StepVisual_ContextDependentInvisibility::PresentationContext ******/
		/****** md5 signature: 65ec5e64ff0da9a7fc1f18ae60091180 ******/
		%feature("compactdefaultargs") PresentationContext;
		%feature("autodoc", "Return
-------
StepVisual_InvisibilityContext

Description
-----------
No available documentation.
") PresentationContext;
		StepVisual_InvisibilityContext PresentationContext();

		/****** StepVisual_ContextDependentInvisibility::SetPresentationContext ******/
		/****** md5 signature: 7a127d727fe8b71a0200708dd5afc50e ******/
		%feature("compactdefaultargs") SetPresentationContext;
		%feature("autodoc", "
Parameters
----------
aPresentationContext: StepVisual_InvisibilityContext

Return
-------
None

Description
-----------
No available documentation.
") SetPresentationContext;
		void SetPresentationContext(const StepVisual_InvisibilityContext & aPresentationContext);

};


%make_alias(StepVisual_ContextDependentInvisibility)

%extend StepVisual_ContextDependentInvisibility {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class StepVisual_CoordinatesList *
***********************************/
class StepVisual_CoordinatesList : public StepVisual_TessellatedItem {
	public:
		/****** StepVisual_CoordinatesList::StepVisual_CoordinatesList ******/
		/****** md5 signature: 9dc6281a340d089c274d050bc3736846 ******/
		%feature("compactdefaultargs") StepVisual_CoordinatesList;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a coordinate list.
") StepVisual_CoordinatesList;
		 StepVisual_CoordinatesList();

		/****** StepVisual_CoordinatesList::Init ******/
		/****** md5 signature: 31ed61d1c8b2b6b610787bc962553763 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
thePoints: TColgp_HArray1OfXYZ

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TColgp_HArray1OfXYZ> & thePoints);

		/****** StepVisual_CoordinatesList::Points ******/
		/****** md5 signature: c1f589bfa1d6a4cc209d379075fd518a ******/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Return
-------
opencascade::handle<TColgp_HArray1OfXYZ>

Description
-----------
No available documentation.
") Points;
		opencascade::handle<TColgp_HArray1OfXYZ> Points();

};


%make_alias(StepVisual_CoordinatesList)

%extend StepVisual_CoordinatesList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************************************
* class StepVisual_MechanicalDesignGeometricPresentationRepresentation *
***********************************************************************/
class StepVisual_MechanicalDesignGeometricPresentationRepresentation : public StepVisual_PresentationRepresentation {
	public:
		/****** StepVisual_MechanicalDesignGeometricPresentationRepresentation::StepVisual_MechanicalDesignGeometricPresentationRepresentation ******/
		/****** md5 signature: 0b5887ccf6d8da9641b7e6cf35e54902 ******/
		%feature("compactdefaultargs") StepVisual_MechanicalDesignGeometricPresentationRepresentation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a MechanicalDesignGeometricPresentationRepresentation.
") StepVisual_MechanicalDesignGeometricPresentationRepresentation;
		 StepVisual_MechanicalDesignGeometricPresentationRepresentation();

};


%make_alias(StepVisual_MechanicalDesignGeometricPresentationRepresentation)

%extend StepVisual_MechanicalDesignGeometricPresentationRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class StepVisual_OverRidingStyledItem *
****************************************/
class StepVisual_OverRidingStyledItem : public StepVisual_StyledItem {
	public:
		/****** StepVisual_OverRidingStyledItem::StepVisual_OverRidingStyledItem ******/
		/****** md5 signature: 7dd9409c2a297555a1e543763e6677bd ******/
		%feature("compactdefaultargs") StepVisual_OverRidingStyledItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a OverRidingStyledItem.
") StepVisual_OverRidingStyledItem;
		 StepVisual_OverRidingStyledItem();

		/****** StepVisual_OverRidingStyledItem::Init ******/
		/****** md5 signature: e010bfe9676cd618d97fcda48382c7e5 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aStyles: NCollection_HArray1<
aItem: Standard_Transient
aOverRiddenStyle: StepVisual_StyledItem

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<NCollection_HArray1<opencascade::handle<StepVisual_PresentationStyleAssignment>> > & aStyles, const opencascade::handle<Standard_Transient> & aItem, const opencascade::handle<StepVisual_StyledItem> & aOverRiddenStyle);

		/****** StepVisual_OverRidingStyledItem::OverRiddenStyle ******/
		/****** md5 signature: 9e4e31e172072f2fc6a76eb75d8d429e ******/
		%feature("compactdefaultargs") OverRiddenStyle;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_StyledItem>

Description
-----------
No available documentation.
") OverRiddenStyle;
		opencascade::handle<StepVisual_StyledItem> OverRiddenStyle();

		/****** StepVisual_OverRidingStyledItem::SetOverRiddenStyle ******/
		/****** md5 signature: 87a251079ac6fcd30a33ec63df3ccc14 ******/
		%feature("compactdefaultargs") SetOverRiddenStyle;
		%feature("autodoc", "
Parameters
----------
aOverRiddenStyle: StepVisual_StyledItem

Return
-------
None

Description
-----------
No available documentation.
") SetOverRiddenStyle;
		void SetOverRiddenStyle(const opencascade::handle<StepVisual_StyledItem> & aOverRiddenStyle);

};


%make_alias(StepVisual_OverRidingStyledItem)

%extend StepVisual_OverRidingStyledItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class StepVisual_PlanarBox *
*****************************/
class StepVisual_PlanarBox : public StepVisual_PlanarExtent {
	public:
		/****** StepVisual_PlanarBox::StepVisual_PlanarBox ******/
		/****** md5 signature: 68e92f54bada54fb960bae2e9c369040 ******/
		%feature("compactdefaultargs") StepVisual_PlanarBox;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a PlanarBox.
") StepVisual_PlanarBox;
		 StepVisual_PlanarBox();

		/****** StepVisual_PlanarBox::Init ******/
		/****** md5 signature: 1fa90e5afbd9f09edfb82ff572fdc414 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aSizeInX: double
aSizeInY: double
aPlacement: StepGeom_Axis2Placement

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const double aSizeInX, const double aSizeInY, const StepGeom_Axis2Placement & aPlacement);

		/****** StepVisual_PlanarBox::Placement ******/
		/****** md5 signature: b66e16bd2b866237c0d300c709f8aafe ******/
		%feature("compactdefaultargs") Placement;
		%feature("autodoc", "Return
-------
StepGeom_Axis2Placement

Description
-----------
No available documentation.
") Placement;
		StepGeom_Axis2Placement Placement();

		/****** StepVisual_PlanarBox::SetPlacement ******/
		/****** md5 signature: ad02f5eccfb653be4766b095dfa772cf ******/
		%feature("compactdefaultargs") SetPlacement;
		%feature("autodoc", "
Parameters
----------
aPlacement: StepGeom_Axis2Placement

Return
-------
None

Description
-----------
No available documentation.
") SetPlacement;
		void SetPlacement(const StepGeom_Axis2Placement & aPlacement);

};


%make_alias(StepVisual_PlanarBox)

%extend StepVisual_PlanarBox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class StepVisual_PreDefinedColour *
************************************/
class StepVisual_PreDefinedColour : public StepVisual_Colour {
	public:
		/****** StepVisual_PreDefinedColour::StepVisual_PreDefinedColour ******/
		/****** md5 signature: 3eaf6ff7acb4014fa3bef2422b112da9 ******/
		%feature("compactdefaultargs") StepVisual_PreDefinedColour;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a PreDefinedColour.
") StepVisual_PreDefinedColour;
		 StepVisual_PreDefinedColour();

		/****** StepVisual_PreDefinedColour::GetPreDefinedItem ******/
		/****** md5 signature: 8168ba69b08169e3fcf91829c533909b ******/
		%feature("compactdefaultargs") GetPreDefinedItem;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_PreDefinedItem>

Description
-----------
return a pre_defined_item part.
") GetPreDefinedItem;
		const opencascade::handle<StepVisual_PreDefinedItem> & GetPreDefinedItem();

		/****** StepVisual_PreDefinedColour::SetPreDefinedItem ******/
		/****** md5 signature: e07d67f04ab79f1c391f23a8492f0e43 ******/
		%feature("compactdefaultargs") SetPreDefinedItem;
		%feature("autodoc", "
Parameters
----------
item: StepVisual_PreDefinedItem

Return
-------
None

Description
-----------
set a pre_defined_item part.
") SetPreDefinedItem;
		void SetPreDefinedItem(const opencascade::handle<StepVisual_PreDefinedItem> & item);

};


%make_alias(StepVisual_PreDefinedColour)

%extend StepVisual_PreDefinedColour {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class StepVisual_PreDefinedCurveFont *
***************************************/
class StepVisual_PreDefinedCurveFont : public StepVisual_PreDefinedItem {
	public:
		/****** StepVisual_PreDefinedCurveFont::StepVisual_PreDefinedCurveFont ******/
		/****** md5 signature: b71ff5a52d42a060eb5ac7f7e17b497a ******/
		%feature("compactdefaultargs") StepVisual_PreDefinedCurveFont;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a PreDefinedCurveFont.
") StepVisual_PreDefinedCurveFont;
		 StepVisual_PreDefinedCurveFont();

};


%make_alias(StepVisual_PreDefinedCurveFont)

%extend StepVisual_PreDefinedCurveFont {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class StepVisual_PreDefinedTextFont *
**************************************/
class StepVisual_PreDefinedTextFont : public StepVisual_PreDefinedItem {
	public:
		/****** StepVisual_PreDefinedTextFont::StepVisual_PreDefinedTextFont ******/
		/****** md5 signature: a56b777441f816f59ef852bfda0df1f2 ******/
		%feature("compactdefaultargs") StepVisual_PreDefinedTextFont;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a PreDefinedTextFont.
") StepVisual_PreDefinedTextFont;
		 StepVisual_PreDefinedTextFont();

};


%make_alias(StepVisual_PreDefinedTextFont)

%extend StepVisual_PreDefinedTextFont {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class StepVisual_PresentationArea *
************************************/
class StepVisual_PresentationArea : public StepVisual_PresentationRepresentation {
	public:
		/****** StepVisual_PresentationArea::StepVisual_PresentationArea ******/
		/****** md5 signature: f25b7b06e7dcd02c22874e12e667096a ******/
		%feature("compactdefaultargs") StepVisual_PresentationArea;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a PresentationArea.
") StepVisual_PresentationArea;
		 StepVisual_PresentationArea();

};


%make_alias(StepVisual_PresentationArea)

%extend StepVisual_PresentationArea {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class StepVisual_PresentationStyleByContext *
**********************************************/
class StepVisual_PresentationStyleByContext : public StepVisual_PresentationStyleAssignment {
	public:
		/****** StepVisual_PresentationStyleByContext::StepVisual_PresentationStyleByContext ******/
		/****** md5 signature: 8723347e6438d18d40948248ea8eeaf5 ******/
		%feature("compactdefaultargs") StepVisual_PresentationStyleByContext;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a PresentationStyleByContext.
") StepVisual_PresentationStyleByContext;
		 StepVisual_PresentationStyleByContext();

		/****** StepVisual_PresentationStyleByContext::Init ******/
		/****** md5 signature: 24cd4cfff9f7d45ec6f2c55cf204ea93 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aStyles: NCollection_HArray1<StepVisual_PresentationStyleSelect
aStyleContext: StepVisual_StyleContextSelect

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<NCollection_HArray1<StepVisual_PresentationStyleSelect>> & aStyles, const StepVisual_StyleContextSelect & aStyleContext);

		/****** StepVisual_PresentationStyleByContext::SetStyleContext ******/
		/****** md5 signature: 8d8197c8c77f7080eddfc3b83e7ca162 ******/
		%feature("compactdefaultargs") SetStyleContext;
		%feature("autodoc", "
Parameters
----------
aStyleContext: StepVisual_StyleContextSelect

Return
-------
None

Description
-----------
No available documentation.
") SetStyleContext;
		void SetStyleContext(const StepVisual_StyleContextSelect & aStyleContext);

		/****** StepVisual_PresentationStyleByContext::StyleContext ******/
		/****** md5 signature: 25291206e3f2bf69a0fcbe1bb1c73a1a ******/
		%feature("compactdefaultargs") StyleContext;
		%feature("autodoc", "Return
-------
StepVisual_StyleContextSelect

Description
-----------
No available documentation.
") StyleContext;
		StepVisual_StyleContextSelect StyleContext();

};


%make_alias(StepVisual_PresentationStyleByContext)

%extend StepVisual_PresentationStyleByContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class StepVisual_PresentationView *
************************************/
class StepVisual_PresentationView : public StepVisual_PresentationRepresentation {
	public:
		/****** StepVisual_PresentationView::StepVisual_PresentationView ******/
		/****** md5 signature: 6f4c49378d10171f5b788e0040623706 ******/
		%feature("compactdefaultargs") StepVisual_PresentationView;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a PresentationView.
") StepVisual_PresentationView;
		 StepVisual_PresentationView();

};


%make_alias(StepVisual_PresentationView)

%extend StepVisual_PresentationView {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class StepVisual_RepositionedTessellatedItem *
***********************************************/
class StepVisual_RepositionedTessellatedItem : public StepVisual_TessellatedItem {
	public:
		/****** StepVisual_RepositionedTessellatedItem::StepVisual_RepositionedTessellatedItem ******/
		/****** md5 signature: 8828630e63b33355a5d8f1af7489fbb2 ******/
		%feature("compactdefaultargs") StepVisual_RepositionedTessellatedItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default constructor.
") StepVisual_RepositionedTessellatedItem;
		 StepVisual_RepositionedTessellatedItem();

		/****** StepVisual_RepositionedTessellatedItem::Init ******/
		/****** md5 signature: fec1dcd27f9472f38ca79eda9f6136f6 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theLocation: StepGeom_Axis2Placement3d

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<StepGeom_Axis2Placement3d> & theLocation);

		/****** StepVisual_RepositionedTessellatedItem::Location ******/
		/****** md5 signature: 39fc6625e849c305cb623a87ef9754a6 ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Axis2Placement3d>

Description
-----------
Returns location.
") Location;
		opencascade::handle<StepGeom_Axis2Placement3d> Location();

		/****** StepVisual_RepositionedTessellatedItem::SetLocation ******/
		/****** md5 signature: 447f5a9e9fa630b823c1544b8c75af39 ******/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "
Parameters
----------
theLocation: StepGeom_Axis2Placement3d

Return
-------
None

Description
-----------
Sets location.
") SetLocation;
		void SetLocation(const opencascade::handle<StepGeom_Axis2Placement3d> & theLocation);

};


%make_alias(StepVisual_RepositionedTessellatedItem)

%extend StepVisual_RepositionedTessellatedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************************
* class StepVisual_SurfaceStyleReflectanceAmbientDiffuse *
*********************************************************/
class StepVisual_SurfaceStyleReflectanceAmbientDiffuse : public StepVisual_SurfaceStyleReflectanceAmbient {
	public:
		/****** StepVisual_SurfaceStyleReflectanceAmbientDiffuse::StepVisual_SurfaceStyleReflectanceAmbientDiffuse ******/
		/****** md5 signature: 2970d5bc9080fb838b60bf8aabaa4ed7 ******/
		%feature("compactdefaultargs") StepVisual_SurfaceStyleReflectanceAmbientDiffuse;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepVisual_SurfaceStyleReflectanceAmbientDiffuse;
		 StepVisual_SurfaceStyleReflectanceAmbientDiffuse();

		/****** StepVisual_SurfaceStyleReflectanceAmbientDiffuse::DiffuseReflectance ******/
		/****** md5 signature: 85e9bf2b3bac947067c8949f010739fb ******/
		%feature("compactdefaultargs") DiffuseReflectance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field DiffuseReflectance.
") DiffuseReflectance;
		double DiffuseReflectance();

		/****** StepVisual_SurfaceStyleReflectanceAmbientDiffuse::Init ******/
		/****** md5 signature: f3171e6216aff3a8ebe52a1ef6e8a42e ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theAmbientReflectance: double
theDiffuseReflectance: double

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const double theAmbientReflectance, const double theDiffuseReflectance);

		/****** StepVisual_SurfaceStyleReflectanceAmbientDiffuse::SetDiffuseReflectance ******/
		/****** md5 signature: 944280b6485a4c1af7bc55b23f7bbc44 ******/
		%feature("compactdefaultargs") SetDiffuseReflectance;
		%feature("autodoc", "
Parameters
----------
theDiffuseReflectance: double

Return
-------
None

Description
-----------
Sets field DiffuseReflectance.
") SetDiffuseReflectance;
		void SetDiffuseReflectance(const double theDiffuseReflectance);

};


%make_alias(StepVisual_SurfaceStyleReflectanceAmbientDiffuse)

%extend StepVisual_SurfaceStyleReflectanceAmbientDiffuse {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************************
* class StepVisual_SurfaceStyleRenderingWithProperties *
*******************************************************/
class StepVisual_SurfaceStyleRenderingWithProperties : public StepVisual_SurfaceStyleRendering {
	public:
		/****** StepVisual_SurfaceStyleRenderingWithProperties::StepVisual_SurfaceStyleRenderingWithProperties ******/
		/****** md5 signature: 516dd2417e51a15b895ff90ed669ab7f ******/
		%feature("compactdefaultargs") StepVisual_SurfaceStyleRenderingWithProperties;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepVisual_SurfaceStyleRenderingWithProperties;
		 StepVisual_SurfaceStyleRenderingWithProperties();

		/****** StepVisual_SurfaceStyleRenderingWithProperties::Init ******/
		/****** md5 signature: 01f46d19ebbdc0450b837239f27b9f3b ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theSurfaceStyleRendering_RenderingMethod: StepVisual_ShadingSurfaceMethod
theSurfaceStyleRendering_SurfaceColour: StepVisual_Colour
theProperties: NCollection_HArray1<StepVisual_RenderingPropertiesSelect

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const StepVisual_ShadingSurfaceMethod theSurfaceStyleRendering_RenderingMethod, const opencascade::handle<StepVisual_Colour> & theSurfaceStyleRendering_SurfaceColour, const opencascade::handle<NCollection_HArray1<StepVisual_RenderingPropertiesSelect>> & theProperties);

		/****** StepVisual_SurfaceStyleRenderingWithProperties::Properties ******/
		/****** md5 signature: 6dee952cd20102ced01501b711c9993c ******/
		%feature("compactdefaultargs") Properties;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<StepVisual_RenderingPropertiesSelect>>

Description
-----------
Returns field Properties.
") Properties;
		opencascade::handle<NCollection_HArray1<StepVisual_RenderingPropertiesSelect>> Properties();

		/****** StepVisual_SurfaceStyleRenderingWithProperties::SetProperties ******/
		/****** md5 signature: bab066736f88ca2e01ab4428e3fe9519 ******/
		%feature("compactdefaultargs") SetProperties;
		%feature("autodoc", "
Parameters
----------
theProperties: NCollection_HArray1<StepVisual_RenderingPropertiesSelect

Return
-------
None

Description
-----------
Sets field Properties.
") SetProperties;
		void SetProperties(const opencascade::handle<NCollection_HArray1<StepVisual_RenderingPropertiesSelect>> & theProperties);

};


%make_alias(StepVisual_SurfaceStyleRenderingWithProperties)

%extend StepVisual_SurfaceStyleRenderingWithProperties {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class StepVisual_TessellatedAnnotationOccurrence *
***************************************************/
class StepVisual_TessellatedAnnotationOccurrence : public StepVisual_StyledItem {
	public:
		/****** StepVisual_TessellatedAnnotationOccurrence::StepVisual_TessellatedAnnotationOccurrence ******/
		/****** md5 signature: 566bb72dc881d4785a93b3b20af2e2b8 ******/
		%feature("compactdefaultargs") StepVisual_TessellatedAnnotationOccurrence;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a TesselatedAnnotationOccurrence.
") StepVisual_TessellatedAnnotationOccurrence;
		 StepVisual_TessellatedAnnotationOccurrence();

};


%make_alias(StepVisual_TessellatedAnnotationOccurrence)

%extend StepVisual_TessellatedAnnotationOccurrence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class StepVisual_TessellatedCurveSet *
***************************************/
class StepVisual_TessellatedCurveSet : public StepVisual_TessellatedItem {
	public:
		/****** StepVisual_TessellatedCurveSet::StepVisual_TessellatedCurveSet ******/
		/****** md5 signature: 50d6fc18928a7807cc81a9e796fd4b2d ******/
		%feature("compactdefaultargs") StepVisual_TessellatedCurveSet;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a DraughtingCalloutElement select type.
") StepVisual_TessellatedCurveSet;
		 StepVisual_TessellatedCurveSet();

		/****** StepVisual_TessellatedCurveSet::CoordList ******/
		/****** md5 signature: 19cacac91e98338b8bafd6e3f39c5847 ******/
		%feature("compactdefaultargs") CoordList;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_CoordinatesList>

Description
-----------
No available documentation.
") CoordList;
		opencascade::handle<StepVisual_CoordinatesList> CoordList();

		/****** StepVisual_TessellatedCurveSet::Curves ******/
		/****** md5 signature: 122b9fc297294661420a9dcf4d37dacd ******/
		%feature("compactdefaultargs") Curves;
		%feature("autodoc", "Return
-------
NCollection_Handle<NCollection_DynamicArray<opencascade::handle<TColStd_HSequenceOfInteger>>>

Description
-----------
No available documentation.
") Curves;
		NCollection_Handle<NCollection_DynamicArray<opencascade::handle<TColStd_HSequenceOfInteger>>> Curves();

		/****** StepVisual_TessellatedCurveSet::Init ******/
		/****** md5 signature: d46d1a510383f18ad2035b7ccb72db01 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theCoordList: StepVisual_CoordinatesList
theCurves: TColStd_HSequenceOfInteger

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<StepVisual_CoordinatesList> & theCoordList, const NCollection_Handle<NCollection_DynamicArray<opencascade::handle<TColStd_HSequenceOfInteger> >> & theCurves);

};


%make_alias(StepVisual_TessellatedCurveSet)

%extend StepVisual_TessellatedCurveSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class StepVisual_TessellatedGeometricSet *
*******************************************/
class StepVisual_TessellatedGeometricSet : public StepVisual_TessellatedItem {
	public:
		/****** StepVisual_TessellatedGeometricSet::StepVisual_TessellatedGeometricSet ******/
		/****** md5 signature: 7af095cc700150751133b93351473db4 ******/
		%feature("compactdefaultargs") StepVisual_TessellatedGeometricSet;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a DraughtingCalloutElement select type.
") StepVisual_TessellatedGeometricSet;
		 StepVisual_TessellatedGeometricSet();

		/****** StepVisual_TessellatedGeometricSet::Init ******/
		/****** md5 signature: e9815393ddfcdbf36937b3cd16ae9e06 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theItems: StepVisual_TessellatedItem

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const NCollection_Handle<NCollection_Array1<opencascade::handle<StepVisual_TessellatedItem>> > & theItems);

		/****** StepVisual_TessellatedGeometricSet::Items ******/
		/****** md5 signature: c9f82d2eee3184f24a2f6fecd668e8c1 ******/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Return
-------
NCollection_Handle<NCollection_Array1<opencascade::handle<StepVisual_TessellatedItem>>>

Description
-----------
No available documentation.
") Items;
		NCollection_Handle<NCollection_Array1<opencascade::handle<StepVisual_TessellatedItem>>> Items();

};


%make_alias(StepVisual_TessellatedGeometricSet)

%extend StepVisual_TessellatedGeometricSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class StepVisual_TessellatedPointSet *
***************************************/
class StepVisual_TessellatedPointSet : public StepVisual_TessellatedItem {
	public:
		/****** StepVisual_TessellatedPointSet::StepVisual_TessellatedPointSet ******/
		/****** md5 signature: 29668321e19925d6464b922eeb814f6b ******/
		%feature("compactdefaultargs") StepVisual_TessellatedPointSet;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepVisual_TessellatedPointSet;
		 StepVisual_TessellatedPointSet();

		/****** StepVisual_TessellatedPointSet::Coordinates ******/
		/****** md5 signature: ec74f7c30bc760bfadd8f8d2135f55c5 ******/
		%feature("compactdefaultargs") Coordinates;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_CoordinatesList>

Description
-----------
Returns field Coordinates.
") Coordinates;
		opencascade::handle<StepVisual_CoordinatesList> Coordinates();

		/****** StepVisual_TessellatedPointSet::Init ******/
		/****** md5 signature: ecca887104b9426419a024612ff6e9a1 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theCoordinates: StepVisual_CoordinatesList
thePointList: TColStd_HArray1OfInteger

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepVisual_CoordinatesList> & theCoordinates, const opencascade::handle<TColStd_HArray1OfInteger> & thePointList);

		/****** StepVisual_TessellatedPointSet::NbPointList ******/
		/****** md5 signature: 11ec15efaa7cd8148e356b260650d6fc ******/
		%feature("compactdefaultargs") NbPointList;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of PointList.
") NbPointList;
		int NbPointList();

		/****** StepVisual_TessellatedPointSet::PointList ******/
		/****** md5 signature: 29188045ee53e29bad5815922b5841d8 ******/
		%feature("compactdefaultargs") PointList;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfInteger>

Description
-----------
Returns field PointList.
") PointList;
		opencascade::handle<TColStd_HArray1OfInteger> PointList();

		/****** StepVisual_TessellatedPointSet::PointListValue ******/
		/****** md5 signature: aca25e2d4fb2a88826836835e4c03640 ******/
		%feature("compactdefaultargs") PointListValue;
		%feature("autodoc", "
Parameters
----------
theNum: int

Return
-------
int

Description
-----------
Returns value of PointList by its num.
") PointListValue;
		int PointListValue(const int theNum);

		/****** StepVisual_TessellatedPointSet::SetCoordinates ******/
		/****** md5 signature: 67496989a6887e140d96a4901bab43cb ******/
		%feature("compactdefaultargs") SetCoordinates;
		%feature("autodoc", "
Parameters
----------
theCoordinates: StepVisual_CoordinatesList

Return
-------
None

Description
-----------
Sets field Coordinates.
") SetCoordinates;
		void SetCoordinates(const opencascade::handle<StepVisual_CoordinatesList> & theCoordinates);

		/****** StepVisual_TessellatedPointSet::SetPointList ******/
		/****** md5 signature: 92e29f778d5a78f76fcd1e9e489bac02 ******/
		%feature("compactdefaultargs") SetPointList;
		%feature("autodoc", "
Parameters
----------
thePointList: TColStd_HArray1OfInteger

Return
-------
None

Description
-----------
Sets field PointList.
") SetPointList;
		void SetPointList(const opencascade::handle<TColStd_HArray1OfInteger> & thePointList);

};


%make_alias(StepVisual_TessellatedPointSet)

%extend StepVisual_TessellatedPointSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************************************
* class StepVisual_TessellatedShapeRepresentationWithAccuracyParameters *
************************************************************************/
class StepVisual_TessellatedShapeRepresentationWithAccuracyParameters : public StepVisual_TessellatedShapeRepresentation {
	public:
		/****** StepVisual_TessellatedShapeRepresentationWithAccuracyParameters::StepVisual_TessellatedShapeRepresentationWithAccuracyParameters ******/
		/****** md5 signature: 8d31d2795e9efe46808a5ff4f979903e ******/
		%feature("compactdefaultargs") StepVisual_TessellatedShapeRepresentationWithAccuracyParameters;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepVisual_TessellatedShapeRepresentationWithAccuracyParameters;
		 StepVisual_TessellatedShapeRepresentationWithAccuracyParameters();

		/****** StepVisual_TessellatedShapeRepresentationWithAccuracyParameters::Init ******/
		/****** md5 signature: 061d1400d8ff6b2affe830d162144318 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentation_Name: TCollection_HAsciiString
theRepresentation_Items: NCollection_HArray1<
theRepresentation_ContextOfItems: StepRepr_RepresentationContext
theTessellationAccuracyParameters: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentation_Name, const opencascade::handle<NCollection_HArray1<opencascade::handle<StepRepr_RepresentationItem>> > & theRepresentation_Items, const opencascade::handle<StepRepr_RepresentationContext> & theRepresentation_ContextOfItems, const opencascade::handle<TColStd_HArray1OfReal> & theTessellationAccuracyParameters);

		/****** StepVisual_TessellatedShapeRepresentationWithAccuracyParameters::NbTessellationAccuracyParameters ******/
		/****** md5 signature: 0c06bd4a5f2d56aaf60057c743a036f3 ******/
		%feature("compactdefaultargs") NbTessellationAccuracyParameters;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of TessellationAccuracyParameters.
") NbTessellationAccuracyParameters;
		int NbTessellationAccuracyParameters();

		/****** StepVisual_TessellatedShapeRepresentationWithAccuracyParameters::SetTessellationAccuracyParameters ******/
		/****** md5 signature: 6cc286a8bf081919579933099436b22d ******/
		%feature("compactdefaultargs") SetTessellationAccuracyParameters;
		%feature("autodoc", "
Parameters
----------
theTessellationAccuracyParameters: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
Sets field TessellationAccuracyParameters.
") SetTessellationAccuracyParameters;
		void SetTessellationAccuracyParameters(const opencascade::handle<TColStd_HArray1OfReal> & theTessellationAccuracyParameters);

		/****** StepVisual_TessellatedShapeRepresentationWithAccuracyParameters::TessellationAccuracyParameters ******/
		/****** md5 signature: c26a6c53a986e2cc5603069cead08d27 ******/
		%feature("compactdefaultargs") TessellationAccuracyParameters;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
Returns field TessellationAccuracyParameters.
") TessellationAccuracyParameters;
		opencascade::handle<TColStd_HArray1OfReal> TessellationAccuracyParameters();

		/****** StepVisual_TessellatedShapeRepresentationWithAccuracyParameters::TessellationAccuracyParametersValue ******/
		/****** md5 signature: f013cf678c770328315cf7c32a22d525 ******/
		%feature("compactdefaultargs") TessellationAccuracyParametersValue;
		%feature("autodoc", "
Parameters
----------
theNum: int

Return
-------
double

Description
-----------
Returns value of TessellationAccuracyParameters by its num.
") TessellationAccuracyParametersValue;
		const double & TessellationAccuracyParametersValue(const int theNum);

};


%make_alias(StepVisual_TessellatedShapeRepresentationWithAccuracyParameters)

%extend StepVisual_TessellatedShapeRepresentationWithAccuracyParameters {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class StepVisual_TessellatedShell *
************************************/
class StepVisual_TessellatedShell : public StepVisual_TessellatedItem {
	public:
		/****** StepVisual_TessellatedShell::StepVisual_TessellatedShell ******/
		/****** md5 signature: e90fe8078037e06c5ed69faea6f97b05 ******/
		%feature("compactdefaultargs") StepVisual_TessellatedShell;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepVisual_TessellatedShell;
		 StepVisual_TessellatedShell();

		/****** StepVisual_TessellatedShell::HasTopologicalLink ******/
		/****** md5 signature: f4cbb5d53bb67ed635ad7c9628c33302 ******/
		%feature("compactdefaultargs") HasTopologicalLink;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field TopologicalLink is defined.
") HasTopologicalLink;
		bool HasTopologicalLink();

		/****** StepVisual_TessellatedShell::Init ******/
		/****** md5 signature: 26ea0e083e274e328df5d814390f1cc6 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theItems: NCollection_HArray1<
theHasTopologicalLink: bool
theTopologicalLink: StepShape_ConnectedFaceSet

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<NCollection_HArray1<opencascade::handle<StepVisual_TessellatedStructuredItem>> > & theItems, const bool theHasTopologicalLink, const opencascade::handle<StepShape_ConnectedFaceSet> & theTopologicalLink);

		/****** StepVisual_TessellatedShell::Items ******/
		/****** md5 signature: 551618fff81588d330a54ff6d6cd1b68 ******/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<opencascade::handle<StepVisual_TessellatedStructuredItem>>>

Description
-----------
Returns field Items.
") Items;
		opencascade::handle<NCollection_HArray1<opencascade::handle<StepVisual_TessellatedStructuredItem>>> Items();

		/****** StepVisual_TessellatedShell::ItemsValue ******/
		/****** md5 signature: 4f24dcab8edfab0529a974fad70d8be2 ******/
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "
Parameters
----------
theNum: int

Return
-------
opencascade::handle<StepVisual_TessellatedStructuredItem>

Description
-----------
Returns value of Items by its num.
") ItemsValue;
		opencascade::handle<StepVisual_TessellatedStructuredItem> ItemsValue(const int theNum);

		/****** StepVisual_TessellatedShell::NbItems ******/
		/****** md5 signature: 2b529efc4e5d8a11084d3f577abfb55b ******/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of Items.
") NbItems;
		int NbItems();

		/****** StepVisual_TessellatedShell::SetItems ******/
		/****** md5 signature: 17aaa75e212a969a1b4171af00f478f1 ******/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "
Parameters
----------
theItems: NCollection_HArray1<

Return
-------
None

Description
-----------
Sets field Items.
") SetItems;
		void SetItems(const opencascade::handle<NCollection_HArray1<opencascade::handle<StepVisual_TessellatedStructuredItem>> > & theItems);

		/****** StepVisual_TessellatedShell::SetTopologicalLink ******/
		/****** md5 signature: fb3583e7f62ff4dd76a0e4a084a80aa3 ******/
		%feature("compactdefaultargs") SetTopologicalLink;
		%feature("autodoc", "
Parameters
----------
theTopologicalLink: StepShape_ConnectedFaceSet

Return
-------
None

Description
-----------
Sets field TopologicalLink.
") SetTopologicalLink;
		void SetTopologicalLink(const opencascade::handle<StepShape_ConnectedFaceSet> & theTopologicalLink);

		/****** StepVisual_TessellatedShell::TopologicalLink ******/
		/****** md5 signature: 801b30fc0a5c8414172d7068a656fda1 ******/
		%feature("compactdefaultargs") TopologicalLink;
		%feature("autodoc", "Return
-------
opencascade::handle<StepShape_ConnectedFaceSet>

Description
-----------
Returns field TopologicalLink.
") TopologicalLink;
		opencascade::handle<StepShape_ConnectedFaceSet> TopologicalLink();

};


%make_alias(StepVisual_TessellatedShell)

%extend StepVisual_TessellatedShell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class StepVisual_TessellatedSolid *
************************************/
class StepVisual_TessellatedSolid : public StepVisual_TessellatedItem {
	public:
		/****** StepVisual_TessellatedSolid::StepVisual_TessellatedSolid ******/
		/****** md5 signature: 5de11e474867db0f613d06a9bc0d6d32 ******/
		%feature("compactdefaultargs") StepVisual_TessellatedSolid;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepVisual_TessellatedSolid;
		 StepVisual_TessellatedSolid();

		/****** StepVisual_TessellatedSolid::GeometricLink ******/
		/****** md5 signature: 60267230a72235c885cdd2f465aecc79 ******/
		%feature("compactdefaultargs") GeometricLink;
		%feature("autodoc", "Return
-------
opencascade::handle<StepShape_ManifoldSolidBrep>

Description
-----------
Returns field GeometricLink.
") GeometricLink;
		opencascade::handle<StepShape_ManifoldSolidBrep> GeometricLink();

		/****** StepVisual_TessellatedSolid::HasGeometricLink ******/
		/****** md5 signature: 7973d6dd6244b6e2282e3fd64891961e ******/
		%feature("compactdefaultargs") HasGeometricLink;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field GeometricLink is defined.
") HasGeometricLink;
		bool HasGeometricLink();

		/****** StepVisual_TessellatedSolid::Init ******/
		/****** md5 signature: 25c78955fd62fd7d4dd55b25d394ced0 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theItems: NCollection_HArray1<
theHasGeometricLink: bool
theGeometricLink: StepShape_ManifoldSolidBrep

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<NCollection_HArray1<opencascade::handle<StepVisual_TessellatedStructuredItem>> > & theItems, const bool theHasGeometricLink, const opencascade::handle<StepShape_ManifoldSolidBrep> & theGeometricLink);

		/****** StepVisual_TessellatedSolid::Items ******/
		/****** md5 signature: 551618fff81588d330a54ff6d6cd1b68 ******/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<opencascade::handle<StepVisual_TessellatedStructuredItem>>>

Description
-----------
Returns field Items.
") Items;
		opencascade::handle<NCollection_HArray1<opencascade::handle<StepVisual_TessellatedStructuredItem>>> Items();

		/****** StepVisual_TessellatedSolid::ItemsValue ******/
		/****** md5 signature: 4f24dcab8edfab0529a974fad70d8be2 ******/
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "
Parameters
----------
theNum: int

Return
-------
opencascade::handle<StepVisual_TessellatedStructuredItem>

Description
-----------
Returns value of Items by its num.
") ItemsValue;
		opencascade::handle<StepVisual_TessellatedStructuredItem> ItemsValue(const int theNum);

		/****** StepVisual_TessellatedSolid::NbItems ******/
		/****** md5 signature: 2b529efc4e5d8a11084d3f577abfb55b ******/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of Items.
") NbItems;
		int NbItems();

		/****** StepVisual_TessellatedSolid::SetGeometricLink ******/
		/****** md5 signature: a18372a243c7cd29aec2b1d7e7c35312 ******/
		%feature("compactdefaultargs") SetGeometricLink;
		%feature("autodoc", "
Parameters
----------
theGeometricLink: StepShape_ManifoldSolidBrep

Return
-------
None

Description
-----------
Sets field GeometricLink.
") SetGeometricLink;
		void SetGeometricLink(const opencascade::handle<StepShape_ManifoldSolidBrep> & theGeometricLink);

		/****** StepVisual_TessellatedSolid::SetItems ******/
		/****** md5 signature: 17aaa75e212a969a1b4171af00f478f1 ******/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "
Parameters
----------
theItems: NCollection_HArray1<

Return
-------
None

Description
-----------
Sets field Items.
") SetItems;
		void SetItems(const opencascade::handle<NCollection_HArray1<opencascade::handle<StepVisual_TessellatedStructuredItem>> > & theItems);

};


%make_alias(StepVisual_TessellatedSolid)

%extend StepVisual_TessellatedSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class StepVisual_TessellatedStructuredItem *
*********************************************/
class StepVisual_TessellatedStructuredItem : public StepVisual_TessellatedItem {
	public:
		/****** StepVisual_TessellatedStructuredItem::StepVisual_TessellatedStructuredItem ******/
		/****** md5 signature: bfc821ae9d0aa6e7e2b07422c03f372a ******/
		%feature("compactdefaultargs") StepVisual_TessellatedStructuredItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepVisual_TessellatedStructuredItem;
		 StepVisual_TessellatedStructuredItem();

};


%make_alias(StepVisual_TessellatedStructuredItem)

%extend StepVisual_TessellatedStructuredItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class StepVisual_TessellatedSurfaceSet *
*****************************************/
class StepVisual_TessellatedSurfaceSet : public StepVisual_TessellatedItem {
	public:
		/****** StepVisual_TessellatedSurfaceSet::StepVisual_TessellatedSurfaceSet ******/
		/****** md5 signature: 208193128639d4a8d7ee20a09fe98e9e ******/
		%feature("compactdefaultargs") StepVisual_TessellatedSurfaceSet;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepVisual_TessellatedSurfaceSet;
		 StepVisual_TessellatedSurfaceSet();

		/****** StepVisual_TessellatedSurfaceSet::Coordinates ******/
		/****** md5 signature: ec74f7c30bc760bfadd8f8d2135f55c5 ******/
		%feature("compactdefaultargs") Coordinates;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_CoordinatesList>

Description
-----------
Returns field Coordinates.
") Coordinates;
		opencascade::handle<StepVisual_CoordinatesList> Coordinates();

		/****** StepVisual_TessellatedSurfaceSet::Init ******/
		/****** md5 signature: cfb8e8d8406db36704a30ddab11bb5f0 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theCoordinates: StepVisual_CoordinatesList
thePnmax: int
theNormals: TColStd_HArray2OfReal

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepVisual_CoordinatesList> & theCoordinates, const int thePnmax, const opencascade::handle<TColStd_HArray2OfReal> & theNormals);

		/****** StepVisual_TessellatedSurfaceSet::NbNormals ******/
		/****** md5 signature: 70704d74c52f9f781807886fb702a9a0 ******/
		%feature("compactdefaultargs") NbNormals;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of Normals.
") NbNormals;
		int NbNormals();

		/****** StepVisual_TessellatedSurfaceSet::Normals ******/
		/****** md5 signature: 6e61cf49fb411fafdb848cd6d5537857 ******/
		%feature("compactdefaultargs") Normals;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray2OfReal>

Description
-----------
Returns field Normals.
") Normals;
		opencascade::handle<TColStd_HArray2OfReal> Normals();

		/****** StepVisual_TessellatedSurfaceSet::Pnmax ******/
		/****** md5 signature: f8c9f6434162140214befb9c86ad56a9 ******/
		%feature("compactdefaultargs") Pnmax;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns field Pnmax.
") Pnmax;
		int Pnmax();

		/****** StepVisual_TessellatedSurfaceSet::SetCoordinates ******/
		/****** md5 signature: 67496989a6887e140d96a4901bab43cb ******/
		%feature("compactdefaultargs") SetCoordinates;
		%feature("autodoc", "
Parameters
----------
theCoordinates: StepVisual_CoordinatesList

Return
-------
None

Description
-----------
Sets field Coordinates.
") SetCoordinates;
		void SetCoordinates(const opencascade::handle<StepVisual_CoordinatesList> & theCoordinates);

		/****** StepVisual_TessellatedSurfaceSet::SetNormals ******/
		/****** md5 signature: 842aa9edbe18cb9cfb26e7712adf84b0 ******/
		%feature("compactdefaultargs") SetNormals;
		%feature("autodoc", "
Parameters
----------
theNormals: TColStd_HArray2OfReal

Return
-------
None

Description
-----------
Sets field Normals.
") SetNormals;
		void SetNormals(const opencascade::handle<TColStd_HArray2OfReal> & theNormals);

		/****** StepVisual_TessellatedSurfaceSet::SetPnmax ******/
		/****** md5 signature: b8d9a8891a4a0dd68dc51880031eb888 ******/
		%feature("compactdefaultargs") SetPnmax;
		%feature("autodoc", "
Parameters
----------
thePnmax: int

Return
-------
None

Description
-----------
Sets field Pnmax.
") SetPnmax;
		void SetPnmax(const int thePnmax);

};


%make_alias(StepVisual_TessellatedSurfaceSet)

%extend StepVisual_TessellatedSurfaceSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class StepVisual_TessellatedWire *
***********************************/
class StepVisual_TessellatedWire : public StepVisual_TessellatedItem {
	public:
		/****** StepVisual_TessellatedWire::StepVisual_TessellatedWire ******/
		/****** md5 signature: 4e707fc69176a95bc70592bc29a6a978 ******/
		%feature("compactdefaultargs") StepVisual_TessellatedWire;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepVisual_TessellatedWire;
		 StepVisual_TessellatedWire();

		/****** StepVisual_TessellatedWire::GeometricModelLink ******/
		/****** md5 signature: e25a467067930f085f0ce317fa372caa ******/
		%feature("compactdefaultargs") GeometricModelLink;
		%feature("autodoc", "Return
-------
StepVisual_PathOrCompositeCurve

Description
-----------
Returns field GeometricModelLink.
") GeometricModelLink;
		StepVisual_PathOrCompositeCurve GeometricModelLink();

		/****** StepVisual_TessellatedWire::HasGeometricModelLink ******/
		/****** md5 signature: 4e8d9f715b2a870c05be9d9ecf3780cc ******/
		%feature("compactdefaultargs") HasGeometricModelLink;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field GeometricModelLink is defined.
") HasGeometricModelLink;
		bool HasGeometricModelLink();

		/****** StepVisual_TessellatedWire::Init ******/
		/****** md5 signature: 7386d8feb363cdca7e2ecc92d6d57e52 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theItems: NCollection_HArray1<StepVisual_TessellatedEdgeOrVertex
theHasGeometricModelLink: bool
theGeometricModelLink: StepVisual_PathOrCompositeCurve

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<NCollection_HArray1<StepVisual_TessellatedEdgeOrVertex>> & theItems, const bool theHasGeometricModelLink, const StepVisual_PathOrCompositeCurve & theGeometricModelLink);

		/****** StepVisual_TessellatedWire::Items ******/
		/****** md5 signature: 84b70a8d1be57b8bbfec3ca22dba7aed ******/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<StepVisual_TessellatedEdgeOrVertex>>

Description
-----------
Returns field Items.
") Items;
		opencascade::handle<NCollection_HArray1<StepVisual_TessellatedEdgeOrVertex>> Items();

		/****** StepVisual_TessellatedWire::ItemsValue ******/
		/****** md5 signature: ce669d7fe45e564adda3273db8d5b493 ******/
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "
Parameters
----------
theNum: int

Return
-------
StepVisual_TessellatedEdgeOrVertex

Description
-----------
Returns value of Items by its num.
") ItemsValue;
		const StepVisual_TessellatedEdgeOrVertex & ItemsValue(const int theNum);

		/****** StepVisual_TessellatedWire::NbItems ******/
		/****** md5 signature: 2b529efc4e5d8a11084d3f577abfb55b ******/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of Items.
") NbItems;
		int NbItems();

		/****** StepVisual_TessellatedWire::SetGeometricModelLink ******/
		/****** md5 signature: 3c1b193092fd68648e9fa59ae725fa94 ******/
		%feature("compactdefaultargs") SetGeometricModelLink;
		%feature("autodoc", "
Parameters
----------
theGeometricModelLink: StepVisual_PathOrCompositeCurve

Return
-------
None

Description
-----------
Sets field GeometricModelLink.
") SetGeometricModelLink;
		void SetGeometricModelLink(const StepVisual_PathOrCompositeCurve & theGeometricModelLink);

		/****** StepVisual_TessellatedWire::SetItems ******/
		/****** md5 signature: 021ba42fedbd6ed4a95eb4e872a2a34d ******/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "
Parameters
----------
theItems: NCollection_HArray1<StepVisual_TessellatedEdgeOrVertex

Return
-------
None

Description
-----------
Sets field Items.
") SetItems;
		void SetItems(const opencascade::handle<NCollection_HArray1<StepVisual_TessellatedEdgeOrVertex>> & theItems);

};


%make_alias(StepVisual_TessellatedWire)

%extend StepVisual_TessellatedWire {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class StepVisual_TextStyleWithBoxCharacteristics *
***************************************************/
class StepVisual_TextStyleWithBoxCharacteristics : public StepVisual_TextStyle {
	public:
		/****** StepVisual_TextStyleWithBoxCharacteristics::StepVisual_TextStyleWithBoxCharacteristics ******/
		/****** md5 signature: 38bf57fdf072dd4df45f8fd1b8b1bd18 ******/
		%feature("compactdefaultargs") StepVisual_TextStyleWithBoxCharacteristics;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a TextStyleWithBoxCharacteristics.
") StepVisual_TextStyleWithBoxCharacteristics;
		 StepVisual_TextStyleWithBoxCharacteristics();

		/****** StepVisual_TextStyleWithBoxCharacteristics::Characteristics ******/
		/****** md5 signature: ddbfb8c88952a08bb7b7ff036a441638 ******/
		%feature("compactdefaultargs") Characteristics;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<StepVisual_BoxCharacteristicSelect>>

Description
-----------
No available documentation.
") Characteristics;
		opencascade::handle<NCollection_HArray1<StepVisual_BoxCharacteristicSelect>> Characteristics();

		/****** StepVisual_TextStyleWithBoxCharacteristics::CharacteristicsValue ******/
		/****** md5 signature: a7291e286f02af25e55c04ec1a0eb9e6 ******/
		%feature("compactdefaultargs") CharacteristicsValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
StepVisual_BoxCharacteristicSelect

Description
-----------
No available documentation.
") CharacteristicsValue;
		StepVisual_BoxCharacteristicSelect CharacteristicsValue(const int num);

		/****** StepVisual_TextStyleWithBoxCharacteristics::Init ******/
		/****** md5 signature: 86ff56288c2f71f7fbaf9de1ef1e4859 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aCharacterAppearance: StepVisual_TextStyleForDefinedFont
aCharacteristics: NCollection_HArray1<StepVisual_BoxCharacteristicSelect

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepVisual_TextStyleForDefinedFont> & aCharacterAppearance, const opencascade::handle<NCollection_HArray1<StepVisual_BoxCharacteristicSelect>> & aCharacteristics);

		/****** StepVisual_TextStyleWithBoxCharacteristics::NbCharacteristics ******/
		/****** md5 signature: 5599383221a9f1329ae14fba75253922 ******/
		%feature("compactdefaultargs") NbCharacteristics;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbCharacteristics;
		int NbCharacteristics();

		/****** StepVisual_TextStyleWithBoxCharacteristics::SetCharacteristics ******/
		/****** md5 signature: 6960ff67e698cecb5719a1557345cac6 ******/
		%feature("compactdefaultargs") SetCharacteristics;
		%feature("autodoc", "
Parameters
----------
aCharacteristics: NCollection_HArray1<StepVisual_BoxCharacteristicSelect

Return
-------
None

Description
-----------
No available documentation.
") SetCharacteristics;
		void SetCharacteristics(const opencascade::handle<NCollection_HArray1<StepVisual_BoxCharacteristicSelect>> & aCharacteristics);

};


%make_alias(StepVisual_TextStyleWithBoxCharacteristics)

%extend StepVisual_TextStyleWithBoxCharacteristics {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class StepVisual_AnnotationCurveOccurrence *
*********************************************/
class StepVisual_AnnotationCurveOccurrence : public StepVisual_AnnotationOccurrence {
	public:
		/****** StepVisual_AnnotationCurveOccurrence::StepVisual_AnnotationCurveOccurrence ******/
		/****** md5 signature: dfff6d2e393001f9ee1cacdc8ecdc20d ******/
		%feature("compactdefaultargs") StepVisual_AnnotationCurveOccurrence;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a AnnotationCurveOccurrence.
") StepVisual_AnnotationCurveOccurrence;
		 StepVisual_AnnotationCurveOccurrence();

};


%make_alias(StepVisual_AnnotationCurveOccurrence)

%extend StepVisual_AnnotationCurveOccurrence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class StepVisual_AnnotationFillAreaOccurrence *
************************************************/
class StepVisual_AnnotationFillAreaOccurrence : public StepVisual_AnnotationOccurrence {
	public:
		/****** StepVisual_AnnotationFillAreaOccurrence::StepVisual_AnnotationFillAreaOccurrence ******/
		/****** md5 signature: 35a8ee440a123dd131d2cf9afa8fe985 ******/
		%feature("compactdefaultargs") StepVisual_AnnotationFillAreaOccurrence;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a AnnotationFillAreaOccurrence.
") StepVisual_AnnotationFillAreaOccurrence;
		 StepVisual_AnnotationFillAreaOccurrence();

		/****** StepVisual_AnnotationFillAreaOccurrence::FillStyleTarget ******/
		/****** md5 signature: 885e8abd7455dd7c56d61bda8ca9a7e3 ******/
		%feature("compactdefaultargs") FillStyleTarget;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_GeometricRepresentationItem>

Description
-----------
Returns field fill_style_target.
") FillStyleTarget;
		opencascade::handle<StepGeom_GeometricRepresentationItem> FillStyleTarget();

		/****** StepVisual_AnnotationFillAreaOccurrence::Init ******/
		/****** md5 signature: 8d5dfcff20475bc9da1414507bafcfc6 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theStyles: NCollection_HArray1<
theItem: Standard_Transient
theFillStyleTarget: StepGeom_GeometricRepresentationItem

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<NCollection_HArray1<opencascade::handle<StepVisual_PresentationStyleAssignment>> > & theStyles, const opencascade::handle<Standard_Transient> & theItem, const opencascade::handle<StepGeom_GeometricRepresentationItem> & theFillStyleTarget);

		/****** StepVisual_AnnotationFillAreaOccurrence::SetFillStyleTarget ******/
		/****** md5 signature: 4bae9db8bbdfc96357201013c6b4fd01 ******/
		%feature("compactdefaultargs") SetFillStyleTarget;
		%feature("autodoc", "
Parameters
----------
theTarget: StepGeom_GeometricRepresentationItem

Return
-------
None

Description
-----------
Set field fill_style_target.
") SetFillStyleTarget;
		void SetFillStyleTarget(const opencascade::handle<StepGeom_GeometricRepresentationItem> & theTarget);

};


%make_alias(StepVisual_AnnotationFillAreaOccurrence)

%extend StepVisual_AnnotationFillAreaOccurrence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class StepVisual_AnnotationPlane *
***********************************/
class StepVisual_AnnotationPlane : public StepVisual_AnnotationOccurrence {
	public:
		/****** StepVisual_AnnotationPlane::StepVisual_AnnotationPlane ******/
		/****** md5 signature: b6f8046ea6a4bec95918baa4cb4d14f1 ******/
		%feature("compactdefaultargs") StepVisual_AnnotationPlane;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a AnnotationPlane.
") StepVisual_AnnotationPlane;
		 StepVisual_AnnotationPlane();

		/****** StepVisual_AnnotationPlane::Elements ******/
		/****** md5 signature: f2110067d2ac5763306d87a1001ae0a4 ******/
		%feature("compactdefaultargs") Elements;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<StepVisual_AnnotationPlaneElement>>

Description
-----------
Returns field Elements.
") Elements;
		opencascade::handle<NCollection_HArray1<StepVisual_AnnotationPlaneElement>> Elements();

		/****** StepVisual_AnnotationPlane::ElementsValue ******/
		/****** md5 signature: f1016edd7c226dbc1d718487d687a057 ******/
		%feature("compactdefaultargs") ElementsValue;
		%feature("autodoc", "
Parameters
----------
theNum: int

Return
-------
StepVisual_AnnotationPlaneElement

Description
-----------
Returns Elements with the given number.
") ElementsValue;
		StepVisual_AnnotationPlaneElement ElementsValue(const int theNum);

		/****** StepVisual_AnnotationPlane::Init ******/
		/****** md5 signature: e55f51d31574d165f952a6035a095781 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theStyles: NCollection_HArray1<
theItem: Standard_Transient
theElements: NCollection_HArray1<StepVisual_AnnotationPlaneElement

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<NCollection_HArray1<opencascade::handle<StepVisual_PresentationStyleAssignment>> > & theStyles, const opencascade::handle<Standard_Transient> & theItem, const opencascade::handle<NCollection_HArray1<StepVisual_AnnotationPlaneElement>> & theElements);

		/****** StepVisual_AnnotationPlane::NbElements ******/
		/****** md5 signature: 6bd0da2ccc5d818911c9af362928577e ******/
		%feature("compactdefaultargs") NbElements;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of Elements.
") NbElements;
		int NbElements();

		/****** StepVisual_AnnotationPlane::SetElements ******/
		/****** md5 signature: 78070bb3a7852db1df7df0b048e6b6b1 ******/
		%feature("compactdefaultargs") SetElements;
		%feature("autodoc", "
Parameters
----------
theElements: NCollection_HArray1<StepVisual_AnnotationPlaneElement

Return
-------
None

Description
-----------
Set field Elements.
") SetElements;
		void SetElements(const opencascade::handle<NCollection_HArray1<StepVisual_AnnotationPlaneElement>> & theElements);

		/****** StepVisual_AnnotationPlane::SetElementsValue ******/
		/****** md5 signature: 622562171ac48b1af642c9f71ec720c4 ******/
		%feature("compactdefaultargs") SetElementsValue;
		%feature("autodoc", "
Parameters
----------
theNum: int
theItem: StepVisual_AnnotationPlaneElement

Return
-------
None

Description
-----------
Sets Elements with given number.
") SetElementsValue;
		void SetElementsValue(const int theNum, const StepVisual_AnnotationPlaneElement & theItem);

};


%make_alias(StepVisual_AnnotationPlane)

%extend StepVisual_AnnotationPlane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class StepVisual_AnnotationTextOccurrence *
********************************************/
class StepVisual_AnnotationTextOccurrence : public StepVisual_AnnotationOccurrence {
	public:
		/****** StepVisual_AnnotationTextOccurrence::StepVisual_AnnotationTextOccurrence ******/
		/****** md5 signature: da7ad91bd90214d3de2a03100b11c676 ******/
		%feature("compactdefaultargs") StepVisual_AnnotationTextOccurrence;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a AnnotationTextOccurrence.
") StepVisual_AnnotationTextOccurrence;
		 StepVisual_AnnotationTextOccurrence();

};


%make_alias(StepVisual_AnnotationTextOccurrence)

%extend StepVisual_AnnotationTextOccurrence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class StepVisual_CameraModelD3MultiClipping *
**********************************************/
class StepVisual_CameraModelD3MultiClipping : public StepVisual_CameraModelD3 {
	public:
		/****** StepVisual_CameraModelD3MultiClipping::StepVisual_CameraModelD3MultiClipping ******/
		/****** md5 signature: edfd42c6cf58b7cc2aa341faa7e158f2 ******/
		%feature("compactdefaultargs") StepVisual_CameraModelD3MultiClipping;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a CameraModelD3MultiClipping.
") StepVisual_CameraModelD3MultiClipping;
		 StepVisual_CameraModelD3MultiClipping();

		/****** StepVisual_CameraModelD3MultiClipping::Init ******/
		/****** md5 signature: 5c635395cca9e820df379cf52e4e923a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theViewReferenceSystem: StepGeom_Axis2Placement3d
thePerspectiveOfVolume: StepVisual_ViewVolume
theShapeClipping: NCollection_HArray1<StepVisual_CameraModelD3MultiClippingInterectionSelect

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<StepGeom_Axis2Placement3d> & theViewReferenceSystem, const opencascade::handle<StepVisual_ViewVolume> & thePerspectiveOfVolume, const opencascade::handle<NCollection_HArray1<StepVisual_CameraModelD3MultiClippingInterectionSelect>> & theShapeClipping);

		/****** StepVisual_CameraModelD3MultiClipping::SetShapeClipping ******/
		/****** md5 signature: 187599a571177f4385040e3ae451bae8 ******/
		%feature("compactdefaultargs") SetShapeClipping;
		%feature("autodoc", "
Parameters
----------
theShapeClipping: NCollection_HArray1<StepVisual_CameraModelD3MultiClippingInterectionSelect

Return
-------
None

Description
-----------
No available documentation.
") SetShapeClipping;
		void SetShapeClipping(const opencascade::handle<NCollection_HArray1<StepVisual_CameraModelD3MultiClippingInterectionSelect>> & theShapeClipping);

		/****** StepVisual_CameraModelD3MultiClipping::ShapeClipping ******/
		/****** md5 signature: ed107bc4601a5fc64b033b41b9c3a47c ******/
		%feature("compactdefaultargs") ShapeClipping;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<StepVisual_CameraModelD3MultiClippingInterectionSelect>>

Description
-----------
No available documentation.
") ShapeClipping;
		const opencascade::handle<NCollection_HArray1<StepVisual_CameraModelD3MultiClippingInterectionSelect>> ShapeClipping();

};


%make_alias(StepVisual_CameraModelD3MultiClipping)

%extend StepVisual_CameraModelD3MultiClipping {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class StepVisual_ColourRgb *
*****************************/
class StepVisual_ColourRgb : public StepVisual_ColourSpecification {
	public:
		/****** StepVisual_ColourRgb::StepVisual_ColourRgb ******/
		/****** md5 signature: fc0e00166ed992e466a0001dbf841008 ******/
		%feature("compactdefaultargs") StepVisual_ColourRgb;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a ColourRgb.
") StepVisual_ColourRgb;
		 StepVisual_ColourRgb();

		/****** StepVisual_ColourRgb::Blue ******/
		/****** md5 signature: 6fb31a269592d13ae487d86b3081830d ******/
		%feature("compactdefaultargs") Blue;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Blue;
		double Blue();

		/****** StepVisual_ColourRgb::Green ******/
		/****** md5 signature: 33ac4077510e9c187992357a2d6e41a8 ******/
		%feature("compactdefaultargs") Green;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Green;
		double Green();

		/****** StepVisual_ColourRgb::Init ******/
		/****** md5 signature: 62b8dd19e1d7e719db2b8de0301df84e ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aRed: double
aGreen: double
aBlue: double

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const double aRed, const double aGreen, const double aBlue);

		/****** StepVisual_ColourRgb::Red ******/
		/****** md5 signature: 7608aa9ac6327222fd720ce42e31bb70 ******/
		%feature("compactdefaultargs") Red;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Red;
		double Red();

		/****** StepVisual_ColourRgb::SetBlue ******/
		/****** md5 signature: aa11d019748323e604a04fcfc23bded8 ******/
		%feature("compactdefaultargs") SetBlue;
		%feature("autodoc", "
Parameters
----------
aBlue: double

Return
-------
None

Description
-----------
No available documentation.
") SetBlue;
		void SetBlue(const double aBlue);

		/****** StepVisual_ColourRgb::SetGreen ******/
		/****** md5 signature: 9d7ac2bc731ccbefeac1b9b49e4aff55 ******/
		%feature("compactdefaultargs") SetGreen;
		%feature("autodoc", "
Parameters
----------
aGreen: double

Return
-------
None

Description
-----------
No available documentation.
") SetGreen;
		void SetGreen(const double aGreen);

		/****** StepVisual_ColourRgb::SetRed ******/
		/****** md5 signature: b8366d98dc723630b0d4b8a6c3ae5e69 ******/
		%feature("compactdefaultargs") SetRed;
		%feature("autodoc", "
Parameters
----------
aRed: double

Return
-------
None

Description
-----------
No available documentation.
") SetRed;
		void SetRed(const double aRed);

};


%make_alias(StepVisual_ColourRgb)

%extend StepVisual_ColourRgb {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class StepVisual_ComplexTriangulatedSurfaceSet *
*************************************************/
class StepVisual_ComplexTriangulatedSurfaceSet : public StepVisual_TessellatedSurfaceSet {
	public:
		/****** StepVisual_ComplexTriangulatedSurfaceSet::StepVisual_ComplexTriangulatedSurfaceSet ******/
		/****** md5 signature: f5a25facbd5e6f9b3584f609970d6c0e ******/
		%feature("compactdefaultargs") StepVisual_ComplexTriangulatedSurfaceSet;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepVisual_ComplexTriangulatedSurfaceSet;
		 StepVisual_ComplexTriangulatedSurfaceSet();

		/****** StepVisual_ComplexTriangulatedSurfaceSet::Init ******/
		/****** md5 signature: f57b66a6adae4d3e3c0c0483d22f1afa ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theTessellatedSurfaceSet_Coordinates: StepVisual_CoordinatesList
theTessellatedSurfaceSet_Pnmax: int
theTessellatedSurfaceSet_Normals: TColStd_HArray2OfReal
thePnindex: TColStd_HArray1OfInteger
theTriangleStrips: TColStd_HArray1OfTransient
theTriangleFans: TColStd_HArray1OfTransient

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepVisual_CoordinatesList> & theTessellatedSurfaceSet_Coordinates, const int theTessellatedSurfaceSet_Pnmax, const opencascade::handle<TColStd_HArray2OfReal> & theTessellatedSurfaceSet_Normals, const opencascade::handle<TColStd_HArray1OfInteger> & thePnindex, const opencascade::handle<TColStd_HArray1OfTransient > & theTriangleStrips, const opencascade::handle<TColStd_HArray1OfTransient > & theTriangleFans);

		/****** StepVisual_ComplexTriangulatedSurfaceSet::NbPnindex ******/
		/****** md5 signature: fa0390b522536d32c57fd2258eaae3dc ******/
		%feature("compactdefaultargs") NbPnindex;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of Pnindex.
") NbPnindex;
		int NbPnindex();

		/****** StepVisual_ComplexTriangulatedSurfaceSet::NbTriangleFans ******/
		/****** md5 signature: 9b57e4a36b65f1c3d38a8964c33db1e8 ******/
		%feature("compactdefaultargs") NbTriangleFans;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of TriangleFans.
") NbTriangleFans;
		int NbTriangleFans();

		/****** StepVisual_ComplexTriangulatedSurfaceSet::NbTriangleStrips ******/
		/****** md5 signature: 7728d0f4aa103c83439c219d7bffb985 ******/
		%feature("compactdefaultargs") NbTriangleStrips;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of TriangleStrips.
") NbTriangleStrips;
		int NbTriangleStrips();

		/****** StepVisual_ComplexTriangulatedSurfaceSet::Pnindex ******/
		/****** md5 signature: 09e8994aba918b05d67109a1b6cb169f ******/
		%feature("compactdefaultargs") Pnindex;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfInteger>

Description
-----------
Returns field Pnindex.
") Pnindex;
		opencascade::handle<TColStd_HArray1OfInteger> Pnindex();

		/****** StepVisual_ComplexTriangulatedSurfaceSet::PnindexValue ******/
		/****** md5 signature: 48ee39bad81e98bebf477adb861fdae9 ******/
		%feature("compactdefaultargs") PnindexValue;
		%feature("autodoc", "
Parameters
----------
theNum: int

Return
-------
int

Description
-----------
Returns value of Pnindex by its num.
") PnindexValue;
		int PnindexValue(const int theNum);

		/****** StepVisual_ComplexTriangulatedSurfaceSet::SetPnindex ******/
		/****** md5 signature: 6b1df731da4f31c7c40911228c1c4e69 ******/
		%feature("compactdefaultargs") SetPnindex;
		%feature("autodoc", "
Parameters
----------
thePnindex: TColStd_HArray1OfInteger

Return
-------
None

Description
-----------
Sets field Pnindex.
") SetPnindex;
		void SetPnindex(const opencascade::handle<TColStd_HArray1OfInteger> & thePnindex);

		/****** StepVisual_ComplexTriangulatedSurfaceSet::SetTriangleFans ******/
		/****** md5 signature: 97555164e55acbc445db5108ed5e4f5d ******/
		%feature("compactdefaultargs") SetTriangleFans;
		%feature("autodoc", "
Parameters
----------
theTriangleFans: TColStd_HArray1OfTransient

Return
-------
None

Description
-----------
Sets field TriangleFans.
") SetTriangleFans;
		void SetTriangleFans(const opencascade::handle<TColStd_HArray1OfTransient > & theTriangleFans);

		/****** StepVisual_ComplexTriangulatedSurfaceSet::SetTriangleStrips ******/
		/****** md5 signature: f9e564016d990ea902d6179d6d59b86d ******/
		%feature("compactdefaultargs") SetTriangleStrips;
		%feature("autodoc", "
Parameters
----------
theTriangleStrips: TColStd_HArray1OfTransient

Return
-------
None

Description
-----------
Sets field TriangleStrips.
") SetTriangleStrips;
		void SetTriangleStrips(const opencascade::handle<TColStd_HArray1OfTransient > & theTriangleStrips);

		/****** StepVisual_ComplexTriangulatedSurfaceSet::TriangleFans ******/
		/****** md5 signature: 784e501cc34d4419979a45bb8211121f ******/
		%feature("compactdefaultargs") TriangleFans;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfTransient>

Description
-----------
Returns field TriangleFans.
") TriangleFans;
		opencascade::handle<TColStd_HArray1OfTransient> TriangleFans();

		/****** StepVisual_ComplexTriangulatedSurfaceSet::TriangleStrips ******/
		/****** md5 signature: e3466b34e9c2635ab287cc9c74f97401 ******/
		%feature("compactdefaultargs") TriangleStrips;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfTransient>

Description
-----------
Returns field TriangleStrips.
") TriangleStrips;
		opencascade::handle<TColStd_HArray1OfTransient> TriangleStrips();

};


%make_alias(StepVisual_ComplexTriangulatedSurfaceSet)

%extend StepVisual_ComplexTriangulatedSurfaceSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************************
* class StepVisual_ContextDependentOverRidingStyledItem *
********************************************************/
class StepVisual_ContextDependentOverRidingStyledItem : public StepVisual_OverRidingStyledItem {
	public:
		/****** StepVisual_ContextDependentOverRidingStyledItem::StepVisual_ContextDependentOverRidingStyledItem ******/
		/****** md5 signature: 751ad648a1d021296e877fb353c36504 ******/
		%feature("compactdefaultargs") StepVisual_ContextDependentOverRidingStyledItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a ContextDependentOverRidingStyledItem.
") StepVisual_ContextDependentOverRidingStyledItem;
		 StepVisual_ContextDependentOverRidingStyledItem();

		/****** StepVisual_ContextDependentOverRidingStyledItem::Init ******/
		/****** md5 signature: 01fbb94db34fcbec169aa65be52aa2a1 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aStyles: NCollection_HArray1<
aItem: Standard_Transient
aOverRiddenStyle: StepVisual_StyledItem
aStyleContext: NCollection_HArray1<StepVisual_StyleContextSelect

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<NCollection_HArray1<opencascade::handle<StepVisual_PresentationStyleAssignment>> > & aStyles, const opencascade::handle<Standard_Transient> & aItem, const opencascade::handle<StepVisual_StyledItem> & aOverRiddenStyle, const opencascade::handle<NCollection_HArray1<StepVisual_StyleContextSelect>> & aStyleContext);

		/****** StepVisual_ContextDependentOverRidingStyledItem::NbStyleContext ******/
		/****** md5 signature: f9b43da9f856e7df76d9552304bb59ff ******/
		%feature("compactdefaultargs") NbStyleContext;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbStyleContext;
		int NbStyleContext();

		/****** StepVisual_ContextDependentOverRidingStyledItem::SetStyleContext ******/
		/****** md5 signature: c772541ffa378d6b88a4fc2c0b7abe0f ******/
		%feature("compactdefaultargs") SetStyleContext;
		%feature("autodoc", "
Parameters
----------
aStyleContext: NCollection_HArray1<StepVisual_StyleContextSelect

Return
-------
None

Description
-----------
No available documentation.
") SetStyleContext;
		void SetStyleContext(const opencascade::handle<NCollection_HArray1<StepVisual_StyleContextSelect>> & aStyleContext);

		/****** StepVisual_ContextDependentOverRidingStyledItem::StyleContext ******/
		/****** md5 signature: b2c85c7232377d6a445b1c093cd9bd4e ******/
		%feature("compactdefaultargs") StyleContext;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<StepVisual_StyleContextSelect>>

Description
-----------
No available documentation.
") StyleContext;
		opencascade::handle<NCollection_HArray1<StepVisual_StyleContextSelect>> StyleContext();

		/****** StepVisual_ContextDependentOverRidingStyledItem::StyleContextValue ******/
		/****** md5 signature: 7f1b11a2839aa6c1c6a9991c88a24003 ******/
		%feature("compactdefaultargs") StyleContextValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
StepVisual_StyleContextSelect

Description
-----------
No available documentation.
") StyleContextValue;
		StepVisual_StyleContextSelect StyleContextValue(const int num);

};


%make_alias(StepVisual_ContextDependentOverRidingStyledItem)

%extend StepVisual_ContextDependentOverRidingStyledItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class StepVisual_DraughtingAnnotationOccurrence *
**************************************************/
class StepVisual_DraughtingAnnotationOccurrence : public StepVisual_AnnotationOccurrence {
	public:
		/****** StepVisual_DraughtingAnnotationOccurrence::StepVisual_DraughtingAnnotationOccurrence ******/
		/****** md5 signature: 2b9ce23c362fbb9bfde7c9391d3cddbd ******/
		%feature("compactdefaultargs") StepVisual_DraughtingAnnotationOccurrence;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a DraughtingAnnotationOccurrence.
") StepVisual_DraughtingAnnotationOccurrence;
		 StepVisual_DraughtingAnnotationOccurrence();

};


%make_alias(StepVisual_DraughtingAnnotationOccurrence)

%extend StepVisual_DraughtingAnnotationOccurrence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class StepVisual_DraughtingPreDefinedColour *
**********************************************/
class StepVisual_DraughtingPreDefinedColour : public StepVisual_PreDefinedColour {
	public:
		/****** StepVisual_DraughtingPreDefinedColour::StepVisual_DraughtingPreDefinedColour ******/
		/****** md5 signature: 00e69d8ddf639a4c18137430bd132b5c ******/
		%feature("compactdefaultargs") StepVisual_DraughtingPreDefinedColour;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a DraughtingPreDefinedColour.
") StepVisual_DraughtingPreDefinedColour;
		 StepVisual_DraughtingPreDefinedColour();

};


%make_alias(StepVisual_DraughtingPreDefinedColour)

%extend StepVisual_DraughtingPreDefinedColour {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class StepVisual_DraughtingPreDefinedCurveFont *
*************************************************/
class StepVisual_DraughtingPreDefinedCurveFont : public StepVisual_PreDefinedCurveFont {
	public:
		/****** StepVisual_DraughtingPreDefinedCurveFont::StepVisual_DraughtingPreDefinedCurveFont ******/
		/****** md5 signature: 60ea7de40e169960204d618db9b7c17d ******/
		%feature("compactdefaultargs") StepVisual_DraughtingPreDefinedCurveFont;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a DraughtingPreDefinedCurveFont.
") StepVisual_DraughtingPreDefinedCurveFont;
		 StepVisual_DraughtingPreDefinedCurveFont();

};


%make_alias(StepVisual_DraughtingPreDefinedCurveFont)

%extend StepVisual_DraughtingPreDefinedCurveFont {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************************
* class StepVisual_MechanicalDesignGeometricPresentationArea *
*************************************************************/
class StepVisual_MechanicalDesignGeometricPresentationArea : public StepVisual_PresentationArea {
	public:
		/****** StepVisual_MechanicalDesignGeometricPresentationArea::StepVisual_MechanicalDesignGeometricPresentationArea ******/
		/****** md5 signature: 0ce86d69783d015e1babc7156290b5d1 ******/
		%feature("compactdefaultargs") StepVisual_MechanicalDesignGeometricPresentationArea;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a MechanicalDesignGeometricPresentationArea.
") StepVisual_MechanicalDesignGeometricPresentationArea;
		 StepVisual_MechanicalDesignGeometricPresentationArea();

};


%make_alias(StepVisual_MechanicalDesignGeometricPresentationArea)

%extend StepVisual_MechanicalDesignGeometricPresentationArea {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************************
* class StepVisual_RepositionedTessellatedGeometricSet *
*******************************************************/
class StepVisual_RepositionedTessellatedGeometricSet : public StepVisual_TessellatedGeometricSet {
	public:
		/****** StepVisual_RepositionedTessellatedGeometricSet::StepVisual_RepositionedTessellatedGeometricSet ******/
		/****** md5 signature: f0eaa0b11b56b08e5e60762a9dfae648 ******/
		%feature("compactdefaultargs") StepVisual_RepositionedTessellatedGeometricSet;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default constructor.
") StepVisual_RepositionedTessellatedGeometricSet;
		 StepVisual_RepositionedTessellatedGeometricSet();

		/****** StepVisual_RepositionedTessellatedGeometricSet::Init ******/
		/****** md5 signature: 812a97755f4871e9c69c096993726f4b ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theItems: StepVisual_TessellatedItem
theLocation: StepGeom_Axis2Placement3d

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const NCollection_Handle<NCollection_Array1<opencascade::handle<StepVisual_TessellatedItem>> > & theItems, const opencascade::handle<StepGeom_Axis2Placement3d> & theLocation);

		/****** StepVisual_RepositionedTessellatedGeometricSet::Location ******/
		/****** md5 signature: 39fc6625e849c305cb623a87ef9754a6 ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Axis2Placement3d>

Description
-----------
Returns location.
") Location;
		opencascade::handle<StepGeom_Axis2Placement3d> Location();

		/****** StepVisual_RepositionedTessellatedGeometricSet::SetLocation ******/
		/****** md5 signature: 447f5a9e9fa630b823c1544b8c75af39 ******/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "
Parameters
----------
theLocation: StepGeom_Axis2Placement3d

Return
-------
None

Description
-----------
Sets location.
") SetLocation;
		void SetLocation(const opencascade::handle<StepGeom_Axis2Placement3d> & theLocation);

};


%make_alias(StepVisual_RepositionedTessellatedGeometricSet)

%extend StepVisual_RepositionedTessellatedGeometricSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************************************
* class StepVisual_SurfaceStyleReflectanceAmbientDiffuseSpecular *
*****************************************************************/
class StepVisual_SurfaceStyleReflectanceAmbientDiffuseSpecular : public StepVisual_SurfaceStyleReflectanceAmbientDiffuse {
	public:
		/****** StepVisual_SurfaceStyleReflectanceAmbientDiffuseSpecular::StepVisual_SurfaceStyleReflectanceAmbientDiffuseSpecular ******/
		/****** md5 signature: 7de526301c388a578f2dd40d8ba0efa1 ******/
		%feature("compactdefaultargs") StepVisual_SurfaceStyleReflectanceAmbientDiffuseSpecular;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepVisual_SurfaceStyleReflectanceAmbientDiffuseSpecular;
		 StepVisual_SurfaceStyleReflectanceAmbientDiffuseSpecular();

		/****** StepVisual_SurfaceStyleReflectanceAmbientDiffuseSpecular::Init ******/
		/****** md5 signature: 1999a903e17d5d4b18bab05f6be67b09 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theAmbientReflectance: double
theDiffuseReflectance: double
theSpecularReflectance: double
theSpecularExponent: double
theSpecularColour: StepVisual_Colour

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const double theAmbientReflectance, const double theDiffuseReflectance, const double theSpecularReflectance, const double theSpecularExponent, const opencascade::handle<StepVisual_Colour> & theSpecularColour);

		/****** StepVisual_SurfaceStyleReflectanceAmbientDiffuseSpecular::SetSpecularColour ******/
		/****** md5 signature: c8c19b4b207048438a0c361e907eda2a ******/
		%feature("compactdefaultargs") SetSpecularColour;
		%feature("autodoc", "
Parameters
----------
theSpecularColour: StepVisual_Colour

Return
-------
None

Description
-----------
Sets field SpecularColour.
") SetSpecularColour;
		void SetSpecularColour(const opencascade::handle<StepVisual_Colour> & theSpecularColour);

		/****** StepVisual_SurfaceStyleReflectanceAmbientDiffuseSpecular::SetSpecularExponent ******/
		/****** md5 signature: d899f682bc3d3ec8ccbaa3f671ac01f7 ******/
		%feature("compactdefaultargs") SetSpecularExponent;
		%feature("autodoc", "
Parameters
----------
theSpecularExponent: double

Return
-------
None

Description
-----------
Sets field SpecularExponent.
") SetSpecularExponent;
		void SetSpecularExponent(const double theSpecularExponent);

		/****** StepVisual_SurfaceStyleReflectanceAmbientDiffuseSpecular::SetSpecularReflectance ******/
		/****** md5 signature: 2f24a44729f75ae9aac8290df60386e2 ******/
		%feature("compactdefaultargs") SetSpecularReflectance;
		%feature("autodoc", "
Parameters
----------
theSpecularReflectance: double

Return
-------
None

Description
-----------
Sets field SpecularReflectance.
") SetSpecularReflectance;
		void SetSpecularReflectance(const double theSpecularReflectance);

		/****** StepVisual_SurfaceStyleReflectanceAmbientDiffuseSpecular::SpecularColour ******/
		/****** md5 signature: 24d356fe3173335d4799172e80fff2b0 ******/
		%feature("compactdefaultargs") SpecularColour;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_Colour>

Description
-----------
Returns field SpecularColour.
") SpecularColour;
		opencascade::handle<StepVisual_Colour> SpecularColour();

		/****** StepVisual_SurfaceStyleReflectanceAmbientDiffuseSpecular::SpecularExponent ******/
		/****** md5 signature: 960d5e9571ed6d5a2feae06b7ccaa955 ******/
		%feature("compactdefaultargs") SpecularExponent;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field SpecularExponent.
") SpecularExponent;
		double SpecularExponent();

		/****** StepVisual_SurfaceStyleReflectanceAmbientDiffuseSpecular::SpecularReflectance ******/
		/****** md5 signature: 0ef056b84c0ae58e1a5b357064ec67b8 ******/
		%feature("compactdefaultargs") SpecularReflectance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field SpecularReflectance.
") SpecularReflectance;
		double SpecularReflectance();

};


%make_alias(StepVisual_SurfaceStyleReflectanceAmbientDiffuseSpecular)

%extend StepVisual_SurfaceStyleReflectanceAmbientDiffuseSpecular {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class StepVisual_TessellatedEdge *
***********************************/
class StepVisual_TessellatedEdge : public StepVisual_TessellatedStructuredItem {
	public:
		/****** StepVisual_TessellatedEdge::StepVisual_TessellatedEdge ******/
		/****** md5 signature: c013b92f5aa5aac524506ea5d3e53d39 ******/
		%feature("compactdefaultargs") StepVisual_TessellatedEdge;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepVisual_TessellatedEdge;
		 StepVisual_TessellatedEdge();

		/****** StepVisual_TessellatedEdge::Coordinates ******/
		/****** md5 signature: ec74f7c30bc760bfadd8f8d2135f55c5 ******/
		%feature("compactdefaultargs") Coordinates;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_CoordinatesList>

Description
-----------
Returns field Coordinates.
") Coordinates;
		opencascade::handle<StepVisual_CoordinatesList> Coordinates();

		/****** StepVisual_TessellatedEdge::GeometricLink ******/
		/****** md5 signature: 925f3ac0b87083092684dd5f4ded6a57 ******/
		%feature("compactdefaultargs") GeometricLink;
		%feature("autodoc", "Return
-------
StepVisual_EdgeOrCurve

Description
-----------
Returns field GeometricLink.
") GeometricLink;
		StepVisual_EdgeOrCurve GeometricLink();

		/****** StepVisual_TessellatedEdge::HasGeometricLink ******/
		/****** md5 signature: 7973d6dd6244b6e2282e3fd64891961e ******/
		%feature("compactdefaultargs") HasGeometricLink;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field GeometricLink is defined.
") HasGeometricLink;
		bool HasGeometricLink();

		/****** StepVisual_TessellatedEdge::Init ******/
		/****** md5 signature: 7ad15a7f820e9517ea81fa68bd7c4b84 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theCoordinates: StepVisual_CoordinatesList
theHasGeometricLink: bool
theGeometricLink: StepVisual_EdgeOrCurve
theLineStrip: TColStd_HArray1OfInteger

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepVisual_CoordinatesList> & theCoordinates, const bool theHasGeometricLink, const StepVisual_EdgeOrCurve & theGeometricLink, const opencascade::handle<TColStd_HArray1OfInteger> & theLineStrip);

		/****** StepVisual_TessellatedEdge::LineStrip ******/
		/****** md5 signature: 051d50f80c0a07a26035705e45fe89a1 ******/
		%feature("compactdefaultargs") LineStrip;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfInteger>

Description
-----------
Returns field LineStrip.
") LineStrip;
		opencascade::handle<TColStd_HArray1OfInteger> LineStrip();

		/****** StepVisual_TessellatedEdge::LineStripValue ******/
		/****** md5 signature: fcead8284d1c5c3583071d86ad066792 ******/
		%feature("compactdefaultargs") LineStripValue;
		%feature("autodoc", "
Parameters
----------
theNum: int

Return
-------
int

Description
-----------
Returns value of LineStrip by its num.
") LineStripValue;
		int LineStripValue(const int theNum);

		/****** StepVisual_TessellatedEdge::NbLineStrip ******/
		/****** md5 signature: 7fa0e23cc14145d2518b2cb26374505b ******/
		%feature("compactdefaultargs") NbLineStrip;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of LineStrip.
") NbLineStrip;
		int NbLineStrip();

		/****** StepVisual_TessellatedEdge::SetCoordinates ******/
		/****** md5 signature: 67496989a6887e140d96a4901bab43cb ******/
		%feature("compactdefaultargs") SetCoordinates;
		%feature("autodoc", "
Parameters
----------
theCoordinates: StepVisual_CoordinatesList

Return
-------
None

Description
-----------
Sets field Coordinates.
") SetCoordinates;
		void SetCoordinates(const opencascade::handle<StepVisual_CoordinatesList> & theCoordinates);

		/****** StepVisual_TessellatedEdge::SetGeometricLink ******/
		/****** md5 signature: 27d1504e34949f42efa5236d7d974433 ******/
		%feature("compactdefaultargs") SetGeometricLink;
		%feature("autodoc", "
Parameters
----------
theGeometricLink: StepVisual_EdgeOrCurve

Return
-------
None

Description
-----------
Sets field GeometricLink.
") SetGeometricLink;
		void SetGeometricLink(const StepVisual_EdgeOrCurve & theGeometricLink);

		/****** StepVisual_TessellatedEdge::SetLineStrip ******/
		/****** md5 signature: 69540710c9fa42581c20699ecfe3cfcb ******/
		%feature("compactdefaultargs") SetLineStrip;
		%feature("autodoc", "
Parameters
----------
theLineStrip: TColStd_HArray1OfInteger

Return
-------
None

Description
-----------
Sets field LineStrip.
") SetLineStrip;
		void SetLineStrip(const opencascade::handle<TColStd_HArray1OfInteger> & theLineStrip);

};


%make_alias(StepVisual_TessellatedEdge)

%extend StepVisual_TessellatedEdge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class StepVisual_TessellatedFace *
***********************************/
class StepVisual_TessellatedFace : public StepVisual_TessellatedStructuredItem {
	public:
		/****** StepVisual_TessellatedFace::StepVisual_TessellatedFace ******/
		/****** md5 signature: ef7c9c35d3c2fabc32313d4960183e0b ******/
		%feature("compactdefaultargs") StepVisual_TessellatedFace;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepVisual_TessellatedFace;
		 StepVisual_TessellatedFace();

		/****** StepVisual_TessellatedFace::Coordinates ******/
		/****** md5 signature: ec74f7c30bc760bfadd8f8d2135f55c5 ******/
		%feature("compactdefaultargs") Coordinates;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_CoordinatesList>

Description
-----------
Returns field Coordinates.
") Coordinates;
		opencascade::handle<StepVisual_CoordinatesList> Coordinates();

		/****** StepVisual_TessellatedFace::GeometricLink ******/
		/****** md5 signature: 2b68caeb7c36a74f35800182674c6c08 ******/
		%feature("compactdefaultargs") GeometricLink;
		%feature("autodoc", "Return
-------
StepVisual_FaceOrSurface

Description
-----------
Returns field GeometricLink.
") GeometricLink;
		StepVisual_FaceOrSurface GeometricLink();

		/****** StepVisual_TessellatedFace::HasGeometricLink ******/
		/****** md5 signature: 7973d6dd6244b6e2282e3fd64891961e ******/
		%feature("compactdefaultargs") HasGeometricLink;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field GeometricLink is defined.
") HasGeometricLink;
		bool HasGeometricLink();

		/****** StepVisual_TessellatedFace::Init ******/
		/****** md5 signature: 611979e6652a26111c557d504d9a3fa9 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theCoordinates: StepVisual_CoordinatesList
thePnmax: int
theNormals: TColStd_HArray2OfReal
theHasGeometricLink: bool
theGeometricLink: StepVisual_FaceOrSurface

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepVisual_CoordinatesList> & theCoordinates, const int thePnmax, const opencascade::handle<TColStd_HArray2OfReal> & theNormals, const bool theHasGeometricLink, const StepVisual_FaceOrSurface & theGeometricLink);

		/****** StepVisual_TessellatedFace::NbNormals ******/
		/****** md5 signature: 70704d74c52f9f781807886fb702a9a0 ******/
		%feature("compactdefaultargs") NbNormals;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of Normals.
") NbNormals;
		int NbNormals();

		/****** StepVisual_TessellatedFace::Normals ******/
		/****** md5 signature: 6e61cf49fb411fafdb848cd6d5537857 ******/
		%feature("compactdefaultargs") Normals;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray2OfReal>

Description
-----------
Returns field Normals.
") Normals;
		opencascade::handle<TColStd_HArray2OfReal> Normals();

		/****** StepVisual_TessellatedFace::Pnmax ******/
		/****** md5 signature: f8c9f6434162140214befb9c86ad56a9 ******/
		%feature("compactdefaultargs") Pnmax;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns field Pnmax.
") Pnmax;
		int Pnmax();

		/****** StepVisual_TessellatedFace::SetCoordinates ******/
		/****** md5 signature: 67496989a6887e140d96a4901bab43cb ******/
		%feature("compactdefaultargs") SetCoordinates;
		%feature("autodoc", "
Parameters
----------
theCoordinates: StepVisual_CoordinatesList

Return
-------
None

Description
-----------
Sets field Coordinates.
") SetCoordinates;
		void SetCoordinates(const opencascade::handle<StepVisual_CoordinatesList> & theCoordinates);

		/****** StepVisual_TessellatedFace::SetGeometricLink ******/
		/****** md5 signature: 7e838ce726efeca1c27b9d4f1e6d745b ******/
		%feature("compactdefaultargs") SetGeometricLink;
		%feature("autodoc", "
Parameters
----------
theGeometricLink: StepVisual_FaceOrSurface

Return
-------
None

Description
-----------
Sets field GeometricLink.
") SetGeometricLink;
		void SetGeometricLink(const StepVisual_FaceOrSurface & theGeometricLink);

		/****** StepVisual_TessellatedFace::SetNormals ******/
		/****** md5 signature: 842aa9edbe18cb9cfb26e7712adf84b0 ******/
		%feature("compactdefaultargs") SetNormals;
		%feature("autodoc", "
Parameters
----------
theNormals: TColStd_HArray2OfReal

Return
-------
None

Description
-----------
Sets field Normals.
") SetNormals;
		void SetNormals(const opencascade::handle<TColStd_HArray2OfReal> & theNormals);

		/****** StepVisual_TessellatedFace::SetPnmax ******/
		/****** md5 signature: b8d9a8891a4a0dd68dc51880031eb888 ******/
		%feature("compactdefaultargs") SetPnmax;
		%feature("autodoc", "
Parameters
----------
thePnmax: int

Return
-------
None

Description
-----------
Sets field Pnmax.
") SetPnmax;
		void SetPnmax(const int thePnmax);

};


%make_alias(StepVisual_TessellatedFace)

%extend StepVisual_TessellatedFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class StepVisual_TessellatedVertex *
*************************************/
class StepVisual_TessellatedVertex : public StepVisual_TessellatedStructuredItem {
	public:
		/****** StepVisual_TessellatedVertex::StepVisual_TessellatedVertex ******/
		/****** md5 signature: 1d479f8d322cf89bb62554a06ec2c5d6 ******/
		%feature("compactdefaultargs") StepVisual_TessellatedVertex;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepVisual_TessellatedVertex;
		 StepVisual_TessellatedVertex();

		/****** StepVisual_TessellatedVertex::Coordinates ******/
		/****** md5 signature: ec74f7c30bc760bfadd8f8d2135f55c5 ******/
		%feature("compactdefaultargs") Coordinates;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_CoordinatesList>

Description
-----------
Returns field Coordinates.
") Coordinates;
		opencascade::handle<StepVisual_CoordinatesList> Coordinates();

		/****** StepVisual_TessellatedVertex::HasTopologicalLink ******/
		/****** md5 signature: f4cbb5d53bb67ed635ad7c9628c33302 ******/
		%feature("compactdefaultargs") HasTopologicalLink;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field TopologicalLink is defined.
") HasTopologicalLink;
		bool HasTopologicalLink();

		/****** StepVisual_TessellatedVertex::Init ******/
		/****** md5 signature: 3ceba78bc29a37074b4d935cdd4dd17c ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theCoordinates: StepVisual_CoordinatesList
theHasTopologicalLink: bool
theTopologicalLink: StepShape_VertexPoint
thePointIndex: int

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepVisual_CoordinatesList> & theCoordinates, const bool theHasTopologicalLink, const opencascade::handle<StepShape_VertexPoint> & theTopologicalLink, const int thePointIndex);

		/****** StepVisual_TessellatedVertex::PointIndex ******/
		/****** md5 signature: 45fd17763ffbdac72527f9f3b9d9afd6 ******/
		%feature("compactdefaultargs") PointIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns field PointIndex.
") PointIndex;
		int PointIndex();

		/****** StepVisual_TessellatedVertex::SetCoordinates ******/
		/****** md5 signature: 67496989a6887e140d96a4901bab43cb ******/
		%feature("compactdefaultargs") SetCoordinates;
		%feature("autodoc", "
Parameters
----------
theCoordinates: StepVisual_CoordinatesList

Return
-------
None

Description
-----------
Sets field Coordinates.
") SetCoordinates;
		void SetCoordinates(const opencascade::handle<StepVisual_CoordinatesList> & theCoordinates);

		/****** StepVisual_TessellatedVertex::SetPointIndex ******/
		/****** md5 signature: d2ec91e466a2f8f8fdf2aeca243c7133 ******/
		%feature("compactdefaultargs") SetPointIndex;
		%feature("autodoc", "
Parameters
----------
thePointIndex: int

Return
-------
None

Description
-----------
Sets field PointIndex.
") SetPointIndex;
		void SetPointIndex(const int thePointIndex);

		/****** StepVisual_TessellatedVertex::SetTopologicalLink ******/
		/****** md5 signature: 7eb4225ce032f77d5e9072cb2c704a14 ******/
		%feature("compactdefaultargs") SetTopologicalLink;
		%feature("autodoc", "
Parameters
----------
theTopologicalLink: StepShape_VertexPoint

Return
-------
None

Description
-----------
Sets field TopologicalLink.
") SetTopologicalLink;
		void SetTopologicalLink(const opencascade::handle<StepShape_VertexPoint> & theTopologicalLink);

		/****** StepVisual_TessellatedVertex::TopologicalLink ******/
		/****** md5 signature: 0e6978ef7ce1b6573c8c8c73bbfcc600 ******/
		%feature("compactdefaultargs") TopologicalLink;
		%feature("autodoc", "Return
-------
opencascade::handle<StepShape_VertexPoint>

Description
-----------
Returns field TopologicalLink.
") TopologicalLink;
		opencascade::handle<StepShape_VertexPoint> TopologicalLink();

};


%make_alias(StepVisual_TessellatedVertex)

%extend StepVisual_TessellatedVertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class StepVisual_TriangulatedSurfaceSet *
******************************************/
class StepVisual_TriangulatedSurfaceSet : public StepVisual_TessellatedSurfaceSet {
	public:
		/****** StepVisual_TriangulatedSurfaceSet::StepVisual_TriangulatedSurfaceSet ******/
		/****** md5 signature: 32db05e1a02d1f6fbe879157f6382766 ******/
		%feature("compactdefaultargs") StepVisual_TriangulatedSurfaceSet;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepVisual_TriangulatedSurfaceSet;
		 StepVisual_TriangulatedSurfaceSet();

		/****** StepVisual_TriangulatedSurfaceSet::Init ******/
		/****** md5 signature: 3d1030f357ad817b950a02613c467c08 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItemName: TCollection_HAsciiString
theTessellatedFaceCoordinates: StepVisual_CoordinatesList
theTessellatedFacePnmax: int
theTessellatedFaceNormals: TColStd_HArray2OfReal
thePnindex: TColStd_HArray1OfInteger
theTriangles: TColStd_HArray2OfInteger

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItemName, const opencascade::handle<StepVisual_CoordinatesList> & theTessellatedFaceCoordinates, const int theTessellatedFacePnmax, const opencascade::handle<TColStd_HArray2OfReal> & theTessellatedFaceNormals, const opencascade::handle<TColStd_HArray1OfInteger> & thePnindex, const opencascade::handle<TColStd_HArray2OfInteger> & theTriangles);

		/****** StepVisual_TriangulatedSurfaceSet::NbPnindex ******/
		/****** md5 signature: fa0390b522536d32c57fd2258eaae3dc ******/
		%feature("compactdefaultargs") NbPnindex;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of Pnindex.
") NbPnindex;
		int NbPnindex();

		/****** StepVisual_TriangulatedSurfaceSet::NbTriangles ******/
		/****** md5 signature: f8c321c40dc1f5710c6325a5eef3d9fe ******/
		%feature("compactdefaultargs") NbTriangles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of Triangles.
") NbTriangles;
		int NbTriangles();

		/****** StepVisual_TriangulatedSurfaceSet::Pnindex ******/
		/****** md5 signature: 2440001bbf672588ad2f48f99bd99b83 ******/
		%feature("compactdefaultargs") Pnindex;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfInteger>

Description
-----------
Returns field Pnindex.
") Pnindex;
		const opencascade::handle<TColStd_HArray1OfInteger> Pnindex();

		/****** StepVisual_TriangulatedSurfaceSet::PnindexValue ******/
		/****** md5 signature: 48ee39bad81e98bebf477adb861fdae9 ******/
		%feature("compactdefaultargs") PnindexValue;
		%feature("autodoc", "
Parameters
----------
theNum: int

Return
-------
int

Description
-----------
Returns value of Pnindex by its num.
") PnindexValue;
		int PnindexValue(const int theNum);

		/****** StepVisual_TriangulatedSurfaceSet::SetPnindex ******/
		/****** md5 signature: 6b9fb1f707a973e37b1ea695d19c3325 ******/
		%feature("compactdefaultargs") SetPnindex;
		%feature("autodoc", "
Parameters
----------
thePnindex: TColStd_HArray1OfInteger

Return
-------
None

Description
-----------
Sets field Pnindex.
") SetPnindex;
		void SetPnindex(const opencascade::handle<TColStd_HArray1OfInteger> & thePnindex);

		/****** StepVisual_TriangulatedSurfaceSet::SetTriangles ******/
		/****** md5 signature: bdfa5d865618047131b00f3c66c56d3b ******/
		%feature("compactdefaultargs") SetTriangles;
		%feature("autodoc", "
Parameters
----------
theTriangles: TColStd_HArray2OfInteger

Return
-------
None

Description
-----------
Sets field Triangles.
") SetTriangles;
		void SetTriangles(const opencascade::handle<TColStd_HArray2OfInteger> & theTriangles);

		/****** StepVisual_TriangulatedSurfaceSet::Triangles ******/
		/****** md5 signature: b1fa554825d4d01801e65feb5313ad4d ******/
		%feature("compactdefaultargs") Triangles;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray2OfInteger>

Description
-----------
Returns field Triangles.
") Triangles;
		const opencascade::handle<TColStd_HArray2OfInteger> Triangles();

};


%make_alias(StepVisual_TriangulatedSurfaceSet)

%extend StepVisual_TriangulatedSurfaceSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************************
* class StepVisual_AnnotationCurveOccurrenceAndGeomReprItem *
************************************************************/
class StepVisual_AnnotationCurveOccurrenceAndGeomReprItem : public StepVisual_AnnotationCurveOccurrence {
	public:
		/****** StepVisual_AnnotationCurveOccurrenceAndGeomReprItem::StepVisual_AnnotationCurveOccurrenceAndGeomReprItem ******/
		/****** md5 signature: 61da7f9ce3b786d730625e38c0f52ef7 ******/
		%feature("compactdefaultargs") StepVisual_AnnotationCurveOccurrenceAndGeomReprItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepVisual_AnnotationCurveOccurrenceAndGeomReprItem;
		 StepVisual_AnnotationCurveOccurrenceAndGeomReprItem();

};


%make_alias(StepVisual_AnnotationCurveOccurrenceAndGeomReprItem)

%extend StepVisual_AnnotationCurveOccurrenceAndGeomReprItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class StepVisual_ComplexTriangulatedFace *
*******************************************/
class StepVisual_ComplexTriangulatedFace : public StepVisual_TessellatedFace {
	public:
		/****** StepVisual_ComplexTriangulatedFace::StepVisual_ComplexTriangulatedFace ******/
		/****** md5 signature: 1626ac3c9d7cefb979edad870659935d ******/
		%feature("compactdefaultargs") StepVisual_ComplexTriangulatedFace;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepVisual_ComplexTriangulatedFace;
		 StepVisual_ComplexTriangulatedFace();

		/****** StepVisual_ComplexTriangulatedFace::Init ******/
		/****** md5 signature: d2f91d2bf90d1b3a2a0a8a04ab815e5e ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theTessellatedFace_Coordinates: StepVisual_CoordinatesList
theTessellatedFace_Pnmax: int
theTessellatedFace_Normals: TColStd_HArray2OfReal
theHasTessellatedFace_GeometricLink: bool
theTessellatedFace_GeometricLink: StepVisual_FaceOrSurface
thePnindex: TColStd_HArray1OfInteger
theTriangleStrips: TColStd_HArray1OfTransient
theTriangleFans: TColStd_HArray1OfTransient

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepVisual_CoordinatesList> & theTessellatedFace_Coordinates, const int theTessellatedFace_Pnmax, const opencascade::handle<TColStd_HArray2OfReal> & theTessellatedFace_Normals, const bool theHasTessellatedFace_GeometricLink, const StepVisual_FaceOrSurface & theTessellatedFace_GeometricLink, const opencascade::handle<TColStd_HArray1OfInteger> & thePnindex, const opencascade::handle<TColStd_HArray1OfTransient > & theTriangleStrips, const opencascade::handle<TColStd_HArray1OfTransient > & theTriangleFans);

		/****** StepVisual_ComplexTriangulatedFace::NbPnindex ******/
		/****** md5 signature: fa0390b522536d32c57fd2258eaae3dc ******/
		%feature("compactdefaultargs") NbPnindex;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of Pnindex.
") NbPnindex;
		int NbPnindex();

		/****** StepVisual_ComplexTriangulatedFace::NbTriangleFans ******/
		/****** md5 signature: 9b57e4a36b65f1c3d38a8964c33db1e8 ******/
		%feature("compactdefaultargs") NbTriangleFans;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of TriangleFans.
") NbTriangleFans;
		int NbTriangleFans();

		/****** StepVisual_ComplexTriangulatedFace::NbTriangleStrips ******/
		/****** md5 signature: 7728d0f4aa103c83439c219d7bffb985 ******/
		%feature("compactdefaultargs") NbTriangleStrips;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of TriangleStrips.
") NbTriangleStrips;
		int NbTriangleStrips();

		/****** StepVisual_ComplexTriangulatedFace::Pnindex ******/
		/****** md5 signature: 09e8994aba918b05d67109a1b6cb169f ******/
		%feature("compactdefaultargs") Pnindex;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfInteger>

Description
-----------
Returns field Pnindex.
") Pnindex;
		opencascade::handle<TColStd_HArray1OfInteger> Pnindex();

		/****** StepVisual_ComplexTriangulatedFace::PnindexValue ******/
		/****** md5 signature: 48ee39bad81e98bebf477adb861fdae9 ******/
		%feature("compactdefaultargs") PnindexValue;
		%feature("autodoc", "
Parameters
----------
theNum: int

Return
-------
int

Description
-----------
Returns value of Pnindex by its num.
") PnindexValue;
		int PnindexValue(const int theNum);

		/****** StepVisual_ComplexTriangulatedFace::SetPnindex ******/
		/****** md5 signature: 6b1df731da4f31c7c40911228c1c4e69 ******/
		%feature("compactdefaultargs") SetPnindex;
		%feature("autodoc", "
Parameters
----------
thePnindex: TColStd_HArray1OfInteger

Return
-------
None

Description
-----------
Sets field Pnindex.
") SetPnindex;
		void SetPnindex(const opencascade::handle<TColStd_HArray1OfInteger> & thePnindex);

		/****** StepVisual_ComplexTriangulatedFace::SetTriangleFans ******/
		/****** md5 signature: 97555164e55acbc445db5108ed5e4f5d ******/
		%feature("compactdefaultargs") SetTriangleFans;
		%feature("autodoc", "
Parameters
----------
theTriangleFans: TColStd_HArray1OfTransient

Return
-------
None

Description
-----------
Sets field TriangleFans.
") SetTriangleFans;
		void SetTriangleFans(const opencascade::handle<TColStd_HArray1OfTransient > & theTriangleFans);

		/****** StepVisual_ComplexTriangulatedFace::SetTriangleStrips ******/
		/****** md5 signature: f9e564016d990ea902d6179d6d59b86d ******/
		%feature("compactdefaultargs") SetTriangleStrips;
		%feature("autodoc", "
Parameters
----------
theTriangleStrips: TColStd_HArray1OfTransient

Return
-------
None

Description
-----------
Sets field TriangleStrips.
") SetTriangleStrips;
		void SetTriangleStrips(const opencascade::handle<TColStd_HArray1OfTransient > & theTriangleStrips);

		/****** StepVisual_ComplexTriangulatedFace::TriangleFans ******/
		/****** md5 signature: 784e501cc34d4419979a45bb8211121f ******/
		%feature("compactdefaultargs") TriangleFans;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfTransient>

Description
-----------
Returns field TriangleFans.
") TriangleFans;
		opencascade::handle<TColStd_HArray1OfTransient> TriangleFans();

		/****** StepVisual_ComplexTriangulatedFace::TriangleStrips ******/
		/****** md5 signature: e3466b34e9c2635ab287cc9c74f97401 ******/
		%feature("compactdefaultargs") TriangleStrips;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfTransient>

Description
-----------
Returns field TriangleStrips.
") TriangleStrips;
		opencascade::handle<TColStd_HArray1OfTransient> TriangleStrips();

};


%make_alias(StepVisual_ComplexTriangulatedFace)

%extend StepVisual_ComplexTriangulatedFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class StepVisual_CubicBezierTessellatedEdge *
**********************************************/
class StepVisual_CubicBezierTessellatedEdge : public StepVisual_TessellatedEdge {
	public:
		/****** StepVisual_CubicBezierTessellatedEdge::StepVisual_CubicBezierTessellatedEdge ******/
		/****** md5 signature: 6a2d50c9d1d51ecb59aae29dbe2ea1d5 ******/
		%feature("compactdefaultargs") StepVisual_CubicBezierTessellatedEdge;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepVisual_CubicBezierTessellatedEdge;
		 StepVisual_CubicBezierTessellatedEdge();

};


%make_alias(StepVisual_CubicBezierTessellatedEdge)

%extend StepVisual_CubicBezierTessellatedEdge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class StepVisual_CubicBezierTriangulatedFace *
***********************************************/
class StepVisual_CubicBezierTriangulatedFace : public StepVisual_TessellatedFace {
	public:
		/****** StepVisual_CubicBezierTriangulatedFace::StepVisual_CubicBezierTriangulatedFace ******/
		/****** md5 signature: f1c7ee7f1d108a679ab8eabfd2ccba42 ******/
		%feature("compactdefaultargs") StepVisual_CubicBezierTriangulatedFace;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepVisual_CubicBezierTriangulatedFace;
		 StepVisual_CubicBezierTriangulatedFace();

		/****** StepVisual_CubicBezierTriangulatedFace::Ctriangles ******/
		/****** md5 signature: c8c1f264f724c1b5a53be4ee86d13c1b ******/
		%feature("compactdefaultargs") Ctriangles;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray2OfInteger>

Description
-----------
Returns field Ctriangles.
") Ctriangles;
		opencascade::handle<TColStd_HArray2OfInteger> Ctriangles();

		/****** StepVisual_CubicBezierTriangulatedFace::Init ******/
		/****** md5 signature: eb439903c040c83f3b175717c2bda1e9 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theTessellatedFace_Coordinates: StepVisual_CoordinatesList
theTessellatedFace_Pnmax: int
theTessellatedFace_Normals: TColStd_HArray2OfReal
theHasTessellatedFace_GeometricLink: bool
theTessellatedFace_GeometricLink: StepVisual_FaceOrSurface
theCtriangles: TColStd_HArray2OfInteger

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepVisual_CoordinatesList> & theTessellatedFace_Coordinates, const int theTessellatedFace_Pnmax, const opencascade::handle<TColStd_HArray2OfReal> & theTessellatedFace_Normals, const bool theHasTessellatedFace_GeometricLink, const StepVisual_FaceOrSurface & theTessellatedFace_GeometricLink, const opencascade::handle<TColStd_HArray2OfInteger> & theCtriangles);

		/****** StepVisual_CubicBezierTriangulatedFace::NbCtriangles ******/
		/****** md5 signature: cf60e2a33a49199b1dd1aea23c21c07b ******/
		%feature("compactdefaultargs") NbCtriangles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of Ctriangles.
") NbCtriangles;
		int NbCtriangles();

		/****** StepVisual_CubicBezierTriangulatedFace::SetCtriangles ******/
		/****** md5 signature: 65f72c0177f28a50e6bab0a1ad491d98 ******/
		%feature("compactdefaultargs") SetCtriangles;
		%feature("autodoc", "
Parameters
----------
theCtriangles: TColStd_HArray2OfInteger

Return
-------
None

Description
-----------
Sets field Ctriangles.
") SetCtriangles;
		void SetCtriangles(const opencascade::handle<TColStd_HArray2OfInteger> & theCtriangles);

};


%make_alias(StepVisual_CubicBezierTriangulatedFace)

%extend StepVisual_CubicBezierTriangulatedFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class StepVisual_TessellatedConnectingEdge *
*********************************************/
class StepVisual_TessellatedConnectingEdge : public StepVisual_TessellatedEdge {
	public:
		/****** StepVisual_TessellatedConnectingEdge::StepVisual_TessellatedConnectingEdge ******/
		/****** md5 signature: e1448ecb17e19e47f146c708cf99a3ca ******/
		%feature("compactdefaultargs") StepVisual_TessellatedConnectingEdge;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepVisual_TessellatedConnectingEdge;
		 StepVisual_TessellatedConnectingEdge();

		/****** StepVisual_TessellatedConnectingEdge::Face1 ******/
		/****** md5 signature: c59628c5eef69eeffa774f97edd8c9d6 ******/
		%feature("compactdefaultargs") Face1;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_TessellatedFace>

Description
-----------
Returns field Face1.
") Face1;
		opencascade::handle<StepVisual_TessellatedFace> Face1();

		/****** StepVisual_TessellatedConnectingEdge::Face2 ******/
		/****** md5 signature: 8b18a8f8498482930f6cca4385e2359e ******/
		%feature("compactdefaultargs") Face2;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_TessellatedFace>

Description
-----------
Returns field Face2.
") Face2;
		opencascade::handle<StepVisual_TessellatedFace> Face2();

		/****** StepVisual_TessellatedConnectingEdge::Init ******/
		/****** md5 signature: 8a4aa08889da437910d3362527c8abcd ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theTessellatedEdge_Coordinates: StepVisual_CoordinatesList
theHasTessellatedEdge_GeometricLink: bool
theTessellatedEdge_GeometricLink: StepVisual_EdgeOrCurve
theTessellatedEdge_LineStrip: TColStd_HArray1OfInteger
theSmooth: StepData_Logical
theFace1: StepVisual_TessellatedFace
theFace2: StepVisual_TessellatedFace
theLineStripFace1: TColStd_HArray1OfInteger
theLineStripFace2: TColStd_HArray1OfInteger

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepVisual_CoordinatesList> & theTessellatedEdge_Coordinates, const bool theHasTessellatedEdge_GeometricLink, const StepVisual_EdgeOrCurve & theTessellatedEdge_GeometricLink, const opencascade::handle<TColStd_HArray1OfInteger> & theTessellatedEdge_LineStrip, const StepData_Logical theSmooth, const opencascade::handle<StepVisual_TessellatedFace> & theFace1, const opencascade::handle<StepVisual_TessellatedFace> & theFace2, const opencascade::handle<TColStd_HArray1OfInteger> & theLineStripFace1, const opencascade::handle<TColStd_HArray1OfInteger> & theLineStripFace2);

		/****** StepVisual_TessellatedConnectingEdge::LineStripFace1 ******/
		/****** md5 signature: 5514765089937cb19a11d57eba9649fd ******/
		%feature("compactdefaultargs") LineStripFace1;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfInteger>

Description
-----------
Returns field LineStripFace1.
") LineStripFace1;
		opencascade::handle<TColStd_HArray1OfInteger> LineStripFace1();

		/****** StepVisual_TessellatedConnectingEdge::LineStripFace1Value ******/
		/****** md5 signature: 7fb74fd6d5ae2615ec91efab8e830dda ******/
		%feature("compactdefaultargs") LineStripFace1Value;
		%feature("autodoc", "
Parameters
----------
theNum: int

Return
-------
int

Description
-----------
Returns value of LineStripFace1 by its num.
") LineStripFace1Value;
		int LineStripFace1Value(const int theNum);

		/****** StepVisual_TessellatedConnectingEdge::LineStripFace2 ******/
		/****** md5 signature: 0d5ba2acb1880749d4aba187064dc3b9 ******/
		%feature("compactdefaultargs") LineStripFace2;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfInteger>

Description
-----------
Returns field LineStripFace2.
") LineStripFace2;
		opencascade::handle<TColStd_HArray1OfInteger> LineStripFace2();

		/****** StepVisual_TessellatedConnectingEdge::LineStripFace2Value ******/
		/****** md5 signature: b277192f37198e3bdea2e433b74e134a ******/
		%feature("compactdefaultargs") LineStripFace2Value;
		%feature("autodoc", "
Parameters
----------
theNum: int

Return
-------
int

Description
-----------
Returns value of LineStripFace2 by its num.
") LineStripFace2Value;
		int LineStripFace2Value(const int theNum);

		/****** StepVisual_TessellatedConnectingEdge::NbLineStripFace1 ******/
		/****** md5 signature: 3542a7912fc052389db08812bb16448f ******/
		%feature("compactdefaultargs") NbLineStripFace1;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of LineStripFace1.
") NbLineStripFace1;
		int NbLineStripFace1();

		/****** StepVisual_TessellatedConnectingEdge::NbLineStripFace2 ******/
		/****** md5 signature: 77f458a2de2af2ae999f14b86e7c1ea4 ******/
		%feature("compactdefaultargs") NbLineStripFace2;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of LineStripFace2.
") NbLineStripFace2;
		int NbLineStripFace2();

		/****** StepVisual_TessellatedConnectingEdge::SetFace1 ******/
		/****** md5 signature: cbae07fafdf9bee2009c474118199284 ******/
		%feature("compactdefaultargs") SetFace1;
		%feature("autodoc", "
Parameters
----------
theFace1: StepVisual_TessellatedFace

Return
-------
None

Description
-----------
Sets field Face1.
") SetFace1;
		void SetFace1(const opencascade::handle<StepVisual_TessellatedFace> & theFace1);

		/****** StepVisual_TessellatedConnectingEdge::SetFace2 ******/
		/****** md5 signature: bcf0ccbb96a6fd4d59c7320522ee5788 ******/
		%feature("compactdefaultargs") SetFace2;
		%feature("autodoc", "
Parameters
----------
theFace2: StepVisual_TessellatedFace

Return
-------
None

Description
-----------
Sets field Face2.
") SetFace2;
		void SetFace2(const opencascade::handle<StepVisual_TessellatedFace> & theFace2);

		/****** StepVisual_TessellatedConnectingEdge::SetLineStripFace1 ******/
		/****** md5 signature: 9058b860b2a55fc5a1d7122e011f419c ******/
		%feature("compactdefaultargs") SetLineStripFace1;
		%feature("autodoc", "
Parameters
----------
theLineStripFace1: TColStd_HArray1OfInteger

Return
-------
None

Description
-----------
Sets field LineStripFace1.
") SetLineStripFace1;
		void SetLineStripFace1(const opencascade::handle<TColStd_HArray1OfInteger> & theLineStripFace1);

		/****** StepVisual_TessellatedConnectingEdge::SetLineStripFace2 ******/
		/****** md5 signature: 3aa7f10b918cc0fbcbee6fd78f923d02 ******/
		%feature("compactdefaultargs") SetLineStripFace2;
		%feature("autodoc", "
Parameters
----------
theLineStripFace2: TColStd_HArray1OfInteger

Return
-------
None

Description
-----------
Sets field LineStripFace2.
") SetLineStripFace2;
		void SetLineStripFace2(const opencascade::handle<TColStd_HArray1OfInteger> & theLineStripFace2);

		/****** StepVisual_TessellatedConnectingEdge::SetSmooth ******/
		/****** md5 signature: 87175ba25d9b6c8a69467c8ddf380c38 ******/
		%feature("compactdefaultargs") SetSmooth;
		%feature("autodoc", "
Parameters
----------
theSmooth: StepData_Logical

Return
-------
None

Description
-----------
Sets field Smooth.
") SetSmooth;
		void SetSmooth(const StepData_Logical theSmooth);

		/****** StepVisual_TessellatedConnectingEdge::Smooth ******/
		/****** md5 signature: 25e54a525a1ab2adc3ec5f5328ebdf72 ******/
		%feature("compactdefaultargs") Smooth;
		%feature("autodoc", "Return
-------
StepData_Logical

Description
-----------
Returns field Smooth.
") Smooth;
		StepData_Logical Smooth();

};


%make_alias(StepVisual_TessellatedConnectingEdge)

%extend StepVisual_TessellatedConnectingEdge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class StepVisual_TriangulatedFace *
************************************/
class StepVisual_TriangulatedFace : public StepVisual_TessellatedFace {
	public:
		/****** StepVisual_TriangulatedFace::StepVisual_TriangulatedFace ******/
		/****** md5 signature: 5403f9acccbdc71b03956b04a3a0adc4 ******/
		%feature("compactdefaultargs") StepVisual_TriangulatedFace;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default constructor.
") StepVisual_TriangulatedFace;
		 StepVisual_TriangulatedFace();

		/****** StepVisual_TriangulatedFace::Init ******/
		/****** md5 signature: c4ecb1e7ec937055e3b3582cbcf1fd0c ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theTessellatedFace_Coordinates: StepVisual_CoordinatesList
theTessellatedFace_Pnmax: int
theTessellatedFace_Normals: TColStd_HArray2OfReal
theHasTessellatedFace_GeometricLink: bool
theTessellatedFace_GeometricLink: StepVisual_FaceOrSurface
thePnindex: TColStd_HArray1OfInteger
theTriangles: TColStd_HArray2OfInteger

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepVisual_CoordinatesList> & theTessellatedFace_Coordinates, const int theTessellatedFace_Pnmax, const opencascade::handle<TColStd_HArray2OfReal> & theTessellatedFace_Normals, const bool theHasTessellatedFace_GeometricLink, const StepVisual_FaceOrSurface & theTessellatedFace_GeometricLink, const opencascade::handle<TColStd_HArray1OfInteger> & thePnindex, const opencascade::handle<TColStd_HArray2OfInteger> & theTriangles);

		/****** StepVisual_TriangulatedFace::NbPnindex ******/
		/****** md5 signature: fa0390b522536d32c57fd2258eaae3dc ******/
		%feature("compactdefaultargs") NbPnindex;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of Pnindex.
") NbPnindex;
		int NbPnindex();

		/****** StepVisual_TriangulatedFace::NbTriangles ******/
		/****** md5 signature: f8c321c40dc1f5710c6325a5eef3d9fe ******/
		%feature("compactdefaultargs") NbTriangles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of Triangles.
") NbTriangles;
		int NbTriangles();

		/****** StepVisual_TriangulatedFace::Pnindex ******/
		/****** md5 signature: 09e8994aba918b05d67109a1b6cb169f ******/
		%feature("compactdefaultargs") Pnindex;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfInteger>

Description
-----------
Returns field Pnindex.
") Pnindex;
		opencascade::handle<TColStd_HArray1OfInteger> Pnindex();

		/****** StepVisual_TriangulatedFace::PnindexValue ******/
		/****** md5 signature: 48ee39bad81e98bebf477adb861fdae9 ******/
		%feature("compactdefaultargs") PnindexValue;
		%feature("autodoc", "
Parameters
----------
theNum: int

Return
-------
int

Description
-----------
Returns value of Pnindex by its num.
") PnindexValue;
		int PnindexValue(const int theNum);

		/****** StepVisual_TriangulatedFace::SetPnindex ******/
		/****** md5 signature: 6b1df731da4f31c7c40911228c1c4e69 ******/
		%feature("compactdefaultargs") SetPnindex;
		%feature("autodoc", "
Parameters
----------
thePnindex: TColStd_HArray1OfInteger

Return
-------
None

Description
-----------
Sets field Pnindex.
") SetPnindex;
		void SetPnindex(const opencascade::handle<TColStd_HArray1OfInteger> & thePnindex);

		/****** StepVisual_TriangulatedFace::SetTriangles ******/
		/****** md5 signature: c901f5a07774e6eebcbc7be1600b7bc3 ******/
		%feature("compactdefaultargs") SetTriangles;
		%feature("autodoc", "
Parameters
----------
theTriangles: TColStd_HArray2OfInteger

Return
-------
None

Description
-----------
Sets field Triangles.
") SetTriangles;
		void SetTriangles(const opencascade::handle<TColStd_HArray2OfInteger> & theTriangles);

		/****** StepVisual_TriangulatedFace::Triangles ******/
		/****** md5 signature: 746f1d66f2feb5f284875cbb09b5e4d7 ******/
		%feature("compactdefaultargs") Triangles;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray2OfInteger>

Description
-----------
Returns field Triangles.
") Triangles;
		opencascade::handle<TColStd_HArray2OfInteger> Triangles();

};


%make_alias(StepVisual_TriangulatedFace)

%extend StepVisual_TriangulatedFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */

class StepVisual_HArray1OfAnnotationPlaneElement : public NCollection_Array1<StepVisual_AnnotationPlaneElement>, public Standard_Transient {
  public:
    StepVisual_HArray1OfAnnotationPlaneElement(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfAnnotationPlaneElement(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<StepVisual_AnnotationPlaneElement>::value_type& theValue);
    StepVisual_HArray1OfAnnotationPlaneElement(const NCollection_Array1<StepVisual_AnnotationPlaneElement>& theOther);
    const NCollection_Array1<StepVisual_AnnotationPlaneElement>& Array1();
    NCollection_Array1<StepVisual_AnnotationPlaneElement>& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfAnnotationPlaneElement)


class StepVisual_HArray1OfBoxCharacteristicSelect : public NCollection_Array1<StepVisual_BoxCharacteristicSelect>, public Standard_Transient {
  public:
    StepVisual_HArray1OfBoxCharacteristicSelect(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfBoxCharacteristicSelect(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<StepVisual_BoxCharacteristicSelect>::value_type& theValue);
    StepVisual_HArray1OfBoxCharacteristicSelect(const NCollection_Array1<StepVisual_BoxCharacteristicSelect>& theOther);
    const NCollection_Array1<StepVisual_BoxCharacteristicSelect>& Array1();
    NCollection_Array1<StepVisual_BoxCharacteristicSelect>& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfBoxCharacteristicSelect)


class StepVisual_HArray1OfCameraModelD3MultiClippingInterectionSelect : public NCollection_Array1<StepVisual_CameraModelD3MultiClippingInterectionSelect>, public Standard_Transient {
  public:
    StepVisual_HArray1OfCameraModelD3MultiClippingInterectionSelect(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfCameraModelD3MultiClippingInterectionSelect(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<StepVisual_CameraModelD3MultiClippingInterectionSelect>::value_type& theValue);
    StepVisual_HArray1OfCameraModelD3MultiClippingInterectionSelect(const NCollection_Array1<StepVisual_CameraModelD3MultiClippingInterectionSelect>& theOther);
    const NCollection_Array1<StepVisual_CameraModelD3MultiClippingInterectionSelect>& Array1();
    NCollection_Array1<StepVisual_CameraModelD3MultiClippingInterectionSelect>& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfCameraModelD3MultiClippingInterectionSelect)


class StepVisual_HArray1OfCameraModelD3MultiClippingUnionSelect : public NCollection_Array1<StepVisual_CameraModelD3MultiClippingUnionSelect>, public Standard_Transient {
  public:
    StepVisual_HArray1OfCameraModelD3MultiClippingUnionSelect(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfCameraModelD3MultiClippingUnionSelect(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<StepVisual_CameraModelD3MultiClippingUnionSelect>::value_type& theValue);
    StepVisual_HArray1OfCameraModelD3MultiClippingUnionSelect(const NCollection_Array1<StepVisual_CameraModelD3MultiClippingUnionSelect>& theOther);
    const NCollection_Array1<StepVisual_CameraModelD3MultiClippingUnionSelect>& Array1();
    NCollection_Array1<StepVisual_CameraModelD3MultiClippingUnionSelect>& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfCameraModelD3MultiClippingUnionSelect)


class StepVisual_HArray1OfCurveStyleFontPattern : public NCollection_Array1<opencascade::handle<StepVisual_CurveStyleFontPattern>>, public Standard_Transient {
  public:
    StepVisual_HArray1OfCurveStyleFontPattern(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfCurveStyleFontPattern(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<opencascade::handle<StepVisual_CurveStyleFontPattern>>::value_type& theValue);
    StepVisual_HArray1OfCurveStyleFontPattern(const NCollection_Array1<opencascade::handle<StepVisual_CurveStyleFontPattern>>& theOther);
    const NCollection_Array1<opencascade::handle<StepVisual_CurveStyleFontPattern>>& Array1();
    NCollection_Array1<opencascade::handle<StepVisual_CurveStyleFontPattern>>& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfCurveStyleFontPattern)


class StepVisual_HArray1OfDirectionCountSelect : public NCollection_Array1<StepVisual_DirectionCountSelect>, public Standard_Transient {
  public:
    StepVisual_HArray1OfDirectionCountSelect(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfDirectionCountSelect(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<StepVisual_DirectionCountSelect>::value_type& theValue);
    StepVisual_HArray1OfDirectionCountSelect(const NCollection_Array1<StepVisual_DirectionCountSelect>& theOther);
    const NCollection_Array1<StepVisual_DirectionCountSelect>& Array1();
    NCollection_Array1<StepVisual_DirectionCountSelect>& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfDirectionCountSelect)


class StepVisual_HArray1OfDraughtingCalloutElement : public NCollection_Array1<StepVisual_DraughtingCalloutElement>, public Standard_Transient {
  public:
    StepVisual_HArray1OfDraughtingCalloutElement(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfDraughtingCalloutElement(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<StepVisual_DraughtingCalloutElement>::value_type& theValue);
    StepVisual_HArray1OfDraughtingCalloutElement(const NCollection_Array1<StepVisual_DraughtingCalloutElement>& theOther);
    const NCollection_Array1<StepVisual_DraughtingCalloutElement>& Array1();
    NCollection_Array1<StepVisual_DraughtingCalloutElement>& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfDraughtingCalloutElement)


class StepVisual_HArray1OfFillStyleSelect : public NCollection_Array1<StepVisual_FillStyleSelect>, public Standard_Transient {
  public:
    StepVisual_HArray1OfFillStyleSelect(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfFillStyleSelect(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<StepVisual_FillStyleSelect>::value_type& theValue);
    StepVisual_HArray1OfFillStyleSelect(const NCollection_Array1<StepVisual_FillStyleSelect>& theOther);
    const NCollection_Array1<StepVisual_FillStyleSelect>& Array1();
    NCollection_Array1<StepVisual_FillStyleSelect>& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfFillStyleSelect)


class StepVisual_HArray1OfInvisibleItem : public NCollection_Array1<StepVisual_InvisibleItem>, public Standard_Transient {
  public:
    StepVisual_HArray1OfInvisibleItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfInvisibleItem(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<StepVisual_InvisibleItem>::value_type& theValue);
    StepVisual_HArray1OfInvisibleItem(const NCollection_Array1<StepVisual_InvisibleItem>& theOther);
    const NCollection_Array1<StepVisual_InvisibleItem>& Array1();
    NCollection_Array1<StepVisual_InvisibleItem>& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfInvisibleItem)


class StepVisual_HArray1OfLayeredItem : public NCollection_Array1<StepVisual_LayeredItem>, public Standard_Transient {
  public:
    StepVisual_HArray1OfLayeredItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfLayeredItem(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<StepVisual_LayeredItem>::value_type& theValue);
    StepVisual_HArray1OfLayeredItem(const NCollection_Array1<StepVisual_LayeredItem>& theOther);
    const NCollection_Array1<StepVisual_LayeredItem>& Array1();
    NCollection_Array1<StepVisual_LayeredItem>& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfLayeredItem)


class StepVisual_HArray1OfPresentationStyleAssignment : public NCollection_Array1<opencascade::handle<StepVisual_PresentationStyleAssignment>>, public Standard_Transient {
  public:
    StepVisual_HArray1OfPresentationStyleAssignment(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfPresentationStyleAssignment(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<opencascade::handle<StepVisual_PresentationStyleAssignment>>::value_type& theValue);
    StepVisual_HArray1OfPresentationStyleAssignment(const NCollection_Array1<opencascade::handle<StepVisual_PresentationStyleAssignment>>& theOther);
    const NCollection_Array1<opencascade::handle<StepVisual_PresentationStyleAssignment>>& Array1();
    NCollection_Array1<opencascade::handle<StepVisual_PresentationStyleAssignment>>& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfPresentationStyleAssignment)


class StepVisual_HArray1OfPresentationStyleSelect : public NCollection_Array1<StepVisual_PresentationStyleSelect>, public Standard_Transient {
  public:
    StepVisual_HArray1OfPresentationStyleSelect(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfPresentationStyleSelect(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<StepVisual_PresentationStyleSelect>::value_type& theValue);
    StepVisual_HArray1OfPresentationStyleSelect(const NCollection_Array1<StepVisual_PresentationStyleSelect>& theOther);
    const NCollection_Array1<StepVisual_PresentationStyleSelect>& Array1();
    NCollection_Array1<StepVisual_PresentationStyleSelect>& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfPresentationStyleSelect)


class StepVisual_HArray1OfRenderingPropertiesSelect : public NCollection_Array1<StepVisual_RenderingPropertiesSelect>, public Standard_Transient {
  public:
    StepVisual_HArray1OfRenderingPropertiesSelect(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfRenderingPropertiesSelect(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<StepVisual_RenderingPropertiesSelect>::value_type& theValue);
    StepVisual_HArray1OfRenderingPropertiesSelect(const NCollection_Array1<StepVisual_RenderingPropertiesSelect>& theOther);
    const NCollection_Array1<StepVisual_RenderingPropertiesSelect>& Array1();
    NCollection_Array1<StepVisual_RenderingPropertiesSelect>& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfRenderingPropertiesSelect)


class StepVisual_HArray1OfStyleContextSelect : public NCollection_Array1<StepVisual_StyleContextSelect>, public Standard_Transient {
  public:
    StepVisual_HArray1OfStyleContextSelect(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfStyleContextSelect(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<StepVisual_StyleContextSelect>::value_type& theValue);
    StepVisual_HArray1OfStyleContextSelect(const NCollection_Array1<StepVisual_StyleContextSelect>& theOther);
    const NCollection_Array1<StepVisual_StyleContextSelect>& Array1();
    NCollection_Array1<StepVisual_StyleContextSelect>& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfStyleContextSelect)


class StepVisual_HArray1OfSurfaceStyleElementSelect : public NCollection_Array1<StepVisual_SurfaceStyleElementSelect>, public Standard_Transient {
  public:
    StepVisual_HArray1OfSurfaceStyleElementSelect(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfSurfaceStyleElementSelect(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<StepVisual_SurfaceStyleElementSelect>::value_type& theValue);
    StepVisual_HArray1OfSurfaceStyleElementSelect(const NCollection_Array1<StepVisual_SurfaceStyleElementSelect>& theOther);
    const NCollection_Array1<StepVisual_SurfaceStyleElementSelect>& Array1();
    NCollection_Array1<StepVisual_SurfaceStyleElementSelect>& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfSurfaceStyleElementSelect)


class StepVisual_HArray1OfTessellatedEdgeOrVertex : public NCollection_Array1<StepVisual_TessellatedEdgeOrVertex>, public Standard_Transient {
  public:
    StepVisual_HArray1OfTessellatedEdgeOrVertex(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfTessellatedEdgeOrVertex(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<StepVisual_TessellatedEdgeOrVertex>::value_type& theValue);
    StepVisual_HArray1OfTessellatedEdgeOrVertex(const NCollection_Array1<StepVisual_TessellatedEdgeOrVertex>& theOther);
    const NCollection_Array1<StepVisual_TessellatedEdgeOrVertex>& Array1();
    NCollection_Array1<StepVisual_TessellatedEdgeOrVertex>& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfTessellatedEdgeOrVertex)


class StepVisual_HArray1OfTessellatedStructuredItem : public NCollection_Array1<opencascade::handle<StepVisual_TessellatedStructuredItem>>, public Standard_Transient {
  public:
    StepVisual_HArray1OfTessellatedStructuredItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfTessellatedStructuredItem(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<opencascade::handle<StepVisual_TessellatedStructuredItem>>::value_type& theValue);
    StepVisual_HArray1OfTessellatedStructuredItem(const NCollection_Array1<opencascade::handle<StepVisual_TessellatedStructuredItem>>& theOther);
    const NCollection_Array1<opencascade::handle<StepVisual_TessellatedStructuredItem>>& Array1();
    NCollection_Array1<opencascade::handle<StepVisual_TessellatedStructuredItem>>& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfTessellatedStructuredItem)


class StepVisual_HArray1OfTextOrCharacter : public NCollection_Array1<StepVisual_TextOrCharacter>, public Standard_Transient {
  public:
    StepVisual_HArray1OfTextOrCharacter(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfTextOrCharacter(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<StepVisual_TextOrCharacter>::value_type& theValue);
    StepVisual_HArray1OfTextOrCharacter(const NCollection_Array1<StepVisual_TextOrCharacter>& theOther);
    const NCollection_Array1<StepVisual_TextOrCharacter>& Array1();
    NCollection_Array1<StepVisual_TextOrCharacter>& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfTextOrCharacter)

/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
