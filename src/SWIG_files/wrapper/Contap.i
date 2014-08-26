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
%module Contap

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

%include Contap_required_python_modules.i
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Contap_ContAna;
		 Contap_ContAna ();
		%feature("autodoc", "Args:
	S(gp_Sphere)
	D(gp_Dir)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Sphere & S,const gp_Dir & D);
		%feature("autodoc", "Args:
	S(gp_Sphere)
	D(gp_Dir)
	Ang(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Sphere & S,const gp_Dir & D,const Standard_Real Ang);
		%feature("autodoc", "Args:
	S(gp_Sphere)
	Eye(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Sphere & S,const gp_Pnt & Eye);
		%feature("autodoc", "Args:
	C(gp_Cylinder)
	D(gp_Dir)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Cylinder & C,const gp_Dir & D);
		%feature("autodoc", "Args:
	C(gp_Cylinder)
	D(gp_Dir)
	Ang(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Cylinder & C,const gp_Dir & D,const Standard_Real Ang);
		%feature("autodoc", "Args:
	C(gp_Cylinder)
	Eye(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Cylinder & C,const gp_Pnt & Eye);
		%feature("autodoc", "Args:
	C(gp_Cone)
	D(gp_Dir)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Cone & C,const gp_Dir & D);
		%feature("autodoc", "Args:
	C(gp_Cone)
	D(gp_Dir)
	Ang(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Cone & C,const gp_Dir & D,const Standard_Real Ang);
		%feature("autodoc", "Args:
	C(gp_Cone)
	Eye(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Cone & C,const gp_Pnt & Eye);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbContours;
		Standard_Integer NbContours ();
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_CurveType

Returns GeomAbs_Line or GeomAbs_Circle, when  
         IsDone() returns True.") TypeContour;
		GeomAbs_CurveType TypeContour ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Circ

No detailed docstring for this function.") Circle;
		gp_Circ Circle ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Lin

No detailed docstring for this function.") Line;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Contap_Contour;
		 Contap_Contour ();
		%feature("autodoc", "Args:
	Direction(gp_Vec)

Returns:
	None

No detailed docstring for this function.") Contap_Contour;
		 Contap_Contour (const gp_Vec & Direction);
		%feature("autodoc", "Args:
	Direction(gp_Vec)
	Angle(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Contap_Contour;
		 Contap_Contour (const gp_Vec & Direction,const Standard_Real Angle);
		%feature("autodoc", "Args:
	Eye(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Contap_Contour;
		 Contap_Contour (const gp_Pnt & Eye);
		%feature("autodoc", "Args:
	Surf(Handle_Adaptor3d_HSurface)
	Domain(Handle_Adaptor3d_TopolTool)
	Direction(gp_Vec)

Returns:
	None

No detailed docstring for this function.") Contap_Contour;
		 Contap_Contour (const Handle_Adaptor3d_HSurface & Surf,const Handle_Adaptor3d_TopolTool & Domain,const gp_Vec & Direction);
		%feature("autodoc", "Args:
	Surf(Handle_Adaptor3d_HSurface)
	Domain(Handle_Adaptor3d_TopolTool)
	Direction(gp_Vec)
	Angle(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Contap_Contour;
		 Contap_Contour (const Handle_Adaptor3d_HSurface & Surf,const Handle_Adaptor3d_TopolTool & Domain,const gp_Vec & Direction,const Standard_Real Angle);
		%feature("autodoc", "Args:
	Surf(Handle_Adaptor3d_HSurface)
	Domain(Handle_Adaptor3d_TopolTool)
	Eye(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Contap_Contour;
		 Contap_Contour (const Handle_Adaptor3d_HSurface & Surf,const Handle_Adaptor3d_TopolTool & Domain,const gp_Pnt & Eye);
		%feature("autodoc", "Args:
	Surf(Handle_Adaptor3d_HSurface)
	Domain(Handle_Adaptor3d_TopolTool)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const Handle_Adaptor3d_HSurface & Surf,const Handle_Adaptor3d_TopolTool & Domain);
		%feature("autodoc", "Args:
	Surf(Handle_Adaptor3d_HSurface)
	Domain(Handle_Adaptor3d_TopolTool)
	Direction(gp_Vec)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const Handle_Adaptor3d_HSurface & Surf,const Handle_Adaptor3d_TopolTool & Domain,const gp_Vec & Direction);
		%feature("autodoc", "Args:
	Surf(Handle_Adaptor3d_HSurface)
	Domain(Handle_Adaptor3d_TopolTool)
	Direction(gp_Vec)
	Angle(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const Handle_Adaptor3d_HSurface & Surf,const Handle_Adaptor3d_TopolTool & Domain,const gp_Vec & Direction,const Standard_Real Angle);
		%feature("autodoc", "Args:
	Surf(Handle_Adaptor3d_HSurface)
	Domain(Handle_Adaptor3d_TopolTool)
	Eye(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const Handle_Adaptor3d_HSurface & Surf,const Handle_Adaptor3d_TopolTool & Domain,const gp_Pnt & Eye);
		%feature("autodoc", "Args:
	Direction(gp_Vec)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const gp_Vec & Direction);
		%feature("autodoc", "Args:
	Direction(gp_Vec)
	Angle(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const gp_Vec & Direction,const Standard_Real Angle);
		%feature("autodoc", "Args:
	Eye(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const gp_Pnt & Eye);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbLines;
		Standard_Integer NbLines ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Contap_TheLineOfContour

No detailed docstring for this function.") Line;
		const Contap_TheLineOfContour & Line (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Contap_TheSurfFunctionOfContour

No detailed docstring for this function.") SurfaceFunction;
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
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)
	u1(Standard_Real)
	u2(Standard_Real)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbSamplesU;
		static Standard_Integer NbSamplesU (const Handle_Adaptor3d_HSurface & S,const Standard_Real u1,const Standard_Real u2);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)
	v1(Standard_Real)
	v2(Standard_Real)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbSamplesV;
		static Standard_Integer NbSamplesV (const Handle_Adaptor3d_HSurface & S,const Standard_Real v1,const Standard_Real v2);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbSamplePoints;
		static Standard_Integer NbSamplePoints (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)
	Index(Standard_Integer)
	U(Standard_Real)
	V(Standard_Real)

Returns:
	static void

No detailed docstring for this function.") SamplePoint;
		static void SamplePoint (const Handle_Adaptor3d_HSurface & S,const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") HasBeenSeen;
		static Standard_Boolean HasBeenSeen (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "Args:
	A(Handle_Adaptor2d_HCurve2d)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbSamplesOnArc;
		static Standard_Integer NbSamplesOnArc (const Handle_Adaptor2d_HCurve2d & A);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)
	Ufirst(Standard_Real)
	Ulast(Standard_Real)

Returns:
	static void

No detailed docstring for this function.") Bounds;
		static void Bounds (const Handle_Adaptor2d_HCurve2d & C,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)
	P(gp_Pnt2d)
	Paramproj(Standard_Real)
	Ptproj(gp_Pnt2d)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") Project;
		static Standard_Boolean Project (const Handle_Adaptor2d_HCurve2d & C,const gp_Pnt2d & P,Standard_Real &OutValue,gp_Pnt2d & Ptproj);
		%feature("autodoc", "Args:
	V(Handle_Adaptor3d_HVertex)
	C(Handle_Adaptor2d_HCurve2d)

Returns:
	static Standard_Real

No detailed docstring for this function.") Tolerance;
		static Standard_Real Tolerance (const Handle_Adaptor3d_HVertex & V,const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "Args:
	V(Handle_Adaptor3d_HVertex)
	C(Handle_Adaptor2d_HCurve2d)

Returns:
	static Standard_Real

No detailed docstring for this function.") Parameter;
		static Standard_Real Parameter (const Handle_Adaptor3d_HVertex & V,const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbPoints;
		static Standard_Integer NbPoints (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)
	Index(Standard_Integer)
	Pt(gp_Pnt)
	Tol(Standard_Real)
	U(Standard_Real)

Returns:
	static void

No detailed docstring for this function.") Value;
		static void Value (const Handle_Adaptor2d_HCurve2d & C,const Standard_Integer Index,gp_Pnt & Pt,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)
	Index(Standard_Integer)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsVertex;
		static Standard_Boolean IsVertex (const Handle_Adaptor2d_HCurve2d & C,const Standard_Integer Index);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)
	Index(Standard_Integer)
	V(Handle_Adaptor3d_HVertex)

Returns:
	static void

No detailed docstring for this function.") Vertex;
		static void Vertex (const Handle_Adaptor2d_HCurve2d & C,const Standard_Integer Index,Handle_Adaptor3d_HVertex & V);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbSegments;
		static Standard_Integer NbSegments (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)
	Index(Standard_Integer)
	IndFirst(Standard_Integer)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") HasFirstPoint;
		static Standard_Boolean HasFirstPoint (const Handle_Adaptor2d_HCurve2d & C,const Standard_Integer Index,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)
	Index(Standard_Integer)
	IndLast(Standard_Integer)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") HasLastPoint;
		static Standard_Boolean HasLastPoint (const Handle_Adaptor2d_HCurve2d & C,const Standard_Integer Index,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsAllSolution;
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
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)

Returns:
	static Standard_Real

No detailed docstring for this function.") FirstParameter;
		static Standard_Real FirstParameter (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)

Returns:
	static Standard_Real

No detailed docstring for this function.") LastParameter;
		static Standard_Real LastParameter (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)

Returns:
	static GeomAbs_Shape

No detailed docstring for this function.") Continuity;
		static GeomAbs_Shape Continuity (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)
	S(GeomAbs_Shape)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbIntervals;
		static Standard_Integer NbIntervals (const Handle_Adaptor2d_HCurve2d & C,const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)
	T(TColStd_Array1OfReal)
	S(GeomAbs_Shape)

Returns:
	static void

No detailed docstring for this function.") Intervals;
		static void Intervals (const Handle_Adaptor2d_HCurve2d & C,TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsClosed;
		static Standard_Boolean IsClosed (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsPeriodic;
		static Standard_Boolean IsPeriodic (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)

Returns:
	static Standard_Real

No detailed docstring for this function.") Period;
		static Standard_Real Period (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)
	U(Standard_Real)

Returns:
	static gp_Pnt2d

No detailed docstring for this function.") Value;
		static gp_Pnt2d Value (const Handle_Adaptor2d_HCurve2d & C,const Standard_Real U);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)
	U(Standard_Real)
	P(gp_Pnt2d)

Returns:
	static void

No detailed docstring for this function.") D0;
		static void D0 (const Handle_Adaptor2d_HCurve2d & C,const Standard_Real U,gp_Pnt2d & P);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)
	U(Standard_Real)
	P(gp_Pnt2d)
	V(gp_Vec2d)

Returns:
	static void

No detailed docstring for this function.") D1;
		static void D1 (const Handle_Adaptor2d_HCurve2d & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)
	U(Standard_Real)
	P(gp_Pnt2d)
	V1(gp_Vec2d)
	V2(gp_Vec2d)

Returns:
	static void

No detailed docstring for this function.") D2;
		static void D2 (const Handle_Adaptor2d_HCurve2d & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)
	U(Standard_Real)
	P(gp_Pnt2d)
	V1(gp_Vec2d)
	V2(gp_Vec2d)
	V3(gp_Vec2d)

Returns:
	static void

No detailed docstring for this function.") D3;
		static void D3 (const Handle_Adaptor2d_HCurve2d & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)
	U(Standard_Real)
	N(Standard_Integer)

Returns:
	static gp_Vec2d

No detailed docstring for this function.") DN;
		static gp_Vec2d DN (const Handle_Adaptor2d_HCurve2d & C,const Standard_Real U,const Standard_Integer N);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)
	R3d(Standard_Real)

Returns:
	static Standard_Real

No detailed docstring for this function.") Resolution;
		static Standard_Real Resolution (const Handle_Adaptor2d_HCurve2d & C,const Standard_Real R3d);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)

Returns:
	static GeomAbs_CurveType

No detailed docstring for this function.") GetType;
		static GeomAbs_CurveType GetType (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)

Returns:
	static gp_Lin2d

No detailed docstring for this function.") Line;
		static gp_Lin2d Line (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)

Returns:
	static gp_Circ2d

No detailed docstring for this function.") Circle;
		static gp_Circ2d Circle (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)

Returns:
	static gp_Elips2d

No detailed docstring for this function.") Ellipse;
		static gp_Elips2d Ellipse (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)

Returns:
	static gp_Hypr2d

No detailed docstring for this function.") Hyperbola;
		static gp_Hypr2d Hyperbola (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)

Returns:
	static gp_Parab2d

No detailed docstring for this function.") Parabola;
		static gp_Parab2d Parabola (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)

Returns:
	static Handle_Geom2d_BezierCurve

No detailed docstring for this function.") Bezier;
		static Handle_Geom2d_BezierCurve Bezier (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)

Returns:
	static Handle_Geom2d_BSplineCurve

No detailed docstring for this function.") BSpline;
		static Handle_Geom2d_BSplineCurve BSpline (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)
	U0(Standard_Real)
	U1(Standard_Real)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbSamples;
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
		%feature("autodoc", "Args:
	I(Handle_Contap_TheIWLineOfTheIWalkingOfContour)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Contap_SequenceNodeOfSequenceOfIWLineOfTheIWalkingOfContour;
		 Contap_SequenceNodeOfSequenceOfIWLineOfTheIWalkingOfContour (const Handle_Contap_TheIWLineOfTheIWalkingOfContour & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Contap_TheIWLineOfTheIWalkingOfContour

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	I(Contap_ThePathPointOfTheSearchOfContour)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Contap_SequenceNodeOfSequenceOfPathPointOfTheSearchOfContour;
		 Contap_SequenceNodeOfSequenceOfPathPointOfTheSearchOfContour (const Contap_ThePathPointOfTheSearchOfContour & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Contap_ThePathPointOfTheSearchOfContour

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	I(Contap_TheSegmentOfTheSearchOfContour)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Contap_SequenceNodeOfSequenceOfSegmentOfTheSearchOfContour;
		 Contap_SequenceNodeOfSequenceOfSegmentOfTheSearchOfContour (const Contap_TheSegmentOfTheSearchOfContour & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Contap_TheSegmentOfTheSearchOfContour

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	I(Contap_TheLineOfContour)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Contap_SequenceNodeOfTheSequenceOfLineOfContour;
		 Contap_SequenceNodeOfTheSequenceOfLineOfContour (const Contap_TheLineOfContour & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Contap_TheLineOfContour

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	I(Contap_ThePointOfContour)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Contap_SequenceNodeOfTheSequenceOfPointOfContour;
		 Contap_SequenceNodeOfTheSequenceOfPointOfContour (const Contap_ThePointOfContour & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Contap_ThePointOfContour

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Contap_SequenceOfIWLineOfTheIWalkingOfContour;
		 Contap_SequenceOfIWLineOfTheIWalkingOfContour ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Contap_SequenceOfIWLineOfTheIWalkingOfContour)

Returns:
	Contap_SequenceOfIWLineOfTheIWalkingOfContour

No detailed docstring for this function.") Assign;
		const Contap_SequenceOfIWLineOfTheIWalkingOfContour & Assign (const Contap_SequenceOfIWLineOfTheIWalkingOfContour & Other);
		%feature("autodoc", "Args:
	Other(Contap_SequenceOfIWLineOfTheIWalkingOfContour)

Returns:
	Contap_SequenceOfIWLineOfTheIWalkingOfContour

No detailed docstring for this function.") operator=;
		const Contap_SequenceOfIWLineOfTheIWalkingOfContour & operator = (const Contap_SequenceOfIWLineOfTheIWalkingOfContour & Other);
		%feature("autodoc", "Args:
	T(Handle_Contap_TheIWLineOfTheIWalkingOfContour)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Contap_TheIWLineOfTheIWalkingOfContour & T);
		%feature("autodoc", "Args:
	S(Contap_SequenceOfIWLineOfTheIWalkingOfContour)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Contap_SequenceOfIWLineOfTheIWalkingOfContour & S);
		%feature("autodoc", "Args:
	T(Handle_Contap_TheIWLineOfTheIWalkingOfContour)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Contap_TheIWLineOfTheIWalkingOfContour & T);
		%feature("autodoc", "Args:
	S(Contap_SequenceOfIWLineOfTheIWalkingOfContour)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Contap_SequenceOfIWLineOfTheIWalkingOfContour & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Contap_TheIWLineOfTheIWalkingOfContour)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Contap_TheIWLineOfTheIWalkingOfContour & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Contap_SequenceOfIWLineOfTheIWalkingOfContour)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Contap_SequenceOfIWLineOfTheIWalkingOfContour & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Contap_TheIWLineOfTheIWalkingOfContour)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Contap_TheIWLineOfTheIWalkingOfContour & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Contap_SequenceOfIWLineOfTheIWalkingOfContour)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Contap_SequenceOfIWLineOfTheIWalkingOfContour & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Contap_TheIWLineOfTheIWalkingOfContour

No detailed docstring for this function.") First;
		const Handle_Contap_TheIWLineOfTheIWalkingOfContour & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Contap_TheIWLineOfTheIWalkingOfContour

No detailed docstring for this function.") Last;
		const Handle_Contap_TheIWLineOfTheIWalkingOfContour & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Contap_SequenceOfIWLineOfTheIWalkingOfContour)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Contap_SequenceOfIWLineOfTheIWalkingOfContour & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Contap_TheIWLineOfTheIWalkingOfContour

No detailed docstring for this function.") Value;
		const Handle_Contap_TheIWLineOfTheIWalkingOfContour & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_Contap_TheIWLineOfTheIWalkingOfContour)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Contap_TheIWLineOfTheIWalkingOfContour & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Contap_TheIWLineOfTheIWalkingOfContour

No detailed docstring for this function.") ChangeValue;
		Handle_Contap_TheIWLineOfTheIWalkingOfContour & ChangeValue (const Standard_Integer Index);
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Contap_SequenceOfPathPointOfTheSearchOfContour;
		 Contap_SequenceOfPathPointOfTheSearchOfContour ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Contap_SequenceOfPathPointOfTheSearchOfContour)

Returns:
	Contap_SequenceOfPathPointOfTheSearchOfContour

No detailed docstring for this function.") Assign;
		const Contap_SequenceOfPathPointOfTheSearchOfContour & Assign (const Contap_SequenceOfPathPointOfTheSearchOfContour & Other);
		%feature("autodoc", "Args:
	Other(Contap_SequenceOfPathPointOfTheSearchOfContour)

Returns:
	Contap_SequenceOfPathPointOfTheSearchOfContour

No detailed docstring for this function.") operator=;
		const Contap_SequenceOfPathPointOfTheSearchOfContour & operator = (const Contap_SequenceOfPathPointOfTheSearchOfContour & Other);
		%feature("autodoc", "Args:
	T(Contap_ThePathPointOfTheSearchOfContour)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Contap_ThePathPointOfTheSearchOfContour & T);
		%feature("autodoc", "Args:
	S(Contap_SequenceOfPathPointOfTheSearchOfContour)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Contap_SequenceOfPathPointOfTheSearchOfContour & S);
		%feature("autodoc", "Args:
	T(Contap_ThePathPointOfTheSearchOfContour)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Contap_ThePathPointOfTheSearchOfContour & T);
		%feature("autodoc", "Args:
	S(Contap_SequenceOfPathPointOfTheSearchOfContour)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Contap_SequenceOfPathPointOfTheSearchOfContour & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Contap_ThePathPointOfTheSearchOfContour)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Contap_ThePathPointOfTheSearchOfContour & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Contap_SequenceOfPathPointOfTheSearchOfContour)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Contap_SequenceOfPathPointOfTheSearchOfContour & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Contap_ThePathPointOfTheSearchOfContour)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Contap_ThePathPointOfTheSearchOfContour & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Contap_SequenceOfPathPointOfTheSearchOfContour)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Contap_SequenceOfPathPointOfTheSearchOfContour & S);
		%feature("autodoc", "Args:
	None
Returns:
	Contap_ThePathPointOfTheSearchOfContour

No detailed docstring for this function.") First;
		const Contap_ThePathPointOfTheSearchOfContour & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Contap_ThePathPointOfTheSearchOfContour

No detailed docstring for this function.") Last;
		const Contap_ThePathPointOfTheSearchOfContour & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Contap_SequenceOfPathPointOfTheSearchOfContour)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Contap_SequenceOfPathPointOfTheSearchOfContour & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Contap_ThePathPointOfTheSearchOfContour

No detailed docstring for this function.") Value;
		const Contap_ThePathPointOfTheSearchOfContour & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Contap_ThePathPointOfTheSearchOfContour)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Contap_ThePathPointOfTheSearchOfContour & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Contap_ThePathPointOfTheSearchOfContour

No detailed docstring for this function.") ChangeValue;
		Contap_ThePathPointOfTheSearchOfContour & ChangeValue (const Standard_Integer Index);
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Contap_SequenceOfSegmentOfTheSearchOfContour;
		 Contap_SequenceOfSegmentOfTheSearchOfContour ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Contap_SequenceOfSegmentOfTheSearchOfContour)

Returns:
	Contap_SequenceOfSegmentOfTheSearchOfContour

No detailed docstring for this function.") Assign;
		const Contap_SequenceOfSegmentOfTheSearchOfContour & Assign (const Contap_SequenceOfSegmentOfTheSearchOfContour & Other);
		%feature("autodoc", "Args:
	Other(Contap_SequenceOfSegmentOfTheSearchOfContour)

Returns:
	Contap_SequenceOfSegmentOfTheSearchOfContour

No detailed docstring for this function.") operator=;
		const Contap_SequenceOfSegmentOfTheSearchOfContour & operator = (const Contap_SequenceOfSegmentOfTheSearchOfContour & Other);
		%feature("autodoc", "Args:
	T(Contap_TheSegmentOfTheSearchOfContour)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Contap_TheSegmentOfTheSearchOfContour & T);
		%feature("autodoc", "Args:
	S(Contap_SequenceOfSegmentOfTheSearchOfContour)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Contap_SequenceOfSegmentOfTheSearchOfContour & S);
		%feature("autodoc", "Args:
	T(Contap_TheSegmentOfTheSearchOfContour)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Contap_TheSegmentOfTheSearchOfContour & T);
		%feature("autodoc", "Args:
	S(Contap_SequenceOfSegmentOfTheSearchOfContour)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Contap_SequenceOfSegmentOfTheSearchOfContour & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Contap_TheSegmentOfTheSearchOfContour)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Contap_TheSegmentOfTheSearchOfContour & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Contap_SequenceOfSegmentOfTheSearchOfContour)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Contap_SequenceOfSegmentOfTheSearchOfContour & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Contap_TheSegmentOfTheSearchOfContour)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Contap_TheSegmentOfTheSearchOfContour & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Contap_SequenceOfSegmentOfTheSearchOfContour)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Contap_SequenceOfSegmentOfTheSearchOfContour & S);
		%feature("autodoc", "Args:
	None
Returns:
	Contap_TheSegmentOfTheSearchOfContour

No detailed docstring for this function.") First;
		const Contap_TheSegmentOfTheSearchOfContour & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Contap_TheSegmentOfTheSearchOfContour

No detailed docstring for this function.") Last;
		const Contap_TheSegmentOfTheSearchOfContour & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Contap_SequenceOfSegmentOfTheSearchOfContour)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Contap_SequenceOfSegmentOfTheSearchOfContour & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Contap_TheSegmentOfTheSearchOfContour

No detailed docstring for this function.") Value;
		const Contap_TheSegmentOfTheSearchOfContour & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Contap_TheSegmentOfTheSearchOfContour)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Contap_TheSegmentOfTheSearchOfContour & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Contap_TheSegmentOfTheSearchOfContour

No detailed docstring for this function.") ChangeValue;
		Contap_TheSegmentOfTheSearchOfContour & ChangeValue (const Standard_Integer Index);
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Contap_TheArcFunctionOfContour;
		 Contap_TheArcFunctionOfContour ();
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "Args:
	Direction(gp_Dir)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const gp_Dir & Direction);
		%feature("autodoc", "Args:
	Direction(gp_Dir)
	Angle(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const gp_Dir & Direction,const Standard_Real Angle);
		%feature("autodoc", "Args:
	Eye(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const gp_Pnt & Eye);
		%feature("autodoc", "Args:
	Eye(gp_Pnt)
	Angle(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const gp_Pnt & Eye,const Standard_Real Angle);
		%feature("autodoc", "Args:
	A(Handle_Adaptor2d_HCurve2d)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const Handle_Adaptor2d_HCurve2d & A);
		%feature("autodoc", "Args:
	X(Standard_Real)
	F(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Value;
		Standard_Boolean Value (const Standard_Real X,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	X(Standard_Real)
	D(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Derivative;
		Standard_Boolean Derivative (const Standard_Real X,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	X(Standard_Real)
	F(Standard_Real)
	D(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Values;
		Standard_Boolean Values (const Standard_Real X,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbSamples;
		Standard_Integer NbSamples ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

No detailed docstring for this function.") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Pnt

No detailed docstring for this function.") Valpoint;
		const gp_Pnt & Valpoint (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	IntSurf_Quadric

No detailed docstring for this function.") Quadric;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Contap_TheHSequenceOfPointOfContour;
		 Contap_TheHSequenceOfPointOfContour ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	anItem(Contap_ThePointOfContour)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Contap_ThePointOfContour & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_Contap_TheHSequenceOfPointOfContour)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Contap_TheHSequenceOfPointOfContour & aSequence);
		%feature("autodoc", "Args:
	anItem(Contap_ThePointOfContour)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Contap_ThePointOfContour & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_Contap_TheHSequenceOfPointOfContour)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Contap_TheHSequenceOfPointOfContour & aSequence);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Contap_ThePointOfContour)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Contap_ThePointOfContour & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_Contap_TheHSequenceOfPointOfContour)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Contap_TheHSequenceOfPointOfContour & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Contap_ThePointOfContour)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Contap_ThePointOfContour & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_Contap_TheHSequenceOfPointOfContour)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Contap_TheHSequenceOfPointOfContour & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anOtherIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Contap_TheHSequenceOfPointOfContour

No detailed docstring for this function.") Split;
		Handle_Contap_TheHSequenceOfPointOfContour Split (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Contap_ThePointOfContour)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer anIndex,const Contap_ThePointOfContour & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Contap_ThePointOfContour

No detailed docstring for this function.") Value;
		const Contap_ThePointOfContour & Value (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Contap_ThePointOfContour

No detailed docstring for this function.") ChangeValue;
		Contap_ThePointOfContour & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	fromIndex(Standard_Integer)
	toIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "Args:
	None
Returns:
	Contap_TheSequenceOfPointOfContour

No detailed docstring for this function.") Sequence;
		const Contap_TheSequenceOfPointOfContour & Sequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Contap_TheSequenceOfPointOfContour

No detailed docstring for this function.") ChangeSequence;
		Contap_TheSequenceOfPointOfContour & ChangeSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Contap_TheHSequenceOfPointOfContour

No detailed docstring for this function.") ShallowCopy;
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
		%feature("autodoc", "Args:
	theAllocator(IntSurf_Allocator)=0

Returns:
	None

No detailed docstring for this function.") Contap_TheIWLineOfTheIWalkingOfContour;
		 Contap_TheIWLineOfTheIWalkingOfContour (const IntSurf_Allocator & theAllocator = 0);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Cut;
		void Cut (const Standard_Integer Index);
		%feature("autodoc", "Args:
	P(IntSurf_PntOn2S)

Returns:
	None

No detailed docstring for this function.") AddPoint;
		void AddPoint (const IntSurf_PntOn2S & P);
		%feature("autodoc", "Args:
	Closed(Standard_Boolean)
	HasFirst(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") AddStatusFirst;
		void AddStatusFirst (const Standard_Boolean Closed,const Standard_Boolean HasFirst);
		%feature("autodoc", "Args:
	Closed(Standard_Boolean)
	HasLast(Standard_Boolean)
	Index(Standard_Integer)
	P(IntSurf_PathPoint)

Returns:
	None

No detailed docstring for this function.") AddStatusFirst;
		void AddStatusFirst (const Standard_Boolean Closed,const Standard_Boolean HasLast,const Standard_Integer Index,const IntSurf_PathPoint & P);
		%feature("autodoc", "Args:
	Closed(Standard_Boolean)
	HasFirst(Standard_Boolean)
	HasLast(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") AddStatusFirstLast;
		void AddStatusFirstLast (const Standard_Boolean Closed,const Standard_Boolean HasFirst,const Standard_Boolean HasLast);
		%feature("autodoc", "Args:
	HasLast(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") AddStatusLast;
		void AddStatusLast (const Standard_Boolean HasLast);
		%feature("autodoc", "Args:
	HasLast(Standard_Boolean)
	Index(Standard_Integer)
	P(IntSurf_PathPoint)

Returns:
	None

No detailed docstring for this function.") AddStatusLast;
		void AddStatusLast (const Standard_Boolean HasLast,const Standard_Integer Index,const IntSurf_PathPoint & P);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") AddIndexPassing;
		void AddIndexPassing (const Standard_Integer Index);
		%feature("autodoc", "Args:
	V(gp_Vec)
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetTangentVector;
		void SetTangentVector (const gp_Vec & V,const Standard_Integer Index);
		%feature("autodoc", "Args:
	IsTangent(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetTangencyAtBegining;
		void SetTangencyAtBegining (const Standard_Boolean IsTangent);
		%feature("autodoc", "Args:
	IsTangent(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetTangencyAtEnd;
		void SetTangencyAtEnd (const Standard_Boolean IsTangent);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbPoints;
		Standard_Integer NbPoints ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	IntSurf_PntOn2S

No detailed docstring for this function.") Value;
		const IntSurf_PntOn2S & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IntSurf_LineOn2S

No detailed docstring for this function.") Line;
		const Handle_IntSurf_LineOn2S & Line ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsClosed;
		Standard_Boolean IsClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") HasFirstPoint;
		Standard_Boolean HasFirstPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") HasLastPoint;
		Standard_Boolean HasLastPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	IntSurf_PathPoint

No detailed docstring for this function.") FirstPoint;
		const IntSurf_PathPoint & FirstPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") FirstPointIndex;
		Standard_Integer FirstPointIndex ();
		%feature("autodoc", "Args:
	None
Returns:
	IntSurf_PathPoint

No detailed docstring for this function.") LastPoint;
		const IntSurf_PathPoint & LastPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LastPointIndex;
		Standard_Integer LastPointIndex ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbPassingPoint;
		Standard_Integer NbPassingPoint ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	IndexLine(Standard_Integer)
	IndexPnts(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") PassingPoint;
		void PassingPoint (const Standard_Integer Index,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Vec

No detailed docstring for this function.") TangentVector;
		const gp_Vec & TangentVector (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsTangentAtBegining;
		Standard_Boolean IsTangentAtBegining ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsTangentAtEnd;
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
		%feature("autodoc", "Args:
	Epsilon(Standard_Real)
	Deflection(Standard_Real)
	Step(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Contap_TheIWalkingOfContour;
		 Contap_TheIWalkingOfContour (const Standard_Real Epsilon,const Standard_Real Deflection,const Standard_Real Step);
		%feature("autodoc", "Args:
	Epsilon(Standard_Real)
	Deflection(Standard_Real)
	Step(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetTolerance;
		void SetTolerance (const Standard_Real Epsilon,const Standard_Real Deflection,const Standard_Real Step);
		%feature("autodoc", "Args:
	Pnts1(IntSurf_SequenceOfPathPoint)
	Pnts2(IntSurf_SequenceOfInteriorPoint)
	Func(Contap_TheSurfFunctionOfContour)
	S(Handle_Adaptor3d_HSurface)
	Reversed(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const IntSurf_SequenceOfPathPoint & Pnts1,const IntSurf_SequenceOfInteriorPoint & Pnts2,Contap_TheSurfFunctionOfContour & Func,const Handle_Adaptor3d_HSurface & S,const Standard_Boolean Reversed = Standard_False);
		%feature("autodoc", "Args:
	Pnts1(IntSurf_SequenceOfPathPoint)
	Func(Contap_TheSurfFunctionOfContour)
	S(Handle_Adaptor3d_HSurface)
	Reversed(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const IntSurf_SequenceOfPathPoint & Pnts1,Contap_TheSurfFunctionOfContour & Func,const Handle_Adaptor3d_HSurface & S,const Standard_Boolean Reversed = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbLines;
		Standard_Integer NbLines ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Contap_TheIWLineOfTheIWalkingOfContour

No detailed docstring for this function.") Value;
		const Handle_Contap_TheIWLineOfTheIWalkingOfContour & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbSinglePnts;
		Standard_Integer NbSinglePnts ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	IntSurf_PathPoint

No detailed docstring for this function.") SinglePnt;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Contap_TheLineOfContour;
		 Contap_TheLineOfContour ();
		%feature("autodoc", "Args:
	L(Handle_IntSurf_LineOn2S)

Returns:
	None

No detailed docstring for this function.") SetLineOn2S;
		void SetLineOn2S (const Handle_IntSurf_LineOn2S & L);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IntSurf_LineOn2S

No detailed docstring for this function.") LineOn2S;
		const Handle_IntSurf_LineOn2S & LineOn2S ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ResetSeqOfVertex;
		void ResetSeqOfVertex ();
		%feature("autodoc", "Args:
	P(IntSurf_PntOn2S)

Returns:
	None

No detailed docstring for this function.") Add;
		void Add (const IntSurf_PntOn2S & P);
		%feature("autodoc", "Args:
	L(gp_Lin)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const gp_Lin & L);
		%feature("autodoc", "Args:
	C(gp_Circ)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const gp_Circ & C);
		%feature("autodoc", "Args:
	A(Handle_Adaptor2d_HCurve2d)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Handle_Adaptor2d_HCurve2d & A);
		%feature("autodoc", "Args:
	P(Contap_ThePointOfContour)

Returns:
	None

No detailed docstring for this function.") Add;
		void Add (const Contap_ThePointOfContour & P);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbVertex;
		Standard_Integer NbVertex ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Contap_ThePointOfContour

No detailed docstring for this function.") Vertex;
		Contap_ThePointOfContour & Vertex (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Contap_IType

No detailed docstring for this function.") TypeContour;
		Contap_IType TypeContour ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbPnts;
		Standard_Integer NbPnts ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	IntSurf_PntOn2S

No detailed docstring for this function.") Point;
		const IntSurf_PntOn2S & Point (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Lin

No detailed docstring for this function.") Line;
		gp_Lin Line ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Circ

No detailed docstring for this function.") Circle;
		gp_Circ Circle ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Adaptor2d_HCurve2d

No detailed docstring for this function.") Arc;
		const Handle_Adaptor2d_HCurve2d & Arc ();
		%feature("autodoc", "Args:
	T(IntSurf_TypeTrans)

Returns:
	None

No detailed docstring for this function.") SetTransitionOnS;
		void SetTransitionOnS (const IntSurf_TypeTrans T);
		%feature("autodoc", "Args:
	None
Returns:
	IntSurf_TypeTrans

No detailed docstring for this function.") TransitionOnS;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Contap_ThePathPointOfTheSearchOfContour;
		 Contap_ThePathPointOfTheSearchOfContour ();
		%feature("autodoc", "Args:
	P(gp_Pnt)
	Tol(Standard_Real)
	V(Handle_Adaptor3d_HVertex)
	A(Handle_Adaptor2d_HCurve2d)
	Parameter(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Contap_ThePathPointOfTheSearchOfContour;
		 Contap_ThePathPointOfTheSearchOfContour (const gp_Pnt & P,const Standard_Real Tol,const Handle_Adaptor3d_HVertex & V,const Handle_Adaptor2d_HCurve2d & A,const Standard_Real Parameter);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	Tol(Standard_Real)
	A(Handle_Adaptor2d_HCurve2d)
	Parameter(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Contap_ThePathPointOfTheSearchOfContour;
		 Contap_ThePathPointOfTheSearchOfContour (const gp_Pnt & P,const Standard_Real Tol,const Handle_Adaptor2d_HCurve2d & A,const Standard_Real Parameter);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	Tol(Standard_Real)
	V(Handle_Adaptor3d_HVertex)
	A(Handle_Adaptor2d_HCurve2d)
	Parameter(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const gp_Pnt & P,const Standard_Real Tol,const Handle_Adaptor3d_HVertex & V,const Handle_Adaptor2d_HCurve2d & A,const Standard_Real Parameter);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	Tol(Standard_Real)
	A(Handle_Adaptor2d_HCurve2d)
	Parameter(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const gp_Pnt & P,const Standard_Real Tol,const Handle_Adaptor2d_HCurve2d & A,const Standard_Real Parameter);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

No detailed docstring for this function.") Value;
		const gp_Pnt & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Tolerance;
		Standard_Real Tolerance ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsNew;
		Standard_Boolean IsNew ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Adaptor3d_HVertex

No detailed docstring for this function.") Vertex;
		const Handle_Adaptor3d_HVertex & Vertex ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Adaptor2d_HCurve2d

No detailed docstring for this function.") Arc;
		const Handle_Adaptor2d_HCurve2d & Arc ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Parameter;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Contap_ThePointOfContour;
		 Contap_ThePointOfContour ();
		%feature("autodoc", "Args:
	Pt(gp_Pnt)
	U(Standard_Real)
	V(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Contap_ThePointOfContour;
		 Contap_ThePointOfContour (const gp_Pnt & Pt,const Standard_Real U,const Standard_Real V);
		%feature("autodoc", "Args:
	Pt(gp_Pnt)
	U(Standard_Real)
	V(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const gp_Pnt & Pt,const Standard_Real U,const Standard_Real V);
		%feature("autodoc", "Args:
	Para(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetParameter;
		void SetParameter (const Standard_Real Para);
		%feature("autodoc", "Args:
	V(Handle_Adaptor3d_HVertex)

Returns:
	None

No detailed docstring for this function.") SetVertex;
		void SetVertex (const Handle_Adaptor3d_HVertex & V);
		%feature("autodoc", "Args:
	A(Handle_Adaptor2d_HCurve2d)
	Param(Standard_Real)
	TLine(IntSurf_Transition)
	TArc(IntSurf_Transition)

Returns:
	None

No detailed docstring for this function.") SetArc;
		void SetArc (const Handle_Adaptor2d_HCurve2d & A,const Standard_Real Param,const IntSurf_Transition & TLine,const IntSurf_Transition & TArc);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") SetMultiple;
		void SetMultiple ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") SetInternal;
		void SetInternal ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

No detailed docstring for this function.") Value;
		const gp_Pnt & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") ParameterOnLine;
		Standard_Real ParameterOnLine ();
		%feature("autodoc", "Args:
	U1(Standard_Real)
	V1(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Parameters;
		void Parameters (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsOnArc;
		Standard_Boolean IsOnArc ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Adaptor2d_HCurve2d

No detailed docstring for this function.") Arc;
		const Handle_Adaptor2d_HCurve2d & Arc ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") ParameterOnArc;
		Standard_Real ParameterOnArc ();
		%feature("autodoc", "Args:
	None
Returns:
	IntSurf_Transition

No detailed docstring for this function.") TransitionOnLine;
		const IntSurf_Transition & TransitionOnLine ();
		%feature("autodoc", "Args:
	None
Returns:
	IntSurf_Transition

No detailed docstring for this function.") TransitionOnArc;
		const IntSurf_Transition & TransitionOnArc ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsVertex;
		Standard_Boolean IsVertex ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Adaptor3d_HVertex

No detailed docstring for this function.") Vertex;
		const Handle_Adaptor3d_HVertex & Vertex ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsMultiple;
		Standard_Boolean IsMultiple ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsInternal;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Contap_TheSearchInsideOfContour;
		 Contap_TheSearchInsideOfContour ();
		%feature("autodoc", "Args:
	F(Contap_TheSurfFunctionOfContour)
	Surf(Handle_Adaptor3d_HSurface)
	T(Handle_Adaptor3d_TopolTool)
	Epsilon(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Contap_TheSearchInsideOfContour;
		 Contap_TheSearchInsideOfContour (Contap_TheSurfFunctionOfContour & F,const Handle_Adaptor3d_HSurface & Surf,const Handle_Adaptor3d_TopolTool & T,const Standard_Real Epsilon);
		%feature("autodoc", "Args:
	F(Contap_TheSurfFunctionOfContour)
	Surf(Handle_Adaptor3d_HSurface)
	T(Handle_Adaptor3d_TopolTool)
	Epsilon(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (Contap_TheSurfFunctionOfContour & F,const Handle_Adaptor3d_HSurface & Surf,const Handle_Adaptor3d_TopolTool & T,const Standard_Real Epsilon);
		%feature("autodoc", "Args:
	F(Contap_TheSurfFunctionOfContour)
	Surf(Handle_Adaptor3d_HSurface)
	UStart(Standard_Real)
	VStart(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (Contap_TheSurfFunctionOfContour & F,const Handle_Adaptor3d_HSurface & Surf,const Standard_Real UStart,const Standard_Real VStart);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbPoints;
		Standard_Integer NbPoints ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	IntSurf_InteriorPoint

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Contap_TheSearchOfContour;
		 Contap_TheSearchOfContour ();
		%feature("autodoc", "Args:
	F(Contap_TheArcFunctionOfContour)
	Domain(Handle_Adaptor3d_TopolTool)
	TolBoundary(Standard_Real)
	TolTangency(Standard_Real)
	RecheckOnRegularity(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (Contap_TheArcFunctionOfContour & F,const Handle_Adaptor3d_TopolTool & Domain,const Standard_Real TolBoundary,const Standard_Real TolTangency,const Standard_Boolean RecheckOnRegularity = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") AllArcSolution;
		Standard_Boolean AllArcSolution ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbPoints;
		Standard_Integer NbPoints ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Contap_ThePathPointOfTheSearchOfContour

No detailed docstring for this function.") Point;
		const Contap_ThePathPointOfTheSearchOfContour & Point (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbSegments;
		Standard_Integer NbSegments ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Contap_TheSegmentOfTheSearchOfContour

No detailed docstring for this function.") Segment;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Contap_TheSegmentOfTheSearchOfContour;
		 Contap_TheSegmentOfTheSearchOfContour ();
		%feature("autodoc", "Args:
	A(Handle_Adaptor2d_HCurve2d)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Handle_Adaptor2d_HCurve2d & A);
		%feature("autodoc", "Args:
	V(Contap_ThePathPointOfTheSearchOfContour)
	First(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetLimitPoint;
		void SetLimitPoint (const Contap_ThePathPointOfTheSearchOfContour & V,const Standard_Boolean First);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Adaptor2d_HCurve2d

No detailed docstring for this function.") Curve;
		const Handle_Adaptor2d_HCurve2d & Curve ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") HasFirstPoint;
		Standard_Boolean HasFirstPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	Contap_ThePathPointOfTheSearchOfContour

No detailed docstring for this function.") FirstPoint;
		const Contap_ThePathPointOfTheSearchOfContour & FirstPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") HasLastPoint;
		Standard_Boolean HasLastPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	Contap_ThePathPointOfTheSearchOfContour

No detailed docstring for this function.") LastPoint;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Contap_TheSequenceOfLineOfContour;
		 Contap_TheSequenceOfLineOfContour ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Contap_TheSequenceOfLineOfContour)

Returns:
	Contap_TheSequenceOfLineOfContour

No detailed docstring for this function.") Assign;
		const Contap_TheSequenceOfLineOfContour & Assign (const Contap_TheSequenceOfLineOfContour & Other);
		%feature("autodoc", "Args:
	Other(Contap_TheSequenceOfLineOfContour)

Returns:
	Contap_TheSequenceOfLineOfContour

No detailed docstring for this function.") operator=;
		const Contap_TheSequenceOfLineOfContour & operator = (const Contap_TheSequenceOfLineOfContour & Other);
		%feature("autodoc", "Args:
	T(Contap_TheLineOfContour)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Contap_TheLineOfContour & T);
		%feature("autodoc", "Args:
	S(Contap_TheSequenceOfLineOfContour)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Contap_TheSequenceOfLineOfContour & S);
		%feature("autodoc", "Args:
	T(Contap_TheLineOfContour)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Contap_TheLineOfContour & T);
		%feature("autodoc", "Args:
	S(Contap_TheSequenceOfLineOfContour)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Contap_TheSequenceOfLineOfContour & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Contap_TheLineOfContour)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Contap_TheLineOfContour & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Contap_TheSequenceOfLineOfContour)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Contap_TheSequenceOfLineOfContour & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Contap_TheLineOfContour)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Contap_TheLineOfContour & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Contap_TheSequenceOfLineOfContour)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Contap_TheSequenceOfLineOfContour & S);
		%feature("autodoc", "Args:
	None
Returns:
	Contap_TheLineOfContour

No detailed docstring for this function.") First;
		const Contap_TheLineOfContour & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Contap_TheLineOfContour

No detailed docstring for this function.") Last;
		const Contap_TheLineOfContour & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Contap_TheSequenceOfLineOfContour)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Contap_TheSequenceOfLineOfContour & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Contap_TheLineOfContour

No detailed docstring for this function.") Value;
		const Contap_TheLineOfContour & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Contap_TheLineOfContour)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Contap_TheLineOfContour & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Contap_TheLineOfContour

No detailed docstring for this function.") ChangeValue;
		Contap_TheLineOfContour & ChangeValue (const Standard_Integer Index);
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Contap_TheSequenceOfPointOfContour;
		 Contap_TheSequenceOfPointOfContour ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Contap_TheSequenceOfPointOfContour)

Returns:
	Contap_TheSequenceOfPointOfContour

No detailed docstring for this function.") Assign;
		const Contap_TheSequenceOfPointOfContour & Assign (const Contap_TheSequenceOfPointOfContour & Other);
		%feature("autodoc", "Args:
	Other(Contap_TheSequenceOfPointOfContour)

Returns:
	Contap_TheSequenceOfPointOfContour

No detailed docstring for this function.") operator=;
		const Contap_TheSequenceOfPointOfContour & operator = (const Contap_TheSequenceOfPointOfContour & Other);
		%feature("autodoc", "Args:
	T(Contap_ThePointOfContour)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Contap_ThePointOfContour & T);
		%feature("autodoc", "Args:
	S(Contap_TheSequenceOfPointOfContour)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Contap_TheSequenceOfPointOfContour & S);
		%feature("autodoc", "Args:
	T(Contap_ThePointOfContour)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Contap_ThePointOfContour & T);
		%feature("autodoc", "Args:
	S(Contap_TheSequenceOfPointOfContour)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Contap_TheSequenceOfPointOfContour & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Contap_ThePointOfContour)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Contap_ThePointOfContour & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Contap_TheSequenceOfPointOfContour)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Contap_TheSequenceOfPointOfContour & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Contap_ThePointOfContour)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Contap_ThePointOfContour & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Contap_TheSequenceOfPointOfContour)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Contap_TheSequenceOfPointOfContour & S);
		%feature("autodoc", "Args:
	None
Returns:
	Contap_ThePointOfContour

No detailed docstring for this function.") First;
		const Contap_ThePointOfContour & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Contap_ThePointOfContour

No detailed docstring for this function.") Last;
		const Contap_ThePointOfContour & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Contap_TheSequenceOfPointOfContour)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Contap_TheSequenceOfPointOfContour & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Contap_ThePointOfContour

No detailed docstring for this function.") Value;
		const Contap_ThePointOfContour & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Contap_ThePointOfContour)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Contap_ThePointOfContour & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Contap_ThePointOfContour

No detailed docstring for this function.") ChangeValue;
		Contap_ThePointOfContour & ChangeValue (const Standard_Integer Index);
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Contap_TheSurfFunctionOfContour;
		 Contap_TheSurfFunctionOfContour ();
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "Args:
	Eye(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const gp_Pnt & Eye);
		%feature("autodoc", "Args:
	Dir(gp_Dir)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const gp_Dir & Dir);
		%feature("autodoc", "Args:
	Dir(gp_Dir)
	Angle(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const gp_Dir & Dir,const Standard_Real Angle);
		%feature("autodoc", "Args:
	Eye(gp_Pnt)
	Angle(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const gp_Pnt & Eye,const Standard_Real Angle);
		%feature("autodoc", "Args:
	Tolerance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const Standard_Real Tolerance);
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
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Root;
		Standard_Real Root ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Tolerance;
		Standard_Real Tolerance ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

No detailed docstring for this function.") Point;
		const gp_Pnt & Point ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsTangent;
		Standard_Boolean IsTangent ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec

No detailed docstring for this function.") Direction3d;
		const gp_Vec & Direction3d ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir2d

No detailed docstring for this function.") Direction2d;
		const gp_Dir2d & Direction2d ();
		%feature("autodoc", "Args:
	None
Returns:
	Contap_TFunction

No detailed docstring for this function.") FunctionType;
		Contap_TFunction FunctionType ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

No detailed docstring for this function.") Eye;
		const gp_Pnt & Eye ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir

No detailed docstring for this function.") Direction;
		const gp_Dir & Direction ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Angle;
		Standard_Real Angle ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Adaptor3d_HSurface

No detailed docstring for this function.") Surface;
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
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	N(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") Normale;
		static void Normale (const Handle_Adaptor3d_HSurface & S,const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & N);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	d1u(gp_Vec)
	d1v(gp_Vec)
	N(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") DerivAndNorm;
		static void DerivAndNorm (const Handle_Adaptor3d_HSurface & S,const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & d1u,gp_Vec & d1v,gp_Vec & N);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	N(gp_Vec)
	Dnu(gp_Vec)
	Dnv(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") NormAndDn;
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
