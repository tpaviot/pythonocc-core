/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_toptools.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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
enum TopTools_FormatVersion {
	TopTools_FormatVersion_VERSION_1 = 1,
	TopTools_FormatVersion_VERSION_2 = 2,
	TopTools_FormatVersion_VERSION_3 = 3,
	TopTools_FormatVersion_CURRENT = TopTools_FormatVersion_VERSION_3,
};

enum  {
	TopTools_FormatVersion_LOWER = TopTools_FormatVersion_VERSION_1,
	TopTools_FormatVersion_UPPER = TopTools_FormatVersion_VERSION_3,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class TopTools_FormatVersion(IntEnum):
	TopTools_FormatVersion_VERSION_1 = 1
	TopTools_FormatVersion_VERSION_2 = 2
	TopTools_FormatVersion_VERSION_3 = 3
	TopTools_FormatVersion_CURRENT = TopTools_FormatVersion_VERSION_3
TopTools_FormatVersion_VERSION_1 = TopTools_FormatVersion.TopTools_FormatVersion_VERSION_1
TopTools_FormatVersion_VERSION_2 = TopTools_FormatVersion.TopTools_FormatVersion_VERSION_2
TopTools_FormatVersion_VERSION_3 = TopTools_FormatVersion.TopTools_FormatVersion_VERSION_3
TopTools_FormatVersion_CURRENT = TopTools_FormatVersion.TopTools_FormatVersion_CURRENT
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
%template(TopTools_Array1OfShape) NCollection_Array1<TopoDS_Shape>;
Array1ExtendIter(TopoDS_Shape)

%template(TopTools_Array2OfShape) NCollection_Array2<TopoDS_Shape>;
%ignore NCollection_DataMap<int,TopTools_ListOfShape>::Items;
%ignore NCollection_DataMap<int,TopTools_ListOfShape>::KeyValues;
%template(TopTools_DataMapOfIntegerListOfShape) NCollection_DataMap<int,TopTools_ListOfShape>;
%ignore NCollection_DataMap<int,TopoDS_Shape>::Items;
%ignore NCollection_DataMap<int,TopoDS_Shape>::KeyValues;
%template(TopTools_DataMapOfIntegerShape) NCollection_DataMap<int,TopoDS_Shape>;
%ignore NCollection_DataMap<TopoDS_Shape,int>::Items;
%ignore NCollection_DataMap<TopoDS_Shape,int>::KeyValues;
%template(TopTools_DataMapOfOrientedShapeInteger) NCollection_DataMap<TopoDS_Shape,int>;
%ignore NCollection_DataMap<TopoDS_Shape,TopoDS_Shape>::Items;
%ignore NCollection_DataMap<TopoDS_Shape,TopoDS_Shape>::KeyValues;
%template(TopTools_DataMapOfOrientedShapeShape) NCollection_DataMap<TopoDS_Shape,TopoDS_Shape>;
%ignore NCollection_DataMap<TopoDS_Shape,Bnd_Box,TopTools_ShapeMapHasher>::Items;
%ignore NCollection_DataMap<TopoDS_Shape,Bnd_Box,TopTools_ShapeMapHasher>::KeyValues;
%template(TopTools_DataMapOfShapeBox) NCollection_DataMap<TopoDS_Shape,Bnd_Box,TopTools_ShapeMapHasher>;
%ignore NCollection_DataMap<TopoDS_Shape,int,TopTools_ShapeMapHasher>::Items;
%ignore NCollection_DataMap<TopoDS_Shape,int,TopTools_ShapeMapHasher>::KeyValues;
%template(TopTools_DataMapOfShapeInteger) NCollection_DataMap<TopoDS_Shape,int,TopTools_ShapeMapHasher>;
%ignore NCollection_DataMap<TopoDS_Shape,TColStd_ListOfInteger,TopTools_ShapeMapHasher>::Items;
%ignore NCollection_DataMap<TopoDS_Shape,TColStd_ListOfInteger,TopTools_ShapeMapHasher>::KeyValues;
%template(TopTools_DataMapOfShapeListOfInteger) NCollection_DataMap<TopoDS_Shape,TColStd_ListOfInteger,TopTools_ShapeMapHasher>;
%ignore NCollection_DataMap<TopoDS_Shape,TopTools_ListOfShape,TopTools_ShapeMapHasher>::Items;
%ignore NCollection_DataMap<TopoDS_Shape,TopTools_ListOfShape,TopTools_ShapeMapHasher>::KeyValues;
%template(TopTools_DataMapOfShapeListOfShape) NCollection_DataMap<TopoDS_Shape,TopTools_ListOfShape,TopTools_ShapeMapHasher>;
%ignore NCollection_DataMap<TopoDS_Shape,double,TopTools_ShapeMapHasher>::Items;
%ignore NCollection_DataMap<TopoDS_Shape,double,TopTools_ShapeMapHasher>::KeyValues;
%template(TopTools_DataMapOfShapeReal) NCollection_DataMap<TopoDS_Shape,double,TopTools_ShapeMapHasher>;
%ignore NCollection_DataMap<TopoDS_Shape,TopTools_SequenceOfShape,TopTools_ShapeMapHasher>::Items;
%ignore NCollection_DataMap<TopoDS_Shape,TopTools_SequenceOfShape,TopTools_ShapeMapHasher>::KeyValues;
%template(TopTools_DataMapOfShapeSequenceOfShape) NCollection_DataMap<TopoDS_Shape,TopTools_SequenceOfShape,TopTools_ShapeMapHasher>;
%ignore NCollection_DataMap<TopoDS_Shape,TopoDS_Shape,TopTools_ShapeMapHasher>::Items;
%ignore NCollection_DataMap<TopoDS_Shape,TopoDS_Shape,TopTools_ShapeMapHasher>::KeyValues;
%template(TopTools_DataMapOfShapeShape) NCollection_DataMap<TopoDS_Shape,TopoDS_Shape,TopTools_ShapeMapHasher>;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,void*,TopTools_ShapeMapHasher>::Items;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,void*,TopTools_ShapeMapHasher>::KeyValues;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,void*,TopTools_ShapeMapHasher>::IndexedItems;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,void*,TopTools_ShapeMapHasher>::Contained;
%template(TopTools_IndexedDataMapOfShapeAddress) NCollection_IndexedDataMap<TopoDS_Shape,void*,TopTools_ShapeMapHasher>;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,TopTools_ListOfShape,TopTools_ShapeMapHasher>::Items;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,TopTools_ListOfShape,TopTools_ShapeMapHasher>::KeyValues;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,TopTools_ListOfShape,TopTools_ShapeMapHasher>::IndexedItems;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,TopTools_ListOfShape,TopTools_ShapeMapHasher>::Contained;
%template(TopTools_IndexedDataMapOfShapeListOfShape) NCollection_IndexedDataMap<TopoDS_Shape,TopTools_ListOfShape,TopTools_ShapeMapHasher>;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,double,TopTools_ShapeMapHasher>::Items;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,double,TopTools_ShapeMapHasher>::KeyValues;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,double,TopTools_ShapeMapHasher>::IndexedItems;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,double,TopTools_ShapeMapHasher>::Contained;
%template(TopTools_IndexedDataMapOfShapeReal) NCollection_IndexedDataMap<TopoDS_Shape,double,TopTools_ShapeMapHasher>;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,TopoDS_Shape,TopTools_ShapeMapHasher>::Items;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,TopoDS_Shape,TopTools_ShapeMapHasher>::KeyValues;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,TopoDS_Shape,TopTools_ShapeMapHasher>::IndexedItems;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,TopoDS_Shape,TopTools_ShapeMapHasher>::Contained;
%template(TopTools_IndexedDataMapOfShapeShape) NCollection_IndexedDataMap<TopoDS_Shape,TopoDS_Shape,TopTools_ShapeMapHasher>;
%ignore NCollection_IndexedMap<TopoDS_Shape>::Items;
%ignore NCollection_IndexedMap<TopoDS_Shape>::KeyValues;
%ignore NCollection_IndexedMap<TopoDS_Shape>::IndexedItems;
%ignore NCollection_IndexedMap<TopoDS_Shape>::Contained;
%template(TopTools_IndexedMapOfOrientedShape) NCollection_IndexedMap<TopoDS_Shape>;
%ignore NCollection_IndexedMap<TopoDS_Shape,TopTools_ShapeMapHasher>::Items;
%ignore NCollection_IndexedMap<TopoDS_Shape,TopTools_ShapeMapHasher>::KeyValues;
%ignore NCollection_IndexedMap<TopoDS_Shape,TopTools_ShapeMapHasher>::IndexedItems;
%ignore NCollection_IndexedMap<TopoDS_Shape,TopTools_ShapeMapHasher>::Contained;
%template(TopTools_IndexedMapOfShape) NCollection_IndexedMap<TopoDS_Shape,TopTools_ShapeMapHasher>;
%template(TopTools_ListIteratorOfListOfListOfShape) NCollection_TListIterator<TopTools_ListOfShape>;
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
%template(TopTools_MapOfOrientedShape) NCollection_Map<TopoDS_Shape>;
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
typedef NCollection_DataMap<int, TopTools_ListOfShape>::Iterator TopTools_DataMapIteratorOfDataMapOfIntegerListOfShape;
typedef NCollection_DataMap<int, TopoDS_Shape>::Iterator TopTools_DataMapIteratorOfDataMapOfIntegerShape;
typedef NCollection_DataMap<TopoDS_Shape, int>::Iterator TopTools_DataMapIteratorOfDataMapOfOrientedShapeInteger;
typedef NCollection_DataMap<TopoDS_Shape, TopoDS_Shape>::Iterator TopTools_DataMapIteratorOfDataMapOfOrientedShapeShape;
typedef NCollection_DataMap<TopoDS_Shape, Bnd_Box, TopTools_ShapeMapHasher>::Iterator TopTools_DataMapIteratorOfDataMapOfShapeBox;
typedef NCollection_DataMap<TopoDS_Shape, int, TopTools_ShapeMapHasher>::Iterator TopTools_DataMapIteratorOfDataMapOfShapeInteger;
typedef NCollection_DataMap<TopoDS_Shape, TColStd_ListOfInteger, TopTools_ShapeMapHasher>::Iterator TopTools_DataMapIteratorOfDataMapOfShapeListOfInteger;
typedef NCollection_DataMap<TopoDS_Shape, TopTools_ListOfShape, TopTools_ShapeMapHasher>::Iterator TopTools_DataMapIteratorOfDataMapOfShapeListOfShape;
typedef NCollection_DataMap<TopoDS_Shape, double, TopTools_ShapeMapHasher>::Iterator TopTools_DataMapIteratorOfDataMapOfShapeReal;
typedef NCollection_DataMap<TopoDS_Shape, TopTools_SequenceOfShape, TopTools_ShapeMapHasher>::Iterator TopTools_DataMapIteratorOfDataMapOfShapeSequenceOfShape;
typedef NCollection_DataMap<TopoDS_Shape, TopoDS_Shape, TopTools_ShapeMapHasher>::Iterator TopTools_DataMapIteratorOfDataMapOfShapeShape;
typedef NCollection_DataMap<int, TopTools_ListOfShape> TopTools_DataMapOfIntegerListOfShape;
typedef NCollection_DataMap<int, TopoDS_Shape> TopTools_DataMapOfIntegerShape;
typedef NCollection_DataMap<TopoDS_Shape, int> TopTools_DataMapOfOrientedShapeInteger;
typedef NCollection_DataMap<TopoDS_Shape, TopoDS_Shape> TopTools_DataMapOfOrientedShapeShape;
typedef NCollection_DataMap<TopoDS_Shape, Bnd_Box, TopTools_ShapeMapHasher> TopTools_DataMapOfShapeBox;
typedef NCollection_DataMap<TopoDS_Shape, int, TopTools_ShapeMapHasher> TopTools_DataMapOfShapeInteger;
typedef NCollection_DataMap<TopoDS_Shape, TColStd_ListOfInteger, TopTools_ShapeMapHasher> TopTools_DataMapOfShapeListOfInteger;
typedef NCollection_DataMap<TopoDS_Shape, TopTools_ListOfShape, TopTools_ShapeMapHasher> TopTools_DataMapOfShapeListOfShape;
typedef NCollection_DataMap<TopoDS_Shape, double, TopTools_ShapeMapHasher> TopTools_DataMapOfShapeReal;
typedef NCollection_DataMap<TopoDS_Shape, TopTools_SequenceOfShape, TopTools_ShapeMapHasher> TopTools_DataMapOfShapeSequenceOfShape;
typedef NCollection_DataMap<TopoDS_Shape, TopoDS_Shape, TopTools_ShapeMapHasher> TopTools_DataMapOfShapeShape;
typedef NCollection_HArray1<TopTools_ListOfShape> TopTools_HArray1OfListOfShape;
typedef NCollection_HArray1<TopoDS_Shape> TopTools_HArray1OfShape;
typedef NCollection_HArray2<TopoDS_Shape> TopTools_HArray2OfShape;
typedef NCollection_HSequence<TopoDS_Shape> TopTools_HSequenceOfShape;
typedef NCollection_IndexedDataMap<TopoDS_Shape, void *, TopTools_ShapeMapHasher> TopTools_IndexedDataMapOfShapeAddress;
typedef NCollection_IndexedDataMap<TopoDS_Shape, TopTools_ListOfShape, TopTools_ShapeMapHasher> TopTools_IndexedDataMapOfShapeListOfShape;
typedef NCollection_IndexedDataMap<TopoDS_Shape, double, TopTools_ShapeMapHasher> TopTools_IndexedDataMapOfShapeReal;
typedef NCollection_IndexedDataMap<TopoDS_Shape, TopoDS_Shape, TopTools_ShapeMapHasher> TopTools_IndexedDataMapOfShapeShape;
typedef NCollection_IndexedMap<TopoDS_Shape> TopTools_IndexedMapOfOrientedShape;
typedef NCollection_IndexedMap<TopoDS_Shape, TopTools_ShapeMapHasher> TopTools_IndexedMapOfShape;
typedef NCollection_List<TopTools_ListOfShape>::Iterator TopTools_ListIteratorOfListOfListOfShape;
typedef NCollection_List<TopoDS_Shape>::Iterator TopTools_ListIteratorOfListOfShape;
typedef NCollection_List<TopTools_ListOfShape> TopTools_ListOfListOfShape;
typedef NCollection_List<TopoDS_Shape> TopTools_ListOfShape;
typedef NCollection_Map<TopoDS_Shape>::Iterator TopTools_MapIteratorOfMapOfOrientedShape;
typedef NCollection_Map<TopoDS_Shape, TopTools_ShapeMapHasher>::Iterator TopTools_MapIteratorOfMapOfShape;
typedef NCollection_Map<TopoDS_Shape> TopTools_MapOfOrientedShape;
typedef NCollection_Map<TopoDS_Shape, TopTools_ShapeMapHasher> TopTools_MapOfShape;
typedef NCollection_Sequence<TopoDS_Shape> TopTools_SequenceOfShape;
/* end typedefs declaration */

/*****************
* class TopTools *
*****************/
%rename(toptools) TopTools;
class TopTools {
	public:
		/****** TopTools::Dummy ******/
		/****** md5 signature: 2eabeaf23486c8d4e6f006851b6a78c2 ******/
		%feature("compactdefaultargs") Dummy;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
None

Description
-----------
This is to bypass an extraction bug. It will force the inclusion of int.hxx itself including Standard_OStream.hxx at the correct position.
") Dummy;
		static void Dummy(const int I);

		/****** TopTools::Dump ******/
		/****** md5 signature: d8fbac42c489d0bae98b03b1387b21c5 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
Sh: TopoDS_Shape

Return
-------
S: Standard_OStream

Description
-----------
A set of Shapes. Can be dump, wrote or read. Dumps the topological structure of <Sh> on the stream <S>.
") Dump;
		static void Dump(const TopoDS_Shape & Sh, std::ostream &OutValue);

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
		/****** TopTools_LocationSet::TopTools_LocationSet ******/
		/****** md5 signature: 533a3b5dd3fb89d3615ab5684bea4bc6 ******/
		%feature("compactdefaultargs") TopTools_LocationSet;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns an empty set of locations.
") TopTools_LocationSet;
		 TopTools_LocationSet();

		/****** TopTools_LocationSet::Add ******/
		/****** md5 signature: 7cdb3f81017590d68bfd141d252b4cd7 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
L: TopLoc_Location

Return
-------
int

Description
-----------
Incorporate a new Location in the set and returns its index.
") Add;
		int Add(const TopLoc_Location & L);

		/****** TopTools_LocationSet::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the content of the set.
") Clear;
		void Clear();

		/****** TopTools_LocationSet::Dump ******/
		/****** md5 signature: e60d722f65a7811be636699da7600e78 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
OS: Standard_OStream

Description
-----------
Dumps the content of me on the stream <OS>.
") Dump;
		void Dump(std::ostream &OutValue);

		/****** TopTools_LocationSet::Index ******/
		/****** md5 signature: 422bc53fbef9ac2e56c05b850302b1bb ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "
Parameters
----------
L: TopLoc_Location

Return
-------
int

Description
-----------
Returns the index of <L>.
") Index;
		int Index(const TopLoc_Location & L);

		/****** TopTools_LocationSet::Location ******/
		/****** md5 signature: 2ce5408eb7d2eeaacf7f0ac26a1b8a72 ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopLoc_Location

Description
-----------
Returns the location of index <I>.
") Location;
		const TopLoc_Location & Location(const int I);

		/****** TopTools_LocationSet::Read ******/
		/****** md5 signature: e5ce096318e6663d7e9f744e8d66b70b ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
IS: str
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Reads the content of me from the stream <IS>. me is first cleared.
") Read;
		void Read(std::istream & IS, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** TopTools_LocationSet::Write ******/
		/****** md5 signature: 6a95f1af9efa3b2eec48861a606241ee ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
OS: Standard_OStream

Description
-----------
Writes the content of me on the stream <OS> in a format that can be read back by Read.
") Write;
		void Write(std::ostream &OutValue, const Message_ProgressRange & theProgress = Message_ProgressRange());

};


%extend TopTools_LocationSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class TopTools_ShapeMapHasher *
********************************/
class TopTools_ShapeMapHasher {
	public:
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
		/****** TopTools_ShapeSet::TopTools_ShapeSet ******/
		/****** md5 signature: bd8be06687b281459575af973cd3b635 ******/
		%feature("compactdefaultargs") TopTools_ShapeSet;
		%feature("autodoc", "Return
-------
None

Description
-----------
Builds an empty ShapeSet.
") TopTools_ShapeSet;
		 TopTools_ShapeSet();

		/****** TopTools_ShapeSet::Add ******/
		/****** md5 signature: e00e8e88523f332d4248798e366af3a6 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
int

Description
-----------
Stores <S> and its sub-shape. Returns the index of <S>. The method AddGeometry is called on each sub-shape.
") Add;
		int Add(const TopoDS_Shape & S);

		/****** TopTools_ShapeSet::AddGeometry ******/
		/****** md5 signature: 0fd943cd475c8e07eb80f1f4508f536a ******/
		%feature("compactdefaultargs") AddGeometry;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
Stores the geometry of <S>.
") AddGeometry;
		virtual void AddGeometry(const TopoDS_Shape & S);

		/****** TopTools_ShapeSet::AddShapes ******/
		/****** md5 signature: e51de0c8f9d77467626b59e64779aeff ******/
		%feature("compactdefaultargs") AddShapes;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape

Return
-------
None

Description
-----------
Inserts the shape <S2> in the shape <S1>. This method must be redefined to use the correct builder.
") AddShapes;
		virtual void AddShapes(TopoDS_Shape & S1, const TopoDS_Shape & S2);

		/****** TopTools_ShapeSet::ChangeLocations ******/
		/****** md5 signature: 30f61a461f3fc1bda3bafd1089a88635 ******/
		%feature("compactdefaultargs") ChangeLocations;
		%feature("autodoc", "Return
-------
TopTools_LocationSet

Description
-----------
No available documentation.
") ChangeLocations;
		TopTools_LocationSet & ChangeLocations();

		/****** TopTools_ShapeSet::Check ******/
		/****** md5 signature: e332cba2d27e7a4823bf6a422228a39a ******/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "
Parameters
----------
T: TopAbs_ShapeEnum
S: TopoDS_Shape

Return
-------
None

Description
-----------
This method is called after each new completed shape. <T> is the type. <S> is the shape. In this class it does nothing, but it gives the opportunity in derived classes to perform extra treatment on shapes.
") Check;
		virtual void Check(const TopAbs_ShapeEnum T, TopoDS_Shape & S);

		/****** TopTools_ShapeSet::Clear ******/
		/****** md5 signature: 1badd2d119b64dbdb177834e510c3af9 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the content of the set. This method can be redefined.
") Clear;
		virtual void Clear();

		/****** TopTools_ShapeSet::Dump ******/
		/****** md5 signature: d32daf6ada75088f1d8019b60f0a3a12 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
OS: Standard_OStream

Description
-----------
Dumps the content of me on the stream <OS>. //! Dumps the shapes from first to last. For each Shape Dump the type, the flags, the subshapes calls DumpGeometry(S) //! Dumps the geometry calling DumpGeometry. //! Dumps the locations.
") Dump;
		virtual void Dump(std::ostream &OutValue);

		/****** TopTools_ShapeSet::Dump ******/
		/****** md5 signature: c9c059aea0364c06c52deb47fd3e508c ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
OS: Standard_OStream

Description
-----------
Dumps on <OS> the shape <S>. Dumps the orientation, the index of the TShape and the index of the Location.
") Dump;
		void Dump(const TopoDS_Shape & S, std::ostream &OutValue);

		/****** TopTools_ShapeSet::DumpExtent ******/
		/****** md5 signature: 87d4d6365aae6f521deeef6773174baf ******/
		%feature("compactdefaultargs") DumpExtent;
		%feature("autodoc", "
Parameters
----------

Return
-------
OS: Standard_OStream

Description
-----------
Dumps the number of objects in me on the stream <OS>. (Number of shapes of each type).
") DumpExtent;
		Standard_OStream & DumpExtent(std::ostream &OutValue);

		/****** TopTools_ShapeSet::DumpExtent ******/
		/****** md5 signature: 953cfb15db6760ae7a9bad9220b58b2c ******/
		%feature("compactdefaultargs") DumpExtent;
		%feature("autodoc", "
Parameters
----------
S: str

Return
-------
None

Description
-----------
Dumps the number of objects in me in the string S (Number of shapes of each type).
") DumpExtent;
		void DumpExtent(TCollection_AsciiString & S);

		/****** TopTools_ShapeSet::DumpGeometry ******/
		/****** md5 signature: 653744bf97783eb78e2934b320b67e17 ******/
		%feature("compactdefaultargs") DumpGeometry;
		%feature("autodoc", "
Parameters
----------

Return
-------
OS: Standard_OStream

Description
-----------
Dumps the geometry of me on the stream <OS>.
") DumpGeometry;
		virtual void DumpGeometry(std::ostream &OutValue);

		/****** TopTools_ShapeSet::DumpGeometry ******/
		/****** md5 signature: b3c7ad4e016db98e090d5f57d68cefa1 ******/
		%feature("compactdefaultargs") DumpGeometry;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
OS: Standard_OStream

Description
-----------
Dumps the geometry of <S> on the stream <OS>.
") DumpGeometry;
		virtual void DumpGeometry(const TopoDS_Shape & S, std::ostream &OutValue);

		/****** TopTools_ShapeSet::FormatNb ******/
		/****** md5 signature: 98c0f61d4057a44b44f87327c30916ee ******/
		%feature("compactdefaultargs") FormatNb;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the TopTools_FormatVersion.
") FormatNb;
		int FormatNb();

		/****** TopTools_ShapeSet::Index ******/
		/****** md5 signature: 27bedbe3f62518ea8f5e80df9093520c ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
int

Description
-----------
Returns the index of <S>.
") Index;
		int Index(const TopoDS_Shape & S);

		/****** TopTools_ShapeSet::Locations ******/
		/****** md5 signature: 24a4ea3b7fee823f5a1c0a3fbabad43e ******/
		%feature("compactdefaultargs") Locations;
		%feature("autodoc", "Return
-------
TopTools_LocationSet

Description
-----------
No available documentation.
") Locations;
		const TopTools_LocationSet & Locations();

		/****** TopTools_ShapeSet::NbShapes ******/
		/****** md5 signature: 5033c6acdebfec4ad702502e01d3601a ******/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of shapes read from file.
") NbShapes;
		int NbShapes();

		/****** TopTools_ShapeSet::Read ******/
		/****** md5 signature: d5549d1f1479104ba7c0f767b82c0b6d ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
IS: str
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Reads the content of me from the stream <IS>. me is first cleared. //! Reads the locations. //! Reads the geometry calling ReadGeometry. //! Reads the shapes. For each shape Reads the type. calls ReadGeometry(T,S). Reads the flag, the subshapes.
") Read;
		virtual void Read(std::istream & IS, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** TopTools_ShapeSet::Read ******/
		/****** md5 signature: b491f021d6a632b4b6084137add9d6b1 ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
IS: str

Return
-------
None

Description
-----------
Reads from <IS> a shape and returns it in S.
") Read;
		void Read(TopoDS_Shape & S, std::istream & IS);

		/****** TopTools_ShapeSet::ReadGeometry ******/
		/****** md5 signature: f2d381e51fecc68108716b044058cd47 ******/
		%feature("compactdefaultargs") ReadGeometry;
		%feature("autodoc", "
Parameters
----------
IS: str
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Reads the geometry of me from the stream <IS>.
") ReadGeometry;
		virtual void ReadGeometry(std::istream & IS, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** TopTools_ShapeSet::ReadGeometry ******/
		/****** md5 signature: 4e371a9743f73b6a83ec48df91308b56 ******/
		%feature("compactdefaultargs") ReadGeometry;
		%feature("autodoc", "
Parameters
----------
T: TopAbs_ShapeEnum
IS: str
S: TopoDS_Shape

Return
-------
None

Description
-----------
Reads the geometry of a shape of type <T> from the stream <IS> and returns it in <S>.
") ReadGeometry;
		virtual void ReadGeometry(const TopAbs_ShapeEnum T, std::istream & IS, TopoDS_Shape & S);

		/****** TopTools_ShapeSet::SetFormatNb ******/
		/****** md5 signature: 82c781302ac5badb8fd104d1fef61b1b ******/
		%feature("compactdefaultargs") SetFormatNb;
		%feature("autodoc", "
Parameters
----------
theFormatNb: int

Return
-------
None

Description
-----------
Sets the TopTools_FormatVersion.
") SetFormatNb;
		void SetFormatNb(const int theFormatNb);

		/****** TopTools_ShapeSet::Shape ******/
		/****** md5 signature: 423b5916c729d75db6f495221f509ab9 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopoDS_Shape

Description
-----------
Returns the sub-shape of index <I>.
") Shape;
		const TopoDS_Shape Shape(const int I);

		/****** TopTools_ShapeSet::Write ******/
		/****** md5 signature: 5f1f156d742c1fe03f970b14ab71611c ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
OS: Standard_OStream

Description
-----------
Writes the content of me on the stream <OS> in a format that can be read back by Read. //! Writes the locations. //! Writes the geometry calling WriteGeometry. //! Dumps the shapes from last to first. For each shape: Write the type. calls WriteGeometry(S). Write the flags, the subshapes.
") Write;
		virtual void Write(std::ostream &OutValue, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** TopTools_ShapeSet::Write ******/
		/****** md5 signature: 5b68b962cc3758ff010ddb00740bcb56 ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
OS: Standard_OStream

Description
-----------
Writes on <OS> the shape <S>. Writes the orientation, the index of the TShape and the index of the Location.
") Write;
		void Write(const TopoDS_Shape & S, std::ostream &OutValue);

		/****** TopTools_ShapeSet::WriteGeometry ******/
		/****** md5 signature: 75c884e05520446878220235ba67ae24 ******/
		%feature("compactdefaultargs") WriteGeometry;
		%feature("autodoc", "
Parameters
----------
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
OS: Standard_OStream

Description
-----------
Writes the geometry of me on the stream <OS> in a format that can be read back by Read.
") WriteGeometry;
		virtual void WriteGeometry(std::ostream &OutValue, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** TopTools_ShapeSet::WriteGeometry ******/
		/****** md5 signature: 122b2c21a82fbea7b7f8cfce352176e9 ******/
		%feature("compactdefaultargs") WriteGeometry;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
OS: Standard_OStream

Description
-----------
Writes the geometry of <S> on the stream <OS> in a format that can be read back by Read.
") WriteGeometry;
		virtual void WriteGeometry(const TopoDS_Shape & S, std::ostream &OutValue);

};


%extend TopTools_ShapeSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */

class TopTools_HArray1OfListOfShape : public NCollection_Array1<TopTools_ListOfShape>, public Standard_Transient {
  public:
    TopTools_HArray1OfListOfShape(const Standard_Integer theLower, const Standard_Integer theUpper);
    TopTools_HArray1OfListOfShape(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<TopTools_ListOfShape>::value_type& theValue);
    TopTools_HArray1OfListOfShape(const NCollection_Array1<TopTools_ListOfShape>& theOther);
    const NCollection_Array1<TopTools_ListOfShape>& Array1();
    NCollection_Array1<TopTools_ListOfShape>& ChangeArray1();
};
%make_alias(TopTools_HArray1OfListOfShape)


class TopTools_HArray1OfShape : public NCollection_Array1<TopoDS_Shape>, public Standard_Transient {
  public:
    TopTools_HArray1OfShape(const Standard_Integer theLower, const Standard_Integer theUpper);
    TopTools_HArray1OfShape(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<TopoDS_Shape>::value_type& theValue);
    TopTools_HArray1OfShape(const NCollection_Array1<TopoDS_Shape>& theOther);
    const NCollection_Array1<TopoDS_Shape>& Array1();
    NCollection_Array1<TopoDS_Shape>& ChangeArray1();
};
%make_alias(TopTools_HArray1OfShape)

/* harray2 classes */
class TopTools_HArray2OfShape : public NCollection_Array2<TopoDS_Shape>, public Standard_Transient {
  public:
    TopTools_HArray2OfShape(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    TopTools_HArray2OfShape(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const NCollection_Array2<TopoDS_Shape>::value_type& theValue);
    TopTools_HArray2OfShape(const NCollection_Array2<TopoDS_Shape>& theOther);
    const NCollection_Array2<TopoDS_Shape>& Array2 ();
    NCollection_Array2<TopoDS_Shape>& ChangeArray2 (); 
};
%make_alias(TopTools_HArray2OfShape)


/* hsequence classes */
class TopTools_HSequenceOfShape : public NCollection_Sequence<TopoDS_Shape>, public Standard_Transient {
  public:
    TopTools_HSequenceOfShape();
    TopTools_HSequenceOfShape(const NCollection_Sequence<TopoDS_Shape>& theOther);
    const NCollection_Sequence<TopoDS_Shape>& Sequence();
    void Append (const NCollection_Sequence<TopoDS_Shape>::value_type& theItem);
    void Append (NCollection_Sequence<TopoDS_Shape>& theSequence);
    NCollection_Sequence<TopoDS_Shape>& ChangeSequence();
};
%make_alias(TopTools_HSequenceOfShape)


/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def toptools_Dummy(*args):
	return toptools.Dummy(*args)

@deprecated
def toptools_Dump(*args):
	return toptools.Dump(*args)

}
