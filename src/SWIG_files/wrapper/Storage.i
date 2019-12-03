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

/* templates */
%template(Storage_PType) NCollection_IndexedDataMap <TCollection_AsciiString , Standard_Integer , TCollection_AsciiString>;
%template(Storage_ArrayOfCallBack) NCollection_Array1 <opencascade::handle <Storage_CallBack>>;

%extend NCollection_Array1 <opencascade::handle <Storage_CallBack>> {
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
%template(Storage_MapOfPers) NCollection_DataMap <TCollection_AsciiString , opencascade::handle <Storage_Root>, TCollection_AsciiString>;
%template(Storage_MapOfCallBack) NCollection_DataMap <TCollection_AsciiString , opencascade::handle <Storage_TypedCallBack>, TCollection_AsciiString>;
%template(Storage_ArrayOfSchema) NCollection_Array1 <opencascade::handle <Storage_Schema>>;

%extend NCollection_Array1 <opencascade::handle <Storage_Schema>> {
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
%template(Storage_SeqOfRoot) NCollection_Sequence <opencascade::handle <Storage_Root>>;
/* end templates declaration */

/* typedefs */
typedef NCollection_IndexedDataMap <TCollection_AsciiString , Standard_Integer , TCollection_AsciiString> Storage_PType;
typedef NCollection_Array1 <opencascade::handle <Storage_CallBack>> Storage_ArrayOfCallBack;
typedef NCollection_DataMap <TCollection_AsciiString , opencascade::handle <Storage_Root>, TCollection_AsciiString> Storage_MapOfPers;
typedef NCollection_DataMap <TCollection_AsciiString , opencascade::handle <Storage_Root>, TCollection_AsciiString>::Iterator Storage_DataMapIteratorOfMapOfPers;
typedef long Storage_Position;
typedef NCollection_DataMap <TCollection_AsciiString , opencascade::handle <Storage_TypedCallBack>, TCollection_AsciiString> Storage_MapOfCallBack;
typedef NCollection_DataMap <TCollection_AsciiString , opencascade::handle <Storage_TypedCallBack>, TCollection_AsciiString>::Iterator Storage_DataMapIteratorOfMapOfCallBack;
typedef NCollection_Array1 <opencascade::handle <Storage_Schema>> Storage_ArrayOfSchema;
typedef NCollection_Sequence <opencascade::handle <Storage_Root>> Storage_SeqOfRoot;
/* end typedefs declaration */

/* harray1 classes */
class Storage_HArrayOfSchema : public  Storage_ArrayOfSchema, public Standard_Transient {
  public:
    Storage_HArrayOfSchema(const Standard_Integer theLower, const Standard_Integer theUpper);
    Storage_HArrayOfSchema(const Standard_Integer theLower, const Standard_Integer theUpper, const  Storage_ArrayOfSchema::value_type& theValue);
    Storage_HArrayOfSchema(const  Storage_ArrayOfSchema& theOther);
    const  Storage_ArrayOfSchema& Array1();
     Storage_ArrayOfSchema& ChangeArray1();
};
%make_alias(Storage_HArrayOfSchema)


class Storage_HPArray : public  Storage_PArray, public Standard_Transient {
  public:
    Storage_HPArray(const Standard_Integer theLower, const Standard_Integer theUpper);
    Storage_HPArray(const Standard_Integer theLower, const Standard_Integer theUpper, const  Storage_PArray::value_type& theValue);
    Storage_HPArray(const  Storage_PArray& theOther);
    const  Storage_PArray& Array1();
     Storage_PArray& ChangeArray1();
};
%make_alias(Storage_HPArray)


class Storage_HArrayOfCallBack : public  Storage_ArrayOfCallBack, public Standard_Transient {
  public:
    Storage_HArrayOfCallBack(const Standard_Integer theLower, const Standard_Integer theUpper);
    Storage_HArrayOfCallBack(const Standard_Integer theLower, const Standard_Integer theUpper, const  Storage_ArrayOfCallBack::value_type& theValue);
    Storage_HArrayOfCallBack(const  Storage_ArrayOfCallBack& theOther);
    const  Storage_ArrayOfCallBack& Array1();
     Storage_ArrayOfCallBack& ChangeArray1();
};
%make_alias(Storage_HArrayOfCallBack)


/* harray2 classes */
/* hsequence classes */
class Storage_HSeqOfRoot : public  Storage_SeqOfRoot, public Standard_Transient {
  public:
    Storage_HSeqOfRoot();
    Storage_HSeqOfRoot(const  Storage_SeqOfRoot& theOther);
    const  Storage_SeqOfRoot& Sequence();
    void Append (const  Storage_SeqOfRoot::value_type& theItem);
    void Append ( Storage_SeqOfRoot& theSequence);
     Storage_SeqOfRoot& ChangeSequence();
};
%make_alias(Storage_HSeqOfRoot)


