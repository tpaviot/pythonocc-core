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
%module (package="OCC") Intf

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


%include Intf_headers.i


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
class Intf {
	public:
		%feature("compactdefaultargs") PlaneEquation;
		%feature("autodoc", "	* Computes the interference between two polygons in 2d. Result : points of intersections and zones of tangence. Computes the interference between a polygon or a straight line and a polyhedron. Points of intersection and zones of tangence. Give the plane equation of the triangle <P1> <P2> <P3>.

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
		%feature("compactdefaultargs") Contain;
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


%extend Intf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Intf_Array1OfLin;
class Intf_Array1OfLin {
	public:
		%feature("compactdefaultargs") Intf_Array1OfLin;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") Intf_Array1OfLin;
		 Intf_Array1OfLin (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Intf_Array1OfLin;
		%feature("autodoc", "	:param Item:
	:type Item: gp_Lin
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") Intf_Array1OfLin;
		 Intf_Array1OfLin (const gp_Lin & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: gp_Lin
	:rtype: None
") Init;
		void Init (const gp_Lin & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Intf_Array1OfLin &
	:rtype: Intf_Array1OfLin
") Assign;
		const Intf_Array1OfLin & Assign (const Intf_Array1OfLin & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Intf_Array1OfLin &
	:rtype: Intf_Array1OfLin
") operator =;
		const Intf_Array1OfLin & operator = (const Intf_Array1OfLin & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: gp_Lin
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const gp_Lin & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Lin
") Value;
		const gp_Lin  Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Lin
") ChangeValue;
		gp_Lin  ChangeValue (const Standard_Integer Index);
};


%extend Intf_Array1OfLin {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Intf_Interference;
class Intf_Interference {
	public:
		%feature("compactdefaultargs") NbSectionPoints;
		%feature("autodoc", "	* Gives the number of points of intersection in the interference.

	:rtype: int
") NbSectionPoints;
		Standard_Integer NbSectionPoints ();
		%feature("compactdefaultargs") PntValue;
		%feature("autodoc", "	* Gives the point of intersection of address Index in the interference.

	:param Index:
	:type Index: int
	:rtype: Intf_SectionPoint
") PntValue;
		const Intf_SectionPoint & PntValue (const Standard_Integer Index);
		%feature("compactdefaultargs") NbSectionLines;
		%feature("autodoc", "	* Gives the number of polylines of intersection in the interference.

	:rtype: int
") NbSectionLines;
		Standard_Integer NbSectionLines ();
		%feature("compactdefaultargs") LineValue;
		%feature("autodoc", "	* Gives the polyline of intersection at address <Index> in the interference.

	:param Index:
	:type Index: int
	:rtype: Intf_SectionLine
") LineValue;
		const Intf_SectionLine & LineValue (const Standard_Integer Index);
		%feature("compactdefaultargs") NbTangentZones;
		%feature("autodoc", "	* Gives the number of zones of tangence in the interference.

	:rtype: int
") NbTangentZones;
		Standard_Integer NbTangentZones ();
		%feature("compactdefaultargs") ZoneValue;
		%feature("autodoc", "	* Gives the zone of tangence at address Index in the interference.

	:param Index:
	:type Index: int
	:rtype: Intf_TangentZone
") ZoneValue;
		const Intf_TangentZone & ZoneValue (const Standard_Integer Index);
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "	* Gives the tolerance used for the calculation.

	:rtype: float
") GetTolerance;
		Standard_Real GetTolerance ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	* Tests if the polylines of intersection or the zones of tangence contain the point of intersection <ThePnt>.

	:param ThePnt:
	:type ThePnt: Intf_SectionPoint &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Intf_SectionPoint & ThePnt);
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "	* Inserts a new zone of tangence in the current list of tangent zones of the interference and returns True when done.

	:param TheZone:
	:type TheZone: Intf_TangentZone &
	:rtype: bool
") Insert;
		Standard_Boolean Insert (const Intf_TangentZone & TheZone);
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "	* Insert a new segment of intersection in the current list of polylines of intersection of the interference.

	:param pdeb:
	:type pdeb: Intf_SectionPoint &
	:param pfin:
	:type pfin: Intf_SectionPoint &
	:rtype: None
") Insert;
		void Insert (const Intf_SectionPoint & pdeb,const Intf_SectionPoint & pfin);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:rtype: None
") Dump;
		void Dump ();
};


%extend Intf_Interference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Intf_Polygon2d;
class Intf_Polygon2d {
	public:
		%feature("compactdefaultargs") Bounding;
		%feature("autodoc", "	* Returns the bounding box of the polygon.

	:rtype: Bnd_Box2d
") Bounding;
		const Bnd_Box2d & Bounding ();
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "	* Returns True if the polyline is closed.

	:rtype: bool
") Closed;
		virtual Standard_Boolean Closed ();
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "	* Returns the tolerance of the polygon.

	:rtype: float
") DeflectionOverEstimation;
		virtual Standard_Real DeflectionOverEstimation ();
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "	* Returns the number of Segments in the polyline.

	:rtype: int
") NbSegments;
		virtual Standard_Integer NbSegments ();
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "	* Returns the points of the segment <Index> in the Polygon.

	:param theIndex:
	:type theIndex: int
	:param theBegin:
	:type theBegin: gp_Pnt2d
	:param theEnd:
	:type theEnd: gp_Pnt2d
	:rtype: void
") Segment;
		virtual void Segment (const Standard_Integer theIndex,gp_Pnt2d & theBegin,gp_Pnt2d & theEnd);
};


%extend Intf_Polygon2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class Intf_SectionLine {
	public:
		%feature("compactdefaultargs") NumberOfPoints;
		%feature("autodoc", "	* Returns number of points in this SectionLine.

	:rtype: int
") NumberOfPoints;
		Standard_Integer NumberOfPoints ();
		%feature("compactdefaultargs") GetPoint;
		%feature("autodoc", "	* Gives the point of intersection of address <Index> in the SectionLine.

	:param Index:
	:type Index: int
	:rtype: Intf_SectionPoint
") GetPoint;
		const Intf_SectionPoint & GetPoint (const Standard_Integer Index);
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "	* Returns True if the SectionLine is closed.

	:rtype: bool
") IsClosed;
		Standard_Boolean IsClosed ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	* Returns True if ThePI is in the SectionLine <self>.

	:param ThePI:
	:type ThePI: Intf_SectionPoint &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Intf_SectionPoint & ThePI);
		%feature("compactdefaultargs") IsEnd;
		%feature("autodoc", "	* Checks if <ThePI> is an end of the SectionLine. Returns 1 for the beginning, 2 for the end, otherwise 0.

	:param ThePI:
	:type ThePI: Intf_SectionPoint &
	:rtype: int
") IsEnd;
		Standard_Integer IsEnd (const Intf_SectionPoint & ThePI);
		%feature("compactdefaultargs") IsEqual;
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
        		%feature("compactdefaultargs") Intf_SectionLine;
		%feature("autodoc", "	* Constructs an empty SectionLine.

	:rtype: None
") Intf_SectionLine;
		 Intf_SectionLine ();
		%feature("compactdefaultargs") Intf_SectionLine;
		%feature("autodoc", "	* Copies a SectionLine.

	:param Other:
	:type Other: Intf_SectionLine &
	:rtype: None
") Intf_SectionLine;
		 Intf_SectionLine (const Intf_SectionLine & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	* Adds a point at the end of the SectionLine.

	:param Pi:
	:type Pi: Intf_SectionPoint &
	:rtype: None
") Append;
		void Append (const Intf_SectionPoint & Pi);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	* Concatenates the SectionLine <LS> at the end of the SectionLine <self>.

	:param LS:
	:type LS: Intf_SectionLine &
	:rtype: None
") Append;
		void Append (Intf_SectionLine & LS);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	* Adds a point to the beginning of the SectionLine <self>.

	:param Pi:
	:type Pi: Intf_SectionPoint &
	:rtype: None
") Prepend;
		void Prepend (const Intf_SectionPoint & Pi);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	* Concatenates a SectionLine <LS> at the beginning of the SectionLine <self>.

	:param LS:
	:type LS: Intf_SectionLine &
	:rtype: None
") Prepend;
		void Prepend (Intf_SectionLine & LS);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	* Reverses the order of the elements of the SectionLine.

	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") Close;
		%feature("autodoc", "	* Closes the SectionLine.

	:rtype: None
") Close;
		void Close ();
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:param Indent:
	:type Indent: int
	:rtype: None
") Dump;
		void Dump (const Standard_Integer Indent);
};


%extend Intf_SectionLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class Intf_SectionPoint {
	public:
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "	* Returns the location of the SectionPoint.

	:rtype: gp_Pnt
") Pnt;
		const gp_Pnt  Pnt ();
		%feature("compactdefaultargs") ParamOnFirst;
		%feature("autodoc", "	* Returns the cumulated Parameter of the SectionPoint on the first element.

	:rtype: float
") ParamOnFirst;
		Standard_Real ParamOnFirst ();
		%feature("compactdefaultargs") ParamOnSecond;
		%feature("autodoc", "	* Returns the cumulated Parameter of the section point on the second element.

	:rtype: float
") ParamOnSecond;
		Standard_Real ParamOnSecond ();
		%feature("compactdefaultargs") TypeOnFirst;
		%feature("autodoc", "	* Returns the type of the section point on the first element.

	:rtype: Intf_PIType
") TypeOnFirst;
		Intf_PIType TypeOnFirst ();
		%feature("compactdefaultargs") TypeOnSecond;
		%feature("autodoc", "	* Returns the type of the section point on the second element.

	:rtype: Intf_PIType
") TypeOnSecond;
		Intf_PIType TypeOnSecond ();
		%feature("compactdefaultargs") InfoFirst;
		%feature("autodoc", "	:param Dim:
	:type Dim: Intf_PIType &
	:param Add1:
	:type Add1: int &
	:param Add2:
	:type Add2: int &
	:param Param:
	:type Param: float &
	:rtype: None
") InfoFirst;
		void InfoFirst (Intf_PIType & Dim,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") InfoFirst;
		%feature("autodoc", "	* Gives the datas about the first argument of the Interference.

	:param Dim:
	:type Dim: Intf_PIType &
	:param Addr:
	:type Addr: int &
	:param Param:
	:type Param: float &
	:rtype: None
") InfoFirst;
		void InfoFirst (Intf_PIType & Dim,Standard_Integer &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") InfoSecond;
		%feature("autodoc", "	:param Dim:
	:type Dim: Intf_PIType &
	:param Add1:
	:type Add1: int &
	:param Add2:
	:type Add2: int &
	:param Param:
	:type Param: float &
	:rtype: None
") InfoSecond;
		void InfoSecond (Intf_PIType & Dim,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") InfoSecond;
		%feature("autodoc", "	* Gives the datas about the second argument of the Interference.

	:param Dim:
	:type Dim: Intf_PIType &
	:param Addr:
	:type Addr: int &
	:param Param:
	:type Param: float &
	:rtype: None
") InfoSecond;
		void InfoSecond (Intf_PIType & Dim,Standard_Integer &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Incidence;
		%feature("autodoc", "	* Gives the incidence at this section point. The incidence between the two triangles is given by the cosine. The best incidence is 0. (PI/2). The worst is 1. (null angle).

	:rtype: float
") Incidence;
		Standard_Real Incidence ();
		%feature("compactdefaultargs") IsEqual;
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
        		%feature("compactdefaultargs") IsOnSameEdge;
		%feature("autodoc", "	* Returns True if the two SectionPoints are on the same edge of the first or the second element.

	:param Other:
	:type Other: Intf_SectionPoint &
	:rtype: bool
") IsOnSameEdge;
		Standard_Boolean IsOnSameEdge (const Intf_SectionPoint & Other);
		%feature("compactdefaultargs") Intf_SectionPoint;
		%feature("autodoc", "	:rtype: None
") Intf_SectionPoint;
		 Intf_SectionPoint ();
		%feature("compactdefaultargs") Intf_SectionPoint;
		%feature("autodoc", "	* Builds a SectionPoint with the respective dimensions (vertex edge or face) of the concerned arguments and their addresses in the Topological structure.

	:param Where:
	:type Where: gp_Pnt
	:param DimeO:
	:type DimeO: Intf_PIType
	:param AddrO1:
	:type AddrO1: int
	:param AddrO2:
	:type AddrO2: int
	:param ParamO:
	:type ParamO: float
	:param DimeT:
	:type DimeT: Intf_PIType
	:param AddrT1:
	:type AddrT1: int
	:param AddrT2:
	:type AddrT2: int
	:param ParamT:
	:type ParamT: float
	:param Incid:
	:type Incid: float
	:rtype: None
") Intf_SectionPoint;
		 Intf_SectionPoint (const gp_Pnt & Where,const Intf_PIType DimeO,const Standard_Integer AddrO1,const Standard_Integer AddrO2,const Standard_Real ParamO,const Intf_PIType DimeT,const Standard_Integer AddrT1,const Standard_Integer AddrT2,const Standard_Real ParamT,const Standard_Real Incid);
		%feature("compactdefaultargs") Intf_SectionPoint;
		%feature("autodoc", "	* Builds a SectionPoint 2d with the respective dimensions (vertex or edge) of the concerned arguments and their addresses in the Topological structure.

	:param Where:
	:type Where: gp_Pnt2d
	:param DimeO:
	:type DimeO: Intf_PIType
	:param AddrO1:
	:type AddrO1: int
	:param ParamO:
	:type ParamO: float
	:param DimeT:
	:type DimeT: Intf_PIType
	:param AddrT1:
	:type AddrT1: int
	:param ParamT:
	:type ParamT: float
	:param Incid:
	:type Incid: float
	:rtype: None
") Intf_SectionPoint;
		 Intf_SectionPoint (const gp_Pnt2d & Where,const Intf_PIType DimeO,const Standard_Integer AddrO1,const Standard_Real ParamO,const Intf_PIType DimeT,const Standard_Integer AddrT1,const Standard_Real ParamT,const Standard_Real Incid);
		%feature("compactdefaultargs") Merge;
		%feature("autodoc", "	* Merges two SectionPoints.

	:param Other:
	:type Other: Intf_SectionPoint &
	:rtype: None
") Merge;
		void Merge (Intf_SectionPoint & Other);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:param Indent:
	:type Indent: int
	:rtype: None
") Dump;
		void Dump (const Standard_Integer Indent);
};


%extend Intf_SectionPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Intf_SeqOfSectionLine;
class Intf_SeqOfSectionLine : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Intf_SeqOfSectionLine;
		%feature("autodoc", "	:rtype: None
") Intf_SeqOfSectionLine;
		 Intf_SeqOfSectionLine ();
		%feature("compactdefaultargs") Intf_SeqOfSectionLine;
		%feature("autodoc", "	:param Other:
	:type Other: Intf_SeqOfSectionLine &
	:rtype: None
") Intf_SeqOfSectionLine;
		 Intf_SeqOfSectionLine (const Intf_SeqOfSectionLine & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Intf_SeqOfSectionLine &
	:rtype: Intf_SeqOfSectionLine
") Assign;
		const Intf_SeqOfSectionLine & Assign (const Intf_SeqOfSectionLine & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Intf_SeqOfSectionLine &
	:rtype: Intf_SeqOfSectionLine
") operator =;
		const Intf_SeqOfSectionLine & operator = (const Intf_SeqOfSectionLine & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Intf_SectionLine &
	:rtype: None
") Append;
		void Append (const Intf_SectionLine & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Intf_SeqOfSectionLine &
	:rtype: None
") Append;
		void Append (Intf_SeqOfSectionLine & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Intf_SectionLine &
	:rtype: None
") Prepend;
		void Prepend (const Intf_SectionLine & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Intf_SeqOfSectionLine &
	:rtype: None
") Prepend;
		void Prepend (Intf_SeqOfSectionLine & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Intf_SectionLine &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Intf_SectionLine & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Intf_SeqOfSectionLine &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Intf_SeqOfSectionLine & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Intf_SectionLine &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Intf_SectionLine & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Intf_SeqOfSectionLine &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Intf_SeqOfSectionLine & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Intf_SectionLine
") First;
		const Intf_SectionLine & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Intf_SectionLine
") Last;
		const Intf_SectionLine & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Intf_SeqOfSectionLine &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Intf_SeqOfSectionLine & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Intf_SectionLine
") Value;
		const Intf_SectionLine & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Intf_SectionLine &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Intf_SectionLine & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Intf_SectionLine
") ChangeValue;
		Intf_SectionLine & ChangeValue (const Standard_Integer Index);
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


%extend Intf_SeqOfSectionLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Intf_SeqOfSectionPoint;
class Intf_SeqOfSectionPoint : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Intf_SeqOfSectionPoint;
		%feature("autodoc", "	:rtype: None
") Intf_SeqOfSectionPoint;
		 Intf_SeqOfSectionPoint ();
		%feature("compactdefaultargs") Intf_SeqOfSectionPoint;
		%feature("autodoc", "	:param Other:
	:type Other: Intf_SeqOfSectionPoint &
	:rtype: None
") Intf_SeqOfSectionPoint;
		 Intf_SeqOfSectionPoint (const Intf_SeqOfSectionPoint & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Intf_SeqOfSectionPoint &
	:rtype: Intf_SeqOfSectionPoint
") Assign;
		const Intf_SeqOfSectionPoint & Assign (const Intf_SeqOfSectionPoint & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Intf_SeqOfSectionPoint &
	:rtype: Intf_SeqOfSectionPoint
") operator =;
		const Intf_SeqOfSectionPoint & operator = (const Intf_SeqOfSectionPoint & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Intf_SectionPoint &
	:rtype: None
") Append;
		void Append (const Intf_SectionPoint & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Intf_SeqOfSectionPoint &
	:rtype: None
") Append;
		void Append (Intf_SeqOfSectionPoint & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Intf_SectionPoint &
	:rtype: None
") Prepend;
		void Prepend (const Intf_SectionPoint & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Intf_SeqOfSectionPoint &
	:rtype: None
") Prepend;
		void Prepend (Intf_SeqOfSectionPoint & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Intf_SectionPoint &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Intf_SectionPoint & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Intf_SeqOfSectionPoint &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Intf_SeqOfSectionPoint & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Intf_SectionPoint &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Intf_SectionPoint & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Intf_SeqOfSectionPoint &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Intf_SeqOfSectionPoint & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Intf_SectionPoint
") First;
		const Intf_SectionPoint & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Intf_SectionPoint
") Last;
		const Intf_SectionPoint & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Intf_SeqOfSectionPoint &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Intf_SeqOfSectionPoint & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Intf_SectionPoint
") Value;
		const Intf_SectionPoint & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Intf_SectionPoint &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Intf_SectionPoint & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Intf_SectionPoint
") ChangeValue;
		Intf_SectionPoint & ChangeValue (const Standard_Integer Index);
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


%extend Intf_SeqOfSectionPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Intf_SeqOfTangentZone;
class Intf_SeqOfTangentZone : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Intf_SeqOfTangentZone;
		%feature("autodoc", "	:rtype: None
") Intf_SeqOfTangentZone;
		 Intf_SeqOfTangentZone ();
		%feature("compactdefaultargs") Intf_SeqOfTangentZone;
		%feature("autodoc", "	:param Other:
	:type Other: Intf_SeqOfTangentZone &
	:rtype: None
") Intf_SeqOfTangentZone;
		 Intf_SeqOfTangentZone (const Intf_SeqOfTangentZone & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Intf_SeqOfTangentZone &
	:rtype: Intf_SeqOfTangentZone
") Assign;
		const Intf_SeqOfTangentZone & Assign (const Intf_SeqOfTangentZone & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Intf_SeqOfTangentZone &
	:rtype: Intf_SeqOfTangentZone
") operator =;
		const Intf_SeqOfTangentZone & operator = (const Intf_SeqOfTangentZone & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Intf_TangentZone &
	:rtype: None
") Append;
		void Append (const Intf_TangentZone & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Intf_SeqOfTangentZone &
	:rtype: None
") Append;
		void Append (Intf_SeqOfTangentZone & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Intf_TangentZone &
	:rtype: None
") Prepend;
		void Prepend (const Intf_TangentZone & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Intf_SeqOfTangentZone &
	:rtype: None
") Prepend;
		void Prepend (Intf_SeqOfTangentZone & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Intf_TangentZone &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Intf_TangentZone & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Intf_SeqOfTangentZone &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Intf_SeqOfTangentZone & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Intf_TangentZone &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Intf_TangentZone & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Intf_SeqOfTangentZone &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Intf_SeqOfTangentZone & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Intf_TangentZone
") First;
		const Intf_TangentZone & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Intf_TangentZone
") Last;
		const Intf_TangentZone & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Intf_SeqOfTangentZone &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Intf_SeqOfTangentZone & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Intf_TangentZone
") Value;
		const Intf_TangentZone & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Intf_TangentZone &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Intf_TangentZone & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Intf_TangentZone
") ChangeValue;
		Intf_TangentZone & ChangeValue (const Standard_Integer Index);
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


%extend Intf_SeqOfTangentZone {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Intf_SequenceNodeOfSeqOfSectionLine;
class Intf_SequenceNodeOfSeqOfSectionLine : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Intf_SequenceNodeOfSeqOfSectionLine;
		%feature("autodoc", "	:param I:
	:type I: Intf_SectionLine &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Intf_SequenceNodeOfSeqOfSectionLine;
		 Intf_SequenceNodeOfSeqOfSectionLine (const Intf_SectionLine & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Intf_SectionLine
") Value;
		Intf_SectionLine & Value ();
};


%extend Intf_SequenceNodeOfSeqOfSectionLine {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Intf_SequenceNodeOfSeqOfSectionLine(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Intf_SequenceNodeOfSeqOfSectionLine::Handle_Intf_SequenceNodeOfSeqOfSectionLine %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    Intf_SequenceNodeOfSeqOfSectionLine* _get_reference() {
    return (Intf_SequenceNodeOfSeqOfSectionLine*)$self->Access();
    }
};

%extend Handle_Intf_SequenceNodeOfSeqOfSectionLine {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Intf_SequenceNodeOfSeqOfSectionLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Intf_SequenceNodeOfSeqOfSectionPoint;
class Intf_SequenceNodeOfSeqOfSectionPoint : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Intf_SequenceNodeOfSeqOfSectionPoint;
		%feature("autodoc", "	:param I:
	:type I: Intf_SectionPoint &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Intf_SequenceNodeOfSeqOfSectionPoint;
		 Intf_SequenceNodeOfSeqOfSectionPoint (const Intf_SectionPoint & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Intf_SectionPoint
") Value;
		Intf_SectionPoint & Value ();
};


%extend Intf_SequenceNodeOfSeqOfSectionPoint {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Intf_SequenceNodeOfSeqOfSectionPoint(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Intf_SequenceNodeOfSeqOfSectionPoint::Handle_Intf_SequenceNodeOfSeqOfSectionPoint %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    Intf_SequenceNodeOfSeqOfSectionPoint* _get_reference() {
    return (Intf_SequenceNodeOfSeqOfSectionPoint*)$self->Access();
    }
};

%extend Handle_Intf_SequenceNodeOfSeqOfSectionPoint {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Intf_SequenceNodeOfSeqOfSectionPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Intf_SequenceNodeOfSeqOfTangentZone;
class Intf_SequenceNodeOfSeqOfTangentZone : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Intf_SequenceNodeOfSeqOfTangentZone;
		%feature("autodoc", "	:param I:
	:type I: Intf_TangentZone &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Intf_SequenceNodeOfSeqOfTangentZone;
		 Intf_SequenceNodeOfSeqOfTangentZone (const Intf_TangentZone & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Intf_TangentZone
") Value;
		Intf_TangentZone & Value ();
};


%extend Intf_SequenceNodeOfSeqOfTangentZone {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Intf_SequenceNodeOfSeqOfTangentZone(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Intf_SequenceNodeOfSeqOfTangentZone::Handle_Intf_SequenceNodeOfSeqOfTangentZone %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    Intf_SequenceNodeOfSeqOfTangentZone* _get_reference() {
    return (Intf_SequenceNodeOfSeqOfTangentZone*)$self->Access();
    }
};

%extend Handle_Intf_SequenceNodeOfSeqOfTangentZone {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Intf_SequenceNodeOfSeqOfTangentZone {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class Intf_TangentZone {
	public:
		%feature("compactdefaultargs") NumberOfPoints;
		%feature("autodoc", "	* Returns number of SectionPoint in this TangentZone.

	:rtype: int
") NumberOfPoints;
		Standard_Integer NumberOfPoints ();
		%feature("compactdefaultargs") GetPoint;
		%feature("autodoc", "	* Gives the SectionPoint of address <Index> in the TangentZone.

	:param Index:
	:type Index: int
	:rtype: Intf_SectionPoint
") GetPoint;
		const Intf_SectionPoint & GetPoint (const Standard_Integer Index);
		%feature("compactdefaultargs") IsEqual;
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
        		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	* Checks if <ThePI> is in TangentZone.

	:param ThePI:
	:type ThePI: Intf_SectionPoint &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Intf_SectionPoint & ThePI);
		%feature("compactdefaultargs") ParamOnFirst;
		%feature("autodoc", "	* Gives the parameter range of the TangentZone on the first argument of the Interference. (Usable only for polygon)

	:param paraMin:
	:type paraMin: float &
	:param paraMax:
	:type paraMax: float &
	:rtype: None
") ParamOnFirst;
		void ParamOnFirst (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") ParamOnSecond;
		%feature("autodoc", "	* Gives the parameter range of the TangentZone on the second argument of the Interference. (Usable only for polygon)

	:param paraMin:
	:type paraMin: float &
	:param paraMax:
	:type paraMax: float &
	:rtype: None
") ParamOnSecond;
		void ParamOnSecond (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") InfoFirst;
		%feature("autodoc", "	* Gives information about the first argument of the Interference. (Usable only for polygon)

	:param segMin:
	:type segMin: int &
	:param paraMin:
	:type paraMin: float &
	:param segMax:
	:type segMax: int &
	:param paraMax:
	:type paraMax: float &
	:rtype: None
") InfoFirst;
		void InfoFirst (Standard_Integer &OutValue,Standard_Real &OutValue,Standard_Integer &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") InfoSecond;
		%feature("autodoc", "	* Gives informations about the second argument of the Interference. (Usable only for polygon)

	:param segMin:
	:type segMin: int &
	:param paraMin:
	:type paraMin: float &
	:param segMax:
	:type segMax: int &
	:param paraMax:
	:type paraMax: float &
	:rtype: None
") InfoSecond;
		void InfoSecond (Standard_Integer &OutValue,Standard_Real &OutValue,Standard_Integer &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") RangeContains;
		%feature("autodoc", "	* Returns True if <ThePI> is in the parameter range of the TangentZone.

	:param ThePI:
	:type ThePI: Intf_SectionPoint &
	:rtype: bool
") RangeContains;
		Standard_Boolean RangeContains (const Intf_SectionPoint & ThePI);
		%feature("compactdefaultargs") HasCommonRange;
		%feature("autodoc", "	* Returns True if the TangentZone <Other> has a common part with <self>.

	:param Other:
	:type Other: Intf_TangentZone &
	:rtype: bool
") HasCommonRange;
		Standard_Boolean HasCommonRange (const Intf_TangentZone & Other);
		%feature("compactdefaultargs") Intf_TangentZone;
		%feature("autodoc", "	* Builds an empty tangent zone.

	:rtype: None
") Intf_TangentZone;
		 Intf_TangentZone ();
		%feature("compactdefaultargs") Intf_TangentZone;
		%feature("autodoc", "	* Copies a Tangent zone.

	:param Other:
	:type Other: Intf_TangentZone &
	:rtype: None
") Intf_TangentZone;
		 Intf_TangentZone (const Intf_TangentZone & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	* Adds a SectionPoint to the TangentZone.

	:param Pi:
	:type Pi: Intf_SectionPoint &
	:rtype: None
") Append;
		void Append (const Intf_SectionPoint & Pi);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	* Adds the TangentZone <Tzi> to <self>.

	:param Tzi:
	:type Tzi: Intf_TangentZone &
	:rtype: None
") Append;
		void Append (const Intf_TangentZone & Tzi);
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "	* Inserts a SectionPoint in the TangentZone.

	:param Pi:
	:type Pi: Intf_SectionPoint &
	:rtype: bool
") Insert;
		Standard_Boolean Insert (const Intf_SectionPoint & Pi);
		%feature("compactdefaultargs") PolygonInsert;
		%feature("autodoc", "	* Inserts a point in the polygonal TangentZone.

	:param Pi:
	:type Pi: Intf_SectionPoint &
	:rtype: None
") PolygonInsert;
		void PolygonInsert (const Intf_SectionPoint & Pi);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	* Inserts a SectionPoint before <Index> in the TangentZone.

	:param Index:
	:type Index: int
	:param Pi:
	:type Pi: Intf_SectionPoint &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Intf_SectionPoint & Pi);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	* Inserts a SectionPoint after <Index> in the TangentZone.

	:param Index:
	:type Index: int
	:param Pi:
	:type Pi: Intf_SectionPoint &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Intf_SectionPoint & Pi);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:param Indent:
	:type Indent: int
	:rtype: None
") Dump;
		void Dump (const Standard_Integer Indent);
};


%extend Intf_TangentZone {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Intf_Tool;
class Intf_Tool {
	public:
		%feature("compactdefaultargs") Intf_Tool;
		%feature("autodoc", "	:rtype: None
") Intf_Tool;
		 Intf_Tool ();
		%feature("compactdefaultargs") Lin2dBox;
		%feature("autodoc", "	:param theLin2d:
	:type theLin2d: gp_Lin2d
	:param bounding:
	:type bounding: Bnd_Box2d &
	:param boxLin:
	:type boxLin: Bnd_Box2d &
	:rtype: None
") Lin2dBox;
		void Lin2dBox (const gp_Lin2d & theLin2d,const Bnd_Box2d & bounding,Bnd_Box2d & boxLin);
		%feature("compactdefaultargs") Hypr2dBox;
		%feature("autodoc", "	:param theHypr2d:
	:type theHypr2d: gp_Hypr2d
	:param bounding:
	:type bounding: Bnd_Box2d &
	:param boxHypr:
	:type boxHypr: Bnd_Box2d &
	:rtype: None
") Hypr2dBox;
		void Hypr2dBox (const gp_Hypr2d & theHypr2d,const Bnd_Box2d & bounding,Bnd_Box2d & boxHypr);
		%feature("compactdefaultargs") Parab2dBox;
		%feature("autodoc", "	:param theParab2d:
	:type theParab2d: gp_Parab2d
	:param bounding:
	:type bounding: Bnd_Box2d &
	:param boxHypr:
	:type boxHypr: Bnd_Box2d &
	:rtype: None
") Parab2dBox;
		void Parab2dBox (const gp_Parab2d & theParab2d,const Bnd_Box2d & bounding,Bnd_Box2d & boxHypr);
		%feature("compactdefaultargs") LinBox;
		%feature("autodoc", "	:param theLin:
	:type theLin: gp_Lin
	:param bounding:
	:type bounding: Bnd_Box &
	:param boxLin:
	:type boxLin: Bnd_Box &
	:rtype: None
") LinBox;
		void LinBox (const gp_Lin & theLin,const Bnd_Box & bounding,Bnd_Box & boxLin);
		%feature("compactdefaultargs") HyprBox;
		%feature("autodoc", "	:param theHypr:
	:type theHypr: gp_Hypr
	:param bounding:
	:type bounding: Bnd_Box &
	:param boxHypr:
	:type boxHypr: Bnd_Box &
	:rtype: None
") HyprBox;
		void HyprBox (const gp_Hypr & theHypr,const Bnd_Box & bounding,Bnd_Box & boxHypr);
		%feature("compactdefaultargs") ParabBox;
		%feature("autodoc", "	:param theParab:
	:type theParab: gp_Parab
	:param bounding:
	:type bounding: Bnd_Box &
	:param boxHypr:
	:type boxHypr: Bnd_Box &
	:rtype: None
") ParabBox;
		void ParabBox (const gp_Parab & theParab,const Bnd_Box & bounding,Bnd_Box & boxHypr);
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "	:rtype: int
") NbSegments;
		Standard_Integer NbSegments ();
		%feature("compactdefaultargs") BeginParam;
		%feature("autodoc", "	:param SegmentNum:
	:type SegmentNum: int
	:rtype: float
") BeginParam;
		Standard_Real BeginParam (const Standard_Integer SegmentNum);
		%feature("compactdefaultargs") EndParam;
		%feature("autodoc", "	:param SegmentNum:
	:type SegmentNum: int
	:rtype: float
") EndParam;
		Standard_Real EndParam (const Standard_Integer SegmentNum);
};


%extend Intf_Tool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Intf_InterferencePolygon2d;
class Intf_InterferencePolygon2d : public Intf_Interference {
	public:
		%feature("compactdefaultargs") Intf_InterferencePolygon2d;
		%feature("autodoc", "	* Constructs an empty interference of Polygon.

	:rtype: None
") Intf_InterferencePolygon2d;
		 Intf_InterferencePolygon2d ();
		%feature("compactdefaultargs") Intf_InterferencePolygon2d;
		%feature("autodoc", "	* Constructs and computes an interference between two Polygons.

	:param Obje1:
	:type Obje1: Intf_Polygon2d &
	:param Obje2:
	:type Obje2: Intf_Polygon2d &
	:rtype: None
") Intf_InterferencePolygon2d;
		 Intf_InterferencePolygon2d (const Intf_Polygon2d & Obje1,const Intf_Polygon2d & Obje2);
		%feature("compactdefaultargs") Intf_InterferencePolygon2d;
		%feature("autodoc", "	* Constructs and computes the auto interference of a Polygon.

	:param Obje:
	:type Obje: Intf_Polygon2d &
	:rtype: None
") Intf_InterferencePolygon2d;
		 Intf_InterferencePolygon2d (const Intf_Polygon2d & Obje);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Computes an interference between two Polygons.

	:param Obje1:
	:type Obje1: Intf_Polygon2d &
	:param Obje2:
	:type Obje2: Intf_Polygon2d &
	:rtype: None
") Perform;
		void Perform (const Intf_Polygon2d & Obje1,const Intf_Polygon2d & Obje2);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Computes the self interference of a Polygon.

	:param Obje:
	:type Obje: Intf_Polygon2d &
	:rtype: None
") Perform;
		void Perform (const Intf_Polygon2d & Obje);
		%feature("compactdefaultargs") Pnt2dValue;
		%feature("autodoc", "	* Gives the geometrical 2d point of the intersection point at address <Index> in the interference.

	:param Index:
	:type Index: int
	:rtype: gp_Pnt2d
") Pnt2dValue;
		gp_Pnt2d Pnt2dValue (const Standard_Integer Index);
};


%extend Intf_InterferencePolygon2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
