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
%define BINMNAMINGDOCSTRING
"BinMNaming module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_binmnaming.html"
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
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proy classes for enums */
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
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clear myshapeset.

Returns
-------
None
") Clear;
		void Clear();

		/****************** GetFormatNb ******************/
		%feature("compactdefaultargs") GetFormatNb;
		%feature("autodoc", "Get the format of topology.

Returns
-------
int
") GetFormatNb;
		Standard_Integer GetFormatNb();

		/****************** GetShapesLocations ******************/
		%feature("compactdefaultargs") GetShapesLocations;
		%feature("autodoc", "Get the format of topology.

Returns
-------
BinTools_LocationSet
") GetShapesLocations;
		BinTools_LocationSet & GetShapesLocations();

		/****************** IsWithTriangles ******************/
		%feature("compactdefaultargs") IsWithTriangles;
		%feature("autodoc", "Return true if shape should be stored with triangles.

Returns
-------
bool
") IsWithTriangles;
		Standard_Boolean IsWithTriangles();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
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
		/****************** SetFormatNb ******************/
		%feature("compactdefaultargs") SetFormatNb;
		%feature("autodoc", "Set the format of topology first : does not write curveonsurface uv points into the file on reading calls check() method. second: stores curveonsurface uv points.

Parameters
----------
theFormat: int

Returns
-------
None
") SetFormatNb;
		void SetFormatNb(const Standard_Integer theFormat);

		/****************** SetWithTriangles ******************/
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


        %feature("autodoc", "1");
        %extend{
            std::string WriteShapeSectionToString() {
            std::stringstream s;
            self->WriteShapeSection(s);
            return s.str();}
        };
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
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
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
