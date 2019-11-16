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
%define INTCURVESFACEDOCSTRING
"IntCurvesFace module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_IntCurvesFace.html"
%enddef
%module (package="OCC.Core", docstring=INTCURVESFACEDOCSTRING) IntCurvesFace


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
#include<IntCurvesFace_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Bnd_module.hxx>
#include<gp_module.hxx>
#include<TopAbs_module.hxx>
#include<TopoDS_module.hxx>
#include<Adaptor3d_module.hxx>
#include<GeomAbs_module.hxx>
#include<IntCurveSurface_module.hxx>
#include<TopLoc_module.hxx>
#include<IntSurf_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Bnd.i
%import gp.i
%import TopAbs.i
%import TopoDS.i
%import Adaptor3d.i
%import GeomAbs.i
%import IntCurveSurface.i
/* public enums */
/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

%nodefaultctor IntCurvesFace_Intersector;
class IntCurvesFace_Intersector {
	public:
		%feature("compactdefaultargs") Bounding;
		%feature("autodoc", "	:rtype: Bnd_Box
") Bounding;
		Bnd_Box Bounding ();
		%feature("compactdefaultargs") ClassifyUVPoint;
		%feature("autodoc", "	:param Puv:
	:type Puv: gp_Pnt2d
	:rtype: TopAbs_State
") ClassifyUVPoint;
		TopAbs_State ClassifyUVPoint (const gp_Pnt2d & Puv);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "	* Returns the significant face used to determine the intersection.

	:rtype: TopoDS_Face
") Face;
		const TopoDS_Face  Face ();
		%feature("compactdefaultargs") GetUseBoundToler;
		%feature("autodoc", "	* Returns the boundary tolerance flag

	:rtype: bool
") GetUseBoundToler;
		Standard_Boolean GetUseBoundToler ();
		%feature("compactdefaultargs") IntCurvesFace_Intersector;
		%feature("autodoc", "	* Load a Face. //! The Tolerance <Tol> is used to determine if the first point of the segment is near the face. In that case, the parameter of the intersection point on the line can be a negative value (greater than -Tol). If aRestr = true UV bounding box of face is used to restrict it's underlined surface, otherwise surface is not restricted. If UseBToler = false then the 2d-point of intersection is classified with null-tolerance (relative to face); otherwise it's using maximium between input tolerance(aTol) and tolerances of face bounds (edges).

	:param F:
	:type F: TopoDS_Face &
	:param aTol:
	:type aTol: float
	:param aRestr: default value is Standard_True
	:type aRestr: bool
	:param UseBToler: default value is Standard_True
	:type UseBToler: bool
	:rtype: None
") IntCurvesFace_Intersector;
		 IntCurvesFace_Intersector (const TopoDS_Face & F,const Standard_Real aTol,const Standard_Boolean aRestr = Standard_True,const Standard_Boolean UseBToler = Standard_True);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* True is returned when the intersection have been computed.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "	* Returns true if curve is parallel or belongs face surface This case is recognized only for some pairs of analytical curves and surfaces (plane - line, ...)

	:rtype: bool
") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("compactdefaultargs") NbPnt;
		%feature("autodoc", "	:rtype: int
") NbPnt;
		Standard_Integer NbPnt ();
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
	:type HCu: opencascade::handle<Adaptor3d_HCurve> &
	:param PInf:
	:type PInf: float
	:param PSup:
	:type PSup: float
	:rtype: None
") Perform;
		void Perform (const opencascade::handle<Adaptor3d_HCurve> & HCu,const Standard_Real PInf,const Standard_Real PSup);
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "	* Returns the geometric point of the ith intersection between the line and the surface.

	:param I:
	:type I: int
	:rtype: gp_Pnt
") Pnt;
		const gp_Pnt  Pnt (const Standard_Integer I);
		%feature("compactdefaultargs") SetUseBoundToler;
		%feature("autodoc", "	* Sets the boundary tolerance flag

	:param UseBToler:
	:type UseBToler: bool
	:rtype: None
") SetUseBoundToler;
		void SetUseBoundToler (Standard_Boolean UseBToler);
		%feature("compactdefaultargs") State;
		%feature("autodoc", "	* Returns the ith state of the point on the face. The values can be either TopAbs_IN ( the point is in the face) or TopAbs_ON ( the point is on a boudary of the face).

	:param I:
	:type I: int
	:rtype: TopAbs_State
") State;
		TopAbs_State State (const Standard_Integer I);
		%feature("compactdefaultargs") SurfaceType;
		%feature("autodoc", "	* Return the surface type

	:rtype: GeomAbs_SurfaceType
") SurfaceType;
		GeomAbs_SurfaceType SurfaceType ();
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "	* Returns the ith transition of the line on the surface.

	:param I:
	:type I: int
	:rtype: IntCurveSurface_TransitionOnCurve
") Transition;
		IntCurveSurface_TransitionOnCurve Transition (const Standard_Integer I);
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
};


%extend IntCurvesFace_Intersector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntCurvesFace_ShapeIntersector;
class IntCurvesFace_ShapeIntersector {
	public:
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "	* Returns the significant face used to determine the intersection.

	:param I:
	:type I: int
	:rtype: TopoDS_Face
") Face;
		const TopoDS_Face  Face (const Standard_Integer I);
		%feature("compactdefaultargs") IntCurvesFace_ShapeIntersector;
		%feature("autodoc", "	:rtype: None
") IntCurvesFace_ShapeIntersector;
		 IntCurvesFace_ShapeIntersector ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* True is returned when the intersection have been computed.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	:param Sh:
	:type Sh: TopoDS_Shape &
	:param Tol:
	:type Tol: float
	:rtype: None
") Load;
		void Load (const TopoDS_Shape & Sh,const Standard_Real Tol);
		%feature("compactdefaultargs") NbPnt;
		%feature("autodoc", "	:rtype: int
") NbPnt;
		Standard_Integer NbPnt ();
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
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* same method for a HCurve from Adaptor3d. PInf an PSup can also be - and + INF.

	:param HCu:
	:type HCu: opencascade::handle<Adaptor3d_HCurve> &
	:param PInf:
	:type PInf: float
	:param PSup:
	:type PSup: float
	:rtype: None
") Perform;
		void Perform (const opencascade::handle<Adaptor3d_HCurve> & HCu,const Standard_Real PInf,const Standard_Real PSup);
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
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "	* Returns the geometric point of the ith intersection between the line and the surface.

	:param I:
	:type I: int
	:rtype: gp_Pnt
") Pnt;
		const gp_Pnt  Pnt (const Standard_Integer I);
		%feature("compactdefaultargs") SortResult;
		%feature("autodoc", "	* Internal method. Sort the result on the Curve parameter.

	:rtype: None
") SortResult;
		void SortResult ();
		%feature("compactdefaultargs") State;
		%feature("autodoc", "	* Returns the ith state of the point on the face. The values can be either TopAbs_IN ( the point is in the face) or TopAbs_ON ( the point is on a boudary of the face).

	:param I:
	:type I: int
	:rtype: TopAbs_State
") State;
		TopAbs_State State (const Standard_Integer I);
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "	* Returns the ith transition of the line on the surface.

	:param I:
	:type I: int
	:rtype: IntCurveSurface_TransitionOnCurve
") Transition;
		IntCurveSurface_TransitionOnCurve Transition (const Standard_Integer I);
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
};


%extend IntCurvesFace_ShapeIntersector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
