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
%module BSplCLib

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

%include BSplCLib_required_python_modules.i
%include BSplCLib_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
enum BSplCLib_KnotDistribution {
	BSplCLib_NonUniform = 0,
	BSplCLib_Uniform = 1,
};

enum BSplCLib_MultDistribution {
	BSplCLib_NonConstant = 0,
	BSplCLib_Constant = 1,
	BSplCLib_QuasiConstant = 2,
};

/* end public enums declaration */

%rename(bsplclib) BSplCLib;
%nodefaultctor BSplCLib;
class BSplCLib {
	public:
		%feature("autodoc", "Args:
	XX(TColStd_Array1OfReal)
	X(Standard_Real)
	Iloc(Standard_Integer)

Returns:
	static void

This routine searches the position of the real  
        value X in  the ordered set of  real  values XX.  
 
        The  elements   in   the  table    XX  are   either  
        monotonically    increasing     or    monotonically  
        decreasing.  
 
        The input   value Iloc is    used to initialize the  
        algorithm  :  if  Iloc  is outside  of   the bounds  
        [XX.Lower(), -- XX.Upper()] the bisection algorithm  
        is used else  the routine searches from  a previous  
        known position  by increasing steps  then converges  
        by bisection.  
 
        This  routine is used to  locate a  knot value in a  
        set of knots.") Hunt;
		static void Hunt (const TColStd_Array1OfReal & XX,const Standard_Real X,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	Degree(Standard_Integer)
	Mults(TColStd_Array1OfInteger)

Returns:
	static Standard_Integer

Computes the index of the knots value which gives  
        the start point of the curve.") FirstUKnotIndex;
		static Standard_Integer FirstUKnotIndex (const Standard_Integer Degree,const TColStd_Array1OfInteger & Mults);
		%feature("autodoc", "Args:
	Degree(Standard_Integer)
	Mults(TColStd_Array1OfInteger)

Returns:
	static Standard_Integer

Computes the index of the knots value which gives  
        the end point of the curve.") LastUKnotIndex;
		static Standard_Integer LastUKnotIndex (const Standard_Integer Degree,const TColStd_Array1OfInteger & Mults);
		%feature("autodoc", "Args:
	Degree(Standard_Integer)
	Index(Standard_Integer)
	Mults(TColStd_Array1OfInteger)
	Periodic(Standard_Boolean)

Returns:
	static Standard_Integer

Computes the index  of  the  flats knots  sequence  
         corresponding  to  <Index> in  the  knots sequence  
         which multiplicities are <Mults>.") FlatIndex;
		static Standard_Integer FlatIndex (const Standard_Integer Degree,const Standard_Integer Index,const TColStd_Array1OfInteger & Mults,const Standard_Boolean Periodic);
		%feature("autodoc", "Args:
	Degree(Standard_Integer)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	U(Standard_Real)
	IsPeriodic(Standard_Boolean)
	FromK1(Standard_Integer)
	ToK2(Standard_Integer)
	KnotIndex(Standard_Integer)
	NewU(Standard_Real)

Returns:
	static void

Locates  the parametric value    U  in the knots  
        sequence  between  the  knot K1   and the knot  K2.  
        The value return in Index verifies.  
 
         Knots(Index) <= U < Knots(Index + 1)  
         if U <= Knots (K1) then Index = K1  
         if U >= Knots (K2) then Index = K2 - 1  
 
         If Periodic is True U  may be  modified  to fit in  
         the range  Knots(K1), Knots(K2).  In any case  the  
         correct value is returned in NewU.  
 
 Warnings :Index is used  as input   data to initialize  the  
         searching  function.  
 Warning: Knots have to be 'withe repetitions'") LocateParameter;
		static void LocateParameter (const Standard_Integer Degree,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Real U,const Standard_Boolean IsPeriodic,const Standard_Integer FromK1,const Standard_Integer ToK2,Standard_Integer &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Degree(Standard_Integer)
	Knots(TColStd_Array1OfReal)
	U(Standard_Real)
	IsPeriodic(Standard_Boolean)
	FromK1(Standard_Integer)
	ToK2(Standard_Integer)
	KnotIndex(Standard_Integer)
	NewU(Standard_Real)

Returns:
	static void

Locates  the parametric value    U  in the knots  
        sequence  between  the  knot K1   and the knot  K2.  
        The value return in Index verifies.  
 
         Knots(Index) <= U < Knots(Index + 1)  
         if U <= Knots (K1) then Index = K1  
         if U >= Knots (K2) then Index = K2 - 1  
 
         If Periodic is True U  may be  modified  to fit in  
         the range  Knots(K1), Knots(K2).  In any case  the  
         correct value is returned in NewU.  
 
 Warnings :Index is used  as input   data to initialize  the  
         searching  function.  
 Warning: Knots have to be 'flat'") LocateParameter;
		static void LocateParameter (const Standard_Integer Degree,const TColStd_Array1OfReal & Knots,const Standard_Real U,const Standard_Boolean IsPeriodic,const Standard_Integer FromK1,const Standard_Integer ToK2,Standard_Integer &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Degree(Standard_Integer)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	U(Standard_Real)
	Periodic(Standard_Boolean)
	Index(Standard_Integer)
	NewU(Standard_Real)

Returns:
	static void

No detailed docstring for this function.") LocateParameter;
		static void LocateParameter (const Standard_Integer Degree,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Real U,const Standard_Boolean Periodic,Standard_Integer &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Mults(TColStd_Array1OfInteger)
	K1(Standard_Integer)
	K2(Standard_Integer)

Returns:
	static Standard_Integer

Finds the greatest multiplicity in a set of knots  
        between  K1  and K2.   Mults  is  the  multiplicity  
        associated with each knot value.") MaxKnotMult;
		static Standard_Integer MaxKnotMult (const TColStd_Array1OfInteger & Mults,const Standard_Integer K1,const Standard_Integer K2);
		%feature("autodoc", "Args:
	Mults(TColStd_Array1OfInteger)
	K1(Standard_Integer)
	K2(Standard_Integer)

Returns:
	static Standard_Integer

Finds the lowest multiplicity in  a  set of knots  
        between   K1  and K2.   Mults is  the  multiplicity  
        associated with each knot value.") MinKnotMult;
		static Standard_Integer MinKnotMult (const TColStd_Array1OfInteger & Mults,const Standard_Integer K1,const Standard_Integer K2);
		%feature("autodoc", "Args:
	Degree(Standard_Integer)
	Periodic(Standard_Boolean)
	Mults(TColStd_Array1OfInteger)

Returns:
	static Standard_Integer

Returns the number of poles of the curve. Returns 0 if  
         one of the multiplicities is incorrect.  
 
         * Non positive.  
 
         * Greater than Degree,  or  Degree+1  at the first and  
         last knot of a non periodic curve.  
 
         *  The  last periodicity  on  a periodic  curve is not  
         equal to the first.") NbPoles;
		static Standard_Integer NbPoles (const Standard_Integer Degree,const Standard_Boolean Periodic,const TColStd_Array1OfInteger & Mults);
		%feature("autodoc", "Args:
	Mults(TColStd_Array1OfInteger)
	Degree(Standard_Integer)
	Periodic(Standard_Boolean)

Returns:
	static Standard_Integer

Returns the length  of the sequence  of knots with  
         repetition.  
 
         Periodic :  
 
         Sum(Mults(i), i = Mults.Lower(); i <= Mults.Upper());  
 
         Non Periodic :  
 
         Sum(Mults(i); i = Mults.Lower(); i < Mults.Upper())  
         + 2 * Degree") KnotSequenceLength;
		static Standard_Integer KnotSequenceLength (const TColStd_Array1OfInteger & Mults,const Standard_Integer Degree,const Standard_Boolean Periodic);
		%feature("autodoc", "Args:
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	KnotSeq(TColStd_Array1OfReal)

Returns:
	static void

No detailed docstring for this function.") KnotSequence;
		static void KnotSequence (const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,TColStd_Array1OfReal & KnotSeq);
		%feature("autodoc", "Args:
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	Degree(Standard_Integer)
	Periodic(Standard_Boolean)
	KnotSeq(TColStd_Array1OfReal)

Returns:
	static void

Computes  the  sequence   of knots KnotSeq  with  
        repetition  of the  knots  of multiplicity  greater  
        than 1.  
 
 Length of KnotSeq must be KnotSequenceLength(Mults,Degree,Periodic)") KnotSequence;
		static void KnotSequence (const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer Degree,const Standard_Boolean Periodic,TColStd_Array1OfReal & KnotSeq);
		%feature("autodoc", "Args:
	KnotSeq(TColStd_Array1OfReal)
	Periodic(Standard_Boolean)=Standard_False

Returns:
	static Standard_Integer

Returns the  length  of the   sequence of  knots  (and  
         Mults)  without repetition.") KnotsLength;
		static Standard_Integer KnotsLength (const TColStd_Array1OfReal & KnotSeq,const Standard_Boolean Periodic = Standard_False);
		%feature("autodoc", "Args:
	KnotSeq(TColStd_Array1OfReal)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	Periodic(Standard_Boolean)=Standard_False

Returns:
	static void

Computes  the  sequence   of knots Knots  without  
        repetition  of the  knots  of multiplicity  greater  
        than 1.  
 
      Length  of <Knots> and  <Mults> must be  
   KnotsLength(KnotSequence,Periodic)") Knots;
		static void Knots (const TColStd_Array1OfReal & KnotSeq,TColStd_Array1OfReal & Knots,TColStd_Array1OfInteger & Mults,const Standard_Boolean Periodic = Standard_False);
		%feature("autodoc", "Args:
	Knots(TColStd_Array1OfReal)
	FromK1(Standard_Integer)
	ToK2(Standard_Integer)

Returns:
	static BSplCLib_KnotDistribution

Analyses if the  knots distribution is 'Uniform'  
        or  'NonUniform' between  the  knot  FromK1 and the  
        knot ToK2.  There is  no repetition of  knot in the  
        knots'sequence <Knots>.") KnotForm;
		static BSplCLib_KnotDistribution KnotForm (const TColStd_Array1OfReal & Knots,const Standard_Integer FromK1,const Standard_Integer ToK2);
		%feature("autodoc", "Args:
	Mults(TColStd_Array1OfInteger)
	FromK1(Standard_Integer)
	ToK2(Standard_Integer)

Returns:
	static BSplCLib_MultDistribution

Analyses the distribution of multiplicities between  
 the knot FromK1 and the Knot ToK2.") MultForm;
		static BSplCLib_MultDistribution MultForm (const TColStd_Array1OfInteger & Mults,const Standard_Integer FromK1,const Standard_Integer ToK2);
		%feature("autodoc", "Args:
	Degree(Standard_Integer)
	Periodic(Standard_Boolean)
	CKnots(TColStd_Array1OfReal)
	CMults(TColStd_Array1OfInteger)
	KnotForm(GeomAbs_BSplKnotDistribution)
	MaxKnotMult(Standard_Integer)

Returns:
	static void

Analyzes the array of knots.  
         Returns the form and the maximum knot multiplicity.") KnotAnalysis;
		static void KnotAnalysis (const Standard_Integer Degree,const Standard_Boolean Periodic,const TColStd_Array1OfReal & CKnots,const TColStd_Array1OfInteger & CMults,GeomAbs_BSplKnotDistribution & KnotForm,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	U1(Standard_Real)
	U2(Standard_Real)
	Knots(TColStd_Array1OfReal)

Returns:
	static void

Reparametrizes a B-spline curve to [U1, U2].  
 The knot values are recomputed such that Knots (Lower) = U1  
 and Knots (Upper) = U2   but the knot form is not modified.  
  Warnings :  
 In the array Knots the values must be in ascending order.  
 U1 must not be equal to U2 to avoid division by zero.") Reparametrize;
		static void Reparametrize (const Standard_Real U1,const Standard_Real U2,TColStd_Array1OfReal & Knots);
		%feature("autodoc", "Args:
	Knots(TColStd_Array1OfReal)

Returns:
	static void

Reverses  the  array   knots  to  become  the knots  
         sequence of the reversed curve.") Reverse;
		static void Reverse (TColStd_Array1OfReal & Knots);
		%feature("autodoc", "Args:
	Mults(TColStd_Array1OfInteger)

Returns:
	static void

Reverses  the  array of multiplicities.") Reverse;
		static void Reverse (TColStd_Array1OfInteger & Mults);
		%feature("autodoc", "Args:
	Poles(TColgp_Array1OfPnt)
	Last(Standard_Integer)

Returns:
	static void

Reverses the array of poles. Last is the  index of  
         the new first pole. On  a  non periodic curve last  
         is Poles.Upper(). On a periodic curve last is  
 
         (number of flat knots - degree - 1)  
 
         or  
 
         (sum of multiplicities(but  for the last) + degree  
         - 1)") Reverse;
		static void Reverse (TColgp_Array1OfPnt & Poles,const Standard_Integer Last);
		%feature("autodoc", "Args:
	Poles(TColgp_Array1OfPnt2d)
	Last(Standard_Integer)

Returns:
	static void

Reverses the array of poles.") Reverse;
		static void Reverse (TColgp_Array1OfPnt2d & Poles,const Standard_Integer Last);
		%feature("autodoc", "Args:
	Weights(TColStd_Array1OfReal)
	Last(Standard_Integer)

Returns:
	static void

Reverses the array of poles.") Reverse;
		static void Reverse (TColStd_Array1OfReal & Weights,const Standard_Integer Last);
		%feature("autodoc", "Args:
	Weights(TColStd_Array1OfReal)
	I1(Standard_Integer)
	I2(Standard_Integer)
	Epsilon(Standard_Real)=0.0

Returns:
	static Standard_Boolean

Returns False if all the weights  of the  array <Weights>  
  between   I1 an I2   are  identic.   Epsilon  is used for  
  comparing  weights. If Epsilon  is 0. the  Epsilon of the  
  first weight is used.") IsRational;
		static Standard_Boolean IsRational (const TColStd_Array1OfReal & Weights,const Standard_Integer I1,const Standard_Integer I2,const Standard_Real Epsilon = 0.0);
		%feature("autodoc", "Args:
	None
Returns:
	static Standard_Integer

returns the degree maxima for a BSplineCurve.") MaxDegree;
		static Standard_Integer MaxDegree ();
		%feature("autodoc", "Args:
	U(Standard_Real)
	Degree(Standard_Integer)
	Knots(Standard_Real)
	Dimension(Standard_Integer)
	Poles(Standard_Real)

Returns:
	static void

Perform the Boor  algorithm  to  evaluate a point at  
         parameter <U>, with <Degree> and <Dimension>.  
 
         Poles is  an array of  Reals of size  
 
         <Dimension> *  <Degree>+1  
 
         Containing  the poles.  At  the end <Poles> contains  
         the current point.") Eval;
		static void Eval (const Standard_Real U,const Standard_Integer Degree,Standard_Real &OutValue,const Standard_Integer Dimension,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Degree(Standard_Integer)
	Knots(Standard_Real)
	Dimension(Standard_Integer)
	Poles(Standard_Real)
	Depth(Standard_Integer)
	Length(Standard_Integer)

Returns:
	static void

Performs the  Boor Algorithm  at  parameter <U> with  
         the given <Degree> and the  array of <Knots> on  the  
         poles <Poles> of dimension  <Dimension>.  The schema  
         is  computed  until  level  <Depth>  on a   basis of  
         <Length+1> poles.  
 
         * Knots is an array of reals of length :  
 
           <Length> + <Degree>  
 
         * Poles is an array of reals of length :  
 
          (2 * <Length> + 1) * <Dimension>  
 
          The poles values  must be  set  in the array at the  
          positions.  
 
           0..Dimension,  
 
           2 * Dimension ..  
           3 * Dimension  
 
           4  * Dimension ..  
           5  * Dimension  
 
           ...  
 
           The results are found in the array poles depending  
           on the Depth. (See the method GetPole).") BoorScheme;
		static void BoorScheme (const Standard_Real U,const Standard_Integer Degree,Standard_Real &OutValue,const Standard_Integer Dimension,Standard_Real &OutValue,const Standard_Integer Depth,const Standard_Integer Length);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Degree(Standard_Integer)
	Knots(Standard_Real)
	Dimension(Standard_Integer)
	Poles(Standard_Real)
	Depth(Standard_Integer)
	Length(Standard_Integer)
	Tolerance(Standard_Real)

Returns:
	static Standard_Boolean

Compute  the content of  Pole before the BoorScheme.  
         This method is used to remove poles.  
 
         U is the poles to  remove, Knots should contains the  
         knots of the curve after knot removal.  
 
         The first  and last poles  do not  change, the other  
         poles are computed by averaging two possible values.  
         The distance between  the  two   possible  poles  is  
         computed, if it  is higher than <Tolerance> False is  
         returned.") AntiBoorScheme;
		static Standard_Boolean AntiBoorScheme (const Standard_Real U,const Standard_Integer Degree,Standard_Real &OutValue,const Standard_Integer Dimension,Standard_Real &OutValue,const Standard_Integer Depth,const Standard_Integer Length,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Degree(Standard_Integer)
	Knots(Standard_Real)
	Dimension(Standard_Integer)
	Length(Standard_Integer)
	Order(Standard_Integer)
	Poles(Standard_Real)

Returns:
	static void

Computes   the   poles of  the    BSpline  giving the  
         derivatives of order <Order>.  
 
         The formula for the first order is  
 
         Pole(i) = Degree * (Pole(i+1) - Pole(i)) /  
                            (Knots(i+Degree+1) - Knots(i+1))  
 
         This formula  is repeated  (Degree  is decremented at  
         each step).") Derivative;
		static void Derivative (const Standard_Integer Degree,Standard_Real &OutValue,const Standard_Integer Dimension,const Standard_Integer Length,const Standard_Integer Order,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Degree(Standard_Integer)
	N(Standard_Integer)
	Knots(Standard_Real)
	Dimension(Standard_Integer)
	Poles(Standard_Real)

Returns:
	static void

Performs the Bohm  Algorithm at  parameter <U>. This  
         algorithm computes the value and all the derivatives  
         up to order N (N <= Degree).  
 
         <Poles> is the original array of poles.  
 
         The   result in  <Poles>  is    the value and    the  
         derivatives.  Poles[0] is  the value,  Poles[Degree]  
         is the last  derivative.") Bohm;
		static void Bohm (const Standard_Real U,const Standard_Integer Degree,const Standard_Integer N,Standard_Real &OutValue,const Standard_Integer Dimension,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	static TColStd_Array1OfReal

Used as argument for a non rational curve.") NoWeights;
		static TColStd_Array1OfReal & NoWeights ();
		%feature("autodoc", "Args:
	None
Returns:
	static TColStd_Array1OfInteger

Used as argument for a flatknots evaluation.") NoMults;
		static TColStd_Array1OfInteger & NoMults ();
		%feature("autodoc", "Args:
	Degree(Standard_Integer)
	Index(Standard_Integer)
	Periodic(Standard_Boolean)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	LK(Standard_Real)

Returns:
	static void

Stores in LK  the usefull knots  for the BoorSchem  
         on the span Knots(Index) - Knots(Index+1)") BuildKnots;
		static void BuildKnots (const Standard_Integer Degree,const Standard_Integer Index,const Standard_Boolean Periodic,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Degree(Standard_Integer)
	Index(Standard_Integer)
	Periodic(Standard_Boolean)
	Mults(TColStd_Array1OfInteger)

Returns:
	static Standard_Integer

Return the index of the  first Pole to  use on the  
         span  Mults(Index)  - Mults(Index+1).  This  index  
         must be added to Poles.Lower().") PoleIndex;
		static Standard_Integer PoleIndex (const Standard_Integer Degree,const Standard_Integer Index,const Standard_Boolean Periodic,const TColStd_Array1OfInteger & Mults);
		%feature("autodoc", "Args:
	Degree(Standard_Integer)
	Index(Standard_Integer)
	Poles(TColStd_Array1OfReal)
	Weights(TColStd_Array1OfReal)
	LP(Standard_Real)

Returns:
	static void

No detailed docstring for this function.") BuildEval;
		static void BuildEval (const Standard_Integer Degree,const Standard_Integer Index,const TColStd_Array1OfReal & Poles,const TColStd_Array1OfReal & Weights,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Degree(Standard_Integer)
	Index(Standard_Integer)
	Poles(TColgp_Array1OfPnt)
	Weights(TColStd_Array1OfReal)
	LP(Standard_Real)

Returns:
	static void

No detailed docstring for this function.") BuildEval;
		static void BuildEval (const Standard_Integer Degree,const Standard_Integer Index,const TColgp_Array1OfPnt & Poles,const TColStd_Array1OfReal & Weights,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Degree(Standard_Integer)
	Index(Standard_Integer)
	Poles(TColgp_Array1OfPnt2d)
	Weights(TColStd_Array1OfReal)
	LP(Standard_Real)

Returns:
	static void

Copy in <LP>  the poles and  weights for  the Eval  
         scheme. starting from  Poles(Poles.Lower()+Index)") BuildEval;
		static void BuildEval (const Standard_Integer Degree,const Standard_Integer Index,const TColgp_Array1OfPnt2d & Poles,const TColStd_Array1OfReal & Weights,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Length(Standard_Integer)
	Dimension(Standard_Integer)
	Poles(TColStd_Array1OfReal)
	LP(Standard_Real)

Returns:
	static void

Copy in <LP>  poles for <Dimension>  Boor  scheme.  
         Starting  from    <Index>     *  <Dimension>, copy  
         <Length+1> poles.") BuildBoor;
		static void BuildBoor (const Standard_Integer Index,const Standard_Integer Length,const Standard_Integer Dimension,const TColStd_Array1OfReal & Poles,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Length(Standard_Integer)
	Depth(Standard_Integer)

Returns:
	static Standard_Integer

Returns the index in  the Boor result array of the  
         poles <Index>. If  the Boor  algorithm was perform  
         with <Length> and <Depth>.") BoorIndex;
		static Standard_Integer BoorIndex (const Standard_Integer Index,const Standard_Integer Length,const Standard_Integer Depth);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Length(Standard_Integer)
	Depth(Standard_Integer)
	Dimension(Standard_Integer)
	LocPoles(Standard_Real)
	Position(Standard_Integer)
	Pole(TColStd_Array1OfReal)

Returns:
	static void

Copy  the  pole at  position  <Index>  in  the Boor  
         scheme of   dimension <Dimension> to  <Position> in  
         the array <Pole>. <Position> is updated.") GetPole;
		static void GetPole (const Standard_Integer Index,const Standard_Integer Length,const Standard_Integer Depth,const Standard_Integer Dimension,Standard_Real &OutValue,Standard_Integer &OutValue,TColStd_Array1OfReal & Pole);
		%feature("autodoc", "Args:
	Degree(Standard_Integer)
	Periodic(Standard_Boolean)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	AddKnots(TColStd_Array1OfReal)
	AddMults(TColStd_Array1OfInteger)
	NbPoles(Standard_Integer)
	NbKnots(Standard_Integer)
	Epsilon(Standard_Real)
	Add(Standard_Boolean)=Standard_True

Returns:
	static Standard_Boolean

Returns in <NbPoles, NbKnots> the  new number of poles  
         and  knots    if  the  sequence   of  knots <AddKnots,  
         AddMults> is inserted in the sequence <Knots, Mults>.  
 
         Epsilon is used to compare knots for equality.  
 
         If Add is True  the multiplicities on  equal knots are  
         added.  
 
         If Add is False the max value of the multiplicities is  
         kept.  
 
         Return False if :  
           The knew knots are knot increasing.  
           The new knots are not in the range.") PrepareInsertKnots;
		static Standard_Boolean PrepareInsertKnots (const Standard_Integer Degree,const Standard_Boolean Periodic,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const TColStd_Array1OfReal & AddKnots,const TColStd_Array1OfInteger & AddMults,Standard_Integer &OutValue,Standard_Integer &OutValue,const Standard_Real Epsilon,const Standard_Boolean Add = Standard_True);
		%feature("autodoc", "Args:
	Degree(Standard_Integer)
	Periodic(Standard_Boolean)
	Dimension(Standard_Integer)
	Poles(TColStd_Array1OfReal)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	AddKnots(TColStd_Array1OfReal)
	AddMults(TColStd_Array1OfInteger)
	NewPoles(TColStd_Array1OfReal)
	NewKnots(TColStd_Array1OfReal)
	NewMults(TColStd_Array1OfInteger)
	Epsilon(Standard_Real)
	Add(Standard_Boolean)=Standard_True

Returns:
	static void

No detailed docstring for this function.") InsertKnots;
		static void InsertKnots (const Standard_Integer Degree,const Standard_Boolean Periodic,const Standard_Integer Dimension,const TColStd_Array1OfReal & Poles,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const TColStd_Array1OfReal & AddKnots,const TColStd_Array1OfInteger & AddMults,TColStd_Array1OfReal & NewPoles,TColStd_Array1OfReal & NewKnots,TColStd_Array1OfInteger & NewMults,const Standard_Real Epsilon,const Standard_Boolean Add = Standard_True);
		%feature("autodoc", "Args:
	Degree(Standard_Integer)
	Periodic(Standard_Boolean)
	Poles(TColgp_Array1OfPnt)
	Weights(TColStd_Array1OfReal)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	AddKnots(TColStd_Array1OfReal)
	AddMults(TColStd_Array1OfInteger)
	NewPoles(TColgp_Array1OfPnt)
	NewWeights(TColStd_Array1OfReal)
	NewKnots(TColStd_Array1OfReal)
	NewMults(TColStd_Array1OfInteger)
	Epsilon(Standard_Real)
	Add(Standard_Boolean)=Standard_True

Returns:
	static void

No detailed docstring for this function.") InsertKnots;
		static void InsertKnots (const Standard_Integer Degree,const Standard_Boolean Periodic,const TColgp_Array1OfPnt & Poles,const TColStd_Array1OfReal & Weights,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const TColStd_Array1OfReal & AddKnots,const TColStd_Array1OfInteger & AddMults,TColgp_Array1OfPnt & NewPoles,TColStd_Array1OfReal & NewWeights,TColStd_Array1OfReal & NewKnots,TColStd_Array1OfInteger & NewMults,const Standard_Real Epsilon,const Standard_Boolean Add = Standard_True);
		%feature("autodoc", "Args:
	Degree(Standard_Integer)
	Periodic(Standard_Boolean)
	Poles(TColgp_Array1OfPnt2d)
	Weights(TColStd_Array1OfReal)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	AddKnots(TColStd_Array1OfReal)
	AddMults(TColStd_Array1OfInteger)
	NewPoles(TColgp_Array1OfPnt2d)
	NewWeights(TColStd_Array1OfReal)
	NewKnots(TColStd_Array1OfReal)
	NewMults(TColStd_Array1OfInteger)
	Epsilon(Standard_Real)
	Add(Standard_Boolean)=Standard_True

Returns:
	static void

Insert   a  sequence  of  knots <AddKnots> with  
 multiplicities   <AddMults>. <AddKnots>   must  be a   non  
 decreasing sequence and verifies :  
 
 Knots(Knots.Lower()) <= AddKnots(AddKnots.Lower())  
 Knots(Knots.Upper()) >= AddKnots(AddKnots.Upper())  
 
 The NewPoles and NewWeights arrays must have a length :  
   Poles.Length() + Sum(AddMults())  
 
 When a knot  to insert is identic  to an existing knot the  
 multiplicities   are added.  
 
 Epsilon is used to test knots for equality.  
 
 When AddMult is negative or null the knot is not inserted.  
 No multiplicity will becomes higher than the degree.  
 
 The new Knots and Multiplicities  are copied in <NewKnots>  
 and  <NewMults>.  
 
 All the New arrays should be correctly dimensioned.  
 
 When all  the new knots  are existing knots, i.e. only the  
 multiplicities  will  change it is   safe to  use the same  
 arrays as input and output.") InsertKnots;
		static void InsertKnots (const Standard_Integer Degree,const Standard_Boolean Periodic,const TColgp_Array1OfPnt2d & Poles,const TColStd_Array1OfReal & Weights,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const TColStd_Array1OfReal & AddKnots,const TColStd_Array1OfInteger & AddMults,TColgp_Array1OfPnt2d & NewPoles,TColStd_Array1OfReal & NewWeights,TColStd_Array1OfReal & NewKnots,TColStd_Array1OfInteger & NewMults,const Standard_Real Epsilon,const Standard_Boolean Add = Standard_True);
		%feature("autodoc", "Args:
	UIndex(Standard_Integer)
	U(Standard_Real)
	UMult(Standard_Integer)
	Degree(Standard_Integer)
	Periodic(Standard_Boolean)
	Poles(TColgp_Array1OfPnt)
	Weights(TColStd_Array1OfReal)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	NewPoles(TColgp_Array1OfPnt)
	NewWeights(TColStd_Array1OfReal)

Returns:
	static void

No detailed docstring for this function.") InsertKnot;
		static void InsertKnot (const Standard_Integer UIndex,const Standard_Real U,const Standard_Integer UMult,const Standard_Integer Degree,const Standard_Boolean Periodic,const TColgp_Array1OfPnt & Poles,const TColStd_Array1OfReal & Weights,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,TColgp_Array1OfPnt & NewPoles,TColStd_Array1OfReal & NewWeights);
		%feature("autodoc", "Args:
	UIndex(Standard_Integer)
	U(Standard_Real)
	UMult(Standard_Integer)
	Degree(Standard_Integer)
	Periodic(Standard_Boolean)
	Poles(TColgp_Array1OfPnt2d)
	Weights(TColStd_Array1OfReal)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	NewPoles(TColgp_Array1OfPnt2d)
	NewWeights(TColStd_Array1OfReal)

Returns:
	static void

Insert a new knot U of multiplicity UMult in the  
 knot sequence.  
 
 The  location of the new Knot  should be given as an input  
 data.  UIndex locates the new knot U  in the knot sequence  
 and Knots (UIndex) < U < Knots (UIndex + 1).  
 
 The new control points corresponding to this insertion are  
 returned. Knots and Mults are not updated.") InsertKnot;
		static void InsertKnot (const Standard_Integer UIndex,const Standard_Real U,const Standard_Integer UMult,const Standard_Integer Degree,const Standard_Boolean Periodic,const TColgp_Array1OfPnt2d & Poles,const TColStd_Array1OfReal & Weights,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,TColgp_Array1OfPnt2d & NewPoles,TColStd_Array1OfReal & NewWeights);
		%feature("autodoc", "Args:
	KnotIndex(Standard_Integer)
	Mult(Standard_Integer)
	Degree(Standard_Integer)
	Periodic(Standard_Boolean)
	Poles(TColgp_Array1OfPnt)
	Weights(TColStd_Array1OfReal)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	NewPoles(TColgp_Array1OfPnt)
	NewWeights(TColStd_Array1OfReal)

Returns:
	static void

No detailed docstring for this function.") RaiseMultiplicity;
		static void RaiseMultiplicity (const Standard_Integer KnotIndex,const Standard_Integer Mult,const Standard_Integer Degree,const Standard_Boolean Periodic,const TColgp_Array1OfPnt & Poles,const TColStd_Array1OfReal & Weights,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,TColgp_Array1OfPnt & NewPoles,TColStd_Array1OfReal & NewWeights);
		%feature("autodoc", "Args:
	KnotIndex(Standard_Integer)
	Mult(Standard_Integer)
	Degree(Standard_Integer)
	Periodic(Standard_Boolean)
	Poles(TColgp_Array1OfPnt2d)
	Weights(TColStd_Array1OfReal)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	NewPoles(TColgp_Array1OfPnt2d)
	NewWeights(TColStd_Array1OfReal)

Returns:
	static void

Raise the multiplicity of knot to <UMult>.  
 
 The new control points  are  returned. Knots and Mults are  
 not updated.") RaiseMultiplicity;
		static void RaiseMultiplicity (const Standard_Integer KnotIndex,const Standard_Integer Mult,const Standard_Integer Degree,const Standard_Boolean Periodic,const TColgp_Array1OfPnt2d & Poles,const TColStd_Array1OfReal & Weights,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,TColgp_Array1OfPnt2d & NewPoles,TColStd_Array1OfReal & NewWeights);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Mult(Standard_Integer)
	Degree(Standard_Integer)
	Periodic(Standard_Boolean)
	Dimension(Standard_Integer)
	Poles(TColStd_Array1OfReal)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	NewPoles(TColStd_Array1OfReal)
	NewKnots(TColStd_Array1OfReal)
	NewMults(TColStd_Array1OfInteger)
	Tolerance(Standard_Real)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") RemoveKnot;
		static Standard_Boolean RemoveKnot (const Standard_Integer Index,const Standard_Integer Mult,const Standard_Integer Degree,const Standard_Boolean Periodic,const Standard_Integer Dimension,const TColStd_Array1OfReal & Poles,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,TColStd_Array1OfReal & NewPoles,TColStd_Array1OfReal & NewKnots,TColStd_Array1OfInteger & NewMults,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Mult(Standard_Integer)
	Degree(Standard_Integer)
	Periodic(Standard_Boolean)
	Poles(TColgp_Array1OfPnt)
	Weights(TColStd_Array1OfReal)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	NewPoles(TColgp_Array1OfPnt)
	NewWeights(TColStd_Array1OfReal)
	NewKnots(TColStd_Array1OfReal)
	NewMults(TColStd_Array1OfInteger)
	Tolerance(Standard_Real)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") RemoveKnot;
		static Standard_Boolean RemoveKnot (const Standard_Integer Index,const Standard_Integer Mult,const Standard_Integer Degree,const Standard_Boolean Periodic,const TColgp_Array1OfPnt & Poles,const TColStd_Array1OfReal & Weights,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,TColgp_Array1OfPnt & NewPoles,TColStd_Array1OfReal & NewWeights,TColStd_Array1OfReal & NewKnots,TColStd_Array1OfInteger & NewMults,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Mult(Standard_Integer)
	Degree(Standard_Integer)
	Periodic(Standard_Boolean)
	Poles(TColgp_Array1OfPnt2d)
	Weights(TColStd_Array1OfReal)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	NewPoles(TColgp_Array1OfPnt2d)
	NewWeights(TColStd_Array1OfReal)
	NewKnots(TColStd_Array1OfReal)
	NewMults(TColStd_Array1OfInteger)
	Tolerance(Standard_Real)

Returns:
	static Standard_Boolean

Decrement the  multiplicity  of <Knots(Index)>  
         to <Mult>. If <Mult>   is  null the   knot  is  
         removed.  
 
         As there are two ways to compute the new poles  
         the midlle   will  be used  as  long    as the  
         distance is lower than Tolerance.  
 
         If a  distance is  bigger  than  tolerance the  
         methods returns False  and  the new arrays are  
         not modified.  
 
         A low  tolerance can be  used  to test  if the  
         knot  can be  removed  without  modifying  the  
         curve.  
 
         A high tolerance  can be used  to 'smooth' the  
         curve.") RemoveKnot;
		static Standard_Boolean RemoveKnot (const Standard_Integer Index,const Standard_Integer Mult,const Standard_Integer Degree,const Standard_Boolean Periodic,const TColgp_Array1OfPnt2d & Poles,const TColStd_Array1OfReal & Weights,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,TColgp_Array1OfPnt2d & NewPoles,TColStd_Array1OfReal & NewWeights,TColStd_Array1OfReal & NewKnots,TColStd_Array1OfInteger & NewMults,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Degree(Standard_Integer)
	NewDegree(Standard_Integer)
	Periodic(Standard_Boolean)
	Mults(TColStd_Array1OfInteger)

Returns:
	static Standard_Integer

Returns the   number   of  knots   of  a  curve   with  
         multiplicities <Mults> after elevating the degree from  
         <Degree> to <NewDegree>. See the IncreaseDegree method  
         for more comments.") IncreaseDegreeCountKnots;
		static Standard_Integer IncreaseDegreeCountKnots (const Standard_Integer Degree,const Standard_Integer NewDegree,const Standard_Boolean Periodic,const TColStd_Array1OfInteger & Mults);
		%feature("autodoc", "Args:
	Degree(Standard_Integer)
	NewDegree(Standard_Integer)
	Periodic(Standard_Boolean)
	Dimension(Standard_Integer)
	Poles(TColStd_Array1OfReal)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	NewPoles(TColStd_Array1OfReal)
	NewKnots(TColStd_Array1OfReal)
	NewMults(TColStd_Array1OfInteger)

Returns:
	static void

No detailed docstring for this function.") IncreaseDegree;
		static void IncreaseDegree (const Standard_Integer Degree,const Standard_Integer NewDegree,const Standard_Boolean Periodic,const Standard_Integer Dimension,const TColStd_Array1OfReal & Poles,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,TColStd_Array1OfReal & NewPoles,TColStd_Array1OfReal & NewKnots,TColStd_Array1OfInteger & NewMults);
		%feature("autodoc", "Args:
	Degree(Standard_Integer)
	NewDegree(Standard_Integer)
	Periodic(Standard_Boolean)
	Poles(TColgp_Array1OfPnt)
	Weights(TColStd_Array1OfReal)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	NewPoles(TColgp_Array1OfPnt)
	NewWeights(TColStd_Array1OfReal)
	NewKnots(TColStd_Array1OfReal)
	NewMults(TColStd_Array1OfInteger)

Returns:
	static void

No detailed docstring for this function.") IncreaseDegree;
		static void IncreaseDegree (const Standard_Integer Degree,const Standard_Integer NewDegree,const Standard_Boolean Periodic,const TColgp_Array1OfPnt & Poles,const TColStd_Array1OfReal & Weights,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,TColgp_Array1OfPnt & NewPoles,TColStd_Array1OfReal & NewWeights,TColStd_Array1OfReal & NewKnots,TColStd_Array1OfInteger & NewMults);
		%feature("autodoc", "Args:
	Degree(Standard_Integer)
	NewDegree(Standard_Integer)
	Periodic(Standard_Boolean)
	Poles(TColgp_Array1OfPnt2d)
	Weights(TColStd_Array1OfReal)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	NewPoles(TColgp_Array1OfPnt2d)
	NewWeights(TColStd_Array1OfReal)
	NewKnots(TColStd_Array1OfReal)
	NewMults(TColStd_Array1OfInteger)

Returns:
	static void

No detailed docstring for this function.") IncreaseDegree;
		static void IncreaseDegree (const Standard_Integer Degree,const Standard_Integer NewDegree,const Standard_Boolean Periodic,const TColgp_Array1OfPnt2d & Poles,const TColStd_Array1OfReal & Weights,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,TColgp_Array1OfPnt2d & NewPoles,TColStd_Array1OfReal & NewWeights,TColStd_Array1OfReal & NewKnots,TColStd_Array1OfInteger & NewMults);
		%feature("autodoc", "Args:
	NewDegree(Standard_Integer)
	Poles(TColgp_Array1OfPnt)
	Weights(TColStd_Array1OfReal)
	NewPoles(TColgp_Array1OfPnt)
	NewWeights(TColStd_Array1OfReal)

Returns:
	static void

No detailed docstring for this function.") IncreaseDegree;
		static void IncreaseDegree (const Standard_Integer NewDegree,const TColgp_Array1OfPnt & Poles,const TColStd_Array1OfReal & Weights,TColgp_Array1OfPnt & NewPoles,TColStd_Array1OfReal & NewWeights);
		%feature("autodoc", "Args:
	NewDegree(Standard_Integer)
	Poles(TColgp_Array1OfPnt2d)
	Weights(TColStd_Array1OfReal)
	NewPoles(TColgp_Array1OfPnt2d)
	NewWeights(TColStd_Array1OfReal)

Returns:
	static void

Increase the degree of a bspline (or bezier) curve  
         of   dimension  <Dimension>  form <Degree>      to  
         <NewDegree>.  
 
         The number of poles in the new curve is :  
 
          Poles.Length() + (NewDegree - Degree) * Number of spans  
 
         Where the number of spans is :  
 
          LastUKnotIndex(Mults) - FirstUKnotIndex(Mults) + 1  
 
          for a non-periodic curve  
 
          And Knots.Length() - 1 for a periodic curve.  
 
         The multiplicities of all  knots  are increased by  
         the degree elevation.  
 
         The new knots are usually  the same knots with the  
         exception of  a non-periodic curve with  the first  
         and last multiplicity not  equal to Degree+1 where  
         knots are removed  form the start  and the  bottom  
         untils the sum of the  multiplicities is  equal to  
         NewDegree+1  at the  knots   corresponding  to the  
         first and last parameters of the curve.  
 
         Example  :  Suppose a  curve  of degree 3 starting  
         with following knots and multiplicities :  
 
         knot : 0.  1.  2.  
         mult : 1   2   1  
 
         The  FirstUKnot is  2.     because the   sum    of  
         multiplicities is Degree+1 : 1 + 2 + 1 = 4 = 3 + 1  
 
         i.e. the first parameter  of the  curve is  2. and  
         will still be   2.  after degree  elevation.   Let  
         raises this curve to degree 4.  The multiplicities  
         are increased by 2.  
 
         They   become 2 3  2.   But     we need a   sum of  
         multiplicities  of 5 at knot  2. So the first knot  
         is removed and the new knots are :  
 
         knot : 1.  2.  
         mult : 3   2  
 
         The multipicity   of the first  knot may   also be  
         reduced if the sum is still to big.  
 
         In the  most common situations (periodic  curve or  
         curve with first and last multiplicities equals to  
         Degree+1) the knots are knot changes.  
 
         The method IncreaseDegreeCountKnots can be used to  
         compute the new number of knots.") IncreaseDegree;
		static void IncreaseDegree (const Standard_Integer NewDegree,const TColgp_Array1OfPnt2d & Poles,const TColStd_Array1OfReal & Weights,TColgp_Array1OfPnt2d & NewPoles,TColStd_Array1OfReal & NewWeights);
		%feature("autodoc", "Args:
	Degree(Standard_Integer)
	Mults(TColStd_Array1OfInteger)
	NbKnots(Standard_Integer)
	NbPoles(Standard_Integer)

Returns:
	static void

Set in <NbKnots> and <NbPolesToAdd> the number of Knots and  
         Poles   of  the NotPeriodic  Curve   identical  at the  
         periodic     curve with    a  degree    <Degree>  ,  a  
         knots-distribution with Multiplicities <Mults>.") PrepareUnperiodize;
		static void PrepareUnperiodize (const Standard_Integer Degree,const TColStd_Array1OfInteger & Mults,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	Degree(Standard_Integer)
	Dimension(Standard_Integer)
	Mults(TColStd_Array1OfInteger)
	Knots(TColStd_Array1OfReal)
	Poles(TColStd_Array1OfReal)
	NewMults(TColStd_Array1OfInteger)
	NewKnots(TColStd_Array1OfReal)
	NewPoles(TColStd_Array1OfReal)

Returns:
	static void

No detailed docstring for this function.") Unperiodize;
		static void Unperiodize (const Standard_Integer Degree,const Standard_Integer Dimension,const TColStd_Array1OfInteger & Mults,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfReal & Poles,TColStd_Array1OfInteger & NewMults,TColStd_Array1OfReal & NewKnots,TColStd_Array1OfReal & NewPoles);
		%feature("autodoc", "Args:
	Degree(Standard_Integer)
	Mults(TColStd_Array1OfInteger)
	Knots(TColStd_Array1OfReal)
	Poles(TColgp_Array1OfPnt)
	Weights(TColStd_Array1OfReal)
	NewMults(TColStd_Array1OfInteger)
	NewKnots(TColStd_Array1OfReal)
	NewPoles(TColgp_Array1OfPnt)
	NewWeights(TColStd_Array1OfReal)

Returns:
	static void

No detailed docstring for this function.") Unperiodize;
		static void Unperiodize (const Standard_Integer Degree,const TColStd_Array1OfInteger & Mults,const TColStd_Array1OfReal & Knots,const TColgp_Array1OfPnt & Poles,const TColStd_Array1OfReal & Weights,TColStd_Array1OfInteger & NewMults,TColStd_Array1OfReal & NewKnots,TColgp_Array1OfPnt & NewPoles,TColStd_Array1OfReal & NewWeights);
		%feature("autodoc", "Args:
	Degree(Standard_Integer)
	Mults(TColStd_Array1OfInteger)
	Knots(TColStd_Array1OfReal)
	Poles(TColgp_Array1OfPnt2d)
	Weights(TColStd_Array1OfReal)
	NewMults(TColStd_Array1OfInteger)
	NewKnots(TColStd_Array1OfReal)
	NewPoles(TColgp_Array1OfPnt2d)
	NewWeights(TColStd_Array1OfReal)

Returns:
	static void

No detailed docstring for this function.") Unperiodize;
		static void Unperiodize (const Standard_Integer Degree,const TColStd_Array1OfInteger & Mults,const TColStd_Array1OfReal & Knots,const TColgp_Array1OfPnt2d & Poles,const TColStd_Array1OfReal & Weights,TColStd_Array1OfInteger & NewMults,TColStd_Array1OfReal & NewKnots,TColgp_Array1OfPnt2d & NewPoles,TColStd_Array1OfReal & NewWeights);
		%feature("autodoc", "Args:
	Degree(Standard_Integer)
	Periodic(Standard_Boolean)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	U1(Standard_Real)
	U2(Standard_Real)
	NbKnots(Standard_Integer)
	NbPoles(Standard_Integer)

Returns:
	static void

Set in <NbKnots> and <NbPoles> the number of Knots and  
         Poles of the  curve resulting  of  the trimming of the  
         BSplinecurve definded with <degree>, <knots>, <mults>") PrepareTrimming;
		static void PrepareTrimming (const Standard_Integer Degree,const Standard_Boolean Periodic,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Real U1,const Standard_Real U2,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	Degree(Standard_Integer)
	Periodic(Standard_Boolean)
	Dimension(Standard_Integer)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	Poles(TColStd_Array1OfReal)
	U1(Standard_Real)
	U2(Standard_Real)
	NewKnots(TColStd_Array1OfReal)
	NewMults(TColStd_Array1OfInteger)
	NewPoles(TColStd_Array1OfReal)

Returns:
	static void

No detailed docstring for this function.") Trimming;
		static void Trimming (const Standard_Integer Degree,const Standard_Boolean Periodic,const Standard_Integer Dimension,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const TColStd_Array1OfReal & Poles,const Standard_Real U1,const Standard_Real U2,TColStd_Array1OfReal & NewKnots,TColStd_Array1OfInteger & NewMults,TColStd_Array1OfReal & NewPoles);
		%feature("autodoc", "Args:
	Degree(Standard_Integer)
	Periodic(Standard_Boolean)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	Poles(TColgp_Array1OfPnt)
	Weights(TColStd_Array1OfReal)
	U1(Standard_Real)
	U2(Standard_Real)
	NewKnots(TColStd_Array1OfReal)
	NewMults(TColStd_Array1OfInteger)
	NewPoles(TColgp_Array1OfPnt)
	NewWeights(TColStd_Array1OfReal)

Returns:
	static void

No detailed docstring for this function.") Trimming;
		static void Trimming (const Standard_Integer Degree,const Standard_Boolean Periodic,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const TColgp_Array1OfPnt & Poles,const TColStd_Array1OfReal & Weights,const Standard_Real U1,const Standard_Real U2,TColStd_Array1OfReal & NewKnots,TColStd_Array1OfInteger & NewMults,TColgp_Array1OfPnt & NewPoles,TColStd_Array1OfReal & NewWeights);
		%feature("autodoc", "Args:
	Degree(Standard_Integer)
	Periodic(Standard_Boolean)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	Poles(TColgp_Array1OfPnt2d)
	Weights(TColStd_Array1OfReal)
	U1(Standard_Real)
	U2(Standard_Real)
	NewKnots(TColStd_Array1OfReal)
	NewMults(TColStd_Array1OfInteger)
	NewPoles(TColgp_Array1OfPnt2d)
	NewWeights(TColStd_Array1OfReal)

Returns:
	static void

No detailed docstring for this function.") Trimming;
		static void Trimming (const Standard_Integer Degree,const Standard_Boolean Periodic,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const TColgp_Array1OfPnt2d & Poles,const TColStd_Array1OfReal & Weights,const Standard_Real U1,const Standard_Real U2,TColStd_Array1OfReal & NewKnots,TColStd_Array1OfInteger & NewMults,TColgp_Array1OfPnt2d & NewPoles,TColStd_Array1OfReal & NewWeights);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Index(Standard_Integer)
	Degree(Standard_Integer)
	Periodic(Standard_Boolean)
	Poles(TColStd_Array1OfReal)
	Weights(TColStd_Array1OfReal)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	P(Standard_Real)

Returns:
	static void

No detailed docstring for this function.") D0;
		static void D0 (const Standard_Real U,const Standard_Integer Index,const Standard_Integer Degree,const Standard_Boolean Periodic,const TColStd_Array1OfReal & Poles,const TColStd_Array1OfReal & Weights,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Index(Standard_Integer)
	Degree(Standard_Integer)
	Periodic(Standard_Boolean)
	Poles(TColgp_Array1OfPnt)
	Weights(TColStd_Array1OfReal)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	P(gp_Pnt)

Returns:
	static void

No detailed docstring for this function.") D0;
		static void D0 (const Standard_Real U,const Standard_Integer Index,const Standard_Integer Degree,const Standard_Boolean Periodic,const TColgp_Array1OfPnt & Poles,const TColStd_Array1OfReal & Weights,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	UIndex(Standard_Integer)
	Degree(Standard_Integer)
	Periodic(Standard_Boolean)
	Poles(TColgp_Array1OfPnt2d)
	Weights(TColStd_Array1OfReal)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	P(gp_Pnt2d)

Returns:
	static void

No detailed docstring for this function.") D0;
		static void D0 (const Standard_Real U,const Standard_Integer UIndex,const Standard_Integer Degree,const Standard_Boolean Periodic,const TColgp_Array1OfPnt2d & Poles,const TColStd_Array1OfReal & Weights,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,gp_Pnt2d & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Poles(TColgp_Array1OfPnt)
	Weights(TColStd_Array1OfReal)
	P(gp_Pnt)

Returns:
	static void

No detailed docstring for this function.") D0;
		static void D0 (const Standard_Real U,const TColgp_Array1OfPnt & Poles,const TColStd_Array1OfReal & Weights,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Poles(TColgp_Array1OfPnt2d)
	Weights(TColStd_Array1OfReal)
	P(gp_Pnt2d)

Returns:
	static void

No detailed docstring for this function.") D0;
		static void D0 (const Standard_Real U,const TColgp_Array1OfPnt2d & Poles,const TColStd_Array1OfReal & Weights,gp_Pnt2d & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Index(Standard_Integer)
	Degree(Standard_Integer)
	Periodic(Standard_Boolean)
	Poles(TColStd_Array1OfReal)
	Weights(TColStd_Array1OfReal)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	P(Standard_Real)
	V(Standard_Real)

Returns:
	static void

No detailed docstring for this function.") D1;
		static void D1 (const Standard_Real U,const Standard_Integer Index,const Standard_Integer Degree,const Standard_Boolean Periodic,const TColStd_Array1OfReal & Poles,const TColStd_Array1OfReal & Weights,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Index(Standard_Integer)
	Degree(Standard_Integer)
	Periodic(Standard_Boolean)
	Poles(TColgp_Array1OfPnt)
	Weights(TColStd_Array1OfReal)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	P(gp_Pnt)
	V(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") D1;
		static void D1 (const Standard_Real U,const Standard_Integer Index,const Standard_Integer Degree,const Standard_Boolean Periodic,const TColgp_Array1OfPnt & Poles,const TColStd_Array1OfReal & Weights,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,gp_Pnt & P,gp_Vec & V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	UIndex(Standard_Integer)
	Degree(Standard_Integer)
	Periodic(Standard_Boolean)
	Poles(TColgp_Array1OfPnt2d)
	Weights(TColStd_Array1OfReal)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	P(gp_Pnt2d)
	V(gp_Vec2d)

Returns:
	static void

No detailed docstring for this function.") D1;
		static void D1 (const Standard_Real U,const Standard_Integer UIndex,const Standard_Integer Degree,const Standard_Boolean Periodic,const TColgp_Array1OfPnt2d & Poles,const TColStd_Array1OfReal & Weights,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,gp_Pnt2d & P,gp_Vec2d & V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Poles(TColgp_Array1OfPnt)
	Weights(TColStd_Array1OfReal)
	P(gp_Pnt)
	V(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") D1;
		static void D1 (const Standard_Real U,const TColgp_Array1OfPnt & Poles,const TColStd_Array1OfReal & Weights,gp_Pnt & P,gp_Vec & V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Poles(TColgp_Array1OfPnt2d)
	Weights(TColStd_Array1OfReal)
	P(gp_Pnt2d)
	V(gp_Vec2d)

Returns:
	static void

No detailed docstring for this function.") D1;
		static void D1 (const Standard_Real U,const TColgp_Array1OfPnt2d & Poles,const TColStd_Array1OfReal & Weights,gp_Pnt2d & P,gp_Vec2d & V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Index(Standard_Integer)
	Degree(Standard_Integer)
	Periodic(Standard_Boolean)
	Poles(TColStd_Array1OfReal)
	Weights(TColStd_Array1OfReal)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	P(Standard_Real)
	V1(Standard_Real)
	V2(Standard_Real)

Returns:
	static void

No detailed docstring for this function.") D2;
		static void D2 (const Standard_Real U,const Standard_Integer Index,const Standard_Integer Degree,const Standard_Boolean Periodic,const TColStd_Array1OfReal & Poles,const TColStd_Array1OfReal & Weights,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Index(Standard_Integer)
	Degree(Standard_Integer)
	Periodic(Standard_Boolean)
	Poles(TColgp_Array1OfPnt)
	Weights(TColStd_Array1OfReal)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") D2;
		static void D2 (const Standard_Real U,const Standard_Integer Index,const Standard_Integer Degree,const Standard_Boolean Periodic,const TColgp_Array1OfPnt & Poles,const TColStd_Array1OfReal & Weights,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	UIndex(Standard_Integer)
	Degree(Standard_Integer)
	Periodic(Standard_Boolean)
	Poles(TColgp_Array1OfPnt2d)
	Weights(TColStd_Array1OfReal)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	P(gp_Pnt2d)
	V1(gp_Vec2d)
	V2(gp_Vec2d)

Returns:
	static void

No detailed docstring for this function.") D2;
		static void D2 (const Standard_Real U,const Standard_Integer UIndex,const Standard_Integer Degree,const Standard_Boolean Periodic,const TColgp_Array1OfPnt2d & Poles,const TColStd_Array1OfReal & Weights,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Poles(TColgp_Array1OfPnt)
	Weights(TColStd_Array1OfReal)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") D2;
		static void D2 (const Standard_Real U,const TColgp_Array1OfPnt & Poles,const TColStd_Array1OfReal & Weights,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Poles(TColgp_Array1OfPnt2d)
	Weights(TColStd_Array1OfReal)
	P(gp_Pnt2d)
	V1(gp_Vec2d)
	V2(gp_Vec2d)

Returns:
	static void

No detailed docstring for this function.") D2;
		static void D2 (const Standard_Real U,const TColgp_Array1OfPnt2d & Poles,const TColStd_Array1OfReal & Weights,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Index(Standard_Integer)
	Degree(Standard_Integer)
	Periodic(Standard_Boolean)
	Poles(TColStd_Array1OfReal)
	Weights(TColStd_Array1OfReal)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	P(Standard_Real)
	V1(Standard_Real)
	V2(Standard_Real)
	V3(Standard_Real)

Returns:
	static void

No detailed docstring for this function.") D3;
		static void D3 (const Standard_Real U,const Standard_Integer Index,const Standard_Integer Degree,const Standard_Boolean Periodic,const TColStd_Array1OfReal & Poles,const TColStd_Array1OfReal & Weights,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Index(Standard_Integer)
	Degree(Standard_Integer)
	Periodic(Standard_Boolean)
	Poles(TColgp_Array1OfPnt)
	Weights(TColStd_Array1OfReal)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)
	V3(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") D3;
		static void D3 (const Standard_Real U,const Standard_Integer Index,const Standard_Integer Degree,const Standard_Boolean Periodic,const TColgp_Array1OfPnt & Poles,const TColStd_Array1OfReal & Weights,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("autodoc", "Args:
	U(Standard_Real)
	UIndex(Standard_Integer)
	Degree(Standard_Integer)
	Periodic(Standard_Boolean)
	Poles(TColgp_Array1OfPnt2d)
	Weights(TColStd_Array1OfReal)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	P(gp_Pnt2d)
	V1(gp_Vec2d)
	V2(gp_Vec2d)
	V3(gp_Vec2d)

Returns:
	static void

No detailed docstring for this function.") D3;
		static void D3 (const Standard_Real U,const Standard_Integer UIndex,const Standard_Integer Degree,const Standard_Boolean Periodic,const TColgp_Array1OfPnt2d & Poles,const TColStd_Array1OfReal & Weights,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Poles(TColgp_Array1OfPnt)
	Weights(TColStd_Array1OfReal)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)
	V3(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") D3;
		static void D3 (const Standard_Real U,const TColgp_Array1OfPnt & Poles,const TColStd_Array1OfReal & Weights,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Poles(TColgp_Array1OfPnt2d)
	Weights(TColStd_Array1OfReal)
	P(gp_Pnt2d)
	V1(gp_Vec2d)
	V2(gp_Vec2d)
	V3(gp_Vec2d)

Returns:
	static void

No detailed docstring for this function.") D3;
		static void D3 (const Standard_Real U,const TColgp_Array1OfPnt2d & Poles,const TColStd_Array1OfReal & Weights,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);
		%feature("autodoc", "Args:
	Side(Standard_Integer)
	DerivativeOrder(Standard_Integer)
	Order(Standard_Integer)
	FlatKnots(TColStd_Array1OfReal)
	Parameter(Standard_Real)
	FirstNonZeroBsplineIndex(Standard_Integer)
	BsplineBasis(math_Matrix)

Returns:
	static Standard_Integer

This  evaluates  the Bspline  Basis  at  a  
         given  parameter  Parameter   up   to  the  
         requested   DerivativeOrder  and store the  
         result  in the  array BsplineBasis  in the  
         following   fashion  
         BSplineBasis(1,1)   =  
         value of first non vanishing  
         Bspline function which has Index FirstNonZeroBsplineIndex  
           BsplineBasis(1,2)   =  
           value of second non vanishing  
         Bspline   function which  has   Index  
         FirstNonZeroBsplineIndex + 1  
         BsplineBasis(1,n)   =  
           value of second non vanishing non vanishing  
         Bspline   function which  has   Index  
         FirstNonZeroBsplineIndex + n (n <= Order)  
         BSplineBasis(2,1)   =  
         value of derivative of first non vanishing  
         Bspline function which has Index FirstNonZeroBsplineIndex  
           BSplineBasis(N,1)   =  
         value of Nth derivative of first non vanishing  
         Bspline function which has Index FirstNonZeroBsplineIndex  
         if N <= DerivativeOrder + 1") EvalBsplineBasis;
		static Standard_Integer EvalBsplineBasis (const Standard_Integer Side,const Standard_Integer DerivativeOrder,const Standard_Integer Order,const TColStd_Array1OfReal & FlatKnots,const Standard_Real Parameter,Standard_Integer &OutValue,math_Matrix & BsplineBasis);
		%feature("autodoc", "Args:
	Parameters(TColStd_Array1OfReal)
	OrderArray(TColStd_Array1OfInteger)
	FlatKnots(TColStd_Array1OfReal)
	Degree(Standard_Integer)
	Matrix(math_Matrix)
	UpperBandWidth(Standard_Integer)
	LowerBandWidth(Standard_Integer)

Returns:
	static Standard_Integer

This Builds   a fully  blown   Matrix of  
           (ni)  
         Bi    (tj)  
 
         with i  and j within 1..Order + NumPoles  
         The  integer ni is   the ith slot of the  
         array OrderArray, tj is the jth slot of  
         the array Parameters") BuildBSpMatrix;
		static Standard_Integer BuildBSpMatrix (const TColStd_Array1OfReal & Parameters,const TColStd_Array1OfInteger & OrderArray,const TColStd_Array1OfReal & FlatKnots,const Standard_Integer Degree,math_Matrix & Matrix,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	Matrix(math_Matrix)
	UpperBandWidth(Standard_Integer)
	LowerBandWidth(Standard_Integer)
	PivotIndexProblem(Standard_Integer)

Returns:
	static Standard_Integer

this  factors  the Banded Matrix in  
        the LU form with a Banded storage of  
        components of the L matrix  
        WARNING : do not use if the Matrix is  
        totally positive (It is the case for  
        Bspline matrices build as above with  
        parameters being the Schoenberg points") FactorBandedMatrix;
		static Standard_Integer FactorBandedMatrix (math_Matrix & Matrix,const Standard_Integer UpperBandWidth,const Standard_Integer LowerBandWidth,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	Matrix(math_Matrix)
	UpperBandWidth(Standard_Integer)
	LowerBandWidth(Standard_Integer)
	ArrayDimension(Standard_Integer)
	Array(Standard_Real)

Returns:
	static Standard_Integer

This solves  the system Matrix.X =  B  
        with when Matrix is factored in LU form  
        The  Array   is    an   seen   as    an  
        Array[1..N][1..ArrayDimension] with N =  
        the  rank  of the  matrix  Matrix.  The  
        result is stored   in Array  when  each  
        coordinate is  solved that is  B is the  
        array whose values are  
        B[i] = Array[i][p] for each p in 1..ArrayDimension") SolveBandedSystem;
		static Standard_Integer SolveBandedSystem (const math_Matrix & Matrix,const Standard_Integer UpperBandWidth,const Standard_Integer LowerBandWidth,const Standard_Integer ArrayDimension,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Matrix(math_Matrix)
	UpperBandWidth(Standard_Integer)
	LowerBandWidth(Standard_Integer)
	Array(TColgp_Array1OfPnt2d)

Returns:
	static Standard_Integer

This solves  the system Matrix.X =  B  
        with when Matrix is factored in LU form  
        The  Array   has the length of  
        the  rank  of the  matrix  Matrix.  The  
        result is stored   in Array  when  each  
        coordinate is  solved that is  B is the  
        array whose values are  
        B[i] = Array[i][p] for each p in 1..ArrayDimension") SolveBandedSystem;
		static Standard_Integer SolveBandedSystem (const math_Matrix & Matrix,const Standard_Integer UpperBandWidth,const Standard_Integer LowerBandWidth,TColgp_Array1OfPnt2d & Array);
		%feature("autodoc", "Args:
	Matrix(math_Matrix)
	UpperBandWidth(Standard_Integer)
	LowerBandWidth(Standard_Integer)
	Array(TColgp_Array1OfPnt)

Returns:
	static Standard_Integer

This solves  the system Matrix.X =  B  
        with when Matrix is factored in LU form  
        The  Array   has the length of  
        the  rank  of the  matrix  Matrix.  The  
        result is stored   in Array  when  each  
        coordinate is  solved that is  B is the  
        array whose values are  
        B[i] = Array[i][p] for each p in 1..ArrayDimension") SolveBandedSystem;
		static Standard_Integer SolveBandedSystem (const math_Matrix & Matrix,const Standard_Integer UpperBandWidth,const Standard_Integer LowerBandWidth,TColgp_Array1OfPnt & Array);
		%feature("autodoc", "Args:
	Matrix(math_Matrix)
	UpperBandWidth(Standard_Integer)
	LowerBandWidth(Standard_Integer)
	HomogenousFlag(Standard_Boolean)
	ArrayDimension(Standard_Integer)
	Array(Standard_Real)
	Weights(Standard_Real)

Returns:
	static Standard_Integer

No detailed docstring for this function.") SolveBandedSystem;
		static Standard_Integer SolveBandedSystem (const math_Matrix & Matrix,const Standard_Integer UpperBandWidth,const Standard_Integer LowerBandWidth,const Standard_Boolean HomogenousFlag,const Standard_Integer ArrayDimension,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Matrix(math_Matrix)
	UpperBandWidth(Standard_Integer)
	LowerBandWidth(Standard_Integer)
	HomogenousFlag(Standard_Boolean)
	Array(TColgp_Array1OfPnt2d)
	Weights(TColStd_Array1OfReal)

Returns:
	static Standard_Integer

This solves the  system Matrix.X =  B  
        with when Matrix is factored in LU form  
        The    Array   is    an   seen  as   an  
        Array[1..N][1..ArrayDimension] with N =  
        the  rank  of  the  matrix Matrix.  The  
        result is  stored   in Array when  each  
        coordinate is  solved that is B  is the  
        array  whose   values     are   B[i]  =  
        Array[i][p]       for     each  p    in  
        1..ArrayDimension. If  HomogeneousFlag ==  
        0  the  Poles  are  multiplied by   the  
        Weights   uppon   Entry   and      once  
        interpolation   is    carried  over the  
        result of the  poles are divided by the  
        result of   the   interpolation of  the  
        weights. Otherwise if HomogenousFlag == 1  
        the Poles and Weigths are treated homogenously  
        that is that those are interpolated as they  
        are and result is returned without division  
        by the interpolated weigths.") SolveBandedSystem;
		static Standard_Integer SolveBandedSystem (const math_Matrix & Matrix,const Standard_Integer UpperBandWidth,const Standard_Integer LowerBandWidth,const Standard_Boolean HomogenousFlag,TColgp_Array1OfPnt2d & Array,TColStd_Array1OfReal & Weights);
		%feature("autodoc", "Args:
	Matrix(math_Matrix)
	UpperBandWidth(Standard_Integer)
	LowerBandWidth(Standard_Integer)
	HomogeneousFlag(Standard_Boolean)
	Array(TColgp_Array1OfPnt)
	Weights(TColStd_Array1OfReal)

Returns:
	static Standard_Integer

This solves  the system Matrix.X =  B  
        with when Matrix is factored in LU form  
        The  Array   is    an   seen   as    an  
        Array[1..N][1..ArrayDimension] with N =  
        the  rank  of the  matrix  Matrix.  The  
        result is stored   in Array  when  each  
        coordinate is  solved that is  B is the  
        array whose values are  
        B[i] = Array[i][p] for each p in 1..ArrayDimension  
        If  HomogeneousFlag ==  
        0  the  Poles  are  multiplied by   the  
        Weights   uppon   Entry   and      once  
        interpolation   is    carried  over the  
        result of the  poles are divided by the  
        result of   the   interpolation of  the  
        weights. Otherwise if HomogenousFlag == 1  
        the Poles and Weigths are treated homogenously  
        that is that those are interpolated as they  
        are and result is returned without division  
        by the interpolated weigths.") SolveBandedSystem;
		static Standard_Integer SolveBandedSystem (const math_Matrix & Matrix,const Standard_Integer UpperBandWidth,const Standard_Integer LowerBandWidth,const Standard_Boolean HomogeneousFlag,TColgp_Array1OfPnt & Array,TColStd_Array1OfReal & Weights);
		%feature("autodoc", "Args:
	Tolerance(Standard_Real)
	StartValue(Standard_Real)
	EndValue(Standard_Real)
	Degree1(Standard_Integer)
	Knots1(TColStd_Array1OfReal)
	Mults1(TColStd_Array1OfInteger)
	Degree2(Standard_Integer)
	Knots2(TColStd_Array1OfReal)
	Mults2(TColStd_Array1OfInteger)
	NumPoles(Standard_Integer)
	NewKnots(Handle_TColStd_HArray1OfReal)
	NewMults(Handle_TColStd_HArray1OfInteger)

Returns:
	static void

Merges  two knot vector by   setting the starting and  
         ending values to StartValue and EndValue") MergeBSplineKnots;
		static void MergeBSplineKnots (const Standard_Real Tolerance,const Standard_Real StartValue,const Standard_Real EndValue,const Standard_Integer Degree1,const TColStd_Array1OfReal & Knots1,const TColStd_Array1OfInteger & Mults1,const Standard_Integer Degree2,const TColStd_Array1OfReal & Knots2,const TColStd_Array1OfInteger & Mults2,Standard_Integer &OutValue,Handle_TColStd_HArray1OfReal & NewKnots,Handle_TColStd_HArray1OfInteger & NewMults);
		%feature("autodoc", "Args:
	Function(BSplCLib_EvaluatorFunction)
	BSplineDegree(Standard_Integer)
	BSplineFlatKnots(TColStd_Array1OfReal)
	PolesDimension(Standard_Integer)
	Poles(Standard_Real)
	FlatKnots(TColStd_Array1OfReal)
	NewDegree(Standard_Integer)
	NewPoles(Standard_Real)
	Status(Standard_Integer)

Returns:
	static void

This function will compose  a given Vectorial BSpline F(t)  
         defined  by its  BSplineDegree and BSplineFlatKnotsl,  
         its Poles  array which are coded as  an array of Real  
         of  the  form  [1..NumPoles][1..PolesDimension] with  a  
         function     a(t) which is   assumed to   satisfy the  
         following:  
 
      1. F(a(t))  is a polynomial BSpline  
         that can be expressed  exactly as a BSpline of degree  
         NewDegree on the knots FlatKnots  
 
      2. a(t) defines a differentiable  
         isomorphism between the range of FlatKnots to the range  
         of BSplineFlatKnots which is the  
         same as the  range of F(t)  
 
 Warning: it is  
         the caller's responsability to insure that conditions  
         1. and  2. above are  satisfied : no check whatsoever  
         is made in this method  
 
Status will return 0 if OK else it will return the pivot index  
       of the matrix that was inverted to compute the multiplied  
       BSpline : the method used is interpolation at Schoenenberg  
       points of F(a(t))") FunctionReparameterise;
		static void FunctionReparameterise (const BSplCLib_EvaluatorFunction & Function,const Standard_Integer BSplineDegree,const TColStd_Array1OfReal & BSplineFlatKnots,const Standard_Integer PolesDimension,Standard_Real &OutValue,const TColStd_Array1OfReal & FlatKnots,const Standard_Integer NewDegree,Standard_Real &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	Function(BSplCLib_EvaluatorFunction)
	BSplineDegree(Standard_Integer)
	BSplineFlatKnots(TColStd_Array1OfReal)
	Poles(TColStd_Array1OfReal)
	FlatKnots(TColStd_Array1OfReal)
	NewDegree(Standard_Integer)
	NewPoles(TColStd_Array1OfReal)
	Status(Standard_Integer)

Returns:
	static void

This function will compose  a given Vectorial BSpline F(t)  
         defined  by its  BSplineDegree and BSplineFlatKnotsl,  
         its Poles  array which are coded as  an array of Real  
         of  the  form  [1..NumPoles][1..PolesDimension] with  a  
         function     a(t) which is   assumed to   satisfy the  
         following:  
 
      1. F(a(t))  is a polynomial BSpline  
         that can be expressed  exactly as a BSpline of degree  
         NewDegree on the knots FlatKnots  
 
      2. a(t) defines a differentiable  
         isomorphism between the range of FlatKnots to the range  
         of BSplineFlatKnots which is the  
         same as the  range of F(t)  
 
 Warning: it is  
         the caller's responsability to insure that conditions  
         1. and  2. above are  satisfied : no check whatsoever  
         is made in this method  
 
Status will return 0 if OK else it will return the pivot index  
       of the matrix that was inverted to compute the multiplied  
       BSpline : the method used is interpolation at Schoenenberg  
       points of F(a(t))") FunctionReparameterise;
		static void FunctionReparameterise (const BSplCLib_EvaluatorFunction & Function,const Standard_Integer BSplineDegree,const TColStd_Array1OfReal & BSplineFlatKnots,const TColStd_Array1OfReal & Poles,const TColStd_Array1OfReal & FlatKnots,const Standard_Integer NewDegree,TColStd_Array1OfReal & NewPoles,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	Function(BSplCLib_EvaluatorFunction)
	BSplineDegree(Standard_Integer)
	BSplineFlatKnots(TColStd_Array1OfReal)
	Poles(TColgp_Array1OfPnt)
	FlatKnots(TColStd_Array1OfReal)
	NewDegree(Standard_Integer)
	NewPoles(TColgp_Array1OfPnt)
	Status(Standard_Integer)

Returns:
	static void

this will compose  a given Vectorial BSpline F(t)  
         defined  by its  BSplineDegree and BSplineFlatKnotsl,  
         its Poles  array which are coded as  an array of Real  
         of  the  form  [1..NumPoles][1..PolesDimension] with  a  
         function     a(t) which is   assumed to   satisfy the  
         following  : 1. F(a(t))  is a polynomial BSpline  
         that can be expressed  exactly as a BSpline of degree  
         NewDegree on the knots FlatKnots  
                      2. a(t) defines a differentiable  
         isomorphism between the range of FlatKnots to the range  
         of BSplineFlatKnots which is the  
         same as the  range of F(t)  
 Warning: it is  
         the caller's responsability to insure that conditions  
         1. and  2. above are  satisfied : no check whatsoever  
         is made in this method  
Status will return 0 if OK else it will return the pivot index  
       of the matrix that was inverted to compute the multiplied  
       BSpline : the method used is interpolation at Schoenenberg  
       points of F(a(t))") FunctionReparameterise;
		static void FunctionReparameterise (const BSplCLib_EvaluatorFunction & Function,const Standard_Integer BSplineDegree,const TColStd_Array1OfReal & BSplineFlatKnots,const TColgp_Array1OfPnt & Poles,const TColStd_Array1OfReal & FlatKnots,const Standard_Integer NewDegree,TColgp_Array1OfPnt & NewPoles,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	Function(BSplCLib_EvaluatorFunction)
	BSplineDegree(Standard_Integer)
	BSplineFlatKnots(TColStd_Array1OfReal)
	Poles(TColgp_Array1OfPnt2d)
	FlatKnots(TColStd_Array1OfReal)
	NewDegree(Standard_Integer)
	NewPoles(TColgp_Array1OfPnt2d)
	Status(Standard_Integer)

Returns:
	static void

this will compose  a given Vectorial BSpline F(t)  
         defined  by its  BSplineDegree and BSplineFlatKnotsl,  
         its Poles  array which are coded as  an array of Real  
         of  the  form  [1..NumPoles][1..PolesDimension] with  a  
         function     a(t) which is   assumed to   satisfy the  
         following  : 1. F(a(t))  is a polynomial BSpline  
         that can be expressed  exactly as a BSpline of degree  
         NewDegree on the knots FlatKnots  
                      2. a(t) defines a differentiable  
         isomorphism between the range of FlatKnots to the range  
         of BSplineFlatKnots which is the  
         same as the  range of F(t)  
 Warning: it is  
         the caller's responsability to insure that conditions  
         1. and  2. above are  satisfied : no check whatsoever  
         is made in this method  
Status will return 0 if OK else it will return the pivot index  
       of the matrix that was inverted to compute the multiplied  
       BSpline : the method used is interpolation at Schoenenberg  
       points of F(a(t))") FunctionReparameterise;
		static void FunctionReparameterise (const BSplCLib_EvaluatorFunction & Function,const Standard_Integer BSplineDegree,const TColStd_Array1OfReal & BSplineFlatKnots,const TColgp_Array1OfPnt2d & Poles,const TColStd_Array1OfReal & FlatKnots,const Standard_Integer NewDegree,TColgp_Array1OfPnt2d & NewPoles,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	Function(BSplCLib_EvaluatorFunction)
	BSplineDegree(Standard_Integer)
	BSplineFlatKnots(TColStd_Array1OfReal)
	PolesDimension(Standard_Integer)
	Poles(Standard_Real)
	FlatKnots(TColStd_Array1OfReal)
	NewDegree(Standard_Integer)
	NewPoles(Standard_Real)
	Status(Standard_Integer)

Returns:
	static void

this will  multiply a given Vectorial BSpline F(t)  
         defined  by its  BSplineDegree and BSplineFlatKnotsl,  
         its Poles  array which are coded as  an array of Real  
         of  the  form  [1..NumPoles][1..PolesDimension] by  a  
         function     a(t) which is   assumed to   satisfy the  
         following  : 1. a(t)  * F(t)  is a polynomial BSpline  
         that can be expressed  exactly as a BSpline of degree  
         NewDegree on the knots FlatKnots 2. the range of a(t)  
          is the same as the  range of F(t)  
 Warning: it is  
         the caller's responsability to insure that conditions  
         1. and  2. above are  satisfied : no check whatsoever  
         is made in this method  
Status will return 0 if OK else it will return the pivot index  
       of the matrix that was inverted to compute the multiplied  
       BSpline : the method used is interpolation at Schoenenberg  
       points of a(t)*F(t)") FunctionMultiply;
		static void FunctionMultiply (const BSplCLib_EvaluatorFunction & Function,const Standard_Integer BSplineDegree,const TColStd_Array1OfReal & BSplineFlatKnots,const Standard_Integer PolesDimension,Standard_Real &OutValue,const TColStd_Array1OfReal & FlatKnots,const Standard_Integer NewDegree,Standard_Real &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	Function(BSplCLib_EvaluatorFunction)
	BSplineDegree(Standard_Integer)
	BSplineFlatKnots(TColStd_Array1OfReal)
	Poles(TColStd_Array1OfReal)
	FlatKnots(TColStd_Array1OfReal)
	NewDegree(Standard_Integer)
	NewPoles(TColStd_Array1OfReal)
	Status(Standard_Integer)

Returns:
	static void

this will  multiply a given Vectorial BSpline F(t)  
         defined  by its  BSplineDegree and BSplineFlatKnotsl,  
         its Poles  array which are coded as  an array of Real  
         of  the  form  [1..NumPoles][1..PolesDimension] by  a  
         function     a(t) which is   assumed to   satisfy the  
         following  : 1. a(t)  * F(t)  is a polynomial BSpline  
         that can be expressed  exactly as a BSpline of degree  
         NewDegree on the knots FlatKnots 2. the range of a(t)  
          is the same as the  range of F(t)  
 Warning: it is  
         the caller's responsability to insure that conditions  
         1. and  2. above are  satisfied : no check whatsoever  
         is made in this method  
Status will return 0 if OK else it will return the pivot index  
       of the matrix that was inverted to compute the multiplied  
       BSpline : the method used is interpolation at Schoenenberg  
       points of a(t)*F(t)") FunctionMultiply;
		static void FunctionMultiply (const BSplCLib_EvaluatorFunction & Function,const Standard_Integer BSplineDegree,const TColStd_Array1OfReal & BSplineFlatKnots,const TColStd_Array1OfReal & Poles,const TColStd_Array1OfReal & FlatKnots,const Standard_Integer NewDegree,TColStd_Array1OfReal & NewPoles,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	Function(BSplCLib_EvaluatorFunction)
	BSplineDegree(Standard_Integer)
	BSplineFlatKnots(TColStd_Array1OfReal)
	Poles(TColgp_Array1OfPnt2d)
	FlatKnots(TColStd_Array1OfReal)
	NewDegree(Standard_Integer)
	NewPoles(TColgp_Array1OfPnt2d)
	Status(Standard_Integer)

Returns:
	static void

this will  multiply a given Vectorial BSpline F(t)  
         defined  by its  BSplineDegree and BSplineFlatKnotsl,  
         its Poles  array which are coded as  an array of Real  
         of  the  form  [1..NumPoles][1..PolesDimension] by  a  
         function     a(t) which is   assumed to   satisfy the  
         following  : 1. a(t)  * F(t)  is a polynomial BSpline  
         that can be expressed  exactly as a BSpline of degree  
         NewDegree on the knots FlatKnots 2. the range of a(t)  
          is the same as the  range of F(t)  
 Warning: it is  
         the caller's responsability to insure that conditions  
         1. and  2. above are  satisfied : no check whatsoever  
         is made in this method  
Status will return 0 if OK else it will return the pivot index  
       of the matrix that was inverted to compute the multiplied  
       BSpline : the method used is interpolation at Schoenenberg  
       points of a(t)*F(t)") FunctionMultiply;
		static void FunctionMultiply (const BSplCLib_EvaluatorFunction & Function,const Standard_Integer BSplineDegree,const TColStd_Array1OfReal & BSplineFlatKnots,const TColgp_Array1OfPnt2d & Poles,const TColStd_Array1OfReal & FlatKnots,const Standard_Integer NewDegree,TColgp_Array1OfPnt2d & NewPoles,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	Function(BSplCLib_EvaluatorFunction)
	BSplineDegree(Standard_Integer)
	BSplineFlatKnots(TColStd_Array1OfReal)
	Poles(TColgp_Array1OfPnt)
	FlatKnots(TColStd_Array1OfReal)
	NewDegree(Standard_Integer)
	NewPoles(TColgp_Array1OfPnt)
	Status(Standard_Integer)

Returns:
	static void

this will  multiply a given Vectorial BSpline F(t)  
         defined  by its  BSplineDegree and BSplineFlatKnotsl,  
         its Poles  array which are coded as  an array of Real  
         of  the  form  [1..NumPoles][1..PolesDimension] by  a  
         function     a(t) which is   assumed to   satisfy the  
         following  : 1. a(t)  * F(t)  is a polynomial BSpline  
         that can be expressed  exactly as a BSpline of degree  
         NewDegree on the knots FlatKnots 2. the range of a(t)  
          is the same as the  range of F(t)  
 Warning: it is  
         the caller's responsability to insure that conditions  
         1. and  2. above are  satisfied : no check whatsoever  
         is made in this method  
Status will return 0 if OK else it will return the pivot index  
       of the matrix that was inverted to compute the multiplied  
       BSpline : the method used is interpolation at Schoenenberg  
       points of a(t)*F(t)") FunctionMultiply;
		static void FunctionMultiply (const BSplCLib_EvaluatorFunction & Function,const Standard_Integer BSplineDegree,const TColStd_Array1OfReal & BSplineFlatKnots,const TColgp_Array1OfPnt & Poles,const TColStd_Array1OfReal & FlatKnots,const Standard_Integer NewDegree,TColgp_Array1OfPnt & NewPoles,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	PeriodicFlag(Standard_Boolean)
	DerivativeRequest(Standard_Integer)
	ExtrapMode(Standard_Integer)
	Degree(Standard_Integer)
	FlatKnots(TColStd_Array1OfReal)
	ArrayDimension(Standard_Integer)
	Poles(Standard_Real)
	Result(Standard_Real)

Returns:
	static void

Perform the De Boor   algorithm  to  evaluate a point at  
         parameter <U>, with <Degree> and <Dimension>.  
 
         Poles is  an array of  Reals of size  
 
         <Dimension> *  <Degree>+1  
 
         Containing the  poles.  At  the end <Poles> contains  
         the current point.   Poles Contain all  the poles of  
         the BsplineCurve, Knots  also Contains all the knots  
         of the BsplineCurve.  ExtrapMode has two slots [0] =  
         Degree used to extrapolate before the first knot [1]  
         = Degre used to  extrapolate after the last knot has  
         to be between 1 and  Degree") Eval;
		static void Eval (const Standard_Real U,const Standard_Boolean PeriodicFlag,const Standard_Integer DerivativeRequest,Standard_Integer &OutValue,const Standard_Integer Degree,const TColStd_Array1OfReal & FlatKnots,const Standard_Integer ArrayDimension,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	PeriodicFlag(Standard_Boolean)
	DerivativeRequest(Standard_Integer)
	ExtrapMode(Standard_Integer)
	Degree(Standard_Integer)
	FlatKnots(TColStd_Array1OfReal)
	ArrayDimension(Standard_Integer)
	Poles(Standard_Real)
	Weights(Standard_Real)
	PolesResult(Standard_Real)
	WeightsResult(Standard_Real)

Returns:
	static void

Perform the  De Boor algorithm  to evaluate a point at  
         parameter   <U>,  with   <Degree>    and  <Dimension>.  
         Evaluates by multiplying the  Poles by the Weights and  
         gives  the homogeneous  result  in PolesResult that is  
         the results of the evaluation of the numerator once it  
         has     been  multiplied   by  the     weights and  in  
         WeightsResult one has  the result of the evaluation of  
         the denominator  
 
 Warning:   <PolesResult> and <WeightsResult>  must be   dimensionned  
         properly.") Eval;
		static void Eval (const Standard_Real U,const Standard_Boolean PeriodicFlag,const Standard_Integer DerivativeRequest,Standard_Integer &OutValue,const Standard_Integer Degree,const TColStd_Array1OfReal & FlatKnots,const Standard_Integer ArrayDimension,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	PeriodicFlag(Standard_Boolean)
	HomogeneousFlag(Standard_Boolean)
	ExtrapMode(Standard_Integer)
	Degree(Standard_Integer)
	FlatKnots(TColStd_Array1OfReal)
	Poles(TColgp_Array1OfPnt)
	Weights(TColStd_Array1OfReal)
	Point(gp_Pnt)
	Weight(Standard_Real)

Returns:
	static void

Perform the evaluation of the Bspline Basis  
         and then multiplies by the weights  
         this just evaluates the current point") Eval;
		static void Eval (const Standard_Real U,const Standard_Boolean PeriodicFlag,const Standard_Boolean HomogeneousFlag,Standard_Integer &OutValue,const Standard_Integer Degree,const TColStd_Array1OfReal & FlatKnots,const TColgp_Array1OfPnt & Poles,const TColStd_Array1OfReal & Weights,gp_Pnt & Point,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	PeriodicFlag(Standard_Boolean)
	HomogeneousFlag(Standard_Boolean)
	ExtrapMode(Standard_Integer)
	Degree(Standard_Integer)
	FlatKnots(TColStd_Array1OfReal)
	Poles(TColgp_Array1OfPnt2d)
	Weights(TColStd_Array1OfReal)
	Point(gp_Pnt2d)
	Weight(Standard_Real)

Returns:
	static void

Perform the evaluation of the Bspline Basis  
         and then multiplies by the weights  
         this just evaluates the current point") Eval;
		static void Eval (const Standard_Real U,const Standard_Boolean PeriodicFlag,const Standard_Boolean HomogeneousFlag,Standard_Integer &OutValue,const Standard_Integer Degree,const TColStd_Array1OfReal & FlatKnots,const TColgp_Array1OfPnt2d & Poles,const TColStd_Array1OfReal & Weights,gp_Pnt2d & Point,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	FlatKnots(TColStd_Array1OfReal)
	C1Coefficient(Standard_Real)
	NumPoles(Standard_Integer)
	Poles(Standard_Real)
	Dimension(Standard_Integer)
	Degree(Standard_Integer)
	ConstraintPoint(TColStd_Array1OfReal)
	Continuity(Standard_Integer)
	After(Standard_Boolean)
	NbPolesResult(Standard_Integer)
	NbKnotsRsult(Standard_Integer)
	KnotsResult(Standard_Real)
	PolesResult(Standard_Real)

Returns:
	static void

Extend a BSpline nD using the tangency map  
         <C1Coefficient> is the coefficient of reparametrisation  
         <Continuity> must be equal to 1, 2 or 3.  
         <Degree> must be greater or equal than <Continuity> + 1.  
 
 Warning:   <KnotsResult> and <PolesResult>  must be   dimensionned  
         properly.") TangExtendToConstraint;
		static void TangExtendToConstraint (const TColStd_Array1OfReal & FlatKnots,const Standard_Real C1Coefficient,const Standard_Integer NumPoles,Standard_Real &OutValue,const Standard_Integer Dimension,const Standard_Integer Degree,const TColStd_Array1OfReal & ConstraintPoint,const Standard_Integer Continuity,const Standard_Boolean After,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Degree(Standard_Integer)
	CacheParameter(Standard_Real)
	SpanLenght(Standard_Real)
	Poles(TColgp_Array1OfPnt)
	Weights(TColStd_Array1OfReal)
	Point(gp_Pnt)

Returns:
	static void

Perform the evaluation of the of the cache  
         the parameter must be normalized between  
         the 0 and 1 for the span.  
         The Cache must be valid when calling this  
         routine. Geom Package will insure that.  
         and then multiplies by the weights  
         this just evaluates the current point  
         the CacheParameter is where the Cache was  
         constructed the SpanLength is to normalize  
         the polynomial in the cache to avoid bad conditioning  
         effects") CacheD0;
		static void CacheD0 (const Standard_Real U,const Standard_Integer Degree,const Standard_Real CacheParameter,const Standard_Real SpanLenght,const TColgp_Array1OfPnt & Poles,const TColStd_Array1OfReal & Weights,gp_Pnt & Point);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Degree(Standard_Integer)
	CacheParameter(Standard_Real)
	SpanLenght(Standard_Real)
	Poles(TColgp_Array1OfPnt2d)
	Weights(TColStd_Array1OfReal)
	Point(gp_Pnt2d)

Returns:
	static void

Perform the evaluation of the Bspline Basis  
         and then multiplies by the weights  
         this just evaluates the current point  
         the parameter must be normalized between  
         the 0 and 1 for the span.  
         The Cache must be valid when calling this  
         routine. Geom Package will insure that.  
         and then multiplies by the weights  
         ththe CacheParameter is where the Cache was  
         constructed the SpanLength is to normalize  
         the polynomial in the cache to avoid bad conditioning  
         effectsis just evaluates the current point") CacheD0;
		static void CacheD0 (const Standard_Real U,const Standard_Integer Degree,const Standard_Real CacheParameter,const Standard_Real SpanLenght,const TColgp_Array1OfPnt2d & Poles,const TColStd_Array1OfReal & Weights,gp_Pnt2d & Point);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Poles(TColgp_Array1OfPnt)
	Weights(TColStd_Array1OfReal)
	Point(gp_Pnt)

Returns:
	static void

Calls CacheD0 for Bezier  Curves Arrays computed with  
         the method PolesCoefficients.  
 Warning: To be used for Beziercurves ONLY!!!") CoefsD0;
		static void CoefsD0 (const Standard_Real U,const TColgp_Array1OfPnt & Poles,const TColStd_Array1OfReal & Weights,gp_Pnt & Point);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Poles(TColgp_Array1OfPnt2d)
	Weights(TColStd_Array1OfReal)
	Point(gp_Pnt2d)

Returns:
	static void

Calls CacheD0 for Bezier  Curves Arrays computed with  
         the method PolesCoefficients.  
 Warning: To be used for Beziercurves ONLY!!!") CoefsD0;
		static void CoefsD0 (const Standard_Real U,const TColgp_Array1OfPnt2d & Poles,const TColStd_Array1OfReal & Weights,gp_Pnt2d & Point);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Degree(Standard_Integer)
	CacheParameter(Standard_Real)
	SpanLenght(Standard_Real)
	Poles(TColgp_Array1OfPnt)
	Weights(TColStd_Array1OfReal)
	Point(gp_Pnt)
	Vec(gp_Vec)

Returns:
	static void

Perform the evaluation of the of the cache  
         the parameter must be normalized between  
         the 0 and 1 for the span.  
         The Cache must be valid when calling this  
         routine. Geom Package will insure that.  
         and then multiplies by the weights  
         this just evaluates the current point  
         the CacheParameter is where the Cache was  
         constructed the SpanLength is to normalize  
         the polynomial in the cache to avoid bad conditioning  
         effects") CacheD1;
		static void CacheD1 (const Standard_Real U,const Standard_Integer Degree,const Standard_Real CacheParameter,const Standard_Real SpanLenght,const TColgp_Array1OfPnt & Poles,const TColStd_Array1OfReal & Weights,gp_Pnt & Point,gp_Vec & Vec);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Degree(Standard_Integer)
	CacheParameter(Standard_Real)
	SpanLenght(Standard_Real)
	Poles(TColgp_Array1OfPnt2d)
	Weights(TColStd_Array1OfReal)
	Point(gp_Pnt2d)
	Vec(gp_Vec2d)

Returns:
	static void

Perform the evaluation of the Bspline Basis  
         and then multiplies by the weights  
         this just evaluates the current point  
         the parameter must be normalized between  
         the 0 and 1 for the span.  
         The Cache must be valid when calling this  
         routine. Geom Package will insure that.  
         and then multiplies by the weights  
         ththe CacheParameter is where the Cache was  
         constructed the SpanLength is to normalize  
         the polynomial in the cache to avoid bad conditioning  
         effectsis just evaluates the current point") CacheD1;
		static void CacheD1 (const Standard_Real U,const Standard_Integer Degree,const Standard_Real CacheParameter,const Standard_Real SpanLenght,const TColgp_Array1OfPnt2d & Poles,const TColStd_Array1OfReal & Weights,gp_Pnt2d & Point,gp_Vec2d & Vec);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Poles(TColgp_Array1OfPnt)
	Weights(TColStd_Array1OfReal)
	Point(gp_Pnt)
	Vec(gp_Vec)

Returns:
	static void

Calls CacheD1 for Bezier  Curves Arrays computed with  
         the method PolesCoefficients.  
 Warning: To be used for Beziercurves ONLY!!!") CoefsD1;
		static void CoefsD1 (const Standard_Real U,const TColgp_Array1OfPnt & Poles,const TColStd_Array1OfReal & Weights,gp_Pnt & Point,gp_Vec & Vec);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Poles(TColgp_Array1OfPnt2d)
	Weights(TColStd_Array1OfReal)
	Point(gp_Pnt2d)
	Vec(gp_Vec2d)

Returns:
	static void

Calls CacheD1 for Bezier  Curves Arrays computed with  
         the method PolesCoefficients.  
 Warning: To be used for Beziercurves ONLY!!!") CoefsD1;
		static void CoefsD1 (const Standard_Real U,const TColgp_Array1OfPnt2d & Poles,const TColStd_Array1OfReal & Weights,gp_Pnt2d & Point,gp_Vec2d & Vec);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Degree(Standard_Integer)
	CacheParameter(Standard_Real)
	SpanLenght(Standard_Real)
	Poles(TColgp_Array1OfPnt)
	Weights(TColStd_Array1OfReal)
	Point(gp_Pnt)
	Vec1(gp_Vec)
	Vec2(gp_Vec)

Returns:
	static void

Perform the evaluation of the of the cache  
         the parameter must be normalized between  
         the 0 and 1 for the span.  
         The Cache must be valid when calling this  
         routine. Geom Package will insure that.  
         and then multiplies by the weights  
         this just evaluates the current point  
         the CacheParameter is where the Cache was  
         constructed the SpanLength is to normalize  
         the polynomial in the cache to avoid bad conditioning  
         effects") CacheD2;
		static void CacheD2 (const Standard_Real U,const Standard_Integer Degree,const Standard_Real CacheParameter,const Standard_Real SpanLenght,const TColgp_Array1OfPnt & Poles,const TColStd_Array1OfReal & Weights,gp_Pnt & Point,gp_Vec & Vec1,gp_Vec & Vec2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Degree(Standard_Integer)
	CacheParameter(Standard_Real)
	SpanLenght(Standard_Real)
	Poles(TColgp_Array1OfPnt2d)
	Weights(TColStd_Array1OfReal)
	Point(gp_Pnt2d)
	Vec1(gp_Vec2d)
	Vec2(gp_Vec2d)

Returns:
	static void

Perform the evaluation of the Bspline Basis  
         and then multiplies by the weights  
         this just evaluates the current point  
         the parameter must be normalized between  
         the 0 and 1 for the span.  
         The Cache must be valid when calling this  
         routine. Geom Package will insure that.  
         and then multiplies by the weights  
         ththe CacheParameter is where the Cache was  
         constructed the SpanLength is to normalize  
         the polynomial in the cache to avoid bad conditioning  
         effectsis just evaluates the current point") CacheD2;
		static void CacheD2 (const Standard_Real U,const Standard_Integer Degree,const Standard_Real CacheParameter,const Standard_Real SpanLenght,const TColgp_Array1OfPnt2d & Poles,const TColStd_Array1OfReal & Weights,gp_Pnt2d & Point,gp_Vec2d & Vec1,gp_Vec2d & Vec2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Poles(TColgp_Array1OfPnt)
	Weights(TColStd_Array1OfReal)
	Point(gp_Pnt)
	Vec1(gp_Vec)
	Vec2(gp_Vec)

Returns:
	static void

Calls CacheD1 for Bezier  Curves Arrays computed with  
         the method PolesCoefficients.  
 Warning: To be used for Beziercurves ONLY!!!") CoefsD2;
		static void CoefsD2 (const Standard_Real U,const TColgp_Array1OfPnt & Poles,const TColStd_Array1OfReal & Weights,gp_Pnt & Point,gp_Vec & Vec1,gp_Vec & Vec2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Poles(TColgp_Array1OfPnt2d)
	Weights(TColStd_Array1OfReal)
	Point(gp_Pnt2d)
	Vec1(gp_Vec2d)
	Vec2(gp_Vec2d)

Returns:
	static void

Calls CacheD1 for Bezier  Curves Arrays computed with  
         the method PolesCoefficients.  
 Warning: To be used for Beziercurves ONLY!!!") CoefsD2;
		static void CoefsD2 (const Standard_Real U,const TColgp_Array1OfPnt2d & Poles,const TColStd_Array1OfReal & Weights,gp_Pnt2d & Point,gp_Vec2d & Vec1,gp_Vec2d & Vec2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Degree(Standard_Integer)
	CacheParameter(Standard_Real)
	SpanLenght(Standard_Real)
	Poles(TColgp_Array1OfPnt)
	Weights(TColStd_Array1OfReal)
	Point(gp_Pnt)
	Vec1(gp_Vec)
	Vec2(gp_Vec)
	Vec3(gp_Vec)

Returns:
	static void

Perform the evaluation of the of the cache  
         the parameter must be normalized between  
         the 0 and 1 for the span.  
         The Cache must be valid when calling this  
         routine. Geom Package will insure that.  
         and then multiplies by the weights  
         this just evaluates the current point  
         the CacheParameter is where the Cache was  
         constructed the SpanLength is to normalize  
         the polynomial in the cache to avoid bad conditioning  
         effects") CacheD3;
		static void CacheD3 (const Standard_Real U,const Standard_Integer Degree,const Standard_Real CacheParameter,const Standard_Real SpanLenght,const TColgp_Array1OfPnt & Poles,const TColStd_Array1OfReal & Weights,gp_Pnt & Point,gp_Vec & Vec1,gp_Vec & Vec2,gp_Vec & Vec3);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Degree(Standard_Integer)
	CacheParameter(Standard_Real)
	SpanLenght(Standard_Real)
	Poles(TColgp_Array1OfPnt2d)
	Weights(TColStd_Array1OfReal)
	Point(gp_Pnt2d)
	Vec1(gp_Vec2d)
	Vec2(gp_Vec2d)
	Vec3(gp_Vec2d)

Returns:
	static void

Perform the evaluation of the Bspline Basis  
         and then multiplies by the weights  
         this just evaluates the current point  
         the parameter must be normalized between  
         the 0 and 1 for the span.  
         The Cache must be valid when calling this  
         routine. Geom Package will insure that.  
         and then multiplies by the weights  
         ththe CacheParameter is where the Cache was  
         constructed the SpanLength is to normalize  
         the polynomial in the cache to avoid bad conditioning  
         effectsis just evaluates the current point") CacheD3;
		static void CacheD3 (const Standard_Real U,const Standard_Integer Degree,const Standard_Real CacheParameter,const Standard_Real SpanLenght,const TColgp_Array1OfPnt2d & Poles,const TColStd_Array1OfReal & Weights,gp_Pnt2d & Point,gp_Vec2d & Vec1,gp_Vec2d & Vec2,gp_Vec2d & Vec3);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Poles(TColgp_Array1OfPnt)
	Weights(TColStd_Array1OfReal)
	Point(gp_Pnt)
	Vec1(gp_Vec)
	Vec2(gp_Vec)
	Vec3(gp_Vec)

Returns:
	static void

Calls CacheD1 for Bezier  Curves Arrays computed with  
         the method PolesCoefficients.  
 Warning: To be used for Beziercurves ONLY!!!") CoefsD3;
		static void CoefsD3 (const Standard_Real U,const TColgp_Array1OfPnt & Poles,const TColStd_Array1OfReal & Weights,gp_Pnt & Point,gp_Vec & Vec1,gp_Vec & Vec2,gp_Vec & Vec3);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Poles(TColgp_Array1OfPnt2d)
	Weights(TColStd_Array1OfReal)
	Point(gp_Pnt2d)
	Vec1(gp_Vec2d)
	Vec2(gp_Vec2d)
	Vec3(gp_Vec2d)

Returns:
	static void

Calls CacheD1 for Bezier  Curves Arrays computed with  
         the method PolesCoefficients.  
 Warning: To be used for Beziercurves ONLY!!!") CoefsD3;
		static void CoefsD3 (const Standard_Real U,const TColgp_Array1OfPnt2d & Poles,const TColStd_Array1OfReal & Weights,gp_Pnt2d & Point,gp_Vec2d & Vec1,gp_Vec2d & Vec2,gp_Vec2d & Vec3);
		%feature("autodoc", "Args:
	U(Standard_Real)
	InverseOfSpanDomain(Standard_Real)
	PeriodicFlag(Standard_Boolean)
	Degree(Standard_Integer)
	FlatKnots(TColStd_Array1OfReal)
	Poles(TColgp_Array1OfPnt)
	Weights(TColStd_Array1OfReal)
	CachePoles(TColgp_Array1OfPnt)
	CacheWeights(TColStd_Array1OfReal)

Returns:
	static void

Perform the evaluation of the Taylor expansion  
         of the Bspline normalized between 0 and 1.  
         If rational computes the homogeneous Taylor expension  
         for the numerator and stores it in CachePoles") BuildCache;
		static void BuildCache (const Standard_Real U,const Standard_Real InverseOfSpanDomain,const Standard_Boolean PeriodicFlag,const Standard_Integer Degree,const TColStd_Array1OfReal & FlatKnots,const TColgp_Array1OfPnt & Poles,const TColStd_Array1OfReal & Weights,TColgp_Array1OfPnt & CachePoles,TColStd_Array1OfReal & CacheWeights);
		%feature("autodoc", "Args:
	U(Standard_Real)
	InverseOfSpanDomain(Standard_Real)
	PeriodicFlag(Standard_Boolean)
	Degree(Standard_Integer)
	FlatKnots(TColStd_Array1OfReal)
	Poles(TColgp_Array1OfPnt2d)
	Weights(TColStd_Array1OfReal)
	CachePoles(TColgp_Array1OfPnt2d)
	CacheWeights(TColStd_Array1OfReal)

Returns:
	static void

Perform the evaluation of the Taylor expansion  
         of the Bspline normalized between 0 and 1.  
         If rational computes the homogeneous Taylor expension  
         for the numerator and stores it in CachePoles") BuildCache;
		static void BuildCache (const Standard_Real U,const Standard_Real InverseOfSpanDomain,const Standard_Boolean PeriodicFlag,const Standard_Integer Degree,const TColStd_Array1OfReal & FlatKnots,const TColgp_Array1OfPnt2d & Poles,const TColStd_Array1OfReal & Weights,TColgp_Array1OfPnt2d & CachePoles,TColStd_Array1OfReal & CacheWeights);
		%feature("autodoc", "Args:
	Poles(TColgp_Array1OfPnt2d)
	CachePoles(TColgp_Array1OfPnt2d)

Returns:
	static void

No detailed docstring for this function.") PolesCoefficients;
		static void PolesCoefficients (const TColgp_Array1OfPnt2d & Poles,TColgp_Array1OfPnt2d & CachePoles);
		%feature("autodoc", "Args:
	Poles(TColgp_Array1OfPnt2d)
	Weights(TColStd_Array1OfReal)
	CachePoles(TColgp_Array1OfPnt2d)
	CacheWeights(TColStd_Array1OfReal)

Returns:
	static void

No detailed docstring for this function.") PolesCoefficients;
		static void PolesCoefficients (const TColgp_Array1OfPnt2d & Poles,const TColStd_Array1OfReal & Weights,TColgp_Array1OfPnt2d & CachePoles,TColStd_Array1OfReal & CacheWeights);
		%feature("autodoc", "Args:
	Poles(TColgp_Array1OfPnt)
	CachePoles(TColgp_Array1OfPnt)

Returns:
	static void

No detailed docstring for this function.") PolesCoefficients;
		static void PolesCoefficients (const TColgp_Array1OfPnt & Poles,TColgp_Array1OfPnt & CachePoles);
		%feature("autodoc", "Args:
	Poles(TColgp_Array1OfPnt)
	Weights(TColStd_Array1OfReal)
	CachePoles(TColgp_Array1OfPnt)
	CacheWeights(TColStd_Array1OfReal)

Returns:
	static void

Encapsulation   of  BuildCache    to   perform   the  
         evaluation  of the Taylor expansion for beziercurves  
         at parameter 0.  
 Warning: To be used for Beziercurves ONLY!!!") PolesCoefficients;
		static void PolesCoefficients (const TColgp_Array1OfPnt & Poles,const TColStd_Array1OfReal & Weights,TColgp_Array1OfPnt & CachePoles,TColStd_Array1OfReal & CacheWeights);
		%feature("autodoc", "Args:
	Degree(Standard_Integer)

Returns:
	static  Standard_Real

Returns pointer to statically allocated array representing  
         flat knots for bezier curve of the specified degree.  
         Raises OutOfRange if Degree > MaxDegree()") FlatBezierKnots;
		static const Standard_Real & FlatBezierKnots (const Standard_Integer Degree);
		%feature("autodoc", "Args:
	Degree(Standard_Integer)
	FlatKnots(TColStd_Array1OfReal)
	Parameters(TColStd_Array1OfReal)

Returns:
	static void

builds the Schoenberg points from the flat knot  
         used to interpolate a BSpline since the  
         BSpline matrix is invertible.") BuildSchoenbergPoints;
		static void BuildSchoenbergPoints (const Standard_Integer Degree,const TColStd_Array1OfReal & FlatKnots,TColStd_Array1OfReal & Parameters);
		%feature("autodoc", "Args:
	Degree(Standard_Integer)
	FlatKnots(TColStd_Array1OfReal)
	Parameters(TColStd_Array1OfReal)
	ContactOrderArray(TColStd_Array1OfInteger)
	Poles(TColgp_Array1OfPnt)
	InversionProblem(Standard_Integer)

Returns:
	static void

Performs the interpolation of  the data given in  
         the Poles  array  according  to the  requests in  
         ContactOrderArray    that is      :           if  
         ContactOrderArray(i) has value  d it means  that  
         Poles(i)   containes the dth  derivative of  the  
         function to be interpolated. The length L of the  
         following arrays must be the same :  
         Parameters, ContactOrderArray, Poles,  
         The length of FlatKnots is Degree + L + 1  
 Warning:  
         the method used to do that interpolation is  
         gauss elimination WITHOUT pivoting. Thus if the  
         diagonal is not dominant there is no guarantee  
         that the algorithm will work. Nevertheless for  
         Cubic interpolation or interpolation at Scheonberg  
         points the method will work  
         The InversionProblem will report 0 if there was no  
         problem else it will give the index of the faulty  
         pivot") Interpolate;
		static void Interpolate (const Standard_Integer Degree,const TColStd_Array1OfReal & FlatKnots,const TColStd_Array1OfReal & Parameters,const TColStd_Array1OfInteger & ContactOrderArray,TColgp_Array1OfPnt & Poles,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	Degree(Standard_Integer)
	FlatKnots(TColStd_Array1OfReal)
	Parameters(TColStd_Array1OfReal)
	ContactOrderArray(TColStd_Array1OfInteger)
	Poles(TColgp_Array1OfPnt2d)
	InversionProblem(Standard_Integer)

Returns:
	static void

Performs the interpolation of  the data given in  
         the Poles  array  according  to the  requests in  
         ContactOrderArray    that is      :           if  
         ContactOrderArray(i) has value  d it means  that  
         Poles(i)   containes the dth  derivative of  the  
         function to be interpolated. The length L of the  
         following arrays must be the same :  
         Parameters, ContactOrderArray, Poles,  
         The length of FlatKnots is Degree + L + 1  
 Warning:  
         the method used to do that interpolation is  
         gauss elimination WITHOUT pivoting. Thus if the  
         diagonal is not dominant there is no guarantee  
         that the algorithm will work. Nevertheless for  
         Cubic interpolation at knots or interpolation at Scheonberg  
         points the method will work.  
         The InversionProblem w  
         ll report 0 if there was no  
         problem else it will give the index of the faulty  
         pivot") Interpolate;
		static void Interpolate (const Standard_Integer Degree,const TColStd_Array1OfReal & FlatKnots,const TColStd_Array1OfReal & Parameters,const TColStd_Array1OfInteger & ContactOrderArray,TColgp_Array1OfPnt2d & Poles,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	Degree(Standard_Integer)
	FlatKnots(TColStd_Array1OfReal)
	Parameters(TColStd_Array1OfReal)
	ContactOrderArray(TColStd_Array1OfInteger)
	Poles(TColgp_Array1OfPnt)
	Weights(TColStd_Array1OfReal)
	InversionProblem(Standard_Integer)

Returns:
	static void

Performs the interpolation of  the data given in  
         the Poles  array  according  to the  requests in  
         ContactOrderArray    that is      :           if  
         ContactOrderArray(i) has value  d it means  that  
         Poles(i)   containes the dth  derivative of  the  
         function to be interpolated. The length L of the  
         following arrays must be the same :  
         Parameters, ContactOrderArray, Poles,  
         The length of FlatKnots is Degree + L + 1  
 Warning:  
         the method used to do that interpolation is  
         gauss elimination WITHOUT pivoting. Thus if the  
         diagonal is not dominant there is no guarantee  
         that the algorithm will work. Nevertheless for  
         Cubic interpolation at knots or interpolation at Scheonberg  
         points the method will work.  
         The InversionProblem will report 0 if there was no  
         problem else it will give the index of the faulty  
         pivot") Interpolate;
		static void Interpolate (const Standard_Integer Degree,const TColStd_Array1OfReal & FlatKnots,const TColStd_Array1OfReal & Parameters,const TColStd_Array1OfInteger & ContactOrderArray,TColgp_Array1OfPnt & Poles,TColStd_Array1OfReal & Weights,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	Degree(Standard_Integer)
	FlatKnots(TColStd_Array1OfReal)
	Parameters(TColStd_Array1OfReal)
	ContactOrderArray(TColStd_Array1OfInteger)
	Poles(TColgp_Array1OfPnt2d)
	Weights(TColStd_Array1OfReal)
	InversionProblem(Standard_Integer)

Returns:
	static void

Performs the interpolation of  the data given in  
         the Poles  array  according  to the  requests in  
         ContactOrderArray    that is      :           if  
         ContactOrderArray(i) has value  d it means  that  
         Poles(i)   containes the dth  derivative of  the  
         function to be interpolated. The length L of the  
         following arrays must be the same :  
         Parameters, ContactOrderArray, Poles,  
         The length of FlatKnots is Degree + L + 1  
 Warning:  
         the method used to do that interpolation is  
         gauss elimination WITHOUT pivoting. Thus if the  
         diagonal is not dominant there is no guarantee  
         that the algorithm will work. Nevertheless for  
         Cubic interpolation at knots or interpolation at Scheonberg  
         points the method will work.  
         The InversionProblem w  
         ll report 0 if there was no  
         problem else it will give the i") Interpolate;
		static void Interpolate (const Standard_Integer Degree,const TColStd_Array1OfReal & FlatKnots,const TColStd_Array1OfReal & Parameters,const TColStd_Array1OfInteger & ContactOrderArray,TColgp_Array1OfPnt2d & Poles,TColStd_Array1OfReal & Weights,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	Degree(Standard_Integer)
	FlatKnots(TColStd_Array1OfReal)
	Parameters(TColStd_Array1OfReal)
	ContactOrderArray(TColStd_Array1OfInteger)
	ArrayDimension(Standard_Integer)
	Poles(Standard_Real)
	InversionProblem(Standard_Integer)

Returns:
	static void

Performs the interpolation of  the data given in  
         the Poles  array  according  to the  requests in  
         ContactOrderArray    that is      :           if  
         ContactOrderArray(i) has value  d it means  that  
         Poles(i)   containes the dth  derivative of  the  
         function to be interpolated. The length L of the  
         following arrays must be the same :  
         Parameters, ContactOrderArray  
         The length of FlatKnots is Degree + L + 1  
         The  PolesArray   is    an   seen   as    an  
         Array[1..N][1..ArrayDimension] with N = tge length  
         of the parameters array  
 Warning:  
         the method used to do that interpolation is  
         gauss elimination WITHOUT pivoting. Thus if the  
         diagonal is not dominant there is no guarantee  
         that the algorithm will work. Nevertheless for  
         Cubic interpolation or interpolation at Scheonberg  
         points the method will work  
         The InversionProblem will report 0 if there was no  
         problem else it will give the index of the faulty  
         pivot") Interpolate;
		static void Interpolate (const Standard_Integer Degree,const TColStd_Array1OfReal & FlatKnots,const TColStd_Array1OfReal & Parameters,const TColStd_Array1OfInteger & ContactOrderArray,const Standard_Integer ArrayDimension,Standard_Real &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	Degree(Standard_Integer)
	FlatKnots(TColStd_Array1OfReal)
	Parameters(TColStd_Array1OfReal)
	ContactOrderArray(TColStd_Array1OfInteger)
	ArrayDimension(Standard_Integer)
	Poles(Standard_Real)
	Weights(Standard_Real)
	InversionProblem(Standard_Integer)

Returns:
	static void

No detailed docstring for this function.") Interpolate;
		static void Interpolate (const Standard_Integer Degree,const TColStd_Array1OfReal & FlatKnots,const TColStd_Array1OfReal & Parameters,const TColStd_Array1OfInteger & ContactOrderArray,const Standard_Integer ArrayDimension,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Displ(gp_Vec2d)
	Index1(Standard_Integer)
	Index2(Standard_Integer)
	Degree(Standard_Integer)
	Rational(Standard_Boolean)
	Poles(TColgp_Array1OfPnt2d)
	Weights(TColStd_Array1OfReal)
	FlatKnots(TColStd_Array1OfReal)
	FirstIndex(Standard_Integer)
	LastIndex(Standard_Integer)
	NewPoles(TColgp_Array1OfPnt2d)

Returns:
	static void

Find the new poles which allows  an old point (with a  
         given  u as parameter) to reach a new position  
         Index1 and Index2 indicate the range of poles we can move  
         (1, NbPoles-1) or (2, NbPoles) -> no constraint for one side  
                    don't enter (1,NbPoles) -> error: rigid move  
         (2, NbPoles-1) -> the ends are enforced  
         (3, NbPoles-2) -> the ends and the tangency are enforced  
   if Problem in BSplineBasis calculation, no change for the curve  
   and FirstIndex, LastIndex = 0") MovePoint;
		static void MovePoint (const Standard_Real U,const gp_Vec2d & Displ,const Standard_Integer Index1,const Standard_Integer Index2,const Standard_Integer Degree,const Standard_Boolean Rational,const TColgp_Array1OfPnt2d & Poles,const TColStd_Array1OfReal & Weights,const TColStd_Array1OfReal & FlatKnots,Standard_Integer &OutValue,Standard_Integer &OutValue,TColgp_Array1OfPnt2d & NewPoles);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Displ(gp_Vec)
	Index1(Standard_Integer)
	Index2(Standard_Integer)
	Degree(Standard_Integer)
	Rational(Standard_Boolean)
	Poles(TColgp_Array1OfPnt)
	Weights(TColStd_Array1OfReal)
	FlatKnots(TColStd_Array1OfReal)
	FirstIndex(Standard_Integer)
	LastIndex(Standard_Integer)
	NewPoles(TColgp_Array1OfPnt)

Returns:
	static void

Find the new poles which allows  an old point (with a  
         given  u as parameter) to reach a new position  
         Index1 and Index2 indicate the range of poles we can move  
         (1, NbPoles-1) or (2, NbPoles) -> no constraint for one side  
                    don't enter (1,NbPoles) -> error: rigid move  
         (2, NbPoles-1) -> the ends are enforced  
         (3, NbPoles-2) -> the ends and the tangency are enforced  
   if Problem in BSplineBasis calculation, no change for the curve  
   and FirstIndex, LastIndex = 0") MovePoint;
		static void MovePoint (const Standard_Real U,const gp_Vec & Displ,const Standard_Integer Index1,const Standard_Integer Index2,const Standard_Integer Degree,const Standard_Boolean Rational,const TColgp_Array1OfPnt & Poles,const TColStd_Array1OfReal & Weights,const TColStd_Array1OfReal & FlatKnots,Standard_Integer &OutValue,Standard_Integer &OutValue,TColgp_Array1OfPnt & NewPoles);
		%feature("autodoc", "Args:
	U(Standard_Real)
	ArrayDimension(Standard_Integer)
	Delta(Standard_Real)
	DeltaDerivative(Standard_Real)
	Tolerance(Standard_Real)
	Degree(Standard_Integer)
	Rational(Standard_Boolean)
	StartingCondition(Standard_Integer)
	EndingCondition(Standard_Integer)
	Poles(Standard_Real)
	Weights(TColStd_Array1OfReal)
	FlatKnots(TColStd_Array1OfReal)
	NewPoles(Standard_Real)
	ErrorStatus(Standard_Integer)

Returns:
	static void

This is the dimension free version of the utility  
U is the parameter  must be within the  first FlatKnots and the  
last FlatKnots  Delta is the amount the  curve has  to be moved  
DeltaDerivative is the  amount the derivative  has to be moved.  
Delta  and   DeltaDerivative   must be    array   of  dimension  
ArrayDimension  Degree  is the degree  of   the BSpline and the  
FlatKnots are the knots of the BSpline  Starting Condition if =  
-1 means the starting point of the curve can move  
= 0 means the  
starting  point  of the cuve  cannot  move but  tangen  starting  
point of the curve cannot move  
= 1 means the starting point and tangents cannot move  
= 2 means the starting point tangent and curvature cannot move  
= ...  
Same holds for EndingCondition  
Poles are the poles of the curve  
Weights are the weights of the curve if Rational = Standard_True  
NewPoles are the poles of the deformed curve  
ErrorStatus will be 0 if no error happened  
                    1 if there are not enough knots/poles  
                         the imposed conditions  
The way to solve this problem is to add knots to the BSpline  
If StartCondition = 1 and EndCondition = 1 then you need at least  
4 + 2 = 6 poles so for example to have a C1 cubic you will need  
have at least 2 internal knots.") MovePointAndTangent;
		static void MovePointAndTangent (const Standard_Real U,const Standard_Integer ArrayDimension,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Real Tolerance,const Standard_Integer Degree,const Standard_Boolean Rational,const Standard_Integer StartingCondition,const Standard_Integer EndingCondition,Standard_Real &OutValue,const TColStd_Array1OfReal & Weights,const TColStd_Array1OfReal & FlatKnots,Standard_Real &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Delta(gp_Vec)
	DeltaDerivative(gp_Vec)
	Tolerance(Standard_Real)
	Degree(Standard_Integer)
	Rational(Standard_Boolean)
	StartingCondition(Standard_Integer)
	EndingCondition(Standard_Integer)
	Poles(TColgp_Array1OfPnt)
	Weights(TColStd_Array1OfReal)
	FlatKnots(TColStd_Array1OfReal)
	NewPoles(TColgp_Array1OfPnt)
	ErrorStatus(Standard_Integer)

Returns:
	static void

This is the dimension free version of the utility  
U is the parameter  must be within the  first FlatKnots and the  
last FlatKnots  Delta is the amount the  curve has  to be moved  
DeltaDerivative is the  amount the derivative  has to be moved.  
Delta  and   DeltaDerivative   must be    array   of  dimension  
ArrayDimension  Degree  is the degree  of   the BSpline and the  
FlatKnots are the knots of the BSpline  Starting Condition if =  
-1 means the starting point of the curve can move  
= 0 means the  
starting  point  of the cuve  cannot  move but  tangen  starting  
point of the curve cannot move  
= 1 means the starting point and tangents cannot move  
= 2 means the starting point tangent and curvature cannot move  
= ...  
Same holds for EndingCondition  
Poles are the poles of the curve  
Weights are the weights of the curve if Rational = Standard_True  
NewPoles are the poles of the deformed curve  
ErrorStatus will be 0 if no error happened  
                    1 if there are not enough knots/poles  
                         the imposed conditions  
The way to solve this problem is to add knots to the BSpline  
If StartCondition = 1 and EndCondition = 1 then you need at least  
4 + 2 = 6 poles so for example to have a C1 cubic you will need  
have at least 2 internal knots.") MovePointAndTangent;
		static void MovePointAndTangent (const Standard_Real U,const gp_Vec & Delta,const gp_Vec & DeltaDerivative,const Standard_Real Tolerance,const Standard_Integer Degree,const Standard_Boolean Rational,const Standard_Integer StartingCondition,const Standard_Integer EndingCondition,const TColgp_Array1OfPnt & Poles,const TColStd_Array1OfReal & Weights,const TColStd_Array1OfReal & FlatKnots,TColgp_Array1OfPnt & NewPoles,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Delta(gp_Vec2d)
	DeltaDerivative(gp_Vec2d)
	Tolerance(Standard_Real)
	Degree(Standard_Integer)
	Rational(Standard_Boolean)
	StartingCondition(Standard_Integer)
	EndingCondition(Standard_Integer)
	Poles(TColgp_Array1OfPnt2d)
	Weights(TColStd_Array1OfReal)
	FlatKnots(TColStd_Array1OfReal)
	NewPoles(TColgp_Array1OfPnt2d)
	ErrorStatus(Standard_Integer)

Returns:
	static void

This is the dimension free version of the utility  
U is the parameter  must be within the  first FlatKnots and the  
last FlatKnots  Delta is the amount the  curve has  to be moved  
DeltaDerivative is the  amount the derivative  has to be moved.  
Delta  and   DeltaDerivative   must be    array   of  dimension  
ArrayDimension  Degree  is the degree  of   the BSpline and the  
FlatKnots are the knots of the BSpline  Starting Condition if =  
-1 means the starting point of the curve can move  
= 0 means the  
starting  point  of the cuve  cannot  move but  tangen  starting  
point of the curve cannot move  
= 1 means the starting point and tangents cannot move  
= 2 means the starting point tangent and curvature cannot move  
= ...  
Same holds for EndingCondition  
Poles are the poles of the curve  
Weights are the weights of the curve if Rational = Standard_True  
NewPoles are the poles of the deformed curve  
ErrorStatus will be 0 if no error happened  
                    1 if there are not enough knots/poles  
                         the imposed conditions  
The way to solve this problem is to add knots to the BSpline  
If StartCondition = 1 and EndCondition = 1 then you need at least  
4 + 2 = 6 poles so for example to have a C1 cubic you will need  
have at least 2 internal knots.") MovePointAndTangent;
		static void MovePointAndTangent (const Standard_Real U,const gp_Vec2d & Delta,const gp_Vec2d & DeltaDerivative,const Standard_Real Tolerance,const Standard_Integer Degree,const Standard_Boolean Rational,const Standard_Integer StartingCondition,const Standard_Integer EndingCondition,const TColgp_Array1OfPnt2d & Poles,const TColStd_Array1OfReal & Weights,const TColStd_Array1OfReal & FlatKnots,TColgp_Array1OfPnt2d & NewPoles,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	PolesArray(Standard_Real)
	ArrayDimension(Standard_Integer)
	NumPoles(Standard_Integer)
	Weights(TColStd_Array1OfReal)
	FlatKnots(TColStd_Array1OfReal)
	Degree(Standard_Integer)
	Tolerance3D(Standard_Real)
	UTolerance(Standard_Real)

Returns:
	static void

given a tolerance in 3D space returns a  
         tolerance    in U parameter space such that  
         all u1 and u0 in the domain of the curve f(u)  
         | u1 - u0 | < UTolerance and  
         we have |f (u1) - f (u0)| < Tolerance3D") Resolution;
		static void Resolution (Standard_Real &OutValue,const Standard_Integer ArrayDimension,const Standard_Integer NumPoles,const TColStd_Array1OfReal & Weights,const TColStd_Array1OfReal & FlatKnots,const Standard_Integer Degree,const Standard_Real Tolerance3D,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Poles(TColgp_Array1OfPnt)
	Weights(TColStd_Array1OfReal)
	NumPoles(Standard_Integer)
	FlatKnots(TColStd_Array1OfReal)
	Degree(Standard_Integer)
	Tolerance3D(Standard_Real)
	UTolerance(Standard_Real)

Returns:
	static void

given a tolerance in 3D space returns a  
         tolerance    in U parameter space such that  
         all u1 and u0 in the domain of the curve f(u)  
         | u1 - u0 | < UTolerance and  
         we have |f (u1) - f (u0)| < Tolerance3D") Resolution;
		static void Resolution (const TColgp_Array1OfPnt & Poles,const TColStd_Array1OfReal & Weights,const Standard_Integer NumPoles,const TColStd_Array1OfReal & FlatKnots,const Standard_Integer Degree,const Standard_Real Tolerance3D,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Poles(TColgp_Array1OfPnt2d)
	Weights(TColStd_Array1OfReal)
	NumPoles(Standard_Integer)
	FlatKnots(TColStd_Array1OfReal)
	Degree(Standard_Integer)
	Tolerance3D(Standard_Real)
	UTolerance(Standard_Real)

Returns:
	static void

given a tolerance in 3D space returns a  
         tolerance    in U parameter space such that  
         all u1 and u0 in the domain of the curve f(u)  
         | u1 - u0 | < UTolerance and  
         we have |f (u1) - f (u0)| < Tolerance3D") Resolution;
		static void Resolution (const TColgp_Array1OfPnt2d & Poles,const TColStd_Array1OfReal & Weights,const Standard_Integer NumPoles,const TColStd_Array1OfReal & FlatKnots,const Standard_Integer Degree,const Standard_Real Tolerance3D,Standard_Real &OutValue);
};


%feature("shadow") BSplCLib::~BSplCLib %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BSplCLib {
	void _kill_pointed() {
		delete $self;
	}
};
