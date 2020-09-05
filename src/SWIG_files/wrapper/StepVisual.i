/*
Copyright 2008-2020 Thomas Paviot (tpaviot@gmail.com)

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
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_stepvisual.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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
enum StepVisual_NullStyle {
	StepVisual_Null = 0,
};

enum StepVisual_CentralOrParallel {
	StepVisual_copCentral = 0,
	StepVisual_copParallel = 1,
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

enum StepVisual_MarkerType {
	StepVisual_mtDot = 0,
	StepVisual_mtX = 1,
	StepVisual_mtPlus = 2,
	StepVisual_mtAsterisk = 3,
	StepVisual_mtRing = 4,
	StepVisual_mtSquare = 5,
	StepVisual_mtTriangle = 6,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class StepVisual_NullStyle(IntEnum):
	StepVisual_Null = 0
StepVisual_Null = StepVisual_NullStyle.StepVisual_Null

class StepVisual_CentralOrParallel(IntEnum):
	StepVisual_copCentral = 0
	StepVisual_copParallel = 1
StepVisual_copCentral = StepVisual_CentralOrParallel.StepVisual_copCentral
StepVisual_copParallel = StepVisual_CentralOrParallel.StepVisual_copParallel

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
%wrap_handle(StepVisual_SurfaceStyleSegmentationCurve)
%wrap_handle(StepVisual_SurfaceStyleSilhouette)
%wrap_handle(StepVisual_SurfaceStyleUsage)
%wrap_handle(StepVisual_Template)
%wrap_handle(StepVisual_TemplateInstance)
%wrap_handle(StepVisual_TessellatedItem)
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
%wrap_handle(StepVisual_CharacterizedObjectAndCharacterizedRepresentationAndDraughtingModelAndRepresentation)
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
%wrap_handle(StepVisual_TessellatedAnnotationOccurrence)
%wrap_handle(StepVisual_TessellatedCurveSet)
%wrap_handle(StepVisual_TessellatedGeometricSet)
%wrap_handle(StepVisual_TextStyleWithBoxCharacteristics)
%wrap_handle(StepVisual_AnnotationCurveOccurrence)
%wrap_handle(StepVisual_AnnotationFillAreaOccurrence)
%wrap_handle(StepVisual_AnnotationPlane)
%wrap_handle(StepVisual_AnnotationTextOccurrence)
%wrap_handle(StepVisual_CameraModelD3MultiClipping)
%wrap_handle(StepVisual_ColourRgb)
%wrap_handle(StepVisual_ContextDependentOverRidingStyledItem)
%wrap_handle(StepVisual_DraughtingAnnotationOccurrence)
%wrap_handle(StepVisual_DraughtingPreDefinedColour)
%wrap_handle(StepVisual_DraughtingPreDefinedCurveFont)
%wrap_handle(StepVisual_MechanicalDesignGeometricPresentationArea)
%wrap_handle(StepVisual_AnnotationCurveOccurrenceAndAnnotationOccurrenceAndGeomReprItemAndReprItemAndStyledItem)
%wrap_handle(StepVisual_HArray1OfAnnotationPlaneElement)
%wrap_handle(StepVisual_HArray1OfDraughtingCalloutElement)
%wrap_handle(StepVisual_HArray1OfDirectionCountSelect)
%wrap_handle(StepVisual_HArray1OfStyleContextSelect)
%wrap_handle(StepVisual_HArray1OfPresentationStyleSelect)
%wrap_handle(StepVisual_HArray1OfCurveStyleFontPattern)
%wrap_handle(StepVisual_HArray1OfBoxCharacteristicSelect)
%wrap_handle(StepVisual_HArray1OfPresentationStyleAssignment)
%wrap_handle(StepVisual_HArray1OfFillStyleSelect)
%wrap_handle(StepVisual_HArray1OfTextOrCharacter)
%wrap_handle(StepVisual_HArray1OfSurfaceStyleElementSelect)
%wrap_handle(StepVisual_HArray1OfCameraModelD3MultiClippingUnionSelect)
%wrap_handle(StepVisual_HArray1OfLayeredItem)
%wrap_handle(StepVisual_HArray1OfCameraModelD3MultiClippingInterectionSelect)
%wrap_handle(StepVisual_HArray1OfInvisibleItem)
/* end handles declaration */

/* templates */
%template(StepVisual_Array1OfAnnotationPlaneElement) NCollection_Array1<StepVisual_AnnotationPlaneElement>;

%extend NCollection_Array1<StepVisual_AnnotationPlaneElement> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepVisual_Array1OfBoxCharacteristicSelect) NCollection_Array1<StepVisual_BoxCharacteristicSelect>;

%extend NCollection_Array1<StepVisual_BoxCharacteristicSelect> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepVisual_Array1OfCameraModelD3MultiClippingInterectionSelect) NCollection_Array1<StepVisual_CameraModelD3MultiClippingInterectionSelect>;

%extend NCollection_Array1<StepVisual_CameraModelD3MultiClippingInterectionSelect> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepVisual_Array1OfCameraModelD3MultiClippingUnionSelect) NCollection_Array1<StepVisual_CameraModelD3MultiClippingUnionSelect>;

%extend NCollection_Array1<StepVisual_CameraModelD3MultiClippingUnionSelect> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepVisual_Array1OfCurveStyleFontPattern) NCollection_Array1<opencascade::handle<StepVisual_CurveStyleFontPattern>>;

%extend NCollection_Array1<opencascade::handle<StepVisual_CurveStyleFontPattern>> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepVisual_Array1OfDirectionCountSelect) NCollection_Array1<StepVisual_DirectionCountSelect>;

%extend NCollection_Array1<StepVisual_DirectionCountSelect> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepVisual_Array1OfDraughtingCalloutElement) NCollection_Array1<StepVisual_DraughtingCalloutElement>;

%extend NCollection_Array1<StepVisual_DraughtingCalloutElement> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepVisual_Array1OfFillStyleSelect) NCollection_Array1<StepVisual_FillStyleSelect>;

%extend NCollection_Array1<StepVisual_FillStyleSelect> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepVisual_Array1OfInvisibleItem) NCollection_Array1<StepVisual_InvisibleItem>;

%extend NCollection_Array1<StepVisual_InvisibleItem> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepVisual_Array1OfLayeredItem) NCollection_Array1<StepVisual_LayeredItem>;

%extend NCollection_Array1<StepVisual_LayeredItem> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepVisual_Array1OfPresentationStyleAssignment) NCollection_Array1<opencascade::handle<StepVisual_PresentationStyleAssignment>>;

%extend NCollection_Array1<opencascade::handle<StepVisual_PresentationStyleAssignment>> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepVisual_Array1OfPresentationStyleSelect) NCollection_Array1<StepVisual_PresentationStyleSelect>;

%extend NCollection_Array1<StepVisual_PresentationStyleSelect> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepVisual_Array1OfStyleContextSelect) NCollection_Array1<StepVisual_StyleContextSelect>;

%extend NCollection_Array1<StepVisual_StyleContextSelect> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepVisual_Array1OfSurfaceStyleElementSelect) NCollection_Array1<StepVisual_SurfaceStyleElementSelect>;

%extend NCollection_Array1<StepVisual_SurfaceStyleElementSelect> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepVisual_Array1OfTessellatedItem) NCollection_Array1<opencascade::handle<StepVisual_TessellatedItem>>;

%extend NCollection_Array1<opencascade::handle<StepVisual_TessellatedItem>> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepVisual_Array1OfTextOrCharacter) NCollection_Array1<StepVisual_TextOrCharacter>;

%extend NCollection_Array1<StepVisual_TextOrCharacter> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
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
typedef NCollection_Array1<StepVisual_StyleContextSelect> StepVisual_Array1OfStyleContextSelect;
typedef NCollection_Array1<StepVisual_SurfaceStyleElementSelect> StepVisual_Array1OfSurfaceStyleElementSelect;
typedef NCollection_Array1<opencascade::handle<StepVisual_TessellatedItem>> StepVisual_Array1OfTessellatedItem;
typedef NCollection_Array1<StepVisual_TextOrCharacter> StepVisual_Array1OfTextOrCharacter;
typedef NCollection_Vector<opencascade::handle<TColStd_HSequenceOfInteger>> StepVisual_VectorOfHSequenceOfInteger;
/* end typedefs declaration */

/**************************************
* class StepVisual_AnnotationFillArea *
**************************************/
class StepVisual_AnnotationFillArea : public StepShape_GeometricCurveSet {
	public:
		/****************** StepVisual_AnnotationFillArea ******************/
		/**** md5 signature: 707299ee72fc5fde632708b68da0d36f ****/
		%feature("compactdefaultargs") StepVisual_AnnotationFillArea;
		%feature("autodoc", "Returns a annotationfillarea.

Returns
-------
None
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
		/****************** StepVisual_AnnotationPlaneElement ******************/
		/**** md5 signature: ce048475b338d8fd2919d43a1446094e ****/
		%feature("compactdefaultargs") StepVisual_AnnotationPlaneElement;
		%feature("autodoc", "Returns a annotationplaneelement select type.

Returns
-------
None
") StepVisual_AnnotationPlaneElement;
		 StepVisual_AnnotationPlaneElement();

		/****************** CaseNum ******************/
		/**** md5 signature: f0e39118a9846e44ccd59de148215261 ****/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a idattributeselect kind entity that is : 1 -> draughtingcallout 2 -> styleditem 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** DraughtingCallout ******************/
		/**** md5 signature: dcafc9e5148472aaa32c6a7f0e12127f ****/
		%feature("compactdefaultargs") DraughtingCallout;
		%feature("autodoc", "Returns value as a draughtingcallout (null if another type).

Returns
-------
opencascade::handle<StepVisual_DraughtingCallout>
") DraughtingCallout;
		opencascade::handle<StepVisual_DraughtingCallout> DraughtingCallout();

		/****************** StyledItem ******************/
		/**** md5 signature: 61c7563ce33340acb54e8fd4f4208e5f ****/
		%feature("compactdefaultargs") StyledItem;
		%feature("autodoc", "Returns value as a styleditem (null if another type).

Returns
-------
opencascade::handle<StepVisual_StyledItem>
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
		/****************** StepVisual_AnnotationText ******************/
		/**** md5 signature: e8f0a57ab81f51928e2d9d16dc632ee0 ****/
		%feature("compactdefaultargs") StepVisual_AnnotationText;
		%feature("autodoc", "Returns a annotationtext.

Returns
-------
None
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
		/****************** StepVisual_AreaInSet ******************/
		/**** md5 signature: 6bd3ed0e3367795e4fc738a6ea2082cf ****/
		%feature("compactdefaultargs") StepVisual_AreaInSet;
		%feature("autodoc", "Returns a areainset.

Returns
-------
None
") StepVisual_AreaInSet;
		 StepVisual_AreaInSet();

		/****************** Area ******************/
		/**** md5 signature: 7c3b8c3fe5bec4dbc522e32daafaa5c8 ****/
		%feature("compactdefaultargs") Area;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepVisual_PresentationArea>
") Area;
		opencascade::handle<StepVisual_PresentationArea> Area();

		/****************** InSet ******************/
		/**** md5 signature: 3fcd983ed074b0c1d012732053dbda10 ****/
		%feature("compactdefaultargs") InSet;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepVisual_PresentationSet>
") InSet;
		opencascade::handle<StepVisual_PresentationSet> InSet();

		/****************** Init ******************/
		/**** md5 signature: 66f984979376799659b1ee12e421f5a4 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aArea: StepVisual_PresentationArea
aInSet: StepVisual_PresentationSet

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepVisual_PresentationArea> & aArea, const opencascade::handle<StepVisual_PresentationSet> & aInSet);

		/****************** SetArea ******************/
		/**** md5 signature: 4c0673e54caab46f527e5d3f0c2ff57b ****/
		%feature("compactdefaultargs") SetArea;
		%feature("autodoc", "No available documentation.

Parameters
----------
aArea: StepVisual_PresentationArea

Returns
-------
None
") SetArea;
		void SetArea(const opencascade::handle<StepVisual_PresentationArea> & aArea);

		/****************** SetInSet ******************/
		/**** md5 signature: beb75360c3fe7bff0ee28192917939e5 ****/
		%feature("compactdefaultargs") SetInSet;
		%feature("autodoc", "No available documentation.

Parameters
----------
aInSet: StepVisual_PresentationSet

Returns
-------
None
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
		/****************** StepVisual_AreaOrView ******************/
		/**** md5 signature: 456c8edf42511e27616007d346726dc9 ****/
		%feature("compactdefaultargs") StepVisual_AreaOrView;
		%feature("autodoc", "Returns a areaorview selecttype.

Returns
-------
None
") StepVisual_AreaOrView;
		 StepVisual_AreaOrView();

		/****************** CaseNum ******************/
		/**** md5 signature: f0e39118a9846e44ccd59de148215261 ****/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a areaorview kind entity that is : 1 -> presentationarea 2 -> presentationview 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** PresentationArea ******************/
		/**** md5 signature: 6adf2ef7fa0a7b503035224ca0f9247c ****/
		%feature("compactdefaultargs") PresentationArea;
		%feature("autodoc", "Returns value as a presentationarea (null if another type).

Returns
-------
opencascade::handle<StepVisual_PresentationArea>
") PresentationArea;
		opencascade::handle<StepVisual_PresentationArea> PresentationArea();

		/****************** PresentationView ******************/
		/**** md5 signature: f42d5482c64642bbea3f6f415c07a2aa ****/
		%feature("compactdefaultargs") PresentationView;
		%feature("autodoc", "Returns value as a presentationview (null if another type).

Returns
-------
opencascade::handle<StepVisual_PresentationView>
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
		/****************** StepVisual_BoxCharacteristicSelect ******************/
		/**** md5 signature: f127438ff3bfb738f33cb51f7c851012 ****/
		%feature("compactdefaultargs") StepVisual_BoxCharacteristicSelect;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepVisual_BoxCharacteristicSelect;
		 StepVisual_BoxCharacteristicSelect();

		/****************** RealValue ******************/
		/**** md5 signature: 8a0c7a2ab7b53f6fb68a06ec0dbc6aa7 ****/
		%feature("compactdefaultargs") RealValue;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") RealValue;
		Standard_Real RealValue();

		/****************** SetRealValue ******************/
		/**** md5 signature: b1a34c70efe46ae8de6ad173e999d614 ****/
		%feature("compactdefaultargs") SetRealValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
aValue: float

Returns
-------
None
") SetRealValue;
		void SetRealValue(const Standard_Real aValue);

		/****************** SetTypeOfContent ******************/
		/**** md5 signature: d14a573f3748772e762e335529920c74 ****/
		%feature("compactdefaultargs") SetTypeOfContent;
		%feature("autodoc", "No available documentation.

Parameters
----------
aType: int

Returns
-------
None
") SetTypeOfContent;
		void SetTypeOfContent(const Standard_Integer aType);

		/****************** TypeOfContent ******************/
		/**** md5 signature: ca265bcca49d9306f069cd5137aa4464 ****/
		%feature("compactdefaultargs") TypeOfContent;
		%feature("autodoc", "No available documentation.

Returns
-------
int
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
		/****************** StepVisual_CameraImage ******************/
		/**** md5 signature: 4ed5a7e4bab1f5cb2cebb22e4acc7268 ****/
		%feature("compactdefaultargs") StepVisual_CameraImage;
		%feature("autodoc", "Returns a cameraimage.

Returns
-------
None
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
		/****************** StepVisual_CameraModel ******************/
		/**** md5 signature: 6dd8b113710ac99d130946a8cb5bf88c ****/
		%feature("compactdefaultargs") StepVisual_CameraModel;
		%feature("autodoc", "Returns a cameramodel.

Returns
-------
None
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
		/****************** StepVisual_CameraModelD3MultiClippingInterectionSelect ******************/
		/**** md5 signature: a9c296993b7abae4366d9924a3df35b1 ****/
		%feature("compactdefaultargs") StepVisual_CameraModelD3MultiClippingInterectionSelect;
		%feature("autodoc", "Returns a cameramodeld3multiclippinginterectionselect select type.

Returns
-------
None
") StepVisual_CameraModelD3MultiClippingInterectionSelect;
		 StepVisual_CameraModelD3MultiClippingInterectionSelect();

		/****************** CameraModelD3MultiClippingUnion ******************/
		/**** md5 signature: 88230e0431dc901bb05693437465807b ****/
		%feature("compactdefaultargs") CameraModelD3MultiClippingUnion;
		%feature("autodoc", "Returns value as a cameramodeld3multiclippingunion (null if another type).

Returns
-------
opencascade::handle<StepVisual_CameraModelD3MultiClippingUnion>
") CameraModelD3MultiClippingUnion;
		opencascade::handle<StepVisual_CameraModelD3MultiClippingUnion> CameraModelD3MultiClippingUnion();

		/****************** CaseNum ******************/
		/**** md5 signature: f0e39118a9846e44ccd59de148215261 ****/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a idattributeselect kind entity that is : 1 -> plane 2 -> cameramodeld3multiclippingunion 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** Plane ******************/
		/**** md5 signature: ef9462bf5902509743365943aea2b64d ****/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "Returns value as a plane (null if another type).

Returns
-------
opencascade::handle<StepGeom_Plane>
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
		/****************** StepVisual_CameraModelD3MultiClippingIntersection ******************/
		/**** md5 signature: 47db55288bb3ff8c5ae4fa31d18ec489 ****/
		%feature("compactdefaultargs") StepVisual_CameraModelD3MultiClippingIntersection;
		%feature("autodoc", "Returns a stepvisual_cameramodeld3multiclippingintersection.

Returns
-------
None
") StepVisual_CameraModelD3MultiClippingIntersection;
		 StepVisual_CameraModelD3MultiClippingIntersection();

		/****************** Init ******************/
		/**** md5 signature: c7d69399b62c4f997e4ef95bf195487b ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
theName: TCollection_HAsciiString
theShapeClipping: StepVisual_HArray1OfCameraModelD3MultiClippingInterectionSelect

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<StepVisual_HArray1OfCameraModelD3MultiClippingInterectionSelect> & theShapeClipping);

		/****************** SetShapeClipping ******************/
		/**** md5 signature: d3f138def09366b1d4de0425b5fa7872 ****/
		%feature("compactdefaultargs") SetShapeClipping;
		%feature("autodoc", "No available documentation.

Parameters
----------
theShapeClipping: StepVisual_HArray1OfCameraModelD3MultiClippingInterectionSelect

Returns
-------
None
") SetShapeClipping;
		void SetShapeClipping(const opencascade::handle<StepVisual_HArray1OfCameraModelD3MultiClippingInterectionSelect> & theShapeClipping);

		/****************** ShapeClipping ******************/
		/**** md5 signature: 6eb5c9a377534fa0b6410bb68e41bb5b ****/
		%feature("compactdefaultargs") ShapeClipping;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepVisual_HArray1OfCameraModelD3MultiClippingInterectionSelect>
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
		/****************** StepVisual_CameraModelD3MultiClippingUnion ******************/
		/**** md5 signature: ca0cf3158bc30c32d6aa32bcd6a25f16 ****/
		%feature("compactdefaultargs") StepVisual_CameraModelD3MultiClippingUnion;
		%feature("autodoc", "Returns a stepvisual_cameramodeld3multiclippingunion.

Returns
-------
None
") StepVisual_CameraModelD3MultiClippingUnion;
		 StepVisual_CameraModelD3MultiClippingUnion();

		/****************** Init ******************/
		/**** md5 signature: 11efd3fe0c5c4a223ffd91529793efcd ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
theName: TCollection_HAsciiString
theShapeClipping: StepVisual_HArray1OfCameraModelD3MultiClippingUnionSelect

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<StepVisual_HArray1OfCameraModelD3MultiClippingUnionSelect> & theShapeClipping);

		/****************** SetShapeClipping ******************/
		/**** md5 signature: 038c1c8ce5cdfba4e8c3a99cb3c5a7e9 ****/
		%feature("compactdefaultargs") SetShapeClipping;
		%feature("autodoc", "No available documentation.

Parameters
----------
theShapeClipping: StepVisual_HArray1OfCameraModelD3MultiClippingUnionSelect

Returns
-------
None
") SetShapeClipping;
		void SetShapeClipping(const opencascade::handle<StepVisual_HArray1OfCameraModelD3MultiClippingUnionSelect> & theShapeClipping);

		/****************** ShapeClipping ******************/
		/**** md5 signature: 66c073b815f6e452df319d197d092d8b ****/
		%feature("compactdefaultargs") ShapeClipping;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepVisual_HArray1OfCameraModelD3MultiClippingUnionSelect>
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
		/****************** StepVisual_CameraModelD3MultiClippingUnionSelect ******************/
		/**** md5 signature: b7695837782ea575f599a451b0238b8b ****/
		%feature("compactdefaultargs") StepVisual_CameraModelD3MultiClippingUnionSelect;
		%feature("autodoc", "Returns a cameramodeld3multiclippingunionselect select type.

Returns
-------
None
") StepVisual_CameraModelD3MultiClippingUnionSelect;
		 StepVisual_CameraModelD3MultiClippingUnionSelect();

		/****************** CameraModelD3MultiClippingIntersection ******************/
		/**** md5 signature: f1eb4518d473d2f1bc0eb4cf37967ce3 ****/
		%feature("compactdefaultargs") CameraModelD3MultiClippingIntersection;
		%feature("autodoc", "Returns value as a cameramodeld3multiclippingintersection (null if another type).

Returns
-------
opencascade::handle<StepVisual_CameraModelD3MultiClippingIntersection>
") CameraModelD3MultiClippingIntersection;
		opencascade::handle<StepVisual_CameraModelD3MultiClippingIntersection> CameraModelD3MultiClippingIntersection();

		/****************** CaseNum ******************/
		/**** md5 signature: f0e39118a9846e44ccd59de148215261 ****/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a idattributeselect kind entity that is : 1 -> plane 2 -> cameramodeld3multiclippingintersection 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** Plane ******************/
		/**** md5 signature: ef9462bf5902509743365943aea2b64d ****/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "Returns value as a plane (null if another type).

Returns
-------
opencascade::handle<StepGeom_Plane>
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
		/****************** StepVisual_CameraUsage ******************/
		/**** md5 signature: 45415ac2e87a3f1d1a7026bfe70cf5c6 ****/
		%feature("compactdefaultargs") StepVisual_CameraUsage;
		%feature("autodoc", "Returns a camerausage.

Returns
-------
None
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
		/****************** StepVisual_Colour ******************/
		/**** md5 signature: a93169512723959304c96e613003b67a ****/
		%feature("compactdefaultargs") StepVisual_Colour;
		%feature("autodoc", "Returns a colour.

Returns
-------
None
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
		/****************** StepVisual_CompositeText ******************/
		/**** md5 signature: ae7d3182b6f8ff9b5cadcab92588a16b ****/
		%feature("compactdefaultargs") StepVisual_CompositeText;
		%feature("autodoc", "Returns a compositetext.

Returns
-------
None
") StepVisual_CompositeText;
		 StepVisual_CompositeText();

		/****************** CollectedText ******************/
		/**** md5 signature: 2cd390c56cca036e0603361f0f50dab8 ****/
		%feature("compactdefaultargs") CollectedText;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepVisual_HArray1OfTextOrCharacter>
") CollectedText;
		opencascade::handle<StepVisual_HArray1OfTextOrCharacter> CollectedText();

		/****************** CollectedTextValue ******************/
		/**** md5 signature: 570a73e4912d499935e33e1e84bddad8 ****/
		%feature("compactdefaultargs") CollectedTextValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
StepVisual_TextOrCharacter
") CollectedTextValue;
		StepVisual_TextOrCharacter CollectedTextValue(const Standard_Integer num);

		/****************** Init ******************/
		/**** md5 signature: 0ac419a47d5af14d5ffe09a081812e1c ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aCollectedText: StepVisual_HArray1OfTextOrCharacter

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepVisual_HArray1OfTextOrCharacter> & aCollectedText);

		/****************** NbCollectedText ******************/
		/**** md5 signature: d17d775367ed59d4fe52e7d92becf9b2 ****/
		%feature("compactdefaultargs") NbCollectedText;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbCollectedText;
		Standard_Integer NbCollectedText();

		/****************** SetCollectedText ******************/
		/**** md5 signature: af98ee77e57354d975664705fcbdf314 ****/
		%feature("compactdefaultargs") SetCollectedText;
		%feature("autodoc", "No available documentation.

Parameters
----------
aCollectedText: StepVisual_HArray1OfTextOrCharacter

Returns
-------
None
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
		/****************** StepVisual_CurveStyle ******************/
		/**** md5 signature: 85aa6e5b1944fe6192adb3190916d4c4 ****/
		%feature("compactdefaultargs") StepVisual_CurveStyle;
		%feature("autodoc", "Returns a curvestyle.

Returns
-------
None
") StepVisual_CurveStyle;
		 StepVisual_CurveStyle();

		/****************** CurveColour ******************/
		/**** md5 signature: 0434c432718ef09a6f61b00546985039 ****/
		%feature("compactdefaultargs") CurveColour;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepVisual_Colour>
") CurveColour;
		opencascade::handle<StepVisual_Colour> CurveColour();

		/****************** CurveFont ******************/
		/**** md5 signature: 2107bd8b73a5abe6d11b55f6e429eed4 ****/
		%feature("compactdefaultargs") CurveFont;
		%feature("autodoc", "No available documentation.

Returns
-------
StepVisual_CurveStyleFontSelect
") CurveFont;
		StepVisual_CurveStyleFontSelect CurveFont();

		/****************** CurveWidth ******************/
		/**** md5 signature: 97802a497f663f2bc68739bf2369f40a ****/
		%feature("compactdefaultargs") CurveWidth;
		%feature("autodoc", "No available documentation.

Returns
-------
StepBasic_SizeSelect
") CurveWidth;
		StepBasic_SizeSelect CurveWidth();

		/****************** Init ******************/
		/**** md5 signature: e11498a4dc00d8ebafab32181cac5ad3 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aCurveFont: StepVisual_CurveStyleFontSelect
aCurveWidth: StepBasic_SizeSelect
aCurveColour: StepVisual_Colour

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const StepVisual_CurveStyleFontSelect & aCurveFont, const StepBasic_SizeSelect & aCurveWidth, const opencascade::handle<StepVisual_Colour> & aCurveColour);

		/****************** Name ******************/
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetCurveColour ******************/
		/**** md5 signature: e12ea3eb92ae412fce7482b84084874b ****/
		%feature("compactdefaultargs") SetCurveColour;
		%feature("autodoc", "No available documentation.

Parameters
----------
aCurveColour: StepVisual_Colour

Returns
-------
None
") SetCurveColour;
		void SetCurveColour(const opencascade::handle<StepVisual_Colour> & aCurveColour);

		/****************** SetCurveFont ******************/
		/**** md5 signature: b8ac1ca16c6ebec6dbf6c90f6e884791 ****/
		%feature("compactdefaultargs") SetCurveFont;
		%feature("autodoc", "No available documentation.

Parameters
----------
aCurveFont: StepVisual_CurveStyleFontSelect

Returns
-------
None
") SetCurveFont;
		void SetCurveFont(const StepVisual_CurveStyleFontSelect & aCurveFont);

		/****************** SetCurveWidth ******************/
		/**** md5 signature: 6bda267d11ee5c873f0daa9fd33e87eb ****/
		%feature("compactdefaultargs") SetCurveWidth;
		%feature("autodoc", "No available documentation.

Parameters
----------
aCurveWidth: StepBasic_SizeSelect

Returns
-------
None
") SetCurveWidth;
		void SetCurveWidth(const StepBasic_SizeSelect & aCurveWidth);

		/****************** SetName ******************/
		/**** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ****/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString

Returns
-------
None
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
		/****************** StepVisual_CurveStyleFont ******************/
		/**** md5 signature: 1b693b23440fc7e9a6ed5407e5b3420b ****/
		%feature("compactdefaultargs") StepVisual_CurveStyleFont;
		%feature("autodoc", "Returns a curvestylefont.

Returns
-------
None
") StepVisual_CurveStyleFont;
		 StepVisual_CurveStyleFont();

		/****************** Init ******************/
		/**** md5 signature: 56be91c2265461529bfbe169d722039b ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aPatternList: StepVisual_HArray1OfCurveStyleFontPattern

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepVisual_HArray1OfCurveStyleFontPattern> & aPatternList);

		/****************** Name ******************/
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** NbPatternList ******************/
		/**** md5 signature: b1b6eda1040dd7056f2e6585591bdf68 ****/
		%feature("compactdefaultargs") NbPatternList;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPatternList;
		Standard_Integer NbPatternList();

		/****************** PatternList ******************/
		/**** md5 signature: 4c6d4f82ee2bff32944dea7e0d3c469e ****/
		%feature("compactdefaultargs") PatternList;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepVisual_HArray1OfCurveStyleFontPattern>
") PatternList;
		opencascade::handle<StepVisual_HArray1OfCurveStyleFontPattern> PatternList();

		/****************** PatternListValue ******************/
		/**** md5 signature: 4ebb3c7b7a8aeb6b8448d1e548314593 ****/
		%feature("compactdefaultargs") PatternListValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
opencascade::handle<StepVisual_CurveStyleFontPattern>
") PatternListValue;
		opencascade::handle<StepVisual_CurveStyleFontPattern> PatternListValue(const Standard_Integer num);

		/****************** SetName ******************/
		/**** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ****/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & aName);

		/****************** SetPatternList ******************/
		/**** md5 signature: 2bf4ac68cd54c522f51dcf81a67a6427 ****/
		%feature("compactdefaultargs") SetPatternList;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPatternList: StepVisual_HArray1OfCurveStyleFontPattern

Returns
-------
None
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
		/****************** StepVisual_CurveStyleFontPattern ******************/
		/**** md5 signature: fea22a6fc8f31f6187185d7f2004703c ****/
		%feature("compactdefaultargs") StepVisual_CurveStyleFontPattern;
		%feature("autodoc", "Returns a curvestylefontpattern.

Returns
-------
None
") StepVisual_CurveStyleFontPattern;
		 StepVisual_CurveStyleFontPattern();

		/****************** Init ******************/
		/**** md5 signature: da8b86f284cc6745833744e819a928be ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aVisibleSegmentLength: float
aInvisibleSegmentLength: float

Returns
-------
None
") Init;
		void Init(const Standard_Real aVisibleSegmentLength, const Standard_Real aInvisibleSegmentLength);

		/****************** InvisibleSegmentLength ******************/
		/**** md5 signature: 8b295afdd729873b7a3167469c7d7c62 ****/
		%feature("compactdefaultargs") InvisibleSegmentLength;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") InvisibleSegmentLength;
		Standard_Real InvisibleSegmentLength();

		/****************** SetInvisibleSegmentLength ******************/
		/**** md5 signature: 63e7a7d60db9ca0863c82f4a0cc3cf5d ****/
		%feature("compactdefaultargs") SetInvisibleSegmentLength;
		%feature("autodoc", "No available documentation.

Parameters
----------
aInvisibleSegmentLength: float

Returns
-------
None
") SetInvisibleSegmentLength;
		void SetInvisibleSegmentLength(const Standard_Real aInvisibleSegmentLength);

		/****************** SetVisibleSegmentLength ******************/
		/**** md5 signature: 7630cd0d6d3230359bbffdfa368b56aa ****/
		%feature("compactdefaultargs") SetVisibleSegmentLength;
		%feature("autodoc", "No available documentation.

Parameters
----------
aVisibleSegmentLength: float

Returns
-------
None
") SetVisibleSegmentLength;
		void SetVisibleSegmentLength(const Standard_Real aVisibleSegmentLength);

		/****************** VisibleSegmentLength ******************/
		/**** md5 signature: bb7aea0f1cc06928a599d62aabfdf1bb ****/
		%feature("compactdefaultargs") VisibleSegmentLength;
		%feature("autodoc", "No available documentation.

Returns
-------
float
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
		/****************** StepVisual_CurveStyleFontSelect ******************/
		/**** md5 signature: 256a5fa863ec7607bb084186b9d94ac3 ****/
		%feature("compactdefaultargs") StepVisual_CurveStyleFontSelect;
		%feature("autodoc", "Returns a curvestylefontselect selecttype.

Returns
-------
None
") StepVisual_CurveStyleFontSelect;
		 StepVisual_CurveStyleFontSelect();

		/****************** CaseNum ******************/
		/**** md5 signature: f0e39118a9846e44ccd59de148215261 ****/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a curvestylefontselect kind entity that is : 1 -> curvestylefont 2 -> predefinedcurvefont 3 -> externallydefinedcurvefont 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** CurveStyleFont ******************/
		/**** md5 signature: eeccc82a951dd63f3e36805c7a195791 ****/
		%feature("compactdefaultargs") CurveStyleFont;
		%feature("autodoc", "Returns value as a curvestylefont (null if another type).

Returns
-------
opencascade::handle<StepVisual_CurveStyleFont>
") CurveStyleFont;
		opencascade::handle<StepVisual_CurveStyleFont> CurveStyleFont();

		/****************** ExternallyDefinedCurveFont ******************/
		/**** md5 signature: ac31317e484b0372b70f9c7d87e01bb4 ****/
		%feature("compactdefaultargs") ExternallyDefinedCurveFont;
		%feature("autodoc", "Returns value as a externallydefinedcurvefont (null if another type).

Returns
-------
opencascade::handle<StepVisual_ExternallyDefinedCurveFont>
") ExternallyDefinedCurveFont;
		opencascade::handle<StepVisual_ExternallyDefinedCurveFont> ExternallyDefinedCurveFont();

		/****************** PreDefinedCurveFont ******************/
		/**** md5 signature: 7620a50516129f5a0e764c594c83d882 ****/
		%feature("compactdefaultargs") PreDefinedCurveFont;
		%feature("autodoc", "Returns value as a predefinedcurvefont (null if another type).

Returns
-------
opencascade::handle<StepVisual_PreDefinedCurveFont>
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
		/****************** StepVisual_DirectionCountSelect ******************/
		/**** md5 signature: 10f56f2413fc42c436629b223beabb4b ****/
		%feature("compactdefaultargs") StepVisual_DirectionCountSelect;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepVisual_DirectionCountSelect;
		 StepVisual_DirectionCountSelect();

		/****************** SetTypeOfContent ******************/
		/**** md5 signature: 64ebf9bba16f3a3a03b5db3858660432 ****/
		%feature("compactdefaultargs") SetTypeOfContent;
		%feature("autodoc", "No available documentation.

Parameters
----------
aTypeOfContent: int

Returns
-------
None
") SetTypeOfContent;
		void SetTypeOfContent(const Standard_Integer aTypeOfContent);

		/****************** SetUDirectionCount ******************/
		/**** md5 signature: d2b37605e30f9f3a164437046c90b643 ****/
		%feature("compactdefaultargs") SetUDirectionCount;
		%feature("autodoc", "No available documentation.

Parameters
----------
aUDirectionCount: int

Returns
-------
None
") SetUDirectionCount;
		void SetUDirectionCount(const Standard_Integer aUDirectionCount);

		/****************** SetVDirectionCount ******************/
		/**** md5 signature: 270f7ae76ba877c54b0a67a19a996e9d ****/
		%feature("compactdefaultargs") SetVDirectionCount;
		%feature("autodoc", "No available documentation.

Parameters
----------
aUDirectionCount: int

Returns
-------
None
") SetVDirectionCount;
		void SetVDirectionCount(const Standard_Integer aUDirectionCount);

		/****************** TypeOfContent ******************/
		/**** md5 signature: ca265bcca49d9306f069cd5137aa4464 ****/
		%feature("compactdefaultargs") TypeOfContent;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") TypeOfContent;
		Standard_Integer TypeOfContent();

		/****************** UDirectionCount ******************/
		/**** md5 signature: e971de5fe8c36b62a342c36a1aaabe76 ****/
		%feature("compactdefaultargs") UDirectionCount;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") UDirectionCount;
		Standard_Integer UDirectionCount();

		/****************** VDirectionCount ******************/
		/**** md5 signature: 1a2bb477a938673186e5eca69c3b0579 ****/
		%feature("compactdefaultargs") VDirectionCount;
		%feature("autodoc", "No available documentation.

Returns
-------
int
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
		/****************** StepVisual_DraughtingCallout ******************/
		/**** md5 signature: 479128b3cf76d9fc67402329a058f44f ****/
		%feature("compactdefaultargs") StepVisual_DraughtingCallout;
		%feature("autodoc", "Returns a draughtingcallout.

Returns
-------
None
") StepVisual_DraughtingCallout;
		 StepVisual_DraughtingCallout();

		/****************** Contents ******************/
		/**** md5 signature: 095947082d889e7c32de10dc5bbd03d1 ****/
		%feature("compactdefaultargs") Contents;
		%feature("autodoc", "Returns field contents.

Returns
-------
opencascade::handle<StepVisual_HArray1OfDraughtingCalloutElement>
") Contents;
		opencascade::handle<StepVisual_HArray1OfDraughtingCalloutElement> Contents();

		/****************** ContentsValue ******************/
		/**** md5 signature: e5e1f2450ca3a5a2db96d1c0d164d96f ****/
		%feature("compactdefaultargs") ContentsValue;
		%feature("autodoc", "Returns contents with the given number.

Parameters
----------
theNum: int

Returns
-------
StepVisual_DraughtingCalloutElement
") ContentsValue;
		StepVisual_DraughtingCalloutElement ContentsValue(const Standard_Integer theNum);

		/****************** Init ******************/
		/**** md5 signature: 0f3491ec3799c4002589207be16d6de9 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Init.

Parameters
----------
theName: TCollection_HAsciiString
theContents: StepVisual_HArray1OfDraughtingCalloutElement

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<StepVisual_HArray1OfDraughtingCalloutElement> & theContents);

		/****************** NbContents ******************/
		/**** md5 signature: 648b0dcfd621b001a960425b98fd0875 ****/
		%feature("compactdefaultargs") NbContents;
		%feature("autodoc", "Returns number of contents.

Returns
-------
int
") NbContents;
		Standard_Integer NbContents();

		/****************** SetContents ******************/
		/**** md5 signature: a627aa9980b13436d86c6b1751ff16c7 ****/
		%feature("compactdefaultargs") SetContents;
		%feature("autodoc", "Set field contents.

Parameters
----------
theContents: StepVisual_HArray1OfDraughtingCalloutElement

Returns
-------
None
") SetContents;
		void SetContents(const opencascade::handle<StepVisual_HArray1OfDraughtingCalloutElement> & theContents);

		/****************** SetContentsValue ******************/
		/**** md5 signature: 182606d6bc94b4b624f4ec4bba91a2ce ****/
		%feature("compactdefaultargs") SetContentsValue;
		%feature("autodoc", "Sets contents with given number.

Parameters
----------
theNum: int
theItem: StepVisual_DraughtingCalloutElement

Returns
-------
None
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
		/****************** StepVisual_DraughtingCalloutElement ******************/
		/**** md5 signature: a49239e44d9e53e7c66bc767f83d9bde ****/
		%feature("compactdefaultargs") StepVisual_DraughtingCalloutElement;
		%feature("autodoc", "Returns a draughtingcalloutelement select type.

Returns
-------
None
") StepVisual_DraughtingCalloutElement;
		 StepVisual_DraughtingCalloutElement();

		/****************** AnnotationCurveOccurrence ******************/
		/**** md5 signature: d11af034ca7cac23dfd69b1f3d70df7c ****/
		%feature("compactdefaultargs") AnnotationCurveOccurrence;
		%feature("autodoc", "Returns value as a annotationcurveoccurrence (null if another type).

Returns
-------
opencascade::handle<StepVisual_AnnotationCurveOccurrence>
") AnnotationCurveOccurrence;
		opencascade::handle<StepVisual_AnnotationCurveOccurrence> AnnotationCurveOccurrence();

		/****************** AnnotationFillAreaOccurrence ******************/
		/**** md5 signature: 8fb32aae3b8e74c47bd9bcf5bb76409c ****/
		%feature("compactdefaultargs") AnnotationFillAreaOccurrence;
		%feature("autodoc", "Returns value as a annotationfillareaoccurrence.

Returns
-------
opencascade::handle<StepVisual_AnnotationFillAreaOccurrence>
") AnnotationFillAreaOccurrence;
		opencascade::handle<StepVisual_AnnotationFillAreaOccurrence> AnnotationFillAreaOccurrence();

		/****************** AnnotationTextOccurrence ******************/
		/**** md5 signature: 4f777e80eb4a0b798f5d02115ebbed97 ****/
		%feature("compactdefaultargs") AnnotationTextOccurrence;
		%feature("autodoc", "Returns value as a annotationtextoccurrence.

Returns
-------
opencascade::handle<StepVisual_AnnotationTextOccurrence>
") AnnotationTextOccurrence;
		opencascade::handle<StepVisual_AnnotationTextOccurrence> AnnotationTextOccurrence();

		/****************** CaseNum ******************/
		/**** md5 signature: f0e39118a9846e44ccd59de148215261 ****/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a idattributeselect kind entity that is : 1 -> annotationcurveoccurrence 2 -> annotationtextoccurrence 3 -> tessellatedannotationoccurrence 4 -> annotationfillareaoccurrence 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** TessellatedAnnotationOccurrence ******************/
		/**** md5 signature: 9a51ea8427317a0230ff1ad6f1ec5743 ****/
		%feature("compactdefaultargs") TessellatedAnnotationOccurrence;
		%feature("autodoc", "Returns value as a tessellatedannotationoccurrence.

Returns
-------
opencascade::handle<StepVisual_TessellatedAnnotationOccurrence>
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
		/****************** StepVisual_DraughtingModel ******************/
		/**** md5 signature: 90370651a280a0297ef880071fb1c7a8 ****/
		%feature("compactdefaultargs") StepVisual_DraughtingModel;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepVisual_DraughtingModel;
		 StepVisual_DraughtingModel();

};


%make_alias(StepVisual_DraughtingModel)

%extend StepVisual_DraughtingModel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class StepVisual_ExternallyDefinedCurveFont *
**********************************************/
class StepVisual_ExternallyDefinedCurveFont : public StepBasic_ExternallyDefinedItem {
	public:
		/****************** StepVisual_ExternallyDefinedCurveFont ******************/
		/**** md5 signature: a80bef727f282348eddcd999e1ebe393 ****/
		%feature("compactdefaultargs") StepVisual_ExternallyDefinedCurveFont;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
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
		/****************** StepVisual_ExternallyDefinedTextFont ******************/
		/**** md5 signature: d5e49916c125350e8679005625fd3e4a ****/
		%feature("compactdefaultargs") StepVisual_ExternallyDefinedTextFont;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
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
* class StepVisual_FillAreaStyle *
*********************************/
class StepVisual_FillAreaStyle : public Standard_Transient {
	public:
		/****************** StepVisual_FillAreaStyle ******************/
		/**** md5 signature: 4336473b355d1d0a6b363eaba2ff6e5a ****/
		%feature("compactdefaultargs") StepVisual_FillAreaStyle;
		%feature("autodoc", "Returns a fillareastyle.

Returns
-------
None
") StepVisual_FillAreaStyle;
		 StepVisual_FillAreaStyle();

		/****************** FillStyles ******************/
		/**** md5 signature: bfc36d830b15b08a7d0b1384ee4ccc34 ****/
		%feature("compactdefaultargs") FillStyles;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepVisual_HArray1OfFillStyleSelect>
") FillStyles;
		opencascade::handle<StepVisual_HArray1OfFillStyleSelect> FillStyles();

		/****************** FillStylesValue ******************/
		/**** md5 signature: 72fdc401b454ca337f6dbd61f7cc768e ****/
		%feature("compactdefaultargs") FillStylesValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
StepVisual_FillStyleSelect
") FillStylesValue;
		StepVisual_FillStyleSelect FillStylesValue(const Standard_Integer num);

		/****************** Init ******************/
		/**** md5 signature: b122c0a70ff57a17efa8592a47047cc2 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aFillStyles: StepVisual_HArray1OfFillStyleSelect

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepVisual_HArray1OfFillStyleSelect> & aFillStyles);

		/****************** Name ******************/
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** NbFillStyles ******************/
		/**** md5 signature: abf777e4c20d44bb00c07d1ac5743b9b ****/
		%feature("compactdefaultargs") NbFillStyles;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbFillStyles;
		Standard_Integer NbFillStyles();

		/****************** SetFillStyles ******************/
		/**** md5 signature: 88bc4d07eadb53c25317d10fd2c1f7af ****/
		%feature("compactdefaultargs") SetFillStyles;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFillStyles: StepVisual_HArray1OfFillStyleSelect

Returns
-------
None
") SetFillStyles;
		void SetFillStyles(const opencascade::handle<StepVisual_HArray1OfFillStyleSelect> & aFillStyles);

		/****************** SetName ******************/
		/**** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ****/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString

Returns
-------
None
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
		/****************** StepVisual_FillAreaStyleColour ******************/
		/**** md5 signature: 2c2c1dd51151c21997d01628744768cc ****/
		%feature("compactdefaultargs") StepVisual_FillAreaStyleColour;
		%feature("autodoc", "Returns a fillareastylecolour.

Returns
-------
None
") StepVisual_FillAreaStyleColour;
		 StepVisual_FillAreaStyleColour();

		/****************** FillColour ******************/
		/**** md5 signature: bd2101d67ed5ee5b2e9f70fbfb843f2d ****/
		%feature("compactdefaultargs") FillColour;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepVisual_Colour>
") FillColour;
		opencascade::handle<StepVisual_Colour> FillColour();

		/****************** Init ******************/
		/**** md5 signature: 6fd1c501a81e52ee11e034912ddc052c ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aFillColour: StepVisual_Colour

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepVisual_Colour> & aFillColour);

		/****************** Name ******************/
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetFillColour ******************/
		/**** md5 signature: 0c8af4b1f10f96936e6080e0be4e0afb ****/
		%feature("compactdefaultargs") SetFillColour;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFillColour: StepVisual_Colour

Returns
-------
None
") SetFillColour;
		void SetFillColour(const opencascade::handle<StepVisual_Colour> & aFillColour);

		/****************** SetName ******************/
		/**** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ****/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString

Returns
-------
None
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
		/****************** StepVisual_FillStyleSelect ******************/
		/**** md5 signature: c3a89032a828ea6a76e5b5677134a66b ****/
		%feature("compactdefaultargs") StepVisual_FillStyleSelect;
		%feature("autodoc", "Returns a fillstyleselect selecttype.

Returns
-------
None
") StepVisual_FillStyleSelect;
		 StepVisual_FillStyleSelect();

		/****************** CaseNum ******************/
		/**** md5 signature: f0e39118a9846e44ccd59de148215261 ****/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a fillstyleselect kind entity that is : 1 -> fillareastylecolour 2 -> externallydefinedtilestyle 3 -> fillareastyletiles 4 -> externallydefinedhatchstyle 5 -> fillareastylehatching 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** FillAreaStyleColour ******************/
		/**** md5 signature: e3faf68b401a2aaeb9697abe8bd0a44e ****/
		%feature("compactdefaultargs") FillAreaStyleColour;
		%feature("autodoc", "Returns value as a fillareastylecolour (null if another type).

Returns
-------
opencascade::handle<StepVisual_FillAreaStyleColour>
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
		/****************** StepVisual_FontSelect ******************/
		/**** md5 signature: dbf28f42ce8760b15bf259ebb7b72b72 ****/
		%feature("compactdefaultargs") StepVisual_FontSelect;
		%feature("autodoc", "Returns a fontselect selecttype.

Returns
-------
None
") StepVisual_FontSelect;
		 StepVisual_FontSelect();

		/****************** CaseNum ******************/
		/**** md5 signature: f0e39118a9846e44ccd59de148215261 ****/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a fontselect kind entity that is : 1 -> predefinedtextfont 2 -> externallydefinedtextfont 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** ExternallyDefinedTextFont ******************/
		/**** md5 signature: dc1f9c851d899996d490564ecb340dfd ****/
		%feature("compactdefaultargs") ExternallyDefinedTextFont;
		%feature("autodoc", "Returns value as a externallydefinedtextfont (null if another type).

Returns
-------
opencascade::handle<StepVisual_ExternallyDefinedTextFont>
") ExternallyDefinedTextFont;
		opencascade::handle<StepVisual_ExternallyDefinedTextFont> ExternallyDefinedTextFont();

		/****************** PreDefinedTextFont ******************/
		/**** md5 signature: f701e1febadd6d827f8ad9082838f3f7 ****/
		%feature("compactdefaultargs") PreDefinedTextFont;
		%feature("autodoc", "Returns value as a predefinedtextfont (null if another type).

Returns
-------
opencascade::handle<StepVisual_PreDefinedTextFont>
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
		/****************** StepVisual_Invisibility ******************/
		/**** md5 signature: a3474cb24273a3875e45818c14f2a810 ****/
		%feature("compactdefaultargs") StepVisual_Invisibility;
		%feature("autodoc", "Returns a invisibility.

Returns
-------
None
") StepVisual_Invisibility;
		 StepVisual_Invisibility();

		/****************** Init ******************/
		/**** md5 signature: 43418f7b6dedd792034c03b90ac07989 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aInvisibleItems: StepVisual_HArray1OfInvisibleItem

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepVisual_HArray1OfInvisibleItem> & aInvisibleItems);

		/****************** InvisibleItems ******************/
		/**** md5 signature: be820ab6c1eeb1d37e5a217109d55712 ****/
		%feature("compactdefaultargs") InvisibleItems;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepVisual_HArray1OfInvisibleItem>
") InvisibleItems;
		opencascade::handle<StepVisual_HArray1OfInvisibleItem> InvisibleItems();

		/****************** InvisibleItemsValue ******************/
		/**** md5 signature: a0f0f2c308f4bcad141aef8e2da622e0 ****/
		%feature("compactdefaultargs") InvisibleItemsValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
StepVisual_InvisibleItem
") InvisibleItemsValue;
		StepVisual_InvisibleItem InvisibleItemsValue(const Standard_Integer num);

		/****************** NbInvisibleItems ******************/
		/**** md5 signature: 17dadfd787033a03c16e43aa43fb9e42 ****/
		%feature("compactdefaultargs") NbInvisibleItems;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbInvisibleItems;
		Standard_Integer NbInvisibleItems();

		/****************** SetInvisibleItems ******************/
		/**** md5 signature: 38b0c0c6a390652a9dbe483c166b24e3 ****/
		%feature("compactdefaultargs") SetInvisibleItems;
		%feature("autodoc", "No available documentation.

Parameters
----------
aInvisibleItems: StepVisual_HArray1OfInvisibleItem

Returns
-------
None
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
		/****************** StepVisual_InvisibilityContext ******************/
		/**** md5 signature: 242bb7cc06725c2919283fc5c868071a ****/
		%feature("compactdefaultargs") StepVisual_InvisibilityContext;
		%feature("autodoc", "Returns a invisibilitycontext selecttype.

Returns
-------
None
") StepVisual_InvisibilityContext;
		 StepVisual_InvisibilityContext();

		/****************** CaseNum ******************/
		/**** md5 signature: f0e39118a9846e44ccd59de148215261 ****/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a invisibilitycontext kind entity that is : 1 -> presentationrepresentation 2 -> presentationset 2 -> draughtingmodel 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** DraughtingModel ******************/
		/**** md5 signature: 375dc663ce6735b6fbc38731ef539d11 ****/
		%feature("compactdefaultargs") DraughtingModel;
		%feature("autodoc", "Returns value as a presentationset (null if another type).

Returns
-------
opencascade::handle<StepVisual_DraughtingModel>
") DraughtingModel;
		opencascade::handle<StepVisual_DraughtingModel> DraughtingModel();

		/****************** PresentationRepresentation ******************/
		/**** md5 signature: cc6c70dd495b260c6d02169df44fd1e5 ****/
		%feature("compactdefaultargs") PresentationRepresentation;
		%feature("autodoc", "Returns value as a presentationrepresentation (null if another type).

Returns
-------
opencascade::handle<StepVisual_PresentationRepresentation>
") PresentationRepresentation;
		opencascade::handle<StepVisual_PresentationRepresentation> PresentationRepresentation();

		/****************** PresentationSet ******************/
		/**** md5 signature: e22661d0b7db8ea09e8adbe07ae2d793 ****/
		%feature("compactdefaultargs") PresentationSet;
		%feature("autodoc", "Returns value as a presentationset (null if another type).

Returns
-------
opencascade::handle<StepVisual_PresentationSet>
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
		/****************** StepVisual_InvisibleItem ******************/
		/**** md5 signature: d2cbc0b529016c99ba2f24b0dcad3ed5 ****/
		%feature("compactdefaultargs") StepVisual_InvisibleItem;
		%feature("autodoc", "Returns a invisibleitem selecttype.

Returns
-------
None
") StepVisual_InvisibleItem;
		 StepVisual_InvisibleItem();

		/****************** CaseNum ******************/
		/**** md5 signature: f0e39118a9846e44ccd59de148215261 ****/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a invisibleitem kind entity that is : 1 -> styleditem 2 -> presentationlayerassignment 3 -> presentationrepresentation 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** PresentationLayerAssignment ******************/
		/**** md5 signature: 49c7f239f0489b439f796bd73a3c191b ****/
		%feature("compactdefaultargs") PresentationLayerAssignment;
		%feature("autodoc", "Returns value as a presentationlayerassignment (null if another type).

Returns
-------
opencascade::handle<StepVisual_PresentationLayerAssignment>
") PresentationLayerAssignment;
		opencascade::handle<StepVisual_PresentationLayerAssignment> PresentationLayerAssignment();

		/****************** PresentationRepresentation ******************/
		/**** md5 signature: cc6c70dd495b260c6d02169df44fd1e5 ****/
		%feature("compactdefaultargs") PresentationRepresentation;
		%feature("autodoc", "Returns value as a presentationrepresentation (null if another type).

Returns
-------
opencascade::handle<StepVisual_PresentationRepresentation>
") PresentationRepresentation;
		opencascade::handle<StepVisual_PresentationRepresentation> PresentationRepresentation();

		/****************** StyledItem ******************/
		/**** md5 signature: 61c7563ce33340acb54e8fd4f4208e5f ****/
		%feature("compactdefaultargs") StyledItem;
		%feature("autodoc", "Returns value as a styleditem (null if another type).

Returns
-------
opencascade::handle<StepVisual_StyledItem>
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
		/****************** StepVisual_LayeredItem ******************/
		/**** md5 signature: 93c036723eecdf8e1e30f8876a289d07 ****/
		%feature("compactdefaultargs") StepVisual_LayeredItem;
		%feature("autodoc", "Returns a layereditem selecttype.

Returns
-------
None
") StepVisual_LayeredItem;
		 StepVisual_LayeredItem();

		/****************** CaseNum ******************/
		/**** md5 signature: f0e39118a9846e44ccd59de148215261 ****/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a layereditem kind entity that is : 1 -> presentationrepresentation 2 -> representationitem 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** PresentationRepresentation ******************/
		/**** md5 signature: cc6c70dd495b260c6d02169df44fd1e5 ****/
		%feature("compactdefaultargs") PresentationRepresentation;
		%feature("autodoc", "Returns value as a presentationrepresentation (null if another type).

Returns
-------
opencascade::handle<StepVisual_PresentationRepresentation>
") PresentationRepresentation;
		opencascade::handle<StepVisual_PresentationRepresentation> PresentationRepresentation();

		/****************** RepresentationItem ******************/
		/**** md5 signature: 542dc5a7f82620b971e50a23ff46cd55 ****/
		%feature("compactdefaultargs") RepresentationItem;
		%feature("autodoc", "Returns value as a representationitem (null if another type).

Returns
-------
opencascade::handle<StepRepr_RepresentationItem>
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
		/****************** StepVisual_MarkerMember ******************/
		/**** md5 signature: daa9cc87ce05af4fe8d8a93b0202878b ****/
		%feature("compactdefaultargs") StepVisual_MarkerMember;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepVisual_MarkerMember;
		 StepVisual_MarkerMember();

		/****************** EnumText ******************/
		/**** md5 signature: a63e2e811ad86b44e1eb67e1ce00ea65 ****/
		%feature("compactdefaultargs") EnumText;
		%feature("autodoc", "No available documentation.

Returns
-------
char *
") EnumText;
		virtual const char * EnumText();

		/****************** HasName ******************/
		/**** md5 signature: c4b2dbd737f3c98314fdb7955ce91c2a ****/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasName;
		virtual Standard_Boolean HasName();

		/****************** Name ******************/
		/**** md5 signature: d654a4ee9a75d24a9c3f33853f908999 ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
char *
") Name;
		virtual const char * Name();

		/****************** SetEnumText ******************/
		/**** md5 signature: 120d4c122fb5eaba7d84896e45beec24 ****/
		%feature("compactdefaultargs") SetEnumText;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: int
text: char *

Returns
-------
None
") SetEnumText;
		virtual void SetEnumText(const Standard_Integer val, const char * text);

		/****************** SetName ******************/
		/**** md5 signature: cb088c8a5caf9447945830483c3112e7 ****/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
name: char *

Returns
-------
bool
") SetName;
		virtual Standard_Boolean SetName(const char * name);

		/****************** SetValue ******************/
		/**** md5 signature: e50f72140ef69e3beed4121f92905c6a ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
val: StepVisual_MarkerType

Returns
-------
None
") SetValue;
		void SetValue(const StepVisual_MarkerType val);

		/****************** Value ******************/
		/**** md5 signature: 286dad6be4f4f67c96f083f6cc615782 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
StepVisual_MarkerType
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
		/****************** StepVisual_MarkerSelect ******************/
		/**** md5 signature: b747f2349cdf0119e364732d8207582b ****/
		%feature("compactdefaultargs") StepVisual_MarkerSelect;
		%feature("autodoc", "Returns a markerselect selecttype.

Returns
-------
None
") StepVisual_MarkerSelect;
		 StepVisual_MarkerSelect();

		/****************** CaseMem ******************/
		/**** md5 signature: 9b67f0d9aae1302e7b91faea7b14b6d6 ****/
		%feature("compactdefaultargs") CaseMem;
		%feature("autodoc", "Returns 1 for a selectmember enum, named marker_type.

Parameters
----------
sm: StepData_SelectMember

Returns
-------
int
") CaseMem;
		virtual Standard_Integer CaseMem(const opencascade::handle<StepData_SelectMember> & sm);

		/****************** CaseNum ******************/
		/**** md5 signature: b9dbcdb5b972500c66bc8bc08f651d0a ****/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a markerselect kind entity that is : 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** MarkerMember ******************/
		/**** md5 signature: 904b592dc010a92e404a5231a11e3db0 ****/
		%feature("compactdefaultargs") MarkerMember;
		%feature("autodoc", "Gives access to the markermember in order to get/set its value.

Returns
-------
opencascade::handle<StepVisual_MarkerMember>
") MarkerMember;
		opencascade::handle<StepVisual_MarkerMember> MarkerMember();

		/****************** NewMember ******************/
		/**** md5 signature: ae7a49ea52744ae449d83e823e9a6da7 ****/
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", "Returns a new markermember.

Returns
-------
opencascade::handle<StepData_SelectMember>
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
		/****************** StepVisual_NullStyleMember ******************/
		/**** md5 signature: db8e9b9d9748c8d6d6acb09afd037958 ****/
		%feature("compactdefaultargs") StepVisual_NullStyleMember;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepVisual_NullStyleMember;
		 StepVisual_NullStyleMember();

		/****************** EnumText ******************/
		/**** md5 signature: a63e2e811ad86b44e1eb67e1ce00ea65 ****/
		%feature("compactdefaultargs") EnumText;
		%feature("autodoc", "No available documentation.

Returns
-------
char *
") EnumText;
		virtual const char * EnumText();

		/****************** HasName ******************/
		/**** md5 signature: 454c871a85ff9e9d126353d7d8ebe205 ****/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasName;
		virtual Standard_Boolean HasName();

		/****************** Kind ******************/
		/**** md5 signature: 68423d7a619b16473db8e5cece0b7d32 ****/
		%feature("compactdefaultargs") Kind;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Kind;
		Standard_Integer Kind();

		/****************** Name ******************/
		/**** md5 signature: 06f88ef4dbb86ad142e1fa4f6645d0a3 ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
char *
") Name;
		virtual const char * Name();

		/****************** SetEnumText ******************/
		/**** md5 signature: b2fa2c708967006363f06f147171c7a7 ****/
		%feature("compactdefaultargs") SetEnumText;
		%feature("autodoc", "No available documentation.

Parameters
----------
theValue: int
theText: char *

Returns
-------
None
") SetEnumText;
		virtual void SetEnumText(const Standard_Integer theValue, const char * theText);

		/****************** SetName ******************/
		/**** md5 signature: c0fb4b116d47426ff8c83f0fba90c9d0 ****/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
Standard_CString: 

Returns
-------
bool
") SetName;
		virtual Standard_Boolean SetName(const Standard_CString);

		/****************** SetValue ******************/
		/**** md5 signature: 60b2edcaeb2ecfca6564c87df8d43442 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
theValue: StepVisual_NullStyle

Returns
-------
None
") SetValue;
		void SetValue(const StepVisual_NullStyle theValue);

		/****************** Value ******************/
		/**** md5 signature: 499e66d9d9d247b8575636e45cb31c31 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
StepVisual_NullStyle
") Value;
		StepVisual_NullStyle Value();

};


%make_alias(StepVisual_NullStyleMember)

%extend StepVisual_NullStyleMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class StepVisual_PlanarExtent *
********************************/
class StepVisual_PlanarExtent : public StepGeom_GeometricRepresentationItem {
	public:
		/****************** StepVisual_PlanarExtent ******************/
		/**** md5 signature: f88e86cabfb096c37ea044d10729f3d7 ****/
		%feature("compactdefaultargs") StepVisual_PlanarExtent;
		%feature("autodoc", "Returns a planarextent.

Returns
-------
None
") StepVisual_PlanarExtent;
		 StepVisual_PlanarExtent();

		/****************** Init ******************/
		/**** md5 signature: 11c89a3a54c891c12e325c7a8f02c313 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aSizeInX: float
aSizeInY: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const Standard_Real aSizeInX, const Standard_Real aSizeInY);

		/****************** SetSizeInX ******************/
		/**** md5 signature: db14fc0ae7767c757c95681db0fcaef5 ****/
		%feature("compactdefaultargs") SetSizeInX;
		%feature("autodoc", "No available documentation.

Parameters
----------
aSizeInX: float

Returns
-------
None
") SetSizeInX;
		void SetSizeInX(const Standard_Real aSizeInX);

		/****************** SetSizeInY ******************/
		/**** md5 signature: f18d2e4c5890dfb270b4fcdf4e4dc52a ****/
		%feature("compactdefaultargs") SetSizeInY;
		%feature("autodoc", "No available documentation.

Parameters
----------
aSizeInY: float

Returns
-------
None
") SetSizeInY;
		void SetSizeInY(const Standard_Real aSizeInY);

		/****************** SizeInX ******************/
		/**** md5 signature: 207e37afbd922509f9b5429d02a8630e ****/
		%feature("compactdefaultargs") SizeInX;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") SizeInX;
		Standard_Real SizeInX();

		/****************** SizeInY ******************/
		/**** md5 signature: aa84661dba951a2ac821696b99f24fcd ****/
		%feature("compactdefaultargs") SizeInY;
		%feature("autodoc", "No available documentation.

Returns
-------
float
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
		/****************** StepVisual_PointStyle ******************/
		/**** md5 signature: b77cff766667db83923134b16f1a080f ****/
		%feature("compactdefaultargs") StepVisual_PointStyle;
		%feature("autodoc", "Returns a pointstyle.

Returns
-------
None
") StepVisual_PointStyle;
		 StepVisual_PointStyle();

		/****************** Init ******************/
		/**** md5 signature: 9222acf07fcf679d31b16ca30350c4af ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aMarker: StepVisual_MarkerSelect
aMarkerSize: StepBasic_SizeSelect
aMarkerColour: StepVisual_Colour

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const StepVisual_MarkerSelect & aMarker, const StepBasic_SizeSelect & aMarkerSize, const opencascade::handle<StepVisual_Colour> & aMarkerColour);

		/****************** Marker ******************/
		/**** md5 signature: b0937302b25ee8ac1612524b8e226a27 ****/
		%feature("compactdefaultargs") Marker;
		%feature("autodoc", "No available documentation.

Returns
-------
StepVisual_MarkerSelect
") Marker;
		StepVisual_MarkerSelect Marker();

		/****************** MarkerColour ******************/
		/**** md5 signature: d338cad7b0da61dca546ce9c4070f00c ****/
		%feature("compactdefaultargs") MarkerColour;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepVisual_Colour>
") MarkerColour;
		opencascade::handle<StepVisual_Colour> MarkerColour();

		/****************** MarkerSize ******************/
		/**** md5 signature: a0a261d41a3644442491bc71de2deb49 ****/
		%feature("compactdefaultargs") MarkerSize;
		%feature("autodoc", "No available documentation.

Returns
-------
StepBasic_SizeSelect
") MarkerSize;
		StepBasic_SizeSelect MarkerSize();

		/****************** Name ******************/
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetMarker ******************/
		/**** md5 signature: 73af6a1dd7d9421a136310adef8d2b66 ****/
		%feature("compactdefaultargs") SetMarker;
		%feature("autodoc", "No available documentation.

Parameters
----------
aMarker: StepVisual_MarkerSelect

Returns
-------
None
") SetMarker;
		void SetMarker(const StepVisual_MarkerSelect & aMarker);

		/****************** SetMarkerColour ******************/
		/**** md5 signature: a164ea9964492d37ca8c3b4139b0850b ****/
		%feature("compactdefaultargs") SetMarkerColour;
		%feature("autodoc", "No available documentation.

Parameters
----------
aMarkerColour: StepVisual_Colour

Returns
-------
None
") SetMarkerColour;
		void SetMarkerColour(const opencascade::handle<StepVisual_Colour> & aMarkerColour);

		/****************** SetMarkerSize ******************/
		/**** md5 signature: 195892a7b46b4af9a849c8231556fdd8 ****/
		%feature("compactdefaultargs") SetMarkerSize;
		%feature("autodoc", "No available documentation.

Parameters
----------
aMarkerSize: StepBasic_SizeSelect

Returns
-------
None
") SetMarkerSize;
		void SetMarkerSize(const StepBasic_SizeSelect & aMarkerSize);

		/****************** SetName ******************/
		/**** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ****/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString

Returns
-------
None
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
		/****************** StepVisual_PreDefinedItem ******************/
		/**** md5 signature: bdd452eb322280b48fb60be1f07c5b77 ****/
		%feature("compactdefaultargs") StepVisual_PreDefinedItem;
		%feature("autodoc", "Returns a predefineditem.

Returns
-------
None
") StepVisual_PreDefinedItem;
		 StepVisual_PreDefinedItem();

		/****************** Init ******************/
		/**** md5 signature: e10f4ffe4365262d2d9a5484d96325b8 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName);

		/****************** Name ******************/
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetName ******************/
		/**** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ****/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString

Returns
-------
None
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
		/****************** StepVisual_PresentationLayerAssignment ******************/
		/**** md5 signature: bc651d10b86d4455fe50d6f286ba6bad ****/
		%feature("compactdefaultargs") StepVisual_PresentationLayerAssignment;
		%feature("autodoc", "Returns a presentationlayerassignment.

Returns
-------
None
") StepVisual_PresentationLayerAssignment;
		 StepVisual_PresentationLayerAssignment();

		/****************** AssignedItems ******************/
		/**** md5 signature: 5603a149ac3a31a63988a3b44a83cded ****/
		%feature("compactdefaultargs") AssignedItems;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepVisual_HArray1OfLayeredItem>
") AssignedItems;
		opencascade::handle<StepVisual_HArray1OfLayeredItem> AssignedItems();

		/****************** AssignedItemsValue ******************/
		/**** md5 signature: 2e9dd445e1b3ba65039cd5d54a7c9316 ****/
		%feature("compactdefaultargs") AssignedItemsValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
StepVisual_LayeredItem
") AssignedItemsValue;
		StepVisual_LayeredItem AssignedItemsValue(const Standard_Integer num);

		/****************** Description ******************/
		/**** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ****/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** Init ******************/
		/**** md5 signature: 6e8c8d74d5fe4b7f775d4682a1fa4ca0 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aAssignedItems: StepVisual_HArray1OfLayeredItem

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepVisual_HArray1OfLayeredItem> & aAssignedItems);

		/****************** Name ******************/
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** NbAssignedItems ******************/
		/**** md5 signature: b8ff0a501e3564d97f419c4084a2f772 ****/
		%feature("compactdefaultargs") NbAssignedItems;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbAssignedItems;
		Standard_Integer NbAssignedItems();

		/****************** SetAssignedItems ******************/
		/**** md5 signature: 577a8a14d39f41f4104333bccc4bb2e8 ****/
		%feature("compactdefaultargs") SetAssignedItems;
		%feature("autodoc", "No available documentation.

Parameters
----------
aAssignedItems: StepVisual_HArray1OfLayeredItem

Returns
-------
None
") SetAssignedItems;
		void SetAssignedItems(const opencascade::handle<StepVisual_HArray1OfLayeredItem> & aAssignedItems);

		/****************** SetDescription ******************/
		/**** md5 signature: adddd13a906718df58a2eee683a382cf ****/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDescription: TCollection_HAsciiString

Returns
-------
None
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****************** SetName ******************/
		/**** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ****/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString

Returns
-------
None
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
		/****************** StepVisual_PresentationLayerUsage ******************/
		/**** md5 signature: df9b42b7b80c08b26a1d3807eac59846 ****/
		%feature("compactdefaultargs") StepVisual_PresentationLayerUsage;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepVisual_PresentationLayerUsage;
		 StepVisual_PresentationLayerUsage();

		/****************** Assignment ******************/
		/**** md5 signature: 247e4ab376d50040ca43f5da78ec8dd3 ****/
		%feature("compactdefaultargs") Assignment;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepVisual_PresentationLayerAssignment>
") Assignment;
		opencascade::handle<StepVisual_PresentationLayerAssignment> Assignment();

		/****************** Init ******************/
		/**** md5 signature: b5ae4ccbc7f6a2e56e2509e58cff32b6 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aAssignment: StepVisual_PresentationLayerAssignment
aPresentation: StepVisual_PresentationRepresentation

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepVisual_PresentationLayerAssignment> & aAssignment, const opencascade::handle<StepVisual_PresentationRepresentation> & aPresentation);

		/****************** Presentation ******************/
		/**** md5 signature: 9cc4c5796d5f3f127af49d614b82062d ****/
		%feature("compactdefaultargs") Presentation;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepVisual_PresentationRepresentation>
") Presentation;
		opencascade::handle<StepVisual_PresentationRepresentation> Presentation();

		/****************** SetAssignment ******************/
		/**** md5 signature: bd4fba63c1435ca112fa113f1855ab37 ****/
		%feature("compactdefaultargs") SetAssignment;
		%feature("autodoc", "No available documentation.

Parameters
----------
aAssignment: StepVisual_PresentationLayerAssignment

Returns
-------
None
") SetAssignment;
		void SetAssignment(const opencascade::handle<StepVisual_PresentationLayerAssignment> & aAssignment);

		/****************** SetPresentation ******************/
		/**** md5 signature: 789e3b11b63d0bcb9cffb2a47d25a0d1 ****/
		%feature("compactdefaultargs") SetPresentation;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPresentation: StepVisual_PresentationRepresentation

Returns
-------
None
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
		/****************** StepVisual_PresentationRepresentation ******************/
		/**** md5 signature: ec69a087912fd220c75e7497d5184397 ****/
		%feature("compactdefaultargs") StepVisual_PresentationRepresentation;
		%feature("autodoc", "Returns a presentationrepresentation.

Returns
-------
None
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
		/****************** StepVisual_PresentationRepresentationSelect ******************/
		/**** md5 signature: e333b2922b258fe2030184dfb4c49927 ****/
		%feature("compactdefaultargs") StepVisual_PresentationRepresentationSelect;
		%feature("autodoc", "Returns a presentationrepresentationselect selecttype.

Returns
-------
None
") StepVisual_PresentationRepresentationSelect;
		 StepVisual_PresentationRepresentationSelect();

		/****************** CaseNum ******************/
		/**** md5 signature: f0e39118a9846e44ccd59de148215261 ****/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a presentationrepresentationselect kind entity that is : 1 -> presentationrepresentation 2 -> presentationset 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** PresentationRepresentation ******************/
		/**** md5 signature: cc6c70dd495b260c6d02169df44fd1e5 ****/
		%feature("compactdefaultargs") PresentationRepresentation;
		%feature("autodoc", "Returns value as a presentationrepresentation (null if another type).

Returns
-------
opencascade::handle<StepVisual_PresentationRepresentation>
") PresentationRepresentation;
		opencascade::handle<StepVisual_PresentationRepresentation> PresentationRepresentation();

		/****************** PresentationSet ******************/
		/**** md5 signature: e22661d0b7db8ea09e8adbe07ae2d793 ****/
		%feature("compactdefaultargs") PresentationSet;
		%feature("autodoc", "Returns value as a presentationset (null if another type).

Returns
-------
opencascade::handle<StepVisual_PresentationSet>
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
		/****************** StepVisual_PresentationSet ******************/
		/**** md5 signature: 076c6267b2a6fa3942cd60742ef1b09f ****/
		%feature("compactdefaultargs") StepVisual_PresentationSet;
		%feature("autodoc", "Returns a presentationset.

Returns
-------
None
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
		/****************** StepVisual_PresentationSize ******************/
		/**** md5 signature: 1c30c48e681560b686896ed17114ef3c ****/
		%feature("compactdefaultargs") StepVisual_PresentationSize;
		%feature("autodoc", "Returns a presentationsize.

Returns
-------
None
") StepVisual_PresentationSize;
		 StepVisual_PresentationSize();

		/****************** Init ******************/
		/**** md5 signature: 134cd61619112c2a6a55025dc64ad2b0 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aUnit: StepVisual_PresentationSizeAssignmentSelect
aSize: StepVisual_PlanarBox

Returns
-------
None
") Init;
		void Init(const StepVisual_PresentationSizeAssignmentSelect & aUnit, const opencascade::handle<StepVisual_PlanarBox> & aSize);

		/****************** SetSize ******************/
		/**** md5 signature: ff65fa6988b242450efd1611eab2bd0c ****/
		%feature("compactdefaultargs") SetSize;
		%feature("autodoc", "No available documentation.

Parameters
----------
aSize: StepVisual_PlanarBox

Returns
-------
None
") SetSize;
		void SetSize(const opencascade::handle<StepVisual_PlanarBox> & aSize);

		/****************** SetUnit ******************/
		/**** md5 signature: 044d71873cff349bc0a68a2a68b5c6b3 ****/
		%feature("compactdefaultargs") SetUnit;
		%feature("autodoc", "No available documentation.

Parameters
----------
aUnit: StepVisual_PresentationSizeAssignmentSelect

Returns
-------
None
") SetUnit;
		void SetUnit(const StepVisual_PresentationSizeAssignmentSelect & aUnit);

		/****************** Size ******************/
		/**** md5 signature: d8ca5ccfb2bbc200e10b187d7957d7f0 ****/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepVisual_PlanarBox>
") Size;
		opencascade::handle<StepVisual_PlanarBox> Size();

		/****************** Unit ******************/
		/**** md5 signature: cf870604cf9fa6934ded63a559de4718 ****/
		%feature("compactdefaultargs") Unit;
		%feature("autodoc", "No available documentation.

Returns
-------
StepVisual_PresentationSizeAssignmentSelect
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
		/****************** StepVisual_PresentationSizeAssignmentSelect ******************/
		/**** md5 signature: 453f954c0690e4b0f530a695065e7e92 ****/
		%feature("compactdefaultargs") StepVisual_PresentationSizeAssignmentSelect;
		%feature("autodoc", "Returns a presentationsizeassignmentselect selecttype.

Returns
-------
None
") StepVisual_PresentationSizeAssignmentSelect;
		 StepVisual_PresentationSizeAssignmentSelect();

		/****************** AreaInSet ******************/
		/**** md5 signature: b745d9b0509ee4b8b0103921950734c4 ****/
		%feature("compactdefaultargs") AreaInSet;
		%feature("autodoc", "Returns value as a areainset (null if another type).

Returns
-------
opencascade::handle<StepVisual_AreaInSet>
") AreaInSet;
		opencascade::handle<StepVisual_AreaInSet> AreaInSet();

		/****************** CaseNum ******************/
		/**** md5 signature: f0e39118a9846e44ccd59de148215261 ****/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a presentationsizeassignmentselect kind entity that is : 1 -> presentationview 2 -> presentationarea 3 -> areainset 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** PresentationArea ******************/
		/**** md5 signature: 6adf2ef7fa0a7b503035224ca0f9247c ****/
		%feature("compactdefaultargs") PresentationArea;
		%feature("autodoc", "Returns value as a presentationarea (null if another type).

Returns
-------
opencascade::handle<StepVisual_PresentationArea>
") PresentationArea;
		opencascade::handle<StepVisual_PresentationArea> PresentationArea();

		/****************** PresentationView ******************/
		/**** md5 signature: f42d5482c64642bbea3f6f415c07a2aa ****/
		%feature("compactdefaultargs") PresentationView;
		%feature("autodoc", "Returns value as a presentationview (null if another type).

Returns
-------
opencascade::handle<StepVisual_PresentationView>
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
		/****************** StepVisual_PresentationStyleAssignment ******************/
		/**** md5 signature: 1cc58a43e5f19f8803a83422e4c077a0 ****/
		%feature("compactdefaultargs") StepVisual_PresentationStyleAssignment;
		%feature("autodoc", "Returns a presentationstyleassignment.

Returns
-------
None
") StepVisual_PresentationStyleAssignment;
		 StepVisual_PresentationStyleAssignment();

		/****************** Init ******************/
		/**** md5 signature: 19337abb8014667e7ee598bc01dd719e ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aStyles: StepVisual_HArray1OfPresentationStyleSelect

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepVisual_HArray1OfPresentationStyleSelect> & aStyles);

		/****************** NbStyles ******************/
		/**** md5 signature: 9f5fbd515247307ce70e63c6f585ddb7 ****/
		%feature("compactdefaultargs") NbStyles;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbStyles;
		Standard_Integer NbStyles();

		/****************** SetStyles ******************/
		/**** md5 signature: ec9247e94c63a82ce89f12d338fddc67 ****/
		%feature("compactdefaultargs") SetStyles;
		%feature("autodoc", "No available documentation.

Parameters
----------
aStyles: StepVisual_HArray1OfPresentationStyleSelect

Returns
-------
None
") SetStyles;
		void SetStyles(const opencascade::handle<StepVisual_HArray1OfPresentationStyleSelect> & aStyles);

		/****************** Styles ******************/
		/**** md5 signature: 3579cb1cc88465f94e6e54dc0c81881f ****/
		%feature("compactdefaultargs") Styles;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepVisual_HArray1OfPresentationStyleSelect>
") Styles;
		opencascade::handle<StepVisual_HArray1OfPresentationStyleSelect> Styles();

		/****************** StylesValue ******************/
		/**** md5 signature: dc0642b4c23e4b1290ec9bad05389a4c ****/
		%feature("compactdefaultargs") StylesValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
StepVisual_PresentationStyleSelect
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
		/****************** StepVisual_PresentationStyleSelect ******************/
		/**** md5 signature: d698038487ae645487e097c623b624a4 ****/
		%feature("compactdefaultargs") StepVisual_PresentationStyleSelect;
		%feature("autodoc", "Returns a presentationstyleselect selecttype.

Returns
-------
None
") StepVisual_PresentationStyleSelect;
		 StepVisual_PresentationStyleSelect();

		/****************** CaseNum ******************/
		/**** md5 signature: f0e39118a9846e44ccd59de148215261 ****/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a presentationstyleselect kind entity that is : 1 -> pointstyle 2 -> curvestyle 3 -> surfacestyleusage 4 -> symbolstyle 5 -> fillareastyle 6 -> textstyle 7 -> nullstyle 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** CurveStyle ******************/
		/**** md5 signature: feb37ceb221ce52916abd36c51e4b45e ****/
		%feature("compactdefaultargs") CurveStyle;
		%feature("autodoc", "Returns value as a curvestyle (null if another type).

Returns
-------
opencascade::handle<StepVisual_CurveStyle>
") CurveStyle;
		opencascade::handle<StepVisual_CurveStyle> CurveStyle();

		/****************** NullStyle ******************/
		/**** md5 signature: 51d7654dc736b87f87621fc47c7db999 ****/
		%feature("compactdefaultargs") NullStyle;
		%feature("autodoc", "Returns value as a nullstylemember (null if another type).

Returns
-------
opencascade::handle<StepVisual_NullStyleMember>
") NullStyle;
		opencascade::handle<StepVisual_NullStyleMember> NullStyle();

		/****************** PointStyle ******************/
		/**** md5 signature: 17b86073a0f884b719f02aa88f468775 ****/
		%feature("compactdefaultargs") PointStyle;
		%feature("autodoc", "Returns value as a pointstyle (null if another type).

Returns
-------
opencascade::handle<StepVisual_PointStyle>
") PointStyle;
		opencascade::handle<StepVisual_PointStyle> PointStyle();

		/****************** SurfaceStyleUsage ******************/
		/**** md5 signature: 07843196e3a5021749c6b631f17b4cd4 ****/
		%feature("compactdefaultargs") SurfaceStyleUsage;
		%feature("autodoc", "Returns value as a surfacestyleusage (null if another type).

Returns
-------
opencascade::handle<StepVisual_SurfaceStyleUsage>
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
		/****************** StepVisual_PresentedItemRepresentation ******************/
		/**** md5 signature: 6a2c03b6953bc6a0f183bc036b5d02b2 ****/
		%feature("compactdefaultargs") StepVisual_PresentedItemRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepVisual_PresentedItemRepresentation;
		 StepVisual_PresentedItemRepresentation();

		/****************** Init ******************/
		/**** md5 signature: afaf9a1ad462784c057d79ea97d58bd3 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPresentation: StepVisual_PresentationRepresentationSelect
aItem: StepVisual_PresentedItem

Returns
-------
None
") Init;
		void Init(const StepVisual_PresentationRepresentationSelect & aPresentation, const opencascade::handle<StepVisual_PresentedItem> & aItem);

		/****************** Item ******************/
		/**** md5 signature: bd45dbe9824d6ba1403f78d43b832cde ****/
		%feature("compactdefaultargs") Item;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepVisual_PresentedItem>
") Item;
		opencascade::handle<StepVisual_PresentedItem> Item();

		/****************** Presentation ******************/
		/**** md5 signature: 9ef48fb3f701841293be09e9ddf616a1 ****/
		%feature("compactdefaultargs") Presentation;
		%feature("autodoc", "No available documentation.

Returns
-------
StepVisual_PresentationRepresentationSelect
") Presentation;
		StepVisual_PresentationRepresentationSelect Presentation();

		/****************** SetItem ******************/
		/**** md5 signature: 7287d7bdd5ae0d68f4c034717ef5e93f ****/
		%feature("compactdefaultargs") SetItem;
		%feature("autodoc", "No available documentation.

Parameters
----------
aItem: StepVisual_PresentedItem

Returns
-------
None
") SetItem;
		void SetItem(const opencascade::handle<StepVisual_PresentedItem> & aItem);

		/****************** SetPresentation ******************/
		/**** md5 signature: 55a61dae3a49551206aa8452312894cb ****/
		%feature("compactdefaultargs") SetPresentation;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPresentation: StepVisual_PresentationRepresentationSelect

Returns
-------
None
") SetPresentation;
		void SetPresentation(const StepVisual_PresentationRepresentationSelect & aPresentation);

};


%make_alias(StepVisual_PresentedItemRepresentation)

%extend StepVisual_PresentedItemRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class StepVisual_StyleContextSelect *
**************************************/
class StepVisual_StyleContextSelect : public StepData_SelectType {
	public:
		/****************** StepVisual_StyleContextSelect ******************/
		/**** md5 signature: 245e3c379950dd3775102e67c26aa0b7 ****/
		%feature("compactdefaultargs") StepVisual_StyleContextSelect;
		%feature("autodoc", "Returns a stylecontextselect selecttype.

Returns
-------
None
") StepVisual_StyleContextSelect;
		 StepVisual_StyleContextSelect();

		/****************** CaseNum ******************/
		/**** md5 signature: f0e39118a9846e44ccd59de148215261 ****/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a stylecontextselect kind entity that is : 1 -> representation 2 -> representationitem 3 -> presentationset 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** PresentationSet ******************/
		/**** md5 signature: e22661d0b7db8ea09e8adbe07ae2d793 ****/
		%feature("compactdefaultargs") PresentationSet;
		%feature("autodoc", "Returns value as a presentationset (null if another type).

Returns
-------
opencascade::handle<StepVisual_PresentationSet>
") PresentationSet;
		opencascade::handle<StepVisual_PresentationSet> PresentationSet();

		/****************** Representation ******************/
		/**** md5 signature: b68b8aa0615de130a54bdd2ee7c69058 ****/
		%feature("compactdefaultargs") Representation;
		%feature("autodoc", "Returns value as a representation (null if another type).

Returns
-------
opencascade::handle<StepRepr_Representation>
") Representation;
		opencascade::handle<StepRepr_Representation> Representation();

		/****************** RepresentationItem ******************/
		/**** md5 signature: 542dc5a7f82620b971e50a23ff46cd55 ****/
		%feature("compactdefaultargs") RepresentationItem;
		%feature("autodoc", "Returns value as a representationitem (null if another type).

Returns
-------
opencascade::handle<StepRepr_RepresentationItem>
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
		/****************** StepVisual_StyledItem ******************/
		/**** md5 signature: eb9228bcc80d4151a6612f9ea37e8ab9 ****/
		%feature("compactdefaultargs") StepVisual_StyledItem;
		%feature("autodoc", "Returns a styleditem.

Returns
-------
None
") StepVisual_StyledItem;
		 StepVisual_StyledItem();

		/****************** Init ******************/
		/**** md5 signature: 0c994c2dbfe076b8f4ec7e6dd9459789 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aStyles: StepVisual_HArray1OfPresentationStyleAssignment
aItem: Standard_Transient

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepVisual_HArray1OfPresentationStyleAssignment> & aStyles, const opencascade::handle<Standard_Transient> & aItem);

		/****************** Item ******************/
		/**** md5 signature: b179c866de84187747718fbbc1a1a674 ****/
		%feature("compactdefaultargs") Item;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepRepr_RepresentationItem>
") Item;
		const opencascade::handle<StepRepr_RepresentationItem> & Item();

		/****************** ItemAP242 ******************/
		/**** md5 signature: 1ce5c4413fc2f2d22b54b078fea7862d ****/
		%feature("compactdefaultargs") ItemAP242;
		%feature("autodoc", "No available documentation.

Returns
-------
StepVisual_StyledItemTarget
") ItemAP242;
		StepVisual_StyledItemTarget ItemAP242();

		/****************** NbStyles ******************/
		/**** md5 signature: f4c9254e3c2f31482b51b67dc038e70c ****/
		%feature("compactdefaultargs") NbStyles;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbStyles;
		Standard_Integer NbStyles();

		/****************** SetItem ******************/
		/**** md5 signature: f8751c7ecf676d7196a87836c9ffe6aa ****/
		%feature("compactdefaultargs") SetItem;
		%feature("autodoc", "No available documentation.

Parameters
----------
aItem: StepRepr_RepresentationItem

Returns
-------
None
") SetItem;
		void SetItem(const opencascade::handle<StepRepr_RepresentationItem> & aItem);

		/****************** SetItem ******************/
		/**** md5 signature: db406cab8953a05f7213afd42772e1e3 ****/
		%feature("compactdefaultargs") SetItem;
		%feature("autodoc", "No available documentation.

Parameters
----------
aItem: StepVisual_StyledItemTarget

Returns
-------
None
") SetItem;
		void SetItem(const StepVisual_StyledItemTarget & aItem);

		/****************** SetStyles ******************/
		/**** md5 signature: 4b4d81591c544820ce2b1108b7e4089d ****/
		%feature("compactdefaultargs") SetStyles;
		%feature("autodoc", "No available documentation.

Parameters
----------
aStyles: StepVisual_HArray1OfPresentationStyleAssignment

Returns
-------
None
") SetStyles;
		void SetStyles(const opencascade::handle<StepVisual_HArray1OfPresentationStyleAssignment> & aStyles);

		/****************** Styles ******************/
		/**** md5 signature: 4fc5a17642e216edc2586083b1d1576c ****/
		%feature("compactdefaultargs") Styles;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepVisual_HArray1OfPresentationStyleAssignment>
") Styles;
		const opencascade::handle<StepVisual_HArray1OfPresentationStyleAssignment> & Styles();

		/****************** StylesValue ******************/
		/**** md5 signature: a674d5f4ef7c5fbc1388477679cc8fc5 ****/
		%feature("compactdefaultargs") StylesValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
opencascade::handle<StepVisual_PresentationStyleAssignment>
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
		/****************** StepVisual_StyledItemTarget ******************/
		/**** md5 signature: 2f64081b6dab9fa6e6bbdf0c1008fcc4 ****/
		%feature("compactdefaultargs") StepVisual_StyledItemTarget;
		%feature("autodoc", "Returns a styleditemtarget select type.

Returns
-------
None
") StepVisual_StyledItemTarget;
		 StepVisual_StyledItemTarget();

		/****************** CaseNum ******************/
		/**** md5 signature: f0e39118a9846e44ccd59de148215261 ****/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a styleditemtarget kind entity that is : 1 -> geometricrepresentationitem 2 -> mappeditem 3 -> representation 4 -> topologicalrepresentationitem 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** GeometricRepresentationItem ******************/
		/**** md5 signature: 5fe5040cbfbd8308bf2067e8e59f2a57 ****/
		%feature("compactdefaultargs") GeometricRepresentationItem;
		%feature("autodoc", "Returns value as a geometricrepresentationitem (null if another type).

Returns
-------
opencascade::handle<StepGeom_GeometricRepresentationItem>
") GeometricRepresentationItem;
		opencascade::handle<StepGeom_GeometricRepresentationItem> GeometricRepresentationItem();

		/****************** MappedItem ******************/
		/**** md5 signature: 7d3cb5566b070a8a554b734d0e71c9a2 ****/
		%feature("compactdefaultargs") MappedItem;
		%feature("autodoc", "Returns value as a mappeditem (null if another type).

Returns
-------
opencascade::handle<StepRepr_MappedItem>
") MappedItem;
		opencascade::handle<StepRepr_MappedItem> MappedItem();

		/****************** Representation ******************/
		/**** md5 signature: b68b8aa0615de130a54bdd2ee7c69058 ****/
		%feature("compactdefaultargs") Representation;
		%feature("autodoc", "Returns value as a representation (null if another type).

Returns
-------
opencascade::handle<StepRepr_Representation>
") Representation;
		opencascade::handle<StepRepr_Representation> Representation();

		/****************** TopologicalRepresentationItem ******************/
		/**** md5 signature: c284bfb9f5a9e1919a195be6f2b6b165 ****/
		%feature("compactdefaultargs") TopologicalRepresentationItem;
		%feature("autodoc", "Returns value as a topologicalrepresentationitem (null if another type).

Returns
-------
opencascade::handle<StepShape_TopologicalRepresentationItem>
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
		/****************** StepVisual_SurfaceSideStyle ******************/
		/**** md5 signature: 4882b15692527097afbf4793122302de ****/
		%feature("compactdefaultargs") StepVisual_SurfaceSideStyle;
		%feature("autodoc", "Returns a surfacesidestyle.

Returns
-------
None
") StepVisual_SurfaceSideStyle;
		 StepVisual_SurfaceSideStyle();

		/****************** Init ******************/
		/**** md5 signature: af9881776eea5dc5e4c94f3b1bf501e4 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aStyles: StepVisual_HArray1OfSurfaceStyleElementSelect

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepVisual_HArray1OfSurfaceStyleElementSelect> & aStyles);

		/****************** Name ******************/
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** NbStyles ******************/
		/**** md5 signature: 9f5fbd515247307ce70e63c6f585ddb7 ****/
		%feature("compactdefaultargs") NbStyles;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbStyles;
		Standard_Integer NbStyles();

		/****************** SetName ******************/
		/**** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ****/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & aName);

		/****************** SetStyles ******************/
		/**** md5 signature: 837f1427282dbfa1651f570dd3067799 ****/
		%feature("compactdefaultargs") SetStyles;
		%feature("autodoc", "No available documentation.

Parameters
----------
aStyles: StepVisual_HArray1OfSurfaceStyleElementSelect

Returns
-------
None
") SetStyles;
		void SetStyles(const opencascade::handle<StepVisual_HArray1OfSurfaceStyleElementSelect> & aStyles);

		/****************** Styles ******************/
		/**** md5 signature: c067261784184af9c7aa81ebec0a6230 ****/
		%feature("compactdefaultargs") Styles;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepVisual_HArray1OfSurfaceStyleElementSelect>
") Styles;
		opencascade::handle<StepVisual_HArray1OfSurfaceStyleElementSelect> Styles();

		/****************** StylesValue ******************/
		/**** md5 signature: e69ee134d7ec481cf940915040946e40 ****/
		%feature("compactdefaultargs") StylesValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
StepVisual_SurfaceStyleElementSelect
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
		/****************** StepVisual_SurfaceStyleBoundary ******************/
		/**** md5 signature: c343f688faa7b3ee856d2f453c3a6cba ****/
		%feature("compactdefaultargs") StepVisual_SurfaceStyleBoundary;
		%feature("autodoc", "Returns a surfacestyleboundary.

Returns
-------
None
") StepVisual_SurfaceStyleBoundary;
		 StepVisual_SurfaceStyleBoundary();

		/****************** Init ******************/
		/**** md5 signature: 1b9f8ef27c6d3a75a114218cd9590b05 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aStyleOfBoundary: StepVisual_CurveStyle

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepVisual_CurveStyle> & aStyleOfBoundary);

		/****************** SetStyleOfBoundary ******************/
		/**** md5 signature: c0a6ef03cb2b2676b749dc49eb978fa9 ****/
		%feature("compactdefaultargs") SetStyleOfBoundary;
		%feature("autodoc", "No available documentation.

Parameters
----------
aStyleOfBoundary: StepVisual_CurveStyle

Returns
-------
None
") SetStyleOfBoundary;
		void SetStyleOfBoundary(const opencascade::handle<StepVisual_CurveStyle> & aStyleOfBoundary);

		/****************** StyleOfBoundary ******************/
		/**** md5 signature: 0f849fffb900eb31d4c6a97554a49968 ****/
		%feature("compactdefaultargs") StyleOfBoundary;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepVisual_CurveStyle>
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
		/****************** StepVisual_SurfaceStyleControlGrid ******************/
		/**** md5 signature: 54f14aa7bd79ff4edbf012835da3fc84 ****/
		%feature("compactdefaultargs") StepVisual_SurfaceStyleControlGrid;
		%feature("autodoc", "Returns a surfacestylecontrolgrid.

Returns
-------
None
") StepVisual_SurfaceStyleControlGrid;
		 StepVisual_SurfaceStyleControlGrid();

		/****************** Init ******************/
		/**** md5 signature: 5f342d6058c8060a4186e6ca6f45bdca ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aStyleOfControlGrid: StepVisual_CurveStyle

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepVisual_CurveStyle> & aStyleOfControlGrid);

		/****************** SetStyleOfControlGrid ******************/
		/**** md5 signature: 00c64e624d853c2785e0ea625922e2e1 ****/
		%feature("compactdefaultargs") SetStyleOfControlGrid;
		%feature("autodoc", "No available documentation.

Parameters
----------
aStyleOfControlGrid: StepVisual_CurveStyle

Returns
-------
None
") SetStyleOfControlGrid;
		void SetStyleOfControlGrid(const opencascade::handle<StepVisual_CurveStyle> & aStyleOfControlGrid);

		/****************** StyleOfControlGrid ******************/
		/**** md5 signature: df6b516f2ab3a519941e950f726a1a71 ****/
		%feature("compactdefaultargs") StyleOfControlGrid;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepVisual_CurveStyle>
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
		/****************** StepVisual_SurfaceStyleElementSelect ******************/
		/**** md5 signature: b170b139d52b64aa4ee6b12b9432e3c8 ****/
		%feature("compactdefaultargs") StepVisual_SurfaceStyleElementSelect;
		%feature("autodoc", "Returns a surfacestyleelementselect selecttype.

Returns
-------
None
") StepVisual_SurfaceStyleElementSelect;
		 StepVisual_SurfaceStyleElementSelect();

		/****************** CaseNum ******************/
		/**** md5 signature: f0e39118a9846e44ccd59de148215261 ****/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a surfacestyleelementselect kind entity that is : 1 -> surfacestylefillarea 2 -> surfacestyleboundary 3 -> surfacestyleparameterline 4 -> surfacestylesilhouette 5 -> surfacestylesegmentationcurve 6 -> surfacestylecontrolgrid 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** SurfaceStyleBoundary ******************/
		/**** md5 signature: 60e2375370484d5abf5ea7b996a7c3ba ****/
		%feature("compactdefaultargs") SurfaceStyleBoundary;
		%feature("autodoc", "Returns value as a surfacestyleboundary (null if another type).

Returns
-------
opencascade::handle<StepVisual_SurfaceStyleBoundary>
") SurfaceStyleBoundary;
		opencascade::handle<StepVisual_SurfaceStyleBoundary> SurfaceStyleBoundary();

		/****************** SurfaceStyleFillArea ******************/
		/**** md5 signature: 8d8549d10e2597b64c4aa01e379d2517 ****/
		%feature("compactdefaultargs") SurfaceStyleFillArea;
		%feature("autodoc", "Returns value as a surfacestylefillarea (null if another type).

Returns
-------
opencascade::handle<StepVisual_SurfaceStyleFillArea>
") SurfaceStyleFillArea;
		opencascade::handle<StepVisual_SurfaceStyleFillArea> SurfaceStyleFillArea();

		/****************** SurfaceStyleParameterLine ******************/
		/**** md5 signature: 239f8c574221b0e1ca2ff7de1fe9c988 ****/
		%feature("compactdefaultargs") SurfaceStyleParameterLine;
		%feature("autodoc", "Returns value as a surfacestyleparameterline (null if another type).

Returns
-------
opencascade::handle<StepVisual_SurfaceStyleParameterLine>
") SurfaceStyleParameterLine;
		opencascade::handle<StepVisual_SurfaceStyleParameterLine> SurfaceStyleParameterLine();

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
		/****************** StepVisual_SurfaceStyleFillArea ******************/
		/**** md5 signature: 1f1109cf250681a0a6e78b68c611d8cf ****/
		%feature("compactdefaultargs") StepVisual_SurfaceStyleFillArea;
		%feature("autodoc", "Returns a surfacestylefillarea.

Returns
-------
None
") StepVisual_SurfaceStyleFillArea;
		 StepVisual_SurfaceStyleFillArea();

		/****************** FillArea ******************/
		/**** md5 signature: 7a207f539a4cb9c890bff0e53e6499b7 ****/
		%feature("compactdefaultargs") FillArea;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepVisual_FillAreaStyle>
") FillArea;
		opencascade::handle<StepVisual_FillAreaStyle> FillArea();

		/****************** Init ******************/
		/**** md5 signature: 4984f0131e88fcdb66041d8cc23d0170 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFillArea: StepVisual_FillAreaStyle

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepVisual_FillAreaStyle> & aFillArea);

		/****************** SetFillArea ******************/
		/**** md5 signature: f5c7e3e6095f2cac2d9e4db97e049f66 ****/
		%feature("compactdefaultargs") SetFillArea;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFillArea: StepVisual_FillAreaStyle

Returns
-------
None
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
		/****************** StepVisual_SurfaceStyleParameterLine ******************/
		/**** md5 signature: 44bf16f9c49a8f448fe8553474111acc ****/
		%feature("compactdefaultargs") StepVisual_SurfaceStyleParameterLine;
		%feature("autodoc", "Returns a surfacestyleparameterline.

Returns
-------
None
") StepVisual_SurfaceStyleParameterLine;
		 StepVisual_SurfaceStyleParameterLine();

		/****************** DirectionCounts ******************/
		/**** md5 signature: cec970c2af8f43f00bfa3fce5d3ed6b2 ****/
		%feature("compactdefaultargs") DirectionCounts;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepVisual_HArray1OfDirectionCountSelect>
") DirectionCounts;
		opencascade::handle<StepVisual_HArray1OfDirectionCountSelect> DirectionCounts();

		/****************** DirectionCountsValue ******************/
		/**** md5 signature: 31f9040d4b8643736207e0a58197608b ****/
		%feature("compactdefaultargs") DirectionCountsValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
StepVisual_DirectionCountSelect
") DirectionCountsValue;
		StepVisual_DirectionCountSelect DirectionCountsValue(const Standard_Integer num);

		/****************** Init ******************/
		/**** md5 signature: cbaa35e98130ae00d7c7e312198b037e ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aStyleOfParameterLines: StepVisual_CurveStyle
aDirectionCounts: StepVisual_HArray1OfDirectionCountSelect

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepVisual_CurveStyle> & aStyleOfParameterLines, const opencascade::handle<StepVisual_HArray1OfDirectionCountSelect> & aDirectionCounts);

		/****************** NbDirectionCounts ******************/
		/**** md5 signature: e620a789179fbed828f7fff88217dcab ****/
		%feature("compactdefaultargs") NbDirectionCounts;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbDirectionCounts;
		Standard_Integer NbDirectionCounts();

		/****************** SetDirectionCounts ******************/
		/**** md5 signature: 19b9a183d71574f73b0f7a31b324685e ****/
		%feature("compactdefaultargs") SetDirectionCounts;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDirectionCounts: StepVisual_HArray1OfDirectionCountSelect

Returns
-------
None
") SetDirectionCounts;
		void SetDirectionCounts(const opencascade::handle<StepVisual_HArray1OfDirectionCountSelect> & aDirectionCounts);

		/****************** SetStyleOfParameterLines ******************/
		/**** md5 signature: 60991ea2b6f263eb992462d00c39f07a ****/
		%feature("compactdefaultargs") SetStyleOfParameterLines;
		%feature("autodoc", "No available documentation.

Parameters
----------
aStyleOfParameterLines: StepVisual_CurveStyle

Returns
-------
None
") SetStyleOfParameterLines;
		void SetStyleOfParameterLines(const opencascade::handle<StepVisual_CurveStyle> & aStyleOfParameterLines);

		/****************** StyleOfParameterLines ******************/
		/**** md5 signature: 38c96947560379a3b23831b4ab804eea ****/
		%feature("compactdefaultargs") StyleOfParameterLines;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepVisual_CurveStyle>
") StyleOfParameterLines;
		opencascade::handle<StepVisual_CurveStyle> StyleOfParameterLines();

};


%make_alias(StepVisual_SurfaceStyleParameterLine)

%extend StepVisual_SurfaceStyleParameterLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class StepVisual_SurfaceStyleSegmentationCurve *
*************************************************/
class StepVisual_SurfaceStyleSegmentationCurve : public Standard_Transient {
	public:
		/****************** StepVisual_SurfaceStyleSegmentationCurve ******************/
		/**** md5 signature: b2e636e4e4ecd4c64c1f5e5b81c7356c ****/
		%feature("compactdefaultargs") StepVisual_SurfaceStyleSegmentationCurve;
		%feature("autodoc", "Returns a surfacestylesegmentationcurve.

Returns
-------
None
") StepVisual_SurfaceStyleSegmentationCurve;
		 StepVisual_SurfaceStyleSegmentationCurve();

		/****************** Init ******************/
		/**** md5 signature: b2ff7c529207d96358b5b664bc9f29f1 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aStyleOfSegmentationCurve: StepVisual_CurveStyle

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepVisual_CurveStyle> & aStyleOfSegmentationCurve);

		/****************** SetStyleOfSegmentationCurve ******************/
		/**** md5 signature: b6d90dcef55f1078cdd65921b7f4fdf4 ****/
		%feature("compactdefaultargs") SetStyleOfSegmentationCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
aStyleOfSegmentationCurve: StepVisual_CurveStyle

Returns
-------
None
") SetStyleOfSegmentationCurve;
		void SetStyleOfSegmentationCurve(const opencascade::handle<StepVisual_CurveStyle> & aStyleOfSegmentationCurve);

		/****************** StyleOfSegmentationCurve ******************/
		/**** md5 signature: f301e19409fc020518c4f371ae565aee ****/
		%feature("compactdefaultargs") StyleOfSegmentationCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepVisual_CurveStyle>
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
		/****************** StepVisual_SurfaceStyleSilhouette ******************/
		/**** md5 signature: 552028bfb9ce796746c72b2d436cf459 ****/
		%feature("compactdefaultargs") StepVisual_SurfaceStyleSilhouette;
		%feature("autodoc", "Returns a surfacestylesilhouette.

Returns
-------
None
") StepVisual_SurfaceStyleSilhouette;
		 StepVisual_SurfaceStyleSilhouette();

		/****************** Init ******************/
		/**** md5 signature: 41c2e4d980f622a85e688c3a3cf95fbc ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aStyleOfSilhouette: StepVisual_CurveStyle

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepVisual_CurveStyle> & aStyleOfSilhouette);

		/****************** SetStyleOfSilhouette ******************/
		/**** md5 signature: 4559334ce9fd74a3bf20bac0dc9dee07 ****/
		%feature("compactdefaultargs") SetStyleOfSilhouette;
		%feature("autodoc", "No available documentation.

Parameters
----------
aStyleOfSilhouette: StepVisual_CurveStyle

Returns
-------
None
") SetStyleOfSilhouette;
		void SetStyleOfSilhouette(const opencascade::handle<StepVisual_CurveStyle> & aStyleOfSilhouette);

		/****************** StyleOfSilhouette ******************/
		/**** md5 signature: d8382ee77cafadce30346ea47d0117ff ****/
		%feature("compactdefaultargs") StyleOfSilhouette;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepVisual_CurveStyle>
") StyleOfSilhouette;
		opencascade::handle<StepVisual_CurveStyle> StyleOfSilhouette();

};


%make_alias(StepVisual_SurfaceStyleSilhouette)

%extend StepVisual_SurfaceStyleSilhouette {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class StepVisual_SurfaceStyleUsage *
*************************************/
class StepVisual_SurfaceStyleUsage : public Standard_Transient {
	public:
		/****************** StepVisual_SurfaceStyleUsage ******************/
		/**** md5 signature: cd6205afb042cafc42201bc397b0cf78 ****/
		%feature("compactdefaultargs") StepVisual_SurfaceStyleUsage;
		%feature("autodoc", "Returns a surfacestyleusage.

Returns
-------
None
") StepVisual_SurfaceStyleUsage;
		 StepVisual_SurfaceStyleUsage();

		/****************** Init ******************/
		/**** md5 signature: df82a537b1243af5e3624ca058d0f7b0 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aSide: StepVisual_SurfaceSide
aStyle: StepVisual_SurfaceSideStyle

Returns
-------
None
") Init;
		void Init(const StepVisual_SurfaceSide aSide, const opencascade::handle<StepVisual_SurfaceSideStyle> & aStyle);

		/****************** SetSide ******************/
		/**** md5 signature: cd76bd9b534e2074389344c3fb6cdb9a ****/
		%feature("compactdefaultargs") SetSide;
		%feature("autodoc", "No available documentation.

Parameters
----------
aSide: StepVisual_SurfaceSide

Returns
-------
None
") SetSide;
		void SetSide(const StepVisual_SurfaceSide aSide);

		/****************** SetStyle ******************/
		/**** md5 signature: 7e98a9b0f7baaac64a9c676e5f748940 ****/
		%feature("compactdefaultargs") SetStyle;
		%feature("autodoc", "No available documentation.

Parameters
----------
aStyle: StepVisual_SurfaceSideStyle

Returns
-------
None
") SetStyle;
		void SetStyle(const opencascade::handle<StepVisual_SurfaceSideStyle> & aStyle);

		/****************** Side ******************/
		/**** md5 signature: 0f2dd0ab0a9c85a0cced2c3c04eeb6b3 ****/
		%feature("compactdefaultargs") Side;
		%feature("autodoc", "No available documentation.

Returns
-------
StepVisual_SurfaceSide
") Side;
		StepVisual_SurfaceSide Side();

		/****************** Style ******************/
		/**** md5 signature: 281ff11a57702f076d3ab4746db9c275 ****/
		%feature("compactdefaultargs") Style;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepVisual_SurfaceSideStyle>
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
		/****************** StepVisual_Template ******************/
		/**** md5 signature: 98a29e9485b572c6d182c550517575b4 ****/
		%feature("compactdefaultargs") StepVisual_Template;
		%feature("autodoc", "Returns a template.

Returns
-------
None
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
		/****************** StepVisual_TemplateInstance ******************/
		/**** md5 signature: 00d5ea8e4e94c157bd72672626e1fe9a ****/
		%feature("compactdefaultargs") StepVisual_TemplateInstance;
		%feature("autodoc", "Returns a templateinstance.

Returns
-------
None
") StepVisual_TemplateInstance;
		 StepVisual_TemplateInstance();

};


%make_alias(StepVisual_TemplateInstance)

%extend StepVisual_TemplateInstance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class StepVisual_TessellatedItem *
***********************************/
class StepVisual_TessellatedItem : public StepGeom_GeometricRepresentationItem {
	public:
		/****************** StepVisual_TessellatedItem ******************/
		/**** md5 signature: 1f0e50b979ba0e9467d4cc0b2addf872 ****/
		%feature("compactdefaultargs") StepVisual_TessellatedItem;
		%feature("autodoc", "Returns a draughtingcalloutelement select type.

Returns
-------
None
") StepVisual_TessellatedItem;
		 StepVisual_TessellatedItem();

};


%make_alias(StepVisual_TessellatedItem)

%extend StepVisual_TessellatedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class StepVisual_TextLiteral *
*******************************/
class StepVisual_TextLiteral : public StepGeom_GeometricRepresentationItem {
	public:
		/****************** StepVisual_TextLiteral ******************/
		/**** md5 signature: 207c1764223c21381dba0520f18ef5cf ****/
		%feature("compactdefaultargs") StepVisual_TextLiteral;
		%feature("autodoc", "Returns a textliteral.

Returns
-------
None
") StepVisual_TextLiteral;
		 StepVisual_TextLiteral();

		/****************** Alignment ******************/
		/**** md5 signature: d9f3be3aca1a7c9762448f0a275713f3 ****/
		%feature("compactdefaultargs") Alignment;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Alignment;
		opencascade::handle<TCollection_HAsciiString> Alignment();

		/****************** Font ******************/
		/**** md5 signature: 366cb2d993106a7fbf312f8309637cd0 ****/
		%feature("compactdefaultargs") Font;
		%feature("autodoc", "No available documentation.

Returns
-------
StepVisual_FontSelect
") Font;
		StepVisual_FontSelect Font();

		/****************** Init ******************/
		/**** md5 signature: 50bc1c92f84c1ed1a0306b1acc2071f3 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aLiteral: TCollection_HAsciiString
aPlacement: StepGeom_Axis2Placement
aAlignment: TCollection_HAsciiString
aPath: StepVisual_TextPath
aFont: StepVisual_FontSelect

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aLiteral, const StepGeom_Axis2Placement & aPlacement, const opencascade::handle<TCollection_HAsciiString> & aAlignment, const StepVisual_TextPath aPath, const StepVisual_FontSelect & aFont);

		/****************** Literal ******************/
		/**** md5 signature: 688a7f87a89d399e30572bd17aed1a6c ****/
		%feature("compactdefaultargs") Literal;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Literal;
		opencascade::handle<TCollection_HAsciiString> Literal();

		/****************** Path ******************/
		/**** md5 signature: 7f02336e8e0f17c0b3604233e9a6ba76 ****/
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "No available documentation.

Returns
-------
StepVisual_TextPath
") Path;
		StepVisual_TextPath Path();

		/****************** Placement ******************/
		/**** md5 signature: b66e16bd2b866237c0d300c709f8aafe ****/
		%feature("compactdefaultargs") Placement;
		%feature("autodoc", "No available documentation.

Returns
-------
StepGeom_Axis2Placement
") Placement;
		StepGeom_Axis2Placement Placement();

		/****************** SetAlignment ******************/
		/**** md5 signature: 9c1731a51a841e791f14a7431af46503 ****/
		%feature("compactdefaultargs") SetAlignment;
		%feature("autodoc", "No available documentation.

Parameters
----------
aAlignment: TCollection_HAsciiString

Returns
-------
None
") SetAlignment;
		void SetAlignment(const opencascade::handle<TCollection_HAsciiString> & aAlignment);

		/****************** SetFont ******************/
		/**** md5 signature: 0fe285aab50f8b1ec2a13e1e01b1bfac ****/
		%feature("compactdefaultargs") SetFont;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFont: StepVisual_FontSelect

Returns
-------
None
") SetFont;
		void SetFont(const StepVisual_FontSelect & aFont);

		/****************** SetLiteral ******************/
		/**** md5 signature: cc3f88a6291d261365c7e8de00c8c970 ****/
		%feature("compactdefaultargs") SetLiteral;
		%feature("autodoc", "No available documentation.

Parameters
----------
aLiteral: TCollection_HAsciiString

Returns
-------
None
") SetLiteral;
		void SetLiteral(const opencascade::handle<TCollection_HAsciiString> & aLiteral);

		/****************** SetPath ******************/
		/**** md5 signature: 98ca1e3a731a056bbee1b4e31c4c7c90 ****/
		%feature("compactdefaultargs") SetPath;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPath: StepVisual_TextPath

Returns
-------
None
") SetPath;
		void SetPath(const StepVisual_TextPath aPath);

		/****************** SetPlacement ******************/
		/**** md5 signature: ad02f5eccfb653be4766b095dfa772cf ****/
		%feature("compactdefaultargs") SetPlacement;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPlacement: StepGeom_Axis2Placement

Returns
-------
None
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
		/****************** StepVisual_TextOrCharacter ******************/
		/**** md5 signature: 263f2a1181da76f8375c0a4586d07791 ****/
		%feature("compactdefaultargs") StepVisual_TextOrCharacter;
		%feature("autodoc", "Returns a textorcharacter selecttype.

Returns
-------
None
") StepVisual_TextOrCharacter;
		 StepVisual_TextOrCharacter();

		/****************** AnnotationText ******************/
		/**** md5 signature: d828bde976b7e598ba10444740a40a04 ****/
		%feature("compactdefaultargs") AnnotationText;
		%feature("autodoc", "Returns value as a annotationtext (null if another type).

Returns
-------
opencascade::handle<StepVisual_AnnotationText>
") AnnotationText;
		opencascade::handle<StepVisual_AnnotationText> AnnotationText();

		/****************** CaseNum ******************/
		/**** md5 signature: f0e39118a9846e44ccd59de148215261 ****/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a textorcharacter kind entity that is : 1 -> annotationtext 2 -> compositetext 3 -> textliteral 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** CompositeText ******************/
		/**** md5 signature: 02d79e50e6e540a3c424977d9d1dc388 ****/
		%feature("compactdefaultargs") CompositeText;
		%feature("autodoc", "Returns value as a compositetext (null if another type).

Returns
-------
opencascade::handle<StepVisual_CompositeText>
") CompositeText;
		opencascade::handle<StepVisual_CompositeText> CompositeText();

		/****************** TextLiteral ******************/
		/**** md5 signature: b12e6b464c4c0a143633eaaca9bec8e7 ****/
		%feature("compactdefaultargs") TextLiteral;
		%feature("autodoc", "Returns value as a textliteral (null if another type).

Returns
-------
opencascade::handle<StepVisual_TextLiteral>
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
		/****************** StepVisual_TextStyle ******************/
		/**** md5 signature: 45e828d51e0a5695a9ca7ada3679f9fd ****/
		%feature("compactdefaultargs") StepVisual_TextStyle;
		%feature("autodoc", "Returns a textstyle.

Returns
-------
None
") StepVisual_TextStyle;
		 StepVisual_TextStyle();

		/****************** CharacterAppearance ******************/
		/**** md5 signature: 37d0030d8a8d72f05968330f7e5ab175 ****/
		%feature("compactdefaultargs") CharacterAppearance;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepVisual_TextStyleForDefinedFont>
") CharacterAppearance;
		opencascade::handle<StepVisual_TextStyleForDefinedFont> CharacterAppearance();

		/****************** Init ******************/
		/**** md5 signature: 69f213b7c43e1df990719966e51fc47c ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aCharacterAppearance: StepVisual_TextStyleForDefinedFont

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepVisual_TextStyleForDefinedFont> & aCharacterAppearance);

		/****************** Name ******************/
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetCharacterAppearance ******************/
		/**** md5 signature: 9f723407d3433fae13854ccf88fca9da ****/
		%feature("compactdefaultargs") SetCharacterAppearance;
		%feature("autodoc", "No available documentation.

Parameters
----------
aCharacterAppearance: StepVisual_TextStyleForDefinedFont

Returns
-------
None
") SetCharacterAppearance;
		void SetCharacterAppearance(const opencascade::handle<StepVisual_TextStyleForDefinedFont> & aCharacterAppearance);

		/****************** SetName ******************/
		/**** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ****/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString

Returns
-------
None
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
		/****************** StepVisual_TextStyleForDefinedFont ******************/
		/**** md5 signature: 79829fb49193213700846560ced1fe78 ****/
		%feature("compactdefaultargs") StepVisual_TextStyleForDefinedFont;
		%feature("autodoc", "Returns a textstylefordefinedfont.

Returns
-------
None
") StepVisual_TextStyleForDefinedFont;
		 StepVisual_TextStyleForDefinedFont();

		/****************** Init ******************/
		/**** md5 signature: f4a79bece49f98e6e24eba3b506f4abc ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aTextColour: StepVisual_Colour

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepVisual_Colour> & aTextColour);

		/****************** SetTextColour ******************/
		/**** md5 signature: e3111f08f2715def0709beca5a7da748 ****/
		%feature("compactdefaultargs") SetTextColour;
		%feature("autodoc", "No available documentation.

Parameters
----------
aTextColour: StepVisual_Colour

Returns
-------
None
") SetTextColour;
		void SetTextColour(const opencascade::handle<StepVisual_Colour> & aTextColour);

		/****************** TextColour ******************/
		/**** md5 signature: 37e43acc90f39243ed2cf2ae03be99e0 ****/
		%feature("compactdefaultargs") TextColour;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepVisual_Colour>
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
		/****************** StepVisual_ViewVolume ******************/
		/**** md5 signature: 0785a7fd1db8da789ac608f090a0b641 ****/
		%feature("compactdefaultargs") StepVisual_ViewVolume;
		%feature("autodoc", "Returns a viewvolume.

Returns
-------
None
") StepVisual_ViewVolume;
		 StepVisual_ViewVolume();

		/****************** BackPlaneClipping ******************/
		/**** md5 signature: f4942e08a89ca03b954ef65f79bc0317 ****/
		%feature("compactdefaultargs") BackPlaneClipping;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") BackPlaneClipping;
		Standard_Boolean BackPlaneClipping();

		/****************** BackPlaneDistance ******************/
		/**** md5 signature: 461642553ea3f9afa8cccbf4dbb17426 ****/
		%feature("compactdefaultargs") BackPlaneDistance;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") BackPlaneDistance;
		Standard_Real BackPlaneDistance();

		/****************** FrontPlaneClipping ******************/
		/**** md5 signature: 5dc08f835aab66c4ebeee8ea44aac106 ****/
		%feature("compactdefaultargs") FrontPlaneClipping;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") FrontPlaneClipping;
		Standard_Boolean FrontPlaneClipping();

		/****************** FrontPlaneDistance ******************/
		/**** md5 signature: 9b0f3629420a101cad94471e4b2f5dc8 ****/
		%feature("compactdefaultargs") FrontPlaneDistance;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FrontPlaneDistance;
		Standard_Real FrontPlaneDistance();

		/****************** Init ******************/
		/**** md5 signature: 5334c63ff086d260ee00224d8efba9bb ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

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

Returns
-------
None
") Init;
		void Init(const StepVisual_CentralOrParallel aProjectionType, const opencascade::handle<StepGeom_CartesianPoint> & aProjectionPoint, const Standard_Real aViewPlaneDistance, const Standard_Real aFrontPlaneDistance, const Standard_Boolean aFrontPlaneClipping, const Standard_Real aBackPlaneDistance, const Standard_Boolean aBackPlaneClipping, const Standard_Boolean aViewVolumeSidesClipping, const opencascade::handle<StepVisual_PlanarBox> & aViewWindow);

		/****************** ProjectionPoint ******************/
		/**** md5 signature: 4314d1b4352760cb5ce3c88148f1e3ec ****/
		%feature("compactdefaultargs") ProjectionPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_CartesianPoint>
") ProjectionPoint;
		opencascade::handle<StepGeom_CartesianPoint> ProjectionPoint();

		/****************** ProjectionType ******************/
		/**** md5 signature: e0315a1e454ac2a2c3fa65f19c1a43eb ****/
		%feature("compactdefaultargs") ProjectionType;
		%feature("autodoc", "No available documentation.

Returns
-------
StepVisual_CentralOrParallel
") ProjectionType;
		StepVisual_CentralOrParallel ProjectionType();

		/****************** SetBackPlaneClipping ******************/
		/**** md5 signature: 6674976d6d401c95326e70806fc1ae26 ****/
		%feature("compactdefaultargs") SetBackPlaneClipping;
		%feature("autodoc", "No available documentation.

Parameters
----------
aBackPlaneClipping: bool

Returns
-------
None
") SetBackPlaneClipping;
		void SetBackPlaneClipping(const Standard_Boolean aBackPlaneClipping);

		/****************** SetBackPlaneDistance ******************/
		/**** md5 signature: edfc21fcbb6d0e0206180b0f4a0e4f16 ****/
		%feature("compactdefaultargs") SetBackPlaneDistance;
		%feature("autodoc", "No available documentation.

Parameters
----------
aBackPlaneDistance: float

Returns
-------
None
") SetBackPlaneDistance;
		void SetBackPlaneDistance(const Standard_Real aBackPlaneDistance);

		/****************** SetFrontPlaneClipping ******************/
		/**** md5 signature: 2ef3554ed4085b640a49951a13c68697 ****/
		%feature("compactdefaultargs") SetFrontPlaneClipping;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFrontPlaneClipping: bool

Returns
-------
None
") SetFrontPlaneClipping;
		void SetFrontPlaneClipping(const Standard_Boolean aFrontPlaneClipping);

		/****************** SetFrontPlaneDistance ******************/
		/**** md5 signature: 0abafb345d231817ec21629b7183d720 ****/
		%feature("compactdefaultargs") SetFrontPlaneDistance;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFrontPlaneDistance: float

Returns
-------
None
") SetFrontPlaneDistance;
		void SetFrontPlaneDistance(const Standard_Real aFrontPlaneDistance);

		/****************** SetProjectionPoint ******************/
		/**** md5 signature: 88da046078f60f581b65e026335ecd38 ****/
		%feature("compactdefaultargs") SetProjectionPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
aProjectionPoint: StepGeom_CartesianPoint

Returns
-------
None
") SetProjectionPoint;
		void SetProjectionPoint(const opencascade::handle<StepGeom_CartesianPoint> & aProjectionPoint);

		/****************** SetProjectionType ******************/
		/**** md5 signature: 3a707c0c3f03e6c5db11e789ae6e5506 ****/
		%feature("compactdefaultargs") SetProjectionType;
		%feature("autodoc", "No available documentation.

Parameters
----------
aProjectionType: StepVisual_CentralOrParallel

Returns
-------
None
") SetProjectionType;
		void SetProjectionType(const StepVisual_CentralOrParallel aProjectionType);

		/****************** SetViewPlaneDistance ******************/
		/**** md5 signature: da1f3356e5f41bcfc2bb04e77f58c10e ****/
		%feature("compactdefaultargs") SetViewPlaneDistance;
		%feature("autodoc", "No available documentation.

Parameters
----------
aViewPlaneDistance: float

Returns
-------
None
") SetViewPlaneDistance;
		void SetViewPlaneDistance(const Standard_Real aViewPlaneDistance);

		/****************** SetViewVolumeSidesClipping ******************/
		/**** md5 signature: 938e917fe37c3b73ccc2088beb9e6574 ****/
		%feature("compactdefaultargs") SetViewVolumeSidesClipping;
		%feature("autodoc", "No available documentation.

Parameters
----------
aViewVolumeSidesClipping: bool

Returns
-------
None
") SetViewVolumeSidesClipping;
		void SetViewVolumeSidesClipping(const Standard_Boolean aViewVolumeSidesClipping);

		/****************** SetViewWindow ******************/
		/**** md5 signature: 136a748355c9fefae97d375748f65d19 ****/
		%feature("compactdefaultargs") SetViewWindow;
		%feature("autodoc", "No available documentation.

Parameters
----------
aViewWindow: StepVisual_PlanarBox

Returns
-------
None
") SetViewWindow;
		void SetViewWindow(const opencascade::handle<StepVisual_PlanarBox> & aViewWindow);

		/****************** ViewPlaneDistance ******************/
		/**** md5 signature: 7ab9aeb9cdc69dbf281d1fbcecc18b25 ****/
		%feature("compactdefaultargs") ViewPlaneDistance;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") ViewPlaneDistance;
		Standard_Real ViewPlaneDistance();

		/****************** ViewVolumeSidesClipping ******************/
		/**** md5 signature: a3f90f4afd2383c29f11c96039e9a2f1 ****/
		%feature("compactdefaultargs") ViewVolumeSidesClipping;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") ViewVolumeSidesClipping;
		Standard_Boolean ViewVolumeSidesClipping();

		/****************** ViewWindow ******************/
		/**** md5 signature: 725cc0912678c398b3fece353204acfc ****/
		%feature("compactdefaultargs") ViewWindow;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepVisual_PlanarBox>
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
		/****************** StepVisual_AnnotationOccurrence ******************/
		/**** md5 signature: 1170a3a1953a137ef5dea4fee59f9067 ****/
		%feature("compactdefaultargs") StepVisual_AnnotationOccurrence;
		%feature("autodoc", "Returns a annotationoccurrence.

Returns
-------
None
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
		/****************** StepVisual_BackgroundColour ******************/
		/**** md5 signature: 127c1c50d44bca9a3548d62ac975d8cb ****/
		%feature("compactdefaultargs") StepVisual_BackgroundColour;
		%feature("autodoc", "Returns a backgroundcolour.

Returns
-------
None
") StepVisual_BackgroundColour;
		 StepVisual_BackgroundColour();

		/****************** Init ******************/
		/**** md5 signature: 028fc5afe2ca9ac48a52f2c46f5726d2 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPresentation: StepVisual_AreaOrView

Returns
-------
None
") Init;
		void Init(const StepVisual_AreaOrView & aPresentation);

		/****************** Presentation ******************/
		/**** md5 signature: 876aa9ba539473d78fc21599f42ecd29 ****/
		%feature("compactdefaultargs") Presentation;
		%feature("autodoc", "No available documentation.

Returns
-------
StepVisual_AreaOrView
") Presentation;
		StepVisual_AreaOrView Presentation();

		/****************** SetPresentation ******************/
		/**** md5 signature: fc429b3902dffd59d732a58ca794ca03 ****/
		%feature("compactdefaultargs") SetPresentation;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPresentation: StepVisual_AreaOrView

Returns
-------
None
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
		/****************** StepVisual_CameraImage2dWithScale ******************/
		/**** md5 signature: 726c3e77e36a5065625ac3580cd81324 ****/
		%feature("compactdefaultargs") StepVisual_CameraImage2dWithScale;
		%feature("autodoc", "No available documentation.

Returns
-------
None
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
		/****************** StepVisual_CameraImage3dWithScale ******************/
		/**** md5 signature: 004c8ecc1fe1a13431b5476203c6e7ca ****/
		%feature("compactdefaultargs") StepVisual_CameraImage3dWithScale;
		%feature("autodoc", "No available documentation.

Returns
-------
None
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
		/****************** StepVisual_CameraModelD2 ******************/
		/**** md5 signature: 748a8eaaea8afa45672846794d81c253 ****/
		%feature("compactdefaultargs") StepVisual_CameraModelD2;
		%feature("autodoc", "Returns a cameramodeld2.

Returns
-------
None
") StepVisual_CameraModelD2;
		 StepVisual_CameraModelD2();

		/****************** Init ******************/
		/**** md5 signature: dbffc25b3471018fbf5fe9cab1b7eb83 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aViewWindow: StepVisual_PlanarBox
aViewWindowClipping: bool

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepVisual_PlanarBox> & aViewWindow, const Standard_Boolean aViewWindowClipping);

		/****************** SetViewWindow ******************/
		/**** md5 signature: 136a748355c9fefae97d375748f65d19 ****/
		%feature("compactdefaultargs") SetViewWindow;
		%feature("autodoc", "No available documentation.

Parameters
----------
aViewWindow: StepVisual_PlanarBox

Returns
-------
None
") SetViewWindow;
		void SetViewWindow(const opencascade::handle<StepVisual_PlanarBox> & aViewWindow);

		/****************** SetViewWindowClipping ******************/
		/**** md5 signature: 2b3733762e8bdaf1ef52f2d1b7c8b674 ****/
		%feature("compactdefaultargs") SetViewWindowClipping;
		%feature("autodoc", "No available documentation.

Parameters
----------
aViewWindowClipping: bool

Returns
-------
None
") SetViewWindowClipping;
		void SetViewWindowClipping(const Standard_Boolean aViewWindowClipping);

		/****************** ViewWindow ******************/
		/**** md5 signature: 725cc0912678c398b3fece353204acfc ****/
		%feature("compactdefaultargs") ViewWindow;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepVisual_PlanarBox>
") ViewWindow;
		opencascade::handle<StepVisual_PlanarBox> ViewWindow();

		/****************** ViewWindowClipping ******************/
		/**** md5 signature: 60a35ab5c04f44b804a3cc10158ea739 ****/
		%feature("compactdefaultargs") ViewWindowClipping;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
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
		/****************** StepVisual_CameraModelD3 ******************/
		/**** md5 signature: 841a26e60795284278f7070e4fb49a07 ****/
		%feature("compactdefaultargs") StepVisual_CameraModelD3;
		%feature("autodoc", "Returns a cameramodeld3.

Returns
-------
None
") StepVisual_CameraModelD3;
		 StepVisual_CameraModelD3();

		/****************** Init ******************/
		/**** md5 signature: 2798b9bfb91180a5b3eeffa7cc122059 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aViewReferenceSystem: StepGeom_Axis2Placement3d
aPerspectiveOfVolume: StepVisual_ViewVolume

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepGeom_Axis2Placement3d> & aViewReferenceSystem, const opencascade::handle<StepVisual_ViewVolume> & aPerspectiveOfVolume);

		/****************** PerspectiveOfVolume ******************/
		/**** md5 signature: b9367179fea54fd5444ea2ba436b49b3 ****/
		%feature("compactdefaultargs") PerspectiveOfVolume;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepVisual_ViewVolume>
") PerspectiveOfVolume;
		opencascade::handle<StepVisual_ViewVolume> PerspectiveOfVolume();

		/****************** SetPerspectiveOfVolume ******************/
		/**** md5 signature: ac3a2531e6d2a743285ffcc4f0285f55 ****/
		%feature("compactdefaultargs") SetPerspectiveOfVolume;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPerspectiveOfVolume: StepVisual_ViewVolume

Returns
-------
None
") SetPerspectiveOfVolume;
		void SetPerspectiveOfVolume(const opencascade::handle<StepVisual_ViewVolume> & aPerspectiveOfVolume);

		/****************** SetViewReferenceSystem ******************/
		/**** md5 signature: d6fd6fa5b899d15394116f9e86b70115 ****/
		%feature("compactdefaultargs") SetViewReferenceSystem;
		%feature("autodoc", "No available documentation.

Parameters
----------
aViewReferenceSystem: StepGeom_Axis2Placement3d

Returns
-------
None
") SetViewReferenceSystem;
		void SetViewReferenceSystem(const opencascade::handle<StepGeom_Axis2Placement3d> & aViewReferenceSystem);

		/****************** ViewReferenceSystem ******************/
		/**** md5 signature: 84d34fde6fa2bd63ba5c975b6201f63c ****/
		%feature("compactdefaultargs") ViewReferenceSystem;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepGeom_Axis2Placement3d>
") ViewReferenceSystem;
		opencascade::handle<StepGeom_Axis2Placement3d> ViewReferenceSystem();

};


%make_alias(StepVisual_CameraModelD3)

%extend StepVisual_CameraModelD3 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************************************************************************
* class StepVisual_CharacterizedObjectAndCharacterizedRepresentationAndDraughtingModelAndRepresentation *
********************************************************************************************************/
class StepVisual_CharacterizedObjectAndCharacterizedRepresentationAndDraughtingModelAndRepresentation : public StepVisual_DraughtingModel {
	public:
		/****************** StepVisual_CharacterizedObjectAndCharacterizedRepresentationAndDraughtingModelAndRepresentation ******************/
		/**** md5 signature: 1192a6d4d595dc4f7222e13241e0f3cb ****/
		%feature("compactdefaultargs") StepVisual_CharacterizedObjectAndCharacterizedRepresentationAndDraughtingModelAndRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepVisual_CharacterizedObjectAndCharacterizedRepresentationAndDraughtingModelAndRepresentation;
		 StepVisual_CharacterizedObjectAndCharacterizedRepresentationAndDraughtingModelAndRepresentation();

};


%make_alias(StepVisual_CharacterizedObjectAndCharacterizedRepresentationAndDraughtingModelAndRepresentation)

%extend StepVisual_CharacterizedObjectAndCharacterizedRepresentationAndDraughtingModelAndRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class StepVisual_ColourSpecification *
***************************************/
class StepVisual_ColourSpecification : public StepVisual_Colour {
	public:
		/****************** StepVisual_ColourSpecification ******************/
		/**** md5 signature: cfd4e535b8138ca08665d921957c0090 ****/
		%feature("compactdefaultargs") StepVisual_ColourSpecification;
		%feature("autodoc", "Returns a colourspecification.

Returns
-------
None
") StepVisual_ColourSpecification;
		 StepVisual_ColourSpecification();

		/****************** Init ******************/
		/**** md5 signature: e10f4ffe4365262d2d9a5484d96325b8 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName);

		/****************** Name ******************/
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetName ******************/
		/**** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ****/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString

Returns
-------
None
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
		/****************** StepVisual_CompositeTextWithExtent ******************/
		/**** md5 signature: db03fa0030cb7ff09731453861cbf670 ****/
		%feature("compactdefaultargs") StepVisual_CompositeTextWithExtent;
		%feature("autodoc", "Returns a compositetextwithextent.

Returns
-------
None
") StepVisual_CompositeTextWithExtent;
		 StepVisual_CompositeTextWithExtent();

		/****************** Extent ******************/
		/**** md5 signature: 5734b609e25d7e110c6c219f167f280a ****/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepVisual_PlanarExtent>
") Extent;
		opencascade::handle<StepVisual_PlanarExtent> Extent();

		/****************** Init ******************/
		/**** md5 signature: 110b91406c02697e42c454f3b015db2d ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aCollectedText: StepVisual_HArray1OfTextOrCharacter
aExtent: StepVisual_PlanarExtent

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepVisual_HArray1OfTextOrCharacter> & aCollectedText, const opencascade::handle<StepVisual_PlanarExtent> & aExtent);

		/****************** SetExtent ******************/
		/**** md5 signature: 32a808f68d4795ac572a482545c43c81 ****/
		%feature("compactdefaultargs") SetExtent;
		%feature("autodoc", "No available documentation.

Parameters
----------
aExtent: StepVisual_PlanarExtent

Returns
-------
None
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
		/****************** StepVisual_ContextDependentInvisibility ******************/
		/**** md5 signature: 45f5662915ecc05f35fc8f5c289ace90 ****/
		%feature("compactdefaultargs") StepVisual_ContextDependentInvisibility;
		%feature("autodoc", "Returns a contextdependentinvisibility.

Returns
-------
None
") StepVisual_ContextDependentInvisibility;
		 StepVisual_ContextDependentInvisibility();

		/****************** Init ******************/
		/**** md5 signature: 994ad424222e64e933e9c610e0b1c703 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aInvisibleItems: StepVisual_HArray1OfInvisibleItem
aPresentationContext: StepVisual_InvisibilityContext

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepVisual_HArray1OfInvisibleItem> & aInvisibleItems, const StepVisual_InvisibilityContext & aPresentationContext);

		/****************** PresentationContext ******************/
		/**** md5 signature: 65ec5e64ff0da9a7fc1f18ae60091180 ****/
		%feature("compactdefaultargs") PresentationContext;
		%feature("autodoc", "No available documentation.

Returns
-------
StepVisual_InvisibilityContext
") PresentationContext;
		StepVisual_InvisibilityContext PresentationContext();

		/****************** SetPresentationContext ******************/
		/**** md5 signature: 7a127d727fe8b71a0200708dd5afc50e ****/
		%feature("compactdefaultargs") SetPresentationContext;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPresentationContext: StepVisual_InvisibilityContext

Returns
-------
None
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
		/****************** StepVisual_CoordinatesList ******************/
		/**** md5 signature: 9dc6281a340d089c274d050bc3736846 ****/
		%feature("compactdefaultargs") StepVisual_CoordinatesList;
		%feature("autodoc", "Returns a coordinate list.

Returns
-------
None
") StepVisual_CoordinatesList;
		 StepVisual_CoordinatesList();

		/****************** Init ******************/
		/**** md5 signature: 6b8cf97a27cc571f37e1cba05bc22c29 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
theName: TCollection_HAsciiString
thePoints: TColgp_HArray1OfXYZ

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TColgp_HArray1OfXYZ> & thePoints);

		/****************** Points ******************/
		/**** md5 signature: ae57370bd0bdd13575b3a053117bf726 ****/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColgp_HArray1OfXYZ>
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
		/****************** StepVisual_MechanicalDesignGeometricPresentationRepresentation ******************/
		/**** md5 signature: 0b5887ccf6d8da9641b7e6cf35e54902 ****/
		%feature("compactdefaultargs") StepVisual_MechanicalDesignGeometricPresentationRepresentation;
		%feature("autodoc", "Returns a mechanicaldesigngeometricpresentationrepresentation.

Returns
-------
None
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
		/****************** StepVisual_OverRidingStyledItem ******************/
		/**** md5 signature: 7dd9409c2a297555a1e543763e6677bd ****/
		%feature("compactdefaultargs") StepVisual_OverRidingStyledItem;
		%feature("autodoc", "Returns a overridingstyleditem.

Returns
-------
None
") StepVisual_OverRidingStyledItem;
		 StepVisual_OverRidingStyledItem();

		/****************** Init ******************/
		/**** md5 signature: b6eaf947f5bce980117254b1de3cdbd8 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aStyles: StepVisual_HArray1OfPresentationStyleAssignment
aItem: Standard_Transient
aOverRiddenStyle: StepVisual_StyledItem

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepVisual_HArray1OfPresentationStyleAssignment> & aStyles, const opencascade::handle<Standard_Transient> & aItem, const opencascade::handle<StepVisual_StyledItem> & aOverRiddenStyle);

		/****************** OverRiddenStyle ******************/
		/**** md5 signature: 9e4e31e172072f2fc6a76eb75d8d429e ****/
		%feature("compactdefaultargs") OverRiddenStyle;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepVisual_StyledItem>
") OverRiddenStyle;
		opencascade::handle<StepVisual_StyledItem> OverRiddenStyle();

		/****************** SetOverRiddenStyle ******************/
		/**** md5 signature: 87a251079ac6fcd30a33ec63df3ccc14 ****/
		%feature("compactdefaultargs") SetOverRiddenStyle;
		%feature("autodoc", "No available documentation.

Parameters
----------
aOverRiddenStyle: StepVisual_StyledItem

Returns
-------
None
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
		/****************** StepVisual_PlanarBox ******************/
		/**** md5 signature: 68e92f54bada54fb960bae2e9c369040 ****/
		%feature("compactdefaultargs") StepVisual_PlanarBox;
		%feature("autodoc", "Returns a planarbox.

Returns
-------
None
") StepVisual_PlanarBox;
		 StepVisual_PlanarBox();

		/****************** Init ******************/
		/**** md5 signature: 8bf864327a59155b489a5980c7481f2f ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aSizeInX: float
aSizeInY: float
aPlacement: StepGeom_Axis2Placement

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const Standard_Real aSizeInX, const Standard_Real aSizeInY, const StepGeom_Axis2Placement & aPlacement);

		/****************** Placement ******************/
		/**** md5 signature: b66e16bd2b866237c0d300c709f8aafe ****/
		%feature("compactdefaultargs") Placement;
		%feature("autodoc", "No available documentation.

Returns
-------
StepGeom_Axis2Placement
") Placement;
		StepGeom_Axis2Placement Placement();

		/****************** SetPlacement ******************/
		/**** md5 signature: ad02f5eccfb653be4766b095dfa772cf ****/
		%feature("compactdefaultargs") SetPlacement;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPlacement: StepGeom_Axis2Placement

Returns
-------
None
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
		/****************** StepVisual_PreDefinedColour ******************/
		/**** md5 signature: 3eaf6ff7acb4014fa3bef2422b112da9 ****/
		%feature("compactdefaultargs") StepVisual_PreDefinedColour;
		%feature("autodoc", "Returns a predefinedcolour.

Returns
-------
None
") StepVisual_PreDefinedColour;
		 StepVisual_PreDefinedColour();

		/****************** GetPreDefinedItem ******************/
		/**** md5 signature: 8168ba69b08169e3fcf91829c533909b ****/
		%feature("compactdefaultargs") GetPreDefinedItem;
		%feature("autodoc", "Return a pre_defined_item part.

Returns
-------
opencascade::handle<StepVisual_PreDefinedItem>
") GetPreDefinedItem;
		const opencascade::handle<StepVisual_PreDefinedItem> & GetPreDefinedItem();

		/****************** SetPreDefinedItem ******************/
		/**** md5 signature: e07d67f04ab79f1c391f23a8492f0e43 ****/
		%feature("compactdefaultargs") SetPreDefinedItem;
		%feature("autodoc", "Set a pre_defined_item part.

Parameters
----------
item: StepVisual_PreDefinedItem

Returns
-------
None
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
		/****************** StepVisual_PreDefinedCurveFont ******************/
		/**** md5 signature: b71ff5a52d42a060eb5ac7f7e17b497a ****/
		%feature("compactdefaultargs") StepVisual_PreDefinedCurveFont;
		%feature("autodoc", "Returns a predefinedcurvefont.

Returns
-------
None
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
		/****************** StepVisual_PreDefinedTextFont ******************/
		/**** md5 signature: a56b777441f816f59ef852bfda0df1f2 ****/
		%feature("compactdefaultargs") StepVisual_PreDefinedTextFont;
		%feature("autodoc", "Returns a predefinedtextfont.

Returns
-------
None
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
		/****************** StepVisual_PresentationArea ******************/
		/**** md5 signature: f25b7b06e7dcd02c22874e12e667096a ****/
		%feature("compactdefaultargs") StepVisual_PresentationArea;
		%feature("autodoc", "Returns a presentationarea.

Returns
-------
None
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
		/****************** StepVisual_PresentationStyleByContext ******************/
		/**** md5 signature: 8723347e6438d18d40948248ea8eeaf5 ****/
		%feature("compactdefaultargs") StepVisual_PresentationStyleByContext;
		%feature("autodoc", "Returns a presentationstylebycontext.

Returns
-------
None
") StepVisual_PresentationStyleByContext;
		 StepVisual_PresentationStyleByContext();

		/****************** Init ******************/
		/**** md5 signature: 9d9086df5e83732bdf0436ac9ab29d79 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aStyles: StepVisual_HArray1OfPresentationStyleSelect
aStyleContext: StepVisual_StyleContextSelect

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepVisual_HArray1OfPresentationStyleSelect> & aStyles, const StepVisual_StyleContextSelect & aStyleContext);

		/****************** SetStyleContext ******************/
		/**** md5 signature: 8d8197c8c77f7080eddfc3b83e7ca162 ****/
		%feature("compactdefaultargs") SetStyleContext;
		%feature("autodoc", "No available documentation.

Parameters
----------
aStyleContext: StepVisual_StyleContextSelect

Returns
-------
None
") SetStyleContext;
		void SetStyleContext(const StepVisual_StyleContextSelect & aStyleContext);

		/****************** StyleContext ******************/
		/**** md5 signature: 25291206e3f2bf69a0fcbe1bb1c73a1a ****/
		%feature("compactdefaultargs") StyleContext;
		%feature("autodoc", "No available documentation.

Returns
-------
StepVisual_StyleContextSelect
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
		/****************** StepVisual_PresentationView ******************/
		/**** md5 signature: 6f4c49378d10171f5b788e0040623706 ****/
		%feature("compactdefaultargs") StepVisual_PresentationView;
		%feature("autodoc", "Returns a presentationview.

Returns
-------
None
") StepVisual_PresentationView;
		 StepVisual_PresentationView();

};


%make_alias(StepVisual_PresentationView)

%extend StepVisual_PresentationView {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class StepVisual_TessellatedAnnotationOccurrence *
***************************************************/
class StepVisual_TessellatedAnnotationOccurrence : public StepVisual_StyledItem {
	public:
		/****************** StepVisual_TessellatedAnnotationOccurrence ******************/
		/**** md5 signature: 566bb72dc881d4785a93b3b20af2e2b8 ****/
		%feature("compactdefaultargs") StepVisual_TessellatedAnnotationOccurrence;
		%feature("autodoc", "Returns a tesselatedannotationoccurence.

Returns
-------
None
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
		/****************** StepVisual_TessellatedCurveSet ******************/
		/**** md5 signature: 50d6fc18928a7807cc81a9e796fd4b2d ****/
		%feature("compactdefaultargs") StepVisual_TessellatedCurveSet;
		%feature("autodoc", "Returns a draughtingcalloutelement select type.

Returns
-------
None
") StepVisual_TessellatedCurveSet;
		 StepVisual_TessellatedCurveSet();

		/****************** CoordList ******************/
		/**** md5 signature: 19cacac91e98338b8bafd6e3f39c5847 ****/
		%feature("compactdefaultargs") CoordList;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepVisual_CoordinatesList>
") CoordList;
		opencascade::handle<StepVisual_CoordinatesList> CoordList();

		/****************** Curves ******************/
		/**** md5 signature: 2fcc167b61b3b4e02a3fe5f1ad44dc28 ****/
		%feature("compactdefaultargs") Curves;
		%feature("autodoc", "No available documentation.

Returns
-------
NCollection_Handle<StepVisual_VectorOfHSequenceOfInteger >
") Curves;
		NCollection_Handle<StepVisual_VectorOfHSequenceOfInteger > Curves();

		/****************** Init ******************/
		/**** md5 signature: 3e1b0139b2d5cd0ae25418ff544765a7 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
theName: TCollection_HAsciiString
theCoordList: StepVisual_CoordinatesList
theCurves: NCollection_Handle<StepVisual_VectorOfHSequenceOfInteger>

Returns
-------
None
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
		/****************** StepVisual_TessellatedGeometricSet ******************/
		/**** md5 signature: 7af095cc700150751133b93351473db4 ****/
		%feature("compactdefaultargs") StepVisual_TessellatedGeometricSet;
		%feature("autodoc", "Returns a draughtingcalloutelement select type.

Returns
-------
None
") StepVisual_TessellatedGeometricSet;
		 StepVisual_TessellatedGeometricSet();

		/****************** Init ******************/
		/**** md5 signature: 5a1e4132221dbd9bd990e3b979865450 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
theName: TCollection_HAsciiString
theItems: NCollection_Handle<StepVisual_Array1OfTessellatedItem>

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const NCollection_Handle<StepVisual_Array1OfTessellatedItem> & theItems);

		/****************** Items ******************/
		/**** md5 signature: f2c8bdf941344c8dc9a1b9e0f0dbd6f2 ****/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "No available documentation.

Returns
-------
NCollection_Handle<StepVisual_Array1OfTessellatedItem >
") Items;
		NCollection_Handle<StepVisual_Array1OfTessellatedItem > Items();

};


%make_alias(StepVisual_TessellatedGeometricSet)

%extend StepVisual_TessellatedGeometricSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class StepVisual_TextStyleWithBoxCharacteristics *
***************************************************/
class StepVisual_TextStyleWithBoxCharacteristics : public StepVisual_TextStyle {
	public:
		/****************** StepVisual_TextStyleWithBoxCharacteristics ******************/
		/**** md5 signature: 38bf57fdf072dd4df45f8fd1b8b1bd18 ****/
		%feature("compactdefaultargs") StepVisual_TextStyleWithBoxCharacteristics;
		%feature("autodoc", "Returns a textstylewithboxcharacteristics.

Returns
-------
None
") StepVisual_TextStyleWithBoxCharacteristics;
		 StepVisual_TextStyleWithBoxCharacteristics();

		/****************** Characteristics ******************/
		/**** md5 signature: f404ef9ffc1e7202571832cfe61d6f1a ****/
		%feature("compactdefaultargs") Characteristics;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepVisual_HArray1OfBoxCharacteristicSelect>
") Characteristics;
		opencascade::handle<StepVisual_HArray1OfBoxCharacteristicSelect> Characteristics();

		/****************** CharacteristicsValue ******************/
		/**** md5 signature: d504f1937c0bfbbf3548ed45b0cf5d75 ****/
		%feature("compactdefaultargs") CharacteristicsValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
StepVisual_BoxCharacteristicSelect
") CharacteristicsValue;
		StepVisual_BoxCharacteristicSelect CharacteristicsValue(const Standard_Integer num);

		/****************** Init ******************/
		/**** md5 signature: f2cdd3ec9856430e059eee611e1e6811 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aCharacterAppearance: StepVisual_TextStyleForDefinedFont
aCharacteristics: StepVisual_HArray1OfBoxCharacteristicSelect

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepVisual_TextStyleForDefinedFont> & aCharacterAppearance, const opencascade::handle<StepVisual_HArray1OfBoxCharacteristicSelect> & aCharacteristics);

		/****************** NbCharacteristics ******************/
		/**** md5 signature: 4c7f646d04322e6acab962ed47134e10 ****/
		%feature("compactdefaultargs") NbCharacteristics;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbCharacteristics;
		Standard_Integer NbCharacteristics();

		/****************** SetCharacteristics ******************/
		/**** md5 signature: 8fdd6de6baaffbe99586f96ed70c9a26 ****/
		%feature("compactdefaultargs") SetCharacteristics;
		%feature("autodoc", "No available documentation.

Parameters
----------
aCharacteristics: StepVisual_HArray1OfBoxCharacteristicSelect

Returns
-------
None
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
		/****************** StepVisual_AnnotationCurveOccurrence ******************/
		/**** md5 signature: dfff6d2e393001f9ee1cacdc8ecdc20d ****/
		%feature("compactdefaultargs") StepVisual_AnnotationCurveOccurrence;
		%feature("autodoc", "Returns a annotationcurveoccurrence.

Returns
-------
None
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
		/****************** StepVisual_AnnotationFillAreaOccurrence ******************/
		/**** md5 signature: 35a8ee440a123dd131d2cf9afa8fe985 ****/
		%feature("compactdefaultargs") StepVisual_AnnotationFillAreaOccurrence;
		%feature("autodoc", "Returns a annotationfillareaoccurrence.

Returns
-------
None
") StepVisual_AnnotationFillAreaOccurrence;
		 StepVisual_AnnotationFillAreaOccurrence();

		/****************** FillStyleTarget ******************/
		/**** md5 signature: 885e8abd7455dd7c56d61bda8ca9a7e3 ****/
		%feature("compactdefaultargs") FillStyleTarget;
		%feature("autodoc", "Returns field fill_style_target.

Returns
-------
opencascade::handle<StepGeom_GeometricRepresentationItem>
") FillStyleTarget;
		opencascade::handle<StepGeom_GeometricRepresentationItem> FillStyleTarget();

		/****************** Init ******************/
		/**** md5 signature: da37e729d86f3d06f5f8f71fb1dab436 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theName: TCollection_HAsciiString
theStyles: StepVisual_HArray1OfPresentationStyleAssignment
theItem: Standard_Transient
theFillStyleTarget: StepGeom_GeometricRepresentationItem

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<StepVisual_HArray1OfPresentationStyleAssignment> & theStyles, const opencascade::handle<Standard_Transient> & theItem, const opencascade::handle<StepGeom_GeometricRepresentationItem> & theFillStyleTarget);

		/****************** SetFillStyleTarget ******************/
		/**** md5 signature: 4bae9db8bbdfc96357201013c6b4fd01 ****/
		%feature("compactdefaultargs") SetFillStyleTarget;
		%feature("autodoc", "Set field fill_style_target.

Parameters
----------
theTarget: StepGeom_GeometricRepresentationItem

Returns
-------
None
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
		/****************** StepVisual_AnnotationPlane ******************/
		/**** md5 signature: b6f8046ea6a4bec95918baa4cb4d14f1 ****/
		%feature("compactdefaultargs") StepVisual_AnnotationPlane;
		%feature("autodoc", "Returns a annotationplane.

Returns
-------
None
") StepVisual_AnnotationPlane;
		 StepVisual_AnnotationPlane();

		/****************** Elements ******************/
		/**** md5 signature: 30df17a80e0c98e5b234b9ff1cd427a0 ****/
		%feature("compactdefaultargs") Elements;
		%feature("autodoc", "Returns field elements.

Returns
-------
opencascade::handle<StepVisual_HArray1OfAnnotationPlaneElement>
") Elements;
		opencascade::handle<StepVisual_HArray1OfAnnotationPlaneElement> Elements();

		/****************** ElementsValue ******************/
		/**** md5 signature: 379b6c8e1b13a66de92ec2d7c43d8776 ****/
		%feature("compactdefaultargs") ElementsValue;
		%feature("autodoc", "Returns elements with the given number.

Parameters
----------
theNum: int

Returns
-------
StepVisual_AnnotationPlaneElement
") ElementsValue;
		StepVisual_AnnotationPlaneElement ElementsValue(const Standard_Integer theNum);

		/****************** Init ******************/
		/**** md5 signature: 860354e1ff63df2679046b0a92f60e36 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
theName: TCollection_HAsciiString
theStyles: StepVisual_HArray1OfPresentationStyleAssignment
theItem: Standard_Transient
theElements: StepVisual_HArray1OfAnnotationPlaneElement

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<StepVisual_HArray1OfPresentationStyleAssignment> & theStyles, const opencascade::handle<Standard_Transient> & theItem, const opencascade::handle<StepVisual_HArray1OfAnnotationPlaneElement> & theElements);

		/****************** NbElements ******************/
		/**** md5 signature: a2c5844890f023732a846fde2e05ced3 ****/
		%feature("compactdefaultargs") NbElements;
		%feature("autodoc", "Returns number of elements.

Returns
-------
int
") NbElements;
		Standard_Integer NbElements();

		/****************** SetElements ******************/
		/**** md5 signature: 536b19fc09faf4695df49add05c14afe ****/
		%feature("compactdefaultargs") SetElements;
		%feature("autodoc", "Set field elements.

Parameters
----------
theElements: StepVisual_HArray1OfAnnotationPlaneElement

Returns
-------
None
") SetElements;
		void SetElements(const opencascade::handle<StepVisual_HArray1OfAnnotationPlaneElement> & theElements);

		/****************** SetElementsValue ******************/
		/**** md5 signature: 3e944a5dc67dafe486647a4b36fef1cc ****/
		%feature("compactdefaultargs") SetElementsValue;
		%feature("autodoc", "Sets elements with given number.

Parameters
----------
theNum: int
theItem: StepVisual_AnnotationPlaneElement

Returns
-------
None
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
		/****************** StepVisual_AnnotationTextOccurrence ******************/
		/**** md5 signature: da7ad91bd90214d3de2a03100b11c676 ****/
		%feature("compactdefaultargs") StepVisual_AnnotationTextOccurrence;
		%feature("autodoc", "Returns a annotationtextoccurrence.

Returns
-------
None
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
		/****************** StepVisual_CameraModelD3MultiClipping ******************/
		/**** md5 signature: edfd42c6cf58b7cc2aa341faa7e158f2 ****/
		%feature("compactdefaultargs") StepVisual_CameraModelD3MultiClipping;
		%feature("autodoc", "Returns a cameramodeld3multiclipping.

Returns
-------
None
") StepVisual_CameraModelD3MultiClipping;
		 StepVisual_CameraModelD3MultiClipping();

		/****************** Init ******************/
		/**** md5 signature: 87e84293664db9dea1350dfc9b17aaca ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
theName: TCollection_HAsciiString
theViewReferenceSystem: StepGeom_Axis2Placement3d
thePerspectiveOfVolume: StepVisual_ViewVolume
theShapeClipping: StepVisual_HArray1OfCameraModelD3MultiClippingInterectionSelect

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<StepGeom_Axis2Placement3d> & theViewReferenceSystem, const opencascade::handle<StepVisual_ViewVolume> & thePerspectiveOfVolume, const opencascade::handle<StepVisual_HArray1OfCameraModelD3MultiClippingInterectionSelect> & theShapeClipping);

		/****************** SetShapeClipping ******************/
		/**** md5 signature: d3f138def09366b1d4de0425b5fa7872 ****/
		%feature("compactdefaultargs") SetShapeClipping;
		%feature("autodoc", "No available documentation.

Parameters
----------
theShapeClipping: StepVisual_HArray1OfCameraModelD3MultiClippingInterectionSelect

Returns
-------
None
") SetShapeClipping;
		void SetShapeClipping(const opencascade::handle<StepVisual_HArray1OfCameraModelD3MultiClippingInterectionSelect> & theShapeClipping);

		/****************** ShapeClipping ******************/
		/**** md5 signature: 6eb5c9a377534fa0b6410bb68e41bb5b ****/
		%feature("compactdefaultargs") ShapeClipping;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepVisual_HArray1OfCameraModelD3MultiClippingInterectionSelect>
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
		/****************** StepVisual_ColourRgb ******************/
		/**** md5 signature: fc0e00166ed992e466a0001dbf841008 ****/
		%feature("compactdefaultargs") StepVisual_ColourRgb;
		%feature("autodoc", "Returns a colourrgb.

Returns
-------
None
") StepVisual_ColourRgb;
		 StepVisual_ColourRgb();

		/****************** Blue ******************/
		/**** md5 signature: 4771e446272835844a2885353fcdb8a9 ****/
		%feature("compactdefaultargs") Blue;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Blue;
		Standard_Real Blue();

		/****************** Green ******************/
		/**** md5 signature: 3857670a16bf31e5b3300ec575b3b216 ****/
		%feature("compactdefaultargs") Green;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Green;
		Standard_Real Green();

		/****************** Init ******************/
		/**** md5 signature: b7e1356da609efcfd53471dedf143b49 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aRed: float
aGreen: float
aBlue: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const Standard_Real aRed, const Standard_Real aGreen, const Standard_Real aBlue);

		/****************** Red ******************/
		/**** md5 signature: 0afa693a7d24010fd8ce065be2035322 ****/
		%feature("compactdefaultargs") Red;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Red;
		Standard_Real Red();

		/****************** SetBlue ******************/
		/**** md5 signature: 153b68d0a9744c5c4a5834c535b2fe82 ****/
		%feature("compactdefaultargs") SetBlue;
		%feature("autodoc", "No available documentation.

Parameters
----------
aBlue: float

Returns
-------
None
") SetBlue;
		void SetBlue(const Standard_Real aBlue);

		/****************** SetGreen ******************/
		/**** md5 signature: 4ffb261016c5334ce3b48e8f3df004e0 ****/
		%feature("compactdefaultargs") SetGreen;
		%feature("autodoc", "No available documentation.

Parameters
----------
aGreen: float

Returns
-------
None
") SetGreen;
		void SetGreen(const Standard_Real aGreen);

		/****************** SetRed ******************/
		/**** md5 signature: 4fed618355890a659dc4d036fb5614c4 ****/
		%feature("compactdefaultargs") SetRed;
		%feature("autodoc", "No available documentation.

Parameters
----------
aRed: float

Returns
-------
None
") SetRed;
		void SetRed(const Standard_Real aRed);

};


%make_alias(StepVisual_ColourRgb)

%extend StepVisual_ColourRgb {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************************
* class StepVisual_ContextDependentOverRidingStyledItem *
********************************************************/
class StepVisual_ContextDependentOverRidingStyledItem : public StepVisual_OverRidingStyledItem {
	public:
		/****************** StepVisual_ContextDependentOverRidingStyledItem ******************/
		/**** md5 signature: 751ad648a1d021296e877fb353c36504 ****/
		%feature("compactdefaultargs") StepVisual_ContextDependentOverRidingStyledItem;
		%feature("autodoc", "Returns a contextdependentoverridingstyleditem.

Returns
-------
None
") StepVisual_ContextDependentOverRidingStyledItem;
		 StepVisual_ContextDependentOverRidingStyledItem();

		/****************** Init ******************/
		/**** md5 signature: c24b8b9ad7b5d9a438ed02d1ab423525 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aStyles: StepVisual_HArray1OfPresentationStyleAssignment
aItem: Standard_Transient
aOverRiddenStyle: StepVisual_StyledItem
aStyleContext: StepVisual_HArray1OfStyleContextSelect

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepVisual_HArray1OfPresentationStyleAssignment> & aStyles, const opencascade::handle<Standard_Transient> & aItem, const opencascade::handle<StepVisual_StyledItem> & aOverRiddenStyle, const opencascade::handle<StepVisual_HArray1OfStyleContextSelect> & aStyleContext);

		/****************** NbStyleContext ******************/
		/**** md5 signature: e206fcfa49f6276b6afdc06f261c7d44 ****/
		%feature("compactdefaultargs") NbStyleContext;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbStyleContext;
		Standard_Integer NbStyleContext();

		/****************** SetStyleContext ******************/
		/**** md5 signature: 7d00700c8ebba1fb8dc98de6e0ff48bd ****/
		%feature("compactdefaultargs") SetStyleContext;
		%feature("autodoc", "No available documentation.

Parameters
----------
aStyleContext: StepVisual_HArray1OfStyleContextSelect

Returns
-------
None
") SetStyleContext;
		void SetStyleContext(const opencascade::handle<StepVisual_HArray1OfStyleContextSelect> & aStyleContext);

		/****************** StyleContext ******************/
		/**** md5 signature: 1062c06ab4b28ef6d87d81774a639831 ****/
		%feature("compactdefaultargs") StyleContext;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepVisual_HArray1OfStyleContextSelect>
") StyleContext;
		opencascade::handle<StepVisual_HArray1OfStyleContextSelect> StyleContext();

		/****************** StyleContextValue ******************/
		/**** md5 signature: 84bf7add41c48b8b6ef0e966cfaea101 ****/
		%feature("compactdefaultargs") StyleContextValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
StepVisual_StyleContextSelect
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
		/****************** StepVisual_DraughtingAnnotationOccurrence ******************/
		/**** md5 signature: 2b9ce23c362fbb9bfde7c9391d3cddbd ****/
		%feature("compactdefaultargs") StepVisual_DraughtingAnnotationOccurrence;
		%feature("autodoc", "Returns a draughtingannotationoccurrence.

Returns
-------
None
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
		/****************** StepVisual_DraughtingPreDefinedColour ******************/
		/**** md5 signature: 00e69d8ddf639a4c18137430bd132b5c ****/
		%feature("compactdefaultargs") StepVisual_DraughtingPreDefinedColour;
		%feature("autodoc", "Returns a draughtingpredefinedcolour.

Returns
-------
None
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
		/****************** StepVisual_DraughtingPreDefinedCurveFont ******************/
		/**** md5 signature: 60ea7de40e169960204d618db9b7c17d ****/
		%feature("compactdefaultargs") StepVisual_DraughtingPreDefinedCurveFont;
		%feature("autodoc", "Returns a draughtingpredefinedcurvefont.

Returns
-------
None
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
		/****************** StepVisual_MechanicalDesignGeometricPresentationArea ******************/
		/**** md5 signature: 0ce86d69783d015e1babc7156290b5d1 ****/
		%feature("compactdefaultargs") StepVisual_MechanicalDesignGeometricPresentationArea;
		%feature("autodoc", "Returns a mechanicaldesigngeometricpresentationarea.

Returns
-------
None
") StepVisual_MechanicalDesignGeometricPresentationArea;
		 StepVisual_MechanicalDesignGeometricPresentationArea();

};


%make_alias(StepVisual_MechanicalDesignGeometricPresentationArea)

%extend StepVisual_MechanicalDesignGeometricPresentationArea {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************************************************************************
* class StepVisual_AnnotationCurveOccurrenceAndAnnotationOccurrenceAndGeomReprItemAndReprItemAndStyledItem *
***********************************************************************************************************/
class StepVisual_AnnotationCurveOccurrenceAndAnnotationOccurrenceAndGeomReprItemAndReprItemAndStyledItem : public StepVisual_AnnotationCurveOccurrence {
	public:
		/****************** StepVisual_AnnotationCurveOccurrenceAndAnnotationOccurrenceAndGeomReprItemAndReprItemAndStyledItem ******************/
		/**** md5 signature: 5467b411ded625d626eb435ded7677a9 ****/
		%feature("compactdefaultargs") StepVisual_AnnotationCurveOccurrenceAndAnnotationOccurrenceAndGeomReprItemAndReprItemAndStyledItem;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepVisual_AnnotationCurveOccurrenceAndAnnotationOccurrenceAndGeomReprItemAndReprItemAndStyledItem;
		 StepVisual_AnnotationCurveOccurrenceAndAnnotationOccurrenceAndGeomReprItemAndReprItemAndStyledItem();

};


%make_alias(StepVisual_AnnotationCurveOccurrenceAndAnnotationOccurrenceAndGeomReprItemAndReprItemAndStyledItem)

%extend StepVisual_AnnotationCurveOccurrenceAndAnnotationOccurrenceAndGeomReprItemAndReprItemAndStyledItem {
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


class StepVisual_HArray1OfDraughtingCalloutElement : public StepVisual_Array1OfDraughtingCalloutElement, public Standard_Transient {
  public:
    StepVisual_HArray1OfDraughtingCalloutElement(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfDraughtingCalloutElement(const Standard_Integer theLower, const Standard_Integer theUpper, const StepVisual_Array1OfDraughtingCalloutElement::value_type& theValue);
    StepVisual_HArray1OfDraughtingCalloutElement(const StepVisual_Array1OfDraughtingCalloutElement& theOther);
    const StepVisual_Array1OfDraughtingCalloutElement& Array1();
    StepVisual_Array1OfDraughtingCalloutElement& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfDraughtingCalloutElement)


class StepVisual_HArray1OfDirectionCountSelect : public StepVisual_Array1OfDirectionCountSelect, public Standard_Transient {
  public:
    StepVisual_HArray1OfDirectionCountSelect(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfDirectionCountSelect(const Standard_Integer theLower, const Standard_Integer theUpper, const StepVisual_Array1OfDirectionCountSelect::value_type& theValue);
    StepVisual_HArray1OfDirectionCountSelect(const StepVisual_Array1OfDirectionCountSelect& theOther);
    const StepVisual_Array1OfDirectionCountSelect& Array1();
    StepVisual_Array1OfDirectionCountSelect& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfDirectionCountSelect)


class StepVisual_HArray1OfStyleContextSelect : public StepVisual_Array1OfStyleContextSelect, public Standard_Transient {
  public:
    StepVisual_HArray1OfStyleContextSelect(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfStyleContextSelect(const Standard_Integer theLower, const Standard_Integer theUpper, const StepVisual_Array1OfStyleContextSelect::value_type& theValue);
    StepVisual_HArray1OfStyleContextSelect(const StepVisual_Array1OfStyleContextSelect& theOther);
    const StepVisual_Array1OfStyleContextSelect& Array1();
    StepVisual_Array1OfStyleContextSelect& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfStyleContextSelect)


class StepVisual_HArray1OfPresentationStyleSelect : public StepVisual_Array1OfPresentationStyleSelect, public Standard_Transient {
  public:
    StepVisual_HArray1OfPresentationStyleSelect(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfPresentationStyleSelect(const Standard_Integer theLower, const Standard_Integer theUpper, const StepVisual_Array1OfPresentationStyleSelect::value_type& theValue);
    StepVisual_HArray1OfPresentationStyleSelect(const StepVisual_Array1OfPresentationStyleSelect& theOther);
    const StepVisual_Array1OfPresentationStyleSelect& Array1();
    StepVisual_Array1OfPresentationStyleSelect& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfPresentationStyleSelect)


class StepVisual_HArray1OfCurveStyleFontPattern : public StepVisual_Array1OfCurveStyleFontPattern, public Standard_Transient {
  public:
    StepVisual_HArray1OfCurveStyleFontPattern(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfCurveStyleFontPattern(const Standard_Integer theLower, const Standard_Integer theUpper, const StepVisual_Array1OfCurveStyleFontPattern::value_type& theValue);
    StepVisual_HArray1OfCurveStyleFontPattern(const StepVisual_Array1OfCurveStyleFontPattern& theOther);
    const StepVisual_Array1OfCurveStyleFontPattern& Array1();
    StepVisual_Array1OfCurveStyleFontPattern& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfCurveStyleFontPattern)


class StepVisual_HArray1OfBoxCharacteristicSelect : public StepVisual_Array1OfBoxCharacteristicSelect, public Standard_Transient {
  public:
    StepVisual_HArray1OfBoxCharacteristicSelect(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfBoxCharacteristicSelect(const Standard_Integer theLower, const Standard_Integer theUpper, const StepVisual_Array1OfBoxCharacteristicSelect::value_type& theValue);
    StepVisual_HArray1OfBoxCharacteristicSelect(const StepVisual_Array1OfBoxCharacteristicSelect& theOther);
    const StepVisual_Array1OfBoxCharacteristicSelect& Array1();
    StepVisual_Array1OfBoxCharacteristicSelect& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfBoxCharacteristicSelect)


class StepVisual_HArray1OfPresentationStyleAssignment : public StepVisual_Array1OfPresentationStyleAssignment, public Standard_Transient {
  public:
    StepVisual_HArray1OfPresentationStyleAssignment(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfPresentationStyleAssignment(const Standard_Integer theLower, const Standard_Integer theUpper, const StepVisual_Array1OfPresentationStyleAssignment::value_type& theValue);
    StepVisual_HArray1OfPresentationStyleAssignment(const StepVisual_Array1OfPresentationStyleAssignment& theOther);
    const StepVisual_Array1OfPresentationStyleAssignment& Array1();
    StepVisual_Array1OfPresentationStyleAssignment& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfPresentationStyleAssignment)


class StepVisual_HArray1OfFillStyleSelect : public StepVisual_Array1OfFillStyleSelect, public Standard_Transient {
  public:
    StepVisual_HArray1OfFillStyleSelect(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfFillStyleSelect(const Standard_Integer theLower, const Standard_Integer theUpper, const StepVisual_Array1OfFillStyleSelect::value_type& theValue);
    StepVisual_HArray1OfFillStyleSelect(const StepVisual_Array1OfFillStyleSelect& theOther);
    const StepVisual_Array1OfFillStyleSelect& Array1();
    StepVisual_Array1OfFillStyleSelect& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfFillStyleSelect)


class StepVisual_HArray1OfTextOrCharacter : public StepVisual_Array1OfTextOrCharacter, public Standard_Transient {
  public:
    StepVisual_HArray1OfTextOrCharacter(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfTextOrCharacter(const Standard_Integer theLower, const Standard_Integer theUpper, const StepVisual_Array1OfTextOrCharacter::value_type& theValue);
    StepVisual_HArray1OfTextOrCharacter(const StepVisual_Array1OfTextOrCharacter& theOther);
    const StepVisual_Array1OfTextOrCharacter& Array1();
    StepVisual_Array1OfTextOrCharacter& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfTextOrCharacter)


class StepVisual_HArray1OfSurfaceStyleElementSelect : public StepVisual_Array1OfSurfaceStyleElementSelect, public Standard_Transient {
  public:
    StepVisual_HArray1OfSurfaceStyleElementSelect(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfSurfaceStyleElementSelect(const Standard_Integer theLower, const Standard_Integer theUpper, const StepVisual_Array1OfSurfaceStyleElementSelect::value_type& theValue);
    StepVisual_HArray1OfSurfaceStyleElementSelect(const StepVisual_Array1OfSurfaceStyleElementSelect& theOther);
    const StepVisual_Array1OfSurfaceStyleElementSelect& Array1();
    StepVisual_Array1OfSurfaceStyleElementSelect& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfSurfaceStyleElementSelect)


class StepVisual_HArray1OfCameraModelD3MultiClippingUnionSelect : public StepVisual_Array1OfCameraModelD3MultiClippingUnionSelect, public Standard_Transient {
  public:
    StepVisual_HArray1OfCameraModelD3MultiClippingUnionSelect(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfCameraModelD3MultiClippingUnionSelect(const Standard_Integer theLower, const Standard_Integer theUpper, const StepVisual_Array1OfCameraModelD3MultiClippingUnionSelect::value_type& theValue);
    StepVisual_HArray1OfCameraModelD3MultiClippingUnionSelect(const StepVisual_Array1OfCameraModelD3MultiClippingUnionSelect& theOther);
    const StepVisual_Array1OfCameraModelD3MultiClippingUnionSelect& Array1();
    StepVisual_Array1OfCameraModelD3MultiClippingUnionSelect& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfCameraModelD3MultiClippingUnionSelect)


class StepVisual_HArray1OfLayeredItem : public StepVisual_Array1OfLayeredItem, public Standard_Transient {
  public:
    StepVisual_HArray1OfLayeredItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfLayeredItem(const Standard_Integer theLower, const Standard_Integer theUpper, const StepVisual_Array1OfLayeredItem::value_type& theValue);
    StepVisual_HArray1OfLayeredItem(const StepVisual_Array1OfLayeredItem& theOther);
    const StepVisual_Array1OfLayeredItem& Array1();
    StepVisual_Array1OfLayeredItem& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfLayeredItem)


class StepVisual_HArray1OfCameraModelD3MultiClippingInterectionSelect : public StepVisual_Array1OfCameraModelD3MultiClippingInterectionSelect, public Standard_Transient {
  public:
    StepVisual_HArray1OfCameraModelD3MultiClippingInterectionSelect(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfCameraModelD3MultiClippingInterectionSelect(const Standard_Integer theLower, const Standard_Integer theUpper, const StepVisual_Array1OfCameraModelD3MultiClippingInterectionSelect::value_type& theValue);
    StepVisual_HArray1OfCameraModelD3MultiClippingInterectionSelect(const StepVisual_Array1OfCameraModelD3MultiClippingInterectionSelect& theOther);
    const StepVisual_Array1OfCameraModelD3MultiClippingInterectionSelect& Array1();
    StepVisual_Array1OfCameraModelD3MultiClippingInterectionSelect& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfCameraModelD3MultiClippingInterectionSelect)


class StepVisual_HArray1OfInvisibleItem : public StepVisual_Array1OfInvisibleItem, public Standard_Transient {
  public:
    StepVisual_HArray1OfInvisibleItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepVisual_HArray1OfInvisibleItem(const Standard_Integer theLower, const Standard_Integer theUpper, const StepVisual_Array1OfInvisibleItem::value_type& theValue);
    StepVisual_HArray1OfInvisibleItem(const StepVisual_Array1OfInvisibleItem& theOther);
    const StepVisual_Array1OfInvisibleItem& Array1();
    StepVisual_Array1OfInvisibleItem& ChangeArray1();
};
%make_alias(StepVisual_HArray1OfInvisibleItem)

/* harray2 classes */
/* hsequence classes */
