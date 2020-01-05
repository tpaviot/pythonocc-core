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
%define RWOBJDOCSTRING
"RWObj module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_rwobj.html"
%enddef
%module (package="OCC.Core", docstring=RWOBJDOCSTRING) RWObj


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
#include<RWObj_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<TCollection_module.hxx>
#include<Graphic3d_module.hxx>
#include<gp_module.hxx>
#include<CDF_module.hxx>
#include<PCDM_module.hxx>
#include<TDF_module.hxx>
#include<TDocStd_module.hxx>
#include<Graphic3d_module.hxx>
#include<Geom_module.hxx>
#include<TShort_module.hxx>
#include<Aspect_module.hxx>
#include<Bnd_module.hxx>
#include<Quantity_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i
%import TCollection.i
%import Graphic3d.i
%import gp.i
/* public enums */
enum RWObj_SubMeshReason {
	RWObj_SubMeshReason_NewObject = 0,
	RWObj_SubMeshReason_NewGroup = 1,
	RWObj_SubMeshReason_NewMaterial = 2,
	RWObj_SubMeshReason_NewSmoothGroup = 3,
};

/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/**************
* class RWObj *
**************/
/*****************************
* class RWObj_IShapeReceiver *
*****************************/
%nodefaultctor RWObj_IShapeReceiver;
class RWObj_IShapeReceiver {
	public:
		/****************** BindNamedShape ******************/
		%feature("compactdefaultargs") BindNamedShape;
		%feature("autodoc", "* @param theShape shape to register @param theName shape name @param theMaterial shape material @param theIsRootShape indicates that this is a root object (free shape)
	:param theShape:
	:type theShape: TopoDS_Shape
	:param theName:
	:type theName: TCollection_AsciiString
	:param theMaterial:
	:type theMaterial: RWObj_Material *
	:param theIsRootShape:
	:type theIsRootShape: bool
	:rtype: None") BindNamedShape;
		void BindNamedShape (const TopoDS_Shape & theShape,const TCollection_AsciiString & theName,const RWObj_Material * theMaterial,const Standard_Boolean theIsRootShape);

};


%extend RWObj_IShapeReceiver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class RWObj_Material *
***********************/
class RWObj_Material {
	public:
		TCollection_AsciiString Name;
		TCollection_AsciiString DiffuseTexture;
		TCollection_AsciiString SpecularTexture;
		TCollection_AsciiString BumpTexture;
		Quantity_Color AmbientColor;
		Quantity_Color DiffuseColor;
		Quantity_Color SpecularColor;
		Standard_ShortReal Shininess;
		Standard_ShortReal Transparency;
		/****************** RWObj_Material ******************/
		%feature("compactdefaultargs") RWObj_Material;
		%feature("autodoc", ":rtype: None") RWObj_Material;
		 RWObj_Material ();

};


%extend RWObj_Material {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class RWObj_MtlReader *
************************/
/*********************
* class RWObj_Reader *
*********************/
/**********************
* class RWObj_SubMesh *
**********************/
class RWObj_SubMesh {
	public:
		TCollection_AsciiString Object;
		TCollection_AsciiString Group;
		TCollection_AsciiString SmoothGroup;
		TCollection_AsciiString Material;
};


%extend RWObj_SubMesh {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class RWObj_CafReader *
************************/
/**********************************
* class RWObj_TriangulationReader *
**********************************/
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
