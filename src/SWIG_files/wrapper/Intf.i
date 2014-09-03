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
%module (package="OCC") Intf

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

%include Intf_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
enum Intf_PIType {
	Intf_EXTERNAL = 0,
	Intf_FACE = 1,
	Intf_EDGE = 2,
	Intf_VERTEX = 3,
};

/* end public enums declaration */

%rename(intf) Intf;
%nodefaultctor Intf;
class Intf {
	public:
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)
	P3(gp_Pnt)
	NormalVector(gp_XYZ)
	PolarDistance(Standard_Real)

Returns:
	static void

Computes   the  interference between   two polygons in  2d.  
         Result : points of intersections and zones of tangence.  Computes  the   interference  between  two  polygon  in 3d.  
         Section points, common perpendicular and projections.  Computes the interference  between a polygon or  a straight  
         line and a polyhedron.   Points of intersection  and zones  
         of tangence.  Compute the  interference  between two polyhedron.  Points  
         of intersection ,  polylines  of intersection and zones of  
         tangence.  Give the plane equation of the triangle <P1> <P2> <P3>.") PlaneEquation;
		static void PlaneEquation (const gp_Pnt & P1,const gp_Pnt & P2,const gp_Pnt & P3,gp_XYZ & NormalVector,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)
	P3(gp_Pnt)
	ThePnt(gp_Pnt)

Returns:
	static Standard_Boolean

Compute if the triangle <P1> <P2> <P3> contain <ThePnt>.") Contain;
		static Standard_Boolean Contain (const gp_Pnt & P1,const gp_Pnt & P2,const gp_Pnt & P3,const gp_Pnt & ThePnt);
};


%feature("shadow") Intf::~Intf %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Intf {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Intf_Array1OfLin;
class Intf_Array1OfLin {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Intf_Array1OfLin;
		 Intf_Array1OfLin (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(gp_Lin)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Intf_Array1OfLin;
		 Intf_Array1OfLin (const gp_Lin & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(gp_Lin)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const gp_Lin & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	Other(Intf_Array1OfLin)

Returns:
	Intf_Array1OfLin

No detailed docstring for this function.") Assign;
		const Intf_Array1OfLin & Assign (const Intf_Array1OfLin & Other);
		%feature("autodoc", "Args:
	Other(Intf_Array1OfLin)

Returns:
	Intf_Array1OfLin

No detailed docstring for this function.") operator=;
		const Intf_Array1OfLin & operator = (const Intf_Array1OfLin & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(gp_Lin)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const gp_Lin & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Lin

No detailed docstring for this function.") Value;
		const gp_Lin & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Lin

No detailed docstring for this function.") ChangeValue;
		gp_Lin & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") Intf_Array1OfLin::~Intf_Array1OfLin %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Intf_Array1OfLin {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Intf_Interference;
class Intf_Interference {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Gives the number   of  points of  intersection  in the  
         interference.") NbSectionPoints;
		Standard_Integer NbSectionPoints ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Intf_SectionPoint

Gives the point of  intersection of address  Index in  
         the interference.") PntValue;
		const Intf_SectionPoint & PntValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Gives the number  of polylines of  intersection in the  
         interference.") NbSectionLines;
		Standard_Integer NbSectionLines ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Intf_SectionLine

Gives the polyline of intersection at address <Index> in  
         the interference.") LineValue;
		const Intf_SectionLine & LineValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Gives the number of zones of tangence in the interference.") NbTangentZones;
		Standard_Integer NbTangentZones ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Intf_TangentZone

Gives  the zone of  tangence at address   Index in the  
         interference.") ZoneValue;
		const Intf_TangentZone & ZoneValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Gives the tolerance used for the calculation.") GetTolerance;
		Standard_Real GetTolerance ();
		%feature("autodoc", "Args:
	ThePnt(Intf_SectionPoint)

Returns:
	Standard_Boolean

Tests if the polylines of  intersection or the zones of  
         tangence contain the point of intersection <ThePnt>.") Contains;
		Standard_Boolean Contains (const Intf_SectionPoint & ThePnt);
		%feature("autodoc", "Args:
	TheZone(Intf_TangentZone)

Returns:
	Standard_Boolean

Inserts a new zone of tangence in  the current list of  
         tangent zones of  the interference  and  returns  True  
         when done.") Insert;
		Standard_Boolean Insert (const Intf_TangentZone & TheZone);
		%feature("autodoc", "Args:
	pdeb(Intf_SectionPoint)
	pfin(Intf_SectionPoint)

Returns:
	None

Insert a new segment of intersection in the current  list of  
         polylines of intersection of the interference.") Insert;
		void Insert (const Intf_SectionPoint & pdeb,const Intf_SectionPoint & pfin);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dump;
		void Dump ();
};


%feature("shadow") Intf_Interference::~Intf_Interference %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Intf_Interference {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Intf_Polygon2d;
class Intf_Polygon2d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	Bnd_Box2d

Returns the bounding box of the polygon.") Bounding;
		const Bnd_Box2d & Bounding ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns True if the polyline is closed.") Closed;
		virtual Standard_Boolean Closed ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

Returns the tolerance of the polygon.") DeflectionOverEstimation;
		virtual Standard_Real DeflectionOverEstimation ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

Returns the number of Segments in the polyline.") NbSegments;
		virtual Standard_Integer NbSegments ();
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)
	theBegin(gp_Pnt2d)
	theEnd(gp_Pnt2d)

Returns:
	virtual void

Returns the points of the segment <Index> in the Polygon.") Segment;
		virtual void Segment (const Standard_Integer theIndex,gp_Pnt2d & theBegin,gp_Pnt2d & theEnd);
};


%feature("shadow") Intf_Polygon2d::~Intf_Polygon2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Intf_Polygon2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Intf_SectionLine;
class Intf_SectionLine {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns number of points in this SectionLine.") NumberOfPoints;
		Standard_Integer NumberOfPoints ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Intf_SectionPoint

Gives the point of intersection of  address <Index>  in the  
         SectionLine.") GetPoint;
		const Intf_SectionPoint & GetPoint (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the SectionLine is closed.") IsClosed;
		Standard_Boolean IsClosed ();
		%feature("autodoc", "Args:
	ThePI(Intf_SectionPoint)

Returns:
	Standard_Boolean

Returns True if ThePI is in the SectionLine <self>.") Contains;
		Standard_Boolean Contains (const Intf_SectionPoint & ThePI);
		%feature("autodoc", "Args:
	ThePI(Intf_SectionPoint)

Returns:
	Standard_Integer

Checks if <ThePI>  is an end of  the SectionLine. Returns 1  
         for the beginning, 2 for the end, otherwise 0.") IsEnd;
		Standard_Integer IsEnd (const Intf_SectionPoint & ThePI);
		%feature("autodoc", "Args:
	Other(Intf_SectionLine)

Returns:
	Standard_Boolean

Compares two SectionLines.") IsEqual;
		Standard_Boolean IsEqual (const Intf_SectionLine & Other);
		%feature("autodoc", "Args:
	Other(Intf_SectionLine)

Returns:
	Standard_Boolean

No detailed docstring for this function.") operator==;
		Standard_Boolean operator == (const Intf_SectionLine & Other);
		%feature("autodoc", "Args:
	None
Returns:
	None

Constructs an empty SectionLine.") Intf_SectionLine;
		 Intf_SectionLine ();
		%feature("autodoc", "Args:
	Other(Intf_SectionLine)

Returns:
	None

Copies a SectionLine.") Intf_SectionLine;
		 Intf_SectionLine (const Intf_SectionLine & Other);
		%feature("autodoc", "Args:
	Pi(Intf_SectionPoint)

Returns:
	None

Adds a point at the end of the SectionLine.") Append;
		void Append (const Intf_SectionPoint & Pi);
		%feature("autodoc", "Args:
	LS(Intf_SectionLine)

Returns:
	None

Concatenates   the SectionLine  <LS>  at  the  end  of  the  
         SectionLine <self>.") Append;
		void Append (Intf_SectionLine & LS);
		%feature("autodoc", "Args:
	Pi(Intf_SectionPoint)

Returns:
	None

Adds a point to the beginning of the SectionLine <self>.") Prepend;
		void Prepend (const Intf_SectionPoint & Pi);
		%feature("autodoc", "Args:
	LS(Intf_SectionLine)

Returns:
	None

Concatenates a SectionLine  <LS>  at the  beginning  of the  
         SectionLine <self>.") Prepend;
		void Prepend (Intf_SectionLine & LS);
		%feature("autodoc", "Args:
	None
Returns:
	None

Reverses the order of the elements of the SectionLine.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Closes the SectionLine.") Close;
		void Close ();
		%feature("autodoc", "Args:
	Indent(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Dump;
		void Dump (const Standard_Integer Indent);
};


%feature("shadow") Intf_SectionLine::~Intf_SectionLine %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Intf_SectionLine {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Intf_SectionPoint;
class Intf_SectionPoint {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the location of the SectionPoint.") Pnt;
		const gp_Pnt & Pnt ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the cumulated  Parameter of the SectionPoint on the  
         first element.") ParamOnFirst;
		Standard_Real ParamOnFirst ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the cumulated Parameter of the section point on the  
         second element.") ParamOnSecond;
		Standard_Real ParamOnSecond ();
		%feature("autodoc", "Args:
	None
Returns:
	Intf_PIType

Returns the type of the section point on the first element.") TypeOnFirst;
		Intf_PIType TypeOnFirst ();
		%feature("autodoc", "Args:
	None
Returns:
	Intf_PIType

Returns  the  type  of the  section  point  on  the  second  
         element.") TypeOnSecond;
		Intf_PIType TypeOnSecond ();
		%feature("autodoc", "Args:
	Dim(Intf_PIType)
	Add1(Standard_Integer)
	Add2(Standard_Integer)
	Param(Standard_Real)

Returns:
	None

No detailed docstring for this function.") InfoFirst;
		void InfoFirst (Intf_PIType & Dim,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Dim(Intf_PIType)
	Addr(Standard_Integer)
	Param(Standard_Real)

Returns:
	None

Gives the   datas  about   the    first  argument of    the  
         Interference.") InfoFirst;
		void InfoFirst (Intf_PIType & Dim,Standard_Integer &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Dim(Intf_PIType)
	Add1(Standard_Integer)
	Add2(Standard_Integer)
	Param(Standard_Real)

Returns:
	None

No detailed docstring for this function.") InfoSecond;
		void InfoSecond (Intf_PIType & Dim,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Dim(Intf_PIType)
	Addr(Standard_Integer)
	Param(Standard_Real)

Returns:
	None

Gives the   datas  about   the    second  argument of    the  
         Interference.") InfoSecond;
		void InfoSecond (Intf_PIType & Dim,Standard_Integer &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Gives the incidence at  this  section point. The  incidence  
         between the two triangles is given by the cosine.  The best  
         incidence is 0. (PI/2).  The worst is 1. (null angle).") Incidence;
		Standard_Real Incidence ();
		%feature("autodoc", "Args:
	Other(Intf_SectionPoint)

Returns:
	Standard_Boolean

Returns True if the two SectionPoint have the  same logical  
         informations.") IsEqual;
		Standard_Boolean IsEqual (const Intf_SectionPoint & Other);
		%feature("autodoc", "Args:
	Other(Intf_SectionPoint)

Returns:
	Standard_Boolean

No detailed docstring for this function.") operator==;
		Standard_Boolean operator == (const Intf_SectionPoint & Other);
		%feature("autodoc", "Args:
	Other(Intf_SectionPoint)

Returns:
	Standard_Boolean

Returns True if the two SectionPoints are  on the  same edge  
         of the first or the second element.") IsOnSameEdge;
		Standard_Boolean IsOnSameEdge (const Intf_SectionPoint & Other);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Intf_SectionPoint;
		 Intf_SectionPoint ();
		%feature("autodoc", "Args:
	Where(gp_Pnt)
	DimeO(Intf_PIType)
	AddrO1(Standard_Integer)
	AddrO2(Standard_Integer)
	ParamO(Standard_Real)
	DimeT(Intf_PIType)
	AddrT1(Standard_Integer)
	AddrT2(Standard_Integer)
	ParamT(Standard_Real)
	Incid(Standard_Real)

Returns:
	None

Builds  a  SectionPoint    with the  respective  dimensions  
         (vertex edge or face)  of the concerned arguments and their  
         addresses in the Topological structure.") Intf_SectionPoint;
		 Intf_SectionPoint (const gp_Pnt & Where,const Intf_PIType DimeO,const Standard_Integer AddrO1,const Standard_Integer AddrO2,const Standard_Real ParamO,const Intf_PIType DimeT,const Standard_Integer AddrT1,const Standard_Integer AddrT2,const Standard_Real ParamT,const Standard_Real Incid);
		%feature("autodoc", "Args:
	Where(gp_Pnt2d)
	DimeO(Intf_PIType)
	AddrO1(Standard_Integer)
	ParamO(Standard_Real)
	DimeT(Intf_PIType)
	AddrT1(Standard_Integer)
	ParamT(Standard_Real)
	Incid(Standard_Real)

Returns:
	None

Builds  a  SectionPoint 2d   with the respective dimensions  
         (vertex or  edge)  of  the concerned arguments   and  their  
         addresses in the Topological structure.") Intf_SectionPoint;
		 Intf_SectionPoint (const gp_Pnt2d & Where,const Intf_PIType DimeO,const Standard_Integer AddrO1,const Standard_Real ParamO,const Intf_PIType DimeT,const Standard_Integer AddrT1,const Standard_Real ParamT,const Standard_Real Incid);
		%feature("autodoc", "Args:
	Other(Intf_SectionPoint)

Returns:
	None

Merges two SectionPoints.") Merge;
		void Merge (Intf_SectionPoint & Other);
		%feature("autodoc", "Args:
	Indent(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Dump;
		void Dump (const Standard_Integer Indent);
};


%feature("shadow") Intf_SectionPoint::~Intf_SectionPoint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Intf_SectionPoint {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Intf_SeqOfSectionLine;
class Intf_SeqOfSectionLine : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Intf_SeqOfSectionLine;
		 Intf_SeqOfSectionLine ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Intf_SeqOfSectionLine)

Returns:
	Intf_SeqOfSectionLine

No detailed docstring for this function.") Assign;
		const Intf_SeqOfSectionLine & Assign (const Intf_SeqOfSectionLine & Other);
		%feature("autodoc", "Args:
	Other(Intf_SeqOfSectionLine)

Returns:
	Intf_SeqOfSectionLine

No detailed docstring for this function.") operator=;
		const Intf_SeqOfSectionLine & operator = (const Intf_SeqOfSectionLine & Other);
		%feature("autodoc", "Args:
	T(Intf_SectionLine)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Intf_SectionLine & T);
		%feature("autodoc", "Args:
	S(Intf_SeqOfSectionLine)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Intf_SeqOfSectionLine & S);
		%feature("autodoc", "Args:
	T(Intf_SectionLine)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Intf_SectionLine & T);
		%feature("autodoc", "Args:
	S(Intf_SeqOfSectionLine)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Intf_SeqOfSectionLine & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Intf_SectionLine)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Intf_SectionLine & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Intf_SeqOfSectionLine)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Intf_SeqOfSectionLine & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Intf_SectionLine)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Intf_SectionLine & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Intf_SeqOfSectionLine)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Intf_SeqOfSectionLine & S);
		%feature("autodoc", "Args:
	None
Returns:
	Intf_SectionLine

No detailed docstring for this function.") First;
		const Intf_SectionLine & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Intf_SectionLine

No detailed docstring for this function.") Last;
		const Intf_SectionLine & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Intf_SeqOfSectionLine)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Intf_SeqOfSectionLine & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Intf_SectionLine

No detailed docstring for this function.") Value;
		const Intf_SectionLine & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Intf_SectionLine)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Intf_SectionLine & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Intf_SectionLine

No detailed docstring for this function.") ChangeValue;
		Intf_SectionLine & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") Intf_SeqOfSectionLine::~Intf_SeqOfSectionLine %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Intf_SeqOfSectionLine {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Intf_SeqOfSectionPoint;
class Intf_SeqOfSectionPoint : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Intf_SeqOfSectionPoint;
		 Intf_SeqOfSectionPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Intf_SeqOfSectionPoint)

Returns:
	Intf_SeqOfSectionPoint

No detailed docstring for this function.") Assign;
		const Intf_SeqOfSectionPoint & Assign (const Intf_SeqOfSectionPoint & Other);
		%feature("autodoc", "Args:
	Other(Intf_SeqOfSectionPoint)

Returns:
	Intf_SeqOfSectionPoint

No detailed docstring for this function.") operator=;
		const Intf_SeqOfSectionPoint & operator = (const Intf_SeqOfSectionPoint & Other);
		%feature("autodoc", "Args:
	T(Intf_SectionPoint)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Intf_SectionPoint & T);
		%feature("autodoc", "Args:
	S(Intf_SeqOfSectionPoint)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Intf_SeqOfSectionPoint & S);
		%feature("autodoc", "Args:
	T(Intf_SectionPoint)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Intf_SectionPoint & T);
		%feature("autodoc", "Args:
	S(Intf_SeqOfSectionPoint)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Intf_SeqOfSectionPoint & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Intf_SectionPoint)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Intf_SectionPoint & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Intf_SeqOfSectionPoint)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Intf_SeqOfSectionPoint & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Intf_SectionPoint)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Intf_SectionPoint & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Intf_SeqOfSectionPoint)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Intf_SeqOfSectionPoint & S);
		%feature("autodoc", "Args:
	None
Returns:
	Intf_SectionPoint

No detailed docstring for this function.") First;
		const Intf_SectionPoint & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Intf_SectionPoint

No detailed docstring for this function.") Last;
		const Intf_SectionPoint & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Intf_SeqOfSectionPoint)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Intf_SeqOfSectionPoint & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Intf_SectionPoint

No detailed docstring for this function.") Value;
		const Intf_SectionPoint & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Intf_SectionPoint)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Intf_SectionPoint & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Intf_SectionPoint

No detailed docstring for this function.") ChangeValue;
		Intf_SectionPoint & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") Intf_SeqOfSectionPoint::~Intf_SeqOfSectionPoint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Intf_SeqOfSectionPoint {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Intf_SeqOfTangentZone;
class Intf_SeqOfTangentZone : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Intf_SeqOfTangentZone;
		 Intf_SeqOfTangentZone ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Intf_SeqOfTangentZone)

Returns:
	Intf_SeqOfTangentZone

No detailed docstring for this function.") Assign;
		const Intf_SeqOfTangentZone & Assign (const Intf_SeqOfTangentZone & Other);
		%feature("autodoc", "Args:
	Other(Intf_SeqOfTangentZone)

Returns:
	Intf_SeqOfTangentZone

No detailed docstring for this function.") operator=;
		const Intf_SeqOfTangentZone & operator = (const Intf_SeqOfTangentZone & Other);
		%feature("autodoc", "Args:
	T(Intf_TangentZone)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Intf_TangentZone & T);
		%feature("autodoc", "Args:
	S(Intf_SeqOfTangentZone)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Intf_SeqOfTangentZone & S);
		%feature("autodoc", "Args:
	T(Intf_TangentZone)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Intf_TangentZone & T);
		%feature("autodoc", "Args:
	S(Intf_SeqOfTangentZone)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Intf_SeqOfTangentZone & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Intf_TangentZone)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Intf_TangentZone & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Intf_SeqOfTangentZone)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Intf_SeqOfTangentZone & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Intf_TangentZone)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Intf_TangentZone & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Intf_SeqOfTangentZone)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Intf_SeqOfTangentZone & S);
		%feature("autodoc", "Args:
	None
Returns:
	Intf_TangentZone

No detailed docstring for this function.") First;
		const Intf_TangentZone & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Intf_TangentZone

No detailed docstring for this function.") Last;
		const Intf_TangentZone & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Intf_SeqOfTangentZone)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Intf_SeqOfTangentZone & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Intf_TangentZone

No detailed docstring for this function.") Value;
		const Intf_TangentZone & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Intf_TangentZone)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Intf_TangentZone & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Intf_TangentZone

No detailed docstring for this function.") ChangeValue;
		Intf_TangentZone & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") Intf_SeqOfTangentZone::~Intf_SeqOfTangentZone %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Intf_SeqOfTangentZone {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Intf_SequenceNodeOfSeqOfSectionLine;
class Intf_SequenceNodeOfSeqOfSectionLine : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Intf_SectionLine)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Intf_SequenceNodeOfSeqOfSectionLine;
		 Intf_SequenceNodeOfSeqOfSectionLine (const Intf_SectionLine & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Intf_SectionLine

No detailed docstring for this function.") Value;
		Intf_SectionLine & Value ();
};


%feature("shadow") Intf_SequenceNodeOfSeqOfSectionLine::~Intf_SequenceNodeOfSeqOfSectionLine %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Intf_SequenceNodeOfSeqOfSectionLine {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Intf_SequenceNodeOfSeqOfSectionLine {
	Handle_Intf_SequenceNodeOfSeqOfSectionLine GetHandle() {
	return *(Handle_Intf_SequenceNodeOfSeqOfSectionLine*) &$self;
	}
};

%nodefaultctor Handle_Intf_SequenceNodeOfSeqOfSectionLine;
class Handle_Intf_SequenceNodeOfSeqOfSectionLine : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Intf_SequenceNodeOfSeqOfSectionLine();
        Handle_Intf_SequenceNodeOfSeqOfSectionLine(const Handle_Intf_SequenceNodeOfSeqOfSectionLine &aHandle);
        Handle_Intf_SequenceNodeOfSeqOfSectionLine(const Intf_SequenceNodeOfSeqOfSectionLine *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Intf_SequenceNodeOfSeqOfSectionLine DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Intf_SequenceNodeOfSeqOfSectionLine {
    Intf_SequenceNodeOfSeqOfSectionLine* GetObject() {
    return (Intf_SequenceNodeOfSeqOfSectionLine*)$self->Access();
    }
};
%feature("shadow") Handle_Intf_SequenceNodeOfSeqOfSectionLine::~Handle_Intf_SequenceNodeOfSeqOfSectionLine %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Intf_SequenceNodeOfSeqOfSectionLine {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Intf_SequenceNodeOfSeqOfSectionPoint;
class Intf_SequenceNodeOfSeqOfSectionPoint : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Intf_SectionPoint)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Intf_SequenceNodeOfSeqOfSectionPoint;
		 Intf_SequenceNodeOfSeqOfSectionPoint (const Intf_SectionPoint & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Intf_SectionPoint

No detailed docstring for this function.") Value;
		Intf_SectionPoint & Value ();
};


%feature("shadow") Intf_SequenceNodeOfSeqOfSectionPoint::~Intf_SequenceNodeOfSeqOfSectionPoint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Intf_SequenceNodeOfSeqOfSectionPoint {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Intf_SequenceNodeOfSeqOfSectionPoint {
	Handle_Intf_SequenceNodeOfSeqOfSectionPoint GetHandle() {
	return *(Handle_Intf_SequenceNodeOfSeqOfSectionPoint*) &$self;
	}
};

%nodefaultctor Handle_Intf_SequenceNodeOfSeqOfSectionPoint;
class Handle_Intf_SequenceNodeOfSeqOfSectionPoint : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Intf_SequenceNodeOfSeqOfSectionPoint();
        Handle_Intf_SequenceNodeOfSeqOfSectionPoint(const Handle_Intf_SequenceNodeOfSeqOfSectionPoint &aHandle);
        Handle_Intf_SequenceNodeOfSeqOfSectionPoint(const Intf_SequenceNodeOfSeqOfSectionPoint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Intf_SequenceNodeOfSeqOfSectionPoint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Intf_SequenceNodeOfSeqOfSectionPoint {
    Intf_SequenceNodeOfSeqOfSectionPoint* GetObject() {
    return (Intf_SequenceNodeOfSeqOfSectionPoint*)$self->Access();
    }
};
%feature("shadow") Handle_Intf_SequenceNodeOfSeqOfSectionPoint::~Handle_Intf_SequenceNodeOfSeqOfSectionPoint %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Intf_SequenceNodeOfSeqOfSectionPoint {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Intf_SequenceNodeOfSeqOfTangentZone;
class Intf_SequenceNodeOfSeqOfTangentZone : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Intf_TangentZone)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Intf_SequenceNodeOfSeqOfTangentZone;
		 Intf_SequenceNodeOfSeqOfTangentZone (const Intf_TangentZone & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Intf_TangentZone

No detailed docstring for this function.") Value;
		Intf_TangentZone & Value ();
};


%feature("shadow") Intf_SequenceNodeOfSeqOfTangentZone::~Intf_SequenceNodeOfSeqOfTangentZone %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Intf_SequenceNodeOfSeqOfTangentZone {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Intf_SequenceNodeOfSeqOfTangentZone {
	Handle_Intf_SequenceNodeOfSeqOfTangentZone GetHandle() {
	return *(Handle_Intf_SequenceNodeOfSeqOfTangentZone*) &$self;
	}
};

%nodefaultctor Handle_Intf_SequenceNodeOfSeqOfTangentZone;
class Handle_Intf_SequenceNodeOfSeqOfTangentZone : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Intf_SequenceNodeOfSeqOfTangentZone();
        Handle_Intf_SequenceNodeOfSeqOfTangentZone(const Handle_Intf_SequenceNodeOfSeqOfTangentZone &aHandle);
        Handle_Intf_SequenceNodeOfSeqOfTangentZone(const Intf_SequenceNodeOfSeqOfTangentZone *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Intf_SequenceNodeOfSeqOfTangentZone DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Intf_SequenceNodeOfSeqOfTangentZone {
    Intf_SequenceNodeOfSeqOfTangentZone* GetObject() {
    return (Intf_SequenceNodeOfSeqOfTangentZone*)$self->Access();
    }
};
%feature("shadow") Handle_Intf_SequenceNodeOfSeqOfTangentZone::~Handle_Intf_SequenceNodeOfSeqOfTangentZone %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Intf_SequenceNodeOfSeqOfTangentZone {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Intf_TangentZone;
class Intf_TangentZone {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns number of SectionPoint in this TangentZone.") NumberOfPoints;
		Standard_Integer NumberOfPoints ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Intf_SectionPoint

Gives   the   SectionPoint   of  address  <Index>  in  the  
         TangentZone.") GetPoint;
		const Intf_SectionPoint & GetPoint (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Other(Intf_TangentZone)

Returns:
	Standard_Boolean

Compares two TangentZones.") IsEqual;
		Standard_Boolean IsEqual (const Intf_TangentZone & Other);
		%feature("autodoc", "Args:
	Other(Intf_TangentZone)

Returns:
	Standard_Boolean

No detailed docstring for this function.") operator==;
		Standard_Boolean operator == (const Intf_TangentZone & Other);
		%feature("autodoc", "Args:
	ThePI(Intf_SectionPoint)

Returns:
	Standard_Boolean

Checks if <ThePI> is in TangentZone.") Contains;
		Standard_Boolean Contains (const Intf_SectionPoint & ThePI);
		%feature("autodoc", "Args:
	paraMin(Standard_Real)
	paraMax(Standard_Real)

Returns:
	None

Gives  the parameter range of the  TangentZone on the first  
         argument of the Interference. (Usable only for polygon)") ParamOnFirst;
		void ParamOnFirst (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	paraMin(Standard_Real)
	paraMax(Standard_Real)

Returns:
	None

Gives the parameter range of the  TangentZone on the second  
         argument of the Interference. (Usable only for polygon)") ParamOnSecond;
		void ParamOnSecond (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	segMin(Standard_Integer)
	paraMin(Standard_Real)
	segMax(Standard_Integer)
	paraMax(Standard_Real)

Returns:
	None

Gives information  about  the    first argument   of   the  
         Interference. (Usable only for polygon)") InfoFirst;
		void InfoFirst (Standard_Integer &OutValue,Standard_Real &OutValue,Standard_Integer &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	segMin(Standard_Integer)
	paraMin(Standard_Real)
	segMax(Standard_Integer)
	paraMax(Standard_Real)

Returns:
	None

Gives   informations  about  the  second   argument of  the  
         Interference. (Usable only for polygon)") InfoSecond;
		void InfoSecond (Standard_Integer &OutValue,Standard_Real &OutValue,Standard_Integer &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	ThePI(Intf_SectionPoint)

Returns:
	Standard_Boolean

Returns True if  <ThePI>  is in the parameter  range of the  
         TangentZone.") RangeContains;
		Standard_Boolean RangeContains (const Intf_SectionPoint & ThePI);
		%feature("autodoc", "Args:
	Other(Intf_TangentZone)

Returns:
	Standard_Boolean

Returns True if the TangentZone  <Other> has  a common part  
         with <self>.") HasCommonRange;
		Standard_Boolean HasCommonRange (const Intf_TangentZone & Other);
		%feature("autodoc", "Args:
	None
Returns:
	None

Builds an empty tangent zone.") Intf_TangentZone;
		 Intf_TangentZone ();
		%feature("autodoc", "Args:
	Other(Intf_TangentZone)

Returns:
	None

Copies a Tangent zone.") Intf_TangentZone;
		 Intf_TangentZone (const Intf_TangentZone & Other);
		%feature("autodoc", "Args:
	Pi(Intf_SectionPoint)

Returns:
	None

Adds a SectionPoint to the TangentZone.") Append;
		void Append (const Intf_SectionPoint & Pi);
		%feature("autodoc", "Args:
	Tzi(Intf_TangentZone)

Returns:
	None

Adds the TangentZone <Tzi> to <self>.") Append;
		void Append (const Intf_TangentZone & Tzi);
		%feature("autodoc", "Args:
	Pi(Intf_SectionPoint)

Returns:
	Standard_Boolean

Inserts a SectionPoint in the TangentZone.") Insert;
		Standard_Boolean Insert (const Intf_SectionPoint & Pi);
		%feature("autodoc", "Args:
	Pi(Intf_SectionPoint)

Returns:
	None

Inserts a point in the polygonal TangentZone.") PolygonInsert;
		void PolygonInsert (const Intf_SectionPoint & Pi);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Pi(Intf_SectionPoint)

Returns:
	None

Inserts a SectionPoint before <Index> in the TangentZone.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Intf_SectionPoint & Pi);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Pi(Intf_SectionPoint)

Returns:
	None

Inserts a SectionPoint after <Index> in the TangentZone.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Intf_SectionPoint & Pi);
		%feature("autodoc", "Args:
	Indent(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Dump;
		void Dump (const Standard_Integer Indent);
};


%feature("shadow") Intf_TangentZone::~Intf_TangentZone %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Intf_TangentZone {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Intf_Tool;
class Intf_Tool {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Intf_Tool;
		 Intf_Tool ();
		%feature("autodoc", "Args:
	theLin2d(gp_Lin2d)
	bounding(Bnd_Box2d)
	boxLin(Bnd_Box2d)

Returns:
	None

No detailed docstring for this function.") Lin2dBox;
		void Lin2dBox (const gp_Lin2d & theLin2d,const Bnd_Box2d & bounding,Bnd_Box2d & boxLin);
		%feature("autodoc", "Args:
	theHypr2d(gp_Hypr2d)
	bounding(Bnd_Box2d)
	boxHypr(Bnd_Box2d)

Returns:
	None

No detailed docstring for this function.") Hypr2dBox;
		void Hypr2dBox (const gp_Hypr2d & theHypr2d,const Bnd_Box2d & bounding,Bnd_Box2d & boxHypr);
		%feature("autodoc", "Args:
	theParab2d(gp_Parab2d)
	bounding(Bnd_Box2d)
	boxHypr(Bnd_Box2d)

Returns:
	None

No detailed docstring for this function.") Parab2dBox;
		void Parab2dBox (const gp_Parab2d & theParab2d,const Bnd_Box2d & bounding,Bnd_Box2d & boxHypr);
		%feature("autodoc", "Args:
	theLin(gp_Lin)
	bounding(Bnd_Box)
	boxLin(Bnd_Box)

Returns:
	None

No detailed docstring for this function.") LinBox;
		void LinBox (const gp_Lin & theLin,const Bnd_Box & bounding,Bnd_Box & boxLin);
		%feature("autodoc", "Args:
	theHypr(gp_Hypr)
	bounding(Bnd_Box)
	boxHypr(Bnd_Box)

Returns:
	None

No detailed docstring for this function.") HyprBox;
		void HyprBox (const gp_Hypr & theHypr,const Bnd_Box & bounding,Bnd_Box & boxHypr);
		%feature("autodoc", "Args:
	theParab(gp_Parab)
	bounding(Bnd_Box)
	boxHypr(Bnd_Box)

Returns:
	None

No detailed docstring for this function.") ParabBox;
		void ParabBox (const gp_Parab & theParab,const Bnd_Box & bounding,Bnd_Box & boxHypr);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbSegments;
		Standard_Integer NbSegments ();
		%feature("autodoc", "Args:
	SegmentNum(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") BeginParam;
		Standard_Real BeginParam (const Standard_Integer SegmentNum);
		%feature("autodoc", "Args:
	SegmentNum(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") EndParam;
		Standard_Real EndParam (const Standard_Integer SegmentNum);
};


%feature("shadow") Intf_Tool::~Intf_Tool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Intf_Tool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Intf_InterferencePolygon2d;
class Intf_InterferencePolygon2d : public Intf_Interference {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Constructs an empty interference of Polygon.") Intf_InterferencePolygon2d;
		 Intf_InterferencePolygon2d ();
		%feature("autodoc", "Args:
	Obje1(Intf_Polygon2d)
	Obje2(Intf_Polygon2d)

Returns:
	None

Constructs and computes an interference between two Polygons.") Intf_InterferencePolygon2d;
		 Intf_InterferencePolygon2d (const Intf_Polygon2d & Obje1,const Intf_Polygon2d & Obje2);
		%feature("autodoc", "Args:
	Obje(Intf_Polygon2d)

Returns:
	None

Constructs and computes the auto interference of a Polygon.") Intf_InterferencePolygon2d;
		 Intf_InterferencePolygon2d (const Intf_Polygon2d & Obje);
		%feature("autodoc", "Args:
	Obje1(Intf_Polygon2d)
	Obje2(Intf_Polygon2d)

Returns:
	None

Computes an interference between two Polygons.") Perform;
		void Perform (const Intf_Polygon2d & Obje1,const Intf_Polygon2d & Obje2);
		%feature("autodoc", "Args:
	Obje(Intf_Polygon2d)

Returns:
	None

Computes the self interference of a Polygon.") Perform;
		void Perform (const Intf_Polygon2d & Obje);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Pnt2d

Gives the  geometrical 2d point   of the  intersection  
         point at address <Index> in the interference.") Pnt2dValue;
		gp_Pnt2d Pnt2dValue (const Standard_Integer Index);
};


%feature("shadow") Intf_InterferencePolygon2d::~Intf_InterferencePolygon2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Intf_InterferencePolygon2d {
	void _kill_pointed() {
		delete $self;
	}
};
