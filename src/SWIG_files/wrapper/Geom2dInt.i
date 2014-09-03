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
%module (package="OCC") Geom2dInt

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

%include Geom2dInt_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter;
class Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter {
	public:
		%feature("autodoc", "Args:
	C1(Adaptor2d_Curve2d)
	C2(Adaptor2d_Curve2d)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter;
		 Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2,const Standard_Real Tol);
		%feature("autodoc", "Args:
	Poly1(Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter)
	Poly2(Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter)
	NumSegOn1(Standard_Integer)
	NumSegOn2(Standard_Integer)
	ParamOnSeg1(Standard_Real)
	ParamOnSeg2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter & Poly1,const Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter & Poly2,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Uo(Standard_Real)
	Vo(Standard_Real)
	UInf(Standard_Real)
	VInf(Standard_Real)
	USup(Standard_Real)
	VSup(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const Standard_Real Uo,const Standard_Real Vo,const Standard_Real UInf,const Standard_Real VInf,const Standard_Real USup,const Standard_Real VSup);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbRoots;
		Standard_Integer NbRoots ();
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Roots;
		void Roots (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") AnErrorOccurred;
		Standard_Boolean AnErrorOccurred ();
};


%feature("shadow") Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter::~Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dInt_GInter;
class Geom2dInt_GInter : public IntRes2d_Intersection {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Geom2dInt_GInter;
		 Geom2dInt_GInter ();
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dInt_GInter;
		 Geom2dInt_GInter (const Adaptor2d_Curve2d & C,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	D(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dInt_GInter;
		 Geom2dInt_GInter (const Adaptor2d_Curve2d & C,const IntRes2d_Domain & D,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C1(Adaptor2d_Curve2d)
	C2(Adaptor2d_Curve2d)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dInt_GInter;
		 Geom2dInt_GInter (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C1(Adaptor2d_Curve2d)
	D1(IntRes2d_Domain)
	C2(Adaptor2d_Curve2d)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dInt_GInter;
		 Geom2dInt_GInter (const Adaptor2d_Curve2d & C1,const IntRes2d_Domain & D1,const Adaptor2d_Curve2d & C2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C1(Adaptor2d_Curve2d)
	C2(Adaptor2d_Curve2d)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dInt_GInter;
		 Geom2dInt_GInter (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C1(Adaptor2d_Curve2d)
	D1(IntRes2d_Domain)
	C2(Adaptor2d_Curve2d)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dInt_GInter;
		 Geom2dInt_GInter (const Adaptor2d_Curve2d & C1,const IntRes2d_Domain & D1,const Adaptor2d_Curve2d & C2,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C1(Adaptor2d_Curve2d)
	D1(IntRes2d_Domain)
	C2(Adaptor2d_Curve2d)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const Adaptor2d_Curve2d & C1,const IntRes2d_Domain & D1,const Adaptor2d_Curve2d & C2,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C1(Adaptor2d_Curve2d)
	C2(Adaptor2d_Curve2d)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C1(Adaptor2d_Curve2d)
	D1(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const Adaptor2d_Curve2d & C1,const IntRes2d_Domain & D1,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C1(Adaptor2d_Curve2d)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const Adaptor2d_Curve2d & C1,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C1(Adaptor2d_Curve2d)
	D1(IntRes2d_Domain)
	C2(Adaptor2d_Curve2d)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const Adaptor2d_Curve2d & C1,const IntRes2d_Domain & D1,const Adaptor2d_Curve2d & C2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C1(Adaptor2d_Curve2d)
	C2(Adaptor2d_Curve2d)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C1(Adaptor2d_Curve2d)
	TolDomain(Standard_Real)

Returns:
	IntRes2d_Domain

No detailed docstring for this function.") ComputeDomain;
		IntRes2d_Domain ComputeDomain (const Adaptor2d_Curve2d & C1,const Standard_Real TolDomain);
};


%feature("shadow") Geom2dInt_GInter::~Geom2dInt_GInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dInt_GInter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dInt_Geom2dCurveTool;
class Geom2dInt_Geom2dCurveTool {
	public:
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)

Returns:
	static GeomAbs_CurveType

No detailed docstring for this function.") GetType;
		static GeomAbs_CurveType GetType (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)

Returns:
	static gp_Lin2d

No detailed docstring for this function.") Line;
		static gp_Lin2d Line (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)

Returns:
	static gp_Circ2d

No detailed docstring for this function.") Circle;
		static gp_Circ2d Circle (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)

Returns:
	static gp_Elips2d

No detailed docstring for this function.") Ellipse;
		static gp_Elips2d Ellipse (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)

Returns:
	static gp_Parab2d

No detailed docstring for this function.") Parabola;
		static gp_Parab2d Parabola (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)

Returns:
	static gp_Hypr2d

No detailed docstring for this function.") Hyperbola;
		static gp_Hypr2d Hyperbola (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)

Returns:
	static Standard_Real

No detailed docstring for this function.") EpsX;
		static Standard_Real EpsX (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	Eps_XYZ(Standard_Real)

Returns:
	static Standard_Real

No detailed docstring for this function.") EpsX;
		static Standard_Real EpsX (const Adaptor2d_Curve2d & C,const Standard_Real Eps_XYZ);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbSamples;
		static Standard_Integer NbSamples (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	U0(Standard_Real)
	U1(Standard_Real)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbSamples;
		static Standard_Integer NbSamples (const Adaptor2d_Curve2d & C,const Standard_Real U0,const Standard_Real U1);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)

Returns:
	static Standard_Real

No detailed docstring for this function.") FirstParameter;
		static Standard_Real FirstParameter (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)

Returns:
	static Standard_Real

No detailed docstring for this function.") LastParameter;
		static Standard_Real LastParameter (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	X(Standard_Real)

Returns:
	static gp_Pnt2d

No detailed docstring for this function.") Value;
		static gp_Pnt2d Value (const Adaptor2d_Curve2d & C,const Standard_Real X);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	U(Standard_Real)
	P(gp_Pnt2d)

Returns:
	static void

No detailed docstring for this function.") D0;
		static void D0 (const Adaptor2d_Curve2d & C,const Standard_Real U,gp_Pnt2d & P);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	U(Standard_Real)
	P(gp_Pnt2d)
	T(gp_Vec2d)

Returns:
	static void

No detailed docstring for this function.") D1;
		static void D1 (const Adaptor2d_Curve2d & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & T);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	U(Standard_Real)
	P(gp_Pnt2d)
	T(gp_Vec2d)
	N(gp_Vec2d)

Returns:
	static void

No detailed docstring for this function.") D2;
		static void D2 (const Adaptor2d_Curve2d & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & T,gp_Vec2d & N);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	U(Standard_Real)
	P(gp_Pnt2d)
	T(gp_Vec2d)
	N(gp_Vec2d)
	V(gp_Vec2d)

Returns:
	static void

No detailed docstring for this function.") D3;
		static void D3 (const Adaptor2d_Curve2d & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & T,gp_Vec2d & N,gp_Vec2d & V);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	U(Standard_Real)
	N(Standard_Integer)

Returns:
	static gp_Vec2d

No detailed docstring for this function.") DN;
		static gp_Vec2d DN (const Adaptor2d_Curve2d & C,const Standard_Real U,const Standard_Integer N);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbIntervals;
		static Standard_Integer NbIntervals (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	Tab(TColStd_Array1OfReal)

Returns:
	static void

No detailed docstring for this function.") Intervals;
		static void Intervals (const Adaptor2d_Curve2d & C,TColStd_Array1OfReal & Tab);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	Index(Standard_Integer)
	Tab(TColStd_Array1OfReal)
	U1(Standard_Real)
	U2(Standard_Real)

Returns:
	static void

No detailed docstring for this function.") GetInterval;
		static void GetInterval (const Adaptor2d_Curve2d & C,const Standard_Integer Index,const TColStd_Array1OfReal & Tab,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)

Returns:
	static Standard_Integer

No detailed docstring for this function.") Degree;
		static Standard_Integer Degree (const Adaptor2d_Curve2d & C);
};


%feature("shadow") Geom2dInt_Geom2dCurveTool::~Geom2dInt_Geom2dCurveTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dInt_Geom2dCurveTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dInt_IntConicCurveOfGInter;
class Geom2dInt_IntConicCurveOfGInter : public IntRes2d_Intersection {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Geom2dInt_IntConicCurveOfGInter;
		 Geom2dInt_IntConicCurveOfGInter ();
		%feature("autodoc", "Args:
	L(gp_Lin2d)
	D1(IntRes2d_Domain)
	PCurve(Adaptor2d_Curve2d)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dInt_IntConicCurveOfGInter;
		 Geom2dInt_IntConicCurveOfGInter (const gp_Lin2d & L,const IntRes2d_Domain & D1,const Adaptor2d_Curve2d & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C(gp_Circ2d)
	D1(IntRes2d_Domain)
	PCurve(Adaptor2d_Curve2d)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dInt_IntConicCurveOfGInter;
		 Geom2dInt_IntConicCurveOfGInter (const gp_Circ2d & C,const IntRes2d_Domain & D1,const Adaptor2d_Curve2d & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	E(gp_Elips2d)
	D1(IntRes2d_Domain)
	PCurve(Adaptor2d_Curve2d)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dInt_IntConicCurveOfGInter;
		 Geom2dInt_IntConicCurveOfGInter (const gp_Elips2d & E,const IntRes2d_Domain & D1,const Adaptor2d_Curve2d & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	Prb(gp_Parab2d)
	D1(IntRes2d_Domain)
	PCurve(Adaptor2d_Curve2d)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dInt_IntConicCurveOfGInter;
		 Geom2dInt_IntConicCurveOfGInter (const gp_Parab2d & Prb,const IntRes2d_Domain & D1,const Adaptor2d_Curve2d & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	H(gp_Hypr2d)
	D1(IntRes2d_Domain)
	PCurve(Adaptor2d_Curve2d)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dInt_IntConicCurveOfGInter;
		 Geom2dInt_IntConicCurveOfGInter (const gp_Hypr2d & H,const IntRes2d_Domain & D1,const Adaptor2d_Curve2d & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	L(gp_Lin2d)
	D1(IntRes2d_Domain)
	PCurve(Adaptor2d_Curve2d)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Lin2d & L,const IntRes2d_Domain & D1,const Adaptor2d_Curve2d & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C(gp_Circ2d)
	D1(IntRes2d_Domain)
	PCurve(Adaptor2d_Curve2d)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Circ2d & C,const IntRes2d_Domain & D1,const Adaptor2d_Curve2d & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	E(gp_Elips2d)
	D1(IntRes2d_Domain)
	PCurve(Adaptor2d_Curve2d)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Elips2d & E,const IntRes2d_Domain & D1,const Adaptor2d_Curve2d & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	Prb(gp_Parab2d)
	D1(IntRes2d_Domain)
	PCurve(Adaptor2d_Curve2d)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Parab2d & Prb,const IntRes2d_Domain & D1,const Adaptor2d_Curve2d & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	H(gp_Hypr2d)
	D1(IntRes2d_Domain)
	PCurve(Adaptor2d_Curve2d)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Hypr2d & H,const IntRes2d_Domain & D1,const Adaptor2d_Curve2d & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
};


%feature("shadow") Geom2dInt_IntConicCurveOfGInter::~Geom2dInt_IntConicCurveOfGInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dInt_IntConicCurveOfGInter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter;
class Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter : public math_FunctionWithDerivative {
	public:
		%feature("autodoc", "Args:
	IT(IntCurve_IConicTool)
	PC(Adaptor2d_Curve2d)

Returns:
	None

No detailed docstring for this function.") Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter;
		 Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter (const IntCurve_IConicTool & IT,const Adaptor2d_Curve2d & PC);
		%feature("autodoc", "Args:
	Param(Standard_Real)
	F(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Value;
		Standard_Boolean Value (const Standard_Real Param,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Param(Standard_Real)
	D(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Derivative;
		Standard_Boolean Derivative (const Standard_Real Param,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Param(Standard_Real)
	F(Standard_Real)
	D(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Values;
		Standard_Boolean Values (const Standard_Real Param,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter::~Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter;
class Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter : public math_FunctionWithDerivative {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter;
		 Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter ();
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	C(Adaptor2d_Curve2d)

Returns:
	None

No detailed docstring for this function.") Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter;
		 Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") SetPoint;
		void SetPoint (const gp_Pnt2d & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	F(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Value;
		Standard_Boolean Value (const Standard_Real U,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	DF(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Derivative;
		Standard_Boolean Derivative (const Standard_Real U,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	F(Standard_Real)
	DF(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Values;
		Standard_Boolean Values (const Standard_Real U,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

No detailed docstring for this function.") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") Point;
		const Extrema_POnCurv2d & Point (const Standard_Integer N);
		%feature("autodoc", "Args:
	theUfirst(Standard_Real)
	theUlast(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SubIntervalInitialize;
		void SubIntervalInitialize (const Standard_Real theUfirst,const Standard_Real theUlast);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") SearchOfTolerance;
		Standard_Real SearchOfTolerance ();
};


%feature("shadow") Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter::~Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dInt_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter;
class Geom2dInt_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Geom2dInt_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter;
		 Geom2dInt_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Geom2dInt_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter)

Returns:
	Geom2dInt_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter

No detailed docstring for this function.") Assign;
		const Geom2dInt_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter & Assign (const Geom2dInt_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter & Other);
		%feature("autodoc", "Args:
	Other(Geom2dInt_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter)

Returns:
	Geom2dInt_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter

No detailed docstring for this function.") operator=;
		const Geom2dInt_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter & operator = (const Geom2dInt_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter & Other);
		%feature("autodoc", "Args:
	T(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Extrema_POnCurv2d & T);
		%feature("autodoc", "Args:
	S(Geom2dInt_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Geom2dInt_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter & S);
		%feature("autodoc", "Args:
	T(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Extrema_POnCurv2d & T);
		%feature("autodoc", "Args:
	S(Geom2dInt_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Geom2dInt_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Extrema_POnCurv2d & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Geom2dInt_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Geom2dInt_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Extrema_POnCurv2d & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Geom2dInt_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Geom2dInt_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter & S);
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") First;
		const Extrema_POnCurv2d & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") Last;
		const Extrema_POnCurv2d & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Geom2dInt_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Geom2dInt_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") Value;
		const Extrema_POnCurv2d & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv2d & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") ChangeValue;
		Extrema_POnCurv2d & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") Geom2dInt_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter::~Geom2dInt_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dInt_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dInt_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter;
class Geom2dInt_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Extrema_POnCurv2d)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Geom2dInt_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter;
		 Geom2dInt_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter (const Extrema_POnCurv2d & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") Value;
		Extrema_POnCurv2d & Value ();
};


%feature("shadow") Geom2dInt_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter::~Geom2dInt_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dInt_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Geom2dInt_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter {
	Handle_Geom2dInt_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter GetHandle() {
	return *(Handle_Geom2dInt_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter*) &$self;
	}
};

%nodefaultctor Handle_Geom2dInt_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter;
class Handle_Geom2dInt_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Geom2dInt_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter();
        Handle_Geom2dInt_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter(const Handle_Geom2dInt_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter &aHandle);
        Handle_Geom2dInt_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter(const Geom2dInt_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Geom2dInt_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Geom2dInt_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter {
    Geom2dInt_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter* GetObject() {
    return (Geom2dInt_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter*)$self->Access();
    }
};
%feature("shadow") Handle_Geom2dInt_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter::~Handle_Geom2dInt_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Geom2dInt_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Geom2dInt_TheCurveLocatorOfTheProjPCurOfGInter;
class Geom2dInt_TheCurveLocatorOfTheProjPCurOfGInter {
	public:
};


%feature("shadow") Geom2dInt_TheCurveLocatorOfTheProjPCurOfGInter::~Geom2dInt_TheCurveLocatorOfTheProjPCurOfGInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dInt_TheCurveLocatorOfTheProjPCurOfGInter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter;
class Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter : public math_FunctionSetWithDerivatives {
	public:
		%feature("autodoc", "Args:
	curve1(Adaptor2d_Curve2d)
	curve2(Adaptor2d_Curve2d)

Returns:
	None

No detailed docstring for this function.") Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter;
		 Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter (const Adaptor2d_Curve2d & curve1,const Adaptor2d_Curve2d & curve2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("autodoc", "Args:
	X(math_Vector)
	D(math_Matrix)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)
	D(math_Matrix)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
};


%feature("shadow") Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter::~Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dInt_TheIntConicCurveOfGInter;
class Geom2dInt_TheIntConicCurveOfGInter : public IntRes2d_Intersection {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Geom2dInt_TheIntConicCurveOfGInter;
		 Geom2dInt_TheIntConicCurveOfGInter ();
		%feature("autodoc", "Args:
	L(gp_Lin2d)
	D1(IntRes2d_Domain)
	PCurve(Adaptor2d_Curve2d)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dInt_TheIntConicCurveOfGInter;
		 Geom2dInt_TheIntConicCurveOfGInter (const gp_Lin2d & L,const IntRes2d_Domain & D1,const Adaptor2d_Curve2d & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C(gp_Circ2d)
	D1(IntRes2d_Domain)
	PCurve(Adaptor2d_Curve2d)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dInt_TheIntConicCurveOfGInter;
		 Geom2dInt_TheIntConicCurveOfGInter (const gp_Circ2d & C,const IntRes2d_Domain & D1,const Adaptor2d_Curve2d & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	E(gp_Elips2d)
	D1(IntRes2d_Domain)
	PCurve(Adaptor2d_Curve2d)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dInt_TheIntConicCurveOfGInter;
		 Geom2dInt_TheIntConicCurveOfGInter (const gp_Elips2d & E,const IntRes2d_Domain & D1,const Adaptor2d_Curve2d & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	Prb(gp_Parab2d)
	D1(IntRes2d_Domain)
	PCurve(Adaptor2d_Curve2d)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dInt_TheIntConicCurveOfGInter;
		 Geom2dInt_TheIntConicCurveOfGInter (const gp_Parab2d & Prb,const IntRes2d_Domain & D1,const Adaptor2d_Curve2d & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	H(gp_Hypr2d)
	D1(IntRes2d_Domain)
	PCurve(Adaptor2d_Curve2d)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dInt_TheIntConicCurveOfGInter;
		 Geom2dInt_TheIntConicCurveOfGInter (const gp_Hypr2d & H,const IntRes2d_Domain & D1,const Adaptor2d_Curve2d & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	L(gp_Lin2d)
	D1(IntRes2d_Domain)
	PCurve(Adaptor2d_Curve2d)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Lin2d & L,const IntRes2d_Domain & D1,const Adaptor2d_Curve2d & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C(gp_Circ2d)
	D1(IntRes2d_Domain)
	PCurve(Adaptor2d_Curve2d)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Circ2d & C,const IntRes2d_Domain & D1,const Adaptor2d_Curve2d & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	E(gp_Elips2d)
	D1(IntRes2d_Domain)
	PCurve(Adaptor2d_Curve2d)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Elips2d & E,const IntRes2d_Domain & D1,const Adaptor2d_Curve2d & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	Prb(gp_Parab2d)
	D1(IntRes2d_Domain)
	PCurve(Adaptor2d_Curve2d)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Parab2d & Prb,const IntRes2d_Domain & D1,const Adaptor2d_Curve2d & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	H(gp_Hypr2d)
	D1(IntRes2d_Domain)
	PCurve(Adaptor2d_Curve2d)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Hypr2d & H,const IntRes2d_Domain & D1,const Adaptor2d_Curve2d & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
};


%feature("shadow") Geom2dInt_TheIntConicCurveOfGInter::~Geom2dInt_TheIntConicCurveOfGInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dInt_TheIntConicCurveOfGInter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dInt_TheIntPCurvePCurveOfGInter;
class Geom2dInt_TheIntPCurvePCurveOfGInter : public IntRes2d_Intersection {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Geom2dInt_TheIntPCurvePCurveOfGInter;
		 Geom2dInt_TheIntPCurvePCurveOfGInter ();
		%feature("autodoc", "Args:
	Curve1(Adaptor2d_Curve2d)
	Domain1(IntRes2d_Domain)
	Curve2(Adaptor2d_Curve2d)
	Domain2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const Adaptor2d_Curve2d & Curve1,const IntRes2d_Domain & Domain1,const Adaptor2d_Curve2d & Curve2,const IntRes2d_Domain & Domain2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	Curve1(Adaptor2d_Curve2d)
	Domain1(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const Adaptor2d_Curve2d & Curve1,const IntRes2d_Domain & Domain1,const Standard_Real TolConf,const Standard_Real Tol);
};


%feature("shadow") Geom2dInt_TheIntPCurvePCurveOfGInter::~Geom2dInt_TheIntPCurvePCurveOfGInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dInt_TheIntPCurvePCurveOfGInter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter;
class Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter : public IntRes2d_Intersection {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter;
		 Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter ();
		%feature("autodoc", "Args:
	ITool(IntCurve_IConicTool)
	Dom1(IntRes2d_Domain)
	PCurve(Adaptor2d_Curve2d)
	Dom2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter;
		 Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter (const IntCurve_IConicTool & ITool,const IntRes2d_Domain & Dom1,const Adaptor2d_Curve2d & PCurve,const IntRes2d_Domain & Dom2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	ITool(IntCurve_IConicTool)
	Dom1(IntRes2d_Domain)
	PCurve(Adaptor2d_Curve2d)
	Dom2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const IntCurve_IConicTool & ITool,const IntRes2d_Domain & Dom1,const Adaptor2d_Curve2d & PCurve,const IntRes2d_Domain & Dom2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	parameter(Standard_Real)
	point(gp_Pnt2d)
	TheParCurev(Adaptor2d_Curve2d)
	TheImpTool(IntCurve_IConicTool)

Returns:
	Standard_Real

No detailed docstring for this function.") FindU;
		Standard_Real FindU (const Standard_Real parameter,gp_Pnt2d & point,const Adaptor2d_Curve2d & TheParCurev,const IntCurve_IConicTool & TheImpTool);
		%feature("autodoc", "Args:
	parameter(Standard_Real)
	point(gp_Pnt2d)
	TheImpTool(IntCurve_IConicTool)
	ParCurve(Adaptor2d_Curve2d)
	TheParCurveDomain(IntRes2d_Domain)
	V0(Standard_Real)
	V1(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	Standard_Real

No detailed docstring for this function.") FindV;
		Standard_Real FindV (const Standard_Real parameter,gp_Pnt2d & point,const IntCurve_IConicTool & TheImpTool,const Adaptor2d_Curve2d & ParCurve,const IntRes2d_Domain & TheParCurveDomain,const Standard_Real V0,const Standard_Real V1,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	TheImpTool(IntCurve_IConicTool)
	TheParCurve(Adaptor2d_Curve2d)
	TheImpCurveDomain(IntRes2d_Domain)
	TheParCurveDomain(IntRes2d_Domain)
	NbResultats(Standard_Integer)
	Inter2_And_Domain2(TColStd_Array1OfReal)
	Inter1(TColStd_Array1OfReal)
	Resultat1(TColStd_Array1OfReal)
	Resultat2(TColStd_Array1OfReal)
	EpsNul(Standard_Real)

Returns:
	None

No detailed docstring for this function.") And_Domaine_Objet1_Intersections;
		void And_Domaine_Objet1_Intersections (const IntCurve_IConicTool & TheImpTool,const Adaptor2d_Curve2d & TheParCurve,const IntRes2d_Domain & TheImpCurveDomain,const IntRes2d_Domain & TheParCurveDomain,Standard_Integer &OutValue,TColStd_Array1OfReal & Inter2_And_Domain2,TColStd_Array1OfReal & Inter1,TColStd_Array1OfReal & Resultat1,TColStd_Array1OfReal & Resultat2,const Standard_Real EpsNul);
};


%feature("shadow") Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter::~Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter;
class Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter;
		 Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter ();
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	C(Adaptor2d_Curve2d)
	U0(Standard_Real)
	TolU(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter;
		 Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Real U0,const Standard_Real TolU);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	C(Adaptor2d_Curve2d)
	U0(Standard_Real)
	Umin(Standard_Real)
	Usup(Standard_Real)
	TolU(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter;
		 Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Real U0,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	Umin(Standard_Real)
	Usup(Standard_Real)
	TolU(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	U0(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Pnt2d & P,const Standard_Real U0);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") SquareDistance;
		Standard_Real SquareDistance ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsMin;
		Standard_Boolean IsMin ();
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") Point;
		const Extrema_POnCurv2d & Point ();
};


%feature("shadow") Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter::~Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter;
class Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter : public Intf_Polygon2d {
	public:
		%feature("autodoc", "Args:
	Curve(Adaptor2d_Curve2d)
	NbPnt(Standard_Integer)
	Domain(IntRes2d_Domain)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter;
		 Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter (const Adaptor2d_Curve2d & Curve,const Standard_Integer NbPnt,const IntRes2d_Domain & Domain,const Standard_Real Tol);
		%feature("autodoc", "Args:
	Curve(Adaptor2d_Curve2d)
	NbPnt(Standard_Integer)
	Domain(IntRes2d_Domain)
	Tol(Standard_Real)
	OtherBox(Bnd_Box2d)

Returns:
	None

No detailed docstring for this function.") Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter;
		 Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter (const Adaptor2d_Curve2d & Curve,const Standard_Integer NbPnt,const IntRes2d_Domain & Domain,const Standard_Real Tol,const Bnd_Box2d & OtherBox);
		%feature("autodoc", "Args:
	Curve(Adaptor2d_Curve2d)
	OtherBox(Bnd_Box2d)

Returns:
	None

No detailed docstring for this function.") ComputeWithBox;
		void ComputeWithBox (const Adaptor2d_Curve2d & Curve,const Bnd_Box2d & OtherBox);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") DeflectionOverEstimation;
		Standard_Real DeflectionOverEstimation ();
		%feature("autodoc", "Args:
	x(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetDeflectionOverEstimation;
		void SetDeflectionOverEstimation (const Standard_Real x);
		%feature("autodoc", "Args:
	clos(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Closed;
		void Closed (const Standard_Boolean clos);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbSegments;
		Standard_Integer NbSegments ();
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)
	theBegin(gp_Pnt2d)
	theEnd(gp_Pnt2d)

Returns:
	virtual void

No detailed docstring for this function.") Segment;
		virtual void Segment (const Standard_Integer theIndex,gp_Pnt2d & theBegin,gp_Pnt2d & theEnd);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") InfParameter;
		Standard_Real InfParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") SupParameter;
		Standard_Real SupParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") AutoIntersectionIsPossible;
		Standard_Boolean AutoIntersectionIsPossible ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	ParamOnLine(Standard_Real)

Returns:
	Standard_Real

No detailed docstring for this function.") ApproxParamOnCurve;
		Standard_Real ApproxParamOnCurve (const Standard_Integer Index,const Standard_Real ParamOnLine);
		%feature("autodoc", "Args:
	x(Standard_Real)
	y(Standard_Real)
	x1(Standard_Real)
	x2(Standard_Real)
	y1(Standard_Real)
	y2(Standard_Real)

Returns:
	Standard_Integer

No detailed docstring for this function.") CalculRegion;
		Standard_Integer CalculRegion (const Standard_Real x,const Standard_Real y,const Standard_Real x1,const Standard_Real x2,const Standard_Real y1,const Standard_Real y2);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dump;
		void Dump ();
};


%feature("shadow") Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter::~Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dInt_TheProjPCurOfGInter;
class Geom2dInt_TheProjPCurOfGInter {
	public:
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	Pnt(gp_Pnt2d)
	Tol(Standard_Real)

Returns:
	static Standard_Real

No detailed docstring for this function.") FindParameter;
		static Standard_Real FindParameter (const Adaptor2d_Curve2d & C,const gp_Pnt2d & Pnt,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	Pnt(gp_Pnt2d)
	LowParameter(Standard_Real)
	HighParameter(Standard_Real)
	Tol(Standard_Real)

Returns:
	static Standard_Real

No detailed docstring for this function.") FindParameter;
		static Standard_Real FindParameter (const Adaptor2d_Curve2d & C,const gp_Pnt2d & Pnt,const Standard_Real LowParameter,const Standard_Real HighParameter,const Standard_Real Tol);
};


%feature("shadow") Geom2dInt_TheProjPCurOfGInter::~Geom2dInt_TheProjPCurOfGInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dInt_TheProjPCurOfGInter {
	void _kill_pointed() {
		delete $self;
	}
};
