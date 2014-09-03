/*
Copyright 2008-2014 Thomas Paviot (tpaviot@gmail.com)


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
%include ../common/StandardDefines.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i

%include ShapeProcessAPI_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor ShapeProcessAPI_ApplySequence;
class ShapeProcessAPI_ApplySequence {
	public:
		%feature("autodoc", "Args:
	rscName(char *)
	seqName(char *)=

Returns:
	None

Creates an object and loads resource file and sequence of  
         operators given by their names.") ShapeProcessAPI_ApplySequence;
		 ShapeProcessAPI_ApplySequence (const char * rscName,const char * seqName = "");
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ShapeProcess_ShapeContext

Returns object for managing resource file and sequence of  
         operators.") Context;
		Handle_ShapeProcess_ShapeContext & Context ();
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	fillmap(Standard_Boolean)=Standard_False
	until(TopAbs_ShapeEnum)=TopAbs_SHAPE

Returns:
	TopoDS_Shape

Performs sequence of operators stored in myRsc.  
         If <fillmap> is True adds history 'shape-shape' into myMap  
         for shape and its subshapes until level <until> (included).  
         If <until> is TopAbs_SHAPE,  all the subshapes are considered.") PrepareShape;
		TopoDS_Shape PrepareShape (const TopoDS_Shape & shape,const Standard_Boolean fillmap = Standard_False,const TopAbs_ShapeEnum until = TopAbs_SHAPE);
		%feature("autodoc", "Args:
	None
Returns:
	None

Clears myMap with accumulated history.") ClearMap;
		void ClearMap ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_DataMapOfShapeShape

Returns myMap with accumulated history.") Map;
		const TopTools_DataMapOfShapeShape & Map ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Prints result of preparation onto the messenger of the context.  
         Note that results can be accumulated from previous preparations  
         it method ClearMap was not called before PrepareShape.") PrintPreparationResult;
		void PrintPreparationResult ();
};


%feature("shadow") ShapeProcessAPI_ApplySequence::~ShapeProcessAPI_ApplySequence %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ShapeProcessAPI_ApplySequence {
	void _kill_pointed() {
		delete $self;
	}
};
