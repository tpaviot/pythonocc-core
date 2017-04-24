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
%module (package="OCC") HatchGen

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


%include HatchGen_headers.i


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

%nodefaultctor HatchGen_Domain;
class HatchGen_Domain {
	public:
		%feature("compactdefaultargs") HatchGen_Domain;
		%feature("autodoc", "	* Creates an infinite domain.

	:rtype: None
") HatchGen_Domain;
		 HatchGen_Domain ();
		%feature("compactdefaultargs") HatchGen_Domain;
		%feature("autodoc", "	* Creates a domain for the curve associated to a hatching.

	:param P1:
	:type P1: HatchGen_PointOnHatching &
	:param P2:
	:type P2: HatchGen_PointOnHatching &
	:rtype: None
") HatchGen_Domain;
		 HatchGen_Domain (const HatchGen_PointOnHatching & P1,const HatchGen_PointOnHatching & P2);
		%feature("compactdefaultargs") HatchGen_Domain;
		%feature("autodoc", "	* Creates a semi-infinite domain for the curve associated to a hatching. The `First' flag means that the given point is the first one.

	:param P:
	:type P: HatchGen_PointOnHatching &
	:param First:
	:type First: bool
	:rtype: None
") HatchGen_Domain;
		 HatchGen_Domain (const HatchGen_PointOnHatching & P,const Standard_Boolean First);
		%feature("compactdefaultargs") SetPoints;
		%feature("autodoc", "	* Sets the first and the second points of the domain.

	:param P1:
	:type P1: HatchGen_PointOnHatching &
	:param P2:
	:type P2: HatchGen_PointOnHatching &
	:rtype: None
") SetPoints;
		void SetPoints (const HatchGen_PointOnHatching & P1,const HatchGen_PointOnHatching & P2);
		%feature("compactdefaultargs") SetPoints;
		%feature("autodoc", "	* Sets the first and the second points of the domain as the infinite.

	:rtype: None
") SetPoints;
		void SetPoints ();
		%feature("compactdefaultargs") SetFirstPoint;
		%feature("autodoc", "	* Sets the first point of the domain.

	:param P:
	:type P: HatchGen_PointOnHatching &
	:rtype: None
") SetFirstPoint;
		void SetFirstPoint (const HatchGen_PointOnHatching & P);
		%feature("compactdefaultargs") SetFirstPoint;
		%feature("autodoc", "	* Sets the first point of the domain at the infinite.

	:rtype: None
") SetFirstPoint;
		void SetFirstPoint ();
		%feature("compactdefaultargs") SetSecondPoint;
		%feature("autodoc", "	* Sets the second point of the domain.

	:param P:
	:type P: HatchGen_PointOnHatching &
	:rtype: None
") SetSecondPoint;
		void SetSecondPoint (const HatchGen_PointOnHatching & P);
		%feature("compactdefaultargs") SetSecondPoint;
		%feature("autodoc", "	* Sets the second point of the domain at the infinite.

	:rtype: None
") SetSecondPoint;
		void SetSecondPoint ();
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "	* Returns True if the domain has a first point.

	:rtype: bool
") HasFirstPoint;
		Standard_Boolean HasFirstPoint ();
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "	* Returns the first point of the domain. The exception DomainError is raised if HasFirstPoint returns False.

	:rtype: HatchGen_PointOnHatching
") FirstPoint;
		const HatchGen_PointOnHatching & FirstPoint ();
		%feature("compactdefaultargs") HasSecondPoint;
		%feature("autodoc", "	* Returns True if the domain has a second point.

	:rtype: bool
") HasSecondPoint;
		Standard_Boolean HasSecondPoint ();
		%feature("compactdefaultargs") SecondPoint;
		%feature("autodoc", "	* Returns the second point of the domain. The exception DomainError is raised if HasSecondPoint returns False.

	:rtype: HatchGen_PointOnHatching
") SecondPoint;
		const HatchGen_PointOnHatching & SecondPoint ();
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	* Dump of the domain.

	:param Index: default value is 0
	:type Index: int
	:rtype: None
") Dump;
		void Dump (const Standard_Integer Index = 0);
};


%extend HatchGen_Domain {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor HatchGen_Domains;
class HatchGen_Domains : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") HatchGen_Domains;
		%feature("autodoc", "	:rtype: None
") HatchGen_Domains;
		 HatchGen_Domains ();
		%feature("compactdefaultargs") HatchGen_Domains;
		%feature("autodoc", "	:param Other:
	:type Other: HatchGen_Domains &
	:rtype: None
") HatchGen_Domains;
		 HatchGen_Domains (const HatchGen_Domains & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: HatchGen_Domains &
	:rtype: HatchGen_Domains
") Assign;
		const HatchGen_Domains & Assign (const HatchGen_Domains & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: HatchGen_Domains &
	:rtype: HatchGen_Domains
") operator =;
		const HatchGen_Domains & operator = (const HatchGen_Domains & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: HatchGen_Domain &
	:rtype: None
") Append;
		void Append (const HatchGen_Domain & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: HatchGen_Domains &
	:rtype: None
") Append;
		void Append (HatchGen_Domains & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: HatchGen_Domain &
	:rtype: None
") Prepend;
		void Prepend (const HatchGen_Domain & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: HatchGen_Domains &
	:rtype: None
") Prepend;
		void Prepend (HatchGen_Domains & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: HatchGen_Domain &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const HatchGen_Domain & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: HatchGen_Domains &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,HatchGen_Domains & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: HatchGen_Domain &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const HatchGen_Domain & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: HatchGen_Domains &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,HatchGen_Domains & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: HatchGen_Domain
") First;
		const HatchGen_Domain & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: HatchGen_Domain
") Last;
		const HatchGen_Domain & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: HatchGen_Domains &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,HatchGen_Domains & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: HatchGen_Domain
") Value;
		const HatchGen_Domain & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: HatchGen_Domain &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const HatchGen_Domain & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: HatchGen_Domain
") ChangeValue;
		HatchGen_Domain & ChangeValue (const Standard_Integer Index);
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


%extend HatchGen_Domains {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor HatchGen_IntersectionPoint;
class HatchGen_IntersectionPoint {
	public:
		%feature("compactdefaultargs") SetIndex;
		%feature("autodoc", "	* Sets the index of the supporting curve.

	:param Index:
	:type Index: int
	:rtype: None
") SetIndex;
		void SetIndex (const Standard_Integer Index);
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "	* Returns the index of the supporting curve.

	:rtype: int
") Index;
		Standard_Integer Index ();
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "	* Sets the parameter on the curve.

	:param Parameter:
	:type Parameter: float
	:rtype: None
") SetParameter;
		void SetParameter (const Standard_Real Parameter);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Returns the parameter on the curve.

	:rtype: float
") Parameter;
		Standard_Real Parameter ();
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "	* Sets the position of the point on the curve.

	:param Position:
	:type Position: TopAbs_Orientation
	:rtype: None
") SetPosition;
		void SetPosition (const TopAbs_Orientation Position);
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "	* Returns the position of the point on the curve.

	:rtype: TopAbs_Orientation
") Position;
		TopAbs_Orientation Position ();
		%feature("compactdefaultargs") SetStateBefore;
		%feature("autodoc", "	* Sets the transition state before the intersection.

	:param State:
	:type State: TopAbs_State
	:rtype: None
") SetStateBefore;
		void SetStateBefore (const TopAbs_State State);
		%feature("compactdefaultargs") StateBefore;
		%feature("autodoc", "	* Returns the transition state before the intersection.

	:rtype: TopAbs_State
") StateBefore;
		TopAbs_State StateBefore ();
		%feature("compactdefaultargs") SetStateAfter;
		%feature("autodoc", "	* Sets the transition state after the intersection.

	:param State:
	:type State: TopAbs_State
	:rtype: None
") SetStateAfter;
		void SetStateAfter (const TopAbs_State State);
		%feature("compactdefaultargs") StateAfter;
		%feature("autodoc", "	* Returns the transition state after of the intersection.

	:rtype: TopAbs_State
") StateAfter;
		TopAbs_State StateAfter ();
		%feature("compactdefaultargs") SetSegmentBeginning;
		%feature("autodoc", "	* Sets the flag that the point is the beginning of a segment.

	:param State: default value is Standard_True
	:type State: bool
	:rtype: None
") SetSegmentBeginning;
		void SetSegmentBeginning (const Standard_Boolean State = Standard_True);
		%feature("compactdefaultargs") SegmentBeginning;
		%feature("autodoc", "	* Returns the flag that the point is the beginning of a segment.

	:rtype: bool
") SegmentBeginning;
		Standard_Boolean SegmentBeginning ();
		%feature("compactdefaultargs") SetSegmentEnd;
		%feature("autodoc", "	* Sets the flag that the point is the end of a segment.

	:param State: default value is Standard_True
	:type State: bool
	:rtype: None
") SetSegmentEnd;
		void SetSegmentEnd (const Standard_Boolean State = Standard_True);
		%feature("compactdefaultargs") SegmentEnd;
		%feature("autodoc", "	* Returns the flag that the point is the end of a segment.

	:rtype: bool
") SegmentEnd;
		Standard_Boolean SegmentEnd ();
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	* Dump of the point on element.

	:param Index: default value is 0
	:type Index: int
	:rtype: void
") Dump;
		virtual void Dump (const Standard_Integer Index = 0);
};


%extend HatchGen_IntersectionPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor HatchGen_PointsOnElement;
class HatchGen_PointsOnElement : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") HatchGen_PointsOnElement;
		%feature("autodoc", "	:rtype: None
") HatchGen_PointsOnElement;
		 HatchGen_PointsOnElement ();
		%feature("compactdefaultargs") HatchGen_PointsOnElement;
		%feature("autodoc", "	:param Other:
	:type Other: HatchGen_PointsOnElement &
	:rtype: None
") HatchGen_PointsOnElement;
		 HatchGen_PointsOnElement (const HatchGen_PointsOnElement & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: HatchGen_PointsOnElement &
	:rtype: HatchGen_PointsOnElement
") Assign;
		const HatchGen_PointsOnElement & Assign (const HatchGen_PointsOnElement & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: HatchGen_PointsOnElement &
	:rtype: HatchGen_PointsOnElement
") operator =;
		const HatchGen_PointsOnElement & operator = (const HatchGen_PointsOnElement & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: HatchGen_PointOnElement &
	:rtype: None
") Append;
		void Append (const HatchGen_PointOnElement & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: HatchGen_PointsOnElement &
	:rtype: None
") Append;
		void Append (HatchGen_PointsOnElement & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: HatchGen_PointOnElement &
	:rtype: None
") Prepend;
		void Prepend (const HatchGen_PointOnElement & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: HatchGen_PointsOnElement &
	:rtype: None
") Prepend;
		void Prepend (HatchGen_PointsOnElement & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: HatchGen_PointOnElement &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const HatchGen_PointOnElement & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: HatchGen_PointsOnElement &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,HatchGen_PointsOnElement & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: HatchGen_PointOnElement &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const HatchGen_PointOnElement & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: HatchGen_PointsOnElement &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,HatchGen_PointsOnElement & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: HatchGen_PointOnElement
") First;
		const HatchGen_PointOnElement & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: HatchGen_PointOnElement
") Last;
		const HatchGen_PointOnElement & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: HatchGen_PointsOnElement &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,HatchGen_PointsOnElement & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: HatchGen_PointOnElement
") Value;
		const HatchGen_PointOnElement & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: HatchGen_PointOnElement &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const HatchGen_PointOnElement & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: HatchGen_PointOnElement
") ChangeValue;
		HatchGen_PointOnElement & ChangeValue (const Standard_Integer Index);
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


%extend HatchGen_PointsOnElement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor HatchGen_PointsOnHatching;
class HatchGen_PointsOnHatching : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") HatchGen_PointsOnHatching;
		%feature("autodoc", "	:rtype: None
") HatchGen_PointsOnHatching;
		 HatchGen_PointsOnHatching ();
		%feature("compactdefaultargs") HatchGen_PointsOnHatching;
		%feature("autodoc", "	:param Other:
	:type Other: HatchGen_PointsOnHatching &
	:rtype: None
") HatchGen_PointsOnHatching;
		 HatchGen_PointsOnHatching (const HatchGen_PointsOnHatching & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: HatchGen_PointsOnHatching &
	:rtype: HatchGen_PointsOnHatching
") Assign;
		const HatchGen_PointsOnHatching & Assign (const HatchGen_PointsOnHatching & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: HatchGen_PointsOnHatching &
	:rtype: HatchGen_PointsOnHatching
") operator =;
		const HatchGen_PointsOnHatching & operator = (const HatchGen_PointsOnHatching & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: HatchGen_PointOnHatching &
	:rtype: None
") Append;
		void Append (const HatchGen_PointOnHatching & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: HatchGen_PointsOnHatching &
	:rtype: None
") Append;
		void Append (HatchGen_PointsOnHatching & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: HatchGen_PointOnHatching &
	:rtype: None
") Prepend;
		void Prepend (const HatchGen_PointOnHatching & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: HatchGen_PointsOnHatching &
	:rtype: None
") Prepend;
		void Prepend (HatchGen_PointsOnHatching & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: HatchGen_PointOnHatching &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const HatchGen_PointOnHatching & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: HatchGen_PointsOnHatching &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,HatchGen_PointsOnHatching & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: HatchGen_PointOnHatching &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const HatchGen_PointOnHatching & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: HatchGen_PointsOnHatching &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,HatchGen_PointsOnHatching & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: HatchGen_PointOnHatching
") First;
		const HatchGen_PointOnHatching & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: HatchGen_PointOnHatching
") Last;
		const HatchGen_PointOnHatching & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: HatchGen_PointsOnHatching &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,HatchGen_PointsOnHatching & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: HatchGen_PointOnHatching
") Value;
		const HatchGen_PointOnHatching & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: HatchGen_PointOnHatching &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const HatchGen_PointOnHatching & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: HatchGen_PointOnHatching
") ChangeValue;
		HatchGen_PointOnHatching & ChangeValue (const Standard_Integer Index);
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


%extend HatchGen_PointsOnHatching {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor HatchGen_SequenceNodeOfDomains;
class HatchGen_SequenceNodeOfDomains : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") HatchGen_SequenceNodeOfDomains;
		%feature("autodoc", "	:param I:
	:type I: HatchGen_Domain &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") HatchGen_SequenceNodeOfDomains;
		 HatchGen_SequenceNodeOfDomains (const HatchGen_Domain & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: HatchGen_Domain
") Value;
		HatchGen_Domain & Value ();
};


%extend HatchGen_SequenceNodeOfDomains {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_HatchGen_SequenceNodeOfDomains(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_HatchGen_SequenceNodeOfDomains::Handle_HatchGen_SequenceNodeOfDomains %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_HatchGen_SequenceNodeOfDomains;
class Handle_HatchGen_SequenceNodeOfDomains : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_HatchGen_SequenceNodeOfDomains();
        Handle_HatchGen_SequenceNodeOfDomains(const Handle_HatchGen_SequenceNodeOfDomains &aHandle);
        Handle_HatchGen_SequenceNodeOfDomains(const HatchGen_SequenceNodeOfDomains *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_HatchGen_SequenceNodeOfDomains DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_HatchGen_SequenceNodeOfDomains {
    HatchGen_SequenceNodeOfDomains* _get_reference() {
    return (HatchGen_SequenceNodeOfDomains*)$self->Access();
    }
};

%extend Handle_HatchGen_SequenceNodeOfDomains {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend HatchGen_SequenceNodeOfDomains {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor HatchGen_SequenceNodeOfPointsOnElement;
class HatchGen_SequenceNodeOfPointsOnElement : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") HatchGen_SequenceNodeOfPointsOnElement;
		%feature("autodoc", "	:param I:
	:type I: HatchGen_PointOnElement &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") HatchGen_SequenceNodeOfPointsOnElement;
		 HatchGen_SequenceNodeOfPointsOnElement (const HatchGen_PointOnElement & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: HatchGen_PointOnElement
") Value;
		HatchGen_PointOnElement & Value ();
};


%extend HatchGen_SequenceNodeOfPointsOnElement {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_HatchGen_SequenceNodeOfPointsOnElement(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_HatchGen_SequenceNodeOfPointsOnElement::Handle_HatchGen_SequenceNodeOfPointsOnElement %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_HatchGen_SequenceNodeOfPointsOnElement;
class Handle_HatchGen_SequenceNodeOfPointsOnElement : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_HatchGen_SequenceNodeOfPointsOnElement();
        Handle_HatchGen_SequenceNodeOfPointsOnElement(const Handle_HatchGen_SequenceNodeOfPointsOnElement &aHandle);
        Handle_HatchGen_SequenceNodeOfPointsOnElement(const HatchGen_SequenceNodeOfPointsOnElement *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_HatchGen_SequenceNodeOfPointsOnElement DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_HatchGen_SequenceNodeOfPointsOnElement {
    HatchGen_SequenceNodeOfPointsOnElement* _get_reference() {
    return (HatchGen_SequenceNodeOfPointsOnElement*)$self->Access();
    }
};

%extend Handle_HatchGen_SequenceNodeOfPointsOnElement {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend HatchGen_SequenceNodeOfPointsOnElement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor HatchGen_SequenceNodeOfPointsOnHatching;
class HatchGen_SequenceNodeOfPointsOnHatching : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") HatchGen_SequenceNodeOfPointsOnHatching;
		%feature("autodoc", "	:param I:
	:type I: HatchGen_PointOnHatching &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") HatchGen_SequenceNodeOfPointsOnHatching;
		 HatchGen_SequenceNodeOfPointsOnHatching (const HatchGen_PointOnHatching & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: HatchGen_PointOnHatching
") Value;
		HatchGen_PointOnHatching & Value ();
};


%extend HatchGen_SequenceNodeOfPointsOnHatching {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_HatchGen_SequenceNodeOfPointsOnHatching(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_HatchGen_SequenceNodeOfPointsOnHatching::Handle_HatchGen_SequenceNodeOfPointsOnHatching %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_HatchGen_SequenceNodeOfPointsOnHatching;
class Handle_HatchGen_SequenceNodeOfPointsOnHatching : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_HatchGen_SequenceNodeOfPointsOnHatching();
        Handle_HatchGen_SequenceNodeOfPointsOnHatching(const Handle_HatchGen_SequenceNodeOfPointsOnHatching &aHandle);
        Handle_HatchGen_SequenceNodeOfPointsOnHatching(const HatchGen_SequenceNodeOfPointsOnHatching *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_HatchGen_SequenceNodeOfPointsOnHatching DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_HatchGen_SequenceNodeOfPointsOnHatching {
    HatchGen_SequenceNodeOfPointsOnHatching* _get_reference() {
    return (HatchGen_SequenceNodeOfPointsOnHatching*)$self->Access();
    }
};

%extend Handle_HatchGen_SequenceNodeOfPointsOnHatching {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend HatchGen_SequenceNodeOfPointsOnHatching {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor HatchGen_PointOnElement;
class HatchGen_PointOnElement : public HatchGen_IntersectionPoint {
	public:
		%feature("compactdefaultargs") HatchGen_PointOnElement;
		%feature("autodoc", "	* ---Purpose; Creates an empty point on element

	:rtype: None
") HatchGen_PointOnElement;
		 HatchGen_PointOnElement ();
		%feature("compactdefaultargs") HatchGen_PointOnElement;
		%feature("autodoc", "	* Creates a point from an other.

	:param Point:
	:type Point: HatchGen_PointOnElement &
	:rtype: None
") HatchGen_PointOnElement;
		 HatchGen_PointOnElement (const HatchGen_PointOnElement & Point);
		%feature("compactdefaultargs") HatchGen_PointOnElement;
		%feature("autodoc", "	* Creates a point from an intersection point.

	:param Point:
	:type Point: IntRes2d_IntersectionPoint &
	:rtype: None
") HatchGen_PointOnElement;
		 HatchGen_PointOnElement (const IntRes2d_IntersectionPoint & Point);
		%feature("compactdefaultargs") SetIntersectionType;
		%feature("autodoc", "	* Sets the intersection type at this point.

	:param Type:
	:type Type: HatchGen_IntersectionType
	:rtype: None
") SetIntersectionType;
		void SetIntersectionType (const HatchGen_IntersectionType Type);
		%feature("compactdefaultargs") IntersectionType;
		%feature("autodoc", "	* Returns the intersection type at this point.

	:rtype: HatchGen_IntersectionType
") IntersectionType;
		HatchGen_IntersectionType IntersectionType ();
		%feature("compactdefaultargs") IsIdentical;
		%feature("autodoc", "	* Tests if the point is identical to an other. That is to say : P1.myIndex = P2.myIndex Abs (P1.myParam - P2.myParam) <= Confusion P1.myPosit = P2.myPosit P1.myBefore = P2.myBefore P1.myAfter = P2.myAfter P1.mySegBeg = P2.mySegBeg P1.mySegEnd = P2.mySegEnd P1.myType = P2.myType

	:param Point:
	:type Point: HatchGen_PointOnElement &
	:param Confusion:
	:type Confusion: float
	:rtype: bool
") IsIdentical;
		Standard_Boolean IsIdentical (const HatchGen_PointOnElement & Point,const Standard_Real Confusion);
		%feature("compactdefaultargs") IsDifferent;
		%feature("autodoc", "	* Tests if the point is different from an other.

	:param Point:
	:type Point: HatchGen_PointOnElement &
	:param Confusion:
	:type Confusion: float
	:rtype: bool
") IsDifferent;
		Standard_Boolean IsDifferent (const HatchGen_PointOnElement & Point,const Standard_Real Confusion);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	* Dump of the point on element.

	:param Index: default value is 0
	:type Index: int
	:rtype: None
") Dump;
		void Dump (const Standard_Integer Index = 0);
};


%extend HatchGen_PointOnElement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor HatchGen_PointOnHatching;
class HatchGen_PointOnHatching : public HatchGen_IntersectionPoint {
	public:
		%feature("compactdefaultargs") HatchGen_PointOnHatching;
		%feature("autodoc", "	* Creates an empty point.

	:rtype: None
") HatchGen_PointOnHatching;
		 HatchGen_PointOnHatching ();
		%feature("compactdefaultargs") HatchGen_PointOnHatching;
		%feature("autodoc", "	* Creates a point from an other.

	:param Point:
	:type Point: HatchGen_PointOnHatching &
	:rtype: None
") HatchGen_PointOnHatching;
		 HatchGen_PointOnHatching (const HatchGen_PointOnHatching & Point);
		%feature("compactdefaultargs") HatchGen_PointOnHatching;
		%feature("autodoc", "	* Creates a point from an intersection point.

	:param Point:
	:type Point: IntRes2d_IntersectionPoint &
	:rtype: None
") HatchGen_PointOnHatching;
		 HatchGen_PointOnHatching (const IntRes2d_IntersectionPoint & Point);
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "	* Adds a point on element to the point.

	:param Point:
	:type Point: HatchGen_PointOnElement &
	:param Confusion:
	:type Confusion: float
	:rtype: None
") AddPoint;
		void AddPoint (const HatchGen_PointOnElement & Point,const Standard_Real Confusion);
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "	* Returns the number of elements intersecting the hatching at this point.

	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the Index-th point on element of the point. The exception OutOfRange is raised if Index > NbPoints.

	:param Index:
	:type Index: int
	:rtype: HatchGen_PointOnElement
") Point;
		const HatchGen_PointOnElement & Point (const Standard_Integer Index);
		%feature("compactdefaultargs") RemPoint;
		%feature("autodoc", "	* Removes the Index-th point on element of the point. The exception OutOfRange is raised if Index > NbPoints.

	:param Index:
	:type Index: int
	:rtype: None
") RemPoint;
		void RemPoint (const Standard_Integer Index);
		%feature("compactdefaultargs") ClrPoints;
		%feature("autodoc", "	* Removes all the points on element of the point.

	:rtype: None
") ClrPoints;
		void ClrPoints ();
		%feature("compactdefaultargs") IsLower;
		%feature("autodoc", "	* Tests if the point is lower than an other. A point on hatching P1 is said to be lower than an other P2 if : P2.myParam - P1.myParam > Confusion

	:param Point:
	:type Point: HatchGen_PointOnHatching &
	:param Confusion:
	:type Confusion: float
	:rtype: bool
") IsLower;
		Standard_Boolean IsLower (const HatchGen_PointOnHatching & Point,const Standard_Real Confusion);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* Tests if the point is equal to an other. A point on hatching P1 is said to be equal to an other P2 if : | P2.myParam - P1.myParam | <= Confusion

	:param Point:
	:type Point: HatchGen_PointOnHatching &
	:param Confusion:
	:type Confusion: float
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const HatchGen_PointOnHatching & Point,const Standard_Real Confusion);
		%feature("compactdefaultargs") IsGreater;
		%feature("autodoc", "	* Tests if the point is greater than an other. A point on hatching P1 is said to be greater than an other P2 if : P1.myParam - P2.myParam > Confusion

	:param Point:
	:type Point: HatchGen_PointOnHatching &
	:param Confusion:
	:type Confusion: float
	:rtype: bool
") IsGreater;
		Standard_Boolean IsGreater (const HatchGen_PointOnHatching & Point,const Standard_Real Confusion);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	* Dump of the point.

	:param Index: default value is 0
	:type Index: int
	:rtype: None
") Dump;
		void Dump (const Standard_Integer Index = 0);
};


%extend HatchGen_PointOnHatching {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
