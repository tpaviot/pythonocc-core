/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
%define TCOLSTDDOCSTRING
"TColStd module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_tcolstd.html"
%enddef
%module (package="OCC.Core", docstring=TCOLSTDDOCSTRING) TColStd


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
#include<TColStd_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TCollection_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};

/*
numpy support for Geom, Geom2d, Poly, TColStd, TColgp, TShort see
https://github.com/tpaviot/pythonocc-core/pull/1381
*/
%{
#define SWIG_FILE_WITH_INIT
%}
%include ../common/numpy.i

%init %{
        import_array();
%}

%pythoncode {
    import numpy as np
}
%apply (double* IN_ARRAY1, int DIM1) { (double* numpyArrayU, int nRowsU) };
%apply (double* IN_ARRAY2, int DIM1, int DIM2) { (double* numpyArrayUV, int nRowsUV, int nColUV) };
%apply (double* ARGOUT_ARRAY1, int DIM1) { (double* numpyArrayResultArgout, int aSizeArgout) };

/*
end of numpy support section
*/
%import Standard.i
%import NCollection.i
%import TCollection.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(TColStd_HPackedMapOfInteger)
%wrap_handle(TColStd_HArray1OfAsciiString)
%wrap_handle(TColStd_HArray1OfBoolean)
%wrap_handle(TColStd_HArray1OfByte)
%wrap_handle(TColStd_HArray1OfCharacter)
%wrap_handle(TColStd_HArray1OfExtendedString)
%wrap_handle(TColStd_HArray1OfInteger)
%wrap_handle(TColStd_HArray1OfListOfInteger)
%wrap_handle(TColStd_HArray1OfReal)
%wrap_handle(TColStd_HArray1OfTransient)
%wrap_handle(TColStd_HArray2OfBoolean)
%wrap_handle(TColStd_HArray2OfCharacter)
%wrap_handle(TColStd_HArray2OfInteger)
%wrap_handle(TColStd_HArray2OfReal)
%wrap_handle(TColStd_HArray2OfTransient)
%wrap_handle(TColStd_HSequenceOfAsciiString)
%wrap_handle(TColStd_HSequenceOfExtendedString)
%wrap_handle(TColStd_HSequenceOfHAsciiString)
%wrap_handle(TColStd_HSequenceOfHExtendedString)
%wrap_handle(TColStd_HSequenceOfInteger)
%wrap_handle(TColStd_HSequenceOfReal)
%wrap_handle(TColStd_HSequenceOfTransient)
/* end handles declaration */

/* templates */
%template(TColStd_Array1OfAsciiString) NCollection_Array1<TCollection_AsciiString>;
Array1ExtendIter(TCollection_AsciiString)

%template(TColStd_Array1OfBoolean) NCollection_Array1<Standard_Boolean>;
Array1ExtendIter(Standard_Boolean)

%template(TColStd_Array1OfByte) NCollection_Array1<Standard_Byte>;
Array1ExtendIter(Standard_Byte)

%template(TColStd_Array1OfCharacter) NCollection_Array1<Standard_Character>;
Array1ExtendIter(Standard_Character)

%template(TColStd_Array1OfExtendedString) NCollection_Array1<TCollection_ExtendedString>;
Array1ExtendIter(TCollection_ExtendedString)

%apply (long long* IN_ARRAY1, int DIM1) { (long long* numpyArray1, int nRows1) };
%apply (long long* ARGOUT_ARRAY1, int DIM1) { (long long* numpyArray1Argout, int nRows1Argout) };
Array1NumpyTemplate(TColStd_Array1OfInteger, long long, Standard_Integer)
%apply (double* IN_ARRAY1, int DIM1) { (double* numpyArray1, int nRows1) };
%apply (double* ARGOUT_ARRAY1, int DIM1) { (double* numpyArray1Argout, int nRows1Argout) };
Array1NumpyTemplate(TColStd_Array1OfReal, double, Standard_Real)
%template(TColStd_Array1OfTransient) NCollection_Array1<opencascade::handle<Standard_Transient>>;
Array1ExtendIter(opencascade::handle<Standard_Transient>)

%template(TColStd_Array2OfBoolean) NCollection_Array2<Standard_Boolean>;
%template(TColStd_Array2OfCharacter) NCollection_Array2<Standard_Character>;
%apply (long long* IN_ARRAY2, int DIM1, int DIM2) { (long long* numpyArray2, int nRows2, int nCols2) };
%apply (long long* ARGOUT_ARRAY1, int DIM1) { (long long* numpyArray2Argout, int aSizeArgout) };
Array2NumpyTemplate(TColStd_Array2OfInteger, long long, Standard_Integer)
%apply (double* IN_ARRAY2, int DIM1, int DIM2) { (double* numpyArray2, int nRows2, int nCols2) };
%apply (double* ARGOUT_ARRAY1, int DIM1) { (double* numpyArray2Argout, int aSizeArgout) };
Array2NumpyTemplate(TColStd_Array2OfReal, double, Standard_Real)
%template(TColStd_Array2OfTransient) NCollection_Array2<opencascade::handle<Standard_Transient>>;
%template(TColStd_DataMapOfAsciiStringInteger) NCollection_DataMap<TCollection_AsciiString,Standard_Integer>;
%template(TColStd_DataMapOfIntegerInteger) NCollection_DataMap<Standard_Integer,Standard_Integer>;

%extend NCollection_DataMap<Standard_Integer,Standard_Integer> {
    PyObject* Keys() {
        PyObject *l=PyList_New(0);
        for (TColStd_DataMapOfIntegerInteger::Iterator anIt1(*self); anIt1.More(); anIt1.Next()) {
          PyObject *o = PyLong_FromLong(anIt1.Key());
          PyList_Append(l, o);
          Py_DECREF(o);
        }
    return l;
    }
};
%template(TColStd_DataMapOfIntegerListOfInteger) NCollection_DataMap<Standard_Integer,TColStd_ListOfInteger>;

%extend NCollection_DataMap<Standard_Integer,TColStd_ListOfInteger> {
    PyObject* Keys() {
        PyObject *l=PyList_New(0);
        for (TColStd_DataMapOfIntegerListOfInteger::Iterator anIt1(*self); anIt1.More(); anIt1.Next()) {
          PyObject *o = PyLong_FromLong(anIt1.Key());
          PyList_Append(l, o);
          Py_DECREF(o);
        }
    return l;
    }
};
%template(TColStd_DataMapOfIntegerReal) NCollection_DataMap<Standard_Integer,Standard_Real>;

%extend NCollection_DataMap<Standard_Integer,Standard_Real> {
    PyObject* Keys() {
        PyObject *l=PyList_New(0);
        for (TColStd_DataMapOfIntegerReal::Iterator anIt1(*self); anIt1.More(); anIt1.Next()) {
          PyObject *o = PyLong_FromLong(anIt1.Key());
          PyList_Append(l, o);
          Py_DECREF(o);
        }
    return l;
    }
};
%template(TColStd_DataMapOfIntegerTransient) NCollection_DataMap<Standard_Integer,opencascade::handle<Standard_Transient>>;

%extend NCollection_DataMap<Standard_Integer,opencascade::handle<Standard_Transient>> {
    PyObject* Keys() {
        PyObject *l=PyList_New(0);
        for (TColStd_DataMapOfIntegerTransient::Iterator anIt1(*self); anIt1.More(); anIt1.Next()) {
          PyObject *o = PyLong_FromLong(anIt1.Key());
          PyList_Append(l, o);
          Py_DECREF(o);
        }
    return l;
    }
};
%template(TColStd_DataMapOfStringInteger) NCollection_DataMap<TCollection_ExtendedString,Standard_Integer>;
%template(TColStd_DataMapOfTransientTransient) NCollection_DataMap<opencascade::handle<Standard_Transient>,opencascade::handle<Standard_Transient>>;
%template(TColStd_IndexedDataMapOfStringString) NCollection_IndexedDataMap<TCollection_AsciiString,TCollection_AsciiString>;
%template(TColStd_IndexedDataMapOfTransientTransient) NCollection_IndexedDataMap<opencascade::handle<Standard_Transient>,opencascade::handle<Standard_Transient>>;
%template(TColStd_IndexedMapOfInteger) NCollection_IndexedMap<Standard_Integer>;
%template(TColStd_IndexedMapOfReal) NCollection_IndexedMap<Standard_Real>;
%template(TColStd_IndexedMapOfTransient) NCollection_IndexedMap<opencascade::handle<Standard_Transient>>;
%template(TColStd_ListIteratorOfListOfAsciiString) NCollection_TListIterator<TCollection_AsciiString>;
%template(TColStd_ListIteratorOfListOfInteger) NCollection_TListIterator<Standard_Integer>;
%template(TColStd_ListIteratorOfListOfReal) NCollection_TListIterator<Standard_Real>;
%template(TColStd_ListIteratorOfListOfTransient) NCollection_TListIterator<opencascade::handle<Standard_Transient>>;
%template(TColStd_ListOfAsciiString) NCollection_List<TCollection_AsciiString>;

%extend NCollection_List<TCollection_AsciiString> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(TColStd_ListOfInteger) NCollection_List<Standard_Integer>;

%extend NCollection_List<Standard_Integer> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(TColStd_ListOfReal) NCollection_List<Standard_Real>;

%extend NCollection_List<Standard_Real> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(TColStd_ListOfTransient) NCollection_List<opencascade::handle<Standard_Transient>>;

%extend NCollection_List<opencascade::handle<Standard_Transient>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(TColStd_MapOfAsciiString) NCollection_Map<TCollection_AsciiString>;
%template(TColStd_MapOfInteger) NCollection_Map<Standard_Integer>;
%template(TColStd_MapOfReal) NCollection_Map<Standard_Real>;
%template(TColStd_MapOfTransient) NCollection_Map<opencascade::handle<Standard_Transient>>;
%template(TColStd_SequenceOfAddress) NCollection_Sequence<Standard_Address>;

%extend NCollection_Sequence<Standard_Address> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(TColStd_SequenceOfAsciiString) NCollection_Sequence<TCollection_AsciiString>;

%extend NCollection_Sequence<TCollection_AsciiString> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(TColStd_SequenceOfBoolean) NCollection_Sequence<Standard_Boolean>;

%extend NCollection_Sequence<Standard_Boolean> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(TColStd_SequenceOfExtendedString) NCollection_Sequence<TCollection_ExtendedString>;

%extend NCollection_Sequence<TCollection_ExtendedString> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(TColStd_SequenceOfHAsciiString) NCollection_Sequence<opencascade::handle<TCollection_HAsciiString>>;

%extend NCollection_Sequence<opencascade::handle<TCollection_HAsciiString>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(TColStd_SequenceOfHExtendedString) NCollection_Sequence<opencascade::handle<TCollection_HExtendedString>>;

%extend NCollection_Sequence<opencascade::handle<TCollection_HExtendedString>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(TColStd_SequenceOfInteger) NCollection_Sequence<Standard_Integer>;

%extend NCollection_Sequence<Standard_Integer> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(TColStd_SequenceOfReal) NCollection_Sequence<Standard_Real>;

%extend NCollection_Sequence<Standard_Real> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(TColStd_SequenceOfTransient) NCollection_Sequence<opencascade::handle<Standard_Transient>>;

%extend NCollection_Sequence<opencascade::handle<Standard_Transient>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<TCollection_AsciiString> TColStd_Array1OfAsciiString;
typedef NCollection_Array1<Standard_Boolean> TColStd_Array1OfBoolean;
typedef NCollection_Array1<Standard_Byte> TColStd_Array1OfByte;
typedef NCollection_Array1<Standard_Character> TColStd_Array1OfCharacter;
typedef NCollection_Array1<TCollection_ExtendedString> TColStd_Array1OfExtendedString;
typedef NCollection_Array1<Standard_Integer> TColStd_Array1OfInteger;
typedef NCollection_Array1<TColStd_ListOfInteger> TColStd_Array1OfListOfInteger;
typedef NCollection_Array1<Standard_Real> TColStd_Array1OfReal;
typedef NCollection_Array1<opencascade::handle<Standard_Transient>> TColStd_Array1OfTransient;
typedef NCollection_Array2<Standard_Boolean> TColStd_Array2OfBoolean;
typedef NCollection_Array2<Standard_Character> TColStd_Array2OfCharacter;
typedef NCollection_Array2<Standard_Integer> TColStd_Array2OfInteger;
typedef NCollection_Array2<Standard_Real> TColStd_Array2OfReal;
typedef NCollection_Array2<opencascade::handle<Standard_Transient>> TColStd_Array2OfTransient;
typedef NCollection_DataMap<TCollection_AsciiString, Standard_Integer>::Iterator TColStd_DataMapIteratorOfDataMapOfAsciiStringInteger;
typedef NCollection_DataMap<Standard_Integer, Standard_Integer>::Iterator TColStd_DataMapIteratorOfDataMapOfIntegerInteger;
typedef NCollection_DataMap<Standard_Integer, TColStd_ListOfInteger>::Iterator TColStd_DataMapIteratorOfDataMapOfIntegerListOfInteger;
typedef NCollection_DataMap<Standard_Integer, Standard_Real>::Iterator TColStd_DataMapIteratorOfDataMapOfIntegerReal;
typedef NCollection_DataMap<Standard_Integer, opencascade::handle<Standard_Transient>>::Iterator TColStd_DataMapIteratorOfDataMapOfIntegerTransient;
typedef NCollection_DataMap<TCollection_ExtendedString, Standard_Integer>::Iterator TColStd_DataMapIteratorOfDataMapOfStringInteger;
typedef NCollection_DataMap<opencascade::handle<Standard_Transient>, opencascade::handle<Standard_Transient>>::Iterator TColStd_DataMapIteratorOfDataMapOfTransientTransient;
typedef NCollection_DataMap<TCollection_AsciiString, Standard_Integer> TColStd_DataMapOfAsciiStringInteger;
typedef NCollection_DataMap<Standard_Integer, Standard_Integer> TColStd_DataMapOfIntegerInteger;
typedef NCollection_DataMap<Standard_Integer, TColStd_ListOfInteger> TColStd_DataMapOfIntegerListOfInteger;
typedef NCollection_DataMap<Standard_Integer, Standard_Real> TColStd_DataMapOfIntegerReal;
typedef NCollection_DataMap<Standard_Integer, opencascade::handle<Standard_Transient>> TColStd_DataMapOfIntegerTransient;
typedef NCollection_DataMap<TCollection_ExtendedString, Standard_Integer> TColStd_DataMapOfStringInteger;
typedef NCollection_DataMap<opencascade::handle<Standard_Transient>, opencascade::handle<Standard_Transient>> TColStd_DataMapOfTransientTransient;
typedef NCollection_IndexedDataMap<TCollection_AsciiString, TCollection_AsciiString> TColStd_IndexedDataMapOfStringString;
typedef NCollection_IndexedDataMap<opencascade::handle<Standard_Transient>, opencascade::handle<Standard_Transient>> TColStd_IndexedDataMapOfTransientTransient;
typedef NCollection_IndexedMap<Standard_Integer> TColStd_IndexedMapOfInteger;
typedef NCollection_IndexedMap<Standard_Real> TColStd_IndexedMapOfReal;
typedef NCollection_IndexedMap<opencascade::handle<Standard_Transient>> TColStd_IndexedMapOfTransient;
typedef NCollection_List<TCollection_AsciiString>::Iterator TColStd_ListIteratorOfListOfAsciiString;
typedef NCollection_List<Standard_Integer>::Iterator TColStd_ListIteratorOfListOfInteger;
typedef NCollection_List<Standard_Real>::Iterator TColStd_ListIteratorOfListOfReal;
typedef NCollection_List<opencascade::handle<Standard_Transient>>::Iterator TColStd_ListIteratorOfListOfTransient;
typedef NCollection_List<TCollection_AsciiString> TColStd_ListOfAsciiString;
typedef NCollection_List<Standard_Integer> TColStd_ListOfInteger;
typedef NCollection_List<Standard_Real> TColStd_ListOfReal;
typedef NCollection_List<opencascade::handle<Standard_Transient>> TColStd_ListOfTransient;
typedef NCollection_Map<TCollection_AsciiString>::Iterator TColStd_MapIteratorOfMapOfAsciiString;
typedef NCollection_Map<Standard_Integer>::Iterator TColStd_MapIteratorOfMapOfInteger;
typedef NCollection_Map<Standard_Real>::Iterator TColStd_MapIteratorOfMapOfReal;
typedef NCollection_Map<opencascade::handle<Standard_Transient>>::Iterator TColStd_MapIteratorOfMapOfTransient;
typedef TColStd_PackedMapOfInteger::Iterator TColStd_MapIteratorOfPackedMapOfInteger;
typedef NCollection_Map<TCollection_AsciiString> TColStd_MapOfAsciiString;
typedef NCollection_Map<Standard_Integer> TColStd_MapOfInteger;
typedef NCollection_Map<Standard_Real> TColStd_MapOfReal;
typedef NCollection_Map<opencascade::handle<Standard_Transient>> TColStd_MapOfTransient;
typedef NCollection_Sequence<Standard_Address> TColStd_SequenceOfAddress;
typedef NCollection_Sequence<TCollection_AsciiString> TColStd_SequenceOfAsciiString;
typedef NCollection_Sequence<Standard_Boolean> TColStd_SequenceOfBoolean;
typedef NCollection_Sequence<TCollection_ExtendedString> TColStd_SequenceOfExtendedString;
typedef NCollection_Sequence<opencascade::handle<TCollection_HAsciiString>> TColStd_SequenceOfHAsciiString;
typedef NCollection_Sequence<opencascade::handle<TCollection_HExtendedString>> TColStd_SequenceOfHExtendedString;
typedef NCollection_Sequence<Standard_Integer> TColStd_SequenceOfInteger;
typedef NCollection_Sequence<Standard_Real> TColStd_SequenceOfReal;
typedef NCollection_Sequence<opencascade::handle<Standard_Transient>> TColStd_SequenceOfTransient;
/* end typedefs declaration */

/************************************
* class TColStd_HPackedMapOfInteger *
************************************/
class TColStd_HPackedMapOfInteger : public Standard_Transient {
	public:
		/****** TColStd_HPackedMapOfInteger::TColStd_HPackedMapOfInteger ******/
		/****** md5 signature: 7dbfb789a2d13306defa568ad5aebfb5 ******/
		%feature("compactdefaultargs") TColStd_HPackedMapOfInteger;
		%feature("autodoc", "
Parameters
----------
NbBuckets: int (optional, default to 1)

Return
-------
None

Description
-----------
No available documentation.
") TColStd_HPackedMapOfInteger;
		 TColStd_HPackedMapOfInteger(const Standard_Integer NbBuckets = 1);

		/****** TColStd_HPackedMapOfInteger::TColStd_HPackedMapOfInteger ******/
		/****** md5 signature: 89e534bef075b502a40c10c743d38652 ******/
		%feature("compactdefaultargs") TColStd_HPackedMapOfInteger;
		%feature("autodoc", "
Parameters
----------
theOther: TColStd_PackedMapOfInteger

Return
-------
None

Description
-----------
No available documentation.
") TColStd_HPackedMapOfInteger;
		 TColStd_HPackedMapOfInteger(const TColStd_PackedMapOfInteger & theOther);

		/****** TColStd_HPackedMapOfInteger::ChangeMap ******/
		/****** md5 signature: ac7c29d51e6428dd947136d83ae404c5 ******/
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "Return
-------
TColStd_PackedMapOfInteger

Description
-----------
No available documentation.
") ChangeMap;
		TColStd_PackedMapOfInteger & ChangeMap();

		/****** TColStd_HPackedMapOfInteger::Map ******/
		/****** md5 signature: 9730b67796975602112304ea27686558 ******/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "Return
-------
TColStd_PackedMapOfInteger

Description
-----------
No available documentation.
") Map;
		const TColStd_PackedMapOfInteger & Map();

};


%make_alias(TColStd_HPackedMapOfInteger)

%extend TColStd_HPackedMapOfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class TColStd_PackedMapOfInteger *
***********************************/
class TColStd_PackedMapOfInteger {
	public:
		class TColStd_intMapNode {};
		class Iterator {};
		/****** TColStd_PackedMapOfInteger::TColStd_PackedMapOfInteger ******/
		/****** md5 signature: ee60f291faae5f56871e692625f9167d ******/
		%feature("compactdefaultargs") TColStd_PackedMapOfInteger;
		%feature("autodoc", "
Parameters
----------
theNbBuckets: int (optional, default to 1)

Return
-------
None

Description
-----------
Constructor.
") TColStd_PackedMapOfInteger;
		 TColStd_PackedMapOfInteger(const Standard_Integer theNbBuckets = 1);

		/****** TColStd_PackedMapOfInteger::TColStd_PackedMapOfInteger ******/
		/****** md5 signature: 2cdd258a707cd6ed3411a3db79e6a60a ******/
		%feature("compactdefaultargs") TColStd_PackedMapOfInteger;
		%feature("autodoc", "
Parameters
----------
theOther: TColStd_PackedMapOfInteger

Return
-------
None

Description
-----------
Copy constructor.
") TColStd_PackedMapOfInteger;
		 TColStd_PackedMapOfInteger(const TColStd_PackedMapOfInteger & theOther);

		/****** TColStd_PackedMapOfInteger::Add ******/
		/****** md5 signature: fefd53232cb6b225fee21a01797a4953 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
aKey: int

Return
-------
bool

Description
-----------
No available documentation.
") Add;
		Standard_Boolean Add(const Standard_Integer aKey);

		/****** TColStd_PackedMapOfInteger::Assign ******/
		/****** md5 signature: b123b23cfd6a21df1cc646056934f119 ******/
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "
Parameters
----------
&: TColStd_PackedMapOfInteger

Return
-------
TColStd_PackedMapOfInteger

Description
-----------
No available documentation.
") Assign;
		TColStd_PackedMapOfInteger & Assign(const TColStd_PackedMapOfInteger &);

		/****** TColStd_PackedMapOfInteger::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Clear;
		void Clear();

		/****** TColStd_PackedMapOfInteger::Contains ******/
		/****** md5 signature: 8de2585592fed12a6d282488cd796177 ******/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "
Parameters
----------
aKey: int

Return
-------
bool

Description
-----------
No available documentation.
") Contains;
		Standard_Boolean Contains(const Standard_Integer aKey);

		/****** TColStd_PackedMapOfInteger::Differ ******/
		/****** md5 signature: a33b35e060f7a592a4272060e7dca3b9 ******/
		%feature("compactdefaultargs") Differ;
		%feature("autodoc", "
Parameters
----------
&: TColStd_PackedMapOfInteger

Return
-------
bool

Description
-----------
/** * Apply to this Map the symmetric difference (aka exclusive disjunction, boolean XOR) operation * with another (given) Map. The result contains the values that are contained only in this or the * operand map, but not in both. This algorithm is similar to method Difference(). * 
Return: True if contents of this map is changed */.
") Differ;
		Standard_Boolean Differ(const TColStd_PackedMapOfInteger &);

		/****** TColStd_PackedMapOfInteger::Difference ******/
		/****** md5 signature: 8fbd60922dcd49c1c7cf9132a621a893 ******/
		%feature("compactdefaultargs") Difference;
		%feature("autodoc", "
Parameters
----------
&: TColStd_PackedMapOfInteger
&: TColStd_PackedMapOfInteger

Return
-------
None

Description
-----------
/** * Sets this Map to be the result of symmetric difference (aka exclusive disjunction, boolean XOR) * operation between two given Maps. The new Map contains the values that are contained only in * the first or the second operand maps but not in both. All previous contents of this Map is * cleared. This map (result of the boolean operation) can also be used as one of operands. */.
") Difference;
		void Difference(const TColStd_PackedMapOfInteger &, const TColStd_PackedMapOfInteger &);

		/****** TColStd_PackedMapOfInteger::Extent ******/
		/****** md5 signature: 19453f219e568f9c5109a0fd06459e95 ******/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns map extent.
") Extent;
		Standard_Integer Extent();

		/****** TColStd_PackedMapOfInteger::GetMaximalMapped ******/
		/****** md5 signature: 004e3c72ef4f9650f1f96fed23a5912b ******/
		%feature("compactdefaultargs") GetMaximalMapped;
		%feature("autodoc", "Return
-------
int

Description
-----------
/** * Query the maximal contained key value. */.
") GetMaximalMapped;
		Standard_Integer GetMaximalMapped();

		/****** TColStd_PackedMapOfInteger::GetMinimalMapped ******/
		/****** md5 signature: d7c068ee4ed7ed98b9da7452d3e6c9df ******/
		%feature("compactdefaultargs") GetMinimalMapped;
		%feature("autodoc", "Return
-------
int

Description
-----------
/** * Query the minimal contained key value. */.
") GetMinimalMapped;
		Standard_Integer GetMinimalMapped();

		/****** TColStd_PackedMapOfInteger::HasIntersection ******/
		/****** md5 signature: 64fc09010ab8b8e130b1e83e91bb6c58 ******/
		%feature("compactdefaultargs") HasIntersection;
		%feature("autodoc", "
Parameters
----------
&: TColStd_PackedMapOfInteger

Return
-------
bool

Description
-----------
/** * Returns True if this map has common items with the given one. */.
") HasIntersection;
		Standard_Boolean HasIntersection(const TColStd_PackedMapOfInteger &);

		/****** TColStd_PackedMapOfInteger::Intersect ******/
		/****** md5 signature: 8b232eb91c98828fe7f2311ddbd9531f ******/
		%feature("compactdefaultargs") Intersect;
		%feature("autodoc", "
Parameters
----------
&: TColStd_PackedMapOfInteger

Return
-------
bool

Description
-----------
/** * Apply to this Map the intersection operation (aka multiplication, common, boolean AND) with * another (given) Map. The result contains only the values that are contained in both this and * the given maps. This algorithm is similar to method Intersection(). * 
Return: True if content of this map is changed */.
") Intersect;
		Standard_Boolean Intersect(const TColStd_PackedMapOfInteger &);

		/****** TColStd_PackedMapOfInteger::Intersection ******/
		/****** md5 signature: 2de63b754fe10319368ec017c5241e47 ******/
		%feature("compactdefaultargs") Intersection;
		%feature("autodoc", "
Parameters
----------
&: TColStd_PackedMapOfInteger
&: TColStd_PackedMapOfInteger

Return
-------
None

Description
-----------
/** * Sets this Map to be the result of intersection (aka multiplication, common, boolean AND) * operation between two given Maps. The new Map contains only the values that are contained in * both map operands. All previous contents of this Map is cleared. This same map (result of the * boolean operation) can also be used as one of operands. The order of operands makes no * difference; the method minimizes internally the number of iterations using the smallest map for * the loop. */.
") Intersection;
		void Intersection(const TColStd_PackedMapOfInteger &, const TColStd_PackedMapOfInteger &);

		/****** TColStd_PackedMapOfInteger::IsEmpty ******/
		/****** md5 signature: d529c07ce9e12eea3222188c82b0e80b ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if map is empty.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****** TColStd_PackedMapOfInteger::IsEqual ******/
		/****** md5 signature: f7a42088df0b62e4976b7a22e42a3394 ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
&: TColStd_PackedMapOfInteger

Return
-------
bool

Description
-----------
/** * Returns True if this map is equal to the given one, i.e. they contain the * same sets of elements */.
") IsEqual;
		Standard_Boolean IsEqual(const TColStd_PackedMapOfInteger &);

		/****** TColStd_PackedMapOfInteger::IsSubset ******/
		/****** md5 signature: 6c5891cc01883b0709bbc235795cf9f7 ******/
		%feature("compactdefaultargs") IsSubset;
		%feature("autodoc", "
Parameters
----------
&: TColStd_PackedMapOfInteger

Return
-------
bool

Description
-----------
/** * Returns True if this map is subset of the given one, i.e. all elements * contained in this map is contained also in the operand map. * if this map is empty that this method returns true for any operand map. */.
") IsSubset;
		Standard_Boolean IsSubset(const TColStd_PackedMapOfInteger &);

		/****** TColStd_PackedMapOfInteger::NbBuckets ******/
		/****** md5 signature: cc8d74943ffa9a9dd7cf4eff0c6c9739 ******/
		%feature("compactdefaultargs") NbBuckets;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of map buckets (not that since integers are packed in this map, the number is smaller than extent).
") NbBuckets;
		Standard_Integer NbBuckets();

		/****** TColStd_PackedMapOfInteger::ReSize ******/
		/****** md5 signature: 83b3b18bad9fa1d11d0b4c070b80b62a ******/
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "
Parameters
----------
NbBuckets: int

Return
-------
None

Description
-----------
No available documentation.
") ReSize;
		void ReSize(const Standard_Integer NbBuckets);

		/****** TColStd_PackedMapOfInteger::Remove ******/
		/****** md5 signature: 92cf6145ca798b68010b8a9250e5f468 ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
aKey: int

Return
-------
bool

Description
-----------
No available documentation.
") Remove;
		Standard_Boolean Remove(const Standard_Integer aKey);

		/****** TColStd_PackedMapOfInteger::Statistics ******/
		/****** md5 signature: 1a1dab8d9fff60f7ef456c28f93e75d1 ******/
		%feature("compactdefaultargs") Statistics;
		%feature("autodoc", "
Parameters
----------

Return
-------
theStream: Standard_OStream

Description
-----------
Prints useful statistics about the map. It can be used to test the quality of the hashcoding.
") Statistics;
		void Statistics(std::ostream &OutValue);

		/****** TColStd_PackedMapOfInteger::Subtract ******/
		/****** md5 signature: 190f8077cde18ce8900964ed206c3e98 ******/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "
Parameters
----------
&: TColStd_PackedMapOfInteger

Return
-------
bool

Description
-----------
/** * Apply to this Map the subtraction (aka set-theoretic difference, relative complement, exclude, * cut, boolean NOT) operation with another (given) Map. The result contains only the values that * were previously contained in this map and not contained in this map. This algorithm is similar * to method Subtract() with two operands. * 
Return: True if contents of this map is changed */.
") Subtract;
		Standard_Boolean Subtract(const TColStd_PackedMapOfInteger &);

		/****** TColStd_PackedMapOfInteger::Subtraction ******/
		/****** md5 signature: d8b4eb899ecf48824b5e31cb4403d16c ******/
		%feature("compactdefaultargs") Subtraction;
		%feature("autodoc", "
Parameters
----------
&: TColStd_PackedMapOfInteger
&: TColStd_PackedMapOfInteger

Return
-------
None

Description
-----------
/** * Sets this Map to be the result of subtraction * (aka set-theoretic difference, relative complement, exclude, cut, boolean NOT) operation * between two given Maps. The new Map contains only the values that are contained in the first * map operands and not contained in the second one. All previous contents of this Map is cleared. * This map (result of the boolean operation) can also be used as the first operand. */.
") Subtraction;
		void Subtraction(const TColStd_PackedMapOfInteger &, const TColStd_PackedMapOfInteger &);

		/****** TColStd_PackedMapOfInteger::Union ******/
		/****** md5 signature: 63b0f7f4fb443df4653a7795cd699dd0 ******/
		%feature("compactdefaultargs") Union;
		%feature("autodoc", "
Parameters
----------
&: TColStd_PackedMapOfInteger
&: TColStd_PackedMapOfInteger

Return
-------
None

Description
-----------
/** * Sets this Map to be the result of union (aka addition, fuse, merge, boolean OR) operation * between two given Maps. The new Map contains the values that are contained either in the first * map or in the second map or in both. All previous contents of this Map is cleared. This map * (result of the boolean operation) can also be passed as one of operands. */.
") Union;
		void Union(const TColStd_PackedMapOfInteger &, const TColStd_PackedMapOfInteger &);

		/****** TColStd_PackedMapOfInteger::Unite ******/
		/****** md5 signature: e8a74d3f43058c4eae7ea1e860c6585c ******/
		%feature("compactdefaultargs") Unite;
		%feature("autodoc", "
Parameters
----------
&: TColStd_PackedMapOfInteger

Return
-------
bool

Description
-----------
/** * Apply to this Map the boolean operation union (aka addition, fuse, merge, boolean OR) with * another (given) Map. The result contains the values that were previously contained in this map * or contained in the given (operand) map. This algorithm is similar to method Union(). * 
Return: True if content of this map is changed */.
") Unite;
		Standard_Boolean Unite(const TColStd_PackedMapOfInteger &);


%extend{
    void __isub_wrapper__(const TColStd_PackedMapOfInteger other) {
    *self -= other;
    }
}
%pythoncode {
def __isub__(self, right):
    self.__isub_wrapper__(right)
    return self
}

%extend{
    bool __eq_wrapper__(const TColStd_PackedMapOfInteger other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}
};


%extend TColStd_PackedMapOfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */

class TColStd_HArray1OfAsciiString : public TColStd_Array1OfAsciiString, public Standard_Transient {
  public:
    TColStd_HArray1OfAsciiString(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColStd_HArray1OfAsciiString(const Standard_Integer theLower, const Standard_Integer theUpper, const TColStd_Array1OfAsciiString::value_type& theValue);
    TColStd_HArray1OfAsciiString(const TColStd_Array1OfAsciiString& theOther);
    const TColStd_Array1OfAsciiString& Array1();
    TColStd_Array1OfAsciiString& ChangeArray1();
};
%make_alias(TColStd_HArray1OfAsciiString)


class TColStd_HArray1OfBoolean : public TColStd_Array1OfBoolean, public Standard_Transient {
  public:
    TColStd_HArray1OfBoolean(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColStd_HArray1OfBoolean(const Standard_Integer theLower, const Standard_Integer theUpper, const TColStd_Array1OfBoolean::value_type& theValue);
    TColStd_HArray1OfBoolean(const TColStd_Array1OfBoolean& theOther);
    const TColStd_Array1OfBoolean& Array1();
    TColStd_Array1OfBoolean& ChangeArray1();
};
%make_alias(TColStd_HArray1OfBoolean)


class TColStd_HArray1OfByte : public TColStd_Array1OfByte, public Standard_Transient {
  public:
    TColStd_HArray1OfByte(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColStd_HArray1OfByte(const Standard_Integer theLower, const Standard_Integer theUpper, const TColStd_Array1OfByte::value_type& theValue);
    TColStd_HArray1OfByte(const TColStd_Array1OfByte& theOther);
    const TColStd_Array1OfByte& Array1();
    TColStd_Array1OfByte& ChangeArray1();
};
%make_alias(TColStd_HArray1OfByte)


class TColStd_HArray1OfCharacter : public TColStd_Array1OfCharacter, public Standard_Transient {
  public:
    TColStd_HArray1OfCharacter(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColStd_HArray1OfCharacter(const Standard_Integer theLower, const Standard_Integer theUpper, const TColStd_Array1OfCharacter::value_type& theValue);
    TColStd_HArray1OfCharacter(const TColStd_Array1OfCharacter& theOther);
    const TColStd_Array1OfCharacter& Array1();
    TColStd_Array1OfCharacter& ChangeArray1();
};
%make_alias(TColStd_HArray1OfCharacter)


class TColStd_HArray1OfExtendedString : public TColStd_Array1OfExtendedString, public Standard_Transient {
  public:
    TColStd_HArray1OfExtendedString(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColStd_HArray1OfExtendedString(const Standard_Integer theLower, const Standard_Integer theUpper, const TColStd_Array1OfExtendedString::value_type& theValue);
    TColStd_HArray1OfExtendedString(const TColStd_Array1OfExtendedString& theOther);
    const TColStd_Array1OfExtendedString& Array1();
    TColStd_Array1OfExtendedString& ChangeArray1();
};
%make_alias(TColStd_HArray1OfExtendedString)


class TColStd_HArray1OfInteger : public TColStd_Array1OfInteger, public Standard_Transient {
  public:
    TColStd_HArray1OfInteger(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColStd_HArray1OfInteger(const Standard_Integer theLower, const Standard_Integer theUpper, const TColStd_Array1OfInteger::value_type& theValue);
    TColStd_HArray1OfInteger(const TColStd_Array1OfInteger& theOther);
    const TColStd_Array1OfInteger& Array1();
    TColStd_Array1OfInteger& ChangeArray1();
};
%make_alias(TColStd_HArray1OfInteger)


class TColStd_HArray1OfListOfInteger : public TColStd_Array1OfListOfInteger, public Standard_Transient {
  public:
    TColStd_HArray1OfListOfInteger(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColStd_HArray1OfListOfInteger(const Standard_Integer theLower, const Standard_Integer theUpper, const TColStd_Array1OfListOfInteger::value_type& theValue);
    TColStd_HArray1OfListOfInteger(const TColStd_Array1OfListOfInteger& theOther);
    const TColStd_Array1OfListOfInteger& Array1();
    TColStd_Array1OfListOfInteger& ChangeArray1();
};
%make_alias(TColStd_HArray1OfListOfInteger)


class TColStd_HArray1OfReal : public TColStd_Array1OfReal, public Standard_Transient {
  public:
    TColStd_HArray1OfReal(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColStd_HArray1OfReal(const Standard_Integer theLower, const Standard_Integer theUpper, const TColStd_Array1OfReal::value_type& theValue);
    TColStd_HArray1OfReal(const TColStd_Array1OfReal& theOther);
    const TColStd_Array1OfReal& Array1();
    TColStd_Array1OfReal& ChangeArray1();
};
%make_alias(TColStd_HArray1OfReal)


class TColStd_HArray1OfTransient : public TColStd_Array1OfTransient, public Standard_Transient {
  public:
    TColStd_HArray1OfTransient(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColStd_HArray1OfTransient(const Standard_Integer theLower, const Standard_Integer theUpper, const TColStd_Array1OfTransient::value_type& theValue);
    TColStd_HArray1OfTransient(const TColStd_Array1OfTransient& theOther);
    const TColStd_Array1OfTransient& Array1();
    TColStd_Array1OfTransient& ChangeArray1();
};
%make_alias(TColStd_HArray1OfTransient)

/* harray2 classes */
class TColStd_HArray2OfBoolean : public TColStd_Array2OfBoolean, public Standard_Transient {
  public:
    TColStd_HArray2OfBoolean(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    TColStd_HArray2OfBoolean(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const TColStd_Array2OfBoolean::value_type& theValue);
    TColStd_HArray2OfBoolean(const TColStd_Array2OfBoolean& theOther);
    const TColStd_Array2OfBoolean& Array2 ();
    TColStd_Array2OfBoolean& ChangeArray2 (); 
};
%make_alias(TColStd_HArray2OfBoolean)


class TColStd_HArray2OfCharacter : public TColStd_Array2OfCharacter, public Standard_Transient {
  public:
    TColStd_HArray2OfCharacter(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    TColStd_HArray2OfCharacter(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const TColStd_Array2OfCharacter::value_type& theValue);
    TColStd_HArray2OfCharacter(const TColStd_Array2OfCharacter& theOther);
    const TColStd_Array2OfCharacter& Array2 ();
    TColStd_Array2OfCharacter& ChangeArray2 (); 
};
%make_alias(TColStd_HArray2OfCharacter)


class TColStd_HArray2OfInteger : public TColStd_Array2OfInteger, public Standard_Transient {
  public:
    TColStd_HArray2OfInteger(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    TColStd_HArray2OfInteger(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const TColStd_Array2OfInteger::value_type& theValue);
    TColStd_HArray2OfInteger(const TColStd_Array2OfInteger& theOther);
    const TColStd_Array2OfInteger& Array2 ();
    TColStd_Array2OfInteger& ChangeArray2 (); 
};
%make_alias(TColStd_HArray2OfInteger)


class TColStd_HArray2OfReal : public TColStd_Array2OfReal, public Standard_Transient {
  public:
    TColStd_HArray2OfReal(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    TColStd_HArray2OfReal(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const TColStd_Array2OfReal::value_type& theValue);
    TColStd_HArray2OfReal(const TColStd_Array2OfReal& theOther);
    const TColStd_Array2OfReal& Array2 ();
    TColStd_Array2OfReal& ChangeArray2 (); 
};
%make_alias(TColStd_HArray2OfReal)


class TColStd_HArray2OfTransient : public TColStd_Array2OfTransient, public Standard_Transient {
  public:
    TColStd_HArray2OfTransient(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    TColStd_HArray2OfTransient(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const TColStd_Array2OfTransient::value_type& theValue);
    TColStd_HArray2OfTransient(const TColStd_Array2OfTransient& theOther);
    const TColStd_Array2OfTransient& Array2 ();
    TColStd_Array2OfTransient& ChangeArray2 (); 
};
%make_alias(TColStd_HArray2OfTransient)


/* hsequence classes */
class TColStd_HSequenceOfAsciiString : public TColStd_SequenceOfAsciiString, public Standard_Transient {
  public:
    TColStd_HSequenceOfAsciiString();
    TColStd_HSequenceOfAsciiString(const TColStd_SequenceOfAsciiString& theOther);
    const TColStd_SequenceOfAsciiString& Sequence();
    void Append (const TColStd_SequenceOfAsciiString::value_type& theItem);
    void Append (TColStd_SequenceOfAsciiString& theSequence);
    TColStd_SequenceOfAsciiString& ChangeSequence();
};
%make_alias(TColStd_HSequenceOfAsciiString)


class TColStd_HSequenceOfExtendedString : public TColStd_SequenceOfExtendedString, public Standard_Transient {
  public:
    TColStd_HSequenceOfExtendedString();
    TColStd_HSequenceOfExtendedString(const TColStd_SequenceOfExtendedString& theOther);
    const TColStd_SequenceOfExtendedString& Sequence();
    void Append (const TColStd_SequenceOfExtendedString::value_type& theItem);
    void Append (TColStd_SequenceOfExtendedString& theSequence);
    TColStd_SequenceOfExtendedString& ChangeSequence();
};
%make_alias(TColStd_HSequenceOfExtendedString)


class TColStd_HSequenceOfHAsciiString : public TColStd_SequenceOfHAsciiString, public Standard_Transient {
  public:
    TColStd_HSequenceOfHAsciiString();
    TColStd_HSequenceOfHAsciiString(const TColStd_SequenceOfHAsciiString& theOther);
    const TColStd_SequenceOfHAsciiString& Sequence();
    void Append (const TColStd_SequenceOfHAsciiString::value_type& theItem);
    void Append (TColStd_SequenceOfHAsciiString& theSequence);
    TColStd_SequenceOfHAsciiString& ChangeSequence();
};
%make_alias(TColStd_HSequenceOfHAsciiString)


class TColStd_HSequenceOfHExtendedString : public TColStd_SequenceOfHExtendedString, public Standard_Transient {
  public:
    TColStd_HSequenceOfHExtendedString();
    TColStd_HSequenceOfHExtendedString(const TColStd_SequenceOfHExtendedString& theOther);
    const TColStd_SequenceOfHExtendedString& Sequence();
    void Append (const TColStd_SequenceOfHExtendedString::value_type& theItem);
    void Append (TColStd_SequenceOfHExtendedString& theSequence);
    TColStd_SequenceOfHExtendedString& ChangeSequence();
};
%make_alias(TColStd_HSequenceOfHExtendedString)


class TColStd_HSequenceOfInteger : public TColStd_SequenceOfInteger, public Standard_Transient {
  public:
    TColStd_HSequenceOfInteger();
    TColStd_HSequenceOfInteger(const TColStd_SequenceOfInteger& theOther);
    const TColStd_SequenceOfInteger& Sequence();
    void Append (const TColStd_SequenceOfInteger::value_type& theItem);
    void Append (TColStd_SequenceOfInteger& theSequence);
    TColStd_SequenceOfInteger& ChangeSequence();
};
%make_alias(TColStd_HSequenceOfInteger)


class TColStd_HSequenceOfReal : public TColStd_SequenceOfReal, public Standard_Transient {
  public:
    TColStd_HSequenceOfReal();
    TColStd_HSequenceOfReal(const TColStd_SequenceOfReal& theOther);
    const TColStd_SequenceOfReal& Sequence();
    void Append (const TColStd_SequenceOfReal::value_type& theItem);
    void Append (TColStd_SequenceOfReal& theSequence);
    TColStd_SequenceOfReal& ChangeSequence();
};
%make_alias(TColStd_HSequenceOfReal)


class TColStd_HSequenceOfTransient : public TColStd_SequenceOfTransient, public Standard_Transient {
  public:
    TColStd_HSequenceOfTransient();
    TColStd_HSequenceOfTransient(const TColStd_SequenceOfTransient& theOther);
    const TColStd_SequenceOfTransient& Sequence();
    void Append (const TColStd_SequenceOfTransient::value_type& theItem);
    void Append (TColStd_SequenceOfTransient& theSequence);
    TColStd_SequenceOfTransient& ChangeSequence();
};
%make_alias(TColStd_HSequenceOfTransient)


/* class aliases */
%pythoncode {
}
