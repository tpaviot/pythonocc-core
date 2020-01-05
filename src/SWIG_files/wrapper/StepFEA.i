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
%define STEPFEADOCSTRING
"StepFEA module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_stepfea.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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
/* public enums */
enum StepFEA_ElementVolume {
	StepFEA_Volume = 0,
};

enum StepFEA_CoordinateSystemType {
	StepFEA_Cartesian = 0,
	StepFEA_Cylindrical = 1,
	StepFEA_Spherical = 2,
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

enum StepFEA_CurveEdge {
	StepFEA_ElementEdge = 0,
};

enum StepFEA_UnspecifiedValue {
	StepFEA_Unspecified = 0,
};

/* end public enums declaration */

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
%wrap_handle(StepFEA_HArray1OfCurveElementInterval)
%wrap_handle(StepFEA_HArray1OfCurveElementEndOffset)
%wrap_handle(StepFEA_HArray1OfElementRepresentation)
%wrap_handle(StepFEA_HArray1OfCurveElementEndRelease)
%wrap_handle(StepFEA_HArray1OfDegreeOfFreedom)
%wrap_handle(StepFEA_HArray1OfNodeRepresentation)
%wrap_handle(StepFEA_HSequenceOfElementRepresentation)
%wrap_handle(StepFEA_HSequenceOfElementGeometricRelationship)
%wrap_handle(StepFEA_HSequenceOfNodeRepresentation)
%wrap_handle(StepFEA_HSequenceOfCurve3dElementProperty)
/* end handles declaration */

/* templates */
%template(StepFEA_SequenceOfElementRepresentation) NCollection_Sequence <opencascade::handle <StepFEA_ElementRepresentation>>;
%template(StepFEA_SequenceOfCurve3dElementProperty) NCollection_Sequence <opencascade::handle <StepFEA_Curve3dElementProperty>>;
%template(StepFEA_SequenceOfNodeRepresentation) NCollection_Sequence <opencascade::handle <StepFEA_NodeRepresentation>>;
%template(StepFEA_SequenceOfElementGeometricRelationship) NCollection_Sequence <opencascade::handle <StepFEA_ElementGeometricRelationship>>;
%template(StepFEA_Array1OfDegreeOfFreedom) NCollection_Array1 <StepFEA_DegreeOfFreedom>;

%extend NCollection_Array1 <StepFEA_DegreeOfFreedom> {
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
%template(StepFEA_Array1OfCurveElementEndRelease) NCollection_Array1 <opencascade::handle <StepFEA_CurveElementEndRelease>>;

%extend NCollection_Array1 <opencascade::handle <StepFEA_CurveElementEndRelease>> {
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
%template(StepFEA_Array1OfCurveElementInterval) NCollection_Array1 <opencascade::handle <StepFEA_CurveElementInterval>>;

%extend NCollection_Array1 <opencascade::handle <StepFEA_CurveElementInterval>> {
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
%template(StepFEA_Array1OfNodeRepresentation) NCollection_Array1 <opencascade::handle <StepFEA_NodeRepresentation>>;

%extend NCollection_Array1 <opencascade::handle <StepFEA_NodeRepresentation>> {
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
%template(StepFEA_Array1OfElementRepresentation) NCollection_Array1 <opencascade::handle <StepFEA_ElementRepresentation>>;

%extend NCollection_Array1 <opencascade::handle <StepFEA_ElementRepresentation>> {
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
%template(StepFEA_Array1OfCurveElementEndOffset) NCollection_Array1 <opencascade::handle <StepFEA_CurveElementEndOffset>>;

%extend NCollection_Array1 <opencascade::handle <StepFEA_CurveElementEndOffset>> {
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
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence <opencascade::handle <StepFEA_ElementRepresentation>> StepFEA_SequenceOfElementRepresentation;
typedef NCollection_Sequence <opencascade::handle <StepFEA_Curve3dElementProperty>> StepFEA_SequenceOfCurve3dElementProperty;
typedef NCollection_Sequence <opencascade::handle <StepFEA_NodeRepresentation>> StepFEA_SequenceOfNodeRepresentation;
typedef NCollection_Sequence <opencascade::handle <StepFEA_ElementGeometricRelationship>> StepFEA_SequenceOfElementGeometricRelationship;
typedef NCollection_Array1 <StepFEA_DegreeOfFreedom> StepFEA_Array1OfDegreeOfFreedom;
typedef NCollection_Array1 <opencascade::handle <StepFEA_CurveElementEndRelease>> StepFEA_Array1OfCurveElementEndRelease;
typedef NCollection_Array1 <opencascade::handle <StepFEA_CurveElementInterval>> StepFEA_Array1OfCurveElementInterval;
typedef NCollection_Array1 <opencascade::handle <StepFEA_NodeRepresentation>> StepFEA_Array1OfNodeRepresentation;
typedef NCollection_Array1 <opencascade::handle <StepFEA_ElementRepresentation>> StepFEA_Array1OfElementRepresentation;
typedef NCollection_Array1 <opencascade::handle <StepFEA_CurveElementEndOffset>> StepFEA_Array1OfCurveElementEndOffset;
/* end typedefs declaration */

/***************************************
* class StepFEA_Curve3dElementProperty *
***************************************/
class StepFEA_Curve3dElementProperty : public Standard_Transient {
	public:
		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "* Returns field Description
	:rtype: opencascade::handle<TCollection_HAsciiString>") Description;
		opencascade::handle<TCollection_HAsciiString> Description ();

		/****************** EndOffsets ******************/
		%feature("compactdefaultargs") EndOffsets;
		%feature("autodoc", "* Returns field EndOffsets
	:rtype: opencascade::handle<StepFEA_HArray1OfCurveElementEndOffset>") EndOffsets;
		opencascade::handle<StepFEA_HArray1OfCurveElementEndOffset> EndOffsets ();

		/****************** EndReleases ******************/
		%feature("compactdefaultargs") EndReleases;
		%feature("autodoc", "* Returns field EndReleases
	:rtype: opencascade::handle<StepFEA_HArray1OfCurveElementEndRelease>") EndReleases;
		opencascade::handle<StepFEA_HArray1OfCurveElementEndRelease> EndReleases ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aPropertyId:
	:type aPropertyId: TCollection_HAsciiString
	:param aDescription:
	:type aDescription: TCollection_HAsciiString
	:param aIntervalDefinitions:
	:type aIntervalDefinitions: StepFEA_HArray1OfCurveElementInterval
	:param aEndOffsets:
	:type aEndOffsets: StepFEA_HArray1OfCurveElementEndOffset
	:param aEndReleases:
	:type aEndReleases: StepFEA_HArray1OfCurveElementEndRelease
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aPropertyId,const opencascade::handle<TCollection_HAsciiString> & aDescription,const opencascade::handle<StepFEA_HArray1OfCurveElementInterval> & aIntervalDefinitions,const opencascade::handle<StepFEA_HArray1OfCurveElementEndOffset> & aEndOffsets,const opencascade::handle<StepFEA_HArray1OfCurveElementEndRelease> & aEndReleases);

		/****************** IntervalDefinitions ******************/
		%feature("compactdefaultargs") IntervalDefinitions;
		%feature("autodoc", "* Returns field IntervalDefinitions
	:rtype: opencascade::handle<StepFEA_HArray1OfCurveElementInterval>") IntervalDefinitions;
		opencascade::handle<StepFEA_HArray1OfCurveElementInterval> IntervalDefinitions ();

		/****************** PropertyId ******************/
		%feature("compactdefaultargs") PropertyId;
		%feature("autodoc", "* Returns field PropertyId
	:rtype: opencascade::handle<TCollection_HAsciiString>") PropertyId;
		opencascade::handle<TCollection_HAsciiString> PropertyId ();

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "* Set field Description
	:param Description:
	:type Description: TCollection_HAsciiString
	:rtype: None") SetDescription;
		void SetDescription (const opencascade::handle<TCollection_HAsciiString> & Description);

		/****************** SetEndOffsets ******************/
		%feature("compactdefaultargs") SetEndOffsets;
		%feature("autodoc", "* Set field EndOffsets
	:param EndOffsets:
	:type EndOffsets: StepFEA_HArray1OfCurveElementEndOffset
	:rtype: None") SetEndOffsets;
		void SetEndOffsets (const opencascade::handle<StepFEA_HArray1OfCurveElementEndOffset> & EndOffsets);

		/****************** SetEndReleases ******************/
		%feature("compactdefaultargs") SetEndReleases;
		%feature("autodoc", "* Set field EndReleases
	:param EndReleases:
	:type EndReleases: StepFEA_HArray1OfCurveElementEndRelease
	:rtype: None") SetEndReleases;
		void SetEndReleases (const opencascade::handle<StepFEA_HArray1OfCurveElementEndRelease> & EndReleases);

		/****************** SetIntervalDefinitions ******************/
		%feature("compactdefaultargs") SetIntervalDefinitions;
		%feature("autodoc", "* Set field IntervalDefinitions
	:param IntervalDefinitions:
	:type IntervalDefinitions: StepFEA_HArray1OfCurveElementInterval
	:rtype: None") SetIntervalDefinitions;
		void SetIntervalDefinitions (const opencascade::handle<StepFEA_HArray1OfCurveElementInterval> & IntervalDefinitions);

		/****************** SetPropertyId ******************/
		%feature("compactdefaultargs") SetPropertyId;
		%feature("autodoc", "* Set field PropertyId
	:param PropertyId:
	:type PropertyId: TCollection_HAsciiString
	:rtype: None") SetPropertyId;
		void SetPropertyId (const opencascade::handle<TCollection_HAsciiString> & PropertyId);

		/****************** StepFEA_Curve3dElementProperty ******************/
		%feature("compactdefaultargs") StepFEA_Curve3dElementProperty;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_Curve3dElementProperty;
		 StepFEA_Curve3dElementProperty ();

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
		/****************** AlignedCurve3dElementCoordinateSystem ******************/
		%feature("compactdefaultargs") AlignedCurve3dElementCoordinateSystem;
		%feature("autodoc", "* Returns Value as AlignedCurve3dElementCoordinateSystem (or Null if another type)
	:rtype: opencascade::handle<StepFEA_AlignedCurve3dElementCoordinateSystem>") AlignedCurve3dElementCoordinateSystem;
		opencascade::handle<StepFEA_AlignedCurve3dElementCoordinateSystem> AlignedCurve3dElementCoordinateSystem ();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "* Recognizes a kind of CurveElementEndCoordinateSystem select type 1 -> FeaAxis2Placement3d from StepFEA 2 -> AlignedCurve3dElementCoordinateSystem from StepFEA 3 -> ParametricCurve3dElementCoordinateSystem from StepFEA 0 else
	:param ent:
	:type ent: Standard_Transient
	:rtype: int") CaseNum;
		Standard_Integer CaseNum (const opencascade::handle<Standard_Transient> & ent);

		/****************** FeaAxis2Placement3d ******************/
		%feature("compactdefaultargs") FeaAxis2Placement3d;
		%feature("autodoc", "* Returns Value as FeaAxis2Placement3d (or Null if another type)
	:rtype: opencascade::handle<StepFEA_FeaAxis2Placement3d>") FeaAxis2Placement3d;
		opencascade::handle<StepFEA_FeaAxis2Placement3d> FeaAxis2Placement3d ();

		/****************** ParametricCurve3dElementCoordinateSystem ******************/
		%feature("compactdefaultargs") ParametricCurve3dElementCoordinateSystem;
		%feature("autodoc", "* Returns Value as ParametricCurve3dElementCoordinateSystem (or Null if another type)
	:rtype: opencascade::handle<StepFEA_ParametricCurve3dElementCoordinateSystem>") ParametricCurve3dElementCoordinateSystem;
		opencascade::handle<StepFEA_ParametricCurve3dElementCoordinateSystem> ParametricCurve3dElementCoordinateSystem ();

		/****************** StepFEA_CurveElementEndCoordinateSystem ******************/
		%feature("compactdefaultargs") StepFEA_CurveElementEndCoordinateSystem;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_CurveElementEndCoordinateSystem;
		 StepFEA_CurveElementEndCoordinateSystem ();

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
		/****************** CoordinateSystem ******************/
		%feature("compactdefaultargs") CoordinateSystem;
		%feature("autodoc", "* Returns field CoordinateSystem
	:rtype: StepFEA_CurveElementEndCoordinateSystem") CoordinateSystem;
		StepFEA_CurveElementEndCoordinateSystem CoordinateSystem ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aCoordinateSystem:
	:type aCoordinateSystem: StepFEA_CurveElementEndCoordinateSystem
	:param aOffsetVector:
	:type aOffsetVector: TColStd_HArray1OfReal
	:rtype: None") Init;
		void Init (const StepFEA_CurveElementEndCoordinateSystem & aCoordinateSystem,const opencascade::handle<TColStd_HArray1OfReal> & aOffsetVector);

		/****************** OffsetVector ******************/
		%feature("compactdefaultargs") OffsetVector;
		%feature("autodoc", "* Returns field OffsetVector
	:rtype: opencascade::handle<TColStd_HArray1OfReal>") OffsetVector;
		opencascade::handle<TColStd_HArray1OfReal> OffsetVector ();

		/****************** SetCoordinateSystem ******************/
		%feature("compactdefaultargs") SetCoordinateSystem;
		%feature("autodoc", "* Set field CoordinateSystem
	:param CoordinateSystem:
	:type CoordinateSystem: StepFEA_CurveElementEndCoordinateSystem
	:rtype: None") SetCoordinateSystem;
		void SetCoordinateSystem (const StepFEA_CurveElementEndCoordinateSystem & CoordinateSystem);

		/****************** SetOffsetVector ******************/
		%feature("compactdefaultargs") SetOffsetVector;
		%feature("autodoc", "* Set field OffsetVector
	:param OffsetVector:
	:type OffsetVector: TColStd_HArray1OfReal
	:rtype: None") SetOffsetVector;
		void SetOffsetVector (const opencascade::handle<TColStd_HArray1OfReal> & OffsetVector);

		/****************** StepFEA_CurveElementEndOffset ******************/
		%feature("compactdefaultargs") StepFEA_CurveElementEndOffset;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_CurveElementEndOffset;
		 StepFEA_CurveElementEndOffset ();

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
		/****************** CoordinateSystem ******************/
		%feature("compactdefaultargs") CoordinateSystem;
		%feature("autodoc", "* Returns field CoordinateSystem
	:rtype: StepFEA_CurveElementEndCoordinateSystem") CoordinateSystem;
		StepFEA_CurveElementEndCoordinateSystem CoordinateSystem ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aCoordinateSystem:
	:type aCoordinateSystem: StepFEA_CurveElementEndCoordinateSystem
	:param aReleases:
	:type aReleases: StepElement_HArray1OfCurveElementEndReleasePacket
	:rtype: None") Init;
		void Init (const StepFEA_CurveElementEndCoordinateSystem & aCoordinateSystem,const opencascade::handle<StepElement_HArray1OfCurveElementEndReleasePacket> & aReleases);

		/****************** Releases ******************/
		%feature("compactdefaultargs") Releases;
		%feature("autodoc", "* Returns field Releases
	:rtype: opencascade::handle<StepElement_HArray1OfCurveElementEndReleasePacket>") Releases;
		opencascade::handle<StepElement_HArray1OfCurveElementEndReleasePacket> Releases ();

		/****************** SetCoordinateSystem ******************/
		%feature("compactdefaultargs") SetCoordinateSystem;
		%feature("autodoc", "* Set field CoordinateSystem
	:param CoordinateSystem:
	:type CoordinateSystem: StepFEA_CurveElementEndCoordinateSystem
	:rtype: None") SetCoordinateSystem;
		void SetCoordinateSystem (const StepFEA_CurveElementEndCoordinateSystem & CoordinateSystem);

		/****************** SetReleases ******************/
		%feature("compactdefaultargs") SetReleases;
		%feature("autodoc", "* Set field Releases
	:param Releases:
	:type Releases: StepElement_HArray1OfCurveElementEndReleasePacket
	:rtype: None") SetReleases;
		void SetReleases (const opencascade::handle<StepElement_HArray1OfCurveElementEndReleasePacket> & Releases);

		/****************** StepFEA_CurveElementEndRelease ******************/
		%feature("compactdefaultargs") StepFEA_CurveElementEndRelease;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_CurveElementEndRelease;
		 StepFEA_CurveElementEndRelease ();

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
		/****************** EuAngles ******************/
		%feature("compactdefaultargs") EuAngles;
		%feature("autodoc", "* Returns field EuAngles
	:rtype: opencascade::handle<StepBasic_EulerAngles>") EuAngles;
		opencascade::handle<StepBasic_EulerAngles> EuAngles ();

		/****************** FinishPosition ******************/
		%feature("compactdefaultargs") FinishPosition;
		%feature("autodoc", "* Returns field FinishPosition
	:rtype: opencascade::handle<StepFEA_CurveElementLocation>") FinishPosition;
		opencascade::handle<StepFEA_CurveElementLocation> FinishPosition ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aFinishPosition:
	:type aFinishPosition: StepFEA_CurveElementLocation
	:param aEuAngles:
	:type aEuAngles: StepBasic_EulerAngles
	:rtype: None") Init;
		void Init (const opencascade::handle<StepFEA_CurveElementLocation> & aFinishPosition,const opencascade::handle<StepBasic_EulerAngles> & aEuAngles);

		/****************** SetEuAngles ******************/
		%feature("compactdefaultargs") SetEuAngles;
		%feature("autodoc", "* Set field EuAngles
	:param EuAngles:
	:type EuAngles: StepBasic_EulerAngles
	:rtype: None") SetEuAngles;
		void SetEuAngles (const opencascade::handle<StepBasic_EulerAngles> & EuAngles);

		/****************** SetFinishPosition ******************/
		%feature("compactdefaultargs") SetFinishPosition;
		%feature("autodoc", "* Set field FinishPosition
	:param FinishPosition:
	:type FinishPosition: StepFEA_CurveElementLocation
	:rtype: None") SetFinishPosition;
		void SetFinishPosition (const opencascade::handle<StepFEA_CurveElementLocation> & FinishPosition);

		/****************** StepFEA_CurveElementInterval ******************/
		%feature("compactdefaultargs") StepFEA_CurveElementInterval;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_CurveElementInterval;
		 StepFEA_CurveElementInterval ();

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
		/****************** Coordinate ******************/
		%feature("compactdefaultargs") Coordinate;
		%feature("autodoc", "* Returns field Coordinate
	:rtype: opencascade::handle<StepFEA_FeaParametricPoint>") Coordinate;
		opencascade::handle<StepFEA_FeaParametricPoint> Coordinate ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aCoordinate:
	:type aCoordinate: StepFEA_FeaParametricPoint
	:rtype: None") Init;
		void Init (const opencascade::handle<StepFEA_FeaParametricPoint> & aCoordinate);

		/****************** SetCoordinate ******************/
		%feature("compactdefaultargs") SetCoordinate;
		%feature("autodoc", "* Set field Coordinate
	:param Coordinate:
	:type Coordinate: StepFEA_FeaParametricPoint
	:rtype: None") SetCoordinate;
		void SetCoordinate (const opencascade::handle<StepFEA_FeaParametricPoint> & Coordinate);

		/****************** StepFEA_CurveElementLocation ******************/
		%feature("compactdefaultargs") StepFEA_CurveElementLocation;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_CurveElementLocation;
		 StepFEA_CurveElementLocation ();

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
		/****************** ApplicationDefinedDegreeOfFreedom ******************/
		%feature("compactdefaultargs") ApplicationDefinedDegreeOfFreedom;
		%feature("autodoc", "* Returns Value as ApplicationDefinedDegreeOfFreedom (or Null if another type)
	:rtype: opencascade::handle<TCollection_HAsciiString>") ApplicationDefinedDegreeOfFreedom;
		opencascade::handle<TCollection_HAsciiString> ApplicationDefinedDegreeOfFreedom ();

		/****************** CaseMem ******************/
		%feature("compactdefaultargs") CaseMem;
		%feature("autodoc", "* Recognizes a items of select member CurveElementFreedomMember 1 -> EnumeratedCurveElementFreedom 2 -> ApplicationDefinedDegreeOfFreedom 0 else
	:param ent:
	:type ent: StepData_SelectMember
	:rtype: int") CaseMem;
		virtual Standard_Integer CaseMem (const opencascade::handle<StepData_SelectMember> & ent);

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "* Recognizes a kind of CurveElementFreedom select type return 0
	:param ent:
	:type ent: Standard_Transient
	:rtype: int") CaseNum;
		Standard_Integer CaseNum (const opencascade::handle<Standard_Transient> & ent);

		/****************** EnumeratedDegreeOfFreedom ******************/
		%feature("compactdefaultargs") EnumeratedDegreeOfFreedom;
		%feature("autodoc", "* Returns Value as EnumeratedDegreeOfFreedom (or Null if another type)
	:rtype: StepFEA_EnumeratedDegreeOfFreedom") EnumeratedDegreeOfFreedom;
		StepFEA_EnumeratedDegreeOfFreedom EnumeratedDegreeOfFreedom ();

		/****************** NewMember ******************/
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", "* Returns a new select member the type CurveElementFreedomMember
	:rtype: opencascade::handle<StepData_SelectMember>") NewMember;
		virtual opencascade::handle<StepData_SelectMember> NewMember ();

		/****************** SetApplicationDefinedDegreeOfFreedom ******************/
		%feature("compactdefaultargs") SetApplicationDefinedDegreeOfFreedom;
		%feature("autodoc", "* Set Value for ApplicationDefinedDegreeOfFreedom
	:param aVal:
	:type aVal: TCollection_HAsciiString
	:rtype: None") SetApplicationDefinedDegreeOfFreedom;
		void SetApplicationDefinedDegreeOfFreedom (const opencascade::handle<TCollection_HAsciiString> & aVal);

		/****************** SetEnumeratedDegreeOfFreedom ******************/
		%feature("compactdefaultargs") SetEnumeratedDegreeOfFreedom;
		%feature("autodoc", "* Returns Value as EnumeratedDegreeOfFreedom (or Null if another type)
	:param aVal:
	:type aVal: StepFEA_EnumeratedDegreeOfFreedom
	:rtype: None") SetEnumeratedDegreeOfFreedom;
		void SetEnumeratedDegreeOfFreedom (const StepFEA_EnumeratedDegreeOfFreedom aVal);

		/****************** StepFEA_DegreeOfFreedom ******************/
		%feature("compactdefaultargs") StepFEA_DegreeOfFreedom;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_DegreeOfFreedom;
		 StepFEA_DegreeOfFreedom ();

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
		/****************** HasName ******************/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "* Returns True if has name
	:rtype: bool") HasName;
		virtual Standard_Boolean HasName ();

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "* Tells if the name of a SelectMember matches a given one;
	:param name:
	:type name: char *
	:rtype: bool") Matches;
		virtual Standard_Boolean Matches (const char * name);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "* Returns set name
	:rtype: char *") Name;
		virtual const char * Name ();

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "* Set name
	:param name:
	:type name: char *
	:rtype: bool") SetName;
		virtual Standard_Boolean SetName (const char * name);

		/****************** StepFEA_DegreeOfFreedomMember ******************/
		%feature("compactdefaultargs") StepFEA_DegreeOfFreedomMember;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_DegreeOfFreedomMember;
		 StepFEA_DegreeOfFreedomMember ();

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
		/****************** Aspect ******************/
		%feature("compactdefaultargs") Aspect;
		%feature("autodoc", "* Returns field Aspect
	:rtype: StepElement_ElementAspect") Aspect;
		StepElement_ElementAspect Aspect ();

		/****************** ElementRef ******************/
		%feature("compactdefaultargs") ElementRef;
		%feature("autodoc", "* Returns field ElementRef
	:rtype: StepFEA_ElementOrElementGroup") ElementRef;
		StepFEA_ElementOrElementGroup ElementRef ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aElementRef:
	:type aElementRef: StepFEA_ElementOrElementGroup
	:param aItem:
	:type aItem: StepElement_AnalysisItemWithinRepresentation
	:param aAspect:
	:type aAspect: StepElement_ElementAspect
	:rtype: None") Init;
		void Init (const StepFEA_ElementOrElementGroup & aElementRef,const opencascade::handle<StepElement_AnalysisItemWithinRepresentation> & aItem,const StepElement_ElementAspect & aAspect);

		/****************** Item ******************/
		%feature("compactdefaultargs") Item;
		%feature("autodoc", "* Returns field Item
	:rtype: opencascade::handle<StepElement_AnalysisItemWithinRepresentation>") Item;
		opencascade::handle<StepElement_AnalysisItemWithinRepresentation> Item ();

		/****************** SetAspect ******************/
		%feature("compactdefaultargs") SetAspect;
		%feature("autodoc", "* Set field Aspect
	:param Aspect:
	:type Aspect: StepElement_ElementAspect
	:rtype: None") SetAspect;
		void SetAspect (const StepElement_ElementAspect & Aspect);

		/****************** SetElementRef ******************/
		%feature("compactdefaultargs") SetElementRef;
		%feature("autodoc", "* Set field ElementRef
	:param ElementRef:
	:type ElementRef: StepFEA_ElementOrElementGroup
	:rtype: None") SetElementRef;
		void SetElementRef (const StepFEA_ElementOrElementGroup & ElementRef);

		/****************** SetItem ******************/
		%feature("compactdefaultargs") SetItem;
		%feature("autodoc", "* Set field Item
	:param Item:
	:type Item: StepElement_AnalysisItemWithinRepresentation
	:rtype: None") SetItem;
		void SetItem (const opencascade::handle<StepElement_AnalysisItemWithinRepresentation> & Item);

		/****************** StepFEA_ElementGeometricRelationship ******************/
		%feature("compactdefaultargs") StepFEA_ElementGeometricRelationship;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_ElementGeometricRelationship;
		 StepFEA_ElementGeometricRelationship ();

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
		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "* Recognizes a kind of ElementOrElementGroup select type 1 -> ElementRepresentation from StepFEA 2 -> ElementGroup from StepFEA 0 else
	:param ent:
	:type ent: Standard_Transient
	:rtype: int") CaseNum;
		Standard_Integer CaseNum (const opencascade::handle<Standard_Transient> & ent);

		/****************** ElementGroup ******************/
		%feature("compactdefaultargs") ElementGroup;
		%feature("autodoc", "* Returns Value as ElementGroup (or Null if another type)
	:rtype: opencascade::handle<StepFEA_ElementGroup>") ElementGroup;
		opencascade::handle<StepFEA_ElementGroup> ElementGroup ();

		/****************** ElementRepresentation ******************/
		%feature("compactdefaultargs") ElementRepresentation;
		%feature("autodoc", "* Returns Value as ElementRepresentation (or Null if another type)
	:rtype: opencascade::handle<StepFEA_ElementRepresentation>") ElementRepresentation;
		opencascade::handle<StepFEA_ElementRepresentation> ElementRepresentation ();

		/****************** StepFEA_ElementOrElementGroup ******************/
		%feature("compactdefaultargs") StepFEA_ElementOrElementGroup;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_ElementOrElementGroup;
		 StepFEA_ElementOrElementGroup ();

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
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aRepresentation_Name:
	:type aRepresentation_Name: TCollection_HAsciiString
	:param aRepresentation_Items:
	:type aRepresentation_Items: StepRepr_HArray1OfRepresentationItem
	:param aRepresentation_ContextOfItems:
	:type aRepresentation_ContextOfItems: StepRepr_RepresentationContext
	:param aNodeList:
	:type aNodeList: StepFEA_HArray1OfNodeRepresentation
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aRepresentation_Name,const opencascade::handle<StepRepr_HArray1OfRepresentationItem> & aRepresentation_Items,const opencascade::handle<StepRepr_RepresentationContext> & aRepresentation_ContextOfItems,const opencascade::handle<StepFEA_HArray1OfNodeRepresentation> & aNodeList);

		/****************** NodeList ******************/
		%feature("compactdefaultargs") NodeList;
		%feature("autodoc", "* Returns field NodeList
	:rtype: opencascade::handle<StepFEA_HArray1OfNodeRepresentation>") NodeList;
		opencascade::handle<StepFEA_HArray1OfNodeRepresentation> NodeList ();

		/****************** SetNodeList ******************/
		%feature("compactdefaultargs") SetNodeList;
		%feature("autodoc", "* Set field NodeList
	:param NodeList:
	:type NodeList: StepFEA_HArray1OfNodeRepresentation
	:rtype: None") SetNodeList;
		void SetNodeList (const opencascade::handle<StepFEA_HArray1OfNodeRepresentation> & NodeList);

		/****************** StepFEA_ElementRepresentation ******************/
		%feature("compactdefaultargs") StepFEA_ElementRepresentation;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_ElementRepresentation;
		 StepFEA_ElementRepresentation ();

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
		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "* Returns field Description
	:rtype: opencascade::handle<TCollection_HAsciiString>") Description;
		opencascade::handle<TCollection_HAsciiString> Description ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: TCollection_HAsciiString
	:param aPlacement_Location:
	:type aPlacement_Location: StepGeom_CartesianPoint
	:param hasAxis2Placement3d_Axis:
	:type hasAxis2Placement3d_Axis: bool
	:param aAxis2Placement3d_Axis:
	:type aAxis2Placement3d_Axis: StepGeom_Direction
	:param hasAxis2Placement3d_RefDirection:
	:type hasAxis2Placement3d_RefDirection: bool
	:param aAxis2Placement3d_RefDirection:
	:type aAxis2Placement3d_RefDirection: StepGeom_Direction
	:param aSystemType:
	:type aSystemType: StepFEA_CoordinateSystemType
	:param aDescription:
	:type aDescription: TCollection_HAsciiString
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name,const opencascade::handle<StepGeom_CartesianPoint> & aPlacement_Location,const Standard_Boolean hasAxis2Placement3d_Axis,const opencascade::handle<StepGeom_Direction> & aAxis2Placement3d_Axis,const Standard_Boolean hasAxis2Placement3d_RefDirection,const opencascade::handle<StepGeom_Direction> & aAxis2Placement3d_RefDirection,const StepFEA_CoordinateSystemType aSystemType,const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "* Set field Description
	:param Description:
	:type Description: TCollection_HAsciiString
	:rtype: None") SetDescription;
		void SetDescription (const opencascade::handle<TCollection_HAsciiString> & Description);

		/****************** SetSystemType ******************/
		%feature("compactdefaultargs") SetSystemType;
		%feature("autodoc", "* Set field SystemType
	:param SystemType:
	:type SystemType: StepFEA_CoordinateSystemType
	:rtype: None") SetSystemType;
		void SetSystemType (const StepFEA_CoordinateSystemType SystemType);

		/****************** StepFEA_FeaAxis2Placement3d ******************/
		%feature("compactdefaultargs") StepFEA_FeaAxis2Placement3d;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_FeaAxis2Placement3d;
		 StepFEA_FeaAxis2Placement3d ();

		/****************** SystemType ******************/
		%feature("compactdefaultargs") SystemType;
		%feature("autodoc", "* Returns field SystemType
	:rtype: StepFEA_CoordinateSystemType") SystemType;
		StepFEA_CoordinateSystemType SystemType ();

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
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aSectionRef:
	:type aSectionRef: StepElement_CurveElementSectionDefinition
	:param aItem:
	:type aItem: StepElement_AnalysisItemWithinRepresentation
	:rtype: None") Init;
		void Init (const opencascade::handle<StepElement_CurveElementSectionDefinition> & aSectionRef,const opencascade::handle<StepElement_AnalysisItemWithinRepresentation> & aItem);

		/****************** Item ******************/
		%feature("compactdefaultargs") Item;
		%feature("autodoc", "* Returns field Item
	:rtype: opencascade::handle<StepElement_AnalysisItemWithinRepresentation>") Item;
		opencascade::handle<StepElement_AnalysisItemWithinRepresentation> Item ();

		/****************** SectionRef ******************/
		%feature("compactdefaultargs") SectionRef;
		%feature("autodoc", "* Returns field SectionRef
	:rtype: opencascade::handle<StepElement_CurveElementSectionDefinition>") SectionRef;
		opencascade::handle<StepElement_CurveElementSectionDefinition> SectionRef ();

		/****************** SetItem ******************/
		%feature("compactdefaultargs") SetItem;
		%feature("autodoc", "* Set field Item
	:param Item:
	:type Item: StepElement_AnalysisItemWithinRepresentation
	:rtype: None") SetItem;
		void SetItem (const opencascade::handle<StepElement_AnalysisItemWithinRepresentation> & Item);

		/****************** SetSectionRef ******************/
		%feature("compactdefaultargs") SetSectionRef;
		%feature("autodoc", "* Set field SectionRef
	:param SectionRef:
	:type SectionRef: StepElement_CurveElementSectionDefinition
	:rtype: None") SetSectionRef;
		void SetSectionRef (const opencascade::handle<StepElement_CurveElementSectionDefinition> & SectionRef);

		/****************** StepFEA_FeaCurveSectionGeometricRelationship ******************/
		%feature("compactdefaultargs") StepFEA_FeaCurveSectionGeometricRelationship;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_FeaCurveSectionGeometricRelationship;
		 StepFEA_FeaCurveSectionGeometricRelationship ();

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
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aGroup_Name:
	:type aGroup_Name: TCollection_HAsciiString
	:param aGroup_Description:
	:type aGroup_Description: TCollection_HAsciiString
	:param aModelRef:
	:type aModelRef: StepFEA_FeaModel
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aGroup_Name,const opencascade::handle<TCollection_HAsciiString> & aGroup_Description,const opencascade::handle<StepFEA_FeaModel> & aModelRef);

		/****************** ModelRef ******************/
		%feature("compactdefaultargs") ModelRef;
		%feature("autodoc", "* Returns field ModelRef
	:rtype: opencascade::handle<StepFEA_FeaModel>") ModelRef;
		opencascade::handle<StepFEA_FeaModel> ModelRef ();

		/****************** SetModelRef ******************/
		%feature("compactdefaultargs") SetModelRef;
		%feature("autodoc", "* Set field ModelRef
	:param ModelRef:
	:type ModelRef: StepFEA_FeaModel
	:rtype: None") SetModelRef;
		void SetModelRef (const opencascade::handle<StepFEA_FeaModel> & ModelRef);

		/****************** StepFEA_FeaGroup ******************/
		%feature("compactdefaultargs") StepFEA_FeaGroup;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_FeaGroup;
		 StepFEA_FeaGroup ();

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
		/****************** StepFEA_FeaMaterialPropertyRepresentation ******************/
		%feature("compactdefaultargs") StepFEA_FeaMaterialPropertyRepresentation;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_FeaMaterialPropertyRepresentation;
		 StepFEA_FeaMaterialPropertyRepresentation ();

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
		/****************** StepFEA_FeaMaterialPropertyRepresentationItem ******************/
		%feature("compactdefaultargs") StepFEA_FeaMaterialPropertyRepresentationItem;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_FeaMaterialPropertyRepresentationItem;
		 StepFEA_FeaMaterialPropertyRepresentationItem ();

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
		/****************** AnalysisType ******************/
		%feature("compactdefaultargs") AnalysisType;
		%feature("autodoc", "* Returns field AnalysisType
	:rtype: opencascade::handle<TCollection_HAsciiString>") AnalysisType;
		opencascade::handle<TCollection_HAsciiString> AnalysisType ();

		/****************** CreatingSoftware ******************/
		%feature("compactdefaultargs") CreatingSoftware;
		%feature("autodoc", "* Returns field CreatingSoftware
	:rtype: opencascade::handle<TCollection_HAsciiString>") CreatingSoftware;
		opencascade::handle<TCollection_HAsciiString> CreatingSoftware ();

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "* Returns field Description
	:rtype: opencascade::handle<TCollection_HAsciiString>") Description;
		opencascade::handle<TCollection_HAsciiString> Description ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aRepresentation_Name:
	:type aRepresentation_Name: TCollection_HAsciiString
	:param aRepresentation_Items:
	:type aRepresentation_Items: StepRepr_HArray1OfRepresentationItem
	:param aRepresentation_ContextOfItems:
	:type aRepresentation_ContextOfItems: StepRepr_RepresentationContext
	:param aCreatingSoftware:
	:type aCreatingSoftware: TCollection_HAsciiString
	:param aIntendedAnalysisCode:
	:type aIntendedAnalysisCode: TColStd_HArray1OfAsciiString
	:param aDescription:
	:type aDescription: TCollection_HAsciiString
	:param aAnalysisType:
	:type aAnalysisType: TCollection_HAsciiString
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aRepresentation_Name,const opencascade::handle<StepRepr_HArray1OfRepresentationItem> & aRepresentation_Items,const opencascade::handle<StepRepr_RepresentationContext> & aRepresentation_ContextOfItems,const opencascade::handle<TCollection_HAsciiString> & aCreatingSoftware,const opencascade::handle<TColStd_HArray1OfAsciiString> & aIntendedAnalysisCode,const opencascade::handle<TCollection_HAsciiString> & aDescription,const opencascade::handle<TCollection_HAsciiString> & aAnalysisType);

		/****************** IntendedAnalysisCode ******************/
		%feature("compactdefaultargs") IntendedAnalysisCode;
		%feature("autodoc", "* Returns field IntendedAnalysisCode
	:rtype: opencascade::handle<TColStd_HArray1OfAsciiString>") IntendedAnalysisCode;
		opencascade::handle<TColStd_HArray1OfAsciiString> IntendedAnalysisCode ();

		/****************** SetAnalysisType ******************/
		%feature("compactdefaultargs") SetAnalysisType;
		%feature("autodoc", "* Set field AnalysisType
	:param AnalysisType:
	:type AnalysisType: TCollection_HAsciiString
	:rtype: None") SetAnalysisType;
		void SetAnalysisType (const opencascade::handle<TCollection_HAsciiString> & AnalysisType);

		/****************** SetCreatingSoftware ******************/
		%feature("compactdefaultargs") SetCreatingSoftware;
		%feature("autodoc", "* Set field CreatingSoftware
	:param CreatingSoftware:
	:type CreatingSoftware: TCollection_HAsciiString
	:rtype: None") SetCreatingSoftware;
		void SetCreatingSoftware (const opencascade::handle<TCollection_HAsciiString> & CreatingSoftware);

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "* Set field Description
	:param Description:
	:type Description: TCollection_HAsciiString
	:rtype: None") SetDescription;
		void SetDescription (const opencascade::handle<TCollection_HAsciiString> & Description);

		/****************** SetIntendedAnalysisCode ******************/
		%feature("compactdefaultargs") SetIntendedAnalysisCode;
		%feature("autodoc", "* Set field IntendedAnalysisCode
	:param IntendedAnalysisCode:
	:type IntendedAnalysisCode: TColStd_HArray1OfAsciiString
	:rtype: None") SetIntendedAnalysisCode;
		void SetIntendedAnalysisCode (const opencascade::handle<TColStd_HArray1OfAsciiString> & IntendedAnalysisCode);

		/****************** StepFEA_FeaModel ******************/
		%feature("compactdefaultargs") StepFEA_FeaModel;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_FeaModel;
		 StepFEA_FeaModel ();

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
		/****************** StepFEA_FeaModelDefinition ******************/
		%feature("compactdefaultargs") StepFEA_FeaModelDefinition;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_FeaModelDefinition;
		 StepFEA_FeaModelDefinition ();

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
		/****************** Coordinates ******************/
		%feature("compactdefaultargs") Coordinates;
		%feature("autodoc", "* Returns field Coordinates
	:rtype: opencascade::handle<TColStd_HArray1OfReal>") Coordinates;
		opencascade::handle<TColStd_HArray1OfReal> Coordinates ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: TCollection_HAsciiString
	:param aCoordinates:
	:type aCoordinates: TColStd_HArray1OfReal
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name,const opencascade::handle<TColStd_HArray1OfReal> & aCoordinates);

		/****************** SetCoordinates ******************/
		%feature("compactdefaultargs") SetCoordinates;
		%feature("autodoc", "* Set field Coordinates
	:param Coordinates:
	:type Coordinates: TColStd_HArray1OfReal
	:rtype: None") SetCoordinates;
		void SetCoordinates (const opencascade::handle<TColStd_HArray1OfReal> & Coordinates);

		/****************** StepFEA_FeaParametricPoint ******************/
		%feature("compactdefaultargs") StepFEA_FeaParametricPoint;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_FeaParametricPoint;
		 StepFEA_FeaParametricPoint ();

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
		/****************** StepFEA_FeaRepresentationItem ******************/
		%feature("compactdefaultargs") StepFEA_FeaRepresentationItem;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_FeaRepresentationItem;
		 StepFEA_FeaRepresentationItem ();

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
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aSectionRef:
	:type aSectionRef: StepElement_SurfaceSection
	:param aItem:
	:type aItem: StepElement_AnalysisItemWithinRepresentation
	:rtype: None") Init;
		void Init (const opencascade::handle<StepElement_SurfaceSection> & aSectionRef,const opencascade::handle<StepElement_AnalysisItemWithinRepresentation> & aItem);

		/****************** Item ******************/
		%feature("compactdefaultargs") Item;
		%feature("autodoc", "* Returns field Item
	:rtype: opencascade::handle<StepElement_AnalysisItemWithinRepresentation>") Item;
		opencascade::handle<StepElement_AnalysisItemWithinRepresentation> Item ();

		/****************** SectionRef ******************/
		%feature("compactdefaultargs") SectionRef;
		%feature("autodoc", "* Returns field SectionRef
	:rtype: opencascade::handle<StepElement_SurfaceSection>") SectionRef;
		opencascade::handle<StepElement_SurfaceSection> SectionRef ();

		/****************** SetItem ******************/
		%feature("compactdefaultargs") SetItem;
		%feature("autodoc", "* Set field Item
	:param Item:
	:type Item: StepElement_AnalysisItemWithinRepresentation
	:rtype: None") SetItem;
		void SetItem (const opencascade::handle<StepElement_AnalysisItemWithinRepresentation> & Item);

		/****************** SetSectionRef ******************/
		%feature("compactdefaultargs") SetSectionRef;
		%feature("autodoc", "* Set field SectionRef
	:param SectionRef:
	:type SectionRef: StepElement_SurfaceSection
	:rtype: None") SetSectionRef;
		void SetSectionRef (const opencascade::handle<StepElement_SurfaceSection> & SectionRef);

		/****************** StepFEA_FeaSurfaceSectionGeometricRelationship ******************/
		%feature("compactdefaultargs") StepFEA_FeaSurfaceSectionGeometricRelationship;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_FeaSurfaceSectionGeometricRelationship;
		 StepFEA_FeaSurfaceSectionGeometricRelationship ();

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
		/****************** A ******************/
		%feature("compactdefaultargs") A;
		%feature("autodoc", "* Returns field A
	:rtype: StepElement_MeasureOrUnspecifiedValue") A;
		StepElement_MeasureOrUnspecifiedValue A ();

		/****************** Freedom ******************/
		%feature("compactdefaultargs") Freedom;
		%feature("autodoc", "* Returns field Freedom
	:rtype: StepFEA_DegreeOfFreedom") Freedom;
		StepFEA_DegreeOfFreedom Freedom ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aFreedom:
	:type aFreedom: StepFEA_DegreeOfFreedom
	:param aA:
	:type aA: StepElement_MeasureOrUnspecifiedValue
	:rtype: None") Init;
		void Init (const StepFEA_DegreeOfFreedom & aFreedom,const StepElement_MeasureOrUnspecifiedValue & aA);

		/****************** SetA ******************/
		%feature("compactdefaultargs") SetA;
		%feature("autodoc", "* Set field A
	:param A:
	:type A: StepElement_MeasureOrUnspecifiedValue
	:rtype: None") SetA;
		void SetA (const StepElement_MeasureOrUnspecifiedValue & A);

		/****************** SetFreedom ******************/
		%feature("compactdefaultargs") SetFreedom;
		%feature("autodoc", "* Set field Freedom
	:param Freedom:
	:type Freedom: StepFEA_DegreeOfFreedom
	:rtype: None") SetFreedom;
		void SetFreedom (const StepFEA_DegreeOfFreedom & Freedom);

		/****************** StepFEA_FreedomAndCoefficient ******************/
		%feature("compactdefaultargs") StepFEA_FreedomAndCoefficient;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_FreedomAndCoefficient;
		 StepFEA_FreedomAndCoefficient ();

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
		/****************** Freedoms ******************/
		%feature("compactdefaultargs") Freedoms;
		%feature("autodoc", "* Returns field Freedoms
	:rtype: opencascade::handle<StepFEA_HArray1OfDegreeOfFreedom>") Freedoms;
		opencascade::handle<StepFEA_HArray1OfDegreeOfFreedom> Freedoms ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aFreedoms:
	:type aFreedoms: StepFEA_HArray1OfDegreeOfFreedom
	:rtype: None") Init;
		void Init (const opencascade::handle<StepFEA_HArray1OfDegreeOfFreedom> & aFreedoms);

		/****************** SetFreedoms ******************/
		%feature("compactdefaultargs") SetFreedoms;
		%feature("autodoc", "* Set field Freedoms
	:param Freedoms:
	:type Freedoms: StepFEA_HArray1OfDegreeOfFreedom
	:rtype: None") SetFreedoms;
		void SetFreedoms (const opencascade::handle<StepFEA_HArray1OfDegreeOfFreedom> & Freedoms);

		/****************** StepFEA_FreedomsList ******************/
		%feature("compactdefaultargs") StepFEA_FreedomsList;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_FreedomsList;
		 StepFEA_FreedomsList ();

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
		/****************** StepFEA_NodeDefinition ******************/
		%feature("compactdefaultargs") StepFEA_NodeDefinition;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_NodeDefinition;
		 StepFEA_NodeDefinition ();

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
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aRepresentation_Name:
	:type aRepresentation_Name: TCollection_HAsciiString
	:param aRepresentation_Items:
	:type aRepresentation_Items: StepRepr_HArray1OfRepresentationItem
	:param aRepresentation_ContextOfItems:
	:type aRepresentation_ContextOfItems: StepRepr_RepresentationContext
	:param aModelRef:
	:type aModelRef: StepFEA_FeaModel
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aRepresentation_Name,const opencascade::handle<StepRepr_HArray1OfRepresentationItem> & aRepresentation_Items,const opencascade::handle<StepRepr_RepresentationContext> & aRepresentation_ContextOfItems,const opencascade::handle<StepFEA_FeaModel> & aModelRef);

		/****************** ModelRef ******************/
		%feature("compactdefaultargs") ModelRef;
		%feature("autodoc", "* Returns field ModelRef
	:rtype: opencascade::handle<StepFEA_FeaModel>") ModelRef;
		opencascade::handle<StepFEA_FeaModel> ModelRef ();

		/****************** SetModelRef ******************/
		%feature("compactdefaultargs") SetModelRef;
		%feature("autodoc", "* Set field ModelRef
	:param ModelRef:
	:type ModelRef: StepFEA_FeaModel
	:rtype: None") SetModelRef;
		void SetModelRef (const opencascade::handle<StepFEA_FeaModel> & ModelRef);

		/****************** StepFEA_NodeRepresentation ******************/
		%feature("compactdefaultargs") StepFEA_NodeRepresentation;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_NodeRepresentation;
		 StepFEA_NodeRepresentation ();

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
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: TCollection_HAsciiString
	:param aNodes:
	:type aNodes: StepFEA_HArray1OfNodeRepresentation
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name,const opencascade::handle<StepFEA_HArray1OfNodeRepresentation> & aNodes);

		/****************** Nodes ******************/
		%feature("compactdefaultargs") Nodes;
		%feature("autodoc", "* Returns field Nodes
	:rtype: opencascade::handle<StepFEA_HArray1OfNodeRepresentation>") Nodes;
		opencascade::handle<StepFEA_HArray1OfNodeRepresentation> Nodes ();

		/****************** SetNodes ******************/
		%feature("compactdefaultargs") SetNodes;
		%feature("autodoc", "* Set field Nodes
	:param Nodes:
	:type Nodes: StepFEA_HArray1OfNodeRepresentation
	:rtype: None") SetNodes;
		void SetNodes (const opencascade::handle<StepFEA_HArray1OfNodeRepresentation> & Nodes);

		/****************** StepFEA_NodeSet ******************/
		%feature("compactdefaultargs") StepFEA_NodeSet;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_NodeSet;
		 StepFEA_NodeSet ();

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
		/****************** AnisotropicSymmetricTensor22d ******************/
		%feature("compactdefaultargs") AnisotropicSymmetricTensor22d;
		%feature("autodoc", "* Returns Value as AnisotropicSymmetricTensor22d (or Null if another type)
	:rtype: opencascade::handle<TColStd_HArray1OfReal>") AnisotropicSymmetricTensor22d;
		opencascade::handle<TColStd_HArray1OfReal> AnisotropicSymmetricTensor22d ();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "* Recognizes a kind of SymmetricTensor22d select type 1 -> HArray1OfReal from TColStd 0 else
	:param ent:
	:type ent: Standard_Transient
	:rtype: int") CaseNum;
		Standard_Integer CaseNum (const opencascade::handle<Standard_Transient> & ent);

		/****************** StepFEA_SymmetricTensor22d ******************/
		%feature("compactdefaultargs") StepFEA_SymmetricTensor22d;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_SymmetricTensor22d;
		 StepFEA_SymmetricTensor22d ();

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
		/****************** AnisotropicSymmetricTensor23d ******************/
		%feature("compactdefaultargs") AnisotropicSymmetricTensor23d;
		%feature("autodoc", "* Returns Value as AnisotropicSymmetricTensor23d (or Null if another type)
	:rtype: opencascade::handle<TColStd_HArray1OfReal>") AnisotropicSymmetricTensor23d;
		opencascade::handle<TColStd_HArray1OfReal> AnisotropicSymmetricTensor23d ();

		/****************** CaseMem ******************/
		%feature("compactdefaultargs") CaseMem;
		%feature("autodoc", "* Recognizes a items of select member SymmetricTensor23dMember 1 -> IsotropicSymmetricTensor23d 2 -> OrthotropicSymmetricTensor23d 3 -> AnisotropicSymmetricTensor23d 0 else
	:param ent:
	:type ent: StepData_SelectMember
	:rtype: int") CaseMem;
		virtual Standard_Integer CaseMem (const opencascade::handle<StepData_SelectMember> & ent);

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "* Recognizes a kind of SymmetricTensor23d select type return 0
	:param ent:
	:type ent: Standard_Transient
	:rtype: int") CaseNum;
		Standard_Integer CaseNum (const opencascade::handle<Standard_Transient> & ent);

		/****************** IsotropicSymmetricTensor23d ******************/
		%feature("compactdefaultargs") IsotropicSymmetricTensor23d;
		%feature("autodoc", "* Returns Value as IsotropicSymmetricTensor23d (or Null if another type)
	:rtype: float") IsotropicSymmetricTensor23d;
		Standard_Real IsotropicSymmetricTensor23d ();

		/****************** NewMember ******************/
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", "* Returns a new select member the type SymmetricTensor23dMember
	:rtype: opencascade::handle<StepData_SelectMember>") NewMember;
		virtual opencascade::handle<StepData_SelectMember> NewMember ();

		/****************** OrthotropicSymmetricTensor23d ******************/
		%feature("compactdefaultargs") OrthotropicSymmetricTensor23d;
		%feature("autodoc", "* Returns Value as OrthotropicSymmetricTensor23d (or Null if another type)
	:rtype: opencascade::handle<TColStd_HArray1OfReal>") OrthotropicSymmetricTensor23d;
		opencascade::handle<TColStd_HArray1OfReal> OrthotropicSymmetricTensor23d ();

		/****************** SetAnisotropicSymmetricTensor23d ******************/
		%feature("compactdefaultargs") SetAnisotropicSymmetricTensor23d;
		%feature("autodoc", "* Set Value for AnisotropicSymmetricTensor23d
	:param aVal:
	:type aVal: TColStd_HArray1OfReal
	:rtype: None") SetAnisotropicSymmetricTensor23d;
		void SetAnisotropicSymmetricTensor23d (const opencascade::handle<TColStd_HArray1OfReal> & aVal);

		/****************** SetIsotropicSymmetricTensor23d ******************/
		%feature("compactdefaultargs") SetIsotropicSymmetricTensor23d;
		%feature("autodoc", "* Set Value for IsotropicSymmetricTensor23d
	:param aVal:
	:type aVal: float
	:rtype: None") SetIsotropicSymmetricTensor23d;
		void SetIsotropicSymmetricTensor23d (const Standard_Real aVal);

		/****************** SetOrthotropicSymmetricTensor23d ******************/
		%feature("compactdefaultargs") SetOrthotropicSymmetricTensor23d;
		%feature("autodoc", "* Set Value for OrthotropicSymmetricTensor23d
	:param aVal:
	:type aVal: TColStd_HArray1OfReal
	:rtype: None") SetOrthotropicSymmetricTensor23d;
		void SetOrthotropicSymmetricTensor23d (const opencascade::handle<TColStd_HArray1OfReal> & aVal);

		/****************** StepFEA_SymmetricTensor23d ******************/
		%feature("compactdefaultargs") StepFEA_SymmetricTensor23d;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_SymmetricTensor23d;
		 StepFEA_SymmetricTensor23d ();

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
		/****************** HasName ******************/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "* Returns True if has name
	:rtype: bool") HasName;
		virtual Standard_Boolean HasName ();

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "* Tells if the name of a SelectMember matches a given one;
	:param name:
	:type name: char *
	:rtype: bool") Matches;
		virtual Standard_Boolean Matches (const char * name);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "* Returns set name
	:rtype: char *") Name;
		virtual const char * Name ();

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "* Set name
	:param name:
	:type name: char *
	:rtype: bool") SetName;
		virtual Standard_Boolean SetName (const char * name);

		/****************** StepFEA_SymmetricTensor23dMember ******************/
		%feature("compactdefaultargs") StepFEA_SymmetricTensor23dMember;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_SymmetricTensor23dMember;
		 StepFEA_SymmetricTensor23dMember ();

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
		/****************** AnisotropicSymmetricTensor42d ******************/
		%feature("compactdefaultargs") AnisotropicSymmetricTensor42d;
		%feature("autodoc", "* Returns Value as AnisotropicSymmetricTensor42d (or Null if another type)
	:rtype: opencascade::handle<TColStd_HArray1OfReal>") AnisotropicSymmetricTensor42d;
		opencascade::handle<TColStd_HArray1OfReal> AnisotropicSymmetricTensor42d ();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "* Recognizes a kind of SymmetricTensor42d select type 1 -> HArray1OfReal from TColStd 0 else
	:param ent:
	:type ent: Standard_Transient
	:rtype: int") CaseNum;
		Standard_Integer CaseNum (const opencascade::handle<Standard_Transient> & ent);

		/****************** StepFEA_SymmetricTensor42d ******************/
		%feature("compactdefaultargs") StepFEA_SymmetricTensor42d;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_SymmetricTensor42d;
		 StepFEA_SymmetricTensor42d ();

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
		/****************** AnisotropicSymmetricTensor43d ******************/
		%feature("compactdefaultargs") AnisotropicSymmetricTensor43d;
		%feature("autodoc", "* Returns Value as AnisotropicSymmetricTensor43d (or Null if another type)
	:rtype: opencascade::handle<TColStd_HArray1OfReal>") AnisotropicSymmetricTensor43d;
		opencascade::handle<TColStd_HArray1OfReal> AnisotropicSymmetricTensor43d ();

		/****************** CaseMem ******************/
		%feature("compactdefaultargs") CaseMem;
		%feature("autodoc", "* Recognizes a items of select member CurveElementFreedomMember 1 -> AnisotropicSymmetricTensor43d 2 -> FeaIsotropicSymmetricTensor43d 3 -> FeaIsoOrthotropicSymmetricTensor43d 4 -> FeaTransverseIsotropicSymmetricTensor43d 5 -> FeaColumnNormalisedOrthotropicSymmetricTensor43d 6 -> FeaColumnNormalisedMonoclinicSymmetricTensor43d 0 else
	:param ent:
	:type ent: StepData_SelectMember
	:rtype: int") CaseMem;
		virtual Standard_Integer CaseMem (const opencascade::handle<StepData_SelectMember> & ent);

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "* return 0
	:param ent:
	:type ent: Standard_Transient
	:rtype: int") CaseNum;
		Standard_Integer CaseNum (const opencascade::handle<Standard_Transient> & ent);

		/****************** FeaColumnNormalisedMonoclinicSymmetricTensor43d ******************/
		%feature("compactdefaultargs") FeaColumnNormalisedMonoclinicSymmetricTensor43d;
		%feature("autodoc", "* Returns Value as FeaColumnNormalisedMonoclinicSymmetricTensor43d (or Null if another type)
	:rtype: opencascade::handle<TColStd_HArray1OfReal>") FeaColumnNormalisedMonoclinicSymmetricTensor43d;
		opencascade::handle<TColStd_HArray1OfReal> FeaColumnNormalisedMonoclinicSymmetricTensor43d ();

		/****************** FeaColumnNormalisedOrthotropicSymmetricTensor43d ******************/
		%feature("compactdefaultargs") FeaColumnNormalisedOrthotropicSymmetricTensor43d;
		%feature("autodoc", "* Returns Value as FeaColumnNormalisedOrthotropicSymmetricTensor43d (or Null if another type)
	:rtype: opencascade::handle<TColStd_HArray1OfReal>") FeaColumnNormalisedOrthotropicSymmetricTensor43d;
		opencascade::handle<TColStd_HArray1OfReal> FeaColumnNormalisedOrthotropicSymmetricTensor43d ();

		/****************** FeaIsoOrthotropicSymmetricTensor43d ******************/
		%feature("compactdefaultargs") FeaIsoOrthotropicSymmetricTensor43d;
		%feature("autodoc", "* Returns Value as FeaIsoOrthotropicSymmetricTensor43d (or Null if another type)
	:rtype: opencascade::handle<TColStd_HArray1OfReal>") FeaIsoOrthotropicSymmetricTensor43d;
		opencascade::handle<TColStd_HArray1OfReal> FeaIsoOrthotropicSymmetricTensor43d ();

		/****************** FeaTransverseIsotropicSymmetricTensor43d ******************/
		%feature("compactdefaultargs") FeaTransverseIsotropicSymmetricTensor43d;
		%feature("autodoc", "* Returns Value as FeaTransverseIsotropicSymmetricTensor43d (or Null if another type)
	:rtype: opencascade::handle<TColStd_HArray1OfReal>") FeaTransverseIsotropicSymmetricTensor43d;
		opencascade::handle<TColStd_HArray1OfReal> FeaTransverseIsotropicSymmetricTensor43d ();

		/****************** NewMember ******************/
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", ":rtype: opencascade::handle<StepData_SelectMember>") NewMember;
		virtual opencascade::handle<StepData_SelectMember> NewMember ();

		/****************** StepFEA_SymmetricTensor43d ******************/
		%feature("compactdefaultargs") StepFEA_SymmetricTensor43d;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_SymmetricTensor43d;
		 StepFEA_SymmetricTensor43d ();

};


%extend StepFEA_SymmetricTensor43d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class StepFEA_SymmetricTensor43dMember *
*****************************************/
class StepFEA_SymmetricTensor43dMember : public StepData_SelectArrReal {
	public:
		/****************** HasName ******************/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "* Returns True if has name
	:rtype: bool") HasName;
		virtual Standard_Boolean HasName ();

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "* Tells if the name of a SelectMember matches a given one;
	:param name:
	:type name: char *
	:rtype: bool") Matches;
		virtual Standard_Boolean Matches (const char * name);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "* Returns set name
	:rtype: char *") Name;
		virtual const char * Name ();

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "* Set name
	:param name:
	:type name: char *
	:rtype: bool") SetName;
		virtual Standard_Boolean SetName (const char * name);

		/****************** StepFEA_SymmetricTensor43dMember ******************/
		%feature("compactdefaultargs") StepFEA_SymmetricTensor43dMember;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_SymmetricTensor43dMember;
		 StepFEA_SymmetricTensor43dMember ();

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
		/****************** CoordinateSystem ******************/
		%feature("compactdefaultargs") CoordinateSystem;
		%feature("autodoc", "* Returns field CoordinateSystem
	:rtype: opencascade::handle<StepFEA_FeaAxis2Placement3d>") CoordinateSystem;
		opencascade::handle<StepFEA_FeaAxis2Placement3d> CoordinateSystem ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: TCollection_HAsciiString
	:param aCoordinateSystem:
	:type aCoordinateSystem: StepFEA_FeaAxis2Placement3d
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name,const opencascade::handle<StepFEA_FeaAxis2Placement3d> & aCoordinateSystem);

		/****************** SetCoordinateSystem ******************/
		%feature("compactdefaultargs") SetCoordinateSystem;
		%feature("autodoc", "* Set field CoordinateSystem
	:param CoordinateSystem:
	:type CoordinateSystem: StepFEA_FeaAxis2Placement3d
	:rtype: None") SetCoordinateSystem;
		void SetCoordinateSystem (const opencascade::handle<StepFEA_FeaAxis2Placement3d> & CoordinateSystem);

		/****************** StepFEA_AlignedCurve3dElementCoordinateSystem ******************/
		%feature("compactdefaultargs") StepFEA_AlignedCurve3dElementCoordinateSystem;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_AlignedCurve3dElementCoordinateSystem;
		 StepFEA_AlignedCurve3dElementCoordinateSystem ();

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
		/****************** CoordinateSystem ******************/
		%feature("compactdefaultargs") CoordinateSystem;
		%feature("autodoc", "* Returns field CoordinateSystem
	:rtype: opencascade::handle<StepFEA_FeaAxis2Placement3d>") CoordinateSystem;
		opencascade::handle<StepFEA_FeaAxis2Placement3d> CoordinateSystem ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: TCollection_HAsciiString
	:param aCoordinateSystem:
	:type aCoordinateSystem: StepFEA_FeaAxis2Placement3d
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name,const opencascade::handle<StepFEA_FeaAxis2Placement3d> & aCoordinateSystem);

		/****************** SetCoordinateSystem ******************/
		%feature("compactdefaultargs") SetCoordinateSystem;
		%feature("autodoc", "* Set field CoordinateSystem
	:param CoordinateSystem:
	:type CoordinateSystem: StepFEA_FeaAxis2Placement3d
	:rtype: None") SetCoordinateSystem;
		void SetCoordinateSystem (const opencascade::handle<StepFEA_FeaAxis2Placement3d> & CoordinateSystem);

		/****************** StepFEA_AlignedSurface3dElementCoordinateSystem ******************/
		%feature("compactdefaultargs") StepFEA_AlignedSurface3dElementCoordinateSystem;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_AlignedSurface3dElementCoordinateSystem;
		 StepFEA_AlignedSurface3dElementCoordinateSystem ();

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
		/****************** CoordinateSystem ******************/
		%feature("compactdefaultargs") CoordinateSystem;
		%feature("autodoc", "* Returns field CoordinateSystem
	:rtype: opencascade::handle<StepFEA_FeaAxis2Placement3d>") CoordinateSystem;
		opencascade::handle<StepFEA_FeaAxis2Placement3d> CoordinateSystem ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: TCollection_HAsciiString
	:param aCoordinateSystem:
	:type aCoordinateSystem: StepFEA_FeaAxis2Placement3d
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name,const opencascade::handle<StepFEA_FeaAxis2Placement3d> & aCoordinateSystem);

		/****************** SetCoordinateSystem ******************/
		%feature("compactdefaultargs") SetCoordinateSystem;
		%feature("autodoc", "* Set field CoordinateSystem
	:param CoordinateSystem:
	:type CoordinateSystem: StepFEA_FeaAxis2Placement3d
	:rtype: None") SetCoordinateSystem;
		void SetCoordinateSystem (const opencascade::handle<StepFEA_FeaAxis2Placement3d> & CoordinateSystem);

		/****************** StepFEA_ArbitraryVolume3dElementCoordinateSystem ******************/
		%feature("compactdefaultargs") StepFEA_ArbitraryVolume3dElementCoordinateSystem;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_ArbitraryVolume3dElementCoordinateSystem;
		 StepFEA_ArbitraryVolume3dElementCoordinateSystem ();

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
		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "* Returns field Angle
	:rtype: float") Angle;
		Standard_Real Angle ();

		/****************** Axis ******************/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "* Returns field Axis
	:rtype: int") Axis;
		Standard_Integer Axis ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: TCollection_HAsciiString
	:param aAxis:
	:type aAxis: int
	:param aAngle:
	:type aAngle: float
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name,const Standard_Integer aAxis,const Standard_Real aAngle);

		/****************** SetAngle ******************/
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "* Set field Angle
	:param Angle:
	:type Angle: float
	:rtype: None") SetAngle;
		void SetAngle (const Standard_Real Angle);

		/****************** SetAxis ******************/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "* Set field Axis
	:param Axis:
	:type Axis: int
	:rtype: None") SetAxis;
		void SetAxis (const Standard_Integer Axis);

		/****************** StepFEA_ConstantSurface3dElementCoordinateSystem ******************/
		%feature("compactdefaultargs") StepFEA_ConstantSurface3dElementCoordinateSystem;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_ConstantSurface3dElementCoordinateSystem;
		 StepFEA_ConstantSurface3dElementCoordinateSystem ();

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
		/****************** ElementDescriptor ******************/
		%feature("compactdefaultargs") ElementDescriptor;
		%feature("autodoc", "* Returns field ElementDescriptor
	:rtype: opencascade::handle<StepElement_Curve3dElementDescriptor>") ElementDescriptor;
		opencascade::handle<StepElement_Curve3dElementDescriptor> ElementDescriptor ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aRepresentation_Name:
	:type aRepresentation_Name: TCollection_HAsciiString
	:param aRepresentation_Items:
	:type aRepresentation_Items: StepRepr_HArray1OfRepresentationItem
	:param aRepresentation_ContextOfItems:
	:type aRepresentation_ContextOfItems: StepRepr_RepresentationContext
	:param aElementRepresentation_NodeList:
	:type aElementRepresentation_NodeList: StepFEA_HArray1OfNodeRepresentation
	:param aModelRef:
	:type aModelRef: StepFEA_FeaModel3d
	:param aElementDescriptor:
	:type aElementDescriptor: StepElement_Curve3dElementDescriptor
	:param aProperty:
	:type aProperty: StepFEA_Curve3dElementProperty
	:param aMaterial:
	:type aMaterial: StepElement_ElementMaterial
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aRepresentation_Name,const opencascade::handle<StepRepr_HArray1OfRepresentationItem> & aRepresentation_Items,const opencascade::handle<StepRepr_RepresentationContext> & aRepresentation_ContextOfItems,const opencascade::handle<StepFEA_HArray1OfNodeRepresentation> & aElementRepresentation_NodeList,const opencascade::handle<StepFEA_FeaModel3d> & aModelRef,const opencascade::handle<StepElement_Curve3dElementDescriptor> & aElementDescriptor,const opencascade::handle<StepFEA_Curve3dElementProperty> & aProperty,const opencascade::handle<StepElement_ElementMaterial> & aMaterial);

		/****************** Material ******************/
		%feature("compactdefaultargs") Material;
		%feature("autodoc", "* Returns field Material
	:rtype: opencascade::handle<StepElement_ElementMaterial>") Material;
		opencascade::handle<StepElement_ElementMaterial> Material ();

		/****************** ModelRef ******************/
		%feature("compactdefaultargs") ModelRef;
		%feature("autodoc", "* Returns field ModelRef
	:rtype: opencascade::handle<StepFEA_FeaModel3d>") ModelRef;
		opencascade::handle<StepFEA_FeaModel3d> ModelRef ();

		/****************** Property ******************/
		%feature("compactdefaultargs") Property;
		%feature("autodoc", "* Returns field Property
	:rtype: opencascade::handle<StepFEA_Curve3dElementProperty>") Property;
		opencascade::handle<StepFEA_Curve3dElementProperty> Property ();

		/****************** SetElementDescriptor ******************/
		%feature("compactdefaultargs") SetElementDescriptor;
		%feature("autodoc", "* Set field ElementDescriptor
	:param ElementDescriptor:
	:type ElementDescriptor: StepElement_Curve3dElementDescriptor
	:rtype: None") SetElementDescriptor;
		void SetElementDescriptor (const opencascade::handle<StepElement_Curve3dElementDescriptor> & ElementDescriptor);

		/****************** SetMaterial ******************/
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "* Set field Material
	:param Material:
	:type Material: StepElement_ElementMaterial
	:rtype: None") SetMaterial;
		void SetMaterial (const opencascade::handle<StepElement_ElementMaterial> & Material);

		/****************** SetModelRef ******************/
		%feature("compactdefaultargs") SetModelRef;
		%feature("autodoc", "* Set field ModelRef
	:param ModelRef:
	:type ModelRef: StepFEA_FeaModel3d
	:rtype: None") SetModelRef;
		void SetModelRef (const opencascade::handle<StepFEA_FeaModel3d> & ModelRef);

		/****************** SetProperty ******************/
		%feature("compactdefaultargs") SetProperty;
		%feature("autodoc", "* Set field Property
	:param Property:
	:type Property: StepFEA_Curve3dElementProperty
	:rtype: None") SetProperty;
		void SetProperty (const opencascade::handle<StepFEA_Curve3dElementProperty> & Property);

		/****************** StepFEA_Curve3dElementRepresentation ******************/
		%feature("compactdefaultargs") StepFEA_Curve3dElementRepresentation;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_Curve3dElementRepresentation;
		 StepFEA_Curve3dElementRepresentation ();

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
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aCurveElementInterval_FinishPosition:
	:type aCurveElementInterval_FinishPosition: StepFEA_CurveElementLocation
	:param aCurveElementInterval_EuAngles:
	:type aCurveElementInterval_EuAngles: StepBasic_EulerAngles
	:param aSection:
	:type aSection: StepElement_CurveElementSectionDefinition
	:rtype: None") Init;
		void Init (const opencascade::handle<StepFEA_CurveElementLocation> & aCurveElementInterval_FinishPosition,const opencascade::handle<StepBasic_EulerAngles> & aCurveElementInterval_EuAngles,const opencascade::handle<StepElement_CurveElementSectionDefinition> & aSection);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "* Returns field Section
	:rtype: opencascade::handle<StepElement_CurveElementSectionDefinition>") Section;
		opencascade::handle<StepElement_CurveElementSectionDefinition> Section ();

		/****************** SetSection ******************/
		%feature("compactdefaultargs") SetSection;
		%feature("autodoc", "* Set field Section
	:param Section:
	:type Section: StepElement_CurveElementSectionDefinition
	:rtype: None") SetSection;
		void SetSection (const opencascade::handle<StepElement_CurveElementSectionDefinition> & Section);

		/****************** StepFEA_CurveElementIntervalConstant ******************/
		%feature("compactdefaultargs") StepFEA_CurveElementIntervalConstant;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_CurveElementIntervalConstant;
		 StepFEA_CurveElementIntervalConstant ();

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
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aCurveElementInterval_FinishPosition:
	:type aCurveElementInterval_FinishPosition: StepFEA_CurveElementLocation
	:param aCurveElementInterval_EuAngles:
	:type aCurveElementInterval_EuAngles: StepBasic_EulerAngles
	:param aSections:
	:type aSections: StepElement_HArray1OfCurveElementSectionDefinition
	:rtype: None") Init;
		void Init (const opencascade::handle<StepFEA_CurveElementLocation> & aCurveElementInterval_FinishPosition,const opencascade::handle<StepBasic_EulerAngles> & aCurveElementInterval_EuAngles,const opencascade::handle<StepElement_HArray1OfCurveElementSectionDefinition> & aSections);

		/****************** Sections ******************/
		%feature("compactdefaultargs") Sections;
		%feature("autodoc", "* Returns field Sections
	:rtype: opencascade::handle<StepElement_HArray1OfCurveElementSectionDefinition>") Sections;
		opencascade::handle<StepElement_HArray1OfCurveElementSectionDefinition> Sections ();

		/****************** SetSections ******************/
		%feature("compactdefaultargs") SetSections;
		%feature("autodoc", "* Set field Sections
	:param Sections:
	:type Sections: StepElement_HArray1OfCurveElementSectionDefinition
	:rtype: None") SetSections;
		void SetSections (const opencascade::handle<StepElement_HArray1OfCurveElementSectionDefinition> & Sections);

		/****************** StepFEA_CurveElementIntervalLinearlyVarying ******************/
		%feature("compactdefaultargs") StepFEA_CurveElementIntervalLinearlyVarying;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_CurveElementIntervalLinearlyVarying;
		 StepFEA_CurveElementIntervalLinearlyVarying ();

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
		/****************** StepFEA_DummyNode ******************/
		%feature("compactdefaultargs") StepFEA_DummyNode;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_DummyNode;
		 StepFEA_DummyNode ();

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
		/****************** Elements ******************/
		%feature("compactdefaultargs") Elements;
		%feature("autodoc", "* Returns field Elements
	:rtype: opencascade::handle<StepFEA_HArray1OfElementRepresentation>") Elements;
		opencascade::handle<StepFEA_HArray1OfElementRepresentation> Elements ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aGroup_Name:
	:type aGroup_Name: TCollection_HAsciiString
	:param aGroup_Description:
	:type aGroup_Description: TCollection_HAsciiString
	:param aFeaGroup_ModelRef:
	:type aFeaGroup_ModelRef: StepFEA_FeaModel
	:param aElements:
	:type aElements: StepFEA_HArray1OfElementRepresentation
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aGroup_Name,const opencascade::handle<TCollection_HAsciiString> & aGroup_Description,const opencascade::handle<StepFEA_FeaModel> & aFeaGroup_ModelRef,const opencascade::handle<StepFEA_HArray1OfElementRepresentation> & aElements);

		/****************** SetElements ******************/
		%feature("compactdefaultargs") SetElements;
		%feature("autodoc", "* Set field Elements
	:param Elements:
	:type Elements: StepFEA_HArray1OfElementRepresentation
	:rtype: None") SetElements;
		void SetElements (const opencascade::handle<StepFEA_HArray1OfElementRepresentation> & Elements);

		/****************** StepFEA_ElementGroup ******************/
		%feature("compactdefaultargs") StepFEA_ElementGroup;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_ElementGroup;
		 StepFEA_ElementGroup ();

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
		/****************** FeaConstant ******************/
		%feature("compactdefaultargs") FeaConstant;
		%feature("autodoc", "* Returns field FeaConstant
	:rtype: float") FeaConstant;
		Standard_Real FeaConstant ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: TCollection_HAsciiString
	:param aFeaConstant:
	:type aFeaConstant: float
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name,const Standard_Real aFeaConstant);

		/****************** SetFeaConstant ******************/
		%feature("compactdefaultargs") SetFeaConstant;
		%feature("autodoc", "* Set field FeaConstant
	:param FeaConstant:
	:type FeaConstant: float
	:rtype: None") SetFeaConstant;
		void SetFeaConstant (const Standard_Real FeaConstant);

		/****************** StepFEA_FeaAreaDensity ******************/
		%feature("compactdefaultargs") StepFEA_FeaAreaDensity;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_FeaAreaDensity;
		 StepFEA_FeaAreaDensity ();

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
		/****************** FeaConstants ******************/
		%feature("compactdefaultargs") FeaConstants;
		%feature("autodoc", "* Returns field FeaConstants
	:rtype: StepFEA_SymmetricTensor43d") FeaConstants;
		StepFEA_SymmetricTensor43d FeaConstants ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: TCollection_HAsciiString
	:param aFeaConstants:
	:type aFeaConstants: StepFEA_SymmetricTensor43d
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name,const StepFEA_SymmetricTensor43d & aFeaConstants);

		/****************** SetFeaConstants ******************/
		%feature("compactdefaultargs") SetFeaConstants;
		%feature("autodoc", "* Set field FeaConstants
	:param FeaConstants:
	:type FeaConstants: StepFEA_SymmetricTensor43d
	:rtype: None") SetFeaConstants;
		void SetFeaConstants (const StepFEA_SymmetricTensor43d & FeaConstants);

		/****************** StepFEA_FeaLinearElasticity ******************/
		%feature("compactdefaultargs") StepFEA_FeaLinearElasticity;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_FeaLinearElasticity;
		 StepFEA_FeaLinearElasticity ();

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
		/****************** FeaConstant ******************/
		%feature("compactdefaultargs") FeaConstant;
		%feature("autodoc", "* Returns field FeaConstant
	:rtype: float") FeaConstant;
		Standard_Real FeaConstant ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: TCollection_HAsciiString
	:param aFeaConstant:
	:type aFeaConstant: float
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name,const Standard_Real aFeaConstant);

		/****************** SetFeaConstant ******************/
		%feature("compactdefaultargs") SetFeaConstant;
		%feature("autodoc", "* Set field FeaConstant
	:param FeaConstant:
	:type FeaConstant: float
	:rtype: None") SetFeaConstant;
		void SetFeaConstant (const Standard_Real FeaConstant);

		/****************** StepFEA_FeaMassDensity ******************/
		%feature("compactdefaultargs") StepFEA_FeaMassDensity;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_FeaMassDensity;
		 StepFEA_FeaMassDensity ();

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
		/****************** StepFEA_FeaModel3d ******************/
		%feature("compactdefaultargs") StepFEA_FeaModel3d;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_FeaModel3d;
		 StepFEA_FeaModel3d ();

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
		/****************** FeaConstants ******************/
		%feature("compactdefaultargs") FeaConstants;
		%feature("autodoc", "* Returns field FeaConstants
	:rtype: StepFEA_SymmetricTensor23d") FeaConstants;
		StepFEA_SymmetricTensor23d FeaConstants ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: TCollection_HAsciiString
	:param aFeaConstants:
	:type aFeaConstants: StepFEA_SymmetricTensor23d
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name,const StepFEA_SymmetricTensor23d & aFeaConstants);

		/****************** SetFeaConstants ******************/
		%feature("compactdefaultargs") SetFeaConstants;
		%feature("autodoc", "* Set field FeaConstants
	:param FeaConstants:
	:type FeaConstants: StepFEA_SymmetricTensor23d
	:rtype: None") SetFeaConstants;
		void SetFeaConstants (const StepFEA_SymmetricTensor23d & FeaConstants);

		/****************** StepFEA_FeaMoistureAbsorption ******************/
		%feature("compactdefaultargs") StepFEA_FeaMoistureAbsorption;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_FeaMoistureAbsorption;
		 StepFEA_FeaMoistureAbsorption ();

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
		/****************** FeaConstants ******************/
		%feature("compactdefaultargs") FeaConstants;
		%feature("autodoc", "* Returns field FeaConstants
	:rtype: StepFEA_SymmetricTensor23d") FeaConstants;
		StepFEA_SymmetricTensor23d FeaConstants ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: TCollection_HAsciiString
	:param aFeaConstants:
	:type aFeaConstants: StepFEA_SymmetricTensor23d
	:param aReferenceTemperature:
	:type aReferenceTemperature: float
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name,const StepFEA_SymmetricTensor23d & aFeaConstants,const Standard_Real aReferenceTemperature);

		/****************** ReferenceTemperature ******************/
		%feature("compactdefaultargs") ReferenceTemperature;
		%feature("autodoc", "* Returns field ReferenceTemperature
	:rtype: float") ReferenceTemperature;
		Standard_Real ReferenceTemperature ();

		/****************** SetFeaConstants ******************/
		%feature("compactdefaultargs") SetFeaConstants;
		%feature("autodoc", "* Set field FeaConstants
	:param FeaConstants:
	:type FeaConstants: StepFEA_SymmetricTensor23d
	:rtype: None") SetFeaConstants;
		void SetFeaConstants (const StepFEA_SymmetricTensor23d & FeaConstants);

		/****************** SetReferenceTemperature ******************/
		%feature("compactdefaultargs") SetReferenceTemperature;
		%feature("autodoc", "* Set field ReferenceTemperature
	:param ReferenceTemperature:
	:type ReferenceTemperature: float
	:rtype: None") SetReferenceTemperature;
		void SetReferenceTemperature (const Standard_Real ReferenceTemperature);

		/****************** StepFEA_FeaSecantCoefficientOfLinearThermalExpansion ******************/
		%feature("compactdefaultargs") StepFEA_FeaSecantCoefficientOfLinearThermalExpansion;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_FeaSecantCoefficientOfLinearThermalExpansion;
		 StepFEA_FeaSecantCoefficientOfLinearThermalExpansion ();

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
		/****************** FeaConstants ******************/
		%feature("compactdefaultargs") FeaConstants;
		%feature("autodoc", "* Returns field FeaConstants
	:rtype: StepFEA_SymmetricTensor42d") FeaConstants;
		StepFEA_SymmetricTensor42d FeaConstants ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: TCollection_HAsciiString
	:param aFeaConstants:
	:type aFeaConstants: StepFEA_SymmetricTensor42d
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name,const StepFEA_SymmetricTensor42d & aFeaConstants);

		/****************** SetFeaConstants ******************/
		%feature("compactdefaultargs") SetFeaConstants;
		%feature("autodoc", "* Set field FeaConstants
	:param FeaConstants:
	:type FeaConstants: StepFEA_SymmetricTensor42d
	:rtype: None") SetFeaConstants;
		void SetFeaConstants (const StepFEA_SymmetricTensor42d & FeaConstants);

		/****************** StepFEA_FeaShellBendingStiffness ******************/
		%feature("compactdefaultargs") StepFEA_FeaShellBendingStiffness;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_FeaShellBendingStiffness;
		 StepFEA_FeaShellBendingStiffness ();

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
		/****************** FeaConstants ******************/
		%feature("compactdefaultargs") FeaConstants;
		%feature("autodoc", "* Returns field FeaConstants
	:rtype: StepFEA_SymmetricTensor42d") FeaConstants;
		StepFEA_SymmetricTensor42d FeaConstants ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: TCollection_HAsciiString
	:param aFeaConstants:
	:type aFeaConstants: StepFEA_SymmetricTensor42d
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name,const StepFEA_SymmetricTensor42d & aFeaConstants);

		/****************** SetFeaConstants ******************/
		%feature("compactdefaultargs") SetFeaConstants;
		%feature("autodoc", "* Set field FeaConstants
	:param FeaConstants:
	:type FeaConstants: StepFEA_SymmetricTensor42d
	:rtype: None") SetFeaConstants;
		void SetFeaConstants (const StepFEA_SymmetricTensor42d & FeaConstants);

		/****************** StepFEA_FeaShellMembraneBendingCouplingStiffness ******************/
		%feature("compactdefaultargs") StepFEA_FeaShellMembraneBendingCouplingStiffness;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_FeaShellMembraneBendingCouplingStiffness;
		 StepFEA_FeaShellMembraneBendingCouplingStiffness ();

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
		/****************** FeaConstants ******************/
		%feature("compactdefaultargs") FeaConstants;
		%feature("autodoc", "* Returns field FeaConstants
	:rtype: StepFEA_SymmetricTensor42d") FeaConstants;
		StepFEA_SymmetricTensor42d FeaConstants ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: TCollection_HAsciiString
	:param aFeaConstants:
	:type aFeaConstants: StepFEA_SymmetricTensor42d
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name,const StepFEA_SymmetricTensor42d & aFeaConstants);

		/****************** SetFeaConstants ******************/
		%feature("compactdefaultargs") SetFeaConstants;
		%feature("autodoc", "* Set field FeaConstants
	:param FeaConstants:
	:type FeaConstants: StepFEA_SymmetricTensor42d
	:rtype: None") SetFeaConstants;
		void SetFeaConstants (const StepFEA_SymmetricTensor42d & FeaConstants);

		/****************** StepFEA_FeaShellMembraneStiffness ******************/
		%feature("compactdefaultargs") StepFEA_FeaShellMembraneStiffness;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_FeaShellMembraneStiffness;
		 StepFEA_FeaShellMembraneStiffness ();

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
		/****************** FeaConstants ******************/
		%feature("compactdefaultargs") FeaConstants;
		%feature("autodoc", "* Returns field FeaConstants
	:rtype: StepFEA_SymmetricTensor22d") FeaConstants;
		StepFEA_SymmetricTensor22d FeaConstants ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: TCollection_HAsciiString
	:param aFeaConstants:
	:type aFeaConstants: StepFEA_SymmetricTensor22d
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name,const StepFEA_SymmetricTensor22d & aFeaConstants);

		/****************** SetFeaConstants ******************/
		%feature("compactdefaultargs") SetFeaConstants;
		%feature("autodoc", "* Set field FeaConstants
	:param FeaConstants:
	:type FeaConstants: StepFEA_SymmetricTensor22d
	:rtype: None") SetFeaConstants;
		void SetFeaConstants (const StepFEA_SymmetricTensor22d & FeaConstants);

		/****************** StepFEA_FeaShellShearStiffness ******************/
		%feature("compactdefaultargs") StepFEA_FeaShellShearStiffness;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_FeaShellShearStiffness;
		 StepFEA_FeaShellShearStiffness ();

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
		/****************** FeaConstants ******************/
		%feature("compactdefaultargs") FeaConstants;
		%feature("autodoc", "* Returns field FeaConstants
	:rtype: StepFEA_SymmetricTensor23d") FeaConstants;
		StepFEA_SymmetricTensor23d FeaConstants ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: TCollection_HAsciiString
	:param aFeaConstants:
	:type aFeaConstants: StepFEA_SymmetricTensor23d
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name,const StepFEA_SymmetricTensor23d & aFeaConstants);

		/****************** SetFeaConstants ******************/
		%feature("compactdefaultargs") SetFeaConstants;
		%feature("autodoc", "* Set field FeaConstants
	:param FeaConstants:
	:type FeaConstants: StepFEA_SymmetricTensor23d
	:rtype: None") SetFeaConstants;
		void SetFeaConstants (const StepFEA_SymmetricTensor23d & FeaConstants);

		/****************** StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion ******************/
		%feature("compactdefaultargs") StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion;
		 StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion ();

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
		/****************** StepFEA_GeometricNode ******************/
		%feature("compactdefaultargs") StepFEA_GeometricNode;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_GeometricNode;
		 StepFEA_GeometricNode ();

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
		/****************** StepFEA_Node ******************/
		%feature("compactdefaultargs") StepFEA_Node;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_Node;
		 StepFEA_Node ();

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
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aGroup_Name:
	:type aGroup_Name: TCollection_HAsciiString
	:param aGroup_Description:
	:type aGroup_Description: TCollection_HAsciiString
	:param aFeaGroup_ModelRef:
	:type aFeaGroup_ModelRef: StepFEA_FeaModel
	:param aNodes:
	:type aNodes: StepFEA_HArray1OfNodeRepresentation
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aGroup_Name,const opencascade::handle<TCollection_HAsciiString> & aGroup_Description,const opencascade::handle<StepFEA_FeaModel> & aFeaGroup_ModelRef,const opencascade::handle<StepFEA_HArray1OfNodeRepresentation> & aNodes);

		/****************** Nodes ******************/
		%feature("compactdefaultargs") Nodes;
		%feature("autodoc", "* Returns field Nodes
	:rtype: opencascade::handle<StepFEA_HArray1OfNodeRepresentation>") Nodes;
		opencascade::handle<StepFEA_HArray1OfNodeRepresentation> Nodes ();

		/****************** SetNodes ******************/
		%feature("compactdefaultargs") SetNodes;
		%feature("autodoc", "* Set field Nodes
	:param Nodes:
	:type Nodes: StepFEA_HArray1OfNodeRepresentation
	:rtype: None") SetNodes;
		void SetNodes (const opencascade::handle<StepFEA_HArray1OfNodeRepresentation> & Nodes);

		/****************** StepFEA_NodeGroup ******************/
		%feature("compactdefaultargs") StepFEA_NodeGroup;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_NodeGroup;
		 StepFEA_NodeGroup ();

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
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: TCollection_HAsciiString
	:param aOrientation:
	:type aOrientation: StepGeom_Direction
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name,const opencascade::handle<StepGeom_Direction> & aOrientation);

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "* Returns field Orientation
	:rtype: opencascade::handle<StepGeom_Direction>") Orientation;
		opencascade::handle<StepGeom_Direction> Orientation ();

		/****************** SetOrientation ******************/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "* Set field Orientation
	:param Orientation:
	:type Orientation: StepGeom_Direction
	:rtype: None") SetOrientation;
		void SetOrientation (const opencascade::handle<StepGeom_Direction> & Orientation);

		/****************** StepFEA_ParametricCurve3dElementCoordinateDirection ******************/
		%feature("compactdefaultargs") StepFEA_ParametricCurve3dElementCoordinateDirection;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_ParametricCurve3dElementCoordinateDirection;
		 StepFEA_ParametricCurve3dElementCoordinateDirection ();

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
		/****************** Direction ******************/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "* Returns field Direction
	:rtype: opencascade::handle<StepFEA_ParametricCurve3dElementCoordinateDirection>") Direction;
		opencascade::handle<StepFEA_ParametricCurve3dElementCoordinateDirection> Direction ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: TCollection_HAsciiString
	:param aDirection:
	:type aDirection: StepFEA_ParametricCurve3dElementCoordinateDirection
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name,const opencascade::handle<StepFEA_ParametricCurve3dElementCoordinateDirection> & aDirection);

		/****************** SetDirection ******************/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "* Set field Direction
	:param Direction:
	:type Direction: StepFEA_ParametricCurve3dElementCoordinateDirection
	:rtype: None") SetDirection;
		void SetDirection (const opencascade::handle<StepFEA_ParametricCurve3dElementCoordinateDirection> & Direction);

		/****************** StepFEA_ParametricCurve3dElementCoordinateSystem ******************/
		%feature("compactdefaultargs") StepFEA_ParametricCurve3dElementCoordinateSystem;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_ParametricCurve3dElementCoordinateSystem;
		 StepFEA_ParametricCurve3dElementCoordinateSystem ();

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
		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "* Returns field Angle
	:rtype: float") Angle;
		Standard_Real Angle ();

		/****************** Axis ******************/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "* Returns field Axis
	:rtype: int") Axis;
		Standard_Integer Axis ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: TCollection_HAsciiString
	:param aAxis:
	:type aAxis: int
	:param aAngle:
	:type aAngle: float
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name,const Standard_Integer aAxis,const Standard_Real aAngle);

		/****************** SetAngle ******************/
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "* Set field Angle
	:param Angle:
	:type Angle: float
	:rtype: None") SetAngle;
		void SetAngle (const Standard_Real Angle);

		/****************** SetAxis ******************/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "* Set field Axis
	:param Axis:
	:type Axis: int
	:rtype: None") SetAxis;
		void SetAxis (const Standard_Integer Axis);

		/****************** StepFEA_ParametricSurface3dElementCoordinateSystem ******************/
		%feature("compactdefaultargs") StepFEA_ParametricSurface3dElementCoordinateSystem;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_ParametricSurface3dElementCoordinateSystem;
		 StepFEA_ParametricSurface3dElementCoordinateSystem ();

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
		/****************** ElementDescriptor ******************/
		%feature("compactdefaultargs") ElementDescriptor;
		%feature("autodoc", "* Returns field ElementDescriptor
	:rtype: opencascade::handle<StepElement_Surface3dElementDescriptor>") ElementDescriptor;
		opencascade::handle<StepElement_Surface3dElementDescriptor> ElementDescriptor ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aRepresentation_Name:
	:type aRepresentation_Name: TCollection_HAsciiString
	:param aRepresentation_Items:
	:type aRepresentation_Items: StepRepr_HArray1OfRepresentationItem
	:param aRepresentation_ContextOfItems:
	:type aRepresentation_ContextOfItems: StepRepr_RepresentationContext
	:param aElementRepresentation_NodeList:
	:type aElementRepresentation_NodeList: StepFEA_HArray1OfNodeRepresentation
	:param aModelRef:
	:type aModelRef: StepFEA_FeaModel3d
	:param aElementDescriptor:
	:type aElementDescriptor: StepElement_Surface3dElementDescriptor
	:param aProperty:
	:type aProperty: StepElement_SurfaceElementProperty
	:param aMaterial:
	:type aMaterial: StepElement_ElementMaterial
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aRepresentation_Name,const opencascade::handle<StepRepr_HArray1OfRepresentationItem> & aRepresentation_Items,const opencascade::handle<StepRepr_RepresentationContext> & aRepresentation_ContextOfItems,const opencascade::handle<StepFEA_HArray1OfNodeRepresentation> & aElementRepresentation_NodeList,const opencascade::handle<StepFEA_FeaModel3d> & aModelRef,const opencascade::handle<StepElement_Surface3dElementDescriptor> & aElementDescriptor,const opencascade::handle<StepElement_SurfaceElementProperty> & aProperty,const opencascade::handle<StepElement_ElementMaterial> & aMaterial);

		/****************** Material ******************/
		%feature("compactdefaultargs") Material;
		%feature("autodoc", "* Returns field Material
	:rtype: opencascade::handle<StepElement_ElementMaterial>") Material;
		opencascade::handle<StepElement_ElementMaterial> Material ();

		/****************** ModelRef ******************/
		%feature("compactdefaultargs") ModelRef;
		%feature("autodoc", "* Returns field ModelRef
	:rtype: opencascade::handle<StepFEA_FeaModel3d>") ModelRef;
		opencascade::handle<StepFEA_FeaModel3d> ModelRef ();

		/****************** Property ******************/
		%feature("compactdefaultargs") Property;
		%feature("autodoc", "* Returns field Property
	:rtype: opencascade::handle<StepElement_SurfaceElementProperty>") Property;
		opencascade::handle<StepElement_SurfaceElementProperty> Property ();

		/****************** SetElementDescriptor ******************/
		%feature("compactdefaultargs") SetElementDescriptor;
		%feature("autodoc", "* Set field ElementDescriptor
	:param ElementDescriptor:
	:type ElementDescriptor: StepElement_Surface3dElementDescriptor
	:rtype: None") SetElementDescriptor;
		void SetElementDescriptor (const opencascade::handle<StepElement_Surface3dElementDescriptor> & ElementDescriptor);

		/****************** SetMaterial ******************/
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "* Set field Material
	:param Material:
	:type Material: StepElement_ElementMaterial
	:rtype: None") SetMaterial;
		void SetMaterial (const opencascade::handle<StepElement_ElementMaterial> & Material);

		/****************** SetModelRef ******************/
		%feature("compactdefaultargs") SetModelRef;
		%feature("autodoc", "* Set field ModelRef
	:param ModelRef:
	:type ModelRef: StepFEA_FeaModel3d
	:rtype: None") SetModelRef;
		void SetModelRef (const opencascade::handle<StepFEA_FeaModel3d> & ModelRef);

		/****************** SetProperty ******************/
		%feature("compactdefaultargs") SetProperty;
		%feature("autodoc", "* Set field Property
	:param Property:
	:type Property: StepElement_SurfaceElementProperty
	:rtype: None") SetProperty;
		void SetProperty (const opencascade::handle<StepElement_SurfaceElementProperty> & Property);

		/****************** StepFEA_Surface3dElementRepresentation ******************/
		%feature("compactdefaultargs") StepFEA_Surface3dElementRepresentation;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_Surface3dElementRepresentation;
		 StepFEA_Surface3dElementRepresentation ();

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
		/****************** ElementDescriptor ******************/
		%feature("compactdefaultargs") ElementDescriptor;
		%feature("autodoc", "* Returns field ElementDescriptor
	:rtype: opencascade::handle<StepElement_Volume3dElementDescriptor>") ElementDescriptor;
		opencascade::handle<StepElement_Volume3dElementDescriptor> ElementDescriptor ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param aRepresentation_Name:
	:type aRepresentation_Name: TCollection_HAsciiString
	:param aRepresentation_Items:
	:type aRepresentation_Items: StepRepr_HArray1OfRepresentationItem
	:param aRepresentation_ContextOfItems:
	:type aRepresentation_ContextOfItems: StepRepr_RepresentationContext
	:param aElementRepresentation_NodeList:
	:type aElementRepresentation_NodeList: StepFEA_HArray1OfNodeRepresentation
	:param aModelRef:
	:type aModelRef: StepFEA_FeaModel3d
	:param aElementDescriptor:
	:type aElementDescriptor: StepElement_Volume3dElementDescriptor
	:param aMaterial:
	:type aMaterial: StepElement_ElementMaterial
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aRepresentation_Name,const opencascade::handle<StepRepr_HArray1OfRepresentationItem> & aRepresentation_Items,const opencascade::handle<StepRepr_RepresentationContext> & aRepresentation_ContextOfItems,const opencascade::handle<StepFEA_HArray1OfNodeRepresentation> & aElementRepresentation_NodeList,const opencascade::handle<StepFEA_FeaModel3d> & aModelRef,const opencascade::handle<StepElement_Volume3dElementDescriptor> & aElementDescriptor,const opencascade::handle<StepElement_ElementMaterial> & aMaterial);

		/****************** Material ******************/
		%feature("compactdefaultargs") Material;
		%feature("autodoc", "* Returns field Material
	:rtype: opencascade::handle<StepElement_ElementMaterial>") Material;
		opencascade::handle<StepElement_ElementMaterial> Material ();

		/****************** ModelRef ******************/
		%feature("compactdefaultargs") ModelRef;
		%feature("autodoc", "* Returns field ModelRef
	:rtype: opencascade::handle<StepFEA_FeaModel3d>") ModelRef;
		opencascade::handle<StepFEA_FeaModel3d> ModelRef ();

		/****************** SetElementDescriptor ******************/
		%feature("compactdefaultargs") SetElementDescriptor;
		%feature("autodoc", "* Set field ElementDescriptor
	:param ElementDescriptor:
	:type ElementDescriptor: StepElement_Volume3dElementDescriptor
	:rtype: None") SetElementDescriptor;
		void SetElementDescriptor (const opencascade::handle<StepElement_Volume3dElementDescriptor> & ElementDescriptor);

		/****************** SetMaterial ******************/
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "* Set field Material
	:param Material:
	:type Material: StepElement_ElementMaterial
	:rtype: None") SetMaterial;
		void SetMaterial (const opencascade::handle<StepElement_ElementMaterial> & Material);

		/****************** SetModelRef ******************/
		%feature("compactdefaultargs") SetModelRef;
		%feature("autodoc", "* Set field ModelRef
	:param ModelRef:
	:type ModelRef: StepFEA_FeaModel3d
	:rtype: None") SetModelRef;
		void SetModelRef (const opencascade::handle<StepFEA_FeaModel3d> & ModelRef);

		/****************** StepFEA_Volume3dElementRepresentation ******************/
		%feature("compactdefaultargs") StepFEA_Volume3dElementRepresentation;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_Volume3dElementRepresentation;
		 StepFEA_Volume3dElementRepresentation ();

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
		/****************** StepFEA_NodeWithSolutionCoordinateSystem ******************/
		%feature("compactdefaultargs") StepFEA_NodeWithSolutionCoordinateSystem;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_NodeWithSolutionCoordinateSystem;
		 StepFEA_NodeWithSolutionCoordinateSystem ();

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
		/****************** StepFEA_NodeWithVector ******************/
		%feature("compactdefaultargs") StepFEA_NodeWithVector;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepFEA_NodeWithVector;
		 StepFEA_NodeWithVector ();

};


%make_alias(StepFEA_NodeWithVector)

%extend StepFEA_NodeWithVector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
class StepFEA_HArray1OfCurveElementInterval : public  StepFEA_Array1OfCurveElementInterval, public Standard_Transient {
  public:
    StepFEA_HArray1OfCurveElementInterval(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepFEA_HArray1OfCurveElementInterval(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepFEA_Array1OfCurveElementInterval::value_type& theValue);
    StepFEA_HArray1OfCurveElementInterval(const  StepFEA_Array1OfCurveElementInterval& theOther);
    const  StepFEA_Array1OfCurveElementInterval& Array1();
     StepFEA_Array1OfCurveElementInterval& ChangeArray1();
};
%make_alias(StepFEA_HArray1OfCurveElementInterval)


class StepFEA_HArray1OfCurveElementEndOffset : public  StepFEA_Array1OfCurveElementEndOffset, public Standard_Transient {
  public:
    StepFEA_HArray1OfCurveElementEndOffset(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepFEA_HArray1OfCurveElementEndOffset(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepFEA_Array1OfCurveElementEndOffset::value_type& theValue);
    StepFEA_HArray1OfCurveElementEndOffset(const  StepFEA_Array1OfCurveElementEndOffset& theOther);
    const  StepFEA_Array1OfCurveElementEndOffset& Array1();
     StepFEA_Array1OfCurveElementEndOffset& ChangeArray1();
};
%make_alias(StepFEA_HArray1OfCurveElementEndOffset)


class StepFEA_HArray1OfElementRepresentation : public  StepFEA_Array1OfElementRepresentation, public Standard_Transient {
  public:
    StepFEA_HArray1OfElementRepresentation(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepFEA_HArray1OfElementRepresentation(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepFEA_Array1OfElementRepresentation::value_type& theValue);
    StepFEA_HArray1OfElementRepresentation(const  StepFEA_Array1OfElementRepresentation& theOther);
    const  StepFEA_Array1OfElementRepresentation& Array1();
     StepFEA_Array1OfElementRepresentation& ChangeArray1();
};
%make_alias(StepFEA_HArray1OfElementRepresentation)


class StepFEA_HArray1OfCurveElementEndRelease : public  StepFEA_Array1OfCurveElementEndRelease, public Standard_Transient {
  public:
    StepFEA_HArray1OfCurveElementEndRelease(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepFEA_HArray1OfCurveElementEndRelease(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepFEA_Array1OfCurveElementEndRelease::value_type& theValue);
    StepFEA_HArray1OfCurveElementEndRelease(const  StepFEA_Array1OfCurveElementEndRelease& theOther);
    const  StepFEA_Array1OfCurveElementEndRelease& Array1();
     StepFEA_Array1OfCurveElementEndRelease& ChangeArray1();
};
%make_alias(StepFEA_HArray1OfCurveElementEndRelease)


class StepFEA_HArray1OfDegreeOfFreedom : public  StepFEA_Array1OfDegreeOfFreedom, public Standard_Transient {
  public:
    StepFEA_HArray1OfDegreeOfFreedom(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepFEA_HArray1OfDegreeOfFreedom(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepFEA_Array1OfDegreeOfFreedom::value_type& theValue);
    StepFEA_HArray1OfDegreeOfFreedom(const  StepFEA_Array1OfDegreeOfFreedom& theOther);
    const  StepFEA_Array1OfDegreeOfFreedom& Array1();
     StepFEA_Array1OfDegreeOfFreedom& ChangeArray1();
};
%make_alias(StepFEA_HArray1OfDegreeOfFreedom)


class StepFEA_HArray1OfNodeRepresentation : public  StepFEA_Array1OfNodeRepresentation, public Standard_Transient {
  public:
    StepFEA_HArray1OfNodeRepresentation(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepFEA_HArray1OfNodeRepresentation(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepFEA_Array1OfNodeRepresentation::value_type& theValue);
    StepFEA_HArray1OfNodeRepresentation(const  StepFEA_Array1OfNodeRepresentation& theOther);
    const  StepFEA_Array1OfNodeRepresentation& Array1();
     StepFEA_Array1OfNodeRepresentation& ChangeArray1();
};
%make_alias(StepFEA_HArray1OfNodeRepresentation)


/* harray2 classes */
/* hsequence classes */
class StepFEA_HSequenceOfElementRepresentation : public  StepFEA_SequenceOfElementRepresentation, public Standard_Transient {
  public:
    StepFEA_HSequenceOfElementRepresentation();
    StepFEA_HSequenceOfElementRepresentation(const  StepFEA_SequenceOfElementRepresentation& theOther);
    const  StepFEA_SequenceOfElementRepresentation& Sequence();
    void Append (const  StepFEA_SequenceOfElementRepresentation::value_type& theItem);
    void Append ( StepFEA_SequenceOfElementRepresentation& theSequence);
     StepFEA_SequenceOfElementRepresentation& ChangeSequence();
};
%make_alias(StepFEA_HSequenceOfElementRepresentation)


class StepFEA_HSequenceOfElementGeometricRelationship : public  StepFEA_SequenceOfElementGeometricRelationship, public Standard_Transient {
  public:
    StepFEA_HSequenceOfElementGeometricRelationship();
    StepFEA_HSequenceOfElementGeometricRelationship(const  StepFEA_SequenceOfElementGeometricRelationship& theOther);
    const  StepFEA_SequenceOfElementGeometricRelationship& Sequence();
    void Append (const  StepFEA_SequenceOfElementGeometricRelationship::value_type& theItem);
    void Append ( StepFEA_SequenceOfElementGeometricRelationship& theSequence);
     StepFEA_SequenceOfElementGeometricRelationship& ChangeSequence();
};
%make_alias(StepFEA_HSequenceOfElementGeometricRelationship)


class StepFEA_HSequenceOfNodeRepresentation : public  StepFEA_SequenceOfNodeRepresentation, public Standard_Transient {
  public:
    StepFEA_HSequenceOfNodeRepresentation();
    StepFEA_HSequenceOfNodeRepresentation(const  StepFEA_SequenceOfNodeRepresentation& theOther);
    const  StepFEA_SequenceOfNodeRepresentation& Sequence();
    void Append (const  StepFEA_SequenceOfNodeRepresentation::value_type& theItem);
    void Append ( StepFEA_SequenceOfNodeRepresentation& theSequence);
     StepFEA_SequenceOfNodeRepresentation& ChangeSequence();
};
%make_alias(StepFEA_HSequenceOfNodeRepresentation)


class StepFEA_HSequenceOfCurve3dElementProperty : public  StepFEA_SequenceOfCurve3dElementProperty, public Standard_Transient {
  public:
    StepFEA_HSequenceOfCurve3dElementProperty();
    StepFEA_HSequenceOfCurve3dElementProperty(const  StepFEA_SequenceOfCurve3dElementProperty& theOther);
    const  StepFEA_SequenceOfCurve3dElementProperty& Sequence();
    void Append (const  StepFEA_SequenceOfCurve3dElementProperty::value_type& theItem);
    void Append ( StepFEA_SequenceOfCurve3dElementProperty& theSequence);
     StepFEA_SequenceOfCurve3dElementProperty& ChangeSequence();
};
%make_alias(StepFEA_HSequenceOfCurve3dElementProperty)


