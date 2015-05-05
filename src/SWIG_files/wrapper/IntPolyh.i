/*
Copyright 2008-2014 Thomas Paviot (tpaviot@gmail.com)


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
		%feature("autodoc", "	:rtype: None
") IntPolyh_Couple;
		 IntPolyh_Couple ();
		%feature("autodoc", "	:param i1:
	:type i1: Standard_Integer
	:param i2:
	:type i2: Standard_Integer
	:rtype: None
") IntPolyh_Couple;
		 IntPolyh_Couple (const Standard_Integer i1,const Standard_Integer i2);
		%feature("autodoc", "	:rtype: int
") FirstValue;
		Standard_Integer FirstValue ();
		%feature("autodoc", "	:rtype: int
") SecondValue;
		Standard_Integer SecondValue ();
		%feature("autodoc", "	:rtype: int
") AnalyseFlagValue;
		Standard_Integer AnalyseFlagValue ();
		%feature("autodoc", "	:rtype: float
") AngleValue;
		Standard_Real AngleValue ();
		%feature("autodoc", "	:param v:
	:type v: Standard_Integer
	:param w:
	:type w: Standard_Integer
	:rtype: None
") SetCoupleValue;
		void SetCoupleValue (const Standard_Integer v,const Standard_Integer w);
		%feature("autodoc", "	:param v:
	:type v: Standard_Integer
	:rtype: None
") SetAnalyseFlag;
		void SetAnalyseFlag (const Standard_Integer v);
		%feature("autodoc", "	:param ang:
	:type ang: float
	:rtype: None
") SetAngleValue;
		void SetAngleValue (const Standard_Real ang);
		%feature("autodoc", "	:param v:
	:type v: Standard_Integer
	:rtype: None
") Dump;
		void Dump (const Standard_Integer v);
};


%feature("shadow") IntPolyh_Couple::~IntPolyh_Couple %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntPolyh_Couple {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntPolyh_Edge;
class IntPolyh_Edge {
	public:
		%feature("autodoc", "	:rtype: None
") IntPolyh_Edge;
		 IntPolyh_Edge ();
		%feature("autodoc", "	:param i1:
	:type i1: Standard_Integer
	:param i2:
	:type i2: Standard_Integer
	:param i3:
	:type i3: Standard_Integer
	:param i4:
	:type i4: Standard_Integer
	:rtype: None
") IntPolyh_Edge;
		 IntPolyh_Edge (const Standard_Integer i1,const Standard_Integer i2,const Standard_Integer i3,const Standard_Integer i4);
		%feature("autodoc", "	:rtype: int
") FirstPoint;
		Standard_Integer FirstPoint ();
		%feature("autodoc", "	:rtype: int
") SecondPoint;
		Standard_Integer SecondPoint ();
		%feature("autodoc", "	:rtype: int
") FirstTriangle;
		Standard_Integer FirstTriangle ();
		%feature("autodoc", "	:rtype: int
") SecondTriangle;
		Standard_Integer SecondTriangle ();
		%feature("autodoc", "	:rtype: int
") AnalysisFlag;
		Standard_Integer AnalysisFlag ();
		%feature("autodoc", "	:param v:
	:type v: Standard_Integer
	:rtype: None
") SetFirstPoint;
		void SetFirstPoint (const Standard_Integer v);
		%feature("autodoc", "	:param v:
	:type v: Standard_Integer
	:rtype: None
") SetSecondPoint;
		void SetSecondPoint (const Standard_Integer v);
		%feature("autodoc", "	:param v:
	:type v: Standard_Integer
	:rtype: None
") SetFirstTriangle;
		void SetFirstTriangle (const Standard_Integer v);
		%feature("autodoc", "	:param v:
	:type v: Standard_Integer
	:rtype: None
") SetSecondTriangle;
		void SetSecondTriangle (const Standard_Integer v);
		%feature("autodoc", "	:param v:
	:type v: Standard_Integer
	:rtype: None
") SetAnalysisFlag;
		void SetAnalysisFlag (const Standard_Integer v);
		%feature("autodoc", "	:param v:
	:type v: Standard_Integer
	:rtype: None
") Dump;
		void Dump (const Standard_Integer v);
};


%feature("shadow") IntPolyh_Edge::~IntPolyh_Edge %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntPolyh_Edge {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntPolyh_Intersection;
class IntPolyh_Intersection {
	public:
		%feature("autodoc", "	* Constructor

	:param S1:
	:type S1: Handle_Adaptor3d_HSurface &
	:param S2:
	:type S2: Handle_Adaptor3d_HSurface &
	:rtype: None
") IntPolyh_Intersection;
		 IntPolyh_Intersection (const Handle_Adaptor3d_HSurface & S1,const Handle_Adaptor3d_HSurface & S2);
		%feature("autodoc", "	* NbSU1 ... NbSV2 are used to compute the initial samples of the iso parametric meshes on the surfaces.

	:param S1:
	:type S1: Handle_Adaptor3d_HSurface &
	:param NbSU1:
	:type NbSU1: Standard_Integer
	:param NbSV1:
	:type NbSV1: Standard_Integer
	:param S2:
	:type S2: Handle_Adaptor3d_HSurface &
	:param NbSU2:
	:type NbSU2: Standard_Integer
	:param NbSV2:
	:type NbSV2: Standard_Integer
	:rtype: None
") IntPolyh_Intersection;
		 IntPolyh_Intersection (const Handle_Adaptor3d_HSurface & S1,const Standard_Integer NbSU1,const Standard_Integer NbSV1,const Handle_Adaptor3d_HSurface & S2,const Standard_Integer NbSU2,const Standard_Integer NbSV2);
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
		%feature("autodoc", "	* Compute the intersection.

	:rtype: None
") Perform;
		void Perform ();
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
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: int
") NbSectionLines;
		Standard_Integer NbSectionLines ();
		%feature("autodoc", "	:param IndexLine:
	:type IndexLine: Standard_Integer
	:rtype: int
") NbPointsInLine;
		Standard_Integer NbPointsInLine (const Standard_Integer IndexLine);
		%feature("autodoc", "	:param IndexLine:
	:type IndexLine: Standard_Integer
	:param IndexPoint:
	:type IndexPoint: Standard_Integer
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
		%feature("autodoc", "	:rtype: int
") NbTangentZones;
		Standard_Integer NbTangentZones ();
		%feature("autodoc", "	:param IndexLine:
	:type IndexLine: Standard_Integer
	:rtype: int
") NbPointsInTangentZone;
		Standard_Integer NbPointsInTangentZone (const Standard_Integer IndexLine);
		%feature("autodoc", "	:param IndexLine:
	:type IndexLine: Standard_Integer
	:param IndexPoint:
	:type IndexPoint: Standard_Integer
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


%feature("shadow") IntPolyh_Intersection::~IntPolyh_Intersection %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntPolyh_Intersection {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntPolyh_Point;
class IntPolyh_Point {
	public:
		%feature("autodoc", "	:rtype: None
") IntPolyh_Point;
		 IntPolyh_Point ();
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
		%feature("autodoc", "	:rtype: float
") X;
		Standard_Real X ();
		%feature("autodoc", "	:rtype: float
") Y;
		Standard_Real Y ();
		%feature("autodoc", "	:rtype: float
") Z;
		Standard_Real Z ();
		%feature("autodoc", "	:rtype: float
") U;
		Standard_Real U ();
		%feature("autodoc", "	:rtype: float
") V;
		Standard_Real V ();
		%feature("autodoc", "	:rtype: int
") PartOfCommon;
		Standard_Integer PartOfCommon ();
		%feature("autodoc", "	:param Pt:
	:type Pt: IntPolyh_Point &
	:rtype: None
") Equal;
		void Equal (const IntPolyh_Point & Pt);
		%feature("autodoc", "	:param Pt:
	:type Pt: IntPolyh_Point &
	:rtype: None
") operator=;
		void operator = (const IntPolyh_Point & Pt);
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
	:type II: Standard_Integer
	:rtype: None
") Set;
		void Set (const Standard_Real v1,const Standard_Real v2,const Standard_Real v3,const Standard_Real v4,const Standard_Real v5,const Standard_Integer II = 1);
		%feature("autodoc", "	:param v:
	:type v: float
	:rtype: None
") SetX;
		void SetX (const Standard_Real v);
		%feature("autodoc", "	:param v:
	:type v: float
	:rtype: None
") SetY;
		void SetY (const Standard_Real v);
		%feature("autodoc", "	:param v:
	:type v: float
	:rtype: None
") SetZ;
		void SetZ (const Standard_Real v);
		%feature("autodoc", "	:param v:
	:type v: float
	:rtype: None
") SetU;
		void SetU (const Standard_Real v);
		%feature("autodoc", "	:param v:
	:type v: float
	:rtype: None
") SetV;
		void SetV (const Standard_Real v);
		%feature("autodoc", "	:param ii:
	:type ii: Standard_Integer
	:rtype: None
") SetPartOfCommon;
		void SetPartOfCommon (const Standard_Integer ii);
		%feature("autodoc", "	:param MySurface:
	:type MySurface: Handle_Adaptor3d_HSurface &
	:param P1:
	:type P1: IntPolyh_Point &
	:param P2:
	:type P2: IntPolyh_Point &
	:rtype: None
") Middle;
		void Middle (const Handle_Adaptor3d_HSurface & MySurface,const IntPolyh_Point & P1,const IntPolyh_Point & P2);
		%feature("autodoc", "	:param P1:
	:type P1: IntPolyh_Point &
	:rtype: IntPolyh_Point
") Add;
		IntPolyh_Point Add (const IntPolyh_Point & P1);
		%feature("autodoc", "	:param P1:
	:type P1: IntPolyh_Point &
	:rtype: IntPolyh_Point
") operator+;
		IntPolyh_Point operator + (const IntPolyh_Point & P1);
		%feature("autodoc", "	:param P1:
	:type P1: IntPolyh_Point &
	:rtype: IntPolyh_Point
") Sub;
		IntPolyh_Point Sub (const IntPolyh_Point & P1);
		%feature("autodoc", "	:param P1:
	:type P1: IntPolyh_Point &
	:rtype: IntPolyh_Point
") operator-;
		IntPolyh_Point operator - (const IntPolyh_Point & P1);
		%feature("autodoc", "	:param rr:
	:type rr: float
	:rtype: IntPolyh_Point
") Divide;
		IntPolyh_Point Divide (const Standard_Real rr);
		%feature("autodoc", "	:param rr:
	:type rr: float
	:rtype: IntPolyh_Point
") operator/;
		IntPolyh_Point operator / (const Standard_Real rr);
		%feature("autodoc", "	:param rr:
	:type rr: float
	:rtype: IntPolyh_Point
") Multiplication;
		IntPolyh_Point Multiplication (const Standard_Real rr);
		%feature("autodoc", "	:param rr:
	:type rr: float
	:rtype: IntPolyh_Point
") operator*;
		IntPolyh_Point operator * (const Standard_Real rr);
		%feature("autodoc", "	:rtype: float
") SquareModulus;
		Standard_Real SquareModulus ();
		%feature("autodoc", "	:param P2:
	:type P2: IntPolyh_Point &
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const IntPolyh_Point & P2);
		%feature("autodoc", "	:param P2:
	:type P2: IntPolyh_Point &
	:rtype: float
") Dot;
		Standard_Real Dot (const IntPolyh_Point & P2);
		%feature("autodoc", "	:param P1:
	:type P1: IntPolyh_Point &
	:param P2:
	:type P2: IntPolyh_Point &
	:rtype: None
") Cross;
		void Cross (const IntPolyh_Point & P1,const IntPolyh_Point & P2);
		%feature("autodoc", "	:rtype: None
") Dump;
		void Dump ();
		%feature("autodoc", "	:param i:
	:type i: Standard_Integer
	:rtype: None
") Dump;
		void Dump (const Standard_Integer i);
		%feature("autodoc", "	:param theFlag:
	:type theFlag: bool
	:rtype: None
") SetDegenerated;
		void SetDegenerated (const Standard_Boolean theFlag);
		%feature("autodoc", "	:rtype: bool
") Degenerated;
		Standard_Boolean Degenerated ();
};


%feature("shadow") IntPolyh_Point::~IntPolyh_Point %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntPolyh_Point {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntPolyh_SectionLine;
class IntPolyh_SectionLine {
	public:
		%feature("autodoc", "	:rtype: None
") IntPolyh_SectionLine;
		 IntPolyh_SectionLine ();
		%feature("autodoc", "	:param nn:
	:type nn: Standard_Integer
	:rtype: None
") IntPolyh_SectionLine;
		 IntPolyh_SectionLine (const Standard_Integer nn);
		%feature("autodoc", "	:param nn:
	:type nn: Standard_Integer
	:rtype: None
") Init;
		void Init (const Standard_Integer nn);
		%feature("autodoc", "	:param nn:
	:type nn: Standard_Integer
	:rtype: IntPolyh_StartPoint
") Value;
		const IntPolyh_StartPoint & Value (const Standard_Integer nn);
		%feature("autodoc", "	:param nn:
	:type nn: Standard_Integer
	:rtype: IntPolyh_StartPoint
") ChangeValue;
		IntPolyh_StartPoint & ChangeValue (const Standard_Integer nn);
		%feature("autodoc", "	:param Other:
	:type Other: IntPolyh_SectionLine &
	:rtype: IntPolyh_SectionLine
") Copy;
		IntPolyh_SectionLine & Copy (const IntPolyh_SectionLine & Other);
		%feature("autodoc", "	:param Other:
	:type Other: IntPolyh_SectionLine &
	:rtype: IntPolyh_SectionLine
") operator=;
		IntPolyh_SectionLine & operator = (const IntPolyh_SectionLine & Other);
		%feature("autodoc", "	:rtype: int
") GetN;
		Standard_Integer GetN ();
		%feature("autodoc", "	:rtype: int
") NbStartPoints;
		Standard_Integer NbStartPoints ();
		%feature("autodoc", "	:rtype: None
") IncrementNbStartPoints;
		void IncrementNbStartPoints ();
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:rtype: None
") Dump;
		void Dump ();
		%feature("autodoc", "	:param SP:
	:type SP: IntPolyh_StartPoint &
	:rtype: None
") Prepend;
		void Prepend (const IntPolyh_StartPoint & SP);
};


%feature("shadow") IntPolyh_SectionLine::~IntPolyh_SectionLine %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntPolyh_SectionLine {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntPolyh_SeqOfStartPoints;
class IntPolyh_SeqOfStartPoints : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") IntPolyh_SeqOfStartPoints;
		 IntPolyh_SeqOfStartPoints ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: IntPolyh_SeqOfStartPoints &
	:rtype: IntPolyh_SeqOfStartPoints
") Assign;
		const IntPolyh_SeqOfStartPoints & Assign (const IntPolyh_SeqOfStartPoints & Other);
		%feature("autodoc", "	:param Other:
	:type Other: IntPolyh_SeqOfStartPoints &
	:rtype: IntPolyh_SeqOfStartPoints
") operator=;
		const IntPolyh_SeqOfStartPoints & operator = (const IntPolyh_SeqOfStartPoints & Other);
		%feature("autodoc", "	:param T:
	:type T: IntPolyh_StartPoint &
	:rtype: None
") Append;
		void Append (const IntPolyh_StartPoint & T);
		%feature("autodoc", "	:param S:
	:type S: IntPolyh_SeqOfStartPoints &
	:rtype: None
") Append;
		void Append (IntPolyh_SeqOfStartPoints & S);
		%feature("autodoc", "	:param T:
	:type T: IntPolyh_StartPoint &
	:rtype: None
") Prepend;
		void Prepend (const IntPolyh_StartPoint & T);
		%feature("autodoc", "	:param S:
	:type S: IntPolyh_SeqOfStartPoints &
	:rtype: None
") Prepend;
		void Prepend (IntPolyh_SeqOfStartPoints & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: IntPolyh_StartPoint &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const IntPolyh_StartPoint & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: IntPolyh_SeqOfStartPoints &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,IntPolyh_SeqOfStartPoints & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: IntPolyh_StartPoint &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const IntPolyh_StartPoint & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: IntPolyh_SeqOfStartPoints &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,IntPolyh_SeqOfStartPoints & S);
		%feature("autodoc", "	:rtype: IntPolyh_StartPoint
") First;
		const IntPolyh_StartPoint & First ();
		%feature("autodoc", "	:rtype: IntPolyh_StartPoint
") Last;
		const IntPolyh_StartPoint & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: IntPolyh_SeqOfStartPoints &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,IntPolyh_SeqOfStartPoints & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: IntPolyh_StartPoint
") Value;
		const IntPolyh_StartPoint & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: IntPolyh_StartPoint &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const IntPolyh_StartPoint & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: IntPolyh_StartPoint
") ChangeValue;
		IntPolyh_StartPoint & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") IntPolyh_SeqOfStartPoints::~IntPolyh_SeqOfStartPoints %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntPolyh_SeqOfStartPoints {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntPolyh_SequenceNodeOfSeqOfStartPoints;
class IntPolyh_SequenceNodeOfSeqOfStartPoints : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: IntPolyh_StartPoint &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") IntPolyh_SequenceNodeOfSeqOfStartPoints;
		 IntPolyh_SequenceNodeOfSeqOfStartPoints (const IntPolyh_StartPoint & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: IntPolyh_StartPoint
") Value;
		IntPolyh_StartPoint & Value ();
};


%feature("shadow") IntPolyh_SequenceNodeOfSeqOfStartPoints::~IntPolyh_SequenceNodeOfSeqOfStartPoints %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntPolyh_SequenceNodeOfSeqOfStartPoints {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IntPolyh_SequenceNodeOfSeqOfStartPoints {
	Handle_IntPolyh_SequenceNodeOfSeqOfStartPoints GetHandle() {
	return *(Handle_IntPolyh_SequenceNodeOfSeqOfStartPoints*) &$self;
	}
};

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
    IntPolyh_SequenceNodeOfSeqOfStartPoints* GetObject() {
    return (IntPolyh_SequenceNodeOfSeqOfStartPoints*)$self->Access();
    }
};
%feature("shadow") Handle_IntPolyh_SequenceNodeOfSeqOfStartPoints::~Handle_IntPolyh_SequenceNodeOfSeqOfStartPoints %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IntPolyh_SequenceNodeOfSeqOfStartPoints {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IntPolyh_StartPoint;
class IntPolyh_StartPoint {
	public:
		%feature("autodoc", "	:rtype: None
") IntPolyh_StartPoint;
		 IntPolyh_StartPoint ();
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
	:type T1: Standard_Integer
	:param E1:
	:type E1: Standard_Integer
	:param LAM1:
	:type LAM1: float
	:param T2:
	:type T2: Standard_Integer
	:param E2:
	:type E2: Standard_Integer
	:param LAM2:
	:type LAM2: float
	:param List:
	:type List: Standard_Integer
	:rtype: None
") IntPolyh_StartPoint;
		 IntPolyh_StartPoint (const Standard_Real xx,const Standard_Real yy,const Standard_Real zz,const Standard_Real uu1,const Standard_Real vv1,const Standard_Real uu2,const Standard_Real vv2,const Standard_Integer T1,const Standard_Integer E1,const Standard_Real LAM1,const Standard_Integer T2,const Standard_Integer E2,const Standard_Real LAM2,const Standard_Integer List);
		%feature("autodoc", "	:rtype: float
") X;
		Standard_Real X ();
		%feature("autodoc", "	:rtype: float
") Y;
		Standard_Real Y ();
		%feature("autodoc", "	:rtype: float
") Z;
		Standard_Real Z ();
		%feature("autodoc", "	:rtype: float
") U1;
		Standard_Real U1 ();
		%feature("autodoc", "	:rtype: float
") V1;
		Standard_Real V1 ();
		%feature("autodoc", "	:rtype: float
") U2;
		Standard_Real U2 ();
		%feature("autodoc", "	:rtype: float
") V2;
		Standard_Real V2 ();
		%feature("autodoc", "	:rtype: int
") T1;
		Standard_Integer T1 ();
		%feature("autodoc", "	:rtype: int
") E1;
		Standard_Integer E1 ();
		%feature("autodoc", "	:rtype: float
") Lambda1;
		Standard_Real Lambda1 ();
		%feature("autodoc", "	:rtype: int
") T2;
		Standard_Integer T2 ();
		%feature("autodoc", "	:rtype: int
") E2;
		Standard_Integer E2 ();
		%feature("autodoc", "	:rtype: float
") Lambda2;
		Standard_Real Lambda2 ();
		%feature("autodoc", "	:rtype: float
") GetAngle;
		Standard_Real GetAngle ();
		%feature("autodoc", "	:rtype: int
") ChainList;
		Standard_Integer ChainList ();
		%feature("autodoc", "	:param Triangle:
	:type Triangle: IntPolyh_Triangle &
	:param FirstEdgePoint:
	:type FirstEdgePoint: Standard_Integer &
	:param SecondEdgePoint:
	:type SecondEdgePoint: Standard_Integer &
	:param LastPoint:
	:type LastPoint: Standard_Integer &
	:rtype: int
") GetEdgePoints;
		Standard_Integer GetEdgePoints (const IntPolyh_Triangle & Triangle,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	:param StPt:
	:type StPt: IntPolyh_StartPoint &
	:rtype: None
") Equal;
		void Equal (const IntPolyh_StartPoint & StPt);
		%feature("autodoc", "	:param StPt:
	:type StPt: IntPolyh_StartPoint &
	:rtype: None
") operator=;
		void operator = (const IntPolyh_StartPoint & StPt);
		%feature("autodoc", "	:param XX:
	:type XX: float
	:param YY:
	:type YY: float
	:param ZZ:
	:type ZZ: float
	:rtype: None
") SetXYZ;
		void SetXYZ (const Standard_Real XX,const Standard_Real YY,const Standard_Real ZZ);
		%feature("autodoc", "	:param UU1:
	:type UU1: float
	:param VV1:
	:type VV1: float
	:rtype: None
") SetUV1;
		void SetUV1 (const Standard_Real UU1,const Standard_Real VV1);
		%feature("autodoc", "	:param UU2:
	:type UU2: float
	:param VV2:
	:type VV2: float
	:rtype: None
") SetUV2;
		void SetUV2 (const Standard_Real UU2,const Standard_Real VV2);
		%feature("autodoc", "	:param IE1:
	:type IE1: Standard_Integer
	:rtype: None
") SetEdge1;
		void SetEdge1 (const Standard_Integer IE1);
		%feature("autodoc", "	:param LAM1:
	:type LAM1: float
	:rtype: None
") SetLambda1;
		void SetLambda1 (const Standard_Real LAM1);
		%feature("autodoc", "	:param IE2:
	:type IE2: Standard_Integer
	:rtype: None
") SetEdge2;
		void SetEdge2 (const Standard_Integer IE2);
		%feature("autodoc", "	:param LAM2:
	:type LAM2: float
	:rtype: None
") SetLambda2;
		void SetLambda2 (const Standard_Real LAM2);
		%feature("autodoc", "	:param IT1:
	:type IT1: Standard_Integer
	:param IT2:
	:type IT2: Standard_Integer
	:rtype: None
") SetCoupleValue;
		void SetCoupleValue (const Standard_Integer IT1,const Standard_Integer IT2);
		%feature("autodoc", "	:param ang:
	:type ang: float
	:rtype: None
") SetAngle;
		void SetAngle (const Standard_Real ang);
		%feature("autodoc", "	:param ChList:
	:type ChList: Standard_Integer
	:rtype: None
") SetChainList;
		void SetChainList (const Standard_Integer ChList);
		%feature("autodoc", "	:param SP:
	:type SP: IntPolyh_StartPoint &
	:rtype: int
") CheckSameSP;
		Standard_Integer CheckSameSP (const IntPolyh_StartPoint & SP);
		%feature("autodoc", "	:rtype: None
") Dump;
		void Dump ();
		%feature("autodoc", "	:param i:
	:type i: Standard_Integer
	:rtype: None
") Dump;
		void Dump (const Standard_Integer i);
};


%feature("shadow") IntPolyh_StartPoint::~IntPolyh_StartPoint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntPolyh_StartPoint {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntPolyh_Triangle;
class IntPolyh_Triangle {
	public:
		%feature("autodoc", "	:rtype: None
") IntPolyh_Triangle;
		 IntPolyh_Triangle ();
		%feature("autodoc", "	:param i1:
	:type i1: Standard_Integer
	:param i2:
	:type i2: Standard_Integer
	:param i3:
	:type i3: Standard_Integer
	:rtype: None
") IntPolyh_Triangle;
		 IntPolyh_Triangle (const Standard_Integer i1,const Standard_Integer i2,const Standard_Integer i3);
		%feature("autodoc", "	:rtype: int
") FirstPoint;
		Standard_Integer FirstPoint ();
		%feature("autodoc", "	:rtype: int
") SecondPoint;
		Standard_Integer SecondPoint ();
		%feature("autodoc", "	:rtype: int
") ThirdPoint;
		Standard_Integer ThirdPoint ();
		%feature("autodoc", "	:rtype: int
") FirstEdge;
		Standard_Integer FirstEdge ();
		%feature("autodoc", "	:rtype: int
") FirstEdgeOrientation;
		Standard_Integer FirstEdgeOrientation ();
		%feature("autodoc", "	:rtype: int
") SecondEdge;
		Standard_Integer SecondEdge ();
		%feature("autodoc", "	:rtype: int
") SecondEdgeOrientation;
		Standard_Integer SecondEdgeOrientation ();
		%feature("autodoc", "	:rtype: int
") ThirdEdge;
		Standard_Integer ThirdEdge ();
		%feature("autodoc", "	:rtype: int
") ThirdEdgeOrientation;
		Standard_Integer ThirdEdgeOrientation ();
		%feature("autodoc", "	:rtype: float
") GetFleche;
		Standard_Real GetFleche ();
		%feature("autodoc", "	:rtype: int
") IndiceIntersectionPossible;
		Standard_Integer IndiceIntersectionPossible ();
		%feature("autodoc", "	:rtype: int
") IndiceIntersection;
		Standard_Integer IndiceIntersection ();
		%feature("autodoc", "	:param v:
	:type v: Standard_Integer
	:rtype: None
") SetFirstPoint;
		void SetFirstPoint (const Standard_Integer v);
		%feature("autodoc", "	:param v:
	:type v: Standard_Integer
	:rtype: None
") SetSecondPoint;
		void SetSecondPoint (const Standard_Integer v);
		%feature("autodoc", "	:param v:
	:type v: Standard_Integer
	:rtype: None
") SetThirdPoint;
		void SetThirdPoint (const Standard_Integer v);
		%feature("autodoc", "	:param v:
	:type v: Standard_Integer
	:param s:
	:type s: Standard_Integer
	:rtype: None
") SetFirstEdge;
		void SetFirstEdge (const Standard_Integer v,const Standard_Integer s);
		%feature("autodoc", "	:param v:
	:type v: Standard_Integer
	:param s:
	:type s: Standard_Integer
	:rtype: None
") SetSecondEdge;
		void SetSecondEdge (const Standard_Integer v,const Standard_Integer s);
		%feature("autodoc", "	:param v:
	:type v: Standard_Integer
	:param s:
	:type s: Standard_Integer
	:rtype: None
") SetThirdEdge;
		void SetThirdEdge (const Standard_Integer v,const Standard_Integer s);
		%feature("autodoc", "	:param v:
	:type v: float
	:rtype: None
") SetFleche;
		void SetFleche (const Standard_Real v);
		%feature("autodoc", "	:param v:
	:type v: Standard_Integer
	:rtype: None
") SetIndiceIntersectionPossible;
		void SetIndiceIntersectionPossible (const Standard_Integer v);
		%feature("autodoc", "	:param v:
	:type v: Standard_Integer
	:rtype: None
") SetIndiceIntersection;
		void SetIndiceIntersection (const Standard_Integer v);
		%feature("autodoc", "	:param v:
	:type v: Standard_Integer
	:rtype: int
") GetEdgeNumber;
		Standard_Integer GetEdgeNumber (const Standard_Integer v);
		%feature("autodoc", "	:param v:
	:type v: Standard_Integer
	:param en:
	:type en: Standard_Integer
	:rtype: None
") SetEdge;
		void SetEdge (const Standard_Integer v,const Standard_Integer en);
		%feature("autodoc", "	:param v:
	:type v: Standard_Integer
	:rtype: int
") GetEdgeOrientation;
		Standard_Integer GetEdgeOrientation (const Standard_Integer v);
		%feature("autodoc", "	:param v:
	:type v: Standard_Integer
	:param oe:
	:type oe: Standard_Integer
	:rtype: None
") SetEdgeOrientation;
		void SetEdgeOrientation (const Standard_Integer v,const Standard_Integer oe);
		%feature("autodoc", "	:param MaSurface:
	:type MaSurface: Handle_Adaptor3d_HSurface &
	:param TP:
	:type TP: IntPolyh_ArrayOfPoints &
	:rtype: None
") TriangleDeflection;
		void TriangleDeflection (const Handle_Adaptor3d_HSurface & MaSurface,const IntPolyh_ArrayOfPoints & TP);
		%feature("autodoc", "	:param PE1:
	:type PE1: Standard_Integer
	:param PE2:
	:type PE2: Standard_Integer
	:param P3:
	:type P3: Standard_Integer
	:param Index:
	:type Index: Standard_Integer
	:param TTriangles:
	:type TTriangles: IntPolyh_ArrayOfTriangles &
	:rtype: int
") CheckCommonEdge;
		Standard_Integer CheckCommonEdge (const Standard_Integer PE1,const Standard_Integer PE2,const Standard_Integer P3,const Standard_Integer Index,const IntPolyh_ArrayOfTriangles & TTriangles);
		%feature("autodoc", "	:param NumTri:
	:type NumTri: Standard_Integer
	:param NumEdge:
	:type NumEdge: Standard_Integer
	:param TEdges:
	:type TEdges: IntPolyh_ArrayOfEdges &
	:rtype: int
") GetNextTriangle2;
		Standard_Integer GetNextTriangle2 (const Standard_Integer NumTri,const Standard_Integer NumEdge,const IntPolyh_ArrayOfEdges & TEdges);
		%feature("autodoc", "	:param TriangleNumber:
	:type TriangleNumber: Standard_Integer
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
		%feature("autodoc", "	:param NombreAffinages:
	:type NombreAffinages: Standard_Integer
	:param TriangleNumber:
	:type TriangleNumber: Standard_Integer
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
		%feature("autodoc", "	:param b:
	:type b: Bnd_Box &
	:param TPoints:
	:type TPoints: IntPolyh_ArrayOfPoints &
	:rtype: int
") CompareBoxTriangle;
		Standard_Integer CompareBoxTriangle (const Bnd_Box & b,const IntPolyh_ArrayOfPoints & TPoints);
		%feature("autodoc", "	:param RefineCriterion:
	:type RefineCriterion: float
	:param thebox:
	:type thebox: Bnd_Box &
	:param TriangleNumber:
	:type TriangleNumber: Standard_Integer
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
		%feature("autodoc", "	:param TEdges:
	:type TEdges: IntPolyh_ArrayOfEdges &
	:param ed1:
	:type ed1: Standard_Integer
	:param ed2:
	:type ed2: Standard_Integer
	:param ed3:
	:type ed3: Standard_Integer
	:rtype: None
") LinkEdges2Triangle;
		void LinkEdges2Triangle (const IntPolyh_ArrayOfEdges & TEdges,const Standard_Integer ed1,const Standard_Integer ed2,const Standard_Integer ed3);
		%feature("autodoc", "	:param Edge:
	:type Edge: Standard_Integer
	:param TEdges:
	:type TEdges: IntPolyh_ArrayOfEdges &
	:rtype: None
") SetEdgeandOrientation;
		void SetEdgeandOrientation (const Standard_Integer Edge,const IntPolyh_ArrayOfEdges & TEdges);
		%feature("autodoc", "	:param v:
	:type v: Standard_Integer
	:rtype: None
") Dump;
		void Dump (const Standard_Integer v);
		%feature("autodoc", "	:param v:
	:type v: Standard_Integer
	:rtype: None
") DumpFleche;
		void DumpFleche (const Standard_Integer v);
};


%feature("shadow") IntPolyh_Triangle::~IntPolyh_Triangle %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntPolyh_Triangle {
	void _kill_pointed() {
		delete $self;
	}
};
