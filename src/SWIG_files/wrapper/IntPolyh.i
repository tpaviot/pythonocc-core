/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") IntPolyh

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include IntPolyh_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
typedef IntPolyh_Array <IntPolyh_Edge> IntPolyh_ArrayOfEdges;
typedef IntPolyh_Array <IntPolyh_SectionLine> IntPolyh_ArrayOfSectionLines;
typedef IntPolyh_Array <IntPolyh_Point> IntPolyh_ArrayOfPoints;
typedef IntPolyh_Array <IntPolyh_StartPoint> IntPolyh_ArrayOfTangentZones;
typedef IntPolyh_Array <IntPolyh_Couple> IntPolyh_ArrayOfCouples;
typedef IntPolyh_MaillageAffinage * IntPolyh_PMaillageAffinage;
typedef IntPolyh_Array <IntPolyh_StartPoint> IntPolyh_ArrayOfStartPoints;
typedef IntPolyh_Array <IntPolyh_Triangle> IntPolyh_ArrayOfTriangles;
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor IntPolyh_Couple;
class IntPolyh_Couple {
	public:
		%feature("compactdefaultargs") IntPolyh_Couple;
		%feature("autodoc", "	:rtype: None
") IntPolyh_Couple;
		 IntPolyh_Couple ();
		%feature("compactdefaultargs") IntPolyh_Couple;
		%feature("autodoc", "	:param i1:
	:type i1: int
	:param i2:
	:type i2: int
	:rtype: None
") IntPolyh_Couple;
		 IntPolyh_Couple (const Standard_Integer i1,const Standard_Integer i2);
		%feature("compactdefaultargs") FirstValue;
		%feature("autodoc", "	:rtype: int
") FirstValue;
		Standard_Integer FirstValue ();
		%feature("compactdefaultargs") SecondValue;
		%feature("autodoc", "	:rtype: int
") SecondValue;
		Standard_Integer SecondValue ();
		%feature("compactdefaultargs") AnalyseFlagValue;
		%feature("autodoc", "	:rtype: int
") AnalyseFlagValue;
		Standard_Integer AnalyseFlagValue ();
		%feature("compactdefaultargs") AngleValue;
		%feature("autodoc", "	:rtype: float
") AngleValue;
		Standard_Real AngleValue ();
		%feature("compactdefaultargs") SetCoupleValue;
		%feature("autodoc", "	:param v:
	:type v: int
	:param w:
	:type w: int
	:rtype: None
") SetCoupleValue;
		void SetCoupleValue (const Standard_Integer v,const Standard_Integer w);
		%feature("compactdefaultargs") SetAnalyseFlag;
		%feature("autodoc", "	:param v:
	:type v: int
	:rtype: None
") SetAnalyseFlag;
		void SetAnalyseFlag (const Standard_Integer v);
		%feature("compactdefaultargs") SetAngleValue;
		%feature("autodoc", "	:param ang:
	:type ang: float
	:rtype: None
") SetAngleValue;
		void SetAngleValue (const Standard_Real ang);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:param v:
	:type v: int
	:rtype: None
") Dump;
		void Dump (const Standard_Integer v);
};


%extend IntPolyh_Couple {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntPolyh_Edge;
class IntPolyh_Edge {
	public:
		%feature("compactdefaultargs") IntPolyh_Edge;
		%feature("autodoc", "	:rtype: None
") IntPolyh_Edge;
		 IntPolyh_Edge ();
		%feature("compactdefaultargs") IntPolyh_Edge;
		%feature("autodoc", "	:param i1:
	:type i1: int
	:param i2:
	:type i2: int
	:param i3:
	:type i3: int
	:param i4:
	:type i4: int
	:rtype: None
") IntPolyh_Edge;
		 IntPolyh_Edge (const Standard_Integer i1,const Standard_Integer i2,const Standard_Integer i3,const Standard_Integer i4);
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "	:rtype: int
") FirstPoint;
		Standard_Integer FirstPoint ();
		%feature("compactdefaultargs") SecondPoint;
		%feature("autodoc", "	:rtype: int
") SecondPoint;
		Standard_Integer SecondPoint ();
		%feature("compactdefaultargs") FirstTriangle;
		%feature("autodoc", "	:rtype: int
") FirstTriangle;
		Standard_Integer FirstTriangle ();
		%feature("compactdefaultargs") SecondTriangle;
		%feature("autodoc", "	:rtype: int
") SecondTriangle;
		Standard_Integer SecondTriangle ();
		%feature("compactdefaultargs") AnalysisFlag;
		%feature("autodoc", "	:rtype: int
") AnalysisFlag;
		Standard_Integer AnalysisFlag ();
		%feature("compactdefaultargs") SetFirstPoint;
		%feature("autodoc", "	:param v:
	:type v: int
	:rtype: None
") SetFirstPoint;
		void SetFirstPoint (const Standard_Integer v);
		%feature("compactdefaultargs") SetSecondPoint;
		%feature("autodoc", "	:param v:
	:type v: int
	:rtype: None
") SetSecondPoint;
		void SetSecondPoint (const Standard_Integer v);
		%feature("compactdefaultargs") SetFirstTriangle;
		%feature("autodoc", "	:param v:
	:type v: int
	:rtype: None
") SetFirstTriangle;
		void SetFirstTriangle (const Standard_Integer v);
		%feature("compactdefaultargs") SetSecondTriangle;
		%feature("autodoc", "	:param v:
	:type v: int
	:rtype: None
") SetSecondTriangle;
		void SetSecondTriangle (const Standard_Integer v);
		%feature("compactdefaultargs") SetAnalysisFlag;
		%feature("autodoc", "	:param v:
	:type v: int
	:rtype: None
") SetAnalysisFlag;
		void SetAnalysisFlag (const Standard_Integer v);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:param v:
	:type v: int
	:rtype: None
") Dump;
		void Dump (const Standard_Integer v);
};


%extend IntPolyh_Edge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntPolyh_Intersection;
class IntPolyh_Intersection {
	public:
		%feature("compactdefaultargs") IntPolyh_Intersection;
		%feature("autodoc", "	* Constructor

	:param S1:
	:type S1: Handle_Adaptor3d_HSurface &
	:param S2:
	:type S2: Handle_Adaptor3d_HSurface &
	:rtype: None
") IntPolyh_Intersection;
		 IntPolyh_Intersection (const Handle_Adaptor3d_HSurface & S1,const Handle_Adaptor3d_HSurface & S2);
		%feature("compactdefaultargs") IntPolyh_Intersection;
		%feature("autodoc", "	* NbSU1 ... NbSV2 are used to compute the initial samples of the iso parametric meshes on the surfaces.

	:param S1:
	:type S1: Handle_Adaptor3d_HSurface &
	:param NbSU1:
	:type NbSU1: int
	:param NbSV1:
	:type NbSV1: int
	:param S2:
	:type S2: Handle_Adaptor3d_HSurface &
	:param NbSU2:
	:type NbSU2: int
	:param NbSV2:
	:type NbSV2: int
	:rtype: None
") IntPolyh_Intersection;
		 IntPolyh_Intersection (const Handle_Adaptor3d_HSurface & S1,const Standard_Integer NbSU1,const Standard_Integer NbSV1,const Handle_Adaptor3d_HSurface & S2,const Standard_Integer NbSU2,const Standard_Integer NbSV2);
		%feature("compactdefaultargs") IntPolyh_Intersection;
		%feature("autodoc", "	* D1, D2 are used to compute the initial samples of the iso parametric meshes on the surfaces.

	:param S1:
	:type S1: Handle_Adaptor3d_HSurface &
	:param anUpars1:
	:type anUpars1: TColStd_Array1OfReal &
	:param aVpars1:
	:type aVpars1: TColStd_Array1OfReal &
	:param S2:
	:type S2: Handle_Adaptor3d_HSurface &
	:param anUpars2:
	:type anUpars2: TColStd_Array1OfReal &
	:param aVpars2:
	:type aVpars2: TColStd_Array1OfReal &
	:rtype: None
") IntPolyh_Intersection;
		 IntPolyh_Intersection (const Handle_Adaptor3d_HSurface & S1,const TColStd_Array1OfReal & anUpars1,const TColStd_Array1OfReal & aVpars1,const Handle_Adaptor3d_HSurface & S2,const TColStd_Array1OfReal & anUpars2,const TColStd_Array1OfReal & aVpars2);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Compute the intersection.

	:rtype: None
") Perform;
		void Perform ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Compute the intersection.

	:param Upars1:
	:type Upars1: TColStd_Array1OfReal &
	:param Vpars1:
	:type Vpars1: TColStd_Array1OfReal &
	:param Upars2:
	:type Upars2: TColStd_Array1OfReal &
	:param Vpars2:
	:type Vpars2: TColStd_Array1OfReal &
	:rtype: None
") Perform;
		void Perform (const TColStd_Array1OfReal & Upars1,const TColStd_Array1OfReal & Vpars1,const TColStd_Array1OfReal & Upars2,const TColStd_Array1OfReal & Vpars2);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbSectionLines;
		%feature("autodoc", "	:rtype: int
") NbSectionLines;
		Standard_Integer NbSectionLines ();
		%feature("compactdefaultargs") NbPointsInLine;
		%feature("autodoc", "	:param IndexLine:
	:type IndexLine: int
	:rtype: int
") NbPointsInLine;
		Standard_Integer NbPointsInLine (const Standard_Integer IndexLine);
		%feature("compactdefaultargs") GetLinePoint;
		%feature("autodoc", "	:param IndexLine:
	:type IndexLine: int
	:param IndexPoint:
	:type IndexPoint: int
	:param x:
	:type x: float &
	:param y:
	:type y: float &
	:param z:
	:type z: float &
	:param u1:
	:type u1: float &
	:param v1:
	:type v1: float &
	:param u2:
	:type u2: float &
	:param v2:
	:type v2: float &
	:param incidence:
	:type incidence: float &
	:rtype: None
") GetLinePoint;
		void GetLinePoint (const Standard_Integer IndexLine,const Standard_Integer IndexPoint,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") NbTangentZones;
		%feature("autodoc", "	:rtype: int
") NbTangentZones;
		Standard_Integer NbTangentZones ();
		%feature("compactdefaultargs") NbPointsInTangentZone;
		%feature("autodoc", "	:param IndexLine:
	:type IndexLine: int
	:rtype: int
") NbPointsInTangentZone;
		Standard_Integer NbPointsInTangentZone (const Standard_Integer IndexLine);
		%feature("compactdefaultargs") GetTangentZonePoint;
		%feature("autodoc", "	:param IndexLine:
	:type IndexLine: int
	:param IndexPoint:
	:type IndexPoint: int
	:param x:
	:type x: float &
	:param y:
	:type y: float &
	:param z:
	:type z: float &
	:param u1:
	:type u1: float &
	:param v1:
	:type v1: float &
	:param u2:
	:type u2: float &
	:param v2:
	:type v2: float &
	:rtype: None
") GetTangentZonePoint;
		void GetTangentZonePoint (const Standard_Integer IndexLine,const Standard_Integer IndexPoint,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend IntPolyh_Intersection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntPolyh_Point;
class IntPolyh_Point {
	public:
		%feature("compactdefaultargs") IntPolyh_Point;
		%feature("autodoc", "	:rtype: None
") IntPolyh_Point;
		 IntPolyh_Point ();
		%feature("compactdefaultargs") IntPolyh_Point;
		%feature("autodoc", "	:param xx:
	:type xx: float
	:param yy:
	:type yy: float
	:param zz:
	:type zz: float
	:param uu:
	:type uu: float
	:param vv:
	:type vv: float
	:rtype: None
") IntPolyh_Point;
		 IntPolyh_Point (const Standard_Real xx,const Standard_Real yy,const Standard_Real zz,const Standard_Real uu,const Standard_Real vv);
		%feature("compactdefaultargs") X;
		%feature("autodoc", "	:rtype: float
") X;
		Standard_Real X ();
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "	:rtype: float
") Y;
		Standard_Real Y ();
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "	:rtype: float
") Z;
		Standard_Real Z ();
		%feature("compactdefaultargs") U;
		%feature("autodoc", "	:rtype: float
") U;
		Standard_Real U ();
		%feature("compactdefaultargs") V;
		%feature("autodoc", "	:rtype: float
") V;
		Standard_Real V ();
		%feature("compactdefaultargs") PartOfCommon;
		%feature("autodoc", "	:rtype: int
") PartOfCommon;
		Standard_Integer PartOfCommon ();
		%feature("compactdefaultargs") Equal;
		%feature("autodoc", "	:param Pt:
	:type Pt: IntPolyh_Point &
	:rtype: None
") Equal;
		void Equal (const IntPolyh_Point & Pt);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Pt:
	:type Pt: IntPolyh_Point &
	:rtype: None
") operator =;
		void operator = (const IntPolyh_Point & Pt);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param v1:
	:type v1: float
	:param v2:
	:type v2: float
	:param v3:
	:type v3: float
	:param v4:
	:type v4: float
	:param v5:
	:type v5: float
	:param II: default value is 1
	:type II: int
	:rtype: None
") Set;
		void Set (const Standard_Real v1,const Standard_Real v2,const Standard_Real v3,const Standard_Real v4,const Standard_Real v5,const Standard_Integer II = 1);
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "	:param v:
	:type v: float
	:rtype: None
") SetX;
		void SetX (const Standard_Real v);
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "	:param v:
	:type v: float
	:rtype: None
") SetY;
		void SetY (const Standard_Real v);
		%feature("compactdefaultargs") SetZ;
		%feature("autodoc", "	:param v:
	:type v: float
	:rtype: None
") SetZ;
		void SetZ (const Standard_Real v);
		%feature("compactdefaultargs") SetU;
		%feature("autodoc", "	:param v:
	:type v: float
	:rtype: None
") SetU;
		void SetU (const Standard_Real v);
		%feature("compactdefaultargs") SetV;
		%feature("autodoc", "	:param v:
	:type v: float
	:rtype: None
") SetV;
		void SetV (const Standard_Real v);
		%feature("compactdefaultargs") SetPartOfCommon;
		%feature("autodoc", "	:param ii:
	:type ii: int
	:rtype: None
") SetPartOfCommon;
		void SetPartOfCommon (const Standard_Integer ii);
		%feature("compactdefaultargs") Middle;
		%feature("autodoc", "	:param MySurface:
	:type MySurface: Handle_Adaptor3d_HSurface &
	:param P1:
	:type P1: IntPolyh_Point &
	:param P2:
	:type P2: IntPolyh_Point &
	:rtype: None
") Middle;
		void Middle (const Handle_Adaptor3d_HSurface & MySurface,const IntPolyh_Point & P1,const IntPolyh_Point & P2);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param P1:
	:type P1: IntPolyh_Point &
	:rtype: IntPolyh_Point
") Add;
		IntPolyh_Point Add (const IntPolyh_Point & P1);
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "	:param P1:
	:type P1: IntPolyh_Point &
	:rtype: IntPolyh_Point
") operator +;
		IntPolyh_Point operator + (const IntPolyh_Point & P1);
		%feature("compactdefaultargs") Sub;
		%feature("autodoc", "	:param P1:
	:type P1: IntPolyh_Point &
	:rtype: IntPolyh_Point
") Sub;
		IntPolyh_Point Sub (const IntPolyh_Point & P1);
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "	:param P1:
	:type P1: IntPolyh_Point &
	:rtype: IntPolyh_Point
") operator -;
		IntPolyh_Point operator - (const IntPolyh_Point & P1);
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "	:param rr:
	:type rr: float
	:rtype: IntPolyh_Point
") Divide;
		IntPolyh_Point Divide (const Standard_Real rr);
		%feature("compactdefaultargs") operator /;
		%feature("autodoc", "	:param rr:
	:type rr: float
	:rtype: IntPolyh_Point
") operator /;
		IntPolyh_Point operator / (const Standard_Real rr);
		%feature("compactdefaultargs") Multiplication;
		%feature("autodoc", "	:param rr:
	:type rr: float
	:rtype: IntPolyh_Point
") Multiplication;
		IntPolyh_Point Multiplication (const Standard_Real rr);
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "	:param rr:
	:type rr: float
	:rtype: IntPolyh_Point
") operator *;
		IntPolyh_Point operator * (const Standard_Real rr);
		%feature("compactdefaultargs") SquareModulus;
		%feature("autodoc", "	:rtype: float
") SquareModulus;
		Standard_Real SquareModulus ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	:param P2:
	:type P2: IntPolyh_Point &
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const IntPolyh_Point & P2);
		%feature("compactdefaultargs") Dot;
		%feature("autodoc", "	:param P2:
	:type P2: IntPolyh_Point &
	:rtype: float
") Dot;
		Standard_Real Dot (const IntPolyh_Point & P2);
		%feature("compactdefaultargs") Cross;
		%feature("autodoc", "	:param P1:
	:type P1: IntPolyh_Point &
	:param P2:
	:type P2: IntPolyh_Point &
	:rtype: None
") Cross;
		void Cross (const IntPolyh_Point & P1,const IntPolyh_Point & P2);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:rtype: None
") Dump;
		void Dump ();
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:param i:
	:type i: int
	:rtype: None
") Dump;
		void Dump (const Standard_Integer i);
		%feature("compactdefaultargs") SetDegenerated;
		%feature("autodoc", "	:param theFlag:
	:type theFlag: bool
	:rtype: None
") SetDegenerated;
		void SetDegenerated (const Standard_Boolean theFlag);
		%feature("compactdefaultargs") Degenerated;
		%feature("autodoc", "	:rtype: bool
") Degenerated;
		Standard_Boolean Degenerated ();
};


%extend IntPolyh_Point {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntPolyh_SectionLine;
class IntPolyh_SectionLine {
	public:
		%feature("compactdefaultargs") IntPolyh_SectionLine;
		%feature("autodoc", "	:rtype: None
") IntPolyh_SectionLine;
		 IntPolyh_SectionLine ();
		%feature("compactdefaultargs") IntPolyh_SectionLine;
		%feature("autodoc", "	:param nn:
	:type nn: int
	:rtype: None
") IntPolyh_SectionLine;
		 IntPolyh_SectionLine (const Standard_Integer nn);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param nn:
	:type nn: int
	:rtype: None
") Init;
		void Init (const Standard_Integer nn);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param nn:
	:type nn: int
	:rtype: IntPolyh_StartPoint
") Value;
		const IntPolyh_StartPoint & Value (const Standard_Integer nn);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param nn:
	:type nn: int
	:rtype: IntPolyh_StartPoint
") ChangeValue;
		IntPolyh_StartPoint & ChangeValue (const Standard_Integer nn);
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	:param Other:
	:type Other: IntPolyh_SectionLine &
	:rtype: IntPolyh_SectionLine
") Copy;
		IntPolyh_SectionLine & Copy (const IntPolyh_SectionLine & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: IntPolyh_SectionLine &
	:rtype: IntPolyh_SectionLine
") operator =;
		IntPolyh_SectionLine & operator = (const IntPolyh_SectionLine & Other);
		%feature("compactdefaultargs") GetN;
		%feature("autodoc", "	:rtype: int
") GetN;
		Standard_Integer GetN ();
		%feature("compactdefaultargs") NbStartPoints;
		%feature("autodoc", "	:rtype: int
") NbStartPoints;
		Standard_Integer NbStartPoints ();
		%feature("compactdefaultargs") IncrementNbStartPoints;
		%feature("autodoc", "	:rtype: None
") IncrementNbStartPoints;
		void IncrementNbStartPoints ();
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:rtype: None
") Dump;
		void Dump ();
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param SP:
	:type SP: IntPolyh_StartPoint &
	:rtype: None
") Prepend;
		void Prepend (const IntPolyh_StartPoint & SP);
};


%extend IntPolyh_SectionLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntPolyh_SeqOfStartPoints;
class IntPolyh_SeqOfStartPoints : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") IntPolyh_SeqOfStartPoints;
		%feature("autodoc", "	:rtype: None
") IntPolyh_SeqOfStartPoints;
		 IntPolyh_SeqOfStartPoints ();
		%feature("compactdefaultargs") IntPolyh_SeqOfStartPoints;
		%feature("autodoc", "	:param Other:
	:type Other: IntPolyh_SeqOfStartPoints &
	:rtype: None
") IntPolyh_SeqOfStartPoints;
		 IntPolyh_SeqOfStartPoints (const IntPolyh_SeqOfStartPoints & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: IntPolyh_SeqOfStartPoints &
	:rtype: IntPolyh_SeqOfStartPoints
") Assign;
		const IntPolyh_SeqOfStartPoints & Assign (const IntPolyh_SeqOfStartPoints & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: IntPolyh_SeqOfStartPoints &
	:rtype: IntPolyh_SeqOfStartPoints
") operator =;
		const IntPolyh_SeqOfStartPoints & operator = (const IntPolyh_SeqOfStartPoints & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: IntPolyh_StartPoint &
	:rtype: None
") Append;
		void Append (const IntPolyh_StartPoint & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: IntPolyh_SeqOfStartPoints &
	:rtype: None
") Append;
		void Append (IntPolyh_SeqOfStartPoints & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: IntPolyh_StartPoint &
	:rtype: None
") Prepend;
		void Prepend (const IntPolyh_StartPoint & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: IntPolyh_SeqOfStartPoints &
	:rtype: None
") Prepend;
		void Prepend (IntPolyh_SeqOfStartPoints & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: IntPolyh_StartPoint &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const IntPolyh_StartPoint & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: IntPolyh_SeqOfStartPoints &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,IntPolyh_SeqOfStartPoints & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: IntPolyh_StartPoint &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const IntPolyh_StartPoint & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: IntPolyh_SeqOfStartPoints &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,IntPolyh_SeqOfStartPoints & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: IntPolyh_StartPoint
") First;
		const IntPolyh_StartPoint & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: IntPolyh_StartPoint
") Last;
		const IntPolyh_StartPoint & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: IntPolyh_SeqOfStartPoints &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,IntPolyh_SeqOfStartPoints & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: IntPolyh_StartPoint
") Value;
		const IntPolyh_StartPoint & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: IntPolyh_StartPoint &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const IntPolyh_StartPoint & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: IntPolyh_StartPoint
") ChangeValue;
		IntPolyh_StartPoint & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend IntPolyh_SeqOfStartPoints {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntPolyh_SequenceNodeOfSeqOfStartPoints;
class IntPolyh_SequenceNodeOfSeqOfStartPoints : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") IntPolyh_SequenceNodeOfSeqOfStartPoints;
		%feature("autodoc", "	:param I:
	:type I: IntPolyh_StartPoint &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") IntPolyh_SequenceNodeOfSeqOfStartPoints;
		 IntPolyh_SequenceNodeOfSeqOfStartPoints (const IntPolyh_StartPoint & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: IntPolyh_StartPoint
") Value;
		IntPolyh_StartPoint & Value ();
};


%extend IntPolyh_SequenceNodeOfSeqOfStartPoints {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IntPolyh_SequenceNodeOfSeqOfStartPoints(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IntPolyh_SequenceNodeOfSeqOfStartPoints::Handle_IntPolyh_SequenceNodeOfSeqOfStartPoints %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IntPolyh_SequenceNodeOfSeqOfStartPoints;
class Handle_IntPolyh_SequenceNodeOfSeqOfStartPoints : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_IntPolyh_SequenceNodeOfSeqOfStartPoints();
        Handle_IntPolyh_SequenceNodeOfSeqOfStartPoints(const Handle_IntPolyh_SequenceNodeOfSeqOfStartPoints &aHandle);
        Handle_IntPolyh_SequenceNodeOfSeqOfStartPoints(const IntPolyh_SequenceNodeOfSeqOfStartPoints *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntPolyh_SequenceNodeOfSeqOfStartPoints DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntPolyh_SequenceNodeOfSeqOfStartPoints {
    IntPolyh_SequenceNodeOfSeqOfStartPoints* _get_reference() {
    return (IntPolyh_SequenceNodeOfSeqOfStartPoints*)$self->Access();
    }
};

%extend Handle_IntPolyh_SequenceNodeOfSeqOfStartPoints {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IntPolyh_SequenceNodeOfSeqOfStartPoints {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntPolyh_StartPoint;
class IntPolyh_StartPoint {
	public:
		%feature("compactdefaultargs") IntPolyh_StartPoint;
		%feature("autodoc", "	:rtype: None
") IntPolyh_StartPoint;
		 IntPolyh_StartPoint ();
		%feature("compactdefaultargs") IntPolyh_StartPoint;
		%feature("autodoc", "	:param xx:
	:type xx: float
	:param yy:
	:type yy: float
	:param zz:
	:type zz: float
	:param uu1:
	:type uu1: float
	:param vv1:
	:type vv1: float
	:param uu2:
	:type uu2: float
	:param vv2:
	:type vv2: float
	:param T1:
	:type T1: int
	:param E1:
	:type E1: int
	:param LAM1:
	:type LAM1: float
	:param T2:
	:type T2: int
	:param E2:
	:type E2: int
	:param LAM2:
	:type LAM2: float
	:param List:
	:type List: int
	:rtype: None
") IntPolyh_StartPoint;
		 IntPolyh_StartPoint (const Standard_Real xx,const Standard_Real yy,const Standard_Real zz,const Standard_Real uu1,const Standard_Real vv1,const Standard_Real uu2,const Standard_Real vv2,const Standard_Integer T1,const Standard_Integer E1,const Standard_Real LAM1,const Standard_Integer T2,const Standard_Integer E2,const Standard_Real LAM2,const Standard_Integer List);
		%feature("compactdefaultargs") X;
		%feature("autodoc", "	:rtype: float
") X;
		Standard_Real X ();
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "	:rtype: float
") Y;
		Standard_Real Y ();
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "	:rtype: float
") Z;
		Standard_Real Z ();
		%feature("compactdefaultargs") U1;
		%feature("autodoc", "	:rtype: float
") U1;
		Standard_Real U1 ();
		%feature("compactdefaultargs") V1;
		%feature("autodoc", "	:rtype: float
") V1;
		Standard_Real V1 ();
		%feature("compactdefaultargs") U2;
		%feature("autodoc", "	:rtype: float
") U2;
		Standard_Real U2 ();
		%feature("compactdefaultargs") V2;
		%feature("autodoc", "	:rtype: float
") V2;
		Standard_Real V2 ();
		%feature("compactdefaultargs") T1;
		%feature("autodoc", "	:rtype: int
") T1;
		Standard_Integer T1 ();
		%feature("compactdefaultargs") E1;
		%feature("autodoc", "	:rtype: int
") E1;
		Standard_Integer E1 ();
		%feature("compactdefaultargs") Lambda1;
		%feature("autodoc", "	:rtype: float
") Lambda1;
		Standard_Real Lambda1 ();
		%feature("compactdefaultargs") T2;
		%feature("autodoc", "	:rtype: int
") T2;
		Standard_Integer T2 ();
		%feature("compactdefaultargs") E2;
		%feature("autodoc", "	:rtype: int
") E2;
		Standard_Integer E2 ();
		%feature("compactdefaultargs") Lambda2;
		%feature("autodoc", "	:rtype: float
") Lambda2;
		Standard_Real Lambda2 ();
		%feature("compactdefaultargs") GetAngle;
		%feature("autodoc", "	:rtype: float
") GetAngle;
		Standard_Real GetAngle ();
		%feature("compactdefaultargs") ChainList;
		%feature("autodoc", "	:rtype: int
") ChainList;
		Standard_Integer ChainList ();
		%feature("compactdefaultargs") GetEdgePoints;
		%feature("autodoc", "	:param Triangle:
	:type Triangle: IntPolyh_Triangle &
	:param FirstEdgePoint:
	:type FirstEdgePoint: int &
	:param SecondEdgePoint:
	:type SecondEdgePoint: int &
	:param LastPoint:
	:type LastPoint: int &
	:rtype: int
") GetEdgePoints;
		Standard_Integer GetEdgePoints (const IntPolyh_Triangle & Triangle,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") Equal;
		%feature("autodoc", "	:param StPt:
	:type StPt: IntPolyh_StartPoint &
	:rtype: None
") Equal;
		void Equal (const IntPolyh_StartPoint & StPt);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param StPt:
	:type StPt: IntPolyh_StartPoint &
	:rtype: None
") operator =;
		void operator = (const IntPolyh_StartPoint & StPt);
		%feature("compactdefaultargs") SetXYZ;
		%feature("autodoc", "	:param XX:
	:type XX: float
	:param YY:
	:type YY: float
	:param ZZ:
	:type ZZ: float
	:rtype: None
") SetXYZ;
		void SetXYZ (const Standard_Real XX,const Standard_Real YY,const Standard_Real ZZ);
		%feature("compactdefaultargs") SetUV1;
		%feature("autodoc", "	:param UU1:
	:type UU1: float
	:param VV1:
	:type VV1: float
	:rtype: None
") SetUV1;
		void SetUV1 (const Standard_Real UU1,const Standard_Real VV1);
		%feature("compactdefaultargs") SetUV2;
		%feature("autodoc", "	:param UU2:
	:type UU2: float
	:param VV2:
	:type VV2: float
	:rtype: None
") SetUV2;
		void SetUV2 (const Standard_Real UU2,const Standard_Real VV2);
		%feature("compactdefaultargs") SetEdge1;
		%feature("autodoc", "	:param IE1:
	:type IE1: int
	:rtype: None
") SetEdge1;
		void SetEdge1 (const Standard_Integer IE1);
		%feature("compactdefaultargs") SetLambda1;
		%feature("autodoc", "	:param LAM1:
	:type LAM1: float
	:rtype: None
") SetLambda1;
		void SetLambda1 (const Standard_Real LAM1);
		%feature("compactdefaultargs") SetEdge2;
		%feature("autodoc", "	:param IE2:
	:type IE2: int
	:rtype: None
") SetEdge2;
		void SetEdge2 (const Standard_Integer IE2);
		%feature("compactdefaultargs") SetLambda2;
		%feature("autodoc", "	:param LAM2:
	:type LAM2: float
	:rtype: None
") SetLambda2;
		void SetLambda2 (const Standard_Real LAM2);
		%feature("compactdefaultargs") SetCoupleValue;
		%feature("autodoc", "	:param IT1:
	:type IT1: int
	:param IT2:
	:type IT2: int
	:rtype: None
") SetCoupleValue;
		void SetCoupleValue (const Standard_Integer IT1,const Standard_Integer IT2);
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "	:param ang:
	:type ang: float
	:rtype: None
") SetAngle;
		void SetAngle (const Standard_Real ang);
		%feature("compactdefaultargs") SetChainList;
		%feature("autodoc", "	:param ChList:
	:type ChList: int
	:rtype: None
") SetChainList;
		void SetChainList (const Standard_Integer ChList);
		%feature("compactdefaultargs") CheckSameSP;
		%feature("autodoc", "	:param SP:
	:type SP: IntPolyh_StartPoint &
	:rtype: int
") CheckSameSP;
		Standard_Integer CheckSameSP (const IntPolyh_StartPoint & SP);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:rtype: None
") Dump;
		void Dump ();
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:param i:
	:type i: int
	:rtype: None
") Dump;
		void Dump (const Standard_Integer i);
};


%extend IntPolyh_StartPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntPolyh_Triangle;
class IntPolyh_Triangle {
	public:
		%feature("compactdefaultargs") IntPolyh_Triangle;
		%feature("autodoc", "	:rtype: None
") IntPolyh_Triangle;
		 IntPolyh_Triangle ();
		%feature("compactdefaultargs") IntPolyh_Triangle;
		%feature("autodoc", "	:param i1:
	:type i1: int
	:param i2:
	:type i2: int
	:param i3:
	:type i3: int
	:rtype: None
") IntPolyh_Triangle;
		 IntPolyh_Triangle (const Standard_Integer i1,const Standard_Integer i2,const Standard_Integer i3);
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "	:rtype: int
") FirstPoint;
		Standard_Integer FirstPoint ();
		%feature("compactdefaultargs") SecondPoint;
		%feature("autodoc", "	:rtype: int
") SecondPoint;
		Standard_Integer SecondPoint ();
		%feature("compactdefaultargs") ThirdPoint;
		%feature("autodoc", "	:rtype: int
") ThirdPoint;
		Standard_Integer ThirdPoint ();
		%feature("compactdefaultargs") FirstEdge;
		%feature("autodoc", "	:rtype: int
") FirstEdge;
		Standard_Integer FirstEdge ();
		%feature("compactdefaultargs") FirstEdgeOrientation;
		%feature("autodoc", "	:rtype: int
") FirstEdgeOrientation;
		Standard_Integer FirstEdgeOrientation ();
		%feature("compactdefaultargs") SecondEdge;
		%feature("autodoc", "	:rtype: int
") SecondEdge;
		Standard_Integer SecondEdge ();
		%feature("compactdefaultargs") SecondEdgeOrientation;
		%feature("autodoc", "	:rtype: int
") SecondEdgeOrientation;
		Standard_Integer SecondEdgeOrientation ();
		%feature("compactdefaultargs") ThirdEdge;
		%feature("autodoc", "	:rtype: int
") ThirdEdge;
		Standard_Integer ThirdEdge ();
		%feature("compactdefaultargs") ThirdEdgeOrientation;
		%feature("autodoc", "	:rtype: int
") ThirdEdgeOrientation;
		Standard_Integer ThirdEdgeOrientation ();
		%feature("compactdefaultargs") GetFleche;
		%feature("autodoc", "	:rtype: float
") GetFleche;
		Standard_Real GetFleche ();
		%feature("compactdefaultargs") IndiceIntersectionPossible;
		%feature("autodoc", "	:rtype: int
") IndiceIntersectionPossible;
		Standard_Integer IndiceIntersectionPossible ();
		%feature("compactdefaultargs") IndiceIntersection;
		%feature("autodoc", "	:rtype: int
") IndiceIntersection;
		Standard_Integer IndiceIntersection ();
		%feature("compactdefaultargs") SetFirstPoint;
		%feature("autodoc", "	:param v:
	:type v: int
	:rtype: None
") SetFirstPoint;
		void SetFirstPoint (const Standard_Integer v);
		%feature("compactdefaultargs") SetSecondPoint;
		%feature("autodoc", "	:param v:
	:type v: int
	:rtype: None
") SetSecondPoint;
		void SetSecondPoint (const Standard_Integer v);
		%feature("compactdefaultargs") SetThirdPoint;
		%feature("autodoc", "	:param v:
	:type v: int
	:rtype: None
") SetThirdPoint;
		void SetThirdPoint (const Standard_Integer v);
		%feature("compactdefaultargs") SetFirstEdge;
		%feature("autodoc", "	:param v:
	:type v: int
	:param s:
	:type s: int
	:rtype: None
") SetFirstEdge;
		void SetFirstEdge (const Standard_Integer v,const Standard_Integer s);
		%feature("compactdefaultargs") SetSecondEdge;
		%feature("autodoc", "	:param v:
	:type v: int
	:param s:
	:type s: int
	:rtype: None
") SetSecondEdge;
		void SetSecondEdge (const Standard_Integer v,const Standard_Integer s);
		%feature("compactdefaultargs") SetThirdEdge;
		%feature("autodoc", "	:param v:
	:type v: int
	:param s:
	:type s: int
	:rtype: None
") SetThirdEdge;
		void SetThirdEdge (const Standard_Integer v,const Standard_Integer s);
		%feature("compactdefaultargs") SetFleche;
		%feature("autodoc", "	:param v:
	:type v: float
	:rtype: None
") SetFleche;
		void SetFleche (const Standard_Real v);
		%feature("compactdefaultargs") SetIndiceIntersectionPossible;
		%feature("autodoc", "	:param v:
	:type v: int
	:rtype: None
") SetIndiceIntersectionPossible;
		void SetIndiceIntersectionPossible (const Standard_Integer v);
		%feature("compactdefaultargs") SetIndiceIntersection;
		%feature("autodoc", "	:param v:
	:type v: int
	:rtype: None
") SetIndiceIntersection;
		void SetIndiceIntersection (const Standard_Integer v);
		%feature("compactdefaultargs") GetEdgeNumber;
		%feature("autodoc", "	:param v:
	:type v: int
	:rtype: int
") GetEdgeNumber;
		Standard_Integer GetEdgeNumber (const Standard_Integer v);
		%feature("compactdefaultargs") SetEdge;
		%feature("autodoc", "	:param v:
	:type v: int
	:param en:
	:type en: int
	:rtype: None
") SetEdge;
		void SetEdge (const Standard_Integer v,const Standard_Integer en);
		%feature("compactdefaultargs") GetEdgeOrientation;
		%feature("autodoc", "	:param v:
	:type v: int
	:rtype: int
") GetEdgeOrientation;
		Standard_Integer GetEdgeOrientation (const Standard_Integer v);
		%feature("compactdefaultargs") SetEdgeOrientation;
		%feature("autodoc", "	:param v:
	:type v: int
	:param oe:
	:type oe: int
	:rtype: None
") SetEdgeOrientation;
		void SetEdgeOrientation (const Standard_Integer v,const Standard_Integer oe);
		%feature("compactdefaultargs") TriangleDeflection;
		%feature("autodoc", "	:param MaSurface:
	:type MaSurface: Handle_Adaptor3d_HSurface &
	:param TP:
	:type TP: IntPolyh_ArrayOfPoints &
	:rtype: None
") TriangleDeflection;
		void TriangleDeflection (const Handle_Adaptor3d_HSurface & MaSurface,const IntPolyh_ArrayOfPoints & TP);
		%feature("compactdefaultargs") CheckCommonEdge;
		%feature("autodoc", "	:param PE1:
	:type PE1: int
	:param PE2:
	:type PE2: int
	:param P3:
	:type P3: int
	:param Index:
	:type Index: int
	:param TTriangles:
	:type TTriangles: IntPolyh_ArrayOfTriangles &
	:rtype: int
") CheckCommonEdge;
		Standard_Integer CheckCommonEdge (const Standard_Integer PE1,const Standard_Integer PE2,const Standard_Integer P3,const Standard_Integer Index,const IntPolyh_ArrayOfTriangles & TTriangles);
		%feature("compactdefaultargs") GetNextTriangle2;
		%feature("autodoc", "	:param NumTri:
	:type NumTri: int
	:param NumEdge:
	:type NumEdge: int
	:param TEdges:
	:type TEdges: IntPolyh_ArrayOfEdges &
	:rtype: int
") GetNextTriangle2;
		Standard_Integer GetNextTriangle2 (const Standard_Integer NumTri,const Standard_Integer NumEdge,const IntPolyh_ArrayOfEdges & TEdges);
		%feature("compactdefaultargs") MiddleRefinement;
		%feature("autodoc", "	:param TriangleNumber:
	:type TriangleNumber: int
	:param MySurface:
	:type MySurface: Handle_Adaptor3d_HSurface &
	:param TPoints:
	:type TPoints: IntPolyh_ArrayOfPoints &
	:param TTriangles:
	:type TTriangles: IntPolyh_ArrayOfTriangles &
	:param TEdges:
	:type TEdges: IntPolyh_ArrayOfEdges &
	:rtype: None
") MiddleRefinement;
		void MiddleRefinement (const Standard_Integer TriangleNumber,const Handle_Adaptor3d_HSurface & MySurface,IntPolyh_ArrayOfPoints & TPoints,IntPolyh_ArrayOfTriangles & TTriangles,IntPolyh_ArrayOfEdges & TEdges);
		%feature("compactdefaultargs") MultipleMiddleRefinement;
		%feature("autodoc", "	:param NombreAffinages:
	:type NombreAffinages: int
	:param TriangleNumber:
	:type TriangleNumber: int
	:param MySurface:
	:type MySurface: Handle_Adaptor3d_HSurface &
	:param TPoints:
	:type TPoints: IntPolyh_ArrayOfPoints &
	:param TTriangles:
	:type TTriangles: IntPolyh_ArrayOfTriangles &
	:param TEdges:
	:type TEdges: IntPolyh_ArrayOfEdges &
	:rtype: None
") MultipleMiddleRefinement;
		void MultipleMiddleRefinement (const Standard_Integer NombreAffinages,const Standard_Integer TriangleNumber,const Handle_Adaptor3d_HSurface & MySurface,IntPolyh_ArrayOfPoints & TPoints,IntPolyh_ArrayOfTriangles & TTriangles,IntPolyh_ArrayOfEdges & TEdges);
		%feature("compactdefaultargs") CompareBoxTriangle;
		%feature("autodoc", "	:param b:
	:type b: Bnd_Box &
	:param TPoints:
	:type TPoints: IntPolyh_ArrayOfPoints &
	:rtype: int
") CompareBoxTriangle;
		Standard_Integer CompareBoxTriangle (const Bnd_Box & b,const IntPolyh_ArrayOfPoints & TPoints);
		%feature("compactdefaultargs") MultipleMiddleRefinement2;
		%feature("autodoc", "	:param RefineCriterion:
	:type RefineCriterion: float
	:param thebox:
	:type thebox: Bnd_Box &
	:param TriangleNumber:
	:type TriangleNumber: int
	:param MySurface:
	:type MySurface: Handle_Adaptor3d_HSurface &
	:param TPoints:
	:type TPoints: IntPolyh_ArrayOfPoints &
	:param TTriangles:
	:type TTriangles: IntPolyh_ArrayOfTriangles &
	:param TEdges:
	:type TEdges: IntPolyh_ArrayOfEdges &
	:rtype: None
") MultipleMiddleRefinement2;
		void MultipleMiddleRefinement2 (const Standard_Real RefineCriterion,const Bnd_Box & thebox,const Standard_Integer TriangleNumber,const Handle_Adaptor3d_HSurface & MySurface,IntPolyh_ArrayOfPoints & TPoints,IntPolyh_ArrayOfTriangles & TTriangles,IntPolyh_ArrayOfEdges & TEdges);
		%feature("compactdefaultargs") LinkEdges2Triangle;
		%feature("autodoc", "	:param TEdges:
	:type TEdges: IntPolyh_ArrayOfEdges &
	:param ed1:
	:type ed1: int
	:param ed2:
	:type ed2: int
	:param ed3:
	:type ed3: int
	:rtype: None
") LinkEdges2Triangle;
		void LinkEdges2Triangle (const IntPolyh_ArrayOfEdges & TEdges,const Standard_Integer ed1,const Standard_Integer ed2,const Standard_Integer ed3);
		%feature("compactdefaultargs") SetEdgeandOrientation;
		%feature("autodoc", "	:param Edge:
	:type Edge: int
	:param TEdges:
	:type TEdges: IntPolyh_ArrayOfEdges &
	:rtype: None
") SetEdgeandOrientation;
		void SetEdgeandOrientation (const Standard_Integer Edge,const IntPolyh_ArrayOfEdges & TEdges);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:param v:
	:type v: int
	:rtype: None
") Dump;
		void Dump (const Standard_Integer v);
		%feature("compactdefaultargs") DumpFleche;
		%feature("autodoc", "	:param v:
	:type v: int
	:rtype: None
") DumpFleche;
		void DumpFleche (const Standard_Integer v);
};


%extend IntPolyh_Triangle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
