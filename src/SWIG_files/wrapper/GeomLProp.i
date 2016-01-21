/*
Copyright 2008-2015 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") GeomLProp

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

%pythoncode {
import OCC.GarbageCollector
};

%include GeomLProp_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(geomlprop) GeomLProp;
class GeomLProp {
	public:
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "	* Computes the regularity at the junction between C1 and C2. The booleans r1 and r2 are true if the curves must be taken reversed. The point u1 on C1 and the point u2 on C2 must be confused. tl and ta are the linear and angular tolerance used two compare the derivative.

	:param C1:
	:type C1: Handle_Geom_Curve &
	:param C2:
	:type C2: Handle_Geom_Curve &
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
	:rtype: GeomAbs_Shape
") Continuity;
		static GeomAbs_Shape Continuity (const Handle_Geom_Curve & C1,const Handle_Geom_Curve & C2,const Standard_Real u1,const Standard_Real u2,const Standard_Boolean r1,const Standard_Boolean r2,const Standard_Real tl,const Standard_Real ta);
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "	* The same as preciding but using the standard tolerances from package Precision.

	:param C1:
	:type C1: Handle_Geom_Curve &
	:param C2:
	:type C2: Handle_Geom_Curve &
	:param u1:
	:type u1: float
	:param u2:
	:type u2: float
	:param r1:
	:type r1: bool
	:param r2:
	:type r2: bool
	:rtype: GeomAbs_Shape
") Continuity;
		static GeomAbs_Shape Continuity (const Handle_Geom_Curve & C1,const Handle_Geom_Curve & C2,const Standard_Real u1,const Standard_Real u2,const Standard_Boolean r1,const Standard_Boolean r2);
};


%feature("shadow") GeomLProp::~GeomLProp %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomLProp {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GeomLProp_CLProps;
class GeomLProp_CLProps {
	public:
		%feature("compactdefaultargs") GeomLProp_CLProps;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom_Curve &
	:param N:
	:type N: int
	:param Resolution:
	:type Resolution: float
	:rtype: None
") GeomLProp_CLProps;
		 GeomLProp_CLProps (const Handle_Geom_Curve & C,const Standard_Integer N,const Standard_Real Resolution);
		%feature("compactdefaultargs") GeomLProp_CLProps;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom_Curve &
	:param U:
	:type U: float
	:param N:
	:type N: int
	:param Resolution:
	:type Resolution: float
	:rtype: None
") GeomLProp_CLProps;
		 GeomLProp_CLProps (const Handle_Geom_Curve & C,const Standard_Real U,const Standard_Integer N,const Standard_Real Resolution);
		%feature("compactdefaultargs") GeomLProp_CLProps;
		%feature("autodoc", "	:param N:
	:type N: int
	:param Resolution:
	:type Resolution: float
	:rtype: None
") GeomLProp_CLProps;
		 GeomLProp_CLProps (const Standard_Integer N,const Standard_Real Resolution);
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "	:param U:
	:type U: float
	:rtype: None
") SetParameter;
		void SetParameter (const Standard_Real U);
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom_Curve &
	:rtype: None
") SetCurve;
		void SetCurve (const Handle_Geom_Curve & C);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: gp_Pnt
") Value;
		const gp_Pnt  Value ();
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:rtype: gp_Vec
") D1;
		const gp_Vec  D1 ();
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	:rtype: gp_Vec
") D2;
		const gp_Vec  D2 ();
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	:rtype: gp_Vec
") D3;
		const gp_Vec  D3 ();
		%feature("compactdefaultargs") IsTangentDefined;
		%feature("autodoc", "	:rtype: bool
") IsTangentDefined;
		Standard_Boolean IsTangentDefined ();
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "	:param D:
	:type D: gp_Dir
	:rtype: None
") Tangent;
		void Tangent (gp_Dir & D);
		%feature("compactdefaultargs") Curvature;
		%feature("autodoc", "	:rtype: float
") Curvature;
		Standard_Real Curvature ();
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "	:param N:
	:type N: gp_Dir
	:rtype: None
") Normal;
		void Normal (gp_Dir & N);
		%feature("compactdefaultargs") CentreOfCurvature;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: None
") CentreOfCurvature;
		void CentreOfCurvature (gp_Pnt & P);
};


%feature("shadow") GeomLProp_CLProps::~GeomLProp_CLProps %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomLProp_CLProps {
	void _kill_pointed() {
		delete $self;
	}
};
class GeomLProp_CurveTool {
	public:
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Computes the point <P> of parameter <U> on the curve <C>.

	:param C:
	:type C: Handle_Geom_Curve &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: void
") Value;
		static void Value (const Handle_Geom_Curve & C,const Standard_Real U,gp_Pnt & P);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* Computes the point <P> and first derivative <V1> of parameter <U> on the curve <C>.

	:param C:
	:type C: Handle_Geom_Curve &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:rtype: void
") D1;
		static void D1 (const Handle_Geom_Curve & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	* Computes the point <P>, the first derivative <V1> and second derivative <V2> of parameter <U> on the curve <C>.

	:param C:
	:type C: Handle_Geom_Curve &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: void
") D2;
		static void D2 (const Handle_Geom_Curve & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	* Computes the point <P>, the first derivative <V1>, the second derivative <V2> and third derivative <V3> of parameter <U> on the curve <C>.

	:param C:
	:type C: Handle_Geom_Curve &
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
	:rtype: void
") D3;
		static void D3 (const Handle_Geom_Curve & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "	* returns the order of continuity of the curve <C>. returns 1 : first derivative only is computable returns 2 : first and second derivative only are computable. returns 3 : first, second and third are computable.

	:param C:
	:type C: Handle_Geom_Curve &
	:rtype: int
") Continuity;
		static Standard_Integer Continuity (const Handle_Geom_Curve & C);
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "	* returns the first parameter bound of the curve.

	:param C:
	:type C: Handle_Geom_Curve &
	:rtype: float
") FirstParameter;
		static Standard_Real FirstParameter (const Handle_Geom_Curve & C);
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "	* returns the last parameter bound of the curve. FirstParameter must be less than LastParamenter.

	:param C:
	:type C: Handle_Geom_Curve &
	:rtype: float
") LastParameter;
		static Standard_Real LastParameter (const Handle_Geom_Curve & C);
};


%feature("shadow") GeomLProp_CurveTool::~GeomLProp_CurveTool %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomLProp_CurveTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GeomLProp_SLProps;
class GeomLProp_SLProps {
	public:
		%feature("compactdefaultargs") GeomLProp_SLProps;
		%feature("autodoc", "	:param S:
	:type S: Handle_Geom_Surface &
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param N:
	:type N: int
	:param Resolution:
	:type Resolution: float
	:rtype: None
") GeomLProp_SLProps;
		 GeomLProp_SLProps (const Handle_Geom_Surface & S,const Standard_Real U,const Standard_Real V,const Standard_Integer N,const Standard_Real Resolution);
		%feature("compactdefaultargs") GeomLProp_SLProps;
		%feature("autodoc", "	:param S:
	:type S: Handle_Geom_Surface &
	:param N:
	:type N: int
	:param Resolution:
	:type Resolution: float
	:rtype: None
") GeomLProp_SLProps;
		 GeomLProp_SLProps (const Handle_Geom_Surface & S,const Standard_Integer N,const Standard_Real Resolution);
		%feature("compactdefaultargs") GeomLProp_SLProps;
		%feature("autodoc", "	:param N:
	:type N: int
	:param Resolution:
	:type Resolution: float
	:rtype: None
") GeomLProp_SLProps;
		 GeomLProp_SLProps (const Standard_Integer N,const Standard_Real Resolution);
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", "	:param S:
	:type S: Handle_Geom_Surface &
	:rtype: None
") SetSurface;
		void SetSurface (const Handle_Geom_Surface & S);
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: None
") SetParameters;
		void SetParameters (const Standard_Real U,const Standard_Real V);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: gp_Pnt
") Value;
		const gp_Pnt  Value ();
		%feature("compactdefaultargs") D1U;
		%feature("autodoc", "	:rtype: gp_Vec
") D1U;
		const gp_Vec  D1U ();
		%feature("compactdefaultargs") D1V;
		%feature("autodoc", "	:rtype: gp_Vec
") D1V;
		const gp_Vec  D1V ();
		%feature("compactdefaultargs") D2U;
		%feature("autodoc", "	:rtype: gp_Vec
") D2U;
		const gp_Vec  D2U ();
		%feature("compactdefaultargs") D2V;
		%feature("autodoc", "	:rtype: gp_Vec
") D2V;
		const gp_Vec  D2V ();
		%feature("compactdefaultargs") DUV;
		%feature("autodoc", "	:rtype: gp_Vec
") DUV;
		const gp_Vec  DUV ();
		%feature("compactdefaultargs") IsTangentUDefined;
		%feature("autodoc", "	:rtype: bool
") IsTangentUDefined;
		Standard_Boolean IsTangentUDefined ();
		%feature("compactdefaultargs") TangentU;
		%feature("autodoc", "	:param D:
	:type D: gp_Dir
	:rtype: None
") TangentU;
		void TangentU (gp_Dir & D);
		%feature("compactdefaultargs") IsTangentVDefined;
		%feature("autodoc", "	:rtype: bool
") IsTangentVDefined;
		Standard_Boolean IsTangentVDefined ();
		%feature("compactdefaultargs") TangentV;
		%feature("autodoc", "	:param D:
	:type D: gp_Dir
	:rtype: None
") TangentV;
		void TangentV (gp_Dir & D);
		%feature("compactdefaultargs") IsNormalDefined;
		%feature("autodoc", "	:rtype: bool
") IsNormalDefined;
		Standard_Boolean IsNormalDefined ();
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "	:rtype: gp_Dir
") Normal;
		const gp_Dir  Normal ();
		%feature("compactdefaultargs") IsCurvatureDefined;
		%feature("autodoc", "	:rtype: bool
") IsCurvatureDefined;
		Standard_Boolean IsCurvatureDefined ();
		%feature("compactdefaultargs") IsUmbilic;
		%feature("autodoc", "	:rtype: bool
") IsUmbilic;
		Standard_Boolean IsUmbilic ();
		%feature("compactdefaultargs") MaxCurvature;
		%feature("autodoc", "	:rtype: float
") MaxCurvature;
		Standard_Real MaxCurvature ();
		%feature("compactdefaultargs") MinCurvature;
		%feature("autodoc", "	:rtype: float
") MinCurvature;
		Standard_Real MinCurvature ();
		%feature("compactdefaultargs") CurvatureDirections;
		%feature("autodoc", "	:param MaxD:
	:type MaxD: gp_Dir
	:param MinD:
	:type MinD: gp_Dir
	:rtype: None
") CurvatureDirections;
		void CurvatureDirections (gp_Dir & MaxD,gp_Dir & MinD);
		%feature("compactdefaultargs") MeanCurvature;
		%feature("autodoc", "	:rtype: float
") MeanCurvature;
		Standard_Real MeanCurvature ();
		%feature("compactdefaultargs") GaussianCurvature;
		%feature("autodoc", "	:rtype: float
") GaussianCurvature;
		Standard_Real GaussianCurvature ();
};


%feature("shadow") GeomLProp_SLProps::~GeomLProp_SLProps %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomLProp_SLProps {
	void _kill_pointed() {
		delete $self;
	}
};
class GeomLProp_SurfaceTool {
	public:
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Computes the point <P> of parameter <U> and <V> on the Surface <S>.

	:param S:
	:type S: Handle_Geom_Surface &
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:rtype: void
") Value;
		static void Value (const Handle_Geom_Surface & S,const Standard_Real U,const Standard_Real V,gp_Pnt & P);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* Computes the point <P> and first derivative <D1*> of parameter <U> and <V> on the Surface <S>.

	:param S:
	:type S: Handle_Geom_Surface &
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
	:rtype: void
") D1;
		static void D1 (const Handle_Geom_Surface & S,const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	* Computes the point <P>, the first derivative <D1*> and second derivative <D2*> of parameter <U> and <V> on the Surface <S>.

	:param S:
	:type S: Handle_Geom_Surface &
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
	:rtype: void
") D2;
		static void D2 (const Handle_Geom_Surface & S,const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & DUV);
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	:param S:
	:type S: Handle_Geom_Surface &
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param IU:
	:type IU: int
	:param IV:
	:type IV: int
	:rtype: gp_Vec
") DN;
		static gp_Vec DN (const Handle_Geom_Surface & S,const Standard_Real U,const Standard_Real V,const Standard_Integer IU,const Standard_Integer IV);
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "	* returns the order of continuity of the Surface <S>. returns 1 : first derivative only is computable returns 2 : first and second derivative only are computable.

	:param S:
	:type S: Handle_Geom_Surface &
	:rtype: int
") Continuity;
		static Standard_Integer Continuity (const Handle_Geom_Surface & S);
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "	* returns the bounds of the Surface.

	:param S:
	:type S: Handle_Geom_Surface &
	:param U1:
	:type U1: float &
	:param V1:
	:type V1: float &
	:param U2:
	:type U2: float &
	:param V2:
	:type V2: float &
	:rtype: void
") Bounds;
		static void Bounds (const Handle_Geom_Surface & S,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") GeomLProp_SurfaceTool::~GeomLProp_SurfaceTool %{
def __del__(self):
	try:
		self.thisown = False
		OCC.GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomLProp_SurfaceTool {
	void _kill_pointed() {
		delete $self;
	}
};
