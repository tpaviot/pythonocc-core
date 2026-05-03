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
%define BINOBJMGTDOCSTRING
"BinObjMgt module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_binobjmgt.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
#include<BinObjMgt_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TCollection_module.hxx>
#include<TDF_module.hxx>
#include<Storage_module.hxx>
#include<CDF_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TCollection.i
%import TDF.i
%import Storage.i

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
/* end handles declaration */

/* templates */
%ignore NCollection_IndexedMap<opencascade::handle<Standard_Transient>>::Items;
%ignore NCollection_IndexedMap<opencascade::handle<Standard_Transient>>::KeyValues;
%ignore NCollection_IndexedMap<opencascade::handle<Standard_Transient>>::IndexedItems;
%ignore NCollection_IndexedMap<opencascade::handle<Standard_Transient>>::Contained;
%template(BinObjMgt_SRelocationTable) NCollection_IndexedMap<opencascade::handle<Standard_Transient>>;
/* end templates declaration */

/* typedefs */
typedef NCollection_IndexedMap<opencascade::handle<Standard_Transient>> BinObjMgt_SRelocationTable;
/* end typedefs declaration */

/*****************************
* class BinObjMgt_Persistent *
*****************************/
class BinObjMgt_Persistent {
	public:
		/****** BinObjMgt_Persistent::BinObjMgt_Persistent ******/
		/****** md5 signature: b925cd444b8c72d67ffe633341437671 ******/
		%feature("compactdefaultargs") BinObjMgt_Persistent;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") BinObjMgt_Persistent;
		 BinObjMgt_Persistent();

		/****** BinObjMgt_Persistent::Destroy ******/
		/****** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ******/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "Return
-------
None

Description
-----------
Frees the allocated memory; This object can be reused after call to Init.
") Destroy;
		void Destroy();

		/****** BinObjMgt_Persistent::GetAsciiString ******/
		/****** md5 signature: 82220a6a62466250ff21132a496ecb41 ******/
		%feature("compactdefaultargs") GetAsciiString;
		%feature("autodoc", "
Parameters
----------
theValue: str

Return
-------
BinObjMgt_Persistent

Description
-----------
No available documentation.
") GetAsciiString;
		const BinObjMgt_Persistent & GetAsciiString(TCollection_AsciiString & theValue);

		/****** BinObjMgt_Persistent::GetBoolean ******/
		/****** md5 signature: 8236e2b3d1d2e81d79bbf15c1b96e283 ******/
		%feature("compactdefaultargs") GetBoolean;
		%feature("autodoc", "
Parameters
----------

Return
-------
theValue: bool

Description
-----------
No available documentation.
") GetBoolean;
		const BinObjMgt_Persistent & GetBoolean(Standard_Boolean &OutValue);

		/****** BinObjMgt_Persistent::GetByte ******/
		/****** md5 signature: 72ef5329a5337e823cf7e46417083d94 ******/
		%feature("compactdefaultargs") GetByte;
		%feature("autodoc", "
Parameters
----------
theValue: uint8_t

Return
-------
BinObjMgt_Persistent

Description
-----------
No available documentation.
") GetByte;
		const BinObjMgt_Persistent & GetByte(uint8_t & theValue);

		/****** BinObjMgt_Persistent::GetByteArray ******/
		/****** md5 signature: a7caf59e0a6ca8ea4eb65c93959eee39 ******/
		%feature("compactdefaultargs") GetByteArray;
		%feature("autodoc", "
Parameters
----------
theArray: BinObjMgt_PByte
theLength: int

Return
-------
BinObjMgt_Persistent

Description
-----------
Get C array of unsigned chars, theLength is the number of elements; theArray must point to a space enough to place theLength elements.
") GetByteArray;
		const BinObjMgt_Persistent & GetByteArray(const BinObjMgt_PByte theArray, const int theLength);

		/****** BinObjMgt_Persistent::GetCharArray ******/
		/****** md5 signature: fb8d143e8ace61b7e4447d85ad54eb5e ******/
		%feature("compactdefaultargs") GetCharArray;
		%feature("autodoc", "
Parameters
----------
theArray: BinObjMgt_PChar
theLength: int

Return
-------
BinObjMgt_Persistent

Description
-----------
Get C array of char, theLength is the number of elements; theArray must point to a space enough to place theLength elements.
") GetCharArray;
		const BinObjMgt_Persistent & GetCharArray(const BinObjMgt_PChar theArray, const int theLength);

		/****** BinObjMgt_Persistent::GetCharacter ******/
		/****** md5 signature: 18078172f0898bc37a8ee924f75c737c ******/
		%feature("compactdefaultargs") GetCharacter;
		%feature("autodoc", "
Parameters
----------
theValue: char

Return
-------
BinObjMgt_Persistent

Description
-----------
No available documentation.
") GetCharacter;
		const BinObjMgt_Persistent & GetCharacter(char & theValue);

		/****** BinObjMgt_Persistent::GetExtCharArray ******/
		/****** md5 signature: 36dd01eca0c8f6479f59b02e17474e92 ******/
		%feature("compactdefaultargs") GetExtCharArray;
		%feature("autodoc", "
Parameters
----------
theArray: BinObjMgt_PExtChar
theLength: int

Return
-------
BinObjMgt_Persistent

Description
-----------
Get C array of ExtCharacter, theLength is the number of elements; theArray must point to a space enough to place theLength elements.
") GetExtCharArray;
		const BinObjMgt_Persistent & GetExtCharArray(const BinObjMgt_PExtChar theArray, const int theLength);

		/****** BinObjMgt_Persistent::GetExtCharacter ******/
		/****** md5 signature: fa4065b9331bd79baef79ae3e534cf87 ******/
		%feature("compactdefaultargs") GetExtCharacter;
		%feature("autodoc", "
Parameters
----------
theValue: char16_t

Return
-------
BinObjMgt_Persistent

Description
-----------
No available documentation.
") GetExtCharacter;
		const BinObjMgt_Persistent & GetExtCharacter(char16_t & theValue);

		/****** BinObjMgt_Persistent::GetExtendedString ******/
		/****** md5 signature: 0049c3c4fd7726b41c30e549da54cd2b ******/
		%feature("compactdefaultargs") GetExtendedString;
		%feature("autodoc", "
Parameters
----------
theValue: str

Return
-------
BinObjMgt_Persistent

Description
-----------
No available documentation.
") GetExtendedString;
		const BinObjMgt_Persistent & GetExtendedString(TCollection_ExtendedString & theValue);

		/****** BinObjMgt_Persistent::GetGUID ******/
		/****** md5 signature: eb1fec3cbfc0a0855014089ef38daae9 ******/
		%feature("compactdefaultargs") GetGUID;
		%feature("autodoc", "
Parameters
----------
theValue: Standard_GUID

Return
-------
BinObjMgt_Persistent

Description
-----------
No available documentation.
") GetGUID;
		const BinObjMgt_Persistent & GetGUID(Standard_GUID & theValue);

		/****** BinObjMgt_Persistent::GetIStream ******/
		/****** md5 signature: b503fd0336753bf795bdd5b274984db6 ******/
		%feature("compactdefaultargs") GetIStream;
		%feature("autodoc", "Return
-------
Standard_IStream *

Description
-----------
Gets the stream for and enables direct reading.
") GetIStream;
		Standard_IStream * GetIStream();

		/****** BinObjMgt_Persistent::GetIntArray ******/
		/****** md5 signature: 8306cc0459d3f6e9203afb3abc4e3cf4 ******/
		%feature("compactdefaultargs") GetIntArray;
		%feature("autodoc", "
Parameters
----------
theArray: BinObjMgt_PInteger
theLength: int

Return
-------
BinObjMgt_Persistent

Description
-----------
Get C array of int, theLength is the number of elements; theArray must point to a space enough to place theLength elements.
") GetIntArray;
		const BinObjMgt_Persistent & GetIntArray(const BinObjMgt_PInteger theArray, const int theLength);

		/****** BinObjMgt_Persistent::GetInteger ******/
		/****** md5 signature: 7430d05ed48c63aa41fb232c0aea4ecf ******/
		%feature("compactdefaultargs") GetInteger;
		%feature("autodoc", "
Parameters
----------

Return
-------
theValue: int

Description
-----------
No available documentation.
") GetInteger;
		const BinObjMgt_Persistent & GetInteger(Standard_Integer &OutValue);

		/****** BinObjMgt_Persistent::GetLabel ******/
		/****** md5 signature: 6c1f51afade11fd797510d21a1757b06 ******/
		%feature("compactdefaultargs") GetLabel;
		%feature("autodoc", "
Parameters
----------
theDS: TDF_Data
theValue: TDF_Label

Return
-------
BinObjMgt_Persistent

Description
-----------
No available documentation.
") GetLabel;
		const BinObjMgt_Persistent & GetLabel(const opencascade::handle<TDF_Data> & theDS, TDF_Label & theValue);

		/****** BinObjMgt_Persistent::GetOStream ******/
		/****** md5 signature: f315d3540d9d32727fa0b4bd7ff6fca0 ******/
		%feature("compactdefaultargs") GetOStream;
		%feature("autodoc", "Return
-------
Standard_OStream *

Description
-----------
Gets the stream for and enables direct writing.
") GetOStream;
		Standard_OStream * GetOStream();

		/****** BinObjMgt_Persistent::GetReal ******/
		/****** md5 signature: 1406765206c23bfe257ca43ee6a85bfd ******/
		%feature("compactdefaultargs") GetReal;
		%feature("autodoc", "
Parameters
----------

Return
-------
theValue: double

Description
-----------
No available documentation.
") GetReal;
		const BinObjMgt_Persistent & GetReal(Standard_Real &OutValue);

		/****** BinObjMgt_Persistent::GetRealArray ******/
		/****** md5 signature: ed96bbd878625bd971681f34413039d3 ******/
		%feature("compactdefaultargs") GetRealArray;
		%feature("autodoc", "
Parameters
----------
theArray: BinObjMgt_PReal
theLength: int

Return
-------
BinObjMgt_Persistent

Description
-----------
Get C array of double, theLength is the number of elements; theArray must point to a space enough to place theLength elements.
") GetRealArray;
		const BinObjMgt_Persistent & GetRealArray(const BinObjMgt_PReal theArray, const int theLength);

		/****** BinObjMgt_Persistent::GetShortReal ******/
		/****** md5 signature: ffb70a068ade41495ae68829a4038be8 ******/
		%feature("compactdefaultargs") GetShortReal;
		%feature("autodoc", "
Parameters
----------

Return
-------
theValue: float

Description
-----------
No available documentation.
") GetShortReal;
		const BinObjMgt_Persistent & GetShortReal(Standard_ShortReal &OutValue);

		/****** BinObjMgt_Persistent::GetShortRealArray ******/
		/****** md5 signature: 3a9247a5932a1251805f00f93ae0c1a8 ******/
		%feature("compactdefaultargs") GetShortRealArray;
		%feature("autodoc", "
Parameters
----------
theArray: BinObjMgt_PShortReal
theLength: int

Return
-------
BinObjMgt_Persistent

Description
-----------
Get C array of float, theLength is the number of elements; theArray must point to a space enough to place theLength elements.
") GetShortRealArray;
		const BinObjMgt_Persistent & GetShortRealArray(const BinObjMgt_PShortReal theArray, const int theLength);

		/****** BinObjMgt_Persistent::Id ******/
		/****** md5 signature: 897b87be47338bdfaa2575963f3b2cd7 ******/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the Id of the object.
") Id;
		int Id();

		/****** BinObjMgt_Persistent::Init ******/
		/****** md5 signature: 0de93ef32c53d091768788dca0e281fd ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes me to reuse again.
") Init;
		void Init();

		/****** BinObjMgt_Persistent::IsDirect ******/
		/****** md5 signature: 1a55a9c2bfb9be0e7936c90b488edcb5 ******/
		%feature("compactdefaultargs") IsDirect;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if after this record a direct writing to the stream is performed.
") IsDirect;
		bool IsDirect();

		/****** BinObjMgt_Persistent::IsError ******/
		/****** md5 signature: 4d6d2e047c45a9842373d0208432adf4 ******/
		%feature("compactdefaultargs") IsError;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Indicates an error after Get methods or SetPosition.
") IsError;
		bool IsError();

		/****** BinObjMgt_Persistent::IsOK ******/
		/****** md5 signature: bb3b89285f931392baab66568c7835f0 ******/
		%feature("compactdefaultargs") IsOK;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Indicates a good state after Get methods or SetPosition.
") IsOK;
		bool IsOK();

		/****** BinObjMgt_Persistent::Length ******/
		/****** md5 signature: f07a384d0f09ac6092cb8ed89442c8a8 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the length of data.
") Length;
		int Length();

		/****** BinObjMgt_Persistent::Position ******/
		/****** md5 signature: f7f8c29be3a94498a0c040d9105b4ff1 ******/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
int

Description
-----------
Tells the current position for get/put.
") Position;
		int Position();

		/****** BinObjMgt_Persistent::PutAsciiString ******/
		/****** md5 signature: b82776b3ea812baa2246aaec57fef89a ******/
		%feature("compactdefaultargs") PutAsciiString;
		%feature("autodoc", "
Parameters
----------
theValue: str

Return
-------
BinObjMgt_Persistent

Description
-----------
Offset in output buffer is word-aligned.
") PutAsciiString;
		BinObjMgt_Persistent & PutAsciiString(TCollection_AsciiString theValue);

		/****** BinObjMgt_Persistent::PutBoolean ******/
		/****** md5 signature: 21e97feee684b6aaa48daf15b05af5f5 ******/
		%feature("compactdefaultargs") PutBoolean;
		%feature("autodoc", "
Parameters
----------
theValue: bool

Return
-------
BinObjMgt_Persistent

Description
-----------
No available documentation.
") PutBoolean;
		BinObjMgt_Persistent & PutBoolean(const bool theValue);

		/****** BinObjMgt_Persistent::PutByte ******/
		/****** md5 signature: c61a322469384272291aeaf7143c37cb ******/
		%feature("compactdefaultargs") PutByte;
		%feature("autodoc", "
Parameters
----------
theValue: uint8_t

Return
-------
BinObjMgt_Persistent

Description
-----------
No available documentation.
") PutByte;
		BinObjMgt_Persistent & PutByte(const uint8_t theValue);

		/****** BinObjMgt_Persistent::PutByteArray ******/
		/****** md5 signature: 758f3a8776718a1f8606581636303a81 ******/
		%feature("compactdefaultargs") PutByteArray;
		%feature("autodoc", "
Parameters
----------
theArray: BinObjMgt_PByte
theLength: int

Return
-------
BinObjMgt_Persistent

Description
-----------
Put C array of unsigned chars, theLength is the number of elements.
") PutByteArray;
		BinObjMgt_Persistent & PutByteArray(const BinObjMgt_PByte theArray, const int theLength);

		/****** BinObjMgt_Persistent::PutCString ******/
		/****** md5 signature: be87f289b67ccd623fb68b5b03eaa6c7 ******/
		%feature("compactdefaultargs") PutCString;
		%feature("autodoc", "
Parameters
----------
theValue: char *

Return
-------
BinObjMgt_Persistent

Description
-----------
Offset in output buffer is not aligned.
") PutCString;
		BinObjMgt_Persistent & PutCString(const char * const theValue);

		/****** BinObjMgt_Persistent::PutCharArray ******/
		/****** md5 signature: 36938522b45286adb391c65ead022fc2 ******/
		%feature("compactdefaultargs") PutCharArray;
		%feature("autodoc", "
Parameters
----------
theArray: BinObjMgt_PChar
theLength: int

Return
-------
BinObjMgt_Persistent

Description
-----------
Put C array of char, theLength is the number of elements.
") PutCharArray;
		BinObjMgt_Persistent & PutCharArray(const BinObjMgt_PChar theArray, const int theLength);

		/****** BinObjMgt_Persistent::PutCharacter ******/
		/****** md5 signature: fd19c36ebb77350ba45543f2a0637330 ******/
		%feature("compactdefaultargs") PutCharacter;
		%feature("autodoc", "
Parameters
----------
theValue: char

Return
-------
BinObjMgt_Persistent

Description
-----------
No available documentation.
") PutCharacter;
		BinObjMgt_Persistent & PutCharacter(const char theValue);

		/****** BinObjMgt_Persistent::PutExtCharArray ******/
		/****** md5 signature: 72a95297108d9b3ced630dc087d8301a ******/
		%feature("compactdefaultargs") PutExtCharArray;
		%feature("autodoc", "
Parameters
----------
theArray: BinObjMgt_PExtChar
theLength: int

Return
-------
BinObjMgt_Persistent

Description
-----------
Put C array of ExtCharacter, theLength is the number of elements.
") PutExtCharArray;
		BinObjMgt_Persistent & PutExtCharArray(const BinObjMgt_PExtChar theArray, const int theLength);

		/****** BinObjMgt_Persistent::PutExtCharacter ******/
		/****** md5 signature: 0e507d6f0b8515338d22d138e3d2cac4 ******/
		%feature("compactdefaultargs") PutExtCharacter;
		%feature("autodoc", "
Parameters
----------
theValue: char16_t

Return
-------
BinObjMgt_Persistent

Description
-----------
No available documentation.
") PutExtCharacter;
		BinObjMgt_Persistent & PutExtCharacter(const char16_t theValue);

		/****** BinObjMgt_Persistent::PutExtendedString ******/
		/****** md5 signature: 23edf3a9eab8036e38f9dcdd343911fd ******/
		%feature("compactdefaultargs") PutExtendedString;
		%feature("autodoc", "
Parameters
----------
theValue: str

Return
-------
BinObjMgt_Persistent

Description
-----------
Offset in output buffer is word-aligned.
") PutExtendedString;
		BinObjMgt_Persistent & PutExtendedString(TCollection_ExtendedString theValue);

		/****** BinObjMgt_Persistent::PutGUID ******/
		/****** md5 signature: edc522528f33629d369a8c0ba78bee3d ******/
		%feature("compactdefaultargs") PutGUID;
		%feature("autodoc", "
Parameters
----------
theValue: Standard_GUID

Return
-------
BinObjMgt_Persistent

Description
-----------
No available documentation.
") PutGUID;
		BinObjMgt_Persistent & PutGUID(const Standard_GUID & theValue);

		/****** BinObjMgt_Persistent::PutIntArray ******/
		/****** md5 signature: 69d5b788e1bbed5ad8536b1572503e41 ******/
		%feature("compactdefaultargs") PutIntArray;
		%feature("autodoc", "
Parameters
----------
theArray: BinObjMgt_PInteger
theLength: int

Return
-------
BinObjMgt_Persistent

Description
-----------
Put C array of int, theLength is the number of elements.
") PutIntArray;
		BinObjMgt_Persistent & PutIntArray(const BinObjMgt_PInteger theArray, const int theLength);

		/****** BinObjMgt_Persistent::PutInteger ******/
		/****** md5 signature: 0f2378a1a45e38bfcb41fa02bec08d44 ******/
		%feature("compactdefaultargs") PutInteger;
		%feature("autodoc", "
Parameters
----------
theValue: int

Return
-------
BinObjMgt_Persistent

Description
-----------
No available documentation.
") PutInteger;
		BinObjMgt_Persistent & PutInteger(const int theValue);

		/****** BinObjMgt_Persistent::PutLabel ******/
		/****** md5 signature: 517ef015d653478deb80807e77fe2dfd ******/
		%feature("compactdefaultargs") PutLabel;
		%feature("autodoc", "
Parameters
----------
theValue: TDF_Label

Return
-------
BinObjMgt_Persistent

Description
-----------
No available documentation.
") PutLabel;
		BinObjMgt_Persistent & PutLabel(const TDF_Label & theValue);

		/****** BinObjMgt_Persistent::PutReal ******/
		/****** md5 signature: 8fffafce1fca79c2b7fe3df95a1020d0 ******/
		%feature("compactdefaultargs") PutReal;
		%feature("autodoc", "
Parameters
----------
theValue: double

Return
-------
BinObjMgt_Persistent

Description
-----------
No available documentation.
") PutReal;
		BinObjMgt_Persistent & PutReal(const double theValue);

		/****** BinObjMgt_Persistent::PutRealArray ******/
		/****** md5 signature: d2e2693586fced41f0de5bf0d64b9d34 ******/
		%feature("compactdefaultargs") PutRealArray;
		%feature("autodoc", "
Parameters
----------
theArray: BinObjMgt_PReal
theLength: int

Return
-------
BinObjMgt_Persistent

Description
-----------
Put C array of double, theLength is the number of elements.
") PutRealArray;
		BinObjMgt_Persistent & PutRealArray(const BinObjMgt_PReal theArray, const int theLength);

		/****** BinObjMgt_Persistent::PutShortReal ******/
		/****** md5 signature: 92980e0b4c3a3fa8faa7a59bcd3277af ******/
		%feature("compactdefaultargs") PutShortReal;
		%feature("autodoc", "
Parameters
----------
theValue: float

Return
-------
BinObjMgt_Persistent

Description
-----------
No available documentation.
") PutShortReal;
		BinObjMgt_Persistent & PutShortReal(const float theValue);

		/****** BinObjMgt_Persistent::PutShortRealArray ******/
		/****** md5 signature: 38c5ab76fa387dc5375941a05b904320 ******/
		%feature("compactdefaultargs") PutShortRealArray;
		%feature("autodoc", "
Parameters
----------
theArray: BinObjMgt_PShortReal
theLength: int

Return
-------
BinObjMgt_Persistent

Description
-----------
Put C array of float, theLength is the number of elements.
") PutShortRealArray;
		BinObjMgt_Persistent & PutShortRealArray(const BinObjMgt_PShortReal theArray, const int theLength);

		/****** BinObjMgt_Persistent::Read ******/
		/****** md5 signature: 703e11a3fb46f18575a45a43966aa937 ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
theIS: str

Return
-------
Standard_IStream

Description
-----------
Retrieves <self> from the stream. inline Standard_IStream& operator>> (Standard_IStream&, BinObjMgt_Persistent&) is also available.
") Read;
		Standard_IStream & Read(std::istream & theIS);

		/****** BinObjMgt_Persistent::SetIStream ******/
		/****** md5 signature: 5d0249291c7182c496c2994cfe459a5d ******/
		%feature("compactdefaultargs") SetIStream;
		%feature("autodoc", "
Parameters
----------
theStream: str

Return
-------
None

Description
-----------
Sets the stream for direct reading.
") SetIStream;
		void SetIStream(std::istream & theStream);

		/****** BinObjMgt_Persistent::SetId ******/
		/****** md5 signature: cdc25e46150635559cd191cf8705319e ******/
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "
Parameters
----------
theId: int

Return
-------
None

Description
-----------
Sets the Id of the object.
") SetId;
		void SetId(const int theId);

		/****** BinObjMgt_Persistent::SetOStream ******/
		/****** md5 signature: 05ebcdbd2bdd64c5cb2e8dd9a9b0f378 ******/
		%feature("compactdefaultargs") SetOStream;
		%feature("autodoc", "
Parameters
----------

Return
-------
theStream: Standard_OStream

Description
-----------
Sets the stream for direct writing.
") SetOStream;
		void SetOStream(std::ostream &OutValue);

		/****** BinObjMgt_Persistent::SetPosition ******/
		/****** md5 signature: 9a54ff3542da923093042df903419409 ******/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "
Parameters
----------
thePos: int

Return
-------
bool

Description
-----------
Sets the current position for get/put. Resets an error state depending on the validity of thePos. Returns the new state (value of IsOK()).
") SetPosition;
		bool SetPosition(const int thePos);

		/****** BinObjMgt_Persistent::SetTypeId ******/
		/****** md5 signature: f9146de83e3e509b499749b721503a8e ******/
		%feature("compactdefaultargs") SetTypeId;
		%feature("autodoc", "
Parameters
----------
theId: int

Return
-------
None

Description
-----------
Sets the Id of the type of the object.
") SetTypeId;
		void SetTypeId(const int theId);

		/****** BinObjMgt_Persistent::StreamStart ******/
		/****** md5 signature: e0cf8d7c6c5cab9a0df41cc72760de1f ******/
		%feature("compactdefaultargs") StreamStart;
		%feature("autodoc", "Return
-------
opencascade::handle<BinObjMgt_Position>

Description
-----------
Returns the start position of the direct writing in the stream.
") StreamStart;
		opencascade::handle<BinObjMgt_Position> StreamStart();

		/****** BinObjMgt_Persistent::Truncate ******/
		/****** md5 signature: 5d042d2aea73ae47c14d2c42d285a228 ******/
		%feature("compactdefaultargs") Truncate;
		%feature("autodoc", "Return
-------
None

Description
-----------
Truncates the buffer by current position, i.e. updates mySize.
") Truncate;
		void Truncate();

		/****** BinObjMgt_Persistent::TypeId ******/
		/****** md5 signature: b79134446b2cd271988ba97c1b344868 ******/
		%feature("compactdefaultargs") TypeId;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the Id of the type of the object.
") TypeId;
		int TypeId();

		/****** BinObjMgt_Persistent::Write ******/
		/****** md5 signature: 03af028ccb16b4f5e37896c34daf799f ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
theDirectStream: bool (optional, default to false)

Return
-------
theOS: Standard_OStream

Description
-----------
Stores <self> to the stream. inline Standard_OStream& operator<< (Standard_OStream&, BinObjMgt_Persistent&) is also available. If theDirectStream is true, after this data the direct stream data is stored.
") Write;
		Standard_OStream & Write(std::ostream &OutValue, const bool theDirectStream = false);

};


%extend BinObjMgt_Persistent {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class BinObjMgt_Position *
***************************/
/***********************************
* class BinObjMgt_RRelocationTable *
***********************************/
class BinObjMgt_RRelocationTable : public NCollection_DataMap<int,opencascade::handle<Standard_Transient>> {
	public:
		/****** BinObjMgt_RRelocationTable::Clear ******/
		/****** md5 signature: 369cf7be96fc69902eb163ab218ae101 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "
Parameters
----------
doReleaseMemory: bool (optional, default to true)

Return
-------
None

Description
-----------
No available documentation.
") Clear;
		void Clear(const bool doReleaseMemory = true);

		/****** BinObjMgt_RRelocationTable::GetHeaderData ******/
		/****** md5 signature: ce7373453eff48a8fcde9d5cb66f15d5 ******/
		%feature("compactdefaultargs") GetHeaderData;
		%feature("autodoc", "Return
-------
opencascade::handle<Storage_HeaderData>

Description
-----------
Returns a handle to the header data of the file that is begin read.
") GetHeaderData;
		const opencascade::handle<Storage_HeaderData> & GetHeaderData();

		/****** BinObjMgt_RRelocationTable::SetHeaderData ******/
		/****** md5 signature: 5eb1ccbc6d11f56956cabbed4c44e21c ******/
		%feature("compactdefaultargs") SetHeaderData;
		%feature("autodoc", "
Parameters
----------
theHeaderData: Storage_HeaderData

Return
-------
None

Description
-----------
Sets the storage header data. //! 
Parameter theHeaderData header data of the file that is begin read.
") SetHeaderData;
		void SetHeaderData(const opencascade::handle<Storage_HeaderData> & theHeaderData);

};


%extend BinObjMgt_RRelocationTable {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class BinObjMgt_Position:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
