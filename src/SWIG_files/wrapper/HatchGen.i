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
%define HATCHGENDOCSTRING
"HatchGen module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_hatchgen.html"
%enddef
%module (package="OCC.Core", docstring=HATCHGENDOCSTRING) HatchGen


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
#include<HatchGen_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopAbs_module.hxx>
#include<IntRes2d_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopAbs.i
%import IntRes2d.i

%pythoncode {
from OCC.Core.Exception import *
};

/* public enums */
enum HatchGen_ErrorStatus {
	HatchGen_NoProblem = 0,
	HatchGen_TrimFailure = 1,
	HatchGen_TransitionFailure = 2,
	HatchGen_IncoherentParity = 3,
	HatchGen_IncompatibleStates = 4,
};

enum HatchGen_IntersectionType {
	HatchGen_TRUE = 0,
	HatchGen_TOUCH = 1,
	HatchGen_TANGENT = 2,
	HatchGen_UNDETERMINED = 3,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class HatchGen_ErrorStatus:
	HatchGen_NoProblem = 0
	HatchGen_TrimFailure = 1
	HatchGen_TransitionFailure = 2
	HatchGen_IncoherentParity = 3
	HatchGen_IncompatibleStates = 4

class HatchGen_IntersectionType:
	HatchGen_TRUE = 0
	HatchGen_TOUCH = 1
	HatchGen_TANGENT = 2
	HatchGen_UNDETERMINED = 3
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
%template(HatchGen_Domains) NCollection_Sequence<HatchGen_Domain>;
%template(HatchGen_PointsOnElement) NCollection_Sequence<HatchGen_PointOnElement>;
%template(HatchGen_PointsOnHatching) NCollection_Sequence<HatchGen_PointOnHatching>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence<HatchGen_Domain> HatchGen_Domains;
typedef NCollection_Sequence<HatchGen_PointOnElement> HatchGen_PointsOnElement;
typedef NCollection_Sequence<HatchGen_PointOnHatching> HatchGen_PointsOnHatching;
/* end typedefs declaration */

/************************
* class HatchGen_Domain *
************************/
class HatchGen_Domain {
	public:
		/****************** HatchGen_Domain ******************/
		%feature("compactdefaultargs") HatchGen_Domain;
		%feature("autodoc", "Creates an infinite domain.

Returns
-------
None
") HatchGen_Domain;
		 HatchGen_Domain();

		/****************** HatchGen_Domain ******************/
		%feature("compactdefaultargs") HatchGen_Domain;
		%feature("autodoc", "Creates a domain for the curve associated to a hatching.

Parameters
----------
P1: HatchGen_PointOnHatching
P2: HatchGen_PointOnHatching

Returns
-------
None
") HatchGen_Domain;
		 HatchGen_Domain(const HatchGen_PointOnHatching & P1, const HatchGen_PointOnHatching & P2);

		/****************** HatchGen_Domain ******************/
		%feature("compactdefaultargs") HatchGen_Domain;
		%feature("autodoc", "Creates a semi-infinite domain for the curve associated to a hatching. the `first' flag means that the given point is the first one.

Parameters
----------
P: HatchGen_PointOnHatching
First: bool

Returns
-------
None
") HatchGen_Domain;
		 HatchGen_Domain(const HatchGen_PointOnHatching & P, const Standard_Boolean First);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Dump of the domain.

Parameters
----------
Index: int,optional
	default value is 0

Returns
-------
None
") Dump;
		void Dump(const Standard_Integer Index = 0);

		/****************** FirstPoint ******************/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Returns the first point of the domain. the exception domainerror is raised if hasfirstpoint returns false.

Returns
-------
HatchGen_PointOnHatching
") FirstPoint;
		const HatchGen_PointOnHatching & FirstPoint();

		/****************** HasFirstPoint ******************/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "Returns true if the domain has a first point.

Returns
-------
bool
") HasFirstPoint;
		Standard_Boolean HasFirstPoint();

		/****************** HasSecondPoint ******************/
		%feature("compactdefaultargs") HasSecondPoint;
		%feature("autodoc", "Returns true if the domain has a second point.

Returns
-------
bool
") HasSecondPoint;
		Standard_Boolean HasSecondPoint();

		/****************** SecondPoint ******************/
		%feature("compactdefaultargs") SecondPoint;
		%feature("autodoc", "Returns the second point of the domain. the exception domainerror is raised if hassecondpoint returns false.

Returns
-------
HatchGen_PointOnHatching
") SecondPoint;
		const HatchGen_PointOnHatching & SecondPoint();

		/****************** SetFirstPoint ******************/
		%feature("compactdefaultargs") SetFirstPoint;
		%feature("autodoc", "Sets the first point of the domain.

Parameters
----------
P: HatchGen_PointOnHatching

Returns
-------
None
") SetFirstPoint;
		void SetFirstPoint(const HatchGen_PointOnHatching & P);

		/****************** SetFirstPoint ******************/
		%feature("compactdefaultargs") SetFirstPoint;
		%feature("autodoc", "Sets the first point of the domain at the infinite.

Returns
-------
None
") SetFirstPoint;
		void SetFirstPoint();

		/****************** SetPoints ******************/
		%feature("compactdefaultargs") SetPoints;
		%feature("autodoc", "Sets the first and the second points of the domain.

Parameters
----------
P1: HatchGen_PointOnHatching
P2: HatchGen_PointOnHatching

Returns
-------
None
") SetPoints;
		void SetPoints(const HatchGen_PointOnHatching & P1, const HatchGen_PointOnHatching & P2);

		/****************** SetPoints ******************/
		%feature("compactdefaultargs") SetPoints;
		%feature("autodoc", "Sets the first and the second points of the domain as the infinite.

Returns
-------
None
") SetPoints;
		void SetPoints();

		/****************** SetSecondPoint ******************/
		%feature("compactdefaultargs") SetSecondPoint;
		%feature("autodoc", "Sets the second point of the domain.

Parameters
----------
P: HatchGen_PointOnHatching

Returns
-------
None
") SetSecondPoint;
		void SetSecondPoint(const HatchGen_PointOnHatching & P);

		/****************** SetSecondPoint ******************/
		%feature("compactdefaultargs") SetSecondPoint;
		%feature("autodoc", "Sets the second point of the domain at the infinite.

Returns
-------
None
") SetSecondPoint;
		void SetSecondPoint();

};


%extend HatchGen_Domain {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class HatchGen_IntersectionPoint *
***********************************/
%nodefaultctor HatchGen_IntersectionPoint;
%ignore HatchGen_IntersectionPoint::~HatchGen_IntersectionPoint();
class HatchGen_IntersectionPoint {
	public:
		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Dump of the point on element.

Parameters
----------
Index: int,optional
	default value is 0

Returns
-------
None
") Dump;
		virtual void Dump(const Standard_Integer Index = 0);

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Returns the index of the supporting curve.

Returns
-------
int
") Index;
		Standard_Integer Index();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns the parameter on the curve.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Returns the position of the point on the curve.

Returns
-------
TopAbs_Orientation
") Position;
		TopAbs_Orientation Position();

		/****************** SegmentBeginning ******************/
		%feature("compactdefaultargs") SegmentBeginning;
		%feature("autodoc", "Returns the flag that the point is the beginning of a segment.

Returns
-------
bool
") SegmentBeginning;
		Standard_Boolean SegmentBeginning();

		/****************** SegmentEnd ******************/
		%feature("compactdefaultargs") SegmentEnd;
		%feature("autodoc", "Returns the flag that the point is the end of a segment.

Returns
-------
bool
") SegmentEnd;
		Standard_Boolean SegmentEnd();

		/****************** SetIndex ******************/
		%feature("compactdefaultargs") SetIndex;
		%feature("autodoc", "Sets the index of the supporting curve.

Parameters
----------
Index: int

Returns
-------
None
") SetIndex;
		void SetIndex(const Standard_Integer Index);

		/****************** SetParameter ******************/
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "Sets the parameter on the curve.

Parameters
----------
Parameter: float

Returns
-------
None
") SetParameter;
		void SetParameter(const Standard_Real Parameter);

		/****************** SetPosition ******************/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "Sets the position of the point on the curve.

Parameters
----------
Position: TopAbs_Orientation

Returns
-------
None
") SetPosition;
		void SetPosition(const TopAbs_Orientation Position);

		/****************** SetSegmentBeginning ******************/
		%feature("compactdefaultargs") SetSegmentBeginning;
		%feature("autodoc", "Sets the flag that the point is the beginning of a segment.

Parameters
----------
State: bool,optional
	default value is Standard_True

Returns
-------
None
") SetSegmentBeginning;
		void SetSegmentBeginning(const Standard_Boolean State = Standard_True);

		/****************** SetSegmentEnd ******************/
		%feature("compactdefaultargs") SetSegmentEnd;
		%feature("autodoc", "Sets the flag that the point is the end of a segment.

Parameters
----------
State: bool,optional
	default value is Standard_True

Returns
-------
None
") SetSegmentEnd;
		void SetSegmentEnd(const Standard_Boolean State = Standard_True);

		/****************** SetStateAfter ******************/
		%feature("compactdefaultargs") SetStateAfter;
		%feature("autodoc", "Sets the transition state after the intersection.

Parameters
----------
State: TopAbs_State

Returns
-------
None
") SetStateAfter;
		void SetStateAfter(const TopAbs_State State);

		/****************** SetStateBefore ******************/
		%feature("compactdefaultargs") SetStateBefore;
		%feature("autodoc", "Sets the transition state before the intersection.

Parameters
----------
State: TopAbs_State

Returns
-------
None
") SetStateBefore;
		void SetStateBefore(const TopAbs_State State);

		/****************** StateAfter ******************/
		%feature("compactdefaultargs") StateAfter;
		%feature("autodoc", "Returns the transition state after of the intersection.

Returns
-------
TopAbs_State
") StateAfter;
		TopAbs_State StateAfter();

		/****************** StateBefore ******************/
		%feature("compactdefaultargs") StateBefore;
		%feature("autodoc", "Returns the transition state before the intersection.

Returns
-------
TopAbs_State
") StateBefore;
		TopAbs_State StateBefore();

};


%extend HatchGen_IntersectionPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class HatchGen_PointOnElement *
********************************/
class HatchGen_PointOnElement : public HatchGen_IntersectionPoint {
	public:
		/****************** HatchGen_PointOnElement ******************/
		%feature("compactdefaultargs") HatchGen_PointOnElement;
		%feature("autodoc", "---purpose; creates an empty point on element.

Returns
-------
None
") HatchGen_PointOnElement;
		 HatchGen_PointOnElement();

		/****************** HatchGen_PointOnElement ******************/
		%feature("compactdefaultargs") HatchGen_PointOnElement;
		%feature("autodoc", "Creates a point from an other.

Parameters
----------
Point: HatchGen_PointOnElement

Returns
-------
None
") HatchGen_PointOnElement;
		 HatchGen_PointOnElement(const HatchGen_PointOnElement & Point);

		/****************** HatchGen_PointOnElement ******************/
		%feature("compactdefaultargs") HatchGen_PointOnElement;
		%feature("autodoc", "Creates a point from an intersection point.

Parameters
----------
Point: IntRes2d_IntersectionPoint

Returns
-------
None
") HatchGen_PointOnElement;
		 HatchGen_PointOnElement(const IntRes2d_IntersectionPoint & Point);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Dump of the point on element.

Parameters
----------
Index: int,optional
	default value is 0

Returns
-------
None
") Dump;
		void Dump(const Standard_Integer Index = 0);

		/****************** IntersectionType ******************/
		%feature("compactdefaultargs") IntersectionType;
		%feature("autodoc", "Returns the intersection type at this point.

Returns
-------
HatchGen_IntersectionType
") IntersectionType;
		HatchGen_IntersectionType IntersectionType();

		/****************** IsDifferent ******************/
		%feature("compactdefaultargs") IsDifferent;
		%feature("autodoc", "Tests if the point is different from an other.

Parameters
----------
Point: HatchGen_PointOnElement
Confusion: float

Returns
-------
bool
") IsDifferent;
		Standard_Boolean IsDifferent(const HatchGen_PointOnElement & Point, const Standard_Real Confusion);

		/****************** IsIdentical ******************/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "Tests if the point is identical to an other. that is to say : p1.myindex = p2.myindex abs (p1.myparam - p2.myparam) <= confusion p1.myposit = p2.myposit p1.mybefore = p2.mybefore p1.myafter = p2.myafter p1.mysegbeg = p2.mysegbeg p1.mysegend = p2.mysegend p1.mytype = p2.mytype.

Parameters
----------
Point: HatchGen_PointOnElement
Confusion: float

Returns
-------
bool
") IsIdentical;
		Standard_Boolean IsIdentical(const HatchGen_PointOnElement & Point, const Standard_Real Confusion);

		/****************** SetIntersectionType ******************/
		%feature("compactdefaultargs") SetIntersectionType;
		%feature("autodoc", "Sets the intersection type at this point.

Parameters
----------
Type: HatchGen_IntersectionType

Returns
-------
None
") SetIntersectionType;
		void SetIntersectionType(const HatchGen_IntersectionType Type);

};


%extend HatchGen_PointOnElement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class HatchGen_PointOnHatching *
*********************************/
class HatchGen_PointOnHatching : public HatchGen_IntersectionPoint {
	public:
		/****************** HatchGen_PointOnHatching ******************/
		%feature("compactdefaultargs") HatchGen_PointOnHatching;
		%feature("autodoc", "Creates an empty point.

Returns
-------
None
") HatchGen_PointOnHatching;
		 HatchGen_PointOnHatching();

		/****************** HatchGen_PointOnHatching ******************/
		%feature("compactdefaultargs") HatchGen_PointOnHatching;
		%feature("autodoc", "Creates a point from an other.

Parameters
----------
Point: HatchGen_PointOnHatching

Returns
-------
None
") HatchGen_PointOnHatching;
		 HatchGen_PointOnHatching(const HatchGen_PointOnHatching & Point);

		/****************** HatchGen_PointOnHatching ******************/
		%feature("compactdefaultargs") HatchGen_PointOnHatching;
		%feature("autodoc", "Creates a point from an intersection point.

Parameters
----------
Point: IntRes2d_IntersectionPoint

Returns
-------
None
") HatchGen_PointOnHatching;
		 HatchGen_PointOnHatching(const IntRes2d_IntersectionPoint & Point);

		/****************** AddPoint ******************/
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "Adds a point on element to the point.

Parameters
----------
Point: HatchGen_PointOnElement
Confusion: float

Returns
-------
None
") AddPoint;
		void AddPoint(const HatchGen_PointOnElement & Point, const Standard_Real Confusion);

		/****************** ClrPoints ******************/
		%feature("compactdefaultargs") ClrPoints;
		%feature("autodoc", "Removes all the points on element of the point.

Returns
-------
None
") ClrPoints;
		void ClrPoints();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Dump of the point.

Parameters
----------
Index: int,optional
	default value is 0

Returns
-------
None
") Dump;
		void Dump(const Standard_Integer Index = 0);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Tests if the point is equal to an other. a point on hatching p1 is said to be equal to an other p2 if : | p2.myparam - p1.myparam | <= confusion.

Parameters
----------
Point: HatchGen_PointOnHatching
Confusion: float

Returns
-------
bool
") IsEqual;
		Standard_Boolean IsEqual(const HatchGen_PointOnHatching & Point, const Standard_Real Confusion);

		/****************** IsGreater ******************/
		%feature("compactdefaultargs") IsGreater;
		%feature("autodoc", "Tests if the point is greater than an other. a point on hatching p1 is said to be greater than an other p2 if : p1.myparam - p2.myparam > confusion.

Parameters
----------
Point: HatchGen_PointOnHatching
Confusion: float

Returns
-------
bool
") IsGreater;
		Standard_Boolean IsGreater(const HatchGen_PointOnHatching & Point, const Standard_Real Confusion);

		/****************** IsLower ******************/
		%feature("compactdefaultargs") IsLower;
		%feature("autodoc", "Tests if the point is lower than an other. a point on hatching p1 is said to be lower than an other p2 if : p2.myparam - p1.myparam > confusion.

Parameters
----------
Point: HatchGen_PointOnHatching
Confusion: float

Returns
-------
bool
") IsLower;
		Standard_Boolean IsLower(const HatchGen_PointOnHatching & Point, const Standard_Real Confusion);

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of elements intersecting the hatching at this point.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the index-th point on element of the point. the exception outofrange is raised if index > nbpoints.

Parameters
----------
Index: int

Returns
-------
HatchGen_PointOnElement
") Point;
		const HatchGen_PointOnElement & Point(const Standard_Integer Index);

		/****************** RemPoint ******************/
		%feature("compactdefaultargs") RemPoint;
		%feature("autodoc", "Removes the index-th point on element of the point. the exception outofrange is raised if index > nbpoints.

Parameters
----------
Index: int

Returns
-------
None
") RemPoint;
		void RemPoint(const Standard_Integer Index);

};


%extend HatchGen_PointOnHatching {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
