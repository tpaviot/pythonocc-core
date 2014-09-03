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
%module (package="OCC") GCE2d

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

%include GCE2d_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor GCE2d_MakeMirror;
class GCE2d_MakeMirror {
	public:
		%feature("autodoc", "Args:
	Point(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") GCE2d_MakeMirror;
		 GCE2d_MakeMirror (const gp_Pnt2d & Point);
		%feature("autodoc", "Args:
	Axis(gp_Ax2d)

Returns:
	None

No detailed docstring for this function.") GCE2d_MakeMirror;
		 GCE2d_MakeMirror (const gp_Ax2d & Axis);
		%feature("autodoc", "Args:
	Line(gp_Lin2d)

Returns:
	None

No detailed docstring for this function.") GCE2d_MakeMirror;
		 GCE2d_MakeMirror (const gp_Lin2d & Line);
		%feature("autodoc", "Args:
	Point(gp_Pnt2d)
	Direc(gp_Dir2d)

Returns:
	None

Make a symetry transformation af axis defined by  
         <Point> and <Direc>.") GCE2d_MakeMirror;
		 GCE2d_MakeMirror (const gp_Pnt2d & Point,const gp_Dir2d & Direc);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Transformation

Returns the constructed transformation.") Value;
		const Handle_Geom2d_Transformation & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Transformation

No detailed docstring for this function.") Operator;
		const Handle_Geom2d_Transformation & Operator ();
};


%feature("shadow") GCE2d_MakeMirror::~GCE2d_MakeMirror %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GCE2d_MakeMirror {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GCE2d_MakeRotation;
class GCE2d_MakeRotation {
	public:
		%feature("autodoc", "Args:
	Point(gp_Pnt2d)
	Angle(Standard_Real)

Returns:
	None

Constructs a rotation through angle Angle about the center Point.") GCE2d_MakeRotation;
		 GCE2d_MakeRotation (const gp_Pnt2d & Point,const Standard_Real Angle);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Transformation

Returns the constructed transformation.") Value;
		const Handle_Geom2d_Transformation & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Transformation

No detailed docstring for this function.") Operator;
		const Handle_Geom2d_Transformation & Operator ();
};


%feature("shadow") GCE2d_MakeRotation::~GCE2d_MakeRotation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GCE2d_MakeRotation {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GCE2d_MakeScale;
class GCE2d_MakeScale {
	public:
		%feature("autodoc", "Args:
	Point(gp_Pnt2d)
	Scale(Standard_Real)

Returns:
	None

Constructs a scaling transformation with  
-   Point as the center of the transformation, and  
-   Scale as the scale factor.") GCE2d_MakeScale;
		 GCE2d_MakeScale (const gp_Pnt2d & Point,const Standard_Real Scale);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Transformation

Returns the constructed transformation.") Value;
		const Handle_Geom2d_Transformation & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Transformation

No detailed docstring for this function.") Operator;
		const Handle_Geom2d_Transformation & Operator ();
};


%feature("shadow") GCE2d_MakeScale::~GCE2d_MakeScale %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GCE2d_MakeScale {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GCE2d_MakeTranslation;
class GCE2d_MakeTranslation {
	public:
		%feature("autodoc", "Args:
	Vect(gp_Vec2d)

Returns:
	None

Constructs a translation along the vector Vect.") GCE2d_MakeTranslation;
		 GCE2d_MakeTranslation (const gp_Vec2d & Vect);
		%feature("autodoc", "Args:
	Point1(gp_Pnt2d)
	Point2(gp_Pnt2d)

Returns:
	None

Constructs a translation along the vector  
 (Point1,Point2) defined from the point Point1 to the point Point2.") GCE2d_MakeTranslation;
		 GCE2d_MakeTranslation (const gp_Pnt2d & Point1,const gp_Pnt2d & Point2);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Transformation

Returns the constructed transformation.") Value;
		const Handle_Geom2d_Transformation & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Transformation

No detailed docstring for this function.") Operator;
		const Handle_Geom2d_Transformation & Operator ();
};


%feature("shadow") GCE2d_MakeTranslation::~GCE2d_MakeTranslation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GCE2d_MakeTranslation {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GCE2d_Root;
class GCE2d_Root {
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

Returns the status of the construction  
-   gce_Done, if the construction is successful, or  
-   another value of the gce_ErrorType enumeration  
  indicating why the construction failed.") Status;
		gce_ErrorType Status ();
};


%feature("shadow") GCE2d_Root::~GCE2d_Root %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GCE2d_Root {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GCE2d_MakeArcOfCircle;
class GCE2d_MakeArcOfCircle : public GCE2d_Root {
	public:
		%feature("autodoc", "Args:
	Circ(gp_Circ2d)
	Alpha1(Standard_Real)
	Alpha2(Standard_Real)
	Sense(Standard_Boolean)=Standard_True

Returns:
	None

Makes an arc of circle (TrimmedCurve from Geom2d) from  
         a circle between two parameters Alpha1 and Alpha2.  
         The two parameters are angles. The parameters are  
         in radians.") GCE2d_MakeArcOfCircle;
		 GCE2d_MakeArcOfCircle (const gp_Circ2d & Circ,const Standard_Real Alpha1,const Standard_Real Alpha2,const Standard_Boolean Sense = Standard_True);
		%feature("autodoc", "Args:
	Circ(gp_Circ2d)
	P(gp_Pnt2d)
	Alpha(Standard_Real)
	Sense(Standard_Boolean)=Standard_True

Returns:
	None

Makes an arc of circle (TrimmedCurve from Geom2d) from  
         a circle between point <P> and the parameter  
         Alpha. Alpha is given in radians.") GCE2d_MakeArcOfCircle;
		 GCE2d_MakeArcOfCircle (const gp_Circ2d & Circ,const gp_Pnt2d & P,const Standard_Real Alpha,const Standard_Boolean Sense = Standard_True);
		%feature("autodoc", "Args:
	Circ(gp_Circ2d)
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)
	Sense(Standard_Boolean)=Standard_True

Returns:
	None

Makes an arc of circle (TrimmedCurve from Geom2d) from  
         a circle between two points P1 and P2.") GCE2d_MakeArcOfCircle;
		 GCE2d_MakeArcOfCircle (const gp_Circ2d & Circ,const gp_Pnt2d & P1,const gp_Pnt2d & P2,const Standard_Boolean Sense = Standard_True);
		%feature("autodoc", "Args:
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)
	P3(gp_Pnt2d)

Returns:
	None

Makes an arc of circle (TrimmedCurve from Geom2d) from  
         three points P1,P2,P3 between two points P1 and P3,  
         and passing through the point P2.") GCE2d_MakeArcOfCircle;
		 GCE2d_MakeArcOfCircle (const gp_Pnt2d & P1,const gp_Pnt2d & P2,const gp_Pnt2d & P3);
		%feature("autodoc", "Args:
	P1(gp_Pnt2d)
	V(gp_Vec2d)
	P2(gp_Pnt2d)

Returns:
	None

Makes an arc of circle (TrimmedCurve from Geom2d) from  
         two points P1,P2 and the tangente to the solution at  
         the point P1.") GCE2d_MakeArcOfCircle;
		 GCE2d_MakeArcOfCircle (const gp_Pnt2d & P1,const gp_Vec2d & V,const gp_Pnt2d & P2);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_TrimmedCurve

Returns the constructed arc of circle.  
Exceptions StdFail_NotDone if no arc of circle is constructed.") Value;
		const Handle_Geom2d_TrimmedCurve & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_TrimmedCurve

No detailed docstring for this function.") Operator;
		const Handle_Geom2d_TrimmedCurve & Operator ();
};


%feature("shadow") GCE2d_MakeArcOfCircle::~GCE2d_MakeArcOfCircle %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GCE2d_MakeArcOfCircle {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GCE2d_MakeArcOfEllipse;
class GCE2d_MakeArcOfEllipse : public GCE2d_Root {
	public:
		%feature("autodoc", "Args:
	Elips(gp_Elips2d)
	Alpha1(Standard_Real)
	Alpha2(Standard_Real)
	Sense(Standard_Boolean)=Standard_True

Returns:
	None

Make an arc of Ellipse (TrimmedCurve from Geom2d) from  
         a Ellipse between two parameters Alpha1 and Alpha2.") GCE2d_MakeArcOfEllipse;
		 GCE2d_MakeArcOfEllipse (const gp_Elips2d & Elips,const Standard_Real Alpha1,const Standard_Real Alpha2,const Standard_Boolean Sense = Standard_True);
		%feature("autodoc", "Args:
	Elips(gp_Elips2d)
	P(gp_Pnt2d)
	Alpha(Standard_Real)
	Sense(Standard_Boolean)=Standard_True

Returns:
	None

Make an arc of Ellipse (TrimmedCurve from Geom2d) from  
         a Ellipse between point <P> and the parameter  
         Alpha.") GCE2d_MakeArcOfEllipse;
		 GCE2d_MakeArcOfEllipse (const gp_Elips2d & Elips,const gp_Pnt2d & P,const Standard_Real Alpha,const Standard_Boolean Sense = Standard_True);
		%feature("autodoc", "Args:
	Elips(gp_Elips2d)
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)
	Sense(Standard_Boolean)=Standard_True

Returns:
	None

Make an arc of Ellipse (TrimmedCurve from Geom2d) from  
         a Ellipse between two points P1 and P2.  
Please, note: The orientation of the arc is:  
-   the trigonometric sense if Sense is not defined or  
  is true (default value), or  
-   the opposite sense if Sense is false.  
-   Alpha1, Alpha2 and Alpha are angle values, given in radians.  
-   IsDone always returns true.") GCE2d_MakeArcOfEllipse;
		 GCE2d_MakeArcOfEllipse (const gp_Elips2d & Elips,const gp_Pnt2d & P1,const gp_Pnt2d & P2,const Standard_Boolean Sense = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_TrimmedCurve

Returns the constructed arc of ellipse.") Value;
		const Handle_Geom2d_TrimmedCurve & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_TrimmedCurve

No detailed docstring for this function.") Operator;
		const Handle_Geom2d_TrimmedCurve & Operator ();
};


%feature("shadow") GCE2d_MakeArcOfEllipse::~GCE2d_MakeArcOfEllipse %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GCE2d_MakeArcOfEllipse {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GCE2d_MakeArcOfHyperbola;
class GCE2d_MakeArcOfHyperbola : public GCE2d_Root {
	public:
		%feature("autodoc", "Args:
	Hypr(gp_Hypr2d)
	Alpha1(Standard_Real)
	Alpha2(Standard_Real)
	Sense(Standard_Boolean)=Standard_True

Returns:
	None

Makes an arc of Hyperbola (TrimmedCurve from Geom2d) from  
         a Hyperbola between two parameters Alpha1 and Alpha2.") GCE2d_MakeArcOfHyperbola;
		 GCE2d_MakeArcOfHyperbola (const gp_Hypr2d & Hypr,const Standard_Real Alpha1,const Standard_Real Alpha2,const Standard_Boolean Sense = Standard_True);
		%feature("autodoc", "Args:
	Hypr(gp_Hypr2d)
	P(gp_Pnt2d)
	Alpha(Standard_Real)
	Sense(Standard_Boolean)=Standard_True

Returns:
	None

Makes an arc of Hyperbola (TrimmedCurve from Geom2d) from  
         a Hyperbola between point <P> and the parameter  
         Alpha.") GCE2d_MakeArcOfHyperbola;
		 GCE2d_MakeArcOfHyperbola (const gp_Hypr2d & Hypr,const gp_Pnt2d & P,const Standard_Real Alpha,const Standard_Boolean Sense = Standard_True);
		%feature("autodoc", "Args:
	Hypr(gp_Hypr2d)
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)
	Sense(Standard_Boolean)=Standard_True

Returns:
	None

Makes an arc of Hyperbola (TrimmedCurve from Geom2d) from  
         a Hyperbola between two points P1 and P2.  
Note: the orientation of the arc of hyperbola is:  
-   the trigonometric sense if Sense is not defined or  
  is true (default value), or  
-   the opposite sense if Sense is false.  
- IsDone always returns true.") GCE2d_MakeArcOfHyperbola;
		 GCE2d_MakeArcOfHyperbola (const gp_Hypr2d & Hypr,const gp_Pnt2d & P1,const gp_Pnt2d & P2,const Standard_Boolean Sense = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_TrimmedCurve

Returns the constructed arc of hyperbola.") Value;
		const Handle_Geom2d_TrimmedCurve & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_TrimmedCurve

No detailed docstring for this function.") Operator;
		const Handle_Geom2d_TrimmedCurve & Operator ();
};


%feature("shadow") GCE2d_MakeArcOfHyperbola::~GCE2d_MakeArcOfHyperbola %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GCE2d_MakeArcOfHyperbola {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GCE2d_MakeArcOfParabola;
class GCE2d_MakeArcOfParabola : public GCE2d_Root {
	public:
		%feature("autodoc", "Args:
	Parab(gp_Parab2d)
	Alpha1(Standard_Real)
	Alpha2(Standard_Real)
	Sense(Standard_Boolean)=Standard_True

Returns:
	None

Make an arc of Parabola (TrimmedCurve from Geom2d) from  
         a Parabola between two parameters Alpha1 and Alpha2.") GCE2d_MakeArcOfParabola;
		 GCE2d_MakeArcOfParabola (const gp_Parab2d & Parab,const Standard_Real Alpha1,const Standard_Real Alpha2,const Standard_Boolean Sense = Standard_True);
		%feature("autodoc", "Args:
	Parab(gp_Parab2d)
	P(gp_Pnt2d)
	Alpha(Standard_Real)
	Sense(Standard_Boolean)=Standard_True

Returns:
	None

Make an arc of Parabola (TrimmedCurve from Geom2d) from  
         a Parabola between point <P> and the parameter  
         Alpha.") GCE2d_MakeArcOfParabola;
		 GCE2d_MakeArcOfParabola (const gp_Parab2d & Parab,const gp_Pnt2d & P,const Standard_Real Alpha,const Standard_Boolean Sense = Standard_True);
		%feature("autodoc", "Args:
	Parab(gp_Parab2d)
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)
	Sense(Standard_Boolean)=Standard_True

Returns:
	None

Make an arc of Parabola (TrimmedCurve from Geom2d) from  
         a Parabola between two points P1 and P2.  
Please, note: the orientation of the arc of parabola is:  
  -   the trigonometric sense if Sense is not defined  
   or is true (default value), or  
  -   the opposite sense if Sense is false.  
- IsDone always returns true.") GCE2d_MakeArcOfParabola;
		 GCE2d_MakeArcOfParabola (const gp_Parab2d & Parab,const gp_Pnt2d & P1,const gp_Pnt2d & P2,const Standard_Boolean Sense = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_TrimmedCurve

Returns the constructed arc of parabola.") Value;
		const Handle_Geom2d_TrimmedCurve & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_TrimmedCurve

No detailed docstring for this function.") Operator;
		const Handle_Geom2d_TrimmedCurve & Operator ();
};


%feature("shadow") GCE2d_MakeArcOfParabola::~GCE2d_MakeArcOfParabola %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GCE2d_MakeArcOfParabola {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GCE2d_MakeCircle;
class GCE2d_MakeCircle : public GCE2d_Root {
	public:
		%feature("autodoc", "Args:
	C(gp_Circ2d)

Returns:
	None

creates a circle from a non persistent one.") GCE2d_MakeCircle;
		 GCE2d_MakeCircle (const gp_Circ2d & C);
		%feature("autodoc", "Args:
	A(gp_Ax2d)
	Radius(Standard_Real)
	Sense(Standard_Boolean)=Standard_True

Returns:
	None

A is the 'XAxis' of the circle which defines the origin  
 of parametrization.  
 It is not forbidden to create a circle with Radius = 0.0  
 The status is 'NegativeRadius' if Radius < 0.") GCE2d_MakeCircle;
		 GCE2d_MakeCircle (const gp_Ax2d & A,const Standard_Real Radius,const Standard_Boolean Sense = Standard_True);
		%feature("autodoc", "Args:
	A(gp_Ax22d)
	Radius(Standard_Real)

Returns:
	None

A is the local coordinate system of the circle which defines  
 the origin of parametrization.  
 It is not forbidden to create a circle with Radius = 0.0  
 The status is 'NegativeRadius' if Radius < 0.") GCE2d_MakeCircle;
		 GCE2d_MakeCircle (const gp_Ax22d & A,const Standard_Real Radius);
		%feature("autodoc", "Args:
	Circ(gp_Circ2d)
	Dist(Standard_Real)

Returns:
	None

Make a Circle from Geom2d <TheCirc> parallel to another  
          Circ <Circ> with a distance <Dist>.  
          If Dist is greater than zero the result is enclosing  
          the circle <Circ>, else the result is enclosed by the  
          circle <Circ>.") GCE2d_MakeCircle;
		 GCE2d_MakeCircle (const gp_Circ2d & Circ,const Standard_Real Dist);
		%feature("autodoc", "Args:
	Circ(gp_Circ2d)
	Point(gp_Pnt2d)

Returns:
	None

Make a Circle from Geom2d <TheCirc> parallel to another  
          Circ <Circ> and passing through a Pnt <Point>.") GCE2d_MakeCircle;
		 GCE2d_MakeCircle (const gp_Circ2d & Circ,const gp_Pnt2d & Point);
		%feature("autodoc", "Args:
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)
	P3(gp_Pnt2d)

Returns:
	None

Make a Circ from gp <TheCirc> passing through 3  
          Pnt2d <P1>,<P2>,<P3>.") GCE2d_MakeCircle;
		 GCE2d_MakeCircle (const gp_Pnt2d & P1,const gp_Pnt2d & P2,const gp_Pnt2d & P3);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	Radius(Standard_Real)
	Sense(Standard_Boolean)=Standard_True

Returns:
	None

Make a Circ from geom2d <TheCirc> by its center an radius.") GCE2d_MakeCircle;
		 GCE2d_MakeCircle (const gp_Pnt2d & P,const Standard_Real Radius,const Standard_Boolean Sense = Standard_True);
		%feature("autodoc", "Args:
	Center(gp_Pnt2d)
	Point(gp_Pnt2d)
	Sense(Standard_Boolean)=Standard_True

Returns:
	None

Makes a Circle from geom2d <TheCirc> with its center  
          <Center> and a point giving the radius.  
          If Sense is true the local coordinate system of  
          the solution is direct and non direct in the other case.  
Warning  
The MakeCircle class does not prevent the  
construction of a circle with a null radius.  
If an error occurs (that is, when IsDone returns  
false), the Status function returns:  
-   gce_NegativeRadius if Radius is less than 0.0, or  
-   gce_IntersectionError if points P1, P2 and P3  
  are collinear and the three are not coincident.") GCE2d_MakeCircle;
		 GCE2d_MakeCircle (const gp_Pnt2d & Center,const gp_Pnt2d & Point,const Standard_Boolean Sense = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Circle

Returns the constructed circle.  
Exceptions StdFail_NotDone if no circle is constructed.") Value;
		const Handle_Geom2d_Circle & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Circle

No detailed docstring for this function.") Operator;
		const Handle_Geom2d_Circle & Operator ();
};


%feature("shadow") GCE2d_MakeCircle::~GCE2d_MakeCircle %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GCE2d_MakeCircle {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GCE2d_MakeEllipse;
class GCE2d_MakeEllipse : public GCE2d_Root {
	public:
		%feature("autodoc", "Args:
	E(gp_Elips2d)

Returns:
	None

Creates an ellipse from a non persistent one from package gp") GCE2d_MakeEllipse;
		 GCE2d_MakeEllipse (const gp_Elips2d & E);
		%feature("autodoc", "Args:
	MajorAxis(gp_Ax2d)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)
	Sense(Standard_Boolean)=Standard_True

Returns:
	None

MajorAxis is the local coordinate system of the ellipse.  
 It is the 'XAxis'. The minor axis  is the YAxis of the  
 ellipse.  
 Sense give the sense of parametrization of the Ellipse.  
 It is not forbidden to create an ellipse with MajorRadius =  
 MinorRadius.  
 The status is 'InvertRadius' if MajorRadius < MinorRadius or  
 'NegativeRadius' if MinorRadius < 0.") GCE2d_MakeEllipse;
		 GCE2d_MakeEllipse (const gp_Ax2d & MajorAxis,const Standard_Real MajorRadius,const Standard_Real MinorRadius,const Standard_Boolean Sense = Standard_True);
		%feature("autodoc", "Args:
	Axis(gp_Ax22d)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)

Returns:
	None

Axis is the local coordinate system of the ellipse.  
 It is not forbidden to create an ellipse with MajorRadius =  
 MinorRadius.  
 The status is 'InvertRadius' if MajorRadius < MinorRadius or  
 'NegativeRadius' if MinorRadius < 0.") GCE2d_MakeEllipse;
		 GCE2d_MakeEllipse (const gp_Ax22d & Axis,const Standard_Real MajorRadius,const Standard_Real MinorRadius);
		%feature("autodoc", "Args:
	S1(gp_Pnt2d)
	S2(gp_Pnt2d)
	Center(gp_Pnt2d)

Returns:
	None

Make an Ellipse centered on the point Center, where  
  -   the major axis of the ellipse is defined by Center and S1,  
  -   its major radius is the distance between Center and S1, and  
  -   its minor radius is the distance between S2 and the major axis.  
The implicit orientation of the ellipse is:  
-   the sense defined by Axis or E,  
-   the sense defined by points Center, S1 and S2,  
-   the trigonometric sense if Sense is not given or is true, or  
-   the opposite sense if Sense is false.") GCE2d_MakeEllipse;
		 GCE2d_MakeEllipse (const gp_Pnt2d & S1,const gp_Pnt2d & S2,const gp_Pnt2d & Center);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Ellipse

Returns the constructed ellipse.  
Exceptions StdFail_NotDone if no ellipse is constructed.") Value;
		const Handle_Geom2d_Ellipse & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Ellipse

No detailed docstring for this function.") Operator;
		const Handle_Geom2d_Ellipse & Operator ();
};


%feature("shadow") GCE2d_MakeEllipse::~GCE2d_MakeEllipse %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GCE2d_MakeEllipse {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GCE2d_MakeHyperbola;
class GCE2d_MakeHyperbola : public GCE2d_Root {
	public:
		%feature("autodoc", "Args:
	H(gp_Hypr2d)

Returns:
	None

Creates  an Hyperbola from a non persistent one from package gp") GCE2d_MakeHyperbola;
		 GCE2d_MakeHyperbola (const gp_Hypr2d & H);
		%feature("autodoc", "Args:
	MajorAxis(gp_Ax2d)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)
	Sense(Standard_Boolean)

Returns:
	None

MajorAxis is the 'XAxis' of the hyperbola.  
 The major radius of the hyperbola is on this 'XAxis' and  
 the minor radius is on the 'YAxis' of the hyperbola.  
 The status is 'NegativeRadius' if MajorRadius < 0.0 or if  
 MinorRadius < 0.0") GCE2d_MakeHyperbola;
		 GCE2d_MakeHyperbola (const gp_Ax2d & MajorAxis,const Standard_Real MajorRadius,const Standard_Real MinorRadius,const Standard_Boolean Sense);
		%feature("autodoc", "Args:
	Axis(gp_Ax22d)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)

Returns:
	None

Axis is the local coordinate system of the hyperbola.  
 The major radius of the hyperbola is on this 'XAxis' and  
 the minor radius is on the 'YAxis' of the hyperbola.  
 The status is 'NegativeRadius' if MajorRadius < 0.0 or if  
 MinorRadius < 0.0") GCE2d_MakeHyperbola;
		 GCE2d_MakeHyperbola (const gp_Ax22d & Axis,const Standard_Real MajorRadius,const Standard_Real MinorRadius);
		%feature("autodoc", "Args:
	S1(gp_Pnt2d)
	S2(gp_Pnt2d)
	Center(gp_Pnt2d)

Returns:
	None

Creates a hyperbol centered on the origin of the coordinate system  
 Axis, with major and minor radii MajorRadius and  
  MinorRadius, where the major axis is the 'X Axis'  
  of Axis (Axis is the local coordinate system of the hyperbola).  
  The implicit orientation of the ellipse is:  
-   the sense defined by Axis or H,  
-   the sense defined by points Center, S1 and S2,  
-   the trigonometric sense if Sense is not given or is true, or  
-   the opposite sense if Sense is false.  
Warning  
If an error occurs (that is, when IsDone returns  
false), the Status function returns:  
-   gce_NegativeRadius if MajorRadius or  
  MinorRadius is less than 0.0, or  
-   gce_InvertAxis if the major radius defined by  
  Center and S1 is less than the minor radius  
  defined by Center, S1 and S2.Make an Hyperbola with its center and two apexes.") GCE2d_MakeHyperbola;
		 GCE2d_MakeHyperbola (const gp_Pnt2d & S1,const gp_Pnt2d & S2,const gp_Pnt2d & Center);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Hyperbola

Returns the constructed hyperbola.  
Exceptions: StdFail_NotDone if no hyperbola is constructed.") Value;
		const Handle_Geom2d_Hyperbola & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Hyperbola

No detailed docstring for this function.") Operator;
		const Handle_Geom2d_Hyperbola & Operator ();
};


%feature("shadow") GCE2d_MakeHyperbola::~GCE2d_MakeHyperbola %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GCE2d_MakeHyperbola {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GCE2d_MakeLine;
class GCE2d_MakeLine : public GCE2d_Root {
	public:
		%feature("autodoc", "Args:
	A(gp_Ax2d)

Returns:
	None

Creates a line located in 2D space with the axis placement A.  
 The Location of A is the origin of the line.") GCE2d_MakeLine;
		 GCE2d_MakeLine (const gp_Ax2d & A);
		%feature("autodoc", "Args:
	L(gp_Lin2d)

Returns:
	None

Creates a line from a non persistent line from package gp.") GCE2d_MakeLine;
		 GCE2d_MakeLine (const gp_Lin2d & L);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	V(gp_Dir2d)

Returns:
	None

P is the origin and V is the direction of the line.") GCE2d_MakeLine;
		 GCE2d_MakeLine (const gp_Pnt2d & P,const gp_Dir2d & V);
		%feature("autodoc", "Args:
	Lin(gp_Lin2d)
	Point(gp_Pnt2d)

Returns:
	None

Make a Line from Geom2d <TheLin> parallel to another  
          Lin <Lin> and passing through a Pnt <Point>.") GCE2d_MakeLine;
		 GCE2d_MakeLine (const gp_Lin2d & Lin,const gp_Pnt2d & Point);
		%feature("autodoc", "Args:
	Lin(gp_Lin2d)
	Dist(Standard_Real)

Returns:
	None

Make a Line from Geom2d <TheLin> parallel to another  
          Lin <Lin> at a distance <Dist>.") GCE2d_MakeLine;
		 GCE2d_MakeLine (const gp_Lin2d & Lin,const Standard_Real Dist);
		%feature("autodoc", "Args:
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)

Returns:
	None

Make a Line from Geom2d <TheLin> passing through 2  
          Pnt <P1>,<P2>.  
          It returns false if <p1> and <P2> are confused.  
Warning  
If points P1 and P2 coincident (that is, when IsDone  
returns false), the Status function returns gce_ConfusedPoints.") GCE2d_MakeLine;
		 GCE2d_MakeLine (const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Line

Returns the constructed line.  
Exceptions StdFail_NotDone if no line is constructed.") Value;
		const Handle_Geom2d_Line & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Line

No detailed docstring for this function.") Operator;
		const Handle_Geom2d_Line & Operator ();
};


%feature("shadow") GCE2d_MakeLine::~GCE2d_MakeLine %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GCE2d_MakeLine {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GCE2d_MakeParabola;
class GCE2d_MakeParabola : public GCE2d_Root {
	public:
		%feature("autodoc", "Args:
	Prb(gp_Parab2d)

Returns:
	None

Creates a parabola from a non persistent one.") GCE2d_MakeParabola;
		 GCE2d_MakeParabola (const gp_Parab2d & Prb);
		%feature("autodoc", "Args:
	Axis(gp_Ax22d)
	Focal(Standard_Real)

Returns:
	None

Creates a parabola with its local coordinate system and it's focal  
 length 'Focal'.  
 The 'Location' point of 'Axis' is the vertex of the parabola  
Status is 'NegativeFocusLength' if Focal < 0.0") GCE2d_MakeParabola;
		 GCE2d_MakeParabola (const gp_Ax22d & Axis,const Standard_Real Focal);
		%feature("autodoc", "Args:
	MirrorAxis(gp_Ax2d)
	Focal(Standard_Real)
	Sense(Standard_Boolean)

Returns:
	None

Creates a parabola with its 'MirrorAxis' and it's focal length 'Focal'.  
 MirrorAxis is the axis of symmetry of the curve, it is the  
 'XAxis'. The 'YAxis' is parallel to the directrix of the  
 parabola. The 'Location' point of 'MirrorAxis' is the vertex of the parabola  
Status is 'NegativeFocusLength' if Focal < 0.0") GCE2d_MakeParabola;
		 GCE2d_MakeParabola (const gp_Ax2d & MirrorAxis,const Standard_Real Focal,const Standard_Boolean Sense);
		%feature("autodoc", "Args:
	D(gp_Ax22d)
	F(gp_Pnt2d)

Returns:
	None

Creates a parabola with the local coordinate system and the focus point.  
 The sense of parametrization is given by Sense.") GCE2d_MakeParabola;
		 GCE2d_MakeParabola (const gp_Ax22d & D,const gp_Pnt2d & F);
		%feature("autodoc", "Args:
	D(gp_Ax2d)
	F(gp_Pnt2d)
	Sense(Standard_Boolean)=Standard_True

Returns:
	None

D is the directrix of the parabola and F the focus point.  
 The symmetry axis 'XAxis' of the parabola is normal to the  
 directrix and pass through the focus point F, but its  
 'Location' point is the vertex of the parabola.  
 The 'YAxis' of the parabola is parallel to D and its 'Location'  
 point is the vertex of the parabola.") GCE2d_MakeParabola;
		 GCE2d_MakeParabola (const gp_Ax2d & D,const gp_Pnt2d & F,const Standard_Boolean Sense = Standard_True);
		%feature("autodoc", "Args:
	S1(gp_Pnt2d)
	O(gp_Pnt2d)

Returns:
	None

Make a parabola with focal point S1 and  
         center O  
         The branch of the parabola returned will have <S1> as  
         focal point  
The implicit orientation of the parabola is:  
-   the same one as the parabola Prb,  
-   the sense defined by the coordinate system Axis or the directrix D,  
-   the trigonometric sense if Sense is not given or is true, or  
-   the opposite sense if Sense is false.  
Warning  
The MakeParabola class does not prevent the  
construction of a parabola with a null focal distance.  
If an error occurs (that is, when IsDone returns  
false), the Status function returns:  
-   gce_NullFocusLength if Focal is less than 0.0, or  
-   gce_NullAxis if points S1 and O are coincident.") GCE2d_MakeParabola;
		 GCE2d_MakeParabola (const gp_Pnt2d & S1,const gp_Pnt2d & O);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Parabola

Returns the constructed parabola.  
Exceptions StdFail_NotDone if no parabola is constructed.") Value;
		const Handle_Geom2d_Parabola & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Parabola

No detailed docstring for this function.") Operator;
		const Handle_Geom2d_Parabola & Operator ();
};


%feature("shadow") GCE2d_MakeParabola::~GCE2d_MakeParabola %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GCE2d_MakeParabola {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GCE2d_MakeSegment;
class GCE2d_MakeSegment : public GCE2d_Root {
	public:
		%feature("autodoc", "Args:
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)

Returns:
	None

Make a segment of Line from the 2 points <P1> and <P2>.  
         Status is 'ConfusedPoints' if <P1> and <P2> are confused.") GCE2d_MakeSegment;
		 GCE2d_MakeSegment (const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("autodoc", "Args:
	P1(gp_Pnt2d)
	V(gp_Dir2d)
	P2(gp_Pnt2d)

Returns:
	None

Make a segment of Line from the point <P1> with  
         the direction <P> and ended by the projection of  
         <P2> on the line <P1,V>.  
         Status is 'ConfusedPoints' if <P1> and <P2> are confused.") GCE2d_MakeSegment;
		 GCE2d_MakeSegment (const gp_Pnt2d & P1,const gp_Dir2d & V,const gp_Pnt2d & P2);
		%feature("autodoc", "Args:
	Line(gp_Lin2d)
	U1(Standard_Real)
	U2(Standard_Real)

Returns:
	None

Make a segment of Line from the line <Line>  
         between the two parameters U1 and U2.  
         Status is 'SameParamters' if <U1> is equal <U2>.") GCE2d_MakeSegment;
		 GCE2d_MakeSegment (const gp_Lin2d & Line,const Standard_Real U1,const Standard_Real U2);
		%feature("autodoc", "Args:
	Line(gp_Lin2d)
	Point(gp_Pnt2d)
	Ulast(Standard_Real)

Returns:
	None

Make a segment of Line from the line <Line>  
         between the point <Point> and the parameter Ulast.  
         It returns NullObject if <U1> is equal <U2>.") GCE2d_MakeSegment;
		 GCE2d_MakeSegment (const gp_Lin2d & Line,const gp_Pnt2d & Point,const Standard_Real Ulast);
		%feature("autodoc", "Args:
	Line(gp_Lin2d)
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)

Returns:
	None

Make a segment of Line from the line <Line>  
         between the two points <P1> and <P2>.  
         It returns NullObject if <P1> and <P2> are confused.  
Warning  
If the points which limit the segment are coincident  
for given points or for the projection of given points  
on the line which supports the line segment (that is,  
when IsDone returns false), the Status function  
returns gce_ConfusedPoints. This warning only  
concerns the first two constructors.") GCE2d_MakeSegment;
		 GCE2d_MakeSegment (const gp_Lin2d & Line,const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_TrimmedCurve

Returns the constructed line segment.  
Exceptions StdFail_NotDone if no line segment is constructed.") Value;
		const Handle_Geom2d_TrimmedCurve & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_TrimmedCurve

No detailed docstring for this function.") Operator;
		const Handle_Geom2d_TrimmedCurve & Operator ();
};


%feature("shadow") GCE2d_MakeSegment::~GCE2d_MakeSegment %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GCE2d_MakeSegment {
	void _kill_pointed() {
		delete $self;
	}
};
