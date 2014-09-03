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
%module (package="OCC") GC

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

%include GC_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor GC_MakeMirror;
class GC_MakeMirror {
	public:
		%feature("autodoc", "Args:
	Point(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") GC_MakeMirror;
		 GC_MakeMirror (const gp_Pnt & Point);
		%feature("autodoc", "Args:
	Axis(gp_Ax1)

Returns:
	None

No detailed docstring for this function.") GC_MakeMirror;
		 GC_MakeMirror (const gp_Ax1 & Axis);
		%feature("autodoc", "Args:
	Line(gp_Lin)

Returns:
	None

No detailed docstring for this function.") GC_MakeMirror;
		 GC_MakeMirror (const gp_Lin & Line);
		%feature("autodoc", "Args:
	Point(gp_Pnt)
	Direc(gp_Dir)

Returns:
	None

Make a symetry transformation af axis defined by  
         <Point> and <Direc>.") GC_MakeMirror;
		 GC_MakeMirror (const gp_Pnt & Point,const gp_Dir & Direc);
		%feature("autodoc", "Args:
	Plane(gp_Pln)

Returns:
	None

Make a symetry transformation of plane <Plane>.") GC_MakeMirror;
		 GC_MakeMirror (const gp_Pln & Plane);
		%feature("autodoc", "Args:
	Plane(gp_Ax2)

Returns:
	None

Make a symetry transformation of plane <Plane>.") GC_MakeMirror;
		 GC_MakeMirror (const gp_Ax2 & Plane);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Transformation

Returns the constructed transformation.") Value;
		const Handle_Geom_Transformation & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Transformation

No detailed docstring for this function.") Operator;
		const Handle_Geom_Transformation & Operator ();
};


%feature("shadow") GC_MakeMirror::~GC_MakeMirror %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GC_MakeMirror {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GC_MakeRotation;
class GC_MakeRotation {
	public:
		%feature("autodoc", "Args:
	Line(gp_Lin)
	Angle(Standard_Real)

Returns:
	None

Constructs a rotation through angle Angle about the axis defined by the line Line.") GC_MakeRotation;
		 GC_MakeRotation (const gp_Lin & Line,const Standard_Real Angle);
		%feature("autodoc", "Args:
	Axis(gp_Ax1)
	Angle(Standard_Real)

Returns:
	None

Constructs a rotation through angle Angle about the axis defined by the axis Axis.") GC_MakeRotation;
		 GC_MakeRotation (const gp_Ax1 & Axis,const Standard_Real Angle);
		%feature("autodoc", "Args:
	Point(gp_Pnt)
	Direc(gp_Dir)
	Angle(Standard_Real)

Returns:
	None

Constructs a rotation through angle Angle about the axis  
defined by the point Point and the unit vector Direc.") GC_MakeRotation;
		 GC_MakeRotation (const gp_Pnt & Point,const gp_Dir & Direc,const Standard_Real Angle);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Transformation

Returns the constructed transformation.") Value;
		const Handle_Geom_Transformation & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Transformation

No detailed docstring for this function.") Operator;
		const Handle_Geom_Transformation & Operator ();
};


%feature("shadow") GC_MakeRotation::~GC_MakeRotation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GC_MakeRotation {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GC_MakeScale;
class GC_MakeScale {
	public:
		%feature("autodoc", "Args:
	Point(gp_Pnt)
	Scale(Standard_Real)

Returns:
	None

Constructs a scaling transformation with  
-   Point as the center of the transformation, and  
-   Scale as the scale factor.") GC_MakeScale;
		 GC_MakeScale (const gp_Pnt & Point,const Standard_Real Scale);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Transformation

Returns the constructed transformation.") Value;
		const Handle_Geom_Transformation & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Transformation

No detailed docstring for this function.") Operator;
		const Handle_Geom_Transformation & Operator ();
};


%feature("shadow") GC_MakeScale::~GC_MakeScale %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GC_MakeScale {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GC_MakeTranslation;
class GC_MakeTranslation {
	public:
		%feature("autodoc", "Args:
	Vect(gp_Vec)

Returns:
	None

Constructs a translation along the vector ' Vect '") GC_MakeTranslation;
		 GC_MakeTranslation (const gp_Vec & Vect);
		%feature("autodoc", "Args:
	Point1(gp_Pnt)
	Point2(gp_Pnt)

Returns:
	None

Constructs a translation along the vector (Point1,Point2)  
 defined from the point Point1 to the point Point2.") GC_MakeTranslation;
		 GC_MakeTranslation (const gp_Pnt & Point1,const gp_Pnt & Point2);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Transformation

Returns the constructed transformation.") Value;
		const Handle_Geom_Transformation & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Transformation

No detailed docstring for this function.") Operator;
		const Handle_Geom_Transformation & Operator ();
};


%feature("shadow") GC_MakeTranslation::~GC_MakeTranslation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GC_MakeTranslation {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GC_Root;
class GC_Root {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the construction is successful.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	gce_ErrorType

Returns the status of the construction:  
-   gce_Done, if the construction is successful, or  
-   another value of the gce_ErrorType enumeration  
  indicating why the construction failed.") Status;
		gce_ErrorType Status ();
};


%feature("shadow") GC_Root::~GC_Root %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GC_Root {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GC_MakeArcOfCircle;
class GC_MakeArcOfCircle : public GC_Root {
	public:
		%feature("autodoc", "Args:
	Circ(gp_Circ)
	Alpha1(Standard_Real)
	Alpha2(Standard_Real)
	Sense(Standard_Boolean)

Returns:
	None

Make an arc of circle (TrimmedCurve from Geom) from  
         a circle between two angles Alpha1 and Alpha2  
         given in radiians.") GC_MakeArcOfCircle;
		 GC_MakeArcOfCircle (const gp_Circ & Circ,const Standard_Real Alpha1,const Standard_Real Alpha2,const Standard_Boolean Sense);
		%feature("autodoc", "Args:
	Circ(gp_Circ)
	P(gp_Pnt)
	Alpha(Standard_Real)
	Sense(Standard_Boolean)

Returns:
	None

Make an arc of circle (TrimmedCurve from Geom) from  
         a circle between point <P> and the angle Alpha  
         given in radians.") GC_MakeArcOfCircle;
		 GC_MakeArcOfCircle (const gp_Circ & Circ,const gp_Pnt & P,const Standard_Real Alpha,const Standard_Boolean Sense);
		%feature("autodoc", "Args:
	Circ(gp_Circ)
	P1(gp_Pnt)
	P2(gp_Pnt)
	Sense(Standard_Boolean)

Returns:
	None

Make an arc of circle (TrimmedCurve from Geom) from  
         a circle between two points P1 and P2.") GC_MakeArcOfCircle;
		 GC_MakeArcOfCircle (const gp_Circ & Circ,const gp_Pnt & P1,const gp_Pnt & P2,const Standard_Boolean Sense);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)
	P3(gp_Pnt)

Returns:
	None

Make an arc of circle (TrimmedCurve from Geom) from  
         three points P1,P2,P3 between two points P1 and P2.") GC_MakeArcOfCircle;
		 GC_MakeArcOfCircle (const gp_Pnt & P1,const gp_Pnt & P2,const gp_Pnt & P3);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	V(gp_Vec)
	P2(gp_Pnt)

Returns:
	None

Make an arc of circle (TrimmedCurve from Geom) from  
         two points P1,P2 and the tangente to the solution at  
         the point P1.  
The orientation of the arc is:  
-   the sense determined by the order of the points P1, P3 and P2;  
-   the sense defined by the vector V; or  
-   for other syntaxes:  
  -   the sense of Circ if Sense is true, or  
  -   the opposite sense if Sense is false.  
Note: Alpha1, Alpha2 and Alpha are angle values, given in radians.  
Warning  
If an error occurs (that is, when IsDone returns  
false), the Status function returns:  
-   gce_ConfusedPoints if:  
  -   any 2 of the 3 points P1, P2 and P3 are coincident, or  
  -   P1 and P2 are coincident; or  
-   gce_IntersectionError if:  
  -   P1, P2 and P3 are collinear and not coincident, or  
  -   the vector defined by the points P1 and  
   P2 is collinear with the vector V.") GC_MakeArcOfCircle;
		 GC_MakeArcOfCircle (const gp_Pnt & P1,const gp_Vec & V,const gp_Pnt & P2);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_TrimmedCurve

Returns the constructed arc of circle.  
Exceptions StdFail_NotDone if no arc of circle is constructed.") Value;
		const Handle_Geom_TrimmedCurve & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_TrimmedCurve

No detailed docstring for this function.") Operator;
		const Handle_Geom_TrimmedCurve & Operator ();
};


%feature("shadow") GC_MakeArcOfCircle::~GC_MakeArcOfCircle %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GC_MakeArcOfCircle {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GC_MakeArcOfEllipse;
class GC_MakeArcOfEllipse : public GC_Root {
	public:
		%feature("autodoc", "Args:
	Elips(gp_Elips)
	Alpha1(Standard_Real)
	Alpha2(Standard_Real)
	Sense(Standard_Boolean)

Returns:
	None

Constructs an arc of Ellipse (TrimmedCurve from Geom) from  
         a Ellipse between two parameters Alpha1 and Alpha2.") GC_MakeArcOfEllipse;
		 GC_MakeArcOfEllipse (const gp_Elips & Elips,const Standard_Real Alpha1,const Standard_Real Alpha2,const Standard_Boolean Sense);
		%feature("autodoc", "Args:
	Elips(gp_Elips)
	P(gp_Pnt)
	Alpha(Standard_Real)
	Sense(Standard_Boolean)

Returns:
	None

Constructs an arc of Ellipse (TrimmedCurve from Geom) from  
         a Ellipse between point <P> and the angle Alpha  
         given in radians.") GC_MakeArcOfEllipse;
		 GC_MakeArcOfEllipse (const gp_Elips & Elips,const gp_Pnt & P,const Standard_Real Alpha,const Standard_Boolean Sense);
		%feature("autodoc", "Args:
	Elips(gp_Elips)
	P1(gp_Pnt)
	P2(gp_Pnt)
	Sense(Standard_Boolean)

Returns:
	None

Constructs an arc of Ellipse (TrimmedCurve from Geom) from  
         a Ellipse between two points P1 and P2.  
The orientation of the arc of ellipse is:  
-   the sense of Elips if Sense is true, or  
-   the opposite sense if Sense is false.  
Notes:  
-   Alpha1, Alpha2 and Alpha are angle values, given in radians.  
-   IsDone always returns true.") GC_MakeArcOfEllipse;
		 GC_MakeArcOfEllipse (const gp_Elips & Elips,const gp_Pnt & P1,const gp_Pnt & P2,const Standard_Boolean Sense);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_TrimmedCurve

Returns the constructed arc of ellipse.") Value;
		const Handle_Geom_TrimmedCurve & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_TrimmedCurve

No detailed docstring for this function.") Operator;
		const Handle_Geom_TrimmedCurve & Operator ();
};


%feature("shadow") GC_MakeArcOfEllipse::~GC_MakeArcOfEllipse %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GC_MakeArcOfEllipse {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GC_MakeArcOfHyperbola;
class GC_MakeArcOfHyperbola : public GC_Root {
	public:
		%feature("autodoc", "Args:
	Hypr(gp_Hypr)
	Alpha1(Standard_Real)
	Alpha2(Standard_Real)
	Sense(Standard_Boolean)

Returns:
	None

Creates an arc of Hyperbola (TrimmedCurve from Geom) from  
         a Hyperbola between two parameters Alpha1 and Alpha2  
         (given in radians).") GC_MakeArcOfHyperbola;
		 GC_MakeArcOfHyperbola (const gp_Hypr & Hypr,const Standard_Real Alpha1,const Standard_Real Alpha2,const Standard_Boolean Sense);
		%feature("autodoc", "Args:
	Hypr(gp_Hypr)
	P(gp_Pnt)
	Alpha(Standard_Real)
	Sense(Standard_Boolean)

Returns:
	None

Creates an arc of Hyperbola (TrimmedCurve from Geom) from  
         a Hyperbola between point <P> and the parameter  
         Alpha (given in radians).") GC_MakeArcOfHyperbola;
		 GC_MakeArcOfHyperbola (const gp_Hypr & Hypr,const gp_Pnt & P,const Standard_Real Alpha,const Standard_Boolean Sense);
		%feature("autodoc", "Args:
	Hypr(gp_Hypr)
	P1(gp_Pnt)
	P2(gp_Pnt)
	Sense(Standard_Boolean)

Returns:
	None

Creates an arc of Hyperbola (TrimmedCurve from Geom) from  
         a Hyperbola between two points P1 and P2.  
The orientation of the arc of hyperbola is:  
-   the sense of Hypr if Sense is true, or  
-   the opposite sense if Sense is false.") GC_MakeArcOfHyperbola;
		 GC_MakeArcOfHyperbola (const gp_Hypr & Hypr,const gp_Pnt & P1,const gp_Pnt & P2,const Standard_Boolean Sense);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_TrimmedCurve

Returns the constructed arc of hyperbola.") Value;
		const Handle_Geom_TrimmedCurve & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_TrimmedCurve

No detailed docstring for this function.") Operator;
		const Handle_Geom_TrimmedCurve & Operator ();
};


%feature("shadow") GC_MakeArcOfHyperbola::~GC_MakeArcOfHyperbola %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GC_MakeArcOfHyperbola {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GC_MakeArcOfParabola;
class GC_MakeArcOfParabola : public GC_Root {
	public:
		%feature("autodoc", "Args:
	Parab(gp_Parab)
	Alpha1(Standard_Real)
	Alpha2(Standard_Real)
	Sense(Standard_Boolean)

Returns:
	None

Creates an arc of Parabola (TrimmedCurve from Geom) from  
         a Parabola between two parameters Alpha1 and Alpha2  
         (given in radians).") GC_MakeArcOfParabola;
		 GC_MakeArcOfParabola (const gp_Parab & Parab,const Standard_Real Alpha1,const Standard_Real Alpha2,const Standard_Boolean Sense);
		%feature("autodoc", "Args:
	Parab(gp_Parab)
	P(gp_Pnt)
	Alpha(Standard_Real)
	Sense(Standard_Boolean)

Returns:
	None

Creates an arc of Parabola (TrimmedCurve from Geom) from  
         a Parabola between point <P> and the parameter  
         Alpha (given in radians).") GC_MakeArcOfParabola;
		 GC_MakeArcOfParabola (const gp_Parab & Parab,const gp_Pnt & P,const Standard_Real Alpha,const Standard_Boolean Sense);
		%feature("autodoc", "Args:
	Parab(gp_Parab)
	P1(gp_Pnt)
	P2(gp_Pnt)
	Sense(Standard_Boolean)

Returns:
	None

Creates an arc of Parabola (TrimmedCurve from Geom) from  
         a Parabola between two points P1 and P2.") GC_MakeArcOfParabola;
		 GC_MakeArcOfParabola (const gp_Parab & Parab,const gp_Pnt & P1,const gp_Pnt & P2,const Standard_Boolean Sense);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_TrimmedCurve

Returns the constructed arc of parabola.") Value;
		const Handle_Geom_TrimmedCurve & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_TrimmedCurve

No detailed docstring for this function.") Operator;
		const Handle_Geom_TrimmedCurve & Operator ();
};


%feature("shadow") GC_MakeArcOfParabola::~GC_MakeArcOfParabola %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GC_MakeArcOfParabola {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GC_MakeCircle;
class GC_MakeCircle : public GC_Root {
	public:
		%feature("autodoc", "Args:
	C(gp_Circ)

Returns:
	None

creates a circle from a non persistent circle C by its conversion.") GC_MakeCircle;
		 GC_MakeCircle (const gp_Circ & C);
		%feature("autodoc", "Args:
	A2(gp_Ax2)
	Radius(Standard_Real)

Returns:
	None

A2 is the local coordinates system of the circle.  
 It is not forbidden to create a circle with Radius = 0.0  
 Status is 'NegativeRadius' if Radius < 0.") GC_MakeCircle;
		 GC_MakeCircle (const gp_Ax2 & A2,const Standard_Real Radius);
		%feature("autodoc", "Args:
	Circ(gp_Circ)
	Dist(Standard_Real)

Returns:
	None

Make a Circle from Geom <TheCirc> parallel to another  
          Circ <Circ> with a distance <Dist>.  
          If Dist is greater than zero the result is enclosing  
          the circle <Circ>, else the result is enclosed by the  
          circle <Circ>.") GC_MakeCircle;
		 GC_MakeCircle (const gp_Circ & Circ,const Standard_Real Dist);
		%feature("autodoc", "Args:
	Circ(gp_Circ)
	Point(gp_Pnt)

Returns:
	None

Make a Circle from Geom <TheCirc> parallel to another  
          Circ <Circ> and passing through a Pnt <Point>.") GC_MakeCircle;
		 GC_MakeCircle (const gp_Circ & Circ,const gp_Pnt & Point);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)
	P3(gp_Pnt)

Returns:
	None

Make a Circ from gp <TheCirc> passing through 3  
          Pnt2d <P1>,<P2>,<P3>.") GC_MakeCircle;
		 GC_MakeCircle (const gp_Pnt & P1,const gp_Pnt & P2,const gp_Pnt & P3);
		%feature("autodoc", "Args:
	Center(gp_Pnt)
	Norm(gp_Dir)
	Radius(Standard_Real)

Returns:
	None

Make a Circle from Geom <TheCirc> with its center  
          <Center> and the normal of its plane <Norm> and  
          its radius <Radius>.") GC_MakeCircle;
		 GC_MakeCircle (const gp_Pnt & Center,const gp_Dir & Norm,const Standard_Real Radius);
		%feature("autodoc", "Args:
	Center(gp_Pnt)
	PtAxis(gp_Pnt)
	Radius(Standard_Real)

Returns:
	None

Make a Circle from Geom <TheCirc> with its center  
          <Center> and the normal of its plane defined by the  
          two points <Center> and <PtAxis> and its radius <Radius>.") GC_MakeCircle;
		 GC_MakeCircle (const gp_Pnt & Center,const gp_Pnt & PtAxis,const Standard_Real Radius);
		%feature("autodoc", "Args:
	Axis(gp_Ax1)
	Radius(Standard_Real)

Returns:
	None

Make a Circle from Geom <TheCirc> with its center  
          <Center> and its radius <Radius>.") GC_MakeCircle;
		 GC_MakeCircle (const gp_Ax1 & Axis,const Standard_Real Radius);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Circle

Returns the constructed circle.  
Exceptions  
StdFail_NotDone if no circle is constructed.") Value;
		const Handle_Geom_Circle & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Circle

No detailed docstring for this function.") Operator;
		const Handle_Geom_Circle & Operator ();
};


%feature("shadow") GC_MakeCircle::~GC_MakeCircle %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GC_MakeCircle {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GC_MakeConicalSurface;
class GC_MakeConicalSurface : public GC_Root {
	public:
		%feature("autodoc", "Args:
	A2(gp_Ax2)
	Ang(Standard_Real)
	Radius(Standard_Real)

Returns:
	None

A2 defines the local coordinate system of the conical surface.  
 Ang is the conical surface semi-angle ]0, PI/2[.  
 Radius is the radius of the circle Viso in the placement plane  
 of the conical surface defined with 'XAxis' and 'YAxis'.  
 The 'ZDirection' of A2 defines the direction of the surface's  
 axis of symmetry.  
 If the location point of A2 is the apex of the surface  
 Radius = 0 .  
 At the creation the parametrization of the surface is defined  
 such that the normal Vector (N = D1U ^ D1V) is oriented towards  
the 'outside region' of the surface.  
 Status is 'NegativeRadius' if Radius < 0.0 or 'BadAngle' if  
 Ang < Resolution from gp or Ang >= PI/ - Resolution") GC_MakeConicalSurface;
		 GC_MakeConicalSurface (const gp_Ax2 & A2,const Standard_Real Ang,const Standard_Real Radius);
		%feature("autodoc", "Args:
	C(gp_Cone)

Returns:
	None

Creates a ConicalSurface from a non persistent Cone from package gp.") GC_MakeConicalSurface;
		 GC_MakeConicalSurface (const gp_Cone & C);
		%feature("autodoc", "Args:
	Cone(gp_Cone)
	Point(gp_Pnt)

Returns:
	None

Make a ConicalSurface from Geom <TheCone> parallel to another  
          ConicalSurface <Cone> and passing through a Pnt <Point>.") GC_MakeConicalSurface;
		 GC_MakeConicalSurface (const gp_Cone & Cone,const gp_Pnt & Point);
		%feature("autodoc", "Args:
	Cone(gp_Cone)
	Dist(Standard_Real)

Returns:
	None

Make a ConicalSurface from Geom <TheCone> parallel to another  
          ConicalSurface <Cone> at the distance <Dist> which can  
          be greater or lower than zero.") GC_MakeConicalSurface;
		 GC_MakeConicalSurface (const gp_Cone & Cone,const Standard_Real Dist);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)
	P3(gp_Pnt)
	P4(gp_Pnt)

Returns:
	None

Make a ConicalSurface from Geom <TheCone> passing through 3  
          Pnt <P1>,<P2>,<P3>.  
          Its axis is <P1P2> and the radius of its base is  
          the distance between <P3> and <P1P2>.  
          The distance between <P4> and <P1P2> is the radius of  
          the section passing through <P4>.  
          An error iss raised if <P1>,<P2>,<P3>,<P4> are  
          colinear or if <P3P4> is perpendicular to <P1P2> or  
          <P3P4> is colinear to <P1P2>.") GC_MakeConicalSurface;
		 GC_MakeConicalSurface (const gp_Pnt & P1,const gp_Pnt & P2,const gp_Pnt & P3,const gp_Pnt & P4);
		%feature("autodoc", "Args:
	Axis(gp_Ax1)
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

Make a ConicalSurface by its axis <Axis> and and two points.") GC_MakeConicalSurface;
		 GC_MakeConicalSurface (const gp_Ax1 & Axis,const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("autodoc", "Args:
	Axis(gp_Lin)
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

Make a ConicalSurface by its axis <Axis> and and two points.") GC_MakeConicalSurface;
		 GC_MakeConicalSurface (const gp_Lin & Axis,const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)
	R1(Standard_Real)
	R2(Standard_Real)

Returns:
	None

Make a ConicalSurface with two points and two radius.  
         The axis of the solution is the line passing through  
         <P1> and <P2>.  
         <R1> is the radius of the section passing through <P1>  
         and <R2> the radius of the section passing through <P2>.") GC_MakeConicalSurface;
		 GC_MakeConicalSurface (const gp_Pnt & P1,const gp_Pnt & P2,const Standard_Real R1,const Standard_Real R2);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_ConicalSurface

Returns the constructed cone.  
Exceptions  
StdFail_NotDone if no cone is constructed.") Value;
		const Handle_Geom_ConicalSurface & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_ConicalSurface

No detailed docstring for this function.") Operator;
		const Handle_Geom_ConicalSurface & Operator ();
};


%feature("shadow") GC_MakeConicalSurface::~GC_MakeConicalSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GC_MakeConicalSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GC_MakeCylindricalSurface;
class GC_MakeCylindricalSurface : public GC_Root {
	public:
		%feature("autodoc", "Args:
	A2(gp_Ax2)
	Radius(Standard_Real)

Returns:
	None

A2 defines the local coordinate system of the cylindrical surface.  
 The 'ZDirection' of A2 defines the direction of the surface's  
 axis of symmetry.  
 At the creation the parametrization of the surface is defined  
 such that the normal Vector (N = D1U ^ D1V) is oriented towards  
 the 'outside region' of the surface.  
Warnings :  
 It is not forbidden to create a cylindrical surface with  
 Radius = 0.0  
Status is 'NegativeRadius' if Radius < 0.0") GC_MakeCylindricalSurface;
		 GC_MakeCylindricalSurface (const gp_Ax2 & A2,const Standard_Real Radius);
		%feature("autodoc", "Args:
	C(gp_Cylinder)

Returns:
	None

Creates a CylindricalSurface from a non persistent Cylinder  
 from package gp.") GC_MakeCylindricalSurface;
		 GC_MakeCylindricalSurface (const gp_Cylinder & C);
		%feature("autodoc", "Args:
	Cyl(gp_Cylinder)
	Point(gp_Pnt)

Returns:
	None

Make a CylindricalSurface from Geom <TheCylinder>  
          parallel to another  
          CylindricalSurface <Cylinder> and passing through a  
          Pnt <Point>.") GC_MakeCylindricalSurface;
		 GC_MakeCylindricalSurface (const gp_Cylinder & Cyl,const gp_Pnt & Point);
		%feature("autodoc", "Args:
	Cyl(gp_Cylinder)
	Dist(Standard_Real)

Returns:
	None

Make a CylindricalSurface from Geom <TheCylinder>  
          parallel to another  
          CylindricalSurface <Cylinder> at the distance <Dist>  
          which can be greater or lower than zero.  
          The radius of the result is the absolute value of the  
          radius of <Cyl> plus <Dist>") GC_MakeCylindricalSurface;
		 GC_MakeCylindricalSurface (const gp_Cylinder & Cyl,const Standard_Real Dist);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)
	P3(gp_Pnt)

Returns:
	None

Make a CylindricalSurface from Geom <TheCylinder>  
          passing through 3 Pnt <P1>,<P2>,<P3>.  
          Its axis is <P1P2> and its radius is the distance  
          between <P3> and <P1P2>") GC_MakeCylindricalSurface;
		 GC_MakeCylindricalSurface (const gp_Pnt & P1,const gp_Pnt & P2,const gp_Pnt & P3);
		%feature("autodoc", "Args:
	Axis(gp_Ax1)
	Radius(Standard_Real)

Returns:
	None

Make a CylindricalSurface by its axis <Axis> and radius  
         <Radius>.") GC_MakeCylindricalSurface;
		 GC_MakeCylindricalSurface (const gp_Ax1 & Axis,const Standard_Real Radius);
		%feature("autodoc", "Args:
	Circ(gp_Circ)

Returns:
	None

Make a CylindricalSurface by its circular base.") GC_MakeCylindricalSurface;
		 GC_MakeCylindricalSurface (const gp_Circ & Circ);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_CylindricalSurface

Returns the constructed cylinder.  
Exceptions StdFail_NotDone if no cylinder is constructed.") Value;
		const Handle_Geom_CylindricalSurface & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_CylindricalSurface

No detailed docstring for this function.") Operator;
		const Handle_Geom_CylindricalSurface & Operator ();
};


%feature("shadow") GC_MakeCylindricalSurface::~GC_MakeCylindricalSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GC_MakeCylindricalSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GC_MakeEllipse;
class GC_MakeEllipse : public GC_Root {
	public:
		%feature("autodoc", "Args:
	E(gp_Elips)

Returns:
	None

Creates an ellipse from a non persistent ellipse E from package gp by its conversion.") GC_MakeEllipse;
		 GC_MakeEllipse (const gp_Elips & E);
		%feature("autodoc", "Args:
	A2(gp_Ax2)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)

Returns:
	None

Constructs an ellipse with major and minor radii MajorRadius and  
  MinorRadius, and located in the plane defined by  
  the 'X Axis' and 'Y Axis' of the coordinate system A2, where:  
  -   its center is the origin of A2, and  
  -   its major axis is the 'X Axis' of A2;  
 Warnings :  
 The MakeEllipse class does not prevent the  
construction of an ellipse where MajorRadius is equal to MinorRadius.  
If an error occurs (that is, when IsDone returns  
false), the Status function returns:  
-   gce_InvertRadius if MajorRadius is less than MinorRadius;  
-   gce_NegativeRadius if MinorRadius is less than 0.0;  
-   gce_NullAxis if the points S1 and Center are coincident; or  
-   gce_InvertAxis if:  
  -   the major radius computed with Center and S1  
   is less than the minor radius computed with Center, S1 and S2, or  
  -   Center, S1 and S2 are collinear.") GC_MakeEllipse;
		 GC_MakeEllipse (const gp_Ax2 & A2,const Standard_Real MajorRadius,const Standard_Real MinorRadius);
		%feature("autodoc", "Args:
	S1(gp_Pnt)
	S2(gp_Pnt)
	Center(gp_Pnt)

Returns:
	None

Constructs an ellipse centered on the point Center, where  
  -   the plane of the ellipse is defined by Center, S1 and S2,  
  -   its major axis is defined by Center and S1,  
  -   its major radius is the distance between Center and S1, and  
  -   its minor radius is the distance between S2 and the major axis.") GC_MakeEllipse;
		 GC_MakeEllipse (const gp_Pnt & S1,const gp_Pnt & S2,const gp_Pnt & Center);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Ellipse

Returns the constructed ellipse.  
Exceptions StdFail_NotDone if no ellipse is constructed.") Value;
		const Handle_Geom_Ellipse & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Ellipse

No detailed docstring for this function.") Operator;
		const Handle_Geom_Ellipse & Operator ();
};


%feature("shadow") GC_MakeEllipse::~GC_MakeEllipse %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GC_MakeEllipse {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GC_MakeHyperbola;
class GC_MakeHyperbola : public GC_Root {
	public:
		%feature("autodoc", "Args:
	H(gp_Hypr)

Returns:
	None

Creates  an Hyperbola from a non persistent hyperbola  from package gp by conversion.") GC_MakeHyperbola;
		 GC_MakeHyperbola (const gp_Hypr & H);
		%feature("autodoc", "Args:
	A2(gp_Ax2)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)

Returns:
	None

Constructs a hyperbola centered on the origin of the coordinate system  
A2, with major and minor radii MajorRadius and MinorRadius, where:  
  the plane of the hyperbola is defined by the 'X Axis' and 'Y Axis' of A2,  
  -   its major axis is the 'X Axis' of A2.") GC_MakeHyperbola;
		 GC_MakeHyperbola (const gp_Ax2 & A2,const Standard_Real MajorRadius,const Standard_Real MinorRadius);
		%feature("autodoc", "Args:
	S1(gp_Pnt)
	S2(gp_Pnt)
	Center(gp_Pnt)

Returns:
	None

Constructs a hyperbola centered on the point Center, where  
  -   the plane of the hyperbola is defined by Center, S1 and S2,  
  -   its major axis is defined by Center and S1,  
  -   its major radius is the distance between Center and S1, and  
  -   its minor radius is the distance between S2 and the major axis;") GC_MakeHyperbola;
		 GC_MakeHyperbola (const gp_Pnt & S1,const gp_Pnt & S2,const gp_Pnt & Center);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Hyperbola

Returns the constructed hyperbola.  
Exceptions StdFail_NotDone if no hyperbola is constructed.") Value;
		const Handle_Geom_Hyperbola & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Hyperbola

No detailed docstring for this function.") Operator;
		const Handle_Geom_Hyperbola & Operator ();
};


%feature("shadow") GC_MakeHyperbola::~GC_MakeHyperbola %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GC_MakeHyperbola {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GC_MakeLine;
class GC_MakeLine : public GC_Root {
	public:
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	None

Creates a line located in 3D space with the axis placement A1.  
 The Location of A1 is the origin of the line.") GC_MakeLine;
		 GC_MakeLine (const gp_Ax1 & A1);
		%feature("autodoc", "Args:
	L(gp_Lin)

Returns:
	None

Creates a line from a non persistent line from package gp.") GC_MakeLine;
		 GC_MakeLine (const gp_Lin & L);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	V(gp_Dir)

Returns:
	None

P is the origin and V is the direction of the line.") GC_MakeLine;
		 GC_MakeLine (const gp_Pnt & P,const gp_Dir & V);
		%feature("autodoc", "Args:
	Lin(gp_Lin)
	Point(gp_Pnt)

Returns:
	None

Make a Line from Geom <TheLin> parallel to another  
          Lin <Lin> and passing through a Pnt <Point>.") GC_MakeLine;
		 GC_MakeLine (const gp_Lin & Lin,const gp_Pnt & Point);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

Make a Line from Geom <TheLin> passing through 2  
          Pnt <P1>,<P2>.  
          It returns false if <p1> and <P2> are confused.  
Warning  
If the points P1 and P2 are coincident (that is, when  
IsDone returns false), the Status function returns gce_ConfusedPoints.") GC_MakeLine;
		 GC_MakeLine (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Line

Returns the constructed line.  
Exceptions StdFail_NotDone if no line is constructed.") Value;
		const Handle_Geom_Line & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Line

No detailed docstring for this function.") Operator;
		const Handle_Geom_Line & Operator ();
};


%feature("shadow") GC_MakeLine::~GC_MakeLine %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GC_MakeLine {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GC_MakePlane;
class GC_MakePlane : public GC_Root {
	public:
		%feature("autodoc", "Args:
	A2(gp_Ax2)

Returns:
	None

Creates a plane located in 3D space with an axis placement  
 two axis.  The 'ZDirection' of 'A2' is the direction normal  
 to the plane.  The 'Location' point of 'A2' is the origin of  
 the plane. The 'XDirection' and 'YDirection' of 'A2' define  
 the directions of the U isoparametric and V isoparametric  
 curves.") GC_MakePlane;
		 GC_MakePlane (const gp_Ax2 & A2);
		%feature("autodoc", "Args:
	Pl(gp_Pln)

Returns:
	None

Creates a plane from a non persistent plane from package gp.") GC_MakePlane;
		 GC_MakePlane (const gp_Pln & Pl);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	V(gp_Dir)

Returns:
	None

P is the 'Location' point or origin of the plane.  
 V is the direction normal to the plane.") GC_MakePlane;
		 GC_MakePlane (const gp_Pnt & P,const gp_Dir & V);
		%feature("autodoc", "Args:
	A(Standard_Real)
	B(Standard_Real)
	C(Standard_Real)
	D(Standard_Real)

Returns:
	None

Creates a plane from its cartesian equation :  
 Ax + By + Cz + D = 0.0  
 Status is 'BadEquation' if Sqrt (A*A + B*B + C*C)  
 <= Resolution from gp") GC_MakePlane;
		 GC_MakePlane (const Standard_Real A,const Standard_Real B,const Standard_Real C,const Standard_Real D);
		%feature("autodoc", "Args:
	Pln(gp_Pln)
	Point(gp_Pnt)

Returns:
	None

Make a Plane from Geom <ThePlane> parallel to another  
          Pln <Pln> and passing through a Pnt <Point>.") GC_MakePlane;
		 GC_MakePlane (const gp_Pln & Pln,const gp_Pnt & Point);
		%feature("autodoc", "Args:
	Pln(gp_Pln)
	Dist(Standard_Real)

Returns:
	None

Make a Plane from Geom <ThePlane> parallel to another  
          Pln <Pln> at the distance <Dist> which can be greater  
          or lower than zero.  
          In the first case the result is at the distance  
          <Dist> to the plane <Pln> in the direction of the  
          normal to <Pln>.  
          Otherwize it is in the oposite direction.") GC_MakePlane;
		 GC_MakePlane (const gp_Pln & Pln,const Standard_Real Dist);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)
	P3(gp_Pnt)

Returns:
	None

Make a Plane from Geom <ThePlane> passing through 3  
          Pnt <P1>,<P2>,<P3>.  
          It returns false if <P1> <P2> <P3> are confused.") GC_MakePlane;
		 GC_MakePlane (const gp_Pnt & P1,const gp_Pnt & P2,const gp_Pnt & P3);
		%feature("autodoc", "Args:
	Axis(gp_Ax1)

Returns:
	None

Make a Plane  passing through the location of <Axis>and  
         normal to the Direction of <Axis>.") GC_MakePlane;
		 GC_MakePlane (const gp_Ax1 & Axis);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Plane

Returns the constructed plane.  
Exceptions StdFail_NotDone if no plane is constructed.") Value;
		const Handle_Geom_Plane & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Plane

No detailed docstring for this function.") Operator;
		const Handle_Geom_Plane & Operator ();
};


%feature("shadow") GC_MakePlane::~GC_MakePlane %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GC_MakePlane {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GC_MakeSegment;
class GC_MakeSegment : public GC_Root {
	public:
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

Make a segment of Line from the 2 points <P1> and <P2>.  
         It returns NullObject if <P1> and <P2> are confused.") GC_MakeSegment;
		 GC_MakeSegment (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("autodoc", "Args:
	Line(gp_Lin)
	U1(Standard_Real)
	U2(Standard_Real)

Returns:
	None

Make a segment of Line from the line <Line1>  
         between the two parameters U1 and U2.  
         It returns NullObject if <U1> is equal <U2>.") GC_MakeSegment;
		 GC_MakeSegment (const gp_Lin & Line,const Standard_Real U1,const Standard_Real U2);
		%feature("autodoc", "Args:
	Line(gp_Lin)
	Point(gp_Pnt)
	Ulast(Standard_Real)

Returns:
	None

Make a segment of Line from the line <Line1>  
         between the point <Point> and the parameter Ulast.  
         It returns NullObject if <U1> is equal <U2>.") GC_MakeSegment;
		 GC_MakeSegment (const gp_Lin & Line,const gp_Pnt & Point,const Standard_Real Ulast);
		%feature("autodoc", "Args:
	Line(gp_Lin)
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

Make a segment of Line from the line <Line1>  
         between the two points <P1> and <P2>.  
         It returns NullObject if <U1> is equal <U2>.") GC_MakeSegment;
		 GC_MakeSegment (const gp_Lin & Line,const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_TrimmedCurve

Returns the constructed line segment.") Value;
		const Handle_Geom_TrimmedCurve & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_TrimmedCurve

No detailed docstring for this function.") Operator;
		const Handle_Geom_TrimmedCurve & Operator ();
};


%feature("shadow") GC_MakeSegment::~GC_MakeSegment %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GC_MakeSegment {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GC_MakeTrimmedCone;
class GC_MakeTrimmedCone : public GC_Root {
	public:
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)
	P3(gp_Pnt)
	P4(gp_Pnt)

Returns:
	None

Make a RectangularTrimmedSurface <TheCone> from Geom  
         It is trimmed by P3 and P4.  
         Its axis is <P1P2> and the radius of its base is  
         the distance between <P3> and <P1P2>.  
         The distance between <P4> and <P1P2> is the radius of  
         the section passing through <P4>.  
         An error iss raised if <P1>,<P2>,<P3>,<P4> are  
         colinear or if <P3P4> is perpendicular to <P1P2> or  
         <P3P4> is colinear to <P1P2>.") GC_MakeTrimmedCone;
		 GC_MakeTrimmedCone (const gp_Pnt & P1,const gp_Pnt & P2,const gp_Pnt & P3,const gp_Pnt & P4);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)
	R1(Standard_Real)
	R2(Standard_Real)

Returns:
	None

Make a RectangularTrimmedSurface from Geom <TheCone>  
          from a cone and trimmed by two points P1 and P2 and  
          the two radius <R1> and <R2> of the sections passing  
          through <P1> an <P2>.  
Warning  
If an error occurs (that is, when IsDone returns  
false), the Status function returns:  
-   gce_ConfusedPoints if points P1 and P2, or P3 and P4, are coincident;  
-   gce_NullAngle if:  
  -   the lines joining P1 to P2 and P3 to P4 are parallel, or  
-   R1 and R2 are equal (i.e. their difference is less than gp::Resolution());  
-   gce_NullRadius if:  
  -   the line joining P1 to P2 is perpendicular to the line joining P3 to P4, or  
  -   the points P1, P2, P3 and P4 are collinear;  
-   gce_NegativeRadius if R1 or R2 is negative; or  
-   gce_NullAxis if points P1 and P2 are coincident (2nd syntax only).") GC_MakeTrimmedCone;
		 GC_MakeTrimmedCone (const gp_Pnt & P1,const gp_Pnt & P2,const Standard_Real R1,const Standard_Real R2);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_RectangularTrimmedSurface

Returns the constructed trimmed cone.  
StdFail_NotDone if no trimmed cone is constructed.") Value;
		const Handle_Geom_RectangularTrimmedSurface & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_RectangularTrimmedSurface

No detailed docstring for this function.") Operator;
		const Handle_Geom_RectangularTrimmedSurface & Operator ();
};


%feature("shadow") GC_MakeTrimmedCone::~GC_MakeTrimmedCone %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GC_MakeTrimmedCone {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GC_MakeTrimmedCylinder;
class GC_MakeTrimmedCylinder : public GC_Root {
	public:
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)
	P3(gp_Pnt)

Returns:
	None

Make a cylindricalSurface <Cyl> from Geom  
         Its axis is is <P1P2> and its radius is the distance  
         between <P3> and <P1P2>.  
         The height is the distance between P1 and P2.") GC_MakeTrimmedCylinder;
		 GC_MakeTrimmedCylinder (const gp_Pnt & P1,const gp_Pnt & P2,const gp_Pnt & P3);
		%feature("autodoc", "Args:
	Circ(gp_Circ)
	Height(Standard_Real)

Returns:
	None

Make a cylindricalSurface <Cyl> from gp by its base <Circ>.  
         Its axis is the normal to the plane defined bi <Circ>.  
         <Height> can be greater than zero or lower than zero.  
         In the first case the V parametric direction of the  
         result has the same orientation as the normal to <Circ>.  
         In the other case it has the opposite orientation.") GC_MakeTrimmedCylinder;
		 GC_MakeTrimmedCylinder (const gp_Circ & Circ,const Standard_Real Height);
		%feature("autodoc", "Args:
	A1(gp_Ax1)
	Radius(Standard_Real)
	Height(Standard_Real)

Returns:
	None

Make a cylindricalSurface <Cyl> from gp by its  
         axis <A1> and its radius <Radius>.  
         It returns NullObject if <Radius> is lower than zero.  
         <Height> can be greater than zero or lower than zero.  
         In the first case the V parametric direction of the  
         result has the same orientation as <A1>.  
         In the other case it has the opposite orientation.") GC_MakeTrimmedCylinder;
		 GC_MakeTrimmedCylinder (const gp_Ax1 & A1,const Standard_Real Radius,const Standard_Real Height);
		%feature("autodoc", "Args:
	Cyl(gp_Cylinder)
	P(gp_Pnt)
	Height(Standard_Real)

Returns:
	None

Make a RectangularTrimmedSurface <Cylinder> from gp by  
         a cylinder from gp.  
         It is trimmed by the point <P> and the heigh <Heigh>.  
         <Height> can be greater than zero or lower than zero.  
         in the first case the limit section is in the side of  
         the positives V paramters of <Cyl> and in the other  
         side if <Heigh> is lower than zero.") GC_MakeTrimmedCylinder;
		 GC_MakeTrimmedCylinder (const gp_Cylinder & Cyl,const gp_Pnt & P,const Standard_Real Height);
		%feature("autodoc", "Args:
	Cyl(gp_Cylinder)
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

Make a RectangularTrimmedSurface <Cylinder> from gp by  
         a cylinder from gp.  
         It is trimmed by the two points <P1> and <P2>.  
Warning  
If an error occurs (that is, when IsDone returns  
false), the Status function returns:  
-   gce_NegativeRadius if Radius is less than 0.0, or  
-   gce_ConfusedPoints if the points P1 and P2 are coincident.  
-   gce_ColinearPoints if the points P1, P2 and P3 are collinear.") GC_MakeTrimmedCylinder;
		 GC_MakeTrimmedCylinder (const gp_Cylinder & Cyl,const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_RectangularTrimmedSurface

Returns the constructed trimmed cylinder.  
Exceptions  
StdFail_NotDone if no trimmed cylinder is constructed.") Value;
		const Handle_Geom_RectangularTrimmedSurface & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_RectangularTrimmedSurface

No detailed docstring for this function.") Operator;
		const Handle_Geom_RectangularTrimmedSurface & Operator ();
};


%feature("shadow") GC_MakeTrimmedCylinder::~GC_MakeTrimmedCylinder %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GC_MakeTrimmedCylinder {
	void _kill_pointed() {
		delete $self;
	}
};
