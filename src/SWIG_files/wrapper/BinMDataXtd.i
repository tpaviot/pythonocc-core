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

%define BINMDATAXTDDOCSTRING
"BinMDataXtd module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_BinMDataXtd.html"
%enddef
%module (package="OCC.Core", docstring=BINMDATAXTDDOCSTRING) BinMDataXtd

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
#include<BinMDataXtd_module.hxx>

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
%wrap_handle(BinMDataXtd_AxisDriver)
%wrap_handle(BinMDataXtd_ConstraintDriver)
%wrap_handle(BinMDataXtd_GeometryDriver)
%wrap_handle(BinMDataXtd_PatternStdDriver)
%wrap_handle(BinMDataXtd_PlacementDriver)
%wrap_handle(BinMDataXtd_PlaneDriver)
%wrap_handle(BinMDataXtd_PointDriver)
%wrap_handle(BinMDataXtd_PositionDriver)
%wrap_handle(BinMDataXtd_PresentationDriver)
%wrap_handle(BinMDataXtd_ShapeDriver)
%wrap_handle(BinMDataXtd_TriangulationDriver)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

%rename(binmdataxtd) BinMDataXtd;
class BinMDataXtd {
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
		%feature("compactdefaultargs") DocumentVersion;
		%feature("autodoc", "	:rtype: int
") DocumentVersion;
		static Standard_Integer DocumentVersion ();
		%feature("compactdefaultargs") SetDocumentVersion;
		%feature("autodoc", "	:param DocVersion:
	:type DocVersion: int
	:rtype: void
") SetDocumentVersion;
		static void SetDocumentVersion (const Standard_Integer DocVersion);
};


%extend BinMDataXtd {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataXtd_AxisDriver;
class BinMDataXtd_AxisDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataXtd_AxisDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") BinMDataXtd_AxisDriver;
		 BinMDataXtd_AxisDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
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


%make_alias(BinMDataXtd_AxisDriver)

%extend BinMDataXtd_AxisDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataXtd_ConstraintDriver;
class BinMDataXtd_ConstraintDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataXtd_ConstraintDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") BinMDataXtd_ConstraintDriver;
		 BinMDataXtd_ConstraintDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
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


%make_alias(BinMDataXtd_ConstraintDriver)

%extend BinMDataXtd_ConstraintDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataXtd_GeometryDriver;
class BinMDataXtd_GeometryDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataXtd_GeometryDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") BinMDataXtd_GeometryDriver;
		 BinMDataXtd_GeometryDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
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


%make_alias(BinMDataXtd_GeometryDriver)

%extend BinMDataXtd_GeometryDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataXtd_PatternStdDriver;
class BinMDataXtd_PatternStdDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataXtd_PatternStdDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") BinMDataXtd_PatternStdDriver;
		 BinMDataXtd_PatternStdDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
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


%make_alias(BinMDataXtd_PatternStdDriver)

%extend BinMDataXtd_PatternStdDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataXtd_PlacementDriver;
class BinMDataXtd_PlacementDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataXtd_PlacementDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") BinMDataXtd_PlacementDriver;
		 BinMDataXtd_PlacementDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
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


%make_alias(BinMDataXtd_PlacementDriver)

%extend BinMDataXtd_PlacementDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataXtd_PlaneDriver;
class BinMDataXtd_PlaneDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataXtd_PlaneDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") BinMDataXtd_PlaneDriver;
		 BinMDataXtd_PlaneDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
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


%make_alias(BinMDataXtd_PlaneDriver)

%extend BinMDataXtd_PlaneDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataXtd_PointDriver;
class BinMDataXtd_PointDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataXtd_PointDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") BinMDataXtd_PointDriver;
		 BinMDataXtd_PointDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
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


%make_alias(BinMDataXtd_PointDriver)

%extend BinMDataXtd_PointDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataXtd_PositionDriver;
class BinMDataXtd_PositionDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataXtd_PositionDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") BinMDataXtd_PositionDriver;
		 BinMDataXtd_PositionDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
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


%make_alias(BinMDataXtd_PositionDriver)

%extend BinMDataXtd_PositionDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataXtd_PresentationDriver;
class BinMDataXtd_PresentationDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataXtd_PresentationDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") BinMDataXtd_PresentationDriver;
		 BinMDataXtd_PresentationDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
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


%make_alias(BinMDataXtd_PresentationDriver)

%extend BinMDataXtd_PresentationDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataXtd_ShapeDriver;
class BinMDataXtd_ShapeDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataXtd_ShapeDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") BinMDataXtd_ShapeDriver;
		 BinMDataXtd_ShapeDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
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


%make_alias(BinMDataXtd_ShapeDriver)

%extend BinMDataXtd_ShapeDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataXtd_TriangulationDriver;
class BinMDataXtd_TriangulationDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataXtd_TriangulationDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") BinMDataXtd_TriangulationDriver;
		 BinMDataXtd_TriangulationDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
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


%make_alias(BinMDataXtd_TriangulationDriver)

%extend BinMDataXtd_TriangulationDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
