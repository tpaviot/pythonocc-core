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

/*
This file was automatically generated using the pythonocc_generator, see
https://github.com/tpaviot/pythonocc-generator.

This file is platform independant, but was generated under the following
conditions:

- operating system : debian Linux 4.15.0-66-generic
- occt version targeted : 7.4.0
*/

%define BINMNAMINGDOCSTRING
"No docstring provided."
%enddef
%module (package="OCC.Core", docstring=BINMNAMINGDOCSTRING) BinMNaming

#pragma SWIG nowarn=504,325,503,520,350,351,383,389,394,395, 404

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

/* public enums */
/* end public enums declaration */

/* handles */
%wrap_handle(BinMNaming_NamedShapeDriver)
%wrap_handle(BinMNaming_NamingDriver)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

%rename(binmnaming) BinMNaming;
class BinMNaming {
	public:
		%feature("compactdefaultargs") AddDrivers;
		%feature("autodoc", "	* Adds the attribute drivers to <theDriverTable>.

	:param theDriverTable:
	:type theDriverTable: opencascade::handle<BinMDF_ADriverTable> &
	:param aMsgDrv:
	:type aMsgDrv: opencascade::handle<Message_Messenger> &
	:rtype: void
") AddDrivers;
		static void AddDrivers (const opencascade::handle<BinMDF_ADriverTable> & theDriverTable,const opencascade::handle<Message_Messenger> & aMsgDrv);
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
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") BinMNaming_NamedShapeDriver;
		 BinMNaming_NamedShapeDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clear myShapeSet

	:rtype: None
") Clear;
		void Clear ();
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
		%feature("compactdefaultargs") IsWithTriangles;
		%feature("autodoc", "	* Return true if shape should be stored with triangles.

	:rtype: bool
") IsWithTriangles;
		Standard_Boolean IsWithTriangles ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: opencascade::handle<TDF_Attribute> &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const opencascade::handle<TDF_Attribute> & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: opencascade::handle<TDF_Attribute> &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);

        %feature("autodoc", "1");
        %extend{
            void ReadShapeSectionFromString(std::string src) {
            std::stringstream s(src);
            self->ReadShapeSection(s);}
        };
        		%feature("compactdefaultargs") SetFormatNb;
		%feature("autodoc", "	* set the format of topology First : does not write CurveOnSurface UV Points into the file on reading calls Check() method. Second: stores CurveOnSurface UV Points.

	:param theFormat:
	:type theFormat: int
	:rtype: None
") SetFormatNb;
		void SetFormatNb (const Standard_Integer theFormat);
		%feature("compactdefaultargs") SetWithTriangles;
		%feature("autodoc", "	* set whether to store triangulation

	:param isWithTriangles:
	:type isWithTriangles: bool
	:rtype: None
") SetWithTriangles;
		void SetWithTriangles (const Standard_Boolean isWithTriangles);

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
%nodefaultctor BinMNaming_NamingDriver;
class BinMNaming_NamingDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMNaming_NamingDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") BinMNaming_NamingDriver;
		 BinMNaming_NamingDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: opencascade::handle<TDF_Attribute> &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const opencascade::handle<TDF_Attribute> & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: opencascade::handle<TDF_Attribute> &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%make_alias(BinMNaming_NamingDriver)

%extend BinMNaming_NamingDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
