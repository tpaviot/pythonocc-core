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
%module (package="OCC") TShort

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

%include TShort_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor TShort_Array1OfShortReal;
class TShort_Array1OfShortReal {
	public:
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") TShort_Array1OfShortReal;
		 TShort_Array1OfShortReal (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Item:
	:type Item: Standard_ShortReal &
	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") TShort_Array1OfShortReal;
		 TShort_Array1OfShortReal (const Standard_ShortReal & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param V:
	:type V: Standard_ShortReal &
	:rtype: None
") Init;
		void Init (const Standard_ShortReal & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "	:param Other:
	:type Other: TShort_Array1OfShortReal &
	:rtype: TShort_Array1OfShortReal
") Assign;
		const TShort_Array1OfShortReal & Assign (const TShort_Array1OfShortReal & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TShort_Array1OfShortReal &
	:rtype: TShort_Array1OfShortReal
") operator=;
		const TShort_Array1OfShortReal & operator = (const TShort_Array1OfShortReal & Other);
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Value:
	:type Value: Standard_ShortReal &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Standard_ShortReal & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Standard_ShortReal
") Value;
		const Standard_ShortReal & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Standard_ShortReal
") ChangeValue;
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
		%feature("autodoc", "	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:rtype: None
") TShort_Array2OfShortReal;
		 TShort_Array2OfShortReal (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "	:param Item:
	:type Item: Standard_ShortReal &
	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:rtype: None
") TShort_Array2OfShortReal;
		 TShort_Array2OfShortReal (const Standard_ShortReal & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "	:param V:
	:type V: Standard_ShortReal &
	:rtype: None
") Init;
		void Init (const Standard_ShortReal & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:param Other:
	:type Other: TShort_Array2OfShortReal &
	:rtype: TShort_Array2OfShortReal
") Assign;
		const TShort_Array2OfShortReal & Assign (const TShort_Array2OfShortReal & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TShort_Array2OfShortReal &
	:rtype: TShort_Array2OfShortReal
") operator=;
		const TShort_Array2OfShortReal & operator = (const TShort_Array2OfShortReal & Other);
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:param Value:
	:type Value: Standard_ShortReal &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Standard_ShortReal & Value);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: Standard_ShortReal
") Value;
		const Standard_ShortReal & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: Standard_ShortReal
") ChangeValue;
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
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") TShort_HArray1OfShortReal;
		 TShort_HArray1OfShortReal (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:param V:
	:type V: Standard_ShortReal &
	:rtype: None
") TShort_HArray1OfShortReal;
		 TShort_HArray1OfShortReal (const Standard_Integer Low,const Standard_Integer Up,const Standard_ShortReal & V);
		%feature("autodoc", "	:param V:
	:type V: Standard_ShortReal &
	:rtype: None
") Init;
		void Init (const Standard_ShortReal & V);
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Value:
	:type Value: Standard_ShortReal &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Standard_ShortReal & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Standard_ShortReal
") Value;
		const Standard_ShortReal & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Standard_ShortReal
") ChangeValue;
		Standard_ShortReal & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: TShort_Array1OfShortReal
") Array1;
		const TShort_Array1OfShortReal & Array1 ();
		%feature("autodoc", "	:rtype: TShort_Array1OfShortReal
") ChangeArray1;
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
		%feature("autodoc", "	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:rtype: None
") TShort_HArray2OfShortReal;
		 TShort_HArray2OfShortReal (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:param V:
	:type V: Standard_ShortReal &
	:rtype: None
") TShort_HArray2OfShortReal;
		 TShort_HArray2OfShortReal (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const Standard_ShortReal & V);
		%feature("autodoc", "	:param V:
	:type V: Standard_ShortReal &
	:rtype: None
") Init;
		void Init (const Standard_ShortReal & V);
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:param Value:
	:type Value: Standard_ShortReal &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Standard_ShortReal & Value);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: Standard_ShortReal
") Value;
		const Standard_ShortReal & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: Standard_ShortReal
") ChangeValue;
		Standard_ShortReal & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "	:rtype: TShort_Array2OfShortReal
") Array2;
		const TShort_Array2OfShortReal & Array2 ();
		%feature("autodoc", "	:rtype: TShort_Array2OfShortReal
") ChangeArray2;
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
		%feature("autodoc", "	:rtype: None
") TShort_HSequenceOfShortReal;
		 TShort_HSequenceOfShortReal ();
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param anItem:
	:type anItem: Standard_ShortReal &
	:rtype: None
") Append;
		void Append (const Standard_ShortReal & anItem);
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TShort_HSequenceOfShortReal &
	:rtype: None
") Append;
		void Append (const Handle_TShort_HSequenceOfShortReal & aSequence);
		%feature("autodoc", "	:param anItem:
	:type anItem: Standard_ShortReal &
	:rtype: None
") Prepend;
		void Prepend (const Standard_ShortReal & anItem);
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TShort_HSequenceOfShortReal &
	:rtype: None
") Prepend;
		void Prepend (const Handle_TShort_HSequenceOfShortReal & aSequence);
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Standard_ShortReal &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Standard_ShortReal & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param aSequence:
	:type aSequence: Handle_TShort_HSequenceOfShortReal &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TShort_HSequenceOfShortReal & aSequence);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Standard_ShortReal &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Standard_ShortReal & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param aSequence:
	:type aSequence: Handle_TShort_HSequenceOfShortReal &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TShort_HSequenceOfShortReal & aSequence);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anOtherIndex:
	:type anOtherIndex: Standard_Integer
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_TShort_HSequenceOfShortReal
") Split;
		Handle_TShort_HSequenceOfShortReal Split (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Standard_ShortReal &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Standard_ShortReal & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Standard_ShortReal
") Value;
		const Standard_ShortReal & Value (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Standard_ShortReal
") ChangeValue;
		Standard_ShortReal & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: Standard_Integer
	:param toIndex:
	:type toIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "	:rtype: TShort_SequenceOfShortReal
") Sequence;
		const TShort_SequenceOfShortReal & Sequence ();
		%feature("autodoc", "	:rtype: TShort_SequenceOfShortReal
") ChangeSequence;
		TShort_SequenceOfShortReal & ChangeSequence ();
		%feature("autodoc", "	:rtype: Handle_TShort_HSequenceOfShortReal
") ShallowCopy;
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
		%feature("autodoc", "	:param I:
	:type I: Standard_ShortReal &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") TShort_SequenceNodeOfSequenceOfShortReal;
		 TShort_SequenceNodeOfSequenceOfShortReal (const Standard_ShortReal & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Standard_ShortReal
") Value;
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
		%feature("autodoc", "	:rtype: None
") TShort_SequenceOfShortReal;
		 TShort_SequenceOfShortReal ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: TShort_SequenceOfShortReal &
	:rtype: TShort_SequenceOfShortReal
") Assign;
		const TShort_SequenceOfShortReal & Assign (const TShort_SequenceOfShortReal & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TShort_SequenceOfShortReal &
	:rtype: TShort_SequenceOfShortReal
") operator=;
		const TShort_SequenceOfShortReal & operator = (const TShort_SequenceOfShortReal & Other);
		%feature("autodoc", "	:param T:
	:type T: Standard_ShortReal &
	:rtype: None
") Append;
		void Append (const Standard_ShortReal & T);
		%feature("autodoc", "	:param S:
	:type S: TShort_SequenceOfShortReal &
	:rtype: None
") Append;
		void Append (TShort_SequenceOfShortReal & S);
		%feature("autodoc", "	:param T:
	:type T: Standard_ShortReal &
	:rtype: None
") Prepend;
		void Prepend (const Standard_ShortReal & T);
		%feature("autodoc", "	:param S:
	:type S: TShort_SequenceOfShortReal &
	:rtype: None
") Prepend;
		void Prepend (TShort_SequenceOfShortReal & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Standard_ShortReal &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Standard_ShortReal & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: TShort_SequenceOfShortReal &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TShort_SequenceOfShortReal & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Standard_ShortReal &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Standard_ShortReal & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: TShort_SequenceOfShortReal &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TShort_SequenceOfShortReal & S);
		%feature("autodoc", "	:rtype: Standard_ShortReal
") First;
		const Standard_ShortReal & First ();
		%feature("autodoc", "	:rtype: Standard_ShortReal
") Last;
		const Standard_ShortReal & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: TShort_SequenceOfShortReal &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,TShort_SequenceOfShortReal & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Standard_ShortReal
") Value;
		const Standard_ShortReal & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Standard_ShortReal &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Standard_ShortReal & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Standard_ShortReal
") ChangeValue;
		Standard_ShortReal & ChangeValue (const Standard_Integer Index);
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
