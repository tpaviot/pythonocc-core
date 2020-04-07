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
%define BINOBJMGTDOCSTRING
"BinObjMgt module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_binobjmgt.html"
%enddef
%module (package="OCC.Core", docstring=BINOBJMGTDOCSTRING) BinObjMgt


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
#include<BinObjMgt_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<TDF_module.hxx>
#include<Storage_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TColStd.i
%import TCollection.i
%import TDF.i
%import Storage.i

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
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
typedef Standard_Byte * BinObjMgt_PByte;
typedef Standard_Character * BinObjMgt_PChar;
typedef Standard_ExtCharacter * BinObjMgt_PExtChar;
typedef Standard_Integer * BinObjMgt_PInteger;
typedef Standard_Real * BinObjMgt_PReal;
typedef Standard_ShortReal * BinObjMgt_PShortReal;
typedef TColStd_IndexedMapOfTransient BinObjMgt_SRelocationTable;
/* end typedefs declaration */

/*****************************
* class BinObjMgt_Persistent *
*****************************/
class BinObjMgt_Persistent {
	public:
		/****************** BinObjMgt_Persistent ******************/
		%feature("compactdefaultargs") BinObjMgt_Persistent;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") BinObjMgt_Persistent;
		 BinObjMgt_Persistent();

		/****************** Destroy ******************/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "Frees the allocated memory; this object can be reused after call to init.

Returns
-------
None
") Destroy;
		void Destroy();

		/****************** GetAsciiString ******************/
		%feature("compactdefaultargs") GetAsciiString;
		%feature("autodoc", "No available documentation.

Parameters
----------
theValue: TCollection_AsciiString

Returns
-------
BinObjMgt_Persistent
") GetAsciiString;
		const BinObjMgt_Persistent & GetAsciiString(TCollection_AsciiString & theValue);

		/****************** GetBoolean ******************/
		%feature("compactdefaultargs") GetBoolean;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
theValue: bool
") GetBoolean;
		const BinObjMgt_Persistent & GetBoolean(Standard_Boolean &OutValue);

		/****************** GetByte ******************/
		%feature("compactdefaultargs") GetByte;
		%feature("autodoc", "No available documentation.

Parameters
----------
theValue: Standard_Byte

Returns
-------
BinObjMgt_Persistent
") GetByte;
		const BinObjMgt_Persistent & GetByte(Standard_Byte & theValue);

		/****************** GetByteArray ******************/
		%feature("compactdefaultargs") GetByteArray;
		%feature("autodoc", "Get c array of unsigned chars, thelength is the number of elements; thearray must point to a space enough to place thelength elements.

Parameters
----------
theArray: BinObjMgt_PByte
theLength: int

Returns
-------
BinObjMgt_Persistent
") GetByteArray;
		const BinObjMgt_Persistent & GetByteArray(const BinObjMgt_PByte theArray, const Standard_Integer theLength);

		/****************** GetCharArray ******************/
		%feature("compactdefaultargs") GetCharArray;
		%feature("autodoc", "Get c array of char, thelength is the number of elements; thearray must point to a space enough to place thelength elements.

Parameters
----------
theArray: BinObjMgt_PChar
theLength: int

Returns
-------
BinObjMgt_Persistent
") GetCharArray;
		const BinObjMgt_Persistent & GetCharArray(const BinObjMgt_PChar theArray, const Standard_Integer theLength);

		/****************** GetCharacter ******************/
		%feature("compactdefaultargs") GetCharacter;
		%feature("autodoc", "No available documentation.

Parameters
----------
theValue: Standard_Character

Returns
-------
BinObjMgt_Persistent
") GetCharacter;
		const BinObjMgt_Persistent & GetCharacter(Standard_Character & theValue);

		/****************** GetExtCharArray ******************/
		%feature("compactdefaultargs") GetExtCharArray;
		%feature("autodoc", "Get c array of extcharacter, thelength is the number of elements; thearray must point to a space enough to place thelength elements.

Parameters
----------
theArray: BinObjMgt_PExtChar
theLength: int

Returns
-------
BinObjMgt_Persistent
") GetExtCharArray;
		const BinObjMgt_Persistent & GetExtCharArray(const BinObjMgt_PExtChar theArray, const Standard_Integer theLength);

		/****************** GetExtCharacter ******************/
		%feature("compactdefaultargs") GetExtCharacter;
		%feature("autodoc", "No available documentation.

Parameters
----------
theValue: Standard_ExtCharacter

Returns
-------
BinObjMgt_Persistent
") GetExtCharacter;
		const BinObjMgt_Persistent & GetExtCharacter(Standard_ExtCharacter & theValue);

		/****************** GetExtendedString ******************/
		%feature("compactdefaultargs") GetExtendedString;
		%feature("autodoc", "No available documentation.

Parameters
----------
theValue: TCollection_ExtendedString

Returns
-------
BinObjMgt_Persistent
") GetExtendedString;
		const BinObjMgt_Persistent & GetExtendedString(TCollection_ExtendedString & theValue);

		/****************** GetGUID ******************/
		%feature("compactdefaultargs") GetGUID;
		%feature("autodoc", "No available documentation.

Parameters
----------
theValue: Standard_GUID

Returns
-------
BinObjMgt_Persistent
") GetGUID;
		const BinObjMgt_Persistent & GetGUID(Standard_GUID & theValue);

		/****************** GetIntArray ******************/
		%feature("compactdefaultargs") GetIntArray;
		%feature("autodoc", "Get c array of int, thelength is the number of elements; thearray must point to a space enough to place thelength elements.

Parameters
----------
theArray: BinObjMgt_PInteger
theLength: int

Returns
-------
BinObjMgt_Persistent
") GetIntArray;
		const BinObjMgt_Persistent & GetIntArray(const BinObjMgt_PInteger theArray, const Standard_Integer theLength);

		/****************** GetInteger ******************/
		%feature("compactdefaultargs") GetInteger;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
theValue: int
") GetInteger;
		const BinObjMgt_Persistent & GetInteger(Standard_Integer &OutValue);

		/****************** GetLabel ******************/
		%feature("compactdefaultargs") GetLabel;
		%feature("autodoc", "No available documentation.

Parameters
----------
theDS: TDF_Data
theValue: TDF_Label

Returns
-------
BinObjMgt_Persistent
") GetLabel;
		const BinObjMgt_Persistent & GetLabel(const opencascade::handle<TDF_Data> & theDS, TDF_Label & theValue);

		/****************** GetReal ******************/
		%feature("compactdefaultargs") GetReal;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
theValue: float
") GetReal;
		const BinObjMgt_Persistent & GetReal(Standard_Real &OutValue);

		/****************** GetRealArray ******************/
		%feature("compactdefaultargs") GetRealArray;
		%feature("autodoc", "Get c array of double, thelength is the number of elements; thearray must point to a space enough to place thelength elements.

Parameters
----------
theArray: BinObjMgt_PReal
theLength: int

Returns
-------
BinObjMgt_Persistent
") GetRealArray;
		const BinObjMgt_Persistent & GetRealArray(const BinObjMgt_PReal theArray, const Standard_Integer theLength);

		/****************** GetShortReal ******************/
		%feature("compactdefaultargs") GetShortReal;
		%feature("autodoc", "No available documentation.

Parameters
----------
theValue: Standard_ShortReal

Returns
-------
BinObjMgt_Persistent
") GetShortReal;
		const BinObjMgt_Persistent & GetShortReal(Standard_ShortReal & theValue);

		/****************** GetShortRealArray ******************/
		%feature("compactdefaultargs") GetShortRealArray;
		%feature("autodoc", "Get c array of float, thelength is the number of elements; thearray must point to a space enough to place thelength elements.

Parameters
----------
theArray: BinObjMgt_PShortReal
theLength: int

Returns
-------
BinObjMgt_Persistent
") GetShortRealArray;
		const BinObjMgt_Persistent & GetShortRealArray(const BinObjMgt_PShortReal theArray, const Standard_Integer theLength);

		/****************** Id ******************/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "Returns the id of the object.

Returns
-------
int
") Id;
		Standard_Integer Id();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes me to reuse again.

Returns
-------
None
") Init;
		void Init();

		/****************** IsError ******************/
		%feature("compactdefaultargs") IsError;
		%feature("autodoc", "Indicates an error after get methods or setposition.

Returns
-------
bool
") IsError;
		Standard_Boolean IsError();

		/****************** IsOK ******************/
		%feature("compactdefaultargs") IsOK;
		%feature("autodoc", "Indicates a good state after get methods or setposition.

Returns
-------
bool
") IsOK;
		Standard_Boolean IsOK();

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Returns the length of data.

Returns
-------
int
") Length;
		Standard_Integer Length();

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Tells the current position for get/put.

Returns
-------
int
") Position;
		Standard_Integer Position();

		/****************** PutAsciiString ******************/
		%feature("compactdefaultargs") PutAsciiString;
		%feature("autodoc", "Offset in output buffer is word-aligned.

Parameters
----------
theValue: TCollection_AsciiString

Returns
-------
BinObjMgt_Persistent
") PutAsciiString;
		BinObjMgt_Persistent & PutAsciiString(const TCollection_AsciiString & theValue);

		/****************** PutBoolean ******************/
		%feature("compactdefaultargs") PutBoolean;
		%feature("autodoc", "No available documentation.

Parameters
----------
theValue: bool

Returns
-------
BinObjMgt_Persistent
") PutBoolean;
		BinObjMgt_Persistent & PutBoolean(const Standard_Boolean theValue);

		/****************** PutByte ******************/
		%feature("compactdefaultargs") PutByte;
		%feature("autodoc", "No available documentation.

Parameters
----------
theValue: Standard_Byte

Returns
-------
BinObjMgt_Persistent
") PutByte;
		BinObjMgt_Persistent & PutByte(const Standard_Byte theValue);

		/****************** PutByteArray ******************/
		%feature("compactdefaultargs") PutByteArray;
		%feature("autodoc", "Put c array of unsigned chars, thelength is the number of elements.

Parameters
----------
theArray: BinObjMgt_PByte
theLength: int

Returns
-------
BinObjMgt_Persistent
") PutByteArray;
		BinObjMgt_Persistent & PutByteArray(const BinObjMgt_PByte theArray, const Standard_Integer theLength);

		/****************** PutCString ******************/
		%feature("compactdefaultargs") PutCString;
		%feature("autodoc", "Offset in output buffer is not aligned.

Parameters
----------
theValue: char *

Returns
-------
BinObjMgt_Persistent
") PutCString;
		BinObjMgt_Persistent & PutCString(const char * theValue);

		/****************** PutCharArray ******************/
		%feature("compactdefaultargs") PutCharArray;
		%feature("autodoc", "Put c array of char, thelength is the number of elements.

Parameters
----------
theArray: BinObjMgt_PChar
theLength: int

Returns
-------
BinObjMgt_Persistent
") PutCharArray;
		BinObjMgt_Persistent & PutCharArray(const BinObjMgt_PChar theArray, const Standard_Integer theLength);

		/****************** PutCharacter ******************/
		%feature("compactdefaultargs") PutCharacter;
		%feature("autodoc", "No available documentation.

Parameters
----------
theValue: Standard_Character

Returns
-------
BinObjMgt_Persistent
") PutCharacter;
		BinObjMgt_Persistent & PutCharacter(const Standard_Character theValue);

		/****************** PutExtCharArray ******************/
		%feature("compactdefaultargs") PutExtCharArray;
		%feature("autodoc", "Put c array of extcharacter, thelength is the number of elements.

Parameters
----------
theArray: BinObjMgt_PExtChar
theLength: int

Returns
-------
BinObjMgt_Persistent
") PutExtCharArray;
		BinObjMgt_Persistent & PutExtCharArray(const BinObjMgt_PExtChar theArray, const Standard_Integer theLength);

		/****************** PutExtCharacter ******************/
		%feature("compactdefaultargs") PutExtCharacter;
		%feature("autodoc", "No available documentation.

Parameters
----------
theValue: Standard_ExtCharacter

Returns
-------
BinObjMgt_Persistent
") PutExtCharacter;
		BinObjMgt_Persistent & PutExtCharacter(const Standard_ExtCharacter theValue);

		/****************** PutExtendedString ******************/
		%feature("compactdefaultargs") PutExtendedString;
		%feature("autodoc", "Offset in output buffer is word-aligned.

Parameters
----------
theValue: TCollection_ExtendedString

Returns
-------
BinObjMgt_Persistent
") PutExtendedString;
		BinObjMgt_Persistent & PutExtendedString(const TCollection_ExtendedString & theValue);

		/****************** PutGUID ******************/
		%feature("compactdefaultargs") PutGUID;
		%feature("autodoc", "No available documentation.

Parameters
----------
theValue: Standard_GUID

Returns
-------
BinObjMgt_Persistent
") PutGUID;
		BinObjMgt_Persistent & PutGUID(const Standard_GUID & theValue);

		/****************** PutIntArray ******************/
		%feature("compactdefaultargs") PutIntArray;
		%feature("autodoc", "Put c array of int, thelength is the number of elements.

Parameters
----------
theArray: BinObjMgt_PInteger
theLength: int

Returns
-------
BinObjMgt_Persistent
") PutIntArray;
		BinObjMgt_Persistent & PutIntArray(const BinObjMgt_PInteger theArray, const Standard_Integer theLength);

		/****************** PutInteger ******************/
		%feature("compactdefaultargs") PutInteger;
		%feature("autodoc", "No available documentation.

Parameters
----------
theValue: int

Returns
-------
BinObjMgt_Persistent
") PutInteger;
		BinObjMgt_Persistent & PutInteger(const Standard_Integer theValue);

		/****************** PutLabel ******************/
		%feature("compactdefaultargs") PutLabel;
		%feature("autodoc", "No available documentation.

Parameters
----------
theValue: TDF_Label

Returns
-------
BinObjMgt_Persistent
") PutLabel;
		BinObjMgt_Persistent & PutLabel(const TDF_Label & theValue);

		/****************** PutReal ******************/
		%feature("compactdefaultargs") PutReal;
		%feature("autodoc", "No available documentation.

Parameters
----------
theValue: float

Returns
-------
BinObjMgt_Persistent
") PutReal;
		BinObjMgt_Persistent & PutReal(const Standard_Real theValue);

		/****************** PutRealArray ******************/
		%feature("compactdefaultargs") PutRealArray;
		%feature("autodoc", "Put c array of double, thelength is the number of elements.

Parameters
----------
theArray: BinObjMgt_PReal
theLength: int

Returns
-------
BinObjMgt_Persistent
") PutRealArray;
		BinObjMgt_Persistent & PutRealArray(const BinObjMgt_PReal theArray, const Standard_Integer theLength);

		/****************** PutShortReal ******************/
		%feature("compactdefaultargs") PutShortReal;
		%feature("autodoc", "No available documentation.

Parameters
----------
theValue: Standard_ShortReal

Returns
-------
BinObjMgt_Persistent
") PutShortReal;
		BinObjMgt_Persistent & PutShortReal(const Standard_ShortReal theValue);

		/****************** PutShortRealArray ******************/
		%feature("compactdefaultargs") PutShortRealArray;
		%feature("autodoc", "Put c array of float, thelength is the number of elements.

Parameters
----------
theArray: BinObjMgt_PShortReal
theLength: int

Returns
-------
BinObjMgt_Persistent
") PutShortRealArray;
		BinObjMgt_Persistent & PutShortRealArray(const BinObjMgt_PShortReal theArray, const Standard_Integer theLength);


            %feature("autodoc", "1");
            %extend{
                void ReadFromString(std::string src) {
                std::stringstream s(src);
                self->Read(s);}
            };
		/****************** SetId ******************/
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "Sets the id of the object.

Parameters
----------
theId: int

Returns
-------
None
") SetId;
		void SetId(const Standard_Integer theId);

		/****************** SetPosition ******************/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "Sets the current position for get/put. resets an error state depending on the validity of thepos. returns the new state (value of isok()).

Parameters
----------
thePos: int

Returns
-------
bool
") SetPosition;
		Standard_Boolean SetPosition(const Standard_Integer thePos);

		/****************** SetTypeId ******************/
		%feature("compactdefaultargs") SetTypeId;
		%feature("autodoc", "Sets the id of the type of the object.

Parameters
----------
theId: int

Returns
-------
None
") SetTypeId;
		void SetTypeId(const Standard_Integer theId);

		/****************** Truncate ******************/
		%feature("compactdefaultargs") Truncate;
		%feature("autodoc", "Truncates the buffer by current position, i.e. updates mysize.

Returns
-------
None
") Truncate;
		void Truncate();

		/****************** TypeId ******************/
		%feature("compactdefaultargs") TypeId;
		%feature("autodoc", "Returns the id of the type of the object.

Returns
-------
int
") TypeId;
		Standard_Integer TypeId();


        %feature("autodoc", "1");
        %extend{
            std::string WriteToString() {
            std::stringstream s;
            self->Write(s);
            return s.str();}
        };
};


%extend BinObjMgt_Persistent {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class BinObjMgt_RRelocationTable *
***********************************/
class BinObjMgt_RRelocationTable : public TColStd_DataMapOfIntegerTransient {
	public:
		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Parameters
----------
doReleaseMemory: bool,optional
	default value is Standard_True

Returns
-------
None
") Clear;
		void Clear(const Standard_Boolean doReleaseMemory = Standard_True);

		/****************** GetHeaderData ******************/
		%feature("compactdefaultargs") GetHeaderData;
		%feature("autodoc", "Returns a handle to the header data of the file that is begin read.

Returns
-------
opencascade::handle<Storage_HeaderData>
") GetHeaderData;
		const opencascade::handle<Storage_HeaderData> & GetHeaderData();

		/****************** SetHeaderData ******************/
		%feature("compactdefaultargs") SetHeaderData;
		%feature("autodoc", "Sets the storage header data. //! @param theheaderdata header data of the file that is begin read.

Parameters
----------
theHeaderData: Storage_HeaderData

Returns
-------
None
") SetHeaderData;
		void SetHeaderData(const opencascade::handle<Storage_HeaderData> & theHeaderData);

};


%extend BinObjMgt_RRelocationTable {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
