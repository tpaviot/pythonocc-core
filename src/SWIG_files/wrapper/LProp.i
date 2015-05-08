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
%module (package="OCC") LProp

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

%include LProp_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
enum LProp_CIType {
	LProp_Inflection = 0,
	LProp_MinCur = 1,
	LProp_MaxCur = 2,
};

enum LProp_Status {
	LProp_Undecided = 0,
	LProp_Undefined = 1,
	LProp_Defined = 2,
	LProp_Computed = 3,
};

/* end public enums declaration */

%nodefaultctor LProp_AnalyticCurInf;
class LProp_AnalyticCurInf {
	public:
		%feature("autodoc", "	:rtype: None
") LProp_AnalyticCurInf;
		 LProp_AnalyticCurInf ();
		%feature("autodoc", "	:param T:
	:type T: GeomAbs_CurveType
	:param UFirst:
	:type UFirst: float
	:param ULast:
	:type ULast: float
	:param Result:
	:type Result: LProp_CurAndInf &
	:rtype: None
") Perform;
		void Perform (const GeomAbs_CurveType T,const Standard_Real UFirst,const Standard_Real ULast,LProp_CurAndInf & Result);
};


%feature("shadow") LProp_AnalyticCurInf::~LProp_AnalyticCurInf %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend LProp_AnalyticCurInf {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor LProp_CurAndInf;
class LProp_CurAndInf {
	public:
		%feature("autodoc", "	:rtype: None
") LProp_CurAndInf;
		 LProp_CurAndInf ();
		%feature("autodoc", "	:param Param:
	:type Param: float
	:rtype: None
") AddInflection;
		void AddInflection (const Standard_Real Param);
		%feature("autodoc", "	:param Param:
	:type Param: float
	:param IsMin:
	:type IsMin: bool
	:rtype: None
") AddExtCur;
		void AddExtCur (const Standard_Real Param,const Standard_Boolean IsMin);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	* Returns the number of points. The Points are stored to increasing parameter.

	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
		%feature("autodoc", "	* Returns the parameter of the Nth point. raises if N not in the range [1,NbPoints()]

	:param N:
	:type N: Standard_Integer
	:rtype: float
") Parameter;
		Standard_Real Parameter (const Standard_Integer N);
		%feature("autodoc", "	* Returns - MinCur if the Nth parameter corresponds to a minimum of the radius of curvature. - MaxCur if the Nth parameter corresponds to a maximum of the radius of curvature. - Inflection if the parameter corresponds to a point of inflection. raises if N not in the range [1,NbPoints()]

	:param N:
	:type N: Standard_Integer
	:rtype: LProp_CIType
") Type;
		LProp_CIType Type (const Standard_Integer N);
};


%feature("shadow") LProp_CurAndInf::~LProp_CurAndInf %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend LProp_CurAndInf {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor LProp_SequenceNodeOfSequenceOfCIType;
class LProp_SequenceNodeOfSequenceOfCIType : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: LProp_CIType &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") LProp_SequenceNodeOfSequenceOfCIType;
		 LProp_SequenceNodeOfSequenceOfCIType (const LProp_CIType & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: LProp_CIType
") Value;
		LProp_CIType & Value ();
};


%feature("shadow") LProp_SequenceNodeOfSequenceOfCIType::~LProp_SequenceNodeOfSequenceOfCIType %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend LProp_SequenceNodeOfSequenceOfCIType {
	void _kill_pointed() {
		delete $self;
	}
};
%extend LProp_SequenceNodeOfSequenceOfCIType {
	Handle_LProp_SequenceNodeOfSequenceOfCIType GetHandle() {
	return *(Handle_LProp_SequenceNodeOfSequenceOfCIType*) &$self;
	}
};

%nodefaultctor Handle_LProp_SequenceNodeOfSequenceOfCIType;
class Handle_LProp_SequenceNodeOfSequenceOfCIType : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_LProp_SequenceNodeOfSequenceOfCIType();
        Handle_LProp_SequenceNodeOfSequenceOfCIType(const Handle_LProp_SequenceNodeOfSequenceOfCIType &aHandle);
        Handle_LProp_SequenceNodeOfSequenceOfCIType(const LProp_SequenceNodeOfSequenceOfCIType *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_LProp_SequenceNodeOfSequenceOfCIType DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_LProp_SequenceNodeOfSequenceOfCIType {
    LProp_SequenceNodeOfSequenceOfCIType* GetObject() {
    return (LProp_SequenceNodeOfSequenceOfCIType*)$self->Access();
    }
};
%feature("shadow") Handle_LProp_SequenceNodeOfSequenceOfCIType::~Handle_LProp_SequenceNodeOfSequenceOfCIType %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_LProp_SequenceNodeOfSequenceOfCIType {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor LProp_SequenceOfCIType;
class LProp_SequenceOfCIType : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") LProp_SequenceOfCIType;
		 LProp_SequenceOfCIType ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: LProp_SequenceOfCIType &
	:rtype: LProp_SequenceOfCIType
") Assign;
		const LProp_SequenceOfCIType & Assign (const LProp_SequenceOfCIType & Other);
		%feature("autodoc", "	:param Other:
	:type Other: LProp_SequenceOfCIType &
	:rtype: LProp_SequenceOfCIType
") operator=;
		const LProp_SequenceOfCIType & operator = (const LProp_SequenceOfCIType & Other);
		%feature("autodoc", "	:param T:
	:type T: LProp_CIType &
	:rtype: None
") Append;
		void Append (const LProp_CIType & T);
		%feature("autodoc", "	:param S:
	:type S: LProp_SequenceOfCIType &
	:rtype: None
") Append;
		void Append (LProp_SequenceOfCIType & S);
		%feature("autodoc", "	:param T:
	:type T: LProp_CIType &
	:rtype: None
") Prepend;
		void Prepend (const LProp_CIType & T);
		%feature("autodoc", "	:param S:
	:type S: LProp_SequenceOfCIType &
	:rtype: None
") Prepend;
		void Prepend (LProp_SequenceOfCIType & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: LProp_CIType &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const LProp_CIType & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: LProp_SequenceOfCIType &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,LProp_SequenceOfCIType & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: LProp_CIType &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const LProp_CIType & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: LProp_SequenceOfCIType &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,LProp_SequenceOfCIType & S);
		%feature("autodoc", "	:rtype: LProp_CIType
") First;
		const LProp_CIType & First ();
		%feature("autodoc", "	:rtype: LProp_CIType
") Last;
		const LProp_CIType & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: LProp_SequenceOfCIType &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,LProp_SequenceOfCIType & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: LProp_CIType
") Value;
		const LProp_CIType & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: LProp_CIType &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const LProp_CIType & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: LProp_CIType
") ChangeValue;
		LProp_CIType & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") LProp_SequenceOfCIType::~LProp_SequenceOfCIType %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend LProp_SequenceOfCIType {
	void _kill_pointed() {
		delete $self;
	}
};
