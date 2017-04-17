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
%module (package="OCC") ShapeProcessAPI

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


%include ShapeProcessAPI_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor ShapeProcessAPI_ApplySequence;
class ShapeProcessAPI_ApplySequence {
	public:
		%feature("compactdefaultargs") ShapeProcessAPI_ApplySequence;
		%feature("autodoc", "	* Creates an object and loads resource file and sequence of operators given by their names.

	:param rscName:
	:type rscName: char *
	:param seqName: default value is ""
	:type seqName: char *
	:rtype: None
") ShapeProcessAPI_ApplySequence;
		 ShapeProcessAPI_ApplySequence (const char * rscName,const char * seqName = "");
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "	* Returns object for managing resource file and sequence of operators.

	:rtype: Handle_ShapeProcess_ShapeContext
") Context;
		Handle_ShapeProcess_ShapeContext Context ();
		%feature("compactdefaultargs") PrepareShape;
		%feature("autodoc", "	* Performs sequence of operators stored in myRsc. If <fillmap> is True adds history 'shape-shape' into myMap for shape and its subshapes until level <until> (included). If <until> is TopAbs_SHAPE, all the subshapes are considered.

	:param shape:
	:type shape: TopoDS_Shape &
	:param fillmap: default value is Standard_False
	:type fillmap: bool
	:param until: default value is TopAbs_SHAPE
	:type until: TopAbs_ShapeEnum
	:rtype: TopoDS_Shape
") PrepareShape;
		TopoDS_Shape PrepareShape (const TopoDS_Shape & shape,const Standard_Boolean fillmap = Standard_False,const TopAbs_ShapeEnum until = TopAbs_SHAPE);
		%feature("compactdefaultargs") ClearMap;
		%feature("autodoc", "	* Clears myMap with accumulated history.

	:rtype: None
") ClearMap;
		void ClearMap ();
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "	* Returns myMap with accumulated history.

	:rtype: TopTools_DataMapOfShapeShape
") Map;
		const TopTools_DataMapOfShapeShape & Map ();
		%feature("compactdefaultargs") PrintPreparationResult;
		%feature("autodoc", "	* Prints result of preparation onto the messenger of the context. Note that results can be accumulated from previous preparations it method ClearMap was not called before PrepareShape.

	:rtype: None
") PrintPreparationResult;
		void PrintPreparationResult ();
};


%extend ShapeProcessAPI_ApplySequence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
