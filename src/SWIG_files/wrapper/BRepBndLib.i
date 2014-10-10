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
%module BRepBndLib

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

%include BRepBndLib_required_python_modules.i
%include BRepBndLib_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(brepbndlib) BRepBndLib;
%nodefaultctor BRepBndLib;
class BRepBndLib {
	public:
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	B(Bnd_Box)
	useTriangulation(Standard_Boolean)=Standard_True

Returns:
	static void

//!Adds the shape S to the bounding box B.  
More precisely are successively added to B:  
-   each face of S; the triangulation of the face is used if it exists,  
-   then each edge of S which does not belong to a face,  
  the polygon of the edge is used if it exists  
-   and last each vertex of S which does not belong to an edge.  
  After each elementary operation, the bounding box B is  
enlarged by the tolerance value of the relative sub-shape.  
When working with the triangulation of a face this value of  
enlargement is the sum of the triangulation deflection and  
the face tolerance. When working with the  
polygon of an edge this value of enlargement is  
the sum of the polygon deflection and the edge tolerance.  
Warning  
-   This algorithm is time consuming if triangulation has not  
  been inserted inside the data structure of the shape S.  
-   The resulting bounding box may be somewhat larger than the object.") Add;
		static void Add (const TopoDS_Shape & S,Bnd_Box & B,const Standard_Boolean useTriangulation = Standard_True);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	B(Bnd_Box)

Returns:
	static void

Adds the shape S to the bounding box B.  
This is a quick algorithm but only works if the shape S is  
composed of polygonal planar faces, as is the case if S is  
an approached polyhedral representation of an exact  
shape. Pay particular attention to this because this  
condition is not checked and, if it not respected, an error  
may occur in the algorithm for which the bounding box is built.  
Note that the resulting bounding box is not enlarged by the  
tolerance value of the sub-shapes as is the case with the  
Add function. So the added part of the resulting bounding  
box is closer to the shape S.") AddClose;
		static void AddClose (const TopoDS_Shape & S,Bnd_Box & B);
};


%feature("shadow") BRepBndLib::~BRepBndLib %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepBndLib {
	void _kill_pointed() {
		delete $self;
	}
};
