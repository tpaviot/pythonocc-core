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
%module (package="OCC") GccAna

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

%include GccAna_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor GccAna_Circ2d2TanOn;
class GccAna_Circ2d2TanOn {
	public:
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedCirc)
	Qualified2(GccEnt_QualifiedCirc)
	OnLine(gp_Lin2d)
	Tolerance(Standard_Real)

Returns:
	None

This method implements the algorithms used to  
         create 2d circles TANgent to two 2d circles and  
         having the center ON a 2d line.") GccAna_Circ2d2TanOn;
		 GccAna_Circ2d2TanOn (const GccEnt_QualifiedCirc & Qualified1,const GccEnt_QualifiedCirc & Qualified2,const gp_Lin2d & OnLine,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedCirc)
	Qualified2(GccEnt_QualifiedLin)
	OnLine(gp_Lin2d)
	Tolerance(Standard_Real)

Returns:
	None

This method implements the algorithms used to  
         create 2d circles TANgent to a 2d circle and a 2d line  
         having the center ON a 2d line.") GccAna_Circ2d2TanOn;
		 GccAna_Circ2d2TanOn (const GccEnt_QualifiedCirc & Qualified1,const GccEnt_QualifiedLin & Qualified2,const gp_Lin2d & OnLine,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedLin)
	Qualified2(GccEnt_QualifiedLin)
	OnLine(gp_Lin2d)
	Tolerance(Standard_Real)

Returns:
	None

This method implements the algorithms used to  
         create 2d circles TANgent to two 2d lines  
         having the center ON a 2d line.") GccAna_Circ2d2TanOn;
		 GccAna_Circ2d2TanOn (const GccEnt_QualifiedLin & Qualified1,const GccEnt_QualifiedLin & Qualified2,const gp_Lin2d & OnLine,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedCirc)
	Point2(gp_Pnt2d)
	OnLine(gp_Lin2d)
	Tolerance(Standard_Real)

Returns:
	None

This method implements the algorithms used to  
         create 2d circles TANgent to a 2d circle and a point  
         having the center ON a 2d line.") GccAna_Circ2d2TanOn;
		 GccAna_Circ2d2TanOn (const GccEnt_QualifiedCirc & Qualified1,const gp_Pnt2d & Point2,const gp_Lin2d & OnLine,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedLin)
	Point2(gp_Pnt2d)
	OnLine(gp_Lin2d)
	Tolerance(Standard_Real)

Returns:
	None

This method implements the algorithms used to  
         create 2d circles TANgent to a 2d line and a point  
         having the center ON a 2d line.") GccAna_Circ2d2TanOn;
		 GccAna_Circ2d2TanOn (const GccEnt_QualifiedLin & Qualified1,const gp_Pnt2d & Point2,const gp_Lin2d & OnLine,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Point1(gp_Pnt2d)
	Point2(gp_Pnt2d)
	OnLine(gp_Lin2d)
	Tolerance(Standard_Real)

Returns:
	None

This method implements the algorithms used to  
         create 2d circles TANgent to two points  
         having the center ON a 2d line.") GccAna_Circ2d2TanOn;
		 GccAna_Circ2d2TanOn (const gp_Pnt2d & Point1,const gp_Pnt2d & Point2,const gp_Lin2d & OnLine,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedCirc)
	Qualified2(GccEnt_QualifiedCirc)
	OnCirc(gp_Circ2d)
	Tolerance(Standard_Real)

Returns:
	None

This method implements the algorithms used to  
         create 2d circles TANgent to two 2d circles and  
         having the center ON a 2d circle.") GccAna_Circ2d2TanOn;
		 GccAna_Circ2d2TanOn (const GccEnt_QualifiedCirc & Qualified1,const GccEnt_QualifiedCirc & Qualified2,const gp_Circ2d & OnCirc,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedCirc)
	Qualified2(GccEnt_QualifiedLin)
	OnCirc(gp_Circ2d)
	Tolerance(Standard_Real)

Returns:
	None

This method implements the algorithms used to  
         create 2d circles TANgent to a circle and a line  
         having the center ON a 2d circle.") GccAna_Circ2d2TanOn;
		 GccAna_Circ2d2TanOn (const GccEnt_QualifiedCirc & Qualified1,const GccEnt_QualifiedLin & Qualified2,const gp_Circ2d & OnCirc,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedCirc)
	Point2(gp_Pnt2d)
	OnCirc(gp_Circ2d)
	Tolerance(Standard_Real)

Returns:
	None

This method implements the algorithms used to  
         create 2d circles TANgent to a circle and a point  
         having the center ON a 2d circle.") GccAna_Circ2d2TanOn;
		 GccAna_Circ2d2TanOn (const GccEnt_QualifiedCirc & Qualified1,const gp_Pnt2d & Point2,const gp_Circ2d & OnCirc,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedLin)
	Qualified2(GccEnt_QualifiedLin)
	OnCirc(gp_Circ2d)
	Tolerance(Standard_Real)

Returns:
	None

This method implements the algorithms used to  
         create 2d circles TANgent to two 2d lines  
         having the center ON a 2d circle.") GccAna_Circ2d2TanOn;
		 GccAna_Circ2d2TanOn (const GccEnt_QualifiedLin & Qualified1,const GccEnt_QualifiedLin & Qualified2,const gp_Circ2d & OnCirc,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedLin)
	Point2(gp_Pnt2d)
	OnCirc(gp_Circ2d)
	Tolerance(Standard_Real)

Returns:
	None

This method implements the algorithms used to  
         create 2d circles TANgent to a line and a point  
         having the center ON a 2d circle.") GccAna_Circ2d2TanOn;
		 GccAna_Circ2d2TanOn (const GccEnt_QualifiedLin & Qualified1,const gp_Pnt2d & Point2,const gp_Circ2d & OnCirc,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Point1(gp_Pnt2d)
	Point2(gp_Pnt2d)
	OnCirc(gp_Circ2d)
	Tolerance(Standard_Real)

Returns:
	None

This method implements the algorithms used to create  
         2d circles TANgent to two points having the center ON  
         a 2d circle.") GccAna_Circ2d2TanOn;
		 GccAna_Circ2d2TanOn (const gp_Pnt2d & Point1,const gp_Pnt2d & Point2,const gp_Circ2d & OnCirc,const Standard_Real Tolerance);
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

Returns the number of circles, representing solutions  
computed by this algorithm.  
Exceptions  
StdFail_NotDone if the construction fails.") NbSolutions;
		Standard_Integer NbSolutions ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Circ2d

Returns the solution number Index and raises OutOfRange  
         exception if Index is greater than the number of solutions.  
         Be careful: the Index is only a way to get all the  
         solutions, but is not associated to those outside the context  
         of the algorithm-object.  
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
-   GccEnt_noqualifier if the tangency argument is a point.  
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

Returns the informations about the tangency point between the  
         result number Index and the first argument.  
         ParSol is the intrinsic parameter of the point PntSol on  
         the solution  
         ParArg is the intrinsic parameter of the point PntSol on  
         the first argument. Raises OutOfRange if Index is greater than the number  
         of solutions and NotDone if IsDone returns false.") Tangency1;
		void Tangency1 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	ParSol(Standard_Real)
	ParArg(Standard_Real)
	PntSol(gp_Pnt2d)

Returns:
	None

Returns the informations about the tangency point between the  
         result number Index and the second argument.  
         ParSol is the intrinsic parameter of the point PntSol on  
         the solution.  
         ParArg is the intrinsic parameter of the point PntSol on  
         the second argument. Raises OutOfRange if Index is greater than the number  
         of solutions and NotDone if IsDone returns false.") Tangency2;
		void Tangency2 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	ParArg(Standard_Real)
	PntArg(gp_Pnt2d)

Returns:
	None

Returns the informations about the center (on the curv) of  
         the result number Index and the third argument.  
         ParArg is the intrinsic parameter of the point PntArg on  
         the third argument.  
   Exceptions  
Standard_OutOfRange if Index is less than zero or  
greater than the number of solutions computed by this algorithm.  
StdFail_NotDone if the construction fails.") CenterOn3;
		void CenterOn3 (const Standard_Integer Index,Standard_Real &OutValue,gp_Pnt2d & PntArg);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Boolean

True if the solution and the first argument are the same  
         (2 circles).  
         If R1 is the radius of the first argument and Rsol the radius  
         of the solution and dist the distance between the two centers,  
         we concider the two circles are identical if R1+dist-Rsol is  
         less than Tolerance.  
         False in the other cases.  
 Raises OutOfRange if Index is greater than the number  
         of solutions and NotDone if IsDone returns false.") IsTheSame1;
		Standard_Boolean IsTheSame1 (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Boolean

True if the solution and the second argument are the same  
         (2 circles).  
         If R2 is the radius of the second argument and Rsol the radius  
         of the solution and dist the distance between the two centers,  
         we concider the two circles are identical if R2+dist-Rsol is  
         less than Tolerance.  
         False in the other cases.  
Raises OutOfRange if Index is greater than the number  
         of solutions and NotDone if IsDone returns false.") IsTheSame2;
		Standard_Boolean IsTheSame2 (const Standard_Integer Index);
};


%feature("shadow") GccAna_Circ2d2TanOn::~GccAna_Circ2d2TanOn %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GccAna_Circ2d2TanOn {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GccAna_Circ2d2TanRad;
class GccAna_Circ2d2TanRad {
	public:
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedCirc)
	Qualified2(GccEnt_QualifiedCirc)
	Radius(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

This method implements the algorithms used to  
         create 2d circles TANgent to two 2d circle with a  
         radius of Radius.  It raises NegativeValue if Radius is lower than zero.") GccAna_Circ2d2TanRad;
		 GccAna_Circ2d2TanRad (const GccEnt_QualifiedCirc & Qualified1,const GccEnt_QualifiedCirc & Qualified2,const Standard_Real Radius,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedCirc)
	Qualified2(GccEnt_QualifiedLin)
	Radius(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

This method implements the algorithms used to  
         create 2d circles TANgent to a 2d circle and a 2d line  
         with a radius of Radius.  It raises NegativeValue if Radius is lower than zero.") GccAna_Circ2d2TanRad;
		 GccAna_Circ2d2TanRad (const GccEnt_QualifiedCirc & Qualified1,const GccEnt_QualifiedLin & Qualified2,const Standard_Real Radius,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedCirc)
	Point2(gp_Pnt2d)
	Radius(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

This method implements the algorithms used to  
         create 2d circles TANgent to a 2d circle and a point  
         with a radius of Radius.  It raises NegativeValue if Radius is lower than zero.") GccAna_Circ2d2TanRad;
		 GccAna_Circ2d2TanRad (const GccEnt_QualifiedCirc & Qualified1,const gp_Pnt2d & Point2,const Standard_Real Radius,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedLin)
	Point2(gp_Pnt2d)
	Radius(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

This method implements the algorithms used to  
         create 2d circles TANgent to a 2d line and a point  
         with a radius of Radius.  It raises NegativeValue if Radius is lower than zero.") GccAna_Circ2d2TanRad;
		 GccAna_Circ2d2TanRad (const GccEnt_QualifiedLin & Qualified1,const gp_Pnt2d & Point2,const Standard_Real Radius,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedLin)
	Qualified2(GccEnt_QualifiedLin)
	Radius(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

This method implements the algorithms used to  
         create 2d circles TANgent to two 2d lines  
         with a radius of Radius.  It raises NegativeValue if Radius is lower than zero.") GccAna_Circ2d2TanRad;
		 GccAna_Circ2d2TanRad (const GccEnt_QualifiedLin & Qualified1,const GccEnt_QualifiedLin & Qualified2,const Standard_Real Radius,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Point1(gp_Pnt2d)
	Point2(gp_Pnt2d)
	Radius(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

This method implements the algorithms used to  
         create 2d circles passing through two points with a  
         radius of Radius.  It raises NegativeValue if Radius is lower than zero.") GccAna_Circ2d2TanRad;
		 GccAna_Circ2d2TanRad (const gp_Pnt2d & Point1,const gp_Pnt2d & Point2,const Standard_Real Radius,const Standard_Real Tolerance);
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

This method returns the number of circles, representing solutions computed by this algorithm.  
Exceptions  
StdFail_NotDone if the construction fails. of solutions.") NbSolutions;
		Standard_Integer NbSolutions ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Circ2d

Returns the solution number Index.  
         Be careful: the Index is only a way to get all the  
         solutions, but is not associated to those outside the context  
         of the algorithm-object. Raises OutOfRange exception if Index is greater  
         than the number of solutions.  
         It raises NotDone if the construction algorithm did not  
         succeed.") ThisSolution;
		gp_Circ2d ThisSolution (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Qualif1(GccEnt_Position)
	Qualif2(GccEnt_Position)

Returns:
	None

Returns the information about the qualifiers of  
         the tangency arguments concerning the solution number Index.  
         It returns the real qualifiers (the qualifiers given to the  
         constructor method in case of enclosed, enclosing and outside  
         and the qualifiers computedin case of unqualified).") WhichQualifier;
		void WhichQualifier (const Standard_Integer Index,GccEnt_Position & Qualif1,GccEnt_Position & Qualif2);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	ParSol(Standard_Real)
	ParArg(Standard_Real)
	PntSol(gp_Pnt2d)

Returns:
	None

Returns information about the tangency point between the  
result number Index and the first argument.  
ParSol is the intrinsic parameter of the point PntSol on the solution.  
ParArg is the intrinsic parameter of the point PntSol on the first  
argument. Raises OutOfRange if Index is greater than the number  
         of solutions.  
         It raises NotDone if the construction algorithm did not succeed") Tangency1;
		void Tangency1 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	ParSol(Standard_Real)
	ParArg(Standard_Real)
	PntSol(gp_Pnt2d)

Returns:
	None

Returns information about the tangency point between the  
         result number Index and the second argument.  
         ParSol is the intrinsic parameter of the point PntSol on  
         the solution.  
         ParArg is the intrinsic parameter of the point PntArg on  
         the second argument. Raises OutOfRange if Index is greater than the number  
         of solutions.  
         It raises NotDone if the construction algorithm did not succeed.") Tangency2;
		void Tangency2 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Boolean

Returns True if the solution number Index is equal to  
         the first argument. Raises OutOfRange if Index is greater than the number  
         of solutions.  
         It raises NotDone if the construction algorithm did not  
         succeed.") IsTheSame1;
		Standard_Boolean IsTheSame1 (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Boolean

Returns True if the solution number Index is equal to  
         the second argument. Raises OutOfRange if Index is greater than the number  
         of solutions.  
         It raises NotDone if the construction algorithm did not  succeed.") IsTheSame2;
		Standard_Boolean IsTheSame2 (const Standard_Integer Index);
};


%feature("shadow") GccAna_Circ2d2TanRad::~GccAna_Circ2d2TanRad %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GccAna_Circ2d2TanRad {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GccAna_Circ2d3Tan;
class GccAna_Circ2d3Tan {
	public:
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedCirc)
	Qualified2(GccEnt_QualifiedCirc)
	Qualified3(GccEnt_QualifiedCirc)
	Tolerance(Standard_Real)

Returns:
	None

This method implements the algorithms used to  
         create 2d circles tangent to 3 circles.  
         ConstructionError is raised if there is a problem during  
         the computation.") GccAna_Circ2d3Tan;
		 GccAna_Circ2d3Tan (const GccEnt_QualifiedCirc & Qualified1,const GccEnt_QualifiedCirc & Qualified2,const GccEnt_QualifiedCirc & Qualified3,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedCirc)
	Qualified2(GccEnt_QualifiedCirc)
	Qualified3(GccEnt_QualifiedLin)
	Tolerance(Standard_Real)

Returns:
	None

This method implements the algorithms used to  
         create 2d circles tangent to 2 circles and 1 line.  
         ConstructionError is raised if there is a problem during  
         the computation.") GccAna_Circ2d3Tan;
		 GccAna_Circ2d3Tan (const GccEnt_QualifiedCirc & Qualified1,const GccEnt_QualifiedCirc & Qualified2,const GccEnt_QualifiedLin & Qualified3,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedCirc)
	Qualified2(GccEnt_QualifiedLin)
	Qualified3(GccEnt_QualifiedLin)
	Tolerance(Standard_Real)

Returns:
	None

This method implements the algorithms used to  
         create 2d circles tangent to 1 circle and 2 lines.  
         ConstructionError is raised if there is a problem during  
         the computation.") GccAna_Circ2d3Tan;
		 GccAna_Circ2d3Tan (const GccEnt_QualifiedCirc & Qualified1,const GccEnt_QualifiedLin & Qualified2,const GccEnt_QualifiedLin & Qualified3,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedLin)
	Qualified2(GccEnt_QualifiedLin)
	Qualified3(GccEnt_QualifiedLin)
	Tolerance(Standard_Real)

Returns:
	None

This method implements the algorithms used to  
         create 2d circles tangent to 3 lines.  
         ConstructionError is raised if there is a problem during  
         the computation.") GccAna_Circ2d3Tan;
		 GccAna_Circ2d3Tan (const GccEnt_QualifiedLin & Qualified1,const GccEnt_QualifiedLin & Qualified2,const GccEnt_QualifiedLin & Qualified3,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedCirc)
	Qualified2(GccEnt_QualifiedCirc)
	Point3(gp_Pnt2d)
	Tolerance(Standard_Real)

Returns:
	None

This method implements the algorithms used to  
         create 2d circles tangent to 2 circles and 1 Point.  
         ConstructionError is raised if there is a problem during  
         the computation.") GccAna_Circ2d3Tan;
		 GccAna_Circ2d3Tan (const GccEnt_QualifiedCirc & Qualified1,const GccEnt_QualifiedCirc & Qualified2,const gp_Pnt2d & Point3,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedCirc)
	Qualified2(GccEnt_QualifiedLin)
	Point3(gp_Pnt2d)
	Tolerance(Standard_Real)

Returns:
	None

This method implements the algorithms used to  
         create 2d circles tangent to a circle and a line and  
         1 Point.  
         ConstructionError is raised if there is a problem during  
         the computation.") GccAna_Circ2d3Tan;
		 GccAna_Circ2d3Tan (const GccEnt_QualifiedCirc & Qualified1,const GccEnt_QualifiedLin & Qualified2,const gp_Pnt2d & Point3,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedLin)
	Qualified2(GccEnt_QualifiedLin)
	Point3(gp_Pnt2d)
	Tolerance(Standard_Real)

Returns:
	None

This method implements the algorithms used to  
         create 2d circles tangent to 2 lines and 1 Point.  
         ConstructionError is raised if there is a problem during  
         the computation.") GccAna_Circ2d3Tan;
		 GccAna_Circ2d3Tan (const GccEnt_QualifiedLin & Qualified1,const GccEnt_QualifiedLin & Qualified2,const gp_Pnt2d & Point3,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedCirc)
	Point2(gp_Pnt2d)
	Point3(gp_Pnt2d)
	Tolerance(Standard_Real)

Returns:
	None

This method implements the algorithms used to  
         create 2d circles tangent to a circle and passing  
         thrue 2 Points.  
         ConstructionError is raised if there is a problem during  
         the computation.") GccAna_Circ2d3Tan;
		 GccAna_Circ2d3Tan (const GccEnt_QualifiedCirc & Qualified1,const gp_Pnt2d & Point2,const gp_Pnt2d & Point3,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedLin)
	Point2(gp_Pnt2d)
	Point3(gp_Pnt2d)
	Tolerance(Standard_Real)

Returns:
	None

This method implements the algorithms used to  
         create 2d circles tangent to a line and passing  
         thrue 2 Points.  
         ConstructionError is raised if there is a problem during  
         the computation.") GccAna_Circ2d3Tan;
		 GccAna_Circ2d3Tan (const GccEnt_QualifiedLin & Qualified1,const gp_Pnt2d & Point2,const gp_Pnt2d & Point3,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Point1(gp_Pnt2d)
	Point2(gp_Pnt2d)
	Point3(gp_Pnt2d)
	Tolerance(Standard_Real)

Returns:
	None

This method implements the algorithms used to  
         create 2d circles passing thrue 3 Points.  
         ConstructionError is raised if there is a problem during  
         the computation.") GccAna_Circ2d3Tan;
		 GccAna_Circ2d3Tan (const gp_Pnt2d & Point1,const gp_Pnt2d & Point2,const gp_Pnt2d & Point3,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

This method returns True if the construction  
         algorithm succeeded.  
Note: IsDone protects against a failure arising from a  
more internal intersection algorithm, which has  
reached its numeric limits.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

This method returns the number of solutions.  
   Raises NotDone if the construction algorithm didn't succeed.") NbSolutions;
		Standard_Integer NbSolutions ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Circ2d

Returns the solution number Index and raises OutOfRange  
  	    exception if Index is greater than the number of  
  	    solutions.  
         Be careful: the Index is only a way to get all the  
         solutions, but is not associated to those outside the  
         context of the algorithm-object.  
   Raises OutOfRange if Index is greater than  
         the number of solutions.  
         It raises NotDone if the algorithm failed.") ThisSolution;
		gp_Circ2d ThisSolution (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Qualif1(GccEnt_Position)
	Qualif2(GccEnt_Position)
	Qualif3(GccEnt_Position)

Returns:
	None

Returns the informations about the qualifiers of the  
         tangency  
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
         result number Index and the first argument.  
         ParSol is the intrinsic parameter of the point PntSol  
         on the solution curv.  
         ParArg is the intrinsic parameter of the point PntArg  
         on the argument curv. Raises OutOfRange if Index is greater than  
         the number of solutions.  
         It raises NotDone if the algorithm failed.") Tangency1;
		void Tangency1 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	ParSol(Standard_Real)
	ParArg(Standard_Real)
	PntSol(gp_Pnt2d)

Returns:
	None

Returns informations about the tangency point between the  
         result number Index and the first argument.  
         ParSol is the intrinsic parameter of the point PntSol  
         on the solution curv.  
         ParArg is the intrinsic parameter of the point Pntsol  
         on the argument curv. Raises OutOfRange if Index is greater than  
         the number of solutions.  
         It raises NotDone if the algorithm failed.") Tangency2;
		void Tangency2 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	ParSol(Standard_Real)
	ParArg(Standard_Real)
	PntSol(gp_Pnt2d)

Returns:
	None

Returns informations about the tangency point between the  
         result number Index and the first argument.  
         ParSol is the intrinsic parameter of the point PntSol  
         on the solution curv.  
         ParArg is the intrinsic parameter of the point Pntsol  
         on the argument curv. Raises OutOfRange if Index is greater than  
         the number of solutions.  
         It raises NotDone if the algorithm failed.") Tangency3;
		void Tangency3 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Boolean

Returns True if the solution number Index is equal to  
         the first argument. Raises OutOfRange if Index is greater than  
         the number of solutions.  
         It raises NotDone if the algorithm failed.") IsTheSame1;
		Standard_Boolean IsTheSame1 (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Boolean

Returns True if the solution number Index is equal to  
         the second argument. Raises OutOfRange Index is greater than  
         the number of solutions.  
         It raises NotDone if the algorithm failed.") IsTheSame2;
		Standard_Boolean IsTheSame2 (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Boolean

Returns True if the solution number Index is equal to  
         the third argument. Raises OutOfRange if Index is greater than  
         the number of solutions.  
         It raises NotDone if the algorithm failed.") IsTheSame3;
		Standard_Boolean IsTheSame3 (const Standard_Integer Index);
};


%feature("shadow") GccAna_Circ2d3Tan::~GccAna_Circ2d3Tan %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GccAna_Circ2d3Tan {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GccAna_Circ2dBisec;
class GccAna_Circ2dBisec {
	public:
		%feature("autodoc", "Args:
	Circ1(gp_Circ2d)
	Circ2(gp_Circ2d)

Returns:
	None

Constructs bisecting curves between the two circles Circ1 and Circ2.") GccAna_Circ2dBisec;
		 GccAna_Circ2dBisec (const gp_Circ2d & Circ1,const gp_Circ2d & Circ2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

This method returns True if the construction algorithm succeeded.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

This method returns the number of solutions.  
   Raises NotDone if the construction algorithm  didn't succeed.") NbSolutions;
		Standard_Integer NbSolutions ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_GccInt_Bisec

Returns the solution number Index  
Raises OutOfRange exception if Index is greater than  
         the number of solutions.  
         It raises NotDone if the construction algorithm  
         didn't succeed.") ThisSolution;
		Handle_GccInt_Bisec ThisSolution (const Standard_Integer Index);
};


%feature("shadow") GccAna_Circ2dBisec::~GccAna_Circ2dBisec %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GccAna_Circ2dBisec {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GccAna_Circ2dTanCen;
class GccAna_Circ2dTanCen {
	public:
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedCirc)
	Pcenter(gp_Pnt2d)
	Tolerance(Standard_Real)

Returns:
	None

This method implements the algorithms used to  
         create 2d circles tangent to a circle and  
         centered on a point.") GccAna_Circ2dTanCen;
		 GccAna_Circ2dTanCen (const GccEnt_QualifiedCirc & Qualified1,const gp_Pnt2d & Pcenter,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Linetan(gp_Lin2d)
	Pcenter(gp_Pnt2d)

Returns:
	None

This method implements the algorithms used to  
         create 2d circles tangent to a line and  
         centered on a point.") GccAna_Circ2dTanCen;
		 GccAna_Circ2dTanCen (const gp_Lin2d & Linetan,const gp_Pnt2d & Pcenter);
		%feature("autodoc", "Args:
	Point1(gp_Pnt2d)
	Pcenter(gp_Pnt2d)

Returns:
	None

This method implements the algorithms used to  
         create 2d circles passing thrue a point and  
         centered on a point.  
Tolerance is a tolerance criterion used by the algorithm  
to find a solution when, mathematically, the problem  
posed does not have a solution, but where there is  
numeric uncertainty attached to the arguments.  
In these algorithms Tolerance is only used in very  
specific cases where the center of the solution is very  
close to the circle to which it is tangential, and where the  
solution is therefore a very small circle.  
Exceptions  
GccEnt_BadQualifier if a qualifier is inconsistent with  
the argument it qualifies (for example, enclosing for a line).") GccAna_Circ2dTanCen;
		 GccAna_Circ2dTanCen (const gp_Pnt2d & Point1,const gp_Pnt2d & Pcenter);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

This method returns True if the construction  
         algorithm succeeded.  
Note: IsDone protects against a failure arising from a  
more internal intersection algorithm, which has reached  
its numeric limits.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of circles, representing solutions  
computed by this algorithm and raises NotDone  
         exception if the algorithm didn't succeed.") NbSolutions;
		Standard_Integer NbSolutions ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Circ2d

Returns the circle, representing the solution number Index and raises OutOfRange  
         exception if Index is greater than the number of solutions.  
         Be carefull: the Index is only a way to get all the  
         solutions, but is not associated to theses outside the  
         context of the algorithm-object.  
Raises NotDone if the construction algorithm didn't succeed.  
         It raises OutOfRange if Index is greater than the  
         number of solutions or less than zer") ThisSolution;
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
It returns the real qualifiers (the qualifiers given to the  
constructor method in case of enclosed, enclosing and outside  
and the qualifiers computedin case of unqualified).") WhichQualifier;
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
         ParSol is the intrinsic parameter of the point PntSol  
         on the solution curv.  
         ParArg is the intrinsic parameter of the point PntArg  
         on the argument curv.  It raises NotDone if the construction algorithm  
         didn't succeed.  
         It raises OutOfRange if Index is greater than the  
         number of solutions or less than zero.") Tangency1;
		void Tangency1 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Boolean

Returns True if the solution number Index is equal to  
         the first argument.  It raises NotDone if the construction algorithm  
         didn't succeed.  
         It raises OutOfRange if Index is greater than the  
         number of solutions or less than zero.") IsTheSame1;
		Standard_Boolean IsTheSame1 (const Standard_Integer Index);
};


%feature("shadow") GccAna_Circ2dTanCen::~GccAna_Circ2dTanCen %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GccAna_Circ2dTanCen {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GccAna_Circ2dTanOnRad;
class GccAna_Circ2dTanOnRad {
	public:
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedCirc)
	OnLine(gp_Lin2d)
	Radius(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

This methods implements the algorithms used to create  
         2d Circles tangent to a circle and centered on a 2d Line  
         with a given radius.  
         Tolerance is used to find solution in every limit cases.  
         For example Tolerance is used in the case of EnclosedCirc when  
         Radius-R1+dist is greater Tolerance (dist is the distance  
         between the line and the location of the circ, R1 is the  
         radius of the circ) because there is no solution.  raises NegativeValue in case of NegativeRadius.") GccAna_Circ2dTanOnRad;
		 GccAna_Circ2dTanOnRad (const GccEnt_QualifiedCirc & Qualified1,const gp_Lin2d & OnLine,const Standard_Real Radius,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedLin)
	OnLine(gp_Lin2d)
	Radius(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

This methods implements the algorithms used to create  
         2d Circles tangent to a 2d Line and centered on a 2d Line  
         with a given radius.  
         Tolerance is used to find solution in every limit cases.  raises NegativeValue in case of NegativeRadius.") GccAna_Circ2dTanOnRad;
		 GccAna_Circ2dTanOnRad (const GccEnt_QualifiedLin & Qualified1,const gp_Lin2d & OnLine,const Standard_Real Radius,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Point1(gp_Pnt2d)
	OnLine(gp_Lin2d)
	Radius(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

This methods implements the algorithms used to create  
         2d Circles passing through a 2d Point and centered on a  
         2d Line with a given radius.  
         Tolerance is used to find solution in every limit cases.") GccAna_Circ2dTanOnRad;
		 GccAna_Circ2dTanOnRad (const gp_Pnt2d & Point1,const gp_Lin2d & OnLine,const Standard_Real Radius,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedCirc)
	OnCirc(gp_Circ2d)
	Radius(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

This methods implements the algorithms used to create  
         2d Circles tangent to a circle and centered on a 2d Circle  
         with a given radius.  
         Tolerance is used to find solution in every limit cases.  raises NegativeValue in case of NegativeRadius.") GccAna_Circ2dTanOnRad;
		 GccAna_Circ2dTanOnRad (const GccEnt_QualifiedCirc & Qualified1,const gp_Circ2d & OnCirc,const Standard_Real Radius,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedLin)
	OnCirc(gp_Circ2d)
	Radius(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

This methods implements the algorithms used to create  
         2d Circles tangent to a 2d Line and centered on a 2d Line  
         with a given radius.  
         Tolerance is used to find solution in every limit cases.  raises NegativeValue in case of NegativeRadius.") GccAna_Circ2dTanOnRad;
		 GccAna_Circ2dTanOnRad (const GccEnt_QualifiedLin & Qualified1,const gp_Circ2d & OnCirc,const Standard_Real Radius,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Point1(gp_Pnt2d)
	OnCirc(gp_Circ2d)
	Radius(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	None

This methods implements the algorithms used to create  
         2d Circles passing through a 2d Point and centered on a  
         2d Line with a given radius.  
         Tolerance is used to find solution in every limit cases.  raises NegativeValue in case of NegativeRadius.") GccAna_Circ2dTanOnRad;
		 GccAna_Circ2dTanOnRad (const gp_Pnt2d & Point1,const gp_Circ2d & OnCirc,const Standard_Real Radius,const Standard_Real Tolerance);
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

This method returns the number of circles, representing solutions.  
         Raises NotDone if the construction algorithm didn't succeed.") NbSolutions;
		Standard_Integer NbSolutions ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Circ2d

Returns the solution number Index and raises OutOfRange  
  	exception if Index is greater than the number of solutions.  
         Be careful: the Index is only a way to get all the  
         solutions, but is not associated to theses outside the  
         context of the algorithm-object.  
Raises NotDone if the construction algorithm  didn't succeed.  
         It raises OutOfRange if Index is greater than the  
         number of solutions") ThisSolution;
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
  as unqualified with respect to the argument, or  
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
         ParSol is the intrinsic parameter of the point on the  
         solution curv.  
         ParArg is the intrinsic parameter of the point on the  
         argument curv.  
         PntSol is the tangency point on the solution curv.  
         PntArg is the tangency point on the argument curv.  
   Raises NotDone if the construction algorithm didn't succeed.  
         It raises OutOfRange if Index is greater than the  
         number of solutions.") Tangency1;
		void Tangency1 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	ParArg(Standard_Real)
	PntSol(gp_Pnt2d)

Returns:
	None

Returns informations about the center (on the curv)  
         of the result.  
         ParArg is the intrinsic parameter of the point on  
         the argument curv.  
         PntSol is the center point of the solution curv.  
   Raises NotDone if the construction algorithm  didn't succeed.  
         It raises OutOfRange if Index is greater than the  
         number of solutions.") CenterOn3;
		void CenterOn3 (const Standard_Integer Index,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Boolean

Returns True if the solution number Index is equal to  
         the first argument and False in the other cases.  
   Raises NotDone if the construction algorithm  didn't succeed.  
         It raises OutOfRange if Index is greater than the  
         number of solutions.") IsTheSame1;
		Standard_Boolean IsTheSame1 (const Standard_Integer Index);
};


%feature("shadow") GccAna_Circ2dTanOnRad::~GccAna_Circ2dTanOnRad %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GccAna_Circ2dTanOnRad {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GccAna_CircLin2dBisec;
class GccAna_CircLin2dBisec {
	public:
		%feature("autodoc", "Args:
	Circle(gp_Circ2d)
	Line(gp_Lin2d)

Returns:
	None

Constructs bisecting curves between the circle Circle and the line Line.") GccAna_CircLin2dBisec;
		 GccAna_CircLin2dBisec (const gp_Circ2d & Circle,const gp_Lin2d & Line);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true (this construction algorithm never fails).") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of curves, representing solutions computed by this algorithm.") NbSolutions;
		Standard_Integer NbSolutions ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_GccInt_Bisec

Returns the solution number Index and raises OutOfRange  
        exception if Index is greater than the number of solutions  
   Exceptions  
Standard_OutOfRange if Index is less than zero or  
greater than the number of solutions computed by this algorithm.") ThisSolution;
		Handle_GccInt_Bisec ThisSolution (const Standard_Integer Index);
};


%feature("shadow") GccAna_CircLin2dBisec::~GccAna_CircLin2dBisec %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GccAna_CircLin2dBisec {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GccAna_CircPnt2dBisec;
class GccAna_CircPnt2dBisec {
	public:
		%feature("autodoc", "Args:
	Circle1(gp_Circ2d)
	Point2(gp_Pnt2d)

Returns:
	None

Constructs bisecting curves between the circle Circle1 and the point Point2.") GccAna_CircPnt2dBisec;
		 GccAna_CircPnt2dBisec (const gp_Circ2d & Circle1,const gp_Pnt2d & Point2);
		%feature("autodoc", "Args:
	Circle1(gp_Circ2d)
	Point2(gp_Pnt2d)
	Tolerance(Standard_Real)

Returns:
	None

Constructs bisecting curves between the circle Circle1 and the point Point2.  
         Tolerance is used.") GccAna_CircPnt2dBisec;
		 GccAna_CircPnt2dBisec (const gp_Circ2d & Circle1,const gp_Pnt2d & Point2,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true (this construction algorithm never fails).") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of curves, representing solutions computed by this algorithm.") NbSolutions;
		Standard_Integer NbSolutions ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_GccInt_Bisec

Returns the solution number Index and raises OutOfRange  
         exception if Index is greater than the number of solutions.  
Exceptions  
Standard_OutOfRange if Index is less than zero or  
greater than the number of solutions computed by this algorithm.") ThisSolution;
		Handle_GccInt_Bisec ThisSolution (const Standard_Integer Index);
};


%feature("shadow") GccAna_CircPnt2dBisec::~GccAna_CircPnt2dBisec %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GccAna_CircPnt2dBisec {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GccAna_Lin2d2Tan;
class GccAna_Lin2d2Tan {
	public:
		%feature("autodoc", "Args:
	ThePoint1(gp_Pnt2d)
	ThePoint2(gp_Pnt2d)
	Tolerance(Standard_Real)

Returns:
	None

This methods implements the algorithms used to  
         create 2d lines passing thrue 2 points.  
         Tolerance is used because we can't create a line  
         when the distance between the two points is too small.") GccAna_Lin2d2Tan;
		 GccAna_Lin2d2Tan (const gp_Pnt2d & ThePoint1,const gp_Pnt2d & ThePoint2,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedCirc)
	ThePoint(gp_Pnt2d)
	Tolerance(Standard_Real)

Returns:
	None

This methods implements the algorithms used to  
         create 2d lines tangent to one circle and passing  
         thrue a point.  
         Exception BadQualifier is raised in the case of  
         EnclosedCirc  
         Tolerance is used because there is no solution  
         when the point is inside the solution according to  
         the tolerance.") GccAna_Lin2d2Tan;
		 GccAna_Lin2d2Tan (const GccEnt_QualifiedCirc & Qualified1,const gp_Pnt2d & ThePoint,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedCirc)
	Qualified2(GccEnt_QualifiedCirc)
	Tolerance(Standard_Real)

Returns:
	None

This methods implements the algorithms used to  
         create 2d lines tangent to 2 circles.  
         Exception BadQualifier is raised in the case of  
         EnclosedCirc") GccAna_Lin2d2Tan;
		 GccAna_Lin2d2Tan (const GccEnt_QualifiedCirc & Qualified1,const GccEnt_QualifiedCirc & Qualified2,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

This method returns true when there is a solution  
         and false in the other cases.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

This method returns the number of solutions.  
         Raises NotDone if the construction algorithm didn't succeed.") NbSolutions;
		Standard_Integer NbSolutions ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Lin2d

Returns the solution number Index and raises OutOfRange  
          exception if Index is greater than the number of solutions.  
          Be carefull: the Index is only a way to get all the  
          solutions, but is not associated to theses outside the  
          context of the algorithm-object. Raises OutOfRange is raised if Index is greater than  
          the number of solutions.  
          It raises NotDone if the algorithm failed.") ThisSolution;
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
-   GccEnt_noqualifier if the tangency argument is a point.  
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
          ParSol is the intrinsic parameter of the point PntSol on  
          the solution curv.  
          ParArg is the intrinsic parameter of the point PntSol on  
          the argument curv. Raises OutOfRange is raised if Index is greater than  
          the number of solutions.  
          It raises NotDone if the algorithm failed.") Tangency1;
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
          ParSol is the intrinsic parameter of the point ParSol on  
          the solution curv.  
          ParArg is the intrinsic parameter of the point PntSol on  
          the argument curv. Raises OutOfRange is raised if Index is greater than  
         the number of solutions.  
         It raises NotDone if the algorithm failed.") Tangency2;
		void Tangency2 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
};


%feature("shadow") GccAna_Lin2d2Tan::~GccAna_Lin2d2Tan %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GccAna_Lin2d2Tan {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GccAna_Lin2dBisec;
class GccAna_Lin2dBisec {
	public:
		%feature("autodoc", "Args:
	Lin1(gp_Lin2d)
	Lin2(gp_Lin2d)

Returns:
	None

Constructs bisecting lines between the two lines Lin1 and Lin2.") GccAna_Lin2dBisec;
		 GccAna_Lin2dBisec (const gp_Lin2d & Lin1,const gp_Lin2d & Lin2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True when the algorithm succeded.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of solutions and raise NotDone if  
         the constructor wasn't called before.") NbSolutions;
		Standard_Integer NbSolutions ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Lin2d

//!Returns the solution number Index .  
         The first solution is the inside one and the second is the  
         outside one.  
         For the first solution the direction is D1+D2 (D1 is  
         the direction of the first argument and D2 the  
         direction of the second argument).  
         For the second solution the direction is D1-D2.  
Raises NotDone if the construction algorithm  
         didn't succeed.  
         It raises OutOfRange if Index is greater than the  
         number of solutions.") ThisSolution;
		gp_Lin2d ThisSolution (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	ParSol(Standard_Real)
	ParArg(Standard_Real)
	PntSol(gp_Pnt2d)

Returns:
	None

Returns informations about the intersection point between  
         the result number Index and the first argument.  
Raises NotDone if the construction algorithm  didn't succeed.  
         It raises OutOfRange if Index is greater than the  
         number of solutions.") Intersection1;
		void Intersection1 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	ParSol(Standard_Real)
	ParArg(Standard_Real)
	PntSol(gp_Pnt2d)

Returns:
	None

Returns informations about the intersection point between  
         the result number Index and the second argument.  
   Raises NotDone if the construction algorithm  
         didn't succeed.  
         It raises OutOfRange if Index is greater than the  
         number of solutions.") Intersection2;
		void Intersection2 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
};


%feature("shadow") GccAna_Lin2dBisec::~GccAna_Lin2dBisec %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GccAna_Lin2dBisec {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GccAna_Lin2dTanObl;
class GccAna_Lin2dTanObl {
	public:
		%feature("autodoc", "Args:
	ThePoint(gp_Pnt2d)
	TheLine(gp_Lin2d)
	TheAngle(Standard_Real)

Returns:
	None

This class implements the algorithms used to  
         create 2d line passing through a point and  
         making an angle with a line.") GccAna_Lin2dTanObl;
		 GccAna_Lin2dTanObl (const gp_Pnt2d & ThePoint,const gp_Lin2d & TheLine,const Standard_Real TheAngle);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedCirc)
	TheLine(gp_Lin2d)
	TheAngle(Standard_Real)

Returns:
	None

This class implements the algorithms used to  
         create 2d line tangent to a circle and  
         making an angle with a line.  
         Exceptions  
         GccEnt_BadQualifier if a qualifier is inconsistent with  
         the argument it qualifies (for example, enclosed for a circle).") GccAna_Lin2dTanObl;
		 GccAna_Lin2dTanObl (const GccEnt_QualifiedCirc & Qualified1,const gp_Lin2d & TheLine,const Standard_Real TheAngle);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the algorithm succeeded.  
          Note: IsDone protects against a failure arising from a  
          more internal intersection algorithm, which has reached  
          its numeric limits.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of  of lines, representing solutions computed by this algorithm.  
          Raises NotDone if the construction algorithm didn't succeed.") NbSolutions;
		Standard_Integer NbSolutions ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Lin2d

Returns the solution number Index.  
         Be careful: the Index is only a way to get all the  
         solutions, but is not associated to theses outside the  
         context of the algorithm-object.  
raises NotDone if the construction algorithm didn't succeed.  
         It raises OutOfRange if Index is greater than the   number of solutions.") ThisSolution;
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
          result number Index and the first argument.  
          ParSol is the intrinsic parameter of the point ParSol on  
          the solution curv.  
          ParArg is the intrinsic parameter of the point ParArg on  
          the argument curv. Raises NotDone if the construction algorithm  
         didn't succeed.  
         It raises OutOfRange if Index is greater than the  number of solutions.") Tangency1;
		void Tangency1 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	ParSol(Standard_Real)
	ParArg(Standard_Real)
	PntSol(gp_Pnt2d)

Returns:
	None

Returns informations about the intersection between the  
          result number Index and the third argument.  
Raises NotDone if the construction algorithm  didn't succeed.  
         It raises OutOfRange if Index is greater than the number of solutions.") Intersection2;
		void Intersection2 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
};


%feature("shadow") GccAna_Lin2dTanObl::~GccAna_Lin2dTanObl %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GccAna_Lin2dTanObl {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GccAna_Lin2dTanPar;
class GccAna_Lin2dTanPar {
	public:
		%feature("autodoc", "Args:
	ThePoint(gp_Pnt2d)
	Lin1(gp_Lin2d)

Returns:
	None

This method implements the algorithms used to create a 2d  
         line passing through a point and parallel to  
         another line.") GccAna_Lin2dTanPar;
		 GccAna_Lin2dTanPar (const gp_Pnt2d & ThePoint,const gp_Lin2d & Lin1);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedCirc)
	Lin1(gp_Lin2d)

Returns:
	None

This method implements the algorithms used to create a 2d  
         line tangent to a circle and parallel to another line.  
         It raises BadQualifier in case of EnclosedCirc.  
Exceptions  
 GccEnt_BadQualifier if a qualifier is inconsistent with  
the argument it qualifies (for example, enclosed for a circle).") GccAna_Lin2dTanPar;
		 GccAna_Lin2dTanPar (const GccEnt_QualifiedCirc & Qualified1,const gp_Lin2d & Lin1);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the algorithm succeeded.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of solutions.  
Raises NotDone if the construction algorithm  didn't succeed.") NbSolutions;
		Standard_Integer NbSolutions ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Lin2d

Returns the solution number Index and raises OutOfRange  
          exception if Index is greater than the number of solutions.  
          Be careful: the Index is only a way to get all the  
          solutions, but is not associated to those outside the  
          context of the algorithm-object.  
raises NotDone if the construction algorithm  
         didn't succeed.  
         It raises OutOfRange if Index is greater than the  
         number of solutions.") ThisSolution;
		gp_Lin2d ThisSolution (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Qualif1(GccEnt_Position)

Returns:
	None

Returns the informations about the qualifiers of the  
         tangency arguments concerning the solution number Index.  
         It returns the real qualifiers (the qualifiers given to the  
         constructor method in case of enclosed, enclosing and outside  
         and the qualifiers computed in case of unqualified).  
Raises NotDone if the construction algorithm  
         didn't succeed.  
         It raises OutOfRange if Index is greater than the  
         number of solutions.") WhichQualifier;
		void WhichQualifier (const Standard_Integer Index,GccEnt_Position & Qualif1);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	ParSol(Standard_Real)
	ParArg(Standard_Real)
	Pnt(gp_Pnt2d)

Returns:
	None

Returns informations about the tangency point between the  
          result number Index and the first argument.  
          ParSol is the intrinsic parameter of the point on the  
          solution curv.  
          ParArg is the intrinsic parameter of the point on the  
          argument curv.  
          ParArg is equal 0 when the solution is passing thrue  
          a point. Raises NotDone if the construction algorithm  
         didn't succeed.  
         It raises OutOfRange if Index is greater than the  
         number of solutions.") Tangency1;
		void Tangency1 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & Pnt);
};


%feature("shadow") GccAna_Lin2dTanPar::~GccAna_Lin2dTanPar %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GccAna_Lin2dTanPar {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GccAna_Lin2dTanPer;
class GccAna_Lin2dTanPer {
	public:
		%feature("autodoc", "Args:
	ThePnt(gp_Pnt2d)
	TheLin(gp_Lin2d)

Returns:
	None

This method implements the algorithms used to  
         create 2d lines passing through a point and  
         perpendicular to a line.") GccAna_Lin2dTanPer;
		 GccAna_Lin2dTanPer (const gp_Pnt2d & ThePnt,const gp_Lin2d & TheLin);
		%feature("autodoc", "Args:
	ThePnt(gp_Pnt2d)
	TheCircle(gp_Circ2d)

Returns:
	None

This method implements the algorithms used to  
         create 2d lines passing through a point and  
         perpendicular to a circle.") GccAna_Lin2dTanPer;
		 GccAna_Lin2dTanPer (const gp_Pnt2d & ThePnt,const gp_Circ2d & TheCircle);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedCirc)
	TheLin(gp_Lin2d)

Returns:
	None

This method implements the algorithms used to  
         create 2d lines tangent to a circle and  
         perpendicular to a line.") GccAna_Lin2dTanPer;
		 GccAna_Lin2dTanPer (const GccEnt_QualifiedCirc & Qualified1,const gp_Lin2d & TheLin);
		%feature("autodoc", "Args:
	Qualified1(GccEnt_QualifiedCirc)
	TheCircle(gp_Circ2d)

Returns:
	None

This method implements the algorithms used to  
         create 2d lines tangent to a circle and  
         perpendicular to a circle.") GccAna_Lin2dTanPer;
		 GccAna_Lin2dTanPer (const GccEnt_QualifiedCirc & Qualified1,const gp_Circ2d & TheCircle);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the algorithm succeeded.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of solutions.  
Raises NotDone if the construction algorithm didn't succeed.") NbSolutions;
		Standard_Integer NbSolutions ();
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

Returns:
	gp_Lin2d

Returns the solution number Index and raises OutOfRange  
          exception if Index is greater than the number of solutions.  
          Be careful: the Index is only a way to get all the  
          solutions, but is not associated to those outside the  
          context of the algorithm-object.  
   Raises NotDone if the construction algorithm  
         didn't succeed.  
         It raises OutOfRange if Index is greater than the  
         number of solutions.") ThisSolution;
		gp_Lin2d ThisSolution (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	ParSol(Standard_Real)
	ParArg(Standard_Real)
	Pnt(gp_Pnt2d)

Returns:
	None

Returns informations about the tangency point between the  
          result number Index and the first argument.  
          ParSol is the intrinsic parameter of the point on the  
          solution curv.  
          ParArg is the intrinsic parameter of the point on the  
          argument curv.  
          If the first argument is a point ParArg is equal zero.  
   raises NotDone if the construction algorithm didn't succeed.  
         It raises OutOfRange if Index is greater than the  
         number of solutions.") Tangency1;
		void Tangency1 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & Pnt);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	ParSol(Standard_Real)
	ParArg(Standard_Real)
	PntSol(gp_Pnt2d)

Returns:
	None

Returns informations about the intersection between the  
          solution number Index and the second argument.  
          It returns the first intersection in a case of  
          Lin2dTanPer which is perpendicular to a circle .  
          ParSol is the intrinsic parameter of the point on the  
          solution curv.  
          ParArg is the intrinsic parameter of the point on the  
          argument curv. Raises NotDone if the construction algorithm  
         didn't succeed.  
         It raises OutOfRange if Index is greater than the  
         number of solutions.") Intersection2;
		void Intersection2 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
};


%feature("shadow") GccAna_Lin2dTanPer::~GccAna_Lin2dTanPer %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GccAna_Lin2dTanPer {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GccAna_LinPnt2dBisec;
class GccAna_LinPnt2dBisec {
	public:
		%feature("autodoc", "Args:
	Line1(gp_Lin2d)
	Point2(gp_Pnt2d)

Returns:
	None

Constructs a bisecting curve between the line Line1 and the point Point2.") GccAna_LinPnt2dBisec;
		 GccAna_LinPnt2dBisec (const gp_Lin2d & Line1,const gp_Pnt2d & Point2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the algorithm succeeded.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_GccInt_Bisec

Returns the number of solutions.  It raises NotDone if the construction algorithm didn't succeed.") ThisSolution;
		Handle_GccInt_Bisec ThisSolution ();
};


%feature("shadow") GccAna_LinPnt2dBisec::~GccAna_LinPnt2dBisec %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GccAna_LinPnt2dBisec {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GccAna_Pnt2dBisec;
class GccAna_Pnt2dBisec {
	public:
		%feature("autodoc", "Args:
	Point1(gp_Pnt2d)
	Point2(gp_Pnt2d)

Returns:
	None

Constructs a bisecting line between the points Point1 and Point2.") GccAna_Pnt2dBisec;
		 GccAna_Pnt2dBisec (const gp_Pnt2d & Point1,const gp_Pnt2d & Point2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true (this construction algorithm never fails).") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if this algorithm has a solution, i.e. if the  
two points are not coincident.") HasSolution;
		Standard_Boolean HasSolution ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Lin2d

Returns a line, representing the solution computed by this algorithm.") ThisSolution;
		gp_Lin2d ThisSolution ();
};


%feature("shadow") GccAna_Pnt2dBisec::~GccAna_Pnt2dBisec %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GccAna_Pnt2dBisec {
	void _kill_pointed() {
		delete $self;
	}
};
