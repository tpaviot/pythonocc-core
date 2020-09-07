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
%define XMLOBJMGTDOCSTRING
"XmlObjMgt module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_xmlobjmgt.html"
%enddef
%module (package="OCC.Core", docstring=XMLOBJMGTDOCSTRING) XmlObjMgt


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
#include<XmlObjMgt_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<LDOM_module.hxx>
#include<TCollection_module.hxx>
#include<gp_module.hxx>
#include<TColStd_module.hxx>
#include<Storage_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import LDOM.i
%import TCollection.i
%import gp.i
%import TColStd.i
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
typedef LDOMString XmlObjMgt_DOMString;
typedef LDOM_Document XmlObjMgt_Document;
typedef LDOM_Element XmlObjMgt_Element;
/* end typedefs declaration */

/******************
* class XmlObjMgt *
******************/
%rename(xmlobjmgt) XmlObjMgt;
class XmlObjMgt {
	public:
		/****************** FindChildByName ******************/
		/**** md5 signature: a75d050d81bca4eb415eff378a7e3590 ****/
		%feature("compactdefaultargs") FindChildByName;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: XmlObjMgt_Element
theName: XmlObjMgt_DOMString

Returns
-------
XmlObjMgt_Element
") FindChildByName;
		static XmlObjMgt_Element FindChildByName(const XmlObjMgt_Element & theSource, const XmlObjMgt_DOMString & theName);

		/****************** FindChildByRef ******************/
		/**** md5 signature: 1a0ceab4ebfe596c7c51007d742ab107 ****/
		%feature("compactdefaultargs") FindChildByRef;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: XmlObjMgt_Element
theRefName: XmlObjMgt_DOMString

Returns
-------
XmlObjMgt_Element
") FindChildByRef;
		static XmlObjMgt_Element FindChildByRef(const XmlObjMgt_Element & theSource, const XmlObjMgt_DOMString & theRefName);

		/****************** FindChildElement ******************/
		/**** md5 signature: a6b6ec12c3b888a80034e04c66699567 ****/
		%feature("compactdefaultargs") FindChildElement;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: XmlObjMgt_Element
theObjId: int

Returns
-------
XmlObjMgt_Element
") FindChildElement;
		static XmlObjMgt_Element FindChildElement(const XmlObjMgt_Element & theSource, const Standard_Integer theObjId);

		/****************** GetExtendedString ******************/
		/**** md5 signature: 136f136e14474041cd38ff8a7feae0c0 ****/
		%feature("compactdefaultargs") GetExtendedString;
		%feature("autodoc", "Get attribute <theelement extstring='thestring' ...>.

Parameters
----------
theElement: XmlObjMgt_Element
theString: TCollection_ExtendedString

Returns
-------
bool
") GetExtendedString;
		static Standard_Boolean GetExtendedString(const XmlObjMgt_Element & theElement, TCollection_ExtendedString & theString);

		/****************** GetInteger ******************/
		/**** md5 signature: d90d1ac036196cdb858a419d79e08e97 ****/
		%feature("compactdefaultargs") GetInteger;
		%feature("autodoc", "No available documentation.

Parameters
----------
theString: char *

Returns
-------
theValue: int
") GetInteger;
		static Standard_Boolean GetInteger(const char * & theString, Standard_Integer &OutValue);

		/****************** GetReal ******************/
		/**** md5 signature: c37d4b711d18ff859f0aa8adfb17c76c ****/
		%feature("compactdefaultargs") GetReal;
		%feature("autodoc", "No available documentation.

Parameters
----------
theString: char *

Returns
-------
theValue: float
") GetReal;
		static Standard_Boolean GetReal(const char * & theString, Standard_Real &OutValue);

		/****************** GetReal ******************/
		/**** md5 signature: b83dcb37b66853c6106221ca771fbd92 ****/
		%feature("compactdefaultargs") GetReal;
		%feature("autodoc", "No available documentation.

Parameters
----------
theString: XmlObjMgt_DOMString

Returns
-------
theValue: float
") GetReal;
		static Standard_Boolean GetReal(const XmlObjMgt_DOMString & theString, Standard_Real &OutValue);

		/****************** GetStringValue ******************/
		/**** md5 signature: a5314a871737b97c2a3d6c8bf34c640a ****/
		%feature("compactdefaultargs") GetStringValue;
		%feature("autodoc", "Returns the first child text node.

Parameters
----------
theElement: XmlObjMgt_Element

Returns
-------
XmlObjMgt_DOMString
") GetStringValue;
		static XmlObjMgt_DOMString GetStringValue(const XmlObjMgt_Element & theElement);

		/****************** GetTagEntryString ******************/
		/**** md5 signature: 4f9418066c51e679fd92757daba89516 ****/
		%feature("compactdefaultargs") GetTagEntryString;
		%feature("autodoc", "Convert xpath expression (domstring) into tagentry string returns false on error.

Parameters
----------
theTarget: XmlObjMgt_DOMString
theTagEntry: TCollection_AsciiString

Returns
-------
bool
") GetTagEntryString;
		static Standard_Boolean GetTagEntryString(const XmlObjMgt_DOMString & theTarget, TCollection_AsciiString & theTagEntry);

		/****************** IdString ******************/
		/**** md5 signature: 8d8ab1717494a399f6f224b4840e10a1 ****/
		%feature("compactdefaultargs") IdString;
		%feature("autodoc", "Define the name of xmlattribute 'id' (to be used everywhere).

Returns
-------
XmlObjMgt_DOMString
") IdString;
		static const XmlObjMgt_DOMString & IdString();

		/****************** SetExtendedString ******************/
		/**** md5 signature: 4178cc6b405d431f892c6c72da9e4373 ****/
		%feature("compactdefaultargs") SetExtendedString;
		%feature("autodoc", "Add attribute <theelement extstring='thestring' ...>.

Parameters
----------
theElement: XmlObjMgt_Element
theString: TCollection_ExtendedString

Returns
-------
bool
") SetExtendedString;
		static Standard_Boolean SetExtendedString(XmlObjMgt_Element & theElement, const TCollection_ExtendedString & theString);

		/****************** SetStringValue ******************/
		/**** md5 signature: 74078f466a38d1f08a9d785fc20e9665 ****/
		%feature("compactdefaultargs") SetStringValue;
		%feature("autodoc", "Add thedata as the last child text node to theelement iscleartext(true) avoids analysis of the string and replacement of characters like '<' and '&' during xml file storage. do never set iscleartext unless you have a hell of a reason.

Parameters
----------
theElement: XmlObjMgt_Element
theData: XmlObjMgt_DOMString
isClearText: bool,optional
	default value is Standard_False

Returns
-------
None
") SetStringValue;
		static void SetStringValue(XmlObjMgt_Element & theElement, const XmlObjMgt_DOMString & theData, const Standard_Boolean isClearText = Standard_False);

		/****************** SetTagEntryString ******************/
		/**** md5 signature: 70776993b0396a9d284a0a2ba2e51015 ****/
		%feature("compactdefaultargs") SetTagEntryString;
		%feature("autodoc", "Convert xpath expression (domstring) into tagentry string returns false on error.

Parameters
----------
theSource: XmlObjMgt_DOMString
theTagEntry: TCollection_AsciiString

Returns
-------
None
") SetTagEntryString;
		static void SetTagEntryString(XmlObjMgt_DOMString & theSource, const TCollection_AsciiString & theTagEntry);

};


%extend XmlObjMgt {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class XmlObjMgt_Array1 *
*************************/
class XmlObjMgt_Array1 {
	public:
		/****************** XmlObjMgt_Array1 ******************/
		/**** md5 signature: b94d916b29278d329b3a83495b11792c ****/
		%feature("compactdefaultargs") XmlObjMgt_Array1;
		%feature("autodoc", "Create an array of lower bound <low> and upper bound <up>. range error is raised when <up> is less than <low>.

Parameters
----------
Low: int
Up: int

Returns
-------
None
") XmlObjMgt_Array1;
		 XmlObjMgt_Array1(const Standard_Integer Low, const Standard_Integer Up);

		/****************** XmlObjMgt_Array1 ******************/
		/**** md5 signature: 520e456f21ce8aacc48a55565855c678 ****/
		%feature("compactdefaultargs") XmlObjMgt_Array1;
		%feature("autodoc", "For restoration from dom_element which is child of theparent: <theparent ...> <thename ...>.

Parameters
----------
theParent: XmlObjMgt_Element
theName: XmlObjMgt_DOMString

Returns
-------
None
") XmlObjMgt_Array1;
		 XmlObjMgt_Array1(const XmlObjMgt_Element & theParent, const XmlObjMgt_DOMString & theName);

		/****************** CreateArrayElement ******************/
		/**** md5 signature: 0c13e4be8117fe1898a3cdb3d2a98b58 ****/
		%feature("compactdefaultargs") CreateArrayElement;
		%feature("autodoc", "Create dom_element representing the array, under 'theparent'.

Parameters
----------
theParent: XmlObjMgt_Element
theName: XmlObjMgt_DOMString

Returns
-------
None
") CreateArrayElement;
		void CreateArrayElement(XmlObjMgt_Element & theParent, const XmlObjMgt_DOMString & theName);

		/****************** Element ******************/
		/**** md5 signature: b048e740461d546184db9889ca335c27 ****/
		%feature("compactdefaultargs") Element;
		%feature("autodoc", "Returns the dom element of <self>.

Returns
-------
XmlObjMgt_Element
") Element;
		const XmlObjMgt_Element & Element();

		/****************** Length ******************/
		/**** md5 signature: 58bd40380acccb2733bfbd37bf3cbb11 ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Returns the number of elements of <self>.

Returns
-------
int
") Length;
		Standard_Integer Length();

		/****************** Lower ******************/
		/**** md5 signature: fe1655437e349162aeffc9b3814347af ****/
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "Returns the lower bound.

Returns
-------
int
") Lower;
		Standard_Integer Lower();

		/****************** SetValue ******************/
		/**** md5 signature: 3beae0769af4949b70174c49f2ea2785 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Set the <index>th element of the array to <value>.

Parameters
----------
Index: int
Value: XmlObjMgt_Element

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Integer Index, XmlObjMgt_Element & Value);

		/****************** Upper ******************/
		/**** md5 signature: 8f614b31058bb30bdf81ecd0e2d444dc ****/
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "Returns the upper bound.

Returns
-------
int
") Upper;
		Standard_Integer Upper();

		/****************** Value ******************/
		/**** md5 signature: 294c5c8d6b5bddb45570bc5d98ec864d ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the value of <index>th element of the array.

Parameters
----------
Index: int

Returns
-------
XmlObjMgt_Element
") Value;
		XmlObjMgt_Element Value(const Standard_Integer Index);

};


%extend XmlObjMgt_Array1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class XmlObjMgt_GP *
*********************/
class XmlObjMgt_GP {
	public:
		/****************** Translate ******************/
		/**** md5 signature: 02dd6c165ac9328093cf6d6aaf9d0574 ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "No available documentation.

Parameters
----------
aTrsf: gp_Trsf

Returns
-------
XmlObjMgt_DOMString
") Translate;
		static XmlObjMgt_DOMString Translate(const gp_Trsf & aTrsf);

		/****************** Translate ******************/
		/**** md5 signature: a7d3f88b8aa60c810f5db65935aabba3 ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "No available documentation.

Parameters
----------
aMat: gp_Mat

Returns
-------
XmlObjMgt_DOMString
") Translate;
		static XmlObjMgt_DOMString Translate(const gp_Mat & aMat);

		/****************** Translate ******************/
		/**** md5 signature: 64aedd490b6ef234f557276f99485e21 ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "No available documentation.

Parameters
----------
anXYZ: gp_XYZ

Returns
-------
XmlObjMgt_DOMString
") Translate;
		static XmlObjMgt_DOMString Translate(const gp_XYZ & anXYZ);

		/****************** Translate ******************/
		/**** md5 signature: 661191a6cd4017fb1a7ada23bbde152c ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "No available documentation.

Parameters
----------
aStr: XmlObjMgt_DOMString
T: gp_Trsf

Returns
-------
bool
") Translate;
		static Standard_Boolean Translate(const XmlObjMgt_DOMString & aStr, gp_Trsf & T);

		/****************** Translate ******************/
		/**** md5 signature: 6b0d1a755f295d6b94dd165af444fef5 ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "No available documentation.

Parameters
----------
aStr: XmlObjMgt_DOMString
T: gp_Mat

Returns
-------
bool
") Translate;
		static Standard_Boolean Translate(const XmlObjMgt_DOMString & aStr, gp_Mat & T);

		/****************** Translate ******************/
		/**** md5 signature: 144d51ff939bd1bc0e2e4bd7a5b9dd65 ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "No available documentation.

Parameters
----------
aStr: XmlObjMgt_DOMString
T: gp_XYZ

Returns
-------
bool
") Translate;
		static Standard_Boolean Translate(const XmlObjMgt_DOMString & aStr, gp_XYZ & T);

};


%extend XmlObjMgt_GP {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class XmlObjMgt_Persistent *
*****************************/
class XmlObjMgt_Persistent {
	public:
		/****************** XmlObjMgt_Persistent ******************/
		/**** md5 signature: 99c79c821358b917b8a8a6909ca0be51 ****/
		%feature("compactdefaultargs") XmlObjMgt_Persistent;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") XmlObjMgt_Persistent;
		 XmlObjMgt_Persistent();

		/****************** XmlObjMgt_Persistent ******************/
		/**** md5 signature: fe13ad98157a2783593d58891b72f27b ****/
		%feature("compactdefaultargs") XmlObjMgt_Persistent;
		%feature("autodoc", "Constructor.

Parameters
----------
theElement: XmlObjMgt_Element

Returns
-------
None
") XmlObjMgt_Persistent;
		 XmlObjMgt_Persistent(const XmlObjMgt_Element & theElement);

		/****************** XmlObjMgt_Persistent ******************/
		/**** md5 signature: eb0c39d2ab04f41cd583d98cac58e04a ****/
		%feature("compactdefaultargs") XmlObjMgt_Persistent;
		%feature("autodoc", "Constructor from sub-element of element referenced by theref.

Parameters
----------
theElement: XmlObjMgt_Element
theRef: XmlObjMgt_DOMString

Returns
-------
None
") XmlObjMgt_Persistent;
		 XmlObjMgt_Persistent(const XmlObjMgt_Element & theElement, const XmlObjMgt_DOMString & theRef);

		/****************** CreateElement ******************/
		/**** md5 signature: 1f9a0fe00d48679e0faa61143a5f31fe ****/
		%feature("compactdefaultargs") CreateElement;
		%feature("autodoc", "Myelement := <thetype id='theid'/>.

Parameters
----------
theParent: XmlObjMgt_Element
theType: XmlObjMgt_DOMString
theID: int

Returns
-------
None
") CreateElement;
		void CreateElement(XmlObjMgt_Element & theParent, const XmlObjMgt_DOMString & theType, const Standard_Integer theID);

		/****************** Element ******************/
		/**** md5 signature: b048e740461d546184db9889ca335c27 ****/
		%feature("compactdefaultargs") Element;
		%feature("autodoc", "Return myelement.

Returns
-------
XmlObjMgt_Element
") Element;
		const XmlObjMgt_Element & Element();

		/****************** Element ******************/
		/**** md5 signature: cda4b976f272db0cf7f309190b0cde07 ****/
		%feature("compactdefaultargs") Element;
		%feature("autodoc", "Return myelement.

Returns
-------
XmlObjMgt_Element
") Element;
		XmlObjMgt_Element & Element();

		/****************** Id ******************/
		/**** md5 signature: bad178b94960474569631e20c0ad1e69 ****/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Id;
		Standard_Integer Id();

		/****************** SetId ******************/
		/**** md5 signature: 3131e8337f46d2a085b133db913d7e12 ****/
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "No available documentation.

Parameters
----------
theId: int

Returns
-------
None
") SetId;
		void SetId(const Standard_Integer theId);

};


%extend XmlObjMgt_Persistent {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class XmlObjMgt_RRelocationTable *
***********************************/
class XmlObjMgt_RRelocationTable : public TColStd_DataMapOfIntegerTransient {
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


%extend XmlObjMgt_RRelocationTable {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class XmlObjMgt_SRelocationTable *
***********************************/
class XmlObjMgt_SRelocationTable : public TColStd_IndexedMapOfTransient {
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


%extend XmlObjMgt_SRelocationTable {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
