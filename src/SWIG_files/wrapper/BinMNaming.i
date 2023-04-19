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
%define BINMNAMINGDOCSTRING
"BinMNaming module, see official documentation at
https://www.opencascade.com/doc/occt-7.6.0/refman/html/package_binmnaming.html"
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
%wrap_handle(BinMNaming_NamedShapeDriver)
%wrap_handle(BinMNaming_NamingDriver)
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
		/****************** AddDrivers ******************/
		/**** md5 signature: 3b175e0207523895c819eaf3e413231f ****/
		%feature("compactdefaultargs") AddDrivers;
		%feature("autodoc", "Adds the attribute drivers to <thedrivertable>.

Parameters
----------
theDriverTable: BinMDF_ADriverTable
aMsgDrv: Message_Messenger

Returns
-------
None
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
		/****************** BinMNaming_NamedShapeDriver ******************/
		/**** md5 signature: 3b7497ac148acc93869b3866b0dc9ece ****/
		%feature("compactdefaultargs") BinMNaming_NamedShapeDriver;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMessageDriver: Message_Messenger

Returns
-------
None
") BinMNaming_NamedShapeDriver;
		 BinMNaming_NamedShapeDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clear myshapeset.

Returns
-------
None
") Clear;
		void Clear();

		/****************** EnableQuickPart ******************/
		/**** md5 signature: cec3cd0b4a2a26b64dabfcaa2c58ee1c ****/
		%feature("compactdefaultargs") EnableQuickPart;
		%feature("autodoc", "Sets the flag for quick part of the document access: shapes are stored in the attribute.

Parameters
----------
theValue: bool

Returns
-------
None
") EnableQuickPart;
		void EnableQuickPart(const Standard_Boolean theValue);

		/****************** GetShapesLocations ******************/
		/**** md5 signature: 9cd92ab397d1145dc380f0edef6fc008 ****/
		%feature("compactdefaultargs") GetShapesLocations;
		%feature("autodoc", "Get the shapes locations.

Returns
-------
BinTools_LocationSet
") GetShapesLocations;
		BinTools_LocationSet & GetShapesLocations();

		/****************** IsQuickPart ******************/
		/**** md5 signature: 1b93209c8c5b5efc320465bf731b4acb ****/
		%feature("compactdefaultargs") IsQuickPart;
		%feature("autodoc", "Returns true if quick part of the document access is enabled: shapes are stored in the attribute.

Returns
-------
bool
") IsQuickPart;
		Standard_Boolean IsQuickPart();

		/****************** IsWithNormals ******************/
		/**** md5 signature: 49f5baecd893691e08f163fb559d8b06 ****/
		%feature("compactdefaultargs") IsWithNormals;
		%feature("autodoc", "Return true if shape should be stored with triangulation normals.

Returns
-------
bool
") IsWithNormals;
		Standard_Boolean IsWithNormals();

		/****************** IsWithTriangles ******************/
		/**** md5 signature: 2adacf1f8e5d4c926108b4db84751e9a ****/
		%feature("compactdefaultargs") IsWithTriangles;
		%feature("autodoc", "Return true if shape should be stored with triangles.

Returns
-------
bool
") IsWithTriangles;
		Standard_Boolean IsWithTriangles();

		/****************** NewEmpty ******************/
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: 3bca84cbb3164ee155cf7623ceb16244 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Source: BinObjMgt_Persistent
Target: TDF_Attribute
RelocTable: BinObjMgt_RRelocationTable

Returns
-------
bool
") Paste;
		Standard_Boolean Paste(const BinObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, BinObjMgt_RRelocationTable & RelocTable);

		/****************** Paste ******************/
		/**** md5 signature: 67b435110398ae49c79b33db64bbe228 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Source: TDF_Attribute
Target: BinObjMgt_Persistent
RelocTable: BinObjMgt_SRelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Source, BinObjMgt_Persistent & Target, BinObjMgt_SRelocationTable & RelocTable);


            %feature("autodoc", "1");
            %extend{
                void ReadShapeSectionFromString(std::string src) {
                std::stringstream s(src);
                self->ReadShapeSection(s);}
            };
		/****************** SetWithNormals ******************/
		/**** md5 signature: 2f7757cd59d0573f368c1b217c28b7f5 ****/
		%feature("compactdefaultargs") SetWithNormals;
		%feature("autodoc", "Set whether to store triangulation with normals.

Parameters
----------
isWithNormals: bool

Returns
-------
None
") SetWithNormals;
		void SetWithNormals(const Standard_Boolean isWithNormals);

		/****************** SetWithTriangles ******************/
		/**** md5 signature: ac168a6a3fad4f9bcc30c8362a1cf0c6 ****/
		%feature("compactdefaultargs") SetWithTriangles;
		%feature("autodoc", "Set whether to store triangulation.

Parameters
----------
isWithTriangles: bool

Returns
-------
None
") SetWithTriangles;
		void SetWithTriangles(const Standard_Boolean isWithTriangles);

		/****************** ShapeSet ******************/
		/**** md5 signature: 9b5007d7513ff5d1f7e764f2202870c2 ****/
		%feature("compactdefaultargs") ShapeSet;
		%feature("autodoc", "Returns shape-set of the needed type.

Parameters
----------
theReading: bool

Returns
-------
BinTools_ShapeSetBase *
") ShapeSet;
		BinTools_ShapeSetBase * ShapeSet(const Standard_Boolean theReading);

};


%make_alias(BinMNaming_NamedShapeDriver)

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
		/****************** BinMNaming_NamingDriver ******************/
		/**** md5 signature: 66ad4fbcadd530e903526cb2d9a97e31 ****/
		%feature("compactdefaultargs") BinMNaming_NamingDriver;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMessageDriver: Message_Messenger

Returns
-------
None
") BinMNaming_NamingDriver;
		 BinMNaming_NamingDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****************** NewEmpty ******************/
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: 3bca84cbb3164ee155cf7623ceb16244 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Source: BinObjMgt_Persistent
Target: TDF_Attribute
RelocTable: BinObjMgt_RRelocationTable

Returns
-------
bool
") Paste;
		Standard_Boolean Paste(const BinObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, BinObjMgt_RRelocationTable & RelocTable);

		/****************** Paste ******************/
		/**** md5 signature: 67b435110398ae49c79b33db64bbe228 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Source: TDF_Attribute
Target: BinObjMgt_Persistent
RelocTable: BinObjMgt_SRelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Source, BinObjMgt_Persistent & Target, BinObjMgt_SRelocationTable & RelocTable);

};


%make_alias(BinMNaming_NamingDriver)

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
