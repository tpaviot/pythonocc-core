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
		%feature("autodoc", "	* Computes the interference between two polygons in 2d. Result : points of intersections and zones of tangence. Computes the interference between two polygon in 3d. Section points, common perpendicular and projections. Computes the interference between a polygon or a straight line and a polyhedron. Points of intersection and zones of tangence. Compute the interference between two polyhedron. Points of intersection , polylines of intersection and zones of tangence. Give the plane equation of the triangle <P1> <P2> <P3>.

	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param P3:
	:type P3: gp_Pnt
	:param NormalVector:
	:type NormalVector: gp_XYZ
	:param PolarDistance:
	:type PolarDistance: float &
	:rtype: void
") PlaneEquation;
		static void PlaneEquation (const gp_Pnt & P1,const gp_Pnt & P2,const gp_Pnt & P3,gp_XYZ & NormalVector,Standard_Real &OutValue);
		%feature("autodoc", "	* Compute if the triangle <P1> <P2> <P3> contain <ThePnt>.

	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param P3:
	:type P3: gp_Pnt
	:param ThePnt:
	:type ThePnt: gp_Pnt
	:rtype: bool
") Contain;
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
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Intf_Array1OfLin;
		 Intf_Array1OfLin (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Item:
	:type Item: gp_Lin
	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Intf_Array1OfLin;
		 Intf_Array1OfLin (const gp_Lin & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param V:
	:type V: gp_Lin
	:rtype: None
") Init;
		void Init (const gp_Lin & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "	:param Other:
	:type Other: Intf_Array1OfLin &
	:rtype: Intf_Array1OfLin
") Assign;
		const Intf_Array1OfLin & Assign (const Intf_Array1OfLin & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Intf_Array1OfLin &
	:rtype: Intf_Array1OfLin
") operator=;
		const Intf_Array1OfLin & operator = (const Intf_Array1OfLin & Other);
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Value:
	:type Value: gp_Lin
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const gp_Lin & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: gp_Lin
") Value;
		const gp_Lin  Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: gp_Lin
") ChangeValue;
		gp_Lin  ChangeValue (const Standard_Integer Index);
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
		%feature("autodoc", "	* Gives the number of points of intersection in the interference.

	:rtype: int
") NbSectionPoints;
		Standard_Integer NbSectionPoints ();
		%feature("autodoc", "	* Gives the point of intersection of address Index in the interference.

	:param Index:
	:type Index: Standard_Integer
	:rtype: Intf_SectionPoint
") PntValue;
		const Intf_SectionPoint & PntValue (const Standard_Integer Index);
		%feature("autodoc", "	* Gives the number of polylines of intersection in the interference.

	:rtype: int
") NbSectionLines;
		Standard_Integer NbSectionLines ();
		%feature("autodoc", "	* Gives the polyline of intersection at address <Index> in the interference.

	:param Index:
	:type Index: Standard_Integer
	:rtype: Intf_SectionLine
") LineValue;
		const Intf_SectionLine & LineValue (const Standard_Integer Index);
		%feature("autodoc", "	* Gives the number of zones of tangence in the interference.

	:rtype: int
") NbTangentZones;
		Standard_Integer NbTangentZones ();
		%feature("autodoc", "	* Gives the zone of tangence at address Index in the interference.

	:param Index:
	:type Index: Standard_Integer
	:rtype: Intf_TangentZone
") ZoneValue;
		const Intf_TangentZone & ZoneValue (const Standard_Integer Index);
		%feature("autodoc", "	* Gives the tolerance used for the calculation.

	:rtype: float
") GetTolerance;
		Standard_Real GetTolerance ();
		%feature("autodoc", "	* Tests if the polylines of intersection or the zones of tangence contain the point of intersection <ThePnt>.

	:param ThePnt:
	:type ThePnt: Intf_SectionPoint &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Intf_SectionPoint & ThePnt);
		%feature("autodoc", "	* Inserts a new zone of tangence in the current list of tangent zones of the interference and returns True when done.

	:param TheZone:
	:type TheZone: Intf_TangentZone &
	:rtype: bool
") Insert;
		Standard_Boolean Insert (const Intf_TangentZone & TheZone);
		%feature("autodoc", "	* Insert a new segment of intersection in the current list of polylines of intersection of the interference.

	:param pdeb:
	:type pdeb: Intf_SectionPoint &
	:param pfin:
	:type pfin: Intf_SectionPoint &
	:rtype: None
") Insert;
		void Insert (const Intf_SectionPoint & pdeb,const Intf_SectionPoint & pfin);
		%feature("autodoc", "	:rtype: None
") Dump;
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
		%feature("autodoc", "	* Returns the bounding box of the polygon.

	:rtype: Bnd_Box2d
") Bounding;
		const Bnd_Box2d & Bounding ();
		%feature("autodoc", "	* Returns True if the polyline is closed.

	:rtype: bool
") Closed;
		virtual Standard_Boolean Closed ();
		%feature("autodoc", "	* Returns the tolerance of the polygon.

	:rtype: float
") DeflectionOverEstimation;
		virtual Standard_Real DeflectionOverEstimation ();
		%feature("autodoc", "	* Returns the number of Segments in the polyline.

	:rtype: int
") NbSegments;
		virtual Standard_Integer NbSegments ();
		%feature("autodoc", "	* Returns the points of the segment <Index> in the Polygon.

	:param theIndex:
	:type theIndex: Standard_Integer
	:param theBegin:
	:type theBegin: gp_Pnt2d
	:param theEnd:
	:type theEnd: gp_Pnt2d
	:rtype: void
") Segment;
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
		%feature("autodoc", "	* Returns number of points in this SectionLine.

	:rtype: int
") NumberOfPoints;
		Standard_Integer NumberOfPoints ();
		%feature("autodoc", "	* Gives the point of intersection of address <Index> in the SectionLine.

	:param Index:
	:type Index: Standard_Integer
	:rtype: Intf_SectionPoint
") GetPoint;
		const Intf_SectionPoint & GetPoint (const Standard_Integer Index);
		%feature("autodoc", "	* Returns True if the SectionLine is closed.

	:rtype: bool
") IsClosed;
		Standard_Boolean IsClosed ();
		%feature("autodoc", "	* Returns True if ThePI is in the SectionLine <self>.

	:param ThePI:
	:type ThePI: Intf_SectionPoint &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Intf_SectionPoint & ThePI);
		%feature("autodoc", "	* Checks if <ThePI> is an end of the SectionLine. Returns 1 for the beginning, 2 for the end, otherwise 0.

	:param ThePI:
	:type ThePI: Intf_SectionPoint &
	:rtype: int
") IsEnd;
		Standard_Integer IsEnd (const Intf_SectionPoint & ThePI);
		%feature("autodoc", "	* Compares two SectionLines.

	:param Other:
	:type Other: Intf_SectionLine &
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const Intf_SectionLine & Other);

        %extend{
            bool __eq_wrapper__(const Intf_SectionLine  other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self,right):
            try:
                return self.__eq_wrapper__(right)
            except:
                return False
        }
        		%feature("autodoc", "	* Constructs an empty SectionLine.

	:rtype: None
") Intf_SectionLine;
		 Intf_SectionLine ();
		%feature("autodoc", "	* Copies a SectionLine.

	:param Other:
	:type Other: Intf_SectionLine &
	:rtype: None
") Intf_SectionLine;
		 Intf_SectionLine (const Intf_SectionLine & Other);
		%feature("autodoc", "	* Adds a point at the end of the SectionLine.

	:param Pi:
	:type Pi: Intf_SectionPoint &
	:rtype: None
") Append;
		void Append (const Intf_SectionPoint & Pi);
		%feature("autodoc", "	* Concatenates the SectionLine <LS> at the end of the SectionLine <self>.

	:param LS:
	:type LS: Intf_SectionLine &
	:rtype: None
") Append;
		void Append (Intf_SectionLine & LS);
		%feature("autodoc", "	* Adds a point to the beginning of the SectionLine <self>.

	:param Pi:
	:type Pi: Intf_SectionPoint &
	:rtype: None
") Prepend;
		void Prepend (const Intf_SectionPoint & Pi);
		%feature("autodoc", "	* Concatenates a SectionLine <LS> at the beginning of the SectionLine <self>.

	:param LS:
	:type LS: Intf_SectionLine &
	:rtype: None
") Prepend;
		void Prepend (Intf_SectionLine & LS);
		%feature("autodoc", "	* Reverses the order of the elements of the SectionLine.

	:rtype: None
") Reverse;
		void Reverse ();
		%feature("autodoc", "	* Closes the SectionLine.

	:rtype: None
") Close;
		void Close ();
		%feature("autodoc", "	:param Indent:
	:type Indent: Standard_Integer
	:rtype: None
") Dump;
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
		%feature("autodoc", "	* Returns the location of the SectionPoint.

	:rtype: gp_Pnt
") Pnt;
		const gp_Pnt  Pnt ();
		%feature("autodoc", "	* Returns the cumulated Parameter of the SectionPoint on the first element.

	:rtype: float
") ParamOnFirst;
		Standard_Real ParamOnFirst ();
		%feature("autodoc", "	* Returns the cumulated Parameter of the section point on the second element.

	:rtype: float
") ParamOnSecond;
		Standard_Real ParamOnSecond ();
		%feature("autodoc", "	* Returns the type of the section point on the first element.

	:rtype: Intf_PIType
") TypeOnFirst;
		Intf_PIType TypeOnFirst ();
		%feature("autodoc", "	* Returns the type of the section point on the second element.

	:rtype: Intf_PIType
") TypeOnSecond;
		Intf_PIType TypeOnSecond ();
		%feature("autodoc", "	:param Dim:
	:type Dim: Intf_PIType &
	:param Add1:
	:type Add1: Standard_Integer &
	:param Add2:
	:type Add2: Standard_Integer &
	:param Param:
	:type Param: float &
	:rtype: None
") InfoFirst;
		void InfoFirst (Intf_PIType & Dim,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	* Gives the datas about the first argument of the Interference.

	:param Dim:
	:type Dim: Intf_PIType &
	:param Addr:
	:type Addr: Standard_Integer &
	:param Param:
	:type Param: float &
	:rtype: None
") InfoFirst;
		void InfoFirst (Intf_PIType & Dim,Standard_Integer &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:param Dim:
	:type Dim: Intf_PIType &
	:param Add1:
	:type Add1: Standard_Integer &
	:param Add2:
	:type Add2: Standard_Integer &
	:param Param:
	:type Param: float &
	:rtype: None
") InfoSecond;
		void InfoSecond (Intf_PIType & Dim,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	* Gives the datas about the second argument of the Interference.

	:param Dim:
	:type Dim: Intf_PIType &
	:param Addr:
	:type Addr: Standard_Integer &
	:param Param:
	:type Param: float &
	:rtype: None
") InfoSecond;
		void InfoSecond (Intf_PIType & Dim,Standard_Integer &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	* Gives the incidence at this section point. The incidence between the two triangles is given by the cosine. The best incidence is 0. (PI/2). The worst is 1. (null angle).

	:rtype: float
") Incidence;
		Standard_Real Incidence ();
		%feature("autodoc", "	* Returns True if the two SectionPoint have the same logical informations.

	:param Other:
	:type Other: Intf_SectionPoint &
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const Intf_SectionPoint & Other);

        %extend{
            bool __eq_wrapper__(const Intf_SectionPoint  other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self,right):
            try:
                return self.__eq_wrapper__(right)
            except:
                return False
        }
        		%feature("autodoc", "	* Returns True if the two SectionPoints are on the same edge of the first or the second element.

	:param Other:
	:type Other: Intf_SectionPoint &
	:rtype: bool
") IsOnSameEdge;
		Standard_Boolean IsOnSameEdge (const Intf_SectionPoint & Other);
		%feature("autodoc", "	:rtype: None
") Intf_SectionPoint;
		 Intf_SectionPoint ();
		%feature("autodoc", "	* Builds a SectionPoint with the respective dimensions (vertex edge or face) of the concerned arguments and their addresses in the Topological structure.

	:param Where:
	:type Where: gp_Pnt
	:param DimeO:
	:type DimeO: Intf_PIType
	:param AddrO1:
	:type AddrO1: Standard_Integer
	:param AddrO2:
	:type AddrO2: Standard_Integer
	:param ParamO:
	:type ParamO: float
	:param DimeT:
	:type DimeT: Intf_PIType
	:param AddrT1:
	:type AddrT1: Standard_Integer
	:param AddrT2:
	:type AddrT2: Standard_Integer
	:param ParamT:
	:type ParamT: float
	:param Incid:
	:type Incid: float
	:rtype: None
") Intf_SectionPoint;
		 Intf_SectionPoint (const gp_Pnt & Where,const Intf_PIType DimeO,const Standard_Integer AddrO1,const Standard_Integer AddrO2,const Standard_Real ParamO,const Intf_PIType DimeT,const Standard_Integer AddrT1,const Standard_Integer AddrT2,const Standard_Real ParamT,const Standard_Real Incid);
		%feature("autodoc", "	* Builds a SectionPoint 2d with the respective dimensions (vertex or edge) of the concerned arguments and their addresses in the Topological structure.

	:param Where:
	:type Where: gp_Pnt2d
	:param DimeO:
	:type DimeO: Intf_PIType
	:param AddrO1:
	:type AddrO1: Standard_Integer
	:param ParamO:
	:type ParamO: float
	:param DimeT:
	:type DimeT: Intf_PIType
	:param AddrT1:
	:type AddrT1: Standard_Integer
	:param ParamT:
	:type ParamT: float
	:param Incid:
	:type Incid: float
	:rtype: None
") Intf_SectionPoint;
		 Intf_SectionPoint (const gp_Pnt2d & Where,const Intf_PIType DimeO,const Standard_Integer AddrO1,const Standard_Real ParamO,const Intf_PIType DimeT,const Standard_Integer AddrT1,const Standard_Real ParamT,const Standard_Real Incid);
		%feature("autodoc", "	* Merges two SectionPoints.

	:param Other:
	:type Other: Intf_SectionPoint &
	:rtype: None
") Merge;
		void Merge (Intf_SectionPoint & Other);
		%feature("autodoc", "	:param Indent:
	:type Indent: Standard_Integer
	:rtype: None
") Dump;
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
		%feature("autodoc", "	:rtype: None
") Intf_SeqOfSectionLine;
		 Intf_SeqOfSectionLine ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Intf_SeqOfSectionLine &
	:rtype: Intf_SeqOfSectionLine
") Assign;
		const Intf_SeqOfSectionLine & Assign (const Intf_SeqOfSectionLine & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Intf_SeqOfSectionLine &
	:rtype: Intf_SeqOfSectionLine
") operator=;
		const Intf_SeqOfSectionLine & operator = (const Intf_SeqOfSectionLine & Other);
		%feature("autodoc", "	:param T:
	:type T: Intf_SectionLine &
	:rtype: None
") Append;
		void Append (const Intf_SectionLine & T);
		%feature("autodoc", "	:param S:
	:type S: Intf_SeqOfSectionLine &
	:rtype: None
") Append;
		void Append (Intf_SeqOfSectionLine & S);
		%feature("autodoc", "	:param T:
	:type T: Intf_SectionLine &
	:rtype: None
") Prepend;
		void Prepend (const Intf_SectionLine & T);
		%feature("autodoc", "	:param S:
	:type S: Intf_SeqOfSectionLine &
	:rtype: None
") Prepend;
		void Prepend (Intf_SeqOfSectionLine & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Intf_SectionLine &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Intf_SectionLine & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Intf_SeqOfSectionLine &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Intf_SeqOfSectionLine & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Intf_SectionLine &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Intf_SectionLine & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Intf_SeqOfSectionLine &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Intf_SeqOfSectionLine & S);
		%feature("autodoc", "	:rtype: Intf_SectionLine
") First;
		const Intf_SectionLine & First ();
		%feature("autodoc", "	:rtype: Intf_SectionLine
") Last;
		const Intf_SectionLine & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Intf_SeqOfSectionLine &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Intf_SeqOfSectionLine & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Intf_SectionLine
") Value;
		const Intf_SectionLine & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Intf_SectionLine &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Intf_SectionLine & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Intf_SectionLine
") ChangeValue;
		Intf_SectionLine & ChangeValue (const Standard_Integer Index);
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
		%feature("autodoc", "	:rtype: None
") Intf_SeqOfSectionPoint;
		 Intf_SeqOfSectionPoint ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Intf_SeqOfSectionPoint &
	:rtype: Intf_SeqOfSectionPoint
") Assign;
		const Intf_SeqOfSectionPoint & Assign (const Intf_SeqOfSectionPoint & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Intf_SeqOfSectionPoint &
	:rtype: Intf_SeqOfSectionPoint
") operator=;
		const Intf_SeqOfSectionPoint & operator = (const Intf_SeqOfSectionPoint & Other);
		%feature("autodoc", "	:param T:
	:type T: Intf_SectionPoint &
	:rtype: None
") Append;
		void Append (const Intf_SectionPoint & T);
		%feature("autodoc", "	:param S:
	:type S: Intf_SeqOfSectionPoint &
	:rtype: None
") Append;
		void Append (Intf_SeqOfSectionPoint & S);
		%feature("autodoc", "	:param T:
	:type T: Intf_SectionPoint &
	:rtype: None
") Prepend;
		void Prepend (const Intf_SectionPoint & T);
		%feature("autodoc", "	:param S:
	:type S: Intf_SeqOfSectionPoint &
	:rtype: None
") Prepend;
		void Prepend (Intf_SeqOfSectionPoint & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Intf_SectionPoint &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Intf_SectionPoint & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Intf_SeqOfSectionPoint &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Intf_SeqOfSectionPoint & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Intf_SectionPoint &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Intf_SectionPoint & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Intf_SeqOfSectionPoint &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Intf_SeqOfSectionPoint & S);
		%feature("autodoc", "	:rtype: Intf_SectionPoint
") First;
		const Intf_SectionPoint & First ();
		%feature("autodoc", "	:rtype: Intf_SectionPoint
") Last;
		const Intf_SectionPoint & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Intf_SeqOfSectionPoint &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Intf_SeqOfSectionPoint & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Intf_SectionPoint
") Value;
		const Intf_SectionPoint & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Intf_SectionPoint &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Intf_SectionPoint & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Intf_SectionPoint
") ChangeValue;
		Intf_SectionPoint & ChangeValue (const Standard_Integer Index);
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
		%feature("autodoc", "	:rtype: None
") Intf_SeqOfTangentZone;
		 Intf_SeqOfTangentZone ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Intf_SeqOfTangentZone &
	:rtype: Intf_SeqOfTangentZone
") Assign;
		const Intf_SeqOfTangentZone & Assign (const Intf_SeqOfTangentZone & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Intf_SeqOfTangentZone &
	:rtype: Intf_SeqOfTangentZone
") operator=;
		const Intf_SeqOfTangentZone & operator = (const Intf_SeqOfTangentZone & Other);
		%feature("autodoc", "	:param T:
	:type T: Intf_TangentZone &
	:rtype: None
") Append;
		void Append (const Intf_TangentZone & T);
		%feature("autodoc", "	:param S:
	:type S: Intf_SeqOfTangentZone &
	:rtype: None
") Append;
		void Append (Intf_SeqOfTangentZone & S);
		%feature("autodoc", "	:param T:
	:type T: Intf_TangentZone &
	:rtype: None
") Prepend;
		void Prepend (const Intf_TangentZone & T);
		%feature("autodoc", "	:param S:
	:type S: Intf_SeqOfTangentZone &
	:rtype: None
") Prepend;
		void Prepend (Intf_SeqOfTangentZone & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Intf_TangentZone &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Intf_TangentZone & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Intf_SeqOfTangentZone &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Intf_SeqOfTangentZone & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Intf_TangentZone &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Intf_TangentZone & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Intf_SeqOfTangentZone &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Intf_SeqOfTangentZone & S);
		%feature("autodoc", "	:rtype: Intf_TangentZone
") First;
		const Intf_TangentZone & First ();
		%feature("autodoc", "	:rtype: Intf_TangentZone
") Last;
		const Intf_TangentZone & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Intf_SeqOfTangentZone &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Intf_SeqOfTangentZone & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Intf_TangentZone
") Value;
		const Intf_TangentZone & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Intf_TangentZone &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Intf_TangentZone & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Intf_TangentZone
") ChangeValue;
		Intf_TangentZone & ChangeValue (const Standard_Integer Index);
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
		%feature("autodoc", "	:param I:
	:type I: Intf_SectionLine &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Intf_SequenceNodeOfSeqOfSectionLine;
		 Intf_SequenceNodeOfSeqOfSectionLine (const Intf_SectionLine & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Intf_SectionLine
") Value;
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
		%feature("autodoc", "	:param I:
	:type I: Intf_SectionPoint &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Intf_SequenceNodeOfSeqOfSectionPoint;
		 Intf_SequenceNodeOfSeqOfSectionPoint (const Intf_SectionPoint & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Intf_SectionPoint
") Value;
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
		%feature("autodoc", "	:param I:
	:type I: Intf_TangentZone &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Intf_SequenceNodeOfSeqOfTangentZone;
		 Intf_SequenceNodeOfSeqOfTangentZone (const Intf_TangentZone & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Intf_TangentZone
") Value;
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
		%feature("autodoc", "	* Returns number of SectionPoint in this TangentZone.

	:rtype: int
") NumberOfPoints;
		Standard_Integer NumberOfPoints ();
		%feature("autodoc", "	* Gives the SectionPoint of address <Index> in the TangentZone.

	:param Index:
	:type Index: Standard_Integer
	:rtype: Intf_SectionPoint
") GetPoint;
		const Intf_SectionPoint & GetPoint (const Standard_Integer Index);
		%feature("autodoc", "	* Compares two TangentZones.

	:param Other:
	:type Other: Intf_TangentZone &
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const Intf_TangentZone & Other);

        %extend{
            bool __eq_wrapper__(const Intf_TangentZone  other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self,right):
            try:
                return self.__eq_wrapper__(right)
            except:
                return False
        }
        		%feature("autodoc", "	* Checks if <ThePI> is in TangentZone.

	:param ThePI:
	:type ThePI: Intf_SectionPoint &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Intf_SectionPoint & ThePI);
		%feature("autodoc", "	* Gives the parameter range of the TangentZone on the first argument of the Interference. (Usable only for polygon)

	:param paraMin:
	:type paraMin: float &
	:param paraMax:
	:type paraMax: float &
	:rtype: None
") ParamOnFirst;
		void ParamOnFirst (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	* Gives the parameter range of the TangentZone on the second argument of the Interference. (Usable only for polygon)

	:param paraMin:
	:type paraMin: float &
	:param paraMax:
	:type paraMax: float &
	:rtype: None
") ParamOnSecond;
		void ParamOnSecond (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	* Gives information about the first argument of the Interference. (Usable only for polygon)

	:param segMin:
	:type segMin: Standard_Integer &
	:param paraMin:
	:type paraMin: float &
	:param segMax:
	:type segMax: Standard_Integer &
	:param paraMax:
	:type paraMax: float &
	:rtype: None
") InfoFirst;
		void InfoFirst (Standard_Integer &OutValue,Standard_Real &OutValue,Standard_Integer &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	* Gives informations about the second argument of the Interference. (Usable only for polygon)

	:param segMin:
	:type segMin: Standard_Integer &
	:param paraMin:
	:type paraMin: float &
	:param segMax:
	:type segMax: Standard_Integer &
	:param paraMax:
	:type paraMax: float &
	:rtype: None
") InfoSecond;
		void InfoSecond (Standard_Integer &OutValue,Standard_Real &OutValue,Standard_Integer &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	* Returns True if <ThePI> is in the parameter range of the TangentZone.

	:param ThePI:
	:type ThePI: Intf_SectionPoint &
	:rtype: bool
") RangeContains;
		Standard_Boolean RangeContains (const Intf_SectionPoint & ThePI);
		%feature("autodoc", "	* Returns True if the TangentZone <Other> has a common part with <self>.

	:param Other:
	:type Other: Intf_TangentZone &
	:rtype: bool
") HasCommonRange;
		Standard_Boolean HasCommonRange (const Intf_TangentZone & Other);
		%feature("autodoc", "	* Builds an empty tangent zone.

	:rtype: None
") Intf_TangentZone;
		 Intf_TangentZone ();
		%feature("autodoc", "	* Copies a Tangent zone.

	:param Other:
	:type Other: Intf_TangentZone &
	:rtype: None
") Intf_TangentZone;
		 Intf_TangentZone (const Intf_TangentZone & Other);
		%feature("autodoc", "	* Adds a SectionPoint to the TangentZone.

	:param Pi:
	:type Pi: Intf_SectionPoint &
	:rtype: None
") Append;
		void Append (const Intf_SectionPoint & Pi);
		%feature("autodoc", "	* Adds the TangentZone <Tzi> to <self>.

	:param Tzi:
	:type Tzi: Intf_TangentZone &
	:rtype: None
") Append;
		void Append (const Intf_TangentZone & Tzi);
		%feature("autodoc", "	* Inserts a SectionPoint in the TangentZone.

	:param Pi:
	:type Pi: Intf_SectionPoint &
	:rtype: bool
") Insert;
		Standard_Boolean Insert (const Intf_SectionPoint & Pi);
		%feature("autodoc", "	* Inserts a point in the polygonal TangentZone.

	:param Pi:
	:type Pi: Intf_SectionPoint &
	:rtype: None
") PolygonInsert;
		void PolygonInsert (const Intf_SectionPoint & Pi);
		%feature("autodoc", "	* Inserts a SectionPoint before <Index> in the TangentZone.

	:param Index:
	:type Index: Standard_Integer
	:param Pi:
	:type Pi: Intf_SectionPoint &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Intf_SectionPoint & Pi);
		%feature("autodoc", "	* Inserts a SectionPoint after <Index> in the TangentZone.

	:param Index:
	:type Index: Standard_Integer
	:param Pi:
	:type Pi: Intf_SectionPoint &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Intf_SectionPoint & Pi);
		%feature("autodoc", "	:param Indent:
	:type Indent: Standard_Integer
	:rtype: None
") Dump;
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
		%feature("autodoc", "	:rtype: None
") Intf_Tool;
		 Intf_Tool ();
		%feature("autodoc", "	:param theLin2d:
	:type theLin2d: gp_Lin2d
	:param bounding:
	:type bounding: Bnd_Box2d &
	:param boxLin:
	:type boxLin: Bnd_Box2d &
	:rtype: None
") Lin2dBox;
		void Lin2dBox (const gp_Lin2d & theLin2d,const Bnd_Box2d & bounding,Bnd_Box2d & boxLin);
		%feature("autodoc", "	:param theHypr2d:
	:type theHypr2d: gp_Hypr2d
	:param bounding:
	:type bounding: Bnd_Box2d &
	:param boxHypr:
	:type boxHypr: Bnd_Box2d &
	:rtype: None
") Hypr2dBox;
		void Hypr2dBox (const gp_Hypr2d & theHypr2d,const Bnd_Box2d & bounding,Bnd_Box2d & boxHypr);
		%feature("autodoc", "	:param theParab2d:
	:type theParab2d: gp_Parab2d
	:param bounding:
	:type bounding: Bnd_Box2d &
	:param boxHypr:
	:type boxHypr: Bnd_Box2d &
	:rtype: None
") Parab2dBox;
		void Parab2dBox (const gp_Parab2d & theParab2d,const Bnd_Box2d & bounding,Bnd_Box2d & boxHypr);
		%feature("autodoc", "	:param theLin:
	:type theLin: gp_Lin
	:param bounding:
	:type bounding: Bnd_Box &
	:param boxLin:
	:type boxLin: Bnd_Box &
	:rtype: None
") LinBox;
		void LinBox (const gp_Lin & theLin,const Bnd_Box & bounding,Bnd_Box & boxLin);
		%feature("autodoc", "	:param theHypr:
	:type theHypr: gp_Hypr
	:param bounding:
	:type bounding: Bnd_Box &
	:param boxHypr:
	:type boxHypr: Bnd_Box &
	:rtype: None
") HyprBox;
		void HyprBox (const gp_Hypr & theHypr,const Bnd_Box & bounding,Bnd_Box & boxHypr);
		%feature("autodoc", "	:param theParab:
	:type theParab: gp_Parab
	:param bounding:
	:type bounding: Bnd_Box &
	:param boxHypr:
	:type boxHypr: Bnd_Box &
	:rtype: None
") ParabBox;
		void ParabBox (const gp_Parab & theParab,const Bnd_Box & bounding,Bnd_Box & boxHypr);
		%feature("autodoc", "	:rtype: int
") NbSegments;
		Standard_Integer NbSegments ();
		%feature("autodoc", "	:param SegmentNum:
	:type SegmentNum: Standard_Integer
	:rtype: float
") BeginParam;
		Standard_Real BeginParam (const Standard_Integer SegmentNum);
		%feature("autodoc", "	:param SegmentNum:
	:type SegmentNum: Standard_Integer
	:rtype: float
") EndParam;
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
		%feature("autodoc", "	* Constructs an empty interference of Polygon.

	:rtype: None
") Intf_InterferencePolygon2d;
		 Intf_InterferencePolygon2d ();
		%feature("autodoc", "	* Constructs and computes an interference between two Polygons.

	:param Obje1:
	:type Obje1: Intf_Polygon2d &
	:param Obje2:
	:type Obje2: Intf_Polygon2d &
	:rtype: None
") Intf_InterferencePolygon2d;
		 Intf_InterferencePolygon2d (const Intf_Polygon2d & Obje1,const Intf_Polygon2d & Obje2);
		%feature("autodoc", "	* Constructs and computes the auto interference of a Polygon.

	:param Obje:
	:type Obje: Intf_Polygon2d &
	:rtype: None
") Intf_InterferencePolygon2d;
		 Intf_InterferencePolygon2d (const Intf_Polygon2d & Obje);
		%feature("autodoc", "	* Computes an interference between two Polygons.

	:param Obje1:
	:type Obje1: Intf_Polygon2d &
	:param Obje2:
	:type Obje2: Intf_Polygon2d &
	:rtype: None
") Perform;
		void Perform (const Intf_Polygon2d & Obje1,const Intf_Polygon2d & Obje2);
		%feature("autodoc", "	* Computes the self interference of a Polygon.

	:param Obje:
	:type Obje: Intf_Polygon2d &
	:rtype: None
") Perform;
		void Perform (const Intf_Polygon2d & Obje);
		%feature("autodoc", "	* Gives the geometrical 2d point of the intersection point at address <Index> in the interference.

	:param Index:
	:type Index: Standard_Integer
	:rtype: gp_Pnt2d
") Pnt2dValue;
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
