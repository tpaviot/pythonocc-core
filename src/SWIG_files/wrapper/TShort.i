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
%module TShort

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

%include TShort_required_python_modules.i
%include TShort_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor TShort_Array1OfShortReal;
class TShort_Array1OfShortReal {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TShort_Array1OfShortReal;
		 TShort_Array1OfShortReal (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(Standard_ShortReal)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TShort_Array1OfShortReal;
		 TShort_Array1OfShortReal (const Standard_ShortReal & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(Standard_ShortReal)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Standard_ShortReal & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	Other(TShort_Array1OfShortReal)

Returns:
	TShort_Array1OfShortReal

No detailed docstring for this function.") Assign;
		const TShort_Array1OfShortReal & Assign (const TShort_Array1OfShortReal & Other);
		%feature("autodoc", "Args:
	Other(TShort_Array1OfShortReal)

Returns:
	TShort_Array1OfShortReal

No detailed docstring for this function.") operator=;
		const TShort_Array1OfShortReal & operator = (const TShort_Array1OfShortReal & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Standard_ShortReal)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Standard_ShortReal & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_ShortReal

No detailed docstring for this function.") Value;
		const Standard_ShortReal & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_ShortReal

No detailed docstring for this function.") ChangeValue;
		Standard_ShortReal & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") TShort_Array1OfShortReal::~TShort_Array1OfShortReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TShort_Array1OfShortReal {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TShort_Array2OfShortReal;
class TShort_Array2OfShortReal {
	public:
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TShort_Array2OfShortReal;
		 TShort_Array2OfShortReal (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	Item(Standard_ShortReal)
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TShort_Array2OfShortReal;
		 TShort_Array2OfShortReal (const Standard_ShortReal & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	V(Standard_ShortReal)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Standard_ShortReal & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	Other(TShort_Array2OfShortReal)

Returns:
	TShort_Array2OfShortReal

No detailed docstring for this function.") Assign;
		const TShort_Array2OfShortReal & Assign (const TShort_Array2OfShortReal & Other);
		%feature("autodoc", "Args:
	Other(TShort_Array2OfShortReal)

Returns:
	TShort_Array2OfShortReal

No detailed docstring for this function.") operator=;
		const TShort_Array2OfShortReal & operator = (const TShort_Array2OfShortReal & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") ColLength;
		Standard_Integer ColLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") RowLength;
		Standard_Integer RowLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)
	Value(Standard_ShortReal)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Standard_ShortReal & Value);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Standard_ShortReal

No detailed docstring for this function.") Value;
		const Standard_ShortReal & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Standard_ShortReal

No detailed docstring for this function.") ChangeValue;
		Standard_ShortReal & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%feature("shadow") TShort_Array2OfShortReal::~TShort_Array2OfShortReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TShort_Array2OfShortReal {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TShort_HArray1OfShortReal;
class TShort_HArray1OfShortReal : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TShort_HArray1OfShortReal;
		 TShort_HArray1OfShortReal (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(Standard_ShortReal)

Returns:
	None

No detailed docstring for this function.") TShort_HArray1OfShortReal;
		 TShort_HArray1OfShortReal (const Standard_Integer Low,const Standard_Integer Up,const Standard_ShortReal & V);
		%feature("autodoc", "Args:
	V(Standard_ShortReal)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Standard_ShortReal & V);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Standard_ShortReal)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Standard_ShortReal & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_ShortReal

No detailed docstring for this function.") Value;
		const Standard_ShortReal & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_ShortReal

No detailed docstring for this function.") ChangeValue;
		Standard_ShortReal & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	TShort_Array1OfShortReal

No detailed docstring for this function.") Array1;
		const TShort_Array1OfShortReal & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	TShort_Array1OfShortReal

No detailed docstring for this function.") ChangeArray1;
		TShort_Array1OfShortReal & ChangeArray1 ();
};


%feature("shadow") TShort_HArray1OfShortReal::~TShort_HArray1OfShortReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TShort_HArray1OfShortReal {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TShort_HArray1OfShortReal {
	Handle_TShort_HArray1OfShortReal GetHandle() {
	return *(Handle_TShort_HArray1OfShortReal*) &$self;
	}
};

%nodefaultctor Handle_TShort_HArray1OfShortReal;
class Handle_TShort_HArray1OfShortReal : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TShort_HArray1OfShortReal();
        Handle_TShort_HArray1OfShortReal(const Handle_TShort_HArray1OfShortReal &aHandle);
        Handle_TShort_HArray1OfShortReal(const TShort_HArray1OfShortReal *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TShort_HArray1OfShortReal DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TShort_HArray1OfShortReal {
    TShort_HArray1OfShortReal* GetObject() {
    return (TShort_HArray1OfShortReal*)$self->Access();
    }
};
%feature("shadow") Handle_TShort_HArray1OfShortReal::~Handle_TShort_HArray1OfShortReal %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TShort_HArray1OfShortReal {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TShort_HArray2OfShortReal;
class TShort_HArray2OfShortReal : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TShort_HArray2OfShortReal;
		 TShort_HArray2OfShortReal (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)
	V(Standard_ShortReal)

Returns:
	None

No detailed docstring for this function.") TShort_HArray2OfShortReal;
		 TShort_HArray2OfShortReal (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const Standard_ShortReal & V);
		%feature("autodoc", "Args:
	V(Standard_ShortReal)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Standard_ShortReal & V);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") ColLength;
		Standard_Integer ColLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") RowLength;
		Standard_Integer RowLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)
	Value(Standard_ShortReal)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Standard_ShortReal & Value);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Standard_ShortReal

No detailed docstring for this function.") Value;
		const Standard_ShortReal & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Standard_ShortReal

No detailed docstring for this function.") ChangeValue;
		Standard_ShortReal & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	None
Returns:
	TShort_Array2OfShortReal

No detailed docstring for this function.") Array2;
		const TShort_Array2OfShortReal & Array2 ();
		%feature("autodoc", "Args:
	None
Returns:
	TShort_Array2OfShortReal

No detailed docstring for this function.") ChangeArray2;
		TShort_Array2OfShortReal & ChangeArray2 ();
};


%feature("shadow") TShort_HArray2OfShortReal::~TShort_HArray2OfShortReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TShort_HArray2OfShortReal {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TShort_HArray2OfShortReal {
	Handle_TShort_HArray2OfShortReal GetHandle() {
	return *(Handle_TShort_HArray2OfShortReal*) &$self;
	}
};

%nodefaultctor Handle_TShort_HArray2OfShortReal;
class Handle_TShort_HArray2OfShortReal : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TShort_HArray2OfShortReal();
        Handle_TShort_HArray2OfShortReal(const Handle_TShort_HArray2OfShortReal &aHandle);
        Handle_TShort_HArray2OfShortReal(const TShort_HArray2OfShortReal *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TShort_HArray2OfShortReal DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TShort_HArray2OfShortReal {
    TShort_HArray2OfShortReal* GetObject() {
    return (TShort_HArray2OfShortReal*)$self->Access();
    }
};
%feature("shadow") Handle_TShort_HArray2OfShortReal::~Handle_TShort_HArray2OfShortReal %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TShort_HArray2OfShortReal {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TShort_HSequenceOfShortReal;
class TShort_HSequenceOfShortReal : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TShort_HSequenceOfShortReal;
		 TShort_HSequenceOfShortReal ();
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

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	anItem(Standard_ShortReal)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Standard_ShortReal & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_TShort_HSequenceOfShortReal)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_TShort_HSequenceOfShortReal & aSequence);
		%feature("autodoc", "Args:
	anItem(Standard_ShortReal)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Standard_ShortReal & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_TShort_HSequenceOfShortReal)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_TShort_HSequenceOfShortReal & aSequence);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Standard_ShortReal)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Standard_ShortReal & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_TShort_HSequenceOfShortReal)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TShort_HSequenceOfShortReal & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Standard_ShortReal)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Standard_ShortReal & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_TShort_HSequenceOfShortReal)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TShort_HSequenceOfShortReal & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anOtherIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_TShort_HSequenceOfShortReal

No detailed docstring for this function.") Split;
		Handle_TShort_HSequenceOfShortReal Split (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Standard_ShortReal)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer anIndex,const Standard_ShortReal & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Standard_ShortReal

No detailed docstring for this function.") Value;
		const Standard_ShortReal & Value (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Standard_ShortReal

No detailed docstring for this function.") ChangeValue;
		Standard_ShortReal & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	fromIndex(Standard_Integer)
	toIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "Args:
	None
Returns:
	TShort_SequenceOfShortReal

No detailed docstring for this function.") Sequence;
		const TShort_SequenceOfShortReal & Sequence ();
		%feature("autodoc", "Args:
	None
Returns:
	TShort_SequenceOfShortReal

No detailed docstring for this function.") ChangeSequence;
		TShort_SequenceOfShortReal & ChangeSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TShort_HSequenceOfShortReal

No detailed docstring for this function.") ShallowCopy;
		Handle_TShort_HSequenceOfShortReal ShallowCopy ();
};


%feature("shadow") TShort_HSequenceOfShortReal::~TShort_HSequenceOfShortReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TShort_HSequenceOfShortReal {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TShort_HSequenceOfShortReal {
	Handle_TShort_HSequenceOfShortReal GetHandle() {
	return *(Handle_TShort_HSequenceOfShortReal*) &$self;
	}
};

%nodefaultctor Handle_TShort_HSequenceOfShortReal;
class Handle_TShort_HSequenceOfShortReal : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TShort_HSequenceOfShortReal();
        Handle_TShort_HSequenceOfShortReal(const Handle_TShort_HSequenceOfShortReal &aHandle);
        Handle_TShort_HSequenceOfShortReal(const TShort_HSequenceOfShortReal *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TShort_HSequenceOfShortReal DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TShort_HSequenceOfShortReal {
    TShort_HSequenceOfShortReal* GetObject() {
    return (TShort_HSequenceOfShortReal*)$self->Access();
    }
};
%feature("shadow") Handle_TShort_HSequenceOfShortReal::~Handle_TShort_HSequenceOfShortReal %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TShort_HSequenceOfShortReal {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TShort_SequenceNodeOfSequenceOfShortReal;
class TShort_SequenceNodeOfSequenceOfShortReal : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Standard_ShortReal)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") TShort_SequenceNodeOfSequenceOfShortReal;
		 TShort_SequenceNodeOfSequenceOfShortReal (const Standard_ShortReal & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_ShortReal

No detailed docstring for this function.") Value;
		Standard_ShortReal & Value ();
};


%feature("shadow") TShort_SequenceNodeOfSequenceOfShortReal::~TShort_SequenceNodeOfSequenceOfShortReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TShort_SequenceNodeOfSequenceOfShortReal {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TShort_SequenceNodeOfSequenceOfShortReal {
	Handle_TShort_SequenceNodeOfSequenceOfShortReal GetHandle() {
	return *(Handle_TShort_SequenceNodeOfSequenceOfShortReal*) &$self;
	}
};

%nodefaultctor Handle_TShort_SequenceNodeOfSequenceOfShortReal;
class Handle_TShort_SequenceNodeOfSequenceOfShortReal : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_TShort_SequenceNodeOfSequenceOfShortReal();
        Handle_TShort_SequenceNodeOfSequenceOfShortReal(const Handle_TShort_SequenceNodeOfSequenceOfShortReal &aHandle);
        Handle_TShort_SequenceNodeOfSequenceOfShortReal(const TShort_SequenceNodeOfSequenceOfShortReal *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TShort_SequenceNodeOfSequenceOfShortReal DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TShort_SequenceNodeOfSequenceOfShortReal {
    TShort_SequenceNodeOfSequenceOfShortReal* GetObject() {
    return (TShort_SequenceNodeOfSequenceOfShortReal*)$self->Access();
    }
};
%feature("shadow") Handle_TShort_SequenceNodeOfSequenceOfShortReal::~Handle_TShort_SequenceNodeOfSequenceOfShortReal %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TShort_SequenceNodeOfSequenceOfShortReal {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TShort_SequenceOfShortReal;
class TShort_SequenceOfShortReal : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TShort_SequenceOfShortReal;
		 TShort_SequenceOfShortReal ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(TShort_SequenceOfShortReal)

Returns:
	TShort_SequenceOfShortReal

No detailed docstring for this function.") Assign;
		const TShort_SequenceOfShortReal & Assign (const TShort_SequenceOfShortReal & Other);
		%feature("autodoc", "Args:
	Other(TShort_SequenceOfShortReal)

Returns:
	TShort_SequenceOfShortReal

No detailed docstring for this function.") operator=;
		const TShort_SequenceOfShortReal & operator = (const TShort_SequenceOfShortReal & Other);
		%feature("autodoc", "Args:
	T(Standard_ShortReal)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Standard_ShortReal & T);
		%feature("autodoc", "Args:
	S(TShort_SequenceOfShortReal)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (TShort_SequenceOfShortReal & S);
		%feature("autodoc", "Args:
	T(Standard_ShortReal)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Standard_ShortReal & T);
		%feature("autodoc", "Args:
	S(TShort_SequenceOfShortReal)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (TShort_SequenceOfShortReal & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Standard_ShortReal)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Standard_ShortReal & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(TShort_SequenceOfShortReal)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TShort_SequenceOfShortReal & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Standard_ShortReal)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Standard_ShortReal & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(TShort_SequenceOfShortReal)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TShort_SequenceOfShortReal & S);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_ShortReal

No detailed docstring for this function.") First;
		const Standard_ShortReal & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_ShortReal

No detailed docstring for this function.") Last;
		const Standard_ShortReal & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(TShort_SequenceOfShortReal)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,TShort_SequenceOfShortReal & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_ShortReal

No detailed docstring for this function.") Value;
		const Standard_ShortReal & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Standard_ShortReal)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Standard_ShortReal & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_ShortReal

No detailed docstring for this function.") ChangeValue;
		Standard_ShortReal & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") TShort_SequenceOfShortReal::~TShort_SequenceOfShortReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TShort_SequenceOfShortReal {
	void _kill_pointed() {
		delete $self;
	}
};
