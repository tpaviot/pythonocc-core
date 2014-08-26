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
%module gce

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

%include gce_required_python_modules.i
%include gce_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
enum gce_ErrorType {
	gce_Done = 0,
	gce_ConfusedPoints = 1,
	gce_NegativeRadius = 2,
	gce_ColinearPoints = 3,
	gce_IntersectionError = 4,
	gce_NullAxis = 5,
	gce_NullAngle = 6,
	gce_NullRadius = 7,
	gce_InvertAxis = 8,
	gce_BadAngle = 9,
	gce_InvertRadius = 10,
	gce_NullFocusLength = 11,
	gce_NullVector = 12,
	gce_BadEquation = 13,
};

/* end public enums declaration */

%nodefaultctor gce_MakeMirror;
class gce_MakeMirror {
	public:
		%feature("autodoc", "Args:
	Point(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") gce_MakeMirror;
		 gce_MakeMirror (const gp_Pnt & Point);
		%feature("autodoc", "Args:
	Axis(gp_Ax1)

Returns:
	None

No detailed docstring for this function.") gce_MakeMirror;
		 gce_MakeMirror (const gp_Ax1 & Axis);
		%feature("autodoc", "Args:
	Line(gp_Lin)

Returns:
	None

No detailed docstring for this function.") gce_MakeMirror;
		 gce_MakeMirror (const gp_Lin & Line);
		%feature("autodoc", "Args:
	Point(gp_Pnt)
	Direc(gp_Dir)

Returns:
	None

Makes a symmetry transformation af axis defined by  
         <Point> and <Direc>.") gce_MakeMirror;
		 gce_MakeMirror (const gp_Pnt & Point,const gp_Dir & Direc);
		%feature("autodoc", "Args:
	Plane(gp_Pln)

Returns:
	None

Makes a symmetry transformation of plane <Plane>.") gce_MakeMirror;
		 gce_MakeMirror (const gp_Pln & Plane);
		%feature("autodoc", "Args:
	Plane(gp_Ax2)

Returns:
	None

Makes a symmetry transformation of plane <Plane>.") gce_MakeMirror;
		 gce_MakeMirror (const gp_Ax2 & Plane);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Trsf

Returns the constructed transformation.") Value;
		const gp_Trsf & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Trsf

No detailed docstring for this function.") Operator;
		const gp_Trsf & Operator ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorgp_Trsf;
		 operator gp_Trsf ();
};


%feature("shadow") gce_MakeMirror::~gce_MakeMirror %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gce_MakeMirror {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gce_MakeMirror2d;
class gce_MakeMirror2d {
	public:
		%feature("autodoc", "Args:
	Point(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") gce_MakeMirror2d;
		 gce_MakeMirror2d (const gp_Pnt2d & Point);
		%feature("autodoc", "Args:
	Axis(gp_Ax2d)

Returns:
	None

No detailed docstring for this function.") gce_MakeMirror2d;
		 gce_MakeMirror2d (const gp_Ax2d & Axis);
		%feature("autodoc", "Args:
	Line(gp_Lin2d)

Returns:
	None

No detailed docstring for this function.") gce_MakeMirror2d;
		 gce_MakeMirror2d (const gp_Lin2d & Line);
		%feature("autodoc", "Args:
	Point(gp_Pnt2d)
	Direc(gp_Dir2d)

Returns:
	None

Makes a symmetry transformation af axis defined by  
         <Point> and <Direc>.") gce_MakeMirror2d;
		 gce_MakeMirror2d (const gp_Pnt2d & Point,const gp_Dir2d & Direc);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Trsf2d

Returns the constructed transformation.") Value;
		const gp_Trsf2d & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Trsf2d

No detailed docstring for this function.") Operator;
		const gp_Trsf2d & Operator ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorgp_Trsf2d;
		 operator gp_Trsf2d ();
};


%feature("shadow") gce_MakeMirror2d::~gce_MakeMirror2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gce_MakeMirror2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gce_MakeRotation;
class gce_MakeRotation {
	public:
		%feature("autodoc", "Args:
	Line(gp_Lin)
	Angle(Standard_Real)

Returns:
	None

Constructs a rotation through angle Angle about the axis defined by the line Line.") gce_MakeRotation;
		 gce_MakeRotation (const gp_Lin & Line,const Standard_Real Angle);
		%feature("autodoc", "Args:
	Axis(gp_Ax1)
	Angle(Standard_Real)

Returns:
	None

Constructs a rotation through angle Angle about the axis defined by the axis Axis.") gce_MakeRotation;
		 gce_MakeRotation (const gp_Ax1 & Axis,const Standard_Real Angle);
		%feature("autodoc", "Args:
	Point(gp_Pnt)
	Direc(gp_Dir)
	Angle(Standard_Real)

Returns:
	None

Constructs a rotation through angle Angle about the axis defined by:  
the point Point and the unit vector Direc.") gce_MakeRotation;
		 gce_MakeRotation (const gp_Pnt & Point,const gp_Dir & Direc,const Standard_Real Angle);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Trsf

Returns the constructed transformation.") Value;
		const gp_Trsf & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Trsf

No detailed docstring for this function.") Operator;
		const gp_Trsf & Operator ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorgp_Trsf;
		 operator gp_Trsf ();
};


%feature("shadow") gce_MakeRotation::~gce_MakeRotation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gce_MakeRotation {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gce_MakeRotation2d;
class gce_MakeRotation2d {
	public:
		%feature("autodoc", "Args:
	Point(gp_Pnt2d)
	Angle(Standard_Real)

Returns:
	None

Constructs a rotation through angle Angle about the center Point.") gce_MakeRotation2d;
		 gce_MakeRotation2d (const gp_Pnt2d & Point,const Standard_Real Angle);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Trsf2d

Returns the constructed transformation.") Value;
		const gp_Trsf2d & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Trsf2d

No detailed docstring for this function.") Operator;
		const gp_Trsf2d & Operator ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorgp_Trsf2d;
		 operator gp_Trsf2d ();
};


%feature("shadow") gce_MakeRotation2d::~gce_MakeRotation2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gce_MakeRotation2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gce_MakeScale;
class gce_MakeScale {
	public:
		%feature("autodoc", "Args:
	Point(gp_Pnt)
	Scale(Standard_Real)

Returns:
	None

Constructs a scaling transformation with  
-   Point as the center of the transformation, and  
-   Scale as the scale factor.") gce_MakeScale;
		 gce_MakeScale (const gp_Pnt & Point,const Standard_Real Scale);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Trsf

Returns the constructed transformation.") Value;
		const gp_Trsf & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Trsf

No detailed docstring for this function.") Operator;
		const gp_Trsf & Operator ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorgp_Trsf;
		 operator gp_Trsf ();
};


%feature("shadow") gce_MakeScale::~gce_MakeScale %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gce_MakeScale {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gce_MakeScale2d;
class gce_MakeScale2d {
	public:
		%feature("autodoc", "Args:
	Point(gp_Pnt2d)
	Scale(Standard_Real)

Returns:
	None

Constructs a scaling transformation with:  
-   Point as the center of the transformation, and  
-   Scale as the scale factor.") gce_MakeScale2d;
		 gce_MakeScale2d (const gp_Pnt2d & Point,const Standard_Real Scale);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Trsf2d

Returns the constructed transformation.") Value;
		const gp_Trsf2d & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Trsf2d

No detailed docstring for this function.") Operator;
		const gp_Trsf2d & Operator ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorgp_Trsf2d;
		 operator gp_Trsf2d ();
};


%feature("shadow") gce_MakeScale2d::~gce_MakeScale2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gce_MakeScale2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gce_MakeTranslation;
class gce_MakeTranslation {
	public:
		%feature("autodoc", "Args:
	Vect(gp_Vec)

Returns:
	None

Constructs a translation along the vector ' Vect'") gce_MakeTranslation;
		 gce_MakeTranslation (const gp_Vec & Vect);
		%feature("autodoc", "Args:
	Point1(gp_Pnt)
	Point2(gp_Pnt)

Returns:
	None

Constructs a translation along the vector  
  (Point1,Point2) defined from the point Point1 to the point Point2.") gce_MakeTranslation;
		 gce_MakeTranslation (const gp_Pnt & Point1,const gp_Pnt & Point2);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Trsf

Returns the constructed transformation.") Value;
		const gp_Trsf & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Trsf

No detailed docstring for this function.") Operator;
		const gp_Trsf & Operator ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorgp_Trsf;
		 operator gp_Trsf ();
};


%feature("shadow") gce_MakeTranslation::~gce_MakeTranslation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gce_MakeTranslation {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gce_MakeTranslation2d;
class gce_MakeTranslation2d {
	public:
		%feature("autodoc", "Args:
	Vect(gp_Vec2d)

Returns:
	None

Constructs a translation along the vector Vect.") gce_MakeTranslation2d;
		 gce_MakeTranslation2d (const gp_Vec2d & Vect);
		%feature("autodoc", "Args:
	Point1(gp_Pnt2d)
	Point2(gp_Pnt2d)

Returns:
	None

Constructs a translation along the vector  
 (Point1,Point2) defined from the point Point1 to the point Point2.") gce_MakeTranslation2d;
		 gce_MakeTranslation2d (const gp_Pnt2d & Point1,const gp_Pnt2d & Point2);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Trsf2d

Returns the constructed transformation.") Value;
		const gp_Trsf2d & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Trsf2d

No detailed docstring for this function.") Operator;
		const gp_Trsf2d & Operator ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorgp_Trsf2d;
		 operator gp_Trsf2d ();
};


%feature("shadow") gce_MakeTranslation2d::~gce_MakeTranslation2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gce_MakeTranslation2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gce_Root;
class gce_Root {
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


%feature("shadow") gce_Root::~gce_Root %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gce_Root {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gce_MakeCirc;
class gce_MakeCirc : public gce_Root {
	public:
		%feature("autodoc", "Args:
	A2(gp_Ax2)
	Radius(Standard_Real)

Returns:
	None

A2 locates the circle and gives its orientation in 3D space.  
Warnings :  
 It is not forbidden to create a circle with Radius = 0.0  
The status is 'NegativeRadius' if Radius < 0.0") gce_MakeCirc;
		 gce_MakeCirc (const gp_Ax2 & A2,const Standard_Real Radius);
		%feature("autodoc", "Args:
	Circ(gp_Circ)
	Dist(Standard_Real)

Returns:
	None

Makes a Circ from gp <TheCirc> coaxial to another  
          Circ <Circ> at a distance <Dist>.  
          If Dist is greater than zero the result is encloses  
          the circle <Circ>, else the result is enclosed by the  
          circle <Circ>.") gce_MakeCirc;
		 gce_MakeCirc (const gp_Circ & Circ,const Standard_Real Dist);
		%feature("autodoc", "Args:
	Circ(gp_Circ)
	Point(gp_Pnt)

Returns:
	None

Makes a Circ from gp <TheCirc> coaxial to another  
          Circ <Circ> and passing through a Pnt2d <Point>.") gce_MakeCirc;
		 gce_MakeCirc (const gp_Circ & Circ,const gp_Pnt & Point);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)
	P3(gp_Pnt)

Returns:
	None

Makes a Circ from gp <TheCirc> passing through 3  
          Pnt2d <P1>,<P2>,<P3>.") gce_MakeCirc;
		 gce_MakeCirc (const gp_Pnt & P1,const gp_Pnt & P2,const gp_Pnt & P3);
		%feature("autodoc", "Args:
	Center(gp_Pnt)
	Norm(gp_Dir)
	Radius(Standard_Real)

Returns:
	None

Makes a Circ from gp <TheCirc> with its center  
          <Center> and the normal of its plane <Norm> and  
          its radius <Radius>.") gce_MakeCirc;
		 gce_MakeCirc (const gp_Pnt & Center,const gp_Dir & Norm,const Standard_Real Radius);
		%feature("autodoc", "Args:
	Center(gp_Pnt)
	Plane(gp_Pln)
	Radius(Standard_Real)

Returns:
	None

Makes a Circ from gp <TheCirc> with its center  
          <Center> and the normal of its plane <Plane> and  
          its radius <Radius>.") gce_MakeCirc;
		 gce_MakeCirc (const gp_Pnt & Center,const gp_Pln & Plane,const Standard_Real Radius);
		%feature("autodoc", "Args:
	Center(gp_Pnt)
	Ptaxis(gp_Pnt)
	Radius(Standard_Real)

Returns:
	None

Makes a Circ from gp <TheCirc> with its center  
          <Center> and a point <Ptaxis> giving the normal  
          of its plane <Plane> and its radius <Radius>.") gce_MakeCirc;
		 gce_MakeCirc (const gp_Pnt & Center,const gp_Pnt & Ptaxis,const Standard_Real Radius);
		%feature("autodoc", "Args:
	Axis(gp_Ax1)
	Radius(Standard_Real)

Returns:
	None

Makes a Circ from gp <TheCirc> with its center  
          <Center> and its radius <Radius>.  
Warning  
The MakeCirc class does not prevent the  
construction of a circle with a null radius.  
If an error occurs (that is, when IsDone returns  
false), the Status function returns:  
-   gce_Negative Radius if:  
  -   Radius is less than 0.0, or  
  -   Dist is less than 0.0 and the absolute value of  
   Dist is greater than the radius of Circ;  
-   gce_IntersectionError if the points P1, P2 and  
  P3 are collinear, and the three are not coincident;  
-   gce_ConfusedPoints if two of the three points  
  P1, P2 and P3 are coincident; or  
-   gce_NullAxis if Center and Ptaxis are coincident.") gce_MakeCirc;
		 gce_MakeCirc (const gp_Ax1 & Axis,const Standard_Real Radius);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Circ

Returns the constructed circle.  
Exceptions StdFail_NotDone if no circle is constructed.") Value;
		const gp_Circ & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Circ

No detailed docstring for this function.") Operator;
		const gp_Circ & Operator ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorgp_Circ;
		 operator gp_Circ ();
};


%feature("shadow") gce_MakeCirc::~gce_MakeCirc %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gce_MakeCirc {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gce_MakeCirc2d;
class gce_MakeCirc2d : public gce_Root {
	public:
		%feature("autodoc", "Args:
	XAxis(gp_Ax2d)
	Radius(Standard_Real)
	Sense(Standard_Boolean)=Standard_True

Returns:
	None

The location point of XAxis is the center of the circle.  
Warnings :  
 It is not forbidden to create a circle with Radius = 0.0  
 If Sense is true the local coordinate system of the solution  
 is direct and non direct in the other case.  
 The status is 'NegativeRadius' if Radius < 0.0.") gce_MakeCirc2d;
		 gce_MakeCirc2d (const gp_Ax2d & XAxis,const Standard_Real Radius,const Standard_Boolean Sense = Standard_True);
		%feature("autodoc", "Args:
	Axis(gp_Ax22d)
	Radius(Standard_Real)

Returns:
	None

The location point of Axis is the center of the circle.  
 Warnings :  
 It is not forbidden to create a circle with Radius = 0.0") gce_MakeCirc2d;
		 gce_MakeCirc2d (const gp_Ax22d & Axis,const Standard_Real Radius);
		%feature("autodoc", "Args:
	Circ(gp_Circ2d)
	Dist(Standard_Real)

Returns:
	None

Makes a Circ2d from gp <TheCirc> concentric with another  
          circ2d <Circ> with a distance <Dist>.  
          If Dist is greater than zero the result encloses  
          the circle <Circ>, else the result is enclosed by the  
          circle <Circ>.  
          The local coordinate system of the solution is the  
          same as Circ.") gce_MakeCirc2d;
		 gce_MakeCirc2d (const gp_Circ2d & Circ,const Standard_Real Dist);
		%feature("autodoc", "Args:
	Circ(gp_Circ2d)
	Point(gp_Pnt2d)

Returns:
	None

Makes a Circ2d from gp <TheCirc> concentric with another  
          circ2d <Circ> and passing through a Pnt2d <Point>.  
          The local coordinate system of the solution is the  
          same as Circ.") gce_MakeCirc2d;
		 gce_MakeCirc2d (const gp_Circ2d & Circ,const gp_Pnt2d & Point);
		%feature("autodoc", "Args:
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)
	P3(gp_Pnt2d)

Returns:
	None

Makes a Circ2d from gp <TheCirc> passing through 3  
          Pnt2d <P1>,<P2>,<P3>.  
          The local coordinate system of the solution is given  
          by the three points P1, P2, P3.") gce_MakeCirc2d;
		 gce_MakeCirc2d (const gp_Pnt2d & P1,const gp_Pnt2d & P2,const gp_Pnt2d & P3);
		%feature("autodoc", "Args:
	Center(gp_Pnt2d)
	Radius(Standard_Real)
	Sense(Standard_Boolean)=Standard_True

Returns:
	None

Makes a Circ2d from gp <TheCirc> with its center  
          <Center> and its radius <Radius>.  
          If Sense is true the local coordinate system of  
          the solution is direct and non direct in the other case.") gce_MakeCirc2d;
		 gce_MakeCirc2d (const gp_Pnt2d & Center,const Standard_Real Radius,const Standard_Boolean Sense = Standard_True);
		%feature("autodoc", "Args:
	Center(gp_Pnt2d)
	Point(gp_Pnt2d)
	Sense(Standard_Boolean)=Standard_True

Returns:
	None

Makes a Circ2d from gp <TheCirc> with its center  
          <Center> and a point giving the radius.  
          If Sense is true the local coordinate system of  
          the solution is direct and non direct in the other case.") gce_MakeCirc2d;
		 gce_MakeCirc2d (const gp_Pnt2d & Center,const gp_Pnt2d & Point,const Standard_Boolean Sense = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Circ2d

Returns the constructed circle.  
Exceptions StdFail_NotDone if no circle is constructed.") Value;
		const gp_Circ2d & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Circ2d

No detailed docstring for this function.") Operator;
		const gp_Circ2d & Operator ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorgp_Circ2d;
		 operator gp_Circ2d ();
};


%feature("shadow") gce_MakeCirc2d::~gce_MakeCirc2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gce_MakeCirc2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gce_MakeCone;
class gce_MakeCone : public gce_Root {
	public:
		%feature("autodoc", "Args:
	A2(gp_Ax2)
	Ang(Standard_Real)
	Radius(Standard_Real)

Returns:
	None

Creates an infinite conical surface. A2 locates the cone  
 in the space and defines the reference plane of the surface.  
 Ang is the conical surface semi-angle between 0 and PI/2 radians.  
 Radius is the radius of the circle in the reference plane of  
 the cone.  
 If Radius is lower than 0.0 the status is '  
 If Ang < Resolution from gp  or Ang >= (PI/2) - Resolution.") gce_MakeCone;
		 gce_MakeCone (const gp_Ax2 & A2,const Standard_Real Ang,const Standard_Real Radius);
		%feature("autodoc", "Args:
	Cone(gp_Cone)
	Point(gp_Pnt)

Returns:
	None

Makes a Cone from gp <TheCone> coaxial to another  
          Cone <Cone> and passing through a Pnt <Point>.") gce_MakeCone;
		 gce_MakeCone (const gp_Cone & Cone,const gp_Pnt & Point);
		%feature("autodoc", "Args:
	Cone(gp_Cone)
	Dist(Standard_Real)

Returns:
	None

Makes a Cone from gp <TheCone> coaxial to another  
          Cone <Cone> at the distance <Dist> which can  
          be greater or lower than zero.") gce_MakeCone;
		 gce_MakeCone (const gp_Cone & Cone,const Standard_Real Dist);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)
	P3(gp_Pnt)
	P4(gp_Pnt)

Returns:
	None

Makes a Cone from gp <TheCone> by four points <P1>,  
          <P2>,<P3> and <P4>.  
          Its axis is <P1P2> and the radius of its base is  
          the distance between <P3> and <P1P2>.  
          The distance between <P4> and <P1P2> is the radius of  
          the section passing through <P4>.  
          If <P1> and <P2> are confused or <P3> and <P4> are  
          confused we have the status 'ConfusedPoints'  
          if <P1>,<P2>,<P3>,<P4> are colinear we have the  
          status 'ColinearPoints'  
          If <P3P4> is perpendicular to <P1P2> we have the  
          status 'NullAngle'.  
          <P3P4> is colinear to <P1P2> we have the status  
          'NullAngle'.") gce_MakeCone;
		 gce_MakeCone (const gp_Pnt & P1,const gp_Pnt & P2,const gp_Pnt & P3,const gp_Pnt & P4);
		%feature("autodoc", "Args:
	Axis(gp_Ax1)
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

Makes a Cone by its axis <Axis> and and two points.  
         The distance between <P1> and the axis is the radius  
         of the section passing through <P1>.  
         The distance between <P2> and the axis is the radius  
         of the section passing through <P2>.  
         If <P1P2> is colinear to <Axis> we have the status  
         'NullAngle'  
         If <P3P4> is perpendicular to <Axis> we have the status  
         'NullAngle'  
         If <P1> and <P2> are confused we have the status  
         'ConfusedPoints'") gce_MakeCone;
		 gce_MakeCone (const gp_Ax1 & Axis,const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("autodoc", "Args:
	Axis(gp_Lin)
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

Makes a Cone by its axis <Axis> and and two points.  
         The distance between <P1> and the axis is the radius  
         of the section passing through <P1>  
         The distance between <P2> and the axis is the radius  
         of the section passing through <P2>  
         If <P1P2> is colinear to <Axis> we have the status  
         'NullAngle'  
         If <P3P4> is perpendicular to <Axis> we have the status  
         'NullAngle'  
         If <P1> and <P2> are confused we have the status  
         'ConfusedPoints'") gce_MakeCone;
		 gce_MakeCone (const gp_Lin & Axis,const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)
	R1(Standard_Real)
	R2(Standard_Real)

Returns:
	None

Makes a Cone with two points and two radius.  
         The axis of the solution is the line passing through  
         <P1> and <P2>.  
         <R1> is the radius of the section passing through <P1>  
         and <R2> the radius of the section passing through <P2>.  
         If <P1> and <P2> are confused we have the status 'NullAxis'.  
Warning  
If an error occurs (that is, when IsDone returns  
false), the Status function returns:  
-   gce_NegativeRadius if Radius, R1 or R2 is less than 0.0;  
-   gce_BadAngle if Ang is less than  
  gp::Resolution() or greater than Pi/2.- gp::Resolution();  
-   gce_ConfusedPoints if P1 and P2 or P3 and P4 are coincident;  
-   gce_NullAxis if the points P1 and P2, are coincident (5th syntax only);  
-   gce_NullAngle if:  
  -   the vector joining P1 to P2 is parallel to either  
   Axis or the line joining P3 to P4, or  
  -   R1 and R2 are equal, (that is, their difference is  
   less than gp::Resolution()); or  
-   gce_NullRadius if:  
-   the vector joining P1 to P2 is perpendicular to the line joining P3 to P4,  
  -   the vector joining P1 to P2 is perpendicular to Axis, or  
  -   P1, P2, P3, and P4 are collinear.") gce_MakeCone;
		 gce_MakeCone (const gp_Pnt & P1,const gp_Pnt & P2,const Standard_Real R1,const Standard_Real R2);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Cone

Returns the constructed cone.  
Exceptions StdFail_NotDone if no cone is constructed.") Value;
		const gp_Cone & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Cone

No detailed docstring for this function.") Operator;
		const gp_Cone & Operator ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorgp_Cone;
		 operator gp_Cone ();
};


%feature("shadow") gce_MakeCone::~gce_MakeCone %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gce_MakeCone {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gce_MakeCylinder;
class gce_MakeCylinder : public gce_Root {
	public:
		%feature("autodoc", "Args:
	A2(gp_Ax2)
	Radius(Standard_Real)

Returns:
	None

//!<A2> is the local cartesian coordinate system of <self>.  
          The status is 'NegativeRadius' if R < 0.0") gce_MakeCylinder;
		 gce_MakeCylinder (const gp_Ax2 & A2,const Standard_Real Radius);
		%feature("autodoc", "Args:
	Cyl(gp_Cylinder)
	Point(gp_Pnt)

Returns:
	None

Makes a Cylinder from gp <TheCylinder> coaxial to another  
          Cylinder <Cylinder> and passing through a Pnt <Point>.") gce_MakeCylinder;
		 gce_MakeCylinder (const gp_Cylinder & Cyl,const gp_Pnt & Point);
		%feature("autodoc", "Args:
	Cyl(gp_Cylinder)
	Dist(Standard_Real)

Returns:
	None

Makes a Cylinder from gp <TheCylinder> coaxial to another  
          Cylinder <Cylinder> at the distance <Dist> which can  
          be greater or lower than zero.  
          The radius of the result is the absolute value of the  
          radius of <Cyl> plus <Dist>") gce_MakeCylinder;
		 gce_MakeCylinder (const gp_Cylinder & Cyl,const Standard_Real Dist);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)
	P3(gp_Pnt)

Returns:
	None

Makes a Cylinder from gp <TheCylinder> with 3 points  
          <P1>,<P2>,<P3>.  
          Its axis is <P1P2> and its radius is the distance  
          between <P3> and <P1P2>") gce_MakeCylinder;
		 gce_MakeCylinder (const gp_Pnt & P1,const gp_Pnt & P2,const gp_Pnt & P3);
		%feature("autodoc", "Args:
	Axis(gp_Ax1)
	Radius(Standard_Real)

Returns:
	None

Makes a Cylinder by its axis <Axis> and radius <Radius>.") gce_MakeCylinder;
		 gce_MakeCylinder (const gp_Ax1 & Axis,const Standard_Real Radius);
		%feature("autodoc", "Args:
	Circ(gp_Circ)

Returns:
	None

Makes a Cylinder by its circular base.  
Warning  
If an error occurs (that is, when IsDone returns  
false), the Status function returns:  
-   gce_NegativeRadius if:  
  -   Radius is less than 0.0, or  
  -   Dist is negative and has an absolute value  
   which is greater than the radius of Cyl; or  
-   gce_ConfusedPoints if points P1 and P2 are coincident.") gce_MakeCylinder;
		 gce_MakeCylinder (const gp_Circ & Circ);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Cylinder

Returns the constructed cylinder.  
Exceptions StdFail_NotDone if no cylinder is constructed.") Value;
		const gp_Cylinder & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Cylinder

No detailed docstring for this function.") Operator;
		const gp_Cylinder & Operator ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorgp_Cylinder;
		 operator gp_Cylinder ();
};


%feature("shadow") gce_MakeCylinder::~gce_MakeCylinder %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gce_MakeCylinder {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gce_MakeDir;
class gce_MakeDir : public gce_Root {
	public:
		%feature("autodoc", "Args:
	V(gp_Vec)

Returns:
	None

Normalizes the vector V and creates a direction.  
           Status is 'NullVector' if V.Magnitude() <= Resolution.") gce_MakeDir;
		 gce_MakeDir (const gp_Vec & V);
		%feature("autodoc", "Args:
	Coord(gp_XYZ)

Returns:
	None

Creates a direction from a triplet of coordinates.  
           Status is 'NullVector' if Coord.Modulus() <=  
           Resolution from gp.") gce_MakeDir;
		 gce_MakeDir (const gp_XYZ & Coord);
		%feature("autodoc", "Args:
	Xv(Standard_Real)
	Yv(Standard_Real)
	Zv(Standard_Real)

Returns:
	None

Creates a direction with its 3 cartesian coordinates.  
           Status is 'NullVector' if Sqrt(Xv*Xv + Yv*Yv + Zv*Zv)  
           <= Resolution") gce_MakeDir;
		 gce_MakeDir (const Standard_Real Xv,const Standard_Real Yv,const Standard_Real Zv);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

Make a Dir from gp <TheDir> passing through 2  
          Pnt <P1>,<P2>.  
          Status is 'ConfusedPoints' if <p1> and <P2> are confused.  
Warning  
If an error occurs (that is, when IsDone returns  
false), the Status function returns:  
-   gce_ConfusedPoints if points P1 and P2 are coincident, or  
-   gce_NullVector if one of the following is less  
  than or equal to gp::Resolution():  
  -   the magnitude of vector V,  
  -   the modulus of Coord,  
  -   Sqrt(Xv*Xv + Yv*Yv + Zv*Zv).") gce_MakeDir;
		 gce_MakeDir (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir

Returns the constructed unit vector.  
Exceptions StdFail_NotDone if no unit vector is constructed.") Value;
		const gp_Dir & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir

No detailed docstring for this function.") Operator;
		const gp_Dir & Operator ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorgp_Dir;
		 operator gp_Dir ();
};


%feature("shadow") gce_MakeDir::~gce_MakeDir %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gce_MakeDir {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gce_MakeDir2d;
class gce_MakeDir2d : public gce_Root {
	public:
		%feature("autodoc", "Args:
	V(gp_Vec2d)

Returns:
	None

Normalizes the vector V and creates a direction.  
           Status is 'NullVector' if V.Magnitude() <= Resolution.") gce_MakeDir2d;
		 gce_MakeDir2d (const gp_Vec2d & V);
		%feature("autodoc", "Args:
	Coord(gp_XY)

Returns:
	None

Creates a direction from a triplet of coordinates.  
           Status is 'NullVector' if Coord.Modulus() <=  
           Resolution from gp.") gce_MakeDir2d;
		 gce_MakeDir2d (const gp_XY & Coord);
		%feature("autodoc", "Args:
	Xv(Standard_Real)
	Yv(Standard_Real)

Returns:
	None

Creates a direction with its 3 cartesian coordinates.  
           Status is 'NullVector' if Sqrt(Xv*Xv + Yv*Yv )  
           <= Resolution") gce_MakeDir2d;
		 gce_MakeDir2d (const Standard_Real Xv,const Standard_Real Yv);
		%feature("autodoc", "Args:
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)

Returns:
	None

Make a Dir2d from gp <TheDir> passing through 2  
          Pnt <P1>,<P2>.  
          Status is 'ConfusedPoints' if <P1> and <P2> are confused.  
Warning  
If an error occurs (that is, when IsDone returns  
false), the Status function returns:  
-   gce_ConfusedPoints if points P1 and P2 are coincident, or  
-   gce_NullVector if one of the following is less  
  than or equal to gp::Resolution():  
  -   the magnitude of vector V,  
  -   the modulus of Coord,  
  -   Sqrt(Xv*Xv + Yv*Yv).") gce_MakeDir2d;
		 gce_MakeDir2d (const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir2d

Returns the constructed unit vector.  
Exceptions StdFail_NotDone if no unit vector is constructed.") Value;
		const gp_Dir2d & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir2d

No detailed docstring for this function.") Operator;
		const gp_Dir2d & Operator ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorgp_Dir2d;
		 operator gp_Dir2d ();
};


%feature("shadow") gce_MakeDir2d::~gce_MakeDir2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gce_MakeDir2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gce_MakeElips;
class gce_MakeElips : public gce_Root {
	public:
		%feature("autodoc", "Args:
	A2(gp_Ax2)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)

Returns:
	None

//!The major radius of the ellipse is on the 'XAxis' and the  
          minor radius is on the 'YAxis' of the ellipse. The 'XAxis'  
          is defined with the 'XDirection' of A2 and the 'YAxis' is  
          defined with the 'YDirection' of A2.  
Warnings :  
          It is not forbidden to create an ellipse with  
          MajorRadius = MinorRadius.") gce_MakeElips;
		 gce_MakeElips (const gp_Ax2 & A2,const Standard_Real MajorRadius,const Standard_Real MinorRadius);
		%feature("autodoc", "Args:
	S1(gp_Pnt)
	S2(gp_Pnt)
	Center(gp_Pnt)

Returns:
	None

Make an ellipse with its center and two points.  
Warning  
The MakeElips class does not prevent the  
construction of an ellipse where the MajorRadius is  
equal to the MinorRadius.  
If an error occurs (that is, when IsDone returns  
false), the Status function returns:  
-   gce_InvertRadius if MajorRadius is less than MinorRadius;  
-   gce_NegativeRadius if MinorRadius is less than 0.0;  
-   gce_NullAxis if the points S1 and Center are coincident; or  
-   gce_InvertAxis if:  
  -   the major radius computed with Center and S1  
   is less than the minor radius computed with Center, S1 and S2, or  
  -   Center, S1 and S2 are collinear.") gce_MakeElips;
		 gce_MakeElips (const gp_Pnt & S1,const gp_Pnt & S2,const gp_Pnt & Center);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Elips

Returns the constructed ellipse.  
Exceptions StdFail_NotDone if no ellipse is constructed.") Value;
		const gp_Elips & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Elips

No detailed docstring for this function.") Operator;
		const gp_Elips & Operator ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorgp_Elips;
		 operator gp_Elips ();
};


%feature("shadow") gce_MakeElips::~gce_MakeElips %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gce_MakeElips {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gce_MakeElips2d;
class gce_MakeElips2d : public gce_Root {
	public:
		%feature("autodoc", "Args:
	MajorAxis(gp_Ax2d)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)
	Sense(Standard_Boolean)=Standard_True

Returns:
	None

Creates an ellipse with the major axis, the major and the  
 minor radius. The location of the MajorAxis is the center  
 of the  ellipse.  
 The sense of parametrization is given by Sense.  
 It is possible to create an ellipse with MajorRadius = MinorRadius.  
 the status is 'InvertRadius' if MajorRadius < MinorRadius or  
 'NegativeRadius' if MinorRadius < 0.0") gce_MakeElips2d;
		 gce_MakeElips2d (const gp_Ax2d & MajorAxis,const Standard_Real MajorRadius,const Standard_Real MinorRadius,const Standard_Boolean Sense = Standard_True);
		%feature("autodoc", "Args:
	A(gp_Ax22d)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)

Returns:
	None

Axis defines the Xaxis and Yaxis of the ellipse which defines  
 the origin and the sense of parametrization.  
 Creates an ellipse with the AxisPlacement the major and the  
 minor radius. The location of Axis is the center  
 of the  ellipse.  
 It is possible to create an ellipse with MajorRadius = MinorRadius.  
 the status is 'InvertRadius' if MajorRadius < MinorRadius or  
 'NegativeRadius' if MinorRadius < 0.0") gce_MakeElips2d;
		 gce_MakeElips2d (const gp_Ax22d & A,const Standard_Real MajorRadius,const Standard_Real MinorRadius);
		%feature("autodoc", "Args:
	S1(gp_Pnt2d)
	S2(gp_Pnt2d)
	Center(gp_Pnt2d)

Returns:
	None

Makes an Elips2d with its center and two points.  
         The sense of parametrization is given by S1, S2,  
         and Center.  
Depending on the constructor, the  implicit orientation of the ellipse is:  
-   the sense defined by A,  
-   the sense defined by points Center, S1 and S2,  
-   the trigonometric sense if Sense is not given or is true, or  
-   the opposite if Sense is false.  
It is possible to construct an ellipse where the major  
and minor radii are equal.  
Warning  
If an error occurs (that is, when IsDone returns  
false), the Status function returns:  
-   gce_InvertRadius if MajorRadius is less than MinorRadius,  
-   gce_NegativeRadius if MajorRadius or  
  MinorRadius is less than 0.0,  
-   gce_NullAxis if points S1, S2 and Center are collinear, or  
-   gce_InvertAxis if the major radius computed with  
  Center and S1 is less than the minor radius  
  computed with Center, S1 and S2.") gce_MakeElips2d;
		 gce_MakeElips2d (const gp_Pnt2d & S1,const gp_Pnt2d & S2,const gp_Pnt2d & Center);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Elips2d

Returns the constructed ellipse.  
Exceptions StdFail_NotDone if no ellipse is constructed.") Value;
		const gp_Elips2d & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Elips2d

No detailed docstring for this function.") Operator;
		const gp_Elips2d & Operator ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorgp_Elips2d;
		 operator gp_Elips2d ();
};


%feature("shadow") gce_MakeElips2d::~gce_MakeElips2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gce_MakeElips2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gce_MakeHypr;
class gce_MakeHypr : public gce_Root {
	public:
		%feature("autodoc", "Args:
	A2(gp_Ax2)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)

Returns:
	None

A2 is the local coordinate system of the hyperbola.  
 In the local coordinates system A2 the equation of the  
 hyperbola is :  
 X*X / MajorRadius*MajorRadius - Y*Y / MinorRadius*MinorRadius = 1.0  
 It is not forbidden to create an Hyperbola with MajorRadius =  
 MinorRadius.  
 For the hyperbola the MajorRadius can be lower than the  
 MinorRadius.  
 The status is 'NegativeRadius' if MajorRadius < 0.0 and  
 'InvertRadius' if MinorRadius > MajorRadius.") gce_MakeHypr;
		 gce_MakeHypr (const gp_Ax2 & A2,const Standard_Real MajorRadius,const Standard_Real MinorRadius);
		%feature("autodoc", "Args:
	S1(gp_Pnt)
	S2(gp_Pnt)
	Center(gp_Pnt)

Returns:
	None

Constructs a hyperbola  
  -   centered on the point Center, where:  
 -   the plane of the hyperbola is defined by Center, S1 and S2,  
  -   its major axis is defined by Center and S1,  
  -   its major radius is the distance between Center and S1, and  
-   its minor radius is the distance between S2 and the major axis.  
//!	Warning  
If an error occurs (that is, when IsDone returns  
false), the Status function returns:  
-   gce_NegativeRadius if MajorRadius is less than 0.0;  
-   gce_InvertRadius if:  
  -   the major radius (computed with Center, S1) is  
   less than the minor radius (computed with Center, S1 and S2), or  
  -   MajorRadius is less than MinorRadius; or  
-   gce_ColinearPoints if S1, S2 and Center are collinear.") gce_MakeHypr;
		 gce_MakeHypr (const gp_Pnt & S1,const gp_Pnt & S2,const gp_Pnt & Center);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Hypr

Returns the constructed hyperbola.  
Exceptions StdFail_NotDone if no hyperbola is constructed.") Value;
		const gp_Hypr & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Hypr

No detailed docstring for this function.") Operator;
		const gp_Hypr & Operator ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorgp_Hypr;
		 operator gp_Hypr ();
};


%feature("shadow") gce_MakeHypr::~gce_MakeHypr %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gce_MakeHypr {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gce_MakeHypr2d;
class gce_MakeHypr2d : public gce_Root {
	public:
		%feature("autodoc", "Args:
	S1(gp_Pnt2d)
	S2(gp_Pnt2d)
	Center(gp_Pnt2d)

Returns:
	None

Constructs a hyperbola  
  centered on the point Center, where:  
  -   the major axis of the hyperbola is defined by Center and point S1,  
  -   the major radius is the distance between Center and S1, and  
  -   the minor radius is the distance between point S2 and the major axis.") gce_MakeHypr2d;
		 gce_MakeHypr2d (const gp_Pnt2d & S1,const gp_Pnt2d & S2,const gp_Pnt2d & Center);
		%feature("autodoc", "Args:
	MajorAxis(gp_Ax2d)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)
	Sense(Standard_Boolean)

Returns:
	None

Constructs a hyperbola with major and minor radii MajorRadius and  
  MinorRadius, where:  
  -   the center of the hyperbola is the origin of the axis MajorAxis, and  
  -   the major axis is defined by MajorAxis if Sense  
is true, or the opposite axis to MajorAxis if Sense is false; or  
-   centered on the origin of the coordinate system  
  A, with major and minor radii MajorRadius and  
  MinorRadius, where its major axis is the 'X Axis'  
  of A (A is the local coordinate system of the hyperbola).") gce_MakeHypr2d;
		 gce_MakeHypr2d (const gp_Ax2d & MajorAxis,const Standard_Real MajorRadius,const Standard_Real MinorRadius,const Standard_Boolean Sense);
		%feature("autodoc", "Args:
	A(gp_Ax22d)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)

Returns:
	None

//!Creates a Hypr2d centered on the origin of the coordinate system  
 A, with major and minor radii MajorRadius and  
 MinorRadius, where its major axis is the 'X Axis'  
 of A (A is the local coordinate system of the hyperbola).") gce_MakeHypr2d;
		 gce_MakeHypr2d (const gp_Ax22d & A,const Standard_Real MajorRadius,const Standard_Real MinorRadius);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Hypr2d

Returns the constructed hyperbola.  
Exceptions StdFail_NotDone if no hyperbola is constructed.") Value;
		const gp_Hypr2d & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Hypr2d

No detailed docstring for this function.") Operator;
		const gp_Hypr2d & Operator ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorgp_Hypr2d;
		 operator gp_Hypr2d ();
};


%feature("shadow") gce_MakeHypr2d::~gce_MakeHypr2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gce_MakeHypr2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gce_MakeLin;
class gce_MakeLin : public gce_Root {
	public:
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	None

Creates a line located along the axis A1.") gce_MakeLin;
		 gce_MakeLin (const gp_Ax1 & A1);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	V(gp_Dir)

Returns:
	None

<P> is the location point (origin) of the line and  
 <V> is the direction of the line.") gce_MakeLin;
		 gce_MakeLin (const gp_Pnt & P,const gp_Dir & V);
		%feature("autodoc", "Args:
	Lin(gp_Lin)
	Point(gp_Pnt)

Returns:
	None

Make a Lin from gp <TheLin> parallel to another  
          Lin <Lin> and passing through a Pnt <Point>.") gce_MakeLin;
		 gce_MakeLin (const gp_Lin & Lin,const gp_Pnt & Point);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

Make a Lin from gp <TheLin> passing through 2  
          Pnt <P1>,<P2>.  
          It returns false if <p1> and <P2> are confused.") gce_MakeLin;
		 gce_MakeLin (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Lin

Returns the constructed line.  
Exceptions StdFail_NotDone is raised if no line is constructed.") Value;
		const gp_Lin & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Lin

No detailed docstring for this function.") Operator;
		const gp_Lin & Operator ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorgp_Lin;
		 operator gp_Lin ();
};


%feature("shadow") gce_MakeLin::~gce_MakeLin %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gce_MakeLin {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gce_MakeLin2d;
class gce_MakeLin2d : public gce_Root {
	public:
		%feature("autodoc", "Args:
	A(gp_Ax2d)

Returns:
	None

Creates a line located with A.") gce_MakeLin2d;
		 gce_MakeLin2d (const gp_Ax2d & A);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	V(gp_Dir2d)

Returns:
	None

<P> is the location point (origin) of the line and  
 <V> is the direction of the line.") gce_MakeLin2d;
		 gce_MakeLin2d (const gp_Pnt2d & P,const gp_Dir2d & V);
		%feature("autodoc", "Args:
	A(Standard_Real)
	B(Standard_Real)
	C(Standard_Real)

Returns:
	None

Creates the line from the equation A*X + B*Y + C = 0.0  
 the status is 'NullAxis'if Sqrt(A*A + B*B) <= Resolution from gp.") gce_MakeLin2d;
		 gce_MakeLin2d (const Standard_Real A,const Standard_Real B,const Standard_Real C);
		%feature("autodoc", "Args:
	Lin(gp_Lin2d)
	Dist(Standard_Real)

Returns:
	None

Make a Lin2d from gp <TheLin> parallel to another  
          Lin2d <Lin> at a distance <Dist>.  
          If Dist is greater than zero the result is on the  
          right of the Line <Lin>, else the result is on the  
          left of the Line <Lin>.") gce_MakeLin2d;
		 gce_MakeLin2d (const gp_Lin2d & Lin,const Standard_Real Dist);
		%feature("autodoc", "Args:
	Lin(gp_Lin2d)
	Point(gp_Pnt2d)

Returns:
	None

Make a Lin2d from gp <TheLin> parallel to another  
          Lin2d <Lin> and passing through a Pnt2d <Point>.") gce_MakeLin2d;
		 gce_MakeLin2d (const gp_Lin2d & Lin,const gp_Pnt2d & Point);
		%feature("autodoc", "Args:
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)

Returns:
	None

Make a Lin2d from gp <TheLin> passing through 2  
          Pnt2d <P1>,<P2>.  
          It returns false if <P1> and <P2> are confused.  
Warning  
If an error occurs (that is, when IsDone returns  
false), the Status function returns:  
-   gce_NullAxis if Sqrt(A*A + B*B) is less  
  than or equal to gp::Resolution(), or  
-   gce_ConfusedPoints if points P1 and P2 are coincident.") gce_MakeLin2d;
		 gce_MakeLin2d (const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Lin2d

Returns the constructed line.  
Exceptions StdFail_NotDone if no line is constructed.") Value;
		gp_Lin2d Value ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Lin2d

No detailed docstring for this function.") Operator;
		gp_Lin2d Operator ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorgp_Lin2d;
		 operator gp_Lin2d ();
};


%feature("shadow") gce_MakeLin2d::~gce_MakeLin2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gce_MakeLin2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gce_MakeParab;
class gce_MakeParab : public gce_Root {
	public:
		%feature("autodoc", "Args:
	A2(gp_Ax2)
	Focal(Standard_Real)

Returns:
	None

//!--- Purpose ;  
 Creates a parabola with its local coordinate system 'A2'  
 and it's focal length 'Focal'.  
 The XDirection of A2 defines the axis of symmetry of the  
 parabola. The YDirection of A2 is parallel to the directrix  
 of the parabola. The Location point of A2 is the vertex of  
 the parabola  
 The status is 'NullFocusLength' if Focal < 0.0") gce_MakeParab;
		 gce_MakeParab (const gp_Ax2 & A2,const Standard_Real Focal);
		%feature("autodoc", "Args:
	D(gp_Ax1)
	F(gp_Pnt)

Returns:
	None

D is the directrix of the parabola and F the focus point.  
 The symmetry axis (XAxis) of the parabola is normal to the  
 directrix and pass through the focus point F, but its  
 location point is the vertex of the parabola.  
 The YAxis of the parabola is parallel to D and its location  
 point is the vertex of the parabola. The normal to the plane  
 of the parabola is the cross product between the XAxis and the  
 YAxis.") gce_MakeParab;
		 gce_MakeParab (const gp_Ax1 & D,const gp_Pnt & F);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Parab

Returns the constructed parabola.  
Exceptions StdFail_NotDone if no parabola is constructed.") Value;
		const gp_Parab & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Parab

No detailed docstring for this function.") Operator;
		const gp_Parab & Operator ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorgp_Parab;
		 operator gp_Parab ();
};


%feature("shadow") gce_MakeParab::~gce_MakeParab %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gce_MakeParab {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gce_MakeParab2d;
class gce_MakeParab2d : public gce_Root {
	public:
		%feature("autodoc", "Args:
	MirrorAxis(gp_Ax2d)
	Focal(Standard_Real)
	Sense(Standard_Boolean)=Standard_True

Returns:
	None

Creates a parabola with its axis of symmetry ('MirrorAxis')  
 and its focal length.  
Warnings : It is possible to have Focal = 0.  
 The status is 'NullFocalLength' Raised if Focal < 0.0") gce_MakeParab2d;
		 gce_MakeParab2d (const gp_Ax2d & MirrorAxis,const Standard_Real Focal,const Standard_Boolean Sense = Standard_True);
		%feature("autodoc", "Args:
	A(gp_Ax22d)
	Focal(Standard_Real)

Returns:
	None

Creates a parabola with its local coordinate system <A>  
 and its focal length.  
Warnings : It is possible to have Focal = 0.  
 The status is 'NullFocalLength' Raised if Focal < 0.0") gce_MakeParab2d;
		 gce_MakeParab2d (const gp_Ax22d & A,const Standard_Real Focal);
		%feature("autodoc", "Args:
	D(gp_Ax2d)
	F(gp_Pnt2d)
	Sense(Standard_Boolean)=Standard_True

Returns:
	None

Creates a parabola with the directrix and the focus point.  
 The sense of parametrization is given by Sense.") gce_MakeParab2d;
		 gce_MakeParab2d (const gp_Ax2d & D,const gp_Pnt2d & F,const Standard_Boolean Sense = Standard_True);
		%feature("autodoc", "Args:
	D(gp_Ax22d)
	F(gp_Pnt2d)

Returns:
	None

Creates a parabola with the local coordinate system and  
 the focus point.  
 The sense of parametrization is given by Sense.") gce_MakeParab2d;
		 gce_MakeParab2d (const gp_Ax22d & D,const gp_Pnt2d & F);
		%feature("autodoc", "Args:
	S1(gp_Pnt2d)
	Center(gp_Pnt2d)
	Sense(Standard_Boolean)=Standard_True

Returns:
	None

Make an Parab2d with S1 as the Focal point and Center  
         as the apex of the parabola  
//!	Warning  
The MakeParab2d class does not prevent the  
construction of a parabola with a null focal distance.  
If an error occurs (that is, when IsDone returns  
false), the Status function returns:  
-   gce_NullFocusLength if Focal is less than 0.0, or  
-   gce_NullAxis if S1 and Center are coincident.") gce_MakeParab2d;
		 gce_MakeParab2d (const gp_Pnt2d & S1,const gp_Pnt2d & Center,const Standard_Boolean Sense = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Parab2d

Returns the constructed parabola.  
Exceptions StdFail_NotDone if no parabola is constructed.") Value;
		const gp_Parab2d & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Parab2d

No detailed docstring for this function.") Operator;
		const gp_Parab2d & Operator ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorgp_Parab2d;
		 operator gp_Parab2d ();
};


%feature("shadow") gce_MakeParab2d::~gce_MakeParab2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gce_MakeParab2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor gce_MakePln;
class gce_MakePln : public gce_Root {
	public:
		%feature("autodoc", "Args:
	A2(gp_Ax2)

Returns:
	None

The coordinate system of the plane is defined with the axis  
 placement A2.  
 The 'Direction' of A2 defines the normal to the plane.  
 The 'Location' of A2 defines the location (origin) of the plane.  
 The 'XDirection' and 'YDirection' of A2 define the 'XAxis' and  
 the 'YAxis' of the plane used to parametrize the plane.") gce_MakePln;
		 gce_MakePln (const gp_Ax2 & A2);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	V(gp_Dir)

Returns:
	None

Creates a plane with the  'Location' point <P>  
 and the normal direction <V>.") gce_MakePln;
		 gce_MakePln (const gp_Pnt & P,const gp_Dir & V);
		%feature("autodoc", "Args:
	A(Standard_Real)
	B(Standard_Real)
	C(Standard_Real)
	D(Standard_Real)

Returns:
	None

Creates a plane from its cartesian equation :  
 A * X + B * Y + C * Z + D = 0.0  
 the status is 'BadEquation' if Sqrt (A*A + B*B + C*C) <=  
 Resolution from gp.") gce_MakePln;
		 gce_MakePln (const Standard_Real A,const Standard_Real B,const Standard_Real C,const Standard_Real D);
		%feature("autodoc", "Args:
	Pln(gp_Pln)
	Point(gp_Pnt)

Returns:
	None

Make a Pln from gp <ThePln> parallel to another  
          Pln <Pln> and passing through a Pnt <Point>.") gce_MakePln;
		 gce_MakePln (const gp_Pln & Pln,const gp_Pnt & Point);
		%feature("autodoc", "Args:
	Pln(gp_Pln)
	Dist(Standard_Real)

Returns:
	None

Make a Pln from gp <ThePln> parallel to another  
          Pln <Pln> at the distance <Dist> which can be greater  
          or less than zero.  
          In the first case the result is at the distance  
          <Dist> to the plane <Pln> in the direction of the  
          normal to <Pln>.  
          Otherwize it is in the opposite direction.") gce_MakePln;
		 gce_MakePln (const gp_Pln & Pln,const Standard_Real Dist);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)
	P3(gp_Pnt)

Returns:
	None

Make a Pln from gp <ThePln> passing through 3  
          Pnt <P1>,<P2>,<P3>.  
          It returns false if <P1> <P2> <P3> are confused.") gce_MakePln;
		 gce_MakePln (const gp_Pnt & P1,const gp_Pnt & P2,const gp_Pnt & P3);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

Make a Pln from gp <ThePln> perpendicular to the line  
          passing through <P1>,<P2>.  
          The status is 'ConfusedPoints' if <P1> <P2> are confused.") gce_MakePln;
		 gce_MakePln (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("autodoc", "Args:
	Axis(gp_Ax1)

Returns:
	None

Make a pln  passing through the location of <Axis>and  
         normal to the Direction of <Axis>.  
Warning -  If an error occurs (that is, when IsDone returns  
false), the Status function returns:  
-   gce_BadEquation if Sqrt(A*A + B*B +  
  C*C) is less than or equal to gp::Resolution(),  
-   gce_ConfusedPoints if P1 and P2 are coincident, or  
-   gce_ColinearPoints if P1, P2 and P3 are collinear.") gce_MakePln;
		 gce_MakePln (const gp_Ax1 & Axis);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pln

Returns the constructed plane.  
Exceptions StdFail_NotDone if no plane is constructed.") Value;
		const gp_Pln & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pln

No detailed docstring for this function.") Operator;
		const gp_Pln & Operator ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorgp_Pln;
		 operator gp_Pln ();
};


%feature("shadow") gce_MakePln::~gce_MakePln %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend gce_MakePln {
	void _kill_pointed() {
		delete $self;
	}
};
