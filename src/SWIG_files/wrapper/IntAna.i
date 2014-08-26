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
%module IntAna

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

%include IntAna_required_python_modules.i
%include IntAna_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
enum IntAna_ResultType {
	IntAna_Point = 0,
	IntAna_Line = 1,
	IntAna_Circle = 2,
	IntAna_PointAndCircle = 3,
	IntAna_Ellipse = 4,
	IntAna_Parabola = 5,
	IntAna_Hyperbola = 6,
	IntAna_Empty = 7,
	IntAna_Same = 8,
	IntAna_NoGeometricSolution = 9,
};

/* end public enums declaration */

%nodefaultctor IntAna_Curve;
class IntAna_Curve {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty Constructor") IntAna_Curve;
		 IntAna_Curve ();
		%feature("autodoc", "Args:
	Cylinder(gp_Cylinder)
	Qxx(Standard_Real)
	Qyy(Standard_Real)
	Qzz(Standard_Real)
	Qxy(Standard_Real)
	Qxz(Standard_Real)
	Qyz(Standard_Real)
	Qx(Standard_Real)
	Qy(Standard_Real)
	Qz(Standard_Real)
	Q1(Standard_Real)
	Tol(Standard_Real)
	DomInf(Standard_Real)
	DomSup(Standard_Real)
	TwoZForATheta(Standard_Boolean)
	ZIsPositive(Standard_Boolean)

Returns:
	None

Sets the parameters used to compute Points and Derivative  
         on the curve.") SetCylinderQuadValues;
		void SetCylinderQuadValues (const gp_Cylinder & Cylinder,const Standard_Real Qxx,const Standard_Real Qyy,const Standard_Real Qzz,const Standard_Real Qxy,const Standard_Real Qxz,const Standard_Real Qyz,const Standard_Real Qx,const Standard_Real Qy,const Standard_Real Qz,const Standard_Real Q1,const Standard_Real Tol,const Standard_Real DomInf,const Standard_Real DomSup,const Standard_Boolean TwoZForATheta,const Standard_Boolean ZIsPositive);
		%feature("autodoc", "Args:
	Cone(gp_Cone)
	Qxx(Standard_Real)
	Qyy(Standard_Real)
	Qzz(Standard_Real)
	Qxy(Standard_Real)
	Qxz(Standard_Real)
	Qyz(Standard_Real)
	Qx(Standard_Real)
	Qy(Standard_Real)
	Qz(Standard_Real)
	Q1(Standard_Real)
	Tol(Standard_Real)
	DomInf(Standard_Real)
	DomSup(Standard_Real)
	TwoZForATheta(Standard_Boolean)
	ZIsPositive(Standard_Boolean)

Returns:
	None

Sets  the parameters used    to compute Points  and  
         Derivative on the curve.") SetConeQuadValues;
		void SetConeQuadValues (const gp_Cone & Cone,const Standard_Real Qxx,const Standard_Real Qyy,const Standard_Real Qzz,const Standard_Real Qxy,const Standard_Real Qxz,const Standard_Real Qyz,const Standard_Real Qx,const Standard_Real Qy,const Standard_Real Qz,const Standard_Real Q1,const Standard_Real Tol,const Standard_Real DomInf,const Standard_Real DomSup,const Standard_Boolean TwoZForATheta,const Standard_Boolean ZIsPositive);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns TRUE if the curve is not  infinite  at the  
         last parameter or at the first parameter of the domain.") IsOpen;
		Standard_Boolean IsOpen ();
		%feature("autodoc", "Args:
	Theta1(Standard_Real)
	Theta2(Standard_Real)

Returns:
	None

Returns the paramatric domain of the curve.") Domain;
		void Domain (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns TRUE if the function is constant.") IsConstant;
		Standard_Boolean IsConstant ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns TRUE if the domain is open at the beginning.") IsFirstOpen;
		Standard_Boolean IsFirstOpen ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns TRUE if the domain is open at the end.") IsLastOpen;
		Standard_Boolean IsLastOpen ();
		%feature("autodoc", "Args:
	Theta(Standard_Real)

Returns:
	gp_Pnt

Returns the point at parameter Theta on the curve.") Value;
		gp_Pnt Value (const Standard_Real Theta);
		%feature("autodoc", "Args:
	Theta(Standard_Real)
	P(gp_Pnt)
	V(gp_Vec)

Returns:
	Standard_Boolean

Returns the point and the first derivative at parameter  
         Theta on the curve.") D1u;
		Standard_Boolean D1u (const Standard_Real Theta,gp_Pnt & P,gp_Vec & V);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	Para(Standard_Real)

Returns:
	Standard_Boolean

Tries to find the parameter of the point P on the curve.  
         If the method returns False, the 'projection' is  
         impossible, and the value of Para is not significant.  
         If the method returns True, Para is the parameter of the  
         nearest intersection between the curve and the iso-theta  
         containing P.") FindParameter;
		Standard_Boolean FindParameter (const gp_Pnt & P,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Flag(Standard_Boolean)

Returns:
	None

If flag is True, the Curve is not defined at the  
         first parameter of its domain.") SetIsFirstOpen;
		void SetIsFirstOpen (const Standard_Boolean Flag);
		%feature("autodoc", "Args:
	Flag(Standard_Boolean)

Returns:
	None

If flag is True, the Curve is not defined at the  
         first parameter of its domain.") SetIsLastOpen;
		void SetIsLastOpen (const Standard_Boolean Flag);
		%feature("autodoc", "Args:
	Param(Standard_Real)
	U(Standard_Real)
	V(Standard_Real)
	A(Standard_Real)
	B(Standard_Real)
	C(Standard_Real)
	Co(Standard_Real)
	Si(Standard_Real)
	Di(Standard_Real)

Returns:
	None

Protected function.") InternalUVValue;
		void InternalUVValue (const Standard_Real Param,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Theta1(Standard_Real)
	Theta2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetDomain;
		void SetDomain (const Standard_Real Theta1,const Standard_Real Theta2);
};


%feature("shadow") IntAna_Curve::~IntAna_Curve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntAna_Curve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntAna_Int3Pln;
class IntAna_Int3Pln {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntAna_Int3Pln;
		 IntAna_Int3Pln ();
		%feature("autodoc", "Args:
	P1(gp_Pln)
	P2(gp_Pln)
	P3(gp_Pln)

Returns:
	None

Determination of the intersection point between  
         3 planes.") IntAna_Int3Pln;
		 IntAna_Int3Pln (const gp_Pln & P1,const gp_Pln & P2,const gp_Pln & P3);
		%feature("autodoc", "Args:
	P1(gp_Pln)
	P2(gp_Pln)
	P3(gp_Pln)

Returns:
	None

Determination of the intersection point between  
         3 planes.") Perform;
		void Perform (const gp_Pln & P1,const gp_Pln & P2,const gp_Pln & P3);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the computation was successful.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns TRUE if there is no intersection POINT.  
         If 2 planes are identical or parallel, IsEmpty  
         will return TRUE.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the intersection point.") Value;
		const gp_Pnt & Value ();
};


%feature("shadow") IntAna_Int3Pln::~IntAna_Int3Pln %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntAna_Int3Pln {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntAna_IntConicQuad;
class IntAna_IntConicQuad {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor.") IntAna_IntConicQuad;
		 IntAna_IntConicQuad ();
		%feature("autodoc", "Args:
	L(gp_Lin)
	Q(IntAna_Quadric)

Returns:
	None

Creates the intersection between a line and a quadric.") IntAna_IntConicQuad;
		 IntAna_IntConicQuad (const gp_Lin & L,const IntAna_Quadric & Q);
		%feature("autodoc", "Args:
	L(gp_Lin)
	Q(IntAna_Quadric)

Returns:
	None

Intersects a line and a quadric.") Perform;
		void Perform (const gp_Lin & L,const IntAna_Quadric & Q);
		%feature("autodoc", "Args:
	C(gp_Circ)
	Q(IntAna_Quadric)

Returns:
	None

Creates the intersection between a circle and a quadric.") IntAna_IntConicQuad;
		 IntAna_IntConicQuad (const gp_Circ & C,const IntAna_Quadric & Q);
		%feature("autodoc", "Args:
	C(gp_Circ)
	Q(IntAna_Quadric)

Returns:
	None

Intersects a circle and a quadric.") Perform;
		void Perform (const gp_Circ & C,const IntAna_Quadric & Q);
		%feature("autodoc", "Args:
	E(gp_Elips)
	Q(IntAna_Quadric)

Returns:
	None

Creates the intersection between an ellipse and a quadric.") IntAna_IntConicQuad;
		 IntAna_IntConicQuad (const gp_Elips & E,const IntAna_Quadric & Q);
		%feature("autodoc", "Args:
	E(gp_Elips)
	Q(IntAna_Quadric)

Returns:
	None

Intersects an ellipse and a quadric.") Perform;
		void Perform (const gp_Elips & E,const IntAna_Quadric & Q);
		%feature("autodoc", "Args:
	P(gp_Parab)
	Q(IntAna_Quadric)

Returns:
	None

Creates the intersection between a parabola and a quadric.") IntAna_IntConicQuad;
		 IntAna_IntConicQuad (const gp_Parab & P,const IntAna_Quadric & Q);
		%feature("autodoc", "Args:
	P(gp_Parab)
	Q(IntAna_Quadric)

Returns:
	None

Intersects a parabola and a quadric.") Perform;
		void Perform (const gp_Parab & P,const IntAna_Quadric & Q);
		%feature("autodoc", "Args:
	H(gp_Hypr)
	Q(IntAna_Quadric)

Returns:
	None

Creates the intersection between an hyperbola and  
         a quadric.") IntAna_IntConicQuad;
		 IntAna_IntConicQuad (const gp_Hypr & H,const IntAna_Quadric & Q);
		%feature("autodoc", "Args:
	H(gp_Hypr)
	Q(IntAna_Quadric)

Returns:
	None

Intersects an hyperbola and a quadric.") Perform;
		void Perform (const gp_Hypr & H,const IntAna_Quadric & Q);
		%feature("autodoc", "Args:
	L(gp_Lin)
	P(gp_Pln)
	Tolang(Standard_Real)
	Tol(Standard_Real)=0
	Len(Standard_Real)=0

Returns:
	None

Intersection between a line and a plane.  
         Tolang is used to determine if the angle between two  
         vectors is null.  
         Tol is used to check the distance between line and plane  
         on the distance <Len> from the origin of the line.") IntAna_IntConicQuad;
		 IntAna_IntConicQuad (const gp_Lin & L,const gp_Pln & P,const Standard_Real Tolang,const Standard_Real Tol = 0,const Standard_Real Len = 0);
		%feature("autodoc", "Args:
	L(gp_Lin)
	P(gp_Pln)
	Tolang(Standard_Real)
	Tol(Standard_Real)=0
	Len(Standard_Real)=0

Returns:
	None

Intersects a line and a plane.  
         Tolang is used to determine if the angle between two  
         vectors is null.  
         Tol is used to check the distance between line and plane  
         on the distance <Len> from the origin of the line.") Perform;
		void Perform (const gp_Lin & L,const gp_Pln & P,const Standard_Real Tolang,const Standard_Real Tol = 0,const Standard_Real Len = 0);
		%feature("autodoc", "Args:
	C(gp_Circ)
	P(gp_Pln)
	Tolang(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

Intersection between a circle and a plane.  
         Tolang is used to determine if the angle between two  
         vectors is null.  
         Tol is used to determine if a distance is null.") IntAna_IntConicQuad;
		 IntAna_IntConicQuad (const gp_Circ & C,const gp_Pln & P,const Standard_Real Tolang,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C(gp_Circ)
	P(gp_Pln)
	Tolang(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

Intersects a circle and a plane.  
         Tolang is used to determine if the angle between two  
         vectors is null.  
         Tol is used to determine if a distance is null.") Perform;
		void Perform (const gp_Circ & C,const gp_Pln & P,const Standard_Real Tolang,const Standard_Real Tol);
		%feature("autodoc", "Args:
	E(gp_Elips)
	P(gp_Pln)
	Tolang(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

Intersection between an ellipse and a plane.  
         Tolang is used to determine if the angle between two  
         vectors is null.  
         Tol is used to determine if a distance is null.") IntAna_IntConicQuad;
		 IntAna_IntConicQuad (const gp_Elips & E,const gp_Pln & P,const Standard_Real Tolang,const Standard_Real Tol);
		%feature("autodoc", "Args:
	E(gp_Elips)
	P(gp_Pln)
	Tolang(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

Intersects an ellipse and a plane.  
         Tolang is used to determine if the angle between two  
         vectors is null.  
         Tol is used to determine if a distance is null.") Perform;
		void Perform (const gp_Elips & E,const gp_Pln & P,const Standard_Real Tolang,const Standard_Real Tol);
		%feature("autodoc", "Args:
	Pb(gp_Parab)
	P(gp_Pln)
	Tolang(Standard_Real)

Returns:
	None

Intersection between a parabola and a plane.  
         Tolang is used to determine if the angle between two  
         vectors is null.") IntAna_IntConicQuad;
		 IntAna_IntConicQuad (const gp_Parab & Pb,const gp_Pln & P,const Standard_Real Tolang);
		%feature("autodoc", "Args:
	Pb(gp_Parab)
	P(gp_Pln)
	Tolang(Standard_Real)

Returns:
	None

Intersects a parabola and a plane.  
         Tolang is used to determine if the angle between two  
         vectors is null.") Perform;
		void Perform (const gp_Parab & Pb,const gp_Pln & P,const Standard_Real Tolang);
		%feature("autodoc", "Args:
	H(gp_Hypr)
	P(gp_Pln)
	Tolang(Standard_Real)

Returns:
	None

Intersection between an hyperbola and a plane.  
         Tolang is used to determine if the angle between two  
         vectors is null.") IntAna_IntConicQuad;
		 IntAna_IntConicQuad (const gp_Hypr & H,const gp_Pln & P,const Standard_Real Tolang);
		%feature("autodoc", "Args:
	H(gp_Hypr)
	P(gp_Pln)
	Tolang(Standard_Real)

Returns:
	None

Intersects an hyperbola and a plane.  
         Tolang is used to determine if the angle between two  
         vectors is null.") Perform;
		void Perform (const gp_Hypr & H,const gp_Pln & P,const Standard_Real Tolang);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns TRUE if the creation completed.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns TRUE if the conic is in the quadric.") IsInQuadric;
		Standard_Boolean IsInQuadric ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns TRUE if the line is in a quadric which  
         is parallel to the quadric.") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of intersection point.") NbPoints;
		Standard_Integer NbPoints ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	gp_Pnt

Returns the point of range N.") Point;
		const gp_Pnt & Point (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Real

Returns the parameter on the line of the intersection  
         point of range N.") ParamOnConic;
		Standard_Real ParamOnConic (const Standard_Integer N);
};


%feature("shadow") IntAna_IntConicQuad::~IntAna_IntConicQuad %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntAna_IntConicQuad {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntAna_IntLinTorus;
class IntAna_IntLinTorus {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntAna_IntLinTorus;
		 IntAna_IntLinTorus ();
		%feature("autodoc", "Args:
	L(gp_Lin)
	T(gp_Torus)

Returns:
	None

Creates the intersection between a line and a torus.") IntAna_IntLinTorus;
		 IntAna_IntLinTorus (const gp_Lin & L,const gp_Torus & T);
		%feature("autodoc", "Args:
	L(gp_Lin)
	T(gp_Torus)

Returns:
	None

Intersects a line and a torus.") Perform;
		void Perform (const gp_Lin & L,const gp_Torus & T);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the computation was successful.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of intersection points.") NbPoints;
		Standard_Integer NbPoints ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Pnt

Returns the intersection point of range Index.") Value;
		const gp_Pnt & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

Returns the parameter on the line of the intersection  
         point of range Index.") ParamOnLine;
		Standard_Real ParamOnLine (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	FI(Standard_Real)
	THETA(Standard_Real)

Returns:
	None

Returns the parameters on the torus of the intersection  
         point of range Index.") ParamOnTorus;
		void ParamOnTorus (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") IntAna_IntLinTorus::~IntAna_IntLinTorus %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntAna_IntLinTorus {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntAna_IntQuadQuad;
class IntAna_IntQuadQuad {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty Constructor") IntAna_IntQuadQuad;
		 IntAna_IntQuadQuad ();
		%feature("autodoc", "Args:
	C(gp_Cylinder)
	Q(IntAna_Quadric)
	Tol(Standard_Real)

Returns:
	None

Creates the intersection between a cylinder and a quadric .  
         Tol est a definir plus precisemment.") IntAna_IntQuadQuad;
		 IntAna_IntQuadQuad (const gp_Cylinder & C,const IntAna_Quadric & Q,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C(gp_Cone)
	Q(IntAna_Quadric)
	Tol(Standard_Real)

Returns:
	None

Creates the intersection between a cone and a quadric.  
         Tol est a definir plus precisemment.") IntAna_IntQuadQuad;
		 IntAna_IntQuadQuad (const gp_Cone & C,const IntAna_Quadric & Q,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C(gp_Cylinder)
	Q(IntAna_Quadric)
	Tol(Standard_Real)

Returns:
	None

Intersects a cylinder and a quadric .  
         Tol est a definir plus precisemment.") Perform;
		void Perform (const gp_Cylinder & C,const IntAna_Quadric & Q,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C(gp_Cone)
	Q(IntAna_Quadric)
	Tol(Standard_Real)

Returns:
	None

Intersects a cone and a quadric.  
         Tol est a definir plus precisemment.") Perform;
		void Perform (const gp_Cone & C,const IntAna_Quadric & Q,const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the computation was successful.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns TRUE if the cylinder, the cone or the sphere  
         is identical to the quadric.") IdenticalElements;
		Standard_Boolean IdenticalElements ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of curves solution.") NbCurve;
		Standard_Integer NbCurve ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	IntAna_Curve

Returns the curve of range N.") Curve;
		const IntAna_Curve & Curve (const Standard_Integer N);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of contact point.") NbPnt;
		Standard_Integer NbPnt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	gp_Pnt

Returns the point of range N.") Point;
		const gp_Pnt & Point (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)
	U1(Standard_Real)
	U2(Standard_Real)

Returns:
	None

Returns  the paramaters on the  'explicit quadric'  
         (i.e  the cylinder or the  cone, the  
         first argument   given to the constructor)  of the  
         point of  range  N.") Parameters;
		void Parameters (const Standard_Integer N,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Standard_Boolean

Returns True if the Curve I  shares its last bound  
         with another curve.") HasNextCurve;
		Standard_Boolean HasNextCurve (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	Opposite(Standard_Boolean)

Returns:
	Standard_Integer

If  HasNextCurve(I)  returns True,  this  function  
         returns  the  Index J  of the curve  which   has a  
         common bound  with the curve   I.  If  Opposite ==  
         True , then the last parameter of the curve I, and  
         the last parameter of  the curve J  give  the same  
         point. Else the last  parameter of the curve I and  
         the first parameter  of  the curve J are  the same  
         point.") NextCurve;
		Standard_Integer NextCurve (const Standard_Integer I,Standard_Boolean & Opposite);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Standard_Boolean

Returns True if the Curve I shares its first bound  
         with another curve.") HasPreviousCurve;
		Standard_Boolean HasPreviousCurve (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	Opposite(Standard_Boolean)

Returns:
	Standard_Integer

if HasPreviousCurve(I) returns True, this function  
         returns the   Index  J of the   curve  which has a  
         common  bound with the  curve  I.  If Opposite  ==  
         True  , then the  first parameter of  the curve I,  
         and the first parameter of the curve  J  give  the  
         same point. Else the first  parameter of the curve  
         I and the last  parameter  of the curve J  are the  
         same point.") PreviousCurve;
		Standard_Integer PreviousCurve (const Standard_Integer I,Standard_Boolean & Opposite);
};


%feature("shadow") IntAna_IntQuadQuad::~IntAna_IntQuadQuad %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntAna_IntQuadQuad {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntAna_ListIteratorOfListOfCurve;
class IntAna_ListIteratorOfListOfCurve {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntAna_ListIteratorOfListOfCurve;
		 IntAna_ListIteratorOfListOfCurve ();
		%feature("autodoc", "Args:
	L(IntAna_ListOfCurve)

Returns:
	None

No detailed docstring for this function.") IntAna_ListIteratorOfListOfCurve;
		 IntAna_ListIteratorOfListOfCurve (const IntAna_ListOfCurve & L);
		%feature("autodoc", "Args:
	L(IntAna_ListOfCurve)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const IntAna_ListOfCurve & L);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	IntAna_Curve

No detailed docstring for this function.") Value;
		IntAna_Curve & Value ();
};


%feature("shadow") IntAna_ListIteratorOfListOfCurve::~IntAna_ListIteratorOfListOfCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntAna_ListIteratorOfListOfCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntAna_ListNodeOfListOfCurve;
class IntAna_ListNodeOfListOfCurve : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	I(IntAna_Curve)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") IntAna_ListNodeOfListOfCurve;
		 IntAna_ListNodeOfListOfCurve (const IntAna_Curve & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	IntAna_Curve

No detailed docstring for this function.") Value;
		IntAna_Curve & Value ();
};


%feature("shadow") IntAna_ListNodeOfListOfCurve::~IntAna_ListNodeOfListOfCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntAna_ListNodeOfListOfCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IntAna_ListNodeOfListOfCurve {
	Handle_IntAna_ListNodeOfListOfCurve GetHandle() {
	return *(Handle_IntAna_ListNodeOfListOfCurve*) &$self;
	}
};

%nodefaultctor Handle_IntAna_ListNodeOfListOfCurve;
class Handle_IntAna_ListNodeOfListOfCurve : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_IntAna_ListNodeOfListOfCurve();
        Handle_IntAna_ListNodeOfListOfCurve(const Handle_IntAna_ListNodeOfListOfCurve &aHandle);
        Handle_IntAna_ListNodeOfListOfCurve(const IntAna_ListNodeOfListOfCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntAna_ListNodeOfListOfCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntAna_ListNodeOfListOfCurve {
    IntAna_ListNodeOfListOfCurve* GetObject() {
    return (IntAna_ListNodeOfListOfCurve*)$self->Access();
    }
};
%feature("shadow") Handle_IntAna_ListNodeOfListOfCurve::~Handle_IntAna_ListNodeOfListOfCurve %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IntAna_ListNodeOfListOfCurve {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IntAna_ListOfCurve;
class IntAna_ListOfCurve {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntAna_ListOfCurve;
		 IntAna_ListOfCurve ();
		%feature("autodoc", "Args:
	Other(IntAna_ListOfCurve)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const IntAna_ListOfCurve & Other);
		%feature("autodoc", "Args:
	Other(IntAna_ListOfCurve)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const IntAna_ListOfCurve & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	I(IntAna_Curve)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const IntAna_Curve & I);
		%feature("autodoc", "Args:
	I(IntAna_Curve)
	theIt(IntAna_ListIteratorOfListOfCurve)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const IntAna_Curve & I,IntAna_ListIteratorOfListOfCurve & theIt);
		%feature("autodoc", "Args:
	Other(IntAna_ListOfCurve)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (IntAna_ListOfCurve & Other);
		%feature("autodoc", "Args:
	I(IntAna_Curve)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const IntAna_Curve & I);
		%feature("autodoc", "Args:
	I(IntAna_Curve)
	theIt(IntAna_ListIteratorOfListOfCurve)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const IntAna_Curve & I,IntAna_ListIteratorOfListOfCurve & theIt);
		%feature("autodoc", "Args:
	Other(IntAna_ListOfCurve)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (IntAna_ListOfCurve & Other);
		%feature("autodoc", "Args:
	None
Returns:
	IntAna_Curve

No detailed docstring for this function.") First;
		IntAna_Curve & First ();
		%feature("autodoc", "Args:
	None
Returns:
	IntAna_Curve

No detailed docstring for this function.") Last;
		IntAna_Curve & Last ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(IntAna_ListIteratorOfListOfCurve)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (IntAna_ListIteratorOfListOfCurve & It);
		%feature("autodoc", "Args:
	I(IntAna_Curve)
	It(IntAna_ListIteratorOfListOfCurve)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const IntAna_Curve & I,IntAna_ListIteratorOfListOfCurve & It);
		%feature("autodoc", "Args:
	Other(IntAna_ListOfCurve)
	It(IntAna_ListIteratorOfListOfCurve)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (IntAna_ListOfCurve & Other,IntAna_ListIteratorOfListOfCurve & It);
		%feature("autodoc", "Args:
	I(IntAna_Curve)
	It(IntAna_ListIteratorOfListOfCurve)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const IntAna_Curve & I,IntAna_ListIteratorOfListOfCurve & It);
		%feature("autodoc", "Args:
	Other(IntAna_ListOfCurve)
	It(IntAna_ListIteratorOfListOfCurve)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (IntAna_ListOfCurve & Other,IntAna_ListIteratorOfListOfCurve & It);
};


%feature("shadow") IntAna_ListOfCurve::~IntAna_ListOfCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntAna_ListOfCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntAna_QuadQuadGeo;
class IntAna_QuadQuadGeo {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor.") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo ();
		%feature("autodoc", "Args:
	P1(gp_Pln)
	P2(gp_Pln)
	TolAng(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

Creates the intersection between two planes.  
         TolAng is the angular tolerance used to determine  
         if the planes are parallel.  
         Tol is the tolerance used to determine if the planes  
         are identical (only when they are parallel).") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo (const gp_Pln & P1,const gp_Pln & P2,const Standard_Real TolAng,const Standard_Real Tol);
		%feature("autodoc", "Args:
	P1(gp_Pln)
	P2(gp_Pln)
	TolAng(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

Intersects two planes.  
         TolAng is the angular tolerance used to determine  
         if the planes are parallel.  
         Tol is the tolerance used to determine if the planes  
         are identical (only when they are parallel).") Perform;
		void Perform (const gp_Pln & P1,const gp_Pln & P2,const Standard_Real TolAng,const Standard_Real Tol);
		%feature("autodoc", "Args:
	P(gp_Pln)
	C(gp_Cylinder)
	Tolang(Standard_Real)
	Tol(Standard_Real)
	H(Standard_Real)=0

Returns:
	None

Creates the intersection between a plane and a cylinder.  
         TolAng is the angular tolerance used to determine  
         if the axis of the cylinder is parallel to the plane.  
         Tol is the tolerance used to determine if the result  
         is a circle or an ellipse. If the maximum distance between  
         the ellipse solution and the circle centered at the ellipse  
         center is less than Tol, the result will be the circle.  
         H is the height of the cylinder <Cyl>. It is  used to check  
         whether the plane and cylinder are parallel.") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo (const gp_Pln & P,const gp_Cylinder & C,const Standard_Real Tolang,const Standard_Real Tol,const Standard_Real H = 0);
		%feature("autodoc", "Args:
	P(gp_Pln)
	C(gp_Cylinder)
	Tolang(Standard_Real)
	Tol(Standard_Real)
	H(Standard_Real)=0

Returns:
	None

Intersects a plane and a cylinder.  
         TolAng is the angular tolerance used to determine  
         if the axis of the cylinder is parallel to the plane.  
         Tol is the tolerance used to determine if the result  
         is a circle or an ellipse. If the maximum distance between  
         the ellipse solution and the circle centered at the ellipse  
         center is less than Tol, the result will be the circle.  
         H is the height of the cylinder <Cyl>. It is  used to check  
         whether the plane and cylinder are parallel.") Perform;
		void Perform (const gp_Pln & P,const gp_Cylinder & C,const Standard_Real Tolang,const Standard_Real Tol,const Standard_Real H = 0);
		%feature("autodoc", "Args:
	P(gp_Pln)
	S(gp_Sphere)

Returns:
	None

Creates the intersection between a plane and a sphere.") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo (const gp_Pln & P,const gp_Sphere & S);
		%feature("autodoc", "Args:
	P(gp_Pln)
	S(gp_Sphere)

Returns:
	None

Intersects a plane and a sphere.") Perform;
		void Perform (const gp_Pln & P,const gp_Sphere & S);
		%feature("autodoc", "Args:
	P(gp_Pln)
	C(gp_Cone)
	Tolang(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

Creates the intersection between a plane and a cone.  
         TolAng is the angular tolerance used to determine  
         if the axis of the cone is parallel or perpendicular  
         to the plane, and if the generating line of the cone  
         is parallel to the plane.  
         Tol is the tolerance used to determine if the apex  
         of the cone is in the plane.") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo (const gp_Pln & P,const gp_Cone & C,const Standard_Real Tolang,const Standard_Real Tol);
		%feature("autodoc", "Args:
	P(gp_Pln)
	C(gp_Cone)
	Tolang(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

Intersects a plane and a cone.  
         TolAng is the angular tolerance used to determine  
         if the axis of the cone is parallel or perpendicular  
         to the plane, and if the generating line of the cone  
         is parallel to the plane.  
         Tol is the tolerance used to determine if the apex  
         of the cone is in the plane.") Perform;
		void Perform (const gp_Pln & P,const gp_Cone & C,const Standard_Real Tolang,const Standard_Real Tol);
		%feature("autodoc", "Args:
	Cyl1(gp_Cylinder)
	Cyl2(gp_Cylinder)
	Tol(Standard_Real)

Returns:
	None

Creates the intersection between two cylinders.") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo (const gp_Cylinder & Cyl1,const gp_Cylinder & Cyl2,const Standard_Real Tol);
		%feature("autodoc", "Args:
	Cyl1(gp_Cylinder)
	Cyl2(gp_Cylinder)
	Tol(Standard_Real)

Returns:
	None

Intersects two cylinders") Perform;
		void Perform (const gp_Cylinder & Cyl1,const gp_Cylinder & Cyl2,const Standard_Real Tol);
		%feature("autodoc", "Args:
	Cyl(gp_Cylinder)
	Sph(gp_Sphere)
	Tol(Standard_Real)

Returns:
	None

Creates the intersection between a Cylinder and a Sphere.") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo (const gp_Cylinder & Cyl,const gp_Sphere & Sph,const Standard_Real Tol);
		%feature("autodoc", "Args:
	Cyl(gp_Cylinder)
	Sph(gp_Sphere)
	Tol(Standard_Real)

Returns:
	None

Intersects a cylinder and a sphere.") Perform;
		void Perform (const gp_Cylinder & Cyl,const gp_Sphere & Sph,const Standard_Real Tol);
		%feature("autodoc", "Args:
	Cyl(gp_Cylinder)
	Con(gp_Cone)
	Tol(Standard_Real)

Returns:
	None

Creates the intersection between a Cylinder and a Cone") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo (const gp_Cylinder & Cyl,const gp_Cone & Con,const Standard_Real Tol);
		%feature("autodoc", "Args:
	Cyl(gp_Cylinder)
	Con(gp_Cone)
	Tol(Standard_Real)

Returns:
	None

Intersects a cylinder and a cone.") Perform;
		void Perform (const gp_Cylinder & Cyl,const gp_Cone & Con,const Standard_Real Tol);
		%feature("autodoc", "Args:
	Sph1(gp_Sphere)
	Sph2(gp_Sphere)
	Tol(Standard_Real)

Returns:
	None

Creates the intersection between two Spheres.") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo (const gp_Sphere & Sph1,const gp_Sphere & Sph2,const Standard_Real Tol);
		%feature("autodoc", "Args:
	Sph1(gp_Sphere)
	Sph2(gp_Sphere)
	Tol(Standard_Real)

Returns:
	None

Intersects a two spheres.") Perform;
		void Perform (const gp_Sphere & Sph1,const gp_Sphere & Sph2,const Standard_Real Tol);
		%feature("autodoc", "Args:
	Sph(gp_Sphere)
	Con(gp_Cone)
	Tol(Standard_Real)

Returns:
	None

Creates the intersection beween a Sphere and a Cone.") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo (const gp_Sphere & Sph,const gp_Cone & Con,const Standard_Real Tol);
		%feature("autodoc", "Args:
	Sph(gp_Sphere)
	Con(gp_Cone)
	Tol(Standard_Real)

Returns:
	None

Intersects a sphere and a cone.") Perform;
		void Perform (const gp_Sphere & Sph,const gp_Cone & Con,const Standard_Real Tol);
		%feature("autodoc", "Args:
	Con1(gp_Cone)
	Con2(gp_Cone)
	Tol(Standard_Real)

Returns:
	None

Creates the intersection beween two cones.") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo (const gp_Cone & Con1,const gp_Cone & Con2,const Standard_Real Tol);
		%feature("autodoc", "Args:
	Con1(gp_Cone)
	Con2(gp_Cone)
	Tol(Standard_Real)

Returns:
	None

Intersects two cones.") Perform;
		void Perform (const gp_Cone & Con1,const gp_Cone & Con2,const Standard_Real Tol);
		%feature("autodoc", "Args:
	Pln(gp_Pln)
	Tor(gp_Torus)
	Tol(Standard_Real)

Returns:
	None

Creates the intersection beween plane and torus.") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo (const gp_Pln & Pln,const gp_Torus & Tor,const Standard_Real Tol);
		%feature("autodoc", "Args:
	Pln(gp_Pln)
	Tor(gp_Torus)
	Tol(Standard_Real)

Returns:
	None

Intersects plane and torus.") Perform;
		void Perform (const gp_Pln & Pln,const gp_Torus & Tor,const Standard_Real Tol);
		%feature("autodoc", "Args:
	Cyl(gp_Cylinder)
	Tor(gp_Torus)
	Tol(Standard_Real)

Returns:
	None

Creates the intersection beween cylinder and torus.") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo (const gp_Cylinder & Cyl,const gp_Torus & Tor,const Standard_Real Tol);
		%feature("autodoc", "Args:
	Cyl(gp_Cylinder)
	Tor(gp_Torus)
	Tol(Standard_Real)

Returns:
	None

Intersects cylinder and torus.") Perform;
		void Perform (const gp_Cylinder & Cyl,const gp_Torus & Tor,const Standard_Real Tol);
		%feature("autodoc", "Args:
	Con(gp_Cone)
	Tor(gp_Torus)
	Tol(Standard_Real)

Returns:
	None

Creates the intersection beween cone and torus.") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo (const gp_Cone & Con,const gp_Torus & Tor,const Standard_Real Tol);
		%feature("autodoc", "Args:
	Con(gp_Cone)
	Tor(gp_Torus)
	Tol(Standard_Real)

Returns:
	None

Intersects cone and torus.") Perform;
		void Perform (const gp_Cone & Con,const gp_Torus & Tor,const Standard_Real Tol);
		%feature("autodoc", "Args:
	Sph(gp_Sphere)
	Tor(gp_Torus)
	Tol(Standard_Real)

Returns:
	None

Creates the intersection beween sphere and torus.") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo (const gp_Sphere & Sph,const gp_Torus & Tor,const Standard_Real Tol);
		%feature("autodoc", "Args:
	Sph(gp_Sphere)
	Tor(gp_Torus)
	Tol(Standard_Real)

Returns:
	None

Intersects sphere and torus.") Perform;
		void Perform (const gp_Sphere & Sph,const gp_Torus & Tor,const Standard_Real Tol);
		%feature("autodoc", "Args:
	Tor1(gp_Torus)
	Tor2(gp_Torus)
	Tol(Standard_Real)

Returns:
	None

Creates the intersection beween two toruses.") IntAna_QuadQuadGeo;
		 IntAna_QuadQuadGeo (const gp_Torus & Tor1,const gp_Torus & Tor2,const Standard_Real Tol);
		%feature("autodoc", "Args:
	Tor1(gp_Torus)
	Tor2(gp_Torus)
	Tol(Standard_Real)

Returns:
	None

Intersects two toruses.") Perform;
		void Perform (const gp_Torus & Tor1,const gp_Torus & Tor2,const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns Standard_True if the computation was successful.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	IntAna_ResultType

Returns the type of intersection.") TypeInter;
		IntAna_ResultType TypeInter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of interesections.  
         The possible intersections are :  
          - 1 point  
          - 1 or 2 line(s)  
          - 1 Point and 1 Line  
          - 1 circle  
          - 1 ellipse  
          - 1 parabola  
          - 1 or 2 hyperbola(s).") NbSolutions;
		Standard_Integer NbSolutions ();
		%feature("autodoc", "Args:
	Num(Standard_Integer)

Returns:
	gp_Pnt

Returns the point solution of range Num.") Point;
		gp_Pnt Point (const Standard_Integer Num);
		%feature("autodoc", "Args:
	Num(Standard_Integer)

Returns:
	gp_Lin

Returns the line solution of range Num.") Line;
		gp_Lin Line (const Standard_Integer Num);
		%feature("autodoc", "Args:
	Num(Standard_Integer)

Returns:
	gp_Circ

Returns the circle solution of range Num.") Circle;
		gp_Circ Circle (const Standard_Integer Num);
		%feature("autodoc", "Args:
	Num(Standard_Integer)

Returns:
	gp_Elips

Returns the ellipse solution of range Num.") Ellipse;
		gp_Elips Ellipse (const Standard_Integer Num);
		%feature("autodoc", "Args:
	Num(Standard_Integer)

Returns:
	gp_Parab

Returns the parabola solution of range Num.") Parabola;
		gp_Parab Parabola (const Standard_Integer Num);
		%feature("autodoc", "Args:
	Num(Standard_Integer)

Returns:
	gp_Hypr

Returns the hyperbola solution of range Num.") Hyperbola;
		gp_Hypr Hyperbola (const Standard_Integer Num);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") HasCommonGen;
		Standard_Boolean HasCommonGen ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

No detailed docstring for this function.") PChar;
		const gp_Pnt & PChar ();
};


%feature("shadow") IntAna_QuadQuadGeo::~IntAna_QuadQuadGeo %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntAna_QuadQuadGeo {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntAna_Quadric;
class IntAna_Quadric {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty Constructor") IntAna_Quadric;
		 IntAna_Quadric ();
		%feature("autodoc", "Args:
	P(gp_Pln)

Returns:
	None

Creates a Quadric from a Pln") IntAna_Quadric;
		 IntAna_Quadric (const gp_Pln & P);
		%feature("autodoc", "Args:
	Sph(gp_Sphere)

Returns:
	None

Creates a Quadric from a Sphere") IntAna_Quadric;
		 IntAna_Quadric (const gp_Sphere & Sph);
		%feature("autodoc", "Args:
	Cyl(gp_Cylinder)

Returns:
	None

Creates a Quadric from a Cylinder") IntAna_Quadric;
		 IntAna_Quadric (const gp_Cylinder & Cyl);
		%feature("autodoc", "Args:
	Cone(gp_Cone)

Returns:
	None

Creates a Quadric from a Cone") IntAna_Quadric;
		 IntAna_Quadric (const gp_Cone & Cone);
		%feature("autodoc", "Args:
	P(gp_Pln)

Returns:
	None

Initializes the quadric with a Pln") SetQuadric;
		void SetQuadric (const gp_Pln & P);
		%feature("autodoc", "Args:
	Sph(gp_Sphere)

Returns:
	None

Initialize the quadric with a Sphere") SetQuadric;
		void SetQuadric (const gp_Sphere & Sph);
		%feature("autodoc", "Args:
	Con(gp_Cone)

Returns:
	None

Initializes the quadric with a Cone") SetQuadric;
		void SetQuadric (const gp_Cone & Con);
		%feature("autodoc", "Args:
	Cyl(gp_Cylinder)

Returns:
	None

Initializes the quadric with a Cylinder") SetQuadric;
		void SetQuadric (const gp_Cylinder & Cyl);
		%feature("autodoc", "Args:
	xCXX(Standard_Real)
	xCYY(Standard_Real)
	xCZZ(Standard_Real)
	xCXY(Standard_Real)
	xCXZ(Standard_Real)
	xCYZ(Standard_Real)
	xCX(Standard_Real)
	xCY(Standard_Real)
	xCZ(Standard_Real)
	xCCte(Standard_Real)

Returns:
	None

Returns the coefficients of the polynomial equation  
         which define the quadric:  
         xCXX x**2 + xCYY y**2 + xCZZ z**2  
         + 2 ( xCXY x y  + xCXZ x z  + xCYZ y z  )  
         + 2 ( xCX x + xCY y + xCZ z )  
         + xCCte") Coefficients;
		void Coefficients (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	xCXX(Standard_Real)
	xCYY(Standard_Real)
	xCZZ(Standard_Real)
	xCXY(Standard_Real)
	xCXZ(Standard_Real)
	xCYZ(Standard_Real)
	xCX(Standard_Real)
	xCY(Standard_Real)
	xCZ(Standard_Real)
	xCCte(Standard_Real)
	Axis(gp_Ax3)

Returns:
	None

Returns the coefficients of the polynomial equation  
         ( written in the natural coordinates system )  
         in the local coordinates system defined by Axis") NewCoefficients;
		void NewCoefficients (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,const gp_Ax3 & Axis);
};


%feature("shadow") IntAna_Quadric::~IntAna_Quadric %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntAna_Quadric {
	void _kill_pointed() {
		delete $self;
	}
};
