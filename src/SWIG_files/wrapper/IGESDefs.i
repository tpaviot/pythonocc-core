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
%define IGESDEFSDOCSTRING
"IGESDefs module, see official documentation at
https://www.opencascade.com/doc/occt-7.6.0/refman/html/package_igesdefs.html"
%enddef
%module (package="OCC.Core", docstring=IGESDEFSDOCSTRING) IGESDefs


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
#include<IGESDefs_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<IGESData_module.hxx>
#include<TColStd_module.hxx>
#include<IGESBasic_module.hxx>
#include<TCollection_module.hxx>
#include<IGESGraph_module.hxx>
#include<Interface_module.hxx>
#include<MoniTool_module.hxx>
#include<Message_module.hxx>
#include<TopoDS_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import IGESData.i
%import TColStd.i
%import IGESBasic.i
%import TCollection.i
%import IGESGraph.i
%import Interface.i

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
%wrap_handle(IGESDefs_AssociativityDef)
%wrap_handle(IGESDefs_AttributeDef)
%wrap_handle(IGESDefs_AttributeTable)
%wrap_handle(IGESDefs_GeneralModule)
%wrap_handle(IGESDefs_GenericData)
%wrap_handle(IGESDefs_HArray1OfHArray1OfTextDisplayTemplate)
%wrap_handle(IGESDefs_MacroDef)
%wrap_handle(IGESDefs_Protocol)
%wrap_handle(IGESDefs_ReadWriteModule)
%wrap_handle(IGESDefs_SpecificModule)
%wrap_handle(IGESDefs_TabularData)
%wrap_handle(IGESDefs_UnitsData)
%wrap_handle(IGESDefs_HArray1OfTabularData)
/* end handles declaration */

/* templates */
%template(IGESDefs_Array1OfTabularData) NCollection_Array1<opencascade::handle<IGESDefs_TabularData>>;

%extend NCollection_Array1<opencascade::handle<IGESDefs_TabularData>> {
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
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1 <opencascade::handle <IGESDefs_TabularData>> IGESDefs_Array1OfTabularData;
/* end typedefs declaration */

/*****************
* class IGESDefs *
*****************/
%rename(igesdefs) IGESDefs;
class IGESDefs {
	public:
		/****************** Init ******************/
		/**** md5 signature: 342fdccc4643f67c269591c4b6447108 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Prepares dynamic data (protocol, modules) for this package.

Returns
-------
void
") Init;
		static void Init();

		/****************** Protocol ******************/
		/**** md5 signature: 62928c9fe0745c149c3365c04fd0bb44 ****/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Returns the protocol for this package.

Returns
-------
opencascade::handle<IGESDefs_Protocol>
") Protocol;
		static opencascade::handle<IGESDefs_Protocol> Protocol();

};


%extend IGESDefs {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class IGESDefs_AssociativityDef *
**********************************/
class IGESDefs_AssociativityDef : public IGESData_IGESEntity {
	public:
		/****************** IGESDefs_AssociativityDef ******************/
		/**** md5 signature: 3316d7775cfdf24f966c458997826688 ****/
		%feature("compactdefaultargs") IGESDefs_AssociativityDef;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESDefs_AssociativityDef;
		 IGESDefs_AssociativityDef();

		/****************** BackPointerReq ******************/
		/**** md5 signature: 10c6158026c782c05474dd3ef5ea3987 ****/
		%feature("compactdefaultargs") BackPointerReq;
		%feature("autodoc", "Returns 1 or 2 raises exception if classnum <= 0 or classnum > nbclassdefs().

Parameters
----------
ClassNum: int

Returns
-------
int
") BackPointerReq;
		Standard_Integer BackPointerReq(const Standard_Integer ClassNum);

		/****************** ClassOrder ******************/
		/**** md5 signature: ab5555a8cee0376612e57238b05b8dd3 ****/
		%feature("compactdefaultargs") ClassOrder;
		%feature("autodoc", "Returns 1 or 2 raises exception if classnum <= 0 or classnum > nbclassdefs().

Parameters
----------
ClassNum: int

Returns
-------
int
") ClassOrder;
		Standard_Integer ClassOrder(const Standard_Integer ClassNum);

		/****************** Init ******************/
		/**** md5 signature: ac35eeb0ae6408067024ac00039d6575 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class associativitydef - requirements : back pointers requirements - orders : class orders - numitems : number of items per class - items : items in each class raises exception if lengths of the arrays are not the same.

Parameters
----------
requirements: TColStd_HArray1OfInteger
orders: TColStd_HArray1OfInteger
numItems: TColStd_HArray1OfInteger
items: IGESBasic_HArray1OfHArray1OfInteger

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TColStd_HArray1OfInteger> & requirements, const opencascade::handle<TColStd_HArray1OfInteger> & orders, const opencascade::handle<TColStd_HArray1OfInteger> & numItems, const opencascade::handle<IGESBasic_HArray1OfHArray1OfInteger> & items);

		/****************** IsBackPointerReq ******************/
		/**** md5 signature: 8a3b0374cf8a8b3bb33e7c594320f9cb ****/
		%feature("compactdefaultargs") IsBackPointerReq;
		%feature("autodoc", "Returns 1 if the thebackpointerreqs(classnum) = 1 returns 0 if the thebackpointerreqs(classnum) = 2 raises exception if classnum <= 0 or classnum > nbclassdefs().

Parameters
----------
ClassNum: int

Returns
-------
bool
") IsBackPointerReq;
		Standard_Boolean IsBackPointerReq(const Standard_Integer ClassNum);

		/****************** IsOrdered ******************/
		/**** md5 signature: 30003ec5c08ec8203ec75eb5b7422654 ****/
		%feature("compactdefaultargs") IsOrdered;
		%feature("autodoc", "Returns 1 if theclassorders(classnum) = 1 (ordered class) returns 0 if theclassorders(classnum) = 2 (unordered class) raises exception if classnum <= 0 or classnum > nbclassdefs().

Parameters
----------
ClassNum: int

Returns
-------
bool
") IsOrdered;
		Standard_Boolean IsOrdered(const Standard_Integer ClassNum);

		/****************** Item ******************/
		/**** md5 signature: 1e6b2a50d6fe311ee3605e44273fe402 ****/
		%feature("compactdefaultargs") Item;
		%feature("autodoc", "Returns itemnum'th item of classnum'th class raises exception if classnum <= 0 or classnum > nbclassdefs() itemnum <= 0 or itemnum > nbitemsperclass(classnum).

Parameters
----------
ClassNum: int
ItemNum: int

Returns
-------
int
") Item;
		Standard_Integer Item(const Standard_Integer ClassNum, const Standard_Integer ItemNum);

		/****************** NbClassDefs ******************/
		/**** md5 signature: 07ad2c2d25dd8d14305f22fce4e413b1 ****/
		%feature("compactdefaultargs") NbClassDefs;
		%feature("autodoc", "Returns the number of class definitions.

Returns
-------
int
") NbClassDefs;
		Standard_Integer NbClassDefs();

		/****************** NbItemsPerClass ******************/
		/**** md5 signature: 170e81a99fa41a0d38c31bb6b6ce858e ****/
		%feature("compactdefaultargs") NbItemsPerClass;
		%feature("autodoc", "Returns no. of items per class entry raises exception if classnum <= 0 or classnum > nbclassdefs().

Parameters
----------
ClassNum: int

Returns
-------
int
") NbItemsPerClass;
		Standard_Integer NbItemsPerClass(const Standard_Integer ClassNum);

		/****************** SetFormNumber ******************/
		/**** md5 signature: 3324cf0241d76f0464eb1226a9a0994f ****/
		%feature("compactdefaultargs") SetFormNumber;
		%feature("autodoc", "No available documentation.

Parameters
----------
form: int

Returns
-------
None
") SetFormNumber;
		void SetFormNumber(const Standard_Integer form);

};


%make_alias(IGESDefs_AssociativityDef)

%extend IGESDefs_AssociativityDef {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IGESDefs_AttributeDef *
******************************/
class IGESDefs_AttributeDef : public IGESData_IGESEntity {
	public:
		/****************** IGESDefs_AttributeDef ******************/
		/**** md5 signature: 04d4bdbc4dfc0a8952c3bc2e5a95241f ****/
		%feature("compactdefaultargs") IGESDefs_AttributeDef;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESDefs_AttributeDef;
		 IGESDefs_AttributeDef();

		/****************** AttributeAsEntity ******************/
		/**** md5 signature: 3ea5e1b1b3424ef7cd497c6db1571394 ****/
		%feature("compactdefaultargs") AttributeAsEntity;
		%feature("autodoc", "Returns attribute value <attrnum, rank valuenum> as an entity error if indices out of range, or no value defined, or not a entity.

Parameters
----------
AttrNum: int
ValueNum: int

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") AttributeAsEntity;
		opencascade::handle<IGESData_IGESEntity> AttributeAsEntity(const Standard_Integer AttrNum, const Standard_Integer ValueNum);

		/****************** AttributeAsInteger ******************/
		/**** md5 signature: ab4276b5e77b1ba53808b3e3e66feb68 ****/
		%feature("compactdefaultargs") AttributeAsInteger;
		%feature("autodoc", "Returns attribute value <attrnum, rank valuenum> as an integer error if indices out of range, or no value defined, or not an integer.

Parameters
----------
AttrNum: int
ValueNum: int

Returns
-------
int
") AttributeAsInteger;
		Standard_Integer AttributeAsInteger(const Standard_Integer AttrNum, const Standard_Integer ValueNum);

		/****************** AttributeAsLogical ******************/
		/**** md5 signature: b5cdbaa58697d0baa94b68fd23d81a16 ****/
		%feature("compactdefaultargs") AttributeAsLogical;
		%feature("autodoc", "Returns attribute value <attrnum, rank valuenum> as a boolean error if indices out of range, or no value defined, or not a logical.

Parameters
----------
AttrNum: int
ValueNum: int

Returns
-------
bool
") AttributeAsLogical;
		Standard_Boolean AttributeAsLogical(const Standard_Integer AttrNum, const Standard_Integer ValueNum);

		/****************** AttributeAsReal ******************/
		/**** md5 signature: e416f237fa16a5ef0d55aed1b7680745 ****/
		%feature("compactdefaultargs") AttributeAsReal;
		%feature("autodoc", "Returns attribute value <attrnum, rank valuenum> as a real error if indices out of range, or no value defined, or not a real.

Parameters
----------
AttrNum: int
ValueNum: int

Returns
-------
float
") AttributeAsReal;
		Standard_Real AttributeAsReal(const Standard_Integer AttrNum, const Standard_Integer ValueNum);

		/****************** AttributeAsString ******************/
		/**** md5 signature: d15efdb87fc6fcc8fccdc7f6818f4101 ****/
		%feature("compactdefaultargs") AttributeAsString;
		%feature("autodoc", "Returns attribute value <attrnum, rank valuenum> as an integer.

Parameters
----------
AttrNum: int
ValueNum: int

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") AttributeAsString;
		opencascade::handle<TCollection_HAsciiString> AttributeAsString(const Standard_Integer AttrNum, const Standard_Integer ValueNum);

		/****************** AttributeList ******************/
		/**** md5 signature: 842a6c196ff170552eb1a99d1a362737 ****/
		%feature("compactdefaultargs") AttributeList;
		%feature("autodoc", "Returns the list of attributes <attrnum>, as a transient. its effective type depends of the type of attribute : harray1ofinteger for integer, logical(0-1), harray1ofreal for real, harray1ofhsaciistring for string, harray1ofigesentity for entity (pointer) see methods attributeas... for an accurate access.

Parameters
----------
AttrNum: int

Returns
-------
opencascade::handle<Standard_Transient>
") AttributeList;
		opencascade::handle<Standard_Transient> AttributeList(const Standard_Integer AttrNum);

		/****************** AttributeTextDisplay ******************/
		/**** md5 signature: 206c058dd86a6fbd1e00f73e74351b84 ****/
		%feature("compactdefaultargs") AttributeTextDisplay;
		%feature("autodoc", "No available documentation.

Parameters
----------
AttrNum: int
PointerNum: int

Returns
-------
opencascade::handle<IGESGraph_TextDisplayTemplate>
") AttributeTextDisplay;
		opencascade::handle<IGESGraph_TextDisplayTemplate> AttributeTextDisplay(const Standard_Integer AttrNum, const Standard_Integer PointerNum);

		/****************** AttributeType ******************/
		/**** md5 signature: 3175439c915eff90f9faace5e7fdf2a0 ****/
		%feature("compactdefaultargs") AttributeType;
		%feature("autodoc", "Returns the num'th attribute type raises exception if num <= 0 or num > nbattributes().

Parameters
----------
num: int

Returns
-------
int
") AttributeType;
		Standard_Integer AttributeType(const Standard_Integer num);

		/****************** AttributeValueCount ******************/
		/**** md5 signature: c93049611d9f11b0c4ad2a90ba2101ed ****/
		%feature("compactdefaultargs") AttributeValueCount;
		%feature("autodoc", "Returns the num'th attribute value count raises exception if num <= 0 or num > nbattributes().

Parameters
----------
num: int

Returns
-------
int
") AttributeValueCount;
		Standard_Integer AttributeValueCount(const Standard_Integer num);

		/****************** AttributeValueDataType ******************/
		/**** md5 signature: eab5884fe850d1ddba8b7442938dc0a8 ****/
		%feature("compactdefaultargs") AttributeValueDataType;
		%feature("autodoc", "Returns the num'th attribute value data type raises exception if num <= 0 or num > nbattributes().

Parameters
----------
num: int

Returns
-------
int
") AttributeValueDataType;
		Standard_Integer AttributeValueDataType(const Standard_Integer num);

		/****************** HasTableName ******************/
		/**** md5 signature: 37f4cbeb113daf1438ad19af399a4a71 ****/
		%feature("compactdefaultargs") HasTableName;
		%feature("autodoc", "Returns true if a table name is defined.

Returns
-------
bool
") HasTableName;
		Standard_Boolean HasTableName();

		/****************** HasTextDisplay ******************/
		/**** md5 signature: 8b715e75d820eb1d23388bd5a3995616 ****/
		%feature("compactdefaultargs") HasTextDisplay;
		%feature("autodoc", "Returns false if textdisplays are defined (i.e. for form = 2).

Returns
-------
bool
") HasTextDisplay;
		Standard_Boolean HasTextDisplay();

		/****************** HasValues ******************/
		/**** md5 signature: 90787a2e3d1135799eb83536df1f76bb ****/
		%feature("compactdefaultargs") HasValues;
		%feature("autodoc", "Returns false if values are defined (i.e. for form = 1 or 2).

Returns
-------
bool
") HasValues;
		Standard_Boolean HasValues();

		/****************** Init ******************/
		/**** md5 signature: 438df72cc9fc027634d960338e4c963c ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aListType: int
attrTypes: TColStd_HArray1OfInteger
attrValueDataTypes: TColStd_HArray1OfInteger
attrValueCounts: TColStd_HArray1OfInteger
attrValues: TColStd_HArray1OfTransient
attrValuePointers: IGESDefs_HArray1OfHArray1OfTextDisplayTemplate

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const Standard_Integer aListType, const opencascade::handle<TColStd_HArray1OfInteger> & attrTypes, const opencascade::handle<TColStd_HArray1OfInteger> & attrValueDataTypes, const opencascade::handle<TColStd_HArray1OfInteger> & attrValueCounts, const opencascade::handle<TColStd_HArray1OfTransient> & attrValues, const opencascade::handle<IGESDefs_HArray1OfHArray1OfTextDisplayTemplate> & attrValuePointers);

		/****************** ListType ******************/
		/**** md5 signature: ce5ebb71f9355ecd5013ee832b5074e6 ****/
		%feature("compactdefaultargs") ListType;
		%feature("autodoc", "Returns the attribute list type.

Returns
-------
int
") ListType;
		Standard_Integer ListType();

		/****************** NbAttributes ******************/
		/**** md5 signature: 030fc1ab36c5ed65e9d9eafc56462331 ****/
		%feature("compactdefaultargs") NbAttributes;
		%feature("autodoc", "Returns the number of attributes.

Returns
-------
int
") NbAttributes;
		Standard_Integer NbAttributes();

		/****************** TableName ******************/
		/**** md5 signature: c7fd15b5fd5df96e38d3169046877394 ****/
		%feature("compactdefaultargs") TableName;
		%feature("autodoc", "Returns the attribute table name, or comment (default = null, no name : seehastablename).

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") TableName;
		opencascade::handle<TCollection_HAsciiString> TableName();

};


%make_alias(IGESDefs_AttributeDef)

%extend IGESDefs_AttributeDef {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class IGESDefs_AttributeTable *
********************************/
class IGESDefs_AttributeTable : public IGESData_IGESEntity {
	public:
		/****************** IGESDefs_AttributeTable ******************/
		/**** md5 signature: aa226fc9a94661deb27ca88b00666001 ****/
		%feature("compactdefaultargs") IGESDefs_AttributeTable;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESDefs_AttributeTable;
		 IGESDefs_AttributeTable();

		/****************** AttributeAsEntity ******************/
		/**** md5 signature: 7aac35eaed94923ebf32c508e4e99443 ****/
		%feature("compactdefaultargs") AttributeAsEntity;
		%feature("autodoc", "Returns attribute value <atnum, rownum, rank valnum> as an entity error if indices out of range, or no value defined, or not an entity.

Parameters
----------
AtNum: int
Rownum: int
ValNum: int

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") AttributeAsEntity;
		opencascade::handle<IGESData_IGESEntity> AttributeAsEntity(const Standard_Integer AtNum, const Standard_Integer Rownum, const Standard_Integer ValNum);

		/****************** AttributeAsInteger ******************/
		/**** md5 signature: 697a14dc2050ab9a50675059a4b7a413 ****/
		%feature("compactdefaultargs") AttributeAsInteger;
		%feature("autodoc", "Returns attribute value <atnum, rownum, rank valnum> as an integer error if indices out of range, or no value defined, or not an integer.

Parameters
----------
AtNum: int
Rownum: int
ValNum: int

Returns
-------
int
") AttributeAsInteger;
		Standard_Integer AttributeAsInteger(const Standard_Integer AtNum, const Standard_Integer Rownum, const Standard_Integer ValNum);

		/****************** AttributeAsLogical ******************/
		/**** md5 signature: e10aa058564e9df4cdb8449963b0c71a ****/
		%feature("compactdefaultargs") AttributeAsLogical;
		%feature("autodoc", "Returns attribute value <atnum, rownum, rank valnum> as a boolean error if indices out of range, or no value defined, or not a logical.

Parameters
----------
AtNum: int
Rownum: int
ValNum: int

Returns
-------
bool
") AttributeAsLogical;
		Standard_Boolean AttributeAsLogical(const Standard_Integer AtNum, const Standard_Integer Rownum, const Standard_Integer ValNum);

		/****************** AttributeAsReal ******************/
		/**** md5 signature: 62b22a648faae8129cd1c89adfe4149d ****/
		%feature("compactdefaultargs") AttributeAsReal;
		%feature("autodoc", "Returns attribute value <atnum, rownum, rank valnum> as a real error if indices out of range, or no value defined, or not a real.

Parameters
----------
AtNum: int
Rownum: int
ValNum: int

Returns
-------
float
") AttributeAsReal;
		Standard_Real AttributeAsReal(const Standard_Integer AtNum, const Standard_Integer Rownum, const Standard_Integer ValNum);

		/****************** AttributeAsString ******************/
		/**** md5 signature: df8e0844e6a92ace105a45bc9d6d8840 ****/
		%feature("compactdefaultargs") AttributeAsString;
		%feature("autodoc", "Returns attribute value <atnum, rownum, rank valnum> as an integer.

Parameters
----------
AtNum: int
Rownum: int
ValNum: int

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") AttributeAsString;
		opencascade::handle<TCollection_HAsciiString> AttributeAsString(const Standard_Integer AtNum, const Standard_Integer Rownum, const Standard_Integer ValNum);

		/****************** AttributeList ******************/
		/**** md5 signature: 250089c5931e521c4df911bf9354cccd ****/
		%feature("compactdefaultargs") AttributeList;
		%feature("autodoc", "No available documentation.

Parameters
----------
Attribnum: int
Rownum: int

Returns
-------
opencascade::handle<Standard_Transient>
") AttributeList;
		opencascade::handle<Standard_Transient> AttributeList(const Standard_Integer Attribnum, const Standard_Integer Rownum);

		/****************** DataType ******************/
		/**** md5 signature: 10fa8499281c313fd6142eb2a040096e ****/
		%feature("compactdefaultargs") DataType;
		%feature("autodoc", "Returns the type of an attribute, given its no. : it is read in the definition. (1 : integer, 2 : real, 3 : string, 4 : entity, 6 : logical).

Parameters
----------
Atnum: int

Returns
-------
int
") DataType;
		Standard_Integer DataType(const Standard_Integer Atnum);

		/****************** Definition ******************/
		/**** md5 signature: 507c9f412198c8bffaff4b334af45f52 ****/
		%feature("compactdefaultargs") Definition;
		%feature("autodoc", "Return the structure information in directory entry, casted as an attributedef.

Returns
-------
opencascade::handle<IGESDefs_AttributeDef>
") Definition;
		opencascade::handle<IGESDefs_AttributeDef> Definition();

		/****************** Init ******************/
		/**** md5 signature: 0e2cafa3d92846b3fd50ab9e5d566392 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class attributetable - attributes : attribute instances, created as (1,nbattributes,1,nbrows) - nbrows = 1 is a particular case (form 0).

Parameters
----------
attributes: TColStd_HArray2OfTransient

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TColStd_HArray2OfTransient> & attributes);

		/****************** NbAttributes ******************/
		/**** md5 signature: 030fc1ab36c5ed65e9d9eafc56462331 ****/
		%feature("compactdefaultargs") NbAttributes;
		%feature("autodoc", "Returns number of attributes.

Returns
-------
int
") NbAttributes;
		Standard_Integer NbAttributes();

		/****************** NbRows ******************/
		/**** md5 signature: c4dc7779feadcb0368234f64487bf577 ****/
		%feature("compactdefaultargs") NbRows;
		%feature("autodoc", "Returns number of rows. remark that it is always 1 if form = 0 it means that the list of attributes (by their number, and for each one its type and valuecount) is repeated <nbrows> times.

Returns
-------
int
") NbRows;
		Standard_Integer NbRows();

		/****************** SetDefinition ******************/
		/**** md5 signature: 634caf9eaea7fe1f43395fa026ed513f ****/
		%feature("compactdefaultargs") SetDefinition;
		%feature("autodoc", "Sets a definition as structure information (works by calling initmisc).

Parameters
----------
def: IGESDefs_AttributeDef

Returns
-------
None
") SetDefinition;
		void SetDefinition(const opencascade::handle<IGESDefs_AttributeDef> & def);

		/****************** ValueCount ******************/
		/**** md5 signature: 11bb3ff71634acbb50386331f677fb43 ****/
		%feature("compactdefaultargs") ValueCount;
		%feature("autodoc", "Returns the count of value for an attribute, given its no. : it is read in the definition.

Parameters
----------
Atnum: int

Returns
-------
int
") ValueCount;
		Standard_Integer ValueCount(const Standard_Integer Atnum);

};


%make_alias(IGESDefs_AttributeTable)

%extend IGESDefs_AttributeTable {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class IGESDefs_GeneralModule *
*******************************/
class IGESDefs_GeneralModule : public IGESData_GeneralModule {
	public:
		/****************** IGESDefs_GeneralModule ******************/
		/**** md5 signature: 41563eeb0b26181f9b391225a5384a50 ****/
		%feature("compactdefaultargs") IGESDefs_GeneralModule;
		%feature("autodoc", "Creates a generalmodule from igesdefs and puts it into generallib.

Returns
-------
None
") IGESDefs_GeneralModule;
		 IGESDefs_GeneralModule();

		/****************** CategoryNumber ******************/
		/**** md5 signature: d812efe400e2084fa824301d3c147806 ****/
		%feature("compactdefaultargs") CategoryNumber;
		%feature("autodoc", "Returns a category number which characterizes an entity auxiliary for all.

Parameters
----------
CN: int
ent: Standard_Transient
shares: Interface_ShareTool

Returns
-------
int
") CategoryNumber;
		virtual Standard_Integer CategoryNumber(const Standard_Integer CN, const opencascade::handle<Standard_Transient> & ent, const Interface_ShareTool & shares);

		/****************** DirChecker ******************/
		/**** md5 signature: 06ffbfa1e4d88543cc06fdf7c67993ee ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns a dirchecker, specific for each type of entity (identified by its case number) : this dirchecker defines constraints which must be respected by the directorypart.

Parameters
----------
CN: int
ent: IGESData_IGESEntity

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** NewVoid ******************/
		/**** md5 signature: 8e184c5622d3823d145bc2105790b57a ****/
		%feature("compactdefaultargs") NewVoid;
		%feature("autodoc", "Specific creation of a new void entity.

Parameters
----------
CN: int
entto: Standard_Transient

Returns
-------
bool
") NewVoid;
		Standard_Boolean NewVoid(const Standard_Integer CN, opencascade::handle<Standard_Transient> & entto);

		/****************** OwnCheckCase ******************/
		/**** md5 signature: a04fd9a5e3c5ef0e136832f7ce57363b ****/
		%feature("compactdefaultargs") OwnCheckCase;
		%feature("autodoc", "Performs specific semantic check for each type of entity.

Parameters
----------
CN: int
ent: IGESData_IGESEntity
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheckCase;
		void OwnCheckCase(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopyCase ******************/
		/**** md5 signature: 5c0289b7b5a5ec08bef5e9dac3d445b7 ****/
		%feature("compactdefaultargs") OwnCopyCase;
		%feature("autodoc", "Copies parameters which are specific of each type of entity.

Parameters
----------
CN: int
entfrom: IGESData_IGESEntity
entto: IGESData_IGESEntity
TC: Interface_CopyTool

Returns
-------
None
") OwnCopyCase;
		void OwnCopyCase(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & entfrom, const opencascade::handle<IGESData_IGESEntity> & entto, Interface_CopyTool & TC);

		/****************** OwnSharedCase ******************/
		/**** md5 signature: 1d978dfb0f38035ed4292cc342ee187f ****/
		%feature("compactdefaultargs") OwnSharedCase;
		%feature("autodoc", "Lists the entities shared by a given igesentity <ent>, from its specific parameters : specific for each type.

Parameters
----------
CN: int
ent: IGESData_IGESEntity
iter: Interface_EntityIterator

Returns
-------
None
") OwnSharedCase;
		void OwnSharedCase(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent, Interface_EntityIterator & iter);

};


%make_alias(IGESDefs_GeneralModule)

%extend IGESDefs_GeneralModule {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IGESDefs_GenericData *
*****************************/
class IGESDefs_GenericData : public IGESData_IGESEntity {
	public:
		/****************** IGESDefs_GenericData ******************/
		/**** md5 signature: 70d804abb8868db6568e2eb7b467af47 ****/
		%feature("compactdefaultargs") IGESDefs_GenericData;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESDefs_GenericData;
		 IGESDefs_GenericData();

		/****************** Init ******************/
		/**** md5 signature: 40b9e206cec654ae65abfca73ac5367e ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class genericdata - nbpropval : number of property values - aname : property name - alltypes : property types - allvalues : property values.

Parameters
----------
nbPropVal: int
aName: TCollection_HAsciiString
allTypes: TColStd_HArray1OfInteger
allValues: TColStd_HArray1OfTransient

Returns
-------
None
") Init;
		void Init(const Standard_Integer nbPropVal, const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TColStd_HArray1OfInteger> & allTypes, const opencascade::handle<TColStd_HArray1OfTransient> & allValues);

		/****************** Name ******************/
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns property name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** NbPropertyValues ******************/
		/**** md5 signature: 0fffdeb77dedf6abde7c32e5ad90b9d8 ****/
		%feature("compactdefaultargs") NbPropertyValues;
		%feature("autodoc", "Returns the number of property values.

Returns
-------
int
") NbPropertyValues;
		Standard_Integer NbPropertyValues();

		/****************** NbTypeValuePairs ******************/
		/**** md5 signature: dc20f0a858f2df21f6ac798500b1355a ****/
		%feature("compactdefaultargs") NbTypeValuePairs;
		%feature("autodoc", "Returns the number of type/value pairs.

Returns
-------
int
") NbTypeValuePairs;
		Standard_Integer NbTypeValuePairs();

		/****************** Type ******************/
		/**** md5 signature: 6e6375a93eb5d7e2f58096aa9214b214 ****/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Returns the index'th property value data type raises exception if index <= 0 or index > nbtypevaluepairs().

Parameters
----------
Index: int

Returns
-------
int
") Type;
		Standard_Integer Type(const Standard_Integer Index);

		/****************** Value ******************/
		/**** md5 signature: 9e12567a17b9b850181e2ce6bdcde3dc ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Harray1ofinteger (length 1), harray1ofreal (length 1) for integer, real, boolean (= integer 0/1), hasciistring for string (the value itself), igesentity for entity (the value itself).

Parameters
----------
Index: int

Returns
-------
opencascade::handle<Standard_Transient>
") Value;
		opencascade::handle<Standard_Transient> Value(const Standard_Integer Index);

		/****************** ValueAsEntity ******************/
		/**** md5 signature: 23161973a15b2d64e958a00351ad049a ****/
		%feature("compactdefaultargs") ValueAsEntity;
		%feature("autodoc", "Returns attribute value <attrnum, rank valuenum> as an entity error if index out of range, or not a entity.

Parameters
----------
ValueNum: int

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") ValueAsEntity;
		opencascade::handle<IGESData_IGESEntity> ValueAsEntity(const Standard_Integer ValueNum);

		/****************** ValueAsInteger ******************/
		/**** md5 signature: 443629c0adda80434a309237cb4c3702 ****/
		%feature("compactdefaultargs") ValueAsInteger;
		%feature("autodoc", "Returns attribute value <attrnum, rank valuenum> as an integer error if index out of range, or not an integer.

Parameters
----------
ValueNum: int

Returns
-------
int
") ValueAsInteger;
		Standard_Integer ValueAsInteger(const Standard_Integer ValueNum);

		/****************** ValueAsLogical ******************/
		/**** md5 signature: 749bd7a16fcfc326fe0806e98b1e310b ****/
		%feature("compactdefaultargs") ValueAsLogical;
		%feature("autodoc", "Returns attribute value <attrnum, rank valuenum> as a boolean error if index out of range, or not a logical.

Parameters
----------
ValueNum: int

Returns
-------
bool
") ValueAsLogical;
		Standard_Boolean ValueAsLogical(const Standard_Integer ValueNum);

		/****************** ValueAsReal ******************/
		/**** md5 signature: 6d3a68745a7b77a0199a30e4c6b4c049 ****/
		%feature("compactdefaultargs") ValueAsReal;
		%feature("autodoc", "Returns attribute value <attrnum, rank valuenum> as a real error if index out of range, or not a real.

Parameters
----------
ValueNum: int

Returns
-------
float
") ValueAsReal;
		Standard_Real ValueAsReal(const Standard_Integer ValueNum);

		/****************** ValueAsString ******************/
		/**** md5 signature: e4d7a8a546f3fae82ae6dc03b36ffcc8 ****/
		%feature("compactdefaultargs") ValueAsString;
		%feature("autodoc", "Returns attribute value <attrnum, rank valuenum> as an integer.

Parameters
----------
ValueNum: int

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") ValueAsString;
		opencascade::handle<TCollection_HAsciiString> ValueAsString(const Standard_Integer ValueNum);

};


%make_alias(IGESDefs_GenericData)

%extend IGESDefs_GenericData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************************
* class IGESDefs_HArray1OfHArray1OfTextDisplayTemplate *
*******************************************************/
class IGESDefs_HArray1OfHArray1OfTextDisplayTemplate : public Standard_Transient {
	public:
		/****************** IGESDefs_HArray1OfHArray1OfTextDisplayTemplate ******************/
		/**** md5 signature: 399eddd4e95bfb758d15088856c1adb3 ****/
		%feature("compactdefaultargs") IGESDefs_HArray1OfHArray1OfTextDisplayTemplate;
		%feature("autodoc", "No available documentation.

Parameters
----------
low: int
up: int

Returns
-------
None
") IGESDefs_HArray1OfHArray1OfTextDisplayTemplate;
		 IGESDefs_HArray1OfHArray1OfTextDisplayTemplate(const Standard_Integer low, const Standard_Integer up);

		/****************** Length ******************/
		/**** md5 signature: 58bd40380acccb2733bfbd37bf3cbb11 ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Length;
		Standard_Integer Length();

		/****************** Lower ******************/
		/**** md5 signature: fe1655437e349162aeffc9b3814347af ****/
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Lower;
		Standard_Integer Lower();

		/****************** SetValue ******************/
		/**** md5 signature: fc19d29d3fe5c685fd9f8759a251fffa ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int
val: IGESGraph_HArray1OfTextDisplayTemplate

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Integer num, const opencascade::handle<IGESGraph_HArray1OfTextDisplayTemplate> & val);

		/****************** Upper ******************/
		/**** md5 signature: 8f614b31058bb30bdf81ecd0e2d444dc ****/
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Upper;
		Standard_Integer Upper();

		/****************** Value ******************/
		/**** md5 signature: f855618960f62ee384f021fd99457e40 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
opencascade::handle<IGESGraph_HArray1OfTextDisplayTemplate>
") Value;
		opencascade::handle<IGESGraph_HArray1OfTextDisplayTemplate> Value(const Standard_Integer num);

};


%make_alias(IGESDefs_HArray1OfHArray1OfTextDisplayTemplate)

%extend IGESDefs_HArray1OfHArray1OfTextDisplayTemplate {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class IGESDefs_MacroDef *
**************************/
class IGESDefs_MacroDef : public IGESData_IGESEntity {
	public:
		/****************** IGESDefs_MacroDef ******************/
		/**** md5 signature: cc8dc9202c75f4ec75e79c27b1bc5d69 ****/
		%feature("compactdefaultargs") IGESDefs_MacroDef;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESDefs_MacroDef;
		 IGESDefs_MacroDef();

		/****************** ENDMACRO ******************/
		/**** md5 signature: ece946e3241f360d4dea749ff776c386 ****/
		%feature("compactdefaultargs") ENDMACRO;
		%feature("autodoc", "Returns the endm(literal).

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") ENDMACRO;
		opencascade::handle<TCollection_HAsciiString> ENDMACRO();

		/****************** EntityTypeID ******************/
		/**** md5 signature: 638ec0054277df0ee43df9af73d65031 ****/
		%feature("compactdefaultargs") EntityTypeID;
		%feature("autodoc", "Returns the entity type id.

Returns
-------
int
") EntityTypeID;
		Standard_Integer EntityTypeID();

		/****************** Init ******************/
		/**** md5 signature: 8967bf2f365b563f93e34ee8860ad7fa ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class macrodef - macro : macro - entitytypeid : entity type id - langstatements : language statements - endmacro : end macro.

Parameters
----------
macro: TCollection_HAsciiString
entityTypeID: int
langStatements: Interface_HArray1OfHAsciiString
endMacro: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & macro, const Standard_Integer entityTypeID, const opencascade::handle<Interface_HArray1OfHAsciiString> & langStatements, const opencascade::handle<TCollection_HAsciiString> & endMacro);

		/****************** LanguageStatement ******************/
		/**** md5 signature: eb4f7cf9a95e9efdb8dd477e66dba7d9 ****/
		%feature("compactdefaultargs") LanguageStatement;
		%feature("autodoc", "No available documentation.

Parameters
----------
StatNum: int

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") LanguageStatement;
		opencascade::handle<TCollection_HAsciiString> LanguageStatement(const Standard_Integer StatNum);

		/****************** MACRO ******************/
		/**** md5 signature: 222b96201d0e2397729a0afe77c14a94 ****/
		%feature("compactdefaultargs") MACRO;
		%feature("autodoc", "Returns the macro(literal).

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") MACRO;
		opencascade::handle<TCollection_HAsciiString> MACRO();

		/****************** NbStatements ******************/
		/**** md5 signature: 406764770953c553ecbe343585a5be13 ****/
		%feature("compactdefaultargs") NbStatements;
		%feature("autodoc", "Returns the number of language statements.

Returns
-------
int
") NbStatements;
		Standard_Integer NbStatements();

};


%make_alias(IGESDefs_MacroDef)

%extend IGESDefs_MacroDef {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class IGESDefs_Protocol *
**************************/
class IGESDefs_Protocol : public IGESData_Protocol {
	public:
		/****************** IGESDefs_Protocol ******************/
		/**** md5 signature: 83f4110cf5d4367bb054eed482344910 ****/
		%feature("compactdefaultargs") IGESDefs_Protocol;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESDefs_Protocol;
		 IGESDefs_Protocol();

		/****************** NbResources ******************/
		/**** md5 signature: cd524335b33aeb6eb83cc80f6b7e5681 ****/
		%feature("compactdefaultargs") NbResources;
		%feature("autodoc", "Gives the count of resource protocol. here, one (protocol from igesgraph).

Returns
-------
int
") NbResources;
		virtual Standard_Integer NbResources();

		/****************** Resource ******************/
		/**** md5 signature: 26597e9d8db9fc70530508f766cf0d70 ****/
		%feature("compactdefaultargs") Resource;
		%feature("autodoc", "Returns a resource, given a rank.

Parameters
----------
num: int

Returns
-------
opencascade::handle<Interface_Protocol>
") Resource;
		virtual opencascade::handle<Interface_Protocol> Resource(const Standard_Integer num);

		/****************** TypeNumber ******************/
		/**** md5 signature: f4ed4f2e12d80f3bd752f6dd34ed84b4 ****/
		%feature("compactdefaultargs") TypeNumber;
		%feature("autodoc", "Returns a case number, specific of each recognized type this case number is then used in libraries : the various modules attached to this class of protocol must use them in accordance (for a given value of typenumber, they must consider the same type as the protocol defines).

Parameters
----------
atype: Standard_Type

Returns
-------
int
") TypeNumber;
		virtual Standard_Integer TypeNumber(const opencascade::handle<Standard_Type> & atype);

};


%make_alias(IGESDefs_Protocol)

%extend IGESDefs_Protocol {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IGESDefs_ReadWriteModule *
*********************************/
class IGESDefs_ReadWriteModule : public IGESData_ReadWriteModule {
	public:
		/****************** IGESDefs_ReadWriteModule ******************/
		/**** md5 signature: d39f7a69c55631d666fcd3499b8ba79f ****/
		%feature("compactdefaultargs") IGESDefs_ReadWriteModule;
		%feature("autodoc", "Creates a readwritemodule & puts it into readerlib & writerlib.

Returns
-------
None
") IGESDefs_ReadWriteModule;
		 IGESDefs_ReadWriteModule();

		/****************** CaseIGES ******************/
		/**** md5 signature: de66f0948cefad4e0218511df612ee48 ****/
		%feature("compactdefaultargs") CaseIGES;
		%feature("autodoc", "Defines case numbers for entities of igesdefs.

Parameters
----------
typenum: int
formnum: int

Returns
-------
int
") CaseIGES;
		Standard_Integer CaseIGES(const Standard_Integer typenum, const Standard_Integer formnum);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 0815b93d39da58d4605233b1d8695dc9 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file for an entity of igesdefs.

Parameters
----------
CN: int
ent: IGESData_IGESEntity
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 2eb05a73fea84c5ff17867b597f1ca7d ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
CN: int
ent: IGESData_IGESEntity
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent, IGESData_IGESWriter & IW);

};


%make_alias(IGESDefs_ReadWriteModule)

%extend IGESDefs_ReadWriteModule {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class IGESDefs_SpecificModule *
********************************/
class IGESDefs_SpecificModule : public IGESData_SpecificModule {
	public:
		/****************** IGESDefs_SpecificModule ******************/
		/**** md5 signature: 4bca24e080d426337850c9a585e1ac42 ****/
		%feature("compactdefaultargs") IGESDefs_SpecificModule;
		%feature("autodoc", "Creates a specificmodule from igesdefs & puts it into specificlib.

Returns
-------
None
") IGESDefs_SpecificModule;
		 IGESDefs_SpecificModule();

};


%make_alias(IGESDefs_SpecificModule)

%extend IGESDefs_SpecificModule {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IGESDefs_TabularData *
*****************************/
class IGESDefs_TabularData : public IGESData_IGESEntity {
	public:
		/****************** IGESDefs_TabularData ******************/
		/**** md5 signature: 3702140cc3b96d14419c4796f7af0ed6 ****/
		%feature("compactdefaultargs") IGESDefs_TabularData;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESDefs_TabularData;
		 IGESDefs_TabularData();

		/****************** ComputedNbPropertyValues ******************/
		/**** md5 signature: 1f9eccda16101c61c0935f6ffc6c975b ****/
		%feature("compactdefaultargs") ComputedNbPropertyValues;
		%feature("autodoc", "Determines the number of property values required.

Returns
-------
int
") ComputedNbPropertyValues;
		Standard_Integer ComputedNbPropertyValues();

		/****************** DependentValue ******************/
		/**** md5 signature: adba9d1c7d10875bc0ac7cbdd5c3d1ac ****/
		%feature("compactdefaultargs") DependentValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
variablenum: int
valuenum: int

Returns
-------
float
") DependentValue;
		Standard_Real DependentValue(const Standard_Integer variablenum, const Standard_Integer valuenum);

		/****************** DependentValues ******************/
		/**** md5 signature: 288791a4fd69751ccff504a39eaf7713 ****/
		%feature("compactdefaultargs") DependentValues;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") DependentValues;
		opencascade::handle<TColStd_HArray1OfReal> DependentValues(const Standard_Integer num);

		/****************** IndependentValue ******************/
		/**** md5 signature: 8f2d952d84b4cb2d4b5f106c895663b6 ****/
		%feature("compactdefaultargs") IndependentValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
variablenum: int
valuenum: int

Returns
-------
float
") IndependentValue;
		Standard_Real IndependentValue(const Standard_Integer variablenum, const Standard_Integer valuenum);

		/****************** Init ******************/
		/**** md5 signature: bd937959a94510bb641a274006e0d9ec ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class tabulardata - nbprops : number of property values - proptype : property type - typesind : type of independent variables - nbvaluesind : number of values of independent variables - valuesind : values of independent variables - valuesdep : values of dependent variables raises exception if lengths of typeind and nbvaluesind are not same.

Parameters
----------
nbProps: int
propType: int
typesInd: TColStd_HArray1OfInteger
nbValuesInd: TColStd_HArray1OfInteger
valuesInd: IGESBasic_HArray1OfHArray1OfReal
valuesDep: IGESBasic_HArray1OfHArray1OfReal

Returns
-------
None
") Init;
		void Init(const Standard_Integer nbProps, const Standard_Integer propType, const opencascade::handle<TColStd_HArray1OfInteger> & typesInd, const opencascade::handle<TColStd_HArray1OfInteger> & nbValuesInd, const opencascade::handle<IGESBasic_HArray1OfHArray1OfReal> & valuesInd, const opencascade::handle<IGESBasic_HArray1OfHArray1OfReal> & valuesDep);

		/****************** NbDependents ******************/
		/**** md5 signature: 918f7a7f7118d4b8fbb5a0b3a9758a68 ****/
		%feature("compactdefaultargs") NbDependents;
		%feature("autodoc", "Returns the number of dependent variables.

Returns
-------
int
") NbDependents;
		Standard_Integer NbDependents();

		/****************** NbIndependents ******************/
		/**** md5 signature: d85980dd9c8783d7717bfeca7a897d07 ****/
		%feature("compactdefaultargs") NbIndependents;
		%feature("autodoc", "Returns the number of independent variables.

Returns
-------
int
") NbIndependents;
		Standard_Integer NbIndependents();

		/****************** NbPropertyValues ******************/
		/**** md5 signature: 0fffdeb77dedf6abde7c32e5ad90b9d8 ****/
		%feature("compactdefaultargs") NbPropertyValues;
		%feature("autodoc", "Returns the number of property values (recorded).

Returns
-------
int
") NbPropertyValues;
		Standard_Integer NbPropertyValues();

		/****************** NbValues ******************/
		/**** md5 signature: 3193472bbce889b42bd4d8f644ce8de2 ****/
		%feature("compactdefaultargs") NbValues;
		%feature("autodoc", "Returns the number of different values of the num'th indep. variable raises exception if num <= 0 or num > nbindependents().

Parameters
----------
num: int

Returns
-------
int
") NbValues;
		Standard_Integer NbValues(const Standard_Integer num);

		/****************** OwnCorrect ******************/
		/**** md5 signature: a9e45b136fcf07e4905e0211d63ffaf6 ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Checks, and correct as necessary, the number of property values. returns true if corrected, false if already ok.

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect();

		/****************** PropertyType ******************/
		/**** md5 signature: dd34d86f5f4f15e56515e985a56544a7 ****/
		%feature("compactdefaultargs") PropertyType;
		%feature("autodoc", "Returns the property type.

Returns
-------
int
") PropertyType;
		Standard_Integer PropertyType();

		/****************** TypeOfIndependents ******************/
		/**** md5 signature: 16dda96103cfac1da542a943d665888a ****/
		%feature("compactdefaultargs") TypeOfIndependents;
		%feature("autodoc", "Returns the type of the num'th independent variable raises exception if num <= 0 or num > nbindependents().

Parameters
----------
num: int

Returns
-------
int
") TypeOfIndependents;
		Standard_Integer TypeOfIndependents(const Standard_Integer num);

};


%make_alias(IGESDefs_TabularData)

%extend IGESDefs_TabularData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class IGESDefs_ToolAssociativityDef *
**************************************/
class IGESDefs_ToolAssociativityDef {
	public:
		/****************** IGESDefs_ToolAssociativityDef ******************/
		/**** md5 signature: 655562295a85ed85f684f94aac67a508 ****/
		%feature("compactdefaultargs") IGESDefs_ToolAssociativityDef;
		%feature("autodoc", "Returns a toolassociativitydef, ready to work.

Returns
-------
None
") IGESDefs_ToolAssociativityDef;
		 IGESDefs_ToolAssociativityDef();

		/****************** DirChecker ******************/
		/**** md5 signature: 6570914ba63a9a3bb8121edeb81586b0 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESDefs_AssociativityDef

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESDefs_AssociativityDef> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: a5b6b47287b64e0bdf3903e7e861fd51 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESDefs_AssociativityDef
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESDefs_AssociativityDef> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: d83d638d0342d4eb072fe797e3baaa3c ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESDefs_AssociativityDef
entto: IGESDefs_AssociativityDef
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESDefs_AssociativityDef> & entfrom, const opencascade::handle<IGESDefs_AssociativityDef> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 5f8fd12fcc193c87f2d5745578b1025c ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a associativitydef <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESDefs_AssociativityDef
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESDefs_AssociativityDef> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 39f5ce8793eb2361276661804589f12f ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESDefs_AssociativityDef
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESDefs_AssociativityDef> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 201ef9dfaf0d01418b7c4bfe3e1733c7 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESDefs_AssociativityDef
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESDefs_AssociativityDef> & ent, IGESData_IGESWriter & IW);

};


%extend IGESDefs_ToolAssociativityDef {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class IGESDefs_ToolAttributeDef *
**********************************/
class IGESDefs_ToolAttributeDef {
	public:
		/****************** IGESDefs_ToolAttributeDef ******************/
		/**** md5 signature: 8d1ea63654ffe9fc8a73c09d5b665501 ****/
		%feature("compactdefaultargs") IGESDefs_ToolAttributeDef;
		%feature("autodoc", "Returns a toolattributedef, ready to work.

Returns
-------
None
") IGESDefs_ToolAttributeDef;
		 IGESDefs_ToolAttributeDef();

		/****************** DirChecker ******************/
		/**** md5 signature: 31941d6c5983e8cbc99b6c63fbd7320a ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESDefs_AttributeDef

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESDefs_AttributeDef> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 59a6ea4ed8576e16052fb9bdc0abb9e4 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESDefs_AttributeDef
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESDefs_AttributeDef> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 3ab5c90f673fb6fd9437c64a7dd7d263 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESDefs_AttributeDef
entto: IGESDefs_AttributeDef
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESDefs_AttributeDef> & entfrom, const opencascade::handle<IGESDefs_AttributeDef> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 8b4cd1193ee79c190005a09540d8e813 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a attributedef <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESDefs_AttributeDef
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESDefs_AttributeDef> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: addb899f46133921ae7765ba6292ce47 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESDefs_AttributeDef
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESDefs_AttributeDef> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: fbb272672bb9a9ff6c90015c79b24469 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESDefs_AttributeDef
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESDefs_AttributeDef> & ent, IGESData_IGESWriter & IW);

};


%extend IGESDefs_ToolAttributeDef {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class IGESDefs_ToolAttributeTable *
************************************/
class IGESDefs_ToolAttributeTable {
	public:
		/****************** IGESDefs_ToolAttributeTable ******************/
		/**** md5 signature: 08f86e847b5dd3c2b15aba04515463b9 ****/
		%feature("compactdefaultargs") IGESDefs_ToolAttributeTable;
		%feature("autodoc", "Returns a toolattributetable, ready to work.

Returns
-------
None
") IGESDefs_ToolAttributeTable;
		 IGESDefs_ToolAttributeTable();

		/****************** DirChecker ******************/
		/**** md5 signature: 35e538b8ef02e978949fa649bd4d6e2d ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESDefs_AttributeTable

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESDefs_AttributeTable> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 1735a5e32731030d802e0040ce5d1da5 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESDefs_AttributeTable
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESDefs_AttributeTable> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: e3aeb9fd40a494e6674314962bad8aa6 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESDefs_AttributeTable
entto: IGESDefs_AttributeTable
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESDefs_AttributeTable> & entfrom, const opencascade::handle<IGESDefs_AttributeTable> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: f6016e27e01b02140c368f0cd0f13fef ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a attributetable <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESDefs_AttributeTable
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESDefs_AttributeTable> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 78896ccdec06a28822ba5901ac770c77 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESDefs_AttributeTable
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESDefs_AttributeTable> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 120b631ab0118c007c82f1db345fa48e ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESDefs_AttributeTable
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESDefs_AttributeTable> & ent, IGESData_IGESWriter & IW);

};


%extend IGESDefs_ToolAttributeTable {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IGESDefs_ToolGenericData *
*********************************/
class IGESDefs_ToolGenericData {
	public:
		/****************** IGESDefs_ToolGenericData ******************/
		/**** md5 signature: f5f58821e944054c5f184e3c50d1a59d ****/
		%feature("compactdefaultargs") IGESDefs_ToolGenericData;
		%feature("autodoc", "Returns a toolgenericdata, ready to work.

Returns
-------
None
") IGESDefs_ToolGenericData;
		 IGESDefs_ToolGenericData();

		/****************** DirChecker ******************/
		/**** md5 signature: 5984e7f4c2b3f75c319bf428e8956b3d ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESDefs_GenericData

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESDefs_GenericData> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: c0abb3cc8b09566aac541f093fcb8de1 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESDefs_GenericData
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESDefs_GenericData> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: dcf2c284624bff6bbd3c5fd38c29ae40 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESDefs_GenericData
entto: IGESDefs_GenericData
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESDefs_GenericData> & entfrom, const opencascade::handle<IGESDefs_GenericData> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 1fadbd892ab7384a4ee67627a6d83294 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a genericdata <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESDefs_GenericData
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESDefs_GenericData> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: a5d8b7baba712df9bc8d8c249c7b798b ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESDefs_GenericData
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESDefs_GenericData> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 8fbac9429f966f8d4c2369ff1c019206 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESDefs_GenericData
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESDefs_GenericData> & ent, IGESData_IGESWriter & IW);

};


%extend IGESDefs_ToolGenericData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IGESDefs_ToolMacroDef *
******************************/
class IGESDefs_ToolMacroDef {
	public:
		/****************** IGESDefs_ToolMacroDef ******************/
		/**** md5 signature: febe43e8a1a5a8a7d9d7e05b050259c8 ****/
		%feature("compactdefaultargs") IGESDefs_ToolMacroDef;
		%feature("autodoc", "Returns a toolmacrodef, ready to work.

Returns
-------
None
") IGESDefs_ToolMacroDef;
		 IGESDefs_ToolMacroDef();

		/****************** DirChecker ******************/
		/**** md5 signature: e618dfabda138862f90505d7234cd0c6 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESDefs_MacroDef

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESDefs_MacroDef> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 610a89c7308733f36c881e89e3494118 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESDefs_MacroDef
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESDefs_MacroDef> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 6e7b45b8d4d5911589f933d87ed0863b ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESDefs_MacroDef
entto: IGESDefs_MacroDef
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESDefs_MacroDef> & entfrom, const opencascade::handle<IGESDefs_MacroDef> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 2aa7304b1ca5e933e0d6e6e8879d65d2 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a macrodef <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESDefs_MacroDef
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESDefs_MacroDef> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 5cfa9ed3780d3a14567341c60ef05034 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESDefs_MacroDef
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESDefs_MacroDef> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 8755c9f1639cde3d7e0b5648f86ac58a ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESDefs_MacroDef
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESDefs_MacroDef> & ent, IGESData_IGESWriter & IW);

};


%extend IGESDefs_ToolMacroDef {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IGESDefs_ToolTabularData *
*********************************/
class IGESDefs_ToolTabularData {
	public:
		/****************** IGESDefs_ToolTabularData ******************/
		/**** md5 signature: 8d0b1076f1517285df90705f2202b88a ****/
		%feature("compactdefaultargs") IGESDefs_ToolTabularData;
		%feature("autodoc", "Returns a tooltabulardata, ready to work.

Returns
-------
None
") IGESDefs_ToolTabularData;
		 IGESDefs_ToolTabularData();

		/****************** DirChecker ******************/
		/**** md5 signature: f28b778f94b86934ddcd84bee08cb971 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESDefs_TabularData

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESDefs_TabularData> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 5642cd60de274983e8c31a4462564454 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESDefs_TabularData
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESDefs_TabularData> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 1765497b9ad18e65bae51519d4182a59 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESDefs_TabularData
entto: IGESDefs_TabularData
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESDefs_TabularData> & entfrom, const opencascade::handle<IGESDefs_TabularData> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 078dcffa0eb641f46ad6a9835b79488b ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a tabulardata <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESDefs_TabularData
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESDefs_TabularData> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: b87717a2dd9e88c8ca3c6ed361b6ad1f ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESDefs_TabularData
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESDefs_TabularData> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: c8fa2930f8f174e19755afe4fafd98c6 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESDefs_TabularData
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESDefs_TabularData> & ent, IGESData_IGESWriter & IW);

};


%extend IGESDefs_ToolTabularData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class IGESDefs_ToolUnitsData *
*******************************/
class IGESDefs_ToolUnitsData {
	public:
		/****************** IGESDefs_ToolUnitsData ******************/
		/**** md5 signature: 96e78ee9a4cca52fd8ad9b570cec828a ****/
		%feature("compactdefaultargs") IGESDefs_ToolUnitsData;
		%feature("autodoc", "Returns a toolunitsdata, ready to work.

Returns
-------
None
") IGESDefs_ToolUnitsData;
		 IGESDefs_ToolUnitsData();

		/****************** DirChecker ******************/
		/**** md5 signature: 48b4b64ebd2c5cd2bb9110653733d580 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESDefs_UnitsData

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESDefs_UnitsData> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 489a00064d10f63f8d260e789ef06234 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESDefs_UnitsData
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESDefs_UnitsData> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: bdb4cea64305fc6d9c9e795f5f8624f8 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESDefs_UnitsData
entto: IGESDefs_UnitsData
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESDefs_UnitsData> & entfrom, const opencascade::handle<IGESDefs_UnitsData> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 33e5197014d0111c81e8bd0e4a87de4e ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a unitsdata <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESDefs_UnitsData
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESDefs_UnitsData> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: ec8e9e5b786d56de54886a4d1ea10006 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESDefs_UnitsData
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESDefs_UnitsData> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 7a03917a34fa5a73071cbdb1a51adebb ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESDefs_UnitsData
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESDefs_UnitsData> & ent, IGESData_IGESWriter & IW);

};


%extend IGESDefs_ToolUnitsData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class IGESDefs_UnitsData *
***************************/
class IGESDefs_UnitsData : public IGESData_IGESEntity {
	public:
		/****************** IGESDefs_UnitsData ******************/
		/**** md5 signature: 80396668363765adb38fc224855ddd95 ****/
		%feature("compactdefaultargs") IGESDefs_UnitsData;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESDefs_UnitsData;
		 IGESDefs_UnitsData();

		/****************** Init ******************/
		/**** md5 signature: 8b461a08159937760b77114e81ae874e ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class unitsdata - unittypes : types of the units being defined - unitvalues : unit values of the units - unitscales : multiplicative scale factors raises exception if lengths of unittypes, unitvalues and unitscale are not same.

Parameters
----------
unitTypes: Interface_HArray1OfHAsciiString
unitValues: Interface_HArray1OfHAsciiString
unitScales: TColStd_HArray1OfReal

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Interface_HArray1OfHAsciiString> & unitTypes, const opencascade::handle<Interface_HArray1OfHAsciiString> & unitValues, const opencascade::handle<TColStd_HArray1OfReal> & unitScales);

		/****************** NbUnits ******************/
		/**** md5 signature: 86bc891f14ee45cd28b37a18bf9c55a5 ****/
		%feature("compactdefaultargs") NbUnits;
		%feature("autodoc", "Returns the number of units defined by this entity.

Returns
-------
int
") NbUnits;
		Standard_Integer NbUnits();

		/****************** ScaleFactor ******************/
		/**** md5 signature: 158afc87ea7d2155421ccaee0a35a1e0 ****/
		%feature("compactdefaultargs") ScaleFactor;
		%feature("autodoc", "Returns the multiplicative scale factor to be applied to the unitnum'th unit being defined raises exception if unitnum <= 0 or unitnum > nbunits().

Parameters
----------
UnitNum: int

Returns
-------
float
") ScaleFactor;
		Standard_Real ScaleFactor(const Standard_Integer UnitNum);

		/****************** UnitType ******************/
		/**** md5 signature: c5ddd77f60b8d5ddee7e5d505eb26bf7 ****/
		%feature("compactdefaultargs") UnitType;
		%feature("autodoc", "Returns the type of the unitnum'th unit being defined raises exception if unitnum <= 0 or unitnum > nbunits().

Parameters
----------
UnitNum: int

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") UnitType;
		opencascade::handle<TCollection_HAsciiString> UnitType(const Standard_Integer UnitNum);

		/****************** UnitValue ******************/
		/**** md5 signature: d7afb2af26b164d2f090c4afd4040660 ****/
		%feature("compactdefaultargs") UnitValue;
		%feature("autodoc", "Returns the units of the unitnum'th unit being defined raises exception if unitnum <= 0 or unitnum > nbunits().

Parameters
----------
UnitNum: int

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") UnitValue;
		opencascade::handle<TCollection_HAsciiString> UnitValue(const Standard_Integer UnitNum);

};


%make_alias(IGESDefs_UnitsData)

%extend IGESDefs_UnitsData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */

class IGESDefs_HArray1OfTabularData : public IGESDefs_Array1OfTabularData, public Standard_Transient {
  public:
    IGESDefs_HArray1OfTabularData(const Standard_Integer theLower, const Standard_Integer theUpper);
    IGESDefs_HArray1OfTabularData(const Standard_Integer theLower, const Standard_Integer theUpper, const IGESDefs_Array1OfTabularData::value_type& theValue);
    IGESDefs_HArray1OfTabularData(const IGESDefs_Array1OfTabularData& theOther);
    const IGESDefs_Array1OfTabularData& Array1();
    IGESDefs_Array1OfTabularData& ChangeArray1();
};
%make_alias(IGESDefs_HArray1OfTabularData)

/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
