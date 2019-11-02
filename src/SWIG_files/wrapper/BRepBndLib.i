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

- time : 2019-11-03 11:38:19
- operating system : debian Linux 4.15.0-66-generic
- occt version targeted : 7.4.0
*/

%define BREPBNDLIBDOCSTRING
"No docstring provided."
%enddef
%module (package="OCC.Core", docstring=BREPBNDLIBDOCSTRING) BRepBndLib

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


%include BRepBndLib_headers.i

/* public enums */
/* end public enums declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/* handles */
/* end handles declaration */

%rename(brepbndlib) BRepBndLib;
class BRepBndLib {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds the shape S to the bounding box B. More precisely are successively added to B: - each face of S; the triangulation of the face is used if it exists, - then each edge of S which does not belong to a face, the polygon of the edge is used if it exists - and last each vertex of S which does not belong to an edge. After each elementary operation, the bounding box B is enlarged by the tolerance value of the relative sub-shape. When working with the triangulation of a face this value of enlargement is the sum of the triangulation deflection and the face tolerance. When working with the polygon of an edge this value of enlargement is the sum of the polygon deflection and the edge tolerance. Warning - This algorithm is time consuming if triangulation has not been inserted inside the data structure of the shape S. - The resulting bounding box may be somewhat larger than the object.

	:param S:
	:type S: TopoDS_Shape &
	:param B:
	:type B: Bnd_Box &
	:param useTriangulation: default value is Standard_True
	:type useTriangulation: bool
	:rtype: void
") Add;
		static void Add (const TopoDS_Shape & S,Bnd_Box & B,const Standard_Boolean useTriangulation = Standard_True);
		%feature("compactdefaultargs") AddClose;
		%feature("autodoc", "	* Adds the shape S to the bounding box B. This is a quick algorithm but only works if the shape S is composed of polygonal planar faces, as is the case if S is an approached polyhedral representation of an exact shape. Pay particular attention to this because this condition is not checked and, if it not respected, an error may occur in the algorithm for which the bounding box is built. Note that the resulting bounding box is not enlarged by the tolerance value of the sub-shapes as is the case with the Add function. So the added part of the resulting bounding box is closer to the shape S.

	:param S:
	:type S: TopoDS_Shape &
	:param B:
	:type B: Bnd_Box &
	:rtype: void
") AddClose;
		static void AddClose (const TopoDS_Shape & S,Bnd_Box & B);
		%feature("compactdefaultargs") AddOBB;
		%feature("autodoc", "	* Computes the Oriented Bounding box for the shape <theS>. Two independent methods of computation are implemented: first method based on set of points (so, it demands the triangulated shape or shape with planar faces and linear edges). The second method is based on use of inertia axes and is called if use of the first method is impossible. If theIsTriangulationUsed == False then the triangulation will be ignored at all. If theIsShapeToleranceUsed == True then resulting box will be extended on the tolerance of the shape. theIsOptimal flag defines whether to look for the more tight OBB for the cost of performance or not.

	:param theS:
	:type theS: TopoDS_Shape &
	:param theOBB:
	:type theOBB: Bnd_OBB &
	:param theIsTriangulationUsed: default value is Standard_True
	:type theIsTriangulationUsed: bool
	:param theIsOptimal: default value is Standard_False
	:type theIsOptimal: bool
	:param theIsShapeToleranceUsed: default value is Standard_True
	:type theIsShapeToleranceUsed: bool
	:rtype: void
") AddOBB;
		static void AddOBB (const TopoDS_Shape & theS,Bnd_OBB & theOBB,const Standard_Boolean theIsTriangulationUsed = Standard_True,const Standard_Boolean theIsOptimal = Standard_False,const Standard_Boolean theIsShapeToleranceUsed = Standard_True);
		%feature("compactdefaultargs") AddOptimal;
		%feature("autodoc", "	* Adds the shape S to the bounding box B. This algorith builds precise bounding box, which differs from exact geometry boundaries of shape only on shape entities tolerances Algorithm is the same as for method Add(..), but uses more precise methods for building boxes for geometry objects. If useShapeTolerance = True, bounding box is enlardged by shape tolerances and these tolerances are used for numerical methods of bounding box size calculations, otherwise bounding box is built according to sizes of uderlined geometrical entities, numerical calculation use tolerance Precision::Confusion().

	:param S:
	:type S: TopoDS_Shape &
	:param B:
	:type B: Bnd_Box &
	:param useTriangulation: default value is Standard_True
	:type useTriangulation: bool
	:param useShapeTolerance: default value is Standard_False
	:type useShapeTolerance: bool
	:rtype: void
") AddOptimal;
		static void AddOptimal (const TopoDS_Shape & S,Bnd_Box & B,const Standard_Boolean useTriangulation = Standard_True,const Standard_Boolean useShapeTolerance = Standard_False);
};


%extend BRepBndLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
