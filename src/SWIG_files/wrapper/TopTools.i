/*
Copyright 2008-2020 Thomas Paviot (tpaviot@gmail.com)

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

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(TopTools_HArray1OfShape)
%wrap_handle(TopTools_HArray1OfListOfShape)
%wrap_handle(TopTools_HArray2OfShape)
%wrap_handle(TopTools_HSequenceOfShape)
/* end handles declaration */

/* templates */
%template(TopTools_Array1OfListOfShape) NCollection_Array1<TopTools_ListOfShape>;

%extend NCollection_Array1<TopTools_ListOfShape> {
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
%template(TopTools_Array1OfShape) NCollection_Array1<TopoDS_Shape>;

%extend NCollection_Array1<TopoDS_Shape> {
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
%template(TopTools_Array2OfShape) NCollection_Array2<TopoDS_Shape>;
%template(TopTools_DataMapOfIntegerListOfShape) NCollection_DataMap<Standard_Integer,TopTools_ListOfShape,TColStd_MapIntegerHasher>;

%extend NCollection_DataMap<Standard_Integer,TopTools_ListOfShape,TColStd_MapIntegerHasher> {
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
%template(TopTools_DataMapOfIntegerShape) NCollection_DataMap<Standard_Integer,TopoDS_Shape,TColStd_MapIntegerHasher>;

%extend NCollection_DataMap<Standard_Integer,TopoDS_Shape,TColStd_MapIntegerHasher> {
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
%template(TopTools_DataMapOfOrientedShapeInteger) NCollection_DataMap<TopoDS_Shape,Standard_Integer,TopTools_OrientedShapeMapHasher>;
%template(TopTools_DataMapOfOrientedShapeShape) NCollection_DataMap<TopoDS_Shape,TopoDS_Shape,TopTools_OrientedShapeMapHasher>;
%template(TopTools_DataMapOfShapeBox) NCollection_DataMap<TopoDS_Shape,Bnd_Box,TopTools_ShapeMapHasher>;
%template(TopTools_DataMapOfShapeInteger) NCollection_DataMap<TopoDS_Shape,Standard_Integer,TopTools_ShapeMapHasher>;
%template(TopTools_DataMapOfShapeListOfInteger) NCollection_DataMap<TopoDS_Shape,TColStd_ListOfInteger,TopTools_ShapeMapHasher>;
%template(TopTools_DataMapOfShapeListOfShape) NCollection_DataMap<TopoDS_Shape,TopTools_ListOfShape,TopTools_ShapeMapHasher>;
%template(TopTools_DataMapOfShapeReal) NCollection_DataMap<TopoDS_Shape,Standard_Real,TopTools_ShapeMapHasher>;
%template(TopTools_DataMapOfShapeSequenceOfShape) NCollection_DataMap<TopoDS_Shape,TopTools_SequenceOfShape,TopTools_ShapeMapHasher>;
%template(TopTools_DataMapOfShapeShape) NCollection_DataMap<TopoDS_Shape,TopoDS_Shape,TopTools_ShapeMapHasher>;
%template(TopTools_IndexedDataMapOfShapeAddress) NCollection_IndexedDataMap<TopoDS_Shape,Standard_Address,TopTools_ShapeMapHasher>;
%template(TopTools_IndexedDataMapOfShapeListOfShape) NCollection_IndexedDataMap<TopoDS_Shape,TopTools_ListOfShape,TopTools_ShapeMapHasher>;
%template(TopTools_IndexedDataMapOfShapeReal) NCollection_IndexedDataMap<TopoDS_Shape,Standard_Real,TopTools_ShapeMapHasher>;
%template(TopTools_IndexedDataMapOfShapeShape) NCollection_IndexedDataMap<TopoDS_Shape,TopoDS_Shape,TopTools_ShapeMapHasher>;
%template(TopTools_IndexedMapOfOrientedShape) NCollection_IndexedMap<TopoDS_Shape,TopTools_OrientedShapeMapHasher>;
%template(TopTools_IndexedMapOfShape) NCollection_IndexedMap<TopoDS_Shape,TopTools_ShapeMapHasher>;
%template(TopTools_ListIteratorOfListOfShape) NCollection_TListIterator<TopoDS_Shape>;
%template(TopTools_ListOfListOfShape) NCollection_List<TopTools_ListOfShape>;

%extend NCollection_List<TopTools_ListOfShape> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(TopTools_ListOfShape) NCollection_List<TopoDS_Shape>;

%extend NCollection_List<TopoDS_Shape> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(TopTools_MapOfOrientedShape) NCollection_Map<TopoDS_Shape,TopTools_OrientedShapeMapHasher>;
%template(TopTools_MapOfShape) NCollection_Map<TopoDS_Shape,TopTools_ShapeMapHasher>;
%template(TopTools_SequenceOfShape) NCollection_Sequence<TopoDS_Shape>;

%extend NCollection_Sequence<TopoDS_Shape> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<TopTools_ListOfShape> TopTools_Array1OfListOfShape;
typedef NCollection_Array1<TopoDS_Shape> TopTools_Array1OfShape;
typedef NCollection_Array2<TopoDS_Shape> TopTools_Array2OfShape;
typedef NCollection_DataMap<Standard_Integer, TopTools_ListOfShape, TColStd_MapIntegerHasher>::Iterator TopTools_DataMapIteratorOfDataMapOfIntegerListOfShape;
typedef NCollection_DataMap<Standard_Integer, TopoDS_Shape, TColStd_MapIntegerHasher>::Iterator TopTools_DataMapIteratorOfDataMapOfIntegerShape;
typedef NCollection_DataMap<TopoDS_Shape, Standard_Integer, TopTools_OrientedShapeMapHasher>::Iterator TopTools_DataMapIteratorOfDataMapOfOrientedShapeInteger;
typedef NCollection_DataMap<TopoDS_Shape, TopoDS_Shape, TopTools_OrientedShapeMapHasher>::Iterator TopTools_DataMapIteratorOfDataMapOfOrientedShapeShape;
typedef TopTools_DataMapOfShapeBox::Iterator TopTools_DataMapIteratorOfDataMapOfShapeBox;
typedef NCollection_DataMap<TopoDS_Shape, Standard_Integer, TopTools_ShapeMapHasher>::Iterator TopTools_DataMapIteratorOfDataMapOfShapeInteger;
typedef NCollection_DataMap<TopoDS_Shape, TColStd_ListOfInteger, TopTools_ShapeMapHasher>::Iterator TopTools_DataMapIteratorOfDataMapOfShapeListOfInteger;
typedef NCollection_DataMap<TopoDS_Shape, TopTools_ListOfShape, TopTools_ShapeMapHasher>::Iterator TopTools_DataMapIteratorOfDataMapOfShapeListOfShape;
typedef NCollection_DataMap<TopoDS_Shape, Standard_Real, TopTools_ShapeMapHasher>::Iterator TopTools_DataMapIteratorOfDataMapOfShapeReal;
typedef NCollection_DataMap<TopoDS_Shape, TopTools_SequenceOfShape, TopTools_ShapeMapHasher>::Iterator TopTools_DataMapIteratorOfDataMapOfShapeSequenceOfShape;
typedef NCollection_DataMap<TopoDS_Shape, TopoDS_Shape, TopTools_ShapeMapHasher>::Iterator TopTools_DataMapIteratorOfDataMapOfShapeShape;
typedef NCollection_DataMap<Standard_Integer, TopTools_ListOfShape, TColStd_MapIntegerHasher> TopTools_DataMapOfIntegerListOfShape;
typedef NCollection_DataMap<Standard_Integer, TopoDS_Shape, TColStd_MapIntegerHasher> TopTools_DataMapOfIntegerShape;
typedef NCollection_DataMap<TopoDS_Shape, Standard_Integer, TopTools_OrientedShapeMapHasher> TopTools_DataMapOfOrientedShapeInteger;
typedef NCollection_DataMap<TopoDS_Shape, TopoDS_Shape, TopTools_OrientedShapeMapHasher> TopTools_DataMapOfOrientedShapeShape;
typedef NCollection_DataMap<TopoDS_Shape, Bnd_Box, TopTools_ShapeMapHasher> TopTools_DataMapOfShapeBox;
typedef NCollection_DataMap<TopoDS_Shape, Standard_Integer, TopTools_ShapeMapHasher> TopTools_DataMapOfShapeInteger;
typedef NCollection_DataMap<TopoDS_Shape, TColStd_ListOfInteger, TopTools_ShapeMapHasher> TopTools_DataMapOfShapeListOfInteger;
typedef NCollection_DataMap<TopoDS_Shape, TopTools_ListOfShape, TopTools_ShapeMapHasher> TopTools_DataMapOfShapeListOfShape;
typedef NCollection_DataMap<TopoDS_Shape, Standard_Real, TopTools_ShapeMapHasher> TopTools_DataMapOfShapeReal;
typedef NCollection_DataMap<TopoDS_Shape, TopTools_SequenceOfShape, TopTools_ShapeMapHasher> TopTools_DataMapOfShapeSequenceOfShape;
typedef NCollection_DataMap<TopoDS_Shape, TopoDS_Shape, TopTools_ShapeMapHasher> TopTools_DataMapOfShapeShape;
typedef NCollection_IndexedDataMap<TopoDS_Shape, Standard_Address, TopTools_ShapeMapHasher> TopTools_IndexedDataMapOfShapeAddress;
typedef NCollection_IndexedDataMap<TopoDS_Shape, TopTools_ListOfShape, TopTools_ShapeMapHasher> TopTools_IndexedDataMapOfShapeListOfShape;
typedef NCollection_IndexedDataMap<TopoDS_Shape, Standard_Real, TopTools_ShapeMapHasher> TopTools_IndexedDataMapOfShapeReal;
typedef NCollection_IndexedDataMap<TopoDS_Shape, TopoDS_Shape, TopTools_ShapeMapHasher> TopTools_IndexedDataMapOfShapeShape;
typedef NCollection_IndexedMap<TopoDS_Shape, TopTools_OrientedShapeMapHasher> TopTools_IndexedMapOfOrientedShape;
typedef NCollection_IndexedMap<TopoDS_Shape, TopTools_ShapeMapHasher> TopTools_IndexedMapOfShape;
typedef TopTools_ListOfListOfShape::Iterator TopTools_ListIteratorOfListOfListOfShape;
typedef NCollection_List<TopoDS_Shape>::Iterator TopTools_ListIteratorOfListOfShape;
typedef NCollection_List<TopTools_ListOfShape> TopTools_ListOfListOfShape;
typedef NCollection_List<TopoDS_Shape> TopTools_ListOfShape;
typedef TopTools_LocationSet * TopTools_LocationSetPtr;
typedef NCollection_Map<TopoDS_Shape, TopTools_OrientedShapeMapHasher>::Iterator TopTools_MapIteratorOfMapOfOrientedShape;
typedef NCollection_Map<TopoDS_Shape, TopTools_ShapeMapHasher>::Iterator TopTools_MapIteratorOfMapOfShape;
typedef NCollection_Map<TopoDS_Shape, TopTools_OrientedShapeMapHasher> TopTools_MapOfOrientedShape;
typedef NCollection_Map<TopoDS_Shape, TopTools_ShapeMapHasher> TopTools_MapOfShape;
typedef NCollection_Sequence<TopoDS_Shape> TopTools_SequenceOfShape;
/* end typedefs declaration */

/*****************
* class TopTools *
*****************/
%rename(toptools) TopTools;
class TopTools {
	public:
		/****************** Dummy ******************/
		/**** md5 signature: 3d202e2bac865a0ccb3610a850392a11 ****/
		%feature("compactdefaultargs") Dummy;
		%feature("autodoc", "This is to bypass an extraction bug. it will force the inclusion of standard_integer.hxx itself including standard_ostream.hxx at the correct position.

Parameters
----------
I: int

Returns
-------
None
") Dummy;
		static void Dummy(const Standard_Integer I);

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
		/****************** TopTools_LocationSet ******************/
		/**** md5 signature: 533a3b5dd3fb89d3615ab5684bea4bc6 ****/
		%feature("compactdefaultargs") TopTools_LocationSet;
		%feature("autodoc", "Returns an empty set of locations.

Returns
-------
None
") TopTools_LocationSet;
		 TopTools_LocationSet();

		/****************** Add ******************/
		/**** md5 signature: 6d3b7662960d74b2d6e66b85d46b59f7 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Incorporate a new location in the set and returns its index.

Parameters
----------
L: TopLoc_Location

Returns
-------
int
") Add;
		Standard_Integer Add(const TopLoc_Location & L);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the content of the set.

Returns
-------
None
") Clear;
		void Clear();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** GetProgress ******************/
		/**** md5 signature: 5ccd431fdaac188bfde6910f9c87adba ****/
		%feature("compactdefaultargs") GetProgress;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Message_ProgressIndicator>
") GetProgress;
		opencascade::handle<Message_ProgressIndicator> GetProgress();

		/****************** Index ******************/
		/**** md5 signature: fbb01960bb9b443c36d99f6e7b11f6c5 ****/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Returns the index of <l>.

Parameters
----------
L: TopLoc_Location

Returns
-------
int
") Index;
		Standard_Integer Index(const TopLoc_Location & L);

		/****************** Location ******************/
		/**** md5 signature: dc46e30cfdcf3a3cf13e5f29298f5163 ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the location of index <i>.

Parameters
----------
I: int

Returns
-------
TopLoc_Location
") Location;
		const TopLoc_Location & Location(const Standard_Integer I);


            %feature("autodoc", "1");
            %extend{
                void ReadFromString(std::string src) {
                std::stringstream s(src);
                self->Read(s);}
            };
		/****************** SetProgress ******************/
		/**** md5 signature: b010efa5a4169e377c5a67920d2de5f9 ****/
		%feature("compactdefaultargs") SetProgress;
		%feature("autodoc", "No available documentation.

Parameters
----------
PR: Message_ProgressIndicator

Returns
-------
None
") SetProgress;
		void SetProgress(const opencascade::handle<Message_ProgressIndicator> & PR);


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
		/****************** TopTools_MutexForShapeProvider ******************/
		/**** md5 signature: 186234db6cbd1a9407b42684a8f3081d ****/
		%feature("compactdefaultargs") TopTools_MutexForShapeProvider;
		%feature("autodoc", "Constructor.

Returns
-------
None
") TopTools_MutexForShapeProvider;
		 TopTools_MutexForShapeProvider();

		/****************** CreateMutexForShape ******************/
		/**** md5 signature: b5392c05a309d51d95fab879c6f4617b ****/
		%feature("compactdefaultargs") CreateMutexForShape;
		%feature("autodoc", "Creates and associates mutex with theshape.

Parameters
----------
theShape: TopoDS_Shape

Returns
-------
None
") CreateMutexForShape;
		void CreateMutexForShape(const TopoDS_Shape & theShape);

		/****************** CreateMutexesForSubShapes ******************/
		/**** md5 signature: 530747123c3841aaa5f39dcd5b102477 ****/
		%feature("compactdefaultargs") CreateMutexesForSubShapes;
		%feature("autodoc", "Creates and associates mutexes with each sub-shape of type thetype in theshape.

Parameters
----------
theShape: TopoDS_Shape
theType: TopAbs_ShapeEnum

Returns
-------
None
") CreateMutexesForSubShapes;
		void CreateMutexesForSubShapes(const TopoDS_Shape & theShape, const TopAbs_ShapeEnum theType);

		/****************** GetMutex ******************/
		/**** md5 signature: 48d2b8ac7b66d60ead3fd28dc2f08e09 ****/
		%feature("compactdefaultargs") GetMutex;
		%feature("autodoc", "Returns pointer to mutex associated with theshape. in case when mutex not found returns null.

Parameters
----------
theShape: TopoDS_Shape

Returns
-------
Standard_Mutex *
") GetMutex;
		Standard_Mutex * GetMutex(const TopoDS_Shape & theShape);

		/****************** RemoveAllMutexes ******************/
		/**** md5 signature: d2ba49e58f7b852bc20e81e25b6b909d ****/
		%feature("compactdefaultargs") RemoveAllMutexes;
		%feature("autodoc", "Removes all mutexes.

Returns
-------
None
") RemoveAllMutexes;
		void RemoveAllMutexes();

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
		/**** md5 signature: cf743343a1907f73e2da55e3b4f8638f ****/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "Computes a hash code for the given shape, in the range [1, theupperbound] @param theshape the shape which hash code is to be computed @param theupperbound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theupperbound].

Parameters
----------
theShape: TopoDS_Shape
theUpperBound: int

Returns
-------
int
") HashCode;
		static Standard_Integer HashCode(const TopoDS_Shape & theShape, const Standard_Integer theUpperBound);

		/****************** IsEqual ******************/
		/**** md5 signature: 6cfded5b10e66f3ff935b8fedf5531b0 ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Returns true when the two keys are equal. two same keys must have the same hashcode, the contrary is not necessary.

Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape

Returns
-------
bool
") IsEqual;
		static Standard_Boolean IsEqual(const TopoDS_Shape & S1, const TopoDS_Shape & S2);

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
		/**** md5 signature: 2620d20054f9679679d76587e338d89d ****/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "Computes a hash code for the given shape, in the range [1, theupperbound] @param theshape the shape which hash code is to be computed @param theupperbound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theupperbound].

Parameters
----------
theShape: TopoDS_Shape
theUpperBound: int

Returns
-------
int
") HashCode;
		static Standard_Integer HashCode(const TopoDS_Shape & theShape, Standard_Integer theUpperBound);

		/****************** IsEqual ******************/
		/**** md5 signature: 6cfded5b10e66f3ff935b8fedf5531b0 ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Returns true when the two keys are the same. two same keys must have the same hashcode, the contrary is not necessary.

Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape

Returns
-------
bool
") IsEqual;
		static Standard_Boolean IsEqual(const TopoDS_Shape & S1, const TopoDS_Shape & S2);

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
		/****************** TopTools_ShapeSet ******************/
		/**** md5 signature: bd8be06687b281459575af973cd3b635 ****/
		%feature("compactdefaultargs") TopTools_ShapeSet;
		%feature("autodoc", "Builds an empty shapeset.

Returns
-------
None
") TopTools_ShapeSet;
		 TopTools_ShapeSet();

		/****************** Add ******************/
		/**** md5 signature: 53c72d7ee288afd721c7b0a7e7296012 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Stores <s> and its sub-shape. returns the index of <s>. the method addgeometry is called on each sub-shape.

Parameters
----------
S: TopoDS_Shape

Returns
-------
int
") Add;
		Standard_Integer Add(const TopoDS_Shape & S);

		/****************** AddGeometry ******************/
		/**** md5 signature: 0fd943cd475c8e07eb80f1f4508f536a ****/
		%feature("compactdefaultargs") AddGeometry;
		%feature("autodoc", "Stores the geometry of <s>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") AddGeometry;
		virtual void AddGeometry(const TopoDS_Shape & S);

		/****************** AddShapes ******************/
		/**** md5 signature: e51de0c8f9d77467626b59e64779aeff ****/
		%feature("compactdefaultargs") AddShapes;
		%feature("autodoc", "Inserts the shape <s2> in the shape <s1>. this method must be redefined to use the correct builder.

Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape

Returns
-------
None
") AddShapes;
		virtual void AddShapes(TopoDS_Shape & S1, const TopoDS_Shape & S2);

		/****************** ChangeLocations ******************/
		/**** md5 signature: 30f61a461f3fc1bda3bafd1089a88635 ****/
		%feature("compactdefaultargs") ChangeLocations;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_LocationSet
") ChangeLocations;
		TopTools_LocationSet & ChangeLocations();

		/****************** Check ******************/
		/**** md5 signature: e332cba2d27e7a4823bf6a422228a39a ****/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "This method is called after each new completed shape. <t> is the type. <s> is the shape. in this class it does nothing, but it gives the opportunity in derived classes to perform extra treatment on shapes.

Parameters
----------
T: TopAbs_ShapeEnum
S: TopoDS_Shape

Returns
-------
None
") Check;
		virtual void Check(const TopAbs_ShapeEnum T, TopoDS_Shape & S);

		/****************** Clear ******************/
		/**** md5 signature: 1badd2d119b64dbdb177834e510c3af9 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the content of the set. this method can be redefined.

Returns
-------
None
") Clear;
		virtual void Clear();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };

        %feature("autodoc", "1");
        %extend{
            std::string DumpExtentToString() {
            std::stringstream s;
            self->DumpExtent(s);
            return s.str();}
        };
		/****************** DumpExtent ******************/
		/**** md5 signature: 953cfb15db6760ae7a9bad9220b58b2c ****/
		%feature("compactdefaultargs") DumpExtent;
		%feature("autodoc", "Dumps the number of objects in me in the string s (number of shapes of each type).

Parameters
----------
S: TCollection_AsciiString

Returns
-------
None
") DumpExtent;
		void DumpExtent(TCollection_AsciiString & S);


        %feature("autodoc", "1");
        %extend{
            std::string DumpGeometryToString() {
            std::stringstream s;
            self->DumpGeometry(s);
            return s.str();}
        };
		/****************** FormatNb ******************/
		/**** md5 signature: 4ba7a37f990f272738aa2003a22fc1da ****/
		%feature("compactdefaultargs") FormatNb;
		%feature("autodoc", "Two formats available for the moment: first: does not write curveonsurface uv points into the file on reading calls check() method. second: stores curveonsurface uv points. on reading format is recognized from version string.

Returns
-------
int
") FormatNb;
		Standard_Integer FormatNb();

		/****************** GetProgress ******************/
		/**** md5 signature: 5ccd431fdaac188bfde6910f9c87adba ****/
		%feature("compactdefaultargs") GetProgress;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Message_ProgressIndicator>
") GetProgress;
		opencascade::handle<Message_ProgressIndicator> GetProgress();

		/****************** Index ******************/
		/**** md5 signature: 9e94bb6d7b4221be4165f8639cd27d92 ****/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Returns the index of <s>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
int
") Index;
		Standard_Integer Index(const TopoDS_Shape & S);

		/****************** Locations ******************/
		/**** md5 signature: 24a4ea3b7fee823f5a1c0a3fbabad43e ****/
		%feature("compactdefaultargs") Locations;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_LocationSet
") Locations;
		const TopTools_LocationSet & Locations();

		/****************** NbShapes ******************/
		/**** md5 signature: ea90d1514db96ad18becf0e04a33abf6 ****/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "Returns number of shapes read from file.

Returns
-------
int
") NbShapes;
		Standard_Integer NbShapes();


            %feature("autodoc", "1");
            %extend{
                void ReadFromString(std::string src) {
                std::stringstream s(src);
                self->Read(s);}
            };

            %feature("autodoc", "1");
            %extend{
                void ReadGeometryFromString(std::string src) {
                std::stringstream s(src);
                self->ReadGeometry(s);}
            };
		/****************** SetFormatNb ******************/
		/**** md5 signature: efa61c5f0aa586c699f53e1139cd95f9 ****/
		%feature("compactdefaultargs") SetFormatNb;
		%feature("autodoc", "No available documentation.

Parameters
----------
theFormatNb: int

Returns
-------
None
") SetFormatNb;
		void SetFormatNb(const Standard_Integer theFormatNb);

		/****************** SetProgress ******************/
		/**** md5 signature: b010efa5a4169e377c5a67920d2de5f9 ****/
		%feature("compactdefaultargs") SetProgress;
		%feature("autodoc", "No available documentation.

Parameters
----------
PR: Message_ProgressIndicator

Returns
-------
None
") SetProgress;
		void SetProgress(const opencascade::handle<Message_ProgressIndicator> & PR);

		/****************** Shape ******************/
		/**** md5 signature: 243b850f6d21a0fba84095c942dbd917 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns the sub-shape of index <i>.

Parameters
----------
I: int

Returns
-------
TopoDS_Shape
") Shape;
		const TopoDS_Shape Shape(const Standard_Integer I);


        %feature("autodoc", "1");
        %extend{
            std::string WriteToString() {
            std::stringstream s;
            self->Write(s);
            return s.str();}
        };

        %feature("autodoc", "1");
        %extend{
            std::string WriteGeometryToString() {
            std::stringstream s;
            self->WriteGeometry(s);
            return s.str();}
        };
};


%extend TopTools_ShapeSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */

class TopTools_HArray1OfShape : public TopTools_Array1OfShape, public Standard_Transient {
  public:
    TopTools_HArray1OfShape(const Standard_Integer theLower, const Standard_Integer theUpper);
    TopTools_HArray1OfShape(const Standard_Integer theLower, const Standard_Integer theUpper, const TopTools_Array1OfShape::value_type& theValue);
    TopTools_HArray1OfShape(const TopTools_Array1OfShape& theOther);
    const TopTools_Array1OfShape& Array1();
    TopTools_Array1OfShape& ChangeArray1();
};
%make_alias(TopTools_HArray1OfShape)


class TopTools_HArray1OfListOfShape : public TopTools_Array1OfListOfShape, public Standard_Transient {
  public:
    TopTools_HArray1OfListOfShape(const Standard_Integer theLower, const Standard_Integer theUpper);
    TopTools_HArray1OfListOfShape(const Standard_Integer theLower, const Standard_Integer theUpper, const TopTools_Array1OfListOfShape::value_type& theValue);
    TopTools_HArray1OfListOfShape(const TopTools_Array1OfListOfShape& theOther);
    const TopTools_Array1OfListOfShape& Array1();
    TopTools_Array1OfListOfShape& ChangeArray1();
};
%make_alias(TopTools_HArray1OfListOfShape)

/* harray2 classes */
class TopTools_HArray2OfShape : public TopTools_Array2OfShape, public Standard_Transient {
  public:
    TopTools_HArray2OfShape(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    TopTools_HArray2OfShape(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const TopTools_Array2OfShape::value_type& theValue);
    TopTools_HArray2OfShape(const TopTools_Array2OfShape& theOther);
    const TopTools_Array2OfShape& Array2 ();
    TopTools_Array2OfShape& ChangeArray2 (); 
};
%make_alias(TopTools_HArray2OfShape)


/* hsequence classes */
class TopTools_HSequenceOfShape : public TopTools_SequenceOfShape, public Standard_Transient {
  public:
    TopTools_HSequenceOfShape();
    TopTools_HSequenceOfShape(const TopTools_SequenceOfShape& theOther);
    const TopTools_SequenceOfShape& Sequence();
    void Append (const TopTools_SequenceOfShape::value_type& theItem);
    void Append (TopTools_SequenceOfShape& theSequence);
    TopTools_SequenceOfShape& ChangeSequence();
};
%make_alias(TopTools_HSequenceOfShape)


