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
%define BINMPRSSTDDOCSTRING
"
"
%enddef
%module (package="OCC.Core", docstring=BINMPRSSTDDOCSTRING) BinMPrsStd

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


%include BinMPrsStd_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%wrap_handle(BinMPrsStd_AISPresentationDriver)
%wrap_handle(BinMPrsStd_PositionDriver)

%rename(binmprsstd) BinMPrsStd;
class BinMPrsStd {
	public:
		%feature("compactdefaultargs") AddDrivers;
		%feature("autodoc", "	* Adds the attribute storage-retrieval driver to <theDriverTable>.

	:param theDriverTable:
	:type theDriverTable: Handle_BinMDF_ADriverTable &
	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: void
") AddDrivers;
		static void AddDrivers (const Handle_BinMDF_ADriverTable & theDriverTable,const Handle_CDM_MessageDriver & theMessageDriver);
};


%extend BinMPrsStd {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMPrsStd_AISPresentationDriver;
class BinMPrsStd_AISPresentationDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMPrsStd_AISPresentationDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMPrsStd_AISPresentationDriver;
		 BinMPrsStd_AISPresentationDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%make_alias(BinMPrsStd_AISPresentationDriver)

%extend BinMPrsStd_AISPresentationDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMPrsStd_PositionDriver;
class BinMPrsStd_PositionDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMPrsStd_PositionDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMPrsStd_PositionDriver;
		 BinMPrsStd_PositionDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%make_alias(BinMPrsStd_PositionDriver)

%extend BinMPrsStd_PositionDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
