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
%define TCOLSTDDOCSTRING
"TColStd module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_tcolstd.html"
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
/* public enums */
/* end public enums declaration */

/* handles */
%wrap_handle(TColStd_HPackedMapOfInteger)
%wrap_handle(TColStd_HArray1OfExtendedString)
%wrap_handle(TColStd_HArray1OfCharacter)
%wrap_handle(TColStd_HArray1OfBoolean)
%wrap_handle(TColStd_HArray1OfAsciiString)
%wrap_handle(TColStd_HArray1OfReal)
%wrap_handle(TColStd_HArray1OfInteger)
%wrap_handle(TColStd_HArray1OfListOfInteger)
%wrap_handle(TColStd_HArray1OfTransient)
%wrap_handle(TColStd_HArray1OfByte)
%wrap_handle(TColStd_HArray2OfBoolean)
%wrap_handle(TColStd_HArray2OfTransient)
%wrap_handle(TColStd_HArray2OfReal)
%wrap_handle(TColStd_HArray2OfInteger)
%wrap_handle(TColStd_HArray2OfCharacter)
%wrap_handle(TColStd_HSequenceOfHAsciiString)
%wrap_handle(TColStd_HSequenceOfTransient)
%wrap_handle(TColStd_HSequenceOfAsciiString)
%wrap_handle(TColStd_HSequenceOfHExtendedString)
%wrap_handle(TColStd_HSequenceOfInteger)
%wrap_handle(TColStd_HSequenceOfExtendedString)
%wrap_handle(TColStd_HSequenceOfReal)
/* end handles declaration */

/* templates */
%template(TColStd_Array2OfBoolean) NCollection_Array2 <Standard_Boolean>;
%template(TColStd_DataMapOfIntegerTransient) NCollection_DataMap <Standard_Integer , opencascade::handle <Standard_Transient>, TColStd_MapIntegerHasher>;

%extend NCollection_DataMap <Standard_Integer , opencascade::handle <Standard_Transient>, TColStd_MapIntegerHasher> {
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
%template(TColStd_ListOfInteger) NCollection_List <Standard_Integer>;
%template(TColStd_ListIteratorOfListOfInteger) NCollection_TListIterator<Standard_Integer>;
%template(TColStd_SequenceOfAddress) NCollection_Sequence <Standard_Address>;
%template(TColStd_DataMapOfIntegerInteger) NCollection_DataMap <Standard_Integer , Standard_Integer , TColStd_MapIntegerHasher>;

%extend NCollection_DataMap <Standard_Integer , Standard_Integer , TColStd_MapIntegerHasher> {
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
%template(TColStd_Array2OfCharacter) NCollection_Array2 <Standard_Character>;
%template(TColStd_IndexedMapOfTransient) NCollection_IndexedMap <opencascade::handle <Standard_Transient>, TColStd_MapTransientHasher>;
%template(TColStd_Array1OfReal) NCollection_Array1 <Standard_Real>;

%extend NCollection_Array1 <Standard_Real> {
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
%template(TColStd_MapOfInteger) NCollection_Map <Standard_Integer , TColStd_MapIntegerHasher>;
%template(TColStd_SequenceOfAsciiString) NCollection_Sequence <TCollection_AsciiString>;
%template(TColStd_Array1OfByte) NCollection_Array1 <Standard_Byte>;

%extend NCollection_Array1 <Standard_Byte> {
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
%template(TColStd_ListOfAsciiString) NCollection_List <TCollection_AsciiString>;
%template(TColStd_ListIteratorOfListOfAsciiString) NCollection_TListIterator<TCollection_AsciiString>;
%template(TColStd_Array2OfReal) NCollection_Array2 <Standard_Real>;
%template(TColStd_MapOfTransient) NCollection_Map <opencascade::handle <Standard_Transient>, TColStd_MapTransientHasher>;
%template(TColStd_ListOfTransient) NCollection_List <opencascade::handle <Standard_Transient>>;
%template(TColStd_ListIteratorOfListOfTransient) NCollection_TListIterator<opencascade::handle<Standard_Transient>>;
%template(TColStd_SequenceOfTransient) NCollection_Sequence <opencascade::handle <Standard_Transient>>;
%template(TColStd_SequenceOfInteger) NCollection_Sequence <Standard_Integer>;
%template(TColStd_Array1OfBoolean) NCollection_Array1 <Standard_Boolean>;

%extend NCollection_Array1 <Standard_Boolean> {
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
%template(TColStd_SequenceOfBoolean) NCollection_Sequence <Standard_Boolean>;
%template(TColStd_DataMapOfTransientTransient) NCollection_DataMap <opencascade::handle <Standard_Transient>, opencascade::handle <Standard_Transient>, TColStd_MapTransientHasher>;
%template(TColStd_Array1OfListOfInteger) NCollection_Array1 <TColStd_ListOfInteger>;

%extend NCollection_Array1 <TColStd_ListOfInteger> {
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
%template(TColStd_Array2OfInteger) NCollection_Array2 <Standard_Integer>;
%template(TColStd_SequenceOfHExtendedString) NCollection_Sequence <opencascade::handle <TCollection_HExtendedString>>;
%template(TColStd_IndexedDataMapOfStringString) NCollection_IndexedDataMap <TCollection_AsciiString , TCollection_AsciiString , TCollection_AsciiString>;
%template(TColStd_SequenceOfReal) NCollection_Sequence <Standard_Real>;
%template(TColStd_MapOfReal) NCollection_Map <Standard_Real , TColStd_MapRealHasher>;
%template(TColStd_ListOfReal) NCollection_List <Standard_Real>;
%template(TColStd_ListIteratorOfListOfReal) NCollection_TListIterator<Standard_Real>;
%template(TColStd_MapIntegerHasher) NCollection_DefaultHasher <Standard_Integer>;
%template(TColStd_Array1OfInteger) NCollection_Array1 <Standard_Integer>;

%extend NCollection_Array1 <Standard_Integer> {
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
%template(TColStd_Array2OfTransient) NCollection_Array2 <opencascade::handle <Standard_Transient>>;
%template(TColStd_DataMapOfIntegerReal) NCollection_DataMap <Standard_Integer , Standard_Real , TColStd_MapIntegerHasher>;

%extend NCollection_DataMap <Standard_Integer , Standard_Real , TColStd_MapIntegerHasher> {
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
%template(TColStd_DataMapOfIntegerListOfInteger) NCollection_DataMap <Standard_Integer , TColStd_ListOfInteger , TColStd_MapIntegerHasher>;

%extend NCollection_DataMap <Standard_Integer , TColStd_ListOfInteger , TColStd_MapIntegerHasher> {
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
%template(TColStd_IndexedMapOfInteger) NCollection_IndexedMap <Standard_Integer , TColStd_MapIntegerHasher>;
%template(TColStd_MapTransientHasher) NCollection_DefaultHasher <opencascade::handle <Standard_Transient>>;
%template(TColStd_SequenceOfExtendedString) NCollection_Sequence <TCollection_ExtendedString>;
%template(TColStd_IndexedDataMapOfTransientTransient) NCollection_IndexedDataMap <opencascade::handle <Standard_Transient>, opencascade::handle <Standard_Transient>, TColStd_MapTransientHasher>;
%template(TColStd_Array1OfTransient) NCollection_Array1 <opencascade::handle <Standard_Transient>>;

%extend NCollection_Array1 <opencascade::handle <Standard_Transient>> {
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
%template(TColStd_SequenceOfHAsciiString) NCollection_Sequence <opencascade::handle <TCollection_HAsciiString>>;
%template(TColStd_Array1OfCharacter) NCollection_Array1 <Standard_Character>;

%extend NCollection_Array1 <Standard_Character> {
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
%template(TColStd_Array1OfAsciiString) NCollection_Array1 <TCollection_AsciiString>;

%extend NCollection_Array1 <TCollection_AsciiString> {
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
%template(TColStd_MapOfAsciiString) NCollection_Map <TCollection_AsciiString , TCollection_AsciiString>;
%template(TColStd_MapRealHasher) NCollection_DefaultHasher <Standard_Real>;
%template(TColStd_DataMapOfStringInteger) NCollection_DataMap <TCollection_ExtendedString , Standard_Integer , TCollection_ExtendedString>;
%template(TColStd_IndexedMapOfReal) NCollection_IndexedMap <Standard_Real , TColStd_MapRealHasher>;
%template(TColStd_Array1OfExtendedString) NCollection_Array1 <TCollection_ExtendedString>;

%extend NCollection_Array1 <TCollection_ExtendedString> {
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
%template(TColStd_DataMapOfAsciiStringInteger) NCollection_DataMap <TCollection_AsciiString , Standard_Integer , TCollection_AsciiString>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Array2 <Standard_Boolean> TColStd_Array2OfBoolean;
typedef NCollection_DataMap <Standard_Integer , opencascade::handle <Standard_Transient>, TColStd_MapIntegerHasher> TColStd_DataMapOfIntegerTransient;
typedef NCollection_DataMap <Standard_Integer , opencascade::handle <Standard_Transient>, TColStd_MapIntegerHasher>::Iterator TColStd_DataMapIteratorOfDataMapOfIntegerTransient;
typedef NCollection_List <Standard_Integer> TColStd_ListOfInteger;
typedef NCollection_List <Standard_Integer>::Iterator TColStd_ListIteratorOfListOfInteger;
typedef NCollection_Sequence <Standard_Address> TColStd_SequenceOfAddress;
typedef NCollection_DataMap <Standard_Integer , Standard_Integer , TColStd_MapIntegerHasher> TColStd_DataMapOfIntegerInteger;
typedef NCollection_DataMap <Standard_Integer , Standard_Integer , TColStd_MapIntegerHasher>::Iterator TColStd_DataMapIteratorOfDataMapOfIntegerInteger;
typedef NCollection_Array2 <Standard_Character> TColStd_Array2OfCharacter;
typedef NCollection_IndexedMap <opencascade::handle <Standard_Transient>, TColStd_MapTransientHasher> TColStd_IndexedMapOfTransient;
typedef NCollection_Array1 <Standard_Real> TColStd_Array1OfReal;
typedef TColStd_PackedMapOfInteger::Iterator TColStd_MapIteratorOfPackedMapOfInteger;
typedef NCollection_Map <Standard_Integer , TColStd_MapIntegerHasher> TColStd_MapOfInteger;
typedef NCollection_Map <Standard_Integer , TColStd_MapIntegerHasher>::Iterator TColStd_MapIteratorOfMapOfInteger;
typedef NCollection_Sequence <TCollection_AsciiString> TColStd_SequenceOfAsciiString;
typedef NCollection_Array1 <Standard_Byte> TColStd_Array1OfByte;
typedef NCollection_List <TCollection_AsciiString> TColStd_ListOfAsciiString;
typedef NCollection_List <TCollection_AsciiString>::Iterator TColStd_ListIteratorOfListOfAsciiString;
typedef NCollection_Array2 <Standard_Real> TColStd_Array2OfReal;
typedef NCollection_Map <opencascade::handle <Standard_Transient>, TColStd_MapTransientHasher> TColStd_MapOfTransient;
typedef NCollection_Map <opencascade::handle <Standard_Transient>, TColStd_MapTransientHasher>::Iterator TColStd_MapIteratorOfMapOfTransient;
typedef NCollection_List <opencascade::handle <Standard_Transient>> TColStd_ListOfTransient;
typedef NCollection_List <opencascade::handle <Standard_Transient>>::Iterator TColStd_ListIteratorOfListOfTransient;
typedef NCollection_Sequence <opencascade::handle <Standard_Transient>> TColStd_SequenceOfTransient;
typedef NCollection_Sequence <Standard_Integer> TColStd_SequenceOfInteger;
typedef NCollection_Array1 <Standard_Boolean> TColStd_Array1OfBoolean;
typedef NCollection_Sequence <Standard_Boolean> TColStd_SequenceOfBoolean;
typedef NCollection_DataMap <opencascade::handle <Standard_Transient>, opencascade::handle <Standard_Transient>, TColStd_MapTransientHasher> TColStd_DataMapOfTransientTransient;
typedef NCollection_DataMap <opencascade::handle <Standard_Transient>, opencascade::handle <Standard_Transient>, TColStd_MapTransientHasher>::Iterator TColStd_DataMapIteratorOfDataMapOfTransientTransient;
typedef NCollection_Array1 <TColStd_ListOfInteger> TColStd_Array1OfListOfInteger;
typedef NCollection_Array2 <Standard_Integer> TColStd_Array2OfInteger;
typedef NCollection_Sequence <opencascade::handle <TCollection_HExtendedString>> TColStd_SequenceOfHExtendedString;
typedef NCollection_IndexedDataMap <TCollection_AsciiString , TCollection_AsciiString , TCollection_AsciiString> TColStd_IndexedDataMapOfStringString;
typedef NCollection_Sequence <Standard_Real> TColStd_SequenceOfReal;
typedef NCollection_Map <Standard_Real , TColStd_MapRealHasher> TColStd_MapOfReal;
typedef NCollection_Map <Standard_Real , TColStd_MapRealHasher>::Iterator TColStd_MapIteratorOfMapOfReal;
typedef NCollection_List <Standard_Real> TColStd_ListOfReal;
typedef NCollection_List <Standard_Real>::Iterator TColStd_ListIteratorOfListOfReal;
typedef NCollection_DefaultHasher <Standard_Integer> TColStd_MapIntegerHasher;
typedef NCollection_Array1 <Standard_Integer> TColStd_Array1OfInteger;
typedef NCollection_Array2 <opencascade::handle <Standard_Transient>> TColStd_Array2OfTransient;
typedef NCollection_DataMap <Standard_Integer , Standard_Real , TColStd_MapIntegerHasher> TColStd_DataMapOfIntegerReal;
typedef NCollection_DataMap <Standard_Integer , Standard_Real , TColStd_MapIntegerHasher>::Iterator TColStd_DataMapIteratorOfDataMapOfIntegerReal;
typedef NCollection_DataMap <Standard_Integer , TColStd_ListOfInteger , TColStd_MapIntegerHasher> TColStd_DataMapOfIntegerListOfInteger;
typedef NCollection_DataMap <Standard_Integer , TColStd_ListOfInteger , TColStd_MapIntegerHasher>::Iterator TColStd_DataMapIteratorOfDataMapOfIntegerListOfInteger;
typedef NCollection_IndexedMap <Standard_Integer , TColStd_MapIntegerHasher> TColStd_IndexedMapOfInteger;
typedef NCollection_DefaultHasher <opencascade::handle <Standard_Transient>> TColStd_MapTransientHasher;
typedef NCollection_Sequence <TCollection_ExtendedString> TColStd_SequenceOfExtendedString;
typedef NCollection_IndexedDataMap <opencascade::handle <Standard_Transient>, opencascade::handle <Standard_Transient>, TColStd_MapTransientHasher> TColStd_IndexedDataMapOfTransientTransient;
typedef NCollection_Array1 <opencascade::handle <Standard_Transient>> TColStd_Array1OfTransient;
typedef NCollection_Sequence <opencascade::handle <TCollection_HAsciiString>> TColStd_SequenceOfHAsciiString;
typedef NCollection_Array1 <Standard_Character> TColStd_Array1OfCharacter;
typedef NCollection_Array1 <TCollection_AsciiString> TColStd_Array1OfAsciiString;
typedef NCollection_Map <TCollection_AsciiString , TCollection_AsciiString> TColStd_MapOfAsciiString;
typedef NCollection_Map <TCollection_AsciiString , TCollection_AsciiString>::Iterator TColStd_MapIteratorOfMapOfAsciiString;
typedef NCollection_DefaultHasher <Standard_Real> TColStd_MapRealHasher;
typedef NCollection_DataMap <TCollection_ExtendedString , Standard_Integer , TCollection_ExtendedString> TColStd_DataMapOfStringInteger;
typedef NCollection_DataMap <TCollection_ExtendedString , Standard_Integer , TCollection_ExtendedString>::Iterator TColStd_DataMapIteratorOfDataMapOfStringInteger;
typedef NCollection_IndexedMap <Standard_Real , TColStd_MapRealHasher> TColStd_IndexedMapOfReal;
typedef NCollection_Array1 <TCollection_ExtendedString> TColStd_Array1OfExtendedString;
typedef NCollection_DataMap <TCollection_AsciiString , Standard_Integer , TCollection_AsciiString> TColStd_DataMapOfAsciiStringInteger;
typedef NCollection_DataMap <TCollection_AsciiString , Standard_Integer , TCollection_AsciiString>::Iterator TColStd_DataMapIteratorOfDataMapOfAsciiStringInteger;
/* end typedefs declaration */

/************************************
* class TColStd_HPackedMapOfInteger *
************************************/
class TColStd_HPackedMapOfInteger : public Standard_Transient {
	public:
		/****************** ChangeMap ******************/
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", ":rtype: TColStd_PackedMapOfInteger") ChangeMap;
		TColStd_PackedMapOfInteger & ChangeMap ();

		/****************** Map ******************/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", ":rtype: TColStd_PackedMapOfInteger") Map;
		const TColStd_PackedMapOfInteger & Map ();

		/****************** TColStd_HPackedMapOfInteger ******************/
		%feature("compactdefaultargs") TColStd_HPackedMapOfInteger;
		%feature("autodoc", ":param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None") TColStd_HPackedMapOfInteger;
		 TColStd_HPackedMapOfInteger (const Standard_Integer NbBuckets = 1);

		/****************** TColStd_HPackedMapOfInteger ******************/
		%feature("compactdefaultargs") TColStd_HPackedMapOfInteger;
		%feature("autodoc", ":param theOther:
	:type theOther: TColStd_PackedMapOfInteger
	:rtype: None") TColStd_HPackedMapOfInteger;
		 TColStd_HPackedMapOfInteger (const TColStd_PackedMapOfInteger & theOther);

};


%make_alias(TColStd_HPackedMapOfInteger)

%extend TColStd_HPackedMapOfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
class TColStd_HArray1OfExtendedString : public  TColStd_Array1OfExtendedString, public Standard_Transient {
  public:
    TColStd_HArray1OfExtendedString(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColStd_HArray1OfExtendedString(const Standard_Integer theLower, const Standard_Integer theUpper, const  TColStd_Array1OfExtendedString::value_type& theValue);
    TColStd_HArray1OfExtendedString(const  TColStd_Array1OfExtendedString& theOther);
    const  TColStd_Array1OfExtendedString& Array1();
     TColStd_Array1OfExtendedString& ChangeArray1();
};
%make_alias(TColStd_HArray1OfExtendedString)


class TColStd_HArray1OfCharacter : public  TColStd_Array1OfCharacter, public Standard_Transient {
  public:
    TColStd_HArray1OfCharacter(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColStd_HArray1OfCharacter(const Standard_Integer theLower, const Standard_Integer theUpper, const  TColStd_Array1OfCharacter::value_type& theValue);
    TColStd_HArray1OfCharacter(const  TColStd_Array1OfCharacter& theOther);
    const  TColStd_Array1OfCharacter& Array1();
     TColStd_Array1OfCharacter& ChangeArray1();
};
%make_alias(TColStd_HArray1OfCharacter)


class TColStd_HArray1OfBoolean : public  TColStd_Array1OfBoolean, public Standard_Transient {
  public:
    TColStd_HArray1OfBoolean(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColStd_HArray1OfBoolean(const Standard_Integer theLower, const Standard_Integer theUpper, const  TColStd_Array1OfBoolean::value_type& theValue);
    TColStd_HArray1OfBoolean(const  TColStd_Array1OfBoolean& theOther);
    const  TColStd_Array1OfBoolean& Array1();
     TColStd_Array1OfBoolean& ChangeArray1();
};
%make_alias(TColStd_HArray1OfBoolean)


class TColStd_HArray1OfAsciiString : public  TColStd_Array1OfAsciiString, public Standard_Transient {
  public:
    TColStd_HArray1OfAsciiString(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColStd_HArray1OfAsciiString(const Standard_Integer theLower, const Standard_Integer theUpper, const  TColStd_Array1OfAsciiString::value_type& theValue);
    TColStd_HArray1OfAsciiString(const  TColStd_Array1OfAsciiString& theOther);
    const  TColStd_Array1OfAsciiString& Array1();
     TColStd_Array1OfAsciiString& ChangeArray1();
};
%make_alias(TColStd_HArray1OfAsciiString)


class TColStd_HArray1OfReal : public  TColStd_Array1OfReal, public Standard_Transient {
  public:
    TColStd_HArray1OfReal(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColStd_HArray1OfReal(const Standard_Integer theLower, const Standard_Integer theUpper, const  TColStd_Array1OfReal::value_type& theValue);
    TColStd_HArray1OfReal(const  TColStd_Array1OfReal& theOther);
    const  TColStd_Array1OfReal& Array1();
     TColStd_Array1OfReal& ChangeArray1();
};
%make_alias(TColStd_HArray1OfReal)


class TColStd_HArray1OfInteger : public  TColStd_Array1OfInteger, public Standard_Transient {
  public:
    TColStd_HArray1OfInteger(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColStd_HArray1OfInteger(const Standard_Integer theLower, const Standard_Integer theUpper, const  TColStd_Array1OfInteger::value_type& theValue);
    TColStd_HArray1OfInteger(const  TColStd_Array1OfInteger& theOther);
    const  TColStd_Array1OfInteger& Array1();
     TColStd_Array1OfInteger& ChangeArray1();
};
%make_alias(TColStd_HArray1OfInteger)


class TColStd_HArray1OfListOfInteger : public  TColStd_Array1OfListOfInteger, public Standard_Transient {
  public:
    TColStd_HArray1OfListOfInteger(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColStd_HArray1OfListOfInteger(const Standard_Integer theLower, const Standard_Integer theUpper, const  TColStd_Array1OfListOfInteger::value_type& theValue);
    TColStd_HArray1OfListOfInteger(const  TColStd_Array1OfListOfInteger& theOther);
    const  TColStd_Array1OfListOfInteger& Array1();
     TColStd_Array1OfListOfInteger& ChangeArray1();
};
%make_alias(TColStd_HArray1OfListOfInteger)


class TColStd_HArray1OfTransient : public  TColStd_Array1OfTransient, public Standard_Transient {
  public:
    TColStd_HArray1OfTransient(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColStd_HArray1OfTransient(const Standard_Integer theLower, const Standard_Integer theUpper, const  TColStd_Array1OfTransient::value_type& theValue);
    TColStd_HArray1OfTransient(const  TColStd_Array1OfTransient& theOther);
    const  TColStd_Array1OfTransient& Array1();
     TColStd_Array1OfTransient& ChangeArray1();
};
%make_alias(TColStd_HArray1OfTransient)


class TColStd_HArray1OfByte : public  TColStd_Array1OfByte, public Standard_Transient {
  public:
    TColStd_HArray1OfByte(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColStd_HArray1OfByte(const Standard_Integer theLower, const Standard_Integer theUpper, const  TColStd_Array1OfByte::value_type& theValue);
    TColStd_HArray1OfByte(const  TColStd_Array1OfByte& theOther);
    const  TColStd_Array1OfByte& Array1();
     TColStd_Array1OfByte& ChangeArray1();
};
%make_alias(TColStd_HArray1OfByte)


/* harray2 classes */
class TColStd_HArray2OfBoolean : public  TColStd_Array2OfBoolean, public Standard_Transient {
  public:
    TColStd_HArray2OfBoolean(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    TColStd_HArray2OfBoolean(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const  TColStd_Array2OfBoolean::value_type& theValue);
    TColStd_HArray2OfBoolean(const  TColStd_Array2OfBoolean& theOther);
    const  TColStd_Array2OfBoolean& Array2 ();
     TColStd_Array2OfBoolean& ChangeArray2 (); 
};
%make_alias(TColStd_HArray2OfBoolean)


class TColStd_HArray2OfTransient : public  TColStd_Array2OfTransient, public Standard_Transient {
  public:
    TColStd_HArray2OfTransient(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    TColStd_HArray2OfTransient(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const  TColStd_Array2OfTransient::value_type& theValue);
    TColStd_HArray2OfTransient(const  TColStd_Array2OfTransient& theOther);
    const  TColStd_Array2OfTransient& Array2 ();
     TColStd_Array2OfTransient& ChangeArray2 (); 
};
%make_alias(TColStd_HArray2OfTransient)


class TColStd_HArray2OfReal : public  TColStd_Array2OfReal, public Standard_Transient {
  public:
    TColStd_HArray2OfReal(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    TColStd_HArray2OfReal(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const  TColStd_Array2OfReal::value_type& theValue);
    TColStd_HArray2OfReal(const  TColStd_Array2OfReal& theOther);
    const  TColStd_Array2OfReal& Array2 ();
     TColStd_Array2OfReal& ChangeArray2 (); 
};
%make_alias(TColStd_HArray2OfReal)


class TColStd_HArray2OfInteger : public  TColStd_Array2OfInteger, public Standard_Transient {
  public:
    TColStd_HArray2OfInteger(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    TColStd_HArray2OfInteger(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const  TColStd_Array2OfInteger::value_type& theValue);
    TColStd_HArray2OfInteger(const  TColStd_Array2OfInteger& theOther);
    const  TColStd_Array2OfInteger& Array2 ();
     TColStd_Array2OfInteger& ChangeArray2 (); 
};
%make_alias(TColStd_HArray2OfInteger)


class TColStd_HArray2OfCharacter : public  TColStd_Array2OfCharacter, public Standard_Transient {
  public:
    TColStd_HArray2OfCharacter(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    TColStd_HArray2OfCharacter(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const  TColStd_Array2OfCharacter::value_type& theValue);
    TColStd_HArray2OfCharacter(const  TColStd_Array2OfCharacter& theOther);
    const  TColStd_Array2OfCharacter& Array2 ();
     TColStd_Array2OfCharacter& ChangeArray2 (); 
};
%make_alias(TColStd_HArray2OfCharacter)


/* hsequence classes */
class TColStd_HSequenceOfHAsciiString : public  TColStd_SequenceOfHAsciiString, public Standard_Transient {
  public:
    TColStd_HSequenceOfHAsciiString();
    TColStd_HSequenceOfHAsciiString(const  TColStd_SequenceOfHAsciiString& theOther);
    const  TColStd_SequenceOfHAsciiString& Sequence();
    void Append (const  TColStd_SequenceOfHAsciiString::value_type& theItem);
    void Append ( TColStd_SequenceOfHAsciiString& theSequence);
     TColStd_SequenceOfHAsciiString& ChangeSequence();
};
%make_alias(TColStd_HSequenceOfHAsciiString)


class TColStd_HSequenceOfTransient : public  TColStd_SequenceOfTransient, public Standard_Transient {
  public:
    TColStd_HSequenceOfTransient();
    TColStd_HSequenceOfTransient(const  TColStd_SequenceOfTransient& theOther);
    const  TColStd_SequenceOfTransient& Sequence();
    void Append (const  TColStd_SequenceOfTransient::value_type& theItem);
    void Append ( TColStd_SequenceOfTransient& theSequence);
     TColStd_SequenceOfTransient& ChangeSequence();
};
%make_alias(TColStd_HSequenceOfTransient)


class TColStd_HSequenceOfAsciiString : public  TColStd_SequenceOfAsciiString, public Standard_Transient {
  public:
    TColStd_HSequenceOfAsciiString();
    TColStd_HSequenceOfAsciiString(const  TColStd_SequenceOfAsciiString& theOther);
    const  TColStd_SequenceOfAsciiString& Sequence();
    void Append (const  TColStd_SequenceOfAsciiString::value_type& theItem);
    void Append ( TColStd_SequenceOfAsciiString& theSequence);
     TColStd_SequenceOfAsciiString& ChangeSequence();
};
%make_alias(TColStd_HSequenceOfAsciiString)


class TColStd_HSequenceOfHExtendedString : public  TColStd_SequenceOfHExtendedString, public Standard_Transient {
  public:
    TColStd_HSequenceOfHExtendedString();
    TColStd_HSequenceOfHExtendedString(const  TColStd_SequenceOfHExtendedString& theOther);
    const  TColStd_SequenceOfHExtendedString& Sequence();
    void Append (const  TColStd_SequenceOfHExtendedString::value_type& theItem);
    void Append ( TColStd_SequenceOfHExtendedString& theSequence);
     TColStd_SequenceOfHExtendedString& ChangeSequence();
};
%make_alias(TColStd_HSequenceOfHExtendedString)


class TColStd_HSequenceOfInteger : public  TColStd_SequenceOfInteger, public Standard_Transient {
  public:
    TColStd_HSequenceOfInteger();
    TColStd_HSequenceOfInteger(const  TColStd_SequenceOfInteger& theOther);
    const  TColStd_SequenceOfInteger& Sequence();
    void Append (const  TColStd_SequenceOfInteger::value_type& theItem);
    void Append ( TColStd_SequenceOfInteger& theSequence);
     TColStd_SequenceOfInteger& ChangeSequence();
};
%make_alias(TColStd_HSequenceOfInteger)


class TColStd_HSequenceOfExtendedString : public  TColStd_SequenceOfExtendedString, public Standard_Transient {
  public:
    TColStd_HSequenceOfExtendedString();
    TColStd_HSequenceOfExtendedString(const  TColStd_SequenceOfExtendedString& theOther);
    const  TColStd_SequenceOfExtendedString& Sequence();
    void Append (const  TColStd_SequenceOfExtendedString::value_type& theItem);
    void Append ( TColStd_SequenceOfExtendedString& theSequence);
     TColStd_SequenceOfExtendedString& ChangeSequence();
};
%make_alias(TColStd_HSequenceOfExtendedString)


class TColStd_HSequenceOfReal : public  TColStd_SequenceOfReal, public Standard_Transient {
  public:
    TColStd_HSequenceOfReal();
    TColStd_HSequenceOfReal(const  TColStd_SequenceOfReal& theOther);
    const  TColStd_SequenceOfReal& Sequence();
    void Append (const  TColStd_SequenceOfReal::value_type& theItem);
    void Append ( TColStd_SequenceOfReal& theSequence);
     TColStd_SequenceOfReal& ChangeSequence();
};
%make_alias(TColStd_HSequenceOfReal)


