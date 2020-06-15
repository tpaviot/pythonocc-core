/*
Copyright 2008-2020 Thomas Paviot (tpaviot@gmail.com)

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
#include<Message_module.hxx>
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

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

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

/* python proy classes for enums */
%pythoncode {

class Contap_IType(IntEnum):
	Contap_Lin = 0
	Contap_Circle = 1
	Contap_Walking = 2
	Contap_Restriction = 3
Contap_Lin = Contap_IType.Contap_Lin
Contap_Circle = Contap_IType.Contap_Circle
Contap_Walking = Contap_IType.Contap_Walking
Contap_Restriction = Contap_IType.Contap_Restriction

class Contap_TFunction(IntEnum):
	Contap_ContourStd = 0
	Contap_ContourPrs = 1
	Contap_DraftStd = 2
	Contap_DraftPrs = 3
Contap_ContourStd = Contap_TFunction.Contap_ContourStd
Contap_ContourPrs = Contap_TFunction.Contap_ContourPrs
Contap_DraftStd = Contap_TFunction.Contap_DraftStd
Contap_DraftPrs = Contap_TFunction.Contap_DraftPrs
};
/* end python proxy for enums */

/* handles */
%wrap_handle(Contap_TheIWLineOfTheIWalking)
%wrap_handle(Contap_TheHSequenceOfPoint)
/* end handles declaration */

/* templates */
%template(Contap_SequenceOfIWLineOfTheIWalking) NCollection_Sequence<opencascade::handle<Contap_TheIWLineOfTheIWalking>>;

%extend NCollection_Sequence<opencascade::handle<Contap_TheIWLineOfTheIWalking>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(Contap_SequenceOfPathPointOfTheSearch) NCollection_Sequence<Contap_ThePathPointOfTheSearch>;

%extend NCollection_Sequence<Contap_ThePathPointOfTheSearch> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(Contap_SequenceOfSegmentOfTheSearch) NCollection_Sequence<Contap_TheSegmentOfTheSearch>;

%extend NCollection_Sequence<Contap_TheSegmentOfTheSearch> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(Contap_TheSequenceOfLine) NCollection_Sequence<Contap_Line>;

%extend NCollection_Sequence<Contap_Line> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(Contap_TheSequenceOfPoint) NCollection_Sequence<Contap_Point>;

%extend NCollection_Sequence<Contap_Point> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence<opencascade::handle<Contap_TheIWLineOfTheIWalking>> Contap_SequenceOfIWLineOfTheIWalking;
typedef NCollection_Sequence<Contap_ThePathPointOfTheSearch> Contap_SequenceOfPathPointOfTheSearch;
typedef NCollection_Sequence<Contap_TheSegmentOfTheSearch> Contap_SequenceOfSegmentOfTheSearch;
typedef NCollection_Sequence<Contap_Line> Contap_TheSequenceOfLine;
typedef NCollection_Sequence<Contap_Point> Contap_TheSequenceOfPoint;
/* end typedefs declaration */

/***************************
* class Contap_ArcFunction *
***************************/
class Contap_ArcFunction : public math_FunctionWithDerivative {
	public:
		/****************** Contap_ArcFunction ******************/
		%feature("compactdefaultargs") Contap_ArcFunction;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Contap_ArcFunction;
		 Contap_ArcFunction();

		/****************** Derivative ******************/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: float

Returns
-------
D: float
") Derivative;
		Standard_Boolean Derivative(const Standard_Real X, Standard_Real &OutValue);

		/****************** GetStateNumber ******************/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****************** LastComputedPoint ******************/
		%feature("compactdefaultargs") LastComputedPoint;
		%feature("autodoc", "Returns the point, which has been computed while the last calling value() method.

Returns
-------
gp_Pnt
") LastComputedPoint;
		const gp_Pnt LastComputedPoint();

		/****************** NbSamples ******************/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbSamples;
		Standard_Integer NbSamples();

		/****************** Quadric ******************/
		%feature("compactdefaultargs") Quadric;
		%feature("autodoc", "No available documentation.

Returns
-------
IntSurf_Quadric
") Quadric;
		const IntSurf_Quadric & Quadric();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_HSurface

Returns
-------
None
") Set;
		void Set(const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Direction: gp_Dir

Returns
-------
None
") Set;
		void Set(const gp_Dir & Direction);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Direction: gp_Dir
Angle: float

Returns
-------
None
") Set;
		void Set(const gp_Dir & Direction, const Standard_Real Angle);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Eye: gp_Pnt

Returns
-------
None
") Set;
		void Set(const gp_Pnt & Eye);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Eye: gp_Pnt
Angle: float

Returns
-------
None
") Set;
		void Set(const gp_Pnt & Eye, const Standard_Real Angle);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: Adaptor2d_HCurve2d

Returns
-------
None
") Set;
		void Set(const opencascade::handle<Adaptor2d_HCurve2d> & A);

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Returns mysurf field.

Returns
-------
opencascade::handle<Adaptor3d_HSurface>
") Surface;
		const opencascade::handle<Adaptor3d_HSurface> & Surface();

		/****************** Valpoint ******************/
		%feature("compactdefaultargs") Valpoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
gp_Pnt
") Valpoint;
		const gp_Pnt Valpoint(const Standard_Integer Index);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: float

Returns
-------
F: float
") Value;
		Standard_Boolean Value(const Standard_Real X, Standard_Real &OutValue);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: float

Returns
-------
F: float
D: float
") Values;
		Standard_Boolean Values(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue);

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
		/****************** Contap_ContAna ******************/
		%feature("compactdefaultargs") Contap_ContAna;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Contap_ContAna;
		 Contap_ContAna();

		/****************** Circle ******************/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Circ
") Circle;
		gp_Circ Circle();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
gp_Lin
") Line;
		gp_Lin Line(const Standard_Integer Index);

		/****************** NbContours ******************/
		%feature("compactdefaultargs") NbContours;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbContours;
		Standard_Integer NbContours();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: gp_Sphere
D: gp_Dir

Returns
-------
None
") Perform;
		void Perform(const gp_Sphere & S, const gp_Dir & D);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: gp_Sphere
D: gp_Dir
Ang: float

Returns
-------
None
") Perform;
		void Perform(const gp_Sphere & S, const gp_Dir & D, const Standard_Real Ang);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: gp_Sphere
Eye: gp_Pnt

Returns
-------
None
") Perform;
		void Perform(const gp_Sphere & S, const gp_Pnt & Eye);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Cylinder
D: gp_Dir

Returns
-------
None
") Perform;
		void Perform(const gp_Cylinder & C, const gp_Dir & D);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Cylinder
D: gp_Dir
Ang: float

Returns
-------
None
") Perform;
		void Perform(const gp_Cylinder & C, const gp_Dir & D, const Standard_Real Ang);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Cylinder
Eye: gp_Pnt

Returns
-------
None
") Perform;
		void Perform(const gp_Cylinder & C, const gp_Pnt & Eye);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Cone
D: gp_Dir

Returns
-------
None
") Perform;
		void Perform(const gp_Cone & C, const gp_Dir & D);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Cone
D: gp_Dir
Ang: float

Returns
-------
None
") Perform;
		void Perform(const gp_Cone & C, const gp_Dir & D, const Standard_Real Ang);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Cone
Eye: gp_Pnt

Returns
-------
None
") Perform;
		void Perform(const gp_Cone & C, const gp_Pnt & Eye);

		/****************** TypeContour ******************/
		%feature("compactdefaultargs") TypeContour;
		%feature("autodoc", "Returns geomabs_line or geomabs_circle, when isdone() returns true.

Returns
-------
GeomAbs_CurveType
") TypeContour;
		GeomAbs_CurveType TypeContour();

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
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Contap_Contour;
		 Contap_Contour();

		/****************** Contap_Contour ******************/
		%feature("compactdefaultargs") Contap_Contour;
		%feature("autodoc", "No available documentation.

Parameters
----------
Direction: gp_Vec

Returns
-------
None
") Contap_Contour;
		 Contap_Contour(const gp_Vec & Direction);

		/****************** Contap_Contour ******************/
		%feature("compactdefaultargs") Contap_Contour;
		%feature("autodoc", "No available documentation.

Parameters
----------
Direction: gp_Vec
Angle: float

Returns
-------
None
") Contap_Contour;
		 Contap_Contour(const gp_Vec & Direction, const Standard_Real Angle);

		/****************** Contap_Contour ******************/
		%feature("compactdefaultargs") Contap_Contour;
		%feature("autodoc", "No available documentation.

Parameters
----------
Eye: gp_Pnt

Returns
-------
None
") Contap_Contour;
		 Contap_Contour(const gp_Pnt & Eye);

		/****************** Contap_Contour ******************/
		%feature("compactdefaultargs") Contap_Contour;
		%feature("autodoc", "Creates the contour in a given direction.

Parameters
----------
Surf: Adaptor3d_HSurface
Domain: Adaptor3d_TopolTool
Direction: gp_Vec

Returns
-------
None
") Contap_Contour;
		 Contap_Contour(const opencascade::handle<Adaptor3d_HSurface> & Surf, const opencascade::handle<Adaptor3d_TopolTool> & Domain, const gp_Vec & Direction);

		/****************** Contap_Contour ******************/
		%feature("compactdefaultargs") Contap_Contour;
		%feature("autodoc", "Creates the contour in a given direction.

Parameters
----------
Surf: Adaptor3d_HSurface
Domain: Adaptor3d_TopolTool
Direction: gp_Vec
Angle: float

Returns
-------
None
") Contap_Contour;
		 Contap_Contour(const opencascade::handle<Adaptor3d_HSurface> & Surf, const opencascade::handle<Adaptor3d_TopolTool> & Domain, const gp_Vec & Direction, const Standard_Real Angle);

		/****************** Contap_Contour ******************/
		%feature("compactdefaultargs") Contap_Contour;
		%feature("autodoc", "Creates the contour for a perspective view.

Parameters
----------
Surf: Adaptor3d_HSurface
Domain: Adaptor3d_TopolTool
Eye: gp_Pnt

Returns
-------
None
") Contap_Contour;
		 Contap_Contour(const opencascade::handle<Adaptor3d_HSurface> & Surf, const opencascade::handle<Adaptor3d_TopolTool> & Domain, const gp_Pnt & Eye);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
Direction: gp_Vec

Returns
-------
None
") Init;
		void Init(const gp_Vec & Direction);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
Direction: gp_Vec
Angle: float

Returns
-------
None
") Init;
		void Init(const gp_Vec & Direction, const Standard_Real Angle);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
Eye: gp_Pnt

Returns
-------
None
") Init;
		void Init(const gp_Pnt & Eye);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returns true if the is no line.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
Contap_Line
") Line;
		const Contap_Line & Line(const Standard_Integer Index);

		/****************** NbLines ******************/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbLines;
		Standard_Integer NbLines();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Creates the contour in a given direction.

Parameters
----------
Surf: Adaptor3d_HSurface
Domain: Adaptor3d_TopolTool

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_HSurface> & Surf, const opencascade::handle<Adaptor3d_TopolTool> & Domain);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Creates the contour in a given direction.

Parameters
----------
Surf: Adaptor3d_HSurface
Domain: Adaptor3d_TopolTool
Direction: gp_Vec

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_HSurface> & Surf, const opencascade::handle<Adaptor3d_TopolTool> & Domain, const gp_Vec & Direction);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Creates the contour in a given direction.

Parameters
----------
Surf: Adaptor3d_HSurface
Domain: Adaptor3d_TopolTool
Direction: gp_Vec
Angle: float

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_HSurface> & Surf, const opencascade::handle<Adaptor3d_TopolTool> & Domain, const gp_Vec & Direction, const Standard_Real Angle);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Creates the contour for a perspective view.

Parameters
----------
Surf: Adaptor3d_HSurface
Domain: Adaptor3d_TopolTool
Eye: gp_Pnt

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_HSurface> & Surf, const opencascade::handle<Adaptor3d_TopolTool> & Domain, const gp_Pnt & Eye);

		/****************** SurfaceFunction ******************/
		%feature("compactdefaultargs") SurfaceFunction;
		%feature("autodoc", "Returns a reference on the internal surfacefunction. this is used to compute tangents on the lines.

Returns
-------
Contap_SurfFunction
") SurfaceFunction;
		Contap_SurfFunction & SurfaceFunction();

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
		%feature("autodoc", "Returns the parametric limits on the arc c. these limits must be finite : they are either the real limits of the arc, for a finite arc, or a bounding box for an infinite arc.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
Ufirst: float
Ulast: float
") Bounds;
		static void Bounds(const opencascade::handle<Adaptor2d_HCurve2d> & C, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** HasBeenSeen ******************/
		%feature("compactdefaultargs") HasBeenSeen;
		%feature("autodoc", "Returns true if all the intersection point and edges are known on the arc. the intersection point are given as vertices. the intersection edges are given as intervals between two vertices.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
bool
") HasBeenSeen;
		static Standard_Boolean HasBeenSeen(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** HasFirstPoint ******************/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "Returns true when the segment of range index is not open at the left side. in that case, indfirst is the range in the list intersection points (see nbpoints) of the one which defines the left bound of the segment. otherwise, the method has to return false, and indfirst has no meaning.

Parameters
----------
C: Adaptor2d_HCurve2d
Index: int

Returns
-------
IndFirst: int
") HasFirstPoint;
		static Standard_Boolean HasFirstPoint(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Integer Index, Standard_Integer &OutValue);

		/****************** HasLastPoint ******************/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "Returns true when the segment of range index is not open at the right side. in that case, indlast is the range in the list intersection points (see nbpoints) of the one which defines the right bound of the segment. otherwise, the method has to return false, and indlast has no meaning.

Parameters
----------
C: Adaptor2d_HCurve2d
Index: int

Returns
-------
IndLast: int
") HasLastPoint;
		static Standard_Boolean HasLastPoint(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Integer Index, Standard_Integer &OutValue);

		/****************** IsAllSolution ******************/
		%feature("compactdefaultargs") IsAllSolution;
		%feature("autodoc", "Returns true when the whole restriction is solution of the intersection problem.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
bool
") IsAllSolution;
		static Standard_Boolean IsAllSolution(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** IsVertex ******************/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "Returns true if the intersection point of range index corresponds with a vertex on the arc a.

Parameters
----------
C: Adaptor2d_HCurve2d
Index: int

Returns
-------
bool
") IsVertex;
		static Standard_Boolean IsVertex(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Integer Index);

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of intersection points on the arc a.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
int
") NbPoints;
		static Standard_Integer NbPoints(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** NbSamplePoints ******************/
		%feature("compactdefaultargs") NbSamplePoints;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_HSurface

Returns
-------
int
") NbSamplePoints;
		static Standard_Integer NbSamplePoints(const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** NbSamplesOnArc ******************/
		%feature("compactdefaultargs") NbSamplesOnArc;
		%feature("autodoc", "Returns the number of points which is used to make a sample on the arc. this number is a function of the surface and the curveonsurface complexity.

Parameters
----------
A: Adaptor2d_HCurve2d

Returns
-------
int
") NbSamplesOnArc;
		static Standard_Integer NbSamplesOnArc(const opencascade::handle<Adaptor2d_HCurve2d> & A);

		/****************** NbSamplesU ******************/
		%feature("compactdefaultargs") NbSamplesU;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_HSurface
u1: float
u2: float

Returns
-------
int
") NbSamplesU;
		static Standard_Integer NbSamplesU(const opencascade::handle<Adaptor3d_HSurface> & S, const Standard_Real u1, const Standard_Real u2);

		/****************** NbSamplesV ******************/
		%feature("compactdefaultargs") NbSamplesV;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_HSurface
v1: float
v2: float

Returns
-------
int
") NbSamplesV;
		static Standard_Integer NbSamplesV(const opencascade::handle<Adaptor3d_HSurface> & S, const Standard_Real v1, const Standard_Real v2);

		/****************** NbSegments ******************/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Returns the number of part of a solution of the of intersection problem.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
int
") NbSegments;
		static Standard_Integer NbSegments(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns the parameter of the vertex v on the arc a.

Parameters
----------
V: Adaptor3d_HVertex
C: Adaptor2d_HCurve2d

Returns
-------
float
") Parameter;
		static Standard_Real Parameter(const opencascade::handle<Adaptor3d_HVertex> & V, const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "Projects the point p on the arc c. if the methods returns standard_true, the projection is successful, and paramproj is the parameter on the arc of the projected point, ptproj is the projected point. if the method returns standard_false, param proj and ptproj are not significant.

Parameters
----------
C: Adaptor2d_HCurve2d
P: gp_Pnt2d
Ptproj: gp_Pnt2d

Returns
-------
Paramproj: float
") Project;
		static Standard_Boolean Project(const opencascade::handle<Adaptor2d_HCurve2d> & C, const gp_Pnt2d & P, Standard_Real &OutValue, gp_Pnt2d & Ptproj);

		/****************** SamplePoint ******************/
		%feature("compactdefaultargs") SamplePoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_HSurface
Index: int

Returns
-------
U: float
V: float
") SamplePoint;
		static void SamplePoint(const opencascade::handle<Adaptor3d_HSurface> & S, const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Returns the parametric tolerance used to consider that the vertex and another point meet, i-e if abs(parameter(vertex) - parameter(otherpnt))<= tolerance, the points are 'merged'.

Parameters
----------
V: Adaptor3d_HVertex
C: Adaptor2d_HCurve2d

Returns
-------
float
") Tolerance;
		static Standard_Real Tolerance(const opencascade::handle<Adaptor3d_HVertex> & V, const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the value (pt), the tolerance (tol), and the parameter (u) on the arc a , of the intersection point of range index.

Parameters
----------
C: Adaptor2d_HCurve2d
Index: int
Pt: gp_Pnt

Returns
-------
Tol: float
U: float
") Value;
		static void Value(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Integer Index, gp_Pnt & Pt, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "When isvertex returns true, this method returns the vertex on the arc a.

Parameters
----------
C: Adaptor2d_HCurve2d
Index: int
V: Adaptor3d_HVertex

Returns
-------
None
") Vertex;
		static void Vertex(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Integer Index, opencascade::handle<Adaptor3d_HVertex> & V);

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
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") BSpline;
		static opencascade::handle<Geom2d_BSplineCurve> BSpline(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Bezier ******************/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
opencascade::handle<Geom2d_BezierCurve>
") Bezier;
		static opencascade::handle<Geom2d_BezierCurve> Bezier(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Circle ******************/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
gp_Circ2d
") Circle;
		static gp_Circ2d Circle(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
GeomAbs_Shape
") Continuity;
		static GeomAbs_Shape Continuity(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Computes the point of parameter u on the curve.

Parameters
----------
C: Adaptor2d_HCurve2d
U: float
P: gp_Pnt2d

Returns
-------
None
") D0;
		static void D0(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Real U, gp_Pnt2d & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Computes the point of parameter u on the curve with its first derivative. raised if the continuity of the current interval is not c1.

Parameters
----------
C: Adaptor2d_HCurve2d
U: float
P: gp_Pnt2d
V: gp_Vec2d

Returns
-------
None
") D1;
		static void D1(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the point p of parameter u, the first and second derivatives v1 and v2. raised if the continuity of the current interval is not c2.

Parameters
----------
C: Adaptor2d_HCurve2d
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Returns
-------
None
") D2;
		static void D2(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Returns the point p of parameter u, the first, the second and the third derivative. raised if the continuity of the current interval is not c3.

Parameters
----------
C: Adaptor2d_HCurve2d
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Returns
-------
None
") D3;
		static void D3(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "The returned vector gives the value of the derivative for the order of derivation n. raised if the continuity of the current interval is not cn. raised if n < 1.

Parameters
----------
C: Adaptor2d_HCurve2d
U: float
N: int

Returns
-------
gp_Vec2d
") DN;
		static gp_Vec2d DN(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Real U, const Standard_Integer N);

		/****************** Ellipse ******************/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
gp_Elips2d
") Ellipse;
		static gp_Elips2d Ellipse(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
float
") FirstParameter;
		static Standard_Real FirstParameter(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Returns the type of the curve in the current interval : line, circle, ellipse, hyperbola, parabola, beziercurve, bsplinecurve, othercurve.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
GeomAbs_CurveType
") GetType;
		static GeomAbs_CurveType GetType(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Hyperbola ******************/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
gp_Hypr2d
") Hyperbola;
		static gp_Hypr2d Hyperbola(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
C: Adaptor2d_HCurve2d
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		static void Intervals(const opencascade::handle<Adaptor2d_HCurve2d> & C, TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
bool
") IsClosed;
		static Standard_Boolean IsClosed(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
bool
") IsPeriodic;
		static Standard_Boolean IsPeriodic(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
float
") LastParameter;
		static Standard_Real LastParameter(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
gp_Lin2d
") Line;
		static gp_Lin2d Line(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(myclass) >= <s>.

Parameters
----------
C: Adaptor2d_HCurve2d
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		static Standard_Integer NbIntervals(const opencascade::handle<Adaptor2d_HCurve2d> & C, const GeomAbs_Shape S);

		/****************** NbSamples ******************/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d
U0: float
U1: float

Returns
-------
int
") NbSamples;
		static Standard_Integer NbSamples(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Real U0, const Standard_Real U1);

		/****************** Parabola ******************/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
gp_Parab2d
") Parabola;
		static gp_Parab2d Parabola(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Period ******************/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
float
") Period;
		static Standard_Real Period(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Returns the parametric resolution corresponding to the real space resolution <r3d>.

Parameters
----------
C: Adaptor2d_HCurve2d
R3d: float

Returns
-------
float
") Resolution;
		static Standard_Real Resolution(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Real R3d);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the point of parameter u on the curve.

Parameters
----------
C: Adaptor2d_HCurve2d
U: float

Returns
-------
gp_Pnt2d
") Value;
		static gp_Pnt2d Value(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Real U);

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
		/****************** Contap_Line ******************/
		%feature("compactdefaultargs") Contap_Line;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Contap_Line;
		 Contap_Line();

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: IntSurf_PntOn2S

Returns
-------
None
") Add;
		void Add(const IntSurf_PntOn2S & P);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: Contap_Point

Returns
-------
None
") Add;
		void Add(const Contap_Point & P);

		/****************** Arc ******************/
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor2d_HCurve2d>
") Arc;
		const opencascade::handle<Adaptor2d_HCurve2d> & Arc();

		/****************** Circle ******************/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Circ
") Circle;
		gp_Circ Circle();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Lin
") Line;
		gp_Lin Line();

		/****************** LineOn2S ******************/
		%feature("compactdefaultargs") LineOn2S;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<IntSurf_LineOn2S>
") LineOn2S;
		const opencascade::handle<IntSurf_LineOn2S> & LineOn2S();

		/****************** NbPnts ******************/
		%feature("compactdefaultargs") NbPnts;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPnts;
		Standard_Integer NbPnts();

		/****************** NbVertex ******************/
		%feature("compactdefaultargs") NbVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVertex;
		Standard_Integer NbVertex();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
IntSurf_PntOn2S
") Point;
		const IntSurf_PntOn2S & Point(const Standard_Integer Index);

		/****************** ResetSeqOfVertex ******************/
		%feature("compactdefaultargs") ResetSeqOfVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ResetSeqOfVertex;
		void ResetSeqOfVertex();

		/****************** SetLineOn2S ******************/
		%feature("compactdefaultargs") SetLineOn2S;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: IntSurf_LineOn2S

Returns
-------
None
") SetLineOn2S;
		void SetLineOn2S(const opencascade::handle<IntSurf_LineOn2S> & L);

		/****************** SetTransitionOnS ******************/
		%feature("compactdefaultargs") SetTransitionOnS;
		%feature("autodoc", "Set the tansition of the line.

Parameters
----------
T: IntSurf_TypeTrans

Returns
-------
None
") SetTransitionOnS;
		void SetTransitionOnS(const IntSurf_TypeTrans T);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Lin

Returns
-------
None
") SetValue;
		void SetValue(const gp_Lin & L);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Circ

Returns
-------
None
") SetValue;
		void SetValue(const gp_Circ & C);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: Adaptor2d_HCurve2d

Returns
-------
None
") SetValue;
		void SetValue(const opencascade::handle<Adaptor2d_HCurve2d> & A);

		/****************** TransitionOnS ******************/
		%feature("compactdefaultargs") TransitionOnS;
		%feature("autodoc", "Returns in if at the 'left' of the line, the normale of the surface is oriented to the observator.

Returns
-------
IntSurf_TypeTrans
") TransitionOnS;
		IntSurf_TypeTrans TransitionOnS();

		/****************** TypeContour ******************/
		%feature("compactdefaultargs") TypeContour;
		%feature("autodoc", "Returns contap_lin for a line, contap_circle for a circle, and contap_walking for a walking line, contap_restriction for a part of boundarie.

Returns
-------
Contap_IType
") TypeContour;
		Contap_IType TypeContour();

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
Contap_Point
") Vertex;
		Contap_Point & Vertex(const Standard_Integer Index);

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
		/****************** Contap_Point ******************/
		%feature("compactdefaultargs") Contap_Point;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Contap_Point;
		 Contap_Point();

		/****************** Contap_Point ******************/
		%feature("compactdefaultargs") Contap_Point;
		%feature("autodoc", "Creates a point.

Parameters
----------
Pt: gp_Pnt
U: float
V: float

Returns
-------
None
") Contap_Point;
		 Contap_Point(const gp_Pnt & Pt, const Standard_Real U, const Standard_Real V);

		/****************** Arc ******************/
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", "Returns the arc of restriction containing the vertex.

Returns
-------
opencascade::handle<Adaptor2d_HCurve2d>
") Arc;
		const opencascade::handle<Adaptor2d_HCurve2d> & Arc();

		/****************** IsInternal ******************/
		%feature("compactdefaultargs") IsInternal;
		%feature("autodoc", "Returns true if the point is an internal one, i.e if the tangent to the line on the point and the eye direction are parallel.

Returns
-------
bool
") IsInternal;
		Standard_Boolean IsInternal();

		/****************** IsMultiple ******************/
		%feature("compactdefaultargs") IsMultiple;
		%feature("autodoc", "Returns true if the point belongs to several lines.

Returns
-------
bool
") IsMultiple;
		Standard_Boolean IsMultiple();

		/****************** IsOnArc ******************/
		%feature("compactdefaultargs") IsOnArc;
		%feature("autodoc", "Returns true when the point is an intersection between the contour and a restriction.

Returns
-------
bool
") IsOnArc;
		Standard_Boolean IsOnArc();

		/****************** IsVertex ******************/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "Returns true if the point is a vertex on the initial restriction facet of the surface.

Returns
-------
bool
") IsVertex;
		Standard_Boolean IsVertex();

		/****************** ParameterOnArc ******************/
		%feature("compactdefaultargs") ParameterOnArc;
		%feature("autodoc", "Returns the parameter of the point on the arc returned by the method arc().

Returns
-------
float
") ParameterOnArc;
		Standard_Real ParameterOnArc();

		/****************** ParameterOnLine ******************/
		%feature("compactdefaultargs") ParameterOnLine;
		%feature("autodoc", "This method returns the parameter of the point on the intersection line. if the points does not belong to an intersection line, the value returned does not have any sens.

Returns
-------
float
") ParameterOnLine;
		Standard_Real ParameterOnLine();

		/****************** Parameters ******************/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "Returns the parameters on the surface of the point.

Parameters
----------

Returns
-------
U1: float
V1: float
") Parameters;
		void Parameters(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** SetArc ******************/
		%feature("compactdefaultargs") SetArc;
		%feature("autodoc", "Sets the value of the arc and of the parameter on this arc of the point.

Parameters
----------
A: Adaptor2d_HCurve2d
Param: float
TLine: IntSurf_Transition
TArc: IntSurf_Transition

Returns
-------
None
") SetArc;
		void SetArc(const opencascade::handle<Adaptor2d_HCurve2d> & A, const Standard_Real Param, const IntSurf_Transition & TLine, const IntSurf_Transition & TArc);

		/****************** SetInternal ******************/
		%feature("compactdefaultargs") SetInternal;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") SetInternal;
		void SetInternal();

		/****************** SetMultiple ******************/
		%feature("compactdefaultargs") SetMultiple;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") SetMultiple;
		void SetMultiple();

		/****************** SetParameter ******************/
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "Set the value of the parameter on the intersection line.

Parameters
----------
Para: float

Returns
-------
None
") SetParameter;
		void SetParameter(const Standard_Real Para);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Sets the values for a point.

Parameters
----------
Pt: gp_Pnt
U: float
V: float

Returns
-------
None
") SetValue;
		void SetValue(const gp_Pnt & Pt, const Standard_Real U, const Standard_Real V);

		/****************** SetVertex ******************/
		%feature("compactdefaultargs") SetVertex;
		%feature("autodoc", "Sets the values of a point which is a vertex on the initial facet of restriction of one of the surface.

Parameters
----------
V: Adaptor3d_HVertex

Returns
-------
None
") SetVertex;
		void SetVertex(const opencascade::handle<Adaptor3d_HVertex> & V);

		/****************** TransitionOnArc ******************/
		%feature("compactdefaultargs") TransitionOnArc;
		%feature("autodoc", "Returns the transition of the point on the arc.

Returns
-------
IntSurf_Transition
") TransitionOnArc;
		const IntSurf_Transition & TransitionOnArc();

		/****************** TransitionOnLine ******************/
		%feature("compactdefaultargs") TransitionOnLine;
		%feature("autodoc", "Returns the transition of the point on the contour.

Returns
-------
IntSurf_Transition
") TransitionOnLine;
		const IntSurf_Transition & TransitionOnLine();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the intersection point (geometric information).

Returns
-------
gp_Pnt
") Value;
		const gp_Pnt Value();

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Returns the information about the point when it is on the domain of the patch, i-e when the function isvertex returns true. otherwise, an exception is raised.

Returns
-------
opencascade::handle<Adaptor3d_HVertex>
") Vertex;
		const opencascade::handle<Adaptor3d_HVertex> & Vertex();

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
		/****************** Contap_SurfFunction ******************/
		%feature("compactdefaultargs") Contap_SurfFunction;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Contap_SurfFunction;
		 Contap_SurfFunction();

		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Angle;
		Standard_Real Angle();

		/****************** Derivatives ******************/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "The dimension of d is (1,2).

Parameters
----------
X: math_Vector
D: math_Matrix

Returns
-------
bool
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** Direction ******************/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Dir
") Direction;
		const gp_Dir Direction();

		/****************** Direction2d ******************/
		%feature("compactdefaultargs") Direction2d;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Dir2d
") Direction2d;
		const gp_Dir2d Direction2d();

		/****************** Direction3d ******************/
		%feature("compactdefaultargs") Direction3d;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") Direction3d;
		const gp_Vec Direction3d();

		/****************** Eye ******************/
		%feature("compactdefaultargs") Eye;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") Eye;
		const gp_Pnt Eye();

		/****************** FunctionType ******************/
		%feature("compactdefaultargs") FunctionType;
		%feature("autodoc", "No available documentation.

Returns
-------
Contap_TFunction
") FunctionType;
		Contap_TFunction FunctionType();

		/****************** IsTangent ******************/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsTangent;
		Standard_Boolean IsTangent();

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "This method has to return 1.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "This method has to return 2.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** PSurface ******************/
		%feature("compactdefaultargs") PSurface;
		%feature("autodoc", "Method is entered for compatibility with intpatch_thesurffunction.

Returns
-------
opencascade::handle<Adaptor3d_HSurface>
") PSurface;
		const opencascade::handle<Adaptor3d_HSurface> & PSurface();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the value of the solution point on the surface.

Returns
-------
gp_Pnt
") Point;
		const gp_Pnt Point();

		/****************** Root ******************/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Root is the value of the function at the solution. it is a vector of dimension 1, i-e a real.

Returns
-------
float
") Root;
		Standard_Real Root();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_HSurface

Returns
-------
None
") Set;
		void Set(const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Eye: gp_Pnt

Returns
-------
None
") Set;
		void Set(const gp_Pnt & Eye);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Dir: gp_Dir

Returns
-------
None
") Set;
		void Set(const gp_Dir & Dir);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Dir: gp_Dir
Angle: float

Returns
-------
None
") Set;
		void Set(const gp_Dir & Dir, const Standard_Real Angle);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Eye: gp_Pnt
Angle: float

Returns
-------
None
") Set;
		void Set(const gp_Pnt & Eye, const Standard_Real Angle);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tolerance: float

Returns
-------
None
") Set;
		void Set(const Standard_Real Tolerance);

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HSurface>
") Surface;
		const opencascade::handle<Adaptor3d_HSurface> & Surface();

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Returns the value tol so that if abs(func.root())<tol the function is considered null.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "The dimension of f is 1.

Parameters
----------
X: math_Vector
F: math_Vector

Returns
-------
bool
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Returns
-------
bool
") Values;
		Standard_Boolean Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

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
		%feature("autodoc", "Computes the point <p>, and normal vector <n> on <s> at parameters u,v.

Parameters
----------
S: Adaptor3d_HSurface
U: float
V: float
P: gp_Pnt
d1u: gp_Vec
d1v: gp_Vec
N: gp_Vec

Returns
-------
None
") DerivAndNorm;
		static void DerivAndNorm(const opencascade::handle<Adaptor3d_HSurface> & S, const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & d1u, gp_Vec & d1v, gp_Vec & N);

		/****************** NormAndDn ******************/
		%feature("compactdefaultargs") NormAndDn;
		%feature("autodoc", "Computes the point <p>, normal vector <n>, and its derivatives <dnu> and <dnv> on <s> at parameters u,v.

Parameters
----------
S: Adaptor3d_HSurface
U: float
V: float
P: gp_Pnt
N: gp_Vec
Dnu: gp_Vec
Dnv: gp_Vec

Returns
-------
None
") NormAndDn;
		static void NormAndDn(const opencascade::handle<Adaptor3d_HSurface> & S, const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & N, gp_Vec & Dnu, gp_Vec & Dnv);

		/****************** Normale ******************/
		%feature("compactdefaultargs") Normale;
		%feature("autodoc", "Computes the point <p>, and normal vector <n> on <s> at parameters u,v.

Parameters
----------
S: Adaptor3d_HSurface
U: float
V: float
P: gp_Pnt
N: gp_Vec

Returns
-------
None
") Normale;
		static void Normale(const opencascade::handle<Adaptor3d_HSurface> & S, const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & N);

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
		/****************** Contap_TheIWLineOfTheIWalking ******************/
		%feature("compactdefaultargs") Contap_TheIWLineOfTheIWalking;
		%feature("autodoc", "No available documentation.

Parameters
----------
theAllocator: IntSurf_Allocator,optional
	default value is 0

Returns
-------
None
") Contap_TheIWLineOfTheIWalking;
		 Contap_TheIWLineOfTheIWalking(const IntSurf_Allocator & theAllocator = 0);

		/****************** AddIndexPassing ******************/
		%feature("compactdefaultargs") AddIndexPassing;
		%feature("autodoc", "Associer a l 'indice du point sur la ligne l'indice du point passant dans l'iterateur de depart.

Parameters
----------
Index: int

Returns
-------
None
") AddIndexPassing;
		void AddIndexPassing(const Standard_Integer Index);

		/****************** AddPoint ******************/
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "Add a point in the line.

Parameters
----------
P: IntSurf_PntOn2S

Returns
-------
None
") AddPoint;
		void AddPoint(const IntSurf_PntOn2S & P);

		/****************** AddStatusFirst ******************/
		%feature("compactdefaultargs") AddStatusFirst;
		%feature("autodoc", "No available documentation.

Parameters
----------
Closed: bool
HasFirst: bool

Returns
-------
None
") AddStatusFirst;
		void AddStatusFirst(const Standard_Boolean Closed, const Standard_Boolean HasFirst);

		/****************** AddStatusFirst ******************/
		%feature("compactdefaultargs") AddStatusFirst;
		%feature("autodoc", "No available documentation.

Parameters
----------
Closed: bool
HasLast: bool
Index: int
P: IntSurf_PathPoint

Returns
-------
None
") AddStatusFirst;
		void AddStatusFirst(const Standard_Boolean Closed, const Standard_Boolean HasLast, const Standard_Integer Index, const IntSurf_PathPoint & P);

		/****************** AddStatusFirstLast ******************/
		%feature("compactdefaultargs") AddStatusFirstLast;
		%feature("autodoc", "No available documentation.

Parameters
----------
Closed: bool
HasFirst: bool
HasLast: bool

Returns
-------
None
") AddStatusFirstLast;
		void AddStatusFirstLast(const Standard_Boolean Closed, const Standard_Boolean HasFirst, const Standard_Boolean HasLast);

		/****************** AddStatusLast ******************/
		%feature("compactdefaultargs") AddStatusLast;
		%feature("autodoc", "No available documentation.

Parameters
----------
HasLast: bool

Returns
-------
None
") AddStatusLast;
		void AddStatusLast(const Standard_Boolean HasLast);

		/****************** AddStatusLast ******************/
		%feature("compactdefaultargs") AddStatusLast;
		%feature("autodoc", "No available documentation.

Parameters
----------
HasLast: bool
Index: int
P: IntSurf_PathPoint

Returns
-------
None
") AddStatusLast;
		void AddStatusLast(const Standard_Boolean HasLast, const Standard_Integer Index, const IntSurf_PathPoint & P);

		/****************** Cut ******************/
		%feature("compactdefaultargs") Cut;
		%feature("autodoc", "Cut the line at the point of rank index.

Parameters
----------
Index: int

Returns
-------
None
") Cut;
		void Cut(const Standard_Integer Index);

		/****************** FirstPoint ******************/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Returns the first point of the line when it is a marching point. an exception is raised if hasfirstpoint returns false.

Returns
-------
IntSurf_PathPoint
") FirstPoint;
		const IntSurf_PathPoint & FirstPoint();

		/****************** FirstPointIndex ******************/
		%feature("compactdefaultargs") FirstPointIndex;
		%feature("autodoc", "Returns the index of first point of the line when it is a marching point.this index is the index in the pointstartiterator. an exception is raised if hasfirstpoint returns false.

Returns
-------
int
") FirstPointIndex;
		Standard_Integer FirstPointIndex();

		/****************** HasFirstPoint ******************/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "Returns true if the first point of the line is a marching point . when is hasfirstpoint==false ,the line begins on the natural bound of the surface.the line can be too long.

Returns
-------
bool
") HasFirstPoint;
		Standard_Boolean HasFirstPoint();

		/****************** HasLastPoint ******************/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "Returns true if the end point of the line is a marching point (point from intws). when is hasfirstpoint==false ,the line ends on the natural bound of the surface.the line can be too long.

Returns
-------
bool
") HasLastPoint;
		Standard_Boolean HasLastPoint();

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Returns true if the line is closed.

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsTangentAtBegining ******************/
		%feature("compactdefaultargs") IsTangentAtBegining;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsTangentAtBegining;
		Standard_Boolean IsTangentAtBegining();

		/****************** IsTangentAtEnd ******************/
		%feature("compactdefaultargs") IsTangentAtEnd;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsTangentAtEnd;
		Standard_Boolean IsTangentAtEnd();

		/****************** LastPoint ******************/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "Returns the last point of the line when it is a marching point. an exception is raised if haslastpoint returns false.

Returns
-------
IntSurf_PathPoint
") LastPoint;
		const IntSurf_PathPoint & LastPoint();

		/****************** LastPointIndex ******************/
		%feature("compactdefaultargs") LastPointIndex;
		%feature("autodoc", "Returns the index of last point of the line when it is a marching point.this index is the index in the pointstartiterator. an exception is raised if haslastpoint returns false.

Returns
-------
int
") LastPointIndex;
		Standard_Integer LastPointIndex();

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Returns the lineon2s contained in the walking line.

Returns
-------
opencascade::handle<IntSurf_LineOn2S>
") Line;
		const opencascade::handle<IntSurf_LineOn2S> & Line();

		/****************** NbPassingPoint ******************/
		%feature("compactdefaultargs") NbPassingPoint;
		%feature("autodoc", "Returns the number of points belonging to pnts1 which are passing point.

Returns
-------
int
") NbPassingPoint;
		Standard_Integer NbPassingPoint();

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of points of the line (including first point and end point : see haslastpoint and hasfirstpoint).

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** PassingPoint ******************/
		%feature("compactdefaultargs") PassingPoint;
		%feature("autodoc", "Returns the index of the point belonging to the line which is associated to the passing point belonging to pnts1 an exception is raised if index > nbpassingpoint().

Parameters
----------
Index: int

Returns
-------
IndexLine: int
IndexPnts: int
") PassingPoint;
		void PassingPoint(const Standard_Integer Index, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Reverse the points in the line. hasfirst, haslast are kept.

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** SetTangencyAtBegining ******************/
		%feature("compactdefaultargs") SetTangencyAtBegining;
		%feature("autodoc", "No available documentation.

Parameters
----------
IsTangent: bool

Returns
-------
None
") SetTangencyAtBegining;
		void SetTangencyAtBegining(const Standard_Boolean IsTangent);

		/****************** SetTangencyAtEnd ******************/
		%feature("compactdefaultargs") SetTangencyAtEnd;
		%feature("autodoc", "No available documentation.

Parameters
----------
IsTangent: bool

Returns
-------
None
") SetTangencyAtEnd;
		void SetTangencyAtEnd(const Standard_Boolean IsTangent);

		/****************** SetTangentVector ******************/
		%feature("compactdefaultargs") SetTangentVector;
		%feature("autodoc", "No available documentation.

Parameters
----------
V: gp_Vec
Index: int

Returns
-------
None
") SetTangentVector;
		void SetTangentVector(const gp_Vec & V, const Standard_Integer Index);

		/****************** TangentVector ******************/
		%feature("compactdefaultargs") TangentVector;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
Index: int
") TangentVector;
		const gp_Vec TangentVector(Standard_Integer &OutValue);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the point of range index. if index <= 0 or index > nbpoints, an exception is raised.

Parameters
----------
Index: int

Returns
-------
IntSurf_PntOn2S
") Value;
		const IntSurf_PntOn2S & Value(const Standard_Integer Index);

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
		%feature("autodoc", "Deflection is the maximum deflection admitted between two consecutive points on a resulting polyline. step is the maximum increment admitted between two consecutive points (in 2d space). epsilon is the tolerance beyond which 2 points are confused. thetofillholes is the flag defining whether possible holes between resulting curves are filled or not in case of contap walking thetofillholes is true.

Parameters
----------
Epsilon: float
Deflection: float
Step: float
theToFillHoles: bool,optional
	default value is Standard_False

Returns
-------
None
") Contap_TheIWalking;
		 Contap_TheIWalking(const Standard_Real Epsilon, const Standard_Real Deflection, const Standard_Real Step, const Standard_Boolean theToFillHoles = Standard_False);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the calculus was successful.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbLines ******************/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "Returns the number of resulting polylines. an exception is raised if isdone returns false.

Returns
-------
int
") NbLines;
		Standard_Integer NbLines();

		/****************** NbSinglePnts ******************/
		%feature("compactdefaultargs") NbSinglePnts;
		%feature("autodoc", "Returns the number of points belonging to pnts on which no line starts or ends. an exception is raised if isdone returns false.

Returns
-------
int
") NbSinglePnts;
		Standard_Integer NbSinglePnts();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Searches a set of polylines starting on a point of pnts1 or pnts2. each point on a resulting polyline verifies f(u,v)=0.

Parameters
----------
Pnts1: IntSurf_SequenceOfPathPoint
Pnts2: IntSurf_SequenceOfInteriorPoint
Func: Contap_SurfFunction
S: Adaptor3d_HSurface
Reversed: bool,optional
	default value is Standard_False

Returns
-------
None
") Perform;
		void Perform(const IntSurf_SequenceOfPathPoint & Pnts1, const IntSurf_SequenceOfInteriorPoint & Pnts2, Contap_SurfFunction & Func, const opencascade::handle<Adaptor3d_HSurface> & S, const Standard_Boolean Reversed = Standard_False);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Searches a set of polylines starting on a point of pnts1. each point on a resulting polyline verifies f(u,v)=0.

Parameters
----------
Pnts1: IntSurf_SequenceOfPathPoint
Func: Contap_SurfFunction
S: Adaptor3d_HSurface
Reversed: bool,optional
	default value is Standard_False

Returns
-------
None
") Perform;
		void Perform(const IntSurf_SequenceOfPathPoint & Pnts1, Contap_SurfFunction & Func, const opencascade::handle<Adaptor3d_HSurface> & S, const Standard_Boolean Reversed = Standard_False);

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "Deflection is the maximum deflection admitted between two consecutive points on a resulting polyline. step is the maximum increment admitted between two consecutive points (in 2d space). epsilon is the tolerance beyond which 2 points are confused.

Parameters
----------
Epsilon: float
Deflection: float
Step: float

Returns
-------
None
") SetTolerance;
		void SetTolerance(const Standard_Real Epsilon, const Standard_Real Deflection, const Standard_Real Step);

		/****************** SinglePnt ******************/
		%feature("compactdefaultargs") SinglePnt;
		%feature("autodoc", "Returns the point of range index . an exception is raised if isdone returns false. an exception is raised if index<=0 or index > nbsinglepnts.

Parameters
----------
Index: int

Returns
-------
IntSurf_PathPoint
") SinglePnt;
		const IntSurf_PathPoint & SinglePnt(const Standard_Integer Index);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the polyline of range index. an exception is raised if isdone is false. an exception is raised if index<=0 or index>nblines.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<Contap_TheIWLineOfTheIWalking>
") Value;
		const opencascade::handle<Contap_TheIWLineOfTheIWalking> & Value(const Standard_Integer Index);

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
		/****************** Contap_ThePathPointOfTheSearch ******************/
		%feature("compactdefaultargs") Contap_ThePathPointOfTheSearch;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Contap_ThePathPointOfTheSearch;
		 Contap_ThePathPointOfTheSearch();

		/****************** Contap_ThePathPointOfTheSearch ******************/
		%feature("compactdefaultargs") Contap_ThePathPointOfTheSearch;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
Tol: float
V: Adaptor3d_HVertex
A: Adaptor2d_HCurve2d
Parameter: float

Returns
-------
None
") Contap_ThePathPointOfTheSearch;
		 Contap_ThePathPointOfTheSearch(const gp_Pnt & P, const Standard_Real Tol, const opencascade::handle<Adaptor3d_HVertex> & V, const opencascade::handle<Adaptor2d_HCurve2d> & A, const Standard_Real Parameter);

		/****************** Contap_ThePathPointOfTheSearch ******************/
		%feature("compactdefaultargs") Contap_ThePathPointOfTheSearch;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
Tol: float
A: Adaptor2d_HCurve2d
Parameter: float

Returns
-------
None
") Contap_ThePathPointOfTheSearch;
		 Contap_ThePathPointOfTheSearch(const gp_Pnt & P, const Standard_Real Tol, const opencascade::handle<Adaptor2d_HCurve2d> & A, const Standard_Real Parameter);

		/****************** Arc ******************/
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor2d_HCurve2d>
") Arc;
		const opencascade::handle<Adaptor2d_HCurve2d> & Arc();

		/****************** IsNew ******************/
		%feature("compactdefaultargs") IsNew;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsNew;
		Standard_Boolean IsNew();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
Tol: float
V: Adaptor3d_HVertex
A: Adaptor2d_HCurve2d
Parameter: float

Returns
-------
None
") SetValue;
		void SetValue(const gp_Pnt & P, const Standard_Real Tol, const opencascade::handle<Adaptor3d_HVertex> & V, const opencascade::handle<Adaptor2d_HCurve2d> & A, const Standard_Real Parameter);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
Tol: float
A: Adaptor2d_HCurve2d
Parameter: float

Returns
-------
None
") SetValue;
		void SetValue(const gp_Pnt & P, const Standard_Real Tol, const opencascade::handle<Adaptor2d_HCurve2d> & A, const Standard_Real Parameter);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") Value;
		const gp_Pnt Value();

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HVertex>
") Vertex;
		const opencascade::handle<Adaptor3d_HVertex> & Vertex();

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
		/****************** Contap_TheSearch ******************/
		%feature("compactdefaultargs") Contap_TheSearch;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Contap_TheSearch;
		 Contap_TheSearch();

		/****************** AllArcSolution ******************/
		%feature("compactdefaultargs") AllArcSolution;
		%feature("autodoc", "Returns true if all arc of the arcs are solution (inside the surface). an exception is raised if isdone returns false.

Returns
-------
bool
") AllArcSolution;
		Standard_Boolean AllArcSolution();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the calculus was successful.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of resulting points. an exception is raised if isdone returns false (notdone).

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** NbSegments ******************/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Returns the number of the resulting segments. an exception is raised if isdone returns false (notdone).

Returns
-------
int
") NbSegments;
		Standard_Integer NbSegments();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Algorithm to find the points and parts of curves of domain (domain of of restriction of a surface) which verify f = 0. tolboundary defines if a curve is on q. toltangency defines if a point is on q.

Parameters
----------
F: Contap_ArcFunction
Domain: Adaptor3d_TopolTool
TolBoundary: float
TolTangency: float
RecheckOnRegularity: bool,optional
	default value is Standard_False

Returns
-------
None
") Perform;
		void Perform(Contap_ArcFunction & F, const opencascade::handle<Adaptor3d_TopolTool> & Domain, const Standard_Real TolBoundary, const Standard_Real TolTangency, const Standard_Boolean RecheckOnRegularity = Standard_False);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the resulting point of range index. the exception notdone is raised if isdone() returns false. the exception outofrange is raised if index <= 0 or index > nbpoints.

Parameters
----------
Index: int

Returns
-------
Contap_ThePathPointOfTheSearch
") Point;
		const Contap_ThePathPointOfTheSearch & Point(const Standard_Integer Index);

		/****************** Segment ******************/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "Returns the resulting segment of range index. the exception notdone is raised if isdone() returns false. the exception outofrange is raised if index <= 0 or index > nbpoints.

Parameters
----------
Index: int

Returns
-------
Contap_TheSegmentOfTheSearch
") Segment;
		const Contap_TheSegmentOfTheSearch & Segment(const Standard_Integer Index);

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
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Contap_TheSearchInside;
		 Contap_TheSearchInside();

		/****************** Contap_TheSearchInside ******************/
		%feature("compactdefaultargs") Contap_TheSearchInside;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: Contap_SurfFunction
Surf: Adaptor3d_HSurface
T: Adaptor3d_TopolTool
Epsilon: float

Returns
-------
None
") Contap_TheSearchInside;
		 Contap_TheSearchInside(Contap_SurfFunction & F, const opencascade::handle<Adaptor3d_HSurface> & Surf, const opencascade::handle<Adaptor3d_TopolTool> & T, const Standard_Real Epsilon);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of points. the exception notdone if raised if isdone returns false.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: Contap_SurfFunction
Surf: Adaptor3d_HSurface
T: Adaptor3d_TopolTool
Epsilon: float

Returns
-------
None
") Perform;
		void Perform(Contap_SurfFunction & F, const opencascade::handle<Adaptor3d_HSurface> & Surf, const opencascade::handle<Adaptor3d_TopolTool> & T, const Standard_Real Epsilon);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: Contap_SurfFunction
Surf: Adaptor3d_HSurface
UStart: float
VStart: float

Returns
-------
None
") Perform;
		void Perform(Contap_SurfFunction & F, const opencascade::handle<Adaptor3d_HSurface> & Surf, const Standard_Real UStart, const Standard_Real VStart);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the point of range index. the exception notdone if raised if isdone returns false. the exception outofrange if raised if index <= 0 or index > nbpoints.

Parameters
----------
Index: int

Returns
-------
IntSurf_InteriorPoint
") Value;
		const IntSurf_InteriorPoint & Value(const Standard_Integer Index);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Contap_TheSegmentOfTheSearch;
		 Contap_TheSegmentOfTheSearch();

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns the geometric curve on the surface 's domain which is solution.

Returns
-------
opencascade::handle<Adaptor2d_HCurve2d>
") Curve;
		const opencascade::handle<Adaptor2d_HCurve2d> & Curve();

		/****************** FirstPoint ******************/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Returns the first point.

Returns
-------
Contap_ThePathPointOfTheSearch
") FirstPoint;
		const Contap_ThePathPointOfTheSearch & FirstPoint();

		/****************** HasFirstPoint ******************/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "Returns true if there is a vertex (thepathpoint) defining the lowest valid parameter on the arc.

Returns
-------
bool
") HasFirstPoint;
		Standard_Boolean HasFirstPoint();

		/****************** HasLastPoint ******************/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "Returns true if there is a vertex (thepathpoint) defining the greatest valid parameter on the arc.

Returns
-------
bool
") HasLastPoint;
		Standard_Boolean HasLastPoint();

		/****************** LastPoint ******************/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "Returns the last point.

Returns
-------
Contap_ThePathPointOfTheSearch
") LastPoint;
		const Contap_ThePathPointOfTheSearch & LastPoint();

		/****************** SetLimitPoint ******************/
		%feature("compactdefaultargs") SetLimitPoint;
		%feature("autodoc", "Defines the first point or the last point, depending on the value of the boolean first.

Parameters
----------
V: Contap_ThePathPointOfTheSearch
First: bool

Returns
-------
None
") SetLimitPoint;
		void SetLimitPoint(const Contap_ThePathPointOfTheSearch & V, const Standard_Boolean First);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Defines the concerned arc.

Parameters
----------
A: Adaptor2d_HCurve2d

Returns
-------
None
") SetValue;
		void SetValue(const opencascade::handle<Adaptor2d_HCurve2d> & A);

};


%extend Contap_TheSegmentOfTheSearch {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
class Contap_TheHSequenceOfPoint : public Contap_TheSequenceOfPoint, public Standard_Transient {
  public:
    Contap_TheHSequenceOfPoint();
    Contap_TheHSequenceOfPoint(const Contap_TheSequenceOfPoint& theOther);
    const Contap_TheSequenceOfPoint& Sequence();
    void Append (const Contap_TheSequenceOfPoint::value_type& theItem);
    void Append (Contap_TheSequenceOfPoint& theSequence);
    Contap_TheSequenceOfPoint& ChangeSequence();
};
%make_alias(Contap_TheHSequenceOfPoint)


