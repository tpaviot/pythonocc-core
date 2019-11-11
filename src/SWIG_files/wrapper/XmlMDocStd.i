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

%define XMLMDOCSTDDOCSTRING
"XmlMDocStd module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_XmlMDocStd.html"
%enddef
%module (package="OCC.Core", docstring=XMLMDOCSTDDOCSTRING) XmlMDocStd

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


%include XmlMDocStd_headers.i

/* public enums */
/* end public enums declaration */

/* handles */
%wrap_handle(XmlMDocStd_XLinkDriver)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

%rename(xmlmdocstd) XmlMDocStd;
class XmlMDocStd {
	public:
		%feature("compactdefaultargs") AddDrivers;
		%feature("autodoc", "	* Adds the attribute drivers to <aDriverTable>.

	:param aDriverTable:
	:type aDriverTable: opencascade::handle<XmlMDF_ADriverTable> &
	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: void
") AddDrivers;
		static void AddDrivers (const opencascade::handle<XmlMDF_ADriverTable> & aDriverTable,const opencascade::handle<Message_Messenger> & theMessageDriver);
};


%extend XmlMDocStd {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDocStd_XLinkDriver;
class XmlMDocStd_XLinkDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: XmlObjMgt_Persistent &
	:param Target:
	:type Target: opencascade::handle<TDF_Attribute> &
	:param RelocTable:
	:type RelocTable: XmlObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const XmlObjMgt_Persistent & Source,const opencascade::handle<TDF_Attribute> & Target,XmlObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: opencascade::handle<TDF_Attribute> &
	:param Target:
	:type Target: XmlObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: XmlObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & Source,XmlObjMgt_Persistent & Target,XmlObjMgt_SRelocationTable & RelocTable);
		%feature("compactdefaultargs") XmlMDocStd_XLinkDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMDocStd_XLinkDriver;
		 XmlMDocStd_XLinkDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
};


%make_alias(XmlMDocStd_XLinkDriver)

%extend XmlMDocStd_XLinkDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
