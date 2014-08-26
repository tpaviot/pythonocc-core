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
%module LProp

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/StandardDefines.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i

%include LProp_required_python_modules.i
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") LProp_AnalyticCurInf;
		 LProp_AnalyticCurInf ();
		%feature("autodoc", "Args:
	T(GeomAbs_CurveType)
	UFirst(Standard_Real)
	ULast(Standard_Real)
	Result(LProp_CurAndInf)

Returns:
	None

No detailed docstring for this function.") Perform;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") LProp_CurAndInf;
		 LProp_CurAndInf ();
		%feature("autodoc", "Args:
	Param(Standard_Real)

Returns:
	None

No detailed docstring for this function.") AddInflection;
		void AddInflection (const Standard_Real Param);
		%feature("autodoc", "Args:
	Param(Standard_Real)
	IsMin(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") AddExtCur;
		void AddExtCur (const Standard_Real Param,const Standard_Boolean IsMin);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of points.  
         The Points are stored to increasing parameter.") NbPoints;
		Standard_Integer NbPoints ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Real

Returns the parameter of the Nth point.  raises if N not in the range [1,NbPoints()]") Parameter;
		Standard_Real Parameter (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	LProp_CIType

Returns  
         - MinCur if the Nth parameter corresponds to  
         a minimum of the radius of curvature.  
         - MaxCur if the Nth parameter corresponds to  
         a maximum of the radius of curvature.  
         - Inflection if the parameter corresponds to  
         a point of inflection.  raises if N not in the range [1,NbPoints()]") Type;
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
		%feature("autodoc", "Args:
	I(LProp_CIType)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") LProp_SequenceNodeOfSequenceOfCIType;
		 LProp_SequenceNodeOfSequenceOfCIType (const LProp_CIType & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	LProp_CIType

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") LProp_SequenceOfCIType;
		 LProp_SequenceOfCIType ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(LProp_SequenceOfCIType)

Returns:
	LProp_SequenceOfCIType

No detailed docstring for this function.") Assign;
		const LProp_SequenceOfCIType & Assign (const LProp_SequenceOfCIType & Other);
		%feature("autodoc", "Args:
	Other(LProp_SequenceOfCIType)

Returns:
	LProp_SequenceOfCIType

No detailed docstring for this function.") operator=;
		const LProp_SequenceOfCIType & operator = (const LProp_SequenceOfCIType & Other);
		%feature("autodoc", "Args:
	T(LProp_CIType)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const LProp_CIType & T);
		%feature("autodoc", "Args:
	S(LProp_SequenceOfCIType)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (LProp_SequenceOfCIType & S);
		%feature("autodoc", "Args:
	T(LProp_CIType)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const LProp_CIType & T);
		%feature("autodoc", "Args:
	S(LProp_SequenceOfCIType)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (LProp_SequenceOfCIType & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(LProp_CIType)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const LProp_CIType & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(LProp_SequenceOfCIType)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,LProp_SequenceOfCIType & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(LProp_CIType)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const LProp_CIType & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(LProp_SequenceOfCIType)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,LProp_SequenceOfCIType & S);
		%feature("autodoc", "Args:
	None
Returns:
	LProp_CIType

No detailed docstring for this function.") First;
		const LProp_CIType & First ();
		%feature("autodoc", "Args:
	None
Returns:
	LProp_CIType

No detailed docstring for this function.") Last;
		const LProp_CIType & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(LProp_SequenceOfCIType)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,LProp_SequenceOfCIType & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	LProp_CIType

No detailed docstring for this function.") Value;
		const LProp_CIType & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(LProp_CIType)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const LProp_CIType & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	LProp_CIType

No detailed docstring for this function.") ChangeValue;
		LProp_CIType & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
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
