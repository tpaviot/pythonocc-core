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
%define SHAPEPROCESSAPIDOCSTRING
"ShapeProcessAPI module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_shapeprocessapi.html"
%enddef
%module (package="OCC.Core", docstring=SHAPEPROCESSAPIDOCSTRING) ShapeProcessAPI


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
#include<ShapeProcessAPI_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<ShapeProcess_module.hxx>
#include<TopTools_module.hxx>
#include<TopoDS_module.hxx>
#include<TopAbs_module.hxx>
#include<BRep_module.hxx>
#include<ShapeExtend_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<TopLoc_module.hxx>
#include<Geom2d_module.hxx>
#include<BRepTools_module.hxx>
#include<Message_module.hxx>
#include<TShort_module.hxx>
#include<Resource_module.hxx>
#include<ShapeBuild_module.hxx>
#include<Bnd_module.hxx>
#include<Poly_module.hxx>
#include<TColGeom_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import ShapeProcess.i
%import TopTools.i
%import TopoDS.i
%import TopAbs.i
/* public enums */
/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/**************************************
* class ShapeProcessAPI_ApplySequence *
**************************************/
class ShapeProcessAPI_ApplySequence {
	public:
		/****************** ClearMap ******************/
		%feature("compactdefaultargs") ClearMap;
		%feature("autodoc", "* Clears myMap with accumulated history.
	:rtype: None") ClearMap;
		void ClearMap ();

		/****************** Context ******************/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "* Returns object for managing resource file and sequence of operators.
	:rtype: opencascade::handle<ShapeProcess_ShapeContext>") Context;
		opencascade::handle<ShapeProcess_ShapeContext> & Context ();

		/****************** Map ******************/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "* Returns myMap with accumulated history.
	:rtype: TopTools_DataMapOfShapeShape") Map;
		const TopTools_DataMapOfShapeShape & Map ();

		/****************** PrepareShape ******************/
		%feature("compactdefaultargs") PrepareShape;
		%feature("autodoc", "* Performs sequence of operators stored in myRsc. If <fillmap> is True adds history 'shape-shape' into myMap for shape and its subshapes until level <until> (included). If <until> is TopAbs_SHAPE, all the subshapes are considered.
	:param shape:
	:type shape: TopoDS_Shape
	:param fillmap: default value is Standard_False
	:type fillmap: bool
	:param until: default value is TopAbs_SHAPE
	:type until: TopAbs_ShapeEnum
	:rtype: TopoDS_Shape") PrepareShape;
		TopoDS_Shape PrepareShape (const TopoDS_Shape & shape,const Standard_Boolean fillmap = Standard_False,const TopAbs_ShapeEnum until = TopAbs_SHAPE);

		/****************** PrintPreparationResult ******************/
		%feature("compactdefaultargs") PrintPreparationResult;
		%feature("autodoc", "* Prints result of preparation onto the messenger of the context. Note that results can be accumulated from previous preparations it method ClearMap was not called before PrepareShape.
	:rtype: None") PrintPreparationResult;
		void PrintPreparationResult ();

		/****************** ShapeProcessAPI_ApplySequence ******************/
		%feature("compactdefaultargs") ShapeProcessAPI_ApplySequence;
		%feature("autodoc", "* Creates an object and loads resource file and sequence of operators given by their names.
	:param rscName:
	:type rscName: char *
	:param seqName: default value is ""
	:type seqName: char *
	:rtype: None") ShapeProcessAPI_ApplySequence;
		 ShapeProcessAPI_ApplySequence (const char * rscName,const char * seqName = "");

};


%extend ShapeProcessAPI_ApplySequence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
