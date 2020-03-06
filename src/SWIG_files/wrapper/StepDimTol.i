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
#include<TopoDS_module.hxx>
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

%pythoncode {
from OCC.Core.Exception import *
};

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

/* python proy classes for enums */
%pythoncode {

class StepDimTol_LimitCondition:
	StepDimTol_MaximumMaterialCondition = 0
	StepDimTol_LeastMaterialCondition = 1
	StepDimTol_RegardlessOfFeatureSize = 2

class StepDimTol_GeometricToleranceType:
	StepDimTol_GTTAngularityTolerance = 0
	StepDimTol_GTTCircularRunoutTolerance = 1
	StepDimTol_GTTCoaxialityTolerance = 2
	StepDimTol_GTTConcentricityTolerance = 3
	StepDimTol_GTTCylindricityTolerance = 4
	StepDimTol_GTTFlatnessTolerance = 5
	StepDimTol_GTTLineProfileTolerance = 6
	StepDimTol_GTTParallelismTolerance = 7
	StepDimTol_GTTPerpendicularityTolerance = 8
	StepDimTol_GTTPositionTolerance = 9
	StepDimTol_GTTRoundnessTolerance = 10
	StepDimTol_GTTStraightnessTolerance = 11
	StepDimTol_GTTSurfaceProfileTolerance = 12
	StepDimTol_GTTSymmetryTolerance = 13
	StepDimTol_GTTTotalRunoutTolerance = 14

class StepDimTol_DatumReferenceModifierType:
	StepDimTol_CircularOrCylindrical = 0
	StepDimTol_Distance = 1
	StepDimTol_Projected = 2
	StepDimTol_Spherical = 3

class StepDimTol_SimpleDatumReferenceModifier:
	StepDimTol_SDRMAnyCrossSection = 0
	StepDimTol_SDRMAnyLongitudinalSection = 1
	StepDimTol_SDRMBasic = 2
	StepDimTol_SDRMContactingFeature = 3
	StepDimTol_SDRMDegreeOfFreedomConstraintU = 4
	StepDimTol_SDRMDegreeOfFreedomConstraintV = 5
	StepDimTol_SDRMDegreeOfFreedomConstraintW = 6
	StepDimTol_SDRMDegreeOfFreedomConstraintX = 7
	StepDimTol_SDRMDegreeOfFreedomConstraintY = 8
	StepDimTol_SDRMDegreeOfFreedomConstraintZ = 9
	StepDimTol_SDRMDistanceVariable = 10
	StepDimTol_SDRMFreeState = 11
	StepDimTol_SDRMLeastMaterialRequirement = 12
	StepDimTol_SDRMLine = 13
	StepDimTol_SDRMMajorDiameter = 14
	StepDimTol_SDRMMaximumMaterialRequirement = 15
	StepDimTol_SDRMMinorDiameter = 16
	StepDimTol_SDRMOrientation = 17
	StepDimTol_SDRMPitchDiameter = 18
	StepDimTol_SDRMPlane = 19
	StepDimTol_SDRMPoint = 20
	StepDimTol_SDRMTranslation = 21

class StepDimTol_AreaUnitType:
	StepDimTol_Circular = 0
	StepDimTol_Rectangular = 1
	StepDimTol_Square = 2

class StepDimTol_GeometricToleranceModifier:
	StepDimTol_GTMAnyCrossSection = 0
	StepDimTol_GTMCommonZone = 1
	StepDimTol_GTMEachRadialElement = 2
	StepDimTol_GTMFreeState = 3
	StepDimTol_GTMLeastMaterialRequirement = 4
	StepDimTol_GTMLineElement = 5
	StepDimTol_GTMMajorDiameter = 6
	StepDimTol_GTMMaximumMaterialRequirement = 7
	StepDimTol_GTMMinorDiameter = 8
	StepDimTol_GTMNotConvex = 9
	StepDimTol_GTMPitchDiameter = 10
	StepDimTol_GTMReciprocityRequirement = 11
	StepDimTol_GTMSeparateRequirement = 12
	StepDimTol_GTMStatisticalTolerance = 13
	StepDimTol_GTMTangentPlane = 14
};
/* end python proxy for enums */

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
%template(StepDimTol_Array1OfDatumReference) NCollection_Array1<opencascade::handle<StepDimTol_DatumReference>>;

%extend NCollection_Array1<opencascade::handle<StepDimTol_DatumReference>> {
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
%template(StepDimTol_Array1OfDatumReferenceCompartment) NCollection_Array1<opencascade::handle<StepDimTol_DatumReferenceCompartment>>;

%extend NCollection_Array1<opencascade::handle<StepDimTol_DatumReferenceCompartment>> {
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
%template(StepDimTol_Array1OfDatumReferenceElement) NCollection_Array1<opencascade::handle<StepDimTol_DatumReferenceElement>>;

%extend NCollection_Array1<opencascade::handle<StepDimTol_DatumReferenceElement>> {
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
%template(StepDimTol_Array1OfDatumReferenceModifier) NCollection_Array1<StepDimTol_DatumReferenceModifier>;

%extend NCollection_Array1<StepDimTol_DatumReferenceModifier> {
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
%template(StepDimTol_Array1OfDatumSystemOrReference) NCollection_Array1<StepDimTol_DatumSystemOrReference>;

%extend NCollection_Array1<StepDimTol_DatumSystemOrReference> {
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
%template(StepDimTol_Array1OfGeometricToleranceModifier) NCollection_Array1<StepDimTol_GeometricToleranceModifier>;

%extend NCollection_Array1<StepDimTol_GeometricToleranceModifier> {
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
%template(StepDimTol_Array1OfToleranceZoneTarget) NCollection_Array1<StepDimTol_ToleranceZoneTarget>;

%extend NCollection_Array1<StepDimTol_ToleranceZoneTarget> {
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
typedef NCollection_Array1<opencascade::handle<StepDimTol_DatumReference>> StepDimTol_Array1OfDatumReference;
typedef NCollection_Array1<opencascade::handle<StepDimTol_DatumReferenceCompartment>> StepDimTol_Array1OfDatumReferenceCompartment;
typedef NCollection_Array1<opencascade::handle<StepDimTol_DatumReferenceElement>> StepDimTol_Array1OfDatumReferenceElement;
typedef NCollection_Array1<StepDimTol_DatumReferenceModifier> StepDimTol_Array1OfDatumReferenceModifier;
typedef NCollection_Array1<StepDimTol_DatumSystemOrReference> StepDimTol_Array1OfDatumSystemOrReference;
typedef NCollection_Array1<StepDimTol_GeometricToleranceModifier> StepDimTol_Array1OfGeometricToleranceModifier;
typedef NCollection_Array1<StepDimTol_ToleranceZoneTarget> StepDimTol_Array1OfToleranceZoneTarget;
/* end typedefs declaration */

/*******************************
* class StepDimTol_CommonDatum *
*******************************/
class StepDimTol_CommonDatum : public StepRepr_CompositeShapeAspect {
	public:
		/****************** StepDimTol_CommonDatum ******************/
		%feature("compactdefaultargs") StepDimTol_CommonDatum;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepDimTol_CommonDatum;
		 StepDimTol_CommonDatum();

		/****************** Datum ******************/
		%feature("compactdefaultargs") Datum;
		%feature("autodoc", "Returns data for supertype datum.

Returns
-------
opencascade::handle<StepDimTol_Datum>
") Datum;
		opencascade::handle<StepDimTol_Datum> Datum();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theShapeAspect_Name: TCollection_HAsciiString
theShapeAspect_Description: TCollection_HAsciiString
theShapeAspect_OfShape: StepRepr_ProductDefinitionShape
theShapeAspect_ProductDefinitional: StepData_Logical
theDatum_Name: TCollection_HAsciiString
theDatum_Description: TCollection_HAsciiString
theDatum_OfShape: StepRepr_ProductDefinitionShape
theDatum_ProductDefinitional: StepData_Logical
theDatum_Identification: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theShapeAspect_Name, const opencascade::handle<TCollection_HAsciiString> & theShapeAspect_Description, const opencascade::handle<StepRepr_ProductDefinitionShape> & theShapeAspect_OfShape, const StepData_Logical theShapeAspect_ProductDefinitional, const opencascade::handle<TCollection_HAsciiString> & theDatum_Name, const opencascade::handle<TCollection_HAsciiString> & theDatum_Description, const opencascade::handle<StepRepr_ProductDefinitionShape> & theDatum_OfShape, const StepData_Logical theDatum_ProductDefinitional, const opencascade::handle<TCollection_HAsciiString> & theDatum_Identification);

		/****************** SetDatum ******************/
		%feature("compactdefaultargs") SetDatum;
		%feature("autodoc", "Set data for supertype datum.

Parameters
----------
theDatum: StepDimTol_Datum

Returns
-------
None
") SetDatum;
		void SetDatum(const opencascade::handle<StepDimTol_Datum> & theDatum);

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
		/****************** StepDimTol_Datum ******************/
		%feature("compactdefaultargs") StepDimTol_Datum;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepDimTol_Datum;
		 StepDimTol_Datum();

		/****************** Identification ******************/
		%feature("compactdefaultargs") Identification;
		%feature("autodoc", "Returns field identification.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Identification;
		opencascade::handle<TCollection_HAsciiString> Identification();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theShapeAspect_Name: TCollection_HAsciiString
theShapeAspect_Description: TCollection_HAsciiString
theShapeAspect_OfShape: StepRepr_ProductDefinitionShape
theShapeAspect_ProductDefinitional: StepData_Logical
theIdentification: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theShapeAspect_Name, const opencascade::handle<TCollection_HAsciiString> & theShapeAspect_Description, const opencascade::handle<StepRepr_ProductDefinitionShape> & theShapeAspect_OfShape, const StepData_Logical theShapeAspect_ProductDefinitional, const opencascade::handle<TCollection_HAsciiString> & theIdentification);

		/****************** SetIdentification ******************/
		%feature("compactdefaultargs") SetIdentification;
		%feature("autodoc", "Set field identification.

Parameters
----------
theIdentification: TCollection_HAsciiString

Returns
-------
None
") SetIdentification;
		void SetIdentification(const opencascade::handle<TCollection_HAsciiString> & theIdentification);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepDimTol_DatumFeature;
		 StepDimTol_DatumFeature();

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
		/****************** StepDimTol_DatumOrCommonDatum ******************/
		%feature("compactdefaultargs") StepDimTol_DatumOrCommonDatum;
		%feature("autodoc", "Returns a datumorcommondatum select type.

Returns
-------
None
") StepDimTol_DatumOrCommonDatum;
		 StepDimTol_DatumOrCommonDatum();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a datumorcommondatum kind entity that is : 1 -> datum 2 -> commondatumlist 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** CommonDatumList ******************/
		%feature("compactdefaultargs") CommonDatumList;
		%feature("autodoc", "Returns value as a commondatumlist (null if another type).

Returns
-------
opencascade::handle<StepDimTol_HArray1OfDatumReferenceElement>
") CommonDatumList;
		opencascade::handle<StepDimTol_HArray1OfDatumReferenceElement> CommonDatumList();

		/****************** Datum ******************/
		%feature("compactdefaultargs") Datum;
		%feature("autodoc", "Returns value as a datum (null if another type).

Returns
-------
opencascade::handle<StepDimTol_Datum>
") Datum;
		opencascade::handle<StepDimTol_Datum> Datum();

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
		/****************** StepDimTol_DatumReference ******************/
		%feature("compactdefaultargs") StepDimTol_DatumReference;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepDimTol_DatumReference;
		 StepDimTol_DatumReference();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
thePrecedence: int
theReferencedDatum: StepDimTol_Datum

Returns
-------
None
") Init;
		void Init(const Standard_Integer thePrecedence, const opencascade::handle<StepDimTol_Datum> & theReferencedDatum);

		/****************** Precedence ******************/
		%feature("compactdefaultargs") Precedence;
		%feature("autodoc", "Returns field precedence.

Returns
-------
int
") Precedence;
		Standard_Integer Precedence();

		/****************** ReferencedDatum ******************/
		%feature("compactdefaultargs") ReferencedDatum;
		%feature("autodoc", "Returns field referenceddatum.

Returns
-------
opencascade::handle<StepDimTol_Datum>
") ReferencedDatum;
		opencascade::handle<StepDimTol_Datum> ReferencedDatum();

		/****************** SetPrecedence ******************/
		%feature("compactdefaultargs") SetPrecedence;
		%feature("autodoc", "Set field precedence.

Parameters
----------
thePrecedence: int

Returns
-------
None
") SetPrecedence;
		void SetPrecedence(const Standard_Integer thePrecedence);

		/****************** SetReferencedDatum ******************/
		%feature("compactdefaultargs") SetReferencedDatum;
		%feature("autodoc", "Set field referenceddatum.

Parameters
----------
theReferencedDatum: StepDimTol_Datum

Returns
-------
None
") SetReferencedDatum;
		void SetReferencedDatum(const opencascade::handle<StepDimTol_Datum> & theReferencedDatum);

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
		/****************** StepDimTol_DatumReferenceModifier ******************/
		%feature("compactdefaultargs") StepDimTol_DatumReferenceModifier;
		%feature("autodoc", "Returns a datumreferencemodifier select type.

Returns
-------
None
") StepDimTol_DatumReferenceModifier;
		 StepDimTol_DatumReferenceModifier();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a datumreferencemodifier kind entity that is : 1 -> datumreferencemodifierwithvalue 2 -> simpledatumreferencemodifiermember 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** DatumReferenceModifierWithValue ******************/
		%feature("compactdefaultargs") DatumReferenceModifierWithValue;
		%feature("autodoc", "Returns value as a datumreferencemodifierwithvalue (null if another type).

Returns
-------
opencascade::handle<StepDimTol_DatumReferenceModifierWithValue>
") DatumReferenceModifierWithValue;
		opencascade::handle<StepDimTol_DatumReferenceModifierWithValue> DatumReferenceModifierWithValue();

		/****************** SimpleDatumReferenceModifierMember ******************/
		%feature("compactdefaultargs") SimpleDatumReferenceModifierMember;
		%feature("autodoc", "Returns value as a simpledatumreferencemodifiermember (null if another type).

Returns
-------
opencascade::handle<StepDimTol_SimpleDatumReferenceModifierMember>
") SimpleDatumReferenceModifierMember;
		opencascade::handle<StepDimTol_SimpleDatumReferenceModifierMember> SimpleDatumReferenceModifierMember();

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
		/****************** StepDimTol_DatumReferenceModifierWithValue ******************/
		%feature("compactdefaultargs") StepDimTol_DatumReferenceModifierWithValue;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepDimTol_DatumReferenceModifierWithValue;
		 StepDimTol_DatumReferenceModifierWithValue();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theModifierType: StepDimTol_DatumReferenceModifierType
theModifierValue: StepBasic_LengthMeasureWithUnit

Returns
-------
None
") Init;
		void Init(const StepDimTol_DatumReferenceModifierType & theModifierType, const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theModifierValue);

		/****************** ModifierType ******************/
		%feature("compactdefaultargs") ModifierType;
		%feature("autodoc", "Returns field modifiertype.

Returns
-------
StepDimTol_DatumReferenceModifierType
") ModifierType;
		StepDimTol_DatumReferenceModifierType ModifierType();

		/****************** ModifierValue ******************/
		%feature("compactdefaultargs") ModifierValue;
		%feature("autodoc", "Returns field modifiervalue.

Returns
-------
opencascade::handle<StepBasic_LengthMeasureWithUnit>
") ModifierValue;
		opencascade::handle<StepBasic_LengthMeasureWithUnit> ModifierValue();

		/****************** SetModifierType ******************/
		%feature("compactdefaultargs") SetModifierType;
		%feature("autodoc", "Set field modifiertype.

Parameters
----------
theModifierType: StepDimTol_DatumReferenceModifierType

Returns
-------
None
") SetModifierType;
		void SetModifierType(const StepDimTol_DatumReferenceModifierType & theModifierType);

		/****************** SetModifierValue ******************/
		%feature("compactdefaultargs") SetModifierValue;
		%feature("autodoc", "Set field modifiervalue.

Parameters
----------
theModifierValue: StepBasic_LengthMeasureWithUnit

Returns
-------
None
") SetModifierValue;
		void SetModifierValue(const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theModifierValue);

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
		/****************** StepDimTol_DatumSystem ******************/
		%feature("compactdefaultargs") StepDimTol_DatumSystem;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepDimTol_DatumSystem;
		 StepDimTol_DatumSystem();

		/****************** Constituents ******************/
		%feature("compactdefaultargs") Constituents;
		%feature("autodoc", "Returns field constituents.

Returns
-------
opencascade::handle<StepDimTol_HArray1OfDatumReferenceCompartment>
") Constituents;
		opencascade::handle<StepDimTol_HArray1OfDatumReferenceCompartment> Constituents();

		/****************** ConstituentsValue ******************/
		%feature("compactdefaultargs") ConstituentsValue;
		%feature("autodoc", "Returns constituents with the given number.

Parameters
----------
num: int

Returns
-------
opencascade::handle<StepDimTol_DatumReferenceCompartment>
") ConstituentsValue;
		opencascade::handle<StepDimTol_DatumReferenceCompartment> ConstituentsValue(const Standard_Integer num);

		/****************** ConstituentsValue ******************/
		%feature("compactdefaultargs") ConstituentsValue;
		%feature("autodoc", "Sets constituents with given number.

Parameters
----------
num: int
theItem: StepDimTol_DatumReferenceCompartment

Returns
-------
None
") ConstituentsValue;
		void ConstituentsValue(const Standard_Integer num, const opencascade::handle<StepDimTol_DatumReferenceCompartment> & theItem);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString
theOfShape: StepRepr_ProductDefinitionShape
theProductDefinitional: StepData_Logical
theConstituents: StepDimTol_HArray1OfDatumReferenceCompartment

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription, const opencascade::handle<StepRepr_ProductDefinitionShape> & theOfShape, const StepData_Logical theProductDefinitional, const opencascade::handle<StepDimTol_HArray1OfDatumReferenceCompartment> & theConstituents);

		/****************** NbConstituents ******************/
		%feature("compactdefaultargs") NbConstituents;
		%feature("autodoc", "Returns number of constituents.

Returns
-------
int
") NbConstituents;
		Standard_Integer NbConstituents();

		/****************** SetConstituents ******************/
		%feature("compactdefaultargs") SetConstituents;
		%feature("autodoc", "Set field constituents.

Parameters
----------
theConstituents: StepDimTol_HArray1OfDatumReferenceCompartment

Returns
-------
None
") SetConstituents;
		void SetConstituents(const opencascade::handle<StepDimTol_HArray1OfDatumReferenceCompartment> & theConstituents);

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
		/****************** StepDimTol_DatumSystemOrReference ******************/
		%feature("compactdefaultargs") StepDimTol_DatumSystemOrReference;
		%feature("autodoc", "Returns a datumsystemorreference select type.

Returns
-------
None
") StepDimTol_DatumSystemOrReference;
		 StepDimTol_DatumSystemOrReference();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a datumsystemorreference kind entity that is : 1 -> datumsystem 2 -> datumreference 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** DatumReference ******************/
		%feature("compactdefaultargs") DatumReference;
		%feature("autodoc", "Returns value as a datumreference (null if another type).

Returns
-------
opencascade::handle<StepDimTol_DatumReference>
") DatumReference;
		opencascade::handle<StepDimTol_DatumReference> DatumReference();

		/****************** DatumSystem ******************/
		%feature("compactdefaultargs") DatumSystem;
		%feature("autodoc", "Returns value as a datumsystem (null if another type).

Returns
-------
opencascade::handle<StepDimTol_DatumSystem>
") DatumSystem;
		opencascade::handle<StepDimTol_DatumSystem> DatumSystem();

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
		/****************** StepDimTol_DatumTarget ******************/
		%feature("compactdefaultargs") StepDimTol_DatumTarget;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepDimTol_DatumTarget;
		 StepDimTol_DatumTarget();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theShapeAspect_Name: TCollection_HAsciiString
theShapeAspect_Description: TCollection_HAsciiString
theShapeAspect_OfShape: StepRepr_ProductDefinitionShape
theShapeAspect_ProductDefinitional: StepData_Logical
theTargetId: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theShapeAspect_Name, const opencascade::handle<TCollection_HAsciiString> & theShapeAspect_Description, const opencascade::handle<StepRepr_ProductDefinitionShape> & theShapeAspect_OfShape, const StepData_Logical theShapeAspect_ProductDefinitional, const opencascade::handle<TCollection_HAsciiString> & theTargetId);

		/****************** SetTargetId ******************/
		%feature("compactdefaultargs") SetTargetId;
		%feature("autodoc", "Set field targetid.

Parameters
----------
theTargetId: TCollection_HAsciiString

Returns
-------
None
") SetTargetId;
		void SetTargetId(const opencascade::handle<TCollection_HAsciiString> & theTargetId);

		/****************** TargetId ******************/
		%feature("compactdefaultargs") TargetId;
		%feature("autodoc", "Returns field targetid.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") TargetId;
		opencascade::handle<TCollection_HAsciiString> TargetId();

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
		/****************** StepDimTol_GeneralDatumReference ******************/
		%feature("compactdefaultargs") StepDimTol_GeneralDatumReference;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepDimTol_GeneralDatumReference;
		 StepDimTol_GeneralDatumReference();

		/****************** Base ******************/
		%feature("compactdefaultargs") Base;
		%feature("autodoc", "Returns field base.

Returns
-------
StepDimTol_DatumOrCommonDatum
") Base;
		StepDimTol_DatumOrCommonDatum Base();

		/****************** HasModifiers ******************/
		%feature("compactdefaultargs") HasModifiers;
		%feature("autodoc", "Indicates is field modifiers exist.

Returns
-------
bool
") HasModifiers;
		Standard_Boolean HasModifiers();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString
theOfShape: StepRepr_ProductDefinitionShape
theProductDefinitional: StepData_Logical
theBase: StepDimTol_DatumOrCommonDatum
theHasModifiers: bool
theModifiers: StepDimTol_HArray1OfDatumReferenceModifier

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription, const opencascade::handle<StepRepr_ProductDefinitionShape> & theOfShape, const StepData_Logical theProductDefinitional, const StepDimTol_DatumOrCommonDatum & theBase, const Standard_Boolean theHasModifiers, const opencascade::handle<StepDimTol_HArray1OfDatumReferenceModifier> & theModifiers);

		/****************** Modifiers ******************/
		%feature("compactdefaultargs") Modifiers;
		%feature("autodoc", "Returns field modifiers.

Returns
-------
opencascade::handle<StepDimTol_HArray1OfDatumReferenceModifier>
") Modifiers;
		opencascade::handle<StepDimTol_HArray1OfDatumReferenceModifier> Modifiers();

		/****************** ModifiersValue ******************/
		%feature("compactdefaultargs") ModifiersValue;
		%feature("autodoc", "Returns modifiers with the given number.

Parameters
----------
theNum: int

Returns
-------
StepDimTol_DatumReferenceModifier
") ModifiersValue;
		StepDimTol_DatumReferenceModifier ModifiersValue(const Standard_Integer theNum);

		/****************** ModifiersValue ******************/
		%feature("compactdefaultargs") ModifiersValue;
		%feature("autodoc", "Sets modifiers with given number.

Parameters
----------
theNum: int
theItem: StepDimTol_DatumReferenceModifier

Returns
-------
None
") ModifiersValue;
		void ModifiersValue(const Standard_Integer theNum, const StepDimTol_DatumReferenceModifier & theItem);

		/****************** NbModifiers ******************/
		%feature("compactdefaultargs") NbModifiers;
		%feature("autodoc", "Returns number of modifiers.

Returns
-------
int
") NbModifiers;
		Standard_Integer NbModifiers();

		/****************** SetBase ******************/
		%feature("compactdefaultargs") SetBase;
		%feature("autodoc", "Set field base.

Parameters
----------
theBase: StepDimTol_DatumOrCommonDatum

Returns
-------
None
") SetBase;
		void SetBase(const StepDimTol_DatumOrCommonDatum & theBase);

		/****************** SetModifiers ******************/
		%feature("compactdefaultargs") SetModifiers;
		%feature("autodoc", "Set field modifiers.

Parameters
----------
theModifiers: StepDimTol_HArray1OfDatumReferenceModifier

Returns
-------
None
") SetModifiers;
		void SetModifiers(const opencascade::handle<StepDimTol_HArray1OfDatumReferenceModifier> & theModifiers);

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
		/****************** StepDimTol_GeometricTolerance ******************/
		%feature("compactdefaultargs") StepDimTol_GeometricTolerance;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepDimTol_GeometricTolerance;
		 StepDimTol_GeometricTolerance();

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Returns field description.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited) ap214.

Parameters
----------
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString
theMagnitude: StepBasic_MeasureWithUnit
theTolerancedShapeAspect: StepRepr_ShapeAspect

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription, const opencascade::handle<StepBasic_MeasureWithUnit> & theMagnitude, const opencascade::handle<StepRepr_ShapeAspect> & theTolerancedShapeAspect);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited) ap242.

Parameters
----------
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString
theMagnitude: StepBasic_MeasureWithUnit
theTolerancedShapeAspect: StepDimTol_GeometricToleranceTarget

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription, const opencascade::handle<StepBasic_MeasureWithUnit> & theMagnitude, const StepDimTol_GeometricToleranceTarget & theTolerancedShapeAspect);

		/****************** Magnitude ******************/
		%feature("compactdefaultargs") Magnitude;
		%feature("autodoc", "Returns field magnitude.

Returns
-------
opencascade::handle<StepBasic_MeasureWithUnit>
") Magnitude;
		opencascade::handle<StepBasic_MeasureWithUnit> Magnitude();

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns field name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "Set field description.

Parameters
----------
theDescription: TCollection_HAsciiString

Returns
-------
None
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & theDescription);

		/****************** SetMagnitude ******************/
		%feature("compactdefaultargs") SetMagnitude;
		%feature("autodoc", "Set field magnitude.

Parameters
----------
theMagnitude: StepBasic_MeasureWithUnit

Returns
-------
None
") SetMagnitude;
		void SetMagnitude(const opencascade::handle<StepBasic_MeasureWithUnit> & theMagnitude);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Set field name.

Parameters
----------
theName: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & theName);

		/****************** SetTolerancedShapeAspect ******************/
		%feature("compactdefaultargs") SetTolerancedShapeAspect;
		%feature("autodoc", "Set field tolerancedshapeaspect ap214.

Parameters
----------
theTolerancedShapeAspect: StepRepr_ShapeAspect

Returns
-------
None
") SetTolerancedShapeAspect;
		void SetTolerancedShapeAspect(const opencascade::handle<StepRepr_ShapeAspect> & theTolerancedShapeAspect);

		/****************** SetTolerancedShapeAspect ******************/
		%feature("compactdefaultargs") SetTolerancedShapeAspect;
		%feature("autodoc", "Set field tolerancedshapeaspect ap242.

Parameters
----------
theTolerancedShapeAspect: StepDimTol_GeometricToleranceTarget

Returns
-------
None
") SetTolerancedShapeAspect;
		void SetTolerancedShapeAspect(const StepDimTol_GeometricToleranceTarget & theTolerancedShapeAspect);

		/****************** TolerancedShapeAspect ******************/
		%feature("compactdefaultargs") TolerancedShapeAspect;
		%feature("autodoc", "Returns field tolerancedshapeaspect note: in ap214(203) type of this attribute can be only steprepr_shapeaspect.

Returns
-------
StepDimTol_GeometricToleranceTarget
") TolerancedShapeAspect;
		StepDimTol_GeometricToleranceTarget TolerancedShapeAspect();

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
		/****************** StepDimTol_GeometricToleranceRelationship ******************/
		%feature("compactdefaultargs") StepDimTol_GeometricToleranceRelationship;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepDimTol_GeometricToleranceRelationship;
		 StepDimTol_GeometricToleranceRelationship();

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Returns field description.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString
theRelatingGeometricTolerance: StepDimTol_GeometricTolerance
theRelatedGeometricTolerance: StepDimTol_GeometricTolerance

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription, const opencascade::handle<StepDimTol_GeometricTolerance> & theRelatingGeometricTolerance, const opencascade::handle<StepDimTol_GeometricTolerance> & theRelatedGeometricTolerance);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns field name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** RelatedGeometricTolerance ******************/
		%feature("compactdefaultargs") RelatedGeometricTolerance;
		%feature("autodoc", "Returns field relatedgeometrictolerance.

Returns
-------
opencascade::handle<StepDimTol_GeometricTolerance>
") RelatedGeometricTolerance;
		opencascade::handle<StepDimTol_GeometricTolerance> RelatedGeometricTolerance();

		/****************** RelatingGeometricTolerance ******************/
		%feature("compactdefaultargs") RelatingGeometricTolerance;
		%feature("autodoc", "Returns field relatinggeometrictolerance.

Returns
-------
opencascade::handle<StepDimTol_GeometricTolerance>
") RelatingGeometricTolerance;
		opencascade::handle<StepDimTol_GeometricTolerance> RelatingGeometricTolerance();

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "Set field description.

Parameters
----------
theDescription: TCollection_HAsciiString

Returns
-------
None
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & theDescription);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Set field name.

Parameters
----------
theName: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & theName);

		/****************** SetRelatedGeometricTolerance ******************/
		%feature("compactdefaultargs") SetRelatedGeometricTolerance;
		%feature("autodoc", "Set field relatedgeometrictolerance.

Parameters
----------
theRelatedGeometricTolerance: StepDimTol_GeometricTolerance

Returns
-------
None
") SetRelatedGeometricTolerance;
		void SetRelatedGeometricTolerance(const opencascade::handle<StepDimTol_GeometricTolerance> & theRelatedGeometricTolerance);

		/****************** SetRelatingGeometricTolerance ******************/
		%feature("compactdefaultargs") SetRelatingGeometricTolerance;
		%feature("autodoc", "Set field relatinggeometrictolerance.

Parameters
----------
theRelatingGeometricTolerance: StepDimTol_GeometricTolerance

Returns
-------
None
") SetRelatingGeometricTolerance;
		void SetRelatingGeometricTolerance(const opencascade::handle<StepDimTol_GeometricTolerance> & theRelatingGeometricTolerance);

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
		/****************** StepDimTol_GeometricToleranceTarget ******************/
		%feature("compactdefaultargs") StepDimTol_GeometricToleranceTarget;
		%feature("autodoc", "Returns a geometrictolerancetarget select type.

Returns
-------
None
") StepDimTol_GeometricToleranceTarget;
		 StepDimTol_GeometricToleranceTarget();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a geometrictolerancetarget kind entity that is : 1 -> dimensionallocation 2 -> dimensionalsize 3 -> productdefinitionshape 4 -> shapeaspect 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** DimensionalLocation ******************/
		%feature("compactdefaultargs") DimensionalLocation;
		%feature("autodoc", "Returns value as a dimensionallocation (null if another type).

Returns
-------
opencascade::handle<StepShape_DimensionalLocation>
") DimensionalLocation;
		opencascade::handle<StepShape_DimensionalLocation> DimensionalLocation();

		/****************** DimensionalSize ******************/
		%feature("compactdefaultargs") DimensionalSize;
		%feature("autodoc", "Returns value as a dimensionalsize (null if another type).

Returns
-------
opencascade::handle<StepShape_DimensionalSize>
") DimensionalSize;
		opencascade::handle<StepShape_DimensionalSize> DimensionalSize();

		/****************** ProductDefinitionShape ******************/
		%feature("compactdefaultargs") ProductDefinitionShape;
		%feature("autodoc", "Returns value as a productdefinitionshape (null if another type).

Returns
-------
opencascade::handle<StepRepr_ProductDefinitionShape>
") ProductDefinitionShape;
		opencascade::handle<StepRepr_ProductDefinitionShape> ProductDefinitionShape();

		/****************** ShapeAspect ******************/
		%feature("compactdefaultargs") ShapeAspect;
		%feature("autodoc", "Returns value as a shapeaspect (null if another type).

Returns
-------
opencascade::handle<StepRepr_ShapeAspect>
") ShapeAspect;
		opencascade::handle<StepRepr_ShapeAspect> ShapeAspect();

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
		/****************** StepDimTol_RunoutZoneOrientation ******************/
		%feature("compactdefaultargs") StepDimTol_RunoutZoneOrientation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepDimTol_RunoutZoneOrientation;
		 StepDimTol_RunoutZoneOrientation();

		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Returns field angle.

Returns
-------
opencascade::handle<StepBasic_PlaneAngleMeasureWithUnit>
") Angle;
		opencascade::handle<StepBasic_PlaneAngleMeasureWithUnit> Angle();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Init all field own and inherited.

Parameters
----------
theAngle: StepBasic_PlaneAngleMeasureWithUnit

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_PlaneAngleMeasureWithUnit> & theAngle);

		/****************** SetAngle ******************/
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "Set field angle.

Parameters
----------
theAngle: StepBasic_PlaneAngleMeasureWithUnit

Returns
-------
None
") SetAngle;
		void SetAngle(const opencascade::handle<StepBasic_PlaneAngleMeasureWithUnit> & theAngle);

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
		/****************** StepDimTol_ShapeToleranceSelect ******************/
		%feature("compactdefaultargs") StepDimTol_ShapeToleranceSelect;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepDimTol_ShapeToleranceSelect;
		 StepDimTol_ShapeToleranceSelect();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a kind of shapetoleranceselect select type 1 -> geometrictolerance from stepdimtol 2 -> plusminustolerance from stepshape 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** GeometricTolerance ******************/
		%feature("compactdefaultargs") GeometricTolerance;
		%feature("autodoc", "Returns value as geometrictolerance (or null if another type).

Returns
-------
opencascade::handle<StepDimTol_GeometricTolerance>
") GeometricTolerance;
		opencascade::handle<StepDimTol_GeometricTolerance> GeometricTolerance();

		/****************** PlusMinusTolerance ******************/
		%feature("compactdefaultargs") PlusMinusTolerance;
		%feature("autodoc", "Returns value as plusminustolerance (or null if another type).

Returns
-------
opencascade::handle<StepShape_PlusMinusTolerance>
") PlusMinusTolerance;
		opencascade::handle<StepShape_PlusMinusTolerance> PlusMinusTolerance();

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
		/****************** StepDimTol_SimpleDatumReferenceModifierMember ******************/
		%feature("compactdefaultargs") StepDimTol_SimpleDatumReferenceModifierMember;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepDimTol_SimpleDatumReferenceModifierMember;
		 StepDimTol_SimpleDatumReferenceModifierMember();

		/****************** EnumText ******************/
		%feature("compactdefaultargs") EnumText;
		%feature("autodoc", "No available documentation.

Returns
-------
char *
") EnumText;
		virtual const char * EnumText();

		/****************** HasName ******************/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasName;
		virtual Standard_Boolean HasName();

		/****************** Kind ******************/
		%feature("compactdefaultargs") Kind;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Kind;
		Standard_Integer Kind();

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
char *
") Name;
		virtual const char * Name();

		/****************** SetEnumText ******************/
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
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
theValue: StepDimTol_SimpleDatumReferenceModifier

Returns
-------
None
") SetValue;
		void SetValue(const StepDimTol_SimpleDatumReferenceModifier theValue);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
StepDimTol_SimpleDatumReferenceModifier
") Value;
		StepDimTol_SimpleDatumReferenceModifier Value();

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
		/****************** StepDimTol_ToleranceZone ******************/
		%feature("compactdefaultargs") StepDimTol_ToleranceZone;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepDimTol_ToleranceZone;
		 StepDimTol_ToleranceZone();

		/****************** DefiningTolerance ******************/
		%feature("compactdefaultargs") DefiningTolerance;
		%feature("autodoc", "Returns field definingtolerance.

Returns
-------
opencascade::handle<StepDimTol_HArray1OfToleranceZoneTarget>
") DefiningTolerance;
		opencascade::handle<StepDimTol_HArray1OfToleranceZoneTarget> DefiningTolerance();

		/****************** DefiningToleranceValue ******************/
		%feature("compactdefaultargs") DefiningToleranceValue;
		%feature("autodoc", "Returns defining tolerance with the given number.

Parameters
----------
theNum: int

Returns
-------
StepDimTol_ToleranceZoneTarget
") DefiningToleranceValue;
		StepDimTol_ToleranceZoneTarget DefiningToleranceValue(const Standard_Integer theNum);

		/****************** Form ******************/
		%feature("compactdefaultargs") Form;
		%feature("autodoc", "Returns field form.

Returns
-------
opencascade::handle<StepDimTol_ToleranceZoneForm>
") Form;
		opencascade::handle<StepDimTol_ToleranceZoneForm> Form();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString
theOfShape: StepRepr_ProductDefinitionShape
theProductDefinitional: StepData_Logical
theDefiningTolerance: StepDimTol_HArray1OfToleranceZoneTarget
theForm: StepDimTol_ToleranceZoneForm

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription, const opencascade::handle<StepRepr_ProductDefinitionShape> & theOfShape, const StepData_Logical theProductDefinitional, const opencascade::handle<StepDimTol_HArray1OfToleranceZoneTarget> & theDefiningTolerance, const opencascade::handle<StepDimTol_ToleranceZoneForm> & theForm);

		/****************** NbDefiningTolerances ******************/
		%feature("compactdefaultargs") NbDefiningTolerances;
		%feature("autodoc", "Returns number of defining tolerances.

Returns
-------
int
") NbDefiningTolerances;
		Standard_Integer NbDefiningTolerances();

		/****************** SetDefiningTolerance ******************/
		%feature("compactdefaultargs") SetDefiningTolerance;
		%feature("autodoc", "Set field definingtolerance.

Parameters
----------
theDefiningTolerance: StepDimTol_HArray1OfToleranceZoneTarget

Returns
-------
None
") SetDefiningTolerance;
		void SetDefiningTolerance(const opencascade::handle<StepDimTol_HArray1OfToleranceZoneTarget> & theDefiningTolerance);

		/****************** SetDefiningToleranceValue ******************/
		%feature("compactdefaultargs") SetDefiningToleranceValue;
		%feature("autodoc", "Sets defining tolerance with given number.

Parameters
----------
theNum: int
theItem: StepDimTol_ToleranceZoneTarget

Returns
-------
None
") SetDefiningToleranceValue;
		void SetDefiningToleranceValue(const Standard_Integer theNum, const StepDimTol_ToleranceZoneTarget & theItem);

		/****************** SetForm ******************/
		%feature("compactdefaultargs") SetForm;
		%feature("autodoc", "Set field form.

Parameters
----------
theForm: StepDimTol_ToleranceZoneForm

Returns
-------
None
") SetForm;
		void SetForm(const opencascade::handle<StepDimTol_ToleranceZoneForm> & theForm);

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
		/****************** StepDimTol_ToleranceZoneDefinition ******************/
		%feature("compactdefaultargs") StepDimTol_ToleranceZoneDefinition;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepDimTol_ToleranceZoneDefinition;
		 StepDimTol_ToleranceZoneDefinition();

		/****************** Boundaries ******************/
		%feature("compactdefaultargs") Boundaries;
		%feature("autodoc", "Returns field boundaries.

Returns
-------
opencascade::handle<StepRepr_HArray1OfShapeAspect>
") Boundaries;
		opencascade::handle<StepRepr_HArray1OfShapeAspect> Boundaries();

		/****************** BoundariesValue ******************/
		%feature("compactdefaultargs") BoundariesValue;
		%feature("autodoc", "Returns boundaries with the given number.

Parameters
----------
theNum: int

Returns
-------
opencascade::handle<StepRepr_ShapeAspect>
") BoundariesValue;
		opencascade::handle<StepRepr_ShapeAspect> BoundariesValue(const Standard_Integer theNum);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theZone: StepDimTol_ToleranceZone
theBoundaries: StepRepr_HArray1OfShapeAspect

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepDimTol_ToleranceZone> & theZone, const opencascade::handle<StepRepr_HArray1OfShapeAspect> & theBoundaries);

		/****************** NbBoundaries ******************/
		%feature("compactdefaultargs") NbBoundaries;
		%feature("autodoc", "Returns number of boundaries.

Returns
-------
int
") NbBoundaries;
		Standard_Integer NbBoundaries();

		/****************** SetBoundaries ******************/
		%feature("compactdefaultargs") SetBoundaries;
		%feature("autodoc", "Set field boundaries.

Parameters
----------
theBoundaries: StepRepr_HArray1OfShapeAspect

Returns
-------
None
") SetBoundaries;
		void SetBoundaries(const opencascade::handle<StepRepr_HArray1OfShapeAspect> & theBoundaries);

		/****************** SetBoundariesValue ******************/
		%feature("compactdefaultargs") SetBoundariesValue;
		%feature("autodoc", "Sets boundaries with given number.

Parameters
----------
theNum: int
theItem: StepRepr_ShapeAspect

Returns
-------
None
") SetBoundariesValue;
		void SetBoundariesValue(const Standard_Integer theNum, const opencascade::handle<StepRepr_ShapeAspect> & theItem);

		/****************** SetZone ******************/
		%feature("compactdefaultargs") SetZone;
		%feature("autodoc", "Set field zone.

Parameters
----------
theZone: StepDimTol_ToleranceZone

Returns
-------
None
") SetZone;
		void SetZone(const opencascade::handle<StepDimTol_ToleranceZone> & theZone);

		/****************** Zone ******************/
		%feature("compactdefaultargs") Zone;
		%feature("autodoc", "Returns field zone.

Returns
-------
opencascade::handle<StepDimTol_ToleranceZone>
") Zone;
		opencascade::handle<StepDimTol_ToleranceZone> Zone();

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
		/****************** StepDimTol_ToleranceZoneForm ******************/
		%feature("compactdefaultargs") StepDimTol_ToleranceZoneForm;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepDimTol_ToleranceZoneForm;
		 StepDimTol_ToleranceZoneForm();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Init all field own and inherited.

Parameters
----------
theName: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns field name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Set field name.

Parameters
----------
theName: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & theName);

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
		/****************** StepDimTol_ToleranceZoneTarget ******************/
		%feature("compactdefaultargs") StepDimTol_ToleranceZoneTarget;
		%feature("autodoc", "Returns a tolerancezonetarget select type.

Returns
-------
None
") StepDimTol_ToleranceZoneTarget;
		 StepDimTol_ToleranceZoneTarget();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a tolerancezonetarget kind entity that is : 1 -> dimensionallocation 2 -> dimensionalsize 3 -> geometrictolerance 4 -> generaldatumreference 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** DimensionalLocation ******************/
		%feature("compactdefaultargs") DimensionalLocation;
		%feature("autodoc", "Returns value as a dimensionallocation (null if another type).

Returns
-------
opencascade::handle<StepShape_DimensionalLocation>
") DimensionalLocation;
		opencascade::handle<StepShape_DimensionalLocation> DimensionalLocation();

		/****************** DimensionalSize ******************/
		%feature("compactdefaultargs") DimensionalSize;
		%feature("autodoc", "Returns value as a dimensionalsize (null if another type).

Returns
-------
opencascade::handle<StepShape_DimensionalSize>
") DimensionalSize;
		opencascade::handle<StepShape_DimensionalSize> DimensionalSize();

		/****************** GeneralDatumReference ******************/
		%feature("compactdefaultargs") GeneralDatumReference;
		%feature("autodoc", "Returns value as a generaldatumreference (null if another type).

Returns
-------
opencascade::handle<StepDimTol_GeneralDatumReference>
") GeneralDatumReference;
		opencascade::handle<StepDimTol_GeneralDatumReference> GeneralDatumReference();

		/****************** GeometricTolerance ******************/
		%feature("compactdefaultargs") GeometricTolerance;
		%feature("autodoc", "Returns value as a geometrictolerance (null if another type).

Returns
-------
opencascade::handle<StepDimTol_GeometricTolerance>
") GeometricTolerance;
		opencascade::handle<StepDimTol_GeometricTolerance> GeometricTolerance();

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepDimTol_CylindricityTolerance;
		 StepDimTol_CylindricityTolerance();

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepDimTol_DatumReferenceCompartment;
		 StepDimTol_DatumReferenceCompartment();

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepDimTol_DatumReferenceElement;
		 StepDimTol_DatumReferenceElement();

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepDimTol_FlatnessTolerance;
		 StepDimTol_FlatnessTolerance();

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
		/****************** StepDimTol_GeoTolAndGeoTolWthDatRef ******************/
		%feature("compactdefaultargs") StepDimTol_GeoTolAndGeoTolWthDatRef;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepDimTol_GeoTolAndGeoTolWthDatRef;
		 StepDimTol_GeoTolAndGeoTolWthDatRef();

		/****************** GetGeometricToleranceWithDatumReference ******************/
		%feature("compactdefaultargs") GetGeometricToleranceWithDatumReference;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference>
") GetGeometricToleranceWithDatumReference;
		opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> GetGeometricToleranceWithDatumReference();

		/****************** GetToleranceType ******************/
		%feature("compactdefaultargs") GetToleranceType;
		%feature("autodoc", "No available documentation.

Returns
-------
StepDimTol_GeometricToleranceType
") GetToleranceType;
		StepDimTol_GeometricToleranceType GetToleranceType();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString
theMagnitude: StepBasic_MeasureWithUnit
theTolerancedShapeAspect: StepRepr_ShapeAspect
theGTWDR: StepDimTol_GeometricToleranceWithDatumReference
theType: StepDimTol_GeometricToleranceType

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription, const opencascade::handle<StepBasic_MeasureWithUnit> & theMagnitude, const opencascade::handle<StepRepr_ShapeAspect> & theTolerancedShapeAspect, const opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> & theGTWDR, const StepDimTol_GeometricToleranceType theType);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aMagnitude: StepBasic_MeasureWithUnit
aTolerancedShapeAspect: StepDimTol_GeometricToleranceTarget
aGTWDR: StepDimTol_GeometricToleranceWithDatumReference
theType: StepDimTol_GeometricToleranceType

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_MeasureWithUnit> & aMagnitude, const StepDimTol_GeometricToleranceTarget & aTolerancedShapeAspect, const opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> & aGTWDR, const StepDimTol_GeometricToleranceType theType);

		/****************** SetGeometricToleranceType ******************/
		%feature("compactdefaultargs") SetGeometricToleranceType;
		%feature("autodoc", "No available documentation.

Parameters
----------
theType: StepDimTol_GeometricToleranceType

Returns
-------
None
") SetGeometricToleranceType;
		void SetGeometricToleranceType(const StepDimTol_GeometricToleranceType theType);

		/****************** SetGeometricToleranceWithDatumReference ******************/
		%feature("compactdefaultargs") SetGeometricToleranceWithDatumReference;
		%feature("autodoc", "No available documentation.

Parameters
----------
theGTWDR: StepDimTol_GeometricToleranceWithDatumReference

Returns
-------
None
") SetGeometricToleranceWithDatumReference;
		void SetGeometricToleranceWithDatumReference(const opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> & theGTWDR);

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
		/****************** StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMod ******************/
		%feature("compactdefaultargs") StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMod;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMod;
		 StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMod();

		/****************** GetGeometricToleranceWithDatumReference ******************/
		%feature("compactdefaultargs") GetGeometricToleranceWithDatumReference;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference>
") GetGeometricToleranceWithDatumReference;
		opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> GetGeometricToleranceWithDatumReference();

		/****************** GetGeometricToleranceWithModifiers ******************/
		%feature("compactdefaultargs") GetGeometricToleranceWithModifiers;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepDimTol_GeometricToleranceWithModifiers>
") GetGeometricToleranceWithModifiers;
		opencascade::handle<StepDimTol_GeometricToleranceWithModifiers> GetGeometricToleranceWithModifiers();

		/****************** GetToleranceType ******************/
		%feature("compactdefaultargs") GetToleranceType;
		%feature("autodoc", "No available documentation.

Returns
-------
StepDimTol_GeometricToleranceType
") GetToleranceType;
		StepDimTol_GeometricToleranceType GetToleranceType();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString
theMagnitude: StepBasic_MeasureWithUnit
theTolerancedShapeAspect: StepRepr_ShapeAspect
theGTWDR: StepDimTol_GeometricToleranceWithDatumReference
theGTWM: StepDimTol_GeometricToleranceWithModifiers
theType: StepDimTol_GeometricToleranceType

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription, const opencascade::handle<StepBasic_MeasureWithUnit> & theMagnitude, const opencascade::handle<StepRepr_ShapeAspect> & theTolerancedShapeAspect, const opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> & theGTWDR, const opencascade::handle<StepDimTol_GeometricToleranceWithModifiers> & theGTWM, const StepDimTol_GeometricToleranceType theType);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aMagnitude: StepBasic_MeasureWithUnit
aTolerancedShapeAspect: StepDimTol_GeometricToleranceTarget
aGTWDR: StepDimTol_GeometricToleranceWithDatumReference
aGTWM: StepDimTol_GeometricToleranceWithModifiers
theType: StepDimTol_GeometricToleranceType

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_MeasureWithUnit> & aMagnitude, const StepDimTol_GeometricToleranceTarget & aTolerancedShapeAspect, const opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> & aGTWDR, const opencascade::handle<StepDimTol_GeometricToleranceWithModifiers> & aGTWM, const StepDimTol_GeometricToleranceType theType);

		/****************** SetGeometricToleranceType ******************/
		%feature("compactdefaultargs") SetGeometricToleranceType;
		%feature("autodoc", "No available documentation.

Parameters
----------
theType: StepDimTol_GeometricToleranceType

Returns
-------
None
") SetGeometricToleranceType;
		void SetGeometricToleranceType(const StepDimTol_GeometricToleranceType theType);

		/****************** SetGeometricToleranceWithDatumReference ******************/
		%feature("compactdefaultargs") SetGeometricToleranceWithDatumReference;
		%feature("autodoc", "No available documentation.

Parameters
----------
theGTWDR: StepDimTol_GeometricToleranceWithDatumReference

Returns
-------
None
") SetGeometricToleranceWithDatumReference;
		void SetGeometricToleranceWithDatumReference(const opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> & theGTWDR);

		/****************** SetGeometricToleranceWithModifiers ******************/
		%feature("compactdefaultargs") SetGeometricToleranceWithModifiers;
		%feature("autodoc", "No available documentation.

Parameters
----------
theGTWM: StepDimTol_GeometricToleranceWithModifiers

Returns
-------
None
") SetGeometricToleranceWithModifiers;
		void SetGeometricToleranceWithModifiers(const opencascade::handle<StepDimTol_GeometricToleranceWithModifiers> & theGTWM);

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
		/****************** StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol ******************/
		%feature("compactdefaultargs") StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol;
		 StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol();

		/****************** GetGeometricToleranceWithDatumReference ******************/
		%feature("compactdefaultargs") GetGeometricToleranceWithDatumReference;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference>
") GetGeometricToleranceWithDatumReference;
		opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> GetGeometricToleranceWithDatumReference();

		/****************** GetModifiedGeometricTolerance ******************/
		%feature("compactdefaultargs") GetModifiedGeometricTolerance;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepDimTol_ModifiedGeometricTolerance>
") GetModifiedGeometricTolerance;
		opencascade::handle<StepDimTol_ModifiedGeometricTolerance> GetModifiedGeometricTolerance();

		/****************** GetPositionTolerance ******************/
		%feature("compactdefaultargs") GetPositionTolerance;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepDimTol_PositionTolerance>
") GetPositionTolerance;
		opencascade::handle<StepDimTol_PositionTolerance> GetPositionTolerance();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aMagnitude: StepBasic_MeasureWithUnit
aTolerancedShapeAspect: StepRepr_ShapeAspect
aGTWDR: StepDimTol_GeometricToleranceWithDatumReference
aMGT: StepDimTol_ModifiedGeometricTolerance

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_MeasureWithUnit> & aMagnitude, const opencascade::handle<StepRepr_ShapeAspect> & aTolerancedShapeAspect, const opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> & aGTWDR, const opencascade::handle<StepDimTol_ModifiedGeometricTolerance> & aMGT);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aMagnitude: StepBasic_MeasureWithUnit
aTolerancedShapeAspect: StepDimTol_GeometricToleranceTarget
aGTWDR: StepDimTol_GeometricToleranceWithDatumReference
aMGT: StepDimTol_ModifiedGeometricTolerance

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_MeasureWithUnit> & aMagnitude, const StepDimTol_GeometricToleranceTarget & aTolerancedShapeAspect, const opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> & aGTWDR, const opencascade::handle<StepDimTol_ModifiedGeometricTolerance> & aMGT);

		/****************** SetGeometricToleranceWithDatumReference ******************/
		%feature("compactdefaultargs") SetGeometricToleranceWithDatumReference;
		%feature("autodoc", "No available documentation.

Parameters
----------
aGTWDR: StepDimTol_GeometricToleranceWithDatumReference

Returns
-------
None
") SetGeometricToleranceWithDatumReference;
		void SetGeometricToleranceWithDatumReference(const opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> & aGTWDR);

		/****************** SetModifiedGeometricTolerance ******************/
		%feature("compactdefaultargs") SetModifiedGeometricTolerance;
		%feature("autodoc", "No available documentation.

Parameters
----------
aMGT: StepDimTol_ModifiedGeometricTolerance

Returns
-------
None
") SetModifiedGeometricTolerance;
		void SetModifiedGeometricTolerance(const opencascade::handle<StepDimTol_ModifiedGeometricTolerance> & aMGT);

		/****************** SetPositionTolerance ******************/
		%feature("compactdefaultargs") SetPositionTolerance;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPT: StepDimTol_PositionTolerance

Returns
-------
None
") SetPositionTolerance;
		void SetPositionTolerance(const opencascade::handle<StepDimTol_PositionTolerance> & aPT);

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
		/****************** StepDimTol_GeoTolAndGeoTolWthMod ******************/
		%feature("compactdefaultargs") StepDimTol_GeoTolAndGeoTolWthMod;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepDimTol_GeoTolAndGeoTolWthMod;
		 StepDimTol_GeoTolAndGeoTolWthMod();

		/****************** GetGeometricToleranceWithModifiers ******************/
		%feature("compactdefaultargs") GetGeometricToleranceWithModifiers;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepDimTol_GeometricToleranceWithModifiers>
") GetGeometricToleranceWithModifiers;
		opencascade::handle<StepDimTol_GeometricToleranceWithModifiers> GetGeometricToleranceWithModifiers();

		/****************** GetToleranceType ******************/
		%feature("compactdefaultargs") GetToleranceType;
		%feature("autodoc", "No available documentation.

Returns
-------
StepDimTol_GeometricToleranceType
") GetToleranceType;
		StepDimTol_GeometricToleranceType GetToleranceType();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString
theMagnitude: StepBasic_MeasureWithUnit
theTolerancedShapeAspect: StepRepr_ShapeAspect
theGTWM: StepDimTol_GeometricToleranceWithModifiers
theType: StepDimTol_GeometricToleranceType

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription, const opencascade::handle<StepBasic_MeasureWithUnit> & theMagnitude, const opencascade::handle<StepRepr_ShapeAspect> & theTolerancedShapeAspect, const opencascade::handle<StepDimTol_GeometricToleranceWithModifiers> & theGTWM, const StepDimTol_GeometricToleranceType theType);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aMagnitude: StepBasic_MeasureWithUnit
aTolerancedShapeAspect: StepDimTol_GeometricToleranceTarget
aGTWM: StepDimTol_GeometricToleranceWithModifiers
theType: StepDimTol_GeometricToleranceType

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_MeasureWithUnit> & aMagnitude, const StepDimTol_GeometricToleranceTarget & aTolerancedShapeAspect, const opencascade::handle<StepDimTol_GeometricToleranceWithModifiers> & aGTWM, const StepDimTol_GeometricToleranceType theType);

		/****************** SetGeometricToleranceType ******************/
		%feature("compactdefaultargs") SetGeometricToleranceType;
		%feature("autodoc", "No available documentation.

Parameters
----------
theType: StepDimTol_GeometricToleranceType

Returns
-------
None
") SetGeometricToleranceType;
		void SetGeometricToleranceType(const StepDimTol_GeometricToleranceType theType);

		/****************** SetGeometricToleranceWithModifiers ******************/
		%feature("compactdefaultargs") SetGeometricToleranceWithModifiers;
		%feature("autodoc", "No available documentation.

Parameters
----------
theGTWM: StepDimTol_GeometricToleranceWithModifiers

Returns
-------
None
") SetGeometricToleranceWithModifiers;
		void SetGeometricToleranceWithModifiers(const opencascade::handle<StepDimTol_GeometricToleranceWithModifiers> & theGTWM);

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
		/****************** StepDimTol_GeometricToleranceWithDatumReference ******************/
		%feature("compactdefaultargs") StepDimTol_GeometricToleranceWithDatumReference;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepDimTol_GeometricToleranceWithDatumReference;
		 StepDimTol_GeometricToleranceWithDatumReference();

		/****************** DatumSystem ******************/
		%feature("compactdefaultargs") DatumSystem;
		%feature("autodoc", "Returns field datumsystem ap214.

Returns
-------
opencascade::handle<StepDimTol_HArray1OfDatumReference>
") DatumSystem;
		opencascade::handle<StepDimTol_HArray1OfDatumReference> DatumSystem();

		/****************** DatumSystemAP242 ******************/
		%feature("compactdefaultargs") DatumSystemAP242;
		%feature("autodoc", "Returns field datumsystem ap242.

Returns
-------
opencascade::handle<StepDimTol_HArray1OfDatumSystemOrReference>
") DatumSystemAP242;
		opencascade::handle<StepDimTol_HArray1OfDatumSystemOrReference> DatumSystemAP242();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited) ap214.

Parameters
----------
theGeometricTolerance_Name: TCollection_HAsciiString
theGeometricTolerance_Description: TCollection_HAsciiString
theGeometricTolerance_Magnitude: StepBasic_MeasureWithUnit
theGeometricTolerance_TolerancedShapeAspect: StepRepr_ShapeAspect
theDatumSystem: StepDimTol_HArray1OfDatumReference

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theGeometricTolerance_Name, const opencascade::handle<TCollection_HAsciiString> & theGeometricTolerance_Description, const opencascade::handle<StepBasic_MeasureWithUnit> & theGeometricTolerance_Magnitude, const opencascade::handle<StepRepr_ShapeAspect> & theGeometricTolerance_TolerancedShapeAspect, const opencascade::handle<StepDimTol_HArray1OfDatumReference> & theDatumSystem);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited) ap242.

Parameters
----------
theGeometricTolerance_Name: TCollection_HAsciiString
theGeometricTolerance_Description: TCollection_HAsciiString
theGeometricTolerance_Magnitude: StepBasic_MeasureWithUnit
theGeometricTolerance_TolerancedShapeAspect: StepDimTol_GeometricToleranceTarget
theDatumSystem: StepDimTol_HArray1OfDatumSystemOrReference

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theGeometricTolerance_Name, const opencascade::handle<TCollection_HAsciiString> & theGeometricTolerance_Description, const opencascade::handle<StepBasic_MeasureWithUnit> & theGeometricTolerance_Magnitude, const StepDimTol_GeometricToleranceTarget & theGeometricTolerance_TolerancedShapeAspect, const opencascade::handle<StepDimTol_HArray1OfDatumSystemOrReference> & theDatumSystem);

		/****************** SetDatumSystem ******************/
		%feature("compactdefaultargs") SetDatumSystem;
		%feature("autodoc", "Set field datumsystem ap214.

Parameters
----------
theDatumSystem: StepDimTol_HArray1OfDatumReference

Returns
-------
None
") SetDatumSystem;
		void SetDatumSystem(const opencascade::handle<StepDimTol_HArray1OfDatumReference> & theDatumSystem);

		/****************** SetDatumSystem ******************/
		%feature("compactdefaultargs") SetDatumSystem;
		%feature("autodoc", "Set field datumsystem ap242.

Parameters
----------
theDatumSystem: StepDimTol_HArray1OfDatumSystemOrReference

Returns
-------
None
") SetDatumSystem;
		void SetDatumSystem(const opencascade::handle<StepDimTol_HArray1OfDatumSystemOrReference> & theDatumSystem);

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
		/****************** StepDimTol_GeometricToleranceWithDefinedUnit ******************/
		%feature("compactdefaultargs") StepDimTol_GeometricToleranceWithDefinedUnit;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepDimTol_GeometricToleranceWithDefinedUnit;
		 StepDimTol_GeometricToleranceWithDefinedUnit();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited) ap214.

Parameters
----------
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString
theMagnitude: StepBasic_MeasureWithUnit
theTolerancedShapeAspect: StepRepr_ShapeAspect
theUnitSize: StepBasic_LengthMeasureWithUnit

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription, const opencascade::handle<StepBasic_MeasureWithUnit> & theMagnitude, const opencascade::handle<StepRepr_ShapeAspect> & theTolerancedShapeAspect, const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theUnitSize);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited) ap242.

Parameters
----------
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString
theMagnitude: StepBasic_MeasureWithUnit
theTolerancedShapeAspect: StepDimTol_GeometricToleranceTarget
theUnitSize: StepBasic_LengthMeasureWithUnit

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription, const opencascade::handle<StepBasic_MeasureWithUnit> & theMagnitude, const StepDimTol_GeometricToleranceTarget & theTolerancedShapeAspect, const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theUnitSize);

		/****************** SetUnitSize ******************/
		%feature("compactdefaultargs") SetUnitSize;
		%feature("autodoc", "Set field unitsize.

Parameters
----------
theUnitSize: StepBasic_LengthMeasureWithUnit

Returns
-------
None
") SetUnitSize;
		void SetUnitSize(const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theUnitSize);

		/****************** UnitSize ******************/
		%feature("compactdefaultargs") UnitSize;
		%feature("autodoc", "Returns field unitsize.

Returns
-------
opencascade::handle<StepBasic_LengthMeasureWithUnit>
") UnitSize;
		opencascade::handle<StepBasic_LengthMeasureWithUnit> UnitSize();

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
		/****************** StepDimTol_GeometricToleranceWithModifiers ******************/
		%feature("compactdefaultargs") StepDimTol_GeometricToleranceWithModifiers;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepDimTol_GeometricToleranceWithModifiers;
		 StepDimTol_GeometricToleranceWithModifiers();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString
theMagnitude: StepBasic_MeasureWithUnit
theTolerancedShapeAspect: StepDimTol_GeometricToleranceTarget
theModifiers: StepDimTol_HArray1OfGeometricToleranceModifier

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription, const opencascade::handle<StepBasic_MeasureWithUnit> & theMagnitude, const StepDimTol_GeometricToleranceTarget & theTolerancedShapeAspect, const opencascade::handle<StepDimTol_HArray1OfGeometricToleranceModifier> & theModifiers);

		/****************** ModifierValue ******************/
		%feature("compactdefaultargs") ModifierValue;
		%feature("autodoc", "Returns modifier with the given number.

Parameters
----------
theNum: int

Returns
-------
StepDimTol_GeometricToleranceModifier
") ModifierValue;
		StepDimTol_GeometricToleranceModifier ModifierValue(const Standard_Integer theNum);

		/****************** Modifiers ******************/
		%feature("compactdefaultargs") Modifiers;
		%feature("autodoc", "Returns field modifiers.

Returns
-------
opencascade::handle<StepDimTol_HArray1OfGeometricToleranceModifier>
") Modifiers;
		opencascade::handle<StepDimTol_HArray1OfGeometricToleranceModifier> Modifiers();

		/****************** NbModifiers ******************/
		%feature("compactdefaultargs") NbModifiers;
		%feature("autodoc", "Returns number of modifiers.

Returns
-------
int
") NbModifiers;
		Standard_Integer NbModifiers();

		/****************** SetModifierValue ******************/
		%feature("compactdefaultargs") SetModifierValue;
		%feature("autodoc", "Sets modifier with given number.

Parameters
----------
theNum: int
theItem: StepDimTol_GeometricToleranceModifier

Returns
-------
None
") SetModifierValue;
		void SetModifierValue(const Standard_Integer theNum, const StepDimTol_GeometricToleranceModifier theItem);

		/****************** SetModifiers ******************/
		%feature("compactdefaultargs") SetModifiers;
		%feature("autodoc", "Set field modifiers.

Parameters
----------
theModifiers: StepDimTol_HArray1OfGeometricToleranceModifier

Returns
-------
None
") SetModifiers;
		void SetModifiers(const opencascade::handle<StepDimTol_HArray1OfGeometricToleranceModifier> & theModifiers);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepDimTol_LineProfileTolerance;
		 StepDimTol_LineProfileTolerance();

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
		/****************** StepDimTol_ModifiedGeometricTolerance ******************/
		%feature("compactdefaultargs") StepDimTol_ModifiedGeometricTolerance;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepDimTol_ModifiedGeometricTolerance;
		 StepDimTol_ModifiedGeometricTolerance();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited) ap214.

Parameters
----------
theGeometricTolerance_Name: TCollection_HAsciiString
theGeometricTolerance_Description: TCollection_HAsciiString
theGeometricTolerance_Magnitude: StepBasic_MeasureWithUnit
theGeometricTolerance_TolerancedShapeAspect: StepRepr_ShapeAspect
theModifier: StepDimTol_LimitCondition

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theGeometricTolerance_Name, const opencascade::handle<TCollection_HAsciiString> & theGeometricTolerance_Description, const opencascade::handle<StepBasic_MeasureWithUnit> & theGeometricTolerance_Magnitude, const opencascade::handle<StepRepr_ShapeAspect> & theGeometricTolerance_TolerancedShapeAspect, const StepDimTol_LimitCondition theModifier);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited) ap242.

Parameters
----------
theGeometricTolerance_Name: TCollection_HAsciiString
theGeometricTolerance_Description: TCollection_HAsciiString
theGeometricTolerance_Magnitude: StepBasic_MeasureWithUnit
theGeometricTolerance_TolerancedShapeAspect: StepDimTol_GeometricToleranceTarget
theModifier: StepDimTol_LimitCondition

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theGeometricTolerance_Name, const opencascade::handle<TCollection_HAsciiString> & theGeometricTolerance_Description, const opencascade::handle<StepBasic_MeasureWithUnit> & theGeometricTolerance_Magnitude, const StepDimTol_GeometricToleranceTarget & theGeometricTolerance_TolerancedShapeAspect, const StepDimTol_LimitCondition theModifier);

		/****************** Modifier ******************/
		%feature("compactdefaultargs") Modifier;
		%feature("autodoc", "Returns field modifier.

Returns
-------
StepDimTol_LimitCondition
") Modifier;
		StepDimTol_LimitCondition Modifier();

		/****************** SetModifier ******************/
		%feature("compactdefaultargs") SetModifier;
		%feature("autodoc", "Set field modifier.

Parameters
----------
theModifier: StepDimTol_LimitCondition

Returns
-------
None
") SetModifier;
		void SetModifier(const StepDimTol_LimitCondition theModifier);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepDimTol_NonUniformZoneDefinition;
		 StepDimTol_NonUniformZoneDefinition();

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepDimTol_PlacedDatumTargetFeature;
		 StepDimTol_PlacedDatumTargetFeature();

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepDimTol_PositionTolerance;
		 StepDimTol_PositionTolerance();

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
		/****************** StepDimTol_ProjectedZoneDefinition ******************/
		%feature("compactdefaultargs") StepDimTol_ProjectedZoneDefinition;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepDimTol_ProjectedZoneDefinition;
		 StepDimTol_ProjectedZoneDefinition();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theZone: StepDimTol_ToleranceZone
theBoundaries: StepRepr_HArray1OfShapeAspect
theProjectionEnd: StepRepr_ShapeAspect
theProjectionLength: StepBasic_LengthMeasureWithUnit

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepDimTol_ToleranceZone> & theZone, const opencascade::handle<StepRepr_HArray1OfShapeAspect> & theBoundaries, const opencascade::handle<StepRepr_ShapeAspect> & theProjectionEnd, const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theProjectionLength);

		/****************** ProjectionEnd ******************/
		%feature("compactdefaultargs") ProjectionEnd;
		%feature("autodoc", "Returns field projectionend.

Returns
-------
opencascade::handle<StepRepr_ShapeAspect>
") ProjectionEnd;
		opencascade::handle<StepRepr_ShapeAspect> ProjectionEnd();

		/****************** ProjectionLength ******************/
		%feature("compactdefaultargs") ProjectionLength;
		%feature("autodoc", "Returns field projectionlength.

Returns
-------
opencascade::handle<StepBasic_LengthMeasureWithUnit>
") ProjectionLength;
		opencascade::handle<StepBasic_LengthMeasureWithUnit> ProjectionLength();

		/****************** SetProjectionEnd ******************/
		%feature("compactdefaultargs") SetProjectionEnd;
		%feature("autodoc", "Set field projectionend.

Parameters
----------
theProjectionEnd: StepRepr_ShapeAspect

Returns
-------
None
") SetProjectionEnd;
		void SetProjectionEnd(const opencascade::handle<StepRepr_ShapeAspect> & theProjectionEnd);

		/****************** SetProjectionLength ******************/
		%feature("compactdefaultargs") SetProjectionLength;
		%feature("autodoc", "Set field projectionlength.

Parameters
----------
theProjectionLength: StepBasic_LengthMeasureWithUnit

Returns
-------
None
") SetProjectionLength;
		void SetProjectionLength(const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theProjectionLength);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepDimTol_RoundnessTolerance;
		 StepDimTol_RoundnessTolerance();

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
		/****************** StepDimTol_RunoutZoneDefinition ******************/
		%feature("compactdefaultargs") StepDimTol_RunoutZoneDefinition;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepDimTol_RunoutZoneDefinition;
		 StepDimTol_RunoutZoneDefinition();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theZone: StepDimTol_ToleranceZone
theBoundaries: StepRepr_HArray1OfShapeAspect
theOrientation: StepDimTol_RunoutZoneOrientation

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepDimTol_ToleranceZone> & theZone, const opencascade::handle<StepRepr_HArray1OfShapeAspect> & theBoundaries, const opencascade::handle<StepDimTol_RunoutZoneOrientation> & theOrientation);

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Returns field orientation.

Returns
-------
opencascade::handle<StepDimTol_RunoutZoneOrientation>
") Orientation;
		opencascade::handle<StepDimTol_RunoutZoneOrientation> Orientation();

		/****************** SetOrientation ******************/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "Set field orientation.

Parameters
----------
theOrientation: StepDimTol_RunoutZoneOrientation

Returns
-------
None
") SetOrientation;
		void SetOrientation(const opencascade::handle<StepDimTol_RunoutZoneOrientation> & theOrientation);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepDimTol_StraightnessTolerance;
		 StepDimTol_StraightnessTolerance();

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepDimTol_SurfaceProfileTolerance;
		 StepDimTol_SurfaceProfileTolerance();

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
		/****************** StepDimTol_UnequallyDisposedGeometricTolerance ******************/
		%feature("compactdefaultargs") StepDimTol_UnequallyDisposedGeometricTolerance;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepDimTol_UnequallyDisposedGeometricTolerance;
		 StepDimTol_UnequallyDisposedGeometricTolerance();

		/****************** Displacement ******************/
		%feature("compactdefaultargs") Displacement;
		%feature("autodoc", "Returns field displacement.

Returns
-------
opencascade::handle<StepBasic_LengthMeasureWithUnit>
") Displacement;
		opencascade::handle<StepBasic_LengthMeasureWithUnit> Displacement();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString
theMagnitude: StepBasic_MeasureWithUnit
theTolerancedShapeAspect: StepDimTol_GeometricToleranceTarget
theDisplacement: StepBasic_LengthMeasureWithUnit

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription, const opencascade::handle<StepBasic_MeasureWithUnit> & theMagnitude, const StepDimTol_GeometricToleranceTarget & theTolerancedShapeAspect, const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theDisplacement);

		/****************** SetDisplacement ******************/
		%feature("compactdefaultargs") SetDisplacement;
		%feature("autodoc", "Set field displacement.

Parameters
----------
theDisplacement: StepBasic_LengthMeasureWithUnit

Returns
-------
None
") SetDisplacement;
		void SetDisplacement(const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theDisplacement);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepDimTol_AngularityTolerance;
		 StepDimTol_AngularityTolerance();

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepDimTol_CircularRunoutTolerance;
		 StepDimTol_CircularRunoutTolerance();

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepDimTol_CoaxialityTolerance;
		 StepDimTol_CoaxialityTolerance();

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepDimTol_ConcentricityTolerance;
		 StepDimTol_ConcentricityTolerance();

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
		/****************** StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol ******************/
		%feature("compactdefaultargs") StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol;
		 StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol();

		/****************** GetMaxTolerance ******************/
		%feature("compactdefaultargs") GetMaxTolerance;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_LengthMeasureWithUnit>
") GetMaxTolerance;
		opencascade::handle<StepBasic_LengthMeasureWithUnit> GetMaxTolerance();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString
theMagnitude: StepBasic_MeasureWithUnit
theTolerancedShapeAspect: StepRepr_ShapeAspect
theGTWDR: StepDimTol_GeometricToleranceWithDatumReference
theGTWM: StepDimTol_GeometricToleranceWithModifiers
theMaxTol: StepBasic_LengthMeasureWithUnit
theType: StepDimTol_GeometricToleranceType

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription, const opencascade::handle<StepBasic_MeasureWithUnit> & theMagnitude, const opencascade::handle<StepRepr_ShapeAspect> & theTolerancedShapeAspect, const opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> & theGTWDR, const opencascade::handle<StepDimTol_GeometricToleranceWithModifiers> & theGTWM, const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theMaxTol, const StepDimTol_GeometricToleranceType theType);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aMagnitude: StepBasic_MeasureWithUnit
aTolerancedShapeAspect: StepDimTol_GeometricToleranceTarget
aGTWDR: StepDimTol_GeometricToleranceWithDatumReference
aGTWM: StepDimTol_GeometricToleranceWithModifiers
theMaxTol: StepBasic_LengthMeasureWithUnit
theType: StepDimTol_GeometricToleranceType

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_MeasureWithUnit> & aMagnitude, const StepDimTol_GeometricToleranceTarget & aTolerancedShapeAspect, const opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> & aGTWDR, const opencascade::handle<StepDimTol_GeometricToleranceWithModifiers> & aGTWM, const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theMaxTol, const StepDimTol_GeometricToleranceType theType);

		/****************** SetMaxTolerance ******************/
		%feature("compactdefaultargs") SetMaxTolerance;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMaxTol: StepBasic_LengthMeasureWithUnit

Returns
-------
None
") SetMaxTolerance;
		void SetMaxTolerance(opencascade::handle<StepBasic_LengthMeasureWithUnit> & theMaxTol);

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
		/****************** StepDimTol_GeoTolAndGeoTolWthDatRefAndUneqDisGeoTol ******************/
		%feature("compactdefaultargs") StepDimTol_GeoTolAndGeoTolWthDatRefAndUneqDisGeoTol;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepDimTol_GeoTolAndGeoTolWthDatRefAndUneqDisGeoTol;
		 StepDimTol_GeoTolAndGeoTolWthDatRefAndUneqDisGeoTol();

		/****************** GetUnequallyDisposedGeometricTolerance ******************/
		%feature("compactdefaultargs") GetUnequallyDisposedGeometricTolerance;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepDimTol_UnequallyDisposedGeometricTolerance>
") GetUnequallyDisposedGeometricTolerance;
		opencascade::handle<StepDimTol_UnequallyDisposedGeometricTolerance> GetUnequallyDisposedGeometricTolerance();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString
theMagnitude: StepBasic_MeasureWithUnit
theTolerancedShapeAspect: StepRepr_ShapeAspect
theGTWDR: StepDimTol_GeometricToleranceWithDatumReference
theType: StepDimTol_GeometricToleranceType
theUDGT: StepDimTol_UnequallyDisposedGeometricTolerance

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription, const opencascade::handle<StepBasic_MeasureWithUnit> & theMagnitude, const opencascade::handle<StepRepr_ShapeAspect> & theTolerancedShapeAspect, const opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> & theGTWDR, const StepDimTol_GeometricToleranceType theType, const opencascade::handle<StepDimTol_UnequallyDisposedGeometricTolerance> & theUDGT);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aMagnitude: StepBasic_MeasureWithUnit
aTolerancedShapeAspect: StepDimTol_GeometricToleranceTarget
aGTWDR: StepDimTol_GeometricToleranceWithDatumReference
theType: StepDimTol_GeometricToleranceType
theUDGT: StepDimTol_UnequallyDisposedGeometricTolerance

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_MeasureWithUnit> & aMagnitude, const StepDimTol_GeometricToleranceTarget & aTolerancedShapeAspect, const opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> & aGTWDR, const StepDimTol_GeometricToleranceType theType, const opencascade::handle<StepDimTol_UnequallyDisposedGeometricTolerance> & theUDGT);

		/****************** SetUnequallyDisposedGeometricTolerance ******************/
		%feature("compactdefaultargs") SetUnequallyDisposedGeometricTolerance;
		%feature("autodoc", "No available documentation.

Parameters
----------
theUDGT: StepDimTol_UnequallyDisposedGeometricTolerance

Returns
-------
None
") SetUnequallyDisposedGeometricTolerance;
		void SetUnequallyDisposedGeometricTolerance(const opencascade::handle<StepDimTol_UnequallyDisposedGeometricTolerance> & theUDGT);

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
		/****************** StepDimTol_GeoTolAndGeoTolWthMaxTol ******************/
		%feature("compactdefaultargs") StepDimTol_GeoTolAndGeoTolWthMaxTol;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepDimTol_GeoTolAndGeoTolWthMaxTol;
		 StepDimTol_GeoTolAndGeoTolWthMaxTol();

		/****************** GetMaxTolerance ******************/
		%feature("compactdefaultargs") GetMaxTolerance;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_LengthMeasureWithUnit>
") GetMaxTolerance;
		opencascade::handle<StepBasic_LengthMeasureWithUnit> GetMaxTolerance();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString
theMagnitude: StepBasic_MeasureWithUnit
theTolerancedShapeAspect: StepRepr_ShapeAspect
theGTWM: StepDimTol_GeometricToleranceWithModifiers
theMaxTol: StepBasic_LengthMeasureWithUnit
theType: StepDimTol_GeometricToleranceType

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription, const opencascade::handle<StepBasic_MeasureWithUnit> & theMagnitude, const opencascade::handle<StepRepr_ShapeAspect> & theTolerancedShapeAspect, const opencascade::handle<StepDimTol_GeometricToleranceWithModifiers> & theGTWM, const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theMaxTol, const StepDimTol_GeometricToleranceType theType);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aMagnitude: StepBasic_MeasureWithUnit
aTolerancedShapeAspect: StepDimTol_GeometricToleranceTarget
aGTWM: StepDimTol_GeometricToleranceWithModifiers
theMaxTol: StepBasic_LengthMeasureWithUnit
theType: StepDimTol_GeometricToleranceType

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_MeasureWithUnit> & aMagnitude, const StepDimTol_GeometricToleranceTarget & aTolerancedShapeAspect, const opencascade::handle<StepDimTol_GeometricToleranceWithModifiers> & aGTWM, const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theMaxTol, const StepDimTol_GeometricToleranceType theType);

		/****************** SetMaxTolerance ******************/
		%feature("compactdefaultargs") SetMaxTolerance;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMaxTol: StepBasic_LengthMeasureWithUnit

Returns
-------
None
") SetMaxTolerance;
		void SetMaxTolerance(opencascade::handle<StepBasic_LengthMeasureWithUnit> & theMaxTol);

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
		/****************** StepDimTol_GeometricToleranceWithDefinedAreaUnit ******************/
		%feature("compactdefaultargs") StepDimTol_GeometricToleranceWithDefinedAreaUnit;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepDimTol_GeometricToleranceWithDefinedAreaUnit;
		 StepDimTol_GeometricToleranceWithDefinedAreaUnit();

		/****************** AreaType ******************/
		%feature("compactdefaultargs") AreaType;
		%feature("autodoc", "Returns field areatype.

Returns
-------
StepDimTol_AreaUnitType
") AreaType;
		StepDimTol_AreaUnitType AreaType();

		/****************** HasSecondUnitSize ******************/
		%feature("compactdefaultargs") HasSecondUnitSize;
		%feature("autodoc", "Indicates if secondunitsize field exist.

Returns
-------
bool
") HasSecondUnitSize;
		Standard_Boolean HasSecondUnitSize();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString
theMagnitude: StepBasic_MeasureWithUnit
theTolerancedShapeAspect: StepDimTol_GeometricToleranceTarget
theUnitSize: StepBasic_LengthMeasureWithUnit
theAreaType: StepDimTol_AreaUnitType
theHasSecondUnitSize: bool
theSecondUnitSize: StepBasic_LengthMeasureWithUnit

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription, const opencascade::handle<StepBasic_MeasureWithUnit> & theMagnitude, const StepDimTol_GeometricToleranceTarget & theTolerancedShapeAspect, const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theUnitSize, const StepDimTol_AreaUnitType theAreaType, const Standard_Boolean theHasSecondUnitSize, const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theSecondUnitSize);

		/****************** SecondUnitSize ******************/
		%feature("compactdefaultargs") SecondUnitSize;
		%feature("autodoc", "Returns field secondunitsize.

Returns
-------
opencascade::handle<StepBasic_LengthMeasureWithUnit>
") SecondUnitSize;
		opencascade::handle<StepBasic_LengthMeasureWithUnit> SecondUnitSize();

		/****************** SetAreaType ******************/
		%feature("compactdefaultargs") SetAreaType;
		%feature("autodoc", "Set field areatype.

Parameters
----------
theAreaType: StepDimTol_AreaUnitType

Returns
-------
None
") SetAreaType;
		void SetAreaType(const StepDimTol_AreaUnitType theAreaType);

		/****************** SetSecondUnitSize ******************/
		%feature("compactdefaultargs") SetSecondUnitSize;
		%feature("autodoc", "Set field secondunitsize.

Parameters
----------
theSecondUnitSize: StepBasic_LengthMeasureWithUnit

Returns
-------
None
") SetSecondUnitSize;
		void SetSecondUnitSize(const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theSecondUnitSize);

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
		/****************** StepDimTol_GeometricToleranceWithMaximumTolerance ******************/
		%feature("compactdefaultargs") StepDimTol_GeometricToleranceWithMaximumTolerance;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepDimTol_GeometricToleranceWithMaximumTolerance;
		 StepDimTol_GeometricToleranceWithMaximumTolerance();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString
theMagnitude: StepBasic_MeasureWithUnit
theTolerancedShapeAspect: StepDimTol_GeometricToleranceTarget
theModifiers: StepDimTol_HArray1OfGeometricToleranceModifier
theUnitSize: StepBasic_LengthMeasureWithUnit

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription, const opencascade::handle<StepBasic_MeasureWithUnit> & theMagnitude, const StepDimTol_GeometricToleranceTarget & theTolerancedShapeAspect, const opencascade::handle<StepDimTol_HArray1OfGeometricToleranceModifier> & theModifiers, const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theUnitSize);

		/****************** MaximumUpperTolerance ******************/
		%feature("compactdefaultargs") MaximumUpperTolerance;
		%feature("autodoc", "Returns field maximumuppertolerance.

Returns
-------
opencascade::handle<StepBasic_LengthMeasureWithUnit>
") MaximumUpperTolerance;
		opencascade::handle<StepBasic_LengthMeasureWithUnit> MaximumUpperTolerance();

		/****************** SetMaximumUpperTolerance ******************/
		%feature("compactdefaultargs") SetMaximumUpperTolerance;
		%feature("autodoc", "Set field maximumuppertolerance.

Parameters
----------
theMaximumUpperTolerance: StepBasic_LengthMeasureWithUnit

Returns
-------
None
") SetMaximumUpperTolerance;
		void SetMaximumUpperTolerance(const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theMaximumUpperTolerance);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepDimTol_ParallelismTolerance;
		 StepDimTol_ParallelismTolerance();

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepDimTol_PerpendicularityTolerance;
		 StepDimTol_PerpendicularityTolerance();

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepDimTol_SymmetryTolerance;
		 StepDimTol_SymmetryTolerance();

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepDimTol_TotalRunoutTolerance;
		 StepDimTol_TotalRunoutTolerance();

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
