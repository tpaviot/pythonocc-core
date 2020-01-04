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
%define GEOMADAPTORDOCSTRING
"GeomAdaptor module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_geomadaptor.html"
%enddef
%module (package="OCC.Core", docstring=GEOMADAPTORDOCSTRING) GeomAdaptor


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
#include<GeomAdaptor_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Geom_module.hxx>
#include<gp_module.hxx>
#include<GeomAbs_module.hxx>
#include<TColStd_module.hxx>
#include<Geom2d_module.hxx>
#include<Adaptor2d_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Adaptor3d.i
%import Geom.i
%import gp.i
%import GeomAbs.i
%import TColStd.i
/* public enums */
/* end public enums declaration */

/* handles */
%wrap_handle(GeomAdaptor_GHCurve)
%wrap_handle(GeomAdaptor_GHSurface)
%wrap_handle(GeomAdaptor_HSurfaceOfLinearExtrusion)
%wrap_handle(GeomAdaptor_HSurfaceOfRevolution)
%wrap_handle(GeomAdaptor_HCurve)
%wrap_handle(GeomAdaptor_HSurface)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/********************
* class GeomAdaptor *
********************/
%rename(geomadaptor) GeomAdaptor;
class GeomAdaptor {
	public:
		/****************** MakeCurve ******************/
		%feature("compactdefaultargs") MakeCurve;
		%feature("autodoc", "* Inherited from GHCurve. Provides a curve handled by reference. Build a Geom_Curve using the informations from the Curve from Adaptor3d
	:param C:
	:type C: Adaptor3d_Curve
	:rtype: opencascade::handle<Geom_Curve>") MakeCurve;
		static opencascade::handle<Geom_Curve> MakeCurve (const Adaptor3d_Curve & C);

		/****************** MakeSurface ******************/
		%feature("compactdefaultargs") MakeSurface;
		%feature("autodoc", "* Build a Geom_Surface using the informations from the Surface from Adaptor3d @param theS - Surface adaptor to convert. @param theTrimFlag - True if perform trim surface values by adaptor and false otherwise.
	:param theS:
	:type theS: Adaptor3d_Surface
	:param theTrimFlag: default value is Standard_True
	:type theTrimFlag: bool
	:rtype: opencascade::handle<Geom_Surface>") MakeSurface;
		static opencascade::handle<Geom_Surface> MakeSurface (const Adaptor3d_Surface & theS,const Standard_Boolean theTrimFlag = Standard_True);

};


%extend GeomAdaptor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class GeomAdaptor_Curve *
**************************/
class GeomAdaptor_Curve : public Adaptor3d_Curve {
	public:
		/****************** BSpline ******************/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "* this will NOT make a copy of the BSpline Curve : If you want to modify the Curve please make a copy yourself Also it will NOT trim the surface to myFirst/Last.
	:rtype: opencascade::handle<Geom_BSplineCurve>") BSpline;
		opencascade::handle<Geom_BSplineCurve> BSpline ();

		/****************** Bezier ******************/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "* this will NOT make a copy of the Bezier Curve : If you want to modify the Curve please make a copy yourself Also it will NOT trim the surface to myFirst/Last.
	:rtype: opencascade::handle<Geom_BezierCurve>") Bezier;
		opencascade::handle<Geom_BezierCurve> Bezier ();

		/****************** Circle ******************/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", ":rtype: gp_Circ") Circle;
		gp_Circ Circle ();

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", ":rtype: GeomAbs_Shape") Continuity;
		GeomAbs_Shape Continuity ();

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "* Provides a curve inherited from Hcurve from Adaptor. This is inherited to provide easy to use constructors.
	:rtype: opencascade::handle<Geom_Curve>") Curve;
		const opencascade::handle<Geom_Curve> & Curve ();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "* Computes the point of parameter U.
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: None") D0;
		void D0 (const Standard_Real U,gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "* Computes the point of parameter U on the curve with its first derivative. //! Warning : On the specific case of BSplineCurve: if the curve is cut in interval of continuity at least C1, the derivatives are computed on the current interval. else the derivatives are computed on the basis curve.
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Vec
	:rtype: None") D1;
		void D1 (const Standard_Real U,gp_Pnt & P,gp_Vec & V);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "* Returns the point P of parameter U, the first and second derivatives V1 and V2. //! Warning : On the specific case of BSplineCurve: if the curve is cut in interval of continuity at least C2, the derivatives are computed on the current interval. else the derivatives are computed on the basis curve.
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: None") D2;
		void D2 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "* Returns the point P of parameter U, the first, the second and the third derivative. //! Warning : On the specific case of BSplineCurve: if the curve is cut in interval of continuity at least C3, the derivatives are computed on the current interval. else the derivatives are computed on the basis curve.
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:param V3:
	:type V3: gp_Vec
	:rtype: None") D3;
		void D3 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "* The returned vector gives the value of the derivative for the order of derivation N. Warning : On the specific case of BSplineCurve: if the curve is cut in interval of continuity CN, the derivatives are computed on the current interval. else the derivatives are computed on the basis curve. Raised if N < 1.
	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Integer N);

		/****************** Degree ******************/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "* this should NEVER make a copy of the underlying curve to read the relevant information
	:rtype: int") Degree;
		Standard_Integer Degree ();

		/****************** Ellipse ******************/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", ":rtype: gp_Elips") Ellipse;
		gp_Elips Ellipse ();

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", ":rtype: float") FirstParameter;
		Standard_Real FirstParameter ();

		/****************** GeomAdaptor_Curve ******************/
		%feature("compactdefaultargs") GeomAdaptor_Curve;
		%feature("autodoc", ":rtype: None") GeomAdaptor_Curve;
		 GeomAdaptor_Curve ();

		/****************** GeomAdaptor_Curve ******************/
		%feature("compactdefaultargs") GeomAdaptor_Curve;
		%feature("autodoc", ":param C:
	:type C: Geom_Curve
	:rtype: None") GeomAdaptor_Curve;
		 GeomAdaptor_Curve (const opencascade::handle<Geom_Curve> & C);

		/****************** GeomAdaptor_Curve ******************/
		%feature("compactdefaultargs") GeomAdaptor_Curve;
		%feature("autodoc", "* ConstructionError is raised if Ufirst>Ulast
	:param C:
	:type C: Geom_Curve
	:param UFirst:
	:type UFirst: float
	:param ULast:
	:type ULast: float
	:rtype: None") GeomAdaptor_Curve;
		 GeomAdaptor_Curve (const opencascade::handle<Geom_Curve> & C,const Standard_Real UFirst,const Standard_Real ULast);

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", ":rtype: GeomAbs_CurveType") GetType;
		GeomAbs_CurveType GetType ();

		/****************** Hyperbola ******************/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", ":rtype: gp_Hypr") Hyperbola;
		gp_Hypr Hyperbola ();

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()
	:param T:
	:type T: TColStd_Array1OfReal
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", ":rtype: bool") IsClosed;
		Standard_Boolean IsClosed ();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", ":rtype: bool") IsPeriodic;
		Standard_Boolean IsPeriodic ();

		/****************** IsRational ******************/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "* this should NEVER make a copy of the underlying curve to read the relevant information
	:rtype: bool") IsRational;
		Standard_Boolean IsRational ();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", ":rtype: float") LastParameter;
		Standard_Real LastParameter ();

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", ":rtype: gp_Lin") Line;
		gp_Lin Line ();

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", ":param C:
	:type C: Geom_Curve
	:rtype: None") Load;
		void Load (const opencascade::handle<Geom_Curve> & C);

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "* ConstructionError is raised if Ufirst>Ulast
	:param C:
	:type C: Geom_Curve
	:param UFirst:
	:type UFirst: float
	:param ULast:
	:type ULast: float
	:rtype: None") Load;
		void Load (const opencascade::handle<Geom_Curve> & C,const Standard_Real UFirst,const Standard_Real ULast);

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>
	:param S:
	:type S: GeomAbs_Shape
	:rtype: int") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);

		/****************** NbKnots ******************/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "* this should NEVER make a copy of the underlying curve to read the relevant information
	:rtype: int") NbKnots;
		Standard_Integer NbKnots ();

		/****************** NbPoles ******************/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "* this should NEVER make a copy of the underlying curve to read the relevant information
	:rtype: int") NbPoles;
		Standard_Integer NbPoles ();

		/****************** OffsetCurve ******************/
		%feature("compactdefaultargs") OffsetCurve;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_OffsetCurve>") OffsetCurve;
		opencascade::handle<Geom_OffsetCurve> OffsetCurve ();

		/****************** Parabola ******************/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", ":rtype: gp_Parab") Parabola;
		gp_Parab Parabola ();

		/****************** Period ******************/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", ":rtype: float") Period;
		Standard_Real Period ();

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "* Reset currently loaded curve (undone Load()).
	:rtype: None") Reset;
		void Reset ();

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "* returns the parametric resolution
	:param R3d:
	:type R3d: float
	:rtype: float") Resolution;
		Standard_Real Resolution (const Standard_Real R3d);

		/****************** Trim ******************/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "* Returns a curve equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: opencascade::handle<Adaptor3d_HCurve>") Trim;
		opencascade::handle<Adaptor3d_HCurve> Trim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Computes the point of parameter U on the curve
	:param U:
	:type U: float
	:rtype: gp_Pnt") Value;
		gp_Pnt Value (const Standard_Real U);

};


%extend GeomAdaptor_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class GeomAdaptor_GHCurve *
****************************/
class GeomAdaptor_GHCurve : public Adaptor3d_HCurve {
	public:
		/****************** ChangeCurve ******************/
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "* Returns the curve used to create the GenHCurve.
	:rtype: GeomAdaptor_Curve") ChangeCurve;
		GeomAdaptor_Curve & ChangeCurve ();

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "* Returns the curve used to create the GenHCurve. This is redefined from HCurve, cannot be inline.
	:rtype: Adaptor3d_Curve") Curve;
		const Adaptor3d_Curve & Curve ();

		/****************** GeomAdaptor_GHCurve ******************/
		%feature("compactdefaultargs") GeomAdaptor_GHCurve;
		%feature("autodoc", "* Creates an empty GenHCurve.
	:rtype: None") GeomAdaptor_GHCurve;
		 GeomAdaptor_GHCurve ();

		/****************** GeomAdaptor_GHCurve ******************/
		%feature("compactdefaultargs") GeomAdaptor_GHCurve;
		%feature("autodoc", "* Creates a GenHCurve from a Curve
	:param C:
	:type C: GeomAdaptor_Curve
	:rtype: None") GeomAdaptor_GHCurve;
		 GeomAdaptor_GHCurve (const GeomAdaptor_Curve & C);

		/****************** GetCurve ******************/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "* Returns the curve used to create the GenHCurve. This is redefined from HCurve, cannot be inline.
	:rtype: Adaptor3d_Curve") GetCurve;
		Adaptor3d_Curve & GetCurve ();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Sets the field of the GenHCurve.
	:param C:
	:type C: GeomAdaptor_Curve
	:rtype: None") Set;
		void Set (const GeomAdaptor_Curve & C);

};


%make_alias(GeomAdaptor_GHCurve)

%extend GeomAdaptor_GHCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class GeomAdaptor_GHSurface *
******************************/
class GeomAdaptor_GHSurface : public Adaptor3d_HSurface {
	public:
		/****************** ChangeSurface ******************/
		%feature("compactdefaultargs") ChangeSurface;
		%feature("autodoc", "* Returns the surface used to create the GenHSurface.
	:rtype: GeomAdaptor_Surface") ChangeSurface;
		GeomAdaptor_Surface & ChangeSurface ();

		/****************** GeomAdaptor_GHSurface ******************/
		%feature("compactdefaultargs") GeomAdaptor_GHSurface;
		%feature("autodoc", "* Creates an empty GenHSurface.
	:rtype: None") GeomAdaptor_GHSurface;
		 GeomAdaptor_GHSurface ();

		/****************** GeomAdaptor_GHSurface ******************/
		%feature("compactdefaultargs") GeomAdaptor_GHSurface;
		%feature("autodoc", "* Creates a GenHSurface from a Surface.
	:param S:
	:type S: GeomAdaptor_Surface
	:rtype: None") GeomAdaptor_GHSurface;
		 GeomAdaptor_GHSurface (const GeomAdaptor_Surface & S);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Sets the field of the GenHSurface.
	:param S:
	:type S: GeomAdaptor_Surface
	:rtype: None") Set;
		void Set (const GeomAdaptor_Surface & S);

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "* Returns a reference to the Surface inside the HSurface. This is redefined from HSurface, cannot be inline.
	:rtype: Adaptor3d_Surface") Surface;
		const Adaptor3d_Surface & Surface ();

};


%make_alias(GeomAdaptor_GHSurface)

%extend GeomAdaptor_GHSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class GeomAdaptor_HSurfaceOfLinearExtrusion *
**********************************************/
class GeomAdaptor_HSurfaceOfLinearExtrusion : public Adaptor3d_HSurface {
	public:
		/****************** ChangeSurface ******************/
		%feature("compactdefaultargs") ChangeSurface;
		%feature("autodoc", "* Returns the surface used to create the GenHSurface.
	:rtype: GeomAdaptor_SurfaceOfLinearExtrusion") ChangeSurface;
		GeomAdaptor_SurfaceOfLinearExtrusion & ChangeSurface ();

		/****************** GeomAdaptor_HSurfaceOfLinearExtrusion ******************/
		%feature("compactdefaultargs") GeomAdaptor_HSurfaceOfLinearExtrusion;
		%feature("autodoc", "* Creates an empty GenHSurface.
	:rtype: None") GeomAdaptor_HSurfaceOfLinearExtrusion;
		 GeomAdaptor_HSurfaceOfLinearExtrusion ();

		/****************** GeomAdaptor_HSurfaceOfLinearExtrusion ******************/
		%feature("compactdefaultargs") GeomAdaptor_HSurfaceOfLinearExtrusion;
		%feature("autodoc", "* Creates a GenHSurface from a Surface.
	:param S:
	:type S: GeomAdaptor_SurfaceOfLinearExtrusion
	:rtype: None") GeomAdaptor_HSurfaceOfLinearExtrusion;
		 GeomAdaptor_HSurfaceOfLinearExtrusion (const GeomAdaptor_SurfaceOfLinearExtrusion & S);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Sets the field of the GenHSurface.
	:param S:
	:type S: GeomAdaptor_SurfaceOfLinearExtrusion
	:rtype: None") Set;
		void Set (const GeomAdaptor_SurfaceOfLinearExtrusion & S);

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "* Returns a reference to the Surface inside the HSurface. This is redefined from HSurface, cannot be inline.
	:rtype: Adaptor3d_Surface") Surface;
		const Adaptor3d_Surface & Surface ();

};


%make_alias(GeomAdaptor_HSurfaceOfLinearExtrusion)

%extend GeomAdaptor_HSurfaceOfLinearExtrusion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class GeomAdaptor_HSurfaceOfRevolution *
*****************************************/
class GeomAdaptor_HSurfaceOfRevolution : public Adaptor3d_HSurface {
	public:
		/****************** ChangeSurface ******************/
		%feature("compactdefaultargs") ChangeSurface;
		%feature("autodoc", "* Returns the surface used to create the GenHSurface.
	:rtype: GeomAdaptor_SurfaceOfRevolution") ChangeSurface;
		GeomAdaptor_SurfaceOfRevolution & ChangeSurface ();

		/****************** GeomAdaptor_HSurfaceOfRevolution ******************/
		%feature("compactdefaultargs") GeomAdaptor_HSurfaceOfRevolution;
		%feature("autodoc", "* Creates an empty GenHSurface.
	:rtype: None") GeomAdaptor_HSurfaceOfRevolution;
		 GeomAdaptor_HSurfaceOfRevolution ();

		/****************** GeomAdaptor_HSurfaceOfRevolution ******************/
		%feature("compactdefaultargs") GeomAdaptor_HSurfaceOfRevolution;
		%feature("autodoc", "* Creates a GenHSurface from a Surface.
	:param S:
	:type S: GeomAdaptor_SurfaceOfRevolution
	:rtype: None") GeomAdaptor_HSurfaceOfRevolution;
		 GeomAdaptor_HSurfaceOfRevolution (const GeomAdaptor_SurfaceOfRevolution & S);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Sets the field of the GenHSurface.
	:param S:
	:type S: GeomAdaptor_SurfaceOfRevolution
	:rtype: None") Set;
		void Set (const GeomAdaptor_SurfaceOfRevolution & S);

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "* Returns a reference to the Surface inside the HSurface. This is redefined from HSurface, cannot be inline.
	:rtype: Adaptor3d_Surface") Surface;
		const Adaptor3d_Surface & Surface ();

};


%make_alias(GeomAdaptor_HSurfaceOfRevolution)

%extend GeomAdaptor_HSurfaceOfRevolution {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class GeomAdaptor_Surface *
****************************/
class GeomAdaptor_Surface : public Adaptor3d_Surface {
	public:
		/****************** AxeOfRevolution ******************/
		%feature("compactdefaultargs") AxeOfRevolution;
		%feature("autodoc", ":rtype: gp_Ax1") AxeOfRevolution;
		gp_Ax1 AxeOfRevolution ();

		/****************** BSpline ******************/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "* This will NOT make a copy of the BSpline Surface : If you want to modify the Surface please make a copy yourself Also it will NOT trim the surface to myU/VFirst/Last.
	:rtype: opencascade::handle<Geom_BSplineSurface>") BSpline;
		opencascade::handle<Geom_BSplineSurface> BSpline ();

		/****************** BasisCurve ******************/
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", ":rtype: opencascade::handle<Adaptor3d_HCurve>") BasisCurve;
		opencascade::handle<Adaptor3d_HCurve> BasisCurve ();

		/****************** BasisSurface ******************/
		%feature("compactdefaultargs") BasisSurface;
		%feature("autodoc", ":rtype: opencascade::handle<Adaptor3d_HSurface>") BasisSurface;
		opencascade::handle<Adaptor3d_HSurface> BasisSurface ();

		/****************** Bezier ******************/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "* This will NOT make a copy of the Bezier Surface : If you want to modify the Surface please make a copy yourself Also it will NOT trim the surface to myU/VFirst/Last.
	:rtype: opencascade::handle<Geom_BezierSurface>") Bezier;
		opencascade::handle<Geom_BezierSurface> Bezier ();

		/****************** Cone ******************/
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", ":rtype: gp_Cone") Cone;
		gp_Cone Cone ();

		/****************** Cylinder ******************/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", ":rtype: gp_Cylinder") Cylinder;
		gp_Cylinder Cylinder ();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "* Computes the point of parameters U,V on the surface.
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:rtype: None") D0;
		void D0 (const Standard_Real U,const Standard_Real V,gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "* Computes the point and the first derivatives on the surface. //! Warning : On the specific case of BSplineSurface: if the surface is cut in interval of continuity at least C1, the derivatives are computed on the current interval. else the derivatives are computed on the basis surface.
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:param D1U:
	:type D1U: gp_Vec
	:param D1V:
	:type D1V: gp_Vec
	:rtype: None") D1;
		void D1 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "* Computes the point, the first and second derivatives on the surface. //! Warning : On the specific case of BSplineSurface: if the surface is cut in interval of continuity at least C2, the derivatives are computed on the current interval. else the derivatives are computed on the basis surface.
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:param D1U:
	:type D1U: gp_Vec
	:param D1V:
	:type D1V: gp_Vec
	:param D2U:
	:type D2U: gp_Vec
	:param D2V:
	:type D2V: gp_Vec
	:param D2UV:
	:type D2UV: gp_Vec
	:rtype: None") D2;
		void D2 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "* Computes the point, the first, second and third derivatives on the surface. //! Warning : On the specific case of BSplineSurface: if the surface is cut in interval of continuity at least C3, the derivatives are computed on the current interval. else the derivatives are computed on the basis surface.
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:param D1U:
	:type D1U: gp_Vec
	:param D1V:
	:type D1V: gp_Vec
	:param D2U:
	:type D2U: gp_Vec
	:param D2V:
	:type D2V: gp_Vec
	:param D2UV:
	:type D2UV: gp_Vec
	:param D3U:
	:type D3U: gp_Vec
	:param D3V:
	:type D3V: gp_Vec
	:param D3UUV:
	:type D3UUV: gp_Vec
	:param D3UVV:
	:type D3UVV: gp_Vec
	:rtype: None") D3;
		void D3 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV,gp_Vec & D3U,gp_Vec & D3V,gp_Vec & D3UUV,gp_Vec & D3UVV);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "* Computes the derivative of order Nu in the direction U and Nv in the direction V at the point P(U, V). //! Warning : On the specific case of BSplineSurface: if the surface is cut in interval of continuity CN, the derivatives are computed on the current interval. else the derivatives are computed on the basis surface. Raised if Nu + Nv < 1 or Nu < 0 or Nv < 0.
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Nu:
	:type Nu: int
	:param Nv:
	:type Nv: int
	:rtype: gp_Vec") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Real V,const Standard_Integer Nu,const Standard_Integer Nv);

		/****************** Direction ******************/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", ":rtype: gp_Dir") Direction;
		gp_Dir Direction ();

		/****************** FirstUParameter ******************/
		%feature("compactdefaultargs") FirstUParameter;
		%feature("autodoc", ":rtype: float") FirstUParameter;
		Standard_Real FirstUParameter ();

		/****************** FirstVParameter ******************/
		%feature("compactdefaultargs") FirstVParameter;
		%feature("autodoc", ":rtype: float") FirstVParameter;
		Standard_Real FirstVParameter ();

		/****************** GeomAdaptor_Surface ******************/
		%feature("compactdefaultargs") GeomAdaptor_Surface;
		%feature("autodoc", ":rtype: None") GeomAdaptor_Surface;
		 GeomAdaptor_Surface ();

		/****************** GeomAdaptor_Surface ******************/
		%feature("compactdefaultargs") GeomAdaptor_Surface;
		%feature("autodoc", ":param S:
	:type S: Geom_Surface
	:rtype: None") GeomAdaptor_Surface;
		 GeomAdaptor_Surface (const opencascade::handle<Geom_Surface> & S);

		/****************** GeomAdaptor_Surface ******************/
		%feature("compactdefaultargs") GeomAdaptor_Surface;
		%feature("autodoc", "* ConstructionError is raised if UFirst>ULast or VFirst>VLast
	:param S:
	:type S: Geom_Surface
	:param UFirst:
	:type UFirst: float
	:param ULast:
	:type ULast: float
	:param VFirst:
	:type VFirst: float
	:param VLast:
	:type VLast: float
	:param TolU: default value is 0.0
	:type TolU: float
	:param TolV: default value is 0.0
	:type TolV: float
	:rtype: None") GeomAdaptor_Surface;
		 GeomAdaptor_Surface (const opencascade::handle<Geom_Surface> & S,const Standard_Real UFirst,const Standard_Real ULast,const Standard_Real VFirst,const Standard_Real VLast,const Standard_Real TolU = 0.0,const Standard_Real TolV = 0.0);

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "* Returns the type of the surface : Plane, Cylinder, Cone, Sphere, Torus, BezierSurface, BSplineSurface, SurfaceOfRevolution, SurfaceOfExtrusion, OtherSurface
	:rtype: GeomAbs_SurfaceType") GetType;
		GeomAbs_SurfaceType GetType ();

		/****************** IsUClosed ******************/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", ":rtype: bool") IsUClosed;
		Standard_Boolean IsUClosed ();

		/****************** IsUPeriodic ******************/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", ":rtype: bool") IsUPeriodic;
		Standard_Boolean IsUPeriodic ();

		/****************** IsURational ******************/
		%feature("compactdefaultargs") IsURational;
		%feature("autodoc", ":rtype: bool") IsURational;
		Standard_Boolean IsURational ();

		/****************** IsVClosed ******************/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", ":rtype: bool") IsVClosed;
		Standard_Boolean IsVClosed ();

		/****************** IsVPeriodic ******************/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", ":rtype: bool") IsVPeriodic;
		Standard_Boolean IsVPeriodic ();

		/****************** IsVRational ******************/
		%feature("compactdefaultargs") IsVRational;
		%feature("autodoc", ":rtype: bool") IsVRational;
		Standard_Boolean IsVRational ();

		/****************** LastUParameter ******************/
		%feature("compactdefaultargs") LastUParameter;
		%feature("autodoc", ":rtype: float") LastUParameter;
		Standard_Real LastUParameter ();

		/****************** LastVParameter ******************/
		%feature("compactdefaultargs") LastVParameter;
		%feature("autodoc", ":rtype: float") LastVParameter;
		Standard_Real LastVParameter ();

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", ":param S:
	:type S: Geom_Surface
	:rtype: None") Load;
		void Load (const opencascade::handle<Geom_Surface> & S);

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "* ConstructionError is raised if UFirst>ULast or VFirst>VLast
	:param S:
	:type S: Geom_Surface
	:param UFirst:
	:type UFirst: float
	:param ULast:
	:type ULast: float
	:param VFirst:
	:type VFirst: float
	:param VLast:
	:type VLast: float
	:param TolU: default value is 0.0
	:type TolU: float
	:param TolV: default value is 0.0
	:type TolV: float
	:rtype: None") Load;
		void Load (const opencascade::handle<Geom_Surface> & S,const Standard_Real UFirst,const Standard_Real ULast,const Standard_Real VFirst,const Standard_Real VLast,const Standard_Real TolU = 0.0,const Standard_Real TolV = 0.0);

		/****************** NbUIntervals ******************/
		%feature("compactdefaultargs") NbUIntervals;
		%feature("autodoc", "* Returns the number of U intervals for continuity <S>. May be one if UContinuity(me) >= <S>
	:param S:
	:type S: GeomAbs_Shape
	:rtype: int") NbUIntervals;
		Standard_Integer NbUIntervals (const GeomAbs_Shape S);

		/****************** NbUKnots ******************/
		%feature("compactdefaultargs") NbUKnots;
		%feature("autodoc", ":rtype: int") NbUKnots;
		Standard_Integer NbUKnots ();

		/****************** NbUPoles ******************/
		%feature("compactdefaultargs") NbUPoles;
		%feature("autodoc", ":rtype: int") NbUPoles;
		Standard_Integer NbUPoles ();

		/****************** NbVIntervals ******************/
		%feature("compactdefaultargs") NbVIntervals;
		%feature("autodoc", "* Returns the number of V intervals for continuity <S>. May be one if VContinuity(me) >= <S>
	:param S:
	:type S: GeomAbs_Shape
	:rtype: int") NbVIntervals;
		Standard_Integer NbVIntervals (const GeomAbs_Shape S);

		/****************** NbVKnots ******************/
		%feature("compactdefaultargs") NbVKnots;
		%feature("autodoc", ":rtype: int") NbVKnots;
		Standard_Integer NbVKnots ();

		/****************** NbVPoles ******************/
		%feature("compactdefaultargs") NbVPoles;
		%feature("autodoc", ":rtype: int") NbVPoles;
		Standard_Integer NbVPoles ();

		/****************** OffsetValue ******************/
		%feature("compactdefaultargs") OffsetValue;
		%feature("autodoc", ":rtype: float") OffsetValue;
		Standard_Real OffsetValue ();

		/****************** Plane ******************/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", ":rtype: gp_Pln") Plane;
		gp_Pln Plane ();

		/****************** Sphere ******************/
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", ":rtype: gp_Sphere") Sphere;
		gp_Sphere Sphere ();

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_Surface>") Surface;
		const opencascade::handle<Geom_Surface> & Surface ();

		/****************** Torus ******************/
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", ":rtype: gp_Torus") Torus;
		gp_Torus Torus ();

		/****************** UContinuity ******************/
		%feature("compactdefaultargs") UContinuity;
		%feature("autodoc", ":rtype: GeomAbs_Shape") UContinuity;
		GeomAbs_Shape UContinuity ();

		/****************** UDegree ******************/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", ":rtype: int") UDegree;
		Standard_Integer UDegree ();

		/****************** UIntervals ******************/
		%feature("compactdefaultargs") UIntervals;
		%feature("autodoc", "* Returns the intervals with the requested continuity in the U direction.
	:param T:
	:type T: TColStd_Array1OfReal
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None") UIntervals;
		void UIntervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);

		/****************** UPeriod ******************/
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", ":rtype: float") UPeriod;
		Standard_Real UPeriod ();

		/****************** UResolution ******************/
		%feature("compactdefaultargs") UResolution;
		%feature("autodoc", "* Returns the parametric U resolution corresponding to the real space resolution <R3d>.
	:param R3d:
	:type R3d: float
	:rtype: float") UResolution;
		Standard_Real UResolution (const Standard_Real R3d);

		/****************** UTrim ******************/
		%feature("compactdefaultargs") UTrim;
		%feature("autodoc", "* Returns a surface trimmed in the U direction equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: opencascade::handle<Adaptor3d_HSurface>") UTrim;
		opencascade::handle<Adaptor3d_HSurface> UTrim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);

		/****************** VContinuity ******************/
		%feature("compactdefaultargs") VContinuity;
		%feature("autodoc", ":rtype: GeomAbs_Shape") VContinuity;
		GeomAbs_Shape VContinuity ();

		/****************** VDegree ******************/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", ":rtype: int") VDegree;
		Standard_Integer VDegree ();

		/****************** VIntervals ******************/
		%feature("compactdefaultargs") VIntervals;
		%feature("autodoc", "* Returns the intervals with the requested continuity in the V direction.
	:param T:
	:type T: TColStd_Array1OfReal
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None") VIntervals;
		void VIntervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);

		/****************** VPeriod ******************/
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", ":rtype: float") VPeriod;
		Standard_Real VPeriod ();

		/****************** VResolution ******************/
		%feature("compactdefaultargs") VResolution;
		%feature("autodoc", "* Returns the parametric V resolution corresponding to the real space resolution <R3d>.
	:param R3d:
	:type R3d: float
	:rtype: float") VResolution;
		Standard_Real VResolution (const Standard_Real R3d);

		/****************** VTrim ******************/
		%feature("compactdefaultargs") VTrim;
		%feature("autodoc", "* Returns a surface trimmed in the V direction between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: opencascade::handle<Adaptor3d_HSurface>") VTrim;
		opencascade::handle<Adaptor3d_HSurface> VTrim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Computes the point of parameters U,V on the surface.
	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: gp_Pnt") Value;
		gp_Pnt Value (const Standard_Real U,const Standard_Real V);

};


%extend GeomAdaptor_Surface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class GeomAdaptor_HCurve *
***************************/
class GeomAdaptor_HCurve : public GeomAdaptor_GHCurve {
	public:
		/****************** GeomAdaptor_HCurve ******************/
		%feature("compactdefaultargs") GeomAdaptor_HCurve;
		%feature("autodoc", ":rtype: None") GeomAdaptor_HCurve;
		 GeomAdaptor_HCurve ();

		/****************** GeomAdaptor_HCurve ******************/
		%feature("compactdefaultargs") GeomAdaptor_HCurve;
		%feature("autodoc", ":param AS:
	:type AS: GeomAdaptor_Curve
	:rtype: None") GeomAdaptor_HCurve;
		 GeomAdaptor_HCurve (const GeomAdaptor_Curve & AS);

		/****************** GeomAdaptor_HCurve ******************/
		%feature("compactdefaultargs") GeomAdaptor_HCurve;
		%feature("autodoc", ":param S:
	:type S: Geom_Curve
	:rtype: None") GeomAdaptor_HCurve;
		 GeomAdaptor_HCurve (const opencascade::handle<Geom_Curve> & S);

		/****************** GeomAdaptor_HCurve ******************/
		%feature("compactdefaultargs") GeomAdaptor_HCurve;
		%feature("autodoc", "* ConstructionError is raised if UFirst>ULast or VFirst>VLast
	:param S:
	:type S: Geom_Curve
	:param UFirst:
	:type UFirst: float
	:param ULast:
	:type ULast: float
	:rtype: None") GeomAdaptor_HCurve;
		 GeomAdaptor_HCurve (const opencascade::handle<Geom_Curve> & S,const Standard_Real UFirst,const Standard_Real ULast);

};


%make_alias(GeomAdaptor_HCurve)

%extend GeomAdaptor_HCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class GeomAdaptor_HSurface *
*****************************/
class GeomAdaptor_HSurface : public GeomAdaptor_GHSurface {
	public:
		/****************** GeomAdaptor_HSurface ******************/
		%feature("compactdefaultargs") GeomAdaptor_HSurface;
		%feature("autodoc", ":rtype: None") GeomAdaptor_HSurface;
		 GeomAdaptor_HSurface ();

		/****************** GeomAdaptor_HSurface ******************/
		%feature("compactdefaultargs") GeomAdaptor_HSurface;
		%feature("autodoc", ":param AS:
	:type AS: GeomAdaptor_Surface
	:rtype: None") GeomAdaptor_HSurface;
		 GeomAdaptor_HSurface (const GeomAdaptor_Surface & AS);

		/****************** GeomAdaptor_HSurface ******************/
		%feature("compactdefaultargs") GeomAdaptor_HSurface;
		%feature("autodoc", ":param S:
	:type S: Geom_Surface
	:rtype: None") GeomAdaptor_HSurface;
		 GeomAdaptor_HSurface (const opencascade::handle<Geom_Surface> & S);

		/****************** GeomAdaptor_HSurface ******************/
		%feature("compactdefaultargs") GeomAdaptor_HSurface;
		%feature("autodoc", "* ConstructionError is raised if UFirst>ULast or VFirst>VLast
	:param S:
	:type S: Geom_Surface
	:param UFirst:
	:type UFirst: float
	:param ULast:
	:type ULast: float
	:param VFirst:
	:type VFirst: float
	:param VLast:
	:type VLast: float
	:param TolU: default value is 0.0
	:type TolU: float
	:param TolV: default value is 0.0
	:type TolV: float
	:rtype: None") GeomAdaptor_HSurface;
		 GeomAdaptor_HSurface (const opencascade::handle<Geom_Surface> & S,const Standard_Real UFirst,const Standard_Real ULast,const Standard_Real VFirst,const Standard_Real VLast,const Standard_Real TolU = 0.0,const Standard_Real TolV = 0.0);

};


%make_alias(GeomAdaptor_HSurface)

%extend GeomAdaptor_HSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class GeomAdaptor_SurfaceOfLinearExtrusion *
*********************************************/
class GeomAdaptor_SurfaceOfLinearExtrusion : public GeomAdaptor_Surface {
	public:
		/****************** AxeOfRevolution ******************/
		%feature("compactdefaultargs") AxeOfRevolution;
		%feature("autodoc", ":rtype: gp_Ax1") AxeOfRevolution;
		gp_Ax1 AxeOfRevolution ();

		/****************** BSpline ******************/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_BSplineSurface>") BSpline;
		opencascade::handle<Geom_BSplineSurface> BSpline ();

		/****************** BasisCurve ******************/
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", ":rtype: opencascade::handle<Adaptor3d_HCurve>") BasisCurve;
		opencascade::handle<Adaptor3d_HCurve> BasisCurve ();

		/****************** Bezier ******************/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_BezierSurface>") Bezier;
		opencascade::handle<Geom_BezierSurface> Bezier ();

		/****************** Cone ******************/
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", ":rtype: gp_Cone") Cone;
		gp_Cone Cone ();

		/****************** Cylinder ******************/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", ":rtype: gp_Cylinder") Cylinder;
		gp_Cylinder Cylinder ();

		/****************** Direction ******************/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", ":rtype: gp_Dir") Direction;
		gp_Dir Direction ();

		/****************** FirstUParameter ******************/
		%feature("compactdefaultargs") FirstUParameter;
		%feature("autodoc", ":rtype: float") FirstUParameter;
		Standard_Real FirstUParameter ();

		/****************** FirstVParameter ******************/
		%feature("compactdefaultargs") FirstVParameter;
		%feature("autodoc", ":rtype: float") FirstVParameter;
		Standard_Real FirstVParameter ();

		/****************** GeomAdaptor_SurfaceOfLinearExtrusion ******************/
		%feature("compactdefaultargs") GeomAdaptor_SurfaceOfLinearExtrusion;
		%feature("autodoc", ":rtype: None") GeomAdaptor_SurfaceOfLinearExtrusion;
		 GeomAdaptor_SurfaceOfLinearExtrusion ();

		/****************** GeomAdaptor_SurfaceOfLinearExtrusion ******************/
		%feature("compactdefaultargs") GeomAdaptor_SurfaceOfLinearExtrusion;
		%feature("autodoc", "* The Curve is loaded.
	:param C:
	:type C: Adaptor3d_HCurve
	:rtype: None") GeomAdaptor_SurfaceOfLinearExtrusion;
		 GeomAdaptor_SurfaceOfLinearExtrusion (const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** GeomAdaptor_SurfaceOfLinearExtrusion ******************/
		%feature("compactdefaultargs") GeomAdaptor_SurfaceOfLinearExtrusion;
		%feature("autodoc", "* Thew Curve and the Direction are loaded.
	:param C:
	:type C: Adaptor3d_HCurve
	:param V:
	:type V: gp_Dir
	:rtype: None") GeomAdaptor_SurfaceOfLinearExtrusion;
		 GeomAdaptor_SurfaceOfLinearExtrusion (const opencascade::handle<Adaptor3d_HCurve> & C,const gp_Dir & V);

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "* Returns the type of the surface : Plane, Cylinder, Cone, Sphere, Torus, BezierSurface, BSplineSurface, SurfaceOfRevolution, SurfaceOfExtrusion, OtherSurface
	:rtype: GeomAbs_SurfaceType") GetType;
		GeomAbs_SurfaceType GetType ();

		/****************** IsUClosed ******************/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", ":rtype: bool") IsUClosed;
		Standard_Boolean IsUClosed ();

		/****************** IsUPeriodic ******************/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", ":rtype: bool") IsUPeriodic;
		Standard_Boolean IsUPeriodic ();

		/****************** IsURational ******************/
		%feature("compactdefaultargs") IsURational;
		%feature("autodoc", ":rtype: bool") IsURational;
		Standard_Boolean IsURational ();

		/****************** IsVClosed ******************/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", ":rtype: bool") IsVClosed;
		Standard_Boolean IsVClosed ();

		/****************** IsVPeriodic ******************/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", ":rtype: bool") IsVPeriodic;
		Standard_Boolean IsVPeriodic ();

		/****************** IsVRational ******************/
		%feature("compactdefaultargs") IsVRational;
		%feature("autodoc", ":rtype: bool") IsVRational;
		Standard_Boolean IsVRational ();

		/****************** LastUParameter ******************/
		%feature("compactdefaultargs") LastUParameter;
		%feature("autodoc", ":rtype: float") LastUParameter;
		Standard_Real LastUParameter ();

		/****************** LastVParameter ******************/
		%feature("compactdefaultargs") LastVParameter;
		%feature("autodoc", ":rtype: float") LastVParameter;
		Standard_Real LastVParameter ();

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "* Changes the Curve
	:param C:
	:type C: Adaptor3d_HCurve
	:rtype: None") Load;
		void Load (const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "* Changes the Direction
	:param V:
	:type V: gp_Dir
	:rtype: None") Load;
		void Load (const gp_Dir & V);

		/****************** NbUIntervals ******************/
		%feature("compactdefaultargs") NbUIntervals;
		%feature("autodoc", "* Returns the number of U intervals for continuity <S>. May be one if UContinuity(me) >= <S>
	:param S:
	:type S: GeomAbs_Shape
	:rtype: int") NbUIntervals;
		Standard_Integer NbUIntervals (const GeomAbs_Shape S);

		/****************** NbUPoles ******************/
		%feature("compactdefaultargs") NbUPoles;
		%feature("autodoc", ":rtype: int") NbUPoles;
		Standard_Integer NbUPoles ();

		/****************** NbVIntervals ******************/
		%feature("compactdefaultargs") NbVIntervals;
		%feature("autodoc", "* Returns the number of V intervals for continuity <S>. May be one if VContinuity(me) >= <S>
	:param S:
	:type S: GeomAbs_Shape
	:rtype: int") NbVIntervals;
		Standard_Integer NbVIntervals (const GeomAbs_Shape S);

		/****************** Plane ******************/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", ":rtype: gp_Pln") Plane;
		gp_Pln Plane ();

		/****************** Sphere ******************/
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", ":rtype: gp_Sphere") Sphere;
		gp_Sphere Sphere ();

		/****************** Torus ******************/
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", ":rtype: gp_Torus") Torus;
		gp_Torus Torus ();

		/****************** UContinuity ******************/
		%feature("compactdefaultargs") UContinuity;
		%feature("autodoc", ":rtype: GeomAbs_Shape") UContinuity;
		GeomAbs_Shape UContinuity ();

		/****************** UDegree ******************/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", ":rtype: int") UDegree;
		Standard_Integer UDegree ();

		/****************** UIntervals ******************/
		%feature("compactdefaultargs") UIntervals;
		%feature("autodoc", "* Returns the intervals with the requested continuity in the U direction.
	:param T:
	:type T: TColStd_Array1OfReal
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None") UIntervals;
		void UIntervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);

		/****************** UPeriod ******************/
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", ":rtype: float") UPeriod;
		Standard_Real UPeriod ();

		/****************** UResolution ******************/
		%feature("compactdefaultargs") UResolution;
		%feature("autodoc", "* Returns the parametric U resolution corresponding to the real space resolution <R3d>.
	:param R3d:
	:type R3d: float
	:rtype: float") UResolution;
		Standard_Real UResolution (const Standard_Real R3d);

		/****************** UTrim ******************/
		%feature("compactdefaultargs") UTrim;
		%feature("autodoc", "* Returns a surface trimmed in the U direction equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: opencascade::handle<Adaptor3d_HSurface>") UTrim;
		opencascade::handle<Adaptor3d_HSurface> UTrim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);

		/****************** VContinuity ******************/
		%feature("compactdefaultargs") VContinuity;
		%feature("autodoc", "* Return CN.
	:rtype: GeomAbs_Shape") VContinuity;
		GeomAbs_Shape VContinuity ();

		/****************** VIntervals ******************/
		%feature("compactdefaultargs") VIntervals;
		%feature("autodoc", "* Returns the intervals with the requested continuity in the V direction.
	:param T:
	:type T: TColStd_Array1OfReal
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None") VIntervals;
		void VIntervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);

		/****************** VPeriod ******************/
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", ":rtype: float") VPeriod;
		Standard_Real VPeriod ();

		/****************** VResolution ******************/
		%feature("compactdefaultargs") VResolution;
		%feature("autodoc", "* Returns the parametric V resolution corresponding to the real space resolution <R3d>.
	:param R3d:
	:type R3d: float
	:rtype: float") VResolution;
		Standard_Real VResolution (const Standard_Real R3d);

		/****************** VTrim ******************/
		%feature("compactdefaultargs") VTrim;
		%feature("autodoc", "* Returns a surface trimmed in the V direction between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: opencascade::handle<Adaptor3d_HSurface>") VTrim;
		opencascade::handle<Adaptor3d_HSurface> VTrim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);

};


%extend GeomAdaptor_SurfaceOfLinearExtrusion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class GeomAdaptor_SurfaceOfRevolution *
****************************************/
class GeomAdaptor_SurfaceOfRevolution : public GeomAdaptor_Surface {
	public:
		/****************** AxeOfRevolution ******************/
		%feature("compactdefaultargs") AxeOfRevolution;
		%feature("autodoc", ":rtype: gp_Ax1") AxeOfRevolution;
		gp_Ax1 AxeOfRevolution ();

		/****************** Axis ******************/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", ":rtype: gp_Ax3") Axis;
		const gp_Ax3  Axis ();

		/****************** BSpline ******************/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_BSplineSurface>") BSpline;
		opencascade::handle<Geom_BSplineSurface> BSpline ();

		/****************** BasisCurve ******************/
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", ":rtype: opencascade::handle<Adaptor3d_HCurve>") BasisCurve;
		opencascade::handle<Adaptor3d_HCurve> BasisCurve ();

		/****************** Bezier ******************/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_BezierSurface>") Bezier;
		opencascade::handle<Geom_BezierSurface> Bezier ();

		/****************** Cone ******************/
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", "* Apex of the Cone = Cone.Position().Location() ==> ReferenceRadius = 0.
	:rtype: gp_Cone") Cone;
		gp_Cone Cone ();

		/****************** Cylinder ******************/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", ":rtype: gp_Cylinder") Cylinder;
		gp_Cylinder Cylinder ();

		/****************** FirstUParameter ******************/
		%feature("compactdefaultargs") FirstUParameter;
		%feature("autodoc", ":rtype: float") FirstUParameter;
		Standard_Real FirstUParameter ();

		/****************** FirstVParameter ******************/
		%feature("compactdefaultargs") FirstVParameter;
		%feature("autodoc", ":rtype: float") FirstVParameter;
		Standard_Real FirstVParameter ();

		/****************** GeomAdaptor_SurfaceOfRevolution ******************/
		%feature("compactdefaultargs") GeomAdaptor_SurfaceOfRevolution;
		%feature("autodoc", ":rtype: None") GeomAdaptor_SurfaceOfRevolution;
		 GeomAdaptor_SurfaceOfRevolution ();

		/****************** GeomAdaptor_SurfaceOfRevolution ******************/
		%feature("compactdefaultargs") GeomAdaptor_SurfaceOfRevolution;
		%feature("autodoc", "* The Curve is loaded.
	:param C:
	:type C: Adaptor3d_HCurve
	:rtype: None") GeomAdaptor_SurfaceOfRevolution;
		 GeomAdaptor_SurfaceOfRevolution (const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** GeomAdaptor_SurfaceOfRevolution ******************/
		%feature("compactdefaultargs") GeomAdaptor_SurfaceOfRevolution;
		%feature("autodoc", "* The Curve and the Direction are loaded.
	:param C:
	:type C: Adaptor3d_HCurve
	:param V:
	:type V: gp_Ax1
	:rtype: None") GeomAdaptor_SurfaceOfRevolution;
		 GeomAdaptor_SurfaceOfRevolution (const opencascade::handle<Adaptor3d_HCurve> & C,const gp_Ax1 & V);

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "* Returns the type of the surface : Plane, Cylinder, Cone, Sphere, Torus, BezierSurface, BSplineSurface, SurfaceOfRevolution, SurfaceOfExtrusion, OtherSurface
	:rtype: GeomAbs_SurfaceType") GetType;
		GeomAbs_SurfaceType GetType ();

		/****************** IsUClosed ******************/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", ":rtype: bool") IsUClosed;
		Standard_Boolean IsUClosed ();

		/****************** IsUPeriodic ******************/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", ":rtype: bool") IsUPeriodic;
		Standard_Boolean IsUPeriodic ();

		/****************** IsURational ******************/
		%feature("compactdefaultargs") IsURational;
		%feature("autodoc", ":rtype: bool") IsURational;
		Standard_Boolean IsURational ();

		/****************** IsVClosed ******************/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", ":rtype: bool") IsVClosed;
		Standard_Boolean IsVClosed ();

		/****************** IsVPeriodic ******************/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", ":rtype: bool") IsVPeriodic;
		Standard_Boolean IsVPeriodic ();

		/****************** IsVRational ******************/
		%feature("compactdefaultargs") IsVRational;
		%feature("autodoc", ":rtype: bool") IsVRational;
		Standard_Boolean IsVRational ();

		/****************** LastUParameter ******************/
		%feature("compactdefaultargs") LastUParameter;
		%feature("autodoc", ":rtype: float") LastUParameter;
		Standard_Real LastUParameter ();

		/****************** LastVParameter ******************/
		%feature("compactdefaultargs") LastVParameter;
		%feature("autodoc", ":rtype: float") LastVParameter;
		Standard_Real LastVParameter ();

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "* Changes the Curve
	:param C:
	:type C: Adaptor3d_HCurve
	:rtype: None") Load;
		void Load (const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "* Changes the Direction
	:param V:
	:type V: gp_Ax1
	:rtype: None") Load;
		void Load (const gp_Ax1 & V);

		/****************** NbUIntervals ******************/
		%feature("compactdefaultargs") NbUIntervals;
		%feature("autodoc", "* Returns the number of U intervals for continuity <S>. May be one if UContinuity(me) >= <S>
	:param S:
	:type S: GeomAbs_Shape
	:rtype: int") NbUIntervals;
		Standard_Integer NbUIntervals (const GeomAbs_Shape S);

		/****************** NbVIntervals ******************/
		%feature("compactdefaultargs") NbVIntervals;
		%feature("autodoc", "* Returns the number of V intervals for continuity <S>. May be one if VContinuity(me) >= <S>
	:param S:
	:type S: GeomAbs_Shape
	:rtype: int") NbVIntervals;
		Standard_Integer NbVIntervals (const GeomAbs_Shape S);

		/****************** NbVKnots ******************/
		%feature("compactdefaultargs") NbVKnots;
		%feature("autodoc", ":rtype: int") NbVKnots;
		Standard_Integer NbVKnots ();

		/****************** NbVPoles ******************/
		%feature("compactdefaultargs") NbVPoles;
		%feature("autodoc", ":rtype: int") NbVPoles;
		Standard_Integer NbVPoles ();

		/****************** Plane ******************/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", ":rtype: gp_Pln") Plane;
		gp_Pln Plane ();

		/****************** Sphere ******************/
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", ":rtype: gp_Sphere") Sphere;
		gp_Sphere Sphere ();

		/****************** Torus ******************/
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", ":rtype: gp_Torus") Torus;
		gp_Torus Torus ();

		/****************** UContinuity ******************/
		%feature("compactdefaultargs") UContinuity;
		%feature("autodoc", ":rtype: GeomAbs_Shape") UContinuity;
		GeomAbs_Shape UContinuity ();

		/****************** UIntervals ******************/
		%feature("compactdefaultargs") UIntervals;
		%feature("autodoc", "* Returns the intervals with the requested continuity in the U direction.
	:param T:
	:type T: TColStd_Array1OfReal
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None") UIntervals;
		void UIntervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);

		/****************** UPeriod ******************/
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", ":rtype: float") UPeriod;
		Standard_Real UPeriod ();

		/****************** UResolution ******************/
		%feature("compactdefaultargs") UResolution;
		%feature("autodoc", "* Returns the parametric U resolution corresponding to the real space resolution <R3d>.
	:param R3d:
	:type R3d: float
	:rtype: float") UResolution;
		Standard_Real UResolution (const Standard_Real R3d);

		/****************** UTrim ******************/
		%feature("compactdefaultargs") UTrim;
		%feature("autodoc", "* Returns a surface trimmed in the U direction equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: opencascade::handle<Adaptor3d_HSurface>") UTrim;
		opencascade::handle<Adaptor3d_HSurface> UTrim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);

		/****************** VContinuity ******************/
		%feature("compactdefaultargs") VContinuity;
		%feature("autodoc", "* Return CN.
	:rtype: GeomAbs_Shape") VContinuity;
		GeomAbs_Shape VContinuity ();

		/****************** VDegree ******************/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", ":rtype: int") VDegree;
		Standard_Integer VDegree ();

		/****************** VIntervals ******************/
		%feature("compactdefaultargs") VIntervals;
		%feature("autodoc", "* Returns the intervals with the requested continuity in the V direction.
	:param T:
	:type T: TColStd_Array1OfReal
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None") VIntervals;
		void VIntervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);

		/****************** VPeriod ******************/
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", ":rtype: float") VPeriod;
		Standard_Real VPeriod ();

		/****************** VResolution ******************/
		%feature("compactdefaultargs") VResolution;
		%feature("autodoc", "* Returns the parametric V resolution corresponding to the real space resolution <R3d>.
	:param R3d:
	:type R3d: float
	:rtype: float") VResolution;
		Standard_Real VResolution (const Standard_Real R3d);

		/****************** VTrim ******************/
		%feature("compactdefaultargs") VTrim;
		%feature("autodoc", "* Returns a surface trimmed in the V direction between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: opencascade::handle<Adaptor3d_HSurface>") VTrim;
		opencascade::handle<Adaptor3d_HSurface> VTrim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);

};


%extend GeomAdaptor_SurfaceOfRevolution {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
