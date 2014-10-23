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
%module (package="OCC") Contap

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

%include Contap_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
enum Contap_IType {
	Contap_Lin = 0,
	Contap_Circle = 1,
	Contap_Walking = 2,
	Contap_Restriction = 3,
};

enum Contap_TFunction {
	Contap_ContourStd = 0,
	Contap_ContourPrs = 1,
	Contap_DraftStd = 2,
	Contap_DraftPrs = 3,
};

/* end public enums declaration */

%nodefaultctor Contap_ContAna;
class Contap_ContAna {
	public:
		%feature("autodoc", "	:rtype: None
") Contap_ContAna;
		 Contap_ContAna ();
		%feature("autodoc", "	:param S:
	:type S: gp_Sphere
	:param D:
	:type D: gp_Dir
	:rtype: None
") Perform;
		void Perform (const gp_Sphere & S,const gp_Dir & D);
		%feature("autodoc", "	:param S:
	:type S: gp_Sphere
	:param D:
	:type D: gp_Dir
	:param Ang:
	:type Ang: float
	:rtype: None
") Perform;
		void Perform (const gp_Sphere & S,const gp_Dir & D,const Standard_Real Ang);
		%feature("autodoc", "	:param S:
	:type S: gp_Sphere
	:param Eye:
	:type Eye: gp_Pnt
	:rtype: None
") Perform;
		void Perform (const gp_Sphere & S,const gp_Pnt & Eye);
		%feature("autodoc", "	:param C:
	:type C: gp_Cylinder
	:param D:
	:type D: gp_Dir
	:rtype: None
") Perform;
		void Perform (const gp_Cylinder & C,const gp_Dir & D);
		%feature("autodoc", "	:param C:
	:type C: gp_Cylinder
	:param D:
	:type D: gp_Dir
	:param Ang:
	:type Ang: float
	:rtype: None
") Perform;
		void Perform (const gp_Cylinder & C,const gp_Dir & D,const Standard_Real Ang);
		%feature("autodoc", "	:param C:
	:type C: gp_Cylinder
	:param Eye:
	:type Eye: gp_Pnt
	:rtype: None
") Perform;
		void Perform (const gp_Cylinder & C,const gp_Pnt & Eye);
		%feature("autodoc", "	:param C:
	:type C: gp_Cone
	:param D:
	:type D: gp_Dir
	:rtype: None
") Perform;
		void Perform (const gp_Cone & C,const gp_Dir & D);
		%feature("autodoc", "	:param C:
	:type C: gp_Cone
	:param D:
	:type D: gp_Dir
	:param Ang:
	:type Ang: float
	:rtype: None
") Perform;
		void Perform (const gp_Cone & C,const gp_Dir & D,const Standard_Real Ang);
		%feature("autodoc", "	:param C:
	:type C: gp_Cone
	:param Eye:
	:type Eye: gp_Pnt
	:rtype: None
") Perform;
		void Perform (const gp_Cone & C,const gp_Pnt & Eye);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: int
") NbContours;
		Standard_Integer NbContours ();
		%feature("autodoc", "	* Returns GeomAbs_Line or GeomAbs_Circle, when IsDone() returns True.

	:rtype: GeomAbs_CurveType
") TypeContour;
		GeomAbs_CurveType TypeContour ();
		%feature("autodoc", "	:rtype: gp_Circ
") Circle;
		gp_Circ Circle ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: gp_Lin
") Line;
		gp_Lin Line (const Standard_Integer Index);
};


%feature("shadow") Contap_ContAna::~Contap_ContAna %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Contap_ContAna {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Contap_Contour;
class Contap_Contour {
	public:
		%feature("autodoc", "	:rtype: None
") Contap_Contour;
		 Contap_Contour ();
		%feature("autodoc", "	:param Direction:
	:type Direction: gp_Vec
	:rtype: None
") Contap_Contour;
		 Contap_Contour (const gp_Vec & Direction);
		%feature("autodoc", "	:param Direction:
	:type Direction: gp_Vec
	:param Angle:
	:type Angle: float
	:rtype: None
") Contap_Contour;
		 Contap_Contour (const gp_Vec & Direction,const Standard_Real Angle);
		%feature("autodoc", "	:param Eye:
	:type Eye: gp_Pnt
	:rtype: None
") Contap_Contour;
		 Contap_Contour (const gp_Pnt & Eye);
		%feature("autodoc", "	:param Surf:
	:type Surf: Handle_Adaptor3d_HSurface &
	:param Domain:
	:type Domain: Handle_Adaptor3d_TopolTool &
	:param Direction:
	:type Direction: gp_Vec
	:rtype: None
") Contap_Contour;
		 Contap_Contour (const Handle_Adaptor3d_HSurface & Surf,const Handle_Adaptor3d_TopolTool & Domain,const gp_Vec & Direction);
		%feature("autodoc", "	:param Surf:
	:type Surf: Handle_Adaptor3d_HSurface &
	:param Domain:
	:type Domain: Handle_Adaptor3d_TopolTool &
	:param Direction:
	:type Direction: gp_Vec
	:param Angle:
	:type Angle: float
	:rtype: None
") Contap_Contour;
		 Contap_Contour (const Handle_Adaptor3d_HSurface & Surf,const Handle_Adaptor3d_TopolTool & Domain,const gp_Vec & Direction,const Standard_Real Angle);
		%feature("autodoc", "	:param Surf:
	:type Surf: Handle_Adaptor3d_HSurface &
	:param Domain:
	:type Domain: Handle_Adaptor3d_TopolTool &
	:param Eye:
	:type Eye: gp_Pnt
	:rtype: None
") Contap_Contour;
		 Contap_Contour (const Handle_Adaptor3d_HSurface & Surf,const Handle_Adaptor3d_TopolTool & Domain,const gp_Pnt & Eye);
		%feature("autodoc", "	:param Surf:
	:type Surf: Handle_Adaptor3d_HSurface &
	:param Domain:
	:type Domain: Handle_Adaptor3d_TopolTool &
	:rtype: None
") Perform;
		void Perform (const Handle_Adaptor3d_HSurface & Surf,const Handle_Adaptor3d_TopolTool & Domain);
		%feature("autodoc", "	:param Surf:
	:type Surf: Handle_Adaptor3d_HSurface &
	:param Domain:
	:type Domain: Handle_Adaptor3d_TopolTool &
	:param Direction:
	:type Direction: gp_Vec
	:rtype: None
") Perform;
		void Perform (const Handle_Adaptor3d_HSurface & Surf,const Handle_Adaptor3d_TopolTool & Domain,const gp_Vec & Direction);
		%feature("autodoc", "	:param Surf:
	:type Surf: Handle_Adaptor3d_HSurface &
	:param Domain:
	:type Domain: Handle_Adaptor3d_TopolTool &
	:param Direction:
	:type Direction: gp_Vec
	:param Angle:
	:type Angle: float
	:rtype: None
") Perform;
		void Perform (const Handle_Adaptor3d_HSurface & Surf,const Handle_Adaptor3d_TopolTool & Domain,const gp_Vec & Direction,const Standard_Real Angle);
		%feature("autodoc", "	:param Surf:
	:type Surf: Handle_Adaptor3d_HSurface &
	:param Domain:
	:type Domain: Handle_Adaptor3d_TopolTool &
	:param Eye:
	:type Eye: gp_Pnt
	:rtype: None
") Perform;
		void Perform (const Handle_Adaptor3d_HSurface & Surf,const Handle_Adaptor3d_TopolTool & Domain,const gp_Pnt & Eye);
		%feature("autodoc", "	:param Direction:
	:type Direction: gp_Vec
	:rtype: None
") Init;
		void Init (const gp_Vec & Direction);
		%feature("autodoc", "	:param Direction:
	:type Direction: gp_Vec
	:param Angle:
	:type Angle: float
	:rtype: None
") Init;
		void Init (const gp_Vec & Direction,const Standard_Real Angle);
		%feature("autodoc", "	:param Eye:
	:type Eye: gp_Pnt
	:rtype: None
") Init;
		void Init (const gp_Pnt & Eye);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:rtype: int
") NbLines;
		Standard_Integer NbLines ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Contap_TheLineOfContour
") Line;
		const Contap_TheLineOfContour & Line (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: Contap_TheSurfFunctionOfContour
") SurfaceFunction;
		Contap_TheSurfFunctionOfContour & SurfaceFunction ();
};


%feature("shadow") Contap_Contour::~Contap_Contour %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Contap_Contour {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Contap_HContTool;
class Contap_HContTool {
	public:
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param u1:
	:type u1: float
	:param u2:
	:type u2: float
	:rtype: int
") NbSamplesU;
		static Standard_Integer NbSamplesU (const Handle_Adaptor3d_HSurface & S,const Standard_Real u1,const Standard_Real u2);
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param v1:
	:type v1: float
	:param v2:
	:type v2: float
	:rtype: int
") NbSamplesV;
		static Standard_Integer NbSamplesV (const Handle_Adaptor3d_HSurface & S,const Standard_Real v1,const Standard_Real v2);
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: int
") NbSamplePoints;
		static Standard_Integer NbSamplePoints (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param Index:
	:type Index: Standard_Integer
	:param U:
	:type U: float &
	:param V:
	:type V: float &
	:rtype: void
") SamplePoint;
		static void SamplePoint (const Handle_Adaptor3d_HSurface & S,const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: bool
") HasBeenSeen;
		static Standard_Boolean HasBeenSeen (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "	:param A:
	:type A: Handle_Adaptor2d_HCurve2d &
	:rtype: int
") NbSamplesOnArc;
		static Standard_Integer NbSamplesOnArc (const Handle_Adaptor2d_HCurve2d & A);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param Ufirst:
	:type Ufirst: float &
	:param Ulast:
	:type Ulast: float &
	:rtype: void
") Bounds;
		static void Bounds (const Handle_Adaptor2d_HCurve2d & C,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param P:
	:type P: gp_Pnt2d
	:param Paramproj:
	:type Paramproj: float &
	:param Ptproj:
	:type Ptproj: gp_Pnt2d
	:rtype: bool
") Project;
		static Standard_Boolean Project (const Handle_Adaptor2d_HCurve2d & C,const gp_Pnt2d & P,Standard_Real &OutValue,gp_Pnt2d & Ptproj);
		%feature("autodoc", "	:param V:
	:type V: Handle_Adaptor3d_HVertex &
	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: float
") Tolerance;
		static Standard_Real Tolerance (const Handle_Adaptor3d_HVertex & V,const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "	:param V:
	:type V: Handle_Adaptor3d_HVertex &
	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: float
") Parameter;
		static Standard_Real Parameter (const Handle_Adaptor3d_HVertex & V,const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: int
") NbPoints;
		static Standard_Integer NbPoints (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param Index:
	:type Index: Standard_Integer
	:param Pt:
	:type Pt: gp_Pnt
	:param Tol:
	:type Tol: float &
	:param U:
	:type U: float &
	:rtype: void
") Value;
		static void Value (const Handle_Adaptor2d_HCurve2d & C,const Standard_Integer Index,gp_Pnt & Pt,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param Index:
	:type Index: Standard_Integer
	:rtype: bool
") IsVertex;
		static Standard_Boolean IsVertex (const Handle_Adaptor2d_HCurve2d & C,const Standard_Integer Index);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param Index:
	:type Index: Standard_Integer
	:param V:
	:type V: Handle_Adaptor3d_HVertex &
	:rtype: void
") Vertex;
		static void Vertex (const Handle_Adaptor2d_HCurve2d & C,const Standard_Integer Index,Handle_Adaptor3d_HVertex & V);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: int
") NbSegments;
		static Standard_Integer NbSegments (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param Index:
	:type Index: Standard_Integer
	:param IndFirst:
	:type IndFirst: Standard_Integer &
	:rtype: bool
") HasFirstPoint;
		static Standard_Boolean HasFirstPoint (const Handle_Adaptor2d_HCurve2d & C,const Standard_Integer Index,Standard_Integer &OutValue);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param Index:
	:type Index: Standard_Integer
	:param IndLast:
	:type IndLast: Standard_Integer &
	:rtype: bool
") HasLastPoint;
		static Standard_Boolean HasLastPoint (const Handle_Adaptor2d_HCurve2d & C,const Standard_Integer Index,Standard_Integer &OutValue);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: bool
") IsAllSolution;
		static Standard_Boolean IsAllSolution (const Handle_Adaptor2d_HCurve2d & C);
};


%feature("shadow") Contap_HContTool::~Contap_HContTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Contap_HContTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Contap_HCurve2dTool;
class Contap_HCurve2dTool {
	public:
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: float
") FirstParameter;
		static Standard_Real FirstParameter (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: float
") LastParameter;
		static Standard_Real LastParameter (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: GeomAbs_Shape
") Continuity;
		static GeomAbs_Shape Continuity (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		static Standard_Integer NbIntervals (const Handle_Adaptor2d_HCurve2d & C,const GeomAbs_Shape S);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: void
") Intervals;
		static void Intervals (const Handle_Adaptor2d_HCurve2d & C,TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: bool
") IsClosed;
		static Standard_Boolean IsClosed (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: bool
") IsPeriodic;
		static Standard_Boolean IsPeriodic (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: float
") Period;
		static Standard_Real Period (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param U:
	:type U: float
	:rtype: gp_Pnt2d
") Value;
		static gp_Pnt2d Value (const Handle_Adaptor2d_HCurve2d & C,const Standard_Real U);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: void
") D0;
		static void D0 (const Handle_Adaptor2d_HCurve2d & C,const Standard_Real U,gp_Pnt2d & P);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V:
	:type V: gp_Vec2d
	:rtype: void
") D1;
		static void D1 (const Handle_Adaptor2d_HCurve2d & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: void
") D2;
		static void D2 (const Handle_Adaptor2d_HCurve2d & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param V3:
	:type V3: gp_Vec2d
	:rtype: void
") D3;
		static void D3 (const Handle_Adaptor2d_HCurve2d & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param U:
	:type U: float
	:param N:
	:type N: Standard_Integer
	:rtype: gp_Vec2d
") DN;
		static gp_Vec2d DN (const Handle_Adaptor2d_HCurve2d & C,const Standard_Real U,const Standard_Integer N);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param R3d:
	:type R3d: float
	:rtype: float
") Resolution;
		static Standard_Real Resolution (const Handle_Adaptor2d_HCurve2d & C,const Standard_Real R3d);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: GeomAbs_CurveType
") GetType;
		static GeomAbs_CurveType GetType (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: gp_Lin2d
") Line;
		static gp_Lin2d Line (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: gp_Circ2d
") Circle;
		static gp_Circ2d Circle (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: gp_Elips2d
") Ellipse;
		static gp_Elips2d Ellipse (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: gp_Hypr2d
") Hyperbola;
		static gp_Hypr2d Hyperbola (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: gp_Parab2d
") Parabola;
		static gp_Parab2d Parabola (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: Handle_Geom2d_BezierCurve
") Bezier;
		static Handle_Geom2d_BezierCurve Bezier (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: Handle_Geom2d_BSplineCurve
") BSpline;
		static Handle_Geom2d_BSplineCurve BSpline (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param U0:
	:type U0: float
	:param U1:
	:type U1: float
	:rtype: int
") NbSamples;
		static Standard_Integer NbSamples (const Handle_Adaptor2d_HCurve2d & C,const Standard_Real U0,const Standard_Real U1);
};


%feature("shadow") Contap_HCurve2dTool::~Contap_HCurve2dTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Contap_HCurve2dTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Contap_SequenceNodeOfSequenceOfIWLineOfTheIWalkingOfContour;
class Contap_SequenceNodeOfSequenceOfIWLineOfTheIWalkingOfContour : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Handle_Contap_TheIWLineOfTheIWalkingOfContour &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Contap_SequenceNodeOfSequenceOfIWLineOfTheIWalkingOfContour;
		 Contap_SequenceNodeOfSequenceOfIWLineOfTheIWalkingOfContour (const Handle_Contap_TheIWLineOfTheIWalkingOfContour & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Handle_Contap_TheIWLineOfTheIWalkingOfContour
") Value;
		Handle_Contap_TheIWLineOfTheIWalkingOfContour & Value ();
};


%feature("shadow") Contap_SequenceNodeOfSequenceOfIWLineOfTheIWalkingOfContour::~Contap_SequenceNodeOfSequenceOfIWLineOfTheIWalkingOfContour %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Contap_SequenceNodeOfSequenceOfIWLineOfTheIWalkingOfContour {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Contap_SequenceNodeOfSequenceOfIWLineOfTheIWalkingOfContour {
	Handle_Contap_SequenceNodeOfSequenceOfIWLineOfTheIWalkingOfContour GetHandle() {
	return *(Handle_Contap_SequenceNodeOfSequenceOfIWLineOfTheIWalkingOfContour*) &$self;
	}
};

%nodefaultctor Handle_Contap_SequenceNodeOfSequenceOfIWLineOfTheIWalkingOfContour;
class Handle_Contap_SequenceNodeOfSequenceOfIWLineOfTheIWalkingOfContour : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Contap_SequenceNodeOfSequenceOfIWLineOfTheIWalkingOfContour();
        Handle_Contap_SequenceNodeOfSequenceOfIWLineOfTheIWalkingOfContour(const Handle_Contap_SequenceNodeOfSequenceOfIWLineOfTheIWalkingOfContour &aHandle);
        Handle_Contap_SequenceNodeOfSequenceOfIWLineOfTheIWalkingOfContour(const Contap_SequenceNodeOfSequenceOfIWLineOfTheIWalkingOfContour *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Contap_SequenceNodeOfSequenceOfIWLineOfTheIWalkingOfContour DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Contap_SequenceNodeOfSequenceOfIWLineOfTheIWalkingOfContour {
    Contap_SequenceNodeOfSequenceOfIWLineOfTheIWalkingOfContour* GetObject() {
    return (Contap_SequenceNodeOfSequenceOfIWLineOfTheIWalkingOfContour*)$self->Access();
    }
};
%feature("shadow") Handle_Contap_SequenceNodeOfSequenceOfIWLineOfTheIWalkingOfContour::~Handle_Contap_SequenceNodeOfSequenceOfIWLineOfTheIWalkingOfContour %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Contap_SequenceNodeOfSequenceOfIWLineOfTheIWalkingOfContour {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Contap_SequenceNodeOfSequenceOfPathPointOfTheSearchOfContour;
class Contap_SequenceNodeOfSequenceOfPathPointOfTheSearchOfContour : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Contap_ThePathPointOfTheSearchOfContour &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Contap_SequenceNodeOfSequenceOfPathPointOfTheSearchOfContour;
		 Contap_SequenceNodeOfSequenceOfPathPointOfTheSearchOfContour (const Contap_ThePathPointOfTheSearchOfContour & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Contap_ThePathPointOfTheSearchOfContour
") Value;
		Contap_ThePathPointOfTheSearchOfContour & Value ();
};


%feature("shadow") Contap_SequenceNodeOfSequenceOfPathPointOfTheSearchOfContour::~Contap_SequenceNodeOfSequenceOfPathPointOfTheSearchOfContour %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Contap_SequenceNodeOfSequenceOfPathPointOfTheSearchOfContour {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Contap_SequenceNodeOfSequenceOfPathPointOfTheSearchOfContour {
	Handle_Contap_SequenceNodeOfSequenceOfPathPointOfTheSearchOfContour GetHandle() {
	return *(Handle_Contap_SequenceNodeOfSequenceOfPathPointOfTheSearchOfContour*) &$self;
	}
};

%nodefaultctor Handle_Contap_SequenceNodeOfSequenceOfPathPointOfTheSearchOfContour;
class Handle_Contap_SequenceNodeOfSequenceOfPathPointOfTheSearchOfContour : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Contap_SequenceNodeOfSequenceOfPathPointOfTheSearchOfContour();
        Handle_Contap_SequenceNodeOfSequenceOfPathPointOfTheSearchOfContour(const Handle_Contap_SequenceNodeOfSequenceOfPathPointOfTheSearchOfContour &aHandle);
        Handle_Contap_SequenceNodeOfSequenceOfPathPointOfTheSearchOfContour(const Contap_SequenceNodeOfSequenceOfPathPointOfTheSearchOfContour *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Contap_SequenceNodeOfSequenceOfPathPointOfTheSearchOfContour DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Contap_SequenceNodeOfSequenceOfPathPointOfTheSearchOfContour {
    Contap_SequenceNodeOfSequenceOfPathPointOfTheSearchOfContour* GetObject() {
    return (Contap_SequenceNodeOfSequenceOfPathPointOfTheSearchOfContour*)$self->Access();
    }
};
%feature("shadow") Handle_Contap_SequenceNodeOfSequenceOfPathPointOfTheSearchOfContour::~Handle_Contap_SequenceNodeOfSequenceOfPathPointOfTheSearchOfContour %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Contap_SequenceNodeOfSequenceOfPathPointOfTheSearchOfContour {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Contap_SequenceNodeOfSequenceOfSegmentOfTheSearchOfContour;
class Contap_SequenceNodeOfSequenceOfSegmentOfTheSearchOfContour : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Contap_TheSegmentOfTheSearchOfContour &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Contap_SequenceNodeOfSequenceOfSegmentOfTheSearchOfContour;
		 Contap_SequenceNodeOfSequenceOfSegmentOfTheSearchOfContour (const Contap_TheSegmentOfTheSearchOfContour & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Contap_TheSegmentOfTheSearchOfContour
") Value;
		Contap_TheSegmentOfTheSearchOfContour & Value ();
};


%feature("shadow") Contap_SequenceNodeOfSequenceOfSegmentOfTheSearchOfContour::~Contap_SequenceNodeOfSequenceOfSegmentOfTheSearchOfContour %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Contap_SequenceNodeOfSequenceOfSegmentOfTheSearchOfContour {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Contap_SequenceNodeOfSequenceOfSegmentOfTheSearchOfContour {
	Handle_Contap_SequenceNodeOfSequenceOfSegmentOfTheSearchOfContour GetHandle() {
	return *(Handle_Contap_SequenceNodeOfSequenceOfSegmentOfTheSearchOfContour*) &$self;
	}
};

%nodefaultctor Handle_Contap_SequenceNodeOfSequenceOfSegmentOfTheSearchOfContour;
class Handle_Contap_SequenceNodeOfSequenceOfSegmentOfTheSearchOfContour : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Contap_SequenceNodeOfSequenceOfSegmentOfTheSearchOfContour();
        Handle_Contap_SequenceNodeOfSequenceOfSegmentOfTheSearchOfContour(const Handle_Contap_SequenceNodeOfSequenceOfSegmentOfTheSearchOfContour &aHandle);
        Handle_Contap_SequenceNodeOfSequenceOfSegmentOfTheSearchOfContour(const Contap_SequenceNodeOfSequenceOfSegmentOfTheSearchOfContour *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Contap_SequenceNodeOfSequenceOfSegmentOfTheSearchOfContour DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Contap_SequenceNodeOfSequenceOfSegmentOfTheSearchOfContour {
    Contap_SequenceNodeOfSequenceOfSegmentOfTheSearchOfContour* GetObject() {
    return (Contap_SequenceNodeOfSequenceOfSegmentOfTheSearchOfContour*)$self->Access();
    }
};
%feature("shadow") Handle_Contap_SequenceNodeOfSequenceOfSegmentOfTheSearchOfContour::~Handle_Contap_SequenceNodeOfSequenceOfSegmentOfTheSearchOfContour %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Contap_SequenceNodeOfSequenceOfSegmentOfTheSearchOfContour {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Contap_SequenceNodeOfTheSequenceOfLineOfContour;
class Contap_SequenceNodeOfTheSequenceOfLineOfContour : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Contap_TheLineOfContour &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Contap_SequenceNodeOfTheSequenceOfLineOfContour;
		 Contap_SequenceNodeOfTheSequenceOfLineOfContour (const Contap_TheLineOfContour & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Contap_TheLineOfContour
") Value;
		Contap_TheLineOfContour & Value ();
};


%feature("shadow") Contap_SequenceNodeOfTheSequenceOfLineOfContour::~Contap_SequenceNodeOfTheSequenceOfLineOfContour %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Contap_SequenceNodeOfTheSequenceOfLineOfContour {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Contap_SequenceNodeOfTheSequenceOfLineOfContour {
	Handle_Contap_SequenceNodeOfTheSequenceOfLineOfContour GetHandle() {
	return *(Handle_Contap_SequenceNodeOfTheSequenceOfLineOfContour*) &$self;
	}
};

%nodefaultctor Handle_Contap_SequenceNodeOfTheSequenceOfLineOfContour;
class Handle_Contap_SequenceNodeOfTheSequenceOfLineOfContour : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Contap_SequenceNodeOfTheSequenceOfLineOfContour();
        Handle_Contap_SequenceNodeOfTheSequenceOfLineOfContour(const Handle_Contap_SequenceNodeOfTheSequenceOfLineOfContour &aHandle);
        Handle_Contap_SequenceNodeOfTheSequenceOfLineOfContour(const Contap_SequenceNodeOfTheSequenceOfLineOfContour *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Contap_SequenceNodeOfTheSequenceOfLineOfContour DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Contap_SequenceNodeOfTheSequenceOfLineOfContour {
    Contap_SequenceNodeOfTheSequenceOfLineOfContour* GetObject() {
    return (Contap_SequenceNodeOfTheSequenceOfLineOfContour*)$self->Access();
    }
};
%feature("shadow") Handle_Contap_SequenceNodeOfTheSequenceOfLineOfContour::~Handle_Contap_SequenceNodeOfTheSequenceOfLineOfContour %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Contap_SequenceNodeOfTheSequenceOfLineOfContour {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Contap_SequenceNodeOfTheSequenceOfPointOfContour;
class Contap_SequenceNodeOfTheSequenceOfPointOfContour : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Contap_ThePointOfContour &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Contap_SequenceNodeOfTheSequenceOfPointOfContour;
		 Contap_SequenceNodeOfTheSequenceOfPointOfContour (const Contap_ThePointOfContour & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Contap_ThePointOfContour
") Value;
		Contap_ThePointOfContour & Value ();
};


%feature("shadow") Contap_SequenceNodeOfTheSequenceOfPointOfContour::~Contap_SequenceNodeOfTheSequenceOfPointOfContour %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Contap_SequenceNodeOfTheSequenceOfPointOfContour {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Contap_SequenceNodeOfTheSequenceOfPointOfContour {
	Handle_Contap_SequenceNodeOfTheSequenceOfPointOfContour GetHandle() {
	return *(Handle_Contap_SequenceNodeOfTheSequenceOfPointOfContour*) &$self;
	}
};

%nodefaultctor Handle_Contap_SequenceNodeOfTheSequenceOfPointOfContour;
class Handle_Contap_SequenceNodeOfTheSequenceOfPointOfContour : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Contap_SequenceNodeOfTheSequenceOfPointOfContour();
        Handle_Contap_SequenceNodeOfTheSequenceOfPointOfContour(const Handle_Contap_SequenceNodeOfTheSequenceOfPointOfContour &aHandle);
        Handle_Contap_SequenceNodeOfTheSequenceOfPointOfContour(const Contap_SequenceNodeOfTheSequenceOfPointOfContour *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Contap_SequenceNodeOfTheSequenceOfPointOfContour DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Contap_SequenceNodeOfTheSequenceOfPointOfContour {
    Contap_SequenceNodeOfTheSequenceOfPointOfContour* GetObject() {
    return (Contap_SequenceNodeOfTheSequenceOfPointOfContour*)$self->Access();
    }
};
%feature("shadow") Handle_Contap_SequenceNodeOfTheSequenceOfPointOfContour::~Handle_Contap_SequenceNodeOfTheSequenceOfPointOfContour %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Contap_SequenceNodeOfTheSequenceOfPointOfContour {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Contap_SequenceOfIWLineOfTheIWalkingOfContour;
class Contap_SequenceOfIWLineOfTheIWalkingOfContour : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") Contap_SequenceOfIWLineOfTheIWalkingOfContour;
		 Contap_SequenceOfIWLineOfTheIWalkingOfContour ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Contap_SequenceOfIWLineOfTheIWalkingOfContour &
	:rtype: Contap_SequenceOfIWLineOfTheIWalkingOfContour
") Assign;
		const Contap_SequenceOfIWLineOfTheIWalkingOfContour & Assign (const Contap_SequenceOfIWLineOfTheIWalkingOfContour & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Contap_SequenceOfIWLineOfTheIWalkingOfContour &
	:rtype: Contap_SequenceOfIWLineOfTheIWalkingOfContour
") operator=;
		const Contap_SequenceOfIWLineOfTheIWalkingOfContour & operator = (const Contap_SequenceOfIWLineOfTheIWalkingOfContour & Other);
		%feature("autodoc", "	:param T:
	:type T: Handle_Contap_TheIWLineOfTheIWalkingOfContour &
	:rtype: None
") Append;
		void Append (const Handle_Contap_TheIWLineOfTheIWalkingOfContour & T);
		%feature("autodoc", "	:param S:
	:type S: Contap_SequenceOfIWLineOfTheIWalkingOfContour &
	:rtype: None
") Append;
		void Append (Contap_SequenceOfIWLineOfTheIWalkingOfContour & S);
		%feature("autodoc", "	:param T:
	:type T: Handle_Contap_TheIWLineOfTheIWalkingOfContour &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Contap_TheIWLineOfTheIWalkingOfContour & T);
		%feature("autodoc", "	:param S:
	:type S: Contap_SequenceOfIWLineOfTheIWalkingOfContour &
	:rtype: None
") Prepend;
		void Prepend (Contap_SequenceOfIWLineOfTheIWalkingOfContour & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_Contap_TheIWLineOfTheIWalkingOfContour &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Contap_TheIWLineOfTheIWalkingOfContour & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Contap_SequenceOfIWLineOfTheIWalkingOfContour &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Contap_SequenceOfIWLineOfTheIWalkingOfContour & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_Contap_TheIWLineOfTheIWalkingOfContour &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Contap_TheIWLineOfTheIWalkingOfContour & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Contap_SequenceOfIWLineOfTheIWalkingOfContour &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Contap_SequenceOfIWLineOfTheIWalkingOfContour & S);
		%feature("autodoc", "	:rtype: Handle_Contap_TheIWLineOfTheIWalkingOfContour
") First;
		const Handle_Contap_TheIWLineOfTheIWalkingOfContour & First ();
		%feature("autodoc", "	:rtype: Handle_Contap_TheIWLineOfTheIWalkingOfContour
") Last;
		const Handle_Contap_TheIWLineOfTheIWalkingOfContour & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Contap_SequenceOfIWLineOfTheIWalkingOfContour &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Contap_SequenceOfIWLineOfTheIWalkingOfContour & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Contap_TheIWLineOfTheIWalkingOfContour
") Value;
		const Handle_Contap_TheIWLineOfTheIWalkingOfContour & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Handle_Contap_TheIWLineOfTheIWalkingOfContour &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Contap_TheIWLineOfTheIWalkingOfContour & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Contap_TheIWLineOfTheIWalkingOfContour
") ChangeValue;
		Handle_Contap_TheIWLineOfTheIWalkingOfContour & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") Contap_SequenceOfIWLineOfTheIWalkingOfContour::~Contap_SequenceOfIWLineOfTheIWalkingOfContour %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Contap_SequenceOfIWLineOfTheIWalkingOfContour {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Contap_SequenceOfPathPointOfTheSearchOfContour;
class Contap_SequenceOfPathPointOfTheSearchOfContour : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") Contap_SequenceOfPathPointOfTheSearchOfContour;
		 Contap_SequenceOfPathPointOfTheSearchOfContour ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Contap_SequenceOfPathPointOfTheSearchOfContour &
	:rtype: Contap_SequenceOfPathPointOfTheSearchOfContour
") Assign;
		const Contap_SequenceOfPathPointOfTheSearchOfContour & Assign (const Contap_SequenceOfPathPointOfTheSearchOfContour & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Contap_SequenceOfPathPointOfTheSearchOfContour &
	:rtype: Contap_SequenceOfPathPointOfTheSearchOfContour
") operator=;
		const Contap_SequenceOfPathPointOfTheSearchOfContour & operator = (const Contap_SequenceOfPathPointOfTheSearchOfContour & Other);
		%feature("autodoc", "	:param T:
	:type T: Contap_ThePathPointOfTheSearchOfContour &
	:rtype: None
") Append;
		void Append (const Contap_ThePathPointOfTheSearchOfContour & T);
		%feature("autodoc", "	:param S:
	:type S: Contap_SequenceOfPathPointOfTheSearchOfContour &
	:rtype: None
") Append;
		void Append (Contap_SequenceOfPathPointOfTheSearchOfContour & S);
		%feature("autodoc", "	:param T:
	:type T: Contap_ThePathPointOfTheSearchOfContour &
	:rtype: None
") Prepend;
		void Prepend (const Contap_ThePathPointOfTheSearchOfContour & T);
		%feature("autodoc", "	:param S:
	:type S: Contap_SequenceOfPathPointOfTheSearchOfContour &
	:rtype: None
") Prepend;
		void Prepend (Contap_SequenceOfPathPointOfTheSearchOfContour & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Contap_ThePathPointOfTheSearchOfContour &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Contap_ThePathPointOfTheSearchOfContour & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Contap_SequenceOfPathPointOfTheSearchOfContour &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Contap_SequenceOfPathPointOfTheSearchOfContour & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Contap_ThePathPointOfTheSearchOfContour &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Contap_ThePathPointOfTheSearchOfContour & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Contap_SequenceOfPathPointOfTheSearchOfContour &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Contap_SequenceOfPathPointOfTheSearchOfContour & S);
		%feature("autodoc", "	:rtype: Contap_ThePathPointOfTheSearchOfContour
") First;
		const Contap_ThePathPointOfTheSearchOfContour & First ();
		%feature("autodoc", "	:rtype: Contap_ThePathPointOfTheSearchOfContour
") Last;
		const Contap_ThePathPointOfTheSearchOfContour & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Contap_SequenceOfPathPointOfTheSearchOfContour &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Contap_SequenceOfPathPointOfTheSearchOfContour & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Contap_ThePathPointOfTheSearchOfContour
") Value;
		const Contap_ThePathPointOfTheSearchOfContour & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Contap_ThePathPointOfTheSearchOfContour &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Contap_ThePathPointOfTheSearchOfContour & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Contap_ThePathPointOfTheSearchOfContour
") ChangeValue;
		Contap_ThePathPointOfTheSearchOfContour & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") Contap_SequenceOfPathPointOfTheSearchOfContour::~Contap_SequenceOfPathPointOfTheSearchOfContour %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Contap_SequenceOfPathPointOfTheSearchOfContour {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Contap_SequenceOfSegmentOfTheSearchOfContour;
class Contap_SequenceOfSegmentOfTheSearchOfContour : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") Contap_SequenceOfSegmentOfTheSearchOfContour;
		 Contap_SequenceOfSegmentOfTheSearchOfContour ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Contap_SequenceOfSegmentOfTheSearchOfContour &
	:rtype: Contap_SequenceOfSegmentOfTheSearchOfContour
") Assign;
		const Contap_SequenceOfSegmentOfTheSearchOfContour & Assign (const Contap_SequenceOfSegmentOfTheSearchOfContour & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Contap_SequenceOfSegmentOfTheSearchOfContour &
	:rtype: Contap_SequenceOfSegmentOfTheSearchOfContour
") operator=;
		const Contap_SequenceOfSegmentOfTheSearchOfContour & operator = (const Contap_SequenceOfSegmentOfTheSearchOfContour & Other);
		%feature("autodoc", "	:param T:
	:type T: Contap_TheSegmentOfTheSearchOfContour &
	:rtype: None
") Append;
		void Append (const Contap_TheSegmentOfTheSearchOfContour & T);
		%feature("autodoc", "	:param S:
	:type S: Contap_SequenceOfSegmentOfTheSearchOfContour &
	:rtype: None
") Append;
		void Append (Contap_SequenceOfSegmentOfTheSearchOfContour & S);
		%feature("autodoc", "	:param T:
	:type T: Contap_TheSegmentOfTheSearchOfContour &
	:rtype: None
") Prepend;
		void Prepend (const Contap_TheSegmentOfTheSearchOfContour & T);
		%feature("autodoc", "	:param S:
	:type S: Contap_SequenceOfSegmentOfTheSearchOfContour &
	:rtype: None
") Prepend;
		void Prepend (Contap_SequenceOfSegmentOfTheSearchOfContour & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Contap_TheSegmentOfTheSearchOfContour &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Contap_TheSegmentOfTheSearchOfContour & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Contap_SequenceOfSegmentOfTheSearchOfContour &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Contap_SequenceOfSegmentOfTheSearchOfContour & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Contap_TheSegmentOfTheSearchOfContour &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Contap_TheSegmentOfTheSearchOfContour & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Contap_SequenceOfSegmentOfTheSearchOfContour &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Contap_SequenceOfSegmentOfTheSearchOfContour & S);
		%feature("autodoc", "	:rtype: Contap_TheSegmentOfTheSearchOfContour
") First;
		const Contap_TheSegmentOfTheSearchOfContour & First ();
		%feature("autodoc", "	:rtype: Contap_TheSegmentOfTheSearchOfContour
") Last;
		const Contap_TheSegmentOfTheSearchOfContour & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Contap_SequenceOfSegmentOfTheSearchOfContour &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Contap_SequenceOfSegmentOfTheSearchOfContour & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Contap_TheSegmentOfTheSearchOfContour
") Value;
		const Contap_TheSegmentOfTheSearchOfContour & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Contap_TheSegmentOfTheSearchOfContour &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Contap_TheSegmentOfTheSearchOfContour & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Contap_TheSegmentOfTheSearchOfContour
") ChangeValue;
		Contap_TheSegmentOfTheSearchOfContour & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") Contap_SequenceOfSegmentOfTheSearchOfContour::~Contap_SequenceOfSegmentOfTheSearchOfContour %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Contap_SequenceOfSegmentOfTheSearchOfContour {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Contap_TheArcFunctionOfContour;
class Contap_TheArcFunctionOfContour : public math_FunctionWithDerivative {
	public:
		%feature("autodoc", "	:rtype: None
") Contap_TheArcFunctionOfContour;
		 Contap_TheArcFunctionOfContour ();
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: None
") Set;
		void Set (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "	:param Direction:
	:type Direction: gp_Dir
	:rtype: None
") Set;
		void Set (const gp_Dir & Direction);
		%feature("autodoc", "	:param Direction:
	:type Direction: gp_Dir
	:param Angle:
	:type Angle: float
	:rtype: None
") Set;
		void Set (const gp_Dir & Direction,const Standard_Real Angle);
		%feature("autodoc", "	:param Eye:
	:type Eye: gp_Pnt
	:rtype: None
") Set;
		void Set (const gp_Pnt & Eye);
		%feature("autodoc", "	:param Eye:
	:type Eye: gp_Pnt
	:param Angle:
	:type Angle: float
	:rtype: None
") Set;
		void Set (const gp_Pnt & Eye,const Standard_Real Angle);
		%feature("autodoc", "	:param A:
	:type A: Handle_Adaptor2d_HCurve2d &
	:rtype: None
") Set;
		void Set (const Handle_Adaptor2d_HCurve2d & A);
		%feature("autodoc", "	:param X:
	:type X: float
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Real X,Standard_Real &OutValue);
		%feature("autodoc", "	:param X:
	:type X: float
	:param D:
	:type D: float &
	:rtype: bool
") Derivative;
		Standard_Boolean Derivative (const Standard_Real X,Standard_Real &OutValue);
		%feature("autodoc", "	:param X:
	:type X: float
	:param F:
	:type F: float &
	:param D:
	:type D: float &
	:rtype: bool
") Values;
		Standard_Boolean Values (const Standard_Real X,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:rtype: int
") NbSamples;
		Standard_Integer NbSamples ();
		%feature("autodoc", "	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: gp_Pnt
") Valpoint;
		const gp_Pnt & Valpoint (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: IntSurf_Quadric
") Quadric;
		const IntSurf_Quadric & Quadric ();
};


%feature("shadow") Contap_TheArcFunctionOfContour::~Contap_TheArcFunctionOfContour %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Contap_TheArcFunctionOfContour {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Contap_TheHSequenceOfPointOfContour;
class Contap_TheHSequenceOfPointOfContour : public MMgt_TShared {
	public:
		%feature("autodoc", "	:rtype: None
") Contap_TheHSequenceOfPointOfContour;
		 Contap_TheHSequenceOfPointOfContour ();
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param anItem:
	:type anItem: Contap_ThePointOfContour &
	:rtype: None
") Append;
		void Append (const Contap_ThePointOfContour & anItem);
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Contap_TheHSequenceOfPointOfContour &
	:rtype: None
") Append;
		void Append (const Handle_Contap_TheHSequenceOfPointOfContour & aSequence);
		%feature("autodoc", "	:param anItem:
	:type anItem: Contap_ThePointOfContour &
	:rtype: None
") Prepend;
		void Prepend (const Contap_ThePointOfContour & anItem);
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Contap_TheHSequenceOfPointOfContour &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Contap_TheHSequenceOfPointOfContour & aSequence);
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Contap_ThePointOfContour &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Contap_ThePointOfContour & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param aSequence:
	:type aSequence: Handle_Contap_TheHSequenceOfPointOfContour &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Contap_TheHSequenceOfPointOfContour & aSequence);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Contap_ThePointOfContour &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Contap_ThePointOfContour & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param aSequence:
	:type aSequence: Handle_Contap_TheHSequenceOfPointOfContour &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Contap_TheHSequenceOfPointOfContour & aSequence);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anOtherIndex:
	:type anOtherIndex: Standard_Integer
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_Contap_TheHSequenceOfPointOfContour
") Split;
		Handle_Contap_TheHSequenceOfPointOfContour Split (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Contap_ThePointOfContour &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Contap_ThePointOfContour & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Contap_ThePointOfContour
") Value;
		const Contap_ThePointOfContour & Value (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Contap_ThePointOfContour
") ChangeValue;
		Contap_ThePointOfContour & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: Standard_Integer
	:param toIndex:
	:type toIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "	:rtype: Contap_TheSequenceOfPointOfContour
") Sequence;
		const Contap_TheSequenceOfPointOfContour & Sequence ();
		%feature("autodoc", "	:rtype: Contap_TheSequenceOfPointOfContour
") ChangeSequence;
		Contap_TheSequenceOfPointOfContour & ChangeSequence ();
		%feature("autodoc", "	:rtype: Handle_Contap_TheHSequenceOfPointOfContour
") ShallowCopy;
		Handle_Contap_TheHSequenceOfPointOfContour ShallowCopy ();
};


%feature("shadow") Contap_TheHSequenceOfPointOfContour::~Contap_TheHSequenceOfPointOfContour %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Contap_TheHSequenceOfPointOfContour {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Contap_TheHSequenceOfPointOfContour {
	Handle_Contap_TheHSequenceOfPointOfContour GetHandle() {
	return *(Handle_Contap_TheHSequenceOfPointOfContour*) &$self;
	}
};

%nodefaultctor Handle_Contap_TheHSequenceOfPointOfContour;
class Handle_Contap_TheHSequenceOfPointOfContour : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Contap_TheHSequenceOfPointOfContour();
        Handle_Contap_TheHSequenceOfPointOfContour(const Handle_Contap_TheHSequenceOfPointOfContour &aHandle);
        Handle_Contap_TheHSequenceOfPointOfContour(const Contap_TheHSequenceOfPointOfContour *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Contap_TheHSequenceOfPointOfContour DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Contap_TheHSequenceOfPointOfContour {
    Contap_TheHSequenceOfPointOfContour* GetObject() {
    return (Contap_TheHSequenceOfPointOfContour*)$self->Access();
    }
};
%feature("shadow") Handle_Contap_TheHSequenceOfPointOfContour::~Handle_Contap_TheHSequenceOfPointOfContour %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Contap_TheHSequenceOfPointOfContour {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Contap_TheIWLineOfTheIWalkingOfContour;
class Contap_TheIWLineOfTheIWalkingOfContour : public MMgt_TShared {
	public:
		%feature("autodoc", "	:param theAllocator: default value is 0
	:type theAllocator: IntSurf_Allocator &
	:rtype: None
") Contap_TheIWLineOfTheIWalkingOfContour;
		 Contap_TheIWLineOfTheIWalkingOfContour (const IntSurf_Allocator & theAllocator = 0);
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Cut;
		void Cut (const Standard_Integer Index);
		%feature("autodoc", "	:param P:
	:type P: IntSurf_PntOn2S &
	:rtype: None
") AddPoint;
		void AddPoint (const IntSurf_PntOn2S & P);
		%feature("autodoc", "	:param Closed:
	:type Closed: bool
	:param HasFirst:
	:type HasFirst: bool
	:rtype: None
") AddStatusFirst;
		void AddStatusFirst (const Standard_Boolean Closed,const Standard_Boolean HasFirst);
		%feature("autodoc", "	:param Closed:
	:type Closed: bool
	:param HasLast:
	:type HasLast: bool
	:param Index:
	:type Index: Standard_Integer
	:param P:
	:type P: IntSurf_PathPoint &
	:rtype: None
") AddStatusFirst;
		void AddStatusFirst (const Standard_Boolean Closed,const Standard_Boolean HasLast,const Standard_Integer Index,const IntSurf_PathPoint & P);
		%feature("autodoc", "	:param Closed:
	:type Closed: bool
	:param HasFirst:
	:type HasFirst: bool
	:param HasLast:
	:type HasLast: bool
	:rtype: None
") AddStatusFirstLast;
		void AddStatusFirstLast (const Standard_Boolean Closed,const Standard_Boolean HasFirst,const Standard_Boolean HasLast);
		%feature("autodoc", "	:param HasLast:
	:type HasLast: bool
	:rtype: None
") AddStatusLast;
		void AddStatusLast (const Standard_Boolean HasLast);
		%feature("autodoc", "	:param HasLast:
	:type HasLast: bool
	:param Index:
	:type Index: Standard_Integer
	:param P:
	:type P: IntSurf_PathPoint &
	:rtype: None
") AddStatusLast;
		void AddStatusLast (const Standard_Boolean HasLast,const Standard_Integer Index,const IntSurf_PathPoint & P);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") AddIndexPassing;
		void AddIndexPassing (const Standard_Integer Index);
		%feature("autodoc", "	:param V:
	:type V: gp_Vec
	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") SetTangentVector;
		void SetTangentVector (const gp_Vec & V,const Standard_Integer Index);
		%feature("autodoc", "	:param IsTangent:
	:type IsTangent: bool
	:rtype: None
") SetTangencyAtBegining;
		void SetTangencyAtBegining (const Standard_Boolean IsTangent);
		%feature("autodoc", "	:param IsTangent:
	:type IsTangent: bool
	:rtype: None
") SetTangencyAtEnd;
		void SetTangencyAtEnd (const Standard_Boolean IsTangent);
		%feature("autodoc", "	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: IntSurf_PntOn2S
") Value;
		const IntSurf_PntOn2S & Value (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: Handle_IntSurf_LineOn2S
") Line;
		const Handle_IntSurf_LineOn2S & Line ();
		%feature("autodoc", "	:rtype: bool
") IsClosed;
		Standard_Boolean IsClosed ();
		%feature("autodoc", "	:rtype: bool
") HasFirstPoint;
		Standard_Boolean HasFirstPoint ();
		%feature("autodoc", "	:rtype: bool
") HasLastPoint;
		Standard_Boolean HasLastPoint ();
		%feature("autodoc", "	:rtype: IntSurf_PathPoint
") FirstPoint;
		const IntSurf_PathPoint & FirstPoint ();
		%feature("autodoc", "	:rtype: int
") FirstPointIndex;
		Standard_Integer FirstPointIndex ();
		%feature("autodoc", "	:rtype: IntSurf_PathPoint
") LastPoint;
		const IntSurf_PathPoint & LastPoint ();
		%feature("autodoc", "	:rtype: int
") LastPointIndex;
		Standard_Integer LastPointIndex ();
		%feature("autodoc", "	:rtype: int
") NbPassingPoint;
		Standard_Integer NbPassingPoint ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param IndexLine:
	:type IndexLine: Standard_Integer &
	:param IndexPnts:
	:type IndexPnts: Standard_Integer &
	:rtype: None
") PassingPoint;
		void PassingPoint (const Standard_Integer Index,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer &
	:rtype: gp_Vec
") TangentVector;
		const gp_Vec & TangentVector (Standard_Integer &OutValue);
		%feature("autodoc", "	:rtype: bool
") IsTangentAtBegining;
		Standard_Boolean IsTangentAtBegining ();
		%feature("autodoc", "	:rtype: bool
") IsTangentAtEnd;
		Standard_Boolean IsTangentAtEnd ();
};


%feature("shadow") Contap_TheIWLineOfTheIWalkingOfContour::~Contap_TheIWLineOfTheIWalkingOfContour %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Contap_TheIWLineOfTheIWalkingOfContour {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Contap_TheIWLineOfTheIWalkingOfContour {
	Handle_Contap_TheIWLineOfTheIWalkingOfContour GetHandle() {
	return *(Handle_Contap_TheIWLineOfTheIWalkingOfContour*) &$self;
	}
};

%nodefaultctor Handle_Contap_TheIWLineOfTheIWalkingOfContour;
class Handle_Contap_TheIWLineOfTheIWalkingOfContour : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Contap_TheIWLineOfTheIWalkingOfContour();
        Handle_Contap_TheIWLineOfTheIWalkingOfContour(const Handle_Contap_TheIWLineOfTheIWalkingOfContour &aHandle);
        Handle_Contap_TheIWLineOfTheIWalkingOfContour(const Contap_TheIWLineOfTheIWalkingOfContour *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Contap_TheIWLineOfTheIWalkingOfContour DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Contap_TheIWLineOfTheIWalkingOfContour {
    Contap_TheIWLineOfTheIWalkingOfContour* GetObject() {
    return (Contap_TheIWLineOfTheIWalkingOfContour*)$self->Access();
    }
};
%feature("shadow") Handle_Contap_TheIWLineOfTheIWalkingOfContour::~Handle_Contap_TheIWLineOfTheIWalkingOfContour %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Contap_TheIWLineOfTheIWalkingOfContour {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Contap_TheIWalkingOfContour;
class Contap_TheIWalkingOfContour {
	public:
		%feature("autodoc", "	:param Epsilon:
	:type Epsilon: float
	:param Deflection:
	:type Deflection: float
	:param Step:
	:type Step: float
	:rtype: None
") Contap_TheIWalkingOfContour;
		 Contap_TheIWalkingOfContour (const Standard_Real Epsilon,const Standard_Real Deflection,const Standard_Real Step);
		%feature("autodoc", "	:param Epsilon:
	:type Epsilon: float
	:param Deflection:
	:type Deflection: float
	:param Step:
	:type Step: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Real Epsilon,const Standard_Real Deflection,const Standard_Real Step);
		%feature("autodoc", "	:param Pnts1:
	:type Pnts1: IntSurf_SequenceOfPathPoint &
	:param Pnts2:
	:type Pnts2: IntSurf_SequenceOfInteriorPoint &
	:param Func:
	:type Func: Contap_TheSurfFunctionOfContour &
	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param Reversed: default value is Standard_False
	:type Reversed: bool
	:rtype: None
") Perform;
		void Perform (const IntSurf_SequenceOfPathPoint & Pnts1,const IntSurf_SequenceOfInteriorPoint & Pnts2,Contap_TheSurfFunctionOfContour & Func,const Handle_Adaptor3d_HSurface & S,const Standard_Boolean Reversed = Standard_False);
		%feature("autodoc", "	:param Pnts1:
	:type Pnts1: IntSurf_SequenceOfPathPoint &
	:param Func:
	:type Func: Contap_TheSurfFunctionOfContour &
	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param Reversed: default value is Standard_False
	:type Reversed: bool
	:rtype: None
") Perform;
		void Perform (const IntSurf_SequenceOfPathPoint & Pnts1,Contap_TheSurfFunctionOfContour & Func,const Handle_Adaptor3d_HSurface & S,const Standard_Boolean Reversed = Standard_False);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: int
") NbLines;
		Standard_Integer NbLines ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Contap_TheIWLineOfTheIWalkingOfContour
") Value;
		const Handle_Contap_TheIWLineOfTheIWalkingOfContour & Value (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: int
") NbSinglePnts;
		Standard_Integer NbSinglePnts ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: IntSurf_PathPoint
") SinglePnt;
		const IntSurf_PathPoint & SinglePnt (const Standard_Integer Index);
};


%feature("shadow") Contap_TheIWalkingOfContour::~Contap_TheIWalkingOfContour %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Contap_TheIWalkingOfContour {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Contap_TheLineOfContour;
class Contap_TheLineOfContour {
	public:
		%feature("autodoc", "	:rtype: None
") Contap_TheLineOfContour;
		 Contap_TheLineOfContour ();
		%feature("autodoc", "	:param L:
	:type L: Handle_IntSurf_LineOn2S &
	:rtype: None
") SetLineOn2S;
		void SetLineOn2S (const Handle_IntSurf_LineOn2S & L);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:rtype: Handle_IntSurf_LineOn2S
") LineOn2S;
		const Handle_IntSurf_LineOn2S & LineOn2S ();
		%feature("autodoc", "	:rtype: None
") ResetSeqOfVertex;
		void ResetSeqOfVertex ();
		%feature("autodoc", "	:param P:
	:type P: IntSurf_PntOn2S &
	:rtype: None
") Add;
		void Add (const IntSurf_PntOn2S & P);
		%feature("autodoc", "	:param L:
	:type L: gp_Lin
	:rtype: None
") SetValue;
		void SetValue (const gp_Lin & L);
		%feature("autodoc", "	:param C:
	:type C: gp_Circ
	:rtype: None
") SetValue;
		void SetValue (const gp_Circ & C);
		%feature("autodoc", "	:param A:
	:type A: Handle_Adaptor2d_HCurve2d &
	:rtype: None
") SetValue;
		void SetValue (const Handle_Adaptor2d_HCurve2d & A);
		%feature("autodoc", "	:param P:
	:type P: Contap_ThePointOfContour &
	:rtype: None
") Add;
		void Add (const Contap_ThePointOfContour & P);
		%feature("autodoc", "	:rtype: int
") NbVertex;
		Standard_Integer NbVertex ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Contap_ThePointOfContour
") Vertex;
		Contap_ThePointOfContour & Vertex (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: Contap_IType
") TypeContour;
		Contap_IType TypeContour ();
		%feature("autodoc", "	:rtype: int
") NbPnts;
		Standard_Integer NbPnts ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: IntSurf_PntOn2S
") Point;
		const IntSurf_PntOn2S & Point (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: gp_Lin
") Line;
		gp_Lin Line ();
		%feature("autodoc", "	:rtype: gp_Circ
") Circle;
		gp_Circ Circle ();
		%feature("autodoc", "	:rtype: Handle_Adaptor2d_HCurve2d
") Arc;
		const Handle_Adaptor2d_HCurve2d & Arc ();
		%feature("autodoc", "	:param T:
	:type T: IntSurf_TypeTrans
	:rtype: None
") SetTransitionOnS;
		void SetTransitionOnS (const IntSurf_TypeTrans T);
		%feature("autodoc", "	:rtype: IntSurf_TypeTrans
") TransitionOnS;
		IntSurf_TypeTrans TransitionOnS ();
};


%feature("shadow") Contap_TheLineOfContour::~Contap_TheLineOfContour %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Contap_TheLineOfContour {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Contap_ThePathPointOfTheSearchOfContour;
class Contap_ThePathPointOfTheSearchOfContour {
	public:
		%feature("autodoc", "	:rtype: None
") Contap_ThePathPointOfTheSearchOfContour;
		 Contap_ThePathPointOfTheSearchOfContour ();
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param Tol:
	:type Tol: float
	:param V:
	:type V: Handle_Adaptor3d_HVertex &
	:param A:
	:type A: Handle_Adaptor2d_HCurve2d &
	:param Parameter:
	:type Parameter: float
	:rtype: None
") Contap_ThePathPointOfTheSearchOfContour;
		 Contap_ThePathPointOfTheSearchOfContour (const gp_Pnt & P,const Standard_Real Tol,const Handle_Adaptor3d_HVertex & V,const Handle_Adaptor2d_HCurve2d & A,const Standard_Real Parameter);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param Tol:
	:type Tol: float
	:param A:
	:type A: Handle_Adaptor2d_HCurve2d &
	:param Parameter:
	:type Parameter: float
	:rtype: None
") Contap_ThePathPointOfTheSearchOfContour;
		 Contap_ThePathPointOfTheSearchOfContour (const gp_Pnt & P,const Standard_Real Tol,const Handle_Adaptor2d_HCurve2d & A,const Standard_Real Parameter);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param Tol:
	:type Tol: float
	:param V:
	:type V: Handle_Adaptor3d_HVertex &
	:param A:
	:type A: Handle_Adaptor2d_HCurve2d &
	:param Parameter:
	:type Parameter: float
	:rtype: None
") SetValue;
		void SetValue (const gp_Pnt & P,const Standard_Real Tol,const Handle_Adaptor3d_HVertex & V,const Handle_Adaptor2d_HCurve2d & A,const Standard_Real Parameter);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param Tol:
	:type Tol: float
	:param A:
	:type A: Handle_Adaptor2d_HCurve2d &
	:param Parameter:
	:type Parameter: float
	:rtype: None
") SetValue;
		void SetValue (const gp_Pnt & P,const Standard_Real Tol,const Handle_Adaptor2d_HCurve2d & A,const Standard_Real Parameter);
		%feature("autodoc", "	:rtype: gp_Pnt
") Value;
		const gp_Pnt & Value ();
		%feature("autodoc", "	:rtype: float
") Tolerance;
		Standard_Real Tolerance ();
		%feature("autodoc", "	:rtype: bool
") IsNew;
		Standard_Boolean IsNew ();
		%feature("autodoc", "	:rtype: Handle_Adaptor3d_HVertex
") Vertex;
		const Handle_Adaptor3d_HVertex & Vertex ();
		%feature("autodoc", "	:rtype: Handle_Adaptor2d_HCurve2d
") Arc;
		const Handle_Adaptor2d_HCurve2d & Arc ();
		%feature("autodoc", "	:rtype: float
") Parameter;
		Standard_Real Parameter ();
};


%feature("shadow") Contap_ThePathPointOfTheSearchOfContour::~Contap_ThePathPointOfTheSearchOfContour %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Contap_ThePathPointOfTheSearchOfContour {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Contap_ThePointOfContour;
class Contap_ThePointOfContour {
	public:
		%feature("autodoc", "	:rtype: None
") Contap_ThePointOfContour;
		 Contap_ThePointOfContour ();
		%feature("autodoc", "	:param Pt:
	:type Pt: gp_Pnt
	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: None
") Contap_ThePointOfContour;
		 Contap_ThePointOfContour (const gp_Pnt & Pt,const Standard_Real U,const Standard_Real V);
		%feature("autodoc", "	:param Pt:
	:type Pt: gp_Pnt
	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: None
") SetValue;
		void SetValue (const gp_Pnt & Pt,const Standard_Real U,const Standard_Real V);
		%feature("autodoc", "	:param Para:
	:type Para: float
	:rtype: None
") SetParameter;
		void SetParameter (const Standard_Real Para);
		%feature("autodoc", "	:param V:
	:type V: Handle_Adaptor3d_HVertex &
	:rtype: None
") SetVertex;
		void SetVertex (const Handle_Adaptor3d_HVertex & V);
		%feature("autodoc", "	:param A:
	:type A: Handle_Adaptor2d_HCurve2d &
	:param Param:
	:type Param: float
	:param TLine:
	:type TLine: IntSurf_Transition &
	:param TArc:
	:type TArc: IntSurf_Transition &
	:rtype: None
") SetArc;
		void SetArc (const Handle_Adaptor2d_HCurve2d & A,const Standard_Real Param,const IntSurf_Transition & TLine,const IntSurf_Transition & TArc);
		%feature("autodoc", "	:rtype: None
") SetMultiple;
		void SetMultiple ();
		%feature("autodoc", "	:rtype: None
") SetInternal;
		void SetInternal ();
		%feature("autodoc", "	:rtype: gp_Pnt
") Value;
		const gp_Pnt & Value ();
		%feature("autodoc", "	:rtype: float
") ParameterOnLine;
		Standard_Real ParameterOnLine ();
		%feature("autodoc", "	:param U1:
	:type U1: float &
	:param V1:
	:type V1: float &
	:rtype: None
") Parameters;
		void Parameters (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:rtype: bool
") IsOnArc;
		Standard_Boolean IsOnArc ();
		%feature("autodoc", "	:rtype: Handle_Adaptor2d_HCurve2d
") Arc;
		const Handle_Adaptor2d_HCurve2d & Arc ();
		%feature("autodoc", "	:rtype: float
") ParameterOnArc;
		Standard_Real ParameterOnArc ();
		%feature("autodoc", "	:rtype: IntSurf_Transition
") TransitionOnLine;
		const IntSurf_Transition & TransitionOnLine ();
		%feature("autodoc", "	:rtype: IntSurf_Transition
") TransitionOnArc;
		const IntSurf_Transition & TransitionOnArc ();
		%feature("autodoc", "	:rtype: bool
") IsVertex;
		Standard_Boolean IsVertex ();
		%feature("autodoc", "	:rtype: Handle_Adaptor3d_HVertex
") Vertex;
		const Handle_Adaptor3d_HVertex & Vertex ();
		%feature("autodoc", "	:rtype: bool
") IsMultiple;
		Standard_Boolean IsMultiple ();
		%feature("autodoc", "	:rtype: bool
") IsInternal;
		Standard_Boolean IsInternal ();
};


%feature("shadow") Contap_ThePointOfContour::~Contap_ThePointOfContour %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Contap_ThePointOfContour {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Contap_TheSearchInsideOfContour;
class Contap_TheSearchInsideOfContour {
	public:
		%feature("autodoc", "	:rtype: None
") Contap_TheSearchInsideOfContour;
		 Contap_TheSearchInsideOfContour ();
		%feature("autodoc", "	:param F:
	:type F: Contap_TheSurfFunctionOfContour &
	:param Surf:
	:type Surf: Handle_Adaptor3d_HSurface &
	:param T:
	:type T: Handle_Adaptor3d_TopolTool &
	:param Epsilon:
	:type Epsilon: float
	:rtype: None
") Contap_TheSearchInsideOfContour;
		 Contap_TheSearchInsideOfContour (Contap_TheSurfFunctionOfContour & F,const Handle_Adaptor3d_HSurface & Surf,const Handle_Adaptor3d_TopolTool & T,const Standard_Real Epsilon);
		%feature("autodoc", "	:param F:
	:type F: Contap_TheSurfFunctionOfContour &
	:param Surf:
	:type Surf: Handle_Adaptor3d_HSurface &
	:param T:
	:type T: Handle_Adaptor3d_TopolTool &
	:param Epsilon:
	:type Epsilon: float
	:rtype: None
") Perform;
		void Perform (Contap_TheSurfFunctionOfContour & F,const Handle_Adaptor3d_HSurface & Surf,const Handle_Adaptor3d_TopolTool & T,const Standard_Real Epsilon);
		%feature("autodoc", "	:param F:
	:type F: Contap_TheSurfFunctionOfContour &
	:param Surf:
	:type Surf: Handle_Adaptor3d_HSurface &
	:param UStart:
	:type UStart: float
	:param VStart:
	:type VStart: float
	:rtype: None
") Perform;
		void Perform (Contap_TheSurfFunctionOfContour & F,const Handle_Adaptor3d_HSurface & Surf,const Standard_Real UStart,const Standard_Real VStart);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: IntSurf_InteriorPoint
") Value;
		const IntSurf_InteriorPoint & Value (const Standard_Integer Index);
};


%feature("shadow") Contap_TheSearchInsideOfContour::~Contap_TheSearchInsideOfContour %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Contap_TheSearchInsideOfContour {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Contap_TheSearchOfContour;
class Contap_TheSearchOfContour {
	public:
		%feature("autodoc", "	:rtype: None
") Contap_TheSearchOfContour;
		 Contap_TheSearchOfContour ();
		%feature("autodoc", "	:param F:
	:type F: Contap_TheArcFunctionOfContour &
	:param Domain:
	:type Domain: Handle_Adaptor3d_TopolTool &
	:param TolBoundary:
	:type TolBoundary: float
	:param TolTangency:
	:type TolTangency: float
	:param RecheckOnRegularity: default value is Standard_False
	:type RecheckOnRegularity: bool
	:rtype: None
") Perform;
		void Perform (Contap_TheArcFunctionOfContour & F,const Handle_Adaptor3d_TopolTool & Domain,const Standard_Real TolBoundary,const Standard_Real TolTangency,const Standard_Boolean RecheckOnRegularity = Standard_False);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: bool
") AllArcSolution;
		Standard_Boolean AllArcSolution ();
		%feature("autodoc", "	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Contap_ThePathPointOfTheSearchOfContour
") Point;
		const Contap_ThePathPointOfTheSearchOfContour & Point (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: int
") NbSegments;
		Standard_Integer NbSegments ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Contap_TheSegmentOfTheSearchOfContour
") Segment;
		const Contap_TheSegmentOfTheSearchOfContour & Segment (const Standard_Integer Index);
};


%feature("shadow") Contap_TheSearchOfContour::~Contap_TheSearchOfContour %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Contap_TheSearchOfContour {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Contap_TheSegmentOfTheSearchOfContour;
class Contap_TheSegmentOfTheSearchOfContour {
	public:
		%feature("autodoc", "	:rtype: None
") Contap_TheSegmentOfTheSearchOfContour;
		 Contap_TheSegmentOfTheSearchOfContour ();
		%feature("autodoc", "	:param A:
	:type A: Handle_Adaptor2d_HCurve2d &
	:rtype: None
") SetValue;
		void SetValue (const Handle_Adaptor2d_HCurve2d & A);
		%feature("autodoc", "	:param V:
	:type V: Contap_ThePathPointOfTheSearchOfContour &
	:param First:
	:type First: bool
	:rtype: None
") SetLimitPoint;
		void SetLimitPoint (const Contap_ThePathPointOfTheSearchOfContour & V,const Standard_Boolean First);
		%feature("autodoc", "	:rtype: Handle_Adaptor2d_HCurve2d
") Curve;
		const Handle_Adaptor2d_HCurve2d & Curve ();
		%feature("autodoc", "	:rtype: bool
") HasFirstPoint;
		Standard_Boolean HasFirstPoint ();
		%feature("autodoc", "	:rtype: Contap_ThePathPointOfTheSearchOfContour
") FirstPoint;
		const Contap_ThePathPointOfTheSearchOfContour & FirstPoint ();
		%feature("autodoc", "	:rtype: bool
") HasLastPoint;
		Standard_Boolean HasLastPoint ();
		%feature("autodoc", "	:rtype: Contap_ThePathPointOfTheSearchOfContour
") LastPoint;
		const Contap_ThePathPointOfTheSearchOfContour & LastPoint ();
};


%feature("shadow") Contap_TheSegmentOfTheSearchOfContour::~Contap_TheSegmentOfTheSearchOfContour %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Contap_TheSegmentOfTheSearchOfContour {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Contap_TheSequenceOfLineOfContour;
class Contap_TheSequenceOfLineOfContour : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") Contap_TheSequenceOfLineOfContour;
		 Contap_TheSequenceOfLineOfContour ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Contap_TheSequenceOfLineOfContour &
	:rtype: Contap_TheSequenceOfLineOfContour
") Assign;
		const Contap_TheSequenceOfLineOfContour & Assign (const Contap_TheSequenceOfLineOfContour & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Contap_TheSequenceOfLineOfContour &
	:rtype: Contap_TheSequenceOfLineOfContour
") operator=;
		const Contap_TheSequenceOfLineOfContour & operator = (const Contap_TheSequenceOfLineOfContour & Other);
		%feature("autodoc", "	:param T:
	:type T: Contap_TheLineOfContour &
	:rtype: None
") Append;
		void Append (const Contap_TheLineOfContour & T);
		%feature("autodoc", "	:param S:
	:type S: Contap_TheSequenceOfLineOfContour &
	:rtype: None
") Append;
		void Append (Contap_TheSequenceOfLineOfContour & S);
		%feature("autodoc", "	:param T:
	:type T: Contap_TheLineOfContour &
	:rtype: None
") Prepend;
		void Prepend (const Contap_TheLineOfContour & T);
		%feature("autodoc", "	:param S:
	:type S: Contap_TheSequenceOfLineOfContour &
	:rtype: None
") Prepend;
		void Prepend (Contap_TheSequenceOfLineOfContour & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Contap_TheLineOfContour &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Contap_TheLineOfContour & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Contap_TheSequenceOfLineOfContour &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Contap_TheSequenceOfLineOfContour & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Contap_TheLineOfContour &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Contap_TheLineOfContour & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Contap_TheSequenceOfLineOfContour &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Contap_TheSequenceOfLineOfContour & S);
		%feature("autodoc", "	:rtype: Contap_TheLineOfContour
") First;
		const Contap_TheLineOfContour & First ();
		%feature("autodoc", "	:rtype: Contap_TheLineOfContour
") Last;
		const Contap_TheLineOfContour & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Contap_TheSequenceOfLineOfContour &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Contap_TheSequenceOfLineOfContour & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Contap_TheLineOfContour
") Value;
		const Contap_TheLineOfContour & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Contap_TheLineOfContour &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Contap_TheLineOfContour & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Contap_TheLineOfContour
") ChangeValue;
		Contap_TheLineOfContour & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") Contap_TheSequenceOfLineOfContour::~Contap_TheSequenceOfLineOfContour %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Contap_TheSequenceOfLineOfContour {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Contap_TheSequenceOfPointOfContour;
class Contap_TheSequenceOfPointOfContour : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") Contap_TheSequenceOfPointOfContour;
		 Contap_TheSequenceOfPointOfContour ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Contap_TheSequenceOfPointOfContour &
	:rtype: Contap_TheSequenceOfPointOfContour
") Assign;
		const Contap_TheSequenceOfPointOfContour & Assign (const Contap_TheSequenceOfPointOfContour & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Contap_TheSequenceOfPointOfContour &
	:rtype: Contap_TheSequenceOfPointOfContour
") operator=;
		const Contap_TheSequenceOfPointOfContour & operator = (const Contap_TheSequenceOfPointOfContour & Other);
		%feature("autodoc", "	:param T:
	:type T: Contap_ThePointOfContour &
	:rtype: None
") Append;
		void Append (const Contap_ThePointOfContour & T);
		%feature("autodoc", "	:param S:
	:type S: Contap_TheSequenceOfPointOfContour &
	:rtype: None
") Append;
		void Append (Contap_TheSequenceOfPointOfContour & S);
		%feature("autodoc", "	:param T:
	:type T: Contap_ThePointOfContour &
	:rtype: None
") Prepend;
		void Prepend (const Contap_ThePointOfContour & T);
		%feature("autodoc", "	:param S:
	:type S: Contap_TheSequenceOfPointOfContour &
	:rtype: None
") Prepend;
		void Prepend (Contap_TheSequenceOfPointOfContour & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Contap_ThePointOfContour &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Contap_ThePointOfContour & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Contap_TheSequenceOfPointOfContour &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Contap_TheSequenceOfPointOfContour & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Contap_ThePointOfContour &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Contap_ThePointOfContour & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Contap_TheSequenceOfPointOfContour &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Contap_TheSequenceOfPointOfContour & S);
		%feature("autodoc", "	:rtype: Contap_ThePointOfContour
") First;
		const Contap_ThePointOfContour & First ();
		%feature("autodoc", "	:rtype: Contap_ThePointOfContour
") Last;
		const Contap_ThePointOfContour & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Contap_TheSequenceOfPointOfContour &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Contap_TheSequenceOfPointOfContour & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Contap_ThePointOfContour
") Value;
		const Contap_ThePointOfContour & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Contap_ThePointOfContour &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Contap_ThePointOfContour & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Contap_ThePointOfContour
") ChangeValue;
		Contap_ThePointOfContour & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") Contap_TheSequenceOfPointOfContour::~Contap_TheSequenceOfPointOfContour %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Contap_TheSequenceOfPointOfContour {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Contap_TheSurfFunctionOfContour;
class Contap_TheSurfFunctionOfContour : public math_FunctionSetWithDerivatives {
	public:
		%feature("autodoc", "	:rtype: None
") Contap_TheSurfFunctionOfContour;
		 Contap_TheSurfFunctionOfContour ();
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: None
") Set;
		void Set (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "	:param Eye:
	:type Eye: gp_Pnt
	:rtype: None
") Set;
		void Set (const gp_Pnt & Eye);
		%feature("autodoc", "	:param Dir:
	:type Dir: gp_Dir
	:rtype: None
") Set;
		void Set (const gp_Dir & Dir);
		%feature("autodoc", "	:param Dir:
	:type Dir: gp_Dir
	:param Angle:
	:type Angle: float
	:rtype: None
") Set;
		void Set (const gp_Dir & Dir,const Standard_Real Angle);
		%feature("autodoc", "	:param Eye:
	:type Eye: gp_Pnt
	:param Angle:
	:type Angle: float
	:rtype: None
") Set;
		void Set (const gp_Pnt & Eye,const Standard_Real Angle);
		%feature("autodoc", "	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Set;
		void Set (const Standard_Real Tolerance);
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
		%feature("autodoc", "	:rtype: float
") Root;
		Standard_Real Root ();
		%feature("autodoc", "	:rtype: float
") Tolerance;
		Standard_Real Tolerance ();
		%feature("autodoc", "	:rtype: gp_Pnt
") Point;
		const gp_Pnt & Point ();
		%feature("autodoc", "	:rtype: bool
") IsTangent;
		Standard_Boolean IsTangent ();
		%feature("autodoc", "	:rtype: gp_Vec
") Direction3d;
		const gp_Vec & Direction3d ();
		%feature("autodoc", "	:rtype: gp_Dir2d
") Direction2d;
		const gp_Dir2d & Direction2d ();
		%feature("autodoc", "	:rtype: Contap_TFunction
") FunctionType;
		Contap_TFunction FunctionType ();
		%feature("autodoc", "	:rtype: gp_Pnt
") Eye;
		const gp_Pnt & Eye ();
		%feature("autodoc", "	:rtype: gp_Dir
") Direction;
		const gp_Dir & Direction ();
		%feature("autodoc", "	:rtype: float
") Angle;
		Standard_Real Angle ();
		%feature("autodoc", "	:rtype: Handle_Adaptor3d_HSurface
") Surface;
		const Handle_Adaptor3d_HSurface & Surface ();
};


%feature("shadow") Contap_TheSurfFunctionOfContour::~Contap_TheSurfFunctionOfContour %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Contap_TheSurfFunctionOfContour {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Contap_TheSurfPropsOfContour;
class Contap_TheSurfPropsOfContour {
	public:
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:param N:
	:type N: gp_Vec
	:rtype: void
") Normale;
		static void Normale (const Handle_Adaptor3d_HSurface & S,const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & N);
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:param d1u:
	:type d1u: gp_Vec
	:param d1v:
	:type d1v: gp_Vec
	:param N:
	:type N: gp_Vec
	:rtype: void
") DerivAndNorm;
		static void DerivAndNorm (const Handle_Adaptor3d_HSurface & S,const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & d1u,gp_Vec & d1v,gp_Vec & N);
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:param N:
	:type N: gp_Vec
	:param Dnu:
	:type Dnu: gp_Vec
	:param Dnv:
	:type Dnv: gp_Vec
	:rtype: void
") NormAndDn;
		static void NormAndDn (const Handle_Adaptor3d_HSurface & S,const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & N,gp_Vec & Dnu,gp_Vec & Dnv);
};


%feature("shadow") Contap_TheSurfPropsOfContour::~Contap_TheSurfPropsOfContour %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Contap_TheSurfPropsOfContour {
	void _kill_pointed() {
		delete $self;
	}
};
