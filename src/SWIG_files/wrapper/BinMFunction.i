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
%define BINMFUNCTIONDOCSTRING
"Storage and Retrieval drivers for TFunction modelling attributes.
"
%enddef
%module (package="OCC.Core", docstring=BINMFUNCTIONDOCSTRING) BinMFunction

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


%include BinMFunction_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%wrap_handle(BinMFunction_FunctionDriver)
%wrap_handle(BinMFunction_GraphNodeDriver)
%wrap_handle(BinMFunction_ScopeDriver)

%rename(binmfunction) BinMFunction;
class BinMFunction {
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
};


%extend BinMFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMFunction_FunctionDriver;
class BinMFunction_FunctionDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMFunction_FunctionDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMFunction_FunctionDriver;
		 BinMFunction_FunctionDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%make_alias(BinMFunction_FunctionDriver)

%extend BinMFunction_FunctionDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMFunction_GraphNodeDriver;
class BinMFunction_GraphNodeDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMFunction_GraphNodeDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMFunction_GraphNodeDriver;
		 BinMFunction_GraphNodeDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%make_alias(BinMFunction_GraphNodeDriver)

%extend BinMFunction_GraphNodeDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMFunction_ScopeDriver;
class BinMFunction_ScopeDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMFunction_ScopeDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMFunction_ScopeDriver;
		 BinMFunction_ScopeDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%make_alias(BinMFunction_ScopeDriver)

%extend BinMFunction_ScopeDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
