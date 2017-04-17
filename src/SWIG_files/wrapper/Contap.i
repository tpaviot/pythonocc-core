/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include Contap_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

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

%nodefaultctor Contap_ArcFunction;
class Contap_ArcFunction : public math_FunctionWithDerivative {
	public:
		%feature("compactdefaultargs") Contap_ArcFunction;
		%feature("autodoc", "	:rtype: None
") Contap_ArcFunction;
		 Contap_ArcFunction ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: None
") Set;
		void Set (const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param Direction:
	:type Direction: gp_Dir
	:rtype: None
") Set;
		void Set (const gp_Dir & Direction);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param Direction:
	:type Direction: gp_Dir
	:param Angle:
	:type Angle: float
	:rtype: None
") Set;
		void Set (const gp_Dir & Direction,const Standard_Real Angle);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param Eye:
	:type Eye: gp_Pnt
	:rtype: None
") Set;
		void Set (const gp_Pnt & Eye);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param Eye:
	:type Eye: gp_Pnt
	:param Angle:
	:type Angle: float
	:rtype: None
") Set;
		void Set (const gp_Pnt & Eye,const Standard_Real Angle);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param A:
	:type A: Handle_Adaptor2d_HCurve2d &
	:rtype: None
") Set;
		void Set (const Handle_Adaptor2d_HCurve2d & A);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param X:
	:type X: float
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Real X,Standard_Real &OutValue);
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	:param X:
	:type X: float
	:param D:
	:type D: float &
	:rtype: bool
") Derivative;
		Standard_Boolean Derivative (const Standard_Real X,Standard_Real &OutValue);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	:param X:
	:type X: float
	:param F:
	:type F: float &
	:param D:
	:type D: float &
	:rtype: bool
") Values;
		Standard_Boolean Values (const Standard_Real X,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "	:rtype: int
") NbSamples;
		Standard_Integer NbSamples ();
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("compactdefaultargs") Valpoint;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Pnt
") Valpoint;
		const gp_Pnt  Valpoint (const Standard_Integer Index);
		%feature("compactdefaultargs") Quadric;
		%feature("autodoc", "	:rtype: IntSurf_Quadric
") Quadric;
		const IntSurf_Quadric & Quadric ();
};


%extend Contap_ArcFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Contap_ContAna;
class Contap_ContAna {
	public:
		%feature("compactdefaultargs") Contap_ContAna;
		%feature("autodoc", "	:rtype: None
") Contap_ContAna;
		 Contap_ContAna ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param S:
	:type S: gp_Sphere
	:param D:
	:type D: gp_Dir
	:rtype: None
") Perform;
		void Perform (const gp_Sphere & S,const gp_Dir & D);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param S:
	:type S: gp_Sphere
	:param D:
	:type D: gp_Dir
	:param Ang:
	:type Ang: float
	:rtype: None
") Perform;
		void Perform (const gp_Sphere & S,const gp_Dir & D,const Standard_Real Ang);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param S:
	:type S: gp_Sphere
	:param Eye:
	:type Eye: gp_Pnt
	:rtype: None
") Perform;
		void Perform (const gp_Sphere & S,const gp_Pnt & Eye);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param C:
	:type C: gp_Cylinder
	:param D:
	:type D: gp_Dir
	:rtype: None
") Perform;
		void Perform (const gp_Cylinder & C,const gp_Dir & D);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param C:
	:type C: gp_Cylinder
	:param D:
	:type D: gp_Dir
	:param Ang:
	:type Ang: float
	:rtype: None
") Perform;
		void Perform (const gp_Cylinder & C,const gp_Dir & D,const Standard_Real Ang);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param C:
	:type C: gp_Cylinder
	:param Eye:
	:type Eye: gp_Pnt
	:rtype: None
") Perform;
		void Perform (const gp_Cylinder & C,const gp_Pnt & Eye);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param C:
	:type C: gp_Cone
	:param D:
	:type D: gp_Dir
	:rtype: None
") Perform;
		void Perform (const gp_Cone & C,const gp_Dir & D);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param C:
	:type C: gp_Cone
	:param D:
	:type D: gp_Dir
	:param Ang:
	:type Ang: float
	:rtype: None
") Perform;
		void Perform (const gp_Cone & C,const gp_Dir & D,const Standard_Real Ang);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param C:
	:type C: gp_Cone
	:param Eye:
	:type Eye: gp_Pnt
	:rtype: None
") Perform;
		void Perform (const gp_Cone & C,const gp_Pnt & Eye);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbContours;
		%feature("autodoc", "	:rtype: int
") NbContours;
		Standard_Integer NbContours ();
		%feature("compactdefaultargs") TypeContour;
		%feature("autodoc", "	* Returns GeomAbs_Line or GeomAbs_Circle, when IsDone() returns True.

	:rtype: GeomAbs_CurveType
") TypeContour;
		GeomAbs_CurveType TypeContour ();
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "	:rtype: gp_Circ
") Circle;
		gp_Circ Circle ();
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Lin
") Line;
		gp_Lin Line (const Standard_Integer Index);
};


%extend Contap_ContAna {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Contap_Contour;
class Contap_Contour {
	public:
		%feature("compactdefaultargs") Contap_Contour;
		%feature("autodoc", "	:rtype: None
") Contap_Contour;
		 Contap_Contour ();
		%feature("compactdefaultargs") Contap_Contour;
		%feature("autodoc", "	:param Direction:
	:type Direction: gp_Vec
	:rtype: None
") Contap_Contour;
		 Contap_Contour (const gp_Vec & Direction);
		%feature("compactdefaultargs") Contap_Contour;
		%feature("autodoc", "	:param Direction:
	:type Direction: gp_Vec
	:param Angle:
	:type Angle: float
	:rtype: None
") Contap_Contour;
		 Contap_Contour (const gp_Vec & Direction,const Standard_Real Angle);
		%feature("compactdefaultargs") Contap_Contour;
		%feature("autodoc", "	:param Eye:
	:type Eye: gp_Pnt
	:rtype: None
") Contap_Contour;
		 Contap_Contour (const gp_Pnt & Eye);
		%feature("compactdefaultargs") Contap_Contour;
		%feature("autodoc", "	* Creates the contour in a given direction.

	:param Surf:
	:type Surf: Handle_Adaptor3d_HSurface &
	:param Domain:
	:type Domain: Handle_Adaptor3d_TopolTool &
	:param Direction:
	:type Direction: gp_Vec
	:rtype: None
") Contap_Contour;
		 Contap_Contour (const Handle_Adaptor3d_HSurface & Surf,const Handle_Adaptor3d_TopolTool & Domain,const gp_Vec & Direction);
		%feature("compactdefaultargs") Contap_Contour;
		%feature("autodoc", "	* Creates the contour in a given direction.

	:param Surf:
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
		%feature("compactdefaultargs") Contap_Contour;
		%feature("autodoc", "	* Creates the contour for a perspective view.

	:param Surf:
	:type Surf: Handle_Adaptor3d_HSurface &
	:param Domain:
	:type Domain: Handle_Adaptor3d_TopolTool &
	:param Eye:
	:type Eye: gp_Pnt
	:rtype: None
") Contap_Contour;
		 Contap_Contour (const Handle_Adaptor3d_HSurface & Surf,const Handle_Adaptor3d_TopolTool & Domain,const gp_Pnt & Eye);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Creates the contour in a given direction.

	:param Surf:
	:type Surf: Handle_Adaptor3d_HSurface &
	:param Domain:
	:type Domain: Handle_Adaptor3d_TopolTool &
	:rtype: None
") Perform;
		void Perform (const Handle_Adaptor3d_HSurface & Surf,const Handle_Adaptor3d_TopolTool & Domain);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Creates the contour in a given direction.

	:param Surf:
	:type Surf: Handle_Adaptor3d_HSurface &
	:param Domain:
	:type Domain: Handle_Adaptor3d_TopolTool &
	:param Direction:
	:type Direction: gp_Vec
	:rtype: None
") Perform;
		void Perform (const Handle_Adaptor3d_HSurface & Surf,const Handle_Adaptor3d_TopolTool & Domain,const gp_Vec & Direction);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Creates the contour in a given direction.

	:param Surf:
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
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Creates the contour for a perspective view.

	:param Surf:
	:type Surf: Handle_Adaptor3d_HSurface &
	:param Domain:
	:type Domain: Handle_Adaptor3d_TopolTool &
	:param Eye:
	:type Eye: gp_Pnt
	:rtype: None
") Perform;
		void Perform (const Handle_Adaptor3d_HSurface & Surf,const Handle_Adaptor3d_TopolTool & Domain,const gp_Pnt & Eye);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param Direction:
	:type Direction: gp_Vec
	:rtype: None
") Init;
		void Init (const gp_Vec & Direction);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param Direction:
	:type Direction: gp_Vec
	:param Angle:
	:type Angle: float
	:rtype: None
") Init;
		void Init (const gp_Vec & Direction,const Standard_Real Angle);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param Eye:
	:type Eye: gp_Pnt
	:rtype: None
") Init;
		void Init (const gp_Pnt & Eye);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	* Returns true if the is no line.

	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "	:rtype: int
") NbLines;
		Standard_Integer NbLines ();
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Contap_Line
") Line;
		const Contap_Line & Line (const Standard_Integer Index);
		%feature("compactdefaultargs") SurfaceFunction;
		%feature("autodoc", "	* Returns a reference on the internal SurfaceFunction. This is used to compute tangents on the lines.

	:rtype: Contap_SurfFunction
") SurfaceFunction;
		Contap_SurfFunction & SurfaceFunction ();
};


%extend Contap_Contour {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class Contap_HContTool {
	public:
		%feature("compactdefaultargs") NbSamplesU;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param u1:
	:type u1: float
	:param u2:
	:type u2: float
	:rtype: int
") NbSamplesU;
		static Standard_Integer NbSamplesU (const Handle_Adaptor3d_HSurface & S,const Standard_Real u1,const Standard_Real u2);
		%feature("compactdefaultargs") NbSamplesV;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param v1:
	:type v1: float
	:param v2:
	:type v2: float
	:rtype: int
") NbSamplesV;
		static Standard_Integer NbSamplesV (const Handle_Adaptor3d_HSurface & S,const Standard_Real v1,const Standard_Real v2);
		%feature("compactdefaultargs") NbSamplePoints;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: int
") NbSamplePoints;
		static Standard_Integer NbSamplePoints (const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") SamplePoint;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param Index:
	:type Index: int
	:param U:
	:type U: float &
	:param V:
	:type V: float &
	:rtype: void
") SamplePoint;
		static void SamplePoint (const Handle_Adaptor3d_HSurface & S,const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") HasBeenSeen;
		%feature("autodoc", "	* Returns True if all the intersection point and edges are known on the Arc. The intersection point are given as vertices. The intersection edges are given as intervals between two vertices.

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: bool
") HasBeenSeen;
		static Standard_Boolean HasBeenSeen (const Handle_Adaptor2d_HCurve2d & C);
		%feature("compactdefaultargs") NbSamplesOnArc;
		%feature("autodoc", "	* returns the number of points which is used to make a sample on the arc. this number is a function of the Surface and the CurveOnSurface complexity.

	:param A:
	:type A: Handle_Adaptor2d_HCurve2d &
	:rtype: int
") NbSamplesOnArc;
		static Standard_Integer NbSamplesOnArc (const Handle_Adaptor2d_HCurve2d & A);
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "	* Returns the parametric limits on the arc C. These limits must be finite : they are either the real limits of the arc, for a finite arc, or a bounding box for an infinite arc.

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param Ufirst:
	:type Ufirst: float &
	:param Ulast:
	:type Ulast: float &
	:rtype: void
") Bounds;
		static void Bounds (const Handle_Adaptor2d_HCurve2d & C,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	* Projects the point P on the arc C. If the methods returns Standard_True, the projection is successful, and Paramproj is the parameter on the arc of the projected point, Ptproj is the projected Point. If the method returns Standard_False, Param proj and Ptproj are not significant.

	:param C:
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
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "	* Returns the parametric tolerance used to consider that the vertex and another point meet, i-e if Abs(parameter(Vertex) - parameter(OtherPnt))<= Tolerance, the points are 'merged'.

	:param V:
	:type V: Handle_Adaptor3d_HVertex &
	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: float
") Tolerance;
		static Standard_Real Tolerance (const Handle_Adaptor3d_HVertex & V,const Handle_Adaptor2d_HCurve2d & C);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Returns the parameter of the vertex V on the arc A.

	:param V:
	:type V: Handle_Adaptor3d_HVertex &
	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: float
") Parameter;
		static Standard_Real Parameter (const Handle_Adaptor3d_HVertex & V,const Handle_Adaptor2d_HCurve2d & C);
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "	* Returns the number of intersection points on the arc A.

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: int
") NbPoints;
		static Standard_Integer NbPoints (const Handle_Adaptor2d_HCurve2d & C);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the value (Pt), the tolerance (Tol), and the parameter (U) on the arc A , of the intersection point of range Index.

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param Index:
	:type Index: int
	:param Pt:
	:type Pt: gp_Pnt
	:param Tol:
	:type Tol: float &
	:param U:
	:type U: float &
	:rtype: void
") Value;
		static void Value (const Handle_Adaptor2d_HCurve2d & C,const Standard_Integer Index,gp_Pnt & Pt,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "	* Returns True if the intersection point of range Index corresponds with a vertex on the arc A.

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param Index:
	:type Index: int
	:rtype: bool
") IsVertex;
		static Standard_Boolean IsVertex (const Handle_Adaptor2d_HCurve2d & C,const Standard_Integer Index);
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "	* When IsVertex returns True, this method returns the vertex on the arc A.

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param Index:
	:type Index: int
	:param V:
	:type V: Handle_Adaptor3d_HVertex &
	:rtype: void
") Vertex;
		static void Vertex (const Handle_Adaptor2d_HCurve2d & C,const Standard_Integer Index,Handle_Adaptor3d_HVertex & V);
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "	* returns the number of part of A solution of the of intersection problem.

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: int
") NbSegments;
		static Standard_Integer NbSegments (const Handle_Adaptor2d_HCurve2d & C);
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "	* Returns True when the segment of range Index is not open at the left side. In that case, IndFirst is the range in the list intersection points (see NbPoints) of the one which defines the left bound of the segment. Otherwise, the method has to return False, and IndFirst has no meaning.

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param Index:
	:type Index: int
	:param IndFirst:
	:type IndFirst: int &
	:rtype: bool
") HasFirstPoint;
		static Standard_Boolean HasFirstPoint (const Handle_Adaptor2d_HCurve2d & C,const Standard_Integer Index,Standard_Integer &OutValue);
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "	* Returns True when the segment of range Index is not open at the right side. In that case, IndLast is the range in the list intersection points (see NbPoints) of the one which defines the right bound of the segment. Otherwise, the method has to return False, and IndLast has no meaning.

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param Index:
	:type Index: int
	:param IndLast:
	:type IndLast: int &
	:rtype: bool
") HasLastPoint;
		static Standard_Boolean HasLastPoint (const Handle_Adaptor2d_HCurve2d & C,const Standard_Integer Index,Standard_Integer &OutValue);
		%feature("compactdefaultargs") IsAllSolution;
		%feature("autodoc", "	* Returns True when the whole restriction is solution of the intersection problem.

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: bool
") IsAllSolution;
		static Standard_Boolean IsAllSolution (const Handle_Adaptor2d_HCurve2d & C);
};


%extend Contap_HContTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class Contap_HCurve2dTool {
	public:
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: float
") FirstParameter;
		static Standard_Real FirstParameter (const Handle_Adaptor2d_HCurve2d & C);
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: float
") LastParameter;
		static Standard_Real LastParameter (const Handle_Adaptor2d_HCurve2d & C);
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: GeomAbs_Shape
") Continuity;
		static GeomAbs_Shape Continuity (const Handle_Adaptor2d_HCurve2d & C);
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(myclass) >= <S>

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		static Standard_Integer NbIntervals (const Handle_Adaptor2d_HCurve2d & C,const GeomAbs_Shape S);
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: void
") Intervals;
		static void Intervals (const Handle_Adaptor2d_HCurve2d & C,TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: bool
") IsClosed;
		static Standard_Boolean IsClosed (const Handle_Adaptor2d_HCurve2d & C);
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: bool
") IsPeriodic;
		static Standard_Boolean IsPeriodic (const Handle_Adaptor2d_HCurve2d & C);
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: float
") Period;
		static Standard_Real Period (const Handle_Adaptor2d_HCurve2d & C);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Computes the point of parameter U on the curve.

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param U:
	:type U: float
	:rtype: gp_Pnt2d
") Value;
		static gp_Pnt2d Value (const Handle_Adaptor2d_HCurve2d & C,const Standard_Real U);
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	* Computes the point of parameter U on the curve.

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: void
") D0;
		static void D0 (const Handle_Adaptor2d_HCurve2d & C,const Standard_Real U,gp_Pnt2d & P);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* Computes the point of parameter U on the curve with its first derivative. Raised if the continuity of the current interval is not C1.

	:param C:
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
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	* Returns the point P of parameter U, the first and second derivatives V1 and V2. Raised if the continuity of the current interval is not C2.

	:param C:
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
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	* Returns the point P of parameter U, the first, the second and the third derivative. Raised if the continuity of the current interval is not C3.

	:param C:
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
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	* The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec2d
") DN;
		static gp_Vec2d DN (const Handle_Adaptor2d_HCurve2d & C,const Standard_Real U,const Standard_Integer N);
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "	* Returns the parametric resolution corresponding to the real space resolution <R3d>.

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param R3d:
	:type R3d: float
	:rtype: float
") Resolution;
		static Standard_Real Resolution (const Handle_Adaptor2d_HCurve2d & C,const Standard_Real R3d);
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	* Returns the type of the curve in the current interval : Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: GeomAbs_CurveType
") GetType;
		static GeomAbs_CurveType GetType (const Handle_Adaptor2d_HCurve2d & C);
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: gp_Lin2d
") Line;
		static gp_Lin2d Line (const Handle_Adaptor2d_HCurve2d & C);
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: gp_Circ2d
") Circle;
		static gp_Circ2d Circle (const Handle_Adaptor2d_HCurve2d & C);
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: gp_Elips2d
") Ellipse;
		static gp_Elips2d Ellipse (const Handle_Adaptor2d_HCurve2d & C);
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: gp_Hypr2d
") Hyperbola;
		static gp_Hypr2d Hyperbola (const Handle_Adaptor2d_HCurve2d & C);
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: gp_Parab2d
") Parabola;
		static gp_Parab2d Parabola (const Handle_Adaptor2d_HCurve2d & C);
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: Handle_Geom2d_BezierCurve
") Bezier;
		static Handle_Geom2d_BezierCurve Bezier (const Handle_Adaptor2d_HCurve2d & C);
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: Handle_Geom2d_BSplineCurve
") BSpline;
		static Handle_Geom2d_BSplineCurve BSpline (const Handle_Adaptor2d_HCurve2d & C);
		%feature("compactdefaultargs") NbSamples;
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


%extend Contap_HCurve2dTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Contap_Line;
class Contap_Line {
	public:
		%feature("compactdefaultargs") Contap_Line;
		%feature("autodoc", "	:rtype: None
") Contap_Line;
		 Contap_Line ();
		%feature("compactdefaultargs") SetLineOn2S;
		%feature("autodoc", "	:param L:
	:type L: Handle_IntSurf_LineOn2S &
	:rtype: None
") SetLineOn2S;
		void SetLineOn2S (const Handle_IntSurf_LineOn2S & L);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") LineOn2S;
		%feature("autodoc", "	:rtype: Handle_IntSurf_LineOn2S
") LineOn2S;
		Handle_IntSurf_LineOn2S LineOn2S ();
		%feature("compactdefaultargs") ResetSeqOfVertex;
		%feature("autodoc", "	:rtype: None
") ResetSeqOfVertex;
		void ResetSeqOfVertex ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param P:
	:type P: IntSurf_PntOn2S &
	:rtype: None
") Add;
		void Add (const IntSurf_PntOn2S & P);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param L:
	:type L: gp_Lin
	:rtype: None
") SetValue;
		void SetValue (const gp_Lin & L);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param C:
	:type C: gp_Circ
	:rtype: None
") SetValue;
		void SetValue (const gp_Circ & C);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param A:
	:type A: Handle_Adaptor2d_HCurve2d &
	:rtype: None
") SetValue;
		void SetValue (const Handle_Adaptor2d_HCurve2d & A);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param P:
	:type P: Contap_Point &
	:rtype: None
") Add;
		void Add (const Contap_Point & P);
		%feature("compactdefaultargs") NbVertex;
		%feature("autodoc", "	:rtype: int
") NbVertex;
		Standard_Integer NbVertex ();
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Contap_Point
") Vertex;
		Contap_Point & Vertex (const Standard_Integer Index);
		%feature("compactdefaultargs") TypeContour;
		%feature("autodoc", "	* Returns Contap_Lin for a line, Contap_Circle for a circle, and Contap_Walking for a Walking line, Contap_Restriction for a part of boundarie.

	:rtype: Contap_IType
") TypeContour;
		Contap_IType TypeContour ();
		%feature("compactdefaultargs") NbPnts;
		%feature("autodoc", "	:rtype: int
") NbPnts;
		Standard_Integer NbPnts ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: IntSurf_PntOn2S
") Point;
		const IntSurf_PntOn2S & Point (const Standard_Integer Index);
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	:rtype: gp_Lin
") Line;
		gp_Lin Line ();
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "	:rtype: gp_Circ
") Circle;
		gp_Circ Circle ();
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", "	:rtype: Handle_Adaptor2d_HCurve2d
") Arc;
		Handle_Adaptor2d_HCurve2d Arc ();
		%feature("compactdefaultargs") SetTransitionOnS;
		%feature("autodoc", "	* Set The Tansition of the line.

	:param T:
	:type T: IntSurf_TypeTrans
	:rtype: None
") SetTransitionOnS;
		void SetTransitionOnS (const IntSurf_TypeTrans T);
		%feature("compactdefaultargs") TransitionOnS;
		%feature("autodoc", "	* returns IN if at the 'left' of the line, the normale of the surface is oriented to the observator.

	:rtype: IntSurf_TypeTrans
") TransitionOnS;
		IntSurf_TypeTrans TransitionOnS ();
};


%extend Contap_Line {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Contap_Point;
class Contap_Point {
	public:
		%feature("compactdefaultargs") Contap_Point;
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") Contap_Point;
		 Contap_Point ();
		%feature("compactdefaultargs") Contap_Point;
		%feature("autodoc", "	* Creates a point.

	:param Pt:
	:type Pt: gp_Pnt
	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: None
") Contap_Point;
		 Contap_Point (const gp_Pnt & Pt,const Standard_Real U,const Standard_Real V);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Sets the values for a point.

	:param Pt:
	:type Pt: gp_Pnt
	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: None
") SetValue;
		void SetValue (const gp_Pnt & Pt,const Standard_Real U,const Standard_Real V);
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "	* Set the value of the parameter on the intersection line.

	:param Para:
	:type Para: float
	:rtype: None
") SetParameter;
		void SetParameter (const Standard_Real Para);
		%feature("compactdefaultargs") SetVertex;
		%feature("autodoc", "	* Sets the values of a point which is a vertex on the initial facet of restriction of one of the surface.

	:param V:
	:type V: Handle_Adaptor3d_HVertex &
	:rtype: None
") SetVertex;
		void SetVertex (const Handle_Adaptor3d_HVertex & V);
		%feature("compactdefaultargs") SetArc;
		%feature("autodoc", "	* Sets the value of the arc and of the parameter on this arc of the point.

	:param A:
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
		%feature("compactdefaultargs") SetMultiple;
		%feature("autodoc", "	:rtype: None
") SetMultiple;
		void SetMultiple ();
		%feature("compactdefaultargs") SetInternal;
		%feature("autodoc", "	:rtype: None
") SetInternal;
		void SetInternal ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the intersection point (geometric information).

	:rtype: gp_Pnt
") Value;
		const gp_Pnt  Value ();
		%feature("compactdefaultargs") ParameterOnLine;
		%feature("autodoc", "	* This method returns the parameter of the point on the intersection line. If the points does not belong to an intersection line, the value returned does not have any sens.

	:rtype: float
") ParameterOnLine;
		Standard_Real ParameterOnLine ();
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "	* Returns the parameters on the surface of the point.

	:param U1:
	:type U1: float &
	:param V1:
	:type V1: float &
	:rtype: None
") Parameters;
		void Parameters (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") IsOnArc;
		%feature("autodoc", "	* Returns True when the point is an intersection between the contour and a restriction.

	:rtype: bool
") IsOnArc;
		Standard_Boolean IsOnArc ();
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", "	* Returns the arc of restriction containing the vertex.

	:rtype: Handle_Adaptor2d_HCurve2d
") Arc;
		Handle_Adaptor2d_HCurve2d Arc ();
		%feature("compactdefaultargs") ParameterOnArc;
		%feature("autodoc", "	* Returns the parameter of the point on the arc returned by the method Arc().

	:rtype: float
") ParameterOnArc;
		Standard_Real ParameterOnArc ();
		%feature("compactdefaultargs") TransitionOnLine;
		%feature("autodoc", "	* Returns the transition of the point on the contour.

	:rtype: IntSurf_Transition
") TransitionOnLine;
		const IntSurf_Transition & TransitionOnLine ();
		%feature("compactdefaultargs") TransitionOnArc;
		%feature("autodoc", "	* Returns the transition of the point on the arc.

	:rtype: IntSurf_Transition
") TransitionOnArc;
		const IntSurf_Transition & TransitionOnArc ();
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "	* Returns True if the point is a vertex on the initial restriction facet of the surface.

	:rtype: bool
") IsVertex;
		Standard_Boolean IsVertex ();
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "	* Returns the information about the point when it is on the domain of the patch, i-e when the function IsVertex returns True. Otherwise, an exception is raised.

	:rtype: Handle_Adaptor3d_HVertex
") Vertex;
		Handle_Adaptor3d_HVertex Vertex ();
		%feature("compactdefaultargs") IsMultiple;
		%feature("autodoc", "	* Returns True if the point belongs to several lines.

	:rtype: bool
") IsMultiple;
		Standard_Boolean IsMultiple ();
		%feature("compactdefaultargs") IsInternal;
		%feature("autodoc", "	* Returns True if the point is an internal one, i.e if the tangent to the line on the point and the eye direction are parallel.

	:rtype: bool
") IsInternal;
		Standard_Boolean IsInternal ();
};


%extend Contap_Point {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Contap_SequenceNodeOfSequenceOfIWLineOfTheIWalking;
class Contap_SequenceNodeOfSequenceOfIWLineOfTheIWalking : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Contap_SequenceNodeOfSequenceOfIWLineOfTheIWalking;
		%feature("autodoc", "	:param I:
	:type I: Handle_Contap_TheIWLineOfTheIWalking &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Contap_SequenceNodeOfSequenceOfIWLineOfTheIWalking;
		 Contap_SequenceNodeOfSequenceOfIWLineOfTheIWalking (const Handle_Contap_TheIWLineOfTheIWalking & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Contap_TheIWLineOfTheIWalking
") Value;
		Handle_Contap_TheIWLineOfTheIWalking Value ();
};


%extend Contap_SequenceNodeOfSequenceOfIWLineOfTheIWalking {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Contap_SequenceNodeOfSequenceOfIWLineOfTheIWalking(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Contap_SequenceNodeOfSequenceOfIWLineOfTheIWalking::Handle_Contap_SequenceNodeOfSequenceOfIWLineOfTheIWalking %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Contap_SequenceNodeOfSequenceOfIWLineOfTheIWalking;
class Handle_Contap_SequenceNodeOfSequenceOfIWLineOfTheIWalking : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Contap_SequenceNodeOfSequenceOfIWLineOfTheIWalking();
        Handle_Contap_SequenceNodeOfSequenceOfIWLineOfTheIWalking(const Handle_Contap_SequenceNodeOfSequenceOfIWLineOfTheIWalking &aHandle);
        Handle_Contap_SequenceNodeOfSequenceOfIWLineOfTheIWalking(const Contap_SequenceNodeOfSequenceOfIWLineOfTheIWalking *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Contap_SequenceNodeOfSequenceOfIWLineOfTheIWalking DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Contap_SequenceNodeOfSequenceOfIWLineOfTheIWalking {
    Contap_SequenceNodeOfSequenceOfIWLineOfTheIWalking* _get_reference() {
    return (Contap_SequenceNodeOfSequenceOfIWLineOfTheIWalking*)$self->Access();
    }
};

%extend Handle_Contap_SequenceNodeOfSequenceOfIWLineOfTheIWalking {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Contap_SequenceNodeOfSequenceOfIWLineOfTheIWalking {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Contap_SequenceNodeOfSequenceOfPathPointOfTheSearch;
class Contap_SequenceNodeOfSequenceOfPathPointOfTheSearch : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Contap_SequenceNodeOfSequenceOfPathPointOfTheSearch;
		%feature("autodoc", "	:param I:
	:type I: Contap_ThePathPointOfTheSearch &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Contap_SequenceNodeOfSequenceOfPathPointOfTheSearch;
		 Contap_SequenceNodeOfSequenceOfPathPointOfTheSearch (const Contap_ThePathPointOfTheSearch & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Contap_ThePathPointOfTheSearch
") Value;
		Contap_ThePathPointOfTheSearch & Value ();
};


%extend Contap_SequenceNodeOfSequenceOfPathPointOfTheSearch {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Contap_SequenceNodeOfSequenceOfPathPointOfTheSearch(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Contap_SequenceNodeOfSequenceOfPathPointOfTheSearch::Handle_Contap_SequenceNodeOfSequenceOfPathPointOfTheSearch %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Contap_SequenceNodeOfSequenceOfPathPointOfTheSearch;
class Handle_Contap_SequenceNodeOfSequenceOfPathPointOfTheSearch : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Contap_SequenceNodeOfSequenceOfPathPointOfTheSearch();
        Handle_Contap_SequenceNodeOfSequenceOfPathPointOfTheSearch(const Handle_Contap_SequenceNodeOfSequenceOfPathPointOfTheSearch &aHandle);
        Handle_Contap_SequenceNodeOfSequenceOfPathPointOfTheSearch(const Contap_SequenceNodeOfSequenceOfPathPointOfTheSearch *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Contap_SequenceNodeOfSequenceOfPathPointOfTheSearch DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Contap_SequenceNodeOfSequenceOfPathPointOfTheSearch {
    Contap_SequenceNodeOfSequenceOfPathPointOfTheSearch* _get_reference() {
    return (Contap_SequenceNodeOfSequenceOfPathPointOfTheSearch*)$self->Access();
    }
};

%extend Handle_Contap_SequenceNodeOfSequenceOfPathPointOfTheSearch {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Contap_SequenceNodeOfSequenceOfPathPointOfTheSearch {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Contap_SequenceNodeOfSequenceOfSegmentOfTheSearch;
class Contap_SequenceNodeOfSequenceOfSegmentOfTheSearch : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Contap_SequenceNodeOfSequenceOfSegmentOfTheSearch;
		%feature("autodoc", "	:param I:
	:type I: Contap_TheSegmentOfTheSearch &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Contap_SequenceNodeOfSequenceOfSegmentOfTheSearch;
		 Contap_SequenceNodeOfSequenceOfSegmentOfTheSearch (const Contap_TheSegmentOfTheSearch & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Contap_TheSegmentOfTheSearch
") Value;
		Contap_TheSegmentOfTheSearch & Value ();
};


%extend Contap_SequenceNodeOfSequenceOfSegmentOfTheSearch {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Contap_SequenceNodeOfSequenceOfSegmentOfTheSearch(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Contap_SequenceNodeOfSequenceOfSegmentOfTheSearch::Handle_Contap_SequenceNodeOfSequenceOfSegmentOfTheSearch %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Contap_SequenceNodeOfSequenceOfSegmentOfTheSearch;
class Handle_Contap_SequenceNodeOfSequenceOfSegmentOfTheSearch : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Contap_SequenceNodeOfSequenceOfSegmentOfTheSearch();
        Handle_Contap_SequenceNodeOfSequenceOfSegmentOfTheSearch(const Handle_Contap_SequenceNodeOfSequenceOfSegmentOfTheSearch &aHandle);
        Handle_Contap_SequenceNodeOfSequenceOfSegmentOfTheSearch(const Contap_SequenceNodeOfSequenceOfSegmentOfTheSearch *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Contap_SequenceNodeOfSequenceOfSegmentOfTheSearch DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Contap_SequenceNodeOfSequenceOfSegmentOfTheSearch {
    Contap_SequenceNodeOfSequenceOfSegmentOfTheSearch* _get_reference() {
    return (Contap_SequenceNodeOfSequenceOfSegmentOfTheSearch*)$self->Access();
    }
};

%extend Handle_Contap_SequenceNodeOfSequenceOfSegmentOfTheSearch {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Contap_SequenceNodeOfSequenceOfSegmentOfTheSearch {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Contap_SequenceNodeOfTheSequenceOfLine;
class Contap_SequenceNodeOfTheSequenceOfLine : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Contap_SequenceNodeOfTheSequenceOfLine;
		%feature("autodoc", "	:param I:
	:type I: Contap_Line &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Contap_SequenceNodeOfTheSequenceOfLine;
		 Contap_SequenceNodeOfTheSequenceOfLine (const Contap_Line & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Contap_Line
") Value;
		Contap_Line & Value ();
};


%extend Contap_SequenceNodeOfTheSequenceOfLine {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Contap_SequenceNodeOfTheSequenceOfLine(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Contap_SequenceNodeOfTheSequenceOfLine::Handle_Contap_SequenceNodeOfTheSequenceOfLine %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Contap_SequenceNodeOfTheSequenceOfLine;
class Handle_Contap_SequenceNodeOfTheSequenceOfLine : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Contap_SequenceNodeOfTheSequenceOfLine();
        Handle_Contap_SequenceNodeOfTheSequenceOfLine(const Handle_Contap_SequenceNodeOfTheSequenceOfLine &aHandle);
        Handle_Contap_SequenceNodeOfTheSequenceOfLine(const Contap_SequenceNodeOfTheSequenceOfLine *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Contap_SequenceNodeOfTheSequenceOfLine DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Contap_SequenceNodeOfTheSequenceOfLine {
    Contap_SequenceNodeOfTheSequenceOfLine* _get_reference() {
    return (Contap_SequenceNodeOfTheSequenceOfLine*)$self->Access();
    }
};

%extend Handle_Contap_SequenceNodeOfTheSequenceOfLine {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Contap_SequenceNodeOfTheSequenceOfLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Contap_SequenceNodeOfTheSequenceOfPoint;
class Contap_SequenceNodeOfTheSequenceOfPoint : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Contap_SequenceNodeOfTheSequenceOfPoint;
		%feature("autodoc", "	:param I:
	:type I: Contap_Point &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Contap_SequenceNodeOfTheSequenceOfPoint;
		 Contap_SequenceNodeOfTheSequenceOfPoint (const Contap_Point & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Contap_Point
") Value;
		Contap_Point & Value ();
};


%extend Contap_SequenceNodeOfTheSequenceOfPoint {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Contap_SequenceNodeOfTheSequenceOfPoint(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Contap_SequenceNodeOfTheSequenceOfPoint::Handle_Contap_SequenceNodeOfTheSequenceOfPoint %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Contap_SequenceNodeOfTheSequenceOfPoint;
class Handle_Contap_SequenceNodeOfTheSequenceOfPoint : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Contap_SequenceNodeOfTheSequenceOfPoint();
        Handle_Contap_SequenceNodeOfTheSequenceOfPoint(const Handle_Contap_SequenceNodeOfTheSequenceOfPoint &aHandle);
        Handle_Contap_SequenceNodeOfTheSequenceOfPoint(const Contap_SequenceNodeOfTheSequenceOfPoint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Contap_SequenceNodeOfTheSequenceOfPoint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Contap_SequenceNodeOfTheSequenceOfPoint {
    Contap_SequenceNodeOfTheSequenceOfPoint* _get_reference() {
    return (Contap_SequenceNodeOfTheSequenceOfPoint*)$self->Access();
    }
};

%extend Handle_Contap_SequenceNodeOfTheSequenceOfPoint {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Contap_SequenceNodeOfTheSequenceOfPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Contap_SequenceOfIWLineOfTheIWalking;
class Contap_SequenceOfIWLineOfTheIWalking : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Contap_SequenceOfIWLineOfTheIWalking;
		%feature("autodoc", "	:rtype: None
") Contap_SequenceOfIWLineOfTheIWalking;
		 Contap_SequenceOfIWLineOfTheIWalking ();
		%feature("compactdefaultargs") Contap_SequenceOfIWLineOfTheIWalking;
		%feature("autodoc", "	:param Other:
	:type Other: Contap_SequenceOfIWLineOfTheIWalking &
	:rtype: None
") Contap_SequenceOfIWLineOfTheIWalking;
		 Contap_SequenceOfIWLineOfTheIWalking (const Contap_SequenceOfIWLineOfTheIWalking & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Contap_SequenceOfIWLineOfTheIWalking &
	:rtype: Contap_SequenceOfIWLineOfTheIWalking
") Assign;
		const Contap_SequenceOfIWLineOfTheIWalking & Assign (const Contap_SequenceOfIWLineOfTheIWalking & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Contap_SequenceOfIWLineOfTheIWalking &
	:rtype: Contap_SequenceOfIWLineOfTheIWalking
") operator =;
		const Contap_SequenceOfIWLineOfTheIWalking & operator = (const Contap_SequenceOfIWLineOfTheIWalking & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_Contap_TheIWLineOfTheIWalking &
	:rtype: None
") Append;
		void Append (const Handle_Contap_TheIWLineOfTheIWalking & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Contap_SequenceOfIWLineOfTheIWalking &
	:rtype: None
") Append;
		void Append (Contap_SequenceOfIWLineOfTheIWalking & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_Contap_TheIWLineOfTheIWalking &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Contap_TheIWLineOfTheIWalking & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Contap_SequenceOfIWLineOfTheIWalking &
	:rtype: None
") Prepend;
		void Prepend (Contap_SequenceOfIWLineOfTheIWalking & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Contap_TheIWLineOfTheIWalking &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Contap_TheIWLineOfTheIWalking & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Contap_SequenceOfIWLineOfTheIWalking &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Contap_SequenceOfIWLineOfTheIWalking & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Contap_TheIWLineOfTheIWalking &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Contap_TheIWLineOfTheIWalking & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Contap_SequenceOfIWLineOfTheIWalking &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Contap_SequenceOfIWLineOfTheIWalking & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_Contap_TheIWLineOfTheIWalking
") First;
		Handle_Contap_TheIWLineOfTheIWalking First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_Contap_TheIWLineOfTheIWalking
") Last;
		Handle_Contap_TheIWLineOfTheIWalking Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Contap_SequenceOfIWLineOfTheIWalking &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Contap_SequenceOfIWLineOfTheIWalking & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Contap_TheIWLineOfTheIWalking
") Value;
		Handle_Contap_TheIWLineOfTheIWalking Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_Contap_TheIWLineOfTheIWalking &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Contap_TheIWLineOfTheIWalking & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Contap_TheIWLineOfTheIWalking
") ChangeValue;
		Handle_Contap_TheIWLineOfTheIWalking ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend Contap_SequenceOfIWLineOfTheIWalking {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Contap_SequenceOfPathPointOfTheSearch;
class Contap_SequenceOfPathPointOfTheSearch : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Contap_SequenceOfPathPointOfTheSearch;
		%feature("autodoc", "	:rtype: None
") Contap_SequenceOfPathPointOfTheSearch;
		 Contap_SequenceOfPathPointOfTheSearch ();
		%feature("compactdefaultargs") Contap_SequenceOfPathPointOfTheSearch;
		%feature("autodoc", "	:param Other:
	:type Other: Contap_SequenceOfPathPointOfTheSearch &
	:rtype: None
") Contap_SequenceOfPathPointOfTheSearch;
		 Contap_SequenceOfPathPointOfTheSearch (const Contap_SequenceOfPathPointOfTheSearch & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Contap_SequenceOfPathPointOfTheSearch &
	:rtype: Contap_SequenceOfPathPointOfTheSearch
") Assign;
		const Contap_SequenceOfPathPointOfTheSearch & Assign (const Contap_SequenceOfPathPointOfTheSearch & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Contap_SequenceOfPathPointOfTheSearch &
	:rtype: Contap_SequenceOfPathPointOfTheSearch
") operator =;
		const Contap_SequenceOfPathPointOfTheSearch & operator = (const Contap_SequenceOfPathPointOfTheSearch & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Contap_ThePathPointOfTheSearch &
	:rtype: None
") Append;
		void Append (const Contap_ThePathPointOfTheSearch & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Contap_SequenceOfPathPointOfTheSearch &
	:rtype: None
") Append;
		void Append (Contap_SequenceOfPathPointOfTheSearch & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Contap_ThePathPointOfTheSearch &
	:rtype: None
") Prepend;
		void Prepend (const Contap_ThePathPointOfTheSearch & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Contap_SequenceOfPathPointOfTheSearch &
	:rtype: None
") Prepend;
		void Prepend (Contap_SequenceOfPathPointOfTheSearch & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Contap_ThePathPointOfTheSearch &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Contap_ThePathPointOfTheSearch & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Contap_SequenceOfPathPointOfTheSearch &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Contap_SequenceOfPathPointOfTheSearch & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Contap_ThePathPointOfTheSearch &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Contap_ThePathPointOfTheSearch & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Contap_SequenceOfPathPointOfTheSearch &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Contap_SequenceOfPathPointOfTheSearch & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Contap_ThePathPointOfTheSearch
") First;
		const Contap_ThePathPointOfTheSearch & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Contap_ThePathPointOfTheSearch
") Last;
		const Contap_ThePathPointOfTheSearch & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Contap_SequenceOfPathPointOfTheSearch &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Contap_SequenceOfPathPointOfTheSearch & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Contap_ThePathPointOfTheSearch
") Value;
		const Contap_ThePathPointOfTheSearch & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Contap_ThePathPointOfTheSearch &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Contap_ThePathPointOfTheSearch & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Contap_ThePathPointOfTheSearch
") ChangeValue;
		Contap_ThePathPointOfTheSearch & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend Contap_SequenceOfPathPointOfTheSearch {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Contap_SequenceOfSegmentOfTheSearch;
class Contap_SequenceOfSegmentOfTheSearch : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Contap_SequenceOfSegmentOfTheSearch;
		%feature("autodoc", "	:rtype: None
") Contap_SequenceOfSegmentOfTheSearch;
		 Contap_SequenceOfSegmentOfTheSearch ();
		%feature("compactdefaultargs") Contap_SequenceOfSegmentOfTheSearch;
		%feature("autodoc", "	:param Other:
	:type Other: Contap_SequenceOfSegmentOfTheSearch &
	:rtype: None
") Contap_SequenceOfSegmentOfTheSearch;
		 Contap_SequenceOfSegmentOfTheSearch (const Contap_SequenceOfSegmentOfTheSearch & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Contap_SequenceOfSegmentOfTheSearch &
	:rtype: Contap_SequenceOfSegmentOfTheSearch
") Assign;
		const Contap_SequenceOfSegmentOfTheSearch & Assign (const Contap_SequenceOfSegmentOfTheSearch & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Contap_SequenceOfSegmentOfTheSearch &
	:rtype: Contap_SequenceOfSegmentOfTheSearch
") operator =;
		const Contap_SequenceOfSegmentOfTheSearch & operator = (const Contap_SequenceOfSegmentOfTheSearch & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Contap_TheSegmentOfTheSearch &
	:rtype: None
") Append;
		void Append (const Contap_TheSegmentOfTheSearch & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Contap_SequenceOfSegmentOfTheSearch &
	:rtype: None
") Append;
		void Append (Contap_SequenceOfSegmentOfTheSearch & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Contap_TheSegmentOfTheSearch &
	:rtype: None
") Prepend;
		void Prepend (const Contap_TheSegmentOfTheSearch & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Contap_SequenceOfSegmentOfTheSearch &
	:rtype: None
") Prepend;
		void Prepend (Contap_SequenceOfSegmentOfTheSearch & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Contap_TheSegmentOfTheSearch &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Contap_TheSegmentOfTheSearch & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Contap_SequenceOfSegmentOfTheSearch &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Contap_SequenceOfSegmentOfTheSearch & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Contap_TheSegmentOfTheSearch &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Contap_TheSegmentOfTheSearch & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Contap_SequenceOfSegmentOfTheSearch &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Contap_SequenceOfSegmentOfTheSearch & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Contap_TheSegmentOfTheSearch
") First;
		const Contap_TheSegmentOfTheSearch & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Contap_TheSegmentOfTheSearch
") Last;
		const Contap_TheSegmentOfTheSearch & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Contap_SequenceOfSegmentOfTheSearch &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Contap_SequenceOfSegmentOfTheSearch & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Contap_TheSegmentOfTheSearch
") Value;
		const Contap_TheSegmentOfTheSearch & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Contap_TheSegmentOfTheSearch &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Contap_TheSegmentOfTheSearch & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Contap_TheSegmentOfTheSearch
") ChangeValue;
		Contap_TheSegmentOfTheSearch & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend Contap_SequenceOfSegmentOfTheSearch {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Contap_SurfFunction;
class Contap_SurfFunction : public math_FunctionSetWithDerivatives {
	public:
		%feature("compactdefaultargs") Contap_SurfFunction;
		%feature("autodoc", "	:rtype: None
") Contap_SurfFunction;
		 Contap_SurfFunction ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: None
") Set;
		void Set (const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param Eye:
	:type Eye: gp_Pnt
	:rtype: None
") Set;
		void Set (const gp_Pnt & Eye);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param Dir:
	:type Dir: gp_Dir
	:rtype: None
") Set;
		void Set (const gp_Dir & Dir);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param Dir:
	:type Dir: gp_Dir
	:param Angle:
	:type Angle: float
	:rtype: None
") Set;
		void Set (const gp_Dir & Dir,const Standard_Real Angle);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param Eye:
	:type Eye: gp_Pnt
	:param Angle:
	:type Angle: float
	:rtype: None
") Set;
		void Set (const gp_Pnt & Eye,const Standard_Real Angle);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Set;
		void Set (const Standard_Real Tolerance);
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	* This method has to return 2.

	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	* This method has to return 1.

	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* The dimension of F is 1.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "	* The dimension of D is (1,2).

	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "	* Root is the value of the function at the solution. It is a vector of dimension 1, i-e a real.

	:rtype: float
") Root;
		Standard_Real Root ();
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "	* Returns the value Tol so that if Abs(Func.Root())<Tol the function is considered null.

	:rtype: float
") Tolerance;
		Standard_Real Tolerance ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the value of the solution point on the surface.

	:rtype: gp_Pnt
") Point;
		const gp_Pnt  Point ();
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "	:rtype: bool
") IsTangent;
		Standard_Boolean IsTangent ();
		%feature("compactdefaultargs") Direction3d;
		%feature("autodoc", "	:rtype: gp_Vec
") Direction3d;
		const gp_Vec  Direction3d ();
		%feature("compactdefaultargs") Direction2d;
		%feature("autodoc", "	:rtype: gp_Dir2d
") Direction2d;
		const gp_Dir2d  Direction2d ();
		%feature("compactdefaultargs") FunctionType;
		%feature("autodoc", "	:rtype: Contap_TFunction
") FunctionType;
		Contap_TFunction FunctionType ();
		%feature("compactdefaultargs") Eye;
		%feature("autodoc", "	:rtype: gp_Pnt
") Eye;
		const gp_Pnt  Eye ();
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "	:rtype: gp_Dir
") Direction;
		const gp_Dir  Direction ();
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "	:rtype: float
") Angle;
		Standard_Real Angle ();
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "	:rtype: Handle_Adaptor3d_HSurface
") Surface;
		Handle_Adaptor3d_HSurface Surface ();
};


%extend Contap_SurfFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class Contap_SurfProps {
	public:
		%feature("compactdefaultargs") Normale;
		%feature("autodoc", "	* Computes the point <P>, and normal vector <N> on <S> at parameters U,V.

	:param S:
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
		%feature("compactdefaultargs") DerivAndNorm;
		%feature("autodoc", "	* Computes the point <P>, and normal vector <N> on <S> at parameters U,V.

	:param S:
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
		%feature("compactdefaultargs") NormAndDn;
		%feature("autodoc", "	* Computes the point <P>, normal vector <N>, and its derivatives <Dnu> and <Dnv> on <S> at parameters U,V.

	:param S:
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


%extend Contap_SurfProps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Contap_TheHSequenceOfPoint;
class Contap_TheHSequenceOfPoint : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Contap_TheHSequenceOfPoint;
		%feature("autodoc", "	:rtype: None
") Contap_TheHSequenceOfPoint;
		 Contap_TheHSequenceOfPoint ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param anItem:
	:type anItem: Contap_Point &
	:rtype: None
") Append;
		void Append (const Contap_Point & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Contap_TheHSequenceOfPoint &
	:rtype: None
") Append;
		void Append (const Handle_Contap_TheHSequenceOfPoint & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: Contap_Point &
	:rtype: None
") Prepend;
		void Prepend (const Contap_Point & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Contap_TheHSequenceOfPoint &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Contap_TheHSequenceOfPoint & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Contap_Point &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Contap_Point & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_Contap_TheHSequenceOfPoint &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Contap_TheHSequenceOfPoint & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Contap_Point &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Contap_Point & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_Contap_TheHSequenceOfPoint &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Contap_TheHSequenceOfPoint & aSequence);
		%feature("compactdefaultargs") Exchange;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anOtherIndex:
	:type anOtherIndex: int
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Contap_TheHSequenceOfPoint
") Split;
		Handle_Contap_TheHSequenceOfPoint Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Contap_Point &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Contap_Point & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Contap_Point
") Value;
		const Contap_Point & Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Contap_Point
") ChangeValue;
		Contap_Point & ChangeValue (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: int
	:param toIndex:
	:type toIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "	:rtype: Contap_TheSequenceOfPoint
") Sequence;
		const Contap_TheSequenceOfPoint & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: Contap_TheSequenceOfPoint
") ChangeSequence;
		Contap_TheSequenceOfPoint & ChangeSequence ();
};


%extend Contap_TheHSequenceOfPoint {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Contap_TheHSequenceOfPoint(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Contap_TheHSequenceOfPoint::Handle_Contap_TheHSequenceOfPoint %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Contap_TheHSequenceOfPoint;
class Handle_Contap_TheHSequenceOfPoint : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Contap_TheHSequenceOfPoint();
        Handle_Contap_TheHSequenceOfPoint(const Handle_Contap_TheHSequenceOfPoint &aHandle);
        Handle_Contap_TheHSequenceOfPoint(const Contap_TheHSequenceOfPoint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Contap_TheHSequenceOfPoint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Contap_TheHSequenceOfPoint {
    Contap_TheHSequenceOfPoint* _get_reference() {
    return (Contap_TheHSequenceOfPoint*)$self->Access();
    }
};

%extend Handle_Contap_TheHSequenceOfPoint {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Contap_TheHSequenceOfPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Contap_TheIWLineOfTheIWalking;
class Contap_TheIWLineOfTheIWalking : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Contap_TheIWLineOfTheIWalking;
		%feature("autodoc", "	:param theAllocator: default value is 0
	:type theAllocator: IntSurf_Allocator &
	:rtype: None
") Contap_TheIWLineOfTheIWalking;
		 Contap_TheIWLineOfTheIWalking (const IntSurf_Allocator & theAllocator = 0);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") Cut;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Cut;
		void Cut (const Standard_Integer Index);
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "	:param P:
	:type P: IntSurf_PntOn2S &
	:rtype: None
") AddPoint;
		void AddPoint (const IntSurf_PntOn2S & P);
		%feature("compactdefaultargs") AddStatusFirst;
		%feature("autodoc", "	:param Closed:
	:type Closed: bool
	:param HasFirst:
	:type HasFirst: bool
	:rtype: None
") AddStatusFirst;
		void AddStatusFirst (const Standard_Boolean Closed,const Standard_Boolean HasFirst);
		%feature("compactdefaultargs") AddStatusFirst;
		%feature("autodoc", "	:param Closed:
	:type Closed: bool
	:param HasLast:
	:type HasLast: bool
	:param Index:
	:type Index: int
	:param P:
	:type P: IntSurf_PathPoint &
	:rtype: None
") AddStatusFirst;
		void AddStatusFirst (const Standard_Boolean Closed,const Standard_Boolean HasLast,const Standard_Integer Index,const IntSurf_PathPoint & P);
		%feature("compactdefaultargs") AddStatusFirstLast;
		%feature("autodoc", "	:param Closed:
	:type Closed: bool
	:param HasFirst:
	:type HasFirst: bool
	:param HasLast:
	:type HasLast: bool
	:rtype: None
") AddStatusFirstLast;
		void AddStatusFirstLast (const Standard_Boolean Closed,const Standard_Boolean HasFirst,const Standard_Boolean HasLast);
		%feature("compactdefaultargs") AddStatusLast;
		%feature("autodoc", "	:param HasLast:
	:type HasLast: bool
	:rtype: None
") AddStatusLast;
		void AddStatusLast (const Standard_Boolean HasLast);
		%feature("compactdefaultargs") AddStatusLast;
		%feature("autodoc", "	:param HasLast:
	:type HasLast: bool
	:param Index:
	:type Index: int
	:param P:
	:type P: IntSurf_PathPoint &
	:rtype: None
") AddStatusLast;
		void AddStatusLast (const Standard_Boolean HasLast,const Standard_Integer Index,const IntSurf_PathPoint & P);
		%feature("compactdefaultargs") AddIndexPassing;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") AddIndexPassing;
		void AddIndexPassing (const Standard_Integer Index);
		%feature("compactdefaultargs") SetTangentVector;
		%feature("autodoc", "	:param V:
	:type V: gp_Vec
	:param Index:
	:type Index: int
	:rtype: None
") SetTangentVector;
		void SetTangentVector (const gp_Vec & V,const Standard_Integer Index);
		%feature("compactdefaultargs") SetTangencyAtBegining;
		%feature("autodoc", "	:param IsTangent:
	:type IsTangent: bool
	:rtype: None
") SetTangencyAtBegining;
		void SetTangencyAtBegining (const Standard_Boolean IsTangent);
		%feature("compactdefaultargs") SetTangencyAtEnd;
		%feature("autodoc", "	:param IsTangent:
	:type IsTangent: bool
	:rtype: None
") SetTangencyAtEnd;
		void SetTangencyAtEnd (const Standard_Boolean IsTangent);
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: IntSurf_PntOn2S
") Value;
		const IntSurf_PntOn2S & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	:rtype: Handle_IntSurf_LineOn2S
") Line;
		Handle_IntSurf_LineOn2S Line ();
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "	:rtype: bool
") IsClosed;
		Standard_Boolean IsClosed ();
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "	:rtype: bool
") HasFirstPoint;
		Standard_Boolean HasFirstPoint ();
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "	:rtype: bool
") HasLastPoint;
		Standard_Boolean HasLastPoint ();
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "	:rtype: IntSurf_PathPoint
") FirstPoint;
		const IntSurf_PathPoint & FirstPoint ();
		%feature("compactdefaultargs") FirstPointIndex;
		%feature("autodoc", "	:rtype: int
") FirstPointIndex;
		Standard_Integer FirstPointIndex ();
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "	:rtype: IntSurf_PathPoint
") LastPoint;
		const IntSurf_PathPoint & LastPoint ();
		%feature("compactdefaultargs") LastPointIndex;
		%feature("autodoc", "	:rtype: int
") LastPointIndex;
		Standard_Integer LastPointIndex ();
		%feature("compactdefaultargs") NbPassingPoint;
		%feature("autodoc", "	:rtype: int
") NbPassingPoint;
		Standard_Integer NbPassingPoint ();
		%feature("compactdefaultargs") PassingPoint;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param IndexLine:
	:type IndexLine: int &
	:param IndexPnts:
	:type IndexPnts: int &
	:rtype: None
") PassingPoint;
		void PassingPoint (const Standard_Integer Index,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") TangentVector;
		%feature("autodoc", "	:param Index:
	:type Index: int &
	:rtype: gp_Vec
") TangentVector;
		const gp_Vec  TangentVector (Standard_Integer &OutValue);
		%feature("compactdefaultargs") IsTangentAtBegining;
		%feature("autodoc", "	:rtype: bool
") IsTangentAtBegining;
		Standard_Boolean IsTangentAtBegining ();
		%feature("compactdefaultargs") IsTangentAtEnd;
		%feature("autodoc", "	:rtype: bool
") IsTangentAtEnd;
		Standard_Boolean IsTangentAtEnd ();
};


%extend Contap_TheIWLineOfTheIWalking {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Contap_TheIWLineOfTheIWalking(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Contap_TheIWLineOfTheIWalking::Handle_Contap_TheIWLineOfTheIWalking %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Contap_TheIWLineOfTheIWalking;
class Handle_Contap_TheIWLineOfTheIWalking : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Contap_TheIWLineOfTheIWalking();
        Handle_Contap_TheIWLineOfTheIWalking(const Handle_Contap_TheIWLineOfTheIWalking &aHandle);
        Handle_Contap_TheIWLineOfTheIWalking(const Contap_TheIWLineOfTheIWalking *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Contap_TheIWLineOfTheIWalking DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Contap_TheIWLineOfTheIWalking {
    Contap_TheIWLineOfTheIWalking* _get_reference() {
    return (Contap_TheIWLineOfTheIWalking*)$self->Access();
    }
};

%extend Handle_Contap_TheIWLineOfTheIWalking {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Contap_TheIWLineOfTheIWalking {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Contap_TheIWalking;
class Contap_TheIWalking {
	public:
		%feature("compactdefaultargs") Contap_TheIWalking;
		%feature("autodoc", "	:param Epsilon:
	:type Epsilon: float
	:param Deflection:
	:type Deflection: float
	:param Step:
	:type Step: float
	:rtype: None
") Contap_TheIWalking;
		 Contap_TheIWalking (const Standard_Real Epsilon,const Standard_Real Deflection,const Standard_Real Step);
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	:param Epsilon:
	:type Epsilon: float
	:param Deflection:
	:type Deflection: float
	:param Step:
	:type Step: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Real Epsilon,const Standard_Real Deflection,const Standard_Real Step);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Pnts1:
	:type Pnts1: IntSurf_SequenceOfPathPoint &
	:param Pnts2:
	:type Pnts2: IntSurf_SequenceOfInteriorPoint &
	:param Func:
	:type Func: Contap_SurfFunction &
	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param Reversed: default value is Standard_False
	:type Reversed: bool
	:rtype: None
") Perform;
		void Perform (const IntSurf_SequenceOfPathPoint & Pnts1,const IntSurf_SequenceOfInteriorPoint & Pnts2,Contap_SurfFunction & Func,const Handle_Adaptor3d_HSurface & S,const Standard_Boolean Reversed = Standard_False);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Pnts1:
	:type Pnts1: IntSurf_SequenceOfPathPoint &
	:param Func:
	:type Func: Contap_SurfFunction &
	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param Reversed: default value is Standard_False
	:type Reversed: bool
	:rtype: None
") Perform;
		void Perform (const IntSurf_SequenceOfPathPoint & Pnts1,Contap_SurfFunction & Func,const Handle_Adaptor3d_HSurface & S,const Standard_Boolean Reversed = Standard_False);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "	:rtype: int
") NbLines;
		Standard_Integer NbLines ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Contap_TheIWLineOfTheIWalking
") Value;
		Handle_Contap_TheIWLineOfTheIWalking Value (const Standard_Integer Index);
		%feature("compactdefaultargs") NbSinglePnts;
		%feature("autodoc", "	:rtype: int
") NbSinglePnts;
		Standard_Integer NbSinglePnts ();
		%feature("compactdefaultargs") SinglePnt;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: IntSurf_PathPoint
") SinglePnt;
		const IntSurf_PathPoint & SinglePnt (const Standard_Integer Index);
};


%extend Contap_TheIWalking {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Contap_ThePathPointOfTheSearch;
class Contap_ThePathPointOfTheSearch {
	public:
		%feature("compactdefaultargs") Contap_ThePathPointOfTheSearch;
		%feature("autodoc", "	:rtype: None
") Contap_ThePathPointOfTheSearch;
		 Contap_ThePathPointOfTheSearch ();
		%feature("compactdefaultargs") Contap_ThePathPointOfTheSearch;
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
") Contap_ThePathPointOfTheSearch;
		 Contap_ThePathPointOfTheSearch (const gp_Pnt & P,const Standard_Real Tol,const Handle_Adaptor3d_HVertex & V,const Handle_Adaptor2d_HCurve2d & A,const Standard_Real Parameter);
		%feature("compactdefaultargs") Contap_ThePathPointOfTheSearch;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param Tol:
	:type Tol: float
	:param A:
	:type A: Handle_Adaptor2d_HCurve2d &
	:param Parameter:
	:type Parameter: float
	:rtype: None
") Contap_ThePathPointOfTheSearch;
		 Contap_ThePathPointOfTheSearch (const gp_Pnt & P,const Standard_Real Tol,const Handle_Adaptor2d_HCurve2d & A,const Standard_Real Parameter);
		%feature("compactdefaultargs") SetValue;
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
		%feature("compactdefaultargs") SetValue;
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
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: gp_Pnt
") Value;
		const gp_Pnt  Value ();
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "	:rtype: float
") Tolerance;
		Standard_Real Tolerance ();
		%feature("compactdefaultargs") IsNew;
		%feature("autodoc", "	:rtype: bool
") IsNew;
		Standard_Boolean IsNew ();
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "	:rtype: Handle_Adaptor3d_HVertex
") Vertex;
		Handle_Adaptor3d_HVertex Vertex ();
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", "	:rtype: Handle_Adaptor2d_HCurve2d
") Arc;
		Handle_Adaptor2d_HCurve2d Arc ();
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:rtype: float
") Parameter;
		Standard_Real Parameter ();
};


%extend Contap_ThePathPointOfTheSearch {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Contap_TheSearch;
class Contap_TheSearch {
	public:
		%feature("compactdefaultargs") Contap_TheSearch;
		%feature("autodoc", "	:rtype: None
") Contap_TheSearch;
		 Contap_TheSearch ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param F:
	:type F: Contap_ArcFunction &
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
		void Perform (Contap_ArcFunction & F,const Handle_Adaptor3d_TopolTool & Domain,const Standard_Real TolBoundary,const Standard_Real TolTangency,const Standard_Boolean RecheckOnRegularity = Standard_False);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") AllArcSolution;
		%feature("autodoc", "	:rtype: bool
") AllArcSolution;
		Standard_Boolean AllArcSolution ();
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Contap_ThePathPointOfTheSearch
") Point;
		const Contap_ThePathPointOfTheSearch & Point (const Standard_Integer Index);
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "	:rtype: int
") NbSegments;
		Standard_Integer NbSegments ();
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Contap_TheSegmentOfTheSearch
") Segment;
		const Contap_TheSegmentOfTheSearch & Segment (const Standard_Integer Index);
};


%extend Contap_TheSearch {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Contap_TheSearchInside;
class Contap_TheSearchInside {
	public:
		%feature("compactdefaultargs") Contap_TheSearchInside;
		%feature("autodoc", "	:rtype: None
") Contap_TheSearchInside;
		 Contap_TheSearchInside ();
		%feature("compactdefaultargs") Contap_TheSearchInside;
		%feature("autodoc", "	:param F:
	:type F: Contap_SurfFunction &
	:param Surf:
	:type Surf: Handle_Adaptor3d_HSurface &
	:param T:
	:type T: Handle_Adaptor3d_TopolTool &
	:param Epsilon:
	:type Epsilon: float
	:rtype: None
") Contap_TheSearchInside;
		 Contap_TheSearchInside (Contap_SurfFunction & F,const Handle_Adaptor3d_HSurface & Surf,const Handle_Adaptor3d_TopolTool & T,const Standard_Real Epsilon);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param F:
	:type F: Contap_SurfFunction &
	:param Surf:
	:type Surf: Handle_Adaptor3d_HSurface &
	:param T:
	:type T: Handle_Adaptor3d_TopolTool &
	:param Epsilon:
	:type Epsilon: float
	:rtype: None
") Perform;
		void Perform (Contap_SurfFunction & F,const Handle_Adaptor3d_HSurface & Surf,const Handle_Adaptor3d_TopolTool & T,const Standard_Real Epsilon);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param F:
	:type F: Contap_SurfFunction &
	:param Surf:
	:type Surf: Handle_Adaptor3d_HSurface &
	:param UStart:
	:type UStart: float
	:param VStart:
	:type VStart: float
	:rtype: None
") Perform;
		void Perform (Contap_SurfFunction & F,const Handle_Adaptor3d_HSurface & Surf,const Standard_Real UStart,const Standard_Real VStart);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: IntSurf_InteriorPoint
") Value;
		const IntSurf_InteriorPoint & Value (const Standard_Integer Index);
};


%extend Contap_TheSearchInside {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Contap_TheSegmentOfTheSearch;
class Contap_TheSegmentOfTheSearch {
	public:
		%feature("compactdefaultargs") Contap_TheSegmentOfTheSearch;
		%feature("autodoc", "	:rtype: None
") Contap_TheSegmentOfTheSearch;
		 Contap_TheSegmentOfTheSearch ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param A:
	:type A: Handle_Adaptor2d_HCurve2d &
	:rtype: None
") SetValue;
		void SetValue (const Handle_Adaptor2d_HCurve2d & A);
		%feature("compactdefaultargs") SetLimitPoint;
		%feature("autodoc", "	:param V:
	:type V: Contap_ThePathPointOfTheSearch &
	:param First:
	:type First: bool
	:rtype: None
") SetLimitPoint;
		void SetLimitPoint (const Contap_ThePathPointOfTheSearch & V,const Standard_Boolean First);
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "	:rtype: Handle_Adaptor2d_HCurve2d
") Curve;
		Handle_Adaptor2d_HCurve2d Curve ();
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "	:rtype: bool
") HasFirstPoint;
		Standard_Boolean HasFirstPoint ();
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "	:rtype: Contap_ThePathPointOfTheSearch
") FirstPoint;
		const Contap_ThePathPointOfTheSearch & FirstPoint ();
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "	:rtype: bool
") HasLastPoint;
		Standard_Boolean HasLastPoint ();
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "	:rtype: Contap_ThePathPointOfTheSearch
") LastPoint;
		const Contap_ThePathPointOfTheSearch & LastPoint ();
};


%extend Contap_TheSegmentOfTheSearch {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Contap_TheSequenceOfLine;
class Contap_TheSequenceOfLine : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Contap_TheSequenceOfLine;
		%feature("autodoc", "	:rtype: None
") Contap_TheSequenceOfLine;
		 Contap_TheSequenceOfLine ();
		%feature("compactdefaultargs") Contap_TheSequenceOfLine;
		%feature("autodoc", "	:param Other:
	:type Other: Contap_TheSequenceOfLine &
	:rtype: None
") Contap_TheSequenceOfLine;
		 Contap_TheSequenceOfLine (const Contap_TheSequenceOfLine & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Contap_TheSequenceOfLine &
	:rtype: Contap_TheSequenceOfLine
") Assign;
		const Contap_TheSequenceOfLine & Assign (const Contap_TheSequenceOfLine & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Contap_TheSequenceOfLine &
	:rtype: Contap_TheSequenceOfLine
") operator =;
		const Contap_TheSequenceOfLine & operator = (const Contap_TheSequenceOfLine & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Contap_Line &
	:rtype: None
") Append;
		void Append (const Contap_Line & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Contap_TheSequenceOfLine &
	:rtype: None
") Append;
		void Append (Contap_TheSequenceOfLine & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Contap_Line &
	:rtype: None
") Prepend;
		void Prepend (const Contap_Line & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Contap_TheSequenceOfLine &
	:rtype: None
") Prepend;
		void Prepend (Contap_TheSequenceOfLine & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Contap_Line &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Contap_Line & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Contap_TheSequenceOfLine &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Contap_TheSequenceOfLine & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Contap_Line &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Contap_Line & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Contap_TheSequenceOfLine &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Contap_TheSequenceOfLine & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Contap_Line
") First;
		const Contap_Line & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Contap_Line
") Last;
		const Contap_Line & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Contap_TheSequenceOfLine &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Contap_TheSequenceOfLine & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Contap_Line
") Value;
		const Contap_Line & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Contap_Line &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Contap_Line & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Contap_Line
") ChangeValue;
		Contap_Line & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend Contap_TheSequenceOfLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Contap_TheSequenceOfPoint;
class Contap_TheSequenceOfPoint : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Contap_TheSequenceOfPoint;
		%feature("autodoc", "	:rtype: None
") Contap_TheSequenceOfPoint;
		 Contap_TheSequenceOfPoint ();
		%feature("compactdefaultargs") Contap_TheSequenceOfPoint;
		%feature("autodoc", "	:param Other:
	:type Other: Contap_TheSequenceOfPoint &
	:rtype: None
") Contap_TheSequenceOfPoint;
		 Contap_TheSequenceOfPoint (const Contap_TheSequenceOfPoint & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Contap_TheSequenceOfPoint &
	:rtype: Contap_TheSequenceOfPoint
") Assign;
		const Contap_TheSequenceOfPoint & Assign (const Contap_TheSequenceOfPoint & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Contap_TheSequenceOfPoint &
	:rtype: Contap_TheSequenceOfPoint
") operator =;
		const Contap_TheSequenceOfPoint & operator = (const Contap_TheSequenceOfPoint & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Contap_Point &
	:rtype: None
") Append;
		void Append (const Contap_Point & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Contap_TheSequenceOfPoint &
	:rtype: None
") Append;
		void Append (Contap_TheSequenceOfPoint & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Contap_Point &
	:rtype: None
") Prepend;
		void Prepend (const Contap_Point & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Contap_TheSequenceOfPoint &
	:rtype: None
") Prepend;
		void Prepend (Contap_TheSequenceOfPoint & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Contap_Point &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Contap_Point & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Contap_TheSequenceOfPoint &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Contap_TheSequenceOfPoint & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Contap_Point &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Contap_Point & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Contap_TheSequenceOfPoint &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Contap_TheSequenceOfPoint & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Contap_Point
") First;
		const Contap_Point & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Contap_Point
") Last;
		const Contap_Point & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Contap_TheSequenceOfPoint &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Contap_TheSequenceOfPoint & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Contap_Point
") Value;
		const Contap_Point & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Contap_Point &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Contap_Point & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Contap_Point
") ChangeValue;
		Contap_Point & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend Contap_TheSequenceOfPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
