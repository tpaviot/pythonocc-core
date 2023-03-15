/*
Copyright 2008-2022 Thomas Paviot (tpaviot@gmail.com)

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
https://www.opencascade.com/doc/occt-7.6.0/refman/html/package_tcolstd.html"
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

%extend NCollection_Array1<TCollection_AsciiString> {
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
%template(TColStd_Array1OfBoolean) NCollection_Array1<Standard_Boolean>;

%extend NCollection_Array1<Standard_Boolean> {
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
%template(TColStd_Array1OfByte) NCollection_Array1<Standard_Byte>;

%extend NCollection_Array1<Standard_Byte> {
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
%template(TColStd_Array1OfCharacter) NCollection_Array1<Standard_Character>;

%extend NCollection_Array1<Standard_Character> {
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
%template(TColStd_Array1OfExtendedString) NCollection_Array1<TCollection_ExtendedString>;

%extend NCollection_Array1<TCollection_ExtendedString> {
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
%template(TColStd_Array1OfInteger) NCollection_Array1<Standard_Integer>;

%extend NCollection_Array1<Standard_Integer> {
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
%template(TColStd_Array1OfListOfInteger) NCollection_Array1<TColStd_ListOfInteger>;

%extend NCollection_Array1<TColStd_ListOfInteger> {
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
%template(TColStd_Array1OfReal) NCollection_Array1<Standard_Real>;

%extend NCollection_Array1<Standard_Real> {
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
%template(TColStd_Array1OfTransient) NCollection_Array1<opencascade::handle<Standard_Transient>>;

%extend NCollection_Array1<opencascade::handle<Standard_Transient>> {
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
%template(TColStd_Array2OfBoolean) NCollection_Array2<Standard_Boolean>;
%template(TColStd_Array2OfCharacter) NCollection_Array2<Standard_Character>;
%template(TColStd_Array2OfInteger) NCollection_Array2<Standard_Integer>;
%template(TColStd_Array2OfReal) NCollection_Array2<Standard_Real>;
%template(TColStd_Array2OfTransient) NCollection_Array2<opencascade::handle<Standard_Transient>>;
%template(TColStd_DataMapOfAsciiStringInteger) NCollection_DataMap<TCollection_AsciiString,Standard_Integer,TCollection_AsciiString>;
%template(TColStd_DataMapOfIntegerInteger) NCollection_DataMap<Standard_Integer,Standard_Integer,TColStd_MapIntegerHasher>;

%extend NCollection_DataMap<Standard_Integer,Standard_Integer,TColStd_MapIntegerHasher> {
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
%template(TColStd_DataMapOfIntegerListOfInteger) NCollection_DataMap<Standard_Integer,TColStd_ListOfInteger,TColStd_MapIntegerHasher>;

%extend NCollection_DataMap<Standard_Integer,TColStd_ListOfInteger,TColStd_MapIntegerHasher> {
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
%template(TColStd_DataMapOfIntegerReal) NCollection_DataMap<Standard_Integer,Standard_Real,TColStd_MapIntegerHasher>;

%extend NCollection_DataMap<Standard_Integer,Standard_Real,TColStd_MapIntegerHasher> {
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
%template(TColStd_DataMapOfIntegerTransient) NCollection_DataMap<Standard_Integer,opencascade::handle<Standard_Transient>,TColStd_MapIntegerHasher>;

%extend NCollection_DataMap<Standard_Integer,opencascade::handle<Standard_Transient>,TColStd_MapIntegerHasher> {
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
%template(TColStd_DataMapOfStringInteger) NCollection_DataMap<TCollection_ExtendedString,Standard_Integer,TCollection_ExtendedString>;
%template(TColStd_DataMapOfTransientTransient) NCollection_DataMap<opencascade::handle<Standard_Transient>,opencascade::handle<Standard_Transient>,TColStd_MapTransientHasher>;
%template(TColStd_IndexedDataMapOfStringString) NCollection_IndexedDataMap<TCollection_AsciiString,TCollection_AsciiString,TCollection_AsciiString>;
%template(TColStd_IndexedDataMapOfTransientTransient) NCollection_IndexedDataMap<opencascade::handle<Standard_Transient>,opencascade::handle<Standard_Transient>,TColStd_MapTransientHasher>;
%template(TColStd_IndexedMapOfInteger) NCollection_IndexedMap<Standard_Integer,TColStd_MapIntegerHasher>;
%template(TColStd_IndexedMapOfReal) NCollection_IndexedMap<Standard_Real,TColStd_MapRealHasher>;
%template(TColStd_IndexedMapOfTransient) NCollection_IndexedMap<opencascade::handle<Standard_Transient>,TColStd_MapTransientHasher>;
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
%template(TColStd_MapIntegerHasher) NCollection_DefaultHasher<Standard_Integer>;
%template(TColStd_MapOfAsciiString) NCollection_Map<TCollection_AsciiString,TCollection_AsciiString>;
%template(TColStd_MapOfInteger) NCollection_Map<Standard_Integer,TColStd_MapIntegerHasher>;
%template(TColStd_MapOfReal) NCollection_Map<Standard_Real,TColStd_MapRealHasher>;
%template(TColStd_MapOfTransient) NCollection_Map<opencascade::handle<Standard_Transient>,TColStd_MapTransientHasher>;
%template(TColStd_MapRealHasher) NCollection_DefaultHasher<Standard_Real>;
%template(TColStd_MapTransientHasher) NCollection_DefaultHasher<opencascade::handle<Standard_Transient>>;
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
typedef NCollection_Array1 <TCollection_AsciiString> TColStd_Array1OfAsciiString;
typedef NCollection_Array1 <Standard_Boolean> TColStd_Array1OfBoolean;
typedef NCollection_Array1 <Standard_Byte> TColStd_Array1OfByte;
typedef NCollection_Array1 <Standard_Character> TColStd_Array1OfCharacter;
typedef NCollection_Array1 <TCollection_ExtendedString> TColStd_Array1OfExtendedString;
typedef NCollection_Array1 <Standard_Integer> TColStd_Array1OfInteger;
typedef NCollection_Array1 <TColStd_ListOfInteger> TColStd_Array1OfListOfInteger;
typedef NCollection_Array1 <Standard_Real> TColStd_Array1OfReal;
typedef NCollection_Array1 <opencascade::handle <Standard_Transient>> TColStd_Array1OfTransient;
typedef NCollection_Array2 <Standard_Boolean> TColStd_Array2OfBoolean;
typedef NCollection_Array2 <Standard_Character> TColStd_Array2OfCharacter;
typedef NCollection_Array2 <Standard_Integer> TColStd_Array2OfInteger;
typedef NCollection_Array2 <Standard_Real> TColStd_Array2OfReal;
typedef NCollection_Array2 <opencascade::handle <Standard_Transient>> TColStd_Array2OfTransient;
typedef NCollection_DataMap <TCollection_AsciiString, Standard_Integer, TCollection_AsciiString>::Iterator TColStd_DataMapIteratorOfDataMapOfAsciiStringInteger;
typedef NCollection_DataMap <Standard_Integer, Standard_Integer, TColStd_MapIntegerHasher>::Iterator TColStd_DataMapIteratorOfDataMapOfIntegerInteger;
typedef NCollection_DataMap <Standard_Integer, TColStd_ListOfInteger, TColStd_MapIntegerHasher>::Iterator TColStd_DataMapIteratorOfDataMapOfIntegerListOfInteger;
typedef NCollection_DataMap <Standard_Integer, Standard_Real, TColStd_MapIntegerHasher>::Iterator TColStd_DataMapIteratorOfDataMapOfIntegerReal;
typedef NCollection_DataMap <Standard_Integer, opencascade::handle <Standard_Transient>, TColStd_MapIntegerHasher>::Iterator TColStd_DataMapIteratorOfDataMapOfIntegerTransient;
typedef NCollection_DataMap <TCollection_ExtendedString, Standard_Integer, TCollection_ExtendedString>::Iterator TColStd_DataMapIteratorOfDataMapOfStringInteger;
typedef NCollection_DataMap <opencascade::handle <Standard_Transient>, opencascade::handle <Standard_Transient>, TColStd_MapTransientHasher>::Iterator TColStd_DataMapIteratorOfDataMapOfTransientTransient;
typedef NCollection_DataMap <TCollection_AsciiString, Standard_Integer, TCollection_AsciiString> TColStd_DataMapOfAsciiStringInteger;
typedef NCollection_DataMap <Standard_Integer, Standard_Integer, TColStd_MapIntegerHasher> TColStd_DataMapOfIntegerInteger;
typedef NCollection_DataMap <Standard_Integer, TColStd_ListOfInteger, TColStd_MapIntegerHasher> TColStd_DataMapOfIntegerListOfInteger;
typedef NCollection_DataMap <Standard_Integer, Standard_Real, TColStd_MapIntegerHasher> TColStd_DataMapOfIntegerReal;
typedef NCollection_DataMap <Standard_Integer, opencascade::handle <Standard_Transient>, TColStd_MapIntegerHasher> TColStd_DataMapOfIntegerTransient;
typedef NCollection_DataMap <TCollection_ExtendedString, Standard_Integer, TCollection_ExtendedString> TColStd_DataMapOfStringInteger;
typedef NCollection_DataMap <opencascade::handle <Standard_Transient>, opencascade::handle <Standard_Transient>, TColStd_MapTransientHasher> TColStd_DataMapOfTransientTransient;
typedef NCollection_IndexedDataMap <TCollection_AsciiString, TCollection_AsciiString, TCollection_AsciiString> TColStd_IndexedDataMapOfStringString;
typedef NCollection_IndexedDataMap <opencascade::handle <Standard_Transient>, opencascade::handle <Standard_Transient>, TColStd_MapTransientHasher> TColStd_IndexedDataMapOfTransientTransient;
typedef NCollection_IndexedMap <Standard_Integer, TColStd_MapIntegerHasher> TColStd_IndexedMapOfInteger;
typedef NCollection_IndexedMap <Standard_Real, TColStd_MapRealHasher> TColStd_IndexedMapOfReal;
typedef NCollection_IndexedMap <opencascade::handle <Standard_Transient>, TColStd_MapTransientHasher> TColStd_IndexedMapOfTransient;
typedef NCollection_List <TCollection_AsciiString>::Iterator TColStd_ListIteratorOfListOfAsciiString;
typedef NCollection_List <Standard_Integer>::Iterator TColStd_ListIteratorOfListOfInteger;
typedef NCollection_List <Standard_Real>::Iterator TColStd_ListIteratorOfListOfReal;
typedef NCollection_List <opencascade::handle <Standard_Transient>>::Iterator TColStd_ListIteratorOfListOfTransient;
typedef NCollection_List <TCollection_AsciiString> TColStd_ListOfAsciiString;
typedef NCollection_List <Standard_Integer> TColStd_ListOfInteger;
typedef NCollection_List <Standard_Real> TColStd_ListOfReal;
typedef NCollection_List <opencascade::handle <Standard_Transient>> TColStd_ListOfTransient;
typedef NCollection_DefaultHasher <Standard_Integer> TColStd_MapIntegerHasher;
typedef NCollection_Map <TCollection_AsciiString, TCollection_AsciiString>::Iterator TColStd_MapIteratorOfMapOfAsciiString;
typedef NCollection_Map <Standard_Integer, TColStd_MapIntegerHasher>::Iterator TColStd_MapIteratorOfMapOfInteger;
typedef NCollection_Map <Standard_Real, TColStd_MapRealHasher>::Iterator TColStd_MapIteratorOfMapOfReal;
typedef NCollection_Map <opencascade::handle <Standard_Transient>, TColStd_MapTransientHasher>::Iterator TColStd_MapIteratorOfMapOfTransient;
typedef TColStd_PackedMapOfInteger::Iterator TColStd_MapIteratorOfPackedMapOfInteger;
typedef NCollection_Map <TCollection_AsciiString, TCollection_AsciiString> TColStd_MapOfAsciiString;
typedef NCollection_Map <Standard_Integer, TColStd_MapIntegerHasher> TColStd_MapOfInteger;
typedef NCollection_Map <Standard_Real, TColStd_MapRealHasher> TColStd_MapOfReal;
typedef NCollection_Map <opencascade::handle <Standard_Transient>, TColStd_MapTransientHasher> TColStd_MapOfTransient;
typedef NCollection_DefaultHasher <Standard_Real> TColStd_MapRealHasher;
typedef NCollection_DefaultHasher <opencascade::handle <Standard_Transient>> TColStd_MapTransientHasher;
typedef NCollection_Sequence <Standard_Address> TColStd_SequenceOfAddress;
typedef NCollection_Sequence <TCollection_AsciiString> TColStd_SequenceOfAsciiString;
typedef NCollection_Sequence <Standard_Boolean> TColStd_SequenceOfBoolean;
typedef NCollection_Sequence <TCollection_ExtendedString> TColStd_SequenceOfExtendedString;
typedef NCollection_Sequence <opencascade::handle <TCollection_HAsciiString>> TColStd_SequenceOfHAsciiString;
typedef NCollection_Sequence <opencascade::handle <TCollection_HExtendedString>> TColStd_SequenceOfHExtendedString;
typedef NCollection_Sequence <Standard_Integer> TColStd_SequenceOfInteger;
typedef NCollection_Sequence <Standard_Real> TColStd_SequenceOfReal;
typedef NCollection_Sequence <opencascade::handle <Standard_Transient>> TColStd_SequenceOfTransient;
/* end typedefs declaration */

/************************************
* class TColStd_HPackedMapOfInteger *
************************************/
class TColStd_HPackedMapOfInteger : public Standard_Transient {
	public:
		/****************** TColStd_HPackedMapOfInteger ******************/
		/**** md5 signature: 7dbfb789a2d13306defa568ad5aebfb5 ****/
		%feature("compactdefaultargs") TColStd_HPackedMapOfInteger;
		%feature("autodoc", "No available documentation.

Parameters
----------
NbBuckets: int,optional
	default value is 1

Returns
-------
None
") TColStd_HPackedMapOfInteger;
		 TColStd_HPackedMapOfInteger(const Standard_Integer NbBuckets = 1);

		/****************** TColStd_HPackedMapOfInteger ******************/
		/**** md5 signature: 89e534bef075b502a40c10c743d38652 ****/
		%feature("compactdefaultargs") TColStd_HPackedMapOfInteger;
		%feature("autodoc", "No available documentation.

Parameters
----------
theOther: TColStd_PackedMapOfInteger

Returns
-------
None
") TColStd_HPackedMapOfInteger;
		 TColStd_HPackedMapOfInteger(const TColStd_PackedMapOfInteger & theOther);

		/****************** ChangeMap ******************/
		/**** md5 signature: ac7c29d51e6428dd947136d83ae404c5 ****/
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_PackedMapOfInteger
") ChangeMap;
		TColStd_PackedMapOfInteger & ChangeMap();

		/****************** Map ******************/
		/**** md5 signature: 9730b67796975602112304ea27686558 ****/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_PackedMapOfInteger
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
		/****************** TColStd_PackedMapOfInteger ******************/
		/**** md5 signature: 18de52cdb9ee27c0f41ddb1c59502dae ****/
		%feature("compactdefaultargs") TColStd_PackedMapOfInteger;
		%feature("autodoc", "//!< currently iterated key constructor.

Parameters
----------
theNbBuckets: int,optional
	default value is 1

Returns
-------
None
") TColStd_PackedMapOfInteger;
		 TColStd_PackedMapOfInteger(const Standard_Integer theNbBuckets = 1);

		/****************** TColStd_PackedMapOfInteger ******************/
		/**** md5 signature: 1ac8c1776c3c1051679ca26b5297b220 ****/
		%feature("compactdefaultargs") TColStd_PackedMapOfInteger;
		%feature("autodoc", "Copy constructor.

Parameters
----------
theOther: TColStd_PackedMapOfInteger

Returns
-------
None
") TColStd_PackedMapOfInteger;
		 TColStd_PackedMapOfInteger(const TColStd_PackedMapOfInteger & theOther);

		/****************** Add ******************/
		/**** md5 signature: fefd53232cb6b225fee21a01797a4953 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "No available documentation.

Parameters
----------
aKey: int

Returns
-------
bool
") Add;
		Standard_Boolean Add(const Standard_Integer aKey);

		/****************** Assign ******************/
		/**** md5 signature: b123b23cfd6a21df1cc646056934f119 ****/
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "No available documentation.

Parameters
----------
&: TColStd_PackedMapOfInteger

Returns
-------
TColStd_PackedMapOfInteger
") Assign;
		TColStd_PackedMapOfInteger & Assign(const TColStd_PackedMapOfInteger &);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Contains ******************/
		/**** md5 signature: 8de2585592fed12a6d282488cd796177 ****/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "No available documentation.

Parameters
----------
aKey: int

Returns
-------
bool
") Contains;
		Standard_Boolean Contains(const Standard_Integer aKey);

		/****************** Differ ******************/
		/**** md5 signature: a33b35e060f7a592a4272060e7dca3b9 ****/
		%feature("compactdefaultargs") Differ;
		%feature("autodoc", "/** * apply to this map the symmetric difference (aka exclusive disjunction, boolean xor) operation with another (given) map. * the result contains the values that are contained only in this or the operand map, but not in both. * this algorithm is similar to method difference(). * returns true if contents of this map is changed */.

Parameters
----------
&: TColStd_PackedMapOfInteger

Returns
-------
bool
") Differ;
		Standard_Boolean Differ(const TColStd_PackedMapOfInteger &);

		/****************** Difference ******************/
		/**** md5 signature: 8fbd60922dcd49c1c7cf9132a621a893 ****/
		%feature("compactdefaultargs") Difference;
		%feature("autodoc", "/** * sets this map to be the result of symmetric difference (aka exclusive disjunction, boolean xor) operation between two given maps. * the new map contains the values that are contained only in the first or the second operand maps but not in both. * all previous contents of this map is cleared. * this map (result of the boolean operation) can also be used as one of operands. */.

Parameters
----------
&: TColStd_PackedMapOfInteger
&: TColStd_PackedMapOfInteger

Returns
-------
None
") Difference;
		void Difference(const TColStd_PackedMapOfInteger &, const TColStd_PackedMapOfInteger &);

		/****************** Extent ******************/
		/**** md5 signature: 19453f219e568f9c5109a0fd06459e95 ****/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "Returns map extent.

Returns
-------
int
") Extent;
		Standard_Integer Extent();

		/****************** GetMaximalMapped ******************/
		/**** md5 signature: 004e3c72ef4f9650f1f96fed23a5912b ****/
		%feature("compactdefaultargs") GetMaximalMapped;
		%feature("autodoc", "/** * query the maximal contained key value. */.

Returns
-------
int
") GetMaximalMapped;
		Standard_Integer GetMaximalMapped();

		/****************** GetMinimalMapped ******************/
		/**** md5 signature: d7c068ee4ed7ed98b9da7452d3e6c9df ****/
		%feature("compactdefaultargs") GetMinimalMapped;
		%feature("autodoc", "/** * query the minimal contained key value. */.

Returns
-------
int
") GetMinimalMapped;
		Standard_Integer GetMinimalMapped();

		/****************** HasIntersection ******************/
		/**** md5 signature: 64fc09010ab8b8e130b1e83e91bb6c58 ****/
		%feature("compactdefaultargs") HasIntersection;
		%feature("autodoc", "/** * returns true if this map has common items with the given one. */.

Parameters
----------
&: TColStd_PackedMapOfInteger

Returns
-------
bool
") HasIntersection;
		Standard_Boolean HasIntersection(const TColStd_PackedMapOfInteger &);

		/****************** Intersect ******************/
		/**** md5 signature: 8b232eb91c98828fe7f2311ddbd9531f ****/
		%feature("compactdefaultargs") Intersect;
		%feature("autodoc", "/** * apply to this map the intersection operation (aka multiplication, common, boolean and) with another (given) map. * the result contains only the values that are contained in both this and the given maps. * this algorithm is similar to method intersection(). * returns true if content of this map is changed */.

Parameters
----------
&: TColStd_PackedMapOfInteger

Returns
-------
bool
") Intersect;
		Standard_Boolean Intersect(const TColStd_PackedMapOfInteger &);

		/****************** Intersection ******************/
		/**** md5 signature: 2de63b754fe10319368ec017c5241e47 ****/
		%feature("compactdefaultargs") Intersection;
		%feature("autodoc", "/** * sets this map to be the result of intersection (aka multiplication, common, boolean and) operation between two given maps. * the new map contains only the values that are contained in both map operands. * all previous contents of this map is cleared. this same map (result of the boolean operation) can also be used as one of operands. * the order of operands makes no difference; the method minimizes internally the number of iterations using the smallest map for the loop. */.

Parameters
----------
&: TColStd_PackedMapOfInteger
&: TColStd_PackedMapOfInteger

Returns
-------
None
") Intersection;
		void Intersection(const TColStd_PackedMapOfInteger &, const TColStd_PackedMapOfInteger &);

		/****************** IsEmpty ******************/
		/**** md5 signature: d529c07ce9e12eea3222188c82b0e80b ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returns true if map is empty.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** IsEqual ******************/
		/**** md5 signature: f7a42088df0b62e4976b7a22e42a3394 ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "/** * returns true if this map is equal to the given one, i.e. they contain the * same sets of elements */.

Parameters
----------
&: TColStd_PackedMapOfInteger

Returns
-------
bool
") IsEqual;
		Standard_Boolean IsEqual(const TColStd_PackedMapOfInteger &);

		/****************** IsSubset ******************/
		/**** md5 signature: 6c5891cc01883b0709bbc235795cf9f7 ****/
		%feature("compactdefaultargs") IsSubset;
		%feature("autodoc", "/** * returns true if this map is subset of the given one, i.e. all elements * contained in this map is contained also in the operand map. * if this map is empty that this method returns true for any operand map. */.

Parameters
----------
&: TColStd_PackedMapOfInteger

Returns
-------
bool
") IsSubset;
		Standard_Boolean IsSubset(const TColStd_PackedMapOfInteger &);

		/****************** NbBuckets ******************/
		/**** md5 signature: cc8d74943ffa9a9dd7cf4eff0c6c9739 ****/
		%feature("compactdefaultargs") NbBuckets;
		%feature("autodoc", "Returns the number of map buckets (not that since integers are packed in this map, the number is smaller than extent).

Returns
-------
int
") NbBuckets;
		Standard_Integer NbBuckets();

		/****************** ReSize ******************/
		/**** md5 signature: 83b3b18bad9fa1d11d0b4c070b80b62a ****/
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "No available documentation.

Parameters
----------
NbBuckets: int

Returns
-------
None
") ReSize;
		void ReSize(const Standard_Integer NbBuckets);

		/****************** Remove ******************/
		/**** md5 signature: 92cf6145ca798b68010b8a9250e5f468 ****/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "No available documentation.

Parameters
----------
aKey: int

Returns
-------
bool
") Remove;
		Standard_Boolean Remove(const Standard_Integer aKey);


        %feature("autodoc", "1");
        %extend{
            std::string StatisticsToString() {
            std::stringstream s;
            self->Statistics(s);
            return s.str();}
        };
		/****************** Subtract ******************/
		/**** md5 signature: 190f8077cde18ce8900964ed206c3e98 ****/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "/** * apply to this map the subtraction (aka set-theoretic difference, relative complement, exclude, cut, boolean not) operation with another (given) map. * the result contains only the values that were previously contained in this map and not contained in this map. * this algorithm is similar to method subtract() with two operands. * returns true if contents of this map is changed */.

Parameters
----------
&: TColStd_PackedMapOfInteger

Returns
-------
bool
") Subtract;
		Standard_Boolean Subtract(const TColStd_PackedMapOfInteger &);

		/****************** Subtraction ******************/
		/**** md5 signature: d8b4eb899ecf48824b5e31cb4403d16c ****/
		%feature("compactdefaultargs") Subtraction;
		%feature("autodoc", "/** * sets this map to be the result of subtraction * (aka set-theoretic difference, relative complement, exclude, cut, boolean not) operation between two given maps. * the new map contains only the values that are contained in the first map operands and not contained in the second one. * all previous contents of this map is cleared. * this map (result of the boolean operation) can also be used as the first operand. */.

Parameters
----------
&: TColStd_PackedMapOfInteger
&: TColStd_PackedMapOfInteger

Returns
-------
None
") Subtraction;
		void Subtraction(const TColStd_PackedMapOfInteger &, const TColStd_PackedMapOfInteger &);

		/****************** Union ******************/
		/**** md5 signature: 63b0f7f4fb443df4653a7795cd699dd0 ****/
		%feature("compactdefaultargs") Union;
		%feature("autodoc", "//!@name boolean operations with maps as sets of integers //!@{/** * sets this map to be the result of union (aka addition, fuse, merge, boolean or) operation between two given maps. * the new map contains the values that are contained either in the first map or in the second map or in both. * all previous contents of this map is cleared. this map (result of the boolean operation) can also be passed as one of operands. */.

Parameters
----------
&: TColStd_PackedMapOfInteger
&: TColStd_PackedMapOfInteger

Returns
-------
None
") Union;
		void Union(const TColStd_PackedMapOfInteger &, const TColStd_PackedMapOfInteger &);

		/****************** Unite ******************/
		/**** md5 signature: e8a74d3f43058c4eae7ea1e860c6585c ****/
		%feature("compactdefaultargs") Unite;
		%feature("autodoc", "/** * apply to this map the boolean operation union (aka addition, fuse, merge, boolean or) with another (given) map. * the result contains the values that were previously contained in this map or contained in the given (operand) map. * this algorithm is similar to method union(). * returns true if content of this map is changed */.

Parameters
----------
&: TColStd_PackedMapOfInteger

Returns
-------
bool
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
