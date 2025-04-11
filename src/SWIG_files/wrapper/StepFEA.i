/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
%define STEPFEADOCSTRING
"StepFEA module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_stepfea.html"
%enddef
%module (package="OCC.Core", docstring=STEPFEADOCSTRING) StepFEA


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
#include<StepFEA_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TCollection_module.hxx>
#include<StepData_module.hxx>
#include<TColStd_module.hxx>
#include<StepElement_module.hxx>
#include<StepBasic_module.hxx>
#include<StepRepr_module.hxx>
#include<StepGeom_module.hxx>
#include<Message_module.hxx>
#include<Interface_module.hxx>
#include<StepData_module.hxx>
#include<StepShape_module.hxx>
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
%import StepData.i
%import TColStd.i
%import StepElement.i
%import StepBasic.i
%import StepRepr.i
%import StepGeom.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum StepFEA_CoordinateSystemType {
	StepFEA_Cartesian = 0,
	StepFEA_Cylindrical = 1,
	StepFEA_Spherical = 2,
};

enum StepFEA_CurveEdge {
	StepFEA_ElementEdge = 0,
};

enum StepFEA_ElementVolume {
	StepFEA_Volume = 0,
};

enum StepFEA_EnumeratedDegreeOfFreedom {
	StepFEA_XTranslation = 0,
	StepFEA_YTranslation = 1,
	StepFEA_ZTranslation = 2,
	StepFEA_XRotation = 3,
	StepFEA_YRotation = 4,
	StepFEA_ZRotation = 5,
	StepFEA_Warp = 6,
};

enum StepFEA_UnspecifiedValue {
	StepFEA_Unspecified = 0,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class StepFEA_CoordinateSystemType(IntEnum):
	StepFEA_Cartesian = 0
	StepFEA_Cylindrical = 1
	StepFEA_Spherical = 2
StepFEA_Cartesian = StepFEA_CoordinateSystemType.StepFEA_Cartesian
StepFEA_Cylindrical = StepFEA_CoordinateSystemType.StepFEA_Cylindrical
StepFEA_Spherical = StepFEA_CoordinateSystemType.StepFEA_Spherical

class StepFEA_CurveEdge(IntEnum):
	StepFEA_ElementEdge = 0
StepFEA_ElementEdge = StepFEA_CurveEdge.StepFEA_ElementEdge

class StepFEA_ElementVolume(IntEnum):
	StepFEA_Volume = 0
StepFEA_Volume = StepFEA_ElementVolume.StepFEA_Volume

class StepFEA_EnumeratedDegreeOfFreedom(IntEnum):
	StepFEA_XTranslation = 0
	StepFEA_YTranslation = 1
	StepFEA_ZTranslation = 2
	StepFEA_XRotation = 3
	StepFEA_YRotation = 4
	StepFEA_ZRotation = 5
	StepFEA_Warp = 6
StepFEA_XTranslation = StepFEA_EnumeratedDegreeOfFreedom.StepFEA_XTranslation
StepFEA_YTranslation = StepFEA_EnumeratedDegreeOfFreedom.StepFEA_YTranslation
StepFEA_ZTranslation = StepFEA_EnumeratedDegreeOfFreedom.StepFEA_ZTranslation
StepFEA_XRotation = StepFEA_EnumeratedDegreeOfFreedom.StepFEA_XRotation
StepFEA_YRotation = StepFEA_EnumeratedDegreeOfFreedom.StepFEA_YRotation
StepFEA_ZRotation = StepFEA_EnumeratedDegreeOfFreedom.StepFEA_ZRotation
StepFEA_Warp = StepFEA_EnumeratedDegreeOfFreedom.StepFEA_Warp

class StepFEA_UnspecifiedValue(IntEnum):
	StepFEA_Unspecified = 0
StepFEA_Unspecified = StepFEA_UnspecifiedValue.StepFEA_Unspecified
};
/* end python proxy for enums */

/* handles */
%wrap_handle(StepFEA_Curve3dElementProperty)
%wrap_handle(StepFEA_CurveElementEndOffset)
%wrap_handle(StepFEA_CurveElementEndRelease)
%wrap_handle(StepFEA_CurveElementInterval)
%wrap_handle(StepFEA_CurveElementLocation)
%wrap_handle(StepFEA_DegreeOfFreedomMember)
%wrap_handle(StepFEA_ElementGeometricRelationship)
%wrap_handle(StepFEA_ElementRepresentation)
%wrap_handle(StepFEA_FeaAxis2Placement3d)
%wrap_handle(StepFEA_FeaCurveSectionGeometricRelationship)
%wrap_handle(StepFEA_FeaGroup)
%wrap_handle(StepFEA_FeaMaterialPropertyRepresentation)
%wrap_handle(StepFEA_FeaMaterialPropertyRepresentationItem)
%wrap_handle(StepFEA_FeaModel)
%wrap_handle(StepFEA_FeaModelDefinition)
%wrap_handle(StepFEA_FeaParametricPoint)
%wrap_handle(StepFEA_FeaRepresentationItem)
%wrap_handle(StepFEA_FeaSurfaceSectionGeometricRelationship)
%wrap_handle(StepFEA_FreedomAndCoefficient)
%wrap_handle(StepFEA_FreedomsList)
%wrap_handle(StepFEA_NodeDefinition)
%wrap_handle(StepFEA_NodeRepresentation)
%wrap_handle(StepFEA_NodeSet)
%wrap_handle(StepFEA_SymmetricTensor23dMember)
%wrap_handle(StepFEA_SymmetricTensor43dMember)
%wrap_handle(StepFEA_AlignedCurve3dElementCoordinateSystem)
%wrap_handle(StepFEA_AlignedSurface3dElementCoordinateSystem)
%wrap_handle(StepFEA_ArbitraryVolume3dElementCoordinateSystem)
%wrap_handle(StepFEA_ConstantSurface3dElementCoordinateSystem)
%wrap_handle(StepFEA_Curve3dElementRepresentation)
%wrap_handle(StepFEA_CurveElementIntervalConstant)
%wrap_handle(StepFEA_CurveElementIntervalLinearlyVarying)
%wrap_handle(StepFEA_DummyNode)
%wrap_handle(StepFEA_ElementGroup)
%wrap_handle(StepFEA_FeaAreaDensity)
%wrap_handle(StepFEA_FeaLinearElasticity)
%wrap_handle(StepFEA_FeaMassDensity)
%wrap_handle(StepFEA_FeaModel3d)
%wrap_handle(StepFEA_FeaMoistureAbsorption)
%wrap_handle(StepFEA_FeaSecantCoefficientOfLinearThermalExpansion)
%wrap_handle(StepFEA_FeaShellBendingStiffness)
%wrap_handle(StepFEA_FeaShellMembraneBendingCouplingStiffness)
%wrap_handle(StepFEA_FeaShellMembraneStiffness)
%wrap_handle(StepFEA_FeaShellShearStiffness)
%wrap_handle(StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion)
%wrap_handle(StepFEA_GeometricNode)
%wrap_handle(StepFEA_Node)
%wrap_handle(StepFEA_NodeGroup)
%wrap_handle(StepFEA_ParametricCurve3dElementCoordinateDirection)
%wrap_handle(StepFEA_ParametricCurve3dElementCoordinateSystem)
%wrap_handle(StepFEA_ParametricSurface3dElementCoordinateSystem)
%wrap_handle(StepFEA_Surface3dElementRepresentation)
%wrap_handle(StepFEA_Volume3dElementRepresentation)
%wrap_handle(StepFEA_NodeWithSolutionCoordinateSystem)
%wrap_handle(StepFEA_NodeWithVector)
%wrap_handle(StepFEA_HArray1OfCurveElementEndOffset)
%wrap_handle(StepFEA_HArray1OfCurveElementEndRelease)
%wrap_handle(StepFEA_HArray1OfCurveElementInterval)
%wrap_handle(StepFEA_HArray1OfDegreeOfFreedom)
%wrap_handle(StepFEA_HArray1OfElementRepresentation)
%wrap_handle(StepFEA_HArray1OfNodeRepresentation)
%wrap_handle(StepFEA_HSequenceOfCurve3dElementProperty)
%wrap_handle(StepFEA_HSequenceOfElementGeometricRelationship)
%wrap_handle(StepFEA_HSequenceOfElementRepresentation)
%wrap_handle(StepFEA_HSequenceOfNodeRepresentation)
/* end handles declaration */

/* templates */
%template(StepFEA_Array1OfCurveElementEndOffset) NCollection_Array1<opencascade::handle<StepFEA_CurveElementEndOffset>>;
Array1ExtendIter(opencascade::handle<StepFEA_CurveElementEndOffset>)

%template(StepFEA_Array1OfCurveElementEndRelease) NCollection_Array1<opencascade::handle<StepFEA_CurveElementEndRelease>>;
Array1ExtendIter(opencascade::handle<StepFEA_CurveElementEndRelease>)

%template(StepFEA_Array1OfCurveElementInterval) NCollection_Array1<opencascade::handle<StepFEA_CurveElementInterval>>;
Array1ExtendIter(opencascade::handle<StepFEA_CurveElementInterval>)

%template(StepFEA_Array1OfDegreeOfFreedom) NCollection_Array1<StepFEA_DegreeOfFreedom>;
Array1ExtendIter(StepFEA_DegreeOfFreedom)

%template(StepFEA_Array1OfElementRepresentation) NCollection_Array1<opencascade::handle<StepFEA_ElementRepresentation>>;
Array1ExtendIter(opencascade::handle<StepFEA_ElementRepresentation>)

%template(StepFEA_Array1OfNodeRepresentation) NCollection_Array1<opencascade::handle<StepFEA_NodeRepresentation>>;
Array1ExtendIter(opencascade::handle<StepFEA_NodeRepresentation>)

%template(StepFEA_SequenceOfCurve3dElementProperty) NCollection_Sequence<opencascade::handle<StepFEA_Curve3dElementProperty>>;

%extend NCollection_Sequence<opencascade::handle<StepFEA_Curve3dElementProperty>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(StepFEA_SequenceOfElementGeometricRelationship) NCollection_Sequence<opencascade::handle<StepFEA_ElementGeometricRelationship>>;

%extend NCollection_Sequence<opencascade::handle<StepFEA_ElementGeometricRelationship>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(StepFEA_SequenceOfElementRepresentation) NCollection_Sequence<opencascade::handle<StepFEA_ElementRepresentation>>;

%extend NCollection_Sequence<opencascade::handle<StepFEA_ElementRepresentation>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(StepFEA_SequenceOfNodeRepresentation) NCollection_Sequence<opencascade::handle<StepFEA_NodeRepresentation>>;

%extend NCollection_Sequence<opencascade::handle<StepFEA_NodeRepresentation>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<opencascade::handle<StepFEA_CurveElementEndOffset>> StepFEA_Array1OfCurveElementEndOffset;
typedef NCollection_Array1<opencascade::handle<StepFEA_CurveElementEndRelease>> StepFEA_Array1OfCurveElementEndRelease;
typedef NCollection_Array1<opencascade::handle<StepFEA_CurveElementInterval>> StepFEA_Array1OfCurveElementInterval;
typedef NCollection_Array1<StepFEA_DegreeOfFreedom> StepFEA_Array1OfDegreeOfFreedom;
typedef NCollection_Array1<opencascade::handle<StepFEA_ElementRepresentation>> StepFEA_Array1OfElementRepresentation;
typedef NCollection_Array1<opencascade::handle<StepFEA_NodeRepresentation>> StepFEA_Array1OfNodeRepresentation;
typedef NCollection_Sequence<opencascade::handle<StepFEA_Curve3dElementProperty>> StepFEA_SequenceOfCurve3dElementProperty;
typedef NCollection_Sequence<opencascade::handle<StepFEA_ElementGeometricRelationship>> StepFEA_SequenceOfElementGeometricRelationship;
typedef NCollection_Sequence<opencascade::handle<StepFEA_ElementRepresentation>> StepFEA_SequenceOfElementRepresentation;
typedef NCollection_Sequence<opencascade::handle<StepFEA_NodeRepresentation>> StepFEA_SequenceOfNodeRepresentation;
/* end typedefs declaration */

/***************************************
* class StepFEA_Curve3dElementProperty *
***************************************/
class StepFEA_Curve3dElementProperty : public Standard_Transient {
	public:
		/****** StepFEA_Curve3dElementProperty::StepFEA_Curve3dElementProperty ******/
		/****** md5 signature: 90572017ba33525e59409ffa290b93b2 ******/
		%feature("compactdefaultargs") StepFEA_Curve3dElementProperty;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_Curve3dElementProperty;
		 StepFEA_Curve3dElementProperty();

		/****** StepFEA_Curve3dElementProperty::Description ******/
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

		/****** StepFEA_Curve3dElementProperty::EndOffsets ******/
		/****** md5 signature: 3226dcfd4d3241f393fefbc1624456d0 ******/
		%feature("compactdefaultargs") EndOffsets;
		%feature("autodoc", "Return
-------
opencascade::handle<StepFEA_HArray1OfCurveElementEndOffset>

Description
-----------
Returns field EndOffsets.
") EndOffsets;
		opencascade::handle<StepFEA_HArray1OfCurveElementEndOffset> EndOffsets();

		/****** StepFEA_Curve3dElementProperty::EndReleases ******/
		/****** md5 signature: 0f0b5fbc787e3529df4dda93f270d0ac ******/
		%feature("compactdefaultargs") EndReleases;
		%feature("autodoc", "Return
-------
opencascade::handle<StepFEA_HArray1OfCurveElementEndRelease>

Description
-----------
Returns field EndReleases.
") EndReleases;
		opencascade::handle<StepFEA_HArray1OfCurveElementEndRelease> EndReleases();

		/****** StepFEA_Curve3dElementProperty::Init ******/
		/****** md5 signature: e9ef3a6e6bc03c04a8b18ceb93a5b677 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aPropertyId: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aIntervalDefinitions: StepFEA_HArray1OfCurveElementInterval
aEndOffsets: StepFEA_HArray1OfCurveElementEndOffset
aEndReleases: StepFEA_HArray1OfCurveElementEndRelease

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aPropertyId, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepFEA_HArray1OfCurveElementInterval> & aIntervalDefinitions, const opencascade::handle<StepFEA_HArray1OfCurveElementEndOffset> & aEndOffsets, const opencascade::handle<StepFEA_HArray1OfCurveElementEndRelease> & aEndReleases);

		/****** StepFEA_Curve3dElementProperty::IntervalDefinitions ******/
		/****** md5 signature: 0deffb82fb53a1571eb9b90c5a87dc31 ******/
		%feature("compactdefaultargs") IntervalDefinitions;
		%feature("autodoc", "Return
-------
opencascade::handle<StepFEA_HArray1OfCurveElementInterval>

Description
-----------
Returns field IntervalDefinitions.
") IntervalDefinitions;
		opencascade::handle<StepFEA_HArray1OfCurveElementInterval> IntervalDefinitions();

		/****** StepFEA_Curve3dElementProperty::PropertyId ******/
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

		/****** StepFEA_Curve3dElementProperty::SetDescription ******/
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

		/****** StepFEA_Curve3dElementProperty::SetEndOffsets ******/
		/****** md5 signature: 6f7bca5774121244d6f5a3b2d732b562 ******/
		%feature("compactdefaultargs") SetEndOffsets;
		%feature("autodoc", "
Parameters
----------
EndOffsets: StepFEA_HArray1OfCurveElementEndOffset

Return
-------
None

Description
-----------
Set field EndOffsets.
") SetEndOffsets;
		void SetEndOffsets(const opencascade::handle<StepFEA_HArray1OfCurveElementEndOffset> & EndOffsets);

		/****** StepFEA_Curve3dElementProperty::SetEndReleases ******/
		/****** md5 signature: aea5b6ef6fca869efc35df2577210011 ******/
		%feature("compactdefaultargs") SetEndReleases;
		%feature("autodoc", "
Parameters
----------
EndReleases: StepFEA_HArray1OfCurveElementEndRelease

Return
-------
None

Description
-----------
Set field EndReleases.
") SetEndReleases;
		void SetEndReleases(const opencascade::handle<StepFEA_HArray1OfCurveElementEndRelease> & EndReleases);

		/****** StepFEA_Curve3dElementProperty::SetIntervalDefinitions ******/
		/****** md5 signature: b3c6e2bbc25898e60711854129223e91 ******/
		%feature("compactdefaultargs") SetIntervalDefinitions;
		%feature("autodoc", "
Parameters
----------
IntervalDefinitions: StepFEA_HArray1OfCurveElementInterval

Return
-------
None

Description
-----------
Set field IntervalDefinitions.
") SetIntervalDefinitions;
		void SetIntervalDefinitions(const opencascade::handle<StepFEA_HArray1OfCurveElementInterval> & IntervalDefinitions);

		/****** StepFEA_Curve3dElementProperty::SetPropertyId ******/
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

};


%make_alias(StepFEA_Curve3dElementProperty)

%extend StepFEA_Curve3dElementProperty {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class StepFEA_CurveElementEndCoordinateSystem *
************************************************/
class StepFEA_CurveElementEndCoordinateSystem : public StepData_SelectType {
	public:
		/****** StepFEA_CurveElementEndCoordinateSystem::StepFEA_CurveElementEndCoordinateSystem ******/
		/****** md5 signature: f411567545fa1a1e00c34c9751406c60 ******/
		%feature("compactdefaultargs") StepFEA_CurveElementEndCoordinateSystem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_CurveElementEndCoordinateSystem;
		 StepFEA_CurveElementEndCoordinateSystem();

		/****** StepFEA_CurveElementEndCoordinateSystem::AlignedCurve3dElementCoordinateSystem ******/
		/****** md5 signature: 3b877d0cb4093d63d6d3db8f7641fbed ******/
		%feature("compactdefaultargs") AlignedCurve3dElementCoordinateSystem;
		%feature("autodoc", "Return
-------
opencascade::handle<StepFEA_AlignedCurve3dElementCoordinateSystem>

Description
-----------
Returns Value as AlignedCurve3dElementCoordinateSystem (or Null if another type).
") AlignedCurve3dElementCoordinateSystem;
		opencascade::handle<StepFEA_AlignedCurve3dElementCoordinateSystem> AlignedCurve3dElementCoordinateSystem();

		/****** StepFEA_CurveElementEndCoordinateSystem::CaseNum ******/
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
Recognizes a kind of CurveElementEndCoordinateSystem select type 1 -> FeaAxis2Placement3d from StepFEA 2 -> AlignedCurve3dElementCoordinateSystem from StepFEA 3 -> ParametricCurve3dElementCoordinateSystem from StepFEA 0 else.
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepFEA_CurveElementEndCoordinateSystem::FeaAxis2Placement3d ******/
		/****** md5 signature: 6e20b07cd00a56527509acdf7a7dc4bc ******/
		%feature("compactdefaultargs") FeaAxis2Placement3d;
		%feature("autodoc", "Return
-------
opencascade::handle<StepFEA_FeaAxis2Placement3d>

Description
-----------
Returns Value as FeaAxis2Placement3d (or Null if another type).
") FeaAxis2Placement3d;
		opencascade::handle<StepFEA_FeaAxis2Placement3d> FeaAxis2Placement3d();

		/****** StepFEA_CurveElementEndCoordinateSystem::ParametricCurve3dElementCoordinateSystem ******/
		/****** md5 signature: b2d59ead99a542c0eed8783cf7fee854 ******/
		%feature("compactdefaultargs") ParametricCurve3dElementCoordinateSystem;
		%feature("autodoc", "Return
-------
opencascade::handle<StepFEA_ParametricCurve3dElementCoordinateSystem>

Description
-----------
Returns Value as ParametricCurve3dElementCoordinateSystem (or Null if another type).
") ParametricCurve3dElementCoordinateSystem;
		opencascade::handle<StepFEA_ParametricCurve3dElementCoordinateSystem> ParametricCurve3dElementCoordinateSystem();

};


%extend StepFEA_CurveElementEndCoordinateSystem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class StepFEA_CurveElementEndOffset *
**************************************/
class StepFEA_CurveElementEndOffset : public Standard_Transient {
	public:
		/****** StepFEA_CurveElementEndOffset::StepFEA_CurveElementEndOffset ******/
		/****** md5 signature: bfceac778c37dbab0afff85dd5566a57 ******/
		%feature("compactdefaultargs") StepFEA_CurveElementEndOffset;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_CurveElementEndOffset;
		 StepFEA_CurveElementEndOffset();

		/****** StepFEA_CurveElementEndOffset::CoordinateSystem ******/
		/****** md5 signature: eabfdac8b70c91f887f5db6da4c898f0 ******/
		%feature("compactdefaultargs") CoordinateSystem;
		%feature("autodoc", "Return
-------
StepFEA_CurveElementEndCoordinateSystem

Description
-----------
Returns field CoordinateSystem.
") CoordinateSystem;
		StepFEA_CurveElementEndCoordinateSystem CoordinateSystem();

		/****** StepFEA_CurveElementEndOffset::Init ******/
		/****** md5 signature: fc25bb179247e1de1d0fe7eae3fc3264 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aCoordinateSystem: StepFEA_CurveElementEndCoordinateSystem
aOffsetVector: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const StepFEA_CurveElementEndCoordinateSystem & aCoordinateSystem, const opencascade::handle<TColStd_HArray1OfReal> & aOffsetVector);

		/****** StepFEA_CurveElementEndOffset::OffsetVector ******/
		/****** md5 signature: 410675bd8edab75f21d0f3e8156c2d47 ******/
		%feature("compactdefaultargs") OffsetVector;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
Returns field OffsetVector.
") OffsetVector;
		opencascade::handle<TColStd_HArray1OfReal> OffsetVector();

		/****** StepFEA_CurveElementEndOffset::SetCoordinateSystem ******/
		/****** md5 signature: 0721bc23fb691d653426546c5cb5ef5f ******/
		%feature("compactdefaultargs") SetCoordinateSystem;
		%feature("autodoc", "
Parameters
----------
CoordinateSystem: StepFEA_CurveElementEndCoordinateSystem

Return
-------
None

Description
-----------
Set field CoordinateSystem.
") SetCoordinateSystem;
		void SetCoordinateSystem(const StepFEA_CurveElementEndCoordinateSystem & CoordinateSystem);

		/****** StepFEA_CurveElementEndOffset::SetOffsetVector ******/
		/****** md5 signature: 4cef76644e28345238f5db748f083351 ******/
		%feature("compactdefaultargs") SetOffsetVector;
		%feature("autodoc", "
Parameters
----------
OffsetVector: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
Set field OffsetVector.
") SetOffsetVector;
		void SetOffsetVector(const opencascade::handle<TColStd_HArray1OfReal> & OffsetVector);

};


%make_alias(StepFEA_CurveElementEndOffset)

%extend StepFEA_CurveElementEndOffset {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class StepFEA_CurveElementEndRelease *
***************************************/
class StepFEA_CurveElementEndRelease : public Standard_Transient {
	public:
		/****** StepFEA_CurveElementEndRelease::StepFEA_CurveElementEndRelease ******/
		/****** md5 signature: c85241dd2d3de2d7affdaac8b804978a ******/
		%feature("compactdefaultargs") StepFEA_CurveElementEndRelease;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_CurveElementEndRelease;
		 StepFEA_CurveElementEndRelease();

		/****** StepFEA_CurveElementEndRelease::CoordinateSystem ******/
		/****** md5 signature: eabfdac8b70c91f887f5db6da4c898f0 ******/
		%feature("compactdefaultargs") CoordinateSystem;
		%feature("autodoc", "Return
-------
StepFEA_CurveElementEndCoordinateSystem

Description
-----------
Returns field CoordinateSystem.
") CoordinateSystem;
		StepFEA_CurveElementEndCoordinateSystem CoordinateSystem();

		/****** StepFEA_CurveElementEndRelease::Init ******/
		/****** md5 signature: fd61e127fca190868a6abd9e8d9bb2a2 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aCoordinateSystem: StepFEA_CurveElementEndCoordinateSystem
aReleases: StepElement_HArray1OfCurveElementEndReleasePacket

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const StepFEA_CurveElementEndCoordinateSystem & aCoordinateSystem, const opencascade::handle<StepElement_HArray1OfCurveElementEndReleasePacket> & aReleases);

		/****** StepFEA_CurveElementEndRelease::Releases ******/
		/****** md5 signature: a9a60f66fcbdd62028fb36d6af2c5a73 ******/
		%feature("compactdefaultargs") Releases;
		%feature("autodoc", "Return
-------
opencascade::handle<StepElement_HArray1OfCurveElementEndReleasePacket>

Description
-----------
Returns field Releases.
") Releases;
		opencascade::handle<StepElement_HArray1OfCurveElementEndReleasePacket> Releases();

		/****** StepFEA_CurveElementEndRelease::SetCoordinateSystem ******/
		/****** md5 signature: 0721bc23fb691d653426546c5cb5ef5f ******/
		%feature("compactdefaultargs") SetCoordinateSystem;
		%feature("autodoc", "
Parameters
----------
CoordinateSystem: StepFEA_CurveElementEndCoordinateSystem

Return
-------
None

Description
-----------
Set field CoordinateSystem.
") SetCoordinateSystem;
		void SetCoordinateSystem(const StepFEA_CurveElementEndCoordinateSystem & CoordinateSystem);

		/****** StepFEA_CurveElementEndRelease::SetReleases ******/
		/****** md5 signature: eb22d52d963d0d2763f4ce0f4deae0c2 ******/
		%feature("compactdefaultargs") SetReleases;
		%feature("autodoc", "
Parameters
----------
Releases: StepElement_HArray1OfCurveElementEndReleasePacket

Return
-------
None

Description
-----------
Set field Releases.
") SetReleases;
		void SetReleases(const opencascade::handle<StepElement_HArray1OfCurveElementEndReleasePacket> & Releases);

};


%make_alias(StepFEA_CurveElementEndRelease)

%extend StepFEA_CurveElementEndRelease {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class StepFEA_CurveElementInterval *
*************************************/
class StepFEA_CurveElementInterval : public Standard_Transient {
	public:
		/****** StepFEA_CurveElementInterval::StepFEA_CurveElementInterval ******/
		/****** md5 signature: 9247b8f07e076d3c53faa7d53284adac ******/
		%feature("compactdefaultargs") StepFEA_CurveElementInterval;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_CurveElementInterval;
		 StepFEA_CurveElementInterval();

		/****** StepFEA_CurveElementInterval::EuAngles ******/
		/****** md5 signature: fa684295eeb39327448fea81820a890f ******/
		%feature("compactdefaultargs") EuAngles;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_EulerAngles>

Description
-----------
Returns field EuAngles.
") EuAngles;
		opencascade::handle<StepBasic_EulerAngles> EuAngles();

		/****** StepFEA_CurveElementInterval::FinishPosition ******/
		/****** md5 signature: c0922e857ca72dd22e5dbadee98add80 ******/
		%feature("compactdefaultargs") FinishPosition;
		%feature("autodoc", "Return
-------
opencascade::handle<StepFEA_CurveElementLocation>

Description
-----------
Returns field FinishPosition.
") FinishPosition;
		opencascade::handle<StepFEA_CurveElementLocation> FinishPosition();

		/****** StepFEA_CurveElementInterval::Init ******/
		/****** md5 signature: 7273c27d192818e17c41f1930d56be24 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aFinishPosition: StepFEA_CurveElementLocation
aEuAngles: StepBasic_EulerAngles

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<StepFEA_CurveElementLocation> & aFinishPosition, const opencascade::handle<StepBasic_EulerAngles> & aEuAngles);

		/****** StepFEA_CurveElementInterval::SetEuAngles ******/
		/****** md5 signature: 7f4299e2b79c3300e338ed0a55dd6a58 ******/
		%feature("compactdefaultargs") SetEuAngles;
		%feature("autodoc", "
Parameters
----------
EuAngles: StepBasic_EulerAngles

Return
-------
None

Description
-----------
Set field EuAngles.
") SetEuAngles;
		void SetEuAngles(const opencascade::handle<StepBasic_EulerAngles> & EuAngles);

		/****** StepFEA_CurveElementInterval::SetFinishPosition ******/
		/****** md5 signature: 83deefdb74f149b8563f67b214a2c5fb ******/
		%feature("compactdefaultargs") SetFinishPosition;
		%feature("autodoc", "
Parameters
----------
FinishPosition: StepFEA_CurveElementLocation

Return
-------
None

Description
-----------
Set field FinishPosition.
") SetFinishPosition;
		void SetFinishPosition(const opencascade::handle<StepFEA_CurveElementLocation> & FinishPosition);

};


%make_alias(StepFEA_CurveElementInterval)

%extend StepFEA_CurveElementInterval {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class StepFEA_CurveElementLocation *
*************************************/
class StepFEA_CurveElementLocation : public Standard_Transient {
	public:
		/****** StepFEA_CurveElementLocation::StepFEA_CurveElementLocation ******/
		/****** md5 signature: c49f93c26a483bef8fb0094ba335fdea ******/
		%feature("compactdefaultargs") StepFEA_CurveElementLocation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_CurveElementLocation;
		 StepFEA_CurveElementLocation();

		/****** StepFEA_CurveElementLocation::Coordinate ******/
		/****** md5 signature: 3d842e9fa8cb18ac85b202067dd6972e ******/
		%feature("compactdefaultargs") Coordinate;
		%feature("autodoc", "Return
-------
opencascade::handle<StepFEA_FeaParametricPoint>

Description
-----------
Returns field Coordinate.
") Coordinate;
		opencascade::handle<StepFEA_FeaParametricPoint> Coordinate();

		/****** StepFEA_CurveElementLocation::Init ******/
		/****** md5 signature: 26efa3880387d227aeedf9f761658ab2 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aCoordinate: StepFEA_FeaParametricPoint

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<StepFEA_FeaParametricPoint> & aCoordinate);

		/****** StepFEA_CurveElementLocation::SetCoordinate ******/
		/****** md5 signature: ba17f772d36fd3d356b798b33f02c2cb ******/
		%feature("compactdefaultargs") SetCoordinate;
		%feature("autodoc", "
Parameters
----------
Coordinate: StepFEA_FeaParametricPoint

Return
-------
None

Description
-----------
Set field Coordinate.
") SetCoordinate;
		void SetCoordinate(const opencascade::handle<StepFEA_FeaParametricPoint> & Coordinate);

};


%make_alias(StepFEA_CurveElementLocation)

%extend StepFEA_CurveElementLocation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class StepFEA_DegreeOfFreedom *
********************************/
class StepFEA_DegreeOfFreedom : public StepData_SelectType {
	public:
		/****** StepFEA_DegreeOfFreedom::StepFEA_DegreeOfFreedom ******/
		/****** md5 signature: ddfea4e57eb0a530ebf6e0a179a88394 ******/
		%feature("compactdefaultargs") StepFEA_DegreeOfFreedom;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_DegreeOfFreedom;
		 StepFEA_DegreeOfFreedom();

		/****** StepFEA_DegreeOfFreedom::ApplicationDefinedDegreeOfFreedom ******/
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

		/****** StepFEA_DegreeOfFreedom::CaseMem ******/
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

		/****** StepFEA_DegreeOfFreedom::CaseNum ******/
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

		/****** StepFEA_DegreeOfFreedom::EnumeratedDegreeOfFreedom ******/
		/****** md5 signature: dd1de6166d7f0663deb4fc2ceda36c56 ******/
		%feature("compactdefaultargs") EnumeratedDegreeOfFreedom;
		%feature("autodoc", "Return
-------
StepFEA_EnumeratedDegreeOfFreedom

Description
-----------
Returns Value as EnumeratedDegreeOfFreedom (or Null if another type).
") EnumeratedDegreeOfFreedom;
		StepFEA_EnumeratedDegreeOfFreedom EnumeratedDegreeOfFreedom();

		/****** StepFEA_DegreeOfFreedom::NewMember ******/
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

		/****** StepFEA_DegreeOfFreedom::SetApplicationDefinedDegreeOfFreedom ******/
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

		/****** StepFEA_DegreeOfFreedom::SetEnumeratedDegreeOfFreedom ******/
		/****** md5 signature: 24d2ac73d6e41b399748bc004588f0a5 ******/
		%feature("compactdefaultargs") SetEnumeratedDegreeOfFreedom;
		%feature("autodoc", "
Parameters
----------
aVal: StepFEA_EnumeratedDegreeOfFreedom

Return
-------
None

Description
-----------
Returns Value as EnumeratedDegreeOfFreedom (or Null if another type).
") SetEnumeratedDegreeOfFreedom;
		void SetEnumeratedDegreeOfFreedom(const StepFEA_EnumeratedDegreeOfFreedom aVal);

};


%extend StepFEA_DegreeOfFreedom {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class StepFEA_DegreeOfFreedomMember *
**************************************/
class StepFEA_DegreeOfFreedomMember : public StepData_SelectNamed {
	public:
		/****** StepFEA_DegreeOfFreedomMember::StepFEA_DegreeOfFreedomMember ******/
		/****** md5 signature: 2c62083a2b5a0b9bc8c089a6dcf11600 ******/
		%feature("compactdefaultargs") StepFEA_DegreeOfFreedomMember;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_DegreeOfFreedomMember;
		 StepFEA_DegreeOfFreedomMember();

		/****** StepFEA_DegreeOfFreedomMember::HasName ******/
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

		/****** StepFEA_DegreeOfFreedomMember::Matches ******/
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

		/****** StepFEA_DegreeOfFreedomMember::Name ******/
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

		/****** StepFEA_DegreeOfFreedomMember::SetName ******/
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


%make_alias(StepFEA_DegreeOfFreedomMember)

%extend StepFEA_DegreeOfFreedomMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class StepFEA_ElementGeometricRelationship *
*********************************************/
class StepFEA_ElementGeometricRelationship : public Standard_Transient {
	public:
		/****** StepFEA_ElementGeometricRelationship::StepFEA_ElementGeometricRelationship ******/
		/****** md5 signature: 04560cd1acbf35e7f9d1558af13571e5 ******/
		%feature("compactdefaultargs") StepFEA_ElementGeometricRelationship;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_ElementGeometricRelationship;
		 StepFEA_ElementGeometricRelationship();

		/****** StepFEA_ElementGeometricRelationship::Aspect ******/
		/****** md5 signature: 7024ff668165525f5bf2b29258ab458f ******/
		%feature("compactdefaultargs") Aspect;
		%feature("autodoc", "Return
-------
StepElement_ElementAspect

Description
-----------
Returns field Aspect.
") Aspect;
		StepElement_ElementAspect Aspect();

		/****** StepFEA_ElementGeometricRelationship::ElementRef ******/
		/****** md5 signature: 5164b105a6fe0095bbafb9dea07ea22a ******/
		%feature("compactdefaultargs") ElementRef;
		%feature("autodoc", "Return
-------
StepFEA_ElementOrElementGroup

Description
-----------
Returns field ElementRef.
") ElementRef;
		StepFEA_ElementOrElementGroup ElementRef();

		/****** StepFEA_ElementGeometricRelationship::Init ******/
		/****** md5 signature: 66dc0cb38bcc7a8ee38565c7cbd5a94b ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aElementRef: StepFEA_ElementOrElementGroup
aItem: StepElement_AnalysisItemWithinRepresentation
aAspect: StepElement_ElementAspect

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const StepFEA_ElementOrElementGroup & aElementRef, const opencascade::handle<StepElement_AnalysisItemWithinRepresentation> & aItem, const StepElement_ElementAspect & aAspect);

		/****** StepFEA_ElementGeometricRelationship::Item ******/
		/****** md5 signature: b253a19c4ee018e419eb42364512210b ******/
		%feature("compactdefaultargs") Item;
		%feature("autodoc", "Return
-------
opencascade::handle<StepElement_AnalysisItemWithinRepresentation>

Description
-----------
Returns field Item.
") Item;
		opencascade::handle<StepElement_AnalysisItemWithinRepresentation> Item();

		/****** StepFEA_ElementGeometricRelationship::SetAspect ******/
		/****** md5 signature: d8356ade2de44db1b3d893df957261ce ******/
		%feature("compactdefaultargs") SetAspect;
		%feature("autodoc", "
Parameters
----------
Aspect: StepElement_ElementAspect

Return
-------
None

Description
-----------
Set field Aspect.
") SetAspect;
		void SetAspect(const StepElement_ElementAspect & Aspect);

		/****** StepFEA_ElementGeometricRelationship::SetElementRef ******/
		/****** md5 signature: e646e17804fbc19b4c87fe234d1f9954 ******/
		%feature("compactdefaultargs") SetElementRef;
		%feature("autodoc", "
Parameters
----------
ElementRef: StepFEA_ElementOrElementGroup

Return
-------
None

Description
-----------
Set field ElementRef.
") SetElementRef;
		void SetElementRef(const StepFEA_ElementOrElementGroup & ElementRef);

		/****** StepFEA_ElementGeometricRelationship::SetItem ******/
		/****** md5 signature: 6c8dcc5a597631cd78ea60f9829f8e90 ******/
		%feature("compactdefaultargs") SetItem;
		%feature("autodoc", "
Parameters
----------
Item: StepElement_AnalysisItemWithinRepresentation

Return
-------
None

Description
-----------
Set field Item.
") SetItem;
		void SetItem(const opencascade::handle<StepElement_AnalysisItemWithinRepresentation> & Item);

};


%make_alias(StepFEA_ElementGeometricRelationship)

%extend StepFEA_ElementGeometricRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class StepFEA_ElementOrElementGroup *
**************************************/
class StepFEA_ElementOrElementGroup : public StepData_SelectType {
	public:
		/****** StepFEA_ElementOrElementGroup::StepFEA_ElementOrElementGroup ******/
		/****** md5 signature: 9586e24c3c7fa84ea805f2dbaf6f9966 ******/
		%feature("compactdefaultargs") StepFEA_ElementOrElementGroup;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_ElementOrElementGroup;
		 StepFEA_ElementOrElementGroup();

		/****** StepFEA_ElementOrElementGroup::CaseNum ******/
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
Recognizes a kind of ElementOrElementGroup select type 1 -> ElementRepresentation from StepFEA 2 -> ElementGroup from StepFEA 0 else.
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepFEA_ElementOrElementGroup::ElementGroup ******/
		/****** md5 signature: 6b09d9597476edf1d012ade9e92323c7 ******/
		%feature("compactdefaultargs") ElementGroup;
		%feature("autodoc", "Return
-------
opencascade::handle<StepFEA_ElementGroup>

Description
-----------
Returns Value as ElementGroup (or Null if another type).
") ElementGroup;
		opencascade::handle<StepFEA_ElementGroup> ElementGroup();

		/****** StepFEA_ElementOrElementGroup::ElementRepresentation ******/
		/****** md5 signature: 0da58ba3ca7299c0f04764fbf627470b ******/
		%feature("compactdefaultargs") ElementRepresentation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepFEA_ElementRepresentation>

Description
-----------
Returns Value as ElementRepresentation (or Null if another type).
") ElementRepresentation;
		opencascade::handle<StepFEA_ElementRepresentation> ElementRepresentation();

};


%extend StepFEA_ElementOrElementGroup {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class StepFEA_ElementRepresentation *
**************************************/
class StepFEA_ElementRepresentation : public StepRepr_Representation {
	public:
		/****** StepFEA_ElementRepresentation::StepFEA_ElementRepresentation ******/
		/****** md5 signature: 968b9c82f95c1712f015725197cefbdf ******/
		%feature("compactdefaultargs") StepFEA_ElementRepresentation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_ElementRepresentation;
		 StepFEA_ElementRepresentation();

		/****** StepFEA_ElementRepresentation::Init ******/
		/****** md5 signature: 9765af58765f7a43fd4b2bc06c74d6b8 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aRepresentation_Name: TCollection_HAsciiString
aRepresentation_Items: StepRepr_HArray1OfRepresentationItem
aRepresentation_ContextOfItems: StepRepr_RepresentationContext
aNodeList: StepFEA_HArray1OfNodeRepresentation

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aRepresentation_Name, const opencascade::handle<StepRepr_HArray1OfRepresentationItem> & aRepresentation_Items, const opencascade::handle<StepRepr_RepresentationContext> & aRepresentation_ContextOfItems, const opencascade::handle<StepFEA_HArray1OfNodeRepresentation> & aNodeList);

		/****** StepFEA_ElementRepresentation::NodeList ******/
		/****** md5 signature: aebc33584d3f41632eee431f0d8ce136 ******/
		%feature("compactdefaultargs") NodeList;
		%feature("autodoc", "Return
-------
opencascade::handle<StepFEA_HArray1OfNodeRepresentation>

Description
-----------
Returns field NodeList.
") NodeList;
		opencascade::handle<StepFEA_HArray1OfNodeRepresentation> NodeList();

		/****** StepFEA_ElementRepresentation::SetNodeList ******/
		/****** md5 signature: b31399b855585cbb87b624ee9e33c1ca ******/
		%feature("compactdefaultargs") SetNodeList;
		%feature("autodoc", "
Parameters
----------
NodeList: StepFEA_HArray1OfNodeRepresentation

Return
-------
None

Description
-----------
Set field NodeList.
") SetNodeList;
		void SetNodeList(const opencascade::handle<StepFEA_HArray1OfNodeRepresentation> & NodeList);

};


%make_alias(StepFEA_ElementRepresentation)

%extend StepFEA_ElementRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class StepFEA_FeaAxis2Placement3d *
************************************/
class StepFEA_FeaAxis2Placement3d : public StepGeom_Axis2Placement3d {
	public:
		/****** StepFEA_FeaAxis2Placement3d::StepFEA_FeaAxis2Placement3d ******/
		/****** md5 signature: 4da29ea3c5dc0e6e993b4efc94818cee ******/
		%feature("compactdefaultargs") StepFEA_FeaAxis2Placement3d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_FeaAxis2Placement3d;
		 StepFEA_FeaAxis2Placement3d();

		/****** StepFEA_FeaAxis2Placement3d::Description ******/
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

		/****** StepFEA_FeaAxis2Placement3d::Init ******/
		/****** md5 signature: f36188d95da622532853fd8f84ce5d3f ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aRepresentationItem_Name: TCollection_HAsciiString
aPlacement_Location: StepGeom_CartesianPoint
hasAxis2Placement3d_Axis: bool
aAxis2Placement3d_Axis: StepGeom_Direction
hasAxis2Placement3d_RefDirection: bool
aAxis2Placement3d_RefDirection: StepGeom_Direction
aSystemType: StepFEA_CoordinateSystemType
aDescription: TCollection_HAsciiString

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name, const opencascade::handle<StepGeom_CartesianPoint> & aPlacement_Location, const Standard_Boolean hasAxis2Placement3d_Axis, const opencascade::handle<StepGeom_Direction> & aAxis2Placement3d_Axis, const Standard_Boolean hasAxis2Placement3d_RefDirection, const opencascade::handle<StepGeom_Direction> & aAxis2Placement3d_RefDirection, const StepFEA_CoordinateSystemType aSystemType, const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****** StepFEA_FeaAxis2Placement3d::SetDescription ******/
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

		/****** StepFEA_FeaAxis2Placement3d::SetSystemType ******/
		/****** md5 signature: ab5d460236ff8ff8ce4d4bfaa34bd105 ******/
		%feature("compactdefaultargs") SetSystemType;
		%feature("autodoc", "
Parameters
----------
SystemType: StepFEA_CoordinateSystemType

Return
-------
None

Description
-----------
Set field SystemType.
") SetSystemType;
		void SetSystemType(const StepFEA_CoordinateSystemType SystemType);

		/****** StepFEA_FeaAxis2Placement3d::SystemType ******/
		/****** md5 signature: a0fdd372be70f95f1f45abb888b01173 ******/
		%feature("compactdefaultargs") SystemType;
		%feature("autodoc", "Return
-------
StepFEA_CoordinateSystemType

Description
-----------
Returns field SystemType.
") SystemType;
		StepFEA_CoordinateSystemType SystemType();

};


%make_alias(StepFEA_FeaAxis2Placement3d)

%extend StepFEA_FeaAxis2Placement3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************************
* class StepFEA_FeaCurveSectionGeometricRelationship *
*****************************************************/
class StepFEA_FeaCurveSectionGeometricRelationship : public Standard_Transient {
	public:
		/****** StepFEA_FeaCurveSectionGeometricRelationship::StepFEA_FeaCurveSectionGeometricRelationship ******/
		/****** md5 signature: 10a8ee96abcea0b4b2b164b98a1a3d69 ******/
		%feature("compactdefaultargs") StepFEA_FeaCurveSectionGeometricRelationship;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_FeaCurveSectionGeometricRelationship;
		 StepFEA_FeaCurveSectionGeometricRelationship();

		/****** StepFEA_FeaCurveSectionGeometricRelationship::Init ******/
		/****** md5 signature: 0d05ce43469ca55d0db041f743c9d0dc ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aSectionRef: StepElement_CurveElementSectionDefinition
aItem: StepElement_AnalysisItemWithinRepresentation

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<StepElement_CurveElementSectionDefinition> & aSectionRef, const opencascade::handle<StepElement_AnalysisItemWithinRepresentation> & aItem);

		/****** StepFEA_FeaCurveSectionGeometricRelationship::Item ******/
		/****** md5 signature: b253a19c4ee018e419eb42364512210b ******/
		%feature("compactdefaultargs") Item;
		%feature("autodoc", "Return
-------
opencascade::handle<StepElement_AnalysisItemWithinRepresentation>

Description
-----------
Returns field Item.
") Item;
		opencascade::handle<StepElement_AnalysisItemWithinRepresentation> Item();

		/****** StepFEA_FeaCurveSectionGeometricRelationship::SectionRef ******/
		/****** md5 signature: bbe8069937198086ce8172afaf3e6095 ******/
		%feature("compactdefaultargs") SectionRef;
		%feature("autodoc", "Return
-------
opencascade::handle<StepElement_CurveElementSectionDefinition>

Description
-----------
Returns field SectionRef.
") SectionRef;
		opencascade::handle<StepElement_CurveElementSectionDefinition> SectionRef();

		/****** StepFEA_FeaCurveSectionGeometricRelationship::SetItem ******/
		/****** md5 signature: 6c8dcc5a597631cd78ea60f9829f8e90 ******/
		%feature("compactdefaultargs") SetItem;
		%feature("autodoc", "
Parameters
----------
Item: StepElement_AnalysisItemWithinRepresentation

Return
-------
None

Description
-----------
Set field Item.
") SetItem;
		void SetItem(const opencascade::handle<StepElement_AnalysisItemWithinRepresentation> & Item);

		/****** StepFEA_FeaCurveSectionGeometricRelationship::SetSectionRef ******/
		/****** md5 signature: a6c88937032a57d271df2b846104bb1f ******/
		%feature("compactdefaultargs") SetSectionRef;
		%feature("autodoc", "
Parameters
----------
SectionRef: StepElement_CurveElementSectionDefinition

Return
-------
None

Description
-----------
Set field SectionRef.
") SetSectionRef;
		void SetSectionRef(const opencascade::handle<StepElement_CurveElementSectionDefinition> & SectionRef);

};


%make_alias(StepFEA_FeaCurveSectionGeometricRelationship)

%extend StepFEA_FeaCurveSectionGeometricRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class StepFEA_FeaGroup *
*************************/
class StepFEA_FeaGroup : public StepBasic_Group {
	public:
		/****** StepFEA_FeaGroup::StepFEA_FeaGroup ******/
		/****** md5 signature: 1804a01d9fa95670d2109330b83097ca ******/
		%feature("compactdefaultargs") StepFEA_FeaGroup;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_FeaGroup;
		 StepFEA_FeaGroup();

		/****** StepFEA_FeaGroup::Init ******/
		/****** md5 signature: 0102004c939eb79fc6c9d99d54b286df ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aGroup_Name: TCollection_HAsciiString
aGroup_Description: TCollection_HAsciiString
aModelRef: StepFEA_FeaModel

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aGroup_Name, const opencascade::handle<TCollection_HAsciiString> & aGroup_Description, const opencascade::handle<StepFEA_FeaModel> & aModelRef);

		/****** StepFEA_FeaGroup::ModelRef ******/
		/****** md5 signature: 7c456eca97f01da8f37fdaf738a476d8 ******/
		%feature("compactdefaultargs") ModelRef;
		%feature("autodoc", "Return
-------
opencascade::handle<StepFEA_FeaModel>

Description
-----------
Returns field ModelRef.
") ModelRef;
		opencascade::handle<StepFEA_FeaModel> ModelRef();

		/****** StepFEA_FeaGroup::SetModelRef ******/
		/****** md5 signature: a4b9fcc357b0e079d1e7cb8ecfdce31c ******/
		%feature("compactdefaultargs") SetModelRef;
		%feature("autodoc", "
Parameters
----------
ModelRef: StepFEA_FeaModel

Return
-------
None

Description
-----------
Set field ModelRef.
") SetModelRef;
		void SetModelRef(const opencascade::handle<StepFEA_FeaModel> & ModelRef);

};


%make_alias(StepFEA_FeaGroup)

%extend StepFEA_FeaGroup {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class StepFEA_FeaMaterialPropertyRepresentation *
**************************************************/
class StepFEA_FeaMaterialPropertyRepresentation : public StepRepr_MaterialPropertyRepresentation {
	public:
		/****** StepFEA_FeaMaterialPropertyRepresentation::StepFEA_FeaMaterialPropertyRepresentation ******/
		/****** md5 signature: c7c4abb70bce472c98c88e9a59086d05 ******/
		%feature("compactdefaultargs") StepFEA_FeaMaterialPropertyRepresentation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_FeaMaterialPropertyRepresentation;
		 StepFEA_FeaMaterialPropertyRepresentation();

};


%make_alias(StepFEA_FeaMaterialPropertyRepresentation)

%extend StepFEA_FeaMaterialPropertyRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************************
* class StepFEA_FeaMaterialPropertyRepresentationItem *
******************************************************/
class StepFEA_FeaMaterialPropertyRepresentationItem : public StepRepr_RepresentationItem {
	public:
		/****** StepFEA_FeaMaterialPropertyRepresentationItem::StepFEA_FeaMaterialPropertyRepresentationItem ******/
		/****** md5 signature: 961a7f1cc1027091c6f75301f32965c7 ******/
		%feature("compactdefaultargs") StepFEA_FeaMaterialPropertyRepresentationItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_FeaMaterialPropertyRepresentationItem;
		 StepFEA_FeaMaterialPropertyRepresentationItem();

};


%make_alias(StepFEA_FeaMaterialPropertyRepresentationItem)

%extend StepFEA_FeaMaterialPropertyRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class StepFEA_FeaModel *
*************************/
class StepFEA_FeaModel : public StepRepr_Representation {
	public:
		/****** StepFEA_FeaModel::StepFEA_FeaModel ******/
		/****** md5 signature: 1bd2e604db4e7c7634a856459f379c08 ******/
		%feature("compactdefaultargs") StepFEA_FeaModel;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_FeaModel;
		 StepFEA_FeaModel();

		/****** StepFEA_FeaModel::AnalysisType ******/
		/****** md5 signature: 18c15b2c216183629c5ea9f5a1fed6b6 ******/
		%feature("compactdefaultargs") AnalysisType;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field AnalysisType.
") AnalysisType;
		opencascade::handle<TCollection_HAsciiString> AnalysisType();

		/****** StepFEA_FeaModel::CreatingSoftware ******/
		/****** md5 signature: 480e6e39500c87494f7f1103e2e4e855 ******/
		%feature("compactdefaultargs") CreatingSoftware;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field CreatingSoftware.
") CreatingSoftware;
		opencascade::handle<TCollection_HAsciiString> CreatingSoftware();

		/****** StepFEA_FeaModel::Description ******/
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

		/****** StepFEA_FeaModel::Init ******/
		/****** md5 signature: 40354018c2242768e4382f13f47fdd85 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aRepresentation_Name: TCollection_HAsciiString
aRepresentation_Items: StepRepr_HArray1OfRepresentationItem
aRepresentation_ContextOfItems: StepRepr_RepresentationContext
aCreatingSoftware: TCollection_HAsciiString
aIntendedAnalysisCode: TColStd_HArray1OfAsciiString
aDescription: TCollection_HAsciiString
aAnalysisType: TCollection_HAsciiString

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aRepresentation_Name, const opencascade::handle<StepRepr_HArray1OfRepresentationItem> & aRepresentation_Items, const opencascade::handle<StepRepr_RepresentationContext> & aRepresentation_ContextOfItems, const opencascade::handle<TCollection_HAsciiString> & aCreatingSoftware, const opencascade::handle<TColStd_HArray1OfAsciiString> & aIntendedAnalysisCode, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<TCollection_HAsciiString> & aAnalysisType);

		/****** StepFEA_FeaModel::IntendedAnalysisCode ******/
		/****** md5 signature: b876deca4ff3144dff91b7c160dfb700 ******/
		%feature("compactdefaultargs") IntendedAnalysisCode;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfAsciiString>

Description
-----------
Returns field IntendedAnalysisCode.
") IntendedAnalysisCode;
		opencascade::handle<TColStd_HArray1OfAsciiString> IntendedAnalysisCode();

		/****** StepFEA_FeaModel::SetAnalysisType ******/
		/****** md5 signature: 282ac51345b486c6089e9b3028e07375 ******/
		%feature("compactdefaultargs") SetAnalysisType;
		%feature("autodoc", "
Parameters
----------
AnalysisType: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field AnalysisType.
") SetAnalysisType;
		void SetAnalysisType(const opencascade::handle<TCollection_HAsciiString> & AnalysisType);

		/****** StepFEA_FeaModel::SetCreatingSoftware ******/
		/****** md5 signature: e37360f58e85a1556de01677f3500503 ******/
		%feature("compactdefaultargs") SetCreatingSoftware;
		%feature("autodoc", "
Parameters
----------
CreatingSoftware: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field CreatingSoftware.
") SetCreatingSoftware;
		void SetCreatingSoftware(const opencascade::handle<TCollection_HAsciiString> & CreatingSoftware);

		/****** StepFEA_FeaModel::SetDescription ******/
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

		/****** StepFEA_FeaModel::SetIntendedAnalysisCode ******/
		/****** md5 signature: 2adf9c4c5d9dbf7b11b374d648e86a15 ******/
		%feature("compactdefaultargs") SetIntendedAnalysisCode;
		%feature("autodoc", "
Parameters
----------
IntendedAnalysisCode: TColStd_HArray1OfAsciiString

Return
-------
None

Description
-----------
Set field IntendedAnalysisCode.
") SetIntendedAnalysisCode;
		void SetIntendedAnalysisCode(const opencascade::handle<TColStd_HArray1OfAsciiString> & IntendedAnalysisCode);

};


%make_alias(StepFEA_FeaModel)

%extend StepFEA_FeaModel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class StepFEA_FeaModelDefinition *
***********************************/
class StepFEA_FeaModelDefinition : public StepRepr_ShapeAspect {
	public:
		/****** StepFEA_FeaModelDefinition::StepFEA_FeaModelDefinition ******/
		/****** md5 signature: 474fe4a09c092a58314ebd5a4ac68e1d ******/
		%feature("compactdefaultargs") StepFEA_FeaModelDefinition;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_FeaModelDefinition;
		 StepFEA_FeaModelDefinition();

};


%make_alias(StepFEA_FeaModelDefinition)

%extend StepFEA_FeaModelDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class StepFEA_FeaParametricPoint *
***********************************/
class StepFEA_FeaParametricPoint : public StepGeom_Point {
	public:
		/****** StepFEA_FeaParametricPoint::StepFEA_FeaParametricPoint ******/
		/****** md5 signature: e3ee57b3d860e9f54bd7e67fa33b7ce1 ******/
		%feature("compactdefaultargs") StepFEA_FeaParametricPoint;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_FeaParametricPoint;
		 StepFEA_FeaParametricPoint();

		/****** StepFEA_FeaParametricPoint::Coordinates ******/
		/****** md5 signature: 44a2ea0d78b9f0cc257a20935c1d21b3 ******/
		%feature("compactdefaultargs") Coordinates;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
Returns field Coordinates.
") Coordinates;
		opencascade::handle<TColStd_HArray1OfReal> Coordinates();

		/****** StepFEA_FeaParametricPoint::Init ******/
		/****** md5 signature: b4d1c72b254cb89d39e73ab4a2c2794a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aRepresentationItem_Name: TCollection_HAsciiString
aCoordinates: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name, const opencascade::handle<TColStd_HArray1OfReal> & aCoordinates);

		/****** StepFEA_FeaParametricPoint::SetCoordinates ******/
		/****** md5 signature: 373ea7300545bce672f1d1c1c267e182 ******/
		%feature("compactdefaultargs") SetCoordinates;
		%feature("autodoc", "
Parameters
----------
Coordinates: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
Set field Coordinates.
") SetCoordinates;
		void SetCoordinates(const opencascade::handle<TColStd_HArray1OfReal> & Coordinates);

};


%make_alias(StepFEA_FeaParametricPoint)

%extend StepFEA_FeaParametricPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class StepFEA_FeaRepresentationItem *
**************************************/
class StepFEA_FeaRepresentationItem : public StepRepr_RepresentationItem {
	public:
		/****** StepFEA_FeaRepresentationItem::StepFEA_FeaRepresentationItem ******/
		/****** md5 signature: 58bb155f4fbb708798ca2e5a53c1dc36 ******/
		%feature("compactdefaultargs") StepFEA_FeaRepresentationItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_FeaRepresentationItem;
		 StepFEA_FeaRepresentationItem();

};


%make_alias(StepFEA_FeaRepresentationItem)

%extend StepFEA_FeaRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************************
* class StepFEA_FeaSurfaceSectionGeometricRelationship *
*******************************************************/
class StepFEA_FeaSurfaceSectionGeometricRelationship : public Standard_Transient {
	public:
		/****** StepFEA_FeaSurfaceSectionGeometricRelationship::StepFEA_FeaSurfaceSectionGeometricRelationship ******/
		/****** md5 signature: e1330e2909261dc99467b893f425ae1c ******/
		%feature("compactdefaultargs") StepFEA_FeaSurfaceSectionGeometricRelationship;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_FeaSurfaceSectionGeometricRelationship;
		 StepFEA_FeaSurfaceSectionGeometricRelationship();

		/****** StepFEA_FeaSurfaceSectionGeometricRelationship::Init ******/
		/****** md5 signature: f02f12da51b5f2eb32b49b0b4b06ab5c ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aSectionRef: StepElement_SurfaceSection
aItem: StepElement_AnalysisItemWithinRepresentation

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<StepElement_SurfaceSection> & aSectionRef, const opencascade::handle<StepElement_AnalysisItemWithinRepresentation> & aItem);

		/****** StepFEA_FeaSurfaceSectionGeometricRelationship::Item ******/
		/****** md5 signature: b253a19c4ee018e419eb42364512210b ******/
		%feature("compactdefaultargs") Item;
		%feature("autodoc", "Return
-------
opencascade::handle<StepElement_AnalysisItemWithinRepresentation>

Description
-----------
Returns field Item.
") Item;
		opencascade::handle<StepElement_AnalysisItemWithinRepresentation> Item();

		/****** StepFEA_FeaSurfaceSectionGeometricRelationship::SectionRef ******/
		/****** md5 signature: 493894676b93c08fa0f0e8ac16f82d19 ******/
		%feature("compactdefaultargs") SectionRef;
		%feature("autodoc", "Return
-------
opencascade::handle<StepElement_SurfaceSection>

Description
-----------
Returns field SectionRef.
") SectionRef;
		opencascade::handle<StepElement_SurfaceSection> SectionRef();

		/****** StepFEA_FeaSurfaceSectionGeometricRelationship::SetItem ******/
		/****** md5 signature: 6c8dcc5a597631cd78ea60f9829f8e90 ******/
		%feature("compactdefaultargs") SetItem;
		%feature("autodoc", "
Parameters
----------
Item: StepElement_AnalysisItemWithinRepresentation

Return
-------
None

Description
-----------
Set field Item.
") SetItem;
		void SetItem(const opencascade::handle<StepElement_AnalysisItemWithinRepresentation> & Item);

		/****** StepFEA_FeaSurfaceSectionGeometricRelationship::SetSectionRef ******/
		/****** md5 signature: 40f843f7ef7c4b0ef5df735112bd322c ******/
		%feature("compactdefaultargs") SetSectionRef;
		%feature("autodoc", "
Parameters
----------
SectionRef: StepElement_SurfaceSection

Return
-------
None

Description
-----------
Set field SectionRef.
") SetSectionRef;
		void SetSectionRef(const opencascade::handle<StepElement_SurfaceSection> & SectionRef);

};


%make_alias(StepFEA_FeaSurfaceSectionGeometricRelationship)

%extend StepFEA_FeaSurfaceSectionGeometricRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class StepFEA_FreedomAndCoefficient *
**************************************/
class StepFEA_FreedomAndCoefficient : public Standard_Transient {
	public:
		/****** StepFEA_FreedomAndCoefficient::StepFEA_FreedomAndCoefficient ******/
		/****** md5 signature: 4d208a269d8774a99d2fa369d1e5c504 ******/
		%feature("compactdefaultargs") StepFEA_FreedomAndCoefficient;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_FreedomAndCoefficient;
		 StepFEA_FreedomAndCoefficient();

		/****** StepFEA_FreedomAndCoefficient::A ******/
		/****** md5 signature: c14b1e99ce51954d33425673672b2a3c ******/
		%feature("compactdefaultargs") A;
		%feature("autodoc", "Return
-------
StepElement_MeasureOrUnspecifiedValue

Description
-----------
Returns field A.
") A;
		StepElement_MeasureOrUnspecifiedValue A();

		/****** StepFEA_FreedomAndCoefficient::Freedom ******/
		/****** md5 signature: 3e3fddeb6522c80dce5598d1c72630a8 ******/
		%feature("compactdefaultargs") Freedom;
		%feature("autodoc", "Return
-------
StepFEA_DegreeOfFreedom

Description
-----------
Returns field Freedom.
") Freedom;
		StepFEA_DegreeOfFreedom Freedom();

		/****** StepFEA_FreedomAndCoefficient::Init ******/
		/****** md5 signature: e7c9c0078f6255345e1c662e05c5a0cc ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aFreedom: StepFEA_DegreeOfFreedom
aA: StepElement_MeasureOrUnspecifiedValue

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const StepFEA_DegreeOfFreedom & aFreedom, const StepElement_MeasureOrUnspecifiedValue & aA);

		/****** StepFEA_FreedomAndCoefficient::SetA ******/
		/****** md5 signature: c2918ddc101b25eba5cd625ed80dc647 ******/
		%feature("compactdefaultargs") SetA;
		%feature("autodoc", "
Parameters
----------
A: StepElement_MeasureOrUnspecifiedValue

Return
-------
None

Description
-----------
Set field A.
") SetA;
		void SetA(const StepElement_MeasureOrUnspecifiedValue & A);

		/****** StepFEA_FreedomAndCoefficient::SetFreedom ******/
		/****** md5 signature: 061a4f841cb23b6b89d08962b1710f4a ******/
		%feature("compactdefaultargs") SetFreedom;
		%feature("autodoc", "
Parameters
----------
Freedom: StepFEA_DegreeOfFreedom

Return
-------
None

Description
-----------
Set field Freedom.
") SetFreedom;
		void SetFreedom(const StepFEA_DegreeOfFreedom & Freedom);

};


%make_alias(StepFEA_FreedomAndCoefficient)

%extend StepFEA_FreedomAndCoefficient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class StepFEA_FreedomsList *
*****************************/
class StepFEA_FreedomsList : public Standard_Transient {
	public:
		/****** StepFEA_FreedomsList::StepFEA_FreedomsList ******/
		/****** md5 signature: 4befaf30492dd7191f32a9f774b1b2b9 ******/
		%feature("compactdefaultargs") StepFEA_FreedomsList;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_FreedomsList;
		 StepFEA_FreedomsList();

		/****** StepFEA_FreedomsList::Freedoms ******/
		/****** md5 signature: 49a0990ebe57f8fc5be6eb57fd3d4787 ******/
		%feature("compactdefaultargs") Freedoms;
		%feature("autodoc", "Return
-------
opencascade::handle<StepFEA_HArray1OfDegreeOfFreedom>

Description
-----------
Returns field Freedoms.
") Freedoms;
		opencascade::handle<StepFEA_HArray1OfDegreeOfFreedom> Freedoms();

		/****** StepFEA_FreedomsList::Init ******/
		/****** md5 signature: 4fc3faa229b7f5d307c6077cd00f6acd ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aFreedoms: StepFEA_HArray1OfDegreeOfFreedom

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<StepFEA_HArray1OfDegreeOfFreedom> & aFreedoms);

		/****** StepFEA_FreedomsList::SetFreedoms ******/
		/****** md5 signature: 14b443dec11baaa6e729ae1aea8a900b ******/
		%feature("compactdefaultargs") SetFreedoms;
		%feature("autodoc", "
Parameters
----------
Freedoms: StepFEA_HArray1OfDegreeOfFreedom

Return
-------
None

Description
-----------
Set field Freedoms.
") SetFreedoms;
		void SetFreedoms(const opencascade::handle<StepFEA_HArray1OfDegreeOfFreedom> & Freedoms);

};


%make_alias(StepFEA_FreedomsList)

%extend StepFEA_FreedomsList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class StepFEA_NodeDefinition *
*******************************/
class StepFEA_NodeDefinition : public StepRepr_ShapeAspect {
	public:
		/****** StepFEA_NodeDefinition::StepFEA_NodeDefinition ******/
		/****** md5 signature: 0c8067a6dde12299e7ba82a83583e24c ******/
		%feature("compactdefaultargs") StepFEA_NodeDefinition;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_NodeDefinition;
		 StepFEA_NodeDefinition();

};


%make_alias(StepFEA_NodeDefinition)

%extend StepFEA_NodeDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class StepFEA_NodeRepresentation *
***********************************/
class StepFEA_NodeRepresentation : public StepRepr_Representation {
	public:
		/****** StepFEA_NodeRepresentation::StepFEA_NodeRepresentation ******/
		/****** md5 signature: e06ef9a1c02f08b9912002ae3ca73f9a ******/
		%feature("compactdefaultargs") StepFEA_NodeRepresentation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_NodeRepresentation;
		 StepFEA_NodeRepresentation();

		/****** StepFEA_NodeRepresentation::Init ******/
		/****** md5 signature: 80a74a084367634bb8be5e3eb9a159d3 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aRepresentation_Name: TCollection_HAsciiString
aRepresentation_Items: StepRepr_HArray1OfRepresentationItem
aRepresentation_ContextOfItems: StepRepr_RepresentationContext
aModelRef: StepFEA_FeaModel

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aRepresentation_Name, const opencascade::handle<StepRepr_HArray1OfRepresentationItem> & aRepresentation_Items, const opencascade::handle<StepRepr_RepresentationContext> & aRepresentation_ContextOfItems, const opencascade::handle<StepFEA_FeaModel> & aModelRef);

		/****** StepFEA_NodeRepresentation::ModelRef ******/
		/****** md5 signature: 7c456eca97f01da8f37fdaf738a476d8 ******/
		%feature("compactdefaultargs") ModelRef;
		%feature("autodoc", "Return
-------
opencascade::handle<StepFEA_FeaModel>

Description
-----------
Returns field ModelRef.
") ModelRef;
		opencascade::handle<StepFEA_FeaModel> ModelRef();

		/****** StepFEA_NodeRepresentation::SetModelRef ******/
		/****** md5 signature: a4b9fcc357b0e079d1e7cb8ecfdce31c ******/
		%feature("compactdefaultargs") SetModelRef;
		%feature("autodoc", "
Parameters
----------
ModelRef: StepFEA_FeaModel

Return
-------
None

Description
-----------
Set field ModelRef.
") SetModelRef;
		void SetModelRef(const opencascade::handle<StepFEA_FeaModel> & ModelRef);

};


%make_alias(StepFEA_NodeRepresentation)

%extend StepFEA_NodeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class StepFEA_NodeSet *
************************/
class StepFEA_NodeSet : public StepGeom_GeometricRepresentationItem {
	public:
		/****** StepFEA_NodeSet::StepFEA_NodeSet ******/
		/****** md5 signature: d579bccc327737a1551bc018ce353fbc ******/
		%feature("compactdefaultargs") StepFEA_NodeSet;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_NodeSet;
		 StepFEA_NodeSet();

		/****** StepFEA_NodeSet::Init ******/
		/****** md5 signature: 1c1e288126447f0bae60a4495b7fd864 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aRepresentationItem_Name: TCollection_HAsciiString
aNodes: StepFEA_HArray1OfNodeRepresentation

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name, const opencascade::handle<StepFEA_HArray1OfNodeRepresentation> & aNodes);

		/****** StepFEA_NodeSet::Nodes ******/
		/****** md5 signature: 481dfe329e415e43ffa39c24840aa086 ******/
		%feature("compactdefaultargs") Nodes;
		%feature("autodoc", "Return
-------
opencascade::handle<StepFEA_HArray1OfNodeRepresentation>

Description
-----------
Returns field Nodes.
") Nodes;
		opencascade::handle<StepFEA_HArray1OfNodeRepresentation> Nodes();

		/****** StepFEA_NodeSet::SetNodes ******/
		/****** md5 signature: d91f98e9b19dce0d990e0fc877dbb9f0 ******/
		%feature("compactdefaultargs") SetNodes;
		%feature("autodoc", "
Parameters
----------
Nodes: StepFEA_HArray1OfNodeRepresentation

Return
-------
None

Description
-----------
Set field Nodes.
") SetNodes;
		void SetNodes(const opencascade::handle<StepFEA_HArray1OfNodeRepresentation> & Nodes);

};


%make_alias(StepFEA_NodeSet)

%extend StepFEA_NodeSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class StepFEA_SymmetricTensor22d *
***********************************/
class StepFEA_SymmetricTensor22d : public StepData_SelectType {
	public:
		/****** StepFEA_SymmetricTensor22d::StepFEA_SymmetricTensor22d ******/
		/****** md5 signature: 8e9a041926fad44763e60d111b1d6137 ******/
		%feature("compactdefaultargs") StepFEA_SymmetricTensor22d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_SymmetricTensor22d;
		 StepFEA_SymmetricTensor22d();

		/****** StepFEA_SymmetricTensor22d::AnisotropicSymmetricTensor22d ******/
		/****** md5 signature: c8737641a805875df5a0cab40e284c75 ******/
		%feature("compactdefaultargs") AnisotropicSymmetricTensor22d;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
Returns Value as AnisotropicSymmetricTensor22d (or Null if another type).
") AnisotropicSymmetricTensor22d;
		opencascade::handle<TColStd_HArray1OfReal> AnisotropicSymmetricTensor22d();

		/****** StepFEA_SymmetricTensor22d::CaseNum ******/
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
Recognizes a kind of SymmetricTensor22d select type 1 -> HArray1OfReal from TColStd 0 else.
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

};


%extend StepFEA_SymmetricTensor22d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class StepFEA_SymmetricTensor23d *
***********************************/
class StepFEA_SymmetricTensor23d : public StepData_SelectType {
	public:
		/****** StepFEA_SymmetricTensor23d::StepFEA_SymmetricTensor23d ******/
		/****** md5 signature: c8b6af1a7f07e2cbc357d1dc3ef43d75 ******/
		%feature("compactdefaultargs") StepFEA_SymmetricTensor23d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_SymmetricTensor23d;
		 StepFEA_SymmetricTensor23d();

		/****** StepFEA_SymmetricTensor23d::AnisotropicSymmetricTensor23d ******/
		/****** md5 signature: 00e533416c2e7620b0fcc77c26020a45 ******/
		%feature("compactdefaultargs") AnisotropicSymmetricTensor23d;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
Returns Value as AnisotropicSymmetricTensor23d (or Null if another type).
") AnisotropicSymmetricTensor23d;
		opencascade::handle<TColStd_HArray1OfReal> AnisotropicSymmetricTensor23d();

		/****** StepFEA_SymmetricTensor23d::CaseMem ******/
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
Recognizes a items of select member SymmetricTensor23dMember 1 -> IsotropicSymmetricTensor23d 2 -> OrthotropicSymmetricTensor23d 3 -> AnisotropicSymmetricTensor23d 0 else.
") CaseMem;
		virtual Standard_Integer CaseMem(const opencascade::handle<StepData_SelectMember> & ent);

		/****** StepFEA_SymmetricTensor23d::CaseNum ******/
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
Recognizes a kind of SymmetricTensor23d select type return 0.
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepFEA_SymmetricTensor23d::IsotropicSymmetricTensor23d ******/
		/****** md5 signature: 83420dcb027550bf001991caebc9c853 ******/
		%feature("compactdefaultargs") IsotropicSymmetricTensor23d;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns Value as IsotropicSymmetricTensor23d (or Null if another type).
") IsotropicSymmetricTensor23d;
		Standard_Real IsotropicSymmetricTensor23d();

		/****** StepFEA_SymmetricTensor23d::NewMember ******/
		/****** md5 signature: ae7a49ea52744ae449d83e823e9a6da7 ******/
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", "Return
-------
opencascade::handle<StepData_SelectMember>

Description
-----------
Returns a new select member the type SymmetricTensor23dMember.
") NewMember;
		virtual opencascade::handle<StepData_SelectMember> NewMember();

		/****** StepFEA_SymmetricTensor23d::OrthotropicSymmetricTensor23d ******/
		/****** md5 signature: 6382f29ac1f364b69a9bb468ff1e2006 ******/
		%feature("compactdefaultargs") OrthotropicSymmetricTensor23d;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
Returns Value as OrthotropicSymmetricTensor23d (or Null if another type).
") OrthotropicSymmetricTensor23d;
		opencascade::handle<TColStd_HArray1OfReal> OrthotropicSymmetricTensor23d();

		/****** StepFEA_SymmetricTensor23d::SetAnisotropicSymmetricTensor23d ******/
		/****** md5 signature: e40c073b455c5732376b091cb8761634 ******/
		%feature("compactdefaultargs") SetAnisotropicSymmetricTensor23d;
		%feature("autodoc", "
Parameters
----------
aVal: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
Set Value for AnisotropicSymmetricTensor23d.
") SetAnisotropicSymmetricTensor23d;
		void SetAnisotropicSymmetricTensor23d(const opencascade::handle<TColStd_HArray1OfReal> & aVal);

		/****** StepFEA_SymmetricTensor23d::SetIsotropicSymmetricTensor23d ******/
		/****** md5 signature: 9a64a817ba73feb9252d4aa59cd9acd0 ******/
		%feature("compactdefaultargs") SetIsotropicSymmetricTensor23d;
		%feature("autodoc", "
Parameters
----------
aVal: float

Return
-------
None

Description
-----------
Set Value for IsotropicSymmetricTensor23d.
") SetIsotropicSymmetricTensor23d;
		void SetIsotropicSymmetricTensor23d(const Standard_Real aVal);

		/****** StepFEA_SymmetricTensor23d::SetOrthotropicSymmetricTensor23d ******/
		/****** md5 signature: 5e94e88fb5421e20b86bfb64aecb7d2d ******/
		%feature("compactdefaultargs") SetOrthotropicSymmetricTensor23d;
		%feature("autodoc", "
Parameters
----------
aVal: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
Set Value for OrthotropicSymmetricTensor23d.
") SetOrthotropicSymmetricTensor23d;
		void SetOrthotropicSymmetricTensor23d(const opencascade::handle<TColStd_HArray1OfReal> & aVal);

};


%extend StepFEA_SymmetricTensor23d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class StepFEA_SymmetricTensor23dMember *
*****************************************/
class StepFEA_SymmetricTensor23dMember : public StepData_SelectArrReal {
	public:
		/****** StepFEA_SymmetricTensor23dMember::StepFEA_SymmetricTensor23dMember ******/
		/****** md5 signature: af97c8e716cab6096a680c31b45ef40e ******/
		%feature("compactdefaultargs") StepFEA_SymmetricTensor23dMember;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_SymmetricTensor23dMember;
		 StepFEA_SymmetricTensor23dMember();

		/****** StepFEA_SymmetricTensor23dMember::HasName ******/
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

		/****** StepFEA_SymmetricTensor23dMember::Matches ******/
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

		/****** StepFEA_SymmetricTensor23dMember::Name ******/
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

		/****** StepFEA_SymmetricTensor23dMember::SetName ******/
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


%make_alias(StepFEA_SymmetricTensor23dMember)

%extend StepFEA_SymmetricTensor23dMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class StepFEA_SymmetricTensor42d *
***********************************/
class StepFEA_SymmetricTensor42d : public StepData_SelectType {
	public:
		/****** StepFEA_SymmetricTensor42d::StepFEA_SymmetricTensor42d ******/
		/****** md5 signature: 98bfc78aec4dd61316ce2f76b0d99c9b ******/
		%feature("compactdefaultargs") StepFEA_SymmetricTensor42d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_SymmetricTensor42d;
		 StepFEA_SymmetricTensor42d();

		/****** StepFEA_SymmetricTensor42d::AnisotropicSymmetricTensor42d ******/
		/****** md5 signature: 03de402b9c1011dd62cca1dc7d775153 ******/
		%feature("compactdefaultargs") AnisotropicSymmetricTensor42d;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
Returns Value as AnisotropicSymmetricTensor42d (or Null if another type).
") AnisotropicSymmetricTensor42d;
		opencascade::handle<TColStd_HArray1OfReal> AnisotropicSymmetricTensor42d();

		/****** StepFEA_SymmetricTensor42d::CaseNum ******/
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
Recognizes a kind of SymmetricTensor42d select type 1 -> HArray1OfReal from TColStd 0 else.
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

};


%extend StepFEA_SymmetricTensor42d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class StepFEA_SymmetricTensor43d *
***********************************/
class StepFEA_SymmetricTensor43d : public StepData_SelectType {
	public:
		/****** StepFEA_SymmetricTensor43d::StepFEA_SymmetricTensor43d ******/
		/****** md5 signature: 83297f5c4b7cb4162536442783aa8bc9 ******/
		%feature("compactdefaultargs") StepFEA_SymmetricTensor43d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_SymmetricTensor43d;
		 StepFEA_SymmetricTensor43d();

		/****** StepFEA_SymmetricTensor43d::AnisotropicSymmetricTensor43d ******/
		/****** md5 signature: 470e718b9d67f67eecc3ee0e244362de ******/
		%feature("compactdefaultargs") AnisotropicSymmetricTensor43d;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
Returns Value as AnisotropicSymmetricTensor43d (or Null if another type).
") AnisotropicSymmetricTensor43d;
		opencascade::handle<TColStd_HArray1OfReal> AnisotropicSymmetricTensor43d();

		/****** StepFEA_SymmetricTensor43d::CaseMem ******/
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
Recognizes a items of select member CurveElementFreedomMember 1 -> AnisotropicSymmetricTensor43d 2 -> FeaIsotropicSymmetricTensor43d 3 -> FeaIsoOrthotropicSymmetricTensor43d 4 -> FeaTransverseIsotropicSymmetricTensor43d 5 -> FeaColumnNormalisedOrthotropicSymmetricTensor43d 6 -> FeaColumnNormalisedMonoclinicSymmetricTensor43d 0 else.
") CaseMem;
		virtual Standard_Integer CaseMem(const opencascade::handle<StepData_SelectMember> & ent);

		/****** StepFEA_SymmetricTensor43d::CaseNum ******/
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
return 0.
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepFEA_SymmetricTensor43d::FeaColumnNormalisedMonoclinicSymmetricTensor43d ******/
		/****** md5 signature: 3d0de2c3d1bc3d16ad76cb540b3b991b ******/
		%feature("compactdefaultargs") FeaColumnNormalisedMonoclinicSymmetricTensor43d;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
Returns Value as FeaColumnNormalisedMonoclinicSymmetricTensor43d (or Null if another type).
") FeaColumnNormalisedMonoclinicSymmetricTensor43d;
		opencascade::handle<TColStd_HArray1OfReal> FeaColumnNormalisedMonoclinicSymmetricTensor43d();

		/****** StepFEA_SymmetricTensor43d::FeaColumnNormalisedOrthotropicSymmetricTensor43d ******/
		/****** md5 signature: f4c71fd6965f2f2d868ba68f0bbe4613 ******/
		%feature("compactdefaultargs") FeaColumnNormalisedOrthotropicSymmetricTensor43d;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
Returns Value as FeaColumnNormalisedOrthotropicSymmetricTensor43d (or Null if another type).
") FeaColumnNormalisedOrthotropicSymmetricTensor43d;
		opencascade::handle<TColStd_HArray1OfReal> FeaColumnNormalisedOrthotropicSymmetricTensor43d();

		/****** StepFEA_SymmetricTensor43d::FeaIsoOrthotropicSymmetricTensor43d ******/
		/****** md5 signature: 15b787ce4ffce83231d4b721e6d71794 ******/
		%feature("compactdefaultargs") FeaIsoOrthotropicSymmetricTensor43d;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
Returns Value as FeaIsoOrthotropicSymmetricTensor43d (or Null if another type).
") FeaIsoOrthotropicSymmetricTensor43d;
		opencascade::handle<TColStd_HArray1OfReal> FeaIsoOrthotropicSymmetricTensor43d();

		/****** StepFEA_SymmetricTensor43d::FeaIsotropicSymmetricTensor43d ******/
		/****** md5 signature: 5e40182c5184c6b22c7f565211f13286 ******/
		%feature("compactdefaultargs") FeaIsotropicSymmetricTensor43d;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
Returns Value as FeaIsotropicSymmetricTensor43d (or Null if another type).
") FeaIsotropicSymmetricTensor43d;
		opencascade::handle<TColStd_HArray1OfReal> FeaIsotropicSymmetricTensor43d();

		/****** StepFEA_SymmetricTensor43d::FeaTransverseIsotropicSymmetricTensor43d ******/
		/****** md5 signature: db736e1f696952a446c03f921f7ce584 ******/
		%feature("compactdefaultargs") FeaTransverseIsotropicSymmetricTensor43d;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
Returns Value as FeaTransverseIsotropicSymmetricTensor43d (or Null if another type).
") FeaTransverseIsotropicSymmetricTensor43d;
		opencascade::handle<TColStd_HArray1OfReal> FeaTransverseIsotropicSymmetricTensor43d();

		/****** StepFEA_SymmetricTensor43d::NewMember ******/
		/****** md5 signature: ae7a49ea52744ae449d83e823e9a6da7 ******/
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", "Return
-------
opencascade::handle<StepData_SelectMember>

Description
-----------
No available documentation.
") NewMember;
		virtual opencascade::handle<StepData_SelectMember> NewMember();

};


%extend StepFEA_SymmetricTensor43d {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def SetFeaIsotropicSymmetricTensor43d(self):
		pass
	}
};

/*****************************************
* class StepFEA_SymmetricTensor43dMember *
*****************************************/
class StepFEA_SymmetricTensor43dMember : public StepData_SelectArrReal {
	public:
		/****** StepFEA_SymmetricTensor43dMember::StepFEA_SymmetricTensor43dMember ******/
		/****** md5 signature: e751972448b6eaa998a614dbbca92a22 ******/
		%feature("compactdefaultargs") StepFEA_SymmetricTensor43dMember;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_SymmetricTensor43dMember;
		 StepFEA_SymmetricTensor43dMember();

		/****** StepFEA_SymmetricTensor43dMember::HasName ******/
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

		/****** StepFEA_SymmetricTensor43dMember::Matches ******/
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

		/****** StepFEA_SymmetricTensor43dMember::Name ******/
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

		/****** StepFEA_SymmetricTensor43dMember::SetName ******/
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


%make_alias(StepFEA_SymmetricTensor43dMember)

%extend StepFEA_SymmetricTensor43dMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************************
* class StepFEA_AlignedCurve3dElementCoordinateSystem *
******************************************************/
class StepFEA_AlignedCurve3dElementCoordinateSystem : public StepFEA_FeaRepresentationItem {
	public:
		/****** StepFEA_AlignedCurve3dElementCoordinateSystem::StepFEA_AlignedCurve3dElementCoordinateSystem ******/
		/****** md5 signature: 62eaf5d317b9b694651b8037771ce967 ******/
		%feature("compactdefaultargs") StepFEA_AlignedCurve3dElementCoordinateSystem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_AlignedCurve3dElementCoordinateSystem;
		 StepFEA_AlignedCurve3dElementCoordinateSystem();

		/****** StepFEA_AlignedCurve3dElementCoordinateSystem::CoordinateSystem ******/
		/****** md5 signature: 4be50b476778536461864711aea5b088 ******/
		%feature("compactdefaultargs") CoordinateSystem;
		%feature("autodoc", "Return
-------
opencascade::handle<StepFEA_FeaAxis2Placement3d>

Description
-----------
Returns field CoordinateSystem.
") CoordinateSystem;
		opencascade::handle<StepFEA_FeaAxis2Placement3d> CoordinateSystem();

		/****** StepFEA_AlignedCurve3dElementCoordinateSystem::Init ******/
		/****** md5 signature: afb804ec7043729372ca182dd151a4aa ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aRepresentationItem_Name: TCollection_HAsciiString
aCoordinateSystem: StepFEA_FeaAxis2Placement3d

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name, const opencascade::handle<StepFEA_FeaAxis2Placement3d> & aCoordinateSystem);

		/****** StepFEA_AlignedCurve3dElementCoordinateSystem::SetCoordinateSystem ******/
		/****** md5 signature: 31ee548bab8063d28c1e8e9bb1c205a1 ******/
		%feature("compactdefaultargs") SetCoordinateSystem;
		%feature("autodoc", "
Parameters
----------
CoordinateSystem: StepFEA_FeaAxis2Placement3d

Return
-------
None

Description
-----------
Set field CoordinateSystem.
") SetCoordinateSystem;
		void SetCoordinateSystem(const opencascade::handle<StepFEA_FeaAxis2Placement3d> & CoordinateSystem);

};


%make_alias(StepFEA_AlignedCurve3dElementCoordinateSystem)

%extend StepFEA_AlignedCurve3dElementCoordinateSystem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************************
* class StepFEA_AlignedSurface3dElementCoordinateSystem *
********************************************************/
class StepFEA_AlignedSurface3dElementCoordinateSystem : public StepFEA_FeaRepresentationItem {
	public:
		/****** StepFEA_AlignedSurface3dElementCoordinateSystem::StepFEA_AlignedSurface3dElementCoordinateSystem ******/
		/****** md5 signature: bed7b1f06e0a5de1e765d56f7240eff0 ******/
		%feature("compactdefaultargs") StepFEA_AlignedSurface3dElementCoordinateSystem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_AlignedSurface3dElementCoordinateSystem;
		 StepFEA_AlignedSurface3dElementCoordinateSystem();

		/****** StepFEA_AlignedSurface3dElementCoordinateSystem::CoordinateSystem ******/
		/****** md5 signature: 4be50b476778536461864711aea5b088 ******/
		%feature("compactdefaultargs") CoordinateSystem;
		%feature("autodoc", "Return
-------
opencascade::handle<StepFEA_FeaAxis2Placement3d>

Description
-----------
Returns field CoordinateSystem.
") CoordinateSystem;
		opencascade::handle<StepFEA_FeaAxis2Placement3d> CoordinateSystem();

		/****** StepFEA_AlignedSurface3dElementCoordinateSystem::Init ******/
		/****** md5 signature: afb804ec7043729372ca182dd151a4aa ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aRepresentationItem_Name: TCollection_HAsciiString
aCoordinateSystem: StepFEA_FeaAxis2Placement3d

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name, const opencascade::handle<StepFEA_FeaAxis2Placement3d> & aCoordinateSystem);

		/****** StepFEA_AlignedSurface3dElementCoordinateSystem::SetCoordinateSystem ******/
		/****** md5 signature: 31ee548bab8063d28c1e8e9bb1c205a1 ******/
		%feature("compactdefaultargs") SetCoordinateSystem;
		%feature("autodoc", "
Parameters
----------
CoordinateSystem: StepFEA_FeaAxis2Placement3d

Return
-------
None

Description
-----------
Set field CoordinateSystem.
") SetCoordinateSystem;
		void SetCoordinateSystem(const opencascade::handle<StepFEA_FeaAxis2Placement3d> & CoordinateSystem);

};


%make_alias(StepFEA_AlignedSurface3dElementCoordinateSystem)

%extend StepFEA_AlignedSurface3dElementCoordinateSystem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************************
* class StepFEA_ArbitraryVolume3dElementCoordinateSystem *
*********************************************************/
class StepFEA_ArbitraryVolume3dElementCoordinateSystem : public StepFEA_FeaRepresentationItem {
	public:
		/****** StepFEA_ArbitraryVolume3dElementCoordinateSystem::StepFEA_ArbitraryVolume3dElementCoordinateSystem ******/
		/****** md5 signature: bce3ffe400e26a850550b1bfdb23f3e7 ******/
		%feature("compactdefaultargs") StepFEA_ArbitraryVolume3dElementCoordinateSystem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_ArbitraryVolume3dElementCoordinateSystem;
		 StepFEA_ArbitraryVolume3dElementCoordinateSystem();

		/****** StepFEA_ArbitraryVolume3dElementCoordinateSystem::CoordinateSystem ******/
		/****** md5 signature: 4be50b476778536461864711aea5b088 ******/
		%feature("compactdefaultargs") CoordinateSystem;
		%feature("autodoc", "Return
-------
opencascade::handle<StepFEA_FeaAxis2Placement3d>

Description
-----------
Returns field CoordinateSystem.
") CoordinateSystem;
		opencascade::handle<StepFEA_FeaAxis2Placement3d> CoordinateSystem();

		/****** StepFEA_ArbitraryVolume3dElementCoordinateSystem::Init ******/
		/****** md5 signature: afb804ec7043729372ca182dd151a4aa ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aRepresentationItem_Name: TCollection_HAsciiString
aCoordinateSystem: StepFEA_FeaAxis2Placement3d

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name, const opencascade::handle<StepFEA_FeaAxis2Placement3d> & aCoordinateSystem);

		/****** StepFEA_ArbitraryVolume3dElementCoordinateSystem::SetCoordinateSystem ******/
		/****** md5 signature: 31ee548bab8063d28c1e8e9bb1c205a1 ******/
		%feature("compactdefaultargs") SetCoordinateSystem;
		%feature("autodoc", "
Parameters
----------
CoordinateSystem: StepFEA_FeaAxis2Placement3d

Return
-------
None

Description
-----------
Set field CoordinateSystem.
") SetCoordinateSystem;
		void SetCoordinateSystem(const opencascade::handle<StepFEA_FeaAxis2Placement3d> & CoordinateSystem);

};


%make_alias(StepFEA_ArbitraryVolume3dElementCoordinateSystem)

%extend StepFEA_ArbitraryVolume3dElementCoordinateSystem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************************
* class StepFEA_ConstantSurface3dElementCoordinateSystem *
*********************************************************/
class StepFEA_ConstantSurface3dElementCoordinateSystem : public StepFEA_FeaRepresentationItem {
	public:
		/****** StepFEA_ConstantSurface3dElementCoordinateSystem::StepFEA_ConstantSurface3dElementCoordinateSystem ******/
		/****** md5 signature: 6609483cfaa0437c50ede3b8f3dc1e3d ******/
		%feature("compactdefaultargs") StepFEA_ConstantSurface3dElementCoordinateSystem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_ConstantSurface3dElementCoordinateSystem;
		 StepFEA_ConstantSurface3dElementCoordinateSystem();

		/****** StepFEA_ConstantSurface3dElementCoordinateSystem::Angle ******/
		/****** md5 signature: dce50192c350c43b54f2e88e94e5372a ******/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns field Angle.
") Angle;
		Standard_Real Angle();

		/****** StepFEA_ConstantSurface3dElementCoordinateSystem::Axis ******/
		/****** md5 signature: 8c835a38d257f157c4c499e54d099895 ******/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns field Axis.
") Axis;
		Standard_Integer Axis();

		/****** StepFEA_ConstantSurface3dElementCoordinateSystem::Init ******/
		/****** md5 signature: 8b71832374bcd7b3ed64bbf6e1497439 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aRepresentationItem_Name: TCollection_HAsciiString
aAxis: int
aAngle: float

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name, const Standard_Integer aAxis, const Standard_Real aAngle);

		/****** StepFEA_ConstantSurface3dElementCoordinateSystem::SetAngle ******/
		/****** md5 signature: a0d60e2a1ea25c193dafa15194b0ab24 ******/
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "
Parameters
----------
Angle: float

Return
-------
None

Description
-----------
Set field Angle.
") SetAngle;
		void SetAngle(const Standard_Real Angle);

		/****** StepFEA_ConstantSurface3dElementCoordinateSystem::SetAxis ******/
		/****** md5 signature: 2fce638761516dcb6b748e7c34206f1c ******/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "
Parameters
----------
Axis: int

Return
-------
None

Description
-----------
Set field Axis.
") SetAxis;
		void SetAxis(const Standard_Integer Axis);

};


%make_alias(StepFEA_ConstantSurface3dElementCoordinateSystem)

%extend StepFEA_ConstantSurface3dElementCoordinateSystem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class StepFEA_Curve3dElementRepresentation *
*********************************************/
class StepFEA_Curve3dElementRepresentation : public StepFEA_ElementRepresentation {
	public:
		/****** StepFEA_Curve3dElementRepresentation::StepFEA_Curve3dElementRepresentation ******/
		/****** md5 signature: af1a03eb9b9ff9403d14445f56b5e97e ******/
		%feature("compactdefaultargs") StepFEA_Curve3dElementRepresentation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_Curve3dElementRepresentation;
		 StepFEA_Curve3dElementRepresentation();

		/****** StepFEA_Curve3dElementRepresentation::ElementDescriptor ******/
		/****** md5 signature: 326335d00d94977496c1aecdc6586a5e ******/
		%feature("compactdefaultargs") ElementDescriptor;
		%feature("autodoc", "Return
-------
opencascade::handle<StepElement_Curve3dElementDescriptor>

Description
-----------
Returns field ElementDescriptor.
") ElementDescriptor;
		opencascade::handle<StepElement_Curve3dElementDescriptor> ElementDescriptor();

		/****** StepFEA_Curve3dElementRepresentation::Init ******/
		/****** md5 signature: f635ebc2c42d6f7bc4fe298211c408c9 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aRepresentation_Name: TCollection_HAsciiString
aRepresentation_Items: StepRepr_HArray1OfRepresentationItem
aRepresentation_ContextOfItems: StepRepr_RepresentationContext
aElementRepresentation_NodeList: StepFEA_HArray1OfNodeRepresentation
aModelRef: StepFEA_FeaModel3d
aElementDescriptor: StepElement_Curve3dElementDescriptor
aProperty: StepFEA_Curve3dElementProperty
aMaterial: StepElement_ElementMaterial

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aRepresentation_Name, const opencascade::handle<StepRepr_HArray1OfRepresentationItem> & aRepresentation_Items, const opencascade::handle<StepRepr_RepresentationContext> & aRepresentation_ContextOfItems, const opencascade::handle<StepFEA_HArray1OfNodeRepresentation> & aElementRepresentation_NodeList, const opencascade::handle<StepFEA_FeaModel3d> & aModelRef, const opencascade::handle<StepElement_Curve3dElementDescriptor> & aElementDescriptor, const opencascade::handle<StepFEA_Curve3dElementProperty> & aProperty, const opencascade::handle<StepElement_ElementMaterial> & aMaterial);

		/****** StepFEA_Curve3dElementRepresentation::Material ******/
		/****** md5 signature: d6c4d9812dbdfac4cc3b5047d6625c8d ******/
		%feature("compactdefaultargs") Material;
		%feature("autodoc", "Return
-------
opencascade::handle<StepElement_ElementMaterial>

Description
-----------
Returns field Material.
") Material;
		opencascade::handle<StepElement_ElementMaterial> Material();

		/****** StepFEA_Curve3dElementRepresentation::ModelRef ******/
		/****** md5 signature: 3396b3c3f41fca848f8edae9b26835a6 ******/
		%feature("compactdefaultargs") ModelRef;
		%feature("autodoc", "Return
-------
opencascade::handle<StepFEA_FeaModel3d>

Description
-----------
Returns field ModelRef.
") ModelRef;
		opencascade::handle<StepFEA_FeaModel3d> ModelRef();

		/****** StepFEA_Curve3dElementRepresentation::Property ******/
		/****** md5 signature: 5a9941b6dae6bb15f9e2ade12d6db982 ******/
		%feature("compactdefaultargs") Property;
		%feature("autodoc", "Return
-------
opencascade::handle<StepFEA_Curve3dElementProperty>

Description
-----------
Returns field Property.
") Property;
		opencascade::handle<StepFEA_Curve3dElementProperty> Property();

		/****** StepFEA_Curve3dElementRepresentation::SetElementDescriptor ******/
		/****** md5 signature: bf0cc124c2537ef241c5ac9c1d5b80e1 ******/
		%feature("compactdefaultargs") SetElementDescriptor;
		%feature("autodoc", "
Parameters
----------
ElementDescriptor: StepElement_Curve3dElementDescriptor

Return
-------
None

Description
-----------
Set field ElementDescriptor.
") SetElementDescriptor;
		void SetElementDescriptor(const opencascade::handle<StepElement_Curve3dElementDescriptor> & ElementDescriptor);

		/****** StepFEA_Curve3dElementRepresentation::SetMaterial ******/
		/****** md5 signature: 224016d312e5b2f0ec58641cb367214d ******/
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "
Parameters
----------
Material: StepElement_ElementMaterial

Return
-------
None

Description
-----------
Set field Material.
") SetMaterial;
		void SetMaterial(const opencascade::handle<StepElement_ElementMaterial> & Material);

		/****** StepFEA_Curve3dElementRepresentation::SetModelRef ******/
		/****** md5 signature: be7659867f17ff42d15420e4c343fc43 ******/
		%feature("compactdefaultargs") SetModelRef;
		%feature("autodoc", "
Parameters
----------
ModelRef: StepFEA_FeaModel3d

Return
-------
None

Description
-----------
Set field ModelRef.
") SetModelRef;
		void SetModelRef(const opencascade::handle<StepFEA_FeaModel3d> & ModelRef);

		/****** StepFEA_Curve3dElementRepresentation::SetProperty ******/
		/****** md5 signature: 37076f43b9f1daac3c5de735fa30ac64 ******/
		%feature("compactdefaultargs") SetProperty;
		%feature("autodoc", "
Parameters
----------
Property: StepFEA_Curve3dElementProperty

Return
-------
None

Description
-----------
Set field Property.
") SetProperty;
		void SetProperty(const opencascade::handle<StepFEA_Curve3dElementProperty> & Property);

};


%make_alias(StepFEA_Curve3dElementRepresentation)

%extend StepFEA_Curve3dElementRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class StepFEA_CurveElementIntervalConstant *
*********************************************/
class StepFEA_CurveElementIntervalConstant : public StepFEA_CurveElementInterval {
	public:
		/****** StepFEA_CurveElementIntervalConstant::StepFEA_CurveElementIntervalConstant ******/
		/****** md5 signature: 50d00fdfd5b6b139fa89587bee2e1db1 ******/
		%feature("compactdefaultargs") StepFEA_CurveElementIntervalConstant;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_CurveElementIntervalConstant;
		 StepFEA_CurveElementIntervalConstant();

		/****** StepFEA_CurveElementIntervalConstant::Init ******/
		/****** md5 signature: dd062143b7499e805b0062bf2fe497b7 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aCurveElementInterval_FinishPosition: StepFEA_CurveElementLocation
aCurveElementInterval_EuAngles: StepBasic_EulerAngles
aSection: StepElement_CurveElementSectionDefinition

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<StepFEA_CurveElementLocation> & aCurveElementInterval_FinishPosition, const opencascade::handle<StepBasic_EulerAngles> & aCurveElementInterval_EuAngles, const opencascade::handle<StepElement_CurveElementSectionDefinition> & aSection);

		/****** StepFEA_CurveElementIntervalConstant::Section ******/
		/****** md5 signature: d08d2b3ef59b8d73615b11e244a69402 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "Return
-------
opencascade::handle<StepElement_CurveElementSectionDefinition>

Description
-----------
Returns field Section.
") Section;
		opencascade::handle<StepElement_CurveElementSectionDefinition> Section();

		/****** StepFEA_CurveElementIntervalConstant::SetSection ******/
		/****** md5 signature: 9f09cbac0f3594d01c530a7fddd1533f ******/
		%feature("compactdefaultargs") SetSection;
		%feature("autodoc", "
Parameters
----------
Section: StepElement_CurveElementSectionDefinition

Return
-------
None

Description
-----------
Set field Section.
") SetSection;
		void SetSection(const opencascade::handle<StepElement_CurveElementSectionDefinition> & Section);

};


%make_alias(StepFEA_CurveElementIntervalConstant)

%extend StepFEA_CurveElementIntervalConstant {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************************
* class StepFEA_CurveElementIntervalLinearlyVarying *
****************************************************/
class StepFEA_CurveElementIntervalLinearlyVarying : public StepFEA_CurveElementInterval {
	public:
		/****** StepFEA_CurveElementIntervalLinearlyVarying::StepFEA_CurveElementIntervalLinearlyVarying ******/
		/****** md5 signature: 2ca7aa1db14d24d22bc668b83a5269e0 ******/
		%feature("compactdefaultargs") StepFEA_CurveElementIntervalLinearlyVarying;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_CurveElementIntervalLinearlyVarying;
		 StepFEA_CurveElementIntervalLinearlyVarying();

		/****** StepFEA_CurveElementIntervalLinearlyVarying::Init ******/
		/****** md5 signature: 6354189f461f32ff686e7faa86df8210 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aCurveElementInterval_FinishPosition: StepFEA_CurveElementLocation
aCurveElementInterval_EuAngles: StepBasic_EulerAngles
aSections: StepElement_HArray1OfCurveElementSectionDefinition

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<StepFEA_CurveElementLocation> & aCurveElementInterval_FinishPosition, const opencascade::handle<StepBasic_EulerAngles> & aCurveElementInterval_EuAngles, const opencascade::handle<StepElement_HArray1OfCurveElementSectionDefinition> & aSections);

		/****** StepFEA_CurveElementIntervalLinearlyVarying::Sections ******/
		/****** md5 signature: cf65681a8c80fd6de59bb2c317825fc2 ******/
		%feature("compactdefaultargs") Sections;
		%feature("autodoc", "Return
-------
opencascade::handle<StepElement_HArray1OfCurveElementSectionDefinition>

Description
-----------
Returns field Sections.
") Sections;
		opencascade::handle<StepElement_HArray1OfCurveElementSectionDefinition> Sections();

		/****** StepFEA_CurveElementIntervalLinearlyVarying::SetSections ******/
		/****** md5 signature: 2841d118c3e3dc6db822c18ee969beaf ******/
		%feature("compactdefaultargs") SetSections;
		%feature("autodoc", "
Parameters
----------
Sections: StepElement_HArray1OfCurveElementSectionDefinition

Return
-------
None

Description
-----------
Set field Sections.
") SetSections;
		void SetSections(const opencascade::handle<StepElement_HArray1OfCurveElementSectionDefinition> & Sections);

};


%make_alias(StepFEA_CurveElementIntervalLinearlyVarying)

%extend StepFEA_CurveElementIntervalLinearlyVarying {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class StepFEA_DummyNode *
**************************/
class StepFEA_DummyNode : public StepFEA_NodeRepresentation {
	public:
		/****** StepFEA_DummyNode::StepFEA_DummyNode ******/
		/****** md5 signature: 4d00c9eb2f2ee693c2a53e6018e01474 ******/
		%feature("compactdefaultargs") StepFEA_DummyNode;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_DummyNode;
		 StepFEA_DummyNode();

};


%make_alias(StepFEA_DummyNode)

%extend StepFEA_DummyNode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class StepFEA_ElementGroup *
*****************************/
class StepFEA_ElementGroup : public StepFEA_FeaGroup {
	public:
		/****** StepFEA_ElementGroup::StepFEA_ElementGroup ******/
		/****** md5 signature: 9c280295317ba2c1345728acf07010d9 ******/
		%feature("compactdefaultargs") StepFEA_ElementGroup;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_ElementGroup;
		 StepFEA_ElementGroup();

		/****** StepFEA_ElementGroup::Elements ******/
		/****** md5 signature: 930fdfb5ef3683baf2d1505dd41190ca ******/
		%feature("compactdefaultargs") Elements;
		%feature("autodoc", "Return
-------
opencascade::handle<StepFEA_HArray1OfElementRepresentation>

Description
-----------
Returns field Elements.
") Elements;
		opencascade::handle<StepFEA_HArray1OfElementRepresentation> Elements();

		/****** StepFEA_ElementGroup::Init ******/
		/****** md5 signature: 2912e09dfb19adec2ae9dd6051d21bb8 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aGroup_Name: TCollection_HAsciiString
aGroup_Description: TCollection_HAsciiString
aFeaGroup_ModelRef: StepFEA_FeaModel
aElements: StepFEA_HArray1OfElementRepresentation

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aGroup_Name, const opencascade::handle<TCollection_HAsciiString> & aGroup_Description, const opencascade::handle<StepFEA_FeaModel> & aFeaGroup_ModelRef, const opencascade::handle<StepFEA_HArray1OfElementRepresentation> & aElements);

		/****** StepFEA_ElementGroup::SetElements ******/
		/****** md5 signature: 9a2706a40fffabc639d0b74a209ad204 ******/
		%feature("compactdefaultargs") SetElements;
		%feature("autodoc", "
Parameters
----------
Elements: StepFEA_HArray1OfElementRepresentation

Return
-------
None

Description
-----------
Set field Elements.
") SetElements;
		void SetElements(const opencascade::handle<StepFEA_HArray1OfElementRepresentation> & Elements);

};


%make_alias(StepFEA_ElementGroup)

%extend StepFEA_ElementGroup {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class StepFEA_FeaAreaDensity *
*******************************/
class StepFEA_FeaAreaDensity : public StepFEA_FeaMaterialPropertyRepresentationItem {
	public:
		/****** StepFEA_FeaAreaDensity::StepFEA_FeaAreaDensity ******/
		/****** md5 signature: 4373f7dae58b0984cdf7069f4e21b045 ******/
		%feature("compactdefaultargs") StepFEA_FeaAreaDensity;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_FeaAreaDensity;
		 StepFEA_FeaAreaDensity();

		/****** StepFEA_FeaAreaDensity::FeaConstant ******/
		/****** md5 signature: 0a46bd475e120e5b92b1f9101c80c915 ******/
		%feature("compactdefaultargs") FeaConstant;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns field FeaConstant.
") FeaConstant;
		Standard_Real FeaConstant();

		/****** StepFEA_FeaAreaDensity::Init ******/
		/****** md5 signature: 42a90c6c44a5ab3ee5b755c471c842f8 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aRepresentationItem_Name: TCollection_HAsciiString
aFeaConstant: float

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name, const Standard_Real aFeaConstant);

		/****** StepFEA_FeaAreaDensity::SetFeaConstant ******/
		/****** md5 signature: 71eb81f7cb130ff77192594450ca8b54 ******/
		%feature("compactdefaultargs") SetFeaConstant;
		%feature("autodoc", "
Parameters
----------
FeaConstant: float

Return
-------
None

Description
-----------
Set field FeaConstant.
") SetFeaConstant;
		void SetFeaConstant(const Standard_Real FeaConstant);

};


%make_alias(StepFEA_FeaAreaDensity)

%extend StepFEA_FeaAreaDensity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class StepFEA_FeaLinearElasticity *
************************************/
class StepFEA_FeaLinearElasticity : public StepFEA_FeaMaterialPropertyRepresentationItem {
	public:
		/****** StepFEA_FeaLinearElasticity::StepFEA_FeaLinearElasticity ******/
		/****** md5 signature: b859ff22dc1497c40d811416de1381a2 ******/
		%feature("compactdefaultargs") StepFEA_FeaLinearElasticity;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_FeaLinearElasticity;
		 StepFEA_FeaLinearElasticity();

		/****** StepFEA_FeaLinearElasticity::FeaConstants ******/
		/****** md5 signature: 688d10675e49aa881289342eb7f2466c ******/
		%feature("compactdefaultargs") FeaConstants;
		%feature("autodoc", "Return
-------
StepFEA_SymmetricTensor43d

Description
-----------
Returns field FeaConstants.
") FeaConstants;
		StepFEA_SymmetricTensor43d FeaConstants();

		/****** StepFEA_FeaLinearElasticity::Init ******/
		/****** md5 signature: c6bcaa6094595fb8120477f88a300003 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aRepresentationItem_Name: TCollection_HAsciiString
aFeaConstants: StepFEA_SymmetricTensor43d

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name, const StepFEA_SymmetricTensor43d & aFeaConstants);

		/****** StepFEA_FeaLinearElasticity::SetFeaConstants ******/
		/****** md5 signature: 6194f7f1d0082594e7c0f6dd97f507ee ******/
		%feature("compactdefaultargs") SetFeaConstants;
		%feature("autodoc", "
Parameters
----------
FeaConstants: StepFEA_SymmetricTensor43d

Return
-------
None

Description
-----------
Set field FeaConstants.
") SetFeaConstants;
		void SetFeaConstants(const StepFEA_SymmetricTensor43d & FeaConstants);

};


%make_alias(StepFEA_FeaLinearElasticity)

%extend StepFEA_FeaLinearElasticity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class StepFEA_FeaMassDensity *
*******************************/
class StepFEA_FeaMassDensity : public StepFEA_FeaMaterialPropertyRepresentationItem {
	public:
		/****** StepFEA_FeaMassDensity::StepFEA_FeaMassDensity ******/
		/****** md5 signature: e5b76184481d0fc529c330c7b2cdafe7 ******/
		%feature("compactdefaultargs") StepFEA_FeaMassDensity;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_FeaMassDensity;
		 StepFEA_FeaMassDensity();

		/****** StepFEA_FeaMassDensity::FeaConstant ******/
		/****** md5 signature: 0a46bd475e120e5b92b1f9101c80c915 ******/
		%feature("compactdefaultargs") FeaConstant;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns field FeaConstant.
") FeaConstant;
		Standard_Real FeaConstant();

		/****** StepFEA_FeaMassDensity::Init ******/
		/****** md5 signature: 42a90c6c44a5ab3ee5b755c471c842f8 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aRepresentationItem_Name: TCollection_HAsciiString
aFeaConstant: float

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name, const Standard_Real aFeaConstant);

		/****** StepFEA_FeaMassDensity::SetFeaConstant ******/
		/****** md5 signature: 71eb81f7cb130ff77192594450ca8b54 ******/
		%feature("compactdefaultargs") SetFeaConstant;
		%feature("autodoc", "
Parameters
----------
FeaConstant: float

Return
-------
None

Description
-----------
Set field FeaConstant.
") SetFeaConstant;
		void SetFeaConstant(const Standard_Real FeaConstant);

};


%make_alias(StepFEA_FeaMassDensity)

%extend StepFEA_FeaMassDensity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class StepFEA_FeaModel3d *
***************************/
class StepFEA_FeaModel3d : public StepFEA_FeaModel {
	public:
		/****** StepFEA_FeaModel3d::StepFEA_FeaModel3d ******/
		/****** md5 signature: a3678b12def938e5731a0c4bf5b043c0 ******/
		%feature("compactdefaultargs") StepFEA_FeaModel3d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_FeaModel3d;
		 StepFEA_FeaModel3d();

};


%make_alias(StepFEA_FeaModel3d)

%extend StepFEA_FeaModel3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class StepFEA_FeaMoistureAbsorption *
**************************************/
class StepFEA_FeaMoistureAbsorption : public StepFEA_FeaMaterialPropertyRepresentationItem {
	public:
		/****** StepFEA_FeaMoistureAbsorption::StepFEA_FeaMoistureAbsorption ******/
		/****** md5 signature: 5aee429a133e6d1e11ab6bda5538a741 ******/
		%feature("compactdefaultargs") StepFEA_FeaMoistureAbsorption;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_FeaMoistureAbsorption;
		 StepFEA_FeaMoistureAbsorption();

		/****** StepFEA_FeaMoistureAbsorption::FeaConstants ******/
		/****** md5 signature: 4027771c3a1da6a1080cc98b479d3cea ******/
		%feature("compactdefaultargs") FeaConstants;
		%feature("autodoc", "Return
-------
StepFEA_SymmetricTensor23d

Description
-----------
Returns field FeaConstants.
") FeaConstants;
		StepFEA_SymmetricTensor23d FeaConstants();

		/****** StepFEA_FeaMoistureAbsorption::Init ******/
		/****** md5 signature: 856efa6707b13ecf49314549078b237d ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aRepresentationItem_Name: TCollection_HAsciiString
aFeaConstants: StepFEA_SymmetricTensor23d

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name, const StepFEA_SymmetricTensor23d & aFeaConstants);

		/****** StepFEA_FeaMoistureAbsorption::SetFeaConstants ******/
		/****** md5 signature: 68abf7c765a355e9868c983cb1c8c0e6 ******/
		%feature("compactdefaultargs") SetFeaConstants;
		%feature("autodoc", "
Parameters
----------
FeaConstants: StepFEA_SymmetricTensor23d

Return
-------
None

Description
-----------
Set field FeaConstants.
") SetFeaConstants;
		void SetFeaConstants(const StepFEA_SymmetricTensor23d & FeaConstants);

};


%make_alias(StepFEA_FeaMoistureAbsorption)

%extend StepFEA_FeaMoistureAbsorption {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************************
* class StepFEA_FeaSecantCoefficientOfLinearThermalExpansion *
*************************************************************/
class StepFEA_FeaSecantCoefficientOfLinearThermalExpansion : public StepFEA_FeaMaterialPropertyRepresentationItem {
	public:
		/****** StepFEA_FeaSecantCoefficientOfLinearThermalExpansion::StepFEA_FeaSecantCoefficientOfLinearThermalExpansion ******/
		/****** md5 signature: 3bd081ee1a452eac71cd23be1a9173f8 ******/
		%feature("compactdefaultargs") StepFEA_FeaSecantCoefficientOfLinearThermalExpansion;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_FeaSecantCoefficientOfLinearThermalExpansion;
		 StepFEA_FeaSecantCoefficientOfLinearThermalExpansion();

		/****** StepFEA_FeaSecantCoefficientOfLinearThermalExpansion::FeaConstants ******/
		/****** md5 signature: 4027771c3a1da6a1080cc98b479d3cea ******/
		%feature("compactdefaultargs") FeaConstants;
		%feature("autodoc", "Return
-------
StepFEA_SymmetricTensor23d

Description
-----------
Returns field FeaConstants.
") FeaConstants;
		StepFEA_SymmetricTensor23d FeaConstants();

		/****** StepFEA_FeaSecantCoefficientOfLinearThermalExpansion::Init ******/
		/****** md5 signature: b95492fa5d44ac834a9d2de519137869 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aRepresentationItem_Name: TCollection_HAsciiString
aFeaConstants: StepFEA_SymmetricTensor23d
aReferenceTemperature: float

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name, const StepFEA_SymmetricTensor23d & aFeaConstants, const Standard_Real aReferenceTemperature);

		/****** StepFEA_FeaSecantCoefficientOfLinearThermalExpansion::ReferenceTemperature ******/
		/****** md5 signature: d7c8f53ed724be61fdfa20eaa8ba9167 ******/
		%feature("compactdefaultargs") ReferenceTemperature;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns field ReferenceTemperature.
") ReferenceTemperature;
		Standard_Real ReferenceTemperature();

		/****** StepFEA_FeaSecantCoefficientOfLinearThermalExpansion::SetFeaConstants ******/
		/****** md5 signature: 68abf7c765a355e9868c983cb1c8c0e6 ******/
		%feature("compactdefaultargs") SetFeaConstants;
		%feature("autodoc", "
Parameters
----------
FeaConstants: StepFEA_SymmetricTensor23d

Return
-------
None

Description
-----------
Set field FeaConstants.
") SetFeaConstants;
		void SetFeaConstants(const StepFEA_SymmetricTensor23d & FeaConstants);

		/****** StepFEA_FeaSecantCoefficientOfLinearThermalExpansion::SetReferenceTemperature ******/
		/****** md5 signature: 4e845c51f17d910dd15e28852d2ba448 ******/
		%feature("compactdefaultargs") SetReferenceTemperature;
		%feature("autodoc", "
Parameters
----------
ReferenceTemperature: float

Return
-------
None

Description
-----------
Set field ReferenceTemperature.
") SetReferenceTemperature;
		void SetReferenceTemperature(const Standard_Real ReferenceTemperature);

};


%make_alias(StepFEA_FeaSecantCoefficientOfLinearThermalExpansion)

%extend StepFEA_FeaSecantCoefficientOfLinearThermalExpansion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class StepFEA_FeaShellBendingStiffness *
*****************************************/
class StepFEA_FeaShellBendingStiffness : public StepFEA_FeaMaterialPropertyRepresentationItem {
	public:
		/****** StepFEA_FeaShellBendingStiffness::StepFEA_FeaShellBendingStiffness ******/
		/****** md5 signature: 6d84d02df30fc5fd9f01b199ddbc6ed4 ******/
		%feature("compactdefaultargs") StepFEA_FeaShellBendingStiffness;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_FeaShellBendingStiffness;
		 StepFEA_FeaShellBendingStiffness();

		/****** StepFEA_FeaShellBendingStiffness::FeaConstants ******/
		/****** md5 signature: 17b0831295efde53fec75eaac957a571 ******/
		%feature("compactdefaultargs") FeaConstants;
		%feature("autodoc", "Return
-------
StepFEA_SymmetricTensor42d

Description
-----------
Returns field FeaConstants.
") FeaConstants;
		StepFEA_SymmetricTensor42d FeaConstants();

		/****** StepFEA_FeaShellBendingStiffness::Init ******/
		/****** md5 signature: d3d7c5a16dfa2b993573196ee8b6919a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aRepresentationItem_Name: TCollection_HAsciiString
aFeaConstants: StepFEA_SymmetricTensor42d

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name, const StepFEA_SymmetricTensor42d & aFeaConstants);

		/****** StepFEA_FeaShellBendingStiffness::SetFeaConstants ******/
		/****** md5 signature: e2564194cb3d190357bdde0092216991 ******/
		%feature("compactdefaultargs") SetFeaConstants;
		%feature("autodoc", "
Parameters
----------
FeaConstants: StepFEA_SymmetricTensor42d

Return
-------
None

Description
-----------
Set field FeaConstants.
") SetFeaConstants;
		void SetFeaConstants(const StepFEA_SymmetricTensor42d & FeaConstants);

};


%make_alias(StepFEA_FeaShellBendingStiffness)

%extend StepFEA_FeaShellBendingStiffness {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************************
* class StepFEA_FeaShellMembraneBendingCouplingStiffness *
*********************************************************/
class StepFEA_FeaShellMembraneBendingCouplingStiffness : public StepFEA_FeaMaterialPropertyRepresentationItem {
	public:
		/****** StepFEA_FeaShellMembraneBendingCouplingStiffness::StepFEA_FeaShellMembraneBendingCouplingStiffness ******/
		/****** md5 signature: 896d21357bd5d114274454dc4b319790 ******/
		%feature("compactdefaultargs") StepFEA_FeaShellMembraneBendingCouplingStiffness;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_FeaShellMembraneBendingCouplingStiffness;
		 StepFEA_FeaShellMembraneBendingCouplingStiffness();

		/****** StepFEA_FeaShellMembraneBendingCouplingStiffness::FeaConstants ******/
		/****** md5 signature: 17b0831295efde53fec75eaac957a571 ******/
		%feature("compactdefaultargs") FeaConstants;
		%feature("autodoc", "Return
-------
StepFEA_SymmetricTensor42d

Description
-----------
Returns field FeaConstants.
") FeaConstants;
		StepFEA_SymmetricTensor42d FeaConstants();

		/****** StepFEA_FeaShellMembraneBendingCouplingStiffness::Init ******/
		/****** md5 signature: d3d7c5a16dfa2b993573196ee8b6919a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aRepresentationItem_Name: TCollection_HAsciiString
aFeaConstants: StepFEA_SymmetricTensor42d

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name, const StepFEA_SymmetricTensor42d & aFeaConstants);

		/****** StepFEA_FeaShellMembraneBendingCouplingStiffness::SetFeaConstants ******/
		/****** md5 signature: e2564194cb3d190357bdde0092216991 ******/
		%feature("compactdefaultargs") SetFeaConstants;
		%feature("autodoc", "
Parameters
----------
FeaConstants: StepFEA_SymmetricTensor42d

Return
-------
None

Description
-----------
Set field FeaConstants.
") SetFeaConstants;
		void SetFeaConstants(const StepFEA_SymmetricTensor42d & FeaConstants);

};


%make_alias(StepFEA_FeaShellMembraneBendingCouplingStiffness)

%extend StepFEA_FeaShellMembraneBendingCouplingStiffness {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class StepFEA_FeaShellMembraneStiffness *
******************************************/
class StepFEA_FeaShellMembraneStiffness : public StepFEA_FeaMaterialPropertyRepresentationItem {
	public:
		/****** StepFEA_FeaShellMembraneStiffness::StepFEA_FeaShellMembraneStiffness ******/
		/****** md5 signature: daf54acd3527b6df86dd16055442afea ******/
		%feature("compactdefaultargs") StepFEA_FeaShellMembraneStiffness;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_FeaShellMembraneStiffness;
		 StepFEA_FeaShellMembraneStiffness();

		/****** StepFEA_FeaShellMembraneStiffness::FeaConstants ******/
		/****** md5 signature: 17b0831295efde53fec75eaac957a571 ******/
		%feature("compactdefaultargs") FeaConstants;
		%feature("autodoc", "Return
-------
StepFEA_SymmetricTensor42d

Description
-----------
Returns field FeaConstants.
") FeaConstants;
		StepFEA_SymmetricTensor42d FeaConstants();

		/****** StepFEA_FeaShellMembraneStiffness::Init ******/
		/****** md5 signature: d3d7c5a16dfa2b993573196ee8b6919a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aRepresentationItem_Name: TCollection_HAsciiString
aFeaConstants: StepFEA_SymmetricTensor42d

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name, const StepFEA_SymmetricTensor42d & aFeaConstants);

		/****** StepFEA_FeaShellMembraneStiffness::SetFeaConstants ******/
		/****** md5 signature: e2564194cb3d190357bdde0092216991 ******/
		%feature("compactdefaultargs") SetFeaConstants;
		%feature("autodoc", "
Parameters
----------
FeaConstants: StepFEA_SymmetricTensor42d

Return
-------
None

Description
-----------
Set field FeaConstants.
") SetFeaConstants;
		void SetFeaConstants(const StepFEA_SymmetricTensor42d & FeaConstants);

};


%make_alias(StepFEA_FeaShellMembraneStiffness)

%extend StepFEA_FeaShellMembraneStiffness {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class StepFEA_FeaShellShearStiffness *
***************************************/
class StepFEA_FeaShellShearStiffness : public StepFEA_FeaMaterialPropertyRepresentationItem {
	public:
		/****** StepFEA_FeaShellShearStiffness::StepFEA_FeaShellShearStiffness ******/
		/****** md5 signature: 4e0dc3b5c8bf45119aa627105c049cf8 ******/
		%feature("compactdefaultargs") StepFEA_FeaShellShearStiffness;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_FeaShellShearStiffness;
		 StepFEA_FeaShellShearStiffness();

		/****** StepFEA_FeaShellShearStiffness::FeaConstants ******/
		/****** md5 signature: 29fc8df5f095d95b5b581a1fe7eb843b ******/
		%feature("compactdefaultargs") FeaConstants;
		%feature("autodoc", "Return
-------
StepFEA_SymmetricTensor22d

Description
-----------
Returns field FeaConstants.
") FeaConstants;
		StepFEA_SymmetricTensor22d FeaConstants();

		/****** StepFEA_FeaShellShearStiffness::Init ******/
		/****** md5 signature: 00285169547d2177b84c4f7464d42dae ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aRepresentationItem_Name: TCollection_HAsciiString
aFeaConstants: StepFEA_SymmetricTensor22d

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name, const StepFEA_SymmetricTensor22d & aFeaConstants);

		/****** StepFEA_FeaShellShearStiffness::SetFeaConstants ******/
		/****** md5 signature: 4884034c1a4698d3bc0d7f1a17510d5a ******/
		%feature("compactdefaultargs") SetFeaConstants;
		%feature("autodoc", "
Parameters
----------
FeaConstants: StepFEA_SymmetricTensor22d

Return
-------
None

Description
-----------
Set field FeaConstants.
") SetFeaConstants;
		void SetFeaConstants(const StepFEA_SymmetricTensor22d & FeaConstants);

};


%make_alias(StepFEA_FeaShellShearStiffness)

%extend StepFEA_FeaShellShearStiffness {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************************************
* class StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion *
*****************************************************************/
class StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion : public StepFEA_FeaMaterialPropertyRepresentationItem {
	public:
		/****** StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion::StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion ******/
		/****** md5 signature: 68803e0c97394eea4919d3c478456395 ******/
		%feature("compactdefaultargs") StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion;
		 StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion();

		/****** StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion::FeaConstants ******/
		/****** md5 signature: 4027771c3a1da6a1080cc98b479d3cea ******/
		%feature("compactdefaultargs") FeaConstants;
		%feature("autodoc", "Return
-------
StepFEA_SymmetricTensor23d

Description
-----------
Returns field FeaConstants.
") FeaConstants;
		StepFEA_SymmetricTensor23d FeaConstants();

		/****** StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion::Init ******/
		/****** md5 signature: 856efa6707b13ecf49314549078b237d ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aRepresentationItem_Name: TCollection_HAsciiString
aFeaConstants: StepFEA_SymmetricTensor23d

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name, const StepFEA_SymmetricTensor23d & aFeaConstants);

		/****** StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion::SetFeaConstants ******/
		/****** md5 signature: 68abf7c765a355e9868c983cb1c8c0e6 ******/
		%feature("compactdefaultargs") SetFeaConstants;
		%feature("autodoc", "
Parameters
----------
FeaConstants: StepFEA_SymmetricTensor23d

Return
-------
None

Description
-----------
Set field FeaConstants.
") SetFeaConstants;
		void SetFeaConstants(const StepFEA_SymmetricTensor23d & FeaConstants);

};


%make_alias(StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion)

%extend StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class StepFEA_GeometricNode *
******************************/
class StepFEA_GeometricNode : public StepFEA_NodeRepresentation {
	public:
		/****** StepFEA_GeometricNode::StepFEA_GeometricNode ******/
		/****** md5 signature: 581941e3b7f7df358f20d9bc26a074d8 ******/
		%feature("compactdefaultargs") StepFEA_GeometricNode;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_GeometricNode;
		 StepFEA_GeometricNode();

};


%make_alias(StepFEA_GeometricNode)

%extend StepFEA_GeometricNode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class StepFEA_Node *
*********************/
class StepFEA_Node : public StepFEA_NodeRepresentation {
	public:
		/****** StepFEA_Node::StepFEA_Node ******/
		/****** md5 signature: 1adb05c4446b864d3974b57f7babe36b ******/
		%feature("compactdefaultargs") StepFEA_Node;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_Node;
		 StepFEA_Node();

};


%make_alias(StepFEA_Node)

%extend StepFEA_Node {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class StepFEA_NodeGroup *
**************************/
class StepFEA_NodeGroup : public StepFEA_FeaGroup {
	public:
		/****** StepFEA_NodeGroup::StepFEA_NodeGroup ******/
		/****** md5 signature: a347f3d392e72865338ca18fbcb702ab ******/
		%feature("compactdefaultargs") StepFEA_NodeGroup;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_NodeGroup;
		 StepFEA_NodeGroup();

		/****** StepFEA_NodeGroup::Init ******/
		/****** md5 signature: e7f976e16a2d1d00b1cab14846cb6f45 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aGroup_Name: TCollection_HAsciiString
aGroup_Description: TCollection_HAsciiString
aFeaGroup_ModelRef: StepFEA_FeaModel
aNodes: StepFEA_HArray1OfNodeRepresentation

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aGroup_Name, const opencascade::handle<TCollection_HAsciiString> & aGroup_Description, const opencascade::handle<StepFEA_FeaModel> & aFeaGroup_ModelRef, const opencascade::handle<StepFEA_HArray1OfNodeRepresentation> & aNodes);

		/****** StepFEA_NodeGroup::Nodes ******/
		/****** md5 signature: 481dfe329e415e43ffa39c24840aa086 ******/
		%feature("compactdefaultargs") Nodes;
		%feature("autodoc", "Return
-------
opencascade::handle<StepFEA_HArray1OfNodeRepresentation>

Description
-----------
Returns field Nodes.
") Nodes;
		opencascade::handle<StepFEA_HArray1OfNodeRepresentation> Nodes();

		/****** StepFEA_NodeGroup::SetNodes ******/
		/****** md5 signature: d91f98e9b19dce0d990e0fc877dbb9f0 ******/
		%feature("compactdefaultargs") SetNodes;
		%feature("autodoc", "
Parameters
----------
Nodes: StepFEA_HArray1OfNodeRepresentation

Return
-------
None

Description
-----------
Set field Nodes.
") SetNodes;
		void SetNodes(const opencascade::handle<StepFEA_HArray1OfNodeRepresentation> & Nodes);

};


%make_alias(StepFEA_NodeGroup)

%extend StepFEA_NodeGroup {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************************
* class StepFEA_ParametricCurve3dElementCoordinateDirection *
************************************************************/
class StepFEA_ParametricCurve3dElementCoordinateDirection : public StepFEA_FeaRepresentationItem {
	public:
		/****** StepFEA_ParametricCurve3dElementCoordinateDirection::StepFEA_ParametricCurve3dElementCoordinateDirection ******/
		/****** md5 signature: a5489bf90f58470c24ce7cdc2c3f9afa ******/
		%feature("compactdefaultargs") StepFEA_ParametricCurve3dElementCoordinateDirection;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_ParametricCurve3dElementCoordinateDirection;
		 StepFEA_ParametricCurve3dElementCoordinateDirection();

		/****** StepFEA_ParametricCurve3dElementCoordinateDirection::Init ******/
		/****** md5 signature: 5b5786e201ac9fdcd803e47cdc47b9ca ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aRepresentationItem_Name: TCollection_HAsciiString
aOrientation: StepGeom_Direction

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name, const opencascade::handle<StepGeom_Direction> & aOrientation);

		/****** StepFEA_ParametricCurve3dElementCoordinateDirection::Orientation ******/
		/****** md5 signature: c15d8334f768a61c925ef032b15fafce ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Direction>

Description
-----------
Returns field Orientation.
") Orientation;
		opencascade::handle<StepGeom_Direction> Orientation();

		/****** StepFEA_ParametricCurve3dElementCoordinateDirection::SetOrientation ******/
		/****** md5 signature: 9e0c28299b6721e2ad7e674ed5da584b ******/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "
Parameters
----------
Orientation: StepGeom_Direction

Return
-------
None

Description
-----------
Set field Orientation.
") SetOrientation;
		void SetOrientation(const opencascade::handle<StepGeom_Direction> & Orientation);

};


%make_alias(StepFEA_ParametricCurve3dElementCoordinateDirection)

%extend StepFEA_ParametricCurve3dElementCoordinateDirection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************************
* class StepFEA_ParametricCurve3dElementCoordinateSystem *
*********************************************************/
class StepFEA_ParametricCurve3dElementCoordinateSystem : public StepFEA_FeaRepresentationItem {
	public:
		/****** StepFEA_ParametricCurve3dElementCoordinateSystem::StepFEA_ParametricCurve3dElementCoordinateSystem ******/
		/****** md5 signature: 1a34a512376ab2e9835162dc7ebd6b4a ******/
		%feature("compactdefaultargs") StepFEA_ParametricCurve3dElementCoordinateSystem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_ParametricCurve3dElementCoordinateSystem;
		 StepFEA_ParametricCurve3dElementCoordinateSystem();

		/****** StepFEA_ParametricCurve3dElementCoordinateSystem::Direction ******/
		/****** md5 signature: 5fd1c7f0c3d3f7e2d93c5e2b52cd13a8 ******/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Return
-------
opencascade::handle<StepFEA_ParametricCurve3dElementCoordinateDirection>

Description
-----------
Returns field Direction.
") Direction;
		opencascade::handle<StepFEA_ParametricCurve3dElementCoordinateDirection> Direction();

		/****** StepFEA_ParametricCurve3dElementCoordinateSystem::Init ******/
		/****** md5 signature: 587e14bde37622722ae0e98b9455faf5 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aRepresentationItem_Name: TCollection_HAsciiString
aDirection: StepFEA_ParametricCurve3dElementCoordinateDirection

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name, const opencascade::handle<StepFEA_ParametricCurve3dElementCoordinateDirection> & aDirection);

		/****** StepFEA_ParametricCurve3dElementCoordinateSystem::SetDirection ******/
		/****** md5 signature: 91959ac1a1ff0fc546d57fb49a4e8133 ******/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "
Parameters
----------
Direction: StepFEA_ParametricCurve3dElementCoordinateDirection

Return
-------
None

Description
-----------
Set field Direction.
") SetDirection;
		void SetDirection(const opencascade::handle<StepFEA_ParametricCurve3dElementCoordinateDirection> & Direction);

};


%make_alias(StepFEA_ParametricCurve3dElementCoordinateSystem)

%extend StepFEA_ParametricCurve3dElementCoordinateSystem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************************
* class StepFEA_ParametricSurface3dElementCoordinateSystem *
***********************************************************/
class StepFEA_ParametricSurface3dElementCoordinateSystem : public StepFEA_FeaRepresentationItem {
	public:
		/****** StepFEA_ParametricSurface3dElementCoordinateSystem::StepFEA_ParametricSurface3dElementCoordinateSystem ******/
		/****** md5 signature: b1ec4ff548f7ed078675e916c5de85e4 ******/
		%feature("compactdefaultargs") StepFEA_ParametricSurface3dElementCoordinateSystem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_ParametricSurface3dElementCoordinateSystem;
		 StepFEA_ParametricSurface3dElementCoordinateSystem();

		/****** StepFEA_ParametricSurface3dElementCoordinateSystem::Angle ******/
		/****** md5 signature: dce50192c350c43b54f2e88e94e5372a ******/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns field Angle.
") Angle;
		Standard_Real Angle();

		/****** StepFEA_ParametricSurface3dElementCoordinateSystem::Axis ******/
		/****** md5 signature: 8c835a38d257f157c4c499e54d099895 ******/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns field Axis.
") Axis;
		Standard_Integer Axis();

		/****** StepFEA_ParametricSurface3dElementCoordinateSystem::Init ******/
		/****** md5 signature: 8b71832374bcd7b3ed64bbf6e1497439 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aRepresentationItem_Name: TCollection_HAsciiString
aAxis: int
aAngle: float

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name, const Standard_Integer aAxis, const Standard_Real aAngle);

		/****** StepFEA_ParametricSurface3dElementCoordinateSystem::SetAngle ******/
		/****** md5 signature: a0d60e2a1ea25c193dafa15194b0ab24 ******/
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "
Parameters
----------
Angle: float

Return
-------
None

Description
-----------
Set field Angle.
") SetAngle;
		void SetAngle(const Standard_Real Angle);

		/****** StepFEA_ParametricSurface3dElementCoordinateSystem::SetAxis ******/
		/****** md5 signature: 2fce638761516dcb6b748e7c34206f1c ******/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "
Parameters
----------
Axis: int

Return
-------
None

Description
-----------
Set field Axis.
") SetAxis;
		void SetAxis(const Standard_Integer Axis);

};


%make_alias(StepFEA_ParametricSurface3dElementCoordinateSystem)

%extend StepFEA_ParametricSurface3dElementCoordinateSystem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class StepFEA_Surface3dElementRepresentation *
***********************************************/
class StepFEA_Surface3dElementRepresentation : public StepFEA_ElementRepresentation {
	public:
		/****** StepFEA_Surface3dElementRepresentation::StepFEA_Surface3dElementRepresentation ******/
		/****** md5 signature: 8f0b9651541d276e1fd7fe1119f05e42 ******/
		%feature("compactdefaultargs") StepFEA_Surface3dElementRepresentation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_Surface3dElementRepresentation;
		 StepFEA_Surface3dElementRepresentation();

		/****** StepFEA_Surface3dElementRepresentation::ElementDescriptor ******/
		/****** md5 signature: 85a49e218d8144b147b4edc767bd2ed6 ******/
		%feature("compactdefaultargs") ElementDescriptor;
		%feature("autodoc", "Return
-------
opencascade::handle<StepElement_Surface3dElementDescriptor>

Description
-----------
Returns field ElementDescriptor.
") ElementDescriptor;
		opencascade::handle<StepElement_Surface3dElementDescriptor> ElementDescriptor();

		/****** StepFEA_Surface3dElementRepresentation::Init ******/
		/****** md5 signature: f6611ef61b997946cdf6603fd888af6f ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aRepresentation_Name: TCollection_HAsciiString
aRepresentation_Items: StepRepr_HArray1OfRepresentationItem
aRepresentation_ContextOfItems: StepRepr_RepresentationContext
aElementRepresentation_NodeList: StepFEA_HArray1OfNodeRepresentation
aModelRef: StepFEA_FeaModel3d
aElementDescriptor: StepElement_Surface3dElementDescriptor
aProperty: StepElement_SurfaceElementProperty
aMaterial: StepElement_ElementMaterial

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aRepresentation_Name, const opencascade::handle<StepRepr_HArray1OfRepresentationItem> & aRepresentation_Items, const opencascade::handle<StepRepr_RepresentationContext> & aRepresentation_ContextOfItems, const opencascade::handle<StepFEA_HArray1OfNodeRepresentation> & aElementRepresentation_NodeList, const opencascade::handle<StepFEA_FeaModel3d> & aModelRef, const opencascade::handle<StepElement_Surface3dElementDescriptor> & aElementDescriptor, const opencascade::handle<StepElement_SurfaceElementProperty> & aProperty, const opencascade::handle<StepElement_ElementMaterial> & aMaterial);

		/****** StepFEA_Surface3dElementRepresentation::Material ******/
		/****** md5 signature: d6c4d9812dbdfac4cc3b5047d6625c8d ******/
		%feature("compactdefaultargs") Material;
		%feature("autodoc", "Return
-------
opencascade::handle<StepElement_ElementMaterial>

Description
-----------
Returns field Material.
") Material;
		opencascade::handle<StepElement_ElementMaterial> Material();

		/****** StepFEA_Surface3dElementRepresentation::ModelRef ******/
		/****** md5 signature: 3396b3c3f41fca848f8edae9b26835a6 ******/
		%feature("compactdefaultargs") ModelRef;
		%feature("autodoc", "Return
-------
opencascade::handle<StepFEA_FeaModel3d>

Description
-----------
Returns field ModelRef.
") ModelRef;
		opencascade::handle<StepFEA_FeaModel3d> ModelRef();

		/****** StepFEA_Surface3dElementRepresentation::Property ******/
		/****** md5 signature: 4d560d1ac294e97b4afb29cc73669b8f ******/
		%feature("compactdefaultargs") Property;
		%feature("autodoc", "Return
-------
opencascade::handle<StepElement_SurfaceElementProperty>

Description
-----------
Returns field Property.
") Property;
		opencascade::handle<StepElement_SurfaceElementProperty> Property();

		/****** StepFEA_Surface3dElementRepresentation::SetElementDescriptor ******/
		/****** md5 signature: f8f6ddf12c36d78b354b483e6cc8ccca ******/
		%feature("compactdefaultargs") SetElementDescriptor;
		%feature("autodoc", "
Parameters
----------
ElementDescriptor: StepElement_Surface3dElementDescriptor

Return
-------
None

Description
-----------
Set field ElementDescriptor.
") SetElementDescriptor;
		void SetElementDescriptor(const opencascade::handle<StepElement_Surface3dElementDescriptor> & ElementDescriptor);

		/****** StepFEA_Surface3dElementRepresentation::SetMaterial ******/
		/****** md5 signature: 224016d312e5b2f0ec58641cb367214d ******/
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "
Parameters
----------
Material: StepElement_ElementMaterial

Return
-------
None

Description
-----------
Set field Material.
") SetMaterial;
		void SetMaterial(const opencascade::handle<StepElement_ElementMaterial> & Material);

		/****** StepFEA_Surface3dElementRepresentation::SetModelRef ******/
		/****** md5 signature: be7659867f17ff42d15420e4c343fc43 ******/
		%feature("compactdefaultargs") SetModelRef;
		%feature("autodoc", "
Parameters
----------
ModelRef: StepFEA_FeaModel3d

Return
-------
None

Description
-----------
Set field ModelRef.
") SetModelRef;
		void SetModelRef(const opencascade::handle<StepFEA_FeaModel3d> & ModelRef);

		/****** StepFEA_Surface3dElementRepresentation::SetProperty ******/
		/****** md5 signature: 480ff49a137fee223f7e8342979b3816 ******/
		%feature("compactdefaultargs") SetProperty;
		%feature("autodoc", "
Parameters
----------
Property: StepElement_SurfaceElementProperty

Return
-------
None

Description
-----------
Set field Property.
") SetProperty;
		void SetProperty(const opencascade::handle<StepElement_SurfaceElementProperty> & Property);

};


%make_alias(StepFEA_Surface3dElementRepresentation)

%extend StepFEA_Surface3dElementRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class StepFEA_Volume3dElementRepresentation *
**********************************************/
class StepFEA_Volume3dElementRepresentation : public StepFEA_ElementRepresentation {
	public:
		/****** StepFEA_Volume3dElementRepresentation::StepFEA_Volume3dElementRepresentation ******/
		/****** md5 signature: 2d4b0c806245608d7ae1ade6e6ea740b ******/
		%feature("compactdefaultargs") StepFEA_Volume3dElementRepresentation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_Volume3dElementRepresentation;
		 StepFEA_Volume3dElementRepresentation();

		/****** StepFEA_Volume3dElementRepresentation::ElementDescriptor ******/
		/****** md5 signature: c0e0e1be420873c6ac799075c1fbe2bf ******/
		%feature("compactdefaultargs") ElementDescriptor;
		%feature("autodoc", "Return
-------
opencascade::handle<StepElement_Volume3dElementDescriptor>

Description
-----------
Returns field ElementDescriptor.
") ElementDescriptor;
		opencascade::handle<StepElement_Volume3dElementDescriptor> ElementDescriptor();

		/****** StepFEA_Volume3dElementRepresentation::Init ******/
		/****** md5 signature: 42456ddb362a8999c5a16908e92a86f0 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aRepresentation_Name: TCollection_HAsciiString
aRepresentation_Items: StepRepr_HArray1OfRepresentationItem
aRepresentation_ContextOfItems: StepRepr_RepresentationContext
aElementRepresentation_NodeList: StepFEA_HArray1OfNodeRepresentation
aModelRef: StepFEA_FeaModel3d
aElementDescriptor: StepElement_Volume3dElementDescriptor
aMaterial: StepElement_ElementMaterial

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aRepresentation_Name, const opencascade::handle<StepRepr_HArray1OfRepresentationItem> & aRepresentation_Items, const opencascade::handle<StepRepr_RepresentationContext> & aRepresentation_ContextOfItems, const opencascade::handle<StepFEA_HArray1OfNodeRepresentation> & aElementRepresentation_NodeList, const opencascade::handle<StepFEA_FeaModel3d> & aModelRef, const opencascade::handle<StepElement_Volume3dElementDescriptor> & aElementDescriptor, const opencascade::handle<StepElement_ElementMaterial> & aMaterial);

		/****** StepFEA_Volume3dElementRepresentation::Material ******/
		/****** md5 signature: d6c4d9812dbdfac4cc3b5047d6625c8d ******/
		%feature("compactdefaultargs") Material;
		%feature("autodoc", "Return
-------
opencascade::handle<StepElement_ElementMaterial>

Description
-----------
Returns field Material.
") Material;
		opencascade::handle<StepElement_ElementMaterial> Material();

		/****** StepFEA_Volume3dElementRepresentation::ModelRef ******/
		/****** md5 signature: 3396b3c3f41fca848f8edae9b26835a6 ******/
		%feature("compactdefaultargs") ModelRef;
		%feature("autodoc", "Return
-------
opencascade::handle<StepFEA_FeaModel3d>

Description
-----------
Returns field ModelRef.
") ModelRef;
		opencascade::handle<StepFEA_FeaModel3d> ModelRef();

		/****** StepFEA_Volume3dElementRepresentation::SetElementDescriptor ******/
		/****** md5 signature: afbfb0a9dd6aaf0a196021f77b6dbcec ******/
		%feature("compactdefaultargs") SetElementDescriptor;
		%feature("autodoc", "
Parameters
----------
ElementDescriptor: StepElement_Volume3dElementDescriptor

Return
-------
None

Description
-----------
Set field ElementDescriptor.
") SetElementDescriptor;
		void SetElementDescriptor(const opencascade::handle<StepElement_Volume3dElementDescriptor> & ElementDescriptor);

		/****** StepFEA_Volume3dElementRepresentation::SetMaterial ******/
		/****** md5 signature: 224016d312e5b2f0ec58641cb367214d ******/
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "
Parameters
----------
Material: StepElement_ElementMaterial

Return
-------
None

Description
-----------
Set field Material.
") SetMaterial;
		void SetMaterial(const opencascade::handle<StepElement_ElementMaterial> & Material);

		/****** StepFEA_Volume3dElementRepresentation::SetModelRef ******/
		/****** md5 signature: be7659867f17ff42d15420e4c343fc43 ******/
		%feature("compactdefaultargs") SetModelRef;
		%feature("autodoc", "
Parameters
----------
ModelRef: StepFEA_FeaModel3d

Return
-------
None

Description
-----------
Set field ModelRef.
") SetModelRef;
		void SetModelRef(const opencascade::handle<StepFEA_FeaModel3d> & ModelRef);

};


%make_alias(StepFEA_Volume3dElementRepresentation)

%extend StepFEA_Volume3dElementRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class StepFEA_NodeWithSolutionCoordinateSystem *
*************************************************/
class StepFEA_NodeWithSolutionCoordinateSystem : public StepFEA_Node {
	public:
		/****** StepFEA_NodeWithSolutionCoordinateSystem::StepFEA_NodeWithSolutionCoordinateSystem ******/
		/****** md5 signature: 9f8b4d4baa08136866108a6a226f7fa4 ******/
		%feature("compactdefaultargs") StepFEA_NodeWithSolutionCoordinateSystem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_NodeWithSolutionCoordinateSystem;
		 StepFEA_NodeWithSolutionCoordinateSystem();

};


%make_alias(StepFEA_NodeWithSolutionCoordinateSystem)

%extend StepFEA_NodeWithSolutionCoordinateSystem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class StepFEA_NodeWithVector *
*******************************/
class StepFEA_NodeWithVector : public StepFEA_Node {
	public:
		/****** StepFEA_NodeWithVector::StepFEA_NodeWithVector ******/
		/****** md5 signature: 32d260c195ad31343d7616c4d4a5d8cf ******/
		%feature("compactdefaultargs") StepFEA_NodeWithVector;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepFEA_NodeWithVector;
		 StepFEA_NodeWithVector();

};


%make_alias(StepFEA_NodeWithVector)

%extend StepFEA_NodeWithVector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */

class StepFEA_HArray1OfCurveElementEndOffset : public StepFEA_Array1OfCurveElementEndOffset, public Standard_Transient {
  public:
    StepFEA_HArray1OfCurveElementEndOffset(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepFEA_HArray1OfCurveElementEndOffset(const Standard_Integer theLower, const Standard_Integer theUpper, const StepFEA_Array1OfCurveElementEndOffset::value_type& theValue);
    StepFEA_HArray1OfCurveElementEndOffset(const StepFEA_Array1OfCurveElementEndOffset& theOther);
    const StepFEA_Array1OfCurveElementEndOffset& Array1();
    StepFEA_Array1OfCurveElementEndOffset& ChangeArray1();
};
%make_alias(StepFEA_HArray1OfCurveElementEndOffset)


class StepFEA_HArray1OfCurveElementEndRelease : public StepFEA_Array1OfCurveElementEndRelease, public Standard_Transient {
  public:
    StepFEA_HArray1OfCurveElementEndRelease(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepFEA_HArray1OfCurveElementEndRelease(const Standard_Integer theLower, const Standard_Integer theUpper, const StepFEA_Array1OfCurveElementEndRelease::value_type& theValue);
    StepFEA_HArray1OfCurveElementEndRelease(const StepFEA_Array1OfCurveElementEndRelease& theOther);
    const StepFEA_Array1OfCurveElementEndRelease& Array1();
    StepFEA_Array1OfCurveElementEndRelease& ChangeArray1();
};
%make_alias(StepFEA_HArray1OfCurveElementEndRelease)


class StepFEA_HArray1OfCurveElementInterval : public StepFEA_Array1OfCurveElementInterval, public Standard_Transient {
  public:
    StepFEA_HArray1OfCurveElementInterval(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepFEA_HArray1OfCurveElementInterval(const Standard_Integer theLower, const Standard_Integer theUpper, const StepFEA_Array1OfCurveElementInterval::value_type& theValue);
    StepFEA_HArray1OfCurveElementInterval(const StepFEA_Array1OfCurveElementInterval& theOther);
    const StepFEA_Array1OfCurveElementInterval& Array1();
    StepFEA_Array1OfCurveElementInterval& ChangeArray1();
};
%make_alias(StepFEA_HArray1OfCurveElementInterval)


class StepFEA_HArray1OfDegreeOfFreedom : public StepFEA_Array1OfDegreeOfFreedom, public Standard_Transient {
  public:
    StepFEA_HArray1OfDegreeOfFreedom(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepFEA_HArray1OfDegreeOfFreedom(const Standard_Integer theLower, const Standard_Integer theUpper, const StepFEA_Array1OfDegreeOfFreedom::value_type& theValue);
    StepFEA_HArray1OfDegreeOfFreedom(const StepFEA_Array1OfDegreeOfFreedom& theOther);
    const StepFEA_Array1OfDegreeOfFreedom& Array1();
    StepFEA_Array1OfDegreeOfFreedom& ChangeArray1();
};
%make_alias(StepFEA_HArray1OfDegreeOfFreedom)


class StepFEA_HArray1OfElementRepresentation : public StepFEA_Array1OfElementRepresentation, public Standard_Transient {
  public:
    StepFEA_HArray1OfElementRepresentation(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepFEA_HArray1OfElementRepresentation(const Standard_Integer theLower, const Standard_Integer theUpper, const StepFEA_Array1OfElementRepresentation::value_type& theValue);
    StepFEA_HArray1OfElementRepresentation(const StepFEA_Array1OfElementRepresentation& theOther);
    const StepFEA_Array1OfElementRepresentation& Array1();
    StepFEA_Array1OfElementRepresentation& ChangeArray1();
};
%make_alias(StepFEA_HArray1OfElementRepresentation)


class StepFEA_HArray1OfNodeRepresentation : public StepFEA_Array1OfNodeRepresentation, public Standard_Transient {
  public:
    StepFEA_HArray1OfNodeRepresentation(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepFEA_HArray1OfNodeRepresentation(const Standard_Integer theLower, const Standard_Integer theUpper, const StepFEA_Array1OfNodeRepresentation::value_type& theValue);
    StepFEA_HArray1OfNodeRepresentation(const StepFEA_Array1OfNodeRepresentation& theOther);
    const StepFEA_Array1OfNodeRepresentation& Array1();
    StepFEA_Array1OfNodeRepresentation& ChangeArray1();
};
%make_alias(StepFEA_HArray1OfNodeRepresentation)

/* harray2 classes */
/* hsequence classes */
class StepFEA_HSequenceOfCurve3dElementProperty : public StepFEA_SequenceOfCurve3dElementProperty, public Standard_Transient {
  public:
    StepFEA_HSequenceOfCurve3dElementProperty();
    StepFEA_HSequenceOfCurve3dElementProperty(const StepFEA_SequenceOfCurve3dElementProperty& theOther);
    const StepFEA_SequenceOfCurve3dElementProperty& Sequence();
    void Append (const StepFEA_SequenceOfCurve3dElementProperty::value_type& theItem);
    void Append (StepFEA_SequenceOfCurve3dElementProperty& theSequence);
    StepFEA_SequenceOfCurve3dElementProperty& ChangeSequence();
};
%make_alias(StepFEA_HSequenceOfCurve3dElementProperty)


class StepFEA_HSequenceOfElementGeometricRelationship : public StepFEA_SequenceOfElementGeometricRelationship, public Standard_Transient {
  public:
    StepFEA_HSequenceOfElementGeometricRelationship();
    StepFEA_HSequenceOfElementGeometricRelationship(const StepFEA_SequenceOfElementGeometricRelationship& theOther);
    const StepFEA_SequenceOfElementGeometricRelationship& Sequence();
    void Append (const StepFEA_SequenceOfElementGeometricRelationship::value_type& theItem);
    void Append (StepFEA_SequenceOfElementGeometricRelationship& theSequence);
    StepFEA_SequenceOfElementGeometricRelationship& ChangeSequence();
};
%make_alias(StepFEA_HSequenceOfElementGeometricRelationship)


class StepFEA_HSequenceOfElementRepresentation : public StepFEA_SequenceOfElementRepresentation, public Standard_Transient {
  public:
    StepFEA_HSequenceOfElementRepresentation();
    StepFEA_HSequenceOfElementRepresentation(const StepFEA_SequenceOfElementRepresentation& theOther);
    const StepFEA_SequenceOfElementRepresentation& Sequence();
    void Append (const StepFEA_SequenceOfElementRepresentation::value_type& theItem);
    void Append (StepFEA_SequenceOfElementRepresentation& theSequence);
    StepFEA_SequenceOfElementRepresentation& ChangeSequence();
};
%make_alias(StepFEA_HSequenceOfElementRepresentation)


class StepFEA_HSequenceOfNodeRepresentation : public StepFEA_SequenceOfNodeRepresentation, public Standard_Transient {
  public:
    StepFEA_HSequenceOfNodeRepresentation();
    StepFEA_HSequenceOfNodeRepresentation(const StepFEA_SequenceOfNodeRepresentation& theOther);
    const StepFEA_SequenceOfNodeRepresentation& Sequence();
    void Append (const StepFEA_SequenceOfNodeRepresentation::value_type& theItem);
    void Append (StepFEA_SequenceOfNodeRepresentation& theSequence);
    StepFEA_SequenceOfNodeRepresentation& ChangeSequence();
};
%make_alias(StepFEA_HSequenceOfNodeRepresentation)


/* class aliases */
%pythoncode {
}
