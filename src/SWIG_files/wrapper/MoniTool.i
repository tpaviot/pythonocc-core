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
%define MONITOOLDOCSTRING
"MoniTool module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_monitool.html"
%enddef
%module (package="OCC.Core", docstring=MONITOOLDOCSTRING) MoniTool


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
#include<MoniTool_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<gp_module.hxx>
#include<Message_module.hxx>
#include<OSD_module.hxx>
#include<TColStd_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TCollection.i
%import TopoDS.i
%import gp.i
%import Message.i
%import OSD.i
%import TColStd.i
/* public enums */
enum MoniTool_ValueType {
	MoniTool_ValueMisc = 0,
	MoniTool_ValueInteger = 1,
	MoniTool_ValueReal = 2,
	MoniTool_ValueIdent = 3,
	MoniTool_ValueVoid = 4,
	MoniTool_ValueText = 5,
	MoniTool_ValueEnum = 6,
	MoniTool_ValueLogical = 7,
	MoniTool_ValueSub = 8,
	MoniTool_ValueHexa = 9,
	MoniTool_ValueBinary = 10,
};

/* end public enums declaration */

/* handles */
%wrap_handle(MoniTool_CaseData)
%wrap_handle(MoniTool_Element)
%wrap_handle(MoniTool_IntVal)
%wrap_handle(MoniTool_RealVal)
%wrap_handle(MoniTool_SignText)
%wrap_handle(MoniTool_Timer)
%wrap_handle(MoniTool_TypedValue)
%wrap_handle(MoniTool_SignShape)
%wrap_handle(MoniTool_TransientElem)
%wrap_handle(MoniTool_HSequenceOfElement)
/* end handles declaration */

/* templates */
%template(MoniTool_DataMapOfShapeTransient) NCollection_DataMap <TopoDS_Shape , opencascade::handle <Standard_Transient>, TopTools_ShapeMapHasher>;
%template(MoniTool_SequenceOfElement) NCollection_Sequence <opencascade::handle <MoniTool_Element>>;
%template(MoniTool_DataMapOfTimer) NCollection_DataMap <Standard_CString , opencascade::handle <MoniTool_Timer>, MoniTool_MTHasher>;
%template(MoniTool_IndexedDataMapOfShapeTransient) NCollection_IndexedDataMap <TopoDS_Shape , opencascade::handle <Standard_Transient>, TopTools_ShapeMapHasher>;
/* end templates declaration */

/* typedefs */
typedef Standard_Boolean ( * MoniTool_ValueSatisfies ) ( const opencascade::handle <TCollection_HAsciiString>& val );
typedef NCollection_DataMap <TopoDS_Shape , opencascade::handle <Standard_Transient>, TopTools_ShapeMapHasher> MoniTool_DataMapOfShapeTransient;
typedef NCollection_DataMap <TopoDS_Shape , opencascade::handle <Standard_Transient>, TopTools_ShapeMapHasher>::Iterator MoniTool_DataMapIteratorOfDataMapOfShapeTransient;
typedef NCollection_Sequence <opencascade::handle <MoniTool_Element>> MoniTool_SequenceOfElement;
typedef NCollection_DataMap <Standard_CString , opencascade::handle <MoniTool_Timer>, MoniTool_MTHasher> MoniTool_DataMapOfTimer;
typedef NCollection_DataMap <Standard_CString , opencascade::handle <MoniTool_Timer>, MoniTool_MTHasher>::Iterator MoniTool_DataMapIteratorOfDataMapOfTimer;
typedef NCollection_IndexedDataMap <TopoDS_Shape , opencascade::handle <Standard_Transient>, TopTools_ShapeMapHasher> MoniTool_IndexedDataMapOfShapeTransient;
/* end typedefs declaration */

/**************************
* class MoniTool_AttrList *
**************************/
class MoniTool_AttrList {
	public:
		/****************** AttrList ******************/
		%feature("compactdefaultargs") AttrList;
		%feature("autodoc", "* Returns the exhaustive list of attributes
	:rtype: NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient> >") AttrList;
		const NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient> > & AttrList ();

		/****************** Attribute ******************/
		%feature("compactdefaultargs") Attribute;
		%feature("autodoc", "* Returns an attribute from its name. Null Handle if not recorded (whatever Transient, Integer, Real ...) Integer is recorded as IntVal Real is recorded as RealVal Text is recorded as HAsciiString
	:param name:
	:type name: char *
	:rtype: opencascade::handle<Standard_Transient>") Attribute;
		opencascade::handle<Standard_Transient> Attribute (const char * name);

		/****************** AttributeType ******************/
		%feature("compactdefaultargs") AttributeType;
		%feature("autodoc", "* Returns the type of an attribute : ValueInt , ValueReal , ValueText (String) , ValueIdent (any) or ValueVoid (not recorded)
	:param name:
	:type name: char *
	:rtype: MoniTool_ValueType") AttributeType;
		MoniTool_ValueType AttributeType (const char * name);

		/****************** GetAttribute ******************/
		%feature("compactdefaultargs") GetAttribute;
		%feature("autodoc", "* Returns an attribute from its name, filtered by a type If no attribute has this name, or if it is not kind of this type, <val> is Null and returned value is False Else, it is True
	:param name:
	:type name: char *
	:param type:
	:type type: Standard_Type
	:param val:
	:type val: Standard_Transient
	:rtype: bool") GetAttribute;
		Standard_Boolean GetAttribute (const char * name,const opencascade::handle<Standard_Type> & type,opencascade::handle<Standard_Transient> & val);

		/****************** GetAttributes ******************/
		%feature("compactdefaultargs") GetAttributes;
		%feature("autodoc", "* Gets the list of attributes from <other>, by copying it By default, considers all the attributes from <other> If <fromname> is given, considers only the attributes with name beginning by <fromname> //! For each attribute, if <copied> is True (D), its value is also copied if it is a basic type (Integer,Real,String), else it remains shared between <other> and <self> //! These new attributes are added to the existing ones in <self>, in case of same name, they replace the existing ones
	:param other:
	:type other: MoniTool_AttrList
	:param fromname: default value is ""
	:type fromname: char *
	:param copied: default value is Standard_True
	:type copied: bool
	:rtype: None") GetAttributes;
		void GetAttributes (const MoniTool_AttrList & other,const char * fromname = "",const Standard_Boolean copied = Standard_True);

		/****************** GetIntegerAttribute ******************/
		%feature("compactdefaultargs") GetIntegerAttribute;
		%feature("autodoc", "* Returns an attribute from its name, as integer If no attribute has this name, or not an integer, <val> is 0 and returned value is False Else, it is True
	:param name:
	:type name: char *
	:param val:
	:type val: int
	:rtype: bool") GetIntegerAttribute;
		Standard_Boolean GetIntegerAttribute (const char * name,Standard_Integer &OutValue);

		/****************** GetRealAttribute ******************/
		%feature("compactdefaultargs") GetRealAttribute;
		%feature("autodoc", "* Returns an attribute from its name, as real If no attribute has this name, or not a real <val> is 0.0 and returned value is False Else, it is True
	:param name:
	:type name: char *
	:param val:
	:type val: float
	:rtype: bool") GetRealAttribute;
		Standard_Boolean GetRealAttribute (const char * name,Standard_Real &OutValue);

		/****************** GetStringAttribute ******************/
		%feature("compactdefaultargs") GetStringAttribute;
		%feature("autodoc", "* Returns an attribute from its name, as String If no attribute has this name, or not a String <val> is 0.0 and returned value is False Else, it is True
	:param name:
	:type name: char *
	:param val:
	:type val: char *
	:rtype: bool") GetStringAttribute;
		Standard_Boolean GetStringAttribute (const char * name,const char * & val);

		/****************** IntegerAttribute ******************/
		%feature("compactdefaultargs") IntegerAttribute;
		%feature("autodoc", "* Returns an integer attribute from its name. 0 if not recorded
	:param name:
	:type name: char *
	:rtype: int") IntegerAttribute;
		Standard_Integer IntegerAttribute (const char * name);

		/****************** MoniTool_AttrList ******************/
		%feature("compactdefaultargs") MoniTool_AttrList;
		%feature("autodoc", "* Creates an AttrList, empty
	:rtype: None") MoniTool_AttrList;
		 MoniTool_AttrList ();

		/****************** MoniTool_AttrList ******************/
		%feature("compactdefaultargs") MoniTool_AttrList;
		%feature("autodoc", "* Creates an AttrList from another one, definitions are shared (calls SameAttributes)
	:param other:
	:type other: MoniTool_AttrList
	:rtype: None") MoniTool_AttrList;
		 MoniTool_AttrList (const MoniTool_AttrList & other);

		/****************** RealAttribute ******************/
		%feature("compactdefaultargs") RealAttribute;
		%feature("autodoc", "* Returns a real attribute from its name. 0.0 if not recorded
	:param name:
	:type name: char *
	:rtype: float") RealAttribute;
		Standard_Real RealAttribute (const char * name);

		/****************** RemoveAttribute ******************/
		%feature("compactdefaultargs") RemoveAttribute;
		%feature("autodoc", "* Removes an attribute Returns True when done, False if this attribute did not exist
	:param name:
	:type name: char *
	:rtype: bool") RemoveAttribute;
		Standard_Boolean RemoveAttribute (const char * name);

		/****************** SameAttributes ******************/
		%feature("compactdefaultargs") SameAttributes;
		%feature("autodoc", "* Gets the list of attributes from <other>, as such, i.e. not copied : attributes are shared, any attribute edited, added, or removed in <other> is also in <self> and vice versa The former list of attributes of <self> is dropped
	:param other:
	:type other: MoniTool_AttrList
	:rtype: None") SameAttributes;
		void SameAttributes (const MoniTool_AttrList & other);

		/****************** SetAttribute ******************/
		%feature("compactdefaultargs") SetAttribute;
		%feature("autodoc", "* Adds an attribute with a given name (replaces the former one with the same name if already exists)
	:param name:
	:type name: char *
	:param val:
	:type val: Standard_Transient
	:rtype: None") SetAttribute;
		void SetAttribute (const char * name,const opencascade::handle<Standard_Transient> & val);

		/****************** SetIntegerAttribute ******************/
		%feature("compactdefaultargs") SetIntegerAttribute;
		%feature("autodoc", "* Adds an integer value for an attribute
	:param name:
	:type name: char *
	:param val:
	:type val: int
	:rtype: None") SetIntegerAttribute;
		void SetIntegerAttribute (const char * name,const Standard_Integer val);

		/****************** SetRealAttribute ******************/
		%feature("compactdefaultargs") SetRealAttribute;
		%feature("autodoc", "* Adds a real value for an attribute
	:param name:
	:type name: char *
	:param val:
	:type val: float
	:rtype: None") SetRealAttribute;
		void SetRealAttribute (const char * name,const Standard_Real val);

		/****************** SetStringAttribute ******************/
		%feature("compactdefaultargs") SetStringAttribute;
		%feature("autodoc", "* Adds a String value for an attribute
	:param name:
	:type name: char *
	:param val:
	:type val: char *
	:rtype: None") SetStringAttribute;
		void SetStringAttribute (const char * name,const char * val);

		/****************** StringAttribute ******************/
		%feature("compactdefaultargs") StringAttribute;
		%feature("autodoc", "* Returns a String attribute from its name. '' if not recorded
	:param name:
	:type name: char *
	:rtype: char *") StringAttribute;
		const char * StringAttribute (const char * name);

};


%extend MoniTool_AttrList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class MoniTool_CaseData *
**************************/
class MoniTool_CaseData : public Standard_Transient {
	public:
		/****************** AddAny ******************/
		%feature("compactdefaultargs") AddAny;
		%feature("autodoc", "* Adds a Transient, with no more meaning
	:param val:
	:type val: Standard_Transient
	:param name: default value is ""
	:type name: char *
	:rtype: None") AddAny;
		void AddAny (const opencascade::handle<Standard_Transient> & val,const char * name = "");

		/****************** AddCPU ******************/
		%feature("compactdefaultargs") AddCPU;
		%feature("autodoc", "* Adds the CPU time between lastCPU and now if <curCPU> is given, the CPU amount is curCPU-lastCPU else it is currently measured CPU - lastCPU lastCPU has been read by call to GetCPU See GetCPU to get amount, and LargeCPU to test large amount
	:param lastCPU:
	:type lastCPU: float
	:param curCPU: default value is 0
	:type curCPU: float
	:param name: default value is ""
	:type name: char *
	:rtype: None") AddCPU;
		void AddCPU (const Standard_Real lastCPU,const Standard_Real curCPU = 0,const char * name = "");

		/****************** AddData ******************/
		%feature("compactdefaultargs") AddData;
		%feature("autodoc", "* Unitary adding a data; rather internal
	:param val:
	:type val: Standard_Transient
	:param kind:
	:type kind: int
	:param name: default value is ""
	:type name: char *
	:rtype: None") AddData;
		void AddData (const opencascade::handle<Standard_Transient> & val,const Standard_Integer kind,const char * name = "");

		/****************** AddEntity ******************/
		%feature("compactdefaultargs") AddEntity;
		%feature("autodoc", "* Adds a Transient, as an Entity from an InterfaceModel for instance : it will then be printed with the help of a DBPE
	:param ent:
	:type ent: Standard_Transient
	:param name: default value is ""
	:type name: char *
	:rtype: None") AddEntity;
		void AddEntity (const opencascade::handle<Standard_Transient> & ent,const char * name = "");

		/****************** AddGeom ******************/
		%feature("compactdefaultargs") AddGeom;
		%feature("autodoc", "* Adds a Geometric as a Transient (Curve, Surface ...)
	:param geom:
	:type geom: Standard_Transient
	:param name: default value is ""
	:type name: char *
	:rtype: None") AddGeom;
		void AddGeom (const opencascade::handle<Standard_Transient> & geom,const char * name = "");

		/****************** AddInteger ******************/
		%feature("compactdefaultargs") AddInteger;
		%feature("autodoc", "* Adds an Integer
	:param val:
	:type val: int
	:param name: default value is ""
	:type name: char *
	:rtype: None") AddInteger;
		void AddInteger (const Standard_Integer val,const char * name = "");

		/****************** AddRaised ******************/
		%feature("compactdefaultargs") AddRaised;
		%feature("autodoc", "* Adds the currently caught exception
	:param theException:
	:type theException: Standard_Failure
	:param name: default value is ""
	:type name: char *
	:rtype: None") AddRaised;
		void AddRaised (const opencascade::handle<Standard_Failure> & theException,const char * name = "");

		/****************** AddReal ******************/
		%feature("compactdefaultargs") AddReal;
		%feature("autodoc", "* Adds a Real
	:param val:
	:type val: float
	:param name: default value is ""
	:type name: char *
	:rtype: None") AddReal;
		void AddReal (const Standard_Real val,const char * name = "");

		/****************** AddReals ******************/
		%feature("compactdefaultargs") AddReals;
		%feature("autodoc", "* Adds two reals (for instance, two parameters)
	:param v1:
	:type v1: float
	:param v2:
	:type v2: float
	:param name: default value is ""
	:type name: char *
	:rtype: None") AddReals;
		void AddReals (const Standard_Real v1,const Standard_Real v2,const char * name = "");

		/****************** AddShape ******************/
		%feature("compactdefaultargs") AddShape;
		%feature("autodoc", "* Adds a Shape (recorded as a HShape)
	:param sh:
	:type sh: TopoDS_Shape
	:param name: default value is ""
	:type name: char *
	:rtype: None") AddShape;
		void AddShape (const TopoDS_Shape & sh,const char * name = "");

		/****************** AddText ******************/
		%feature("compactdefaultargs") AddText;
		%feature("autodoc", "* Adds a Text (as HAsciiString)
	:param text:
	:type text: char *
	:param name: default value is ""
	:type name: char *
	:rtype: None") AddText;
		void AddText (const char * text,const char * name = "");

		/****************** AddXY ******************/
		%feature("compactdefaultargs") AddXY;
		%feature("autodoc", "* Adds a XY
	:param aXY:
	:type aXY: gp_XY
	:param name: default value is ""
	:type name: char *
	:rtype: None") AddXY;
		void AddXY (const gp_XY & aXY,const char * name = "");

		/****************** AddXYZ ******************/
		%feature("compactdefaultargs") AddXYZ;
		%feature("autodoc", "* Adds a XYZ
	:param aXYZ:
	:type aXYZ: gp_XYZ
	:param name: default value is ""
	:type name: char *
	:rtype: None") AddXYZ;
		void AddXYZ (const gp_XYZ & aXYZ,const char * name = "");

		/****************** CaseId ******************/
		%feature("compactdefaultargs") CaseId;
		%feature("autodoc", "* Returns the CaseId
	:rtype: char *") CaseId;
		const char * CaseId ();

		/****************** Data ******************/
		%feature("compactdefaultargs") Data;
		%feature("autodoc", "* Returns a data item (n0 <nd> in the set <num>)
	:param nd:
	:type nd: int
	:rtype: opencascade::handle<Standard_Transient>") Data;
		opencascade::handle<Standard_Transient> Data (const Standard_Integer nd);

		/****************** DefCheck ******************/
		%feature("compactdefaultargs") DefCheck;
		%feature("autodoc", "* Returns Check Status for a Code : 0 non/info (default), 1 warning, 2 fail //! Remark : DefCheck is used to set the check status of a CaseData when it is attached to a case code, it can be changed later (by SetFail, SetWarning, ResetCheck)
	:param acode:
	:type acode: char *
	:rtype: int") DefCheck;
		static Standard_Integer DefCheck (const char * acode);

		/****************** DefMsg ******************/
		%feature("compactdefaultargs") DefMsg;
		%feature("autodoc", "* Returns the message definition for a case code Empty if no message attached
	:param casecode:
	:type casecode: char *
	:rtype: char *") DefMsg;
		static const char * DefMsg (const char * casecode);

		/****************** GetCPU ******************/
		%feature("compactdefaultargs") GetCPU;
		%feature("autodoc", "* Returns the current amount of CPU This allows to laterly test and record CPU amount Its value has to be given to LargeCPU and AddCPU
	:rtype: float") GetCPU;
		Standard_Real GetCPU ();

		/****************** GetData ******************/
		%feature("compactdefaultargs") GetData;
		%feature("autodoc", "* Returns a data item, under control of a Type If the data item is kind of this type, it is returned in <val> and the returned value is True Else, <val> is unchanged and the returned value is False
	:param nd:
	:type nd: int
	:param type:
	:type type: Standard_Type
	:param val:
	:type val: Standard_Transient
	:rtype: bool") GetData;
		Standard_Boolean GetData (const Standard_Integer nd,const opencascade::handle<Standard_Type> & type,opencascade::handle<Standard_Transient> & val);

		/****************** Integer ******************/
		%feature("compactdefaultargs") Integer;
		%feature("autodoc", "* Returns an Integer
	:param nd:
	:type nd: int
	:param val:
	:type val: int
	:rtype: bool") Integer;
		Standard_Boolean Integer (const Standard_Integer nd,Standard_Integer &OutValue);

		/****************** IsCheck ******************/
		%feature("compactdefaultargs") IsCheck;
		%feature("autodoc", "* Tells if <self> is Check (Warning or Fail), else it is Info
	:rtype: bool") IsCheck;
		Standard_Boolean IsCheck ();

		/****************** IsFail ******************/
		%feature("compactdefaultargs") IsFail;
		%feature("autodoc", "* Tells if <self> is Fail
	:rtype: bool") IsFail;
		Standard_Boolean IsFail ();

		/****************** IsWarning ******************/
		%feature("compactdefaultargs") IsWarning;
		%feature("autodoc", "* Tells if <self> is Warning
	:rtype: bool") IsWarning;
		Standard_Boolean IsWarning ();

		/****************** Kind ******************/
		%feature("compactdefaultargs") Kind;
		%feature("autodoc", "* Returns the kind of a data : KIND TYPE MEANING 0 ANY any (not one of the followings) 1 EX raised exception 2 EN entity 3 G geom 4 SH shape 5 XYZ XYZ 6 XY or UV XY 7 RR 2 reals 8 R 1 real 9 CPU CPU (1 real) 10 T text 11 I integer //! For NameNum, these codes for TYPE must be given exact i.e. SH for a Shape, not S nor SHAPE nor SOLID etc
	:param nd:
	:type nd: int
	:rtype: int") Kind;
		Standard_Integer Kind (const Standard_Integer nd);

		/****************** LargeCPU ******************/
		%feature("compactdefaultargs") LargeCPU;
		%feature("autodoc", "* Tells if a CPU time amount is large <maxCPU> gives the amount over which an amount is large <lastCPU> gives the start CPU amount if <curCPU> is given, the tested CPU amount is curCPU-lastCPU else it is currently measured CPU - lastCPU
	:param maxCPU:
	:type maxCPU: float
	:param lastCPU:
	:type lastCPU: float
	:param curCPU: default value is 0
	:type curCPU: float
	:rtype: bool") LargeCPU;
		Standard_Boolean LargeCPU (const Standard_Real maxCPU,const Standard_Real lastCPU,const Standard_Real curCPU = 0);

		/****************** MoniTool_CaseData ******************/
		%feature("compactdefaultargs") MoniTool_CaseData;
		%feature("autodoc", "* Creates a CaseData with a CaseId and a Name (by default not defined)
	:param caseid: default value is ""
	:type caseid: char *
	:param name: default value is ""
	:type name: char *
	:rtype: None") MoniTool_CaseData;
		 MoniTool_CaseData (const char * caseid = "",const char * name = "");

		/****************** Msg ******************/
		%feature("compactdefaultargs") Msg;
		%feature("autodoc", "* Returns a Msg from a CaseData : it is build from DefMsg, which gives the message code plus the designation of items of the CaseData to be added to the Msg Empty if no message attached //! Remains to be implemented
	:rtype: Message_Msg") Msg;
		Message_Msg Msg ();

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "* Returns the Name
	:rtype: char *") Name;
		const char * Name ();

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "* Returns the name of a data. If it has no name, the string is empty (length = 0)
	:param nd:
	:type nd: int
	:rtype: TCollection_AsciiString") Name;
		const TCollection_AsciiString & Name (const Standard_Integer nd);

		/****************** NameNum ******************/
		%feature("compactdefaultargs") NameNum;
		%feature("autodoc", "* Returns the first suitable data rank for a given name Exact maching (exact case, no completion) is required Firstly checks the recorded names If not found, considers the name as follows : Name = 'TYPE' : search for the first item with this TYPE Name = 'TYPE:nn' : search for the nn.th item with this TYPE See allowed values in method Kind
	:param name:
	:type name: char *
	:rtype: int") NameNum;
		Standard_Integer NameNum (const char * name);

		/****************** NbData ******************/
		%feature("compactdefaultargs") NbData;
		%feature("autodoc", "* Returns the count of data recorded to a set
	:rtype: int") NbData;
		Standard_Integer NbData ();

		/****************** Real ******************/
		%feature("compactdefaultargs") Real;
		%feature("autodoc", "* Returns a real or CPU amount (stored in Geom2d_CartesianPoint) (allows an Integer converted to a Real)
	:param nd:
	:type nd: int
	:param val:
	:type val: float
	:rtype: bool") Real;
		Standard_Boolean Real (const Standard_Integer nd,Standard_Real &OutValue);

		/****************** Reals ******************/
		%feature("compactdefaultargs") Reals;
		%feature("autodoc", "* Returns a couple of reals (stored in Geom2d_CartesianPoint)
	:param nd:
	:type nd: int
	:param v1:
	:type v1: float
	:param v2:
	:type v2: float
	:rtype: bool") Reals;
		Standard_Boolean Reals (const Standard_Integer nd,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** RemoveData ******************/
		%feature("compactdefaultargs") RemoveData;
		%feature("autodoc", "* Removes a Data from its rank. Does nothing if out of range
	:param num:
	:type num: int
	:rtype: None") RemoveData;
		void RemoveData (const Standard_Integer num);

		/****************** ResetCheck ******************/
		%feature("compactdefaultargs") ResetCheck;
		%feature("autodoc", "* Resets Check Status, i.e. sets <self> as Info
	:rtype: None") ResetCheck;
		void ResetCheck ();

		/****************** SetCaseId ******************/
		%feature("compactdefaultargs") SetCaseId;
		%feature("autodoc", "* Sets a CaseId
	:param caseid:
	:type caseid: char *
	:rtype: None") SetCaseId;
		void SetCaseId (const char * caseid);

		/****************** SetChange ******************/
		%feature("compactdefaultargs") SetChange;
		%feature("autodoc", "* Sets the next Add... not to add but to change the data item designated by its name. If next Add... is not called with a name, SetChange is ignored Reset by next Add... , whatever <num> is correct or not
	:rtype: None") SetChange;
		void SetChange ();

		/****************** SetDefFail ******************/
		%feature("compactdefaultargs") SetDefFail;
		%feature("autodoc", "* Sets a Code to give a Fail
	:param acode:
	:type acode: char *
	:rtype: void") SetDefFail;
		static void SetDefFail (const char * acode);

		/****************** SetDefMsg ******************/
		%feature("compactdefaultargs") SetDefMsg;
		%feature("autodoc", "* Attaches a message definition to a case code This definition includes the message code plus designation of items of the CaseData to be added to the message (this part not yet implemented)
	:param casecode:
	:type casecode: char *
	:param mesdef:
	:type mesdef: char *
	:rtype: void") SetDefMsg;
		static void SetDefMsg (const char * casecode,const char * mesdef);

		/****************** SetDefWarning ******************/
		%feature("compactdefaultargs") SetDefWarning;
		%feature("autodoc", "* Sets a Code to give a Warning
	:param acode:
	:type acode: char *
	:rtype: void") SetDefWarning;
		static void SetDefWarning (const char * acode);

		/****************** SetFail ******************/
		%feature("compactdefaultargs") SetFail;
		%feature("autodoc", "* Sets <self> as Fail
	:rtype: None") SetFail;
		void SetFail ();

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "* Sets a Name
	:param name:
	:type name: char *
	:rtype: None") SetName;
		void SetName (const char * name);

		/****************** SetReplace ******************/
		%feature("compactdefaultargs") SetReplace;
		%feature("autodoc", "* Sets the next Add... not to add but to replace the data item <num>, if <num> is between 1 and NbData. Reset by next Add... , whatever <num> is correct or not
	:param num:
	:type num: int
	:rtype: None") SetReplace;
		void SetReplace (const Standard_Integer num);

		/****************** SetWarning ******************/
		%feature("compactdefaultargs") SetWarning;
		%feature("autodoc", "* Sets <self> as Warning
	:rtype: None") SetWarning;
		void SetWarning ();

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "* Returns a data as a shape, Null if not a shape
	:param nd:
	:type nd: int
	:rtype: TopoDS_Shape") Shape;
		TopoDS_Shape Shape (const Standard_Integer nd);

		/****************** Text ******************/
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "* Returns a text (stored in TCollection_HAsciiString)
	:param nd:
	:type nd: int
	:param text:
	:type text: char *
	:rtype: bool") Text;
		Standard_Boolean Text (const Standard_Integer nd,const char * & text);

		/****************** XY ******************/
		%feature("compactdefaultargs") XY;
		%feature("autodoc", "* Returns a data as a XY (i.e. Geom2d_CartesianPoint) Returns False if not the good type
	:param nd:
	:type nd: int
	:param val:
	:type val: gp_XY
	:rtype: bool") XY;
		Standard_Boolean XY (const Standard_Integer nd,gp_XY & val);

		/****************** XYZ ******************/
		%feature("compactdefaultargs") XYZ;
		%feature("autodoc", "* Returns a data as a XYZ (i.e. Geom_CartesianPoint) Returns False if not the good type
	:param nd:
	:type nd: int
	:param val:
	:type val: gp_XYZ
	:rtype: bool") XYZ;
		Standard_Boolean XYZ (const Standard_Integer nd,gp_XYZ & val);

};


%make_alias(MoniTool_CaseData)

%extend MoniTool_CaseData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class MoniTool_DataInfo *
**************************/
class MoniTool_DataInfo {
	public:
		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "* Returns the Type attached to an object Here, the Dynamic Type of a Transient. Null Type if unknown
	:param ent:
	:type ent: Standard_Transient
	:rtype: opencascade::handle<Standard_Type>") Type;
		static opencascade::handle<Standard_Type> Type (const opencascade::handle<Standard_Transient> & ent);

		/****************** TypeName ******************/
		%feature("compactdefaultargs") TypeName;
		%feature("autodoc", "* Returns Type Name (string) Allows to name type of non-handled objects
	:param ent:
	:type ent: Standard_Transient
	:rtype: char *") TypeName;
		static const char * TypeName (const opencascade::handle<Standard_Transient> & ent);

};


%extend MoniTool_DataInfo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class MoniTool_ElemHasher *
****************************/
class MoniTool_ElemHasher {
	public:
		/****************** HashCode ******************/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "* Returns hash code for the given element, in the range [1, theUpperBound]. Asks theElement its HashCode, then transforms it to be in the required range. @param theElement the element which hash code is to be computed @param theUpperBound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theUpperBound]
	:param theElement:
	:type theElement: MoniTool_Element
	:param theUpperBound:
	:type theUpperBound: int
	:rtype: int") HashCode;
		static Standard_Integer HashCode (const opencascade::handle<MoniTool_Element> & theElement,Standard_Integer theUpperBound);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "* Returns True if two keys are the same. The test does not work on the Elements themselves but by calling their methods Equates
	:param K1:
	:type K1: MoniTool_Element
	:param K2:
	:type K2: MoniTool_Element
	:rtype: bool") IsEqual;
		static Standard_Boolean IsEqual (const opencascade::handle<MoniTool_Element> & K1,const opencascade::handle<MoniTool_Element> & K2);

};


%extend MoniTool_ElemHasher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class MoniTool_Element *
*************************/
%nodefaultctor MoniTool_Element;
class MoniTool_Element : public Standard_Transient {
	public:
		/****************** ChangeAttr ******************/
		%feature("compactdefaultargs") ChangeAttr;
		%feature("autodoc", "* Returns (modifiable) the Attribute List
	:rtype: MoniTool_AttrList") ChangeAttr;
		MoniTool_AttrList & ChangeAttr ();

		/****************** Equates ******************/
		%feature("compactdefaultargs") Equates;
		%feature("autodoc", "* Specific testof equallity : to be defined by each sub-class, must be False if Elements have not the same true Type, else their contents must be compared
	:param other:
	:type other: MoniTool_Element
	:rtype: bool") Equates;
		virtual Standard_Boolean Equates (const opencascade::handle<MoniTool_Element> & other);

		/****************** GetHashCode ******************/
		%feature("compactdefaultargs") GetHashCode;
		%feature("autodoc", "* Returns the HashCode which has been stored by SetHashCode (remark that HashCode could be deferred then be defined by sub-classes, the result is the same)
	:rtype: int") GetHashCode;
		Standard_Integer GetHashCode ();

		/****************** ListAttr ******************/
		%feature("compactdefaultargs") ListAttr;
		%feature("autodoc", "* Returns (readonly) the Attribute List
	:rtype: MoniTool_AttrList") ListAttr;
		const MoniTool_AttrList & ListAttr ();

		/****************** ValueType ******************/
		%feature("compactdefaultargs") ValueType;
		%feature("autodoc", "* Returns the Type of the Value. By default, returns the DynamicType of <self>, but can be redefined
	:rtype: opencascade::handle<Standard_Type>") ValueType;
		virtual opencascade::handle<Standard_Type> ValueType ();

		/****************** ValueTypeName ******************/
		%feature("compactdefaultargs") ValueTypeName;
		%feature("autodoc", "* Returns the name of the Type of the Value. Default is name of ValueType, unless it is for a non-handled object
	:rtype: char *") ValueTypeName;
		virtual const char * ValueTypeName ();

};


%make_alias(MoniTool_Element)

%extend MoniTool_Element {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class MoniTool_IntVal *
************************/
class MoniTool_IntVal : public Standard_Transient {
	public:

        %feature("autodoc","1");
        %extend {
            Standard_Integer GetCValue() {
            return (Standard_Integer) $self->CValue();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetCValue(Standard_Integer value) {
            $self->CValue()=value;
            }
        };
		/****************** MoniTool_IntVal ******************/
		%feature("compactdefaultargs") MoniTool_IntVal;
		%feature("autodoc", ":param val: default value is 0
	:type val: int
	:rtype: None") MoniTool_IntVal;
		 MoniTool_IntVal (const Standard_Integer val = 0);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: int") Value;
		Standard_Integer Value ();

};


%make_alias(MoniTool_IntVal)

%extend MoniTool_IntVal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class MoniTool_MTHasher *
**************************/
class MoniTool_MTHasher {
	public:
		/****************** HashCode ******************/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "* Returns hash code for the given string, in the range [1, theUpperBound] @param theString the string which hash code is to be computed @param theUpperBound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theUpperBound]
	:param theString:
	:type theString: char *
	:param theUpperBound:
	:type theUpperBound: int
	:rtype: int") HashCode;
		static Standard_Integer HashCode (const char * theString,Standard_Integer theUpperBound);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "* Returns True when the two CString are the same. Two same strings must have the same hashcode, the contrary is not necessary. Default Str1 == Str2
	:param Str1:
	:type Str1: char *
	:param Str2:
	:type Str2: char *
	:rtype: bool") IsEqual;
		static Standard_Boolean IsEqual (const char * Str1,const char * Str2);

};


%extend MoniTool_MTHasher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class MoniTool_RealVal *
*************************/
class MoniTool_RealVal : public Standard_Transient {
	public:

        %feature("autodoc","1");
        %extend {
            Standard_Real GetCValue() {
            return (Standard_Real) $self->CValue();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetCValue(Standard_Real value) {
            $self->CValue()=value;
            }
        };
		/****************** MoniTool_RealVal ******************/
		%feature("compactdefaultargs") MoniTool_RealVal;
		%feature("autodoc", ":param val: default value is 0.0
	:type val: float
	:rtype: None") MoniTool_RealVal;
		 MoniTool_RealVal (const Standard_Real val = 0.0);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: float") Value;
		Standard_Real Value ();

};


%make_alias(MoniTool_RealVal)

%extend MoniTool_RealVal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class MoniTool_SignText *
**************************/
%nodefaultctor MoniTool_SignText;
class MoniTool_SignText : public Standard_Transient {
	public:
		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "* Returns an identification of the Signature (a word), given at initialization time
	:rtype: char *") Name;
		virtual const char * Name ();

		/****************** Text ******************/
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "* Gives a text as a signature for a transient object in a context If the context is senseless, it can be given as Null Handle empty result if nothing to give (at least the DynamicType could be sent ?)
	:param ent:
	:type ent: Standard_Transient
	:param context:
	:type context: Standard_Transient
	:rtype: TCollection_AsciiString") Text;
		virtual TCollection_AsciiString Text (const opencascade::handle<Standard_Transient> & ent,const opencascade::handle<Standard_Transient> & context);

		/****************** TextAlone ******************/
		%feature("compactdefaultargs") TextAlone;
		%feature("autodoc", "* Gives a text as a signature for a transient object alone, i.e. without defined context. By default, calls Text with undefined context (Null Handle) and if empty, then returns DynamicType
	:param ent:
	:type ent: Standard_Transient
	:rtype: TCollection_AsciiString") TextAlone;
		virtual TCollection_AsciiString TextAlone (const opencascade::handle<Standard_Transient> & ent);

};


%make_alias(MoniTool_SignText)

%extend MoniTool_SignText {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class MoniTool_Stat *
**********************/
class MoniTool_Stat {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Directly addes items
	:param nb: default value is 1
	:type nb: int
	:rtype: None") Add;
		void Add (const Standard_Integer nb = 1);

		/****************** AddEnd ******************/
		%feature("compactdefaultargs") AddEnd;
		%feature("autodoc", "* Ends the AddSub and cumulates the sub-count to current level
	:rtype: None") AddEnd;
		void AddEnd ();

		/****************** AddSub ******************/
		%feature("compactdefaultargs") AddSub;
		%feature("autodoc", "* Declares a count of items to be added later. If a sub-counter is opened, its percentage multiplies this sub-count to compute the percent of current level
	:param nb: default value is 1
	:type nb: int
	:rtype: None") AddSub;
		void AddSub (const Standard_Integer nb = 1);

		/****************** Close ******************/
		%feature("compactdefaultargs") Close;
		%feature("autodoc", ":param id:
	:type id: int
	:rtype: None") Close;
		void Close (const Standard_Integer id);

		/****************** Current ******************/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", ":rtype: MoniTool_Stat") Current;
		static MoniTool_Stat & Current ();

		/****************** Level ******************/
		%feature("compactdefaultargs") Level;
		%feature("autodoc", ":rtype: int") Level;
		Standard_Integer Level ();

		/****************** MoniTool_Stat ******************/
		%feature("compactdefaultargs") MoniTool_Stat;
		%feature("autodoc", "* Creates a Stat form. At start, one default phase is defined, with one default step. Then, it suffises to start with a count of items (and cycles if several) then record items, to have a queryable report.
	:param title: default value is ""
	:type title: char *
	:rtype: None") MoniTool_Stat;
		 MoniTool_Stat (const char * title = "");

		/****************** MoniTool_Stat ******************/
		%feature("compactdefaultargs") MoniTool_Stat;
		%feature("autodoc", "* used when starting
	:param other:
	:type other: MoniTool_Stat
	:rtype: None") MoniTool_Stat;
		 MoniTool_Stat (const MoniTool_Stat & other);

		/****************** Open ******************/
		%feature("compactdefaultargs") Open;
		%feature("autodoc", "* Opens a new counter with a starting count of items
	:param nb: default value is 100
	:type nb: int
	:rtype: int") Open;
		Standard_Integer Open (const Standard_Integer nb = 100);

		/****************** OpenMore ******************/
		%feature("compactdefaultargs") OpenMore;
		%feature("autodoc", "* Adds more items to be counted by Add... on current level
	:param id:
	:type id: int
	:param nb:
	:type nb: int
	:rtype: None") OpenMore;
		void OpenMore (const Standard_Integer id,const Standard_Integer nb);

		/****************** Percent ******************/
		%feature("compactdefaultargs") Percent;
		%feature("autodoc", ":param fromlev: default value is 0
	:type fromlev: int
	:rtype: float") Percent;
		Standard_Real Percent (const Standard_Integer fromlev = 0);

};


%extend MoniTool_Stat {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class MoniTool_Timer *
***********************/
class MoniTool_Timer : public Standard_Transient {
	public:
		/****************** Amend ******************/
		%feature("compactdefaultargs") Amend;
		%feature("autodoc", "* Return value of accumulated amendment on CPU time
	:rtype: float") Amend;
		Standard_Real Amend ();

		/****************** CPU ******************/
		%feature("compactdefaultargs") CPU;
		%feature("autodoc", "* Return value of CPU time minus accumulated amendment
	:rtype: float") CPU;
		Standard_Real CPU ();

		/****************** ClearTimers ******************/
		%feature("compactdefaultargs") ClearTimers;
		%feature("autodoc", "* Clears map of timers
	:rtype: void") ClearTimers;
		static void ClearTimers ();

		/****************** ComputeAmendments ******************/
		%feature("compactdefaultargs") ComputeAmendments;
		%feature("autodoc", "* Computes and remembers amendments for times to access, start, and stop of timer, and estimates second-order error measured by 10 nested timers
	:rtype: void") ComputeAmendments;
		static void ComputeAmendments ();

		/****************** Count ******************/
		%feature("compactdefaultargs") Count;
		%feature("autodoc", "* Return value of hits counter (count of Start/Stop pairs)
	:rtype: int") Count;
		Standard_Integer Count ();

		/****************** Dictionary ******************/
		%feature("compactdefaultargs") Dictionary;
		%feature("autodoc", "* Returns map of timers
	:rtype: MoniTool_DataMapOfTimer") Dictionary;
		static MoniTool_DataMapOfTimer & Dictionary ();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        
        %feature("autodoc", "1");
        %extend{
            std::string DumpTimersToString() {
            std::stringstream s;
            self->DumpTimers(s);
            return s.str();}
        };
        		/****************** GetAmendments ******************/
		%feature("compactdefaultargs") GetAmendments;
		%feature("autodoc", "* The computed amendmens are returned (for information only)
	:param Access:
	:type Access: float
	:param Internal:
	:type Internal: float
	:param External:
	:type External: float
	:param Error10:
	:type Error10: float
	:rtype: void") GetAmendments;
		static void GetAmendments (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** IsRunning ******************/
		%feature("compactdefaultargs") IsRunning;
		%feature("autodoc", "* Returns value of nesting counter
	:rtype: int") IsRunning;
		Standard_Integer IsRunning ();

		/****************** MoniTool_Timer ******************/
		%feature("compactdefaultargs") MoniTool_Timer;
		%feature("autodoc", "* Create timer in empty state
	:rtype: None") MoniTool_Timer;
		 MoniTool_Timer ();

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "* Start, Stop and reset the timer In addition to doing that to embedded OSD_Timer, manage also counter of hits
	:rtype: None") Reset;
		void Reset ();

		/****************** Start ******************/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", ":rtype: None") Start;
		void Start ();

		/****************** Start ******************/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", ":param name:
	:type name: char *
	:rtype: None") Start;
		static void Start (const char * name);

		/****************** Stop ******************/
		%feature("compactdefaultargs") Stop;
		%feature("autodoc", ":rtype: None") Stop;
		void Stop ();

		/****************** Stop ******************/
		%feature("compactdefaultargs") Stop;
		%feature("autodoc", "* Inline methods to conveniently start/stop timer by name Shortcut to Timer(name)->Start/Stop()
	:param name:
	:type name: char *
	:rtype: None") Stop;
		static void Stop (const char * name);

		/****************** Timer ******************/
		%feature("compactdefaultargs") Timer;
		%feature("autodoc", ":rtype: OSD_Timer") Timer;
		const OSD_Timer & Timer ();

		/****************** Timer ******************/
		%feature("compactdefaultargs") Timer;
		%feature("autodoc", "* Return reference to embedded OSD_Timer
	:rtype: OSD_Timer") Timer;
		OSD_Timer & Timer ();

		/****************** Timer ******************/
		%feature("compactdefaultargs") Timer;
		%feature("autodoc", "* Returns a timer from a dictionary by its name If timer not existed, creates a new one
	:param name:
	:type name: char *
	:rtype: opencascade::handle<MoniTool_Timer>") Timer;
		static opencascade::handle<MoniTool_Timer> Timer (const char * name);

};


%make_alias(MoniTool_Timer)

%extend MoniTool_Timer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class MoniTool_TimerSentry *
*****************************/
class MoniTool_TimerSentry {
	public:
		/****************** MoniTool_TimerSentry ******************/
		%feature("compactdefaultargs") MoniTool_TimerSentry;
		%feature("autodoc", "* Constructor creates an instance and runs the corresponding timer
	:param cname:
	:type cname: char *
	:rtype: None") MoniTool_TimerSentry;
		 MoniTool_TimerSentry (const char * cname);

		/****************** MoniTool_TimerSentry ******************/
		%feature("compactdefaultargs") MoniTool_TimerSentry;
		%feature("autodoc", "* Constructor creates an instance and runs the corresponding timer
	:param timer:
	:type timer: MoniTool_Timer
	:rtype: None") MoniTool_TimerSentry;
		 MoniTool_TimerSentry (const opencascade::handle<MoniTool_Timer> & timer);

		/****************** Stop ******************/
		%feature("compactdefaultargs") Stop;
		%feature("autodoc", "* Manually stops the timer
	:rtype: None") Stop;
		void Stop ();

		/****************** Timer ******************/
		%feature("compactdefaultargs") Timer;
		%feature("autodoc", ":rtype: opencascade::handle<MoniTool_Timer>") Timer;
		opencascade::handle<MoniTool_Timer> Timer ();

};


%extend MoniTool_TimerSentry {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class MoniTool_TypedValue *
****************************/
class MoniTool_TypedValue : public Standard_Transient {
	public:
		/****************** AddDef ******************/
		%feature("compactdefaultargs") AddDef;
		%feature("autodoc", "* Completes the definition of a TypedValue by command <initext>, once created with its type Returns True if done, False if could not be interpreted <initext> may be : imin ival : minimum value for an integer imax ival : maximum value for an integer rmin rval : minimum value for a real rmax rval : maximum value for a real unit name : name of unit ematch i : enum from integer value i, match required enum i : enum from integer value i, match not required eval text : add an enumerative value (increments max by 1) eval : add a non-authorised enum value (to be skipped) tmax l : maximum length for a text
	:param initext:
	:type initext: char *
	:rtype: bool") AddDef;
		Standard_Boolean AddDef (const char * initext);

		/****************** AddEnum ******************/
		%feature("compactdefaultargs") AddEnum;
		%feature("autodoc", "* Adds enumerative definitions. For more than 10, several calls
	:param v1: default value is ""
	:type v1: char *
	:param v2: default value is ""
	:type v2: char *
	:param v3: default value is ""
	:type v3: char *
	:param v4: default value is ""
	:type v4: char *
	:param v5: default value is ""
	:type v5: char *
	:param v6: default value is ""
	:type v6: char *
	:param v7: default value is ""
	:type v7: char *
	:param v8: default value is ""
	:type v8: char *
	:param v9: default value is ""
	:type v9: char *
	:param v10: default value is ""
	:type v10: char *
	:rtype: None") AddEnum;
		void AddEnum (const char * v1 = "",const char * v2 = "",const char * v3 = "",const char * v4 = "",const char * v5 = "",const char * v6 = "",const char * v7 = "",const char * v8 = "",const char * v9 = "",const char * v10 = "");

		/****************** AddEnumValue ******************/
		%feature("compactdefaultargs") AddEnumValue;
		%feature("autodoc", "* Adds an enumeration definition, by its string and numeric values. If it is the first setting for this value, it is recorded as main value. Else, it is recognized as alternate string for this numeric value
	:param val:
	:type val: char *
	:param num:
	:type num: int
	:rtype: None") AddEnumValue;
		void AddEnumValue (const char * val,const Standard_Integer num);

		/****************** AddLib ******************/
		%feature("compactdefaultargs") AddLib;
		%feature("autodoc", "* Adds a TypedValue in the library. It is recorded then will be accessed by its Name Its Definition may be imposed, else it is computed as usual By default it will be accessed by its Definition (string) Returns True if done, False if tv is Null or brings no Definition or <def> not defined //! If a TypedValue was already recorded under this name, it is replaced
	:param tv:
	:type tv: MoniTool_TypedValue
	:param def: default value is ""
	:type def: char *
	:rtype: bool") AddLib;
		static Standard_Boolean AddLib (const opencascade::handle<MoniTool_TypedValue> & tv,const char * def = "");

		/****************** CStringValue ******************/
		%feature("compactdefaultargs") CStringValue;
		%feature("autodoc", "* Returns the value, as a cstring. Empty if not set.
	:rtype: char *") CStringValue;
		const char * CStringValue ();

		/****************** ClearValue ******************/
		%feature("compactdefaultargs") ClearValue;
		%feature("autodoc", "* Clears the recorded Value : it is now unset
	:rtype: None") ClearValue;
		void ClearValue ();

		/****************** Definition ******************/
		%feature("compactdefaultargs") Definition;
		%feature("autodoc", "* Returns the Definition By priority, the enforced one, else an automatic one, computed from the specification
	:rtype: TCollection_AsciiString") Definition;
		TCollection_AsciiString Definition ();

		/****************** EnumCase ******************/
		%feature("compactdefaultargs") EnumCase;
		%feature("autodoc", "* Returns the case number which cooresponds to a string value Works with main and additionnal values Returns (StartEnum - 1) if not OK, -1 if not an Enum
	:param val:
	:type val: char *
	:rtype: int") EnumCase;
		Standard_Integer EnumCase (const char * val);

		/****************** EnumDef ******************/
		%feature("compactdefaultargs") EnumDef;
		%feature("autodoc", "* Gives the Enum definitions : start value, end value, match status. Returns True for an Enum, False else.
	:param startcase:
	:type startcase: int
	:param endcase:
	:type endcase: int
	:param match:
	:type match: bool
	:rtype: bool") EnumDef;
		Standard_Boolean EnumDef (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Boolean &OutValue);

		/****************** EnumVal ******************/
		%feature("compactdefaultargs") EnumVal;
		%feature("autodoc", "* Returns the value of an enumerative definition, from its rank Empty string if out of range or not an Enum
	:param num:
	:type num: int
	:rtype: char *") EnumVal;
		const char * EnumVal (const Standard_Integer num);

		/****************** FromLib ******************/
		%feature("compactdefaultargs") FromLib;
		%feature("autodoc", "* Returns a COPY of the TypedValue bound with a given Name Null Handle if none recorded
	:param def:
	:type def: char *
	:rtype: opencascade::handle<MoniTool_TypedValue>") FromLib;
		static opencascade::handle<MoniTool_TypedValue> FromLib (const char * def);

		/****************** GetObjectValue ******************/
		%feature("compactdefaultargs") GetObjectValue;
		%feature("autodoc", "* Same as ObjectValue, but avoids DownCast : the receiving variable is directly loaded. It is assumed that it complies with the definition of ObjectType ! Otherwise, big trouble
	:param val:
	:type val: Standard_Transient
	:rtype: None") GetObjectValue;
		void GetObjectValue (opencascade::handle<Standard_Transient> & val);

		/****************** HStringValue ******************/
		%feature("compactdefaultargs") HStringValue;
		%feature("autodoc", "* Returns the value, as a opencascade::handle<canthenbeshared> Null if not defined
	:rtype: opencascade::handle<TCollection_HAsciiString>") HStringValue;
		opencascade::handle<TCollection_HAsciiString> HStringValue ();

		/****************** HasInterpret ******************/
		%feature("compactdefaultargs") HasInterpret;
		%feature("autodoc", "* Tells if a TypedValue has an Interpret
	:rtype: bool") HasInterpret;
		virtual Standard_Boolean HasInterpret ();

		/****************** IntegerLimit ******************/
		%feature("compactdefaultargs") IntegerLimit;
		%feature("autodoc", "* Gives an Integer Limit (upper if <max> True, lower if <max> False). Returns True if this limit is defined, False else (in that case, gives the natural limit for Integer)
	:param max:
	:type max: bool
	:param val:
	:type val: int
	:rtype: bool") IntegerLimit;
		Standard_Boolean IntegerLimit (const Standard_Boolean max,Standard_Integer &OutValue);

		/****************** IntegerValue ******************/
		%feature("compactdefaultargs") IntegerValue;
		%feature("autodoc", "* Returns the value as integer, i.e. : For type = Integer, the integer itself; 0 if not set For type = Enum, the designated rank (see Enum definition) StartEnum - 1 if not set or not in the definition Else, returns 0
	:rtype: int") IntegerValue;
		Standard_Integer IntegerValue ();

		/****************** Internals ******************/
		%feature("compactdefaultargs") Internals;
		%feature("autodoc", "* Access to internal data which have no other access
	:param interp:
	:type interp: MoniTool_ValueInterpret
	:param satisf:
	:type satisf: MoniTool_ValueSatisfies
	:param satisname:
	:type satisname: char *
	:param enums:
	:type enums: NCollection_DataMap<TCollection_AsciiString, int>
	:rtype: None") Internals;
		void Internals (MoniTool_ValueInterpret & interp,MoniTool_ValueSatisfies & satisf,const char * & satisname,NCollection_DataMap<TCollection_AsciiString, Standard_Integer> & enums);

		/****************** Interpret ******************/
		%feature("compactdefaultargs") Interpret;
		%feature("autodoc", "* Interprets a value. <native> True : returns a native value <native> False : returns a coded value If the Interpret function is set, calls it Else, for an Enum, Native returns the Text, Coded returns the number STANDARD RETURNS : = hval means no specific interpretation Null means senseless Can also be redefined
	:param hval:
	:type hval: TCollection_HAsciiString
	:param native:
	:type native: bool
	:rtype: opencascade::handle<TCollection_HAsciiString>") Interpret;
		virtual opencascade::handle<TCollection_HAsciiString> Interpret (const opencascade::handle<TCollection_HAsciiString> & hval,const Standard_Boolean native);

		/****************** IsSetValue ******************/
		%feature("compactdefaultargs") IsSetValue;
		%feature("autodoc", "* Returns True if the value is set (not empty/not null object)
	:rtype: bool") IsSetValue;
		Standard_Boolean IsSetValue ();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "* Returns the label, if set; else returns an empty string
	:rtype: char *") Label;
		const char * Label ();

		/****************** Lib ******************/
		%feature("compactdefaultargs") Lib;
		%feature("autodoc", "* Returns the TypedValue bound with a given Name Null Handle if none recorded Warning : it is the original, not duplicated
	:param def:
	:type def: char *
	:rtype: opencascade::handle<MoniTool_TypedValue>") Lib;
		static opencascade::handle<MoniTool_TypedValue> Lib (const char * def);

		/****************** LibList ******************/
		%feature("compactdefaultargs") LibList;
		%feature("autodoc", "* Returns the list of names of items of the Library of Types -- Library of TypedValue as Valued Parameters, -- -- accessed by parameter name for use by management of Static Parameters
	:rtype: opencascade::handle<TColStd_HSequenceOfAsciiString>") LibList;
		static opencascade::handle<TColStd_HSequenceOfAsciiString> LibList ();

		/****************** MaxLength ******************/
		%feature("compactdefaultargs") MaxLength;
		%feature("autodoc", "* Returns the maximum length, 0 if not set
	:rtype: int") MaxLength;
		Standard_Integer MaxLength ();

		/****************** MoniTool_TypedValue ******************/
		%feature("compactdefaultargs") MoniTool_TypedValue;
		%feature("autodoc", "* Creates a TypedValue, with a name //! type gives the type of the parameter, default is free text Also available : Integer, Real, Enum, Entity (i.e. Object) More precise specifications, titles, can be given to the TypedValue once created //! init gives an initial value. If it is not given, the TypedValue begins as 'not set', its value is empty
	:param name:
	:type name: char *
	:param type: default value is MoniTool_ValueText
	:type type: MoniTool_ValueType
	:param init: default value is ""
	:type init: char *
	:rtype: None") MoniTool_TypedValue;
		 MoniTool_TypedValue (const char * name,const MoniTool_ValueType type = MoniTool_ValueText,const char * init = "");

		/****************** MoniTool_TypedValue ******************/
		%feature("compactdefaultargs") MoniTool_TypedValue;
		%feature("autodoc", "* Creates a TypedValue from another one, by duplication
	:param other:
	:type other: MoniTool_TypedValue
	:rtype: None") MoniTool_TypedValue;
		 MoniTool_TypedValue (const opencascade::handle<MoniTool_TypedValue> & other);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "* Returns the name
	:rtype: char *") Name;
		const char * Name ();

		/****************** ObjectType ******************/
		%feature("compactdefaultargs") ObjectType;
		%feature("autodoc", "* Returns the type of which an Object TypedValue must be kind of Default is Standard_Transient Null for a TypedValue not an Object
	:rtype: opencascade::handle<Standard_Type>") ObjectType;
		opencascade::handle<Standard_Type> ObjectType ();

		/****************** ObjectTypeName ******************/
		%feature("compactdefaultargs") ObjectTypeName;
		%feature("autodoc", "* Returns the type name of the ObjectValue, or an empty string if not set
	:rtype: char *") ObjectTypeName;
		const char * ObjectTypeName ();

		/****************** ObjectValue ******************/
		%feature("compactdefaultargs") ObjectValue;
		%feature("autodoc", "* Returns the value as Transient Object, only for Object/Entity Remark that the 'HString value' is IGNORED here Null if not set; remains to be casted
	:rtype: opencascade::handle<Standard_Transient>") ObjectValue;
		opencascade::handle<Standard_Transient> ObjectValue ();

		/****************** Print ******************/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "* Prints definition, specification, and actual status and value
	:param S:
	:type S: Message_Messenger
	:rtype: void") Print;
		virtual void Print (const opencascade::handle<Message_Messenger> & S);

		/****************** PrintValue ******************/
		%feature("compactdefaultargs") PrintValue;
		%feature("autodoc", "* Prints only the Value
	:param S:
	:type S: Message_Messenger
	:rtype: None") PrintValue;
		void PrintValue (const opencascade::handle<Message_Messenger> & S);

		/****************** RealLimit ******************/
		%feature("compactdefaultargs") RealLimit;
		%feature("autodoc", "* Gives an Real Limit (upper if <max> True, lower if <max> False). Returns True if this limit is defined, False else (in that case, gives the natural limit for Real)
	:param max:
	:type max: bool
	:param val:
	:type val: float
	:rtype: bool") RealLimit;
		Standard_Boolean RealLimit (const Standard_Boolean max,Standard_Real &OutValue);

		/****************** RealValue ******************/
		%feature("compactdefaultargs") RealValue;
		%feature("autodoc", "* Returns the value as real, for a Real type TypedValue Else, returns 0.
	:rtype: float") RealValue;
		Standard_Real RealValue ();

		/****************** Satisfies ******************/
		%feature("compactdefaultargs") Satisfies;
		%feature("autodoc", "* Returns True if a value statifies the specification (remark : does not apply to Entity : see ObjectType, for this type, the string is just a comment)
	:param hval:
	:type hval: TCollection_HAsciiString
	:rtype: bool") Satisfies;
		virtual Standard_Boolean Satisfies (const opencascade::handle<TCollection_HAsciiString> & hval);

		/****************** SatisfiesName ******************/
		%feature("compactdefaultargs") SatisfiesName;
		%feature("autodoc", "* Returns name of specific satisfy, empty string if none
	:rtype: char *") SatisfiesName;
		const char * SatisfiesName ();

		/****************** SetCStringValue ******************/
		%feature("compactdefaultargs") SetCStringValue;
		%feature("autodoc", "* Changes the value. The new one must satisfy the specification Returns False (and did not set) if the new value does not satisfy the specification Can be redefined to be managed (in a subclass)
	:param val:
	:type val: char *
	:rtype: bool") SetCStringValue;
		virtual Standard_Boolean SetCStringValue (const char * val);

		/****************** SetDefinition ******************/
		%feature("compactdefaultargs") SetDefinition;
		%feature("autodoc", "* Enforces a Definition
	:param deftext:
	:type deftext: char *
	:rtype: None") SetDefinition;
		void SetDefinition (const char * deftext);

		/****************** SetHStringValue ******************/
		%feature("compactdefaultargs") SetHStringValue;
		%feature("autodoc", "* Forces a new Handle for the Value It can be empty, else (if Type is not free Text), it must satisfy the specification. Not only the value is changed, but also the way it is shared Remark : for Type=Object, this value is not controlled, it can be set as a comment Returns False (and did not set) if the new value does not satisfy the specification Can be redefined to be managed (in a subclass)
	:param hval:
	:type hval: TCollection_HAsciiString
	:rtype: bool") SetHStringValue;
		virtual Standard_Boolean SetHStringValue (const opencascade::handle<TCollection_HAsciiString> & hval);

		/****************** SetIntegerLimit ******************/
		%feature("compactdefaultargs") SetIntegerLimit;
		%feature("autodoc", "* Sets an Integer limit (included) to <val>, the upper limit if <max> is True, the lower limit if <max> is False
	:param max:
	:type max: bool
	:param val:
	:type val: int
	:rtype: None") SetIntegerLimit;
		void SetIntegerLimit (const Standard_Boolean max,const Standard_Integer val);

		/****************** SetIntegerValue ******************/
		%feature("compactdefaultargs") SetIntegerValue;
		%feature("autodoc", "* Changes the value as an integer, only for Integer or Enum
	:param ival:
	:type ival: int
	:rtype: bool") SetIntegerValue;
		virtual Standard_Boolean SetIntegerValue (const Standard_Integer ival);

		/****************** SetInterpret ******************/
		%feature("compactdefaultargs") SetInterpret;
		%feature("autodoc", "* Sets a specific Interpret function
	:param func:
	:type func: MoniTool_ValueInterpret
	:rtype: None") SetInterpret;
		void SetInterpret (const MoniTool_ValueInterpret func);

		/****************** SetLabel ******************/
		%feature("compactdefaultargs") SetLabel;
		%feature("autodoc", "* Sets a label, which can then be displayed
	:param label:
	:type label: char *
	:rtype: None") SetLabel;
		void SetLabel (const char * label);

		/****************** SetMaxLength ******************/
		%feature("compactdefaultargs") SetMaxLength;
		%feature("autodoc", "* Sets a maximum length for a text (active only for a free text)
	:param max:
	:type max: int
	:rtype: None") SetMaxLength;
		void SetMaxLength (const Standard_Integer max);

		/****************** SetObjectType ******************/
		%feature("compactdefaultargs") SetObjectType;
		%feature("autodoc", "* Sets type of which an Object TypedValue must be kind of Error for a TypedValue not an Object (Entity)
	:param typ:
	:type typ: Standard_Type
	:rtype: None") SetObjectType;
		void SetObjectType (const opencascade::handle<Standard_Type> & typ);

		/****************** SetObjectValue ******************/
		%feature("compactdefaultargs") SetObjectValue;
		%feature("autodoc", "* Changes the value as Transient Object, only for Object/Entity Returns False if DynamicType does not satisfy ObjectType Can be redefined to be managed (in a subclass)
	:param obj:
	:type obj: Standard_Transient
	:rtype: bool") SetObjectValue;
		virtual Standard_Boolean SetObjectValue (const opencascade::handle<Standard_Transient> & obj);

		/****************** SetRealLimit ******************/
		%feature("compactdefaultargs") SetRealLimit;
		%feature("autodoc", "* Sets a Real limit (included) to <val>, the upper limit if <max> is True, the lower limit if <max> is False
	:param max:
	:type max: bool
	:param val:
	:type val: float
	:rtype: None") SetRealLimit;
		void SetRealLimit (const Standard_Boolean max,const Standard_Real val);

		/****************** SetRealValue ******************/
		%feature("compactdefaultargs") SetRealValue;
		%feature("autodoc", "* Changes the value as a real, only for Real
	:param rval:
	:type rval: float
	:rtype: bool") SetRealValue;
		virtual Standard_Boolean SetRealValue (const Standard_Real rval);

		/****************** SetSatisfies ******************/
		%feature("compactdefaultargs") SetSatisfies;
		%feature("autodoc", "* Sets a specific Satisfies function : it is added to the already defined criteria It must match the form : statisfies (val : HAsciiString) returns Boolean
	:param func:
	:type func: MoniTool_ValueSatisfies
	:param name:
	:type name: char *
	:rtype: None") SetSatisfies;
		void SetSatisfies (const MoniTool_ValueSatisfies func,const char * name);

		/****************** SetUnitDef ******************/
		%feature("compactdefaultargs") SetUnitDef;
		%feature("autodoc", "* Sets (Clears if <def> empty) a unit definition, as an equation of dimensions. TypedValue just records this definition, does not exploit it, to be done as required by user applications
	:param def:
	:type def: char *
	:rtype: None") SetUnitDef;
		void SetUnitDef (const char * def);

		/****************** StartEnum ******************/
		%feature("compactdefaultargs") StartEnum;
		%feature("autodoc", "* For an enumeration, precises the starting value (default 0) and the match condition : if True (D), the string value must match the definition, else it may take another value : in that case, the Integer Value will be Start - 1. (empty value remains allowed)
	:param start: default value is 0
	:type start: int
	:param match: default value is Standard_True
	:type match: bool
	:rtype: None") StartEnum;
		void StartEnum (const Standard_Integer start = 0,const Standard_Boolean match = Standard_True);

		/****************** StaticValue ******************/
		%feature("compactdefaultargs") StaticValue;
		%feature("autodoc", "* Returns a static value from its name, null if unknown
	:param name:
	:type name: char *
	:rtype: opencascade::handle<MoniTool_TypedValue>") StaticValue;
		static opencascade::handle<MoniTool_TypedValue> StaticValue (const char * name);

		/****************** UnitDef ******************/
		%feature("compactdefaultargs") UnitDef;
		%feature("autodoc", "* Returns the recorded unit definition, empty if not set
	:rtype: char *") UnitDef;
		const char * UnitDef ();

		/****************** ValueType ******************/
		%feature("compactdefaultargs") ValueType;
		%feature("autodoc", "* Returns the type of the value
	:rtype: MoniTool_ValueType") ValueType;
		MoniTool_ValueType ValueType ();

};


%make_alias(MoniTool_TypedValue)

%extend MoniTool_TypedValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class MoniTool_SignShape *
***************************/
class MoniTool_SignShape : public MoniTool_SignText {
	public:
		/****************** MoniTool_SignShape ******************/
		%feature("compactdefaultargs") MoniTool_SignShape;
		%feature("autodoc", ":rtype: None") MoniTool_SignShape;
		 MoniTool_SignShape ();

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "* Returns 'SHAPE'
	:rtype: char *") Name;
		const char * Name ();

		/****************** Text ******************/
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "* Returns for a HShape, the string of its ShapeEnum The Model is absolutely useless (may be null)
	:param ent:
	:type ent: Standard_Transient
	:param context:
	:type context: Standard_Transient
	:rtype: TCollection_AsciiString") Text;
		TCollection_AsciiString Text (const opencascade::handle<Standard_Transient> & ent,const opencascade::handle<Standard_Transient> & context);

};


%make_alias(MoniTool_SignShape)

%extend MoniTool_SignShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class MoniTool_TransientElem *
*******************************/
class MoniTool_TransientElem : public MoniTool_Element {
	public:
		/****************** Equates ******************/
		%feature("compactdefaultargs") Equates;
		%feature("autodoc", "* Specific testof equallity : defined as False if <other> has not the same true Type, else contents are compared (by C++ operator ==)
	:param other:
	:type other: MoniTool_Element
	:rtype: bool") Equates;
		Standard_Boolean Equates (const opencascade::handle<MoniTool_Element> & other);

		/****************** MoniTool_TransientElem ******************/
		%feature("compactdefaultargs") MoniTool_TransientElem;
		%feature("autodoc", "* Creates a TransientElem with a Value. This Value can then not be changed. It is used by the Hasher to compute the HashCode, which will then be stored for an immediate reading.
	:param akey:
	:type akey: Standard_Transient
	:rtype: None") MoniTool_TransientElem;
		 MoniTool_TransientElem (const opencascade::handle<Standard_Transient> & akey);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the contained value
	:rtype: opencascade::handle<Standard_Transient>") Value;
		const opencascade::handle<Standard_Transient> & Value ();

		/****************** ValueType ******************/
		%feature("compactdefaultargs") ValueType;
		%feature("autodoc", "* Returns the Type of the Value. By default, returns the DynamicType of <self>, but can be redefined
	:rtype: opencascade::handle<Standard_Type>") ValueType;
		virtual opencascade::handle<Standard_Type> ValueType ();

		/****************** ValueTypeName ******************/
		%feature("compactdefaultargs") ValueTypeName;
		%feature("autodoc", "* Returns the name of the Type of the Value. Default is name of ValueType, unless it is for a non-handled object
	:rtype: char *") ValueTypeName;
		virtual const char * ValueTypeName ();

};


%make_alias(MoniTool_TransientElem)

%extend MoniTool_TransientElem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
class MoniTool_HSequenceOfElement : public  MoniTool_SequenceOfElement, public Standard_Transient {
  public:
    MoniTool_HSequenceOfElement();
    MoniTool_HSequenceOfElement(const  MoniTool_SequenceOfElement& theOther);
    const  MoniTool_SequenceOfElement& Sequence();
    void Append (const  MoniTool_SequenceOfElement::value_type& theItem);
    void Append ( MoniTool_SequenceOfElement& theSequence);
     MoniTool_SequenceOfElement& ChangeSequence();
};
%make_alias(MoniTool_HSequenceOfElement)


