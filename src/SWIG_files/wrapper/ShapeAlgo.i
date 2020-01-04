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
%define SHAPEALGODOCSTRING
"ShapeAlgo module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_shapealgo.html"
%enddef
%module (package="OCC.Core", docstring=SHAPEALGODOCSTRING) ShapeAlgo


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
#include<ShapeAlgo_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<ShapeFix_module.hxx>
#include<Geom_module.hxx>
#include<TopTools_module.hxx>
#include<BRep_module.hxx>
#include<TColGeom_module.hxx>
#include<TopLoc_module.hxx>
#include<Message_module.hxx>
#include<Bnd_module.hxx>
#include<Geom2d_module.hxx>
#include<ShapeAnalysis_module.hxx>
#include<TShort_module.hxx>
#include<ShapeExtend_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Poly_module.hxx>
#include<TopoDS_module.hxx>
#include<BRepTools_module.hxx>
#include<IntRes2d_module.hxx>
#include<BRepBuilderAPI_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Adaptor2d_module.hxx>
#include<ShapeConstruct_module.hxx>
#include<ShapeBuild_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import ShapeFix.i
/* public enums */
/* end public enums declaration */

/* handles */
%wrap_handle(ShapeAlgo_ToolContainer)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/******************
* class ShapeAlgo *
******************/
%rename(shapealgo) ShapeAlgo;
class ShapeAlgo {
	public:
		/****************** AlgoContainer ******************/
		%feature("compactdefaultargs") AlgoContainer;
		%feature("autodoc", "* Returns default AlgoContainer
	:rtype: opencascade::handle<ShapeAlgo_AlgoContainer>") AlgoContainer;
		static opencascade::handle<ShapeAlgo_AlgoContainer> AlgoContainer ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Provides initerface to the algorithms from Shape Healing. Creates and initializes default AlgoContainer.
	:rtype: void") Init;
		static void Init ();

		/****************** SetAlgoContainer ******************/
		%feature("compactdefaultargs") SetAlgoContainer;
		%feature("autodoc", "* Sets default AlgoContainer
	:param aContainer:
	:type aContainer: ShapeAlgo_AlgoContainer
	:rtype: void") SetAlgoContainer;
		static void SetAlgoContainer (const opencascade::handle<ShapeAlgo_AlgoContainer> & aContainer);

};


%extend ShapeAlgo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class ShapeAlgo_AlgoContainer *
********************************/
/********************************
* class ShapeAlgo_ToolContainer *
********************************/
class ShapeAlgo_ToolContainer : public Standard_Transient {
	public:
		/****************** EdgeProjAux ******************/
		%feature("compactdefaultargs") EdgeProjAux;
		%feature("autodoc", "* Returns ShapeFix_EdgeProjAux
	:rtype: opencascade::handle<ShapeFix_EdgeProjAux>") EdgeProjAux;
		virtual opencascade::handle<ShapeFix_EdgeProjAux> EdgeProjAux ();

		/****************** FixShape ******************/
		%feature("compactdefaultargs") FixShape;
		%feature("autodoc", "* Returns ShapeFix_Shape
	:rtype: opencascade::handle<ShapeFix_Shape>") FixShape;
		virtual opencascade::handle<ShapeFix_Shape> FixShape ();

		/****************** ShapeAlgo_ToolContainer ******************/
		%feature("compactdefaultargs") ShapeAlgo_ToolContainer;
		%feature("autodoc", "* Empty constructor
	:rtype: None") ShapeAlgo_ToolContainer;
		 ShapeAlgo_ToolContainer ();

};


%make_alias(ShapeAlgo_ToolContainer)

%extend ShapeAlgo_ToolContainer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
