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
		%feature("autodoc", "	* A set of Shapes. Can be dump, wrote or read. Dumps the topological structure of <Sh> on the stream <S>.

	:param Sh:
	:type Sh: TopoDS_Shape &
	:param S:
	:type S: Standard_OStream &
	:rtype: void
") Dump;
		static void Dump (const TopoDS_Shape & Sh,Standard_OStream & S);
		%feature("autodoc", "	* This is to bypass an extraction bug. It will force the inclusion of Standard_Integer.hxx itself including Standard_OStream.hxx at the correct position.

	:param I:
	:type I: Standard_Integer
	:rtype: void
") Dummy;
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
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") TopTools_Array1OfListOfShape;
		 TopTools_Array1OfListOfShape (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Item:
	:type Item: TopTools_ListOfShape &
	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") TopTools_Array1OfListOfShape;
		 TopTools_Array1OfListOfShape (const TopTools_ListOfShape & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param V:
	:type V: TopTools_ListOfShape &
	:rtype: None
") Init;
		void Init (const TopTools_ListOfShape & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_Array1OfListOfShape &
	:rtype: TopTools_Array1OfListOfShape
") Assign;
		const TopTools_Array1OfListOfShape & Assign (const TopTools_Array1OfListOfShape & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_Array1OfListOfShape &
	:rtype: TopTools_Array1OfListOfShape
") operator=;
		const TopTools_Array1OfListOfShape & operator = (const TopTools_Array1OfListOfShape & Other);
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
	:type Value: TopTools_ListOfShape &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const TopTools_ListOfShape & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: TopTools_ListOfShape
") Value;
		const TopTools_ListOfShape & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: TopTools_ListOfShape
") ChangeValue;
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
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") TopTools_Array1OfShape;
		 TopTools_Array1OfShape (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Item:
	:type Item: TopoDS_Shape &
	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") TopTools_Array1OfShape;
		 TopTools_Array1OfShape (const TopoDS_Shape & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param V:
	:type V: TopoDS_Shape &
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_Array1OfShape &
	:rtype: TopTools_Array1OfShape
") Assign;
		const TopTools_Array1OfShape & Assign (const TopTools_Array1OfShape & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_Array1OfShape &
	:rtype: TopTools_Array1OfShape
") operator=;
		const TopTools_Array1OfShape & operator = (const TopTools_Array1OfShape & Other);
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
	:type Value: TopoDS_Shape &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const TopoDS_Shape & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: TopoDS_Shape
") Value;
		const TopoDS_Shape  Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: TopoDS_Shape
") ChangeValue;
		TopoDS_Shape  ChangeValue (const Standard_Integer Index);
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
		%feature("autodoc", "	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:rtype: None
") TopTools_Array2OfShape;
		 TopTools_Array2OfShape (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "	:param Item:
	:type Item: TopoDS_Shape &
	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:rtype: None
") TopTools_Array2OfShape;
		 TopTools_Array2OfShape (const TopoDS_Shape & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "	:param V:
	:type V: TopoDS_Shape &
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_Array2OfShape &
	:rtype: TopTools_Array2OfShape
") Assign;
		const TopTools_Array2OfShape & Assign (const TopTools_Array2OfShape & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_Array2OfShape &
	:rtype: TopTools_Array2OfShape
") operator=;
		const TopTools_Array2OfShape & operator = (const TopTools_Array2OfShape & Other);
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
	:type Value: TopoDS_Shape &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const TopoDS_Shape & Value);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: TopoDS_Shape
") Value;
		const TopoDS_Shape  Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: TopoDS_Shape
") ChangeValue;
		TopoDS_Shape  ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
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
		%feature("autodoc", "	:rtype: None
") TopTools_DataMapIteratorOfDataMapOfIntegerListOfShape;
		 TopTools_DataMapIteratorOfDataMapOfIntegerListOfShape ();
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_DataMapOfIntegerListOfShape &
	:rtype: None
") TopTools_DataMapIteratorOfDataMapOfIntegerListOfShape;
		 TopTools_DataMapIteratorOfDataMapOfIntegerListOfShape (const TopTools_DataMapOfIntegerListOfShape & aMap);
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_DataMapOfIntegerListOfShape &
	:rtype: None
") Initialize;
		void Initialize (const TopTools_DataMapOfIntegerListOfShape & aMap);
		%feature("autodoc", "	:rtype: int
") Key;
		const Standard_Integer & Key ();
		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") Value;
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
		%feature("autodoc", "	:rtype: None
") TopTools_DataMapIteratorOfDataMapOfIntegerShape;
		 TopTools_DataMapIteratorOfDataMapOfIntegerShape ();
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_DataMapOfIntegerShape &
	:rtype: None
") TopTools_DataMapIteratorOfDataMapOfIntegerShape;
		 TopTools_DataMapIteratorOfDataMapOfIntegerShape (const TopTools_DataMapOfIntegerShape & aMap);
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_DataMapOfIntegerShape &
	:rtype: None
") Initialize;
		void Initialize (const TopTools_DataMapOfIntegerShape & aMap);
		%feature("autodoc", "	:rtype: int
") Key;
		const Standard_Integer & Key ();
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Value;
		const TopoDS_Shape  Value ();
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
		%feature("autodoc", "	:rtype: None
") TopTools_DataMapIteratorOfDataMapOfOrientedShapeInteger;
		 TopTools_DataMapIteratorOfDataMapOfOrientedShapeInteger ();
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_DataMapOfOrientedShapeInteger &
	:rtype: None
") TopTools_DataMapIteratorOfDataMapOfOrientedShapeInteger;
		 TopTools_DataMapIteratorOfDataMapOfOrientedShapeInteger (const TopTools_DataMapOfOrientedShapeInteger & aMap);
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_DataMapOfOrientedShapeInteger &
	:rtype: None
") Initialize;
		void Initialize (const TopTools_DataMapOfOrientedShapeInteger & aMap);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("autodoc", "	:rtype: int
") Value;
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
		%feature("autodoc", "	:rtype: None
") TopTools_DataMapIteratorOfDataMapOfOrientedShapeShape;
		 TopTools_DataMapIteratorOfDataMapOfOrientedShapeShape ();
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_DataMapOfOrientedShapeShape &
	:rtype: None
") TopTools_DataMapIteratorOfDataMapOfOrientedShapeShape;
		 TopTools_DataMapIteratorOfDataMapOfOrientedShapeShape (const TopTools_DataMapOfOrientedShapeShape & aMap);
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_DataMapOfOrientedShapeShape &
	:rtype: None
") Initialize;
		void Initialize (const TopTools_DataMapOfOrientedShapeShape & aMap);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Value;
		const TopoDS_Shape  Value ();
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
		%feature("autodoc", "	:rtype: None
") TopTools_DataMapIteratorOfDataMapOfShapeInteger;
		 TopTools_DataMapIteratorOfDataMapOfShapeInteger ();
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_DataMapOfShapeInteger &
	:rtype: None
") TopTools_DataMapIteratorOfDataMapOfShapeInteger;
		 TopTools_DataMapIteratorOfDataMapOfShapeInteger (const TopTools_DataMapOfShapeInteger & aMap);
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_DataMapOfShapeInteger &
	:rtype: None
") Initialize;
		void Initialize (const TopTools_DataMapOfShapeInteger & aMap);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("autodoc", "	:rtype: int
") Value;
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
		%feature("autodoc", "	:rtype: None
") TopTools_DataMapIteratorOfDataMapOfShapeListOfInteger;
		 TopTools_DataMapIteratorOfDataMapOfShapeListOfInteger ();
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_DataMapOfShapeListOfInteger &
	:rtype: None
") TopTools_DataMapIteratorOfDataMapOfShapeListOfInteger;
		 TopTools_DataMapIteratorOfDataMapOfShapeListOfInteger (const TopTools_DataMapOfShapeListOfInteger & aMap);
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_DataMapOfShapeListOfInteger &
	:rtype: None
") Initialize;
		void Initialize (const TopTools_DataMapOfShapeListOfInteger & aMap);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("autodoc", "	:rtype: TColStd_ListOfInteger
") Value;
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
		%feature("autodoc", "	:rtype: None
") TopTools_DataMapIteratorOfDataMapOfShapeListOfShape;
		 TopTools_DataMapIteratorOfDataMapOfShapeListOfShape ();
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_DataMapOfShapeListOfShape &
	:rtype: None
") TopTools_DataMapIteratorOfDataMapOfShapeListOfShape;
		 TopTools_DataMapIteratorOfDataMapOfShapeListOfShape (const TopTools_DataMapOfShapeListOfShape & aMap);
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_DataMapOfShapeListOfShape &
	:rtype: None
") Initialize;
		void Initialize (const TopTools_DataMapOfShapeListOfShape & aMap);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") Value;
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
		%feature("autodoc", "	:rtype: None
") TopTools_DataMapIteratorOfDataMapOfShapeReal;
		 TopTools_DataMapIteratorOfDataMapOfShapeReal ();
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_DataMapOfShapeReal &
	:rtype: None
") TopTools_DataMapIteratorOfDataMapOfShapeReal;
		 TopTools_DataMapIteratorOfDataMapOfShapeReal (const TopTools_DataMapOfShapeReal & aMap);
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_DataMapOfShapeReal &
	:rtype: None
") Initialize;
		void Initialize (const TopTools_DataMapOfShapeReal & aMap);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("autodoc", "	:rtype: float
") Value;
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
		%feature("autodoc", "	:rtype: None
") TopTools_DataMapIteratorOfDataMapOfShapeSequenceOfShape;
		 TopTools_DataMapIteratorOfDataMapOfShapeSequenceOfShape ();
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_DataMapOfShapeSequenceOfShape &
	:rtype: None
") TopTools_DataMapIteratorOfDataMapOfShapeSequenceOfShape;
		 TopTools_DataMapIteratorOfDataMapOfShapeSequenceOfShape (const TopTools_DataMapOfShapeSequenceOfShape & aMap);
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_DataMapOfShapeSequenceOfShape &
	:rtype: None
") Initialize;
		void Initialize (const TopTools_DataMapOfShapeSequenceOfShape & aMap);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("autodoc", "	:rtype: TopTools_SequenceOfShape
") Value;
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
		%feature("autodoc", "	:rtype: None
") TopTools_DataMapIteratorOfDataMapOfShapeShape;
		 TopTools_DataMapIteratorOfDataMapOfShapeShape ();
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_DataMapOfShapeShape &
	:rtype: None
") TopTools_DataMapIteratorOfDataMapOfShapeShape;
		 TopTools_DataMapIteratorOfDataMapOfShapeShape (const TopTools_DataMapOfShapeShape & aMap);
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_DataMapOfShapeShape &
	:rtype: None
") Initialize;
		void Initialize (const TopTools_DataMapOfShapeShape & aMap);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Value;
		const TopoDS_Shape  Value ();
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
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:param I:
	:type I: TopTools_ListOfShape &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopTools_DataMapNodeOfDataMapOfIntegerListOfShape;
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
            		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") Value;
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
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:param I:
	:type I: TopoDS_Shape &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopTools_DataMapNodeOfDataMapOfIntegerShape;
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
            		%feature("autodoc", "	:rtype: TopoDS_Shape
") Value;
		TopoDS_Shape  Value ();
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
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: Standard_Integer &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopTools_DataMapNodeOfDataMapOfOrientedShapeInteger;
		 TopTools_DataMapNodeOfDataMapOfOrientedShapeInteger (const TopoDS_Shape & K,Standard_Integer &OutValue,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();

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
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TopoDS_Shape &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopTools_DataMapNodeOfDataMapOfOrientedShapeShape;
		 TopTools_DataMapNodeOfDataMapOfOrientedShapeShape (const TopoDS_Shape & K,const TopoDS_Shape & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Value;
		TopoDS_Shape  Value ();
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
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: Standard_Integer &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopTools_DataMapNodeOfDataMapOfShapeInteger;
		 TopTools_DataMapNodeOfDataMapOfShapeInteger (const TopoDS_Shape & K,Standard_Integer &OutValue,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();

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
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TColStd_ListOfInteger &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopTools_DataMapNodeOfDataMapOfShapeListOfInteger;
		 TopTools_DataMapNodeOfDataMapOfShapeListOfInteger (const TopoDS_Shape & K,const TColStd_ListOfInteger & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();
		%feature("autodoc", "	:rtype: TColStd_ListOfInteger
") Value;
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
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TopTools_ListOfShape &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopTools_DataMapNodeOfDataMapOfShapeListOfShape;
		 TopTools_DataMapNodeOfDataMapOfShapeListOfShape (const TopoDS_Shape & K,const TopTools_ListOfShape & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();
		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") Value;
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
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: float &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopTools_DataMapNodeOfDataMapOfShapeReal;
		 TopTools_DataMapNodeOfDataMapOfShapeReal (const TopoDS_Shape & K,const Standard_Real & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();

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
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TopTools_SequenceOfShape &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopTools_DataMapNodeOfDataMapOfShapeSequenceOfShape;
		 TopTools_DataMapNodeOfDataMapOfShapeSequenceOfShape (const TopoDS_Shape & K,const TopTools_SequenceOfShape & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();
		%feature("autodoc", "	:rtype: TopTools_SequenceOfShape
") Value;
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
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TopoDS_Shape &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopTools_DataMapNodeOfDataMapOfShapeShape;
		 TopTools_DataMapNodeOfDataMapOfShapeShape (const TopoDS_Shape & K,const TopoDS_Shape & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Value;
		TopoDS_Shape  Value ();
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
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") TopTools_DataMapOfIntegerListOfShape;
		 TopTools_DataMapOfIntegerListOfShape (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_DataMapOfIntegerListOfShape &
	:rtype: TopTools_DataMapOfIntegerListOfShape
") Assign;
		TopTools_DataMapOfIntegerListOfShape & Assign (const TopTools_DataMapOfIntegerListOfShape & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_DataMapOfIntegerListOfShape &
	:rtype: TopTools_DataMapOfIntegerListOfShape
") operator=;
		TopTools_DataMapOfIntegerListOfShape & operator = (const TopTools_DataMapOfIntegerListOfShape & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:param I:
	:type I: TopTools_ListOfShape &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (Standard_Integer &OutValue,const TopTools_ListOfShape & I);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: TopTools_ListOfShape
") Find;
		const TopTools_ListOfShape & Find (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: TopTools_ListOfShape
") ChangeFind;
		TopTools_ListOfShape & ChangeFind (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: Standard_Address
") ChangeFind1;
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
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") TopTools_DataMapOfIntegerShape;
		 TopTools_DataMapOfIntegerShape (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_DataMapOfIntegerShape &
	:rtype: TopTools_DataMapOfIntegerShape
") Assign;
		TopTools_DataMapOfIntegerShape & Assign (const TopTools_DataMapOfIntegerShape & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_DataMapOfIntegerShape &
	:rtype: TopTools_DataMapOfIntegerShape
") operator=;
		TopTools_DataMapOfIntegerShape & operator = (const TopTools_DataMapOfIntegerShape & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:param I:
	:type I: TopoDS_Shape &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (Standard_Integer &OutValue,const TopoDS_Shape & I);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: TopoDS_Shape
") Find;
		const TopoDS_Shape  Find (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: TopoDS_Shape
") ChangeFind;
		TopoDS_Shape  ChangeFind (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: Standard_Address
") ChangeFind1;
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
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") TopTools_DataMapOfOrientedShapeInteger;
		 TopTools_DataMapOfOrientedShapeInteger (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_DataMapOfOrientedShapeInteger &
	:rtype: TopTools_DataMapOfOrientedShapeInteger
") Assign;
		TopTools_DataMapOfOrientedShapeInteger & Assign (const TopTools_DataMapOfOrientedShapeInteger & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_DataMapOfOrientedShapeInteger &
	:rtype: TopTools_DataMapOfOrientedShapeInteger
") operator=;
		TopTools_DataMapOfOrientedShapeInteger & operator = (const TopTools_DataMapOfOrientedShapeInteger & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: Standard_Integer &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: int
") Find;
		const Standard_Integer & Find (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: int
") ChangeFind;
		Standard_Integer & ChangeFind (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFind1;
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
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") TopTools_DataMapOfOrientedShapeShape;
		 TopTools_DataMapOfOrientedShapeShape (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_DataMapOfOrientedShapeShape &
	:rtype: TopTools_DataMapOfOrientedShapeShape
") Assign;
		TopTools_DataMapOfOrientedShapeShape & Assign (const TopTools_DataMapOfOrientedShapeShape & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_DataMapOfOrientedShapeShape &
	:rtype: TopTools_DataMapOfOrientedShapeShape
") operator=;
		TopTools_DataMapOfOrientedShapeShape & operator = (const TopTools_DataMapOfOrientedShapeShape & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TopoDS_Shape &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const TopoDS_Shape & I);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopoDS_Shape
") Find;
		const TopoDS_Shape  Find (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopoDS_Shape
") ChangeFind;
		TopoDS_Shape  ChangeFind (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFind1;
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
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") TopTools_DataMapOfShapeInteger;
		 TopTools_DataMapOfShapeInteger (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_DataMapOfShapeInteger &
	:rtype: TopTools_DataMapOfShapeInteger
") Assign;
		TopTools_DataMapOfShapeInteger & Assign (const TopTools_DataMapOfShapeInteger & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_DataMapOfShapeInteger &
	:rtype: TopTools_DataMapOfShapeInteger
") operator=;
		TopTools_DataMapOfShapeInteger & operator = (const TopTools_DataMapOfShapeInteger & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: Standard_Integer &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: int
") Find;
		const Standard_Integer & Find (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: int
") ChangeFind;
		Standard_Integer & ChangeFind (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFind1;
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
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") TopTools_DataMapOfShapeListOfInteger;
		 TopTools_DataMapOfShapeListOfInteger (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_DataMapOfShapeListOfInteger &
	:rtype: TopTools_DataMapOfShapeListOfInteger
") Assign;
		TopTools_DataMapOfShapeListOfInteger & Assign (const TopTools_DataMapOfShapeListOfInteger & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_DataMapOfShapeListOfInteger &
	:rtype: TopTools_DataMapOfShapeListOfInteger
") operator=;
		TopTools_DataMapOfShapeListOfInteger & operator = (const TopTools_DataMapOfShapeListOfInteger & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TColStd_ListOfInteger &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const TColStd_ListOfInteger & I);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TColStd_ListOfInteger
") Find;
		const TColStd_ListOfInteger & Find (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TColStd_ListOfInteger
") ChangeFind;
		TColStd_ListOfInteger & ChangeFind (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFind1;
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
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") TopTools_DataMapOfShapeListOfShape;
		 TopTools_DataMapOfShapeListOfShape (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_DataMapOfShapeListOfShape &
	:rtype: TopTools_DataMapOfShapeListOfShape
") Assign;
		TopTools_DataMapOfShapeListOfShape & Assign (const TopTools_DataMapOfShapeListOfShape & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_DataMapOfShapeListOfShape &
	:rtype: TopTools_DataMapOfShapeListOfShape
") operator=;
		TopTools_DataMapOfShapeListOfShape & operator = (const TopTools_DataMapOfShapeListOfShape & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TopTools_ListOfShape &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const TopTools_ListOfShape & I);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") Find;
		const TopTools_ListOfShape & Find (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") ChangeFind;
		TopTools_ListOfShape & ChangeFind (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFind1;
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
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") TopTools_DataMapOfShapeReal;
		 TopTools_DataMapOfShapeReal (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_DataMapOfShapeReal &
	:rtype: TopTools_DataMapOfShapeReal
") Assign;
		TopTools_DataMapOfShapeReal & Assign (const TopTools_DataMapOfShapeReal & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_DataMapOfShapeReal &
	:rtype: TopTools_DataMapOfShapeReal
") operator=;
		TopTools_DataMapOfShapeReal & operator = (const TopTools_DataMapOfShapeReal & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: float &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const Standard_Real & I);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: float
") Find;
		const Standard_Real & Find (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: float
") ChangeFind;
		Standard_Real & ChangeFind (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFind1;
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
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") TopTools_DataMapOfShapeSequenceOfShape;
		 TopTools_DataMapOfShapeSequenceOfShape (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_DataMapOfShapeSequenceOfShape &
	:rtype: TopTools_DataMapOfShapeSequenceOfShape
") Assign;
		TopTools_DataMapOfShapeSequenceOfShape & Assign (const TopTools_DataMapOfShapeSequenceOfShape & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_DataMapOfShapeSequenceOfShape &
	:rtype: TopTools_DataMapOfShapeSequenceOfShape
") operator=;
		TopTools_DataMapOfShapeSequenceOfShape & operator = (const TopTools_DataMapOfShapeSequenceOfShape & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TopTools_SequenceOfShape &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const TopTools_SequenceOfShape & I);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopTools_SequenceOfShape
") Find;
		const TopTools_SequenceOfShape & Find (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopTools_SequenceOfShape
") ChangeFind;
		TopTools_SequenceOfShape & ChangeFind (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFind1;
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
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") TopTools_DataMapOfShapeShape;
		 TopTools_DataMapOfShapeShape (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_DataMapOfShapeShape &
	:rtype: TopTools_DataMapOfShapeShape
") Assign;
		TopTools_DataMapOfShapeShape & Assign (const TopTools_DataMapOfShapeShape & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_DataMapOfShapeShape &
	:rtype: TopTools_DataMapOfShapeShape
") operator=;
		TopTools_DataMapOfShapeShape & operator = (const TopTools_DataMapOfShapeShape & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TopoDS_Shape &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const TopoDS_Shape & I);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopoDS_Shape
") Find;
		const TopoDS_Shape  Find (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopoDS_Shape
") ChangeFind;
		TopoDS_Shape  ChangeFind (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFind1;
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
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") TopTools_HArray1OfListOfShape;
		 TopTools_HArray1OfListOfShape (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:param V:
	:type V: TopTools_ListOfShape &
	:rtype: None
") TopTools_HArray1OfListOfShape;
		 TopTools_HArray1OfListOfShape (const Standard_Integer Low,const Standard_Integer Up,const TopTools_ListOfShape & V);
		%feature("autodoc", "	:param V:
	:type V: TopTools_ListOfShape &
	:rtype: None
") Init;
		void Init (const TopTools_ListOfShape & V);
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
	:type Value: TopTools_ListOfShape &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const TopTools_ListOfShape & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: TopTools_ListOfShape
") Value;
		const TopTools_ListOfShape & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: TopTools_ListOfShape
") ChangeValue;
		TopTools_ListOfShape & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: TopTools_Array1OfListOfShape
") Array1;
		const TopTools_Array1OfListOfShape & Array1 ();
		%feature("autodoc", "	:rtype: TopTools_Array1OfListOfShape
") ChangeArray1;
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
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") TopTools_HArray1OfShape;
		 TopTools_HArray1OfShape (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:param V:
	:type V: TopoDS_Shape &
	:rtype: None
") TopTools_HArray1OfShape;
		 TopTools_HArray1OfShape (const Standard_Integer Low,const Standard_Integer Up,const TopoDS_Shape & V);
		%feature("autodoc", "	:param V:
	:type V: TopoDS_Shape &
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & V);
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
	:type Value: TopoDS_Shape &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const TopoDS_Shape & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: TopoDS_Shape
") Value;
		const TopoDS_Shape  Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: TopoDS_Shape
") ChangeValue;
		TopoDS_Shape  ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: TopTools_Array1OfShape
") Array1;
		const TopTools_Array1OfShape & Array1 ();
		%feature("autodoc", "	:rtype: TopTools_Array1OfShape
") ChangeArray1;
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
		%feature("autodoc", "	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:rtype: None
") TopTools_HArray2OfShape;
		 TopTools_HArray2OfShape (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:param V:
	:type V: TopoDS_Shape &
	:rtype: None
") TopTools_HArray2OfShape;
		 TopTools_HArray2OfShape (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const TopoDS_Shape & V);
		%feature("autodoc", "	:param V:
	:type V: TopoDS_Shape &
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & V);
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
	:type Value: TopoDS_Shape &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const TopoDS_Shape & Value);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: TopoDS_Shape
") Value;
		const TopoDS_Shape  Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: TopoDS_Shape
") ChangeValue;
		TopoDS_Shape  ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "	:rtype: TopTools_Array2OfShape
") Array2;
		const TopTools_Array2OfShape & Array2 ();
		%feature("autodoc", "	:rtype: TopTools_Array2OfShape
") ChangeArray2;
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
		%feature("autodoc", "	:rtype: None
") TopTools_HSequenceOfShape;
		 TopTools_HSequenceOfShape ();
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
	:type anItem: TopoDS_Shape &
	:rtype: None
") Append;
		void Append (const TopoDS_Shape & anItem);
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TopTools_HSequenceOfShape &
	:rtype: None
") Append;
		void Append (const Handle_TopTools_HSequenceOfShape & aSequence);
		%feature("autodoc", "	:param anItem:
	:type anItem: TopoDS_Shape &
	:rtype: None
") Prepend;
		void Prepend (const TopoDS_Shape & anItem);
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TopTools_HSequenceOfShape &
	:rtype: None
") Prepend;
		void Prepend (const Handle_TopTools_HSequenceOfShape & aSequence);
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: TopoDS_Shape &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const TopoDS_Shape & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param aSequence:
	:type aSequence: Handle_TopTools_HSequenceOfShape &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TopTools_HSequenceOfShape & aSequence);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: TopoDS_Shape &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const TopoDS_Shape & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param aSequence:
	:type aSequence: Handle_TopTools_HSequenceOfShape &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TopTools_HSequenceOfShape & aSequence);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anOtherIndex:
	:type anOtherIndex: Standard_Integer
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_TopTools_HSequenceOfShape
") Split;
		Handle_TopTools_HSequenceOfShape Split (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: TopoDS_Shape &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const TopoDS_Shape & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: TopoDS_Shape
") Value;
		const TopoDS_Shape  Value (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: TopoDS_Shape
") ChangeValue;
		TopoDS_Shape  ChangeValue (const Standard_Integer anIndex);
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
		%feature("autodoc", "	:rtype: TopTools_SequenceOfShape
") Sequence;
		const TopTools_SequenceOfShape & Sequence ();
		%feature("autodoc", "	:rtype: TopTools_SequenceOfShape
") ChangeSequence;
		TopTools_SequenceOfShape & ChangeSequence ();
		%feature("autodoc", "	:rtype: Handle_TopTools_HSequenceOfShape
") ShallowCopy;
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
		%feature("autodoc", "	:param K1:
	:type K1: TopoDS_Shape &
	:param K2:
	:type K2: Standard_Integer
	:param I:
	:type I: Standard_Address &
	:param n1:
	:type n1: TCollection_MapNodePtr &
	:param n2:
	:type n2: TCollection_MapNodePtr &
	:rtype: None
") TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeAddress;
		 TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeAddress (const TopoDS_Shape & K1,const Standard_Integer K2,const Standard_Address & I,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key1;
		TopoDS_Shape  Key1 ();

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
            		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next2;
		TCollection_MapNodePtr & Next2 ();
		%feature("autodoc", "	:rtype: Standard_Address
") Value;
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
		%feature("autodoc", "	:param K1:
	:type K1: TopoDS_Shape &
	:param K2:
	:type K2: Standard_Integer
	:param I:
	:type I: TopTools_ListOfShape &
	:param n1:
	:type n1: TCollection_MapNodePtr &
	:param n2:
	:type n2: TCollection_MapNodePtr &
	:rtype: None
") TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeListOfShape;
		 TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeListOfShape (const TopoDS_Shape & K1,const Standard_Integer K2,const TopTools_ListOfShape & I,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key1;
		TopoDS_Shape  Key1 ();

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
            		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next2;
		TCollection_MapNodePtr & Next2 ();
		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") Value;
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
		%feature("autodoc", "	:param K1:
	:type K1: TopoDS_Shape &
	:param K2:
	:type K2: Standard_Integer
	:param I:
	:type I: TopoDS_Shape &
	:param n1:
	:type n1: TCollection_MapNodePtr &
	:param n2:
	:type n2: TCollection_MapNodePtr &
	:rtype: None
") TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeShape;
		 TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeShape (const TopoDS_Shape & K1,const Standard_Integer K2,const TopoDS_Shape & I,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key1;
		TopoDS_Shape  Key1 ();

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
            		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next2;
		TCollection_MapNodePtr & Next2 ();
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Value;
		TopoDS_Shape  Value ();
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
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") TopTools_IndexedDataMapOfShapeAddress;
		 TopTools_IndexedDataMapOfShapeAddress (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_IndexedDataMapOfShapeAddress &
	:rtype: TopTools_IndexedDataMapOfShapeAddress
") Assign;
		TopTools_IndexedDataMapOfShapeAddress & Assign (const TopTools_IndexedDataMapOfShapeAddress & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_IndexedDataMapOfShapeAddress &
	:rtype: TopTools_IndexedDataMapOfShapeAddress
") operator=;
		TopTools_IndexedDataMapOfShapeAddress & operator = (const TopTools_IndexedDataMapOfShapeAddress & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: Standard_Address &
	:rtype: int
") Add;
		Standard_Integer Add (const TopoDS_Shape & K,const Standard_Address & I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:param K:
	:type K: TopoDS_Shape &
	:param T:
	:type T: Standard_Address &
	:rtype: None
") Substitute;
		void Substitute (const Standard_Integer I,const TopoDS_Shape & K,const Standard_Address & T);
		%feature("autodoc", "	:rtype: None
") RemoveLast;
		void RemoveLast ();
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const TopoDS_Shape & K);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: TopoDS_Shape
") FindKey;
		const TopoDS_Shape  FindKey (const Standard_Integer I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: Standard_Address
") FindFromIndex;
		const Standard_Address & FindFromIndex (const Standard_Integer I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: Standard_Address
") ChangeFromIndex;
		Standard_Address & ChangeFromIndex (const Standard_Integer I);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: int
") FindIndex;
		Standard_Integer FindIndex (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") FindFromKey;
		const Standard_Address & FindFromKey (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFromKey;
		Standard_Address & ChangeFromKey (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") FindFromKey1;
		Standard_Address FindFromKey1 (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFromKey1;
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
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") TopTools_IndexedDataMapOfShapeListOfShape;
		 TopTools_IndexedDataMapOfShapeListOfShape (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_IndexedDataMapOfShapeListOfShape &
	:rtype: TopTools_IndexedDataMapOfShapeListOfShape
") Assign;
		TopTools_IndexedDataMapOfShapeListOfShape & Assign (const TopTools_IndexedDataMapOfShapeListOfShape & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_IndexedDataMapOfShapeListOfShape &
	:rtype: TopTools_IndexedDataMapOfShapeListOfShape
") operator=;
		TopTools_IndexedDataMapOfShapeListOfShape & operator = (const TopTools_IndexedDataMapOfShapeListOfShape & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TopTools_ListOfShape &
	:rtype: int
") Add;
		Standard_Integer Add (const TopoDS_Shape & K,const TopTools_ListOfShape & I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:param K:
	:type K: TopoDS_Shape &
	:param T:
	:type T: TopTools_ListOfShape &
	:rtype: None
") Substitute;
		void Substitute (const Standard_Integer I,const TopoDS_Shape & K,const TopTools_ListOfShape & T);
		%feature("autodoc", "	:rtype: None
") RemoveLast;
		void RemoveLast ();
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const TopoDS_Shape & K);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: TopoDS_Shape
") FindKey;
		const TopoDS_Shape  FindKey (const Standard_Integer I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: TopTools_ListOfShape
") FindFromIndex;
		const TopTools_ListOfShape & FindFromIndex (const Standard_Integer I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: TopTools_ListOfShape
") ChangeFromIndex;
		TopTools_ListOfShape & ChangeFromIndex (const Standard_Integer I);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: int
") FindIndex;
		Standard_Integer FindIndex (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") FindFromKey;
		const TopTools_ListOfShape & FindFromKey (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") ChangeFromKey;
		TopTools_ListOfShape & ChangeFromKey (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") FindFromKey1;
		Standard_Address FindFromKey1 (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFromKey1;
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
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") TopTools_IndexedDataMapOfShapeShape;
		 TopTools_IndexedDataMapOfShapeShape (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_IndexedDataMapOfShapeShape &
	:rtype: TopTools_IndexedDataMapOfShapeShape
") Assign;
		TopTools_IndexedDataMapOfShapeShape & Assign (const TopTools_IndexedDataMapOfShapeShape & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_IndexedDataMapOfShapeShape &
	:rtype: TopTools_IndexedDataMapOfShapeShape
") operator=;
		TopTools_IndexedDataMapOfShapeShape & operator = (const TopTools_IndexedDataMapOfShapeShape & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TopoDS_Shape &
	:rtype: int
") Add;
		Standard_Integer Add (const TopoDS_Shape & K,const TopoDS_Shape & I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:param K:
	:type K: TopoDS_Shape &
	:param T:
	:type T: TopoDS_Shape &
	:rtype: None
") Substitute;
		void Substitute (const Standard_Integer I,const TopoDS_Shape & K,const TopoDS_Shape & T);
		%feature("autodoc", "	:rtype: None
") RemoveLast;
		void RemoveLast ();
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const TopoDS_Shape & K);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: TopoDS_Shape
") FindKey;
		const TopoDS_Shape  FindKey (const Standard_Integer I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: TopoDS_Shape
") FindFromIndex;
		const TopoDS_Shape  FindFromIndex (const Standard_Integer I);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: TopoDS_Shape
") ChangeFromIndex;
		TopoDS_Shape  ChangeFromIndex (const Standard_Integer I);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: int
") FindIndex;
		Standard_Integer FindIndex (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopoDS_Shape
") FindFromKey;
		const TopoDS_Shape  FindFromKey (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopoDS_Shape
") ChangeFromKey;
		TopoDS_Shape  ChangeFromKey (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") FindFromKey1;
		Standard_Address FindFromKey1 (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFromKey1;
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
		%feature("autodoc", "	:param K1:
	:type K1: TopoDS_Shape &
	:param K2:
	:type K2: Standard_Integer
	:param n1:
	:type n1: TCollection_MapNodePtr &
	:param n2:
	:type n2: TCollection_MapNodePtr &
	:rtype: None
") TopTools_IndexedMapNodeOfIndexedMapOfOrientedShape;
		 TopTools_IndexedMapNodeOfIndexedMapOfOrientedShape (const TopoDS_Shape & K1,const Standard_Integer K2,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key1;
		TopoDS_Shape  Key1 ();

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
            		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next2;
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
		%feature("autodoc", "	:param K1:
	:type K1: TopoDS_Shape &
	:param K2:
	:type K2: Standard_Integer
	:param n1:
	:type n1: TCollection_MapNodePtr &
	:param n2:
	:type n2: TCollection_MapNodePtr &
	:rtype: None
") TopTools_IndexedMapNodeOfIndexedMapOfShape;
		 TopTools_IndexedMapNodeOfIndexedMapOfShape (const TopoDS_Shape & K1,const Standard_Integer K2,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key1;
		TopoDS_Shape  Key1 ();

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
            		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next2;
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
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") TopTools_IndexedMapOfOrientedShape;
		 TopTools_IndexedMapOfOrientedShape (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_IndexedMapOfOrientedShape &
	:rtype: TopTools_IndexedMapOfOrientedShape
") Assign;
		TopTools_IndexedMapOfOrientedShape & Assign (const TopTools_IndexedMapOfOrientedShape & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_IndexedMapOfOrientedShape &
	:rtype: TopTools_IndexedMapOfOrientedShape
") operator=;
		TopTools_IndexedMapOfOrientedShape & operator = (const TopTools_IndexedMapOfOrientedShape & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: int
") Add;
		Standard_Integer Add (const TopoDS_Shape & K);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:param K:
	:type K: TopoDS_Shape &
	:rtype: None
") Substitute;
		void Substitute (const Standard_Integer I,const TopoDS_Shape & K);
		%feature("autodoc", "	:rtype: None
") RemoveLast;
		void RemoveLast ();
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const TopoDS_Shape & K);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: TopoDS_Shape
") FindKey;
		const TopoDS_Shape  FindKey (const Standard_Integer I);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: int
") FindIndex;
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
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") TopTools_IndexedMapOfShape;
		 TopTools_IndexedMapOfShape (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_IndexedMapOfShape &
	:rtype: TopTools_IndexedMapOfShape
") Assign;
		TopTools_IndexedMapOfShape & Assign (const TopTools_IndexedMapOfShape & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_IndexedMapOfShape &
	:rtype: TopTools_IndexedMapOfShape
") operator=;
		TopTools_IndexedMapOfShape & operator = (const TopTools_IndexedMapOfShape & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: int
") Add;
		Standard_Integer Add (const TopoDS_Shape & K);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:param K:
	:type K: TopoDS_Shape &
	:rtype: None
") Substitute;
		void Substitute (const Standard_Integer I,const TopoDS_Shape & K);
		%feature("autodoc", "	:rtype: None
") RemoveLast;
		void RemoveLast ();
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const TopoDS_Shape & K);
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: TopoDS_Shape
") FindKey;
		const TopoDS_Shape  FindKey (const Standard_Integer I);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: int
") FindIndex;
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
		%feature("autodoc", "	:rtype: None
") TopTools_ListIteratorOfListOfShape;
		 TopTools_ListIteratorOfListOfShape ();
		%feature("autodoc", "	:param L:
	:type L: TopTools_ListOfShape &
	:rtype: None
") TopTools_ListIteratorOfListOfShape;
		 TopTools_ListIteratorOfListOfShape (const TopTools_ListOfShape & L);
		%feature("autodoc", "	:param L:
	:type L: TopTools_ListOfShape &
	:rtype: None
") Initialize;
		void Initialize (const TopTools_ListOfShape & L);
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Value;
		TopoDS_Shape  Value ();
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
		%feature("autodoc", "	:param I:
	:type I: TopoDS_Shape &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopTools_ListNodeOfListOfShape;
		 TopTools_ListNodeOfListOfShape (const TopoDS_Shape & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Value;
		TopoDS_Shape  Value ();
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
		%feature("autodoc", "	:rtype: None
") TopTools_ListOfShape;
		 TopTools_ListOfShape ();
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_ListOfShape &
	:rtype: None
") Assign;
		void Assign (const TopTools_ListOfShape & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_ListOfShape &
	:rtype: None
") operator=;
		void operator = (const TopTools_ListOfShape & Other);
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:param I:
	:type I: TopoDS_Shape &
	:rtype: None
") Prepend;
		void Prepend (const TopoDS_Shape & I);
		%feature("autodoc", "	:param I:
	:type I: TopoDS_Shape &
	:param theIt:
	:type theIt: TopTools_ListIteratorOfListOfShape &
	:rtype: None
") Prepend;
		void Prepend (const TopoDS_Shape & I,TopTools_ListIteratorOfListOfShape & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_ListOfShape &
	:rtype: None
") Prepend;
		void Prepend (TopTools_ListOfShape & Other);
		%feature("autodoc", "	:param I:
	:type I: TopoDS_Shape &
	:rtype: None
") Append;
		void Append (const TopoDS_Shape & I);
		%feature("autodoc", "	:param I:
	:type I: TopoDS_Shape &
	:param theIt:
	:type theIt: TopTools_ListIteratorOfListOfShape &
	:rtype: None
") Append;
		void Append (const TopoDS_Shape & I,TopTools_ListIteratorOfListOfShape & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_ListOfShape &
	:rtype: None
") Append;
		void Append (TopTools_ListOfShape & Other);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") First;
		TopoDS_Shape  First ();
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Last;
		TopoDS_Shape  Last ();
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "	:param It:
	:type It: TopTools_ListIteratorOfListOfShape &
	:rtype: None
") Remove;
		void Remove (TopTools_ListIteratorOfListOfShape & It);
		%feature("autodoc", "	:param I:
	:type I: TopoDS_Shape &
	:param It:
	:type It: TopTools_ListIteratorOfListOfShape &
	:rtype: None
") InsertBefore;
		void InsertBefore (const TopoDS_Shape & I,TopTools_ListIteratorOfListOfShape & It);
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_ListOfShape &
	:param It:
	:type It: TopTools_ListIteratorOfListOfShape &
	:rtype: None
") InsertBefore;
		void InsertBefore (TopTools_ListOfShape & Other,TopTools_ListIteratorOfListOfShape & It);
		%feature("autodoc", "	:param I:
	:type I: TopoDS_Shape &
	:param It:
	:type It: TopTools_ListIteratorOfListOfShape &
	:rtype: None
") InsertAfter;
		void InsertAfter (const TopoDS_Shape & I,TopTools_ListIteratorOfListOfShape & It);
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_ListOfShape &
	:param It:
	:type It: TopTools_ListIteratorOfListOfShape &
	:rtype: None
") InsertAfter;
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
		%feature("autodoc", "	* Returns an empty set of locations.

	:rtype: None
") TopTools_LocationSet;
		 TopTools_LocationSet ();
		%feature("autodoc", "	* Clears the content of the set.

	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	* Incorporate a new Location in the set and returns its index.

	:param L:
	:type L: TopLoc_Location &
	:rtype: int
") Add;
		Standard_Integer Add (const TopLoc_Location & L);
		%feature("autodoc", "	* Returns the location of index <I>.

	:param I:
	:type I: Standard_Integer
	:rtype: TopLoc_Location
") Location;
		const TopLoc_Location & Location (const Standard_Integer I);
		%feature("autodoc", "	* Returns the index of <L>.

	:param L:
	:type L: TopLoc_Location &
	:rtype: int
") Index;
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
        		%feature("autodoc", "	:param PR:
	:type PR: Handle_Message_ProgressIndicator &
	:rtype: None
") SetProgress;
		void SetProgress (const Handle_Message_ProgressIndicator & PR);
		%feature("autodoc", "	:rtype: Handle_Message_ProgressIndicator
") GetProgress;
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
		%feature("autodoc", "	:rtype: None
") TopTools_MapIteratorOfMapOfOrientedShape;
		 TopTools_MapIteratorOfMapOfOrientedShape ();
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_MapOfOrientedShape &
	:rtype: None
") TopTools_MapIteratorOfMapOfOrientedShape;
		 TopTools_MapIteratorOfMapOfOrientedShape (const TopTools_MapOfOrientedShape & aMap);
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_MapOfOrientedShape &
	:rtype: None
") Initialize;
		void Initialize (const TopTools_MapOfOrientedShape & aMap);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
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
		%feature("autodoc", "	:rtype: None
") TopTools_MapIteratorOfMapOfShape;
		 TopTools_MapIteratorOfMapOfShape ();
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_MapOfShape &
	:rtype: None
") TopTools_MapIteratorOfMapOfShape;
		 TopTools_MapIteratorOfMapOfShape (const TopTools_MapOfShape & aMap);
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_MapOfShape &
	:rtype: None
") Initialize;
		void Initialize (const TopTools_MapOfShape & aMap);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
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
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") TopTools_MapOfOrientedShape;
		 TopTools_MapOfOrientedShape (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_MapOfOrientedShape &
	:rtype: TopTools_MapOfOrientedShape
") Assign;
		TopTools_MapOfOrientedShape & Assign (const TopTools_MapOfOrientedShape & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_MapOfOrientedShape &
	:rtype: TopTools_MapOfOrientedShape
") operator=;
		TopTools_MapOfOrientedShape & operator = (const TopTools_MapOfOrientedShape & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param aKey:
	:type aKey: TopoDS_Shape &
	:rtype: bool
") Add;
		Standard_Boolean Add (const TopoDS_Shape & aKey);
		%feature("autodoc", "	:param aKey:
	:type aKey: TopoDS_Shape &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const TopoDS_Shape & aKey);
		%feature("autodoc", "	:param aKey:
	:type aKey: TopoDS_Shape &
	:rtype: bool
") Remove;
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
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") TopTools_MapOfShape;
		 TopTools_MapOfShape (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_MapOfShape &
	:rtype: TopTools_MapOfShape
") Assign;
		TopTools_MapOfShape & Assign (const TopTools_MapOfShape & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_MapOfShape &
	:rtype: TopTools_MapOfShape
") operator=;
		TopTools_MapOfShape & operator = (const TopTools_MapOfShape & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param aKey:
	:type aKey: TopoDS_Shape &
	:rtype: bool
") Add;
		Standard_Boolean Add (const TopoDS_Shape & aKey);
		%feature("autodoc", "	:param aKey:
	:type aKey: TopoDS_Shape &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const TopoDS_Shape & aKey);
		%feature("autodoc", "	:param aKey:
	:type aKey: TopoDS_Shape &
	:rtype: bool
") Remove;
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
		%feature("autodoc", "	* Constructor

	:rtype: None
") TopTools_MutexForShapeProvider;
		 TopTools_MutexForShapeProvider ();
		%feature("autodoc", "	* Creates and associates mutexes with each sub-shape of type theType in theShape.

	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theType:
	:type theType: TopAbs_ShapeEnum
	:rtype: None
") CreateMutexesForSubShapes;
		void CreateMutexesForSubShapes (const TopoDS_Shape & theShape,const TopAbs_ShapeEnum theType);
		%feature("autodoc", "	* Creates and associates mutex with theShape

	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: None
") CreateMutexForShape;
		void CreateMutexForShape (const TopoDS_Shape & theShape);
		%feature("autodoc", "	* Returns pointer to mutex associated with theShape. In case when mutex not found returns NULL.

	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: Standard_Mutex *
") GetMutex;
		Standard_Mutex * GetMutex (const TopoDS_Shape & theShape);
		%feature("autodoc", "	* Removes all mutexes

	:rtype: None
") RemoveAllMutexes;
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
		%feature("autodoc", "	* Returns a HasCode value for the Key <K> in the range 0..Upper.

	:param S:
	:type S: TopoDS_Shape &
	:param Upper:
	:type Upper: Standard_Integer
	:rtype: int
") HashCode;
		static Standard_Integer HashCode (const TopoDS_Shape & S,const Standard_Integer Upper);
		%feature("autodoc", "	* Returns True when the two keys are equal. Two same keys must have the same hashcode, the contrary is not necessary.

	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:rtype: bool
") IsEqual;
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
		%feature("autodoc", "	:param I:
	:type I: TopoDS_Shape &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") TopTools_SequenceNodeOfSequenceOfShape;
		 TopTools_SequenceNodeOfSequenceOfShape (const TopoDS_Shape & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Value;
		TopoDS_Shape  Value ();
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
		%feature("autodoc", "	:rtype: None
") TopTools_SequenceOfShape;
		 TopTools_SequenceOfShape ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_SequenceOfShape &
	:rtype: TopTools_SequenceOfShape
") Assign;
		const TopTools_SequenceOfShape & Assign (const TopTools_SequenceOfShape & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_SequenceOfShape &
	:rtype: TopTools_SequenceOfShape
") operator=;
		const TopTools_SequenceOfShape & operator = (const TopTools_SequenceOfShape & Other);
		%feature("autodoc", "	:param T:
	:type T: TopoDS_Shape &
	:rtype: None
") Append;
		void Append (const TopoDS_Shape & T);
		%feature("autodoc", "	:param S:
	:type S: TopTools_SequenceOfShape &
	:rtype: None
") Append;
		void Append (TopTools_SequenceOfShape & S);
		%feature("autodoc", "	:param T:
	:type T: TopoDS_Shape &
	:rtype: None
") Prepend;
		void Prepend (const TopoDS_Shape & T);
		%feature("autodoc", "	:param S:
	:type S: TopTools_SequenceOfShape &
	:rtype: None
") Prepend;
		void Prepend (TopTools_SequenceOfShape & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: TopoDS_Shape &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const TopoDS_Shape & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: TopTools_SequenceOfShape &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TopTools_SequenceOfShape & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: TopoDS_Shape &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const TopoDS_Shape & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: TopTools_SequenceOfShape &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TopTools_SequenceOfShape & S);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") First;
		const TopoDS_Shape  First ();
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Last;
		const TopoDS_Shape  Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: TopTools_SequenceOfShape &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,TopTools_SequenceOfShape & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: TopoDS_Shape
") Value;
		const TopoDS_Shape  Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: TopoDS_Shape &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const TopoDS_Shape & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: TopoDS_Shape
") ChangeValue;
		TopoDS_Shape  ChangeValue (const Standard_Integer Index);
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
		%feature("autodoc", "	* Returns a HasCode value for the Key <K> in the range 0..Upper.

	:param S:
	:type S: TopoDS_Shape &
	:param Upper:
	:type Upper: Standard_Integer
	:rtype: int
") HashCode;
		static Standard_Integer HashCode (const TopoDS_Shape & S,const Standard_Integer Upper);
		%feature("autodoc", "	* Returns True when the two keys are the same. Two same keys must have the same hashcode, the contrary is not necessary.

	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:rtype: bool
") IsEqual;
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
		%feature("autodoc", "	* Builds an empty ShapeSet.

	:rtype: None
") TopTools_ShapeSet;
		 TopTools_ShapeSet ();
		%feature("autodoc", "	:rtype: void
") Delete;
		virtual void Delete ();
		%feature("autodoc", "	:param theFormatNb:
	:type theFormatNb: Standard_Integer
	:rtype: None
") SetFormatNb;
		void SetFormatNb (const Standard_Integer theFormatNb);
		%feature("autodoc", "	* two formats available for the moment: First: does not write CurveOnSurface UV Points into the file  on reading calls Check() method. Second: stores CurveOnSurface UV Points. On reading format is recognized from Version string.

	:rtype: int
") FormatNb;
		Standard_Integer FormatNb ();
		%feature("autodoc", "	* Clears the content of the set. This method can be redefined.

	:rtype: void
") Clear;
		virtual void Clear ();
		%feature("autodoc", "	* Stores <S> and its sub-shape. Returns the index of <S>. The method AddGeometry is called on each sub-shape.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: int
") Add;
		Standard_Integer Add (const TopoDS_Shape & S);
		%feature("autodoc", "	* Returns the sub-shape of index <I>.

	:param I:
	:type I: Standard_Integer
	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape (const Standard_Integer I);
		%feature("autodoc", "	* Returns the index of <S>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: int
") Index;
		Standard_Integer Index (const TopoDS_Shape & S);
		%feature("autodoc", "	:rtype: TopTools_LocationSet
") Locations;
		const TopTools_LocationSet & Locations ();
		%feature("autodoc", "	:rtype: TopTools_LocationSet
") ChangeLocations;
		TopTools_LocationSet & ChangeLocations ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpExtentToString() {
            std::stringstream s;
            self->DumpExtent(s);
            return s.str();}
        };
        		%feature("autodoc", "	* Dumps the number of objects in me in the string S (Number of shapes of each type)

	:param S:
	:type S: TCollection_AsciiString &
	:rtype: None
") DumpExtent;
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
        		%feature("autodoc", "	* Dumps on <OS> the shape <S>. Dumps the orientation, the index of the TShape and the index of the Location.

	:param S:
	:type S: TopoDS_Shape &
	:param OS:
	:type OS: Standard_OStream &
	:rtype: None
") Dump;
		void Dump (const TopoDS_Shape & S,Standard_OStream & OS);
		%feature("autodoc", "	* Writes on <OS> the shape <S>. Writes the orientation, the index of the TShape and the index of the Location.

	:param S:
	:type S: TopoDS_Shape &
	:param OS:
	:type OS: Standard_OStream &
	:rtype: None
") Write;
		void Write (const TopoDS_Shape & S,Standard_OStream & OS);
		%feature("autodoc", "	* Reads from <IS> a shape and returns it in S.

	:param S:
	:type S: TopoDS_Shape &
	:param IS:
	:type IS: Standard_IStream &
	:rtype: None
") Read;
		void Read (TopoDS_Shape & S,Standard_IStream & IS);
		%feature("autodoc", "	* Stores the geometry of <S>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: void
") AddGeometry;
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
        		%feature("autodoc", "	* Dumps the geometry of <S> on the stream <OS>.

	:param S:
	:type S: TopoDS_Shape &
	:param OS:
	:type OS: Standard_OStream &
	:rtype: void
") DumpGeometry;
		virtual void DumpGeometry (const TopoDS_Shape & S,Standard_OStream & OS);
		%feature("autodoc", "	* Writes the geometry of <S> on the stream <OS> in a format that can be read back by Read.

	:param S:
	:type S: TopoDS_Shape &
	:param OS:
	:type OS: Standard_OStream &
	:rtype: void
") WriteGeometry;
		virtual void WriteGeometry (const TopoDS_Shape & S,Standard_OStream & OS);
		%feature("autodoc", "	* Reads the geometry of a shape of type <T> from the stream <IS> and returns it in <S>.

	:param T:
	:type T: TopAbs_ShapeEnum
	:param IS:
	:type IS: Standard_IStream &
	:param S:
	:type S: TopoDS_Shape &
	:rtype: void
") ReadGeometry;
		virtual void ReadGeometry (const TopAbs_ShapeEnum T,Standard_IStream & IS,TopoDS_Shape & S);
		%feature("autodoc", "	* Inserts the shape <S2> in the shape <S1>. This method must be redefined to use the correct builder.

	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:rtype: void
") AddShapes;
		virtual void AddShapes (TopoDS_Shape & S1,const TopoDS_Shape & S2);
		%feature("autodoc", "	* This method is called after each new completed shape. <T> is the type. <S> is the shape. In this class it does nothing, but it gives the opportunity in derived classes to perform extra treatment on shapes.

	:param T:
	:type T: TopAbs_ShapeEnum
	:param S:
	:type S: TopoDS_Shape &
	:rtype: void
") Check;
		virtual void Check (const TopAbs_ShapeEnum T,TopoDS_Shape & S);
		%feature("autodoc", "	* //!Returns number of shapes read from file.

	:rtype: int
") NbShapes;
		Standard_Integer NbShapes ();
		%feature("autodoc", "	:param PR:
	:type PR: Handle_Message_ProgressIndicator &
	:rtype: None
") SetProgress;
		void SetProgress (const Handle_Message_ProgressIndicator & PR);
		%feature("autodoc", "	:rtype: Handle_Message_ProgressIndicator
") GetProgress;
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
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopTools_StdMapNodeOfMapOfOrientedShape;
		 TopTools_StdMapNodeOfMapOfOrientedShape (const TopoDS_Shape & K,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();
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
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopTools_StdMapNodeOfMapOfShape;
		 TopTools_StdMapNodeOfMapOfShape (const TopoDS_Shape & K,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();
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

