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
%include ../common/StandardDefines.i
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntPolyh_Couple;
		 IntPolyh_Couple ();
		%feature("autodoc", "Args:
	i1(Standard_Integer)
	i2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") IntPolyh_Couple;
		 IntPolyh_Couple (const Standard_Integer i1,const Standard_Integer i2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") FirstValue;
		Standard_Integer FirstValue ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") SecondValue;
		Standard_Integer SecondValue ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") AnalyseFlagValue;
		Standard_Integer AnalyseFlagValue ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") AngleValue;
		Standard_Real AngleValue ();
		%feature("autodoc", "Args:
	v(Standard_Integer)
	w(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetCoupleValue;
		void SetCoupleValue (const Standard_Integer v,const Standard_Integer w);
		%feature("autodoc", "Args:
	v(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetAnalyseFlag;
		void SetAnalyseFlag (const Standard_Integer v);
		%feature("autodoc", "Args:
	ang(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetAngleValue;
		void SetAngleValue (const Standard_Real ang);
		%feature("autodoc", "Args:
	v(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Dump;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntPolyh_Edge;
		 IntPolyh_Edge ();
		%feature("autodoc", "Args:
	i1(Standard_Integer)
	i2(Standard_Integer)
	i3(Standard_Integer)
	i4(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") IntPolyh_Edge;
		 IntPolyh_Edge (const Standard_Integer i1,const Standard_Integer i2,const Standard_Integer i3,const Standard_Integer i4);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") FirstPoint;
		Standard_Integer FirstPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") SecondPoint;
		Standard_Integer SecondPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") FirstTriangle;
		Standard_Integer FirstTriangle ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") SecondTriangle;
		Standard_Integer SecondTriangle ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") AnalysisFlag;
		Standard_Integer AnalysisFlag ();
		%feature("autodoc", "Args:
	v(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetFirstPoint;
		void SetFirstPoint (const Standard_Integer v);
		%feature("autodoc", "Args:
	v(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetSecondPoint;
		void SetSecondPoint (const Standard_Integer v);
		%feature("autodoc", "Args:
	v(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetFirstTriangle;
		void SetFirstTriangle (const Standard_Integer v);
		%feature("autodoc", "Args:
	v(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetSecondTriangle;
		void SetSecondTriangle (const Standard_Integer v);
		%feature("autodoc", "Args:
	v(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetAnalysisFlag;
		void SetAnalysisFlag (const Standard_Integer v);
		%feature("autodoc", "Args:
	v(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Dump;
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
		%feature("autodoc", "Args:
	S1(Handle_Adaptor3d_HSurface)
	S2(Handle_Adaptor3d_HSurface)

Returns:
	None

Constructor") IntPolyh_Intersection;
		 IntPolyh_Intersection (const Handle_Adaptor3d_HSurface & S1,const Handle_Adaptor3d_HSurface & S2);
		%feature("autodoc", "Args:
	S1(Handle_Adaptor3d_HSurface)
	NbSU1(Standard_Integer)
	NbSV1(Standard_Integer)
	S2(Handle_Adaptor3d_HSurface)
	NbSU2(Standard_Integer)
	NbSV2(Standard_Integer)

Returns:
	None

NbSU1 ... NbSV2 are used to compute the initial  
         samples of  the  iso parametric  meshes  on the  
         surfaces.") IntPolyh_Intersection;
		 IntPolyh_Intersection (const Handle_Adaptor3d_HSurface & S1,const Standard_Integer NbSU1,const Standard_Integer NbSV1,const Handle_Adaptor3d_HSurface & S2,const Standard_Integer NbSU2,const Standard_Integer NbSV2);
		%feature("autodoc", "Args:
	S1(Handle_Adaptor3d_HSurface)
	anUpars1(TColStd_Array1OfReal)
	aVpars1(TColStd_Array1OfReal)
	S2(Handle_Adaptor3d_HSurface)
	anUpars2(TColStd_Array1OfReal)
	aVpars2(TColStd_Array1OfReal)

Returns:
	None

D1,  D2 are used to compute the initial  
         samples of  the  iso parametric  meshes  on the  
         surfaces.") IntPolyh_Intersection;
		 IntPolyh_Intersection (const Handle_Adaptor3d_HSurface & S1,const TColStd_Array1OfReal & anUpars1,const TColStd_Array1OfReal & aVpars1,const Handle_Adaptor3d_HSurface & S2,const TColStd_Array1OfReal & anUpars2,const TColStd_Array1OfReal & aVpars2);
		%feature("autodoc", "Args:
	None
Returns:
	None

Compute the intersection.") Perform;
		void Perform ();
		%feature("autodoc", "Args:
	Upars1(TColStd_Array1OfReal)
	Vpars1(TColStd_Array1OfReal)
	Upars2(TColStd_Array1OfReal)
	Vpars2(TColStd_Array1OfReal)

Returns:
	None

Compute the intersection.") Perform;
		void Perform (const TColStd_Array1OfReal & Upars1,const TColStd_Array1OfReal & Vpars1,const TColStd_Array1OfReal & Upars2,const TColStd_Array1OfReal & Vpars2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbSectionLines;
		Standard_Integer NbSectionLines ();
		%feature("autodoc", "Args:
	IndexLine(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") NbPointsInLine;
		Standard_Integer NbPointsInLine (const Standard_Integer IndexLine);
		%feature("autodoc", "Args:
	IndexLine(Standard_Integer)
	IndexPoint(Standard_Integer)
	x(Standard_Real)
	y(Standard_Real)
	z(Standard_Real)
	u1(Standard_Real)
	v1(Standard_Real)
	u2(Standard_Real)
	v2(Standard_Real)
	incidence(Standard_Real)

Returns:
	None

No detailed docstring for this function.") GetLinePoint;
		void GetLinePoint (const Standard_Integer IndexLine,const Standard_Integer IndexPoint,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbTangentZones;
		Standard_Integer NbTangentZones ();
		%feature("autodoc", "Args:
	IndexLine(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") NbPointsInTangentZone;
		Standard_Integer NbPointsInTangentZone (const Standard_Integer IndexLine);
		%feature("autodoc", "Args:
	IndexLine(Standard_Integer)
	IndexPoint(Standard_Integer)
	x(Standard_Real)
	y(Standard_Real)
	z(Standard_Real)
	u1(Standard_Real)
	v1(Standard_Real)
	u2(Standard_Real)
	v2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") GetTangentZonePoint;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntPolyh_Point;
		 IntPolyh_Point ();
		%feature("autodoc", "Args:
	xx(Standard_Real)
	yy(Standard_Real)
	zz(Standard_Real)
	uu(Standard_Real)
	vv(Standard_Real)

Returns:
	None

No detailed docstring for this function.") IntPolyh_Point;
		 IntPolyh_Point (const Standard_Real xx,const Standard_Real yy,const Standard_Real zz,const Standard_Real uu,const Standard_Real vv);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") X;
		Standard_Real X ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Y;
		Standard_Real Y ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Z;
		Standard_Real Z ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") U;
		Standard_Real U ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") V;
		Standard_Real V ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") PartOfCommon;
		Standard_Integer PartOfCommon ();
		%feature("autodoc", "Args:
	Pt(IntPolyh_Point)

Returns:
	None

No detailed docstring for this function.") Equal;
		void Equal (const IntPolyh_Point & Pt);
		%feature("autodoc", "Args:
	Pt(IntPolyh_Point)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const IntPolyh_Point & Pt);
		%feature("autodoc", "Args:
	v1(Standard_Real)
	v2(Standard_Real)
	v3(Standard_Real)
	v4(Standard_Real)
	v5(Standard_Real)
	II(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const Standard_Real v1,const Standard_Real v2,const Standard_Real v3,const Standard_Real v4,const Standard_Real v5,const Standard_Integer II = 1);
		%feature("autodoc", "Args:
	v(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetX;
		void SetX (const Standard_Real v);
		%feature("autodoc", "Args:
	v(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetY;
		void SetY (const Standard_Real v);
		%feature("autodoc", "Args:
	v(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetZ;
		void SetZ (const Standard_Real v);
		%feature("autodoc", "Args:
	v(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetU;
		void SetU (const Standard_Real v);
		%feature("autodoc", "Args:
	v(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetV;
		void SetV (const Standard_Real v);
		%feature("autodoc", "Args:
	ii(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetPartOfCommon;
		void SetPartOfCommon (const Standard_Integer ii);
		%feature("autodoc", "Args:
	MySurface(Handle_Adaptor3d_HSurface)
	P1(IntPolyh_Point)
	P2(IntPolyh_Point)

Returns:
	None

No detailed docstring for this function.") Middle;
		void Middle (const Handle_Adaptor3d_HSurface & MySurface,const IntPolyh_Point & P1,const IntPolyh_Point & P2);
		%feature("autodoc", "Args:
	P1(IntPolyh_Point)

Returns:
	IntPolyh_Point

No detailed docstring for this function.") Add;
		IntPolyh_Point Add (const IntPolyh_Point & P1);
		%feature("autodoc", "Args:
	P1(IntPolyh_Point)

Returns:
	IntPolyh_Point

No detailed docstring for this function.") operator+;
		IntPolyh_Point operator + (const IntPolyh_Point & P1);
		%feature("autodoc", "Args:
	P1(IntPolyh_Point)

Returns:
	IntPolyh_Point

No detailed docstring for this function.") Sub;
		IntPolyh_Point Sub (const IntPolyh_Point & P1);
		%feature("autodoc", "Args:
	P1(IntPolyh_Point)

Returns:
	IntPolyh_Point

No detailed docstring for this function.") operator-;
		IntPolyh_Point operator - (const IntPolyh_Point & P1);
		%feature("autodoc", "Args:
	rr(Standard_Real)

Returns:
	IntPolyh_Point

No detailed docstring for this function.") Divide;
		IntPolyh_Point Divide (const Standard_Real rr);
		%feature("autodoc", "Args:
	rr(Standard_Real)

Returns:
	IntPolyh_Point

No detailed docstring for this function.") operator/;
		IntPolyh_Point operator / (const Standard_Real rr);
		%feature("autodoc", "Args:
	rr(Standard_Real)

Returns:
	IntPolyh_Point

No detailed docstring for this function.") Multiplication;
		IntPolyh_Point Multiplication (const Standard_Real rr);
		%feature("autodoc", "Args:
	rr(Standard_Real)

Returns:
	IntPolyh_Point

No detailed docstring for this function.") operator*;
		IntPolyh_Point operator * (const Standard_Real rr);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") SquareModulus;
		Standard_Real SquareModulus ();
		%feature("autodoc", "Args:
	P2(IntPolyh_Point)

Returns:
	Standard_Real

No detailed docstring for this function.") SquareDistance;
		Standard_Real SquareDistance (const IntPolyh_Point & P2);
		%feature("autodoc", "Args:
	P2(IntPolyh_Point)

Returns:
	Standard_Real

No detailed docstring for this function.") Dot;
		Standard_Real Dot (const IntPolyh_Point & P2);
		%feature("autodoc", "Args:
	P1(IntPolyh_Point)
	P2(IntPolyh_Point)

Returns:
	None

No detailed docstring for this function.") Cross;
		void Cross (const IntPolyh_Point & P1,const IntPolyh_Point & P2);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dump;
		void Dump ();
		%feature("autodoc", "Args:
	i(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Dump;
		void Dump (const Standard_Integer i);
		%feature("autodoc", "Args:
	theFlag(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetDegenerated;
		void SetDegenerated (const Standard_Boolean theFlag);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Degenerated;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntPolyh_SectionLine;
		 IntPolyh_SectionLine ();
		%feature("autodoc", "Args:
	nn(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") IntPolyh_SectionLine;
		 IntPolyh_SectionLine (const Standard_Integer nn);
		%feature("autodoc", "Args:
	nn(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Standard_Integer nn);
		%feature("autodoc", "Args:
	nn(Standard_Integer)

Returns:
	IntPolyh_StartPoint

No detailed docstring for this function.") Value;
		const IntPolyh_StartPoint & Value (const Standard_Integer nn);
		%feature("autodoc", "Args:
	nn(Standard_Integer)

Returns:
	IntPolyh_StartPoint

No detailed docstring for this function.") ChangeValue;
		IntPolyh_StartPoint & ChangeValue (const Standard_Integer nn);
		%feature("autodoc", "Args:
	Other(IntPolyh_SectionLine)

Returns:
	IntPolyh_SectionLine

No detailed docstring for this function.") Copy;
		IntPolyh_SectionLine & Copy (const IntPolyh_SectionLine & Other);
		%feature("autodoc", "Args:
	Other(IntPolyh_SectionLine)

Returns:
	IntPolyh_SectionLine

No detailed docstring for this function.") operator=;
		IntPolyh_SectionLine & operator = (const IntPolyh_SectionLine & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") GetN;
		Standard_Integer GetN ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbStartPoints;
		Standard_Integer NbStartPoints ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IncrementNbStartPoints;
		void IncrementNbStartPoints ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dump;
		void Dump ();
		%feature("autodoc", "Args:
	SP(IntPolyh_StartPoint)

Returns:
	None

No detailed docstring for this function.") Prepend;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntPolyh_SeqOfStartPoints;
		 IntPolyh_SeqOfStartPoints ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(IntPolyh_SeqOfStartPoints)

Returns:
	IntPolyh_SeqOfStartPoints

No detailed docstring for this function.") Assign;
		const IntPolyh_SeqOfStartPoints & Assign (const IntPolyh_SeqOfStartPoints & Other);
		%feature("autodoc", "Args:
	Other(IntPolyh_SeqOfStartPoints)

Returns:
	IntPolyh_SeqOfStartPoints

No detailed docstring for this function.") operator=;
		const IntPolyh_SeqOfStartPoints & operator = (const IntPolyh_SeqOfStartPoints & Other);
		%feature("autodoc", "Args:
	T(IntPolyh_StartPoint)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const IntPolyh_StartPoint & T);
		%feature("autodoc", "Args:
	S(IntPolyh_SeqOfStartPoints)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (IntPolyh_SeqOfStartPoints & S);
		%feature("autodoc", "Args:
	T(IntPolyh_StartPoint)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const IntPolyh_StartPoint & T);
		%feature("autodoc", "Args:
	S(IntPolyh_SeqOfStartPoints)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (IntPolyh_SeqOfStartPoints & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(IntPolyh_StartPoint)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const IntPolyh_StartPoint & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(IntPolyh_SeqOfStartPoints)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,IntPolyh_SeqOfStartPoints & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(IntPolyh_StartPoint)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const IntPolyh_StartPoint & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(IntPolyh_SeqOfStartPoints)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,IntPolyh_SeqOfStartPoints & S);
		%feature("autodoc", "Args:
	None
Returns:
	IntPolyh_StartPoint

No detailed docstring for this function.") First;
		const IntPolyh_StartPoint & First ();
		%feature("autodoc", "Args:
	None
Returns:
	IntPolyh_StartPoint

No detailed docstring for this function.") Last;
		const IntPolyh_StartPoint & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(IntPolyh_SeqOfStartPoints)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,IntPolyh_SeqOfStartPoints & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	IntPolyh_StartPoint

No detailed docstring for this function.") Value;
		const IntPolyh_StartPoint & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(IntPolyh_StartPoint)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const IntPolyh_StartPoint & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	IntPolyh_StartPoint

No detailed docstring for this function.") ChangeValue;
		IntPolyh_StartPoint & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
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
		%feature("autodoc", "Args:
	I(IntPolyh_StartPoint)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") IntPolyh_SequenceNodeOfSeqOfStartPoints;
		 IntPolyh_SequenceNodeOfSeqOfStartPoints (const IntPolyh_StartPoint & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	IntPolyh_StartPoint

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntPolyh_StartPoint;
		 IntPolyh_StartPoint ();
		%feature("autodoc", "Args:
	xx(Standard_Real)
	yy(Standard_Real)
	zz(Standard_Real)
	uu1(Standard_Real)
	vv1(Standard_Real)
	uu2(Standard_Real)
	vv2(Standard_Real)
	T1(Standard_Integer)
	E1(Standard_Integer)
	LAM1(Standard_Real)
	T2(Standard_Integer)
	E2(Standard_Integer)
	LAM2(Standard_Real)
	List(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") IntPolyh_StartPoint;
		 IntPolyh_StartPoint (const Standard_Real xx,const Standard_Real yy,const Standard_Real zz,const Standard_Real uu1,const Standard_Real vv1,const Standard_Real uu2,const Standard_Real vv2,const Standard_Integer T1,const Standard_Integer E1,const Standard_Real LAM1,const Standard_Integer T2,const Standard_Integer E2,const Standard_Real LAM2,const Standard_Integer List);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") X;
		Standard_Real X ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Y;
		Standard_Real Y ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Z;
		Standard_Real Z ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") U1;
		Standard_Real U1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") V1;
		Standard_Real V1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") U2;
		Standard_Real U2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") V2;
		Standard_Real V2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") T1;
		Standard_Integer T1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") E1;
		Standard_Integer E1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Lambda1;
		Standard_Real Lambda1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") T2;
		Standard_Integer T2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") E2;
		Standard_Integer E2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Lambda2;
		Standard_Real Lambda2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") GetAngle;
		Standard_Real GetAngle ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") ChainList;
		Standard_Integer ChainList ();
		%feature("autodoc", "Args:
	Triangle(IntPolyh_Triangle)
	FirstEdgePoint(Standard_Integer)
	SecondEdgePoint(Standard_Integer)
	LastPoint(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") GetEdgePoints;
		Standard_Integer GetEdgePoints (const IntPolyh_Triangle & Triangle,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	StPt(IntPolyh_StartPoint)

Returns:
	None

No detailed docstring for this function.") Equal;
		void Equal (const IntPolyh_StartPoint & StPt);
		%feature("autodoc", "Args:
	StPt(IntPolyh_StartPoint)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const IntPolyh_StartPoint & StPt);
		%feature("autodoc", "Args:
	XX(Standard_Real)
	YY(Standard_Real)
	ZZ(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetXYZ;
		void SetXYZ (const Standard_Real XX,const Standard_Real YY,const Standard_Real ZZ);
		%feature("autodoc", "Args:
	UU1(Standard_Real)
	VV1(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetUV1;
		void SetUV1 (const Standard_Real UU1,const Standard_Real VV1);
		%feature("autodoc", "Args:
	UU2(Standard_Real)
	VV2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetUV2;
		void SetUV2 (const Standard_Real UU2,const Standard_Real VV2);
		%feature("autodoc", "Args:
	IE1(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetEdge1;
		void SetEdge1 (const Standard_Integer IE1);
		%feature("autodoc", "Args:
	LAM1(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetLambda1;
		void SetLambda1 (const Standard_Real LAM1);
		%feature("autodoc", "Args:
	IE2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetEdge2;
		void SetEdge2 (const Standard_Integer IE2);
		%feature("autodoc", "Args:
	LAM2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetLambda2;
		void SetLambda2 (const Standard_Real LAM2);
		%feature("autodoc", "Args:
	IT1(Standard_Integer)
	IT2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetCoupleValue;
		void SetCoupleValue (const Standard_Integer IT1,const Standard_Integer IT2);
		%feature("autodoc", "Args:
	ang(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetAngle;
		void SetAngle (const Standard_Real ang);
		%feature("autodoc", "Args:
	ChList(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetChainList;
		void SetChainList (const Standard_Integer ChList);
		%feature("autodoc", "Args:
	SP(IntPolyh_StartPoint)

Returns:
	Standard_Integer

No detailed docstring for this function.") CheckSameSP;
		Standard_Integer CheckSameSP (const IntPolyh_StartPoint & SP);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dump;
		void Dump ();
		%feature("autodoc", "Args:
	i(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Dump;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntPolyh_Triangle;
		 IntPolyh_Triangle ();
		%feature("autodoc", "Args:
	i1(Standard_Integer)
	i2(Standard_Integer)
	i3(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") IntPolyh_Triangle;
		 IntPolyh_Triangle (const Standard_Integer i1,const Standard_Integer i2,const Standard_Integer i3);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") FirstPoint;
		Standard_Integer FirstPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") SecondPoint;
		Standard_Integer SecondPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") ThirdPoint;
		Standard_Integer ThirdPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") FirstEdge;
		Standard_Integer FirstEdge ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") FirstEdgeOrientation;
		Standard_Integer FirstEdgeOrientation ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") SecondEdge;
		Standard_Integer SecondEdge ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") SecondEdgeOrientation;
		Standard_Integer SecondEdgeOrientation ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") ThirdEdge;
		Standard_Integer ThirdEdge ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") ThirdEdgeOrientation;
		Standard_Integer ThirdEdgeOrientation ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") GetFleche;
		Standard_Real GetFleche ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") IndiceIntersectionPossible;
		Standard_Integer IndiceIntersectionPossible ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") IndiceIntersection;
		Standard_Integer IndiceIntersection ();
		%feature("autodoc", "Args:
	v(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetFirstPoint;
		void SetFirstPoint (const Standard_Integer v);
		%feature("autodoc", "Args:
	v(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetSecondPoint;
		void SetSecondPoint (const Standard_Integer v);
		%feature("autodoc", "Args:
	v(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetThirdPoint;
		void SetThirdPoint (const Standard_Integer v);
		%feature("autodoc", "Args:
	v(Standard_Integer)
	s(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetFirstEdge;
		void SetFirstEdge (const Standard_Integer v,const Standard_Integer s);
		%feature("autodoc", "Args:
	v(Standard_Integer)
	s(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetSecondEdge;
		void SetSecondEdge (const Standard_Integer v,const Standard_Integer s);
		%feature("autodoc", "Args:
	v(Standard_Integer)
	s(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetThirdEdge;
		void SetThirdEdge (const Standard_Integer v,const Standard_Integer s);
		%feature("autodoc", "Args:
	v(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetFleche;
		void SetFleche (const Standard_Real v);
		%feature("autodoc", "Args:
	v(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetIndiceIntersectionPossible;
		void SetIndiceIntersectionPossible (const Standard_Integer v);
		%feature("autodoc", "Args:
	v(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetIndiceIntersection;
		void SetIndiceIntersection (const Standard_Integer v);
		%feature("autodoc", "Args:
	v(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") GetEdgeNumber;
		Standard_Integer GetEdgeNumber (const Standard_Integer v);
		%feature("autodoc", "Args:
	v(Standard_Integer)
	en(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetEdge;
		void SetEdge (const Standard_Integer v,const Standard_Integer en);
		%feature("autodoc", "Args:
	v(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") GetEdgeOrientation;
		Standard_Integer GetEdgeOrientation (const Standard_Integer v);
		%feature("autodoc", "Args:
	v(Standard_Integer)
	oe(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetEdgeOrientation;
		void SetEdgeOrientation (const Standard_Integer v,const Standard_Integer oe);
		%feature("autodoc", "Args:
	MaSurface(Handle_Adaptor3d_HSurface)
	TP(IntPolyh_ArrayOfPoints)

Returns:
	None

No detailed docstring for this function.") TriangleDeflection;
		void TriangleDeflection (const Handle_Adaptor3d_HSurface & MaSurface,const IntPolyh_ArrayOfPoints & TP);
		%feature("autodoc", "Args:
	PE1(Standard_Integer)
	PE2(Standard_Integer)
	P3(Standard_Integer)
	Index(Standard_Integer)
	TTriangles(IntPolyh_ArrayOfTriangles)

Returns:
	Standard_Integer

No detailed docstring for this function.") CheckCommonEdge;
		Standard_Integer CheckCommonEdge (const Standard_Integer PE1,const Standard_Integer PE2,const Standard_Integer P3,const Standard_Integer Index,const IntPolyh_ArrayOfTriangles & TTriangles);
		%feature("autodoc", "Args:
	NumTri(Standard_Integer)
	NumEdge(Standard_Integer)
	TEdges(IntPolyh_ArrayOfEdges)

Returns:
	Standard_Integer

No detailed docstring for this function.") GetNextTriangle2;
		Standard_Integer GetNextTriangle2 (const Standard_Integer NumTri,const Standard_Integer NumEdge,const IntPolyh_ArrayOfEdges & TEdges);
		%feature("autodoc", "Args:
	TriangleNumber(Standard_Integer)
	MySurface(Handle_Adaptor3d_HSurface)
	TPoints(IntPolyh_ArrayOfPoints)
	TTriangles(IntPolyh_ArrayOfTriangles)
	TEdges(IntPolyh_ArrayOfEdges)

Returns:
	None

No detailed docstring for this function.") MiddleRefinement;
		void MiddleRefinement (const Standard_Integer TriangleNumber,const Handle_Adaptor3d_HSurface & MySurface,IntPolyh_ArrayOfPoints & TPoints,IntPolyh_ArrayOfTriangles & TTriangles,IntPolyh_ArrayOfEdges & TEdges);
		%feature("autodoc", "Args:
	NombreAffinages(Standard_Integer)
	TriangleNumber(Standard_Integer)
	MySurface(Handle_Adaptor3d_HSurface)
	TPoints(IntPolyh_ArrayOfPoints)
	TTriangles(IntPolyh_ArrayOfTriangles)
	TEdges(IntPolyh_ArrayOfEdges)

Returns:
	None

No detailed docstring for this function.") MultipleMiddleRefinement;
		void MultipleMiddleRefinement (const Standard_Integer NombreAffinages,const Standard_Integer TriangleNumber,const Handle_Adaptor3d_HSurface & MySurface,IntPolyh_ArrayOfPoints & TPoints,IntPolyh_ArrayOfTriangles & TTriangles,IntPolyh_ArrayOfEdges & TEdges);
		%feature("autodoc", "Args:
	b(Bnd_Box)
	TPoints(IntPolyh_ArrayOfPoints)

Returns:
	Standard_Integer

No detailed docstring for this function.") CompareBoxTriangle;
		Standard_Integer CompareBoxTriangle (const Bnd_Box & b,const IntPolyh_ArrayOfPoints & TPoints);
		%feature("autodoc", "Args:
	RefineCriterion(Standard_Real)
	thebox(Bnd_Box)
	TriangleNumber(Standard_Integer)
	MySurface(Handle_Adaptor3d_HSurface)
	TPoints(IntPolyh_ArrayOfPoints)
	TTriangles(IntPolyh_ArrayOfTriangles)
	TEdges(IntPolyh_ArrayOfEdges)

Returns:
	None

No detailed docstring for this function.") MultipleMiddleRefinement2;
		void MultipleMiddleRefinement2 (const Standard_Real RefineCriterion,const Bnd_Box & thebox,const Standard_Integer TriangleNumber,const Handle_Adaptor3d_HSurface & MySurface,IntPolyh_ArrayOfPoints & TPoints,IntPolyh_ArrayOfTriangles & TTriangles,IntPolyh_ArrayOfEdges & TEdges);
		%feature("autodoc", "Args:
	TEdges(IntPolyh_ArrayOfEdges)
	ed1(Standard_Integer)
	ed2(Standard_Integer)
	ed3(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") LinkEdges2Triangle;
		void LinkEdges2Triangle (const IntPolyh_ArrayOfEdges & TEdges,const Standard_Integer ed1,const Standard_Integer ed2,const Standard_Integer ed3);
		%feature("autodoc", "Args:
	Edge(Standard_Integer)
	TEdges(IntPolyh_ArrayOfEdges)

Returns:
	None

No detailed docstring for this function.") SetEdgeandOrientation;
		void SetEdgeandOrientation (const Standard_Integer Edge,const IntPolyh_ArrayOfEdges & TEdges);
		%feature("autodoc", "Args:
	v(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Dump;
		void Dump (const Standard_Integer v);
		%feature("autodoc", "Args:
	v(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") DumpFleche;
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
