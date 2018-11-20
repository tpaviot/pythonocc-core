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
%define BINMNAMINGDOCSTRING
"Storage/Retrieval drivers for TNaming attributes
"
%enddef
%module (package="OCC.Core", docstring=BINMNAMINGDOCSTRING) BinMNaming

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
%include ../common/OccHandle.i


%include BinMNaming_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%wrap_handle(BinMNaming_NamedShapeDriver)
%wrap_handle(BinMNaming_NamingDriver)

%rename(binmnaming) BinMNaming;
class BinMNaming {
	public:
		%feature("compactdefaultargs") AddDrivers;
		%feature("autodoc", "	* Adds the attribute drivers to <theDriverTable>.

	:param theDriverTable:
	:type theDriverTable: Handle_BinMDF_ADriverTable &
	:param aMsgDrv:
	:type aMsgDrv: Handle_CDM_MessageDriver &
	:rtype: void
") AddDrivers;
		static void AddDrivers (const Handle_BinMDF_ADriverTable & theDriverTable,const Handle_CDM_MessageDriver & aMsgDrv);
		%feature("compactdefaultargs") SetDocumentVersion;
		%feature("autodoc", "	:param DocVersion:
	:type DocVersion: int
	:rtype: void
") SetDocumentVersion;
		static void SetDocumentVersion (const Standard_Integer DocVersion);
		%feature("compactdefaultargs") DocumentVersion;
		%feature("autodoc", "	:rtype: int
") DocumentVersion;
		static Standard_Integer DocumentVersion ();
};


%extend BinMNaming {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMNaming_NamedShapeDriver;
class BinMNaming_NamedShapeDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMNaming_NamedShapeDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMNaming_NamedShapeDriver;
		 BinMNaming_NamedShapeDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);

        %feature("autodoc", "1");
        %extend{
            void ReadShapeSectionFromString(std::string src) {
            std::stringstream s(src);
            self->ReadShapeSection(s);}
        };
        
        %feature("autodoc", "1");
        %extend{
            std::string WriteShapeSectionToString() {
            std::stringstream s;
            self->WriteShapeSection(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clear myShapeSet

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") SetWithTriangles;
		%feature("autodoc", "	* set whether to store triangulation

	:param isWithTriangles:
	:type isWithTriangles: bool
	:rtype: None
") SetWithTriangles;
		void SetWithTriangles (const Standard_Boolean isWithTriangles);
		%feature("compactdefaultargs") SetFormatNb;
		%feature("autodoc", "	* set the format of topology First : does not write CurveOnSurface UV Points into the file on reading calls Check() method. Second: stores CurveOnSurface UV Points.

	:param theFormat:
	:type theFormat: int
	:rtype: None
") SetFormatNb;
		void SetFormatNb (const Standard_Integer theFormat);
		%feature("compactdefaultargs") GetFormatNb;
		%feature("autodoc", "	* get the format of topology

	:rtype: int
") GetFormatNb;
		Standard_Integer GetFormatNb ();
		%feature("compactdefaultargs") GetShapesLocations;
		%feature("autodoc", "	* get the format of topology

	:rtype: BinTools_LocationSet
") GetShapesLocations;
		BinTools_LocationSet & GetShapesLocations ();
};


%make_alias(BinMNaming_NamedShapeDriver)

%extend BinMNaming_NamedShapeDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMNaming_NamingDriver;
class BinMNaming_NamingDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMNaming_NamingDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMNaming_NamingDriver;
		 BinMNaming_NamingDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%make_alias(BinMNaming_NamingDriver)

%extend BinMNaming_NamingDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
