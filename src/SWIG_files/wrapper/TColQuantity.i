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
%module (package="OCC") TColQuantity

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

%include TColQuantity_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor TColQuantity_Array1OfLength;
class TColQuantity_Array1OfLength {
	public:
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") TColQuantity_Array1OfLength;
		 TColQuantity_Array1OfLength (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Item:
	:type Item: Quantity_Length &
	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") TColQuantity_Array1OfLength;
		 TColQuantity_Array1OfLength (const Quantity_Length & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param V:
	:type V: Quantity_Length &
	:rtype: None
") Init;
		void Init (const Quantity_Length & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "	:param Other:
	:type Other: TColQuantity_Array1OfLength &
	:rtype: TColQuantity_Array1OfLength
") Assign;
		const TColQuantity_Array1OfLength & Assign (const TColQuantity_Array1OfLength & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TColQuantity_Array1OfLength &
	:rtype: TColQuantity_Array1OfLength
") operator=;
		const TColQuantity_Array1OfLength & operator = (const TColQuantity_Array1OfLength & Other);
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
	:type Value: Quantity_Length &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Quantity_Length & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Quantity_Length
") Value;
		const Quantity_Length & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Quantity_Length
") ChangeValue;
		Quantity_Length & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") TColQuantity_Array1OfLength::~TColQuantity_Array1OfLength %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColQuantity_Array1OfLength {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColQuantity_Array2OfLength;
class TColQuantity_Array2OfLength {
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
") TColQuantity_Array2OfLength;
		 TColQuantity_Array2OfLength (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "	:param Item:
	:type Item: Quantity_Length &
	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:rtype: None
") TColQuantity_Array2OfLength;
		 TColQuantity_Array2OfLength (const Quantity_Length & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "	:param V:
	:type V: Quantity_Length &
	:rtype: None
") Init;
		void Init (const Quantity_Length & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:param Other:
	:type Other: TColQuantity_Array2OfLength &
	:rtype: TColQuantity_Array2OfLength
") Assign;
		const TColQuantity_Array2OfLength & Assign (const TColQuantity_Array2OfLength & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TColQuantity_Array2OfLength &
	:rtype: TColQuantity_Array2OfLength
") operator=;
		const TColQuantity_Array2OfLength & operator = (const TColQuantity_Array2OfLength & Other);
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
	:type Value: Quantity_Length &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Quantity_Length & Value);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: Quantity_Length
") Value;
		const Quantity_Length & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: Quantity_Length
") ChangeValue;
		Quantity_Length & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%feature("shadow") TColQuantity_Array2OfLength::~TColQuantity_Array2OfLength %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColQuantity_Array2OfLength {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColQuantity_HArray1OfLength;
class TColQuantity_HArray1OfLength : public MMgt_TShared {
	public:
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") TColQuantity_HArray1OfLength;
		 TColQuantity_HArray1OfLength (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:param V:
	:type V: Quantity_Length &
	:rtype: None
") TColQuantity_HArray1OfLength;
		 TColQuantity_HArray1OfLength (const Standard_Integer Low,const Standard_Integer Up,const Quantity_Length & V);
		%feature("autodoc", "	:param V:
	:type V: Quantity_Length &
	:rtype: None
") Init;
		void Init (const Quantity_Length & V);
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
	:type Value: Quantity_Length &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Quantity_Length & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Quantity_Length
") Value;
		const Quantity_Length & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Quantity_Length
") ChangeValue;
		Quantity_Length & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: TColQuantity_Array1OfLength
") Array1;
		const TColQuantity_Array1OfLength & Array1 ();
		%feature("autodoc", "	:rtype: TColQuantity_Array1OfLength
") ChangeArray1;
		TColQuantity_Array1OfLength & ChangeArray1 ();
};


%feature("shadow") TColQuantity_HArray1OfLength::~TColQuantity_HArray1OfLength %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColQuantity_HArray1OfLength {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColQuantity_HArray1OfLength {
	Handle_TColQuantity_HArray1OfLength GetHandle() {
	return *(Handle_TColQuantity_HArray1OfLength*) &$self;
	}
};

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
    TColQuantity_HArray1OfLength* GetObject() {
    return (TColQuantity_HArray1OfLength*)$self->Access();
    }
};
%feature("shadow") Handle_TColQuantity_HArray1OfLength::~Handle_TColQuantity_HArray1OfLength %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColQuantity_HArray1OfLength {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColQuantity_HArray2OfLength;
class TColQuantity_HArray2OfLength : public MMgt_TShared {
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
") TColQuantity_HArray2OfLength;
		 TColQuantity_HArray2OfLength (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:param V:
	:type V: Quantity_Length &
	:rtype: None
") TColQuantity_HArray2OfLength;
		 TColQuantity_HArray2OfLength (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const Quantity_Length & V);
		%feature("autodoc", "	:param V:
	:type V: Quantity_Length &
	:rtype: None
") Init;
		void Init (const Quantity_Length & V);
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
	:type Value: Quantity_Length &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Quantity_Length & Value);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: Quantity_Length
") Value;
		const Quantity_Length & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: Quantity_Length
") ChangeValue;
		Quantity_Length & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "	:rtype: TColQuantity_Array2OfLength
") Array2;
		const TColQuantity_Array2OfLength & Array2 ();
		%feature("autodoc", "	:rtype: TColQuantity_Array2OfLength
") ChangeArray2;
		TColQuantity_Array2OfLength & ChangeArray2 ();
};


%feature("shadow") TColQuantity_HArray2OfLength::~TColQuantity_HArray2OfLength %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColQuantity_HArray2OfLength {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColQuantity_HArray2OfLength {
	Handle_TColQuantity_HArray2OfLength GetHandle() {
	return *(Handle_TColQuantity_HArray2OfLength*) &$self;
	}
};

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
    TColQuantity_HArray2OfLength* GetObject() {
    return (TColQuantity_HArray2OfLength*)$self->Access();
    }
};
%feature("shadow") Handle_TColQuantity_HArray2OfLength::~Handle_TColQuantity_HArray2OfLength %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColQuantity_HArray2OfLength {
    void _kill_pointed() {
        delete $self;
    }
};

