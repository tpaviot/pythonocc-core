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
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param C2:
	:type C2: Adaptor2d_Curve2d &
	:param Tol:
	:type Tol: float
	:rtype: None
") Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter;
		 Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2,const Standard_Real Tol);
		%feature("autodoc", "	:param Poly1:
	:type Poly1: Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter &
	:param Poly2:
	:type Poly2: Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter &
	:param NumSegOn1:
	:type NumSegOn1: Standard_Integer &
	:param NumSegOn2:
	:type NumSegOn2: Standard_Integer &
	:param ParamOnSeg1:
	:type ParamOnSeg1: float &
	:param ParamOnSeg2:
	:type ParamOnSeg2: float &
	:rtype: None
") Perform;
		void Perform (const Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter & Poly1,const Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter & Poly2,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:param Uo:
	:type Uo: float
	:param Vo:
	:type Vo: float
	:param UInf:
	:type UInf: float
	:param VInf:
	:type VInf: float
	:param USup:
	:type USup: float
	:param VSup:
	:type VSup: float
	:rtype: None
") Perform;
		void Perform (const Standard_Real Uo,const Standard_Real Vo,const Standard_Real UInf,const Standard_Real VInf,const Standard_Real USup,const Standard_Real VSup);
		%feature("autodoc", "	:rtype: int
") NbRoots;
		Standard_Integer NbRoots ();
		%feature("autodoc", "	:param U:
	:type U: float &
	:param V:
	:type V: float &
	:rtype: None
") Roots;
		void Roots (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:rtype: bool
") AnErrorOccurred;
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
		%feature("autodoc", "	:rtype: None
") Geom2dInt_GInter;
		 Geom2dInt_GInter ();
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Geom2dInt_GInter;
		 Geom2dInt_GInter (const Adaptor2d_Curve2d & C,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:param D:
	:type D: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Geom2dInt_GInter;
		 Geom2dInt_GInter (const Adaptor2d_Curve2d & C,const IntRes2d_Domain & D,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param C2:
	:type C2: Adaptor2d_Curve2d &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Geom2dInt_GInter;
		 Geom2dInt_GInter (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param D1:
	:type D1: IntRes2d_Domain &
	:param C2:
	:type C2: Adaptor2d_Curve2d &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Geom2dInt_GInter;
		 Geom2dInt_GInter (const Adaptor2d_Curve2d & C1,const IntRes2d_Domain & D1,const Adaptor2d_Curve2d & C2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param C2:
	:type C2: Adaptor2d_Curve2d &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Geom2dInt_GInter;
		 Geom2dInt_GInter (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param D1:
	:type D1: IntRes2d_Domain &
	:param C2:
	:type C2: Adaptor2d_Curve2d &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Geom2dInt_GInter;
		 Geom2dInt_GInter (const Adaptor2d_Curve2d & C1,const IntRes2d_Domain & D1,const Adaptor2d_Curve2d & C2,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param D1:
	:type D1: IntRes2d_Domain &
	:param C2:
	:type C2: Adaptor2d_Curve2d &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const Adaptor2d_Curve2d & C1,const IntRes2d_Domain & D1,const Adaptor2d_Curve2d & C2,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param C2:
	:type C2: Adaptor2d_Curve2d &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param D1:
	:type D1: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const Adaptor2d_Curve2d & C1,const IntRes2d_Domain & D1,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const Adaptor2d_Curve2d & C1,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param D1:
	:type D1: IntRes2d_Domain &
	:param C2:
	:type C2: Adaptor2d_Curve2d &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const Adaptor2d_Curve2d & C1,const IntRes2d_Domain & D1,const Adaptor2d_Curve2d & C2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param C2:
	:type C2: Adaptor2d_Curve2d &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param TolDomain:
	:type TolDomain: float
	:rtype: IntRes2d_Domain
") ComputeDomain;
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
class Geom2dInt_Geom2dCurveTool {
	public:
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: GeomAbs_CurveType
") GetType;
		static GeomAbs_CurveType GetType (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: gp_Lin2d
") Line;
		static gp_Lin2d Line (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: gp_Circ2d
") Circle;
		static gp_Circ2d Circle (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: gp_Elips2d
") Ellipse;
		static gp_Elips2d Ellipse (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: gp_Parab2d
") Parabola;
		static gp_Parab2d Parabola (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: gp_Hypr2d
") Hyperbola;
		static gp_Hypr2d Hyperbola (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: float
") EpsX;
		static Standard_Real EpsX (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Eps_XYZ:
	:type Eps_XYZ: float
	:rtype: float
") EpsX;
		static Standard_Real EpsX (const Adaptor2d_Curve2d & C,const Standard_Real Eps_XYZ);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: int
") NbSamples;
		static Standard_Integer NbSamples (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:param U0:
	:type U0: float
	:param U1:
	:type U1: float
	:rtype: int
") NbSamples;
		static Standard_Integer NbSamples (const Adaptor2d_Curve2d & C,const Standard_Real U0,const Standard_Real U1);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: float
") FirstParameter;
		static Standard_Real FirstParameter (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: float
") LastParameter;
		static Standard_Real LastParameter (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:param X:
	:type X: float
	:rtype: gp_Pnt2d
") Value;
		static gp_Pnt2d Value (const Adaptor2d_Curve2d & C,const Standard_Real X);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: void
") D0;
		static void D0 (const Adaptor2d_Curve2d & C,const Standard_Real U,gp_Pnt2d & P);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param T:
	:type T: gp_Vec2d
	:rtype: void
") D1;
		static void D1 (const Adaptor2d_Curve2d & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & T);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param T:
	:type T: gp_Vec2d
	:param N:
	:type N: gp_Vec2d
	:rtype: void
") D2;
		static void D2 (const Adaptor2d_Curve2d & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & T,gp_Vec2d & N);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param T:
	:type T: gp_Vec2d
	:param N:
	:type N: gp_Vec2d
	:param V:
	:type V: gp_Vec2d
	:rtype: void
") D3;
		static void D3 (const Adaptor2d_Curve2d & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & T,gp_Vec2d & N,gp_Vec2d & V);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:param U:
	:type U: float
	:param N:
	:type N: Standard_Integer
	:rtype: gp_Vec2d
") DN;
		static gp_Vec2d DN (const Adaptor2d_Curve2d & C,const Standard_Real U,const Standard_Integer N);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: int
") NbIntervals;
		static Standard_Integer NbIntervals (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Tab:
	:type Tab: TColStd_Array1OfReal &
	:rtype: void
") Intervals;
		static void Intervals (const Adaptor2d_Curve2d & C,TColStd_Array1OfReal & Tab);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Index:
	:type Index: Standard_Integer
	:param Tab:
	:type Tab: TColStd_Array1OfReal &
	:param U1:
	:type U1: float &
	:param U2:
	:type U2: float &
	:rtype: void
") GetInterval;
		static void GetInterval (const Adaptor2d_Curve2d & C,const Standard_Integer Index,const TColStd_Array1OfReal & Tab,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: int
") Degree;
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
		%feature("autodoc", "	:rtype: None
") Geom2dInt_IntConicCurveOfGInter;
		 Geom2dInt_IntConicCurveOfGInter ();
		%feature("autodoc", "	:param L:
	:type L: gp_Lin2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param PCurve:
	:type PCurve: Adaptor2d_Curve2d &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Geom2dInt_IntConicCurveOfGInter;
		 Geom2dInt_IntConicCurveOfGInter (const gp_Lin2d & L,const IntRes2d_Domain & D1,const Adaptor2d_Curve2d & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param C:
	:type C: gp_Circ2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param PCurve:
	:type PCurve: Adaptor2d_Curve2d &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Geom2dInt_IntConicCurveOfGInter;
		 Geom2dInt_IntConicCurveOfGInter (const gp_Circ2d & C,const IntRes2d_Domain & D1,const Adaptor2d_Curve2d & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param E:
	:type E: gp_Elips2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param PCurve:
	:type PCurve: Adaptor2d_Curve2d &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Geom2dInt_IntConicCurveOfGInter;
		 Geom2dInt_IntConicCurveOfGInter (const gp_Elips2d & E,const IntRes2d_Domain & D1,const Adaptor2d_Curve2d & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param Prb:
	:type Prb: gp_Parab2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param PCurve:
	:type PCurve: Adaptor2d_Curve2d &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Geom2dInt_IntConicCurveOfGInter;
		 Geom2dInt_IntConicCurveOfGInter (const gp_Parab2d & Prb,const IntRes2d_Domain & D1,const Adaptor2d_Curve2d & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param H:
	:type H: gp_Hypr2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param PCurve:
	:type PCurve: Adaptor2d_Curve2d &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Geom2dInt_IntConicCurveOfGInter;
		 Geom2dInt_IntConicCurveOfGInter (const gp_Hypr2d & H,const IntRes2d_Domain & D1,const Adaptor2d_Curve2d & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param L:
	:type L: gp_Lin2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param PCurve:
	:type PCurve: Adaptor2d_Curve2d &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Lin2d & L,const IntRes2d_Domain & D1,const Adaptor2d_Curve2d & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param C:
	:type C: gp_Circ2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param PCurve:
	:type PCurve: Adaptor2d_Curve2d &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Circ2d & C,const IntRes2d_Domain & D1,const Adaptor2d_Curve2d & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param E:
	:type E: gp_Elips2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param PCurve:
	:type PCurve: Adaptor2d_Curve2d &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Elips2d & E,const IntRes2d_Domain & D1,const Adaptor2d_Curve2d & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param Prb:
	:type Prb: gp_Parab2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param PCurve:
	:type PCurve: Adaptor2d_Curve2d &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Parab2d & Prb,const IntRes2d_Domain & D1,const Adaptor2d_Curve2d & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param H:
	:type H: gp_Hypr2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param PCurve:
	:type PCurve: Adaptor2d_Curve2d &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
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
		%feature("autodoc", "	:param IT:
	:type IT: IntCurve_IConicTool &
	:param PC:
	:type PC: Adaptor2d_Curve2d &
	:rtype: None
") Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter;
		 Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter (const IntCurve_IConicTool & IT,const Adaptor2d_Curve2d & PC);
		%feature("autodoc", "	:param Param:
	:type Param: float
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Real Param,Standard_Real &OutValue);
		%feature("autodoc", "	:param Param:
	:type Param: float
	:param D:
	:type D: float &
	:rtype: bool
") Derivative;
		Standard_Boolean Derivative (const Standard_Real Param,Standard_Real &OutValue);
		%feature("autodoc", "	:param Param:
	:type Param: float
	:param F:
	:type F: float &
	:param D:
	:type D: float &
	:rtype: bool
") Values;
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
		%feature("autodoc", "	:rtype: None
") Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter;
		 Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter ();
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: None
") Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter;
		 Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: None
") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") SetPoint;
		void SetPoint (const gp_Pnt2d & P);
		%feature("autodoc", "	:param U:
	:type U: float
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Real U,Standard_Real &OutValue);
		%feature("autodoc", "	:param U:
	:type U: float
	:param DF:
	:type DF: float &
	:rtype: bool
") Derivative;
		Standard_Boolean Derivative (const Standard_Real U,Standard_Real &OutValue);
		%feature("autodoc", "	:param U:
	:type U: float
	:param F:
	:type F: float &
	:param DF:
	:type DF: float &
	:rtype: bool
") Values;
		Standard_Boolean Values (const Standard_Real U,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("autodoc", "	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point (const Standard_Integer N);
		%feature("autodoc", "	:param theUfirst:
	:type theUfirst: float
	:param theUlast:
	:type theUlast: float
	:rtype: None
") SubIntervalInitialize;
		void SubIntervalInitialize (const Standard_Real theUfirst,const Standard_Real theUlast);
		%feature("autodoc", "	:rtype: float
") SearchOfTolerance;
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
		%feature("autodoc", "	:rtype: None
") Geom2dInt_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter;
		 Geom2dInt_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Geom2dInt_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter &
	:rtype: Geom2dInt_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter
") Assign;
		const Geom2dInt_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter & Assign (const Geom2dInt_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Geom2dInt_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter &
	:rtype: Geom2dInt_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter
") operator=;
		const Geom2dInt_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter & operator = (const Geom2dInt_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter & Other);
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") Append;
		void Append (const Extrema_POnCurv2d & T);
		%feature("autodoc", "	:param S:
	:type S: Geom2dInt_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter &
	:rtype: None
") Append;
		void Append (Geom2dInt_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter & S);
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") Prepend;
		void Prepend (const Extrema_POnCurv2d & T);
		%feature("autodoc", "	:param S:
	:type S: Geom2dInt_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter &
	:rtype: None
") Prepend;
		void Prepend (Geom2dInt_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Extrema_POnCurv2d & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Geom2dInt_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Geom2dInt_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Extrema_POnCurv2d & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Geom2dInt_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Geom2dInt_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter & S);
		%feature("autodoc", "	:rtype: Extrema_POnCurv2d
") First;
		const Extrema_POnCurv2d & First ();
		%feature("autodoc", "	:rtype: Extrema_POnCurv2d
") Last;
		const Extrema_POnCurv2d & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Geom2dInt_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Geom2dInt_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Extrema_POnCurv2d
") Value;
		const Extrema_POnCurv2d & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Extrema_POnCurv2d &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv2d & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Extrema_POnCurv2d
") ChangeValue;
		Extrema_POnCurv2d & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
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
		%feature("autodoc", "	:param I:
	:type I: Extrema_POnCurv2d &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Geom2dInt_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter;
		 Geom2dInt_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter (const Extrema_POnCurv2d & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Extrema_POnCurv2d
") Value;
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
		%feature("autodoc", "	:param curve1:
	:type curve1: Adaptor2d_Curve2d &
	:param curve2:
	:type curve2: Adaptor2d_Curve2d &
	:rtype: None
") Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter;
		 Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter (const Adaptor2d_Curve2d & curve1,const Adaptor2d_Curve2d & curve2);
		%feature("autodoc", "	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Values;
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
		%feature("autodoc", "	:rtype: None
") Geom2dInt_TheIntConicCurveOfGInter;
		 Geom2dInt_TheIntConicCurveOfGInter ();
		%feature("autodoc", "	:param L:
	:type L: gp_Lin2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param PCurve:
	:type PCurve: Adaptor2d_Curve2d &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Geom2dInt_TheIntConicCurveOfGInter;
		 Geom2dInt_TheIntConicCurveOfGInter (const gp_Lin2d & L,const IntRes2d_Domain & D1,const Adaptor2d_Curve2d & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param C:
	:type C: gp_Circ2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param PCurve:
	:type PCurve: Adaptor2d_Curve2d &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Geom2dInt_TheIntConicCurveOfGInter;
		 Geom2dInt_TheIntConicCurveOfGInter (const gp_Circ2d & C,const IntRes2d_Domain & D1,const Adaptor2d_Curve2d & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param E:
	:type E: gp_Elips2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param PCurve:
	:type PCurve: Adaptor2d_Curve2d &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Geom2dInt_TheIntConicCurveOfGInter;
		 Geom2dInt_TheIntConicCurveOfGInter (const gp_Elips2d & E,const IntRes2d_Domain & D1,const Adaptor2d_Curve2d & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param Prb:
	:type Prb: gp_Parab2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param PCurve:
	:type PCurve: Adaptor2d_Curve2d &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Geom2dInt_TheIntConicCurveOfGInter;
		 Geom2dInt_TheIntConicCurveOfGInter (const gp_Parab2d & Prb,const IntRes2d_Domain & D1,const Adaptor2d_Curve2d & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param H:
	:type H: gp_Hypr2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param PCurve:
	:type PCurve: Adaptor2d_Curve2d &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Geom2dInt_TheIntConicCurveOfGInter;
		 Geom2dInt_TheIntConicCurveOfGInter (const gp_Hypr2d & H,const IntRes2d_Domain & D1,const Adaptor2d_Curve2d & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param L:
	:type L: gp_Lin2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param PCurve:
	:type PCurve: Adaptor2d_Curve2d &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Lin2d & L,const IntRes2d_Domain & D1,const Adaptor2d_Curve2d & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param C:
	:type C: gp_Circ2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param PCurve:
	:type PCurve: Adaptor2d_Curve2d &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Circ2d & C,const IntRes2d_Domain & D1,const Adaptor2d_Curve2d & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param E:
	:type E: gp_Elips2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param PCurve:
	:type PCurve: Adaptor2d_Curve2d &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Elips2d & E,const IntRes2d_Domain & D1,const Adaptor2d_Curve2d & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param Prb:
	:type Prb: gp_Parab2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param PCurve:
	:type PCurve: Adaptor2d_Curve2d &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Parab2d & Prb,const IntRes2d_Domain & D1,const Adaptor2d_Curve2d & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param H:
	:type H: gp_Hypr2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param PCurve:
	:type PCurve: Adaptor2d_Curve2d &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
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
		%feature("autodoc", "	:rtype: None
") Geom2dInt_TheIntPCurvePCurveOfGInter;
		 Geom2dInt_TheIntPCurvePCurveOfGInter ();
		%feature("autodoc", "	:param Curve1:
	:type Curve1: Adaptor2d_Curve2d &
	:param Domain1:
	:type Domain1: IntRes2d_Domain &
	:param Curve2:
	:type Curve2: Adaptor2d_Curve2d &
	:param Domain2:
	:type Domain2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const Adaptor2d_Curve2d & Curve1,const IntRes2d_Domain & Domain1,const Adaptor2d_Curve2d & Curve2,const IntRes2d_Domain & Domain2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param Curve1:
	:type Curve1: Adaptor2d_Curve2d &
	:param Domain1:
	:type Domain1: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
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
		%feature("autodoc", "	:rtype: None
") Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter;
		 Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter ();
		%feature("autodoc", "	:param ITool:
	:type ITool: IntCurve_IConicTool &
	:param Dom1:
	:type Dom1: IntRes2d_Domain &
	:param PCurve:
	:type PCurve: Adaptor2d_Curve2d &
	:param Dom2:
	:type Dom2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter;
		 Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter (const IntCurve_IConicTool & ITool,const IntRes2d_Domain & Dom1,const Adaptor2d_Curve2d & PCurve,const IntRes2d_Domain & Dom2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param ITool:
	:type ITool: IntCurve_IConicTool &
	:param Dom1:
	:type Dom1: IntRes2d_Domain &
	:param PCurve:
	:type PCurve: Adaptor2d_Curve2d &
	:param Dom2:
	:type Dom2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const IntCurve_IConicTool & ITool,const IntRes2d_Domain & Dom1,const Adaptor2d_Curve2d & PCurve,const IntRes2d_Domain & Dom2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param parameter:
	:type parameter: float
	:param point:
	:type point: gp_Pnt2d
	:param TheParCurev:
	:type TheParCurev: Adaptor2d_Curve2d &
	:param TheImpTool:
	:type TheImpTool: IntCurve_IConicTool &
	:rtype: float
") FindU;
		Standard_Real FindU (const Standard_Real parameter,gp_Pnt2d & point,const Adaptor2d_Curve2d & TheParCurev,const IntCurve_IConicTool & TheImpTool);
		%feature("autodoc", "	:param parameter:
	:type parameter: float
	:param point:
	:type point: gp_Pnt2d
	:param TheImpTool:
	:type TheImpTool: IntCurve_IConicTool &
	:param ParCurve:
	:type ParCurve: Adaptor2d_Curve2d &
	:param TheParCurveDomain:
	:type TheParCurveDomain: IntRes2d_Domain &
	:param V0:
	:type V0: float
	:param V1:
	:type V1: float
	:param Tolerance:
	:type Tolerance: float
	:rtype: float
") FindV;
		Standard_Real FindV (const Standard_Real parameter,gp_Pnt2d & point,const IntCurve_IConicTool & TheImpTool,const Adaptor2d_Curve2d & ParCurve,const IntRes2d_Domain & TheParCurveDomain,const Standard_Real V0,const Standard_Real V1,const Standard_Real Tolerance);
		%feature("autodoc", "	:param TheImpTool:
	:type TheImpTool: IntCurve_IConicTool &
	:param TheParCurve:
	:type TheParCurve: Adaptor2d_Curve2d &
	:param TheImpCurveDomain:
	:type TheImpCurveDomain: IntRes2d_Domain &
	:param TheParCurveDomain:
	:type TheParCurveDomain: IntRes2d_Domain &
	:param NbResultats:
	:type NbResultats: Standard_Integer &
	:param Inter2_And_Domain2:
	:type Inter2_And_Domain2: TColStd_Array1OfReal &
	:param Inter1:
	:type Inter1: TColStd_Array1OfReal &
	:param Resultat1:
	:type Resultat1: TColStd_Array1OfReal &
	:param Resultat2:
	:type Resultat2: TColStd_Array1OfReal &
	:param EpsNul:
	:type EpsNul: float
	:rtype: None
") And_Domaine_Objet1_Intersections;
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
		%feature("autodoc", "	:rtype: None
") Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter;
		 Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter ();
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param U0:
	:type U0: float
	:param TolU:
	:type TolU: float
	:rtype: None
") Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter;
		 Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Real U0,const Standard_Real TolU);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:param U0:
	:type U0: float
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:rtype: None
") Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter;
		 Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Real U0,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:rtype: None
") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param U0:
	:type U0: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt2d & P,const Standard_Real U0);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance ();
		%feature("autodoc", "	:rtype: bool
") IsMin;
		Standard_Boolean IsMin ();
		%feature("autodoc", "	:rtype: Extrema_POnCurv2d
") Point;
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
		%feature("autodoc", "	:param Curve:
	:type Curve: Adaptor2d_Curve2d &
	:param NbPnt:
	:type NbPnt: Standard_Integer
	:param Domain:
	:type Domain: IntRes2d_Domain &
	:param Tol:
	:type Tol: float
	:rtype: None
") Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter;
		 Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter (const Adaptor2d_Curve2d & Curve,const Standard_Integer NbPnt,const IntRes2d_Domain & Domain,const Standard_Real Tol);
		%feature("autodoc", "	:param Curve:
	:type Curve: Adaptor2d_Curve2d &
	:param NbPnt:
	:type NbPnt: Standard_Integer
	:param Domain:
	:type Domain: IntRes2d_Domain &
	:param Tol:
	:type Tol: float
	:param OtherBox:
	:type OtherBox: Bnd_Box2d &
	:rtype: None
") Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter;
		 Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter (const Adaptor2d_Curve2d & Curve,const Standard_Integer NbPnt,const IntRes2d_Domain & Domain,const Standard_Real Tol,const Bnd_Box2d & OtherBox);
		%feature("autodoc", "	:param Curve:
	:type Curve: Adaptor2d_Curve2d &
	:param OtherBox:
	:type OtherBox: Bnd_Box2d &
	:rtype: None
") ComputeWithBox;
		void ComputeWithBox (const Adaptor2d_Curve2d & Curve,const Bnd_Box2d & OtherBox);
		%feature("autodoc", "	:rtype: float
") DeflectionOverEstimation;
		Standard_Real DeflectionOverEstimation ();
		%feature("autodoc", "	:param x:
	:type x: float
	:rtype: None
") SetDeflectionOverEstimation;
		void SetDeflectionOverEstimation (const Standard_Real x);
		%feature("autodoc", "	:param clos:
	:type clos: bool
	:rtype: None
") Closed;
		void Closed (const Standard_Boolean clos);
		%feature("autodoc", "	:rtype: int
") NbSegments;
		Standard_Integer NbSegments ();
		%feature("autodoc", "	:param theIndex:
	:type theIndex: Standard_Integer
	:param theBegin:
	:type theBegin: gp_Pnt2d
	:param theEnd:
	:type theEnd: gp_Pnt2d
	:rtype: void
") Segment;
		virtual void Segment (const Standard_Integer theIndex,gp_Pnt2d & theBegin,gp_Pnt2d & theEnd);
		%feature("autodoc", "	:rtype: float
") InfParameter;
		Standard_Real InfParameter ();
		%feature("autodoc", "	:rtype: float
") SupParameter;
		Standard_Real SupParameter ();
		%feature("autodoc", "	:rtype: bool
") AutoIntersectionIsPossible;
		Standard_Boolean AutoIntersectionIsPossible ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param ParamOnLine:
	:type ParamOnLine: float
	:rtype: float
") ApproxParamOnCurve;
		Standard_Real ApproxParamOnCurve (const Standard_Integer Index,const Standard_Real ParamOnLine);
		%feature("autodoc", "	:param x:
	:type x: float
	:param y:
	:type y: float
	:param x1:
	:type x1: float
	:param x2:
	:type x2: float
	:param y1:
	:type y1: float
	:param y2:
	:type y2: float
	:rtype: int
") CalculRegion;
		Standard_Integer CalculRegion (const Standard_Real x,const Standard_Real y,const Standard_Real x1,const Standard_Real x2,const Standard_Real y1,const Standard_Real y2);
		%feature("autodoc", "	:rtype: None
") Dump;
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
class Geom2dInt_TheProjPCurOfGInter {
	public:
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Pnt:
	:type Pnt: gp_Pnt2d
	:param Tol:
	:type Tol: float
	:rtype: float
") FindParameter;
		static Standard_Real FindParameter (const Adaptor2d_Curve2d & C,const gp_Pnt2d & Pnt,const Standard_Real Tol);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Pnt:
	:type Pnt: gp_Pnt2d
	:param LowParameter:
	:type LowParameter: float
	:param HighParameter:
	:type HighParameter: float
	:param Tol:
	:type Tol: float
	:rtype: float
") FindParameter;
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
