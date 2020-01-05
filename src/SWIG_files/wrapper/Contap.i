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
%define CONTAPDOCSTRING
"Contap module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_contap.html"
%enddef
%module (package="OCC.Core", docstring=CONTAPDOCSTRING) Contap


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
#include<Contap_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<math_module.hxx>
#include<gp_module.hxx>
#include<IntSurf_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Adaptor2d_module.hxx>
#include<GeomAbs_module.hxx>
#include<Geom2d_module.hxx>
#include<TColStd_module.hxx>
#include<TColgp_module.hxx>
#include<Geom_module.hxx>
#include<NCollection_module.hxx>
#include<Adaptor3d_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import math.i
%import gp.i
%import IntSurf.i
%import Adaptor3d.i
%import Adaptor2d.i
%import GeomAbs.i
%import Geom2d.i
%import TColStd.i
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

/* handles */
%wrap_handle(Contap_TheIWLineOfTheIWalking)
%wrap_handle(Contap_TheHSequenceOfPoint)
/* end handles declaration */

/* templates */
%template(Contap_TheSequenceOfPoint) NCollection_Sequence <Contap_Point>;
%template(Contap_SequenceOfSegmentOfTheSearch) NCollection_Sequence <Contap_TheSegmentOfTheSearch>;
%template(Contap_TheSequenceOfLine) NCollection_Sequence <Contap_Line>;
%template(Contap_SequenceOfIWLineOfTheIWalking) NCollection_Sequence <opencascade::handle <Contap_TheIWLineOfTheIWalking>>;
%template(Contap_SequenceOfPathPointOfTheSearch) NCollection_Sequence <Contap_ThePathPointOfTheSearch>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence <Contap_Point> Contap_TheSequenceOfPoint;
typedef NCollection_Sequence <Contap_TheSegmentOfTheSearch> Contap_SequenceOfSegmentOfTheSearch;
typedef NCollection_Sequence <Contap_Line> Contap_TheSequenceOfLine;
typedef NCollection_Sequence <opencascade::handle <Contap_TheIWLineOfTheIWalking>> Contap_SequenceOfIWLineOfTheIWalking;
typedef NCollection_Sequence <Contap_ThePathPointOfTheSearch> Contap_SequenceOfPathPointOfTheSearch;
/* end typedefs declaration */

/***************************
* class Contap_ArcFunction *
***************************/
class Contap_ArcFunction : public math_FunctionWithDerivative {
	public:
		/****************** Contap_ArcFunction ******************/
		%feature("compactdefaultargs") Contap_ArcFunction;
		%feature("autodoc", ":rtype: None") Contap_ArcFunction;
		 Contap_ArcFunction ();

		/****************** Derivative ******************/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", ":param X:
	:type X: float
	:param D:
	:type D: float
	:rtype: bool") Derivative;
		Standard_Boolean Derivative (const Standard_Real X,Standard_Real &OutValue);

		/****************** GetStateNumber ******************/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", ":rtype: int") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();

		/****************** LastComputedPoint ******************/
		%feature("compactdefaultargs") LastComputedPoint;
		%feature("autodoc", "* Returns the point, which has been computed while the last calling Value() method
	:rtype: gp_Pnt") LastComputedPoint;
		const gp_Pnt  LastComputedPoint ();

		/****************** NbSamples ******************/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", ":rtype: int") NbSamples;
		Standard_Integer NbSamples ();

		/****************** Quadric ******************/
		%feature("compactdefaultargs") Quadric;
		%feature("autodoc", ":rtype: IntSurf_Quadric") Quadric;
		const IntSurf_Quadric & Quadric ();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:rtype: None") Set;
		void Set (const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", ":param Direction:
	:type Direction: gp_Dir
	:rtype: None") Set;
		void Set (const gp_Dir & Direction);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", ":param Direction:
	:type Direction: gp_Dir
	:param Angle:
	:type Angle: float
	:rtype: None") Set;
		void Set (const gp_Dir & Direction,const Standard_Real Angle);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", ":param Eye:
	:type Eye: gp_Pnt
	:rtype: None") Set;
		void Set (const gp_Pnt & Eye);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", ":param Eye:
	:type Eye: gp_Pnt
	:param Angle:
	:type Angle: float
	:rtype: None") Set;
		void Set (const gp_Pnt & Eye,const Standard_Real Angle);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", ":param A:
	:type A: Adaptor2d_HCurve2d
	:rtype: None") Set;
		void Set (const opencascade::handle<Adaptor2d_HCurve2d> & A);

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "* Returns mySurf field
	:rtype: opencascade::handle<Adaptor3d_HSurface>") Surface;
		const opencascade::handle<Adaptor3d_HSurface> & Surface ();

		/****************** Valpoint ******************/
		%feature("compactdefaultargs") Valpoint;
		%feature("autodoc", ":param Index:
	:type Index: int
	:rtype: gp_Pnt") Valpoint;
		const gp_Pnt  Valpoint (const Standard_Integer Index);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":param X:
	:type X: float
	:param F:
	:type F: float
	:rtype: bool") Value;
		Standard_Boolean Value (const Standard_Real X,Standard_Real &OutValue);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", ":param X:
	:type X: float
	:param F:
	:type F: float
	:param D:
	:type D: float
	:rtype: bool") Values;
		Standard_Boolean Values (const Standard_Real X,Standard_Real &OutValue,Standard_Real &OutValue);

};


%extend Contap_ArcFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Contap_ContAna *
***********************/
class Contap_ContAna {
	public:
		/****************** Circle ******************/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", ":rtype: gp_Circ") Circle;
		gp_Circ Circle ();

		/****************** Contap_ContAna ******************/
		%feature("compactdefaultargs") Contap_ContAna;
		%feature("autodoc", ":rtype: None") Contap_ContAna;
		 Contap_ContAna ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", ":rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", ":param Index:
	:type Index: int
	:rtype: gp_Lin") Line;
		gp_Lin Line (const Standard_Integer Index);

		/****************** NbContours ******************/
		%feature("compactdefaultargs") NbContours;
		%feature("autodoc", ":rtype: int") NbContours;
		Standard_Integer NbContours ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param S:
	:type S: gp_Sphere
	:param D:
	:type D: gp_Dir
	:rtype: None") Perform;
		void Perform (const gp_Sphere & S,const gp_Dir & D);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param S:
	:type S: gp_Sphere
	:param D:
	:type D: gp_Dir
	:param Ang:
	:type Ang: float
	:rtype: None") Perform;
		void Perform (const gp_Sphere & S,const gp_Dir & D,const Standard_Real Ang);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param S:
	:type S: gp_Sphere
	:param Eye:
	:type Eye: gp_Pnt
	:rtype: None") Perform;
		void Perform (const gp_Sphere & S,const gp_Pnt & Eye);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param C:
	:type C: gp_Cylinder
	:param D:
	:type D: gp_Dir
	:rtype: None") Perform;
		void Perform (const gp_Cylinder & C,const gp_Dir & D);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param C:
	:type C: gp_Cylinder
	:param D:
	:type D: gp_Dir
	:param Ang:
	:type Ang: float
	:rtype: None") Perform;
		void Perform (const gp_Cylinder & C,const gp_Dir & D,const Standard_Real Ang);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param C:
	:type C: gp_Cylinder
	:param Eye:
	:type Eye: gp_Pnt
	:rtype: None") Perform;
		void Perform (const gp_Cylinder & C,const gp_Pnt & Eye);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param C:
	:type C: gp_Cone
	:param D:
	:type D: gp_Dir
	:rtype: None") Perform;
		void Perform (const gp_Cone & C,const gp_Dir & D);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param C:
	:type C: gp_Cone
	:param D:
	:type D: gp_Dir
	:param Ang:
	:type Ang: float
	:rtype: None") Perform;
		void Perform (const gp_Cone & C,const gp_Dir & D,const Standard_Real Ang);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param C:
	:type C: gp_Cone
	:param Eye:
	:type Eye: gp_Pnt
	:rtype: None") Perform;
		void Perform (const gp_Cone & C,const gp_Pnt & Eye);

		/****************** TypeContour ******************/
		%feature("compactdefaultargs") TypeContour;
		%feature("autodoc", "* Returns GeomAbs_Line or GeomAbs_Circle, when IsDone() returns True.
	:rtype: GeomAbs_CurveType") TypeContour;
		GeomAbs_CurveType TypeContour ();

};


%extend Contap_ContAna {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Contap_Contour *
***********************/
class Contap_Contour {
	public:
		/****************** Contap_Contour ******************/
		%feature("compactdefaultargs") Contap_Contour;
		%feature("autodoc", ":rtype: None") Contap_Contour;
		 Contap_Contour ();

		/****************** Contap_Contour ******************/
		%feature("compactdefaultargs") Contap_Contour;
		%feature("autodoc", ":param Direction:
	:type Direction: gp_Vec
	:rtype: None") Contap_Contour;
		 Contap_Contour (const gp_Vec & Direction);

		/****************** Contap_Contour ******************/
		%feature("compactdefaultargs") Contap_Contour;
		%feature("autodoc", ":param Direction:
	:type Direction: gp_Vec
	:param Angle:
	:type Angle: float
	:rtype: None") Contap_Contour;
		 Contap_Contour (const gp_Vec & Direction,const Standard_Real Angle);

		/****************** Contap_Contour ******************/
		%feature("compactdefaultargs") Contap_Contour;
		%feature("autodoc", ":param Eye:
	:type Eye: gp_Pnt
	:rtype: None") Contap_Contour;
		 Contap_Contour (const gp_Pnt & Eye);

		/****************** Contap_Contour ******************/
		%feature("compactdefaultargs") Contap_Contour;
		%feature("autodoc", "* Creates the contour in a given direction.
	:param Surf:
	:type Surf: Adaptor3d_HSurface
	:param Domain:
	:type Domain: Adaptor3d_TopolTool
	:param Direction:
	:type Direction: gp_Vec
	:rtype: None") Contap_Contour;
		 Contap_Contour (const opencascade::handle<Adaptor3d_HSurface> & Surf,const opencascade::handle<Adaptor3d_TopolTool> & Domain,const gp_Vec & Direction);

		/****************** Contap_Contour ******************/
		%feature("compactdefaultargs") Contap_Contour;
		%feature("autodoc", "* Creates the contour in a given direction.
	:param Surf:
	:type Surf: Adaptor3d_HSurface
	:param Domain:
	:type Domain: Adaptor3d_TopolTool
	:param Direction:
	:type Direction: gp_Vec
	:param Angle:
	:type Angle: float
	:rtype: None") Contap_Contour;
		 Contap_Contour (const opencascade::handle<Adaptor3d_HSurface> & Surf,const opencascade::handle<Adaptor3d_TopolTool> & Domain,const gp_Vec & Direction,const Standard_Real Angle);

		/****************** Contap_Contour ******************/
		%feature("compactdefaultargs") Contap_Contour;
		%feature("autodoc", "* Creates the contour for a perspective view.
	:param Surf:
	:type Surf: Adaptor3d_HSurface
	:param Domain:
	:type Domain: Adaptor3d_TopolTool
	:param Eye:
	:type Eye: gp_Pnt
	:rtype: None") Contap_Contour;
		 Contap_Contour (const opencascade::handle<Adaptor3d_HSurface> & Surf,const opencascade::handle<Adaptor3d_TopolTool> & Domain,const gp_Pnt & Eye);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param Direction:
	:type Direction: gp_Vec
	:rtype: None") Init;
		void Init (const gp_Vec & Direction);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param Direction:
	:type Direction: gp_Vec
	:param Angle:
	:type Angle: float
	:rtype: None") Init;
		void Init (const gp_Vec & Direction,const Standard_Real Angle);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param Eye:
	:type Eye: gp_Pnt
	:rtype: None") Init;
		void Init (const gp_Pnt & Eye);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", ":rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "* Returns true if the is no line.
	:rtype: bool") IsEmpty;
		Standard_Boolean IsEmpty ();

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", ":param Index:
	:type Index: int
	:rtype: Contap_Line") Line;
		const Contap_Line & Line (const Standard_Integer Index);

		/****************** NbLines ******************/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", ":rtype: int") NbLines;
		Standard_Integer NbLines ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Creates the contour in a given direction.
	:param Surf:
	:type Surf: Adaptor3d_HSurface
	:param Domain:
	:type Domain: Adaptor3d_TopolTool
	:rtype: None") Perform;
		void Perform (const opencascade::handle<Adaptor3d_HSurface> & Surf,const opencascade::handle<Adaptor3d_TopolTool> & Domain);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Creates the contour in a given direction.
	:param Surf:
	:type Surf: Adaptor3d_HSurface
	:param Domain:
	:type Domain: Adaptor3d_TopolTool
	:param Direction:
	:type Direction: gp_Vec
	:rtype: None") Perform;
		void Perform (const opencascade::handle<Adaptor3d_HSurface> & Surf,const opencascade::handle<Adaptor3d_TopolTool> & Domain,const gp_Vec & Direction);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Creates the contour in a given direction.
	:param Surf:
	:type Surf: Adaptor3d_HSurface
	:param Domain:
	:type Domain: Adaptor3d_TopolTool
	:param Direction:
	:type Direction: gp_Vec
	:param Angle:
	:type Angle: float
	:rtype: None") Perform;
		void Perform (const opencascade::handle<Adaptor3d_HSurface> & Surf,const opencascade::handle<Adaptor3d_TopolTool> & Domain,const gp_Vec & Direction,const Standard_Real Angle);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Creates the contour for a perspective view.
	:param Surf:
	:type Surf: Adaptor3d_HSurface
	:param Domain:
	:type Domain: Adaptor3d_TopolTool
	:param Eye:
	:type Eye: gp_Pnt
	:rtype: None") Perform;
		void Perform (const opencascade::handle<Adaptor3d_HSurface> & Surf,const opencascade::handle<Adaptor3d_TopolTool> & Domain,const gp_Pnt & Eye);

		/****************** SurfaceFunction ******************/
		%feature("compactdefaultargs") SurfaceFunction;
		%feature("autodoc", "* Returns a reference on the internal SurfaceFunction. This is used to compute tangents on the lines.
	:rtype: Contap_SurfFunction") SurfaceFunction;
		Contap_SurfFunction & SurfaceFunction ();

};


%extend Contap_Contour {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Contap_HContTool *
*************************/
class Contap_HContTool {
	public:
		/****************** Bounds ******************/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "* Returns the parametric limits on the arc C. These limits must be finite : they are either the real limits of the arc, for a finite arc, or a bounding box for an infinite arc.
	:param C:
	:type C: Adaptor2d_HCurve2d
	:param Ufirst:
	:type Ufirst: float
	:param Ulast:
	:type Ulast: float
	:rtype: void") Bounds;
		static void Bounds (const opencascade::handle<Adaptor2d_HCurve2d> & C,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** HasBeenSeen ******************/
		%feature("compactdefaultargs") HasBeenSeen;
		%feature("autodoc", "* Returns True if all the intersection point and edges are known on the Arc. The intersection point are given as vertices. The intersection edges are given as intervals between two vertices.
	:param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: bool") HasBeenSeen;
		static Standard_Boolean HasBeenSeen (const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** HasFirstPoint ******************/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "* Returns True when the segment of range Index is not open at the left side. In that case, IndFirst is the range in the list intersection points (see NbPoints) of the one which defines the left bound of the segment. Otherwise, the method has to return False, and IndFirst has no meaning.
	:param C:
	:type C: Adaptor2d_HCurve2d
	:param Index:
	:type Index: int
	:param IndFirst:
	:type IndFirst: int
	:rtype: bool") HasFirstPoint;
		static Standard_Boolean HasFirstPoint (const opencascade::handle<Adaptor2d_HCurve2d> & C,const Standard_Integer Index,Standard_Integer &OutValue);

		/****************** HasLastPoint ******************/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "* Returns True when the segment of range Index is not open at the right side. In that case, IndLast is the range in the list intersection points (see NbPoints) of the one which defines the right bound of the segment. Otherwise, the method has to return False, and IndLast has no meaning.
	:param C:
	:type C: Adaptor2d_HCurve2d
	:param Index:
	:type Index: int
	:param IndLast:
	:type IndLast: int
	:rtype: bool") HasLastPoint;
		static Standard_Boolean HasLastPoint (const opencascade::handle<Adaptor2d_HCurve2d> & C,const Standard_Integer Index,Standard_Integer &OutValue);

		/****************** IsAllSolution ******************/
		%feature("compactdefaultargs") IsAllSolution;
		%feature("autodoc", "* Returns True when the whole restriction is solution of the intersection problem.
	:param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: bool") IsAllSolution;
		static Standard_Boolean IsAllSolution (const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** IsVertex ******************/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "* Returns True if the intersection point of range Index corresponds with a vertex on the arc A.
	:param C:
	:type C: Adaptor2d_HCurve2d
	:param Index:
	:type Index: int
	:rtype: bool") IsVertex;
		static Standard_Boolean IsVertex (const opencascade::handle<Adaptor2d_HCurve2d> & C,const Standard_Integer Index);

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "* Returns the number of intersection points on the arc A.
	:param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: int") NbPoints;
		static Standard_Integer NbPoints (const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** NbSamplePoints ******************/
		%feature("compactdefaultargs") NbSamplePoints;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:rtype: int") NbSamplePoints;
		static Standard_Integer NbSamplePoints (const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** NbSamplesOnArc ******************/
		%feature("compactdefaultargs") NbSamplesOnArc;
		%feature("autodoc", "* returns the number of points which is used to make a sample on the arc. this number is a function of the Surface and the CurveOnSurface complexity.
	:param A:
	:type A: Adaptor2d_HCurve2d
	:rtype: int") NbSamplesOnArc;
		static Standard_Integer NbSamplesOnArc (const opencascade::handle<Adaptor2d_HCurve2d> & A);

		/****************** NbSamplesU ******************/
		%feature("compactdefaultargs") NbSamplesU;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:param u1:
	:type u1: float
	:param u2:
	:type u2: float
	:rtype: int") NbSamplesU;
		static Standard_Integer NbSamplesU (const opencascade::handle<Adaptor3d_HSurface> & S,const Standard_Real u1,const Standard_Real u2);

		/****************** NbSamplesV ******************/
		%feature("compactdefaultargs") NbSamplesV;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:param v1:
	:type v1: float
	:param v2:
	:type v2: float
	:rtype: int") NbSamplesV;
		static Standard_Integer NbSamplesV (const opencascade::handle<Adaptor3d_HSurface> & S,const Standard_Real v1,const Standard_Real v2);

		/****************** NbSegments ******************/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "* returns the number of part of A solution of the of intersection problem.
	:param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: int") NbSegments;
		static Standard_Integer NbSegments (const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "* Returns the parameter of the vertex V on the arc A.
	:param V:
	:type V: Adaptor3d_HVertex
	:param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: float") Parameter;
		static Standard_Real Parameter (const opencascade::handle<Adaptor3d_HVertex> & V,const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "* Projects the point P on the arc C. If the methods returns Standard_True, the projection is successful, and Paramproj is the parameter on the arc of the projected point, Ptproj is the projected Point. If the method returns Standard_False, Param proj and Ptproj are not significant.
	:param C:
	:type C: Adaptor2d_HCurve2d
	:param P:
	:type P: gp_Pnt2d
	:param Paramproj:
	:type Paramproj: float
	:param Ptproj:
	:type Ptproj: gp_Pnt2d
	:rtype: bool") Project;
		static Standard_Boolean Project (const opencascade::handle<Adaptor2d_HCurve2d> & C,const gp_Pnt2d & P,Standard_Real &OutValue,gp_Pnt2d & Ptproj);

		/****************** SamplePoint ******************/
		%feature("compactdefaultargs") SamplePoint;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:param Index:
	:type Index: int
	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: void") SamplePoint;
		static void SamplePoint (const opencascade::handle<Adaptor3d_HSurface> & S,const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "* Returns the parametric tolerance used to consider that the vertex and another point meet, i-e if Abs(parameter(Vertex) - parameter(OtherPnt))<= Tolerance, the points are 'merged'.
	:param V:
	:type V: Adaptor3d_HVertex
	:param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: float") Tolerance;
		static Standard_Real Tolerance (const opencascade::handle<Adaptor3d_HVertex> & V,const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the value (Pt), the tolerance (Tol), and the parameter (U) on the arc A , of the intersection point of range Index.
	:param C:
	:type C: Adaptor2d_HCurve2d
	:param Index:
	:type Index: int
	:param Pt:
	:type Pt: gp_Pnt
	:param Tol:
	:type Tol: float
	:param U:
	:type U: float
	:rtype: void") Value;
		static void Value (const opencascade::handle<Adaptor2d_HCurve2d> & C,const Standard_Integer Index,gp_Pnt & Pt,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "* When IsVertex returns True, this method returns the vertex on the arc A.
	:param C:
	:type C: Adaptor2d_HCurve2d
	:param Index:
	:type Index: int
	:param V:
	:type V: Adaptor3d_HVertex
	:rtype: void") Vertex;
		static void Vertex (const opencascade::handle<Adaptor2d_HCurve2d> & C,const Standard_Integer Index,opencascade::handle<Adaptor3d_HVertex> & V);

};


%extend Contap_HContTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Contap_HCurve2dTool *
****************************/
class Contap_HCurve2dTool {
	public:
		/****************** BSpline ******************/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", ":param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: opencascade::handle<Geom2d_BSplineCurve>") BSpline;
		static opencascade::handle<Geom2d_BSplineCurve> BSpline (const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Bezier ******************/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", ":param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: opencascade::handle<Geom2d_BezierCurve>") Bezier;
		static opencascade::handle<Geom2d_BezierCurve> Bezier (const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Circle ******************/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", ":param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: gp_Circ2d") Circle;
		static gp_Circ2d Circle (const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", ":param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: GeomAbs_Shape") Continuity;
		static GeomAbs_Shape Continuity (const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "* Computes the point of parameter U on the curve.
	:param C:
	:type C: Adaptor2d_HCurve2d
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: None") D0;
		static void D0 (const opencascade::handle<Adaptor2d_HCurve2d> & C,const Standard_Real U,gp_Pnt2d & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "* Computes the point of parameter U on the curve with its first derivative. Raised if the continuity of the current interval is not C1.
	:param C:
	:type C: Adaptor2d_HCurve2d
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V:
	:type V: gp_Vec2d
	:rtype: None") D1;
		static void D1 (const opencascade::handle<Adaptor2d_HCurve2d> & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "* Returns the point P of parameter U, the first and second derivatives V1 and V2. Raised if the continuity of the current interval is not C2.
	:param C:
	:type C: Adaptor2d_HCurve2d
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: None") D2;
		static void D2 (const opencascade::handle<Adaptor2d_HCurve2d> & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "* Returns the point P of parameter U, the first, the second and the third derivative. Raised if the continuity of the current interval is not C3.
	:param C:
	:type C: Adaptor2d_HCurve2d
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
	:rtype: None") D3;
		static void D3 (const opencascade::handle<Adaptor2d_HCurve2d> & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "* The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.
	:param C:
	:type C: Adaptor2d_HCurve2d
	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec2d") DN;
		static gp_Vec2d DN (const opencascade::handle<Adaptor2d_HCurve2d> & C,const Standard_Real U,const Standard_Integer N);

		/****************** Ellipse ******************/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", ":param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: gp_Elips2d") Ellipse;
		static gp_Elips2d Ellipse (const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", ":param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: float") FirstParameter;
		static Standard_Real FirstParameter (const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "* Returns the type of the curve in the current interval : Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.
	:param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: GeomAbs_CurveType") GetType;
		static GeomAbs_CurveType GetType (const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Hyperbola ******************/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", ":param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: gp_Hypr2d") Hyperbola;
		static gp_Hypr2d Hyperbola (const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()
	:param C:
	:type C: Adaptor2d_HCurve2d
	:param T:
	:type T: TColStd_Array1OfReal
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None") Intervals;
		static void Intervals (const opencascade::handle<Adaptor2d_HCurve2d> & C,TColStd_Array1OfReal & T,const GeomAbs_Shape S);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", ":param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: bool") IsClosed;
		static Standard_Boolean IsClosed (const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", ":param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: bool") IsPeriodic;
		static Standard_Boolean IsPeriodic (const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", ":param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: float") LastParameter;
		static Standard_Real LastParameter (const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", ":param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: gp_Lin2d") Line;
		static gp_Lin2d Line (const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "* Returns the number of intervals for continuity <S>. May be one if Continuity(myclass) >= <S>
	:param C:
	:type C: Adaptor2d_HCurve2d
	:param S:
	:type S: GeomAbs_Shape
	:rtype: int") NbIntervals;
		static Standard_Integer NbIntervals (const opencascade::handle<Adaptor2d_HCurve2d> & C,const GeomAbs_Shape S);

		/****************** NbSamples ******************/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", ":param C:
	:type C: Adaptor2d_HCurve2d
	:param U0:
	:type U0: float
	:param U1:
	:type U1: float
	:rtype: int") NbSamples;
		static Standard_Integer NbSamples (const opencascade::handle<Adaptor2d_HCurve2d> & C,const Standard_Real U0,const Standard_Real U1);

		/****************** Parabola ******************/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", ":param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: gp_Parab2d") Parabola;
		static gp_Parab2d Parabola (const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Period ******************/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", ":param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: float") Period;
		static Standard_Real Period (const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "* Returns the parametric resolution corresponding to the real space resolution <R3d>.
	:param C:
	:type C: Adaptor2d_HCurve2d
	:param R3d:
	:type R3d: float
	:rtype: float") Resolution;
		static Standard_Real Resolution (const opencascade::handle<Adaptor2d_HCurve2d> & C,const Standard_Real R3d);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Computes the point of parameter U on the curve.
	:param C:
	:type C: Adaptor2d_HCurve2d
	:param U:
	:type U: float
	:rtype: gp_Pnt2d") Value;
		static gp_Pnt2d Value (const opencascade::handle<Adaptor2d_HCurve2d> & C,const Standard_Real U);

};


%extend Contap_HCurve2dTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class Contap_Line *
********************/
class Contap_Line {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", ":param P:
	:type P: IntSurf_PntOn2S
	:rtype: None") Add;
		void Add (const IntSurf_PntOn2S & P);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", ":param P:
	:type P: Contap_Point
	:rtype: None") Add;
		void Add (const Contap_Point & P);

		/****************** Arc ******************/
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", ":rtype: opencascade::handle<Adaptor2d_HCurve2d>") Arc;
		const opencascade::handle<Adaptor2d_HCurve2d> & Arc ();

		/****************** Circle ******************/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", ":rtype: gp_Circ") Circle;
		gp_Circ Circle ();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", ":rtype: None") Clear;
		void Clear ();

		/****************** Contap_Line ******************/
		%feature("compactdefaultargs") Contap_Line;
		%feature("autodoc", ":rtype: None") Contap_Line;
		 Contap_Line ();

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", ":rtype: gp_Lin") Line;
		gp_Lin Line ();

		/****************** LineOn2S ******************/
		%feature("compactdefaultargs") LineOn2S;
		%feature("autodoc", ":rtype: opencascade::handle<IntSurf_LineOn2S>") LineOn2S;
		const opencascade::handle<IntSurf_LineOn2S> & LineOn2S ();

		/****************** NbPnts ******************/
		%feature("compactdefaultargs") NbPnts;
		%feature("autodoc", ":rtype: int") NbPnts;
		Standard_Integer NbPnts ();

		/****************** NbVertex ******************/
		%feature("compactdefaultargs") NbVertex;
		%feature("autodoc", ":rtype: int") NbVertex;
		Standard_Integer NbVertex ();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", ":param Index:
	:type Index: int
	:rtype: IntSurf_PntOn2S") Point;
		const IntSurf_PntOn2S & Point (const Standard_Integer Index);

		/****************** ResetSeqOfVertex ******************/
		%feature("compactdefaultargs") ResetSeqOfVertex;
		%feature("autodoc", ":rtype: None") ResetSeqOfVertex;
		void ResetSeqOfVertex ();

		/****************** SetLineOn2S ******************/
		%feature("compactdefaultargs") SetLineOn2S;
		%feature("autodoc", ":param L:
	:type L: IntSurf_LineOn2S
	:rtype: None") SetLineOn2S;
		void SetLineOn2S (const opencascade::handle<IntSurf_LineOn2S> & L);

		/****************** SetTransitionOnS ******************/
		%feature("compactdefaultargs") SetTransitionOnS;
		%feature("autodoc", "* Set The Tansition of the line.
	:param T:
	:type T: IntSurf_TypeTrans
	:rtype: None") SetTransitionOnS;
		void SetTransitionOnS (const IntSurf_TypeTrans T);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", ":param L:
	:type L: gp_Lin
	:rtype: None") SetValue;
		void SetValue (const gp_Lin & L);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", ":param C:
	:type C: gp_Circ
	:rtype: None") SetValue;
		void SetValue (const gp_Circ & C);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", ":param A:
	:type A: Adaptor2d_HCurve2d
	:rtype: None") SetValue;
		void SetValue (const opencascade::handle<Adaptor2d_HCurve2d> & A);

		/****************** TransitionOnS ******************/
		%feature("compactdefaultargs") TransitionOnS;
		%feature("autodoc", "* returns IN if at the 'left' of the line, the normale of the surface is oriented to the observator.
	:rtype: IntSurf_TypeTrans") TransitionOnS;
		IntSurf_TypeTrans TransitionOnS ();

		/****************** TypeContour ******************/
		%feature("compactdefaultargs") TypeContour;
		%feature("autodoc", "* Returns Contap_Lin for a line, Contap_Circle for a circle, and Contap_Walking for a Walking line, Contap_Restriction for a part of boundarie.
	:rtype: Contap_IType") TypeContour;
		Contap_IType TypeContour ();

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", ":param Index:
	:type Index: int
	:rtype: Contap_Point") Vertex;
		Contap_Point & Vertex (const Standard_Integer Index);

};


%extend Contap_Line {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class Contap_Point *
*********************/
class Contap_Point {
	public:
		/****************** Arc ******************/
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", "* Returns the arc of restriction containing the vertex.
	:rtype: opencascade::handle<Adaptor2d_HCurve2d>") Arc;
		const opencascade::handle<Adaptor2d_HCurve2d> & Arc ();

		/****************** Contap_Point ******************/
		%feature("compactdefaultargs") Contap_Point;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") Contap_Point;
		 Contap_Point ();

		/****************** Contap_Point ******************/
		%feature("compactdefaultargs") Contap_Point;
		%feature("autodoc", "* Creates a point.
	:param Pt:
	:type Pt: gp_Pnt
	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: None") Contap_Point;
		 Contap_Point (const gp_Pnt & Pt,const Standard_Real U,const Standard_Real V);

		/****************** IsInternal ******************/
		%feature("compactdefaultargs") IsInternal;
		%feature("autodoc", "* Returns True if the point is an internal one, i.e if the tangent to the line on the point and the eye direction are parallel.
	:rtype: bool") IsInternal;
		Standard_Boolean IsInternal ();

		/****************** IsMultiple ******************/
		%feature("compactdefaultargs") IsMultiple;
		%feature("autodoc", "* Returns True if the point belongs to several lines.
	:rtype: bool") IsMultiple;
		Standard_Boolean IsMultiple ();

		/****************** IsOnArc ******************/
		%feature("compactdefaultargs") IsOnArc;
		%feature("autodoc", "* Returns True when the point is an intersection between the contour and a restriction.
	:rtype: bool") IsOnArc;
		Standard_Boolean IsOnArc ();

		/****************** IsVertex ******************/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "* Returns True if the point is a vertex on the initial restriction facet of the surface.
	:rtype: bool") IsVertex;
		Standard_Boolean IsVertex ();

		/****************** ParameterOnArc ******************/
		%feature("compactdefaultargs") ParameterOnArc;
		%feature("autodoc", "* Returns the parameter of the point on the arc returned by the method Arc().
	:rtype: float") ParameterOnArc;
		Standard_Real ParameterOnArc ();

		/****************** ParameterOnLine ******************/
		%feature("compactdefaultargs") ParameterOnLine;
		%feature("autodoc", "* This method returns the parameter of the point on the intersection line. If the points does not belong to an intersection line, the value returned does not have any sens.
	:rtype: float") ParameterOnLine;
		Standard_Real ParameterOnLine ();

		/****************** Parameters ******************/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "* Returns the parameters on the surface of the point.
	:param U1:
	:type U1: float
	:param V1:
	:type V1: float
	:rtype: None") Parameters;
		void Parameters (Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** SetArc ******************/
		%feature("compactdefaultargs") SetArc;
		%feature("autodoc", "* Sets the value of the arc and of the parameter on this arc of the point.
	:param A:
	:type A: Adaptor2d_HCurve2d
	:param Param:
	:type Param: float
	:param TLine:
	:type TLine: IntSurf_Transition
	:param TArc:
	:type TArc: IntSurf_Transition
	:rtype: None") SetArc;
		void SetArc (const opencascade::handle<Adaptor2d_HCurve2d> & A,const Standard_Real Param,const IntSurf_Transition & TLine,const IntSurf_Transition & TArc);

		/****************** SetInternal ******************/
		%feature("compactdefaultargs") SetInternal;
		%feature("autodoc", ":rtype: None") SetInternal;
		void SetInternal ();

		/****************** SetMultiple ******************/
		%feature("compactdefaultargs") SetMultiple;
		%feature("autodoc", ":rtype: None") SetMultiple;
		void SetMultiple ();

		/****************** SetParameter ******************/
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "* Set the value of the parameter on the intersection line.
	:param Para:
	:type Para: float
	:rtype: None") SetParameter;
		void SetParameter (const Standard_Real Para);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "* Sets the values for a point.
	:param Pt:
	:type Pt: gp_Pnt
	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: None") SetValue;
		void SetValue (const gp_Pnt & Pt,const Standard_Real U,const Standard_Real V);

		/****************** SetVertex ******************/
		%feature("compactdefaultargs") SetVertex;
		%feature("autodoc", "* Sets the values of a point which is a vertex on the initial facet of restriction of one of the surface.
	:param V:
	:type V: Adaptor3d_HVertex
	:rtype: None") SetVertex;
		void SetVertex (const opencascade::handle<Adaptor3d_HVertex> & V);

		/****************** TransitionOnArc ******************/
		%feature("compactdefaultargs") TransitionOnArc;
		%feature("autodoc", "* Returns the transition of the point on the arc.
	:rtype: IntSurf_Transition") TransitionOnArc;
		const IntSurf_Transition & TransitionOnArc ();

		/****************** TransitionOnLine ******************/
		%feature("compactdefaultargs") TransitionOnLine;
		%feature("autodoc", "* Returns the transition of the point on the contour.
	:rtype: IntSurf_Transition") TransitionOnLine;
		const IntSurf_Transition & TransitionOnLine ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the intersection point (geometric information).
	:rtype: gp_Pnt") Value;
		const gp_Pnt  Value ();

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "* Returns the information about the point when it is on the domain of the patch, i-e when the function IsVertex returns True. Otherwise, an exception is raised.
	:rtype: opencascade::handle<Adaptor3d_HVertex>") Vertex;
		const opencascade::handle<Adaptor3d_HVertex> & Vertex ();

};


%extend Contap_Point {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Contap_SurfFunction *
****************************/
class Contap_SurfFunction : public math_FunctionSetWithDerivatives {
	public:
		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", ":rtype: float") Angle;
		Standard_Real Angle ();

		/****************** Contap_SurfFunction ******************/
		%feature("compactdefaultargs") Contap_SurfFunction;
		%feature("autodoc", ":rtype: None") Contap_SurfFunction;
		 Contap_SurfFunction ();

		/****************** Derivatives ******************/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "* The dimension of D is (1,2).
	:param X:
	:type X: math_Vector
	:param D:
	:type D: math_Matrix
	:rtype: bool") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);

		/****************** Direction ******************/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", ":rtype: gp_Dir") Direction;
		const gp_Dir  Direction ();

		/****************** Direction2d ******************/
		%feature("compactdefaultargs") Direction2d;
		%feature("autodoc", ":rtype: gp_Dir2d") Direction2d;
		const gp_Dir2d  Direction2d ();

		/****************** Direction3d ******************/
		%feature("compactdefaultargs") Direction3d;
		%feature("autodoc", ":rtype: gp_Vec") Direction3d;
		const gp_Vec  Direction3d ();

		/****************** Eye ******************/
		%feature("compactdefaultargs") Eye;
		%feature("autodoc", ":rtype: gp_Pnt") Eye;
		const gp_Pnt  Eye ();

		/****************** FunctionType ******************/
		%feature("compactdefaultargs") FunctionType;
		%feature("autodoc", ":rtype: Contap_TFunction") FunctionType;
		Contap_TFunction FunctionType ();

		/****************** IsTangent ******************/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", ":rtype: bool") IsTangent;
		Standard_Boolean IsTangent ();

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "* This method has to return 1.
	:rtype: int") NbEquations;
		Standard_Integer NbEquations ();

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "* This method has to return 2.
	:rtype: int") NbVariables;
		Standard_Integer NbVariables ();

		/****************** PSurface ******************/
		%feature("compactdefaultargs") PSurface;
		%feature("autodoc", "* Method is entered for compatibility with IntPatch_TheSurfFunction.
	:rtype: opencascade::handle<Adaptor3d_HSurface>") PSurface;
		const opencascade::handle<Adaptor3d_HSurface> & PSurface ();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "* Returns the value of the solution point on the surface.
	:rtype: gp_Pnt") Point;
		const gp_Pnt  Point ();

		/****************** Root ******************/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "* Root is the value of the function at the solution. It is a vector of dimension 1, i-e a real.
	:rtype: float") Root;
		Standard_Real Root ();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:rtype: None") Set;
		void Set (const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", ":param Eye:
	:type Eye: gp_Pnt
	:rtype: None") Set;
		void Set (const gp_Pnt & Eye);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", ":param Dir:
	:type Dir: gp_Dir
	:rtype: None") Set;
		void Set (const gp_Dir & Dir);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", ":param Dir:
	:type Dir: gp_Dir
	:param Angle:
	:type Angle: float
	:rtype: None") Set;
		void Set (const gp_Dir & Dir,const Standard_Real Angle);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", ":param Eye:
	:type Eye: gp_Pnt
	:param Angle:
	:type Angle: float
	:rtype: None") Set;
		void Set (const gp_Pnt & Eye,const Standard_Real Angle);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", ":param Tolerance:
	:type Tolerance: float
	:rtype: None") Set;
		void Set (const Standard_Real Tolerance);

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", ":rtype: opencascade::handle<Adaptor3d_HSurface>") Surface;
		const opencascade::handle<Adaptor3d_HSurface> & Surface ();

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "* Returns the value Tol so that if Abs(Func.Root())<Tol the function is considered null.
	:rtype: float") Tolerance;
		Standard_Real Tolerance ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* The dimension of F is 1.
	:param X:
	:type X: math_Vector
	:param F:
	:type F: math_Vector
	:rtype: bool") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", ":param X:
	:type X: math_Vector
	:param F:
	:type F: math_Vector
	:param D:
	:type D: math_Matrix
	:rtype: bool") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);

};


%extend Contap_SurfFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Contap_SurfProps *
*************************/
class Contap_SurfProps {
	public:
		/****************** DerivAndNorm ******************/
		%feature("compactdefaultargs") DerivAndNorm;
		%feature("autodoc", "* Computes the point <P>, and normal vector <N> on <S> at parameters U,V.
	:param S:
	:type S: Adaptor3d_HSurface
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
	:rtype: void") DerivAndNorm;
		static void DerivAndNorm (const opencascade::handle<Adaptor3d_HSurface> & S,const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & d1u,gp_Vec & d1v,gp_Vec & N);

		/****************** NormAndDn ******************/
		%feature("compactdefaultargs") NormAndDn;
		%feature("autodoc", "* Computes the point <P>, normal vector <N>, and its derivatives <Dnu> and <Dnv> on <S> at parameters U,V.
	:param S:
	:type S: Adaptor3d_HSurface
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
	:rtype: void") NormAndDn;
		static void NormAndDn (const opencascade::handle<Adaptor3d_HSurface> & S,const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & N,gp_Vec & Dnu,gp_Vec & Dnv);

		/****************** Normale ******************/
		%feature("compactdefaultargs") Normale;
		%feature("autodoc", "* Computes the point <P>, and normal vector <N> on <S> at parameters U,V.
	:param S:
	:type S: Adaptor3d_HSurface
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:param N:
	:type N: gp_Vec
	:rtype: void") Normale;
		static void Normale (const opencascade::handle<Adaptor3d_HSurface> & S,const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & N);

};


%extend Contap_SurfProps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class Contap_TheIWLineOfTheIWalking *
**************************************/
class Contap_TheIWLineOfTheIWalking : public Standard_Transient {
	public:
		/****************** AddIndexPassing ******************/
		%feature("compactdefaultargs") AddIndexPassing;
		%feature("autodoc", "* associer a l 'indice du point sur la ligne l'indice du point passant dans l'iterateur de depart
	:param Index:
	:type Index: int
	:rtype: None") AddIndexPassing;
		void AddIndexPassing (const Standard_Integer Index);

		/****************** AddPoint ******************/
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "* Add a point in the line.
	:param P:
	:type P: IntSurf_PntOn2S
	:rtype: None") AddPoint;
		void AddPoint (const IntSurf_PntOn2S & P);

		/****************** AddStatusFirst ******************/
		%feature("compactdefaultargs") AddStatusFirst;
		%feature("autodoc", ":param Closed:
	:type Closed: bool
	:param HasFirst:
	:type HasFirst: bool
	:rtype: None") AddStatusFirst;
		void AddStatusFirst (const Standard_Boolean Closed,const Standard_Boolean HasFirst);

		/****************** AddStatusFirst ******************/
		%feature("compactdefaultargs") AddStatusFirst;
		%feature("autodoc", ":param Closed:
	:type Closed: bool
	:param HasLast:
	:type HasLast: bool
	:param Index:
	:type Index: int
	:param P:
	:type P: IntSurf_PathPoint
	:rtype: None") AddStatusFirst;
		void AddStatusFirst (const Standard_Boolean Closed,const Standard_Boolean HasLast,const Standard_Integer Index,const IntSurf_PathPoint & P);

		/****************** AddStatusFirstLast ******************/
		%feature("compactdefaultargs") AddStatusFirstLast;
		%feature("autodoc", ":param Closed:
	:type Closed: bool
	:param HasFirst:
	:type HasFirst: bool
	:param HasLast:
	:type HasLast: bool
	:rtype: None") AddStatusFirstLast;
		void AddStatusFirstLast (const Standard_Boolean Closed,const Standard_Boolean HasFirst,const Standard_Boolean HasLast);

		/****************** AddStatusLast ******************/
		%feature("compactdefaultargs") AddStatusLast;
		%feature("autodoc", ":param HasLast:
	:type HasLast: bool
	:rtype: None") AddStatusLast;
		void AddStatusLast (const Standard_Boolean HasLast);

		/****************** AddStatusLast ******************/
		%feature("compactdefaultargs") AddStatusLast;
		%feature("autodoc", ":param HasLast:
	:type HasLast: bool
	:param Index:
	:type Index: int
	:param P:
	:type P: IntSurf_PathPoint
	:rtype: None") AddStatusLast;
		void AddStatusLast (const Standard_Boolean HasLast,const Standard_Integer Index,const IntSurf_PathPoint & P);

		/****************** Contap_TheIWLineOfTheIWalking ******************/
		%feature("compactdefaultargs") Contap_TheIWLineOfTheIWalking;
		%feature("autodoc", ":param theAllocator: default value is 0
	:type theAllocator: IntSurf_Allocator
	:rtype: None") Contap_TheIWLineOfTheIWalking;
		 Contap_TheIWLineOfTheIWalking (const IntSurf_Allocator & theAllocator = 0);

		/****************** Cut ******************/
		%feature("compactdefaultargs") Cut;
		%feature("autodoc", "* Cut the line at the point of rank Index.
	:param Index:
	:type Index: int
	:rtype: None") Cut;
		void Cut (const Standard_Integer Index);

		/****************** FirstPoint ******************/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "* Returns the first point of the line when it is a marching point. An exception is raised if HasFirstPoint returns False.
	:rtype: IntSurf_PathPoint") FirstPoint;
		const IntSurf_PathPoint & FirstPoint ();

		/****************** FirstPointIndex ******************/
		%feature("compactdefaultargs") FirstPointIndex;
		%feature("autodoc", "* Returns the Index of first point of the line when it is a marching point.This index is the index in the PointStartIterator. An exception is raised if HasFirstPoint returns False.
	:rtype: int") FirstPointIndex;
		Standard_Integer FirstPointIndex ();

		/****************** HasFirstPoint ******************/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "* Returns True if the first point of the line is a marching point . when is HasFirstPoint==False ,the line begins on the natural bound of the surface.the line can be too long
	:rtype: bool") HasFirstPoint;
		Standard_Boolean HasFirstPoint ();

		/****************** HasLastPoint ******************/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "* Returns True if the end point of the line is a marching point (Point from IntWS). when is HasFirstPoint==False ,the line ends on the natural bound of the surface.the line can be too long.
	:rtype: bool") HasLastPoint;
		Standard_Boolean HasLastPoint ();

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "* Returns True if the line is closed.
	:rtype: bool") IsClosed;
		Standard_Boolean IsClosed ();

		/****************** IsTangentAtBegining ******************/
		%feature("compactdefaultargs") IsTangentAtBegining;
		%feature("autodoc", ":rtype: bool") IsTangentAtBegining;
		Standard_Boolean IsTangentAtBegining ();

		/****************** IsTangentAtEnd ******************/
		%feature("compactdefaultargs") IsTangentAtEnd;
		%feature("autodoc", ":rtype: bool") IsTangentAtEnd;
		Standard_Boolean IsTangentAtEnd ();

		/****************** LastPoint ******************/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "* Returns the last point of the line when it is a marching point. An exception is raised if HasLastPoint returns False.
	:rtype: IntSurf_PathPoint") LastPoint;
		const IntSurf_PathPoint & LastPoint ();

		/****************** LastPointIndex ******************/
		%feature("compactdefaultargs") LastPointIndex;
		%feature("autodoc", "* Returns the index of last point of the line when it is a marching point.This index is the index in the PointStartIterator. An exception is raised if HasLastPoint returns False.
	:rtype: int") LastPointIndex;
		Standard_Integer LastPointIndex ();

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "* Returns the LineOn2S contained in the walking line.
	:rtype: opencascade::handle<IntSurf_LineOn2S>") Line;
		const opencascade::handle<IntSurf_LineOn2S> & Line ();

		/****************** NbPassingPoint ******************/
		%feature("compactdefaultargs") NbPassingPoint;
		%feature("autodoc", "* returns the number of points belonging to Pnts1 which are passing point.
	:rtype: int") NbPassingPoint;
		Standard_Integer NbPassingPoint ();

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "* Returns the number of points of the line (including first point and end point : see HasLastPoint and HasFirstPoint).
	:rtype: int") NbPoints;
		Standard_Integer NbPoints ();

		/****************** PassingPoint ******************/
		%feature("compactdefaultargs") PassingPoint;
		%feature("autodoc", "* returns the index of the point belonging to the line which is associated to the passing point belonging to Pnts1 an exception is raised if Index > NbPassingPoint()
	:param Index:
	:type Index: int
	:param IndexLine:
	:type IndexLine: int
	:param IndexPnts:
	:type IndexPnts: int
	:rtype: None") PassingPoint;
		void PassingPoint (const Standard_Integer Index,Standard_Integer &OutValue,Standard_Integer &OutValue);

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "* reverse the points in the line. Hasfirst, HasLast are kept.
	:rtype: None") Reverse;
		void Reverse ();

		/****************** SetTangencyAtBegining ******************/
		%feature("compactdefaultargs") SetTangencyAtBegining;
		%feature("autodoc", ":param IsTangent:
	:type IsTangent: bool
	:rtype: None") SetTangencyAtBegining;
		void SetTangencyAtBegining (const Standard_Boolean IsTangent);

		/****************** SetTangencyAtEnd ******************/
		%feature("compactdefaultargs") SetTangencyAtEnd;
		%feature("autodoc", ":param IsTangent:
	:type IsTangent: bool
	:rtype: None") SetTangencyAtEnd;
		void SetTangencyAtEnd (const Standard_Boolean IsTangent);

		/****************** SetTangentVector ******************/
		%feature("compactdefaultargs") SetTangentVector;
		%feature("autodoc", ":param V:
	:type V: gp_Vec
	:param Index:
	:type Index: int
	:rtype: None") SetTangentVector;
		void SetTangentVector (const gp_Vec & V,const Standard_Integer Index);

		/****************** TangentVector ******************/
		%feature("compactdefaultargs") TangentVector;
		%feature("autodoc", ":param Index:
	:type Index: int
	:rtype: gp_Vec") TangentVector;
		const gp_Vec  TangentVector (Standard_Integer &OutValue);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the point of range Index. If index <= 0 or Index > NbPoints, an exception is raised.
	:param Index:
	:type Index: int
	:rtype: IntSurf_PntOn2S") Value;
		const IntSurf_PntOn2S & Value (const Standard_Integer Index);

};


%make_alias(Contap_TheIWLineOfTheIWalking)

%extend Contap_TheIWLineOfTheIWalking {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Contap_TheIWalking *
***************************/
class Contap_TheIWalking {
	public:
		/****************** Contap_TheIWalking ******************/
		%feature("compactdefaultargs") Contap_TheIWalking;
		%feature("autodoc", "* Deflection is the maximum deflection admitted between two consecutive points on a resulting polyline. Step is the maximum increment admitted between two consecutive points (in 2d space). Epsilon is the tolerance beyond which 2 points are confused. theToFillHoles is the flag defining whether possible holes between resulting curves are filled or not in case of Contap walking theToFillHoles is True
	:param Epsilon:
	:type Epsilon: float
	:param Deflection:
	:type Deflection: float
	:param Step:
	:type Step: float
	:param theToFillHoles: default value is Standard_False
	:type theToFillHoles: bool
	:rtype: None") Contap_TheIWalking;
		 Contap_TheIWalking (const Standard_Real Epsilon,const Standard_Real Deflection,const Standard_Real Step,const Standard_Boolean theToFillHoles = Standard_False);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* Returns true if the calculus was successful.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** NbLines ******************/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "* Returns the number of resulting polylines. An exception is raised if IsDone returns False.
	:rtype: int") NbLines;
		Standard_Integer NbLines ();

		/****************** NbSinglePnts ******************/
		%feature("compactdefaultargs") NbSinglePnts;
		%feature("autodoc", "* Returns the number of points belonging to Pnts on which no line starts or ends. An exception is raised if IsDone returns False.
	:rtype: int") NbSinglePnts;
		Standard_Integer NbSinglePnts ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Searches a set of polylines starting on a point of Pnts1 or Pnts2. Each point on a resulting polyline verifies F(u,v)=0
	:param Pnts1:
	:type Pnts1: IntSurf_SequenceOfPathPoint
	:param Pnts2:
	:type Pnts2: IntSurf_SequenceOfInteriorPoint
	:param Func:
	:type Func: Contap_SurfFunction
	:param S:
	:type S: Adaptor3d_HSurface
	:param Reversed: default value is Standard_False
	:type Reversed: bool
	:rtype: None") Perform;
		void Perform (const IntSurf_SequenceOfPathPoint & Pnts1,const IntSurf_SequenceOfInteriorPoint & Pnts2,Contap_SurfFunction & Func,const opencascade::handle<Adaptor3d_HSurface> & S,const Standard_Boolean Reversed = Standard_False);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Searches a set of polylines starting on a point of Pnts1. Each point on a resulting polyline verifies F(u,v)=0
	:param Pnts1:
	:type Pnts1: IntSurf_SequenceOfPathPoint
	:param Func:
	:type Func: Contap_SurfFunction
	:param S:
	:type S: Adaptor3d_HSurface
	:param Reversed: default value is Standard_False
	:type Reversed: bool
	:rtype: None") Perform;
		void Perform (const IntSurf_SequenceOfPathPoint & Pnts1,Contap_SurfFunction & Func,const opencascade::handle<Adaptor3d_HSurface> & S,const Standard_Boolean Reversed = Standard_False);

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "* Deflection is the maximum deflection admitted between two consecutive points on a resulting polyline. Step is the maximum increment admitted between two consecutive points (in 2d space). Epsilon is the tolerance beyond which 2 points are confused
	:param Epsilon:
	:type Epsilon: float
	:param Deflection:
	:type Deflection: float
	:param Step:
	:type Step: float
	:rtype: None") SetTolerance;
		void SetTolerance (const Standard_Real Epsilon,const Standard_Real Deflection,const Standard_Real Step);

		/****************** SinglePnt ******************/
		%feature("compactdefaultargs") SinglePnt;
		%feature("autodoc", "* Returns the point of range Index . An exception is raised if IsDone returns False. An exception is raised if Index<=0 or Index > NbSinglePnts.
	:param Index:
	:type Index: int
	:rtype: IntSurf_PathPoint") SinglePnt;
		const IntSurf_PathPoint & SinglePnt (const Standard_Integer Index);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the polyline of range Index. An exception is raised if IsDone is False. An exception is raised if Index<=0 or Index>NbLines.
	:param Index:
	:type Index: int
	:rtype: opencascade::handle<Contap_TheIWLineOfTheIWalking>") Value;
		const opencascade::handle<Contap_TheIWLineOfTheIWalking> & Value (const Standard_Integer Index);

};


%extend Contap_TheIWalking {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class Contap_ThePathPointOfTheSearch *
***************************************/
class Contap_ThePathPointOfTheSearch {
	public:
		/****************** Arc ******************/
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", ":rtype: opencascade::handle<Adaptor2d_HCurve2d>") Arc;
		const opencascade::handle<Adaptor2d_HCurve2d> & Arc ();

		/****************** Contap_ThePathPointOfTheSearch ******************/
		%feature("compactdefaultargs") Contap_ThePathPointOfTheSearch;
		%feature("autodoc", ":rtype: None") Contap_ThePathPointOfTheSearch;
		 Contap_ThePathPointOfTheSearch ();

		/****************** Contap_ThePathPointOfTheSearch ******************/
		%feature("compactdefaultargs") Contap_ThePathPointOfTheSearch;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:param Tol:
	:type Tol: float
	:param V:
	:type V: Adaptor3d_HVertex
	:param A:
	:type A: Adaptor2d_HCurve2d
	:param Parameter:
	:type Parameter: float
	:rtype: None") Contap_ThePathPointOfTheSearch;
		 Contap_ThePathPointOfTheSearch (const gp_Pnt & P,const Standard_Real Tol,const opencascade::handle<Adaptor3d_HVertex> & V,const opencascade::handle<Adaptor2d_HCurve2d> & A,const Standard_Real Parameter);

		/****************** Contap_ThePathPointOfTheSearch ******************/
		%feature("compactdefaultargs") Contap_ThePathPointOfTheSearch;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:param Tol:
	:type Tol: float
	:param A:
	:type A: Adaptor2d_HCurve2d
	:param Parameter:
	:type Parameter: float
	:rtype: None") Contap_ThePathPointOfTheSearch;
		 Contap_ThePathPointOfTheSearch (const gp_Pnt & P,const Standard_Real Tol,const opencascade::handle<Adaptor2d_HCurve2d> & A,const Standard_Real Parameter);

		/****************** IsNew ******************/
		%feature("compactdefaultargs") IsNew;
		%feature("autodoc", ":rtype: bool") IsNew;
		Standard_Boolean IsNew ();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", ":rtype: float") Parameter;
		Standard_Real Parameter ();

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:param Tol:
	:type Tol: float
	:param V:
	:type V: Adaptor3d_HVertex
	:param A:
	:type A: Adaptor2d_HCurve2d
	:param Parameter:
	:type Parameter: float
	:rtype: None") SetValue;
		void SetValue (const gp_Pnt & P,const Standard_Real Tol,const opencascade::handle<Adaptor3d_HVertex> & V,const opencascade::handle<Adaptor2d_HCurve2d> & A,const Standard_Real Parameter);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:param Tol:
	:type Tol: float
	:param A:
	:type A: Adaptor2d_HCurve2d
	:param Parameter:
	:type Parameter: float
	:rtype: None") SetValue;
		void SetValue (const gp_Pnt & P,const Standard_Real Tol,const opencascade::handle<Adaptor2d_HCurve2d> & A,const Standard_Real Parameter);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", ":rtype: float") Tolerance;
		Standard_Real Tolerance ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: gp_Pnt") Value;
		const gp_Pnt  Value ();

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", ":rtype: opencascade::handle<Adaptor3d_HVertex>") Vertex;
		const opencascade::handle<Adaptor3d_HVertex> & Vertex ();

};


%extend Contap_ThePathPointOfTheSearch {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Contap_TheSearch *
*************************/
class Contap_TheSearch {
	public:
		/****************** AllArcSolution ******************/
		%feature("compactdefaultargs") AllArcSolution;
		%feature("autodoc", "* Returns true if all arc of the Arcs are solution (inside the surface). An exception is raised if IsDone returns False.
	:rtype: bool") AllArcSolution;
		Standard_Boolean AllArcSolution ();

		/****************** Contap_TheSearch ******************/
		%feature("compactdefaultargs") Contap_TheSearch;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") Contap_TheSearch;
		 Contap_TheSearch ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* Returns True if the calculus was successful.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "* Returns the number of resulting points. An exception is raised if IsDone returns False (NotDone).
	:rtype: int") NbPoints;
		Standard_Integer NbPoints ();

		/****************** NbSegments ******************/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "* Returns the number of the resulting segments. An exception is raised if IsDone returns False (NotDone).
	:rtype: int") NbSegments;
		Standard_Integer NbSegments ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Algorithm to find the points and parts of curves of Domain (domain of of restriction of a surface) which verify F = 0. TolBoundary defines if a curve is on Q. TolTangency defines if a point is on Q.
	:param F:
	:type F: Contap_ArcFunction
	:param Domain:
	:type Domain: Adaptor3d_TopolTool
	:param TolBoundary:
	:type TolBoundary: float
	:param TolTangency:
	:type TolTangency: float
	:param RecheckOnRegularity: default value is Standard_False
	:type RecheckOnRegularity: bool
	:rtype: None") Perform;
		void Perform (Contap_ArcFunction & F,const opencascade::handle<Adaptor3d_TopolTool> & Domain,const Standard_Real TolBoundary,const Standard_Real TolTangency,const Standard_Boolean RecheckOnRegularity = Standard_False);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "* Returns the resulting point of range Index. The exception NotDone is raised if IsDone() returns False. The exception OutOfRange is raised if Index <= 0 or Index > NbPoints.
	:param Index:
	:type Index: int
	:rtype: Contap_ThePathPointOfTheSearch") Point;
		const Contap_ThePathPointOfTheSearch & Point (const Standard_Integer Index);

		/****************** Segment ******************/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "* Returns the resulting segment of range Index. The exception NotDone is raised if IsDone() returns False. The exception OutOfRange is raised if Index <= 0 or Index > NbPoints.
	:param Index:
	:type Index: int
	:rtype: Contap_TheSegmentOfTheSearch") Segment;
		const Contap_TheSegmentOfTheSearch & Segment (const Standard_Integer Index);

};


%extend Contap_TheSearch {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Contap_TheSearchInside *
*******************************/
class Contap_TheSearchInside {
	public:
		/****************** Contap_TheSearchInside ******************/
		%feature("compactdefaultargs") Contap_TheSearchInside;
		%feature("autodoc", ":rtype: None") Contap_TheSearchInside;
		 Contap_TheSearchInside ();

		/****************** Contap_TheSearchInside ******************/
		%feature("compactdefaultargs") Contap_TheSearchInside;
		%feature("autodoc", ":param F:
	:type F: Contap_SurfFunction
	:param Surf:
	:type Surf: Adaptor3d_HSurface
	:param T:
	:type T: Adaptor3d_TopolTool
	:param Epsilon:
	:type Epsilon: float
	:rtype: None") Contap_TheSearchInside;
		 Contap_TheSearchInside (Contap_SurfFunction & F,const opencascade::handle<Adaptor3d_HSurface> & Surf,const opencascade::handle<Adaptor3d_TopolTool> & T,const Standard_Real Epsilon);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", ":rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "* Returns the number of points. The exception NotDone if raised if IsDone returns False.
	:rtype: int") NbPoints;
		Standard_Integer NbPoints ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param F:
	:type F: Contap_SurfFunction
	:param Surf:
	:type Surf: Adaptor3d_HSurface
	:param T:
	:type T: Adaptor3d_TopolTool
	:param Epsilon:
	:type Epsilon: float
	:rtype: None") Perform;
		void Perform (Contap_SurfFunction & F,const opencascade::handle<Adaptor3d_HSurface> & Surf,const opencascade::handle<Adaptor3d_TopolTool> & T,const Standard_Real Epsilon);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param F:
	:type F: Contap_SurfFunction
	:param Surf:
	:type Surf: Adaptor3d_HSurface
	:param UStart:
	:type UStart: float
	:param VStart:
	:type VStart: float
	:rtype: None") Perform;
		void Perform (Contap_SurfFunction & F,const opencascade::handle<Adaptor3d_HSurface> & Surf,const Standard_Real UStart,const Standard_Real VStart);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the point of range Index. The exception NotDone if raised if IsDone returns False. The exception OutOfRange if raised if Index <= 0 or Index > NbPoints.
	:param Index:
	:type Index: int
	:rtype: IntSurf_InteriorPoint") Value;
		const IntSurf_InteriorPoint & Value (const Standard_Integer Index);

};


%extend Contap_TheSearchInside {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class Contap_TheSegmentOfTheSearch *
*************************************/
class Contap_TheSegmentOfTheSearch {
	public:
		/****************** Contap_TheSegmentOfTheSearch ******************/
		%feature("compactdefaultargs") Contap_TheSegmentOfTheSearch;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") Contap_TheSegmentOfTheSearch;
		 Contap_TheSegmentOfTheSearch ();

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "* Returns the geometric curve on the surface 's domain which is solution.
	:rtype: opencascade::handle<Adaptor2d_HCurve2d>") Curve;
		const opencascade::handle<Adaptor2d_HCurve2d> & Curve ();

		/****************** FirstPoint ******************/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "* Returns the first point.
	:rtype: Contap_ThePathPointOfTheSearch") FirstPoint;
		const Contap_ThePathPointOfTheSearch & FirstPoint ();

		/****************** HasFirstPoint ******************/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "* Returns True if there is a vertex (ThePathPoint) defining the lowest valid parameter on the arc.
	:rtype: bool") HasFirstPoint;
		Standard_Boolean HasFirstPoint ();

		/****************** HasLastPoint ******************/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "* Returns True if there is a vertex (ThePathPoint) defining the greatest valid parameter on the arc.
	:rtype: bool") HasLastPoint;
		Standard_Boolean HasLastPoint ();

		/****************** LastPoint ******************/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "* Returns the last point.
	:rtype: Contap_ThePathPointOfTheSearch") LastPoint;
		const Contap_ThePathPointOfTheSearch & LastPoint ();

		/****************** SetLimitPoint ******************/
		%feature("compactdefaultargs") SetLimitPoint;
		%feature("autodoc", "* Defines the first point or the last point, depending on the value of the boolean First.
	:param V:
	:type V: Contap_ThePathPointOfTheSearch
	:param First:
	:type First: bool
	:rtype: None") SetLimitPoint;
		void SetLimitPoint (const Contap_ThePathPointOfTheSearch & V,const Standard_Boolean First);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "* Defines the concerned arc.
	:param A:
	:type A: Adaptor2d_HCurve2d
	:rtype: None") SetValue;
		void SetValue (const opencascade::handle<Adaptor2d_HCurve2d> & A);

};


%extend Contap_TheSegmentOfTheSearch {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
class Contap_TheHSequenceOfPoint : public  Contap_TheSequenceOfPoint, public Standard_Transient {
  public:
    Contap_TheHSequenceOfPoint();
    Contap_TheHSequenceOfPoint(const  Contap_TheSequenceOfPoint& theOther);
    const  Contap_TheSequenceOfPoint& Sequence();
    void Append (const  Contap_TheSequenceOfPoint::value_type& theItem);
    void Append ( Contap_TheSequenceOfPoint& theSequence);
     Contap_TheSequenceOfPoint& ChangeSequence();
};
%make_alias(Contap_TheHSequenceOfPoint)


