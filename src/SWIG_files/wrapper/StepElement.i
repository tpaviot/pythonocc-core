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
%define STEPELEMENTDOCSTRING
"StepElement module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_stepelement.html"
%enddef
%module (package="OCC.Core", docstring=STEPELEMENTDOCSTRING) StepElement


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
#include<StepElement_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TCollection_module.hxx>
#include<StepRepr_module.hxx>
#include<StepData_module.hxx>
#include<TColStd_module.hxx>
#include<Message_module.hxx>
#include<Interface_module.hxx>
#include<StepBasic_module.hxx>
#include<StepShape_module.hxx>
#include<StepGeom_module.hxx>
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
%import TCollection.i
%import StepRepr.i
%import StepData.i
%import TColStd.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum StepElement_CurveEdge {
	StepElement_ElementEdge = 0,
};

enum StepElement_Element2dShape {
	StepElement_Quadrilateral = 0,
	StepElement_Triangle = 1,
};

enum StepElement_ElementOrder {
	StepElement_Linear = 0,
	StepElement_Quadratic = 1,
	StepElement_Cubic = 2,
};

enum StepElement_ElementVolume {
	StepElement_Volume = 0,
};

enum StepElement_EnumeratedCurveElementFreedom {
	StepElement_XTranslation = 0,
	StepElement_YTranslation = 1,
	StepElement_ZTranslation = 2,
	StepElement_XRotation = 3,
	StepElement_YRotation = 4,
	StepElement_ZRotation = 5,
	StepElement_Warp = 6,
	StepElement_None = 7,
};

enum StepElement_EnumeratedCurveElementPurpose {
	StepElement_Axial = 0,
	StepElement_YYBending = 1,
	StepElement_ZZBending = 2,
	StepElement_Torsion = 3,
	StepElement_XYShear = 4,
	StepElement_XZShear = 5,
	StepElement_Warping = 6,
};

enum StepElement_EnumeratedSurfaceElementPurpose {
	StepElement_MembraneDirect = 0,
	StepElement_MembraneShear = 1,
	StepElement_BendingDirect = 2,
	StepElement_BendingTorsion = 3,
	StepElement_NormalToPlaneShear = 4,
};

enum StepElement_EnumeratedVolumeElementPurpose {
	StepElement_StressDisplacement = 0,
};

enum StepElement_UnspecifiedValue {
	StepElement_Unspecified = 0,
};

enum StepElement_Volume3dElementShape {
	StepElement_Hexahedron = 0,
	StepElement_Wedge = 1,
	StepElement_Tetrahedron = 2,
	StepElement_Pyramid = 3,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class StepElement_CurveEdge(IntEnum):
	StepElement_ElementEdge = 0
StepElement_ElementEdge = StepElement_CurveEdge.StepElement_ElementEdge

class StepElement_Element2dShape(IntEnum):
	StepElement_Quadrilateral = 0
	StepElement_Triangle = 1
StepElement_Quadrilateral = StepElement_Element2dShape.StepElement_Quadrilateral
StepElement_Triangle = StepElement_Element2dShape.StepElement_Triangle

class StepElement_ElementOrder(IntEnum):
	StepElement_Linear = 0
	StepElement_Quadratic = 1
	StepElement_Cubic = 2
StepElement_Linear = StepElement_ElementOrder.StepElement_Linear
StepElement_Quadratic = StepElement_ElementOrder.StepElement_Quadratic
StepElement_Cubic = StepElement_ElementOrder.StepElement_Cubic

class StepElement_ElementVolume(IntEnum):
	StepElement_Volume = 0
StepElement_Volume = StepElement_ElementVolume.StepElement_Volume

class StepElement_EnumeratedCurveElementFreedom(IntEnum):
	StepElement_XTranslation = 0
	StepElement_YTranslation = 1
	StepElement_ZTranslation = 2
	StepElement_XRotation = 3
	StepElement_YRotation = 4
	StepElement_ZRotation = 5
	StepElement_Warp = 6
	StepElement_None = 7
StepElement_XTranslation = StepElement_EnumeratedCurveElementFreedom.StepElement_XTranslation
StepElement_YTranslation = StepElement_EnumeratedCurveElementFreedom.StepElement_YTranslation
StepElement_ZTranslation = StepElement_EnumeratedCurveElementFreedom.StepElement_ZTranslation
StepElement_XRotation = StepElement_EnumeratedCurveElementFreedom.StepElement_XRotation
StepElement_YRotation = StepElement_EnumeratedCurveElementFreedom.StepElement_YRotation
StepElement_ZRotation = StepElement_EnumeratedCurveElementFreedom.StepElement_ZRotation
StepElement_Warp = StepElement_EnumeratedCurveElementFreedom.StepElement_Warp
StepElement_None = StepElement_EnumeratedCurveElementFreedom.StepElement_None

class StepElement_EnumeratedCurveElementPurpose(IntEnum):
	StepElement_Axial = 0
	StepElement_YYBending = 1
	StepElement_ZZBending = 2
	StepElement_Torsion = 3
	StepElement_XYShear = 4
	StepElement_XZShear = 5
	StepElement_Warping = 6
StepElement_Axial = StepElement_EnumeratedCurveElementPurpose.StepElement_Axial
StepElement_YYBending = StepElement_EnumeratedCurveElementPurpose.StepElement_YYBending
StepElement_ZZBending = StepElement_EnumeratedCurveElementPurpose.StepElement_ZZBending
StepElement_Torsion = StepElement_EnumeratedCurveElementPurpose.StepElement_Torsion
StepElement_XYShear = StepElement_EnumeratedCurveElementPurpose.StepElement_XYShear
StepElement_XZShear = StepElement_EnumeratedCurveElementPurpose.StepElement_XZShear
StepElement_Warping = StepElement_EnumeratedCurveElementPurpose.StepElement_Warping

class StepElement_EnumeratedSurfaceElementPurpose(IntEnum):
	StepElement_MembraneDirect = 0
	StepElement_MembraneShear = 1
	StepElement_BendingDirect = 2
	StepElement_BendingTorsion = 3
	StepElement_NormalToPlaneShear = 4
StepElement_MembraneDirect = StepElement_EnumeratedSurfaceElementPurpose.StepElement_MembraneDirect
StepElement_MembraneShear = StepElement_EnumeratedSurfaceElementPurpose.StepElement_MembraneShear
StepElement_BendingDirect = StepElement_EnumeratedSurfaceElementPurpose.StepElement_BendingDirect
StepElement_BendingTorsion = StepElement_EnumeratedSurfaceElementPurpose.StepElement_BendingTorsion
StepElement_NormalToPlaneShear = StepElement_EnumeratedSurfaceElementPurpose.StepElement_NormalToPlaneShear

class StepElement_EnumeratedVolumeElementPurpose(IntEnum):
	StepElement_StressDisplacement = 0
StepElement_StressDisplacement = StepElement_EnumeratedVolumeElementPurpose.StepElement_StressDisplacement

class StepElement_UnspecifiedValue(IntEnum):
	StepElement_Unspecified = 0
StepElement_Unspecified = StepElement_UnspecifiedValue.StepElement_Unspecified

class StepElement_Volume3dElementShape(IntEnum):
	StepElement_Hexahedron = 0
	StepElement_Wedge = 1
	StepElement_Tetrahedron = 2
	StepElement_Pyramid = 3
StepElement_Hexahedron = StepElement_Volume3dElementShape.StepElement_Hexahedron
StepElement_Wedge = StepElement_Volume3dElementShape.StepElement_Wedge
StepElement_Tetrahedron = StepElement_Volume3dElementShape.StepElement_Tetrahedron
StepElement_Pyramid = StepElement_Volume3dElementShape.StepElement_Pyramid
};
/* end python proxy for enums */

/* handles */
%wrap_handle(StepElement_AnalysisItemWithinRepresentation)
%wrap_handle(StepElement_CurveElementEndReleasePacket)
%wrap_handle(StepElement_CurveElementFreedomMember)
%wrap_handle(StepElement_CurveElementPurposeMember)
%wrap_handle(StepElement_CurveElementSectionDefinition)
%wrap_handle(StepElement_ElementAspectMember)
%wrap_handle(StepElement_ElementDescriptor)
%wrap_handle(StepElement_ElementMaterial)
%wrap_handle(StepElement_MeasureOrUnspecifiedValueMember)
%wrap_handle(StepElement_SurfaceElementProperty)
%wrap_handle(StepElement_SurfaceElementPurposeMember)
%wrap_handle(StepElement_SurfaceSection)
%wrap_handle(StepElement_SurfaceSectionField)
%wrap_handle(StepElement_VolumeElementPurposeMember)
%wrap_handle(StepElement_Curve3dElementDescriptor)
%wrap_handle(StepElement_CurveElementSectionDerivedDefinitions)
%wrap_handle(StepElement_Surface3dElementDescriptor)
%wrap_handle(StepElement_SurfaceSectionFieldConstant)
%wrap_handle(StepElement_SurfaceSectionFieldVarying)
%wrap_handle(StepElement_UniformSurfaceSection)
%wrap_handle(StepElement_Volume3dElementDescriptor)
/* end handles declaration */

/* templates */
%template(StepElement_Array1OfCurveElementEndReleasePacket) NCollection_Array1<opencascade::handle<StepElement_CurveElementEndReleasePacket>>;
Array1ExtendIter(opencascade::handle<StepElement_CurveElementEndReleasePacket>)

%template(StepElement_Array1OfCurveElementSectionDefinition) NCollection_Array1<opencascade::handle<StepElement_CurveElementSectionDefinition>>;
Array1ExtendIter(opencascade::handle<StepElement_CurveElementSectionDefinition>)

%template(StepElement_Array1OfMeasureOrUnspecifiedValue) NCollection_Array1<StepElement_MeasureOrUnspecifiedValue>;
Array1ExtendIter(StepElement_MeasureOrUnspecifiedValue)

%template(StepElement_Array1OfSurfaceSection) NCollection_Array1<opencascade::handle<StepElement_SurfaceSection>>;
Array1ExtendIter(opencascade::handle<StepElement_SurfaceSection>)

%template(StepElement_Array1OfVolumeElementPurpose) NCollection_Array1<StepElement_VolumeElementPurpose>;
Array1ExtendIter(StepElement_VolumeElementPurpose)

%template(StepElement_Array1OfVolumeElementPurposeMember) NCollection_Array1<opencascade::handle<StepElement_VolumeElementPurposeMember>>;
Array1ExtendIter(opencascade::handle<StepElement_VolumeElementPurposeMember>)

%template(StepElement_SequenceOfCurveElementPurposeMember) NCollection_Sequence<opencascade::handle<StepElement_CurveElementPurposeMember>>;

%extend NCollection_Sequence<opencascade::handle<StepElement_CurveElementPurposeMember>> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(StepElement_SequenceOfCurveElementSectionDefinition) NCollection_Sequence<opencascade::handle<StepElement_CurveElementSectionDefinition>>;

%extend NCollection_Sequence<opencascade::handle<StepElement_CurveElementSectionDefinition>> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(StepElement_SequenceOfElementMaterial) NCollection_Sequence<opencascade::handle<StepElement_ElementMaterial>>;

%extend NCollection_Sequence<opencascade::handle<StepElement_ElementMaterial>> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(StepElement_SequenceOfSurfaceElementPurposeMember) NCollection_Sequence<opencascade::handle<StepElement_SurfaceElementPurposeMember>>;

%extend NCollection_Sequence<opencascade::handle<StepElement_SurfaceElementPurposeMember>> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<opencascade::handle<StepElement_CurveElementEndReleasePacket>> StepElement_Array1OfCurveElementEndReleasePacket;
typedef NCollection_Array1<opencascade::handle<StepElement_CurveElementSectionDefinition>> StepElement_Array1OfCurveElementSectionDefinition;
typedef NCollection_Array1<opencascade::handle<StepElement_HSequenceOfCurveElementPurposeMember>> StepElement_Array1OfHSequenceOfCurveElementPurposeMember;
typedef NCollection_Array1<opencascade::handle<StepElement_HSequenceOfSurfaceElementPurposeMember>> StepElement_Array1OfHSequenceOfSurfaceElementPurposeMember;
typedef NCollection_Array1<StepElement_MeasureOrUnspecifiedValue> StepElement_Array1OfMeasureOrUnspecifiedValue;
typedef NCollection_Array1<opencascade::handle<StepElement_SurfaceSection>> StepElement_Array1OfSurfaceSection;
typedef NCollection_Array1<StepElement_VolumeElementPurpose> StepElement_Array1OfVolumeElementPurpose;
typedef NCollection_Array1<opencascade::handle<StepElement_VolumeElementPurposeMember>> StepElement_Array1OfVolumeElementPurposeMember;
typedef NCollection_Array2<opencascade::handle<StepElement_CurveElementPurposeMember>> StepElement_Array2OfCurveElementPurposeMember;
typedef NCollection_Array2<StepElement_SurfaceElementPurpose> StepElement_Array2OfSurfaceElementPurpose;
typedef NCollection_Array2<opencascade::handle<StepElement_SurfaceElementPurposeMember>> StepElement_Array2OfSurfaceElementPurposeMember;
typedef NCollection_HArray1<opencascade::handle<StepElement_CurveElementEndReleasePacket>> StepElement_HArray1OfCurveElementEndReleasePacket;
typedef NCollection_HArray1<opencascade::handle<StepElement_CurveElementSectionDefinition>> StepElement_HArray1OfCurveElementSectionDefinition;
typedef NCollection_HArray1<opencascade::handle<StepElement_HSequenceOfCurveElementPurposeMember>> StepElement_HArray1OfHSequenceOfCurveElementPurposeMember;
typedef NCollection_HArray1<opencascade::handle<StepElement_HSequenceOfSurfaceElementPurposeMember>> StepElement_HArray1OfHSequenceOfSurfaceElementPurposeMember;
typedef NCollection_HArray1<StepElement_MeasureOrUnspecifiedValue> StepElement_HArray1OfMeasureOrUnspecifiedValue;
typedef NCollection_HArray1<opencascade::handle<StepElement_SurfaceSection>> StepElement_HArray1OfSurfaceSection;
typedef NCollection_HArray1<StepElement_VolumeElementPurpose> StepElement_HArray1OfVolumeElementPurpose;
typedef NCollection_HArray1<opencascade::handle<StepElement_VolumeElementPurposeMember>> StepElement_HArray1OfVolumeElementPurposeMember;
typedef NCollection_HArray2<opencascade::handle<StepElement_CurveElementPurposeMember>> StepElement_HArray2OfCurveElementPurposeMember;
typedef NCollection_HArray2<StepElement_SurfaceElementPurpose> StepElement_HArray2OfSurfaceElementPurpose;
typedef NCollection_HArray2<opencascade::handle<StepElement_SurfaceElementPurposeMember>> StepElement_HArray2OfSurfaceElementPurposeMember;
typedef NCollection_HSequence<opencascade::handle<StepElement_CurveElementPurposeMember>> StepElement_HSequenceOfCurveElementPurposeMember;
typedef NCollection_HSequence<opencascade::handle<StepElement_CurveElementSectionDefinition>> StepElement_HSequenceOfCurveElementSectionDefinition;
typedef NCollection_HSequence<opencascade::handle<StepElement_ElementMaterial>> StepElement_HSequenceOfElementMaterial;
typedef NCollection_HSequence<opencascade::handle<StepElement_SurfaceElementPurposeMember>> StepElement_HSequenceOfSurfaceElementPurposeMember;
typedef NCollection_Sequence<opencascade::handle<StepElement_CurveElementPurposeMember>> StepElement_SequenceOfCurveElementPurposeMember;
typedef NCollection_Sequence<opencascade::handle<StepElement_CurveElementSectionDefinition>> StepElement_SequenceOfCurveElementSectionDefinition;
typedef NCollection_Sequence<opencascade::handle<StepElement_ElementMaterial>> StepElement_SequenceOfElementMaterial;
typedef NCollection_Sequence<opencascade::handle<StepElement_SurfaceElementPurposeMember>> StepElement_SequenceOfSurfaceElementPurposeMember;
/* end typedefs declaration */

/*****************************************************
* class StepElement_AnalysisItemWithinRepresentation *
*****************************************************/
class StepElement_AnalysisItemWithinRepresentation : public Standard_Transient {
	public:
		/****** StepElement_AnalysisItemWithinRepresentation::StepElement_AnalysisItemWithinRepresentation ******/
		/****** md5 signature: 6d0a39d780983d9346befebf05c0cee9 ******/
		%feature("compactdefaultargs") StepElement_AnalysisItemWithinRepresentation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepElement_AnalysisItemWithinRepresentation;
		 StepElement_AnalysisItemWithinRepresentation();

		/****** StepElement_AnalysisItemWithinRepresentation::Description ******/
		/****** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Description.
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****** StepElement_AnalysisItemWithinRepresentation::Init ******/
		/****** md5 signature: e780b8274d3a9418c125c4fca0e023fc ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aItem: StepRepr_RepresentationItem
aRep: StepRepr_Representation

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepRepr_RepresentationItem> & aItem, const opencascade::handle<StepRepr_Representation> & aRep);

		/****** StepElement_AnalysisItemWithinRepresentation::Item ******/
		/****** md5 signature: aa18c8deb00ab1bbc1c297a46d577e7a ******/
		%feature("compactdefaultargs") Item;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_RepresentationItem>

Description
-----------
Returns field Item.
") Item;
		opencascade::handle<StepRepr_RepresentationItem> Item();

		/****** StepElement_AnalysisItemWithinRepresentation::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Name.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepElement_AnalysisItemWithinRepresentation::Rep ******/
		/****** md5 signature: 786d1c1b696b9088aaaf40e21e0573fd ******/
		%feature("compactdefaultargs") Rep;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_Representation>

Description
-----------
Returns field Rep.
") Rep;
		opencascade::handle<StepRepr_Representation> Rep();

		/****** StepElement_AnalysisItemWithinRepresentation::SetDescription ******/
		/****** md5 signature: 11ff45bab13c9c85c44619d6c4501da8 ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
Description: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Description.
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

		/****** StepElement_AnalysisItemWithinRepresentation::SetItem ******/
		/****** md5 signature: 1c40282c2ba6b421330e84617d91abdf ******/
		%feature("compactdefaultargs") SetItem;
		%feature("autodoc", "
Parameters
----------
Item: StepRepr_RepresentationItem

Return
-------
None

Description
-----------
Set field Item.
") SetItem;
		void SetItem(const opencascade::handle<StepRepr_RepresentationItem> & Item);

		/****** StepElement_AnalysisItemWithinRepresentation::SetName ******/
		/****** md5 signature: 1a85c1f4dd446039f14efe98df7aeb03 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
Name: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Name.
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & Name);

		/****** StepElement_AnalysisItemWithinRepresentation::SetRep ******/
		/****** md5 signature: 2747dcef6cd4bd273631a8c694283599 ******/
		%feature("compactdefaultargs") SetRep;
		%feature("autodoc", "
Parameters
----------
Rep: StepRepr_Representation

Return
-------
None

Description
-----------
Set field Rep.
") SetRep;
		void SetRep(const opencascade::handle<StepRepr_Representation> & Rep);

};


%make_alias(StepElement_AnalysisItemWithinRepresentation)

%extend StepElement_AnalysisItemWithinRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class StepElement_CurveElementEndReleasePacket *
*************************************************/
class StepElement_CurveElementEndReleasePacket : public Standard_Transient {
	public:
		/****** StepElement_CurveElementEndReleasePacket::StepElement_CurveElementEndReleasePacket ******/
		/****** md5 signature: 02222b0c605756e5fde894e48ab9147d ******/
		%feature("compactdefaultargs") StepElement_CurveElementEndReleasePacket;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepElement_CurveElementEndReleasePacket;
		 StepElement_CurveElementEndReleasePacket();

		/****** StepElement_CurveElementEndReleasePacket::Init ******/
		/****** md5 signature: 88ba52eb01c13bdaf5ddb42c14543cbc ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aReleaseFreedom: StepElement_CurveElementFreedom
aReleaseStiffness: double

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const StepElement_CurveElementFreedom & aReleaseFreedom, const double aReleaseStiffness);

		/****** StepElement_CurveElementEndReleasePacket::ReleaseFreedom ******/
		/****** md5 signature: 2e7b9e60bfd6f99976be44b7ca276768 ******/
		%feature("compactdefaultargs") ReleaseFreedom;
		%feature("autodoc", "Return
-------
StepElement_CurveElementFreedom

Description
-----------
Returns field ReleaseFreedom.
") ReleaseFreedom;
		StepElement_CurveElementFreedom ReleaseFreedom();

		/****** StepElement_CurveElementEndReleasePacket::ReleaseStiffness ******/
		/****** md5 signature: 996fd7cee0254443493fc1580d19cd67 ******/
		%feature("compactdefaultargs") ReleaseStiffness;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field ReleaseStiffness.
") ReleaseStiffness;
		double ReleaseStiffness();

		/****** StepElement_CurveElementEndReleasePacket::SetReleaseFreedom ******/
		/****** md5 signature: 66316e0eb66facbaf7e20185c6378c33 ******/
		%feature("compactdefaultargs") SetReleaseFreedom;
		%feature("autodoc", "
Parameters
----------
ReleaseFreedom: StepElement_CurveElementFreedom

Return
-------
None

Description
-----------
Set field ReleaseFreedom.
") SetReleaseFreedom;
		void SetReleaseFreedom(const StepElement_CurveElementFreedom & ReleaseFreedom);

		/****** StepElement_CurveElementEndReleasePacket::SetReleaseStiffness ******/
		/****** md5 signature: 8a886c1b1ebad218cfc146a89cad9ba1 ******/
		%feature("compactdefaultargs") SetReleaseStiffness;
		%feature("autodoc", "
Parameters
----------
ReleaseStiffness: double

Return
-------
None

Description
-----------
Set field ReleaseStiffness.
") SetReleaseStiffness;
		void SetReleaseStiffness(const double ReleaseStiffness);

};


%make_alias(StepElement_CurveElementEndReleasePacket)

%extend StepElement_CurveElementEndReleasePacket {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class StepElement_CurveElementFreedom *
****************************************/
class StepElement_CurveElementFreedom : public StepData_SelectType {
	public:
		/****** StepElement_CurveElementFreedom::StepElement_CurveElementFreedom ******/
		/****** md5 signature: c786db80e629edae96af3388330acfe1 ******/
		%feature("compactdefaultargs") StepElement_CurveElementFreedom;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepElement_CurveElementFreedom;
		 StepElement_CurveElementFreedom();

		/****** StepElement_CurveElementFreedom::ApplicationDefinedDegreeOfFreedom ******/
		/****** md5 signature: 0fd0c542a18b9422fd76d5c703619d4c ******/
		%feature("compactdefaultargs") ApplicationDefinedDegreeOfFreedom;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns Value as ApplicationDefinedDegreeOfFreedom (or Null if another type).
") ApplicationDefinedDegreeOfFreedom;
		opencascade::handle<TCollection_HAsciiString> ApplicationDefinedDegreeOfFreedom();

		/****** StepElement_CurveElementFreedom::CaseMem ******/
		/****** md5 signature: 3996721cbe1f7f39efa83f015b4146fa ******/
		%feature("compactdefaultargs") CaseMem;
		%feature("autodoc", "
Parameters
----------
ent: StepData_SelectMember

Return
-------
int

Description
-----------
Recognizes a items of select member CurveElementFreedomMember 1 -> EnumeratedCurveElementFreedom 2 -> ApplicationDefinedDegreeOfFreedom 0 else.
") CaseMem;
		int CaseMem(const opencascade::handle<StepData_SelectMember> & ent);

		/****** StepElement_CurveElementFreedom::CaseNum ******/
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
Recognizes a kind of CurveElementFreedom select type return 0.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepElement_CurveElementFreedom::EnumeratedCurveElementFreedom ******/
		/****** md5 signature: b71c5ae5364bbdcd46b9e8f2ddc88e71 ******/
		%feature("compactdefaultargs") EnumeratedCurveElementFreedom;
		%feature("autodoc", "Return
-------
StepElement_EnumeratedCurveElementFreedom

Description
-----------
Returns Value as EnumeratedCurveElementFreedom (or Null if another type).
") EnumeratedCurveElementFreedom;
		StepElement_EnumeratedCurveElementFreedom EnumeratedCurveElementFreedom();

		/****** StepElement_CurveElementFreedom::NewMember ******/
		/****** md5 signature: 4dce57062553ca704dad3d58f4286daa ******/
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", "Return
-------
opencascade::handle<StepData_SelectMember>

Description
-----------
Returns a new select member the type CurveElementFreedomMember.
") NewMember;
		opencascade::handle<StepData_SelectMember> NewMember();

		/****** StepElement_CurveElementFreedom::SetApplicationDefinedDegreeOfFreedom ******/
		/****** md5 signature: 5befbf4bc7a536042078023a85fb19e3 ******/
		%feature("compactdefaultargs") SetApplicationDefinedDegreeOfFreedom;
		%feature("autodoc", "
Parameters
----------
aVal: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set Value for ApplicationDefinedDegreeOfFreedom.
") SetApplicationDefinedDegreeOfFreedom;
		void SetApplicationDefinedDegreeOfFreedom(const opencascade::handle<TCollection_HAsciiString> & aVal);

		/****** StepElement_CurveElementFreedom::SetEnumeratedCurveElementFreedom ******/
		/****** md5 signature: dcbe2fcf6cba62bcfc42eabf55a4527c ******/
		%feature("compactdefaultargs") SetEnumeratedCurveElementFreedom;
		%feature("autodoc", "
Parameters
----------
aVal: StepElement_EnumeratedCurveElementFreedom

Return
-------
None

Description
-----------
Set Value for EnumeratedCurveElementFreedom.
") SetEnumeratedCurveElementFreedom;
		void SetEnumeratedCurveElementFreedom(const StepElement_EnumeratedCurveElementFreedom aVal);

};


%extend StepElement_CurveElementFreedom {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class StepElement_CurveElementFreedomMember *
**********************************************/
class StepElement_CurveElementFreedomMember : public StepData_SelectNamed {
	public:
		/****** StepElement_CurveElementFreedomMember::StepElement_CurveElementFreedomMember ******/
		/****** md5 signature: a80e8d71b9aee6024b140926970f1136 ******/
		%feature("compactdefaultargs") StepElement_CurveElementFreedomMember;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepElement_CurveElementFreedomMember;
		 StepElement_CurveElementFreedomMember();

		/****** StepElement_CurveElementFreedomMember::HasName ******/
		/****** md5 signature: 0fcc7580a7b0aa7df9ee626d148cd8f4 ******/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if has name.
") HasName;
		bool HasName();

		/****** StepElement_CurveElementFreedomMember::Matches ******/
		/****** md5 signature: 5669ec2104723ad7c0a5d6d02fd217ed ******/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
bool

Description
-----------
Tells if the name of a SelectMember matches a given one;.
") Matches;
		bool Matches(const char * const name);

		/****** StepElement_CurveElementFreedomMember::Name ******/
		/****** md5 signature: f81f5718972ea56a52cc674874d73fa6 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
char *

Description
-----------
Returns set name.
") Name;
		const char * Name();

		/****** StepElement_CurveElementFreedomMember::SetName ******/
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
Set name.
") SetName;
		bool SetName(const char * const name);

};


%make_alias(StepElement_CurveElementFreedomMember)

%extend StepElement_CurveElementFreedomMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class StepElement_CurveElementPurpose *
****************************************/
class StepElement_CurveElementPurpose : public StepData_SelectType {
	public:
		/****** StepElement_CurveElementPurpose::StepElement_CurveElementPurpose ******/
		/****** md5 signature: 74b762aa764fb6a55c725ff1d3e51bf9 ******/
		%feature("compactdefaultargs") StepElement_CurveElementPurpose;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepElement_CurveElementPurpose;
		 StepElement_CurveElementPurpose();

		/****** StepElement_CurveElementPurpose::ApplicationDefinedElementPurpose ******/
		/****** md5 signature: 37b0611195f319b893231cccd0578aba ******/
		%feature("compactdefaultargs") ApplicationDefinedElementPurpose;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns Value as ApplicationDefinedElementPurpose (or Null if another type).
") ApplicationDefinedElementPurpose;
		opencascade::handle<TCollection_HAsciiString> ApplicationDefinedElementPurpose();

		/****** StepElement_CurveElementPurpose::CaseMem ******/
		/****** md5 signature: 3996721cbe1f7f39efa83f015b4146fa ******/
		%feature("compactdefaultargs") CaseMem;
		%feature("autodoc", "
Parameters
----------
ent: StepData_SelectMember

Return
-------
int

Description
-----------
Recognizes a items of select member CurveElementPurposeMember 1 -> EnumeratedCurveElementPurpose 2 -> ApplicationDefinedElementPurpose 0 else.
") CaseMem;
		int CaseMem(const opencascade::handle<StepData_SelectMember> & ent);

		/****** StepElement_CurveElementPurpose::CaseNum ******/
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
Recognizes a kind of CurveElementPurpose select type return 0.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepElement_CurveElementPurpose::EnumeratedCurveElementPurpose ******/
		/****** md5 signature: 91ab4c6ed2b40f82fd1e9173a56308a2 ******/
		%feature("compactdefaultargs") EnumeratedCurveElementPurpose;
		%feature("autodoc", "Return
-------
StepElement_EnumeratedCurveElementPurpose

Description
-----------
Returns Value as EnumeratedCurveElementPurpose (or Null if another type).
") EnumeratedCurveElementPurpose;
		StepElement_EnumeratedCurveElementPurpose EnumeratedCurveElementPurpose();

		/****** StepElement_CurveElementPurpose::NewMember ******/
		/****** md5 signature: 4dce57062553ca704dad3d58f4286daa ******/
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", "Return
-------
opencascade::handle<StepData_SelectMember>

Description
-----------
Returns a new select member the type CurveElementPurposeMember.
") NewMember;
		opencascade::handle<StepData_SelectMember> NewMember();

		/****** StepElement_CurveElementPurpose::SetApplicationDefinedElementPurpose ******/
		/****** md5 signature: d492d8d068b95f939b146ce83ba4dd81 ******/
		%feature("compactdefaultargs") SetApplicationDefinedElementPurpose;
		%feature("autodoc", "
Parameters
----------
aVal: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set Value for ApplicationDefinedElementPurpose.
") SetApplicationDefinedElementPurpose;
		void SetApplicationDefinedElementPurpose(const opencascade::handle<TCollection_HAsciiString> & aVal);

		/****** StepElement_CurveElementPurpose::SetEnumeratedCurveElementPurpose ******/
		/****** md5 signature: 5628d158c9f11478c0309d3930892019 ******/
		%feature("compactdefaultargs") SetEnumeratedCurveElementPurpose;
		%feature("autodoc", "
Parameters
----------
aVal: StepElement_EnumeratedCurveElementPurpose

Return
-------
None

Description
-----------
Set Value for EnumeratedCurveElementPurpose.
") SetEnumeratedCurveElementPurpose;
		void SetEnumeratedCurveElementPurpose(const StepElement_EnumeratedCurveElementPurpose aVal);

};


%extend StepElement_CurveElementPurpose {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class StepElement_CurveElementPurposeMember *
**********************************************/
class StepElement_CurveElementPurposeMember : public StepData_SelectNamed {
	public:
		/****** StepElement_CurveElementPurposeMember::StepElement_CurveElementPurposeMember ******/
		/****** md5 signature: 212b074a2f288699effaa52db6ccb6f9 ******/
		%feature("compactdefaultargs") StepElement_CurveElementPurposeMember;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepElement_CurveElementPurposeMember;
		 StepElement_CurveElementPurposeMember();

		/****** StepElement_CurveElementPurposeMember::HasName ******/
		/****** md5 signature: 0fcc7580a7b0aa7df9ee626d148cd8f4 ******/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if has name.
") HasName;
		bool HasName();

		/****** StepElement_CurveElementPurposeMember::Matches ******/
		/****** md5 signature: 5669ec2104723ad7c0a5d6d02fd217ed ******/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
bool

Description
-----------
Tells if the name of a SelectMember matches a given one;.
") Matches;
		bool Matches(const char * const name);

		/****** StepElement_CurveElementPurposeMember::Name ******/
		/****** md5 signature: f81f5718972ea56a52cc674874d73fa6 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
char *

Description
-----------
Returns set name.
") Name;
		const char * Name();

		/****** StepElement_CurveElementPurposeMember::SetName ******/
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
Set name.
") SetName;
		bool SetName(const char * const name);

};


%make_alias(StepElement_CurveElementPurposeMember)

%extend StepElement_CurveElementPurposeMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class StepElement_CurveElementSectionDefinition *
**************************************************/
class StepElement_CurveElementSectionDefinition : public Standard_Transient {
	public:
		/****** StepElement_CurveElementSectionDefinition::StepElement_CurveElementSectionDefinition ******/
		/****** md5 signature: 6cec97292cf2428ad7648cc4ba7160ff ******/
		%feature("compactdefaultargs") StepElement_CurveElementSectionDefinition;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepElement_CurveElementSectionDefinition;
		 StepElement_CurveElementSectionDefinition();

		/****** StepElement_CurveElementSectionDefinition::Description ******/
		/****** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Description.
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****** StepElement_CurveElementSectionDefinition::Init ******/
		/****** md5 signature: 483e8de5d5a819847202d933d3b5cb48 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aDescription: TCollection_HAsciiString
aSectionAngle: double

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aDescription, const double aSectionAngle);

		/****** StepElement_CurveElementSectionDefinition::SectionAngle ******/
		/****** md5 signature: f35c9b383579498d40f7d5c200a230b2 ******/
		%feature("compactdefaultargs") SectionAngle;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field SectionAngle.
") SectionAngle;
		double SectionAngle();

		/****** StepElement_CurveElementSectionDefinition::SetDescription ******/
		/****** md5 signature: 11ff45bab13c9c85c44619d6c4501da8 ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
Description: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Description.
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

		/****** StepElement_CurveElementSectionDefinition::SetSectionAngle ******/
		/****** md5 signature: 54ba6968e89d997bb312f9ae392f46cf ******/
		%feature("compactdefaultargs") SetSectionAngle;
		%feature("autodoc", "
Parameters
----------
SectionAngle: double

Return
-------
None

Description
-----------
Set field SectionAngle.
") SetSectionAngle;
		void SetSectionAngle(const double SectionAngle);

};


%make_alias(StepElement_CurveElementSectionDefinition)

%extend StepElement_CurveElementSectionDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class StepElement_ElementAspect *
**********************************/
class StepElement_ElementAspect : public StepData_SelectType {
	public:
		/****** StepElement_ElementAspect::StepElement_ElementAspect ******/
		/****** md5 signature: a082380f7ee362d9ca9e3bb052698fa9 ******/
		%feature("compactdefaultargs") StepElement_ElementAspect;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepElement_ElementAspect;
		 StepElement_ElementAspect();

		/****** StepElement_ElementAspect::CaseMem ******/
		/****** md5 signature: 3996721cbe1f7f39efa83f015b4146fa ******/
		%feature("compactdefaultargs") CaseMem;
		%feature("autodoc", "
Parameters
----------
ent: StepData_SelectMember

Return
-------
int

Description
-----------
Recognizes a items of select member ElementAspectMember 1 -> ElementVolume 2 -> Volume3dFace 3 -> Volume2dFace 4 -> Volume3dEdge 5 -> Volume2dEdge 6 -> Surface3dFace 7 -> Surface2dFace 8 -> Surface3dEdge 9 -> Surface2dEdge 10 -> CurveEdge 0 else.
") CaseMem;
		int CaseMem(const opencascade::handle<StepData_SelectMember> & ent);

		/****** StepElement_ElementAspect::CaseNum ******/
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
Recognizes a kind of ElementAspect select type return 0.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepElement_ElementAspect::CurveEdge ******/
		/****** md5 signature: f5054aa2a7f76509e2108aa74f772094 ******/
		%feature("compactdefaultargs") CurveEdge;
		%feature("autodoc", "Return
-------
StepElement_CurveEdge

Description
-----------
Returns Value as CurveEdge (or Null if another type).
") CurveEdge;
		StepElement_CurveEdge CurveEdge();

		/****** StepElement_ElementAspect::ElementVolume ******/
		/****** md5 signature: 494aa2ea04812e53548cf44240a9048a ******/
		%feature("compactdefaultargs") ElementVolume;
		%feature("autodoc", "Return
-------
StepElement_ElementVolume

Description
-----------
Returns Value as ElementVolume (or Null if another type).
") ElementVolume;
		StepElement_ElementVolume ElementVolume();

		/****** StepElement_ElementAspect::NewMember ******/
		/****** md5 signature: 4dce57062553ca704dad3d58f4286daa ******/
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", "Return
-------
opencascade::handle<StepData_SelectMember>

Description
-----------
Returns a new select member the type ElementAspectMember.
") NewMember;
		opencascade::handle<StepData_SelectMember> NewMember();

		/****** StepElement_ElementAspect::SetCurveEdge ******/
		/****** md5 signature: bc8f336e88a6428165f02ef4f6f2a109 ******/
		%feature("compactdefaultargs") SetCurveEdge;
		%feature("autodoc", "
Parameters
----------
aVal: StepElement_CurveEdge

Return
-------
None

Description
-----------
Set Value for CurveEdge.
") SetCurveEdge;
		void SetCurveEdge(const StepElement_CurveEdge aVal);

		/****** StepElement_ElementAspect::SetElementVolume ******/
		/****** md5 signature: 8fd5f0f96e96b6f20a06fc0a8e20be1b ******/
		%feature("compactdefaultargs") SetElementVolume;
		%feature("autodoc", "
Parameters
----------
aVal: StepElement_ElementVolume

Return
-------
None

Description
-----------
Set Value for ElementVolume.
") SetElementVolume;
		void SetElementVolume(const StepElement_ElementVolume aVal);

		/****** StepElement_ElementAspect::SetSurface2dEdge ******/
		/****** md5 signature: f14ddb144aea6a5328cdf7a926d89c2e ******/
		%feature("compactdefaultargs") SetSurface2dEdge;
		%feature("autodoc", "
Parameters
----------
aVal: int

Return
-------
None

Description
-----------
Set Value for Surface2dEdge.
") SetSurface2dEdge;
		void SetSurface2dEdge(const int aVal);

		/****** StepElement_ElementAspect::SetSurface2dFace ******/
		/****** md5 signature: a9a3e049beb6a975f413048c40c73572 ******/
		%feature("compactdefaultargs") SetSurface2dFace;
		%feature("autodoc", "
Parameters
----------
aVal: int

Return
-------
None

Description
-----------
Set Value for Surface2dFace.
") SetSurface2dFace;
		void SetSurface2dFace(const int aVal);

		/****** StepElement_ElementAspect::SetSurface3dEdge ******/
		/****** md5 signature: 22e369ff2224453faae6dcf5338b83c0 ******/
		%feature("compactdefaultargs") SetSurface3dEdge;
		%feature("autodoc", "
Parameters
----------
aVal: int

Return
-------
None

Description
-----------
Set Value for Surface3dEdge.
") SetSurface3dEdge;
		void SetSurface3dEdge(const int aVal);

		/****** StepElement_ElementAspect::SetSurface3dFace ******/
		/****** md5 signature: 424714cbd482805bf376154253cbbb32 ******/
		%feature("compactdefaultargs") SetSurface3dFace;
		%feature("autodoc", "
Parameters
----------
aVal: int

Return
-------
None

Description
-----------
Set Value for Surface3dFace.
") SetSurface3dFace;
		void SetSurface3dFace(const int aVal);

		/****** StepElement_ElementAspect::SetVolume2dEdge ******/
		/****** md5 signature: b38736c2f4c1453912f1a40535e239ed ******/
		%feature("compactdefaultargs") SetVolume2dEdge;
		%feature("autodoc", "
Parameters
----------
aVal: int

Return
-------
None

Description
-----------
Set Value for Volume2dEdge.
") SetVolume2dEdge;
		void SetVolume2dEdge(const int aVal);

		/****** StepElement_ElementAspect::SetVolume2dFace ******/
		/****** md5 signature: 32a60533acf8fc2fe34eac2ee0871e37 ******/
		%feature("compactdefaultargs") SetVolume2dFace;
		%feature("autodoc", "
Parameters
----------
aVal: int

Return
-------
None

Description
-----------
Set Value for Volume2dFace.
") SetVolume2dFace;
		void SetVolume2dFace(const int aVal);

		/****** StepElement_ElementAspect::SetVolume3dEdge ******/
		/****** md5 signature: 0c8c7a38aa99a371865b6e4858865067 ******/
		%feature("compactdefaultargs") SetVolume3dEdge;
		%feature("autodoc", "
Parameters
----------
aVal: int

Return
-------
None

Description
-----------
Set Value for Volume3dEdge.
") SetVolume3dEdge;
		void SetVolume3dEdge(const int aVal);

		/****** StepElement_ElementAspect::SetVolume3dFace ******/
		/****** md5 signature: 7829350839f3813e9a35101fc6a8f130 ******/
		%feature("compactdefaultargs") SetVolume3dFace;
		%feature("autodoc", "
Parameters
----------
aVal: int

Return
-------
None

Description
-----------
Set Value for Volume3dFace.
") SetVolume3dFace;
		void SetVolume3dFace(const int aVal);

		/****** StepElement_ElementAspect::Surface2dEdge ******/
		/****** md5 signature: c9f6f44770228772676b68e5e07661ed ******/
		%feature("compactdefaultargs") Surface2dEdge;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns Value as Surface2dEdge (or Null if another type).
") Surface2dEdge;
		int Surface2dEdge();

		/****** StepElement_ElementAspect::Surface2dFace ******/
		/****** md5 signature: 67124b42fb254fc66aed17449e20d8d9 ******/
		%feature("compactdefaultargs") Surface2dFace;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns Value as Surface2dFace (or Null if another type).
") Surface2dFace;
		int Surface2dFace();

		/****** StepElement_ElementAspect::Surface3dEdge ******/
		/****** md5 signature: 6877036880833721eec93722d9e036b5 ******/
		%feature("compactdefaultargs") Surface3dEdge;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns Value as Surface3dEdge (or Null if another type).
") Surface3dEdge;
		int Surface3dEdge();

		/****** StepElement_ElementAspect::Surface3dFace ******/
		/****** md5 signature: 3f0d4a58dbe89a7bfd79d9cb84e93c3c ******/
		%feature("compactdefaultargs") Surface3dFace;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns Value as Surface3dFace (or Null if another type).
") Surface3dFace;
		int Surface3dFace();

		/****** StepElement_ElementAspect::Volume2dEdge ******/
		/****** md5 signature: a93a6f26e6f7fbe58284e69bdad8c2e2 ******/
		%feature("compactdefaultargs") Volume2dEdge;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns Value as Volume2dEdge (or Null if another type).
") Volume2dEdge;
		int Volume2dEdge();

		/****** StepElement_ElementAspect::Volume2dFace ******/
		/****** md5 signature: d9ac13b44b2289a91edbef98e287fcdc ******/
		%feature("compactdefaultargs") Volume2dFace;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns Value as Volume2dFace (or Null if another type).
") Volume2dFace;
		int Volume2dFace();

		/****** StepElement_ElementAspect::Volume3dEdge ******/
		/****** md5 signature: 43a69ea68884dc42eeca6fc470ec0c01 ******/
		%feature("compactdefaultargs") Volume3dEdge;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns Value as Volume3dEdge (or Null if another type).
") Volume3dEdge;
		int Volume3dEdge();

		/****** StepElement_ElementAspect::Volume3dFace ******/
		/****** md5 signature: 2d690637a67b2c85e04baf1ac8b8ddcf ******/
		%feature("compactdefaultargs") Volume3dFace;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns Value as Volume3dFace (or Null if another type).
") Volume3dFace;
		int Volume3dFace();

};


%extend StepElement_ElementAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class StepElement_ElementAspectMember *
****************************************/
class StepElement_ElementAspectMember : public StepData_SelectNamed {
	public:
		/****** StepElement_ElementAspectMember::StepElement_ElementAspectMember ******/
		/****** md5 signature: 7f20eb16d3d83424682d76c1a0d20104 ******/
		%feature("compactdefaultargs") StepElement_ElementAspectMember;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepElement_ElementAspectMember;
		 StepElement_ElementAspectMember();

		/****** StepElement_ElementAspectMember::HasName ******/
		/****** md5 signature: 0fcc7580a7b0aa7df9ee626d148cd8f4 ******/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if has name.
") HasName;
		bool HasName();

		/****** StepElement_ElementAspectMember::Matches ******/
		/****** md5 signature: 5669ec2104723ad7c0a5d6d02fd217ed ******/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
bool

Description
-----------
Tells if the name of a SelectMember matches a given one;.
") Matches;
		bool Matches(const char * const name);

		/****** StepElement_ElementAspectMember::Name ******/
		/****** md5 signature: f81f5718972ea56a52cc674874d73fa6 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
char *

Description
-----------
Returns set name.
") Name;
		const char * Name();

		/****** StepElement_ElementAspectMember::SetName ******/
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
Set name.
") SetName;
		bool SetName(const char * const name);

};


%make_alias(StepElement_ElementAspectMember)

%extend StepElement_ElementAspectMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class StepElement_ElementDescriptor *
**************************************/
class StepElement_ElementDescriptor : public Standard_Transient {
	public:
		/****** StepElement_ElementDescriptor::StepElement_ElementDescriptor ******/
		/****** md5 signature: 41a9109dc5567d013df5a08ef5520692 ******/
		%feature("compactdefaultargs") StepElement_ElementDescriptor;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepElement_ElementDescriptor;
		 StepElement_ElementDescriptor();

		/****** StepElement_ElementDescriptor::Description ******/
		/****** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Description.
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****** StepElement_ElementDescriptor::Init ******/
		/****** md5 signature: 0843df5c4b51487add3a288b44ce397b ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aTopologyOrder: StepElement_ElementOrder
aDescription: TCollection_HAsciiString

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const StepElement_ElementOrder aTopologyOrder, const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****** StepElement_ElementDescriptor::SetDescription ******/
		/****** md5 signature: 11ff45bab13c9c85c44619d6c4501da8 ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
Description: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Description.
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

		/****** StepElement_ElementDescriptor::SetTopologyOrder ******/
		/****** md5 signature: 67ae1e7dc41269bd9d88dfa89a119670 ******/
		%feature("compactdefaultargs") SetTopologyOrder;
		%feature("autodoc", "
Parameters
----------
TopologyOrder: StepElement_ElementOrder

Return
-------
None

Description
-----------
Set field TopologyOrder.
") SetTopologyOrder;
		void SetTopologyOrder(const StepElement_ElementOrder TopologyOrder);

		/****** StepElement_ElementDescriptor::TopologyOrder ******/
		/****** md5 signature: 736662bde35b90ec990339434be00ad8 ******/
		%feature("compactdefaultargs") TopologyOrder;
		%feature("autodoc", "Return
-------
StepElement_ElementOrder

Description
-----------
Returns field TopologyOrder.
") TopologyOrder;
		StepElement_ElementOrder TopologyOrder();

};


%make_alias(StepElement_ElementDescriptor)

%extend StepElement_ElementDescriptor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class StepElement_ElementMaterial *
************************************/
class StepElement_ElementMaterial : public Standard_Transient {
	public:
		/****** StepElement_ElementMaterial::StepElement_ElementMaterial ******/
		/****** md5 signature: 46a30cefae87bd17c809ad06ab810a35 ******/
		%feature("compactdefaultargs") StepElement_ElementMaterial;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepElement_ElementMaterial;
		 StepElement_ElementMaterial();

		/****** StepElement_ElementMaterial::Description ******/
		/****** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Description.
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****** StepElement_ElementMaterial::Init ******/
		/****** md5 signature: 971b84b146480840dac983b6af448f64 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aMaterialId: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aProperties: NCollection_HArray1<

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aMaterialId, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<NCollection_HArray1<opencascade::handle<StepRepr_MaterialPropertyRepresentation>> > & aProperties);

		/****** StepElement_ElementMaterial::MaterialId ******/
		/****** md5 signature: 984e9b7b658fb9d72c61c2aacacd0e4a ******/
		%feature("compactdefaultargs") MaterialId;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field MaterialId.
") MaterialId;
		opencascade::handle<TCollection_HAsciiString> MaterialId();

		/****** StepElement_ElementMaterial::Properties ******/
		/****** md5 signature: 709695d1a2ecb6f517113f340b524306 ******/
		%feature("compactdefaultargs") Properties;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<opencascade::handle<StepRepr_MaterialPropertyRepresentation>>>

Description
-----------
Returns field Properties.
") Properties;
		opencascade::handle<NCollection_HArray1<opencascade::handle<StepRepr_MaterialPropertyRepresentation>>> Properties();

		/****** StepElement_ElementMaterial::SetDescription ******/
		/****** md5 signature: 11ff45bab13c9c85c44619d6c4501da8 ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
Description: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Description.
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

		/****** StepElement_ElementMaterial::SetMaterialId ******/
		/****** md5 signature: 573021172c67fb1a12a3daefb8ff9c8b ******/
		%feature("compactdefaultargs") SetMaterialId;
		%feature("autodoc", "
Parameters
----------
MaterialId: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field MaterialId.
") SetMaterialId;
		void SetMaterialId(const opencascade::handle<TCollection_HAsciiString> & MaterialId);

		/****** StepElement_ElementMaterial::SetProperties ******/
		/****** md5 signature: e23bd67db9ed5a6cba5f4a1d3443548a ******/
		%feature("compactdefaultargs") SetProperties;
		%feature("autodoc", "
Parameters
----------
Properties: NCollection_HArray1<

Return
-------
None

Description
-----------
Set field Properties.
") SetProperties;
		void SetProperties(const opencascade::handle<NCollection_HArray1<opencascade::handle<StepRepr_MaterialPropertyRepresentation>> > & Properties);

};


%make_alias(StepElement_ElementMaterial)

%extend StepElement_ElementMaterial {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class StepElement_MeasureOrUnspecifiedValue *
**********************************************/
class StepElement_MeasureOrUnspecifiedValue : public StepData_SelectType {
	public:
		/****** StepElement_MeasureOrUnspecifiedValue::StepElement_MeasureOrUnspecifiedValue ******/
		/****** md5 signature: 806193f9c9d92063fcdf7d3a30cdcc4c ******/
		%feature("compactdefaultargs") StepElement_MeasureOrUnspecifiedValue;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepElement_MeasureOrUnspecifiedValue;
		 StepElement_MeasureOrUnspecifiedValue();

		/****** StepElement_MeasureOrUnspecifiedValue::CaseMem ******/
		/****** md5 signature: 3996721cbe1f7f39efa83f015b4146fa ******/
		%feature("compactdefaultargs") CaseMem;
		%feature("autodoc", "
Parameters
----------
ent: StepData_SelectMember

Return
-------
int

Description
-----------
Recognizes a items of select member MeasureOrUnspecifiedValueMember 1 -> ContextDependentMeasure 2 -> UnspecifiedValue 0 else.
") CaseMem;
		int CaseMem(const opencascade::handle<StepData_SelectMember> & ent);

		/****** StepElement_MeasureOrUnspecifiedValue::CaseNum ******/
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
Recognizes a kind of MeasureOrUnspecifiedValue select type return 0.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepElement_MeasureOrUnspecifiedValue::ContextDependentMeasure ******/
		/****** md5 signature: 299560223f7342e48ac151d7d067936b ******/
		%feature("compactdefaultargs") ContextDependentMeasure;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns Value as ContextDependentMeasure (or Null if another type).
") ContextDependentMeasure;
		double ContextDependentMeasure();

		/****** StepElement_MeasureOrUnspecifiedValue::NewMember ******/
		/****** md5 signature: 4dce57062553ca704dad3d58f4286daa ******/
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", "Return
-------
opencascade::handle<StepData_SelectMember>

Description
-----------
Returns a new select member the type MeasureOrUnspecifiedValueMember.
") NewMember;
		opencascade::handle<StepData_SelectMember> NewMember();

		/****** StepElement_MeasureOrUnspecifiedValue::SetContextDependentMeasure ******/
		/****** md5 signature: 07e8b262fad6b8374ff668573e918f1e ******/
		%feature("compactdefaultargs") SetContextDependentMeasure;
		%feature("autodoc", "
Parameters
----------
aVal: double

Return
-------
None

Description
-----------
Set Value for ContextDependentMeasure.
") SetContextDependentMeasure;
		void SetContextDependentMeasure(const double aVal);

		/****** StepElement_MeasureOrUnspecifiedValue::SetUnspecifiedValue ******/
		/****** md5 signature: be9d00c6897eacbfb95a54795ed0d387 ******/
		%feature("compactdefaultargs") SetUnspecifiedValue;
		%feature("autodoc", "
Parameters
----------
aVal: StepElement_UnspecifiedValue

Return
-------
None

Description
-----------
Set Value for UnspecifiedValue.
") SetUnspecifiedValue;
		void SetUnspecifiedValue(const StepElement_UnspecifiedValue aVal);

		/****** StepElement_MeasureOrUnspecifiedValue::UnspecifiedValue ******/
		/****** md5 signature: fb449b0d13bcc92ad6a836b809472b40 ******/
		%feature("compactdefaultargs") UnspecifiedValue;
		%feature("autodoc", "Return
-------
StepElement_UnspecifiedValue

Description
-----------
Returns Value as UnspecifiedValue (or Null if another type).
") UnspecifiedValue;
		StepElement_UnspecifiedValue UnspecifiedValue();

};


%extend StepElement_MeasureOrUnspecifiedValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************************
* class StepElement_MeasureOrUnspecifiedValueMember *
****************************************************/
class StepElement_MeasureOrUnspecifiedValueMember : public StepData_SelectNamed {
	public:
		/****** StepElement_MeasureOrUnspecifiedValueMember::StepElement_MeasureOrUnspecifiedValueMember ******/
		/****** md5 signature: 7c9fc3cdeb9293b8df571158a98cfc8c ******/
		%feature("compactdefaultargs") StepElement_MeasureOrUnspecifiedValueMember;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepElement_MeasureOrUnspecifiedValueMember;
		 StepElement_MeasureOrUnspecifiedValueMember();

		/****** StepElement_MeasureOrUnspecifiedValueMember::HasName ******/
		/****** md5 signature: 0fcc7580a7b0aa7df9ee626d148cd8f4 ******/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if has name.
") HasName;
		bool HasName();

		/****** StepElement_MeasureOrUnspecifiedValueMember::Matches ******/
		/****** md5 signature: 5669ec2104723ad7c0a5d6d02fd217ed ******/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
bool

Description
-----------
Tells if the name of a SelectMember matches a given one;.
") Matches;
		bool Matches(const char * const name);

		/****** StepElement_MeasureOrUnspecifiedValueMember::Name ******/
		/****** md5 signature: f81f5718972ea56a52cc674874d73fa6 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
char *

Description
-----------
Returns set name.
") Name;
		const char * Name();

		/****** StepElement_MeasureOrUnspecifiedValueMember::SetName ******/
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
Set name.
") SetName;
		bool SetName(const char * const name);

};


%make_alias(StepElement_MeasureOrUnspecifiedValueMember)

%extend StepElement_MeasureOrUnspecifiedValueMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class StepElement_SurfaceElementProperty *
*******************************************/
class StepElement_SurfaceElementProperty : public Standard_Transient {
	public:
		/****** StepElement_SurfaceElementProperty::StepElement_SurfaceElementProperty ******/
		/****** md5 signature: 4b2226c8dd20f37f207e524829caa36d ******/
		%feature("compactdefaultargs") StepElement_SurfaceElementProperty;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepElement_SurfaceElementProperty;
		 StepElement_SurfaceElementProperty();

		/****** StepElement_SurfaceElementProperty::Description ******/
		/****** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Description.
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****** StepElement_SurfaceElementProperty::Init ******/
		/****** md5 signature: cfe082a0ce8491067ce71f67b9c8742d ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aPropertyId: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aSection: StepElement_SurfaceSectionField

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aPropertyId, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepElement_SurfaceSectionField> & aSection);

		/****** StepElement_SurfaceElementProperty::PropertyId ******/
		/****** md5 signature: 4864667399554fed4d5fa9ae9070d731 ******/
		%feature("compactdefaultargs") PropertyId;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field PropertyId.
") PropertyId;
		opencascade::handle<TCollection_HAsciiString> PropertyId();

		/****** StepElement_SurfaceElementProperty::Section ******/
		/****** md5 signature: c8705f600954c1a1f9dc910730d27fa0 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "Return
-------
opencascade::handle<StepElement_SurfaceSectionField>

Description
-----------
Returns field Section.
") Section;
		opencascade::handle<StepElement_SurfaceSectionField> Section();

		/****** StepElement_SurfaceElementProperty::SetDescription ******/
		/****** md5 signature: 11ff45bab13c9c85c44619d6c4501da8 ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
Description: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Description.
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

		/****** StepElement_SurfaceElementProperty::SetPropertyId ******/
		/****** md5 signature: 24eb0454213ca7d7517eb5464cb641c2 ******/
		%feature("compactdefaultargs") SetPropertyId;
		%feature("autodoc", "
Parameters
----------
PropertyId: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field PropertyId.
") SetPropertyId;
		void SetPropertyId(const opencascade::handle<TCollection_HAsciiString> & PropertyId);

		/****** StepElement_SurfaceElementProperty::SetSection ******/
		/****** md5 signature: d6c76dc557f609a3c90a47b0e262d6cc ******/
		%feature("compactdefaultargs") SetSection;
		%feature("autodoc", "
Parameters
----------
Section: StepElement_SurfaceSectionField

Return
-------
None

Description
-----------
Set field Section.
") SetSection;
		void SetSection(const opencascade::handle<StepElement_SurfaceSectionField> & Section);

};


%make_alias(StepElement_SurfaceElementProperty)

%extend StepElement_SurfaceElementProperty {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class StepElement_SurfaceElementPurpose *
******************************************/
class StepElement_SurfaceElementPurpose : public StepData_SelectType {
	public:
		/****** StepElement_SurfaceElementPurpose::StepElement_SurfaceElementPurpose ******/
		/****** md5 signature: c395f4a4371458a619f583d40a3cfa7f ******/
		%feature("compactdefaultargs") StepElement_SurfaceElementPurpose;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepElement_SurfaceElementPurpose;
		 StepElement_SurfaceElementPurpose();

		/****** StepElement_SurfaceElementPurpose::ApplicationDefinedElementPurpose ******/
		/****** md5 signature: 37b0611195f319b893231cccd0578aba ******/
		%feature("compactdefaultargs") ApplicationDefinedElementPurpose;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns Value as ApplicationDefinedElementPurpose (or Null if another type).
") ApplicationDefinedElementPurpose;
		opencascade::handle<TCollection_HAsciiString> ApplicationDefinedElementPurpose();

		/****** StepElement_SurfaceElementPurpose::CaseMem ******/
		/****** md5 signature: 3996721cbe1f7f39efa83f015b4146fa ******/
		%feature("compactdefaultargs") CaseMem;
		%feature("autodoc", "
Parameters
----------
ent: StepData_SelectMember

Return
-------
int

Description
-----------
Recognizes a items of select member SurfaceElementPurposeMember 1 -> EnumeratedSurfaceElementPurpose 2 -> ApplicationDefinedElementPurpose 0 else.
") CaseMem;
		int CaseMem(const opencascade::handle<StepData_SelectMember> & ent);

		/****** StepElement_SurfaceElementPurpose::CaseNum ******/
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
Recognizes a kind of SurfaceElementPurpose select type return 0.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepElement_SurfaceElementPurpose::EnumeratedSurfaceElementPurpose ******/
		/****** md5 signature: 30a59187261b825edb9e5e442e97f1c3 ******/
		%feature("compactdefaultargs") EnumeratedSurfaceElementPurpose;
		%feature("autodoc", "Return
-------
StepElement_EnumeratedSurfaceElementPurpose

Description
-----------
Returns Value as EnumeratedSurfaceElementPurpose (or Null if another type).
") EnumeratedSurfaceElementPurpose;
		StepElement_EnumeratedSurfaceElementPurpose EnumeratedSurfaceElementPurpose();

		/****** StepElement_SurfaceElementPurpose::NewMember ******/
		/****** md5 signature: 4dce57062553ca704dad3d58f4286daa ******/
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", "Return
-------
opencascade::handle<StepData_SelectMember>

Description
-----------
Returns a new select member the type SurfaceElementPurposeMember.
") NewMember;
		opencascade::handle<StepData_SelectMember> NewMember();

		/****** StepElement_SurfaceElementPurpose::SetApplicationDefinedElementPurpose ******/
		/****** md5 signature: d492d8d068b95f939b146ce83ba4dd81 ******/
		%feature("compactdefaultargs") SetApplicationDefinedElementPurpose;
		%feature("autodoc", "
Parameters
----------
aVal: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set Value for ApplicationDefinedElementPurpose.
") SetApplicationDefinedElementPurpose;
		void SetApplicationDefinedElementPurpose(const opencascade::handle<TCollection_HAsciiString> & aVal);

		/****** StepElement_SurfaceElementPurpose::SetEnumeratedSurfaceElementPurpose ******/
		/****** md5 signature: 5fc0d060fe41c551757dec7a75429573 ******/
		%feature("compactdefaultargs") SetEnumeratedSurfaceElementPurpose;
		%feature("autodoc", "
Parameters
----------
aVal: StepElement_EnumeratedSurfaceElementPurpose

Return
-------
None

Description
-----------
Set Value for EnumeratedSurfaceElementPurpose.
") SetEnumeratedSurfaceElementPurpose;
		void SetEnumeratedSurfaceElementPurpose(const StepElement_EnumeratedSurfaceElementPurpose aVal);

};


%extend StepElement_SurfaceElementPurpose {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class StepElement_SurfaceElementPurposeMember *
************************************************/
class StepElement_SurfaceElementPurposeMember : public StepData_SelectNamed {
	public:
		/****** StepElement_SurfaceElementPurposeMember::StepElement_SurfaceElementPurposeMember ******/
		/****** md5 signature: 6119b2abd1c031b7fe2e577f1de81898 ******/
		%feature("compactdefaultargs") StepElement_SurfaceElementPurposeMember;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepElement_SurfaceElementPurposeMember;
		 StepElement_SurfaceElementPurposeMember();

		/****** StepElement_SurfaceElementPurposeMember::HasName ******/
		/****** md5 signature: 0fcc7580a7b0aa7df9ee626d148cd8f4 ******/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if has name.
") HasName;
		bool HasName();

		/****** StepElement_SurfaceElementPurposeMember::Matches ******/
		/****** md5 signature: 5669ec2104723ad7c0a5d6d02fd217ed ******/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
bool

Description
-----------
Tells if the name of a SelectMember matches a given one;.
") Matches;
		bool Matches(const char * const name);

		/****** StepElement_SurfaceElementPurposeMember::Name ******/
		/****** md5 signature: f81f5718972ea56a52cc674874d73fa6 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
char *

Description
-----------
Returns set name.
") Name;
		const char * Name();

		/****** StepElement_SurfaceElementPurposeMember::SetName ******/
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
Set name.
") SetName;
		bool SetName(const char * const name);

};


%make_alias(StepElement_SurfaceElementPurposeMember)

%extend StepElement_SurfaceElementPurposeMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class StepElement_SurfaceSection *
***********************************/
class StepElement_SurfaceSection : public Standard_Transient {
	public:
		/****** StepElement_SurfaceSection::StepElement_SurfaceSection ******/
		/****** md5 signature: 03838c228a62a7dc7d640aa9d5e71e7d ******/
		%feature("compactdefaultargs") StepElement_SurfaceSection;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepElement_SurfaceSection;
		 StepElement_SurfaceSection();

		/****** StepElement_SurfaceSection::Init ******/
		/****** md5 signature: ab1e2630df5e18e84ead9333e3a8a022 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aOffset: StepElement_MeasureOrUnspecifiedValue
aNonStructuralMass: StepElement_MeasureOrUnspecifiedValue
aNonStructuralMassOffset: StepElement_MeasureOrUnspecifiedValue

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const StepElement_MeasureOrUnspecifiedValue & aOffset, const StepElement_MeasureOrUnspecifiedValue & aNonStructuralMass, const StepElement_MeasureOrUnspecifiedValue & aNonStructuralMassOffset);

		/****** StepElement_SurfaceSection::NonStructuralMass ******/
		/****** md5 signature: 436bf6f6d969edecc7164d2766614e71 ******/
		%feature("compactdefaultargs") NonStructuralMass;
		%feature("autodoc", "Return
-------
StepElement_MeasureOrUnspecifiedValue

Description
-----------
Returns field NonStructuralMass.
") NonStructuralMass;
		StepElement_MeasureOrUnspecifiedValue NonStructuralMass();

		/****** StepElement_SurfaceSection::NonStructuralMassOffset ******/
		/****** md5 signature: bc43309846597942687395e3ac2827dd ******/
		%feature("compactdefaultargs") NonStructuralMassOffset;
		%feature("autodoc", "Return
-------
StepElement_MeasureOrUnspecifiedValue

Description
-----------
Returns field NonStructuralMassOffset.
") NonStructuralMassOffset;
		StepElement_MeasureOrUnspecifiedValue NonStructuralMassOffset();

		/****** StepElement_SurfaceSection::Offset ******/
		/****** md5 signature: 94a5a5660525c58b7411f51af748b9fe ******/
		%feature("compactdefaultargs") Offset;
		%feature("autodoc", "Return
-------
StepElement_MeasureOrUnspecifiedValue

Description
-----------
Returns field Offset.
") Offset;
		StepElement_MeasureOrUnspecifiedValue Offset();

		/****** StepElement_SurfaceSection::SetNonStructuralMass ******/
		/****** md5 signature: 2f170bd9d8f328de42de37ef7e35b20b ******/
		%feature("compactdefaultargs") SetNonStructuralMass;
		%feature("autodoc", "
Parameters
----------
NonStructuralMass: StepElement_MeasureOrUnspecifiedValue

Return
-------
None

Description
-----------
Set field NonStructuralMass.
") SetNonStructuralMass;
		void SetNonStructuralMass(const StepElement_MeasureOrUnspecifiedValue & NonStructuralMass);

		/****** StepElement_SurfaceSection::SetNonStructuralMassOffset ******/
		/****** md5 signature: cd7a7537cbeeae4c2e6d71e33c03b69f ******/
		%feature("compactdefaultargs") SetNonStructuralMassOffset;
		%feature("autodoc", "
Parameters
----------
NonStructuralMassOffset: StepElement_MeasureOrUnspecifiedValue

Return
-------
None

Description
-----------
Set field NonStructuralMassOffset.
") SetNonStructuralMassOffset;
		void SetNonStructuralMassOffset(const StepElement_MeasureOrUnspecifiedValue & NonStructuralMassOffset);

		/****** StepElement_SurfaceSection::SetOffset ******/
		/****** md5 signature: 71b00d207d6dd43d1afdba09ddd7558d ******/
		%feature("compactdefaultargs") SetOffset;
		%feature("autodoc", "
Parameters
----------
Offset: StepElement_MeasureOrUnspecifiedValue

Return
-------
None

Description
-----------
Set field Offset.
") SetOffset;
		void SetOffset(const StepElement_MeasureOrUnspecifiedValue & Offset);

};


%make_alias(StepElement_SurfaceSection)

%extend StepElement_SurfaceSection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class StepElement_SurfaceSectionField *
****************************************/
class StepElement_SurfaceSectionField : public Standard_Transient {
	public:
		/****** StepElement_SurfaceSectionField::StepElement_SurfaceSectionField ******/
		/****** md5 signature: 566fa5f005af84196920451ac86b5527 ******/
		%feature("compactdefaultargs") StepElement_SurfaceSectionField;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepElement_SurfaceSectionField;
		 StepElement_SurfaceSectionField();

};


%make_alias(StepElement_SurfaceSectionField)

%extend StepElement_SurfaceSectionField {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class StepElement_VolumeElementPurpose *
*****************************************/
class StepElement_VolumeElementPurpose : public StepData_SelectType {
	public:
		/****** StepElement_VolumeElementPurpose::StepElement_VolumeElementPurpose ******/
		/****** md5 signature: d3d3dbb1ab7e251a7ecceed493ca42b8 ******/
		%feature("compactdefaultargs") StepElement_VolumeElementPurpose;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepElement_VolumeElementPurpose;
		 StepElement_VolumeElementPurpose();

		/****** StepElement_VolumeElementPurpose::ApplicationDefinedElementPurpose ******/
		/****** md5 signature: 37b0611195f319b893231cccd0578aba ******/
		%feature("compactdefaultargs") ApplicationDefinedElementPurpose;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns Value as ApplicationDefinedElementPurpose (or Null if another type).
") ApplicationDefinedElementPurpose;
		opencascade::handle<TCollection_HAsciiString> ApplicationDefinedElementPurpose();

		/****** StepElement_VolumeElementPurpose::CaseMem ******/
		/****** md5 signature: 3996721cbe1f7f39efa83f015b4146fa ******/
		%feature("compactdefaultargs") CaseMem;
		%feature("autodoc", "
Parameters
----------
ent: StepData_SelectMember

Return
-------
int

Description
-----------
Recognizes a items of select member VolumeElementPurposeMember 1 -> EnumeratedVolumeElementPurpose 2 -> ApplicationDefinedElementPurpose 0 else.
") CaseMem;
		int CaseMem(const opencascade::handle<StepData_SelectMember> & ent);

		/****** StepElement_VolumeElementPurpose::CaseNum ******/
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
Recognizes a kind of VolumeElementPurpose select type return 0.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepElement_VolumeElementPurpose::EnumeratedVolumeElementPurpose ******/
		/****** md5 signature: 122e50dda055acb15443287acded36cf ******/
		%feature("compactdefaultargs") EnumeratedVolumeElementPurpose;
		%feature("autodoc", "Return
-------
StepElement_EnumeratedVolumeElementPurpose

Description
-----------
Returns Value as EnumeratedVolumeElementPurpose (or Null if another type).
") EnumeratedVolumeElementPurpose;
		StepElement_EnumeratedVolumeElementPurpose EnumeratedVolumeElementPurpose();

		/****** StepElement_VolumeElementPurpose::NewMember ******/
		/****** md5 signature: 4dce57062553ca704dad3d58f4286daa ******/
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", "Return
-------
opencascade::handle<StepData_SelectMember>

Description
-----------
Returns a new select member the type VolumeElementPurposeMember.
") NewMember;
		opencascade::handle<StepData_SelectMember> NewMember();

		/****** StepElement_VolumeElementPurpose::SetApplicationDefinedElementPurpose ******/
		/****** md5 signature: d492d8d068b95f939b146ce83ba4dd81 ******/
		%feature("compactdefaultargs") SetApplicationDefinedElementPurpose;
		%feature("autodoc", "
Parameters
----------
aVal: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set Value for ApplicationDefinedElementPurpose.
") SetApplicationDefinedElementPurpose;
		void SetApplicationDefinedElementPurpose(const opencascade::handle<TCollection_HAsciiString> & aVal);

		/****** StepElement_VolumeElementPurpose::SetEnumeratedVolumeElementPurpose ******/
		/****** md5 signature: d1c9f18f950ffbc85bfe7d7078a6fae4 ******/
		%feature("compactdefaultargs") SetEnumeratedVolumeElementPurpose;
		%feature("autodoc", "
Parameters
----------
aVal: StepElement_EnumeratedVolumeElementPurpose

Return
-------
None

Description
-----------
Set Value for EnumeratedVolumeElementPurpose.
") SetEnumeratedVolumeElementPurpose;
		void SetEnumeratedVolumeElementPurpose(const StepElement_EnumeratedVolumeElementPurpose aVal);

};


%extend StepElement_VolumeElementPurpose {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class StepElement_VolumeElementPurposeMember *
***********************************************/
class StepElement_VolumeElementPurposeMember : public StepData_SelectNamed {
	public:
		/****** StepElement_VolumeElementPurposeMember::StepElement_VolumeElementPurposeMember ******/
		/****** md5 signature: b8e2406754f7cfcd0795197bf7ec79fb ******/
		%feature("compactdefaultargs") StepElement_VolumeElementPurposeMember;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepElement_VolumeElementPurposeMember;
		 StepElement_VolumeElementPurposeMember();

		/****** StepElement_VolumeElementPurposeMember::HasName ******/
		/****** md5 signature: 0fcc7580a7b0aa7df9ee626d148cd8f4 ******/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if has name.
") HasName;
		bool HasName();

		/****** StepElement_VolumeElementPurposeMember::Matches ******/
		/****** md5 signature: 5669ec2104723ad7c0a5d6d02fd217ed ******/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
bool

Description
-----------
Tells if the name of a SelectMember matches a given one;.
") Matches;
		bool Matches(const char * const name);

		/****** StepElement_VolumeElementPurposeMember::Name ******/
		/****** md5 signature: f81f5718972ea56a52cc674874d73fa6 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
char *

Description
-----------
Returns set name.
") Name;
		const char * Name();

		/****** StepElement_VolumeElementPurposeMember::SetName ******/
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
Set name.
") SetName;
		bool SetName(const char * const name);

};


%make_alias(StepElement_VolumeElementPurposeMember)

%extend StepElement_VolumeElementPurposeMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class StepElement_Curve3dElementDescriptor *
*********************************************/
class StepElement_Curve3dElementDescriptor : public StepElement_ElementDescriptor {
	public:
		/****** StepElement_Curve3dElementDescriptor::StepElement_Curve3dElementDescriptor ******/
		/****** md5 signature: 9e44c235a5082b53d6ebd6a02e3fcf06 ******/
		%feature("compactdefaultargs") StepElement_Curve3dElementDescriptor;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepElement_Curve3dElementDescriptor;
		 StepElement_Curve3dElementDescriptor();

		/****** StepElement_Curve3dElementDescriptor::Init ******/
		/****** md5 signature: 9d498840eab304f8e2c61598ead5b68d ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aElementDescriptor_TopologyOrder: StepElement_ElementOrder
aElementDescriptor_Description: TCollection_HAsciiString
aPurpose: NCollection_HArray1<

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const StepElement_ElementOrder aElementDescriptor_TopologyOrder, const opencascade::handle<TCollection_HAsciiString> & aElementDescriptor_Description, const opencascade::handle<NCollection_HArray1<opencascade::handle<NCollection_HSequence<opencascade::handle<StepElement_CurveElementPurposeMember>> >> > & aPurpose);

		/****** StepElement_Curve3dElementDescriptor::Purpose ******/
		/****** md5 signature: 3e4d4ce8876562ecb3ee67a63f485829 ******/
		%feature("compactdefaultargs") Purpose;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<opencascade::handle<NCollection_HSequence<opencascade::handle<StepElement_CurveElementPurposeMember>>>>>

Description
-----------
Returns field Purpose.
") Purpose;
		opencascade::handle<NCollection_HArray1<opencascade::handle<NCollection_HSequence<opencascade::handle<StepElement_CurveElementPurposeMember>>>>> Purpose();

		/****** StepElement_Curve3dElementDescriptor::SetPurpose ******/
		/****** md5 signature: 50699e638f75d40e3fc2b88de601d689 ******/
		%feature("compactdefaultargs") SetPurpose;
		%feature("autodoc", "
Parameters
----------
Purpose: NCollection_HArray1<

Return
-------
None

Description
-----------
Set field Purpose.
") SetPurpose;
		void SetPurpose(const opencascade::handle<NCollection_HArray1<opencascade::handle<NCollection_HSequence<opencascade::handle<StepElement_CurveElementPurposeMember>> >> > & Purpose);

};


%make_alias(StepElement_Curve3dElementDescriptor)

%extend StepElement_Curve3dElementDescriptor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************************
* class StepElement_CurveElementSectionDerivedDefinitions *
**********************************************************/
class StepElement_CurveElementSectionDerivedDefinitions : public StepElement_CurveElementSectionDefinition {
	public:
		/****** StepElement_CurveElementSectionDerivedDefinitions::StepElement_CurveElementSectionDerivedDefinitions ******/
		/****** md5 signature: baf807b35b9a7d63ac6879d400cd3764 ******/
		%feature("compactdefaultargs") StepElement_CurveElementSectionDerivedDefinitions;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepElement_CurveElementSectionDerivedDefinitions;
		 StepElement_CurveElementSectionDerivedDefinitions();

		/****** StepElement_CurveElementSectionDerivedDefinitions::CrossSectionalArea ******/
		/****** md5 signature: b8da0cf30ea1fa81ca00a895b9628187 ******/
		%feature("compactdefaultargs") CrossSectionalArea;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field CrossSectionalArea.
") CrossSectionalArea;
		double CrossSectionalArea();

		/****** StepElement_CurveElementSectionDerivedDefinitions::Init ******/
		/****** md5 signature: a131efdc5d6a8a371c304a6f6678bab3 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aCurveElementSectionDefinition_Description: TCollection_HAsciiString
aCurveElementSectionDefinition_SectionAngle: double
aCrossSectionalArea: double
aShearArea: NCollection_HArray1<StepElement_MeasureOrUnspecifiedValue
aSecondMomentOfArea: TColStd_HArray1OfReal
aTorsionalConstant: double
aWarpingConstant: StepElement_MeasureOrUnspecifiedValue
aLocationOfCentroid: NCollection_HArray1<StepElement_MeasureOrUnspecifiedValue
aLocationOfShearCentre: NCollection_HArray1<StepElement_MeasureOrUnspecifiedValue
aLocationOfNonStructuralMass: NCollection_HArray1<StepElement_MeasureOrUnspecifiedValue
aNonStructuralMass: StepElement_MeasureOrUnspecifiedValue
aPolarMoment: StepElement_MeasureOrUnspecifiedValue

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aCurveElementSectionDefinition_Description, const double aCurveElementSectionDefinition_SectionAngle, const double aCrossSectionalArea, const opencascade::handle<NCollection_HArray1<StepElement_MeasureOrUnspecifiedValue>> & aShearArea, const opencascade::handle<TColStd_HArray1OfReal> & aSecondMomentOfArea, const double aTorsionalConstant, const StepElement_MeasureOrUnspecifiedValue & aWarpingConstant, const opencascade::handle<NCollection_HArray1<StepElement_MeasureOrUnspecifiedValue>> & aLocationOfCentroid, const opencascade::handle<NCollection_HArray1<StepElement_MeasureOrUnspecifiedValue>> & aLocationOfShearCentre, const opencascade::handle<NCollection_HArray1<StepElement_MeasureOrUnspecifiedValue>> & aLocationOfNonStructuralMass, const StepElement_MeasureOrUnspecifiedValue & aNonStructuralMass, const StepElement_MeasureOrUnspecifiedValue & aPolarMoment);

		/****** StepElement_CurveElementSectionDerivedDefinitions::LocationOfCentroid ******/
		/****** md5 signature: c0be4b35f185d8c76479f701184f9d37 ******/
		%feature("compactdefaultargs") LocationOfCentroid;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<StepElement_MeasureOrUnspecifiedValue>>

Description
-----------
Returns field LocationOfCentroid.
") LocationOfCentroid;
		opencascade::handle<NCollection_HArray1<StepElement_MeasureOrUnspecifiedValue>> LocationOfCentroid();

		/****** StepElement_CurveElementSectionDerivedDefinitions::LocationOfNonStructuralMass ******/
		/****** md5 signature: 60d577c419065c5843725f36da2cf0da ******/
		%feature("compactdefaultargs") LocationOfNonStructuralMass;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<StepElement_MeasureOrUnspecifiedValue>>

Description
-----------
Returns field LocationOfNonStructuralMass.
") LocationOfNonStructuralMass;
		opencascade::handle<NCollection_HArray1<StepElement_MeasureOrUnspecifiedValue>> LocationOfNonStructuralMass();

		/****** StepElement_CurveElementSectionDerivedDefinitions::LocationOfShearCentre ******/
		/****** md5 signature: 7dc095e44144f284319c0201a6fcb826 ******/
		%feature("compactdefaultargs") LocationOfShearCentre;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<StepElement_MeasureOrUnspecifiedValue>>

Description
-----------
Returns field LocationOfShearCentre.
") LocationOfShearCentre;
		opencascade::handle<NCollection_HArray1<StepElement_MeasureOrUnspecifiedValue>> LocationOfShearCentre();

		/****** StepElement_CurveElementSectionDerivedDefinitions::NonStructuralMass ******/
		/****** md5 signature: 436bf6f6d969edecc7164d2766614e71 ******/
		%feature("compactdefaultargs") NonStructuralMass;
		%feature("autodoc", "Return
-------
StepElement_MeasureOrUnspecifiedValue

Description
-----------
Returns field NonStructuralMass.
") NonStructuralMass;
		StepElement_MeasureOrUnspecifiedValue NonStructuralMass();

		/****** StepElement_CurveElementSectionDerivedDefinitions::PolarMoment ******/
		/****** md5 signature: 0bba9dfa7ecffce0c53f92a3d3724ccb ******/
		%feature("compactdefaultargs") PolarMoment;
		%feature("autodoc", "Return
-------
StepElement_MeasureOrUnspecifiedValue

Description
-----------
Returns field PolarMoment.
") PolarMoment;
		StepElement_MeasureOrUnspecifiedValue PolarMoment();

		/****** StepElement_CurveElementSectionDerivedDefinitions::SecondMomentOfArea ******/
		/****** md5 signature: bfff03b16f68f1a66e54959ba573ecd6 ******/
		%feature("compactdefaultargs") SecondMomentOfArea;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
Returns field SecondMomentOfArea.
") SecondMomentOfArea;
		opencascade::handle<TColStd_HArray1OfReal> SecondMomentOfArea();

		/****** StepElement_CurveElementSectionDerivedDefinitions::SetCrossSectionalArea ******/
		/****** md5 signature: b129bd2287273886308f4874c1a4b8ba ******/
		%feature("compactdefaultargs") SetCrossSectionalArea;
		%feature("autodoc", "
Parameters
----------
CrossSectionalArea: double

Return
-------
None

Description
-----------
Set field CrossSectionalArea.
") SetCrossSectionalArea;
		void SetCrossSectionalArea(const double CrossSectionalArea);

		/****** StepElement_CurveElementSectionDerivedDefinitions::SetLocationOfCentroid ******/
		/****** md5 signature: b8c940eefdc2158350875e1d99d9851c ******/
		%feature("compactdefaultargs") SetLocationOfCentroid;
		%feature("autodoc", "
Parameters
----------
LocationOfCentroid: NCollection_HArray1<StepElement_MeasureOrUnspecifiedValue

Return
-------
None

Description
-----------
Set field LocationOfCentroid.
") SetLocationOfCentroid;
		void SetLocationOfCentroid(const opencascade::handle<NCollection_HArray1<StepElement_MeasureOrUnspecifiedValue>> & LocationOfCentroid);

		/****** StepElement_CurveElementSectionDerivedDefinitions::SetLocationOfNonStructuralMass ******/
		/****** md5 signature: a1ad3b7139d3cbe077ca912e03858527 ******/
		%feature("compactdefaultargs") SetLocationOfNonStructuralMass;
		%feature("autodoc", "
Parameters
----------
LocationOfNonStructuralMass: NCollection_HArray1<StepElement_MeasureOrUnspecifiedValue

Return
-------
None

Description
-----------
Set field LocationOfNonStructuralMass.
") SetLocationOfNonStructuralMass;
		void SetLocationOfNonStructuralMass(const opencascade::handle<NCollection_HArray1<StepElement_MeasureOrUnspecifiedValue>> & LocationOfNonStructuralMass);

		/****** StepElement_CurveElementSectionDerivedDefinitions::SetLocationOfShearCentre ******/
		/****** md5 signature: a4edd58ca40df1c4ea0168c7d7b649c2 ******/
		%feature("compactdefaultargs") SetLocationOfShearCentre;
		%feature("autodoc", "
Parameters
----------
LocationOfShearCentre: NCollection_HArray1<StepElement_MeasureOrUnspecifiedValue

Return
-------
None

Description
-----------
Set field LocationOfShearCentre.
") SetLocationOfShearCentre;
		void SetLocationOfShearCentre(const opencascade::handle<NCollection_HArray1<StepElement_MeasureOrUnspecifiedValue>> & LocationOfShearCentre);

		/****** StepElement_CurveElementSectionDerivedDefinitions::SetNonStructuralMass ******/
		/****** md5 signature: 2f170bd9d8f328de42de37ef7e35b20b ******/
		%feature("compactdefaultargs") SetNonStructuralMass;
		%feature("autodoc", "
Parameters
----------
NonStructuralMass: StepElement_MeasureOrUnspecifiedValue

Return
-------
None

Description
-----------
Set field NonStructuralMass.
") SetNonStructuralMass;
		void SetNonStructuralMass(const StepElement_MeasureOrUnspecifiedValue & NonStructuralMass);

		/****** StepElement_CurveElementSectionDerivedDefinitions::SetPolarMoment ******/
		/****** md5 signature: 0fe3795d054d0c13b371423820bb5402 ******/
		%feature("compactdefaultargs") SetPolarMoment;
		%feature("autodoc", "
Parameters
----------
PolarMoment: StepElement_MeasureOrUnspecifiedValue

Return
-------
None

Description
-----------
Set field PolarMoment.
") SetPolarMoment;
		void SetPolarMoment(const StepElement_MeasureOrUnspecifiedValue & PolarMoment);

		/****** StepElement_CurveElementSectionDerivedDefinitions::SetSecondMomentOfArea ******/
		/****** md5 signature: 485f68ba41008026a1c4d342125afaa3 ******/
		%feature("compactdefaultargs") SetSecondMomentOfArea;
		%feature("autodoc", "
Parameters
----------
SecondMomentOfArea: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
Set field SecondMomentOfArea.
") SetSecondMomentOfArea;
		void SetSecondMomentOfArea(const opencascade::handle<TColStd_HArray1OfReal> & SecondMomentOfArea);

		/****** StepElement_CurveElementSectionDerivedDefinitions::SetShearArea ******/
		/****** md5 signature: a546f40e875bec2d57bcf8d002170edd ******/
		%feature("compactdefaultargs") SetShearArea;
		%feature("autodoc", "
Parameters
----------
ShearArea: NCollection_HArray1<StepElement_MeasureOrUnspecifiedValue

Return
-------
None

Description
-----------
Set field ShearArea.
") SetShearArea;
		void SetShearArea(const opencascade::handle<NCollection_HArray1<StepElement_MeasureOrUnspecifiedValue>> & ShearArea);

		/****** StepElement_CurveElementSectionDerivedDefinitions::SetTorsionalConstant ******/
		/****** md5 signature: 2fe004cb13acc8c1ee5cb6f14db25b2c ******/
		%feature("compactdefaultargs") SetTorsionalConstant;
		%feature("autodoc", "
Parameters
----------
TorsionalConstant: double

Return
-------
None

Description
-----------
Set field TorsionalConstant.
") SetTorsionalConstant;
		void SetTorsionalConstant(const double TorsionalConstant);

		/****** StepElement_CurveElementSectionDerivedDefinitions::SetWarpingConstant ******/
		/****** md5 signature: 78a8252027e7cf5837c7f54960fe9061 ******/
		%feature("compactdefaultargs") SetWarpingConstant;
		%feature("autodoc", "
Parameters
----------
WarpingConstant: StepElement_MeasureOrUnspecifiedValue

Return
-------
None

Description
-----------
Set field WarpingConstant.
") SetWarpingConstant;
		void SetWarpingConstant(const StepElement_MeasureOrUnspecifiedValue & WarpingConstant);

		/****** StepElement_CurveElementSectionDerivedDefinitions::ShearArea ******/
		/****** md5 signature: df9a22ea01209f8a511c93eaa8e10907 ******/
		%feature("compactdefaultargs") ShearArea;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<StepElement_MeasureOrUnspecifiedValue>>

Description
-----------
Returns field ShearArea.
") ShearArea;
		opencascade::handle<NCollection_HArray1<StepElement_MeasureOrUnspecifiedValue>> ShearArea();

		/****** StepElement_CurveElementSectionDerivedDefinitions::TorsionalConstant ******/
		/****** md5 signature: 0158ab7f15145f105a890907aa2c58e4 ******/
		%feature("compactdefaultargs") TorsionalConstant;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field TorsionalConstant.
") TorsionalConstant;
		double TorsionalConstant();

		/****** StepElement_CurveElementSectionDerivedDefinitions::WarpingConstant ******/
		/****** md5 signature: 4b51d9b3dc33bb3d393d0e927f1aff85 ******/
		%feature("compactdefaultargs") WarpingConstant;
		%feature("autodoc", "Return
-------
StepElement_MeasureOrUnspecifiedValue

Description
-----------
Returns field WarpingConstant.
") WarpingConstant;
		StepElement_MeasureOrUnspecifiedValue WarpingConstant();

};


%make_alias(StepElement_CurveElementSectionDerivedDefinitions)

%extend StepElement_CurveElementSectionDerivedDefinitions {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class StepElement_Surface3dElementDescriptor *
***********************************************/
class StepElement_Surface3dElementDescriptor : public StepElement_ElementDescriptor {
	public:
		/****** StepElement_Surface3dElementDescriptor::StepElement_Surface3dElementDescriptor ******/
		/****** md5 signature: edb1b1f637fec1bdb387b41b3589ca8e ******/
		%feature("compactdefaultargs") StepElement_Surface3dElementDescriptor;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepElement_Surface3dElementDescriptor;
		 StepElement_Surface3dElementDescriptor();

		/****** StepElement_Surface3dElementDescriptor::Init ******/
		/****** md5 signature: 40f74617ecf46392e28d6e643c50febe ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aElementDescriptor_TopologyOrder: StepElement_ElementOrder
aElementDescriptor_Description: TCollection_HAsciiString
aPurpose: NCollection_HArray1<
aShape: StepElement_Element2dShape

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const StepElement_ElementOrder aElementDescriptor_TopologyOrder, const opencascade::handle<TCollection_HAsciiString> & aElementDescriptor_Description, const opencascade::handle<NCollection_HArray1<opencascade::handle<NCollection_HSequence<opencascade::handle<StepElement_SurfaceElementPurposeMember>> >> > & aPurpose, const StepElement_Element2dShape aShape);

		/****** StepElement_Surface3dElementDescriptor::Purpose ******/
		/****** md5 signature: c6bb00037200a57396de5565e91cbed0 ******/
		%feature("compactdefaultargs") Purpose;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<opencascade::handle<NCollection_HSequence<opencascade::handle<StepElement_SurfaceElementPurposeMember>>>>>

Description
-----------
Returns field Purpose.
") Purpose;
		opencascade::handle<NCollection_HArray1<opencascade::handle<NCollection_HSequence<opencascade::handle<StepElement_SurfaceElementPurposeMember>>>>> Purpose();

		/****** StepElement_Surface3dElementDescriptor::SetPurpose ******/
		/****** md5 signature: c8c14da144eccb16585ecbc31729306f ******/
		%feature("compactdefaultargs") SetPurpose;
		%feature("autodoc", "
Parameters
----------
Purpose: NCollection_HArray1<

Return
-------
None

Description
-----------
Set field Purpose.
") SetPurpose;
		void SetPurpose(const opencascade::handle<NCollection_HArray1<opencascade::handle<NCollection_HSequence<opencascade::handle<StepElement_SurfaceElementPurposeMember>> >> > & Purpose);

		/****** StepElement_Surface3dElementDescriptor::SetShape ******/
		/****** md5 signature: db12ec83382603e29422b58584b1e14d ******/
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "
Parameters
----------
Shape: StepElement_Element2dShape

Return
-------
None

Description
-----------
Set field Shape.
") SetShape;
		void SetShape(const StepElement_Element2dShape Shape);

		/****** StepElement_Surface3dElementDescriptor::Shape ******/
		/****** md5 signature: 09f72024414df5fac3dce89a57082809 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
StepElement_Element2dShape

Description
-----------
Returns field Shape.
") Shape;
		StepElement_Element2dShape Shape();

};


%make_alias(StepElement_Surface3dElementDescriptor)

%extend StepElement_Surface3dElementDescriptor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class StepElement_SurfaceSectionFieldConstant *
************************************************/
class StepElement_SurfaceSectionFieldConstant : public StepElement_SurfaceSectionField {
	public:
		/****** StepElement_SurfaceSectionFieldConstant::StepElement_SurfaceSectionFieldConstant ******/
		/****** md5 signature: a62a586adc83d5727369f3f6d8cc75bb ******/
		%feature("compactdefaultargs") StepElement_SurfaceSectionFieldConstant;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepElement_SurfaceSectionFieldConstant;
		 StepElement_SurfaceSectionFieldConstant();

		/****** StepElement_SurfaceSectionFieldConstant::Definition ******/
		/****** md5 signature: 19d87fb03b026a9cea42ec31c9a40c62 ******/
		%feature("compactdefaultargs") Definition;
		%feature("autodoc", "Return
-------
opencascade::handle<StepElement_SurfaceSection>

Description
-----------
Returns field Definition.
") Definition;
		opencascade::handle<StepElement_SurfaceSection> Definition();

		/****** StepElement_SurfaceSectionFieldConstant::Init ******/
		/****** md5 signature: c89ef10596bef59a827b5e9ccf55aa79 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aDefinition: StepElement_SurfaceSection

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<StepElement_SurfaceSection> & aDefinition);

		/****** StepElement_SurfaceSectionFieldConstant::SetDefinition ******/
		/****** md5 signature: 34dce54504bb22d6ea9a0795cf9eade2 ******/
		%feature("compactdefaultargs") SetDefinition;
		%feature("autodoc", "
Parameters
----------
Definition: StepElement_SurfaceSection

Return
-------
None

Description
-----------
Set field Definition.
") SetDefinition;
		void SetDefinition(const opencascade::handle<StepElement_SurfaceSection> & Definition);

};


%make_alias(StepElement_SurfaceSectionFieldConstant)

%extend StepElement_SurfaceSectionFieldConstant {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class StepElement_SurfaceSectionFieldVarying *
***********************************************/
class StepElement_SurfaceSectionFieldVarying : public StepElement_SurfaceSectionField {
	public:
		/****** StepElement_SurfaceSectionFieldVarying::StepElement_SurfaceSectionFieldVarying ******/
		/****** md5 signature: f1f3bead4f4a6b89fb745f64b2acf4eb ******/
		%feature("compactdefaultargs") StepElement_SurfaceSectionFieldVarying;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepElement_SurfaceSectionFieldVarying;
		 StepElement_SurfaceSectionFieldVarying();

		/****** StepElement_SurfaceSectionFieldVarying::AdditionalNodeValues ******/
		/****** md5 signature: 2a3b66fb0541a4aab17d40a9bf56a9cf ******/
		%feature("compactdefaultargs") AdditionalNodeValues;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns field AdditionalNodeValues.
") AdditionalNodeValues;
		bool AdditionalNodeValues();

		/****** StepElement_SurfaceSectionFieldVarying::Definitions ******/
		/****** md5 signature: 6496c8bf3bbae0137e154c9024bfaf6c ******/
		%feature("compactdefaultargs") Definitions;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<opencascade::handle<StepElement_SurfaceSection>>>

Description
-----------
Returns field Definitions.
") Definitions;
		opencascade::handle<NCollection_HArray1<opencascade::handle<StepElement_SurfaceSection>>> Definitions();

		/****** StepElement_SurfaceSectionFieldVarying::Init ******/
		/****** md5 signature: d58aa2e181469cb029529612705355bc ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aDefinitions: NCollection_HArray1<
aAdditionalNodeValues: bool

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<NCollection_HArray1<opencascade::handle<StepElement_SurfaceSection>> > & aDefinitions, const bool aAdditionalNodeValues);

		/****** StepElement_SurfaceSectionFieldVarying::SetAdditionalNodeValues ******/
		/****** md5 signature: d8582582e643f986fe4b9679e61231a6 ******/
		%feature("compactdefaultargs") SetAdditionalNodeValues;
		%feature("autodoc", "
Parameters
----------
AdditionalNodeValues: bool

Return
-------
None

Description
-----------
Set field AdditionalNodeValues.
") SetAdditionalNodeValues;
		void SetAdditionalNodeValues(const bool AdditionalNodeValues);

		/****** StepElement_SurfaceSectionFieldVarying::SetDefinitions ******/
		/****** md5 signature: a7537211e35260406b79cf6ff8425044 ******/
		%feature("compactdefaultargs") SetDefinitions;
		%feature("autodoc", "
Parameters
----------
Definitions: NCollection_HArray1<

Return
-------
None

Description
-----------
Set field Definitions.
") SetDefinitions;
		void SetDefinitions(const opencascade::handle<NCollection_HArray1<opencascade::handle<StepElement_SurfaceSection>> > & Definitions);

};


%make_alias(StepElement_SurfaceSectionFieldVarying)

%extend StepElement_SurfaceSectionFieldVarying {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class StepElement_UniformSurfaceSection *
******************************************/
class StepElement_UniformSurfaceSection : public StepElement_SurfaceSection {
	public:
		/****** StepElement_UniformSurfaceSection::StepElement_UniformSurfaceSection ******/
		/****** md5 signature: 75517b06d51c689748c1bc64e3460462 ******/
		%feature("compactdefaultargs") StepElement_UniformSurfaceSection;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepElement_UniformSurfaceSection;
		 StepElement_UniformSurfaceSection();

		/****** StepElement_UniformSurfaceSection::BendingThickness ******/
		/****** md5 signature: f253410999df80c3d5927466a577b446 ******/
		%feature("compactdefaultargs") BendingThickness;
		%feature("autodoc", "Return
-------
StepElement_MeasureOrUnspecifiedValue

Description
-----------
Returns field BendingThickness.
") BendingThickness;
		StepElement_MeasureOrUnspecifiedValue BendingThickness();

		/****** StepElement_UniformSurfaceSection::Init ******/
		/****** md5 signature: 8bbb4b56a175eefaff5451092683f7e3 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aSurfaceSection_Offset: StepElement_MeasureOrUnspecifiedValue
aSurfaceSection_NonStructuralMass: StepElement_MeasureOrUnspecifiedValue
aSurfaceSection_NonStructuralMassOffset: StepElement_MeasureOrUnspecifiedValue
aThickness: double
aBendingThickness: StepElement_MeasureOrUnspecifiedValue
aShearThickness: StepElement_MeasureOrUnspecifiedValue

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const StepElement_MeasureOrUnspecifiedValue & aSurfaceSection_Offset, const StepElement_MeasureOrUnspecifiedValue & aSurfaceSection_NonStructuralMass, const StepElement_MeasureOrUnspecifiedValue & aSurfaceSection_NonStructuralMassOffset, const double aThickness, const StepElement_MeasureOrUnspecifiedValue & aBendingThickness, const StepElement_MeasureOrUnspecifiedValue & aShearThickness);

		/****** StepElement_UniformSurfaceSection::SetBendingThickness ******/
		/****** md5 signature: dc2faf138ce9c5b540eb84ce1935c3b7 ******/
		%feature("compactdefaultargs") SetBendingThickness;
		%feature("autodoc", "
Parameters
----------
BendingThickness: StepElement_MeasureOrUnspecifiedValue

Return
-------
None

Description
-----------
Set field BendingThickness.
") SetBendingThickness;
		void SetBendingThickness(const StepElement_MeasureOrUnspecifiedValue & BendingThickness);

		/****** StepElement_UniformSurfaceSection::SetShearThickness ******/
		/****** md5 signature: fee97e3fce2d7b1704efa897fb913887 ******/
		%feature("compactdefaultargs") SetShearThickness;
		%feature("autodoc", "
Parameters
----------
ShearThickness: StepElement_MeasureOrUnspecifiedValue

Return
-------
None

Description
-----------
Set field ShearThickness.
") SetShearThickness;
		void SetShearThickness(const StepElement_MeasureOrUnspecifiedValue & ShearThickness);

		/****** StepElement_UniformSurfaceSection::SetThickness ******/
		/****** md5 signature: e7e4177245a4ad0b8f7bb96ce842c8f1 ******/
		%feature("compactdefaultargs") SetThickness;
		%feature("autodoc", "
Parameters
----------
Thickness: double

Return
-------
None

Description
-----------
Set field Thickness.
") SetThickness;
		void SetThickness(const double Thickness);

		/****** StepElement_UniformSurfaceSection::ShearThickness ******/
		/****** md5 signature: b81478ee35263bdf7f0647396a897fe1 ******/
		%feature("compactdefaultargs") ShearThickness;
		%feature("autodoc", "Return
-------
StepElement_MeasureOrUnspecifiedValue

Description
-----------
Returns field ShearThickness.
") ShearThickness;
		StepElement_MeasureOrUnspecifiedValue ShearThickness();

		/****** StepElement_UniformSurfaceSection::Thickness ******/
		/****** md5 signature: 0e26793c476f387d988999ea30d268f4 ******/
		%feature("compactdefaultargs") Thickness;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field Thickness.
") Thickness;
		double Thickness();

};


%make_alias(StepElement_UniformSurfaceSection)

%extend StepElement_UniformSurfaceSection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class StepElement_Volume3dElementDescriptor *
**********************************************/
class StepElement_Volume3dElementDescriptor : public StepElement_ElementDescriptor {
	public:
		/****** StepElement_Volume3dElementDescriptor::StepElement_Volume3dElementDescriptor ******/
		/****** md5 signature: a7a81e049ff38a2c01cba3f4a902be78 ******/
		%feature("compactdefaultargs") StepElement_Volume3dElementDescriptor;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepElement_Volume3dElementDescriptor;
		 StepElement_Volume3dElementDescriptor();

		/****** StepElement_Volume3dElementDescriptor::Init ******/
		/****** md5 signature: d4e49804a4811ad7c00b148299c806ac ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aElementDescriptor_TopologyOrder: StepElement_ElementOrder
aElementDescriptor_Description: TCollection_HAsciiString
aPurpose: NCollection_HArray1<
aShape: StepElement_Volume3dElementShape

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const StepElement_ElementOrder aElementDescriptor_TopologyOrder, const opencascade::handle<TCollection_HAsciiString> & aElementDescriptor_Description, const opencascade::handle<NCollection_HArray1<opencascade::handle<StepElement_VolumeElementPurposeMember>> > & aPurpose, const StepElement_Volume3dElementShape aShape);

		/****** StepElement_Volume3dElementDescriptor::Purpose ******/
		/****** md5 signature: eb994837b8e71b0083b202efc820952c ******/
		%feature("compactdefaultargs") Purpose;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<opencascade::handle<StepElement_VolumeElementPurposeMember>>>

Description
-----------
Returns field Purpose.
") Purpose;
		opencascade::handle<NCollection_HArray1<opencascade::handle<StepElement_VolumeElementPurposeMember>>> Purpose();

		/****** StepElement_Volume3dElementDescriptor::SetPurpose ******/
		/****** md5 signature: 1b830fd29219906e572d520bd32b9265 ******/
		%feature("compactdefaultargs") SetPurpose;
		%feature("autodoc", "
Parameters
----------
Purpose: NCollection_HArray1<

Return
-------
None

Description
-----------
Set field Purpose.
") SetPurpose;
		void SetPurpose(const opencascade::handle<NCollection_HArray1<opencascade::handle<StepElement_VolumeElementPurposeMember>> > & Purpose);

		/****** StepElement_Volume3dElementDescriptor::SetShape ******/
		/****** md5 signature: 26dc4c77406a82a4a6edd356c81140a2 ******/
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "
Parameters
----------
Shape: StepElement_Volume3dElementShape

Return
-------
None

Description
-----------
Set field Shape.
") SetShape;
		void SetShape(const StepElement_Volume3dElementShape Shape);

		/****** StepElement_Volume3dElementDescriptor::Shape ******/
		/****** md5 signature: 63bd5bdf950cd1412d19119beeba48f0 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
StepElement_Volume3dElementShape

Description
-----------
Returns field Shape.
") Shape;
		StepElement_Volume3dElementShape Shape();

};


%make_alias(StepElement_Volume3dElementDescriptor)

%extend StepElement_Volume3dElementDescriptor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */

class StepElement_HArray1OfCurveElementEndReleasePacket : public NCollection_Array1<opencascade::handle<StepElement_CurveElementEndReleasePacket>>, public Standard_Transient {
  public:
    StepElement_HArray1OfCurveElementEndReleasePacket(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepElement_HArray1OfCurveElementEndReleasePacket(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<opencascade::handle<StepElement_CurveElementEndReleasePacket>>::value_type& theValue);
    StepElement_HArray1OfCurveElementEndReleasePacket(const NCollection_Array1<opencascade::handle<StepElement_CurveElementEndReleasePacket>>& theOther);
    const NCollection_Array1<opencascade::handle<StepElement_CurveElementEndReleasePacket>>& Array1();
    NCollection_Array1<opencascade::handle<StepElement_CurveElementEndReleasePacket>>& ChangeArray1();
};
%make_alias(StepElement_HArray1OfCurveElementEndReleasePacket)


class StepElement_HArray1OfCurveElementSectionDefinition : public NCollection_Array1<opencascade::handle<StepElement_CurveElementSectionDefinition>>, public Standard_Transient {
  public:
    StepElement_HArray1OfCurveElementSectionDefinition(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepElement_HArray1OfCurveElementSectionDefinition(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<opencascade::handle<StepElement_CurveElementSectionDefinition>>::value_type& theValue);
    StepElement_HArray1OfCurveElementSectionDefinition(const NCollection_Array1<opencascade::handle<StepElement_CurveElementSectionDefinition>>& theOther);
    const NCollection_Array1<opencascade::handle<StepElement_CurveElementSectionDefinition>>& Array1();
    NCollection_Array1<opencascade::handle<StepElement_CurveElementSectionDefinition>>& ChangeArray1();
};
%make_alias(StepElement_HArray1OfCurveElementSectionDefinition)


class StepElement_HArray1OfMeasureOrUnspecifiedValue : public NCollection_Array1<StepElement_MeasureOrUnspecifiedValue>, public Standard_Transient {
  public:
    StepElement_HArray1OfMeasureOrUnspecifiedValue(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepElement_HArray1OfMeasureOrUnspecifiedValue(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<StepElement_MeasureOrUnspecifiedValue>::value_type& theValue);
    StepElement_HArray1OfMeasureOrUnspecifiedValue(const NCollection_Array1<StepElement_MeasureOrUnspecifiedValue>& theOther);
    const NCollection_Array1<StepElement_MeasureOrUnspecifiedValue>& Array1();
    NCollection_Array1<StepElement_MeasureOrUnspecifiedValue>& ChangeArray1();
};
%make_alias(StepElement_HArray1OfMeasureOrUnspecifiedValue)


class StepElement_HArray1OfSurfaceSection : public NCollection_Array1<opencascade::handle<StepElement_SurfaceSection>>, public Standard_Transient {
  public:
    StepElement_HArray1OfSurfaceSection(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepElement_HArray1OfSurfaceSection(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<opencascade::handle<StepElement_SurfaceSection>>::value_type& theValue);
    StepElement_HArray1OfSurfaceSection(const NCollection_Array1<opencascade::handle<StepElement_SurfaceSection>>& theOther);
    const NCollection_Array1<opencascade::handle<StepElement_SurfaceSection>>& Array1();
    NCollection_Array1<opencascade::handle<StepElement_SurfaceSection>>& ChangeArray1();
};
%make_alias(StepElement_HArray1OfSurfaceSection)


class StepElement_HArray1OfVolumeElementPurpose : public NCollection_Array1<StepElement_VolumeElementPurpose>, public Standard_Transient {
  public:
    StepElement_HArray1OfVolumeElementPurpose(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepElement_HArray1OfVolumeElementPurpose(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<StepElement_VolumeElementPurpose>::value_type& theValue);
    StepElement_HArray1OfVolumeElementPurpose(const NCollection_Array1<StepElement_VolumeElementPurpose>& theOther);
    const NCollection_Array1<StepElement_VolumeElementPurpose>& Array1();
    NCollection_Array1<StepElement_VolumeElementPurpose>& ChangeArray1();
};
%make_alias(StepElement_HArray1OfVolumeElementPurpose)


class StepElement_HArray1OfVolumeElementPurposeMember : public NCollection_Array1<opencascade::handle<StepElement_VolumeElementPurposeMember>>, public Standard_Transient {
  public:
    StepElement_HArray1OfVolumeElementPurposeMember(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepElement_HArray1OfVolumeElementPurposeMember(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<opencascade::handle<StepElement_VolumeElementPurposeMember>>::value_type& theValue);
    StepElement_HArray1OfVolumeElementPurposeMember(const NCollection_Array1<opencascade::handle<StepElement_VolumeElementPurposeMember>>& theOther);
    const NCollection_Array1<opencascade::handle<StepElement_VolumeElementPurposeMember>>& Array1();
    NCollection_Array1<opencascade::handle<StepElement_VolumeElementPurposeMember>>& ChangeArray1();
};
%make_alias(StepElement_HArray1OfVolumeElementPurposeMember)

/* harray2 classes */
class StepElement_HArray2OfCurveElementPurposeMember : public NCollection_Array2<opencascade::handle<StepElement_CurveElementPurposeMember>>, public Standard_Transient {
  public:
    StepElement_HArray2OfCurveElementPurposeMember(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    StepElement_HArray2OfCurveElementPurposeMember(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const NCollection_Array2<opencascade::handle<StepElement_CurveElementPurposeMember>>::value_type& theValue);
    StepElement_HArray2OfCurveElementPurposeMember(const NCollection_Array2<opencascade::handle<StepElement_CurveElementPurposeMember>>& theOther);
    const NCollection_Array2<opencascade::handle<StepElement_CurveElementPurposeMember>>& Array2 ();
    NCollection_Array2<opencascade::handle<StepElement_CurveElementPurposeMember>>& ChangeArray2 (); 
};
%make_alias(StepElement_HArray2OfCurveElementPurposeMember)


class StepElement_HArray2OfSurfaceElementPurpose : public NCollection_Array2<StepElement_SurfaceElementPurpose>, public Standard_Transient {
  public:
    StepElement_HArray2OfSurfaceElementPurpose(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    StepElement_HArray2OfSurfaceElementPurpose(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const NCollection_Array2<StepElement_SurfaceElementPurpose>::value_type& theValue);
    StepElement_HArray2OfSurfaceElementPurpose(const NCollection_Array2<StepElement_SurfaceElementPurpose>& theOther);
    const NCollection_Array2<StepElement_SurfaceElementPurpose>& Array2 ();
    NCollection_Array2<StepElement_SurfaceElementPurpose>& ChangeArray2 (); 
};
%make_alias(StepElement_HArray2OfSurfaceElementPurpose)


class StepElement_HArray2OfSurfaceElementPurposeMember : public NCollection_Array2<opencascade::handle<StepElement_SurfaceElementPurposeMember>>, public Standard_Transient {
  public:
    StepElement_HArray2OfSurfaceElementPurposeMember(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    StepElement_HArray2OfSurfaceElementPurposeMember(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const NCollection_Array2<opencascade::handle<StepElement_SurfaceElementPurposeMember>>::value_type& theValue);
    StepElement_HArray2OfSurfaceElementPurposeMember(const NCollection_Array2<opencascade::handle<StepElement_SurfaceElementPurposeMember>>& theOther);
    const NCollection_Array2<opencascade::handle<StepElement_SurfaceElementPurposeMember>>& Array2 ();
    NCollection_Array2<opencascade::handle<StepElement_SurfaceElementPurposeMember>>& ChangeArray2 (); 
};
%make_alias(StepElement_HArray2OfSurfaceElementPurposeMember)


/* hsequence classes */
class StepElement_HSequenceOfCurveElementPurposeMember : public NCollection_Sequence<opencascade::handle<StepElement_CurveElementPurposeMember>>, public Standard_Transient {
  public:
    StepElement_HSequenceOfCurveElementPurposeMember();
    StepElement_HSequenceOfCurveElementPurposeMember(const NCollection_Sequence<opencascade::handle<StepElement_CurveElementPurposeMember>>& theOther);
    const NCollection_Sequence<opencascade::handle<StepElement_CurveElementPurposeMember>>& Sequence();
    void Append (const NCollection_Sequence<opencascade::handle<StepElement_CurveElementPurposeMember>>::value_type& theItem);
    void Append (NCollection_Sequence<opencascade::handle<StepElement_CurveElementPurposeMember>>& theSequence);
    NCollection_Sequence<opencascade::handle<StepElement_CurveElementPurposeMember>>& ChangeSequence();
};
%make_alias(StepElement_HSequenceOfCurveElementPurposeMember)


class StepElement_HSequenceOfCurveElementSectionDefinition : public NCollection_Sequence<opencascade::handle<StepElement_CurveElementSectionDefinition>>, public Standard_Transient {
  public:
    StepElement_HSequenceOfCurveElementSectionDefinition();
    StepElement_HSequenceOfCurveElementSectionDefinition(const NCollection_Sequence<opencascade::handle<StepElement_CurveElementSectionDefinition>>& theOther);
    const NCollection_Sequence<opencascade::handle<StepElement_CurveElementSectionDefinition>>& Sequence();
    void Append (const NCollection_Sequence<opencascade::handle<StepElement_CurveElementSectionDefinition>>::value_type& theItem);
    void Append (NCollection_Sequence<opencascade::handle<StepElement_CurveElementSectionDefinition>>& theSequence);
    NCollection_Sequence<opencascade::handle<StepElement_CurveElementSectionDefinition>>& ChangeSequence();
};
%make_alias(StepElement_HSequenceOfCurveElementSectionDefinition)


class StepElement_HSequenceOfElementMaterial : public NCollection_Sequence<opencascade::handle<StepElement_ElementMaterial>>, public Standard_Transient {
  public:
    StepElement_HSequenceOfElementMaterial();
    StepElement_HSequenceOfElementMaterial(const NCollection_Sequence<opencascade::handle<StepElement_ElementMaterial>>& theOther);
    const NCollection_Sequence<opencascade::handle<StepElement_ElementMaterial>>& Sequence();
    void Append (const NCollection_Sequence<opencascade::handle<StepElement_ElementMaterial>>::value_type& theItem);
    void Append (NCollection_Sequence<opencascade::handle<StepElement_ElementMaterial>>& theSequence);
    NCollection_Sequence<opencascade::handle<StepElement_ElementMaterial>>& ChangeSequence();
};
%make_alias(StepElement_HSequenceOfElementMaterial)


class StepElement_HSequenceOfSurfaceElementPurposeMember : public NCollection_Sequence<opencascade::handle<StepElement_SurfaceElementPurposeMember>>, public Standard_Transient {
  public:
    StepElement_HSequenceOfSurfaceElementPurposeMember();
    StepElement_HSequenceOfSurfaceElementPurposeMember(const NCollection_Sequence<opencascade::handle<StepElement_SurfaceElementPurposeMember>>& theOther);
    const NCollection_Sequence<opencascade::handle<StepElement_SurfaceElementPurposeMember>>& Sequence();
    void Append (const NCollection_Sequence<opencascade::handle<StepElement_SurfaceElementPurposeMember>>::value_type& theItem);
    void Append (NCollection_Sequence<opencascade::handle<StepElement_SurfaceElementPurposeMember>>& theSequence);
    NCollection_Sequence<opencascade::handle<StepElement_SurfaceElementPurposeMember>>& ChangeSequence();
};
%make_alias(StepElement_HSequenceOfSurfaceElementPurposeMember)


/* class aliases */
%pythoncode {
}
