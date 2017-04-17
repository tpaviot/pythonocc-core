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
%module (package="OCC") TopClass

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


%include TopClass_headers.i


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

%nodefaultctor TopClass_Intersection3d;
class TopClass_Intersection3d {
	public:
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Perform the intersection between the segment L(0) ... L(Prm) and the Face <Face>. //! Only the point with the smallest parameter on the line is returned. //! The Tolerance <Tol> is used to determine if the first point of the segment is near the face. In that case, the parameter of the intersection point on the line can be a negative value (greater than -Tol).

	:param L:
	:type L: gp_Lin
	:param Prm:
	:type Prm: float
	:param Tol:
	:type Tol: float
	:param Face:
	:type Face: TopoDS_Face &
	:rtype: void
") Perform;
		virtual void Perform (const gp_Lin & L,const Standard_Real Prm,const Standard_Real Tol,const TopoDS_Face & Face);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* True is returned when the intersection have been computed.

	:rtype: bool
") IsDone;
		virtual Standard_Boolean IsDone ();
		%feature("compactdefaultargs") HasAPoint;
		%feature("autodoc", "	* True is returned if a point has been found.

	:rtype: bool
") HasAPoint;
		virtual Standard_Boolean HasAPoint ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the Intersection Point.

	:rtype: IntCurveSurface_IntersectionPoint
") Point;
		virtual const IntCurveSurface_IntersectionPoint & Point ();
		%feature("compactdefaultargs") State;
		%feature("autodoc", "	* Returns the state of the point on the face. The values can be either TopAbs_IN ( the point is in the face) or TopAbs_ON ( the point is on a boudary of the face).

	:rtype: TopAbs_State
") State;
		virtual TopAbs_State State ();
};


%extend TopClass_Intersection3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopClass_SolidExplorer;
class TopClass_SolidExplorer {
	public:
		%feature("compactdefaultargs") Reject;
		%feature("autodoc", "	* Should return True if the point is outside a bounding volume of the shape.

	:param P:
	:type P: gp_Pnt
	:rtype: bool
") Reject;
		virtual Standard_Boolean Reject (const gp_Pnt & P);
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
		%feature("compactdefaultargs") InitShell;
		%feature("autodoc", "	* Starts an exploration of the shells.

	:rtype: void
") InitShell;
		virtual void InitShell ();
		%feature("compactdefaultargs") MoreShells;
		%feature("autodoc", "	* Returns True if there is a current shell.

	:rtype: bool
") MoreShells;
		virtual Standard_Boolean MoreShells ();
		%feature("compactdefaultargs") NextShell;
		%feature("autodoc", "	* Sets the explorer to the next shell and returns False if there are no more wires.

	:rtype: void
") NextShell;
		virtual void NextShell ();
		%feature("compactdefaultargs") RejectShell;
		%feature("autodoc", "	* Returns True if the shell bounding volume does not intersect the segment.

	:param L:
	:type L: gp_Lin
	:param Par:
	:type Par: float
	:rtype: bool
") RejectShell;
		virtual Standard_Boolean RejectShell (const gp_Lin & L,const Standard_Real Par);
		%feature("compactdefaultargs") InitFace;
		%feature("autodoc", "	* Starts an exploration of the faces.

	:rtype: void
") InitFace;
		virtual void InitFace ();
		%feature("compactdefaultargs") MoreFaces;
		%feature("autodoc", "	* Returns True if there is a current face.

	:rtype: bool
") MoreFaces;
		virtual Standard_Boolean MoreFaces ();
		%feature("compactdefaultargs") NextFace;
		%feature("autodoc", "	* Sets the explorer to the next face and returns False if there are no more wires.

	:rtype: void
") NextFace;
		virtual void NextFace ();
		%feature("compactdefaultargs") CurrentFace;
		%feature("autodoc", "	* Returns the current face.

	:rtype: TopoDS_Face
") CurrentFace;
		virtual TopoDS_Face CurrentFace ();
		%feature("compactdefaultargs") RejectFace;
		%feature("autodoc", "	* Returns True if the face bounding volume does not intersect the segment.

	:param L:
	:type L: gp_Lin
	:param Par:
	:type Par: float
	:rtype: bool
") RejectFace;
		virtual Standard_Boolean RejectFace (const gp_Lin & L,const Standard_Real Par);
};


%extend TopClass_SolidExplorer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
