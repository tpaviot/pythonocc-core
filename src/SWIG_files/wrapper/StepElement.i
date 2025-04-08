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
%define STEPELEMENTDOCSTRING
"StepElement module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_stepelement.html"
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
%wrap_handle(StepElement_HArray1OfCurveElementEndReleasePacket)
%wrap_handle(StepElement_HArray1OfCurveElementSectionDefinition)
%wrap_handle(StepElement_HArray1OfHSequenceOfCurveElementPurposeMember)
%wrap_handle(StepElement_HArray1OfHSequenceOfSurfaceElementPurposeMember)
%wrap_handle(StepElement_HArray1OfMeasureOrUnspecifiedValue)
%wrap_handle(StepElement_HArray1OfSurfaceSection)
%wrap_handle(StepElement_HArray1OfVolumeElementPurpose)
%wrap_handle(StepElement_HArray1OfVolumeElementPurposeMember)
%wrap_handle(StepElement_HArray2OfCurveElementPurposeMember)
%wrap_handle(StepElement_HArray2OfSurfaceElementPurpose)
%wrap_handle(StepElement_HArray2OfSurfaceElementPurposeMember)
%wrap_handle(StepElement_HSequenceOfCurveElementPurposeMember)
%wrap_handle(StepElement_HSequenceOfCurveElementSectionDefinition)
%wrap_handle(StepElement_HSequenceOfElementMaterial)
%wrap_handle(StepElement_HSequenceOfSurfaceElementPurposeMember)
/* end handles declaration */

/* templates */
%template(StepElement_Array1OfCurveElementEndReleasePacket) NCollection_Array1<opencascade::handle<StepElement_CurveElementEndReleasePacket>>;
Array1ExtendIter(opencascade::handle<StepElement_CurveElementEndReleasePacket>)

%template(StepElement_Array1OfCurveElementSectionDefinition) NCollection_Array1<opencascade::handle<StepElement_CurveElementSectionDefinition>>;
Array1ExtendIter(opencascade::handle<StepElement_CurveElementSectionDefinition>)

%template(StepElement_Array1OfHSequenceOfCurveElementPurposeMember) NCollection_Array1<opencascade::handle<StepElement_HSequenceOfCurveElementPurposeMember>>;
Array1ExtendIter(opencascade::handle<StepElement_HSequenceOfCurveElementPurposeMember>)

%template(StepElement_Array1OfHSequenceOfSurfaceElementPurposeMember) NCollection_Array1<opencascade::handle<StepElement_HSequenceOfSurfaceElementPurposeMember>>;
Array1ExtendIter(opencascade::handle<StepElement_HSequenceOfSurfaceElementPurposeMember>)

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
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(StepElement_SequenceOfCurveElementSectionDefinition) NCollection_Sequence<opencascade::handle<StepElement_CurveElementSectionDefinition>>;

%extend NCollection_Sequence<opencascade::handle<StepElement_CurveElementSectionDefinition>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(StepElement_SequenceOfElementMaterial) NCollection_Sequence<opencascade::handle<StepElement_ElementMaterial>>;

%extend NCollection_Sequence<opencascade::handle<StepElement_ElementMaterial>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(StepElement_SequenceOfSurfaceElementPurposeMember) NCollection_Sequence<opencascade::handle<StepElement_SurfaceElementPurposeMember>>;

%extend NCollection_Sequence<opencascade::handle<StepElement_SurfaceElementPurposeMember>> {
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
		/****** md5 signature: e3e8efc9ba7f7efc4d25849ac56e8986 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aReleaseFreedom: StepElement_CurveElementFreedom
aReleaseStiffness: float

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const StepElement_CurveElementFreedom & aReleaseFreedom, const Standard_Real aReleaseStiffness);

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
		/****** md5 signature: a06ea60cfba7e870778d6e7245190bed ******/
		%feature("compactdefaultargs") ReleaseStiffness;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns field ReleaseStiffness.
") ReleaseStiffness;
		Standard_Real ReleaseStiffness();

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
		/****** md5 signature: 0dea1cf3cadb0b86eac6954132eac99a ******/
		%feature("compactdefaultargs") SetReleaseStiffness;
		%feature("autodoc", "
Parameters
----------
ReleaseStiffness: float

Return
-------
None

Description
-----------
Set field ReleaseStiffness.
") SetReleaseStiffness;
		void SetReleaseStiffness(const Standard_Real ReleaseStiffness);

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
		/****** md5 signature: 26af6570a62efb94f2e4c31f1b319112 ******/
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
		virtual Standard_Integer CaseMem(const opencascade::handle<StepData_SelectMember> & ent);

		/****** StepElement_CurveElementFreedom::CaseNum ******/
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
Recognizes a kind of CurveElementFreedom select type return 0.
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

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
		/****** md5 signature: ae7a49ea52744ae449d83e823e9a6da7 ******/
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", "Return
-------
opencascade::handle<StepData_SelectMember>

Description
-----------
Returns a new select member the type CurveElementFreedomMember.
") NewMember;
		virtual opencascade::handle<StepData_SelectMember> NewMember();

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
		/****** md5 signature: c4b2dbd737f3c98314fdb7955ce91c2a ******/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if has name.
") HasName;
		virtual Standard_Boolean HasName();

		/****** StepElement_CurveElementFreedomMember::Matches ******/
		/****** md5 signature: 926675035b73f94f6faae7b81ca23022 ******/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
bool

Description
-----------
Tells if the name of a SelectMember matches a given one;.
") Matches;
		virtual Standard_Boolean Matches(Standard_CString name);

		/****** StepElement_CurveElementFreedomMember::Name ******/
		/****** md5 signature: d654a4ee9a75d24a9c3f33853f908999 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns set name.
") Name;
		virtual Standard_CString Name();

		/****** StepElement_CurveElementFreedomMember::SetName ******/
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
Set name.
") SetName;
		virtual Standard_Boolean SetName(Standard_CString name);

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
		/****** md5 signature: 26af6570a62efb94f2e4c31f1b319112 ******/
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
		virtual Standard_Integer CaseMem(const opencascade::handle<StepData_SelectMember> & ent);

		/****** StepElement_CurveElementPurpose::CaseNum ******/
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
Recognizes a kind of CurveElementPurpose select type return 0.
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

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
		/****** md5 signature: ae7a49ea52744ae449d83e823e9a6da7 ******/
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", "Return
-------
opencascade::handle<StepData_SelectMember>

Description
-----------
Returns a new select member the type CurveElementPurposeMember.
") NewMember;
		virtual opencascade::handle<StepData_SelectMember> NewMember();

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
		/****** md5 signature: c4b2dbd737f3c98314fdb7955ce91c2a ******/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if has name.
") HasName;
		virtual Standard_Boolean HasName();

		/****** StepElement_CurveElementPurposeMember::Matches ******/
		/****** md5 signature: 926675035b73f94f6faae7b81ca23022 ******/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
bool

Description
-----------
Tells if the name of a SelectMember matches a given one;.
") Matches;
		virtual Standard_Boolean Matches(Standard_CString name);

		/****** StepElement_CurveElementPurposeMember::Name ******/
		/****** md5 signature: d654a4ee9a75d24a9c3f33853f908999 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns set name.
") Name;
		virtual Standard_CString Name();

		/****** StepElement_CurveElementPurposeMember::SetName ******/
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
Set name.
") SetName;
		virtual Standard_Boolean SetName(Standard_CString name);

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
		/****** md5 signature: 44417457cbd7725388314a318276ec96 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aDescription: TCollection_HAsciiString
aSectionAngle: float

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aDescription, const Standard_Real aSectionAngle);

		/****** StepElement_CurveElementSectionDefinition::SectionAngle ******/
		/****** md5 signature: b9b364e3c46e925b34ee3072e227e757 ******/
		%feature("compactdefaultargs") SectionAngle;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns field SectionAngle.
") SectionAngle;
		Standard_Real SectionAngle();

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
		/****** md5 signature: 0ab7588c24ea100afda44048c522d6f9 ******/
		%feature("compactdefaultargs") SetSectionAngle;
		%feature("autodoc", "
Parameters
----------
SectionAngle: float

Return
-------
None

Description
-----------
Set field SectionAngle.
") SetSectionAngle;
		void SetSectionAngle(const Standard_Real SectionAngle);

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
		/****** md5 signature: 26af6570a62efb94f2e4c31f1b319112 ******/
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
		virtual Standard_Integer CaseMem(const opencascade::handle<StepData_SelectMember> & ent);

		/****** StepElement_ElementAspect::CaseNum ******/
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
Recognizes a kind of ElementAspect select type return 0.
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

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
		/****** md5 signature: ae7a49ea52744ae449d83e823e9a6da7 ******/
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", "Return
-------
opencascade::handle<StepData_SelectMember>

Description
-----------
Returns a new select member the type ElementAspectMember.
") NewMember;
		virtual opencascade::handle<StepData_SelectMember> NewMember();

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
		/****** md5 signature: 509ba9de78170033f83ed5a62efa91a8 ******/
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
		void SetSurface2dEdge(const Standard_Integer aVal);

		/****** StepElement_ElementAspect::SetSurface2dFace ******/
		/****** md5 signature: 10b1f217fd74746850cc52fe90c032b9 ******/
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
		void SetSurface2dFace(const Standard_Integer aVal);

		/****** StepElement_ElementAspect::SetSurface3dEdge ******/
		/****** md5 signature: 7867338a73c21c2c77f89d0e9be62c94 ******/
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
		void SetSurface3dEdge(const Standard_Integer aVal);

		/****** StepElement_ElementAspect::SetSurface3dFace ******/
		/****** md5 signature: f39b9c7696fe7efd293b10dbd9017eed ******/
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
		void SetSurface3dFace(const Standard_Integer aVal);

		/****** StepElement_ElementAspect::SetVolume2dEdge ******/
		/****** md5 signature: 7f1e72393ad06e57292608be49cd8c6c ******/
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
		void SetVolume2dEdge(const Standard_Integer aVal);

		/****** StepElement_ElementAspect::SetVolume2dFace ******/
		/****** md5 signature: 8595ce9e71376dc48ed5508c561fa2c2 ******/
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
		void SetVolume2dFace(const Standard_Integer aVal);

		/****** StepElement_ElementAspect::SetVolume3dEdge ******/
		/****** md5 signature: 0b9cf65d298173f61996bc9f22d3bc81 ******/
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
		void SetVolume3dEdge(const Standard_Integer aVal);

		/****** StepElement_ElementAspect::SetVolume3dFace ******/
		/****** md5 signature: 47b0e994072ec87685142b423eeb764b ******/
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
		void SetVolume3dFace(const Standard_Integer aVal);

		/****** StepElement_ElementAspect::Surface2dEdge ******/
		/****** md5 signature: 9483647436778d6a468daf242625cf78 ******/
		%feature("compactdefaultargs") Surface2dEdge;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns Value as Surface2dEdge (or Null if another type).
") Surface2dEdge;
		Standard_Integer Surface2dEdge();

		/****** StepElement_ElementAspect::Surface2dFace ******/
		/****** md5 signature: fcadbb58624a1c60c76ed758a6444727 ******/
		%feature("compactdefaultargs") Surface2dFace;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns Value as Surface2dFace (or Null if another type).
") Surface2dFace;
		Standard_Integer Surface2dFace();

		/****** StepElement_ElementAspect::Surface3dEdge ******/
		/****** md5 signature: f0c7f5a888348bc96c40cde9a37aa9e7 ******/
		%feature("compactdefaultargs") Surface3dEdge;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns Value as Surface3dEdge (or Null if another type).
") Surface3dEdge;
		Standard_Integer Surface3dEdge();

		/****** StepElement_ElementAspect::Surface3dFace ******/
		/****** md5 signature: e745d84eb40daf36db233afabc767585 ******/
		%feature("compactdefaultargs") Surface3dFace;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns Value as Surface3dFace (or Null if another type).
") Surface3dFace;
		Standard_Integer Surface3dFace();

		/****** StepElement_ElementAspect::Volume2dEdge ******/
		/****** md5 signature: a331bc7c8be0569c0e44c6992e119e12 ******/
		%feature("compactdefaultargs") Volume2dEdge;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns Value as Volume2dEdge (or Null if another type).
") Volume2dEdge;
		Standard_Integer Volume2dEdge();

		/****** StepElement_ElementAspect::Volume2dFace ******/
		/****** md5 signature: e072f67894d136d30262e4dfaeeb487c ******/
		%feature("compactdefaultargs") Volume2dFace;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns Value as Volume2dFace (or Null if another type).
") Volume2dFace;
		Standard_Integer Volume2dFace();

		/****** StepElement_ElementAspect::Volume3dEdge ******/
		/****** md5 signature: 8035d3d759fb8159e3846278747e7fb4 ******/
		%feature("compactdefaultargs") Volume3dEdge;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns Value as Volume3dEdge (or Null if another type).
") Volume3dEdge;
		Standard_Integer Volume3dEdge();

		/****** StepElement_ElementAspect::Volume3dFace ******/
		/****** md5 signature: 3bb430eb38f9f1bded6d2304ebe06b48 ******/
		%feature("compactdefaultargs") Volume3dFace;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns Value as Volume3dFace (or Null if another type).
") Volume3dFace;
		Standard_Integer Volume3dFace();

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
		/****** md5 signature: c4b2dbd737f3c98314fdb7955ce91c2a ******/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if has name.
") HasName;
		virtual Standard_Boolean HasName();

		/****** StepElement_ElementAspectMember::Matches ******/
		/****** md5 signature: 926675035b73f94f6faae7b81ca23022 ******/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
bool

Description
-----------
Tells if the name of a SelectMember matches a given one;.
") Matches;
		virtual Standard_Boolean Matches(Standard_CString name);

		/****** StepElement_ElementAspectMember::Name ******/
		/****** md5 signature: d654a4ee9a75d24a9c3f33853f908999 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns set name.
") Name;
		virtual Standard_CString Name();

		/****** StepElement_ElementAspectMember::SetName ******/
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
Set name.
") SetName;
		virtual Standard_Boolean SetName(Standard_CString name);

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
		/****** md5 signature: 34239b17d8897e144582b34efcd27a85 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aMaterialId: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aProperties: StepRepr_HArray1OfMaterialPropertyRepresentation

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aMaterialId, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepRepr_HArray1OfMaterialPropertyRepresentation> & aProperties);

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
		/****** md5 signature: a549631887748a397841cd02c61fbc0a ******/
		%feature("compactdefaultargs") Properties;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_HArray1OfMaterialPropertyRepresentation>

Description
-----------
Returns field Properties.
") Properties;
		opencascade::handle<StepRepr_HArray1OfMaterialPropertyRepresentation> Properties();

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
		/****** md5 signature: 1cbc03f1726993887e873e0578b9bff5 ******/
		%feature("compactdefaultargs") SetProperties;
		%feature("autodoc", "
Parameters
----------
Properties: StepRepr_HArray1OfMaterialPropertyRepresentation

Return
-------
None

Description
-----------
Set field Properties.
") SetProperties;
		void SetProperties(const opencascade::handle<StepRepr_HArray1OfMaterialPropertyRepresentation> & Properties);

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
		/****** md5 signature: 26af6570a62efb94f2e4c31f1b319112 ******/
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
		virtual Standard_Integer CaseMem(const opencascade::handle<StepData_SelectMember> & ent);

		/****** StepElement_MeasureOrUnspecifiedValue::CaseNum ******/
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
Recognizes a kind of MeasureOrUnspecifiedValue select type return 0.
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepElement_MeasureOrUnspecifiedValue::ContextDependentMeasure ******/
		/****** md5 signature: 568437f42df21c23c4156094b79b4c29 ******/
		%feature("compactdefaultargs") ContextDependentMeasure;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns Value as ContextDependentMeasure (or Null if another type).
") ContextDependentMeasure;
		Standard_Real ContextDependentMeasure();

		/****** StepElement_MeasureOrUnspecifiedValue::NewMember ******/
		/****** md5 signature: ae7a49ea52744ae449d83e823e9a6da7 ******/
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", "Return
-------
opencascade::handle<StepData_SelectMember>

Description
-----------
Returns a new select member the type MeasureOrUnspecifiedValueMember.
") NewMember;
		virtual opencascade::handle<StepData_SelectMember> NewMember();

		/****** StepElement_MeasureOrUnspecifiedValue::SetContextDependentMeasure ******/
		/****** md5 signature: 07010e9a0752546d6bb9aa7e3e22aacf ******/
		%feature("compactdefaultargs") SetContextDependentMeasure;
		%feature("autodoc", "
Parameters
----------
aVal: float

Return
-------
None

Description
-----------
Set Value for ContextDependentMeasure.
") SetContextDependentMeasure;
		void SetContextDependentMeasure(const Standard_Real aVal);

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
		/****** md5 signature: c4b2dbd737f3c98314fdb7955ce91c2a ******/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if has name.
") HasName;
		virtual Standard_Boolean HasName();

		/****** StepElement_MeasureOrUnspecifiedValueMember::Matches ******/
		/****** md5 signature: 926675035b73f94f6faae7b81ca23022 ******/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
bool

Description
-----------
Tells if the name of a SelectMember matches a given one;.
") Matches;
		virtual Standard_Boolean Matches(Standard_CString name);

		/****** StepElement_MeasureOrUnspecifiedValueMember::Name ******/
		/****** md5 signature: d654a4ee9a75d24a9c3f33853f908999 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns set name.
") Name;
		virtual Standard_CString Name();

		/****** StepElement_MeasureOrUnspecifiedValueMember::SetName ******/
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
Set name.
") SetName;
		virtual Standard_Boolean SetName(Standard_CString name);

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
		/****** md5 signature: 26af6570a62efb94f2e4c31f1b319112 ******/
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
		virtual Standard_Integer CaseMem(const opencascade::handle<StepData_SelectMember> & ent);

		/****** StepElement_SurfaceElementPurpose::CaseNum ******/
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
Recognizes a kind of SurfaceElementPurpose select type return 0.
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

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
		/****** md5 signature: ae7a49ea52744ae449d83e823e9a6da7 ******/
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", "Return
-------
opencascade::handle<StepData_SelectMember>

Description
-----------
Returns a new select member the type SurfaceElementPurposeMember.
") NewMember;
		virtual opencascade::handle<StepData_SelectMember> NewMember();

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
		/****** md5 signature: c4b2dbd737f3c98314fdb7955ce91c2a ******/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if has name.
") HasName;
		virtual Standard_Boolean HasName();

		/****** StepElement_SurfaceElementPurposeMember::Matches ******/
		/****** md5 signature: 926675035b73f94f6faae7b81ca23022 ******/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
bool

Description
-----------
Tells if the name of a SelectMember matches a given one;.
") Matches;
		virtual Standard_Boolean Matches(Standard_CString name);

		/****** StepElement_SurfaceElementPurposeMember::Name ******/
		/****** md5 signature: d654a4ee9a75d24a9c3f33853f908999 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns set name.
") Name;
		virtual Standard_CString Name();

		/****** StepElement_SurfaceElementPurposeMember::SetName ******/
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
Set name.
") SetName;
		virtual Standard_Boolean SetName(Standard_CString name);

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
		/****** md5 signature: 26af6570a62efb94f2e4c31f1b319112 ******/
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
		virtual Standard_Integer CaseMem(const opencascade::handle<StepData_SelectMember> & ent);

		/****** StepElement_VolumeElementPurpose::CaseNum ******/
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
Recognizes a kind of VolumeElementPurpose select type return 0.
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

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
		/****** md5 signature: ae7a49ea52744ae449d83e823e9a6da7 ******/
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", "Return
-------
opencascade::handle<StepData_SelectMember>

Description
-----------
Returns a new select member the type VolumeElementPurposeMember.
") NewMember;
		virtual opencascade::handle<StepData_SelectMember> NewMember();

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
		/****** md5 signature: c4b2dbd737f3c98314fdb7955ce91c2a ******/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if has name.
") HasName;
		virtual Standard_Boolean HasName();

		/****** StepElement_VolumeElementPurposeMember::Matches ******/
		/****** md5 signature: 926675035b73f94f6faae7b81ca23022 ******/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
bool

Description
-----------
Tells if the name of a SelectMember matches a given one;.
") Matches;
		virtual Standard_Boolean Matches(Standard_CString name);

		/****** StepElement_VolumeElementPurposeMember::Name ******/
		/****** md5 signature: d654a4ee9a75d24a9c3f33853f908999 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns set name.
") Name;
		virtual Standard_CString Name();

		/****** StepElement_VolumeElementPurposeMember::SetName ******/
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
Set name.
") SetName;
		virtual Standard_Boolean SetName(Standard_CString name);

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
		/****** md5 signature: f791c47d02f853a79dcb28d7b692f6b6 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aElementDescriptor_TopologyOrder: StepElement_ElementOrder
aElementDescriptor_Description: TCollection_HAsciiString
aPurpose: StepElement_HArray1OfHSequenceOfCurveElementPurposeMember

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const StepElement_ElementOrder aElementDescriptor_TopologyOrder, const opencascade::handle<TCollection_HAsciiString> & aElementDescriptor_Description, const opencascade::handle<StepElement_HArray1OfHSequenceOfCurveElementPurposeMember> & aPurpose);

		/****** StepElement_Curve3dElementDescriptor::Purpose ******/
		/****** md5 signature: d68a294e6807fcfa4e5c4d83aa73e9d8 ******/
		%feature("compactdefaultargs") Purpose;
		%feature("autodoc", "Return
-------
opencascade::handle<StepElement_HArray1OfHSequenceOfCurveElementPurposeMember>

Description
-----------
Returns field Purpose.
") Purpose;
		opencascade::handle<StepElement_HArray1OfHSequenceOfCurveElementPurposeMember> Purpose();

		/****** StepElement_Curve3dElementDescriptor::SetPurpose ******/
		/****** md5 signature: f077eb037391daa86c1611a7465a7d7f ******/
		%feature("compactdefaultargs") SetPurpose;
		%feature("autodoc", "
Parameters
----------
Purpose: StepElement_HArray1OfHSequenceOfCurveElementPurposeMember

Return
-------
None

Description
-----------
Set field Purpose.
") SetPurpose;
		void SetPurpose(const opencascade::handle<StepElement_HArray1OfHSequenceOfCurveElementPurposeMember> & Purpose);

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
		/****** md5 signature: c4c4db959d3a6d76f8788bd9f4c07722 ******/
		%feature("compactdefaultargs") CrossSectionalArea;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns field CrossSectionalArea.
") CrossSectionalArea;
		Standard_Real CrossSectionalArea();

		/****** StepElement_CurveElementSectionDerivedDefinitions::Init ******/
		/****** md5 signature: 5757e9a93ff929964c8c95cc2440c517 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aCurveElementSectionDefinition_Description: TCollection_HAsciiString
aCurveElementSectionDefinition_SectionAngle: float
aCrossSectionalArea: float
aShearArea: StepElement_HArray1OfMeasureOrUnspecifiedValue
aSecondMomentOfArea: TColStd_HArray1OfReal
aTorsionalConstant: float
aWarpingConstant: StepElement_MeasureOrUnspecifiedValue
aLocationOfCentroid: StepElement_HArray1OfMeasureOrUnspecifiedValue
aLocationOfShearCentre: StepElement_HArray1OfMeasureOrUnspecifiedValue
aLocationOfNonStructuralMass: StepElement_HArray1OfMeasureOrUnspecifiedValue
aNonStructuralMass: StepElement_MeasureOrUnspecifiedValue
aPolarMoment: StepElement_MeasureOrUnspecifiedValue

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aCurveElementSectionDefinition_Description, const Standard_Real aCurveElementSectionDefinition_SectionAngle, const Standard_Real aCrossSectionalArea, const opencascade::handle<StepElement_HArray1OfMeasureOrUnspecifiedValue> & aShearArea, const opencascade::handle<TColStd_HArray1OfReal> & aSecondMomentOfArea, const Standard_Real aTorsionalConstant, const StepElement_MeasureOrUnspecifiedValue & aWarpingConstant, const opencascade::handle<StepElement_HArray1OfMeasureOrUnspecifiedValue> & aLocationOfCentroid, const opencascade::handle<StepElement_HArray1OfMeasureOrUnspecifiedValue> & aLocationOfShearCentre, const opencascade::handle<StepElement_HArray1OfMeasureOrUnspecifiedValue> & aLocationOfNonStructuralMass, const StepElement_MeasureOrUnspecifiedValue & aNonStructuralMass, const StepElement_MeasureOrUnspecifiedValue & aPolarMoment);

		/****** StepElement_CurveElementSectionDerivedDefinitions::LocationOfCentroid ******/
		/****** md5 signature: b0ccf28c499261fe4b7b5eb96d8f5ebe ******/
		%feature("compactdefaultargs") LocationOfCentroid;
		%feature("autodoc", "Return
-------
opencascade::handle<StepElement_HArray1OfMeasureOrUnspecifiedValue>

Description
-----------
Returns field LocationOfCentroid.
") LocationOfCentroid;
		opencascade::handle<StepElement_HArray1OfMeasureOrUnspecifiedValue> LocationOfCentroid();

		/****** StepElement_CurveElementSectionDerivedDefinitions::LocationOfNonStructuralMass ******/
		/****** md5 signature: ea5935e0a6cfbe6157b28c9a39cb44e3 ******/
		%feature("compactdefaultargs") LocationOfNonStructuralMass;
		%feature("autodoc", "Return
-------
opencascade::handle<StepElement_HArray1OfMeasureOrUnspecifiedValue>

Description
-----------
Returns field LocationOfNonStructuralMass.
") LocationOfNonStructuralMass;
		opencascade::handle<StepElement_HArray1OfMeasureOrUnspecifiedValue> LocationOfNonStructuralMass();

		/****** StepElement_CurveElementSectionDerivedDefinitions::LocationOfShearCentre ******/
		/****** md5 signature: d1aa5dfde5ebac41b996448e20355cb1 ******/
		%feature("compactdefaultargs") LocationOfShearCentre;
		%feature("autodoc", "Return
-------
opencascade::handle<StepElement_HArray1OfMeasureOrUnspecifiedValue>

Description
-----------
Returns field LocationOfShearCentre.
") LocationOfShearCentre;
		opencascade::handle<StepElement_HArray1OfMeasureOrUnspecifiedValue> LocationOfShearCentre();

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
		/****** md5 signature: ef9720202c45808a5bdf8cf3a6879630 ******/
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
		/****** md5 signature: 72589f3e6009d128eedc7d44a2031c73 ******/
		%feature("compactdefaultargs") SetCrossSectionalArea;
		%feature("autodoc", "
Parameters
----------
CrossSectionalArea: float

Return
-------
None

Description
-----------
Set field CrossSectionalArea.
") SetCrossSectionalArea;
		void SetCrossSectionalArea(const Standard_Real CrossSectionalArea);

		/****** StepElement_CurveElementSectionDerivedDefinitions::SetLocationOfCentroid ******/
		/****** md5 signature: 1afd086f8f7549268a625b3c7cba6942 ******/
		%feature("compactdefaultargs") SetLocationOfCentroid;
		%feature("autodoc", "
Parameters
----------
LocationOfCentroid: StepElement_HArray1OfMeasureOrUnspecifiedValue

Return
-------
None

Description
-----------
Set field LocationOfCentroid.
") SetLocationOfCentroid;
		void SetLocationOfCentroid(const opencascade::handle<StepElement_HArray1OfMeasureOrUnspecifiedValue> & LocationOfCentroid);

		/****** StepElement_CurveElementSectionDerivedDefinitions::SetLocationOfNonStructuralMass ******/
		/****** md5 signature: bfc21b2635a9ebb39f7db0a10629d8f4 ******/
		%feature("compactdefaultargs") SetLocationOfNonStructuralMass;
		%feature("autodoc", "
Parameters
----------
LocationOfNonStructuralMass: StepElement_HArray1OfMeasureOrUnspecifiedValue

Return
-------
None

Description
-----------
Set field LocationOfNonStructuralMass.
") SetLocationOfNonStructuralMass;
		void SetLocationOfNonStructuralMass(const opencascade::handle<StepElement_HArray1OfMeasureOrUnspecifiedValue> & LocationOfNonStructuralMass);

		/****** StepElement_CurveElementSectionDerivedDefinitions::SetLocationOfShearCentre ******/
		/****** md5 signature: 440ce2082eee6722f5eb9dfa738054e2 ******/
		%feature("compactdefaultargs") SetLocationOfShearCentre;
		%feature("autodoc", "
Parameters
----------
LocationOfShearCentre: StepElement_HArray1OfMeasureOrUnspecifiedValue

Return
-------
None

Description
-----------
Set field LocationOfShearCentre.
") SetLocationOfShearCentre;
		void SetLocationOfShearCentre(const opencascade::handle<StepElement_HArray1OfMeasureOrUnspecifiedValue> & LocationOfShearCentre);

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
		/****** md5 signature: 24242d7bdf009086f2c5a23054ba07ee ******/
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
		/****** md5 signature: 875119e3ee55e930d3befe8908934be9 ******/
		%feature("compactdefaultargs") SetShearArea;
		%feature("autodoc", "
Parameters
----------
ShearArea: StepElement_HArray1OfMeasureOrUnspecifiedValue

Return
-------
None

Description
-----------
Set field ShearArea.
") SetShearArea;
		void SetShearArea(const opencascade::handle<StepElement_HArray1OfMeasureOrUnspecifiedValue> & ShearArea);

		/****** StepElement_CurveElementSectionDerivedDefinitions::SetTorsionalConstant ******/
		/****** md5 signature: 2419aee66c8099156b0932b6510c2cee ******/
		%feature("compactdefaultargs") SetTorsionalConstant;
		%feature("autodoc", "
Parameters
----------
TorsionalConstant: float

Return
-------
None

Description
-----------
Set field TorsionalConstant.
") SetTorsionalConstant;
		void SetTorsionalConstant(const Standard_Real TorsionalConstant);

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
		/****** md5 signature: 59691f847fa9a792cb8d69e7f9ee5e93 ******/
		%feature("compactdefaultargs") ShearArea;
		%feature("autodoc", "Return
-------
opencascade::handle<StepElement_HArray1OfMeasureOrUnspecifiedValue>

Description
-----------
Returns field ShearArea.
") ShearArea;
		opencascade::handle<StepElement_HArray1OfMeasureOrUnspecifiedValue> ShearArea();

		/****** StepElement_CurveElementSectionDerivedDefinitions::TorsionalConstant ******/
		/****** md5 signature: 68bf303720706f3456d10506e7e3f690 ******/
		%feature("compactdefaultargs") TorsionalConstant;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns field TorsionalConstant.
") TorsionalConstant;
		Standard_Real TorsionalConstant();

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
		/****** md5 signature: b92301cbca7e40ea0e0646e96cc37e7e ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aElementDescriptor_TopologyOrder: StepElement_ElementOrder
aElementDescriptor_Description: TCollection_HAsciiString
aPurpose: StepElement_HArray1OfHSequenceOfSurfaceElementPurposeMember
aShape: StepElement_Element2dShape

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const StepElement_ElementOrder aElementDescriptor_TopologyOrder, const opencascade::handle<TCollection_HAsciiString> & aElementDescriptor_Description, const opencascade::handle<StepElement_HArray1OfHSequenceOfSurfaceElementPurposeMember> & aPurpose, const StepElement_Element2dShape aShape);

		/****** StepElement_Surface3dElementDescriptor::Purpose ******/
		/****** md5 signature: 93103c1dcf38ce96e5c6db63f11d3bd8 ******/
		%feature("compactdefaultargs") Purpose;
		%feature("autodoc", "Return
-------
opencascade::handle<StepElement_HArray1OfHSequenceOfSurfaceElementPurposeMember>

Description
-----------
Returns field Purpose.
") Purpose;
		opencascade::handle<StepElement_HArray1OfHSequenceOfSurfaceElementPurposeMember> Purpose();

		/****** StepElement_Surface3dElementDescriptor::SetPurpose ******/
		/****** md5 signature: 2c7ded550ad5e933007eb5824850a36e ******/
		%feature("compactdefaultargs") SetPurpose;
		%feature("autodoc", "
Parameters
----------
Purpose: StepElement_HArray1OfHSequenceOfSurfaceElementPurposeMember

Return
-------
None

Description
-----------
Set field Purpose.
") SetPurpose;
		void SetPurpose(const opencascade::handle<StepElement_HArray1OfHSequenceOfSurfaceElementPurposeMember> & Purpose);

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
		/****** md5 signature: 5fd1596bede3a5c1da4f7be9dab66cc5 ******/
		%feature("compactdefaultargs") AdditionalNodeValues;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns field AdditionalNodeValues.
") AdditionalNodeValues;
		Standard_Boolean AdditionalNodeValues();

		/****** StepElement_SurfaceSectionFieldVarying::Definitions ******/
		/****** md5 signature: d7a63d44921bc5fa82990812de0c74ee ******/
		%feature("compactdefaultargs") Definitions;
		%feature("autodoc", "Return
-------
opencascade::handle<StepElement_HArray1OfSurfaceSection>

Description
-----------
Returns field Definitions.
") Definitions;
		opencascade::handle<StepElement_HArray1OfSurfaceSection> Definitions();

		/****** StepElement_SurfaceSectionFieldVarying::Init ******/
		/****** md5 signature: b53ea2a579a16979ac28e2e138f2ae8c ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aDefinitions: StepElement_HArray1OfSurfaceSection
aAdditionalNodeValues: bool

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<StepElement_HArray1OfSurfaceSection> & aDefinitions, const Standard_Boolean aAdditionalNodeValues);

		/****** StepElement_SurfaceSectionFieldVarying::SetAdditionalNodeValues ******/
		/****** md5 signature: 25d9a886f0f6d21f4556d40f95421311 ******/
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
		void SetAdditionalNodeValues(const Standard_Boolean AdditionalNodeValues);

		/****** StepElement_SurfaceSectionFieldVarying::SetDefinitions ******/
		/****** md5 signature: 763519c48a74c8b983ef48dac439424a ******/
		%feature("compactdefaultargs") SetDefinitions;
		%feature("autodoc", "
Parameters
----------
Definitions: StepElement_HArray1OfSurfaceSection

Return
-------
None

Description
-----------
Set field Definitions.
") SetDefinitions;
		void SetDefinitions(const opencascade::handle<StepElement_HArray1OfSurfaceSection> & Definitions);

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
		/****** md5 signature: 571445c82da6853c2df9d0fdd82095c4 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aSurfaceSection_Offset: StepElement_MeasureOrUnspecifiedValue
aSurfaceSection_NonStructuralMass: StepElement_MeasureOrUnspecifiedValue
aSurfaceSection_NonStructuralMassOffset: StepElement_MeasureOrUnspecifiedValue
aThickness: float
aBendingThickness: StepElement_MeasureOrUnspecifiedValue
aShearThickness: StepElement_MeasureOrUnspecifiedValue

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const StepElement_MeasureOrUnspecifiedValue & aSurfaceSection_Offset, const StepElement_MeasureOrUnspecifiedValue & aSurfaceSection_NonStructuralMass, const StepElement_MeasureOrUnspecifiedValue & aSurfaceSection_NonStructuralMassOffset, const Standard_Real aThickness, const StepElement_MeasureOrUnspecifiedValue & aBendingThickness, const StepElement_MeasureOrUnspecifiedValue & aShearThickness);

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
		/****** md5 signature: e890f371344924c21fffcd2b04786eb0 ******/
		%feature("compactdefaultargs") SetThickness;
		%feature("autodoc", "
Parameters
----------
Thickness: float

Return
-------
None

Description
-----------
Set field Thickness.
") SetThickness;
		void SetThickness(const Standard_Real Thickness);

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
		/****** md5 signature: 5da481900c5ee9cbd00990ff84a638f7 ******/
		%feature("compactdefaultargs") Thickness;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns field Thickness.
") Thickness;
		Standard_Real Thickness();

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
		/****** md5 signature: 6080fc5fbaeefd1208c22db5bfade876 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aElementDescriptor_TopologyOrder: StepElement_ElementOrder
aElementDescriptor_Description: TCollection_HAsciiString
aPurpose: StepElement_HArray1OfVolumeElementPurposeMember
aShape: StepElement_Volume3dElementShape

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const StepElement_ElementOrder aElementDescriptor_TopologyOrder, const opencascade::handle<TCollection_HAsciiString> & aElementDescriptor_Description, const opencascade::handle<StepElement_HArray1OfVolumeElementPurposeMember> & aPurpose, const StepElement_Volume3dElementShape aShape);

		/****** StepElement_Volume3dElementDescriptor::Purpose ******/
		/****** md5 signature: f36f2b68d531db72629040dc79478f03 ******/
		%feature("compactdefaultargs") Purpose;
		%feature("autodoc", "Return
-------
opencascade::handle<StepElement_HArray1OfVolumeElementPurposeMember>

Description
-----------
Returns field Purpose.
") Purpose;
		opencascade::handle<StepElement_HArray1OfVolumeElementPurposeMember> Purpose();

		/****** StepElement_Volume3dElementDescriptor::SetPurpose ******/
		/****** md5 signature: 8b461f5fe0a310ebdcde1c98ed621e05 ******/
		%feature("compactdefaultargs") SetPurpose;
		%feature("autodoc", "
Parameters
----------
Purpose: StepElement_HArray1OfVolumeElementPurposeMember

Return
-------
None

Description
-----------
Set field Purpose.
") SetPurpose;
		void SetPurpose(const opencascade::handle<StepElement_HArray1OfVolumeElementPurposeMember> & Purpose);

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

class StepElement_HArray1OfCurveElementEndReleasePacket : public StepElement_Array1OfCurveElementEndReleasePacket, public Standard_Transient {
  public:
    StepElement_HArray1OfCurveElementEndReleasePacket(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepElement_HArray1OfCurveElementEndReleasePacket(const Standard_Integer theLower, const Standard_Integer theUpper, const StepElement_Array1OfCurveElementEndReleasePacket::value_type& theValue);
    StepElement_HArray1OfCurveElementEndReleasePacket(const StepElement_Array1OfCurveElementEndReleasePacket& theOther);
    const StepElement_Array1OfCurveElementEndReleasePacket& Array1();
    StepElement_Array1OfCurveElementEndReleasePacket& ChangeArray1();
};
%make_alias(StepElement_HArray1OfCurveElementEndReleasePacket)


class StepElement_HArray1OfCurveElementSectionDefinition : public StepElement_Array1OfCurveElementSectionDefinition, public Standard_Transient {
  public:
    StepElement_HArray1OfCurveElementSectionDefinition(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepElement_HArray1OfCurveElementSectionDefinition(const Standard_Integer theLower, const Standard_Integer theUpper, const StepElement_Array1OfCurveElementSectionDefinition::value_type& theValue);
    StepElement_HArray1OfCurveElementSectionDefinition(const StepElement_Array1OfCurveElementSectionDefinition& theOther);
    const StepElement_Array1OfCurveElementSectionDefinition& Array1();
    StepElement_Array1OfCurveElementSectionDefinition& ChangeArray1();
};
%make_alias(StepElement_HArray1OfCurveElementSectionDefinition)


class StepElement_HArray1OfHSequenceOfCurveElementPurposeMember : public StepElement_Array1OfHSequenceOfCurveElementPurposeMember, public Standard_Transient {
  public:
    StepElement_HArray1OfHSequenceOfCurveElementPurposeMember(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepElement_HArray1OfHSequenceOfCurveElementPurposeMember(const Standard_Integer theLower, const Standard_Integer theUpper, const StepElement_Array1OfHSequenceOfCurveElementPurposeMember::value_type& theValue);
    StepElement_HArray1OfHSequenceOfCurveElementPurposeMember(const StepElement_Array1OfHSequenceOfCurveElementPurposeMember& theOther);
    const StepElement_Array1OfHSequenceOfCurveElementPurposeMember& Array1();
    StepElement_Array1OfHSequenceOfCurveElementPurposeMember& ChangeArray1();
};
%make_alias(StepElement_HArray1OfHSequenceOfCurveElementPurposeMember)


class StepElement_HArray1OfHSequenceOfSurfaceElementPurposeMember : public StepElement_Array1OfHSequenceOfSurfaceElementPurposeMember, public Standard_Transient {
  public:
    StepElement_HArray1OfHSequenceOfSurfaceElementPurposeMember(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepElement_HArray1OfHSequenceOfSurfaceElementPurposeMember(const Standard_Integer theLower, const Standard_Integer theUpper, const StepElement_Array1OfHSequenceOfSurfaceElementPurposeMember::value_type& theValue);
    StepElement_HArray1OfHSequenceOfSurfaceElementPurposeMember(const StepElement_Array1OfHSequenceOfSurfaceElementPurposeMember& theOther);
    const StepElement_Array1OfHSequenceOfSurfaceElementPurposeMember& Array1();
    StepElement_Array1OfHSequenceOfSurfaceElementPurposeMember& ChangeArray1();
};
%make_alias(StepElement_HArray1OfHSequenceOfSurfaceElementPurposeMember)


class StepElement_HArray1OfMeasureOrUnspecifiedValue : public StepElement_Array1OfMeasureOrUnspecifiedValue, public Standard_Transient {
  public:
    StepElement_HArray1OfMeasureOrUnspecifiedValue(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepElement_HArray1OfMeasureOrUnspecifiedValue(const Standard_Integer theLower, const Standard_Integer theUpper, const StepElement_Array1OfMeasureOrUnspecifiedValue::value_type& theValue);
    StepElement_HArray1OfMeasureOrUnspecifiedValue(const StepElement_Array1OfMeasureOrUnspecifiedValue& theOther);
    const StepElement_Array1OfMeasureOrUnspecifiedValue& Array1();
    StepElement_Array1OfMeasureOrUnspecifiedValue& ChangeArray1();
};
%make_alias(StepElement_HArray1OfMeasureOrUnspecifiedValue)


class StepElement_HArray1OfSurfaceSection : public StepElement_Array1OfSurfaceSection, public Standard_Transient {
  public:
    StepElement_HArray1OfSurfaceSection(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepElement_HArray1OfSurfaceSection(const Standard_Integer theLower, const Standard_Integer theUpper, const StepElement_Array1OfSurfaceSection::value_type& theValue);
    StepElement_HArray1OfSurfaceSection(const StepElement_Array1OfSurfaceSection& theOther);
    const StepElement_Array1OfSurfaceSection& Array1();
    StepElement_Array1OfSurfaceSection& ChangeArray1();
};
%make_alias(StepElement_HArray1OfSurfaceSection)


class StepElement_HArray1OfVolumeElementPurpose : public StepElement_Array1OfVolumeElementPurpose, public Standard_Transient {
  public:
    StepElement_HArray1OfVolumeElementPurpose(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepElement_HArray1OfVolumeElementPurpose(const Standard_Integer theLower, const Standard_Integer theUpper, const StepElement_Array1OfVolumeElementPurpose::value_type& theValue);
    StepElement_HArray1OfVolumeElementPurpose(const StepElement_Array1OfVolumeElementPurpose& theOther);
    const StepElement_Array1OfVolumeElementPurpose& Array1();
    StepElement_Array1OfVolumeElementPurpose& ChangeArray1();
};
%make_alias(StepElement_HArray1OfVolumeElementPurpose)


class StepElement_HArray1OfVolumeElementPurposeMember : public StepElement_Array1OfVolumeElementPurposeMember, public Standard_Transient {
  public:
    StepElement_HArray1OfVolumeElementPurposeMember(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepElement_HArray1OfVolumeElementPurposeMember(const Standard_Integer theLower, const Standard_Integer theUpper, const StepElement_Array1OfVolumeElementPurposeMember::value_type& theValue);
    StepElement_HArray1OfVolumeElementPurposeMember(const StepElement_Array1OfVolumeElementPurposeMember& theOther);
    const StepElement_Array1OfVolumeElementPurposeMember& Array1();
    StepElement_Array1OfVolumeElementPurposeMember& ChangeArray1();
};
%make_alias(StepElement_HArray1OfVolumeElementPurposeMember)

/* harray2 classes */
class StepElement_HArray2OfCurveElementPurposeMember : public StepElement_Array2OfCurveElementPurposeMember, public Standard_Transient {
  public:
    StepElement_HArray2OfCurveElementPurposeMember(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    StepElement_HArray2OfCurveElementPurposeMember(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const StepElement_Array2OfCurveElementPurposeMember::value_type& theValue);
    StepElement_HArray2OfCurveElementPurposeMember(const StepElement_Array2OfCurveElementPurposeMember& theOther);
    const StepElement_Array2OfCurveElementPurposeMember& Array2 ();
    StepElement_Array2OfCurveElementPurposeMember& ChangeArray2 (); 
};
%make_alias(StepElement_HArray2OfCurveElementPurposeMember)


class StepElement_HArray2OfSurfaceElementPurpose : public StepElement_Array2OfSurfaceElementPurpose, public Standard_Transient {
  public:
    StepElement_HArray2OfSurfaceElementPurpose(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    StepElement_HArray2OfSurfaceElementPurpose(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const StepElement_Array2OfSurfaceElementPurpose::value_type& theValue);
    StepElement_HArray2OfSurfaceElementPurpose(const StepElement_Array2OfSurfaceElementPurpose& theOther);
    const StepElement_Array2OfSurfaceElementPurpose& Array2 ();
    StepElement_Array2OfSurfaceElementPurpose& ChangeArray2 (); 
};
%make_alias(StepElement_HArray2OfSurfaceElementPurpose)


class StepElement_HArray2OfSurfaceElementPurposeMember : public StepElement_Array2OfSurfaceElementPurposeMember, public Standard_Transient {
  public:
    StepElement_HArray2OfSurfaceElementPurposeMember(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    StepElement_HArray2OfSurfaceElementPurposeMember(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const StepElement_Array2OfSurfaceElementPurposeMember::value_type& theValue);
    StepElement_HArray2OfSurfaceElementPurposeMember(const StepElement_Array2OfSurfaceElementPurposeMember& theOther);
    const StepElement_Array2OfSurfaceElementPurposeMember& Array2 ();
    StepElement_Array2OfSurfaceElementPurposeMember& ChangeArray2 (); 
};
%make_alias(StepElement_HArray2OfSurfaceElementPurposeMember)


/* hsequence classes */
class StepElement_HSequenceOfCurveElementPurposeMember : public StepElement_SequenceOfCurveElementPurposeMember, public Standard_Transient {
  public:
    StepElement_HSequenceOfCurveElementPurposeMember();
    StepElement_HSequenceOfCurveElementPurposeMember(const StepElement_SequenceOfCurveElementPurposeMember& theOther);
    const StepElement_SequenceOfCurveElementPurposeMember& Sequence();
    void Append (const StepElement_SequenceOfCurveElementPurposeMember::value_type& theItem);
    void Append (StepElement_SequenceOfCurveElementPurposeMember& theSequence);
    StepElement_SequenceOfCurveElementPurposeMember& ChangeSequence();
};
%make_alias(StepElement_HSequenceOfCurveElementPurposeMember)


class StepElement_HSequenceOfCurveElementSectionDefinition : public StepElement_SequenceOfCurveElementSectionDefinition, public Standard_Transient {
  public:
    StepElement_HSequenceOfCurveElementSectionDefinition();
    StepElement_HSequenceOfCurveElementSectionDefinition(const StepElement_SequenceOfCurveElementSectionDefinition& theOther);
    const StepElement_SequenceOfCurveElementSectionDefinition& Sequence();
    void Append (const StepElement_SequenceOfCurveElementSectionDefinition::value_type& theItem);
    void Append (StepElement_SequenceOfCurveElementSectionDefinition& theSequence);
    StepElement_SequenceOfCurveElementSectionDefinition& ChangeSequence();
};
%make_alias(StepElement_HSequenceOfCurveElementSectionDefinition)


class StepElement_HSequenceOfElementMaterial : public StepElement_SequenceOfElementMaterial, public Standard_Transient {
  public:
    StepElement_HSequenceOfElementMaterial();
    StepElement_HSequenceOfElementMaterial(const StepElement_SequenceOfElementMaterial& theOther);
    const StepElement_SequenceOfElementMaterial& Sequence();
    void Append (const StepElement_SequenceOfElementMaterial::value_type& theItem);
    void Append (StepElement_SequenceOfElementMaterial& theSequence);
    StepElement_SequenceOfElementMaterial& ChangeSequence();
};
%make_alias(StepElement_HSequenceOfElementMaterial)


class StepElement_HSequenceOfSurfaceElementPurposeMember : public StepElement_SequenceOfSurfaceElementPurposeMember, public Standard_Transient {
  public:
    StepElement_HSequenceOfSurfaceElementPurposeMember();
    StepElement_HSequenceOfSurfaceElementPurposeMember(const StepElement_SequenceOfSurfaceElementPurposeMember& theOther);
    const StepElement_SequenceOfSurfaceElementPurposeMember& Sequence();
    void Append (const StepElement_SequenceOfSurfaceElementPurposeMember::value_type& theItem);
    void Append (StepElement_SequenceOfSurfaceElementPurposeMember& theSequence);
    StepElement_SequenceOfSurfaceElementPurposeMember& ChangeSequence();
};
%make_alias(StepElement_HSequenceOfSurfaceElementPurposeMember)


/* class aliases */
%pythoncode {
}
