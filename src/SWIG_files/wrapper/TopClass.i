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

- time : 2019-11-03 11:38:17
- operating system : debian Linux 4.15.0-66-generic
- occt version targeted : 7.4.0
*/

%define TOPCLASSDOCSTRING
"No docstring provided."
%enddef
%module (package="OCC.Core", docstring=TOPCLASSDOCSTRING) TopClass

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


%include TopClass_headers.i

/* public enums */
/* end public enums declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/* handles */
/* end handles declaration */

%nodefaultctor TopClass_SolidExplorer;
class TopClass_SolidExplorer {
	public:
		%feature("compactdefaultargs") CurrentFace;
		%feature("autodoc", "	* Returns the current face.

	:rtype: TopoDS_Face
") CurrentFace;
		virtual TopoDS_Face CurrentFace ();
		%feature("compactdefaultargs") InitFace;
		%feature("autodoc", "	* Starts an exploration of the faces.

	:rtype: void
") InitFace;
		virtual void InitFace ();
		%feature("compactdefaultargs") InitShell;
		%feature("autodoc", "	* Starts an exploration of the shells.

	:rtype: void
") InitShell;
		virtual void InitShell ();
		%feature("compactdefaultargs") MoreFaces;
		%feature("autodoc", "	* Returns True if there is a current face.

	:rtype: bool
") MoreFaces;
		virtual Standard_Boolean MoreFaces ();
		%feature("compactdefaultargs") MoreShells;
		%feature("autodoc", "	* Returns True if there is a current shell.

	:rtype: bool
") MoreShells;
		virtual Standard_Boolean MoreShells ();
		%feature("compactdefaultargs") NextFace;
		%feature("autodoc", "	* Sets the explorer to the next face and returns False if there are no more wires.

	:rtype: void
") NextFace;
		virtual void NextFace ();
		%feature("compactdefaultargs") NextShell;
		%feature("autodoc", "	* Sets the explorer to the next shell and returns False if there are no more wires.

	:rtype: void
") NextShell;
		virtual void NextShell ();
		%feature("compactdefaultargs") OtherSegment;
		%feature("autodoc", "	* Returns in <L>, <Par> a segment having at least one intersection with the shape boundary to compute intersections. //! The First Call to this method returns a line which point to a point of the first face of the shape. The Second Call provide a line to the second face and so on. //! if the method is called N times on a shape with F faces (N>F) the line point to other points on the face 1,2,3 ... N

	:param P:
	:type P: gp_Pnt
	:param L:
	:type L: gp_Lin
	:param Par:
	:type Par: float &
	:rtype: void
") OtherSegment;
		virtual void OtherSegment (const gp_Pnt & P,gp_Lin & L,Standard_Real &OutValue);
		%feature("compactdefaultargs") Reject;
		%feature("autodoc", "	* Should return True if the point is outside a bounding volume of the shape.

	:param P:
	:type P: gp_Pnt
	:rtype: bool
") Reject;
		virtual Standard_Boolean Reject (const gp_Pnt & P);
		%feature("compactdefaultargs") RejectFace;
		%feature("autodoc", "	* Returns True if the face bounding volume does not intersect the segment.

	:param L:
	:type L: gp_Lin
	:param Par:
	:type Par: float
	:rtype: bool
") RejectFace;
		virtual Standard_Boolean RejectFace (const gp_Lin & L,const Standard_Real Par);
		%feature("compactdefaultargs") RejectShell;
		%feature("autodoc", "	* Returns True if the shell bounding volume does not intersect the segment.

	:param L:
	:type L: gp_Lin
	:param Par:
	:type Par: float
	:rtype: bool
") RejectShell;
		virtual Standard_Boolean RejectShell (const gp_Lin & L,const Standard_Real Par);
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "	* Returns in <L>, <Par> a segment having at least one intersection with the shape boundary to compute intersections.

	:param P:
	:type P: gp_Pnt
	:param L:
	:type L: gp_Lin
	:param Par:
	:type Par: float &
	:rtype: void
") Segment;
		virtual void Segment (const gp_Pnt & P,gp_Lin & L,Standard_Real &OutValue);
};


%extend TopClass_SolidExplorer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
