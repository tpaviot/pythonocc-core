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
%module (package="OCC") BRepPrimAPI

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

%include BRepPrimAPI_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor BRepPrimAPI_MakeBox;
class BRepPrimAPI_MakeBox : public BRepBuilderAPI_MakeShape {
	public:
		%feature("autodoc", "Args:
	dx(Standard_Real)
	dy(Standard_Real)
	dz(Standard_Real)

Returns:
	None

Make a box with a corner at 0,0,0 and the other dx,dy,dz") BRepPrimAPI_MakeBox;
		 BRepPrimAPI_MakeBox (const Standard_Real dx,const Standard_Real dy,const Standard_Real dz);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	dx(Standard_Real)
	dy(Standard_Real)
	dz(Standard_Real)

Returns:
	None

Make a box with a corner at P and size dx, dy, dz.") BRepPrimAPI_MakeBox;
		 BRepPrimAPI_MakeBox (const gp_Pnt & P,const Standard_Real dx,const Standard_Real dy,const Standard_Real dz);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

Make a box with corners P1,P2.") BRepPrimAPI_MakeBox;
		 BRepPrimAPI_MakeBox (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("autodoc", "Args:
	Axes(gp_Ax2)
	dx(Standard_Real)
	dy(Standard_Real)
	dz(Standard_Real)

Returns:
	None

Ax2 is the left corner and the axis.  Constructs a box such that its sides are parallel to the axes of  
-   the global coordinate system, or  
-   the local coordinate system Axis. and  
-   with a corner at (0, 0, 0) and of size (dx, dy, dz), or  
-   with a corner at point P and of size (dx, dy, dz), or  
-   with corners at points P1 and P2.  
Exceptions  
Standard_DomainError if: dx, dy, dz are less than or equal to  
  Precision::Confusion(), or  
-   the vector joining the points P1 and P2 has a  
  component projected onto the global coordinate  
  system less than or equal to Precision::Confusion().  
  In these cases, the box would be flat.") BRepPrimAPI_MakeBox;
		 BRepPrimAPI_MakeBox (const gp_Ax2 & Axes,const Standard_Real dx,const Standard_Real dy,const Standard_Real dz);
		%feature("autodoc", "Args:
	None
Returns:
	BRepPrim_Wedge

Returns the internal algorithm.") Wedge;
		BRepPrim_Wedge & Wedge ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Stores the solid in myShape.") Build;
		virtual void Build ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shell

Returns the constructed box as a shell.") Shell;
		const TopoDS_Shell & Shell ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorTopoDS_Shell;
		 operator TopoDS_Shell ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Solid

Returns the constructed box as a solid.") Solid;
		const TopoDS_Solid & Solid ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorTopoDS_Solid;
		 operator TopoDS_Solid ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

Returns ZMin face") BottomFace;
		const TopoDS_Face & BottomFace ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

Returns XMin face") BackFace;
		const TopoDS_Face & BackFace ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

Returns XMax face") FrontFace;
		const TopoDS_Face & FrontFace ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

Returns YMin face") LeftFace;
		const TopoDS_Face & LeftFace ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

Returns YMax face") RightFace;
		const TopoDS_Face & RightFace ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

Returns ZMax face") TopFace;
		const TopoDS_Face & TopFace ();
};


%feature("shadow") BRepPrimAPI_MakeBox::~BRepPrimAPI_MakeBox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepPrimAPI_MakeBox {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepPrimAPI_MakeHalfSpace;
class BRepPrimAPI_MakeHalfSpace : public BRepBuilderAPI_MakeShape {
	public:
		%feature("autodoc", "Args:
	Face(TopoDS_Face)
	RefPnt(gp_Pnt)

Returns:
	None

Make a HalfSpace defined with a Face and a Point.") BRepPrimAPI_MakeHalfSpace;
		 BRepPrimAPI_MakeHalfSpace (const TopoDS_Face & Face,const gp_Pnt & RefPnt);
		%feature("autodoc", "Args:
	Shell(TopoDS_Shell)
	RefPnt(gp_Pnt)

Returns:
	None

Make a HalfSpace defined with a Shell and a Point.") BRepPrimAPI_MakeHalfSpace;
		 BRepPrimAPI_MakeHalfSpace (const TopoDS_Shell & Shell,const gp_Pnt & RefPnt);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Solid

Returns the constructed half-space as a solid.") Solid;
		const TopoDS_Solid & Solid ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorTopoDS_Solid;
		 operator TopoDS_Solid ();
};


%feature("shadow") BRepPrimAPI_MakeHalfSpace::~BRepPrimAPI_MakeHalfSpace %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepPrimAPI_MakeHalfSpace {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepPrimAPI_MakeOneAxis;
class BRepPrimAPI_MakeOneAxis : public BRepBuilderAPI_MakeShape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Address

The inherited commands should provide the algorithm.  
         Returned as a pointer.") OneAxis;
		virtual Standard_Address OneAxis ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Stores the solid in myShape.") Build;
		virtual void Build ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

Returns the lateral face of the rotational primitive.") Face;
		const TopoDS_Face & Face ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorTopoDS_Face;
		 operator TopoDS_Face ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shell

Returns the constructed rotational primitive as a shell.") Shell;
		const TopoDS_Shell & Shell ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorTopoDS_Shell;
		 operator TopoDS_Shell ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Solid

Returns the constructed rotational primitive as a solid.") Solid;
		const TopoDS_Solid & Solid ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorTopoDS_Solid;
		 operator TopoDS_Solid ();
};


%feature("shadow") BRepPrimAPI_MakeOneAxis::~BRepPrimAPI_MakeOneAxis %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepPrimAPI_MakeOneAxis {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepPrimAPI_MakeSweep;
class BRepPrimAPI_MakeSweep : public BRepBuilderAPI_MakeShape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	virtual TopoDS_Shape

Returns the  TopoDS  Shape of the bottom of the sweep.") FirstShape;
		virtual TopoDS_Shape FirstShape ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual TopoDS_Shape

Returns the TopoDS Shape of the top of the sweep.") LastShape;
		virtual TopoDS_Shape LastShape ();
};


%feature("shadow") BRepPrimAPI_MakeSweep::~BRepPrimAPI_MakeSweep %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepPrimAPI_MakeSweep {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepPrimAPI_MakeWedge;
class BRepPrimAPI_MakeWedge : public BRepBuilderAPI_MakeShape {
	public:
		%feature("autodoc", "Args:
	dx(Standard_Real)
	dy(Standard_Real)
	dz(Standard_Real)
	ltx(Standard_Real)

Returns:
	None

Make a STEP right angular wedge. (ltx >= 0)") BRepPrimAPI_MakeWedge;
		 BRepPrimAPI_MakeWedge (const Standard_Real dx,const Standard_Real dy,const Standard_Real dz,const Standard_Real ltx);
		%feature("autodoc", "Args:
	Axes(gp_Ax2)
	dx(Standard_Real)
	dy(Standard_Real)
	dz(Standard_Real)
	ltx(Standard_Real)

Returns:
	None

Make a STEP right angular wedge. (ltx >= 0)") BRepPrimAPI_MakeWedge;
		 BRepPrimAPI_MakeWedge (const gp_Ax2 & Axes,const Standard_Real dx,const Standard_Real dy,const Standard_Real dz,const Standard_Real ltx);
		%feature("autodoc", "Args:
	dx(Standard_Real)
	dy(Standard_Real)
	dz(Standard_Real)
	xmin(Standard_Real)
	zmin(Standard_Real)
	xmax(Standard_Real)
	zmax(Standard_Real)

Returns:
	None

Make a wedge. The face at dy is xmin,zmin xmax,zmax") BRepPrimAPI_MakeWedge;
		 BRepPrimAPI_MakeWedge (const Standard_Real dx,const Standard_Real dy,const Standard_Real dz,const Standard_Real xmin,const Standard_Real zmin,const Standard_Real xmax,const Standard_Real zmax);
		%feature("autodoc", "Args:
	Axes(gp_Ax2)
	dx(Standard_Real)
	dy(Standard_Real)
	dz(Standard_Real)
	xmin(Standard_Real)
	zmin(Standard_Real)
	xmax(Standard_Real)
	zmax(Standard_Real)

Returns:
	None

Make a wedge. The face at dy is xmin,zmin xmax,zmax") BRepPrimAPI_MakeWedge;
		 BRepPrimAPI_MakeWedge (const gp_Ax2 & Axes,const Standard_Real dx,const Standard_Real dy,const Standard_Real dz,const Standard_Real xmin,const Standard_Real zmin,const Standard_Real xmax,const Standard_Real zmax);
		%feature("autodoc", "Args:
	None
Returns:
	BRepPrim_Wedge

Returns the internal algorithm.") Wedge;
		BRepPrim_Wedge & Wedge ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Stores the solid in myShape.") Build;
		virtual void Build ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shell

Returns the constructed box in the form of a shell.") Shell;
		const TopoDS_Shell & Shell ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorTopoDS_Shell;
		 operator TopoDS_Shell ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Solid

Returns the constructed box in the form of a solid.") Solid;
		const TopoDS_Solid & Solid ();
		%feature("autodoc", "Args:
	None
Returns:
	

No detailed docstring for this function.") operatorTopoDS_Solid;
		 operator TopoDS_Solid ();
};


%feature("shadow") BRepPrimAPI_MakeWedge::~BRepPrimAPI_MakeWedge %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepPrimAPI_MakeWedge {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepPrimAPI_MakeCone;
class BRepPrimAPI_MakeCone : public BRepPrimAPI_MakeOneAxis {
	public:
		%feature("autodoc", "Args:
	R1(Standard_Real)
	R2(Standard_Real)
	H(Standard_Real)

Returns:
	None

Make a cone of height H radius R1 in the plane z =  
         0, R2 in the plane Z = H. R1 and R2 may be null.") BRepPrimAPI_MakeCone;
		 BRepPrimAPI_MakeCone (const Standard_Real R1,const Standard_Real R2,const Standard_Real H);
		%feature("autodoc", "Args:
	R1(Standard_Real)
	R2(Standard_Real)
	H(Standard_Real)
	angle(Standard_Real)

Returns:
	None

Make a cone of height H radius R1 in the plane z =  
         0, R2 in the plane Z = H. R1 and R2 may be null.  
         Take a section of <angle>") BRepPrimAPI_MakeCone;
		 BRepPrimAPI_MakeCone (const Standard_Real R1,const Standard_Real R2,const Standard_Real H,const Standard_Real angle);
		%feature("autodoc", "Args:
	Axes(gp_Ax2)
	R1(Standard_Real)
	R2(Standard_Real)
	H(Standard_Real)

Returns:
	None

Make a cone of height H radius R1 in the plane z =  
         0, R2 in the plane Z = H. R1 and R2 may be null.") BRepPrimAPI_MakeCone;
		 BRepPrimAPI_MakeCone (const gp_Ax2 & Axes,const Standard_Real R1,const Standard_Real R2,const Standard_Real H);
		%feature("autodoc", "Args:
	Axes(gp_Ax2)
	R1(Standard_Real)
	R2(Standard_Real)
	H(Standard_Real)
	angle(Standard_Real)

Returns:
	None

Make a cone of height H radius R1 in the plane z =  
         0, R2 in the plane Z = H. R1 and R2 may be null.  
         Take a section of <angle>  Constructs a cone, or a portion of a cone, of height H,  
and radius R1 in the plane z = 0 and R2 in the plane  
z = H. The result is a sharp cone if R1 or R2 is equal to 0.  
The cone is constructed about the 'Z Axis' of either:  
-   the global coordinate system, or  
-   the local coordinate system Axes.  
It is limited in these coordinate systems as follows:  
-   in the v parametric direction (the Z coordinate), by  
  the two parameter values 0 and H,  
-   and in the u parametric direction (defined by the  
  angle of rotation around the Z axis), in the case of a  
  portion of a cone, by the two parameter values 0 and  
  angle. Angle is given in radians.  
The resulting shape is composed of:  
-   a lateral conical face  
-   two planar faces in the planes z = 0 and z = H,  
  or only one planar face in one of these two planes if a  
  radius value is null (in the case of a complete cone,  
  these faces are circles), and  
-   and in the case of a portion of a cone, two planar  
  faces to close the shape. (either two parallelograms or  
  two triangles, in the planes u = 0 and u = angle).  
Exceptions  
Standard_DomainError if:  
-   H is less than or equal to Precision::Confusion(), or  
-   the half-angle at the apex of the cone, defined by  
  R1, R2 and H, is less than Precision::Confusion()/H, or greater than  
  (Pi/2)-Precision::Confusion()/H.f") BRepPrimAPI_MakeCone;
		 BRepPrimAPI_MakeCone (const gp_Ax2 & Axes,const Standard_Real R1,const Standard_Real R2,const Standard_Real H,const Standard_Real angle);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Address

Missing detailed docstring.") OneAxis;
		Standard_Address OneAxis ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepPrim_Cone

Missing detailed docstring.") Cone;
		BRepPrim_Cone & Cone ();
};


%feature("shadow") BRepPrimAPI_MakeCone::~BRepPrimAPI_MakeCone %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepPrimAPI_MakeCone {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepPrimAPI_MakeCylinder;
class BRepPrimAPI_MakeCylinder : public BRepPrimAPI_MakeOneAxis {
	public:
		%feature("autodoc", "Args:
	R(Standard_Real)
	H(Standard_Real)

Returns:
	None

Make a cylinder of radius R and length H.") BRepPrimAPI_MakeCylinder;
		 BRepPrimAPI_MakeCylinder (const Standard_Real R,const Standard_Real H);
		%feature("autodoc", "Args:
	R(Standard_Real)
	H(Standard_Real)
	Angle(Standard_Real)

Returns:
	None

Make a cylinder   of  radius R  and  length H with  
         angle  H.") BRepPrimAPI_MakeCylinder;
		 BRepPrimAPI_MakeCylinder (const Standard_Real R,const Standard_Real H,const Standard_Real Angle);
		%feature("autodoc", "Args:
	Axes(gp_Ax2)
	R(Standard_Real)
	H(Standard_Real)

Returns:
	None

Make a cylinder of radius R and length H.") BRepPrimAPI_MakeCylinder;
		 BRepPrimAPI_MakeCylinder (const gp_Ax2 & Axes,const Standard_Real R,const Standard_Real H);
		%feature("autodoc", "Args:
	Axes(gp_Ax2)
	R(Standard_Real)
	H(Standard_Real)
	Angle(Standard_Real)

Returns:
	None

Make a cylinder   of  radius R  and  length H with  
         angle  H.  Constructs  
-   a cylinder of radius R and height H, or  
-   a portion of cylinder of radius R and height H, and of  
  the angle Angle defining the missing portion of the cylinder.  
The cylinder is constructed about the 'Z Axis' of either:  
-   the global coordinate system, or  
-   the local coordinate system Axes.  
It is limited in this coordinate system as follows:  
-   in the v parametric direction (the Z axis), by the two  
  parameter values 0 and H,  
-   and in the u parametric direction (the rotation angle  
  around the Z Axis), in the case of a portion of a  
  cylinder, by the two parameter values 0 and Angle.  
  Angle is given in radians.  
The resulting shape is composed of:  
-   a lateral cylindrical face,  
-   two planar faces in the planes z = 0 and z = H  
  (in the case of a complete cylinder, these faces are circles), and  
-   in case of a portion of a cylinder, two additional  
  planar faces to close the shape.(two rectangles in the  
  planes u = 0 and u = Angle).  
Exceptions Standard_DomainError if:  
-   R is less than or equal to Precision::Confusion(), or  
-   H is less than or equal to Precision::Confusion().") BRepPrimAPI_MakeCylinder;
		 BRepPrimAPI_MakeCylinder (const gp_Ax2 & Axes,const Standard_Real R,const Standard_Real H,const Standard_Real Angle);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Address

Missing detailed docstring.") OneAxis;
		Standard_Address OneAxis ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepPrim_Cylinder

Missing detailed docstring.") Cylinder;
		BRepPrim_Cylinder & Cylinder ();
};


%feature("shadow") BRepPrimAPI_MakeCylinder::~BRepPrimAPI_MakeCylinder %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepPrimAPI_MakeCylinder {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepPrimAPI_MakePrism;
class BRepPrimAPI_MakePrism : public BRepPrimAPI_MakeSweep {
	public:
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	V(gp_Vec)
	Copy(Standard_Boolean)=Standard_False
	Canonize(Standard_Boolean)=Standard_True

Returns:
	None

Builds the prism of base S and vector V. If C is true,  
         S is copied. If Canonize is true then generated surfaces  
         are attempted to be canonized in simple types") BRepPrimAPI_MakePrism;
		 BRepPrimAPI_MakePrism (const TopoDS_Shape & S,const gp_Vec & V,const Standard_Boolean Copy = Standard_False,const Standard_Boolean Canonize = Standard_True);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	D(gp_Dir)
	Inf(Standard_Boolean)=Standard_True
	Copy(Standard_Boolean)=Standard_False
	Canonize(Standard_Boolean)=Standard_True

Returns:
	None

Builds a semi-infinite or an infinite prism of base S.  
         If Inf is true the prism  is infinite, if Inf is false  
         the prism is semi-infinite (in the direction D).  If C  
         is true S is copied (for semi-infinite prisms).  
         If Canonize is true then generated surfaces  
         are attempted to be canonized in simple types") BRepPrimAPI_MakePrism;
		 BRepPrimAPI_MakePrism (const TopoDS_Shape & S,const gp_Dir & D,const Standard_Boolean Inf = Standard_True,const Standard_Boolean Copy = Standard_False,const Standard_Boolean Canonize = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	BRepSweep_Prism

Returns the internal sweeping algorithm.") Prism;
		const BRepSweep_Prism & Prism ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Builds the resulting shape (redefined from MakeShape).") Build;
		virtual void Build ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns the  TopoDS  Shape of the bottom of the prism.") FirstShape;
		TopoDS_Shape FirstShape ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns the TopoDS Shape of the top of the prism.  
In the case of a finite prism, FirstShape returns the  
basis of the prism, in other words, S if Copy is false;  
otherwise, the copy of S belonging to the prism.  
LastShape returns the copy of S translated by V at the  
time of construction.") LastShape;
		TopoDS_Shape LastShape ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	virtual  TopTools_ListOfShape

Returns ListOfShape from TopTools.") Generated;
		virtual const TopTools_ListOfShape & Generated (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	theShape(TopoDS_Shape)

Returns:
	TopoDS_Shape

Returns the TopoDS Shape of the bottom  of the  prism.  
         generated  with  theShape (subShape of the  generating shape).") FirstShape;
		TopoDS_Shape FirstShape (const TopoDS_Shape & theShape);
		%feature("autodoc", "Args:
	theShape(TopoDS_Shape)

Returns:
	TopoDS_Shape

Returns the  TopoDS  Shape of the top  of  the  prism.  
         generated  with  theShape (subShape of the  generating shape).") LastShape;
		TopoDS_Shape LastShape (const TopoDS_Shape & theShape);
};


%feature("shadow") BRepPrimAPI_MakePrism::~BRepPrimAPI_MakePrism %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepPrimAPI_MakePrism {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepPrimAPI_MakeRevol;
class BRepPrimAPI_MakeRevol : public BRepPrimAPI_MakeSweep {
	public:
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	A(gp_Ax1)
	D(Standard_Real)
	Copy(Standard_Boolean)=Standard_False

Returns:
	None

Builds the Revol of base S, axis  A and angle  D. If C  
         is true, S is copied.") BRepPrimAPI_MakeRevol;
		 BRepPrimAPI_MakeRevol (const TopoDS_Shape & S,const gp_Ax1 & A,const Standard_Real D,const Standard_Boolean Copy = Standard_False);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	A(gp_Ax1)
	Copy(Standard_Boolean)=Standard_False

Returns:
	None

Builds the Revol of base S, axis  A and angle 2*Pi. If  
         C is true, S is copied.") BRepPrimAPI_MakeRevol;
		 BRepPrimAPI_MakeRevol (const TopoDS_Shape & S,const gp_Ax1 & A,const Standard_Boolean Copy = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	BRepSweep_Revol

Returns the internal sweeping algorithm.") Revol;
		const BRepSweep_Revol & Revol ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Builds the resulting shape (redefined from MakeShape).") Build;
		virtual void Build ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns the first shape of the revol  (coinciding with  
         the generating shape).") FirstShape;
		TopoDS_Shape FirstShape ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns the TopoDS Shape of the end of the revol.") LastShape;
		TopoDS_Shape LastShape ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	virtual  TopTools_ListOfShape

No detailed docstring for this function.") Generated;
		virtual const TopTools_ListOfShape & Generated (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	theShape(TopoDS_Shape)

Returns:
	TopoDS_Shape

Returns the TopoDS Shape of the beginning of the revolution,  
         generated with theShape  (subShape of the generating shape).") FirstShape;
		TopoDS_Shape FirstShape (const TopoDS_Shape & theShape);
		%feature("autodoc", "Args:
	theShape(TopoDS_Shape)

Returns:
	TopoDS_Shape

Returns the TopoDS Shape of the end of the revolution,  
         generated with  theShape (subShape of the  generating shape).") LastShape;
		TopoDS_Shape LastShape (const TopoDS_Shape & theShape);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Check if there are degenerated edges in the result.") HasDegenerated;
		Standard_Boolean HasDegenerated ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") Degenerated;
		const TopTools_ListOfShape & Degenerated ();
};


%feature("shadow") BRepPrimAPI_MakeRevol::~BRepPrimAPI_MakeRevol %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepPrimAPI_MakeRevol {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepPrimAPI_MakeRevolution;
class BRepPrimAPI_MakeRevolution : public BRepPrimAPI_MakeOneAxis {
	public:
		%feature("autodoc", "Args:
	Meridian(Handle_Geom_Curve)

Returns:
	None

Make a revolution body by rotating a curve around Z.") BRepPrimAPI_MakeRevolution;
		 BRepPrimAPI_MakeRevolution (const Handle_Geom_Curve & Meridian);
		%feature("autodoc", "Args:
	Meridian(Handle_Geom_Curve)
	angle(Standard_Real)

Returns:
	None

Make a revolution body by rotating a curve around Z.") BRepPrimAPI_MakeRevolution;
		 BRepPrimAPI_MakeRevolution (const Handle_Geom_Curve & Meridian,const Standard_Real angle);
		%feature("autodoc", "Args:
	Meridian(Handle_Geom_Curve)
	VMin(Standard_Real)
	VMax(Standard_Real)

Returns:
	None

Make a revolution body by rotating a curve around Z.") BRepPrimAPI_MakeRevolution;
		 BRepPrimAPI_MakeRevolution (const Handle_Geom_Curve & Meridian,const Standard_Real VMin,const Standard_Real VMax);
		%feature("autodoc", "Args:
	Meridian(Handle_Geom_Curve)
	VMin(Standard_Real)
	VMax(Standard_Real)
	angle(Standard_Real)

Returns:
	None

Make a revolution body by rotating a curve around Z.") BRepPrimAPI_MakeRevolution;
		 BRepPrimAPI_MakeRevolution (const Handle_Geom_Curve & Meridian,const Standard_Real VMin,const Standard_Real VMax,const Standard_Real angle);
		%feature("autodoc", "Args:
	Axes(gp_Ax2)
	Meridian(Handle_Geom_Curve)

Returns:
	None

Make a revolution body by rotating a curve around Z.") BRepPrimAPI_MakeRevolution;
		 BRepPrimAPI_MakeRevolution (const gp_Ax2 & Axes,const Handle_Geom_Curve & Meridian);
		%feature("autodoc", "Args:
	Axes(gp_Ax2)
	Meridian(Handle_Geom_Curve)
	angle(Standard_Real)

Returns:
	None

Make a revolution body by rotating a curve around Z.") BRepPrimAPI_MakeRevolution;
		 BRepPrimAPI_MakeRevolution (const gp_Ax2 & Axes,const Handle_Geom_Curve & Meridian,const Standard_Real angle);
		%feature("autodoc", "Args:
	Axes(gp_Ax2)
	Meridian(Handle_Geom_Curve)
	VMin(Standard_Real)
	VMax(Standard_Real)

Returns:
	None

Make a revolution body by rotating a curve around Z.") BRepPrimAPI_MakeRevolution;
		 BRepPrimAPI_MakeRevolution (const gp_Ax2 & Axes,const Handle_Geom_Curve & Meridian,const Standard_Real VMin,const Standard_Real VMax);
		%feature("autodoc", "Args:
	Axes(gp_Ax2)
	Meridian(Handle_Geom_Curve)
	VMin(Standard_Real)
	VMax(Standard_Real)
	angle(Standard_Real)

Returns:
	None

Make a revolution body by rotating a curve around Z.  For all algorithms the resulting shape is composed of  
-   a lateral revolved face,  
-   two planar faces in planes parallel to the plane z =  
  0, and passing by the extremities of the revolved  
  portion of Meridian, if these points are not on the Z  
  axis (in case of a complete revolved shape, these faces are circles),  
-   and in the case of a portion of a revolved shape, two  
  planar faces to close the shape (in the planes u = 0 and u = angle).") BRepPrimAPI_MakeRevolution;
		 BRepPrimAPI_MakeRevolution (const gp_Ax2 & Axes,const Handle_Geom_Curve & Meridian,const Standard_Real VMin,const Standard_Real VMax,const Standard_Real angle);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Address

Missing detailed docstring.") OneAxis;
		Standard_Address OneAxis ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepPrim_Revolution

Missing detailed docstring.") Revolution;
		BRepPrim_Revolution & Revolution ();
};


%feature("shadow") BRepPrimAPI_MakeRevolution::~BRepPrimAPI_MakeRevolution %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepPrimAPI_MakeRevolution {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepPrimAPI_MakeSphere;
class BRepPrimAPI_MakeSphere : public BRepPrimAPI_MakeOneAxis {
	public:
		%feature("autodoc", "Args:
	R(Standard_Real)

Returns:
	None

Make a sphere of radius R.") BRepPrimAPI_MakeSphere;
		 BRepPrimAPI_MakeSphere (const Standard_Real R);
		%feature("autodoc", "Args:
	R(Standard_Real)
	angle(Standard_Real)

Returns:
	None

Make a sphere of radius R.") BRepPrimAPI_MakeSphere;
		 BRepPrimAPI_MakeSphere (const Standard_Real R,const Standard_Real angle);
		%feature("autodoc", "Args:
	R(Standard_Real)
	angle1(Standard_Real)
	angle2(Standard_Real)

Returns:
	None

Make a sphere of radius R.") BRepPrimAPI_MakeSphere;
		 BRepPrimAPI_MakeSphere (const Standard_Real R,const Standard_Real angle1,const Standard_Real angle2);
		%feature("autodoc", "Args:
	R(Standard_Real)
	angle1(Standard_Real)
	angle2(Standard_Real)
	angle3(Standard_Real)

Returns:
	None

Make a sphere of radius R.") BRepPrimAPI_MakeSphere;
		 BRepPrimAPI_MakeSphere (const Standard_Real R,const Standard_Real angle1,const Standard_Real angle2,const Standard_Real angle3);
		%feature("autodoc", "Args:
	Center(gp_Pnt)
	R(Standard_Real)

Returns:
	None

Make a sphere of radius R.") BRepPrimAPI_MakeSphere;
		 BRepPrimAPI_MakeSphere (const gp_Pnt & Center,const Standard_Real R);
		%feature("autodoc", "Args:
	Center(gp_Pnt)
	R(Standard_Real)
	angle(Standard_Real)

Returns:
	None

Make a sphere of radius R.") BRepPrimAPI_MakeSphere;
		 BRepPrimAPI_MakeSphere (const gp_Pnt & Center,const Standard_Real R,const Standard_Real angle);
		%feature("autodoc", "Args:
	Center(gp_Pnt)
	R(Standard_Real)
	angle1(Standard_Real)
	angle2(Standard_Real)

Returns:
	None

Make a sphere of radius R.") BRepPrimAPI_MakeSphere;
		 BRepPrimAPI_MakeSphere (const gp_Pnt & Center,const Standard_Real R,const Standard_Real angle1,const Standard_Real angle2);
		%feature("autodoc", "Args:
	Center(gp_Pnt)
	R(Standard_Real)
	angle1(Standard_Real)
	angle2(Standard_Real)
	angle3(Standard_Real)

Returns:
	None

Make a sphere of radius R.") BRepPrimAPI_MakeSphere;
		 BRepPrimAPI_MakeSphere (const gp_Pnt & Center,const Standard_Real R,const Standard_Real angle1,const Standard_Real angle2,const Standard_Real angle3);
		%feature("autodoc", "Args:
	Axis(gp_Ax2)
	R(Standard_Real)

Returns:
	None

Make a sphere of radius R.") BRepPrimAPI_MakeSphere;
		 BRepPrimAPI_MakeSphere (const gp_Ax2 & Axis,const Standard_Real R);
		%feature("autodoc", "Args:
	Axis(gp_Ax2)
	R(Standard_Real)
	angle(Standard_Real)

Returns:
	None

Make a sphere of radius R.") BRepPrimAPI_MakeSphere;
		 BRepPrimAPI_MakeSphere (const gp_Ax2 & Axis,const Standard_Real R,const Standard_Real angle);
		%feature("autodoc", "Args:
	Axis(gp_Ax2)
	R(Standard_Real)
	angle1(Standard_Real)
	angle2(Standard_Real)

Returns:
	None

Make a sphere of radius R.") BRepPrimAPI_MakeSphere;
		 BRepPrimAPI_MakeSphere (const gp_Ax2 & Axis,const Standard_Real R,const Standard_Real angle1,const Standard_Real angle2);
		%feature("autodoc", "Args:
	Axis(gp_Ax2)
	R(Standard_Real)
	angle1(Standard_Real)
	angle2(Standard_Real)
	angle3(Standard_Real)

Returns:
	None

Make a sphere of radius R.  For all algorithms The resulting shape is composed of  
-   a lateral spherical face,  
-   two planar faces parallel to the plane z = 0 if the  
  sphere is truncated in the v parametric direction, or  
  only one planar face if angle1 is equal to -p/2 or if  
    angle2 is equal to p/2 (these faces are circles in  
  case of a complete truncated sphere),  
-   and in case of a portion of sphere, two planar faces  
  to shut the shape.(in the planes u = 0 and u = angle).") BRepPrimAPI_MakeSphere;
		 BRepPrimAPI_MakeSphere (const gp_Ax2 & Axis,const Standard_Real R,const Standard_Real angle1,const Standard_Real angle2,const Standard_Real angle3);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Address

Missing detailed docstring.") OneAxis;
		Standard_Address OneAxis ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepPrim_Sphere

Missing detailed docstring.") Sphere;
		BRepPrim_Sphere & Sphere ();
};


%feature("shadow") BRepPrimAPI_MakeSphere::~BRepPrimAPI_MakeSphere %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepPrimAPI_MakeSphere {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepPrimAPI_MakeTorus;
class BRepPrimAPI_MakeTorus : public BRepPrimAPI_MakeOneAxis {
	public:
		%feature("autodoc", "Args:
	R1(Standard_Real)
	R2(Standard_Real)

Returns:
	None

Make a torus of radii R1 R2.") BRepPrimAPI_MakeTorus;
		 BRepPrimAPI_MakeTorus (const Standard_Real R1,const Standard_Real R2);
		%feature("autodoc", "Args:
	R1(Standard_Real)
	R2(Standard_Real)
	angle(Standard_Real)

Returns:
	None

Make a section of a torus of radii R1 R2.") BRepPrimAPI_MakeTorus;
		 BRepPrimAPI_MakeTorus (const Standard_Real R1,const Standard_Real R2,const Standard_Real angle);
		%feature("autodoc", "Args:
	R1(Standard_Real)
	R2(Standard_Real)
	angle1(Standard_Real)
	angle2(Standard_Real)

Returns:
	None

Make  a torus of  radii R2, R2  with angles on the  
         small circle.") BRepPrimAPI_MakeTorus;
		 BRepPrimAPI_MakeTorus (const Standard_Real R1,const Standard_Real R2,const Standard_Real angle1,const Standard_Real angle2);
		%feature("autodoc", "Args:
	R1(Standard_Real)
	R2(Standard_Real)
	angle1(Standard_Real)
	angle2(Standard_Real)
	angle(Standard_Real)

Returns:
	None

Make  a torus of  radii R2, R2  with angles on the  
         small circle.") BRepPrimAPI_MakeTorus;
		 BRepPrimAPI_MakeTorus (const Standard_Real R1,const Standard_Real R2,const Standard_Real angle1,const Standard_Real angle2,const Standard_Real angle);
		%feature("autodoc", "Args:
	Axes(gp_Ax2)
	R1(Standard_Real)
	R2(Standard_Real)

Returns:
	None

Make a torus of radii R1 R2.") BRepPrimAPI_MakeTorus;
		 BRepPrimAPI_MakeTorus (const gp_Ax2 & Axes,const Standard_Real R1,const Standard_Real R2);
		%feature("autodoc", "Args:
	Axes(gp_Ax2)
	R1(Standard_Real)
	R2(Standard_Real)
	angle(Standard_Real)

Returns:
	None

Make a section of a torus of radii R1 R2.") BRepPrimAPI_MakeTorus;
		 BRepPrimAPI_MakeTorus (const gp_Ax2 & Axes,const Standard_Real R1,const Standard_Real R2,const Standard_Real angle);
		%feature("autodoc", "Args:
	Axes(gp_Ax2)
	R1(Standard_Real)
	R2(Standard_Real)
	angle1(Standard_Real)
	angle2(Standard_Real)

Returns:
	None

Make a torus of radii R1 R2.") BRepPrimAPI_MakeTorus;
		 BRepPrimAPI_MakeTorus (const gp_Ax2 & Axes,const Standard_Real R1,const Standard_Real R2,const Standard_Real angle1,const Standard_Real angle2);
		%feature("autodoc", "Args:
	Axes(gp_Ax2)
	R1(Standard_Real)
	R2(Standard_Real)
	angle1(Standard_Real)
	angle2(Standard_Real)
	angle(Standard_Real)

Returns:
	None

Make a section of a torus of radii R1 R2.  For all algorithms The resulting shape is composed of  
  -      a lateral toroidal face,  
  -      two conical faces (defined  by the equation v = angle1 and  
     v = angle2) if the sphere is truncated in the v parametric  
     direction (they may be cylindrical faces in some  
     particular conditions), and in case of a portion  
     of torus, two planar faces to close the shape.(in the planes  
     u = 0 and u = angle).  
Notes:  
  -      The u parameter corresponds to a rotation angle around the Z axis.  
  -      The circle whose radius is equal to the minor radius,  
     located in the plane defined by the X axis and the Z axis,  
     centered on the X axis, on its positive side, and positioned  
     at a distance from the origin equal to the major radius, is  
     the reference circle of the torus. The rotation around an  
     axis parallel to the Y axis and passing through the center  
     of the reference circle gives the v parameter on the  
     reference circle. The X axis gives the origin of the v  
parameter. Near 0, as v increases, the Z coordinate decreases.") BRepPrimAPI_MakeTorus;
		 BRepPrimAPI_MakeTorus (const gp_Ax2 & Axes,const Standard_Real R1,const Standard_Real R2,const Standard_Real angle1,const Standard_Real angle2,const Standard_Real angle);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Address

Missing detailed docstring.") OneAxis;
		Standard_Address OneAxis ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepPrim_Torus

Missing detailed docstring.") Torus;
		BRepPrim_Torus & Torus ();
};


%feature("shadow") BRepPrimAPI_MakeTorus::~BRepPrimAPI_MakeTorus %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepPrimAPI_MakeTorus {
	void _kill_pointed() {
		delete $self;
	}
};
