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
%module Convert

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

%include Convert_required_python_modules.i
%include Convert_headers.i

/* typedefs */
typedef void Convert_CosAndSinEvalFunction ( Standard_Real , 	 	 	 	 	 const Standard_Integer , 	 	 	 	 	 const TColgp_Array1OfPnt2d & , 	 	 	 	 	 const TColStd_Array1OfReal & , 	 	 	 	 	 const TColStd_Array1OfInteger & , 	 	 	 	 	 Standard_Real Result [ 2 ] );
typedef TColgp_SequenceOfArray1OfPnt2d Convert_SequenceOfArray1OfPoles2d;
/* end typedefs declaration */

/* public enums */
enum Convert_ParameterisationType {
	Convert_TgtThetaOver2 = 0,
	Convert_TgtThetaOver2_1 = 1,
	Convert_TgtThetaOver2_2 = 2,
	Convert_TgtThetaOver2_3 = 3,
	Convert_TgtThetaOver2_4 = 4,
	Convert_QuasiAngular = 5,
	Convert_RationalC1 = 6,
	Convert_Polynomial = 7,
};

/* end public enums declaration */

%nodefaultctor Convert_CompBezierCurves2dToBSplineCurve2d;
class Convert_CompBezierCurves2dToBSplineCurve2d {
	public:
		%feature("autodoc", "Args:
	AngularTolerance(Standard_Real)=1.0e-4

Returns:
	None

Constructs a framework for converting a sequence of  
adjacent non-rational Bezier curves into a BSpline curve.  
Knots will be created on the computed BSpline curve at  
each junction point of two consecutive Bezier curves. The  
degree of continuity of the BSpline curve will be increased at  
the junction point of two consecutive Bezier curves if their  
tangent vectors at this point are parallel. AngularTolerance  
(given in radians, and defaulted to 1.0 e-4) will be used  
to check the parallelism of the two tangent vectors.  
Use the following functions:  
-   AddCurve to define in sequence the adjacent Bezier  
 curves to be converted,  
-   Perform to compute the data needed to build the BSpline curve,  
-   and the available consultation functions to access the  
 computed data. This data may be used to construct the BSpline curve.") Convert_CompBezierCurves2dToBSplineCurve2d;
		 Convert_CompBezierCurves2dToBSplineCurve2d (const Standard_Real AngularTolerance = 1.0e-4);
		%feature("autodoc", "Args:
	Poles(TColgp_Array1OfPnt2d)

Returns:
	None

Adds the Bezier curve defined by the table of poles Poles, to  
 the sequence (still contained in this framework) of adjacent  
Bezier curves to be converted into a BSpline curve.  
Only polynomial (i.e. non-rational) Bezier curves are  
converted using this framework.  
If this is not the first call to the function (i.e. if this framework  
still contains data in its sequence of Bezier curves), the  
degree of continuity of the BSpline curve will be increased at  
the time of computation at the first point of the added Bezier  
curve (i.e. the first point of the Poles table). This will be the  
case if the tangent vector of the curve at this point is  
parallel to the tangent vector at the end point of the  
preceding Bezier curve in the sequence of Bezier curves still  
contained in this framework. An angular tolerance given at  
the time of construction of this framework, will be used to  
check the parallelism of the two tangent vectors. This  
checking procedure, and all the relative computations will be  
performed by the function Perform.  
When the sequence of adjacent Bezier curves is complete,  
use the following functions:  
-   Perform to compute the data needed to build the BSpline curve,  
-   and the available consultation functions to access the  
 computed data. This data may be used to construct the BSpline curve.  
 Warning  
The sequence of Bezier curves treated by this framework is  
automatically initialized with the first Bezier curve when the  
function is first called. During subsequent use of this function,  
ensure that the first point of the added Bezier curve (i.e. the  
first point of the Poles table) is coincident with the last point  
of the sequence (i.e. the last point of the preceding Bezier  
curve in the sequence) of Bezier curves still contained in  
this framework. An error may occur at the time of  
computation if this condition is not satisfied. Particular care  
must be taken with respect to the above, as this condition is  
not checked either when defining the sequence of Bezier  
curves or at the time of computation.") AddCurve;
		void AddCurve (const TColgp_Array1OfPnt2d & Poles);
		%feature("autodoc", "Args:
	None
Returns:
	None

Computes all the data needed to build a BSpline curve  
equivalent to the sequence of adjacent Bezier curves still  
contained in this framework.  
A knot is inserted on the computed BSpline curve at the  
junction point of two consecutive Bezier curves. The  
degree of continuity of the BSpline curve will be increased  
at the junction point of two consecutive Bezier curves if  
their tangent vectors at this point are parallel. An angular  
tolerance given at the time of construction of this  
framework is used to check the parallelism of the two  
tangent vectors.  
Use the available consultation functions to access the  
computed data. This data may then be used to construct  
the BSpline curve.  
Warning  
Ensure that the curves in the sequence of Bezier curves  
contained in this framework are adjacent. An error may  
occur at the time of computation if this condition is not  
satisfied. Particular care must be taken with respect to the  
above as this condition is not checked, either when  
defining the Bezier curve sequence or at the time of computation.") Perform;
		void Perform ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the degree of the BSpline curve whose data is  
computed in this framework.  
Warning  
Take particular care not to use this function before the  
computation is performed (Perform function), as this  
condition is not checked and an error may therefore occur.") Degree;
		Standard_Integer Degree ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of poles of the BSpline curve whose  
data is computed in this framework.  
Warning  
Take particular care not to use this function before the  
computation is performed (Perform function), as this  
condition is not checked and an error may therefore occur.") NbPoles;
		Standard_Integer NbPoles ();
		%feature("autodoc", "Args:
	Poles(TColgp_Array1OfPnt2d)

Returns:
	None

Loads the Poles table with the poles of the BSpline curve  
whose data is computed in this framework.  
Warning  
-   Do not use this function before the computation is  
 performed (Perform function).  
-   The length of the Poles array must be equal to the  
 number of poles of the BSpline curve whose data is  
 computed in this framework.  
Particular care must be taken with respect to the above, as  
these conditions are not checked, and an error may occur.") Poles;
		void Poles (TColgp_Array1OfPnt2d & Poles);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of knots of the BSpline curve whose  
data is computed in this framework.  
Warning  
Take particular care not to use this function before the  
computation is performed (Perform function), as this  
condition is not checked and an error may therefore occur.") NbKnots;
		Standard_Integer NbKnots ();
		%feature("autodoc", "Args:
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)

Returns:
	None

Loads the Knots table with the knots  
and the Mults table with the corresponding multiplicities  
of the BSpline curve whose data is computed in this framework.  
Warning  
-   Do not use this function before the computation is  
 performed (Perform function).  
-   The length of the Knots and Mults arrays must be equal  
 to the number of knots in the BSpline curve whose data is  
 computed in this framework.  
Particular care must be taken with respect to the above as  
these conditions are not checked, and an error may occur.") KnotsAndMults;
		void KnotsAndMults (TColStd_Array1OfReal & Knots,TColStd_Array1OfInteger & Mults);
};


%feature("shadow") Convert_CompBezierCurves2dToBSplineCurve2d::~Convert_CompBezierCurves2dToBSplineCurve2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Convert_CompBezierCurves2dToBSplineCurve2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Convert_CompBezierCurvesToBSplineCurve;
class Convert_CompBezierCurvesToBSplineCurve {
	public:
		%feature("autodoc", "Args:
	AngularTolerance(Standard_Real)=1.0e-4

Returns:
	None

Constructs a framework for converting a sequence of  
adjacent non-rational Bezier curves into a BSpline curve.  
Knots will be created on the computed BSpline curve at  
each junction point of two consecutive Bezier curves. The  
degree of continuity of the BSpline curve will be increased at  
the junction point of two consecutive Bezier curves if their  
tangent vectors at this point are parallel. AngularTolerance  
(given in radians, and defaulted to 1.0 e-4) will be used  
to check the parallelism of the two tangent vectors.  
Use the following functions:  
-   AddCurve to define in sequence the adjacent Bezier  
 curves to be converted,  
-   Perform to compute the data needed to build the BSpline curve,  
-   and the available consultation functions to access the  
 computed data. This data may be used to construct the BSpline curve.") Convert_CompBezierCurvesToBSplineCurve;
		 Convert_CompBezierCurvesToBSplineCurve (const Standard_Real AngularTolerance = 1.0e-4);
		%feature("autodoc", "Args:
	Poles(TColgp_Array1OfPnt)

Returns:
	None

Adds the Bezier curve defined by the table of poles Poles, to  
the sequence (still contained in this framework) of adjacent  
Bezier curves to be converted into a BSpline curve.  
Only polynomial (i.e. non-rational) Bezier curves are  
converted using this framework.  
If this is not the first call to the function (i.e. if this framework  
still contains data in its Bezier curve sequence), the degree  
of continuity of the BSpline curve will be increased at the  
time of computation at the first point of the added Bezier  
curve (i.e. the first point of the Poles table). This will be the  
case if the tangent vector of the curve at this point is  
parallel to the tangent vector at the end point of the  
preceding Bezier curve in the Bezier curve sequence still  
contained in this framework. An angular tolerance given at  
the time of construction of this framework will be used to  
check the parallelism of the two tangent vectors. This  
checking procedure and all related computations will be  
performed by the Perform function.  
When the adjacent Bezier curve sequence is complete, use  
the following functions:  
-   Perform to compute the data needed to build the BSpline curve,  
-   and the available consultation functions to access the  
 computed data. This data may be used to construct the BSpline curve.  
Warning  
The Bezier curve sequence treated by this framework is  
automatically initialized with the first Bezier curve when the  
function is first called. During subsequent use of this function,  
ensure that the first point of the added Bezier curve (i.e. the  
first point of the Poles table) is coincident with the last point  
of the Bezier curve sequence (i.e. the last point of the  
preceding Bezier curve in the sequence) still contained in  
this framework. An error may occur at the time of  
computation if this condition is not satisfied. Particular care  
must be taken with respect to the above, as this condition is  
not checked either when defining the Bezier curve  
sequence or at the time of computation.") AddCurve;
		void AddCurve (const TColgp_Array1OfPnt & Poles);
		%feature("autodoc", "Args:
	None
Returns:
	None

Computes all the data needed to build a BSpline curve  
equivalent to the adjacent Bezier curve sequence still  
contained in this framework.  
A knot is inserted on the computed BSpline curve at the  
junction point of two consecutive Bezier curves. The  
degree of continuity of the BSpline curve will be increased  
at the junction point of two consecutive Bezier curves if  
their tangent vectors at this point are parallel. An angular  
tolerance given at the time of construction of this  
framework is used to check the parallelism of the two  
tangent vectors.  
Use the available consultation functions to access the  
computed data. This data may then be used to construct  
the BSpline curve.  
Warning  
Make sure that the curves in the Bezier curve sequence  
contained in this framework are adjacent. An error may  
occur at the time of computation if this condition is not  
satisfied. Particular care must be taken with respect to the  
above as this condition is not checked, either when  
defining the Bezier curve sequence or at the time of computation.") Perform;
		void Perform ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the degree of the BSpline curve whose data is  
computed in this framework.  
Warning  
Take particular care not to use this function before the  
computation is performed (Perform function), as this  
condition is not checked and an error may  therefore occur.") Degree;
		Standard_Integer Degree ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of poles of the BSpline curve whose  
data is computed in this framework.  
Warning  
Take particular care not to use this function before the  
computation is performed (Perform function), as this  
condition is not checked and an error may therefore occur.") NbPoles;
		Standard_Integer NbPoles ();
		%feature("autodoc", "Args:
	Poles(TColgp_Array1OfPnt)

Returns:
	None

Loads the Poles table with the poles of the BSpline curve  
whose data is computed in this framework.  
Warning  
-   Do not use this function before the computation is  
 performed (Perform function).  
-   The length of the Poles array must be equal to the  
 number of poles of the BSpline curve whose data is  
 computed in this framework.  
Particular care must be taken with respect to the above, as  
these conditions are not checked, and an error may occur.") Poles;
		void Poles (TColgp_Array1OfPnt & Poles);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of knots of the BSpline curve whose  
data is computed in this framework.  
Warning  
Take particular care not to use this function before the  
computation is performed (Perform function), as this  
condition is not checked and an error may therefore occur.") NbKnots;
		Standard_Integer NbKnots ();
		%feature("autodoc", "Args:
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)

Returns:
	None

-   loads the Knots table with the knots,  
-   and loads the Mults table with the corresponding multiplicities  
of the BSpline curve whose data is computed in this framework.  
Warning  
-   Do not use this function before the computation is  
 performed (Perform function).  
-   The length of the Knots and Mults arrays must be equal  
 to the number of knots in the BSpline curve whose data is  
 computed in this framework.  
Particular care must be taken with respect to the above as  
these conditions are not checked, and an error may occur.") KnotsAndMults;
		void KnotsAndMults (TColStd_Array1OfReal & Knots,TColStd_Array1OfInteger & Mults);
};


%feature("shadow") Convert_CompBezierCurvesToBSplineCurve::~Convert_CompBezierCurvesToBSplineCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Convert_CompBezierCurvesToBSplineCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Convert_CompPolynomialToPoles;
class Convert_CompPolynomialToPoles {
	public:
		%feature("autodoc", "Args:
	NumCurves(Standard_Integer)
	Continuity(Standard_Integer)
	Dimension(Standard_Integer)
	MaxDegree(Standard_Integer)
	NumCoeffPerCurve(Handle_TColStd_HArray1OfInteger)
	Coefficients(Handle_TColStd_HArray1OfReal)
	PolynomialIntervals(Handle_TColStd_HArray2OfReal)
	TrueIntervals(Handle_TColStd_HArray1OfReal)

Returns:
	None

Warning!  
          Continuity can be at MOST the maximum degree of  
          the polynomial functions  
 TrueIntervals :  
 this is the true parameterisation for the composite curve  
 that is : the curve has myContinuity if the nth curve  
 is parameterized between myTrueIntervals(n) and myTrueIntervals(n+1)  
 
 Coefficients have to be the implicit 'c form':  
 Coefficients[Numcurves][MaxDegree+1][Dimension]  
 
 Warning!  
        The NumberOfCoefficient of an polynome is his degree + 1  
 Example: To convert the linear function f(x) = 2*x + 1 on the  
        domaine [2,5] to BSpline with the bound [-1,1]. Arguments are :  
         NumCurves  = 1;  
         Continuity = 1;  
         Dimension  = 1;  
         MaxDegree  = 1;  
         NumCoeffPerCurve [1] = {2};  
         Coefficients[2] = {1, 2};  
         PolynomialIntervals[1,2] = {{2,5}}  
         TrueIntervals[2] = {-1, 1}") Convert_CompPolynomialToPoles;
		 Convert_CompPolynomialToPoles (const Standard_Integer NumCurves,const Standard_Integer Continuity,const Standard_Integer Dimension,const Standard_Integer MaxDegree,const Handle_TColStd_HArray1OfInteger & NumCoeffPerCurve,const Handle_TColStd_HArray1OfReal & Coefficients,const Handle_TColStd_HArray2OfReal & PolynomialIntervals,const Handle_TColStd_HArray1OfReal & TrueIntervals);
		%feature("autodoc", "Args:
	NumCurves(Standard_Integer)
	Dimension(Standard_Integer)
	MaxDegree(Standard_Integer)
	Continuity(TColStd_Array1OfInteger)
	NumCoeffPerCurve(TColStd_Array1OfInteger)
	Coefficients(TColStd_Array1OfReal)
	PolynomialIntervals(TColStd_Array2OfReal)
	TrueIntervals(TColStd_Array1OfReal)

Returns:
	None

To Convert sevral span with different order of Continuity.  
 Warning: The Length of Continuity have to be NumCurves-1") Convert_CompPolynomialToPoles;
		 Convert_CompPolynomialToPoles (const Standard_Integer NumCurves,const Standard_Integer Dimension,const Standard_Integer MaxDegree,const TColStd_Array1OfInteger & Continuity,const TColStd_Array1OfInteger & NumCoeffPerCurve,const TColStd_Array1OfReal & Coefficients,const TColStd_Array2OfReal & PolynomialIntervals,const TColStd_Array1OfReal & TrueIntervals);
		%feature("autodoc", "Args:
	Dimension(Standard_Integer)
	MaxDegree(Standard_Integer)
	Degree(Standard_Integer)
	Coefficients(TColStd_Array1OfReal)
	PolynomialIntervals(TColStd_Array1OfReal)
	TrueIntervals(TColStd_Array1OfReal)

Returns:
	None

To Convert only one span.") Convert_CompPolynomialToPoles;
		 Convert_CompPolynomialToPoles (const Standard_Integer Dimension,const Standard_Integer MaxDegree,const Standard_Integer Degree,const TColStd_Array1OfReal & Coefficients,const TColStd_Array1OfReal & PolynomialIntervals,const TColStd_Array1OfReal & TrueIntervals);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

number of poles of the n-dimensional BSpline") NbPoles;
		Standard_Integer NbPoles ();
		%feature("autodoc", "Args:
	Poles(Handle_TColStd_HArray2OfReal)

Returns:
	None

returns the poles of the n-dimensional BSpline  
 in the following format :  
 [1..NumPoles][1..Dimension]") Poles;
		void Poles (Handle_TColStd_HArray2OfReal & Poles);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Degree;
		Standard_Integer Degree ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Degree of the n-dimensional Bspline") NbKnots;
		Standard_Integer NbKnots ();
		%feature("autodoc", "Args:
	K(Handle_TColStd_HArray1OfReal)

Returns:
	None

Knots of the n-dimensional Bspline") Knots;
		void Knots (Handle_TColStd_HArray1OfReal & K);
		%feature("autodoc", "Args:
	M(Handle_TColStd_HArray1OfInteger)

Returns:
	None

Multiplicities of the knots in the BSpline") Multiplicities;
		void Multiplicities (Handle_TColStd_HArray1OfInteger & M);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
};


%feature("shadow") Convert_CompPolynomialToPoles::~Convert_CompPolynomialToPoles %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Convert_CompPolynomialToPoles {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Convert_ConicToBSplineCurve;
class Convert_ConicToBSplineCurve {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the degree of the BSpline curve whose data is  
computed in this framework.") Degree;
		Standard_Integer Degree ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of poles of the BSpline curve whose  
data is computed in this framework.") NbPoles;
		Standard_Integer NbPoles ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of knots of the BSpline curve whose  
data is computed in this framework.") NbKnots;
		Standard_Integer NbKnots ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the BSpline curve whose data is computed in  
this framework is periodic.") IsPeriodic;
		Standard_Boolean IsPeriodic ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Pnt2d

Returns the pole of index Index to the poles table of the  
BSpline curve whose data is computed in this framework.  
Exceptions  
Standard_OutOfRange if Index is outside the bounds of  
the poles table of the BSpline curve whose data is computed in this framework.") Pole;
		gp_Pnt2d Pole (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

Returns the weight of the pole of index Index to the poles  
table of the BSpline curve whose data is computed in this framework.  
Exceptions  
Standard_OutOfRange if Index is outside the bounds of  
the poles table of the BSpline curve whose data is computed in this framework.") Weight;
		Standard_Real Weight (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

Returns the knot of index Index to the knots table of the  
BSpline curve whose data is computed in this framework.  
Exceptions  
Standard_OutOfRange if Index is outside the bounds of  
the knots table of the BSpline curve whose data is computed in this framework.") Knot;
		Standard_Real Knot (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Integer

Returns the multiplicity of the knot of index Index to the  
knots table of the BSpline curve whose data is computed in this framework.  
Exceptions  
Standard_OutOfRange if Index is outside the bounds of  
the knots table of the BSpline curve whose data is computed in this framework.") Multiplicity;
		Standard_Integer Multiplicity (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Parametrisation(Convert_ParameterisationType)
	CosNumerator(Handle_TColStd_HArray1OfReal)
	SinNumerator(Handle_TColStd_HArray1OfReal)
	Denominator(Handle_TColStd_HArray1OfReal)
	Degree(Standard_Integer)
	Knots(Handle_TColStd_HArray1OfReal)
	Mults(Handle_TColStd_HArray1OfInteger)

Returns:
	None

No detailed docstring for this function.") BuildCosAndSin;
		void BuildCosAndSin (const Convert_ParameterisationType Parametrisation,Handle_TColStd_HArray1OfReal & CosNumerator,Handle_TColStd_HArray1OfReal & SinNumerator,Handle_TColStd_HArray1OfReal & Denominator,Standard_Integer &OutValue,Handle_TColStd_HArray1OfReal & Knots,Handle_TColStd_HArray1OfInteger & Mults);
		%feature("autodoc", "Args:
	Parametrisation(Convert_ParameterisationType)
	UFirst(Standard_Real)
	ULast(Standard_Real)
	CosNumerator(Handle_TColStd_HArray1OfReal)
	SinNumerator(Handle_TColStd_HArray1OfReal)
	Denominator(Handle_TColStd_HArray1OfReal)
	Degree(Standard_Integer)
	Knots(Handle_TColStd_HArray1OfReal)
	Mults(Handle_TColStd_HArray1OfInteger)

Returns:
	None

No detailed docstring for this function.") BuildCosAndSin;
		void BuildCosAndSin (const Convert_ParameterisationType Parametrisation,const Standard_Real UFirst,const Standard_Real ULast,Handle_TColStd_HArray1OfReal & CosNumerator,Handle_TColStd_HArray1OfReal & SinNumerator,Handle_TColStd_HArray1OfReal & Denominator,Standard_Integer &OutValue,Handle_TColStd_HArray1OfReal & Knots,Handle_TColStd_HArray1OfInteger & Mults);
};


%feature("shadow") Convert_ConicToBSplineCurve::~Convert_ConicToBSplineCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Convert_ConicToBSplineCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Convert_ElementarySurfaceToBSplineSurface;
class Convert_ElementarySurfaceToBSplineSurface {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UDegree;
		Standard_Integer UDegree ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the degree for the u or v parametric direction of  
the BSpline surface whose data is computed in this framework.") VDegree;
		Standard_Integer VDegree ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbUPoles;
		Standard_Integer NbUPoles ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of poles for the u or v parametric  
direction of the BSpline surface whose data is computed in this framework.") NbVPoles;
		Standard_Integer NbVPoles ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbUKnots;
		Standard_Integer NbUKnots ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of knots for the u or v parametric  
direction of the BSpline surface whose data is computed in this framework .") NbVKnots;
		Standard_Integer NbVKnots ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsUPeriodic;
		Standard_Boolean IsUPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the BSpline surface whose data is computed  
in this framework is periodic in the u or v parametric direction.") IsVPeriodic;
		Standard_Boolean IsVPeriodic ();
		%feature("autodoc", "Args:
	UIndex(Standard_Integer)
	VIndex(Standard_Integer)

Returns:
	gp_Pnt

Returns the pole of index (UIndex,VIndex) to the poles  
table of the BSpline surface whose data is computed in this framework.  
Exceptions  
Standard_OutOfRange if, for the BSpline surface whose  
data is computed in this framework:  
-   UIndex is outside the bounds of the poles table in the u  
 parametric direction, or  
-   VIndex is outside the bounds of the poles table in the v  
 parametric direction.") Pole;
		gp_Pnt Pole (const Standard_Integer UIndex,const Standard_Integer VIndex);
		%feature("autodoc", "Args:
	UIndex(Standard_Integer)
	VIndex(Standard_Integer)

Returns:
	Standard_Real

Returns the weight of the pole of index (UIndex,VIndex) to  
the poles table of the BSpline surface whose data is computed in this framework.  
Exceptions  
Standard_OutOfRange if, for the BSpline surface whose  
data is computed in this framework:  
-   UIndex is outside the bounds of the poles table in the u  
 parametric direction, or  
-   VIndex is outside the bounds of the poles table in the v  
 parametric direction.") Weight;
		Standard_Real Weight (const Standard_Integer UIndex,const Standard_Integer VIndex);
		%feature("autodoc", "Args:
	UIndex(Standard_Integer)

Returns:
	Standard_Real

Returns the U-knot of range UIndex.  Raised if UIndex < 1 or UIndex > NbUKnots.") UKnot;
		Standard_Real UKnot (const Standard_Integer UIndex);
		%feature("autodoc", "Args:
	UIndex(Standard_Integer)

Returns:
	Standard_Real

Returns the V-knot of range VIndex.  Raised if VIndex < 1 or VIndex > NbVKnots.") VKnot;
		Standard_Real VKnot (const Standard_Integer UIndex);
		%feature("autodoc", "Args:
	UIndex(Standard_Integer)

Returns:
	Standard_Integer

Returns the multiplicity of the U-knot of range UIndex.  Raised if UIndex < 1 or UIndex > NbUKnots.") UMultiplicity;
		Standard_Integer UMultiplicity (const Standard_Integer UIndex);
		%feature("autodoc", "Args:
	VIndex(Standard_Integer)

Returns:
	Standard_Integer

Returns the multiplicity of the V-knot of range VIndex.  Raised if VIndex < 1 or VIndex > NbVKnots.") VMultiplicity;
		Standard_Integer VMultiplicity (const Standard_Integer VIndex);
};


%feature("shadow") Convert_ElementarySurfaceToBSplineSurface::~Convert_ElementarySurfaceToBSplineSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Convert_ElementarySurfaceToBSplineSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Convert_GridPolynomialToPoles;
class Convert_GridPolynomialToPoles {
	public:
		%feature("autodoc", "Args:
	MaxUDegree(Standard_Integer)
	MaxVDegree(Standard_Integer)
	NumCoeff(Handle_TColStd_HArray1OfInteger)
	Coefficients(Handle_TColStd_HArray1OfReal)
	PolynomialUIntervals(Handle_TColStd_HArray1OfReal)
	PolynomialVIntervals(Handle_TColStd_HArray1OfReal)

Returns:
	None

To    only  one   polynomial  Surface.  
         The  Length  of  <PolynomialUIntervals> and <PolynomialVIntervals>  
         have to be 2.  
         This values defined the parametric domain of the Polynomial Equation.  
 
         Coefficients :  
          The <Coefficients> have to be formated than an 'C array'  
         [MaxUDegree+1] [MaxVDegree+1] [3]") Convert_GridPolynomialToPoles;
		 Convert_GridPolynomialToPoles (const Standard_Integer MaxUDegree,const Standard_Integer MaxVDegree,const Handle_TColStd_HArray1OfInteger & NumCoeff,const Handle_TColStd_HArray1OfReal & Coefficients,const Handle_TColStd_HArray1OfReal & PolynomialUIntervals,const Handle_TColStd_HArray1OfReal & PolynomialVIntervals);
		%feature("autodoc", "Args:
	NbUSurfaces(Standard_Integer)
	NBVSurfaces(Standard_Integer)
	UContinuity(Standard_Integer)
	VContinuity(Standard_Integer)
	MaxUDegree(Standard_Integer)
	MaxVDegree(Standard_Integer)
	NumCoeffPerSurface(Handle_TColStd_HArray2OfInteger)
	Coefficients(Handle_TColStd_HArray1OfReal)
	PolynomialUIntervals(Handle_TColStd_HArray1OfReal)
	PolynomialVIntervals(Handle_TColStd_HArray1OfReal)
	TrueUIntervals(Handle_TColStd_HArray1OfReal)
	TrueVIntervals(Handle_TColStd_HArray1OfReal)

Returns:
	None

To one grid of polynomial Surface.  
 Warning!  
 Continuity in each parametric direction can be at MOST the  
 maximum degree of the polynomial functions.  
 
 <TrueUIntervals>, <TrueVIntervals> :  
 this is the true parameterisation for the composite surface  
 
 Coefficients :  
 The Coefficients have to be formated than an 'C array'  
         [NbVSurfaces] [NBUSurfaces] [MaxUDegree+1] [MaxVDegree+1] [3]  
 raises DomainError    if <NumCoeffPerSurface> is not a  
[1, NbVSurfaces*NbUSurfaces, 1,2] array.  
if <Coefficients> is not a") Convert_GridPolynomialToPoles;
		 Convert_GridPolynomialToPoles (const Standard_Integer NbUSurfaces,const Standard_Integer NBVSurfaces,const Standard_Integer UContinuity,const Standard_Integer VContinuity,const Standard_Integer MaxUDegree,const Standard_Integer MaxVDegree,const Handle_TColStd_HArray2OfInteger & NumCoeffPerSurface,const Handle_TColStd_HArray1OfReal & Coefficients,const Handle_TColStd_HArray1OfReal & PolynomialUIntervals,const Handle_TColStd_HArray1OfReal & PolynomialVIntervals,const Handle_TColStd_HArray1OfReal & TrueUIntervals,const Handle_TColStd_HArray1OfReal & TrueVIntervals);
		%feature("autodoc", "Args:
	UContinuity(Standard_Integer)
	VContinuity(Standard_Integer)
	MaxUDegree(Standard_Integer)
	MaxVDegree(Standard_Integer)
	NumCoeffPerSurface(Handle_TColStd_HArray2OfInteger)
	Coefficients(Handle_TColStd_HArray1OfReal)
	PolynomialUIntervals(Handle_TColStd_HArray1OfReal)
	PolynomialVIntervals(Handle_TColStd_HArray1OfReal)
	TrueUIntervals(Handle_TColStd_HArray1OfReal)
	TrueVIntervals(Handle_TColStd_HArray1OfReal)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const Standard_Integer UContinuity,const Standard_Integer VContinuity,const Standard_Integer MaxUDegree,const Standard_Integer MaxVDegree,const Handle_TColStd_HArray2OfInteger & NumCoeffPerSurface,const Handle_TColStd_HArray1OfReal & Coefficients,const Handle_TColStd_HArray1OfReal & PolynomialUIntervals,const Handle_TColStd_HArray1OfReal & PolynomialVIntervals,const Handle_TColStd_HArray1OfReal & TrueUIntervals,const Handle_TColStd_HArray1OfReal & TrueVIntervals);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbUPoles;
		Standard_Integer NbUPoles ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbVPoles;
		Standard_Integer NbVPoles ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColgp_HArray2OfPnt

returns the poles of the BSpline Surface") Poles;
		const Handle_TColgp_HArray2OfPnt & Poles ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UDegree;
		Standard_Integer UDegree ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") VDegree;
		Standard_Integer VDegree ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbUKnots;
		Standard_Integer NbUKnots ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbVKnots;
		Standard_Integer NbVKnots ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HArray1OfReal

Knots in the U direction") UKnots;
		const Handle_TColStd_HArray1OfReal & UKnots ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HArray1OfReal

Knots in the V direction") VKnots;
		const Handle_TColStd_HArray1OfReal & VKnots ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HArray1OfInteger

Multiplicities of the knots in the U direction") UMultiplicities;
		const Handle_TColStd_HArray1OfInteger & UMultiplicities ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HArray1OfInteger

Multiplicities of the knots in the V direction") VMultiplicities;
		const Handle_TColStd_HArray1OfInteger & VMultiplicities ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
};


%feature("shadow") Convert_GridPolynomialToPoles::~Convert_GridPolynomialToPoles %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Convert_GridPolynomialToPoles {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Convert_SequenceNodeOfSequenceOfArray1OfPoles;
class Convert_SequenceNodeOfSequenceOfArray1OfPoles : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_TColgp_HArray1OfPnt)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Convert_SequenceNodeOfSequenceOfArray1OfPoles;
		 Convert_SequenceNodeOfSequenceOfArray1OfPoles (const Handle_TColgp_HArray1OfPnt & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColgp_HArray1OfPnt

No detailed docstring for this function.") Value;
		Handle_TColgp_HArray1OfPnt & Value ();
};


%feature("shadow") Convert_SequenceNodeOfSequenceOfArray1OfPoles::~Convert_SequenceNodeOfSequenceOfArray1OfPoles %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Convert_SequenceNodeOfSequenceOfArray1OfPoles {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Convert_SequenceNodeOfSequenceOfArray1OfPoles {
	Handle_Convert_SequenceNodeOfSequenceOfArray1OfPoles GetHandle() {
	return *(Handle_Convert_SequenceNodeOfSequenceOfArray1OfPoles*) &$self;
	}
};

%nodefaultctor Handle_Convert_SequenceNodeOfSequenceOfArray1OfPoles;
class Handle_Convert_SequenceNodeOfSequenceOfArray1OfPoles : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Convert_SequenceNodeOfSequenceOfArray1OfPoles();
        Handle_Convert_SequenceNodeOfSequenceOfArray1OfPoles(const Handle_Convert_SequenceNodeOfSequenceOfArray1OfPoles &aHandle);
        Handle_Convert_SequenceNodeOfSequenceOfArray1OfPoles(const Convert_SequenceNodeOfSequenceOfArray1OfPoles *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Convert_SequenceNodeOfSequenceOfArray1OfPoles DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Convert_SequenceNodeOfSequenceOfArray1OfPoles {
    Convert_SequenceNodeOfSequenceOfArray1OfPoles* GetObject() {
    return (Convert_SequenceNodeOfSequenceOfArray1OfPoles*)$self->Access();
    }
};
%feature("shadow") Handle_Convert_SequenceNodeOfSequenceOfArray1OfPoles::~Handle_Convert_SequenceNodeOfSequenceOfArray1OfPoles %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Convert_SequenceNodeOfSequenceOfArray1OfPoles {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Convert_SequenceOfArray1OfPoles;
class Convert_SequenceOfArray1OfPoles : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Convert_SequenceOfArray1OfPoles;
		 Convert_SequenceOfArray1OfPoles ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Convert_SequenceOfArray1OfPoles)

Returns:
	Convert_SequenceOfArray1OfPoles

No detailed docstring for this function.") Assign;
		const Convert_SequenceOfArray1OfPoles & Assign (const Convert_SequenceOfArray1OfPoles & Other);
		%feature("autodoc", "Args:
	Other(Convert_SequenceOfArray1OfPoles)

Returns:
	Convert_SequenceOfArray1OfPoles

No detailed docstring for this function.") operator=;
		const Convert_SequenceOfArray1OfPoles & operator = (const Convert_SequenceOfArray1OfPoles & Other);
		%feature("autodoc", "Args:
	T(Handle_TColgp_HArray1OfPnt)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_TColgp_HArray1OfPnt & T);
		%feature("autodoc", "Args:
	S(Convert_SequenceOfArray1OfPoles)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Convert_SequenceOfArray1OfPoles & S);
		%feature("autodoc", "Args:
	T(Handle_TColgp_HArray1OfPnt)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_TColgp_HArray1OfPnt & T);
		%feature("autodoc", "Args:
	S(Convert_SequenceOfArray1OfPoles)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Convert_SequenceOfArray1OfPoles & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_TColgp_HArray1OfPnt)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_TColgp_HArray1OfPnt & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Convert_SequenceOfArray1OfPoles)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Convert_SequenceOfArray1OfPoles & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_TColgp_HArray1OfPnt)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_TColgp_HArray1OfPnt & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Convert_SequenceOfArray1OfPoles)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Convert_SequenceOfArray1OfPoles & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColgp_HArray1OfPnt

No detailed docstring for this function.") First;
		const Handle_TColgp_HArray1OfPnt & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColgp_HArray1OfPnt

No detailed docstring for this function.") Last;
		const Handle_TColgp_HArray1OfPnt & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Convert_SequenceOfArray1OfPoles)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Convert_SequenceOfArray1OfPoles & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_TColgp_HArray1OfPnt

No detailed docstring for this function.") Value;
		const Handle_TColgp_HArray1OfPnt & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_TColgp_HArray1OfPnt)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_TColgp_HArray1OfPnt & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_TColgp_HArray1OfPnt

No detailed docstring for this function.") ChangeValue;
		Handle_TColgp_HArray1OfPnt & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") Convert_SequenceOfArray1OfPoles::~Convert_SequenceOfArray1OfPoles %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Convert_SequenceOfArray1OfPoles {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Convert_CircleToBSplineCurve;
class Convert_CircleToBSplineCurve : public Convert_ConicToBSplineCurve {
	public:
		%feature("autodoc", "Args:
	C(gp_Circ2d)
	Parameterisation(Convert_ParameterisationType)=Convert_TgtThetaOver2

Returns:
	None

The equivalent B-spline curve has the same orientation  
 as the circle C.") Convert_CircleToBSplineCurve;
		 Convert_CircleToBSplineCurve (const gp_Circ2d & C,const Convert_ParameterisationType Parameterisation = Convert_TgtThetaOver2);
		%feature("autodoc", "Args:
	C(gp_Circ2d)
	U1(Standard_Real)
	U2(Standard_Real)
	Parameterisation(Convert_ParameterisationType)=Convert_TgtThetaOver2

Returns:
	None

The circle C is limited between the parametric values U1, U2  
 in radians. U1 and U2 [0.0, 2*Pi] .  
 The equivalent B-spline curve is oriented from U1 to U2 and has  
 the same orientation as the circle C.  
 Raised if U1 = U2 or U1 = U2 + 2.0 * Pi") Convert_CircleToBSplineCurve;
		 Convert_CircleToBSplineCurve (const gp_Circ2d & C,const Standard_Real U1,const Standard_Real U2,const Convert_ParameterisationType Parameterisation = Convert_TgtThetaOver2);
};


%feature("shadow") Convert_CircleToBSplineCurve::~Convert_CircleToBSplineCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Convert_CircleToBSplineCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Convert_ConeToBSplineSurface;
class Convert_ConeToBSplineSurface : public Convert_ElementarySurfaceToBSplineSurface {
	public:
		%feature("autodoc", "Args:
	C(gp_Cone)
	U1(Standard_Real)
	U2(Standard_Real)
	V1(Standard_Real)
	V2(Standard_Real)

Returns:
	None

The equivalent B-spline surface as the same orientation as the  
 Cone in the U and V parametric directions.  
 Raised if U1 = U2 or U1 = U2 + 2.0 * Pi  
 Raised if V1 = V2.") Convert_ConeToBSplineSurface;
		 Convert_ConeToBSplineSurface (const gp_Cone & C,const Standard_Real U1,const Standard_Real U2,const Standard_Real V1,const Standard_Real V2);
		%feature("autodoc", "Args:
	C(gp_Cone)
	V1(Standard_Real)
	V2(Standard_Real)

Returns:
	None

The equivalent B-spline surface as the same orientation as the  
 Cone in the U and V parametric directions.  
 Raised if V1 = V2.") Convert_ConeToBSplineSurface;
		 Convert_ConeToBSplineSurface (const gp_Cone & C,const Standard_Real V1,const Standard_Real V2);
};


%feature("shadow") Convert_ConeToBSplineSurface::~Convert_ConeToBSplineSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Convert_ConeToBSplineSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Convert_CylinderToBSplineSurface;
class Convert_CylinderToBSplineSurface : public Convert_ElementarySurfaceToBSplineSurface {
	public:
		%feature("autodoc", "Args:
	Cyl(gp_Cylinder)
	U1(Standard_Real)
	U2(Standard_Real)
	V1(Standard_Real)
	V2(Standard_Real)

Returns:
	None

The equivalent B-splineSurface as the same orientation as the  
 cylinder in the U and V parametric directions.  
 Raised if U1 = U2 or U1 = U2 + 2.0 * Pi  
 Raised if V1 = V2.") Convert_CylinderToBSplineSurface;
		 Convert_CylinderToBSplineSurface (const gp_Cylinder & Cyl,const Standard_Real U1,const Standard_Real U2,const Standard_Real V1,const Standard_Real V2);
		%feature("autodoc", "Args:
	Cyl(gp_Cylinder)
	V1(Standard_Real)
	V2(Standard_Real)

Returns:
	None

The equivalent B-splineSurface as the same orientation as the  
 cylinder in the U and V parametric directions.  
 Raised if V1 = V2.") Convert_CylinderToBSplineSurface;
		 Convert_CylinderToBSplineSurface (const gp_Cylinder & Cyl,const Standard_Real V1,const Standard_Real V2);
};


%feature("shadow") Convert_CylinderToBSplineSurface::~Convert_CylinderToBSplineSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Convert_CylinderToBSplineSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Convert_EllipseToBSplineCurve;
class Convert_EllipseToBSplineCurve : public Convert_ConicToBSplineCurve {
	public:
		%feature("autodoc", "Args:
	E(gp_Elips2d)
	Parameterisation(Convert_ParameterisationType)=Convert_TgtThetaOver2

Returns:
	None

The equivalent B-spline curve has the same orientation  
 as the ellipse E.") Convert_EllipseToBSplineCurve;
		 Convert_EllipseToBSplineCurve (const gp_Elips2d & E,const Convert_ParameterisationType Parameterisation = Convert_TgtThetaOver2);
		%feature("autodoc", "Args:
	E(gp_Elips2d)
	U1(Standard_Real)
	U2(Standard_Real)
	Parameterisation(Convert_ParameterisationType)=Convert_TgtThetaOver2

Returns:
	None

The ellipse E is limited between the parametric values U1, U2.  
 The equivalent B-spline curve is oriented from U1 to U2 and has  
 the same orientation as E.  
 Raised if U1 = U2 or U1 = U2 + 2.0 * Pi") Convert_EllipseToBSplineCurve;
		 Convert_EllipseToBSplineCurve (const gp_Elips2d & E,const Standard_Real U1,const Standard_Real U2,const Convert_ParameterisationType Parameterisation = Convert_TgtThetaOver2);
};


%feature("shadow") Convert_EllipseToBSplineCurve::~Convert_EllipseToBSplineCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Convert_EllipseToBSplineCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Convert_HyperbolaToBSplineCurve;
class Convert_HyperbolaToBSplineCurve : public Convert_ConicToBSplineCurve {
	public:
		%feature("autodoc", "Args:
	H(gp_Hypr2d)
	U1(Standard_Real)
	U2(Standard_Real)

Returns:
	None

The hyperbola H is limited between the parametric values U1, U2  
 and the equivalent B-spline curve has the same orientation as the  
 hyperbola.") Convert_HyperbolaToBSplineCurve;
		 Convert_HyperbolaToBSplineCurve (const gp_Hypr2d & H,const Standard_Real U1,const Standard_Real U2);
};


%feature("shadow") Convert_HyperbolaToBSplineCurve::~Convert_HyperbolaToBSplineCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Convert_HyperbolaToBSplineCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Convert_ParabolaToBSplineCurve;
class Convert_ParabolaToBSplineCurve : public Convert_ConicToBSplineCurve {
	public:
		%feature("autodoc", "Args:
	Prb(gp_Parab2d)
	U1(Standard_Real)
	U2(Standard_Real)

Returns:
	None

The parabola Prb is limited between the parametric values U1, U2  
 and the equivalent B-spline curve as the same orientation as the  
 parabola Prb.") Convert_ParabolaToBSplineCurve;
		 Convert_ParabolaToBSplineCurve (const gp_Parab2d & Prb,const Standard_Real U1,const Standard_Real U2);
};


%feature("shadow") Convert_ParabolaToBSplineCurve::~Convert_ParabolaToBSplineCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Convert_ParabolaToBSplineCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Convert_SphereToBSplineSurface;
class Convert_SphereToBSplineSurface : public Convert_ElementarySurfaceToBSplineSurface {
	public:
		%feature("autodoc", "Args:
	Sph(gp_Sphere)
	U1(Standard_Real)
	U2(Standard_Real)
	V1(Standard_Real)
	V2(Standard_Real)

Returns:
	None

The equivalent B-spline surface as the same orientation as the  
 sphere in the U and V parametric directions.  
 Raised if U1 = U2 or U1 = U2 + 2.0 * Pi  
 Raised if V1 = V2.") Convert_SphereToBSplineSurface;
		 Convert_SphereToBSplineSurface (const gp_Sphere & Sph,const Standard_Real U1,const Standard_Real U2,const Standard_Real V1,const Standard_Real V2);
		%feature("autodoc", "Args:
	Sph(gp_Sphere)
	Param1(Standard_Real)
	Param2(Standard_Real)
	UTrim(Standard_Boolean)=Standard_True

Returns:
	None

The equivalent B-spline surface as the same orientation  
 as the sphere in the U and V parametric directions.  
 Raised if UTrim = True and Param1 = Param2 or  
           Param1 = Param2 + 2.0 * Pi  
 Raised if UTrim = False and Param1 = Param2") Convert_SphereToBSplineSurface;
		 Convert_SphereToBSplineSurface (const gp_Sphere & Sph,const Standard_Real Param1,const Standard_Real Param2,const Standard_Boolean UTrim = Standard_True);
		%feature("autodoc", "Args:
	Sph(gp_Sphere)

Returns:
	None

The equivalent B-spline surface as the same orientation  
 as the sphere in the U and V parametric directions.") Convert_SphereToBSplineSurface;
		 Convert_SphereToBSplineSurface (const gp_Sphere & Sph);
};


%feature("shadow") Convert_SphereToBSplineSurface::~Convert_SphereToBSplineSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Convert_SphereToBSplineSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Convert_TorusToBSplineSurface;
class Convert_TorusToBSplineSurface : public Convert_ElementarySurfaceToBSplineSurface {
	public:
		%feature("autodoc", "Args:
	T(gp_Torus)
	U1(Standard_Real)
	U2(Standard_Real)
	V1(Standard_Real)
	V2(Standard_Real)

Returns:
	None

The equivalent B-spline surface as the same orientation as the  
 torus in the U and V parametric directions.  
 Raised if U1 = U2 or U1 = U2 + 2.0 * Pi  
 Raised if V1 = V2 or V1 = V2 + 2.0 * Pi") Convert_TorusToBSplineSurface;
		 Convert_TorusToBSplineSurface (const gp_Torus & T,const Standard_Real U1,const Standard_Real U2,const Standard_Real V1,const Standard_Real V2);
		%feature("autodoc", "Args:
	T(gp_Torus)
	Param1(Standard_Real)
	Param2(Standard_Real)
	UTrim(Standard_Boolean)=Standard_True

Returns:
	None

The equivalent B-spline surface as the same orientation as the  
 torus in the U and V parametric directions.  
 Raised if Param1 = Param2 or Param1 = Param2 + 2.0 * Pi") Convert_TorusToBSplineSurface;
		 Convert_TorusToBSplineSurface (const gp_Torus & T,const Standard_Real Param1,const Standard_Real Param2,const Standard_Boolean UTrim = Standard_True);
		%feature("autodoc", "Args:
	T(gp_Torus)

Returns:
	None

The equivalent B-spline surface as the same orientation as the  
 torus in the U and V parametric directions.") Convert_TorusToBSplineSurface;
		 Convert_TorusToBSplineSurface (const gp_Torus & T);
};


%feature("shadow") Convert_TorusToBSplineSurface::~Convert_TorusToBSplineSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Convert_TorusToBSplineSurface {
	void _kill_pointed() {
		delete $self;
	}
};
