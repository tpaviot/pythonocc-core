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
%define GEOMLPROPDOCSTRING
"GeomLProp module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_geomlprop.html"
%enddef
%module (package="OCC.Core", docstring=GEOMLPROPDOCSTRING) GeomLProp


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
#include<GeomLProp_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Geom_module.hxx>
#include<GeomAbs_module.hxx>
#include<gp_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Geom.i
%import GeomAbs.i
%import gp.i
/* public enums */
/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/******************
* class GeomLProp *
******************/
%rename(geomlprop) GeomLProp;
class GeomLProp {
	public:
		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "* Computes the regularity at the junction between C1 and C2. The booleans r1 and r2 are true if the curves must be taken reversed. The point u1 on C1 and the point u2 on C2 must be confused. tl and ta are the linear and angular tolerance used two compare the derivative.
	:param C1:
	:type C1: Geom_Curve
	:param C2:
	:type C2: Geom_Curve
	:param u1:
	:type u1: float
	:param u2:
	:type u2: float
	:param r1:
	:type r1: bool
	:param r2:
	:type r2: bool
	:param tl:
	:type tl: float
	:param ta:
	:type ta: float
	:rtype: GeomAbs_Shape") Continuity;
		static GeomAbs_Shape Continuity (const opencascade::handle<Geom_Curve> & C1,const opencascade::handle<Geom_Curve> & C2,const Standard_Real u1,const Standard_Real u2,const Standard_Boolean r1,const Standard_Boolean r2,const Standard_Real tl,const Standard_Real ta);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "* The same as preciding but using the standard tolerances from package Precision.
	:param C1:
	:type C1: Geom_Curve
	:param C2:
	:type C2: Geom_Curve
	:param u1:
	:type u1: float
	:param u2:
	:type u2: float
	:param r1:
	:type r1: bool
	:param r2:
	:type r2: bool
	:rtype: GeomAbs_Shape") Continuity;
		static GeomAbs_Shape Continuity (const opencascade::handle<Geom_Curve> & C1,const opencascade::handle<Geom_Curve> & C2,const Standard_Real u1,const Standard_Real u2,const Standard_Boolean r1,const Standard_Boolean r2);

};


%extend GeomLProp {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class GeomLProp_CLProps *
**************************/
class GeomLProp_CLProps {
	public:
		/****************** CentreOfCurvature ******************/
		%feature("compactdefaultargs") CentreOfCurvature;
		%feature("autodoc", "* Returns the centre of curvature <P>.
	:param P:
	:type P: gp_Pnt
	:rtype: None") CentreOfCurvature;
		void CentreOfCurvature (gp_Pnt & P);

		/****************** Curvature ******************/
		%feature("compactdefaultargs") Curvature;
		%feature("autodoc", "* Returns the curvature.
	:rtype: float") Curvature;
		Standard_Real Curvature ();

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "* Returns the first derivative. The derivative is computed if it has not been yet.
	:rtype: gp_Vec") D1;
		const gp_Vec  D1 ();

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "* Returns the second derivative. The derivative is computed if it has not been yet.
	:rtype: gp_Vec") D2;
		const gp_Vec  D2 ();

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "* Returns the third derivative. The derivative is computed if it has not been yet.
	:rtype: gp_Vec") D3;
		const gp_Vec  D3 ();

		/****************** GeomLProp_CLProps ******************/
		%feature("compactdefaultargs") GeomLProp_CLProps;
		%feature("autodoc", "* Initializes the local properties of the curve <C> The current point and the derivatives are computed at the same time, which allows an optimization of the computation time. <N> indicates the maximum number of derivations to be done (0, 1, 2 or 3). For example, to compute only the tangent, N should be equal to 1. <Resolution> is the linear tolerance (it is used to test if a vector is null).
	:param C:
	:type C: Geom_Curve
	:param N:
	:type N: int
	:param Resolution:
	:type Resolution: float
	:rtype: None") GeomLProp_CLProps;
		 GeomLProp_CLProps (const opencascade::handle<Geom_Curve> & C,const Standard_Integer N,const Standard_Real Resolution);

		/****************** GeomLProp_CLProps ******************/
		%feature("compactdefaultargs") GeomLProp_CLProps;
		%feature("autodoc", "* Same as previous constructor but here the parameter is set to the value <U>. All the computations done will be related to <C> and <U>.
	:param C:
	:type C: Geom_Curve
	:param U:
	:type U: float
	:param N:
	:type N: int
	:param Resolution:
	:type Resolution: float
	:rtype: None") GeomLProp_CLProps;
		 GeomLProp_CLProps (const opencascade::handle<Geom_Curve> & C,const Standard_Real U,const Standard_Integer N,const Standard_Real Resolution);

		/****************** GeomLProp_CLProps ******************/
		%feature("compactdefaultargs") GeomLProp_CLProps;
		%feature("autodoc", "* Same as previous constructor but here the parameter is set to the value <U> and the curve is set with SetCurve. the curve can have a empty constructor All the computations done will be related to <C> and <U> when the functions 'set' will be done.
	:param N:
	:type N: int
	:param Resolution:
	:type Resolution: float
	:rtype: None") GeomLProp_CLProps;
		 GeomLProp_CLProps (const Standard_Integer N,const Standard_Real Resolution);

		/****************** IsTangentDefined ******************/
		%feature("compactdefaultargs") IsTangentDefined;
		%feature("autodoc", "* Returns True if the tangent is defined. For example, the tangent is not defined if the three first derivatives are all null.
	:rtype: bool") IsTangentDefined;
		Standard_Boolean IsTangentDefined ();

		/****************** Normal ******************/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "* Returns the normal direction <N>.
	:param N:
	:type N: gp_Dir
	:rtype: None") Normal;
		void Normal (gp_Dir & N);

		/****************** SetCurve ******************/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "* Initializes the local properties of the curve for the new curve.
	:param C:
	:type C: Geom_Curve
	:rtype: None") SetCurve;
		void SetCurve (const opencascade::handle<Geom_Curve> & C);

		/****************** SetParameter ******************/
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "* Initializes the local properties of the curve for the parameter value <U>.
	:param U:
	:type U: float
	:rtype: None") SetParameter;
		void SetParameter (const Standard_Real U);

		/****************** Tangent ******************/
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "* output the tangent direction <D>
	:param D:
	:type D: gp_Dir
	:rtype: None") Tangent;
		void Tangent (gp_Dir & D);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the Point.
	:rtype: gp_Pnt") Value;
		const gp_Pnt  Value ();

};


%extend GeomLProp_CLProps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class GeomLProp_CurveTool *
****************************/
class GeomLProp_CurveTool {
	public:
		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "* returns the order of continuity of the curve <C>. returns 1 : first derivative only is computable returns 2 : first and second derivative only are computable. returns 3 : first, second and third are computable.
	:param C:
	:type C: Geom_Curve
	:rtype: int") Continuity;
		static Standard_Integer Continuity (const opencascade::handle<Geom_Curve> & C);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "* Computes the point <P> and first derivative <V1> of parameter <U> on the curve <C>.
	:param C:
	:type C: Geom_Curve
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:rtype: void") D1;
		static void D1 (const opencascade::handle<Geom_Curve> & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "* Computes the point <P>, the first derivative <V1> and second derivative <V2> of parameter <U> on the curve <C>.
	:param C:
	:type C: Geom_Curve
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: void") D2;
		static void D2 (const opencascade::handle<Geom_Curve> & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "* Computes the point <P>, the first derivative <V1>, the second derivative <V2> and third derivative <V3> of parameter <U> on the curve <C>.
	:param C:
	:type C: Geom_Curve
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
	:rtype: void") D3;
		static void D3 (const opencascade::handle<Geom_Curve> & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "* returns the first parameter bound of the curve.
	:param C:
	:type C: Geom_Curve
	:rtype: float") FirstParameter;
		static Standard_Real FirstParameter (const opencascade::handle<Geom_Curve> & C);

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "* returns the last parameter bound of the curve. FirstParameter must be less than LastParamenter.
	:param C:
	:type C: Geom_Curve
	:rtype: float") LastParameter;
		static Standard_Real LastParameter (const opencascade::handle<Geom_Curve> & C);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Computes the point <P> of parameter <U> on the curve <C>.
	:param C:
	:type C: Geom_Curve
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: void") Value;
		static void Value (const opencascade::handle<Geom_Curve> & C,const Standard_Real U,gp_Pnt & P);

};


%extend GeomLProp_CurveTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class GeomLProp_SLProps *
**************************/
class GeomLProp_SLProps {
	public:
		/****************** CurvatureDirections ******************/
		%feature("compactdefaultargs") CurvatureDirections;
		%feature("autodoc", "* Returns the direction of the maximum and minimum curvature <MaxD> and <MinD>
	:param MaxD:
	:type MaxD: gp_Dir
	:param MinD:
	:type MinD: gp_Dir
	:rtype: None") CurvatureDirections;
		void CurvatureDirections (gp_Dir & MaxD,gp_Dir & MinD);

		/****************** D1U ******************/
		%feature("compactdefaultargs") D1U;
		%feature("autodoc", "* Returns the first U derivative. The derivative is computed if it has not been yet.
	:rtype: gp_Vec") D1U;
		const gp_Vec  D1U ();

		/****************** D1V ******************/
		%feature("compactdefaultargs") D1V;
		%feature("autodoc", "* Returns the first V derivative. The derivative is computed if it has not been yet.
	:rtype: gp_Vec") D1V;
		const gp_Vec  D1V ();

		/****************** D2U ******************/
		%feature("compactdefaultargs") D2U;
		%feature("autodoc", "* Returns the second U derivatives The derivative is computed if it has not been yet.
	:rtype: gp_Vec") D2U;
		const gp_Vec  D2U ();

		/****************** D2V ******************/
		%feature("compactdefaultargs") D2V;
		%feature("autodoc", "* Returns the second V derivative. The derivative is computed if it has not been yet.
	:rtype: gp_Vec") D2V;
		const gp_Vec  D2V ();

		/****************** DUV ******************/
		%feature("compactdefaultargs") DUV;
		%feature("autodoc", "* Returns the second UV cross-derivative. The derivative is computed if it has not been yet.
	:rtype: gp_Vec") DUV;
		const gp_Vec  DUV ();

		/****************** GaussianCurvature ******************/
		%feature("compactdefaultargs") GaussianCurvature;
		%feature("autodoc", "* Returns the Gaussian curvature
	:rtype: float") GaussianCurvature;
		Standard_Real GaussianCurvature ();

		/****************** GeomLProp_SLProps ******************/
		%feature("compactdefaultargs") GeomLProp_SLProps;
		%feature("autodoc", "* Initializes the local properties of the surface <S> for the parameter values (<U>, <V>). The current point and the derivatives are computed at the same time, which allows an optimization of the computation time. <N> indicates the maximum number of derivations to be done (0, 1, or 2). For example, to compute only the tangent, N should be equal to 1. <Resolution> is the linear tolerance (it is used to test if a vector is null).
	:param S:
	:type S: Geom_Surface
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param N:
	:type N: int
	:param Resolution:
	:type Resolution: float
	:rtype: None") GeomLProp_SLProps;
		 GeomLProp_SLProps (const opencascade::handle<Geom_Surface> & S,const Standard_Real U,const Standard_Real V,const Standard_Integer N,const Standard_Real Resolution);

		/****************** GeomLProp_SLProps ******************/
		%feature("compactdefaultargs") GeomLProp_SLProps;
		%feature("autodoc", "* idem as previous constructor but without setting the value of parameters <U> and <V>.
	:param S:
	:type S: Geom_Surface
	:param N:
	:type N: int
	:param Resolution:
	:type Resolution: float
	:rtype: None") GeomLProp_SLProps;
		 GeomLProp_SLProps (const opencascade::handle<Geom_Surface> & S,const Standard_Integer N,const Standard_Real Resolution);

		/****************** GeomLProp_SLProps ******************/
		%feature("compactdefaultargs") GeomLProp_SLProps;
		%feature("autodoc", "* idem as previous constructor but without setting the value of parameters <U> and <V> and the surface. the surface can have an empty constructor.
	:param N:
	:type N: int
	:param Resolution:
	:type Resolution: float
	:rtype: None") GeomLProp_SLProps;
		 GeomLProp_SLProps (const Standard_Integer N,const Standard_Real Resolution);

		/****************** IsCurvatureDefined ******************/
		%feature("compactdefaultargs") IsCurvatureDefined;
		%feature("autodoc", "* returns True if the curvature is defined.
	:rtype: bool") IsCurvatureDefined;
		Standard_Boolean IsCurvatureDefined ();

		/****************** IsNormalDefined ******************/
		%feature("compactdefaultargs") IsNormalDefined;
		%feature("autodoc", "* Tells if the normal is defined.
	:rtype: bool") IsNormalDefined;
		Standard_Boolean IsNormalDefined ();

		/****************** IsTangentUDefined ******************/
		%feature("compactdefaultargs") IsTangentUDefined;
		%feature("autodoc", "* returns True if the U tangent is defined. For example, the tangent is not defined if the two first U derivatives are null.
	:rtype: bool") IsTangentUDefined;
		Standard_Boolean IsTangentUDefined ();

		/****************** IsTangentVDefined ******************/
		%feature("compactdefaultargs") IsTangentVDefined;
		%feature("autodoc", "* returns if the V tangent is defined. For example, the tangent is not defined if the two first V derivatives are null.
	:rtype: bool") IsTangentVDefined;
		Standard_Boolean IsTangentVDefined ();

		/****************** IsUmbilic ******************/
		%feature("compactdefaultargs") IsUmbilic;
		%feature("autodoc", "* returns True if the point is umbilic (i.e. if the curvature is constant).
	:rtype: bool") IsUmbilic;
		Standard_Boolean IsUmbilic ();

		/****************** MaxCurvature ******************/
		%feature("compactdefaultargs") MaxCurvature;
		%feature("autodoc", "* Returns the maximum curvature
	:rtype: float") MaxCurvature;
		Standard_Real MaxCurvature ();

		/****************** MeanCurvature ******************/
		%feature("compactdefaultargs") MeanCurvature;
		%feature("autodoc", "* Returns the mean curvature.
	:rtype: float") MeanCurvature;
		Standard_Real MeanCurvature ();

		/****************** MinCurvature ******************/
		%feature("compactdefaultargs") MinCurvature;
		%feature("autodoc", "* Returns the minimum curvature
	:rtype: float") MinCurvature;
		Standard_Real MinCurvature ();

		/****************** Normal ******************/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "* Returns the normal direction.
	:rtype: gp_Dir") Normal;
		const gp_Dir  Normal ();

		/****************** SetParameters ******************/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "* Initializes the local properties of the surface S for the new parameter values (<U>, <V>).
	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: None") SetParameters;
		void SetParameters (const Standard_Real U,const Standard_Real V);

		/****************** SetSurface ******************/
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", "* Initializes the local properties of the surface S for the new surface.
	:param S:
	:type S: Geom_Surface
	:rtype: None") SetSurface;
		void SetSurface (const opencascade::handle<Geom_Surface> & S);

		/****************** TangentU ******************/
		%feature("compactdefaultargs") TangentU;
		%feature("autodoc", "* Returns the tangent direction <D> on the iso-V.
	:param D:
	:type D: gp_Dir
	:rtype: None") TangentU;
		void TangentU (gp_Dir & D);

		/****************** TangentV ******************/
		%feature("compactdefaultargs") TangentV;
		%feature("autodoc", "* Returns the tangent direction <D> on the iso-V.
	:param D:
	:type D: gp_Dir
	:rtype: None") TangentV;
		void TangentV (gp_Dir & D);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the point.
	:rtype: gp_Pnt") Value;
		const gp_Pnt  Value ();

};


%extend GeomLProp_SLProps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class GeomLProp_SurfaceTool *
******************************/
class GeomLProp_SurfaceTool {
	public:
		/****************** Bounds ******************/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "* returns the bounds of the Surface.
	:param S:
	:type S: Geom_Surface
	:param U1:
	:type U1: float
	:param V1:
	:type V1: float
	:param U2:
	:type U2: float
	:param V2:
	:type V2: float
	:rtype: void") Bounds;
		static void Bounds (const opencascade::handle<Geom_Surface> & S,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "* returns the order of continuity of the Surface <S>. returns 1 : first derivative only is computable returns 2 : first and second derivative only are computable.
	:param S:
	:type S: Geom_Surface
	:rtype: int") Continuity;
		static Standard_Integer Continuity (const opencascade::handle<Geom_Surface> & S);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "* Computes the point <P> and first derivative <D1*> of parameter <U> and <V> on the Surface <S>.
	:param S:
	:type S: Geom_Surface
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
	:rtype: void") D1;
		static void D1 (const opencascade::handle<Geom_Surface> & S,const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "* Computes the point <P>, the first derivative <D1*> and second derivative <D2*> of parameter <U> and <V> on the Surface <S>.
	:param S:
	:type S: Geom_Surface
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
	:param DUV:
	:type DUV: gp_Vec
	:rtype: void") D2;
		static void D2 (const opencascade::handle<Geom_Surface> & S,const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & DUV);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", ":param S:
	:type S: Geom_Surface
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param IU:
	:type IU: int
	:param IV:
	:type IV: int
	:rtype: gp_Vec") DN;
		static gp_Vec DN (const opencascade::handle<Geom_Surface> & S,const Standard_Real U,const Standard_Real V,const Standard_Integer IU,const Standard_Integer IV);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Computes the point <P> of parameter <U> and <V> on the Surface <S>.
	:param S:
	:type S: Geom_Surface
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:rtype: void") Value;
		static void Value (const opencascade::handle<Geom_Surface> & S,const Standard_Real U,const Standard_Real V,gp_Pnt & P);

};


%extend GeomLProp_SurfaceTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
