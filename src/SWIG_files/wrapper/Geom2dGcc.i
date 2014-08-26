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
%module Geom2dGcc

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

%include Geom2dGcc_required_python_modules.i
%include Geom2dGcc_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(geom2dgcc) Geom2dGcc;
%nodefaultctor Geom2dGcc;
class Geom2dGcc {
	public:
		%feature("autodoc", "Args:
	Obj(Geom2dAdaptor_Curve)

Returns:
	static Geom2dGcc_QualifiedCurve

Constructs such a qualified curve that the relative  
position of the solution computed by a construction  
algorithm using the qualified curve to the circle or line is  
not qualified, i.e. all solutions apply.  
Warning  
Obj is an adapted curve, i.e. an object which is an interface between:  
-   the services provided by a 2D curve from the package Geom2d,  
-   and those required on the curve by a computation algorithm.  
 The adapted curve is created in the following way:  
Handle_Geom2d_Curve mycurve = ...  
;  
Geom2dAdaptor_Curve Obj ( mycurve )  
;  
The qualified curve is then constructed with this object:  
Geom2dGcc_QualifiedCurve  
myQCurve = Geom2dGcc::Unqualified(Obj);") Unqualified;
		static Geom2dGcc_QualifiedCurve Unqualified (const Geom2dAdaptor_Curve & Obj);
		%feature("autodoc", "Args:
	Obj(Geom2dAdaptor_Curve)

Returns:
	static Geom2dGcc_QualifiedCurve

Constructs such a qualified curve that the solution  
computed by a construction algorithm using the qualified  
curve encloses the curve.  
Warning  
Obj is an adapted curve, i.e. an object which is an interface between:  
-   the services provided by a 2D curve from the package Geom2d,  
-   and those required on the curve by a computation algorithm.  
The adapted curve is created in the following way:  
Handle_Geom2d_Curve mycurve = ...  
;  
Geom2dAdaptor_Curve Obj ( mycurve )  
;  
The qualified curve is then constructed with this object:  
Geom2dGcc_QualifiedCurve  
             myQCurve = Geom2dGcc::Enclosing(Obj);") Enclosing;
		static Geom2dGcc_QualifiedCurve Enclosing (const Geom2dAdaptor_Curve & Obj);
		%feature("autodoc", "Args:
	Obj(Geom2dAdaptor_Curve)

Returns:
	static Geom2dGcc_QualifiedCurve

Constructs such a qualified curve that the solution  
computed by a construction algorithm using the qualified  
curve is enclosed by the curve.  
Warning  
Obj is an adapted curve, i.e. an object which is an interface between:  
-   the services provided by a 2D curve from the package Geom2d,  
-   and those required on the curve by a computation algorithm.  
The adapted curve is created in the following way:  
Handle_Geom2d_Curve mycurve = ...  
;  
Geom2dAdaptor_Curve Obj ( mycurve )  
;  
The qualified curve is then constructed with this object:  
Geom2dGcc_QualifiedCurve  
             myQCurve = Geom2dGcc::Enclosed(Obj);") Enclosed;
		static Geom2dGcc_QualifiedCurve Enclosed (const Geom2dAdaptor_Curve & Obj);
		%feature("autodoc", "Args:
	Obj(Geom2dAdaptor_Curve)

Returns:
	static Geom2dGcc_QualifiedCurve

Constructs such a qualified curve that the solution  
computed by a construction algorithm using the qualified  
curve and the curve are external to one another.  
Warning  
Obj is an adapted curve, i.e. an object which is an interface between:  
-   the services provided by a 2D curve from the package Geom2d,  
-   and those required on the curve by a computation algorithm.  
The adapted curve is created in the following way:  
Handle_Geom2d_Curve mycurve = ...  
;  
Geom2dAdaptor_Curve Obj ( mycurve )  
;  
The qualified curve is then constructed with this object:  
Geom2dGcc_QualifiedCurve  
             myQCurve = Geom2dGcc::Outside(Obj);") Outside;
		static Geom2dGcc_QualifiedCurve Outside (const Geom2dAdaptor_Curve & Obj);
};


%feature("shadow") Geom2dGcc::~Geom2dGcc %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dGcc {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dGcc_Circ2d2TanOn;
class Geom2dGcc_Circ2d2TanOn {
	public:
		%feature("autodoc", "Args:
	Qualified1(Geom2dGcc_QualifiedCurve)
	Qualified2(Geom2dGcc_QualifiedCurve)
	OnCurve(Geom2dAdaptor_Curve)
	Tolerance(Standard_Real)
	Param1(Standard_Real)
	Param2(Standard_Real)
	ParamOn(Standard_Real)

Returns:
	None

This method implements the algorithms used to  
         create 2d circles TANgent to two curves and  
         having the center ON a 2d curve.  
         Param1 is the initial guess on the first curve QualifiedCurv.  
         Param1 is the initial guess on the second curve QualifiedCurv.  
         ParamOn is the initial guess on the center curve OnCurv.  
         Tolerance is used for the limit cases.") Geom2dGcc_Circ2d2TanOn;
		 Geom2dGcc_Circ2d2TanOn (const Geom2dGcc_QualifiedCurve & Qualified1,const Geom2dGcc_QualifiedCurve & Qualified2,const Geom2dAdaptor_Curve & OnCurve,const Standard_Real Tolerance,const Standard_Real Param1,const Standard_Real Param2,const Standard_Real ParamOn);
		%feature("autodoc", "Args:
	Qualified1(Geom2dGcc_QualifiedCurve)
	Point(Handle_Geom2d_Point)
	OnCurve(Geom2dAdaptor_Curve)
	Tolerance(Standard_Real)
	Param1(Standard_Real)
	ParamOn(Standard_Real)

Returns:
	None

This method implements the algorithms used to  
         create 2d circles TANgent to one curve and one point and  
         having the center ON a 2d curve.  
         Param1 is the initial guess on the first curve QualifiedCurv.  
         ParamOn is the initial guess on the center curve OnCurv.  
         Tolerance is used for the limit cases.") Geom2dGcc_Circ2d2TanOn;
		 Geom2dGcc_Circ2d2TanOn (const Geom2dGcc_QualifiedCurve & Qualified1,const Handle_Geom2d_Point & Point,const Geom2dAdaptor_Curve & OnCurve,const Standard_Real Tolerance,const Standard_Real Param1,const Standard_Real ParamOn);
		%feature("autodoc", "Args:
	Point1(Handle_Geom2d_Point)
	Point2(Handle_Geom2d_Point)
	OnCurve(Geom2dAdaptor_Curve)
	Tolerance(Standard_Real)

Returns:
	None

This method implements the algorithms used to  
         create 2d circles TANgent to two points and  
         having the center ON a 2d curve.  
         Tolerance is used for the limit cases.") Geom2dGcc_Circ2d2TanOn;
		 Geom2dGcc_Circ2d2TanOn (const Handle_Geom2d_Point & Point1,const Handle_Geom2d_Point & Point2,const Geom2dAdaptor_Curve & OnCurve,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Circ(GccAna_Circ2d2TanOn)

Returns:
	None

No detailed docstring for this function.") Results;
		void Results (const GccAna_Circ2d2TanOn & Circ);
		%feature("autodoc", "Args:
	Circ(Geom2dGcc_MyCirc2d2TanOn)

Returns:
	None

No detailed docstring for this function.") Results;
		void Results (const Geom2dGcc_MyCirc2d2TanOn & Circ);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the construction algorithm does not fail  
         (even if it finds no solution).  
         Note: IsDone protects against a failure arising from a  
         more internal intersection algorithm, which has  
         reached its numeric limits.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

This method returns the number of solutions.  
         NotDone is raised if the algorithm failed.") NbSolutions;
		Standard_Integer NbSolutions ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Circ2d

Returns the solution number Index and raises OutOfRange  
exception if Index is greater than the number of solutions.  
Be carefull: the Index is only a way to get all the  
solutions, but is not associated to theses outside the context  
of the algorithm-object.  
Exceptions  
Standard_OutOfRange if Index is less than or equal  
to zero or greater than the number of solutions  
computed by this algorithm.  
StdFail_NotDone if the construction fails.") ThisSolution;
		gp_Circ2d ThisSolution (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Qualif1(GccEnt_Position)
	Qualif2(GccEnt_Position)

Returns:
	None

It returns the informations about the qualifiers of  
         the tangency  
         arguments concerning the solution number Index.  
         It returns the real qualifiers (the qualifiers given to the  
         constructor method in case of enclosed, enclosing and outside  
         and the qualifiers computedin case of unqualified).  
Exceptions  
Standard_OutOfRange if Index is less than zero or  
greater than the number of solutions computed by this algorithm.  
StdFail_NotDone if the construction fails.") WhichQualifier;
		void WhichQualifier (const Standard_Integer Index,GccEnt_Position & Qualif1,GccEnt_Position & Qualif2);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	ParSol(Standard_Real)
	ParArg(Standard_Real)
	PntSol(gp_Pnt2d)

Returns:
	None

Returns informations about the tangency point between the  
result and the first argument.  
ParSol is the intrinsic parameter of the point PntSol on the solution curv.  
ParArg is the intrinsic parameter of the point PntSol on the argument curv.") Tangency1;
		void Tangency1 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	ParSol(Standard_Real)
	ParArg(Standard_Real)
	PntSol(gp_Pnt2d)

Returns:
	None

Returns informations about the tangency point between the  
result and the second argument.  
ParSol is the intrinsic parameter of the point PntSol on the solution curv.  
ParArg is the intrinsic parameter of the point PntSol on the argument curv.") Tangency2;
		void Tangency2 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	ParArg(Standard_Real)
	PntSol(gp_Pnt2d)

Returns:
	None

Returns the center PntSol of the solution of index Index  
computed by this algorithm.  
ParArg is the parameter of the point PntSol on the third argument.  
Exceptions  
Standard_OutOfRange if Index is less than zero or  
greater than the number of solutions computed by this algorithm.  
StdFail_NotDone if the construction fails.") CenterOn3;
		void CenterOn3 (const Standard_Integer Index,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Boolean

Returns true if the solution of index Index and,  
respectively, the first or second argument of this  
algorithm are the same (i.e. there are 2 identical circles).  
If Rarg is the radius of the first or second argument,  
Rsol is the radius of the solution and dist is the  
distance between the two centers, we consider the two  
circles to be identical if |Rarg - Rsol| and dist  
are less than or equal to the tolerance criterion given at  
the time of construction of this algorithm.  
Exceptions  
Standard_OutOfRange if Index is less than zero or  
greater than the number of solutions computed by this algorithm.  
StdFail_NotDone if the construction fails.") IsTheSame1;
		Standard_Boolean IsTheSame1 (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Boolean

Returns true if the solution of index Index and,  
respectively, the first or second argument of this  
algorithm are the same (i.e. there are 2 identical circles).  
If Rarg is the radius of the first or second argument,  
Rsol is the radius of the solution and dist is the  
distance between the two centers, we consider the two  
circles to be identical if |Rarg - Rsol| and dist  
are less than or equal to the tolerance criterion given at  
the time of construction of this algorithm.  
Exceptions  
Standard_OutOfRange if Index is less than zero or  
greater than the number of solutions computed by this algorithm.  
StdFail_NotDone if the construction fails.") IsTheSame2;
		Standard_Boolean IsTheSame2 (const Standard_Integer Index);
};


%feature("shadow") Geom2dGcc_Circ2d2TanOn::~Geom2dGcc_Circ2d2TanOn %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dGcc_Circ2d2TanOn {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dGcc_Circ2d2TanRad;
class Geom2dGcc_Circ2d2TanRad {
	public:
		%feature("autodoc", "Args:
	Qualified1(Geom2dGcc_QualifiedCurve)
	Qualified2(Geom2dGcc_QualifiedCurve)
	Radius(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_Circ2d2TanRad;
		 Geom2dGcc_Circ2d2TanRad (const Geom2dGcc_QualifiedCurve & Qualified1,const Geom2dGcc_QualifiedCurve & Qualified2,const Standard_Real Radius,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(Geom2dGcc_QualifiedCurve)
	Point(Handle_Geom2d_Point)
	Radius(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_Circ2d2TanRad;
		 Geom2dGcc_Circ2d2TanRad (const Geom2dGcc_QualifiedCurve & Qualified1,const Handle_Geom2d_Point & Point,const Standard_Real Radius,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Point1(Handle_Geom2d_Point)
	Point2(Handle_Geom2d_Point)
	Radius(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

These constructors create one or more 2D circles of radius Radius either  
-   tangential to the 2 curves Qualified1 and Qualified2,   or  
-   tangential to the curve Qualified1 and passing through the point Point, or  
-   passing through two points Point1 and Point2.  
Tolerance is a tolerance criterion used by the algorithm  
to find a solution when, mathematically, the problem  
posed does not have a solution, but where there is  
numeric uncertainty attached to the arguments.  
For example, take two circles C1 and C2, such that C2  
is inside C1, and almost tangential to C1. There is, in  
fact, no point of intersection between C1 and C2. You  
now want to find a circle of radius R (smaller than the  
radius of C2), which is tangential to C1 and C2, and  
inside these two circles: a pure mathematical resolution  
will not find a solution. This is where the tolerance  
criterion is used: the algorithm considers that C1 and  
C2 are tangential if the shortest distance between these  
two circles is less than or equal to Tolerance. Thus, a  
solution is found by the algorithm.  
Exceptions  
GccEnt_BadQualifier if a qualifier is inconsistent with  
the argument it qualifies (for example, enclosing for a line).  
Standard_NegativeValue if Radius is negative.") Geom2dGcc_Circ2d2TanRad;
		 Geom2dGcc_Circ2d2TanRad (const Handle_Geom2d_Point & Point1,const Handle_Geom2d_Point & Point2,const Standard_Real Radius,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Circ(GccAna_Circ2d2TanRad)

Returns:
	None

No detailed docstring for this function.") Results;
		void Results (const GccAna_Circ2d2TanRad & Circ);
		%feature("autodoc", "Args:
	Circ(Geom2dGcc_MyCirc2d2TanRad)

Returns:
	None

No detailed docstring for this function.") Results;
		void Results (const Geom2dGcc_MyCirc2d2TanRad & Circ);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

This method returns True if the algorithm succeeded.  
Note: IsDone protects against a failure arising from a  
more internal intersection algorithm, which has reached its numeric limits.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

This method returns the number of solutions.  
         NotDone is raised if the algorithm failed.  
Exceptions  
StdFail_NotDone if the construction fails.") NbSolutions;
		Standard_Integer NbSolutions ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Circ2d

Returns the solution number Index and raises OutOfRange  
exception if Index is greater than the number of solutions.  
Be carefull: the Index is only a way to get all the  
solutions, but is not associated to theses outside the context of the algorithm-object.  
Warning  
This indexing simply provides a means of consulting the  
solutions. The index values are not associated with  
these solutions outside the context of the algorithm object.  
Exceptions  
Standard_OutOfRange if Index is less than zero or  
greater than the number of solutions computed by this algorithm.  
StdFail_NotDone if the construction fails.") ThisSolution;
		gp_Circ2d ThisSolution (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Qualif1(GccEnt_Position)
	Qualif2(GccEnt_Position)

Returns:
	None

Returns the qualifiers Qualif1 and Qualif2 of the  
tangency arguments for the solution of index Index  
computed by this algorithm.  
The returned qualifiers are:  
-   those specified at the start of construction when the  
  solutions are defined as enclosed, enclosing or  
  outside with respect to the arguments, or  
-   those computed during construction (i.e. enclosed,  
  enclosing or outside) when the solutions are defined  
  as unqualified with respect to the arguments, or  
-   GccEnt_noqualifier if the tangency argument is a point, or  
-   GccEnt_unqualified in certain limit cases where it  
  is impossible to qualify the solution as enclosed, enclosing or outside.  
Exceptions  
Standard_OutOfRange if Index is less than zero or  
greater than the number of solutions computed by this algorithm.  
StdFail_NotDone if the construction fails.") WhichQualifier;
		void WhichQualifier (const Standard_Integer Index,GccEnt_Position & Qualif1,GccEnt_Position & Qualif2);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	ParSol(Standard_Real)
	ParArg(Standard_Real)
	PntSol(gp_Pnt2d)

Returns:
	None

Returns informations about the tangency point between the  
result number Index and the first argument.  
ParSol is the intrinsic parameter of the point PntSol on the solution curv.  
ParArg is the intrinsic parameter of the point PntSol on the argument curv.  
OutOfRange is raised if Index is greater than the number of solutions.  
notDone is raised if the construction algorithm did not succeed.") Tangency1;
		void Tangency1 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	ParSol(Standard_Real)
	ParArg(Standard_Real)
	PntSol(gp_Pnt2d)

Returns:
	None

Returns informations about the tangency point between the  
result number Index and the second argument.  
ParSol is the intrinsic parameter of the point PntSol on the solution curv.  
ParArg is the intrinsic parameter of the point PntSol on the argument curv.  
OutOfRange is raised if Index is greater than the number of solutions.  
notDone is raised if the construction algorithm did not succeed.") Tangency2;
		void Tangency2 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Boolean

Returns true if the solution of index Index and,  
respectively, the first or second argument of this  
algorithm are the same (i.e. there are 2 identical circles).  
If Rarg is the radius of the first or second argument,  
Rsol is the radius of the solution and dist is the  
distance between the two centers, we consider the two  
circles to be identical if |Rarg - Rsol| and dist  
are less than or equal to the tolerance criterion given at  
the time of construction of this algorithm.  
OutOfRange is raised if Index is greater than the number of solutions.  
notDone is raised if the construction algorithm did not succeed.") IsTheSame1;
		Standard_Boolean IsTheSame1 (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Boolean

Returns true if the solution of index Index and,  
respectively, the first or second argument of this  
algorithm are the same (i.e. there are 2 identical circles).  
If Rarg is the radius of the first or second argument,  
Rsol is the radius of the solution and dist is the  
distance between the two centers, we consider the two  
circles to be identical if |Rarg - Rsol| and dist  
are less than or equal to the tolerance criterion given at  
the time of construction of this algorithm.  
OutOfRange is raised if Index is greater than the number of solutions.  
notDone is raised if the construction algorithm did not succeed.") IsTheSame2;
		Standard_Boolean IsTheSame2 (const Standard_Integer Index);
};


%feature("shadow") Geom2dGcc_Circ2d2TanRad::~Geom2dGcc_Circ2d2TanRad %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dGcc_Circ2d2TanRad {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dGcc_Circ2d3Tan;
class Geom2dGcc_Circ2d3Tan {
	public:
		%feature("autodoc", "Args:
	Qualified1(Geom2dGcc_QualifiedCurve)
	Qualified2(Geom2dGcc_QualifiedCurve)
	Qualified3(Geom2dGcc_QualifiedCurve)
	Tolerance(Standard_Real)
	Param1(Standard_Real)
	Param2(Standard_Real)
	Param3(Standard_Real)

Returns:
	None

Constructs one or more 2D circles  
  tangential to three curves Qualified1, Qualified2 and  
  Qualified3, where Param1, Param2 and Param3 are  
  used, respectively, as the initial values of the  
  parameters on Qualified1, Qualified2 and Qualified3  
  of the tangency point between these arguments and  
  the solution sought, if the algorithm chooses an  
  iterative method to find the solution (i.e. if either  
  Qualified1, Qualified2 or Qualified3 is more complex  
  than a line or a circle).") Geom2dGcc_Circ2d3Tan;
		 Geom2dGcc_Circ2d3Tan (const Geom2dGcc_QualifiedCurve & Qualified1,const Geom2dGcc_QualifiedCurve & Qualified2,const Geom2dGcc_QualifiedCurve & Qualified3,const Standard_Real Tolerance,const Standard_Real Param1,const Standard_Real Param2,const Standard_Real Param3);
		%feature("autodoc", "Args:
	Qualified1(Geom2dGcc_QualifiedCurve)
	Qualified2(Geom2dGcc_QualifiedCurve)
	Point(Handle_Geom2d_Point)
	Tolerance(Standard_Real)
	Param1(Standard_Real)
	Param2(Standard_Real)

Returns:
	None

Constructs one or more 2D circles  
tangential to two curves Qualified1 and Qualified2  
  and passing through the point Point, where Param1  
  and Param2 are used, respectively, as the initial  
  values of the parameters on Qualified1 and  
  Qualified2 of the tangency point between this  
  argument and the solution sought, if the algorithm  
  chooses an iterative method to find the solution (i.e. if  
  either Qualified1 or Qualified2 is more complex than  
  a line or a circle).") Geom2dGcc_Circ2d3Tan;
		 Geom2dGcc_Circ2d3Tan (const Geom2dGcc_QualifiedCurve & Qualified1,const Geom2dGcc_QualifiedCurve & Qualified2,const Handle_Geom2d_Point & Point,const Standard_Real Tolerance,const Standard_Real Param1,const Standard_Real Param2);
		%feature("autodoc", "Args:
	Qualified1(Geom2dGcc_QualifiedCurve)
	Point1(Handle_Geom2d_Point)
	Point2(Handle_Geom2d_Point)
	Tolerance(Standard_Real)
	Param1(Standard_Real)

Returns:
	None

Constructs one or more 2D circles tangential to the curve Qualified1 and passing  
 through two points Point1 and Point2, where Param1  
 is used as the initial value of the parameter on  
 Qualified1 of the tangency point between this  
 argument and the solution sought, if the algorithm  
  chooses an iterative method to find the solution (i.e. if  
  Qualified1 is more complex than a line or a circle)") Geom2dGcc_Circ2d3Tan;
		 Geom2dGcc_Circ2d3Tan (const Geom2dGcc_QualifiedCurve & Qualified1,const Handle_Geom2d_Point & Point1,const Handle_Geom2d_Point & Point2,const Standard_Real Tolerance,const Standard_Real Param1);
		%feature("autodoc", "Args:
	Point1(Handle_Geom2d_Point)
	Point2(Handle_Geom2d_Point)
	Point3(Handle_Geom2d_Point)
	Tolerance(Standard_Real)

Returns:
	None

Constructs one or more 2D circles passing through three points Point1, Point2 and Point3.  
Tolerance is a tolerance criterion used by the algorithm  
to find a solution when, mathematically, the problem  
posed does not have a solution, but where there is  
numeric uncertainty attached to the arguments.  
For example, take:  
-   two circles C1 and C2, such that C2 is inside C1,  
  and almost tangential to C1; there is in fact no point  
  of intersection between C1 and C2; and  
-   a circle C3 outside C1.  
You now want to find a circle which is tangential to C1,  
C2 and C3: a pure mathematical resolution will not find  
a solution. This is where the tolerance criterion is used:  
the algorithm considers that C1 and C2 are tangential if  
the shortest distance between these two circles is less  
than or equal to Tolerance. Thus, the algorithm finds a solution.  
Warning  
An iterative algorithm is used if Qualified1, Qualified2 or  
Qualified3 is more complex than a line or a circle. In  
such cases, the algorithm constructs only one solution.  
Exceptions  
GccEnt_BadQualifier if a qualifier is inconsistent with  
the argument it qualifies (for example, enclosing for a line).") Geom2dGcc_Circ2d3Tan;
		 Geom2dGcc_Circ2d3Tan (const Handle_Geom2d_Point & Point1,const Handle_Geom2d_Point & Point2,const Handle_Geom2d_Point & Point3,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Circ(GccAna_Circ2d3Tan)
	Rank1(Standard_Integer)
	Rank2(Standard_Integer)
	Rank3(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Results;
		void Results (const GccAna_Circ2d3Tan & Circ,const Standard_Integer Rank1,const Standard_Integer Rank2,const Standard_Integer Rank3);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the construction algorithm does not fail (even if it finds no solution).  
Note: IsDone protects against a failure arising from a  
more internal intersection algorithm, which has reached its numeric limits.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

This method returns the number of solutions.  
         NotDone is raised if the algorithm failed.") NbSolutions;
		Standard_Integer NbSolutions ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Circ2d

Returns the solution number Index and raises OutOfRange  
exception if Index is greater than the number of solutions.  
Be carefull: the Index is only a way to get all the  
solutions, but is not associated to theses outside the context  
of the algorithm-object.") ThisSolution;
		gp_Circ2d ThisSolution (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Qualif1(GccEnt_Position)
	Qualif2(GccEnt_Position)
	Qualif3(GccEnt_Position)

Returns:
	None

It returns the informations about the qualifiers of the tangency  
         arguments concerning the solution number Index.  
         It returns the real qualifiers (the qualifiers given to the  
         constructor method in case of enclosed, enclosing and outside  
         and the qualifiers computedin case of unqualified).") WhichQualifier;
		void WhichQualifier (const Standard_Integer Index,GccEnt_Position & Qualif1,GccEnt_Position & Qualif2,GccEnt_Position & Qualif3);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	ParSol(Standard_Real)
	ParArg(Standard_Real)
	PntSol(gp_Pnt2d)

Returns:
	None

Returns informations about the tangency point between the  
result and the first argument.  
ParSol is the intrinsic parameter of the point PntSol on the solution curv.  
ParArg is the intrinsic parameter of the point PntSol on the argument curv.") Tangency1;
		void Tangency1 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	ParSol(Standard_Real)
	ParArg(Standard_Real)
	PntSol(gp_Pnt2d)

Returns:
	None

Returns informations about the tangency point between the  
result and the second argument.  
ParSol is the intrinsic parameter of the point PntSol on the solution curv.  
ParArg is the intrinsic parameter of the point PntSol on the argument curv.") Tangency2;
		void Tangency2 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	ParSol(Standard_Real)
	ParArg(Standard_Real)
	PntSol(gp_Pnt2d)

Returns:
	None

Returns informations about the tangency point between the  
result and the third argument.  
ParSol is the intrinsic parameter of the point PntSol on the solution curv.  
ParArg is the intrinsic parameter of the point PntSol on the argument curv.") Tangency3;
		void Tangency3 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Boolean

Returns True if the solution is equal to the first argument.") IsTheSame1;
		Standard_Boolean IsTheSame1 (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Boolean

Returns True if the solution is equal to the second argument.") IsTheSame2;
		Standard_Boolean IsTheSame2 (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Boolean

Returns True if the solution is equal to the third argument.  
If Rarg is the radius of the first, second or third  
argument, Rsol is the radius of the solution and dist  
is the distance between the two centers, we consider  
the two circles to be identical if |Rarg - Rsol| and  
dist are less than or equal to the tolerance criterion  
given at the time of construction of this algorithm.  
Exceptions  
Standard_OutOfRange if Index is less than zero or  
greater than the number of solutions computed by this algorithm.  
StdFail_NotDone if the construction fails.") IsTheSame3;
		Standard_Boolean IsTheSame3 (const Standard_Integer Index);
};


%feature("shadow") Geom2dGcc_Circ2d3Tan::~Geom2dGcc_Circ2d3Tan %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dGcc_Circ2d3Tan {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dGcc_Circ2dTanCen;
class Geom2dGcc_Circ2dTanCen {
	public:
		%feature("autodoc", "Args:
	Qualified1(Geom2dGcc_QualifiedCurve)
	Pcenter(Handle_Geom2d_Point)
	Tolerance(Standard_Real)

Returns:
	None

Constructs one or more 2D circles tangential to the  
curve Qualified1 and centered on the point Pcenter.  
Tolerance is a tolerance criterion used by the algorithm  
to find a solution when, mathematically, the problem  
posed does not have a solution, but where there is  
numeric uncertainty attached to the arguments.  
Tolerance is only used in these algorithms in very  
specific cases where the center of the solution is very  
close to the circle to which it is tangential, and where the  
solution is thus a very small circle.  
Exceptions  
GccEnt_BadQualifier if a qualifier is inconsistent with  
the argument it qualifies (for example, enclosing for a line).") Geom2dGcc_Circ2dTanCen;
		 Geom2dGcc_Circ2dTanCen (const Geom2dGcc_QualifiedCurve & Qualified1,const Handle_Geom2d_Point & Pcenter,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the construction algorithm does not fail  
(even if it finds no solution).  
Note: IsDone protects against a failure arising from a  
more internal intersection algorithm, which has reached  
its numeric limits.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of circles, representing solutions  
computed by this algorithm.  
Exceptions  
StdFail_NotDone if the construction fails.") NbSolutions;
		Standard_Integer NbSolutions ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Circ2d

Returns a circle, representing the solution of index  
Index computed by this algorithm.  
Warning  
This indexing simply provides a means of consulting the  
solutions. The index values are not associated with  
these solutions outside the context of the algorithm object.  
Exceptions  
Standard_OutOfRange if Index is less than zero or  
greater than the number of solutions computed by this algorithm.  
StdFail_NotDone if the construction fails") ThisSolution;
		gp_Circ2d ThisSolution (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Qualif1(GccEnt_Position)

Returns:
	None

Returns the qualifier Qualif1 of the tangency argument  
for the solution of index Index computed by this algorithm.  
The returned qualifier is:  
-   that specified at the start of construction when the  
  solutions are defined as enclosed, enclosing or  
  outside with respect to the argument, or  
-   that computed during construction (i.e. enclosed,  
  enclosing or outside) when the solutions are defined  
  as unqualified with respect to the argument.  
Exceptions  
Standard_OutOfRange if Index is less than zero or  
greater than the number of solutions computed by this algorithm.  
StdFail_NotDone if the construction fails.") WhichQualifier;
		void WhichQualifier (const Standard_Integer Index,GccEnt_Position & Qualif1);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	ParSol(Standard_Real)
	ParArg(Standard_Real)
	PntSol(gp_Pnt2d)

Returns:
	None

Returns informations about the tangency point between the  
result number Index and the first argument.  
ParSol is the intrinsic parameter of the point PntSol on the solution curv.  
ParArg is the intrinsic parameter of the point PntSol on the argument curv.  
Exceptions  
Standard_OutOfRange if Index is less than zero or  
greater than the number of solutions computed by this algorithm.  
StdFail_NotDone if the construction fails.") Tangency1;
		void Tangency1 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Boolean

Returns true if the solution of index Index and the first  
argument of this algorithm are the same (i.e. there are 2  
identical circles).  
If Rarg is the radius of the first argument, Rsol is the  
radius of the solution and dist is the distance between  
the two centers, we consider the two circles to be  
identical if |Rarg - Rsol| and dist are less than  
or equal to the tolerance criterion given at the time of  
construction of this algorithm.  
         NotDone is raised if the construction algorithm didn't succeed.  
         OutOfRange is raised if Index is greater than the  
         number of solutions.") IsTheSame1;
		Standard_Boolean IsTheSame1 (const Standard_Integer Index);
};


%feature("shadow") Geom2dGcc_Circ2dTanCen::~Geom2dGcc_Circ2dTanCen %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dGcc_Circ2dTanCen {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dGcc_Circ2dTanOnRad;
class Geom2dGcc_Circ2dTanOnRad {
	public:
		%feature("autodoc", "Args:
	Qualified1(Geom2dGcc_QualifiedCurve)
	OnCurv(Geom2dAdaptor_Curve)
	Radius(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

Constructs one or more 2D circles of radius Radius,  
centered on the 2D curve OnCurv and:  
-   tangential to the curve Qualified1") Geom2dGcc_Circ2dTanOnRad;
		 Geom2dGcc_Circ2dTanOnRad (const Geom2dGcc_QualifiedCurve & Qualified1,const Geom2dAdaptor_Curve & OnCurv,const Standard_Real Radius,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Point1(Handle_Geom2d_Point)
	OnCurv(Geom2dAdaptor_Curve)
	Radius(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

Constructs one or more 2D circles of radius Radius,  
centered on the 2D curve OnCurv and:  
passing through the point Point1.  
 OnCurv is an adapted curve, i.e. an object which is an  
interface between:  
-   the services provided by a 2D curve from the package Geom2d,  
-   and those required on the curve by the construction algorithm.  
Similarly, the qualified curve Qualified1 is created from  
an adapted curve.  
Adapted curves are created in the following way:  
Handle_Geom2d_Curve myCurveOn = ... ;  
Geom2dAdaptor_Curve OnCurv ( myCurveOn ) ;  
The algorithm is then constructed with this object:  
Handle_Geom2d_Curve myCurve1 = ...  
;  
Geom2dAdaptor_Curve Adapted1 ( myCurve1 ) ;  
Geom2dGcc_QualifiedCurve  
          Qualified1 = Geom2dGcc::Outside(Adapted1);  
Standard_Real Radius = ... , Tolerance = ... ;  
Geom2dGcc_Circ2dTanOnRad  
            myAlgo ( Qualified1 , OnCurv , Radius , Tolerance ) ;  
if ( myAlgo.IsDone() )  
    { Standard_Integer Nbr = myAlgo.NbSolutions() ;  
    gp_Circ2d Circ ;  
    for ( Standard_Integer i = 1 ;  
i <= nbr ; i++ )  
       { Circ = myAlgo.ThisSolution (i) ;  
          ...  
       }  
    }") Geom2dGcc_Circ2dTanOnRad;
		 Geom2dGcc_Circ2dTanOnRad (const Handle_Geom2d_Point & Point1,const Geom2dAdaptor_Curve & OnCurv,const Standard_Real Radius,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Circ(GccAna_Circ2dTanOnRad)

Returns:
	None

No detailed docstring for this function.") Results;
		void Results (const GccAna_Circ2dTanOnRad & Circ);
		%feature("autodoc", "Args:
	Circ(Geom2dGcc_MyCirc2dTanOnRad)

Returns:
	None

No detailed docstring for this function.") Results;
		void Results (const Geom2dGcc_MyCirc2dTanOnRad & Circ);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the construction algorithm does not fail  
(even if it finds no solution).  
Note: IsDone protects against a failure arising from a  
more internal intersection algorithm which has reached  
its numeric limits.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of circles, representing solutions  
computed by this algorithm.  
Exceptions: StdFail_NotDone if the construction fails.") NbSolutions;
		Standard_Integer NbSolutions ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Circ2d

Returns the solution number Index and raises OutOfRange  
exception if Index is greater than the number of solutions.  
Be carefull: the Index is only a way to get all the  
solutions, but is not associated to theses outside the context  
of the algorithm-object.  
Exceptions  
Standard_OutOfRange if Index is less than zero or  
greater than the number of solutions computed by this algorithm.  
StdFail_NotDone if the construction fails.") ThisSolution;
		gp_Circ2d ThisSolution (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Qualif1(GccEnt_Position)

Returns:
	None

Returns the qualifier Qualif1 of the tangency argument  
for the solution of index Index computed by this algorithm.  
The returned qualifier is:  
-   that specified at the start of construction when the  
  solutions are defined as enclosed, enclosing or  
  outside with respect to the arguments, or  
-   that computed during construction (i.e. enclosed,  
  enclosing or outside) when the solutions are defined  
  as unqualified with respect to the arguments, or  
-   GccEnt_noqualifier if the tangency argument is a point.  
 Exceptions  
Standard_OutOfRange if Index is less than zero or  
greater than the number of solutions computed by this algorithm.  
StdFail_NotDone if the construction fails.") WhichQualifier;
		void WhichQualifier (const Standard_Integer Index,GccEnt_Position & Qualif1);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	ParSol(Standard_Real)
	ParArg(Standard_Real)
	PntSol(gp_Pnt2d)

Returns:
	None

Returns informations about the tangency point between the  
result number Index and the first argument.  
ParSol is the intrinsic parameter of the point on the solution curv.  
ParArg is the intrinsic parameter of the point on the argument curv.  
PntSol is the tangency point on the solution curv.  
PntArg is the tangency point on the argument curv.  
Exceptions  
Standard_OutOfRange if Index is less than zero or  
greater than the number of solutions computed by this algorithm.  
StdFail_NotDone if the construction fails.") Tangency1;
		void Tangency1 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	ParArg(Standard_Real)
	PntSol(gp_Pnt2d)

Returns:
	None

Returns the center PntSol on the second argument (i.e.  
line or circle) of the solution of index Index computed by  
this algorithm.  
ParArg is the intrinsic parameter of the point on the argument curv.  
PntSol is the center point of the solution curv.  
PntArg is the projection of PntSol on the argument curv.  
Exceptions:  
Standard_OutOfRange if Index is less than zero or  
greater than the number of solutions computed by this algorithm.  
StdFail_NotDone if the construction fails.") CenterOn3;
		void CenterOn3 (const Standard_Integer Index,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Boolean

Returns true if the solution of index Index and the first  
argument of this algorithm are the same (i.e. there are 2  
identical circles).  
If Rarg is the radius of the first argument, Rsol is the  
radius of the solution and dist is the distance between  
the two centers, we consider the two circles to be  
identical if |Rarg - Rsol| and dist are less than  
or equal to the tolerance criterion given at the time of  
construction of this algorithm.  
OutOfRange is raised if Index is greater than the number of solutions.  
notDone is raised if the construction algorithm did not succeed.") IsTheSame1;
		Standard_Boolean IsTheSame1 (const Standard_Integer Index);
};


%feature("shadow") Geom2dGcc_Circ2dTanOnRad::~Geom2dGcc_Circ2dTanOnRad %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dGcc_Circ2dTanOnRad {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dGcc_CurveTool;
class Geom2dGcc_CurveTool {
	public:
		%feature("autodoc", "Args:
	C(Geom2dAdaptor_Curve)

Returns:
	static Standard_Real

No detailed docstring for this function.") FirstParameter;
		static Standard_Real FirstParameter (const Geom2dAdaptor_Curve & C);
		%feature("autodoc", "Args:
	C(Geom2dAdaptor_Curve)

Returns:
	static Standard_Real

No detailed docstring for this function.") LastParameter;
		static Standard_Real LastParameter (const Geom2dAdaptor_Curve & C);
		%feature("autodoc", "Args:
	C(Geom2dAdaptor_Curve)
	Tol(Standard_Real)

Returns:
	static Standard_Real

No detailed docstring for this function.") EpsX;
		static Standard_Real EpsX (const Geom2dAdaptor_Curve & C,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C(Geom2dAdaptor_Curve)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbSamples;
		static Standard_Integer NbSamples (const Geom2dAdaptor_Curve & C);
		%feature("autodoc", "Args:
	C(Geom2dAdaptor_Curve)
	X(Standard_Real)

Returns:
	static gp_Pnt2d

No detailed docstring for this function.") Value;
		static gp_Pnt2d Value (const Geom2dAdaptor_Curve & C,const Standard_Real X);
		%feature("autodoc", "Args:
	C(Geom2dAdaptor_Curve)
	U(Standard_Real)
	P(gp_Pnt2d)
	T(gp_Vec2d)

Returns:
	static void

No detailed docstring for this function.") D1;
		static void D1 (const Geom2dAdaptor_Curve & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & T);
		%feature("autodoc", "Args:
	C(Geom2dAdaptor_Curve)
	U(Standard_Real)
	P(gp_Pnt2d)
	T(gp_Vec2d)
	N(gp_Vec2d)

Returns:
	static void

No detailed docstring for this function.") D2;
		static void D2 (const Geom2dAdaptor_Curve & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & T,gp_Vec2d & N);
		%feature("autodoc", "Args:
	C(Geom2dAdaptor_Curve)
	U(Standard_Real)
	P(gp_Pnt2d)
	T(gp_Vec2d)
	N(gp_Vec2d)
	dN(gp_Vec2d)

Returns:
	static void

No detailed docstring for this function.") D3;
		static void D3 (const Geom2dAdaptor_Curve & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & T,gp_Vec2d & N,gp_Vec2d & dN);
};


%feature("shadow") Geom2dGcc_CurveTool::~Geom2dGcc_CurveTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dGcc_CurveTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dGcc_FuncTCirCuOfMyL2d2Tan;
class Geom2dGcc_FuncTCirCuOfMyL2d2Tan : public math_FunctionWithDerivative {
	public:
		%feature("autodoc", "Args:
	Circ(gp_Circ2d)
	Curv(Geom2dAdaptor_Curve)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_FuncTCirCuOfMyL2d2Tan;
		 Geom2dGcc_FuncTCirCuOfMyL2d2Tan (const gp_Circ2d & Circ,const Geom2dAdaptor_Curve & Curv);
		%feature("autodoc", "Args:
	X(Standard_Real)
	F(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Value;
		Standard_Boolean Value (const Standard_Real X,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	X(Standard_Real)
	Deriv(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Derivative;
		Standard_Boolean Derivative (const Standard_Real X,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	X(Standard_Real)
	F(Standard_Real)
	Deriv(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Values;
		Standard_Boolean Values (const Standard_Real X,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") Geom2dGcc_FuncTCirCuOfMyL2d2Tan::~Geom2dGcc_FuncTCirCuOfMyL2d2Tan %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dGcc_FuncTCirCuOfMyL2d2Tan {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dGcc_FuncTCuCuOfMyL2d2Tan;
class Geom2dGcc_FuncTCuCuOfMyL2d2Tan : public math_FunctionSetWithDerivatives {
	public:
		%feature("autodoc", "Args:
	Curv1(Geom2dAdaptor_Curve)
	Curv2(Geom2dAdaptor_Curve)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_FuncTCuCuOfMyL2d2Tan;
		 Geom2dGcc_FuncTCuCuOfMyL2d2Tan (const Geom2dAdaptor_Curve & Curv1,const Geom2dAdaptor_Curve & Curv2);
		%feature("autodoc", "Args:
	Circ1(gp_Circ2d)
	Curv2(Geom2dAdaptor_Curve)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_FuncTCuCuOfMyL2d2Tan;
		 Geom2dGcc_FuncTCuCuOfMyL2d2Tan (const gp_Circ2d & Circ1,const Geom2dAdaptor_Curve & Curv2);
		%feature("autodoc", "Args:
	X(math_Vector)
	Point1(gp_Pnt2d)
	Point2(gp_Pnt2d)
	Tan1(gp_Vec2d)
	Tan2(gp_Vec2d)
	D21(gp_Vec2d)
	D22(gp_Vec2d)

Returns:
	None

No detailed docstring for this function.") InitDerivative;
		void InitDerivative (const math_Vector & X,gp_Pnt2d & Point1,gp_Pnt2d & Point2,gp_Vec2d & Tan1,gp_Vec2d & Tan2,gp_Vec2d & D21,gp_Vec2d & D22);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("autodoc", "Args:
	X(math_Vector)
	Deriv(math_Matrix)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & Deriv);
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)
	Deriv(math_Matrix)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & Deriv);
};


%feature("shadow") Geom2dGcc_FuncTCuCuOfMyL2d2Tan::~Geom2dGcc_FuncTCuCuOfMyL2d2Tan %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dGcc_FuncTCuCuOfMyL2d2Tan {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dGcc_FuncTCuCuOnCuOfMyC2d2TanOn;
class Geom2dGcc_FuncTCuCuOnCuOfMyC2d2TanOn : public math_FunctionSetWithDerivatives {
	public:
		%feature("autodoc", "Args:
	C1(Geom2dAdaptor_Curve)
	C2(Geom2dAdaptor_Curve)
	OnCi(gp_Circ2d)
	Rad(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_FuncTCuCuOnCuOfMyC2d2TanOn;
		 Geom2dGcc_FuncTCuCuOnCuOfMyC2d2TanOn (const Geom2dAdaptor_Curve & C1,const Geom2dAdaptor_Curve & C2,const gp_Circ2d & OnCi,const Standard_Real Rad);
		%feature("autodoc", "Args:
	C1(gp_Circ2d)
	C2(Geom2dAdaptor_Curve)
	OnCi(gp_Circ2d)
	Rad(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_FuncTCuCuOnCuOfMyC2d2TanOn;
		 Geom2dGcc_FuncTCuCuOnCuOfMyC2d2TanOn (const gp_Circ2d & C1,const Geom2dAdaptor_Curve & C2,const gp_Circ2d & OnCi,const Standard_Real Rad);
		%feature("autodoc", "Args:
	L1(gp_Lin2d)
	C2(Geom2dAdaptor_Curve)
	OnCi(gp_Circ2d)
	Rad(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_FuncTCuCuOnCuOfMyC2d2TanOn;
		 Geom2dGcc_FuncTCuCuOnCuOfMyC2d2TanOn (const gp_Lin2d & L1,const Geom2dAdaptor_Curve & C2,const gp_Circ2d & OnCi,const Standard_Real Rad);
		%feature("autodoc", "Args:
	C1(Geom2dAdaptor_Curve)
	P2(gp_Pnt2d)
	OnCi(gp_Circ2d)
	Rad(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_FuncTCuCuOnCuOfMyC2d2TanOn;
		 Geom2dGcc_FuncTCuCuOnCuOfMyC2d2TanOn (const Geom2dAdaptor_Curve & C1,const gp_Pnt2d & P2,const gp_Circ2d & OnCi,const Standard_Real Rad);
		%feature("autodoc", "Args:
	C1(Geom2dAdaptor_Curve)
	C2(Geom2dAdaptor_Curve)
	OnLi(gp_Lin2d)
	Rad(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_FuncTCuCuOnCuOfMyC2d2TanOn;
		 Geom2dGcc_FuncTCuCuOnCuOfMyC2d2TanOn (const Geom2dAdaptor_Curve & C1,const Geom2dAdaptor_Curve & C2,const gp_Lin2d & OnLi,const Standard_Real Rad);
		%feature("autodoc", "Args:
	C1(gp_Circ2d)
	C2(Geom2dAdaptor_Curve)
	OnLi(gp_Lin2d)
	Rad(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_FuncTCuCuOnCuOfMyC2d2TanOn;
		 Geom2dGcc_FuncTCuCuOnCuOfMyC2d2TanOn (const gp_Circ2d & C1,const Geom2dAdaptor_Curve & C2,const gp_Lin2d & OnLi,const Standard_Real Rad);
		%feature("autodoc", "Args:
	L1(gp_Lin2d)
	C2(Geom2dAdaptor_Curve)
	OnLi(gp_Lin2d)
	Rad(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_FuncTCuCuOnCuOfMyC2d2TanOn;
		 Geom2dGcc_FuncTCuCuOnCuOfMyC2d2TanOn (const gp_Lin2d & L1,const Geom2dAdaptor_Curve & C2,const gp_Lin2d & OnLi,const Standard_Real Rad);
		%feature("autodoc", "Args:
	C1(Geom2dAdaptor_Curve)
	P2(gp_Pnt2d)
	OnLi(gp_Lin2d)
	Rad(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_FuncTCuCuOnCuOfMyC2d2TanOn;
		 Geom2dGcc_FuncTCuCuOnCuOfMyC2d2TanOn (const Geom2dAdaptor_Curve & C1,const gp_Pnt2d & P2,const gp_Lin2d & OnLi,const Standard_Real Rad);
		%feature("autodoc", "Args:
	C1(Geom2dAdaptor_Curve)
	C2(Geom2dAdaptor_Curve)
	OnCu(Geom2dAdaptor_Curve)
	Rad(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_FuncTCuCuOnCuOfMyC2d2TanOn;
		 Geom2dGcc_FuncTCuCuOnCuOfMyC2d2TanOn (const Geom2dAdaptor_Curve & C1,const Geom2dAdaptor_Curve & C2,const Geom2dAdaptor_Curve & OnCu,const Standard_Real Rad);
		%feature("autodoc", "Args:
	C1(gp_Circ2d)
	C2(Geom2dAdaptor_Curve)
	OnCu(Geom2dAdaptor_Curve)
	Rad(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_FuncTCuCuOnCuOfMyC2d2TanOn;
		 Geom2dGcc_FuncTCuCuOnCuOfMyC2d2TanOn (const gp_Circ2d & C1,const Geom2dAdaptor_Curve & C2,const Geom2dAdaptor_Curve & OnCu,const Standard_Real Rad);
		%feature("autodoc", "Args:
	L1(gp_Lin2d)
	C2(Geom2dAdaptor_Curve)
	OnCu(Geom2dAdaptor_Curve)
	Rad(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_FuncTCuCuOnCuOfMyC2d2TanOn;
		 Geom2dGcc_FuncTCuCuOnCuOfMyC2d2TanOn (const gp_Lin2d & L1,const Geom2dAdaptor_Curve & C2,const Geom2dAdaptor_Curve & OnCu,const Standard_Real Rad);
		%feature("autodoc", "Args:
	C1(Geom2dAdaptor_Curve)
	P1(gp_Pnt2d)
	OnCu(Geom2dAdaptor_Curve)
	Rad(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_FuncTCuCuOnCuOfMyC2d2TanOn;
		 Geom2dGcc_FuncTCuCuOnCuOfMyC2d2TanOn (const Geom2dAdaptor_Curve & C1,const gp_Pnt2d & P1,const Geom2dAdaptor_Curve & OnCu,const Standard_Real Rad);
		%feature("autodoc", "Args:
	X(math_Vector)
	Point1(gp_Pnt2d)
	Point2(gp_Pnt2d)
	Point3(gp_Pnt2d)
	Tan1(gp_Vec2d)
	Tan2(gp_Vec2d)
	Tan3(gp_Vec2d)
	D21(gp_Vec2d)
	D22(gp_Vec2d)
	D23(gp_Vec2d)

Returns:
	None

No detailed docstring for this function.") InitDerivative;
		void InitDerivative (const math_Vector & X,gp_Pnt2d & Point1,gp_Pnt2d & Point2,gp_Pnt2d & Point3,gp_Vec2d & Tan1,gp_Vec2d & Tan2,gp_Vec2d & Tan3,gp_Vec2d & D21,gp_Vec2d & D22,gp_Vec2d & D23);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("autodoc", "Args:
	X(math_Vector)
	D(math_Matrix)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)
	D(math_Matrix)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
};


%feature("shadow") Geom2dGcc_FuncTCuCuOnCuOfMyC2d2TanOn::~Geom2dGcc_FuncTCuCuOnCuOfMyC2d2TanOn %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dGcc_FuncTCuCuOnCuOfMyC2d2TanOn {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dGcc_FuncTCuPtOfMyL2d2Tan;
class Geom2dGcc_FuncTCuPtOfMyL2d2Tan : public math_FunctionWithDerivative {
	public:
		%feature("autodoc", "Args:
	C(Geom2dAdaptor_Curve)
	Point(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_FuncTCuPtOfMyL2d2Tan;
		 Geom2dGcc_FuncTCuPtOfMyL2d2Tan (const Geom2dAdaptor_Curve & C,const gp_Pnt2d & Point);
		%feature("autodoc", "Args:
	X(Standard_Real)
	F(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Value;
		Standard_Boolean Value (const Standard_Real X,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	X(Standard_Real)
	Deriv(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Derivative;
		Standard_Boolean Derivative (const Standard_Real X,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	X(Standard_Real)
	F(Standard_Real)
	Deriv(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Values;
		Standard_Boolean Values (const Standard_Real X,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") Geom2dGcc_FuncTCuPtOfMyL2d2Tan::~Geom2dGcc_FuncTCuPtOfMyL2d2Tan %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dGcc_FuncTCuPtOfMyL2d2Tan {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dGcc_FuncTOblOfMyL2dTanObl;
class Geom2dGcc_FuncTOblOfMyL2dTanObl : public math_FunctionWithDerivative {
	public:
		%feature("autodoc", "Args:
	Curve(Geom2dAdaptor_Curve)
	Dir(gp_Dir2d)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_FuncTOblOfMyL2dTanObl;
		 Geom2dGcc_FuncTOblOfMyL2dTanObl (const Geom2dAdaptor_Curve & Curve,const gp_Dir2d & Dir);
		%feature("autodoc", "Args:
	X(Standard_Real)
	F(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Value;
		Standard_Boolean Value (const Standard_Real X,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	X(Standard_Real)
	Deriv(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Derivative;
		Standard_Boolean Derivative (const Standard_Real X,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	X(Standard_Real)
	F(Standard_Real)
	Deriv(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Values;
		Standard_Boolean Values (const Standard_Real X,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") Geom2dGcc_FuncTOblOfMyL2dTanObl::~Geom2dGcc_FuncTOblOfMyL2dTanObl %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dGcc_FuncTOblOfMyL2dTanObl {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dGcc_Lin2d2Tan;
class Geom2dGcc_Lin2d2Tan {
	public:
		%feature("autodoc", "Args:
	Qualified1(Geom2dGcc_QualifiedCurve)
	Qualified2(Geom2dGcc_QualifiedCurve)
	Tolang(Standard_Real)

Returns:
	None

This class implements the algorithms used to create 2d  
         line tangent to two curves.  
         Tolang is used to determine the tolerance for the tangency points.") Geom2dGcc_Lin2d2Tan;
		 Geom2dGcc_Lin2d2Tan (const Geom2dGcc_QualifiedCurve & Qualified1,const Geom2dGcc_QualifiedCurve & Qualified2,const Standard_Real Tolang);
		%feature("autodoc", "Args:
	Qualified1(Geom2dGcc_QualifiedCurve)
	ThePoint(gp_Pnt2d)
	Tolang(Standard_Real)

Returns:
	None

This class implements the algorithms used to create 2d  
         lines passing thrue a point and tangent to a curve.  
         Tolang is used to determine the tolerance for the tangency points.") Geom2dGcc_Lin2d2Tan;
		 Geom2dGcc_Lin2d2Tan (const Geom2dGcc_QualifiedCurve & Qualified1,const gp_Pnt2d & ThePoint,const Standard_Real Tolang);
		%feature("autodoc", "Args:
	Qualified1(Geom2dGcc_QualifiedCurve)
	Qualified2(Geom2dGcc_QualifiedCurve)
	Tolang(Standard_Real)
	Param1(Standard_Real)
	Param2(Standard_Real)

Returns:
	None

This class implements the algorithms used to create 2d  
         line tangent to two curves.  
         Tolang is used to determine the tolerance for the tangency points.  
         Param1 is used for the initial guess on the first curve.  
         Param2 is used for the initial guess on the second curve.") Geom2dGcc_Lin2d2Tan;
		 Geom2dGcc_Lin2d2Tan (const Geom2dGcc_QualifiedCurve & Qualified1,const Geom2dGcc_QualifiedCurve & Qualified2,const Standard_Real Tolang,const Standard_Real Param1,const Standard_Real Param2);
		%feature("autodoc", "Args:
	Qualified1(Geom2dGcc_QualifiedCurve)
	ThePoint(gp_Pnt2d)
	Tolang(Standard_Real)
	Param1(Standard_Real)

Returns:
	None

This class implements the algorithms used to create 2d  
         lines passing thrue a point and tangent to a curve.  
         Tolang is used to determine the tolerance for the tangency points.  
         Param2 is used for the initial guess on the curve.") Geom2dGcc_Lin2d2Tan;
		 Geom2dGcc_Lin2d2Tan (const Geom2dGcc_QualifiedCurve & Qualified1,const gp_Pnt2d & ThePoint,const Standard_Real Tolang,const Standard_Real Param1);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the construction algorithm does not fail  
(even if it finds no solution).  
Note: IsDone protects against a failure arising from a  
more internal intersection algorithm, which has  
reached its numeric limits.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of lines, representing solutions computed by this algorithm.  
Exceptions StdFail_NotDone if the construction fails.R") NbSolutions;
		Standard_Integer NbSolutions ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Lin2d

Returns a line, representing the solution of index Index computed by this algorithm.  
Warning  
This indexing simply provides a means of consulting the  
solutions. The index values are not associated with  
these solutions outside the context of the algorithm object.  
Exceptions  
Standard_OutOfRange if Index is less than zero or  
greater than the number of solutions computed by this algorithm.  
StdFail_NotDone if the construction fails.") ThisSolution;
		gp_Lin2d ThisSolution (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Qualif1(GccEnt_Position)
	Qualif2(GccEnt_Position)

Returns:
	None

Returns the qualifiers Qualif1 and Qualif2 of the  
tangency arguments for the solution of index Index  
computed by this algorithm.  
The returned qualifiers are:  
-   those specified at the start of construction when the  
  solutions are defined as enclosing or outside with  
  respect to the arguments, or  
-   those computed during construction (i.e. enclosing or  
  outside) when the solutions are defined as unqualified  
  with respect to the arguments, or  
-   GccEnt_noqualifier if the tangency argument is a   point.  
Exceptions  
Standard_OutOfRange if Index is less than zero or  
greater than the number of solutions computed by this algorithm.  
StdFail_NotDone if the construction fails.") WhichQualifier;
		void WhichQualifier (const Standard_Integer Index,GccEnt_Position & Qualif1,GccEnt_Position & Qualif2);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	ParSol(Standard_Real)
	ParArg(Standard_Real)
	PntSol(gp_Pnt2d)

Returns:
	None

Returns informations about the tangency point between the  
         result and the first argument.  
         ParSol is the intrinsic parameter of the point PntSol on  
         the solution curv.  
         ParArg is the intrinsic parameter of the point PntSol on the argument curv.  
Exceptions  
Standard_OutOfRange if Index is less than zero or  
greater than the number of solutions computed by this algorithm.  
StdFail_NotDone if the construction fails.") Tangency1;
		void Tangency1 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	ParSol(Standard_Real)
	ParArg(Standard_Real)
	PntSol(gp_Pnt2d)

Returns:
	None

Returns informations about the tangency point between the  
result and the first argument.  
ParSol is the intrinsic parameter of the point PntSol on the solution curv.  
ParArg is the intrinsic parameter of the point PntSol on the argument curv.  
Exceptions  
Standard_OutOfRange if Index is less than zero or  
greater than the number of solutions computed by this algorithm.  
StdFail_NotDone if the construction fails.") Tangency2;
		void Tangency2 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
};


%feature("shadow") Geom2dGcc_Lin2d2Tan::~Geom2dGcc_Lin2d2Tan %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dGcc_Lin2d2Tan {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dGcc_Lin2dTanObl;
class Geom2dGcc_Lin2dTanObl {
	public:
		%feature("autodoc", "Args:
	Qualified1(Geom2dGcc_QualifiedCurve)
	TheLin(gp_Lin2d)
	TolAng(Standard_Real)
	Angle(Standard_Real)

Returns:
	None

This class implements the algorithm used to  
         create 2d line tangent to a curve and doing an  
         angle Angle with the line TheLin.  
         Angle must be in Radian.  
         Tolang is the angular tolerance.") Geom2dGcc_Lin2dTanObl;
		 Geom2dGcc_Lin2dTanObl (const Geom2dGcc_QualifiedCurve & Qualified1,const gp_Lin2d & TheLin,const Standard_Real TolAng,const Standard_Real Angle);
		%feature("autodoc", "Args:
	Qualified1(Geom2dGcc_QualifiedCurve)
	TheLin(gp_Lin2d)
	TolAng(Standard_Real)
	Param1(Standard_Real)
	Angle(Standard_Real)

Returns:
	None

This class implements the algorithm used to  
         create 2d line tangent to a curve and doing an  
         angle Angle with the line TheLin.  
         Angle must be in Radian.  
         Param2 is the initial guess on the curve QualifiedCurv.  
         Tolang is the angular tolerance.  
Warning  
An iterative algorithm is used if Qualified1 is more  
complex than a line or a circle. In such cases, the  
algorithm constructs only one solution.  
Exceptions  
GccEnt_BadQualifier if a qualifier is inconsistent with  
the argument it qualifies (for example, enclosed for a circle).") Geom2dGcc_Lin2dTanObl;
		 Geom2dGcc_Lin2dTanObl (const Geom2dGcc_QualifiedCurve & Qualified1,const gp_Lin2d & TheLin,const Standard_Real TolAng,const Standard_Real Param1,const Standard_Real Angle);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the construction algorithm does not fail  
(even if it finds no solution).  
Note: IsDone protects against a failure arising from a  
more internal intersection algorithm, which has reached its numeric limits.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of lines, representing solutions computed by this algorithm.  
Exceptions  
StdFail_NotDone if the construction fails.") NbSolutions;
		Standard_Integer NbSolutions ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Lin2d

Returns a line, representing the solution of index Index  
computed by this algorithm.  
Exceptions  
Standard_OutOfRange if Index is less than zero or  
greater than the number of solutions computed by this algorithm.  
StdFail_NotDone if the construction fails.") ThisSolution;
		gp_Lin2d ThisSolution (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Qualif1(GccEnt_Position)

Returns:
	None

Returns the qualifier Qualif1 of the tangency argument  
for the solution of index Index computed by this algorithm.  
The returned qualifier is:  
-   that specified at the start of construction when the  
 solutions are defined as enclosing or outside with  
 respect to the argument, or  
-   that computed during construction (i.e. enclosing or  
  outside) when the solutions are defined as unqualified  
  with respect to the argument, or  
-   GccEnt_noqualifier if the tangency argument is a point.  
  Exceptions  
Standard_OutOfRange if Index is less than zero or  
greater than the number of solutions computed by this algorithm.  
StdFail_NotDone if the construction fails.") WhichQualifier;
		void WhichQualifier (const Standard_Integer Index,GccEnt_Position & Qualif1);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	ParSol(Standard_Real)
	ParArg(Standard_Real)
	PntSol(gp_Pnt2d)

Returns:
	None

Returns informations about the tangency point between the  
         result and the first argument.  
         ParSol is the intrinsic parameter of the point PntSol on  
         the solution curv.  
         ParArg is the intrinsic parameter of the point PntSol on  
         the argument curv.") Tangency1;
		void Tangency1 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	ParSol(Standard_Real)
	ParArg(Standard_Real)
	PntSol(gp_Pnt2d)

Returns:
	None

Returns the point of intersection PntSol between the  
solution of index Index and the second argument (the line) of this algorithm.  
ParSol is the parameter of the point PntSol on the  
solution. ParArg is the parameter of the point PntSol on the second argument (the line).  
Exceptions  
StdFail_NotDone if the construction fails.  
GccIter_IsParallel if the solution and the second  
argument (the line) are parallel.  
Standard_OutOfRange if Index is less than zero or  
greater than the number of solutions computed by this algorithm.") Intersection2;
		void Intersection2 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
};


%feature("shadow") Geom2dGcc_Lin2dTanObl::~Geom2dGcc_Lin2dTanObl %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dGcc_Lin2dTanObl {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dGcc_MyC2d2TanOn;
class Geom2dGcc_MyC2d2TanOn {
	public:
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedCirc)
	Qualified2(Geom2dGcc_MyQCurve)
	OnLine(gp_Lin2d)
	Param1(Standard_Real)
	Param2(Standard_Real)
	Param3(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_MyC2d2TanOn;
		 Geom2dGcc_MyC2d2TanOn (const GccEnt_QualifiedCirc & Qualified1,const Geom2dGcc_MyQCurve & Qualified2,const gp_Lin2d & OnLine,const Standard_Real Param1,const Standard_Real Param2,const Standard_Real Param3,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedLin)
	Qualified2(Geom2dGcc_MyQCurve)
	OnLine(gp_Lin2d)
	Param1(Standard_Real)
	Param2(Standard_Real)
	Param3(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_MyC2d2TanOn;
		 Geom2dGcc_MyC2d2TanOn (const GccEnt_QualifiedLin & Qualified1,const Geom2dGcc_MyQCurve & Qualified2,const gp_Lin2d & OnLine,const Standard_Real Param1,const Standard_Real Param2,const Standard_Real Param3,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(Geom2dGcc_MyQCurve)
	Qualified2(Geom2dGcc_MyQCurve)
	OnLine(gp_Lin2d)
	Param1(Standard_Real)
	Param2(Standard_Real)
	Param3(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_MyC2d2TanOn;
		 Geom2dGcc_MyC2d2TanOn (const Geom2dGcc_MyQCurve & Qualified1,const Geom2dGcc_MyQCurve & Qualified2,const gp_Lin2d & OnLine,const Standard_Real Param1,const Standard_Real Param2,const Standard_Real Param3,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(Geom2dGcc_MyQCurve)
	Point2(gp_Pnt2d)
	OnLine(gp_Lin2d)
	Param1(Standard_Real)
	Param2(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_MyC2d2TanOn;
		 Geom2dGcc_MyC2d2TanOn (const Geom2dGcc_MyQCurve & Qualified1,const gp_Pnt2d & Point2,const gp_Lin2d & OnLine,const Standard_Real Param1,const Standard_Real Param2,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedCirc)
	Qualified2(Geom2dGcc_MyQCurve)
	OnCirc(gp_Circ2d)
	Param1(Standard_Real)
	Param2(Standard_Real)
	Param3(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_MyC2d2TanOn;
		 Geom2dGcc_MyC2d2TanOn (const GccEnt_QualifiedCirc & Qualified1,const Geom2dGcc_MyQCurve & Qualified2,const gp_Circ2d & OnCirc,const Standard_Real Param1,const Standard_Real Param2,const Standard_Real Param3,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedLin)
	Qualified2(Geom2dGcc_MyQCurve)
	OnCirc(gp_Circ2d)
	Param1(Standard_Real)
	Param2(Standard_Real)
	Param3(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_MyC2d2TanOn;
		 Geom2dGcc_MyC2d2TanOn (const GccEnt_QualifiedLin & Qualified1,const Geom2dGcc_MyQCurve & Qualified2,const gp_Circ2d & OnCirc,const Standard_Real Param1,const Standard_Real Param2,const Standard_Real Param3,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(Geom2dGcc_MyQCurve)
	Qualified2(Geom2dGcc_MyQCurve)
	OnCirc(gp_Circ2d)
	Param1(Standard_Real)
	Param2(Standard_Real)
	Param3(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_MyC2d2TanOn;
		 Geom2dGcc_MyC2d2TanOn (const Geom2dGcc_MyQCurve & Qualified1,const Geom2dGcc_MyQCurve & Qualified2,const gp_Circ2d & OnCirc,const Standard_Real Param1,const Standard_Real Param2,const Standard_Real Param3,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(Geom2dGcc_MyQCurve)
	Point2(gp_Pnt2d)
	OnCirc(gp_Circ2d)
	Param1(Standard_Real)
	Param2(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_MyC2d2TanOn;
		 Geom2dGcc_MyC2d2TanOn (const Geom2dGcc_MyQCurve & Qualified1,const gp_Pnt2d & Point2,const gp_Circ2d & OnCirc,const Standard_Real Param1,const Standard_Real Param2,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedCirc)
	Qualified2(Geom2dGcc_MyQCurve)
	OnCurv(Geom2dAdaptor_Curve)
	Param1(Standard_Real)
	Param2(Standard_Real)
	ParamOn(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_MyC2d2TanOn;
		 Geom2dGcc_MyC2d2TanOn (const GccEnt_QualifiedCirc & Qualified1,const Geom2dGcc_MyQCurve & Qualified2,const Geom2dAdaptor_Curve & OnCurv,const Standard_Real Param1,const Standard_Real Param2,const Standard_Real ParamOn,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedLin)
	Qualified2(Geom2dGcc_MyQCurve)
	OnCurve(Geom2dAdaptor_Curve)
	Param1(Standard_Real)
	Param2(Standard_Real)
	ParamOn(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_MyC2d2TanOn;
		 Geom2dGcc_MyC2d2TanOn (const GccEnt_QualifiedLin & Qualified1,const Geom2dGcc_MyQCurve & Qualified2,const Geom2dAdaptor_Curve & OnCurve,const Standard_Real Param1,const Standard_Real Param2,const Standard_Real ParamOn,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(Geom2dGcc_MyQCurve)
	Point2(gp_Pnt2d)
	OnCurve(Geom2dAdaptor_Curve)
	Param1(Standard_Real)
	ParamOn(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_MyC2d2TanOn;
		 Geom2dGcc_MyC2d2TanOn (const Geom2dGcc_MyQCurve & Qualified1,const gp_Pnt2d & Point2,const Geom2dAdaptor_Curve & OnCurve,const Standard_Real Param1,const Standard_Real ParamOn,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(Geom2dGcc_MyQCurve)
	Qualified2(Geom2dGcc_MyQCurve)
	OnCurve(Geom2dAdaptor_Curve)
	Param1(Standard_Real)
	Param2(Standard_Real)
	ParamOn(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_MyC2d2TanOn;
		 Geom2dGcc_MyC2d2TanOn (const Geom2dGcc_MyQCurve & Qualified1,const Geom2dGcc_MyQCurve & Qualified2,const Geom2dAdaptor_Curve & OnCurve,const Standard_Real Param1,const Standard_Real Param2,const Standard_Real ParamOn,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Circ2d

No detailed docstring for this function.") ThisSolution;
		gp_Circ2d ThisSolution ();
		%feature("autodoc", "Args:
	Qualif1(GccEnt_Position)
	Qualif2(GccEnt_Position)

Returns:
	None

No detailed docstring for this function.") WhichQualifier;
		void WhichQualifier (GccEnt_Position & Qualif1,GccEnt_Position & Qualif2);
		%feature("autodoc", "Args:
	ParSol(Standard_Real)
	ParArg(Standard_Real)
	PntSol(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") Tangency1;
		void Tangency1 (Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("autodoc", "Args:
	ParSol(Standard_Real)
	ParArg(Standard_Real)
	PntSol(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") Tangency2;
		void Tangency2 (Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("autodoc", "Args:
	ParArg(Standard_Real)
	PntSol(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") CenterOn3;
		void CenterOn3 (Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsTheSame1;
		Standard_Boolean IsTheSame1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsTheSame2;
		Standard_Boolean IsTheSame2 ();
};


%feature("shadow") Geom2dGcc_MyC2d2TanOn::~Geom2dGcc_MyC2d2TanOn %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dGcc_MyC2d2TanOn {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dGcc_MyC2d3Tan;
class Geom2dGcc_MyC2d3Tan {
	public:
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedCirc)
	Qualified2(GccEnt_QualifiedCirc)
	Qualified3(Geom2dGcc_MyQCurve)
	Param1(Standard_Real)
	Param2(Standard_Real)
	Param3(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_MyC2d3Tan;
		 Geom2dGcc_MyC2d3Tan (const GccEnt_QualifiedCirc & Qualified1,const GccEnt_QualifiedCirc & Qualified2,const Geom2dGcc_MyQCurve & Qualified3,const Standard_Real Param1,const Standard_Real Param2,const Standard_Real Param3,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedCirc)
	Qualified2(Geom2dGcc_MyQCurve)
	Qualified3(Geom2dGcc_MyQCurve)
	Param1(Standard_Real)
	Param2(Standard_Real)
	Param3(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_MyC2d3Tan;
		 Geom2dGcc_MyC2d3Tan (const GccEnt_QualifiedCirc & Qualified1,const Geom2dGcc_MyQCurve & Qualified2,const Geom2dGcc_MyQCurve & Qualified3,const Standard_Real Param1,const Standard_Real Param2,const Standard_Real Param3,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedCirc)
	Qualified2(GccEnt_QualifiedLin)
	Qualified3(Geom2dGcc_MyQCurve)
	Param1(Standard_Real)
	Param2(Standard_Real)
	Param3(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_MyC2d3Tan;
		 Geom2dGcc_MyC2d3Tan (const GccEnt_QualifiedCirc & Qualified1,const GccEnt_QualifiedLin & Qualified2,const Geom2dGcc_MyQCurve & Qualified3,const Standard_Real Param1,const Standard_Real Param2,const Standard_Real Param3,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedCirc)
	Qualified2(Geom2dGcc_MyQCurve)
	Point3(gp_Pnt2d)
	Param1(Standard_Real)
	Param2(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_MyC2d3Tan;
		 Geom2dGcc_MyC2d3Tan (const GccEnt_QualifiedCirc & Qualified1,const Geom2dGcc_MyQCurve & Qualified2,const gp_Pnt2d & Point3,const Standard_Real Param1,const Standard_Real Param2,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedLin)
	Qualified2(GccEnt_QualifiedLin)
	Qualified3(Geom2dGcc_MyQCurve)
	Param1(Standard_Real)
	Param2(Standard_Real)
	Param3(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_MyC2d3Tan;
		 Geom2dGcc_MyC2d3Tan (const GccEnt_QualifiedLin & Qualified1,const GccEnt_QualifiedLin & Qualified2,const Geom2dGcc_MyQCurve & Qualified3,const Standard_Real Param1,const Standard_Real Param2,const Standard_Real Param3,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedLin)
	Qualified2(Geom2dGcc_MyQCurve)
	Qualified3(Geom2dGcc_MyQCurve)
	Param1(Standard_Real)
	Param2(Standard_Real)
	Param3(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_MyC2d3Tan;
		 Geom2dGcc_MyC2d3Tan (const GccEnt_QualifiedLin & Qualified1,const Geom2dGcc_MyQCurve & Qualified2,const Geom2dGcc_MyQCurve & Qualified3,const Standard_Real Param1,const Standard_Real Param2,const Standard_Real Param3,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedLin)
	Qualified2(Geom2dGcc_MyQCurve)
	Point3(gp_Pnt2d)
	Param1(Standard_Real)
	Param2(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_MyC2d3Tan;
		 Geom2dGcc_MyC2d3Tan (const GccEnt_QualifiedLin & Qualified1,const Geom2dGcc_MyQCurve & Qualified2,const gp_Pnt2d & Point3,const Standard_Real Param1,const Standard_Real Param2,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(Geom2dGcc_MyQCurve)
	Point1(gp_Pnt2d)
	Point2(gp_Pnt2d)
	Param1(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_MyC2d3Tan;
		 Geom2dGcc_MyC2d3Tan (const Geom2dGcc_MyQCurve & Qualified1,const gp_Pnt2d & Point1,const gp_Pnt2d & Point2,const Standard_Real Param1,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(Geom2dGcc_MyQCurve)
	Qualified2(Geom2dGcc_MyQCurve)
	Point2(gp_Pnt2d)
	Param1(Standard_Real)
	Param2(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_MyC2d3Tan;
		 Geom2dGcc_MyC2d3Tan (const Geom2dGcc_MyQCurve & Qualified1,const Geom2dGcc_MyQCurve & Qualified2,const gp_Pnt2d & Point2,const Standard_Real Param1,const Standard_Real Param2,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(Geom2dGcc_MyQCurve)
	Qualified2(Geom2dGcc_MyQCurve)
	Qualified3(Geom2dGcc_MyQCurve)
	Param1(Standard_Real)
	Param2(Standard_Real)
	Param3(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_MyC2d3Tan;
		 Geom2dGcc_MyC2d3Tan (const Geom2dGcc_MyQCurve & Qualified1,const Geom2dGcc_MyQCurve & Qualified2,const Geom2dGcc_MyQCurve & Qualified3,const Standard_Real Param1,const Standard_Real Param2,const Standard_Real Param3,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Circ2d

No detailed docstring for this function.") ThisSolution;
		gp_Circ2d ThisSolution ();
		%feature("autodoc", "Args:
	Qualif1(GccEnt_Position)
	Qualif2(GccEnt_Position)
	Qualif3(GccEnt_Position)

Returns:
	None

No detailed docstring for this function.") WhichQualifier;
		void WhichQualifier (GccEnt_Position & Qualif1,GccEnt_Position & Qualif2,GccEnt_Position & Qualif3);
		%feature("autodoc", "Args:
	ParSol(Standard_Real)
	ParArg(Standard_Real)
	PntSol(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") Tangency1;
		void Tangency1 (Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("autodoc", "Args:
	ParSol(Standard_Real)
	ParArg(Standard_Real)
	PntSol(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") Tangency2;
		void Tangency2 (Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("autodoc", "Args:
	ParSol(Standard_Real)
	ParArg(Standard_Real)
	PntSol(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") Tangency3;
		void Tangency3 (Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsTheSame1;
		Standard_Boolean IsTheSame1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsTheSame2;
		Standard_Boolean IsTheSame2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsTheSame3;
		Standard_Boolean IsTheSame3 ();
};


%feature("shadow") Geom2dGcc_MyC2d3Tan::~Geom2dGcc_MyC2d3Tan %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dGcc_MyC2d3Tan {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dGcc_MyCirc2d2TanOn;
class Geom2dGcc_MyCirc2d2TanOn {
	public:
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedCirc)
	Qualified2(GccEnt_QualifiedCirc)
	OnCurv(Geom2dAdaptor_Curve)
	Tolerance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_MyCirc2d2TanOn;
		 Geom2dGcc_MyCirc2d2TanOn (const GccEnt_QualifiedCirc & Qualified1,const GccEnt_QualifiedCirc & Qualified2,const Geom2dAdaptor_Curve & OnCurv,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedCirc)
	Qualified2(GccEnt_QualifiedLin)
	OnCurv(Geom2dAdaptor_Curve)
	Tolerance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_MyCirc2d2TanOn;
		 Geom2dGcc_MyCirc2d2TanOn (const GccEnt_QualifiedCirc & Qualified1,const GccEnt_QualifiedLin & Qualified2,const Geom2dAdaptor_Curve & OnCurv,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedCirc)
	Point2(gp_Pnt2d)
	OnCurv(Geom2dAdaptor_Curve)
	Tolerance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_MyCirc2d2TanOn;
		 Geom2dGcc_MyCirc2d2TanOn (const GccEnt_QualifiedCirc & Qualified1,const gp_Pnt2d & Point2,const Geom2dAdaptor_Curve & OnCurv,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedLin)
	Qualified2(GccEnt_QualifiedLin)
	OnCurv(Geom2dAdaptor_Curve)
	Tolerance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_MyCirc2d2TanOn;
		 Geom2dGcc_MyCirc2d2TanOn (const GccEnt_QualifiedLin & Qualified1,const GccEnt_QualifiedLin & Qualified2,const Geom2dAdaptor_Curve & OnCurv,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedLin)
	Qualified2(gp_Pnt2d)
	OnCurv(Geom2dAdaptor_Curve)
	Tolerance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_MyCirc2d2TanOn;
		 Geom2dGcc_MyCirc2d2TanOn (const GccEnt_QualifiedLin & Qualified1,const gp_Pnt2d & Qualified2,const Geom2dAdaptor_Curve & OnCurv,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Point1(gp_Pnt2d)
	Point2(gp_Pnt2d)
	OnCurv(Geom2dAdaptor_Curve)
	Tolerance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_MyCirc2d2TanOn;
		 Geom2dGcc_MyCirc2d2TanOn (const gp_Pnt2d & Point1,const gp_Pnt2d & Point2,const Geom2dAdaptor_Curve & OnCurv,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbSolutions;
		Standard_Integer NbSolutions ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Circ2d

No detailed docstring for this function.") ThisSolution;
		gp_Circ2d ThisSolution (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Qualif1(GccEnt_Position)
	Qualif2(GccEnt_Position)

Returns:
	None

No detailed docstring for this function.") WhichQualifier;
		void WhichQualifier (const Standard_Integer Index,GccEnt_Position & Qualif1,GccEnt_Position & Qualif2);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	ParSol(Standard_Real)
	ParArg(Standard_Real)
	PntSol(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") Tangency1;
		void Tangency1 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	ParSol(Standard_Real)
	ParArg(Standard_Real)
	PntSol(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") Tangency2;
		void Tangency2 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	ParArg(Standard_Real)
	PntSol(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") CenterOn3;
		void CenterOn3 (const Standard_Integer Index,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsTheSame1;
		Standard_Boolean IsTheSame1 (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsTheSame2;
		Standard_Boolean IsTheSame2 (const Standard_Integer Index);
};


%feature("shadow") Geom2dGcc_MyCirc2d2TanOn::~Geom2dGcc_MyCirc2d2TanOn %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dGcc_MyCirc2d2TanOn {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dGcc_MyCirc2d2TanRad;
class Geom2dGcc_MyCirc2d2TanRad {
	public:
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedCirc)
	Qualified2(Geom2dGcc_MyQCurve)
	Radius(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_MyCirc2d2TanRad;
		 Geom2dGcc_MyCirc2d2TanRad (const GccEnt_QualifiedCirc & Qualified1,const Geom2dGcc_MyQCurve & Qualified2,const Standard_Real Radius,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedLin)
	Qualified2(Geom2dGcc_MyQCurve)
	Radius(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_MyCirc2d2TanRad;
		 Geom2dGcc_MyCirc2d2TanRad (const GccEnt_QualifiedLin & Qualified1,const Geom2dGcc_MyQCurve & Qualified2,const Standard_Real Radius,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(Geom2dGcc_MyQCurve)
	Qualified2(Geom2dGcc_MyQCurve)
	Radius(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_MyCirc2d2TanRad;
		 Geom2dGcc_MyCirc2d2TanRad (const Geom2dGcc_MyQCurve & Qualified1,const Geom2dGcc_MyQCurve & Qualified2,const Standard_Real Radius,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(Geom2dGcc_MyQCurve)
	Point2(gp_Pnt2d)
	Radius(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_MyCirc2d2TanRad;
		 Geom2dGcc_MyCirc2d2TanRad (const Geom2dGcc_MyQCurve & Qualified1,const gp_Pnt2d & Point2,const Standard_Real Radius,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbSolutions;
		Standard_Integer NbSolutions ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Circ2d

No detailed docstring for this function.") ThisSolution;
		gp_Circ2d ThisSolution (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Qualif1(GccEnt_Position)
	Qualif2(GccEnt_Position)

Returns:
	None

No detailed docstring for this function.") WhichQualifier;
		void WhichQualifier (const Standard_Integer Index,GccEnt_Position & Qualif1,GccEnt_Position & Qualif2);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	ParSol(Standard_Real)
	ParArg(Standard_Real)
	PntSol(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") Tangency1;
		void Tangency1 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	ParSol(Standard_Real)
	ParArg(Standard_Real)
	PntSol(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") Tangency2;
		void Tangency2 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsTheSame1;
		Standard_Boolean IsTheSame1 (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsTheSame2;
		Standard_Boolean IsTheSame2 (const Standard_Integer Index);
};


%feature("shadow") Geom2dGcc_MyCirc2d2TanRad::~Geom2dGcc_MyCirc2d2TanRad %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dGcc_MyCirc2d2TanRad {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dGcc_MyCirc2dTanCen;
class Geom2dGcc_MyCirc2dTanCen {
	public:
		%feature("autodoc", "Args:
	Qualified1(Geom2dGcc_MyQCurve)
	Pcenter(gp_Pnt2d)
	Tolerance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_MyCirc2dTanCen;
		 Geom2dGcc_MyCirc2dTanCen (const Geom2dGcc_MyQCurve & Qualified1,const gp_Pnt2d & Pcenter,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbSolutions;
		Standard_Integer NbSolutions ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Circ2d

No detailed docstring for this function.") ThisSolution;
		gp_Circ2d ThisSolution (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Qualif1(GccEnt_Position)

Returns:
	None

No detailed docstring for this function.") WhichQualifier;
		void WhichQualifier (const Standard_Integer Index,GccEnt_Position & Qualif1);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	ParSol(Standard_Real)
	ParArg(Standard_Real)
	PntSol(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") Tangency1;
		void Tangency1 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
};


%feature("shadow") Geom2dGcc_MyCirc2dTanCen::~Geom2dGcc_MyCirc2dTanCen %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dGcc_MyCirc2dTanCen {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dGcc_MyCirc2dTanOnRad;
class Geom2dGcc_MyCirc2dTanOnRad {
	public:
		%feature("autodoc", "Args:
	Qualified1(Geom2dGcc_MyQCurve)
	OnLine(gp_Lin2d)
	Radius(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_MyCirc2dTanOnRad;
		 Geom2dGcc_MyCirc2dTanOnRad (const Geom2dGcc_MyQCurve & Qualified1,const gp_Lin2d & OnLine,const Standard_Real Radius,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(Geom2dGcc_MyQCurve)
	OnCirc(gp_Circ2d)
	Radius(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_MyCirc2dTanOnRad;
		 Geom2dGcc_MyCirc2dTanOnRad (const Geom2dGcc_MyQCurve & Qualified1,const gp_Circ2d & OnCirc,const Standard_Real Radius,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedCirc)
	OnCurv(Geom2dAdaptor_Curve)
	Radius(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_MyCirc2dTanOnRad;
		 Geom2dGcc_MyCirc2dTanOnRad (const GccEnt_QualifiedCirc & Qualified1,const Geom2dAdaptor_Curve & OnCurv,const Standard_Real Radius,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedLin)
	OnCurv(Geom2dAdaptor_Curve)
	Radius(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_MyCirc2dTanOnRad;
		 Geom2dGcc_MyCirc2dTanOnRad (const GccEnt_QualifiedLin & Qualified1,const Geom2dAdaptor_Curve & OnCurv,const Standard_Real Radius,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(Geom2dGcc_MyQCurve)
	OnCurv(Geom2dAdaptor_Curve)
	Radius(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_MyCirc2dTanOnRad;
		 Geom2dGcc_MyCirc2dTanOnRad (const Geom2dGcc_MyQCurve & Qualified1,const Geom2dAdaptor_Curve & OnCurv,const Standard_Real Radius,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Point1(gp_Pnt2d)
	OnCurv(Geom2dAdaptor_Curve)
	Radius(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_MyCirc2dTanOnRad;
		 Geom2dGcc_MyCirc2dTanOnRad (const gp_Pnt2d & Point1,const Geom2dAdaptor_Curve & OnCurv,const Standard_Real Radius,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbSolutions;
		Standard_Integer NbSolutions ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Circ2d

No detailed docstring for this function.") ThisSolution;
		gp_Circ2d ThisSolution (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Qualif1(GccEnt_Position)

Returns:
	None

No detailed docstring for this function.") WhichQualifier;
		void WhichQualifier (const Standard_Integer Index,GccEnt_Position & Qualif1);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	ParSol(Standard_Real)
	ParArg(Standard_Real)
	PntSol(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") Tangency1;
		void Tangency1 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	ParArg(Standard_Real)
	PntSol(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") CenterOn3;
		void CenterOn3 (const Standard_Integer Index,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsTheSame1;
		Standard_Boolean IsTheSame1 (const Standard_Integer Index);
};


%feature("shadow") Geom2dGcc_MyCirc2dTanOnRad::~Geom2dGcc_MyCirc2dTanOnRad %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dGcc_MyCirc2dTanOnRad {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dGcc_MyCurveTool;
class Geom2dGcc_MyCurveTool {
	public:
		%feature("autodoc", "Args:
	C(Adaptor3d_OffsetCurve)

Returns:
	static GeomAbs_CurveType

No detailed docstring for this function.") TheType;
		static GeomAbs_CurveType TheType (const Adaptor3d_OffsetCurve & C);
		%feature("autodoc", "Args:
	C(Adaptor3d_OffsetCurve)

Returns:
	static gp_Lin2d

No detailed docstring for this function.") Line;
		static gp_Lin2d Line (const Adaptor3d_OffsetCurve & C);
		%feature("autodoc", "Args:
	C(Adaptor3d_OffsetCurve)

Returns:
	static gp_Circ2d

No detailed docstring for this function.") Circle;
		static gp_Circ2d Circle (const Adaptor3d_OffsetCurve & C);
		%feature("autodoc", "Args:
	C(Adaptor3d_OffsetCurve)

Returns:
	static gp_Elips2d

No detailed docstring for this function.") Ellipse;
		static gp_Elips2d Ellipse (const Adaptor3d_OffsetCurve & C);
		%feature("autodoc", "Args:
	C(Adaptor3d_OffsetCurve)

Returns:
	static gp_Parab2d

No detailed docstring for this function.") Parabola;
		static gp_Parab2d Parabola (const Adaptor3d_OffsetCurve & C);
		%feature("autodoc", "Args:
	C(Adaptor3d_OffsetCurve)

Returns:
	static gp_Hypr2d

No detailed docstring for this function.") Hyperbola;
		static gp_Hypr2d Hyperbola (const Adaptor3d_OffsetCurve & C);
		%feature("autodoc", "Args:
	C(Adaptor3d_OffsetCurve)

Returns:
	static Standard_Real

No detailed docstring for this function.") FirstParameter;
		static Standard_Real FirstParameter (const Adaptor3d_OffsetCurve & C);
		%feature("autodoc", "Args:
	C(Adaptor3d_OffsetCurve)

Returns:
	static Standard_Real

No detailed docstring for this function.") LastParameter;
		static Standard_Real LastParameter (const Adaptor3d_OffsetCurve & C);
		%feature("autodoc", "Args:
	C(Adaptor3d_OffsetCurve)
	Tol(Standard_Real)

Returns:
	static Standard_Real

No detailed docstring for this function.") EpsX;
		static Standard_Real EpsX (const Adaptor3d_OffsetCurve & C,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C(Adaptor3d_OffsetCurve)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbSamples;
		static Standard_Integer NbSamples (const Adaptor3d_OffsetCurve & C);
		%feature("autodoc", "Args:
	C(Adaptor3d_OffsetCurve)
	X(Standard_Real)

Returns:
	static gp_Pnt2d

No detailed docstring for this function.") Value;
		static gp_Pnt2d Value (const Adaptor3d_OffsetCurve & C,const Standard_Real X);
		%feature("autodoc", "Args:
	C(Adaptor3d_OffsetCurve)
	U(Standard_Real)
	P(gp_Pnt2d)
	T(gp_Vec2d)

Returns:
	static void

No detailed docstring for this function.") D1;
		static void D1 (const Adaptor3d_OffsetCurve & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & T);
		%feature("autodoc", "Args:
	C(Adaptor3d_OffsetCurve)
	U(Standard_Real)
	P(gp_Pnt2d)
	T(gp_Vec2d)
	N(gp_Vec2d)

Returns:
	static void

No detailed docstring for this function.") D2;
		static void D2 (const Adaptor3d_OffsetCurve & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & T,gp_Vec2d & N);
		%feature("autodoc", "Args:
	C(Adaptor3d_OffsetCurve)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsComposite;
		static Standard_Boolean IsComposite (const Adaptor3d_OffsetCurve & C);
		%feature("autodoc", "Args:
	C(Adaptor3d_OffsetCurve)

Returns:
	static Standard_Integer

No detailed docstring for this function.") GetIntervals;
		static Standard_Integer GetIntervals (const Adaptor3d_OffsetCurve & C);
		%feature("autodoc", "Args:
	C(Adaptor3d_OffsetCurve)
	Index(Standard_Integer)
	U1(Standard_Real)
	U2(Standard_Real)

Returns:
	static void

No detailed docstring for this function.") GetInterval;
		static void GetInterval (const Adaptor3d_OffsetCurve & C,const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	C(Adaptor3d_OffsetCurve)
	Index(Standard_Integer)

Returns:
	static void

No detailed docstring for this function.") SetCurrentInterval;
		static void SetCurrentInterval (Adaptor3d_OffsetCurve & C,const Standard_Integer Index);
};


%feature("shadow") Geom2dGcc_MyCurveTool::~Geom2dGcc_MyCurveTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dGcc_MyCurveTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dGcc_MyL2d2Tan;
class Geom2dGcc_MyL2d2Tan {
	public:
		%feature("autodoc", "Args:
	Qualified1(Geom2dGcc_MyQCurve)
	ThePoint(gp_Pnt2d)
	Param1(Standard_Real)
	Tolang(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_MyL2d2Tan;
		 Geom2dGcc_MyL2d2Tan (const Geom2dGcc_MyQCurve & Qualified1,const gp_Pnt2d & ThePoint,const Standard_Real Param1,const Standard_Real Tolang);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedCirc)
	Qualified2(Geom2dGcc_MyQCurve)
	Param2(Standard_Real)
	Tolang(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_MyL2d2Tan;
		 Geom2dGcc_MyL2d2Tan (const GccEnt_QualifiedCirc & Qualified1,const Geom2dGcc_MyQCurve & Qualified2,const Standard_Real Param2,const Standard_Real Tolang);
		%feature("autodoc", "Args:
	Qualified1(Geom2dGcc_MyQCurve)
	Qualified2(Geom2dGcc_MyQCurve)
	Param1(Standard_Real)
	Param2(Standard_Real)
	Tolang(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_MyL2d2Tan;
		 Geom2dGcc_MyL2d2Tan (const Geom2dGcc_MyQCurve & Qualified1,const Geom2dGcc_MyQCurve & Qualified2,const Standard_Real Param1,const Standard_Real Param2,const Standard_Real Tolang);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Lin2d

No detailed docstring for this function.") ThisSolution;
		gp_Lin2d ThisSolution ();
		%feature("autodoc", "Args:
	Qualif1(GccEnt_Position)
	Qualif2(GccEnt_Position)

Returns:
	None

No detailed docstring for this function.") WhichQualifier;
		void WhichQualifier (GccEnt_Position & Qualif1,GccEnt_Position & Qualif2);
		%feature("autodoc", "Args:
	ParSol(Standard_Real)
	ParArg(Standard_Real)
	PntSol(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") Tangency1;
		void Tangency1 (Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("autodoc", "Args:
	ParSol(Standard_Real)
	ParArg(Standard_Real)
	PntSol(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") Tangency2;
		void Tangency2 (Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
};


%feature("shadow") Geom2dGcc_MyL2d2Tan::~Geom2dGcc_MyL2d2Tan %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dGcc_MyL2d2Tan {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dGcc_MyL2dTanObl;
class Geom2dGcc_MyL2dTanObl {
	public:
		%feature("autodoc", "Args:
	Qualified1(Geom2dGcc_MyQCurve)
	TheLin(gp_Lin2d)
	Param1(Standard_Real)
	TolAng(Standard_Real)
	Angle(Standard_Real)=0

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_MyL2dTanObl;
		 Geom2dGcc_MyL2dTanObl (const Geom2dGcc_MyQCurve & Qualified1,const gp_Lin2d & TheLin,const Standard_Real Param1,const Standard_Real TolAng,const Standard_Real Angle = 0);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Lin2d

No detailed docstring for this function.") ThisSolution;
		gp_Lin2d ThisSolution ();
		%feature("autodoc", "Args:
	Qualif1(GccEnt_Position)

Returns:
	None

No detailed docstring for this function.") WhichQualifier;
		void WhichQualifier (GccEnt_Position & Qualif1);
		%feature("autodoc", "Args:
	ParSol(Standard_Real)
	ParArg(Standard_Real)
	PntSol(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") Tangency1;
		void Tangency1 (Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("autodoc", "Args:
	ParSol(Standard_Real)
	ParArg(Standard_Real)
	PntSol(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") Intersection2;
		void Intersection2 (Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsParallel2;
		Standard_Boolean IsParallel2 ();
};


%feature("shadow") Geom2dGcc_MyL2dTanObl::~Geom2dGcc_MyL2dTanObl %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dGcc_MyL2dTanObl {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dGcc_MyQCurve;
class Geom2dGcc_MyQCurve {
	public:
		%feature("autodoc", "Args:
	Curve(Geom2dAdaptor_Curve)
	Qualifier(GccEnt_Position)

Returns:
	None

No detailed docstring for this function.") Geom2dGcc_MyQCurve;
		 Geom2dGcc_MyQCurve (const Geom2dAdaptor_Curve & Curve,const GccEnt_Position Qualifier);
		%feature("autodoc", "Args:
	None
Returns:
	Geom2dAdaptor_Curve

No detailed docstring for this function.") Qualified;
		Geom2dAdaptor_Curve Qualified ();
		%feature("autodoc", "Args:
	None
Returns:
	GccEnt_Position

No detailed docstring for this function.") Qualifier;
		GccEnt_Position Qualifier ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsUnqualified;
		Standard_Boolean IsUnqualified ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEnclosing;
		Standard_Boolean IsEnclosing ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEnclosed;
		Standard_Boolean IsEnclosed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsOutside;
		Standard_Boolean IsOutside ();
};


%feature("shadow") Geom2dGcc_MyQCurve::~Geom2dGcc_MyQCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dGcc_MyQCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dGcc_QualifiedCurve;
class Geom2dGcc_QualifiedCurve {
	public:
		%feature("autodoc", "Args:
	Curve(Geom2dAdaptor_Curve)
	Qualifier(GccEnt_Position)

Returns:
	None

Constructs a qualified curve by assigning the qualifier  
Qualifier to the curve Curve. Qualifier may be:  
-   GccEnt_enclosing if the solution of a construction  
  algorithm using the qualified curve encloses the curve, or  
-   GccEnt_enclosed if the solution is enclosed by the curve, or  
-   GccEnt_outside if both the solution and the curve  
  are external to one another, or  
-   GccEnt_unqualified if all solutions apply.  
Note: The interior of a curve is defined as the left-hand  
side of the curve in relation to its orientation.  
Warning  
Curve is an adapted curve, i.e. an object which is an interface between:  
-   the services provided by a 2D curve from the package Geom2d,  
-   and those required on the curve by a computation algorithm.  
The adapted curve is created in the following way:  
Handle_Geom2d_Curve mycurve = ... ;  
Geom2dAdaptor_Curve Curve ( mycurve ) ;  
The qualified curve is then constructed with this object:  
GccEnt_Position myQualif = GccEnt_outside ;  
Geom2dGcc_QualifiedCurve myQCurve ( Curve, myQualif );  
is private;") Geom2dGcc_QualifiedCurve;
		 Geom2dGcc_QualifiedCurve (const Geom2dAdaptor_Curve & Curve,const GccEnt_Position Qualifier);
		%feature("autodoc", "Args:
	None
Returns:
	Geom2dAdaptor_Curve

Returns a 2D curve to which the qualifier is assigned.  
Warning  
The returned curve is an adapted curve, i.e. an object  
which is an interface between:  
-   the services provided by a 2D curve from the package Geom2d,  
-   and those required on the curve by a computation algorithm.  
The Geom2d curve on which the adapted curve is  
based can be obtained in the following way:  
myQualifiedCurve = ... ;  
Geom2dAdaptor_Curve myAdaptedCurve = myQualifiedCurve.Qualified();  
Handle_Geom2d_Curve = myAdaptedCurve.Curve();") Qualified;
		Geom2dAdaptor_Curve Qualified ();
		%feature("autodoc", "Args:
	None
Returns:
	GccEnt_Position

Returns  
- the qualifier of this qualified curve if it is enclosing,  
  enclosed or outside, or  
-   GccEnt_noqualifier if it is unqualified.") Qualifier;
		GccEnt_Position Qualifier ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the solution is unqualified and false in the other cases.") IsUnqualified;
		Standard_Boolean IsUnqualified ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

It returns true if the solution is Enclosing the Curv and false in  
the other cases.") IsEnclosing;
		Standard_Boolean IsEnclosing ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

It returns true if the solution is Enclosed in the Curv and false in  
the other cases.") IsEnclosed;
		Standard_Boolean IsEnclosed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

It returns true if the solution is Outside the Curv and false in  
the other cases.") IsOutside;
		Standard_Boolean IsOutside ();
};


%feature("shadow") Geom2dGcc_QualifiedCurve::~Geom2dGcc_QualifiedCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dGcc_QualifiedCurve {
	void _kill_pointed() {
		delete $self;
	}
};
