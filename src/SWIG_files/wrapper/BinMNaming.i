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
%define BINMNAMINGDOCSTRING
"BinMNaming module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_binmnaming.html"
%enddef
%module (package="OCC.Core", docstring=BINMNAMINGDOCSTRING) BinMNaming


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
#include<BinMNaming_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<BinMDF_module.hxx>
#include<Message_module.hxx>
#include<BinTools_module.hxx>
#include<TDF_module.hxx>
#include<BinObjMgt_module.hxx>
#include<Resource_module.hxx>
#include<Geom_module.hxx>
#include<TopoDS_module.hxx>
#include<Geom2d_module.hxx>
#include<Message_module.hxx>
#include<TopLoc_module.hxx>
#include<TDF_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import BinMDF.i
%import Message.i
%import BinTools.i
%import TDF.i
%import BinObjMgt.i

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
/* end typedefs declaration */

/*******************
* class BinMNaming *
*******************/
%rename(binmnaming) BinMNaming;
class BinMNaming {
	public:
		/****** BinMNaming::AddDrivers ******/
		/****** md5 signature: 3b175e0207523895c819eaf3e413231f ******/
		%feature("compactdefaultargs") AddDrivers;
		%feature("autodoc", "
Parameters
----------
theDriverTable: BinMDF_ADriverTable
aMsgDrv: Message_Messenger

Return
-------
None

Description
-----------
Adds the attribute drivers to <theDriverTable>.
") AddDrivers;
		static void AddDrivers(const opencascade::handle<BinMDF_ADriverTable> & theDriverTable, const opencascade::handle<Message_Messenger> & aMsgDrv);

};


%extend BinMNaming {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class BinMNaming_NamedShapeDriver *
************************************/
class BinMNaming_NamedShapeDriver : public BinMDF_ADriver {
	public:
		/****** BinMNaming_NamedShapeDriver::BinMNaming_NamedShapeDriver ******/
		/****** md5 signature: 3b7497ac148acc93869b3866b0dc9ece ******/
		%feature("compactdefaultargs") BinMNaming_NamedShapeDriver;
		%feature("autodoc", "
Parameters
----------
theMessageDriver: Message_Messenger

Return
-------
None

Description
-----------
No available documentation.
") BinMNaming_NamedShapeDriver;
		 BinMNaming_NamedShapeDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****** BinMNaming_NamedShapeDriver::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clear myShapeSet.
") Clear;
		void Clear();

		/****** BinMNaming_NamedShapeDriver::EnableQuickPart ******/
		/****** md5 signature: cff8daf566931bac50f3d6a6968f58f3 ******/
		%feature("compactdefaultargs") EnableQuickPart;
		%feature("autodoc", "
Parameters
----------
theValue: bool

Return
-------
None

Description
-----------
Sets the flag for quick part of the document access: shapes are stored in the attribute.
") EnableQuickPart;
		void EnableQuickPart(const bool theValue);

		/****** BinMNaming_NamedShapeDriver::GetShapesLocations ******/
		/****** md5 signature: 9cd92ab397d1145dc380f0edef6fc008 ******/
		%feature("compactdefaultargs") GetShapesLocations;
		%feature("autodoc", "Return
-------
BinTools_LocationSet

Description
-----------
get the shapes locations.
") GetShapesLocations;
		BinTools_LocationSet & GetShapesLocations();

		/****** BinMNaming_NamedShapeDriver::IsQuickPart ******/
		/****** md5 signature: 85436ada30cec841c30b7474e7ea2432 ******/
		%feature("compactdefaultargs") IsQuickPart;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if quick part of the document access is enabled: shapes are stored in the attribute.
") IsQuickPart;
		bool IsQuickPart();

		/****** BinMNaming_NamedShapeDriver::IsWithNormals ******/
		/****** md5 signature: c7acafa16493860e7c0a6bd60edea61c ******/
		%feature("compactdefaultargs") IsWithNormals;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if shape should be stored with triangulation normals.
") IsWithNormals;
		bool IsWithNormals();

		/****** BinMNaming_NamedShapeDriver::IsWithTriangles ******/
		/****** md5 signature: c31685fbc77b7c6389330903a3a6386f ******/
		%feature("compactdefaultargs") IsWithTriangles;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if shape should be stored with triangles.
") IsWithTriangles;
		bool IsWithTriangles();

		/****** BinMNaming_NamedShapeDriver::NewEmpty ******/
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** BinMNaming_NamedShapeDriver::Paste ******/
		/****** md5 signature: 32b49ae1c49643472e4ce889e46d08ee ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Source: BinObjMgt_Persistent
Target: TDF_Attribute
RelocTable: BinObjMgt_RRelocationTable

Return
-------
bool

Description
-----------
No available documentation.
") Paste;
		bool Paste(const BinObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, BinObjMgt_RRelocationTable & RelocTable);

		/****** BinMNaming_NamedShapeDriver::Paste ******/
		/****** md5 signature: b4a5612f14dec93753f599f4c4e34fd2 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Source: TDF_Attribute
Target: BinObjMgt_Persistent
RelocTable: Standard_Transient

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Source, BinObjMgt_Persistent & Target, NCollection_IndexedMap<opencascade::handle<Standard_Transient> > & RelocTable);

		/****** BinMNaming_NamedShapeDriver::ReadShapeSection ******/
		/****** md5 signature: 66ff232ed5a17a346bcdcc9d0bc2b9ce ******/
		%feature("compactdefaultargs") ReadShapeSection;
		%feature("autodoc", "
Parameters
----------
theIS: str
therange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Input the shapes from Bin Document file.
") ReadShapeSection;
		void ReadShapeSection(std::istream & theIS, const Message_ProgressRange & therange = Message_ProgressRange());

		/****** BinMNaming_NamedShapeDriver::SetWithNormals ******/
		/****** md5 signature: f753ea1b0e287bd47e93689a525c8e1c ******/
		%feature("compactdefaultargs") SetWithNormals;
		%feature("autodoc", "
Parameters
----------
isWithNormals: bool

Return
-------
None

Description
-----------
set whether to store triangulation with normals.
") SetWithNormals;
		void SetWithNormals(const bool isWithNormals);

		/****** BinMNaming_NamedShapeDriver::SetWithTriangles ******/
		/****** md5 signature: 64e820aad64183816e5114241e674dee ******/
		%feature("compactdefaultargs") SetWithTriangles;
		%feature("autodoc", "
Parameters
----------
isWithTriangles: bool

Return
-------
None

Description
-----------
set whether to store triangulation.
") SetWithTriangles;
		void SetWithTriangles(const bool isWithTriangles);

		/****** BinMNaming_NamedShapeDriver::ShapeSet ******/
		/****** md5 signature: 0ed32d25c76a8e76b5ff3ece21168b74 ******/
		%feature("compactdefaultargs") ShapeSet;
		%feature("autodoc", "
Parameters
----------
theReading: bool

Return
-------
BinTools_ShapeSetBase *

Description
-----------
Returns shape-set of the needed type.
") ShapeSet;
		BinTools_ShapeSetBase * ShapeSet(const bool theReading);

		/****** BinMNaming_NamedShapeDriver::WriteShapeSection ******/
		/****** md5 signature: e7b292a4026c959ca29570f54bc1b032 ******/
		%feature("compactdefaultargs") WriteShapeSection;
		%feature("autodoc", "
Parameters
----------
theDocVer: int
therange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
theOS: Standard_OStream

Description
-----------
Output the shapes into Bin Document file.
") WriteShapeSection;
		void WriteShapeSection(std::ostream &OutValue, const int theDocVer, const Message_ProgressRange & therange = Message_ProgressRange());

};


%extend BinMNaming_NamedShapeDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class BinMNaming_NamingDriver *
********************************/
class BinMNaming_NamingDriver : public BinMDF_ADriver {
	public:
		/****** BinMNaming_NamingDriver::BinMNaming_NamingDriver ******/
		/****** md5 signature: 66ad4fbcadd530e903526cb2d9a97e31 ******/
		%feature("compactdefaultargs") BinMNaming_NamingDriver;
		%feature("autodoc", "
Parameters
----------
theMessageDriver: Message_Messenger

Return
-------
None

Description
-----------
No available documentation.
") BinMNaming_NamingDriver;
		 BinMNaming_NamingDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****** BinMNaming_NamingDriver::NewEmpty ******/
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** BinMNaming_NamingDriver::Paste ******/
		/****** md5 signature: 32b49ae1c49643472e4ce889e46d08ee ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Source: BinObjMgt_Persistent
Target: TDF_Attribute
RelocTable: BinObjMgt_RRelocationTable

Return
-------
bool

Description
-----------
No available documentation.
") Paste;
		bool Paste(const BinObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, BinObjMgt_RRelocationTable & RelocTable);

		/****** BinMNaming_NamingDriver::Paste ******/
		/****** md5 signature: b4a5612f14dec93753f599f4c4e34fd2 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Source: TDF_Attribute
Target: BinObjMgt_Persistent
RelocTable: Standard_Transient

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Source, BinObjMgt_Persistent & Target, NCollection_IndexedMap<opencascade::handle<Standard_Transient> > & RelocTable);

};


%extend BinMNaming_NamingDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def binmnaming_AddDrivers(*args):
	return binmnaming.AddDrivers(*args)

}
