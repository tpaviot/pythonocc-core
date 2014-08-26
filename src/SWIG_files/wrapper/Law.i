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
%module Law

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

%include Law_required_python_modules.i
%include Law_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(law) Law;
%nodefaultctor Law;
class Law {
	public:
		%feature("autodoc", "Args:
	Lin(Handle_Law_Linear)

Returns:
	static Handle_Law_BSpFunc

This algorithm searches the knot values corresponding to the  
 splitting of a given B-spline law into  several arcs with  
 the same continuity. The continuity order is given at the  
 construction time.  Builds a 1d bspline that   is near from Lin with  null  
         derivatives at the extremities.") MixBnd;
		static Handle_Law_BSpFunc MixBnd (const Handle_Law_Linear & Lin);
		%feature("autodoc", "Args:
	Degree(Standard_Integer)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	Lin(Handle_Law_Linear)

Returns:
	static Handle_TColStd_HArray1OfReal

Builds  the poles of the 1d  bspline that is near from  
         Lin with null derivatives at the extremities.") MixBnd;
		static Handle_TColStd_HArray1OfReal MixBnd (const Standard_Integer Degree,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Handle_Law_Linear & Lin);
		%feature("autodoc", "Args:
	Degree(Standard_Integer)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	NulOnTheRight(Standard_Boolean)
	Index(Standard_Integer)

Returns:
	static Handle_TColStd_HArray1OfReal

Builds the poles of the 1d bspline that is null on the  
         rigth    side   of   Knots(Index)  (on  the    left if  
         NulOnTheRight  is  false)    and   that is     like  a  
         t*(1-t)(1-t) curve  on the  left side of  Knots(Index)  
         (on the rigth  if NulOnTheRight is false).  The result  
         curve is  C1 with  a derivative  equal  to 1. at first  
         parameter (-1 at last  parameter  if  NulOnTheRight is  
         false).  
 Warning: Mults(Index) must greater or equal to degree-1.") MixTgt;
		static Handle_TColStd_HArray1OfReal MixTgt (const Standard_Integer Degree,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Boolean NulOnTheRight,const Standard_Integer Index);
		%feature("autodoc", "Args:
	Curve(Adaptor3d_Curve)
	First(Standard_Real)
	Last(Standard_Real)
	HasDF(Standard_Boolean)
	HasDL(Standard_Boolean)
	DFirst(Standard_Real)
	DLast(Standard_Real)
	Rev(Standard_Boolean)
	NbPoints(Standard_Integer)

Returns:
	static Handle_Law_BSpline

Computes a 1 d curve to  reparametrize a curve. Its an  
         interpolation of NbPoints  points calculated  at quasi  
         constant abscissa.") Reparametrize;
		static Handle_Law_BSpline Reparametrize (const Adaptor3d_Curve & Curve,const Standard_Real First,const Standard_Real Last,const Standard_Boolean HasDF,const Standard_Boolean HasDL,const Standard_Real DFirst,const Standard_Real DLast,const Standard_Boolean Rev,const Standard_Integer NbPoints);
		%feature("autodoc", "Args:
	First(Standard_Real)
	Last(Standard_Real)
	HasF(Standard_Boolean)
	HasL(Standard_Boolean)
	VFirst(Standard_Real)
	VLast(Standard_Real)

Returns:
	static Handle_Law_BSpline

Computes a 1  d curve to  scale  a field of  tangency.  
         Value is 1. for t = (First+Last)/2 .  
         If HasFirst value for t = First is VFirst (null derivative).  
         If HasLast value for t = Last is VLast (null derivative).  
 
         1.                   _  
                            _/ \_  
                         __/     \__  
                        /            
         VFirst    ____/              
         VLast                        \____  
                 First                    Last") Scale;
		static Handle_Law_BSpline Scale (const Standard_Real First,const Standard_Real Last,const Standard_Boolean HasF,const Standard_Boolean HasL,const Standard_Real VFirst,const Standard_Real VLast);
		%feature("autodoc", "Args:
	First(Standard_Real)
	Last(Standard_Real)
	HasF(Standard_Boolean)
	HasL(Standard_Boolean)
	VFirst(Standard_Real)
	VLast(Standard_Real)

Returns:
	static Handle_Law_BSpline

No detailed docstring for this function.") ScaleCub;
		static Handle_Law_BSpline ScaleCub (const Standard_Real First,const Standard_Real Last,const Standard_Boolean HasF,const Standard_Boolean HasL,const Standard_Real VFirst,const Standard_Real VLast);
};


%feature("shadow") Law::~Law %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Law {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Law_BSpline;
class Law_BSpline : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Poles(TColStd_Array1OfReal)
	Knots(TColStd_Array1OfReal)
	Multiplicities(TColStd_Array1OfInteger)
	Degree(Standard_Integer)
	Periodic(Standard_Boolean)=Standard_False

Returns:
	None

Creates a  non-rational B_spline curve   on  the  
        basis <Knots, Multiplicities> of degree <Degree>.") Law_BSpline;
		 Law_BSpline (const TColStd_Array1OfReal & Poles,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Multiplicities,const Standard_Integer Degree,const Standard_Boolean Periodic = Standard_False);
		%feature("autodoc", "Args:
	Poles(TColStd_Array1OfReal)
	Weights(TColStd_Array1OfReal)
	Knots(TColStd_Array1OfReal)
	Multiplicities(TColStd_Array1OfInteger)
	Degree(Standard_Integer)
	Periodic(Standard_Boolean)=Standard_False

Returns:
	None

Creates  a rational B_spline  curve  on the basis  
        <Knots, Multiplicities> of degree <Degree>.") Law_BSpline;
		 Law_BSpline (const TColStd_Array1OfReal & Poles,const TColStd_Array1OfReal & Weights,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Multiplicities,const Standard_Integer Degree,const Standard_Boolean Periodic = Standard_False);
		%feature("autodoc", "Args:
	Degree(Standard_Integer)

Returns:
	None

Increase the degree to  <Degree>. Nothing is  done  
         if  <Degree>   is lower or  equal  to the  current  
         degree.") IncreaseDegree;
		void IncreaseDegree (const Standard_Integer Degree);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	M(Standard_Integer)

Returns:
	None

//!Increases the multiplicity  of the knot <Index> to  
        <M>.  
 
        If   <M>   is   lower   or  equal   to  the current  
        multiplicity nothing is done. If <M> is higher than  
        the degree the degree is used.  If <Index> is not in [FirstUKnotIndex, LastUKnotIndex]") IncreaseMultiplicity;
		void IncreaseMultiplicity (const Standard_Integer Index,const Standard_Integer M);
		%feature("autodoc", "Args:
	I1(Standard_Integer)
	I2(Standard_Integer)
	M(Standard_Integer)

Returns:
	None

//!Increases  the  multiplicities   of  the knots  in  
        [I1,I2] to <M>.  
 
        For each knot if  <M>  is  lower  or equal  to  the  
        current multiplicity  nothing  is  done. If <M>  is  
        higher than the degree the degree is used.  If <I1,I2> are not in [FirstUKnotIndex, LastUKnotIndex]") IncreaseMultiplicity;
		void IncreaseMultiplicity (const Standard_Integer I1,const Standard_Integer I2,const Standard_Integer M);
		%feature("autodoc", "Args:
	I1(Standard_Integer)
	I2(Standard_Integer)
	M(Standard_Integer)

Returns:
	None

//!Increment  the  multiplicities   of  the knots  in  
        [I1,I2] by <M>.  
 
        If <M> is not positive nithing is done.  
 
        For   each  knot   the resulting   multiplicity  is  
        limited to the Degree.  If <I1,I2> are not in [FirstUKnotIndex, LastUKnotIndex]") IncrementMultiplicity;
		void IncrementMultiplicity (const Standard_Integer I1,const Standard_Integer I2,const Standard_Integer M);
		%feature("autodoc", "Args:
	U(Standard_Real)
	M(Standard_Integer)=1
	ParametricTolerance(Standard_Real)=0.0
	Add(Standard_Boolean)=Standard_True

Returns:
	None

Inserts a knot value in the sequence of knots.  If  
         <U>  is an  existing knot     the multiplicity  is  
         increased by <M>.  
 
         If U  is  not  on the parameter  range  nothing is  
         done.  
 
         If the multiplicity is negative or null nothing is  
         done. The  new   multiplicity  is limited  to  the  
         degree.  
 
         The  tolerance criterion  for  knots  equality  is  
         the max of Epsilon(U) and ParametricTolerance.") InsertKnot;
		void InsertKnot (const Standard_Real U,const Standard_Integer M = 1,const Standard_Real ParametricTolerance = 0.0,const Standard_Boolean Add = Standard_True);
		%feature("autodoc", "Args:
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	ParametricTolerance(Standard_Real)=0.0
	Add(Standard_Boolean)=Standard_False

Returns:
	None

Inserts a set of knots  values in  the sequence of  
         knots.  
 
         For each U = Knots(i), M = Mults(i)  
 
         If <U>  is an existing  knot  the  multiplicity is  
         increased by  <M> if  <Add>  is True, increased to  
         <M> if <Add> is False.  
 
         If U  is  not  on the parameter  range  nothing is  
         done.  
 
         If the multiplicity is negative or null nothing is  
         done. The  new   multiplicity  is limited  to  the  
         degree.  
 
         The  tolerance criterion  for  knots  equality  is  
         the max of Epsilon(U) and ParametricTolerance.") InsertKnots;
		void InsertKnots (const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Real ParametricTolerance = 0.0,const Standard_Boolean Add = Standard_False);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	M(Standard_Integer)
	Tolerance(Standard_Real)

Returns:
	Standard_Boolean

Decrement the knots multiplicity to <M>. If  M is  
        0 the knot   is  removed. The  Poles  sequence   is  
        modified.  
 
        As there are two ways to  compute the new poles the  
        average is  computed if  the distance is lower than  
        the <Tolerance>, else False is returned.  
 
        A low tolerance is used to prevent the modification  
        of the curve.  
 
        A high tolerance is used to 'smooth' the curve.  
 
 Raised if Index is not in the range  
 [FirstUKnotIndex, LastUKnotIndex]  pole insertion and pole removing  
 this operation is limited to the Uniform or QuasiUniform  
 BSplineCurve. The knot values are modified . If the BSpline is  
 NonUniform or Piecewise Bezier an exception Construction error  
 is raised.") RemoveKnot;
		Standard_Boolean RemoveKnot (const Standard_Integer Index,const Standard_Integer M,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	None
Returns:
	None

Changes the direction of parametrization of <self>. The Knot  
 sequence is modified, the FirstParameter and the  
 LastParameter are not modified. The StartPoint of the  
 initial curve becomes the EndPoint of the reversed curve  
 and the EndPoint of the initial curve becomes the StartPoint  
 of the reversed curve.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Standard_Real

Returns the  parameter on the  reversed  curve for  
         the point of parameter U on <self>.  
 
         returns UFirst + ULast - U") ReversedParameter;
		Standard_Real ReversedParameter (const Standard_Real U);
		%feature("autodoc", "Args:
	U1(Standard_Real)
	U2(Standard_Real)

Returns:
	None

Segments the curve between U1 and U2.  
 The control points are modified, the first and the last point  
 are not the same.  
Warnings :  
 Even if <self> is not closed it can become closed after the  
 segmentation for example if U1 or U2 are out of the bounds  
 of the curve <self> or if the curve makes loop.  
 After the segmentation the length of a curve can be null.  raises if U2 < U1.") Segment;
		void Segment (const Standard_Real U1,const Standard_Real U2);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	K(Standard_Real)

Returns:
	None

Changes the knot of range Index.  
 The multiplicity of the knot is not modified.  Raised if K >= Knots(Index+1) or K <= Knots(Index-1).  Raised if Index < 1 || Index > NbKnots") SetKnot;
		void SetKnot (const Standard_Integer Index,const Standard_Real K);
		%feature("autodoc", "Args:
	K(TColStd_Array1OfReal)

Returns:
	None

Changes all the knots of the curve  
 The multiplicity of the knots are not modified.  
 Raised if there is an index such that K (Index+1) <= K (Index).  
 Raised if  K.Lower() < 1 or K.Upper() > NbKnots") SetKnots;
		void SetKnots (const TColStd_Array1OfReal & K);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	K(Standard_Real)
	M(Standard_Integer)

Returns:
	None

Changes the knot of range Index with its multiplicity.  
 You can increase the multiplicity of a knot but it is  
 not allowed to decrease the multiplicity of an existing knot.  
 Raised if K >= Knots(Index+1) or K <= Knots(Index-1).  
 Raised if M is greater than Degree or lower than the previous  
 multiplicity of knot of range Index.  Raised if Index < 1 || Index > NbKnots") SetKnot;
		void SetKnot (const Standard_Integer Index,const Standard_Real K,const Standard_Integer M);
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	None

returns the parameter normalized within  
        the period if the curve is periodic : otherwise  
        does not do anything") PeriodicNormalization;
		void PeriodicNormalization (Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	None

Makes a closed B-spline into a periodic curve. The curve is  
 periodic if the knot sequence is periodic and if the curve is  
 closed (The tolerance criterion is Resolution from gp).  
 The period T is equal to Knot(LastUKnotIndex) -  
  Knot(FirstUKnotIndex). A periodic B-spline can be uniform  
  or not.  Raised if the curve is not closed.") SetPeriodic;
		void SetPeriodic ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

Set the origin of a periodic curve at Knot(index)  
         KnotVector and poles are modified.  Raised if the curve is not periodic  Raised if index not in the range  
         [FirstUKnotIndex , LastUKnotIndex]") SetOrigin;
		void SetOrigin (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	None

Makes a non periodic curve. If the curve was non periodic  
 the curve is not modified.") SetNotPeriodic;
		void SetNotPeriodic ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	P(Standard_Real)

Returns:
	None

Substitutes the Pole of range Index with P.  
 Raised if Index < 1 || Index > NbPoles") SetPole;
		void SetPole (const Standard_Integer Index,const Standard_Real P);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	P(Standard_Real)
	Weight(Standard_Real)

Returns:
	None

Substitutes the pole and the weight of range Index.  
 If the curve <self> is not rational it can become rational  
 If the curve was rational it can become non rational  
 Raised if Index < 1 || Index > NbPoles  Raised if Weight <= 0.0") SetPole;
		void SetPole (const Standard_Integer Index,const Standard_Real P,const Standard_Real Weight);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Weight(Standard_Real)

Returns:
	None

Changes the weight for the pole of range Index.  
 If the curve was non rational it can become rational.  
 If the curve was rational it can become non rational.  
 Raised if Index < 1 || Index > NbPoles  Raised if Weight <= 0.0") SetWeight;
		void SetWeight (const Standard_Integer Index,const Standard_Real Weight);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Boolean

Returns the continuity of the curve, the curve is at least C0.  Raised if N < 0.") IsCN;
		Standard_Boolean IsCN (const Standard_Integer N);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the distance between the first point and the  
 last point of the curve is lower or equal to Resolution  
 from package gp.  
Warnings :  
 The first and the last point can be different from the first  
 pole and the last pole of the curve.") IsClosed;
		Standard_Boolean IsClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the curve is periodic.") IsPeriodic;
		Standard_Boolean IsPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the weights are not identical.  
 The tolerance criterion is Epsilon of the class Real.") IsRational;
		Standard_Boolean IsRational ();
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_Shape

Returns the global continuity of the curve :  
 C0 : only geometric continuity,  
 C1 : continuity of the first derivative all along the Curve,  
 C2 : continuity of the second derivative all along the Curve,  
 C3 : continuity of the third derivative all along the Curve,  
 CN : the order of continuity is infinite.  
 For a B-spline curve of degree d if a knot Ui has a  
 multiplicity p the B-spline curve is only Cd-p continuous  
 at Ui. So the global continuity of the curve can't be greater  
 than Cd-p where p is the maximum multiplicity of the interior  
 Knots. In the interior of a knot span the curve is infinitely  
 continuously differentiable.") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Computation of value and derivatives") Degree;
		Standard_Integer Degree ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Standard_Real

No detailed docstring for this function.") Value;
		Standard_Real Value (const Standard_Real U);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(Standard_Real)

Returns:
	None

No detailed docstring for this function.") D0;
		void D0 (const Standard_Real U,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(Standard_Real)
	V1(Standard_Real)

Returns:
	None

No detailed docstring for this function.") D1;
		void D1 (const Standard_Real U,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(Standard_Real)
	V1(Standard_Real)
	V2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") D2;
		void D2 (const Standard_Real U,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(Standard_Real)
	V1(Standard_Real)
	V2(Standard_Real)
	V3(Standard_Real)

Returns:
	None

No detailed docstring for this function.") D3;
		void D3 (const Standard_Real U,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	N(Standard_Integer)

Returns:
	Standard_Real

The following functions computes the point  of parameter U and  
 the  derivatives at   this  point on  the  B-spline curve  arc  
 defined between the knot FromK1  and the knot  ToK2.  U can be  
 out of bounds   [Knot  (FromK1), Knot   (ToK2)] but   for  the  
 computation we only  use  the definition of the  curve between  
 these  two  knots. This  method is  useful  to  compute  local  
 derivative,  if the order of  continuity of the whole curve is  
 not   greater  enough.   Inside   the parametric   domain Knot  
 (FromK1), Knot (ToK2)  the evaluations are the  same as if  we  
 consider  the whole  definition of the  curve.   Of course the  
 evaluations are different outside this parametric domain.") DN;
		Standard_Real DN (const Standard_Real U,const Standard_Integer N);
		%feature("autodoc", "Args:
	U(Standard_Real)
	FromK1(Standard_Integer)
	ToK2(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") LocalValue;
		Standard_Real LocalValue (const Standard_Real U,const Standard_Integer FromK1,const Standard_Integer ToK2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	FromK1(Standard_Integer)
	ToK2(Standard_Integer)
	P(Standard_Real)

Returns:
	None

No detailed docstring for this function.") LocalD0;
		void LocalD0 (const Standard_Real U,const Standard_Integer FromK1,const Standard_Integer ToK2,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	FromK1(Standard_Integer)
	ToK2(Standard_Integer)
	P(Standard_Real)
	V1(Standard_Real)

Returns:
	None

No detailed docstring for this function.") LocalD1;
		void LocalD1 (const Standard_Real U,const Standard_Integer FromK1,const Standard_Integer ToK2,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	FromK1(Standard_Integer)
	ToK2(Standard_Integer)
	P(Standard_Real)
	V1(Standard_Real)
	V2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") LocalD2;
		void LocalD2 (const Standard_Real U,const Standard_Integer FromK1,const Standard_Integer ToK2,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	FromK1(Standard_Integer)
	ToK2(Standard_Integer)
	P(Standard_Real)
	V1(Standard_Real)
	V2(Standard_Real)
	V3(Standard_Real)

Returns:
	None

No detailed docstring for this function.") LocalD3;
		void LocalD3 (const Standard_Real U,const Standard_Integer FromK1,const Standard_Integer ToK2,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	FromK1(Standard_Integer)
	ToK2(Standard_Integer)
	N(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") LocalDN;
		Standard_Real LocalDN (const Standard_Real U,const Standard_Integer FromK1,const Standard_Integer ToK2,const Standard_Integer N);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the last point of the curve.  
Warnings :  
 The last point of the curve is different from the last  
 pole of the curve if the multiplicity of the last knot  
 is lower than Degree.") EndPoint;
		Standard_Real EndPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

For a B-spline curve the first parameter (which gives the start  
 point of the curve) is a knot value but if the multiplicity of  
 the first knot index is lower than Degree + 1 it is not the  
 first knot of the curve. This method computes the index of the  
 knot corresponding to the first parameter.") FirstUKnotIndex;
		Standard_Integer FirstUKnotIndex ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Computes the parametric value of the start point of the curve.  
 It is a knot value.") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

Returns the knot of range Index. When there is a knot  
 with a multiplicity greater than 1 the knot is not repeated.  
 The method Multiplicity can be used to get the multiplicity  
 of the Knot.  Raised if Index < 1 or Index > NbKnots") Knot;
		Standard_Real Knot (const Standard_Integer Index);
		%feature("autodoc", "Args:
	K(TColStd_Array1OfReal)

Returns:
	None

returns the knot values of the B-spline curve;  
 Raised if the length of K is not equal to the number of knots.") Knots;
		void Knots (TColStd_Array1OfReal & K);
		%feature("autodoc", "Args:
	K(TColStd_Array1OfReal)

Returns:
	None

Returns the knots sequence.  
 In this sequence the knots with a multiplicity greater than 1  
 are repeated.  
Example :  
 K = {k1, k1, k1, k2, k3, k3, k4, k4, k4}  
 Raised if the length of K is not equal to NbPoles + Degree + 1") KnotSequence;
		void KnotSequence (TColStd_Array1OfReal & K);
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_BSplKnotDistribution

Returns NonUniform or Uniform or QuasiUniform or PiecewiseBezier.  
 If all the knots differ by a positive constant from the  
 preceding knot the BSpline Curve can be :  
 - Uniform if all the knots are of multiplicity 1,  
 - QuasiUniform if all the knots are of multiplicity 1 except for  
   the first and last knot which are of multiplicity Degree + 1,  
 - PiecewiseBezier if the first and last knots have multiplicity  
   Degree + 1 and if interior knots have multiplicity Degree  
   A piecewise Bezier with only two knots is a BezierCurve.  
 else the curve is non uniform.  
 The tolerance criterion is Epsilon from class Real.") KnotDistribution;
		GeomAbs_BSplKnotDistribution KnotDistribution ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

For a BSpline curve the last parameter (which gives the  
 end point of the curve) is a knot value but if the  
 multiplicity of the last knot index is lower than  
 Degree + 1 it is not the last knot of the curve. This  
 method computes the index of the knot corresponding to  
 the last parameter.") LastUKnotIndex;
		Standard_Integer LastUKnotIndex ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Computes the parametric value of the end point of the curve.  
 It is a knot value.") LastParameter;
		Standard_Real LastParameter ();
		%feature("autodoc", "Args:
	U(Standard_Real)
	ParametricTolerance(Standard_Real)
	I1(Standard_Integer)
	I2(Standard_Integer)
	WithKnotRepetition(Standard_Boolean)=Standard_False

Returns:
	None

Locates the parametric value U in the sequence of knots.  
 If 'WithKnotRepetition' is True we consider the knot's  
 representation with repetition of multiple knot value,  
 otherwise  we consider the knot's representation with  
 no repetition of multiple knot values.  
 Knots (I1) <= U <= Knots (I2)  
 . if I1 = I2  U is a knot value (the tolerance criterion  
   ParametricTolerance is used).  
 . if I1 < 1  => U < Knots (1) - Abs(ParametricTolerance)  
 . if I2 > NbKnots => U > Knots (NbKnots) + Abs(ParametricTolerance)") LocateU;
		void LocateU (const Standard_Real U,const Standard_Real ParametricTolerance,Standard_Integer &OutValue,Standard_Integer &OutValue,const Standard_Boolean WithKnotRepetition = Standard_False);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Integer

Returns the multiplicity of the knots of range Index.  Raised if Index < 1 or Index > NbKnots") Multiplicity;
		Standard_Integer Multiplicity (const Standard_Integer Index);
		%feature("autodoc", "Args:
	M(TColStd_Array1OfInteger)

Returns:
	None

Returns the multiplicity of the knots of the curve.  
 Raised if the length of M is not equal to NbKnots.") Multiplicities;
		void Multiplicities (TColStd_Array1OfInteger & M);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of knots. This method returns the number of  
 knot without repetition of multiple knots.") NbKnots;
		Standard_Integer NbKnots ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of poles") NbPoles;
		Standard_Integer NbPoles ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

Returns the pole of range Index.  Raised if Index < 1 or Index > NbPoles.") Pole;
		Standard_Real Pole (const Standard_Integer Index);
		%feature("autodoc", "Args:
	P(TColStd_Array1OfReal)

Returns:
	None

Returns the poles of the B-spline curve;  
 Raised if the length of P is not equal to the number of poles.") Poles;
		void Poles (TColStd_Array1OfReal & P);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the start point of the curve.  
Warnings :  
 This point is different from the first pole of the curve if the  
 multiplicity of the first knot is lower than Degree.") StartPoint;
		Standard_Real StartPoint ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

Returns the weight of the pole of range Index .  Raised if Index < 1 or Index > NbPoles.") Weight;
		Standard_Real Weight (const Standard_Integer Index);
		%feature("autodoc", "Args:
	W(TColStd_Array1OfReal)

Returns:
	None

Returns the weights of the B-spline curve;  
 Raised if the length of W is not equal to NbPoles.") Weights;
		void Weights (TColStd_Array1OfReal & W);
		%feature("autodoc", "Args:
	None
Returns:
	static Standard_Integer

Returns the value of the maximum degree of the normalized  
 B-spline basis functions in this package.") MaxDegree;
		static Standard_Integer MaxDegree ();
		%feature("autodoc", "Args:
	U(Standard_Real)
	NewValue(Standard_Real)
	Derivative(Standard_Real)
	Tolerance(Standard_Real)
	StartingCondition(Standard_Integer)
	EndingCondition(Standard_Integer)
	ErrorStatus(Standard_Integer)

Returns:
	None

Changes the value of the Law at parameter U to NewValue.  
and makes its derivative at U be derivative.  
StartingCondition = -1 means first can move  
EndingCondition   = -1 means last point can move  
StartingCondition = 0 means the first point cannot move  
EndingCondition   = 0 means the last point cannot move  
StartingCondition = 1 means the first point and tangent cannot move  
EndingCondition   = 1 means the last point and tangent cannot move  
and so forth  
ErrorStatus != 0 means that there are not enought degree of freedom  
with the constrain to deform the curve accordingly") MovePointAndTangent;
		void MovePointAndTangent (const Standard_Real U,const Standard_Real NewValue,const Standard_Real Derivative,const Standard_Real Tolerance,const Standard_Integer StartingCondition,const Standard_Integer EndingCondition,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	Tolerance3D(Standard_Real)
	UTolerance(Standard_Real)

Returns:
	None

given Tolerance3D returns UTolerance  
          such that if f(t) is the curve we have  
          | t1 - t0| < Utolerance ===>  
          |f(t1) - f(t0)| < Tolerance3D") Resolution;
		void Resolution (const Standard_Real Tolerance3D,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Law_BSpline

No detailed docstring for this function.") Copy;
		Handle_Law_BSpline Copy ();
};


%feature("shadow") Law_BSpline::~Law_BSpline %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Law_BSpline {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Law_BSpline {
	Handle_Law_BSpline GetHandle() {
	return *(Handle_Law_BSpline*) &$self;
	}
};

%nodefaultctor Handle_Law_BSpline;
class Handle_Law_BSpline : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Law_BSpline();
        Handle_Law_BSpline(const Handle_Law_BSpline &aHandle);
        Handle_Law_BSpline(const Law_BSpline *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Law_BSpline DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Law_BSpline {
    Law_BSpline* GetObject() {
    return (Law_BSpline*)$self->Access();
    }
};
%feature("shadow") Handle_Law_BSpline::~Handle_Law_BSpline %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Law_BSpline {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Law_BSplineKnotSplitting;
class Law_BSplineKnotSplitting {
	public:
		%feature("autodoc", "Args:
	BasisLaw(Handle_Law_BSpline)
	ContinuityRange(Standard_Integer)

Returns:
	None

Locates the knot values which correspond to the segmentation of  
 the curve into arcs with a continuity equal to ContinuityRange.  
 Raised if ContinuityRange is not greater or equal zero.") Law_BSplineKnotSplitting;
		 Law_BSplineKnotSplitting (const Handle_Law_BSpline & BasisLaw,const Standard_Integer ContinuityRange);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of knots corresponding to the splitting.") NbSplits;
		Standard_Integer NbSplits ();
		%feature("autodoc", "Args:
	SplitValues(TColStd_Array1OfInteger)

Returns:
	None

Returns the indexes of the BSpline curve knots corresponding to  
 the splitting.  
 Raised if the length of SplitValues is not equal to NbSPlit.") Splitting;
		void Splitting (TColStd_Array1OfInteger & SplitValues);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Integer

Returns the index of the knot corresponding to the splitting  
 of range Index.  
 Raised if Index < 1 or Index > NbSplits") SplitValue;
		Standard_Integer SplitValue (const Standard_Integer Index);
};


%feature("shadow") Law_BSplineKnotSplitting::~Law_BSplineKnotSplitting %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Law_BSplineKnotSplitting {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Law_Function;
class Law_Function : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	virtual GeomAbs_Shape

No detailed docstring for this function.") Continuity;
		virtual GeomAbs_Shape Continuity ();
		%feature("autodoc", "Args:
	S(GeomAbs_Shape)

Returns:
	virtual Standard_Integer

Returns  the number  of  intervals for  continuity  
         <S>. May be one if Continuity(me) >= <S>") NbIntervals;
		virtual Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	T(TColStd_Array1OfReal)
	S(GeomAbs_Shape)

Returns:
	virtual void

Stores in <T> the  parameters bounding the intervals  
         of continuity <S>.  
 
         The array must provide  enough room to  accomodate  
         for the parameters. i.e. T.Length() > NbIntervals()") Intervals;
		virtual void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	X(Standard_Real)

Returns:
	virtual Standard_Real

Returns the value of the function at the point of parameter X.") Value;
		virtual Standard_Real Value (const Standard_Real X);
		%feature("autodoc", "Args:
	X(Standard_Real)
	F(Standard_Real)
	D(Standard_Real)

Returns:
	virtual void

Returns the value F and the first derivative D of the  
function at the point of parameter X.") D1;
		virtual void D1 (const Standard_Real X,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	X(Standard_Real)
	F(Standard_Real)
	D(Standard_Real)
	D2(Standard_Real)

Returns:
	virtual void

Returns the value, first and seconde derivatives  
         at parameter X.") D2;
		virtual void D2 (const Standard_Real X,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	PFirst(Standard_Real)
	PLast(Standard_Real)
	Tol(Standard_Real)

Returns:
	virtual Handle_Law_Function

Returns a  law equivalent of  <self>  between  
       parameters <First>  and <Last>. <Tol>  is used  to  
       test for 3d points confusion.  
       It is usfule to determines the derivatives  
       in these values <First> and <Last> if  
       the Law is not Cn.") Trim;
		virtual Handle_Law_Function Trim (const Standard_Real PFirst,const Standard_Real PLast,const Standard_Real Tol);
		%feature("autodoc", "Args:
	PFirst(Standard_Real)
	PLast(Standard_Real)

Returns:
	virtual void

Returns the parametric bounds of the function.") Bounds;
		virtual void Bounds (Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") Law_Function::~Law_Function %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Law_Function {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Law_Function {
	Handle_Law_Function GetHandle() {
	return *(Handle_Law_Function*) &$self;
	}
};

%nodefaultctor Handle_Law_Function;
class Handle_Law_Function : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Law_Function();
        Handle_Law_Function(const Handle_Law_Function &aHandle);
        Handle_Law_Function(const Law_Function *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Law_Function DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Law_Function {
    Law_Function* GetObject() {
    return (Law_Function*)$self->Access();
    }
};
%feature("shadow") Handle_Law_Function::~Handle_Law_Function %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Law_Function {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Law_Interpolate;
class Law_Interpolate {
	public:
		%feature("autodoc", "Args:
	Points(Handle_TColStd_HArray1OfReal)
	PeriodicFlag(Standard_Boolean)
	Tolerance(Standard_Real)

Returns:
	None

Tolerance is to check if  the points are not too close  
         to one an  other.  It is  also  used to check   if the  
         tangent vector  is not too small.   There should be at  
         least 2 points. If PeriodicFlag is True then the curve  
         will be periodic be periodic") Law_Interpolate;
		 Law_Interpolate (const Handle_TColStd_HArray1OfReal & Points,const Standard_Boolean PeriodicFlag,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Points(Handle_TColStd_HArray1OfReal)
	Parameters(Handle_TColStd_HArray1OfReal)
	PeriodicFlag(Standard_Boolean)
	Tolerance(Standard_Real)

Returns:
	None

Tolerance is to check if  the points are not too close  
         to one an  other.  It is  also  used to check   if the  
         tangent vector  is not too small.   There should be at  
         least 2 points. If PeriodicFlag is True then the curve  
         will be periodic be periodic") Law_Interpolate;
		 Law_Interpolate (const Handle_TColStd_HArray1OfReal & Points,const Handle_TColStd_HArray1OfReal & Parameters,const Standard_Boolean PeriodicFlag,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	InitialTangent(Standard_Real)
	FinalTangent(Standard_Real)

Returns:
	None

loads initial and final tangents if any.") Load;
		void Load (const Standard_Real InitialTangent,const Standard_Real FinalTangent);
		%feature("autodoc", "Args:
	Tangents(TColStd_Array1OfReal)
	TangentFlags(Handle_TColStd_HArray1OfBoolean)

Returns:
	None

loads the tangents. We should have as many tangents as  
         they are points  in the array if TangentFlags.Value(i)  
         is    Standard_True  use the tangent Tangents.Value(i)  
         otherwise the tangent is not constrained.") Load;
		void Load (const TColStd_Array1OfReal & Tangents,const Handle_TColStd_HArray1OfBoolean & TangentFlags);
		%feature("autodoc", "Args:
	None
Returns:
	None

Makes the interpolation") Perform;
		void Perform ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Law_BSpline

No detailed docstring for this function.") Curve;
		const Handle_Law_BSpline & Curve ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
};


%feature("shadow") Law_Interpolate::~Law_Interpolate %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Law_Interpolate {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Law_Laws;
class Law_Laws {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Law_Laws;
		 Law_Laws ();
		%feature("autodoc", "Args:
	Other(Law_Laws)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const Law_Laws & Other);
		%feature("autodoc", "Args:
	Other(Law_Laws)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const Law_Laws & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	I(Handle_Law_Function)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Law_Function & I);
		%feature("autodoc", "Args:
	I(Handle_Law_Function)
	theIt(Law_ListIteratorOfLaws)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Law_Function & I,Law_ListIteratorOfLaws & theIt);
		%feature("autodoc", "Args:
	Other(Law_Laws)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Law_Laws & Other);
		%feature("autodoc", "Args:
	I(Handle_Law_Function)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Law_Function & I);
		%feature("autodoc", "Args:
	I(Handle_Law_Function)
	theIt(Law_ListIteratorOfLaws)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Law_Function & I,Law_ListIteratorOfLaws & theIt);
		%feature("autodoc", "Args:
	Other(Law_Laws)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Law_Laws & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Law_Function

No detailed docstring for this function.") First;
		Handle_Law_Function & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Law_Function

No detailed docstring for this function.") Last;
		Handle_Law_Function & Last ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(Law_ListIteratorOfLaws)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (Law_ListIteratorOfLaws & It);
		%feature("autodoc", "Args:
	I(Handle_Law_Function)
	It(Law_ListIteratorOfLaws)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Handle_Law_Function & I,Law_ListIteratorOfLaws & It);
		%feature("autodoc", "Args:
	Other(Law_Laws)
	It(Law_ListIteratorOfLaws)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (Law_Laws & Other,Law_ListIteratorOfLaws & It);
		%feature("autodoc", "Args:
	I(Handle_Law_Function)
	It(Law_ListIteratorOfLaws)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Handle_Law_Function & I,Law_ListIteratorOfLaws & It);
		%feature("autodoc", "Args:
	Other(Law_Laws)
	It(Law_ListIteratorOfLaws)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (Law_Laws & Other,Law_ListIteratorOfLaws & It);
};


%feature("shadow") Law_Laws::~Law_Laws %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Law_Laws {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Law_ListIteratorOfLaws;
class Law_ListIteratorOfLaws {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Law_ListIteratorOfLaws;
		 Law_ListIteratorOfLaws ();
		%feature("autodoc", "Args:
	L(Law_Laws)

Returns:
	None

No detailed docstring for this function.") Law_ListIteratorOfLaws;
		 Law_ListIteratorOfLaws (const Law_Laws & L);
		%feature("autodoc", "Args:
	L(Law_Laws)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Law_Laws & L);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Law_Function

No detailed docstring for this function.") Value;
		Handle_Law_Function & Value ();
};


%feature("shadow") Law_ListIteratorOfLaws::~Law_ListIteratorOfLaws %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Law_ListIteratorOfLaws {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Law_ListNodeOfLaws;
class Law_ListNodeOfLaws : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_Law_Function)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") Law_ListNodeOfLaws;
		 Law_ListNodeOfLaws (const Handle_Law_Function & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Law_Function

No detailed docstring for this function.") Value;
		Handle_Law_Function & Value ();
};


%feature("shadow") Law_ListNodeOfLaws::~Law_ListNodeOfLaws %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Law_ListNodeOfLaws {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Law_ListNodeOfLaws {
	Handle_Law_ListNodeOfLaws GetHandle() {
	return *(Handle_Law_ListNodeOfLaws*) &$self;
	}
};

%nodefaultctor Handle_Law_ListNodeOfLaws;
class Handle_Law_ListNodeOfLaws : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_Law_ListNodeOfLaws();
        Handle_Law_ListNodeOfLaws(const Handle_Law_ListNodeOfLaws &aHandle);
        Handle_Law_ListNodeOfLaws(const Law_ListNodeOfLaws *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Law_ListNodeOfLaws DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Law_ListNodeOfLaws {
    Law_ListNodeOfLaws* GetObject() {
    return (Law_ListNodeOfLaws*)$self->Access();
    }
};
%feature("shadow") Handle_Law_ListNodeOfLaws::~Handle_Law_ListNodeOfLaws %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Law_ListNodeOfLaws {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Law_BSpFunc;
class Law_BSpFunc : public Law_Function {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Law_BSpFunc;
		 Law_BSpFunc ();
		%feature("autodoc", "Args:
	C(Handle_Law_BSpline)
	First(Standard_Real)
	Last(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Law_BSpFunc;
		 Law_BSpFunc (const Handle_Law_BSpline & C,const Standard_Real First,const Standard_Real Last);
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_Shape

No detailed docstring for this function.") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("autodoc", "Args:
	S(GeomAbs_Shape)

Returns:
	Standard_Integer

Returns  the number  of  intervals for  continuity  
         <S>. May be one if Continuity(me) >= <S>") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	T(TColStd_Array1OfReal)
	S(GeomAbs_Shape)

Returns:
	None

Stores in <T> the  parameters bounding the intervals  
         of continuity <S>.  
 
         The array must provide  enough room to  accomodate  
         for the parameters. i.e. T.Length() > NbIntervals()") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	X(Standard_Real)

Returns:
	Standard_Real

No detailed docstring for this function.") Value;
		Standard_Real Value (const Standard_Real X);
		%feature("autodoc", "Args:
	X(Standard_Real)
	F(Standard_Real)
	D(Standard_Real)

Returns:
	None

No detailed docstring for this function.") D1;
		void D1 (const Standard_Real X,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	X(Standard_Real)
	F(Standard_Real)
	D(Standard_Real)
	D2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") D2;
		void D2 (const Standard_Real X,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	PFirst(Standard_Real)
	PLast(Standard_Real)
	Tol(Standard_Real)

Returns:
	Handle_Law_Function

Returns a  law equivalent of  <self>  between  
       parameters <First>  and <Last>. <Tol>  is used  to  
       test for 3d points confusion.  
       It is usfule to determines the derivatives  
       in these values <First> and <Last> if  
       the Law is not Cn.") Trim;
		Handle_Law_Function Trim (const Standard_Real PFirst,const Standard_Real PLast,const Standard_Real Tol);
		%feature("autodoc", "Args:
	PFirst(Standard_Real)
	PLast(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Bounds;
		void Bounds (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Law_BSpline

No detailed docstring for this function.") Curve;
		Handle_Law_BSpline Curve ();
		%feature("autodoc", "Args:
	C(Handle_Law_BSpline)

Returns:
	None

No detailed docstring for this function.") SetCurve;
		void SetCurve (const Handle_Law_BSpline & C);
};


%feature("shadow") Law_BSpFunc::~Law_BSpFunc %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Law_BSpFunc {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Law_BSpFunc {
	Handle_Law_BSpFunc GetHandle() {
	return *(Handle_Law_BSpFunc*) &$self;
	}
};

%nodefaultctor Handle_Law_BSpFunc;
class Handle_Law_BSpFunc : public Handle_Law_Function {

    public:
        // constructors
        Handle_Law_BSpFunc();
        Handle_Law_BSpFunc(const Handle_Law_BSpFunc &aHandle);
        Handle_Law_BSpFunc(const Law_BSpFunc *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Law_BSpFunc DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Law_BSpFunc {
    Law_BSpFunc* GetObject() {
    return (Law_BSpFunc*)$self->Access();
    }
};
%feature("shadow") Handle_Law_BSpFunc::~Handle_Law_BSpFunc %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Law_BSpFunc {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Law_Composite;
class Law_Composite : public Law_Function {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Construct an empty Law") Law_Composite;
		 Law_Composite ();
		%feature("autodoc", "Args:
	First(Standard_Real)
	Last(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

Construct an empty, trimed Law") Law_Composite;
		 Law_Composite (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_Shape

No detailed docstring for this function.") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("autodoc", "Args:
	S(GeomAbs_Shape)

Returns:
	Standard_Integer

Returns  the number  of  intervals for  continuity  
         <S>. May be one if Continuity(me) >= <S>") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	T(TColStd_Array1OfReal)
	S(GeomAbs_Shape)

Returns:
	None

Stores in <T> the  parameters bounding the intervals  
         of continuity <S>.  
 
         The array must provide  enough room to  accomodate  
         for the parameters. i.e. T.Length() > NbIntervals()") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	X(Standard_Real)

Returns:
	Standard_Real

Returns the value at parameter X.") Value;
		Standard_Real Value (const Standard_Real X);
		%feature("autodoc", "Args:
	X(Standard_Real)
	F(Standard_Real)
	D(Standard_Real)

Returns:
	None

Returns the value and the first derivative at parameter X.") D1;
		void D1 (const Standard_Real X,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	X(Standard_Real)
	F(Standard_Real)
	D(Standard_Real)
	D2(Standard_Real)

Returns:
	None

Returns the value, first and second derivatives  
         at parameter X.") D2;
		void D2 (const Standard_Real X,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	PFirst(Standard_Real)
	PLast(Standard_Real)
	Tol(Standard_Real)

Returns:
	Handle_Law_Function

Returns a  law equivalent of  <self>  between  
       parameters <First>  and <Last>. <Tol>  is used  to  
       test for 3d points confusion.  
       It is usfule to determines the derivatives  
       in these values <First> and <Last> if  
       the Law is not Cn.") Trim;
		Handle_Law_Function Trim (const Standard_Real PFirst,const Standard_Real PLast,const Standard_Real Tol);
		%feature("autodoc", "Args:
	PFirst(Standard_Real)
	PLast(Standard_Real)

Returns:
	None

Returns the parametric bounds of the function.") Bounds;
		void Bounds (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	W(Standard_Real)

Returns:
	Handle_Law_Function

Returns the elementary  function of the composite used  
         to compute at parameter W.") ChangeElementaryLaw;
		Handle_Law_Function & ChangeElementaryLaw (const Standard_Real W);
		%feature("autodoc", "Args:
	None
Returns:
	Law_Laws

No detailed docstring for this function.") ChangeLaws;
		Law_Laws & ChangeLaws ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsPeriodic;
		Standard_Boolean IsPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") SetPeriodic;
		void SetPeriodic ();
};


%feature("shadow") Law_Composite::~Law_Composite %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Law_Composite {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Law_Composite {
	Handle_Law_Composite GetHandle() {
	return *(Handle_Law_Composite*) &$self;
	}
};

%nodefaultctor Handle_Law_Composite;
class Handle_Law_Composite : public Handle_Law_Function {

    public:
        // constructors
        Handle_Law_Composite();
        Handle_Law_Composite(const Handle_Law_Composite &aHandle);
        Handle_Law_Composite(const Law_Composite *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Law_Composite DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Law_Composite {
    Law_Composite* GetObject() {
    return (Law_Composite*)$self->Access();
    }
};
%feature("shadow") Handle_Law_Composite::~Handle_Law_Composite %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Law_Composite {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Law_Constant;
class Law_Constant : public Law_Function {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Law_Constant;
		 Law_Constant ();
		%feature("autodoc", "Args:
	Radius(Standard_Real)
	PFirst(Standard_Real)
	PLast(Standard_Real)

Returns:
	None

Set the radius and the range of the constant Law.") Set;
		void Set (const Standard_Real Radius,const Standard_Real PFirst,const Standard_Real PLast);
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_Shape

Returns GeomAbs_CN") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("autodoc", "Args:
	S(GeomAbs_Shape)

Returns:
	Standard_Integer

Returns  1") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	T(TColStd_Array1OfReal)
	S(GeomAbs_Shape)

Returns:
	None

No detailed docstring for this function.") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	X(Standard_Real)

Returns:
	Standard_Real

Returns the value at parameter X.") Value;
		Standard_Real Value (const Standard_Real X);
		%feature("autodoc", "Args:
	X(Standard_Real)
	F(Standard_Real)
	D(Standard_Real)

Returns:
	None

Returns the value and the first derivative at parameter X.") D1;
		void D1 (const Standard_Real X,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	X(Standard_Real)
	F(Standard_Real)
	D(Standard_Real)
	D2(Standard_Real)

Returns:
	None

Returns the value, first and second derivatives  
         at parameter X.") D2;
		void D2 (const Standard_Real X,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	PFirst(Standard_Real)
	PLast(Standard_Real)
	Tol(Standard_Real)

Returns:
	Handle_Law_Function

No detailed docstring for this function.") Trim;
		Handle_Law_Function Trim (const Standard_Real PFirst,const Standard_Real PLast,const Standard_Real Tol);
		%feature("autodoc", "Args:
	PFirst(Standard_Real)
	PLast(Standard_Real)

Returns:
	None

Returns the parametric bounds of the function.") Bounds;
		void Bounds (Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") Law_Constant::~Law_Constant %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Law_Constant {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Law_Constant {
	Handle_Law_Constant GetHandle() {
	return *(Handle_Law_Constant*) &$self;
	}
};

%nodefaultctor Handle_Law_Constant;
class Handle_Law_Constant : public Handle_Law_Function {

    public:
        // constructors
        Handle_Law_Constant();
        Handle_Law_Constant(const Handle_Law_Constant &aHandle);
        Handle_Law_Constant(const Law_Constant *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Law_Constant DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Law_Constant {
    Law_Constant* GetObject() {
    return (Law_Constant*)$self->Access();
    }
};
%feature("shadow") Handle_Law_Constant::~Handle_Law_Constant %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Law_Constant {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Law_Linear;
class Law_Linear : public Law_Function {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Constructs an empty linear evolution law.") Law_Linear;
		 Law_Linear ();
		%feature("autodoc", "Args:
	Pdeb(Standard_Real)
	Valdeb(Standard_Real)
	Pfin(Standard_Real)
	Valfin(Standard_Real)

Returns:
	None

Defines this linear evolution law by assigning both:  
-   the bounds Pdeb and Pfin of the parameter, and  
-   the values Valdeb and Valfin of the function at these  
  two parametric bounds.") Set;
		void Set (const Standard_Real Pdeb,const Standard_Real Valdeb,const Standard_Real Pfin,const Standard_Real Valfin);
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_Shape

Returns GeomAbs_CN") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("autodoc", "Args:
	S(GeomAbs_Shape)

Returns:
	Standard_Integer

Returns  1") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	T(TColStd_Array1OfReal)
	S(GeomAbs_Shape)

Returns:
	None

No detailed docstring for this function.") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	X(Standard_Real)

Returns:
	Standard_Real

Returns the value of this function at the point of parameter X.") Value;
		Standard_Real Value (const Standard_Real X);
		%feature("autodoc", "Args:
	X(Standard_Real)
	F(Standard_Real)
	D(Standard_Real)

Returns:
	None

Returns the value F and the first derivative D of this  
function at the point of parameter X.") D1;
		void D1 (const Standard_Real X,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	X(Standard_Real)
	F(Standard_Real)
	D(Standard_Real)
	D2(Standard_Real)

Returns:
	None

Returns the value, first and second derivatives  
         at parameter X.") D2;
		void D2 (const Standard_Real X,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	PFirst(Standard_Real)
	PLast(Standard_Real)
	Tol(Standard_Real)

Returns:
	Handle_Law_Function

Returns a  law equivalent of  <self>  between  
       parameters <First>  and <Last>. <Tol>  is used  to  
       test for 3d points confusion.  
       It is usfule to determines the derivatives  
       in these values <First> and <Last> if  
       the Law is not Cn.") Trim;
		Handle_Law_Function Trim (const Standard_Real PFirst,const Standard_Real PLast,const Standard_Real Tol);
		%feature("autodoc", "Args:
	PFirst(Standard_Real)
	PLast(Standard_Real)

Returns:
	None

Returns the parametric bounds of the function.") Bounds;
		void Bounds (Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") Law_Linear::~Law_Linear %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Law_Linear {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Law_Linear {
	Handle_Law_Linear GetHandle() {
	return *(Handle_Law_Linear*) &$self;
	}
};

%nodefaultctor Handle_Law_Linear;
class Handle_Law_Linear : public Handle_Law_Function {

    public:
        // constructors
        Handle_Law_Linear();
        Handle_Law_Linear(const Handle_Law_Linear &aHandle);
        Handle_Law_Linear(const Law_Linear *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Law_Linear DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Law_Linear {
    Law_Linear* GetObject() {
    return (Law_Linear*)$self->Access();
    }
};
%feature("shadow") Handle_Law_Linear::~Handle_Law_Linear %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Law_Linear {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Law_Interpol;
class Law_Interpol : public Law_BSpFunc {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Constructs an empty interpolative evolution law.  
The function Set is used to define the law.") Law_Interpol;
		 Law_Interpol ();
		%feature("autodoc", "Args:
	ParAndRad(TColgp_Array1OfPnt2d)
	Periodic(Standard_Boolean)=Standard_False

Returns:
	None

Defines this evolution law by interpolating the set of 2D  
points ParAndRad. The Y coordinate of a point of  
ParAndRad is the value of the function at the parameter  
point given by its X coordinate.  
If Periodic is true, this function is assumed to be periodic.  
Warning  
-   The X coordinates of points in the table ParAndRad  
  must be given in ascendant order.  
-   If Periodic is true, the first and last Y coordinates of  
  points in the table ParAndRad are assumed to be  
  equal. In addition, with the second syntax, Dd and Df  
  are also assumed to be equal. If this is not the case,  
  Set uses the first value(s) as last value(s).") Set;
		void Set (const TColgp_Array1OfPnt2d & ParAndRad,const Standard_Boolean Periodic = Standard_False);
		%feature("autodoc", "Args:
	ParAndRad(TColgp_Array1OfPnt2d)
	Ud(Standard_Real)
	Uf(Standard_Real)
	Periodic(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") SetInRelative;
		void SetInRelative (const TColgp_Array1OfPnt2d & ParAndRad,const Standard_Real Ud,const Standard_Real Uf,const Standard_Boolean Periodic = Standard_False);
		%feature("autodoc", "Args:
	ParAndRad(TColgp_Array1OfPnt2d)
	Dd(Standard_Real)
	Df(Standard_Real)
	Periodic(Standard_Boolean)=Standard_False

Returns:
	None

Defines this evolution law by interpolating the set of 2D  
points ParAndRad. The Y coordinate of a point of  
ParAndRad is the value of the function at the parameter  
point given by its X coordinate.  
If Periodic is true, this function is assumed to be periodic.  
In the second syntax, Dd and Df define the values of  
the first derivative of the function at its first and last points.  
Warning  
-   The X coordinates of points in the table ParAndRad  
  must be given in ascendant order.  
-   If Periodic is true, the first and last Y coordinates of  
  points in the table ParAndRad are assumed to be  
  equal. In addition, with the second syntax, Dd and Df  
  are also assumed to be equal. If this is not the case,  
  Set uses the first value(s) as last value(s).") Set;
		void Set (const TColgp_Array1OfPnt2d & ParAndRad,const Standard_Real Dd,const Standard_Real Df,const Standard_Boolean Periodic = Standard_False);
		%feature("autodoc", "Args:
	ParAndRad(TColgp_Array1OfPnt2d)
	Ud(Standard_Real)
	Uf(Standard_Real)
	Dd(Standard_Real)
	Df(Standard_Real)
	Periodic(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") SetInRelative;
		void SetInRelative (const TColgp_Array1OfPnt2d & ParAndRad,const Standard_Real Ud,const Standard_Real Uf,const Standard_Real Dd,const Standard_Real Df,const Standard_Boolean Periodic = Standard_False);
};


%feature("shadow") Law_Interpol::~Law_Interpol %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Law_Interpol {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Law_Interpol {
	Handle_Law_Interpol GetHandle() {
	return *(Handle_Law_Interpol*) &$self;
	}
};

%nodefaultctor Handle_Law_Interpol;
class Handle_Law_Interpol : public Handle_Law_BSpFunc {

    public:
        // constructors
        Handle_Law_Interpol();
        Handle_Law_Interpol(const Handle_Law_Interpol &aHandle);
        Handle_Law_Interpol(const Law_Interpol *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Law_Interpol DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Law_Interpol {
    Law_Interpol* GetObject() {
    return (Law_Interpol*)$self->Access();
    }
};
%feature("shadow") Handle_Law_Interpol::~Handle_Law_Interpol %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Law_Interpol {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Law_S;
class Law_S : public Law_BSpFunc {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Constructs an empty 'S' evolution law.") Law_S;
		 Law_S ();
		%feature("autodoc", "Args:
	Pdeb(Standard_Real)
	Valdeb(Standard_Real)
	Pfin(Standard_Real)
	Valfin(Standard_Real)

Returns:
	None

Defines this S evolution law by assigning both:  
-   the bounds Pdeb and Pfin of the parameter, and  
-   the values Valdeb and Valfin of the function at these  
  two parametric bounds.  
The function is assumed to have the first derivatives  
equal to 0 at the two parameter points Pdeb and Pfin.") Set;
		void Set (const Standard_Real Pdeb,const Standard_Real Valdeb,const Standard_Real Pfin,const Standard_Real Valfin);
		%feature("autodoc", "Args:
	Pdeb(Standard_Real)
	Valdeb(Standard_Real)
	Ddeb(Standard_Real)
	Pfin(Standard_Real)
	Valfin(Standard_Real)
	Dfin(Standard_Real)

Returns:
	None

Defines this S evolution law by assigning  
-   the bounds Pdeb and Pfin of the parameter,  
-   the values Valdeb and Valfin of the function at these  
  two parametric bounds, and  
-   the values Ddeb and Dfin of the first derivative of the  
  function at these two parametric bounds.") Set;
		void Set (const Standard_Real Pdeb,const Standard_Real Valdeb,const Standard_Real Ddeb,const Standard_Real Pfin,const Standard_Real Valfin,const Standard_Real Dfin);
};


%feature("shadow") Law_S::~Law_S %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Law_S {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Law_S {
	Handle_Law_S GetHandle() {
	return *(Handle_Law_S*) &$self;
	}
};

%nodefaultctor Handle_Law_S;
class Handle_Law_S : public Handle_Law_BSpFunc {

    public:
        // constructors
        Handle_Law_S();
        Handle_Law_S(const Handle_Law_S &aHandle);
        Handle_Law_S(const Law_S *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Law_S DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Law_S {
    Law_S* GetObject() {
    return (Law_S*)$self->Access();
    }
};
%feature("shadow") Handle_Law_S::~Handle_Law_S %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Law_S {
    void _kill_pointed() {
        delete $self;
    }
};

