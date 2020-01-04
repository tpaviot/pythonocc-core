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
%define XCAFDIMTOLOBJECTSDOCSTRING
"XCAFDimTolObjects module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_xcafdimtolobjects.html"
%enddef
%module (package="OCC.Core", docstring=XCAFDIMTOLOBJECTSDOCSTRING) XCAFDimTolObjects


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
#include<XCAFDimTolObjects_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<gp_module.hxx>
#include<TCollection_module.hxx>
#include<TColStd_module.hxx>
#include<TDocStd_module.hxx>
#include<Message_module.hxx>
#include<CDF_module.hxx>
#include<CDM_module.hxx>
#include<PCDM_module.hxx>
#include<LDOM_module.hxx>
#include<TDF_module.hxx>
#include<Resource_module.hxx>
#include<TopLoc_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i
%import gp.i
%import TCollection.i
%import TColStd.i
%import TDocStd.i
/* public enums */
enum XCAFDimTolObjects_GeomToleranceType {
	XCAFDimTolObjects_GeomToleranceType_None = 0,
	XCAFDimTolObjects_GeomToleranceType_Angularity = 1,
	XCAFDimTolObjects_GeomToleranceType_CircularRunout = 2,
	XCAFDimTolObjects_GeomToleranceType_CircularityOrRoundness = 3,
	XCAFDimTolObjects_GeomToleranceType_Coaxiality = 4,
	XCAFDimTolObjects_GeomToleranceType_Concentricity = 5,
	XCAFDimTolObjects_GeomToleranceType_Cylindricity = 6,
	XCAFDimTolObjects_GeomToleranceType_Flatness = 7,
	XCAFDimTolObjects_GeomToleranceType_Parallelism = 8,
	XCAFDimTolObjects_GeomToleranceType_Perpendicularity = 9,
	XCAFDimTolObjects_GeomToleranceType_Position = 10,
	XCAFDimTolObjects_GeomToleranceType_ProfileOfLine = 11,
	XCAFDimTolObjects_GeomToleranceType_ProfileOfSurface = 12,
	XCAFDimTolObjects_GeomToleranceType_Straightness = 13,
	XCAFDimTolObjects_GeomToleranceType_Symmetry = 14,
	XCAFDimTolObjects_GeomToleranceType_TotalRunout = 15,
};

enum XCAFDimTolObjects_GeomToleranceModif {
	XCAFDimTolObjects_GeomToleranceModif_Any_Cross_Section = 0,
	XCAFDimTolObjects_GeomToleranceModif_Common_Zone = 1,
	XCAFDimTolObjects_GeomToleranceModif_Each_Radial_Element = 2,
	XCAFDimTolObjects_GeomToleranceModif_Free_State = 3,
	XCAFDimTolObjects_GeomToleranceModif_Least_Material_Requirement = 4,
	XCAFDimTolObjects_GeomToleranceModif_Line_Element = 5,
	XCAFDimTolObjects_GeomToleranceModif_Major_Diameter = 6,
	XCAFDimTolObjects_GeomToleranceModif_Maximum_Material_Requirement = 7,
	XCAFDimTolObjects_GeomToleranceModif_Minor_Diameter = 8,
	XCAFDimTolObjects_GeomToleranceModif_Not_Convex = 9,
	XCAFDimTolObjects_GeomToleranceModif_Pitch_Diameter = 10,
	XCAFDimTolObjects_GeomToleranceModif_Reciprocity_Requirement = 11,
	XCAFDimTolObjects_GeomToleranceModif_Separate_Requirement = 12,
	XCAFDimTolObjects_GeomToleranceModif_Statistical_Tolerance = 13,
	XCAFDimTolObjects_GeomToleranceModif_Tangent_Plane = 14,
	XCAFDimTolObjects_GeomToleranceModif_All_Around = 15,
	XCAFDimTolObjects_GeomToleranceModif_All_Over = 16,
};

enum XCAFDimTolObjects_DimensionModif {
	XCAFDimTolObjects_DimensionModif_ControlledRadius = 0,
	XCAFDimTolObjects_DimensionModif_Square = 1,
	XCAFDimTolObjects_DimensionModif_StatisticalTolerance = 2,
	XCAFDimTolObjects_DimensionModif_ContinuousFeature = 3,
	XCAFDimTolObjects_DimensionModif_TwoPointSize = 4,
	XCAFDimTolObjects_DimensionModif_LocalSizeDefinedBySphere = 5,
	XCAFDimTolObjects_DimensionModif_LeastSquaresAssociationCriterion = 6,
	XCAFDimTolObjects_DimensionModif_MaximumInscribedAssociation = 7,
	XCAFDimTolObjects_DimensionModif_MinimumCircumscribedAssociation = 8,
	XCAFDimTolObjects_DimensionModif_CircumferenceDiameter = 9,
	XCAFDimTolObjects_DimensionModif_AreaDiameter = 10,
	XCAFDimTolObjects_DimensionModif_VolumeDiameter = 11,
	XCAFDimTolObjects_DimensionModif_MaximumSize = 12,
	XCAFDimTolObjects_DimensionModif_MinimumSize = 13,
	XCAFDimTolObjects_DimensionModif_AverageSize = 14,
	XCAFDimTolObjects_DimensionModif_MedianSize = 15,
	XCAFDimTolObjects_DimensionModif_MidRangeSize = 16,
	XCAFDimTolObjects_DimensionModif_RangeOfSizes = 17,
	XCAFDimTolObjects_DimensionModif_AnyRestrictedPortionOfFeature = 18,
	XCAFDimTolObjects_DimensionModif_AnyCrossSection = 19,
	XCAFDimTolObjects_DimensionModif_SpecificFixedCrossSection = 20,
	XCAFDimTolObjects_DimensionModif_CommonTolerance = 21,
	XCAFDimTolObjects_DimensionModif_FreeStateCondition = 22,
	XCAFDimTolObjects_DimensionModif_Between = 23,
};

enum XCAFDimTolObjects_DatumModifWithValue {
	XCAFDimTolObjects_DatumModifWithValue_None = 0,
	XCAFDimTolObjects_DatumModifWithValue_CircularOrCylindrical = 1,
	XCAFDimTolObjects_DatumModifWithValue_Distance = 2,
	XCAFDimTolObjects_DatumModifWithValue_Projected = 3,
	XCAFDimTolObjects_DatumModifWithValue_Spherical = 4,
};

enum XCAFDimTolObjects_DimensionFormVariance {
	XCAFDimTolObjects_DimensionFormVariance_None = 0,
	XCAFDimTolObjects_DimensionFormVariance_A = 1,
	XCAFDimTolObjects_DimensionFormVariance_B = 2,
	XCAFDimTolObjects_DimensionFormVariance_C = 3,
	XCAFDimTolObjects_DimensionFormVariance_CD = 4,
	XCAFDimTolObjects_DimensionFormVariance_D = 5,
	XCAFDimTolObjects_DimensionFormVariance_E = 6,
	XCAFDimTolObjects_DimensionFormVariance_EF = 7,
	XCAFDimTolObjects_DimensionFormVariance_F = 8,
	XCAFDimTolObjects_DimensionFormVariance_FG = 9,
	XCAFDimTolObjects_DimensionFormVariance_G = 10,
	XCAFDimTolObjects_DimensionFormVariance_H = 11,
	XCAFDimTolObjects_DimensionFormVariance_JS = 12,
	XCAFDimTolObjects_DimensionFormVariance_J = 13,
	XCAFDimTolObjects_DimensionFormVariance_K = 14,
	XCAFDimTolObjects_DimensionFormVariance_M = 15,
	XCAFDimTolObjects_DimensionFormVariance_N = 16,
	XCAFDimTolObjects_DimensionFormVariance_P = 17,
	XCAFDimTolObjects_DimensionFormVariance_R = 18,
	XCAFDimTolObjects_DimensionFormVariance_S = 19,
	XCAFDimTolObjects_DimensionFormVariance_T = 20,
	XCAFDimTolObjects_DimensionFormVariance_U = 21,
	XCAFDimTolObjects_DimensionFormVariance_V = 22,
	XCAFDimTolObjects_DimensionFormVariance_X = 23,
	XCAFDimTolObjects_DimensionFormVariance_Y = 24,
	XCAFDimTolObjects_DimensionFormVariance_Z = 25,
	XCAFDimTolObjects_DimensionFormVariance_ZA = 26,
	XCAFDimTolObjects_DimensionFormVariance_ZB = 27,
	XCAFDimTolObjects_DimensionFormVariance_ZC = 28,
};

enum XCAFDimTolObjects_GeomToleranceZoneModif {
	XCAFDimTolObjects_GeomToleranceZoneModif_None = 0,
	XCAFDimTolObjects_GeomToleranceZoneModif_Projected = 1,
	XCAFDimTolObjects_GeomToleranceZoneModif_Runout = 2,
	XCAFDimTolObjects_GeomToleranceZoneModif_NonUniform = 3,
};

enum XCAFDimTolObjects_DatumTargetType {
	XCAFDimTolObjects_DatumTargetType_Point = 0,
	XCAFDimTolObjects_DatumTargetType_Line = 1,
	XCAFDimTolObjects_DatumTargetType_Rectangle = 2,
	XCAFDimTolObjects_DatumTargetType_Circle = 3,
	XCAFDimTolObjects_DatumTargetType_Area = 4,
};

enum XCAFDimTolObjects_DatumSingleModif {
	XCAFDimTolObjects_DatumSingleModif_AnyCrossSection = 0,
	XCAFDimTolObjects_DatumSingleModif_Any_LongitudinalSection = 1,
	XCAFDimTolObjects_DatumSingleModif_Basic = 2,
	XCAFDimTolObjects_DatumSingleModif_ContactingFeature = 3,
	XCAFDimTolObjects_DatumSingleModif_DegreeOfFreedomConstraintU = 4,
	XCAFDimTolObjects_DatumSingleModif_DegreeOfFreedomConstraintV = 5,
	XCAFDimTolObjects_DatumSingleModif_DegreeOfFreedomConstraintW = 6,
	XCAFDimTolObjects_DatumSingleModif_DegreeOfFreedomConstraintX = 7,
	XCAFDimTolObjects_DatumSingleModif_DegreeOfFreedomConstraintY = 8,
	XCAFDimTolObjects_DatumSingleModif_DegreeOfFreedomConstraintZ = 9,
	XCAFDimTolObjects_DatumSingleModif_DistanceVariable = 10,
	XCAFDimTolObjects_DatumSingleModif_FreeState = 11,
	XCAFDimTolObjects_DatumSingleModif_LeastMaterialRequirement = 12,
	XCAFDimTolObjects_DatumSingleModif_Line = 13,
	XCAFDimTolObjects_DatumSingleModif_MajorDiameter = 14,
	XCAFDimTolObjects_DatumSingleModif_MaximumMaterialRequirement = 15,
	XCAFDimTolObjects_DatumSingleModif_MinorDiameter = 16,
	XCAFDimTolObjects_DatumSingleModif_Orientation = 17,
	XCAFDimTolObjects_DatumSingleModif_PitchDiameter = 18,
	XCAFDimTolObjects_DatumSingleModif_Plane = 19,
	XCAFDimTolObjects_DatumSingleModif_Point = 20,
	XCAFDimTolObjects_DatumSingleModif_Translation = 21,
};

enum XCAFDimTolObjects_DimensionQualifier {
	XCAFDimTolObjects_DimensionQualifier_None = 0,
	XCAFDimTolObjects_DimensionQualifier_Min = 1,
	XCAFDimTolObjects_DimensionQualifier_Max = 2,
	XCAFDimTolObjects_DimensionQualifier_Avg = 3,
};

enum XCAFDimTolObjects_GeomToleranceTypeValue {
	XCAFDimTolObjects_GeomToleranceTypeValue_None = 0,
	XCAFDimTolObjects_GeomToleranceTypeValue_Diameter = 1,
	XCAFDimTolObjects_GeomToleranceTypeValue_SphericalDiameter = 2,
};

enum XCAFDimTolObjects_ToleranceZoneAffectedPlane {
	XCAFDimTolObjects_ToleranceZoneAffectedPlane_None = 0,
	XCAFDimTolObjects_ToleranceZoneAffectedPlane_Intersection = 1,
	XCAFDimTolObjects_ToleranceZoneAffectedPlane_Orientation = 2,
};

enum XCAFDimTolObjects_DimensionType {
	XCAFDimTolObjects_DimensionType_Location_None = 0,
	XCAFDimTolObjects_DimensionType_Location_CurvedDistance = 1,
	XCAFDimTolObjects_DimensionType_Location_LinearDistance = 2,
	XCAFDimTolObjects_DimensionType_Location_LinearDistance_FromCenterToOuter = 3,
	XCAFDimTolObjects_DimensionType_Location_LinearDistance_FromCenterToInner = 4,
	XCAFDimTolObjects_DimensionType_Location_LinearDistance_FromOuterToCenter = 5,
	XCAFDimTolObjects_DimensionType_Location_LinearDistance_FromOuterToOuter = 6,
	XCAFDimTolObjects_DimensionType_Location_LinearDistance_FromOuterToInner = 7,
	XCAFDimTolObjects_DimensionType_Location_LinearDistance_FromInnerToCenter = 8,
	XCAFDimTolObjects_DimensionType_Location_LinearDistance_FromInnerToOuter = 9,
	XCAFDimTolObjects_DimensionType_Location_LinearDistance_FromInnerToInner = 10,
	XCAFDimTolObjects_DimensionType_Location_Angular = 11,
	XCAFDimTolObjects_DimensionType_Location_Oriented = 12,
	XCAFDimTolObjects_DimensionType_Location_WithPath = 13,
	XCAFDimTolObjects_DimensionType_Size_CurveLength = 14,
	XCAFDimTolObjects_DimensionType_Size_Diameter = 15,
	XCAFDimTolObjects_DimensionType_Size_SphericalDiameter = 16,
	XCAFDimTolObjects_DimensionType_Size_Radius = 17,
	XCAFDimTolObjects_DimensionType_Size_SphericalRadius = 18,
	XCAFDimTolObjects_DimensionType_Size_ToroidalMinorDiameter = 19,
	XCAFDimTolObjects_DimensionType_Size_ToroidalMajorDiameter = 20,
	XCAFDimTolObjects_DimensionType_Size_ToroidalMinorRadius = 21,
	XCAFDimTolObjects_DimensionType_Size_ToroidalMajorRadius = 22,
	XCAFDimTolObjects_DimensionType_Size_ToroidalHighMajorDiameter = 23,
	XCAFDimTolObjects_DimensionType_Size_ToroidalLowMajorDiameter = 24,
	XCAFDimTolObjects_DimensionType_Size_ToroidalHighMajorRadius = 25,
	XCAFDimTolObjects_DimensionType_Size_ToroidalLowMajorRadius = 26,
	XCAFDimTolObjects_DimensionType_Size_Thickness = 27,
	XCAFDimTolObjects_DimensionType_Size_Angular = 28,
	XCAFDimTolObjects_DimensionType_Size_WithPath = 29,
	XCAFDimTolObjects_DimensionType_CommonLabel = 30,
	XCAFDimTolObjects_DimensionType_DimensionPresentation = 31,
};

enum XCAFDimTolObjects_GeomToleranceMatReqModif {
	XCAFDimTolObjects_GeomToleranceMatReqModif_None = 0,
	XCAFDimTolObjects_GeomToleranceMatReqModif_M = 1,
	XCAFDimTolObjects_GeomToleranceMatReqModif_L = 2,
};

enum XCAFDimTolObjects_DimensionGrade {
	XCAFDimTolObjects_DimensionGrade_IT01 = 0,
	XCAFDimTolObjects_DimensionGrade_IT0 = 1,
	XCAFDimTolObjects_DimensionGrade_IT1 = 2,
	XCAFDimTolObjects_DimensionGrade_IT2 = 3,
	XCAFDimTolObjects_DimensionGrade_IT3 = 4,
	XCAFDimTolObjects_DimensionGrade_IT4 = 5,
	XCAFDimTolObjects_DimensionGrade_IT5 = 6,
	XCAFDimTolObjects_DimensionGrade_IT6 = 7,
	XCAFDimTolObjects_DimensionGrade_IT7 = 8,
	XCAFDimTolObjects_DimensionGrade_IT8 = 9,
	XCAFDimTolObjects_DimensionGrade_IT9 = 10,
	XCAFDimTolObjects_DimensionGrade_IT10 = 11,
	XCAFDimTolObjects_DimensionGrade_IT11 = 12,
	XCAFDimTolObjects_DimensionGrade_IT12 = 13,
	XCAFDimTolObjects_DimensionGrade_IT13 = 14,
	XCAFDimTolObjects_DimensionGrade_IT14 = 15,
	XCAFDimTolObjects_DimensionGrade_IT15 = 16,
	XCAFDimTolObjects_DimensionGrade_IT16 = 17,
	XCAFDimTolObjects_DimensionGrade_IT17 = 18,
	XCAFDimTolObjects_DimensionGrade_IT18 = 19,
};

/* end public enums declaration */

/* handles */
%wrap_handle(XCAFDimTolObjects_DatumObject)
%wrap_handle(XCAFDimTolObjects_DimensionObject)
%wrap_handle(XCAFDimTolObjects_GeomToleranceObject)
/* end handles declaration */

/* templates */
%template(XCAFDimTolObjects_DimensionObjectSequence) NCollection_Sequence <opencascade::handle <XCAFDimTolObjects_DimensionObject>>;
%template(XCAFDimTolObjects_GeomToleranceModifiersSequence) NCollection_Sequence <XCAFDimTolObjects_GeomToleranceModif>;
%template(XCAFDimTolObjects_DimensionModifiersSequence) NCollection_Sequence <XCAFDimTolObjects_DimensionModif>;
%template(XCAFDimTolObjects_DatumModifiersSequence) NCollection_Sequence <XCAFDimTolObjects_DatumSingleModif>;
%template(XCAFDimTolObjects_DatumObjectSequence) NCollection_Sequence <opencascade::handle <XCAFDimTolObjects_DatumObject>>;
%template(XCAFDimTolObjects_DataMapOfToleranceDatum) NCollection_DataMap <opencascade::handle <XCAFDimTolObjects_GeomToleranceObject>, opencascade::handle <XCAFDimTolObjects_DatumObject>, TColStd_MapTransientHasher>;
%template(XCAFDimTolObjects_GeomToleranceObjectSequence) NCollection_Sequence <opencascade::handle <XCAFDimTolObjects_GeomToleranceObject>>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence <opencascade::handle <XCAFDimTolObjects_DimensionObject>> XCAFDimTolObjects_DimensionObjectSequence;
typedef NCollection_Sequence <XCAFDimTolObjects_GeomToleranceModif> XCAFDimTolObjects_GeomToleranceModifiersSequence;
typedef NCollection_Sequence <XCAFDimTolObjects_DimensionModif> XCAFDimTolObjects_DimensionModifiersSequence;
typedef NCollection_Sequence <XCAFDimTolObjects_DatumSingleModif> XCAFDimTolObjects_DatumModifiersSequence;
typedef NCollection_Sequence <opencascade::handle <XCAFDimTolObjects_DatumObject>> XCAFDimTolObjects_DatumObjectSequence;
typedef NCollection_DataMap <opencascade::handle <XCAFDimTolObjects_GeomToleranceObject>, opencascade::handle <XCAFDimTolObjects_DatumObject>, TColStd_MapTransientHasher> XCAFDimTolObjects_DataMapOfToleranceDatum;
typedef NCollection_Sequence <opencascade::handle <XCAFDimTolObjects_GeomToleranceObject>> XCAFDimTolObjects_GeomToleranceObjectSequence;
/* end typedefs declaration */

/**************************************
* class XCAFDimTolObjects_DatumObject *
**************************************/
class XCAFDimTolObjects_DatumObject : public Standard_Transient {
	public:
		/****************** AddModifier ******************/
		%feature("compactdefaultargs") AddModifier;
		%feature("autodoc", "* Adds a modifier to the datum sequence of modifiers.
	:param theModifier:
	:type theModifier: XCAFDimTolObjects_DatumSingleModif
	:rtype: None") AddModifier;
		void AddModifier (const XCAFDimTolObjects_DatumSingleModif theModifier);

		/****************** GetDatumTarget ******************/
		%feature("compactdefaultargs") GetDatumTarget;
		%feature("autodoc", "* Returns datum target shape.
	:rtype: TopoDS_Shape") GetDatumTarget;
		TopoDS_Shape GetDatumTarget ();

		/****************** GetDatumTargetAxis ******************/
		%feature("compactdefaultargs") GetDatumTargetAxis;
		%feature("autodoc", "* Returns datum target axis. The Z axis of the datum placement denotes the normal of the surface pointing away from the material.
	:rtype: gp_Ax2") GetDatumTargetAxis;
		gp_Ax2 GetDatumTargetAxis ();

		/****************** GetDatumTargetLength ******************/
		%feature("compactdefaultargs") GetDatumTargetLength;
		%feature("autodoc", "* Returns datum target length for line and rectangle types. The length along the X axis of the datum placement.
	:rtype: float") GetDatumTargetLength;
		Standard_Real GetDatumTargetLength ();

		/****************** GetDatumTargetNumber ******************/
		%feature("compactdefaultargs") GetDatumTargetNumber;
		%feature("autodoc", "* Returns datum target number.
	:rtype: int") GetDatumTargetNumber;
		Standard_Integer GetDatumTargetNumber ();

		/****************** GetDatumTargetType ******************/
		%feature("compactdefaultargs") GetDatumTargetType;
		%feature("autodoc", "* Returns datum target type
	:rtype: XCAFDimTolObjects_DatumTargetType") GetDatumTargetType;
		XCAFDimTolObjects_DatumTargetType GetDatumTargetType ();

		/****************** GetDatumTargetWidth ******************/
		%feature("compactdefaultargs") GetDatumTargetWidth;
		%feature("autodoc", "* Returns datum target width for rectangle type. The width along the derived Y axis, with the placement itself positioned at the centre of the rectangle.
	:rtype: float") GetDatumTargetWidth;
		Standard_Real GetDatumTargetWidth ();

		/****************** GetModifierWithValue ******************/
		%feature("compactdefaultargs") GetModifierWithValue;
		%feature("autodoc", "* Retrieves datum modifier with value.
	:param theModifier:
	:type theModifier: XCAFDimTolObjects_DatumModifWithValue
	:param theValue:
	:type theValue: float
	:rtype: None") GetModifierWithValue;
		void GetModifierWithValue (XCAFDimTolObjects_DatumModifWithValue & theModifier,Standard_Real &OutValue);

		/****************** GetModifiers ******************/
		%feature("compactdefaultargs") GetModifiers;
		%feature("autodoc", "* Returns a sequence of modifiers of the datum.
	:rtype: XCAFDimTolObjects_DatumModifiersSequence") GetModifiers;
		XCAFDimTolObjects_DatumModifiersSequence GetModifiers ();

		/****************** GetName ******************/
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "* Returns datum name.
	:rtype: opencascade::handle<TCollection_HAsciiString>") GetName;
		opencascade::handle<TCollection_HAsciiString> GetName ();

		/****************** GetPlane ******************/
		%feature("compactdefaultargs") GetPlane;
		%feature("autodoc", "* Returns annotation plane.
	:rtype: gp_Ax2") GetPlane;
		const gp_Ax2  GetPlane ();

		/****************** GetPoint ******************/
		%feature("compactdefaultargs") GetPoint;
		%feature("autodoc", "* Gets point on the datum shape.
	:rtype: gp_Pnt") GetPoint;
		const gp_Pnt  GetPoint ();

		/****************** GetPointTextAttach ******************/
		%feature("compactdefaultargs") GetPointTextAttach;
		%feature("autodoc", "* Gets datum text position.
	:rtype: gp_Pnt") GetPointTextAttach;
		const gp_Pnt  GetPointTextAttach ();

		/****************** GetPosition ******************/
		%feature("compactdefaultargs") GetPosition;
		%feature("autodoc", "* Returns datum position in the related geometric tolerance object.
	:rtype: int") GetPosition;
		Standard_Integer GetPosition ();

		/****************** GetPresentation ******************/
		%feature("compactdefaultargs") GetPresentation;
		%feature("autodoc", "* Returns graphical presentation of the object.
	:rtype: TopoDS_Shape") GetPresentation;
		TopoDS_Shape GetPresentation ();

		/****************** GetPresentationName ******************/
		%feature("compactdefaultargs") GetPresentationName;
		%feature("autodoc", "* Returns graphical presentation of the object.
	:rtype: opencascade::handle<TCollection_HAsciiString>") GetPresentationName;
		opencascade::handle<TCollection_HAsciiString> GetPresentationName ();

		/****************** GetSemanticName ******************/
		%feature("compactdefaultargs") GetSemanticName;
		%feature("autodoc", "* Returns semantic name
	:rtype: opencascade::handle<TCollection_HAsciiString>") GetSemanticName;
		opencascade::handle<TCollection_HAsciiString> GetSemanticName ();

		/****************** HasDatumTargetParams ******************/
		%feature("compactdefaultargs") HasDatumTargetParams;
		%feature("autodoc", "* Returns True if the datum has valid parameters for datum target (width, length, circle radius etc)
	:rtype: bool") HasDatumTargetParams;
		Standard_Boolean HasDatumTargetParams ();

		/****************** HasPlane ******************/
		%feature("compactdefaultargs") HasPlane;
		%feature("autodoc", "* Returns True if the datum has annotation plane.
	:rtype: bool") HasPlane;
		Standard_Boolean HasPlane ();

		/****************** HasPoint ******************/
		%feature("compactdefaultargs") HasPoint;
		%feature("autodoc", "* Returns True if point on the datum target is specified.
	:rtype: bool") HasPoint;
		Standard_Boolean HasPoint ();

		/****************** HasPointText ******************/
		%feature("compactdefaultargs") HasPointText;
		%feature("autodoc", "* Returns True if the datum text position is specified.
	:rtype: bool") HasPointText;
		Standard_Boolean HasPointText ();

		/****************** IsDatumTarget ******************/
		%feature("compactdefaultargs") IsDatumTarget;
		%feature("autodoc", "* Returns True if the datum target is specified.
	:rtype: bool") IsDatumTarget;
		Standard_Boolean IsDatumTarget ();

		/****************** IsDatumTarget ******************/
		%feature("compactdefaultargs") IsDatumTarget;
		%feature("autodoc", "* Sets or drops the datum target indicator.
	:param theIsDT:
	:type theIsDT: bool
	:rtype: None") IsDatumTarget;
		void IsDatumTarget (const Standard_Boolean theIsDT);

		/****************** SetDatumTarget ******************/
		%feature("compactdefaultargs") SetDatumTarget;
		%feature("autodoc", "* Sets datum target shape.
	:param theShape:
	:type theShape: TopoDS_Shape
	:rtype: None") SetDatumTarget;
		void SetDatumTarget (const TopoDS_Shape & theShape);

		/****************** SetDatumTargetAxis ******************/
		%feature("compactdefaultargs") SetDatumTargetAxis;
		%feature("autodoc", "* Sets datum target axis.
	:param theAxis:
	:type theAxis: gp_Ax2
	:rtype: None") SetDatumTargetAxis;
		void SetDatumTargetAxis (const gp_Ax2 & theAxis);

		/****************** SetDatumTargetLength ******************/
		%feature("compactdefaultargs") SetDatumTargetLength;
		%feature("autodoc", "* Sets datum target length.
	:param theLength:
	:type theLength: float
	:rtype: None") SetDatumTargetLength;
		void SetDatumTargetLength (const Standard_Real theLength);

		/****************** SetDatumTargetNumber ******************/
		%feature("compactdefaultargs") SetDatumTargetNumber;
		%feature("autodoc", "* Sets datum target number.
	:param theNumber:
	:type theNumber: int
	:rtype: None") SetDatumTargetNumber;
		void SetDatumTargetNumber (const Standard_Integer theNumber);

		/****************** SetDatumTargetType ******************/
		%feature("compactdefaultargs") SetDatumTargetType;
		%feature("autodoc", "* Sets datum target to point, line, rectangle, circle or area type.
	:param theType:
	:type theType: XCAFDimTolObjects_DatumTargetType
	:rtype: None") SetDatumTargetType;
		void SetDatumTargetType (const XCAFDimTolObjects_DatumTargetType theType);

		/****************** SetDatumTargetWidth ******************/
		%feature("compactdefaultargs") SetDatumTargetWidth;
		%feature("autodoc", "* Sets datum target width.
	:param theWidth:
	:type theWidth: float
	:rtype: None") SetDatumTargetWidth;
		void SetDatumTargetWidth (const Standard_Real theWidth);

		/****************** SetModifierWithValue ******************/
		%feature("compactdefaultargs") SetModifierWithValue;
		%feature("autodoc", "* Sets datum modifier with value.
	:param theModifier:
	:type theModifier: XCAFDimTolObjects_DatumModifWithValue
	:param theValue:
	:type theValue: float
	:rtype: None") SetModifierWithValue;
		void SetModifierWithValue (const XCAFDimTolObjects_DatumModifWithValue theModifier,const Standard_Real theValue);

		/****************** SetModifiers ******************/
		%feature("compactdefaultargs") SetModifiers;
		%feature("autodoc", "* Sets new sequence of datum modifiers.
	:param theModifiers:
	:type theModifiers: XCAFDimTolObjects_DatumModifiersSequence
	:rtype: None") SetModifiers;
		void SetModifiers (const XCAFDimTolObjects_DatumModifiersSequence & theModifiers);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "* Sets datum name.
	:param theTag:
	:type theTag: TCollection_HAsciiString
	:rtype: None") SetName;
		void SetName (const opencascade::handle<TCollection_HAsciiString> & theTag);

		/****************** SetPlane ******************/
		%feature("compactdefaultargs") SetPlane;
		%feature("autodoc", "* Sets annotation plane.
	:param thePlane:
	:type thePlane: gp_Ax2
	:rtype: None") SetPlane;
		void SetPlane (const gp_Ax2 & thePlane);

		/****************** SetPoint ******************/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "* Sets a point on the datum target shape.
	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: None") SetPoint;
		void SetPoint (const gp_Pnt & thePnt);

		/****************** SetPointTextAttach ******************/
		%feature("compactdefaultargs") SetPointTextAttach;
		%feature("autodoc", "* Sets a position of the datum text.
	:param thePntText:
	:type thePntText: gp_Pnt
	:rtype: None") SetPointTextAttach;
		void SetPointTextAttach (const gp_Pnt & thePntText);

		/****************** SetPosition ******************/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "* Sets datum position in the related geometric tolerance object.
	:param thePosition:
	:type thePosition: int
	:rtype: None") SetPosition;
		void SetPosition (const Standard_Integer thePosition);

		/****************** SetPresentation ******************/
		%feature("compactdefaultargs") SetPresentation;
		%feature("autodoc", "* Set graphical presentation for object.
	:param thePresentation:
	:type thePresentation: TopoDS_Shape
	:param thePresentationName:
	:type thePresentationName: TCollection_HAsciiString
	:rtype: None") SetPresentation;
		void SetPresentation (const TopoDS_Shape & thePresentation,const opencascade::handle<TCollection_HAsciiString> & thePresentationName);

		/****************** SetSemanticName ******************/
		%feature("compactdefaultargs") SetSemanticName;
		%feature("autodoc", "* Sets semantic name
	:param theName:
	:type theName: TCollection_HAsciiString
	:rtype: None") SetSemanticName;
		void SetSemanticName (const opencascade::handle<TCollection_HAsciiString> & theName);

		/****************** XCAFDimTolObjects_DatumObject ******************/
		%feature("compactdefaultargs") XCAFDimTolObjects_DatumObject;
		%feature("autodoc", ":rtype: None") XCAFDimTolObjects_DatumObject;
		 XCAFDimTolObjects_DatumObject ();

		/****************** XCAFDimTolObjects_DatumObject ******************/
		%feature("compactdefaultargs") XCAFDimTolObjects_DatumObject;
		%feature("autodoc", ":param theObj:
	:type theObj: XCAFDimTolObjects_DatumObject
	:rtype: None") XCAFDimTolObjects_DatumObject;
		 XCAFDimTolObjects_DatumObject (const opencascade::handle<XCAFDimTolObjects_DatumObject> & theObj);

};


%make_alias(XCAFDimTolObjects_DatumObject)

%extend XCAFDimTolObjects_DatumObject {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class XCAFDimTolObjects_DimensionObject *
******************************************/
class XCAFDimTolObjects_DimensionObject : public Standard_Transient {
	public:
		/****************** AddDescription ******************/
		%feature("compactdefaultargs") AddDescription;
		%feature("autodoc", "* Add new description.
	:param theDescription:
	:type theDescription: TCollection_HAsciiString
	:param theName:
	:type theName: TCollection_HAsciiString
	:rtype: None") AddDescription;
		void AddDescription (const opencascade::handle<TCollection_HAsciiString> theDescription,const opencascade::handle<TCollection_HAsciiString> theName);

		/****************** AddModifier ******************/
		%feature("compactdefaultargs") AddModifier;
		%feature("autodoc", "* Adds a modifier to the dimension sequence of modifiers.
	:param theModifier:
	:type theModifier: XCAFDimTolObjects_DimensionModif
	:rtype: None") AddModifier;
		void AddModifier (const XCAFDimTolObjects_DimensionModif theModifier);

		/****************** GetClassOfTolerance ******************/
		%feature("compactdefaultargs") GetClassOfTolerance;
		%feature("autodoc", "* Retrieves tolerance class parameters of the dimension. Returns True if the dimension is toleranced.
	:param theHole:
	:type theHole: bool
	:param theFormVariance:
	:type theFormVariance: XCAFDimTolObjects_DimensionFormVariance
	:param theGrade:
	:type theGrade: XCAFDimTolObjects_DimensionGrade
	:rtype: bool") GetClassOfTolerance;
		Standard_Boolean GetClassOfTolerance (Standard_Boolean &OutValue,XCAFDimTolObjects_DimensionFormVariance & theFormVariance,XCAFDimTolObjects_DimensionGrade & theGrade);

		/****************** GetDescription ******************/
		%feature("compactdefaultargs") GetDescription;
		%feature("autodoc", "* Returns description with the given number.
	:param theNumber:
	:type theNumber: int
	:rtype: opencascade::handle<TCollection_HAsciiString>") GetDescription;
		opencascade::handle<TCollection_HAsciiString> GetDescription (const Standard_Integer theNumber);

		/****************** GetDescriptionName ******************/
		%feature("compactdefaultargs") GetDescriptionName;
		%feature("autodoc", "* Returns name of description with the given number.
	:param theNumber:
	:type theNumber: int
	:rtype: opencascade::handle<TCollection_HAsciiString>") GetDescriptionName;
		opencascade::handle<TCollection_HAsciiString> GetDescriptionName (const Standard_Integer theNumber);

		/****************** GetDirection ******************/
		%feature("compactdefaultargs") GetDirection;
		%feature("autodoc", "* Returns the orientation of the dimension in annotation plane.
	:param theDir:
	:type theDir: gp_Dir
	:rtype: bool") GetDirection;
		Standard_Boolean GetDirection (gp_Dir & theDir);

		/****************** GetLowerBound ******************/
		%feature("compactdefaultargs") GetLowerBound;
		%feature("autodoc", "* Returns the lower bound of the range dimension, otherwise - zero.
	:rtype: float") GetLowerBound;
		Standard_Real GetLowerBound ();

		/****************** GetLowerTolValue ******************/
		%feature("compactdefaultargs") GetLowerTolValue;
		%feature("autodoc", "* Returns the upper value of the toleranced dimension, otherwise - zero.
	:rtype: float") GetLowerTolValue;
		Standard_Real GetLowerTolValue ();

		/****************** GetModifiers ******************/
		%feature("compactdefaultargs") GetModifiers;
		%feature("autodoc", "* Returns a sequence of modifiers of the dimension.
	:rtype: XCAFDimTolObjects_DimensionModifiersSequence") GetModifiers;
		XCAFDimTolObjects_DimensionModifiersSequence GetModifiers ();

		/****************** GetNbOfDecimalPlaces ******************/
		%feature("compactdefaultargs") GetNbOfDecimalPlaces;
		%feature("autodoc", "* Returns the number of places to the left and right of the decimal point respectively.
	:param theL:
	:type theL: int
	:param theR:
	:type theR: int
	:rtype: None") GetNbOfDecimalPlaces;
		void GetNbOfDecimalPlaces (Standard_Integer &OutValue,Standard_Integer &OutValue);

		/****************** GetPath ******************/
		%feature("compactdefaultargs") GetPath;
		%feature("autodoc", "* Returns a 'curve' along which the dimension is measured.
	:rtype: TopoDS_Edge") GetPath;
		TopoDS_Edge GetPath ();

		/****************** GetPlane ******************/
		%feature("compactdefaultargs") GetPlane;
		%feature("autodoc", "* Returns annotation plane.
	:rtype: gp_Ax2") GetPlane;
		const gp_Ax2  GetPlane ();

		/****************** GetPoint ******************/
		%feature("compactdefaultargs") GetPoint;
		%feature("autodoc", "* Get connection point (for dimesional_size), Get connection point for the first shape (for dimensional_location).
	:rtype: gp_Pnt") GetPoint;
		gp_Pnt GetPoint ();

		/****************** GetPoint2 ******************/
		%feature("compactdefaultargs") GetPoint2;
		%feature("autodoc", ":rtype: gp_Pnt") GetPoint2;
		gp_Pnt GetPoint2 ();

		/****************** GetPointTextAttach ******************/
		%feature("compactdefaultargs") GetPointTextAttach;
		%feature("autodoc", "* Returns position of the dimension text.
	:rtype: gp_Pnt") GetPointTextAttach;
		const gp_Pnt  GetPointTextAttach ();

		/****************** GetPresentation ******************/
		%feature("compactdefaultargs") GetPresentation;
		%feature("autodoc", "* Returns graphical presentation of the object.
	:rtype: TopoDS_Shape") GetPresentation;
		TopoDS_Shape GetPresentation ();

		/****************** GetPresentationName ******************/
		%feature("compactdefaultargs") GetPresentationName;
		%feature("autodoc", "* Returns graphical presentation of the object
	:rtype: opencascade::handle<TCollection_HAsciiString>") GetPresentationName;
		opencascade::handle<TCollection_HAsciiString> GetPresentationName ();

		/****************** GetQualifier ******************/
		%feature("compactdefaultargs") GetQualifier;
		%feature("autodoc", "* Returns dimension qualifier.
	:rtype: XCAFDimTolObjects_DimensionQualifier") GetQualifier;
		XCAFDimTolObjects_DimensionQualifier GetQualifier ();

		/****************** GetSemanticName ******************/
		%feature("compactdefaultargs") GetSemanticName;
		%feature("autodoc", "* Returns semantic name
	:rtype: opencascade::handle<TCollection_HAsciiString>") GetSemanticName;
		opencascade::handle<TCollection_HAsciiString> GetSemanticName ();

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "* Returns dimension type.
	:rtype: XCAFDimTolObjects_DimensionType") GetType;
		XCAFDimTolObjects_DimensionType GetType ();

		/****************** GetUpperBound ******************/
		%feature("compactdefaultargs") GetUpperBound;
		%feature("autodoc", "* Returns the upper bound of the range dimension, otherwise - zero.
	:rtype: float") GetUpperBound;
		Standard_Real GetUpperBound ();

		/****************** GetUpperTolValue ******************/
		%feature("compactdefaultargs") GetUpperTolValue;
		%feature("autodoc", "* Returns the lower value of the toleranced dimension, otherwise - zero.
	:rtype: float") GetUpperTolValue;
		Standard_Real GetUpperTolValue ();

		/****************** GetValue ******************/
		%feature("compactdefaultargs") GetValue;
		%feature("autodoc", "* Returns the main dimension value. It will be the middle value in case of range dimension.
	:rtype: float") GetValue;
		Standard_Real GetValue ();

		/****************** GetValues ******************/
		%feature("compactdefaultargs") GetValues;
		%feature("autodoc", "* Returns raw array of dimension values
	:rtype: opencascade::handle<TColStd_HArray1OfReal>") GetValues;
		opencascade::handle<TColStd_HArray1OfReal> GetValues ();

		/****************** HasDescriptions ******************/
		%feature("compactdefaultargs") HasDescriptions;
		%feature("autodoc", "* Returns true, if the object has descriptions.
	:rtype: bool") HasDescriptions;
		Standard_Boolean HasDescriptions ();

		/****************** HasPlane ******************/
		%feature("compactdefaultargs") HasPlane;
		%feature("autodoc", "* Returns True if the object has annotation plane.
	:rtype: bool") HasPlane;
		Standard_Boolean HasPlane ();

		/****************** HasPoint ******************/
		%feature("compactdefaultargs") HasPoint;
		%feature("autodoc", "* Returns true, if connection point exists (for dimesional_size), if connection point for the first shape exists (for dimensional_location).
	:rtype: bool") HasPoint;
		Standard_Boolean HasPoint ();

		/****************** HasPoint2 ******************/
		%feature("compactdefaultargs") HasPoint2;
		%feature("autodoc", ":rtype: bool") HasPoint2;
		Standard_Boolean HasPoint2 ();

		/****************** HasQualifier ******************/
		%feature("compactdefaultargs") HasQualifier;
		%feature("autodoc", "* Returns True if the object has dimension qualifier.
	:rtype: bool") HasQualifier;
		Standard_Boolean HasQualifier ();

		/****************** HasTextPoint ******************/
		%feature("compactdefaultargs") HasTextPoint;
		%feature("autodoc", "* Returns True if the position of dimension text is specified.
	:rtype: bool") HasTextPoint;
		Standard_Boolean HasTextPoint ();

		/****************** IsDimWithClassOfTolerance ******************/
		%feature("compactdefaultargs") IsDimWithClassOfTolerance;
		%feature("autodoc", "* Returns True if the form variance was set to not XCAFDimTolObjects_DimensionFormVariance_None value.
	:rtype: bool") IsDimWithClassOfTolerance;
		Standard_Boolean IsDimWithClassOfTolerance ();

		/****************** IsDimWithPlusMinusTolerance ******************/
		%feature("compactdefaultargs") IsDimWithPlusMinusTolerance;
		%feature("autodoc", "* Returns True if the dimension is of +/- tolerance kind. Dimension is of +/- tolerance kind if its values array contains three elements defining the main value and the lower/upper tolerances.
	:rtype: bool") IsDimWithPlusMinusTolerance;
		Standard_Boolean IsDimWithPlusMinusTolerance ();

		/****************** IsDimWithRange ******************/
		%feature("compactdefaultargs") IsDimWithRange;
		%feature("autodoc", "* Returns True if the dimension is of range kind. Dimension is of range kind if its values array contains two elements defining lower and upper bounds.
	:rtype: bool") IsDimWithRange;
		Standard_Boolean IsDimWithRange ();

		/****************** NbDescriptions ******************/
		%feature("compactdefaultargs") NbDescriptions;
		%feature("autodoc", "* Returns number of descriptions.
	:rtype: int") NbDescriptions;
		Standard_Integer NbDescriptions ();

		/****************** RemoveDescription ******************/
		%feature("compactdefaultargs") RemoveDescription;
		%feature("autodoc", "* Remove description with the given number.
	:param theNumber:
	:type theNumber: int
	:rtype: None") RemoveDescription;
		void RemoveDescription (const Standard_Integer theNumber);

		/****************** SetClassOfTolerance ******************/
		%feature("compactdefaultargs") SetClassOfTolerance;
		%feature("autodoc", "* Sets tolerance class of the dimension. \param theHole - True if the tolerance applies to an internal feature \param theFormVariance - represents the fundamental deviation or 'position letter'  of the ISO 286 limits-and-fits tolerance classification. \param theGrade - represents the quality or the accuracy grade of a tolerance.
	:param theHole:
	:type theHole: bool
	:param theFormVariance:
	:type theFormVariance: XCAFDimTolObjects_DimensionFormVariance
	:param theGrade:
	:type theGrade: XCAFDimTolObjects_DimensionGrade
	:rtype: None") SetClassOfTolerance;
		void SetClassOfTolerance (const Standard_Boolean theHole,const XCAFDimTolObjects_DimensionFormVariance theFormVariance,const XCAFDimTolObjects_DimensionGrade theGrade);

		/****************** SetDirection ******************/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "* Sets an orientation of the dimension in annotation plane.
	:param theDir:
	:type theDir: gp_Dir
	:rtype: bool") SetDirection;
		Standard_Boolean SetDirection (const gp_Dir & theDir);

		/****************** SetLowerBound ******************/
		%feature("compactdefaultargs") SetLowerBound;
		%feature("autodoc", "* Sets the lower bound of the range dimension, otherwise resets it to an empty range with the specified lower bound.
	:param theLowerBound:
	:type theLowerBound: float
	:rtype: None") SetLowerBound;
		void SetLowerBound (const Standard_Real theLowerBound);

		/****************** SetLowerTolValue ******************/
		%feature("compactdefaultargs") SetLowerTolValue;
		%feature("autodoc", "* Sets the lower value of the toleranced dimension, otherwise resets a simple dimension to toleranced one with the specified lower/upper tolerances. Returns False in case of range dimension.
	:param theLowerTolValue:
	:type theLowerTolValue: float
	:rtype: bool") SetLowerTolValue;
		Standard_Boolean SetLowerTolValue (const Standard_Real theLowerTolValue);

		/****************** SetModifiers ******************/
		%feature("compactdefaultargs") SetModifiers;
		%feature("autodoc", "* Sets new sequence of dimension modifiers.
	:param theModifiers:
	:type theModifiers: XCAFDimTolObjects_DimensionModifiersSequence
	:rtype: None") SetModifiers;
		void SetModifiers (const XCAFDimTolObjects_DimensionModifiersSequence & theModifiers);

		/****************** SetNbOfDecimalPlaces ******************/
		%feature("compactdefaultargs") SetNbOfDecimalPlaces;
		%feature("autodoc", "* Sets the number of places to the left and right of the decimal point respectively.
	:param theL:
	:type theL: int
	:param theR:
	:type theR: int
	:rtype: None") SetNbOfDecimalPlaces;
		void SetNbOfDecimalPlaces (const Standard_Integer theL,const Standard_Integer theR);

		/****************** SetPath ******************/
		%feature("compactdefaultargs") SetPath;
		%feature("autodoc", "* Sets a 'curve' along which the dimension is measured.
	:param thePath:
	:type thePath: TopoDS_Edge
	:rtype: None") SetPath;
		void SetPath (const TopoDS_Edge & thePath);

		/****************** SetPlane ******************/
		%feature("compactdefaultargs") SetPlane;
		%feature("autodoc", "* Sets annotation plane.
	:param thePlane:
	:type thePlane: gp_Ax2
	:rtype: None") SetPlane;
		void SetPlane (const gp_Ax2 & thePlane);

		/****************** SetPoint ******************/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "* Set connection point (for dimesional_size), Set connection point for the first shape (for dimensional_location).
	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: None") SetPoint;
		void SetPoint (const gp_Pnt thePnt);

		/****************** SetPoint2 ******************/
		%feature("compactdefaultargs") SetPoint2;
		%feature("autodoc", ":param thePnt:
	:type thePnt: gp_Pnt
	:rtype: None") SetPoint2;
		void SetPoint2 (const gp_Pnt thePnt);

		/****************** SetPointTextAttach ******************/
		%feature("compactdefaultargs") SetPointTextAttach;
		%feature("autodoc", "* Sets position of the dimension text.
	:param thePntText:
	:type thePntText: gp_Pnt
	:rtype: None") SetPointTextAttach;
		void SetPointTextAttach (const gp_Pnt & thePntText);

		/****************** SetPresentation ******************/
		%feature("compactdefaultargs") SetPresentation;
		%feature("autodoc", "* Set graphical presentation for the object.
	:param thePresentation:
	:type thePresentation: TopoDS_Shape
	:param thePresentationName:
	:type thePresentationName: TCollection_HAsciiString
	:rtype: None") SetPresentation;
		void SetPresentation (const TopoDS_Shape & thePresentation,const opencascade::handle<TCollection_HAsciiString> & thePresentationName);

		/****************** SetQualifier ******************/
		%feature("compactdefaultargs") SetQualifier;
		%feature("autodoc", "* Sets dimension qualifier as min., max. or average.
	:param theQualifier:
	:type theQualifier: XCAFDimTolObjects_DimensionQualifier
	:rtype: None") SetQualifier;
		void SetQualifier (const XCAFDimTolObjects_DimensionQualifier theQualifier);

		/****************** SetSemanticName ******************/
		%feature("compactdefaultargs") SetSemanticName;
		%feature("autodoc", "* Sets semantic name
	:param theName:
	:type theName: TCollection_HAsciiString
	:rtype: None") SetSemanticName;
		void SetSemanticName (const opencascade::handle<TCollection_HAsciiString> & theName);

		/****************** SetType ******************/
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "* Sets a specific type of dimension.
	:param theTyupe:
	:type theTyupe: XCAFDimTolObjects_DimensionType
	:rtype: None") SetType;
		void SetType (const XCAFDimTolObjects_DimensionType theTyupe);

		/****************** SetUpperBound ******************/
		%feature("compactdefaultargs") SetUpperBound;
		%feature("autodoc", "* Sets the upper bound of the range dimension, otherwise resets it to an empty range with the specified upper bound.
	:param theUpperBound:
	:type theUpperBound: float
	:rtype: None") SetUpperBound;
		void SetUpperBound (const Standard_Real theUpperBound);

		/****************** SetUpperTolValue ******************/
		%feature("compactdefaultargs") SetUpperTolValue;
		%feature("autodoc", "* Sets the upper value of the toleranced dimension, otherwise resets a simple dimension to toleranced one with the specified lower/upper tolerances. Returns False in case of range dimension.
	:param theUperTolValue:
	:type theUperTolValue: float
	:rtype: bool") SetUpperTolValue;
		Standard_Boolean SetUpperTolValue (const Standard_Real theUperTolValue);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "* Sets the main dimension value. Overwrites previous values.
	:param theValue:
	:type theValue: float
	:rtype: None") SetValue;
		void SetValue (const Standard_Real theValue);

		/****************** SetValues ******************/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "* Replaces current raw array of dimension values with theValues array.
	:param theValue:
	:type theValue: TColStd_HArray1OfReal
	:rtype: None") SetValues;
		void SetValues (const opencascade::handle<TColStd_HArray1OfReal> & theValue);

		/****************** XCAFDimTolObjects_DimensionObject ******************/
		%feature("compactdefaultargs") XCAFDimTolObjects_DimensionObject;
		%feature("autodoc", ":rtype: None") XCAFDimTolObjects_DimensionObject;
		 XCAFDimTolObjects_DimensionObject ();

		/****************** XCAFDimTolObjects_DimensionObject ******************/
		%feature("compactdefaultargs") XCAFDimTolObjects_DimensionObject;
		%feature("autodoc", ":param theObj:
	:type theObj: XCAFDimTolObjects_DimensionObject
	:rtype: None") XCAFDimTolObjects_DimensionObject;
		 XCAFDimTolObjects_DimensionObject (const opencascade::handle<XCAFDimTolObjects_DimensionObject> & theObj);

};


%make_alias(XCAFDimTolObjects_DimensionObject)

%extend XCAFDimTolObjects_DimensionObject {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class XCAFDimTolObjects_GeomToleranceObject *
**********************************************/
class XCAFDimTolObjects_GeomToleranceObject : public Standard_Transient {
	public:
		/****************** AddModifier ******************/
		%feature("compactdefaultargs") AddModifier;
		%feature("autodoc", "* Adds a tolerance modifier to the sequence of modifiers.
	:param theModifier:
	:type theModifier: XCAFDimTolObjects_GeomToleranceModif
	:rtype: None") AddModifier;
		void AddModifier (const XCAFDimTolObjects_GeomToleranceModif theModifier);

		/****************** GetAffectedPlane ******************/
		%feature("compactdefaultargs") GetAffectedPlane;
		%feature("autodoc", "* Returns affected plane.
	:rtype: gp_Pln") GetAffectedPlane;
		const gp_Pln  GetAffectedPlane ();

		/****************** GetAffectedPlaneType ******************/
		%feature("compactdefaultargs") GetAffectedPlaneType;
		%feature("autodoc", ":rtype: XCAFDimTolObjects_ToleranceZoneAffectedPlane") GetAffectedPlaneType;
		XCAFDimTolObjects_ToleranceZoneAffectedPlane GetAffectedPlaneType ();

		/****************** GetAxis ******************/
		%feature("compactdefaultargs") GetAxis;
		%feature("autodoc", ":rtype: gp_Ax2") GetAxis;
		gp_Ax2 GetAxis ();

		/****************** GetMaterialRequirementModifier ******************/
		%feature("compactdefaultargs") GetMaterialRequirementModifier;
		%feature("autodoc", "* Returns material requirement of the tolerance.
	:rtype: XCAFDimTolObjects_GeomToleranceMatReqModif") GetMaterialRequirementModifier;
		XCAFDimTolObjects_GeomToleranceMatReqModif GetMaterialRequirementModifier ();

		/****************** GetMaxValueModifier ******************/
		%feature("compactdefaultargs") GetMaxValueModifier;
		%feature("autodoc", "* Returns the maximal upper tolerance.
	:rtype: float") GetMaxValueModifier;
		Standard_Real GetMaxValueModifier ();

		/****************** GetModifiers ******************/
		%feature("compactdefaultargs") GetModifiers;
		%feature("autodoc", "* Returns a sequence of modifiers of the tolerance.
	:rtype: XCAFDimTolObjects_GeomToleranceModifiersSequence") GetModifiers;
		XCAFDimTolObjects_GeomToleranceModifiersSequence GetModifiers ();

		/****************** GetPlane ******************/
		%feature("compactdefaultargs") GetPlane;
		%feature("autodoc", "* Returns annotation plane.
	:rtype: gp_Ax2") GetPlane;
		const gp_Ax2  GetPlane ();

		/****************** GetPoint ******************/
		%feature("compactdefaultargs") GetPoint;
		%feature("autodoc", "* Returns reference point.
	:rtype: gp_Pnt") GetPoint;
		const gp_Pnt  GetPoint ();

		/****************** GetPointTextAttach ******************/
		%feature("compactdefaultargs") GetPointTextAttach;
		%feature("autodoc", "* Returns the text position.
	:rtype: gp_Pnt") GetPointTextAttach;
		const gp_Pnt  GetPointTextAttach ();

		/****************** GetPresentation ******************/
		%feature("compactdefaultargs") GetPresentation;
		%feature("autodoc", "* Returns graphical presentation of the object.
	:rtype: TopoDS_Shape") GetPresentation;
		TopoDS_Shape GetPresentation ();

		/****************** GetPresentationName ******************/
		%feature("compactdefaultargs") GetPresentationName;
		%feature("autodoc", "* Returns graphical presentation of the object.
	:rtype: opencascade::handle<TCollection_HAsciiString>") GetPresentationName;
		opencascade::handle<TCollection_HAsciiString> GetPresentationName ();

		/****************** GetSemanticName ******************/
		%feature("compactdefaultargs") GetSemanticName;
		%feature("autodoc", "* Returns semantic name
	:rtype: opencascade::handle<TCollection_HAsciiString>") GetSemanticName;
		opencascade::handle<TCollection_HAsciiString> GetSemanticName ();

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "* Returns type of the object.
	:rtype: XCAFDimTolObjects_GeomToleranceType") GetType;
		XCAFDimTolObjects_GeomToleranceType GetType ();

		/****************** GetTypeOfValue ******************/
		%feature("compactdefaultargs") GetTypeOfValue;
		%feature("autodoc", "* Returns type of tolerance value.
	:rtype: XCAFDimTolObjects_GeomToleranceTypeValue") GetTypeOfValue;
		XCAFDimTolObjects_GeomToleranceTypeValue GetTypeOfValue ();

		/****************** GetValue ******************/
		%feature("compactdefaultargs") GetValue;
		%feature("autodoc", "* Returns tolerance value.
	:rtype: float") GetValue;
		Standard_Real GetValue ();

		/****************** GetValueOfZoneModifier ******************/
		%feature("compactdefaultargs") GetValueOfZoneModifier;
		%feature("autodoc", "* Returns value associated with tolerance zone.
	:rtype: float") GetValueOfZoneModifier;
		Standard_Real GetValueOfZoneModifier ();

		/****************** GetZoneModifier ******************/
		%feature("compactdefaultargs") GetZoneModifier;
		%feature("autodoc", "* Returns tolerance zone.
	:rtype: XCAFDimTolObjects_GeomToleranceZoneModif") GetZoneModifier;
		XCAFDimTolObjects_GeomToleranceZoneModif GetZoneModifier ();

		/****************** HasAffectedPlane ******************/
		%feature("compactdefaultargs") HasAffectedPlane;
		%feature("autodoc", ":rtype: bool") HasAffectedPlane;
		bool HasAffectedPlane ();

		/****************** HasAxis ******************/
		%feature("compactdefaultargs") HasAxis;
		%feature("autodoc", ":rtype: bool") HasAxis;
		Standard_Boolean HasAxis ();

		/****************** HasPlane ******************/
		%feature("compactdefaultargs") HasPlane;
		%feature("autodoc", "* Returns True if the object has annotation plane.
	:rtype: bool") HasPlane;
		Standard_Boolean HasPlane ();

		/****************** HasPoint ******************/
		%feature("compactdefaultargs") HasPoint;
		%feature("autodoc", "* Returns True if reference point is specified.
	:rtype: bool") HasPoint;
		Standard_Boolean HasPoint ();

		/****************** HasPointText ******************/
		%feature("compactdefaultargs") HasPointText;
		%feature("autodoc", "* Returns True if text position is specified.
	:rtype: bool") HasPointText;
		Standard_Boolean HasPointText ();

		/****************** SetAffectedPlane ******************/
		%feature("compactdefaultargs") SetAffectedPlane;
		%feature("autodoc", "* Sets affected plane.
	:param thePlane:
	:type thePlane: gp_Pln
	:rtype: None") SetAffectedPlane;
		void SetAffectedPlane (const gp_Pln & thePlane);

		/****************** SetAffectedPlane ******************/
		%feature("compactdefaultargs") SetAffectedPlane;
		%feature("autodoc", "* Sets affected plane.
	:param thePlane:
	:type thePlane: gp_Pln
	:param theType:
	:type theType: XCAFDimTolObjects_ToleranceZoneAffectedPlane
	:rtype: None") SetAffectedPlane;
		void SetAffectedPlane (const gp_Pln & thePlane,const XCAFDimTolObjects_ToleranceZoneAffectedPlane theType);

		/****************** SetAffectedPlaneType ******************/
		%feature("compactdefaultargs") SetAffectedPlaneType;
		%feature("autodoc", ":param theType:
	:type theType: XCAFDimTolObjects_ToleranceZoneAffectedPlane
	:rtype: None") SetAffectedPlaneType;
		void SetAffectedPlaneType (const XCAFDimTolObjects_ToleranceZoneAffectedPlane theType);

		/****************** SetAxis ******************/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", ":param theAxis:
	:type theAxis: gp_Ax2
	:rtype: None") SetAxis;
		void SetAxis (const gp_Ax2 theAxis);

		/****************** SetMaterialRequirementModifier ******************/
		%feature("compactdefaultargs") SetMaterialRequirementModifier;
		%feature("autodoc", "* Sets material requirement of the tolerance.
	:param theMatReqModif:
	:type theMatReqModif: XCAFDimTolObjects_GeomToleranceMatReqModif
	:rtype: None") SetMaterialRequirementModifier;
		void SetMaterialRequirementModifier (const XCAFDimTolObjects_GeomToleranceMatReqModif theMatReqModif);

		/****************** SetMaxValueModifier ******************/
		%feature("compactdefaultargs") SetMaxValueModifier;
		%feature("autodoc", "* Sets the maximal upper tolerance value for tolerance with modifiers.
	:param theModifier:
	:type theModifier: float
	:rtype: None") SetMaxValueModifier;
		void SetMaxValueModifier (const Standard_Real theModifier);

		/****************** SetModifiers ******************/
		%feature("compactdefaultargs") SetModifiers;
		%feature("autodoc", "* Sets new sequence of tolerance modifiers.
	:param theModifiers:
	:type theModifiers: XCAFDimTolObjects_GeomToleranceModifiersSequence
	:rtype: None") SetModifiers;
		void SetModifiers (const XCAFDimTolObjects_GeomToleranceModifiersSequence & theModifiers);

		/****************** SetPlane ******************/
		%feature("compactdefaultargs") SetPlane;
		%feature("autodoc", "* Sets annotation plane.
	:param thePlane:
	:type thePlane: gp_Ax2
	:rtype: None") SetPlane;
		void SetPlane (const gp_Ax2 & thePlane);

		/****************** SetPoint ******************/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "* Sets reference point.
	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: None") SetPoint;
		void SetPoint (const gp_Pnt & thePnt);

		/****************** SetPointTextAttach ******************/
		%feature("compactdefaultargs") SetPointTextAttach;
		%feature("autodoc", "* Sets text position.
	:param thePntText:
	:type thePntText: gp_Pnt
	:rtype: None") SetPointTextAttach;
		void SetPointTextAttach (const gp_Pnt & thePntText);

		/****************** SetPresentation ******************/
		%feature("compactdefaultargs") SetPresentation;
		%feature("autodoc", "* Set graphical presentation for object.
	:param thePresentation:
	:type thePresentation: TopoDS_Shape
	:param thePresentationName:
	:type thePresentationName: TCollection_HAsciiString
	:rtype: None") SetPresentation;
		void SetPresentation (const TopoDS_Shape & thePresentation,const opencascade::handle<TCollection_HAsciiString> & thePresentationName);

		/****************** SetSemanticName ******************/
		%feature("compactdefaultargs") SetSemanticName;
		%feature("autodoc", "* Sets semantic name
	:param theName:
	:type theName: TCollection_HAsciiString
	:rtype: None") SetSemanticName;
		void SetSemanticName (const opencascade::handle<TCollection_HAsciiString> & theName);

		/****************** SetType ******************/
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "* Sets type of the object.
	:param theType:
	:type theType: XCAFDimTolObjects_GeomToleranceType
	:rtype: None") SetType;
		void SetType (const XCAFDimTolObjects_GeomToleranceType theType);

		/****************** SetTypeOfValue ******************/
		%feature("compactdefaultargs") SetTypeOfValue;
		%feature("autodoc", "* Sets type of tolerance value.
	:param theTypeOfValue:
	:type theTypeOfValue: XCAFDimTolObjects_GeomToleranceTypeValue
	:rtype: None") SetTypeOfValue;
		void SetTypeOfValue (const XCAFDimTolObjects_GeomToleranceTypeValue theTypeOfValue);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "* Sets tolerance value.
	:param theValue:
	:type theValue: float
	:rtype: None") SetValue;
		void SetValue (const Standard_Real theValue);

		/****************** SetValueOfZoneModifier ******************/
		%feature("compactdefaultargs") SetValueOfZoneModifier;
		%feature("autodoc", "* Sets value associated with tolerance zone.
	:param theValue:
	:type theValue: float
	:rtype: None") SetValueOfZoneModifier;
		void SetValueOfZoneModifier (const Standard_Real theValue);

		/****************** SetZoneModifier ******************/
		%feature("compactdefaultargs") SetZoneModifier;
		%feature("autodoc", "* Sets tolerance zone.
	:param theZoneModif:
	:type theZoneModif: XCAFDimTolObjects_GeomToleranceZoneModif
	:rtype: None") SetZoneModifier;
		void SetZoneModifier (const XCAFDimTolObjects_GeomToleranceZoneModif theZoneModif);

		/****************** XCAFDimTolObjects_GeomToleranceObject ******************/
		%feature("compactdefaultargs") XCAFDimTolObjects_GeomToleranceObject;
		%feature("autodoc", ":rtype: None") XCAFDimTolObjects_GeomToleranceObject;
		 XCAFDimTolObjects_GeomToleranceObject ();

		/****************** XCAFDimTolObjects_GeomToleranceObject ******************/
		%feature("compactdefaultargs") XCAFDimTolObjects_GeomToleranceObject;
		%feature("autodoc", ":param theObj:
	:type theObj: XCAFDimTolObjects_GeomToleranceObject
	:rtype: None") XCAFDimTolObjects_GeomToleranceObject;
		 XCAFDimTolObjects_GeomToleranceObject (const opencascade::handle<XCAFDimTolObjects_GeomToleranceObject> & theObj);

};


%make_alias(XCAFDimTolObjects_GeomToleranceObject)

%extend XCAFDimTolObjects_GeomToleranceObject {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class XCAFDimTolObjects_Tool *
*******************************/
class XCAFDimTolObjects_Tool {
	public:
		/****************** GetDimensions ******************/
		%feature("compactdefaultargs") GetDimensions;
		%feature("autodoc", "* Returns a sequence of Dimensions currently stored in the GD&T table
	:param theDimensionObjectSequence:
	:type theDimensionObjectSequence: XCAFDimTolObjects_DimensionObjectSequence
	:rtype: None") GetDimensions;
		void GetDimensions (XCAFDimTolObjects_DimensionObjectSequence & theDimensionObjectSequence);

		/****************** GetGeomTolerances ******************/
		%feature("compactdefaultargs") GetGeomTolerances;
		%feature("autodoc", "* Returns a sequence of Tolerances currently stored in the GD&T table
	:param theGeomToleranceObjectSequence:
	:type theGeomToleranceObjectSequence: XCAFDimTolObjects_GeomToleranceObjectSequence
	:param theDatumObjectSequence:
	:type theDatumObjectSequence: XCAFDimTolObjects_DatumObjectSequence
	:param theMap:
	:type theMap: XCAFDimTolObjects_DataMapOfToleranceDatum
	:rtype: None") GetGeomTolerances;
		void GetGeomTolerances (XCAFDimTolObjects_GeomToleranceObjectSequence & theGeomToleranceObjectSequence,XCAFDimTolObjects_DatumObjectSequence & theDatumObjectSequence,XCAFDimTolObjects_DataMapOfToleranceDatum & theMap);

		/****************** GetRefDatum ******************/
		%feature("compactdefaultargs") GetRefDatum;
		%feature("autodoc", "* Returns DatumObject defined for Shape
	:param theShape:
	:type theShape: TopoDS_Shape
	:param theDatum:
	:type theDatum: XCAFDimTolObjects_DatumObject
	:rtype: bool") GetRefDatum;
		Standard_Boolean GetRefDatum (const TopoDS_Shape & theShape,opencascade::handle<XCAFDimTolObjects_DatumObject> & theDatum);

		/****************** GetRefDimensions ******************/
		%feature("compactdefaultargs") GetRefDimensions;
		%feature("autodoc", "* Returns all Dimensions defined for Shape
	:param theShape:
	:type theShape: TopoDS_Shape
	:param theDimensions:
	:type theDimensions: XCAFDimTolObjects_DimensionObjectSequence
	:rtype: bool") GetRefDimensions;
		Standard_Boolean GetRefDimensions (const TopoDS_Shape & theShape,XCAFDimTolObjects_DimensionObjectSequence & theDimensions);

		/****************** GetRefGeomTolerances ******************/
		%feature("compactdefaultargs") GetRefGeomTolerances;
		%feature("autodoc", "* Returns all GeomTolerances defined for Shape
	:param theShape:
	:type theShape: TopoDS_Shape
	:param theGeomToleranceObjectSequence:
	:type theGeomToleranceObjectSequence: XCAFDimTolObjects_GeomToleranceObjectSequence
	:param theDatumObjectSequence:
	:type theDatumObjectSequence: XCAFDimTolObjects_DatumObjectSequence
	:param theMap:
	:type theMap: XCAFDimTolObjects_DataMapOfToleranceDatum
	:rtype: bool") GetRefGeomTolerances;
		Standard_Boolean GetRefGeomTolerances (const TopoDS_Shape & theShape,XCAFDimTolObjects_GeomToleranceObjectSequence & theGeomToleranceObjectSequence,XCAFDimTolObjects_DatumObjectSequence & theDatumObjectSequence,XCAFDimTolObjects_DataMapOfToleranceDatum & theMap);

		/****************** XCAFDimTolObjects_Tool ******************/
		%feature("compactdefaultargs") XCAFDimTolObjects_Tool;
		%feature("autodoc", ":param theDoc:
	:type theDoc: TDocStd_Document
	:rtype: None") XCAFDimTolObjects_Tool;
		 XCAFDimTolObjects_Tool (const opencascade::handle<TDocStd_Document> & theDoc);

};


%extend XCAFDimTolObjects_Tool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
