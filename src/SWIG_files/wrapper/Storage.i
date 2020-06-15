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
%define STORAGEDOCSTRING
"Storage module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_storage.html"
%enddef
%module (package="OCC.Core", docstring=STORAGEDOCSTRING) Storage


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
#include<Storage_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Standard_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum Storage_SolveMode {
	Storage_AddSolve = 0,
	Storage_WriteSolve = 1,
	Storage_ReadSolve = 2,
};

enum Storage_Error {
	Storage_VSOk = 0,
	Storage_VSOpenError = 1,
	Storage_VSModeError = 2,
	Storage_VSCloseError = 3,
	Storage_VSAlreadyOpen = 4,
	Storage_VSNotOpen = 5,
	Storage_VSSectionNotFound = 6,
	Storage_VSWriteError = 7,
	Storage_VSFormatError = 8,
	Storage_VSUnknownType = 9,
	Storage_VSTypeMismatch = 10,
	Storage_VSInternalError = 11,
	Storage_VSExtCharParityError = 12,
	Storage_VSWrongFileDriver = 13,
};

enum Storage_OpenMode {
	Storage_VSNone = 0,
	Storage_VSRead = 1,
	Storage_VSWrite = 2,
	Storage_VSReadWrite = 3,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class Storage_SolveMode(IntEnum):
	Storage_AddSolve = 0
	Storage_WriteSolve = 1
	Storage_ReadSolve = 2
Storage_AddSolve = Storage_SolveMode.Storage_AddSolve
Storage_WriteSolve = Storage_SolveMode.Storage_WriteSolve
Storage_ReadSolve = Storage_SolveMode.Storage_ReadSolve

class Storage_Error(IntEnum):
	Storage_VSOk = 0
	Storage_VSOpenError = 1
	Storage_VSModeError = 2
	Storage_VSCloseError = 3
	Storage_VSAlreadyOpen = 4
	Storage_VSNotOpen = 5
	Storage_VSSectionNotFound = 6
	Storage_VSWriteError = 7
	Storage_VSFormatError = 8
	Storage_VSUnknownType = 9
	Storage_VSTypeMismatch = 10
	Storage_VSInternalError = 11
	Storage_VSExtCharParityError = 12
	Storage_VSWrongFileDriver = 13
Storage_VSOk = Storage_Error.Storage_VSOk
Storage_VSOpenError = Storage_Error.Storage_VSOpenError
Storage_VSModeError = Storage_Error.Storage_VSModeError
Storage_VSCloseError = Storage_Error.Storage_VSCloseError
Storage_VSAlreadyOpen = Storage_Error.Storage_VSAlreadyOpen
Storage_VSNotOpen = Storage_Error.Storage_VSNotOpen
Storage_VSSectionNotFound = Storage_Error.Storage_VSSectionNotFound
Storage_VSWriteError = Storage_Error.Storage_VSWriteError
Storage_VSFormatError = Storage_Error.Storage_VSFormatError
Storage_VSUnknownType = Storage_Error.Storage_VSUnknownType
Storage_VSTypeMismatch = Storage_Error.Storage_VSTypeMismatch
Storage_VSInternalError = Storage_Error.Storage_VSInternalError
Storage_VSExtCharParityError = Storage_Error.Storage_VSExtCharParityError
Storage_VSWrongFileDriver = Storage_Error.Storage_VSWrongFileDriver

class Storage_OpenMode(IntEnum):
	Storage_VSNone = 0
	Storage_VSRead = 1
	Storage_VSWrite = 2
	Storage_VSReadWrite = 3
Storage_VSNone = Storage_OpenMode.Storage_VSNone
Storage_VSRead = Storage_OpenMode.Storage_VSRead
Storage_VSWrite = Storage_OpenMode.Storage_VSWrite
Storage_VSReadWrite = Storage_OpenMode.Storage_VSReadWrite
};
/* end python proxy for enums */

/* templates */
%template(Storage_ArrayOfCallBack) NCollection_Array1<opencascade::handle<Storage_CallBack>>;

%extend NCollection_Array1<opencascade::handle<Storage_CallBack>> {
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
%template(Storage_ArrayOfSchema) NCollection_Array1<opencascade::handle<Storage_Schema>>;

%extend NCollection_Array1<opencascade::handle<Storage_Schema>> {
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
%template(Storage_MapOfCallBack) NCollection_DataMap<TCollection_AsciiString,opencascade::handle<Storage_TypedCallBack>,TCollection_AsciiString>;
%template(Storage_MapOfPers) NCollection_DataMap<TCollection_AsciiString,opencascade::handle<Storage_Root>,TCollection_AsciiString>;
%template(Storage_PType) NCollection_IndexedDataMap<TCollection_AsciiString,Standard_Integer,TCollection_AsciiString>;
%template(Storage_SeqOfRoot) NCollection_Sequence<opencascade::handle<Storage_Root>>;

%extend NCollection_Sequence<opencascade::handle<Storage_Root>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<opencascade::handle<Storage_CallBack>> Storage_ArrayOfCallBack;
typedef NCollection_Array1<opencascade::handle<Storage_Schema>> Storage_ArrayOfSchema;
typedef NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Storage_TypedCallBack>, TCollection_AsciiString>::Iterator Storage_DataMapIteratorOfMapOfCallBack;
typedef NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Storage_Root>, TCollection_AsciiString>::Iterator Storage_DataMapIteratorOfMapOfPers;
typedef NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Storage_TypedCallBack>, TCollection_AsciiString> Storage_MapOfCallBack;
typedef NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Storage_Root>, TCollection_AsciiString> Storage_MapOfPers;
typedef NCollection_IndexedDataMap<TCollection_AsciiString, Standard_Integer, TCollection_AsciiString> Storage_PType;
typedef long Storage_Position;
typedef NCollection_Sequence<opencascade::handle<Storage_Root>> Storage_SeqOfRoot;
/* end typedefs declaration */

/****************
* class Storage *
****************/
/***************************
* class Storage_BaseDriver *
***************************/
/***********************
* class Storage_Bucket *
***********************/
/*******************************
* class Storage_BucketIterator *
*******************************/
/***********************************
* class Storage_BucketOfPersistent *
***********************************/
/*************************
* class Storage_CallBack *
*************************/
/*********************
* class Storage_Data *
*********************/
/***************************
* class Storage_HeaderData *
***************************/
/*****************************
* class Storage_InternalData *
*****************************/
/*********************
* class Storage_Root *
*********************/
/*************************
* class Storage_RootData *
*************************/
/***********************
* class Storage_Schema *
***********************/
/*************************
* class Storage_TypeData *
*************************/
/******************************
* class Storage_TypedCallBack *
******************************/
/********************************
* class Storage_DefaultCallBack *
********************************/
/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class Storage_Bucket:
	pass

@classnotwrapped
class Storage_BucketOfPersistent:
	pass

@classnotwrapped
class Storage_BucketIterator:
	pass

@classnotwrapped
class Storage_RootData:
	pass

@classnotwrapped
class Storage_TypeData:
	pass

@classnotwrapped
class Storage_Root:
	pass

@classnotwrapped
class Storage_Schema:
	pass

@classnotwrapped
class Storage_DefaultCallBack:
	pass

@classnotwrapped
class Storage_TypedCallBack:
	pass

@classnotwrapped
class Storage_CallBack:
	pass

@classnotwrapped
class Storage_HeaderData:
	pass

@classnotwrapped
class Storage_BaseDriver:
	pass

@classnotwrapped
class Storage_InternalData:
	pass

@classnotwrapped
class Storage_Data:
	pass

@classnotwrapped
class Storage:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */

class Storage_HArrayOfSchema : public Storage_ArrayOfSchema, public Standard_Transient {
  public:
    Storage_HArrayOfSchema(const Standard_Integer theLower, const Standard_Integer theUpper);
    Storage_HArrayOfSchema(const Standard_Integer theLower, const Standard_Integer theUpper, const Storage_ArrayOfSchema::value_type& theValue);
    Storage_HArrayOfSchema(const Storage_ArrayOfSchema& theOther);
    const Storage_ArrayOfSchema& Array1();
    Storage_ArrayOfSchema& ChangeArray1();
};
%make_alias(Storage_HArrayOfSchema)


class Storage_HPArray : public Storage_PArray, public Standard_Transient {
  public:
    Storage_HPArray(const Standard_Integer theLower, const Standard_Integer theUpper);
    Storage_HPArray(const Standard_Integer theLower, const Standard_Integer theUpper, const Storage_PArray::value_type& theValue);
    Storage_HPArray(const Storage_PArray& theOther);
    const Storage_PArray& Array1();
    Storage_PArray& ChangeArray1();
};
%make_alias(Storage_HPArray)


class Storage_HArrayOfCallBack : public Storage_ArrayOfCallBack, public Standard_Transient {
  public:
    Storage_HArrayOfCallBack(const Standard_Integer theLower, const Standard_Integer theUpper);
    Storage_HArrayOfCallBack(const Standard_Integer theLower, const Standard_Integer theUpper, const Storage_ArrayOfCallBack::value_type& theValue);
    Storage_HArrayOfCallBack(const Storage_ArrayOfCallBack& theOther);
    const Storage_ArrayOfCallBack& Array1();
    Storage_ArrayOfCallBack& ChangeArray1();
};
%make_alias(Storage_HArrayOfCallBack)

/* harray2 classes */
/* hsequence classes */
class Storage_HSeqOfRoot : public Storage_SeqOfRoot, public Standard_Transient {
  public:
    Storage_HSeqOfRoot();
    Storage_HSeqOfRoot(const Storage_SeqOfRoot& theOther);
    const Storage_SeqOfRoot& Sequence();
    void Append (const Storage_SeqOfRoot::value_type& theItem);
    void Append (Storage_SeqOfRoot& theSequence);
    Storage_SeqOfRoot& ChangeSequence();
};
%make_alias(Storage_HSeqOfRoot)


