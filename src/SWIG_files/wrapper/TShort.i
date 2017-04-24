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
%module (package="OCC") TShort

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


%include TShort_headers.i


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
/* end public enums declaration */

%nodefaultctor TShort_Array1OfShortReal;
class TShort_Array1OfShortReal {
	public:
		%feature("compactdefaultargs") TShort_Array1OfShortReal;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TShort_Array1OfShortReal;
		 TShort_Array1OfShortReal (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TShort_Array1OfShortReal;
		%feature("autodoc", "	:param Item:
	:type Item: Standard_ShortReal &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TShort_Array1OfShortReal;
		 TShort_Array1OfShortReal (const Standard_ShortReal & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Standard_ShortReal &
	:rtype: None
") Init;
		void Init (const Standard_ShortReal & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TShort_Array1OfShortReal &
	:rtype: TShort_Array1OfShortReal
") Assign;
		const TShort_Array1OfShortReal & Assign (const TShort_Array1OfShortReal & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TShort_Array1OfShortReal &
	:rtype: TShort_Array1OfShortReal
") operator =;
		const TShort_Array1OfShortReal & operator = (const TShort_Array1OfShortReal & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Standard_ShortReal &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Standard_ShortReal & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Standard_ShortReal
") Value;
		const Standard_ShortReal & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Standard_ShortReal
") ChangeValue;
		Standard_ShortReal & ChangeValue (const Standard_Integer Index);
};


%extend TShort_Array1OfShortReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TShort_Array2OfShortReal;
class TShort_Array2OfShortReal {
	public:
		%feature("compactdefaultargs") TShort_Array2OfShortReal;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TShort_Array2OfShortReal;
		 TShort_Array2OfShortReal (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") TShort_Array2OfShortReal;
		%feature("autodoc", "	:param Item:
	:type Item: Standard_ShortReal &
	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TShort_Array2OfShortReal;
		 TShort_Array2OfShortReal (const Standard_ShortReal & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Standard_ShortReal &
	:rtype: None
") Init;
		void Init (const Standard_ShortReal & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TShort_Array2OfShortReal &
	:rtype: TShort_Array2OfShortReal
") Assign;
		const TShort_Array2OfShortReal & Assign (const TShort_Array2OfShortReal & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TShort_Array2OfShortReal &
	:rtype: TShort_Array2OfShortReal
") operator =;
		const TShort_Array2OfShortReal & operator = (const TShort_Array2OfShortReal & Other);
		%feature("compactdefaultargs") ColLength;
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("compactdefaultargs") RowLength;
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("compactdefaultargs") LowerCol;
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("compactdefaultargs") LowerRow;
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("compactdefaultargs") UpperCol;
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("compactdefaultargs") UpperRow;
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Value:
	:type Value: Standard_ShortReal &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Standard_ShortReal & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Standard_ShortReal
") Value;
		const Standard_ShortReal & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Standard_ShortReal
") ChangeValue;
		Standard_ShortReal & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%extend TShort_Array2OfShortReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TShort_HArray1OfShortReal;
class TShort_HArray1OfShortReal : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TShort_HArray1OfShortReal;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TShort_HArray1OfShortReal;
		 TShort_HArray1OfShortReal (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TShort_HArray1OfShortReal;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Standard_ShortReal &
	:rtype: None
") TShort_HArray1OfShortReal;
		 TShort_HArray1OfShortReal (const Standard_Integer Low,const Standard_Integer Up,const Standard_ShortReal & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Standard_ShortReal &
	:rtype: None
") Init;
		void Init (const Standard_ShortReal & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Standard_ShortReal &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Standard_ShortReal & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Standard_ShortReal
") Value;
		const Standard_ShortReal & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Standard_ShortReal
") ChangeValue;
		Standard_ShortReal & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: TShort_Array1OfShortReal
") Array1;
		const TShort_Array1OfShortReal & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: TShort_Array1OfShortReal
") ChangeArray1;
		TShort_Array1OfShortReal & ChangeArray1 ();
};


%extend TShort_HArray1OfShortReal {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TShort_HArray1OfShortReal(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TShort_HArray1OfShortReal::Handle_TShort_HArray1OfShortReal %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    TShort_HArray1OfShortReal* _get_reference() {
    return (TShort_HArray1OfShortReal*)$self->Access();
    }
};

%extend Handle_TShort_HArray1OfShortReal {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TShort_HArray1OfShortReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TShort_HArray2OfShortReal;
class TShort_HArray2OfShortReal : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TShort_HArray2OfShortReal;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TShort_HArray2OfShortReal;
		 TShort_HArray2OfShortReal (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") TShort_HArray2OfShortReal;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:param V:
	:type V: Standard_ShortReal &
	:rtype: None
") TShort_HArray2OfShortReal;
		 TShort_HArray2OfShortReal (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const Standard_ShortReal & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Standard_ShortReal &
	:rtype: None
") Init;
		void Init (const Standard_ShortReal & V);
		%feature("compactdefaultargs") ColLength;
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("compactdefaultargs") RowLength;
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("compactdefaultargs") LowerCol;
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("compactdefaultargs") LowerRow;
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("compactdefaultargs") UpperCol;
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("compactdefaultargs") UpperRow;
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Value:
	:type Value: Standard_ShortReal &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Standard_ShortReal & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Standard_ShortReal
") Value;
		const Standard_ShortReal & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Standard_ShortReal
") ChangeValue;
		Standard_ShortReal & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") Array2;
		%feature("autodoc", "	:rtype: TShort_Array2OfShortReal
") Array2;
		const TShort_Array2OfShortReal & Array2 ();
		%feature("compactdefaultargs") ChangeArray2;
		%feature("autodoc", "	:rtype: TShort_Array2OfShortReal
") ChangeArray2;
		TShort_Array2OfShortReal & ChangeArray2 ();
};


%extend TShort_HArray2OfShortReal {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TShort_HArray2OfShortReal(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TShort_HArray2OfShortReal::Handle_TShort_HArray2OfShortReal %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    TShort_HArray2OfShortReal* _get_reference() {
    return (TShort_HArray2OfShortReal*)$self->Access();
    }
};

%extend Handle_TShort_HArray2OfShortReal {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TShort_HArray2OfShortReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TShort_HSequenceOfShortReal;
class TShort_HSequenceOfShortReal : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TShort_HSequenceOfShortReal;
		%feature("autodoc", "	:rtype: None
") TShort_HSequenceOfShortReal;
		 TShort_HSequenceOfShortReal ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param anItem:
	:type anItem: Standard_ShortReal &
	:rtype: None
") Append;
		void Append (const Standard_ShortReal & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TShort_HSequenceOfShortReal &
	:rtype: None
") Append;
		void Append (const Handle_TShort_HSequenceOfShortReal & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: Standard_ShortReal &
	:rtype: None
") Prepend;
		void Prepend (const Standard_ShortReal & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TShort_HSequenceOfShortReal &
	:rtype: None
") Prepend;
		void Prepend (const Handle_TShort_HSequenceOfShortReal & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Standard_ShortReal &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Standard_ShortReal & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_TShort_HSequenceOfShortReal &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TShort_HSequenceOfShortReal & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Standard_ShortReal &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Standard_ShortReal & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_TShort_HSequenceOfShortReal &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TShort_HSequenceOfShortReal & aSequence);
		%feature("compactdefaultargs") Exchange;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anOtherIndex:
	:type anOtherIndex: int
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_TShort_HSequenceOfShortReal
") Split;
		Handle_TShort_HSequenceOfShortReal Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Standard_ShortReal &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Standard_ShortReal & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Standard_ShortReal
") Value;
		const Standard_ShortReal & Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Standard_ShortReal
") ChangeValue;
		Standard_ShortReal & ChangeValue (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: int
	:param toIndex:
	:type toIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "	:rtype: TShort_SequenceOfShortReal
") Sequence;
		const TShort_SequenceOfShortReal & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: TShort_SequenceOfShortReal
") ChangeSequence;
		TShort_SequenceOfShortReal & ChangeSequence ();
};


%extend TShort_HSequenceOfShortReal {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TShort_HSequenceOfShortReal(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TShort_HSequenceOfShortReal::Handle_TShort_HSequenceOfShortReal %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    TShort_HSequenceOfShortReal* _get_reference() {
    return (TShort_HSequenceOfShortReal*)$self->Access();
    }
};

%extend Handle_TShort_HSequenceOfShortReal {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TShort_HSequenceOfShortReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TShort_SequenceNodeOfSequenceOfShortReal;
class TShort_SequenceNodeOfSequenceOfShortReal : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") TShort_SequenceNodeOfSequenceOfShortReal;
		%feature("autodoc", "	:param I:
	:type I: Standard_ShortReal &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") TShort_SequenceNodeOfSequenceOfShortReal;
		 TShort_SequenceNodeOfSequenceOfShortReal (const Standard_ShortReal & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Standard_ShortReal
") Value;
		Standard_ShortReal & Value ();
};


%extend TShort_SequenceNodeOfSequenceOfShortReal {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TShort_SequenceNodeOfSequenceOfShortReal(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TShort_SequenceNodeOfSequenceOfShortReal::Handle_TShort_SequenceNodeOfSequenceOfShortReal %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    TShort_SequenceNodeOfSequenceOfShortReal* _get_reference() {
    return (TShort_SequenceNodeOfSequenceOfShortReal*)$self->Access();
    }
};

%extend Handle_TShort_SequenceNodeOfSequenceOfShortReal {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TShort_SequenceNodeOfSequenceOfShortReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TShort_SequenceOfShortReal;
class TShort_SequenceOfShortReal : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") TShort_SequenceOfShortReal;
		%feature("autodoc", "	:rtype: None
") TShort_SequenceOfShortReal;
		 TShort_SequenceOfShortReal ();
		%feature("compactdefaultargs") TShort_SequenceOfShortReal;
		%feature("autodoc", "	:param Other:
	:type Other: TShort_SequenceOfShortReal &
	:rtype: None
") TShort_SequenceOfShortReal;
		 TShort_SequenceOfShortReal (const TShort_SequenceOfShortReal & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TShort_SequenceOfShortReal &
	:rtype: TShort_SequenceOfShortReal
") Assign;
		const TShort_SequenceOfShortReal & Assign (const TShort_SequenceOfShortReal & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TShort_SequenceOfShortReal &
	:rtype: TShort_SequenceOfShortReal
") operator =;
		const TShort_SequenceOfShortReal & operator = (const TShort_SequenceOfShortReal & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Standard_ShortReal &
	:rtype: None
") Append;
		void Append (const Standard_ShortReal & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: TShort_SequenceOfShortReal &
	:rtype: None
") Append;
		void Append (TShort_SequenceOfShortReal & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Standard_ShortReal &
	:rtype: None
") Prepend;
		void Prepend (const Standard_ShortReal & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: TShort_SequenceOfShortReal &
	:rtype: None
") Prepend;
		void Prepend (TShort_SequenceOfShortReal & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Standard_ShortReal &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Standard_ShortReal & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TShort_SequenceOfShortReal &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TShort_SequenceOfShortReal & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Standard_ShortReal &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Standard_ShortReal & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TShort_SequenceOfShortReal &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TShort_SequenceOfShortReal & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Standard_ShortReal
") First;
		const Standard_ShortReal & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Standard_ShortReal
") Last;
		const Standard_ShortReal & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: TShort_SequenceOfShortReal &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,TShort_SequenceOfShortReal & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Standard_ShortReal
") Value;
		const Standard_ShortReal & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Standard_ShortReal &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Standard_ShortReal & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Standard_ShortReal
") ChangeValue;
		Standard_ShortReal & ChangeValue (const Standard_Integer Index);
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


%extend TShort_SequenceOfShortReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
