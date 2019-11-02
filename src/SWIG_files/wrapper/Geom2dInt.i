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

/*
This file was automatically generated using the pythonocc_generator, see
https://github.com/tpaviot/pythonocc-generator.

This file is platform independant, but was generated under the following
conditions:

- time : 2019-11-03 11:38:08
- operating system : debian Linux 4.15.0-66-generic
- occt version targeted : 7.4.0
*/

%define GEOM2DINTDOCSTRING
"No docstring provided."
%enddef
%module (package="OCC.Core", docstring=GEOM2DINTDOCSTRING) Geom2dInt

#pragma SWIG nowarn=504,325,503,520,350,351,383,389,394,395, 404

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


%include Geom2dInt_headers.i

/* public enums */
/* end public enums declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/* handles */
/* end handles declaration */

%nodefaultctor Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter;
class Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter {
	public:
		%feature("compactdefaultargs") AnErrorOccurred;
		%feature("autodoc", "	:rtype: bool
") AnErrorOccurred;
		Standard_Boolean AnErrorOccurred ();
		%feature("compactdefaultargs") Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter;
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param C2:
	:type C2: Adaptor2d_Curve2d &
	:param Tol:
	:type Tol: float
	:rtype: None
") Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter;
		 Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2,const Standard_Real Tol);
		%feature("compactdefaultargs") NbRoots;
		%feature("autodoc", "	:rtype: int
") NbRoots;
		Standard_Integer NbRoots ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Poly1:
	:type Poly1: Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter &
	:param Poly2:
	:type Poly2: Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter &
	:param NumSegOn1:
	:type NumSegOn1: int &
	:param NumSegOn2:
	:type NumSegOn2: int &
	:param ParamOnSeg1:
	:type ParamOnSeg1: float &
	:param ParamOnSeg2:
	:type ParamOnSeg2: float &
	:rtype: None
") Perform;
		void Perform (const Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter & Poly1,const Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter & Poly2,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Perform;
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
		%feature("compactdefaultargs") Roots;
		%feature("autodoc", "	:param U:
	:type U: float &
	:param V:
	:type V: float &
	:rtype: None
") Roots;
		void Roots (Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Geom2dInt_GInter;
class Geom2dInt_GInter : public IntRes2d_Intersection {
	public:
		%feature("compactdefaultargs") ComputeDomain;
		%feature("autodoc", "	* Create a domain from a curve

	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param TolDomain:
	:type TolDomain: float
	:rtype: IntRes2d_Domain
") ComputeDomain;
		IntRes2d_Domain ComputeDomain (const Adaptor2d_Curve2d & C1,const Standard_Real TolDomain);
		%feature("compactdefaultargs") Geom2dInt_GInter;
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") Geom2dInt_GInter;
		 Geom2dInt_GInter ();
		%feature("compactdefaultargs") Geom2dInt_GInter;
		%feature("autodoc", "	* Self Intersection of a curve

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Geom2dInt_GInter;
		 Geom2dInt_GInter (const Adaptor2d_Curve2d & C,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("compactdefaultargs") Geom2dInt_GInter;
		%feature("autodoc", "	* Self Intersection of a curve with a domain.

	:param C:
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
		%feature("compactdefaultargs") Geom2dInt_GInter;
		%feature("autodoc", "	* Intersection between 2 curves.

	:param C1:
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
		%feature("compactdefaultargs") Geom2dInt_GInter;
		%feature("autodoc", "	* Intersection between 2 curves.

	:param C1:
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
		%feature("compactdefaultargs") Geom2dInt_GInter;
		%feature("autodoc", "	* Intersection between 2 curves.

	:param C1:
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
		%feature("compactdefaultargs") Geom2dInt_GInter;
		%feature("autodoc", "	* Intersection between 2 curves.

	:param C1:
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
		%feature("compactdefaultargs") GetMinNbSamples;
		%feature("autodoc", "	:rtype: int
") GetMinNbSamples;
		Standard_Integer GetMinNbSamples ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersection between 2 curves.

	:param C1:
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
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersection between 2 curves.

	:param C1:
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
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersection between 2 curves.

	:param C1:
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
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersection between 2 curves.

	:param C1:
	:type C1: Adaptor2d_Curve2d &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const Adaptor2d_Curve2d & C1,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersection between 2 curves.

	:param C1:
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
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersection between 2 curves.

	:param C1:
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
		%feature("compactdefaultargs") SetMinNbSamples;
		%feature("autodoc", "	* Set / get minimum number of points in polygon intersection.

	:param theMinNbSamples:
	:type theMinNbSamples: int
	:rtype: None
") SetMinNbSamples;
		void SetMinNbSamples (const Standard_Integer theMinNbSamples);
};


%extend Geom2dInt_GInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class Geom2dInt_Geom2dCurveTool {
	public:
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "	* Returns the Circ2d from gp corresponding to the curve C. This method is called only when TheType returns GeomAbs_Circle.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: gp_Circ2d
") Circle;
		static gp_Circ2d Circle (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") D0;
		static void D0 (const Adaptor2d_Curve2d & C,const Standard_Real U,gp_Pnt2d & P);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param T:
	:type T: gp_Vec2d
	:rtype: None
") D1;
		static void D1 (const Adaptor2d_Curve2d & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & T);
		%feature("compactdefaultargs") D2;
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
	:rtype: None
") D2;
		static void D2 (const Adaptor2d_Curve2d & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & T,gp_Vec2d & N);
		%feature("compactdefaultargs") D3;
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
	:rtype: None
") D3;
		static void D3 (const Adaptor2d_Curve2d & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & T,gp_Vec2d & N,gp_Vec2d & V);
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec2d
") DN;
		static gp_Vec2d DN (const Adaptor2d_Curve2d & C,const Standard_Real U,const Standard_Integer N);
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: int
") Degree;
		static Standard_Integer Degree (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "	* Returns the Elips2d from gp corresponding to the curve C. This method is called only when TheType returns GeomAbs_Ellipse.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: gp_Elips2d
") Ellipse;
		static gp_Elips2d Ellipse (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") EpsX;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: float
") EpsX;
		static Standard_Real EpsX (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") EpsX;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Eps_XYZ:
	:type Eps_XYZ: float
	:rtype: float
") EpsX;
		static Standard_Real EpsX (const Adaptor2d_Curve2d & C,const Standard_Real Eps_XYZ);
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: float
") FirstParameter;
		static Standard_Real FirstParameter (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") GetInterval;
		%feature("autodoc", "	* output the bounds of interval of index <Index> used if Type == Composite.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Index:
	:type Index: int
	:param Tab:
	:type Tab: TColStd_Array1OfReal &
	:param U1:
	:type U1: float &
	:param U2:
	:type U2: float &
	:rtype: None
") GetInterval;
		static void GetInterval (const Adaptor2d_Curve2d & C,const Standard_Integer Index,const TColStd_Array1OfReal & Tab,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: GeomAbs_CurveType
") GetType;
		static GeomAbs_CurveType GetType (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "	* Returns the Hypr2d from gp corresponding to the curve C. This method is called only when TheType returns GeomAbs_Hyperbola.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: gp_Hypr2d
") Hyperbola;
		static gp_Hypr2d Hyperbola (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	* compute Tab.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Tab:
	:type Tab: TColStd_Array1OfReal &
	:rtype: None
") Intervals;
		static void Intervals (const Adaptor2d_Curve2d & C,TColStd_Array1OfReal & Tab);
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: float
") LastParameter;
		static Standard_Real LastParameter (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	* Returns the Lin2d from gp corresponding to the curve C. This method is called only when TheType returns GeomAbs_Line.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: gp_Lin2d
") Line;
		static gp_Lin2d Line (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* output the number of interval of continuity C2 of the curve

	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: int
") NbIntervals;
		static Standard_Integer NbIntervals (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: int
") NbSamples;
		static Standard_Integer NbSamples (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:param U0:
	:type U0: float
	:param U1:
	:type U1: float
	:rtype: int
") NbSamples;
		static Standard_Integer NbSamples (const Adaptor2d_Curve2d & C,const Standard_Real U0,const Standard_Real U1);
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "	* Returns the Parab2d from gp corresponding to the curve C. This method is called only when TheType returns GeomAbs_Parabola.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: gp_Parab2d
") Parabola;
		static gp_Parab2d Parabola (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d &
	:param X:
	:type X: float
	:rtype: gp_Pnt2d
") Value;
		static gp_Pnt2d Value (const Adaptor2d_Curve2d & C,const Standard_Real X);
};


%extend Geom2dInt_Geom2dCurveTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Geom2dInt_IntConicCurveOfGInter;
class Geom2dInt_IntConicCurveOfGInter : public IntRes2d_Intersection {
	public:
		%feature("compactdefaultargs") Geom2dInt_IntConicCurveOfGInter;
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") Geom2dInt_IntConicCurveOfGInter;
		 Geom2dInt_IntConicCurveOfGInter ();
		%feature("compactdefaultargs") Geom2dInt_IntConicCurveOfGInter;
		%feature("autodoc", "	* Intersection between a line and a parametric curve.

	:param L:
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
		%feature("compactdefaultargs") Geom2dInt_IntConicCurveOfGInter;
		%feature("autodoc", "	* Intersection between a line and a parametric curve.

	:param C:
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
		%feature("compactdefaultargs") Geom2dInt_IntConicCurveOfGInter;
		%feature("autodoc", "	* Intersection between an ellipse and a parametric curve.

	:param E:
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
		%feature("compactdefaultargs") Geom2dInt_IntConicCurveOfGInter;
		%feature("autodoc", "	* Intersection between a parabola and a parametric curve.

	:param Prb:
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
		%feature("compactdefaultargs") Geom2dInt_IntConicCurveOfGInter;
		%feature("autodoc", "	* Intersection between the main branch of an hyperbola and a parametric curve.

	:param H:
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
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersection between a line and a parametric curve.

	:param L:
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
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersection between a line and a parametric curve.

	:param C:
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
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersection between an ellipse and a parametric curve.

	:param E:
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
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersection between a parabola and a parametric curve.

	:param Prb:
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
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersection between the main branch of an hyperbola and a parametric curve.

	:param H:
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


%extend Geom2dInt_IntConicCurveOfGInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter;
class Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter : public math_FunctionWithDerivative {
	public:
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Computes the derivative of the previous function at parameter Param.

	:param Param:
	:type Param: float
	:param D:
	:type D: float &
	:rtype: bool
") Derivative;
		Standard_Boolean Derivative (const Standard_Real Param,Standard_Real &OutValue);
		%feature("compactdefaultargs") Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter;
		%feature("autodoc", "	* Constructor of the class.

	:param IT:
	:type IT: IntCurve_IConicTool &
	:param PC:
	:type PC: Adaptor2d_Curve2d &
	:rtype: None
") Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter;
		 Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter (const IntCurve_IConicTool & IT,const Adaptor2d_Curve2d & PC);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Computes the value of the signed distance between the implicit curve and the point at parameter Param on the parametrised curve.

	:param Param:
	:type Param: float
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Real Param,Standard_Real &OutValue);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Computes the value and the derivative of the function.

	:param Param:
	:type Param: float
	:param F:
	:type F: float &
	:param D:
	:type D: float &
	:rtype: bool
") Values;
		Standard_Boolean Values (const Standard_Real Param,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter;
class Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter : public math_FunctionWithDerivative {
	public:
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Calculation of F'(U).

	:param U:
	:type U: float
	:param DF:
	:type DF: float &
	:rtype: bool
") Derivative;
		Standard_Boolean Derivative (const Standard_Real U,Standard_Real &OutValue);
		%feature("compactdefaultargs") Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter;
		%feature("autodoc", "	:rtype: None
") Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter;
		 Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter ();
		%feature("compactdefaultargs") Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: None
") Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter;
		 Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "	* Save the found extremum.

	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* sets the field mycurve of the function.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:rtype: None
") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C);
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "	* Shows if the Nth distance is a minimum.

	:param N:
	:type N: int
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "	* Return the nunber of found extrema.

	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the Nth extremum.

	:param N:
	:type N: int
	:rtype: Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point (const Standard_Integer N);
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "	* Computes a Tol value. If 1st derivative of curve |D1|<Tol, it is considered D1=0.

	:rtype: float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance ();
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "	* sets the field P of the function.

	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") SetPoint;
		void SetPoint (const gp_Pnt2d & P);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the Nth distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("compactdefaultargs") SubIntervalInitialize;
		%feature("autodoc", "	* Determines boundaries of subinterval for find of root.

	:param theUfirst:
	:type theUfirst: float
	:param theUlast:
	:type theUlast: float
	:rtype: None
") SubIntervalInitialize;
		void SubIntervalInitialize (const Standard_Real theUfirst,const Standard_Real theUlast);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Calculation of F(U).

	:param U:
	:type U: float
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Real U,Standard_Real &OutValue);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Calculation of F(U) and F'(U).

	:param U:
	:type U: float
	:param F:
	:type F: float &
	:param DF:
	:type DF: float &
	:rtype: bool
") Values;
		Standard_Boolean Values (const Standard_Real U,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class Geom2dInt_TheCurveLocatorOfTheProjPCurOfGInter {
	public:
};


%extend Geom2dInt_TheCurveLocatorOfTheProjPCurOfGInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter;
class Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter : public math_FunctionSetWithDerivatives {
	public:
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "	* returns the values <D> of the derivatives for the variable <X>. returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("compactdefaultargs") Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter;
		%feature("autodoc", "	:param curve1:
	:type curve1: Adaptor2d_Curve2d &
	:param curve2:
	:type curve2: Adaptor2d_Curve2d &
	:rtype: None
") Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter;
		 Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter (const Adaptor2d_Curve2d & curve1,const Adaptor2d_Curve2d & curve2);
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	* returns 2.

	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	* returns 2.

	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* computes the values <F> of the Functions for the variable <X>. returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* returns the values <F> of the functions and the derivatives <D> for the variable <X>. returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
};


%extend Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Geom2dInt_TheIntConicCurveOfGInter;
class Geom2dInt_TheIntConicCurveOfGInter : public IntRes2d_Intersection {
	public:
		%feature("compactdefaultargs") Geom2dInt_TheIntConicCurveOfGInter;
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") Geom2dInt_TheIntConicCurveOfGInter;
		 Geom2dInt_TheIntConicCurveOfGInter ();
		%feature("compactdefaultargs") Geom2dInt_TheIntConicCurveOfGInter;
		%feature("autodoc", "	* Intersection between a line and a parametric curve.

	:param L:
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
		%feature("compactdefaultargs") Geom2dInt_TheIntConicCurveOfGInter;
		%feature("autodoc", "	* Intersection between a line and a parametric curve.

	:param C:
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
		%feature("compactdefaultargs") Geom2dInt_TheIntConicCurveOfGInter;
		%feature("autodoc", "	* Intersection between an ellipse and a parametric curve.

	:param E:
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
		%feature("compactdefaultargs") Geom2dInt_TheIntConicCurveOfGInter;
		%feature("autodoc", "	* Intersection between a parabola and a parametric curve.

	:param Prb:
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
		%feature("compactdefaultargs") Geom2dInt_TheIntConicCurveOfGInter;
		%feature("autodoc", "	* Intersection between the main branch of an hyperbola and a parametric curve.

	:param H:
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
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersection between a line and a parametric curve.

	:param L:
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
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersection between a line and a parametric curve.

	:param C:
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
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersection between an ellipse and a parametric curve.

	:param E:
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
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersection between a parabola and a parametric curve.

	:param Prb:
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
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersection between the main branch of an hyperbola and a parametric curve.

	:param H:
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


%extend Geom2dInt_TheIntConicCurveOfGInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Geom2dInt_TheIntPCurvePCurveOfGInter;
class Geom2dInt_TheIntPCurvePCurveOfGInter : public IntRes2d_Intersection {
	public:
		%feature("compactdefaultargs") Geom2dInt_TheIntPCurvePCurveOfGInter;
		%feature("autodoc", "	:rtype: None
") Geom2dInt_TheIntPCurvePCurveOfGInter;
		 Geom2dInt_TheIntPCurvePCurveOfGInter ();
		%feature("compactdefaultargs") GetMinNbSamples;
		%feature("autodoc", "	:rtype: int
") GetMinNbSamples;
		Standard_Integer GetMinNbSamples ();
		%feature("compactdefaultargs") Perform;
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
		%feature("compactdefaultargs") Perform;
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
		%feature("compactdefaultargs") SetMinNbSamples;
		%feature("autodoc", "	* Set / get minimum number of points in polygon for intersection.

	:param theMinNbSamples:
	:type theMinNbSamples: int
	:rtype: None
") SetMinNbSamples;
		void SetMinNbSamples (const Standard_Integer theMinNbSamples);
};


%extend Geom2dInt_TheIntPCurvePCurveOfGInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter;
class Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter : public IntRes2d_Intersection {
	public:
		%feature("compactdefaultargs") And_Domaine_Objet1_Intersections;
		%feature("autodoc", "	:param TheImpTool:
	:type TheImpTool: IntCurve_IConicTool &
	:param TheParCurve:
	:type TheParCurve: Adaptor2d_Curve2d &
	:param TheImpCurveDomain:
	:type TheImpCurveDomain: IntRes2d_Domain &
	:param TheParCurveDomain:
	:type TheParCurveDomain: IntRes2d_Domain &
	:param NbResultats:
	:type NbResultats: int &
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
		%feature("compactdefaultargs") FindU;
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
		%feature("compactdefaultargs") FindV;
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
		%feature("compactdefaultargs") Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter;
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter;
		 Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter ();
		%feature("compactdefaultargs") Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter;
		%feature("autodoc", "	* Intersection between an implicit curve and a parametrised curve. The exception ConstructionError is raised if the domain of the parametrised curve does not verify HasFirstPoint and HasLastPoint return True.

	:param ITool:
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
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersection between an implicit curve and a parametrised curve. The exception ConstructionError is raised if the domain of the parametrised curve does not verify HasFirstPoint and HasLastPoint return True.

	:param ITool:
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
};


%extend Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter;
class Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter {
	public:
		%feature("compactdefaultargs") Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter;
		%feature("autodoc", "	:rtype: None
") Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter;
		 Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter ();
		%feature("compactdefaultargs") Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter;
		%feature("autodoc", "	* Calculates the distance with a close point. The close point is defined by the parameter value U0. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searchs a zero near the close point. TolU is used to decide to stop the iterations. At the nth iteration, the criteria is: abs(Un - Un-1) < TolU.

	:param P:
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
		%feature("compactdefaultargs") Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter;
		%feature("autodoc", "	* Calculates the distance with a close point. The close point is defined by the parameter value U0. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searchs a zero near the close point. Zeros are searched between Umin et Usup. TolU is used to decide to stop the iterations. At the nth iteration, the criteria is: abs(Un - Un-1) < TolU.

	:param P:
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
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* sets the fields of the algorithm.

	:param C:
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
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the distance is found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "	* Returns True if the extremum distance is a minimum.

	:rtype: bool
") IsMin;
		Standard_Boolean IsMin ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* the algorithm is done with the point P. An exception is raised if the fields have not been initialized.

	:param P:
	:type P: gp_Pnt2d
	:param U0:
	:type U0: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt2d & P,const Standard_Real U0);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the point of the extremum distance.

	:rtype: Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point ();
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the value of the extremum square distance.

	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance ();
};


%extend Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter;
class Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter : public Intf_Polygon2d {
	public:
		%feature("compactdefaultargs") ApproxParamOnCurve;
		%feature("autodoc", "	* Give an approximation of the parameter on the curve according to the discretization of the Curve.

	:param Index:
	:type Index: int
	:param ParamOnLine:
	:type ParamOnLine: float
	:rtype: float
") ApproxParamOnCurve;
		Standard_Real ApproxParamOnCurve (const Standard_Integer Index,const Standard_Real ParamOnLine);
		%feature("compactdefaultargs") AutoIntersectionIsPossible;
		%feature("autodoc", "	:rtype: bool
") AutoIntersectionIsPossible;
		Standard_Boolean AutoIntersectionIsPossible ();
		%feature("compactdefaultargs") CalculRegion;
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
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "	:param clos:
	:type clos: bool
	:rtype: None
") Closed;
		void Closed (const Standard_Boolean clos);
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "	* Returns True if the polyline is closed.

	:rtype: bool
") Closed;
		Standard_Boolean Closed ();
		%feature("compactdefaultargs") ComputeWithBox;
		%feature("autodoc", "	* The current polygon is modified if most of the points of the polygon are are outside the box <OtherBox>. In this situation, bounds are computed to build a polygon inside or near the OtherBox.

	:param Curve:
	:type Curve: Adaptor2d_Curve2d &
	:param OtherBox:
	:type OtherBox: Bnd_Box2d &
	:rtype: None
") ComputeWithBox;
		void ComputeWithBox (const Adaptor2d_Curve2d & Curve,const Bnd_Box2d & OtherBox);
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "	:rtype: float
") DeflectionOverEstimation;
		Standard_Real DeflectionOverEstimation ();
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:rtype: None
") Dump;
		void Dump ();
		%feature("compactdefaultargs") Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter;
		%feature("autodoc", "	* Compute a polygon on the domain of the curve.

	:param Curve:
	:type Curve: Adaptor2d_Curve2d &
	:param NbPnt:
	:type NbPnt: int
	:param Domain:
	:type Domain: IntRes2d_Domain &
	:param Tol:
	:type Tol: float
	:rtype: None
") Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter;
		 Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter (const Adaptor2d_Curve2d & Curve,const Standard_Integer NbPnt,const IntRes2d_Domain & Domain,const Standard_Real Tol);
		%feature("compactdefaultargs") InfParameter;
		%feature("autodoc", "	* Returns the parameter (On the curve) of the first point of the Polygon

	:rtype: float
") InfParameter;
		Standard_Real InfParameter ();
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "	* Give the number of Segments in the polyline.

	:rtype: int
") NbSegments;
		Standard_Integer NbSegments ();
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "	* Returns the points of the segment <Index> in the Polygon.

	:param theIndex:
	:type theIndex: int
	:param theBegin:
	:type theBegin: gp_Pnt2d
	:param theEnd:
	:type theEnd: gp_Pnt2d
	:rtype: void
") Segment;
		virtual void Segment (const Standard_Integer theIndex,gp_Pnt2d & theBegin,gp_Pnt2d & theEnd);
		%feature("compactdefaultargs") SetDeflectionOverEstimation;
		%feature("autodoc", "	:param x:
	:type x: float
	:rtype: None
") SetDeflectionOverEstimation;
		void SetDeflectionOverEstimation (const Standard_Real x);
		%feature("compactdefaultargs") SupParameter;
		%feature("autodoc", "	* Returns the parameter (On the curve) of the last point of the Polygon

	:rtype: float
") SupParameter;
		Standard_Real SupParameter ();
};


%extend Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class Geom2dInt_TheProjPCurOfGInter {
	public:
		%feature("compactdefaultargs") FindParameter;
		%feature("autodoc", "	* Returns the parameter V of the point on the parametric curve corresponding to the Point Pnt. The Correspondance between Pnt and the point P(V) on the parametric curve must be coherent with the way of determination of the signed distance between a point and the implicit curve. Tol is the tolerance on the distance between a point and the parametrised curve. In that case, no bounds are given. The research of the rigth parameter has to be made on the natural parametric domain of the curve.

	:param C:
	:type C: Adaptor2d_Curve2d &
	:param Pnt:
	:type Pnt: gp_Pnt2d
	:param Tol:
	:type Tol: float
	:rtype: float
") FindParameter;
		static Standard_Real FindParameter (const Adaptor2d_Curve2d & C,const gp_Pnt2d & Pnt,const Standard_Real Tol);
		%feature("compactdefaultargs") FindParameter;
		%feature("autodoc", "	* Returns the parameter V of the point on the parametric curve corresponding to the Point Pnt. The Correspondance between Pnt and the point P(V) on the parametric curve must be coherent with the way of determination of the signed distance between a point and the implicit curve. Tol is the tolerance on the distance between a point and the parametrised curve. LowParameter and HighParameter give the boundaries of the interval in wich the parameter certainly lies. These parameters are given to implement a more efficient algoritm. So, it is not necessary to check that the returned value verifies LowParameter <= Value <= HighParameter.

	:param C:
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


%extend Geom2dInt_TheProjPCurOfGInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
