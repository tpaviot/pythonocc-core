/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_stepvisual.html"
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
#include<TColStd_module.hxx>
#include<StepShape_module.hxx>
#include<StepData_module.hxx>
#include<StepRepr_module.hxx>
#include<StepGeom_module.hxx>
#include<TCollection_module.hxx>
#include<StepBasic_module.hxx>
#include<TColgp_module.hxx>
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
%import TColStd.i
%import StepShape.i
%import StepData.i
%import StepRepr.i
%import StepGeom.i
%import TCollection.i
%import StepBasic.i
%import TColgp.i

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
%wrap_handle(StepVisual_TessellatedEdge)
%wrap_handle(StepVisual_TessellatedFace)
%wrap_handle(StepVisual_TessellatedVertex)
%wrap_handle(StepVisual_AnnotationCurveOccurrenceAndGeomReprItem)
%wrap_handle(StepVisual_ComplexTriangulatedFace)
%wrap_handle(StepVisual_CubicBezierTessellatedEdge)
%wrap_handle(StepVisual_CubicBezierTriangulatedFace)
%wrap_handle(StepVisual_TessellatedConnectingEdge)
%wrap_handle(StepVisual_TriangulatedFace)
%wrap_handle(StepVisual_HArray1OfAnnotationPlaneElement)
%wrap_handle(StepVisual_HArray1OfBoxCharacteristicSelect)
%wrap_handle(StepVisual_HArray1OfCameraModelD3MultiClippingInterectionSelect)
%wrap_handle(StepVisual_HArray1OfCameraModelD3MultiClippingUnionSelect)
%wrap_handle(StepVisual_HArray1OfCurveStyleFontPattern)
%wrap_handle(StepVisual_HArray1OfDirectionCountSelect)
%wrap_handle(StepVisual_HArray1OfDraughtingCalloutElement)
%wrap_handle(StepVisual_HArray1OfFillStyleSelect)
%wrap_handle(StepVisual_HArray1OfInvisibleItem)
%wrap_handle(StepVisual_HArray1OfLayeredItem)
%wrap_handle(StepVisual_HArray1OfPresentationStyleAssignment)
%wrap_handle(StepVisual_HArray1OfPresentationStyleSelect)
%wrap_handle(StepVisual_HArray1OfRenderingPropertiesSelect)
%wrap_handle(StepVisual_HArray1OfStyleContextSelect)
%wrap_handle(StepVisual_HArray1OfSurfaceStyleElementSelect)
%wrap_handle(StepVisual_HArray1OfTessellatedEdgeOrVertex)
%wrap_handle(StepVisual_HArray1OfTessellatedStructuredItem)
%wrap_handle(StepVisual_HArray1OfTextOrCharacter)
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

%template(StepVisual_Array1OfTessellatedItem) NCollection_Array1<opencascade::handle<StepVisual_TessellatedItem>>;
Array1ExtendIter(opencascade::handle<StepVisual_TessellatedItem>)

%template(StepVisual_Array1OfTessellatedStructuredItem) NCollection_Array1<opencascade::handle<StepVisual_TessellatedStructuredItem>>;
Array1ExtendIter(opencascade::handle<StepVisual_TessellatedStructuredItem>)

%template(StepVisual_Array1OfTextOrCharacter) NCollection_Array1<StepVisual_TextOrCharacter>;
Array1ExtendIter(StepVisual_TextOrCharacter)

%template(StepVisual_VectorOfHSequenceOfInteger) NCollection_Vector<opencascade::handle<TColStd_HSequenceOfInteger>>;
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
typedef NCollection_Array1<opencascade::handle<StepVisual_TessellatedItem>> StepVisual_Array1OfTessellatedItem;
typedef NCollection_Array1<opencascade::handle<StepVisual_TessellatedStructuredItem>> StepVisual_Array1OfTessellatedStructuredItem;
typedef NCollection_Array1<StepVisual_TextOrCharacter> StepVisual_Array1OfTextOrCharacter;
typedef NCollection_Vector<opencascade::handle<TColStd_HSequenceOfInteger>> StepVisual_VectorOfHSequenceOfInteger;
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
		/****** md5 signature: f0e39118a9846e44ccd59de148215261 ******/
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
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

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
		/****** md5 signature: f0e39118a9846e44ccd59de148215261 ******/
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
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

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
		/****** md5 signature: 8a0c7a2ab7b53f6fb68a06ec0dbc6aa7 ******/
		%feature("compactdefaultargs") RealValue;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") RealValue;
		Standard_Real RealValue();

		/****** StepVisual_BoxCharacteristicSelect::SetRealValue ******/
		/****** md5 signature: b1a34c70efe46ae8de6ad173e999d614 ******/
		%feature("compactdefaultargs") SetRealValue;
		%feature("autodoc", "
Parameters
----------
aValue: float

Return
-------
None

Description
-----------
No available documentation.
") SetRealValue;
		void SetRealValue(const Standard_Real aValue);

		/****** StepVisual_BoxCharacteristicSelect::SetTypeOfContent ******/
		/****** md5 signature: d14a573f3748772e762e335529920c74 ******/
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
		void SetTypeOfContent(const Standard_Integer aType);

		/****** StepVisual_BoxCharacteristicSelect::TypeOfContent ******/
		/****** md5 signature: ca265bcca49d9306f069cd5137aa4464 ******/
		%feature("compactdefaultargs") TypeOfContent;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") TypeOfContent;
		Standard_Integer TypeOfContent();

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
		/****** md5 signature: f0e39118a9846e44ccd59de148215261 ******/
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
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

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
		/****** md5 signature: c7d69399b62c4f997e4ef95bf195487b ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theShapeClipping: StepVisual_HArray1OfCameraModelD3MultiClippingInterectionSelect

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<StepVisual_HArray1OfCameraModelD3MultiClippingInterectionSelect> & theShapeClipping);

		/****** StepVisual_CameraModelD3MultiClippingIntersection::SetShapeClipping ******/
		/****** md5 signature: d3f138def09366b1d4de0425b5fa7872 ******/
		%feature("compactdefaultargs") SetShapeClipping;
		%feature("autodoc", "
Parameters
----------
theShapeClipping: StepVisual_HArray1OfCameraModelD3MultiClippingInterectionSelect

Return
-------
None

Description
-----------
No available documentation.
") SetShapeClipping;
		void SetShapeClipping(const opencascade::handle<StepVisual_HArray1OfCameraModelD3MultiClippingInterectionSelect> & theShapeClipping);

		/****** StepVisual_CameraModelD3MultiClippingIntersection::ShapeClipping ******/
		/****** md5 signature: 6eb5c9a377534fa0b6410bb68e41bb5b ******/
		%feature("compactdefaultargs") ShapeClipping;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_HArray1OfCameraModelD3MultiClippingInterectionSelect>

Description
-----------
No available documentation.
") ShapeClipping;
		const opencascade::handle<StepVisual_HArray1OfCameraModelD3MultiClippingInterectionSelect> ShapeClipping();

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
		/****** md5 signature: 11efd3fe0c5c4a223ffd91529793efcd ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theShapeClipping: StepVisual_HArray1OfCameraModelD3MultiClippingUnionSelect

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<StepVisual_HArray1OfCameraModelD3MultiClippingUnionSelect> & theShapeClipping);

		/****** StepVisual_CameraModelD3MultiClippingUnion::SetShapeClipping ******/
		/****** md5 signature: 038c1c8ce5cdfba4e8c3a99cb3c5a7e9 ******/
		%feature("compactdefaultargs") SetShapeClipping;
		%feature("autodoc", "
Parameters
----------
theShapeClipping: StepVisual_HArray1OfCameraModelD3MultiClippingUnionSelect

Return
-------
None

Description
-----------
No available documentation.
") SetShapeClipping;
		void SetShapeClipping(const opencascade::handle<StepVisual_HArray1OfCameraModelD3MultiClippingUnionSelect> & theShapeClipping);

		/****** StepVisual_CameraModelD3MultiClippingUnion::ShapeClipping ******/
		/****** md5 signature: 66c073b815f6e452df319d197d092d8b ******/
		%feature("compactdefaultargs") ShapeClipping;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_HArray1OfCameraModelD3MultiClippingUnionSelect>

Description
-----------
No available documentation.
") ShapeClipping;
		const opencascade::handle<StepVisual_HArray1OfCameraModelD3MultiClippingUnionSelect> ShapeClipping();

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
		/****** md5 signature: f0e39118a9846e44ccd59de148215261 ******/
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
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

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
		/****** md5 signature: 2cd390c56cca036e0603361f0f50dab8 ******/
		%feature("compactdefaultargs") CollectedText;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_HArray1OfTextOrCharacter>

Description
-----------
No available documentation.
") CollectedText;
		opencascade::handle<StepVisual_HArray1OfTextOrCharacter> CollectedText();

		/****** StepVisual_CompositeText::CollectedTextValue ******/
		/****** md5 signature: 570a73e4912d499935e33e1e84bddad8 ******/
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
		StepVisual_TextOrCharacter CollectedTextValue(const Standard_Integer num);

		/****** StepVisual_CompositeText::Init ******/
		/****** md5 signature: 0ac419a47d5af14d5ffe09a081812e1c ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aCollectedText: StepVisual_HArray1OfTextOrCharacter

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepVisual_HArray1OfTextOrCharacter> & aCollectedText);

		/****** StepVisual_CompositeText::NbCollectedText ******/
		/****** md5 signature: d17d775367ed59d4fe52e7d92becf9b2 ******/
		%feature("compactdefaultargs") NbCollectedText;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbCollectedText;
		Standard_Integer NbCollectedText();

		/****** StepVisual_CompositeText::SetCollectedText ******/
		/****** md5 signature: af98ee77e57354d975664705fcbdf314 ******/
		%feature("compactdefaultargs") SetCollectedText;
		%feature("autodoc", "
Parameters
----------
aCollectedText: StepVisual_HArray1OfTextOrCharacter

Return
-------
None

Description
-----------
No available documentation.
") SetCollectedText;
		void SetCollectedText(const opencascade::handle<StepVisual_HArray1OfTextOrCharacter> & aCollectedText);

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
		/****** md5 signature: 56be91c2265461529bfbe169d722039b ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aPatternList: StepVisual_HArray1OfCurveStyleFontPattern

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepVisual_HArray1OfCurveStyleFontPattern> & aPatternList);

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
		/****** md5 signature: b1b6eda1040dd7056f2e6585591bdf68 ******/
		%feature("compactdefaultargs") NbPatternList;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPatternList;
		Standard_Integer NbPatternList();

		/****** StepVisual_CurveStyleFont::PatternList ******/
		/****** md5 signature: 4c6d4f82ee2bff32944dea7e0d3c469e ******/
		%feature("compactdefaultargs") PatternList;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_HArray1OfCurveStyleFontPattern>

Description
-----------
No available documentation.
") PatternList;
		opencascade::handle<StepVisual_HArray1OfCurveStyleFontPattern> PatternList();

		/****** StepVisual_CurveStyleFont::PatternListValue ******/
		/****** md5 signature: 4ebb3c7b7a8aeb6b8448d1e548314593 ******/
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
		opencascade::handle<StepVisual_CurveStyleFontPattern> PatternListValue(const Standard_Integer num);

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
		/****** md5 signature: 2bf4ac68cd54c522f51dcf81a67a6427 ******/
		%feature("compactdefaultargs") SetPatternList;
		%feature("autodoc", "
Parameters
----------
aPatternList: StepVisual_HArray1OfCurveStyleFontPattern

Return
-------
None

Description
-----------
No available documentation.
") SetPatternList;
		void SetPatternList(const opencascade::handle<StepVisual_HArray1OfCurveStyleFontPattern> & aPatternList);

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
		/****** md5 signature: da8b86f284cc6745833744e819a928be ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aVisibleSegmentLength: float
aInvisibleSegmentLength: float

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const Standard_Real aVisibleSegmentLength, const Standard_Real aInvisibleSegmentLength);

		/****** StepVisual_CurveStyleFontPattern::InvisibleSegmentLength ******/
		/****** md5 signature: 8b295afdd729873b7a3167469c7d7c62 ******/
		%feature("compactdefaultargs") InvisibleSegmentLength;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") InvisibleSegmentLength;
		Standard_Real InvisibleSegmentLength();

		/****** StepVisual_CurveStyleFontPattern::SetInvisibleSegmentLength ******/
		/****** md5 signature: 63e7a7d60db9ca0863c82f4a0cc3cf5d ******/
		%feature("compactdefaultargs") SetInvisibleSegmentLength;
		%feature("autodoc", "
Parameters
----------
aInvisibleSegmentLength: float

Return
-------
None

Description
-----------
No available documentation.
") SetInvisibleSegmentLength;
		void SetInvisibleSegmentLength(const Standard_Real aInvisibleSegmentLength);

		/****** StepVisual_CurveStyleFontPattern::SetVisibleSegmentLength ******/
		/****** md5 signature: 7630cd0d6d3230359bbffdfa368b56aa ******/
		%feature("compactdefaultargs") SetVisibleSegmentLength;
		%feature("autodoc", "
Parameters
----------
aVisibleSegmentLength: float

Return
-------
None

Description
-----------
No available documentation.
") SetVisibleSegmentLength;
		void SetVisibleSegmentLength(const Standard_Real aVisibleSegmentLength);

		/****** StepVisual_CurveStyleFontPattern::VisibleSegmentLength ******/
		/****** md5 signature: bb7aea0f1cc06928a599d62aabfdf1bb ******/
		%feature("compactdefaultargs") VisibleSegmentLength;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") VisibleSegmentLength;
		Standard_Real VisibleSegmentLength();

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
		/****** md5 signature: f0e39118a9846e44ccd59de148215261 ******/
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
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

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
		/****** md5 signature: 64ebf9bba16f3a3a03b5db3858660432 ******/
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
		void SetTypeOfContent(const Standard_Integer aTypeOfContent);

		/****** StepVisual_DirectionCountSelect::SetUDirectionCount ******/
		/****** md5 signature: d2b37605e30f9f3a164437046c90b643 ******/
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
		void SetUDirectionCount(const Standard_Integer aUDirectionCount);

		/****** StepVisual_DirectionCountSelect::SetVDirectionCount ******/
		/****** md5 signature: 270f7ae76ba877c54b0a67a19a996e9d ******/
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
		void SetVDirectionCount(const Standard_Integer aUDirectionCount);

		/****** StepVisual_DirectionCountSelect::TypeOfContent ******/
		/****** md5 signature: ca265bcca49d9306f069cd5137aa4464 ******/
		%feature("compactdefaultargs") TypeOfContent;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") TypeOfContent;
		Standard_Integer TypeOfContent();

		/****** StepVisual_DirectionCountSelect::UDirectionCount ******/
		/****** md5 signature: e971de5fe8c36b62a342c36a1aaabe76 ******/
		%feature("compactdefaultargs") UDirectionCount;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") UDirectionCount;
		Standard_Integer UDirectionCount();

		/****** StepVisual_DirectionCountSelect::VDirectionCount ******/
		/****** md5 signature: 1a2bb477a938673186e5eca69c3b0579 ******/
		%feature("compactdefaultargs") VDirectionCount;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") VDirectionCount;
		Standard_Integer VDirectionCount();

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
		/****** md5 signature: 095947082d889e7c32de10dc5bbd03d1 ******/
		%feature("compactdefaultargs") Contents;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_HArray1OfDraughtingCalloutElement>

Description
-----------
Returns field Contents.
") Contents;
		opencascade::handle<StepVisual_HArray1OfDraughtingCalloutElement> Contents();

		/****** StepVisual_DraughtingCallout::ContentsValue ******/
		/****** md5 signature: e5e1f2450ca3a5a2db96d1c0d164d96f ******/
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
		StepVisual_DraughtingCalloutElement ContentsValue(const Standard_Integer theNum);

		/****** StepVisual_DraughtingCallout::Init ******/
		/****** md5 signature: 0f3491ec3799c4002589207be16d6de9 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theContents: StepVisual_HArray1OfDraughtingCalloutElement

Return
-------
None

Description
-----------
Init.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<StepVisual_HArray1OfDraughtingCalloutElement> & theContents);

		/****** StepVisual_DraughtingCallout::NbContents ******/
		/****** md5 signature: 648b0dcfd621b001a960425b98fd0875 ******/
		%feature("compactdefaultargs") NbContents;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of Contents.
") NbContents;
		Standard_Integer NbContents();

		/****** StepVisual_DraughtingCallout::SetContents ******/
		/****** md5 signature: a627aa9980b13436d86c6b1751ff16c7 ******/
		%feature("compactdefaultargs") SetContents;
		%feature("autodoc", "
Parameters
----------
theContents: StepVisual_HArray1OfDraughtingCalloutElement

Return
-------
None

Description
-----------
Set field Contents.
") SetContents;
		void SetContents(const opencascade::handle<StepVisual_HArray1OfDraughtingCalloutElement> & theContents);

		/****** StepVisual_DraughtingCallout::SetContentsValue ******/
		/****** md5 signature: 182606d6bc94b4b624f4ec4bba91a2ce ******/
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
		void SetContentsValue(const Standard_Integer theNum, const StepVisual_DraughtingCalloutElement & theItem);

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
		/****** md5 signature: f0e39118a9846e44ccd59de148215261 ******/
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
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

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
		/****** md5 signature: b9dbcdb5b972500c66bc8bc08f651d0a ******/
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
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

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
		/****** md5 signature: b9dbcdb5b972500c66bc8bc08f651d0a ******/
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
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

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
		/****** md5 signature: bfc36d830b15b08a7d0b1384ee4ccc34 ******/
		%feature("compactdefaultargs") FillStyles;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_HArray1OfFillStyleSelect>

Description
-----------
No available documentation.
") FillStyles;
		opencascade::handle<StepVisual_HArray1OfFillStyleSelect> FillStyles();

		/****** StepVisual_FillAreaStyle::FillStylesValue ******/
		/****** md5 signature: 72fdc401b454ca337f6dbd61f7cc768e ******/
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
		StepVisual_FillStyleSelect FillStylesValue(const Standard_Integer num);

		/****** StepVisual_FillAreaStyle::Init ******/
		/****** md5 signature: b122c0a70ff57a17efa8592a47047cc2 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aFillStyles: StepVisual_HArray1OfFillStyleSelect

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepVisual_HArray1OfFillStyleSelect> & aFillStyles);

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
		/****** md5 signature: abf777e4c20d44bb00c07d1ac5743b9b ******/
		%feature("compactdefaultargs") NbFillStyles;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbFillStyles;
		Standard_Integer NbFillStyles();

		/****** StepVisual_FillAreaStyle::SetFillStyles ******/
		/****** md5 signature: 88bc4d07eadb53c25317d10fd2c1f7af ******/
		%feature("compactdefaultargs") SetFillStyles;
		%feature("autodoc", "
Parameters
----------
aFillStyles: StepVisual_HArray1OfFillStyleSelect

Return
-------
None

Description
-----------
No available documentation.
") SetFillStyles;
		void SetFillStyles(const opencascade::handle<StepVisual_HArray1OfFillStyleSelect> & aFillStyles);

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
		/****** md5 signature: f0e39118a9846e44ccd59de148215261 ******/
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
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

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
		/****** md5 signature: f0e39118a9846e44ccd59de148215261 ******/
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
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

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
		/****** md5 signature: 43418f7b6dedd792034c03b90ac07989 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aInvisibleItems: StepVisual_HArray1OfInvisibleItem

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepVisual_HArray1OfInvisibleItem> & aInvisibleItems);

		/****** StepVisual_Invisibility::InvisibleItems ******/
		/****** md5 signature: be820ab6c1eeb1d37e5a217109d55712 ******/
		%feature("compactdefaultargs") InvisibleItems;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_HArray1OfInvisibleItem>

Description
-----------
No available documentation.
") InvisibleItems;
		opencascade::handle<StepVisual_HArray1OfInvisibleItem> InvisibleItems();

		/****** StepVisual_Invisibility::InvisibleItemsValue ******/
		/****** md5 signature: a0f0f2c308f4bcad141aef8e2da622e0 ******/
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
		StepVisual_InvisibleItem InvisibleItemsValue(const Standard_Integer num);

		/****** StepVisual_Invisibility::NbInvisibleItems ******/
		/****** md5 signature: 17dadfd787033a03c16e43aa43fb9e42 ******/
		%feature("compactdefaultargs") NbInvisibleItems;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbInvisibleItems;
		Standard_Integer NbInvisibleItems();

		/****** StepVisual_Invisibility::SetInvisibleItems ******/
		/****** md5 signature: 38b0c0c6a390652a9dbe483c166b24e3 ******/
		%feature("compactdefaultargs") SetInvisibleItems;
		%feature("autodoc", "
Parameters
----------
aInvisibleItems: StepVisual_HArray1OfInvisibleItem

Return
-------
None

Description
-----------
No available documentation.
") SetInvisibleItems;
		void SetInvisibleItems(const opencascade::handle<StepVisual_HArray1OfInvisibleItem> & aInvisibleItems);

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
		/****** md5 signature: f0e39118a9846e44ccd59de148215261 ******/
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
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

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
		/****** md5 signature: f0e39118a9846e44ccd59de148215261 ******/
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
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

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
		/****** md5 signature: f0e39118a9846e44ccd59de148215261 ******/
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
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

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
		/****** md5 signature: a63e2e811ad86b44e1eb67e1ce00ea65 ******/
		%feature("compactdefaultargs") EnumText;
		%feature("autodoc", "Return
-------
str

Description
-----------
No available documentation.
") EnumText;
		virtual Standard_CString EnumText();

		/****** StepVisual_MarkerMember::HasName ******/
		/****** md5 signature: c4b2dbd737f3c98314fdb7955ce91c2a ******/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasName;
		virtual Standard_Boolean HasName();

		/****** StepVisual_MarkerMember::Name ******/
		/****** md5 signature: d654a4ee9a75d24a9c3f33853f908999 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
str

Description
-----------
No available documentation.
") Name;
		virtual Standard_CString Name();

		/****** StepVisual_MarkerMember::SetEnumText ******/
		/****** md5 signature: 120d4c122fb5eaba7d84896e45beec24 ******/
		%feature("compactdefaultargs") SetEnumText;
		%feature("autodoc", "
Parameters
----------
val: int
text: str

Return
-------
None

Description
-----------
No available documentation.
") SetEnumText;
		virtual void SetEnumText(const Standard_Integer val, Standard_CString text);

		/****** StepVisual_MarkerMember::SetName ******/
		/****** md5 signature: cb088c8a5caf9447945830483c3112e7 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
bool

Description
-----------
No available documentation.
") SetName;
		virtual Standard_Boolean SetName(Standard_CString name);

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
		/****** md5 signature: 9b67f0d9aae1302e7b91faea7b14b6d6 ******/
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
		virtual Standard_Integer CaseMem(const opencascade::handle<StepData_SelectMember> & sm);

		/****** StepVisual_MarkerSelect::CaseNum ******/
		/****** md5 signature: b9dbcdb5b972500c66bc8bc08f651d0a ******/
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
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

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
		/****** md5 signature: ae7a49ea52744ae449d83e823e9a6da7 ******/
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", "Return
-------
opencascade::handle<StepData_SelectMember>

Description
-----------
Returns a new MarkerMember.
") NewMember;
		virtual opencascade::handle<StepData_SelectMember> NewMember();

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
		/****** md5 signature: a63e2e811ad86b44e1eb67e1ce00ea65 ******/
		%feature("compactdefaultargs") EnumText;
		%feature("autodoc", "Return
-------
str

Description
-----------
No available documentation.
") EnumText;
		virtual Standard_CString EnumText();

		/****** StepVisual_NullStyleMember::HasName ******/
		/****** md5 signature: 454c871a85ff9e9d126353d7d8ebe205 ******/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasName;
		virtual Standard_Boolean HasName();

		/****** StepVisual_NullStyleMember::Kind ******/
		/****** md5 signature: 68423d7a619b16473db8e5cece0b7d32 ******/
		%feature("compactdefaultargs") Kind;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Kind;
		Standard_Integer Kind();

		/****** StepVisual_NullStyleMember::Name ******/
		/****** md5 signature: 06f88ef4dbb86ad142e1fa4f6645d0a3 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
str

Description
-----------
No available documentation.
") Name;
		virtual Standard_CString Name();

		/****** StepVisual_NullStyleMember::SetEnumText ******/
		/****** md5 signature: b2fa2c708967006363f06f147171c7a7 ******/
		%feature("compactdefaultargs") SetEnumText;
		%feature("autodoc", "
Parameters
----------
theValue: int
theText: str

Return
-------
None

Description
-----------
No available documentation.
") SetEnumText;
		virtual void SetEnumText(const Standard_Integer theValue, Standard_CString theText);

		/****** StepVisual_NullStyleMember::SetName ******/
		/****** md5 signature: c0fb4b116d47426ff8c83f0fba90c9d0 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
Standard_CString: 

Return
-------
bool

Description
-----------
No available documentation.
") SetName;
		virtual Standard_Boolean SetName(const Standard_CString);

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
		/****** md5 signature: b9dbcdb5b972500c66bc8bc08f651d0a ******/
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
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

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
		/****** md5 signature: 11c89a3a54c891c12e325c7a8f02c313 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aSizeInX: float
aSizeInY: float

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const Standard_Real aSizeInX, const Standard_Real aSizeInY);

		/****** StepVisual_PlanarExtent::SetSizeInX ******/
		/****** md5 signature: db14fc0ae7767c757c95681db0fcaef5 ******/
		%feature("compactdefaultargs") SetSizeInX;
		%feature("autodoc", "
Parameters
----------
aSizeInX: float

Return
-------
None

Description
-----------
No available documentation.
") SetSizeInX;
		void SetSizeInX(const Standard_Real aSizeInX);

		/****** StepVisual_PlanarExtent::SetSizeInY ******/
		/****** md5 signature: f18d2e4c5890dfb270b4fcdf4e4dc52a ******/
		%feature("compactdefaultargs") SetSizeInY;
		%feature("autodoc", "
Parameters
----------
aSizeInY: float

Return
-------
None

Description
-----------
No available documentation.
") SetSizeInY;
		void SetSizeInY(const Standard_Real aSizeInY);

		/****** StepVisual_PlanarExtent::SizeInX ******/
		/****** md5 signature: 207e37afbd922509f9b5429d02a8630e ******/
		%feature("compactdefaultargs") SizeInX;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") SizeInX;
		Standard_Real SizeInX();

		/****** StepVisual_PlanarExtent::SizeInY ******/
		/****** md5 signature: aa84661dba951a2ac821696b99f24fcd ******/
		%feature("compactdefaultargs") SizeInY;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") SizeInY;
		Standard_Real SizeInY();

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
		/****** md5 signature: 5603a149ac3a31a63988a3b44a83cded ******/
		%feature("compactdefaultargs") AssignedItems;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_HArray1OfLayeredItem>

Description
-----------
No available documentation.
") AssignedItems;
		opencascade::handle<StepVisual_HArray1OfLayeredItem> AssignedItems();

		/****** StepVisual_PresentationLayerAssignment::AssignedItemsValue ******/
		/****** md5 signature: 2e9dd445e1b3ba65039cd5d54a7c9316 ******/
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
		StepVisual_LayeredItem AssignedItemsValue(const Standard_Integer num);

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
		/****** md5 signature: 6e8c8d74d5fe4b7f775d4682a1fa4ca0 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aAssignedItems: StepVisual_HArray1OfLayeredItem

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepVisual_HArray1OfLayeredItem> & aAssignedItems);

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
		/****** md5 signature: b8ff0a501e3564d97f419c4084a2f772 ******/
		%feature("compactdefaultargs") NbAssignedItems;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbAssignedItems;
		Standard_Integer NbAssignedItems();

		/****** StepVisual_PresentationLayerAssignment::SetAssignedItems ******/
		/****** md5 signature: 577a8a14d39f41f4104333bccc4bb2e8 ******/
		%feature("compactdefaultargs") SetAssignedItems;
		%feature("autodoc", "
Parameters
----------
aAssignedItems: StepVisual_HArray1OfLayeredItem

Return
-------
None

Description
-----------
No available documentation.
") SetAssignedItems;
		void SetAssignedItems(const opencascade::handle<StepVisual_HArray1OfLayeredItem> & aAssignedItems);

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
		/****** md5 signature: f0e39118a9846e44ccd59de148215261 ******/
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
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

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
		/****** md5 signature: f0e39118a9846e44ccd59de148215261 ******/
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
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

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
		/****** md5 signature: 19337abb8014667e7ee598bc01dd719e ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aStyles: StepVisual_HArray1OfPresentationStyleSelect

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepVisual_HArray1OfPresentationStyleSelect> & aStyles);

		/****** StepVisual_PresentationStyleAssignment::NbStyles ******/
		/****** md5 signature: 9f5fbd515247307ce70e63c6f585ddb7 ******/
		%feature("compactdefaultargs") NbStyles;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbStyles;
		Standard_Integer NbStyles();

		/****** StepVisual_PresentationStyleAssignment::SetStyles ******/
		/****** md5 signature: ec9247e94c63a82ce89f12d338fddc67 ******/
		%feature("compactdefaultargs") SetStyles;
		%feature("autodoc", "
Parameters
----------
aStyles: StepVisual_HArray1OfPresentationStyleSelect

Return
-------
None

Description
-----------
No available documentation.
") SetStyles;
		void SetStyles(const opencascade::handle<StepVisual_HArray1OfPresentationStyleSelect> & aStyles);

		/****** StepVisual_PresentationStyleAssignment::Styles ******/
		/****** md5 signature: 3579cb1cc88465f94e6e54dc0c81881f ******/
		%feature("compactdefaultargs") Styles;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_HArray1OfPresentationStyleSelect>

Description
-----------
No available documentation.
") Styles;
		opencascade::handle<StepVisual_HArray1OfPresentationStyleSelect> Styles();

		/****** StepVisual_PresentationStyleAssignment::StylesValue ******/
		/****** md5 signature: dc0642b4c23e4b1290ec9bad05389a4c ******/
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
		StepVisual_PresentationStyleSelect StylesValue(const Standard_Integer num);

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
		/****** md5 signature: f0e39118a9846e44ccd59de148215261 ******/
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
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

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
		/****** md5 signature: b9dbcdb5b972500c66bc8bc08f651d0a ******/
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
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

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
		/****** md5 signature: f0e39118a9846e44ccd59de148215261 ******/
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
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

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
		/****** md5 signature: eb9228bcc80d4151a6612f9ea37e8ab9 ******/
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
		/****** md5 signature: 0c994c2dbfe076b8f4ec7e6dd9459789 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aStyles: StepVisual_HArray1OfPresentationStyleAssignment
aItem: Standard_Transient

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepVisual_HArray1OfPresentationStyleAssignment> & aStyles, const opencascade::handle<Standard_Transient> & aItem);

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
		/****** md5 signature: f4c9254e3c2f31482b51b67dc038e70c ******/
		%feature("compactdefaultargs") NbStyles;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbStyles;
		Standard_Integer NbStyles();

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
		/****** md5 signature: 4b4d81591c544820ce2b1108b7e4089d ******/
		%feature("compactdefaultargs") SetStyles;
		%feature("autodoc", "
Parameters
----------
aStyles: StepVisual_HArray1OfPresentationStyleAssignment

Return
-------
None

Description
-----------
No available documentation.
") SetStyles;
		void SetStyles(const opencascade::handle<StepVisual_HArray1OfPresentationStyleAssignment> & aStyles);

		/****** StepVisual_StyledItem::Styles ******/
		/****** md5 signature: 4fc5a17642e216edc2586083b1d1576c ******/
		%feature("compactdefaultargs") Styles;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_HArray1OfPresentationStyleAssignment>

Description
-----------
No available documentation.
") Styles;
		const opencascade::handle<StepVisual_HArray1OfPresentationStyleAssignment> & Styles();

		/****** StepVisual_StyledItem::StylesValue ******/
		/****** md5 signature: a674d5f4ef7c5fbc1388477679cc8fc5 ******/
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
		const opencascade::handle<StepVisual_PresentationStyleAssignment> & StylesValue(const Standard_Integer num);

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
		/****** md5 signature: f0e39118a9846e44ccd59de148215261 ******/
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
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

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
		/****** md5 signature: af9881776eea5dc5e4c94f3b1bf501e4 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aStyles: StepVisual_HArray1OfSurfaceStyleElementSelect

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepVisual_HArray1OfSurfaceStyleElementSelect> & aStyles);

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
		/****** md5 signature: 9f5fbd515247307ce70e63c6f585ddb7 ******/
		%feature("compactdefaultargs") NbStyles;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbStyles;
		Standard_Integer NbStyles();

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
		/****** md5 signature: 837f1427282dbfa1651f570dd3067799 ******/
		%feature("compactdefaultargs") SetStyles;
		%feature("autodoc", "
Parameters
----------
aStyles: StepVisual_HArray1OfSurfaceStyleElementSelect

Return
-------
None

Description
-----------
No available documentation.
") SetStyles;
		void SetStyles(const opencascade::handle<StepVisual_HArray1OfSurfaceStyleElementSelect> & aStyles);

		/****** StepVisual_SurfaceSideStyle::Styles ******/
		/****** md5 signature: c067261784184af9c7aa81ebec0a6230 ******/
		%feature("compactdefaultargs") Styles;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_HArray1OfSurfaceStyleElementSelect>

Description
-----------
No available documentation.
") Styles;
		opencascade::handle<StepVisual_HArray1OfSurfaceStyleElementSelect> Styles();

		/****** StepVisual_SurfaceSideStyle::StylesValue ******/
		/****** md5 signature: e69ee134d7ec481cf940915040946e40 ******/
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
		StepVisual_SurfaceStyleElementSelect StylesValue(const Standard_Integer num);

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
		/****** md5 signature: f0e39118a9846e44ccd59de148215261 ******/
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
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

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
		/****** md5 signature: cec970c2af8f43f00bfa3fce5d3ed6b2 ******/
		%feature("compactdefaultargs") DirectionCounts;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_HArray1OfDirectionCountSelect>

Description
-----------
No available documentation.
") DirectionCounts;
		opencascade::handle<StepVisual_HArray1OfDirectionCountSelect> DirectionCounts();

		/****** StepVisual_SurfaceStyleParameterLine::DirectionCountsValue ******/
		/****** md5 signature: 31f9040d4b8643736207e0a58197608b ******/
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
		StepVisual_DirectionCountSelect DirectionCountsValue(const Standard_Integer num);

		/****** StepVisual_SurfaceStyleParameterLine::Init ******/
		/****** md5 signature: cbaa35e98130ae00d7c7e312198b037e ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aStyleOfParameterLines: StepVisual_CurveStyle
aDirectionCounts: StepVisual_HArray1OfDirectionCountSelect

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepVisual_CurveStyle> & aStyleOfParameterLines, const opencascade::handle<StepVisual_HArray1OfDirectionCountSelect> & aDirectionCounts);

		/****** StepVisual_SurfaceStyleParameterLine::NbDirectionCounts ******/
		/****** md5 signature: e620a789179fbed828f7fff88217dcab ******/
		%feature("compactdefaultargs") NbDirectionCounts;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbDirectionCounts;
		Standard_Integer NbDirectionCounts();

		/****** StepVisual_SurfaceStyleParameterLine::SetDirectionCounts ******/
		/****** md5 signature: 19b9a183d71574f73b0f7a31b324685e ******/
		%feature("compactdefaultargs") SetDirectionCounts;
		%feature("autodoc", "
Parameters
----------
aDirectionCounts: StepVisual_HArray1OfDirectionCountSelect

Return
-------
None

Description
-----------
No available documentation.
") SetDirectionCounts;
		void SetDirectionCounts(const opencascade::handle<StepVisual_HArray1OfDirectionCountSelect> & aDirectionCounts);

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
		/****** md5 signature: 91c71cacd5aaa1e29a74a253278cf822 ******/
		%feature("compactdefaultargs") AmbientReflectance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns field AmbientReflectance.
") AmbientReflectance;
		Standard_Real AmbientReflectance();

		/****** StepVisual_SurfaceStyleReflectanceAmbient::Init ******/
		/****** md5 signature: ebf8757f098298aaf1e593c46dac0b0b ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theAmbientReflectance: float

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const Standard_Real theAmbientReflectance);

		/****** StepVisual_SurfaceStyleReflectanceAmbient::SetAmbientReflectance ******/
		/****** md5 signature: f19473c235a6e050fa102bf332502825 ******/
		%feature("compactdefaultargs") SetAmbientReflectance;
		%feature("autodoc", "
Parameters
----------
theAmbientReflectance: float

Return
-------
None

Description
-----------
Sets field AmbientReflectance.
") SetAmbientReflectance;
		void SetAmbientReflectance(const Standard_Real theAmbientReflectance);

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
		/****** md5 signature: d0471972d41a7e6008fada7eb54b59eb ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theTransparency: float

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const Standard_Real theTransparency);

		/****** StepVisual_SurfaceStyleTransparent::SetTransparency ******/
		/****** md5 signature: b63ccc026f1e33423da5a4fb3a4c87f6 ******/
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "
Parameters
----------
theTransparency: float

Return
-------
None

Description
-----------
Sets field Transparency.
") SetTransparency;
		void SetTransparency(const Standard_Real theTransparency);

		/****** StepVisual_SurfaceStyleTransparent::Transparency ******/
		/****** md5 signature: 395111f5ce5a38f6b8d6009c7b6b1222 ******/
		%feature("compactdefaultargs") Transparency;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns field Transparency.
") Transparency;
		Standard_Real Transparency();

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
		/****** md5 signature: b9dbcdb5b972500c66bc8bc08f651d0a ******/
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
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

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
		/****** md5 signature: f0e39118a9846e44ccd59de148215261 ******/
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
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

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
		/****** md5 signature: f4942e08a89ca03b954ef65f79bc0317 ******/
		%feature("compactdefaultargs") BackPlaneClipping;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") BackPlaneClipping;
		Standard_Boolean BackPlaneClipping();

		/****** StepVisual_ViewVolume::BackPlaneDistance ******/
		/****** md5 signature: 461642553ea3f9afa8cccbf4dbb17426 ******/
		%feature("compactdefaultargs") BackPlaneDistance;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") BackPlaneDistance;
		Standard_Real BackPlaneDistance();

		/****** StepVisual_ViewVolume::FrontPlaneClipping ******/
		/****** md5 signature: 5dc08f835aab66c4ebeee8ea44aac106 ******/
		%feature("compactdefaultargs") FrontPlaneClipping;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") FrontPlaneClipping;
		Standard_Boolean FrontPlaneClipping();

		/****** StepVisual_ViewVolume::FrontPlaneDistance ******/
		/****** md5 signature: 9b0f3629420a101cad94471e4b2f5dc8 ******/
		%feature("compactdefaultargs") FrontPlaneDistance;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") FrontPlaneDistance;
		Standard_Real FrontPlaneDistance();

		/****** StepVisual_ViewVolume::Init ******/
		/****** md5 signature: 5334c63ff086d260ee00224d8efba9bb ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aProjectionType: StepVisual_CentralOrParallel
aProjectionPoint: StepGeom_CartesianPoint
aViewPlaneDistance: float
aFrontPlaneDistance: float
aFrontPlaneClipping: bool
aBackPlaneDistance: float
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
		void Init(const StepVisual_CentralOrParallel aProjectionType, const opencascade::handle<StepGeom_CartesianPoint> & aProjectionPoint, const Standard_Real aViewPlaneDistance, const Standard_Real aFrontPlaneDistance, const Standard_Boolean aFrontPlaneClipping, const Standard_Real aBackPlaneDistance, const Standard_Boolean aBackPlaneClipping, const Standard_Boolean aViewVolumeSidesClipping, const opencascade::handle<StepVisual_PlanarBox> & aViewWindow);

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
		/****** md5 signature: 6674976d6d401c95326e70806fc1ae26 ******/
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
		void SetBackPlaneClipping(const Standard_Boolean aBackPlaneClipping);

		/****** StepVisual_ViewVolume::SetBackPlaneDistance ******/
		/****** md5 signature: edfc21fcbb6d0e0206180b0f4a0e4f16 ******/
		%feature("compactdefaultargs") SetBackPlaneDistance;
		%feature("autodoc", "
Parameters
----------
aBackPlaneDistance: float

Return
-------
None

Description
-----------
No available documentation.
") SetBackPlaneDistance;
		void SetBackPlaneDistance(const Standard_Real aBackPlaneDistance);

		/****** StepVisual_ViewVolume::SetFrontPlaneClipping ******/
		/****** md5 signature: 2ef3554ed4085b640a49951a13c68697 ******/
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
		void SetFrontPlaneClipping(const Standard_Boolean aFrontPlaneClipping);

		/****** StepVisual_ViewVolume::SetFrontPlaneDistance ******/
		/****** md5 signature: 0abafb345d231817ec21629b7183d720 ******/
		%feature("compactdefaultargs") SetFrontPlaneDistance;
		%feature("autodoc", "
Parameters
----------
aFrontPlaneDistance: float

Return
-------
None

Description
-----------
No available documentation.
") SetFrontPlaneDistance;
		void SetFrontPlaneDistance(const Standard_Real aFrontPlaneDistance);

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
		/****** md5 signature: da1f3356e5f41bcfc2bb04e77f58c10e ******/
		%feature("compactdefaultargs") SetViewPlaneDistance;
		%feature("autodoc", "
Parameters
----------
aViewPlaneDistance: float

Return
-------
None

Description
-----------
No available documentation.
") SetViewPlaneDistance;
		void SetViewPlaneDistance(const Standard_Real aViewPlaneDistance);

		/****** StepVisual_ViewVolume::SetViewVolumeSidesClipping ******/
		/****** md5 signature: 938e917fe37c3b73ccc2088beb9e6574 ******/
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
		void SetViewVolumeSidesClipping(const Standard_Boolean aViewVolumeSidesClipping);

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
		/****** md5 signature: 7ab9aeb9cdc69dbf281d1fbcecc18b25 ******/
		%feature("compactdefaultargs") ViewPlaneDistance;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") ViewPlaneDistance;
		Standard_Real ViewPlaneDistance();

		/****** StepVisual_ViewVolume::ViewVolumeSidesClipping ******/
		/****** md5 signature: a3f90f4afd2383c29f11c96039e9a2f1 ******/
		%feature("compactdefaultargs") ViewVolumeSidesClipping;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") ViewVolumeSidesClipping;
		Standard_Boolean ViewVolumeSidesClipping();

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
		/****** md5 signature: dbffc25b3471018fbf5fe9cab1b7eb83 ******/
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
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepVisual_PlanarBox> & aViewWindow, const Standard_Boolean aViewWindowClipping);

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
		/****** md5 signature: 2b3733762e8bdaf1ef52f2d1b7c8b674 ******/
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
		void SetViewWindowClipping(const Standard_Boolean aViewWindowClipping);

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
		/****** md5 signature: 60a35ab5c04f44b804a3cc10158ea739 ******/
		%feature("compactdefaultargs") ViewWindowClipping;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") ViewWindowClipping;
		Standard_Boolean ViewWindowClipping();

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
		/****** md5 signature: 110b91406c02697e42c454f3b015db2d ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aCollectedText: StepVisual_HArray1OfTextOrCharacter
aExtent: StepVisual_PlanarExtent

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepVisual_HArray1OfTextOrCharacter> & aCollectedText, const opencascade::handle<StepVisual_PlanarExtent> & aExtent);

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
		/****** md5 signature: 994ad424222e64e933e9c610e0b1c703 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aInvisibleItems: StepVisual_HArray1OfInvisibleItem
aPresentationContext: StepVisual_InvisibilityContext

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepVisual_HArray1OfInvisibleItem> & aInvisibleItems, const StepVisual_InvisibilityContext & aPresentationContext);

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
		/****** md5 signature: 6b8cf97a27cc571f37e1cba05bc22c29 ******/
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
		/****** md5 signature: ae57370bd0bdd13575b3a053117bf726 ******/
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
		/****** md5 signature: b6eaf947f5bce980117254b1de3cdbd8 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aStyles: StepVisual_HArray1OfPresentationStyleAssignment
aItem: Standard_Transient
aOverRiddenStyle: StepVisual_StyledItem

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepVisual_HArray1OfPresentationStyleAssignment> & aStyles, const opencascade::handle<Standard_Transient> & aItem, const opencascade::handle<StepVisual_StyledItem> & aOverRiddenStyle);

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
		/****** md5 signature: 8bf864327a59155b489a5980c7481f2f ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aSizeInX: float
aSizeInY: float
aPlacement: StepGeom_Axis2Placement

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const Standard_Real aSizeInX, const Standard_Real aSizeInY, const StepGeom_Axis2Placement & aPlacement);

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
		/****** md5 signature: 9d9086df5e83732bdf0436ac9ab29d79 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aStyles: StepVisual_HArray1OfPresentationStyleSelect
aStyleContext: StepVisual_StyleContextSelect

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepVisual_HArray1OfPresentationStyleSelect> & aStyles, const StepVisual_StyleContextSelect & aStyleContext);

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
		/****** md5 signature: 676ee0afc6ba0ef5b172214d520839b2 ******/
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
		/****** md5 signature: 6ccee1bad33817e66b5f255ad860827b ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theSurfaceStyleRendering_RenderingMethod: StepVisual_ShadingSurfaceMethod
theSurfaceStyleRendering_SurfaceColour: StepVisual_Colour
theProperties: StepVisual_HArray1OfRenderingPropertiesSelect

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const StepVisual_ShadingSurfaceMethod theSurfaceStyleRendering_RenderingMethod, const opencascade::handle<StepVisual_Colour> & theSurfaceStyleRendering_SurfaceColour, const opencascade::handle<StepVisual_HArray1OfRenderingPropertiesSelect> & theProperties);

		/****** StepVisual_SurfaceStyleRenderingWithProperties::Properties ******/
		/****** md5 signature: dcd41794385dc173a5798e6ef5ebdf66 ******/
		%feature("compactdefaultargs") Properties;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_HArray1OfRenderingPropertiesSelect>

Description
-----------
Returns field Properties.
") Properties;
		opencascade::handle<StepVisual_HArray1OfRenderingPropertiesSelect> Properties();

		/****** StepVisual_SurfaceStyleRenderingWithProperties::SetProperties ******/
		/****** md5 signature: 94b0b2d7f95c87b9c8fd1441d384ffa5 ******/
		%feature("compactdefaultargs") SetProperties;
		%feature("autodoc", "
Parameters
----------
theProperties: StepVisual_HArray1OfRenderingPropertiesSelect

Return
-------
None

Description
-----------
Sets field Properties.
") SetProperties;
		void SetProperties(const opencascade::handle<StepVisual_HArray1OfRenderingPropertiesSelect> & theProperties);

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
Returns a TesselatedAnnotationOccurence.
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
		/****** md5 signature: 2fcc167b61b3b4e02a3fe5f1ad44dc28 ******/
		%feature("compactdefaultargs") Curves;
		%feature("autodoc", "Return
-------
NCollection_Handle<StepVisual_VectorOfHSequenceOfInteger >

Description
-----------
No available documentation.
") Curves;
		NCollection_Handle<StepVisual_VectorOfHSequenceOfInteger > Curves();

		/****** StepVisual_TessellatedCurveSet::Init ******/
		/****** md5 signature: 3e1b0139b2d5cd0ae25418ff544765a7 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theCoordList: StepVisual_CoordinatesList
theCurves: NCollection_Handle<StepVisual_VectorOfHSequenceOfInteger>

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<StepVisual_CoordinatesList> & theCoordList, const NCollection_Handle<StepVisual_VectorOfHSequenceOfInteger> & theCurves);

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
		/****** md5 signature: 5a1e4132221dbd9bd990e3b979865450 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theItems: NCollection_Handle<StepVisual_Array1OfTessellatedItem>

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const NCollection_Handle<StepVisual_Array1OfTessellatedItem> & theItems);

		/****** StepVisual_TessellatedGeometricSet::Items ******/
		/****** md5 signature: f2c8bdf941344c8dc9a1b9e0f0dbd6f2 ******/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Return
-------
NCollection_Handle<StepVisual_Array1OfTessellatedItem >

Description
-----------
No available documentation.
") Items;
		NCollection_Handle<StepVisual_Array1OfTessellatedItem > Items();

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
		/****** md5 signature: ec4773c2104213411962b46a2e3b3447 ******/
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
		/****** md5 signature: b90b8a3ea8a0827b868e6afd5f3bf74b ******/
		%feature("compactdefaultargs") NbPointList;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of PointList.
") NbPointList;
		Standard_Integer NbPointList();

		/****** StepVisual_TessellatedPointSet::PointList ******/
		/****** md5 signature: 2581e8b82450570684893bd02acfd0bd ******/
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
		/****** md5 signature: 9f5033dc63673f11f4cb1e36bb1f4e93 ******/
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
		Standard_Integer PointListValue(const Standard_Integer theNum);

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
		/****** md5 signature: 790f3d2e1872305718f8dd98a09ffda7 ******/
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
		/****** md5 signature: f85408479b34c1cade618da7b4de70e9 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentation_Name: TCollection_HAsciiString
theRepresentation_Items: StepRepr_HArray1OfRepresentationItem
theRepresentation_ContextOfItems: StepRepr_RepresentationContext
theTessellationAccuracyParameters: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentation_Name, const opencascade::handle<StepRepr_HArray1OfRepresentationItem> & theRepresentation_Items, const opencascade::handle<StepRepr_RepresentationContext> & theRepresentation_ContextOfItems, const opencascade::handle<TColStd_HArray1OfReal> & theTessellationAccuracyParameters);

		/****** StepVisual_TessellatedShapeRepresentationWithAccuracyParameters::NbTessellationAccuracyParameters ******/
		/****** md5 signature: 13b9a7e33d8f6c2c3b0aae5277001286 ******/
		%feature("compactdefaultargs") NbTessellationAccuracyParameters;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of TessellationAccuracyParameters.
") NbTessellationAccuracyParameters;
		Standard_Integer NbTessellationAccuracyParameters();

		/****** StepVisual_TessellatedShapeRepresentationWithAccuracyParameters::SetTessellationAccuracyParameters ******/
		/****** md5 signature: 546fb6b6bbb12e01f420401102f6cfb1 ******/
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
		/****** md5 signature: 15082317812f6de6cca655069baeb736 ******/
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
		/****** md5 signature: a2b0a93749d491897c6eb85998771d00 ******/
		%feature("compactdefaultargs") TessellationAccuracyParametersValue;
		%feature("autodoc", "
Parameters
----------
theNum: int

Return
-------
float

Description
-----------
Returns value of TessellationAccuracyParameters by its num.
") TessellationAccuracyParametersValue;
		const Standard_Real & TessellationAccuracyParametersValue(const Standard_Integer theNum);

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
		/****** md5 signature: b2a8f6180f026b329187f8297fbc4881 ******/
		%feature("compactdefaultargs") HasTopologicalLink;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field TopologicalLink is defined.
") HasTopologicalLink;
		Standard_Boolean HasTopologicalLink();

		/****** StepVisual_TessellatedShell::Init ******/
		/****** md5 signature: 94210c7f690ac44251daba880caa734d ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theItems: StepVisual_HArray1OfTessellatedStructuredItem
theHasTopologicalLink: bool
theTopologicalLink: StepShape_ConnectedFaceSet

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepVisual_HArray1OfTessellatedStructuredItem> & theItems, const Standard_Boolean theHasTopologicalLink, const opencascade::handle<StepShape_ConnectedFaceSet> & theTopologicalLink);

		/****** StepVisual_TessellatedShell::Items ******/
		/****** md5 signature: 203b14c6f195b69b3e0aacbe9f49e3fa ******/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_HArray1OfTessellatedStructuredItem>

Description
-----------
Returns field Items.
") Items;
		opencascade::handle<StepVisual_HArray1OfTessellatedStructuredItem> Items();

		/****** StepVisual_TessellatedShell::ItemsValue ******/
		/****** md5 signature: 282108d369d7aea12634aa7e081aaa30 ******/
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
		opencascade::handle<StepVisual_TessellatedStructuredItem> ItemsValue(const Standard_Integer theNum);

		/****** StepVisual_TessellatedShell::NbItems ******/
		/****** md5 signature: f3da46c6111cc4b112ff30aff83385d6 ******/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of Items.
") NbItems;
		Standard_Integer NbItems();

		/****** StepVisual_TessellatedShell::SetItems ******/
		/****** md5 signature: b21476192d46c8f6e58044ebf10ef43c ******/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "
Parameters
----------
theItems: StepVisual_HArray1OfTessellatedStructuredItem

Return
-------
None

Description
-----------
Sets field Items.
") SetItems;
		void SetItems(const opencascade::handle<StepVisual_HArray1OfTessellatedStructuredItem> & theItems);

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
		/****** md5 signature: 432ca769d0ec23ad86df023b91c35498 ******/
		%feature("compactdefaultargs") HasGeometricLink;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field GeometricLink is defined.
") HasGeometricLink;
		Standard_Boolean HasGeometricLink();

		/****** StepVisual_TessellatedSolid::Init ******/
		/****** md5 signature: 85dcd9e89962e4c2fe1ef90c4cccbb73 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theItems: StepVisual_HArray1OfTessellatedStructuredItem
theHasGeometricLink: bool
theGeometricLink: StepShape_ManifoldSolidBrep

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepVisual_HArray1OfTessellatedStructuredItem> & theItems, const Standard_Boolean theHasGeometricLink, const opencascade::handle<StepShape_ManifoldSolidBrep> & theGeometricLink);

		/****** StepVisual_TessellatedSolid::Items ******/
		/****** md5 signature: 203b14c6f195b69b3e0aacbe9f49e3fa ******/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_HArray1OfTessellatedStructuredItem>

Description
-----------
Returns field Items.
") Items;
		opencascade::handle<StepVisual_HArray1OfTessellatedStructuredItem> Items();

		/****** StepVisual_TessellatedSolid::ItemsValue ******/
		/****** md5 signature: 282108d369d7aea12634aa7e081aaa30 ******/
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
		opencascade::handle<StepVisual_TessellatedStructuredItem> ItemsValue(const Standard_Integer theNum);

		/****** StepVisual_TessellatedSolid::NbItems ******/
		/****** md5 signature: f3da46c6111cc4b112ff30aff83385d6 ******/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of Items.
") NbItems;
		Standard_Integer NbItems();

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
		/****** md5 signature: b21476192d46c8f6e58044ebf10ef43c ******/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "
Parameters
----------
theItems: StepVisual_HArray1OfTessellatedStructuredItem

Return
-------
None

Description
-----------
Sets field Items.
") SetItems;
		void SetItems(const opencascade::handle<StepVisual_HArray1OfTessellatedStructuredItem> & theItems);

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
		/****** md5 signature: 01962d23e27f7d3450592abfc9bcc70c ******/
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
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepVisual_CoordinatesList> & theCoordinates, const Standard_Integer thePnmax, const opencascade::handle<TColStd_HArray2OfReal> & theNormals);

		/****** StepVisual_TessellatedSurfaceSet::NbNormals ******/
		/****** md5 signature: e8ae9c17a546ef8db4eb8b45e7edd0e8 ******/
		%feature("compactdefaultargs") NbNormals;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of Normals.
") NbNormals;
		Standard_Integer NbNormals();

		/****** StepVisual_TessellatedSurfaceSet::Normals ******/
		/****** md5 signature: 369b381d12bed5d4109e95bc2ede0ab6 ******/
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
		/****** md5 signature: 0b280e192c56c44fffab9481c68ac038 ******/
		%feature("compactdefaultargs") Pnmax;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns field Pnmax.
") Pnmax;
		Standard_Integer Pnmax();

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
		/****** md5 signature: 6dd69aae81e446ea2f47e92611adf4ec ******/
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
		/****** md5 signature: 684034e32240f760527db1f7f7c9f728 ******/
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
		void SetPnmax(const Standard_Integer thePnmax);

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
		/****** md5 signature: 7807a19596f6c3f1b22f6e665f78b0d0 ******/
		%feature("compactdefaultargs") HasGeometricModelLink;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field GeometricModelLink is defined.
") HasGeometricModelLink;
		Standard_Boolean HasGeometricModelLink();

		/****** StepVisual_TessellatedWire::Init ******/
		/****** md5 signature: 3e058d127115bf40cd9b0af41383277f ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theItems: StepVisual_HArray1OfTessellatedEdgeOrVertex
theHasGeometricModelLink: bool
theGeometricModelLink: StepVisual_PathOrCompositeCurve

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepVisual_HArray1OfTessellatedEdgeOrVertex> & theItems, const Standard_Boolean theHasGeometricModelLink, const StepVisual_PathOrCompositeCurve & theGeometricModelLink);

		/****** StepVisual_TessellatedWire::Items ******/
		/****** md5 signature: 7173f9b87705b3ad84710a5560ff269f ******/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_HArray1OfTessellatedEdgeOrVertex>

Description
-----------
Returns field Items.
") Items;
		opencascade::handle<StepVisual_HArray1OfTessellatedEdgeOrVertex> Items();

		/****** StepVisual_TessellatedWire::ItemsValue ******/
		/****** md5 signature: 5d3a2bcb1e6aad294ea96aa96fa9b5b4 ******/
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
		const StepVisual_TessellatedEdgeOrVertex & ItemsValue(const Standard_Integer theNum);

		/****** StepVisual_TessellatedWire::NbItems ******/
		/****** md5 signature: f3da46c6111cc4b112ff30aff83385d6 ******/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of Items.
") NbItems;
		Standard_Integer NbItems();

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
		/****** md5 signature: 259d17bf79770a16966154928a674ffa ******/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "
Parameters
----------
theItems: StepVisual_HArray1OfTessellatedEdgeOrVertex

Return
-------
None

Description
-----------
Sets field Items.
") SetItems;
		void SetItems(const opencascade::handle<StepVisual_HArray1OfTessellatedEdgeOrVertex> & theItems);

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
		/****** md5 signature: f404ef9ffc1e7202571832cfe61d6f1a ******/
		%feature("compactdefaultargs") Characteristics;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_HArray1OfBoxCharacteristicSelect>

Description
-----------
No available documentation.
") Characteristics;
		opencascade::handle<StepVisual_HArray1OfBoxCharacteristicSelect> Characteristics();

		/****** StepVisual_TextStyleWithBoxCharacteristics::CharacteristicsValue ******/
		/****** md5 signature: d504f1937c0bfbbf3548ed45b0cf5d75 ******/
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
		StepVisual_BoxCharacteristicSelect CharacteristicsValue(const Standard_Integer num);

		/****** StepVisual_TextStyleWithBoxCharacteristics::Init ******/
		/****** md5 signature: f2cdd3ec9856430e059eee611e1e6811 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aCharacterAppearance: StepVisual_TextStyleForDefinedFont
aCharacteristics: StepVisual_HArray1OfBoxCharacteristicSelect

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepVisual_TextStyleForDefinedFont> & aCharacterAppearance, const opencascade::handle<StepVisual_HArray1OfBoxCharacteristicSelect> & aCharacteristics);

		/****** StepVisual_TextStyleWithBoxCharacteristics::NbCharacteristics ******/
		/****** md5 signature: 4c7f646d04322e6acab962ed47134e10 ******/
		%feature("compactdefaultargs") NbCharacteristics;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbCharacteristics;
		Standard_Integer NbCharacteristics();

		/****** StepVisual_TextStyleWithBoxCharacteristics::SetCharacteristics ******/
		/****** md5 signature: 8fdd6de6baaffbe99586f96ed70c9a26 ******/
		%feature("compactdefaultargs") SetCharacteristics;
		%feature("autodoc", "
Parameters
----------
aCharacteristics: StepVisual_HArray1OfBoxCharacteristicSelect

Return
-------
None

Description
-----------
No available documentation.
") SetCharacteristics;
		void SetCharacteristics(const opencascade::handle<StepVisual_HArray1OfBoxCharacteristicSelect> & aCharacteristics);

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
		/****** md5 signature: da37e729d86f3d06f5f8f71fb1dab436 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theStyles: StepVisual_HArray1OfPresentationStyleAssignment
theItem: Standard_Transient
theFillStyleTarget: StepGeom_GeometricRepresentationItem

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<StepVisual_HArray1OfPresentationStyleAssignment> & theStyles, const opencascade::handle<Standard_Transient> & theItem, const opencascade::handle<StepGeom_GeometricRepresentationItem> & theFillStyleTarget);

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
		/****** md5 signature: 30df17a80e0c98e5b234b9ff1cd427a0 ******/
		%feature("compactdefaultargs") Elements;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_HArray1OfAnnotationPlaneElement>

Description
-----------
Returns field Elements.
") Elements;
		opencascade::handle<StepVisual_HArray1OfAnnotationPlaneElement> Elements();

		/****** StepVisual_AnnotationPlane::ElementsValue ******/
		/****** md5 signature: 379b6c8e1b13a66de92ec2d7c43d8776 ******/
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
		StepVisual_AnnotationPlaneElement ElementsValue(const Standard_Integer theNum);

		/****** StepVisual_AnnotationPlane::Init ******/
		/****** md5 signature: 860354e1ff63df2679046b0a92f60e36 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theStyles: StepVisual_HArray1OfPresentationStyleAssignment
theItem: Standard_Transient
theElements: StepVisual_HArray1OfAnnotationPlaneElement

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<StepVisual_HArray1OfPresentationStyleAssignment> & theStyles, const opencascade::handle<Standard_Transient> & theItem, const opencascade::handle<StepVisual_HArray1OfAnnotationPlaneElement> & theElements);

		/****** StepVisual_AnnotationPlane::NbElements ******/
		/****** md5 signature: a2c5844890f023732a846fde2e05ced3 ******/
		%feature("compactdefaultargs") NbElements;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of Elements.
") NbElements;
		Standard_Integer NbElements();

		/****** StepVisual_AnnotationPlane::SetElements ******/
		/****** md5 signature: 536b19fc09faf4695df49add05c14afe ******/
		%feature("compactdefaultargs") SetElements;
		%feature("autodoc", "
Parameters
----------
theElements: StepVisual_HArray1OfAnnotationPlaneElement

Return
-------
None

Description
-----------
Set field Elements.
") SetElements;
		void SetElements(const opencascade::handle<StepVisual_HArray1OfAnnotationPlaneElement> & theElements);

		/****** StepVisual_AnnotationPlane::SetElementsValue ******/
		/****** md5 signature: 3e944a5dc67dafe486647a4b36fef1cc ******/
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
		void SetElementsValue(const Standard_Integer theNum, const StepVisual_AnnotationPlaneElement & theItem);

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
		/****** md5 signature: 87e84293664db9dea1350dfc9b17aaca ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theViewReferenceSystem: StepGeom_Axis2Placement3d
thePerspectiveOfVolume: StepVisual_ViewVolume
theShapeClipping: StepVisual_HArray1OfCameraModelD3MultiClippingInterectionSelect

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<StepGeom_Axis2Placement3d> & theViewReferenceSystem, const opencascade::handle<StepVisual_ViewVolume> & thePerspectiveOfVolume, const opencascade::handle<StepVisual_HArray1OfCameraModelD3MultiClippingInterectionSelect> & theShapeClipping);

		/****** StepVisual_CameraModelD3MultiClipping::SetShapeClipping ******/
		/****** md5 signature: d3f138def09366b1d4de0425b5fa7872 ******/
		%feature("compactdefaultargs") SetShapeClipping;
		%feature("autodoc", "
Parameters
----------
theShapeClipping: StepVisual_HArray1OfCameraModelD3MultiClippingInterectionSelect

Return
-------
None

Description
-----------
No available documentation.
") SetShapeClipping;
		void SetShapeClipping(const opencascade::handle<StepVisual_HArray1OfCameraModelD3MultiClippingInterectionSelect> & theShapeClipping);

		/****** StepVisual_CameraModelD3MultiClipping::ShapeClipping ******/
		/****** md5 signature: 6eb5c9a377534fa0b6410bb68e41bb5b ******/
		%feature("compactdefaultargs") ShapeClipping;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_HArray1OfCameraModelD3MultiClippingInterectionSelect>

Description
-----------
No available documentation.
") ShapeClipping;
		const opencascade::handle<StepVisual_HArray1OfCameraModelD3MultiClippingInterectionSelect> ShapeClipping();

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
		/****** md5 signature: 4771e446272835844a2885353fcdb8a9 ******/
		%feature("compactdefaultargs") Blue;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Blue;
		Standard_Real Blue();

		/****** StepVisual_ColourRgb::Green ******/
		/****** md5 signature: 3857670a16bf31e5b3300ec575b3b216 ******/
		%feature("compactdefaultargs") Green;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Green;
		Standard_Real Green();

		/****** StepVisual_ColourRgb::Init ******/
		/****** md5 signature: b7e1356da609efcfd53471dedf143b49 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aRed: float
aGreen: float
aBlue: float

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const Standard_Real aRed, const Standard_Real aGreen, const Standard_Real aBlue);

		/****** StepVisual_ColourRgb::Red ******/
		/****** md5 signature: 0afa693a7d24010fd8ce065be2035322 ******/
		%feature("compactdefaultargs") Red;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Red;
		Standard_Real Red();

		/****** StepVisual_ColourRgb::SetBlue ******/
		/****** md5 signature: 153b68d0a9744c5c4a5834c535b2fe82 ******/
		%feature("compactdefaultargs") SetBlue;
		%feature("autodoc", "
Parameters
----------
aBlue: float

Return
-------
None

Description
-----------
No available documentation.
") SetBlue;
		void SetBlue(const Standard_Real aBlue);

		/****** StepVisual_ColourRgb::SetGreen ******/
		/****** md5 signature: 4ffb261016c5334ce3b48e8f3df004e0 ******/
		%feature("compactdefaultargs") SetGreen;
		%feature("autodoc", "
Parameters
----------
aGreen: float

Return
-------
None

Description
-----------
No available documentation.
") SetGreen;
		void SetGreen(const Standard_Real aGreen);

		/****** StepVisual_ColourRgb::SetRed ******/
		/****** md5 signature: 4fed618355890a659dc4d036fb5614c4 ******/
		%feature("compactdefaultargs") SetRed;
		%feature("autodoc", "
Parameters
----------
aRed: float

Return
-------
None

Description
-----------
No available documentation.
") SetRed;
		void SetRed(const Standard_Real aRed);

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
		/****** md5 signature: 63566f9c374f4f0aa10d5acf4d88a990 ******/
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
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepVisual_CoordinatesList> & theTessellatedSurfaceSet_Coordinates, const Standard_Integer theTessellatedSurfaceSet_Pnmax, const opencascade::handle<TColStd_HArray2OfReal> & theTessellatedSurfaceSet_Normals, const opencascade::handle<TColStd_HArray1OfInteger> & thePnindex, const opencascade::handle<TColStd_HArray1OfTransient> & theTriangleStrips, const opencascade::handle<TColStd_HArray1OfTransient> & theTriangleFans);

		/****** StepVisual_ComplexTriangulatedSurfaceSet::NbPnindex ******/
		/****** md5 signature: 03e8354a763a2dc9d1f09532c550e87a ******/
		%feature("compactdefaultargs") NbPnindex;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of Pnindex.
") NbPnindex;
		Standard_Integer NbPnindex();

		/****** StepVisual_ComplexTriangulatedSurfaceSet::NbTriangleFans ******/
		/****** md5 signature: e32a7cc03e1bf132b8ca51d998c1ef91 ******/
		%feature("compactdefaultargs") NbTriangleFans;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of TriangleFans.
") NbTriangleFans;
		Standard_Integer NbTriangleFans();

		/****** StepVisual_ComplexTriangulatedSurfaceSet::NbTriangleStrips ******/
		/****** md5 signature: 41f96c6e8734a500c69e77eb743995d5 ******/
		%feature("compactdefaultargs") NbTriangleStrips;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of TriangleStrips.
") NbTriangleStrips;
		Standard_Integer NbTriangleStrips();

		/****** StepVisual_ComplexTriangulatedSurfaceSet::Pnindex ******/
		/****** md5 signature: 4b1e18390247fb42f42f10361e8626ac ******/
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
		/****** md5 signature: fee0b439b0a18d03931d2516a7a9914f ******/
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
		Standard_Integer PnindexValue(const Standard_Integer theNum);

		/****** StepVisual_ComplexTriangulatedSurfaceSet::SetPnindex ******/
		/****** md5 signature: 43575e7d7486f7f39672441e3410d824 ******/
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
		/****** md5 signature: 9629b6105819199c0dd3f0e14db0df98 ******/
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
		void SetTriangleFans(const opencascade::handle<TColStd_HArray1OfTransient> & theTriangleFans);

		/****** StepVisual_ComplexTriangulatedSurfaceSet::SetTriangleStrips ******/
		/****** md5 signature: 49e636f3062980a08cfdfaafe4ef656a ******/
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
		void SetTriangleStrips(const opencascade::handle<TColStd_HArray1OfTransient> & theTriangleStrips);

		/****** StepVisual_ComplexTriangulatedSurfaceSet::TriangleFans ******/
		/****** md5 signature: 07232d50b3ce09c2619ce7c6fa0c1c43 ******/
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
		/****** md5 signature: dd10a0721f01f517c2ac8d65518e6951 ******/
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
		/****** md5 signature: c24b8b9ad7b5d9a438ed02d1ab423525 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aStyles: StepVisual_HArray1OfPresentationStyleAssignment
aItem: Standard_Transient
aOverRiddenStyle: StepVisual_StyledItem
aStyleContext: StepVisual_HArray1OfStyleContextSelect

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepVisual_HArray1OfPresentationStyleAssignment> & aStyles, const opencascade::handle<Standard_Transient> & aItem, const opencascade::handle<StepVisual_StyledItem> & aOverRiddenStyle, const opencascade::handle<StepVisual_HArray1OfStyleContextSelect> & aStyleContext);

		/****** StepVisual_ContextDependentOverRidingStyledItem::NbStyleContext ******/
		/****** md5 signature: e206fcfa49f6276b6afdc06f261c7d44 ******/
		%feature("compactdefaultargs") NbStyleContext;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbStyleContext;
		Standard_Integer NbStyleContext();

		/****** StepVisual_ContextDependentOverRidingStyledItem::SetStyleContext ******/
		/****** md5 signature: 7d00700c8ebba1fb8dc98de6e0ff48bd ******/
		%feature("compactdefaultargs") SetStyleContext;
		%feature("autodoc", "
Parameters
----------
aStyleContext: StepVisual_HArray1OfStyleContextSelect

Return
-------
None

Description
-----------
No available documentation.
") SetStyleContext;
		void SetStyleContext(const opencascade::handle<StepVisual_HArray1OfStyleContextSelect> & aStyleContext);

		/****** StepVisual_ContextDependentOverRidingStyledItem::StyleContext ******/
		/****** md5 signature: 1062c06ab4b28ef6d87d81774a639831 ******/
		%feature("compactdefaultargs") StyleContext;
		%feature("autodoc", "Return
-------
opencascade::handle<StepVisual_HArray1OfStyleContextSelect>

Description
-----------
No available documentation.
") StyleContext;
		opencascade::handle<StepVisual_HArray1OfStyleContextSelect> StyleContext();

		/****** StepVisual_ContextDependentOverRidingStyledItem::StyleContextValue ******/
		/****** md5 signature: 84bf7add41c48b8b6ef0e966cfaea101 ******/
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
		StepVisual_StyleContextSelect StyleContextValue(const Standard_Integer num);

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
		/****** md5 signature: 4dadf8237649c53a97237d8aad1e7be2 ******/
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
		/****** md5 signature: 2bf436aa69aeba3149fe483555dd0d5b ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theItems: NCollection_Handle<StepVisual_Array1OfTessellatedItem>
theLocation: StepGeom_Axis2Placement3d

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const NCollection_Handle<StepVisual_Array1OfTessellatedItem> & theItems, const opencascade::handle<StepGeom_Axis2Placement3d> & theLocation);

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
		/****** md5 signature: 432ca769d0ec23ad86df023b91c35498 ******/
		%feature("compactdefaultargs") HasGeometricLink;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field GeometricLink is defined.
") HasGeometricLink;
		Standard_Boolean HasGeometricLink();

		/****** StepVisual_TessellatedEdge::Init ******/
		/****** md5 signature: 11a5c3cdbb8a817154f67381d04958f4 ******/
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
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepVisual_CoordinatesList> & theCoordinates, const Standard_Boolean theHasGeometricLink, const StepVisual_EdgeOrCurve & theGeometricLink, const opencascade::handle<TColStd_HArray1OfInteger> & theLineStrip);

		/****** StepVisual_TessellatedEdge::LineStrip ******/
		/****** md5 signature: 3ef443bbf72e31cb5369b198c3ad9fc5 ******/
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
		/****** md5 signature: a1e48466fbe771da213017820e55d46b ******/
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
		Standard_Integer LineStripValue(const Standard_Integer theNum);

		/****** StepVisual_TessellatedEdge::NbLineStrip ******/
		/****** md5 signature: e3a6a387f711fc1b2573309d507eb3f8 ******/
		%feature("compactdefaultargs") NbLineStrip;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of LineStrip.
") NbLineStrip;
		Standard_Integer NbLineStrip();

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
		/****** md5 signature: ede707a2de223a4694210c12bfadb98a ******/
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
		/****** md5 signature: 432ca769d0ec23ad86df023b91c35498 ******/
		%feature("compactdefaultargs") HasGeometricLink;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field GeometricLink is defined.
") HasGeometricLink;
		Standard_Boolean HasGeometricLink();

		/****** StepVisual_TessellatedFace::Init ******/
		/****** md5 signature: 835bebcd43fab8c7eb2394c030081db6 ******/
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
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepVisual_CoordinatesList> & theCoordinates, const Standard_Integer thePnmax, const opencascade::handle<TColStd_HArray2OfReal> & theNormals, const Standard_Boolean theHasGeometricLink, const StepVisual_FaceOrSurface & theGeometricLink);

		/****** StepVisual_TessellatedFace::NbNormals ******/
		/****** md5 signature: e8ae9c17a546ef8db4eb8b45e7edd0e8 ******/
		%feature("compactdefaultargs") NbNormals;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of Normals.
") NbNormals;
		Standard_Integer NbNormals();

		/****** StepVisual_TessellatedFace::Normals ******/
		/****** md5 signature: 369b381d12bed5d4109e95bc2ede0ab6 ******/
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
		/****** md5 signature: 0b280e192c56c44fffab9481c68ac038 ******/
		%feature("compactdefaultargs") Pnmax;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns field Pnmax.
") Pnmax;
		Standard_Integer Pnmax();

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
		/****** md5 signature: 6dd69aae81e446ea2f47e92611adf4ec ******/
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
		/****** md5 signature: 684034e32240f760527db1f7f7c9f728 ******/
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
		void SetPnmax(const Standard_Integer thePnmax);

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
		/****** md5 signature: b2a8f6180f026b329187f8297fbc4881 ******/
		%feature("compactdefaultargs") HasTopologicalLink;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field TopologicalLink is defined.
") HasTopologicalLink;
		Standard_Boolean HasTopologicalLink();

		/****** StepVisual_TessellatedVertex::Init ******/
		/****** md5 signature: 7a588a64770cae4be3ab835050b28a7b ******/
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
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepVisual_CoordinatesList> & theCoordinates, const Standard_Boolean theHasTopologicalLink, const opencascade::handle<StepShape_VertexPoint> & theTopologicalLink, const Standard_Integer thePointIndex);

		/****** StepVisual_TessellatedVertex::PointIndex ******/
		/****** md5 signature: a7100f38206242b5067e31337a15de37 ******/
		%feature("compactdefaultargs") PointIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns field PointIndex.
") PointIndex;
		Standard_Integer PointIndex();

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
		/****** md5 signature: d00ee3c6c96d00bf1679920e38c21622 ******/
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
		void SetPointIndex(const Standard_Integer thePointIndex);

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
		/****** md5 signature: 3ffa47b673439b6a5d3f4f39a3856c61 ******/
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
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItemName, const opencascade::handle<StepVisual_CoordinatesList> & theTessellatedFaceCoordinates, const Standard_Integer theTessellatedFacePnmax, const opencascade::handle<TColStd_HArray2OfReal> & theTessellatedFaceNormals, const opencascade::handle<TColStd_HArray1OfInteger> & thePnindex, const opencascade::handle<TColStd_HArray2OfInteger> & theTriangles);

		/****** StepVisual_TriangulatedSurfaceSet::NbPnindex ******/
		/****** md5 signature: 03e8354a763a2dc9d1f09532c550e87a ******/
		%feature("compactdefaultargs") NbPnindex;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of Pnindex.
") NbPnindex;
		Standard_Integer NbPnindex();

		/****** StepVisual_TriangulatedSurfaceSet::NbTriangles ******/
		/****** md5 signature: c1e2294db77a16b75e32923c5461b457 ******/
		%feature("compactdefaultargs") NbTriangles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of Triangles.
") NbTriangles;
		Standard_Integer NbTriangles();

		/****** StepVisual_TriangulatedSurfaceSet::Pnindex ******/
		/****** md5 signature: cff3c5eb8d6e25aa45b47da9a42703c3 ******/
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
		/****** md5 signature: fee0b439b0a18d03931d2516a7a9914f ******/
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
		Standard_Integer PnindexValue(const Standard_Integer theNum);

		/****** StepVisual_TriangulatedSurfaceSet::SetPnindex ******/
		/****** md5 signature: 110102dd4b7257dec29b0db217b97edf ******/
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
		/****** md5 signature: fd0f621d0e44e0a5ea8c27a6e3ac9a39 ******/
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
		/****** md5 signature: 240ee640b11d228ad1fef9537a847098 ******/
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
		/****** md5 signature: b7f18cc4ed3463aaf8bf8db40c193d48 ******/
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
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepVisual_CoordinatesList> & theTessellatedFace_Coordinates, const Standard_Integer theTessellatedFace_Pnmax, const opencascade::handle<TColStd_HArray2OfReal> & theTessellatedFace_Normals, const Standard_Boolean theHasTessellatedFace_GeometricLink, const StepVisual_FaceOrSurface & theTessellatedFace_GeometricLink, const opencascade::handle<TColStd_HArray1OfInteger> & thePnindex, const opencascade::handle<TColStd_HArray1OfTransient> & theTriangleStrips, const opencascade::handle<TColStd_HArray1OfTransient> & theTriangleFans);

		/****** StepVisual_ComplexTriangulatedFace::NbPnindex ******/
		/****** md5 signature: 03e8354a763a2dc9d1f09532c550e87a ******/
		%feature("compactdefaultargs") NbPnindex;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of Pnindex.
") NbPnindex;
		Standard_Integer NbPnindex();

		/****** StepVisual_ComplexTriangulatedFace::NbTriangleFans ******/
		/****** md5 signature: e32a7cc03e1bf132b8ca51d998c1ef91 ******/
		%feature("compactdefaultargs") NbTriangleFans;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of TriangleFans.
") NbTriangleFans;
		Standard_Integer NbTriangleFans();

		/****** StepVisual_ComplexTriangulatedFace::NbTriangleStrips ******/
		/****** md5 signature: 41f96c6e8734a500c69e77eb743995d5 ******/
		%feature("compactdefaultargs") NbTriangleStrips;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of TriangleStrips.
") NbTriangleStrips;
		Standard_Integer NbTriangleStrips();

		/****** StepVisual_ComplexTriangulatedFace::Pnindex ******/
		/****** md5 signature: 4b1e18390247fb42f42f10361e8626ac ******/
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
		/****** md5 signature: fee0b439b0a18d03931d2516a7a9914f ******/
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
		Standard_Integer PnindexValue(const Standard_Integer theNum);

		/****** StepVisual_ComplexTriangulatedFace::SetPnindex ******/
		/****** md5 signature: 43575e7d7486f7f39672441e3410d824 ******/
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
		/****** md5 signature: 9629b6105819199c0dd3f0e14db0df98 ******/
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
		void SetTriangleFans(const opencascade::handle<TColStd_HArray1OfTransient> & theTriangleFans);

		/****** StepVisual_ComplexTriangulatedFace::SetTriangleStrips ******/
		/****** md5 signature: 49e636f3062980a08cfdfaafe4ef656a ******/
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
		void SetTriangleStrips(const opencascade::handle<TColStd_HArray1OfTransient> & theTriangleStrips);

		/****** StepVisual_ComplexTriangulatedFace::TriangleFans ******/
		/****** md5 signature: 07232d50b3ce09c2619ce7c6fa0c1c43 ******/
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
		/****** md5 signature: dd10a0721f01f517c2ac8d65518e6951 ******/
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
		/****** md5 signature: 102b295b6af84fe7d8a1b398774f2b91 ******/
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
		/****** md5 signature: 33020c5fbd6b62e12d7b9c676274ab5d ******/
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
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepVisual_CoordinatesList> & theTessellatedFace_Coordinates, const Standard_Integer theTessellatedFace_Pnmax, const opencascade::handle<TColStd_HArray2OfReal> & theTessellatedFace_Normals, const Standard_Boolean theHasTessellatedFace_GeometricLink, const StepVisual_FaceOrSurface & theTessellatedFace_GeometricLink, const opencascade::handle<TColStd_HArray2OfInteger> & theCtriangles);

		/****** StepVisual_CubicBezierTriangulatedFace::NbCtriangles ******/
		/****** md5 signature: 13825b33bcce4596e533525b461804fe ******/
		%feature("compactdefaultargs") NbCtriangles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of Ctriangles.
") NbCtriangles;
		Standard_Integer NbCtriangles();

		/****** StepVisual_CubicBezierTriangulatedFace::SetCtriangles ******/
		/****** md5 signature: c78b3847a8d411dcb9aa0b29064c662e ******/
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
		/****** md5 signature: 6f7011c37a483db00e2012c0e0b5fed6 ******/
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
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepVisual_CoordinatesList> & theTessellatedEdge_Coordinates, const Standard_Boolean theHasTessellatedEdge_GeometricLink, const StepVisual_EdgeOrCurve & theTessellatedEdge_GeometricLink, const opencascade::handle<TColStd_HArray1OfInteger> & theTessellatedEdge_LineStrip, const StepData_Logical theSmooth, const opencascade::handle<StepVisual_TessellatedFace> & theFace1, const opencascade::handle<StepVisual_TessellatedFace> & theFace2, const opencascade::handle<TColStd_HArray1OfInteger> & theLineStripFace1, const opencascade::handle<TColStd_HArray1OfInteger> & theLineStripFace2);

		/****** StepVisual_TessellatedConnectingEdge::LineStripFace1 ******/
		/****** md5 signature: 0b7971e6a92c9c058b28d7fbec9a3bb1 ******/
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
		/****** md5 signature: b66bd9daa4369c7dbc9c9933e5752bb9 ******/
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
		Standard_Integer LineStripFace1Value(const Standard_Integer theNum);

		/****** StepVisual_TessellatedConnectingEdge::LineStripFace2 ******/
		/****** md5 signature: df497d760e695587a621010b5edcb83e ******/
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
		/****** md5 signature: 1a065201dc96fe780a0ca0f3bba9b65c ******/
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
		Standard_Integer LineStripFace2Value(const Standard_Integer theNum);

		/****** StepVisual_TessellatedConnectingEdge::NbLineStripFace1 ******/
		/****** md5 signature: 6635634092840488cc7bb70f66269c04 ******/
		%feature("compactdefaultargs") NbLineStripFace1;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of LineStripFace1.
") NbLineStripFace1;
		Standard_Integer NbLineStripFace1();

		/****** StepVisual_TessellatedConnectingEdge::NbLineStripFace2 ******/
		/****** md5 signature: f48092b6b68ea97a6dd7859a19f37f10 ******/
		%feature("compactdefaultargs") NbLineStripFace2;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of LineStripFace2.
") NbLineStripFace2;
		Standard_Integer NbLineStripFace2();

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
		/****** md5 signature: 13b5d9f5b2ea77a515da533e3f220c3d ******/
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
		/****** md5 signature: d540d27bf6489bfed701c6605eae7f77 ******/
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
		/****** md5 signature: 51fae17da7ab38215a33b883083c62fc ******/
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
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const opencascade::handle<StepVisual_CoordinatesList> & theTessellatedFace_Coordinates, const Standard_Integer theTessellatedFace_Pnmax, const opencascade::handle<TColStd_HArray2OfReal> & theTessellatedFace_Normals, const Standard_Boolean theHasTessellatedFace_GeometricLink, const StepVisual_FaceOrSurface & theTessellatedFace_GeometricLink, const opencascade::handle<TColStd_HArray1OfInteger> & thePnindex, const opencascade::handle<TColStd_HArray2OfInteger> & theTriangles);

		/****** StepVisual_TriangulatedFace::NbPnindex ******/
		/****** md5 signature: 03e8354a763a2dc9d1f09532c550e87a ******/
		%feature("compactdefaultargs") NbPnindex;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of Pnindex.
") NbPnindex;
		Standard_Integer NbPnindex();

		/****** StepVisual_TriangulatedFace::NbTriangles ******/
		/****** md5 signature: c1e2294db77a16b75e32923c5461b457 ******/
		%feature("compactdefaultargs") NbTriangles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of Triangles.
") NbTriangles;
		Standard_Integer NbTriangles();

		/****** StepVisual_TriangulatedFace::Pnindex ******/
		/****** md5 signature: 4b1e18390247fb42f42f10361e8626ac ******/
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
		/****** md5 signature: fee0b439b0a18d03931d2516a7a9914f ******/
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
		Standard_Integer PnindexValue(const Standard_Integer theNum);

		/****** StepVisual_TriangulatedFace::SetPnindex ******/
		/****** md5 signature: 43575e7d7486f7f39672441e3410d824 ******/
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
		/****** md5 signature: 7becaa4c9c5db60f179ba306d43829c7 ******/
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
		/****** md5 signature: f0a213a304d57e07a9ee9efaa8d64eff ******/
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

class StepVisual_HArray1OfAnnotationPlaneElement : public StepVisual_Array1OfAnnotationPlaneElement, public Standard_Transient {
  public:
    StepVisual_HArray1OfAnnotationPlaneElement(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfAnnotationPlaneElement(const Standard_Integer theLower, const Standard_Integer theUpper, const StepVisual_Array1OfAnnotationPlaneElement::value_type& theValue);
    StepVisual_HArray1OfAnnotationPlaneElement(const StepVisual_Array1OfAnnotationPlaneElement& theOther);
    const StepVisual_Array1OfAnnotationPlaneElement& Array1();
    StepVisual_Array1OfAnnotationPlaneElement& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfAnnotationPlaneElement)


class StepVisual_HArray1OfBoxCharacteristicSelect : public StepVisual_Array1OfBoxCharacteristicSelect, public Standard_Transient {
  public:
    StepVisual_HArray1OfBoxCharacteristicSelect(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfBoxCharacteristicSelect(const Standard_Integer theLower, const Standard_Integer theUpper, const StepVisual_Array1OfBoxCharacteristicSelect::value_type& theValue);
    StepVisual_HArray1OfBoxCharacteristicSelect(const StepVisual_Array1OfBoxCharacteristicSelect& theOther);
    const StepVisual_Array1OfBoxCharacteristicSelect& Array1();
    StepVisual_Array1OfBoxCharacteristicSelect& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfBoxCharacteristicSelect)


class StepVisual_HArray1OfCameraModelD3MultiClippingInterectionSelect : public StepVisual_Array1OfCameraModelD3MultiClippingInterectionSelect, public Standard_Transient {
  public:
    StepVisual_HArray1OfCameraModelD3MultiClippingInterectionSelect(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfCameraModelD3MultiClippingInterectionSelect(const Standard_Integer theLower, const Standard_Integer theUpper, const StepVisual_Array1OfCameraModelD3MultiClippingInterectionSelect::value_type& theValue);
    StepVisual_HArray1OfCameraModelD3MultiClippingInterectionSelect(const StepVisual_Array1OfCameraModelD3MultiClippingInterectionSelect& theOther);
    const StepVisual_Array1OfCameraModelD3MultiClippingInterectionSelect& Array1();
    StepVisual_Array1OfCameraModelD3MultiClippingInterectionSelect& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfCameraModelD3MultiClippingInterectionSelect)


class StepVisual_HArray1OfCameraModelD3MultiClippingUnionSelect : public StepVisual_Array1OfCameraModelD3MultiClippingUnionSelect, public Standard_Transient {
  public:
    StepVisual_HArray1OfCameraModelD3MultiClippingUnionSelect(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfCameraModelD3MultiClippingUnionSelect(const Standard_Integer theLower, const Standard_Integer theUpper, const StepVisual_Array1OfCameraModelD3MultiClippingUnionSelect::value_type& theValue);
    StepVisual_HArray1OfCameraModelD3MultiClippingUnionSelect(const StepVisual_Array1OfCameraModelD3MultiClippingUnionSelect& theOther);
    const StepVisual_Array1OfCameraModelD3MultiClippingUnionSelect& Array1();
    StepVisual_Array1OfCameraModelD3MultiClippingUnionSelect& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfCameraModelD3MultiClippingUnionSelect)


class StepVisual_HArray1OfCurveStyleFontPattern : public StepVisual_Array1OfCurveStyleFontPattern, public Standard_Transient {
  public:
    StepVisual_HArray1OfCurveStyleFontPattern(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfCurveStyleFontPattern(const Standard_Integer theLower, const Standard_Integer theUpper, const StepVisual_Array1OfCurveStyleFontPattern::value_type& theValue);
    StepVisual_HArray1OfCurveStyleFontPattern(const StepVisual_Array1OfCurveStyleFontPattern& theOther);
    const StepVisual_Array1OfCurveStyleFontPattern& Array1();
    StepVisual_Array1OfCurveStyleFontPattern& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfCurveStyleFontPattern)


class StepVisual_HArray1OfDirectionCountSelect : public StepVisual_Array1OfDirectionCountSelect, public Standard_Transient {
  public:
    StepVisual_HArray1OfDirectionCountSelect(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfDirectionCountSelect(const Standard_Integer theLower, const Standard_Integer theUpper, const StepVisual_Array1OfDirectionCountSelect::value_type& theValue);
    StepVisual_HArray1OfDirectionCountSelect(const StepVisual_Array1OfDirectionCountSelect& theOther);
    const StepVisual_Array1OfDirectionCountSelect& Array1();
    StepVisual_Array1OfDirectionCountSelect& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfDirectionCountSelect)


class StepVisual_HArray1OfDraughtingCalloutElement : public StepVisual_Array1OfDraughtingCalloutElement, public Standard_Transient {
  public:
    StepVisual_HArray1OfDraughtingCalloutElement(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfDraughtingCalloutElement(const Standard_Integer theLower, const Standard_Integer theUpper, const StepVisual_Array1OfDraughtingCalloutElement::value_type& theValue);
    StepVisual_HArray1OfDraughtingCalloutElement(const StepVisual_Array1OfDraughtingCalloutElement& theOther);
    const StepVisual_Array1OfDraughtingCalloutElement& Array1();
    StepVisual_Array1OfDraughtingCalloutElement& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfDraughtingCalloutElement)


class StepVisual_HArray1OfFillStyleSelect : public StepVisual_Array1OfFillStyleSelect, public Standard_Transient {
  public:
    StepVisual_HArray1OfFillStyleSelect(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfFillStyleSelect(const Standard_Integer theLower, const Standard_Integer theUpper, const StepVisual_Array1OfFillStyleSelect::value_type& theValue);
    StepVisual_HArray1OfFillStyleSelect(const StepVisual_Array1OfFillStyleSelect& theOther);
    const StepVisual_Array1OfFillStyleSelect& Array1();
    StepVisual_Array1OfFillStyleSelect& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfFillStyleSelect)


class StepVisual_HArray1OfInvisibleItem : public StepVisual_Array1OfInvisibleItem, public Standard_Transient {
  public:
    StepVisual_HArray1OfInvisibleItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfInvisibleItem(const Standard_Integer theLower, const Standard_Integer theUpper, const StepVisual_Array1OfInvisibleItem::value_type& theValue);
    StepVisual_HArray1OfInvisibleItem(const StepVisual_Array1OfInvisibleItem& theOther);
    const StepVisual_Array1OfInvisibleItem& Array1();
    StepVisual_Array1OfInvisibleItem& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfInvisibleItem)


class StepVisual_HArray1OfLayeredItem : public StepVisual_Array1OfLayeredItem, public Standard_Transient {
  public:
    StepVisual_HArray1OfLayeredItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfLayeredItem(const Standard_Integer theLower, const Standard_Integer theUpper, const StepVisual_Array1OfLayeredItem::value_type& theValue);
    StepVisual_HArray1OfLayeredItem(const StepVisual_Array1OfLayeredItem& theOther);
    const StepVisual_Array1OfLayeredItem& Array1();
    StepVisual_Array1OfLayeredItem& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfLayeredItem)


class StepVisual_HArray1OfPresentationStyleAssignment : public StepVisual_Array1OfPresentationStyleAssignment, public Standard_Transient {
  public:
    StepVisual_HArray1OfPresentationStyleAssignment(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfPresentationStyleAssignment(const Standard_Integer theLower, const Standard_Integer theUpper, const StepVisual_Array1OfPresentationStyleAssignment::value_type& theValue);
    StepVisual_HArray1OfPresentationStyleAssignment(const StepVisual_Array1OfPresentationStyleAssignment& theOther);
    const StepVisual_Array1OfPresentationStyleAssignment& Array1();
    StepVisual_Array1OfPresentationStyleAssignment& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfPresentationStyleAssignment)


class StepVisual_HArray1OfPresentationStyleSelect : public StepVisual_Array1OfPresentationStyleSelect, public Standard_Transient {
  public:
    StepVisual_HArray1OfPresentationStyleSelect(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfPresentationStyleSelect(const Standard_Integer theLower, const Standard_Integer theUpper, const StepVisual_Array1OfPresentationStyleSelect::value_type& theValue);
    StepVisual_HArray1OfPresentationStyleSelect(const StepVisual_Array1OfPresentationStyleSelect& theOther);
    const StepVisual_Array1OfPresentationStyleSelect& Array1();
    StepVisual_Array1OfPresentationStyleSelect& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfPresentationStyleSelect)


class StepVisual_HArray1OfRenderingPropertiesSelect : public StepVisual_Array1OfRenderingPropertiesSelect, public Standard_Transient {
  public:
    StepVisual_HArray1OfRenderingPropertiesSelect(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfRenderingPropertiesSelect(const Standard_Integer theLower, const Standard_Integer theUpper, const StepVisual_Array1OfRenderingPropertiesSelect::value_type& theValue);
    StepVisual_HArray1OfRenderingPropertiesSelect(const StepVisual_Array1OfRenderingPropertiesSelect& theOther);
    const StepVisual_Array1OfRenderingPropertiesSelect& Array1();
    StepVisual_Array1OfRenderingPropertiesSelect& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfRenderingPropertiesSelect)


class StepVisual_HArray1OfStyleContextSelect : public StepVisual_Array1OfStyleContextSelect, public Standard_Transient {
  public:
    StepVisual_HArray1OfStyleContextSelect(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfStyleContextSelect(const Standard_Integer theLower, const Standard_Integer theUpper, const StepVisual_Array1OfStyleContextSelect::value_type& theValue);
    StepVisual_HArray1OfStyleContextSelect(const StepVisual_Array1OfStyleContextSelect& theOther);
    const StepVisual_Array1OfStyleContextSelect& Array1();
    StepVisual_Array1OfStyleContextSelect& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfStyleContextSelect)


class StepVisual_HArray1OfSurfaceStyleElementSelect : public StepVisual_Array1OfSurfaceStyleElementSelect, public Standard_Transient {
  public:
    StepVisual_HArray1OfSurfaceStyleElementSelect(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfSurfaceStyleElementSelect(const Standard_Integer theLower, const Standard_Integer theUpper, const StepVisual_Array1OfSurfaceStyleElementSelect::value_type& theValue);
    StepVisual_HArray1OfSurfaceStyleElementSelect(const StepVisual_Array1OfSurfaceStyleElementSelect& theOther);
    const StepVisual_Array1OfSurfaceStyleElementSelect& Array1();
    StepVisual_Array1OfSurfaceStyleElementSelect& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfSurfaceStyleElementSelect)


class StepVisual_HArray1OfTessellatedEdgeOrVertex : public StepVisual_Array1OfTessellatedEdgeOrVertex, public Standard_Transient {
  public:
    StepVisual_HArray1OfTessellatedEdgeOrVertex(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfTessellatedEdgeOrVertex(const Standard_Integer theLower, const Standard_Integer theUpper, const StepVisual_Array1OfTessellatedEdgeOrVertex::value_type& theValue);
    StepVisual_HArray1OfTessellatedEdgeOrVertex(const StepVisual_Array1OfTessellatedEdgeOrVertex& theOther);
    const StepVisual_Array1OfTessellatedEdgeOrVertex& Array1();
    StepVisual_Array1OfTessellatedEdgeOrVertex& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfTessellatedEdgeOrVertex)


class StepVisual_HArray1OfTessellatedStructuredItem : public StepVisual_Array1OfTessellatedStructuredItem, public Standard_Transient {
  public:
    StepVisual_HArray1OfTessellatedStructuredItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfTessellatedStructuredItem(const Standard_Integer theLower, const Standard_Integer theUpper, const StepVisual_Array1OfTessellatedStructuredItem::value_type& theValue);
    StepVisual_HArray1OfTessellatedStructuredItem(const StepVisual_Array1OfTessellatedStructuredItem& theOther);
    const StepVisual_Array1OfTessellatedStructuredItem& Array1();
    StepVisual_Array1OfTessellatedStructuredItem& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfTessellatedStructuredItem)


class StepVisual_HArray1OfTextOrCharacter : public StepVisual_Array1OfTextOrCharacter, public Standard_Transient {
  public:
    StepVisual_HArray1OfTextOrCharacter(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfTextOrCharacter(const Standard_Integer theLower, const Standard_Integer theUpper, const StepVisual_Array1OfTextOrCharacter::value_type& theValue);
    StepVisual_HArray1OfTextOrCharacter(const StepVisual_Array1OfTextOrCharacter& theOther);
    const StepVisual_Array1OfTextOrCharacter& Array1();
    StepVisual_Array1OfTextOrCharacter& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfTextOrCharacter)

/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
