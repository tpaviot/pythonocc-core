/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_shapeprocessapi.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
#include<ShapeProcessAPI_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<ShapeProcess_module.hxx>
#include<TopTools_module.hxx>
#include<TopoDS_module.hxx>
#include<TopAbs_module.hxx>
#include<Message_module.hxx>
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
%import Message.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

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
		/****** ShapeProcessAPI_ApplySequence::ShapeProcessAPI_ApplySequence ******/
		/****** md5 signature: f5377d66263c9513eab7d2e2af5df61a ******/
		%feature("compactdefaultargs") ShapeProcessAPI_ApplySequence;
		%feature("autodoc", "
Parameters
----------
rscName: str
seqName: str (optional, default to "")

Return
-------
None

Description
-----------
Creates an object and loads resource file and sequence of operators given by their names.
") ShapeProcessAPI_ApplySequence;
		 ShapeProcessAPI_ApplySequence(Standard_CString rscName, Standard_CString seqName = "");

		/****** ShapeProcessAPI_ApplySequence::ClearMap ******/
		/****** md5 signature: 9356b49e3e18c060604ef62eda302963 ******/
		%feature("compactdefaultargs") ClearMap;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears myMap with accumulated history.
") ClearMap;
		void ClearMap();

		/****** ShapeProcessAPI_ApplySequence::Context ******/
		/****** md5 signature: b0b09a3cdce6c6dc8869f38cc643ed97 ******/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "Return
-------
opencascade::handle<ShapeProcess_ShapeContext>

Description
-----------
Returns object for managing resource file and sequence of operators.
") Context;
		opencascade::handle<ShapeProcess_ShapeContext> & Context();

		/****** ShapeProcessAPI_ApplySequence::Map ******/
		/****** md5 signature: f3544fddbdbe445b92ed0b96e5dc0e82 ******/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "Return
-------
TopTools_DataMapOfShapeShape

Description
-----------
Returns myMap with accumulated history.
") Map;
		const TopTools_DataMapOfShapeShape & Map();

		/****** ShapeProcessAPI_ApplySequence::PrepareShape ******/
		/****** md5 signature: 27d62345063f43da2206e8a57a3eb6ef ******/
		%feature("compactdefaultargs") PrepareShape;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
fillmap: bool (optional, default to Standard_False)
until: TopAbs_ShapeEnum (optional, default to TopAbs_SHAPE)
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
TopoDS_Shape

Description
-----------
Performs sequence of operators stored in myRsc. If <fillmap> is True adds history 'shape-shape' into myMap for shape and its subshapes until level <until> (included). If <until> is TopAbs_SHAPE, all the subshapes are considered.
") PrepareShape;
		TopoDS_Shape PrepareShape(const TopoDS_Shape & shape, const Standard_Boolean fillmap = Standard_False, const TopAbs_ShapeEnum until = TopAbs_SHAPE, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** ShapeProcessAPI_ApplySequence::PrintPreparationResult ******/
		/****** md5 signature: 9f69281710e5ed4ccee63017708a3d97 ******/
		%feature("compactdefaultargs") PrintPreparationResult;
		%feature("autodoc", "Return
-------
None

Description
-----------
Prints result of preparation onto the messenger of the context. Note that results can be accumulated from previous preparations it method ClearMap was not called before PrepareShape.
") PrintPreparationResult;
		void PrintPreparationResult();

};


%extend ShapeProcessAPI_ApplySequence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
