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
%module GProp

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

%include GProp_required_python_modules.i
%include GProp_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
enum GProp_EquaType {
	GProp_Plane = 0,
	GProp_Line = 1,
	GProp_Point = 2,
	GProp_Space = 3,
	GProp_None = 4,
};

enum GProp_ValueType {
	GProp_Mass = 0,
	GProp_CenterMassX = 1,
	GProp_CenterMassY = 2,
	GProp_CenterMassZ = 3,
	GProp_InertiaXX = 4,
	GProp_InertiaYY = 5,
	GProp_InertiaZZ = 6,
	GProp_InertiaXY = 7,
	GProp_InertiaXZ = 8,
	GProp_InertiaYZ = 9,
	GProp_Unknown = 10,
};

/* end public enums declaration */

%rename(gprop) GProp;
%nodefaultctor GProp;
class GProp {
	public:
		%feature("autodoc", "Args:
	G(gp_Pnt)
	Q(gp_Pnt)
	Mass(Standard_Real)
	Operator(gp_Mat)

Returns:
	static void

methods of package  Computes the matrix Operator, referred to as the  
'Huyghens Operator' of a geometric system at the  
point Q of the space, using the following data :  
- Mass, i.e. the mass of the system,  
- G, the center of mass of the system.  
  The 'Huyghens Operator' is used to compute  
Inertia/Q, the matrix of inertia of the system at  
the point Q using Huyghens' theorem :  
   Inertia/Q = Inertia/G + HOperator (Q, G, Mass)  
where Inertia/G is the matrix of inertia of the  
system relative to its center of mass as returned by  
the function MatrixOfInertia on any GProp_GProps object.") HOperator;
		static void HOperator (const gp_Pnt & G,const gp_Pnt & Q,const Standard_Real Mass,gp_Mat & Operator);
};


%feature("shadow") GProp::~GProp %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GProp {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GProp_GProps;
class GProp_GProps {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

The origin (0, 0, 0) of the absolute cartesian coordinate system  
 is used to compute the global properties.") GProp_GProps;
		 GProp_GProps ();
		%feature("autodoc", "Args:
	SystemLocation(gp_Pnt)

Returns:
	None

The point SystemLocation is used to compute the gobal properties  
 of the system. For more accuracy it is better to define this  
 point closed to the location of the system. For example it could  
 be a point around the centre of mass of the system.  
 This point is referred to as the reference point for  
this framework. For greater accuracy it is better for  
the reference point to be close to the location of the  
system. It can, for example, be a point near the  
center of mass of the system.  
At initialization, the framework is empty; i.e. it  
retains no dimensional information such as mass, or  
inertia. However, it is now able to bring together  
global properties of various other systems, whose  
global properties have already been computed  
using another framework. To do this, use the  
function Add to define the components of the  
system. Use it once per component of the system,  
and then use the interrogation functions available to  
access the computed values.") GProp_GProps;
		 GProp_GProps (const gp_Pnt & SystemLocation);
		%feature("autodoc", "Args:
	Item(GProp_GProps)
	Density(Standard_Real)=1.0

Returns:
	None

Either  
- initializes the global properties retained by this  
  framework from those retained by the framework Item, or  
- brings together the global properties still retained by  
  this framework with those retained by the framework Item.  
  The value Density, which is 1.0 by default, is used as  
the density of the system analysed by Item.  
Sometimes the density will have already been given at  
the time of construction of the framework Item. This  
may be the case for example, if Item is a  
GProp_PGProps framework built to compute the  
global properties of a set of points ; or another  
GProp_GProps object which already retains  
composite global properties. In these cases the real  
density was perhaps already taken into account at the  
time of construction of Item. Note that this is not  
checked: if the density of parts of the system is taken  
into account two or more times, results of the  
computation will be false.  
Notes :  
- The point relative to which the inertia of Item is  
  computed (i.e. the reference point of Item) may be  
  different from the reference point in this  
  framework. Huygens' theorem is applied  
  automatically to transfer inertia values to the  
 reference point in this framework.  
- The function Add is used once per component of  
  the system. After that, you use the interrogation  
  functions available to access values computed for the system.  
- The system whose global properties are already  
  brought together by this framework is referred to  
  as the current system. However, the current system  
  is not retained by this framework, which maintains  
  only its global properties.  
     Exceptions  
Standard_DomainError if Density is less than or  
equal to gp::Resolution().") Add;
		void Add (const GProp_GProps & Item,const Standard_Real Density = 1.0);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the mass of the current system.  
If no density is attached to the components of the  
current system the returned value corresponds to :  
- the total length of the edges of the current  
  system if this framework retains only linear  
  properties, as is the case for example, when  
  using only the LinearProperties function to  
  combine properties of lines from shapes, or  
- the total area of the faces of the current system if  
  this framework retains only surface properties,  
  as is the case for example, when using only the  
  SurfaceProperties function to combine  
  properties of surfaces from shapes, or  
- the total volume of the solids of the current  
  system if this framework retains only volume  
  properties, as is the case for example, when  
  using only the VolumeProperties function to  
  combine properties of volumes from solids.  
  Warning  
A length, an area, or a volume is computed in the  
current data unit system. The mass of a single  
object is obtained by multiplying its length, its area  
or its volume by the given density. You must be  
consistent with respect to the units used.") Mass;
		Standard_Real Mass ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the center of mass of the current system. If  
the gravitational field is uniform, it is the center of gravity.  
The coordinates returned for the center of mass are  
expressed in the absolute Cartesian coordinate system.") CentreOfMass;
		gp_Pnt CentreOfMass ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Mat

returns the matrix of inertia. It is a symmetrical matrix.  
 The coefficients of the matrix are the quadratic moments of  
 inertia.  
 
              | Ixx  Ixy  Ixz |  
  matrix =    | Ixy  Iyy  Iyz |  
              | Ixz  Iyz  Izz |  
 
 The moments of inertia are denoted by Ixx, Iyy, Izz.  
 The products of inertia are denoted by Ixy, Ixz, Iyz.  
 The matrix of inertia is returned in the central coordinate  
 system (G, Gx, Gy, Gz) where G is the centre of mass of the  
 system and Gx, Gy, Gz the directions parallel to the X(1,0,0)  
 Y(0,1,0) Z(0,0,1) directions of the absolute cartesian  
 coordinate system. It is possible to compute the matrix of  
 inertia at another location point using the Huyghens theorem  
 (you can use the method of package GProp : HOperator).") MatrixOfInertia;
		gp_Mat MatrixOfInertia ();
		%feature("autodoc", "Args:
	Ix(Standard_Real)
	Iy(Standard_Real)
	Iz(Standard_Real)

Returns:
	None

Returns Ix, Iy, Iz, the static moments of inertia of the  
current system; i.e. the moments of inertia about the  
three axes of the Cartesian coordinate system.") StaticMoments;
		void StaticMoments (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	A(gp_Ax1)

Returns:
	Standard_Real

computes the moment of inertia of the material system about the  
 axis A.") MomentOfInertia;
		Standard_Real MomentOfInertia (const gp_Ax1 & A);
		%feature("autodoc", "Args:
	None
Returns:
	GProp_PrincipalProps

Computes the principal properties of inertia of the current system.  
There is always a set of axes for which the products  
of inertia of a geometric system are equal to 0; i.e. the  
matrix of inertia of the system is diagonal. These axes  
are the principal axes of inertia. Their origin is  
coincident with the center of mass of the system. The  
associated moments are called the principal moments of inertia.  
This function computes the eigen values and the  
eigen vectors of the matrix of inertia of the system.  
Results are stored by using a presentation framework  
of principal properties of inertia  
(GProp_PrincipalProps object) which may be  
queried to access the value sought.") PrincipalProperties;
		GProp_PrincipalProps PrincipalProperties ();
		%feature("autodoc", "Args:
	A(gp_Ax1)

Returns:
	Standard_Real

Returns the radius of gyration of the current system about the axis A.") RadiusOfGyration;
		Standard_Real RadiusOfGyration (const gp_Ax1 & A);
};


%feature("shadow") GProp_GProps::~GProp_GProps %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GProp_GProps {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GProp_PEquation;
class GProp_PEquation {
	public:
		%feature("autodoc", "Args:
	Pnts(TColgp_Array1OfPnt)
	Tol(Standard_Real)

Returns:
	None

Constructs a framework to analyze the  
collection of points Pnts and computes:  
-   the mean point if the points in question are  
  considered to be coincident within the precision Tol, or  
-   the mean line if they are considered to be  
  collinear within the precision Tol, or  
-   the mean plane if they are considered to be  
  coplanar within the precision Tol, or  
-   the minimal box which contains all the points. Use :  
-   the functions IsPoint, IsLinear, IsPlanar  
  and IsSpace to find the result of the analysis, and  
-   the function Point, Line, Plane or Box to  
  access the computed result.") GProp_PEquation;
		 GProp_PEquation (const TColgp_Array1OfPnt & Pnts,const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if, according to the given  
tolerance, the points analyzed by this framework are  coplanar.  
Use the function  Plane  to access the computed result.") IsPlanar;
		Standard_Boolean IsPlanar ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if, according to the given  
tolerance, the points analyzed by this framework are  colinear.  
Use the function  Line  to access the computed result.") IsLinear;
		Standard_Boolean IsLinear ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if, according to the given  
tolerance, the points analyzed by this framework are  coincident.  
      Use the function  Point  to access the computed result.") IsPoint;
		Standard_Boolean IsPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if, according to the given  
tolerance value, the points analyzed by this  
framework are neither coincident, nor collinear, nor coplanar.  
Use the function Box to query the smallest box  
that includes the collection of points.") IsSpace;
		Standard_Boolean IsSpace ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pln

Returns the mean plane passing near all the  
points analyzed by this framework if, according  
to the given precision, the points are considered to be coplanar.  
Exceptions  
Standard_NoSuchObject if, according to the  
given precision value, the points analyzed by  
this framework are considered to be:  
-   coincident, or  
-   collinear, or  
-   not coplanar.") Plane;
		gp_Pln Plane ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Lin

Returns the mean line passing near all the  
points analyzed by this framework if, according  
to the given precision value, the points are considered to be collinear.  
Exceptions  
Standard_NoSuchObject if, according to the  
given precision, the points analyzed by this  
framework are considered to be:  
-   coincident, or  
-   not collinear.") Line;
		gp_Lin Line ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the mean point of all the points  
analyzed by this framework if, according to the  
given precision, the points are considered to be coincident.  
Exceptions  
Standard_NoSuchObject if, according to the  
given precision, the points analyzed by this  
framework are not considered to be coincident.") Point;
		gp_Pnt Point ();
		%feature("autodoc", "Args:
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)
	V3(gp_Vec)

Returns:
	None

Returns the definition of the smallest box which  
contains all the points analyzed by this  
framework if, according to the given precision  
value, the points are considered to be neither  
coincident, nor collinear and nor coplanar.  
This box is centered on the barycenter P of the  
collection of points. Its sides are parallel to the  
three vectors V1, V2 and V3, the length of  
which is the length of the box in the corresponding direction.  
Note: Vectors V1, V2 and V3 are parallel to  
the three axes of principal inertia of the system  
composed of the collection of points where each point is of equal mass.  
Exceptions  
Standard_NoSuchObject if, according to the given precision,  
the points analyzed by this framework are considered to be coincident, collinear or coplanar.") Box;
		void Box (gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
};


%feature("shadow") GProp_PEquation::~GProp_PEquation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GProp_PEquation {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GProp_PrincipalProps;
class GProp_PrincipalProps {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

creates an undefined PrincipalProps.") GProp_PrincipalProps;
		 GProp_PrincipalProps ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns true if the geometric system has an axis of symmetry.  
 For  comparing  moments  relative  tolerance  1.e-10  is  used.  
 Usually  it  is  enough  for  objects,  restricted  by  faces  with  
 analitycal  geometry.") HasSymmetryAxis;
		Standard_Boolean HasSymmetryAxis ();
		%feature("autodoc", "Args:
	aTol(Standard_Real)

Returns:
	Standard_Boolean

returns true if the geometric system has an axis of symmetry.  
 aTol  is  relative  tolerance for  cheking  equality  of  moments  
 If  aTol  ==  0,  relative  tolerance  is  ~  1.e-16  (Epsilon(I))") HasSymmetryAxis;
		Standard_Boolean HasSymmetryAxis (const Standard_Real aTol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns true if the geometric system has a point of symmetry.  
 For  comparing  moments  relative  tolerance  1.e-10  is  used.  
 Usually  it  is  enough  for  objects,  restricted  by  faces  with  
 analitycal  geometry.") HasSymmetryPoint;
		Standard_Boolean HasSymmetryPoint ();
		%feature("autodoc", "Args:
	aTol(Standard_Real)

Returns:
	Standard_Boolean

returns true if the geometric system has a point of symmetry.  
 aTol  is  relative  tolerance for  cheking  equality  of  moments  
 If  aTol  ==  0,  relative  tolerance  is  ~  1.e-16  (Epsilon(I))") HasSymmetryPoint;
		Standard_Boolean HasSymmetryPoint (const Standard_Real aTol);
		%feature("autodoc", "Args:
	Ixx(Standard_Real)
	Iyy(Standard_Real)
	Izz(Standard_Real)

Returns:
	None

Ixx, Iyy and Izz return the principal moments of inertia  
in the current system.  
Notes :  
- If the current system has an axis of symmetry, two  
  of the three values Ixx, Iyy and Izz are equal. They  
  indicate which eigen vectors define an infinity of  
  axes of principal inertia.  
- If the current system has a center of symmetry, Ixx,  
  Iyy and Izz are equal.") Moments;
		void Moments (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec

returns the first axis of inertia.  
 if the system has a point of symmetry there is an infinity of  
 solutions. It is not possible to defines the three axis of  
 inertia.") FirstAxisOfInertia;
		const gp_Vec & FirstAxisOfInertia ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec

returns the second axis of inertia.  
 if the system has a point of symmetry or an axis of symmetry the  
 second and the third axis of symmetry are undefined.") SecondAxisOfInertia;
		const gp_Vec & SecondAxisOfInertia ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec

returns the third axis of inertia.  
    This and the above functions return the first, second or third eigen vector of the  
matrix of inertia of the current system.  
The first, second and third principal axis of inertia  
pass through the center of mass of the current  
system. They are respectively parallel to these three eigen vectors.  
Note that:  
- If the current system has an axis of symmetry, any  
  axis is an axis of principal inertia if it passes  
  through the center of mass of the system, and runs  
  parallel to a linear combination of the two eigen  
  vectors of the matrix of inertia, corresponding to the  
 two eigen values which are equal. If the current  
 system has a center of symmetry, any axis passing  
 through the center of mass of the system is an axis  
 of principal inertia. Use the functions  
 HasSymmetryAxis and HasSymmetryPoint to  
 check these particular cases, where the returned  
 eigen vectors define an infinity of principal axis of inertia.  
- The Moments function can be used to know which  
  of the three eigen vectors corresponds to the two  
  eigen values which are equal.  
 if the system has a point of symmetry or an axis of symmetry the  
 second and the third axis of symmetry are undefined.") ThirdAxisOfInertia;
		const gp_Vec & ThirdAxisOfInertia ();
		%feature("autodoc", "Args:
	Rxx(Standard_Real)
	Ryy(Standard_Real)
	Rzz(Standard_Real)

Returns:
	None

Returns the principal radii of gyration  Rxx, Ryy  
and Rzz are the radii of gyration of the current  
system about its three principal axes of inertia.  
Note that:  
- If the current system has an axis of symmetry,  
  two of the three values Rxx, Ryy and Rzz are equal.  
- If the current system has a center of symmetry,  
  Rxx, Ryy and Rzz are equal.") RadiusOfGyration;
		void RadiusOfGyration (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") GProp_PrincipalProps::~GProp_PrincipalProps %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GProp_PrincipalProps {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GProp_CelGProps;
class GProp_CelGProps : public GProp_GProps {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") GProp_CelGProps;
		 GProp_CelGProps ();
		%feature("autodoc", "Args:
	C(gp_Circ)
	CLocation(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") GProp_CelGProps;
		 GProp_CelGProps (const gp_Circ & C,const gp_Pnt & CLocation);
		%feature("autodoc", "Args:
	C(gp_Circ)
	U1(Standard_Real)
	U2(Standard_Real)
	CLocation(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") GProp_CelGProps;
		 GProp_CelGProps (const gp_Circ & C,const Standard_Real U1,const Standard_Real U2,const gp_Pnt & CLocation);
		%feature("autodoc", "Args:
	C(gp_Lin)
	U1(Standard_Real)
	U2(Standard_Real)
	CLocation(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") GProp_CelGProps;
		 GProp_CelGProps (const gp_Lin & C,const Standard_Real U1,const Standard_Real U2,const gp_Pnt & CLocation);
		%feature("autodoc", "Args:
	CLocation(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") SetLocation;
		void SetLocation (const gp_Pnt & CLocation);
		%feature("autodoc", "Args:
	C(gp_Circ)
	U1(Standard_Real)
	U2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Circ & C,const Standard_Real U1,const Standard_Real U2);
		%feature("autodoc", "Args:
	C(gp_Lin)
	U1(Standard_Real)
	U2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Lin & C,const Standard_Real U1,const Standard_Real U2);
};


%feature("shadow") GProp_CelGProps::~GProp_CelGProps %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GProp_CelGProps {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GProp_PGProps;
class GProp_PGProps : public GProp_GProps {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Initializes a framework to compute global properties  
on a set of points.  
The point relative to which the inertia of the system is  
computed will be the origin (0, 0, 0) of the  
absolute Cartesian coordinate system.  
At initialization, the framework is empty, i.e. it retains  
no dimensional information such as mass and inertia.  
It is, however, now able to keep global properties of a  
set of points while new points are added using the  
AddPoint function.  
The set of points whose global properties are brought  
together by this framework will then be referred to as  
the current system. The current system is, however,  
not kept by this framework, which only keeps that  
system's global properties. Note that the current  
system may be more complex than a set of points.") GProp_PGProps;
		 GProp_PGProps ();
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

Brings together the global properties already  
retained by this framework with those induced by  
the point Pnt. Pnt may be the first point of the current system.  
A point mass is attached to the point Pnt, it is either  
equal to 1. or to Density.") AddPoint;
		void AddPoint (const gp_Pnt & P);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	Density(Standard_Real)

Returns:
	None

Adds a new point P with its density in the system of points  
Exceptions  
Standard_DomainError if the mass value Density  
is less than gp::Resolution().") AddPoint;
		void AddPoint (const gp_Pnt & P,const Standard_Real Density);
		%feature("autodoc", "Args:
	Pnts(TColgp_Array1OfPnt)

Returns:
	None

computes the global properties of the system of points Pnts.  
 The density of the points are defaulted to all being 1") GProp_PGProps;
		 GProp_PGProps (const TColgp_Array1OfPnt & Pnts);
		%feature("autodoc", "Args:
	Pnts(TColgp_Array2OfPnt)

Returns:
	None

computes the global properties of the system of points Pnts.  
 The density of the points are defaulted to all being 1") GProp_PGProps;
		 GProp_PGProps (const TColgp_Array2OfPnt & Pnts);
		%feature("autodoc", "Args:
	Pnts(TColgp_Array1OfPnt)
	Density(TColStd_Array1OfReal)

Returns:
	None

computes the global properties of the system of points Pnts.  
 A density is associated with each point.  
 raises if a density is lower or equal to Resolution from package  
 gp.  
 raises if the length of Pnts and the length of Density  
 is not the same.") GProp_PGProps;
		 GProp_PGProps (const TColgp_Array1OfPnt & Pnts,const TColStd_Array1OfReal & Density);
		%feature("autodoc", "Args:
	Pnts(TColgp_Array2OfPnt)
	Density(TColStd_Array2OfReal)

Returns:
	None

computes the global properties of the system of points Pnts.  
 A density is associated with each point.  
 Raised if a density is lower or equal to Resolution from package  
 gp.  
 Raised if the length of Pnts and the length of Density  
 is not the same.") GProp_PGProps;
		 GProp_PGProps (const TColgp_Array2OfPnt & Pnts,const TColStd_Array2OfReal & Density);
		%feature("autodoc", "Args:
	Pnts(TColgp_Array1OfPnt)

Returns:
	static gp_Pnt

Computes the barycentre of a set of points. The density of the  
 points is defaulted to 1.") Barycentre;
		static gp_Pnt Barycentre (const TColgp_Array1OfPnt & Pnts);
		%feature("autodoc", "Args:
	Pnts(TColgp_Array2OfPnt)

Returns:
	static gp_Pnt

Computes the barycentre of a set of points. The density of the  
 points is defaulted to 1.") Barycentre;
		static gp_Pnt Barycentre (const TColgp_Array2OfPnt & Pnts);
		%feature("autodoc", "Args:
	Pnts(TColgp_Array1OfPnt)
	Density(TColStd_Array1OfReal)
	Mass(Standard_Real)
	G(gp_Pnt)

Returns:
	static void

Computes the barycentre of a set of points. A density is associated  
 with each point.  
 raises if a density is lower or equal to Resolution from package  
 gp.  
 Raised if the length of Pnts and the length of Density  
 is not the same.") Barycentre;
		static void Barycentre (const TColgp_Array1OfPnt & Pnts,const TColStd_Array1OfReal & Density,Standard_Real &OutValue,gp_Pnt & G);
		%feature("autodoc", "Args:
	Pnts(TColgp_Array2OfPnt)
	Density(TColStd_Array2OfReal)
	Mass(Standard_Real)
	G(gp_Pnt)

Returns:
	static void

Computes the barycentre of a set of points. A density is associated  
 with each point.  
 Raised if a density is lower or equal to Resolution from package  
 gp.  
 Raised if the length of Pnts and the length of Density  
 is not the same.") Barycentre;
		static void Barycentre (const TColgp_Array2OfPnt & Pnts,const TColStd_Array2OfReal & Density,Standard_Real &OutValue,gp_Pnt & G);
};


%feature("shadow") GProp_PGProps::~GProp_PGProps %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GProp_PGProps {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GProp_SelGProps;
class GProp_SelGProps : public GProp_GProps {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") GProp_SelGProps;
		 GProp_SelGProps ();
		%feature("autodoc", "Args:
	S(gp_Cylinder)
	Alpha1(Standard_Real)
	Alpha2(Standard_Real)
	Z1(Standard_Real)
	Z2(Standard_Real)
	SLocation(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") GProp_SelGProps;
		 GProp_SelGProps (const gp_Cylinder & S,const Standard_Real Alpha1,const Standard_Real Alpha2,const Standard_Real Z1,const Standard_Real Z2,const gp_Pnt & SLocation);
		%feature("autodoc", "Args:
	S(gp_Cone)
	Alpha1(Standard_Real)
	Alpha2(Standard_Real)
	Z1(Standard_Real)
	Z2(Standard_Real)
	SLocation(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") GProp_SelGProps;
		 GProp_SelGProps (const gp_Cone & S,const Standard_Real Alpha1,const Standard_Real Alpha2,const Standard_Real Z1,const Standard_Real Z2,const gp_Pnt & SLocation);
		%feature("autodoc", "Args:
	S(gp_Sphere)
	Teta1(Standard_Real)
	Teta2(Standard_Real)
	Alpha1(Standard_Real)
	Alpha2(Standard_Real)
	SLocation(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") GProp_SelGProps;
		 GProp_SelGProps (const gp_Sphere & S,const Standard_Real Teta1,const Standard_Real Teta2,const Standard_Real Alpha1,const Standard_Real Alpha2,const gp_Pnt & SLocation);
		%feature("autodoc", "Args:
	S(gp_Torus)
	Teta1(Standard_Real)
	Teta2(Standard_Real)
	Alpha1(Standard_Real)
	Alpha2(Standard_Real)
	SLocation(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") GProp_SelGProps;
		 GProp_SelGProps (const gp_Torus & S,const Standard_Real Teta1,const Standard_Real Teta2,const Standard_Real Alpha1,const Standard_Real Alpha2,const gp_Pnt & SLocation);
		%feature("autodoc", "Args:
	SLocation(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") SetLocation;
		void SetLocation (const gp_Pnt & SLocation);
		%feature("autodoc", "Args:
	S(gp_Cylinder)
	Alpha1(Standard_Real)
	Alpha2(Standard_Real)
	Z1(Standard_Real)
	Z2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Cylinder & S,const Standard_Real Alpha1,const Standard_Real Alpha2,const Standard_Real Z1,const Standard_Real Z2);
		%feature("autodoc", "Args:
	S(gp_Cone)
	Alpha1(Standard_Real)
	Alpha2(Standard_Real)
	Z1(Standard_Real)
	Z2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Cone & S,const Standard_Real Alpha1,const Standard_Real Alpha2,const Standard_Real Z1,const Standard_Real Z2);
		%feature("autodoc", "Args:
	S(gp_Sphere)
	Teta1(Standard_Real)
	Teta2(Standard_Real)
	Alpha1(Standard_Real)
	Alpha2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Sphere & S,const Standard_Real Teta1,const Standard_Real Teta2,const Standard_Real Alpha1,const Standard_Real Alpha2);
		%feature("autodoc", "Args:
	S(gp_Torus)
	Teta1(Standard_Real)
	Teta2(Standard_Real)
	Alpha1(Standard_Real)
	Alpha2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Torus & S,const Standard_Real Teta1,const Standard_Real Teta2,const Standard_Real Alpha1,const Standard_Real Alpha2);
};


%feature("shadow") GProp_SelGProps::~GProp_SelGProps %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GProp_SelGProps {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GProp_VelGProps;
class GProp_VelGProps : public GProp_GProps {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") GProp_VelGProps;
		 GProp_VelGProps ();
		%feature("autodoc", "Args:
	S(gp_Cylinder)
	Alpha1(Standard_Real)
	Alpha2(Standard_Real)
	Z1(Standard_Real)
	Z2(Standard_Real)
	VLocation(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") GProp_VelGProps;
		 GProp_VelGProps (const gp_Cylinder & S,const Standard_Real Alpha1,const Standard_Real Alpha2,const Standard_Real Z1,const Standard_Real Z2,const gp_Pnt & VLocation);
		%feature("autodoc", "Args:
	S(gp_Cone)
	Alpha1(Standard_Real)
	Alpha2(Standard_Real)
	Z1(Standard_Real)
	Z2(Standard_Real)
	VLocation(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") GProp_VelGProps;
		 GProp_VelGProps (const gp_Cone & S,const Standard_Real Alpha1,const Standard_Real Alpha2,const Standard_Real Z1,const Standard_Real Z2,const gp_Pnt & VLocation);
		%feature("autodoc", "Args:
	S(gp_Sphere)
	Teta1(Standard_Real)
	Teta2(Standard_Real)
	Alpha1(Standard_Real)
	Alpha2(Standard_Real)
	VLocation(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") GProp_VelGProps;
		 GProp_VelGProps (const gp_Sphere & S,const Standard_Real Teta1,const Standard_Real Teta2,const Standard_Real Alpha1,const Standard_Real Alpha2,const gp_Pnt & VLocation);
		%feature("autodoc", "Args:
	S(gp_Torus)
	Teta1(Standard_Real)
	Teta2(Standard_Real)
	Alpha1(Standard_Real)
	Alpha2(Standard_Real)
	VLocation(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") GProp_VelGProps;
		 GProp_VelGProps (const gp_Torus & S,const Standard_Real Teta1,const Standard_Real Teta2,const Standard_Real Alpha1,const Standard_Real Alpha2,const gp_Pnt & VLocation);
		%feature("autodoc", "Args:
	VLocation(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") SetLocation;
		void SetLocation (const gp_Pnt & VLocation);
		%feature("autodoc", "Args:
	S(gp_Cylinder)
	Alpha1(Standard_Real)
	Alpha2(Standard_Real)
	Z1(Standard_Real)
	Z2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Cylinder & S,const Standard_Real Alpha1,const Standard_Real Alpha2,const Standard_Real Z1,const Standard_Real Z2);
		%feature("autodoc", "Args:
	S(gp_Cone)
	Alpha1(Standard_Real)
	Alpha2(Standard_Real)
	Z1(Standard_Real)
	Z2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Cone & S,const Standard_Real Alpha1,const Standard_Real Alpha2,const Standard_Real Z1,const Standard_Real Z2);
		%feature("autodoc", "Args:
	S(gp_Sphere)
	Teta1(Standard_Real)
	Teta2(Standard_Real)
	Alpha1(Standard_Real)
	Alpha2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Sphere & S,const Standard_Real Teta1,const Standard_Real Teta2,const Standard_Real Alpha1,const Standard_Real Alpha2);
		%feature("autodoc", "Args:
	S(gp_Torus)
	Teta1(Standard_Real)
	Teta2(Standard_Real)
	Alpha1(Standard_Real)
	Alpha2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Torus & S,const Standard_Real Teta1,const Standard_Real Teta2,const Standard_Real Alpha1,const Standard_Real Alpha2);
};


%feature("shadow") GProp_VelGProps::~GProp_VelGProps %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GProp_VelGProps {
	void _kill_pointed() {
		delete $self;
	}
};
