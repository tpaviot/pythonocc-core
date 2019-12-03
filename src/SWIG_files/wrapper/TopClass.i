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
/* public enums */
/* end public enums declaration */

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
		%feature("compactdefaultargs") CurrentFace;
		%feature("autodoc", "* Returns the current face.
	:rtype: TopoDS_Face") CurrentFace;
		virtual TopoDS_Face CurrentFace ();

		/****************** InitFace ******************/
		%feature("compactdefaultargs") InitFace;
		%feature("autodoc", "* Starts an exploration of the faces.
	:rtype: void") InitFace;
		virtual void InitFace ();

		/****************** InitShell ******************/
		%feature("compactdefaultargs") InitShell;
		%feature("autodoc", "* Starts an exploration of the shells.
	:rtype: void") InitShell;
		virtual void InitShell ();

		/****************** MoreFaces ******************/
		%feature("compactdefaultargs") MoreFaces;
		%feature("autodoc", "* Returns True if there is a current face.
	:rtype: bool") MoreFaces;
		virtual Standard_Boolean MoreFaces ();

		/****************** MoreShells ******************/
		%feature("compactdefaultargs") MoreShells;
		%feature("autodoc", "* Returns True if there is a current shell.
	:rtype: bool") MoreShells;
		virtual Standard_Boolean MoreShells ();

		/****************** NextFace ******************/
		%feature("compactdefaultargs") NextFace;
		%feature("autodoc", "* Sets the explorer to the next face and returns False if there are no more wires.
	:rtype: void") NextFace;
		virtual void NextFace ();

		/****************** NextShell ******************/
		%feature("compactdefaultargs") NextShell;
		%feature("autodoc", "* Sets the explorer to the next shell and returns False if there are no more wires.
	:rtype: void") NextShell;
		virtual void NextShell ();

		/****************** OtherSegment ******************/
		%feature("compactdefaultargs") OtherSegment;
		%feature("autodoc", "* Returns in <L>, <Par> a segment having at least one intersection with the shape boundary to compute intersections. //! The First Call to this method returns a line which point to a point of the first face of the shape. The Second Call provide a line to the second face and so on. //! if the method is called N times on a shape with F faces (N>F) the line point to other points on the face 1,2,3 ... N
	:param P:
	:type P: gp_Pnt
	:param L:
	:type L: gp_Lin
	:param Par:
	:type Par: float
	:rtype: void") OtherSegment;
		virtual void OtherSegment (const gp_Pnt & P,gp_Lin & L,Standard_Real &OutValue);

		/****************** Reject ******************/
		%feature("compactdefaultargs") Reject;
		%feature("autodoc", "* Should return True if the point is outside a bounding volume of the shape.
	:param P:
	:type P: gp_Pnt
	:rtype: bool") Reject;
		virtual Standard_Boolean Reject (const gp_Pnt & P);

		/****************** RejectFace ******************/
		%feature("compactdefaultargs") RejectFace;
		%feature("autodoc", "* Returns True if the face bounding volume does not intersect the segment.
	:param L:
	:type L: gp_Lin
	:param Par:
	:type Par: float
	:rtype: bool") RejectFace;
		virtual Standard_Boolean RejectFace (const gp_Lin & L,const Standard_Real Par);

		/****************** RejectShell ******************/
		%feature("compactdefaultargs") RejectShell;
		%feature("autodoc", "* Returns True if the shell bounding volume does not intersect the segment.
	:param L:
	:type L: gp_Lin
	:param Par:
	:type Par: float
	:rtype: bool") RejectShell;
		virtual Standard_Boolean RejectShell (const gp_Lin & L,const Standard_Real Par);

		/****************** Segment ******************/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "* Returns in <L>, <Par> a segment having at least one intersection with the shape boundary to compute intersections.
	:param P:
	:type P: gp_Pnt
	:param L:
	:type L: gp_Lin
	:param Par:
	:type Par: float
	:rtype: void") Segment;
		virtual void Segment (const gp_Pnt & P,gp_Lin & L,Standard_Real &OutValue);

};


%extend TopClass_SolidExplorer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
