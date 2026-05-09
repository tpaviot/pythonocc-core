/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_intf.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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

/* python proxy classes for enums */
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
Array1ExtendIter(gp_Lin)

%template(Intf_SeqOfSectionLine) NCollection_Sequence<Intf_SectionLine>;

%extend NCollection_Sequence<Intf_SectionLine> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(Intf_SeqOfSectionPoint) NCollection_Sequence<Intf_SectionPoint>;

%extend NCollection_Sequence<Intf_SectionPoint> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(Intf_SeqOfTangentZone) NCollection_Sequence<Intf_TangentZone>;

%extend NCollection_Sequence<Intf_TangentZone> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
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
		/****** Intf::Contain ******/
		/****** md5 signature: f3e7a45dc147e0fd6975c3d927184f8d ******/
		%feature("compactdefaultargs") Contain;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt
P2: gp_Pnt
P3: gp_Pnt
ThePnt: gp_Pnt

Return
-------
bool

Description
-----------
Compute if the triangle <P1> <P2> <P3> contain <ThePnt>.
") Contain;
		static bool Contain(const gp_Pnt & P1, const gp_Pnt & P2, const gp_Pnt & P3, const gp_Pnt & ThePnt);

		/****** Intf::PlaneEquation ******/
		/****** md5 signature: 677295b1d6bf82280abb36cf82d8fb73 ******/
		%feature("compactdefaultargs") PlaneEquation;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt
P2: gp_Pnt
P3: gp_Pnt
NormalVector: gp_XYZ

Return
-------
PolarDistance: double

Description
-----------
Computes the interference between two polygons in 2d. Result: points of intersections and zones of tangence. Computes the interference between a polygon or a straight line and a polyhedron. Points of intersection and zones of tangence. Give the plane equation of the triangle <P1> <P2> <P3>.
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
		/****** Intf_Interference::Contains ******/
		/****** md5 signature: f47d4b64c2c9a1b651577e68e3f50d8f ******/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "
Parameters
----------
ThePnt: Intf_SectionPoint

Return
-------
bool

Description
-----------
Tests if the polylines of intersection or the zones of tangence contain the point of intersection <ThePnt>.
") Contains;
		bool Contains(const Intf_SectionPoint & ThePnt);

		/****** Intf_Interference::Dump ******/
		/****** md5 signature: 15b4b2e195645aebb43170ff7f15952a ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Dump;
		void Dump();

		/****** Intf_Interference::GetTolerance ******/
		/****** md5 signature: 20360866d6338eb8a4e50f80a4bf35d3 ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Gives the tolerance used for the calculation.
") GetTolerance;
		double GetTolerance();

		/****** Intf_Interference::Insert ******/
		/****** md5 signature: ecd7a4b92ac96fbae3b2ed5b81e00268 ******/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "
Parameters
----------
TheZone: Intf_TangentZone

Return
-------
bool

Description
-----------
Inserts a new zone of tangence in the current list of tangent zones of the interference and returns True when done.
") Insert;
		bool Insert(const Intf_TangentZone & TheZone);

		/****** Intf_Interference::Insert ******/
		/****** md5 signature: fbc4280014a2d36acc45dd0957195304 ******/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "
Parameters
----------
pdeb: Intf_SectionPoint
pfin: Intf_SectionPoint

Return
-------
None

Description
-----------
Insert a new segment of intersection in the current list of polylines of intersection of the interference.
") Insert;
		void Insert(const Intf_SectionPoint & pdeb, const Intf_SectionPoint & pfin);

		/****** Intf_Interference::LineValue ******/
		/****** md5 signature: ffbda651b20d7a3a14b07d8a2bbe6bae ******/
		%feature("compactdefaultargs") LineValue;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
Intf_SectionLine

Description
-----------
Gives the polyline of intersection at address <Index> in the interference.
") LineValue;
		const Intf_SectionLine & LineValue(const int Index);

		/****** Intf_Interference::NbSectionLines ******/
		/****** md5 signature: 1ddb0ab84a8c80eb26a9314db561c1f6 ******/
		%feature("compactdefaultargs") NbSectionLines;
		%feature("autodoc", "Return
-------
int

Description
-----------
Gives the number of polylines of intersection in the interference.
") NbSectionLines;
		int NbSectionLines();

		/****** Intf_Interference::NbSectionPoints ******/
		/****** md5 signature: 4aa69d6b5c358eb29a823e311e01592c ******/
		%feature("compactdefaultargs") NbSectionPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Gives the number of points of intersection in the interference.
") NbSectionPoints;
		int NbSectionPoints();

		/****** Intf_Interference::NbTangentZones ******/
		/****** md5 signature: fd338de2c41fae8f35075602ab70de1e ******/
		%feature("compactdefaultargs") NbTangentZones;
		%feature("autodoc", "Return
-------
int

Description
-----------
Gives the number of zones of tangence in the interference.
") NbTangentZones;
		int NbTangentZones();

		/****** Intf_Interference::PntValue ******/
		/****** md5 signature: fc7044c17da4696c2d0059a82f38f55e ******/
		%feature("compactdefaultargs") PntValue;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
Intf_SectionPoint

Description
-----------
Gives the point of intersection of address Index in the interference.
") PntValue;
		const Intf_SectionPoint & PntValue(const int Index);

		/****** Intf_Interference::ZoneValue ******/
		/****** md5 signature: 7f58c2b7df999129ed02600377b92542 ******/
		%feature("compactdefaultargs") ZoneValue;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
Intf_TangentZone

Description
-----------
Gives the zone of tangence at address Index in the interference.
") ZoneValue;
		const Intf_TangentZone & ZoneValue(const int Index);

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
		/****** Intf_Polygon2d::Bounding ******/
		/****** md5 signature: 6bf984a05bf369fbbd8dca3c8e28fe3d ******/
		%feature("compactdefaultargs") Bounding;
		%feature("autodoc", "Return
-------
Bnd_Box2d

Description
-----------
Returns the bounding box of the polygon.
") Bounding;
		const Bnd_Box2d & Bounding();

		/****** Intf_Polygon2d::Closed ******/
		/****** md5 signature: 895307ddb450574aa7e1f957d547f684 ******/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the polyline is closed.
") Closed;
		virtual bool Closed();

		/****** Intf_Polygon2d::DeflectionOverEstimation ******/
		/****** md5 signature: a0d0dc0b17b6db5e485c30af14c92136 ******/
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the tolerance of the polygon.
") DeflectionOverEstimation;
		virtual double DeflectionOverEstimation();

		/****** Intf_Polygon2d::NbSegments ******/
		/****** md5 signature: dbfc3af650268281b98b8686f72e5618 ******/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of Segments in the polyline.
") NbSegments;
		virtual int NbSegments();

		/****** Intf_Polygon2d::Segment ******/
		/****** md5 signature: f1f0eb353ddfcf0aeeb8a6295a2548bc ******/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theBegin: gp_Pnt2d
theEnd: gp_Pnt2d

Return
-------
None

Description
-----------
Returns the points of the segment <Index> in the Polygon.
") Segment;
		virtual void Segment(const int theIndex, gp_Pnt2d & theBegin, gp_Pnt2d & theEnd);

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
		/****** Intf_SectionLine::Intf_SectionLine ******/
		/****** md5 signature: a7999578d1604790b5cc1397812d055f ******/
		%feature("compactdefaultargs") Intf_SectionLine;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty SectionLine.
") Intf_SectionLine;
		 Intf_SectionLine();

		/****** Intf_SectionLine::Intf_SectionLine ******/
		/****** md5 signature: 4b56474b46aabbb6e6873452dfb423e7 ******/
		%feature("compactdefaultargs") Intf_SectionLine;
		%feature("autodoc", "
Parameters
----------
Other: Intf_SectionLine

Return
-------
None

Description
-----------
Copies a SectionLine.
") Intf_SectionLine;
		 Intf_SectionLine(const Intf_SectionLine & Other);

		/****** Intf_SectionLine::Append ******/
		/****** md5 signature: ed6ae53170fb7759df7d4a47f4079341 ******/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
Pi: Intf_SectionPoint

Return
-------
None

Description
-----------
Adds a point at the end of the SectionLine.
") Append;
		void Append(const Intf_SectionPoint & Pi);

		/****** Intf_SectionLine::Append ******/
		/****** md5 signature: 40c037fef681c19e8305cd12c1b47010 ******/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
LS: Intf_SectionLine

Return
-------
None

Description
-----------
Concatenates the SectionLine <LS> at the end of the SectionLine <self>.
") Append;
		void Append(Intf_SectionLine & LS);

		/****** Intf_SectionLine::Close ******/
		/****** md5 signature: d50d7ba65c2beb3eb436584b5735f108 ******/
		%feature("compactdefaultargs") Close;
		%feature("autodoc", "Return
-------
None

Description
-----------
Closes the SectionLine.
") Close;
		void Close();

		/****** Intf_SectionLine::Contains ******/
		/****** md5 signature: 2737c22549a5c9de62eab21148640678 ******/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "
Parameters
----------
ThePI: Intf_SectionPoint

Return
-------
bool

Description
-----------
Returns True if ThePI is in the SectionLine <self>.
") Contains;
		bool Contains(const Intf_SectionPoint & ThePI);

		/****** Intf_SectionLine::Dump ******/
		/****** md5 signature: 8982a47168524f427d3a4ec28bf82ef7 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
Indent: int

Return
-------
None

Description
-----------
No available documentation.
") Dump;
		void Dump(const int Indent);

		/****** Intf_SectionLine::GetPoint ******/
		/****** md5 signature: 48c5e57e1f8102dd176d40f541ab402f ******/
		%feature("compactdefaultargs") GetPoint;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
Intf_SectionPoint

Description
-----------
Gives the point of intersection of address <Index> in the SectionLine.
") GetPoint;
		const Intf_SectionPoint & GetPoint(const int Index);

		/****** Intf_SectionLine::IsClosed ******/
		/****** md5 signature: 66fc0caa1853d24780b1d28b8296bc6c ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the SectionLine is closed.
") IsClosed;
		bool IsClosed();

		/****** Intf_SectionLine::IsEnd ******/
		/****** md5 signature: c01e46f85cdaa09458fad5dfae03ade9 ******/
		%feature("compactdefaultargs") IsEnd;
		%feature("autodoc", "
Parameters
----------
ThePI: Intf_SectionPoint

Return
-------
int

Description
-----------
Checks if <ThePI> is an end of the SectionLine. Returns 1 for the beginning, 2 for the end, otherwise 0.
") IsEnd;
		int IsEnd(const Intf_SectionPoint & ThePI);

		/****** Intf_SectionLine::IsEqual ******/
		/****** md5 signature: c944ecd8fafd680585aa9ad832914c81 ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
Other: Intf_SectionLine

Return
-------
bool

Description
-----------
Compares two SectionLines.
") IsEqual;
		bool IsEqual(const Intf_SectionLine & Other);

		/****** Intf_SectionLine::NumberOfPoints ******/
		/****** md5 signature: 8303ed651fbba205b29ad19fe3508579 ******/
		%feature("compactdefaultargs") NumberOfPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of points in this SectionLine.
") NumberOfPoints;
		int NumberOfPoints();

		/****** Intf_SectionLine::Prepend ******/
		/****** md5 signature: e5ed2c981ae507bf42166b84fc0d82c4 ******/
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "
Parameters
----------
Pi: Intf_SectionPoint

Return
-------
None

Description
-----------
Adds a point to the beginning of the SectionLine <self>.
") Prepend;
		void Prepend(const Intf_SectionPoint & Pi);

		/****** Intf_SectionLine::Prepend ******/
		/****** md5 signature: d6381ac4ce5097bf393f1093c6353456 ******/
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "
Parameters
----------
LS: Intf_SectionLine

Return
-------
None

Description
-----------
Concatenates a SectionLine <LS> at the beginning of the SectionLine <self>.
") Prepend;
		void Prepend(Intf_SectionLine & LS);

		/****** Intf_SectionLine::Reverse ******/
		/****** md5 signature: b751d6874fc026e19a7a6cb37e9ac1b4 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the order of the elements of the SectionLine.
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
		/****** Intf_SectionPoint::Intf_SectionPoint ******/
		/****** md5 signature: 586c72061b8b30f48cbb6dc79344f36a ******/
		%feature("compactdefaultargs") Intf_SectionPoint;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Intf_SectionPoint;
		 Intf_SectionPoint();

		/****** Intf_SectionPoint::Intf_SectionPoint ******/
		/****** md5 signature: e86a3c2a44b602b4d1ef834003b3820a ******/
		%feature("compactdefaultargs") Intf_SectionPoint;
		%feature("autodoc", "
Parameters
----------
Where: gp_Pnt
DimeO: Intf_PIType
AddrO1: int
AddrO2: int
ParamO: double
DimeT: Intf_PIType
AddrT1: int
AddrT2: int
ParamT: double
Incid: double

Return
-------
None

Description
-----------
Builds a SectionPoint with the respective dimensions (vertex edge or face) of the concerned arguments and their addresses in the Topological structure.
") Intf_SectionPoint;
		 Intf_SectionPoint(const gp_Pnt & Where, const Intf_PIType DimeO, const int AddrO1, const int AddrO2, const double ParamO, const Intf_PIType DimeT, const int AddrT1, const int AddrT2, const double ParamT, const double Incid);

		/****** Intf_SectionPoint::Intf_SectionPoint ******/
		/****** md5 signature: c5681101b76aa822ee675522404d10b9 ******/
		%feature("compactdefaultargs") Intf_SectionPoint;
		%feature("autodoc", "
Parameters
----------
Where: gp_Pnt2d
DimeO: Intf_PIType
AddrO1: int
ParamO: double
DimeT: Intf_PIType
AddrT1: int
ParamT: double
Incid: double

Return
-------
None

Description
-----------
Builds a SectionPoint 2d with the respective dimensions (vertex or edge) of the concerned arguments and their addresses in the Topological structure.
") Intf_SectionPoint;
		 Intf_SectionPoint(const gp_Pnt2d & Where, const Intf_PIType DimeO, const int AddrO1, const double ParamO, const Intf_PIType DimeT, const int AddrT1, const double ParamT, const double Incid);

		/****** Intf_SectionPoint::Dump ******/
		/****** md5 signature: 8982a47168524f427d3a4ec28bf82ef7 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
Indent: int

Return
-------
None

Description
-----------
No available documentation.
") Dump;
		void Dump(const int Indent);

		/****** Intf_SectionPoint::Incidence ******/
		/****** md5 signature: 9ea935f6bccd380e2ba9a4faa6278620 ******/
		%feature("compactdefaultargs") Incidence;
		%feature("autodoc", "Return
-------
double

Description
-----------
Gives the incidence at this section point. The incidence between the two triangles is given by the cosine. The best incidence is 0. (PI/2). The worst is 1. (null angle).
") Incidence;
		double Incidence();

		/****** Intf_SectionPoint::InfoFirst ******/
		/****** md5 signature: 4899bf83579a896a61a26706f036d2dd ******/
		%feature("compactdefaultargs") InfoFirst;
		%feature("autodoc", "
Parameters
----------

Return
-------
Dim: Intf_PIType
Add1: int
Add2: int
Param: double

Description
-----------
No available documentation.
") InfoFirst;
		void InfoFirst(Intf_PIType &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Real &OutValue);

		/****** Intf_SectionPoint::InfoFirst ******/
		/****** md5 signature: dc1146bb80f0379c95ed6c0e7792392d ******/
		%feature("compactdefaultargs") InfoFirst;
		%feature("autodoc", "
Parameters
----------

Return
-------
Dim: Intf_PIType
Addr: int
Param: double

Description
-----------
Gives the data about the first argument of the Interference.
") InfoFirst;
		void InfoFirst(Intf_PIType &OutValue, Standard_Integer &OutValue, Standard_Real &OutValue);

		/****** Intf_SectionPoint::InfoSecond ******/
		/****** md5 signature: b1d348fa7edfa5b49e372737be058d7a ******/
		%feature("compactdefaultargs") InfoSecond;
		%feature("autodoc", "
Parameters
----------

Return
-------
Dim: Intf_PIType
Add1: int
Add2: int
Param: double

Description
-----------
No available documentation.
") InfoSecond;
		void InfoSecond(Intf_PIType &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Real &OutValue);

		/****** Intf_SectionPoint::InfoSecond ******/
		/****** md5 signature: 08b703a5d65ea678ca110fa420fdc335 ******/
		%feature("compactdefaultargs") InfoSecond;
		%feature("autodoc", "
Parameters
----------

Return
-------
Dim: Intf_PIType
Addr: int
Param: double

Description
-----------
Gives the data about the second argument of the Interference.
") InfoSecond;
		void InfoSecond(Intf_PIType &OutValue, Standard_Integer &OutValue, Standard_Real &OutValue);

		/****** Intf_SectionPoint::IsEqual ******/
		/****** md5 signature: bb39313695700bce16c826fcbfb7de07 ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
Other: Intf_SectionPoint

Return
-------
bool

Description
-----------
Returns True if the two SectionPoint have the same logical information.
") IsEqual;
		bool IsEqual(const Intf_SectionPoint & Other);

		/****** Intf_SectionPoint::IsOnSameEdge ******/
		/****** md5 signature: aa80fe7c49339a678e944795ee939041 ******/
		%feature("compactdefaultargs") IsOnSameEdge;
		%feature("autodoc", "
Parameters
----------
Other: Intf_SectionPoint

Return
-------
bool

Description
-----------
Returns True if the two SectionPoints are on the same edge of the first or the second element.
") IsOnSameEdge;
		bool IsOnSameEdge(const Intf_SectionPoint & Other);

		/****** Intf_SectionPoint::Merge ******/
		/****** md5 signature: 8a78871c4bc6a59032fe9b7aa376c181 ******/
		%feature("compactdefaultargs") Merge;
		%feature("autodoc", "
Parameters
----------
Other: Intf_SectionPoint

Return
-------
None

Description
-----------
Merges two SectionPoints.
") Merge;
		void Merge(Intf_SectionPoint & Other);

		/****** Intf_SectionPoint::ParamOnFirst ******/
		/****** md5 signature: 2f88afb75508f4b380339ca1dd478625 ******/
		%feature("compactdefaultargs") ParamOnFirst;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the cumulated Parameter of the SectionPoint on the first element.
") ParamOnFirst;
		double ParamOnFirst();

		/****** Intf_SectionPoint::ParamOnSecond ******/
		/****** md5 signature: 6368db0882aa68546b85e64558fde976 ******/
		%feature("compactdefaultargs") ParamOnSecond;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the cumulated Parameter of the section point on the second element.
") ParamOnSecond;
		double ParamOnSecond();

		/****** Intf_SectionPoint::Pnt ******/
		/****** md5 signature: c0bafeed50f4eebb5964e2bf8520bf90 ******/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the location of the SectionPoint.
") Pnt;
		const gp_Pnt Pnt();

		/****** Intf_SectionPoint::TypeOnFirst ******/
		/****** md5 signature: 5a72bebdda6a728b312d36787f79b92d ******/
		%feature("compactdefaultargs") TypeOnFirst;
		%feature("autodoc", "Return
-------
Intf_PIType

Description
-----------
Returns the type of the section point on the first element.
") TypeOnFirst;
		Intf_PIType TypeOnFirst();

		/****** Intf_SectionPoint::TypeOnSecond ******/
		/****** md5 signature: 71ce3763cfab42cb46cbdd7b302f0414 ******/
		%feature("compactdefaultargs") TypeOnSecond;
		%feature("autodoc", "Return
-------
Intf_PIType

Description
-----------
Returns the type of the section point on the second element.
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
		/****** Intf_TangentZone::Intf_TangentZone ******/
		/****** md5 signature: 8ecf12d85501c4484f50c776fce36a85 ******/
		%feature("compactdefaultargs") Intf_TangentZone;
		%feature("autodoc", "Return
-------
None

Description
-----------
Builds an empty tangent zone.
") Intf_TangentZone;
		 Intf_TangentZone();

		/****** Intf_TangentZone::Append ******/
		/****** md5 signature: ed6ae53170fb7759df7d4a47f4079341 ******/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
Pi: Intf_SectionPoint

Return
-------
None

Description
-----------
Adds a SectionPoint to the TangentZone.
") Append;
		void Append(const Intf_SectionPoint & Pi);

		/****** Intf_TangentZone::Append ******/
		/****** md5 signature: c9e38a47a3044132a9305d768ff8f762 ******/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
Tzi: Intf_TangentZone

Return
-------
None

Description
-----------
Adds the TangentZone <Tzi> to <self>.
") Append;
		void Append(const Intf_TangentZone & Tzi);

		/****** Intf_TangentZone::Contains ******/
		/****** md5 signature: 2737c22549a5c9de62eab21148640678 ******/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "
Parameters
----------
ThePI: Intf_SectionPoint

Return
-------
bool

Description
-----------
Checks if <ThePI> is in TangentZone.
") Contains;
		bool Contains(const Intf_SectionPoint & ThePI);

		/****** Intf_TangentZone::Dump ******/
		/****** md5 signature: 8982a47168524f427d3a4ec28bf82ef7 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
Indent: int

Return
-------
None

Description
-----------
No available documentation.
") Dump;
		void Dump(const int Indent);

		/****** Intf_TangentZone::GetPoint ******/
		/****** md5 signature: 48c5e57e1f8102dd176d40f541ab402f ******/
		%feature("compactdefaultargs") GetPoint;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
Intf_SectionPoint

Description
-----------
Gives the SectionPoint of address <Index> in the TangentZone.
") GetPoint;
		const Intf_SectionPoint & GetPoint(const int Index);

		/****** Intf_TangentZone::HasCommonRange ******/
		/****** md5 signature: dbcf8b92f279b1df56d2a0fa2017a876 ******/
		%feature("compactdefaultargs") HasCommonRange;
		%feature("autodoc", "
Parameters
----------
Other: Intf_TangentZone

Return
-------
bool

Description
-----------
Returns True if the TangentZone <Other> has a common part with <self>.
") HasCommonRange;
		bool HasCommonRange(const Intf_TangentZone & Other);

		/****** Intf_TangentZone::InfoFirst ******/
		/****** md5 signature: 7b6dae32e5f379e2fb14bac93b22d558 ******/
		%feature("compactdefaultargs") InfoFirst;
		%feature("autodoc", "
Parameters
----------

Return
-------
segMin: int
paraMin: double
segMax: int
paraMax: double

Description
-----------
Gives information about the first argument of the Interference. (Usable only for polygon).
") InfoFirst;
		void InfoFirst(Standard_Integer &OutValue, Standard_Real &OutValue, Standard_Integer &OutValue, Standard_Real &OutValue);

		/****** Intf_TangentZone::InfoSecond ******/
		/****** md5 signature: 3d48eefab691d501041e6dc10ed98ac2 ******/
		%feature("compactdefaultargs") InfoSecond;
		%feature("autodoc", "
Parameters
----------

Return
-------
segMin: int
paraMin: double
segMax: int
paraMax: double

Description
-----------
Gives information about the second argument of the Interference. (Usable only for polygon).
") InfoSecond;
		void InfoSecond(Standard_Integer &OutValue, Standard_Real &OutValue, Standard_Integer &OutValue, Standard_Real &OutValue);

		/****** Intf_TangentZone::Insert ******/
		/****** md5 signature: 9a32337cc66e170230bae0707a008bce ******/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "
Parameters
----------
Pi: Intf_SectionPoint

Return
-------
bool

Description
-----------
Inserts a SectionPoint in the TangentZone.
") Insert;
		bool Insert(const Intf_SectionPoint & Pi);

		/****** Intf_TangentZone::InsertAfter ******/
		/****** md5 signature: 13a844355ff5292d4eedcfc6e7b13022 ******/
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "
Parameters
----------
Index: int
Pi: Intf_SectionPoint

Return
-------
None

Description
-----------
Inserts a SectionPoint after <Index> in the TangentZone.
") InsertAfter;
		void InsertAfter(const int Index, const Intf_SectionPoint & Pi);

		/****** Intf_TangentZone::InsertBefore ******/
		/****** md5 signature: 0e9948d35074911abd244aa2398dfdf8 ******/
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "
Parameters
----------
Index: int
Pi: Intf_SectionPoint

Return
-------
None

Description
-----------
Inserts a SectionPoint before <Index> in the TangentZone.
") InsertBefore;
		void InsertBefore(const int Index, const Intf_SectionPoint & Pi);

		/****** Intf_TangentZone::IsEqual ******/
		/****** md5 signature: d023c56e254011090fd91ebc01501ceb ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
Other: Intf_TangentZone

Return
-------
bool

Description
-----------
Compares two TangentZones.
") IsEqual;
		bool IsEqual(const Intf_TangentZone & Other);

		/****** Intf_TangentZone::NumberOfPoints ******/
		/****** md5 signature: 8303ed651fbba205b29ad19fe3508579 ******/
		%feature("compactdefaultargs") NumberOfPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of SectionPoint in this TangentZone.
") NumberOfPoints;
		int NumberOfPoints();

		/****** Intf_TangentZone::ParamOnFirst ******/
		/****** md5 signature: fcc5379d5a343382d46b53183ae8ad67 ******/
		%feature("compactdefaultargs") ParamOnFirst;
		%feature("autodoc", "
Parameters
----------

Return
-------
paraMin: double
paraMax: double

Description
-----------
Gives the parameter range of the TangentZone on the first argument of the Interference. (Usable only for polygon).
") ParamOnFirst;
		void ParamOnFirst(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Intf_TangentZone::ParamOnSecond ******/
		/****** md5 signature: c97797d030fc9b8f606f9a2d21a2f9ae ******/
		%feature("compactdefaultargs") ParamOnSecond;
		%feature("autodoc", "
Parameters
----------

Return
-------
paraMin: double
paraMax: double

Description
-----------
Gives the parameter range of the TangentZone on the second argument of the Interference. (Usable only for polygon).
") ParamOnSecond;
		void ParamOnSecond(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Intf_TangentZone::PolygonInsert ******/
		/****** md5 signature: 401ab4d136066c46cae7cbe600560218 ******/
		%feature("compactdefaultargs") PolygonInsert;
		%feature("autodoc", "
Parameters
----------
Pi: Intf_SectionPoint

Return
-------
None

Description
-----------
Inserts a point in the polygonal TangentZone.
") PolygonInsert;
		void PolygonInsert(const Intf_SectionPoint & Pi);

		/****** Intf_TangentZone::RangeContains ******/
		/****** md5 signature: bd524989ad17f65157225cfc73d64c6e ******/
		%feature("compactdefaultargs") RangeContains;
		%feature("autodoc", "
Parameters
----------
ThePI: Intf_SectionPoint

Return
-------
bool

Description
-----------
Returns True if <ThePI> is in the parameter range of the TangentZone.
") RangeContains;
		bool RangeContains(const Intf_SectionPoint & ThePI);


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
		/****** Intf_Tool::Intf_Tool ******/
		/****** md5 signature: 2faf2d7a7218d83ab995af9ca02eabb9 ******/
		%feature("compactdefaultargs") Intf_Tool;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Intf_Tool;
		 Intf_Tool();

		/****** Intf_Tool::BeginParam ******/
		/****** md5 signature: ff604310cbdcfa238abeee4e1a0d5cfe ******/
		%feature("compactdefaultargs") BeginParam;
		%feature("autodoc", "
Parameters
----------
SegmentNum: int

Return
-------
double

Description
-----------
No available documentation.
") BeginParam;
		double BeginParam(const int SegmentNum);

		/****** Intf_Tool::EndParam ******/
		/****** md5 signature: e3c9697a4c8a3601132fed35b9419eff ******/
		%feature("compactdefaultargs") EndParam;
		%feature("autodoc", "
Parameters
----------
SegmentNum: int

Return
-------
double

Description
-----------
No available documentation.
") EndParam;
		double EndParam(const int SegmentNum);

		/****** Intf_Tool::Hypr2dBox ******/
		/****** md5 signature: 8a782a74fec254a9ef7aca89808d6d7b ******/
		%feature("compactdefaultargs") Hypr2dBox;
		%feature("autodoc", "
Parameters
----------
theHypr2d: gp_Hypr2d
bounding: Bnd_Box2d
boxHypr: Bnd_Box2d

Return
-------
None

Description
-----------
No available documentation.
") Hypr2dBox;
		void Hypr2dBox(const gp_Hypr2d & theHypr2d, const Bnd_Box2d & bounding, Bnd_Box2d & boxHypr);

		/****** Intf_Tool::HyprBox ******/
		/****** md5 signature: 94cebffe6bad342e49d5a81155dfa3be ******/
		%feature("compactdefaultargs") HyprBox;
		%feature("autodoc", "
Parameters
----------
theHypr: gp_Hypr
bounding: Bnd_Box
boxHypr: Bnd_Box

Return
-------
None

Description
-----------
No available documentation.
") HyprBox;
		void HyprBox(const gp_Hypr & theHypr, const Bnd_Box & bounding, Bnd_Box & boxHypr);

		/****** Intf_Tool::Lin2dBox ******/
		/****** md5 signature: 224ed84afa640e7ad0a0128dfce6f792 ******/
		%feature("compactdefaultargs") Lin2dBox;
		%feature("autodoc", "
Parameters
----------
theLin2d: gp_Lin2d
bounding: Bnd_Box2d
boxLin: Bnd_Box2d

Return
-------
None

Description
-----------
No available documentation.
") Lin2dBox;
		void Lin2dBox(const gp_Lin2d & theLin2d, const Bnd_Box2d & bounding, Bnd_Box2d & boxLin);

		/****** Intf_Tool::LinBox ******/
		/****** md5 signature: 4f22f51f101f891738c0e2db3614e0cf ******/
		%feature("compactdefaultargs") LinBox;
		%feature("autodoc", "
Parameters
----------
theLin: gp_Lin
bounding: Bnd_Box
boxLin: Bnd_Box

Return
-------
None

Description
-----------
No available documentation.
") LinBox;
		void LinBox(const gp_Lin & theLin, const Bnd_Box & bounding, Bnd_Box & boxLin);

		/****** Intf_Tool::NbSegments ******/
		/****** md5 signature: 9aee6c2253f8ba296b560fdee30e17ad ******/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSegments;
		int NbSegments();

		/****** Intf_Tool::Parab2dBox ******/
		/****** md5 signature: 90884c06d1dbaa8731b2b3ad139132dd ******/
		%feature("compactdefaultargs") Parab2dBox;
		%feature("autodoc", "
Parameters
----------
theParab2d: gp_Parab2d
bounding: Bnd_Box2d
boxHypr: Bnd_Box2d

Return
-------
None

Description
-----------
No available documentation.
") Parab2dBox;
		void Parab2dBox(const gp_Parab2d & theParab2d, const Bnd_Box2d & bounding, Bnd_Box2d & boxHypr);

		/****** Intf_Tool::ParabBox ******/
		/****** md5 signature: 1588872a35e979ee188e88046c83393a ******/
		%feature("compactdefaultargs") ParabBox;
		%feature("autodoc", "
Parameters
----------
theParab: gp_Parab
bounding: Bnd_Box
boxHypr: Bnd_Box

Return
-------
None

Description
-----------
No available documentation.
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
		/****** Intf_InterferencePolygon2d::Intf_InterferencePolygon2d ******/
		/****** md5 signature: a054e0d0ee0c07be0641141761d7c1b4 ******/
		%feature("compactdefaultargs") Intf_InterferencePolygon2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty interference of Polygon.
") Intf_InterferencePolygon2d;
		 Intf_InterferencePolygon2d();

		/****** Intf_InterferencePolygon2d::Intf_InterferencePolygon2d ******/
		/****** md5 signature: db69533852ac804b54a816068e40bb66 ******/
		%feature("compactdefaultargs") Intf_InterferencePolygon2d;
		%feature("autodoc", "
Parameters
----------
Obje1: Intf_Polygon2d
Obje2: Intf_Polygon2d

Return
-------
None

Description
-----------
Constructs and computes an interference between two Polygons.
") Intf_InterferencePolygon2d;
		 Intf_InterferencePolygon2d(const Intf_Polygon2d & Obje1, const Intf_Polygon2d & Obje2);

		/****** Intf_InterferencePolygon2d::Intf_InterferencePolygon2d ******/
		/****** md5 signature: 128012a0826f47a87900350bc08c82a3 ******/
		%feature("compactdefaultargs") Intf_InterferencePolygon2d;
		%feature("autodoc", "
Parameters
----------
Obje: Intf_Polygon2d

Return
-------
None

Description
-----------
Constructs and computes the auto interference of a Polygon.
") Intf_InterferencePolygon2d;
		 Intf_InterferencePolygon2d(const Intf_Polygon2d & Obje);

		/****** Intf_InterferencePolygon2d::Perform ******/
		/****** md5 signature: 5b779e4f57e8ce2f9a68fd70964dc607 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Obje1: Intf_Polygon2d
Obje2: Intf_Polygon2d

Return
-------
None

Description
-----------
Computes an interference between two Polygons.
") Perform;
		void Perform(const Intf_Polygon2d & Obje1, const Intf_Polygon2d & Obje2);

		/****** Intf_InterferencePolygon2d::Perform ******/
		/****** md5 signature: b034cffb7ed9e4ded91b809f55c3ae68 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Obje: Intf_Polygon2d

Return
-------
None

Description
-----------
Computes the self interference of a Polygon.
") Perform;
		void Perform(const Intf_Polygon2d & Obje);

		/****** Intf_InterferencePolygon2d::Pnt2dValue ******/
		/****** md5 signature: d4cf9cad6c2dd790e445e11e0625a9f2 ******/
		%feature("compactdefaultargs") Pnt2dValue;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
gp_Pnt2d

Description
-----------
Gives the geometrical 2d point of the intersection point at address <Index> in the interference.
") Pnt2dValue;
		gp_Pnt2d Pnt2dValue(const int Index);

};


%extend Intf_InterferencePolygon2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def intf_Contain(*args):
	return intf.Contain(*args)

@deprecated
def intf_PlaneEquation(*args):
	return intf.PlaneEquation(*args)

}
