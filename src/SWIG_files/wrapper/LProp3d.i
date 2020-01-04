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
%define LPROP3DDOCSTRING
"LProp3d module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_lprop3d.html"
%enddef
%module (package="OCC.Core", docstring=LPROP3DDOCSTRING) LProp3d


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
#include<LProp3d_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<gp_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Geom2d_module.hxx>
#include<Geom_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import gp.i
%import Adaptor3d.i
/* public enums */
/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/************************
* class LProp3d_CLProps *
************************/
class LProp3d_CLProps {
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

		/****************** IsTangentDefined ******************/
		%feature("compactdefaultargs") IsTangentDefined;
		%feature("autodoc", "* Returns True if the tangent is defined. For example, the tangent is not defined if the three first derivatives are all null.
	:rtype: bool") IsTangentDefined;
		Standard_Boolean IsTangentDefined ();

		/****************** LProp3d_CLProps ******************/
		%feature("compactdefaultargs") LProp3d_CLProps;
		%feature("autodoc", "* Initializes the local properties of the curve <C> The current point and the derivatives are computed at the same time, which allows an optimization of the computation time. <N> indicates the maximum number of derivations to be done (0, 1, 2 or 3). For example, to compute only the tangent, N should be equal to 1. <Resolution> is the linear tolerance (it is used to test if a vector is null).
	:param C:
	:type C: Adaptor3d_HCurve
	:param N:
	:type N: int
	:param Resolution:
	:type Resolution: float
	:rtype: None") LProp3d_CLProps;
		 LProp3d_CLProps (const opencascade::handle<Adaptor3d_HCurve> & C,const Standard_Integer N,const Standard_Real Resolution);

		/****************** LProp3d_CLProps ******************/
		%feature("compactdefaultargs") LProp3d_CLProps;
		%feature("autodoc", "* Same as previous constructor but here the parameter is set to the value <U>. All the computations done will be related to <C> and <U>.
	:param C:
	:type C: Adaptor3d_HCurve
	:param U:
	:type U: float
	:param N:
	:type N: int
	:param Resolution:
	:type Resolution: float
	:rtype: None") LProp3d_CLProps;
		 LProp3d_CLProps (const opencascade::handle<Adaptor3d_HCurve> & C,const Standard_Real U,const Standard_Integer N,const Standard_Real Resolution);

		/****************** LProp3d_CLProps ******************/
		%feature("compactdefaultargs") LProp3d_CLProps;
		%feature("autodoc", "* Same as previous constructor but here the parameter is set to the value <U> and the curve is set with SetCurve. the curve can have a empty constructor All the computations done will be related to <C> and <U> when the functions 'set' will be done.
	:param N:
	:type N: int
	:param Resolution:
	:type Resolution: float
	:rtype: None") LProp3d_CLProps;
		 LProp3d_CLProps (const Standard_Integer N,const Standard_Real Resolution);

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
	:type C: Adaptor3d_HCurve
	:rtype: None") SetCurve;
		void SetCurve (const opencascade::handle<Adaptor3d_HCurve> & C);

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


%extend LProp3d_CLProps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class LProp3d_CurveTool *
**************************/
class LProp3d_CurveTool {
	public:
		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "* returns the order of continuity of the HCurve <C>. returns 1 : first derivative only is computable returns 2 : first and second derivative only are computable. returns 3 : first, second and third are computable.
	:param C:
	:type C: Adaptor3d_HCurve
	:rtype: int") Continuity;
		static Standard_Integer Continuity (const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "* Computes the point <P> and first derivative <V1> of parameter <U> on the HCurve <C>.
	:param C:
	:type C: Adaptor3d_HCurve
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:rtype: void") D1;
		static void D1 (const opencascade::handle<Adaptor3d_HCurve> & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "* Computes the point <P>, the first derivative <V1> and second derivative <V2> of parameter <U> on the HCurve <C>.
	:param C:
	:type C: Adaptor3d_HCurve
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: void") D2;
		static void D2 (const opencascade::handle<Adaptor3d_HCurve> & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "* Computes the point <P>, the first derivative <V1>, the second derivative <V2> and third derivative <V3> of parameter <U> on the HCurve <C>.
	:param C:
	:type C: Adaptor3d_HCurve
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
		static void D3 (const opencascade::handle<Adaptor3d_HCurve> & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "* returns the first parameter bound of the HCurve.
	:param C:
	:type C: Adaptor3d_HCurve
	:rtype: float") FirstParameter;
		static Standard_Real FirstParameter (const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "* returns the last parameter bound of the HCurve. FirstParameter must be less than LastParamenter.
	:param C:
	:type C: Adaptor3d_HCurve
	:rtype: float") LastParameter;
		static Standard_Real LastParameter (const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Computes the point <P> of parameter <U> on the HCurve <C>.
	:param C:
	:type C: Adaptor3d_HCurve
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: void") Value;
		static void Value (const opencascade::handle<Adaptor3d_HCurve> & C,const Standard_Real U,gp_Pnt & P);

};


%extend LProp3d_CurveTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class LProp3d_SLProps *
************************/
class LProp3d_SLProps {
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

		/****************** LProp3d_SLProps ******************/
		%feature("compactdefaultargs") LProp3d_SLProps;
		%feature("autodoc", "* Initializes the local properties of the surface <S> for the parameter values (<U>, <V>). The current point and the derivatives are computed at the same time, which allows an optimization of the computation time. <N> indicates the maximum number of derivations to be done (0, 1, or 2). For example, to compute only the tangent, N should be equal to 1. <Resolution> is the linear tolerance (it is used to test if a vector is null).
	:param S:
	:type S: Adaptor3d_HSurface
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param N:
	:type N: int
	:param Resolution:
	:type Resolution: float
	:rtype: None") LProp3d_SLProps;
		 LProp3d_SLProps (const opencascade::handle<Adaptor3d_HSurface> & S,const Standard_Real U,const Standard_Real V,const Standard_Integer N,const Standard_Real Resolution);

		/****************** LProp3d_SLProps ******************/
		%feature("compactdefaultargs") LProp3d_SLProps;
		%feature("autodoc", "* idem as previous constructor but without setting the value of parameters <U> and <V>.
	:param S:
	:type S: Adaptor3d_HSurface
	:param N:
	:type N: int
	:param Resolution:
	:type Resolution: float
	:rtype: None") LProp3d_SLProps;
		 LProp3d_SLProps (const opencascade::handle<Adaptor3d_HSurface> & S,const Standard_Integer N,const Standard_Real Resolution);

		/****************** LProp3d_SLProps ******************/
		%feature("compactdefaultargs") LProp3d_SLProps;
		%feature("autodoc", "* idem as previous constructor but without setting the value of parameters <U> and <V> and the surface. the surface can have an empty constructor.
	:param N:
	:type N: int
	:param Resolution:
	:type Resolution: float
	:rtype: None") LProp3d_SLProps;
		 LProp3d_SLProps (const Standard_Integer N,const Standard_Real Resolution);

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
	:type S: Adaptor3d_HSurface
	:rtype: None") SetSurface;
		void SetSurface (const opencascade::handle<Adaptor3d_HSurface> & S);

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


%extend LProp3d_SLProps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class LProp3d_SurfaceTool *
****************************/
class LProp3d_SurfaceTool {
	public:
		/****************** Bounds ******************/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "* returns the bounds of the HSurface.
	:param S:
	:type S: Adaptor3d_HSurface
	:param U1:
	:type U1: float
	:param V1:
	:type V1: float
	:param U2:
	:type U2: float
	:param V2:
	:type V2: float
	:rtype: void") Bounds;
		static void Bounds (const opencascade::handle<Adaptor3d_HSurface> & S,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "* returns the order of continuity of the HSurface <S>. returns 1 : first derivative only is computable returns 2 : first and second derivative only are computable.
	:param S:
	:type S: Adaptor3d_HSurface
	:rtype: int") Continuity;
		static Standard_Integer Continuity (const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "* Computes the point <P> and first derivative <D1*> of parameter <U> and <V> on the HSurface <S>.
	:param S:
	:type S: Adaptor3d_HSurface
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
		static void D1 (const opencascade::handle<Adaptor3d_HSurface> & S,const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "* Computes the point <P>, the first derivative <D1*> and second derivative <D2*> of parameter <U> and <V> on the HSurface <S>.
	:param S:
	:type S: Adaptor3d_HSurface
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
		static void D2 (const opencascade::handle<Adaptor3d_HSurface> & S,const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & DUV);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param IU:
	:type IU: int
	:param IV:
	:type IV: int
	:rtype: gp_Vec") DN;
		static gp_Vec DN (const opencascade::handle<Adaptor3d_HSurface> & S,const Standard_Real U,const Standard_Real V,const Standard_Integer IU,const Standard_Integer IV);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Computes the point <P> of parameter <U> and <V> on the HSurface <S>.
	:param S:
	:type S: Adaptor3d_HSurface
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:rtype: void") Value;
		static void Value (const opencascade::handle<Adaptor3d_HSurface> & S,const Standard_Real U,const Standard_Real V,gp_Pnt & P);

};


%extend LProp3d_SurfaceTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
