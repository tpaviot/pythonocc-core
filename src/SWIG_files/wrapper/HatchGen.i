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
from enum import IntEnum
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

class HatchGen_ErrorStatus(IntEnum):
	HatchGen_NoProblem = 0
	HatchGen_TrimFailure = 1
	HatchGen_TransitionFailure = 2
	HatchGen_IncoherentParity = 3
	HatchGen_IncompatibleStates = 4
HatchGen_NoProblem = HatchGen_ErrorStatus.HatchGen_NoProblem
HatchGen_TrimFailure = HatchGen_ErrorStatus.HatchGen_TrimFailure
HatchGen_TransitionFailure = HatchGen_ErrorStatus.HatchGen_TransitionFailure
HatchGen_IncoherentParity = HatchGen_ErrorStatus.HatchGen_IncoherentParity
HatchGen_IncompatibleStates = HatchGen_ErrorStatus.HatchGen_IncompatibleStates

class HatchGen_IntersectionType(IntEnum):
	HatchGen_TRUE = 0
	HatchGen_TOUCH = 1
	HatchGen_TANGENT = 2
	HatchGen_UNDETERMINED = 3
HatchGen_TRUE = HatchGen_IntersectionType.HatchGen_TRUE
HatchGen_TOUCH = HatchGen_IntersectionType.HatchGen_TOUCH
HatchGen_TANGENT = HatchGen_IntersectionType.HatchGen_TANGENT
HatchGen_UNDETERMINED = HatchGen_IntersectionType.HatchGen_UNDETERMINED
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
%template(HatchGen_Domains) NCollection_Sequence<HatchGen_Domain>;

%extend NCollection_Sequence<HatchGen_Domain> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(HatchGen_PointsOnElement) NCollection_Sequence<HatchGen_PointOnElement>;

%extend NCollection_Sequence<HatchGen_PointOnElement> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(HatchGen_PointsOnHatching) NCollection_Sequence<HatchGen_PointOnHatching>;

%extend NCollection_Sequence<HatchGen_PointOnHatching> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
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
		/**** md5 signature: 002fed1e21ea4785e79e64200ace0a45 ****/
		%feature("compactdefaultargs") HatchGen_Domain;
		%feature("autodoc", "Creates an infinite domain.

Returns
-------
None
") HatchGen_Domain;
		 HatchGen_Domain();

		/****************** HatchGen_Domain ******************/
		/**** md5 signature: d0f948cbe08580f151246fe4b42124d3 ****/
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
		/**** md5 signature: cd70456b6ebdffc7e658b05561e5caf4 ****/
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
		/**** md5 signature: 01f7aa82c5ee0f23c3ae9a615ce67cdf ****/
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
		/**** md5 signature: be005e1bb3197123a3b75f67921aaeca ****/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Returns the first point of the domain. the exception domainerror is raised if hasfirstpoint returns false.

Returns
-------
HatchGen_PointOnHatching
") FirstPoint;
		const HatchGen_PointOnHatching & FirstPoint();

		/****************** HasFirstPoint ******************/
		/**** md5 signature: 76549d304d78c4a9c8d3c420139524d3 ****/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "Returns true if the domain has a first point.

Returns
-------
bool
") HasFirstPoint;
		Standard_Boolean HasFirstPoint();

		/****************** HasSecondPoint ******************/
		/**** md5 signature: fec3c9db8715d3b740053f2b40e032e6 ****/
		%feature("compactdefaultargs") HasSecondPoint;
		%feature("autodoc", "Returns true if the domain has a second point.

Returns
-------
bool
") HasSecondPoint;
		Standard_Boolean HasSecondPoint();

		/****************** SecondPoint ******************/
		/**** md5 signature: 63b2b16d6a3a3cea84f761a97c9e1c18 ****/
		%feature("compactdefaultargs") SecondPoint;
		%feature("autodoc", "Returns the second point of the domain. the exception domainerror is raised if hassecondpoint returns false.

Returns
-------
HatchGen_PointOnHatching
") SecondPoint;
		const HatchGen_PointOnHatching & SecondPoint();

		/****************** SetFirstPoint ******************/
		/**** md5 signature: 0bd7019ad2595e1a58cb06d850e0212b ****/
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
		/**** md5 signature: cc2d0403a1116c0918b69f2b0e7859c1 ****/
		%feature("compactdefaultargs") SetFirstPoint;
		%feature("autodoc", "Sets the first point of the domain at the infinite.

Returns
-------
None
") SetFirstPoint;
		void SetFirstPoint();

		/****************** SetPoints ******************/
		/**** md5 signature: b0e1deba6a6562a05b6a4c4c4e314c4d ****/
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
		/**** md5 signature: 474d6964e8c5db9134bad493f91e9ea9 ****/
		%feature("compactdefaultargs") SetPoints;
		%feature("autodoc", "Sets the first and the second points of the domain as the infinite.

Returns
-------
None
") SetPoints;
		void SetPoints();

		/****************** SetSecondPoint ******************/
		/**** md5 signature: d280223bcacdef93e0950ee090227bad ****/
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
		/**** md5 signature: 4e521cf34592df1547bcd8f78d3fcec8 ****/
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
		/**** md5 signature: c2e6c174fa329d65759d90e615b3a8b4 ****/
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
		/**** md5 signature: 407d80ef3037d55996765198adea3908 ****/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Returns the index of the supporting curve.

Returns
-------
int
") Index;
		Standard_Integer Index();

		/****************** Parameter ******************/
		/**** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns the parameter on the curve.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** Position ******************/
		/**** md5 signature: 12c62744b1270f847a2fb81f66b529c6 ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Returns the position of the point on the curve.

Returns
-------
TopAbs_Orientation
") Position;
		TopAbs_Orientation Position();

		/****************** SegmentBeginning ******************/
		/**** md5 signature: 33518940d865ec7d130ed1361f158dd3 ****/
		%feature("compactdefaultargs") SegmentBeginning;
		%feature("autodoc", "Returns the flag that the point is the beginning of a segment.

Returns
-------
bool
") SegmentBeginning;
		Standard_Boolean SegmentBeginning();

		/****************** SegmentEnd ******************/
		/**** md5 signature: 1c2edeb2291ec54154aa4cc6c99573d9 ****/
		%feature("compactdefaultargs") SegmentEnd;
		%feature("autodoc", "Returns the flag that the point is the end of a segment.

Returns
-------
bool
") SegmentEnd;
		Standard_Boolean SegmentEnd();

		/****************** SetIndex ******************/
		/**** md5 signature: d1ad8cf3e26528faa78cad1c3b0908d8 ****/
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
		/**** md5 signature: 4c7278262c066aac5546618fdac50953 ****/
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
		/**** md5 signature: 378c44c908732d3c54529b6c924f349e ****/
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
		/**** md5 signature: 6126da9c07a508d174d264a7b4c6c810 ****/
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
		/**** md5 signature: 0de4db1f0bd8c99d2b1470fa9c3890f9 ****/
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
		/**** md5 signature: 51a316fa868f60e3690027200ebd7cd1 ****/
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
		/**** md5 signature: b9f8e081ae836884e3d4d5fe83c9d377 ****/
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
		/**** md5 signature: 00cc234f23b0e06606bd1ce121c9c7ae ****/
		%feature("compactdefaultargs") StateAfter;
		%feature("autodoc", "Returns the transition state after of the intersection.

Returns
-------
TopAbs_State
") StateAfter;
		TopAbs_State StateAfter();

		/****************** StateBefore ******************/
		/**** md5 signature: 76fbbf983aacdcf0487328d9ca214104 ****/
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
		/**** md5 signature: 487cbbe6d9c40f71545667c5a186b2b6 ****/
		%feature("compactdefaultargs") HatchGen_PointOnElement;
		%feature("autodoc", "---purpose; creates an empty point on element.

Returns
-------
None
") HatchGen_PointOnElement;
		 HatchGen_PointOnElement();

		/****************** HatchGen_PointOnElement ******************/
		/**** md5 signature: 5f90d0090208df1badc086f95b2cd438 ****/
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
		/**** md5 signature: 0b19450c5960b9438bdefe885e950d9c ****/
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
		/**** md5 signature: 01f7aa82c5ee0f23c3ae9a615ce67cdf ****/
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
		/**** md5 signature: 206db412c05d4cba1af058c245450cd6 ****/
		%feature("compactdefaultargs") IntersectionType;
		%feature("autodoc", "Returns the intersection type at this point.

Returns
-------
HatchGen_IntersectionType
") IntersectionType;
		HatchGen_IntersectionType IntersectionType();

		/****************** IsDifferent ******************/
		/**** md5 signature: 9ddc9e5fda5c5c24dff1014855e0ed98 ****/
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
		/**** md5 signature: 249a8bc6e8608b97a1fa0479f3d0a5dc ****/
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
		/**** md5 signature: 003e8404b81f3387812eae64dab1ac55 ****/
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
		/**** md5 signature: e1ad16e2d71a24cdb1b1a938cb0400de ****/
		%feature("compactdefaultargs") HatchGen_PointOnHatching;
		%feature("autodoc", "Creates an empty point.

Returns
-------
None
") HatchGen_PointOnHatching;
		 HatchGen_PointOnHatching();

		/****************** HatchGen_PointOnHatching ******************/
		/**** md5 signature: 6c7c0ec97a8317703f64880c6023f17c ****/
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
		/**** md5 signature: 2d49efd88e5038a0b441348c0349938f ****/
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
		/**** md5 signature: e53cdbffd3ac5fad578a153d2585eb32 ****/
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
		/**** md5 signature: e99750252922662025bcc4d5f2030893 ****/
		%feature("compactdefaultargs") ClrPoints;
		%feature("autodoc", "Removes all the points on element of the point.

Returns
-------
None
") ClrPoints;
		void ClrPoints();

		/****************** Dump ******************/
		/**** md5 signature: 01f7aa82c5ee0f23c3ae9a615ce67cdf ****/
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
		/**** md5 signature: 60fa71f986970515c0815d2c52387b57 ****/
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
		/**** md5 signature: 486804c0120ac020dc22168fccc2e69a ****/
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
		/**** md5 signature: dbb6c53255219626df26daf2b8dee300 ****/
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
		/**** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of elements intersecting the hatching at this point.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** Point ******************/
		/**** md5 signature: bedf9b4015a68bdab4ffaa2ecfa26bf9 ****/
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
		/**** md5 signature: 4fd025fee44e20642cf1dc77eaa95334 ****/
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
