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
%define STEPDIMTOLDOCSTRING
"StepDimTol module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_stepdimtol.html"
%enddef
%module (package="OCC.Core", docstring=STEPDIMTOLDOCSTRING) StepDimTol


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
#include<StepDimTol_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<StepRepr_module.hxx>
#include<TCollection_module.hxx>
#include<StepData_module.hxx>
#include<StepBasic_module.hxx>
#include<StepShape_module.hxx>
#include<Message_module.hxx>
#include<Interface_module.hxx>
#include<StepGeom_module.hxx>
#include<StepData_module.hxx>
#include<StepBasic_module.hxx>
#include<MoniTool_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import StepRepr.i
%import TCollection.i
%import StepData.i
%import StepBasic.i
%import StepShape.i
/* public enums */
enum StepDimTol_LimitCondition {
	StepDimTol_MaximumMaterialCondition = 0,
	StepDimTol_LeastMaterialCondition = 1,
	StepDimTol_RegardlessOfFeatureSize = 2,
};

enum StepDimTol_GeometricToleranceType {
	StepDimTol_GTTAngularityTolerance = 0,
	StepDimTol_GTTCircularRunoutTolerance = 1,
	StepDimTol_GTTCoaxialityTolerance = 2,
	StepDimTol_GTTConcentricityTolerance = 3,
	StepDimTol_GTTCylindricityTolerance = 4,
	StepDimTol_GTTFlatnessTolerance = 5,
	StepDimTol_GTTLineProfileTolerance = 6,
	StepDimTol_GTTParallelismTolerance = 7,
	StepDimTol_GTTPerpendicularityTolerance = 8,
	StepDimTol_GTTPositionTolerance = 9,
	StepDimTol_GTTRoundnessTolerance = 10,
	StepDimTol_GTTStraightnessTolerance = 11,
	StepDimTol_GTTSurfaceProfileTolerance = 12,
	StepDimTol_GTTSymmetryTolerance = 13,
	StepDimTol_GTTTotalRunoutTolerance = 14,
};

enum StepDimTol_DatumReferenceModifierType {
	StepDimTol_CircularOrCylindrical = 0,
	StepDimTol_Distance = 1,
	StepDimTol_Projected = 2,
	StepDimTol_Spherical = 3,
};

enum StepDimTol_SimpleDatumReferenceModifier {
	StepDimTol_SDRMAnyCrossSection = 0,
	StepDimTol_SDRMAnyLongitudinalSection = 1,
	StepDimTol_SDRMBasic = 2,
	StepDimTol_SDRMContactingFeature = 3,
	StepDimTol_SDRMDegreeOfFreedomConstraintU = 4,
	StepDimTol_SDRMDegreeOfFreedomConstraintV = 5,
	StepDimTol_SDRMDegreeOfFreedomConstraintW = 6,
	StepDimTol_SDRMDegreeOfFreedomConstraintX = 7,
	StepDimTol_SDRMDegreeOfFreedomConstraintY = 8,
	StepDimTol_SDRMDegreeOfFreedomConstraintZ = 9,
	StepDimTol_SDRMDistanceVariable = 10,
	StepDimTol_SDRMFreeState = 11,
	StepDimTol_SDRMLeastMaterialRequirement = 12,
	StepDimTol_SDRMLine = 13,
	StepDimTol_SDRMMajorDiameter = 14,
	StepDimTol_SDRMMaximumMaterialRequirement = 15,
	StepDimTol_SDRMMinorDiameter = 16,
	StepDimTol_SDRMOrientation = 17,
	StepDimTol_SDRMPitchDiameter = 18,
	StepDimTol_SDRMPlane = 19,
	StepDimTol_SDRMPoint = 20,
	StepDimTol_SDRMTranslation = 21,
};

enum StepDimTol_AreaUnitType {
	StepDimTol_Circular = 0,
	StepDimTol_Rectangular = 1,
	StepDimTol_Square = 2,
};

enum StepDimTol_GeometricToleranceModifier {
	StepDimTol_GTMAnyCrossSection = 0,
	StepDimTol_GTMCommonZone = 1,
	StepDimTol_GTMEachRadialElement = 2,
	StepDimTol_GTMFreeState = 3,
	StepDimTol_GTMLeastMaterialRequirement = 4,
	StepDimTol_GTMLineElement = 5,
	StepDimTol_GTMMajorDiameter = 6,
	StepDimTol_GTMMaximumMaterialRequirement = 7,
	StepDimTol_GTMMinorDiameter = 8,
	StepDimTol_GTMNotConvex = 9,
	StepDimTol_GTMPitchDiameter = 10,
	StepDimTol_GTMReciprocityRequirement = 11,
	StepDimTol_GTMSeparateRequirement = 12,
	StepDimTol_GTMStatisticalTolerance = 13,
	StepDimTol_GTMTangentPlane = 14,
};

/* end public enums declaration */

/* handles */
%wrap_handle(StepDimTol_CommonDatum)
%wrap_handle(StepDimTol_Datum)
%wrap_handle(StepDimTol_DatumFeature)
%wrap_handle(StepDimTol_DatumReference)
%wrap_handle(StepDimTol_DatumReferenceModifierWithValue)
%wrap_handle(StepDimTol_DatumSystem)
%wrap_handle(StepDimTol_DatumTarget)
%wrap_handle(StepDimTol_GeneralDatumReference)
%wrap_handle(StepDimTol_GeometricTolerance)
%wrap_handle(StepDimTol_GeometricToleranceRelationship)
%wrap_handle(StepDimTol_RunoutZoneOrientation)
%wrap_handle(StepDimTol_SimpleDatumReferenceModifierMember)
%wrap_handle(StepDimTol_ToleranceZone)
%wrap_handle(StepDimTol_ToleranceZoneDefinition)
%wrap_handle(StepDimTol_ToleranceZoneForm)
%wrap_handle(StepDimTol_CylindricityTolerance)
%wrap_handle(StepDimTol_DatumReferenceCompartment)
%wrap_handle(StepDimTol_DatumReferenceElement)
%wrap_handle(StepDimTol_FlatnessTolerance)
%wrap_handle(StepDimTol_GeoTolAndGeoTolWthDatRef)
%wrap_handle(StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMod)
%wrap_handle(StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol)
%wrap_handle(StepDimTol_GeoTolAndGeoTolWthMod)
%wrap_handle(StepDimTol_GeometricToleranceWithDatumReference)
%wrap_handle(StepDimTol_GeometricToleranceWithDefinedUnit)
%wrap_handle(StepDimTol_GeometricToleranceWithModifiers)
%wrap_handle(StepDimTol_LineProfileTolerance)
%wrap_handle(StepDimTol_ModifiedGeometricTolerance)
%wrap_handle(StepDimTol_NonUniformZoneDefinition)
%wrap_handle(StepDimTol_PlacedDatumTargetFeature)
%wrap_handle(StepDimTol_PositionTolerance)
%wrap_handle(StepDimTol_ProjectedZoneDefinition)
%wrap_handle(StepDimTol_RoundnessTolerance)
%wrap_handle(StepDimTol_RunoutZoneDefinition)
%wrap_handle(StepDimTol_StraightnessTolerance)
%wrap_handle(StepDimTol_SurfaceProfileTolerance)
%wrap_handle(StepDimTol_UnequallyDisposedGeometricTolerance)
%wrap_handle(StepDimTol_AngularityTolerance)
%wrap_handle(StepDimTol_CircularRunoutTolerance)
%wrap_handle(StepDimTol_CoaxialityTolerance)
%wrap_handle(StepDimTol_ConcentricityTolerance)
%wrap_handle(StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol)
%wrap_handle(StepDimTol_GeoTolAndGeoTolWthDatRefAndUneqDisGeoTol)
%wrap_handle(StepDimTol_GeoTolAndGeoTolWthMaxTol)
%wrap_handle(StepDimTol_GeometricToleranceWithDefinedAreaUnit)
%wrap_handle(StepDimTol_GeometricToleranceWithMaximumTolerance)
%wrap_handle(StepDimTol_ParallelismTolerance)
%wrap_handle(StepDimTol_PerpendicularityTolerance)
%wrap_handle(StepDimTol_SymmetryTolerance)
%wrap_handle(StepDimTol_TotalRunoutTolerance)
%wrap_handle(StepDimTol_HArray1OfToleranceZoneTarget)
%wrap_handle(StepDimTol_HArray1OfDatumReference)
%wrap_handle(StepDimTol_HArray1OfDatumReferenceElement)
%wrap_handle(StepDimTol_HArray1OfDatumSystemOrReference)
%wrap_handle(StepDimTol_HArray1OfDatumReferenceCompartment)
%wrap_handle(StepDimTol_HArray1OfDatumReferenceModifier)
%wrap_handle(StepDimTol_HArray1OfGeometricToleranceModifier)
/* end handles declaration */

/* templates */
%template(StepDimTol_Array1OfToleranceZoneTarget) NCollection_Array1 <StepDimTol_ToleranceZoneTarget>;

%extend NCollection_Array1 <StepDimTol_ToleranceZoneTarget> {
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
%template(StepDimTol_Array1OfGeometricToleranceModifier) NCollection_Array1 <StepDimTol_GeometricToleranceModifier>;

%extend NCollection_Array1 <StepDimTol_GeometricToleranceModifier> {
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
%template(StepDimTol_Array1OfDatumReferenceCompartment) NCollection_Array1 <opencascade::handle <StepDimTol_DatumReferenceCompartment>>;

%extend NCollection_Array1 <opencascade::handle <StepDimTol_DatumReferenceCompartment>> {
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
%template(StepDimTol_Array1OfDatumReferenceElement) NCollection_Array1 <opencascade::handle <StepDimTol_DatumReferenceElement>>;

%extend NCollection_Array1 <opencascade::handle <StepDimTol_DatumReferenceElement>> {
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
%template(StepDimTol_Array1OfDatumSystemOrReference) NCollection_Array1 <StepDimTol_DatumSystemOrReference>;

%extend NCollection_Array1 <StepDimTol_DatumSystemOrReference> {
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
%template(StepDimTol_Array1OfDatumReferenceModifier) NCollection_Array1 <StepDimTol_DatumReferenceModifier>;

%extend NCollection_Array1 <StepDimTol_DatumReferenceModifier> {
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
%template(StepDimTol_Array1OfDatumReference) NCollection_Array1 <opencascade::handle <StepDimTol_DatumReference>>;

%extend NCollection_Array1 <opencascade::handle <StepDimTol_DatumReference>> {
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
typedef NCollection_Array1 <StepDimTol_ToleranceZoneTarget> StepDimTol_Array1OfToleranceZoneTarget;
typedef NCollection_Array1 <StepDimTol_GeometricToleranceModifier> StepDimTol_Array1OfGeometricToleranceModifier;
typedef NCollection_Array1 <opencascade::handle <StepDimTol_DatumReferenceCompartment>> StepDimTol_Array1OfDatumReferenceCompartment;
typedef NCollection_Array1 <opencascade::handle <StepDimTol_DatumReferenceElement>> StepDimTol_Array1OfDatumReferenceElement;
typedef NCollection_Array1 <StepDimTol_DatumSystemOrReference> StepDimTol_Array1OfDatumSystemOrReference;
typedef NCollection_Array1 <StepDimTol_DatumReferenceModifier> StepDimTol_Array1OfDatumReferenceModifier;
typedef NCollection_Array1 <opencascade::handle <StepDimTol_DatumReference>> StepDimTol_Array1OfDatumReference;
/* end typedefs declaration */

/*******************************
* class StepDimTol_CommonDatum *
*******************************/
class StepDimTol_CommonDatum : public StepRepr_CompositeShapeAspect {
	public:
		/****************** Datum ******************/
		%feature("compactdefaultargs") Datum;
		%feature("autodoc", "* Returns data for supertype Datum
	:rtype: opencascade::handle<StepDimTol_Datum>") Datum;
		opencascade::handle<StepDimTol_Datum> Datum ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param theShapeAspect_Name:
	:type theShapeAspect_Name: TCollection_HAsciiString
	:param theShapeAspect_Description:
	:type theShapeAspect_Description: TCollection_HAsciiString
	:param theShapeAspect_OfShape:
	:type theShapeAspect_OfShape: StepRepr_ProductDefinitionShape
	:param theShapeAspect_ProductDefinitional:
	:type theShapeAspect_ProductDefinitional: StepData_Logical
	:param theDatum_Name:
	:type theDatum_Name: TCollection_HAsciiString
	:param theDatum_Description:
	:type theDatum_Description: TCollection_HAsciiString
	:param theDatum_OfShape:
	:type theDatum_OfShape: StepRepr_ProductDefinitionShape
	:param theDatum_ProductDefinitional:
	:type theDatum_ProductDefinitional: StepData_Logical
	:param theDatum_Identification:
	:type theDatum_Identification: TCollection_HAsciiString
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & theShapeAspect_Name,const opencascade::handle<TCollection_HAsciiString> & theShapeAspect_Description,const opencascade::handle<StepRepr_ProductDefinitionShape> & theShapeAspect_OfShape,const StepData_Logical theShapeAspect_ProductDefinitional,const opencascade::handle<TCollection_HAsciiString> & theDatum_Name,const opencascade::handle<TCollection_HAsciiString> & theDatum_Description,const opencascade::handle<StepRepr_ProductDefinitionShape> & theDatum_OfShape,const StepData_Logical theDatum_ProductDefinitional,const opencascade::handle<TCollection_HAsciiString> & theDatum_Identification);

		/****************** SetDatum ******************/
		%feature("compactdefaultargs") SetDatum;
		%feature("autodoc", "* Set data for supertype Datum
	:param theDatum:
	:type theDatum: StepDimTol_Datum
	:rtype: None") SetDatum;
		void SetDatum (const opencascade::handle<StepDimTol_Datum> & theDatum);

		/****************** StepDimTol_CommonDatum ******************/
		%feature("compactdefaultargs") StepDimTol_CommonDatum;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepDimTol_CommonDatum;
		 StepDimTol_CommonDatum ();

};


%make_alias(StepDimTol_CommonDatum)

%extend StepDimTol_CommonDatum {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class StepDimTol_Datum *
*************************/
class StepDimTol_Datum : public StepRepr_ShapeAspect {
	public:
		/****************** Identification ******************/
		%feature("compactdefaultargs") Identification;
		%feature("autodoc", "* Returns field Identification
	:rtype: opencascade::handle<TCollection_HAsciiString>") Identification;
		opencascade::handle<TCollection_HAsciiString> Identification ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param theShapeAspect_Name:
	:type theShapeAspect_Name: TCollection_HAsciiString
	:param theShapeAspect_Description:
	:type theShapeAspect_Description: TCollection_HAsciiString
	:param theShapeAspect_OfShape:
	:type theShapeAspect_OfShape: StepRepr_ProductDefinitionShape
	:param theShapeAspect_ProductDefinitional:
	:type theShapeAspect_ProductDefinitional: StepData_Logical
	:param theIdentification:
	:type theIdentification: TCollection_HAsciiString
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & theShapeAspect_Name,const opencascade::handle<TCollection_HAsciiString> & theShapeAspect_Description,const opencascade::handle<StepRepr_ProductDefinitionShape> & theShapeAspect_OfShape,const StepData_Logical theShapeAspect_ProductDefinitional,const opencascade::handle<TCollection_HAsciiString> & theIdentification);

		/****************** SetIdentification ******************/
		%feature("compactdefaultargs") SetIdentification;
		%feature("autodoc", "* Set field Identification
	:param theIdentification:
	:type theIdentification: TCollection_HAsciiString
	:rtype: None") SetIdentification;
		void SetIdentification (const opencascade::handle<TCollection_HAsciiString> & theIdentification);

		/****************** StepDimTol_Datum ******************/
		%feature("compactdefaultargs") StepDimTol_Datum;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepDimTol_Datum;
		 StepDimTol_Datum ();

};


%make_alias(StepDimTol_Datum)

%extend StepDimTol_Datum {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class StepDimTol_DatumFeature *
********************************/
class StepDimTol_DatumFeature : public StepRepr_ShapeAspect {
	public:
		/****************** StepDimTol_DatumFeature ******************/
		%feature("compactdefaultargs") StepDimTol_DatumFeature;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepDimTol_DatumFeature;
		 StepDimTol_DatumFeature ();

};


%make_alias(StepDimTol_DatumFeature)

%extend StepDimTol_DatumFeature {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class StepDimTol_DatumOrCommonDatum *
**************************************/
class StepDimTol_DatumOrCommonDatum : public StepData_SelectType {
	public:
		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "* Recognizes a DatumOrCommonDatum Kind Entity that is : 1 -> Datum 2 -> CommonDatumList 0 else
	:param ent:
	:type ent: Standard_Transient
	:rtype: int") CaseNum;
		Standard_Integer CaseNum (const opencascade::handle<Standard_Transient> & ent);

		/****************** CommonDatumList ******************/
		%feature("compactdefaultargs") CommonDatumList;
		%feature("autodoc", "* returns Value as a CommonDatumList (Null if another type)
	:rtype: opencascade::handle<StepDimTol_HArray1OfDatumReferenceElement>") CommonDatumList;
		opencascade::handle<StepDimTol_HArray1OfDatumReferenceElement> CommonDatumList ();

		/****************** Datum ******************/
		%feature("compactdefaultargs") Datum;
		%feature("autodoc", "* returns Value as a Datum (Null if another type)
	:rtype: opencascade::handle<StepDimTol_Datum>") Datum;
		opencascade::handle<StepDimTol_Datum> Datum ();

		/****************** StepDimTol_DatumOrCommonDatum ******************/
		%feature("compactdefaultargs") StepDimTol_DatumOrCommonDatum;
		%feature("autodoc", "* Returns a DatumOrCommonDatum select type
	:rtype: None") StepDimTol_DatumOrCommonDatum;
		 StepDimTol_DatumOrCommonDatum ();

};


%extend StepDimTol_DatumOrCommonDatum {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class StepDimTol_DatumReference *
**********************************/
class StepDimTol_DatumReference : public Standard_Transient {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param thePrecedence:
	:type thePrecedence: int
	:param theReferencedDatum:
	:type theReferencedDatum: StepDimTol_Datum
	:rtype: None") Init;
		void Init (const Standard_Integer thePrecedence,const opencascade::handle<StepDimTol_Datum> & theReferencedDatum);

		/****************** Precedence ******************/
		%feature("compactdefaultargs") Precedence;
		%feature("autodoc", "* Returns field Precedence
	:rtype: int") Precedence;
		Standard_Integer Precedence ();

		/****************** ReferencedDatum ******************/
		%feature("compactdefaultargs") ReferencedDatum;
		%feature("autodoc", "* Returns field ReferencedDatum
	:rtype: opencascade::handle<StepDimTol_Datum>") ReferencedDatum;
		opencascade::handle<StepDimTol_Datum> ReferencedDatum ();

		/****************** SetPrecedence ******************/
		%feature("compactdefaultargs") SetPrecedence;
		%feature("autodoc", "* Set field Precedence
	:param thePrecedence:
	:type thePrecedence: int
	:rtype: None") SetPrecedence;
		void SetPrecedence (const Standard_Integer thePrecedence);

		/****************** SetReferencedDatum ******************/
		%feature("compactdefaultargs") SetReferencedDatum;
		%feature("autodoc", "* Set field ReferencedDatum
	:param theReferencedDatum:
	:type theReferencedDatum: StepDimTol_Datum
	:rtype: None") SetReferencedDatum;
		void SetReferencedDatum (const opencascade::handle<StepDimTol_Datum> & theReferencedDatum);

		/****************** StepDimTol_DatumReference ******************/
		%feature("compactdefaultargs") StepDimTol_DatumReference;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepDimTol_DatumReference;
		 StepDimTol_DatumReference ();

};


%make_alias(StepDimTol_DatumReference)

%extend StepDimTol_DatumReference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class StepDimTol_DatumReferenceModifier *
******************************************/
class StepDimTol_DatumReferenceModifier : public StepData_SelectType {
	public:
		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "* Recognizes a DatumReferenceModifier Kind Entity that is : 1 -> DatumReferenceModifierWithValue 2 -> SimpleDatumReferenceModifierMember 0 else
	:param ent:
	:type ent: Standard_Transient
	:rtype: int") CaseNum;
		Standard_Integer CaseNum (const opencascade::handle<Standard_Transient> & ent);

		/****************** DatumReferenceModifierWithValue ******************/
		%feature("compactdefaultargs") DatumReferenceModifierWithValue;
		%feature("autodoc", "* returns Value as a DatumReferenceModifierWithValue (Null if another type)
	:rtype: opencascade::handle<StepDimTol_DatumReferenceModifierWithValue>") DatumReferenceModifierWithValue;
		opencascade::handle<StepDimTol_DatumReferenceModifierWithValue> DatumReferenceModifierWithValue ();

		/****************** SimpleDatumReferenceModifierMember ******************/
		%feature("compactdefaultargs") SimpleDatumReferenceModifierMember;
		%feature("autodoc", "* returns Value as a SimpleDatumReferenceModifierMember (Null if another type)
	:rtype: opencascade::handle<StepDimTol_SimpleDatumReferenceModifierMember>") SimpleDatumReferenceModifierMember;
		opencascade::handle<StepDimTol_SimpleDatumReferenceModifierMember> SimpleDatumReferenceModifierMember ();

		/****************** StepDimTol_DatumReferenceModifier ******************/
		%feature("compactdefaultargs") StepDimTol_DatumReferenceModifier;
		%feature("autodoc", "* Returns a DatumReferenceModifier select type
	:rtype: None") StepDimTol_DatumReferenceModifier;
		 StepDimTol_DatumReferenceModifier ();

};


%extend StepDimTol_DatumReferenceModifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class StepDimTol_DatumReferenceModifierWithValue *
***************************************************/
class StepDimTol_DatumReferenceModifierWithValue : public Standard_Transient {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param theModifierType:
	:type theModifierType: StepDimTol_DatumReferenceModifierType
	:param theModifierValue:
	:type theModifierValue: StepBasic_LengthMeasureWithUnit
	:rtype: None") Init;
		void Init (const StepDimTol_DatumReferenceModifierType & theModifierType,const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theModifierValue);

		/****************** ModifierType ******************/
		%feature("compactdefaultargs") ModifierType;
		%feature("autodoc", "* Returns field ModifierType
	:rtype: inline StepDimTol_DatumReferenceModifierType") ModifierType;
		inline StepDimTol_DatumReferenceModifierType ModifierType ();

		/****************** ModifierValue ******************/
		%feature("compactdefaultargs") ModifierValue;
		%feature("autodoc", "* Returns field ModifierValue
	:rtype: inline opencascade::handle<StepBasic_LengthMeasureWithUnit>") ModifierValue;
		inline opencascade::handle<StepBasic_LengthMeasureWithUnit> ModifierValue ();

		/****************** SetModifierType ******************/
		%feature("compactdefaultargs") SetModifierType;
		%feature("autodoc", "* Set field ModifierType
	:param theModifierType:
	:type theModifierType: StepDimTol_DatumReferenceModifierType
	:rtype: inline void") SetModifierType;
		inline void SetModifierType (const StepDimTol_DatumReferenceModifierType & theModifierType);

		/****************** SetModifierValue ******************/
		%feature("compactdefaultargs") SetModifierValue;
		%feature("autodoc", "* Set field ModifierValue
	:param theModifierValue:
	:type theModifierValue: StepBasic_LengthMeasureWithUnit
	:rtype: inline void") SetModifierValue;
		inline void SetModifierValue (const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theModifierValue);

		/****************** StepDimTol_DatumReferenceModifierWithValue ******************/
		%feature("compactdefaultargs") StepDimTol_DatumReferenceModifierWithValue;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepDimTol_DatumReferenceModifierWithValue;
		 StepDimTol_DatumReferenceModifierWithValue ();

};


%make_alias(StepDimTol_DatumReferenceModifierWithValue)

%extend StepDimTol_DatumReferenceModifierWithValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class StepDimTol_DatumSystem *
*******************************/
class StepDimTol_DatumSystem : public StepRepr_ShapeAspect {
	public:
		/****************** Constituents ******************/
		%feature("compactdefaultargs") Constituents;
		%feature("autodoc", "* Returns field Constituents
	:rtype: inline opencascade::handle<StepDimTol_HArray1OfDatumReferenceCompartment>") Constituents;
		inline opencascade::handle<StepDimTol_HArray1OfDatumReferenceCompartment> Constituents ();

		/****************** ConstituentsValue ******************/
		%feature("compactdefaultargs") ConstituentsValue;
		%feature("autodoc", "* Returns Constituents with the given number
	:param num:
	:type num: int
	:rtype: inline opencascade::handle<StepDimTol_DatumReferenceCompartment>") ConstituentsValue;
		inline opencascade::handle<StepDimTol_DatumReferenceCompartment> ConstituentsValue (const Standard_Integer num);

		/****************** ConstituentsValue ******************/
		%feature("compactdefaultargs") ConstituentsValue;
		%feature("autodoc", "* Sets Constituents with given number
	:param num:
	:type num: int
	:param theItem:
	:type theItem: StepDimTol_DatumReferenceCompartment
	:rtype: inline void") ConstituentsValue;
		inline void ConstituentsValue (const Standard_Integer num,const opencascade::handle<StepDimTol_DatumReferenceCompartment> & theItem);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param theName:
	:type theName: TCollection_HAsciiString
	:param theDescription:
	:type theDescription: TCollection_HAsciiString
	:param theOfShape:
	:type theOfShape: StepRepr_ProductDefinitionShape
	:param theProductDefinitional:
	:type theProductDefinitional: StepData_Logical
	:param theConstituents:
	:type theConstituents: StepDimTol_HArray1OfDatumReferenceCompartment
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & theName,const opencascade::handle<TCollection_HAsciiString> & theDescription,const opencascade::handle<StepRepr_ProductDefinitionShape> & theOfShape,const StepData_Logical theProductDefinitional,const opencascade::handle<StepDimTol_HArray1OfDatumReferenceCompartment> & theConstituents);

		/****************** NbConstituents ******************/
		%feature("compactdefaultargs") NbConstituents;
		%feature("autodoc", "* Returns number of Constituents
	:rtype: inline int") NbConstituents;
		inline Standard_Integer NbConstituents ();

		/****************** SetConstituents ******************/
		%feature("compactdefaultargs") SetConstituents;
		%feature("autodoc", "* Set field Constituents
	:param theConstituents:
	:type theConstituents: StepDimTol_HArray1OfDatumReferenceCompartment
	:rtype: inline void") SetConstituents;
		inline void SetConstituents (const opencascade::handle<StepDimTol_HArray1OfDatumReferenceCompartment> & theConstituents);

		/****************** StepDimTol_DatumSystem ******************/
		%feature("compactdefaultargs") StepDimTol_DatumSystem;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepDimTol_DatumSystem;
		 StepDimTol_DatumSystem ();

};


%make_alias(StepDimTol_DatumSystem)

%extend StepDimTol_DatumSystem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class StepDimTol_DatumSystemOrReference *
******************************************/
class StepDimTol_DatumSystemOrReference : public StepData_SelectType {
	public:
		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "* Recognizes a DatumSystemOrReference Kind Entity that is : 1 -> DatumSystem 2 -> DatumReference 0 else
	:param ent:
	:type ent: Standard_Transient
	:rtype: int") CaseNum;
		Standard_Integer CaseNum (const opencascade::handle<Standard_Transient> & ent);

		/****************** DatumReference ******************/
		%feature("compactdefaultargs") DatumReference;
		%feature("autodoc", "* returns Value as a DatumReference (Null if another type)
	:rtype: opencascade::handle<StepDimTol_DatumReference>") DatumReference;
		opencascade::handle<StepDimTol_DatumReference> DatumReference ();

		/****************** DatumSystem ******************/
		%feature("compactdefaultargs") DatumSystem;
		%feature("autodoc", "* returns Value as a DatumSystem (Null if another type)
	:rtype: opencascade::handle<StepDimTol_DatumSystem>") DatumSystem;
		opencascade::handle<StepDimTol_DatumSystem> DatumSystem ();

		/****************** StepDimTol_DatumSystemOrReference ******************/
		%feature("compactdefaultargs") StepDimTol_DatumSystemOrReference;
		%feature("autodoc", "* Returns a DatumSystemOrReference select type
	:rtype: None") StepDimTol_DatumSystemOrReference;
		 StepDimTol_DatumSystemOrReference ();

};


%extend StepDimTol_DatumSystemOrReference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class StepDimTol_DatumTarget *
*******************************/
class StepDimTol_DatumTarget : public StepRepr_ShapeAspect {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param theShapeAspect_Name:
	:type theShapeAspect_Name: TCollection_HAsciiString
	:param theShapeAspect_Description:
	:type theShapeAspect_Description: TCollection_HAsciiString
	:param theShapeAspect_OfShape:
	:type theShapeAspect_OfShape: StepRepr_ProductDefinitionShape
	:param theShapeAspect_ProductDefinitional:
	:type theShapeAspect_ProductDefinitional: StepData_Logical
	:param theTargetId:
	:type theTargetId: TCollection_HAsciiString
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & theShapeAspect_Name,const opencascade::handle<TCollection_HAsciiString> & theShapeAspect_Description,const opencascade::handle<StepRepr_ProductDefinitionShape> & theShapeAspect_OfShape,const StepData_Logical theShapeAspect_ProductDefinitional,const opencascade::handle<TCollection_HAsciiString> & theTargetId);

		/****************** SetTargetId ******************/
		%feature("compactdefaultargs") SetTargetId;
		%feature("autodoc", "* Set field TargetId
	:param theTargetId:
	:type theTargetId: TCollection_HAsciiString
	:rtype: None") SetTargetId;
		void SetTargetId (const opencascade::handle<TCollection_HAsciiString> & theTargetId);

		/****************** StepDimTol_DatumTarget ******************/
		%feature("compactdefaultargs") StepDimTol_DatumTarget;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepDimTol_DatumTarget;
		 StepDimTol_DatumTarget ();

		/****************** TargetId ******************/
		%feature("compactdefaultargs") TargetId;
		%feature("autodoc", "* Returns field TargetId
	:rtype: opencascade::handle<TCollection_HAsciiString>") TargetId;
		opencascade::handle<TCollection_HAsciiString> TargetId ();

};


%make_alias(StepDimTol_DatumTarget)

%extend StepDimTol_DatumTarget {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class StepDimTol_GeneralDatumReference *
*****************************************/
class StepDimTol_GeneralDatumReference : public StepRepr_ShapeAspect {
	public:
		/****************** Base ******************/
		%feature("compactdefaultargs") Base;
		%feature("autodoc", "* Returns field Base
	:rtype: inline StepDimTol_DatumOrCommonDatum") Base;
		inline StepDimTol_DatumOrCommonDatum Base ();

		/****************** HasModifiers ******************/
		%feature("compactdefaultargs") HasModifiers;
		%feature("autodoc", "* Indicates is field Modifiers exist
	:rtype: inline bool") HasModifiers;
		inline Standard_Boolean HasModifiers ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param theName:
	:type theName: TCollection_HAsciiString
	:param theDescription:
	:type theDescription: TCollection_HAsciiString
	:param theOfShape:
	:type theOfShape: StepRepr_ProductDefinitionShape
	:param theProductDefinitional:
	:type theProductDefinitional: StepData_Logical
	:param theBase:
	:type theBase: StepDimTol_DatumOrCommonDatum
	:param theHasModifiers:
	:type theHasModifiers: bool
	:param theModifiers:
	:type theModifiers: StepDimTol_HArray1OfDatumReferenceModifier
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & theName,const opencascade::handle<TCollection_HAsciiString> & theDescription,const opencascade::handle<StepRepr_ProductDefinitionShape> & theOfShape,const StepData_Logical theProductDefinitional,const StepDimTol_DatumOrCommonDatum & theBase,const Standard_Boolean theHasModifiers,const opencascade::handle<StepDimTol_HArray1OfDatumReferenceModifier> & theModifiers);

		/****************** Modifiers ******************/
		%feature("compactdefaultargs") Modifiers;
		%feature("autodoc", "* Returns field Modifiers
	:rtype: inline opencascade::handle<StepDimTol_HArray1OfDatumReferenceModifier>") Modifiers;
		inline opencascade::handle<StepDimTol_HArray1OfDatumReferenceModifier> Modifiers ();

		/****************** ModifiersValue ******************/
		%feature("compactdefaultargs") ModifiersValue;
		%feature("autodoc", "* Returns Modifiers with the given number
	:param theNum:
	:type theNum: int
	:rtype: inline StepDimTol_DatumReferenceModifier") ModifiersValue;
		inline StepDimTol_DatumReferenceModifier ModifiersValue (const Standard_Integer theNum);

		/****************** ModifiersValue ******************/
		%feature("compactdefaultargs") ModifiersValue;
		%feature("autodoc", "* Sets Modifiers with given number
	:param theNum:
	:type theNum: int
	:param theItem:
	:type theItem: StepDimTol_DatumReferenceModifier
	:rtype: inline void") ModifiersValue;
		inline void ModifiersValue (const Standard_Integer theNum,const StepDimTol_DatumReferenceModifier & theItem);

		/****************** NbModifiers ******************/
		%feature("compactdefaultargs") NbModifiers;
		%feature("autodoc", "* Returns number of Modifiers
	:rtype: inline int") NbModifiers;
		inline Standard_Integer NbModifiers ();

		/****************** SetBase ******************/
		%feature("compactdefaultargs") SetBase;
		%feature("autodoc", "* Set field Base
	:param theBase:
	:type theBase: StepDimTol_DatumOrCommonDatum
	:rtype: inline void") SetBase;
		inline void SetBase (const StepDimTol_DatumOrCommonDatum & theBase);

		/****************** SetModifiers ******************/
		%feature("compactdefaultargs") SetModifiers;
		%feature("autodoc", "* Set field Modifiers
	:param theModifiers:
	:type theModifiers: StepDimTol_HArray1OfDatumReferenceModifier
	:rtype: inline void") SetModifiers;
		inline void SetModifiers (const opencascade::handle<StepDimTol_HArray1OfDatumReferenceModifier> & theModifiers);

		/****************** StepDimTol_GeneralDatumReference ******************/
		%feature("compactdefaultargs") StepDimTol_GeneralDatumReference;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepDimTol_GeneralDatumReference;
		 StepDimTol_GeneralDatumReference ();

};


%make_alias(StepDimTol_GeneralDatumReference)

%extend StepDimTol_GeneralDatumReference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class StepDimTol_GeometricTolerance *
**************************************/
class StepDimTol_GeometricTolerance : public Standard_Transient {
	public:
		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "* Returns field Description
	:rtype: opencascade::handle<TCollection_HAsciiString>") Description;
		opencascade::handle<TCollection_HAsciiString> Description ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited) AP214
	:param theName:
	:type theName: TCollection_HAsciiString
	:param theDescription:
	:type theDescription: TCollection_HAsciiString
	:param theMagnitude:
	:type theMagnitude: StepBasic_MeasureWithUnit
	:param theTolerancedShapeAspect:
	:type theTolerancedShapeAspect: StepRepr_ShapeAspect
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & theName,const opencascade::handle<TCollection_HAsciiString> & theDescription,const opencascade::handle<StepBasic_MeasureWithUnit> & theMagnitude,const opencascade::handle<StepRepr_ShapeAspect> & theTolerancedShapeAspect);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited) AP242
	:param theName:
	:type theName: TCollection_HAsciiString
	:param theDescription:
	:type theDescription: TCollection_HAsciiString
	:param theMagnitude:
	:type theMagnitude: StepBasic_MeasureWithUnit
	:param theTolerancedShapeAspect:
	:type theTolerancedShapeAspect: StepDimTol_GeometricToleranceTarget
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & theName,const opencascade::handle<TCollection_HAsciiString> & theDescription,const opencascade::handle<StepBasic_MeasureWithUnit> & theMagnitude,const StepDimTol_GeometricToleranceTarget & theTolerancedShapeAspect);

		/****************** Magnitude ******************/
		%feature("compactdefaultargs") Magnitude;
		%feature("autodoc", "* Returns field Magnitude
	:rtype: opencascade::handle<StepBasic_MeasureWithUnit>") Magnitude;
		opencascade::handle<StepBasic_MeasureWithUnit> Magnitude ();

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "* Returns field Name
	:rtype: opencascade::handle<TCollection_HAsciiString>") Name;
		opencascade::handle<TCollection_HAsciiString> Name ();

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "* Set field Description
	:param theDescription:
	:type theDescription: TCollection_HAsciiString
	:rtype: None") SetDescription;
		void SetDescription (const opencascade::handle<TCollection_HAsciiString> & theDescription);

		/****************** SetMagnitude ******************/
		%feature("compactdefaultargs") SetMagnitude;
		%feature("autodoc", "* Set field Magnitude
	:param theMagnitude:
	:type theMagnitude: StepBasic_MeasureWithUnit
	:rtype: None") SetMagnitude;
		void SetMagnitude (const opencascade::handle<StepBasic_MeasureWithUnit> & theMagnitude);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "* Set field Name
	:param theName:
	:type theName: TCollection_HAsciiString
	:rtype: None") SetName;
		void SetName (const opencascade::handle<TCollection_HAsciiString> & theName);

		/****************** SetTolerancedShapeAspect ******************/
		%feature("compactdefaultargs") SetTolerancedShapeAspect;
		%feature("autodoc", "* Set field TolerancedShapeAspect AP214
	:param theTolerancedShapeAspect:
	:type theTolerancedShapeAspect: StepRepr_ShapeAspect
	:rtype: None") SetTolerancedShapeAspect;
		void SetTolerancedShapeAspect (const opencascade::handle<StepRepr_ShapeAspect> & theTolerancedShapeAspect);

		/****************** SetTolerancedShapeAspect ******************/
		%feature("compactdefaultargs") SetTolerancedShapeAspect;
		%feature("autodoc", "* Set field TolerancedShapeAspect AP242
	:param theTolerancedShapeAspect:
	:type theTolerancedShapeAspect: StepDimTol_GeometricToleranceTarget
	:rtype: None") SetTolerancedShapeAspect;
		void SetTolerancedShapeAspect (const StepDimTol_GeometricToleranceTarget & theTolerancedShapeAspect);

		/****************** StepDimTol_GeometricTolerance ******************/
		%feature("compactdefaultargs") StepDimTol_GeometricTolerance;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepDimTol_GeometricTolerance;
		 StepDimTol_GeometricTolerance ();

		/****************** TolerancedShapeAspect ******************/
		%feature("compactdefaultargs") TolerancedShapeAspect;
		%feature("autodoc", "* Returns field TolerancedShapeAspect Note: in AP214(203) type of this attribute can be only StepRepr_ShapeAspect
	:rtype: StepDimTol_GeometricToleranceTarget") TolerancedShapeAspect;
		StepDimTol_GeometricToleranceTarget TolerancedShapeAspect ();

};


%make_alias(StepDimTol_GeometricTolerance)

%extend StepDimTol_GeometricTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class StepDimTol_GeometricToleranceRelationship *
**************************************************/
class StepDimTol_GeometricToleranceRelationship : public Standard_Transient {
	public:
		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "* Returns field Description
	:rtype: opencascade::handle<TCollection_HAsciiString>") Description;
		opencascade::handle<TCollection_HAsciiString> Description ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param theName:
	:type theName: TCollection_HAsciiString
	:param theDescription:
	:type theDescription: TCollection_HAsciiString
	:param theRelatingGeometricTolerance:
	:type theRelatingGeometricTolerance: StepDimTol_GeometricTolerance
	:param theRelatedGeometricTolerance:
	:type theRelatedGeometricTolerance: StepDimTol_GeometricTolerance
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & theName,const opencascade::handle<TCollection_HAsciiString> & theDescription,const opencascade::handle<StepDimTol_GeometricTolerance> & theRelatingGeometricTolerance,const opencascade::handle<StepDimTol_GeometricTolerance> & theRelatedGeometricTolerance);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "* Returns field Name
	:rtype: opencascade::handle<TCollection_HAsciiString>") Name;
		opencascade::handle<TCollection_HAsciiString> Name ();

		/****************** RelatedGeometricTolerance ******************/
		%feature("compactdefaultargs") RelatedGeometricTolerance;
		%feature("autodoc", "* Returns field RelatedGeometricTolerance
	:rtype: opencascade::handle<StepDimTol_GeometricTolerance>") RelatedGeometricTolerance;
		opencascade::handle<StepDimTol_GeometricTolerance> RelatedGeometricTolerance ();

		/****************** RelatingGeometricTolerance ******************/
		%feature("compactdefaultargs") RelatingGeometricTolerance;
		%feature("autodoc", "* Returns field RelatingGeometricTolerance
	:rtype: opencascade::handle<StepDimTol_GeometricTolerance>") RelatingGeometricTolerance;
		opencascade::handle<StepDimTol_GeometricTolerance> RelatingGeometricTolerance ();

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "* Set field Description
	:param theDescription:
	:type theDescription: TCollection_HAsciiString
	:rtype: None") SetDescription;
		void SetDescription (const opencascade::handle<TCollection_HAsciiString> & theDescription);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "* Set field Name
	:param theName:
	:type theName: TCollection_HAsciiString
	:rtype: None") SetName;
		void SetName (const opencascade::handle<TCollection_HAsciiString> & theName);

		/****************** SetRelatedGeometricTolerance ******************/
		%feature("compactdefaultargs") SetRelatedGeometricTolerance;
		%feature("autodoc", "* Set field RelatedGeometricTolerance
	:param theRelatedGeometricTolerance:
	:type theRelatedGeometricTolerance: StepDimTol_GeometricTolerance
	:rtype: None") SetRelatedGeometricTolerance;
		void SetRelatedGeometricTolerance (const opencascade::handle<StepDimTol_GeometricTolerance> & theRelatedGeometricTolerance);

		/****************** SetRelatingGeometricTolerance ******************/
		%feature("compactdefaultargs") SetRelatingGeometricTolerance;
		%feature("autodoc", "* Set field RelatingGeometricTolerance
	:param theRelatingGeometricTolerance:
	:type theRelatingGeometricTolerance: StepDimTol_GeometricTolerance
	:rtype: None") SetRelatingGeometricTolerance;
		void SetRelatingGeometricTolerance (const opencascade::handle<StepDimTol_GeometricTolerance> & theRelatingGeometricTolerance);

		/****************** StepDimTol_GeometricToleranceRelationship ******************/
		%feature("compactdefaultargs") StepDimTol_GeometricToleranceRelationship;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepDimTol_GeometricToleranceRelationship;
		 StepDimTol_GeometricToleranceRelationship ();

};


%make_alias(StepDimTol_GeometricToleranceRelationship)

%extend StepDimTol_GeometricToleranceRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class StepDimTol_GeometricToleranceTarget *
********************************************/
class StepDimTol_GeometricToleranceTarget : public StepData_SelectType {
	public:
		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "* Recognizes a GeometricToleranceTarget Kind Entity that is : 1 -> DimensionalLocation 2 -> DimensionalSize 3 -> ProductDefinitionShape 4 -> ShapeAspect 0 else
	:param ent:
	:type ent: Standard_Transient
	:rtype: int") CaseNum;
		Standard_Integer CaseNum (const opencascade::handle<Standard_Transient> & ent);

		/****************** DimensionalLocation ******************/
		%feature("compactdefaultargs") DimensionalLocation;
		%feature("autodoc", "* returns Value as a DimensionalLocation (Null if another type)
	:rtype: opencascade::handle<StepShape_DimensionalLocation>") DimensionalLocation;
		opencascade::handle<StepShape_DimensionalLocation> DimensionalLocation ();

		/****************** DimensionalSize ******************/
		%feature("compactdefaultargs") DimensionalSize;
		%feature("autodoc", "* returns Value as a DimensionalSize (Null if another type)
	:rtype: opencascade::handle<StepShape_DimensionalSize>") DimensionalSize;
		opencascade::handle<StepShape_DimensionalSize> DimensionalSize ();

		/****************** ProductDefinitionShape ******************/
		%feature("compactdefaultargs") ProductDefinitionShape;
		%feature("autodoc", "* returns Value as a ProductDefinitionShape (Null if another type)
	:rtype: opencascade::handle<StepRepr_ProductDefinitionShape>") ProductDefinitionShape;
		opencascade::handle<StepRepr_ProductDefinitionShape> ProductDefinitionShape ();

		/****************** ShapeAspect ******************/
		%feature("compactdefaultargs") ShapeAspect;
		%feature("autodoc", "* returns Value as a ShapeAspect (Null if another type)
	:rtype: opencascade::handle<StepRepr_ShapeAspect>") ShapeAspect;
		opencascade::handle<StepRepr_ShapeAspect> ShapeAspect ();

		/****************** StepDimTol_GeometricToleranceTarget ******************/
		%feature("compactdefaultargs") StepDimTol_GeometricToleranceTarget;
		%feature("autodoc", "* Returns a GeometricToleranceTarget select type
	:rtype: None") StepDimTol_GeometricToleranceTarget;
		 StepDimTol_GeometricToleranceTarget ();

};


%extend StepDimTol_GeometricToleranceTarget {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class StepDimTol_RunoutZoneOrientation *
*****************************************/
class StepDimTol_RunoutZoneOrientation : public Standard_Transient {
	public:
		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "* Returns field Angle
	:rtype: inline opencascade::handle<StepBasic_PlaneAngleMeasureWithUnit>") Angle;
		inline opencascade::handle<StepBasic_PlaneAngleMeasureWithUnit> Angle ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Init all field own and inherited
	:param theAngle:
	:type theAngle: StepBasic_PlaneAngleMeasureWithUnit
	:rtype: None") Init;
		void Init (const opencascade::handle<StepBasic_PlaneAngleMeasureWithUnit> & theAngle);

		/****************** SetAngle ******************/
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "* Set field Angle
	:param theAngle:
	:type theAngle: StepBasic_PlaneAngleMeasureWithUnit
	:rtype: inline void") SetAngle;
		inline void SetAngle (const opencascade::handle<StepBasic_PlaneAngleMeasureWithUnit> & theAngle);

		/****************** StepDimTol_RunoutZoneOrientation ******************/
		%feature("compactdefaultargs") StepDimTol_RunoutZoneOrientation;
		%feature("autodoc", ":rtype: None") StepDimTol_RunoutZoneOrientation;
		 StepDimTol_RunoutZoneOrientation ();

};


%make_alias(StepDimTol_RunoutZoneOrientation)

%extend StepDimTol_RunoutZoneOrientation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class StepDimTol_ShapeToleranceSelect *
****************************************/
class StepDimTol_ShapeToleranceSelect : public StepData_SelectType {
	public:
		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "* Recognizes a kind of ShapeToleranceSelect select type 1 -> GeometricTolerance from StepDimTol 2 -> PlusMinusTolerance from StepShape 0 else
	:param ent:
	:type ent: Standard_Transient
	:rtype: int") CaseNum;
		Standard_Integer CaseNum (const opencascade::handle<Standard_Transient> & ent);

		/****************** GeometricTolerance ******************/
		%feature("compactdefaultargs") GeometricTolerance;
		%feature("autodoc", "* Returns Value as GeometricTolerance (or Null if another type)
	:rtype: opencascade::handle<StepDimTol_GeometricTolerance>") GeometricTolerance;
		opencascade::handle<StepDimTol_GeometricTolerance> GeometricTolerance ();

		/****************** PlusMinusTolerance ******************/
		%feature("compactdefaultargs") PlusMinusTolerance;
		%feature("autodoc", "* Returns Value as PlusMinusTolerance (or Null if another type)
	:rtype: opencascade::handle<StepShape_PlusMinusTolerance>") PlusMinusTolerance;
		opencascade::handle<StepShape_PlusMinusTolerance> PlusMinusTolerance ();

		/****************** StepDimTol_ShapeToleranceSelect ******************/
		%feature("compactdefaultargs") StepDimTol_ShapeToleranceSelect;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepDimTol_ShapeToleranceSelect;
		 StepDimTol_ShapeToleranceSelect ();

};


%extend StepDimTol_ShapeToleranceSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************************
* class StepDimTol_SimpleDatumReferenceModifierMember *
******************************************************/
class StepDimTol_SimpleDatumReferenceModifierMember : public StepData_SelectInt {
	public:
		/****************** EnumText ******************/
		%feature("compactdefaultargs") EnumText;
		%feature("autodoc", ":rtype: char *") EnumText;
		virtual const char * EnumText ();

		/****************** HasName ******************/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", ":rtype: bool") HasName;
		Standard_Boolean HasName ();

		/****************** Kind ******************/
		%feature("compactdefaultargs") Kind;
		%feature("autodoc", ":rtype: int") Kind;
		Standard_Integer Kind ();

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", ":rtype: char *") Name;
		const char * Name ();

		/****************** SetEnumText ******************/
		%feature("compactdefaultargs") SetEnumText;
		%feature("autodoc", ":param theValue:
	:type theValue: int
	:param theText:
	:type theText: char *
	:rtype: void") SetEnumText;
		virtual void SetEnumText (const Standard_Integer theValue,const char * theText);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", ":param Standard_CString:
	:type Standard_CString: 
	:rtype: bool") SetName;
		Standard_Boolean SetName (const Standard_CString);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", ":param theValue:
	:type theValue: StepDimTol_SimpleDatumReferenceModifier
	:rtype: None") SetValue;
		void SetValue (const StepDimTol_SimpleDatumReferenceModifier theValue);

		/****************** StepDimTol_SimpleDatumReferenceModifierMember ******************/
		%feature("compactdefaultargs") StepDimTol_SimpleDatumReferenceModifierMember;
		%feature("autodoc", ":rtype: None") StepDimTol_SimpleDatumReferenceModifierMember;
		 StepDimTol_SimpleDatumReferenceModifierMember ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: StepDimTol_SimpleDatumReferenceModifier") Value;
		StepDimTol_SimpleDatumReferenceModifier Value ();

};


%make_alias(StepDimTol_SimpleDatumReferenceModifierMember)

%extend StepDimTol_SimpleDatumReferenceModifierMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class StepDimTol_ToleranceZone *
*********************************/
class StepDimTol_ToleranceZone : public StepRepr_ShapeAspect {
	public:
		/****************** DefiningTolerance ******************/
		%feature("compactdefaultargs") DefiningTolerance;
		%feature("autodoc", "* Returns field DefiningTolerance
	:rtype: inline opencascade::handle<StepDimTol_HArray1OfToleranceZoneTarget>") DefiningTolerance;
		inline opencascade::handle<StepDimTol_HArray1OfToleranceZoneTarget> DefiningTolerance ();

		/****************** DefiningToleranceValue ******************/
		%feature("compactdefaultargs") DefiningToleranceValue;
		%feature("autodoc", "* Returns Defining Tolerance with the given number
	:param theNum:
	:type theNum: int
	:rtype: inline StepDimTol_ToleranceZoneTarget") DefiningToleranceValue;
		inline StepDimTol_ToleranceZoneTarget DefiningToleranceValue (const Standard_Integer theNum);

		/****************** Form ******************/
		%feature("compactdefaultargs") Form;
		%feature("autodoc", "* Returns field Form
	:rtype: inline opencascade::handle<StepDimTol_ToleranceZoneForm>") Form;
		inline opencascade::handle<StepDimTol_ToleranceZoneForm> Form ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param theName:
	:type theName: TCollection_HAsciiString
	:param theDescription:
	:type theDescription: TCollection_HAsciiString
	:param theOfShape:
	:type theOfShape: StepRepr_ProductDefinitionShape
	:param theProductDefinitional:
	:type theProductDefinitional: StepData_Logical
	:param theDefiningTolerance:
	:type theDefiningTolerance: StepDimTol_HArray1OfToleranceZoneTarget
	:param theForm:
	:type theForm: StepDimTol_ToleranceZoneForm
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & theName,const opencascade::handle<TCollection_HAsciiString> & theDescription,const opencascade::handle<StepRepr_ProductDefinitionShape> & theOfShape,const StepData_Logical theProductDefinitional,const opencascade::handle<StepDimTol_HArray1OfToleranceZoneTarget> & theDefiningTolerance,const opencascade::handle<StepDimTol_ToleranceZoneForm> & theForm);

		/****************** NbDefiningTolerances ******************/
		%feature("compactdefaultargs") NbDefiningTolerances;
		%feature("autodoc", "* Returns number of Defining Tolerances
	:rtype: inline int") NbDefiningTolerances;
		inline Standard_Integer NbDefiningTolerances ();

		/****************** SetDefiningTolerance ******************/
		%feature("compactdefaultargs") SetDefiningTolerance;
		%feature("autodoc", "* Set field DefiningTolerance
	:param theDefiningTolerance:
	:type theDefiningTolerance: StepDimTol_HArray1OfToleranceZoneTarget
	:rtype: inline void") SetDefiningTolerance;
		inline void SetDefiningTolerance (const opencascade::handle<StepDimTol_HArray1OfToleranceZoneTarget> & theDefiningTolerance);

		/****************** SetDefiningToleranceValue ******************/
		%feature("compactdefaultargs") SetDefiningToleranceValue;
		%feature("autodoc", "* Sets Defining Tolerance with given number
	:param theNum:
	:type theNum: int
	:param theItem:
	:type theItem: StepDimTol_ToleranceZoneTarget
	:rtype: inline void") SetDefiningToleranceValue;
		inline void SetDefiningToleranceValue (const Standard_Integer theNum,const StepDimTol_ToleranceZoneTarget & theItem);

		/****************** SetForm ******************/
		%feature("compactdefaultargs") SetForm;
		%feature("autodoc", "* Set field Form
	:param theForm:
	:type theForm: StepDimTol_ToleranceZoneForm
	:rtype: inline void") SetForm;
		inline void SetForm (const opencascade::handle<StepDimTol_ToleranceZoneForm> & theForm);

		/****************** StepDimTol_ToleranceZone ******************/
		%feature("compactdefaultargs") StepDimTol_ToleranceZone;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepDimTol_ToleranceZone;
		 StepDimTol_ToleranceZone ();

};


%make_alias(StepDimTol_ToleranceZone)

%extend StepDimTol_ToleranceZone {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class StepDimTol_ToleranceZoneDefinition *
*******************************************/
class StepDimTol_ToleranceZoneDefinition : public Standard_Transient {
	public:
		/****************** Boundaries ******************/
		%feature("compactdefaultargs") Boundaries;
		%feature("autodoc", "* Returns field Boundaries
	:rtype: inline opencascade::handle<StepRepr_HArray1OfShapeAspect>") Boundaries;
		inline opencascade::handle<StepRepr_HArray1OfShapeAspect> Boundaries ();

		/****************** BoundariesValue ******************/
		%feature("compactdefaultargs") BoundariesValue;
		%feature("autodoc", "* Returns Boundaries with the given number
	:param theNum:
	:type theNum: int
	:rtype: inline opencascade::handle<StepRepr_ShapeAspect>") BoundariesValue;
		inline opencascade::handle<StepRepr_ShapeAspect> BoundariesValue (const Standard_Integer theNum);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param theZone:
	:type theZone: StepDimTol_ToleranceZone
	:param theBoundaries:
	:type theBoundaries: StepRepr_HArray1OfShapeAspect
	:rtype: None") Init;
		void Init (const opencascade::handle<StepDimTol_ToleranceZone> & theZone,const opencascade::handle<StepRepr_HArray1OfShapeAspect> & theBoundaries);

		/****************** NbBoundaries ******************/
		%feature("compactdefaultargs") NbBoundaries;
		%feature("autodoc", "* Returns number of Boundaries
	:rtype: inline int") NbBoundaries;
		inline Standard_Integer NbBoundaries ();

		/****************** SetBoundaries ******************/
		%feature("compactdefaultargs") SetBoundaries;
		%feature("autodoc", "* Set field Boundaries
	:param theBoundaries:
	:type theBoundaries: StepRepr_HArray1OfShapeAspect
	:rtype: inline void") SetBoundaries;
		inline void SetBoundaries (const opencascade::handle<StepRepr_HArray1OfShapeAspect> & theBoundaries);

		/****************** SetBoundariesValue ******************/
		%feature("compactdefaultargs") SetBoundariesValue;
		%feature("autodoc", "* Sets Boundaries with given number
	:param theNum:
	:type theNum: int
	:param theItem:
	:type theItem: StepRepr_ShapeAspect
	:rtype: inline void") SetBoundariesValue;
		inline void SetBoundariesValue (const Standard_Integer theNum,const opencascade::handle<StepRepr_ShapeAspect> & theItem);

		/****************** SetZone ******************/
		%feature("compactdefaultargs") SetZone;
		%feature("autodoc", "* Set field Zone
	:param theZone:
	:type theZone: StepDimTol_ToleranceZone
	:rtype: inline void") SetZone;
		inline void SetZone (const opencascade::handle<StepDimTol_ToleranceZone> & theZone);

		/****************** StepDimTol_ToleranceZoneDefinition ******************/
		%feature("compactdefaultargs") StepDimTol_ToleranceZoneDefinition;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepDimTol_ToleranceZoneDefinition;
		 StepDimTol_ToleranceZoneDefinition ();

		/****************** Zone ******************/
		%feature("compactdefaultargs") Zone;
		%feature("autodoc", "* Returns field Zone
	:rtype: inline opencascade::handle<StepDimTol_ToleranceZone>") Zone;
		inline opencascade::handle<StepDimTol_ToleranceZone> Zone ();

};


%make_alias(StepDimTol_ToleranceZoneDefinition)

%extend StepDimTol_ToleranceZoneDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class StepDimTol_ToleranceZoneForm *
*************************************/
class StepDimTol_ToleranceZoneForm : public Standard_Transient {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Init all field own and inherited
	:param theName:
	:type theName: TCollection_HAsciiString
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & theName);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "* Returns field Name
	:rtype: inline opencascade::handle<TCollection_HAsciiString>") Name;
		inline opencascade::handle<TCollection_HAsciiString> Name ();

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "* Set field Name
	:param theName:
	:type theName: TCollection_HAsciiString
	:rtype: inline void") SetName;
		inline void SetName (const opencascade::handle<TCollection_HAsciiString> & theName);

		/****************** StepDimTol_ToleranceZoneForm ******************/
		%feature("compactdefaultargs") StepDimTol_ToleranceZoneForm;
		%feature("autodoc", ":rtype: None") StepDimTol_ToleranceZoneForm;
		 StepDimTol_ToleranceZoneForm ();

};


%make_alias(StepDimTol_ToleranceZoneForm)

%extend StepDimTol_ToleranceZoneForm {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class StepDimTol_ToleranceZoneTarget *
***************************************/
class StepDimTol_ToleranceZoneTarget : public StepData_SelectType {
	public:
		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "* Recognizes a ToleranceZoneTarget Kind Entity that is : 1 -> DimensionalLocation 2 -> DimensionalSize 3 -> GeometricTolerance 4 -> GeneralDatumReference 0 else
	:param ent:
	:type ent: Standard_Transient
	:rtype: int") CaseNum;
		Standard_Integer CaseNum (const opencascade::handle<Standard_Transient> & ent);

		/****************** DimensionalLocation ******************/
		%feature("compactdefaultargs") DimensionalLocation;
		%feature("autodoc", "* returns Value as a DimensionalLocation (Null if another type)
	:rtype: opencascade::handle<StepShape_DimensionalLocation>") DimensionalLocation;
		opencascade::handle<StepShape_DimensionalLocation> DimensionalLocation ();

		/****************** DimensionalSize ******************/
		%feature("compactdefaultargs") DimensionalSize;
		%feature("autodoc", "* returns Value as a DimensionalSize (Null if another type)
	:rtype: opencascade::handle<StepShape_DimensionalSize>") DimensionalSize;
		opencascade::handle<StepShape_DimensionalSize> DimensionalSize ();

		/****************** GeneralDatumReference ******************/
		%feature("compactdefaultargs") GeneralDatumReference;
		%feature("autodoc", "* returns Value as a GeneralDatumReference (Null if another type)
	:rtype: opencascade::handle<StepDimTol_GeneralDatumReference>") GeneralDatumReference;
		opencascade::handle<StepDimTol_GeneralDatumReference> GeneralDatumReference ();

		/****************** GeometricTolerance ******************/
		%feature("compactdefaultargs") GeometricTolerance;
		%feature("autodoc", "* returns Value as a GeometricTolerance (Null if another type)
	:rtype: opencascade::handle<StepDimTol_GeometricTolerance>") GeometricTolerance;
		opencascade::handle<StepDimTol_GeometricTolerance> GeometricTolerance ();

		/****************** StepDimTol_ToleranceZoneTarget ******************/
		%feature("compactdefaultargs") StepDimTol_ToleranceZoneTarget;
		%feature("autodoc", "* Returns a ToleranceZoneTarget select type
	:rtype: None") StepDimTol_ToleranceZoneTarget;
		 StepDimTol_ToleranceZoneTarget ();

};


%extend StepDimTol_ToleranceZoneTarget {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class StepDimTol_CylindricityTolerance *
*****************************************/
class StepDimTol_CylindricityTolerance : public StepDimTol_GeometricTolerance {
	public:
		/****************** StepDimTol_CylindricityTolerance ******************/
		%feature("compactdefaultargs") StepDimTol_CylindricityTolerance;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepDimTol_CylindricityTolerance;
		 StepDimTol_CylindricityTolerance ();

};


%make_alias(StepDimTol_CylindricityTolerance)

%extend StepDimTol_CylindricityTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class StepDimTol_DatumReferenceCompartment *
*********************************************/
class StepDimTol_DatumReferenceCompartment : public StepDimTol_GeneralDatumReference {
	public:
		/****************** StepDimTol_DatumReferenceCompartment ******************/
		%feature("compactdefaultargs") StepDimTol_DatumReferenceCompartment;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepDimTol_DatumReferenceCompartment;
		 StepDimTol_DatumReferenceCompartment ();

};


%make_alias(StepDimTol_DatumReferenceCompartment)

%extend StepDimTol_DatumReferenceCompartment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class StepDimTol_DatumReferenceElement *
*****************************************/
class StepDimTol_DatumReferenceElement : public StepDimTol_GeneralDatumReference {
	public:
		/****************** StepDimTol_DatumReferenceElement ******************/
		%feature("compactdefaultargs") StepDimTol_DatumReferenceElement;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepDimTol_DatumReferenceElement;
		 StepDimTol_DatumReferenceElement ();

};


%make_alias(StepDimTol_DatumReferenceElement)

%extend StepDimTol_DatumReferenceElement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class StepDimTol_FlatnessTolerance *
*************************************/
class StepDimTol_FlatnessTolerance : public StepDimTol_GeometricTolerance {
	public:
		/****************** StepDimTol_FlatnessTolerance ******************/
		%feature("compactdefaultargs") StepDimTol_FlatnessTolerance;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepDimTol_FlatnessTolerance;
		 StepDimTol_FlatnessTolerance ();

};


%make_alias(StepDimTol_FlatnessTolerance)

%extend StepDimTol_FlatnessTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class StepDimTol_GeoTolAndGeoTolWthDatRef *
********************************************/
class StepDimTol_GeoTolAndGeoTolWthDatRef : public StepDimTol_GeometricTolerance {
	public:
		/****************** GetGeometricToleranceWithDatumReference ******************/
		%feature("compactdefaultargs") GetGeometricToleranceWithDatumReference;
		%feature("autodoc", ":rtype: inline opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference>") GetGeometricToleranceWithDatumReference;
		inline opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> GetGeometricToleranceWithDatumReference ();

		/****************** GetToleranceType ******************/
		%feature("compactdefaultargs") GetToleranceType;
		%feature("autodoc", ":rtype: StepDimTol_GeometricToleranceType") GetToleranceType;
		StepDimTol_GeometricToleranceType GetToleranceType ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param theName:
	:type theName: TCollection_HAsciiString
	:param theDescription:
	:type theDescription: TCollection_HAsciiString
	:param theMagnitude:
	:type theMagnitude: StepBasic_MeasureWithUnit
	:param theTolerancedShapeAspect:
	:type theTolerancedShapeAspect: StepRepr_ShapeAspect
	:param theGTWDR:
	:type theGTWDR: StepDimTol_GeometricToleranceWithDatumReference
	:param theType:
	:type theType: StepDimTol_GeometricToleranceType
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & theName,const opencascade::handle<TCollection_HAsciiString> & theDescription,const opencascade::handle<StepBasic_MeasureWithUnit> & theMagnitude,const opencascade::handle<StepRepr_ShapeAspect> & theTolerancedShapeAspect,const opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> & theGTWDR,const StepDimTol_GeometricToleranceType theType);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aDescription:
	:type aDescription: TCollection_HAsciiString
	:param aMagnitude:
	:type aMagnitude: StepBasic_MeasureWithUnit
	:param aTolerancedShapeAspect:
	:type aTolerancedShapeAspect: StepDimTol_GeometricToleranceTarget
	:param aGTWDR:
	:type aGTWDR: StepDimTol_GeometricToleranceWithDatumReference
	:param theType:
	:type theType: StepDimTol_GeometricToleranceType
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<TCollection_HAsciiString> & aDescription,const opencascade::handle<StepBasic_MeasureWithUnit> & aMagnitude,const StepDimTol_GeometricToleranceTarget & aTolerancedShapeAspect,const opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> & aGTWDR,const StepDimTol_GeometricToleranceType theType);

		/****************** SetGeometricToleranceType ******************/
		%feature("compactdefaultargs") SetGeometricToleranceType;
		%feature("autodoc", ":param theType:
	:type theType: StepDimTol_GeometricToleranceType
	:rtype: inline void") SetGeometricToleranceType;
		inline void SetGeometricToleranceType (const StepDimTol_GeometricToleranceType theType);

		/****************** SetGeometricToleranceWithDatumReference ******************/
		%feature("compactdefaultargs") SetGeometricToleranceWithDatumReference;
		%feature("autodoc", ":param theGTWDR:
	:type theGTWDR: StepDimTol_GeometricToleranceWithDatumReference
	:rtype: inline void") SetGeometricToleranceWithDatumReference;
		inline void SetGeometricToleranceWithDatumReference (const opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> & theGTWDR);

		/****************** StepDimTol_GeoTolAndGeoTolWthDatRef ******************/
		%feature("compactdefaultargs") StepDimTol_GeoTolAndGeoTolWthDatRef;
		%feature("autodoc", ":rtype: None") StepDimTol_GeoTolAndGeoTolWthDatRef;
		 StepDimTol_GeoTolAndGeoTolWthDatRef ();

};


%make_alias(StepDimTol_GeoTolAndGeoTolWthDatRef)

%extend StepDimTol_GeoTolAndGeoTolWthDatRef {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************************
* class StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMod *
***********************************************************/
class StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMod : public StepDimTol_GeometricTolerance {
	public:
		/****************** GetGeometricToleranceWithDatumReference ******************/
		%feature("compactdefaultargs") GetGeometricToleranceWithDatumReference;
		%feature("autodoc", ":rtype: inline opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference>") GetGeometricToleranceWithDatumReference;
		inline opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> GetGeometricToleranceWithDatumReference ();

		/****************** GetGeometricToleranceWithModifiers ******************/
		%feature("compactdefaultargs") GetGeometricToleranceWithModifiers;
		%feature("autodoc", ":rtype: inline opencascade::handle<StepDimTol_GeometricToleranceWithModifiers>") GetGeometricToleranceWithModifiers;
		inline opencascade::handle<StepDimTol_GeometricToleranceWithModifiers> GetGeometricToleranceWithModifiers ();

		/****************** GetToleranceType ******************/
		%feature("compactdefaultargs") GetToleranceType;
		%feature("autodoc", ":rtype: StepDimTol_GeometricToleranceType") GetToleranceType;
		StepDimTol_GeometricToleranceType GetToleranceType ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param theName:
	:type theName: TCollection_HAsciiString
	:param theDescription:
	:type theDescription: TCollection_HAsciiString
	:param theMagnitude:
	:type theMagnitude: StepBasic_MeasureWithUnit
	:param theTolerancedShapeAspect:
	:type theTolerancedShapeAspect: StepRepr_ShapeAspect
	:param theGTWDR:
	:type theGTWDR: StepDimTol_GeometricToleranceWithDatumReference
	:param theGTWM:
	:type theGTWM: StepDimTol_GeometricToleranceWithModifiers
	:param theType:
	:type theType: StepDimTol_GeometricToleranceType
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & theName,const opencascade::handle<TCollection_HAsciiString> & theDescription,const opencascade::handle<StepBasic_MeasureWithUnit> & theMagnitude,const opencascade::handle<StepRepr_ShapeAspect> & theTolerancedShapeAspect,const opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> & theGTWDR,const opencascade::handle<StepDimTol_GeometricToleranceWithModifiers> & theGTWM,const StepDimTol_GeometricToleranceType theType);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aDescription:
	:type aDescription: TCollection_HAsciiString
	:param aMagnitude:
	:type aMagnitude: StepBasic_MeasureWithUnit
	:param aTolerancedShapeAspect:
	:type aTolerancedShapeAspect: StepDimTol_GeometricToleranceTarget
	:param aGTWDR:
	:type aGTWDR: StepDimTol_GeometricToleranceWithDatumReference
	:param aGTWM:
	:type aGTWM: StepDimTol_GeometricToleranceWithModifiers
	:param theType:
	:type theType: StepDimTol_GeometricToleranceType
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<TCollection_HAsciiString> & aDescription,const opencascade::handle<StepBasic_MeasureWithUnit> & aMagnitude,const StepDimTol_GeometricToleranceTarget & aTolerancedShapeAspect,const opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> & aGTWDR,const opencascade::handle<StepDimTol_GeometricToleranceWithModifiers> & aGTWM,const StepDimTol_GeometricToleranceType theType);

		/****************** SetGeometricToleranceType ******************/
		%feature("compactdefaultargs") SetGeometricToleranceType;
		%feature("autodoc", ":param theType:
	:type theType: StepDimTol_GeometricToleranceType
	:rtype: inline void") SetGeometricToleranceType;
		inline void SetGeometricToleranceType (const StepDimTol_GeometricToleranceType theType);

		/****************** SetGeometricToleranceWithDatumReference ******************/
		%feature("compactdefaultargs") SetGeometricToleranceWithDatumReference;
		%feature("autodoc", ":param theGTWDR:
	:type theGTWDR: StepDimTol_GeometricToleranceWithDatumReference
	:rtype: inline void") SetGeometricToleranceWithDatumReference;
		inline void SetGeometricToleranceWithDatumReference (const opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> & theGTWDR);

		/****************** SetGeometricToleranceWithModifiers ******************/
		%feature("compactdefaultargs") SetGeometricToleranceWithModifiers;
		%feature("autodoc", ":param theGTWM:
	:type theGTWM: StepDimTol_GeometricToleranceWithModifiers
	:rtype: inline void") SetGeometricToleranceWithModifiers;
		inline void SetGeometricToleranceWithModifiers (const opencascade::handle<StepDimTol_GeometricToleranceWithModifiers> & theGTWM);

		/****************** StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMod ******************/
		%feature("compactdefaultargs") StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMod;
		%feature("autodoc", ":rtype: None") StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMod;
		 StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMod ();

};


%make_alias(StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMod)

%extend StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMod {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************************************
* class StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol *
*****************************************************************/
class StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol : public StepDimTol_GeometricTolerance {
	public:
		/****************** GetGeometricToleranceWithDatumReference ******************/
		%feature("compactdefaultargs") GetGeometricToleranceWithDatumReference;
		%feature("autodoc", ":rtype: opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference>") GetGeometricToleranceWithDatumReference;
		opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> GetGeometricToleranceWithDatumReference ();

		/****************** GetModifiedGeometricTolerance ******************/
		%feature("compactdefaultargs") GetModifiedGeometricTolerance;
		%feature("autodoc", ":rtype: opencascade::handle<StepDimTol_ModifiedGeometricTolerance>") GetModifiedGeometricTolerance;
		opencascade::handle<StepDimTol_ModifiedGeometricTolerance> GetModifiedGeometricTolerance ();

		/****************** GetPositionTolerance ******************/
		%feature("compactdefaultargs") GetPositionTolerance;
		%feature("autodoc", ":rtype: opencascade::handle<StepDimTol_PositionTolerance>") GetPositionTolerance;
		opencascade::handle<StepDimTol_PositionTolerance> GetPositionTolerance ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aDescription:
	:type aDescription: TCollection_HAsciiString
	:param aMagnitude:
	:type aMagnitude: StepBasic_MeasureWithUnit
	:param aTolerancedShapeAspect:
	:type aTolerancedShapeAspect: StepRepr_ShapeAspect
	:param aGTWDR:
	:type aGTWDR: StepDimTol_GeometricToleranceWithDatumReference
	:param aMGT:
	:type aMGT: StepDimTol_ModifiedGeometricTolerance
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<TCollection_HAsciiString> & aDescription,const opencascade::handle<StepBasic_MeasureWithUnit> & aMagnitude,const opencascade::handle<StepRepr_ShapeAspect> & aTolerancedShapeAspect,const opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> & aGTWDR,const opencascade::handle<StepDimTol_ModifiedGeometricTolerance> & aMGT);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aDescription:
	:type aDescription: TCollection_HAsciiString
	:param aMagnitude:
	:type aMagnitude: StepBasic_MeasureWithUnit
	:param aTolerancedShapeAspect:
	:type aTolerancedShapeAspect: StepDimTol_GeometricToleranceTarget
	:param aGTWDR:
	:type aGTWDR: StepDimTol_GeometricToleranceWithDatumReference
	:param aMGT:
	:type aMGT: StepDimTol_ModifiedGeometricTolerance
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<TCollection_HAsciiString> & aDescription,const opencascade::handle<StepBasic_MeasureWithUnit> & aMagnitude,const StepDimTol_GeometricToleranceTarget & aTolerancedShapeAspect,const opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> & aGTWDR,const opencascade::handle<StepDimTol_ModifiedGeometricTolerance> & aMGT);

		/****************** SetGeometricToleranceWithDatumReference ******************/
		%feature("compactdefaultargs") SetGeometricToleranceWithDatumReference;
		%feature("autodoc", ":param aGTWDR:
	:type aGTWDR: StepDimTol_GeometricToleranceWithDatumReference
	:rtype: None") SetGeometricToleranceWithDatumReference;
		void SetGeometricToleranceWithDatumReference (const opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> & aGTWDR);

		/****************** SetModifiedGeometricTolerance ******************/
		%feature("compactdefaultargs") SetModifiedGeometricTolerance;
		%feature("autodoc", ":param aMGT:
	:type aMGT: StepDimTol_ModifiedGeometricTolerance
	:rtype: None") SetModifiedGeometricTolerance;
		void SetModifiedGeometricTolerance (const opencascade::handle<StepDimTol_ModifiedGeometricTolerance> & aMGT);

		/****************** SetPositionTolerance ******************/
		%feature("compactdefaultargs") SetPositionTolerance;
		%feature("autodoc", ":param aPT:
	:type aPT: StepDimTol_PositionTolerance
	:rtype: None") SetPositionTolerance;
		void SetPositionTolerance (const opencascade::handle<StepDimTol_PositionTolerance> & aPT);

		/****************** StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol ******************/
		%feature("compactdefaultargs") StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol;
		%feature("autodoc", ":rtype: None") StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol;
		 StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol ();

};


%make_alias(StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol)

%extend StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class StepDimTol_GeoTolAndGeoTolWthMod *
*****************************************/
class StepDimTol_GeoTolAndGeoTolWthMod : public StepDimTol_GeometricTolerance {
	public:
		/****************** GetGeometricToleranceWithModifiers ******************/
		%feature("compactdefaultargs") GetGeometricToleranceWithModifiers;
		%feature("autodoc", ":rtype: inline opencascade::handle<StepDimTol_GeometricToleranceWithModifiers>") GetGeometricToleranceWithModifiers;
		inline opencascade::handle<StepDimTol_GeometricToleranceWithModifiers> GetGeometricToleranceWithModifiers ();

		/****************** GetToleranceType ******************/
		%feature("compactdefaultargs") GetToleranceType;
		%feature("autodoc", ":rtype: StepDimTol_GeometricToleranceType") GetToleranceType;
		StepDimTol_GeometricToleranceType GetToleranceType ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param theName:
	:type theName: TCollection_HAsciiString
	:param theDescription:
	:type theDescription: TCollection_HAsciiString
	:param theMagnitude:
	:type theMagnitude: StepBasic_MeasureWithUnit
	:param theTolerancedShapeAspect:
	:type theTolerancedShapeAspect: StepRepr_ShapeAspect
	:param theGTWM:
	:type theGTWM: StepDimTol_GeometricToleranceWithModifiers
	:param theType:
	:type theType: StepDimTol_GeometricToleranceType
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & theName,const opencascade::handle<TCollection_HAsciiString> & theDescription,const opencascade::handle<StepBasic_MeasureWithUnit> & theMagnitude,const opencascade::handle<StepRepr_ShapeAspect> & theTolerancedShapeAspect,const opencascade::handle<StepDimTol_GeometricToleranceWithModifiers> & theGTWM,const StepDimTol_GeometricToleranceType theType);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aDescription:
	:type aDescription: TCollection_HAsciiString
	:param aMagnitude:
	:type aMagnitude: StepBasic_MeasureWithUnit
	:param aTolerancedShapeAspect:
	:type aTolerancedShapeAspect: StepDimTol_GeometricToleranceTarget
	:param aGTWM:
	:type aGTWM: StepDimTol_GeometricToleranceWithModifiers
	:param theType:
	:type theType: StepDimTol_GeometricToleranceType
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<TCollection_HAsciiString> & aDescription,const opencascade::handle<StepBasic_MeasureWithUnit> & aMagnitude,const StepDimTol_GeometricToleranceTarget & aTolerancedShapeAspect,const opencascade::handle<StepDimTol_GeometricToleranceWithModifiers> & aGTWM,const StepDimTol_GeometricToleranceType theType);

		/****************** SetGeometricToleranceType ******************/
		%feature("compactdefaultargs") SetGeometricToleranceType;
		%feature("autodoc", ":param theType:
	:type theType: StepDimTol_GeometricToleranceType
	:rtype: inline void") SetGeometricToleranceType;
		inline void SetGeometricToleranceType (const StepDimTol_GeometricToleranceType theType);

		/****************** SetGeometricToleranceWithModifiers ******************/
		%feature("compactdefaultargs") SetGeometricToleranceWithModifiers;
		%feature("autodoc", ":param theGTWM:
	:type theGTWM: StepDimTol_GeometricToleranceWithModifiers
	:rtype: inline void") SetGeometricToleranceWithModifiers;
		inline void SetGeometricToleranceWithModifiers (const opencascade::handle<StepDimTol_GeometricToleranceWithModifiers> & theGTWM);

		/****************** StepDimTol_GeoTolAndGeoTolWthMod ******************/
		%feature("compactdefaultargs") StepDimTol_GeoTolAndGeoTolWthMod;
		%feature("autodoc", ":rtype: None") StepDimTol_GeoTolAndGeoTolWthMod;
		 StepDimTol_GeoTolAndGeoTolWthMod ();

};


%make_alias(StepDimTol_GeoTolAndGeoTolWthMod)

%extend StepDimTol_GeoTolAndGeoTolWthMod {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************************
* class StepDimTol_GeometricToleranceWithDatumReference *
********************************************************/
class StepDimTol_GeometricToleranceWithDatumReference : public StepDimTol_GeometricTolerance {
	public:
		/****************** DatumSystem ******************/
		%feature("compactdefaultargs") DatumSystem;
		%feature("autodoc", "* Returns field DatumSystem AP214
	:rtype: opencascade::handle<StepDimTol_HArray1OfDatumReference>") DatumSystem;
		opencascade::handle<StepDimTol_HArray1OfDatumReference> DatumSystem ();

		/****************** DatumSystemAP242 ******************/
		%feature("compactdefaultargs") DatumSystemAP242;
		%feature("autodoc", "* Returns field DatumSystem AP242
	:rtype: opencascade::handle<StepDimTol_HArray1OfDatumSystemOrReference>") DatumSystemAP242;
		opencascade::handle<StepDimTol_HArray1OfDatumSystemOrReference> DatumSystemAP242 ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited) AP214
	:param theGeometricTolerance_Name:
	:type theGeometricTolerance_Name: TCollection_HAsciiString
	:param theGeometricTolerance_Description:
	:type theGeometricTolerance_Description: TCollection_HAsciiString
	:param theGeometricTolerance_Magnitude:
	:type theGeometricTolerance_Magnitude: StepBasic_MeasureWithUnit
	:param theGeometricTolerance_TolerancedShapeAspect:
	:type theGeometricTolerance_TolerancedShapeAspect: StepRepr_ShapeAspect
	:param theDatumSystem:
	:type theDatumSystem: StepDimTol_HArray1OfDatumReference
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & theGeometricTolerance_Name,const opencascade::handle<TCollection_HAsciiString> & theGeometricTolerance_Description,const opencascade::handle<StepBasic_MeasureWithUnit> & theGeometricTolerance_Magnitude,const opencascade::handle<StepRepr_ShapeAspect> & theGeometricTolerance_TolerancedShapeAspect,const opencascade::handle<StepDimTol_HArray1OfDatumReference> & theDatumSystem);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited) AP242
	:param theGeometricTolerance_Name:
	:type theGeometricTolerance_Name: TCollection_HAsciiString
	:param theGeometricTolerance_Description:
	:type theGeometricTolerance_Description: TCollection_HAsciiString
	:param theGeometricTolerance_Magnitude:
	:type theGeometricTolerance_Magnitude: StepBasic_MeasureWithUnit
	:param theGeometricTolerance_TolerancedShapeAspect:
	:type theGeometricTolerance_TolerancedShapeAspect: StepDimTol_GeometricToleranceTarget
	:param theDatumSystem:
	:type theDatumSystem: StepDimTol_HArray1OfDatumSystemOrReference
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & theGeometricTolerance_Name,const opencascade::handle<TCollection_HAsciiString> & theGeometricTolerance_Description,const opencascade::handle<StepBasic_MeasureWithUnit> & theGeometricTolerance_Magnitude,const StepDimTol_GeometricToleranceTarget & theGeometricTolerance_TolerancedShapeAspect,const opencascade::handle<StepDimTol_HArray1OfDatumSystemOrReference> & theDatumSystem);

		/****************** SetDatumSystem ******************/
		%feature("compactdefaultargs") SetDatumSystem;
		%feature("autodoc", "* Set field DatumSystem AP214
	:param theDatumSystem:
	:type theDatumSystem: StepDimTol_HArray1OfDatumReference
	:rtype: None") SetDatumSystem;
		void SetDatumSystem (const opencascade::handle<StepDimTol_HArray1OfDatumReference> & theDatumSystem);

		/****************** SetDatumSystem ******************/
		%feature("compactdefaultargs") SetDatumSystem;
		%feature("autodoc", "* Set field DatumSystem AP242
	:param theDatumSystem:
	:type theDatumSystem: StepDimTol_HArray1OfDatumSystemOrReference
	:rtype: None") SetDatumSystem;
		void SetDatumSystem (const opencascade::handle<StepDimTol_HArray1OfDatumSystemOrReference> & theDatumSystem);

		/****************** StepDimTol_GeometricToleranceWithDatumReference ******************/
		%feature("compactdefaultargs") StepDimTol_GeometricToleranceWithDatumReference;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepDimTol_GeometricToleranceWithDatumReference;
		 StepDimTol_GeometricToleranceWithDatumReference ();

};


%make_alias(StepDimTol_GeometricToleranceWithDatumReference)

%extend StepDimTol_GeometricToleranceWithDatumReference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************************
* class StepDimTol_GeometricToleranceWithDefinedUnit *
*****************************************************/
class StepDimTol_GeometricToleranceWithDefinedUnit : public StepDimTol_GeometricTolerance {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited) AP214
	:param theName:
	:type theName: TCollection_HAsciiString
	:param theDescription:
	:type theDescription: TCollection_HAsciiString
	:param theMagnitude:
	:type theMagnitude: StepBasic_MeasureWithUnit
	:param theTolerancedShapeAspect:
	:type theTolerancedShapeAspect: StepRepr_ShapeAspect
	:param theUnitSize:
	:type theUnitSize: StepBasic_LengthMeasureWithUnit
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & theName,const opencascade::handle<TCollection_HAsciiString> & theDescription,const opencascade::handle<StepBasic_MeasureWithUnit> & theMagnitude,const opencascade::handle<StepRepr_ShapeAspect> & theTolerancedShapeAspect,const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theUnitSize);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited) AP242
	:param theName:
	:type theName: TCollection_HAsciiString
	:param theDescription:
	:type theDescription: TCollection_HAsciiString
	:param theMagnitude:
	:type theMagnitude: StepBasic_MeasureWithUnit
	:param theTolerancedShapeAspect:
	:type theTolerancedShapeAspect: StepDimTol_GeometricToleranceTarget
	:param theUnitSize:
	:type theUnitSize: StepBasic_LengthMeasureWithUnit
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & theName,const opencascade::handle<TCollection_HAsciiString> & theDescription,const opencascade::handle<StepBasic_MeasureWithUnit> & theMagnitude,const StepDimTol_GeometricToleranceTarget & theTolerancedShapeAspect,const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theUnitSize);

		/****************** SetUnitSize ******************/
		%feature("compactdefaultargs") SetUnitSize;
		%feature("autodoc", "* Set field UnitSize
	:param theUnitSize:
	:type theUnitSize: StepBasic_LengthMeasureWithUnit
	:rtype: inline void") SetUnitSize;
		inline void SetUnitSize (const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theUnitSize);

		/****************** StepDimTol_GeometricToleranceWithDefinedUnit ******************/
		%feature("compactdefaultargs") StepDimTol_GeometricToleranceWithDefinedUnit;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepDimTol_GeometricToleranceWithDefinedUnit;
		 StepDimTol_GeometricToleranceWithDefinedUnit ();

		/****************** UnitSize ******************/
		%feature("compactdefaultargs") UnitSize;
		%feature("autodoc", "* Returns field UnitSize
	:rtype: inline opencascade::handle<StepBasic_LengthMeasureWithUnit>") UnitSize;
		inline opencascade::handle<StepBasic_LengthMeasureWithUnit> UnitSize ();

};


%make_alias(StepDimTol_GeometricToleranceWithDefinedUnit)

%extend StepDimTol_GeometricToleranceWithDefinedUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class StepDimTol_GeometricToleranceWithModifiers *
***************************************************/
class StepDimTol_GeometricToleranceWithModifiers : public StepDimTol_GeometricTolerance {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param theName:
	:type theName: TCollection_HAsciiString
	:param theDescription:
	:type theDescription: TCollection_HAsciiString
	:param theMagnitude:
	:type theMagnitude: StepBasic_MeasureWithUnit
	:param theTolerancedShapeAspect:
	:type theTolerancedShapeAspect: StepDimTol_GeometricToleranceTarget
	:param theModifiers:
	:type theModifiers: StepDimTol_HArray1OfGeometricToleranceModifier
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & theName,const opencascade::handle<TCollection_HAsciiString> & theDescription,const opencascade::handle<StepBasic_MeasureWithUnit> & theMagnitude,const StepDimTol_GeometricToleranceTarget & theTolerancedShapeAspect,const opencascade::handle<StepDimTol_HArray1OfGeometricToleranceModifier> & theModifiers);

		/****************** ModifierValue ******************/
		%feature("compactdefaultargs") ModifierValue;
		%feature("autodoc", "* Returns modifier with the given number
	:param theNum:
	:type theNum: int
	:rtype: inline StepDimTol_GeometricToleranceModifier") ModifierValue;
		inline StepDimTol_GeometricToleranceModifier ModifierValue (const Standard_Integer theNum);

		/****************** Modifiers ******************/
		%feature("compactdefaultargs") Modifiers;
		%feature("autodoc", "* Returns field Modifiers
	:rtype: inline opencascade::handle<StepDimTol_HArray1OfGeometricToleranceModifier>") Modifiers;
		inline opencascade::handle<StepDimTol_HArray1OfGeometricToleranceModifier> Modifiers ();

		/****************** NbModifiers ******************/
		%feature("compactdefaultargs") NbModifiers;
		%feature("autodoc", "* Returns number of modifiers
	:rtype: inline int") NbModifiers;
		inline Standard_Integer NbModifiers ();

		/****************** SetModifierValue ******************/
		%feature("compactdefaultargs") SetModifierValue;
		%feature("autodoc", "* Sets modifier with given number
	:param theNum:
	:type theNum: int
	:param theItem:
	:type theItem: StepDimTol_GeometricToleranceModifier
	:rtype: inline void") SetModifierValue;
		inline void SetModifierValue (const Standard_Integer theNum,const StepDimTol_GeometricToleranceModifier theItem);

		/****************** SetModifiers ******************/
		%feature("compactdefaultargs") SetModifiers;
		%feature("autodoc", "* Set field Modifiers
	:param theModifiers:
	:type theModifiers: StepDimTol_HArray1OfGeometricToleranceModifier
	:rtype: inline void") SetModifiers;
		inline void SetModifiers (const opencascade::handle<StepDimTol_HArray1OfGeometricToleranceModifier> & theModifiers);

		/****************** StepDimTol_GeometricToleranceWithModifiers ******************/
		%feature("compactdefaultargs") StepDimTol_GeometricToleranceWithModifiers;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepDimTol_GeometricToleranceWithModifiers;
		 StepDimTol_GeometricToleranceWithModifiers ();

};


%make_alias(StepDimTol_GeometricToleranceWithModifiers)

%extend StepDimTol_GeometricToleranceWithModifiers {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class StepDimTol_LineProfileTolerance *
****************************************/
class StepDimTol_LineProfileTolerance : public StepDimTol_GeometricTolerance {
	public:
		/****************** StepDimTol_LineProfileTolerance ******************/
		%feature("compactdefaultargs") StepDimTol_LineProfileTolerance;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepDimTol_LineProfileTolerance;
		 StepDimTol_LineProfileTolerance ();

};


%make_alias(StepDimTol_LineProfileTolerance)

%extend StepDimTol_LineProfileTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class StepDimTol_ModifiedGeometricTolerance *
**********************************************/
class StepDimTol_ModifiedGeometricTolerance : public StepDimTol_GeometricTolerance {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited) AP214
	:param theGeometricTolerance_Name:
	:type theGeometricTolerance_Name: TCollection_HAsciiString
	:param theGeometricTolerance_Description:
	:type theGeometricTolerance_Description: TCollection_HAsciiString
	:param theGeometricTolerance_Magnitude:
	:type theGeometricTolerance_Magnitude: StepBasic_MeasureWithUnit
	:param theGeometricTolerance_TolerancedShapeAspect:
	:type theGeometricTolerance_TolerancedShapeAspect: StepRepr_ShapeAspect
	:param theModifier:
	:type theModifier: StepDimTol_LimitCondition
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & theGeometricTolerance_Name,const opencascade::handle<TCollection_HAsciiString> & theGeometricTolerance_Description,const opencascade::handle<StepBasic_MeasureWithUnit> & theGeometricTolerance_Magnitude,const opencascade::handle<StepRepr_ShapeAspect> & theGeometricTolerance_TolerancedShapeAspect,const StepDimTol_LimitCondition theModifier);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited) AP242
	:param theGeometricTolerance_Name:
	:type theGeometricTolerance_Name: TCollection_HAsciiString
	:param theGeometricTolerance_Description:
	:type theGeometricTolerance_Description: TCollection_HAsciiString
	:param theGeometricTolerance_Magnitude:
	:type theGeometricTolerance_Magnitude: StepBasic_MeasureWithUnit
	:param theGeometricTolerance_TolerancedShapeAspect:
	:type theGeometricTolerance_TolerancedShapeAspect: StepDimTol_GeometricToleranceTarget
	:param theModifier:
	:type theModifier: StepDimTol_LimitCondition
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & theGeometricTolerance_Name,const opencascade::handle<TCollection_HAsciiString> & theGeometricTolerance_Description,const opencascade::handle<StepBasic_MeasureWithUnit> & theGeometricTolerance_Magnitude,const StepDimTol_GeometricToleranceTarget & theGeometricTolerance_TolerancedShapeAspect,const StepDimTol_LimitCondition theModifier);

		/****************** Modifier ******************/
		%feature("compactdefaultargs") Modifier;
		%feature("autodoc", "* Returns field Modifier
	:rtype: StepDimTol_LimitCondition") Modifier;
		StepDimTol_LimitCondition Modifier ();

		/****************** SetModifier ******************/
		%feature("compactdefaultargs") SetModifier;
		%feature("autodoc", "* Set field Modifier
	:param theModifier:
	:type theModifier: StepDimTol_LimitCondition
	:rtype: None") SetModifier;
		void SetModifier (const StepDimTol_LimitCondition theModifier);

		/****************** StepDimTol_ModifiedGeometricTolerance ******************/
		%feature("compactdefaultargs") StepDimTol_ModifiedGeometricTolerance;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepDimTol_ModifiedGeometricTolerance;
		 StepDimTol_ModifiedGeometricTolerance ();

};


%make_alias(StepDimTol_ModifiedGeometricTolerance)

%extend StepDimTol_ModifiedGeometricTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class StepDimTol_NonUniformZoneDefinition *
********************************************/
class StepDimTol_NonUniformZoneDefinition : public StepDimTol_ToleranceZoneDefinition {
	public:
		/****************** StepDimTol_NonUniformZoneDefinition ******************/
		%feature("compactdefaultargs") StepDimTol_NonUniformZoneDefinition;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepDimTol_NonUniformZoneDefinition;
		 StepDimTol_NonUniformZoneDefinition ();

};


%make_alias(StepDimTol_NonUniformZoneDefinition)

%extend StepDimTol_NonUniformZoneDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class StepDimTol_PlacedDatumTargetFeature *
********************************************/
class StepDimTol_PlacedDatumTargetFeature : public StepDimTol_DatumTarget {
	public:
		/****************** StepDimTol_PlacedDatumTargetFeature ******************/
		%feature("compactdefaultargs") StepDimTol_PlacedDatumTargetFeature;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepDimTol_PlacedDatumTargetFeature;
		 StepDimTol_PlacedDatumTargetFeature ();

};


%make_alias(StepDimTol_PlacedDatumTargetFeature)

%extend StepDimTol_PlacedDatumTargetFeature {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class StepDimTol_PositionTolerance *
*************************************/
class StepDimTol_PositionTolerance : public StepDimTol_GeometricTolerance {
	public:
		/****************** StepDimTol_PositionTolerance ******************/
		%feature("compactdefaultargs") StepDimTol_PositionTolerance;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepDimTol_PositionTolerance;
		 StepDimTol_PositionTolerance ();

};


%make_alias(StepDimTol_PositionTolerance)

%extend StepDimTol_PositionTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class StepDimTol_ProjectedZoneDefinition *
*******************************************/
class StepDimTol_ProjectedZoneDefinition : public StepDimTol_ToleranceZoneDefinition {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param theZone:
	:type theZone: StepDimTol_ToleranceZone
	:param theBoundaries:
	:type theBoundaries: StepRepr_HArray1OfShapeAspect
	:param theProjectionEnd:
	:type theProjectionEnd: StepRepr_ShapeAspect
	:param theProjectionLength:
	:type theProjectionLength: StepBasic_LengthMeasureWithUnit
	:rtype: None") Init;
		void Init (const opencascade::handle<StepDimTol_ToleranceZone> & theZone,const opencascade::handle<StepRepr_HArray1OfShapeAspect> & theBoundaries,const opencascade::handle<StepRepr_ShapeAspect> & theProjectionEnd,const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theProjectionLength);

		/****************** ProjectionEnd ******************/
		%feature("compactdefaultargs") ProjectionEnd;
		%feature("autodoc", "* Returns field ProjectionEnd
	:rtype: inline opencascade::handle<StepRepr_ShapeAspect>") ProjectionEnd;
		inline opencascade::handle<StepRepr_ShapeAspect> ProjectionEnd ();

		/****************** ProjectionLength ******************/
		%feature("compactdefaultargs") ProjectionLength;
		%feature("autodoc", "* Returns field ProjectionLength
	:rtype: inline opencascade::handle<StepBasic_LengthMeasureWithUnit>") ProjectionLength;
		inline opencascade::handle<StepBasic_LengthMeasureWithUnit> ProjectionLength ();

		/****************** SetProjectionEnd ******************/
		%feature("compactdefaultargs") SetProjectionEnd;
		%feature("autodoc", "* Set field ProjectionEnd
	:param theProjectionEnd:
	:type theProjectionEnd: StepRepr_ShapeAspect
	:rtype: inline void") SetProjectionEnd;
		inline void SetProjectionEnd (const opencascade::handle<StepRepr_ShapeAspect> & theProjectionEnd);

		/****************** SetProjectionLength ******************/
		%feature("compactdefaultargs") SetProjectionLength;
		%feature("autodoc", "* Set field ProjectionLength
	:param theProjectionLength:
	:type theProjectionLength: StepBasic_LengthMeasureWithUnit
	:rtype: inline void") SetProjectionLength;
		inline void SetProjectionLength (const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theProjectionLength);

		/****************** StepDimTol_ProjectedZoneDefinition ******************/
		%feature("compactdefaultargs") StepDimTol_ProjectedZoneDefinition;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepDimTol_ProjectedZoneDefinition;
		 StepDimTol_ProjectedZoneDefinition ();

};


%make_alias(StepDimTol_ProjectedZoneDefinition)

%extend StepDimTol_ProjectedZoneDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class StepDimTol_RoundnessTolerance *
**************************************/
class StepDimTol_RoundnessTolerance : public StepDimTol_GeometricTolerance {
	public:
		/****************** StepDimTol_RoundnessTolerance ******************/
		%feature("compactdefaultargs") StepDimTol_RoundnessTolerance;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepDimTol_RoundnessTolerance;
		 StepDimTol_RoundnessTolerance ();

};


%make_alias(StepDimTol_RoundnessTolerance)

%extend StepDimTol_RoundnessTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class StepDimTol_RunoutZoneDefinition *
****************************************/
class StepDimTol_RunoutZoneDefinition : public StepDimTol_ToleranceZoneDefinition {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param theZone:
	:type theZone: StepDimTol_ToleranceZone
	:param theBoundaries:
	:type theBoundaries: StepRepr_HArray1OfShapeAspect
	:param theOrientation:
	:type theOrientation: StepDimTol_RunoutZoneOrientation
	:rtype: None") Init;
		void Init (const opencascade::handle<StepDimTol_ToleranceZone> & theZone,const opencascade::handle<StepRepr_HArray1OfShapeAspect> & theBoundaries,const opencascade::handle<StepDimTol_RunoutZoneOrientation> & theOrientation);

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "* Returns field Orientation
	:rtype: inline opencascade::handle<StepDimTol_RunoutZoneOrientation>") Orientation;
		inline opencascade::handle<StepDimTol_RunoutZoneOrientation> Orientation ();

		/****************** SetOrientation ******************/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "* Set field Orientation
	:param theOrientation:
	:type theOrientation: StepDimTol_RunoutZoneOrientation
	:rtype: inline void") SetOrientation;
		inline void SetOrientation (const opencascade::handle<StepDimTol_RunoutZoneOrientation> & theOrientation);

		/****************** StepDimTol_RunoutZoneDefinition ******************/
		%feature("compactdefaultargs") StepDimTol_RunoutZoneDefinition;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepDimTol_RunoutZoneDefinition;
		 StepDimTol_RunoutZoneDefinition ();

};


%make_alias(StepDimTol_RunoutZoneDefinition)

%extend StepDimTol_RunoutZoneDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class StepDimTol_StraightnessTolerance *
*****************************************/
class StepDimTol_StraightnessTolerance : public StepDimTol_GeometricTolerance {
	public:
		/****************** StepDimTol_StraightnessTolerance ******************/
		%feature("compactdefaultargs") StepDimTol_StraightnessTolerance;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepDimTol_StraightnessTolerance;
		 StepDimTol_StraightnessTolerance ();

};


%make_alias(StepDimTol_StraightnessTolerance)

%extend StepDimTol_StraightnessTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class StepDimTol_SurfaceProfileTolerance *
*******************************************/
class StepDimTol_SurfaceProfileTolerance : public StepDimTol_GeometricTolerance {
	public:
		/****************** StepDimTol_SurfaceProfileTolerance ******************/
		%feature("compactdefaultargs") StepDimTol_SurfaceProfileTolerance;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepDimTol_SurfaceProfileTolerance;
		 StepDimTol_SurfaceProfileTolerance ();

};


%make_alias(StepDimTol_SurfaceProfileTolerance)

%extend StepDimTol_SurfaceProfileTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************************
* class StepDimTol_UnequallyDisposedGeometricTolerance *
*******************************************************/
class StepDimTol_UnequallyDisposedGeometricTolerance : public StepDimTol_GeometricTolerance {
	public:
		/****************** Displacement ******************/
		%feature("compactdefaultargs") Displacement;
		%feature("autodoc", "* Returns field Displacement
	:rtype: inline opencascade::handle<StepBasic_LengthMeasureWithUnit>") Displacement;
		inline opencascade::handle<StepBasic_LengthMeasureWithUnit> Displacement ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param theName:
	:type theName: TCollection_HAsciiString
	:param theDescription:
	:type theDescription: TCollection_HAsciiString
	:param theMagnitude:
	:type theMagnitude: StepBasic_MeasureWithUnit
	:param theTolerancedShapeAspect:
	:type theTolerancedShapeAspect: StepDimTol_GeometricToleranceTarget
	:param theDisplacement:
	:type theDisplacement: StepBasic_LengthMeasureWithUnit
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & theName,const opencascade::handle<TCollection_HAsciiString> & theDescription,const opencascade::handle<StepBasic_MeasureWithUnit> & theMagnitude,const StepDimTol_GeometricToleranceTarget & theTolerancedShapeAspect,const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theDisplacement);

		/****************** SetDisplacement ******************/
		%feature("compactdefaultargs") SetDisplacement;
		%feature("autodoc", "* Set field Displacement
	:param theDisplacement:
	:type theDisplacement: StepBasic_LengthMeasureWithUnit
	:rtype: inline void") SetDisplacement;
		inline void SetDisplacement (const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theDisplacement);

		/****************** StepDimTol_UnequallyDisposedGeometricTolerance ******************/
		%feature("compactdefaultargs") StepDimTol_UnequallyDisposedGeometricTolerance;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepDimTol_UnequallyDisposedGeometricTolerance;
		 StepDimTol_UnequallyDisposedGeometricTolerance ();

};


%make_alias(StepDimTol_UnequallyDisposedGeometricTolerance)

%extend StepDimTol_UnequallyDisposedGeometricTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class StepDimTol_AngularityTolerance *
***************************************/
class StepDimTol_AngularityTolerance : public StepDimTol_GeometricToleranceWithDatumReference {
	public:
		/****************** StepDimTol_AngularityTolerance ******************/
		%feature("compactdefaultargs") StepDimTol_AngularityTolerance;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepDimTol_AngularityTolerance;
		 StepDimTol_AngularityTolerance ();

};


%make_alias(StepDimTol_AngularityTolerance)

%extend StepDimTol_AngularityTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class StepDimTol_CircularRunoutTolerance *
*******************************************/
class StepDimTol_CircularRunoutTolerance : public StepDimTol_GeometricToleranceWithDatumReference {
	public:
		/****************** StepDimTol_CircularRunoutTolerance ******************/
		%feature("compactdefaultargs") StepDimTol_CircularRunoutTolerance;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepDimTol_CircularRunoutTolerance;
		 StepDimTol_CircularRunoutTolerance ();

};


%make_alias(StepDimTol_CircularRunoutTolerance)

%extend StepDimTol_CircularRunoutTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class StepDimTol_CoaxialityTolerance *
***************************************/
class StepDimTol_CoaxialityTolerance : public StepDimTol_GeometricToleranceWithDatumReference {
	public:
		/****************** StepDimTol_CoaxialityTolerance ******************/
		%feature("compactdefaultargs") StepDimTol_CoaxialityTolerance;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepDimTol_CoaxialityTolerance;
		 StepDimTol_CoaxialityTolerance ();

};


%make_alias(StepDimTol_CoaxialityTolerance)

%extend StepDimTol_CoaxialityTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class StepDimTol_ConcentricityTolerance *
******************************************/
class StepDimTol_ConcentricityTolerance : public StepDimTol_GeometricToleranceWithDatumReference {
	public:
		/****************** StepDimTol_ConcentricityTolerance ******************/
		%feature("compactdefaultargs") StepDimTol_ConcentricityTolerance;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepDimTol_ConcentricityTolerance;
		 StepDimTol_ConcentricityTolerance ();

};


%make_alias(StepDimTol_ConcentricityTolerance)

%extend StepDimTol_ConcentricityTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************************
* class StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol *
**************************************************************/
class StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol : public StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMod {
	public:
		/****************** GetMaxTolerance ******************/
		%feature("compactdefaultargs") GetMaxTolerance;
		%feature("autodoc", ":rtype: inline opencascade::handle<StepBasic_LengthMeasureWithUnit>") GetMaxTolerance;
		inline opencascade::handle<StepBasic_LengthMeasureWithUnit> GetMaxTolerance ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param theName:
	:type theName: TCollection_HAsciiString
	:param theDescription:
	:type theDescription: TCollection_HAsciiString
	:param theMagnitude:
	:type theMagnitude: StepBasic_MeasureWithUnit
	:param theTolerancedShapeAspect:
	:type theTolerancedShapeAspect: StepRepr_ShapeAspect
	:param theGTWDR:
	:type theGTWDR: StepDimTol_GeometricToleranceWithDatumReference
	:param theGTWM:
	:type theGTWM: StepDimTol_GeometricToleranceWithModifiers
	:param theMaxTol:
	:type theMaxTol: StepBasic_LengthMeasureWithUnit
	:param theType:
	:type theType: StepDimTol_GeometricToleranceType
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & theName,const opencascade::handle<TCollection_HAsciiString> & theDescription,const opencascade::handle<StepBasic_MeasureWithUnit> & theMagnitude,const opencascade::handle<StepRepr_ShapeAspect> & theTolerancedShapeAspect,const opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> & theGTWDR,const opencascade::handle<StepDimTol_GeometricToleranceWithModifiers> & theGTWM,const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theMaxTol,const StepDimTol_GeometricToleranceType theType);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aDescription:
	:type aDescription: TCollection_HAsciiString
	:param aMagnitude:
	:type aMagnitude: StepBasic_MeasureWithUnit
	:param aTolerancedShapeAspect:
	:type aTolerancedShapeAspect: StepDimTol_GeometricToleranceTarget
	:param aGTWDR:
	:type aGTWDR: StepDimTol_GeometricToleranceWithDatumReference
	:param aGTWM:
	:type aGTWM: StepDimTol_GeometricToleranceWithModifiers
	:param theMaxTol:
	:type theMaxTol: StepBasic_LengthMeasureWithUnit
	:param theType:
	:type theType: StepDimTol_GeometricToleranceType
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<TCollection_HAsciiString> & aDescription,const opencascade::handle<StepBasic_MeasureWithUnit> & aMagnitude,const StepDimTol_GeometricToleranceTarget & aTolerancedShapeAspect,const opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> & aGTWDR,const opencascade::handle<StepDimTol_GeometricToleranceWithModifiers> & aGTWM,const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theMaxTol,const StepDimTol_GeometricToleranceType theType);

		/****************** SetMaxTolerance ******************/
		%feature("compactdefaultargs") SetMaxTolerance;
		%feature("autodoc", ":param theMaxTol:
	:type theMaxTol: StepBasic_LengthMeasureWithUnit
	:rtype: inline void") SetMaxTolerance;
		inline void SetMaxTolerance (opencascade::handle<StepBasic_LengthMeasureWithUnit> & theMaxTol);

		/****************** StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol ******************/
		%feature("compactdefaultargs") StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol;
		%feature("autodoc", ":rtype: None") StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol;
		 StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol ();

};


%make_alias(StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol)

%extend StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************************
* class StepDimTol_GeoTolAndGeoTolWthDatRefAndUneqDisGeoTol *
************************************************************/
class StepDimTol_GeoTolAndGeoTolWthDatRefAndUneqDisGeoTol : public StepDimTol_GeoTolAndGeoTolWthDatRef {
	public:
		/****************** GetUnequallyDisposedGeometricTolerance ******************/
		%feature("compactdefaultargs") GetUnequallyDisposedGeometricTolerance;
		%feature("autodoc", ":rtype: inline opencascade::handle<StepDimTol_UnequallyDisposedGeometricTolerance>") GetUnequallyDisposedGeometricTolerance;
		inline opencascade::handle<StepDimTol_UnequallyDisposedGeometricTolerance> GetUnequallyDisposedGeometricTolerance ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param theName:
	:type theName: TCollection_HAsciiString
	:param theDescription:
	:type theDescription: TCollection_HAsciiString
	:param theMagnitude:
	:type theMagnitude: StepBasic_MeasureWithUnit
	:param theTolerancedShapeAspect:
	:type theTolerancedShapeAspect: StepRepr_ShapeAspect
	:param theGTWDR:
	:type theGTWDR: StepDimTol_GeometricToleranceWithDatumReference
	:param theType:
	:type theType: StepDimTol_GeometricToleranceType
	:param theUDGT:
	:type theUDGT: StepDimTol_UnequallyDisposedGeometricTolerance
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & theName,const opencascade::handle<TCollection_HAsciiString> & theDescription,const opencascade::handle<StepBasic_MeasureWithUnit> & theMagnitude,const opencascade::handle<StepRepr_ShapeAspect> & theTolerancedShapeAspect,const opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> & theGTWDR,const StepDimTol_GeometricToleranceType theType,const opencascade::handle<StepDimTol_UnequallyDisposedGeometricTolerance> & theUDGT);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aDescription:
	:type aDescription: TCollection_HAsciiString
	:param aMagnitude:
	:type aMagnitude: StepBasic_MeasureWithUnit
	:param aTolerancedShapeAspect:
	:type aTolerancedShapeAspect: StepDimTol_GeometricToleranceTarget
	:param aGTWDR:
	:type aGTWDR: StepDimTol_GeometricToleranceWithDatumReference
	:param theType:
	:type theType: StepDimTol_GeometricToleranceType
	:param theUDGT:
	:type theUDGT: StepDimTol_UnequallyDisposedGeometricTolerance
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<TCollection_HAsciiString> & aDescription,const opencascade::handle<StepBasic_MeasureWithUnit> & aMagnitude,const StepDimTol_GeometricToleranceTarget & aTolerancedShapeAspect,const opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> & aGTWDR,const StepDimTol_GeometricToleranceType theType,const opencascade::handle<StepDimTol_UnequallyDisposedGeometricTolerance> & theUDGT);

		/****************** SetUnequallyDisposedGeometricTolerance ******************/
		%feature("compactdefaultargs") SetUnequallyDisposedGeometricTolerance;
		%feature("autodoc", ":param theUDGT:
	:type theUDGT: StepDimTol_UnequallyDisposedGeometricTolerance
	:rtype: inline void") SetUnequallyDisposedGeometricTolerance;
		inline void SetUnequallyDisposedGeometricTolerance (const opencascade::handle<StepDimTol_UnequallyDisposedGeometricTolerance> & theUDGT);

		/****************** StepDimTol_GeoTolAndGeoTolWthDatRefAndUneqDisGeoTol ******************/
		%feature("compactdefaultargs") StepDimTol_GeoTolAndGeoTolWthDatRefAndUneqDisGeoTol;
		%feature("autodoc", ":rtype: None") StepDimTol_GeoTolAndGeoTolWthDatRefAndUneqDisGeoTol;
		 StepDimTol_GeoTolAndGeoTolWthDatRefAndUneqDisGeoTol ();

};


%make_alias(StepDimTol_GeoTolAndGeoTolWthDatRefAndUneqDisGeoTol)

%extend StepDimTol_GeoTolAndGeoTolWthDatRefAndUneqDisGeoTol {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class StepDimTol_GeoTolAndGeoTolWthMaxTol *
********************************************/
class StepDimTol_GeoTolAndGeoTolWthMaxTol : public StepDimTol_GeoTolAndGeoTolWthMod {
	public:
		/****************** GetMaxTolerance ******************/
		%feature("compactdefaultargs") GetMaxTolerance;
		%feature("autodoc", ":rtype: inline opencascade::handle<StepBasic_LengthMeasureWithUnit>") GetMaxTolerance;
		inline opencascade::handle<StepBasic_LengthMeasureWithUnit> GetMaxTolerance ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param theName:
	:type theName: TCollection_HAsciiString
	:param theDescription:
	:type theDescription: TCollection_HAsciiString
	:param theMagnitude:
	:type theMagnitude: StepBasic_MeasureWithUnit
	:param theTolerancedShapeAspect:
	:type theTolerancedShapeAspect: StepRepr_ShapeAspect
	:param theGTWM:
	:type theGTWM: StepDimTol_GeometricToleranceWithModifiers
	:param theMaxTol:
	:type theMaxTol: StepBasic_LengthMeasureWithUnit
	:param theType:
	:type theType: StepDimTol_GeometricToleranceType
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & theName,const opencascade::handle<TCollection_HAsciiString> & theDescription,const opencascade::handle<StepBasic_MeasureWithUnit> & theMagnitude,const opencascade::handle<StepRepr_ShapeAspect> & theTolerancedShapeAspect,const opencascade::handle<StepDimTol_GeometricToleranceWithModifiers> & theGTWM,const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theMaxTol,const StepDimTol_GeometricToleranceType theType);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param aName:
	:type aName: TCollection_HAsciiString
	:param aDescription:
	:type aDescription: TCollection_HAsciiString
	:param aMagnitude:
	:type aMagnitude: StepBasic_MeasureWithUnit
	:param aTolerancedShapeAspect:
	:type aTolerancedShapeAspect: StepDimTol_GeometricToleranceTarget
	:param aGTWM:
	:type aGTWM: StepDimTol_GeometricToleranceWithModifiers
	:param theMaxTol:
	:type theMaxTol: StepBasic_LengthMeasureWithUnit
	:param theType:
	:type theType: StepDimTol_GeometricToleranceType
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & aName,const opencascade::handle<TCollection_HAsciiString> & aDescription,const opencascade::handle<StepBasic_MeasureWithUnit> & aMagnitude,const StepDimTol_GeometricToleranceTarget & aTolerancedShapeAspect,const opencascade::handle<StepDimTol_GeometricToleranceWithModifiers> & aGTWM,const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theMaxTol,const StepDimTol_GeometricToleranceType theType);

		/****************** SetMaxTolerance ******************/
		%feature("compactdefaultargs") SetMaxTolerance;
		%feature("autodoc", ":param theMaxTol:
	:type theMaxTol: StepBasic_LengthMeasureWithUnit
	:rtype: inline void") SetMaxTolerance;
		inline void SetMaxTolerance (opencascade::handle<StepBasic_LengthMeasureWithUnit> & theMaxTol);

		/****************** StepDimTol_GeoTolAndGeoTolWthMaxTol ******************/
		%feature("compactdefaultargs") StepDimTol_GeoTolAndGeoTolWthMaxTol;
		%feature("autodoc", ":rtype: None") StepDimTol_GeoTolAndGeoTolWthMaxTol;
		 StepDimTol_GeoTolAndGeoTolWthMaxTol ();

};


%make_alias(StepDimTol_GeoTolAndGeoTolWthMaxTol)

%extend StepDimTol_GeoTolAndGeoTolWthMaxTol {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************************
* class StepDimTol_GeometricToleranceWithDefinedAreaUnit *
*********************************************************/
class StepDimTol_GeometricToleranceWithDefinedAreaUnit : public StepDimTol_GeometricToleranceWithDefinedUnit {
	public:
		/****************** AreaType ******************/
		%feature("compactdefaultargs") AreaType;
		%feature("autodoc", "* Returns field AreaType
	:rtype: inline StepDimTol_AreaUnitType") AreaType;
		inline StepDimTol_AreaUnitType AreaType ();

		/****************** HasSecondUnitSize ******************/
		%feature("compactdefaultargs") HasSecondUnitSize;
		%feature("autodoc", "* Indicates if SecondUnitSize field exist
	:rtype: inline bool") HasSecondUnitSize;
		inline Standard_Boolean HasSecondUnitSize ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param theName:
	:type theName: TCollection_HAsciiString
	:param theDescription:
	:type theDescription: TCollection_HAsciiString
	:param theMagnitude:
	:type theMagnitude: StepBasic_MeasureWithUnit
	:param theTolerancedShapeAspect:
	:type theTolerancedShapeAspect: StepDimTol_GeometricToleranceTarget
	:param theUnitSize:
	:type theUnitSize: StepBasic_LengthMeasureWithUnit
	:param theAreaType:
	:type theAreaType: StepDimTol_AreaUnitType
	:param theHasSecondUnitSize:
	:type theHasSecondUnitSize: bool
	:param theSecondUnitSize:
	:type theSecondUnitSize: StepBasic_LengthMeasureWithUnit
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & theName,const opencascade::handle<TCollection_HAsciiString> & theDescription,const opencascade::handle<StepBasic_MeasureWithUnit> & theMagnitude,const StepDimTol_GeometricToleranceTarget & theTolerancedShapeAspect,const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theUnitSize,const StepDimTol_AreaUnitType theAreaType,const Standard_Boolean theHasSecondUnitSize,const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theSecondUnitSize);

		/****************** SecondUnitSize ******************/
		%feature("compactdefaultargs") SecondUnitSize;
		%feature("autodoc", "* Returns field SecondUnitSize
	:rtype: inline opencascade::handle<StepBasic_LengthMeasureWithUnit>") SecondUnitSize;
		inline opencascade::handle<StepBasic_LengthMeasureWithUnit> SecondUnitSize ();

		/****************** SetAreaType ******************/
		%feature("compactdefaultargs") SetAreaType;
		%feature("autodoc", "* Set field AreaType
	:param theAreaType:
	:type theAreaType: StepDimTol_AreaUnitType
	:rtype: inline void") SetAreaType;
		inline void SetAreaType (const StepDimTol_AreaUnitType theAreaType);

		/****************** SetSecondUnitSize ******************/
		%feature("compactdefaultargs") SetSecondUnitSize;
		%feature("autodoc", "* Set field SecondUnitSize
	:param theSecondUnitSize:
	:type theSecondUnitSize: StepBasic_LengthMeasureWithUnit
	:rtype: inline void") SetSecondUnitSize;
		inline void SetSecondUnitSize (const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theSecondUnitSize);

		/****************** StepDimTol_GeometricToleranceWithDefinedAreaUnit ******************/
		%feature("compactdefaultargs") StepDimTol_GeometricToleranceWithDefinedAreaUnit;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepDimTol_GeometricToleranceWithDefinedAreaUnit;
		 StepDimTol_GeometricToleranceWithDefinedAreaUnit ();

};


%make_alias(StepDimTol_GeometricToleranceWithDefinedAreaUnit)

%extend StepDimTol_GeometricToleranceWithDefinedAreaUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************************
* class StepDimTol_GeometricToleranceWithMaximumTolerance *
**********************************************************/
class StepDimTol_GeometricToleranceWithMaximumTolerance : public StepDimTol_GeometricToleranceWithModifiers {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize all fields (own and inherited)
	:param theName:
	:type theName: TCollection_HAsciiString
	:param theDescription:
	:type theDescription: TCollection_HAsciiString
	:param theMagnitude:
	:type theMagnitude: StepBasic_MeasureWithUnit
	:param theTolerancedShapeAspect:
	:type theTolerancedShapeAspect: StepDimTol_GeometricToleranceTarget
	:param theModifiers:
	:type theModifiers: StepDimTol_HArray1OfGeometricToleranceModifier
	:param theUnitSize:
	:type theUnitSize: StepBasic_LengthMeasureWithUnit
	:rtype: None") Init;
		void Init (const opencascade::handle<TCollection_HAsciiString> & theName,const opencascade::handle<TCollection_HAsciiString> & theDescription,const opencascade::handle<StepBasic_MeasureWithUnit> & theMagnitude,const StepDimTol_GeometricToleranceTarget & theTolerancedShapeAspect,const opencascade::handle<StepDimTol_HArray1OfGeometricToleranceModifier> & theModifiers,const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theUnitSize);

		/****************** MaximumUpperTolerance ******************/
		%feature("compactdefaultargs") MaximumUpperTolerance;
		%feature("autodoc", "* Returns field MaximumUpperTolerance
	:rtype: inline opencascade::handle<StepBasic_LengthMeasureWithUnit>") MaximumUpperTolerance;
		inline opencascade::handle<StepBasic_LengthMeasureWithUnit> MaximumUpperTolerance ();

		/****************** SetMaximumUpperTolerance ******************/
		%feature("compactdefaultargs") SetMaximumUpperTolerance;
		%feature("autodoc", "* Set field MaximumUpperTolerance
	:param theMaximumUpperTolerance:
	:type theMaximumUpperTolerance: StepBasic_LengthMeasureWithUnit
	:rtype: inline void") SetMaximumUpperTolerance;
		inline void SetMaximumUpperTolerance (const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theMaximumUpperTolerance);

		/****************** StepDimTol_GeometricToleranceWithMaximumTolerance ******************/
		%feature("compactdefaultargs") StepDimTol_GeometricToleranceWithMaximumTolerance;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepDimTol_GeometricToleranceWithMaximumTolerance;
		 StepDimTol_GeometricToleranceWithMaximumTolerance ();

};


%make_alias(StepDimTol_GeometricToleranceWithMaximumTolerance)

%extend StepDimTol_GeometricToleranceWithMaximumTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class StepDimTol_ParallelismTolerance *
****************************************/
class StepDimTol_ParallelismTolerance : public StepDimTol_GeometricToleranceWithDatumReference {
	public:
		/****************** StepDimTol_ParallelismTolerance ******************/
		%feature("compactdefaultargs") StepDimTol_ParallelismTolerance;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepDimTol_ParallelismTolerance;
		 StepDimTol_ParallelismTolerance ();

};


%make_alias(StepDimTol_ParallelismTolerance)

%extend StepDimTol_ParallelismTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class StepDimTol_PerpendicularityTolerance *
*********************************************/
class StepDimTol_PerpendicularityTolerance : public StepDimTol_GeometricToleranceWithDatumReference {
	public:
		/****************** StepDimTol_PerpendicularityTolerance ******************/
		%feature("compactdefaultargs") StepDimTol_PerpendicularityTolerance;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepDimTol_PerpendicularityTolerance;
		 StepDimTol_PerpendicularityTolerance ();

};


%make_alias(StepDimTol_PerpendicularityTolerance)

%extend StepDimTol_PerpendicularityTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class StepDimTol_SymmetryTolerance *
*************************************/
class StepDimTol_SymmetryTolerance : public StepDimTol_GeometricToleranceWithDatumReference {
	public:
		/****************** StepDimTol_SymmetryTolerance ******************/
		%feature("compactdefaultargs") StepDimTol_SymmetryTolerance;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepDimTol_SymmetryTolerance;
		 StepDimTol_SymmetryTolerance ();

};


%make_alias(StepDimTol_SymmetryTolerance)

%extend StepDimTol_SymmetryTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class StepDimTol_TotalRunoutTolerance *
****************************************/
class StepDimTol_TotalRunoutTolerance : public StepDimTol_GeometricToleranceWithDatumReference {
	public:
		/****************** StepDimTol_TotalRunoutTolerance ******************/
		%feature("compactdefaultargs") StepDimTol_TotalRunoutTolerance;
		%feature("autodoc", "* Empty constructor
	:rtype: None") StepDimTol_TotalRunoutTolerance;
		 StepDimTol_TotalRunoutTolerance ();

};


%make_alias(StepDimTol_TotalRunoutTolerance)

%extend StepDimTol_TotalRunoutTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
class StepDimTol_HArray1OfToleranceZoneTarget : public  StepDimTol_Array1OfToleranceZoneTarget, public Standard_Transient {
  public:
    StepDimTol_HArray1OfToleranceZoneTarget(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepDimTol_HArray1OfToleranceZoneTarget(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepDimTol_Array1OfToleranceZoneTarget::value_type& theValue);
    StepDimTol_HArray1OfToleranceZoneTarget(const  StepDimTol_Array1OfToleranceZoneTarget& theOther);
    const  StepDimTol_Array1OfToleranceZoneTarget& Array1();
     StepDimTol_Array1OfToleranceZoneTarget& ChangeArray1();
};
%make_alias(StepDimTol_HArray1OfToleranceZoneTarget)


class StepDimTol_HArray1OfDatumReference : public  StepDimTol_Array1OfDatumReference, public Standard_Transient {
  public:
    StepDimTol_HArray1OfDatumReference(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepDimTol_HArray1OfDatumReference(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepDimTol_Array1OfDatumReference::value_type& theValue);
    StepDimTol_HArray1OfDatumReference(const  StepDimTol_Array1OfDatumReference& theOther);
    const  StepDimTol_Array1OfDatumReference& Array1();
     StepDimTol_Array1OfDatumReference& ChangeArray1();
};
%make_alias(StepDimTol_HArray1OfDatumReference)


class StepDimTol_HArray1OfDatumReferenceElement : public  StepDimTol_Array1OfDatumReferenceElement, public Standard_Transient {
  public:
    StepDimTol_HArray1OfDatumReferenceElement(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepDimTol_HArray1OfDatumReferenceElement(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepDimTol_Array1OfDatumReferenceElement::value_type& theValue);
    StepDimTol_HArray1OfDatumReferenceElement(const  StepDimTol_Array1OfDatumReferenceElement& theOther);
    const  StepDimTol_Array1OfDatumReferenceElement& Array1();
     StepDimTol_Array1OfDatumReferenceElement& ChangeArray1();
};
%make_alias(StepDimTol_HArray1OfDatumReferenceElement)


class StepDimTol_HArray1OfDatumSystemOrReference : public  StepDimTol_Array1OfDatumSystemOrReference, public Standard_Transient {
  public:
    StepDimTol_HArray1OfDatumSystemOrReference(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepDimTol_HArray1OfDatumSystemOrReference(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepDimTol_Array1OfDatumSystemOrReference::value_type& theValue);
    StepDimTol_HArray1OfDatumSystemOrReference(const  StepDimTol_Array1OfDatumSystemOrReference& theOther);
    const  StepDimTol_Array1OfDatumSystemOrReference& Array1();
     StepDimTol_Array1OfDatumSystemOrReference& ChangeArray1();
};
%make_alias(StepDimTol_HArray1OfDatumSystemOrReference)


class StepDimTol_HArray1OfDatumReferenceCompartment : public  StepDimTol_Array1OfDatumReferenceCompartment, public Standard_Transient {
  public:
    StepDimTol_HArray1OfDatumReferenceCompartment(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepDimTol_HArray1OfDatumReferenceCompartment(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepDimTol_Array1OfDatumReferenceCompartment::value_type& theValue);
    StepDimTol_HArray1OfDatumReferenceCompartment(const  StepDimTol_Array1OfDatumReferenceCompartment& theOther);
    const  StepDimTol_Array1OfDatumReferenceCompartment& Array1();
     StepDimTol_Array1OfDatumReferenceCompartment& ChangeArray1();
};
%make_alias(StepDimTol_HArray1OfDatumReferenceCompartment)


class StepDimTol_HArray1OfDatumReferenceModifier : public  StepDimTol_Array1OfDatumReferenceModifier, public Standard_Transient {
  public:
    StepDimTol_HArray1OfDatumReferenceModifier(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepDimTol_HArray1OfDatumReferenceModifier(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepDimTol_Array1OfDatumReferenceModifier::value_type& theValue);
    StepDimTol_HArray1OfDatumReferenceModifier(const  StepDimTol_Array1OfDatumReferenceModifier& theOther);
    const  StepDimTol_Array1OfDatumReferenceModifier& Array1();
     StepDimTol_Array1OfDatumReferenceModifier& ChangeArray1();
};
%make_alias(StepDimTol_HArray1OfDatumReferenceModifier)


class StepDimTol_HArray1OfGeometricToleranceModifier : public  StepDimTol_Array1OfGeometricToleranceModifier, public Standard_Transient {
  public:
    StepDimTol_HArray1OfGeometricToleranceModifier(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepDimTol_HArray1OfGeometricToleranceModifier(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepDimTol_Array1OfGeometricToleranceModifier::value_type& theValue);
    StepDimTol_HArray1OfGeometricToleranceModifier(const  StepDimTol_Array1OfGeometricToleranceModifier& theOther);
    const  StepDimTol_Array1OfGeometricToleranceModifier& Array1();
     StepDimTol_Array1OfGeometricToleranceModifier& ChangeArray1();
};
%make_alias(StepDimTol_HArray1OfGeometricToleranceModifier)


/* harray2 classes */
/* hsequence classes */
