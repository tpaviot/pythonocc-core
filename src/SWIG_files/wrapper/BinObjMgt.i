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
		/**** md5 signature: b925cd444b8c72d67ffe633341437671 ****/
		%feature("compactdefaultargs") BinObjMgt_Persistent;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") BinObjMgt_Persistent;
		 BinObjMgt_Persistent();

		/****************** Destroy ******************/
		/**** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ****/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "Frees the allocated memory; this object can be reused after call to init.

Returns
-------
None
") Destroy;
		void Destroy();

		/****************** GetAsciiString ******************/
		/**** md5 signature: 82220a6a62466250ff21132a496ecb41 ****/
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
		/**** md5 signature: 017b44d2b1e1e364f2d0655ca1511d39 ****/
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
		/**** md5 signature: 33f12c94796e4f97c4d8fcbf351c2ade ****/
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
		/**** md5 signature: 256f305bf958185a4c71be137224d245 ****/
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
		/**** md5 signature: 79ca5122aff93a3a2c997f6f7be0e0c2 ****/
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
		/**** md5 signature: 9a6951856c69a871acc236822716d8b0 ****/
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
		/**** md5 signature: f7860228db7636124e625995fbcfe9d6 ****/
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
		/**** md5 signature: 723f86ca19452bebb9f88b0b78d26826 ****/
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
		/**** md5 signature: 0049c3c4fd7726b41c30e549da54cd2b ****/
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
		/**** md5 signature: eb1fec3cbfc0a0855014089ef38daae9 ****/
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
		/**** md5 signature: 7c90fd62cbabd6cccece0887a773ce65 ****/
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
		/**** md5 signature: a24d12c1aaeb5ed2ff5fd12501e0463f ****/
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
		/**** md5 signature: 6c1f51afade11fd797510d21a1757b06 ****/
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
		/**** md5 signature: 65cbf27e92c882f039241743224d67d7 ****/
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
		/**** md5 signature: 26dacf06164cc6d5d556170a1402de80 ****/
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
		/**** md5 signature: bd5d8caa6f982b61af2fc041ca40021e ****/
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
		/**** md5 signature: 241f5c28d908b020dc86c79662d7f205 ****/
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
		/**** md5 signature: bad178b94960474569631e20c0ad1e69 ****/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "Returns the id of the object.

Returns
-------
int
") Id;
		Standard_Integer Id();

		/****************** Init ******************/
		/**** md5 signature: 0de93ef32c53d091768788dca0e281fd ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes me to reuse again.

Returns
-------
None
") Init;
		void Init();

		/****************** IsError ******************/
		/**** md5 signature: c52b85ee17e423925f2cd97bf6879614 ****/
		%feature("compactdefaultargs") IsError;
		%feature("autodoc", "Indicates an error after get methods or setposition.

Returns
-------
bool
") IsError;
		Standard_Boolean IsError();

		/****************** IsOK ******************/
		/**** md5 signature: 8d4161ba0f81558df16789ba26c120df ****/
		%feature("compactdefaultargs") IsOK;
		%feature("autodoc", "Indicates a good state after get methods or setposition.

Returns
-------
bool
") IsOK;
		Standard_Boolean IsOK();

		/****************** Length ******************/
		/**** md5 signature: 58bd40380acccb2733bfbd37bf3cbb11 ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Returns the length of data.

Returns
-------
int
") Length;
		Standard_Integer Length();

		/****************** Position ******************/
		/**** md5 signature: 69c461acfbfd763a2ac7352bf69b5a98 ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Tells the current position for get/put.

Returns
-------
int
") Position;
		Standard_Integer Position();

		/****************** PutAsciiString ******************/
		/**** md5 signature: b82776b3ea812baa2246aaec57fef89a ****/
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
		/**** md5 signature: 0bedf2debedf8187cd7303777159cfb0 ****/
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
		/**** md5 signature: a7ffb9565fc1746b445d2e1e6fe80a76 ****/
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
		/**** md5 signature: b839761b42376dd50808d1e1b2178287 ****/
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
		/**** md5 signature: 2c95420c567573daa6c5f49e89a10026 ****/
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
		/**** md5 signature: 8048f0bf82735a8f2bf8b9ba58226a06 ****/
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
		/**** md5 signature: 4249bad50a8d96095d2a8dc346f17b1e ****/
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
		/**** md5 signature: e3d31877a31030af37baa10fa90842de ****/
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
		/**** md5 signature: bc0233ab11e956a117ba5e36c37438d8 ****/
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
		/**** md5 signature: 23edf3a9eab8036e38f9dcdd343911fd ****/
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
		/**** md5 signature: edc522528f33629d369a8c0ba78bee3d ****/
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
		/**** md5 signature: b6dc63543094b91b8d7b79c5b8bc10c3 ****/
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
		/**** md5 signature: ed6106c58bb494bb7c63451256d4bd3f ****/
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
		/**** md5 signature: 517ef015d653478deb80807e77fe2dfd ****/
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
		/**** md5 signature: e94f1ed0ccbd7da7f57a44413aafc780 ****/
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
		/**** md5 signature: 27b88a13da1818a4872989462343d5ad ****/
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
		/**** md5 signature: 244084883945501ba96226d9b877943a ****/
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
		/**** md5 signature: bce365f2560da9a3752d6a28e6242c91 ****/
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
		/**** md5 signature: 3131e8337f46d2a085b133db913d7e12 ****/
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
		/**** md5 signature: 734a09cc1c2f91af755a362f6ac9dbb1 ****/
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
		/**** md5 signature: cf3acfd7b9bba1b066cb667c1086d194 ****/
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
		/**** md5 signature: 5d042d2aea73ae47c14d2c42d285a228 ****/
		%feature("compactdefaultargs") Truncate;
		%feature("autodoc", "Truncates the buffer by current position, i.e. updates mysize.

Returns
-------
None
") Truncate;
		void Truncate();

		/****************** TypeId ******************/
		/**** md5 signature: 52d3b80a7e4f56b46c3832619c011afe ****/
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
		/**** md5 signature: 9769dd3f09530d7a423c9cced022263b ****/
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
		/**** md5 signature: ce7373453eff48a8fcde9d5cb66f15d5 ****/
		%feature("compactdefaultargs") GetHeaderData;
		%feature("autodoc", "Returns a handle to the header data of the file that is begin read.

Returns
-------
opencascade::handle<Storage_HeaderData>
") GetHeaderData;
		const opencascade::handle<Storage_HeaderData> & GetHeaderData();

		/****************** SetHeaderData ******************/
		/**** md5 signature: 5eb1ccbc6d11f56956cabbed4c44e21c ****/
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
