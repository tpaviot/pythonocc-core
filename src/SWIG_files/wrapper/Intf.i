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
%define INTFDOCSTRING
"Intf module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_intf.html"
%enddef
%module (package="OCC.Core", docstring=INTFDOCSTRING) Intf


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
#include<Intf_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<gp_module.hxx>
#include<Bnd_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import gp.i
%import Bnd.i
/* public enums */
enum Intf_PIType {
	Intf_EXTERNAL = 0,
	Intf_FACE = 1,
	Intf_EDGE = 2,
	Intf_VERTEX = 3,
};

/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
%template(Intf_SeqOfSectionLine) NCollection_Sequence <Intf_SectionLine>;
%template(Intf_SeqOfTangentZone) NCollection_Sequence <Intf_TangentZone>;
%template(Intf_SeqOfSectionPoint) NCollection_Sequence <Intf_SectionPoint>;
%template(Intf_Array1OfLin) NCollection_Array1 <gp_Lin>;

%extend NCollection_Array1 <gp_Lin> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence <Intf_SectionLine> Intf_SeqOfSectionLine;
typedef NCollection_Sequence <Intf_TangentZone> Intf_SeqOfTangentZone;
typedef NCollection_Sequence <Intf_SectionPoint> Intf_SeqOfSectionPoint;
typedef NCollection_Array1 <gp_Lin> Intf_Array1OfLin;
/* end typedefs declaration */

/*************
* class Intf *
*************/
%rename(intf) Intf;
class Intf {
	public:
		/****************** Contain ******************/
		%feature("compactdefaultargs") Contain;
		%feature("autodoc", "* Compute if the triangle <P1> <P2> <P3> contain <ThePnt>.
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param P3:
	:type P3: gp_Pnt
	:param ThePnt:
	:type ThePnt: gp_Pnt
	:rtype: bool") Contain;
		static Standard_Boolean Contain (const gp_Pnt & P1,const gp_Pnt & P2,const gp_Pnt & P3,const gp_Pnt & ThePnt);

		/****************** PlaneEquation ******************/
		%feature("compactdefaultargs") PlaneEquation;
		%feature("autodoc", "* Computes the interference between two polygons in 2d. Result : points of intersections and zones of tangence. Computes the interference between a polygon or a straight line and a polyhedron. Points of intersection and zones of tangence. Give the plane equation of the triangle <P1> <P2> <P3>.
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param P3:
	:type P3: gp_Pnt
	:param NormalVector:
	:type NormalVector: gp_XYZ
	:param PolarDistance:
	:type PolarDistance: float
	:rtype: void") PlaneEquation;
		static void PlaneEquation (const gp_Pnt & P1,const gp_Pnt & P2,const gp_Pnt & P3,gp_XYZ & NormalVector,Standard_Real &OutValue);

};


%extend Intf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Intf_Interference *
**************************/
%nodefaultctor Intf_Interference;
%ignore Intf_Interference::~Intf_Interference();
class Intf_Interference {
	public:
		/****************** Contains ******************/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "* Tests if the polylines of intersection or the zones of tangence contain the point of intersection <ThePnt>.
	:param ThePnt:
	:type ThePnt: Intf_SectionPoint
	:rtype: bool") Contains;
		Standard_Boolean Contains (const Intf_SectionPoint & ThePnt);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", ":rtype: None") Dump;
		void Dump ();

		/****************** GetTolerance ******************/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "* Gives the tolerance used for the calculation.
	:rtype: float") GetTolerance;
		Standard_Real GetTolerance ();

		/****************** Insert ******************/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "* Inserts a new zone of tangence in the current list of tangent zones of the interference and returns True when done.
	:param TheZone:
	:type TheZone: Intf_TangentZone
	:rtype: bool") Insert;
		Standard_Boolean Insert (const Intf_TangentZone & TheZone);

		/****************** Insert ******************/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "* Insert a new segment of intersection in the current list of polylines of intersection of the interference.
	:param pdeb:
	:type pdeb: Intf_SectionPoint
	:param pfin:
	:type pfin: Intf_SectionPoint
	:rtype: None") Insert;
		void Insert (const Intf_SectionPoint & pdeb,const Intf_SectionPoint & pfin);

		/****************** LineValue ******************/
		%feature("compactdefaultargs") LineValue;
		%feature("autodoc", "* Gives the polyline of intersection at address <Index> in the interference.
	:param Index:
	:type Index: int
	:rtype: Intf_SectionLine") LineValue;
		const Intf_SectionLine & LineValue (const Standard_Integer Index);

		/****************** NbSectionLines ******************/
		%feature("compactdefaultargs") NbSectionLines;
		%feature("autodoc", "* Gives the number of polylines of intersection in the interference.
	:rtype: int") NbSectionLines;
		Standard_Integer NbSectionLines ();

		/****************** NbSectionPoints ******************/
		%feature("compactdefaultargs") NbSectionPoints;
		%feature("autodoc", "* Gives the number of points of intersection in the interference.
	:rtype: int") NbSectionPoints;
		Standard_Integer NbSectionPoints ();

		/****************** NbTangentZones ******************/
		%feature("compactdefaultargs") NbTangentZones;
		%feature("autodoc", "* Gives the number of zones of tangence in the interference.
	:rtype: int") NbTangentZones;
		Standard_Integer NbTangentZones ();

		/****************** PntValue ******************/
		%feature("compactdefaultargs") PntValue;
		%feature("autodoc", "* Gives the point of intersection of address Index in the interference.
	:param Index:
	:type Index: int
	:rtype: Intf_SectionPoint") PntValue;
		const Intf_SectionPoint & PntValue (const Standard_Integer Index);

		/****************** ZoneValue ******************/
		%feature("compactdefaultargs") ZoneValue;
		%feature("autodoc", "* Gives the zone of tangence at address Index in the interference.
	:param Index:
	:type Index: int
	:rtype: Intf_TangentZone") ZoneValue;
		const Intf_TangentZone & ZoneValue (const Standard_Integer Index);

};


%extend Intf_Interference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Intf_Polygon2d *
***********************/
%nodefaultctor Intf_Polygon2d;
class Intf_Polygon2d {
	public:
		/****************** Bounding ******************/
		%feature("compactdefaultargs") Bounding;
		%feature("autodoc", "* Returns the bounding box of the polygon.
	:rtype: Bnd_Box2d") Bounding;
		const Bnd_Box2d & Bounding ();

		/****************** Closed ******************/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "* Returns True if the polyline is closed.
	:rtype: bool") Closed;
		virtual Standard_Boolean Closed ();

		/****************** DeflectionOverEstimation ******************/
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "* Returns the tolerance of the polygon.
	:rtype: float") DeflectionOverEstimation;
		virtual Standard_Real DeflectionOverEstimation ();

		/****************** NbSegments ******************/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "* Returns the number of Segments in the polyline.
	:rtype: int") NbSegments;
		virtual Standard_Integer NbSegments ();

		/****************** Segment ******************/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "* Returns the points of the segment <Index> in the Polygon.
	:param theIndex:
	:type theIndex: int
	:param theBegin:
	:type theBegin: gp_Pnt2d
	:param theEnd:
	:type theEnd: gp_Pnt2d
	:rtype: void") Segment;
		virtual void Segment (const Standard_Integer theIndex,gp_Pnt2d & theBegin,gp_Pnt2d & theEnd);

};


%extend Intf_Polygon2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Intf_SectionLine *
*************************/
class Intf_SectionLine {
	public:
		/****************** Append ******************/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "* Adds a point at the end of the SectionLine.
	:param Pi:
	:type Pi: Intf_SectionPoint
	:rtype: None") Append;
		void Append (const Intf_SectionPoint & Pi);

		/****************** Append ******************/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "* Concatenates the SectionLine <LS> at the end of the SectionLine <self>.
	:param LS:
	:type LS: Intf_SectionLine
	:rtype: None") Append;
		void Append (Intf_SectionLine & LS);

		/****************** Close ******************/
		%feature("compactdefaultargs") Close;
		%feature("autodoc", "* Closes the SectionLine.
	:rtype: None") Close;
		void Close ();

		/****************** Contains ******************/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "* Returns True if ThePI is in the SectionLine <self>.
	:param ThePI:
	:type ThePI: Intf_SectionPoint
	:rtype: bool") Contains;
		Standard_Boolean Contains (const Intf_SectionPoint & ThePI);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", ":param Indent:
	:type Indent: int
	:rtype: None") Dump;
		void Dump (const Standard_Integer Indent);

		/****************** GetPoint ******************/
		%feature("compactdefaultargs") GetPoint;
		%feature("autodoc", "* Gives the point of intersection of address <Index> in the SectionLine.
	:param Index:
	:type Index: int
	:rtype: Intf_SectionPoint") GetPoint;
		const Intf_SectionPoint & GetPoint (const Standard_Integer Index);

		/****************** Intf_SectionLine ******************/
		%feature("compactdefaultargs") Intf_SectionLine;
		%feature("autodoc", "* Constructs an empty SectionLine.
	:rtype: None") Intf_SectionLine;
		 Intf_SectionLine ();

		/****************** Intf_SectionLine ******************/
		%feature("compactdefaultargs") Intf_SectionLine;
		%feature("autodoc", "* Copies a SectionLine.
	:param Other:
	:type Other: Intf_SectionLine
	:rtype: None") Intf_SectionLine;
		 Intf_SectionLine (const Intf_SectionLine & Other);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "* Returns True if the SectionLine is closed.
	:rtype: bool") IsClosed;
		Standard_Boolean IsClosed ();

		/****************** IsEnd ******************/
		%feature("compactdefaultargs") IsEnd;
		%feature("autodoc", "* Checks if <ThePI> is an end of the SectionLine. Returns 1 for the beginning, 2 for the end, otherwise 0.
	:param ThePI:
	:type ThePI: Intf_SectionPoint
	:rtype: int") IsEnd;
		Standard_Integer IsEnd (const Intf_SectionPoint & ThePI);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "* Compares two SectionLines.
	:param Other:
	:type Other: Intf_SectionLine
	:rtype: bool") IsEqual;
		Standard_Boolean IsEqual (const Intf_SectionLine & Other);

		/****************** NumberOfPoints ******************/
		%feature("compactdefaultargs") NumberOfPoints;
		%feature("autodoc", "* Returns number of points in this SectionLine.
	:rtype: int") NumberOfPoints;
		Standard_Integer NumberOfPoints ();

		/****************** Prepend ******************/
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "* Adds a point to the beginning of the SectionLine <self>.
	:param Pi:
	:type Pi: Intf_SectionPoint
	:rtype: None") Prepend;
		void Prepend (const Intf_SectionPoint & Pi);

		/****************** Prepend ******************/
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "* Concatenates a SectionLine <LS> at the beginning of the SectionLine <self>.
	:param LS:
	:type LS: Intf_SectionLine
	:rtype: None") Prepend;
		void Prepend (Intf_SectionLine & LS);

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "* Reverses the order of the elements of the SectionLine.
	:rtype: None") Reverse;
		void Reverse ();


        %extend{
            bool __eq_wrapper__(const Intf_SectionLine  other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self, right):
            try:
                return self.__eq_wrapper__(right)
            except:
                return False
        }
        };


%extend Intf_SectionLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Intf_SectionPoint *
**************************/
class Intf_SectionPoint {
	public:
		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", ":param Indent:
	:type Indent: int
	:rtype: None") Dump;
		void Dump (const Standard_Integer Indent);

		/****************** Incidence ******************/
		%feature("compactdefaultargs") Incidence;
		%feature("autodoc", "* Gives the incidence at this section point. The incidence between the two triangles is given by the cosine. The best incidence is 0. (PI/2). The worst is 1. (null angle).
	:rtype: float") Incidence;
		Standard_Real Incidence ();

		/****************** InfoFirst ******************/
		%feature("compactdefaultargs") InfoFirst;
		%feature("autodoc", ":param Dim:
	:type Dim: Intf_PIType
	:param Add1:
	:type Add1: int
	:param Add2:
	:type Add2: int
	:param Param:
	:type Param: float
	:rtype: None") InfoFirst;
		void InfoFirst (Intf_PIType & Dim,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Real &OutValue);

		/****************** InfoFirst ******************/
		%feature("compactdefaultargs") InfoFirst;
		%feature("autodoc", "* Gives the datas about the first argument of the Interference.
	:param Dim:
	:type Dim: Intf_PIType
	:param Addr:
	:type Addr: int
	:param Param:
	:type Param: float
	:rtype: None") InfoFirst;
		void InfoFirst (Intf_PIType & Dim,Standard_Integer &OutValue,Standard_Real &OutValue);

		/****************** InfoSecond ******************/
		%feature("compactdefaultargs") InfoSecond;
		%feature("autodoc", ":param Dim:
	:type Dim: Intf_PIType
	:param Add1:
	:type Add1: int
	:param Add2:
	:type Add2: int
	:param Param:
	:type Param: float
	:rtype: None") InfoSecond;
		void InfoSecond (Intf_PIType & Dim,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Real &OutValue);

		/****************** InfoSecond ******************/
		%feature("compactdefaultargs") InfoSecond;
		%feature("autodoc", "* Gives the datas about the second argument of the Interference.
	:param Dim:
	:type Dim: Intf_PIType
	:param Addr:
	:type Addr: int
	:param Param:
	:type Param: float
	:rtype: None") InfoSecond;
		void InfoSecond (Intf_PIType & Dim,Standard_Integer &OutValue,Standard_Real &OutValue);

		/****************** Intf_SectionPoint ******************/
		%feature("compactdefaultargs") Intf_SectionPoint;
		%feature("autodoc", ":rtype: None") Intf_SectionPoint;
		 Intf_SectionPoint ();

		/****************** Intf_SectionPoint ******************/
		%feature("compactdefaultargs") Intf_SectionPoint;
		%feature("autodoc", "* Builds a SectionPoint with the respective dimensions (vertex edge or face) of the concerned arguments and their addresses in the Topological structure.
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
	:rtype: None") Intf_SectionPoint;
		 Intf_SectionPoint (const gp_Pnt & Where,const Intf_PIType DimeO,const Standard_Integer AddrO1,const Standard_Integer AddrO2,const Standard_Real ParamO,const Intf_PIType DimeT,const Standard_Integer AddrT1,const Standard_Integer AddrT2,const Standard_Real ParamT,const Standard_Real Incid);

		/****************** Intf_SectionPoint ******************/
		%feature("compactdefaultargs") Intf_SectionPoint;
		%feature("autodoc", "* Builds a SectionPoint 2d with the respective dimensions (vertex or edge) of the concerned arguments and their addresses in the Topological structure.
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
	:rtype: None") Intf_SectionPoint;
		 Intf_SectionPoint (const gp_Pnt2d & Where,const Intf_PIType DimeO,const Standard_Integer AddrO1,const Standard_Real ParamO,const Intf_PIType DimeT,const Standard_Integer AddrT1,const Standard_Real ParamT,const Standard_Real Incid);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "* Returns True if the two SectionPoint have the same logical informations.
	:param Other:
	:type Other: Intf_SectionPoint
	:rtype: bool") IsEqual;
		Standard_Boolean IsEqual (const Intf_SectionPoint & Other);

		/****************** IsOnSameEdge ******************/
		%feature("compactdefaultargs") IsOnSameEdge;
		%feature("autodoc", "* Returns True if the two SectionPoints are on the same edge of the first or the second element.
	:param Other:
	:type Other: Intf_SectionPoint
	:rtype: bool") IsOnSameEdge;
		Standard_Boolean IsOnSameEdge (const Intf_SectionPoint & Other);

		/****************** Merge ******************/
		%feature("compactdefaultargs") Merge;
		%feature("autodoc", "* Merges two SectionPoints.
	:param Other:
	:type Other: Intf_SectionPoint
	:rtype: None") Merge;
		void Merge (Intf_SectionPoint & Other);

		/****************** ParamOnFirst ******************/
		%feature("compactdefaultargs") ParamOnFirst;
		%feature("autodoc", "* Returns the cumulated Parameter of the SectionPoint on the first element.
	:rtype: float") ParamOnFirst;
		Standard_Real ParamOnFirst ();

		/****************** ParamOnSecond ******************/
		%feature("compactdefaultargs") ParamOnSecond;
		%feature("autodoc", "* Returns the cumulated Parameter of the section point on the second element.
	:rtype: float") ParamOnSecond;
		Standard_Real ParamOnSecond ();

		/****************** Pnt ******************/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "* Returns the location of the SectionPoint.
	:rtype: gp_Pnt") Pnt;
		const gp_Pnt  Pnt ();

		/****************** TypeOnFirst ******************/
		%feature("compactdefaultargs") TypeOnFirst;
		%feature("autodoc", "* Returns the type of the section point on the first element.
	:rtype: Intf_PIType") TypeOnFirst;
		Intf_PIType TypeOnFirst ();

		/****************** TypeOnSecond ******************/
		%feature("compactdefaultargs") TypeOnSecond;
		%feature("autodoc", "* Returns the type of the section point on the second element.
	:rtype: Intf_PIType") TypeOnSecond;
		Intf_PIType TypeOnSecond ();


        %extend{
            bool __eq_wrapper__(const Intf_SectionPoint  other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self, right):
            try:
                return self.__eq_wrapper__(right)
            except:
                return False
        }
        };


%extend Intf_SectionPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Intf_TangentZone *
*************************/
class Intf_TangentZone {
	public:
		/****************** Append ******************/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "* Adds a SectionPoint to the TangentZone.
	:param Pi:
	:type Pi: Intf_SectionPoint
	:rtype: None") Append;
		void Append (const Intf_SectionPoint & Pi);

		/****************** Append ******************/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "* Adds the TangentZone <Tzi> to <self>.
	:param Tzi:
	:type Tzi: Intf_TangentZone
	:rtype: None") Append;
		void Append (const Intf_TangentZone & Tzi);

		/****************** Contains ******************/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "* Checks if <ThePI> is in TangentZone.
	:param ThePI:
	:type ThePI: Intf_SectionPoint
	:rtype: bool") Contains;
		Standard_Boolean Contains (const Intf_SectionPoint & ThePI);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", ":param Indent:
	:type Indent: int
	:rtype: None") Dump;
		void Dump (const Standard_Integer Indent);

		/****************** GetPoint ******************/
		%feature("compactdefaultargs") GetPoint;
		%feature("autodoc", "* Gives the SectionPoint of address <Index> in the TangentZone.
	:param Index:
	:type Index: int
	:rtype: Intf_SectionPoint") GetPoint;
		const Intf_SectionPoint & GetPoint (const Standard_Integer Index);

		/****************** HasCommonRange ******************/
		%feature("compactdefaultargs") HasCommonRange;
		%feature("autodoc", "* Returns True if the TangentZone <Other> has a common part with <self>.
	:param Other:
	:type Other: Intf_TangentZone
	:rtype: bool") HasCommonRange;
		Standard_Boolean HasCommonRange (const Intf_TangentZone & Other);

		/****************** InfoFirst ******************/
		%feature("compactdefaultargs") InfoFirst;
		%feature("autodoc", "* Gives information about the first argument of the Interference. (Usable only for polygon)
	:param segMin:
	:type segMin: int
	:param paraMin:
	:type paraMin: float
	:param segMax:
	:type segMax: int
	:param paraMax:
	:type paraMax: float
	:rtype: None") InfoFirst;
		void InfoFirst (Standard_Integer &OutValue,Standard_Real &OutValue,Standard_Integer &OutValue,Standard_Real &OutValue);

		/****************** InfoSecond ******************/
		%feature("compactdefaultargs") InfoSecond;
		%feature("autodoc", "* Gives informations about the second argument of the Interference. (Usable only for polygon)
	:param segMin:
	:type segMin: int
	:param paraMin:
	:type paraMin: float
	:param segMax:
	:type segMax: int
	:param paraMax:
	:type paraMax: float
	:rtype: None") InfoSecond;
		void InfoSecond (Standard_Integer &OutValue,Standard_Real &OutValue,Standard_Integer &OutValue,Standard_Real &OutValue);

		/****************** Insert ******************/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "* Inserts a SectionPoint in the TangentZone.
	:param Pi:
	:type Pi: Intf_SectionPoint
	:rtype: bool") Insert;
		Standard_Boolean Insert (const Intf_SectionPoint & Pi);

		/****************** InsertAfter ******************/
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "* Inserts a SectionPoint after <Index> in the TangentZone.
	:param Index:
	:type Index: int
	:param Pi:
	:type Pi: Intf_SectionPoint
	:rtype: None") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Intf_SectionPoint & Pi);

		/****************** InsertBefore ******************/
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "* Inserts a SectionPoint before <Index> in the TangentZone.
	:param Index:
	:type Index: int
	:param Pi:
	:type Pi: Intf_SectionPoint
	:rtype: None") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Intf_SectionPoint & Pi);

		/****************** Intf_TangentZone ******************/
		%feature("compactdefaultargs") Intf_TangentZone;
		%feature("autodoc", "* Builds an empty tangent zone.
	:rtype: None") Intf_TangentZone;
		 Intf_TangentZone ();

		/****************** Intf_TangentZone ******************/
		%feature("compactdefaultargs") Intf_TangentZone;
		%feature("autodoc", "* Copies a Tangent zone.
	:param Other:
	:type Other: Intf_TangentZone
	:rtype: None") Intf_TangentZone;
		 Intf_TangentZone (const Intf_TangentZone & Other);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "* Compares two TangentZones.
	:param Other:
	:type Other: Intf_TangentZone
	:rtype: bool") IsEqual;
		Standard_Boolean IsEqual (const Intf_TangentZone & Other);

		/****************** NumberOfPoints ******************/
		%feature("compactdefaultargs") NumberOfPoints;
		%feature("autodoc", "* Returns number of SectionPoint in this TangentZone.
	:rtype: int") NumberOfPoints;
		Standard_Integer NumberOfPoints ();

		/****************** ParamOnFirst ******************/
		%feature("compactdefaultargs") ParamOnFirst;
		%feature("autodoc", "* Gives the parameter range of the TangentZone on the first argument of the Interference. (Usable only for polygon)
	:param paraMin:
	:type paraMin: float
	:param paraMax:
	:type paraMax: float
	:rtype: None") ParamOnFirst;
		void ParamOnFirst (Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** ParamOnSecond ******************/
		%feature("compactdefaultargs") ParamOnSecond;
		%feature("autodoc", "* Gives the parameter range of the TangentZone on the second argument of the Interference. (Usable only for polygon)
	:param paraMin:
	:type paraMin: float
	:param paraMax:
	:type paraMax: float
	:rtype: None") ParamOnSecond;
		void ParamOnSecond (Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** PolygonInsert ******************/
		%feature("compactdefaultargs") PolygonInsert;
		%feature("autodoc", "* Inserts a point in the polygonal TangentZone.
	:param Pi:
	:type Pi: Intf_SectionPoint
	:rtype: None") PolygonInsert;
		void PolygonInsert (const Intf_SectionPoint & Pi);

		/****************** RangeContains ******************/
		%feature("compactdefaultargs") RangeContains;
		%feature("autodoc", "* Returns True if <ThePI> is in the parameter range of the TangentZone.
	:param ThePI:
	:type ThePI: Intf_SectionPoint
	:rtype: bool") RangeContains;
		Standard_Boolean RangeContains (const Intf_SectionPoint & ThePI);


        %extend{
            bool __eq_wrapper__(const Intf_TangentZone  other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self, right):
            try:
                return self.__eq_wrapper__(right)
            except:
                return False
        }
        };


%extend Intf_TangentZone {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class Intf_Tool *
******************/
class Intf_Tool {
	public:
		/****************** BeginParam ******************/
		%feature("compactdefaultargs") BeginParam;
		%feature("autodoc", ":param SegmentNum:
	:type SegmentNum: int
	:rtype: float") BeginParam;
		Standard_Real BeginParam (const Standard_Integer SegmentNum);

		/****************** EndParam ******************/
		%feature("compactdefaultargs") EndParam;
		%feature("autodoc", ":param SegmentNum:
	:type SegmentNum: int
	:rtype: float") EndParam;
		Standard_Real EndParam (const Standard_Integer SegmentNum);

		/****************** Hypr2dBox ******************/
		%feature("compactdefaultargs") Hypr2dBox;
		%feature("autodoc", ":param theHypr2d:
	:type theHypr2d: gp_Hypr2d
	:param bounding:
	:type bounding: Bnd_Box2d
	:param boxHypr:
	:type boxHypr: Bnd_Box2d
	:rtype: None") Hypr2dBox;
		void Hypr2dBox (const gp_Hypr2d & theHypr2d,const Bnd_Box2d & bounding,Bnd_Box2d & boxHypr);

		/****************** HyprBox ******************/
		%feature("compactdefaultargs") HyprBox;
		%feature("autodoc", ":param theHypr:
	:type theHypr: gp_Hypr
	:param bounding:
	:type bounding: Bnd_Box
	:param boxHypr:
	:type boxHypr: Bnd_Box
	:rtype: None") HyprBox;
		void HyprBox (const gp_Hypr & theHypr,const Bnd_Box & bounding,Bnd_Box & boxHypr);

		/****************** Intf_Tool ******************/
		%feature("compactdefaultargs") Intf_Tool;
		%feature("autodoc", ":rtype: None") Intf_Tool;
		 Intf_Tool ();

		/****************** Lin2dBox ******************/
		%feature("compactdefaultargs") Lin2dBox;
		%feature("autodoc", ":param theLin2d:
	:type theLin2d: gp_Lin2d
	:param bounding:
	:type bounding: Bnd_Box2d
	:param boxLin:
	:type boxLin: Bnd_Box2d
	:rtype: None") Lin2dBox;
		void Lin2dBox (const gp_Lin2d & theLin2d,const Bnd_Box2d & bounding,Bnd_Box2d & boxLin);

		/****************** LinBox ******************/
		%feature("compactdefaultargs") LinBox;
		%feature("autodoc", ":param theLin:
	:type theLin: gp_Lin
	:param bounding:
	:type bounding: Bnd_Box
	:param boxLin:
	:type boxLin: Bnd_Box
	:rtype: None") LinBox;
		void LinBox (const gp_Lin & theLin,const Bnd_Box & bounding,Bnd_Box & boxLin);

		/****************** NbSegments ******************/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", ":rtype: int") NbSegments;
		Standard_Integer NbSegments ();

		/****************** Parab2dBox ******************/
		%feature("compactdefaultargs") Parab2dBox;
		%feature("autodoc", ":param theParab2d:
	:type theParab2d: gp_Parab2d
	:param bounding:
	:type bounding: Bnd_Box2d
	:param boxHypr:
	:type boxHypr: Bnd_Box2d
	:rtype: None") Parab2dBox;
		void Parab2dBox (const gp_Parab2d & theParab2d,const Bnd_Box2d & bounding,Bnd_Box2d & boxHypr);

		/****************** ParabBox ******************/
		%feature("compactdefaultargs") ParabBox;
		%feature("autodoc", ":param theParab:
	:type theParab: gp_Parab
	:param bounding:
	:type bounding: Bnd_Box
	:param boxHypr:
	:type boxHypr: Bnd_Box
	:rtype: None") ParabBox;
		void ParabBox (const gp_Parab & theParab,const Bnd_Box & bounding,Bnd_Box & boxHypr);

};


%extend Intf_Tool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class Intf_InterferencePolygon2d *
***********************************/
class Intf_InterferencePolygon2d : public Intf_Interference {
	public:
		/****************** Intf_InterferencePolygon2d ******************/
		%feature("compactdefaultargs") Intf_InterferencePolygon2d;
		%feature("autodoc", "* Constructs an empty interference of Polygon.
	:rtype: None") Intf_InterferencePolygon2d;
		 Intf_InterferencePolygon2d ();

		/****************** Intf_InterferencePolygon2d ******************/
		%feature("compactdefaultargs") Intf_InterferencePolygon2d;
		%feature("autodoc", "* Constructs and computes an interference between two Polygons.
	:param Obje1:
	:type Obje1: Intf_Polygon2d
	:param Obje2:
	:type Obje2: Intf_Polygon2d
	:rtype: None") Intf_InterferencePolygon2d;
		 Intf_InterferencePolygon2d (const Intf_Polygon2d & Obje1,const Intf_Polygon2d & Obje2);

		/****************** Intf_InterferencePolygon2d ******************/
		%feature("compactdefaultargs") Intf_InterferencePolygon2d;
		%feature("autodoc", "* Constructs and computes the auto interference of a Polygon.
	:param Obje:
	:type Obje: Intf_Polygon2d
	:rtype: None") Intf_InterferencePolygon2d;
		 Intf_InterferencePolygon2d (const Intf_Polygon2d & Obje);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Computes an interference between two Polygons.
	:param Obje1:
	:type Obje1: Intf_Polygon2d
	:param Obje2:
	:type Obje2: Intf_Polygon2d
	:rtype: None") Perform;
		void Perform (const Intf_Polygon2d & Obje1,const Intf_Polygon2d & Obje2);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Computes the self interference of a Polygon.
	:param Obje:
	:type Obje: Intf_Polygon2d
	:rtype: None") Perform;
		void Perform (const Intf_Polygon2d & Obje);

		/****************** Pnt2dValue ******************/
		%feature("compactdefaultargs") Pnt2dValue;
		%feature("autodoc", "* Gives the geometrical 2d point of the intersection point at address <Index> in the interference.
	:param Index:
	:type Index: int
	:rtype: gp_Pnt2d") Pnt2dValue;
		gp_Pnt2d Pnt2dValue (const Standard_Integer Index);

};


%extend Intf_InterferencePolygon2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
