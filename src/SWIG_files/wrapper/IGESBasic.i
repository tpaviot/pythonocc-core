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
%define IGESBASICDOCSTRING
"IGESBasic module, see official documentation at
https://www.opencascade.com/doc/occt-7.6.0/refman/html/package_igesbasic.html"
%enddef
%module (package="OCC.Core", docstring=IGESBASICDOCSTRING) IGESBasic


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
#include<IGESBasic_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<IGESData_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Interface_module.hxx>
#include<TColgp_module.hxx>
#include<gp_module.hxx>
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
%import TCollection.i
%import Interface.i
%import TColgp.i
%import gp.i

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
%wrap_handle(IGESBasic_AssocGroupType)
%wrap_handle(IGESBasic_ExternalRefFile)
%wrap_handle(IGESBasic_ExternalRefFileIndex)
%wrap_handle(IGESBasic_ExternalRefFileName)
%wrap_handle(IGESBasic_ExternalRefLibName)
%wrap_handle(IGESBasic_ExternalRefName)
%wrap_handle(IGESBasic_ExternalReferenceFile)
%wrap_handle(IGESBasic_GeneralModule)
%wrap_handle(IGESBasic_Group)
%wrap_handle(IGESBasic_HArray1OfHArray1OfIGESEntity)
%wrap_handle(IGESBasic_HArray1OfHArray1OfInteger)
%wrap_handle(IGESBasic_HArray1OfHArray1OfReal)
%wrap_handle(IGESBasic_HArray1OfHArray1OfXY)
%wrap_handle(IGESBasic_HArray1OfHArray1OfXYZ)
%wrap_handle(IGESBasic_Hierarchy)
%wrap_handle(IGESBasic_Name)
%wrap_handle(IGESBasic_Protocol)
%wrap_handle(IGESBasic_ReadWriteModule)
%wrap_handle(IGESBasic_SingleParent)
%wrap_handle(IGESBasic_SingularSubfigure)
%wrap_handle(IGESBasic_SpecificModule)
%wrap_handle(IGESBasic_SubfigureDef)
%wrap_handle(IGESBasic_GroupWithoutBackP)
%wrap_handle(IGESBasic_OrderedGroup)
%wrap_handle(IGESBasic_OrderedGroupWithoutBackP)
%wrap_handle(IGESBasic_HArray1OfLineFontEntity)
%wrap_handle(IGESBasic_HArray2OfHArray1OfReal)
/* end handles declaration */

/* templates */
%template(IGESBasic_Array1OfLineFontEntity) NCollection_Array1<opencascade::handle<IGESData_LineFontEntity>>;

%extend NCollection_Array1<opencascade::handle<IGESData_LineFontEntity>> {
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
%template(IGESBasic_Array2OfHArray1OfReal) NCollection_Array2<opencascade::handle<TColStd_HArray1OfReal>>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1 <opencascade::handle <IGESData_LineFontEntity>> IGESBasic_Array1OfLineFontEntity;
typedef NCollection_Array2 <opencascade::handle <TColStd_HArray1OfReal>> IGESBasic_Array2OfHArray1OfReal;
/* end typedefs declaration */

/******************
* class IGESBasic *
******************/
%rename(igesbasic) IGESBasic;
class IGESBasic {
	public:
		/****************** Init ******************/
		/**** md5 signature: 342fdccc4643f67c269591c4b6447108 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Prepares dynqmic data (protocol, modules) for this package.

Returns
-------
void
") Init;
		static void Init();

		/****************** Protocol ******************/
		/**** md5 signature: a3a18ada49958ded83916b54c79012b5 ****/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Returns the protocol for this package.

Returns
-------
opencascade::handle<IGESBasic_Protocol>
") Protocol;
		static opencascade::handle<IGESBasic_Protocol> Protocol();

};


%extend IGESBasic {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IGESBasic_AssocGroupType *
*********************************/
class IGESBasic_AssocGroupType : public IGESData_IGESEntity {
	public:
		/****************** IGESBasic_AssocGroupType ******************/
		/**** md5 signature: 50b5907277681d73b21b7e8e8108bad5 ****/
		%feature("compactdefaultargs") IGESBasic_AssocGroupType;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESBasic_AssocGroupType;
		 IGESBasic_AssocGroupType();

		/****************** AssocType ******************/
		/**** md5 signature: c9a1675805ed1c025e5ce803377c13e9 ****/
		%feature("compactdefaultargs") AssocType;
		%feature("autodoc", "Returns the type of attached associativity.

Returns
-------
int
") AssocType;
		Standard_Integer AssocType();

		/****************** Init ******************/
		/**** md5 signature: 174ba6807c6f6cd36269b8917734beae ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class assocgrouptype - nbdatafields : number of parameter data fields = 2 - atype : type of attached associativity - aname : identifier of associativity of type atype.

Parameters
----------
nbDataFields: int
aType: int
aName: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const Standard_Integer nbDataFields, const Standard_Integer aType, const opencascade::handle<TCollection_HAsciiString> & aName);

		/****************** Name ******************/
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns identifier of instance of specified associativity.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** NbData ******************/
		/**** md5 signature: 65dffaaee72ce13df8f72ba4f254de29 ****/
		%feature("compactdefaultargs") NbData;
		%feature("autodoc", "Returns the number of parameter data fields, always = 2.

Returns
-------
int
") NbData;
		Standard_Integer NbData();

};


%make_alias(IGESBasic_AssocGroupType)

%extend IGESBasic_AssocGroupType {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class IGESBasic_ExternalRefFile *
**********************************/
class IGESBasic_ExternalRefFile : public IGESData_IGESEntity {
	public:
		/****************** IGESBasic_ExternalRefFile ******************/
		/**** md5 signature: 14e3d7bf69388f1c089c2d99b52f4461 ****/
		%feature("compactdefaultargs") IGESBasic_ExternalRefFile;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESBasic_ExternalRefFile;
		 IGESBasic_ExternalRefFile();

		/****************** FileId ******************/
		/**** md5 signature: 823879fac27579bc0868086821210df7 ****/
		%feature("compactdefaultargs") FileId;
		%feature("autodoc", "Returns external reference file identifier.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") FileId;
		opencascade::handle<TCollection_HAsciiString> FileId();

		/****************** Init ******************/
		/**** md5 signature: 59e689c0657927eecb9b95848cf21b33 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the field of the class externalreffile - afileident : external reference file identifier.

Parameters
----------
aFileIdent: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aFileIdent);

};


%make_alias(IGESBasic_ExternalRefFile)

%extend IGESBasic_ExternalRefFile {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class IGESBasic_ExternalRefFileIndex *
***************************************/
class IGESBasic_ExternalRefFileIndex : public IGESData_IGESEntity {
	public:
		/****************** IGESBasic_ExternalRefFileIndex ******************/
		/**** md5 signature: 652cab895502e5f19d6b4ee9f494aac4 ****/
		%feature("compactdefaultargs") IGESBasic_ExternalRefFileIndex;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESBasic_ExternalRefFileIndex;
		 IGESBasic_ExternalRefFileIndex();

		/****************** Entity ******************/
		/**** md5 signature: 6bfd10ecd7c39267f9dd2b98e834cad8 ****/
		%feature("compactdefaultargs") Entity;
		%feature("autodoc", "Returns the internal entity raises exception if index <= 0 or index > nbentries().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") Entity;
		opencascade::handle<IGESData_IGESEntity> Entity(const Standard_Integer Index);

		/****************** Init ******************/
		/**** md5 signature: d049f941ef1e086c4afdcb215a078f7f ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class externalreffileindex - anamearray : external reference entity symbolic names - allentities : external reference entities raises exception if array lengths are not equal if size of anamearray is not equal to size of allentities.

Parameters
----------
aNameArray: Interface_HArray1OfHAsciiString
allEntities: IGESData_HArray1OfIGESEntity

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Interface_HArray1OfHAsciiString> & aNameArray, const opencascade::handle<IGESData_HArray1OfIGESEntity> & allEntities);

		/****************** Name ******************/
		/**** md5 signature: ad043845bed8f1818ba72efdb2e9b497 ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns the external reference entity symbolic name raises exception if index <= 0 or index > nbentries().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name(const Standard_Integer Index);

		/****************** NbEntries ******************/
		/**** md5 signature: ecddd62a08f430dc436b653a6657cde0 ****/
		%feature("compactdefaultargs") NbEntries;
		%feature("autodoc", "Returns number of index entries.

Returns
-------
int
") NbEntries;
		Standard_Integer NbEntries();

};


%make_alias(IGESBasic_ExternalRefFileIndex)

%extend IGESBasic_ExternalRefFileIndex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class IGESBasic_ExternalRefFileName *
**************************************/
class IGESBasic_ExternalRefFileName : public IGESData_IGESEntity {
	public:
		/****************** IGESBasic_ExternalRefFileName ******************/
		/**** md5 signature: 6f289b66009430ac31917204f016967e ****/
		%feature("compactdefaultargs") IGESBasic_ExternalRefFileName;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESBasic_ExternalRefFileName;
		 IGESBasic_ExternalRefFileName();

		/****************** FileId ******************/
		/**** md5 signature: 823879fac27579bc0868086821210df7 ****/
		%feature("compactdefaultargs") FileId;
		%feature("autodoc", "Returns external reference file identifier.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") FileId;
		opencascade::handle<TCollection_HAsciiString> FileId();

		/****************** Init ******************/
		/**** md5 signature: d189b3bd6d444ae3582237e5dfc84c7a ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class externalreffilename - afileident : external reference file identifier - anextname : external reference entity symbolic name.

Parameters
----------
aFileIdent: TCollection_HAsciiString
anExtName: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aFileIdent, const opencascade::handle<TCollection_HAsciiString> & anExtName);

		/****************** ReferenceName ******************/
		/**** md5 signature: 4df24382c877d57904e8835a5540159f ****/
		%feature("compactdefaultargs") ReferenceName;
		%feature("autodoc", "Returns external reference entity symbolic name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") ReferenceName;
		opencascade::handle<TCollection_HAsciiString> ReferenceName();

		/****************** SetForEntity ******************/
		/**** md5 signature: 44eaee875220d2b492db30bf8f860ada ****/
		%feature("compactdefaultargs") SetForEntity;
		%feature("autodoc", "Changes formnumber to be 2 if <mode> is true (for entity) or 0 if <mode> is false (for definition).

Parameters
----------
mode: bool

Returns
-------
None
") SetForEntity;
		void SetForEntity(const Standard_Boolean mode);

};


%make_alias(IGESBasic_ExternalRefFileName)

%extend IGESBasic_ExternalRefFileName {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class IGESBasic_ExternalRefLibName *
*************************************/
class IGESBasic_ExternalRefLibName : public IGESData_IGESEntity {
	public:
		/****************** IGESBasic_ExternalRefLibName ******************/
		/**** md5 signature: 6d74ea15eae9b936eab673d7b9678b1c ****/
		%feature("compactdefaultargs") IGESBasic_ExternalRefLibName;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESBasic_ExternalRefLibName;
		 IGESBasic_ExternalRefLibName();

		/****************** Init ******************/
		/**** md5 signature: 96abd093dfc76729dd67948322876eda ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class externalreflibname - alibname : name of library in which extname resides - anextname : external reference entity symbolic name.

Parameters
----------
aLibName: TCollection_HAsciiString
anExtName: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aLibName, const opencascade::handle<TCollection_HAsciiString> & anExtName);

		/****************** LibraryName ******************/
		/**** md5 signature: a49d172c18210cfaa0e2fbab3132e473 ****/
		%feature("compactdefaultargs") LibraryName;
		%feature("autodoc", "Returns name of library in which external reference entity symbolic name resides.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") LibraryName;
		opencascade::handle<TCollection_HAsciiString> LibraryName();

		/****************** ReferenceName ******************/
		/**** md5 signature: 4df24382c877d57904e8835a5540159f ****/
		%feature("compactdefaultargs") ReferenceName;
		%feature("autodoc", "Returns external reference entity symbolic name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") ReferenceName;
		opencascade::handle<TCollection_HAsciiString> ReferenceName();

};


%make_alias(IGESBasic_ExternalRefLibName)

%extend IGESBasic_ExternalRefLibName {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class IGESBasic_ExternalRefName *
**********************************/
class IGESBasic_ExternalRefName : public IGESData_IGESEntity {
	public:
		/****************** IGESBasic_ExternalRefName ******************/
		/**** md5 signature: 810c15d433f4a1cd5f0718d723223879 ****/
		%feature("compactdefaultargs") IGESBasic_ExternalRefName;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESBasic_ExternalRefName;
		 IGESBasic_ExternalRefName();

		/****************** Init ******************/
		/**** md5 signature: 5d4d6b6c8f6586468cee6b1fdb85a21c ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class externalrefname - anextname : external reference entity symbolic name.

Parameters
----------
anExtName: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & anExtName);

		/****************** ReferenceName ******************/
		/**** md5 signature: 4df24382c877d57904e8835a5540159f ****/
		%feature("compactdefaultargs") ReferenceName;
		%feature("autodoc", "Returns external reference entity symbolic name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") ReferenceName;
		opencascade::handle<TCollection_HAsciiString> ReferenceName();

};


%make_alias(IGESBasic_ExternalRefName)

%extend IGESBasic_ExternalRefName {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class IGESBasic_ExternalReferenceFile *
****************************************/
class IGESBasic_ExternalReferenceFile : public IGESData_IGESEntity {
	public:
		/****************** IGESBasic_ExternalReferenceFile ******************/
		/**** md5 signature: 536927a8f2e8f5c136587650a515fbd1 ****/
		%feature("compactdefaultargs") IGESBasic_ExternalReferenceFile;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESBasic_ExternalReferenceFile;
		 IGESBasic_ExternalReferenceFile();

		/****************** Init ******************/
		/**** md5 signature: ebe5ad510e1f8960a218ffc86a413dfe ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class externalreferencefile - anamearray : external reference file names.

Parameters
----------
aNameArray: Interface_HArray1OfHAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Interface_HArray1OfHAsciiString> & aNameArray);

		/****************** Name ******************/
		/**** md5 signature: ad043845bed8f1818ba72efdb2e9b497 ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns external reference file name raises exception if index <= 0 or index > nblistentries().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name(const Standard_Integer Index);

		/****************** NbListEntries ******************/
		/**** md5 signature: 2725ba4baf584a538c052962f9c1a711 ****/
		%feature("compactdefaultargs") NbListEntries;
		%feature("autodoc", "Returns number of external reference file names.

Returns
-------
int
") NbListEntries;
		Standard_Integer NbListEntries();

};


%make_alias(IGESBasic_ExternalReferenceFile)

%extend IGESBasic_ExternalReferenceFile {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class IGESBasic_GeneralModule *
********************************/
class IGESBasic_GeneralModule : public IGESData_GeneralModule {
	public:
		/****************** IGESBasic_GeneralModule ******************/
		/**** md5 signature: 59d0fdae461b6424ad13ae405efcdf9b ****/
		%feature("compactdefaultargs") IGESBasic_GeneralModule;
		%feature("autodoc", "Creates a generalmodule from igesbasic and puts it into generallib.

Returns
-------
None
") IGESBasic_GeneralModule;
		 IGESBasic_GeneralModule();

		/****************** CategoryNumber ******************/
		/**** md5 signature: d812efe400e2084fa824301d3c147806 ****/
		%feature("compactdefaultargs") CategoryNumber;
		%feature("autodoc", "Returns a category number which characterizes an entity structure for groups, figures & co description for external refs auxiliary for other.

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


%make_alias(IGESBasic_GeneralModule)

%extend IGESBasic_GeneralModule {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class IGESBasic_Group *
************************/
class IGESBasic_Group : public IGESData_IGESEntity {
	public:
		/****************** IGESBasic_Group ******************/
		/**** md5 signature: 6738080cbdc5293727716565e0dca238 ****/
		%feature("compactdefaultargs") IGESBasic_Group;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESBasic_Group;
		 IGESBasic_Group();

		/****************** IGESBasic_Group ******************/
		/**** md5 signature: 15216efc8e28b344a9799d310c669fe6 ****/
		%feature("compactdefaultargs") IGESBasic_Group;
		%feature("autodoc", "Creates a group with a predefined count of items (which all start as null).

Parameters
----------
nb: int

Returns
-------
None
") IGESBasic_Group;
		 IGESBasic_Group(const Standard_Integer nb);

		/****************** Entity ******************/
		/**** md5 signature: 6bfd10ecd7c39267f9dd2b98e834cad8 ****/
		%feature("compactdefaultargs") Entity;
		%feature("autodoc", "Returns the specific entity from the group.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") Entity;
		opencascade::handle<IGESData_IGESEntity> Entity(const Standard_Integer Index);

		/****************** Init ******************/
		/**** md5 signature: ec47c5bf17ea714b5fca1a83b15f48db ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class group - allentities : used to store pointers to members of the group.

Parameters
----------
allEntities: IGESData_HArray1OfIGESEntity

Returns
-------
None
") Init;
		void Init(const opencascade::handle<IGESData_HArray1OfIGESEntity> & allEntities);

		/****************** IsOrdered ******************/
		/**** md5 signature: 987c102d849bdfa3134f4f681d6889a8 ****/
		%feature("compactdefaultargs") IsOrdered;
		%feature("autodoc", "Returns true if <self> is ordered.

Returns
-------
bool
") IsOrdered;
		Standard_Boolean IsOrdered();

		/****************** IsWithoutBackP ******************/
		/**** md5 signature: 77748ef738c3f5ff90354ef2e299cb4a ****/
		%feature("compactdefaultargs") IsWithoutBackP;
		%feature("autodoc", "Returns true if <self> is withoutbackp.

Returns
-------
bool
") IsWithoutBackP;
		Standard_Boolean IsWithoutBackP();

		/****************** NbEntities ******************/
		/**** md5 signature: 533943455099343f106415a0a22e8ac9 ****/
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "Returns the number of igesentities in the group.

Returns
-------
int
") NbEntities;
		Standard_Integer NbEntities();

		/****************** SetNb ******************/
		/**** md5 signature: 9c23f2226c3d0d27e4de6fc8bf4462c7 ****/
		%feature("compactdefaultargs") SetNb;
		%feature("autodoc", "Changes the count of item if greater, new items are null if lower, old items are lost.

Parameters
----------
nb: int

Returns
-------
None
") SetNb;
		void SetNb(const Standard_Integer nb);

		/****************** SetOrdered ******************/
		/**** md5 signature: b1045d466ac12f7fd43cef11554db617 ****/
		%feature("compactdefaultargs") SetOrdered;
		%feature("autodoc", "Sets a group to be, or not to be ordered (according mode).

Parameters
----------
mode: bool

Returns
-------
None
") SetOrdered;
		void SetOrdered(const Standard_Boolean mode);

		/****************** SetUser ******************/
		/**** md5 signature: ceeaacba77b4c038bcc4e2f5ba3a993b ****/
		%feature("compactdefaultargs") SetUser;
		%feature("autodoc", "Enforce a new value for the type and form.

Parameters
----------
type: int
form: int

Returns
-------
None
") SetUser;
		void SetUser(const Standard_Integer type, const Standard_Integer form);

		/****************** SetValue ******************/
		/**** md5 signature: ca9001c605b4c539ae6468e3f373a5c0 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Sets a new value for item <index>.

Parameters
----------
Index: int
ent: IGESData_IGESEntity

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Integer Index, const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** SetWithoutBackP ******************/
		/**** md5 signature: bb74017b71f6a34becb0ec4c0a3ede73 ****/
		%feature("compactdefaultargs") SetWithoutBackP;
		%feature("autodoc", "Sets a group to be, or not to be withoutbackp.

Parameters
----------
mode: bool

Returns
-------
None
") SetWithoutBackP;
		void SetWithoutBackP(const Standard_Boolean mode);

		/****************** Value ******************/
		/**** md5 signature: 9e12567a17b9b850181e2ce6bdcde3dc ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the specific entity from the group.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<Standard_Transient>
") Value;
		opencascade::handle<Standard_Transient> Value(const Standard_Integer Index);

};


%make_alias(IGESBasic_Group)

%extend IGESBasic_Group {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class IGESBasic_HArray1OfHArray1OfIGESEntity *
***********************************************/
class IGESBasic_HArray1OfHArray1OfIGESEntity : public Standard_Transient {
	public:
		/****************** IGESBasic_HArray1OfHArray1OfIGESEntity ******************/
		/**** md5 signature: 6f81306cc157205d2e4d4e4986206ac1 ****/
		%feature("compactdefaultargs") IGESBasic_HArray1OfHArray1OfIGESEntity;
		%feature("autodoc", "No available documentation.

Parameters
----------
low: int
up: int

Returns
-------
None
") IGESBasic_HArray1OfHArray1OfIGESEntity;
		 IGESBasic_HArray1OfHArray1OfIGESEntity(const Standard_Integer low, const Standard_Integer up);

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
		/**** md5 signature: c612d49513011c7a5a733e11c8a62a68 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int
val: IGESData_HArray1OfIGESEntity

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Integer num, const opencascade::handle<IGESData_HArray1OfIGESEntity> & val);

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
		/**** md5 signature: 932a562c79c0c62dd799c143eace5bc6 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
opencascade::handle<IGESData_HArray1OfIGESEntity>
") Value;
		opencascade::handle<IGESData_HArray1OfIGESEntity> Value(const Standard_Integer num);

};


%make_alias(IGESBasic_HArray1OfHArray1OfIGESEntity)

%extend IGESBasic_HArray1OfHArray1OfIGESEntity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class IGESBasic_HArray1OfHArray1OfInteger *
********************************************/
class IGESBasic_HArray1OfHArray1OfInteger : public Standard_Transient {
	public:
		/****************** IGESBasic_HArray1OfHArray1OfInteger ******************/
		/**** md5 signature: 3eb2c58a9026163f46141225952fea41 ****/
		%feature("compactdefaultargs") IGESBasic_HArray1OfHArray1OfInteger;
		%feature("autodoc", "No available documentation.

Parameters
----------
low: int
up: int

Returns
-------
None
") IGESBasic_HArray1OfHArray1OfInteger;
		 IGESBasic_HArray1OfHArray1OfInteger(const Standard_Integer low, const Standard_Integer up);

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
		/**** md5 signature: ad02e65ae4a879c74125f4e65463ac6e ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int
val: TColStd_HArray1OfInteger

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Integer num, const opencascade::handle<TColStd_HArray1OfInteger> & val);

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
		/**** md5 signature: 04119169784be401e8cd28388f41a14f ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
opencascade::handle<TColStd_HArray1OfInteger>
") Value;
		opencascade::handle<TColStd_HArray1OfInteger> Value(const Standard_Integer num);

};


%make_alias(IGESBasic_HArray1OfHArray1OfInteger)

%extend IGESBasic_HArray1OfHArray1OfInteger {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class IGESBasic_HArray1OfHArray1OfReal *
*****************************************/
class IGESBasic_HArray1OfHArray1OfReal : public Standard_Transient {
	public:
		/****************** IGESBasic_HArray1OfHArray1OfReal ******************/
		/**** md5 signature: 49d131e8e22194dab4504eceb20476bc ****/
		%feature("compactdefaultargs") IGESBasic_HArray1OfHArray1OfReal;
		%feature("autodoc", "No available documentation.

Parameters
----------
low: int
up: int

Returns
-------
None
") IGESBasic_HArray1OfHArray1OfReal;
		 IGESBasic_HArray1OfHArray1OfReal(const Standard_Integer low, const Standard_Integer up);

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
		/**** md5 signature: 82af62389ad997a78ea2223192ba1504 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int
val: TColStd_HArray1OfReal

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Integer num, const opencascade::handle<TColStd_HArray1OfReal> & val);

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
		/**** md5 signature: 3024300aa7291823c504af89152aa797 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") Value;
		opencascade::handle<TColStd_HArray1OfReal> Value(const Standard_Integer num);

};


%make_alias(IGESBasic_HArray1OfHArray1OfReal)

%extend IGESBasic_HArray1OfHArray1OfReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class IGESBasic_HArray1OfHArray1OfXY *
***************************************/
class IGESBasic_HArray1OfHArray1OfXY : public Standard_Transient {
	public:
		/****************** IGESBasic_HArray1OfHArray1OfXY ******************/
		/**** md5 signature: fad09fa0d9438ed4c3d3dfb646570c4f ****/
		%feature("compactdefaultargs") IGESBasic_HArray1OfHArray1OfXY;
		%feature("autodoc", "No available documentation.

Parameters
----------
low: int
up: int

Returns
-------
None
") IGESBasic_HArray1OfHArray1OfXY;
		 IGESBasic_HArray1OfHArray1OfXY(const Standard_Integer low, const Standard_Integer up);

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
		/**** md5 signature: 5474f05822d3228e3d205b7aa512b849 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int
val: TColgp_HArray1OfXY

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Integer num, const opencascade::handle<TColgp_HArray1OfXY> & val);

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
		/**** md5 signature: 41efe5cd14d0a24063ad8cc4d27cc747 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
opencascade::handle<TColgp_HArray1OfXY>
") Value;
		opencascade::handle<TColgp_HArray1OfXY> Value(const Standard_Integer num);

};


%make_alias(IGESBasic_HArray1OfHArray1OfXY)

%extend IGESBasic_HArray1OfHArray1OfXY {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class IGESBasic_HArray1OfHArray1OfXYZ *
****************************************/
class IGESBasic_HArray1OfHArray1OfXYZ : public Standard_Transient {
	public:
		/****************** IGESBasic_HArray1OfHArray1OfXYZ ******************/
		/**** md5 signature: 88d93f4d408922e7d0f3fd3bdc0ff894 ****/
		%feature("compactdefaultargs") IGESBasic_HArray1OfHArray1OfXYZ;
		%feature("autodoc", "No available documentation.

Parameters
----------
low: int
up: int

Returns
-------
None
") IGESBasic_HArray1OfHArray1OfXYZ;
		 IGESBasic_HArray1OfHArray1OfXYZ(const Standard_Integer low, const Standard_Integer up);

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
		/**** md5 signature: c69d42f2b0831eadb07a1a4044963fe4 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int
val: TColgp_HArray1OfXYZ

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Integer num, const opencascade::handle<TColgp_HArray1OfXYZ> & val);

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
		/**** md5 signature: eb8374db0e012661c33cf4391931ea67 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
opencascade::handle<TColgp_HArray1OfXYZ>
") Value;
		opencascade::handle<TColgp_HArray1OfXYZ> Value(const Standard_Integer num);

};


%make_alias(IGESBasic_HArray1OfHArray1OfXYZ)

%extend IGESBasic_HArray1OfHArray1OfXYZ {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class IGESBasic_Hierarchy *
****************************/
class IGESBasic_Hierarchy : public IGESData_IGESEntity {
	public:
		/****************** IGESBasic_Hierarchy ******************/
		/**** md5 signature: 245093002ae0e02e28f0921401d85293 ****/
		%feature("compactdefaultargs") IGESBasic_Hierarchy;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESBasic_Hierarchy;
		 IGESBasic_Hierarchy();

		/****************** Init ******************/
		/**** md5 signature: 69bcb97522813dc5d371b5b322cddda1 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class hierarchy - nbpropval : number of property values = 6 - alinefont : indicates the line font - aview : indicates the view - aentitylevel : indicates the entity level - ablankstatus : indicates the blank status - alinewt : indicates the line weight - acolornum : indicates the color num alinefont, aview, aentitylevel, ablankstatus, alinewt and acolornum can take 0 or 1. 0 : the directory entry attribute will apply to entities physically subordinate to this entity. 1 : the directory entry attribute of this entity will not apply to physically subordinate entities.

Parameters
----------
nbPropVal: int
aLineFont: int
aView: int
anEntityLevel: int
aBlankStatus: int
aLineWt: int
aColorNum: int

Returns
-------
None
") Init;
		void Init(const Standard_Integer nbPropVal, const Standard_Integer aLineFont, const Standard_Integer aView, const Standard_Integer anEntityLevel, const Standard_Integer aBlankStatus, const Standard_Integer aLineWt, const Standard_Integer aColorNum);

		/****************** NbPropertyValues ******************/
		/**** md5 signature: 0fffdeb77dedf6abde7c32e5ad90b9d8 ****/
		%feature("compactdefaultargs") NbPropertyValues;
		%feature("autodoc", "Returns the number of property values, which should be 6.

Returns
-------
int
") NbPropertyValues;
		Standard_Integer NbPropertyValues();

		/****************** NewBlankStatus ******************/
		/**** md5 signature: c351058a965d83bd7e73d59c84be369d ****/
		%feature("compactdefaultargs") NewBlankStatus;
		%feature("autodoc", "Returns the blank status.

Returns
-------
int
") NewBlankStatus;
		Standard_Integer NewBlankStatus();

		/****************** NewColorNum ******************/
		/**** md5 signature: 9497ef734e9df4bc42249d975f5a8e92 ****/
		%feature("compactdefaultargs") NewColorNum;
		%feature("autodoc", "Returns the color number.

Returns
-------
int
") NewColorNum;
		Standard_Integer NewColorNum();

		/****************** NewEntityLevel ******************/
		/**** md5 signature: 991b31f9897098662c503ba4ef5e66c9 ****/
		%feature("compactdefaultargs") NewEntityLevel;
		%feature("autodoc", "Returns the entity level.

Returns
-------
int
") NewEntityLevel;
		Standard_Integer NewEntityLevel();

		/****************** NewLineFont ******************/
		/**** md5 signature: 36e6a50273eff8967446140541bef59d ****/
		%feature("compactdefaultargs") NewLineFont;
		%feature("autodoc", "Returns the line font.

Returns
-------
int
") NewLineFont;
		Standard_Integer NewLineFont();

		/****************** NewLineWeight ******************/
		/**** md5 signature: 992559d1fcfd1b6ba4b3b1d5046e18a1 ****/
		%feature("compactdefaultargs") NewLineWeight;
		%feature("autodoc", "Returns the line weight.

Returns
-------
int
") NewLineWeight;
		Standard_Integer NewLineWeight();

		/****************** NewView ******************/
		/**** md5 signature: 3406adb8b72d12e3f977ec134bd05304 ****/
		%feature("compactdefaultargs") NewView;
		%feature("autodoc", "Returns the view.

Returns
-------
int
") NewView;
		Standard_Integer NewView();

};


%make_alias(IGESBasic_Hierarchy)

%extend IGESBasic_Hierarchy {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class IGESBasic_Name *
***********************/
class IGESBasic_Name : public IGESData_NameEntity {
	public:
		/****************** IGESBasic_Name ******************/
		/**** md5 signature: 9a5e1e4156e84eecd6810d1c0ecd5e33 ****/
		%feature("compactdefaultargs") IGESBasic_Name;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESBasic_Name;
		 IGESBasic_Name();

		/****************** Init ******************/
		/**** md5 signature: 1c03d899c98bd8d37412c3a87b70d13e ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class name - nbpropval : number of property values, always = 1 - aname : stores the name.

Parameters
----------
nbPropVal: int
aName: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const Standard_Integer nbPropVal, const opencascade::handle<TCollection_HAsciiString> & aName);

		/****************** NbPropertyValues ******************/
		/**** md5 signature: 0fffdeb77dedf6abde7c32e5ad90b9d8 ****/
		%feature("compactdefaultargs") NbPropertyValues;
		%feature("autodoc", "Returns the number of property values, which should be 1.

Returns
-------
int
") NbPropertyValues;
		Standard_Integer NbPropertyValues();

		/****************** Value ******************/
		/**** md5 signature: c0ba2fa47d79428ce0599ed10715db4f ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the user defined name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Value;
		opencascade::handle<TCollection_HAsciiString> Value();

};


%make_alias(IGESBasic_Name)

%extend IGESBasic_Name {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class IGESBasic_Protocol *
***************************/
class IGESBasic_Protocol : public IGESData_Protocol {
	public:
		/****************** IGESBasic_Protocol ******************/
		/**** md5 signature: c6b5401cc6def09dfa0bcb148e0e5638 ****/
		%feature("compactdefaultargs") IGESBasic_Protocol;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESBasic_Protocol;
		 IGESBasic_Protocol();

		/****************** NbResources ******************/
		/**** md5 signature: cd524335b33aeb6eb83cc80f6b7e5681 ****/
		%feature("compactdefaultargs") NbResources;
		%feature("autodoc", "Gives the count of resource protocol. here, one (protocol from igesdata).

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


%make_alias(IGESBasic_Protocol)

%extend IGESBasic_Protocol {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class IGESBasic_ReadWriteModule *
**********************************/
class IGESBasic_ReadWriteModule : public IGESData_ReadWriteModule {
	public:
		/****************** IGESBasic_ReadWriteModule ******************/
		/**** md5 signature: ea8da2866bc65ab98e291585a57f3e7b ****/
		%feature("compactdefaultargs") IGESBasic_ReadWriteModule;
		%feature("autodoc", "Creates a readwritemodule & puts it into readerlib & writerlib.

Returns
-------
None
") IGESBasic_ReadWriteModule;
		 IGESBasic_ReadWriteModule();

		/****************** CaseIGES ******************/
		/**** md5 signature: de66f0948cefad4e0218511df612ee48 ****/
		%feature("compactdefaultargs") CaseIGES;
		%feature("autodoc", "Defines case numbers for entities of igesbasic.

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
		%feature("autodoc", "Reads own parameters from file for an entity of igesbasic.

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


%make_alias(IGESBasic_ReadWriteModule)

%extend IGESBasic_ReadWriteModule {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class IGESBasic_SingleParent *
*******************************/
class IGESBasic_SingleParent : public IGESData_SingleParentEntity {
	public:
		/****************** IGESBasic_SingleParent ******************/
		/**** md5 signature: fc1289ed00e6f1857081ce45b70692f8 ****/
		%feature("compactdefaultargs") IGESBasic_SingleParent;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESBasic_SingleParent;
		 IGESBasic_SingleParent();

		/****************** Child ******************/
		/**** md5 signature: a89d8fc18f945ae856a3505f8409992e ****/
		%feature("compactdefaultargs") Child;
		%feature("autodoc", "Returns the specific child as indicated by index raises exception if index <= 0 or index > nbchildren().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") Child;
		opencascade::handle<IGESData_IGESEntity> Child(const Standard_Integer Index);

		/****************** Init ******************/
		/**** md5 signature: c5aa1a69e06ca7431d22c6fe66cbb91f ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class singleparent - nbparententities : indicates number of parents, always = 1 - aparententity : used to hold the parent entity - allchildren : used to hold the children.

Parameters
----------
nbParentEntities: int
aParentEntity: IGESData_IGESEntity
allChildren: IGESData_HArray1OfIGESEntity

Returns
-------
None
") Init;
		void Init(const Standard_Integer nbParentEntities, const opencascade::handle<IGESData_IGESEntity> & aParentEntity, const opencascade::handle<IGESData_HArray1OfIGESEntity> & allChildren);

		/****************** NbChildren ******************/
		/**** md5 signature: b98d3740c3de26f504244dc9bc056614 ****/
		%feature("compactdefaultargs") NbChildren;
		%feature("autodoc", "Returns the number of children of the parent.

Returns
-------
int
") NbChildren;
		Standard_Integer NbChildren();

		/****************** NbParentEntities ******************/
		/**** md5 signature: 0fc3e93a664543c2227339448dd50531 ****/
		%feature("compactdefaultargs") NbParentEntities;
		%feature("autodoc", "Returns the number of parent entities, which should be 1.

Returns
-------
int
") NbParentEntities;
		Standard_Integer NbParentEntities();

		/****************** SingleParent ******************/
		/**** md5 signature: 1ed9423297b69acc24388ea139f59dc8 ****/
		%feature("compactdefaultargs") SingleParent;
		%feature("autodoc", "Returns the parent entity (inherited method).

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") SingleParent;
		opencascade::handle<IGESData_IGESEntity> SingleParent();

};


%make_alias(IGESBasic_SingleParent)

%extend IGESBasic_SingleParent {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class IGESBasic_SingularSubfigure *
************************************/
class IGESBasic_SingularSubfigure : public IGESData_IGESEntity {
	public:
		/****************** IGESBasic_SingularSubfigure ******************/
		/**** md5 signature: 6d2dd81a27131f04543c371025ce39cd ****/
		%feature("compactdefaultargs") IGESBasic_SingularSubfigure;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESBasic_SingularSubfigure;
		 IGESBasic_SingularSubfigure();

		/****************** HasScaleFactor ******************/
		/**** md5 signature: 4113cc0003becf30b8ff8641ca58ce0f ****/
		%feature("compactdefaultargs") HasScaleFactor;
		%feature("autodoc", "Returns a boolean indicating whether scale factor is present or not.

Returns
-------
bool
") HasScaleFactor;
		Standard_Boolean HasScaleFactor();

		/****************** Init ******************/
		/**** md5 signature: 460ee8f6b298ebc45a9b767427cb409e ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class singularsubfigure - asubfiguredef : the subfigure definition entity - atranslation : used to store the x,y,z coord - hasscale : indicates the presence of scale factor - ascale : used to store the scale factor.

Parameters
----------
aSubfigureDef: IGESBasic_SubfigureDef
aTranslation: gp_XYZ
hasScale: bool
aScale: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<IGESBasic_SubfigureDef> & aSubfigureDef, const gp_XYZ & aTranslation, const Standard_Boolean hasScale, const Standard_Real aScale);

		/****************** ScaleFactor ******************/
		/**** md5 signature: 67d4a7cfb2dd29c2b400060f1b45b408 ****/
		%feature("compactdefaultargs") ScaleFactor;
		%feature("autodoc", "Returns the scale factor if hasscalefactor is false, returns 1.0 (default).

Returns
-------
float
") ScaleFactor;
		Standard_Real ScaleFactor();

		/****************** Subfigure ******************/
		/**** md5 signature: 4313afac8a025163810d55b2bef79bcd ****/
		%feature("compactdefaultargs") Subfigure;
		%feature("autodoc", "Returns the subfigure definition entity.

Returns
-------
opencascade::handle<IGESBasic_SubfigureDef>
") Subfigure;
		opencascade::handle<IGESBasic_SubfigureDef> Subfigure();

		/****************** TransformedTranslation ******************/
		/**** md5 signature: 36321ec2ff0e108ac64cf92aef7267bf ****/
		%feature("compactdefaultargs") TransformedTranslation;
		%feature("autodoc", "Returns the translation after transformation.

Returns
-------
gp_XYZ
") TransformedTranslation;
		gp_XYZ TransformedTranslation();

		/****************** Translation ******************/
		/**** md5 signature: af346406f5517579c9b394146d19b665 ****/
		%feature("compactdefaultargs") Translation;
		%feature("autodoc", "Returns the x, y, z coordinates.

Returns
-------
gp_XYZ
") Translation;
		gp_XYZ Translation();

};


%make_alias(IGESBasic_SingularSubfigure)

%extend IGESBasic_SingularSubfigure {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IGESBasic_SpecificModule *
*********************************/
class IGESBasic_SpecificModule : public IGESData_SpecificModule {
	public:
		/****************** IGESBasic_SpecificModule ******************/
		/**** md5 signature: bbf810297cbe1407ec19b9535bf05e19 ****/
		%feature("compactdefaultargs") IGESBasic_SpecificModule;
		%feature("autodoc", "Creates a specificmodule from igesbasic & puts it into specificlib.

Returns
-------
None
") IGESBasic_SpecificModule;
		 IGESBasic_SpecificModule();

		/****************** OwnCorrect ******************/
		/**** md5 signature: bbaa7e58769f5cc28e757e0612cf4245 ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Performs non-ambiguous corrections on entities which support them (assocgrouptype,hierarchy,name,singleparent).

Parameters
----------
CN: int
ent: IGESData_IGESEntity

Returns
-------
bool
") OwnCorrect;
		virtual Standard_Boolean OwnCorrect(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent);

};


%make_alias(IGESBasic_SpecificModule)

%extend IGESBasic_SpecificModule {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class IGESBasic_SubfigureDef *
*******************************/
class IGESBasic_SubfigureDef : public IGESData_IGESEntity {
	public:
		/****************** IGESBasic_SubfigureDef ******************/
		/**** md5 signature: 726b7dcba8c1b3ca59818640282b9db6 ****/
		%feature("compactdefaultargs") IGESBasic_SubfigureDef;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESBasic_SubfigureDef;
		 IGESBasic_SubfigureDef();

		/****************** AssociatedEntity ******************/
		/**** md5 signature: 34e905173f7e8a52af335ef9b6216739 ****/
		%feature("compactdefaultargs") AssociatedEntity;
		%feature("autodoc", "Returns the specific entity as indicated by index raises exception if index <= 0 or index > nbentities().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") AssociatedEntity;
		opencascade::handle<IGESData_IGESEntity> AssociatedEntity(const Standard_Integer Index);

		/****************** Depth ******************/
		/**** md5 signature: b6eaa771d2fe709741b9c1e8ce5ec68f ****/
		%feature("compactdefaultargs") Depth;
		%feature("autodoc", "Returns depth of the subfigure if thedepth = 0 - no reference to any subfigure instance.

Returns
-------
int
") Depth;
		Standard_Integer Depth();

		/****************** Init ******************/
		/**** md5 signature: 02ad889fa72b1a1058e03905a0ac753c ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class subfiguredef - adepth  : it indicates the amount of nesting - aname : the subfigure name - allassocentities : the associated entities.

Parameters
----------
aDepth: int
aName: TCollection_HAsciiString
allAssocEntities: IGESData_HArray1OfIGESEntity

Returns
-------
None
") Init;
		void Init(const Standard_Integer aDepth, const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<IGESData_HArray1OfIGESEntity> & allAssocEntities);

		/****************** Name ******************/
		/**** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns the name of subfigure.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** NbEntities ******************/
		/**** md5 signature: 533943455099343f106415a0a22e8ac9 ****/
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "Returns number of entities. is greater than or equal to zero.

Returns
-------
int
") NbEntities;
		Standard_Integer NbEntities();

		/****************** Value ******************/
		/**** md5 signature: 9e12567a17b9b850181e2ce6bdcde3dc ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the specific entity as indicated by index raises exception if index <= 0 or index > nbentities().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<Standard_Transient>
") Value;
		opencascade::handle<Standard_Transient> Value(const Standard_Integer Index);

};


%make_alias(IGESBasic_SubfigureDef)

%extend IGESBasic_SubfigureDef {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class IGESBasic_ToolAssocGroupType *
*************************************/
class IGESBasic_ToolAssocGroupType {
	public:
		/****************** IGESBasic_ToolAssocGroupType ******************/
		/**** md5 signature: a6966f9093d9dd80e579b9be3e20eb75 ****/
		%feature("compactdefaultargs") IGESBasic_ToolAssocGroupType;
		%feature("autodoc", "Returns a toolassocgrouptype, ready to work.

Returns
-------
None
") IGESBasic_ToolAssocGroupType;
		 IGESBasic_ToolAssocGroupType();

		/****************** DirChecker ******************/
		/**** md5 signature: 32c8ebade611709e2c34a07bff0516bc ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESBasic_AssocGroupType

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESBasic_AssocGroupType> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: ae3b91706e410c865de2520968496239 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESBasic_AssocGroupType
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESBasic_AssocGroupType> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 79b1724936a99b04e35c559c76237c4c ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESBasic_AssocGroupType
entto: IGESBasic_AssocGroupType
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESBasic_AssocGroupType> & entfrom, const opencascade::handle<IGESBasic_AssocGroupType> & entto, Interface_CopyTool & TC);

		/****************** OwnCorrect ******************/
		/**** md5 signature: 960c64b0acaebd044b8c3b6c879307e9 ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Sets automatic unambiguous correction on a assocgrouptype (nbdata forced to 2).

Parameters
----------
ent: IGESBasic_AssocGroupType

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect(const opencascade::handle<IGESBasic_AssocGroupType> & ent);

		/****************** OwnShared ******************/
		/**** md5 signature: 46f18ec590125d9a3e39338526c1eaa2 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a assocgrouptype <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESBasic_AssocGroupType
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESBasic_AssocGroupType> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: fd9d1d3523051c2fc1cb910167980517 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESBasic_AssocGroupType
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESBasic_AssocGroupType> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 78398c48f42eff8082181ea1adaa8ecf ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESBasic_AssocGroupType
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESBasic_AssocGroupType> & ent, IGESData_IGESWriter & IW);

};


%extend IGESBasic_ToolAssocGroupType {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class IGESBasic_ToolExternalRefFile *
**************************************/
class IGESBasic_ToolExternalRefFile {
	public:
		/****************** IGESBasic_ToolExternalRefFile ******************/
		/**** md5 signature: dfb41ad59e3934a1b0e0db4fdc9eece5 ****/
		%feature("compactdefaultargs") IGESBasic_ToolExternalRefFile;
		%feature("autodoc", "Returns a toolexternalreffile, ready to work.

Returns
-------
None
") IGESBasic_ToolExternalRefFile;
		 IGESBasic_ToolExternalRefFile();

		/****************** DirChecker ******************/
		/**** md5 signature: b5dba1b3ef296a53ffd26ee12308850d ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESBasic_ExternalRefFile

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESBasic_ExternalRefFile> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: d4982ef1e66ac58c2b0a9c8709f62047 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESBasic_ExternalRefFile
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESBasic_ExternalRefFile> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 51250b57528e670710e1ef9b24ef50c9 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESBasic_ExternalRefFile
entto: IGESBasic_ExternalRefFile
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESBasic_ExternalRefFile> & entfrom, const opencascade::handle<IGESBasic_ExternalRefFile> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 5c7d7002ffe53ffe0f8fd3d4588401ea ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a externalreffile <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESBasic_ExternalRefFile
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESBasic_ExternalRefFile> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: bf213094095a590b1a6fb22d26aa5ab6 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESBasic_ExternalRefFile
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESBasic_ExternalRefFile> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 8078d0f585231f3e0478c1405aeddeb7 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESBasic_ExternalRefFile
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESBasic_ExternalRefFile> & ent, IGESData_IGESWriter & IW);

};


%extend IGESBasic_ToolExternalRefFile {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class IGESBasic_ToolExternalRefFileIndex *
*******************************************/
class IGESBasic_ToolExternalRefFileIndex {
	public:
		/****************** IGESBasic_ToolExternalRefFileIndex ******************/
		/**** md5 signature: 946ce91cce20b613e40a639c66ee2c53 ****/
		%feature("compactdefaultargs") IGESBasic_ToolExternalRefFileIndex;
		%feature("autodoc", "Returns a toolexternalreffileindex, ready to work.

Returns
-------
None
") IGESBasic_ToolExternalRefFileIndex;
		 IGESBasic_ToolExternalRefFileIndex();

		/****************** DirChecker ******************/
		/**** md5 signature: daee90d9d45f937cdf727b4f1b941b66 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESBasic_ExternalRefFileIndex

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESBasic_ExternalRefFileIndex> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 3fae091175338a122670b24f6a1a6cc6 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESBasic_ExternalRefFileIndex
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESBasic_ExternalRefFileIndex> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 38f777a8784cd0f96205ee56f78c4cf8 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESBasic_ExternalRefFileIndex
entto: IGESBasic_ExternalRefFileIndex
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESBasic_ExternalRefFileIndex> & entfrom, const opencascade::handle<IGESBasic_ExternalRefFileIndex> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 4084862476dab7f495e63c2f03e9818d ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a externalreffileindex <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESBasic_ExternalRefFileIndex
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESBasic_ExternalRefFileIndex> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 3deff2945756bbb76e036155d2c83d69 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESBasic_ExternalRefFileIndex
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESBasic_ExternalRefFileIndex> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 603ccd44c276be243ec2404984acfff5 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESBasic_ExternalRefFileIndex
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESBasic_ExternalRefFileIndex> & ent, IGESData_IGESWriter & IW);

};


%extend IGESBasic_ToolExternalRefFileIndex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class IGESBasic_ToolExternalRefFileName *
******************************************/
class IGESBasic_ToolExternalRefFileName {
	public:
		/****************** IGESBasic_ToolExternalRefFileName ******************/
		/**** md5 signature: 438e116f295acaca2129a499392a1803 ****/
		%feature("compactdefaultargs") IGESBasic_ToolExternalRefFileName;
		%feature("autodoc", "Returns a toolexternalreffilename, ready to work.

Returns
-------
None
") IGESBasic_ToolExternalRefFileName;
		 IGESBasic_ToolExternalRefFileName();

		/****************** DirChecker ******************/
		/**** md5 signature: da59ae8b8b96c18287ec996ab6e3a0b5 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESBasic_ExternalRefFileName

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESBasic_ExternalRefFileName> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: f63ceb00d932a31661e11c7e4a9dc0b8 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESBasic_ExternalRefFileName
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESBasic_ExternalRefFileName> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 137acf7edf228c3c6b6817ea388d88d9 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESBasic_ExternalRefFileName
entto: IGESBasic_ExternalRefFileName
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESBasic_ExternalRefFileName> & entfrom, const opencascade::handle<IGESBasic_ExternalRefFileName> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 191708618b59218f6b805a372504cf53 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a externalreffilename <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESBasic_ExternalRefFileName
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESBasic_ExternalRefFileName> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 241fc0bba3ac9d9677c1f7922ed6cdea ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESBasic_ExternalRefFileName
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESBasic_ExternalRefFileName> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 71e30ef14f334b55ca2e4507182ce368 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESBasic_ExternalRefFileName
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESBasic_ExternalRefFileName> & ent, IGESData_IGESWriter & IW);

};


%extend IGESBasic_ToolExternalRefFileName {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class IGESBasic_ToolExternalRefLibName *
*****************************************/
class IGESBasic_ToolExternalRefLibName {
	public:
		/****************** IGESBasic_ToolExternalRefLibName ******************/
		/**** md5 signature: ef07c59406b45f10f4906e4f6463d78c ****/
		%feature("compactdefaultargs") IGESBasic_ToolExternalRefLibName;
		%feature("autodoc", "Returns a toolexternalreflibname, ready to work.

Returns
-------
None
") IGESBasic_ToolExternalRefLibName;
		 IGESBasic_ToolExternalRefLibName();

		/****************** DirChecker ******************/
		/**** md5 signature: 97892e8c53a2f2afe8cb8787f92e16a1 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESBasic_ExternalRefLibName

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESBasic_ExternalRefLibName> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: afeaf8e058fa4b922acb51f17809afd1 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESBasic_ExternalRefLibName
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESBasic_ExternalRefLibName> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: b1fc7f41030f5145541245bc3a33207b ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESBasic_ExternalRefLibName
entto: IGESBasic_ExternalRefLibName
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESBasic_ExternalRefLibName> & entfrom, const opencascade::handle<IGESBasic_ExternalRefLibName> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 0cdbf575421620d506bae9387de12579 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a externalreflibname <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESBasic_ExternalRefLibName
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESBasic_ExternalRefLibName> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 1a96e8ed7fb6267d50d822e7e1d0c4ed ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESBasic_ExternalRefLibName
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESBasic_ExternalRefLibName> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 6bcbb0bf6bbbed60ae031e92097161c5 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESBasic_ExternalRefLibName
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESBasic_ExternalRefLibName> & ent, IGESData_IGESWriter & IW);

};


%extend IGESBasic_ToolExternalRefLibName {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class IGESBasic_ToolExternalRefName *
**************************************/
class IGESBasic_ToolExternalRefName {
	public:
		/****************** IGESBasic_ToolExternalRefName ******************/
		/**** md5 signature: 82db06c746422bca5be8d798765036dd ****/
		%feature("compactdefaultargs") IGESBasic_ToolExternalRefName;
		%feature("autodoc", "Returns a toolexternalrefname, ready to work.

Returns
-------
None
") IGESBasic_ToolExternalRefName;
		 IGESBasic_ToolExternalRefName();

		/****************** DirChecker ******************/
		/**** md5 signature: 64f4ca6a2e4c1d2e38ef95c5d1b209ae ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESBasic_ExternalRefName

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESBasic_ExternalRefName> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 68d7efd8b665fe338a96e9e4747df852 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESBasic_ExternalRefName
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESBasic_ExternalRefName> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 9dc04b3d72417308458d8c89eb4a2f38 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESBasic_ExternalRefName
entto: IGESBasic_ExternalRefName
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESBasic_ExternalRefName> & entfrom, const opencascade::handle<IGESBasic_ExternalRefName> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 19a0fd12c608d56961b9ee253f2f4112 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a externalrefname <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESBasic_ExternalRefName
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESBasic_ExternalRefName> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: ace4a90f632e519453dee6d0b70cd682 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESBasic_ExternalRefName
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESBasic_ExternalRefName> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 55af76425ecf5265c4af90e38be5d117 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESBasic_ExternalRefName
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESBasic_ExternalRefName> & ent, IGESData_IGESWriter & IW);

};


%extend IGESBasic_ToolExternalRefName {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class IGESBasic_ToolExternalReferenceFile *
********************************************/
class IGESBasic_ToolExternalReferenceFile {
	public:
		/****************** IGESBasic_ToolExternalReferenceFile ******************/
		/**** md5 signature: 902951a708909b9cfa7f1dbc921354fc ****/
		%feature("compactdefaultargs") IGESBasic_ToolExternalReferenceFile;
		%feature("autodoc", "Returns a toolexternalreferencefile, ready to work.

Returns
-------
None
") IGESBasic_ToolExternalReferenceFile;
		 IGESBasic_ToolExternalReferenceFile();

		/****************** DirChecker ******************/
		/**** md5 signature: ff790cf072022fce749d9508044db4a1 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESBasic_ExternalReferenceFile

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESBasic_ExternalReferenceFile> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 2df3bdfd5736515afb0e291e1716fcb7 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESBasic_ExternalReferenceFile
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESBasic_ExternalReferenceFile> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 918900990b6a231d4b21a1b8dc37b101 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESBasic_ExternalReferenceFile
entto: IGESBasic_ExternalReferenceFile
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESBasic_ExternalReferenceFile> & entfrom, const opencascade::handle<IGESBasic_ExternalReferenceFile> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 0dd41641c30391ca315f5b9841a5f2cd ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a externalreferencefile <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESBasic_ExternalReferenceFile
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESBasic_ExternalReferenceFile> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: fbe335794e694234b2c49fd31f999c7e ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESBasic_ExternalReferenceFile
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESBasic_ExternalReferenceFile> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: ea2e8a1af5f1f6602a1cf8385c993250 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESBasic_ExternalReferenceFile
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESBasic_ExternalReferenceFile> & ent, IGESData_IGESWriter & IW);

};


%extend IGESBasic_ToolExternalReferenceFile {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class IGESBasic_ToolGroup *
****************************/
class IGESBasic_ToolGroup {
	public:
		/****************** IGESBasic_ToolGroup ******************/
		/**** md5 signature: 00854b2050850fdd87a35c52a04d0cbc ****/
		%feature("compactdefaultargs") IGESBasic_ToolGroup;
		%feature("autodoc", "Returns a toolgroup, ready to work.

Returns
-------
None
") IGESBasic_ToolGroup;
		 IGESBasic_ToolGroup();

		/****************** DirChecker ******************/
		/**** md5 signature: ac4b037db2477ca18e5ee261eee2a661 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESBasic_Group

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESBasic_Group> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: ce1064a2a6cc547b0133b2c5db0a149c ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESBasic_Group
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESBasic_Group> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: a898b0ad8ab70df4a1080503a93c62ca ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESBasic_Group
entto: IGESBasic_Group
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESBasic_Group> & entfrom, const opencascade::handle<IGESBasic_Group> & entto, Interface_CopyTool & TC);

		/****************** OwnCorrect ******************/
		/**** md5 signature: ed1de160dcc120afacf0ee06dd1da042 ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Sets automatic unambiguous correction on a group (null elements are removed from list).

Parameters
----------
ent: IGESBasic_Group

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect(const opencascade::handle<IGESBasic_Group> & ent);

		/****************** OwnShared ******************/
		/**** md5 signature: eb149d530e0e4da17b4a721692492da5 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a group <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESBasic_Group
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESBasic_Group> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 58a7c1e59f0b3d2eb7284c0300c9f1f0 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESBasic_Group
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESBasic_Group> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 3fa909da3f93202be38370744a83bf85 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESBasic_Group
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESBasic_Group> & ent, IGESData_IGESWriter & IW);

};


%extend IGESBasic_ToolGroup {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class IGESBasic_ToolGroupWithoutBackP *
****************************************/
class IGESBasic_ToolGroupWithoutBackP {
	public:
		/****************** IGESBasic_ToolGroupWithoutBackP ******************/
		/**** md5 signature: b62fb2d5a551ff00f23249fc64b5df3e ****/
		%feature("compactdefaultargs") IGESBasic_ToolGroupWithoutBackP;
		%feature("autodoc", "Returns a toolgroupwithoutbackp, ready to work.

Returns
-------
None
") IGESBasic_ToolGroupWithoutBackP;
		 IGESBasic_ToolGroupWithoutBackP();

		/****************** DirChecker ******************/
		/**** md5 signature: f51aa491a2ba833538edd1fa9ca6e78e ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESBasic_GroupWithoutBackP

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESBasic_GroupWithoutBackP> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 43ec99d735dd53712e760452b2c7afec ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESBasic_GroupWithoutBackP
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESBasic_GroupWithoutBackP> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 8fc890c1e693bd0594da375b637bdfae ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESBasic_GroupWithoutBackP
entto: IGESBasic_GroupWithoutBackP
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESBasic_GroupWithoutBackP> & entfrom, const opencascade::handle<IGESBasic_GroupWithoutBackP> & entto, Interface_CopyTool & TC);

		/****************** OwnCorrect ******************/
		/**** md5 signature: 0499e2a9d658c6e83756defcc86a8e34 ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Sets automatic unambiguous correction on a groupwithoutbackp (null elements are removed from list).

Parameters
----------
ent: IGESBasic_GroupWithoutBackP

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect(const opencascade::handle<IGESBasic_GroupWithoutBackP> & ent);

		/****************** OwnShared ******************/
		/**** md5 signature: f83d94671760d17fb585fbcaced7f138 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a groupwithoutbackp <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESBasic_GroupWithoutBackP
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESBasic_GroupWithoutBackP> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 2881ec6c0423182e4f3baee76f45a21a ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESBasic_GroupWithoutBackP
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESBasic_GroupWithoutBackP> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 5485d58d25f67ce2251fc6b63013ed31 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESBasic_GroupWithoutBackP
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESBasic_GroupWithoutBackP> & ent, IGESData_IGESWriter & IW);

};


%extend IGESBasic_ToolGroupWithoutBackP {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class IGESBasic_ToolHierarchy *
********************************/
class IGESBasic_ToolHierarchy {
	public:
		/****************** IGESBasic_ToolHierarchy ******************/
		/**** md5 signature: 6afb3f2300c8c8d09fcb53147962f0c1 ****/
		%feature("compactdefaultargs") IGESBasic_ToolHierarchy;
		%feature("autodoc", "Returns a toolhierarchy, ready to work.

Returns
-------
None
") IGESBasic_ToolHierarchy;
		 IGESBasic_ToolHierarchy();

		/****************** DirChecker ******************/
		/**** md5 signature: 07240214a598db9b12cdc88aeacac129 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESBasic_Hierarchy

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESBasic_Hierarchy> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 32705de258bf0c2e63c5520708a8c5d1 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESBasic_Hierarchy
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESBasic_Hierarchy> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 7fbd2347f973242fa45a0b4bc0914243 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESBasic_Hierarchy
entto: IGESBasic_Hierarchy
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESBasic_Hierarchy> & entfrom, const opencascade::handle<IGESBasic_Hierarchy> & entto, Interface_CopyTool & TC);

		/****************** OwnCorrect ******************/
		/**** md5 signature: a2e19448ae1d29d9930ceb704264e37b ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Sets automatic unambiguous correction on a hierarchy (nbpropertyvalues forced to 6).

Parameters
----------
ent: IGESBasic_Hierarchy

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect(const opencascade::handle<IGESBasic_Hierarchy> & ent);

		/****************** OwnShared ******************/
		/**** md5 signature: 999e661dbb9b9960e3132c3a5d30dfd9 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a hierarchy <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESBasic_Hierarchy
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESBasic_Hierarchy> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 42dcecc585a0d786f88571ef6bdaf8b6 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESBasic_Hierarchy
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESBasic_Hierarchy> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 80ab1ed6334ed3579a6fdaf8377d7214 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESBasic_Hierarchy
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESBasic_Hierarchy> & ent, IGESData_IGESWriter & IW);

};


%extend IGESBasic_ToolHierarchy {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class IGESBasic_ToolName *
***************************/
class IGESBasic_ToolName {
	public:
		/****************** IGESBasic_ToolName ******************/
		/**** md5 signature: 268d0c0d3af1c82d429269c7fed2424a ****/
		%feature("compactdefaultargs") IGESBasic_ToolName;
		%feature("autodoc", "Returns a toolname, ready to work.

Returns
-------
None
") IGESBasic_ToolName;
		 IGESBasic_ToolName();

		/****************** DirChecker ******************/
		/**** md5 signature: 63d74b76dff335308ad742049fe3446d ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESBasic_Name

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESBasic_Name> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 31353272bf9fd955ae4d440f9d68837d ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESBasic_Name
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESBasic_Name> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 96a522f79f21de0b338982eff0846b45 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESBasic_Name
entto: IGESBasic_Name
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESBasic_Name> & entfrom, const opencascade::handle<IGESBasic_Name> & entto, Interface_CopyTool & TC);

		/****************** OwnCorrect ******************/
		/**** md5 signature: 48c00ac152a38a7b5856f8048a4dc0ba ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Sets automatic unambiguous correction on a name (nbpropertyvalues forced to 1).

Parameters
----------
ent: IGESBasic_Name

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect(const opencascade::handle<IGESBasic_Name> & ent);

		/****************** OwnShared ******************/
		/**** md5 signature: ebccd4e31c5739294192bf649eeb9791 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a name <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESBasic_Name
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESBasic_Name> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: f10925268981bdb22201ac3b7ca0c46f ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESBasic_Name
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESBasic_Name> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 120c265d24f3318bac895fcabc46fc80 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESBasic_Name
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESBasic_Name> & ent, IGESData_IGESWriter & IW);

};


%extend IGESBasic_ToolName {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class IGESBasic_ToolOrderedGroup *
***********************************/
class IGESBasic_ToolOrderedGroup {
	public:
		/****************** IGESBasic_ToolOrderedGroup ******************/
		/**** md5 signature: 89e9fe4f1535c3c26efd4f3dc6b51810 ****/
		%feature("compactdefaultargs") IGESBasic_ToolOrderedGroup;
		%feature("autodoc", "Returns a toolorderedgroup, ready to work.

Returns
-------
None
") IGESBasic_ToolOrderedGroup;
		 IGESBasic_ToolOrderedGroup();

		/****************** DirChecker ******************/
		/**** md5 signature: acb771462a1fdc512cfe20c4e11978a6 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESBasic_OrderedGroup

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESBasic_OrderedGroup> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: f35a7d3ee9d39f7f2b5d544b9e2dc41e ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESBasic_OrderedGroup
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESBasic_OrderedGroup> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 83e1b37886a85791c5cebb2aa8181a8e ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESBasic_OrderedGroup
entto: IGESBasic_OrderedGroup
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESBasic_OrderedGroup> & entfrom, const opencascade::handle<IGESBasic_OrderedGroup> & entto, Interface_CopyTool & TC);

		/****************** OwnCorrect ******************/
		/**** md5 signature: cc978ca649b9804b923512a03fe13688 ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Sets automatic unambiguous correction on an orderedgroup (null elements are removed from list).

Parameters
----------
ent: IGESBasic_OrderedGroup

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect(const opencascade::handle<IGESBasic_OrderedGroup> & ent);

		/****************** OwnShared ******************/
		/**** md5 signature: f08cd6b4ee94b61f5cf204346a7ba67b ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a orderedgroup <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESBasic_OrderedGroup
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESBasic_OrderedGroup> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: a3e8aa00a5b43a4ea2191bcb8942cb4f ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESBasic_OrderedGroup
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESBasic_OrderedGroup> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: f9a7c6ac7cee2ff0a835d95aed2d0f0a ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESBasic_OrderedGroup
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESBasic_OrderedGroup> & ent, IGESData_IGESWriter & IW);

};


%extend IGESBasic_ToolOrderedGroup {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class IGESBasic_ToolOrderedGroupWithoutBackP *
***********************************************/
class IGESBasic_ToolOrderedGroupWithoutBackP {
	public:
		/****************** IGESBasic_ToolOrderedGroupWithoutBackP ******************/
		/**** md5 signature: 5d8304481620042df107af4063769fc7 ****/
		%feature("compactdefaultargs") IGESBasic_ToolOrderedGroupWithoutBackP;
		%feature("autodoc", "Returns a toolorderedgroupwithoutbackp, ready to work.

Returns
-------
None
") IGESBasic_ToolOrderedGroupWithoutBackP;
		 IGESBasic_ToolOrderedGroupWithoutBackP();

		/****************** DirChecker ******************/
		/**** md5 signature: 01283bb2c8b4e9b9e51fa325a3e89694 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESBasic_OrderedGroupWithoutBackP

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESBasic_OrderedGroupWithoutBackP> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: ab1bb932fc0b8046609c41e0fd5f3d19 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESBasic_OrderedGroupWithoutBackP
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESBasic_OrderedGroupWithoutBackP> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 888ef00cc8ffed2fe942857a19f7cc80 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESBasic_OrderedGroupWithoutBackP
entto: IGESBasic_OrderedGroupWithoutBackP
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESBasic_OrderedGroupWithoutBackP> & entfrom, const opencascade::handle<IGESBasic_OrderedGroupWithoutBackP> & entto, Interface_CopyTool & TC);

		/****************** OwnCorrect ******************/
		/**** md5 signature: 179be6369c3a68ca86d7a96068b5bf22 ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Sets automatic unambiguous correction on an orderedgroupwithoutbackp (null elements are removed from list).

Parameters
----------
ent: IGESBasic_OrderedGroupWithoutBackP

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect(const opencascade::handle<IGESBasic_OrderedGroupWithoutBackP> & ent);

		/****************** OwnShared ******************/
		/**** md5 signature: c385e4a2789c5199e8a9de65790371fe ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a orderedgroupwithoutbackp <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESBasic_OrderedGroupWithoutBackP
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESBasic_OrderedGroupWithoutBackP> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: e27d78ba44a42cf19252a747d37e76e1 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESBasic_OrderedGroupWithoutBackP
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESBasic_OrderedGroupWithoutBackP> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: d8e06694f0479ebbcb2c32d557ed4882 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESBasic_OrderedGroupWithoutBackP
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESBasic_OrderedGroupWithoutBackP> & ent, IGESData_IGESWriter & IW);

};


%extend IGESBasic_ToolOrderedGroupWithoutBackP {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class IGESBasic_ToolSingleParent *
***********************************/
class IGESBasic_ToolSingleParent {
	public:
		/****************** IGESBasic_ToolSingleParent ******************/
		/**** md5 signature: 652999d9d6bb30a4e7265e4d43e89c80 ****/
		%feature("compactdefaultargs") IGESBasic_ToolSingleParent;
		%feature("autodoc", "Returns a toolsingleparent, ready to work.

Returns
-------
None
") IGESBasic_ToolSingleParent;
		 IGESBasic_ToolSingleParent();

		/****************** DirChecker ******************/
		/**** md5 signature: bcdc51dc0456f12a71b46e9b06022d27 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESBasic_SingleParent

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESBasic_SingleParent> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: f61572ef0940cf610c5cfe8cc589f059 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESBasic_SingleParent
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESBasic_SingleParent> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: b7b20b7ae42e8c4e64e109ba3be23e18 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESBasic_SingleParent
entto: IGESBasic_SingleParent
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESBasic_SingleParent> & entfrom, const opencascade::handle<IGESBasic_SingleParent> & entto, Interface_CopyTool & TC);

		/****************** OwnCorrect ******************/
		/**** md5 signature: ff5b79035958777e074be1c26cfafb86 ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Sets automatic unambiguous correction on a singleparent (nbparents forced to 1).

Parameters
----------
ent: IGESBasic_SingleParent

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect(const opencascade::handle<IGESBasic_SingleParent> & ent);

		/****************** OwnShared ******************/
		/**** md5 signature: 7f96f91f17223df5b1468054a9a08a46 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a singleparent <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESBasic_SingleParent
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESBasic_SingleParent> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: a6fa49e4ea55c85f88f438f36eeafa1d ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESBasic_SingleParent
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESBasic_SingleParent> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: e0474bce5503c3d182e8e923565c8ce3 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESBasic_SingleParent
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESBasic_SingleParent> & ent, IGESData_IGESWriter & IW);

};


%extend IGESBasic_ToolSingleParent {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class IGESBasic_ToolSingularSubfigure *
****************************************/
class IGESBasic_ToolSingularSubfigure {
	public:
		/****************** IGESBasic_ToolSingularSubfigure ******************/
		/**** md5 signature: 59f9a4d1470578b2ae716d99e02e437b ****/
		%feature("compactdefaultargs") IGESBasic_ToolSingularSubfigure;
		%feature("autodoc", "Returns a toolsingularsubfigure, ready to work.

Returns
-------
None
") IGESBasic_ToolSingularSubfigure;
		 IGESBasic_ToolSingularSubfigure();

		/****************** DirChecker ******************/
		/**** md5 signature: 4faca676d54e9bc527cddc47a4611712 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESBasic_SingularSubfigure

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESBasic_SingularSubfigure> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 61bab8f44696463eefca6220326d37b1 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESBasic_SingularSubfigure
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESBasic_SingularSubfigure> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: c2eca44aeeeb19cb1297c2d8cacee942 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESBasic_SingularSubfigure
entto: IGESBasic_SingularSubfigure
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESBasic_SingularSubfigure> & entfrom, const opencascade::handle<IGESBasic_SingularSubfigure> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 77e9a91fad4f66b7f68f9c9d77bfd12f ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a singularsubfigure <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESBasic_SingularSubfigure
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESBasic_SingularSubfigure> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: dbba8fba06478169fab5cc8c4efab815 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESBasic_SingularSubfigure
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESBasic_SingularSubfigure> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: df45b6d438da9298ecc3129bef88207d ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESBasic_SingularSubfigure
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESBasic_SingularSubfigure> & ent, IGESData_IGESWriter & IW);

};


%extend IGESBasic_ToolSingularSubfigure {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class IGESBasic_ToolSubfigureDef *
***********************************/
class IGESBasic_ToolSubfigureDef {
	public:
		/****************** IGESBasic_ToolSubfigureDef ******************/
		/**** md5 signature: 5a41ecc6b5de788497937f8bfd120ecd ****/
		%feature("compactdefaultargs") IGESBasic_ToolSubfigureDef;
		%feature("autodoc", "Returns a toolsubfiguredef, ready to work.

Returns
-------
None
") IGESBasic_ToolSubfigureDef;
		 IGESBasic_ToolSubfigureDef();

		/****************** DirChecker ******************/
		/**** md5 signature: 9bd1aef741be2318dda5cfb0b813b80a ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESBasic_SubfigureDef

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESBasic_SubfigureDef> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: f13312e208bcbf0c3ff3b1f61548f437 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESBasic_SubfigureDef
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESBasic_SubfigureDef> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 103b14efc591f846354201a4c7cddf0e ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESBasic_SubfigureDef
entto: IGESBasic_SubfigureDef
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESBasic_SubfigureDef> & entfrom, const opencascade::handle<IGESBasic_SubfigureDef> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 9a06f4fecd287cb58e34a378bd249796 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a subfiguredef <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESBasic_SubfigureDef
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESBasic_SubfigureDef> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 3e4c7b972c602279b9f6663217f51f66 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESBasic_SubfigureDef
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESBasic_SubfigureDef> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 79feed72c51f48e949b46e98abd19cf9 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESBasic_SubfigureDef
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESBasic_SubfigureDef> & ent, IGESData_IGESWriter & IW);

};


%extend IGESBasic_ToolSubfigureDef {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class IGESBasic_GroupWithoutBackP *
************************************/
class IGESBasic_GroupWithoutBackP : public IGESBasic_Group {
	public:
		/****************** IGESBasic_GroupWithoutBackP ******************/
		/**** md5 signature: 476abec47901f785e07bcee0607741d0 ****/
		%feature("compactdefaultargs") IGESBasic_GroupWithoutBackP;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESBasic_GroupWithoutBackP;
		 IGESBasic_GroupWithoutBackP();

};


%make_alias(IGESBasic_GroupWithoutBackP)

%extend IGESBasic_GroupWithoutBackP {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class IGESBasic_OrderedGroup *
*******************************/
class IGESBasic_OrderedGroup : public IGESBasic_Group {
	public:
		/****************** IGESBasic_OrderedGroup ******************/
		/**** md5 signature: ad0accdd1f3836b69e86e66cb80b4c02 ****/
		%feature("compactdefaultargs") IGESBasic_OrderedGroup;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESBasic_OrderedGroup;
		 IGESBasic_OrderedGroup();

};


%make_alias(IGESBasic_OrderedGroup)

%extend IGESBasic_OrderedGroup {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class IGESBasic_OrderedGroupWithoutBackP *
*******************************************/
class IGESBasic_OrderedGroupWithoutBackP : public IGESBasic_Group {
	public:
		/****************** IGESBasic_OrderedGroupWithoutBackP ******************/
		/**** md5 signature: 960bf00664b3bf12d27eaafb2686eafc ****/
		%feature("compactdefaultargs") IGESBasic_OrderedGroupWithoutBackP;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESBasic_OrderedGroupWithoutBackP;
		 IGESBasic_OrderedGroupWithoutBackP();

};


%make_alias(IGESBasic_OrderedGroupWithoutBackP)

%extend IGESBasic_OrderedGroupWithoutBackP {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */

class IGESBasic_HArray1OfLineFontEntity : public IGESBasic_Array1OfLineFontEntity, public Standard_Transient {
  public:
    IGESBasic_HArray1OfLineFontEntity(const Standard_Integer theLower, const Standard_Integer theUpper);
    IGESBasic_HArray1OfLineFontEntity(const Standard_Integer theLower, const Standard_Integer theUpper, const IGESBasic_Array1OfLineFontEntity::value_type& theValue);
    IGESBasic_HArray1OfLineFontEntity(const IGESBasic_Array1OfLineFontEntity& theOther);
    const IGESBasic_Array1OfLineFontEntity& Array1();
    IGESBasic_Array1OfLineFontEntity& ChangeArray1();
};
%make_alias(IGESBasic_HArray1OfLineFontEntity)

/* harray2 classes */
class IGESBasic_HArray2OfHArray1OfReal : public IGESBasic_Array2OfHArray1OfReal, public Standard_Transient {
  public:
    IGESBasic_HArray2OfHArray1OfReal(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    IGESBasic_HArray2OfHArray1OfReal(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const IGESBasic_Array2OfHArray1OfReal::value_type& theValue);
    IGESBasic_HArray2OfHArray1OfReal(const IGESBasic_Array2OfHArray1OfReal& theOther);
    const IGESBasic_Array2OfHArray1OfReal& Array2 ();
    IGESBasic_Array2OfHArray1OfReal& ChangeArray2 (); 
};
%make_alias(IGESBasic_HArray2OfHArray1OfReal)


/* hsequence classes */
/* class aliases */
%pythoncode {
}
