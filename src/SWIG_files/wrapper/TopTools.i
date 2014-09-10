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
%module (package="OCC") TopTools

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

%include TopTools_headers.i

/* typedefs */
typedef TopTools_LocationSet * TopTools_LocationSetPtr;
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(toptools) TopTools;
%nodefaultctor TopTools;
class TopTools {
	public:
		%feature("autodoc", "Args:
	Sh(TopoDS_Shape)
	S(Standard_OStream)

Returns:
	static void

A set of Shapes. Can be dump, wrote or read.  Dumps the topological structure  of <Sh>  on the  
         stream <S>.") Dump;
		static void Dump (const TopoDS_Shape & Sh,Standard_OStream & S);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	static void

This is to bypass an extraction bug. It will force  
         the  inclusion    of  Standard_Integer.hxx  itself  
         including Standard_OStream.hxx  at   the   correct  
         position.") Dummy;
		static void Dummy (const Standard_Integer I);
};


%feature("shadow") TopTools::~TopTools %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopTools_Array1OfListOfShape;
class TopTools_Array1OfListOfShape {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TopTools_Array1OfListOfShape;
		 TopTools_Array1OfListOfShape (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(TopTools_ListOfShape)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TopTools_Array1OfListOfShape;
		 TopTools_Array1OfListOfShape (const TopTools_ListOfShape & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(TopTools_ListOfShape)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopTools_ListOfShape & V);
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
	Other(TopTools_Array1OfListOfShape)

Returns:
	TopTools_Array1OfListOfShape

No detailed docstring for this function.") Assign;
		const TopTools_Array1OfListOfShape & Assign (const TopTools_Array1OfListOfShape & Other);
		%feature("autodoc", "Args:
	Other(TopTools_Array1OfListOfShape)

Returns:
	TopTools_Array1OfListOfShape

No detailed docstring for this function.") operator=;
		const TopTools_Array1OfListOfShape & operator = (const TopTools_Array1OfListOfShape & Other);
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
	Value(TopTools_ListOfShape)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const TopTools_ListOfShape & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") Value;
		const TopTools_ListOfShape & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") ChangeValue;
		TopTools_ListOfShape & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") TopTools_Array1OfListOfShape::~TopTools_Array1OfListOfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_Array1OfListOfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopTools_Array1OfShape;
class TopTools_Array1OfShape {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TopTools_Array1OfShape;
		 TopTools_Array1OfShape (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(TopoDS_Shape)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TopTools_Array1OfShape;
		 TopTools_Array1OfShape (const TopoDS_Shape & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopoDS_Shape & V);
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
	Other(TopTools_Array1OfShape)

Returns:
	TopTools_Array1OfShape

No detailed docstring for this function.") Assign;
		const TopTools_Array1OfShape & Assign (const TopTools_Array1OfShape & Other);
		%feature("autodoc", "Args:
	Other(TopTools_Array1OfShape)

Returns:
	TopTools_Array1OfShape

No detailed docstring for this function.") operator=;
		const TopTools_Array1OfShape & operator = (const TopTools_Array1OfShape & Other);
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
	Value(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const TopoDS_Shape & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") Value;
		const TopoDS_Shape & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") ChangeValue;
		TopoDS_Shape & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") TopTools_Array1OfShape::~TopTools_Array1OfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_Array1OfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopTools_Array2OfShape;
class TopTools_Array2OfShape {
	public:
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TopTools_Array2OfShape;
		 TopTools_Array2OfShape (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	Item(TopoDS_Shape)
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TopTools_Array2OfShape;
		 TopTools_Array2OfShape (const TopoDS_Shape & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	V(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopoDS_Shape & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	Other(TopTools_Array2OfShape)

Returns:
	TopTools_Array2OfShape

No detailed docstring for this function.") Assign;
		const TopTools_Array2OfShape & Assign (const TopTools_Array2OfShape & Other);
		%feature("autodoc", "Args:
	Other(TopTools_Array2OfShape)

Returns:
	TopTools_Array2OfShape

No detailed docstring for this function.") operator=;
		const TopTools_Array2OfShape & operator = (const TopTools_Array2OfShape & Other);
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
	Value(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const TopoDS_Shape & Value);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") Value;
		const TopoDS_Shape & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") ChangeValue;
		TopoDS_Shape & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%feature("shadow") TopTools_Array2OfShape::~TopTools_Array2OfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_Array2OfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopTools_DataMapIteratorOfDataMapOfIntegerListOfShape;
class TopTools_DataMapIteratorOfDataMapOfIntegerListOfShape : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopTools_DataMapIteratorOfDataMapOfIntegerListOfShape;
		 TopTools_DataMapIteratorOfDataMapOfIntegerListOfShape ();
		%feature("autodoc", "Args:
	aMap(TopTools_DataMapOfIntegerListOfShape)

Returns:
	None

No detailed docstring for this function.") TopTools_DataMapIteratorOfDataMapOfIntegerListOfShape;
		 TopTools_DataMapIteratorOfDataMapOfIntegerListOfShape (const TopTools_DataMapOfIntegerListOfShape & aMap);
		%feature("autodoc", "Args:
	aMap(TopTools_DataMapOfIntegerListOfShape)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopTools_DataMapOfIntegerListOfShape & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Key;
		const Standard_Integer & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") Value;
		const TopTools_ListOfShape & Value ();
};


%feature("shadow") TopTools_DataMapIteratorOfDataMapOfIntegerListOfShape::~TopTools_DataMapIteratorOfDataMapOfIntegerListOfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_DataMapIteratorOfDataMapOfIntegerListOfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopTools_DataMapIteratorOfDataMapOfIntegerShape;
class TopTools_DataMapIteratorOfDataMapOfIntegerShape : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopTools_DataMapIteratorOfDataMapOfIntegerShape;
		 TopTools_DataMapIteratorOfDataMapOfIntegerShape ();
		%feature("autodoc", "Args:
	aMap(TopTools_DataMapOfIntegerShape)

Returns:
	None

No detailed docstring for this function.") TopTools_DataMapIteratorOfDataMapOfIntegerShape;
		 TopTools_DataMapIteratorOfDataMapOfIntegerShape (const TopTools_DataMapOfIntegerShape & aMap);
		%feature("autodoc", "Args:
	aMap(TopTools_DataMapOfIntegerShape)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopTools_DataMapOfIntegerShape & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Key;
		const Standard_Integer & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Value;
		const TopoDS_Shape & Value ();
};


%feature("shadow") TopTools_DataMapIteratorOfDataMapOfIntegerShape::~TopTools_DataMapIteratorOfDataMapOfIntegerShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_DataMapIteratorOfDataMapOfIntegerShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopTools_DataMapIteratorOfDataMapOfOrientedShapeInteger;
class TopTools_DataMapIteratorOfDataMapOfOrientedShapeInteger : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopTools_DataMapIteratorOfDataMapOfOrientedShapeInteger;
		 TopTools_DataMapIteratorOfDataMapOfOrientedShapeInteger ();
		%feature("autodoc", "Args:
	aMap(TopTools_DataMapOfOrientedShapeInteger)

Returns:
	None

No detailed docstring for this function.") TopTools_DataMapIteratorOfDataMapOfOrientedShapeInteger;
		 TopTools_DataMapIteratorOfDataMapOfOrientedShapeInteger (const TopTools_DataMapOfOrientedShapeInteger & aMap);
		%feature("autodoc", "Args:
	aMap(TopTools_DataMapOfOrientedShapeInteger)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopTools_DataMapOfOrientedShapeInteger & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		const TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Value;
		const Standard_Integer & Value ();
};


%feature("shadow") TopTools_DataMapIteratorOfDataMapOfOrientedShapeInteger::~TopTools_DataMapIteratorOfDataMapOfOrientedShapeInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_DataMapIteratorOfDataMapOfOrientedShapeInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopTools_DataMapIteratorOfDataMapOfOrientedShapeShape;
class TopTools_DataMapIteratorOfDataMapOfOrientedShapeShape : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopTools_DataMapIteratorOfDataMapOfOrientedShapeShape;
		 TopTools_DataMapIteratorOfDataMapOfOrientedShapeShape ();
		%feature("autodoc", "Args:
	aMap(TopTools_DataMapOfOrientedShapeShape)

Returns:
	None

No detailed docstring for this function.") TopTools_DataMapIteratorOfDataMapOfOrientedShapeShape;
		 TopTools_DataMapIteratorOfDataMapOfOrientedShapeShape (const TopTools_DataMapOfOrientedShapeShape & aMap);
		%feature("autodoc", "Args:
	aMap(TopTools_DataMapOfOrientedShapeShape)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopTools_DataMapOfOrientedShapeShape & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		const TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Value;
		const TopoDS_Shape & Value ();
};


%feature("shadow") TopTools_DataMapIteratorOfDataMapOfOrientedShapeShape::~TopTools_DataMapIteratorOfDataMapOfOrientedShapeShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_DataMapIteratorOfDataMapOfOrientedShapeShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopTools_DataMapIteratorOfDataMapOfShapeInteger;
class TopTools_DataMapIteratorOfDataMapOfShapeInteger : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopTools_DataMapIteratorOfDataMapOfShapeInteger;
		 TopTools_DataMapIteratorOfDataMapOfShapeInteger ();
		%feature("autodoc", "Args:
	aMap(TopTools_DataMapOfShapeInteger)

Returns:
	None

No detailed docstring for this function.") TopTools_DataMapIteratorOfDataMapOfShapeInteger;
		 TopTools_DataMapIteratorOfDataMapOfShapeInteger (const TopTools_DataMapOfShapeInteger & aMap);
		%feature("autodoc", "Args:
	aMap(TopTools_DataMapOfShapeInteger)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopTools_DataMapOfShapeInteger & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		const TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Value;
		const Standard_Integer & Value ();
};


%feature("shadow") TopTools_DataMapIteratorOfDataMapOfShapeInteger::~TopTools_DataMapIteratorOfDataMapOfShapeInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_DataMapIteratorOfDataMapOfShapeInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopTools_DataMapIteratorOfDataMapOfShapeListOfInteger;
class TopTools_DataMapIteratorOfDataMapOfShapeListOfInteger : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopTools_DataMapIteratorOfDataMapOfShapeListOfInteger;
		 TopTools_DataMapIteratorOfDataMapOfShapeListOfInteger ();
		%feature("autodoc", "Args:
	aMap(TopTools_DataMapOfShapeListOfInteger)

Returns:
	None

No detailed docstring for this function.") TopTools_DataMapIteratorOfDataMapOfShapeListOfInteger;
		 TopTools_DataMapIteratorOfDataMapOfShapeListOfInteger (const TopTools_DataMapOfShapeListOfInteger & aMap);
		%feature("autodoc", "Args:
	aMap(TopTools_DataMapOfShapeListOfInteger)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopTools_DataMapOfShapeListOfInteger & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		const TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_ListOfInteger

No detailed docstring for this function.") Value;
		const TColStd_ListOfInteger & Value ();
};


%feature("shadow") TopTools_DataMapIteratorOfDataMapOfShapeListOfInteger::~TopTools_DataMapIteratorOfDataMapOfShapeListOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_DataMapIteratorOfDataMapOfShapeListOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopTools_DataMapIteratorOfDataMapOfShapeListOfShape;
class TopTools_DataMapIteratorOfDataMapOfShapeListOfShape : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopTools_DataMapIteratorOfDataMapOfShapeListOfShape;
		 TopTools_DataMapIteratorOfDataMapOfShapeListOfShape ();
		%feature("autodoc", "Args:
	aMap(TopTools_DataMapOfShapeListOfShape)

Returns:
	None

No detailed docstring for this function.") TopTools_DataMapIteratorOfDataMapOfShapeListOfShape;
		 TopTools_DataMapIteratorOfDataMapOfShapeListOfShape (const TopTools_DataMapOfShapeListOfShape & aMap);
		%feature("autodoc", "Args:
	aMap(TopTools_DataMapOfShapeListOfShape)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopTools_DataMapOfShapeListOfShape & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		const TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") Value;
		const TopTools_ListOfShape & Value ();
};


%feature("shadow") TopTools_DataMapIteratorOfDataMapOfShapeListOfShape::~TopTools_DataMapIteratorOfDataMapOfShapeListOfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_DataMapIteratorOfDataMapOfShapeListOfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopTools_DataMapIteratorOfDataMapOfShapeReal;
class TopTools_DataMapIteratorOfDataMapOfShapeReal : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopTools_DataMapIteratorOfDataMapOfShapeReal;
		 TopTools_DataMapIteratorOfDataMapOfShapeReal ();
		%feature("autodoc", "Args:
	aMap(TopTools_DataMapOfShapeReal)

Returns:
	None

No detailed docstring for this function.") TopTools_DataMapIteratorOfDataMapOfShapeReal;
		 TopTools_DataMapIteratorOfDataMapOfShapeReal (const TopTools_DataMapOfShapeReal & aMap);
		%feature("autodoc", "Args:
	aMap(TopTools_DataMapOfShapeReal)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopTools_DataMapOfShapeReal & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		const TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Value;
		const Standard_Real & Value ();
};


%feature("shadow") TopTools_DataMapIteratorOfDataMapOfShapeReal::~TopTools_DataMapIteratorOfDataMapOfShapeReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_DataMapIteratorOfDataMapOfShapeReal {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopTools_DataMapIteratorOfDataMapOfShapeSequenceOfShape;
class TopTools_DataMapIteratorOfDataMapOfShapeSequenceOfShape : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopTools_DataMapIteratorOfDataMapOfShapeSequenceOfShape;
		 TopTools_DataMapIteratorOfDataMapOfShapeSequenceOfShape ();
		%feature("autodoc", "Args:
	aMap(TopTools_DataMapOfShapeSequenceOfShape)

Returns:
	None

No detailed docstring for this function.") TopTools_DataMapIteratorOfDataMapOfShapeSequenceOfShape;
		 TopTools_DataMapIteratorOfDataMapOfShapeSequenceOfShape (const TopTools_DataMapOfShapeSequenceOfShape & aMap);
		%feature("autodoc", "Args:
	aMap(TopTools_DataMapOfShapeSequenceOfShape)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopTools_DataMapOfShapeSequenceOfShape & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		const TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_SequenceOfShape

No detailed docstring for this function.") Value;
		const TopTools_SequenceOfShape & Value ();
};


%feature("shadow") TopTools_DataMapIteratorOfDataMapOfShapeSequenceOfShape::~TopTools_DataMapIteratorOfDataMapOfShapeSequenceOfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_DataMapIteratorOfDataMapOfShapeSequenceOfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopTools_DataMapIteratorOfDataMapOfShapeShape;
class TopTools_DataMapIteratorOfDataMapOfShapeShape : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopTools_DataMapIteratorOfDataMapOfShapeShape;
		 TopTools_DataMapIteratorOfDataMapOfShapeShape ();
		%feature("autodoc", "Args:
	aMap(TopTools_DataMapOfShapeShape)

Returns:
	None

No detailed docstring for this function.") TopTools_DataMapIteratorOfDataMapOfShapeShape;
		 TopTools_DataMapIteratorOfDataMapOfShapeShape (const TopTools_DataMapOfShapeShape & aMap);
		%feature("autodoc", "Args:
	aMap(TopTools_DataMapOfShapeShape)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopTools_DataMapOfShapeShape & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		const TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Value;
		const TopoDS_Shape & Value ();
};


%feature("shadow") TopTools_DataMapIteratorOfDataMapOfShapeShape::~TopTools_DataMapIteratorOfDataMapOfShapeShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_DataMapIteratorOfDataMapOfShapeShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopTools_DataMapNodeOfDataMapOfIntegerListOfShape;
class TopTools_DataMapNodeOfDataMapOfIntegerListOfShape : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(TopTools_ListOfShape)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopTools_DataMapNodeOfDataMapOfIntegerListOfShape;
		 TopTools_DataMapNodeOfDataMapOfIntegerListOfShape (Standard_Integer &OutValue,const TopTools_ListOfShape & I,const TCollection_MapNodePtr & n);

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey() {
                return (Standard_Integer) $self->Key();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey(Standard_Integer value ) {
                $self->Key()=value;
                }
            };
            		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") Value;
		TopTools_ListOfShape & Value ();
};


%feature("shadow") TopTools_DataMapNodeOfDataMapOfIntegerListOfShape::~TopTools_DataMapNodeOfDataMapOfIntegerListOfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_DataMapNodeOfDataMapOfIntegerListOfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopTools_DataMapNodeOfDataMapOfIntegerListOfShape {
	Handle_TopTools_DataMapNodeOfDataMapOfIntegerListOfShape GetHandle() {
	return *(Handle_TopTools_DataMapNodeOfDataMapOfIntegerListOfShape*) &$self;
	}
};

%nodefaultctor Handle_TopTools_DataMapNodeOfDataMapOfIntegerListOfShape;
class Handle_TopTools_DataMapNodeOfDataMapOfIntegerListOfShape : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopTools_DataMapNodeOfDataMapOfIntegerListOfShape();
        Handle_TopTools_DataMapNodeOfDataMapOfIntegerListOfShape(const Handle_TopTools_DataMapNodeOfDataMapOfIntegerListOfShape &aHandle);
        Handle_TopTools_DataMapNodeOfDataMapOfIntegerListOfShape(const TopTools_DataMapNodeOfDataMapOfIntegerListOfShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopTools_DataMapNodeOfDataMapOfIntegerListOfShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopTools_DataMapNodeOfDataMapOfIntegerListOfShape {
    TopTools_DataMapNodeOfDataMapOfIntegerListOfShape* GetObject() {
    return (TopTools_DataMapNodeOfDataMapOfIntegerListOfShape*)$self->Access();
    }
};
%feature("shadow") Handle_TopTools_DataMapNodeOfDataMapOfIntegerListOfShape::~Handle_TopTools_DataMapNodeOfDataMapOfIntegerListOfShape %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopTools_DataMapNodeOfDataMapOfIntegerListOfShape {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopTools_DataMapNodeOfDataMapOfIntegerShape;
class TopTools_DataMapNodeOfDataMapOfIntegerShape : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(TopoDS_Shape)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopTools_DataMapNodeOfDataMapOfIntegerShape;
		 TopTools_DataMapNodeOfDataMapOfIntegerShape (Standard_Integer &OutValue,const TopoDS_Shape & I,const TCollection_MapNodePtr & n);

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey() {
                return (Standard_Integer) $self->Key();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey(Standard_Integer value ) {
                $self->Key()=value;
                }
            };
            		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Value;
		TopoDS_Shape & Value ();
};


%feature("shadow") TopTools_DataMapNodeOfDataMapOfIntegerShape::~TopTools_DataMapNodeOfDataMapOfIntegerShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_DataMapNodeOfDataMapOfIntegerShape {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopTools_DataMapNodeOfDataMapOfIntegerShape {
	Handle_TopTools_DataMapNodeOfDataMapOfIntegerShape GetHandle() {
	return *(Handle_TopTools_DataMapNodeOfDataMapOfIntegerShape*) &$self;
	}
};

%nodefaultctor Handle_TopTools_DataMapNodeOfDataMapOfIntegerShape;
class Handle_TopTools_DataMapNodeOfDataMapOfIntegerShape : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopTools_DataMapNodeOfDataMapOfIntegerShape();
        Handle_TopTools_DataMapNodeOfDataMapOfIntegerShape(const Handle_TopTools_DataMapNodeOfDataMapOfIntegerShape &aHandle);
        Handle_TopTools_DataMapNodeOfDataMapOfIntegerShape(const TopTools_DataMapNodeOfDataMapOfIntegerShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopTools_DataMapNodeOfDataMapOfIntegerShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopTools_DataMapNodeOfDataMapOfIntegerShape {
    TopTools_DataMapNodeOfDataMapOfIntegerShape* GetObject() {
    return (TopTools_DataMapNodeOfDataMapOfIntegerShape*)$self->Access();
    }
};
%feature("shadow") Handle_TopTools_DataMapNodeOfDataMapOfIntegerShape::~Handle_TopTools_DataMapNodeOfDataMapOfIntegerShape %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopTools_DataMapNodeOfDataMapOfIntegerShape {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopTools_DataMapNodeOfDataMapOfOrientedShapeInteger;
class TopTools_DataMapNodeOfDataMapOfOrientedShapeInteger : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(Standard_Integer)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopTools_DataMapNodeOfDataMapOfOrientedShapeInteger;
		 TopTools_DataMapNodeOfDataMapOfOrientedShapeInteger (const TopoDS_Shape & K,Standard_Integer &OutValue,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		TopoDS_Shape & Key ();

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetValue() {
                return (Standard_Integer) $self->Value();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetValue(Standard_Integer value ) {
                $self->Value()=value;
                }
            };
            };


%feature("shadow") TopTools_DataMapNodeOfDataMapOfOrientedShapeInteger::~TopTools_DataMapNodeOfDataMapOfOrientedShapeInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_DataMapNodeOfDataMapOfOrientedShapeInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopTools_DataMapNodeOfDataMapOfOrientedShapeInteger {
	Handle_TopTools_DataMapNodeOfDataMapOfOrientedShapeInteger GetHandle() {
	return *(Handle_TopTools_DataMapNodeOfDataMapOfOrientedShapeInteger*) &$self;
	}
};

%nodefaultctor Handle_TopTools_DataMapNodeOfDataMapOfOrientedShapeInteger;
class Handle_TopTools_DataMapNodeOfDataMapOfOrientedShapeInteger : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopTools_DataMapNodeOfDataMapOfOrientedShapeInteger();
        Handle_TopTools_DataMapNodeOfDataMapOfOrientedShapeInteger(const Handle_TopTools_DataMapNodeOfDataMapOfOrientedShapeInteger &aHandle);
        Handle_TopTools_DataMapNodeOfDataMapOfOrientedShapeInteger(const TopTools_DataMapNodeOfDataMapOfOrientedShapeInteger *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopTools_DataMapNodeOfDataMapOfOrientedShapeInteger DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopTools_DataMapNodeOfDataMapOfOrientedShapeInteger {
    TopTools_DataMapNodeOfDataMapOfOrientedShapeInteger* GetObject() {
    return (TopTools_DataMapNodeOfDataMapOfOrientedShapeInteger*)$self->Access();
    }
};
%feature("shadow") Handle_TopTools_DataMapNodeOfDataMapOfOrientedShapeInteger::~Handle_TopTools_DataMapNodeOfDataMapOfOrientedShapeInteger %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopTools_DataMapNodeOfDataMapOfOrientedShapeInteger {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopTools_DataMapNodeOfDataMapOfOrientedShapeShape;
class TopTools_DataMapNodeOfDataMapOfOrientedShapeShape : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(TopoDS_Shape)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopTools_DataMapNodeOfDataMapOfOrientedShapeShape;
		 TopTools_DataMapNodeOfDataMapOfOrientedShapeShape (const TopoDS_Shape & K,const TopoDS_Shape & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Value;
		TopoDS_Shape & Value ();
};


%feature("shadow") TopTools_DataMapNodeOfDataMapOfOrientedShapeShape::~TopTools_DataMapNodeOfDataMapOfOrientedShapeShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_DataMapNodeOfDataMapOfOrientedShapeShape {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopTools_DataMapNodeOfDataMapOfOrientedShapeShape {
	Handle_TopTools_DataMapNodeOfDataMapOfOrientedShapeShape GetHandle() {
	return *(Handle_TopTools_DataMapNodeOfDataMapOfOrientedShapeShape*) &$self;
	}
};

%nodefaultctor Handle_TopTools_DataMapNodeOfDataMapOfOrientedShapeShape;
class Handle_TopTools_DataMapNodeOfDataMapOfOrientedShapeShape : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopTools_DataMapNodeOfDataMapOfOrientedShapeShape();
        Handle_TopTools_DataMapNodeOfDataMapOfOrientedShapeShape(const Handle_TopTools_DataMapNodeOfDataMapOfOrientedShapeShape &aHandle);
        Handle_TopTools_DataMapNodeOfDataMapOfOrientedShapeShape(const TopTools_DataMapNodeOfDataMapOfOrientedShapeShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopTools_DataMapNodeOfDataMapOfOrientedShapeShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopTools_DataMapNodeOfDataMapOfOrientedShapeShape {
    TopTools_DataMapNodeOfDataMapOfOrientedShapeShape* GetObject() {
    return (TopTools_DataMapNodeOfDataMapOfOrientedShapeShape*)$self->Access();
    }
};
%feature("shadow") Handle_TopTools_DataMapNodeOfDataMapOfOrientedShapeShape::~Handle_TopTools_DataMapNodeOfDataMapOfOrientedShapeShape %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopTools_DataMapNodeOfDataMapOfOrientedShapeShape {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopTools_DataMapNodeOfDataMapOfShapeInteger;
class TopTools_DataMapNodeOfDataMapOfShapeInteger : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(Standard_Integer)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopTools_DataMapNodeOfDataMapOfShapeInteger;
		 TopTools_DataMapNodeOfDataMapOfShapeInteger (const TopoDS_Shape & K,Standard_Integer &OutValue,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		TopoDS_Shape & Key ();

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetValue() {
                return (Standard_Integer) $self->Value();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetValue(Standard_Integer value ) {
                $self->Value()=value;
                }
            };
            };


%feature("shadow") TopTools_DataMapNodeOfDataMapOfShapeInteger::~TopTools_DataMapNodeOfDataMapOfShapeInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_DataMapNodeOfDataMapOfShapeInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopTools_DataMapNodeOfDataMapOfShapeInteger {
	Handle_TopTools_DataMapNodeOfDataMapOfShapeInteger GetHandle() {
	return *(Handle_TopTools_DataMapNodeOfDataMapOfShapeInteger*) &$self;
	}
};

%nodefaultctor Handle_TopTools_DataMapNodeOfDataMapOfShapeInteger;
class Handle_TopTools_DataMapNodeOfDataMapOfShapeInteger : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopTools_DataMapNodeOfDataMapOfShapeInteger();
        Handle_TopTools_DataMapNodeOfDataMapOfShapeInteger(const Handle_TopTools_DataMapNodeOfDataMapOfShapeInteger &aHandle);
        Handle_TopTools_DataMapNodeOfDataMapOfShapeInteger(const TopTools_DataMapNodeOfDataMapOfShapeInteger *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopTools_DataMapNodeOfDataMapOfShapeInteger DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopTools_DataMapNodeOfDataMapOfShapeInteger {
    TopTools_DataMapNodeOfDataMapOfShapeInteger* GetObject() {
    return (TopTools_DataMapNodeOfDataMapOfShapeInteger*)$self->Access();
    }
};
%feature("shadow") Handle_TopTools_DataMapNodeOfDataMapOfShapeInteger::~Handle_TopTools_DataMapNodeOfDataMapOfShapeInteger %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopTools_DataMapNodeOfDataMapOfShapeInteger {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopTools_DataMapNodeOfDataMapOfShapeListOfInteger;
class TopTools_DataMapNodeOfDataMapOfShapeListOfInteger : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(TColStd_ListOfInteger)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopTools_DataMapNodeOfDataMapOfShapeListOfInteger;
		 TopTools_DataMapNodeOfDataMapOfShapeListOfInteger (const TopoDS_Shape & K,const TColStd_ListOfInteger & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_ListOfInteger

No detailed docstring for this function.") Value;
		TColStd_ListOfInteger & Value ();
};


%feature("shadow") TopTools_DataMapNodeOfDataMapOfShapeListOfInteger::~TopTools_DataMapNodeOfDataMapOfShapeListOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_DataMapNodeOfDataMapOfShapeListOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopTools_DataMapNodeOfDataMapOfShapeListOfInteger {
	Handle_TopTools_DataMapNodeOfDataMapOfShapeListOfInteger GetHandle() {
	return *(Handle_TopTools_DataMapNodeOfDataMapOfShapeListOfInteger*) &$self;
	}
};

%nodefaultctor Handle_TopTools_DataMapNodeOfDataMapOfShapeListOfInteger;
class Handle_TopTools_DataMapNodeOfDataMapOfShapeListOfInteger : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopTools_DataMapNodeOfDataMapOfShapeListOfInteger();
        Handle_TopTools_DataMapNodeOfDataMapOfShapeListOfInteger(const Handle_TopTools_DataMapNodeOfDataMapOfShapeListOfInteger &aHandle);
        Handle_TopTools_DataMapNodeOfDataMapOfShapeListOfInteger(const TopTools_DataMapNodeOfDataMapOfShapeListOfInteger *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopTools_DataMapNodeOfDataMapOfShapeListOfInteger DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopTools_DataMapNodeOfDataMapOfShapeListOfInteger {
    TopTools_DataMapNodeOfDataMapOfShapeListOfInteger* GetObject() {
    return (TopTools_DataMapNodeOfDataMapOfShapeListOfInteger*)$self->Access();
    }
};
%feature("shadow") Handle_TopTools_DataMapNodeOfDataMapOfShapeListOfInteger::~Handle_TopTools_DataMapNodeOfDataMapOfShapeListOfInteger %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopTools_DataMapNodeOfDataMapOfShapeListOfInteger {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopTools_DataMapNodeOfDataMapOfShapeListOfShape;
class TopTools_DataMapNodeOfDataMapOfShapeListOfShape : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(TopTools_ListOfShape)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopTools_DataMapNodeOfDataMapOfShapeListOfShape;
		 TopTools_DataMapNodeOfDataMapOfShapeListOfShape (const TopoDS_Shape & K,const TopTools_ListOfShape & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") Value;
		TopTools_ListOfShape & Value ();
};


%feature("shadow") TopTools_DataMapNodeOfDataMapOfShapeListOfShape::~TopTools_DataMapNodeOfDataMapOfShapeListOfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_DataMapNodeOfDataMapOfShapeListOfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopTools_DataMapNodeOfDataMapOfShapeListOfShape {
	Handle_TopTools_DataMapNodeOfDataMapOfShapeListOfShape GetHandle() {
	return *(Handle_TopTools_DataMapNodeOfDataMapOfShapeListOfShape*) &$self;
	}
};

%nodefaultctor Handle_TopTools_DataMapNodeOfDataMapOfShapeListOfShape;
class Handle_TopTools_DataMapNodeOfDataMapOfShapeListOfShape : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopTools_DataMapNodeOfDataMapOfShapeListOfShape();
        Handle_TopTools_DataMapNodeOfDataMapOfShapeListOfShape(const Handle_TopTools_DataMapNodeOfDataMapOfShapeListOfShape &aHandle);
        Handle_TopTools_DataMapNodeOfDataMapOfShapeListOfShape(const TopTools_DataMapNodeOfDataMapOfShapeListOfShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopTools_DataMapNodeOfDataMapOfShapeListOfShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopTools_DataMapNodeOfDataMapOfShapeListOfShape {
    TopTools_DataMapNodeOfDataMapOfShapeListOfShape* GetObject() {
    return (TopTools_DataMapNodeOfDataMapOfShapeListOfShape*)$self->Access();
    }
};
%feature("shadow") Handle_TopTools_DataMapNodeOfDataMapOfShapeListOfShape::~Handle_TopTools_DataMapNodeOfDataMapOfShapeListOfShape %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopTools_DataMapNodeOfDataMapOfShapeListOfShape {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopTools_DataMapNodeOfDataMapOfShapeReal;
class TopTools_DataMapNodeOfDataMapOfShapeReal : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(Standard_Real)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopTools_DataMapNodeOfDataMapOfShapeReal;
		 TopTools_DataMapNodeOfDataMapOfShapeReal (const TopoDS_Shape & K,Standard_Real &OutValue,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		TopoDS_Shape & Key ();

            %feature("autodoc","1");
            %extend {
                Standard_Real GetValue() {
                return (Standard_Real) $self->Value();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetValue(Standard_Real value ) {
                $self->Value()=value;
                }
            };
            };


%feature("shadow") TopTools_DataMapNodeOfDataMapOfShapeReal::~TopTools_DataMapNodeOfDataMapOfShapeReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_DataMapNodeOfDataMapOfShapeReal {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopTools_DataMapNodeOfDataMapOfShapeReal {
	Handle_TopTools_DataMapNodeOfDataMapOfShapeReal GetHandle() {
	return *(Handle_TopTools_DataMapNodeOfDataMapOfShapeReal*) &$self;
	}
};

%nodefaultctor Handle_TopTools_DataMapNodeOfDataMapOfShapeReal;
class Handle_TopTools_DataMapNodeOfDataMapOfShapeReal : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopTools_DataMapNodeOfDataMapOfShapeReal();
        Handle_TopTools_DataMapNodeOfDataMapOfShapeReal(const Handle_TopTools_DataMapNodeOfDataMapOfShapeReal &aHandle);
        Handle_TopTools_DataMapNodeOfDataMapOfShapeReal(const TopTools_DataMapNodeOfDataMapOfShapeReal *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopTools_DataMapNodeOfDataMapOfShapeReal DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopTools_DataMapNodeOfDataMapOfShapeReal {
    TopTools_DataMapNodeOfDataMapOfShapeReal* GetObject() {
    return (TopTools_DataMapNodeOfDataMapOfShapeReal*)$self->Access();
    }
};
%feature("shadow") Handle_TopTools_DataMapNodeOfDataMapOfShapeReal::~Handle_TopTools_DataMapNodeOfDataMapOfShapeReal %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopTools_DataMapNodeOfDataMapOfShapeReal {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopTools_DataMapNodeOfDataMapOfShapeSequenceOfShape;
class TopTools_DataMapNodeOfDataMapOfShapeSequenceOfShape : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(TopTools_SequenceOfShape)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopTools_DataMapNodeOfDataMapOfShapeSequenceOfShape;
		 TopTools_DataMapNodeOfDataMapOfShapeSequenceOfShape (const TopoDS_Shape & K,const TopTools_SequenceOfShape & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_SequenceOfShape

No detailed docstring for this function.") Value;
		TopTools_SequenceOfShape & Value ();
};


%feature("shadow") TopTools_DataMapNodeOfDataMapOfShapeSequenceOfShape::~TopTools_DataMapNodeOfDataMapOfShapeSequenceOfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_DataMapNodeOfDataMapOfShapeSequenceOfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopTools_DataMapNodeOfDataMapOfShapeSequenceOfShape {
	Handle_TopTools_DataMapNodeOfDataMapOfShapeSequenceOfShape GetHandle() {
	return *(Handle_TopTools_DataMapNodeOfDataMapOfShapeSequenceOfShape*) &$self;
	}
};

%nodefaultctor Handle_TopTools_DataMapNodeOfDataMapOfShapeSequenceOfShape;
class Handle_TopTools_DataMapNodeOfDataMapOfShapeSequenceOfShape : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopTools_DataMapNodeOfDataMapOfShapeSequenceOfShape();
        Handle_TopTools_DataMapNodeOfDataMapOfShapeSequenceOfShape(const Handle_TopTools_DataMapNodeOfDataMapOfShapeSequenceOfShape &aHandle);
        Handle_TopTools_DataMapNodeOfDataMapOfShapeSequenceOfShape(const TopTools_DataMapNodeOfDataMapOfShapeSequenceOfShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopTools_DataMapNodeOfDataMapOfShapeSequenceOfShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopTools_DataMapNodeOfDataMapOfShapeSequenceOfShape {
    TopTools_DataMapNodeOfDataMapOfShapeSequenceOfShape* GetObject() {
    return (TopTools_DataMapNodeOfDataMapOfShapeSequenceOfShape*)$self->Access();
    }
};
%feature("shadow") Handle_TopTools_DataMapNodeOfDataMapOfShapeSequenceOfShape::~Handle_TopTools_DataMapNodeOfDataMapOfShapeSequenceOfShape %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopTools_DataMapNodeOfDataMapOfShapeSequenceOfShape {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopTools_DataMapNodeOfDataMapOfShapeShape;
class TopTools_DataMapNodeOfDataMapOfShapeShape : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(TopoDS_Shape)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopTools_DataMapNodeOfDataMapOfShapeShape;
		 TopTools_DataMapNodeOfDataMapOfShapeShape (const TopoDS_Shape & K,const TopoDS_Shape & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Value;
		TopoDS_Shape & Value ();
};


%feature("shadow") TopTools_DataMapNodeOfDataMapOfShapeShape::~TopTools_DataMapNodeOfDataMapOfShapeShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_DataMapNodeOfDataMapOfShapeShape {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopTools_DataMapNodeOfDataMapOfShapeShape {
	Handle_TopTools_DataMapNodeOfDataMapOfShapeShape GetHandle() {
	return *(Handle_TopTools_DataMapNodeOfDataMapOfShapeShape*) &$self;
	}
};

%nodefaultctor Handle_TopTools_DataMapNodeOfDataMapOfShapeShape;
class Handle_TopTools_DataMapNodeOfDataMapOfShapeShape : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopTools_DataMapNodeOfDataMapOfShapeShape();
        Handle_TopTools_DataMapNodeOfDataMapOfShapeShape(const Handle_TopTools_DataMapNodeOfDataMapOfShapeShape &aHandle);
        Handle_TopTools_DataMapNodeOfDataMapOfShapeShape(const TopTools_DataMapNodeOfDataMapOfShapeShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopTools_DataMapNodeOfDataMapOfShapeShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopTools_DataMapNodeOfDataMapOfShapeShape {
    TopTools_DataMapNodeOfDataMapOfShapeShape* GetObject() {
    return (TopTools_DataMapNodeOfDataMapOfShapeShape*)$self->Access();
    }
};
%feature("shadow") Handle_TopTools_DataMapNodeOfDataMapOfShapeShape::~Handle_TopTools_DataMapNodeOfDataMapOfShapeShape %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopTools_DataMapNodeOfDataMapOfShapeShape {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopTools_DataMapOfIntegerListOfShape;
class TopTools_DataMapOfIntegerListOfShape : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TopTools_DataMapOfIntegerListOfShape;
		 TopTools_DataMapOfIntegerListOfShape (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TopTools_DataMapOfIntegerListOfShape)

Returns:
	TopTools_DataMapOfIntegerListOfShape

No detailed docstring for this function.") Assign;
		TopTools_DataMapOfIntegerListOfShape & Assign (const TopTools_DataMapOfIntegerListOfShape & Other);
		%feature("autodoc", "Args:
	Other(TopTools_DataMapOfIntegerListOfShape)

Returns:
	TopTools_DataMapOfIntegerListOfShape

No detailed docstring for this function.") operator=;
		TopTools_DataMapOfIntegerListOfShape & operator = (const TopTools_DataMapOfIntegerListOfShape & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(TopTools_ListOfShape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (Standard_Integer &OutValue,const TopTools_ListOfShape & I);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") Find;
		const TopTools_ListOfShape & Find (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") ChangeFind;
		TopTools_ListOfShape & ChangeFind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (Standard_Integer &OutValue);
};


%feature("shadow") TopTools_DataMapOfIntegerListOfShape::~TopTools_DataMapOfIntegerListOfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_DataMapOfIntegerListOfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopTools_DataMapOfIntegerShape;
class TopTools_DataMapOfIntegerShape : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TopTools_DataMapOfIntegerShape;
		 TopTools_DataMapOfIntegerShape (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TopTools_DataMapOfIntegerShape)

Returns:
	TopTools_DataMapOfIntegerShape

No detailed docstring for this function.") Assign;
		TopTools_DataMapOfIntegerShape & Assign (const TopTools_DataMapOfIntegerShape & Other);
		%feature("autodoc", "Args:
	Other(TopTools_DataMapOfIntegerShape)

Returns:
	TopTools_DataMapOfIntegerShape

No detailed docstring for this function.") operator=;
		TopTools_DataMapOfIntegerShape & operator = (const TopTools_DataMapOfIntegerShape & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (Standard_Integer &OutValue,const TopoDS_Shape & I);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") Find;
		const TopoDS_Shape & Find (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") ChangeFind;
		TopoDS_Shape & ChangeFind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (Standard_Integer &OutValue);
};


%feature("shadow") TopTools_DataMapOfIntegerShape::~TopTools_DataMapOfIntegerShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_DataMapOfIntegerShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopTools_DataMapOfOrientedShapeInteger;
class TopTools_DataMapOfOrientedShapeInteger : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TopTools_DataMapOfOrientedShapeInteger;
		 TopTools_DataMapOfOrientedShapeInteger (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TopTools_DataMapOfOrientedShapeInteger)

Returns:
	TopTools_DataMapOfOrientedShapeInteger

No detailed docstring for this function.") Assign;
		TopTools_DataMapOfOrientedShapeInteger & Assign (const TopTools_DataMapOfOrientedShapeInteger & Other);
		%feature("autodoc", "Args:
	Other(TopTools_DataMapOfOrientedShapeInteger)

Returns:
	TopTools_DataMapOfOrientedShapeInteger

No detailed docstring for this function.") operator=;
		TopTools_DataMapOfOrientedShapeInteger & operator = (const TopTools_DataMapOfOrientedShapeInteger & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Integer

No detailed docstring for this function.") Find;
		const Standard_Integer & Find (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Integer

No detailed docstring for this function.") ChangeFind;
		Standard_Integer & ChangeFind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%feature("shadow") TopTools_DataMapOfOrientedShapeInteger::~TopTools_DataMapOfOrientedShapeInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_DataMapOfOrientedShapeInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopTools_DataMapOfOrientedShapeShape;
class TopTools_DataMapOfOrientedShapeShape : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TopTools_DataMapOfOrientedShapeShape;
		 TopTools_DataMapOfOrientedShapeShape (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TopTools_DataMapOfOrientedShapeShape)

Returns:
	TopTools_DataMapOfOrientedShapeShape

No detailed docstring for this function.") Assign;
		TopTools_DataMapOfOrientedShapeShape & Assign (const TopTools_DataMapOfOrientedShapeShape & Other);
		%feature("autodoc", "Args:
	Other(TopTools_DataMapOfOrientedShapeShape)

Returns:
	TopTools_DataMapOfOrientedShapeShape

No detailed docstring for this function.") operator=;
		TopTools_DataMapOfOrientedShapeShape & operator = (const TopTools_DataMapOfOrientedShapeShape & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const TopoDS_Shape & I);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") Find;
		const TopoDS_Shape & Find (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") ChangeFind;
		TopoDS_Shape & ChangeFind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%feature("shadow") TopTools_DataMapOfOrientedShapeShape::~TopTools_DataMapOfOrientedShapeShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_DataMapOfOrientedShapeShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopTools_DataMapOfShapeInteger;
class TopTools_DataMapOfShapeInteger : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TopTools_DataMapOfShapeInteger;
		 TopTools_DataMapOfShapeInteger (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TopTools_DataMapOfShapeInteger)

Returns:
	TopTools_DataMapOfShapeInteger

No detailed docstring for this function.") Assign;
		TopTools_DataMapOfShapeInteger & Assign (const TopTools_DataMapOfShapeInteger & Other);
		%feature("autodoc", "Args:
	Other(TopTools_DataMapOfShapeInteger)

Returns:
	TopTools_DataMapOfShapeInteger

No detailed docstring for this function.") operator=;
		TopTools_DataMapOfShapeInteger & operator = (const TopTools_DataMapOfShapeInteger & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Integer

No detailed docstring for this function.") Find;
		const Standard_Integer & Find (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Integer

No detailed docstring for this function.") ChangeFind;
		Standard_Integer & ChangeFind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%feature("shadow") TopTools_DataMapOfShapeInteger::~TopTools_DataMapOfShapeInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_DataMapOfShapeInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopTools_DataMapOfShapeListOfInteger;
class TopTools_DataMapOfShapeListOfInteger : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TopTools_DataMapOfShapeListOfInteger;
		 TopTools_DataMapOfShapeListOfInteger (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TopTools_DataMapOfShapeListOfInteger)

Returns:
	TopTools_DataMapOfShapeListOfInteger

No detailed docstring for this function.") Assign;
		TopTools_DataMapOfShapeListOfInteger & Assign (const TopTools_DataMapOfShapeListOfInteger & Other);
		%feature("autodoc", "Args:
	Other(TopTools_DataMapOfShapeListOfInteger)

Returns:
	TopTools_DataMapOfShapeListOfInteger

No detailed docstring for this function.") operator=;
		TopTools_DataMapOfShapeListOfInteger & operator = (const TopTools_DataMapOfShapeListOfInteger & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(TColStd_ListOfInteger)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const TColStd_ListOfInteger & I);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	TColStd_ListOfInteger

No detailed docstring for this function.") Find;
		const TColStd_ListOfInteger & Find (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	TColStd_ListOfInteger

No detailed docstring for this function.") ChangeFind;
		TColStd_ListOfInteger & ChangeFind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%feature("shadow") TopTools_DataMapOfShapeListOfInteger::~TopTools_DataMapOfShapeListOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_DataMapOfShapeListOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopTools_DataMapOfShapeListOfShape;
class TopTools_DataMapOfShapeListOfShape : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TopTools_DataMapOfShapeListOfShape;
		 TopTools_DataMapOfShapeListOfShape (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TopTools_DataMapOfShapeListOfShape)

Returns:
	TopTools_DataMapOfShapeListOfShape

No detailed docstring for this function.") Assign;
		TopTools_DataMapOfShapeListOfShape & Assign (const TopTools_DataMapOfShapeListOfShape & Other);
		%feature("autodoc", "Args:
	Other(TopTools_DataMapOfShapeListOfShape)

Returns:
	TopTools_DataMapOfShapeListOfShape

No detailed docstring for this function.") operator=;
		TopTools_DataMapOfShapeListOfShape & operator = (const TopTools_DataMapOfShapeListOfShape & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(TopTools_ListOfShape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const TopTools_ListOfShape & I);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") Find;
		const TopTools_ListOfShape & Find (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") ChangeFind;
		TopTools_ListOfShape & ChangeFind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%feature("shadow") TopTools_DataMapOfShapeListOfShape::~TopTools_DataMapOfShapeListOfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_DataMapOfShapeListOfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopTools_DataMapOfShapeReal;
class TopTools_DataMapOfShapeReal : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TopTools_DataMapOfShapeReal;
		 TopTools_DataMapOfShapeReal (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TopTools_DataMapOfShapeReal)

Returns:
	TopTools_DataMapOfShapeReal

No detailed docstring for this function.") Assign;
		TopTools_DataMapOfShapeReal & Assign (const TopTools_DataMapOfShapeReal & Other);
		%feature("autodoc", "Args:
	Other(TopTools_DataMapOfShapeReal)

Returns:
	TopTools_DataMapOfShapeReal

No detailed docstring for this function.") operator=;
		TopTools_DataMapOfShapeReal & operator = (const TopTools_DataMapOfShapeReal & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Real

No detailed docstring for this function.") Find;
		const Standard_Real & Find (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Real

No detailed docstring for this function.") ChangeFind;
		Standard_Real & ChangeFind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%feature("shadow") TopTools_DataMapOfShapeReal::~TopTools_DataMapOfShapeReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_DataMapOfShapeReal {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopTools_DataMapOfShapeSequenceOfShape;
class TopTools_DataMapOfShapeSequenceOfShape : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TopTools_DataMapOfShapeSequenceOfShape;
		 TopTools_DataMapOfShapeSequenceOfShape (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TopTools_DataMapOfShapeSequenceOfShape)

Returns:
	TopTools_DataMapOfShapeSequenceOfShape

No detailed docstring for this function.") Assign;
		TopTools_DataMapOfShapeSequenceOfShape & Assign (const TopTools_DataMapOfShapeSequenceOfShape & Other);
		%feature("autodoc", "Args:
	Other(TopTools_DataMapOfShapeSequenceOfShape)

Returns:
	TopTools_DataMapOfShapeSequenceOfShape

No detailed docstring for this function.") operator=;
		TopTools_DataMapOfShapeSequenceOfShape & operator = (const TopTools_DataMapOfShapeSequenceOfShape & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(TopTools_SequenceOfShape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const TopTools_SequenceOfShape & I);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	TopTools_SequenceOfShape

No detailed docstring for this function.") Find;
		const TopTools_SequenceOfShape & Find (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	TopTools_SequenceOfShape

No detailed docstring for this function.") ChangeFind;
		TopTools_SequenceOfShape & ChangeFind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%feature("shadow") TopTools_DataMapOfShapeSequenceOfShape::~TopTools_DataMapOfShapeSequenceOfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_DataMapOfShapeSequenceOfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopTools_DataMapOfShapeShape;
class TopTools_DataMapOfShapeShape : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TopTools_DataMapOfShapeShape;
		 TopTools_DataMapOfShapeShape (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TopTools_DataMapOfShapeShape)

Returns:
	TopTools_DataMapOfShapeShape

No detailed docstring for this function.") Assign;
		TopTools_DataMapOfShapeShape & Assign (const TopTools_DataMapOfShapeShape & Other);
		%feature("autodoc", "Args:
	Other(TopTools_DataMapOfShapeShape)

Returns:
	TopTools_DataMapOfShapeShape

No detailed docstring for this function.") operator=;
		TopTools_DataMapOfShapeShape & operator = (const TopTools_DataMapOfShapeShape & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const TopoDS_Shape & I);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") Find;
		const TopoDS_Shape & Find (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") ChangeFind;
		TopoDS_Shape & ChangeFind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%feature("shadow") TopTools_DataMapOfShapeShape::~TopTools_DataMapOfShapeShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_DataMapOfShapeShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopTools_HArray1OfListOfShape;
class TopTools_HArray1OfListOfShape : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TopTools_HArray1OfListOfShape;
		 TopTools_HArray1OfListOfShape (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(TopTools_ListOfShape)

Returns:
	None

No detailed docstring for this function.") TopTools_HArray1OfListOfShape;
		 TopTools_HArray1OfListOfShape (const Standard_Integer Low,const Standard_Integer Up,const TopTools_ListOfShape & V);
		%feature("autodoc", "Args:
	V(TopTools_ListOfShape)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopTools_ListOfShape & V);
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
	Value(TopTools_ListOfShape)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const TopTools_ListOfShape & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") Value;
		const TopTools_ListOfShape & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") ChangeValue;
		TopTools_ListOfShape & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_Array1OfListOfShape

No detailed docstring for this function.") Array1;
		const TopTools_Array1OfListOfShape & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_Array1OfListOfShape

No detailed docstring for this function.") ChangeArray1;
		TopTools_Array1OfListOfShape & ChangeArray1 ();
};


%feature("shadow") TopTools_HArray1OfListOfShape::~TopTools_HArray1OfListOfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_HArray1OfListOfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopTools_HArray1OfListOfShape {
	Handle_TopTools_HArray1OfListOfShape GetHandle() {
	return *(Handle_TopTools_HArray1OfListOfShape*) &$self;
	}
};

%nodefaultctor Handle_TopTools_HArray1OfListOfShape;
class Handle_TopTools_HArray1OfListOfShape : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TopTools_HArray1OfListOfShape();
        Handle_TopTools_HArray1OfListOfShape(const Handle_TopTools_HArray1OfListOfShape &aHandle);
        Handle_TopTools_HArray1OfListOfShape(const TopTools_HArray1OfListOfShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopTools_HArray1OfListOfShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopTools_HArray1OfListOfShape {
    TopTools_HArray1OfListOfShape* GetObject() {
    return (TopTools_HArray1OfListOfShape*)$self->Access();
    }
};
%feature("shadow") Handle_TopTools_HArray1OfListOfShape::~Handle_TopTools_HArray1OfListOfShape %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopTools_HArray1OfListOfShape {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopTools_HArray1OfShape;
class TopTools_HArray1OfShape : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TopTools_HArray1OfShape;
		 TopTools_HArray1OfShape (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") TopTools_HArray1OfShape;
		 TopTools_HArray1OfShape (const Standard_Integer Low,const Standard_Integer Up,const TopoDS_Shape & V);
		%feature("autodoc", "Args:
	V(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopoDS_Shape & V);
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
	Value(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const TopoDS_Shape & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") Value;
		const TopoDS_Shape & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") ChangeValue;
		TopoDS_Shape & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_Array1OfShape

No detailed docstring for this function.") Array1;
		const TopTools_Array1OfShape & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_Array1OfShape

No detailed docstring for this function.") ChangeArray1;
		TopTools_Array1OfShape & ChangeArray1 ();
};


%feature("shadow") TopTools_HArray1OfShape::~TopTools_HArray1OfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_HArray1OfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopTools_HArray1OfShape {
	Handle_TopTools_HArray1OfShape GetHandle() {
	return *(Handle_TopTools_HArray1OfShape*) &$self;
	}
};

%nodefaultctor Handle_TopTools_HArray1OfShape;
class Handle_TopTools_HArray1OfShape : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TopTools_HArray1OfShape();
        Handle_TopTools_HArray1OfShape(const Handle_TopTools_HArray1OfShape &aHandle);
        Handle_TopTools_HArray1OfShape(const TopTools_HArray1OfShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopTools_HArray1OfShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopTools_HArray1OfShape {
    TopTools_HArray1OfShape* GetObject() {
    return (TopTools_HArray1OfShape*)$self->Access();
    }
};
%feature("shadow") Handle_TopTools_HArray1OfShape::~Handle_TopTools_HArray1OfShape %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopTools_HArray1OfShape {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopTools_HArray2OfShape;
class TopTools_HArray2OfShape : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TopTools_HArray2OfShape;
		 TopTools_HArray2OfShape (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)
	V(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") TopTools_HArray2OfShape;
		 TopTools_HArray2OfShape (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const TopoDS_Shape & V);
		%feature("autodoc", "Args:
	V(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopoDS_Shape & V);
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
	Value(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const TopoDS_Shape & Value);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") Value;
		const TopoDS_Shape & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") ChangeValue;
		TopoDS_Shape & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_Array2OfShape

No detailed docstring for this function.") Array2;
		const TopTools_Array2OfShape & Array2 ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_Array2OfShape

No detailed docstring for this function.") ChangeArray2;
		TopTools_Array2OfShape & ChangeArray2 ();
};


%feature("shadow") TopTools_HArray2OfShape::~TopTools_HArray2OfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_HArray2OfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopTools_HArray2OfShape {
	Handle_TopTools_HArray2OfShape GetHandle() {
	return *(Handle_TopTools_HArray2OfShape*) &$self;
	}
};

%nodefaultctor Handle_TopTools_HArray2OfShape;
class Handle_TopTools_HArray2OfShape : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TopTools_HArray2OfShape();
        Handle_TopTools_HArray2OfShape(const Handle_TopTools_HArray2OfShape &aHandle);
        Handle_TopTools_HArray2OfShape(const TopTools_HArray2OfShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopTools_HArray2OfShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopTools_HArray2OfShape {
    TopTools_HArray2OfShape* GetObject() {
    return (TopTools_HArray2OfShape*)$self->Access();
    }
};
%feature("shadow") Handle_TopTools_HArray2OfShape::~Handle_TopTools_HArray2OfShape %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopTools_HArray2OfShape {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopTools_HSequenceOfShape;
class TopTools_HSequenceOfShape : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopTools_HSequenceOfShape;
		 TopTools_HSequenceOfShape ();
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
	anItem(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const TopoDS_Shape & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_TopTools_HSequenceOfShape)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_TopTools_HSequenceOfShape & aSequence);
		%feature("autodoc", "Args:
	anItem(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const TopoDS_Shape & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_TopTools_HSequenceOfShape)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_TopTools_HSequenceOfShape & aSequence);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const TopoDS_Shape & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_TopTools_HSequenceOfShape)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TopTools_HSequenceOfShape & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const TopoDS_Shape & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_TopTools_HSequenceOfShape)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TopTools_HSequenceOfShape & aSequence);
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
	Handle_TopTools_HSequenceOfShape

No detailed docstring for this function.") Split;
		Handle_TopTools_HSequenceOfShape Split (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer anIndex,const TopoDS_Shape & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") Value;
		const TopoDS_Shape & Value (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") ChangeValue;
		TopoDS_Shape & ChangeValue (const Standard_Integer anIndex);
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
	TopTools_SequenceOfShape

No detailed docstring for this function.") Sequence;
		const TopTools_SequenceOfShape & Sequence ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_SequenceOfShape

No detailed docstring for this function.") ChangeSequence;
		TopTools_SequenceOfShape & ChangeSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopTools_HSequenceOfShape

No detailed docstring for this function.") ShallowCopy;
		Handle_TopTools_HSequenceOfShape ShallowCopy ();
};


%feature("shadow") TopTools_HSequenceOfShape::~TopTools_HSequenceOfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_HSequenceOfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopTools_HSequenceOfShape {
	Handle_TopTools_HSequenceOfShape GetHandle() {
	return *(Handle_TopTools_HSequenceOfShape*) &$self;
	}
};

%nodefaultctor Handle_TopTools_HSequenceOfShape;
class Handle_TopTools_HSequenceOfShape : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TopTools_HSequenceOfShape();
        Handle_TopTools_HSequenceOfShape(const Handle_TopTools_HSequenceOfShape &aHandle);
        Handle_TopTools_HSequenceOfShape(const TopTools_HSequenceOfShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopTools_HSequenceOfShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopTools_HSequenceOfShape {
    TopTools_HSequenceOfShape* GetObject() {
    return (TopTools_HSequenceOfShape*)$self->Access();
    }
};
%feature("shadow") Handle_TopTools_HSequenceOfShape::~Handle_TopTools_HSequenceOfShape %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopTools_HSequenceOfShape {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeAddress;
class TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeAddress : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K1(TopoDS_Shape)
	K2(Standard_Integer)
	I(Standard_Address)
	n1(TCollection_MapNodePtr)
	n2(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeAddress;
		 TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeAddress (const TopoDS_Shape & K1,const Standard_Integer K2,const Standard_Address & I,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key1;
		TopoDS_Shape & Key1 ();

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey2() {
                return (Standard_Integer) $self->Key2();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey2(Standard_Integer value ) {
                $self->Key2()=value;
                }
            };
            		%feature("autodoc", "Args:
	None
Returns:
	TCollection_MapNodePtr

No detailed docstring for this function.") Next2;
		TCollection_MapNodePtr & Next2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Address

No detailed docstring for this function.") Value;
		Standard_Address & Value ();
};


%feature("shadow") TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeAddress::~TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeAddress %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeAddress {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeAddress {
	Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeAddress GetHandle() {
	return *(Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeAddress*) &$self;
	}
};

%nodefaultctor Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeAddress;
class Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeAddress : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeAddress();
        Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeAddress(const Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeAddress &aHandle);
        Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeAddress(const TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeAddress *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeAddress DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeAddress {
    TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeAddress* GetObject() {
    return (TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeAddress*)$self->Access();
    }
};
%feature("shadow") Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeAddress::~Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeAddress %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeAddress {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeListOfShape;
class TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeListOfShape : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K1(TopoDS_Shape)
	K2(Standard_Integer)
	I(TopTools_ListOfShape)
	n1(TCollection_MapNodePtr)
	n2(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeListOfShape;
		 TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeListOfShape (const TopoDS_Shape & K1,const Standard_Integer K2,const TopTools_ListOfShape & I,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key1;
		TopoDS_Shape & Key1 ();

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey2() {
                return (Standard_Integer) $self->Key2();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey2(Standard_Integer value ) {
                $self->Key2()=value;
                }
            };
            		%feature("autodoc", "Args:
	None
Returns:
	TCollection_MapNodePtr

No detailed docstring for this function.") Next2;
		TCollection_MapNodePtr & Next2 ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") Value;
		TopTools_ListOfShape & Value ();
};


%feature("shadow") TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeListOfShape::~TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeListOfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeListOfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeListOfShape {
	Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeListOfShape GetHandle() {
	return *(Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeListOfShape*) &$self;
	}
};

%nodefaultctor Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeListOfShape;
class Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeListOfShape : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeListOfShape();
        Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeListOfShape(const Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeListOfShape &aHandle);
        Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeListOfShape(const TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeListOfShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeListOfShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeListOfShape {
    TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeListOfShape* GetObject() {
    return (TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeListOfShape*)$self->Access();
    }
};
%feature("shadow") Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeListOfShape::~Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeListOfShape %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeListOfShape {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeShape;
class TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeShape : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K1(TopoDS_Shape)
	K2(Standard_Integer)
	I(TopoDS_Shape)
	n1(TCollection_MapNodePtr)
	n2(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeShape;
		 TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeShape (const TopoDS_Shape & K1,const Standard_Integer K2,const TopoDS_Shape & I,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key1;
		TopoDS_Shape & Key1 ();

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey2() {
                return (Standard_Integer) $self->Key2();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey2(Standard_Integer value ) {
                $self->Key2()=value;
                }
            };
            		%feature("autodoc", "Args:
	None
Returns:
	TCollection_MapNodePtr

No detailed docstring for this function.") Next2;
		TCollection_MapNodePtr & Next2 ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Value;
		TopoDS_Shape & Value ();
};


%feature("shadow") TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeShape::~TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeShape {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeShape {
	Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeShape GetHandle() {
	return *(Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeShape*) &$self;
	}
};

%nodefaultctor Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeShape;
class Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeShape : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeShape();
        Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeShape(const Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeShape &aHandle);
        Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeShape(const TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeShape {
    TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeShape* GetObject() {
    return (TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeShape*)$self->Access();
    }
};
%feature("shadow") Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeShape::~Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeShape %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeShape {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopTools_IndexedDataMapOfShapeAddress;
class TopTools_IndexedDataMapOfShapeAddress : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TopTools_IndexedDataMapOfShapeAddress;
		 TopTools_IndexedDataMapOfShapeAddress (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TopTools_IndexedDataMapOfShapeAddress)

Returns:
	TopTools_IndexedDataMapOfShapeAddress

No detailed docstring for this function.") Assign;
		TopTools_IndexedDataMapOfShapeAddress & Assign (const TopTools_IndexedDataMapOfShapeAddress & Other);
		%feature("autodoc", "Args:
	Other(TopTools_IndexedDataMapOfShapeAddress)

Returns:
	TopTools_IndexedDataMapOfShapeAddress

No detailed docstring for this function.") operator=;
		TopTools_IndexedDataMapOfShapeAddress & operator = (const TopTools_IndexedDataMapOfShapeAddress & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(Standard_Address)

Returns:
	Standard_Integer

No detailed docstring for this function.") Add;
		Standard_Integer Add (const TopoDS_Shape & K,const Standard_Address & I);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	K(TopoDS_Shape)
	T(Standard_Address)

Returns:
	None

No detailed docstring for this function.") Substitute;
		void Substitute (const Standard_Integer I,const TopoDS_Shape & K,const Standard_Address & T);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveLast;
		void RemoveLast ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") FindKey;
		const TopoDS_Shape & FindKey (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") FindFromIndex;
		const Standard_Address & FindFromIndex (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFromIndex;
		Standard_Address & ChangeFromIndex (const Standard_Integer I);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Integer

No detailed docstring for this function.") FindIndex;
		Standard_Integer FindIndex (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") FindFromKey;
		const Standard_Address & FindFromKey (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFromKey;
		Standard_Address & ChangeFromKey (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") FindFromKey1;
		Standard_Address FindFromKey1 (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFromKey1;
		Standard_Address ChangeFromKey1 (const TopoDS_Shape & K);
};


%feature("shadow") TopTools_IndexedDataMapOfShapeAddress::~TopTools_IndexedDataMapOfShapeAddress %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_IndexedDataMapOfShapeAddress {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopTools_IndexedDataMapOfShapeListOfShape;
class TopTools_IndexedDataMapOfShapeListOfShape : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TopTools_IndexedDataMapOfShapeListOfShape;
		 TopTools_IndexedDataMapOfShapeListOfShape (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TopTools_IndexedDataMapOfShapeListOfShape)

Returns:
	TopTools_IndexedDataMapOfShapeListOfShape

No detailed docstring for this function.") Assign;
		TopTools_IndexedDataMapOfShapeListOfShape & Assign (const TopTools_IndexedDataMapOfShapeListOfShape & Other);
		%feature("autodoc", "Args:
	Other(TopTools_IndexedDataMapOfShapeListOfShape)

Returns:
	TopTools_IndexedDataMapOfShapeListOfShape

No detailed docstring for this function.") operator=;
		TopTools_IndexedDataMapOfShapeListOfShape & operator = (const TopTools_IndexedDataMapOfShapeListOfShape & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(TopTools_ListOfShape)

Returns:
	Standard_Integer

No detailed docstring for this function.") Add;
		Standard_Integer Add (const TopoDS_Shape & K,const TopTools_ListOfShape & I);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	K(TopoDS_Shape)
	T(TopTools_ListOfShape)

Returns:
	None

No detailed docstring for this function.") Substitute;
		void Substitute (const Standard_Integer I,const TopoDS_Shape & K,const TopTools_ListOfShape & T);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveLast;
		void RemoveLast ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") FindKey;
		const TopoDS_Shape & FindKey (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") FindFromIndex;
		const TopTools_ListOfShape & FindFromIndex (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") ChangeFromIndex;
		TopTools_ListOfShape & ChangeFromIndex (const Standard_Integer I);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Integer

No detailed docstring for this function.") FindIndex;
		Standard_Integer FindIndex (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") FindFromKey;
		const TopTools_ListOfShape & FindFromKey (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") ChangeFromKey;
		TopTools_ListOfShape & ChangeFromKey (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") FindFromKey1;
		Standard_Address FindFromKey1 (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFromKey1;
		Standard_Address ChangeFromKey1 (const TopoDS_Shape & K);
};


%feature("shadow") TopTools_IndexedDataMapOfShapeListOfShape::~TopTools_IndexedDataMapOfShapeListOfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_IndexedDataMapOfShapeListOfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopTools_IndexedDataMapOfShapeShape;
class TopTools_IndexedDataMapOfShapeShape : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TopTools_IndexedDataMapOfShapeShape;
		 TopTools_IndexedDataMapOfShapeShape (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TopTools_IndexedDataMapOfShapeShape)

Returns:
	TopTools_IndexedDataMapOfShapeShape

No detailed docstring for this function.") Assign;
		TopTools_IndexedDataMapOfShapeShape & Assign (const TopTools_IndexedDataMapOfShapeShape & Other);
		%feature("autodoc", "Args:
	Other(TopTools_IndexedDataMapOfShapeShape)

Returns:
	TopTools_IndexedDataMapOfShapeShape

No detailed docstring for this function.") operator=;
		TopTools_IndexedDataMapOfShapeShape & operator = (const TopTools_IndexedDataMapOfShapeShape & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(TopoDS_Shape)

Returns:
	Standard_Integer

No detailed docstring for this function.") Add;
		Standard_Integer Add (const TopoDS_Shape & K,const TopoDS_Shape & I);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	K(TopoDS_Shape)
	T(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") Substitute;
		void Substitute (const Standard_Integer I,const TopoDS_Shape & K,const TopoDS_Shape & T);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveLast;
		void RemoveLast ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") FindKey;
		const TopoDS_Shape & FindKey (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") FindFromIndex;
		const TopoDS_Shape & FindFromIndex (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") ChangeFromIndex;
		TopoDS_Shape & ChangeFromIndex (const Standard_Integer I);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Integer

No detailed docstring for this function.") FindIndex;
		Standard_Integer FindIndex (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") FindFromKey;
		const TopoDS_Shape & FindFromKey (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") ChangeFromKey;
		TopoDS_Shape & ChangeFromKey (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") FindFromKey1;
		Standard_Address FindFromKey1 (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFromKey1;
		Standard_Address ChangeFromKey1 (const TopoDS_Shape & K);
};


%feature("shadow") TopTools_IndexedDataMapOfShapeShape::~TopTools_IndexedDataMapOfShapeShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_IndexedDataMapOfShapeShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopTools_IndexedMapNodeOfIndexedMapOfOrientedShape;
class TopTools_IndexedMapNodeOfIndexedMapOfOrientedShape : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K1(TopoDS_Shape)
	K2(Standard_Integer)
	n1(TCollection_MapNodePtr)
	n2(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopTools_IndexedMapNodeOfIndexedMapOfOrientedShape;
		 TopTools_IndexedMapNodeOfIndexedMapOfOrientedShape (const TopoDS_Shape & K1,const Standard_Integer K2,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key1;
		TopoDS_Shape & Key1 ();

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey2() {
                return (Standard_Integer) $self->Key2();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey2(Standard_Integer value ) {
                $self->Key2()=value;
                }
            };
            		%feature("autodoc", "Args:
	None
Returns:
	TCollection_MapNodePtr

No detailed docstring for this function.") Next2;
		TCollection_MapNodePtr & Next2 ();
};


%feature("shadow") TopTools_IndexedMapNodeOfIndexedMapOfOrientedShape::~TopTools_IndexedMapNodeOfIndexedMapOfOrientedShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_IndexedMapNodeOfIndexedMapOfOrientedShape {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopTools_IndexedMapNodeOfIndexedMapOfOrientedShape {
	Handle_TopTools_IndexedMapNodeOfIndexedMapOfOrientedShape GetHandle() {
	return *(Handle_TopTools_IndexedMapNodeOfIndexedMapOfOrientedShape*) &$self;
	}
};

%nodefaultctor Handle_TopTools_IndexedMapNodeOfIndexedMapOfOrientedShape;
class Handle_TopTools_IndexedMapNodeOfIndexedMapOfOrientedShape : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopTools_IndexedMapNodeOfIndexedMapOfOrientedShape();
        Handle_TopTools_IndexedMapNodeOfIndexedMapOfOrientedShape(const Handle_TopTools_IndexedMapNodeOfIndexedMapOfOrientedShape &aHandle);
        Handle_TopTools_IndexedMapNodeOfIndexedMapOfOrientedShape(const TopTools_IndexedMapNodeOfIndexedMapOfOrientedShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopTools_IndexedMapNodeOfIndexedMapOfOrientedShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopTools_IndexedMapNodeOfIndexedMapOfOrientedShape {
    TopTools_IndexedMapNodeOfIndexedMapOfOrientedShape* GetObject() {
    return (TopTools_IndexedMapNodeOfIndexedMapOfOrientedShape*)$self->Access();
    }
};
%feature("shadow") Handle_TopTools_IndexedMapNodeOfIndexedMapOfOrientedShape::~Handle_TopTools_IndexedMapNodeOfIndexedMapOfOrientedShape %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopTools_IndexedMapNodeOfIndexedMapOfOrientedShape {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopTools_IndexedMapNodeOfIndexedMapOfShape;
class TopTools_IndexedMapNodeOfIndexedMapOfShape : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K1(TopoDS_Shape)
	K2(Standard_Integer)
	n1(TCollection_MapNodePtr)
	n2(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopTools_IndexedMapNodeOfIndexedMapOfShape;
		 TopTools_IndexedMapNodeOfIndexedMapOfShape (const TopoDS_Shape & K1,const Standard_Integer K2,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key1;
		TopoDS_Shape & Key1 ();

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey2() {
                return (Standard_Integer) $self->Key2();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey2(Standard_Integer value ) {
                $self->Key2()=value;
                }
            };
            		%feature("autodoc", "Args:
	None
Returns:
	TCollection_MapNodePtr

No detailed docstring for this function.") Next2;
		TCollection_MapNodePtr & Next2 ();
};


%feature("shadow") TopTools_IndexedMapNodeOfIndexedMapOfShape::~TopTools_IndexedMapNodeOfIndexedMapOfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_IndexedMapNodeOfIndexedMapOfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopTools_IndexedMapNodeOfIndexedMapOfShape {
	Handle_TopTools_IndexedMapNodeOfIndexedMapOfShape GetHandle() {
	return *(Handle_TopTools_IndexedMapNodeOfIndexedMapOfShape*) &$self;
	}
};

%nodefaultctor Handle_TopTools_IndexedMapNodeOfIndexedMapOfShape;
class Handle_TopTools_IndexedMapNodeOfIndexedMapOfShape : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopTools_IndexedMapNodeOfIndexedMapOfShape();
        Handle_TopTools_IndexedMapNodeOfIndexedMapOfShape(const Handle_TopTools_IndexedMapNodeOfIndexedMapOfShape &aHandle);
        Handle_TopTools_IndexedMapNodeOfIndexedMapOfShape(const TopTools_IndexedMapNodeOfIndexedMapOfShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopTools_IndexedMapNodeOfIndexedMapOfShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopTools_IndexedMapNodeOfIndexedMapOfShape {
    TopTools_IndexedMapNodeOfIndexedMapOfShape* GetObject() {
    return (TopTools_IndexedMapNodeOfIndexedMapOfShape*)$self->Access();
    }
};
%feature("shadow") Handle_TopTools_IndexedMapNodeOfIndexedMapOfShape::~Handle_TopTools_IndexedMapNodeOfIndexedMapOfShape %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopTools_IndexedMapNodeOfIndexedMapOfShape {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopTools_IndexedMapOfOrientedShape;
class TopTools_IndexedMapOfOrientedShape : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TopTools_IndexedMapOfOrientedShape;
		 TopTools_IndexedMapOfOrientedShape (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TopTools_IndexedMapOfOrientedShape)

Returns:
	TopTools_IndexedMapOfOrientedShape

No detailed docstring for this function.") Assign;
		TopTools_IndexedMapOfOrientedShape & Assign (const TopTools_IndexedMapOfOrientedShape & Other);
		%feature("autodoc", "Args:
	Other(TopTools_IndexedMapOfOrientedShape)

Returns:
	TopTools_IndexedMapOfOrientedShape

No detailed docstring for this function.") operator=;
		TopTools_IndexedMapOfOrientedShape & operator = (const TopTools_IndexedMapOfOrientedShape & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Integer

No detailed docstring for this function.") Add;
		Standard_Integer Add (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	K(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") Substitute;
		void Substitute (const Standard_Integer I,const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveLast;
		void RemoveLast ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") FindKey;
		const TopoDS_Shape & FindKey (const Standard_Integer I);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Integer

No detailed docstring for this function.") FindIndex;
		Standard_Integer FindIndex (const TopoDS_Shape & K);
};


%feature("shadow") TopTools_IndexedMapOfOrientedShape::~TopTools_IndexedMapOfOrientedShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_IndexedMapOfOrientedShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopTools_IndexedMapOfShape;
class TopTools_IndexedMapOfShape : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TopTools_IndexedMapOfShape;
		 TopTools_IndexedMapOfShape (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TopTools_IndexedMapOfShape)

Returns:
	TopTools_IndexedMapOfShape

No detailed docstring for this function.") Assign;
		TopTools_IndexedMapOfShape & Assign (const TopTools_IndexedMapOfShape & Other);
		%feature("autodoc", "Args:
	Other(TopTools_IndexedMapOfShape)

Returns:
	TopTools_IndexedMapOfShape

No detailed docstring for this function.") operator=;
		TopTools_IndexedMapOfShape & operator = (const TopTools_IndexedMapOfShape & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Integer

No detailed docstring for this function.") Add;
		Standard_Integer Add (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	K(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") Substitute;
		void Substitute (const Standard_Integer I,const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveLast;
		void RemoveLast ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") FindKey;
		const TopoDS_Shape & FindKey (const Standard_Integer I);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Integer

No detailed docstring for this function.") FindIndex;
		Standard_Integer FindIndex (const TopoDS_Shape & K);
};


%feature("shadow") TopTools_IndexedMapOfShape::~TopTools_IndexedMapOfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_IndexedMapOfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopTools_ListIteratorOfListOfShape;
class TopTools_ListIteratorOfListOfShape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopTools_ListIteratorOfListOfShape;
		 TopTools_ListIteratorOfListOfShape ();
		%feature("autodoc", "Args:
	L(TopTools_ListOfShape)

Returns:
	None

No detailed docstring for this function.") TopTools_ListIteratorOfListOfShape;
		 TopTools_ListIteratorOfListOfShape (const TopTools_ListOfShape & L);
		%feature("autodoc", "Args:
	L(TopTools_ListOfShape)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopTools_ListOfShape & L);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Value;
		TopoDS_Shape & Value ();
};


%feature("shadow") TopTools_ListIteratorOfListOfShape::~TopTools_ListIteratorOfListOfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_ListIteratorOfListOfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopTools_ListNodeOfListOfShape;
class TopTools_ListNodeOfListOfShape : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	I(TopoDS_Shape)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopTools_ListNodeOfListOfShape;
		 TopTools_ListNodeOfListOfShape (const TopoDS_Shape & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Value;
		TopoDS_Shape & Value ();
};


%feature("shadow") TopTools_ListNodeOfListOfShape::~TopTools_ListNodeOfListOfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_ListNodeOfListOfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopTools_ListNodeOfListOfShape {
	Handle_TopTools_ListNodeOfListOfShape GetHandle() {
	return *(Handle_TopTools_ListNodeOfListOfShape*) &$self;
	}
};

%nodefaultctor Handle_TopTools_ListNodeOfListOfShape;
class Handle_TopTools_ListNodeOfListOfShape : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopTools_ListNodeOfListOfShape();
        Handle_TopTools_ListNodeOfListOfShape(const Handle_TopTools_ListNodeOfListOfShape &aHandle);
        Handle_TopTools_ListNodeOfListOfShape(const TopTools_ListNodeOfListOfShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopTools_ListNodeOfListOfShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopTools_ListNodeOfListOfShape {
    TopTools_ListNodeOfListOfShape* GetObject() {
    return (TopTools_ListNodeOfListOfShape*)$self->Access();
    }
};
%feature("shadow") Handle_TopTools_ListNodeOfListOfShape::~Handle_TopTools_ListNodeOfListOfShape %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopTools_ListNodeOfListOfShape {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopTools_ListOfShape;
class TopTools_ListOfShape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopTools_ListOfShape;
		 TopTools_ListOfShape ();
		%feature("autodoc", "Args:
	Other(TopTools_ListOfShape)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const TopTools_ListOfShape & Other);
		%feature("autodoc", "Args:
	Other(TopTools_ListOfShape)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const TopTools_ListOfShape & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
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
	I(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const TopoDS_Shape & I);
		%feature("autodoc", "Args:
	I(TopoDS_Shape)
	theIt(TopTools_ListIteratorOfListOfShape)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const TopoDS_Shape & I,TopTools_ListIteratorOfListOfShape & theIt);
		%feature("autodoc", "Args:
	Other(TopTools_ListOfShape)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (TopTools_ListOfShape & Other);
		%feature("autodoc", "Args:
	I(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const TopoDS_Shape & I);
		%feature("autodoc", "Args:
	I(TopoDS_Shape)
	theIt(TopTools_ListIteratorOfListOfShape)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const TopoDS_Shape & I,TopTools_ListIteratorOfListOfShape & theIt);
		%feature("autodoc", "Args:
	Other(TopTools_ListOfShape)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (TopTools_ListOfShape & Other);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") First;
		TopoDS_Shape & First ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Last;
		TopoDS_Shape & Last ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(TopTools_ListIteratorOfListOfShape)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (TopTools_ListIteratorOfListOfShape & It);
		%feature("autodoc", "Args:
	I(TopoDS_Shape)
	It(TopTools_ListIteratorOfListOfShape)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const TopoDS_Shape & I,TopTools_ListIteratorOfListOfShape & It);
		%feature("autodoc", "Args:
	Other(TopTools_ListOfShape)
	It(TopTools_ListIteratorOfListOfShape)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (TopTools_ListOfShape & Other,TopTools_ListIteratorOfListOfShape & It);
		%feature("autodoc", "Args:
	I(TopoDS_Shape)
	It(TopTools_ListIteratorOfListOfShape)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const TopoDS_Shape & I,TopTools_ListIteratorOfListOfShape & It);
		%feature("autodoc", "Args:
	Other(TopTools_ListOfShape)
	It(TopTools_ListIteratorOfListOfShape)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (TopTools_ListOfShape & Other,TopTools_ListIteratorOfListOfShape & It);
};


%feature("shadow") TopTools_ListOfShape::~TopTools_ListOfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_ListOfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopTools_LocationSet;
class TopTools_LocationSet {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Returns an empty set of locations.") TopTools_LocationSet;
		 TopTools_LocationSet ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Clears the content of the set.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	L(TopLoc_Location)

Returns:
	Standard_Integer

Incorporate a new Location in the  set and returns  
         its index.") Add;
		Standard_Integer Add (const TopLoc_Location & L);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopLoc_Location

Returns the location of index <I>.") Location;
		const TopLoc_Location & Location (const Standard_Integer I);
		%feature("autodoc", "Args:
	L(TopLoc_Location)

Returns:
	Standard_Integer

Returns the index of <L>.") Index;
		Standard_Integer Index (const TopLoc_Location & L);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        
        %feature("autodoc", "1");
        %extend{
            std::string WriteToString() {
            std::stringstream s;
            self->Write(s);
            return s.str();}
        };
        
        %feature("autodoc", "1");
        %extend{
            void ReadFromString(std::string src) {
            std::stringstream s(src);
            self->Read(s);}
        };
        		%feature("autodoc", "Args:
	PR(Handle_Message_ProgressIndicator)

Returns:
	None

No detailed docstring for this function.") SetProgress;
		void SetProgress (const Handle_Message_ProgressIndicator & PR);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Message_ProgressIndicator

No detailed docstring for this function.") GetProgress;
		Handle_Message_ProgressIndicator GetProgress ();
};


%feature("shadow") TopTools_LocationSet::~TopTools_LocationSet %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_LocationSet {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopTools_MapIteratorOfMapOfOrientedShape;
class TopTools_MapIteratorOfMapOfOrientedShape : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopTools_MapIteratorOfMapOfOrientedShape;
		 TopTools_MapIteratorOfMapOfOrientedShape ();
		%feature("autodoc", "Args:
	aMap(TopTools_MapOfOrientedShape)

Returns:
	None

No detailed docstring for this function.") TopTools_MapIteratorOfMapOfOrientedShape;
		 TopTools_MapIteratorOfMapOfOrientedShape (const TopTools_MapOfOrientedShape & aMap);
		%feature("autodoc", "Args:
	aMap(TopTools_MapOfOrientedShape)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopTools_MapOfOrientedShape & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		const TopoDS_Shape & Key ();
};


%feature("shadow") TopTools_MapIteratorOfMapOfOrientedShape::~TopTools_MapIteratorOfMapOfOrientedShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_MapIteratorOfMapOfOrientedShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopTools_MapIteratorOfMapOfShape;
class TopTools_MapIteratorOfMapOfShape : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopTools_MapIteratorOfMapOfShape;
		 TopTools_MapIteratorOfMapOfShape ();
		%feature("autodoc", "Args:
	aMap(TopTools_MapOfShape)

Returns:
	None

No detailed docstring for this function.") TopTools_MapIteratorOfMapOfShape;
		 TopTools_MapIteratorOfMapOfShape (const TopTools_MapOfShape & aMap);
		%feature("autodoc", "Args:
	aMap(TopTools_MapOfShape)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopTools_MapOfShape & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		const TopoDS_Shape & Key ();
};


%feature("shadow") TopTools_MapIteratorOfMapOfShape::~TopTools_MapIteratorOfMapOfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_MapIteratorOfMapOfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopTools_MapOfOrientedShape;
class TopTools_MapOfOrientedShape : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TopTools_MapOfOrientedShape;
		 TopTools_MapOfOrientedShape (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TopTools_MapOfOrientedShape)

Returns:
	TopTools_MapOfOrientedShape

No detailed docstring for this function.") Assign;
		TopTools_MapOfOrientedShape & Assign (const TopTools_MapOfOrientedShape & Other);
		%feature("autodoc", "Args:
	Other(TopTools_MapOfOrientedShape)

Returns:
	TopTools_MapOfOrientedShape

No detailed docstring for this function.") operator=;
		TopTools_MapOfOrientedShape & operator = (const TopTools_MapOfOrientedShape & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	aKey(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Add;
		Standard_Boolean Add (const TopoDS_Shape & aKey);
		%feature("autodoc", "Args:
	aKey(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (const TopoDS_Shape & aKey);
		%feature("autodoc", "Args:
	aKey(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Remove;
		Standard_Boolean Remove (const TopoDS_Shape & aKey);
};


%feature("shadow") TopTools_MapOfOrientedShape::~TopTools_MapOfOrientedShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_MapOfOrientedShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopTools_MapOfShape;
class TopTools_MapOfShape : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") TopTools_MapOfShape;
		 TopTools_MapOfShape (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(TopTools_MapOfShape)

Returns:
	TopTools_MapOfShape

No detailed docstring for this function.") Assign;
		TopTools_MapOfShape & Assign (const TopTools_MapOfShape & Other);
		%feature("autodoc", "Args:
	Other(TopTools_MapOfShape)

Returns:
	TopTools_MapOfShape

No detailed docstring for this function.") operator=;
		TopTools_MapOfShape & operator = (const TopTools_MapOfShape & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	aKey(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Add;
		Standard_Boolean Add (const TopoDS_Shape & aKey);
		%feature("autodoc", "Args:
	aKey(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (const TopoDS_Shape & aKey);
		%feature("autodoc", "Args:
	aKey(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Remove;
		Standard_Boolean Remove (const TopoDS_Shape & aKey);
};


%feature("shadow") TopTools_MapOfShape::~TopTools_MapOfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_MapOfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopTools_MutexForShapeProvider;
class TopTools_MutexForShapeProvider {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Constructor") TopTools_MutexForShapeProvider;
		 TopTools_MutexForShapeProvider ();
		%feature("autodoc", "Args:
	theShape(TopoDS_Shape)
	theType(TopAbs_ShapeEnum)

Returns:
	None

Creates and associates mutexes with each sub-shape of type theType in theShape.") CreateMutexesForSubShapes;
		void CreateMutexesForSubShapes (const TopoDS_Shape & theShape,const TopAbs_ShapeEnum theType);
		%feature("autodoc", "Args:
	theShape(TopoDS_Shape)

Returns:
	None

Creates and associates mutex with theShape") CreateMutexForShape;
		void CreateMutexForShape (const TopoDS_Shape & theShape);
		%feature("autodoc", "Args:
	theShape(TopoDS_Shape)

Returns:
	Standard_Mutex *

Returns pointer to mutex associated with theShape.
In case when mutex not found returns NULL.") GetMutex;
		Standard_Mutex * GetMutex (const TopoDS_Shape & theShape);
		%feature("autodoc", "Args:
	None
Returns:
	None

Removes all mutexes") RemoveAllMutexes;
		void RemoveAllMutexes ();
};


%feature("shadow") TopTools_MutexForShapeProvider::~TopTools_MutexForShapeProvider %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_MutexForShapeProvider {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopTools_OrientedShapeMapHasher;
class TopTools_OrientedShapeMapHasher {
	public:
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	Upper(Standard_Integer)

Returns:
	static Standard_Integer

Returns a HasCode value  for  the  Key <K>  in the  
         range 0..Upper.") HashCode;
		static Standard_Integer HashCode (const TopoDS_Shape & S,const Standard_Integer Upper);
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)

Returns:
	static Standard_Boolean

Returns True when the two keys are equal. Two same  
         keys must have the same hashcode,  the contrary is  
         not necessary.") IsEqual;
		static Standard_Boolean IsEqual (const TopoDS_Shape & S1,const TopoDS_Shape & S2);
};


%feature("shadow") TopTools_OrientedShapeMapHasher::~TopTools_OrientedShapeMapHasher %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_OrientedShapeMapHasher {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopTools_SequenceNodeOfSequenceOfShape;
class TopTools_SequenceNodeOfSequenceOfShape : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(TopoDS_Shape)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") TopTools_SequenceNodeOfSequenceOfShape;
		 TopTools_SequenceNodeOfSequenceOfShape (const TopoDS_Shape & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Value;
		TopoDS_Shape & Value ();
};


%feature("shadow") TopTools_SequenceNodeOfSequenceOfShape::~TopTools_SequenceNodeOfSequenceOfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_SequenceNodeOfSequenceOfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopTools_SequenceNodeOfSequenceOfShape {
	Handle_TopTools_SequenceNodeOfSequenceOfShape GetHandle() {
	return *(Handle_TopTools_SequenceNodeOfSequenceOfShape*) &$self;
	}
};

%nodefaultctor Handle_TopTools_SequenceNodeOfSequenceOfShape;
class Handle_TopTools_SequenceNodeOfSequenceOfShape : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_TopTools_SequenceNodeOfSequenceOfShape();
        Handle_TopTools_SequenceNodeOfSequenceOfShape(const Handle_TopTools_SequenceNodeOfSequenceOfShape &aHandle);
        Handle_TopTools_SequenceNodeOfSequenceOfShape(const TopTools_SequenceNodeOfSequenceOfShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopTools_SequenceNodeOfSequenceOfShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopTools_SequenceNodeOfSequenceOfShape {
    TopTools_SequenceNodeOfSequenceOfShape* GetObject() {
    return (TopTools_SequenceNodeOfSequenceOfShape*)$self->Access();
    }
};
%feature("shadow") Handle_TopTools_SequenceNodeOfSequenceOfShape::~Handle_TopTools_SequenceNodeOfSequenceOfShape %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopTools_SequenceNodeOfSequenceOfShape {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopTools_SequenceOfShape;
class TopTools_SequenceOfShape : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopTools_SequenceOfShape;
		 TopTools_SequenceOfShape ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(TopTools_SequenceOfShape)

Returns:
	TopTools_SequenceOfShape

No detailed docstring for this function.") Assign;
		const TopTools_SequenceOfShape & Assign (const TopTools_SequenceOfShape & Other);
		%feature("autodoc", "Args:
	Other(TopTools_SequenceOfShape)

Returns:
	TopTools_SequenceOfShape

No detailed docstring for this function.") operator=;
		const TopTools_SequenceOfShape & operator = (const TopTools_SequenceOfShape & Other);
		%feature("autodoc", "Args:
	T(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const TopoDS_Shape & T);
		%feature("autodoc", "Args:
	S(TopTools_SequenceOfShape)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (TopTools_SequenceOfShape & S);
		%feature("autodoc", "Args:
	T(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const TopoDS_Shape & T);
		%feature("autodoc", "Args:
	S(TopTools_SequenceOfShape)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (TopTools_SequenceOfShape & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const TopoDS_Shape & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(TopTools_SequenceOfShape)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TopTools_SequenceOfShape & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const TopoDS_Shape & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(TopTools_SequenceOfShape)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TopTools_SequenceOfShape & S);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") First;
		const TopoDS_Shape & First ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Last;
		const TopoDS_Shape & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(TopTools_SequenceOfShape)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,TopTools_SequenceOfShape & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") Value;
		const TopoDS_Shape & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const TopoDS_Shape & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") ChangeValue;
		TopoDS_Shape & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") TopTools_SequenceOfShape::~TopTools_SequenceOfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_SequenceOfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopTools_ShapeMapHasher;
class TopTools_ShapeMapHasher {
	public:
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	Upper(Standard_Integer)

Returns:
	static Standard_Integer

Returns a HasCode value  for  the  Key <K>  in the  
         range 0..Upper.") HashCode;
		static Standard_Integer HashCode (const TopoDS_Shape & S,const Standard_Integer Upper);
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)

Returns:
	static Standard_Boolean

Returns True  when the two  keys are the same. Two  
         same  keys  must   have  the  same  hashcode,  the  
         contrary is not necessary.") IsEqual;
		static Standard_Boolean IsEqual (const TopoDS_Shape & S1,const TopoDS_Shape & S2);
};


%feature("shadow") TopTools_ShapeMapHasher::~TopTools_ShapeMapHasher %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_ShapeMapHasher {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopTools_ShapeSet;
class TopTools_ShapeSet {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Builds an empty ShapeSet.") TopTools_ShapeSet;
		 TopTools_ShapeSet ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") Delete;
		virtual void Delete ();
		%feature("autodoc", "Args:
	theFormatNb(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetFormatNb;
		void SetFormatNb (const Standard_Integer theFormatNb);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

two formats available for the moment:  
         First: does not write CurveOnSurface UV Points into the file  
                on reading calls Check() method.  
         Second: stores CurveOnSurface UV Points.  
         On reading format is recognized from Version string.") FormatNb;
		Standard_Integer FormatNb ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Clears the content of the set.  This method can be  
         redefined.") Clear;
		virtual void Clear ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	Standard_Integer

Stores <S> and its sub-shape. Returns the index of <S>.  
         The method AddGeometry is called on each sub-shape.") Add;
		Standard_Integer Add (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopoDS_Shape

Returns the sub-shape of index <I>.") Shape;
		const TopoDS_Shape & Shape (const Standard_Integer I);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	Standard_Integer

Returns the index of <S>.") Index;
		Standard_Integer Index (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_LocationSet

No detailed docstring for this function.") Locations;
		const TopTools_LocationSet & Locations ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_LocationSet

No detailed docstring for this function.") ChangeLocations;
		TopTools_LocationSet & ChangeLocations ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpExtentToString() {
            std::stringstream s;
            self->DumpExtent(s);
            return s.str();}
        };
        		%feature("autodoc", "Args:
	S(TCollection_AsciiString)

Returns:
	None

Dumps the number of objects in me in the string S  
(Number of shapes of each type)") DumpExtent;
		void DumpExtent (TCollection_AsciiString & S);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        
        %feature("autodoc", "1");
        %extend{
            std::string WriteToString() {
            std::stringstream s;
            self->Write(s);
            return s.str();}
        };
        
        %feature("autodoc", "1");
        %extend{
            void ReadFromString(std::string src) {
            std::stringstream s(src);
            self->Read(s);}
        };
        		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	OS(Standard_OStream)

Returns:
	None

Dumps   on  <OS>    the  shape  <S>.   Dumps   the  
         orientation, the index of the TShape and the index  
         of the Location.") Dump;
		void Dump (const TopoDS_Shape & S,Standard_OStream & OS);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	OS(Standard_OStream)

Returns:
	None

Writes   on  <OS>   the shape   <S>.    Writes the  
         orientation, the index of the TShape and the index  
         of the Location.") Write;
		void Write (const TopoDS_Shape & S,Standard_OStream & OS);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	IS(Standard_IStream)

Returns:
	None

Reads from <IS> a shape and returns it in S.") Read;
		void Read (TopoDS_Shape & S,Standard_IStream & IS);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	virtual void

Stores the geometry of <S>.") AddGeometry;
		virtual void AddGeometry (const TopoDS_Shape & S);

        %feature("autodoc", "1");
        %extend{
            std::string DumpGeometryToString() {
            std::stringstream s;
            self->DumpGeometry(s);
            return s.str();}
        };
        
        %feature("autodoc", "1");
        %extend{
            std::string WriteGeometryToString() {
            std::stringstream s;
            self->WriteGeometry(s);
            return s.str();}
        };
        
        %feature("autodoc", "1");
        %extend{
            void ReadGeometryFromString(std::string src) {
            std::stringstream s(src);
            self->ReadGeometry(s);}
        };
        		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	OS(Standard_OStream)

Returns:
	virtual void

Dumps the geometry of <S> on the stream <OS>.") DumpGeometry;
		virtual void DumpGeometry (const TopoDS_Shape & S,Standard_OStream & OS);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	OS(Standard_OStream)

Returns:
	virtual void

Writes the geometry of <S>  on the stream <OS> in a  
         format that can be read back by Read.") WriteGeometry;
		virtual void WriteGeometry (const TopoDS_Shape & S,Standard_OStream & OS);
		%feature("autodoc", "Args:
	T(TopAbs_ShapeEnum)
	IS(Standard_IStream)
	S(TopoDS_Shape)

Returns:
	virtual void

Reads the geometry of a shape of type <T> from the  
         stream <IS> and returns it in <S>.") ReadGeometry;
		virtual void ReadGeometry (const TopAbs_ShapeEnum T,Standard_IStream & IS,TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)

Returns:
	virtual void

Inserts  the shape <S2> in  the  shape <S1>.  This  
         method must be   redefined  to  use   the  correct  
         builder.") AddShapes;
		virtual void AddShapes (TopoDS_Shape & S1,const TopoDS_Shape & S2);
		%feature("autodoc", "Args:
	T(TopAbs_ShapeEnum)
	S(TopoDS_Shape)

Returns:
	virtual void

This method is   called after  each  new  completed  
         shape. <T> is the  type. <S> is  the shape. In this  
         class it does nothing, but it gives the opportunity  
         in derived  classes to perform  extra  treatment on  
         shapes.") Check;
		virtual void Check (const TopAbs_ShapeEnum T,TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

//!Returns number of shapes read from file.") NbShapes;
		Standard_Integer NbShapes ();
		%feature("autodoc", "Args:
	PR(Handle_Message_ProgressIndicator)

Returns:
	None

No detailed docstring for this function.") SetProgress;
		void SetProgress (const Handle_Message_ProgressIndicator & PR);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Message_ProgressIndicator

No detailed docstring for this function.") GetProgress;
		Handle_Message_ProgressIndicator GetProgress ();
};


%feature("shadow") TopTools_ShapeSet::~TopTools_ShapeSet %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_ShapeSet {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopTools_StdMapNodeOfMapOfOrientedShape;
class TopTools_StdMapNodeOfMapOfOrientedShape : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopTools_StdMapNodeOfMapOfOrientedShape;
		 TopTools_StdMapNodeOfMapOfOrientedShape (const TopoDS_Shape & K,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		TopoDS_Shape & Key ();
};


%feature("shadow") TopTools_StdMapNodeOfMapOfOrientedShape::~TopTools_StdMapNodeOfMapOfOrientedShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_StdMapNodeOfMapOfOrientedShape {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopTools_StdMapNodeOfMapOfOrientedShape {
	Handle_TopTools_StdMapNodeOfMapOfOrientedShape GetHandle() {
	return *(Handle_TopTools_StdMapNodeOfMapOfOrientedShape*) &$self;
	}
};

%nodefaultctor Handle_TopTools_StdMapNodeOfMapOfOrientedShape;
class Handle_TopTools_StdMapNodeOfMapOfOrientedShape : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopTools_StdMapNodeOfMapOfOrientedShape();
        Handle_TopTools_StdMapNodeOfMapOfOrientedShape(const Handle_TopTools_StdMapNodeOfMapOfOrientedShape &aHandle);
        Handle_TopTools_StdMapNodeOfMapOfOrientedShape(const TopTools_StdMapNodeOfMapOfOrientedShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopTools_StdMapNodeOfMapOfOrientedShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopTools_StdMapNodeOfMapOfOrientedShape {
    TopTools_StdMapNodeOfMapOfOrientedShape* GetObject() {
    return (TopTools_StdMapNodeOfMapOfOrientedShape*)$self->Access();
    }
};
%feature("shadow") Handle_TopTools_StdMapNodeOfMapOfOrientedShape::~Handle_TopTools_StdMapNodeOfMapOfOrientedShape %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopTools_StdMapNodeOfMapOfOrientedShape {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopTools_StdMapNodeOfMapOfShape;
class TopTools_StdMapNodeOfMapOfShape : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopTools_StdMapNodeOfMapOfShape;
		 TopTools_StdMapNodeOfMapOfShape (const TopoDS_Shape & K,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		TopoDS_Shape & Key ();
};


%feature("shadow") TopTools_StdMapNodeOfMapOfShape::~TopTools_StdMapNodeOfMapOfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTools_StdMapNodeOfMapOfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopTools_StdMapNodeOfMapOfShape {
	Handle_TopTools_StdMapNodeOfMapOfShape GetHandle() {
	return *(Handle_TopTools_StdMapNodeOfMapOfShape*) &$self;
	}
};

%nodefaultctor Handle_TopTools_StdMapNodeOfMapOfShape;
class Handle_TopTools_StdMapNodeOfMapOfShape : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopTools_StdMapNodeOfMapOfShape();
        Handle_TopTools_StdMapNodeOfMapOfShape(const Handle_TopTools_StdMapNodeOfMapOfShape &aHandle);
        Handle_TopTools_StdMapNodeOfMapOfShape(const TopTools_StdMapNodeOfMapOfShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopTools_StdMapNodeOfMapOfShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopTools_StdMapNodeOfMapOfShape {
    TopTools_StdMapNodeOfMapOfShape* GetObject() {
    return (TopTools_StdMapNodeOfMapOfShape*)$self->Access();
    }
};
%feature("shadow") Handle_TopTools_StdMapNodeOfMapOfShape::~Handle_TopTools_StdMapNodeOfMapOfShape %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopTools_StdMapNodeOfMapOfShape {
    void _kill_pointed() {
        delete $self;
    }
};

