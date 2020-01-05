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

/* handles */
/* end handles declaration */

/* templates */
%template(HatchGen_Domains) NCollection_Sequence <HatchGen_Domain>;
%template(HatchGen_PointsOnElement) NCollection_Sequence <HatchGen_PointOnElement>;
%template(HatchGen_PointsOnHatching) NCollection_Sequence <HatchGen_PointOnHatching>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence <HatchGen_Domain> HatchGen_Domains;
typedef NCollection_Sequence <HatchGen_PointOnElement> HatchGen_PointsOnElement;
typedef NCollection_Sequence <HatchGen_PointOnHatching> HatchGen_PointsOnHatching;
/* end typedefs declaration */

/************************
* class HatchGen_Domain *
************************/
class HatchGen_Domain {
	public:
		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "* Dump of the domain.
	:param Index: default value is 0
	:type Index: int
	:rtype: None") Dump;
		void Dump (const Standard_Integer Index = 0);

		/****************** FirstPoint ******************/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "* Returns the first point of the domain. The exception DomainError is raised if HasFirstPoint returns False.
	:rtype: HatchGen_PointOnHatching") FirstPoint;
		const HatchGen_PointOnHatching & FirstPoint ();

		/****************** HasFirstPoint ******************/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "* Returns True if the domain has a first point.
	:rtype: bool") HasFirstPoint;
		Standard_Boolean HasFirstPoint ();

		/****************** HasSecondPoint ******************/
		%feature("compactdefaultargs") HasSecondPoint;
		%feature("autodoc", "* Returns True if the domain has a second point.
	:rtype: bool") HasSecondPoint;
		Standard_Boolean HasSecondPoint ();

		/****************** HatchGen_Domain ******************/
		%feature("compactdefaultargs") HatchGen_Domain;
		%feature("autodoc", "* Creates an infinite domain.
	:rtype: None") HatchGen_Domain;
		 HatchGen_Domain ();

		/****************** HatchGen_Domain ******************/
		%feature("compactdefaultargs") HatchGen_Domain;
		%feature("autodoc", "* Creates a domain for the curve associated to a hatching.
	:param P1:
	:type P1: HatchGen_PointOnHatching
	:param P2:
	:type P2: HatchGen_PointOnHatching
	:rtype: None") HatchGen_Domain;
		 HatchGen_Domain (const HatchGen_PointOnHatching & P1,const HatchGen_PointOnHatching & P2);

		/****************** HatchGen_Domain ******************/
		%feature("compactdefaultargs") HatchGen_Domain;
		%feature("autodoc", "* Creates a semi-infinite domain for the curve associated to a hatching. The `First' flag means that the given point is the first one.
	:param P:
	:type P: HatchGen_PointOnHatching
	:param First:
	:type First: bool
	:rtype: None") HatchGen_Domain;
		 HatchGen_Domain (const HatchGen_PointOnHatching & P,const Standard_Boolean First);

		/****************** SecondPoint ******************/
		%feature("compactdefaultargs") SecondPoint;
		%feature("autodoc", "* Returns the second point of the domain. The exception DomainError is raised if HasSecondPoint returns False.
	:rtype: HatchGen_PointOnHatching") SecondPoint;
		const HatchGen_PointOnHatching & SecondPoint ();

		/****************** SetFirstPoint ******************/
		%feature("compactdefaultargs") SetFirstPoint;
		%feature("autodoc", "* Sets the first point of the domain.
	:param P:
	:type P: HatchGen_PointOnHatching
	:rtype: None") SetFirstPoint;
		void SetFirstPoint (const HatchGen_PointOnHatching & P);

		/****************** SetFirstPoint ******************/
		%feature("compactdefaultargs") SetFirstPoint;
		%feature("autodoc", "* Sets the first point of the domain at the infinite.
	:rtype: None") SetFirstPoint;
		void SetFirstPoint ();

		/****************** SetPoints ******************/
		%feature("compactdefaultargs") SetPoints;
		%feature("autodoc", "* Sets the first and the second points of the domain.
	:param P1:
	:type P1: HatchGen_PointOnHatching
	:param P2:
	:type P2: HatchGen_PointOnHatching
	:rtype: None") SetPoints;
		void SetPoints (const HatchGen_PointOnHatching & P1,const HatchGen_PointOnHatching & P2);

		/****************** SetPoints ******************/
		%feature("compactdefaultargs") SetPoints;
		%feature("autodoc", "* Sets the first and the second points of the domain as the infinite.
	:rtype: None") SetPoints;
		void SetPoints ();

		/****************** SetSecondPoint ******************/
		%feature("compactdefaultargs") SetSecondPoint;
		%feature("autodoc", "* Sets the second point of the domain.
	:param P:
	:type P: HatchGen_PointOnHatching
	:rtype: None") SetSecondPoint;
		void SetSecondPoint (const HatchGen_PointOnHatching & P);

		/****************** SetSecondPoint ******************/
		%feature("compactdefaultargs") SetSecondPoint;
		%feature("autodoc", "* Sets the second point of the domain at the infinite.
	:rtype: None") SetSecondPoint;
		void SetSecondPoint ();

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
		%feature("autodoc", "* Dump of the point on element.
	:param Index: default value is 0
	:type Index: int
	:rtype: void") Dump;
		virtual void Dump (const Standard_Integer Index = 0);

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "* Returns the index of the supporting curve.
	:rtype: int") Index;
		Standard_Integer Index ();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "* Returns the parameter on the curve.
	:rtype: float") Parameter;
		Standard_Real Parameter ();

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "* Returns the position of the point on the curve.
	:rtype: TopAbs_Orientation") Position;
		TopAbs_Orientation Position ();

		/****************** SegmentBeginning ******************/
		%feature("compactdefaultargs") SegmentBeginning;
		%feature("autodoc", "* Returns the flag that the point is the beginning of a segment.
	:rtype: bool") SegmentBeginning;
		Standard_Boolean SegmentBeginning ();

		/****************** SegmentEnd ******************/
		%feature("compactdefaultargs") SegmentEnd;
		%feature("autodoc", "* Returns the flag that the point is the end of a segment.
	:rtype: bool") SegmentEnd;
		Standard_Boolean SegmentEnd ();

		/****************** SetIndex ******************/
		%feature("compactdefaultargs") SetIndex;
		%feature("autodoc", "* Sets the index of the supporting curve.
	:param Index:
	:type Index: int
	:rtype: None") SetIndex;
		void SetIndex (const Standard_Integer Index);

		/****************** SetParameter ******************/
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "* Sets the parameter on the curve.
	:param Parameter:
	:type Parameter: float
	:rtype: None") SetParameter;
		void SetParameter (const Standard_Real Parameter);

		/****************** SetPosition ******************/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "* Sets the position of the point on the curve.
	:param Position:
	:type Position: TopAbs_Orientation
	:rtype: None") SetPosition;
		void SetPosition (const TopAbs_Orientation Position);

		/****************** SetSegmentBeginning ******************/
		%feature("compactdefaultargs") SetSegmentBeginning;
		%feature("autodoc", "* Sets the flag that the point is the beginning of a segment.
	:param State: default value is Standard_True
	:type State: bool
	:rtype: None") SetSegmentBeginning;
		void SetSegmentBeginning (const Standard_Boolean State = Standard_True);

		/****************** SetSegmentEnd ******************/
		%feature("compactdefaultargs") SetSegmentEnd;
		%feature("autodoc", "* Sets the flag that the point is the end of a segment.
	:param State: default value is Standard_True
	:type State: bool
	:rtype: None") SetSegmentEnd;
		void SetSegmentEnd (const Standard_Boolean State = Standard_True);

		/****************** SetStateAfter ******************/
		%feature("compactdefaultargs") SetStateAfter;
		%feature("autodoc", "* Sets the transition state after the intersection.
	:param State:
	:type State: TopAbs_State
	:rtype: None") SetStateAfter;
		void SetStateAfter (const TopAbs_State State);

		/****************** SetStateBefore ******************/
		%feature("compactdefaultargs") SetStateBefore;
		%feature("autodoc", "* Sets the transition state before the intersection.
	:param State:
	:type State: TopAbs_State
	:rtype: None") SetStateBefore;
		void SetStateBefore (const TopAbs_State State);

		/****************** StateAfter ******************/
		%feature("compactdefaultargs") StateAfter;
		%feature("autodoc", "* Returns the transition state after of the intersection.
	:rtype: TopAbs_State") StateAfter;
		TopAbs_State StateAfter ();

		/****************** StateBefore ******************/
		%feature("compactdefaultargs") StateBefore;
		%feature("autodoc", "* Returns the transition state before the intersection.
	:rtype: TopAbs_State") StateBefore;
		TopAbs_State StateBefore ();

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
		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "* Dump of the point on element.
	:param Index: default value is 0
	:type Index: int
	:rtype: None") Dump;
		void Dump (const Standard_Integer Index = 0);

		/****************** HatchGen_PointOnElement ******************/
		%feature("compactdefaultargs") HatchGen_PointOnElement;
		%feature("autodoc", "* ---Purpose; Creates an empty point on element
	:rtype: None") HatchGen_PointOnElement;
		 HatchGen_PointOnElement ();

		/****************** HatchGen_PointOnElement ******************/
		%feature("compactdefaultargs") HatchGen_PointOnElement;
		%feature("autodoc", "* Creates a point from an other.
	:param Point:
	:type Point: HatchGen_PointOnElement
	:rtype: None") HatchGen_PointOnElement;
		 HatchGen_PointOnElement (const HatchGen_PointOnElement & Point);

		/****************** HatchGen_PointOnElement ******************/
		%feature("compactdefaultargs") HatchGen_PointOnElement;
		%feature("autodoc", "* Creates a point from an intersection point.
	:param Point:
	:type Point: IntRes2d_IntersectionPoint
	:rtype: None") HatchGen_PointOnElement;
		 HatchGen_PointOnElement (const IntRes2d_IntersectionPoint & Point);

		/****************** IntersectionType ******************/
		%feature("compactdefaultargs") IntersectionType;
		%feature("autodoc", "* Returns the intersection type at this point.
	:rtype: HatchGen_IntersectionType") IntersectionType;
		HatchGen_IntersectionType IntersectionType ();

		/****************** IsDifferent ******************/
		%feature("compactdefaultargs") IsDifferent;
		%feature("autodoc", "* Tests if the point is different from an other.
	:param Point:
	:type Point: HatchGen_PointOnElement
	:param Confusion:
	:type Confusion: float
	:rtype: bool") IsDifferent;
		Standard_Boolean IsDifferent (const HatchGen_PointOnElement & Point,const Standard_Real Confusion);

		/****************** IsIdentical ******************/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "* Tests if the point is identical to an other. That is to say : P1.myIndex = P2.myIndex Abs (P1.myParam - P2.myParam) <= Confusion P1.myPosit = P2.myPosit P1.myBefore = P2.myBefore P1.myAfter = P2.myAfter P1.mySegBeg = P2.mySegBeg P1.mySegEnd = P2.mySegEnd P1.myType = P2.myType
	:param Point:
	:type Point: HatchGen_PointOnElement
	:param Confusion:
	:type Confusion: float
	:rtype: bool") IsIdentical;
		Standard_Boolean IsIdentical (const HatchGen_PointOnElement & Point,const Standard_Real Confusion);

		/****************** SetIntersectionType ******************/
		%feature("compactdefaultargs") SetIntersectionType;
		%feature("autodoc", "* Sets the intersection type at this point.
	:param Type:
	:type Type: HatchGen_IntersectionType
	:rtype: None") SetIntersectionType;
		void SetIntersectionType (const HatchGen_IntersectionType Type);

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
		/****************** AddPoint ******************/
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "* Adds a point on element to the point.
	:param Point:
	:type Point: HatchGen_PointOnElement
	:param Confusion:
	:type Confusion: float
	:rtype: None") AddPoint;
		void AddPoint (const HatchGen_PointOnElement & Point,const Standard_Real Confusion);

		/****************** ClrPoints ******************/
		%feature("compactdefaultargs") ClrPoints;
		%feature("autodoc", "* Removes all the points on element of the point.
	:rtype: None") ClrPoints;
		void ClrPoints ();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "* Dump of the point.
	:param Index: default value is 0
	:type Index: int
	:rtype: None") Dump;
		void Dump (const Standard_Integer Index = 0);

		/****************** HatchGen_PointOnHatching ******************/
		%feature("compactdefaultargs") HatchGen_PointOnHatching;
		%feature("autodoc", "* Creates an empty point.
	:rtype: None") HatchGen_PointOnHatching;
		 HatchGen_PointOnHatching ();

		/****************** HatchGen_PointOnHatching ******************/
		%feature("compactdefaultargs") HatchGen_PointOnHatching;
		%feature("autodoc", "* Creates a point from an other.
	:param Point:
	:type Point: HatchGen_PointOnHatching
	:rtype: None") HatchGen_PointOnHatching;
		 HatchGen_PointOnHatching (const HatchGen_PointOnHatching & Point);

		/****************** HatchGen_PointOnHatching ******************/
		%feature("compactdefaultargs") HatchGen_PointOnHatching;
		%feature("autodoc", "* Creates a point from an intersection point.
	:param Point:
	:type Point: IntRes2d_IntersectionPoint
	:rtype: None") HatchGen_PointOnHatching;
		 HatchGen_PointOnHatching (const IntRes2d_IntersectionPoint & Point);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "* Tests if the point is equal to an other. A point on hatching P1 is said to be equal to an other P2 if : | P2.myParam - P1.myParam | <= Confusion
	:param Point:
	:type Point: HatchGen_PointOnHatching
	:param Confusion:
	:type Confusion: float
	:rtype: bool") IsEqual;
		Standard_Boolean IsEqual (const HatchGen_PointOnHatching & Point,const Standard_Real Confusion);

		/****************** IsGreater ******************/
		%feature("compactdefaultargs") IsGreater;
		%feature("autodoc", "* Tests if the point is greater than an other. A point on hatching P1 is said to be greater than an other P2 if : P1.myParam - P2.myParam > Confusion
	:param Point:
	:type Point: HatchGen_PointOnHatching
	:param Confusion:
	:type Confusion: float
	:rtype: bool") IsGreater;
		Standard_Boolean IsGreater (const HatchGen_PointOnHatching & Point,const Standard_Real Confusion);

		/****************** IsLower ******************/
		%feature("compactdefaultargs") IsLower;
		%feature("autodoc", "* Tests if the point is lower than an other. A point on hatching P1 is said to be lower than an other P2 if : P2.myParam - P1.myParam > Confusion
	:param Point:
	:type Point: HatchGen_PointOnHatching
	:param Confusion:
	:type Confusion: float
	:rtype: bool") IsLower;
		Standard_Boolean IsLower (const HatchGen_PointOnHatching & Point,const Standard_Real Confusion);

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "* Returns the number of elements intersecting the hatching at this point.
	:rtype: int") NbPoints;
		Standard_Integer NbPoints ();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "* Returns the Index-th point on element of the point. The exception OutOfRange is raised if Index > NbPoints.
	:param Index:
	:type Index: int
	:rtype: HatchGen_PointOnElement") Point;
		const HatchGen_PointOnElement & Point (const Standard_Integer Index);

		/****************** RemPoint ******************/
		%feature("compactdefaultargs") RemPoint;
		%feature("autodoc", "* Removes the Index-th point on element of the point. The exception OutOfRange is raised if Index > NbPoints.
	:param Index:
	:type Index: int
	:rtype: None") RemPoint;
		void RemPoint (const Standard_Integer Index);

};


%extend HatchGen_PointOnHatching {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
