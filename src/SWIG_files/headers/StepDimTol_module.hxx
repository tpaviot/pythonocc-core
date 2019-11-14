#ifndef STEPDIMTOL_HXX
#define STEPDIMTOL_HXX

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

#include<StepDimTol_AngularityTolerance.hxx>
#include<StepDimTol_AreaUnitType.hxx>
#include<StepDimTol_Array1OfDatumReference.hxx>
#include<StepDimTol_Array1OfDatumReferenceCompartment.hxx>
#include<StepDimTol_Array1OfDatumReferenceElement.hxx>
#include<StepDimTol_Array1OfDatumReferenceModifier.hxx>
#include<StepDimTol_Array1OfDatumSystemOrReference.hxx>
#include<StepDimTol_Array1OfGeometricToleranceModifier.hxx>
#include<StepDimTol_Array1OfToleranceZoneTarget.hxx>
#include<StepDimTol_CircularRunoutTolerance.hxx>
#include<StepDimTol_CoaxialityTolerance.hxx>
#include<StepDimTol_CommonDatum.hxx>
#include<StepDimTol_ConcentricityTolerance.hxx>
#include<StepDimTol_CylindricityTolerance.hxx>
#include<StepDimTol_Datum.hxx>
#include<StepDimTol_DatumFeature.hxx>
#include<StepDimTol_DatumOrCommonDatum.hxx>
#include<StepDimTol_DatumReference.hxx>
#include<StepDimTol_DatumReferenceCompartment.hxx>
#include<StepDimTol_DatumReferenceElement.hxx>
#include<StepDimTol_DatumReferenceModifier.hxx>
#include<StepDimTol_DatumReferenceModifierType.hxx>
#include<StepDimTol_DatumReferenceModifierWithValue.hxx>
#include<StepDimTol_DatumSystem.hxx>
#include<StepDimTol_DatumSystemOrReference.hxx>
#include<StepDimTol_DatumTarget.hxx>
#include<StepDimTol_FlatnessTolerance.hxx>
#include<StepDimTol_GeneralDatumReference.hxx>
#include<StepDimTol_GeoTolAndGeoTolWthDatRef.hxx>
#include<StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMaxTol.hxx>
#include<StepDimTol_GeoTolAndGeoTolWthDatRefAndGeoTolWthMod.hxx>
#include<StepDimTol_GeoTolAndGeoTolWthDatRefAndModGeoTolAndPosTol.hxx>
#include<StepDimTol_GeoTolAndGeoTolWthDatRefAndUneqDisGeoTol.hxx>
#include<StepDimTol_GeoTolAndGeoTolWthMaxTol.hxx>
#include<StepDimTol_GeoTolAndGeoTolWthMod.hxx>
#include<StepDimTol_GeometricTolerance.hxx>
#include<StepDimTol_GeometricToleranceModifier.hxx>
#include<StepDimTol_GeometricToleranceRelationship.hxx>
#include<StepDimTol_GeometricToleranceTarget.hxx>
#include<StepDimTol_GeometricToleranceType.hxx>
#include<StepDimTol_GeometricToleranceWithDatumReference.hxx>
#include<StepDimTol_GeometricToleranceWithDefinedAreaUnit.hxx>
#include<StepDimTol_GeometricToleranceWithDefinedUnit.hxx>
#include<StepDimTol_GeometricToleranceWithMaximumTolerance.hxx>
#include<StepDimTol_GeometricToleranceWithModifiers.hxx>
#include<StepDimTol_HArray1OfDatumReference.hxx>
#include<StepDimTol_HArray1OfDatumReferenceCompartment.hxx>
#include<StepDimTol_HArray1OfDatumReferenceElement.hxx>
#include<StepDimTol_HArray1OfDatumReferenceModifier.hxx>
#include<StepDimTol_HArray1OfDatumSystemOrReference.hxx>
#include<StepDimTol_HArray1OfGeometricToleranceModifier.hxx>
#include<StepDimTol_HArray1OfToleranceZoneTarget.hxx>
#include<StepDimTol_LimitCondition.hxx>
#include<StepDimTol_LineProfileTolerance.hxx>
#include<StepDimTol_ModifiedGeometricTolerance.hxx>
#include<StepDimTol_NonUniformZoneDefinition.hxx>
#include<StepDimTol_ParallelismTolerance.hxx>
#include<StepDimTol_PerpendicularityTolerance.hxx>
#include<StepDimTol_PlacedDatumTargetFeature.hxx>
#include<StepDimTol_PositionTolerance.hxx>
#include<StepDimTol_ProjectedZoneDefinition.hxx>
#include<StepDimTol_RoundnessTolerance.hxx>
#include<StepDimTol_RunoutZoneDefinition.hxx>
#include<StepDimTol_RunoutZoneOrientation.hxx>
#include<StepDimTol_ShapeToleranceSelect.hxx>
#include<StepDimTol_SimpleDatumReferenceModifier.hxx>
#include<StepDimTol_SimpleDatumReferenceModifierMember.hxx>
#include<StepDimTol_StraightnessTolerance.hxx>
#include<StepDimTol_SurfaceProfileTolerance.hxx>
#include<StepDimTol_SymmetryTolerance.hxx>
#include<StepDimTol_ToleranceZone.hxx>
#include<StepDimTol_ToleranceZoneDefinition.hxx>
#include<StepDimTol_ToleranceZoneForm.hxx>
#include<StepDimTol_ToleranceZoneTarget.hxx>
#include<StepDimTol_TotalRunoutTolerance.hxx>
#include<StepDimTol_UnequallyDisposedGeometricTolerance.hxx>

#endif // STEPDIMTOL_HXX
