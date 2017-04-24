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
%module (package="OCC") TopTools

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


%include TopTools_headers.i


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
typedef TopTools_LocationSet * TopTools_LocationSetPtr;
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(toptools) TopTools;
class TopTools {
	public:
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	* A set of Shapes. Can be dump, wrote or read. Dumps the topological structure of <Sh> on the stream <S>.

	:param Sh:
	:type Sh: TopoDS_Shape &
	:param S:
	:type S: Standard_OStream &
	:rtype: void
") Dump;
		static void Dump (const TopoDS_Shape & Sh,Standard_OStream & S);
		%feature("compactdefaultargs") Dummy;
		%feature("autodoc", "	* This is to bypass an extraction bug. It will force the inclusion of Standard_Integer.hxx itself including Standard_OStream.hxx at the correct position.

	:param I:
	:type I: int
	:rtype: void
") Dummy;
		static void Dummy (const Standard_Integer I);
};


%extend TopTools {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_Array1OfListOfShape;
class TopTools_Array1OfListOfShape {
	public:
		%feature("compactdefaultargs") TopTools_Array1OfListOfShape;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TopTools_Array1OfListOfShape;
		 TopTools_Array1OfListOfShape (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TopTools_Array1OfListOfShape;
		%feature("autodoc", "	:param Item:
	:type Item: TopTools_ListOfShape &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TopTools_Array1OfListOfShape;
		 TopTools_Array1OfListOfShape (const TopTools_ListOfShape & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: TopTools_ListOfShape &
	:rtype: None
") Init;
		void Init (const TopTools_ListOfShape & V);
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
	:type Other: TopTools_Array1OfListOfShape &
	:rtype: TopTools_Array1OfListOfShape
") Assign;
		const TopTools_Array1OfListOfShape & Assign (const TopTools_Array1OfListOfShape & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_Array1OfListOfShape &
	:rtype: TopTools_Array1OfListOfShape
") operator =;
		const TopTools_Array1OfListOfShape & operator = (const TopTools_Array1OfListOfShape & Other);
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
	:type Value: TopTools_ListOfShape &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const TopTools_ListOfShape & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TopTools_ListOfShape
") Value;
		const TopTools_ListOfShape & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TopTools_ListOfShape
") ChangeValue;
		TopTools_ListOfShape & ChangeValue (const Standard_Integer Index);
};


%extend TopTools_Array1OfListOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_Array1OfShape;
class TopTools_Array1OfShape {
	public:
		%feature("compactdefaultargs") TopTools_Array1OfShape;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TopTools_Array1OfShape;
		 TopTools_Array1OfShape (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TopTools_Array1OfShape;
		%feature("autodoc", "	:param Item:
	:type Item: TopoDS_Shape &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TopTools_Array1OfShape;
		 TopTools_Array1OfShape (const TopoDS_Shape & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: TopoDS_Shape &
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & V);
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
	:type Other: TopTools_Array1OfShape &
	:rtype: TopTools_Array1OfShape
") Assign;
		const TopTools_Array1OfShape & Assign (const TopTools_Array1OfShape & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_Array1OfShape &
	:rtype: TopTools_Array1OfShape
") operator =;
		const TopTools_Array1OfShape & operator = (const TopTools_Array1OfShape & Other);
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
	:type Value: TopoDS_Shape &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const TopoDS_Shape & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TopoDS_Shape
") Value;
		const TopoDS_Shape  Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TopoDS_Shape
") ChangeValue;
		TopoDS_Shape  ChangeValue (const Standard_Integer Index);
};


%extend TopTools_Array1OfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_Array2OfShape;
class TopTools_Array2OfShape {
	public:
		%feature("compactdefaultargs") TopTools_Array2OfShape;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TopTools_Array2OfShape;
		 TopTools_Array2OfShape (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") TopTools_Array2OfShape;
		%feature("autodoc", "	:param Item:
	:type Item: TopoDS_Shape &
	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TopTools_Array2OfShape;
		 TopTools_Array2OfShape (const TopoDS_Shape & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: TopoDS_Shape &
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_Array2OfShape &
	:rtype: TopTools_Array2OfShape
") Assign;
		const TopTools_Array2OfShape & Assign (const TopTools_Array2OfShape & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_Array2OfShape &
	:rtype: TopTools_Array2OfShape
") operator =;
		const TopTools_Array2OfShape & operator = (const TopTools_Array2OfShape & Other);
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
	:type Value: TopoDS_Shape &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const TopoDS_Shape & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: TopoDS_Shape
") Value;
		const TopoDS_Shape  Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: TopoDS_Shape
") ChangeValue;
		TopoDS_Shape  ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%extend TopTools_Array2OfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_DataMapIteratorOfDataMapOfIntegerListOfShape;
class TopTools_DataMapIteratorOfDataMapOfIntegerListOfShape : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TopTools_DataMapIteratorOfDataMapOfIntegerListOfShape;
		%feature("autodoc", "	:rtype: None
") TopTools_DataMapIteratorOfDataMapOfIntegerListOfShape;
		 TopTools_DataMapIteratorOfDataMapOfIntegerListOfShape ();
		%feature("compactdefaultargs") TopTools_DataMapIteratorOfDataMapOfIntegerListOfShape;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_DataMapOfIntegerListOfShape &
	:rtype: None
") TopTools_DataMapIteratorOfDataMapOfIntegerListOfShape;
		 TopTools_DataMapIteratorOfDataMapOfIntegerListOfShape (const TopTools_DataMapOfIntegerListOfShape & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_DataMapOfIntegerListOfShape &
	:rtype: None
") Initialize;
		void Initialize (const TopTools_DataMapOfIntegerListOfShape & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: int
") Key;
		const Standard_Integer & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") Value;
		const TopTools_ListOfShape & Value ();
};


%extend TopTools_DataMapIteratorOfDataMapOfIntegerListOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_DataMapIteratorOfDataMapOfIntegerShape;
class TopTools_DataMapIteratorOfDataMapOfIntegerShape : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TopTools_DataMapIteratorOfDataMapOfIntegerShape;
		%feature("autodoc", "	:rtype: None
") TopTools_DataMapIteratorOfDataMapOfIntegerShape;
		 TopTools_DataMapIteratorOfDataMapOfIntegerShape ();
		%feature("compactdefaultargs") TopTools_DataMapIteratorOfDataMapOfIntegerShape;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_DataMapOfIntegerShape &
	:rtype: None
") TopTools_DataMapIteratorOfDataMapOfIntegerShape;
		 TopTools_DataMapIteratorOfDataMapOfIntegerShape (const TopTools_DataMapOfIntegerShape & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_DataMapOfIntegerShape &
	:rtype: None
") Initialize;
		void Initialize (const TopTools_DataMapOfIntegerShape & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: int
") Key;
		const Standard_Integer & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Value;
		const TopoDS_Shape  Value ();
};


%extend TopTools_DataMapIteratorOfDataMapOfIntegerShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_DataMapIteratorOfDataMapOfOrientedShapeInteger;
class TopTools_DataMapIteratorOfDataMapOfOrientedShapeInteger : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TopTools_DataMapIteratorOfDataMapOfOrientedShapeInteger;
		%feature("autodoc", "	:rtype: None
") TopTools_DataMapIteratorOfDataMapOfOrientedShapeInteger;
		 TopTools_DataMapIteratorOfDataMapOfOrientedShapeInteger ();
		%feature("compactdefaultargs") TopTools_DataMapIteratorOfDataMapOfOrientedShapeInteger;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_DataMapOfOrientedShapeInteger &
	:rtype: None
") TopTools_DataMapIteratorOfDataMapOfOrientedShapeInteger;
		 TopTools_DataMapIteratorOfDataMapOfOrientedShapeInteger (const TopTools_DataMapOfOrientedShapeInteger & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_DataMapOfOrientedShapeInteger &
	:rtype: None
") Initialize;
		void Initialize (const TopTools_DataMapOfOrientedShapeInteger & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: int
") Value;
		const Standard_Integer & Value ();
};


%extend TopTools_DataMapIteratorOfDataMapOfOrientedShapeInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_DataMapIteratorOfDataMapOfOrientedShapeShape;
class TopTools_DataMapIteratorOfDataMapOfOrientedShapeShape : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TopTools_DataMapIteratorOfDataMapOfOrientedShapeShape;
		%feature("autodoc", "	:rtype: None
") TopTools_DataMapIteratorOfDataMapOfOrientedShapeShape;
		 TopTools_DataMapIteratorOfDataMapOfOrientedShapeShape ();
		%feature("compactdefaultargs") TopTools_DataMapIteratorOfDataMapOfOrientedShapeShape;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_DataMapOfOrientedShapeShape &
	:rtype: None
") TopTools_DataMapIteratorOfDataMapOfOrientedShapeShape;
		 TopTools_DataMapIteratorOfDataMapOfOrientedShapeShape (const TopTools_DataMapOfOrientedShapeShape & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_DataMapOfOrientedShapeShape &
	:rtype: None
") Initialize;
		void Initialize (const TopTools_DataMapOfOrientedShapeShape & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Value;
		const TopoDS_Shape  Value ();
};


%extend TopTools_DataMapIteratorOfDataMapOfOrientedShapeShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_DataMapIteratorOfDataMapOfShapeInteger;
class TopTools_DataMapIteratorOfDataMapOfShapeInteger : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TopTools_DataMapIteratorOfDataMapOfShapeInteger;
		%feature("autodoc", "	:rtype: None
") TopTools_DataMapIteratorOfDataMapOfShapeInteger;
		 TopTools_DataMapIteratorOfDataMapOfShapeInteger ();
		%feature("compactdefaultargs") TopTools_DataMapIteratorOfDataMapOfShapeInteger;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_DataMapOfShapeInteger &
	:rtype: None
") TopTools_DataMapIteratorOfDataMapOfShapeInteger;
		 TopTools_DataMapIteratorOfDataMapOfShapeInteger (const TopTools_DataMapOfShapeInteger & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_DataMapOfShapeInteger &
	:rtype: None
") Initialize;
		void Initialize (const TopTools_DataMapOfShapeInteger & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: int
") Value;
		const Standard_Integer & Value ();
};


%extend TopTools_DataMapIteratorOfDataMapOfShapeInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_DataMapIteratorOfDataMapOfShapeListOfInteger;
class TopTools_DataMapIteratorOfDataMapOfShapeListOfInteger : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TopTools_DataMapIteratorOfDataMapOfShapeListOfInteger;
		%feature("autodoc", "	:rtype: None
") TopTools_DataMapIteratorOfDataMapOfShapeListOfInteger;
		 TopTools_DataMapIteratorOfDataMapOfShapeListOfInteger ();
		%feature("compactdefaultargs") TopTools_DataMapIteratorOfDataMapOfShapeListOfInteger;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_DataMapOfShapeListOfInteger &
	:rtype: None
") TopTools_DataMapIteratorOfDataMapOfShapeListOfInteger;
		 TopTools_DataMapIteratorOfDataMapOfShapeListOfInteger (const TopTools_DataMapOfShapeListOfInteger & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_DataMapOfShapeListOfInteger &
	:rtype: None
") Initialize;
		void Initialize (const TopTools_DataMapOfShapeListOfInteger & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TColStd_ListOfInteger
") Value;
		const TColStd_ListOfInteger & Value ();
};


%extend TopTools_DataMapIteratorOfDataMapOfShapeListOfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_DataMapIteratorOfDataMapOfShapeListOfShape;
class TopTools_DataMapIteratorOfDataMapOfShapeListOfShape : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TopTools_DataMapIteratorOfDataMapOfShapeListOfShape;
		%feature("autodoc", "	:rtype: None
") TopTools_DataMapIteratorOfDataMapOfShapeListOfShape;
		 TopTools_DataMapIteratorOfDataMapOfShapeListOfShape ();
		%feature("compactdefaultargs") TopTools_DataMapIteratorOfDataMapOfShapeListOfShape;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_DataMapOfShapeListOfShape &
	:rtype: None
") TopTools_DataMapIteratorOfDataMapOfShapeListOfShape;
		 TopTools_DataMapIteratorOfDataMapOfShapeListOfShape (const TopTools_DataMapOfShapeListOfShape & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_DataMapOfShapeListOfShape &
	:rtype: None
") Initialize;
		void Initialize (const TopTools_DataMapOfShapeListOfShape & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") Value;
		const TopTools_ListOfShape & Value ();
};


%extend TopTools_DataMapIteratorOfDataMapOfShapeListOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_DataMapIteratorOfDataMapOfShapeReal;
class TopTools_DataMapIteratorOfDataMapOfShapeReal : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TopTools_DataMapIteratorOfDataMapOfShapeReal;
		%feature("autodoc", "	:rtype: None
") TopTools_DataMapIteratorOfDataMapOfShapeReal;
		 TopTools_DataMapIteratorOfDataMapOfShapeReal ();
		%feature("compactdefaultargs") TopTools_DataMapIteratorOfDataMapOfShapeReal;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_DataMapOfShapeReal &
	:rtype: None
") TopTools_DataMapIteratorOfDataMapOfShapeReal;
		 TopTools_DataMapIteratorOfDataMapOfShapeReal (const TopTools_DataMapOfShapeReal & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_DataMapOfShapeReal &
	:rtype: None
") Initialize;
		void Initialize (const TopTools_DataMapOfShapeReal & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: float
") Value;
		const Standard_Real & Value ();
};


%extend TopTools_DataMapIteratorOfDataMapOfShapeReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_DataMapIteratorOfDataMapOfShapeSequenceOfShape;
class TopTools_DataMapIteratorOfDataMapOfShapeSequenceOfShape : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TopTools_DataMapIteratorOfDataMapOfShapeSequenceOfShape;
		%feature("autodoc", "	:rtype: None
") TopTools_DataMapIteratorOfDataMapOfShapeSequenceOfShape;
		 TopTools_DataMapIteratorOfDataMapOfShapeSequenceOfShape ();
		%feature("compactdefaultargs") TopTools_DataMapIteratorOfDataMapOfShapeSequenceOfShape;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_DataMapOfShapeSequenceOfShape &
	:rtype: None
") TopTools_DataMapIteratorOfDataMapOfShapeSequenceOfShape;
		 TopTools_DataMapIteratorOfDataMapOfShapeSequenceOfShape (const TopTools_DataMapOfShapeSequenceOfShape & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_DataMapOfShapeSequenceOfShape &
	:rtype: None
") Initialize;
		void Initialize (const TopTools_DataMapOfShapeSequenceOfShape & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopTools_SequenceOfShape
") Value;
		const TopTools_SequenceOfShape & Value ();
};


%extend TopTools_DataMapIteratorOfDataMapOfShapeSequenceOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_DataMapIteratorOfDataMapOfShapeShape;
class TopTools_DataMapIteratorOfDataMapOfShapeShape : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TopTools_DataMapIteratorOfDataMapOfShapeShape;
		%feature("autodoc", "	:rtype: None
") TopTools_DataMapIteratorOfDataMapOfShapeShape;
		 TopTools_DataMapIteratorOfDataMapOfShapeShape ();
		%feature("compactdefaultargs") TopTools_DataMapIteratorOfDataMapOfShapeShape;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_DataMapOfShapeShape &
	:rtype: None
") TopTools_DataMapIteratorOfDataMapOfShapeShape;
		 TopTools_DataMapIteratorOfDataMapOfShapeShape (const TopTools_DataMapOfShapeShape & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_DataMapOfShapeShape &
	:rtype: None
") Initialize;
		void Initialize (const TopTools_DataMapOfShapeShape & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Value;
		const TopoDS_Shape  Value ();
};


%extend TopTools_DataMapIteratorOfDataMapOfShapeShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_DataMapNodeOfDataMapOfIntegerListOfShape;
class TopTools_DataMapNodeOfDataMapOfIntegerListOfShape : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TopTools_DataMapNodeOfDataMapOfIntegerListOfShape;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: TopTools_ListOfShape &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopTools_DataMapNodeOfDataMapOfIntegerListOfShape;
		 TopTools_DataMapNodeOfDataMapOfIntegerListOfShape (const Standard_Integer & K,const TopTools_ListOfShape & I,const TCollection_MapNodePtr & n);

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
            		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") Value;
		TopTools_ListOfShape & Value ();
};


%extend TopTools_DataMapNodeOfDataMapOfIntegerListOfShape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopTools_DataMapNodeOfDataMapOfIntegerListOfShape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopTools_DataMapNodeOfDataMapOfIntegerListOfShape::Handle_TopTools_DataMapNodeOfDataMapOfIntegerListOfShape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    TopTools_DataMapNodeOfDataMapOfIntegerListOfShape* _get_reference() {
    return (TopTools_DataMapNodeOfDataMapOfIntegerListOfShape*)$self->Access();
    }
};

%extend Handle_TopTools_DataMapNodeOfDataMapOfIntegerListOfShape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopTools_DataMapNodeOfDataMapOfIntegerListOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_DataMapNodeOfDataMapOfIntegerShape;
class TopTools_DataMapNodeOfDataMapOfIntegerShape : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TopTools_DataMapNodeOfDataMapOfIntegerShape;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: TopoDS_Shape &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopTools_DataMapNodeOfDataMapOfIntegerShape;
		 TopTools_DataMapNodeOfDataMapOfIntegerShape (const Standard_Integer & K,const TopoDS_Shape & I,const TCollection_MapNodePtr & n);

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
            		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Value;
		TopoDS_Shape  Value ();
};


%extend TopTools_DataMapNodeOfDataMapOfIntegerShape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopTools_DataMapNodeOfDataMapOfIntegerShape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopTools_DataMapNodeOfDataMapOfIntegerShape::Handle_TopTools_DataMapNodeOfDataMapOfIntegerShape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    TopTools_DataMapNodeOfDataMapOfIntegerShape* _get_reference() {
    return (TopTools_DataMapNodeOfDataMapOfIntegerShape*)$self->Access();
    }
};

%extend Handle_TopTools_DataMapNodeOfDataMapOfIntegerShape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopTools_DataMapNodeOfDataMapOfIntegerShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_DataMapNodeOfDataMapOfOrientedShapeInteger;
class TopTools_DataMapNodeOfDataMapOfOrientedShapeInteger : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TopTools_DataMapNodeOfDataMapOfOrientedShapeInteger;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: int &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopTools_DataMapNodeOfDataMapOfOrientedShapeInteger;
		 TopTools_DataMapNodeOfDataMapOfOrientedShapeInteger (const TopoDS_Shape & K,const Standard_Integer & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
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


%extend TopTools_DataMapNodeOfDataMapOfOrientedShapeInteger {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopTools_DataMapNodeOfDataMapOfOrientedShapeInteger(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopTools_DataMapNodeOfDataMapOfOrientedShapeInteger::Handle_TopTools_DataMapNodeOfDataMapOfOrientedShapeInteger %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    TopTools_DataMapNodeOfDataMapOfOrientedShapeInteger* _get_reference() {
    return (TopTools_DataMapNodeOfDataMapOfOrientedShapeInteger*)$self->Access();
    }
};

%extend Handle_TopTools_DataMapNodeOfDataMapOfOrientedShapeInteger {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopTools_DataMapNodeOfDataMapOfOrientedShapeInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_DataMapNodeOfDataMapOfOrientedShapeShape;
class TopTools_DataMapNodeOfDataMapOfOrientedShapeShape : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TopTools_DataMapNodeOfDataMapOfOrientedShapeShape;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TopoDS_Shape &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopTools_DataMapNodeOfDataMapOfOrientedShapeShape;
		 TopTools_DataMapNodeOfDataMapOfOrientedShapeShape (const TopoDS_Shape & K,const TopoDS_Shape & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Value;
		TopoDS_Shape  Value ();
};


%extend TopTools_DataMapNodeOfDataMapOfOrientedShapeShape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopTools_DataMapNodeOfDataMapOfOrientedShapeShape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopTools_DataMapNodeOfDataMapOfOrientedShapeShape::Handle_TopTools_DataMapNodeOfDataMapOfOrientedShapeShape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    TopTools_DataMapNodeOfDataMapOfOrientedShapeShape* _get_reference() {
    return (TopTools_DataMapNodeOfDataMapOfOrientedShapeShape*)$self->Access();
    }
};

%extend Handle_TopTools_DataMapNodeOfDataMapOfOrientedShapeShape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopTools_DataMapNodeOfDataMapOfOrientedShapeShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_DataMapNodeOfDataMapOfShapeInteger;
class TopTools_DataMapNodeOfDataMapOfShapeInteger : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TopTools_DataMapNodeOfDataMapOfShapeInteger;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: int &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopTools_DataMapNodeOfDataMapOfShapeInteger;
		 TopTools_DataMapNodeOfDataMapOfShapeInteger (const TopoDS_Shape & K,const Standard_Integer & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
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


%extend TopTools_DataMapNodeOfDataMapOfShapeInteger {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopTools_DataMapNodeOfDataMapOfShapeInteger(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopTools_DataMapNodeOfDataMapOfShapeInteger::Handle_TopTools_DataMapNodeOfDataMapOfShapeInteger %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    TopTools_DataMapNodeOfDataMapOfShapeInteger* _get_reference() {
    return (TopTools_DataMapNodeOfDataMapOfShapeInteger*)$self->Access();
    }
};

%extend Handle_TopTools_DataMapNodeOfDataMapOfShapeInteger {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopTools_DataMapNodeOfDataMapOfShapeInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_DataMapNodeOfDataMapOfShapeListOfInteger;
class TopTools_DataMapNodeOfDataMapOfShapeListOfInteger : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TopTools_DataMapNodeOfDataMapOfShapeListOfInteger;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TColStd_ListOfInteger &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopTools_DataMapNodeOfDataMapOfShapeListOfInteger;
		 TopTools_DataMapNodeOfDataMapOfShapeListOfInteger (const TopoDS_Shape & K,const TColStd_ListOfInteger & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TColStd_ListOfInteger
") Value;
		TColStd_ListOfInteger & Value ();
};


%extend TopTools_DataMapNodeOfDataMapOfShapeListOfInteger {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopTools_DataMapNodeOfDataMapOfShapeListOfInteger(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopTools_DataMapNodeOfDataMapOfShapeListOfInteger::Handle_TopTools_DataMapNodeOfDataMapOfShapeListOfInteger %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    TopTools_DataMapNodeOfDataMapOfShapeListOfInteger* _get_reference() {
    return (TopTools_DataMapNodeOfDataMapOfShapeListOfInteger*)$self->Access();
    }
};

%extend Handle_TopTools_DataMapNodeOfDataMapOfShapeListOfInteger {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopTools_DataMapNodeOfDataMapOfShapeListOfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_DataMapNodeOfDataMapOfShapeListOfShape;
class TopTools_DataMapNodeOfDataMapOfShapeListOfShape : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TopTools_DataMapNodeOfDataMapOfShapeListOfShape;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TopTools_ListOfShape &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopTools_DataMapNodeOfDataMapOfShapeListOfShape;
		 TopTools_DataMapNodeOfDataMapOfShapeListOfShape (const TopoDS_Shape & K,const TopTools_ListOfShape & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") Value;
		TopTools_ListOfShape & Value ();
};


%extend TopTools_DataMapNodeOfDataMapOfShapeListOfShape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopTools_DataMapNodeOfDataMapOfShapeListOfShape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopTools_DataMapNodeOfDataMapOfShapeListOfShape::Handle_TopTools_DataMapNodeOfDataMapOfShapeListOfShape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    TopTools_DataMapNodeOfDataMapOfShapeListOfShape* _get_reference() {
    return (TopTools_DataMapNodeOfDataMapOfShapeListOfShape*)$self->Access();
    }
};

%extend Handle_TopTools_DataMapNodeOfDataMapOfShapeListOfShape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopTools_DataMapNodeOfDataMapOfShapeListOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_DataMapNodeOfDataMapOfShapeReal;
class TopTools_DataMapNodeOfDataMapOfShapeReal : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TopTools_DataMapNodeOfDataMapOfShapeReal;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: float &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopTools_DataMapNodeOfDataMapOfShapeReal;
		 TopTools_DataMapNodeOfDataMapOfShapeReal (const TopoDS_Shape & K,const Standard_Real & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
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


%extend TopTools_DataMapNodeOfDataMapOfShapeReal {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopTools_DataMapNodeOfDataMapOfShapeReal(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopTools_DataMapNodeOfDataMapOfShapeReal::Handle_TopTools_DataMapNodeOfDataMapOfShapeReal %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    TopTools_DataMapNodeOfDataMapOfShapeReal* _get_reference() {
    return (TopTools_DataMapNodeOfDataMapOfShapeReal*)$self->Access();
    }
};

%extend Handle_TopTools_DataMapNodeOfDataMapOfShapeReal {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopTools_DataMapNodeOfDataMapOfShapeReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_DataMapNodeOfDataMapOfShapeSequenceOfShape;
class TopTools_DataMapNodeOfDataMapOfShapeSequenceOfShape : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TopTools_DataMapNodeOfDataMapOfShapeSequenceOfShape;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TopTools_SequenceOfShape &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopTools_DataMapNodeOfDataMapOfShapeSequenceOfShape;
		 TopTools_DataMapNodeOfDataMapOfShapeSequenceOfShape (const TopoDS_Shape & K,const TopTools_SequenceOfShape & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopTools_SequenceOfShape
") Value;
		TopTools_SequenceOfShape & Value ();
};


%extend TopTools_DataMapNodeOfDataMapOfShapeSequenceOfShape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopTools_DataMapNodeOfDataMapOfShapeSequenceOfShape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopTools_DataMapNodeOfDataMapOfShapeSequenceOfShape::Handle_TopTools_DataMapNodeOfDataMapOfShapeSequenceOfShape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    TopTools_DataMapNodeOfDataMapOfShapeSequenceOfShape* _get_reference() {
    return (TopTools_DataMapNodeOfDataMapOfShapeSequenceOfShape*)$self->Access();
    }
};

%extend Handle_TopTools_DataMapNodeOfDataMapOfShapeSequenceOfShape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopTools_DataMapNodeOfDataMapOfShapeSequenceOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_DataMapNodeOfDataMapOfShapeShape;
class TopTools_DataMapNodeOfDataMapOfShapeShape : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TopTools_DataMapNodeOfDataMapOfShapeShape;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TopoDS_Shape &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopTools_DataMapNodeOfDataMapOfShapeShape;
		 TopTools_DataMapNodeOfDataMapOfShapeShape (const TopoDS_Shape & K,const TopoDS_Shape & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Value;
		TopoDS_Shape  Value ();
};


%extend TopTools_DataMapNodeOfDataMapOfShapeShape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopTools_DataMapNodeOfDataMapOfShapeShape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopTools_DataMapNodeOfDataMapOfShapeShape::Handle_TopTools_DataMapNodeOfDataMapOfShapeShape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    TopTools_DataMapNodeOfDataMapOfShapeShape* _get_reference() {
    return (TopTools_DataMapNodeOfDataMapOfShapeShape*)$self->Access();
    }
};

%extend Handle_TopTools_DataMapNodeOfDataMapOfShapeShape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopTools_DataMapNodeOfDataMapOfShapeShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_DataMapOfIntegerListOfShape;
class TopTools_DataMapOfIntegerListOfShape : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TopTools_DataMapOfIntegerListOfShape;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TopTools_DataMapOfIntegerListOfShape;
		 TopTools_DataMapOfIntegerListOfShape (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_DataMapOfIntegerListOfShape &
	:rtype: TopTools_DataMapOfIntegerListOfShape
") Assign;
		TopTools_DataMapOfIntegerListOfShape & Assign (const TopTools_DataMapOfIntegerListOfShape & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_DataMapOfIntegerListOfShape &
	:rtype: TopTools_DataMapOfIntegerListOfShape
") operator =;
		TopTools_DataMapOfIntegerListOfShape & operator = (const TopTools_DataMapOfIntegerListOfShape & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: TopTools_ListOfShape &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Standard_Integer & K,const TopTools_ListOfShape & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Standard_Integer & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: TopTools_ListOfShape
") Find;
		const TopTools_ListOfShape & Find (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: TopTools_ListOfShape
") ChangeFind;
		TopTools_ListOfShape & ChangeFind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const Standard_Integer & K);
};


%extend TopTools_DataMapOfIntegerListOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_DataMapOfIntegerShape;
class TopTools_DataMapOfIntegerShape : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TopTools_DataMapOfIntegerShape;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TopTools_DataMapOfIntegerShape;
		 TopTools_DataMapOfIntegerShape (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_DataMapOfIntegerShape &
	:rtype: TopTools_DataMapOfIntegerShape
") Assign;
		TopTools_DataMapOfIntegerShape & Assign (const TopTools_DataMapOfIntegerShape & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_DataMapOfIntegerShape &
	:rtype: TopTools_DataMapOfIntegerShape
") operator =;
		TopTools_DataMapOfIntegerShape & operator = (const TopTools_DataMapOfIntegerShape & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:param I:
	:type I: TopoDS_Shape &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Standard_Integer & K,const TopoDS_Shape & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Standard_Integer & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: TopoDS_Shape
") Find;
		const TopoDS_Shape  Find (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: TopoDS_Shape
") ChangeFind;
		TopoDS_Shape  ChangeFind (const Standard_Integer & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const Standard_Integer & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: int &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const Standard_Integer & K);
};


%extend TopTools_DataMapOfIntegerShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_DataMapOfOrientedShapeInteger;
class TopTools_DataMapOfOrientedShapeInteger : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TopTools_DataMapOfOrientedShapeInteger;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TopTools_DataMapOfOrientedShapeInteger;
		 TopTools_DataMapOfOrientedShapeInteger (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_DataMapOfOrientedShapeInteger &
	:rtype: TopTools_DataMapOfOrientedShapeInteger
") Assign;
		TopTools_DataMapOfOrientedShapeInteger & Assign (const TopTools_DataMapOfOrientedShapeInteger & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_DataMapOfOrientedShapeInteger &
	:rtype: TopTools_DataMapOfOrientedShapeInteger
") operator =;
		TopTools_DataMapOfOrientedShapeInteger & operator = (const TopTools_DataMapOfOrientedShapeInteger & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: int &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const Standard_Integer & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: int
") Find;
		const Standard_Integer & Find (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: int
") ChangeFind;
		Standard_Integer & ChangeFind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%extend TopTools_DataMapOfOrientedShapeInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_DataMapOfOrientedShapeShape;
class TopTools_DataMapOfOrientedShapeShape : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TopTools_DataMapOfOrientedShapeShape;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TopTools_DataMapOfOrientedShapeShape;
		 TopTools_DataMapOfOrientedShapeShape (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_DataMapOfOrientedShapeShape &
	:rtype: TopTools_DataMapOfOrientedShapeShape
") Assign;
		TopTools_DataMapOfOrientedShapeShape & Assign (const TopTools_DataMapOfOrientedShapeShape & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_DataMapOfOrientedShapeShape &
	:rtype: TopTools_DataMapOfOrientedShapeShape
") operator =;
		TopTools_DataMapOfOrientedShapeShape & operator = (const TopTools_DataMapOfOrientedShapeShape & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TopoDS_Shape &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const TopoDS_Shape & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopoDS_Shape
") Find;
		const TopoDS_Shape  Find (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopoDS_Shape
") ChangeFind;
		TopoDS_Shape  ChangeFind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%extend TopTools_DataMapOfOrientedShapeShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_DataMapOfShapeInteger;
class TopTools_DataMapOfShapeInteger : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TopTools_DataMapOfShapeInteger;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TopTools_DataMapOfShapeInteger;
		 TopTools_DataMapOfShapeInteger (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_DataMapOfShapeInteger &
	:rtype: TopTools_DataMapOfShapeInteger
") Assign;
		TopTools_DataMapOfShapeInteger & Assign (const TopTools_DataMapOfShapeInteger & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_DataMapOfShapeInteger &
	:rtype: TopTools_DataMapOfShapeInteger
") operator =;
		TopTools_DataMapOfShapeInteger & operator = (const TopTools_DataMapOfShapeInteger & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: int &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const Standard_Integer & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: int
") Find;
		const Standard_Integer & Find (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: int
") ChangeFind;
		Standard_Integer & ChangeFind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%extend TopTools_DataMapOfShapeInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_DataMapOfShapeListOfInteger;
class TopTools_DataMapOfShapeListOfInteger : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TopTools_DataMapOfShapeListOfInteger;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TopTools_DataMapOfShapeListOfInteger;
		 TopTools_DataMapOfShapeListOfInteger (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_DataMapOfShapeListOfInteger &
	:rtype: TopTools_DataMapOfShapeListOfInteger
") Assign;
		TopTools_DataMapOfShapeListOfInteger & Assign (const TopTools_DataMapOfShapeListOfInteger & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_DataMapOfShapeListOfInteger &
	:rtype: TopTools_DataMapOfShapeListOfInteger
") operator =;
		TopTools_DataMapOfShapeListOfInteger & operator = (const TopTools_DataMapOfShapeListOfInteger & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TColStd_ListOfInteger &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const TColStd_ListOfInteger & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TColStd_ListOfInteger
") Find;
		const TColStd_ListOfInteger & Find (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TColStd_ListOfInteger
") ChangeFind;
		TColStd_ListOfInteger & ChangeFind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%extend TopTools_DataMapOfShapeListOfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_DataMapOfShapeListOfShape;
class TopTools_DataMapOfShapeListOfShape : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TopTools_DataMapOfShapeListOfShape;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TopTools_DataMapOfShapeListOfShape;
		 TopTools_DataMapOfShapeListOfShape (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_DataMapOfShapeListOfShape &
	:rtype: TopTools_DataMapOfShapeListOfShape
") Assign;
		TopTools_DataMapOfShapeListOfShape & Assign (const TopTools_DataMapOfShapeListOfShape & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_DataMapOfShapeListOfShape &
	:rtype: TopTools_DataMapOfShapeListOfShape
") operator =;
		TopTools_DataMapOfShapeListOfShape & operator = (const TopTools_DataMapOfShapeListOfShape & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TopTools_ListOfShape &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const TopTools_ListOfShape & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") Find;
		const TopTools_ListOfShape & Find (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") ChangeFind;
		TopTools_ListOfShape & ChangeFind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%extend TopTools_DataMapOfShapeListOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_DataMapOfShapeReal;
class TopTools_DataMapOfShapeReal : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TopTools_DataMapOfShapeReal;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TopTools_DataMapOfShapeReal;
		 TopTools_DataMapOfShapeReal (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_DataMapOfShapeReal &
	:rtype: TopTools_DataMapOfShapeReal
") Assign;
		TopTools_DataMapOfShapeReal & Assign (const TopTools_DataMapOfShapeReal & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_DataMapOfShapeReal &
	:rtype: TopTools_DataMapOfShapeReal
") operator =;
		TopTools_DataMapOfShapeReal & operator = (const TopTools_DataMapOfShapeReal & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: float &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const Standard_Real & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: float
") Find;
		const Standard_Real & Find (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: float
") ChangeFind;
		Standard_Real & ChangeFind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%extend TopTools_DataMapOfShapeReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_DataMapOfShapeSequenceOfShape;
class TopTools_DataMapOfShapeSequenceOfShape : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TopTools_DataMapOfShapeSequenceOfShape;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TopTools_DataMapOfShapeSequenceOfShape;
		 TopTools_DataMapOfShapeSequenceOfShape (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_DataMapOfShapeSequenceOfShape &
	:rtype: TopTools_DataMapOfShapeSequenceOfShape
") Assign;
		TopTools_DataMapOfShapeSequenceOfShape & Assign (const TopTools_DataMapOfShapeSequenceOfShape & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_DataMapOfShapeSequenceOfShape &
	:rtype: TopTools_DataMapOfShapeSequenceOfShape
") operator =;
		TopTools_DataMapOfShapeSequenceOfShape & operator = (const TopTools_DataMapOfShapeSequenceOfShape & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TopTools_SequenceOfShape &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const TopTools_SequenceOfShape & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopTools_SequenceOfShape
") Find;
		const TopTools_SequenceOfShape & Find (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopTools_SequenceOfShape
") ChangeFind;
		TopTools_SequenceOfShape & ChangeFind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%extend TopTools_DataMapOfShapeSequenceOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_DataMapOfShapeShape;
class TopTools_DataMapOfShapeShape : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TopTools_DataMapOfShapeShape;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TopTools_DataMapOfShapeShape;
		 TopTools_DataMapOfShapeShape (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_DataMapOfShapeShape &
	:rtype: TopTools_DataMapOfShapeShape
") Assign;
		TopTools_DataMapOfShapeShape & Assign (const TopTools_DataMapOfShapeShape & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_DataMapOfShapeShape &
	:rtype: TopTools_DataMapOfShapeShape
") operator =;
		TopTools_DataMapOfShapeShape & operator = (const TopTools_DataMapOfShapeShape & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TopoDS_Shape &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const TopoDS_Shape & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopoDS_Shape
") Find;
		const TopoDS_Shape  Find (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopoDS_Shape
") ChangeFind;
		TopoDS_Shape  ChangeFind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%extend TopTools_DataMapOfShapeShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_HArray1OfListOfShape;
class TopTools_HArray1OfListOfShape : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TopTools_HArray1OfListOfShape;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TopTools_HArray1OfListOfShape;
		 TopTools_HArray1OfListOfShape (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TopTools_HArray1OfListOfShape;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: TopTools_ListOfShape &
	:rtype: None
") TopTools_HArray1OfListOfShape;
		 TopTools_HArray1OfListOfShape (const Standard_Integer Low,const Standard_Integer Up,const TopTools_ListOfShape & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: TopTools_ListOfShape &
	:rtype: None
") Init;
		void Init (const TopTools_ListOfShape & V);
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
	:type Value: TopTools_ListOfShape &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const TopTools_ListOfShape & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TopTools_ListOfShape
") Value;
		const TopTools_ListOfShape & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TopTools_ListOfShape
") ChangeValue;
		TopTools_ListOfShape & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: TopTools_Array1OfListOfShape
") Array1;
		const TopTools_Array1OfListOfShape & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: TopTools_Array1OfListOfShape
") ChangeArray1;
		TopTools_Array1OfListOfShape & ChangeArray1 ();
};


%extend TopTools_HArray1OfListOfShape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopTools_HArray1OfListOfShape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopTools_HArray1OfListOfShape::Handle_TopTools_HArray1OfListOfShape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    TopTools_HArray1OfListOfShape* _get_reference() {
    return (TopTools_HArray1OfListOfShape*)$self->Access();
    }
};

%extend Handle_TopTools_HArray1OfListOfShape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopTools_HArray1OfListOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_HArray1OfShape;
class TopTools_HArray1OfShape : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TopTools_HArray1OfShape;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") TopTools_HArray1OfShape;
		 TopTools_HArray1OfShape (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") TopTools_HArray1OfShape;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: TopoDS_Shape &
	:rtype: None
") TopTools_HArray1OfShape;
		 TopTools_HArray1OfShape (const Standard_Integer Low,const Standard_Integer Up,const TopoDS_Shape & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: TopoDS_Shape &
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & V);
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
	:type Value: TopoDS_Shape &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const TopoDS_Shape & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TopoDS_Shape
") Value;
		const TopoDS_Shape  Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TopoDS_Shape
") ChangeValue;
		TopoDS_Shape  ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: TopTools_Array1OfShape
") Array1;
		const TopTools_Array1OfShape & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: TopTools_Array1OfShape
") ChangeArray1;
		TopTools_Array1OfShape & ChangeArray1 ();
};


%extend TopTools_HArray1OfShape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopTools_HArray1OfShape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopTools_HArray1OfShape::Handle_TopTools_HArray1OfShape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    TopTools_HArray1OfShape* _get_reference() {
    return (TopTools_HArray1OfShape*)$self->Access();
    }
};

%extend Handle_TopTools_HArray1OfShape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopTools_HArray1OfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_HArray2OfShape;
class TopTools_HArray2OfShape : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TopTools_HArray2OfShape;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") TopTools_HArray2OfShape;
		 TopTools_HArray2OfShape (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") TopTools_HArray2OfShape;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:param V:
	:type V: TopoDS_Shape &
	:rtype: None
") TopTools_HArray2OfShape;
		 TopTools_HArray2OfShape (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const TopoDS_Shape & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: TopoDS_Shape &
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & V);
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
	:type Value: TopoDS_Shape &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const TopoDS_Shape & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: TopoDS_Shape
") Value;
		const TopoDS_Shape  Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: TopoDS_Shape
") ChangeValue;
		TopoDS_Shape  ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") Array2;
		%feature("autodoc", "	:rtype: TopTools_Array2OfShape
") Array2;
		const TopTools_Array2OfShape & Array2 ();
		%feature("compactdefaultargs") ChangeArray2;
		%feature("autodoc", "	:rtype: TopTools_Array2OfShape
") ChangeArray2;
		TopTools_Array2OfShape & ChangeArray2 ();
};


%extend TopTools_HArray2OfShape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopTools_HArray2OfShape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopTools_HArray2OfShape::Handle_TopTools_HArray2OfShape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    TopTools_HArray2OfShape* _get_reference() {
    return (TopTools_HArray2OfShape*)$self->Access();
    }
};

%extend Handle_TopTools_HArray2OfShape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopTools_HArray2OfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_HSequenceOfShape;
class TopTools_HSequenceOfShape : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TopTools_HSequenceOfShape;
		%feature("autodoc", "	:rtype: None
") TopTools_HSequenceOfShape;
		 TopTools_HSequenceOfShape ();
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
	:type anItem: TopoDS_Shape &
	:rtype: None
") Append;
		void Append (const TopoDS_Shape & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TopTools_HSequenceOfShape &
	:rtype: None
") Append;
		void Append (const Handle_TopTools_HSequenceOfShape & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: TopoDS_Shape &
	:rtype: None
") Prepend;
		void Prepend (const TopoDS_Shape & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TopTools_HSequenceOfShape &
	:rtype: None
") Prepend;
		void Prepend (const Handle_TopTools_HSequenceOfShape & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: TopoDS_Shape &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const TopoDS_Shape & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_TopTools_HSequenceOfShape &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TopTools_HSequenceOfShape & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: TopoDS_Shape &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const TopoDS_Shape & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_TopTools_HSequenceOfShape &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TopTools_HSequenceOfShape & aSequence);
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
	:rtype: Handle_TopTools_HSequenceOfShape
") Split;
		Handle_TopTools_HSequenceOfShape Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: TopoDS_Shape &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const TopoDS_Shape & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: TopoDS_Shape
") Value;
		const TopoDS_Shape  Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: TopoDS_Shape
") ChangeValue;
		TopoDS_Shape  ChangeValue (const Standard_Integer anIndex);
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
		%feature("autodoc", "	:rtype: TopTools_SequenceOfShape
") Sequence;
		const TopTools_SequenceOfShape & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: TopTools_SequenceOfShape
") ChangeSequence;
		TopTools_SequenceOfShape & ChangeSequence ();
};


%extend TopTools_HSequenceOfShape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopTools_HSequenceOfShape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopTools_HSequenceOfShape::Handle_TopTools_HSequenceOfShape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    TopTools_HSequenceOfShape* _get_reference() {
    return (TopTools_HSequenceOfShape*)$self->Access();
    }
};

%extend Handle_TopTools_HSequenceOfShape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopTools_HSequenceOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeAddress;
class TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeAddress : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeAddress;
		%feature("autodoc", "	:param K1:
	:type K1: TopoDS_Shape &
	:param K2:
	:type K2: int
	:param I:
	:type I: Standard_Address &
	:param n1:
	:type n1: TCollection_MapNodePtr &
	:param n2:
	:type n2: TCollection_MapNodePtr &
	:rtype: None
") TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeAddress;
		 TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeAddress (const TopoDS_Shape & K1,const Standard_Integer K2,const Standard_Address & I,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("compactdefaultargs") Key1;
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
            		%feature("compactdefaultargs") Next2;
		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next2;
		TCollection_MapNodePtr & Next2 ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Standard_Address
") Value;
		Standard_Address & Value ();
};


%extend TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeAddress {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeAddress(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeAddress::Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeAddress %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeAddress* _get_reference() {
    return (TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeAddress*)$self->Access();
    }
};

%extend Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeAddress {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeAddress {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeListOfShape;
class TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeListOfShape : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeListOfShape;
		%feature("autodoc", "	:param K1:
	:type K1: TopoDS_Shape &
	:param K2:
	:type K2: int
	:param I:
	:type I: TopTools_ListOfShape &
	:param n1:
	:type n1: TCollection_MapNodePtr &
	:param n2:
	:type n2: TCollection_MapNodePtr &
	:rtype: None
") TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeListOfShape;
		 TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeListOfShape (const TopoDS_Shape & K1,const Standard_Integer K2,const TopTools_ListOfShape & I,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("compactdefaultargs") Key1;
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
            		%feature("compactdefaultargs") Next2;
		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next2;
		TCollection_MapNodePtr & Next2 ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") Value;
		TopTools_ListOfShape & Value ();
};


%extend TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeListOfShape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeListOfShape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeListOfShape::Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeListOfShape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeListOfShape* _get_reference() {
    return (TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeListOfShape*)$self->Access();
    }
};

%extend Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeListOfShape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeListOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeShape;
class TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeShape : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeShape;
		%feature("autodoc", "	:param K1:
	:type K1: TopoDS_Shape &
	:param K2:
	:type K2: int
	:param I:
	:type I: TopoDS_Shape &
	:param n1:
	:type n1: TCollection_MapNodePtr &
	:param n2:
	:type n2: TCollection_MapNodePtr &
	:rtype: None
") TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeShape;
		 TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeShape (const TopoDS_Shape & K1,const Standard_Integer K2,const TopoDS_Shape & I,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("compactdefaultargs") Key1;
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
            		%feature("compactdefaultargs") Next2;
		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next2;
		TCollection_MapNodePtr & Next2 ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Value;
		TopoDS_Shape  Value ();
};


%extend TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeShape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeShape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeShape::Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeShape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeShape* _get_reference() {
    return (TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeShape*)$self->Access();
    }
};

%extend Handle_TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeShape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_IndexedDataMapOfShapeAddress;
class TopTools_IndexedDataMapOfShapeAddress : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TopTools_IndexedDataMapOfShapeAddress;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TopTools_IndexedDataMapOfShapeAddress;
		 TopTools_IndexedDataMapOfShapeAddress (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_IndexedDataMapOfShapeAddress &
	:rtype: TopTools_IndexedDataMapOfShapeAddress
") Assign;
		TopTools_IndexedDataMapOfShapeAddress & Assign (const TopTools_IndexedDataMapOfShapeAddress & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_IndexedDataMapOfShapeAddress &
	:rtype: TopTools_IndexedDataMapOfShapeAddress
") operator =;
		TopTools_IndexedDataMapOfShapeAddress & operator = (const TopTools_IndexedDataMapOfShapeAddress & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: Standard_Address &
	:rtype: int
") Add;
		Standard_Integer Add (const TopoDS_Shape & K,const Standard_Address & I);
		%feature("compactdefaultargs") Substitute;
		%feature("autodoc", "	:param I:
	:type I: int
	:param K:
	:type K: TopoDS_Shape &
	:param T:
	:type T: Standard_Address &
	:rtype: None
") Substitute;
		void Substitute (const Standard_Integer I,const TopoDS_Shape & K,const Standard_Address & T);
		%feature("compactdefaultargs") RemoveLast;
		%feature("autodoc", "	:rtype: None
") RemoveLast;
		void RemoveLast ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const TopoDS_Shape & K);
		%feature("compactdefaultargs") FindKey;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: TopoDS_Shape
") FindKey;
		const TopoDS_Shape  FindKey (const Standard_Integer I);
		%feature("compactdefaultargs") FindFromIndex;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: Standard_Address
") FindFromIndex;
		const Standard_Address & FindFromIndex (const Standard_Integer I);
		%feature("compactdefaultargs") ChangeFromIndex;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: Standard_Address
") ChangeFromIndex;
		Standard_Address & ChangeFromIndex (const Standard_Integer I);
		%feature("compactdefaultargs") FindIndex;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: int
") FindIndex;
		Standard_Integer FindIndex (const TopoDS_Shape & K);
		%feature("compactdefaultargs") FindFromKey;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") FindFromKey;
		const Standard_Address & FindFromKey (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFromKey;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFromKey;
		Standard_Address & ChangeFromKey (const TopoDS_Shape & K);
		%feature("compactdefaultargs") FindFromKey1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") FindFromKey1;
		Standard_Address FindFromKey1 (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFromKey1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFromKey1;
		Standard_Address ChangeFromKey1 (const TopoDS_Shape & K);
};


%extend TopTools_IndexedDataMapOfShapeAddress {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_IndexedDataMapOfShapeListOfShape;
class TopTools_IndexedDataMapOfShapeListOfShape : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TopTools_IndexedDataMapOfShapeListOfShape;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TopTools_IndexedDataMapOfShapeListOfShape;
		 TopTools_IndexedDataMapOfShapeListOfShape (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_IndexedDataMapOfShapeListOfShape &
	:rtype: TopTools_IndexedDataMapOfShapeListOfShape
") Assign;
		TopTools_IndexedDataMapOfShapeListOfShape & Assign (const TopTools_IndexedDataMapOfShapeListOfShape & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_IndexedDataMapOfShapeListOfShape &
	:rtype: TopTools_IndexedDataMapOfShapeListOfShape
") operator =;
		TopTools_IndexedDataMapOfShapeListOfShape & operator = (const TopTools_IndexedDataMapOfShapeListOfShape & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TopTools_ListOfShape &
	:rtype: int
") Add;
		Standard_Integer Add (const TopoDS_Shape & K,const TopTools_ListOfShape & I);
		%feature("compactdefaultargs") Substitute;
		%feature("autodoc", "	:param I:
	:type I: int
	:param K:
	:type K: TopoDS_Shape &
	:param T:
	:type T: TopTools_ListOfShape &
	:rtype: None
") Substitute;
		void Substitute (const Standard_Integer I,const TopoDS_Shape & K,const TopTools_ListOfShape & T);
		%feature("compactdefaultargs") RemoveLast;
		%feature("autodoc", "	:rtype: None
") RemoveLast;
		void RemoveLast ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const TopoDS_Shape & K);
		%feature("compactdefaultargs") FindKey;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: TopoDS_Shape
") FindKey;
		const TopoDS_Shape  FindKey (const Standard_Integer I);
		%feature("compactdefaultargs") FindFromIndex;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: TopTools_ListOfShape
") FindFromIndex;
		const TopTools_ListOfShape & FindFromIndex (const Standard_Integer I);
		%feature("compactdefaultargs") ChangeFromIndex;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: TopTools_ListOfShape
") ChangeFromIndex;
		TopTools_ListOfShape & ChangeFromIndex (const Standard_Integer I);
		%feature("compactdefaultargs") FindIndex;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: int
") FindIndex;
		Standard_Integer FindIndex (const TopoDS_Shape & K);
		%feature("compactdefaultargs") FindFromKey;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") FindFromKey;
		const TopTools_ListOfShape & FindFromKey (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFromKey;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") ChangeFromKey;
		TopTools_ListOfShape & ChangeFromKey (const TopoDS_Shape & K);
		%feature("compactdefaultargs") FindFromKey1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") FindFromKey1;
		Standard_Address FindFromKey1 (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFromKey1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFromKey1;
		Standard_Address ChangeFromKey1 (const TopoDS_Shape & K);
};


%extend TopTools_IndexedDataMapOfShapeListOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_IndexedDataMapOfShapeShape;
class TopTools_IndexedDataMapOfShapeShape : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TopTools_IndexedDataMapOfShapeShape;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TopTools_IndexedDataMapOfShapeShape;
		 TopTools_IndexedDataMapOfShapeShape (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_IndexedDataMapOfShapeShape &
	:rtype: TopTools_IndexedDataMapOfShapeShape
") Assign;
		TopTools_IndexedDataMapOfShapeShape & Assign (const TopTools_IndexedDataMapOfShapeShape & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_IndexedDataMapOfShapeShape &
	:rtype: TopTools_IndexedDataMapOfShapeShape
") operator =;
		TopTools_IndexedDataMapOfShapeShape & operator = (const TopTools_IndexedDataMapOfShapeShape & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TopoDS_Shape &
	:rtype: int
") Add;
		Standard_Integer Add (const TopoDS_Shape & K,const TopoDS_Shape & I);
		%feature("compactdefaultargs") Substitute;
		%feature("autodoc", "	:param I:
	:type I: int
	:param K:
	:type K: TopoDS_Shape &
	:param T:
	:type T: TopoDS_Shape &
	:rtype: None
") Substitute;
		void Substitute (const Standard_Integer I,const TopoDS_Shape & K,const TopoDS_Shape & T);
		%feature("compactdefaultargs") RemoveLast;
		%feature("autodoc", "	:rtype: None
") RemoveLast;
		void RemoveLast ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const TopoDS_Shape & K);
		%feature("compactdefaultargs") FindKey;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: TopoDS_Shape
") FindKey;
		const TopoDS_Shape  FindKey (const Standard_Integer I);
		%feature("compactdefaultargs") FindFromIndex;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: TopoDS_Shape
") FindFromIndex;
		const TopoDS_Shape  FindFromIndex (const Standard_Integer I);
		%feature("compactdefaultargs") ChangeFromIndex;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: TopoDS_Shape
") ChangeFromIndex;
		TopoDS_Shape  ChangeFromIndex (const Standard_Integer I);
		%feature("compactdefaultargs") FindIndex;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: int
") FindIndex;
		Standard_Integer FindIndex (const TopoDS_Shape & K);
		%feature("compactdefaultargs") FindFromKey;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopoDS_Shape
") FindFromKey;
		const TopoDS_Shape  FindFromKey (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFromKey;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopoDS_Shape
") ChangeFromKey;
		TopoDS_Shape  ChangeFromKey (const TopoDS_Shape & K);
		%feature("compactdefaultargs") FindFromKey1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") FindFromKey1;
		Standard_Address FindFromKey1 (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFromKey1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFromKey1;
		Standard_Address ChangeFromKey1 (const TopoDS_Shape & K);
};


%extend TopTools_IndexedDataMapOfShapeShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_IndexedMapNodeOfIndexedMapOfOrientedShape;
class TopTools_IndexedMapNodeOfIndexedMapOfOrientedShape : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TopTools_IndexedMapNodeOfIndexedMapOfOrientedShape;
		%feature("autodoc", "	:param K1:
	:type K1: TopoDS_Shape &
	:param K2:
	:type K2: int
	:param n1:
	:type n1: TCollection_MapNodePtr &
	:param n2:
	:type n2: TCollection_MapNodePtr &
	:rtype: None
") TopTools_IndexedMapNodeOfIndexedMapOfOrientedShape;
		 TopTools_IndexedMapNodeOfIndexedMapOfOrientedShape (const TopoDS_Shape & K1,const Standard_Integer K2,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("compactdefaultargs") Key1;
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
            		%feature("compactdefaultargs") Next2;
		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next2;
		TCollection_MapNodePtr & Next2 ();
};


%extend TopTools_IndexedMapNodeOfIndexedMapOfOrientedShape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopTools_IndexedMapNodeOfIndexedMapOfOrientedShape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopTools_IndexedMapNodeOfIndexedMapOfOrientedShape::Handle_TopTools_IndexedMapNodeOfIndexedMapOfOrientedShape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    TopTools_IndexedMapNodeOfIndexedMapOfOrientedShape* _get_reference() {
    return (TopTools_IndexedMapNodeOfIndexedMapOfOrientedShape*)$self->Access();
    }
};

%extend Handle_TopTools_IndexedMapNodeOfIndexedMapOfOrientedShape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopTools_IndexedMapNodeOfIndexedMapOfOrientedShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_IndexedMapNodeOfIndexedMapOfShape;
class TopTools_IndexedMapNodeOfIndexedMapOfShape : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TopTools_IndexedMapNodeOfIndexedMapOfShape;
		%feature("autodoc", "	:param K1:
	:type K1: TopoDS_Shape &
	:param K2:
	:type K2: int
	:param n1:
	:type n1: TCollection_MapNodePtr &
	:param n2:
	:type n2: TCollection_MapNodePtr &
	:rtype: None
") TopTools_IndexedMapNodeOfIndexedMapOfShape;
		 TopTools_IndexedMapNodeOfIndexedMapOfShape (const TopoDS_Shape & K1,const Standard_Integer K2,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("compactdefaultargs") Key1;
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
            		%feature("compactdefaultargs") Next2;
		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next2;
		TCollection_MapNodePtr & Next2 ();
};


%extend TopTools_IndexedMapNodeOfIndexedMapOfShape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopTools_IndexedMapNodeOfIndexedMapOfShape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopTools_IndexedMapNodeOfIndexedMapOfShape::Handle_TopTools_IndexedMapNodeOfIndexedMapOfShape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    TopTools_IndexedMapNodeOfIndexedMapOfShape* _get_reference() {
    return (TopTools_IndexedMapNodeOfIndexedMapOfShape*)$self->Access();
    }
};

%extend Handle_TopTools_IndexedMapNodeOfIndexedMapOfShape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopTools_IndexedMapNodeOfIndexedMapOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_IndexedMapOfOrientedShape;
class TopTools_IndexedMapOfOrientedShape : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TopTools_IndexedMapOfOrientedShape;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TopTools_IndexedMapOfOrientedShape;
		 TopTools_IndexedMapOfOrientedShape (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") TopTools_IndexedMapOfOrientedShape;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_IndexedMapOfOrientedShape &
	:rtype: None
") TopTools_IndexedMapOfOrientedShape;
		 TopTools_IndexedMapOfOrientedShape (const TopTools_IndexedMapOfOrientedShape & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_IndexedMapOfOrientedShape &
	:rtype: TopTools_IndexedMapOfOrientedShape
") Assign;
		TopTools_IndexedMapOfOrientedShape & Assign (const TopTools_IndexedMapOfOrientedShape & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_IndexedMapOfOrientedShape &
	:rtype: TopTools_IndexedMapOfOrientedShape
") operator =;
		TopTools_IndexedMapOfOrientedShape & operator = (const TopTools_IndexedMapOfOrientedShape & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: int
") Add;
		Standard_Integer Add (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Substitute;
		%feature("autodoc", "	:param I:
	:type I: int
	:param K:
	:type K: TopoDS_Shape &
	:rtype: None
") Substitute;
		void Substitute (const Standard_Integer I,const TopoDS_Shape & K);
		%feature("compactdefaultargs") RemoveLast;
		%feature("autodoc", "	:rtype: None
") RemoveLast;
		void RemoveLast ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const TopoDS_Shape & K);
		%feature("compactdefaultargs") FindKey;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: TopoDS_Shape
") FindKey;
		const TopoDS_Shape  FindKey (const Standard_Integer I);
		%feature("compactdefaultargs") FindIndex;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: int
") FindIndex;
		Standard_Integer FindIndex (const TopoDS_Shape & K);
};


%extend TopTools_IndexedMapOfOrientedShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_IndexedMapOfShape;
class TopTools_IndexedMapOfShape : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TopTools_IndexedMapOfShape;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TopTools_IndexedMapOfShape;
		 TopTools_IndexedMapOfShape (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") TopTools_IndexedMapOfShape;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_IndexedMapOfShape &
	:rtype: None
") TopTools_IndexedMapOfShape;
		 TopTools_IndexedMapOfShape (const TopTools_IndexedMapOfShape & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_IndexedMapOfShape &
	:rtype: TopTools_IndexedMapOfShape
") Assign;
		TopTools_IndexedMapOfShape & Assign (const TopTools_IndexedMapOfShape & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_IndexedMapOfShape &
	:rtype: TopTools_IndexedMapOfShape
") operator =;
		TopTools_IndexedMapOfShape & operator = (const TopTools_IndexedMapOfShape & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: int
") Add;
		Standard_Integer Add (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Substitute;
		%feature("autodoc", "	:param I:
	:type I: int
	:param K:
	:type K: TopoDS_Shape &
	:rtype: None
") Substitute;
		void Substitute (const Standard_Integer I,const TopoDS_Shape & K);
		%feature("compactdefaultargs") RemoveLast;
		%feature("autodoc", "	:rtype: None
") RemoveLast;
		void RemoveLast ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const TopoDS_Shape & K);
		%feature("compactdefaultargs") FindKey;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: TopoDS_Shape
") FindKey;
		const TopoDS_Shape  FindKey (const Standard_Integer I);
		%feature("compactdefaultargs") FindIndex;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: int
") FindIndex;
		Standard_Integer FindIndex (const TopoDS_Shape & K);
};


%extend TopTools_IndexedMapOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_ListIteratorOfListOfShape;
class TopTools_ListIteratorOfListOfShape {
	public:
		%feature("compactdefaultargs") TopTools_ListIteratorOfListOfShape;
		%feature("autodoc", "	:rtype: None
") TopTools_ListIteratorOfListOfShape;
		 TopTools_ListIteratorOfListOfShape ();
		%feature("compactdefaultargs") TopTools_ListIteratorOfListOfShape;
		%feature("autodoc", "	:param L:
	:type L: TopTools_ListOfShape &
	:rtype: None
") TopTools_ListIteratorOfListOfShape;
		 TopTools_ListIteratorOfListOfShape (const TopTools_ListOfShape & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: TopTools_ListOfShape &
	:rtype: None
") Initialize;
		void Initialize (const TopTools_ListOfShape & L);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Value;
		TopoDS_Shape  Value ();
};


%extend TopTools_ListIteratorOfListOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_ListNodeOfListOfShape;
class TopTools_ListNodeOfListOfShape : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TopTools_ListNodeOfListOfShape;
		%feature("autodoc", "	:param I:
	:type I: TopoDS_Shape &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopTools_ListNodeOfListOfShape;
		 TopTools_ListNodeOfListOfShape (const TopoDS_Shape & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Value;
		TopoDS_Shape  Value ();
};


%extend TopTools_ListNodeOfListOfShape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopTools_ListNodeOfListOfShape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopTools_ListNodeOfListOfShape::Handle_TopTools_ListNodeOfListOfShape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    TopTools_ListNodeOfListOfShape* _get_reference() {
    return (TopTools_ListNodeOfListOfShape*)$self->Access();
    }
};

%extend Handle_TopTools_ListNodeOfListOfShape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopTools_ListNodeOfListOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_ListOfShape;
class TopTools_ListOfShape {
	public:
		%feature("compactdefaultargs") TopTools_ListOfShape;
		%feature("autodoc", "	:rtype: None
") TopTools_ListOfShape;
		 TopTools_ListOfShape ();
		%feature("compactdefaultargs") TopTools_ListOfShape;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_ListOfShape &
	:rtype: None
") TopTools_ListOfShape;
		 TopTools_ListOfShape (const TopTools_ListOfShape & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_ListOfShape &
	:rtype: None
") Assign;
		void Assign (const TopTools_ListOfShape & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_ListOfShape &
	:rtype: None
") operator =;
		void operator = (const TopTools_ListOfShape & Other);
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: TopoDS_Shape &
	:rtype: None
") Prepend;
		void Prepend (const TopoDS_Shape & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: TopoDS_Shape &
	:param theIt:
	:type theIt: TopTools_ListIteratorOfListOfShape &
	:rtype: None
") Prepend;
		void Prepend (const TopoDS_Shape & I,TopTools_ListIteratorOfListOfShape & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_ListOfShape &
	:rtype: None
") Prepend;
		void Prepend (TopTools_ListOfShape & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: TopoDS_Shape &
	:rtype: None
") Append;
		void Append (const TopoDS_Shape & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: TopoDS_Shape &
	:param theIt:
	:type theIt: TopTools_ListIteratorOfListOfShape &
	:rtype: None
") Append;
		void Append (const TopoDS_Shape & I,TopTools_ListIteratorOfListOfShape & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_ListOfShape &
	:rtype: None
") Append;
		void Append (TopTools_ListOfShape & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") First;
		TopoDS_Shape  First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Last;
		TopoDS_Shape  Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: TopTools_ListIteratorOfListOfShape &
	:rtype: None
") Remove;
		void Remove (TopTools_ListIteratorOfListOfShape & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: TopoDS_Shape &
	:param It:
	:type It: TopTools_ListIteratorOfListOfShape &
	:rtype: None
") InsertBefore;
		void InsertBefore (const TopoDS_Shape & I,TopTools_ListIteratorOfListOfShape & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_ListOfShape &
	:param It:
	:type It: TopTools_ListIteratorOfListOfShape &
	:rtype: None
") InsertBefore;
		void InsertBefore (TopTools_ListOfShape & Other,TopTools_ListIteratorOfListOfShape & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: TopoDS_Shape &
	:param It:
	:type It: TopTools_ListIteratorOfListOfShape &
	:rtype: None
") InsertAfter;
		void InsertAfter (const TopoDS_Shape & I,TopTools_ListIteratorOfListOfShape & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_ListOfShape &
	:param It:
	:type It: TopTools_ListIteratorOfListOfShape &
	:rtype: None
") InsertAfter;
		void InsertAfter (TopTools_ListOfShape & Other,TopTools_ListIteratorOfListOfShape & It);
};


%extend TopTools_ListOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_LocationSet;
class TopTools_LocationSet {
	public:
		%feature("compactdefaultargs") TopTools_LocationSet;
		%feature("autodoc", "	* Returns an empty set of locations.

	:rtype: None
") TopTools_LocationSet;
		 TopTools_LocationSet ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears the content of the set.

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Incorporate a new Location in the set and returns its index.

	:param L:
	:type L: TopLoc_Location &
	:rtype: int
") Add;
		Standard_Integer Add (const TopLoc_Location & L);
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	* Returns the location of index <I>.

	:param I:
	:type I: int
	:rtype: TopLoc_Location
") Location;
		const TopLoc_Location & Location (const Standard_Integer I);
		%feature("compactdefaultargs") Index;
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
        		%feature("compactdefaultargs") SetProgress;
		%feature("autodoc", "	:param PR:
	:type PR: Handle_Message_ProgressIndicator &
	:rtype: None
") SetProgress;
		void SetProgress (const Handle_Message_ProgressIndicator & PR);
		%feature("compactdefaultargs") GetProgress;
		%feature("autodoc", "	:rtype: Handle_Message_ProgressIndicator
") GetProgress;
		Handle_Message_ProgressIndicator GetProgress ();
};


%extend TopTools_LocationSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_MapIteratorOfMapOfOrientedShape;
class TopTools_MapIteratorOfMapOfOrientedShape : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TopTools_MapIteratorOfMapOfOrientedShape;
		%feature("autodoc", "	:rtype: None
") TopTools_MapIteratorOfMapOfOrientedShape;
		 TopTools_MapIteratorOfMapOfOrientedShape ();
		%feature("compactdefaultargs") TopTools_MapIteratorOfMapOfOrientedShape;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_MapOfOrientedShape &
	:rtype: None
") TopTools_MapIteratorOfMapOfOrientedShape;
		 TopTools_MapIteratorOfMapOfOrientedShape (const TopTools_MapOfOrientedShape & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_MapOfOrientedShape &
	:rtype: None
") Initialize;
		void Initialize (const TopTools_MapOfOrientedShape & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
};


%extend TopTools_MapIteratorOfMapOfOrientedShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_MapIteratorOfMapOfShape;
class TopTools_MapIteratorOfMapOfShape : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TopTools_MapIteratorOfMapOfShape;
		%feature("autodoc", "	:rtype: None
") TopTools_MapIteratorOfMapOfShape;
		 TopTools_MapIteratorOfMapOfShape ();
		%feature("compactdefaultargs") TopTools_MapIteratorOfMapOfShape;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_MapOfShape &
	:rtype: None
") TopTools_MapIteratorOfMapOfShape;
		 TopTools_MapIteratorOfMapOfShape (const TopTools_MapOfShape & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TopTools_MapOfShape &
	:rtype: None
") Initialize;
		void Initialize (const TopTools_MapOfShape & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
};


%extend TopTools_MapIteratorOfMapOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_MapOfOrientedShape;
class TopTools_MapOfOrientedShape : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TopTools_MapOfOrientedShape;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TopTools_MapOfOrientedShape;
		 TopTools_MapOfOrientedShape (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") TopTools_MapOfOrientedShape;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_MapOfOrientedShape &
	:rtype: None
") TopTools_MapOfOrientedShape;
		 TopTools_MapOfOrientedShape (const TopTools_MapOfOrientedShape & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_MapOfOrientedShape &
	:rtype: TopTools_MapOfOrientedShape
") Assign;
		TopTools_MapOfOrientedShape & Assign (const TopTools_MapOfOrientedShape & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_MapOfOrientedShape &
	:rtype: TopTools_MapOfOrientedShape
") operator =;
		TopTools_MapOfOrientedShape & operator = (const TopTools_MapOfOrientedShape & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param aKey:
	:type aKey: TopoDS_Shape &
	:rtype: bool
") Add;
		Standard_Boolean Add (const TopoDS_Shape & aKey);
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param aKey:
	:type aKey: TopoDS_Shape &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const TopoDS_Shape & aKey);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param aKey:
	:type aKey: TopoDS_Shape &
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const TopoDS_Shape & aKey);
};


%extend TopTools_MapOfOrientedShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_MapOfShape;
class TopTools_MapOfShape : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TopTools_MapOfShape;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TopTools_MapOfShape;
		 TopTools_MapOfShape (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") TopTools_MapOfShape;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_MapOfShape &
	:rtype: None
") TopTools_MapOfShape;
		 TopTools_MapOfShape (const TopTools_MapOfShape & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_MapOfShape &
	:rtype: TopTools_MapOfShape
") Assign;
		TopTools_MapOfShape & Assign (const TopTools_MapOfShape & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_MapOfShape &
	:rtype: TopTools_MapOfShape
") operator =;
		TopTools_MapOfShape & operator = (const TopTools_MapOfShape & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param aKey:
	:type aKey: TopoDS_Shape &
	:rtype: bool
") Add;
		Standard_Boolean Add (const TopoDS_Shape & aKey);
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param aKey:
	:type aKey: TopoDS_Shape &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const TopoDS_Shape & aKey);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param aKey:
	:type aKey: TopoDS_Shape &
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const TopoDS_Shape & aKey);
};


%extend TopTools_MapOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_MutexForShapeProvider;
class TopTools_MutexForShapeProvider {
	public:
		%feature("compactdefaultargs") TopTools_MutexForShapeProvider;
		%feature("autodoc", "	* Constructor

	:rtype: None
") TopTools_MutexForShapeProvider;
		 TopTools_MutexForShapeProvider ();
		%feature("compactdefaultargs") CreateMutexesForSubShapes;
		%feature("autodoc", "	* Creates and associates mutexes with each sub-shape of type theType in theShape.

	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theType:
	:type theType: TopAbs_ShapeEnum
	:rtype: None
") CreateMutexesForSubShapes;
		void CreateMutexesForSubShapes (const TopoDS_Shape & theShape,const TopAbs_ShapeEnum theType);
		%feature("compactdefaultargs") CreateMutexForShape;
		%feature("autodoc", "	* Creates and associates mutex with theShape

	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: None
") CreateMutexForShape;
		void CreateMutexForShape (const TopoDS_Shape & theShape);
		%feature("compactdefaultargs") GetMutex;
		%feature("autodoc", "	* Returns pointer to mutex associated with theShape. In case when mutex not found returns NULL.

	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: Standard_Mutex *
") GetMutex;
		Standard_Mutex * GetMutex (const TopoDS_Shape & theShape);
		%feature("compactdefaultargs") RemoveAllMutexes;
		%feature("autodoc", "	* Removes all mutexes

	:rtype: None
") RemoveAllMutexes;
		void RemoveAllMutexes ();
};


%extend TopTools_MutexForShapeProvider {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class TopTools_OrientedShapeMapHasher {
	public:
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "	* Returns a HasCode value for the Key <K> in the range 0..Upper.

	:param S:
	:type S: TopoDS_Shape &
	:param Upper:
	:type Upper: int
	:rtype: int
") HashCode;
		static Standard_Integer HashCode (const TopoDS_Shape & S,const Standard_Integer Upper);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* Returns True when the two keys are equal. Two same keys must have the same hashcode, the contrary is not necessary.

	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:rtype: bool
") IsEqual;
		static Standard_Boolean IsEqual (const TopoDS_Shape & S1,const TopoDS_Shape & S2);
};


%extend TopTools_OrientedShapeMapHasher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_SequenceNodeOfSequenceOfShape;
class TopTools_SequenceNodeOfSequenceOfShape : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") TopTools_SequenceNodeOfSequenceOfShape;
		%feature("autodoc", "	:param I:
	:type I: TopoDS_Shape &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") TopTools_SequenceNodeOfSequenceOfShape;
		 TopTools_SequenceNodeOfSequenceOfShape (const TopoDS_Shape & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Value;
		TopoDS_Shape  Value ();
};


%extend TopTools_SequenceNodeOfSequenceOfShape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopTools_SequenceNodeOfSequenceOfShape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopTools_SequenceNodeOfSequenceOfShape::Handle_TopTools_SequenceNodeOfSequenceOfShape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    TopTools_SequenceNodeOfSequenceOfShape* _get_reference() {
    return (TopTools_SequenceNodeOfSequenceOfShape*)$self->Access();
    }
};

%extend Handle_TopTools_SequenceNodeOfSequenceOfShape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopTools_SequenceNodeOfSequenceOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_SequenceOfShape;
class TopTools_SequenceOfShape : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") TopTools_SequenceOfShape;
		%feature("autodoc", "	:rtype: None
") TopTools_SequenceOfShape;
		 TopTools_SequenceOfShape ();
		%feature("compactdefaultargs") TopTools_SequenceOfShape;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_SequenceOfShape &
	:rtype: None
") TopTools_SequenceOfShape;
		 TopTools_SequenceOfShape (const TopTools_SequenceOfShape & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_SequenceOfShape &
	:rtype: TopTools_SequenceOfShape
") Assign;
		const TopTools_SequenceOfShape & Assign (const TopTools_SequenceOfShape & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopTools_SequenceOfShape &
	:rtype: TopTools_SequenceOfShape
") operator =;
		const TopTools_SequenceOfShape & operator = (const TopTools_SequenceOfShape & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: TopoDS_Shape &
	:rtype: None
") Append;
		void Append (const TopoDS_Shape & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: TopTools_SequenceOfShape &
	:rtype: None
") Append;
		void Append (TopTools_SequenceOfShape & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: TopoDS_Shape &
	:rtype: None
") Prepend;
		void Prepend (const TopoDS_Shape & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: TopTools_SequenceOfShape &
	:rtype: None
") Prepend;
		void Prepend (TopTools_SequenceOfShape & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: TopoDS_Shape &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const TopoDS_Shape & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TopTools_SequenceOfShape &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TopTools_SequenceOfShape & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: TopoDS_Shape &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const TopoDS_Shape & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: TopTools_SequenceOfShape &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TopTools_SequenceOfShape & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") First;
		const TopoDS_Shape  First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Last;
		const TopoDS_Shape  Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: TopTools_SequenceOfShape &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,TopTools_SequenceOfShape & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TopoDS_Shape
") Value;
		const TopoDS_Shape  Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: TopoDS_Shape &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const TopoDS_Shape & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TopoDS_Shape
") ChangeValue;
		TopoDS_Shape  ChangeValue (const Standard_Integer Index);
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


%extend TopTools_SequenceOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class TopTools_ShapeMapHasher {
	public:
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "	* Returns a HasCode value for the Key <K> in the range 0..Upper.

	:param S:
	:type S: TopoDS_Shape &
	:param Upper:
	:type Upper: int
	:rtype: int
") HashCode;
		static Standard_Integer HashCode (const TopoDS_Shape & S,const Standard_Integer Upper);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* Returns True when the two keys are the same. Two same keys must have the same hashcode, the contrary is not necessary.

	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:rtype: bool
") IsEqual;
		static Standard_Boolean IsEqual (const TopoDS_Shape & S1,const TopoDS_Shape & S2);
};


%extend TopTools_ShapeMapHasher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_ShapeSet;
class TopTools_ShapeSet {
	public:
		%feature("compactdefaultargs") TopTools_ShapeSet;
		%feature("autodoc", "	* Builds an empty ShapeSet.

	:rtype: None
") TopTools_ShapeSet;
		 TopTools_ShapeSet ();
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "	:rtype: void
") Delete;
		virtual void Delete ();
		%feature("compactdefaultargs") SetFormatNb;
		%feature("autodoc", "	:param theFormatNb:
	:type theFormatNb: int
	:rtype: None
") SetFormatNb;
		void SetFormatNb (const Standard_Integer theFormatNb);
		%feature("compactdefaultargs") FormatNb;
		%feature("autodoc", "	* two formats available for the moment: First: does not write CurveOnSurface UV Points into the file on reading calls Check() method. Second: stores CurveOnSurface UV Points. On reading format is recognized from Version string.

	:rtype: int
") FormatNb;
		Standard_Integer FormatNb ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears the content of the set. This method can be redefined.

	:rtype: void
") Clear;
		virtual void Clear ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Stores <S> and its sub-shape. Returns the index of <S>. The method AddGeometry is called on each sub-shape.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: int
") Add;
		Standard_Integer Add (const TopoDS_Shape & S);
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	* Returns the sub-shape of index <I>.

	:param I:
	:type I: int
	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape (const Standard_Integer I);
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "	* Returns the index of <S>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: int
") Index;
		Standard_Integer Index (const TopoDS_Shape & S);
		%feature("compactdefaultargs") Locations;
		%feature("autodoc", "	:rtype: TopTools_LocationSet
") Locations;
		const TopTools_LocationSet & Locations ();
		%feature("compactdefaultargs") ChangeLocations;
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
        		%feature("compactdefaultargs") DumpExtent;
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
        		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	* Dumps on <OS> the shape <S>. Dumps the orientation, the index of the TShape and the index of the Location.

	:param S:
	:type S: TopoDS_Shape &
	:param OS:
	:type OS: Standard_OStream &
	:rtype: None
") Dump;
		void Dump (const TopoDS_Shape & S,Standard_OStream & OS);
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "	* Writes on <OS> the shape <S>. Writes the orientation, the index of the TShape and the index of the Location.

	:param S:
	:type S: TopoDS_Shape &
	:param OS:
	:type OS: Standard_OStream &
	:rtype: None
") Write;
		void Write (const TopoDS_Shape & S,Standard_OStream & OS);
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "	* Reads from <IS> a shape and returns it in S.

	:param S:
	:type S: TopoDS_Shape &
	:param IS:
	:type IS: Standard_IStream &
	:rtype: None
") Read;
		void Read (TopoDS_Shape & S,Standard_IStream & IS);
		%feature("compactdefaultargs") AddGeometry;
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
        		%feature("compactdefaultargs") DumpGeometry;
		%feature("autodoc", "	* Dumps the geometry of <S> on the stream <OS>.

	:param S:
	:type S: TopoDS_Shape &
	:param OS:
	:type OS: Standard_OStream &
	:rtype: void
") DumpGeometry;
		virtual void DumpGeometry (const TopoDS_Shape & S,Standard_OStream & OS);
		%feature("compactdefaultargs") WriteGeometry;
		%feature("autodoc", "	* Writes the geometry of <S> on the stream <OS> in a format that can be read back by Read.

	:param S:
	:type S: TopoDS_Shape &
	:param OS:
	:type OS: Standard_OStream &
	:rtype: void
") WriteGeometry;
		virtual void WriteGeometry (const TopoDS_Shape & S,Standard_OStream & OS);
		%feature("compactdefaultargs") ReadGeometry;
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
		%feature("compactdefaultargs") AddShapes;
		%feature("autodoc", "	* Inserts the shape <S2> in the shape <S1>. This method must be redefined to use the correct builder.

	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:rtype: void
") AddShapes;
		virtual void AddShapes (TopoDS_Shape & S1,const TopoDS_Shape & S2);
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "	* This method is called after each new completed shape. <T> is the type. <S> is the shape. In this class it does nothing, but it gives the opportunity in derived classes to perform extra treatment on shapes.

	:param T:
	:type T: TopAbs_ShapeEnum
	:param S:
	:type S: TopoDS_Shape &
	:rtype: void
") Check;
		virtual void Check (const TopAbs_ShapeEnum T,TopoDS_Shape & S);
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "	* Returns number of shapes read from file.

	:rtype: int
") NbShapes;
		Standard_Integer NbShapes ();
		%feature("compactdefaultargs") SetProgress;
		%feature("autodoc", "	:param PR:
	:type PR: Handle_Message_ProgressIndicator &
	:rtype: None
") SetProgress;
		void SetProgress (const Handle_Message_ProgressIndicator & PR);
		%feature("compactdefaultargs") GetProgress;
		%feature("autodoc", "	:rtype: Handle_Message_ProgressIndicator
") GetProgress;
		Handle_Message_ProgressIndicator GetProgress ();
};


%extend TopTools_ShapeSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_StdMapNodeOfMapOfOrientedShape;
class TopTools_StdMapNodeOfMapOfOrientedShape : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TopTools_StdMapNodeOfMapOfOrientedShape;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopTools_StdMapNodeOfMapOfOrientedShape;
		 TopTools_StdMapNodeOfMapOfOrientedShape (const TopoDS_Shape & K,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();
};


%extend TopTools_StdMapNodeOfMapOfOrientedShape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopTools_StdMapNodeOfMapOfOrientedShape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopTools_StdMapNodeOfMapOfOrientedShape::Handle_TopTools_StdMapNodeOfMapOfOrientedShape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    TopTools_StdMapNodeOfMapOfOrientedShape* _get_reference() {
    return (TopTools_StdMapNodeOfMapOfOrientedShape*)$self->Access();
    }
};

%extend Handle_TopTools_StdMapNodeOfMapOfOrientedShape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopTools_StdMapNodeOfMapOfOrientedShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopTools_StdMapNodeOfMapOfShape;
class TopTools_StdMapNodeOfMapOfShape : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TopTools_StdMapNodeOfMapOfShape;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopTools_StdMapNodeOfMapOfShape;
		 TopTools_StdMapNodeOfMapOfShape (const TopoDS_Shape & K,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();
};


%extend TopTools_StdMapNodeOfMapOfShape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopTools_StdMapNodeOfMapOfShape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopTools_StdMapNodeOfMapOfShape::Handle_TopTools_StdMapNodeOfMapOfShape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    TopTools_StdMapNodeOfMapOfShape* _get_reference() {
    return (TopTools_StdMapNodeOfMapOfShape*)$self->Access();
    }
};

%extend Handle_TopTools_StdMapNodeOfMapOfShape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopTools_StdMapNodeOfMapOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
