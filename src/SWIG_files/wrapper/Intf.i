/*
Copyright 2008-2020 Thomas Paviot (tpaviot@gmail.com)

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

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum Intf_PIType {
	Intf_EXTERNAL = 0,
	Intf_FACE = 1,
	Intf_EDGE = 2,
	Intf_VERTEX = 3,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class Intf_PIType(IntEnum):
	Intf_EXTERNAL = 0
	Intf_FACE = 1
	Intf_EDGE = 2
	Intf_VERTEX = 3
Intf_EXTERNAL = Intf_PIType.Intf_EXTERNAL
Intf_FACE = Intf_PIType.Intf_FACE
Intf_EDGE = Intf_PIType.Intf_EDGE
Intf_VERTEX = Intf_PIType.Intf_VERTEX
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
%template(Intf_Array1OfLin) NCollection_Array1<gp_Lin>;

%extend NCollection_Array1<gp_Lin> {
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
%template(Intf_SeqOfSectionLine) NCollection_Sequence<Intf_SectionLine>;

%extend NCollection_Sequence<Intf_SectionLine> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(Intf_SeqOfSectionPoint) NCollection_Sequence<Intf_SectionPoint>;

%extend NCollection_Sequence<Intf_SectionPoint> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(Intf_SeqOfTangentZone) NCollection_Sequence<Intf_TangentZone>;

%extend NCollection_Sequence<Intf_TangentZone> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<gp_Lin> Intf_Array1OfLin;
typedef NCollection_Sequence<Intf_SectionLine> Intf_SeqOfSectionLine;
typedef NCollection_Sequence<Intf_SectionPoint> Intf_SeqOfSectionPoint;
typedef NCollection_Sequence<Intf_TangentZone> Intf_SeqOfTangentZone;
/* end typedefs declaration */

/*************
* class Intf *
*************/
%rename(intf) Intf;
class Intf {
	public:
		/****************** Contain ******************/
		/**** md5 signature: 156ef9419a42fbb64425e1d94938a4c4 ****/
		%feature("compactdefaultargs") Contain;
		%feature("autodoc", "Compute if the triangle <p1> <p2> <p3> contain <thepnt>.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt
P3: gp_Pnt
ThePnt: gp_Pnt

Returns
-------
bool
") Contain;
		static Standard_Boolean Contain(const gp_Pnt & P1, const gp_Pnt & P2, const gp_Pnt & P3, const gp_Pnt & ThePnt);

		/****************** PlaneEquation ******************/
		/**** md5 signature: 3d31c751b38275a0958b3d3f95a4af14 ****/
		%feature("compactdefaultargs") PlaneEquation;
		%feature("autodoc", "Computes the interference between two polygons in 2d. result : points of intersections and zones of tangence. computes the interference between a polygon or a straight line and a polyhedron. points of intersection and zones of tangence. give the plane equation of the triangle <p1> <p2> <p3>.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt
P3: gp_Pnt
NormalVector: gp_XYZ

Returns
-------
PolarDistance: float
") PlaneEquation;
		static void PlaneEquation(const gp_Pnt & P1, const gp_Pnt & P2, const gp_Pnt & P3, gp_XYZ & NormalVector, Standard_Real &OutValue);

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
		/**** md5 signature: 8db690ba8b601a23e59578a9a0afb5bb ****/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "Tests if the polylines of intersection or the zones of tangence contain the point of intersection <thepnt>.

Parameters
----------
ThePnt: Intf_SectionPoint

Returns
-------
bool
") Contains;
		Standard_Boolean Contains(const Intf_SectionPoint & ThePnt);

		/****************** Dump ******************/
		/**** md5 signature: 15b4b2e195645aebb43170ff7f15952a ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Dump;
		void Dump();

		/****************** GetTolerance ******************/
		/**** md5 signature: 0b68579e68d60bdd102d14afab21387e ****/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "Gives the tolerance used for the calculation.

Returns
-------
float
") GetTolerance;
		Standard_Real GetTolerance();

		/****************** Insert ******************/
		/**** md5 signature: 71cbe00f6c4a142c12a68911c6740031 ****/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "Inserts a new zone of tangence in the current list of tangent zones of the interference and returns true when done.

Parameters
----------
TheZone: Intf_TangentZone

Returns
-------
bool
") Insert;
		Standard_Boolean Insert(const Intf_TangentZone & TheZone);

		/****************** Insert ******************/
		/**** md5 signature: fbc4280014a2d36acc45dd0957195304 ****/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "Insert a new segment of intersection in the current list of polylines of intersection of the interference.

Parameters
----------
pdeb: Intf_SectionPoint
pfin: Intf_SectionPoint

Returns
-------
None
") Insert;
		void Insert(const Intf_SectionPoint & pdeb, const Intf_SectionPoint & pfin);

		/****************** LineValue ******************/
		/**** md5 signature: b704865f2c00714f3b0ac1887854a2ac ****/
		%feature("compactdefaultargs") LineValue;
		%feature("autodoc", "Gives the polyline of intersection at address <index> in the interference.

Parameters
----------
Index: int

Returns
-------
Intf_SectionLine
") LineValue;
		const Intf_SectionLine & LineValue(const Standard_Integer Index);

		/****************** NbSectionLines ******************/
		/**** md5 signature: 5d1ec577898373b206a6d53c486eab88 ****/
		%feature("compactdefaultargs") NbSectionLines;
		%feature("autodoc", "Gives the number of polylines of intersection in the interference.

Returns
-------
int
") NbSectionLines;
		Standard_Integer NbSectionLines();

		/****************** NbSectionPoints ******************/
		/**** md5 signature: b0aa9aa17c5a4b8c958465b588b90d3d ****/
		%feature("compactdefaultargs") NbSectionPoints;
		%feature("autodoc", "Gives the number of points of intersection in the interference.

Returns
-------
int
") NbSectionPoints;
		Standard_Integer NbSectionPoints();

		/****************** NbTangentZones ******************/
		/**** md5 signature: 031aadc96353eb85159345c32c6f3bb8 ****/
		%feature("compactdefaultargs") NbTangentZones;
		%feature("autodoc", "Gives the number of zones of tangence in the interference.

Returns
-------
int
") NbTangentZones;
		Standard_Integer NbTangentZones();

		/****************** PntValue ******************/
		/**** md5 signature: e6ced9cf8349bb488a07338813702561 ****/
		%feature("compactdefaultargs") PntValue;
		%feature("autodoc", "Gives the point of intersection of address index in the interference.

Parameters
----------
Index: int

Returns
-------
Intf_SectionPoint
") PntValue;
		const Intf_SectionPoint & PntValue(const Standard_Integer Index);

		/****************** ZoneValue ******************/
		/**** md5 signature: 1e1ef9f8bb7f993fcc74e246010ed9d5 ****/
		%feature("compactdefaultargs") ZoneValue;
		%feature("autodoc", "Gives the zone of tangence at address index in the interference.

Parameters
----------
Index: int

Returns
-------
Intf_TangentZone
") ZoneValue;
		const Intf_TangentZone & ZoneValue(const Standard_Integer Index);

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
		/**** md5 signature: 6bf984a05bf369fbbd8dca3c8e28fe3d ****/
		%feature("compactdefaultargs") Bounding;
		%feature("autodoc", "Returns the bounding box of the polygon.

Returns
-------
Bnd_Box2d
") Bounding;
		const Bnd_Box2d & Bounding();

		/****************** Closed ******************/
		/**** md5 signature: a8fb73c0af73671826a8b1d0720125a8 ****/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "Returns true if the polyline is closed.

Returns
-------
bool
") Closed;
		virtual Standard_Boolean Closed();

		/****************** DeflectionOverEstimation ******************/
		/**** md5 signature: e82e4ae6adfd64b8fc516358f6065772 ****/
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "Returns the tolerance of the polygon.

Returns
-------
float
") DeflectionOverEstimation;
		virtual Standard_Real DeflectionOverEstimation();

		/****************** NbSegments ******************/
		/**** md5 signature: 087ae63d8d49582ae2f8fd7945f7f59e ****/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Returns the number of segments in the polyline.

Returns
-------
int
") NbSegments;
		virtual Standard_Integer NbSegments();

		/****************** Segment ******************/
		/**** md5 signature: bc5ab1ff556cae31a31ab1853588bdcd ****/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "Returns the points of the segment <index> in the polygon.

Parameters
----------
theIndex: int
theBegin: gp_Pnt2d
theEnd: gp_Pnt2d

Returns
-------
None
") Segment;
		virtual void Segment(const Standard_Integer theIndex, gp_Pnt2d & theBegin, gp_Pnt2d & theEnd);

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
		/****************** Intf_SectionLine ******************/
		/**** md5 signature: a7999578d1604790b5cc1397812d055f ****/
		%feature("compactdefaultargs") Intf_SectionLine;
		%feature("autodoc", "Constructs an empty sectionline.

Returns
-------
None
") Intf_SectionLine;
		 Intf_SectionLine();

		/****************** Intf_SectionLine ******************/
		/**** md5 signature: 4b56474b46aabbb6e6873452dfb423e7 ****/
		%feature("compactdefaultargs") Intf_SectionLine;
		%feature("autodoc", "Copies a sectionline.

Parameters
----------
Other: Intf_SectionLine

Returns
-------
None
") Intf_SectionLine;
		 Intf_SectionLine(const Intf_SectionLine & Other);

		/****************** Append ******************/
		/**** md5 signature: ed6ae53170fb7759df7d4a47f4079341 ****/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "Adds a point at the end of the sectionline.

Parameters
----------
Pi: Intf_SectionPoint

Returns
-------
None
") Append;
		void Append(const Intf_SectionPoint & Pi);

		/****************** Append ******************/
		/**** md5 signature: 40c037fef681c19e8305cd12c1b47010 ****/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "Concatenates the sectionline <ls> at the end of the sectionline <self>.

Parameters
----------
LS: Intf_SectionLine

Returns
-------
None
") Append;
		void Append(Intf_SectionLine & LS);

		/****************** Close ******************/
		/**** md5 signature: d50d7ba65c2beb3eb436584b5735f108 ****/
		%feature("compactdefaultargs") Close;
		%feature("autodoc", "Closes the sectionline.

Returns
-------
None
") Close;
		void Close();

		/****************** Contains ******************/
		/**** md5 signature: be07516264da743a11034b366a6c2a69 ****/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "Returns true if thepi is in the sectionline <self>.

Parameters
----------
ThePI: Intf_SectionPoint

Returns
-------
bool
") Contains;
		Standard_Boolean Contains(const Intf_SectionPoint & ThePI);

		/****************** Dump ******************/
		/**** md5 signature: f0d397df9c761149ff15491c97c7fb2a ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Parameters
----------
Indent: int

Returns
-------
None
") Dump;
		void Dump(const Standard_Integer Indent);

		/****************** GetPoint ******************/
		/**** md5 signature: a4ea9d0ca5b9b2d467ad4ce33aefb421 ****/
		%feature("compactdefaultargs") GetPoint;
		%feature("autodoc", "Gives the point of intersection of address <index> in the sectionline.

Parameters
----------
Index: int

Returns
-------
Intf_SectionPoint
") GetPoint;
		const Intf_SectionPoint & GetPoint(const Standard_Integer Index);

		/****************** IsClosed ******************/
		/**** md5 signature: 29709d02fadc9fcb79a766bc9679271b ****/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Returns true if the sectionline is closed.

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsEnd ******************/
		/**** md5 signature: ece272bbe48c8ae65e931c27a1df2429 ****/
		%feature("compactdefaultargs") IsEnd;
		%feature("autodoc", "Checks if <thepi> is an end of the sectionline. returns 1 for the beginning, 2 for the end, otherwise 0.

Parameters
----------
ThePI: Intf_SectionPoint

Returns
-------
int
") IsEnd;
		Standard_Integer IsEnd(const Intf_SectionPoint & ThePI);

		/****************** IsEqual ******************/
		/**** md5 signature: 6bc841410a65a4b80b86b64372ac7b00 ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Compares two sectionlines.

Parameters
----------
Other: Intf_SectionLine

Returns
-------
bool
") IsEqual;
		Standard_Boolean IsEqual(const Intf_SectionLine & Other);

		/****************** NumberOfPoints ******************/
		/**** md5 signature: 08a156dcf48a55298dd198b89e929d8e ****/
		%feature("compactdefaultargs") NumberOfPoints;
		%feature("autodoc", "Returns number of points in this sectionline.

Returns
-------
int
") NumberOfPoints;
		Standard_Integer NumberOfPoints();

		/****************** Prepend ******************/
		/**** md5 signature: e5ed2c981ae507bf42166b84fc0d82c4 ****/
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "Adds a point to the beginning of the sectionline <self>.

Parameters
----------
Pi: Intf_SectionPoint

Returns
-------
None
") Prepend;
		void Prepend(const Intf_SectionPoint & Pi);

		/****************** Prepend ******************/
		/**** md5 signature: d6381ac4ce5097bf393f1093c6353456 ****/
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "Concatenates a sectionline <ls> at the beginning of the sectionline <self>.

Parameters
----------
LS: Intf_SectionLine

Returns
-------
None
") Prepend;
		void Prepend(Intf_SectionLine & LS);

		/****************** Reverse ******************/
		/**** md5 signature: b751d6874fc026e19a7a6cb37e9ac1b4 ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Reverses the order of the elements of the sectionline.

Returns
-------
None
") Reverse;
		void Reverse();


            %extend{
                bool __eq_wrapper__(const Intf_SectionLine other) {
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
		/****************** Intf_SectionPoint ******************/
		/**** md5 signature: 586c72061b8b30f48cbb6dc79344f36a ****/
		%feature("compactdefaultargs") Intf_SectionPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Intf_SectionPoint;
		 Intf_SectionPoint();

		/****************** Intf_SectionPoint ******************/
		/**** md5 signature: 354168116f1f0f7f24fa48c01643fff8 ****/
		%feature("compactdefaultargs") Intf_SectionPoint;
		%feature("autodoc", "Builds a sectionpoint with the respective dimensions (vertex edge or face) of the concerned arguments and their addresses in the topological structure.

Parameters
----------
Where: gp_Pnt
DimeO: Intf_PIType
AddrO1: int
AddrO2: int
ParamO: float
DimeT: Intf_PIType
AddrT1: int
AddrT2: int
ParamT: float
Incid: float

Returns
-------
None
") Intf_SectionPoint;
		 Intf_SectionPoint(const gp_Pnt & Where, const Intf_PIType DimeO, const Standard_Integer AddrO1, const Standard_Integer AddrO2, const Standard_Real ParamO, const Intf_PIType DimeT, const Standard_Integer AddrT1, const Standard_Integer AddrT2, const Standard_Real ParamT, const Standard_Real Incid);

		/****************** Intf_SectionPoint ******************/
		/**** md5 signature: 15ab5bba1cab2c2651398d9c12a63d96 ****/
		%feature("compactdefaultargs") Intf_SectionPoint;
		%feature("autodoc", "Builds a sectionpoint 2d with the respective dimensions (vertex or edge) of the concerned arguments and their addresses in the topological structure.

Parameters
----------
Where: gp_Pnt2d
DimeO: Intf_PIType
AddrO1: int
ParamO: float
DimeT: Intf_PIType
AddrT1: int
ParamT: float
Incid: float

Returns
-------
None
") Intf_SectionPoint;
		 Intf_SectionPoint(const gp_Pnt2d & Where, const Intf_PIType DimeO, const Standard_Integer AddrO1, const Standard_Real ParamO, const Intf_PIType DimeT, const Standard_Integer AddrT1, const Standard_Real ParamT, const Standard_Real Incid);

		/****************** Dump ******************/
		/**** md5 signature: f0d397df9c761149ff15491c97c7fb2a ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Parameters
----------
Indent: int

Returns
-------
None
") Dump;
		void Dump(const Standard_Integer Indent);

		/****************** Incidence ******************/
		/**** md5 signature: a54ce8012327d6bfaef1c0c55c6bff2c ****/
		%feature("compactdefaultargs") Incidence;
		%feature("autodoc", "Gives the incidence at this section point. the incidence between the two triangles is given by the cosine. the best incidence is 0. (pi/2). the worst is 1. (null angle).

Returns
-------
float
") Incidence;
		Standard_Real Incidence();

		/****************** InfoFirst ******************/
		/**** md5 signature: 926a9420119721acf9f191aeb5c5ae82 ****/
		%feature("compactdefaultargs") InfoFirst;
		%feature("autodoc", "No available documentation.

Parameters
----------
Dim: Intf_PIType

Returns
-------
Add1: int
Add2: int
Param: float
") InfoFirst;
		void InfoFirst(Intf_PIType & Dim, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Real &OutValue);

		/****************** InfoFirst ******************/
		/**** md5 signature: 20ef78affbd1bcd59c9ff0691a63d6e8 ****/
		%feature("compactdefaultargs") InfoFirst;
		%feature("autodoc", "Gives the datas about the first argument of the interference.

Parameters
----------
Dim: Intf_PIType

Returns
-------
Addr: int
Param: float
") InfoFirst;
		void InfoFirst(Intf_PIType & Dim, Standard_Integer &OutValue, Standard_Real &OutValue);

		/****************** InfoSecond ******************/
		/**** md5 signature: 0e6c6ce5ffa684bc9e1fd4cdc0839d91 ****/
		%feature("compactdefaultargs") InfoSecond;
		%feature("autodoc", "No available documentation.

Parameters
----------
Dim: Intf_PIType

Returns
-------
Add1: int
Add2: int
Param: float
") InfoSecond;
		void InfoSecond(Intf_PIType & Dim, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Real &OutValue);

		/****************** InfoSecond ******************/
		/**** md5 signature: 679ab58838015e2dca23bde4c3ef8e13 ****/
		%feature("compactdefaultargs") InfoSecond;
		%feature("autodoc", "Gives the datas about the second argument of the interference.

Parameters
----------
Dim: Intf_PIType

Returns
-------
Addr: int
Param: float
") InfoSecond;
		void InfoSecond(Intf_PIType & Dim, Standard_Integer &OutValue, Standard_Real &OutValue);

		/****************** IsEqual ******************/
		/**** md5 signature: 927719925907a38badbab5fe6cdce988 ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Returns true if the two sectionpoint have the same logical informations.

Parameters
----------
Other: Intf_SectionPoint

Returns
-------
bool
") IsEqual;
		Standard_Boolean IsEqual(const Intf_SectionPoint & Other);

		/****************** IsOnSameEdge ******************/
		/**** md5 signature: 952981c6627c427fbdce3a8ca9675f9e ****/
		%feature("compactdefaultargs") IsOnSameEdge;
		%feature("autodoc", "Returns true if the two sectionpoints are on the same edge of the first or the second element.

Parameters
----------
Other: Intf_SectionPoint

Returns
-------
bool
") IsOnSameEdge;
		Standard_Boolean IsOnSameEdge(const Intf_SectionPoint & Other);

		/****************** Merge ******************/
		/**** md5 signature: 8a78871c4bc6a59032fe9b7aa376c181 ****/
		%feature("compactdefaultargs") Merge;
		%feature("autodoc", "Merges two sectionpoints.

Parameters
----------
Other: Intf_SectionPoint

Returns
-------
None
") Merge;
		void Merge(Intf_SectionPoint & Other);

		/****************** ParamOnFirst ******************/
		/**** md5 signature: c1af1fad86dcc6635235f3d2a2efda3a ****/
		%feature("compactdefaultargs") ParamOnFirst;
		%feature("autodoc", "Returns the cumulated parameter of the sectionpoint on the first element.

Returns
-------
float
") ParamOnFirst;
		Standard_Real ParamOnFirst();

		/****************** ParamOnSecond ******************/
		/**** md5 signature: 4cf4e18e7ca9aa68a1f4328994d835d7 ****/
		%feature("compactdefaultargs") ParamOnSecond;
		%feature("autodoc", "Returns the cumulated parameter of the section point on the second element.

Returns
-------
float
") ParamOnSecond;
		Standard_Real ParamOnSecond();

		/****************** Pnt ******************/
		/**** md5 signature: c0bafeed50f4eebb5964e2bf8520bf90 ****/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "Returns the location of the sectionpoint.

Returns
-------
gp_Pnt
") Pnt;
		const gp_Pnt Pnt();

		/****************** TypeOnFirst ******************/
		/**** md5 signature: 5a72bebdda6a728b312d36787f79b92d ****/
		%feature("compactdefaultargs") TypeOnFirst;
		%feature("autodoc", "Returns the type of the section point on the first element.

Returns
-------
Intf_PIType
") TypeOnFirst;
		Intf_PIType TypeOnFirst();

		/****************** TypeOnSecond ******************/
		/**** md5 signature: 71ce3763cfab42cb46cbdd7b302f0414 ****/
		%feature("compactdefaultargs") TypeOnSecond;
		%feature("autodoc", "Returns the type of the section point on the second element.

Returns
-------
Intf_PIType
") TypeOnSecond;
		Intf_PIType TypeOnSecond();


            %extend{
                bool __eq_wrapper__(const Intf_SectionPoint other) {
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
		/****************** Intf_TangentZone ******************/
		/**** md5 signature: 8ecf12d85501c4484f50c776fce36a85 ****/
		%feature("compactdefaultargs") Intf_TangentZone;
		%feature("autodoc", "Builds an empty tangent zone.

Returns
-------
None
") Intf_TangentZone;
		 Intf_TangentZone();

		/****************** Intf_TangentZone ******************/
		/**** md5 signature: d2c82ce938386dafdb59addd61a22ecf ****/
		%feature("compactdefaultargs") Intf_TangentZone;
		%feature("autodoc", "Copies a tangent zone.

Parameters
----------
Other: Intf_TangentZone

Returns
-------
None
") Intf_TangentZone;
		 Intf_TangentZone(const Intf_TangentZone & Other);

		/****************** Append ******************/
		/**** md5 signature: ed6ae53170fb7759df7d4a47f4079341 ****/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "Adds a sectionpoint to the tangentzone.

Parameters
----------
Pi: Intf_SectionPoint

Returns
-------
None
") Append;
		void Append(const Intf_SectionPoint & Pi);

		/****************** Append ******************/
		/**** md5 signature: c9e38a47a3044132a9305d768ff8f762 ****/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "Adds the tangentzone <tzi> to <self>.

Parameters
----------
Tzi: Intf_TangentZone

Returns
-------
None
") Append;
		void Append(const Intf_TangentZone & Tzi);

		/****************** Contains ******************/
		/**** md5 signature: be07516264da743a11034b366a6c2a69 ****/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "Checks if <thepi> is in tangentzone.

Parameters
----------
ThePI: Intf_SectionPoint

Returns
-------
bool
") Contains;
		Standard_Boolean Contains(const Intf_SectionPoint & ThePI);

		/****************** Dump ******************/
		/**** md5 signature: f0d397df9c761149ff15491c97c7fb2a ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Parameters
----------
Indent: int

Returns
-------
None
") Dump;
		void Dump(const Standard_Integer Indent);

		/****************** GetPoint ******************/
		/**** md5 signature: a4ea9d0ca5b9b2d467ad4ce33aefb421 ****/
		%feature("compactdefaultargs") GetPoint;
		%feature("autodoc", "Gives the sectionpoint of address <index> in the tangentzone.

Parameters
----------
Index: int

Returns
-------
Intf_SectionPoint
") GetPoint;
		const Intf_SectionPoint & GetPoint(const Standard_Integer Index);

		/****************** HasCommonRange ******************/
		/**** md5 signature: 8b1479e7b80e217c3df8b97f3dc12ea5 ****/
		%feature("compactdefaultargs") HasCommonRange;
		%feature("autodoc", "Returns true if the tangentzone <other> has a common part with <self>.

Parameters
----------
Other: Intf_TangentZone

Returns
-------
bool
") HasCommonRange;
		Standard_Boolean HasCommonRange(const Intf_TangentZone & Other);

		/****************** InfoFirst ******************/
		/**** md5 signature: 47cb9500578f7ae633417afefbf8521b ****/
		%feature("compactdefaultargs") InfoFirst;
		%feature("autodoc", "Gives information about the first argument of the interference. (usable only for polygon).

Parameters
----------

Returns
-------
segMin: int
paraMin: float
segMax: int
paraMax: float
") InfoFirst;
		void InfoFirst(Standard_Integer &OutValue, Standard_Real &OutValue, Standard_Integer &OutValue, Standard_Real &OutValue);

		/****************** InfoSecond ******************/
		/**** md5 signature: 5f7628c3595ae1430ae905fb1aaa5468 ****/
		%feature("compactdefaultargs") InfoSecond;
		%feature("autodoc", "Gives informations about the second argument of the interference. (usable only for polygon).

Parameters
----------

Returns
-------
segMin: int
paraMin: float
segMax: int
paraMax: float
") InfoSecond;
		void InfoSecond(Standard_Integer &OutValue, Standard_Real &OutValue, Standard_Integer &OutValue, Standard_Real &OutValue);

		/****************** Insert ******************/
		/**** md5 signature: c218d5942b1197ae8c201bf9d308b0e7 ****/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "Inserts a sectionpoint in the tangentzone.

Parameters
----------
Pi: Intf_SectionPoint

Returns
-------
bool
") Insert;
		Standard_Boolean Insert(const Intf_SectionPoint & Pi);

		/****************** InsertAfter ******************/
		/**** md5 signature: 79a503be92b650a7108b45aa4ab56b82 ****/
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "Inserts a sectionpoint after <index> in the tangentzone.

Parameters
----------
Index: int
Pi: Intf_SectionPoint

Returns
-------
None
") InsertAfter;
		void InsertAfter(const Standard_Integer Index, const Intf_SectionPoint & Pi);

		/****************** InsertBefore ******************/
		/**** md5 signature: fdda2b3944af866b52689974ee5c9e83 ****/
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "Inserts a sectionpoint before <index> in the tangentzone.

Parameters
----------
Index: int
Pi: Intf_SectionPoint

Returns
-------
None
") InsertBefore;
		void InsertBefore(const Standard_Integer Index, const Intf_SectionPoint & Pi);

		/****************** IsEqual ******************/
		/**** md5 signature: 57d99b1ed842f83f7f61f43c9f9dd6fc ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Compares two tangentzones.

Parameters
----------
Other: Intf_TangentZone

Returns
-------
bool
") IsEqual;
		Standard_Boolean IsEqual(const Intf_TangentZone & Other);

		/****************** NumberOfPoints ******************/
		/**** md5 signature: 08a156dcf48a55298dd198b89e929d8e ****/
		%feature("compactdefaultargs") NumberOfPoints;
		%feature("autodoc", "Returns number of sectionpoint in this tangentzone.

Returns
-------
int
") NumberOfPoints;
		Standard_Integer NumberOfPoints();

		/****************** ParamOnFirst ******************/
		/**** md5 signature: 2d7771c6548d35b12f462c97b7fd79ed ****/
		%feature("compactdefaultargs") ParamOnFirst;
		%feature("autodoc", "Gives the parameter range of the tangentzone on the first argument of the interference. (usable only for polygon).

Parameters
----------

Returns
-------
paraMin: float
paraMax: float
") ParamOnFirst;
		void ParamOnFirst(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** ParamOnSecond ******************/
		/**** md5 signature: b146b9ecc208b8340c01cec02277baae ****/
		%feature("compactdefaultargs") ParamOnSecond;
		%feature("autodoc", "Gives the parameter range of the tangentzone on the second argument of the interference. (usable only for polygon).

Parameters
----------

Returns
-------
paraMin: float
paraMax: float
") ParamOnSecond;
		void ParamOnSecond(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** PolygonInsert ******************/
		/**** md5 signature: 401ab4d136066c46cae7cbe600560218 ****/
		%feature("compactdefaultargs") PolygonInsert;
		%feature("autodoc", "Inserts a point in the polygonal tangentzone.

Parameters
----------
Pi: Intf_SectionPoint

Returns
-------
None
") PolygonInsert;
		void PolygonInsert(const Intf_SectionPoint & Pi);

		/****************** RangeContains ******************/
		/**** md5 signature: 1a1fba3d09d37f6b5ccf865b904c91d0 ****/
		%feature("compactdefaultargs") RangeContains;
		%feature("autodoc", "Returns true if <thepi> is in the parameter range of the tangentzone.

Parameters
----------
ThePI: Intf_SectionPoint

Returns
-------
bool
") RangeContains;
		Standard_Boolean RangeContains(const Intf_SectionPoint & ThePI);


            %extend{
                bool __eq_wrapper__(const Intf_TangentZone other) {
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
		/****************** Intf_Tool ******************/
		/**** md5 signature: 2faf2d7a7218d83ab995af9ca02eabb9 ****/
		%feature("compactdefaultargs") Intf_Tool;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Intf_Tool;
		 Intf_Tool();

		/****************** BeginParam ******************/
		/**** md5 signature: 84c1c1ad39d95432060b5f123f7bd49a ****/
		%feature("compactdefaultargs") BeginParam;
		%feature("autodoc", "No available documentation.

Parameters
----------
SegmentNum: int

Returns
-------
float
") BeginParam;
		Standard_Real BeginParam(const Standard_Integer SegmentNum);

		/****************** EndParam ******************/
		/**** md5 signature: 31c22722db428201c045f44ab1bcffe0 ****/
		%feature("compactdefaultargs") EndParam;
		%feature("autodoc", "No available documentation.

Parameters
----------
SegmentNum: int

Returns
-------
float
") EndParam;
		Standard_Real EndParam(const Standard_Integer SegmentNum);

		/****************** Hypr2dBox ******************/
		/**** md5 signature: 8a782a74fec254a9ef7aca89808d6d7b ****/
		%feature("compactdefaultargs") Hypr2dBox;
		%feature("autodoc", "No available documentation.

Parameters
----------
theHypr2d: gp_Hypr2d
bounding: Bnd_Box2d
boxHypr: Bnd_Box2d

Returns
-------
None
") Hypr2dBox;
		void Hypr2dBox(const gp_Hypr2d & theHypr2d, const Bnd_Box2d & bounding, Bnd_Box2d & boxHypr);

		/****************** HyprBox ******************/
		/**** md5 signature: 94cebffe6bad342e49d5a81155dfa3be ****/
		%feature("compactdefaultargs") HyprBox;
		%feature("autodoc", "No available documentation.

Parameters
----------
theHypr: gp_Hypr
bounding: Bnd_Box
boxHypr: Bnd_Box

Returns
-------
None
") HyprBox;
		void HyprBox(const gp_Hypr & theHypr, const Bnd_Box & bounding, Bnd_Box & boxHypr);

		/****************** Lin2dBox ******************/
		/**** md5 signature: 224ed84afa640e7ad0a0128dfce6f792 ****/
		%feature("compactdefaultargs") Lin2dBox;
		%feature("autodoc", "No available documentation.

Parameters
----------
theLin2d: gp_Lin2d
bounding: Bnd_Box2d
boxLin: Bnd_Box2d

Returns
-------
None
") Lin2dBox;
		void Lin2dBox(const gp_Lin2d & theLin2d, const Bnd_Box2d & bounding, Bnd_Box2d & boxLin);

		/****************** LinBox ******************/
		/**** md5 signature: 4f22f51f101f891738c0e2db3614e0cf ****/
		%feature("compactdefaultargs") LinBox;
		%feature("autodoc", "No available documentation.

Parameters
----------
theLin: gp_Lin
bounding: Bnd_Box
boxLin: Bnd_Box

Returns
-------
None
") LinBox;
		void LinBox(const gp_Lin & theLin, const Bnd_Box & bounding, Bnd_Box & boxLin);

		/****************** NbSegments ******************/
		/**** md5 signature: 6791e2039921b3bb6b2ff0f8e741d76b ****/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbSegments;
		Standard_Integer NbSegments();

		/****************** Parab2dBox ******************/
		/**** md5 signature: 90884c06d1dbaa8731b2b3ad139132dd ****/
		%feature("compactdefaultargs") Parab2dBox;
		%feature("autodoc", "No available documentation.

Parameters
----------
theParab2d: gp_Parab2d
bounding: Bnd_Box2d
boxHypr: Bnd_Box2d

Returns
-------
None
") Parab2dBox;
		void Parab2dBox(const gp_Parab2d & theParab2d, const Bnd_Box2d & bounding, Bnd_Box2d & boxHypr);

		/****************** ParabBox ******************/
		/**** md5 signature: 1588872a35e979ee188e88046c83393a ****/
		%feature("compactdefaultargs") ParabBox;
		%feature("autodoc", "No available documentation.

Parameters
----------
theParab: gp_Parab
bounding: Bnd_Box
boxHypr: Bnd_Box

Returns
-------
None
") ParabBox;
		void ParabBox(const gp_Parab & theParab, const Bnd_Box & bounding, Bnd_Box & boxHypr);

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
		/**** md5 signature: a054e0d0ee0c07be0641141761d7c1b4 ****/
		%feature("compactdefaultargs") Intf_InterferencePolygon2d;
		%feature("autodoc", "Constructs an empty interference of polygon.

Returns
-------
None
") Intf_InterferencePolygon2d;
		 Intf_InterferencePolygon2d();

		/****************** Intf_InterferencePolygon2d ******************/
		/**** md5 signature: db69533852ac804b54a816068e40bb66 ****/
		%feature("compactdefaultargs") Intf_InterferencePolygon2d;
		%feature("autodoc", "Constructs and computes an interference between two polygons.

Parameters
----------
Obje1: Intf_Polygon2d
Obje2: Intf_Polygon2d

Returns
-------
None
") Intf_InterferencePolygon2d;
		 Intf_InterferencePolygon2d(const Intf_Polygon2d & Obje1, const Intf_Polygon2d & Obje2);

		/****************** Intf_InterferencePolygon2d ******************/
		/**** md5 signature: 128012a0826f47a87900350bc08c82a3 ****/
		%feature("compactdefaultargs") Intf_InterferencePolygon2d;
		%feature("autodoc", "Constructs and computes the auto interference of a polygon.

Parameters
----------
Obje: Intf_Polygon2d

Returns
-------
None
") Intf_InterferencePolygon2d;
		 Intf_InterferencePolygon2d(const Intf_Polygon2d & Obje);

		/****************** Perform ******************/
		/**** md5 signature: 5b779e4f57e8ce2f9a68fd70964dc607 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes an interference between two polygons.

Parameters
----------
Obje1: Intf_Polygon2d
Obje2: Intf_Polygon2d

Returns
-------
None
") Perform;
		void Perform(const Intf_Polygon2d & Obje1, const Intf_Polygon2d & Obje2);

		/****************** Perform ******************/
		/**** md5 signature: b034cffb7ed9e4ded91b809f55c3ae68 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes the self interference of a polygon.

Parameters
----------
Obje: Intf_Polygon2d

Returns
-------
None
") Perform;
		void Perform(const Intf_Polygon2d & Obje);

		/****************** Pnt2dValue ******************/
		/**** md5 signature: b47807b474167c80cc6ba5bf45358d37 ****/
		%feature("compactdefaultargs") Pnt2dValue;
		%feature("autodoc", "Gives the geometrical 2d point of the intersection point at address <index> in the interference.

Parameters
----------
Index: int

Returns
-------
gp_Pnt2d
") Pnt2dValue;
		gp_Pnt2d Pnt2dValue(const Standard_Integer Index);

};


%extend Intf_InterferencePolygon2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
