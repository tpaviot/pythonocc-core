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
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColQuantity_Array1OfLength;
		 TColQuantity_Array1OfLength (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(Quantity_Length)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColQuantity_Array1OfLength;
		 TColQuantity_Array1OfLength (const Quantity_Length & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(Quantity_Length)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Quantity_Length & V);
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
	Other(TColQuantity_Array1OfLength)

Returns:
	TColQuantity_Array1OfLength

No detailed docstring for this function.") Assign;
		const TColQuantity_Array1OfLength & Assign (const TColQuantity_Array1OfLength & Other);
		%feature("autodoc", "Args:
	Other(TColQuantity_Array1OfLength)

Returns:
	TColQuantity_Array1OfLength

No detailed docstring for this function.") operator=;
		const TColQuantity_Array1OfLength & operator = (const TColQuantity_Array1OfLength & Other);
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
	Value(Quantity_Length)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Quantity_Length & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Quantity_Length

No detailed docstring for this function.") Value;
		const Quantity_Length & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Quantity_Length

No detailed docstring for this function.") ChangeValue;
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
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColQuantity_Array2OfLength;
		 TColQuantity_Array2OfLength (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	Item(Quantity_Length)
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColQuantity_Array2OfLength;
		 TColQuantity_Array2OfLength (const Quantity_Length & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	V(Quantity_Length)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Quantity_Length & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	Other(TColQuantity_Array2OfLength)

Returns:
	TColQuantity_Array2OfLength

No detailed docstring for this function.") Assign;
		const TColQuantity_Array2OfLength & Assign (const TColQuantity_Array2OfLength & Other);
		%feature("autodoc", "Args:
	Other(TColQuantity_Array2OfLength)

Returns:
	TColQuantity_Array2OfLength

No detailed docstring for this function.") operator=;
		const TColQuantity_Array2OfLength & operator = (const TColQuantity_Array2OfLength & Other);
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
	Value(Quantity_Length)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Quantity_Length & Value);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Quantity_Length

No detailed docstring for this function.") Value;
		const Quantity_Length & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Quantity_Length

No detailed docstring for this function.") ChangeValue;
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
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColQuantity_HArray1OfLength;
		 TColQuantity_HArray1OfLength (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(Quantity_Length)

Returns:
	None

No detailed docstring for this function.") TColQuantity_HArray1OfLength;
		 TColQuantity_HArray1OfLength (const Standard_Integer Low,const Standard_Integer Up,const Quantity_Length & V);
		%feature("autodoc", "Args:
	V(Quantity_Length)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Quantity_Length & V);
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
	Value(Quantity_Length)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Quantity_Length & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Quantity_Length

No detailed docstring for this function.") Value;
		const Quantity_Length & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Quantity_Length

No detailed docstring for this function.") ChangeValue;
		Quantity_Length & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	TColQuantity_Array1OfLength

No detailed docstring for this function.") Array1;
		const TColQuantity_Array1OfLength & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	TColQuantity_Array1OfLength

No detailed docstring for this function.") ChangeArray1;
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
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColQuantity_HArray2OfLength;
		 TColQuantity_HArray2OfLength (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)
	V(Quantity_Length)

Returns:
	None

No detailed docstring for this function.") TColQuantity_HArray2OfLength;
		 TColQuantity_HArray2OfLength (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const Quantity_Length & V);
		%feature("autodoc", "Args:
	V(Quantity_Length)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Quantity_Length & V);
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
	Value(Quantity_Length)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Quantity_Length & Value);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Quantity_Length

No detailed docstring for this function.") Value;
		const Quantity_Length & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Quantity_Length

No detailed docstring for this function.") ChangeValue;
		Quantity_Length & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	None
Returns:
	TColQuantity_Array2OfLength

No detailed docstring for this function.") Array2;
		const TColQuantity_Array2OfLength & Array2 ();
		%feature("autodoc", "Args:
	None
Returns:
	TColQuantity_Array2OfLength

No detailed docstring for this function.") ChangeArray2;
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

