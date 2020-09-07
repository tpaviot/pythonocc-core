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
%define BREPBNDLIBDOCSTRING
"BRepBndLib module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_brepbndlib.html"
%enddef
%module (package="OCC.Core", docstring=BREPBNDLIBDOCSTRING) BRepBndLib


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
#include<BRepBndLib_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<Bnd_module.hxx>
#include<TopLoc_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i
%import Bnd.i

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
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*******************
* class BRepBndLib *
*******************/
%rename(brepbndlib) BRepBndLib;
class BRepBndLib {
	public:
		/****************** Add ******************/
		/**** md5 signature: 9c3545c9b1c2df3d52fed48b98ad0a1a ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the shape s to the bounding box b. more precisely are successively added to b: - each face of s; the triangulation of the face is used if it exists, - then each edge of s which does not belong to a face, the polygon of the edge is used if it exists - and last each vertex of s which does not belong to an edge. after each elementary operation, the bounding box b is enlarged by the tolerance value of the relative sub-shape. when working with the triangulation of a face this value of enlargement is the sum of the triangulation deflection and the face tolerance. when working with the polygon of an edge this value of enlargement is the sum of the polygon deflection and the edge tolerance. warning - this algorithm is time consuming if triangulation has not been inserted inside the data structure of the shape s. - the resulting bounding box may be somewhat larger than the object.

Parameters
----------
S: TopoDS_Shape
B: Bnd_Box
useTriangulation: bool,optional
	default value is Standard_True

Returns
-------
None
") Add;
		static void Add(const TopoDS_Shape & S, Bnd_Box & B, const Standard_Boolean useTriangulation = Standard_True);

		/****************** AddClose ******************/
		/**** md5 signature: 5b4c3dd1c546b82ab92a38e981573fb5 ****/
		%feature("compactdefaultargs") AddClose;
		%feature("autodoc", "Adds the shape s to the bounding box b. this is a quick algorithm but only works if the shape s is composed of polygonal planar faces, as is the case if s is an approached polyhedral representation of an exact shape. pay particular attention to this because this condition is not checked and, if it not respected, an error may occur in the algorithm for which the bounding box is built. note that the resulting bounding box is not enlarged by the tolerance value of the sub-shapes as is the case with the add function. so the added part of the resulting bounding box is closer to the shape s.

Parameters
----------
S: TopoDS_Shape
B: Bnd_Box

Returns
-------
None
") AddClose;
		static void AddClose(const TopoDS_Shape & S, Bnd_Box & B);

		/****************** AddOBB ******************/
		/**** md5 signature: 4475957a182d53ac4344f17f5720d203 ****/
		%feature("compactdefaultargs") AddOBB;
		%feature("autodoc", "Computes the oriented bounding box for the shape <thes>. two independent methods of computation are implemented: first method based on set of points (so, it demands the triangulated shape or shape with planar faces and linear edges). the second method is based on use of inertia axes and is called if use of the first method is impossible. if theistriangulationused == false then the triangulation will be ignored at all. if theisshapetoleranceused == true then resulting box will be extended on the tolerance of the shape. theisoptimal flag defines whether to look for the more tight obb for the cost of performance or not.

Parameters
----------
theS: TopoDS_Shape
theOBB: Bnd_OBB
theIsTriangulationUsed: bool,optional
	default value is Standard_True
theIsOptimal: bool,optional
	default value is Standard_False
theIsShapeToleranceUsed: bool,optional
	default value is Standard_True

Returns
-------
None
") AddOBB;
		static void AddOBB(const TopoDS_Shape & theS, Bnd_OBB & theOBB, const Standard_Boolean theIsTriangulationUsed = Standard_True, const Standard_Boolean theIsOptimal = Standard_False, const Standard_Boolean theIsShapeToleranceUsed = Standard_True);

		/****************** AddOptimal ******************/
		/**** md5 signature: bd6c1029fd07d68da48862cc70fd6a39 ****/
		%feature("compactdefaultargs") AddOptimal;
		%feature("autodoc", "Adds the shape s to the bounding box b. this algorith builds precise bounding box, which differs from exact geometry boundaries of shape only on shape entities tolerances algorithm is the same as for method add(..), but uses more precise methods for building boxes for geometry objects. if useshapetolerance = true, bounding box is enlardged by shape tolerances and these tolerances are used for numerical methods of bounding box size calculations, otherwise bounding box is built according to sizes of uderlined geometrical entities, numerical calculation use tolerance precision::confusion().

Parameters
----------
S: TopoDS_Shape
B: Bnd_Box
useTriangulation: bool,optional
	default value is Standard_True
useShapeTolerance: bool,optional
	default value is Standard_False

Returns
-------
None
") AddOptimal;
		static void AddOptimal(const TopoDS_Shape & S, Bnd_Box & B, const Standard_Boolean useTriangulation = Standard_True, const Standard_Boolean useShapeTolerance = Standard_False);

};


%extend BRepBndLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
