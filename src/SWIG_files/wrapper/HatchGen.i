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
%define HATCHGENDOCSTRING
"HatchGen module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_hatchgen.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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

/* python proxy classes for enums */
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
%template(HatchGen_PointsOnElement) NCollection_Sequence<HatchGen_PointOnElement>;

%extend NCollection_Sequence<HatchGen_PointOnElement> {
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
%template(HatchGen_PointsOnHatching) NCollection_Sequence<HatchGen_PointOnHatching>;

%extend NCollection_Sequence<HatchGen_PointOnHatching> {
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
typedef NCollection_Sequence<HatchGen_Domain> HatchGen_Domains;
typedef NCollection_Sequence<HatchGen_PointOnElement> HatchGen_PointsOnElement;
typedef NCollection_Sequence<HatchGen_PointOnHatching> HatchGen_PointsOnHatching;
/* end typedefs declaration */

/************************
* class HatchGen_Domain *
************************/
class HatchGen_Domain {
	public:
		/****** HatchGen_Domain::HatchGen_Domain ******/
		/****** md5 signature: 002fed1e21ea4785e79e64200ace0a45 ******/
		%feature("compactdefaultargs") HatchGen_Domain;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an infinite domain.
") HatchGen_Domain;
		 HatchGen_Domain();

		/****** HatchGen_Domain::HatchGen_Domain ******/
		/****** md5 signature: d0f948cbe08580f151246fe4b42124d3 ******/
		%feature("compactdefaultargs") HatchGen_Domain;
		%feature("autodoc", "
Parameters
----------
P1: HatchGen_PointOnHatching
P2: HatchGen_PointOnHatching

Return
-------
None

Description
-----------
Creates a domain for the curve associated to a hatching.
") HatchGen_Domain;
		 HatchGen_Domain(const HatchGen_PointOnHatching & P1, const HatchGen_PointOnHatching & P2);

		/****** HatchGen_Domain::HatchGen_Domain ******/
		/****** md5 signature: 530f2602f1b383496ea4c04d38c27cd2 ******/
		%feature("compactdefaultargs") HatchGen_Domain;
		%feature("autodoc", "
Parameters
----------
P: HatchGen_PointOnHatching
First: bool

Return
-------
None

Description
-----------
Creates a semi-infinite domain for the curve associated to a hatching. The `First' flag means that the given point is the first one.
") HatchGen_Domain;
		 HatchGen_Domain(const HatchGen_PointOnHatching & P, const bool First);

		/****** HatchGen_Domain::Dump ******/
		/****** md5 signature: 05ae80d6a670a2110e3ce098d27be098 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
Index: int (optional, default to 0)

Return
-------
None

Description
-----------
Dump of the domain.
") Dump;
		void Dump(const int Index = 0);

		/****** HatchGen_Domain::FirstPoint ******/
		/****** md5 signature: be005e1bb3197123a3b75f67921aaeca ******/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Return
-------
HatchGen_PointOnHatching

Description
-----------
Returns the first point of the domain. The exception DomainError is raised if HasFirstPoint returns False.
") FirstPoint;
		const HatchGen_PointOnHatching & FirstPoint();

		/****** HatchGen_Domain::HasFirstPoint ******/
		/****** md5 signature: 1bdb89cc339a420f24f2f400d73d6b54 ******/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the domain has a first point.
") HasFirstPoint;
		bool HasFirstPoint();

		/****** HatchGen_Domain::HasSecondPoint ******/
		/****** md5 signature: 1d3bf6bd52bac8f39a12936b38a44d5c ******/
		%feature("compactdefaultargs") HasSecondPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the domain has a second point.
") HasSecondPoint;
		bool HasSecondPoint();

		/****** HatchGen_Domain::SecondPoint ******/
		/****** md5 signature: 63b2b16d6a3a3cea84f761a97c9e1c18 ******/
		%feature("compactdefaultargs") SecondPoint;
		%feature("autodoc", "Return
-------
HatchGen_PointOnHatching

Description
-----------
Returns the second point of the domain. The exception DomainError is raised if HasSecondPoint returns False.
") SecondPoint;
		const HatchGen_PointOnHatching & SecondPoint();

		/****** HatchGen_Domain::SetFirstPoint ******/
		/****** md5 signature: 0bd7019ad2595e1a58cb06d850e0212b ******/
		%feature("compactdefaultargs") SetFirstPoint;
		%feature("autodoc", "
Parameters
----------
P: HatchGen_PointOnHatching

Return
-------
None

Description
-----------
Sets the first point of the domain.
") SetFirstPoint;
		void SetFirstPoint(const HatchGen_PointOnHatching & P);

		/****** HatchGen_Domain::SetFirstPoint ******/
		/****** md5 signature: cc2d0403a1116c0918b69f2b0e7859c1 ******/
		%feature("compactdefaultargs") SetFirstPoint;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets the first point of the domain at the infinite.
") SetFirstPoint;
		void SetFirstPoint();

		/****** HatchGen_Domain::SetPoints ******/
		/****** md5 signature: b0e1deba6a6562a05b6a4c4c4e314c4d ******/
		%feature("compactdefaultargs") SetPoints;
		%feature("autodoc", "
Parameters
----------
P1: HatchGen_PointOnHatching
P2: HatchGen_PointOnHatching

Return
-------
None

Description
-----------
Sets the first and the second points of the domain.
") SetPoints;
		void SetPoints(const HatchGen_PointOnHatching & P1, const HatchGen_PointOnHatching & P2);

		/****** HatchGen_Domain::SetPoints ******/
		/****** md5 signature: 474d6964e8c5db9134bad493f91e9ea9 ******/
		%feature("compactdefaultargs") SetPoints;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets the first and the second points of the domain as the infinite.
") SetPoints;
		void SetPoints();

		/****** HatchGen_Domain::SetSecondPoint ******/
		/****** md5 signature: d280223bcacdef93e0950ee090227bad ******/
		%feature("compactdefaultargs") SetSecondPoint;
		%feature("autodoc", "
Parameters
----------
P: HatchGen_PointOnHatching

Return
-------
None

Description
-----------
Sets the second point of the domain.
") SetSecondPoint;
		void SetSecondPoint(const HatchGen_PointOnHatching & P);

		/****** HatchGen_Domain::SetSecondPoint ******/
		/****** md5 signature: 4e521cf34592df1547bcd8f78d3fcec8 ******/
		%feature("compactdefaultargs") SetSecondPoint;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets the second point of the domain at the infinite.
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
		/****** HatchGen_IntersectionPoint::Dump ******/
		/****** md5 signature: f0884ba988364a0619ae655764bd5191 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
Index: int (optional, default to 0)

Return
-------
None

Description
-----------
Dump of the point on element.
") Dump;
		virtual void Dump(const int Index = 0);

		/****** HatchGen_IntersectionPoint::Index ******/
		/****** md5 signature: 5f8486b8f8a28d56e63445ad924b19d8 ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the index of the supporting curve.
") Index;
		int Index();

		/****** HatchGen_IntersectionPoint::Parameter ******/
		/****** md5 signature: 28e42519a120bf741c23eca7aaca5525 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the parameter on the curve.
") Parameter;
		double Parameter();

		/****** HatchGen_IntersectionPoint::Position ******/
		/****** md5 signature: 12c62744b1270f847a2fb81f66b529c6 ******/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
TopAbs_Orientation

Description
-----------
Returns the position of the point on the curve.
") Position;
		TopAbs_Orientation Position();

		/****** HatchGen_IntersectionPoint::SegmentBeginning ******/
		/****** md5 signature: 9e39838496402b583be2d8fd42c65c02 ******/
		%feature("compactdefaultargs") SegmentBeginning;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the flag that the point is the beginning of a segment.
") SegmentBeginning;
		bool SegmentBeginning();

		/****** HatchGen_IntersectionPoint::SegmentEnd ******/
		/****** md5 signature: 7b603eec0a738dd5eb4804c34f9d9c90 ******/
		%feature("compactdefaultargs") SegmentEnd;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the flag that the point is the end of a segment.
") SegmentEnd;
		bool SegmentEnd();

		/****** HatchGen_IntersectionPoint::SetIndex ******/
		/****** md5 signature: 9ec4bea687735a1c0031f4e29a6ec90b ******/
		%feature("compactdefaultargs") SetIndex;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
None

Description
-----------
Sets the index of the supporting curve.
") SetIndex;
		void SetIndex(const int Index);

		/****** HatchGen_IntersectionPoint::SetParameter ******/
		/****** md5 signature: 940612f42ada996d7ef05d0b0dcf343c ******/
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "
Parameters
----------
Parameter: double

Return
-------
None

Description
-----------
Sets the parameter on the curve.
") SetParameter;
		void SetParameter(const double Parameter);

		/****** HatchGen_IntersectionPoint::SetPosition ******/
		/****** md5 signature: 378c44c908732d3c54529b6c924f349e ******/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "
Parameters
----------
Position: TopAbs_Orientation

Return
-------
None

Description
-----------
Sets the position of the point on the curve.
") SetPosition;
		void SetPosition(const TopAbs_Orientation Position);

		/****** HatchGen_IntersectionPoint::SetSegmentBeginning ******/
		/****** md5 signature: 467bc19202a4dcfb36ede2a4fc43695e ******/
		%feature("compactdefaultargs") SetSegmentBeginning;
		%feature("autodoc", "
Parameters
----------
State: bool (optional, default to true)

Return
-------
None

Description
-----------
Sets the flag that the point is the beginning of a segment.
") SetSegmentBeginning;
		void SetSegmentBeginning(const bool State = true);

		/****** HatchGen_IntersectionPoint::SetSegmentEnd ******/
		/****** md5 signature: 8970cfe401bbdf67d630426baa69f9e5 ******/
		%feature("compactdefaultargs") SetSegmentEnd;
		%feature("autodoc", "
Parameters
----------
State: bool (optional, default to true)

Return
-------
None

Description
-----------
Sets the flag that the point is the end of a segment.
") SetSegmentEnd;
		void SetSegmentEnd(const bool State = true);

		/****** HatchGen_IntersectionPoint::SetStateAfter ******/
		/****** md5 signature: 51a316fa868f60e3690027200ebd7cd1 ******/
		%feature("compactdefaultargs") SetStateAfter;
		%feature("autodoc", "
Parameters
----------
State: TopAbs_State

Return
-------
None

Description
-----------
Sets the transition state after the intersection.
") SetStateAfter;
		void SetStateAfter(const TopAbs_State State);

		/****** HatchGen_IntersectionPoint::SetStateBefore ******/
		/****** md5 signature: b9f8e081ae836884e3d4d5fe83c9d377 ******/
		%feature("compactdefaultargs") SetStateBefore;
		%feature("autodoc", "
Parameters
----------
State: TopAbs_State

Return
-------
None

Description
-----------
Sets the transition state before the intersection.
") SetStateBefore;
		void SetStateBefore(const TopAbs_State State);

		/****** HatchGen_IntersectionPoint::StateAfter ******/
		/****** md5 signature: 00cc234f23b0e06606bd1ce121c9c7ae ******/
		%feature("compactdefaultargs") StateAfter;
		%feature("autodoc", "Return
-------
TopAbs_State

Description
-----------
Returns the transition state after of the intersection.
") StateAfter;
		TopAbs_State StateAfter();

		/****** HatchGen_IntersectionPoint::StateBefore ******/
		/****** md5 signature: 76fbbf983aacdcf0487328d9ca214104 ******/
		%feature("compactdefaultargs") StateBefore;
		%feature("autodoc", "Return
-------
TopAbs_State

Description
-----------
Returns the transition state before the intersection.
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
		/****** HatchGen_PointOnElement::HatchGen_PointOnElement ******/
		/****** md5 signature: 487cbbe6d9c40f71545667c5a186b2b6 ******/
		%feature("compactdefaultargs") HatchGen_PointOnElement;
		%feature("autodoc", "Return
-------
None

Description
-----------
---Purpose; Creates an empty point on element.
") HatchGen_PointOnElement;
		 HatchGen_PointOnElement();

		/****** HatchGen_PointOnElement::HatchGen_PointOnElement ******/
		/****** md5 signature: 0b19450c5960b9438bdefe885e950d9c ******/
		%feature("compactdefaultargs") HatchGen_PointOnElement;
		%feature("autodoc", "
Parameters
----------
Point: IntRes2d_IntersectionPoint

Return
-------
None

Description
-----------
Creates a point from an intersection point.
") HatchGen_PointOnElement;
		 HatchGen_PointOnElement(const IntRes2d_IntersectionPoint & Point);

		/****** HatchGen_PointOnElement::Dump ******/
		/****** md5 signature: 9fcc65e264182d45eadca2135659b6c9 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
Index: int (optional, default to 0)

Return
-------
None

Description
-----------
Dump of the point on element.
") Dump;
		void Dump(const int Index = 0);

		/****** HatchGen_PointOnElement::IntersectionType ******/
		/****** md5 signature: 206db412c05d4cba1af058c245450cd6 ******/
		%feature("compactdefaultargs") IntersectionType;
		%feature("autodoc", "Return
-------
HatchGen_IntersectionType

Description
-----------
Returns the intersection type at this point.
") IntersectionType;
		HatchGen_IntersectionType IntersectionType();

		/****** HatchGen_PointOnElement::IsDifferent ******/
		/****** md5 signature: 2d9a302a6e53ac4e83ea2b2762284653 ******/
		%feature("compactdefaultargs") IsDifferent;
		%feature("autodoc", "
Parameters
----------
Point: HatchGen_PointOnElement
Confusion: double

Return
-------
bool

Description
-----------
Tests if the point is different from an other.
") IsDifferent;
		bool IsDifferent(const HatchGen_PointOnElement & Point, const double Confusion);

		/****** HatchGen_PointOnElement::IsIdentical ******/
		/****** md5 signature: dd57055c642f70a9e9608e7b285f3fc5 ******/
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "
Parameters
----------
Point: HatchGen_PointOnElement
Confusion: double

Return
-------
bool

Description
-----------
Tests if the point is identical to an other. That is to say: P1.myIndex = P2.myIndex Abs (P1.myParam - P2.myParam) <= Confusion P1.myPosit = P2.myPosit P1.myBefore = P2.myBefore P1.myAfter = P2.myAfter P1.mySegBeg = P2.mySegBeg P1.mySegEnd = P2.mySegEnd P1.myType = P2.myType.
") IsIdentical;
		bool IsIdentical(const HatchGen_PointOnElement & Point, const double Confusion);

		/****** HatchGen_PointOnElement::SetIntersectionType ******/
		/****** md5 signature: 003e8404b81f3387812eae64dab1ac55 ******/
		%feature("compactdefaultargs") SetIntersectionType;
		%feature("autodoc", "
Parameters
----------
Type: HatchGen_IntersectionType

Return
-------
None

Description
-----------
Sets the intersection type at this point.
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
		/****** HatchGen_PointOnHatching::HatchGen_PointOnHatching ******/
		/****** md5 signature: e1ad16e2d71a24cdb1b1a938cb0400de ******/
		%feature("compactdefaultargs") HatchGen_PointOnHatching;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty point.
") HatchGen_PointOnHatching;
		 HatchGen_PointOnHatching();

		/****** HatchGen_PointOnHatching::HatchGen_PointOnHatching ******/
		/****** md5 signature: 2d49efd88e5038a0b441348c0349938f ******/
		%feature("compactdefaultargs") HatchGen_PointOnHatching;
		%feature("autodoc", "
Parameters
----------
Point: IntRes2d_IntersectionPoint

Return
-------
None

Description
-----------
Creates a point from an intersection point.
") HatchGen_PointOnHatching;
		 HatchGen_PointOnHatching(const IntRes2d_IntersectionPoint & Point);

		/****** HatchGen_PointOnHatching::AddPoint ******/
		/****** md5 signature: 1fbd0a703268ba9f0fc489cb4e996549 ******/
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "
Parameters
----------
Point: HatchGen_PointOnElement
Confusion: double

Return
-------
None

Description
-----------
Adds a point on element to the point.
") AddPoint;
		void AddPoint(const HatchGen_PointOnElement & Point, const double Confusion);

		/****** HatchGen_PointOnHatching::ClrPoints ******/
		/****** md5 signature: e99750252922662025bcc4d5f2030893 ******/
		%feature("compactdefaultargs") ClrPoints;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all the points on element of the point.
") ClrPoints;
		void ClrPoints();

		/****** HatchGen_PointOnHatching::Dump ******/
		/****** md5 signature: 9fcc65e264182d45eadca2135659b6c9 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
Index: int (optional, default to 0)

Return
-------
None

Description
-----------
Dump of the point.
") Dump;
		void Dump(const int Index = 0);

		/****** HatchGen_PointOnHatching::IsEqual ******/
		/****** md5 signature: 5cac43b0faa9dd726e0ad210b8aa20fd ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
Point: HatchGen_PointOnHatching
Confusion: double

Return
-------
bool

Description
-----------
Tests if the point is equal to an other. A point on hatching P1 is said to be equal to an other P2 if: | P2.myParam - P1.myParam | <= Confusion.
") IsEqual;
		bool IsEqual(const HatchGen_PointOnHatching & Point, const double Confusion);

		/****** HatchGen_PointOnHatching::IsGreater ******/
		/****** md5 signature: 09e13e6f6971294c0abe71cbdc6cfce0 ******/
		%feature("compactdefaultargs") IsGreater;
		%feature("autodoc", "
Parameters
----------
Point: HatchGen_PointOnHatching
Confusion: double

Return
-------
bool

Description
-----------
Tests if the point is greater than an other. A point on hatching P1 is said to be greater than an other P2 if: P1.myParam - P2.myParam > Confusion.
") IsGreater;
		bool IsGreater(const HatchGen_PointOnHatching & Point, const double Confusion);

		/****** HatchGen_PointOnHatching::IsLower ******/
		/****** md5 signature: 0d554dfbd408ed2606ab5124bc16adb4 ******/
		%feature("compactdefaultargs") IsLower;
		%feature("autodoc", "
Parameters
----------
Point: HatchGen_PointOnHatching
Confusion: double

Return
-------
bool

Description
-----------
Tests if the point is lower than an other. A point on hatching P1 is said to be lower than an other P2 if: P2.myParam - P1.myParam > Confusion.
") IsLower;
		bool IsLower(const HatchGen_PointOnHatching & Point, const double Confusion);

		/****** HatchGen_PointOnHatching::NbPoints ******/
		/****** md5 signature: 0243a6484ef0942dcad871f7c247b5de ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of elements intersecting the hatching at this point.
") NbPoints;
		int NbPoints();

		/****** HatchGen_PointOnHatching::Point ******/
		/****** md5 signature: b2a24b7a9a49b9868b905f1f24e4aecf ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
HatchGen_PointOnElement

Description
-----------
Returns the Index-th point on element of the point. The exception OutOfRange is raised if Index > NbPoints.
") Point;
		const HatchGen_PointOnElement & Point(const int Index);

		/****** HatchGen_PointOnHatching::RemPoint ******/
		/****** md5 signature: 07323d3a50ede9b835c517bad7072314 ******/
		%feature("compactdefaultargs") RemPoint;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
None

Description
-----------
Removes the Index-th point on element of the point. The exception OutOfRange is raised if Index > NbPoints.
") RemPoint;
		void RemPoint(const int Index);

};


%extend HatchGen_PointOnHatching {
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
