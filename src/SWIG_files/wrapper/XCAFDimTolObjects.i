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
"No docstring provided."
%enddef
%module (package="OCC.Core", docstring=XCAFDIMTOLOBJECTSDOCSTRING) XCAFDimTolObjects

#pragma SWIG nowarn=504,325,503,520,350,351,383,389,394,395, 404

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


%include XCAFDimTolObjects_headers.i

/* templates */
%template(XCAFDimTolObjects_DimensionObjectSequence) NCollection_Sequence <Handle_XCAFDimTolObjects_DimensionObject>;
%template(XCAFDimTolObjects_GeomToleranceModifiersSequence) NCollection_Sequence <XCAFDimTolObjects_GeomToleranceModif>;
%template(XCAFDimTolObjects_DimensionModifiersSequence) NCollection_Sequence <XCAFDimTolObjects_DimensionModif>;
%template(XCAFDimTolObjects_DatumModifiersSequence) NCollection_Sequence <XCAFDimTolObjects_DatumSingleModif>;
%template(XCAFDimTolObjects_DatumObjectSequence) NCollection_Sequence <Handle_XCAFDimTolObjects_DatumObject>;
%template(XCAFDimTolObjects_DataMapOfToleranceDatum) NCollection_DataMap <Handle_XCAFDimTolObjects_GeomToleranceObject , Handle_XCAFDimTolObjects_DatumObject , TColStd_MapTransientHasher>;
%template(XCAFDimTolObjects_GeomToleranceObjectSequence) NCollection_Sequence <Handle_XCAFDimTolObjects_GeomToleranceObject>;
/* end templates declaration */


/* typedefs */
typedef NCollection_Sequence <Handle_XCAFDimTolObjects_DimensionObject> XCAFDimTolObjects_DimensionObjectSequence;
typedef NCollection_Sequence <XCAFDimTolObjects_GeomToleranceModif> XCAFDimTolObjects_GeomToleranceModifiersSequence;
typedef NCollection_Sequence <XCAFDimTolObjects_DimensionModif> XCAFDimTolObjects_DimensionModifiersSequence;
typedef NCollection_Sequence <XCAFDimTolObjects_DatumSingleModif> XCAFDimTolObjects_DatumModifiersSequence;
typedef NCollection_Sequence <Handle_XCAFDimTolObjects_DatumObject> XCAFDimTolObjects_DatumObjectSequence;
typedef NCollection_DataMap <Handle_XCAFDimTolObjects_GeomToleranceObject , Handle_XCAFDimTolObjects_DatumObject , TColStd_MapTransientHasher> XCAFDimTolObjects_DataMapOfToleranceDatum;
typedef NCollection_Sequence <Handle_XCAFDimTolObjects_GeomToleranceObject> XCAFDimTolObjects_GeomToleranceObjectSequence;
/* end typedefs declaration */

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

%wrap_handle(XCAFDimTolObjects_DatumObject)
%wrap_handle(XCAFDimTolObjects_DimensionObject)
%wrap_handle(XCAFDimTolObjects_GeomToleranceObject)

%nodefaultctor XCAFDimTolObjects_DatumObject;
class XCAFDimTolObjects_DatumObject : public Standard_Transient {
	public:
		%feature("compactdefaultargs") AddModifier;
		%feature("autodoc", "	:param theModifier:
	:type theModifier: XCAFDimTolObjects_DatumSingleModif
	:rtype: None
") AddModifier;
		void AddModifier (const XCAFDimTolObjects_DatumSingleModif theModifier);
		%feature("compactdefaultargs") GetDatumTarget;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") GetDatumTarget;
		TopoDS_Shape GetDatumTarget ();
		%feature("compactdefaultargs") GetDatumTargetAxis;
		%feature("autodoc", "	:rtype: gp_Ax2
") GetDatumTargetAxis;
		gp_Ax2 GetDatumTargetAxis ();
		%feature("compactdefaultargs") GetDatumTargetLength;
		%feature("autodoc", "	:rtype: float
") GetDatumTargetLength;
		Standard_Real GetDatumTargetLength ();
		%feature("compactdefaultargs") GetDatumTargetNumber;
		%feature("autodoc", "	:rtype: int
") GetDatumTargetNumber;
		Standard_Integer GetDatumTargetNumber ();
		%feature("compactdefaultargs") GetDatumTargetType;
		%feature("autodoc", "	:rtype: XCAFDimTolObjects_DatumTargetType
") GetDatumTargetType;
		XCAFDimTolObjects_DatumTargetType GetDatumTargetType ();
		%feature("compactdefaultargs") GetDatumTargetWidth;
		%feature("autodoc", "	:rtype: float
") GetDatumTargetWidth;
		Standard_Real GetDatumTargetWidth ();
		%feature("compactdefaultargs") GetModifierWithValue;
		%feature("autodoc", "	:param theModifier:
	:type theModifier: XCAFDimTolObjects_DatumModifWithValue &
	:param theValue:
	:type theValue: float &
	:rtype: None
") GetModifierWithValue;
		void GetModifierWithValue (XCAFDimTolObjects_DatumModifWithValue & theModifier,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetModifiers;
		%feature("autodoc", "	:rtype: XCAFDimTolObjects_DatumModifiersSequence
") GetModifiers;
		XCAFDimTolObjects_DatumModifiersSequence GetModifiers ();
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") GetName;
		Handle_TCollection_HAsciiString GetName ();
		%feature("compactdefaultargs") GetPlane;
		%feature("autodoc", "	:rtype: gp_Ax2
") GetPlane;
		const gp_Ax2  GetPlane ();
		%feature("compactdefaultargs") GetPoint;
		%feature("autodoc", "	:rtype: gp_Pnt
") GetPoint;
		const gp_Pnt  GetPoint ();
		%feature("compactdefaultargs") GetPointTextAttach;
		%feature("autodoc", "	:rtype: gp_Pnt
") GetPointTextAttach;
		const gp_Pnt  GetPointTextAttach ();
		%feature("compactdefaultargs") GetPosition;
		%feature("autodoc", "	:rtype: int
") GetPosition;
		Standard_Integer GetPosition ();
		%feature("compactdefaultargs") GetPresentation;
		%feature("autodoc", "	* Returns graphical presentation of the object

	:rtype: TopoDS_Shape
") GetPresentation;
		TopoDS_Shape GetPresentation ();
		%feature("compactdefaultargs") GetPresentationName;
		%feature("autodoc", "	* Returns graphical presentation of the object

	:rtype: Handle_TCollection_HAsciiString
") GetPresentationName;
		Handle_TCollection_HAsciiString GetPresentationName ();
		%feature("compactdefaultargs") HasDatumTargetParams;
		%feature("autodoc", "	* Returns true if datum has valid parameters for datum target (width, length, circle radius etc)

	:rtype: bool
") HasDatumTargetParams;
		Standard_Boolean HasDatumTargetParams ();
		%feature("compactdefaultargs") HasPlane;
		%feature("autodoc", "	:rtype: bool
") HasPlane;
		Standard_Boolean HasPlane ();
		%feature("compactdefaultargs") HasPoint;
		%feature("autodoc", "	:rtype: bool
") HasPoint;
		Standard_Boolean HasPoint ();
		%feature("compactdefaultargs") HasPointText;
		%feature("autodoc", "	:rtype: bool
") HasPointText;
		Standard_Boolean HasPointText ();
		%feature("compactdefaultargs") IsDatumTarget;
		%feature("autodoc", "	:rtype: bool
") IsDatumTarget;
		Standard_Boolean IsDatumTarget ();
		%feature("compactdefaultargs") IsDatumTarget;
		%feature("autodoc", "	:param theIsDT:
	:type theIsDT: bool
	:rtype: None
") IsDatumTarget;
		void IsDatumTarget (const Standard_Boolean theIsDT);
		%feature("compactdefaultargs") SetDatumTarget;
		%feature("autodoc", "	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: None
") SetDatumTarget;
		void SetDatumTarget (const TopoDS_Shape & theShape);
		%feature("compactdefaultargs") SetDatumTargetAxis;
		%feature("autodoc", "	:param theAxis:
	:type theAxis: gp_Ax2
	:rtype: None
") SetDatumTargetAxis;
		void SetDatumTargetAxis (const gp_Ax2 & theAxis);
		%feature("compactdefaultargs") SetDatumTargetLength;
		%feature("autodoc", "	:param theLength:
	:type theLength: float
	:rtype: None
") SetDatumTargetLength;
		void SetDatumTargetLength (const Standard_Real theLength);
		%feature("compactdefaultargs") SetDatumTargetNumber;
		%feature("autodoc", "	:param theNumber:
	:type theNumber: int
	:rtype: None
") SetDatumTargetNumber;
		void SetDatumTargetNumber (const Standard_Integer theNumber);
		%feature("compactdefaultargs") SetDatumTargetType;
		%feature("autodoc", "	:param theType:
	:type theType: XCAFDimTolObjects_DatumTargetType
	:rtype: None
") SetDatumTargetType;
		void SetDatumTargetType (const XCAFDimTolObjects_DatumTargetType theType);
		%feature("compactdefaultargs") SetDatumTargetWidth;
		%feature("autodoc", "	:param theWidth:
	:type theWidth: float
	:rtype: None
") SetDatumTargetWidth;
		void SetDatumTargetWidth (const Standard_Real theWidth);
		%feature("compactdefaultargs") SetModifierWithValue;
		%feature("autodoc", "	:param theModifier:
	:type theModifier: XCAFDimTolObjects_DatumModifWithValue
	:param theValue:
	:type theValue: float
	:rtype: None
") SetModifierWithValue;
		void SetModifierWithValue (const XCAFDimTolObjects_DatumModifWithValue theModifier,const Standard_Real theValue);
		%feature("compactdefaultargs") SetModifiers;
		%feature("autodoc", "	:param theModifiers:
	:type theModifiers: XCAFDimTolObjects_DatumModifiersSequence &
	:rtype: None
") SetModifiers;
		void SetModifiers (const XCAFDimTolObjects_DatumModifiersSequence & theModifiers);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param theTag:
	:type theTag: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & theTag);
		%feature("compactdefaultargs") SetPlane;
		%feature("autodoc", "	:param thePlane:
	:type thePlane: gp_Ax2
	:rtype: None
") SetPlane;
		void SetPlane (const gp_Ax2 & thePlane);
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: None
") SetPoint;
		void SetPoint (const gp_Pnt & thePnt);
		%feature("compactdefaultargs") SetPointTextAttach;
		%feature("autodoc", "	:param thePntText:
	:type thePntText: gp_Pnt
	:rtype: None
") SetPointTextAttach;
		void SetPointTextAttach (const gp_Pnt & thePntText);
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "	:param thePosition:
	:type thePosition: int
	:rtype: None
") SetPosition;
		void SetPosition (const Standard_Integer thePosition);
		%feature("compactdefaultargs") SetPresentation;
		%feature("autodoc", "	* Set graphical presentation for object

	:param thePresentation:
	:type thePresentation: TopoDS_Shape &
	:param thePresentationName:
	:type thePresentationName: Handle_TCollection_HAsciiString &
	:rtype: None
") SetPresentation;
		void SetPresentation (const TopoDS_Shape & thePresentation,const Handle_TCollection_HAsciiString & thePresentationName);
		%feature("compactdefaultargs") XCAFDimTolObjects_DatumObject;
		%feature("autodoc", "	:rtype: None
") XCAFDimTolObjects_DatumObject;
		 XCAFDimTolObjects_DatumObject ();
		%feature("compactdefaultargs") XCAFDimTolObjects_DatumObject;
		%feature("autodoc", "	:param theObj:
	:type theObj: Handle_XCAFDimTolObjects_DatumObject &
	:rtype: None
") XCAFDimTolObjects_DatumObject;
		 XCAFDimTolObjects_DatumObject (const Handle_XCAFDimTolObjects_DatumObject & theObj);
};


%make_alias(XCAFDimTolObjects_DatumObject)

%extend XCAFDimTolObjects_DatumObject {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XCAFDimTolObjects_DimensionObject;
class XCAFDimTolObjects_DimensionObject : public Standard_Transient {
	public:
		%feature("compactdefaultargs") AddDescription;
		%feature("autodoc", "	* Add new description

	:param theDescription:
	:type theDescription: Handle_TCollection_HAsciiString
	:param theName:
	:type theName: Handle_TCollection_HAsciiString
	:rtype: None
") AddDescription;
		void AddDescription (const Handle_TCollection_HAsciiString theDescription,const Handle_TCollection_HAsciiString theName);
		%feature("compactdefaultargs") AddModifier;
		%feature("autodoc", "	:param theModifier:
	:type theModifier: XCAFDimTolObjects_DimensionModif
	:rtype: None
") AddModifier;
		void AddModifier (const XCAFDimTolObjects_DimensionModif theModifier);
		%feature("compactdefaultargs") GetClassOfTolerance;
		%feature("autodoc", "	:param theHole:
	:type theHole: bool
	:param theFormVariance:
	:type theFormVariance: XCAFDimTolObjects_DimensionFormVariance &
	:param theGrade:
	:type theGrade: XCAFDimTolObjects_DimensionGrade &
	:rtype: bool
") GetClassOfTolerance;
		Standard_Boolean GetClassOfTolerance (Standard_Boolean &OutValue,XCAFDimTolObjects_DimensionFormVariance & theFormVariance,XCAFDimTolObjects_DimensionGrade & theGrade);
		%feature("compactdefaultargs") GetDescription;
		%feature("autodoc", "	* Returns description with the given number

	:param theNumber:
	:type theNumber: int
	:rtype: Handle_TCollection_HAsciiString
") GetDescription;
		Handle_TCollection_HAsciiString GetDescription (const Standard_Integer theNumber);
		%feature("compactdefaultargs") GetDescriptionName;
		%feature("autodoc", "	* Returns name of description with the given number

	:param theNumber:
	:type theNumber: int
	:rtype: Handle_TCollection_HAsciiString
") GetDescriptionName;
		Handle_TCollection_HAsciiString GetDescriptionName (const Standard_Integer theNumber);
		%feature("compactdefaultargs") GetDirection;
		%feature("autodoc", "	:param theDir:
	:type theDir: gp_Dir
	:rtype: bool
") GetDirection;
		Standard_Boolean GetDirection (gp_Dir & theDir);
		%feature("compactdefaultargs") GetLowerBound;
		%feature("autodoc", "	:rtype: float
") GetLowerBound;
		Standard_Real GetLowerBound ();
		%feature("compactdefaultargs") GetLowerTolValue;
		%feature("autodoc", "	:rtype: float
") GetLowerTolValue;
		Standard_Real GetLowerTolValue ();
		%feature("compactdefaultargs") GetModifiers;
		%feature("autodoc", "	:rtype: XCAFDimTolObjects_DimensionModifiersSequence
") GetModifiers;
		XCAFDimTolObjects_DimensionModifiersSequence GetModifiers ();
		%feature("compactdefaultargs") GetNbOfDecimalPlaces;
		%feature("autodoc", "	:param theL:
	:type theL: int &
	:param theR:
	:type theR: int &
	:rtype: None
") GetNbOfDecimalPlaces;
		void GetNbOfDecimalPlaces (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") GetPath;
		%feature("autodoc", "	:rtype: TopoDS_Edge
") GetPath;
		TopoDS_Edge GetPath ();
		%feature("compactdefaultargs") GetPlane;
		%feature("autodoc", "	:rtype: gp_Ax2
") GetPlane;
		const gp_Ax2  GetPlane ();
		%feature("compactdefaultargs") GetPoint;
		%feature("autodoc", "	* Get connection point (for dimesional_size), Get connection point for first shape (for dimensional_location)

	:rtype: gp_Pnt
") GetPoint;
		gp_Pnt GetPoint ();
		%feature("compactdefaultargs") GetPoint2;
		%feature("autodoc", "	:rtype: gp_Pnt
") GetPoint2;
		gp_Pnt GetPoint2 ();
		%feature("compactdefaultargs") GetPointTextAttach;
		%feature("autodoc", "	:rtype: gp_Pnt
") GetPointTextAttach;
		const gp_Pnt  GetPointTextAttach ();
		%feature("compactdefaultargs") GetPresentation;
		%feature("autodoc", "	* Returns graphical presentation of the object

	:rtype: TopoDS_Shape
") GetPresentation;
		TopoDS_Shape GetPresentation ();
		%feature("compactdefaultargs") GetPresentationName;
		%feature("autodoc", "	* Returns graphical presentation of the object

	:rtype: Handle_TCollection_HAsciiString
") GetPresentationName;
		Handle_TCollection_HAsciiString GetPresentationName ();
		%feature("compactdefaultargs") GetQualifier;
		%feature("autodoc", "	:rtype: XCAFDimTolObjects_DimensionQualifier
") GetQualifier;
		XCAFDimTolObjects_DimensionQualifier GetQualifier ();
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	:rtype: XCAFDimTolObjects_DimensionType
") GetType;
		XCAFDimTolObjects_DimensionType GetType ();
		%feature("compactdefaultargs") GetUpperBound;
		%feature("autodoc", "	:rtype: float
") GetUpperBound;
		Standard_Real GetUpperBound ();
		%feature("compactdefaultargs") GetUpperTolValue;
		%feature("autodoc", "	:rtype: float
") GetUpperTolValue;
		Standard_Real GetUpperTolValue ();
		%feature("compactdefaultargs") GetValue;
		%feature("autodoc", "	:rtype: float
") GetValue;
		Standard_Real GetValue ();
		%feature("compactdefaultargs") GetValues;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfReal
") GetValues;
		Handle_TColStd_HArray1OfReal GetValues ();
		%feature("compactdefaultargs") HasDescriptions;
		%feature("autodoc", "	* Returns true, if the object has descriptions

	:rtype: bool
") HasDescriptions;
		Standard_Boolean HasDescriptions ();
		%feature("compactdefaultargs") HasPlane;
		%feature("autodoc", "	:rtype: bool
") HasPlane;
		Standard_Boolean HasPlane ();
		%feature("compactdefaultargs") HasPoint;
		%feature("autodoc", "	* Returns true, if connection point exists (for dimesional_size), if connection point for first shape exists (for dimensional_location)

	:rtype: bool
") HasPoint;
		Standard_Boolean HasPoint ();
		%feature("compactdefaultargs") HasPoint2;
		%feature("autodoc", "	:rtype: bool
") HasPoint2;
		Standard_Boolean HasPoint2 ();
		%feature("compactdefaultargs") HasQualifier;
		%feature("autodoc", "	:rtype: bool
") HasQualifier;
		Standard_Boolean HasQualifier ();
		%feature("compactdefaultargs") HasTextPoint;
		%feature("autodoc", "	:rtype: bool
") HasTextPoint;
		Standard_Boolean HasTextPoint ();
		%feature("compactdefaultargs") IsDimWithClassOfTolerance;
		%feature("autodoc", "	:rtype: bool
") IsDimWithClassOfTolerance;
		Standard_Boolean IsDimWithClassOfTolerance ();
		%feature("compactdefaultargs") IsDimWithPlusMinusTolerance;
		%feature("autodoc", "	:rtype: bool
") IsDimWithPlusMinusTolerance;
		Standard_Boolean IsDimWithPlusMinusTolerance ();
		%feature("compactdefaultargs") IsDimWithRange;
		%feature("autodoc", "	:rtype: bool
") IsDimWithRange;
		Standard_Boolean IsDimWithRange ();
		%feature("compactdefaultargs") NbDescriptions;
		%feature("autodoc", "	* Returns number of descriptions

	:rtype: int
") NbDescriptions;
		Standard_Integer NbDescriptions ();
		%feature("compactdefaultargs") RemoveDescription;
		%feature("autodoc", "	* Remove description with the given number

	:param theNumber:
	:type theNumber: int
	:rtype: None
") RemoveDescription;
		void RemoveDescription (const Standard_Integer theNumber);
		%feature("compactdefaultargs") SetClassOfTolerance;
		%feature("autodoc", "	:param theHole:
	:type theHole: bool
	:param theFormVariance:
	:type theFormVariance: XCAFDimTolObjects_DimensionFormVariance
	:param theGrade:
	:type theGrade: XCAFDimTolObjects_DimensionGrade
	:rtype: None
") SetClassOfTolerance;
		void SetClassOfTolerance (const Standard_Boolean theHole,const XCAFDimTolObjects_DimensionFormVariance theFormVariance,const XCAFDimTolObjects_DimensionGrade theGrade);
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "	:param theDir:
	:type theDir: gp_Dir
	:rtype: bool
") SetDirection;
		Standard_Boolean SetDirection (const gp_Dir & theDir);
		%feature("compactdefaultargs") SetLowerBound;
		%feature("autodoc", "	:param theLowerBound:
	:type theLowerBound: float
	:rtype: None
") SetLowerBound;
		void SetLowerBound (const Standard_Real theLowerBound);
		%feature("compactdefaultargs") SetLowerTolValue;
		%feature("autodoc", "	:param theLowerTolValue:
	:type theLowerTolValue: float
	:rtype: bool
") SetLowerTolValue;
		Standard_Boolean SetLowerTolValue (const Standard_Real theLowerTolValue);
		%feature("compactdefaultargs") SetModifiers;
		%feature("autodoc", "	:param theModifiers:
	:type theModifiers: XCAFDimTolObjects_DimensionModifiersSequence &
	:rtype: None
") SetModifiers;
		void SetModifiers (const XCAFDimTolObjects_DimensionModifiersSequence & theModifiers);
		%feature("compactdefaultargs") SetNbOfDecimalPlaces;
		%feature("autodoc", "	:param theL:
	:type theL: int
	:param theR:
	:type theR: int
	:rtype: None
") SetNbOfDecimalPlaces;
		void SetNbOfDecimalPlaces (const Standard_Integer theL,const Standard_Integer theR);
		%feature("compactdefaultargs") SetPath;
		%feature("autodoc", "	:param thePath:
	:type thePath: TopoDS_Edge &
	:rtype: None
") SetPath;
		void SetPath (const TopoDS_Edge & thePath);
		%feature("compactdefaultargs") SetPlane;
		%feature("autodoc", "	:param thePlane:
	:type thePlane: gp_Ax2
	:rtype: None
") SetPlane;
		void SetPlane (const gp_Ax2 & thePlane);
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "	* Set connection point (for dimesional_size), Set connection point for first shape (for dimensional_location)

	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: None
") SetPoint;
		void SetPoint (const gp_Pnt thePnt);
		%feature("compactdefaultargs") SetPoint2;
		%feature("autodoc", "	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: None
") SetPoint2;
		void SetPoint2 (const gp_Pnt thePnt);
		%feature("compactdefaultargs") SetPointTextAttach;
		%feature("autodoc", "	:param thePntText:
	:type thePntText: gp_Pnt
	:rtype: None
") SetPointTextAttach;
		void SetPointTextAttach (const gp_Pnt & thePntText);
		%feature("compactdefaultargs") SetPresentation;
		%feature("autodoc", "	* Set graphical presentation for object

	:param thePresentation:
	:type thePresentation: TopoDS_Shape &
	:param thePresentationName:
	:type thePresentationName: Handle_TCollection_HAsciiString &
	:rtype: None
") SetPresentation;
		void SetPresentation (const TopoDS_Shape & thePresentation,const Handle_TCollection_HAsciiString & thePresentationName);
		%feature("compactdefaultargs") SetQualifier;
		%feature("autodoc", "	:param theQualifier:
	:type theQualifier: XCAFDimTolObjects_DimensionQualifier
	:rtype: None
") SetQualifier;
		void SetQualifier (const XCAFDimTolObjects_DimensionQualifier theQualifier);
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "	:param theTyupe:
	:type theTyupe: XCAFDimTolObjects_DimensionType
	:rtype: None
") SetType;
		void SetType (const XCAFDimTolObjects_DimensionType theTyupe);
		%feature("compactdefaultargs") SetUpperBound;
		%feature("autodoc", "	:param theUpperBound:
	:type theUpperBound: float
	:rtype: None
") SetUpperBound;
		void SetUpperBound (const Standard_Real theUpperBound);
		%feature("compactdefaultargs") SetUpperTolValue;
		%feature("autodoc", "	:param theUperTolValue:
	:type theUperTolValue: float
	:rtype: bool
") SetUpperTolValue;
		Standard_Boolean SetUpperTolValue (const Standard_Real theUperTolValue);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param theValue:
	:type theValue: float
	:rtype: None
") SetValue;
		void SetValue (const Standard_Real theValue);
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "	:param theValue:
	:type theValue: Handle_TColStd_HArray1OfReal &
	:rtype: None
") SetValues;
		void SetValues (const Handle_TColStd_HArray1OfReal & theValue);
		%feature("compactdefaultargs") XCAFDimTolObjects_DimensionObject;
		%feature("autodoc", "	:rtype: None
") XCAFDimTolObjects_DimensionObject;
		 XCAFDimTolObjects_DimensionObject ();
		%feature("compactdefaultargs") XCAFDimTolObjects_DimensionObject;
		%feature("autodoc", "	:param theObj:
	:type theObj: Handle_XCAFDimTolObjects_DimensionObject &
	:rtype: None
") XCAFDimTolObjects_DimensionObject;
		 XCAFDimTolObjects_DimensionObject (const Handle_XCAFDimTolObjects_DimensionObject & theObj);
};


%make_alias(XCAFDimTolObjects_DimensionObject)

%extend XCAFDimTolObjects_DimensionObject {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XCAFDimTolObjects_GeomToleranceObject;
class XCAFDimTolObjects_GeomToleranceObject : public Standard_Transient {
	public:
		%feature("compactdefaultargs") AddModifier;
		%feature("autodoc", "	:param theModifier:
	:type theModifier: XCAFDimTolObjects_GeomToleranceModif
	:rtype: None
") AddModifier;
		void AddModifier (const XCAFDimTolObjects_GeomToleranceModif theModifier);
		%feature("compactdefaultargs") GetAxis;
		%feature("autodoc", "	:rtype: gp_Ax2
") GetAxis;
		gp_Ax2 GetAxis ();
		%feature("compactdefaultargs") GetMaterialRequirementModifier;
		%feature("autodoc", "	:rtype: XCAFDimTolObjects_GeomToleranceMatReqModif
") GetMaterialRequirementModifier;
		XCAFDimTolObjects_GeomToleranceMatReqModif GetMaterialRequirementModifier ();
		%feature("compactdefaultargs") GetMaxValueModifier;
		%feature("autodoc", "	:rtype: float
") GetMaxValueModifier;
		Standard_Real GetMaxValueModifier ();
		%feature("compactdefaultargs") GetModifiers;
		%feature("autodoc", "	:rtype: XCAFDimTolObjects_GeomToleranceModifiersSequence
") GetModifiers;
		XCAFDimTolObjects_GeomToleranceModifiersSequence GetModifiers ();
		%feature("compactdefaultargs") GetPlane;
		%feature("autodoc", "	:rtype: gp_Ax2
") GetPlane;
		const gp_Ax2  GetPlane ();
		%feature("compactdefaultargs") GetPoint;
		%feature("autodoc", "	:rtype: gp_Pnt
") GetPoint;
		const gp_Pnt  GetPoint ();
		%feature("compactdefaultargs") GetPointTextAttach;
		%feature("autodoc", "	:rtype: gp_Pnt
") GetPointTextAttach;
		const gp_Pnt  GetPointTextAttach ();
		%feature("compactdefaultargs") GetPresentation;
		%feature("autodoc", "	* Returns graphical presentation of the object

	:rtype: TopoDS_Shape
") GetPresentation;
		TopoDS_Shape GetPresentation ();
		%feature("compactdefaultargs") GetPresentationName;
		%feature("autodoc", "	* Returns graphical presentation of the object

	:rtype: Handle_TCollection_HAsciiString
") GetPresentationName;
		Handle_TCollection_HAsciiString GetPresentationName ();
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	:rtype: XCAFDimTolObjects_GeomToleranceType
") GetType;
		XCAFDimTolObjects_GeomToleranceType GetType ();
		%feature("compactdefaultargs") GetTypeOfValue;
		%feature("autodoc", "	:rtype: XCAFDimTolObjects_GeomToleranceTypeValue
") GetTypeOfValue;
		XCAFDimTolObjects_GeomToleranceTypeValue GetTypeOfValue ();
		%feature("compactdefaultargs") GetValue;
		%feature("autodoc", "	:rtype: float
") GetValue;
		Standard_Real GetValue ();
		%feature("compactdefaultargs") GetValueOfZoneModifier;
		%feature("autodoc", "	:rtype: float
") GetValueOfZoneModifier;
		Standard_Real GetValueOfZoneModifier ();
		%feature("compactdefaultargs") GetZoneModifier;
		%feature("autodoc", "	:rtype: XCAFDimTolObjects_GeomToleranceZoneModif
") GetZoneModifier;
		XCAFDimTolObjects_GeomToleranceZoneModif GetZoneModifier ();
		%feature("compactdefaultargs") HasAxis;
		%feature("autodoc", "	:rtype: bool
") HasAxis;
		Standard_Boolean HasAxis ();
		%feature("compactdefaultargs") HasPlane;
		%feature("autodoc", "	:rtype: bool
") HasPlane;
		Standard_Boolean HasPlane ();
		%feature("compactdefaultargs") HasPoint;
		%feature("autodoc", "	:rtype: bool
") HasPoint;
		Standard_Boolean HasPoint ();
		%feature("compactdefaultargs") HasPointText;
		%feature("autodoc", "	:rtype: bool
") HasPointText;
		Standard_Boolean HasPointText ();
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "	:param theAxis:
	:type theAxis: gp_Ax2
	:rtype: None
") SetAxis;
		void SetAxis (const gp_Ax2 theAxis);
		%feature("compactdefaultargs") SetMaterialRequirementModifier;
		%feature("autodoc", "	:param theMatReqModif:
	:type theMatReqModif: XCAFDimTolObjects_GeomToleranceMatReqModif
	:rtype: None
") SetMaterialRequirementModifier;
		void SetMaterialRequirementModifier (const XCAFDimTolObjects_GeomToleranceMatReqModif theMatReqModif);
		%feature("compactdefaultargs") SetMaxValueModifier;
		%feature("autodoc", "	:param theModifier:
	:type theModifier: float
	:rtype: None
") SetMaxValueModifier;
		void SetMaxValueModifier (const Standard_Real theModifier);
		%feature("compactdefaultargs") SetModifiers;
		%feature("autodoc", "	:param theModifiers:
	:type theModifiers: XCAFDimTolObjects_GeomToleranceModifiersSequence &
	:rtype: None
") SetModifiers;
		void SetModifiers (const XCAFDimTolObjects_GeomToleranceModifiersSequence & theModifiers);
		%feature("compactdefaultargs") SetPlane;
		%feature("autodoc", "	:param thePlane:
	:type thePlane: gp_Ax2
	:rtype: None
") SetPlane;
		void SetPlane (const gp_Ax2 & thePlane);
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: None
") SetPoint;
		void SetPoint (const gp_Pnt & thePnt);
		%feature("compactdefaultargs") SetPointTextAttach;
		%feature("autodoc", "	:param thePntText:
	:type thePntText: gp_Pnt
	:rtype: None
") SetPointTextAttach;
		void SetPointTextAttach (const gp_Pnt & thePntText);
		%feature("compactdefaultargs") SetPresentation;
		%feature("autodoc", "	* Set graphical presentation for object

	:param thePresentation:
	:type thePresentation: TopoDS_Shape &
	:param thePresentationName:
	:type thePresentationName: Handle_TCollection_HAsciiString &
	:rtype: None
") SetPresentation;
		void SetPresentation (const TopoDS_Shape & thePresentation,const Handle_TCollection_HAsciiString & thePresentationName);
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "	:param theType:
	:type theType: XCAFDimTolObjects_GeomToleranceType
	:rtype: None
") SetType;
		void SetType (const XCAFDimTolObjects_GeomToleranceType theType);
		%feature("compactdefaultargs") SetTypeOfValue;
		%feature("autodoc", "	:param theTypeOfValue:
	:type theTypeOfValue: XCAFDimTolObjects_GeomToleranceTypeValue
	:rtype: None
") SetTypeOfValue;
		void SetTypeOfValue (const XCAFDimTolObjects_GeomToleranceTypeValue theTypeOfValue);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param theValue:
	:type theValue: float
	:rtype: None
") SetValue;
		void SetValue (const Standard_Real theValue);
		%feature("compactdefaultargs") SetValueOfZoneModifier;
		%feature("autodoc", "	:param theValue:
	:type theValue: float
	:rtype: None
") SetValueOfZoneModifier;
		void SetValueOfZoneModifier (const Standard_Real theValue);
		%feature("compactdefaultargs") SetZoneModifier;
		%feature("autodoc", "	:param theZoneModif:
	:type theZoneModif: XCAFDimTolObjects_GeomToleranceZoneModif
	:rtype: None
") SetZoneModifier;
		void SetZoneModifier (const XCAFDimTolObjects_GeomToleranceZoneModif theZoneModif);
		%feature("compactdefaultargs") XCAFDimTolObjects_GeomToleranceObject;
		%feature("autodoc", "	:rtype: None
") XCAFDimTolObjects_GeomToleranceObject;
		 XCAFDimTolObjects_GeomToleranceObject ();
		%feature("compactdefaultargs") XCAFDimTolObjects_GeomToleranceObject;
		%feature("autodoc", "	:param theObj:
	:type theObj: Handle_XCAFDimTolObjects_GeomToleranceObject &
	:rtype: None
") XCAFDimTolObjects_GeomToleranceObject;
		 XCAFDimTolObjects_GeomToleranceObject (const Handle_XCAFDimTolObjects_GeomToleranceObject & theObj);
};


%make_alias(XCAFDimTolObjects_GeomToleranceObject)

%extend XCAFDimTolObjects_GeomToleranceObject {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XCAFDimTolObjects_Tool;
class XCAFDimTolObjects_Tool {
	public:
		%feature("compactdefaultargs") GetDimensions;
		%feature("autodoc", "	* Returns a sequence of Dimensions currently stored in the DGTtable

	:param theDimensionObjectSequence:
	:type theDimensionObjectSequence: XCAFDimTolObjects_DimensionObjectSequence &
	:rtype: None
") GetDimensions;
		void GetDimensions (XCAFDimTolObjects_DimensionObjectSequence & theDimensionObjectSequence);
		%feature("compactdefaultargs") GetGeomTolerances;
		%feature("autodoc", "	* Returns a sequence of Tolerancess currently stored in the DGTtable

	:param theGeomToleranceObjectSequence:
	:type theGeomToleranceObjectSequence: XCAFDimTolObjects_GeomToleranceObjectSequence &
	:param theDatumObjectSequence:
	:type theDatumObjectSequence: XCAFDimTolObjects_DatumObjectSequence &
	:param theMap:
	:type theMap: XCAFDimTolObjects_DataMapOfToleranceDatum &
	:rtype: None
") GetGeomTolerances;
		void GetGeomTolerances (XCAFDimTolObjects_GeomToleranceObjectSequence & theGeomToleranceObjectSequence,XCAFDimTolObjects_DatumObjectSequence & theDatumObjectSequence,XCAFDimTolObjects_DataMapOfToleranceDatum & theMap);
		%feature("compactdefaultargs") GetRefDatum;
		%feature("autodoc", "	* Returns DatumObject defined for Shape

	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theDatum:
	:type theDatum: Handle_XCAFDimTolObjects_DatumObject &
	:rtype: bool
") GetRefDatum;
		Standard_Boolean GetRefDatum (const TopoDS_Shape & theShape,Handle_XCAFDimTolObjects_DatumObject & theDatum);
		%feature("compactdefaultargs") GetRefDimensions;
		%feature("autodoc", "	* Returns all Dimensions defined for Shape

	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theDimensions:
	:type theDimensions: XCAFDimTolObjects_DimensionObjectSequence &
	:rtype: bool
") GetRefDimensions;
		Standard_Boolean GetRefDimensions (const TopoDS_Shape & theShape,XCAFDimTolObjects_DimensionObjectSequence & theDimensions);
		%feature("compactdefaultargs") GetRefGeomTolerances;
		%feature("autodoc", "	* Returns all GeomTolerances defined for Shape

	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theGeomToleranceObjectSequence:
	:type theGeomToleranceObjectSequence: XCAFDimTolObjects_GeomToleranceObjectSequence &
	:param theDatumObjectSequence:
	:type theDatumObjectSequence: XCAFDimTolObjects_DatumObjectSequence &
	:param theMap:
	:type theMap: XCAFDimTolObjects_DataMapOfToleranceDatum &
	:rtype: bool
") GetRefGeomTolerances;
		Standard_Boolean GetRefGeomTolerances (const TopoDS_Shape & theShape,XCAFDimTolObjects_GeomToleranceObjectSequence & theGeomToleranceObjectSequence,XCAFDimTolObjects_DatumObjectSequence & theDatumObjectSequence,XCAFDimTolObjects_DataMapOfToleranceDatum & theMap);
		%feature("compactdefaultargs") XCAFDimTolObjects_Tool;
		%feature("autodoc", "	:param theDoc:
	:type theDoc: Handle_TDocStd_Document &
	:rtype: None
") XCAFDimTolObjects_Tool;
		 XCAFDimTolObjects_Tool (const Handle_TDocStd_Document & theDoc);
};


%extend XCAFDimTolObjects_Tool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
