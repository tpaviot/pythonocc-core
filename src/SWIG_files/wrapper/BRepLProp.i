/*
Copyright 2008-2014 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") BRepLProp

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/StandardDefines.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i

%include BRepLProp_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(breplprop) BRepLProp;
%nodefaultctor BRepLProp;
class BRepLProp {
	public:
		%feature("autodoc", "Args:
	C1(BRepAdaptor_Curve)
	C2(BRepAdaptor_Curve)
	u1(Standard_Real)
	u2(Standard_Real)
	tl(Standard_Real)
	ta(Standard_Real)

Returns:
	static GeomAbs_Shape

Computes the regularity at the junction between C1 and  
         C2. The point u1 on C1 and the point u2 on  C2 must be  
         confused.   tl  and ta  are  the  linear  and  angular  
         tolerance used two compare the derivative.") Continuity;
		static GeomAbs_Shape Continuity (const BRepAdaptor_Curve & C1,const BRepAdaptor_Curve & C2,const Standard_Real u1,const Standard_Real u2,const Standard_Real tl,const Standard_Real ta);
		%feature("autodoc", "Args:
	C1(BRepAdaptor_Curve)
	C2(BRepAdaptor_Curve)
	u1(Standard_Real)
	u2(Standard_Real)

Returns:
	static GeomAbs_Shape

The  same  as  preciding   but   using  the   standard  
         tolerances from package Precision.") Continuity;
		static GeomAbs_Shape Continuity (const BRepAdaptor_Curve & C1,const BRepAdaptor_Curve & C2,const Standard_Real u1,const Standard_Real u2);
};


%feature("shadow") BRepLProp::~BRepLProp %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepLProp {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepLProp_CLProps;
class BRepLProp_CLProps {
	public:
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)
	N(Standard_Integer)
	Resolution(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepLProp_CLProps;
		 BRepLProp_CLProps (const BRepAdaptor_Curve & C,const Standard_Integer N,const Standard_Real Resolution);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)
	U(Standard_Real)
	N(Standard_Integer)
	Resolution(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepLProp_CLProps;
		 BRepLProp_CLProps (const BRepAdaptor_Curve & C,const Standard_Real U,const Standard_Integer N,const Standard_Real Resolution);
		%feature("autodoc", "Args:
	N(Standard_Integer)
	Resolution(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepLProp_CLProps;
		 BRepLProp_CLProps (const Standard_Integer N,const Standard_Real Resolution);
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetParameter;
		void SetParameter (const Standard_Real U);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)

Returns:
	None

No detailed docstring for this function.") SetCurve;
		void SetCurve (const BRepAdaptor_Curve & C);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

No detailed docstring for this function.") Value;
		const gp_Pnt & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec

No detailed docstring for this function.") D1;
		const gp_Vec & D1 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec

No detailed docstring for this function.") D2;
		const gp_Vec & D2 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec

No detailed docstring for this function.") D3;
		const gp_Vec & D3 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsTangentDefined;
		Standard_Boolean IsTangentDefined ();
		%feature("autodoc", "Args:
	D(gp_Dir)

Returns:
	None

No detailed docstring for this function.") Tangent;
		void Tangent (gp_Dir & D);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Curvature;
		Standard_Real Curvature ();
		%feature("autodoc", "Args:
	N(gp_Dir)

Returns:
	None

No detailed docstring for this function.") Normal;
		void Normal (gp_Dir & N);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") CentreOfCurvature;
		void CentreOfCurvature (gp_Pnt & P);
};


%feature("shadow") BRepLProp_CLProps::~BRepLProp_CLProps %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepLProp_CLProps {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepLProp_CurveTool;
class BRepLProp_CurveTool {
	public:
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)
	U(Standard_Real)
	P(gp_Pnt)

Returns:
	static void

Computes the point <P> of parameter <U> on the curve <C>.") Value;
		static void Value (const BRepAdaptor_Curve & C,const Standard_Real U,gp_Pnt & P);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)

Returns:
	static void

Computes the point <P> and first derivative <V1> of  
         parameter <U> on the curve <C>.") D1;
		static void D1 (const BRepAdaptor_Curve & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)

Returns:
	static void

Computes the point <P>, the first derivative <V1> and second  
         derivative <V2> of parameter <U> on the curve <C>.") D2;
		static void D2 (const BRepAdaptor_Curve & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)
	V3(gp_Vec)

Returns:
	static void

Computes the point <P>, the first derivative <V1>, the  
         second derivative <V2> and third derivative <V3> of  
         parameter <U> on the curve <C>.") D3;
		static void D3 (const BRepAdaptor_Curve & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)

Returns:
	static Standard_Integer

returns the order of continuity of the curve <C>.  
         returns 1 : first derivative only is computable  
         returns 2 : first and second derivative only are computable.  
         returns 3 : first, second and third are computable.") Continuity;
		static Standard_Integer Continuity (const BRepAdaptor_Curve & C);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)

Returns:
	static Standard_Real

returns the first parameter bound of the curve.") FirstParameter;
		static Standard_Real FirstParameter (const BRepAdaptor_Curve & C);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)

Returns:
	static Standard_Real

returns the last parameter bound of the curve.  
         FirstParameter must be less than LastParamenter.") LastParameter;
		static Standard_Real LastParameter (const BRepAdaptor_Curve & C);
};


%feature("shadow") BRepLProp_CurveTool::~BRepLProp_CurveTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepLProp_CurveTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepLProp_SLProps;
class BRepLProp_SLProps {
	public:
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)
	U(Standard_Real)
	V(Standard_Real)
	N(Standard_Integer)
	Resolution(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepLProp_SLProps;
		 BRepLProp_SLProps (const BRepAdaptor_Surface & S,const Standard_Real U,const Standard_Real V,const Standard_Integer N,const Standard_Real Resolution);
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)
	N(Standard_Integer)
	Resolution(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepLProp_SLProps;
		 BRepLProp_SLProps (const BRepAdaptor_Surface & S,const Standard_Integer N,const Standard_Real Resolution);
		%feature("autodoc", "Args:
	N(Standard_Integer)
	Resolution(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepLProp_SLProps;
		 BRepLProp_SLProps (const Standard_Integer N,const Standard_Real Resolution);
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)

Returns:
	None

No detailed docstring for this function.") SetSurface;
		void SetSurface (const BRepAdaptor_Surface & S);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetParameters;
		void SetParameters (const Standard_Real U,const Standard_Real V);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

No detailed docstring for this function.") Value;
		const gp_Pnt & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec

No detailed docstring for this function.") D1U;
		const gp_Vec & D1U ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec

No detailed docstring for this function.") D1V;
		const gp_Vec & D1V ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec

No detailed docstring for this function.") D2U;
		const gp_Vec & D2U ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec

No detailed docstring for this function.") D2V;
		const gp_Vec & D2V ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec

No detailed docstring for this function.") DUV;
		const gp_Vec & DUV ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsTangentUDefined;
		Standard_Boolean IsTangentUDefined ();
		%feature("autodoc", "Args:
	D(gp_Dir)

Returns:
	None

No detailed docstring for this function.") TangentU;
		void TangentU (gp_Dir & D);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsTangentVDefined;
		Standard_Boolean IsTangentVDefined ();
		%feature("autodoc", "Args:
	D(gp_Dir)

Returns:
	None

No detailed docstring for this function.") TangentV;
		void TangentV (gp_Dir & D);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsNormalDefined;
		Standard_Boolean IsNormalDefined ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir

No detailed docstring for this function.") Normal;
		const gp_Dir & Normal ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsCurvatureDefined;
		Standard_Boolean IsCurvatureDefined ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsUmbilic;
		Standard_Boolean IsUmbilic ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") MaxCurvature;
		Standard_Real MaxCurvature ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") MinCurvature;
		Standard_Real MinCurvature ();
		%feature("autodoc", "Args:
	MaxD(gp_Dir)
	MinD(gp_Dir)

Returns:
	None

No detailed docstring for this function.") CurvatureDirections;
		void CurvatureDirections (gp_Dir & MaxD,gp_Dir & MinD);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") MeanCurvature;
		Standard_Real MeanCurvature ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") GaussianCurvature;
		Standard_Real GaussianCurvature ();
};


%feature("shadow") BRepLProp_SLProps::~BRepLProp_SLProps %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepLProp_SLProps {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepLProp_SurfaceTool;
class BRepLProp_SurfaceTool {
	public:
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)

Returns:
	static void

Computes the point <P> of parameter <U> and <V> on the  
         Surface <S>.") Value;
		static void Value (const BRepAdaptor_Surface & S,const Standard_Real U,const Standard_Real V,gp_Pnt & P);
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)

Returns:
	static void

Computes the point <P> and first derivative <D1*> of  
         parameter <U> and <V> on the Surface <S>.") D1;
		static void D1 (const BRepAdaptor_Surface & S,const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V);
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	DUV(gp_Vec)

Returns:
	static void

Computes the point <P>, the first derivative <D1*> and second  
         derivative <D2*> of parameter <U> and <V> on the Surface <S>.") D2;
		static void D2 (const BRepAdaptor_Surface & S,const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & DUV);
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)
	U(Standard_Real)
	V(Standard_Real)
	IU(Standard_Integer)
	IV(Standard_Integer)

Returns:
	static gp_Vec

No detailed docstring for this function.") DN;
		static gp_Vec DN (const BRepAdaptor_Surface & S,const Standard_Real U,const Standard_Real V,const Standard_Integer IU,const Standard_Integer IV);
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)

Returns:
	static Standard_Integer

returns the order of continuity of the Surface <S>.  
         returns 1 : first derivative only is computable  
         returns 2 : first and second derivative only are computable.") Continuity;
		static Standard_Integer Continuity (const BRepAdaptor_Surface & S);
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)
	U1(Standard_Real)
	V1(Standard_Real)
	U2(Standard_Real)
	V2(Standard_Real)

Returns:
	static void

returns the bounds of the Surface.") Bounds;
		static void Bounds (const BRepAdaptor_Surface & S,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") BRepLProp_SurfaceTool::~BRepLProp_SurfaceTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepLProp_SurfaceTool {
	void _kill_pointed() {
		delete $self;
	}
};
