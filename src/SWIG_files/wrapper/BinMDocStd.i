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

%define BINMDOCSTDDOCSTRING
"BinMDocStd module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_BinMDocStd.html"
%enddef
%module (package="OCC.Core", docstring=BINMDOCSTDDOCSTRING) BinMDocStd

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


%{
#include<BinMDocStd_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<BinMDF_module.hxx>
#include<Message_module.hxx>
#include<TDF_module.hxx>
#include<BinObjMgt_module.hxx>
#include<Resource_module.hxx>
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
%import TDF.i
%import BinObjMgt.i
/* public enums */
/* end public enums declaration */

/* handles */
%wrap_handle(BinMDocStd_XLinkDriver)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

%rename(binmdocstd) BinMDocStd;
class BinMDocStd {
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


%extend BinMDocStd {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDocStd_XLinkDriver;
class BinMDocStd_XLinkDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDocStd_XLinkDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") BinMDocStd_XLinkDriver;
		 BinMDocStd_XLinkDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: opencascade::handle<TDF_Attribute> &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const opencascade::handle<TDF_Attribute> & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: opencascade::handle<TDF_Attribute> &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const opencascade::handle<TDF_Attribute> & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%make_alias(BinMDocStd_XLinkDriver)

%extend BinMDocStd_XLinkDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
