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
%define STEPDIMTOLDOCSTRING
"StepDimTol module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_stepdimtol.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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
#include<Resource_module.hxx>
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
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum StepDimTol_AreaUnitType {
	StepDimTol_Circular = 0,
	StepDimTol_Rectangular = 1,
	StepDimTol_Square = 2,
};

enum StepDimTol_DatumReferenceModifierType {
	StepDimTol_CircularOrCylindrical = 0,
	StepDimTol_Distance = 1,
	StepDimTol_Projected = 2,
	StepDimTol_Spherical = 3,
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

enum StepDimTol_LimitCondition {
	StepDimTol_MaximumMaterialCondition = 0,
	StepDimTol_LeastMaterialCondition = 1,
	StepDimTol_RegardlessOfFeatureSize = 2,
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

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class StepDimTol_AreaUnitType(IntEnum):
	StepDimTol_Circular = 0
	StepDimTol_Rectangular = 1
	StepDimTol_Square = 2
StepDimTol_Circular = StepDimTol_AreaUnitType.StepDimTol_Circular
StepDimTol_Rectangular = StepDimTol_AreaUnitType.StepDimTol_Rectangular
StepDimTol_Square = StepDimTol_AreaUnitType.StepDimTol_Square

class StepDimTol_DatumReferenceModifierType(IntEnum):
	StepDimTol_CircularOrCylindrical = 0
	StepDimTol_Distance = 1
	StepDimTol_Projected = 2
	StepDimTol_Spherical = 3
StepDimTol_CircularOrCylindrical = StepDimTol_DatumReferenceModifierType.StepDimTol_CircularOrCylindrical
StepDimTol_Distance = StepDimTol_DatumReferenceModifierType.StepDimTol_Distance
StepDimTol_Projected = StepDimTol_DatumReferenceModifierType.StepDimTol_Projected
StepDimTol_Spherical = StepDimTol_DatumReferenceModifierType.StepDimTol_Spherical

class StepDimTol_GeometricToleranceModifier(IntEnum):
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
StepDimTol_GTMAnyCrossSection = StepDimTol_GeometricToleranceModifier.StepDimTol_GTMAnyCrossSection
StepDimTol_GTMCommonZone = StepDimTol_GeometricToleranceModifier.StepDimTol_GTMCommonZone
StepDimTol_GTMEachRadialElement = StepDimTol_GeometricToleranceModifier.StepDimTol_GTMEachRadialElement
StepDimTol_GTMFreeState = StepDimTol_GeometricToleranceModifier.StepDimTol_GTMFreeState
StepDimTol_GTMLeastMaterialRequirement = StepDimTol_GeometricToleranceModifier.StepDimTol_GTMLeastMaterialRequirement
StepDimTol_GTMLineElement = StepDimTol_GeometricToleranceModifier.StepDimTol_GTMLineElement
StepDimTol_GTMMajorDiameter = StepDimTol_GeometricToleranceModifier.StepDimTol_GTMMajorDiameter
StepDimTol_GTMMaximumMaterialRequirement = StepDimTol_GeometricToleranceModifier.StepDimTol_GTMMaximumMaterialRequirement
StepDimTol_GTMMinorDiameter = StepDimTol_GeometricToleranceModifier.StepDimTol_GTMMinorDiameter
StepDimTol_GTMNotConvex = StepDimTol_GeometricToleranceModifier.StepDimTol_GTMNotConvex
StepDimTol_GTMPitchDiameter = StepDimTol_GeometricToleranceModifier.StepDimTol_GTMPitchDiameter
StepDimTol_GTMReciprocityRequirement = StepDimTol_GeometricToleranceModifier.StepDimTol_GTMReciprocityRequirement
StepDimTol_GTMSeparateRequirement = StepDimTol_GeometricToleranceModifier.StepDimTol_GTMSeparateRequirement
StepDimTol_GTMStatisticalTolerance = StepDimTol_GeometricToleranceModifier.StepDimTol_GTMStatisticalTolerance
StepDimTol_GTMTangentPlane = StepDimTol_GeometricToleranceModifier.StepDimTol_GTMTangentPlane

class StepDimTol_GeometricToleranceType(IntEnum):
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
StepDimTol_GTTAngularityTolerance = StepDimTol_GeometricToleranceType.StepDimTol_GTTAngularityTolerance
StepDimTol_GTTCircularRunoutTolerance = StepDimTol_GeometricToleranceType.StepDimTol_GTTCircularRunoutTolerance
StepDimTol_GTTCoaxialityTolerance = StepDimTol_GeometricToleranceType.StepDimTol_GTTCoaxialityTolerance
StepDimTol_GTTConcentricityTolerance = StepDimTol_GeometricToleranceType.StepDimTol_GTTConcentricityTolerance
StepDimTol_GTTCylindricityTolerance = StepDimTol_GeometricToleranceType.StepDimTol_GTTCylindricityTolerance
StepDimTol_GTTFlatnessTolerance = StepDimTol_GeometricToleranceType.StepDimTol_GTTFlatnessTolerance
StepDimTol_GTTLineProfileTolerance = StepDimTol_GeometricToleranceType.StepDimTol_GTTLineProfileTolerance
StepDimTol_GTTParallelismTolerance = StepDimTol_GeometricToleranceType.StepDimTol_GTTParallelismTolerance
StepDimTol_GTTPerpendicularityTolerance = StepDimTol_GeometricToleranceType.StepDimTol_GTTPerpendicularityTolerance
StepDimTol_GTTPositionTolerance = StepDimTol_GeometricToleranceType.StepDimTol_GTTPositionTolerance
StepDimTol_GTTRoundnessTolerance = StepDimTol_GeometricToleranceType.StepDimTol_GTTRoundnessTolerance
StepDimTol_GTTStraightnessTolerance = StepDimTol_GeometricToleranceType.StepDimTol_GTTStraightnessTolerance
StepDimTol_GTTSurfaceProfileTolerance = StepDimTol_GeometricToleranceType.StepDimTol_GTTSurfaceProfileTolerance
StepDimTol_GTTSymmetryTolerance = StepDimTol_GeometricToleranceType.StepDimTol_GTTSymmetryTolerance
StepDimTol_GTTTotalRunoutTolerance = StepDimTol_GeometricToleranceType.StepDimTol_GTTTotalRunoutTolerance

class StepDimTol_LimitCondition(IntEnum):
	StepDimTol_MaximumMaterialCondition = 0
	StepDimTol_LeastMaterialCondition = 1
	StepDimTol_RegardlessOfFeatureSize = 2
StepDimTol_MaximumMaterialCondition = StepDimTol_LimitCondition.StepDimTol_MaximumMaterialCondition
StepDimTol_LeastMaterialCondition = StepDimTol_LimitCondition.StepDimTol_LeastMaterialCondition
StepDimTol_RegardlessOfFeatureSize = StepDimTol_LimitCondition.StepDimTol_RegardlessOfFeatureSize

class StepDimTol_SimpleDatumReferenceModifier(IntEnum):
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
StepDimTol_SDRMAnyCrossSection = StepDimTol_SimpleDatumReferenceModifier.StepDimTol_SDRMAnyCrossSection
StepDimTol_SDRMAnyLongitudinalSection = StepDimTol_SimpleDatumReferenceModifier.StepDimTol_SDRMAnyLongitudinalSection
StepDimTol_SDRMBasic = StepDimTol_SimpleDatumReferenceModifier.StepDimTol_SDRMBasic
StepDimTol_SDRMContactingFeature = StepDimTol_SimpleDatumReferenceModifier.StepDimTol_SDRMContactingFeature
StepDimTol_SDRMDegreeOfFreedomConstraintU = StepDimTol_SimpleDatumReferenceModifier.StepDimTol_SDRMDegreeOfFreedomConstraintU
StepDimTol_SDRMDegreeOfFreedomConstraintV = StepDimTol_SimpleDatumReferenceModifier.StepDimTol_SDRMDegreeOfFreedomConstraintV
StepDimTol_SDRMDegreeOfFreedomConstraintW = StepDimTol_SimpleDatumReferenceModifier.StepDimTol_SDRMDegreeOfFreedomConstraintW
StepDimTol_SDRMDegreeOfFreedomConstraintX = StepDimTol_SimpleDatumReferenceModifier.StepDimTol_SDRMDegreeOfFreedomConstraintX
StepDimTol_SDRMDegreeOfFreedomConstraintY = StepDimTol_SimpleDatumReferenceModifier.StepDimTol_SDRMDegreeOfFreedomConstraintY
StepDimTol_SDRMDegreeOfFreedomConstraintZ = StepDimTol_SimpleDatumReferenceModifier.StepDimTol_SDRMDegreeOfFreedomConstraintZ
StepDimTol_SDRMDistanceVariable = StepDimTol_SimpleDatumReferenceModifier.StepDimTol_SDRMDistanceVariable
StepDimTol_SDRMFreeState = StepDimTol_SimpleDatumReferenceModifier.StepDimTol_SDRMFreeState
StepDimTol_SDRMLeastMaterialRequirement = StepDimTol_SimpleDatumReferenceModifier.StepDimTol_SDRMLeastMaterialRequirement
StepDimTol_SDRMLine = StepDimTol_SimpleDatumReferenceModifier.StepDimTol_SDRMLine
StepDimTol_SDRMMajorDiameter = StepDimTol_SimpleDatumReferenceModifier.StepDimTol_SDRMMajorDiameter
StepDimTol_SDRMMaximumMaterialRequirement = StepDimTol_SimpleDatumReferenceModifier.StepDimTol_SDRMMaximumMaterialRequirement
StepDimTol_SDRMMinorDiameter = StepDimTol_SimpleDatumReferenceModifier.StepDimTol_SDRMMinorDiameter
StepDimTol_SDRMOrientation = StepDimTol_SimpleDatumReferenceModifier.StepDimTol_SDRMOrientation
StepDimTol_SDRMPitchDiameter = StepDimTol_SimpleDatumReferenceModifier.StepDimTol_SDRMPitchDiameter
StepDimTol_SDRMPlane = StepDimTol_SimpleDatumReferenceModifier.StepDimTol_SDRMPlane
StepDimTol_SDRMPoint = StepDimTol_SimpleDatumReferenceModifier.StepDimTol_SDRMPoint
StepDimTol_SDRMTranslation = StepDimTol_SimpleDatumReferenceModifier.StepDimTol_SDRMTranslation
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
%wrap_handle(StepDimTol_HArray1OfDatumReference)
%wrap_handle(StepDimTol_HArray1OfDatumReferenceCompartment)
%wrap_handle(StepDimTol_HArray1OfDatumReferenceElement)
%wrap_handle(StepDimTol_HArray1OfDatumReferenceModifier)
%wrap_handle(StepDimTol_HArray1OfDatumSystemOrReference)
%wrap_handle(StepDimTol_HArray1OfGeometricToleranceModifier)
%wrap_handle(StepDimTol_HArray1OfToleranceZoneTarget)
/* end handles declaration */

/* templates */
%template(StepDimTol_Array1OfDatumReference) NCollection_Array1<opencascade::handle<StepDimTol_DatumReference>>;
Array1ExtendIter(opencascade::handle<StepDimTol_DatumReference>)

%template(StepDimTol_Array1OfDatumReferenceCompartment) NCollection_Array1<opencascade::handle<StepDimTol_DatumReferenceCompartment>>;
Array1ExtendIter(opencascade::handle<StepDimTol_DatumReferenceCompartment>)

%template(StepDimTol_Array1OfDatumReferenceElement) NCollection_Array1<opencascade::handle<StepDimTol_DatumReferenceElement>>;
Array1ExtendIter(opencascade::handle<StepDimTol_DatumReferenceElement>)

%template(StepDimTol_Array1OfDatumReferenceModifier) NCollection_Array1<StepDimTol_DatumReferenceModifier>;
Array1ExtendIter(StepDimTol_DatumReferenceModifier)

%template(StepDimTol_Array1OfDatumSystemOrReference) NCollection_Array1<StepDimTol_DatumSystemOrReference>;
Array1ExtendIter(StepDimTol_DatumSystemOrReference)

%template(StepDimTol_Array1OfToleranceZoneTarget) NCollection_Array1<StepDimTol_ToleranceZoneTarget>;
Array1ExtendIter(StepDimTol_ToleranceZoneTarget)

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
		/****** StepDimTol_CommonDatum::StepDimTol_CommonDatum ******/
		/****** md5 signature: 3ae65d19239cc3fc13da253b67be329c ******/
		%feature("compactdefaultargs") StepDimTol_CommonDatum;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepDimTol_CommonDatum;
		 StepDimTol_CommonDatum();

		/****** StepDimTol_CommonDatum::Datum ******/
		/****** md5 signature: b5ccd542859a254d860a7d4bdb9674b8 ******/
		%feature("compactdefaultargs") Datum;
		%feature("autodoc", "Return
-------
opencascade::handle<StepDimTol_Datum>

Description
-----------
Returns data for supertype Datum.
") Datum;
		opencascade::handle<StepDimTol_Datum> Datum();

		/****** StepDimTol_CommonDatum::Init ******/
		/****** md5 signature: 473fe144d3a5577fc9e55d9368b47d67 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theShapeAspect_Name, const opencascade::handle<TCollection_HAsciiString> & theShapeAspect_Description, const opencascade::handle<StepRepr_ProductDefinitionShape> & theShapeAspect_OfShape, const StepData_Logical theShapeAspect_ProductDefinitional, const opencascade::handle<TCollection_HAsciiString> & theDatum_Name, const opencascade::handle<TCollection_HAsciiString> & theDatum_Description, const opencascade::handle<StepRepr_ProductDefinitionShape> & theDatum_OfShape, const StepData_Logical theDatum_ProductDefinitional, const opencascade::handle<TCollection_HAsciiString> & theDatum_Identification);

		/****** StepDimTol_CommonDatum::SetDatum ******/
		/****** md5 signature: 5f36ebad5966e7f7075402272ce06035 ******/
		%feature("compactdefaultargs") SetDatum;
		%feature("autodoc", "
Parameters
----------
theDatum: StepDimTol_Datum

Return
-------
None

Description
-----------
Set data for supertype Datum.
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
		/****** StepDimTol_Datum::StepDimTol_Datum ******/
		/****** md5 signature: 1c0194487effbd7e6f33cc3000b337f0 ******/
		%feature("compactdefaultargs") StepDimTol_Datum;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepDimTol_Datum;
		 StepDimTol_Datum();

		/****** StepDimTol_Datum::Identification ******/
		/****** md5 signature: a05e926014d355b48d8e07605a4a41a8 ******/
		%feature("compactdefaultargs") Identification;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Identification.
") Identification;
		opencascade::handle<TCollection_HAsciiString> Identification();

		/****** StepDimTol_Datum::Init ******/
		/****** md5 signature: 2a7b7c143ced8fef03c40f5920de6501 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theShapeAspect_Name: TCollection_HAsciiString
theShapeAspect_Description: TCollection_HAsciiString
theShapeAspect_OfShape: StepRepr_ProductDefinitionShape
theShapeAspect_ProductDefinitional: StepData_Logical
theIdentification: TCollection_HAsciiString

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theShapeAspect_Name, const opencascade::handle<TCollection_HAsciiString> & theShapeAspect_Description, const opencascade::handle<StepRepr_ProductDefinitionShape> & theShapeAspect_OfShape, const StepData_Logical theShapeAspect_ProductDefinitional, const opencascade::handle<TCollection_HAsciiString> & theIdentification);

		/****** StepDimTol_Datum::SetIdentification ******/
		/****** md5 signature: 4eb5c50f395f6ea8cd3f13065775688f ******/
		%feature("compactdefaultargs") SetIdentification;
		%feature("autodoc", "
Parameters
----------
theIdentification: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Identification.
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
		/****** StepDimTol_DatumFeature::StepDimTol_DatumFeature ******/
		/****** md5 signature: e92fa764077df2c3db94cd950b78c5a7 ******/
		%feature("compactdefaultargs") StepDimTol_DatumFeature;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
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
		/****** StepDimTol_DatumOrCommonDatum::StepDimTol_DatumOrCommonDatum ******/
		/****** md5 signature: bf7200f0da1f495a7deb55fcfe0c5f03 ******/
		%feature("compactdefaultargs") StepDimTol_DatumOrCommonDatum;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a DatumOrCommonDatum select type.
") StepDimTol_DatumOrCommonDatum;
		 StepDimTol_DatumOrCommonDatum();

		/****** StepDimTol_DatumOrCommonDatum::CaseNum ******/
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
Recognizes a DatumOrCommonDatum Kind Entity that is: 1 -> Datum 2 -> CommonDatumList 0 else.
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepDimTol_DatumOrCommonDatum::CommonDatumList ******/
		/****** md5 signature: 50f2633c3aa6765c14d7fe517a68760b ******/
		%feature("compactdefaultargs") CommonDatumList;
		%feature("autodoc", "Return
-------
opencascade::handle<StepDimTol_HArray1OfDatumReferenceElement>

Description
-----------
returns Value as a CommonDatumList (Null if another type).
") CommonDatumList;
		opencascade::handle<StepDimTol_HArray1OfDatumReferenceElement> CommonDatumList();

		/****** StepDimTol_DatumOrCommonDatum::Datum ******/
		/****** md5 signature: b5ccd542859a254d860a7d4bdb9674b8 ******/
		%feature("compactdefaultargs") Datum;
		%feature("autodoc", "Return
-------
opencascade::handle<StepDimTol_Datum>

Description
-----------
returns Value as a Datum (Null if another type).
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
		/****** StepDimTol_DatumReference::StepDimTol_DatumReference ******/
		/****** md5 signature: fd38376d4ca4d980d9c9321442bbfc7a ******/
		%feature("compactdefaultargs") StepDimTol_DatumReference;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepDimTol_DatumReference;
		 StepDimTol_DatumReference();

		/****** StepDimTol_DatumReference::Init ******/
		/****** md5 signature: 74e77c116f948c54fe8f17a20f29fbe4 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
thePrecedence: int
theReferencedDatum: StepDimTol_Datum

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const Standard_Integer thePrecedence, const opencascade::handle<StepDimTol_Datum> & theReferencedDatum);

		/****** StepDimTol_DatumReference::Precedence ******/
		/****** md5 signature: 0e821eba8b09b433d0d4114d07b4ca19 ******/
		%feature("compactdefaultargs") Precedence;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns field Precedence.
") Precedence;
		Standard_Integer Precedence();

		/****** StepDimTol_DatumReference::ReferencedDatum ******/
		/****** md5 signature: 496840bcd038318afe36cad891eff6e1 ******/
		%feature("compactdefaultargs") ReferencedDatum;
		%feature("autodoc", "Return
-------
opencascade::handle<StepDimTol_Datum>

Description
-----------
Returns field ReferencedDatum.
") ReferencedDatum;
		opencascade::handle<StepDimTol_Datum> ReferencedDatum();

		/****** StepDimTol_DatumReference::SetPrecedence ******/
		/****** md5 signature: d7528dfc5532376290fe4813f1e42240 ******/
		%feature("compactdefaultargs") SetPrecedence;
		%feature("autodoc", "
Parameters
----------
thePrecedence: int

Return
-------
None

Description
-----------
Set field Precedence.
") SetPrecedence;
		void SetPrecedence(const Standard_Integer thePrecedence);

		/****** StepDimTol_DatumReference::SetReferencedDatum ******/
		/****** md5 signature: 5e6fb5b78ae352c6af96a123dc53b0f3 ******/
		%feature("compactdefaultargs") SetReferencedDatum;
		%feature("autodoc", "
Parameters
----------
theReferencedDatum: StepDimTol_Datum

Return
-------
None

Description
-----------
Set field ReferencedDatum.
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
		/****** StepDimTol_DatumReferenceModifier::StepDimTol_DatumReferenceModifier ******/
		/****** md5 signature: 7347254024aed2a0f42a2027effa6cfa ******/
		%feature("compactdefaultargs") StepDimTol_DatumReferenceModifier;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a DatumReferenceModifier select type.
") StepDimTol_DatumReferenceModifier;
		 StepDimTol_DatumReferenceModifier();

		/****** StepDimTol_DatumReferenceModifier::CaseNum ******/
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
Recognizes a DatumReferenceModifier Kind Entity that is: 1 -> DatumReferenceModifierWithValue 2 -> SimpleDatumReferenceModifierMember 0 else.
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepDimTol_DatumReferenceModifier::DatumReferenceModifierWithValue ******/
		/****** md5 signature: fd1ece65a7468fcf126d94d121105a45 ******/
		%feature("compactdefaultargs") DatumReferenceModifierWithValue;
		%feature("autodoc", "Return
-------
opencascade::handle<StepDimTol_DatumReferenceModifierWithValue>

Description
-----------
returns Value as a DatumReferenceModifierWithValue (Null if another type).
") DatumReferenceModifierWithValue;
		opencascade::handle<StepDimTol_DatumReferenceModifierWithValue> DatumReferenceModifierWithValue();

		/****** StepDimTol_DatumReferenceModifier::SimpleDatumReferenceModifierMember ******/
		/****** md5 signature: 42756dc126defefe44fa1fd44c347860 ******/
		%feature("compactdefaultargs") SimpleDatumReferenceModifierMember;
		%feature("autodoc", "Return
-------
opencascade::handle<StepDimTol_SimpleDatumReferenceModifierMember>

Description
-----------
returns Value as a SimpleDatumReferenceModifierMember (Null if another type).
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
		/****** StepDimTol_DatumReferenceModifierWithValue::StepDimTol_DatumReferenceModifierWithValue ******/
		/****** md5 signature: e946a549b8aa6128a535fad9a65a3272 ******/
		%feature("compactdefaultargs") StepDimTol_DatumReferenceModifierWithValue;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepDimTol_DatumReferenceModifierWithValue;
		 StepDimTol_DatumReferenceModifierWithValue();

		/****** StepDimTol_DatumReferenceModifierWithValue::Init ******/
		/****** md5 signature: 454b0dd411d46b08fad44a51fe8c78cb ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theModifierType: StepDimTol_DatumReferenceModifierType
theModifierValue: StepBasic_LengthMeasureWithUnit

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const StepDimTol_DatumReferenceModifierType & theModifierType, const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theModifierValue);

		/****** StepDimTol_DatumReferenceModifierWithValue::ModifierType ******/
		/****** md5 signature: e20ff69d75b21a0e5c32d06519e6cf92 ******/
		%feature("compactdefaultargs") ModifierType;
		%feature("autodoc", "Return
-------
StepDimTol_DatumReferenceModifierType

Description
-----------
Returns field ModifierType.
") ModifierType;
		StepDimTol_DatumReferenceModifierType ModifierType();

		/****** StepDimTol_DatumReferenceModifierWithValue::ModifierValue ******/
		/****** md5 signature: b62890d4a5be56a5de81480d722b8cad ******/
		%feature("compactdefaultargs") ModifierValue;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_LengthMeasureWithUnit>

Description
-----------
Returns field ModifierValue.
") ModifierValue;
		opencascade::handle<StepBasic_LengthMeasureWithUnit> ModifierValue();

		/****** StepDimTol_DatumReferenceModifierWithValue::SetModifierType ******/
		/****** md5 signature: a3a5c27a810eabd9232ae188fe84e4b7 ******/
		%feature("compactdefaultargs") SetModifierType;
		%feature("autodoc", "
Parameters
----------
theModifierType: StepDimTol_DatumReferenceModifierType

Return
-------
None

Description
-----------
Set field ModifierType.
") SetModifierType;
		void SetModifierType(const StepDimTol_DatumReferenceModifierType & theModifierType);

		/****** StepDimTol_DatumReferenceModifierWithValue::SetModifierValue ******/
		/****** md5 signature: c9888ffc21cae24e74d3f4c2bd5fee90 ******/
		%feature("compactdefaultargs") SetModifierValue;
		%feature("autodoc", "
Parameters
----------
theModifierValue: StepBasic_LengthMeasureWithUnit

Return
-------
None

Description
-----------
Set field ModifierValue.
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
		/****** StepDimTol_DatumSystem::StepDimTol_DatumSystem ******/
		/****** md5 signature: 6868d08dbc098babf003afdd69b122f2 ******/
		%feature("compactdefaultargs") StepDimTol_DatumSystem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepDimTol_DatumSystem;
		 StepDimTol_DatumSystem();

		/****** StepDimTol_DatumSystem::Constituents ******/
		/****** md5 signature: 603c6d3f036e8dbf744632e60ffbbe95 ******/
		%feature("compactdefaultargs") Constituents;
		%feature("autodoc", "Return
-------
opencascade::handle<StepDimTol_HArray1OfDatumReferenceCompartment>

Description
-----------
Returns field Constituents.
") Constituents;
		opencascade::handle<StepDimTol_HArray1OfDatumReferenceCompartment> Constituents();

		/****** StepDimTol_DatumSystem::ConstituentsValue ******/
		/****** md5 signature: 98a90152edbe4f2ec67d87304e6bf0da ******/
		%feature("compactdefaultargs") ConstituentsValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<StepDimTol_DatumReferenceCompartment>

Description
-----------
Returns Constituents with the given number.
") ConstituentsValue;
		opencascade::handle<StepDimTol_DatumReferenceCompartment> ConstituentsValue(const Standard_Integer num);

		/****** StepDimTol_DatumSystem::ConstituentsValue ******/
		/****** md5 signature: a8ca9b5b4f738cfe48f14dcd39df8ee6 ******/
		%feature("compactdefaultargs") ConstituentsValue;
		%feature("autodoc", "
Parameters
----------
num: int
theItem: StepDimTol_DatumReferenceCompartment

Return
-------
None

Description
-----------
Sets Constituents with given number.
") ConstituentsValue;
		void ConstituentsValue(const Standard_Integer num, const opencascade::handle<StepDimTol_DatumReferenceCompartment> & theItem);

		/****** StepDimTol_DatumSystem::Init ******/
		/****** md5 signature: 85fbd700167ff957979bb3c12656af2d ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString
theOfShape: StepRepr_ProductDefinitionShape
theProductDefinitional: StepData_Logical
theConstituents: StepDimTol_HArray1OfDatumReferenceCompartment

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription, const opencascade::handle<StepRepr_ProductDefinitionShape> & theOfShape, const StepData_Logical theProductDefinitional, const opencascade::handle<StepDimTol_HArray1OfDatumReferenceCompartment> & theConstituents);

		/****** StepDimTol_DatumSystem::NbConstituents ******/
		/****** md5 signature: 7e0a32a473debb309b4368936c470615 ******/
		%feature("compactdefaultargs") NbConstituents;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of Constituents.
") NbConstituents;
		Standard_Integer NbConstituents();

		/****** StepDimTol_DatumSystem::SetConstituents ******/
		/****** md5 signature: 3a6bb4e5df9bdc44c5a4a22a25487d80 ******/
		%feature("compactdefaultargs") SetConstituents;
		%feature("autodoc", "
Parameters
----------
theConstituents: StepDimTol_HArray1OfDatumReferenceCompartment

Return
-------
None

Description
-----------
Set field Constituents.
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
		/****** StepDimTol_DatumSystemOrReference::StepDimTol_DatumSystemOrReference ******/
		/****** md5 signature: 37f91a0afb9bc280f6683c7790be9af3 ******/
		%feature("compactdefaultargs") StepDimTol_DatumSystemOrReference;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a DatumSystemOrReference select type.
") StepDimTol_DatumSystemOrReference;
		 StepDimTol_DatumSystemOrReference();

		/****** StepDimTol_DatumSystemOrReference::CaseNum ******/
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
Recognizes a DatumSystemOrReference Kind Entity that is: 1 -> DatumSystem 2 -> DatumReference 0 else.
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepDimTol_DatumSystemOrReference::DatumReference ******/
		/****** md5 signature: 1c43b6d592b7ea6a628c66c6a0b6d7af ******/
		%feature("compactdefaultargs") DatumReference;
		%feature("autodoc", "Return
-------
opencascade::handle<StepDimTol_DatumReference>

Description
-----------
returns Value as a DatumReference (Null if another type).
") DatumReference;
		opencascade::handle<StepDimTol_DatumReference> DatumReference();

		/****** StepDimTol_DatumSystemOrReference::DatumSystem ******/
		/****** md5 signature: d8356927f7bdf46fbd91b6438e3280dc ******/
		%feature("compactdefaultargs") DatumSystem;
		%feature("autodoc", "Return
-------
opencascade::handle<StepDimTol_DatumSystem>

Description
-----------
returns Value as a DatumSystem (Null if another type).
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
		/****** StepDimTol_DatumTarget::StepDimTol_DatumTarget ******/
		/****** md5 signature: 171abe52b5763af03471133e8af150d5 ******/
		%feature("compactdefaultargs") StepDimTol_DatumTarget;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepDimTol_DatumTarget;
		 StepDimTol_DatumTarget();

		/****** StepDimTol_DatumTarget::Init ******/
		/****** md5 signature: 6f6a73d360d49d42aebc3b9851dd92d0 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theShapeAspect_Name: TCollection_HAsciiString
theShapeAspect_Description: TCollection_HAsciiString
theShapeAspect_OfShape: StepRepr_ProductDefinitionShape
theShapeAspect_ProductDefinitional: StepData_Logical
theTargetId: TCollection_HAsciiString

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theShapeAspect_Name, const opencascade::handle<TCollection_HAsciiString> & theShapeAspect_Description, const opencascade::handle<StepRepr_ProductDefinitionShape> & theShapeAspect_OfShape, const StepData_Logical theShapeAspect_ProductDefinitional, const opencascade::handle<TCollection_HAsciiString> & theTargetId);

		/****** StepDimTol_DatumTarget::SetTargetId ******/
		/****** md5 signature: 096ce57287760e5fd21c41242e43d94c ******/
		%feature("compactdefaultargs") SetTargetId;
		%feature("autodoc", "
Parameters
----------
theTargetId: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field TargetId.
") SetTargetId;
		void SetTargetId(const opencascade::handle<TCollection_HAsciiString> & theTargetId);

		/****** StepDimTol_DatumTarget::TargetId ******/
		/****** md5 signature: 85959c5e15d6f0223ddf0d621ed23488 ******/
		%feature("compactdefaultargs") TargetId;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field TargetId.
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
		/****** StepDimTol_GeneralDatumReference::StepDimTol_GeneralDatumReference ******/
		/****** md5 signature: 46106ad1539553c7a90dbdde97d1aefa ******/
		%feature("compactdefaultargs") StepDimTol_GeneralDatumReference;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepDimTol_GeneralDatumReference;
		 StepDimTol_GeneralDatumReference();

		/****** StepDimTol_GeneralDatumReference::Base ******/
		/****** md5 signature: 68a34dcbf12fb6c9f9e0be83488a3e2d ******/
		%feature("compactdefaultargs") Base;
		%feature("autodoc", "Return
-------
StepDimTol_DatumOrCommonDatum

Description
-----------
Returns field Base.
") Base;
		StepDimTol_DatumOrCommonDatum Base();

		/****** StepDimTol_GeneralDatumReference::HasModifiers ******/
		/****** md5 signature: 6b878e7f71c1776a334d6641401b1705 ******/
		%feature("compactdefaultargs") HasModifiers;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Indicates is field Modifiers exist.
") HasModifiers;
		Standard_Boolean HasModifiers();

		/****** StepDimTol_GeneralDatumReference::Init ******/
		/****** md5 signature: a83f1b028fde8bf4e158b9044d147fcb ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString
theOfShape: StepRepr_ProductDefinitionShape
theProductDefinitional: StepData_Logical
theBase: StepDimTol_DatumOrCommonDatum
theHasModifiers: bool
theModifiers: StepDimTol_HArray1OfDatumReferenceModifier

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription, const opencascade::handle<StepRepr_ProductDefinitionShape> & theOfShape, const StepData_Logical theProductDefinitional, const StepDimTol_DatumOrCommonDatum & theBase, const Standard_Boolean theHasModifiers, const opencascade::handle<StepDimTol_HArray1OfDatumReferenceModifier> & theModifiers);

		/****** StepDimTol_GeneralDatumReference::Modifiers ******/
		/****** md5 signature: 0a92725a19badf2c8bdb144ef87d54cb ******/
		%feature("compactdefaultargs") Modifiers;
		%feature("autodoc", "Return
-------
opencascade::handle<StepDimTol_HArray1OfDatumReferenceModifier>

Description
-----------
Returns field Modifiers.
") Modifiers;
		opencascade::handle<StepDimTol_HArray1OfDatumReferenceModifier> Modifiers();

		/****** StepDimTol_GeneralDatumReference::ModifiersValue ******/
		/****** md5 signature: be75d7d5af47a0dd03d46d1472603bd7 ******/
		%feature("compactdefaultargs") ModifiersValue;
		%feature("autodoc", "
Parameters
----------
theNum: int

Return
-------
StepDimTol_DatumReferenceModifier

Description
-----------
Returns Modifiers with the given number.
") ModifiersValue;
		StepDimTol_DatumReferenceModifier ModifiersValue(const Standard_Integer theNum);

		/****** StepDimTol_GeneralDatumReference::ModifiersValue ******/
		/****** md5 signature: 343049fab7d440fa757e02b776469762 ******/
		%feature("compactdefaultargs") ModifiersValue;
		%feature("autodoc", "
Parameters
----------
theNum: int
theItem: StepDimTol_DatumReferenceModifier

Return
-------
None

Description
-----------
Sets Modifiers with given number.
") ModifiersValue;
		void ModifiersValue(const Standard_Integer theNum, const StepDimTol_DatumReferenceModifier & theItem);

		/****** StepDimTol_GeneralDatumReference::NbModifiers ******/
		/****** md5 signature: 1cbfb9180169154c165f1c4fedd82ad9 ******/
		%feature("compactdefaultargs") NbModifiers;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of Modifiers.
") NbModifiers;
		Standard_Integer NbModifiers();

		/****** StepDimTol_GeneralDatumReference::SetBase ******/
		/****** md5 signature: dac13489b0dfceabb8613c41ae9fc7bd ******/
		%feature("compactdefaultargs") SetBase;
		%feature("autodoc", "
Parameters
----------
theBase: StepDimTol_DatumOrCommonDatum

Return
-------
None

Description
-----------
Set field Base.
") SetBase;
		void SetBase(const StepDimTol_DatumOrCommonDatum & theBase);

		/****** StepDimTol_GeneralDatumReference::SetModifiers ******/
		/****** md5 signature: 36dced0f8695541a3658d1bee4f32f19 ******/
		%feature("compactdefaultargs") SetModifiers;
		%feature("autodoc", "
Parameters
----------
theModifiers: StepDimTol_HArray1OfDatumReferenceModifier

Return
-------
None

Description
-----------
Set field Modifiers.
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
		/****** StepDimTol_GeometricTolerance::StepDimTol_GeometricTolerance ******/
		/****** md5 signature: 3ba3fe0250ed1ace5f53bd0002e49e7b ******/
		%feature("compactdefaultargs") StepDimTol_GeometricTolerance;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepDimTol_GeometricTolerance;
		 StepDimTol_GeometricTolerance();

		/****** StepDimTol_GeometricTolerance::Description ******/
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

		/****** StepDimTol_GeometricTolerance::Init ******/
		/****** md5 signature: 2d504fbe80196e1732625187e4aa4800 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString
theMagnitude: StepBasic_MeasureWithUnit
theTolerancedShapeAspect: StepRepr_ShapeAspect

Return
-------
None

Description
-----------
Initialize all fields (own and inherited) AP214.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription, const opencascade::handle<StepBasic_MeasureWithUnit> & theMagnitude, const opencascade::handle<StepRepr_ShapeAspect> & theTolerancedShapeAspect);

		/****** StepDimTol_GeometricTolerance::Init ******/
		/****** md5 signature: 3f7401e5777af8d4a334d6d5ba9f25a6 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString
theMagnitude: StepBasic_MeasureWithUnit
theTolerancedShapeAspect: StepDimTol_GeometricToleranceTarget

Return
-------
None

Description
-----------
Initialize all fields (own and inherited) AP242.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription, const opencascade::handle<StepBasic_MeasureWithUnit> & theMagnitude, const StepDimTol_GeometricToleranceTarget & theTolerancedShapeAspect);

		/****** StepDimTol_GeometricTolerance::Magnitude ******/
		/****** md5 signature: 85d6c408b9b2bcb184217172ef454b05 ******/
		%feature("compactdefaultargs") Magnitude;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_MeasureWithUnit>

Description
-----------
Returns field Magnitude.
") Magnitude;
		opencascade::handle<StepBasic_MeasureWithUnit> Magnitude();

		/****** StepDimTol_GeometricTolerance::Name ******/
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

		/****** StepDimTol_GeometricTolerance::SetDescription ******/
		/****** md5 signature: 59f340c3142d11691037bc339f2da77f ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
theDescription: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Description.
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & theDescription);

		/****** StepDimTol_GeometricTolerance::SetMagnitude ******/
		/****** md5 signature: 3c0fefc2c55c073474706761e78f5326 ******/
		%feature("compactdefaultargs") SetMagnitude;
		%feature("autodoc", "
Parameters
----------
theMagnitude: StepBasic_MeasureWithUnit

Return
-------
None

Description
-----------
Set field Magnitude.
") SetMagnitude;
		void SetMagnitude(const opencascade::handle<StepBasic_MeasureWithUnit> & theMagnitude);

		/****** StepDimTol_GeometricTolerance::SetName ******/
		/****** md5 signature: a74c500474873878f514b4e36e03588d ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Name.
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & theName);

		/****** StepDimTol_GeometricTolerance::SetTolerancedShapeAspect ******/
		/****** md5 signature: 53e5893fc56e5985a50c97f57a1bc679 ******/
		%feature("compactdefaultargs") SetTolerancedShapeAspect;
		%feature("autodoc", "
Parameters
----------
theTolerancedShapeAspect: StepRepr_ShapeAspect

Return
-------
None

Description
-----------
Set field TolerancedShapeAspect AP214.
") SetTolerancedShapeAspect;
		void SetTolerancedShapeAspect(const opencascade::handle<StepRepr_ShapeAspect> & theTolerancedShapeAspect);

		/****** StepDimTol_GeometricTolerance::SetTolerancedShapeAspect ******/
		/****** md5 signature: b699fd313b79e07b13ec76937397a1d6 ******/
		%feature("compactdefaultargs") SetTolerancedShapeAspect;
		%feature("autodoc", "
Parameters
----------
theTolerancedShapeAspect: StepDimTol_GeometricToleranceTarget

Return
-------
None

Description
-----------
Set field TolerancedShapeAspect AP242.
") SetTolerancedShapeAspect;
		void SetTolerancedShapeAspect(const StepDimTol_GeometricToleranceTarget & theTolerancedShapeAspect);

		/****** StepDimTol_GeometricTolerance::TolerancedShapeAspect ******/
		/****** md5 signature: 5ed6a452d8a04af040af67a625b8e17b ******/
		%feature("compactdefaultargs") TolerancedShapeAspect;
		%feature("autodoc", "Return
-------
StepDimTol_GeometricToleranceTarget

Description
-----------
Returns field TolerancedShapeAspect Note: in AP214(203) type of this attribute can be only StepRepr_ShapeAspect.
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
		/****** StepDimTol_GeometricToleranceRelationship::StepDimTol_GeometricToleranceRelationship ******/
		/****** md5 signature: 99e1e00e66bad547e83d283ab020977b ******/
		%feature("compactdefaultargs") StepDimTol_GeometricToleranceRelationship;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepDimTol_GeometricToleranceRelationship;
		 StepDimTol_GeometricToleranceRelationship();

		/****** StepDimTol_GeometricToleranceRelationship::Description ******/
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

		/****** StepDimTol_GeometricToleranceRelationship::Init ******/
		/****** md5 signature: dab92bd6929f4475f17fee8ac47a429a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString
theRelatingGeometricTolerance: StepDimTol_GeometricTolerance
theRelatedGeometricTolerance: StepDimTol_GeometricTolerance

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription, const opencascade::handle<StepDimTol_GeometricTolerance> & theRelatingGeometricTolerance, const opencascade::handle<StepDimTol_GeometricTolerance> & theRelatedGeometricTolerance);

		/****** StepDimTol_GeometricToleranceRelationship::Name ******/
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

		/****** StepDimTol_GeometricToleranceRelationship::RelatedGeometricTolerance ******/
		/****** md5 signature: e61d954fa85db99d2f1b99f477c17e9a ******/
		%feature("compactdefaultargs") RelatedGeometricTolerance;
		%feature("autodoc", "Return
-------
opencascade::handle<StepDimTol_GeometricTolerance>

Description
-----------
Returns field RelatedGeometricTolerance.
") RelatedGeometricTolerance;
		opencascade::handle<StepDimTol_GeometricTolerance> RelatedGeometricTolerance();

		/****** StepDimTol_GeometricToleranceRelationship::RelatingGeometricTolerance ******/
		/****** md5 signature: 4f9b8e45fe31106ed97e828f6d70e10a ******/
		%feature("compactdefaultargs") RelatingGeometricTolerance;
		%feature("autodoc", "Return
-------
opencascade::handle<StepDimTol_GeometricTolerance>

Description
-----------
Returns field RelatingGeometricTolerance.
") RelatingGeometricTolerance;
		opencascade::handle<StepDimTol_GeometricTolerance> RelatingGeometricTolerance();

		/****** StepDimTol_GeometricToleranceRelationship::SetDescription ******/
		/****** md5 signature: 59f340c3142d11691037bc339f2da77f ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
theDescription: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Description.
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & theDescription);

		/****** StepDimTol_GeometricToleranceRelationship::SetName ******/
		/****** md5 signature: a74c500474873878f514b4e36e03588d ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Name.
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & theName);

		/****** StepDimTol_GeometricToleranceRelationship::SetRelatedGeometricTolerance ******/
		/****** md5 signature: da9c786bdc03f39a068aff40e1d302d7 ******/
		%feature("compactdefaultargs") SetRelatedGeometricTolerance;
		%feature("autodoc", "
Parameters
----------
theRelatedGeometricTolerance: StepDimTol_GeometricTolerance

Return
-------
None

Description
-----------
Set field RelatedGeometricTolerance.
") SetRelatedGeometricTolerance;
		void SetRelatedGeometricTolerance(const opencascade::handle<StepDimTol_GeometricTolerance> & theRelatedGeometricTolerance);

		/****** StepDimTol_GeometricToleranceRelationship::SetRelatingGeometricTolerance ******/
		/****** md5 signature: 5ad030a44b335631ac121dcfb1da9372 ******/
		%feature("compactdefaultargs") SetRelatingGeometricTolerance;
		%feature("autodoc", "
Parameters
----------
theRelatingGeometricTolerance: StepDimTol_GeometricTolerance

Return
-------
None

Description
-----------
Set field RelatingGeometricTolerance.
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
		/****** StepDimTol_GeometricToleranceTarget::StepDimTol_GeometricToleranceTarget ******/
		/****** md5 signature: 2c2b66c0324deb462d1633385f861a1e ******/
		%feature("compactdefaultargs") StepDimTol_GeometricToleranceTarget;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a GeometricToleranceTarget select type.
") StepDimTol_GeometricToleranceTarget;
		 StepDimTol_GeometricToleranceTarget();

		/****** StepDimTol_GeometricToleranceTarget::CaseNum ******/
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
Recognizes a GeometricToleranceTarget Kind Entity that is: 1 -> DimensionalLocation 2 -> DimensionalSize 3 -> ProductDefinitionShape 4 -> ShapeAspect 0 else.
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepDimTol_GeometricToleranceTarget::DimensionalLocation ******/
		/****** md5 signature: 9f4321c54d42036b4fc910a64a234600 ******/
		%feature("compactdefaultargs") DimensionalLocation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepShape_DimensionalLocation>

Description
-----------
returns Value as a DimensionalLocation (Null if another type).
") DimensionalLocation;
		opencascade::handle<StepShape_DimensionalLocation> DimensionalLocation();

		/****** StepDimTol_GeometricToleranceTarget::DimensionalSize ******/
		/****** md5 signature: b3d1e5ecfb9af68552cff269c1a5a7db ******/
		%feature("compactdefaultargs") DimensionalSize;
		%feature("autodoc", "Return
-------
opencascade::handle<StepShape_DimensionalSize>

Description
-----------
returns Value as a DimensionalSize (Null if another type).
") DimensionalSize;
		opencascade::handle<StepShape_DimensionalSize> DimensionalSize();

		/****** StepDimTol_GeometricToleranceTarget::ProductDefinitionShape ******/
		/****** md5 signature: b30663c40bd2822cf899d97bff9d9f32 ******/
		%feature("compactdefaultargs") ProductDefinitionShape;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_ProductDefinitionShape>

Description
-----------
returns Value as a ProductDefinitionShape (Null if another type).
") ProductDefinitionShape;
		opencascade::handle<StepRepr_ProductDefinitionShape> ProductDefinitionShape();

		/****** StepDimTol_GeometricToleranceTarget::ShapeAspect ******/
		/****** md5 signature: 6c476d31e71221a87c411540ef5855cb ******/
		%feature("compactdefaultargs") ShapeAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_ShapeAspect>

Description
-----------
returns Value as a ShapeAspect (Null if another type).
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
		/****** StepDimTol_RunoutZoneOrientation::StepDimTol_RunoutZoneOrientation ******/
		/****** md5 signature: 70178ff9e2a746a971eceb836b7a75e9 ******/
		%feature("compactdefaultargs") StepDimTol_RunoutZoneOrientation;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepDimTol_RunoutZoneOrientation;
		 StepDimTol_RunoutZoneOrientation();

		/****** StepDimTol_RunoutZoneOrientation::Angle ******/
		/****** md5 signature: 65943dfd8b12553e48ca7edf00e9448c ******/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_PlaneAngleMeasureWithUnit>

Description
-----------
Returns field Angle.
") Angle;
		opencascade::handle<StepBasic_PlaneAngleMeasureWithUnit> Angle();

		/****** StepDimTol_RunoutZoneOrientation::Init ******/
		/****** md5 signature: 76093fd32ad79e5ebe59800feeb6a380 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theAngle: StepBasic_PlaneAngleMeasureWithUnit

Return
-------
None

Description
-----------
Init all field own and inherited.
") Init;
		void Init(const opencascade::handle<StepBasic_PlaneAngleMeasureWithUnit> & theAngle);

		/****** StepDimTol_RunoutZoneOrientation::SetAngle ******/
		/****** md5 signature: 3683fc91b08bc8e3d2a67b804272148f ******/
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "
Parameters
----------
theAngle: StepBasic_PlaneAngleMeasureWithUnit

Return
-------
None

Description
-----------
Set field Angle.
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
		/****** StepDimTol_ShapeToleranceSelect::StepDimTol_ShapeToleranceSelect ******/
		/****** md5 signature: 29bc94aaa83e59e5fd6285d7ea7a7097 ******/
		%feature("compactdefaultargs") StepDimTol_ShapeToleranceSelect;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepDimTol_ShapeToleranceSelect;
		 StepDimTol_ShapeToleranceSelect();

		/****** StepDimTol_ShapeToleranceSelect::CaseNum ******/
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
Recognizes a kind of ShapeToleranceSelect select type 1 -> GeometricTolerance from StepDimTol 2 -> PlusMinusTolerance from StepShape 0 else.
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepDimTol_ShapeToleranceSelect::GeometricTolerance ******/
		/****** md5 signature: e590dafae3b1364da15d0f21b2cf4d32 ******/
		%feature("compactdefaultargs") GeometricTolerance;
		%feature("autodoc", "Return
-------
opencascade::handle<StepDimTol_GeometricTolerance>

Description
-----------
Returns Value as GeometricTolerance (or Null if another type).
") GeometricTolerance;
		opencascade::handle<StepDimTol_GeometricTolerance> GeometricTolerance();

		/****** StepDimTol_ShapeToleranceSelect::PlusMinusTolerance ******/
		/****** md5 signature: 60229660aab14322ee1128d751d97729 ******/
		%feature("compactdefaultargs") PlusMinusTolerance;
		%feature("autodoc", "Return
-------
opencascade::handle<StepShape_PlusMinusTolerance>

Description
-----------
Returns Value as PlusMinusTolerance (or Null if another type).
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
		/****** StepDimTol_SimpleDatumReferenceModifierMember::StepDimTol_SimpleDatumReferenceModifierMember ******/
		/****** md5 signature: 824e3bd33941cf24a4f98a0d9c670c78 ******/
		%feature("compactdefaultargs") StepDimTol_SimpleDatumReferenceModifierMember;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepDimTol_SimpleDatumReferenceModifierMember;
		 StepDimTol_SimpleDatumReferenceModifierMember();

		/****** StepDimTol_SimpleDatumReferenceModifierMember::EnumText ******/
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

		/****** StepDimTol_SimpleDatumReferenceModifierMember::HasName ******/
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

		/****** StepDimTol_SimpleDatumReferenceModifierMember::Kind ******/
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

		/****** StepDimTol_SimpleDatumReferenceModifierMember::Name ******/
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

		/****** StepDimTol_SimpleDatumReferenceModifierMember::SetEnumText ******/
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

		/****** StepDimTol_SimpleDatumReferenceModifierMember::SetName ******/
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

		/****** StepDimTol_SimpleDatumReferenceModifierMember::SetValue ******/
		/****** md5 signature: 7d981ce38fda014c9603da361f0e52dc ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
theValue: StepDimTol_SimpleDatumReferenceModifier

Return
-------
None

Description
-----------
No available documentation.
") SetValue;
		void SetValue(const StepDimTol_SimpleDatumReferenceModifier theValue);

		/****** StepDimTol_SimpleDatumReferenceModifierMember::Value ******/
		/****** md5 signature: 761abbbd8bce599ec0c6926a941c2b17 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
StepDimTol_SimpleDatumReferenceModifier

Description
-----------
No available documentation.
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
		/****** StepDimTol_ToleranceZone::StepDimTol_ToleranceZone ******/
		/****** md5 signature: fafab191f2dfc9fa54a8d82191ce5568 ******/
		%feature("compactdefaultargs") StepDimTol_ToleranceZone;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepDimTol_ToleranceZone;
		 StepDimTol_ToleranceZone();

		/****** StepDimTol_ToleranceZone::DefiningTolerance ******/
		/****** md5 signature: 99dc7aa56abafcfb1a06c4349d9f67ac ******/
		%feature("compactdefaultargs") DefiningTolerance;
		%feature("autodoc", "Return
-------
opencascade::handle<StepDimTol_HArray1OfToleranceZoneTarget>

Description
-----------
Returns field DefiningTolerance.
") DefiningTolerance;
		opencascade::handle<StepDimTol_HArray1OfToleranceZoneTarget> DefiningTolerance();

		/****** StepDimTol_ToleranceZone::DefiningToleranceValue ******/
		/****** md5 signature: 380d01d85ee8b08008192f2c3fd6fdc8 ******/
		%feature("compactdefaultargs") DefiningToleranceValue;
		%feature("autodoc", "
Parameters
----------
theNum: int

Return
-------
StepDimTol_ToleranceZoneTarget

Description
-----------
Returns Defining Tolerance with the given number.
") DefiningToleranceValue;
		StepDimTol_ToleranceZoneTarget DefiningToleranceValue(const Standard_Integer theNum);

		/****** StepDimTol_ToleranceZone::Form ******/
		/****** md5 signature: 2d742834282a6991d68afa5b50c1be8f ******/
		%feature("compactdefaultargs") Form;
		%feature("autodoc", "Return
-------
opencascade::handle<StepDimTol_ToleranceZoneForm>

Description
-----------
Returns field Form.
") Form;
		opencascade::handle<StepDimTol_ToleranceZoneForm> Form();

		/****** StepDimTol_ToleranceZone::Init ******/
		/****** md5 signature: c1e50354d7e87eb51fe7bee751ebe1a2 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString
theOfShape: StepRepr_ProductDefinitionShape
theProductDefinitional: StepData_Logical
theDefiningTolerance: StepDimTol_HArray1OfToleranceZoneTarget
theForm: StepDimTol_ToleranceZoneForm

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription, const opencascade::handle<StepRepr_ProductDefinitionShape> & theOfShape, const StepData_Logical theProductDefinitional, const opencascade::handle<StepDimTol_HArray1OfToleranceZoneTarget> & theDefiningTolerance, const opencascade::handle<StepDimTol_ToleranceZoneForm> & theForm);

		/****** StepDimTol_ToleranceZone::NbDefiningTolerances ******/
		/****** md5 signature: d831e0468095eb4089a6406c7db5fbc7 ******/
		%feature("compactdefaultargs") NbDefiningTolerances;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of Defining Tolerances.
") NbDefiningTolerances;
		Standard_Integer NbDefiningTolerances();

		/****** StepDimTol_ToleranceZone::SetDefiningTolerance ******/
		/****** md5 signature: bd490bccf679cccd7f668817adff5e51 ******/
		%feature("compactdefaultargs") SetDefiningTolerance;
		%feature("autodoc", "
Parameters
----------
theDefiningTolerance: StepDimTol_HArray1OfToleranceZoneTarget

Return
-------
None

Description
-----------
Set field DefiningTolerance.
") SetDefiningTolerance;
		void SetDefiningTolerance(const opencascade::handle<StepDimTol_HArray1OfToleranceZoneTarget> & theDefiningTolerance);

		/****** StepDimTol_ToleranceZone::SetDefiningToleranceValue ******/
		/****** md5 signature: 0185fe37cda17da176310361d026e5cc ******/
		%feature("compactdefaultargs") SetDefiningToleranceValue;
		%feature("autodoc", "
Parameters
----------
theNum: int
theItem: StepDimTol_ToleranceZoneTarget

Return
-------
None

Description
-----------
Sets Defining Tolerance with given number.
") SetDefiningToleranceValue;
		void SetDefiningToleranceValue(const Standard_Integer theNum, const StepDimTol_ToleranceZoneTarget & theItem);

		/****** StepDimTol_ToleranceZone::SetForm ******/
		/****** md5 signature: f18d904127cff65de4ae70fb17e8039d ******/
		%feature("compactdefaultargs") SetForm;
		%feature("autodoc", "
Parameters
----------
theForm: StepDimTol_ToleranceZoneForm

Return
-------
None

Description
-----------
Set field Form.
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
		/****** StepDimTol_ToleranceZoneDefinition::StepDimTol_ToleranceZoneDefinition ******/
		/****** md5 signature: 33ee5d193b5b946ca79db327fc60e1ea ******/
		%feature("compactdefaultargs") StepDimTol_ToleranceZoneDefinition;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepDimTol_ToleranceZoneDefinition;
		 StepDimTol_ToleranceZoneDefinition();

		/****** StepDimTol_ToleranceZoneDefinition::Boundaries ******/
		/****** md5 signature: 645fc5a402ade427f3a3b37500686209 ******/
		%feature("compactdefaultargs") Boundaries;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_HArray1OfShapeAspect>

Description
-----------
Returns field Boundaries.
") Boundaries;
		opencascade::handle<StepRepr_HArray1OfShapeAspect> Boundaries();

		/****** StepDimTol_ToleranceZoneDefinition::BoundariesValue ******/
		/****** md5 signature: e9c4a4ba31767a03e0505b3021b58041 ******/
		%feature("compactdefaultargs") BoundariesValue;
		%feature("autodoc", "
Parameters
----------
theNum: int

Return
-------
opencascade::handle<StepRepr_ShapeAspect>

Description
-----------
Returns Boundaries with the given number.
") BoundariesValue;
		opencascade::handle<StepRepr_ShapeAspect> BoundariesValue(const Standard_Integer theNum);

		/****** StepDimTol_ToleranceZoneDefinition::Init ******/
		/****** md5 signature: ebb8228f7f868938b39df7d5c3519731 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theZone: StepDimTol_ToleranceZone
theBoundaries: StepRepr_HArray1OfShapeAspect

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<StepDimTol_ToleranceZone> & theZone, const opencascade::handle<StepRepr_HArray1OfShapeAspect> & theBoundaries);

		/****** StepDimTol_ToleranceZoneDefinition::NbBoundaries ******/
		/****** md5 signature: 8f123fd883cd1f78c23e8784f3e27460 ******/
		%feature("compactdefaultargs") NbBoundaries;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of Boundaries.
") NbBoundaries;
		Standard_Integer NbBoundaries();

		/****** StepDimTol_ToleranceZoneDefinition::SetBoundaries ******/
		/****** md5 signature: a01aa98a902dfd4978214ffb087b4a46 ******/
		%feature("compactdefaultargs") SetBoundaries;
		%feature("autodoc", "
Parameters
----------
theBoundaries: StepRepr_HArray1OfShapeAspect

Return
-------
None

Description
-----------
Set field Boundaries.
") SetBoundaries;
		void SetBoundaries(const opencascade::handle<StepRepr_HArray1OfShapeAspect> & theBoundaries);

		/****** StepDimTol_ToleranceZoneDefinition::SetBoundariesValue ******/
		/****** md5 signature: de4217b221ddc7bd3a68fc8059fb6054 ******/
		%feature("compactdefaultargs") SetBoundariesValue;
		%feature("autodoc", "
Parameters
----------
theNum: int
theItem: StepRepr_ShapeAspect

Return
-------
None

Description
-----------
Sets Boundaries with given number.
") SetBoundariesValue;
		void SetBoundariesValue(const Standard_Integer theNum, const opencascade::handle<StepRepr_ShapeAspect> & theItem);

		/****** StepDimTol_ToleranceZoneDefinition::SetZone ******/
		/****** md5 signature: d7fc3d46d963bc3a2008101ad05c4220 ******/
		%feature("compactdefaultargs") SetZone;
		%feature("autodoc", "
Parameters
----------
theZone: StepDimTol_ToleranceZone

Return
-------
None

Description
-----------
Set field Zone.
") SetZone;
		void SetZone(const opencascade::handle<StepDimTol_ToleranceZone> & theZone);

		/****** StepDimTol_ToleranceZoneDefinition::Zone ******/
		/****** md5 signature: 004b0726a085b920d125fca36a407c14 ******/
		%feature("compactdefaultargs") Zone;
		%feature("autodoc", "Return
-------
opencascade::handle<StepDimTol_ToleranceZone>

Description
-----------
Returns field Zone.
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
		/****** StepDimTol_ToleranceZoneForm::StepDimTol_ToleranceZoneForm ******/
		/****** md5 signature: 5f4006229738c2d53f33fe92432c0c74 ******/
		%feature("compactdefaultargs") StepDimTol_ToleranceZoneForm;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepDimTol_ToleranceZoneForm;
		 StepDimTol_ToleranceZoneForm();

		/****** StepDimTol_ToleranceZoneForm::Init ******/
		/****** md5 signature: 36b0cda5fc2f350c942d95a95526e898 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString

Return
-------
None

Description
-----------
Init all field own and inherited.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName);

		/****** StepDimTol_ToleranceZoneForm::Name ******/
		/****** md5 signature: 59d0a64c1cd07d08303eccb1d2e756ba ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Name.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepDimTol_ToleranceZoneForm::SetName ******/
		/****** md5 signature: e058c117d39fc45f2a180acd037ae283 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Name.
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
		/****** StepDimTol_ToleranceZoneTarget::StepDimTol_ToleranceZoneTarget ******/
		/****** md5 signature: f3ba78f7601ee19a5cb7c9e398747c4c ******/
		%feature("compactdefaultargs") StepDimTol_ToleranceZoneTarget;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a ToleranceZoneTarget select type.
") StepDimTol_ToleranceZoneTarget;
		 StepDimTol_ToleranceZoneTarget();

		/****** StepDimTol_ToleranceZoneTarget::CaseNum ******/
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
Recognizes a ToleranceZoneTarget Kind Entity that is: 1 -> DimensionalLocation 2 -> DimensionalSize 3 -> GeometricTolerance 4 -> GeneralDatumReference 0 else.
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepDimTol_ToleranceZoneTarget::DimensionalLocation ******/
		/****** md5 signature: 9f4321c54d42036b4fc910a64a234600 ******/
		%feature("compactdefaultargs") DimensionalLocation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepShape_DimensionalLocation>

Description
-----------
returns Value as a DimensionalLocation (Null if another type).
") DimensionalLocation;
		opencascade::handle<StepShape_DimensionalLocation> DimensionalLocation();

		/****** StepDimTol_ToleranceZoneTarget::DimensionalSize ******/
		/****** md5 signature: b3d1e5ecfb9af68552cff269c1a5a7db ******/
		%feature("compactdefaultargs") DimensionalSize;
		%feature("autodoc", "Return
-------
opencascade::handle<StepShape_DimensionalSize>

Description
-----------
returns Value as a DimensionalSize (Null if another type).
") DimensionalSize;
		opencascade::handle<StepShape_DimensionalSize> DimensionalSize();

		/****** StepDimTol_ToleranceZoneTarget::GeneralDatumReference ******/
		/****** md5 signature: 5753461b092f65fc33284f3cfccedbac ******/
		%feature("compactdefaultargs") GeneralDatumReference;
		%feature("autodoc", "Return
-------
opencascade::handle<StepDimTol_GeneralDatumReference>

Description
-----------
returns Value as a GeneralDatumReference (Null if another type).
") GeneralDatumReference;
		opencascade::handle<StepDimTol_GeneralDatumReference> GeneralDatumReference();

		/****** StepDimTol_ToleranceZoneTarget::GeometricTolerance ******/
		/****** md5 signature: e590dafae3b1364da15d0f21b2cf4d32 ******/
		%feature("compactdefaultargs") GeometricTolerance;
		%feature("autodoc", "Return
-------
opencascade::handle<StepDimTol_GeometricTolerance>

Description
-----------
returns Value as a GeometricTolerance (Null if another type).
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
		/****** StepDimTol_CylindricityTolerance::StepDimTol_CylindricityTolerance ******/
		/****** md5 signature: 0f8336cc4ad6afdee7e5cbba28c4d84c ******/
		%feature("compactdefaultargs") StepDimTol_CylindricityTolerance;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
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
		/****** StepDimTol_DatumReferenceCompartment::StepDimTol_DatumReferenceCompartment ******/
		/****** md5 signature: 4b4d5691902fb1e810a86a25df7ee77a ******/
		%feature("compactdefaultargs") StepDimTol_DatumReferenceCompartment;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
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
		/****** StepDimTol_DatumReferenceElement::StepDimTol_DatumReferenceElement ******/
		/****** md5 signature: ef7d456f32366de042c2a4a037b8d335 ******/
		%feature("compactdefaultargs") StepDimTol_DatumReferenceElement;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
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
		/****** StepDimTol_FlatnessTolerance::StepDimTol_FlatnessTolerance ******/
		/****** md5 signature: 39d670d8611d6b729f965a9b663084c3 ******/
		%feature("compactdefaultargs") StepDimTol_FlatnessTolerance;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
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
		/****** StepDimTol_GeoTolAndGeoTolWthDatRef::StepDimTol_GeoTolAndGeoTolWthDatRef ******/
		/****** md5 signature: e530b3829a14607e37c1a4ff0296a754 ******/
		%feature("compactdefaultargs") StepDimTol_GeoTolAndGeoTolWthDatRef;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepDimTol_GeoTolAndGeoTolWthDatRef;
		 StepDimTol_GeoTolAndGeoTolWthDatRef();

		/****** StepDimTol_GeoTolAndGeoTolWthDatRef::GetGeometricToleranceWithDatumReference ******/
		/****** md5 signature: feb5a3779efbd89c80ee1d63a39744fc ******/
		%feature("compactdefaultargs") GetGeometricToleranceWithDatumReference;
		%feature("autodoc", "Return
-------
opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference>

Description
-----------
No available documentation.
") GetGeometricToleranceWithDatumReference;
		opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> GetGeometricToleranceWithDatumReference();

		/****** StepDimTol_GeoTolAndGeoTolWthDatRef::GetToleranceType ******/
		/****** md5 signature: dfc2abab001107623cc95cff337f0872 ******/
		%feature("compactdefaultargs") GetToleranceType;
		%feature("autodoc", "Return
-------
StepDimTol_GeometricToleranceType

Description
-----------
No available documentation.
") GetToleranceType;
		StepDimTol_GeometricToleranceType GetToleranceType();

		/****** StepDimTol_GeoTolAndGeoTolWthDatRef::Init ******/
		/****** md5 signature: db15f1b97fa9bf080a3d371bc46eb6da ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString
theMagnitude: StepBasic_MeasureWithUnit
theTolerancedShapeAspect: StepRepr_ShapeAspect
theGTWDR: StepDimTol_GeometricToleranceWithDatumReference
theType: StepDimTol_GeometricToleranceType

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription, const opencascade::handle<StepBasic_MeasureWithUnit> & theMagnitude, const opencascade::handle<StepRepr_ShapeAspect> & theTolerancedShapeAspect, const opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> & theGTWDR, const StepDimTol_GeometricToleranceType theType);

		/****** StepDimTol_GeoTolAndGeoTolWthDatRef::Init ******/
		/****** md5 signature: 97ea13e2b3b31475098827e908fc43bb ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aMagnitude: StepBasic_MeasureWithUnit
aTolerancedShapeAspect: StepDimTol_GeometricToleranceTarget
aGTWDR: StepDimTol_GeometricToleranceWithDatumReference
theType: StepDimTol_GeometricToleranceType

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_MeasureWithUnit> & aMagnitude, const StepDimTol_GeometricToleranceTarget & aTolerancedShapeAspect, const opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> & aGTWDR, const StepDimTol_GeometricToleranceType theType);

		/****** StepDimTol_GeoTolAndGeoTolWthDatRef::SetGeometricToleranceType ******/
		/****** md5 signature: 8350d9d6da4a5bff83d70cee5cbc7cfe ******/
		%feature("compactdefaultargs") SetGeometricToleranceType;
		%feature("autodoc", "
Parameters
----------
theType: StepDimTol_GeometricToleranceType

Return
-------
None

Description
-----------
No available documentation.
") SetGeometricToleranceType;
		void SetGeometricToleranceType(const StepDimTol_GeometricToleranceType theType);

		/****** StepDimTol_GeoTolAndGeoTolWthDatRef::SetGeometricToleranceWithDatumReference ******/
		/****** md5 signature: 38873bdcf2f0ee5a682749a9a21829fb ******/
		%feature("compactdefaultargs") SetGeometricToleranceWithDatumReference;
		%feature("autodoc", "
Parameters
----------
theGTWDR: StepDimTol_GeometricToleranceWithDatumReference

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMod::StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMod ******/
		/****** md5 signature: 88470247012944c6b0983df6f794663a ******/
		%feature("compactdefaultargs") StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMod;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMod;
		 StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMod();

		/****** StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMod::GetGeometricToleranceWithDatumReference ******/
		/****** md5 signature: feb5a3779efbd89c80ee1d63a39744fc ******/
		%feature("compactdefaultargs") GetGeometricToleranceWithDatumReference;
		%feature("autodoc", "Return
-------
opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference>

Description
-----------
No available documentation.
") GetGeometricToleranceWithDatumReference;
		opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> GetGeometricToleranceWithDatumReference();

		/****** StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMod::GetGeometricToleranceWithModifiers ******/
		/****** md5 signature: 796e1e2c4ee3b5f75f1cb3dc3307e9b0 ******/
		%feature("compactdefaultargs") GetGeometricToleranceWithModifiers;
		%feature("autodoc", "Return
-------
opencascade::handle<StepDimTol_GeometricToleranceWithModifiers>

Description
-----------
No available documentation.
") GetGeometricToleranceWithModifiers;
		opencascade::handle<StepDimTol_GeometricToleranceWithModifiers> GetGeometricToleranceWithModifiers();

		/****** StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMod::GetToleranceType ******/
		/****** md5 signature: dfc2abab001107623cc95cff337f0872 ******/
		%feature("compactdefaultargs") GetToleranceType;
		%feature("autodoc", "Return
-------
StepDimTol_GeometricToleranceType

Description
-----------
No available documentation.
") GetToleranceType;
		StepDimTol_GeometricToleranceType GetToleranceType();

		/****** StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMod::Init ******/
		/****** md5 signature: a8a4f720cd04b4304c7e74a7be72489e ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString
theMagnitude: StepBasic_MeasureWithUnit
theTolerancedShapeAspect: StepRepr_ShapeAspect
theGTWDR: StepDimTol_GeometricToleranceWithDatumReference
theGTWM: StepDimTol_GeometricToleranceWithModifiers
theType: StepDimTol_GeometricToleranceType

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription, const opencascade::handle<StepBasic_MeasureWithUnit> & theMagnitude, const opencascade::handle<StepRepr_ShapeAspect> & theTolerancedShapeAspect, const opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> & theGTWDR, const opencascade::handle<StepDimTol_GeometricToleranceWithModifiers> & theGTWM, const StepDimTol_GeometricToleranceType theType);

		/****** StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMod::Init ******/
		/****** md5 signature: 5212b0c2c6d5993acd962eb2833ecd78 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aMagnitude: StepBasic_MeasureWithUnit
aTolerancedShapeAspect: StepDimTol_GeometricToleranceTarget
aGTWDR: StepDimTol_GeometricToleranceWithDatumReference
aGTWM: StepDimTol_GeometricToleranceWithModifiers
theType: StepDimTol_GeometricToleranceType

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_MeasureWithUnit> & aMagnitude, const StepDimTol_GeometricToleranceTarget & aTolerancedShapeAspect, const opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> & aGTWDR, const opencascade::handle<StepDimTol_GeometricToleranceWithModifiers> & aGTWM, const StepDimTol_GeometricToleranceType theType);

		/****** StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMod::SetGeometricToleranceType ******/
		/****** md5 signature: 8350d9d6da4a5bff83d70cee5cbc7cfe ******/
		%feature("compactdefaultargs") SetGeometricToleranceType;
		%feature("autodoc", "
Parameters
----------
theType: StepDimTol_GeometricToleranceType

Return
-------
None

Description
-----------
No available documentation.
") SetGeometricToleranceType;
		void SetGeometricToleranceType(const StepDimTol_GeometricToleranceType theType);

		/****** StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMod::SetGeometricToleranceWithDatumReference ******/
		/****** md5 signature: 38873bdcf2f0ee5a682749a9a21829fb ******/
		%feature("compactdefaultargs") SetGeometricToleranceWithDatumReference;
		%feature("autodoc", "
Parameters
----------
theGTWDR: StepDimTol_GeometricToleranceWithDatumReference

Return
-------
None

Description
-----------
No available documentation.
") SetGeometricToleranceWithDatumReference;
		void SetGeometricToleranceWithDatumReference(const opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> & theGTWDR);

		/****** StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMod::SetGeometricToleranceWithModifiers ******/
		/****** md5 signature: 99e55dedf20045f96ea27f04524dadc3 ******/
		%feature("compactdefaultargs") SetGeometricToleranceWithModifiers;
		%feature("autodoc", "
Parameters
----------
theGTWM: StepDimTol_GeometricToleranceWithModifiers

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol::StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol ******/
		/****** md5 signature: ad60cb20597faecc60b4784d657bac10 ******/
		%feature("compactdefaultargs") StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol;
		 StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol();

		/****** StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol::GetGeometricToleranceWithDatumReference ******/
		/****** md5 signature: d918020b565ccd2d05b8a5c6ac312a71 ******/
		%feature("compactdefaultargs") GetGeometricToleranceWithDatumReference;
		%feature("autodoc", "Return
-------
opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference>

Description
-----------
No available documentation.
") GetGeometricToleranceWithDatumReference;
		opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> GetGeometricToleranceWithDatumReference();

		/****** StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol::GetModifiedGeometricTolerance ******/
		/****** md5 signature: a947e79be18f4b1da3b2a73953e1cf9c ******/
		%feature("compactdefaultargs") GetModifiedGeometricTolerance;
		%feature("autodoc", "Return
-------
opencascade::handle<StepDimTol_ModifiedGeometricTolerance>

Description
-----------
No available documentation.
") GetModifiedGeometricTolerance;
		opencascade::handle<StepDimTol_ModifiedGeometricTolerance> GetModifiedGeometricTolerance();

		/****** StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol::GetPositionTolerance ******/
		/****** md5 signature: ff18f0fcd7debfa06c775ec1d51aa4d7 ******/
		%feature("compactdefaultargs") GetPositionTolerance;
		%feature("autodoc", "Return
-------
opencascade::handle<StepDimTol_PositionTolerance>

Description
-----------
No available documentation.
") GetPositionTolerance;
		opencascade::handle<StepDimTol_PositionTolerance> GetPositionTolerance();

		/****** StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol::Init ******/
		/****** md5 signature: 74af2cd7fb1d7b947b1d46f0aa41d77c ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aMagnitude: StepBasic_MeasureWithUnit
aTolerancedShapeAspect: StepRepr_ShapeAspect
aGTWDR: StepDimTol_GeometricToleranceWithDatumReference
aMGT: StepDimTol_ModifiedGeometricTolerance

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_MeasureWithUnit> & aMagnitude, const opencascade::handle<StepRepr_ShapeAspect> & aTolerancedShapeAspect, const opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> & aGTWDR, const opencascade::handle<StepDimTol_ModifiedGeometricTolerance> & aMGT);

		/****** StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol::Init ******/
		/****** md5 signature: 32e8a837682227f3de9b0345bbde4776 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aMagnitude: StepBasic_MeasureWithUnit
aTolerancedShapeAspect: StepDimTol_GeometricToleranceTarget
aGTWDR: StepDimTol_GeometricToleranceWithDatumReference
aMGT: StepDimTol_ModifiedGeometricTolerance

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_MeasureWithUnit> & aMagnitude, const StepDimTol_GeometricToleranceTarget & aTolerancedShapeAspect, const opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> & aGTWDR, const opencascade::handle<StepDimTol_ModifiedGeometricTolerance> & aMGT);

		/****** StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol::SetGeometricToleranceWithDatumReference ******/
		/****** md5 signature: 4e61966346e539e8717f5c190104d2f5 ******/
		%feature("compactdefaultargs") SetGeometricToleranceWithDatumReference;
		%feature("autodoc", "
Parameters
----------
aGTWDR: StepDimTol_GeometricToleranceWithDatumReference

Return
-------
None

Description
-----------
No available documentation.
") SetGeometricToleranceWithDatumReference;
		void SetGeometricToleranceWithDatumReference(const opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> & aGTWDR);

		/****** StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol::SetModifiedGeometricTolerance ******/
		/****** md5 signature: af254172b96683b004ea83f30d3afa2e ******/
		%feature("compactdefaultargs") SetModifiedGeometricTolerance;
		%feature("autodoc", "
Parameters
----------
aMGT: StepDimTol_ModifiedGeometricTolerance

Return
-------
None

Description
-----------
No available documentation.
") SetModifiedGeometricTolerance;
		void SetModifiedGeometricTolerance(const opencascade::handle<StepDimTol_ModifiedGeometricTolerance> & aMGT);

		/****** StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol::SetPositionTolerance ******/
		/****** md5 signature: 8bb61eda6ab3abdbc5a6d6bc12d4996b ******/
		%feature("compactdefaultargs") SetPositionTolerance;
		%feature("autodoc", "
Parameters
----------
aPT: StepDimTol_PositionTolerance

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepDimTol_GeoTolAndGeoTolWthMod::StepDimTol_GeoTolAndGeoTolWthMod ******/
		/****** md5 signature: 5de0f03b653bb29c076d1d0aff9708e7 ******/
		%feature("compactdefaultargs") StepDimTol_GeoTolAndGeoTolWthMod;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepDimTol_GeoTolAndGeoTolWthMod;
		 StepDimTol_GeoTolAndGeoTolWthMod();

		/****** StepDimTol_GeoTolAndGeoTolWthMod::GetGeometricToleranceWithModifiers ******/
		/****** md5 signature: 796e1e2c4ee3b5f75f1cb3dc3307e9b0 ******/
		%feature("compactdefaultargs") GetGeometricToleranceWithModifiers;
		%feature("autodoc", "Return
-------
opencascade::handle<StepDimTol_GeometricToleranceWithModifiers>

Description
-----------
No available documentation.
") GetGeometricToleranceWithModifiers;
		opencascade::handle<StepDimTol_GeometricToleranceWithModifiers> GetGeometricToleranceWithModifiers();

		/****** StepDimTol_GeoTolAndGeoTolWthMod::GetToleranceType ******/
		/****** md5 signature: dfc2abab001107623cc95cff337f0872 ******/
		%feature("compactdefaultargs") GetToleranceType;
		%feature("autodoc", "Return
-------
StepDimTol_GeometricToleranceType

Description
-----------
No available documentation.
") GetToleranceType;
		StepDimTol_GeometricToleranceType GetToleranceType();

		/****** StepDimTol_GeoTolAndGeoTolWthMod::Init ******/
		/****** md5 signature: 50bb06f99fd5252697550077f2192a11 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString
theMagnitude: StepBasic_MeasureWithUnit
theTolerancedShapeAspect: StepRepr_ShapeAspect
theGTWM: StepDimTol_GeometricToleranceWithModifiers
theType: StepDimTol_GeometricToleranceType

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription, const opencascade::handle<StepBasic_MeasureWithUnit> & theMagnitude, const opencascade::handle<StepRepr_ShapeAspect> & theTolerancedShapeAspect, const opencascade::handle<StepDimTol_GeometricToleranceWithModifiers> & theGTWM, const StepDimTol_GeometricToleranceType theType);

		/****** StepDimTol_GeoTolAndGeoTolWthMod::Init ******/
		/****** md5 signature: 691c64eb9897fe4899f2b6b423e2f850 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aMagnitude: StepBasic_MeasureWithUnit
aTolerancedShapeAspect: StepDimTol_GeometricToleranceTarget
aGTWM: StepDimTol_GeometricToleranceWithModifiers
theType: StepDimTol_GeometricToleranceType

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_MeasureWithUnit> & aMagnitude, const StepDimTol_GeometricToleranceTarget & aTolerancedShapeAspect, const opencascade::handle<StepDimTol_GeometricToleranceWithModifiers> & aGTWM, const StepDimTol_GeometricToleranceType theType);

		/****** StepDimTol_GeoTolAndGeoTolWthMod::SetGeometricToleranceType ******/
		/****** md5 signature: 8350d9d6da4a5bff83d70cee5cbc7cfe ******/
		%feature("compactdefaultargs") SetGeometricToleranceType;
		%feature("autodoc", "
Parameters
----------
theType: StepDimTol_GeometricToleranceType

Return
-------
None

Description
-----------
No available documentation.
") SetGeometricToleranceType;
		void SetGeometricToleranceType(const StepDimTol_GeometricToleranceType theType);

		/****** StepDimTol_GeoTolAndGeoTolWthMod::SetGeometricToleranceWithModifiers ******/
		/****** md5 signature: 99e55dedf20045f96ea27f04524dadc3 ******/
		%feature("compactdefaultargs") SetGeometricToleranceWithModifiers;
		%feature("autodoc", "
Parameters
----------
theGTWM: StepDimTol_GeometricToleranceWithModifiers

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepDimTol_GeometricToleranceWithDatumReference::StepDimTol_GeometricToleranceWithDatumReference ******/
		/****** md5 signature: b31114dca23fe3f04530a06162ea001c ******/
		%feature("compactdefaultargs") StepDimTol_GeometricToleranceWithDatumReference;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepDimTol_GeometricToleranceWithDatumReference;
		 StepDimTol_GeometricToleranceWithDatumReference();

		/****** StepDimTol_GeometricToleranceWithDatumReference::DatumSystem ******/
		/****** md5 signature: e0be067ac08274412f07c8cd350d74dd ******/
		%feature("compactdefaultargs") DatumSystem;
		%feature("autodoc", "Return
-------
opencascade::handle<StepDimTol_HArray1OfDatumReference>

Description
-----------
Returns field DatumSystem AP214.
") DatumSystem;
		opencascade::handle<StepDimTol_HArray1OfDatumReference> DatumSystem();

		/****** StepDimTol_GeometricToleranceWithDatumReference::DatumSystemAP242 ******/
		/****** md5 signature: bd26cad3bcf09630ce7db2ddb425376f ******/
		%feature("compactdefaultargs") DatumSystemAP242;
		%feature("autodoc", "Return
-------
opencascade::handle<StepDimTol_HArray1OfDatumSystemOrReference>

Description
-----------
Returns field DatumSystem AP242.
") DatumSystemAP242;
		opencascade::handle<StepDimTol_HArray1OfDatumSystemOrReference> DatumSystemAP242();

		/****** StepDimTol_GeometricToleranceWithDatumReference::Init ******/
		/****** md5 signature: a1dcbe0dd01123c2578f421b267f0a3e ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theGeometricTolerance_Name: TCollection_HAsciiString
theGeometricTolerance_Description: TCollection_HAsciiString
theGeometricTolerance_Magnitude: StepBasic_MeasureWithUnit
theGeometricTolerance_TolerancedShapeAspect: StepRepr_ShapeAspect
theDatumSystem: StepDimTol_HArray1OfDatumReference

Return
-------
None

Description
-----------
Initialize all fields (own and inherited) AP214.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theGeometricTolerance_Name, const opencascade::handle<TCollection_HAsciiString> & theGeometricTolerance_Description, const opencascade::handle<StepBasic_MeasureWithUnit> & theGeometricTolerance_Magnitude, const opencascade::handle<StepRepr_ShapeAspect> & theGeometricTolerance_TolerancedShapeAspect, const opencascade::handle<StepDimTol_HArray1OfDatumReference> & theDatumSystem);

		/****** StepDimTol_GeometricToleranceWithDatumReference::Init ******/
		/****** md5 signature: 6e2591c175474f098e1b7d7cfb19b97e ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theGeometricTolerance_Name: TCollection_HAsciiString
theGeometricTolerance_Description: TCollection_HAsciiString
theGeometricTolerance_Magnitude: StepBasic_MeasureWithUnit
theGeometricTolerance_TolerancedShapeAspect: StepDimTol_GeometricToleranceTarget
theDatumSystem: StepDimTol_HArray1OfDatumSystemOrReference

Return
-------
None

Description
-----------
Initialize all fields (own and inherited) AP242.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theGeometricTolerance_Name, const opencascade::handle<TCollection_HAsciiString> & theGeometricTolerance_Description, const opencascade::handle<StepBasic_MeasureWithUnit> & theGeometricTolerance_Magnitude, const StepDimTol_GeometricToleranceTarget & theGeometricTolerance_TolerancedShapeAspect, const opencascade::handle<StepDimTol_HArray1OfDatumSystemOrReference> & theDatumSystem);

		/****** StepDimTol_GeometricToleranceWithDatumReference::SetDatumSystem ******/
		/****** md5 signature: 940fbccc8db16e777cc714b30038b9df ******/
		%feature("compactdefaultargs") SetDatumSystem;
		%feature("autodoc", "
Parameters
----------
theDatumSystem: StepDimTol_HArray1OfDatumReference

Return
-------
None

Description
-----------
Set field DatumSystem AP214.
") SetDatumSystem;
		void SetDatumSystem(const opencascade::handle<StepDimTol_HArray1OfDatumReference> & theDatumSystem);

		/****** StepDimTol_GeometricToleranceWithDatumReference::SetDatumSystem ******/
		/****** md5 signature: beae3592249a9847119978bdc4ef76a7 ******/
		%feature("compactdefaultargs") SetDatumSystem;
		%feature("autodoc", "
Parameters
----------
theDatumSystem: StepDimTol_HArray1OfDatumSystemOrReference

Return
-------
None

Description
-----------
Set field DatumSystem AP242.
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
		/****** StepDimTol_GeometricToleranceWithDefinedUnit::StepDimTol_GeometricToleranceWithDefinedUnit ******/
		/****** md5 signature: d99072248298dc1189745ac7c6fe8086 ******/
		%feature("compactdefaultargs") StepDimTol_GeometricToleranceWithDefinedUnit;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepDimTol_GeometricToleranceWithDefinedUnit;
		 StepDimTol_GeometricToleranceWithDefinedUnit();

		/****** StepDimTol_GeometricToleranceWithDefinedUnit::Init ******/
		/****** md5 signature: aca4114abd1243d273f34e6cdc26ed4e ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString
theMagnitude: StepBasic_MeasureWithUnit
theTolerancedShapeAspect: StepRepr_ShapeAspect
theUnitSize: StepBasic_LengthMeasureWithUnit

Return
-------
None

Description
-----------
Initialize all fields (own and inherited) AP214.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription, const opencascade::handle<StepBasic_MeasureWithUnit> & theMagnitude, const opencascade::handle<StepRepr_ShapeAspect> & theTolerancedShapeAspect, const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theUnitSize);

		/****** StepDimTol_GeometricToleranceWithDefinedUnit::Init ******/
		/****** md5 signature: c4ca9d47f05af7a2a3032b4bd0a4171e ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString
theMagnitude: StepBasic_MeasureWithUnit
theTolerancedShapeAspect: StepDimTol_GeometricToleranceTarget
theUnitSize: StepBasic_LengthMeasureWithUnit

Return
-------
None

Description
-----------
Initialize all fields (own and inherited) AP242.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription, const opencascade::handle<StepBasic_MeasureWithUnit> & theMagnitude, const StepDimTol_GeometricToleranceTarget & theTolerancedShapeAspect, const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theUnitSize);

		/****** StepDimTol_GeometricToleranceWithDefinedUnit::SetUnitSize ******/
		/****** md5 signature: 17b7e0b60ee3517bcf510aade40b374b ******/
		%feature("compactdefaultargs") SetUnitSize;
		%feature("autodoc", "
Parameters
----------
theUnitSize: StepBasic_LengthMeasureWithUnit

Return
-------
None

Description
-----------
Set field UnitSize.
") SetUnitSize;
		void SetUnitSize(const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theUnitSize);

		/****** StepDimTol_GeometricToleranceWithDefinedUnit::UnitSize ******/
		/****** md5 signature: 6e17765329442a1657bb7a745d7b06ba ******/
		%feature("compactdefaultargs") UnitSize;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_LengthMeasureWithUnit>

Description
-----------
Returns field UnitSize.
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
		/****** StepDimTol_GeometricToleranceWithModifiers::StepDimTol_GeometricToleranceWithModifiers ******/
		/****** md5 signature: 6b9be2079d0a038b35e6ae83aa153b69 ******/
		%feature("compactdefaultargs") StepDimTol_GeometricToleranceWithModifiers;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepDimTol_GeometricToleranceWithModifiers;
		 StepDimTol_GeometricToleranceWithModifiers();

		/****** StepDimTol_GeometricToleranceWithModifiers::Init ******/
		/****** md5 signature: 50afbad8d96b2d7cf932277b9fd9cf5a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString
theMagnitude: StepBasic_MeasureWithUnit
theTolerancedShapeAspect: StepDimTol_GeometricToleranceTarget
theModifiers: StepDimTol_HArray1OfGeometricToleranceModifier

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription, const opencascade::handle<StepBasic_MeasureWithUnit> & theMagnitude, const StepDimTol_GeometricToleranceTarget & theTolerancedShapeAspect, const opencascade::handle<StepDimTol_HArray1OfGeometricToleranceModifier> & theModifiers);

		/****** StepDimTol_GeometricToleranceWithModifiers::ModifierValue ******/
		/****** md5 signature: a93574564a8584642f006ae4f97e9d7d ******/
		%feature("compactdefaultargs") ModifierValue;
		%feature("autodoc", "
Parameters
----------
theNum: int

Return
-------
StepDimTol_GeometricToleranceModifier

Description
-----------
Returns modifier with the given number.
") ModifierValue;
		StepDimTol_GeometricToleranceModifier ModifierValue(const Standard_Integer theNum);

		/****** StepDimTol_GeometricToleranceWithModifiers::Modifiers ******/
		/****** md5 signature: 6286db818b55f86219dc8ce29564fe4f ******/
		%feature("compactdefaultargs") Modifiers;
		%feature("autodoc", "Return
-------
opencascade::handle<StepDimTol_HArray1OfGeometricToleranceModifier>

Description
-----------
Returns field Modifiers.
") Modifiers;
		opencascade::handle<StepDimTol_HArray1OfGeometricToleranceModifier> Modifiers();

		/****** StepDimTol_GeometricToleranceWithModifiers::NbModifiers ******/
		/****** md5 signature: 1cbfb9180169154c165f1c4fedd82ad9 ******/
		%feature("compactdefaultargs") NbModifiers;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of modifiers.
") NbModifiers;
		Standard_Integer NbModifiers();

		/****** StepDimTol_GeometricToleranceWithModifiers::SetModifierValue ******/
		/****** md5 signature: 5b9f7d48d3afb5fe52c19e3047094e84 ******/
		%feature("compactdefaultargs") SetModifierValue;
		%feature("autodoc", "
Parameters
----------
theNum: int
theItem: StepDimTol_GeometricToleranceModifier

Return
-------
None

Description
-----------
Sets modifier with given number.
") SetModifierValue;
		void SetModifierValue(const Standard_Integer theNum, const StepDimTol_GeometricToleranceModifier theItem);

		/****** StepDimTol_GeometricToleranceWithModifiers::SetModifiers ******/
		/****** md5 signature: feee0f5bad7156814085c204d0ebf2fa ******/
		%feature("compactdefaultargs") SetModifiers;
		%feature("autodoc", "
Parameters
----------
theModifiers: StepDimTol_HArray1OfGeometricToleranceModifier

Return
-------
None

Description
-----------
Set field Modifiers.
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
		/****** StepDimTol_LineProfileTolerance::StepDimTol_LineProfileTolerance ******/
		/****** md5 signature: 8a74038e65b61831569c9fcca18cfd97 ******/
		%feature("compactdefaultargs") StepDimTol_LineProfileTolerance;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
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
		/****** StepDimTol_ModifiedGeometricTolerance::StepDimTol_ModifiedGeometricTolerance ******/
		/****** md5 signature: ee700bc0fc4e7d4f0c1a98bc594c40f2 ******/
		%feature("compactdefaultargs") StepDimTol_ModifiedGeometricTolerance;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepDimTol_ModifiedGeometricTolerance;
		 StepDimTol_ModifiedGeometricTolerance();

		/****** StepDimTol_ModifiedGeometricTolerance::Init ******/
		/****** md5 signature: 6306d8ee583620a397ac99996e8ec319 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theGeometricTolerance_Name: TCollection_HAsciiString
theGeometricTolerance_Description: TCollection_HAsciiString
theGeometricTolerance_Magnitude: StepBasic_MeasureWithUnit
theGeometricTolerance_TolerancedShapeAspect: StepRepr_ShapeAspect
theModifier: StepDimTol_LimitCondition

Return
-------
None

Description
-----------
Initialize all fields (own and inherited) AP214.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theGeometricTolerance_Name, const opencascade::handle<TCollection_HAsciiString> & theGeometricTolerance_Description, const opencascade::handle<StepBasic_MeasureWithUnit> & theGeometricTolerance_Magnitude, const opencascade::handle<StepRepr_ShapeAspect> & theGeometricTolerance_TolerancedShapeAspect, const StepDimTol_LimitCondition theModifier);

		/****** StepDimTol_ModifiedGeometricTolerance::Init ******/
		/****** md5 signature: 5371e740b94e8e4d5fc8ae34d78ab189 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theGeometricTolerance_Name: TCollection_HAsciiString
theGeometricTolerance_Description: TCollection_HAsciiString
theGeometricTolerance_Magnitude: StepBasic_MeasureWithUnit
theGeometricTolerance_TolerancedShapeAspect: StepDimTol_GeometricToleranceTarget
theModifier: StepDimTol_LimitCondition

Return
-------
None

Description
-----------
Initialize all fields (own and inherited) AP242.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theGeometricTolerance_Name, const opencascade::handle<TCollection_HAsciiString> & theGeometricTolerance_Description, const opencascade::handle<StepBasic_MeasureWithUnit> & theGeometricTolerance_Magnitude, const StepDimTol_GeometricToleranceTarget & theGeometricTolerance_TolerancedShapeAspect, const StepDimTol_LimitCondition theModifier);

		/****** StepDimTol_ModifiedGeometricTolerance::Modifier ******/
		/****** md5 signature: 20df8477b8adc460f32800e14001f968 ******/
		%feature("compactdefaultargs") Modifier;
		%feature("autodoc", "Return
-------
StepDimTol_LimitCondition

Description
-----------
Returns field Modifier.
") Modifier;
		StepDimTol_LimitCondition Modifier();

		/****** StepDimTol_ModifiedGeometricTolerance::SetModifier ******/
		/****** md5 signature: 1b60a90f8e6c7095ed0231c8be998c03 ******/
		%feature("compactdefaultargs") SetModifier;
		%feature("autodoc", "
Parameters
----------
theModifier: StepDimTol_LimitCondition

Return
-------
None

Description
-----------
Set field Modifier.
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
		/****** StepDimTol_NonUniformZoneDefinition::StepDimTol_NonUniformZoneDefinition ******/
		/****** md5 signature: 1c779565f71af147a72aae39d589ac2d ******/
		%feature("compactdefaultargs") StepDimTol_NonUniformZoneDefinition;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
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
		/****** StepDimTol_PlacedDatumTargetFeature::StepDimTol_PlacedDatumTargetFeature ******/
		/****** md5 signature: fc481888ff64cf747c6469855465b763 ******/
		%feature("compactdefaultargs") StepDimTol_PlacedDatumTargetFeature;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
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
		/****** StepDimTol_PositionTolerance::StepDimTol_PositionTolerance ******/
		/****** md5 signature: 8823504fa6b5a5d14a31cbd23ebb4fca ******/
		%feature("compactdefaultargs") StepDimTol_PositionTolerance;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
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
		/****** StepDimTol_ProjectedZoneDefinition::StepDimTol_ProjectedZoneDefinition ******/
		/****** md5 signature: 4bab56edbaf36e9f9722cec0309c27fa ******/
		%feature("compactdefaultargs") StepDimTol_ProjectedZoneDefinition;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepDimTol_ProjectedZoneDefinition;
		 StepDimTol_ProjectedZoneDefinition();

		/****** StepDimTol_ProjectedZoneDefinition::Init ******/
		/****** md5 signature: 6d4c289426755543b1179dd9d3ceda86 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theZone: StepDimTol_ToleranceZone
theBoundaries: StepRepr_HArray1OfShapeAspect
theProjectionEnd: StepRepr_ShapeAspect
theProjectionLength: StepBasic_LengthMeasureWithUnit

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<StepDimTol_ToleranceZone> & theZone, const opencascade::handle<StepRepr_HArray1OfShapeAspect> & theBoundaries, const opencascade::handle<StepRepr_ShapeAspect> & theProjectionEnd, const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theProjectionLength);

		/****** StepDimTol_ProjectedZoneDefinition::ProjectionEnd ******/
		/****** md5 signature: 282e8d9d1a4edefe16841f9447ff0602 ******/
		%feature("compactdefaultargs") ProjectionEnd;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_ShapeAspect>

Description
-----------
Returns field ProjectionEnd.
") ProjectionEnd;
		opencascade::handle<StepRepr_ShapeAspect> ProjectionEnd();

		/****** StepDimTol_ProjectedZoneDefinition::ProjectionLength ******/
		/****** md5 signature: 4d5f37f36aba4a2c9941b3b16a842e4a ******/
		%feature("compactdefaultargs") ProjectionLength;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_LengthMeasureWithUnit>

Description
-----------
Returns field ProjectionLength.
") ProjectionLength;
		opencascade::handle<StepBasic_LengthMeasureWithUnit> ProjectionLength();

		/****** StepDimTol_ProjectedZoneDefinition::SetProjectionEnd ******/
		/****** md5 signature: 5d9520f3aca77475b16948046f248db0 ******/
		%feature("compactdefaultargs") SetProjectionEnd;
		%feature("autodoc", "
Parameters
----------
theProjectionEnd: StepRepr_ShapeAspect

Return
-------
None

Description
-----------
Set field ProjectionEnd.
") SetProjectionEnd;
		void SetProjectionEnd(const opencascade::handle<StepRepr_ShapeAspect> & theProjectionEnd);

		/****** StepDimTol_ProjectedZoneDefinition::SetProjectionLength ******/
		/****** md5 signature: 23d060d1b565e33a6c172da34cd5e94e ******/
		%feature("compactdefaultargs") SetProjectionLength;
		%feature("autodoc", "
Parameters
----------
theProjectionLength: StepBasic_LengthMeasureWithUnit

Return
-------
None

Description
-----------
Set field ProjectionLength.
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
		/****** StepDimTol_RoundnessTolerance::StepDimTol_RoundnessTolerance ******/
		/****** md5 signature: 98b99dbb3a6f9b52914a35333b35cfb6 ******/
		%feature("compactdefaultargs") StepDimTol_RoundnessTolerance;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
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
		/****** StepDimTol_RunoutZoneDefinition::StepDimTol_RunoutZoneDefinition ******/
		/****** md5 signature: 33df8c412455a507c5930001cff57996 ******/
		%feature("compactdefaultargs") StepDimTol_RunoutZoneDefinition;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepDimTol_RunoutZoneDefinition;
		 StepDimTol_RunoutZoneDefinition();

		/****** StepDimTol_RunoutZoneDefinition::Init ******/
		/****** md5 signature: 9215e68a460975364a366957f5f77c03 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theZone: StepDimTol_ToleranceZone
theBoundaries: StepRepr_HArray1OfShapeAspect
theOrientation: StepDimTol_RunoutZoneOrientation

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<StepDimTol_ToleranceZone> & theZone, const opencascade::handle<StepRepr_HArray1OfShapeAspect> & theBoundaries, const opencascade::handle<StepDimTol_RunoutZoneOrientation> & theOrientation);

		/****** StepDimTol_RunoutZoneDefinition::Orientation ******/
		/****** md5 signature: c5b25e9bff4cf5738e8902000935f564 ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepDimTol_RunoutZoneOrientation>

Description
-----------
Returns field Orientation.
") Orientation;
		opencascade::handle<StepDimTol_RunoutZoneOrientation> Orientation();

		/****** StepDimTol_RunoutZoneDefinition::SetOrientation ******/
		/****** md5 signature: db78f94b7a516a237c2cf9b984a8311a ******/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "
Parameters
----------
theOrientation: StepDimTol_RunoutZoneOrientation

Return
-------
None

Description
-----------
Set field Orientation.
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
		/****** StepDimTol_StraightnessTolerance::StepDimTol_StraightnessTolerance ******/
		/****** md5 signature: f2cc0c0af1a6e95e06be2e616f17e232 ******/
		%feature("compactdefaultargs") StepDimTol_StraightnessTolerance;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
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
		/****** StepDimTol_SurfaceProfileTolerance::StepDimTol_SurfaceProfileTolerance ******/
		/****** md5 signature: aa2edb18cb25ba6996237c5ef487e27d ******/
		%feature("compactdefaultargs") StepDimTol_SurfaceProfileTolerance;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
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
		/****** StepDimTol_UnequallyDisposedGeometricTolerance::StepDimTol_UnequallyDisposedGeometricTolerance ******/
		/****** md5 signature: b66bc1e59796bb19f1e1578414dd5fab ******/
		%feature("compactdefaultargs") StepDimTol_UnequallyDisposedGeometricTolerance;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepDimTol_UnequallyDisposedGeometricTolerance;
		 StepDimTol_UnequallyDisposedGeometricTolerance();

		/****** StepDimTol_UnequallyDisposedGeometricTolerance::Displacement ******/
		/****** md5 signature: 62643d1feb4ebe11cb6199e0da458126 ******/
		%feature("compactdefaultargs") Displacement;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_LengthMeasureWithUnit>

Description
-----------
Returns field Displacement.
") Displacement;
		opencascade::handle<StepBasic_LengthMeasureWithUnit> Displacement();

		/****** StepDimTol_UnequallyDisposedGeometricTolerance::Init ******/
		/****** md5 signature: 20f92bd7a2186d2e9166bb57346d712d ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString
theMagnitude: StepBasic_MeasureWithUnit
theTolerancedShapeAspect: StepDimTol_GeometricToleranceTarget
theDisplacement: StepBasic_LengthMeasureWithUnit

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription, const opencascade::handle<StepBasic_MeasureWithUnit> & theMagnitude, const StepDimTol_GeometricToleranceTarget & theTolerancedShapeAspect, const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theDisplacement);

		/****** StepDimTol_UnequallyDisposedGeometricTolerance::SetDisplacement ******/
		/****** md5 signature: a1fb1b44a4e91e16881749519d1e7127 ******/
		%feature("compactdefaultargs") SetDisplacement;
		%feature("autodoc", "
Parameters
----------
theDisplacement: StepBasic_LengthMeasureWithUnit

Return
-------
None

Description
-----------
Set field Displacement.
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
		/****** StepDimTol_AngularityTolerance::StepDimTol_AngularityTolerance ******/
		/****** md5 signature: d28a178f9926ec13bcd1c81f36279fec ******/
		%feature("compactdefaultargs") StepDimTol_AngularityTolerance;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
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
		/****** StepDimTol_CircularRunoutTolerance::StepDimTol_CircularRunoutTolerance ******/
		/****** md5 signature: 33a4befe6d26b92d101d9d7aab1bb982 ******/
		%feature("compactdefaultargs") StepDimTol_CircularRunoutTolerance;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
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
		/****** StepDimTol_CoaxialityTolerance::StepDimTol_CoaxialityTolerance ******/
		/****** md5 signature: ec60df7c53b88bdb2275cebad9d324b3 ******/
		%feature("compactdefaultargs") StepDimTol_CoaxialityTolerance;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
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
		/****** StepDimTol_ConcentricityTolerance::StepDimTol_ConcentricityTolerance ******/
		/****** md5 signature: e1a0a0b90e6723a5aa3a7a9c1d521f72 ******/
		%feature("compactdefaultargs") StepDimTol_ConcentricityTolerance;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
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
		/****** StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol::StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol ******/
		/****** md5 signature: 13c22e354088c9a2afc45568a653f2e8 ******/
		%feature("compactdefaultargs") StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol;
		 StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol();

		/****** StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol::GetMaxTolerance ******/
		/****** md5 signature: 33b89af25852c0dfcdfc2036d5687567 ******/
		%feature("compactdefaultargs") GetMaxTolerance;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_LengthMeasureWithUnit>

Description
-----------
No available documentation.
") GetMaxTolerance;
		opencascade::handle<StepBasic_LengthMeasureWithUnit> GetMaxTolerance();

		/****** StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol::Init ******/
		/****** md5 signature: b7cd711d36fa0c6c1c5adad5faa90dbc ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription, const opencascade::handle<StepBasic_MeasureWithUnit> & theMagnitude, const opencascade::handle<StepRepr_ShapeAspect> & theTolerancedShapeAspect, const opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> & theGTWDR, const opencascade::handle<StepDimTol_GeometricToleranceWithModifiers> & theGTWM, const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theMaxTol, const StepDimTol_GeometricToleranceType theType);

		/****** StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol::Init ******/
		/****** md5 signature: 947955a61b0191095c21aea003638114 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_MeasureWithUnit> & aMagnitude, const StepDimTol_GeometricToleranceTarget & aTolerancedShapeAspect, const opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> & aGTWDR, const opencascade::handle<StepDimTol_GeometricToleranceWithModifiers> & aGTWM, const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theMaxTol, const StepDimTol_GeometricToleranceType theType);

		/****** StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol::SetMaxTolerance ******/
		/****** md5 signature: 68b0455fe65047836523ed4233e314ae ******/
		%feature("compactdefaultargs") SetMaxTolerance;
		%feature("autodoc", "
Parameters
----------
theMaxTol: StepBasic_LengthMeasureWithUnit

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepDimTol_GeoTolAndGeoTolWthDatRefAndUneqDisGeoTol::StepDimTol_GeoTolAndGeoTolWthDatRefAndUneqDisGeoTol ******/
		/****** md5 signature: 4dd3e5d30ac1026c526fe29840b91f5e ******/
		%feature("compactdefaultargs") StepDimTol_GeoTolAndGeoTolWthDatRefAndUneqDisGeoTol;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepDimTol_GeoTolAndGeoTolWthDatRefAndUneqDisGeoTol;
		 StepDimTol_GeoTolAndGeoTolWthDatRefAndUneqDisGeoTol();

		/****** StepDimTol_GeoTolAndGeoTolWthDatRefAndUneqDisGeoTol::GetUnequallyDisposedGeometricTolerance ******/
		/****** md5 signature: 8dfd86acc82cab683c6de58e15782206 ******/
		%feature("compactdefaultargs") GetUnequallyDisposedGeometricTolerance;
		%feature("autodoc", "Return
-------
opencascade::handle<StepDimTol_UnequallyDisposedGeometricTolerance>

Description
-----------
No available documentation.
") GetUnequallyDisposedGeometricTolerance;
		opencascade::handle<StepDimTol_UnequallyDisposedGeometricTolerance> GetUnequallyDisposedGeometricTolerance();

		/****** StepDimTol_GeoTolAndGeoTolWthDatRefAndUneqDisGeoTol::Init ******/
		/****** md5 signature: fafa8191d22e8911f4e9bb802fbbe294 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString
theMagnitude: StepBasic_MeasureWithUnit
theTolerancedShapeAspect: StepRepr_ShapeAspect
theGTWDR: StepDimTol_GeometricToleranceWithDatumReference
theType: StepDimTol_GeometricToleranceType
theUDGT: StepDimTol_UnequallyDisposedGeometricTolerance

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription, const opencascade::handle<StepBasic_MeasureWithUnit> & theMagnitude, const opencascade::handle<StepRepr_ShapeAspect> & theTolerancedShapeAspect, const opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> & theGTWDR, const StepDimTol_GeometricToleranceType theType, const opencascade::handle<StepDimTol_UnequallyDisposedGeometricTolerance> & theUDGT);

		/****** StepDimTol_GeoTolAndGeoTolWthDatRefAndUneqDisGeoTol::Init ******/
		/****** md5 signature: b4b0b06811663f3488293384663aadbe ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aMagnitude: StepBasic_MeasureWithUnit
aTolerancedShapeAspect: StepDimTol_GeometricToleranceTarget
aGTWDR: StepDimTol_GeometricToleranceWithDatumReference
theType: StepDimTol_GeometricToleranceType
theUDGT: StepDimTol_UnequallyDisposedGeometricTolerance

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_MeasureWithUnit> & aMagnitude, const StepDimTol_GeometricToleranceTarget & aTolerancedShapeAspect, const opencascade::handle<StepDimTol_GeometricToleranceWithDatumReference> & aGTWDR, const StepDimTol_GeometricToleranceType theType, const opencascade::handle<StepDimTol_UnequallyDisposedGeometricTolerance> & theUDGT);

		/****** StepDimTol_GeoTolAndGeoTolWthDatRefAndUneqDisGeoTol::SetUnequallyDisposedGeometricTolerance ******/
		/****** md5 signature: 00b86acaf28544b98eed16a6d1c1e3e0 ******/
		%feature("compactdefaultargs") SetUnequallyDisposedGeometricTolerance;
		%feature("autodoc", "
Parameters
----------
theUDGT: StepDimTol_UnequallyDisposedGeometricTolerance

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepDimTol_GeoTolAndGeoTolWthMaxTol::StepDimTol_GeoTolAndGeoTolWthMaxTol ******/
		/****** md5 signature: 85dfc68d7676e8ff3f71ac85e80d8715 ******/
		%feature("compactdefaultargs") StepDimTol_GeoTolAndGeoTolWthMaxTol;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepDimTol_GeoTolAndGeoTolWthMaxTol;
		 StepDimTol_GeoTolAndGeoTolWthMaxTol();

		/****** StepDimTol_GeoTolAndGeoTolWthMaxTol::GetMaxTolerance ******/
		/****** md5 signature: 33b89af25852c0dfcdfc2036d5687567 ******/
		%feature("compactdefaultargs") GetMaxTolerance;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_LengthMeasureWithUnit>

Description
-----------
No available documentation.
") GetMaxTolerance;
		opencascade::handle<StepBasic_LengthMeasureWithUnit> GetMaxTolerance();

		/****** StepDimTol_GeoTolAndGeoTolWthMaxTol::Init ******/
		/****** md5 signature: 57af504a837853cb45d399427161ba76 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString
theMagnitude: StepBasic_MeasureWithUnit
theTolerancedShapeAspect: StepRepr_ShapeAspect
theGTWM: StepDimTol_GeometricToleranceWithModifiers
theMaxTol: StepBasic_LengthMeasureWithUnit
theType: StepDimTol_GeometricToleranceType

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription, const opencascade::handle<StepBasic_MeasureWithUnit> & theMagnitude, const opencascade::handle<StepRepr_ShapeAspect> & theTolerancedShapeAspect, const opencascade::handle<StepDimTol_GeometricToleranceWithModifiers> & theGTWM, const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theMaxTol, const StepDimTol_GeometricToleranceType theType);

		/****** StepDimTol_GeoTolAndGeoTolWthMaxTol::Init ******/
		/****** md5 signature: ab9566f4a0d25e2fcca0e142c362d2fb ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aMagnitude: StepBasic_MeasureWithUnit
aTolerancedShapeAspect: StepDimTol_GeometricToleranceTarget
aGTWM: StepDimTol_GeometricToleranceWithModifiers
theMaxTol: StepBasic_LengthMeasureWithUnit
theType: StepDimTol_GeometricToleranceType

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_MeasureWithUnit> & aMagnitude, const StepDimTol_GeometricToleranceTarget & aTolerancedShapeAspect, const opencascade::handle<StepDimTol_GeometricToleranceWithModifiers> & aGTWM, const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theMaxTol, const StepDimTol_GeometricToleranceType theType);

		/****** StepDimTol_GeoTolAndGeoTolWthMaxTol::SetMaxTolerance ******/
		/****** md5 signature: 68b0455fe65047836523ed4233e314ae ******/
		%feature("compactdefaultargs") SetMaxTolerance;
		%feature("autodoc", "
Parameters
----------
theMaxTol: StepBasic_LengthMeasureWithUnit

Return
-------
None

Description
-----------
No available documentation.
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
		/****** StepDimTol_GeometricToleranceWithDefinedAreaUnit::StepDimTol_GeometricToleranceWithDefinedAreaUnit ******/
		/****** md5 signature: 8f750423232edc527f5a6798cbb193f9 ******/
		%feature("compactdefaultargs") StepDimTol_GeometricToleranceWithDefinedAreaUnit;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepDimTol_GeometricToleranceWithDefinedAreaUnit;
		 StepDimTol_GeometricToleranceWithDefinedAreaUnit();

		/****** StepDimTol_GeometricToleranceWithDefinedAreaUnit::AreaType ******/
		/****** md5 signature: 05ebe8194cb66814756a613f905036fa ******/
		%feature("compactdefaultargs") AreaType;
		%feature("autodoc", "Return
-------
StepDimTol_AreaUnitType

Description
-----------
Returns field AreaType.
") AreaType;
		StepDimTol_AreaUnitType AreaType();

		/****** StepDimTol_GeometricToleranceWithDefinedAreaUnit::HasSecondUnitSize ******/
		/****** md5 signature: cfb1a0ebc66fdc4fe8bb892ccf734e1c ******/
		%feature("compactdefaultargs") HasSecondUnitSize;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Indicates if SecondUnitSize field exist.
") HasSecondUnitSize;
		Standard_Boolean HasSecondUnitSize();

		/****** StepDimTol_GeometricToleranceWithDefinedAreaUnit::Init ******/
		/****** md5 signature: 1cbb2d4b4060f14485541c03ec4b5bd2 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription, const opencascade::handle<StepBasic_MeasureWithUnit> & theMagnitude, const StepDimTol_GeometricToleranceTarget & theTolerancedShapeAspect, const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theUnitSize, const StepDimTol_AreaUnitType theAreaType, const Standard_Boolean theHasSecondUnitSize, const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theSecondUnitSize);

		/****** StepDimTol_GeometricToleranceWithDefinedAreaUnit::SecondUnitSize ******/
		/****** md5 signature: 30f9d8c27757afa6662a89b63c0a8785 ******/
		%feature("compactdefaultargs") SecondUnitSize;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_LengthMeasureWithUnit>

Description
-----------
Returns field SecondUnitSize.
") SecondUnitSize;
		opencascade::handle<StepBasic_LengthMeasureWithUnit> SecondUnitSize();

		/****** StepDimTol_GeometricToleranceWithDefinedAreaUnit::SetAreaType ******/
		/****** md5 signature: 9644dafae4c4f51214f210a1a1c581b4 ******/
		%feature("compactdefaultargs") SetAreaType;
		%feature("autodoc", "
Parameters
----------
theAreaType: StepDimTol_AreaUnitType

Return
-------
None

Description
-----------
Set field AreaType.
") SetAreaType;
		void SetAreaType(const StepDimTol_AreaUnitType theAreaType);

		/****** StepDimTol_GeometricToleranceWithDefinedAreaUnit::SetSecondUnitSize ******/
		/****** md5 signature: 6696147c85603519386dcff5053118de ******/
		%feature("compactdefaultargs") SetSecondUnitSize;
		%feature("autodoc", "
Parameters
----------
theSecondUnitSize: StepBasic_LengthMeasureWithUnit

Return
-------
None

Description
-----------
Set field SecondUnitSize.
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
		/****** StepDimTol_GeometricToleranceWithMaximumTolerance::StepDimTol_GeometricToleranceWithMaximumTolerance ******/
		/****** md5 signature: 326d2a8b8c9af165d6eb162ea6a2744c ******/
		%feature("compactdefaultargs") StepDimTol_GeometricToleranceWithMaximumTolerance;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepDimTol_GeometricToleranceWithMaximumTolerance;
		 StepDimTol_GeometricToleranceWithMaximumTolerance();

		/****** StepDimTol_GeometricToleranceWithMaximumTolerance::Init ******/
		/****** md5 signature: 0bbfb3585ce631351b57b4e13326ac18 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString
theMagnitude: StepBasic_MeasureWithUnit
theTolerancedShapeAspect: StepDimTol_GeometricToleranceTarget
theModifiers: StepDimTol_HArray1OfGeometricToleranceModifier
theUnitSize: StepBasic_LengthMeasureWithUnit

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription, const opencascade::handle<StepBasic_MeasureWithUnit> & theMagnitude, const StepDimTol_GeometricToleranceTarget & theTolerancedShapeAspect, const opencascade::handle<StepDimTol_HArray1OfGeometricToleranceModifier> & theModifiers, const opencascade::handle<StepBasic_LengthMeasureWithUnit> & theUnitSize);

		/****** StepDimTol_GeometricToleranceWithMaximumTolerance::MaximumUpperTolerance ******/
		/****** md5 signature: c6d5b9d150449ad00ea030ff59edf365 ******/
		%feature("compactdefaultargs") MaximumUpperTolerance;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_LengthMeasureWithUnit>

Description
-----------
Returns field MaximumUpperTolerance.
") MaximumUpperTolerance;
		opencascade::handle<StepBasic_LengthMeasureWithUnit> MaximumUpperTolerance();

		/****** StepDimTol_GeometricToleranceWithMaximumTolerance::SetMaximumUpperTolerance ******/
		/****** md5 signature: a3ccb1445128271cb084d59267279817 ******/
		%feature("compactdefaultargs") SetMaximumUpperTolerance;
		%feature("autodoc", "
Parameters
----------
theMaximumUpperTolerance: StepBasic_LengthMeasureWithUnit

Return
-------
None

Description
-----------
Set field MaximumUpperTolerance.
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
		/****** StepDimTol_ParallelismTolerance::StepDimTol_ParallelismTolerance ******/
		/****** md5 signature: 9645dbe3dbd17da3bff1f0be4ffbebe9 ******/
		%feature("compactdefaultargs") StepDimTol_ParallelismTolerance;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
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
		/****** StepDimTol_PerpendicularityTolerance::StepDimTol_PerpendicularityTolerance ******/
		/****** md5 signature: 46a27ba845c64fe88435aa0676578fdf ******/
		%feature("compactdefaultargs") StepDimTol_PerpendicularityTolerance;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
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
		/****** StepDimTol_SymmetryTolerance::StepDimTol_SymmetryTolerance ******/
		/****** md5 signature: fc806b4ba6a4d0b14771e2b559585f01 ******/
		%feature("compactdefaultargs") StepDimTol_SymmetryTolerance;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
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
		/****** StepDimTol_TotalRunoutTolerance::StepDimTol_TotalRunoutTolerance ******/
		/****** md5 signature: 1fcf405a33a73c086d1064f39c2b818c ******/
		%feature("compactdefaultargs") StepDimTol_TotalRunoutTolerance;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
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

class StepDimTol_HArray1OfDatumReference : public StepDimTol_Array1OfDatumReference, public Standard_Transient {
  public:
    StepDimTol_HArray1OfDatumReference(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepDimTol_HArray1OfDatumReference(const Standard_Integer theLower, const Standard_Integer theUpper, const StepDimTol_Array1OfDatumReference::value_type& theValue);
    StepDimTol_HArray1OfDatumReference(const StepDimTol_Array1OfDatumReference& theOther);
    const StepDimTol_Array1OfDatumReference& Array1();
    StepDimTol_Array1OfDatumReference& ChangeArray1();
};
%make_alias(StepDimTol_HArray1OfDatumReference)


class StepDimTol_HArray1OfDatumReferenceCompartment : public StepDimTol_Array1OfDatumReferenceCompartment, public Standard_Transient {
  public:
    StepDimTol_HArray1OfDatumReferenceCompartment(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepDimTol_HArray1OfDatumReferenceCompartment(const Standard_Integer theLower, const Standard_Integer theUpper, const StepDimTol_Array1OfDatumReferenceCompartment::value_type& theValue);
    StepDimTol_HArray1OfDatumReferenceCompartment(const StepDimTol_Array1OfDatumReferenceCompartment& theOther);
    const StepDimTol_Array1OfDatumReferenceCompartment& Array1();
    StepDimTol_Array1OfDatumReferenceCompartment& ChangeArray1();
};
%make_alias(StepDimTol_HArray1OfDatumReferenceCompartment)


class StepDimTol_HArray1OfDatumReferenceElement : public StepDimTol_Array1OfDatumReferenceElement, public Standard_Transient {
  public:
    StepDimTol_HArray1OfDatumReferenceElement(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepDimTol_HArray1OfDatumReferenceElement(const Standard_Integer theLower, const Standard_Integer theUpper, const StepDimTol_Array1OfDatumReferenceElement::value_type& theValue);
    StepDimTol_HArray1OfDatumReferenceElement(const StepDimTol_Array1OfDatumReferenceElement& theOther);
    const StepDimTol_Array1OfDatumReferenceElement& Array1();
    StepDimTol_Array1OfDatumReferenceElement& ChangeArray1();
};
%make_alias(StepDimTol_HArray1OfDatumReferenceElement)


class StepDimTol_HArray1OfDatumReferenceModifier : public StepDimTol_Array1OfDatumReferenceModifier, public Standard_Transient {
  public:
    StepDimTol_HArray1OfDatumReferenceModifier(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepDimTol_HArray1OfDatumReferenceModifier(const Standard_Integer theLower, const Standard_Integer theUpper, const StepDimTol_Array1OfDatumReferenceModifier::value_type& theValue);
    StepDimTol_HArray1OfDatumReferenceModifier(const StepDimTol_Array1OfDatumReferenceModifier& theOther);
    const StepDimTol_Array1OfDatumReferenceModifier& Array1();
    StepDimTol_Array1OfDatumReferenceModifier& ChangeArray1();
};
%make_alias(StepDimTol_HArray1OfDatumReferenceModifier)


class StepDimTol_HArray1OfDatumSystemOrReference : public StepDimTol_Array1OfDatumSystemOrReference, public Standard_Transient {
  public:
    StepDimTol_HArray1OfDatumSystemOrReference(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepDimTol_HArray1OfDatumSystemOrReference(const Standard_Integer theLower, const Standard_Integer theUpper, const StepDimTol_Array1OfDatumSystemOrReference::value_type& theValue);
    StepDimTol_HArray1OfDatumSystemOrReference(const StepDimTol_Array1OfDatumSystemOrReference& theOther);
    const StepDimTol_Array1OfDatumSystemOrReference& Array1();
    StepDimTol_Array1OfDatumSystemOrReference& ChangeArray1();
};
%make_alias(StepDimTol_HArray1OfDatumSystemOrReference)


class StepDimTol_HArray1OfGeometricToleranceModifier : public StepDimTol_Array1OfGeometricToleranceModifier, public Standard_Transient {
  public:
    StepDimTol_HArray1OfGeometricToleranceModifier(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepDimTol_HArray1OfGeometricToleranceModifier(const Standard_Integer theLower, const Standard_Integer theUpper, const StepDimTol_Array1OfGeometricToleranceModifier::value_type& theValue);
    StepDimTol_HArray1OfGeometricToleranceModifier(const StepDimTol_Array1OfGeometricToleranceModifier& theOther);
    const StepDimTol_Array1OfGeometricToleranceModifier& Array1();
    StepDimTol_Array1OfGeometricToleranceModifier& ChangeArray1();
};
%make_alias(StepDimTol_HArray1OfGeometricToleranceModifier)


class StepDimTol_HArray1OfToleranceZoneTarget : public StepDimTol_Array1OfToleranceZoneTarget, public Standard_Transient {
  public:
    StepDimTol_HArray1OfToleranceZoneTarget(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepDimTol_HArray1OfToleranceZoneTarget(const Standard_Integer theLower, const Standard_Integer theUpper, const StepDimTol_Array1OfToleranceZoneTarget::value_type& theValue);
    StepDimTol_HArray1OfToleranceZoneTarget(const StepDimTol_Array1OfToleranceZoneTarget& theOther);
    const StepDimTol_Array1OfToleranceZoneTarget& Array1();
    StepDimTol_Array1OfToleranceZoneTarget& ChangeArray1();
};
%make_alias(StepDimTol_HArray1OfToleranceZoneTarget)

/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
