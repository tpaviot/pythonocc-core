/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") BinObjMgt

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include BinObjMgt_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
typedef Standard_Byte * BinObjMgt_PByte;
typedef Standard_ShortReal * BinObjMgt_PShortReal;
typedef TColStd_IndexedMapOfTransient BinObjMgt_SRelocationTable;
typedef Standard_Real * BinObjMgt_PReal;
typedef Standard_ExtCharacter * BinObjMgt_PExtChar;
typedef Standard_Integer * BinObjMgt_PInteger;
typedef TColStd_DataMapOfIntegerTransient BinObjMgt_RRelocationTable;
typedef Standard_Character * BinObjMgt_PChar;
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor BinObjMgt_Persistent;
class BinObjMgt_Persistent {
	public:
		%feature("compactdefaultargs") BinObjMgt_Persistent;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") BinObjMgt_Persistent;
		 BinObjMgt_Persistent ();
		%feature("compactdefaultargs") PutCharacter;
		%feature("autodoc", "	:param theValue:
	:type theValue: Standard_Character
	:rtype: BinObjMgt_Persistent
") PutCharacter;
		BinObjMgt_Persistent & PutCharacter (const Standard_Character theValue);
		%feature("compactdefaultargs") PutByte;
		%feature("autodoc", "	:param theValue:
	:type theValue: Standard_Byte
	:rtype: BinObjMgt_Persistent
") PutByte;
		BinObjMgt_Persistent & PutByte (const Standard_Byte theValue);
		%feature("compactdefaultargs") PutExtCharacter;
		%feature("autodoc", "	:param theValue:
	:type theValue: Standard_ExtCharacter
	:rtype: BinObjMgt_Persistent
") PutExtCharacter;
		BinObjMgt_Persistent & PutExtCharacter (const Standard_ExtCharacter theValue);
		%feature("compactdefaultargs") PutInteger;
		%feature("autodoc", "	:param theValue:
	:type theValue: int
	:rtype: BinObjMgt_Persistent
") PutInteger;
		BinObjMgt_Persistent & PutInteger (const Standard_Integer theValue);
		%feature("compactdefaultargs") PutBoolean;
		%feature("autodoc", "	:param theValue:
	:type theValue: bool
	:rtype: BinObjMgt_Persistent
") PutBoolean;
		BinObjMgt_Persistent & PutBoolean (const Standard_Boolean theValue);
		%feature("compactdefaultargs") PutReal;
		%feature("autodoc", "	:param theValue:
	:type theValue: float
	:rtype: BinObjMgt_Persistent
") PutReal;
		BinObjMgt_Persistent & PutReal (const Standard_Real theValue);
		%feature("compactdefaultargs") PutShortReal;
		%feature("autodoc", "	:param theValue:
	:type theValue: Standard_ShortReal
	:rtype: BinObjMgt_Persistent
") PutShortReal;
		BinObjMgt_Persistent & PutShortReal (const Standard_ShortReal theValue);
		%feature("compactdefaultargs") PutCString;
		%feature("autodoc", "	* Offset in output buffer is not aligned

	:param theValue:
	:type theValue: char *
	:rtype: BinObjMgt_Persistent
") PutCString;
		BinObjMgt_Persistent & PutCString (const char * theValue);
		%feature("compactdefaultargs") PutAsciiString;
		%feature("autodoc", "	* Offset in output buffer is word-aligned

	:param theValue:
	:type theValue: TCollection_AsciiString &
	:rtype: BinObjMgt_Persistent
") PutAsciiString;
		BinObjMgt_Persistent & PutAsciiString (const TCollection_AsciiString & theValue);
		%feature("compactdefaultargs") PutExtendedString;
		%feature("autodoc", "	* Offset in output buffer is word-aligned

	:param theValue:
	:type theValue: TCollection_ExtendedString &
	:rtype: BinObjMgt_Persistent
") PutExtendedString;
		BinObjMgt_Persistent & PutExtendedString (const TCollection_ExtendedString & theValue);
		%feature("compactdefaultargs") PutLabel;
		%feature("autodoc", "	:param theValue:
	:type theValue: TDF_Label &
	:rtype: BinObjMgt_Persistent
") PutLabel;
		BinObjMgt_Persistent & PutLabel (const TDF_Label & theValue);
		%feature("compactdefaultargs") PutGUID;
		%feature("autodoc", "	:param theValue:
	:type theValue: Standard_GUID &
	:rtype: BinObjMgt_Persistent
") PutGUID;
		BinObjMgt_Persistent & PutGUID (const Standard_GUID & theValue);
		%feature("compactdefaultargs") PutCharArray;
		%feature("autodoc", "	* Put C array of char, theLength is the number of elements

	:param theArray:
	:type theArray: BinObjMgt_PChar
	:param theLength:
	:type theLength: int
	:rtype: BinObjMgt_Persistent
") PutCharArray;
		BinObjMgt_Persistent & PutCharArray (const BinObjMgt_PChar theArray,const Standard_Integer theLength);
		%feature("compactdefaultargs") PutByteArray;
		%feature("autodoc", "	* Put C array of unsigned chars, theLength is the number of elements

	:param theArray:
	:type theArray: BinObjMgt_PByte
	:param theLength:
	:type theLength: int
	:rtype: BinObjMgt_Persistent
") PutByteArray;
		BinObjMgt_Persistent & PutByteArray (const BinObjMgt_PByte theArray,const Standard_Integer theLength);
		%feature("compactdefaultargs") PutExtCharArray;
		%feature("autodoc", "	* Put C array of ExtCharacter, theLength is the number of elements

	:param theArray:
	:type theArray: BinObjMgt_PExtChar
	:param theLength:
	:type theLength: int
	:rtype: BinObjMgt_Persistent
") PutExtCharArray;
		BinObjMgt_Persistent & PutExtCharArray (const BinObjMgt_PExtChar theArray,const Standard_Integer theLength);
		%feature("compactdefaultargs") PutIntArray;
		%feature("autodoc", "	* Put C array of int, theLength is the number of elements

	:param theArray:
	:type theArray: BinObjMgt_PInteger
	:param theLength:
	:type theLength: int
	:rtype: BinObjMgt_Persistent
") PutIntArray;
		BinObjMgt_Persistent & PutIntArray (const BinObjMgt_PInteger theArray,const Standard_Integer theLength);
		%feature("compactdefaultargs") PutRealArray;
		%feature("autodoc", "	* Put C array of double, theLength is the number of elements

	:param theArray:
	:type theArray: BinObjMgt_PReal
	:param theLength:
	:type theLength: int
	:rtype: BinObjMgt_Persistent
") PutRealArray;
		BinObjMgt_Persistent & PutRealArray (const BinObjMgt_PReal theArray,const Standard_Integer theLength);
		%feature("compactdefaultargs") PutShortRealArray;
		%feature("autodoc", "	* Put C array of float, theLength is the number of elements

	:param theArray:
	:type theArray: BinObjMgt_PShortReal
	:param theLength:
	:type theLength: int
	:rtype: BinObjMgt_Persistent
") PutShortRealArray;
		BinObjMgt_Persistent & PutShortRealArray (const BinObjMgt_PShortReal theArray,const Standard_Integer theLength);
		%feature("compactdefaultargs") GetCharacter;
		%feature("autodoc", "	:param theValue:
	:type theValue: Standard_Character &
	:rtype: BinObjMgt_Persistent
") GetCharacter;
		const BinObjMgt_Persistent & GetCharacter (Standard_Character & theValue);
		%feature("compactdefaultargs") operator >>;
		%feature("autodoc", "	:param theValue:
	:type theValue: Standard_Character &
	:rtype: BinObjMgt_Persistent
") operator >>;
		const BinObjMgt_Persistent & operator >> (Standard_Character & theValue);
		%feature("compactdefaultargs") GetByte;
		%feature("autodoc", "	:param theValue:
	:type theValue: Standard_Byte &
	:rtype: BinObjMgt_Persistent
") GetByte;
		const BinObjMgt_Persistent & GetByte (Standard_Byte & theValue);
		%feature("compactdefaultargs") operator >>;
		%feature("autodoc", "	:param theValue:
	:type theValue: Standard_Byte &
	:rtype: BinObjMgt_Persistent
") operator >>;
		const BinObjMgt_Persistent & operator >> (Standard_Byte & theValue);
		%feature("compactdefaultargs") GetExtCharacter;
		%feature("autodoc", "	:param theValue:
	:type theValue: Standard_ExtCharacter &
	:rtype: BinObjMgt_Persistent
") GetExtCharacter;
		const BinObjMgt_Persistent & GetExtCharacter (Standard_ExtCharacter & theValue);
		%feature("compactdefaultargs") operator >>;
		%feature("autodoc", "	:param theValue:
	:type theValue: Standard_ExtCharacter &
	:rtype: BinObjMgt_Persistent
") operator >>;
		const BinObjMgt_Persistent & operator >> (Standard_ExtCharacter & theValue);
		%feature("compactdefaultargs") GetInteger;
		%feature("autodoc", "	:param theValue:
	:type theValue: int &
	:rtype: BinObjMgt_Persistent
") GetInteger;
		const BinObjMgt_Persistent & GetInteger (Standard_Integer &OutValue);
		%feature("compactdefaultargs") operator >>;
		%feature("autodoc", "	:param theValue:
	:type theValue: int &
	:rtype: BinObjMgt_Persistent
") operator >>;
		const BinObjMgt_Persistent & operator >> (Standard_Integer &OutValue);
		%feature("compactdefaultargs") GetBoolean;
		%feature("autodoc", "	:param theValue:
	:type theValue: bool
	:rtype: BinObjMgt_Persistent
") GetBoolean;
		const BinObjMgt_Persistent & GetBoolean (Standard_Boolean &OutValue);
		%feature("compactdefaultargs") operator >>;
		%feature("autodoc", "	:param theValue:
	:type theValue: bool
	:rtype: BinObjMgt_Persistent
") operator >>;
		const BinObjMgt_Persistent & operator >> (Standard_Boolean &OutValue);
		%feature("compactdefaultargs") GetReal;
		%feature("autodoc", "	:param theValue:
	:type theValue: float &
	:rtype: BinObjMgt_Persistent
") GetReal;
		const BinObjMgt_Persistent & GetReal (Standard_Real &OutValue);
		%feature("compactdefaultargs") operator >>;
		%feature("autodoc", "	:param theValue:
	:type theValue: float &
	:rtype: BinObjMgt_Persistent
") operator >>;
		const BinObjMgt_Persistent & operator >> (Standard_Real &OutValue);
		%feature("compactdefaultargs") GetShortReal;
		%feature("autodoc", "	:param theValue:
	:type theValue: Standard_ShortReal &
	:rtype: BinObjMgt_Persistent
") GetShortReal;
		const BinObjMgt_Persistent & GetShortReal (Standard_ShortReal & theValue);
		%feature("compactdefaultargs") operator >>;
		%feature("autodoc", "	:param theValue:
	:type theValue: Standard_ShortReal &
	:rtype: BinObjMgt_Persistent
") operator >>;
		const BinObjMgt_Persistent & operator >> (Standard_ShortReal & theValue);
		%feature("compactdefaultargs") GetAsciiString;
		%feature("autodoc", "	:param theValue:
	:type theValue: TCollection_AsciiString &
	:rtype: BinObjMgt_Persistent
") GetAsciiString;
		const BinObjMgt_Persistent & GetAsciiString (TCollection_AsciiString & theValue);
		%feature("compactdefaultargs") operator >>;
		%feature("autodoc", "	:param theValue:
	:type theValue: TCollection_AsciiString &
	:rtype: BinObjMgt_Persistent
") operator >>;
		const BinObjMgt_Persistent & operator >> (TCollection_AsciiString & theValue);
		%feature("compactdefaultargs") GetExtendedString;
		%feature("autodoc", "	:param theValue:
	:type theValue: TCollection_ExtendedString &
	:rtype: BinObjMgt_Persistent
") GetExtendedString;
		const BinObjMgt_Persistent & GetExtendedString (TCollection_ExtendedString & theValue);
		%feature("compactdefaultargs") operator >>;
		%feature("autodoc", "	:param theValue:
	:type theValue: TCollection_ExtendedString &
	:rtype: BinObjMgt_Persistent
") operator >>;
		const BinObjMgt_Persistent & operator >> (TCollection_ExtendedString & theValue);
		%feature("compactdefaultargs") GetLabel;
		%feature("autodoc", "	:param theDS:
	:type theDS: Handle_TDF_Data &
	:param theValue:
	:type theValue: TDF_Label &
	:rtype: BinObjMgt_Persistent
") GetLabel;
		const BinObjMgt_Persistent & GetLabel (const Handle_TDF_Data & theDS,TDF_Label & theValue);
		%feature("compactdefaultargs") GetGUID;
		%feature("autodoc", "	:param theValue:
	:type theValue: Standard_GUID &
	:rtype: BinObjMgt_Persistent
") GetGUID;
		const BinObjMgt_Persistent & GetGUID (Standard_GUID & theValue);
		%feature("compactdefaultargs") operator >>;
		%feature("autodoc", "	:param theValue:
	:type theValue: Standard_GUID &
	:rtype: BinObjMgt_Persistent
") operator >>;
		const BinObjMgt_Persistent & operator >> (Standard_GUID & theValue);
		%feature("compactdefaultargs") GetCharArray;
		%feature("autodoc", "	* Get C array of char, theLength is the number of elements; theArray must point to a space enough to place theLength elements

	:param theArray:
	:type theArray: BinObjMgt_PChar
	:param theLength:
	:type theLength: int
	:rtype: BinObjMgt_Persistent
") GetCharArray;
		const BinObjMgt_Persistent & GetCharArray (const BinObjMgt_PChar theArray,const Standard_Integer theLength);
		%feature("compactdefaultargs") GetByteArray;
		%feature("autodoc", "	* Get C array of unsigned chars, theLength is the number of elements; theArray must point to a space enough to place theLength elements

	:param theArray:
	:type theArray: BinObjMgt_PByte
	:param theLength:
	:type theLength: int
	:rtype: BinObjMgt_Persistent
") GetByteArray;
		const BinObjMgt_Persistent & GetByteArray (const BinObjMgt_PByte theArray,const Standard_Integer theLength);
		%feature("compactdefaultargs") GetExtCharArray;
		%feature("autodoc", "	* Get C array of ExtCharacter, theLength is the number of elements; theArray must point to a space enough to place theLength elements

	:param theArray:
	:type theArray: BinObjMgt_PExtChar
	:param theLength:
	:type theLength: int
	:rtype: BinObjMgt_Persistent
") GetExtCharArray;
		const BinObjMgt_Persistent & GetExtCharArray (const BinObjMgt_PExtChar theArray,const Standard_Integer theLength);
		%feature("compactdefaultargs") GetIntArray;
		%feature("autodoc", "	* Get C array of int, theLength is the number of elements; theArray must point to a space enough to place theLength elements

	:param theArray:
	:type theArray: BinObjMgt_PInteger
	:param theLength:
	:type theLength: int
	:rtype: BinObjMgt_Persistent
") GetIntArray;
		const BinObjMgt_Persistent & GetIntArray (const BinObjMgt_PInteger theArray,const Standard_Integer theLength);
		%feature("compactdefaultargs") GetRealArray;
		%feature("autodoc", "	* Get C array of double, theLength is the number of elements; theArray must point to a space enough to place theLength elements

	:param theArray:
	:type theArray: BinObjMgt_PReal
	:param theLength:
	:type theLength: int
	:rtype: BinObjMgt_Persistent
") GetRealArray;
		const BinObjMgt_Persistent & GetRealArray (const BinObjMgt_PReal theArray,const Standard_Integer theLength);
		%feature("compactdefaultargs") GetShortRealArray;
		%feature("autodoc", "	* Get C array of float, theLength is the number of elements; theArray must point to a space enough to place theLength elements

	:param theArray:
	:type theArray: BinObjMgt_PShortReal
	:param theLength:
	:type theLength: int
	:rtype: BinObjMgt_Persistent
") GetShortRealArray;
		const BinObjMgt_Persistent & GetShortRealArray (const BinObjMgt_PShortReal theArray,const Standard_Integer theLength);
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "	* Tells the current position for get/put

	:rtype: int
") Position;
		Standard_Integer Position ();
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "	* Sets the current position for get/put. Resets an error state depending on the validity of thePos. Returns the new state (value of IsOK())

	:param thePos:
	:type thePos: int
	:rtype: bool
") SetPosition;
		Standard_Boolean SetPosition (const Standard_Integer thePos);
		%feature("compactdefaultargs") Truncate;
		%feature("autodoc", "	* Truncates the buffer by current position, i.e. updates mySize

	:rtype: None
") Truncate;
		void Truncate ();
		%feature("compactdefaultargs") IsError;
		%feature("autodoc", "	* Indicates an error after Get methods or SetPosition

	:rtype: bool
") IsError;
		Standard_Boolean IsError ();
		%feature("compactdefaultargs") operator !;
		%feature("autodoc", "	:rtype: bool
") operator !;
		Standard_Boolean operator ! ();
		%feature("compactdefaultargs") IsOK;
		%feature("autodoc", "	* Indicates a good state after Get methods or SetPosition

	:rtype: bool
") IsOK;
		Standard_Boolean IsOK ();
		%feature("compactdefaultargs") operator Standard_Boolean;
		%feature("autodoc", "	:rtype: None
") operator Standard_Boolean;
		 operator Standard_Boolean ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes me to reuse again

	:rtype: None
") Init;
		void Init ();
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "	* Sets the Id of the object

	:param theId:
	:type theId: int
	:rtype: None
") SetId;
		void SetId (const Standard_Integer theId);
		%feature("compactdefaultargs") SetTypeId;
		%feature("autodoc", "	* Sets the Id of the type of the object

	:param theId:
	:type theId: int
	:rtype: None
") SetTypeId;
		void SetTypeId (const Standard_Integer theId);
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "	* Returns the Id of the object

	:rtype: int
") Id;
		Standard_Integer Id ();
		%feature("compactdefaultargs") TypeId;
		%feature("autodoc", "	* Returns the Id of the type of the object

	:rtype: int
") TypeId;
		Standard_Integer TypeId ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	* Returns the length of data

	:rtype: int
") Length;
		Standard_Integer Length ();

        %feature("autodoc", "1");
        %extend{
            std::string WriteToString() {
            std::stringstream s;
            self->Write(s);
            return s.str();}
        };
        
        %feature("autodoc", "1");
        %extend{
            void ReadFromString(std::string src) {
            std::stringstream s(src);
            self->Read(s);}
        };
        		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	* Frees the allocated memory; This object can be reused after call to Init

	:rtype: None
") Destroy;
		void Destroy ();
};


%extend BinObjMgt_Persistent {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
