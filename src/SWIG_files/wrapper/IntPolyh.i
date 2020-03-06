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
%define INTPOLYHDOCSTRING
"IntPolyh module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_intpolyh.html"
%enddef
%module (package="OCC.Core", docstring=INTPOLYHDOCSTRING) IntPolyh


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
#include<IntPolyh_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Adaptor3d_module.hxx>
#include<TColStd_module.hxx>
#include<Bnd_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Adaptor3d.i
%import TColStd.i
%import Bnd.i

%pythoncode {
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
%template(IntPolyh_ListOfCouples) NCollection_List<IntPolyh_Couple>;
%template(IntPolyh_SeqOfStartPoints) NCollection_Sequence<IntPolyh_StartPoint>;
/* end templates declaration */

/* typedefs */
typedef IntPolyh_Array<IntPolyh_Edge> IntPolyh_ArrayOfEdges;
typedef IntPolyh_Array<IntPolyh_PointNormal> IntPolyh_ArrayOfPointNormal;
typedef IntPolyh_Array<IntPolyh_Point> IntPolyh_ArrayOfPoints;
typedef IntPolyh_Array<IntPolyh_SectionLine> IntPolyh_ArrayOfSectionLines;
typedef IntPolyh_Array<IntPolyh_StartPoint> IntPolyh_ArrayOfTangentZones;
typedef IntPolyh_Array<IntPolyh_Triangle> IntPolyh_ArrayOfTriangles;
typedef IntPolyh_ListOfCouples::Iterator IntPolyh_ListIteratorOfListOfCouples;
typedef NCollection_List<IntPolyh_Couple> IntPolyh_ListOfCouples;
typedef IntPolyh_MaillageAffinage * IntPolyh_PMaillageAffinage;
typedef NCollection_Sequence<IntPolyh_StartPoint> IntPolyh_SeqOfStartPoints;
/* end typedefs declaration */

/***********************
* class IntPolyh_Array *
***********************/
/************************
* class IntPolyh_Couple *
************************/
class IntPolyh_Couple {
	public:
		/****************** IntPolyh_Couple ******************/
		%feature("compactdefaultargs") IntPolyh_Couple;
		%feature("autodoc", "Constructor.

Returns
-------
None
") IntPolyh_Couple;
		 IntPolyh_Couple();

		/****************** IntPolyh_Couple ******************/
		%feature("compactdefaultargs") IntPolyh_Couple;
		%feature("autodoc", "Constructor.

Parameters
----------
theTriangle1: int
theTriangle2: int
theAngle: float,optional
	default value is -2.0

Returns
-------
None
") IntPolyh_Couple;
		 IntPolyh_Couple(const Standard_Integer theTriangle1, const Standard_Integer theTriangle2, const Standard_Real theAngle = -2.0);

		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Returns the angle.

Returns
-------
float
") Angle;
		Standard_Real Angle();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Parameters
----------
v: int

Returns
-------
None
") Dump;
		void Dump(const Standard_Integer v);

		/****************** FirstValue ******************/
		%feature("compactdefaultargs") FirstValue;
		%feature("autodoc", "Returns the first index.

Returns
-------
int
") FirstValue;
		Standard_Integer FirstValue();

		/****************** HashCode ******************/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "Computes a hash code for this couple, in the range [1, theupperbound] @param theupperbound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theupperbound].

Parameters
----------
theUpperBound: int

Returns
-------
int
") HashCode;
		Standard_Integer HashCode(const Standard_Integer theUpperBound);

        %extend {
            Standard_Integer __hash__() {
            return $self->HashCode(2147483647);
            }
        };

		/****************** IsAnalyzed ******************/
		%feature("compactdefaultargs") IsAnalyzed;
		%feature("autodoc", "Returns true if the couple has been analyzed.

Returns
-------
bool
") IsAnalyzed;
		Standard_Boolean IsAnalyzed();

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Returns true if the couple is equal to <theother>.

Parameters
----------
theOther: IntPolyh_Couple

Returns
-------
bool
") IsEqual;
		Standard_Boolean IsEqual(const IntPolyh_Couple & theOther);

		/****************** SecondValue ******************/
		%feature("compactdefaultargs") SecondValue;
		%feature("autodoc", "Returns the second index.

Returns
-------
int
") SecondValue;
		Standard_Integer SecondValue();

		/****************** SetAnalyzed ******************/
		%feature("compactdefaultargs") SetAnalyzed;
		%feature("autodoc", "Sets the analyzed flag.

Parameters
----------
theAnalyzed: bool

Returns
-------
None
") SetAnalyzed;
		void SetAnalyzed(const Standard_Boolean theAnalyzed);

		/****************** SetAngle ******************/
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "Sets the angle.

Parameters
----------
theAngle: float

Returns
-------
None
") SetAngle;
		void SetAngle(const Standard_Real theAngle);

		/****************** SetCoupleValue ******************/
		%feature("compactdefaultargs") SetCoupleValue;
		%feature("autodoc", "Sets the triangles.

Parameters
----------
theInd1: int
theInd2: int

Returns
-------
None
") SetCoupleValue;
		void SetCoupleValue(const Standard_Integer theInd1, const Standard_Integer theInd2);

};


%extend IntPolyh_Couple {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IntPolyh_CoupleMapHasher *
*********************************/
class IntPolyh_CoupleMapHasher {
	public:
		/****************** HashCode ******************/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "Computes a hash code for the given couple, in the range [1, theupperbound] @param thecouple the couple which hash code is to be computed @param theupperbound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theupperbound].

Parameters
----------
theCouple: IntPolyh_Couple
theUpperBound: int

Returns
-------
int
") HashCode;
		static Standard_Integer HashCode(const IntPolyh_Couple & theCouple, const Standard_Integer theUpperBound);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "No available documentation.

Parameters
----------
theCouple1: IntPolyh_Couple
theCouple2: IntPolyh_Couple

Returns
-------
bool
") IsEqual;
		static Standard_Boolean IsEqual(const IntPolyh_Couple & theCouple1, const IntPolyh_Couple & theCouple2);

};


%extend IntPolyh_CoupleMapHasher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class IntPolyh_Edge *
**********************/
class IntPolyh_Edge {
	public:
		/****************** IntPolyh_Edge ******************/
		%feature("compactdefaultargs") IntPolyh_Edge;
		%feature("autodoc", "Constructor.

Returns
-------
None
") IntPolyh_Edge;
		 IntPolyh_Edge();

		/****************** IntPolyh_Edge ******************/
		%feature("compactdefaultargs") IntPolyh_Edge;
		%feature("autodoc", "Constructor.

Parameters
----------
thePoint1: int
thePoint2: int
theTriangle1: int
theTriangle2: int

Returns
-------
None
") IntPolyh_Edge;
		 IntPolyh_Edge(const Standard_Integer thePoint1, const Standard_Integer thePoint2, const Standard_Integer theTriangle1, const Standard_Integer theTriangle2);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Parameters
----------
v: int

Returns
-------
None
") Dump;
		void Dump(const Standard_Integer v);

		/****************** FirstPoint ******************/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Returns the first point.

Returns
-------
int
") FirstPoint;
		Standard_Integer FirstPoint();

		/****************** FirstTriangle ******************/
		%feature("compactdefaultargs") FirstTriangle;
		%feature("autodoc", "Returns the first triangle.

Returns
-------
int
") FirstTriangle;
		Standard_Integer FirstTriangle();

		/****************** SecondPoint ******************/
		%feature("compactdefaultargs") SecondPoint;
		%feature("autodoc", "Returns the second point.

Returns
-------
int
") SecondPoint;
		Standard_Integer SecondPoint();

		/****************** SecondTriangle ******************/
		%feature("compactdefaultargs") SecondTriangle;
		%feature("autodoc", "Returns the second triangle.

Returns
-------
int
") SecondTriangle;
		Standard_Integer SecondTriangle();

		/****************** SetFirstPoint ******************/
		%feature("compactdefaultargs") SetFirstPoint;
		%feature("autodoc", "Sets the first point.

Parameters
----------
thePoint: int

Returns
-------
None
") SetFirstPoint;
		void SetFirstPoint(const Standard_Integer thePoint);

		/****************** SetFirstTriangle ******************/
		%feature("compactdefaultargs") SetFirstTriangle;
		%feature("autodoc", "Sets the first triangle.

Parameters
----------
theTriangle: int

Returns
-------
None
") SetFirstTriangle;
		void SetFirstTriangle(const Standard_Integer theTriangle);

		/****************** SetSecondPoint ******************/
		%feature("compactdefaultargs") SetSecondPoint;
		%feature("autodoc", "Sets the second point.

Parameters
----------
thePoint: int

Returns
-------
None
") SetSecondPoint;
		void SetSecondPoint(const Standard_Integer thePoint);

		/****************** SetSecondTriangle ******************/
		%feature("compactdefaultargs") SetSecondTriangle;
		%feature("autodoc", "Sets the second triangle.

Parameters
----------
theTriangle: int

Returns
-------
None
") SetSecondTriangle;
		void SetSecondTriangle(const Standard_Integer theTriangle);

};


%extend IntPolyh_Edge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IntPolyh_Intersection *
******************************/
class IntPolyh_Intersection {
	public:
		/****************** IntPolyh_Intersection ******************/
		%feature("compactdefaultargs") IntPolyh_Intersection;
		%feature("autodoc", "Constructor for intersection of two surfaces with default parameters. performs intersection.

Parameters
----------
theS1: Adaptor3d_HSurface
theS2: Adaptor3d_HSurface

Returns
-------
None
") IntPolyh_Intersection;
		 IntPolyh_Intersection(const opencascade::handle<Adaptor3d_HSurface> & theS1, const opencascade::handle<Adaptor3d_HSurface> & theS2);

		/****************** IntPolyh_Intersection ******************/
		%feature("compactdefaultargs") IntPolyh_Intersection;
		%feature("autodoc", "Constructor for intersection of two surfaces with the given size of the sampling nets: - <thenbsu1> x <thenbsv1> - for the first surface <thes1>; - <thenbsu2> x <thenbsv2> - for the second surface <thes2>. performs intersection.

Parameters
----------
theS1: Adaptor3d_HSurface
theNbSU1: int
theNbSV1: int
theS2: Adaptor3d_HSurface
theNbSU2: int
theNbSV2: int

Returns
-------
None
") IntPolyh_Intersection;
		 IntPolyh_Intersection(const opencascade::handle<Adaptor3d_HSurface> & theS1, const Standard_Integer theNbSU1, const Standard_Integer theNbSV1, const opencascade::handle<Adaptor3d_HSurface> & theS2, const Standard_Integer theNbSU2, const Standard_Integer theNbSV2);

		/****************** IntPolyh_Intersection ******************/
		%feature("compactdefaultargs") IntPolyh_Intersection;
		%feature("autodoc", "Constructor for intersection of two surfaces with the precomputed sampling. performs intersection.

Parameters
----------
theS1: Adaptor3d_HSurface
theUPars1: TColStd_Array1OfReal
theVPars1: TColStd_Array1OfReal
theS2: Adaptor3d_HSurface
theUPars2: TColStd_Array1OfReal
theVPars2: TColStd_Array1OfReal

Returns
-------
None
") IntPolyh_Intersection;
		 IntPolyh_Intersection(const opencascade::handle<Adaptor3d_HSurface> & theS1, const TColStd_Array1OfReal & theUPars1, const TColStd_Array1OfReal & theVPars1, const opencascade::handle<Adaptor3d_HSurface> & theS2, const TColStd_Array1OfReal & theUPars2, const TColStd_Array1OfReal & theVPars2);

		/****************** GetLinePoint ******************/
		%feature("compactdefaultargs") GetLinePoint;
		%feature("autodoc", "Gets the parameters of the point in section line.

Parameters
----------
IndexLine: int
IndexPoint: int

Returns
-------
x: float
y: float
z: float
u1: float
v1: float
u2: float
v2: float
incidence: float
") GetLinePoint;
		void GetLinePoint(const Standard_Integer IndexLine, const Standard_Integer IndexPoint, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetTangentZonePoint ******************/
		%feature("compactdefaultargs") GetTangentZonePoint;
		%feature("autodoc", "Gets the parameters of the point in tangent zone.

Parameters
----------
IndexLine: int
IndexPoint: int

Returns
-------
x: float
y: float
z: float
u1: float
v1: float
u2: float
v2: float
") GetTangentZonePoint;
		void GetTangentZonePoint(const Standard_Integer IndexLine, const Standard_Integer IndexPoint, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns state of the operation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbPointsInLine ******************/
		%feature("compactdefaultargs") NbPointsInLine;
		%feature("autodoc", "Returns the number of points in the given line.

Parameters
----------
IndexLine: int

Returns
-------
int
") NbPointsInLine;
		Standard_Integer NbPointsInLine(const Standard_Integer IndexLine);

		/****************** NbPointsInTangentZone ******************/
		%feature("compactdefaultargs") NbPointsInTangentZone;
		%feature("autodoc", "Returns number of points in tangent zone.

Parameters
----------
Standard_Integer: 

Returns
-------
int
") NbPointsInTangentZone;
		Standard_Integer NbPointsInTangentZone(const Standard_Integer);

		/****************** NbSectionLines ******************/
		%feature("compactdefaultargs") NbSectionLines;
		%feature("autodoc", "Returns the number of section lines.

Returns
-------
int
") NbSectionLines;
		Standard_Integer NbSectionLines();

		/****************** NbTangentZones ******************/
		%feature("compactdefaultargs") NbTangentZones;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbTangentZones;
		Standard_Integer NbTangentZones();

};


%extend IntPolyh_Intersection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class IntPolyh_MaillageAffinage *
**********************************/
/***********************
* class IntPolyh_Point *
***********************/
class IntPolyh_Point {
	public:
		/****************** IntPolyh_Point ******************/
		%feature("compactdefaultargs") IntPolyh_Point;
		%feature("autodoc", "Constructor.

Returns
-------
None
") IntPolyh_Point;
		 IntPolyh_Point();

		/****************** IntPolyh_Point ******************/
		%feature("compactdefaultargs") IntPolyh_Point;
		%feature("autodoc", "Constructor.

Parameters
----------
x: float
y: float
z: float
u: float
v: float

Returns
-------
None
") IntPolyh_Point;
		 IntPolyh_Point(const Standard_Real x, const Standard_Real y, const Standard_Real z, const Standard_Real u, const Standard_Real v);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Addition.

Parameters
----------
P1: IntPolyh_Point

Returns
-------
IntPolyh_Point
") Add;
		IntPolyh_Point Add(const IntPolyh_Point & P1);

		/****************** Cross ******************/
		%feature("compactdefaultargs") Cross;
		%feature("autodoc", "Cross.

Parameters
----------
P1: IntPolyh_Point
P2: IntPolyh_Point

Returns
-------
None
") Cross;
		void Cross(const IntPolyh_Point & P1, const IntPolyh_Point & P2);

		/****************** Degenerated ******************/
		%feature("compactdefaultargs") Degenerated;
		%feature("autodoc", "Returns the degenerated flag.

Returns
-------
bool
") Degenerated;
		Standard_Boolean Degenerated();

		/****************** Divide ******************/
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "Division.

Parameters
----------
rr: float

Returns
-------
IntPolyh_Point
") Divide;
		IntPolyh_Point Divide(const Standard_Real rr);

		/****************** Dot ******************/
		%feature("compactdefaultargs") Dot;
		%feature("autodoc", "Dot.

Parameters
----------
P2: IntPolyh_Point

Returns
-------
float
") Dot;
		Standard_Real Dot(const IntPolyh_Point & P2);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Dump.

Returns
-------
None
") Dump;
		void Dump();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Dump.

Parameters
----------
i: int

Returns
-------
None
") Dump;
		void Dump(const Standard_Integer i);

		/****************** Equal ******************/
		%feature("compactdefaultargs") Equal;
		%feature("autodoc", "Assignment operator.

Parameters
----------
Pt: IntPolyh_Point

Returns
-------
None
") Equal;
		void Equal(const IntPolyh_Point & Pt);

		/****************** Middle ******************/
		%feature("compactdefaultargs") Middle;
		%feature("autodoc", "Creates middle point from p1 and p2 and stores it to this.

Parameters
----------
MySurface: Adaptor3d_HSurface
P1: IntPolyh_Point
P2: IntPolyh_Point

Returns
-------
None
") Middle;
		void Middle(const opencascade::handle<Adaptor3d_HSurface> & MySurface, const IntPolyh_Point & P1, const IntPolyh_Point & P2);

		/****************** Multiplication ******************/
		%feature("compactdefaultargs") Multiplication;
		%feature("autodoc", "Multiplication.

Parameters
----------
rr: float

Returns
-------
IntPolyh_Point
") Multiplication;
		IntPolyh_Point Multiplication(const Standard_Real rr);

		/****************** PartOfCommon ******************/
		%feature("compactdefaultargs") PartOfCommon;
		%feature("autodoc", "Returns 0 if the point is not common with the other surface.

Returns
-------
int
") PartOfCommon;
		Standard_Integer PartOfCommon();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the point.

Parameters
----------
x: float
y: float
z: float
u: float
v: float
II: int,optional
	default value is 1

Returns
-------
None
") Set;
		void Set(const Standard_Real x, const Standard_Real y, const Standard_Real z, const Standard_Real u, const Standard_Real v, const Standard_Integer II = 1);

		/****************** SetDegenerated ******************/
		%feature("compactdefaultargs") SetDegenerated;
		%feature("autodoc", "Sets the degenerated flag.

Parameters
----------
theFlag: bool

Returns
-------
None
") SetDegenerated;
		void SetDegenerated(const Standard_Boolean theFlag);

		/****************** SetPartOfCommon ******************/
		%feature("compactdefaultargs") SetPartOfCommon;
		%feature("autodoc", "Sets the part of common.

Parameters
----------
ii: int

Returns
-------
None
") SetPartOfCommon;
		void SetPartOfCommon(const Standard_Integer ii);

		/****************** SetU ******************/
		%feature("compactdefaultargs") SetU;
		%feature("autodoc", "Sets the u coordinate for the 2d point.

Parameters
----------
u: float

Returns
-------
None
") SetU;
		void SetU(const Standard_Real u);

		/****************** SetV ******************/
		%feature("compactdefaultargs") SetV;
		%feature("autodoc", "Sets the v coordinate for the 2d point.

Parameters
----------
v: float

Returns
-------
None
") SetV;
		void SetV(const Standard_Real v);

		/****************** SetX ******************/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "Sets the x coordinate for the 3d point.

Parameters
----------
x: float

Returns
-------
None
") SetX;
		void SetX(const Standard_Real x);

		/****************** SetY ******************/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "Sets the y coordinate for the 3d point.

Parameters
----------
y: float

Returns
-------
None
") SetY;
		void SetY(const Standard_Real y);

		/****************** SetZ ******************/
		%feature("compactdefaultargs") SetZ;
		%feature("autodoc", "Sets the z coordinate for the 3d point.

Parameters
----------
z: float

Returns
-------
None
") SetZ;
		void SetZ(const Standard_Real z);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Square distance to the other point.

Parameters
----------
P2: IntPolyh_Point

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const IntPolyh_Point & P2);

		/****************** SquareModulus ******************/
		%feature("compactdefaultargs") SquareModulus;
		%feature("autodoc", "Square modulus.

Returns
-------
float
") SquareModulus;
		Standard_Real SquareModulus();

		/****************** Sub ******************/
		%feature("compactdefaultargs") Sub;
		%feature("autodoc", "Subtraction.

Parameters
----------
P1: IntPolyh_Point

Returns
-------
IntPolyh_Point
") Sub;
		IntPolyh_Point Sub(const IntPolyh_Point & P1);

		/****************** U ******************/
		%feature("compactdefaultargs") U;
		%feature("autodoc", "Returns the u coordinate of the 2d point.

Returns
-------
float
") U;
		Standard_Real U();

		/****************** V ******************/
		%feature("compactdefaultargs") V;
		%feature("autodoc", "Returns the v coordinate of the 2d point.

Returns
-------
float
") V;
		Standard_Real V();

		/****************** X ******************/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "Returns x coordinate of the 3d point.

Returns
-------
float
") X;
		Standard_Real X();

		/****************** Y ******************/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "Returns y coordinate of the 3d point.

Returns
-------
float
") Y;
		Standard_Real Y();

		/****************** Z ******************/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "Returns the z coordinate of the 3d point.

Returns
-------
float
") Z;
		Standard_Real Z();

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "No available documentation.

Parameters
----------
rr: float

Returns
-------
IntPolyh_Point
") operator *;
		IntPolyh_Point operator *(const Standard_Real rr);

		/****************** operator + ******************/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "No available documentation.

Parameters
----------
P1: IntPolyh_Point

Returns
-------
IntPolyh_Point
") operator +;
		IntPolyh_Point operator +(const IntPolyh_Point & P1);

		/****************** operator - ******************/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "No available documentation.

Parameters
----------
P1: IntPolyh_Point

Returns
-------
IntPolyh_Point
") operator -;
		IntPolyh_Point operator -(const IntPolyh_Point & P1);

		/****************** operator / ******************/
		%feature("compactdefaultargs") operator /;
		%feature("autodoc", "No available documentation.

Parameters
----------
rr: float

Returns
-------
IntPolyh_Point
") operator /;
		IntPolyh_Point operator /(const Standard_Real rr);

};


%extend IntPolyh_Point {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IntPolyh_PointNormal *
*****************************/
class IntPolyh_PointNormal {
	public:
		gp_Pnt Point;
		gp_Vec Normal;
};


%extend IntPolyh_PointNormal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IntPolyh_SectionLine *
*****************************/
class IntPolyh_SectionLine {
	public:
		/****************** IntPolyh_SectionLine ******************/
		%feature("compactdefaultargs") IntPolyh_SectionLine;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntPolyh_SectionLine;
		 IntPolyh_SectionLine();

		/****************** IntPolyh_SectionLine ******************/
		%feature("compactdefaultargs") IntPolyh_SectionLine;
		%feature("autodoc", "No available documentation.

Parameters
----------
nn: int

Returns
-------
None
") IntPolyh_SectionLine;
		 IntPolyh_SectionLine(const Standard_Integer nn);

		/****************** ChangeValue ******************/
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
nn: int

Returns
-------
IntPolyh_StartPoint
") ChangeValue;
		IntPolyh_StartPoint & ChangeValue(const Standard_Integer nn);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: IntPolyh_SectionLine

Returns
-------
IntPolyh_SectionLine
") Copy;
		IntPolyh_SectionLine & Copy(const IntPolyh_SectionLine & Other);

		/****************** Destroy ******************/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Destroy;
		void Destroy();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Dump;
		void Dump();

		/****************** GetN ******************/
		%feature("compactdefaultargs") GetN;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") GetN;
		Standard_Integer GetN();

		/****************** IncrementNbStartPoints ******************/
		%feature("compactdefaultargs") IncrementNbStartPoints;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IncrementNbStartPoints;
		void IncrementNbStartPoints();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
nn: int

Returns
-------
None
") Init;
		void Init(const Standard_Integer nn);

		/****************** NbStartPoints ******************/
		%feature("compactdefaultargs") NbStartPoints;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbStartPoints;
		Standard_Integer NbStartPoints();

		/****************** Prepend ******************/
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "No available documentation.

Parameters
----------
SP: IntPolyh_StartPoint

Returns
-------
None
") Prepend;
		void Prepend(const IntPolyh_StartPoint & SP);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
nn: int

Returns
-------
IntPolyh_StartPoint
") Value;
		const IntPolyh_StartPoint & Value(const Standard_Integer nn);

};


%extend IntPolyh_SectionLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class IntPolyh_StartPoint *
****************************/
class IntPolyh_StartPoint {
	public:
		/****************** IntPolyh_StartPoint ******************/
		%feature("compactdefaultargs") IntPolyh_StartPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntPolyh_StartPoint;
		 IntPolyh_StartPoint();

		/****************** IntPolyh_StartPoint ******************/
		%feature("compactdefaultargs") IntPolyh_StartPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
xx: float
yy: float
zz: float
uu1: float
vv1: float
uu2: float
vv2: float
T1: int
E1: int
LAM1: float
T2: int
E2: int
LAM2: float
List: int

Returns
-------
None
") IntPolyh_StartPoint;
		 IntPolyh_StartPoint(const Standard_Real xx, const Standard_Real yy, const Standard_Real zz, const Standard_Real uu1, const Standard_Real vv1, const Standard_Real uu2, const Standard_Real vv2, const Standard_Integer T1, const Standard_Integer E1, const Standard_Real LAM1, const Standard_Integer T2, const Standard_Integer E2, const Standard_Real LAM2, const Standard_Integer List);

		/****************** ChainList ******************/
		%feature("compactdefaultargs") ChainList;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") ChainList;
		Standard_Integer ChainList();

		/****************** CheckSameSP ******************/
		%feature("compactdefaultargs") CheckSameSP;
		%feature("autodoc", "No available documentation.

Parameters
----------
SP: IntPolyh_StartPoint

Returns
-------
int
") CheckSameSP;
		Standard_Integer CheckSameSP(const IntPolyh_StartPoint & SP);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Dump;
		void Dump();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Parameters
----------
i: int

Returns
-------
None
") Dump;
		void Dump(const Standard_Integer i);

		/****************** E1 ******************/
		%feature("compactdefaultargs") E1;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") E1;
		Standard_Integer E1();

		/****************** E2 ******************/
		%feature("compactdefaultargs") E2;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") E2;
		Standard_Integer E2();

		/****************** GetAngle ******************/
		%feature("compactdefaultargs") GetAngle;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") GetAngle;
		Standard_Real GetAngle();

		/****************** GetEdgePoints ******************/
		%feature("compactdefaultargs") GetEdgePoints;
		%feature("autodoc", "No available documentation.

Parameters
----------
Triangle: IntPolyh_Triangle

Returns
-------
FirstEdgePoint: int
SecondEdgePoint: int
LastPoint: int
") GetEdgePoints;
		Standard_Integer GetEdgePoints(const IntPolyh_Triangle & Triangle, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** Lambda1 ******************/
		%feature("compactdefaultargs") Lambda1;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Lambda1;
		Standard_Real Lambda1();

		/****************** Lambda2 ******************/
		%feature("compactdefaultargs") Lambda2;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Lambda2;
		Standard_Real Lambda2();

		/****************** SetAngle ******************/
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "No available documentation.

Parameters
----------
ang: float

Returns
-------
None
") SetAngle;
		void SetAngle(const Standard_Real ang);

		/****************** SetChainList ******************/
		%feature("compactdefaultargs") SetChainList;
		%feature("autodoc", "No available documentation.

Parameters
----------
ChList: int

Returns
-------
None
") SetChainList;
		void SetChainList(const Standard_Integer ChList);

		/****************** SetCoupleValue ******************/
		%feature("compactdefaultargs") SetCoupleValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
IT1: int
IT2: int

Returns
-------
None
") SetCoupleValue;
		void SetCoupleValue(const Standard_Integer IT1, const Standard_Integer IT2);

		/****************** SetEdge1 ******************/
		%feature("compactdefaultargs") SetEdge1;
		%feature("autodoc", "No available documentation.

Parameters
----------
IE1: int

Returns
-------
None
") SetEdge1;
		void SetEdge1(const Standard_Integer IE1);

		/****************** SetEdge2 ******************/
		%feature("compactdefaultargs") SetEdge2;
		%feature("autodoc", "No available documentation.

Parameters
----------
IE2: int

Returns
-------
None
") SetEdge2;
		void SetEdge2(const Standard_Integer IE2);

		/****************** SetLambda1 ******************/
		%feature("compactdefaultargs") SetLambda1;
		%feature("autodoc", "No available documentation.

Parameters
----------
LAM1: float

Returns
-------
None
") SetLambda1;
		void SetLambda1(const Standard_Real LAM1);

		/****************** SetLambda2 ******************/
		%feature("compactdefaultargs") SetLambda2;
		%feature("autodoc", "No available documentation.

Parameters
----------
LAM2: float

Returns
-------
None
") SetLambda2;
		void SetLambda2(const Standard_Real LAM2);

		/****************** SetUV1 ******************/
		%feature("compactdefaultargs") SetUV1;
		%feature("autodoc", "No available documentation.

Parameters
----------
UU1: float
VV1: float

Returns
-------
None
") SetUV1;
		void SetUV1(const Standard_Real UU1, const Standard_Real VV1);

		/****************** SetUV2 ******************/
		%feature("compactdefaultargs") SetUV2;
		%feature("autodoc", "No available documentation.

Parameters
----------
UU2: float
VV2: float

Returns
-------
None
") SetUV2;
		void SetUV2(const Standard_Real UU2, const Standard_Real VV2);

		/****************** SetXYZ ******************/
		%feature("compactdefaultargs") SetXYZ;
		%feature("autodoc", "No available documentation.

Parameters
----------
XX: float
YY: float
ZZ: float

Returns
-------
None
") SetXYZ;
		void SetXYZ(const Standard_Real XX, const Standard_Real YY, const Standard_Real ZZ);

		/****************** T1 ******************/
		%feature("compactdefaultargs") T1;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") T1;
		Standard_Integer T1();

		/****************** T2 ******************/
		%feature("compactdefaultargs") T2;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") T2;
		Standard_Integer T2();

		/****************** U1 ******************/
		%feature("compactdefaultargs") U1;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") U1;
		Standard_Real U1();

		/****************** U2 ******************/
		%feature("compactdefaultargs") U2;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") U2;
		Standard_Real U2();

		/****************** V1 ******************/
		%feature("compactdefaultargs") V1;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") V1;
		Standard_Real V1();

		/****************** V2 ******************/
		%feature("compactdefaultargs") V2;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") V2;
		Standard_Real V2();

		/****************** X ******************/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") X;
		Standard_Real X();

		/****************** Y ******************/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Y;
		Standard_Real Y();

		/****************** Z ******************/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Z;
		Standard_Real Z();

};


%extend IntPolyh_StartPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class IntPolyh_Tools *
***********************/
class IntPolyh_Tools {
	public:
		/****************** ComputeDeflection ******************/
		%feature("compactdefaultargs") ComputeDeflection;
		%feature("autodoc", "Computes the deflection tolerance on the surface for the given sampling.

Parameters
----------
theSurf: Adaptor3d_HSurface
theUPars: TColStd_Array1OfReal
theVPars: TColStd_Array1OfReal

Returns
-------
float
") ComputeDeflection;
		static Standard_Real ComputeDeflection(const opencascade::handle<Adaptor3d_HSurface> & theSurf, const TColStd_Array1OfReal & theUPars, const TColStd_Array1OfReal & theVPars);

		/****************** FillArrayOfPointNormal ******************/
		%feature("compactdefaultargs") FillArrayOfPointNormal;
		%feature("autodoc", "Fills the array <thepoints> with the points (triangulation nodes) on the surface and normal directions of the surface in these points.

Parameters
----------
theSurf: Adaptor3d_HSurface
theUPars: TColStd_Array1OfReal
theVPars: TColStd_Array1OfReal
thePoints: IntPolyh_ArrayOfPointNormal

Returns
-------
None
") FillArrayOfPointNormal;
		static void FillArrayOfPointNormal(const opencascade::handle<Adaptor3d_HSurface> & theSurf, const TColStd_Array1OfReal & theUPars, const TColStd_Array1OfReal & theVPars, IntPolyh_ArrayOfPointNormal & thePoints);

		/****************** IsEnlargePossible ******************/
		%feature("compactdefaultargs") IsEnlargePossible;
		%feature("autodoc", "Checks if the surface can be enlarged in u or v direction.

Parameters
----------
theSurf: Adaptor3d_HSurface

Returns
-------
theUEnlarge: bool
theVEnlarge: bool
") IsEnlargePossible;
		static void IsEnlargePossible(const opencascade::handle<Adaptor3d_HSurface> & theSurf, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

		/****************** MakeSampling ******************/
		%feature("compactdefaultargs") MakeSampling;
		%feature("autodoc", "Makes the sampling of the given surface <thesurf> making the net of <thenbsu> x <thenbsv> sampling points. the flag <theenlargezone> controls the enlargement of the sampling zone on the surface. the parameters of the sampling points are stored into <theupars> and <thevpars> arrays.

Parameters
----------
theSurf: Adaptor3d_HSurface
theNbSU: int
theNbSV: int
theEnlargeZone: bool
theUPars: TColStd_Array1OfReal
theVPars: TColStd_Array1OfReal

Returns
-------
None
") MakeSampling;
		static void MakeSampling(const opencascade::handle<Adaptor3d_HSurface> & theSurf, const Standard_Integer theNbSU, const Standard_Integer theNbSV, const Standard_Boolean theEnlargeZone, TColStd_Array1OfReal & theUPars, TColStd_Array1OfReal & theVPars);

};


%extend IntPolyh_Tools {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class IntPolyh_Triangle *
**************************/
class IntPolyh_Triangle {
	public:
		/****************** IntPolyh_Triangle ******************/
		%feature("compactdefaultargs") IntPolyh_Triangle;
		%feature("autodoc", "Constructor.

Returns
-------
None
") IntPolyh_Triangle;
		 IntPolyh_Triangle();

		/****************** IntPolyh_Triangle ******************/
		%feature("compactdefaultargs") IntPolyh_Triangle;
		%feature("autodoc", "Constructor.

Parameters
----------
thePoint1: int
thePoint2: int
thePoint3: int

Returns
-------
None
") IntPolyh_Triangle;
		 IntPolyh_Triangle(const Standard_Integer thePoint1, const Standard_Integer thePoint2, const Standard_Integer thePoint3);

		/****************** BoundingBox ******************/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "Returns the bounding box of the triangle.

Parameters
----------
thePoints: IntPolyh_ArrayOfPoints

Returns
-------
Bnd_Box
") BoundingBox;
		const Bnd_Box & BoundingBox(const IntPolyh_ArrayOfPoints & thePoints);

		/****************** ComputeDeflection ******************/
		%feature("compactdefaultargs") ComputeDeflection;
		%feature("autodoc", "Computes the deflection for the triangle.

Parameters
----------
theSurface: Adaptor3d_HSurface
thePoints: IntPolyh_ArrayOfPoints

Returns
-------
float
") ComputeDeflection;
		Standard_Real ComputeDeflection(const opencascade::handle<Adaptor3d_HSurface> & theSurface, const IntPolyh_ArrayOfPoints & thePoints);

		/****************** Deflection ******************/
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "Returns the deflection of the triangle.

Returns
-------
float
") Deflection;
		Standard_Real Deflection();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Dumps the contents of the triangle.

Parameters
----------
v: int

Returns
-------
None
") Dump;
		void Dump(const Standard_Integer v);

		/****************** FirstEdge ******************/
		%feature("compactdefaultargs") FirstEdge;
		%feature("autodoc", "Returns the first edge.

Returns
-------
int
") FirstEdge;
		Standard_Integer FirstEdge();

		/****************** FirstEdgeOrientation ******************/
		%feature("compactdefaultargs") FirstEdgeOrientation;
		%feature("autodoc", "Returns the orientation of the first edge.

Returns
-------
int
") FirstEdgeOrientation;
		Standard_Integer FirstEdgeOrientation();

		/****************** FirstPoint ******************/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Returns the first point.

Returns
-------
int
") FirstPoint;
		Standard_Integer FirstPoint();

		/****************** GetEdgeNumber ******************/
		%feature("compactdefaultargs") GetEdgeNumber;
		%feature("autodoc", "Gets the edge number by the index.

Parameters
----------
theEdgeIndex: int

Returns
-------
int
") GetEdgeNumber;
		Standard_Integer GetEdgeNumber(const Standard_Integer theEdgeIndex);

		/****************** GetEdgeOrientation ******************/
		%feature("compactdefaultargs") GetEdgeOrientation;
		%feature("autodoc", "Gets the edges orientation by the index.

Parameters
----------
theEdgeIndex: int

Returns
-------
int
") GetEdgeOrientation;
		Standard_Integer GetEdgeOrientation(const Standard_Integer theEdgeIndex);

		/****************** GetNextTriangle ******************/
		%feature("compactdefaultargs") GetNextTriangle;
		%feature("autodoc", "Gets the adjacent triangle.

Parameters
----------
theTriangle: int
theEdgeNum: int
TEdges: IntPolyh_ArrayOfEdges

Returns
-------
int
") GetNextTriangle;
		Standard_Integer GetNextTriangle(const Standard_Integer theTriangle, const Standard_Integer theEdgeNum, const IntPolyh_ArrayOfEdges & TEdges);

		/****************** HasIntersection ******************/
		%feature("compactdefaultargs") HasIntersection;
		%feature("autodoc", "Returns true if the triangle has interfered the other triangle.

Returns
-------
bool
") HasIntersection;
		Standard_Boolean HasIntersection();

		/****************** IsDegenerated ******************/
		%feature("compactdefaultargs") IsDegenerated;
		%feature("autodoc", "Returns the degenerated flag.

Returns
-------
bool
") IsDegenerated;
		Standard_Boolean IsDegenerated();

		/****************** IsIntersectionPossible ******************/
		%feature("compactdefaultargs") IsIntersectionPossible;
		%feature("autodoc", "Returns possibility of the intersection.

Returns
-------
bool
") IsIntersectionPossible;
		Standard_Boolean IsIntersectionPossible();

		/****************** LinkEdges2Triangle ******************/
		%feature("compactdefaultargs") LinkEdges2Triangle;
		%feature("autodoc", "Links edges to triangle.

Parameters
----------
TEdges: IntPolyh_ArrayOfEdges
theEdge1: int
theEdge2: int
theEdge3: int

Returns
-------
None
") LinkEdges2Triangle;
		void LinkEdges2Triangle(const IntPolyh_ArrayOfEdges & TEdges, const Standard_Integer theEdge1, const Standard_Integer theEdge2, const Standard_Integer theEdge3);

		/****************** MiddleRefinement ******************/
		%feature("compactdefaultargs") MiddleRefinement;
		%feature("autodoc", "Splits the triangle on two to decrease its deflection.

Parameters
----------
theTriangleNumber: int
theSurface: Adaptor3d_HSurface
TPoints: IntPolyh_ArrayOfPoints
TTriangles: IntPolyh_ArrayOfTriangles
TEdges: IntPolyh_ArrayOfEdges

Returns
-------
None
") MiddleRefinement;
		void MiddleRefinement(const Standard_Integer theTriangleNumber, const opencascade::handle<Adaptor3d_HSurface> & theSurface, IntPolyh_ArrayOfPoints & TPoints, IntPolyh_ArrayOfTriangles & TTriangles, IntPolyh_ArrayOfEdges & TEdges);

		/****************** MultipleMiddleRefinement ******************/
		%feature("compactdefaultargs") MultipleMiddleRefinement;
		%feature("autodoc", "Splits the current triangle and new triangles until the refinement criterion is not achieved.

Parameters
----------
theRefineCriterion: float
theBox: Bnd_Box
theTriangleNumber: int
theSurface: Adaptor3d_HSurface
TPoints: IntPolyh_ArrayOfPoints
TTriangles: IntPolyh_ArrayOfTriangles
TEdges: IntPolyh_ArrayOfEdges

Returns
-------
None
") MultipleMiddleRefinement;
		void MultipleMiddleRefinement(const Standard_Real theRefineCriterion, const Bnd_Box & theBox, const Standard_Integer theTriangleNumber, const opencascade::handle<Adaptor3d_HSurface> & theSurface, IntPolyh_ArrayOfPoints & TPoints, IntPolyh_ArrayOfTriangles & TTriangles, IntPolyh_ArrayOfEdges & TEdges);

		/****************** SecondEdge ******************/
		%feature("compactdefaultargs") SecondEdge;
		%feature("autodoc", "Returns the second edge.

Returns
-------
int
") SecondEdge;
		Standard_Integer SecondEdge();

		/****************** SecondEdgeOrientation ******************/
		%feature("compactdefaultargs") SecondEdgeOrientation;
		%feature("autodoc", "Returns the orientation of the second edge.

Returns
-------
int
") SecondEdgeOrientation;
		Standard_Integer SecondEdgeOrientation();

		/****************** SecondPoint ******************/
		%feature("compactdefaultargs") SecondPoint;
		%feature("autodoc", "Returns the second point.

Returns
-------
int
") SecondPoint;
		Standard_Integer SecondPoint();

		/****************** SetDeflection ******************/
		%feature("compactdefaultargs") SetDeflection;
		%feature("autodoc", "Sets the deflection.

Parameters
----------
theDeflection: float

Returns
-------
None
") SetDeflection;
		void SetDeflection(const Standard_Real theDeflection);

		/****************** SetDegenerated ******************/
		%feature("compactdefaultargs") SetDegenerated;
		%feature("autodoc", "Sets the degenerated flag.

Parameters
----------
theDegFlag: bool

Returns
-------
None
") SetDegenerated;
		void SetDegenerated(const Standard_Boolean theDegFlag);

		/****************** SetEdge ******************/
		%feature("compactdefaultargs") SetEdge;
		%feature("autodoc", "Sets the edge by the index.

Parameters
----------
theEdgeIndex: int
theEdgeNumber: int

Returns
-------
None
") SetEdge;
		void SetEdge(const Standard_Integer theEdgeIndex, const Standard_Integer theEdgeNumber);

		/****************** SetEdgeAndOrientation ******************/
		%feature("compactdefaultargs") SetEdgeAndOrientation;
		%feature("autodoc", "Sets the appropriate edge and orientation for the triangle.

Parameters
----------
theEdge: IntPolyh_Edge
theEdgeIndex: int

Returns
-------
None
") SetEdgeAndOrientation;
		void SetEdgeAndOrientation(const IntPolyh_Edge & theEdge, const Standard_Integer theEdgeIndex);

		/****************** SetEdgeOrientation ******************/
		%feature("compactdefaultargs") SetEdgeOrientation;
		%feature("autodoc", "Sets the edges orientation by the index.

Parameters
----------
theEdgeIndex: int
theEdgeOrientation: int

Returns
-------
None
") SetEdgeOrientation;
		void SetEdgeOrientation(const Standard_Integer theEdgeIndex, const Standard_Integer theEdgeOrientation);

		/****************** SetFirstEdge ******************/
		%feature("compactdefaultargs") SetFirstEdge;
		%feature("autodoc", "Sets the first edge.

Parameters
----------
theEdge: int
theEdgeOrientation: int

Returns
-------
None
") SetFirstEdge;
		void SetFirstEdge(const Standard_Integer theEdge, const Standard_Integer theEdgeOrientation);

		/****************** SetFirstPoint ******************/
		%feature("compactdefaultargs") SetFirstPoint;
		%feature("autodoc", "Sets the first point.

Parameters
----------
thePoint: int

Returns
-------
None
") SetFirstPoint;
		void SetFirstPoint(const Standard_Integer thePoint);

		/****************** SetIntersection ******************/
		%feature("compactdefaultargs") SetIntersection;
		%feature("autodoc", "Sets the flag of intersection.

Parameters
----------
theInt: bool

Returns
-------
None
") SetIntersection;
		void SetIntersection(const Standard_Boolean theInt);

		/****************** SetIntersectionPossible ******************/
		%feature("compactdefaultargs") SetIntersectionPossible;
		%feature("autodoc", "Sets the flag of possibility of intersection.

Parameters
----------
theIP: bool

Returns
-------
None
") SetIntersectionPossible;
		void SetIntersectionPossible(const Standard_Boolean theIP);

		/****************** SetSecondEdge ******************/
		%feature("compactdefaultargs") SetSecondEdge;
		%feature("autodoc", "Sets the second edge.

Parameters
----------
theEdge: int
theEdgeOrientation: int

Returns
-------
None
") SetSecondEdge;
		void SetSecondEdge(const Standard_Integer theEdge, const Standard_Integer theEdgeOrientation);

		/****************** SetSecondPoint ******************/
		%feature("compactdefaultargs") SetSecondPoint;
		%feature("autodoc", "Sets the second point.

Parameters
----------
thePoint: int

Returns
-------
None
") SetSecondPoint;
		void SetSecondPoint(const Standard_Integer thePoint);

		/****************** SetThirdEdge ******************/
		%feature("compactdefaultargs") SetThirdEdge;
		%feature("autodoc", "Sets the third edge.

Parameters
----------
theEdge: int
theEdgeOrientation: int

Returns
-------
None
") SetThirdEdge;
		void SetThirdEdge(const Standard_Integer theEdge, const Standard_Integer theEdgeOrientation);

		/****************** SetThirdPoint ******************/
		%feature("compactdefaultargs") SetThirdPoint;
		%feature("autodoc", "Sets the third point.

Parameters
----------
thePoint: int

Returns
-------
None
") SetThirdPoint;
		void SetThirdPoint(const Standard_Integer thePoint);

		/****************** ThirdEdge ******************/
		%feature("compactdefaultargs") ThirdEdge;
		%feature("autodoc", "Returns the third edge.

Returns
-------
int
") ThirdEdge;
		Standard_Integer ThirdEdge();

		/****************** ThirdEdgeOrientation ******************/
		%feature("compactdefaultargs") ThirdEdgeOrientation;
		%feature("autodoc", "Returns the orientation of the third edge.

Returns
-------
int
") ThirdEdgeOrientation;
		Standard_Integer ThirdEdgeOrientation();

		/****************** ThirdPoint ******************/
		%feature("compactdefaultargs") ThirdPoint;
		%feature("autodoc", "Returns the third point.

Returns
-------
int
") ThirdPoint;
		Standard_Integer ThirdPoint();

};


%extend IntPolyh_Triangle {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def GetNextChainTriangle(self):
		pass
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class IntPolyh_Array:
	pass

@classnotwrapped
class IntPolyh_MaillageAffinage:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
