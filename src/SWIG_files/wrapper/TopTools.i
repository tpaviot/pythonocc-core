/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)

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
%define TOPTOOLSDOCSTRING
"TopTools module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_toptools.html"
%enddef
%module (package="OCC.Core", docstring=TOPTOOLSDOCSTRING) TopTools


%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<TopTools_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<TopLoc_module.hxx>
#include<Message_module.hxx>
#include<TopAbs_module.hxx>
#include<TCollection_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i
%import TopLoc.i
%import Message.i
%import TopAbs.i
%import TCollection.i
/* public enums */
/* end public enums declaration */

/* handles */
%wrap_handle(TopTools_HArray1OfShape)
%wrap_handle(TopTools_HArray1OfListOfShape)
%wrap_handle(TopTools_HArray2OfShape)
%wrap_handle(TopTools_HSequenceOfShape)
/* end handles declaration */

/* templates */
%template(TopTools_DataMapOfIntegerListOfShape) NCollection_DataMap <Standard_Integer , TopTools_ListOfShape , TColStd_MapIntegerHasher>;

%extend NCollection_DataMap <Standard_Integer , TopTools_ListOfShape , TColStd_MapIntegerHasher> {
    PyObject* Keys() {
        PyObject *l=PyList_New(0);
        for (TopTools_DataMapOfIntegerListOfShape::Iterator anIt1(*self); anIt1.More(); anIt1.Next()) {
          PyObject *o = PyLong_FromLong(anIt1.Key());
          PyList_Append(l, o);
          Py_DECREF(o);
        }
    return l;
    }
};
%template(TopTools_DataMapOfShapeSequenceOfShape) NCollection_DataMap <TopoDS_Shape , TopTools_SequenceOfShape , TopTools_ShapeMapHasher>;
%template(TopTools_SequenceOfShape) NCollection_Sequence <TopoDS_Shape>;
%template(TopTools_IndexedDataMapOfShapeShape) NCollection_IndexedDataMap <TopoDS_Shape , TopoDS_Shape , TopTools_ShapeMapHasher>;
%template(TopTools_DataMapOfShapeListOfShape) NCollection_DataMap <TopoDS_Shape , TopTools_ListOfShape , TopTools_ShapeMapHasher>;
%template(TopTools_IndexedMapOfShape) NCollection_IndexedMap <TopoDS_Shape , TopTools_ShapeMapHasher>;
%template(TopTools_MapOfShape) NCollection_Map <TopoDS_Shape , TopTools_ShapeMapHasher>;
%template(TopTools_ListOfShape) NCollection_List <TopoDS_Shape>;
%template(TopTools_ListIteratorOfListOfShape) NCollection_TListIterator<TopoDS_Shape>;
%template(TopTools_DataMapOfShapeInteger) NCollection_DataMap <TopoDS_Shape , Standard_Integer , TopTools_ShapeMapHasher>;
%template(TopTools_IndexedMapOfOrientedShape) NCollection_IndexedMap <TopoDS_Shape , TopTools_OrientedShapeMapHasher>;
%template(TopTools_ListOfListOfShape) NCollection_List <TopTools_ListOfShape>;
%template(TopTools_Array1OfShape) NCollection_Array1 <TopoDS_Shape>;

%extend NCollection_Array1 <TopoDS_Shape> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(TopTools_Array1OfListOfShape) NCollection_Array1 <TopTools_ListOfShape>;

%extend NCollection_Array1 <TopTools_ListOfShape> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(TopTools_IndexedDataMapOfShapeListOfShape) NCollection_IndexedDataMap <TopoDS_Shape , TopTools_ListOfShape , TopTools_ShapeMapHasher>;
%template(TopTools_DataMapOfShapeShape) NCollection_DataMap <TopoDS_Shape , TopoDS_Shape , TopTools_ShapeMapHasher>;
%template(TopTools_DataMapOfIntegerShape) NCollection_DataMap <Standard_Integer , TopoDS_Shape , TColStd_MapIntegerHasher>;

%extend NCollection_DataMap <Standard_Integer , TopoDS_Shape , TColStd_MapIntegerHasher> {
    PyObject* Keys() {
        PyObject *l=PyList_New(0);
        for (TopTools_DataMapOfIntegerShape::Iterator anIt1(*self); anIt1.More(); anIt1.Next()) {
          PyObject *o = PyLong_FromLong(anIt1.Key());
          PyList_Append(l, o);
          Py_DECREF(o);
        }
    return l;
    }
};
%template(TopTools_DataMapOfShapeReal) NCollection_DataMap <TopoDS_Shape , Standard_Real , TopTools_ShapeMapHasher>;
%template(TopTools_IndexedDataMapOfShapeAddress) NCollection_IndexedDataMap <TopoDS_Shape , Standard_Address , TopTools_ShapeMapHasher>;
%template(TopTools_IndexedDataMapOfShapeReal) NCollection_IndexedDataMap <TopoDS_Shape , Standard_Real , TopTools_ShapeMapHasher>;
%template(TopTools_MapOfOrientedShape) NCollection_Map <TopoDS_Shape , TopTools_OrientedShapeMapHasher>;
%template(TopTools_DataMapOfOrientedShapeShape) NCollection_DataMap <TopoDS_Shape , TopoDS_Shape , TopTools_OrientedShapeMapHasher>;
%template(TopTools_DataMapOfShapeListOfInteger) NCollection_DataMap <TopoDS_Shape , TColStd_ListOfInteger , TopTools_ShapeMapHasher>;
%template(TopTools_DataMapOfOrientedShapeInteger) NCollection_DataMap <TopoDS_Shape , Standard_Integer , TopTools_OrientedShapeMapHasher>;
%template(TopTools_DataMapOfShapeBox) NCollection_DataMap <TopoDS_Shape , Bnd_Box , TopTools_ShapeMapHasher>;
%template(TopTools_Array2OfShape) NCollection_Array2 <TopoDS_Shape>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap <Standard_Integer , TopTools_ListOfShape , TColStd_MapIntegerHasher> TopTools_DataMapOfIntegerListOfShape;
typedef NCollection_DataMap <Standard_Integer , TopTools_ListOfShape , TColStd_MapIntegerHasher>::Iterator TopTools_DataMapIteratorOfDataMapOfIntegerListOfShape;
typedef NCollection_DataMap <TopoDS_Shape , TopTools_SequenceOfShape , TopTools_ShapeMapHasher> TopTools_DataMapOfShapeSequenceOfShape;
typedef NCollection_DataMap <TopoDS_Shape , TopTools_SequenceOfShape , TopTools_ShapeMapHasher>::Iterator TopTools_DataMapIteratorOfDataMapOfShapeSequenceOfShape;
typedef NCollection_Sequence <TopoDS_Shape> TopTools_SequenceOfShape;
typedef NCollection_IndexedDataMap <TopoDS_Shape , TopoDS_Shape , TopTools_ShapeMapHasher> TopTools_IndexedDataMapOfShapeShape;
typedef TopTools_LocationSet * TopTools_LocationSetPtr;
typedef NCollection_DataMap <TopoDS_Shape , TopTools_ListOfShape , TopTools_ShapeMapHasher> TopTools_DataMapOfShapeListOfShape;
typedef NCollection_DataMap <TopoDS_Shape , TopTools_ListOfShape , TopTools_ShapeMapHasher>::Iterator TopTools_DataMapIteratorOfDataMapOfShapeListOfShape;
typedef NCollection_IndexedMap <TopoDS_Shape , TopTools_ShapeMapHasher> TopTools_IndexedMapOfShape;
typedef NCollection_Map <TopoDS_Shape , TopTools_ShapeMapHasher> TopTools_MapOfShape;
typedef NCollection_Map <TopoDS_Shape , TopTools_ShapeMapHasher>::Iterator TopTools_MapIteratorOfMapOfShape;
typedef NCollection_List <TopoDS_Shape> TopTools_ListOfShape;
typedef NCollection_List <TopoDS_Shape>::Iterator TopTools_ListIteratorOfListOfShape;
typedef NCollection_DataMap <TopoDS_Shape , Standard_Integer , TopTools_ShapeMapHasher> TopTools_DataMapOfShapeInteger;
typedef NCollection_DataMap <TopoDS_Shape , Standard_Integer , TopTools_ShapeMapHasher>::Iterator TopTools_DataMapIteratorOfDataMapOfShapeInteger;
typedef NCollection_IndexedMap <TopoDS_Shape , TopTools_OrientedShapeMapHasher> TopTools_IndexedMapOfOrientedShape;
typedef NCollection_List <TopTools_ListOfShape> TopTools_ListOfListOfShape;
typedef TopTools_ListOfListOfShape::Iterator TopTools_ListIteratorOfListOfListOfShape;
typedef NCollection_Array1 <TopoDS_Shape> TopTools_Array1OfShape;
typedef NCollection_Array1 <TopTools_ListOfShape> TopTools_Array1OfListOfShape;
typedef NCollection_IndexedDataMap <TopoDS_Shape , TopTools_ListOfShape , TopTools_ShapeMapHasher> TopTools_IndexedDataMapOfShapeListOfShape;
typedef NCollection_DataMap <TopoDS_Shape , TopoDS_Shape , TopTools_ShapeMapHasher> TopTools_DataMapOfShapeShape;
typedef NCollection_DataMap <TopoDS_Shape , TopoDS_Shape , TopTools_ShapeMapHasher>::Iterator TopTools_DataMapIteratorOfDataMapOfShapeShape;
typedef NCollection_DataMap <Standard_Integer , TopoDS_Shape , TColStd_MapIntegerHasher> TopTools_DataMapOfIntegerShape;
typedef NCollection_DataMap <Standard_Integer , TopoDS_Shape , TColStd_MapIntegerHasher>::Iterator TopTools_DataMapIteratorOfDataMapOfIntegerShape;
typedef NCollection_DataMap <TopoDS_Shape , Standard_Real , TopTools_ShapeMapHasher> TopTools_DataMapOfShapeReal;
typedef NCollection_DataMap <TopoDS_Shape , Standard_Real , TopTools_ShapeMapHasher>::Iterator TopTools_DataMapIteratorOfDataMapOfShapeReal;
typedef NCollection_IndexedDataMap <TopoDS_Shape , Standard_Address , TopTools_ShapeMapHasher> TopTools_IndexedDataMapOfShapeAddress;
typedef NCollection_IndexedDataMap <TopoDS_Shape , Standard_Real , TopTools_ShapeMapHasher> TopTools_IndexedDataMapOfShapeReal;
typedef NCollection_Map <TopoDS_Shape , TopTools_OrientedShapeMapHasher> TopTools_MapOfOrientedShape;
typedef NCollection_Map <TopoDS_Shape , TopTools_OrientedShapeMapHasher>::Iterator TopTools_MapIteratorOfMapOfOrientedShape;
typedef NCollection_DataMap <TopoDS_Shape , TopoDS_Shape , TopTools_OrientedShapeMapHasher> TopTools_DataMapOfOrientedShapeShape;
typedef NCollection_DataMap <TopoDS_Shape , TopoDS_Shape , TopTools_OrientedShapeMapHasher>::Iterator TopTools_DataMapIteratorOfDataMapOfOrientedShapeShape;
typedef NCollection_DataMap <TopoDS_Shape , TColStd_ListOfInteger , TopTools_ShapeMapHasher> TopTools_DataMapOfShapeListOfInteger;
typedef NCollection_DataMap <TopoDS_Shape , TColStd_ListOfInteger , TopTools_ShapeMapHasher>::Iterator TopTools_DataMapIteratorOfDataMapOfShapeListOfInteger;
typedef NCollection_DataMap <TopoDS_Shape , Standard_Integer , TopTools_OrientedShapeMapHasher> TopTools_DataMapOfOrientedShapeInteger;
typedef NCollection_DataMap <TopoDS_Shape , Standard_Integer , TopTools_OrientedShapeMapHasher>::Iterator TopTools_DataMapIteratorOfDataMapOfOrientedShapeInteger;
typedef NCollection_DataMap <TopoDS_Shape , Bnd_Box , TopTools_ShapeMapHasher> TopTools_DataMapOfShapeBox;
typedef TopTools_DataMapOfShapeBox::Iterator TopTools_DataMapIteratorOfDataMapOfShapeBox;
typedef NCollection_Array2 <TopoDS_Shape> TopTools_Array2OfShape;
/* end typedefs declaration */

/*****************
* class TopTools *
*****************/
%rename(toptools) TopTools;
class TopTools {
	public:
		/****************** Dummy ******************/
		%feature("compactdefaultargs") Dummy;
		%feature("autodoc", "* This is to bypass an extraction bug. It will force the inclusion of Standard_Integer.hxx itself including Standard_OStream.hxx at the correct position.
	:param I:
	:type I: int
	:rtype: void") Dummy;
		static void Dummy (const Standard_Integer I);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "* A set of Shapes. Can be dump, wrote or read. Dumps the topological structure of <Sh> on the stream <S>.
	:param Sh:
	:type Sh: TopoDS_Shape
	:param S:
	:type S: Standard_OStream
	:rtype: void") Dump;
		static void Dump (const TopoDS_Shape & Sh,Standard_OStream & S);

};


%extend TopTools {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class TopTools_LocationSet *
*****************************/
class TopTools_LocationSet {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Incorporate a new Location in the set and returns its index.
	:param L:
	:type L: TopLoc_Location
	:rtype: int") Add;
		Standard_Integer Add (const TopLoc_Location & L);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clears the content of the set.
	:rtype: None") Clear;
		void Clear ();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		/****************** GetProgress ******************/
		%feature("compactdefaultargs") GetProgress;
		%feature("autodoc", ":rtype: opencascade::handle<Message_ProgressIndicator>") GetProgress;
		opencascade::handle<Message_ProgressIndicator> GetProgress ();

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "* Returns the index of <L>.
	:param L:
	:type L: TopLoc_Location
	:rtype: int") Index;
		Standard_Integer Index (const TopLoc_Location & L);

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "* Returns the location of index <I>.
	:param I:
	:type I: int
	:rtype: TopLoc_Location") Location;
		const TopLoc_Location & Location (const Standard_Integer I);


        %feature("autodoc", "1");
        %extend{
            void ReadFromString(std::string src) {
            std::stringstream s(src);
            self->Read(s);}
        };
        		/****************** SetProgress ******************/
		%feature("compactdefaultargs") SetProgress;
		%feature("autodoc", ":param PR:
	:type PR: Message_ProgressIndicator
	:rtype: None") SetProgress;
		void SetProgress (const opencascade::handle<Message_ProgressIndicator> & PR);

		/****************** TopTools_LocationSet ******************/
		%feature("compactdefaultargs") TopTools_LocationSet;
		%feature("autodoc", "* Returns an empty set of locations.
	:rtype: None") TopTools_LocationSet;
		 TopTools_LocationSet ();


        %feature("autodoc", "1");
        %extend{
            std::string WriteToString() {
            std::stringstream s;
            self->Write(s);
            return s.str();}
        };
        };


%extend TopTools_LocationSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class TopTools_MutexForShapeProvider *
***************************************/
class TopTools_MutexForShapeProvider {
	public:
		/****************** CreateMutexForShape ******************/
		%feature("compactdefaultargs") CreateMutexForShape;
		%feature("autodoc", "* Creates and associates mutex with theShape
	:param theShape:
	:type theShape: TopoDS_Shape
	:rtype: None") CreateMutexForShape;
		void CreateMutexForShape (const TopoDS_Shape & theShape);

		/****************** CreateMutexesForSubShapes ******************/
		%feature("compactdefaultargs") CreateMutexesForSubShapes;
		%feature("autodoc", "* Creates and associates mutexes with each sub-shape of type theType in theShape.
	:param theShape:
	:type theShape: TopoDS_Shape
	:param theType:
	:type theType: TopAbs_ShapeEnum
	:rtype: None") CreateMutexesForSubShapes;
		void CreateMutexesForSubShapes (const TopoDS_Shape & theShape,const TopAbs_ShapeEnum theType);

		/****************** GetMutex ******************/
		%feature("compactdefaultargs") GetMutex;
		%feature("autodoc", "* Returns pointer to mutex associated with theShape. In case when mutex not found returns NULL.
	:param theShape:
	:type theShape: TopoDS_Shape
	:rtype: Standard_Mutex *") GetMutex;
		Standard_Mutex * GetMutex (const TopoDS_Shape & theShape);

		/****************** RemoveAllMutexes ******************/
		%feature("compactdefaultargs") RemoveAllMutexes;
		%feature("autodoc", "* Removes all mutexes
	:rtype: None") RemoveAllMutexes;
		void RemoveAllMutexes ();

		/****************** TopTools_MutexForShapeProvider ******************/
		%feature("compactdefaultargs") TopTools_MutexForShapeProvider;
		%feature("autodoc", "* Constructor
	:rtype: None") TopTools_MutexForShapeProvider;
		 TopTools_MutexForShapeProvider ();

};


%extend TopTools_MutexForShapeProvider {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class TopTools_OrientedShapeMapHasher *
****************************************/
class TopTools_OrientedShapeMapHasher {
	public:
		/****************** HashCode ******************/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "* Computes a hash code for the given shape, in the range [1, theUpperBound] @param theShape the shape which hash code is to be computed @param theUpperBound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theUpperBound]
	:param theShape:
	:type theShape: TopoDS_Shape
	:param theUpperBound:
	:type theUpperBound: int
	:rtype: int") HashCode;
		static Standard_Integer HashCode (const TopoDS_Shape & theShape,const Standard_Integer theUpperBound);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "* Returns True when the two keys are equal. Two same keys must have the same hashcode, the contrary is not necessary.
	:param S1:
	:type S1: TopoDS_Shape
	:param S2:
	:type S2: TopoDS_Shape
	:rtype: bool") IsEqual;
		static Standard_Boolean IsEqual (const TopoDS_Shape & S1,const TopoDS_Shape & S2);

};


%extend TopTools_OrientedShapeMapHasher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class TopTools_ShapeMapHasher *
********************************/
class TopTools_ShapeMapHasher {
	public:
		/****************** HashCode ******************/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "* Computes a hash code for the given shape, in the range [1, theUpperBound] @param theShape the shape which hash code is to be computed @param theUpperBound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theUpperBound]
	:param theShape:
	:type theShape: TopoDS_Shape
	:param theUpperBound:
	:type theUpperBound: int
	:rtype: int") HashCode;
		static Standard_Integer HashCode (const TopoDS_Shape & theShape,Standard_Integer theUpperBound);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "* Returns True when the two keys are the same. Two same keys must have the same hashcode, the contrary is not necessary.
	:param S1:
	:type S1: TopoDS_Shape
	:param S2:
	:type S2: TopoDS_Shape
	:rtype: bool") IsEqual;
		static Standard_Boolean IsEqual (const TopoDS_Shape & S1,const TopoDS_Shape & S2);

};


%extend TopTools_ShapeMapHasher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class TopTools_ShapeSet *
**************************/
class TopTools_ShapeSet {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Stores <S> and its sub-shape. Returns the index of <S>. The method AddGeometry is called on each sub-shape.
	:param S:
	:type S: TopoDS_Shape
	:rtype: int") Add;
		Standard_Integer Add (const TopoDS_Shape & S);

		/****************** AddGeometry ******************/
		%feature("compactdefaultargs") AddGeometry;
		%feature("autodoc", "* Stores the geometry of <S>.
	:param S:
	:type S: TopoDS_Shape
	:rtype: void") AddGeometry;
		virtual void AddGeometry (const TopoDS_Shape & S);

		/****************** AddShapes ******************/
		%feature("compactdefaultargs") AddShapes;
		%feature("autodoc", "* Inserts the shape <S2> in the shape <S1>. This method must be redefined to use the correct builder.
	:param S1:
	:type S1: TopoDS_Shape
	:param S2:
	:type S2: TopoDS_Shape
	:rtype: void") AddShapes;
		virtual void AddShapes (TopoDS_Shape & S1,const TopoDS_Shape & S2);

		/****************** ChangeLocations ******************/
		%feature("compactdefaultargs") ChangeLocations;
		%feature("autodoc", ":rtype: TopTools_LocationSet") ChangeLocations;
		TopTools_LocationSet & ChangeLocations ();

		/****************** Check ******************/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "* This method is called after each new completed shape. <T> is the type. <S> is the shape. In this class it does nothing, but it gives the opportunity in derived classes to perform extra treatment on shapes.
	:param T:
	:type T: TopAbs_ShapeEnum
	:param S:
	:type S: TopoDS_Shape
	:rtype: void") Check;
		virtual void Check (const TopAbs_ShapeEnum T,TopoDS_Shape & S);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clears the content of the set. This method can be redefined.
	:rtype: void") Clear;
		virtual void Clear ();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "* Dumps on <OS> the shape <S>. Dumps the orientation, the index of the TShape and the index of the Location.
	:param S:
	:type S: TopoDS_Shape
	:param OS:
	:type OS: Standard_OStream
	:rtype: None") Dump;
		void Dump (const TopoDS_Shape & S,Standard_OStream & OS);


        %feature("autodoc", "1");
        %extend{
            std::string DumpExtentToString() {
            std::stringstream s;
            self->DumpExtent(s);
            return s.str();}
        };
        		/****************** DumpExtent ******************/
		%feature("compactdefaultargs") DumpExtent;
		%feature("autodoc", "* Dumps the number of objects in me in the string S (Number of shapes of each type)
	:param S:
	:type S: TCollection_AsciiString
	:rtype: None") DumpExtent;
		void DumpExtent (TCollection_AsciiString & S);


        %feature("autodoc", "1");
        %extend{
            std::string DumpGeometryToString() {
            std::stringstream s;
            self->DumpGeometry(s);
            return s.str();}
        };
        		/****************** DumpGeometry ******************/
		%feature("compactdefaultargs") DumpGeometry;
		%feature("autodoc", "* Dumps the geometry of <S> on the stream <OS>.
	:param S:
	:type S: TopoDS_Shape
	:param OS:
	:type OS: Standard_OStream
	:rtype: void") DumpGeometry;
		virtual void DumpGeometry (const TopoDS_Shape & S,Standard_OStream & OS);

		/****************** FormatNb ******************/
		%feature("compactdefaultargs") FormatNb;
		%feature("autodoc", "* two formats available for the moment: First: does not write CurveOnSurface UV Points into the file on reading calls Check() method. Second: stores CurveOnSurface UV Points. On reading format is recognized from Version string.
	:rtype: int") FormatNb;
		Standard_Integer FormatNb ();

		/****************** GetProgress ******************/
		%feature("compactdefaultargs") GetProgress;
		%feature("autodoc", ":rtype: opencascade::handle<Message_ProgressIndicator>") GetProgress;
		opencascade::handle<Message_ProgressIndicator> GetProgress ();

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "* Returns the index of <S>.
	:param S:
	:type S: TopoDS_Shape
	:rtype: int") Index;
		Standard_Integer Index (const TopoDS_Shape & S);

		/****************** Locations ******************/
		%feature("compactdefaultargs") Locations;
		%feature("autodoc", ":rtype: TopTools_LocationSet") Locations;
		const TopTools_LocationSet & Locations ();

		/****************** NbShapes ******************/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "* Returns number of shapes read from file.
	:rtype: int") NbShapes;
		Standard_Integer NbShapes ();


        %feature("autodoc", "1");
        %extend{
            void ReadFromString(std::string src) {
            std::stringstream s(src);
            self->Read(s);}
        };
        		/****************** Read ******************/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "* Reads from <IS> a shape and returns it in S.
	:param S:
	:type S: TopoDS_Shape
	:param IS:
	:type IS: Standard_IStream
	:rtype: None") Read;
		void Read (TopoDS_Shape & S,Standard_IStream & IS);


        %feature("autodoc", "1");
        %extend{
            void ReadGeometryFromString(std::string src) {
            std::stringstream s(src);
            self->ReadGeometry(s);}
        };
        		/****************** ReadGeometry ******************/
		%feature("compactdefaultargs") ReadGeometry;
		%feature("autodoc", "* Reads the geometry of a shape of type <T> from the stream <IS> and returns it in <S>.
	:param T:
	:type T: TopAbs_ShapeEnum
	:param IS:
	:type IS: Standard_IStream
	:param S:
	:type S: TopoDS_Shape
	:rtype: void") ReadGeometry;
		virtual void ReadGeometry (const TopAbs_ShapeEnum T,Standard_IStream & IS,TopoDS_Shape & S);

		/****************** SetFormatNb ******************/
		%feature("compactdefaultargs") SetFormatNb;
		%feature("autodoc", ":param theFormatNb:
	:type theFormatNb: int
	:rtype: None") SetFormatNb;
		void SetFormatNb (const Standard_Integer theFormatNb);

		/****************** SetProgress ******************/
		%feature("compactdefaultargs") SetProgress;
		%feature("autodoc", ":param PR:
	:type PR: Message_ProgressIndicator
	:rtype: None") SetProgress;
		void SetProgress (const opencascade::handle<Message_ProgressIndicator> & PR);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "* Returns the sub-shape of index <I>.
	:param I:
	:type I: int
	:rtype: TopoDS_Shape") Shape;
		const TopoDS_Shape  Shape (const Standard_Integer I);

		/****************** TopTools_ShapeSet ******************/
		%feature("compactdefaultargs") TopTools_ShapeSet;
		%feature("autodoc", "* Builds an empty ShapeSet.
	:rtype: None") TopTools_ShapeSet;
		 TopTools_ShapeSet ();


        %feature("autodoc", "1");
        %extend{
            std::string WriteToString() {
            std::stringstream s;
            self->Write(s);
            return s.str();}
        };
        		/****************** Write ******************/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "* Writes on <OS> the shape <S>. Writes the orientation, the index of the TShape and the index of the Location.
	:param S:
	:type S: TopoDS_Shape
	:param OS:
	:type OS: Standard_OStream
	:rtype: None") Write;
		void Write (const TopoDS_Shape & S,Standard_OStream & OS);


        %feature("autodoc", "1");
        %extend{
            std::string WriteGeometryToString() {
            std::stringstream s;
            self->WriteGeometry(s);
            return s.str();}
        };
        		/****************** WriteGeometry ******************/
		%feature("compactdefaultargs") WriteGeometry;
		%feature("autodoc", "* Writes the geometry of <S> on the stream <OS> in a format that can be read back by Read.
	:param S:
	:type S: TopoDS_Shape
	:param OS:
	:type OS: Standard_OStream
	:rtype: void") WriteGeometry;
		virtual void WriteGeometry (const TopoDS_Shape & S,Standard_OStream & OS);

};


%extend TopTools_ShapeSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
class TopTools_HArray1OfShape : public  TopTools_Array1OfShape, public Standard_Transient {
  public:
    TopTools_HArray1OfShape(const Standard_Integer theLower, const Standard_Integer theUpper);
    TopTools_HArray1OfShape(const Standard_Integer theLower, const Standard_Integer theUpper, const  TopTools_Array1OfShape::value_type& theValue);
    TopTools_HArray1OfShape(const  TopTools_Array1OfShape& theOther);
    const  TopTools_Array1OfShape& Array1();
     TopTools_Array1OfShape& ChangeArray1();
};
%make_alias(TopTools_HArray1OfShape)


class TopTools_HArray1OfListOfShape : public  TopTools_Array1OfListOfShape, public Standard_Transient {
  public:
    TopTools_HArray1OfListOfShape(const Standard_Integer theLower, const Standard_Integer theUpper);
    TopTools_HArray1OfListOfShape(const Standard_Integer theLower, const Standard_Integer theUpper, const  TopTools_Array1OfListOfShape::value_type& theValue);
    TopTools_HArray1OfListOfShape(const  TopTools_Array1OfListOfShape& theOther);
    const  TopTools_Array1OfListOfShape& Array1();
     TopTools_Array1OfListOfShape& ChangeArray1();
};
%make_alias(TopTools_HArray1OfListOfShape)


/* harray2 classes */
class TopTools_HArray2OfShape : public  TopTools_Array2OfShape, public Standard_Transient {
  public:
    TopTools_HArray2OfShape(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    TopTools_HArray2OfShape(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const  TopTools_Array2OfShape::value_type& theValue);
    TopTools_HArray2OfShape(const  TopTools_Array2OfShape& theOther);
    const  TopTools_Array2OfShape& Array2 ();
     TopTools_Array2OfShape& ChangeArray2 (); 
};
%make_alias(TopTools_HArray2OfShape)


/* hsequence classes */
class TopTools_HSequenceOfShape : public  TopTools_SequenceOfShape, public Standard_Transient {
  public:
    TopTools_HSequenceOfShape();
    TopTools_HSequenceOfShape(const  TopTools_SequenceOfShape& theOther);
    const  TopTools_SequenceOfShape& Sequence();
    void Append (const  TopTools_SequenceOfShape::value_type& theItem);
    void Append ( TopTools_SequenceOfShape& theSequence);
     TopTools_SequenceOfShape& ChangeSequence();
};
%make_alias(TopTools_HSequenceOfShape)


