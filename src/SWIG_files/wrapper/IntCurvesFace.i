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
%module (package="OCC") IntCurvesFace

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


%include IntCurvesFace_headers.i


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

%nodefaultctor IntCurvesFace_Intersector;
class IntCurvesFace_Intersector {
	public:
		%feature("compactdefaultargs") IntCurvesFace_Intersector;
		%feature("autodoc", "	* Load a Face. //! The Tolerance <Tol> is used to determine if the first point of the segment is near the face. In that case, the parameter of the intersection point on the line can be a negative value (greater than -Tol).

	:param F:
	:type F: TopoDS_Face &
	:param aTol:
	:type aTol: float
	:rtype: None
") IntCurvesFace_Intersector;
		 IntCurvesFace_Intersector (const TopoDS_Face & F,const Standard_Real aTol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Perform the intersection between the segment L and the loaded face. //! PInf is the smallest parameter on the line PSup is the highest parmaeter on the line //! For an infinite line PInf and PSup can be +/- RealLast.

	:param L:
	:type L: gp_Lin
	:param PInf:
	:type PInf: float
	:param PSup:
	:type PSup: float
	:rtype: None
") Perform;
		void Perform (const gp_Lin & L,const Standard_Real PInf,const Standard_Real PSup);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* same method for a HCurve from Adaptor3d. PInf an PSup can also be - and + INF.

	:param HCu:
	:type HCu: Handle_Adaptor3d_HCurve &
	:param PInf:
	:type PInf: float
	:param PSup:
	:type PSup: float
	:rtype: None
") Perform;
		void Perform (const Handle_Adaptor3d_HCurve & HCu,const Standard_Real PInf,const Standard_Real PSup);
		%feature("compactdefaultargs") SurfaceType;
		%feature("autodoc", "	* Return the surface type

	:rtype: GeomAbs_SurfaceType
") SurfaceType;
		GeomAbs_SurfaceType SurfaceType ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* True is returned when the intersection have been computed.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbPnt;
		%feature("autodoc", "	:rtype: int
") NbPnt;
		Standard_Integer NbPnt ();
		%feature("compactdefaultargs") UParameter;
		%feature("autodoc", "	* Returns the U parameter of the ith intersection point on the surface.

	:param I:
	:type I: int
	:rtype: float
") UParameter;
		Standard_Real UParameter (const Standard_Integer I);
		%feature("compactdefaultargs") VParameter;
		%feature("autodoc", "	* Returns the V parameter of the ith intersection point on the surface.

	:param I:
	:type I: int
	:rtype: float
") VParameter;
		Standard_Real VParameter (const Standard_Integer I);
		%feature("compactdefaultargs") WParameter;
		%feature("autodoc", "	* Returns the parameter of the ith intersection point on the line.

	:param I:
	:type I: int
	:rtype: float
") WParameter;
		Standard_Real WParameter (const Standard_Integer I);
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "	* Returns the geometric point of the ith intersection between the line and the surface.

	:param I:
	:type I: int
	:rtype: gp_Pnt
") Pnt;
		const gp_Pnt  Pnt (const Standard_Integer I);
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "	* Returns the ith transition of the line on the surface.

	:param I:
	:type I: int
	:rtype: IntCurveSurface_TransitionOnCurve
") Transition;
		IntCurveSurface_TransitionOnCurve Transition (const Standard_Integer I);
		%feature("compactdefaultargs") State;
		%feature("autodoc", "	* Returns the ith state of the point on the face. The values can be either TopAbs_IN ( the point is in the face) or TopAbs_ON ( the point is on a boudary of the face).

	:param I:
	:type I: int
	:rtype: TopAbs_State
") State;
		TopAbs_State State (const Standard_Integer I);
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "	* Returns the significant face used to determine the intersection.

	:rtype: TopoDS_Face
") Face;
		const TopoDS_Face  Face ();
		%feature("compactdefaultargs") ClassifyUVPoint;
		%feature("autodoc", "	:param Puv:
	:type Puv: gp_Pnt2d
	:rtype: TopAbs_State
") ClassifyUVPoint;
		TopAbs_State ClassifyUVPoint (const gp_Pnt2d & Puv);
		%feature("compactdefaultargs") Bounding;
		%feature("autodoc", "	:rtype: Bnd_Box
") Bounding;
		Bnd_Box Bounding ();
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
};


%extend IntCurvesFace_Intersector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntCurvesFace_ShapeIntersector;
class IntCurvesFace_ShapeIntersector {
	public:
		%feature("compactdefaultargs") IntCurvesFace_ShapeIntersector;
		%feature("autodoc", "	:rtype: None
") IntCurvesFace_ShapeIntersector;
		 IntCurvesFace_ShapeIntersector ();
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	:param Sh:
	:type Sh: TopoDS_Shape &
	:param Tol:
	:type Tol: float
	:rtype: None
") Load;
		void Load (const TopoDS_Shape & Sh,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Perform the intersection between the segment L and the loaded shape. //! PInf is the smallest parameter on the line PSup is the highest parammter on the line //! For an infinite line PInf and PSup can be +/- RealLast.

	:param L:
	:type L: gp_Lin
	:param PInf:
	:type PInf: float
	:param PSup:
	:type PSup: float
	:rtype: None
") Perform;
		void Perform (const gp_Lin & L,const Standard_Real PInf,const Standard_Real PSup);
		%feature("compactdefaultargs") PerformNearest;
		%feature("autodoc", "	* Perform the intersection between the segment L and the loaded shape. //! PInf is the smallest parameter on the line PSup is the highest parammter on the line //! For an infinite line PInf and PSup can be +/- RealLast.

	:param L:
	:type L: gp_Lin
	:param PInf:
	:type PInf: float
	:param PSup:
	:type PSup: float
	:rtype: None
") PerformNearest;
		void PerformNearest (const gp_Lin & L,const Standard_Real PInf,const Standard_Real PSup);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* same method for a HCurve from Adaptor3d. PInf an PSup can also be - and + INF.

	:param HCu:
	:type HCu: Handle_Adaptor3d_HCurve &
	:param PInf:
	:type PInf: float
	:param PSup:
	:type PSup: float
	:rtype: None
") Perform;
		void Perform (const Handle_Adaptor3d_HCurve & HCu,const Standard_Real PInf,const Standard_Real PSup);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* True is returned when the intersection have been computed.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbPnt;
		%feature("autodoc", "	:rtype: int
") NbPnt;
		Standard_Integer NbPnt ();
		%feature("compactdefaultargs") UParameter;
		%feature("autodoc", "	* Returns the U parameter of the ith intersection point on the surface.

	:param I:
	:type I: int
	:rtype: float
") UParameter;
		Standard_Real UParameter (const Standard_Integer I);
		%feature("compactdefaultargs") VParameter;
		%feature("autodoc", "	* Returns the V parameter of the ith intersection point on the surface.

	:param I:
	:type I: int
	:rtype: float
") VParameter;
		Standard_Real VParameter (const Standard_Integer I);
		%feature("compactdefaultargs") WParameter;
		%feature("autodoc", "	* Returns the parameter of the ith intersection point on the line.

	:param I:
	:type I: int
	:rtype: float
") WParameter;
		Standard_Real WParameter (const Standard_Integer I);
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "	* Returns the geometric point of the ith intersection between the line and the surface.

	:param I:
	:type I: int
	:rtype: gp_Pnt
") Pnt;
		const gp_Pnt  Pnt (const Standard_Integer I);
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "	* Returns the ith transition of the line on the surface.

	:param I:
	:type I: int
	:rtype: IntCurveSurface_TransitionOnCurve
") Transition;
		IntCurveSurface_TransitionOnCurve Transition (const Standard_Integer I);
		%feature("compactdefaultargs") State;
		%feature("autodoc", "	* Returns the ith state of the point on the face. The values can be either TopAbs_IN ( the point is in the face) or TopAbs_ON ( the point is on a boudary of the face).

	:param I:
	:type I: int
	:rtype: TopAbs_State
") State;
		TopAbs_State State (const Standard_Integer I);
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "	* Returns the significant face used to determine the intersection.

	:param I:
	:type I: int
	:rtype: TopoDS_Face
") Face;
		const TopoDS_Face  Face (const Standard_Integer I);
		%feature("compactdefaultargs") SortResult;
		%feature("autodoc", "	* Internal method. Sort the result on the Curve parameter.

	:rtype: None
") SortResult;
		void SortResult ();
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
};


%extend IntCurvesFace_ShapeIntersector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
