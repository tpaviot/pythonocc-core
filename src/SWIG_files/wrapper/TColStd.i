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
%define TCOLSTDDOCSTRING
"TColStd module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_tcolstd.html"
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
%wrap_handle(TColStd_HArray1OfCharacter)
%wrap_handle(TColStd_HArray1OfReal)
%wrap_handle(TColStd_HArray1OfByte)
%wrap_handle(TColStd_HArray1OfBoolean)
%wrap_handle(TColStd_HArray1OfInteger)
%wrap_handle(TColStd_HArray1OfAsciiString)
%wrap_handle(TColStd_HArray1OfTransient)
%wrap_handle(TColStd_HArray1OfListOfInteger)
%wrap_handle(TColStd_HArray1OfExtendedString)
%wrap_handle(TColStd_HArray2OfReal)
%wrap_handle(TColStd_HArray2OfInteger)
%wrap_handle(TColStd_HArray2OfTransient)
%wrap_handle(TColStd_HArray2OfBoolean)
%wrap_handle(TColStd_HArray2OfCharacter)
%wrap_handle(TColStd_HSequenceOfReal)
%wrap_handle(TColStd_HSequenceOfTransient)
%wrap_handle(TColStd_HSequenceOfInteger)
%wrap_handle(TColStd_HSequenceOfExtendedString)
%wrap_handle(TColStd_HSequenceOfHAsciiString)
%wrap_handle(TColStd_HSequenceOfHExtendedString)
%wrap_handle(TColStd_HSequenceOfAsciiString)
/* end handles declaration */

/* templates */
%template(TColStd_Array1OfAsciiString) NCollection_Array1<TCollection_AsciiString>;
Array1ExtendIter(TCollection_AsciiString)

%template(TColStd_Array1OfBoolean) NCollection_Array1<bool>;
Array1ExtendIter(bool)

%template(TColStd_Array1OfByte) NCollection_Array1<uint8_t>;
Array1ExtendIter(uint8_t)

%template(TColStd_Array1OfCharacter) NCollection_Array1<char>;
Array1ExtendIter(char)

%template(TColStd_Array1OfExtendedString) NCollection_Array1<TCollection_ExtendedString>;
Array1ExtendIter(TCollection_ExtendedString)

%apply (long long* IN_ARRAY1, int DIM1) { (long long* numpyArray1, int nRows1) };
%apply (long long* ARGOUT_ARRAY1, int DIM1) { (long long* numpyArray1Argout, int nRows1Argout) };
Array1NumpyTemplate(TColStd_Array1OfInteger, long long, int)
%apply (double* IN_ARRAY1, int DIM1) { (double* numpyArray1, int nRows1) };
%apply (double* ARGOUT_ARRAY1, int DIM1) { (double* numpyArray1Argout, int nRows1Argout) };
Array1NumpyTemplate(TColStd_Array1OfReal, double, double)
%template(TColStd_Array1OfTransient) NCollection_Array1<opencascade::handle<Standard_Transient>>;
Array1ExtendIter(opencascade::handle<Standard_Transient>)

%template(TColStd_Array2OfBoolean) NCollection_Array2<bool>;
%template(TColStd_Array2OfCharacter) NCollection_Array2<char>;
%apply (long long* IN_ARRAY2, int DIM1, int DIM2) { (long long* numpyArray2, int nRows2, int nCols2) };
%apply (long long* ARGOUT_ARRAY1, int DIM1) { (long long* numpyArray2Argout, int aSizeArgout) };
Array2NumpyTemplate(TColStd_Array2OfInteger, long long, int)
%apply (double* IN_ARRAY2, int DIM1, int DIM2) { (double* numpyArray2, int nRows2, int nCols2) };
%apply (double* ARGOUT_ARRAY1, int DIM1) { (double* numpyArray2Argout, int aSizeArgout) };
Array2NumpyTemplate(TColStd_Array2OfReal, double, double)
%template(TColStd_Array2OfTransient) NCollection_Array2<opencascade::handle<Standard_Transient>>;
%ignore NCollection_DataMap<TCollection_AsciiString,int>::Items;
%ignore NCollection_DataMap<TCollection_AsciiString,int>::KeyValues;
%template(TColStd_DataMapOfAsciiStringInteger) NCollection_DataMap<TCollection_AsciiString,int>;
%ignore NCollection_DataMap<int,int>::Items;
%ignore NCollection_DataMap<int,int>::KeyValues;
%template(TColStd_DataMapOfIntegerInteger) NCollection_DataMap<int,int>;

%extend NCollection_DataMap<int,int> {
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
%ignore NCollection_DataMap<int,TColStd_ListOfInteger>::Items;
%ignore NCollection_DataMap<int,TColStd_ListOfInteger>::KeyValues;
%template(TColStd_DataMapOfIntegerListOfInteger) NCollection_DataMap<int,TColStd_ListOfInteger>;

%extend NCollection_DataMap<int,TColStd_ListOfInteger> {
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
%ignore NCollection_DataMap<int,double>::Items;
%ignore NCollection_DataMap<int,double>::KeyValues;
%template(TColStd_DataMapOfIntegerReal) NCollection_DataMap<int,double>;

%extend NCollection_DataMap<int,double> {
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
%ignore NCollection_DataMap<int,opencascade::handle<Standard_Transient>>::Items;
%ignore NCollection_DataMap<int,opencascade::handle<Standard_Transient>>::KeyValues;
%template(TColStd_DataMapOfIntegerTransient) NCollection_DataMap<int,opencascade::handle<Standard_Transient>>;

%extend NCollection_DataMap<int,opencascade::handle<Standard_Transient>> {
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
%ignore NCollection_DataMap<TCollection_ExtendedString,int>::Items;
%ignore NCollection_DataMap<TCollection_ExtendedString,int>::KeyValues;
%template(TColStd_DataMapOfStringInteger) NCollection_DataMap<TCollection_ExtendedString,int>;
%ignore NCollection_DataMap<opencascade::handle<Standard_Transient>,opencascade::handle<Standard_Transient>>::Items;
%ignore NCollection_DataMap<opencascade::handle<Standard_Transient>,opencascade::handle<Standard_Transient>>::KeyValues;
%template(TColStd_DataMapOfTransientTransient) NCollection_DataMap<opencascade::handle<Standard_Transient>,opencascade::handle<Standard_Transient>>;
%ignore NCollection_IndexedDataMap<TCollection_AsciiString,TCollection_AsciiString>::Items;
%ignore NCollection_IndexedDataMap<TCollection_AsciiString,TCollection_AsciiString>::KeyValues;
%ignore NCollection_IndexedDataMap<TCollection_AsciiString,TCollection_AsciiString>::IndexedItems;
%ignore NCollection_IndexedDataMap<TCollection_AsciiString,TCollection_AsciiString>::Contained;
%template(TColStd_IndexedDataMapOfStringString) NCollection_IndexedDataMap<TCollection_AsciiString,TCollection_AsciiString>;
%ignore NCollection_IndexedDataMap<opencascade::handle<Standard_Transient>,opencascade::handle<Standard_Transient>>::Items;
%ignore NCollection_IndexedDataMap<opencascade::handle<Standard_Transient>,opencascade::handle<Standard_Transient>>::KeyValues;
%ignore NCollection_IndexedDataMap<opencascade::handle<Standard_Transient>,opencascade::handle<Standard_Transient>>::IndexedItems;
%ignore NCollection_IndexedDataMap<opencascade::handle<Standard_Transient>,opencascade::handle<Standard_Transient>>::Contained;
%template(TColStd_IndexedDataMapOfTransientTransient) NCollection_IndexedDataMap<opencascade::handle<Standard_Transient>,opencascade::handle<Standard_Transient>>;
%ignore NCollection_IndexedMap<int>::Items;
%ignore NCollection_IndexedMap<int>::KeyValues;
%ignore NCollection_IndexedMap<int>::IndexedItems;
%ignore NCollection_IndexedMap<int>::Contained;
%template(TColStd_IndexedMapOfInteger) NCollection_IndexedMap<int>;
%ignore NCollection_IndexedMap<double>::Items;
%ignore NCollection_IndexedMap<double>::KeyValues;
%ignore NCollection_IndexedMap<double>::IndexedItems;
%ignore NCollection_IndexedMap<double>::Contained;
%template(TColStd_IndexedMapOfReal) NCollection_IndexedMap<double>;
%ignore NCollection_IndexedMap<opencascade::handle<Standard_Transient>>::Items;
%ignore NCollection_IndexedMap<opencascade::handle<Standard_Transient>>::KeyValues;
%ignore NCollection_IndexedMap<opencascade::handle<Standard_Transient>>::IndexedItems;
%ignore NCollection_IndexedMap<opencascade::handle<Standard_Transient>>::Contained;
%template(TColStd_IndexedMapOfTransient) NCollection_IndexedMap<opencascade::handle<Standard_Transient>>;
%template(TColStd_ListIteratorOfListOfAsciiString) NCollection_TListIterator<TCollection_AsciiString>;
%template(TColStd_ListIteratorOfListOfInteger) NCollection_TListIterator<int>;
%template(TColStd_ListIteratorOfListOfReal) NCollection_TListIterator<double>;
%template(TColStd_ListIteratorOfListOfTransient) NCollection_TListIterator<opencascade::handle<Standard_Transient>>;
%template(TColStd_ListOfAsciiString) NCollection_List<TCollection_AsciiString>;

%extend NCollection_List<TCollection_AsciiString> {
    // occt-800: re-export Size/Length/IsEmpty per instantiation; the
    // NCollection_BaseList header is wrapped but its inherited methods
    // don't propagate cleanly to the typedef-aliased Python class.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()

    def __iter__(self):
        it = TColStd_ListIteratorOfListOfAsciiString(self)
        while it.More():
            yield it.Value()
            it.Next()
    }
};
%template(TColStd_ListOfInteger) NCollection_List<int>;

%extend NCollection_List<int> {
    // occt-800: re-export Size/Length/IsEmpty per instantiation; the
    // NCollection_BaseList header is wrapped but its inherited methods
    // don't propagate cleanly to the typedef-aliased Python class.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()

    def __iter__(self):
        it = TColStd_ListIteratorOfListOfInteger(self)
        while it.More():
            yield it.Value()
            it.Next()
    }
};
%template(TColStd_ListOfReal) NCollection_List<double>;

%extend NCollection_List<double> {
    // occt-800: re-export Size/Length/IsEmpty per instantiation; the
    // NCollection_BaseList header is wrapped but its inherited methods
    // don't propagate cleanly to the typedef-aliased Python class.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()

    def __iter__(self):
        it = TColStd_ListIteratorOfListOfReal(self)
        while it.More():
            yield it.Value()
            it.Next()
    }
};
%template(TColStd_ListOfTransient) NCollection_List<opencascade::handle<Standard_Transient>>;

%extend NCollection_List<opencascade::handle<Standard_Transient>> {
    // occt-800: re-export Size/Length/IsEmpty per instantiation; the
    // NCollection_BaseList header is wrapped but its inherited methods
    // don't propagate cleanly to the typedef-aliased Python class.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()

    def __iter__(self):
        it = TColStd_ListIteratorOfListOfTransient(self)
        while it.More():
            yield it.Value()
            it.Next()
    }
};
%template(TColStd_MapOfAsciiString) NCollection_Map<TCollection_AsciiString>;
%template(TColStd_MapOfInteger) NCollection_Map<int>;
%template(TColStd_MapOfReal) NCollection_Map<double>;
%template(TColStd_MapOfTransient) NCollection_Map<opencascade::handle<Standard_Transient>>;
%template(TColStd_PackedMapOfInteger) NCollection_PackedMap<int>;
%template(TColStd_SequenceOfAddress) NCollection_Sequence<void*>;

%extend NCollection_Sequence<void*> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(TColStd_SequenceOfAsciiString) NCollection_Sequence<TCollection_AsciiString>;

%extend NCollection_Sequence<TCollection_AsciiString> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(TColStd_SequenceOfBoolean) NCollection_Sequence<bool>;

%extend NCollection_Sequence<bool> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(TColStd_SequenceOfExtendedString) NCollection_Sequence<TCollection_ExtendedString>;

%extend NCollection_Sequence<TCollection_ExtendedString> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(TColStd_SequenceOfHAsciiString) NCollection_Sequence<opencascade::handle<TCollection_HAsciiString>>;

%extend NCollection_Sequence<opencascade::handle<TCollection_HAsciiString>> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(TColStd_SequenceOfHExtendedString) NCollection_Sequence<opencascade::handle<TCollection_HExtendedString>>;

%extend NCollection_Sequence<opencascade::handle<TCollection_HExtendedString>> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(TColStd_SequenceOfInteger) NCollection_Sequence<int>;

%extend NCollection_Sequence<int> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(TColStd_SequenceOfReal) NCollection_Sequence<double>;

%extend NCollection_Sequence<double> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(TColStd_SequenceOfTransient) NCollection_Sequence<opencascade::handle<Standard_Transient>>;

%extend NCollection_Sequence<opencascade::handle<Standard_Transient>> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<TCollection_AsciiString> TColStd_Array1OfAsciiString;
typedef NCollection_Array1<bool> TColStd_Array1OfBoolean;
typedef NCollection_Array1<uint8_t> TColStd_Array1OfByte;
typedef NCollection_Array1<char> TColStd_Array1OfCharacter;
typedef NCollection_Array1<TCollection_ExtendedString> TColStd_Array1OfExtendedString;
typedef NCollection_Array1<int> TColStd_Array1OfInteger;
typedef NCollection_Array1<TColStd_ListOfInteger> TColStd_Array1OfListOfInteger;
typedef NCollection_Array1<double> TColStd_Array1OfReal;
typedef NCollection_Array1<opencascade::handle<Standard_Transient>> TColStd_Array1OfTransient;
typedef NCollection_Array2<bool> TColStd_Array2OfBoolean;
typedef NCollection_Array2<char> TColStd_Array2OfCharacter;
typedef NCollection_Array2<int> TColStd_Array2OfInteger;
typedef NCollection_Array2<double> TColStd_Array2OfReal;
typedef NCollection_Array2<opencascade::handle<Standard_Transient>> TColStd_Array2OfTransient;
typedef NCollection_DataMap<TCollection_AsciiString, int>::Iterator TColStd_DataMapIteratorOfDataMapOfAsciiStringInteger;
typedef NCollection_DataMap<int, int>::Iterator TColStd_DataMapIteratorOfDataMapOfIntegerInteger;
typedef NCollection_DataMap<int, TColStd_ListOfInteger>::Iterator TColStd_DataMapIteratorOfDataMapOfIntegerListOfInteger;
typedef NCollection_DataMap<int, double>::Iterator TColStd_DataMapIteratorOfDataMapOfIntegerReal;
typedef NCollection_DataMap<int, opencascade::handle<Standard_Transient>>::Iterator TColStd_DataMapIteratorOfDataMapOfIntegerTransient;
typedef NCollection_DataMap<TCollection_ExtendedString, int>::Iterator TColStd_DataMapIteratorOfDataMapOfStringInteger;
typedef NCollection_DataMap<opencascade::handle<Standard_Transient>, opencascade::handle<Standard_Transient>>::Iterator TColStd_DataMapIteratorOfDataMapOfTransientTransient;
typedef NCollection_DataMap<TCollection_AsciiString, int> TColStd_DataMapOfAsciiStringInteger;
typedef NCollection_DataMap<int, int> TColStd_DataMapOfIntegerInteger;
typedef NCollection_DataMap<int, TColStd_ListOfInteger> TColStd_DataMapOfIntegerListOfInteger;
typedef NCollection_DataMap<int, double> TColStd_DataMapOfIntegerReal;
typedef NCollection_DataMap<int, opencascade::handle<Standard_Transient>> TColStd_DataMapOfIntegerTransient;
typedef NCollection_DataMap<TCollection_ExtendedString, int> TColStd_DataMapOfStringInteger;
typedef NCollection_DataMap<opencascade::handle<Standard_Transient>, opencascade::handle<Standard_Transient>> TColStd_DataMapOfTransientTransient;
typedef NCollection_HArray1<TCollection_AsciiString> TColStd_HArray1OfAsciiString;
typedef NCollection_HArray1<bool> TColStd_HArray1OfBoolean;
typedef NCollection_HArray1<uint8_t> TColStd_HArray1OfByte;
typedef NCollection_HArray1<char> TColStd_HArray1OfCharacter;
typedef NCollection_HArray1<TCollection_ExtendedString> TColStd_HArray1OfExtendedString;
typedef NCollection_HArray1<int> TColStd_HArray1OfInteger;
typedef NCollection_HArray1<TColStd_ListOfInteger> TColStd_HArray1OfListOfInteger;
typedef NCollection_HArray1<double> TColStd_HArray1OfReal;
typedef NCollection_HArray1<opencascade::handle<Standard_Transient>> TColStd_HArray1OfTransient;
typedef NCollection_HArray2<bool> TColStd_HArray2OfBoolean;
typedef NCollection_HArray2<char> TColStd_HArray2OfCharacter;
typedef NCollection_HArray2<int> TColStd_HArray2OfInteger;
typedef NCollection_HArray2<double> TColStd_HArray2OfReal;
typedef NCollection_HArray2<opencascade::handle<Standard_Transient>> TColStd_HArray2OfTransient;
typedef NCollection_HSequence<TCollection_AsciiString> TColStd_HSequenceOfAsciiString;
typedef NCollection_HSequence<TCollection_ExtendedString> TColStd_HSequenceOfExtendedString;
typedef NCollection_HSequence<opencascade::handle<TCollection_HAsciiString>> TColStd_HSequenceOfHAsciiString;
typedef NCollection_HSequence<opencascade::handle<TCollection_HExtendedString>> TColStd_HSequenceOfHExtendedString;
typedef NCollection_HSequence<int> TColStd_HSequenceOfInteger;
typedef NCollection_HSequence<double> TColStd_HSequenceOfReal;
typedef NCollection_HSequence<opencascade::handle<Standard_Transient>> TColStd_HSequenceOfTransient;
typedef NCollection_IndexedDataMap<TCollection_AsciiString, TCollection_AsciiString> TColStd_IndexedDataMapOfStringString;
typedef NCollection_IndexedDataMap<opencascade::handle<Standard_Transient>, opencascade::handle<Standard_Transient>> TColStd_IndexedDataMapOfTransientTransient;
typedef NCollection_IndexedMap<int> TColStd_IndexedMapOfInteger;
typedef NCollection_IndexedMap<double> TColStd_IndexedMapOfReal;
typedef NCollection_IndexedMap<opencascade::handle<Standard_Transient>> TColStd_IndexedMapOfTransient;
typedef NCollection_List<TCollection_AsciiString>::Iterator TColStd_ListIteratorOfListOfAsciiString;
typedef NCollection_List<int>::Iterator TColStd_ListIteratorOfListOfInteger;
typedef NCollection_List<double>::Iterator TColStd_ListIteratorOfListOfReal;
typedef NCollection_List<opencascade::handle<Standard_Transient>>::Iterator TColStd_ListIteratorOfListOfTransient;
typedef NCollection_List<TCollection_AsciiString> TColStd_ListOfAsciiString;
typedef NCollection_List<int> TColStd_ListOfInteger;
typedef NCollection_List<double> TColStd_ListOfReal;
typedef NCollection_List<opencascade::handle<Standard_Transient>> TColStd_ListOfTransient;
typedef NCollection_Map<TCollection_AsciiString>::Iterator TColStd_MapIteratorOfMapOfAsciiString;
typedef NCollection_Map<int>::Iterator TColStd_MapIteratorOfMapOfInteger;
typedef NCollection_Map<double>::Iterator TColStd_MapIteratorOfMapOfReal;
typedef NCollection_Map<opencascade::handle<Standard_Transient>>::Iterator TColStd_MapIteratorOfMapOfTransient;
typedef NCollection_Map<TCollection_AsciiString> TColStd_MapOfAsciiString;
typedef NCollection_Map<int> TColStd_MapOfInteger;
typedef NCollection_Map<double> TColStd_MapOfReal;
typedef NCollection_Map<opencascade::handle<Standard_Transient>> TColStd_MapOfTransient;
typedef NCollection_PackedMap<int> TColStd_PackedMapOfInteger;
typedef NCollection_Sequence<void *> TColStd_SequenceOfAddress;
typedef NCollection_Sequence<TCollection_AsciiString> TColStd_SequenceOfAsciiString;
typedef NCollection_Sequence<bool> TColStd_SequenceOfBoolean;
typedef NCollection_Sequence<TCollection_ExtendedString> TColStd_SequenceOfExtendedString;
typedef NCollection_Sequence<opencascade::handle<TCollection_HAsciiString>> TColStd_SequenceOfHAsciiString;
typedef NCollection_Sequence<opencascade::handle<TCollection_HExtendedString>> TColStd_SequenceOfHExtendedString;
typedef NCollection_Sequence<int> TColStd_SequenceOfInteger;
typedef NCollection_Sequence<double> TColStd_SequenceOfReal;
typedef NCollection_Sequence<opencascade::handle<Standard_Transient>> TColStd_SequenceOfTransient;
/* end typedefs declaration */

/************************************
* class TColStd_HPackedMapOfInteger *
************************************/
class TColStd_HPackedMapOfInteger : public Standard_Transient {
	public:
		/****** TColStd_HPackedMapOfInteger::TColStd_HPackedMapOfInteger ******/
		/****** md5 signature: a0453c0e08537f8176bee87f655dfbe5 ******/
		%feature("compactdefaultargs") TColStd_HPackedMapOfInteger;
		%feature("autodoc", "
Parameters
----------
theNbBuckets: int (optional, default to 1)

Return
-------
None

Description
-----------
Constructor of empty map. 
Parameter theNbBuckets initial number of buckets.
") TColStd_HPackedMapOfInteger;
		 TColStd_HPackedMapOfInteger(const int theNbBuckets = 1);

		/****** TColStd_HPackedMapOfInteger::TColStd_HPackedMapOfInteger ******/
		/****** md5 signature: 57f2811dd29b1733112a8be2932c7a88 ******/
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
Constructor from already existing map; performs copying. 
Parameter theOther the map to copy.
") TColStd_HPackedMapOfInteger;
		 TColStd_HPackedMapOfInteger(const TColStd_PackedMapOfInteger & theOther);

		/****** TColStd_HPackedMapOfInteger::TColStd_HPackedMapOfInteger ******/
		/****** md5 signature: ecd0fc2620d410f79f23052b3e3e2ee5 ******/
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
Constructor from already existing map; performs copying. 
Parameter theOther the map to copy.
") TColStd_HPackedMapOfInteger;
		 TColStd_HPackedMapOfInteger(TColStd_PackedMapOfInteger & theOther);

		/****** TColStd_HPackedMapOfInteger::ChangeMap ******/
		/****** md5 signature: 5891dee29ebed8da861b59f02b08a9cc ******/
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "Return
-------
TColStd_PackedMapOfInteger

Description
-----------
Returns mutable reference to the underlying map.
") ChangeMap;
		TColStd_PackedMapOfInteger & ChangeMap();

		/****** TColStd_HPackedMapOfInteger::Map ******/
		/****** md5 signature: 5d0a9f66293aaa0a8a3903c0b90ee49a ******/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "Return
-------
TColStd_PackedMapOfInteger

Description
-----------
Returns const reference to the underlying map.
") Map;
		const TColStd_PackedMapOfInteger & Map();

};


%make_alias(TColStd_HPackedMapOfInteger)

%extend TColStd_HPackedMapOfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */

class TColStd_HArray1OfCharacter : public NCollection_Array1<char>, public Standard_Transient {
  public:
    TColStd_HArray1OfCharacter(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColStd_HArray1OfCharacter(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<char>::value_type& theValue);
    TColStd_HArray1OfCharacter(const NCollection_Array1<char>& theOther);
    const NCollection_Array1<char>& Array1();
    NCollection_Array1<char>& ChangeArray1();
};
%make_alias(TColStd_HArray1OfCharacter)


class TColStd_HArray1OfReal : public NCollection_Array1<double>, public Standard_Transient {
  public:
    TColStd_HArray1OfReal(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColStd_HArray1OfReal(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<double>::value_type& theValue);
    TColStd_HArray1OfReal(const NCollection_Array1<double>& theOther);
    const NCollection_Array1<double>& Array1();
    NCollection_Array1<double>& ChangeArray1();
};
%make_alias(TColStd_HArray1OfReal)


class TColStd_HArray1OfByte : public NCollection_Array1<uint8_t>, public Standard_Transient {
  public:
    TColStd_HArray1OfByte(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColStd_HArray1OfByte(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<uint8_t>::value_type& theValue);
    TColStd_HArray1OfByte(const NCollection_Array1<uint8_t>& theOther);
    const NCollection_Array1<uint8_t>& Array1();
    NCollection_Array1<uint8_t>& ChangeArray1();
};
%make_alias(TColStd_HArray1OfByte)


class TColStd_HArray1OfBoolean : public NCollection_Array1<bool>, public Standard_Transient {
  public:
    TColStd_HArray1OfBoolean(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColStd_HArray1OfBoolean(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<bool>::value_type& theValue);
    TColStd_HArray1OfBoolean(const NCollection_Array1<bool>& theOther);
    const NCollection_Array1<bool>& Array1();
    NCollection_Array1<bool>& ChangeArray1();
};
%make_alias(TColStd_HArray1OfBoolean)


class TColStd_HArray1OfInteger : public NCollection_Array1<int>, public Standard_Transient {
  public:
    TColStd_HArray1OfInteger(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColStd_HArray1OfInteger(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<int>::value_type& theValue);
    TColStd_HArray1OfInteger(const NCollection_Array1<int>& theOther);
    const NCollection_Array1<int>& Array1();
    NCollection_Array1<int>& ChangeArray1();
};
%make_alias(TColStd_HArray1OfInteger)


class TColStd_HArray1OfAsciiString : public NCollection_Array1<TCollection_AsciiString>, public Standard_Transient {
  public:
    TColStd_HArray1OfAsciiString(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColStd_HArray1OfAsciiString(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<TCollection_AsciiString>::value_type& theValue);
    TColStd_HArray1OfAsciiString(const NCollection_Array1<TCollection_AsciiString>& theOther);
    const NCollection_Array1<TCollection_AsciiString>& Array1();
    NCollection_Array1<TCollection_AsciiString>& ChangeArray1();
};
%make_alias(TColStd_HArray1OfAsciiString)


class TColStd_HArray1OfTransient : public NCollection_Array1<opencascade::handle<Standard_Transient>>, public Standard_Transient {
  public:
    TColStd_HArray1OfTransient(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColStd_HArray1OfTransient(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<opencascade::handle<Standard_Transient>>::value_type& theValue);
    TColStd_HArray1OfTransient(const NCollection_Array1<opencascade::handle<Standard_Transient>>& theOther);
    const NCollection_Array1<opencascade::handle<Standard_Transient>>& Array1();
    NCollection_Array1<opencascade::handle<Standard_Transient>>& ChangeArray1();
};
%make_alias(TColStd_HArray1OfTransient)


class TColStd_HArray1OfListOfInteger : public NCollection_Array1<TColStd_ListOfInteger>, public Standard_Transient {
  public:
    TColStd_HArray1OfListOfInteger(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColStd_HArray1OfListOfInteger(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<TColStd_ListOfInteger>::value_type& theValue);
    TColStd_HArray1OfListOfInteger(const NCollection_Array1<TColStd_ListOfInteger>& theOther);
    const NCollection_Array1<TColStd_ListOfInteger>& Array1();
    NCollection_Array1<TColStd_ListOfInteger>& ChangeArray1();
};
%make_alias(TColStd_HArray1OfListOfInteger)


class TColStd_HArray1OfExtendedString : public NCollection_Array1<TCollection_ExtendedString>, public Standard_Transient {
  public:
    TColStd_HArray1OfExtendedString(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColStd_HArray1OfExtendedString(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<TCollection_ExtendedString>::value_type& theValue);
    TColStd_HArray1OfExtendedString(const NCollection_Array1<TCollection_ExtendedString>& theOther);
    const NCollection_Array1<TCollection_ExtendedString>& Array1();
    NCollection_Array1<TCollection_ExtendedString>& ChangeArray1();
};
%make_alias(TColStd_HArray1OfExtendedString)

/* harray2 classes */
class TColStd_HArray2OfReal : public NCollection_Array2<double>, public Standard_Transient {
  public:
    TColStd_HArray2OfReal(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    TColStd_HArray2OfReal(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const NCollection_Array2<double>::value_type& theValue);
    TColStd_HArray2OfReal(const NCollection_Array2<double>& theOther);
    const NCollection_Array2<double>& Array2 ();
    NCollection_Array2<double>& ChangeArray2 (); 
};
%make_alias(TColStd_HArray2OfReal)


class TColStd_HArray2OfInteger : public NCollection_Array2<int>, public Standard_Transient {
  public:
    TColStd_HArray2OfInteger(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    TColStd_HArray2OfInteger(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const NCollection_Array2<int>::value_type& theValue);
    TColStd_HArray2OfInteger(const NCollection_Array2<int>& theOther);
    const NCollection_Array2<int>& Array2 ();
    NCollection_Array2<int>& ChangeArray2 (); 
};
%make_alias(TColStd_HArray2OfInteger)


class TColStd_HArray2OfTransient : public NCollection_Array2<opencascade::handle<Standard_Transient>>, public Standard_Transient {
  public:
    TColStd_HArray2OfTransient(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    TColStd_HArray2OfTransient(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const NCollection_Array2<opencascade::handle<Standard_Transient>>::value_type& theValue);
    TColStd_HArray2OfTransient(const NCollection_Array2<opencascade::handle<Standard_Transient>>& theOther);
    const NCollection_Array2<opencascade::handle<Standard_Transient>>& Array2 ();
    NCollection_Array2<opencascade::handle<Standard_Transient>>& ChangeArray2 (); 
};
%make_alias(TColStd_HArray2OfTransient)


class TColStd_HArray2OfBoolean : public NCollection_Array2<bool>, public Standard_Transient {
  public:
    TColStd_HArray2OfBoolean(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    TColStd_HArray2OfBoolean(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const NCollection_Array2<bool>::value_type& theValue);
    TColStd_HArray2OfBoolean(const NCollection_Array2<bool>& theOther);
    const NCollection_Array2<bool>& Array2 ();
    NCollection_Array2<bool>& ChangeArray2 (); 
};
%make_alias(TColStd_HArray2OfBoolean)


class TColStd_HArray2OfCharacter : public NCollection_Array2<char>, public Standard_Transient {
  public:
    TColStd_HArray2OfCharacter(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    TColStd_HArray2OfCharacter(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const NCollection_Array2<char>::value_type& theValue);
    TColStd_HArray2OfCharacter(const NCollection_Array2<char>& theOther);
    const NCollection_Array2<char>& Array2 ();
    NCollection_Array2<char>& ChangeArray2 (); 
};
%make_alias(TColStd_HArray2OfCharacter)


/* hsequence classes */
class TColStd_HSequenceOfReal : public NCollection_Sequence<double>, public Standard_Transient {
  public:
    TColStd_HSequenceOfReal();
    TColStd_HSequenceOfReal(const NCollection_Sequence<double>& theOther);
    const NCollection_Sequence<double>& Sequence();
    void Append (const NCollection_Sequence<double>::value_type& theItem);
    void Append (NCollection_Sequence<double>& theSequence);
    NCollection_Sequence<double>& ChangeSequence();
};
%make_alias(TColStd_HSequenceOfReal)


class TColStd_HSequenceOfTransient : public NCollection_Sequence<opencascade::handle<Standard_Transient>>, public Standard_Transient {
  public:
    TColStd_HSequenceOfTransient();
    TColStd_HSequenceOfTransient(const NCollection_Sequence<opencascade::handle<Standard_Transient>>& theOther);
    const NCollection_Sequence<opencascade::handle<Standard_Transient>>& Sequence();
    void Append (const NCollection_Sequence<opencascade::handle<Standard_Transient>>::value_type& theItem);
    void Append (NCollection_Sequence<opencascade::handle<Standard_Transient>>& theSequence);
    NCollection_Sequence<opencascade::handle<Standard_Transient>>& ChangeSequence();
};
%make_alias(TColStd_HSequenceOfTransient)


class TColStd_HSequenceOfInteger : public NCollection_Sequence<int>, public Standard_Transient {
  public:
    TColStd_HSequenceOfInteger();
    TColStd_HSequenceOfInteger(const NCollection_Sequence<int>& theOther);
    const NCollection_Sequence<int>& Sequence();
    void Append (const NCollection_Sequence<int>::value_type& theItem);
    void Append (NCollection_Sequence<int>& theSequence);
    NCollection_Sequence<int>& ChangeSequence();
};
%make_alias(TColStd_HSequenceOfInteger)


class TColStd_HSequenceOfExtendedString : public NCollection_Sequence<TCollection_ExtendedString>, public Standard_Transient {
  public:
    TColStd_HSequenceOfExtendedString();
    TColStd_HSequenceOfExtendedString(const NCollection_Sequence<TCollection_ExtendedString>& theOther);
    const NCollection_Sequence<TCollection_ExtendedString>& Sequence();
    void Append (const NCollection_Sequence<TCollection_ExtendedString>::value_type& theItem);
    void Append (NCollection_Sequence<TCollection_ExtendedString>& theSequence);
    NCollection_Sequence<TCollection_ExtendedString>& ChangeSequence();
};
%make_alias(TColStd_HSequenceOfExtendedString)


class TColStd_HSequenceOfHAsciiString : public NCollection_Sequence<opencascade::handle<TCollection_HAsciiString>>, public Standard_Transient {
  public:
    TColStd_HSequenceOfHAsciiString();
    TColStd_HSequenceOfHAsciiString(const NCollection_Sequence<opencascade::handle<TCollection_HAsciiString>>& theOther);
    const NCollection_Sequence<opencascade::handle<TCollection_HAsciiString>>& Sequence();
    void Append (const NCollection_Sequence<opencascade::handle<TCollection_HAsciiString>>::value_type& theItem);
    void Append (NCollection_Sequence<opencascade::handle<TCollection_HAsciiString>>& theSequence);
    NCollection_Sequence<opencascade::handle<TCollection_HAsciiString>>& ChangeSequence();
};
%make_alias(TColStd_HSequenceOfHAsciiString)


class TColStd_HSequenceOfHExtendedString : public NCollection_Sequence<opencascade::handle<TCollection_HExtendedString>>, public Standard_Transient {
  public:
    TColStd_HSequenceOfHExtendedString();
    TColStd_HSequenceOfHExtendedString(const NCollection_Sequence<opencascade::handle<TCollection_HExtendedString>>& theOther);
    const NCollection_Sequence<opencascade::handle<TCollection_HExtendedString>>& Sequence();
    void Append (const NCollection_Sequence<opencascade::handle<TCollection_HExtendedString>>::value_type& theItem);
    void Append (NCollection_Sequence<opencascade::handle<TCollection_HExtendedString>>& theSequence);
    NCollection_Sequence<opencascade::handle<TCollection_HExtendedString>>& ChangeSequence();
};
%make_alias(TColStd_HSequenceOfHExtendedString)


class TColStd_HSequenceOfAsciiString : public NCollection_Sequence<TCollection_AsciiString>, public Standard_Transient {
  public:
    TColStd_HSequenceOfAsciiString();
    TColStd_HSequenceOfAsciiString(const NCollection_Sequence<TCollection_AsciiString>& theOther);
    const NCollection_Sequence<TCollection_AsciiString>& Sequence();
    void Append (const NCollection_Sequence<TCollection_AsciiString>::value_type& theItem);
    void Append (NCollection_Sequence<TCollection_AsciiString>& theSequence);
    NCollection_Sequence<TCollection_AsciiString>& ChangeSequence();
};
%make_alias(TColStd_HSequenceOfAsciiString)


/* class aliases */
%pythoncode {
}
