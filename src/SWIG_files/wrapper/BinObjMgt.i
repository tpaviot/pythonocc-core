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
%define BINOBJMGTDOCSTRING
"BinObjMgt module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_binobjmgt.html"
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
#include<TColStd_module.hxx>
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

/* python proxy classes for enums */
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
Frees the allocated memory; this object can be reused after call to init.
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
		/****** md5 signature: 017b44d2b1e1e364f2d0655ca1511d39 ******/
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
		/****** md5 signature: 33f12c94796e4f97c4d8fcbf351c2ade ******/
		%feature("compactdefaultargs") GetByte;
		%feature("autodoc", "
Parameters
----------
theValue: Standard_Byte

Return
-------
BinObjMgt_Persistent

Description
-----------
No available documentation.
") GetByte;
		const BinObjMgt_Persistent & GetByte(Standard_Byte & theValue);

		/****** BinObjMgt_Persistent::GetByteArray ******/
		/****** md5 signature: 256f305bf958185a4c71be137224d245 ******/
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
Get c array of unsigned chars, thelength is the number of elements; thearray must point to a space enough to place thelength elements.
") GetByteArray;
		const BinObjMgt_Persistent & GetByteArray(const BinObjMgt_PByte theArray, const Standard_Integer theLength);

		/****** BinObjMgt_Persistent::GetCharArray ******/
		/****** md5 signature: 79ca5122aff93a3a2c997f6f7be0e0c2 ******/
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
Get c array of char, thelength is the number of elements; thearray must point to a space enough to place thelength elements.
") GetCharArray;
		const BinObjMgt_Persistent & GetCharArray(const BinObjMgt_PChar theArray, const Standard_Integer theLength);

		/****** BinObjMgt_Persistent::GetCharacter ******/
		/****** md5 signature: 9a6951856c69a871acc236822716d8b0 ******/
		%feature("compactdefaultargs") GetCharacter;
		%feature("autodoc", "
Parameters
----------
theValue: Standard_Character

Return
-------
BinObjMgt_Persistent

Description
-----------
No available documentation.
") GetCharacter;
		const BinObjMgt_Persistent & GetCharacter(Standard_Character & theValue);

		/****** BinObjMgt_Persistent::GetExtCharArray ******/
		/****** md5 signature: f7860228db7636124e625995fbcfe9d6 ******/
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
Get c array of extcharacter, thelength is the number of elements; thearray must point to a space enough to place thelength elements.
") GetExtCharArray;
		const BinObjMgt_Persistent & GetExtCharArray(const BinObjMgt_PExtChar theArray, const Standard_Integer theLength);

		/****** BinObjMgt_Persistent::GetExtCharacter ******/
		/****** md5 signature: 723f86ca19452bebb9f88b0b78d26826 ******/
		%feature("compactdefaultargs") GetExtCharacter;
		%feature("autodoc", "
Parameters
----------
theValue: Standard_ExtCharacter

Return
-------
BinObjMgt_Persistent

Description
-----------
No available documentation.
") GetExtCharacter;
		const BinObjMgt_Persistent & GetExtCharacter(Standard_ExtCharacter & theValue);

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
		/****** md5 signature: 7c90fd62cbabd6cccece0887a773ce65 ******/
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
Get c array of int, thelength is the number of elements; thearray must point to a space enough to place thelength elements.
") GetIntArray;
		const BinObjMgt_Persistent & GetIntArray(const BinObjMgt_PInteger theArray, const Standard_Integer theLength);

		/****** BinObjMgt_Persistent::GetInteger ******/
		/****** md5 signature: a24d12c1aaeb5ed2ff5fd12501e0463f ******/
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
		/****** md5 signature: 65cbf27e92c882f039241743224d67d7 ******/
		%feature("compactdefaultargs") GetReal;
		%feature("autodoc", "
Parameters
----------

Return
-------
theValue: float

Description
-----------
No available documentation.
") GetReal;
		const BinObjMgt_Persistent & GetReal(Standard_Real &OutValue);

		/****** BinObjMgt_Persistent::GetRealArray ******/
		/****** md5 signature: 26dacf06164cc6d5d556170a1402de80 ******/
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
Get c array of double, thelength is the number of elements; thearray must point to a space enough to place thelength elements.
") GetRealArray;
		const BinObjMgt_Persistent & GetRealArray(const BinObjMgt_PReal theArray, const Standard_Integer theLength);

		/****** BinObjMgt_Persistent::GetShortReal ******/
		/****** md5 signature: bd5d8caa6f982b61af2fc041ca40021e ******/
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
		/****** md5 signature: 241f5c28d908b020dc86c79662d7f205 ******/
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
Get c array of float, thelength is the number of elements; thearray must point to a space enough to place thelength elements.
") GetShortRealArray;
		const BinObjMgt_Persistent & GetShortRealArray(const BinObjMgt_PShortReal theArray, const Standard_Integer theLength);

		/****** BinObjMgt_Persistent::Id ******/
		/****** md5 signature: bad178b94960474569631e20c0ad1e69 ******/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the id of the object.
") Id;
		Standard_Integer Id();

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
		/****** md5 signature: b04590ab3394fe8ab96053fa1809efb5 ******/
		%feature("compactdefaultargs") IsDirect;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if after this record a direct writing to the stream is performed.
") IsDirect;
		Standard_Boolean IsDirect();

		/****** BinObjMgt_Persistent::IsError ******/
		/****** md5 signature: c52b85ee17e423925f2cd97bf6879614 ******/
		%feature("compactdefaultargs") IsError;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Indicates an error after get methods or setposition.
") IsError;
		Standard_Boolean IsError();

		/****** BinObjMgt_Persistent::IsOK ******/
		/****** md5 signature: 8d4161ba0f81558df16789ba26c120df ******/
		%feature("compactdefaultargs") IsOK;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Indicates a good state after get methods or setposition.
") IsOK;
		Standard_Boolean IsOK();

		/****** BinObjMgt_Persistent::Length ******/
		/****** md5 signature: 58bd40380acccb2733bfbd37bf3cbb11 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the length of data.
") Length;
		Standard_Integer Length();

		/****** BinObjMgt_Persistent::Position ******/
		/****** md5 signature: 69c461acfbfd763a2ac7352bf69b5a98 ******/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
int

Description
-----------
Tells the current position for get/put.
") Position;
		Standard_Integer Position();

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
		/****** md5 signature: 0bedf2debedf8187cd7303777159cfb0 ******/
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
		BinObjMgt_Persistent & PutBoolean(const Standard_Boolean theValue);

		/****** BinObjMgt_Persistent::PutByte ******/
		/****** md5 signature: a7ffb9565fc1746b445d2e1e6fe80a76 ******/
		%feature("compactdefaultargs") PutByte;
		%feature("autodoc", "
Parameters
----------
theValue: Standard_Byte

Return
-------
BinObjMgt_Persistent

Description
-----------
No available documentation.
") PutByte;
		BinObjMgt_Persistent & PutByte(const Standard_Byte theValue);

		/****** BinObjMgt_Persistent::PutByteArray ******/
		/****** md5 signature: b839761b42376dd50808d1e1b2178287 ******/
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
Put c array of unsigned chars, thelength is the number of elements.
") PutByteArray;
		BinObjMgt_Persistent & PutByteArray(const BinObjMgt_PByte theArray, const Standard_Integer theLength);

		/****** BinObjMgt_Persistent::PutCString ******/
		/****** md5 signature: 2c95420c567573daa6c5f49e89a10026 ******/
		%feature("compactdefaultargs") PutCString;
		%feature("autodoc", "
Parameters
----------
theValue: str

Return
-------
BinObjMgt_Persistent

Description
-----------
Offset in output buffer is not aligned.
") PutCString;
		BinObjMgt_Persistent & PutCString(Standard_CString theValue);

		/****** BinObjMgt_Persistent::PutCharArray ******/
		/****** md5 signature: 8048f0bf82735a8f2bf8b9ba58226a06 ******/
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
Put c array of char, thelength is the number of elements.
") PutCharArray;
		BinObjMgt_Persistent & PutCharArray(const BinObjMgt_PChar theArray, const Standard_Integer theLength);

		/****** BinObjMgt_Persistent::PutCharacter ******/
		/****** md5 signature: 4249bad50a8d96095d2a8dc346f17b1e ******/
		%feature("compactdefaultargs") PutCharacter;
		%feature("autodoc", "
Parameters
----------
theValue: Standard_Character

Return
-------
BinObjMgt_Persistent

Description
-----------
No available documentation.
") PutCharacter;
		BinObjMgt_Persistent & PutCharacter(const Standard_Character theValue);

		/****** BinObjMgt_Persistent::PutExtCharArray ******/
		/****** md5 signature: e3d31877a31030af37baa10fa90842de ******/
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
Put c array of extcharacter, thelength is the number of elements.
") PutExtCharArray;
		BinObjMgt_Persistent & PutExtCharArray(const BinObjMgt_PExtChar theArray, const Standard_Integer theLength);

		/****** BinObjMgt_Persistent::PutExtCharacter ******/
		/****** md5 signature: bc0233ab11e956a117ba5e36c37438d8 ******/
		%feature("compactdefaultargs") PutExtCharacter;
		%feature("autodoc", "
Parameters
----------
theValue: Standard_ExtCharacter

Return
-------
BinObjMgt_Persistent

Description
-----------
No available documentation.
") PutExtCharacter;
		BinObjMgt_Persistent & PutExtCharacter(const Standard_ExtCharacter theValue);

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
		/****** md5 signature: b6dc63543094b91b8d7b79c5b8bc10c3 ******/
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
Put c array of int, thelength is the number of elements.
") PutIntArray;
		BinObjMgt_Persistent & PutIntArray(const BinObjMgt_PInteger theArray, const Standard_Integer theLength);

		/****** BinObjMgt_Persistent::PutInteger ******/
		/****** md5 signature: ed6106c58bb494bb7c63451256d4bd3f ******/
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
		BinObjMgt_Persistent & PutInteger(const Standard_Integer theValue);

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
		/****** md5 signature: e94f1ed0ccbd7da7f57a44413aafc780 ******/
		%feature("compactdefaultargs") PutReal;
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
") PutReal;
		BinObjMgt_Persistent & PutReal(const Standard_Real theValue);

		/****** BinObjMgt_Persistent::PutRealArray ******/
		/****** md5 signature: 27b88a13da1818a4872989462343d5ad ******/
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
Put c array of double, thelength is the number of elements.
") PutRealArray;
		BinObjMgt_Persistent & PutRealArray(const BinObjMgt_PReal theArray, const Standard_Integer theLength);

		/****** BinObjMgt_Persistent::PutShortReal ******/
		/****** md5 signature: 244084883945501ba96226d9b877943a ******/
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
		BinObjMgt_Persistent & PutShortReal(const Standard_ShortReal theValue);

		/****** BinObjMgt_Persistent::PutShortRealArray ******/
		/****** md5 signature: bce365f2560da9a3752d6a28e6242c91 ******/
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
Put c array of float, thelength is the number of elements.
") PutShortRealArray;
		BinObjMgt_Persistent & PutShortRealArray(const BinObjMgt_PShortReal theArray, const Standard_Integer theLength);

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
Retrieves <self> from the stream. inline standard_istream& operator>> (standard_istream&, binobjmgt_persistent&) is also available.
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
		/****** md5 signature: 3131e8337f46d2a085b133db913d7e12 ******/
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
Sets the id of the object.
") SetId;
		void SetId(const Standard_Integer theId);

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
		/****** md5 signature: 734a09cc1c2f91af755a362f6ac9dbb1 ******/
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
Sets the current position for get/put. resets an error state depending on the validity of thepos. returns the new state (value of isok()).
") SetPosition;
		Standard_Boolean SetPosition(const Standard_Integer thePos);

		/****** BinObjMgt_Persistent::SetTypeId ******/
		/****** md5 signature: cf3acfd7b9bba1b066cb667c1086d194 ******/
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
Sets the id of the type of the object.
") SetTypeId;
		void SetTypeId(const Standard_Integer theId);

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
Truncates the buffer by current position, i.e. updates mysize.
") Truncate;
		void Truncate();

		/****** BinObjMgt_Persistent::TypeId ******/
		/****** md5 signature: 52d3b80a7e4f56b46c3832619c011afe ******/
		%feature("compactdefaultargs") TypeId;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the id of the type of the object.
") TypeId;
		Standard_Integer TypeId();

		/****** BinObjMgt_Persistent::Write ******/
		/****** md5 signature: 84710283a2afe6c7aea0d3158b3cf2ea ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
theDirectStream: bool (optional, default to Standard_False)

Return
-------
theOS: Standard_OStream

Description
-----------
Stores <self> to the stream. inline standard_ostream& operator<< (standard_ostream&, binobjmgt_persistent&) is also available. if thedirectstream is true, after this data the direct stream data is stored.
") Write;
		Standard_OStream & Write(std::ostream &OutValue, const Standard_Boolean theDirectStream = Standard_False);

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
class BinObjMgt_RRelocationTable : public TColStd_DataMapOfIntegerTransient {
	public:
		/****** BinObjMgt_RRelocationTable::Clear ******/
		/****** md5 signature: 9769dd3f09530d7a423c9cced022263b ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "
Parameters
----------
doReleaseMemory: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
No available documentation.
") Clear;
		void Clear(const Standard_Boolean doReleaseMemory = Standard_True);

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
Sets the storage header data. //! @param theheaderdata header data of the file that is begin read.
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
BinObjMgt_SRelocationTable=OCC.Core.TColStd.TColStd_IndexedMapOfTransient
}
