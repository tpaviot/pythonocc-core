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

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

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
		/**** md5 signature: c1f523c465ca6cba85665bd0de49f1d1 ****/
		%feature("compactdefaultargs") AlgoContainer;
		%feature("autodoc", "Returns default algocontainer.

Returns
-------
opencascade::handle<ShapeAlgo_AlgoContainer>
") AlgoContainer;
		static opencascade::handle<ShapeAlgo_AlgoContainer> AlgoContainer();

		/****************** Init ******************/
		/**** md5 signature: 342fdccc4643f67c269591c4b6447108 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Provides initerface to the algorithms from shape healing. creates and initializes default algocontainer.

Returns
-------
None
") Init;
		static void Init();

		/****************** SetAlgoContainer ******************/
		/**** md5 signature: 0f08b7ef735a36117834ac8cb4c7072a ****/
		%feature("compactdefaultargs") SetAlgoContainer;
		%feature("autodoc", "Sets default algocontainer.

Parameters
----------
aContainer: ShapeAlgo_AlgoContainer

Returns
-------
None
") SetAlgoContainer;
		static void SetAlgoContainer(const opencascade::handle<ShapeAlgo_AlgoContainer> & aContainer);

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
		/****************** ShapeAlgo_ToolContainer ******************/
		/**** md5 signature: 80836b1fd7be7ee0f942f7a26d297738 ****/
		%feature("compactdefaultargs") ShapeAlgo_ToolContainer;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") ShapeAlgo_ToolContainer;
		 ShapeAlgo_ToolContainer();

		/****************** EdgeProjAux ******************/
		/**** md5 signature: 526a36aa395ee919ad5f3bedac952d00 ****/
		%feature("compactdefaultargs") EdgeProjAux;
		%feature("autodoc", "Returns shapefix_edgeprojaux.

Returns
-------
opencascade::handle<ShapeFix_EdgeProjAux>
") EdgeProjAux;
		virtual opencascade::handle<ShapeFix_EdgeProjAux> EdgeProjAux();

		/****************** FixShape ******************/
		/**** md5 signature: 178f51e71f6d84a5c9616b5fbf61610a ****/
		%feature("compactdefaultargs") FixShape;
		%feature("autodoc", "Returns shapefix_shape.

Returns
-------
opencascade::handle<ShapeFix_Shape>
") FixShape;
		virtual opencascade::handle<ShapeFix_Shape> FixShape();

};


%make_alias(ShapeAlgo_ToolContainer)

%extend ShapeAlgo_ToolContainer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class ShapeAlgo_AlgoContainer:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
