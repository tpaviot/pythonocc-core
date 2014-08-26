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
%module GeomPlate

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

%include GeomPlate_required_python_modules.i
%include GeomPlate_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor GeomPlate_Aij;
class GeomPlate_Aij {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") GeomPlate_Aij;
		 GeomPlate_Aij ();
		%feature("autodoc", "Args:
	anInd1(Standard_Integer)
	anInd2(Standard_Integer)
	aVec(gp_Vec)

Returns:
	None

No detailed docstring for this function.") GeomPlate_Aij;
		 GeomPlate_Aij (const Standard_Integer anInd1,const Standard_Integer anInd2,const gp_Vec & aVec);
};


%feature("shadow") GeomPlate_Aij::~GeomPlate_Aij %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomPlate_Aij {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GeomPlate_Array1OfHCurveOnSurface;
class GeomPlate_Array1OfHCurveOnSurface {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") GeomPlate_Array1OfHCurveOnSurface;
		 GeomPlate_Array1OfHCurveOnSurface (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(Handle_Adaptor3d_HCurveOnSurface)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") GeomPlate_Array1OfHCurveOnSurface;
		 GeomPlate_Array1OfHCurveOnSurface (const Handle_Adaptor3d_HCurveOnSurface & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(Handle_Adaptor3d_HCurveOnSurface)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Adaptor3d_HCurveOnSurface & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	Other(GeomPlate_Array1OfHCurveOnSurface)

Returns:
	GeomPlate_Array1OfHCurveOnSurface

No detailed docstring for this function.") Assign;
		const GeomPlate_Array1OfHCurveOnSurface & Assign (const GeomPlate_Array1OfHCurveOnSurface & Other);
		%feature("autodoc", "Args:
	Other(GeomPlate_Array1OfHCurveOnSurface)

Returns:
	GeomPlate_Array1OfHCurveOnSurface

No detailed docstring for this function.") operator=;
		const GeomPlate_Array1OfHCurveOnSurface & operator = (const GeomPlate_Array1OfHCurveOnSurface & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Handle_Adaptor3d_HCurveOnSurface)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Adaptor3d_HCurveOnSurface & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Adaptor3d_HCurveOnSurface

No detailed docstring for this function.") Value;
		const Handle_Adaptor3d_HCurveOnSurface & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Adaptor3d_HCurveOnSurface

No detailed docstring for this function.") ChangeValue;
		Handle_Adaptor3d_HCurveOnSurface & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") GeomPlate_Array1OfHCurveOnSurface::~GeomPlate_Array1OfHCurveOnSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomPlate_Array1OfHCurveOnSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GeomPlate_Array1OfSequenceOfReal;
class GeomPlate_Array1OfSequenceOfReal {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") GeomPlate_Array1OfSequenceOfReal;
		 GeomPlate_Array1OfSequenceOfReal (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(TColStd_SequenceOfReal)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") GeomPlate_Array1OfSequenceOfReal;
		 GeomPlate_Array1OfSequenceOfReal (const TColStd_SequenceOfReal & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(TColStd_SequenceOfReal)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TColStd_SequenceOfReal & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	Other(GeomPlate_Array1OfSequenceOfReal)

Returns:
	GeomPlate_Array1OfSequenceOfReal

No detailed docstring for this function.") Assign;
		const GeomPlate_Array1OfSequenceOfReal & Assign (const GeomPlate_Array1OfSequenceOfReal & Other);
		%feature("autodoc", "Args:
	Other(GeomPlate_Array1OfSequenceOfReal)

Returns:
	GeomPlate_Array1OfSequenceOfReal

No detailed docstring for this function.") operator=;
		const GeomPlate_Array1OfSequenceOfReal & operator = (const GeomPlate_Array1OfSequenceOfReal & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(TColStd_SequenceOfReal)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const TColStd_SequenceOfReal & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TColStd_SequenceOfReal

No detailed docstring for this function.") Value;
		const TColStd_SequenceOfReal & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TColStd_SequenceOfReal

No detailed docstring for this function.") ChangeValue;
		TColStd_SequenceOfReal & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") GeomPlate_Array1OfSequenceOfReal::~GeomPlate_Array1OfSequenceOfReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomPlate_Array1OfSequenceOfReal {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GeomPlate_BuildAveragePlane;
class GeomPlate_BuildAveragePlane {
	public:
		%feature("autodoc", "Args:
	Pts(Handle_TColgp_HArray1OfPnt)
	NbBoundPoints(Standard_Integer)
	Tol(Standard_Real)
	POption(Standard_Integer)
	NOption(Standard_Integer)

Returns:
	None

Tol is a  Tolerance to make the difference between  
          the result plane and the result line.  
if POption = 1 : automatical parametrisation  
if POption = 2 : parametrisation by eigen vectors  
if NOption = 1 : the average plane is the inertial plane.  
if NOption = 2 : the average plane is the plane of max. flux.") GeomPlate_BuildAveragePlane;
		 GeomPlate_BuildAveragePlane (const Handle_TColgp_HArray1OfPnt & Pts,const Standard_Integer NbBoundPoints,const Standard_Real Tol,const Standard_Integer POption,const Standard_Integer NOption);
		%feature("autodoc", "Args:
	Normals(TColgp_SequenceOfVec)
	Pts(Handle_TColgp_HArray1OfPnt)

Returns:
	None

Creates the plane from the 'best vector'") GeomPlate_BuildAveragePlane;
		 GeomPlate_BuildAveragePlane (const TColgp_SequenceOfVec & Normals,const Handle_TColgp_HArray1OfPnt & Pts);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Plane

Return the average Plane.") Plane;
		Handle_Geom_Plane Plane ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Line

Return a Line when 2 eigenvalues are null.") Line;
		Handle_Geom_Line Line ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

return OK if is a plane.") IsPlane;
		Standard_Boolean IsPlane ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

return OK if is a line.") IsLine;
		Standard_Boolean IsLine ();
		%feature("autodoc", "Args:
	Umin(Standard_Real)
	Umax(Standard_Real)
	Vmin(Standard_Real)
	Vmax(Standard_Real)

Returns:
	None

computes the   minimal box  to include  all normal  
         projection points of the initial array  on the plane.") MinMaxBox;
		void MinMaxBox (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	NewNormals(TColgp_SequenceOfVec)
	Normals(TColgp_SequenceOfVec)
	Bset(GeomPlate_SequenceOfAij)
	LinTol(Standard_Real)
	AngTol(Standard_Real)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") HalfSpace;
		static Standard_Boolean HalfSpace (const TColgp_SequenceOfVec & NewNormals,TColgp_SequenceOfVec & Normals,GeomPlate_SequenceOfAij & Bset,const Standard_Real LinTol,const Standard_Real AngTol);
};


%feature("shadow") GeomPlate_BuildAveragePlane::~GeomPlate_BuildAveragePlane %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomPlate_BuildAveragePlane {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GeomPlate_BuildPlateSurface;
class GeomPlate_BuildPlateSurface {
	public:
		%feature("autodoc", "Args:
	NPoints(Handle_TColStd_HArray1OfInteger)
	TabCurve(Handle_GeomPlate_HArray1OfHCurveOnSurface)
	Tang(Handle_TColStd_HArray1OfInteger)
	Degree(Standard_Integer)
	NbIter(Standard_Integer)=3
	Tol2d(Standard_Real)=0.00001
	Tol3d(Standard_Real)=0.0001
	TolAng(Standard_Real)=0.01
	TolCurv(Standard_Real)=0.1
	Anisotropie(Standard_Boolean)=Standard_False

Returns:
	None

Constructor  compatible  with  the  old  version  
with this constructor the constraint are given in a Array of Curve on Surface  
The array NbPoints  contains the number of points for each constraint.  
The Array Tang contains the order of constraint for each Constraint: The possible values for this  
order has to be -1 , 0 , 1 , 2 . Order i means constraint Gi.  
NbIter is the maximum number of iteration to optimise the number of points for resolution  
Degree is the degree of resolution for Plate  
Tol2d is the tolerance used to test if two points of different constraint are identical in the  
parametric space of the initial surface  
Tol3d is used to test if two identical points in the 2d space are identical in 3d space  
TolAng is used to compare the angle between normal of two identical points in the 2d space  
Raises  ConstructionError;") GeomPlate_BuildPlateSurface;
		 GeomPlate_BuildPlateSurface (const Handle_TColStd_HArray1OfInteger & NPoints,const Handle_GeomPlate_HArray1OfHCurveOnSurface & TabCurve,const Handle_TColStd_HArray1OfInteger & Tang,const Standard_Integer Degree,const Standard_Integer NbIter = 3,const Standard_Real Tol2d = 0.00001,const Standard_Real Tol3d = 0.0001,const Standard_Real TolAng = 0.01,const Standard_Real TolCurv = 0.1,const Standard_Boolean Anisotropie = Standard_False);
		%feature("autodoc", "Args:
	Surf(Handle_Geom_Surface)
	Degree(Standard_Integer)=3
	NbPtsOnCur(Standard_Integer)=10
	NbIter(Standard_Integer)=3
	Tol2d(Standard_Real)=0.00001
	Tol3d(Standard_Real)=0.0001
	TolAng(Standard_Real)=0.01
	TolCurv(Standard_Real)=0.1
	Anisotropie(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") GeomPlate_BuildPlateSurface;
		 GeomPlate_BuildPlateSurface (const Handle_Geom_Surface & Surf,const Standard_Integer Degree = 3,const Standard_Integer NbPtsOnCur = 10,const Standard_Integer NbIter = 3,const Standard_Real Tol2d = 0.00001,const Standard_Real Tol3d = 0.0001,const Standard_Real TolAng = 0.01,const Standard_Real TolCurv = 0.1,const Standard_Boolean Anisotropie = Standard_False);
		%feature("autodoc", "Args:
	Degree(Standard_Integer)=3
	NbPtsOnCur(Standard_Integer)=10
	NbIter(Standard_Integer)=3
	Tol2d(Standard_Real)=0.00001
	Tol3d(Standard_Real)=0.0001
	TolAng(Standard_Real)=0.01
	TolCurv(Standard_Real)=0.1
	Anisotropie(Standard_Boolean)=Standard_False

Returns:
	None

Initializes the BuildPlateSurface framework for  
deforming plate surfaces using curve and point  
constraints. You use the first constructor if you have  
an initial surface to work with at construction time. If  
not, you use the second. You can add one later by  
using the method LoadInitSurface. If no initial  
surface is loaded, one will automatically be computed.  
The curve and point constraints will be defined by  
using the method Add.  
Before the call to the algorithm, the curve constraints  
will be transformed into sequences of discrete points.  
Each curve defined as a constraint will be given the  
value of NbPtsOnCur as the average number of points on it.  
Several arguments serve to improve performance of  
the algorithm. NbIter, for example, expresses the  
number of iterations allowed and is used to control the  
duration of computation. To optimize resolution,  
Degree will have the default value of 3.  
The surface generated must respect several tolerance values:  
-   2d tolerance given by Tol2d, with a default value of 0.00001  
-   3d tolerance expressed by Tol3d, with a default value of 0.0001  
-   angular tolerance given by TolAng, with a default  
  value of 0.01, defining the greatest angle allowed  
  between the constraint and the target surface.  
Exceptions  
Standard_ConstructionError if NbIter is less than 1 or Degree is less than 3.") GeomPlate_BuildPlateSurface;
		 GeomPlate_BuildPlateSurface (const Standard_Integer Degree = 3,const Standard_Integer NbPtsOnCur = 10,const Standard_Integer NbIter = 3,const Standard_Real Tol2d = 0.00001,const Standard_Real Tol3d = 0.0001,const Standard_Real TolAng = 0.01,const Standard_Real TolCurv = 0.1,const Standard_Boolean Anisotropie = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	None

Resets all constraints") Init;
		void Init ();
		%feature("autodoc", "Args:
	Surf(Handle_Geom_Surface)

Returns:
	None

Loads the initial Surface") LoadInitSurface;
		void LoadInitSurface (const Handle_Geom_Surface & Surf);
		%feature("autodoc", "Args:
	Cont(Handle_GeomPlate_CurveConstraint)

Returns:
	None

Adds the linear constraint cont.") Add;
		void Add (const Handle_GeomPlate_CurveConstraint & Cont);
		%feature("autodoc", "Args:
	NbBounds(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetNbBounds;
		void SetNbBounds (const Standard_Integer NbBounds);
		%feature("autodoc", "Args:
	Cont(Handle_GeomPlate_PointConstraint)

Returns:
	None

Adds the point constraint cont.") Add;
		void Add (const Handle_GeomPlate_PointConstraint & Cont);
		%feature("autodoc", "Args:
	None
Returns:
	None

Calls the algorithm and computes the plate surface using  
the loaded constraints. If no initial surface is given, the  
algorithm automatically computes one.  
Exceptions  
Standard_RangeError if the value of the constraint is  
null or if plate is not done.") Perform;
		void Perform ();
		%feature("autodoc", "Args:
	order(Standard_Integer)

Returns:
	Handle_GeomPlate_CurveConstraint

returns the CurveConstraints of order order") CurveConstraint;
		Handle_GeomPlate_CurveConstraint CurveConstraint (const Standard_Integer order);
		%feature("autodoc", "Args:
	order(Standard_Integer)

Returns:
	Handle_GeomPlate_PointConstraint

returns the PointConstraint of order order") PointConstraint;
		Handle_GeomPlate_PointConstraint PointConstraint (const Standard_Integer order);
		%feature("autodoc", "Args:
	nbp(Standard_Integer)
	Seq2d(TColgp_SequenceOfXY)

Returns:
	None

No detailed docstring for this function.") Disc2dContour;
		void Disc2dContour (const Standard_Integer nbp,TColgp_SequenceOfXY & Seq2d);
		%feature("autodoc", "Args:
	nbp(Standard_Integer)
	iordre(Standard_Integer)
	Seq3d(TColgp_SequenceOfXYZ)

Returns:
	None

No detailed docstring for this function.") Disc3dContour;
		void Disc3dContour (const Standard_Integer nbp,const Standard_Integer iordre,TColgp_SequenceOfXYZ & Seq3d);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Tests whether computation of the plate has been completed.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_GeomPlate_Surface

Returns the result of the computation. This surface can  
then be used by GeomPlate_MakeApprox for  
converting the resulting surface into a BSpline.") Surface;
		Handle_GeomPlate_Surface Surface ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Surface

Returns the initial surface") SurfInit;
		Handle_Geom_Surface SurfInit ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HArray1OfInteger

Allows you to ensure that the array of curves returned by  
Curves2d has the correct orientation. Returns the  
orientation of the curves in the the array returned by  
Curves2d. Computation changes the orientation of  
these curves. Consequently, this method returns the  
orientation prior to computation.") Sense;
		Handle_TColStd_HArray1OfInteger Sense ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColGeom2d_HArray1OfCurve

Extracts the array of curves on the plate surface which  
correspond to the curve constraints set in Add.") Curves2d;
		Handle_TColGeom2d_HArray1OfCurve Curves2d ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HArray1OfInteger

Returns the order of the curves in the array returned by  
Curves2d. Computation changes this order.  
Consequently, this method returns the order of the  
curves prior to computation.") Order;
		Handle_TColStd_HArray1OfInteger Order ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the max distance betwen the result and the constraints") G0Error;
		Standard_Real G0Error ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns  the max angle betwen the result and the constraints") G1Error;
		Standard_Real G1Error ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns  the max difference of curvature betwen the result and the constraints") G2Error;
		Standard_Real G2Error ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

Returns   the max distance between the result and the constraint Index") G0Error;
		Standard_Real G0Error (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

Returns the max angle between the result and the constraint Index") G1Error;
		Standard_Real G1Error (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

Returns the max difference of curvature between the result and the constraint Index") G2Error;
		Standard_Real G2Error (const Standard_Integer Index);
};


%feature("shadow") GeomPlate_BuildPlateSurface::~GeomPlate_BuildPlateSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomPlate_BuildPlateSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GeomPlate_CurveConstraint;
class GeomPlate_CurveConstraint : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Initializes an empty curve constraint object.") GeomPlate_CurveConstraint;
		 GeomPlate_CurveConstraint ();
		%feature("autodoc", "Args:
	Boundary(Handle_Adaptor3d_HCurveOnSurface)
	Order(Standard_Integer)
	NPt(Standard_Integer)=10
	TolDist(Standard_Real)=0.0001
	TolAng(Standard_Real)=0.01
	TolCurv(Standard_Real)=0.1

Returns:
	None

Create a constraint  
 Order is the order of the constraint. The possible values for order are -1,0,1,2.  
 Order i means constraints Gi  
 Npt is the number of points associated with the constraint.  
 TolDist is the maximum error to satisfy for G0 constraints  
 TolAng is the maximum error to satisfy for G1 constraints  
 TolCurv is the maximum error to satisfy for G2 constraints  
 These errors can be replaced by laws of criterion.  
Raises    ConstructionError if Order is not -1 , 0,  1,  2") GeomPlate_CurveConstraint;
		 GeomPlate_CurveConstraint (const Handle_Adaptor3d_HCurveOnSurface & Boundary,const Standard_Integer Order,const Standard_Integer NPt = 10,const Standard_Real TolDist = 0.0001,const Standard_Real TolAng = 0.01,const Standard_Real TolCurv = 0.1);
		%feature("autodoc", "Args:
	Boundary(Handle_Adaptor3d_HCurve)
	Tang(Standard_Integer)
	NPt(Standard_Integer)=10
	TolDist(Standard_Real)=0.0001

Returns:
	None

Create a constraint  
 Order is the order of the constraint. The possible values for order are -1,0.  
 Order i means constraints Gi  
 Npt is the number of points associated with the constraint.  
 TolDist is the maximum error to satisfy for G0 constraints  
 These errors can be replaced by laws of criterion.  
Raises    ConstructionError if Order  is  not  0  or  -1") GeomPlate_CurveConstraint;
		 GeomPlate_CurveConstraint (const Handle_Adaptor3d_HCurve & Boundary,const Standard_Integer Tang,const Standard_Integer NPt = 10,const Standard_Real TolDist = 0.0001);
		%feature("autodoc", "Args:
	Order(Standard_Integer)

Returns:
	None

Allows you to set the order of continuity required for  
the constraints: G0, G1, and G2, controlled  
respectively by G0Criterion G1Criterion and G2Criterion.") SetOrder;
		void SetOrder (const Standard_Integer Order);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the order of constraint, one of G0, G1 or G2.") Order;
		Standard_Integer Order ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of points on the curve used as a  
constraint. The default setting is 10. This parameter  
affects computation time, which increases by the cube of  
the number of points.") NbPoints;
		Standard_Integer NbPoints ();
		%feature("autodoc", "Args:
	NewNb(Standard_Integer)

Returns:
	None

Allows you to set the number of points on the curve  
constraint. The default setting is 10. This parameter  
affects computation time, which increases by the cube of  
the number of points.") SetNbPoints;
		void SetNbPoints (const Standard_Integer NewNb);
		%feature("autodoc", "Args:
	G0Crit(Handle_Law_Function)

Returns:
	None

Allows you to set the G0 criterion. This is the law  
defining the greatest distance allowed between the  
constraint and the target surface for each point of the  
constraint. If this criterion is not set, TolDist, the  
distance tolerance from the constructor, is used.") SetG0Criterion;
		void SetG0Criterion (const Handle_Law_Function & G0Crit);
		%feature("autodoc", "Args:
	G1Crit(Handle_Law_Function)

Returns:
	None

Allows you to set the G1 criterion. This is the law  
defining the greatest angle allowed between the  
constraint and the target surface. If this criterion is not  
set, TolAng, the angular tolerance from the constructor, is used.  
Raises  ConstructionError if  the  curve  is  not  on  a  surface") SetG1Criterion;
		void SetG1Criterion (const Handle_Law_Function & G1Crit);
		%feature("autodoc", "Args:
	G2Crit(Handle_Law_Function)

Returns:
	None

No detailed docstring for this function.") SetG2Criterion;
		void SetG2Criterion (const Handle_Law_Function & G2Crit);
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Standard_Real

Returns the G0 criterion at the parametric point U on  
the curve. This is the greatest distance allowed between  
the constraint and the target surface at U.") G0Criterion;
		Standard_Real G0Criterion (const Standard_Real U);
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Standard_Real

Returns the G1 criterion at the parametric point U on  
the curve. This is the greatest angle allowed between  
the constraint and the target surface at U.  
Raises  ConstructionError if  the  curve  is  not  on  a  surface") G1Criterion;
		Standard_Real G1Criterion (const Standard_Real U);
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Standard_Real

Returns the G2 criterion at the parametric point U on  
the curve. This is the greatest difference in curvature  
allowed between the constraint and the target surface at U.  
Raises  ConstructionError if  the  curve  is  not  on  a  surface") G2Criterion;
		Standard_Real G2Criterion (const Standard_Real U);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") LastParameter;
		Standard_Real LastParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Length;
		Standard_Real Length ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	GeomLProp_SLProps

No detailed docstring for this function.") LPropSurf;
		GeomLProp_SLProps & LPropSurf (const Standard_Real U);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") D0;
		void D0 (const Standard_Real U,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)

Returns:
	None

No detailed docstring for this function.") D1;
		void D1 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)
	V3(gp_Vec)
	V4(gp_Vec)
	V5(gp_Vec)

Returns:
	None

No detailed docstring for this function.") D2;
		void D2 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3,gp_Vec & V4,gp_Vec & V5);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Adaptor3d_HCurve

No detailed docstring for this function.") Curve3d;
		Handle_Adaptor3d_HCurve Curve3d ();
		%feature("autodoc", "Args:
	Curve2d(Handle_Geom2d_Curve)

Returns:
	None

loads a 2d curve associated the surface resulting of the constraints") SetCurve2dOnSurf;
		void SetCurve2dOnSurf (const Handle_Geom2d_Curve & Curve2d);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Curve

Returns a 2d curve associated the surface resulting of the constraints") Curve2dOnSurf;
		Handle_Geom2d_Curve Curve2dOnSurf ();
		%feature("autodoc", "Args:
	Curve2d(Handle_Adaptor2d_HCurve2d)
	TolU(Standard_Real)
	TolV(Standard_Real)

Returns:
	None

loads a 2d curve  resulting from the normal projection of  
         the curve on the initial surface") SetProjectedCurve;
		void SetProjectedCurve (const Handle_Adaptor2d_HCurve2d & Curve2d,const Standard_Real TolU,const Standard_Real TolV);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Adaptor2d_HCurve2d

Returns the projected curve resulting from the normal projection of the  
         curve on the initial surface") ProjectedCurve;
		Handle_Adaptor2d_HCurve2d ProjectedCurve ();
};


%feature("shadow") GeomPlate_CurveConstraint::~GeomPlate_CurveConstraint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomPlate_CurveConstraint {
	void _kill_pointed() {
		delete $self;
	}
};
%extend GeomPlate_CurveConstraint {
	Handle_GeomPlate_CurveConstraint GetHandle() {
	return *(Handle_GeomPlate_CurveConstraint*) &$self;
	}
};

%nodefaultctor Handle_GeomPlate_CurveConstraint;
class Handle_GeomPlate_CurveConstraint : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_GeomPlate_CurveConstraint();
        Handle_GeomPlate_CurveConstraint(const Handle_GeomPlate_CurveConstraint &aHandle);
        Handle_GeomPlate_CurveConstraint(const GeomPlate_CurveConstraint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_GeomPlate_CurveConstraint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_GeomPlate_CurveConstraint {
    GeomPlate_CurveConstraint* GetObject() {
    return (GeomPlate_CurveConstraint*)$self->Access();
    }
};
%feature("shadow") Handle_GeomPlate_CurveConstraint::~Handle_GeomPlate_CurveConstraint %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_GeomPlate_CurveConstraint {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor GeomPlate_HArray1OfHCurveOnSurface;
class GeomPlate_HArray1OfHCurveOnSurface : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") GeomPlate_HArray1OfHCurveOnSurface;
		 GeomPlate_HArray1OfHCurveOnSurface (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(Handle_Adaptor3d_HCurveOnSurface)

Returns:
	None

No detailed docstring for this function.") GeomPlate_HArray1OfHCurveOnSurface;
		 GeomPlate_HArray1OfHCurveOnSurface (const Standard_Integer Low,const Standard_Integer Up,const Handle_Adaptor3d_HCurveOnSurface & V);
		%feature("autodoc", "Args:
	V(Handle_Adaptor3d_HCurveOnSurface)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Adaptor3d_HCurveOnSurface & V);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Handle_Adaptor3d_HCurveOnSurface)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Adaptor3d_HCurveOnSurface & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Adaptor3d_HCurveOnSurface

No detailed docstring for this function.") Value;
		const Handle_Adaptor3d_HCurveOnSurface & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Adaptor3d_HCurveOnSurface

No detailed docstring for this function.") ChangeValue;
		Handle_Adaptor3d_HCurveOnSurface & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	GeomPlate_Array1OfHCurveOnSurface

No detailed docstring for this function.") Array1;
		const GeomPlate_Array1OfHCurveOnSurface & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	GeomPlate_Array1OfHCurveOnSurface

No detailed docstring for this function.") ChangeArray1;
		GeomPlate_Array1OfHCurveOnSurface & ChangeArray1 ();
};


%feature("shadow") GeomPlate_HArray1OfHCurveOnSurface::~GeomPlate_HArray1OfHCurveOnSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomPlate_HArray1OfHCurveOnSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%extend GeomPlate_HArray1OfHCurveOnSurface {
	Handle_GeomPlate_HArray1OfHCurveOnSurface GetHandle() {
	return *(Handle_GeomPlate_HArray1OfHCurveOnSurface*) &$self;
	}
};

%nodefaultctor Handle_GeomPlate_HArray1OfHCurveOnSurface;
class Handle_GeomPlate_HArray1OfHCurveOnSurface : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_GeomPlate_HArray1OfHCurveOnSurface();
        Handle_GeomPlate_HArray1OfHCurveOnSurface(const Handle_GeomPlate_HArray1OfHCurveOnSurface &aHandle);
        Handle_GeomPlate_HArray1OfHCurveOnSurface(const GeomPlate_HArray1OfHCurveOnSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_GeomPlate_HArray1OfHCurveOnSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_GeomPlate_HArray1OfHCurveOnSurface {
    GeomPlate_HArray1OfHCurveOnSurface* GetObject() {
    return (GeomPlate_HArray1OfHCurveOnSurface*)$self->Access();
    }
};
%feature("shadow") Handle_GeomPlate_HArray1OfHCurveOnSurface::~Handle_GeomPlate_HArray1OfHCurveOnSurface %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_GeomPlate_HArray1OfHCurveOnSurface {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor GeomPlate_HArray1OfSequenceOfReal;
class GeomPlate_HArray1OfSequenceOfReal : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") GeomPlate_HArray1OfSequenceOfReal;
		 GeomPlate_HArray1OfSequenceOfReal (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(TColStd_SequenceOfReal)

Returns:
	None

No detailed docstring for this function.") GeomPlate_HArray1OfSequenceOfReal;
		 GeomPlate_HArray1OfSequenceOfReal (const Standard_Integer Low,const Standard_Integer Up,const TColStd_SequenceOfReal & V);
		%feature("autodoc", "Args:
	V(TColStd_SequenceOfReal)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TColStd_SequenceOfReal & V);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(TColStd_SequenceOfReal)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const TColStd_SequenceOfReal & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TColStd_SequenceOfReal

No detailed docstring for this function.") Value;
		const TColStd_SequenceOfReal & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TColStd_SequenceOfReal

No detailed docstring for this function.") ChangeValue;
		TColStd_SequenceOfReal & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	GeomPlate_Array1OfSequenceOfReal

No detailed docstring for this function.") Array1;
		const GeomPlate_Array1OfSequenceOfReal & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	GeomPlate_Array1OfSequenceOfReal

No detailed docstring for this function.") ChangeArray1;
		GeomPlate_Array1OfSequenceOfReal & ChangeArray1 ();
};


%feature("shadow") GeomPlate_HArray1OfSequenceOfReal::~GeomPlate_HArray1OfSequenceOfReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomPlate_HArray1OfSequenceOfReal {
	void _kill_pointed() {
		delete $self;
	}
};
%extend GeomPlate_HArray1OfSequenceOfReal {
	Handle_GeomPlate_HArray1OfSequenceOfReal GetHandle() {
	return *(Handle_GeomPlate_HArray1OfSequenceOfReal*) &$self;
	}
};

%nodefaultctor Handle_GeomPlate_HArray1OfSequenceOfReal;
class Handle_GeomPlate_HArray1OfSequenceOfReal : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_GeomPlate_HArray1OfSequenceOfReal();
        Handle_GeomPlate_HArray1OfSequenceOfReal(const Handle_GeomPlate_HArray1OfSequenceOfReal &aHandle);
        Handle_GeomPlate_HArray1OfSequenceOfReal(const GeomPlate_HArray1OfSequenceOfReal *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_GeomPlate_HArray1OfSequenceOfReal DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_GeomPlate_HArray1OfSequenceOfReal {
    GeomPlate_HArray1OfSequenceOfReal* GetObject() {
    return (GeomPlate_HArray1OfSequenceOfReal*)$self->Access();
    }
};
%feature("shadow") Handle_GeomPlate_HArray1OfSequenceOfReal::~Handle_GeomPlate_HArray1OfSequenceOfReal %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_GeomPlate_HArray1OfSequenceOfReal {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor GeomPlate_HSequenceOfCurveConstraint;
class GeomPlate_HSequenceOfCurveConstraint : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") GeomPlate_HSequenceOfCurveConstraint;
		 GeomPlate_HSequenceOfCurveConstraint ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	anItem(Handle_GeomPlate_CurveConstraint)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_GeomPlate_CurveConstraint & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_GeomPlate_HSequenceOfCurveConstraint)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_GeomPlate_HSequenceOfCurveConstraint & aSequence);
		%feature("autodoc", "Args:
	anItem(Handle_GeomPlate_CurveConstraint)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_GeomPlate_CurveConstraint & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_GeomPlate_HSequenceOfCurveConstraint)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_GeomPlate_HSequenceOfCurveConstraint & aSequence);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_GeomPlate_CurveConstraint)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_GeomPlate_CurveConstraint & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_GeomPlate_HSequenceOfCurveConstraint)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_GeomPlate_HSequenceOfCurveConstraint & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_GeomPlate_CurveConstraint)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_GeomPlate_CurveConstraint & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_GeomPlate_HSequenceOfCurveConstraint)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_GeomPlate_HSequenceOfCurveConstraint & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anOtherIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_GeomPlate_HSequenceOfCurveConstraint

No detailed docstring for this function.") Split;
		Handle_GeomPlate_HSequenceOfCurveConstraint Split (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_GeomPlate_CurveConstraint)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_GeomPlate_CurveConstraint & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_GeomPlate_CurveConstraint

No detailed docstring for this function.") Value;
		const Handle_GeomPlate_CurveConstraint & Value (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_GeomPlate_CurveConstraint

No detailed docstring for this function.") ChangeValue;
		Handle_GeomPlate_CurveConstraint & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	fromIndex(Standard_Integer)
	toIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "Args:
	None
Returns:
	GeomPlate_SequenceOfCurveConstraint

No detailed docstring for this function.") Sequence;
		const GeomPlate_SequenceOfCurveConstraint & Sequence ();
		%feature("autodoc", "Args:
	None
Returns:
	GeomPlate_SequenceOfCurveConstraint

No detailed docstring for this function.") ChangeSequence;
		GeomPlate_SequenceOfCurveConstraint & ChangeSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_GeomPlate_HSequenceOfCurveConstraint

No detailed docstring for this function.") ShallowCopy;
		Handle_GeomPlate_HSequenceOfCurveConstraint ShallowCopy ();
};


%feature("shadow") GeomPlate_HSequenceOfCurveConstraint::~GeomPlate_HSequenceOfCurveConstraint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomPlate_HSequenceOfCurveConstraint {
	void _kill_pointed() {
		delete $self;
	}
};
%extend GeomPlate_HSequenceOfCurveConstraint {
	Handle_GeomPlate_HSequenceOfCurveConstraint GetHandle() {
	return *(Handle_GeomPlate_HSequenceOfCurveConstraint*) &$self;
	}
};

%nodefaultctor Handle_GeomPlate_HSequenceOfCurveConstraint;
class Handle_GeomPlate_HSequenceOfCurveConstraint : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_GeomPlate_HSequenceOfCurveConstraint();
        Handle_GeomPlate_HSequenceOfCurveConstraint(const Handle_GeomPlate_HSequenceOfCurveConstraint &aHandle);
        Handle_GeomPlate_HSequenceOfCurveConstraint(const GeomPlate_HSequenceOfCurveConstraint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_GeomPlate_HSequenceOfCurveConstraint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_GeomPlate_HSequenceOfCurveConstraint {
    GeomPlate_HSequenceOfCurveConstraint* GetObject() {
    return (GeomPlate_HSequenceOfCurveConstraint*)$self->Access();
    }
};
%feature("shadow") Handle_GeomPlate_HSequenceOfCurveConstraint::~Handle_GeomPlate_HSequenceOfCurveConstraint %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_GeomPlate_HSequenceOfCurveConstraint {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor GeomPlate_HSequenceOfPointConstraint;
class GeomPlate_HSequenceOfPointConstraint : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") GeomPlate_HSequenceOfPointConstraint;
		 GeomPlate_HSequenceOfPointConstraint ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	anItem(Handle_GeomPlate_PointConstraint)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_GeomPlate_PointConstraint & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_GeomPlate_HSequenceOfPointConstraint)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_GeomPlate_HSequenceOfPointConstraint & aSequence);
		%feature("autodoc", "Args:
	anItem(Handle_GeomPlate_PointConstraint)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_GeomPlate_PointConstraint & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_GeomPlate_HSequenceOfPointConstraint)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_GeomPlate_HSequenceOfPointConstraint & aSequence);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_GeomPlate_PointConstraint)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_GeomPlate_PointConstraint & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_GeomPlate_HSequenceOfPointConstraint)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_GeomPlate_HSequenceOfPointConstraint & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_GeomPlate_PointConstraint)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_GeomPlate_PointConstraint & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_GeomPlate_HSequenceOfPointConstraint)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_GeomPlate_HSequenceOfPointConstraint & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anOtherIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_GeomPlate_HSequenceOfPointConstraint

No detailed docstring for this function.") Split;
		Handle_GeomPlate_HSequenceOfPointConstraint Split (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_GeomPlate_PointConstraint)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_GeomPlate_PointConstraint & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_GeomPlate_PointConstraint

No detailed docstring for this function.") Value;
		const Handle_GeomPlate_PointConstraint & Value (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_GeomPlate_PointConstraint

No detailed docstring for this function.") ChangeValue;
		Handle_GeomPlate_PointConstraint & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	fromIndex(Standard_Integer)
	toIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "Args:
	None
Returns:
	GeomPlate_SequenceOfPointConstraint

No detailed docstring for this function.") Sequence;
		const GeomPlate_SequenceOfPointConstraint & Sequence ();
		%feature("autodoc", "Args:
	None
Returns:
	GeomPlate_SequenceOfPointConstraint

No detailed docstring for this function.") ChangeSequence;
		GeomPlate_SequenceOfPointConstraint & ChangeSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_GeomPlate_HSequenceOfPointConstraint

No detailed docstring for this function.") ShallowCopy;
		Handle_GeomPlate_HSequenceOfPointConstraint ShallowCopy ();
};


%feature("shadow") GeomPlate_HSequenceOfPointConstraint::~GeomPlate_HSequenceOfPointConstraint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomPlate_HSequenceOfPointConstraint {
	void _kill_pointed() {
		delete $self;
	}
};
%extend GeomPlate_HSequenceOfPointConstraint {
	Handle_GeomPlate_HSequenceOfPointConstraint GetHandle() {
	return *(Handle_GeomPlate_HSequenceOfPointConstraint*) &$self;
	}
};

%nodefaultctor Handle_GeomPlate_HSequenceOfPointConstraint;
class Handle_GeomPlate_HSequenceOfPointConstraint : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_GeomPlate_HSequenceOfPointConstraint();
        Handle_GeomPlate_HSequenceOfPointConstraint(const Handle_GeomPlate_HSequenceOfPointConstraint &aHandle);
        Handle_GeomPlate_HSequenceOfPointConstraint(const GeomPlate_HSequenceOfPointConstraint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_GeomPlate_HSequenceOfPointConstraint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_GeomPlate_HSequenceOfPointConstraint {
    GeomPlate_HSequenceOfPointConstraint* GetObject() {
    return (GeomPlate_HSequenceOfPointConstraint*)$self->Access();
    }
};
%feature("shadow") Handle_GeomPlate_HSequenceOfPointConstraint::~Handle_GeomPlate_HSequenceOfPointConstraint %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_GeomPlate_HSequenceOfPointConstraint {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor GeomPlate_MakeApprox;
class GeomPlate_MakeApprox {
	public:
		%feature("autodoc", "Args:
	SurfPlate(Handle_GeomPlate_Surface)
	PlateCrit(AdvApp2Var_Criterion)
	Tol3d(Standard_Real)
	Nbmax(Standard_Integer)
	dgmax(Standard_Integer)
	Continuity(GeomAbs_Shape)=GeomAbs_C1
	EnlargeCoeff(Standard_Real)=1.1

Returns:
	None

Converts SurfPlate into a Geom_BSplineSurface with  
 n Bezier pieces (n<=Nbmax) of degree <= dgmax  
 and an approximation error < Tol3d if possible  
 the criterion CritPlate is satisfied if possible") GeomPlate_MakeApprox;
		 GeomPlate_MakeApprox (const Handle_GeomPlate_Surface & SurfPlate,const AdvApp2Var_Criterion & PlateCrit,const Standard_Real Tol3d,const Standard_Integer Nbmax,const Standard_Integer dgmax,const GeomAbs_Shape Continuity = GeomAbs_C1,const Standard_Real EnlargeCoeff = 1.1);
		%feature("autodoc", "Args:
	SurfPlate(Handle_GeomPlate_Surface)
	Tol3d(Standard_Real)
	Nbmax(Standard_Integer)
	dgmax(Standard_Integer)
	dmax(Standard_Real)
	CritOrder(Standard_Integer)=0
	Continuity(GeomAbs_Shape)=GeomAbs_C1
	EnlargeCoeff(Standard_Real)=1.1

Returns:
	None

Converts SurfPlate into a Geom_BSplineSurface with  
 n Bezier pieces (n<=Nbmax) of degree <= dgmax  
 and an approximation error < Tol3d if possible  
 if CritOrder = -1 , no criterion is used  
 if CritOrder = 0 , a PlateG0Criterion is used with max value > 10*dmax  
 if CritOrder = 1 , a PlateG1Criterion is used with max value > 10*dmax  
 WARNING : for CritOrder = 0 or 1, only the constraints points of SurfPlate  
           are used to evaluate the value of the criterion") GeomPlate_MakeApprox;
		 GeomPlate_MakeApprox (const Handle_GeomPlate_Surface & SurfPlate,const Standard_Real Tol3d,const Standard_Integer Nbmax,const Standard_Integer dgmax,const Standard_Real dmax,const Standard_Integer CritOrder = 0,const GeomAbs_Shape Continuity = GeomAbs_C1,const Standard_Real EnlargeCoeff = 1.1);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_BSplineSurface

Returns the BSpline surface extracted from the  
         GeomPlate_MakeApprox object.") Surface;
		Handle_Geom_BSplineSurface Surface ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the error in computation of the approximation  
         surface. This is the distance between the entire target  
         BSpline surface and the entire original surface  
         generated by BuildPlateSurface and converted by GeomPlate_Surface.") ApproxError;
		Standard_Real ApproxError ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the criterion error in computation of the  
         approximation surface. This is estimated relative to the  
         curve and point constraints only.") CriterionError;
		Standard_Real CriterionError ();
};


%feature("shadow") GeomPlate_MakeApprox::~GeomPlate_MakeApprox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomPlate_MakeApprox {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GeomPlate_PlateG0Criterion;
class GeomPlate_PlateG0Criterion : public AdvApp2Var_Criterion {
	public:
		%feature("autodoc", "Args:
	Data(TColgp_SequenceOfXY)
	G0Data(TColgp_SequenceOfXYZ)
	Maximum(Standard_Real)
	Type(AdvApp2Var_CriterionType)=AdvApp2Var_Absolute
	Repart(AdvApp2Var_CriterionRepartition)=AdvApp2Var_Regular

Returns:
	None

No detailed docstring for this function.") GeomPlate_PlateG0Criterion;
		 GeomPlate_PlateG0Criterion (const TColgp_SequenceOfXY & Data,const TColgp_SequenceOfXYZ & G0Data,const Standard_Real Maximum,const AdvApp2Var_CriterionType Type = AdvApp2Var_Absolute,const AdvApp2Var_CriterionRepartition Repart = AdvApp2Var_Regular);
		%feature("autodoc", "Args:
	P(AdvApp2Var_Patch)
	C(AdvApp2Var_Context)

Returns:
	virtual void

No detailed docstring for this function.") Value;
		virtual void Value (AdvApp2Var_Patch & P,const AdvApp2Var_Context & C);
		%feature("autodoc", "Args:
	P(AdvApp2Var_Patch)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsSatisfied;
		virtual Standard_Boolean IsSatisfied (const AdvApp2Var_Patch & P);
};


%feature("shadow") GeomPlate_PlateG0Criterion::~GeomPlate_PlateG0Criterion %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomPlate_PlateG0Criterion {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GeomPlate_PlateG1Criterion;
class GeomPlate_PlateG1Criterion : public AdvApp2Var_Criterion {
	public:
		%feature("autodoc", "Args:
	Data(TColgp_SequenceOfXY)
	G1Data(TColgp_SequenceOfXYZ)
	Maximum(Standard_Real)
	Type(AdvApp2Var_CriterionType)=AdvApp2Var_Absolute
	Repart(AdvApp2Var_CriterionRepartition)=AdvApp2Var_Regular

Returns:
	None

No detailed docstring for this function.") GeomPlate_PlateG1Criterion;
		 GeomPlate_PlateG1Criterion (const TColgp_SequenceOfXY & Data,const TColgp_SequenceOfXYZ & G1Data,const Standard_Real Maximum,const AdvApp2Var_CriterionType Type = AdvApp2Var_Absolute,const AdvApp2Var_CriterionRepartition Repart = AdvApp2Var_Regular);
		%feature("autodoc", "Args:
	P(AdvApp2Var_Patch)
	C(AdvApp2Var_Context)

Returns:
	virtual void

No detailed docstring for this function.") Value;
		virtual void Value (AdvApp2Var_Patch & P,const AdvApp2Var_Context & C);
		%feature("autodoc", "Args:
	P(AdvApp2Var_Patch)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsSatisfied;
		virtual Standard_Boolean IsSatisfied (const AdvApp2Var_Patch & P);
};


%feature("shadow") GeomPlate_PlateG1Criterion::~GeomPlate_PlateG1Criterion %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomPlate_PlateG1Criterion {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GeomPlate_PointConstraint;
class GeomPlate_PointConstraint : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Pt(gp_Pnt)
	Order(Standard_Integer)
	TolDist(Standard_Real)=0.0001

Returns:
	None

Constructs a point constraint object defined by  Pt, a 3D point  
  Order gives the order of constraint, one of:  
-   -1 i.e. none, or 0 i.e.G0 when assigned to Pt  
-   -1 i.e. none, 0 i.e. G0, 1 i.e. G1, 2 i.e. G2 when  
  assigned to U, V and Surf.  
In this constructor, only TolDist is given.  
Distance tolerance represents the greatest distance  
allowed between the constraint and the target surface.  
Angular tolerance represents the largest angle allowed  
between the constraint and the target surface. Curvature  
tolerance represents the greatest difference in curvature  
allowed between the constraint and the target surface.  
Raises   ConstructionError if Order  is  not  0  or  -1") GeomPlate_PointConstraint;
		 GeomPlate_PointConstraint (const gp_Pnt & Pt,const Standard_Integer Order,const Standard_Real TolDist = 0.0001);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Surf(Handle_Geom_Surface)
	Order(Standard_Integer)
	TolDist(Standard_Real)=0.0001
	TolAng(Standard_Real)=0.01
	TolCurv(Standard_Real)=0.1

Returns:
	None

Constructs a point constraint object defined by  
the intersection point of U and V on the surface Surf.  
  Order gives the order of constraint, one of:  
-   -1 i.e. none, or 0 i.e.G0 when assigned to Pt  
-   -1 i.e. none, 0 i.e. G0, 1 i.e. G1, 2 i.e. G2 when  
  assigned to U, V and Surf.  
In this constructor the surface to be generated must  
respect several tolerance values only:  
-   the distance tolerance TolDist  
-   the angular tolerance TolAng  
-   the curvature tolerance, TolCurv.  
Distance tolerance represents the greatest distance  
allowed between the constraint and the target surface.  
Angular tolerance represents the largest angle allowed  
between the constraint and the target surface. Curvature  
tolerance represents the greatest difference in curvature  
allowed between the constraint and the target surface.Creates a punctual constraint.") GeomPlate_PointConstraint;
		 GeomPlate_PointConstraint (const Standard_Real U,const Standard_Real V,const Handle_Geom_Surface & Surf,const Standard_Integer Order,const Standard_Real TolDist = 0.0001,const Standard_Real TolAng = 0.01,const Standard_Real TolCurv = 0.1);
		%feature("autodoc", "Args:
	Order(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetOrder;
		void SetOrder (const Standard_Integer Order);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the order of constraint: G0, G1, and G2,  
controlled respectively by G0Criterion G1Criterion and G2Criterion.") Order;
		Standard_Integer Order ();
		%feature("autodoc", "Args:
	TolDist(Standard_Real)

Returns:
	None

Allows you to set the G0 criterion. This is the law  
defining the greatest distance allowed between the  
constraint and the target surface. If this criterion is not  
set, {TolDist, the distance tolerance from the constructor, is used") SetG0Criterion;
		void SetG0Criterion (const Standard_Real TolDist);
		%feature("autodoc", "Args:
	TolAng(Standard_Real)

Returns:
	None

Allows you to set the G1 criterion. This is the law  
defining the greatest angle allowed between the  
constraint and the target surface. If this criterion is not  
set, TolAng, the angular tolerance from the constructor, is used.  
Raises   ConstructionError  if  the  point  is  not  on  the  surface") SetG1Criterion;
		void SetG1Criterion (const Standard_Real TolAng);
		%feature("autodoc", "Args:
	TolCurv(Standard_Real)

Returns:
	None

Allows you to set the G2 criterion. This is the law  
defining the greatest difference in curvature allowed  
between the constraint and the target surface. If this  
criterion is not set, TolCurv, the curvature tolerance from  
the constructor, is used.  
Raises   ConstructionError if  the  point  is  not  on  the  surface") SetG2Criterion;
		void SetG2Criterion (const Standard_Real TolCurv);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the G0 criterion. This is the greatest distance  
allowed between the constraint and the target surface.") G0Criterion;
		Standard_Real G0Criterion ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the G1 criterion. This is the greatest angle  
allowed between the constraint and the target surface.  
Raises   ConstructionError if  the  point  is  not  on  the  surface.") G1Criterion;
		Standard_Real G1Criterion ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the G2 criterion. This is the greatest difference  
in curvature allowed between the constraint and the target surface.  
Raises   ConstructionError if  the  point  is  not  on  the  surface") G2Criterion;
		Standard_Real G2Criterion ();
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") D0;
		void D0 (gp_Pnt & P);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)

Returns:
	None

No detailed docstring for this function.") D1;
		void D1 (gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)
	V3(gp_Vec)
	V4(gp_Vec)
	V5(gp_Vec)

Returns:
	None

No detailed docstring for this function.") D2;
		void D2 (gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3,gp_Vec & V4,gp_Vec & V5);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") HasPnt2dOnSurf;
		Standard_Boolean HasPnt2dOnSurf ();
		%feature("autodoc", "Args:
	Pnt(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") SetPnt2dOnSurf;
		void SetPnt2dOnSurf (const gp_Pnt2d & Pnt);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

No detailed docstring for this function.") Pnt2dOnSurf;
		gp_Pnt2d Pnt2dOnSurf ();
		%feature("autodoc", "Args:
	None
Returns:
	GeomLProp_SLProps

No detailed docstring for this function.") LPropSurf;
		GeomLProp_SLProps & LPropSurf ();
};


%feature("shadow") GeomPlate_PointConstraint::~GeomPlate_PointConstraint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomPlate_PointConstraint {
	void _kill_pointed() {
		delete $self;
	}
};
%extend GeomPlate_PointConstraint {
	Handle_GeomPlate_PointConstraint GetHandle() {
	return *(Handle_GeomPlate_PointConstraint*) &$self;
	}
};

%nodefaultctor Handle_GeomPlate_PointConstraint;
class Handle_GeomPlate_PointConstraint : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_GeomPlate_PointConstraint();
        Handle_GeomPlate_PointConstraint(const Handle_GeomPlate_PointConstraint &aHandle);
        Handle_GeomPlate_PointConstraint(const GeomPlate_PointConstraint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_GeomPlate_PointConstraint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_GeomPlate_PointConstraint {
    GeomPlate_PointConstraint* GetObject() {
    return (GeomPlate_PointConstraint*)$self->Access();
    }
};
%feature("shadow") Handle_GeomPlate_PointConstraint::~Handle_GeomPlate_PointConstraint %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_GeomPlate_PointConstraint {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor GeomPlate_SequenceNodeOfSequenceOfAij;
class GeomPlate_SequenceNodeOfSequenceOfAij : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(GeomPlate_Aij)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") GeomPlate_SequenceNodeOfSequenceOfAij;
		 GeomPlate_SequenceNodeOfSequenceOfAij (const GeomPlate_Aij & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	GeomPlate_Aij

No detailed docstring for this function.") Value;
		GeomPlate_Aij & Value ();
};


%feature("shadow") GeomPlate_SequenceNodeOfSequenceOfAij::~GeomPlate_SequenceNodeOfSequenceOfAij %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomPlate_SequenceNodeOfSequenceOfAij {
	void _kill_pointed() {
		delete $self;
	}
};
%extend GeomPlate_SequenceNodeOfSequenceOfAij {
	Handle_GeomPlate_SequenceNodeOfSequenceOfAij GetHandle() {
	return *(Handle_GeomPlate_SequenceNodeOfSequenceOfAij*) &$self;
	}
};

%nodefaultctor Handle_GeomPlate_SequenceNodeOfSequenceOfAij;
class Handle_GeomPlate_SequenceNodeOfSequenceOfAij : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_GeomPlate_SequenceNodeOfSequenceOfAij();
        Handle_GeomPlate_SequenceNodeOfSequenceOfAij(const Handle_GeomPlate_SequenceNodeOfSequenceOfAij &aHandle);
        Handle_GeomPlate_SequenceNodeOfSequenceOfAij(const GeomPlate_SequenceNodeOfSequenceOfAij *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_GeomPlate_SequenceNodeOfSequenceOfAij DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_GeomPlate_SequenceNodeOfSequenceOfAij {
    GeomPlate_SequenceNodeOfSequenceOfAij* GetObject() {
    return (GeomPlate_SequenceNodeOfSequenceOfAij*)$self->Access();
    }
};
%feature("shadow") Handle_GeomPlate_SequenceNodeOfSequenceOfAij::~Handle_GeomPlate_SequenceNodeOfSequenceOfAij %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_GeomPlate_SequenceNodeOfSequenceOfAij {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor GeomPlate_SequenceNodeOfSequenceOfCurveConstraint;
class GeomPlate_SequenceNodeOfSequenceOfCurveConstraint : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_GeomPlate_CurveConstraint)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") GeomPlate_SequenceNodeOfSequenceOfCurveConstraint;
		 GeomPlate_SequenceNodeOfSequenceOfCurveConstraint (const Handle_GeomPlate_CurveConstraint & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_GeomPlate_CurveConstraint

No detailed docstring for this function.") Value;
		Handle_GeomPlate_CurveConstraint & Value ();
};


%feature("shadow") GeomPlate_SequenceNodeOfSequenceOfCurveConstraint::~GeomPlate_SequenceNodeOfSequenceOfCurveConstraint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomPlate_SequenceNodeOfSequenceOfCurveConstraint {
	void _kill_pointed() {
		delete $self;
	}
};
%extend GeomPlate_SequenceNodeOfSequenceOfCurveConstraint {
	Handle_GeomPlate_SequenceNodeOfSequenceOfCurveConstraint GetHandle() {
	return *(Handle_GeomPlate_SequenceNodeOfSequenceOfCurveConstraint*) &$self;
	}
};

%nodefaultctor Handle_GeomPlate_SequenceNodeOfSequenceOfCurveConstraint;
class Handle_GeomPlate_SequenceNodeOfSequenceOfCurveConstraint : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_GeomPlate_SequenceNodeOfSequenceOfCurveConstraint();
        Handle_GeomPlate_SequenceNodeOfSequenceOfCurveConstraint(const Handle_GeomPlate_SequenceNodeOfSequenceOfCurveConstraint &aHandle);
        Handle_GeomPlate_SequenceNodeOfSequenceOfCurveConstraint(const GeomPlate_SequenceNodeOfSequenceOfCurveConstraint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_GeomPlate_SequenceNodeOfSequenceOfCurveConstraint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_GeomPlate_SequenceNodeOfSequenceOfCurveConstraint {
    GeomPlate_SequenceNodeOfSequenceOfCurveConstraint* GetObject() {
    return (GeomPlate_SequenceNodeOfSequenceOfCurveConstraint*)$self->Access();
    }
};
%feature("shadow") Handle_GeomPlate_SequenceNodeOfSequenceOfCurveConstraint::~Handle_GeomPlate_SequenceNodeOfSequenceOfCurveConstraint %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_GeomPlate_SequenceNodeOfSequenceOfCurveConstraint {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor GeomPlate_SequenceNodeOfSequenceOfPointConstraint;
class GeomPlate_SequenceNodeOfSequenceOfPointConstraint : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_GeomPlate_PointConstraint)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") GeomPlate_SequenceNodeOfSequenceOfPointConstraint;
		 GeomPlate_SequenceNodeOfSequenceOfPointConstraint (const Handle_GeomPlate_PointConstraint & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_GeomPlate_PointConstraint

No detailed docstring for this function.") Value;
		Handle_GeomPlate_PointConstraint & Value ();
};


%feature("shadow") GeomPlate_SequenceNodeOfSequenceOfPointConstraint::~GeomPlate_SequenceNodeOfSequenceOfPointConstraint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomPlate_SequenceNodeOfSequenceOfPointConstraint {
	void _kill_pointed() {
		delete $self;
	}
};
%extend GeomPlate_SequenceNodeOfSequenceOfPointConstraint {
	Handle_GeomPlate_SequenceNodeOfSequenceOfPointConstraint GetHandle() {
	return *(Handle_GeomPlate_SequenceNodeOfSequenceOfPointConstraint*) &$self;
	}
};

%nodefaultctor Handle_GeomPlate_SequenceNodeOfSequenceOfPointConstraint;
class Handle_GeomPlate_SequenceNodeOfSequenceOfPointConstraint : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_GeomPlate_SequenceNodeOfSequenceOfPointConstraint();
        Handle_GeomPlate_SequenceNodeOfSequenceOfPointConstraint(const Handle_GeomPlate_SequenceNodeOfSequenceOfPointConstraint &aHandle);
        Handle_GeomPlate_SequenceNodeOfSequenceOfPointConstraint(const GeomPlate_SequenceNodeOfSequenceOfPointConstraint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_GeomPlate_SequenceNodeOfSequenceOfPointConstraint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_GeomPlate_SequenceNodeOfSequenceOfPointConstraint {
    GeomPlate_SequenceNodeOfSequenceOfPointConstraint* GetObject() {
    return (GeomPlate_SequenceNodeOfSequenceOfPointConstraint*)$self->Access();
    }
};
%feature("shadow") Handle_GeomPlate_SequenceNodeOfSequenceOfPointConstraint::~Handle_GeomPlate_SequenceNodeOfSequenceOfPointConstraint %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_GeomPlate_SequenceNodeOfSequenceOfPointConstraint {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor GeomPlate_SequenceOfAij;
class GeomPlate_SequenceOfAij : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") GeomPlate_SequenceOfAij;
		 GeomPlate_SequenceOfAij ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(GeomPlate_SequenceOfAij)

Returns:
	GeomPlate_SequenceOfAij

No detailed docstring for this function.") Assign;
		const GeomPlate_SequenceOfAij & Assign (const GeomPlate_SequenceOfAij & Other);
		%feature("autodoc", "Args:
	Other(GeomPlate_SequenceOfAij)

Returns:
	GeomPlate_SequenceOfAij

No detailed docstring for this function.") operator=;
		const GeomPlate_SequenceOfAij & operator = (const GeomPlate_SequenceOfAij & Other);
		%feature("autodoc", "Args:
	T(GeomPlate_Aij)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const GeomPlate_Aij & T);
		%feature("autodoc", "Args:
	S(GeomPlate_SequenceOfAij)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (GeomPlate_SequenceOfAij & S);
		%feature("autodoc", "Args:
	T(GeomPlate_Aij)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const GeomPlate_Aij & T);
		%feature("autodoc", "Args:
	S(GeomPlate_SequenceOfAij)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (GeomPlate_SequenceOfAij & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(GeomPlate_Aij)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const GeomPlate_Aij & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(GeomPlate_SequenceOfAij)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,GeomPlate_SequenceOfAij & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(GeomPlate_Aij)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const GeomPlate_Aij & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(GeomPlate_SequenceOfAij)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,GeomPlate_SequenceOfAij & S);
		%feature("autodoc", "Args:
	None
Returns:
	GeomPlate_Aij

No detailed docstring for this function.") First;
		const GeomPlate_Aij & First ();
		%feature("autodoc", "Args:
	None
Returns:
	GeomPlate_Aij

No detailed docstring for this function.") Last;
		const GeomPlate_Aij & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(GeomPlate_SequenceOfAij)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,GeomPlate_SequenceOfAij & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	GeomPlate_Aij

No detailed docstring for this function.") Value;
		const GeomPlate_Aij & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(GeomPlate_Aij)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const GeomPlate_Aij & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	GeomPlate_Aij

No detailed docstring for this function.") ChangeValue;
		GeomPlate_Aij & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") GeomPlate_SequenceOfAij::~GeomPlate_SequenceOfAij %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomPlate_SequenceOfAij {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GeomPlate_SequenceOfCurveConstraint;
class GeomPlate_SequenceOfCurveConstraint : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") GeomPlate_SequenceOfCurveConstraint;
		 GeomPlate_SequenceOfCurveConstraint ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(GeomPlate_SequenceOfCurveConstraint)

Returns:
	GeomPlate_SequenceOfCurveConstraint

No detailed docstring for this function.") Assign;
		const GeomPlate_SequenceOfCurveConstraint & Assign (const GeomPlate_SequenceOfCurveConstraint & Other);
		%feature("autodoc", "Args:
	Other(GeomPlate_SequenceOfCurveConstraint)

Returns:
	GeomPlate_SequenceOfCurveConstraint

No detailed docstring for this function.") operator=;
		const GeomPlate_SequenceOfCurveConstraint & operator = (const GeomPlate_SequenceOfCurveConstraint & Other);
		%feature("autodoc", "Args:
	T(Handle_GeomPlate_CurveConstraint)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_GeomPlate_CurveConstraint & T);
		%feature("autodoc", "Args:
	S(GeomPlate_SequenceOfCurveConstraint)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (GeomPlate_SequenceOfCurveConstraint & S);
		%feature("autodoc", "Args:
	T(Handle_GeomPlate_CurveConstraint)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_GeomPlate_CurveConstraint & T);
		%feature("autodoc", "Args:
	S(GeomPlate_SequenceOfCurveConstraint)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (GeomPlate_SequenceOfCurveConstraint & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_GeomPlate_CurveConstraint)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_GeomPlate_CurveConstraint & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(GeomPlate_SequenceOfCurveConstraint)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,GeomPlate_SequenceOfCurveConstraint & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_GeomPlate_CurveConstraint)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_GeomPlate_CurveConstraint & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(GeomPlate_SequenceOfCurveConstraint)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,GeomPlate_SequenceOfCurveConstraint & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_GeomPlate_CurveConstraint

No detailed docstring for this function.") First;
		const Handle_GeomPlate_CurveConstraint & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_GeomPlate_CurveConstraint

No detailed docstring for this function.") Last;
		const Handle_GeomPlate_CurveConstraint & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(GeomPlate_SequenceOfCurveConstraint)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,GeomPlate_SequenceOfCurveConstraint & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_GeomPlate_CurveConstraint

No detailed docstring for this function.") Value;
		const Handle_GeomPlate_CurveConstraint & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_GeomPlate_CurveConstraint)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_GeomPlate_CurveConstraint & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_GeomPlate_CurveConstraint

No detailed docstring for this function.") ChangeValue;
		Handle_GeomPlate_CurveConstraint & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") GeomPlate_SequenceOfCurveConstraint::~GeomPlate_SequenceOfCurveConstraint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomPlate_SequenceOfCurveConstraint {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GeomPlate_SequenceOfPointConstraint;
class GeomPlate_SequenceOfPointConstraint : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") GeomPlate_SequenceOfPointConstraint;
		 GeomPlate_SequenceOfPointConstraint ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(GeomPlate_SequenceOfPointConstraint)

Returns:
	GeomPlate_SequenceOfPointConstraint

No detailed docstring for this function.") Assign;
		const GeomPlate_SequenceOfPointConstraint & Assign (const GeomPlate_SequenceOfPointConstraint & Other);
		%feature("autodoc", "Args:
	Other(GeomPlate_SequenceOfPointConstraint)

Returns:
	GeomPlate_SequenceOfPointConstraint

No detailed docstring for this function.") operator=;
		const GeomPlate_SequenceOfPointConstraint & operator = (const GeomPlate_SequenceOfPointConstraint & Other);
		%feature("autodoc", "Args:
	T(Handle_GeomPlate_PointConstraint)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_GeomPlate_PointConstraint & T);
		%feature("autodoc", "Args:
	S(GeomPlate_SequenceOfPointConstraint)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (GeomPlate_SequenceOfPointConstraint & S);
		%feature("autodoc", "Args:
	T(Handle_GeomPlate_PointConstraint)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_GeomPlate_PointConstraint & T);
		%feature("autodoc", "Args:
	S(GeomPlate_SequenceOfPointConstraint)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (GeomPlate_SequenceOfPointConstraint & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_GeomPlate_PointConstraint)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_GeomPlate_PointConstraint & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(GeomPlate_SequenceOfPointConstraint)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,GeomPlate_SequenceOfPointConstraint & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_GeomPlate_PointConstraint)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_GeomPlate_PointConstraint & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(GeomPlate_SequenceOfPointConstraint)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,GeomPlate_SequenceOfPointConstraint & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_GeomPlate_PointConstraint

No detailed docstring for this function.") First;
		const Handle_GeomPlate_PointConstraint & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_GeomPlate_PointConstraint

No detailed docstring for this function.") Last;
		const Handle_GeomPlate_PointConstraint & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(GeomPlate_SequenceOfPointConstraint)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,GeomPlate_SequenceOfPointConstraint & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_GeomPlate_PointConstraint

No detailed docstring for this function.") Value;
		const Handle_GeomPlate_PointConstraint & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_GeomPlate_PointConstraint)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_GeomPlate_PointConstraint & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_GeomPlate_PointConstraint

No detailed docstring for this function.") ChangeValue;
		Handle_GeomPlate_PointConstraint & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") GeomPlate_SequenceOfPointConstraint::~GeomPlate_SequenceOfPointConstraint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomPlate_SequenceOfPointConstraint {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GeomPlate_Surface;
class GeomPlate_Surface : public Geom_Surface {
	public:
		%feature("autodoc", "Args:
	Surfinit(Handle_Geom_Surface)
	Surfinter(Plate_Plate)

Returns:
	None

No detailed docstring for this function.") GeomPlate_Surface;
		 GeomPlate_Surface (const Handle_Geom_Surface & Surfinit,const Plate_Plate & Surfinter);
		%feature("autodoc", "Args:
	None
Returns:
	None

Reverses the U direction of parametrization of <self>.  
 The bounds of the surface are not modified.") UReverse;
		void UReverse ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Standard_Real

Return the  parameter on the  Ureversed surface for  
         the point of parameter U on <self>.  
 
         me->UReversed()->Value(me->UReversedParameter(U),V)  
 
         is the same point as  
 
         me->Value(U,V)") UReversedParameter;
		Standard_Real UReversedParameter (const Standard_Real U);
		%feature("autodoc", "Args:
	None
Returns:
	None

Reverses the V direction of parametrization of <self>.  
 The bounds of the surface are not modified.") VReverse;
		void VReverse ();
		%feature("autodoc", "Args:
	V(Standard_Real)

Returns:
	Standard_Real

Return the  parameter on the  Vreversed surface for  
         the point of parameter V on <self>.  
 
         me->VReversed()->Value(U,me->VReversedParameter(V))  
 
         is the same point as  
 
         me->Value(U,V)") VReversedParameter;
		Standard_Real VReversedParameter (const Standard_Real V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	T(gp_Trsf)

Returns:
	virtual void

Computes the  parameters on the  transformed  surface for  
         the transform of the point of parameters U,V on <self>.  
 
         me->Transformed(T)->Value(U',V')  
 
         is the same point as  
 
         me->Value(U,V).Transformed(T)  
 
         Where U',V' are the new values of U,V after calling  
 
         me->TranformParameters(U,V,T)  
 
         This methods does not change <U> and <V>  
 
         It  can be redefined.  For  example on  the Plane,  
         Cylinder, Cone, Revolved and Extruded surfaces.") TransformParameters;
		virtual void TransformParameters (Standard_Real &OutValue,Standard_Real &OutValue,const gp_Trsf & T);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	virtual gp_GTrsf2d

Returns a 2d transformation  used to find the  new  
         parameters of a point on the transformed surface.  
 
         me->Transformed(T)->Value(U',V')  
 
         is the same point as  
 
         me->Value(U,V).Transformed(T)  
 
         Where U',V' are  obtained by transforming U,V with  
         th 2d transformation returned by  
 
         me->ParametricTransformation(T)  
 
         This methods returns an identity transformation  
 
         It  can be redefined.  For  example on  the Plane,  
         Cylinder, Cone, Revolved and Extruded surfaces.") ParametricTransformation;
		virtual gp_GTrsf2d ParametricTransformation (const gp_Trsf & T);
		%feature("autodoc", "Args:
	U1(Standard_Real)
	U2(Standard_Real)
	V1(Standard_Real)
	V2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Bounds;
		void Bounds (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Is the surface closed in the parametric direction U ?  
 Returns True if for each parameter V  the distance  
 between the point P (UFirst, V) and P (ULast, V) is  
 lower or equal to Resolution from gp.  UFirst and ULast  
 are the parametric bounds in the U direction.") IsUClosed;
		Standard_Boolean IsUClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Is the surface closed in the parametric direction V ?  
 Returns True if for each parameter U  the distance  
 between the point P (U, VFirst) and  P (U, VLast) is  
 lower or equal to Resolution from gp.  VFirst and VLast  
 are the parametric bounds in the V direction.") IsVClosed;
		Standard_Boolean IsVClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Is the parametrization of a surface periodic in the  
 direction U ?  
 It is possible only if the surface is closed in this  
 parametric direction and if the following relation is  
 satisfied :  
 for each parameter V the distance between the point  
 P (U, V)  and the point  P (U + T, V) is lower or equal  
 to Resolution from package gp. T is the parametric period  
 and must be a constant.") IsUPeriodic;
		Standard_Boolean IsUPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

returns the Uperiod.  raises if the surface is not uperiodic.") UPeriod;
		virtual Standard_Real UPeriod ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Is the parametrization of a surface periodic in the  
 direction U ?  
 It is possible only if the surface is closed in this  
 parametric direction and if the following relation is  
 satisfied :  
 for each parameter V the distance between the point  
 P (U, V)  and the point  P (U + T, V) is lower or equal  
 to Resolution from package gp. T is the parametric period  
 and must be a constant.") IsVPeriodic;
		Standard_Boolean IsVPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

returns the Vperiod.  raises if the surface is not vperiodic.") VPeriod;
		virtual Standard_Real VPeriod ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Handle_Geom_Curve

Computes the U isoparametric curve.") UIso;
		Handle_Geom_Curve UIso (const Standard_Real U);
		%feature("autodoc", "Args:
	V(Standard_Real)

Returns:
	Handle_Geom_Curve

Computes the V isoparametric curve.") VIso;
		Handle_Geom_Curve VIso (const Standard_Real V);
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_Shape

Global Continuity of the surface in direction U and V :  
 C0 : only geometric continuity,  
 C1 : continuity of the first derivative all along the surface,  
 C2 : continuity of the second derivative all along the surface,  
 C3 : continuity of the third derivative all along the surface,  
 G1 : tangency continuity all along the surface,  
 G2 : curvature continuity all along the surface,  
 CN : the order of continuity is infinite.  
Example :  
 If the surface is C1 in the V parametric direction and C2  
 in the U parametric direction Shape = C1.") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Boolean

Returns the order of continuity of the surface in the  
 U parametric direction.  Raised if N < 0.") IsCNu;
		Standard_Boolean IsCNu (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Boolean

Returns the order of continuity of the surface in the  
 V parametric direction.  Raised if N < 0.") IsCNv;
		Standard_Boolean IsCNv (const Standard_Integer N);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)

Returns:
	None

Computes the point of parameter U,V on the surface.  
 Raised only for an 'OffsetSurface' if it is not possible to  
 compute the current point.") D0;
		void D0 (const Standard_Real U,const Standard_Real V,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)

Returns:
	None

Computes the point P and the first derivatives in the  
 directions U and V at this point.  Raised if the continuity of the surface is not C1.") D1;
		void D1 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	D2UV(gp_Vec)

Returns:
	None

Computes the point P, the first and the second derivatives in  
 the directions U and V at this point.  Raised if the continuity of the surface is not C2.") D2;
		void D2 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	D2UV(gp_Vec)
	D3U(gp_Vec)
	D3V(gp_Vec)
	D3UUV(gp_Vec)
	D3UVV(gp_Vec)

Returns:
	None

Computes the point P, the first,the second and the third  
 derivatives in the directions U and V at this point.  Raised if the continuity of the surface is not C2.") D3;
		void D3 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV,gp_Vec & D3U,gp_Vec & D3V,gp_Vec & D3UUV,gp_Vec & D3UVV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Nu(Standard_Integer)
	Nv(Standard_Integer)

Returns:
	gp_Vec

//!---Purpose ;  
 Computes the derivative of order Nu in the direction U and Nv  
 in the direction V at the point P(U, V).  
 Raised if the continuity of the surface is not CNu in the U  
 direction or not CNv in the V direction.  Raised if Nu + Nv < 1 or Nu < 0 or Nv < 0.") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Real V,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Geometry

No detailed docstring for this function.") Copy;
		Handle_Geom_Geometry Copy ();
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

Transformation of a geometric object. This tansformation  
 can be a translation, a rotation, a symmetry, a scaling  
 or a complex transformation obtained by combination of  
 the previous elementaries transformations.  
 (see class Transformation of the package Geom).") Transform;
		void Transform (const gp_Trsf & T);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Surface

No detailed docstring for this function.") CallSurfinit;
		Handle_Geom_Surface CallSurfinit ();
		%feature("autodoc", "Args:
	Umin(Standard_Real)
	Umax(Standard_Real)
	Vmin(Standard_Real)
	Vmax(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetBounds;
		void SetBounds (const Standard_Real Umin,const Standard_Real Umax,const Standard_Real Vmin,const Standard_Real Vmax);
		%feature("autodoc", "Args:
	U1(Standard_Real)
	U2(Standard_Real)
	V1(Standard_Real)
	V2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") RealBounds;
		void RealBounds (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Seq(TColgp_SequenceOfXY)

Returns:
	None

No detailed docstring for this function.") Constraints;
		void Constraints (TColgp_SequenceOfXY & Seq);
};


%feature("shadow") GeomPlate_Surface::~GeomPlate_Surface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomPlate_Surface {
	void _kill_pointed() {
		delete $self;
	}
};
%extend GeomPlate_Surface {
	Handle_GeomPlate_Surface GetHandle() {
	return *(Handle_GeomPlate_Surface*) &$self;
	}
};

%nodefaultctor Handle_GeomPlate_Surface;
class Handle_GeomPlate_Surface : public Handle_Geom_Surface {

    public:
        // constructors
        Handle_GeomPlate_Surface();
        Handle_GeomPlate_Surface(const Handle_GeomPlate_Surface &aHandle);
        Handle_GeomPlate_Surface(const GeomPlate_Surface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_GeomPlate_Surface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_GeomPlate_Surface {
    GeomPlate_Surface* GetObject() {
    return (GeomPlate_Surface*)$self->Access();
    }
};
%feature("shadow") Handle_GeomPlate_Surface::~Handle_GeomPlate_Surface %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_GeomPlate_Surface {
    void _kill_pointed() {
        delete $self;
    }
};

