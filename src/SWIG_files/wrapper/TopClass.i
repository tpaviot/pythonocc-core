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
%define TOPCLASSDOCSTRING
"TopClass module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_topclass.html"
%enddef
%module (package="OCC.Core", docstring=TOPCLASSDOCSTRING) TopClass


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
#include<TopClass_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<gp_module.hxx>
#include<Adaptor3d_module.hxx>
#include<IntSurf_module.hxx>
#include<TopLoc_module.hxx>
#include<Geom2d_module.hxx>
#include<Geom_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Message_module.hxx>
#include<Bnd_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i
%import gp.i

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

/*******************************
* class TopClass_SolidExplorer *
*******************************/
%nodefaultctor TopClass_SolidExplorer;
class TopClass_SolidExplorer {
	public:
		/****************** CurrentFace ******************/
		/**** md5 signature: 1d990c7d14a5e959273b3715c879684d ****/
		%feature("compactdefaultargs") CurrentFace;
		%feature("autodoc", "Returns the current face.

Returns
-------
TopoDS_Face
") CurrentFace;
		virtual TopoDS_Face CurrentFace();

		/****************** InitFace ******************/
		/**** md5 signature: daedd80272d244bb31811aed37f165e6 ****/
		%feature("compactdefaultargs") InitFace;
		%feature("autodoc", "Starts an exploration of the faces.

Returns
-------
None
") InitFace;
		virtual void InitFace();

		/****************** InitShell ******************/
		/**** md5 signature: 73f252f22fd047306e20786d3e9e022a ****/
		%feature("compactdefaultargs") InitShell;
		%feature("autodoc", "Starts an exploration of the shells.

Returns
-------
None
") InitShell;
		virtual void InitShell();

		/****************** MoreFaces ******************/
		/**** md5 signature: dac7e429f1fe86dab978ece4647b9a53 ****/
		%feature("compactdefaultargs") MoreFaces;
		%feature("autodoc", "Returns true if there is a current face.

Returns
-------
bool
") MoreFaces;
		virtual Standard_Boolean MoreFaces();

		/****************** MoreShells ******************/
		/**** md5 signature: 33adf9454975f6ca59eebcf947f2adfd ****/
		%feature("compactdefaultargs") MoreShells;
		%feature("autodoc", "Returns true if there is a current shell.

Returns
-------
bool
") MoreShells;
		virtual Standard_Boolean MoreShells();

		/****************** NextFace ******************/
		/**** md5 signature: 88a277e195acd93fa5a79bcf02ec4094 ****/
		%feature("compactdefaultargs") NextFace;
		%feature("autodoc", "Sets the explorer to the next face and returns false if there are no more wires.

Returns
-------
None
") NextFace;
		virtual void NextFace();

		/****************** NextShell ******************/
		/**** md5 signature: 349fb90959e15780aa1e8b2b28eae11d ****/
		%feature("compactdefaultargs") NextShell;
		%feature("autodoc", "Sets the explorer to the next shell and returns false if there are no more wires.

Returns
-------
None
") NextShell;
		virtual void NextShell();

		/****************** OtherSegment ******************/
		/**** md5 signature: 16a2192771d4829e2fa6d8966b99d29e ****/
		%feature("compactdefaultargs") OtherSegment;
		%feature("autodoc", "Returns in <l>, <par> a segment having at least one intersection with the shape boundary to compute intersections. //! the first call to this method returns a line which point to a point of the first face of the shape. the second call provide a line to the second face and so on. //! if the method is called n times on a shape with f faces (n>f) the line point to other points on the face 1,2,3 ... n.

Parameters
----------
P: gp_Pnt
L: gp_Lin

Returns
-------
Par: float
") OtherSegment;
		virtual void OtherSegment(const gp_Pnt & P, gp_Lin & L, Standard_Real &OutValue);

		/****************** Reject ******************/
		/**** md5 signature: 375aaa6f6f3c97906b526f05ef6216c3 ****/
		%feature("compactdefaultargs") Reject;
		%feature("autodoc", "Should return true if the point is outside a bounding volume of the shape.

Parameters
----------
P: gp_Pnt

Returns
-------
bool
") Reject;
		virtual Standard_Boolean Reject(const gp_Pnt & P);

		/****************** RejectFace ******************/
		/**** md5 signature: 8e0a845a00fd7864bc7102d07bde841f ****/
		%feature("compactdefaultargs") RejectFace;
		%feature("autodoc", "Returns true if the face bounding volume does not intersect the segment.

Parameters
----------
L: gp_Lin
Par: float

Returns
-------
bool
") RejectFace;
		virtual Standard_Boolean RejectFace(const gp_Lin & L, const Standard_Real Par);

		/****************** RejectShell ******************/
		/**** md5 signature: 371243487f7b97ecb711583f1a190e04 ****/
		%feature("compactdefaultargs") RejectShell;
		%feature("autodoc", "Returns true if the shell bounding volume does not intersect the segment.

Parameters
----------
L: gp_Lin
Par: float

Returns
-------
bool
") RejectShell;
		virtual Standard_Boolean RejectShell(const gp_Lin & L, const Standard_Real Par);

		/****************** Segment ******************/
		/**** md5 signature: 7172a83caa6048a0e79465a2e9b71cd8 ****/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "Returns in <l>, <par> a segment having at least one intersection with the shape boundary to compute intersections.

Parameters
----------
P: gp_Pnt
L: gp_Lin

Returns
-------
Par: float
") Segment;
		virtual void Segment(const gp_Pnt & P, gp_Lin & L, Standard_Real &OutValue);

};


%extend TopClass_SolidExplorer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
