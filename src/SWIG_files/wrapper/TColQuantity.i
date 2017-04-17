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
%module (package="OCC") TColQuantity

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


%include TColQuantity_headers.i


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

%nodefaultctor TColQuantity_Array1OfLength;
class TColQuantity_Array1OfLength {
	public:
		%feature("compactdefaultargs") TColQuantity_Array1OfLength;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColQuantity_Array1OfLength;
		 TColQuantity_Array1OfLength (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColQuantity_Array1OfLength;
		%feature("autodoc", "	:param Item:
	:type Item: Quantity_Length &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColQuantity_Array1OfLength;
		 TColQuantity_Array1OfLength (const Quantity_Length & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Quantity_Length &
	:rtype: None
") Init;
		void Init (const Quantity_Length & V);
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
	:type Other: TColQuantity_Array1OfLength &
	:rtype: TColQuantity_Array1OfLength
") Assign;
		const TColQuantity_Array1OfLength & Assign (const TColQuantity_Array1OfLength & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColQuantity_Array1OfLength &
	:rtype: TColQuantity_Array1OfLength
") operator =;
		const TColQuantity_Array1OfLength & operator = (const TColQuantity_Array1OfLength & Other);
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
	:type Value: Quantity_Length &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Quantity_Length & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Quantity_Length
") Value;
		const Quantity_Length & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Quantity_Length
") ChangeValue;
		Quantity_Length & ChangeValue (const Standard_Integer Index);
};


%extend TColQuantity_Array1OfLength {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColQuantity_Array2OfLength;
class TColQuantity_Array2OfLength {
	public:
		%feature("compactdefaultargs") TColQuantity_Array2OfLength;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColQuantity_Array2OfLength;
		 TColQuantity_Array2OfLength (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") TColQuantity_Array2OfLength;
		%feature("autodoc", "	:param Item:
	:type Item: Quantity_Length &
	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColQuantity_Array2OfLength;
		 TColQuantity_Array2OfLength (const Quantity_Length & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Quantity_Length &
	:rtype: None
") Init;
		void Init (const Quantity_Length & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TColQuantity_Array2OfLength &
	:rtype: TColQuantity_Array2OfLength
") Assign;
		const TColQuantity_Array2OfLength & Assign (const TColQuantity_Array2OfLength & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TColQuantity_Array2OfLength &
	:rtype: TColQuantity_Array2OfLength
") operator =;
		const TColQuantity_Array2OfLength & operator = (const TColQuantity_Array2OfLength & Other);
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
	:type Value: Quantity_Length &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Quantity_Length & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Quantity_Length
") Value;
		const Quantity_Length & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Quantity_Length
") ChangeValue;
		Quantity_Length & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%extend TColQuantity_Array2OfLength {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColQuantity_HArray1OfLength;
class TColQuantity_HArray1OfLength : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColQuantity_HArray1OfLength;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TColQuantity_HArray1OfLength;
		 TColQuantity_HArray1OfLength (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TColQuantity_HArray1OfLength;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Quantity_Length &
	:rtype: None
") TColQuantity_HArray1OfLength;
		 TColQuantity_HArray1OfLength (const Standard_Integer Low,const Standard_Integer Up,const Quantity_Length & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Quantity_Length &
	:rtype: None
") Init;
		void Init (const Quantity_Length & V);
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
	:type Value: Quantity_Length &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Quantity_Length & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Quantity_Length
") Value;
		const Quantity_Length & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Quantity_Length
") ChangeValue;
		Quantity_Length & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: TColQuantity_Array1OfLength
") Array1;
		const TColQuantity_Array1OfLength & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: TColQuantity_Array1OfLength
") ChangeArray1;
		TColQuantity_Array1OfLength & ChangeArray1 ();
};


%extend TColQuantity_HArray1OfLength {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColQuantity_HArray1OfLength(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColQuantity_HArray1OfLength::Handle_TColQuantity_HArray1OfLength %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColQuantity_HArray1OfLength;
class Handle_TColQuantity_HArray1OfLength : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColQuantity_HArray1OfLength();
        Handle_TColQuantity_HArray1OfLength(const Handle_TColQuantity_HArray1OfLength &aHandle);
        Handle_TColQuantity_HArray1OfLength(const TColQuantity_HArray1OfLength *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColQuantity_HArray1OfLength DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColQuantity_HArray1OfLength {
    TColQuantity_HArray1OfLength* _get_reference() {
    return (TColQuantity_HArray1OfLength*)$self->Access();
    }
};

%extend Handle_TColQuantity_HArray1OfLength {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColQuantity_HArray1OfLength {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TColQuantity_HArray2OfLength;
class TColQuantity_HArray2OfLength : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TColQuantity_HArray2OfLength;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TColQuantity_HArray2OfLength;
		 TColQuantity_HArray2OfLength (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") TColQuantity_HArray2OfLength;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:param V:
	:type V: Quantity_Length &
	:rtype: None
") TColQuantity_HArray2OfLength;
		 TColQuantity_HArray2OfLength (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const Quantity_Length & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Quantity_Length &
	:rtype: None
") Init;
		void Init (const Quantity_Length & V);
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
	:type Value: Quantity_Length &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Quantity_Length & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Quantity_Length
") Value;
		const Quantity_Length & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Quantity_Length
") ChangeValue;
		Quantity_Length & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") Array2;
		%feature("autodoc", "	:rtype: TColQuantity_Array2OfLength
") Array2;
		const TColQuantity_Array2OfLength & Array2 ();
		%feature("compactdefaultargs") ChangeArray2;
		%feature("autodoc", "	:rtype: TColQuantity_Array2OfLength
") ChangeArray2;
		TColQuantity_Array2OfLength & ChangeArray2 ();
};


%extend TColQuantity_HArray2OfLength {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TColQuantity_HArray2OfLength(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TColQuantity_HArray2OfLength::Handle_TColQuantity_HArray2OfLength %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TColQuantity_HArray2OfLength;
class Handle_TColQuantity_HArray2OfLength : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColQuantity_HArray2OfLength();
        Handle_TColQuantity_HArray2OfLength(const Handle_TColQuantity_HArray2OfLength &aHandle);
        Handle_TColQuantity_HArray2OfLength(const TColQuantity_HArray2OfLength *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColQuantity_HArray2OfLength DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColQuantity_HArray2OfLength {
    TColQuantity_HArray2OfLength* _get_reference() {
    return (TColQuantity_HArray2OfLength*)$self->Access();
    }
};

%extend Handle_TColQuantity_HArray2OfLength {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TColQuantity_HArray2OfLength {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
