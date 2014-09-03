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
%module (package="OCC") BSplSLib

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

%include BSplSLib_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(bsplslib) BSplSLib;
%nodefaultctor BSplSLib;
class BSplSLib {
	public:
		%feature("autodoc", "Args:
	UDeg(Standard_Integer)
	VDeg(Standard_Integer)
	N(Standard_Integer)
	M(Standard_Integer)
	Ders(Standard_Real)
	RDers(Standard_Real)
	All(Standard_Boolean)=Standard_True

Returns:
	static void

this is a one dimensional function  
 typedef  void (*EvaluatorFunction)  (  
 Standard_Integer     // Derivative Request  
 Standard_Real    *   // StartEnd[2][2]  
                      //  [0] = U  
                      //  [1] = V  
                      //        [0] = start  
                      //        [1] = end  
 Standard_Real        // UParameter  
 Standard_Real        // VParamerer  
 Standard_Real    &   // Result  
 Standard_Integer &) ;// Error Code  
 serves to multiply a given vectorial BSpline by a function  Computes  the     derivatives   of  a    ratio  of  
         two-variables functions  x(u,v) / w(u,v) at orders  
         <N,M>,    x(u,v)    is   a  vector in    dimension  
         <3>.  
 
         <Ders> is  an array  containing the values  of the  
         input derivatives from 0  to Min(<N>,<UDeg>), 0 to  
         Min(<M>,<VDeg>).    For orders    higher      than  
         <UDeg,VDeg>  the  input derivatives are assumed to  
         be 0.  
 
         The <Ders> is a 2d array and the  dimension of the  
         lines is always (<VDeg>+1) * (<3>+1), even  
         if   <N> is smaller  than  <Udeg> (the derivatives  
         higher than <N> are not used).  
 
         Content of <Ders> :  
 
         x(i,j)[k] means :  the composant  k of x derivated  
         (i) times in u and (j) times in v.  
 
         ... First line ...  
 
         x[1],x[2],...,x[3],w  
         x(0,1)[1],...,x(0,1)[3],w(1,0)  
         ...  
         x(0,VDeg)[1],...,x(0,VDeg)[3],w(0,VDeg)  
 
         ... Then second line ...  
 
         x(1,0)[1],...,x(1,0)[3],w(1,0)  
         x(1,1)[1],...,x(1,1)[3],w(1,1)  
         ...  
         x(1,VDeg)[1],...,x(1,VDeg)[3],w(1,VDeg)  
 
         ...  
 
         ... Last line ...  
 
         x(UDeg,0)[1],...,x(UDeg,0)[3],w(UDeg,0)  
         x(UDeg,1)[1],...,x(UDeg,1)[3],w(UDeg,1)  
         ...  
         x(Udeg,VDeg)[1],...,x(UDeg,VDeg)[3],w(Udeg,VDeg)  
 
 
 
         If <All>  is false, only  the derivative  at order  
         <N,M> is computed.  <RDers> is an  array of length  
         3 which will contain the result :  
 
         x(1)/w , x(2)/w ,  ... derivated <N> <M> times  
 
         If   <All>    is  true  multiples  derivatives are  
         computed. All the  derivatives (i,j) with 0 <= i+j  
         <= Max(N,M) are  computed.  <RDers> is an array of  
         length 3 *  (<N>+1)  * (<M>+1) which  will  
         contains :  
 
         x(1)/w , x(2)/w ,  ...  
         x(1)/w , x(2)/w ,  ... derivated <0,1> times  
         x(1)/w , x(2)/w ,  ... derivated <0,2> times  
         ...  
         x(1)/w , x(2)/w ,  ... derivated <0,N> times  
 
         x(1)/w , x(2)/w ,  ... derivated <1,0> times  
         x(1)/w , x(2)/w ,  ... derivated <1,1> times  
         ...  
         x(1)/w , x(2)/w ,  ... derivated <1,N> times  
 
         x(1)/w , x(2)/w ,  ... derivated <N,0> times  
         ....  
 Warning: <RDers> must be dimensionned properly.") RationalDerivative;
		static void RationalDerivative (const Standard_Integer UDeg,const Standard_Integer VDeg,const Standard_Integer N,const Standard_Integer M,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Boolean All = Standard_True);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	UIndex(Standard_Integer)
	VIndex(Standard_Integer)
	Poles(TColgp_Array2OfPnt)
	Weights(TColStd_Array2OfReal)
	UKnots(TColStd_Array1OfReal)
	VKnots(TColStd_Array1OfReal)
	UMults(TColStd_Array1OfInteger)
	VMults(TColStd_Array1OfInteger)
	UDegree(Standard_Integer)
	VDegree(Standard_Integer)
	URat(Standard_Boolean)
	VRat(Standard_Boolean)
	UPer(Standard_Boolean)
	VPer(Standard_Boolean)
	P(gp_Pnt)

Returns:
	static void

No detailed docstring for this function.") D0;
		static void D0 (const Standard_Real U,const Standard_Real V,const Standard_Integer UIndex,const Standard_Integer VIndex,const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,const TColStd_Array1OfReal & UKnots,const TColStd_Array1OfReal & VKnots,const TColStd_Array1OfInteger & UMults,const TColStd_Array1OfInteger & VMults,const Standard_Integer UDegree,const Standard_Integer VDegree,const Standard_Boolean URat,const Standard_Boolean VRat,const Standard_Boolean UPer,const Standard_Boolean VPer,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	UIndex(Standard_Integer)
	VIndex(Standard_Integer)
	Poles(TColgp_Array2OfPnt)
	Weights(TColStd_Array2OfReal)
	UKnots(TColStd_Array1OfReal)
	VKnots(TColStd_Array1OfReal)
	UMults(TColStd_Array1OfInteger)
	VMults(TColStd_Array1OfInteger)
	Degree(Standard_Integer)
	VDegree(Standard_Integer)
	URat(Standard_Boolean)
	VRat(Standard_Boolean)
	UPer(Standard_Boolean)
	VPer(Standard_Boolean)
	P(gp_Pnt)
	Vu(gp_Vec)
	Vv(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") D1;
		static void D1 (const Standard_Real U,const Standard_Real V,const Standard_Integer UIndex,const Standard_Integer VIndex,const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,const TColStd_Array1OfReal & UKnots,const TColStd_Array1OfReal & VKnots,const TColStd_Array1OfInteger & UMults,const TColStd_Array1OfInteger & VMults,const Standard_Integer Degree,const Standard_Integer VDegree,const Standard_Boolean URat,const Standard_Boolean VRat,const Standard_Boolean UPer,const Standard_Boolean VPer,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	UIndex(Standard_Integer)
	VIndex(Standard_Integer)
	Poles(TColgp_Array2OfPnt)
	Weights(TColStd_Array2OfReal)
	UKnots(TColStd_Array1OfReal)
	VKnots(TColStd_Array1OfReal)
	UMults(TColStd_Array1OfInteger)
	VMults(TColStd_Array1OfInteger)
	UDegree(Standard_Integer)
	VDegree(Standard_Integer)
	URat(Standard_Boolean)
	VRat(Standard_Boolean)
	UPer(Standard_Boolean)
	VPer(Standard_Boolean)
	P(gp_Pnt)
	Vu(gp_Vec)
	Vv(gp_Vec)
	Vuu(gp_Vec)
	Vvv(gp_Vec)
	Vuv(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") D2;
		static void D2 (const Standard_Real U,const Standard_Real V,const Standard_Integer UIndex,const Standard_Integer VIndex,const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,const TColStd_Array1OfReal & UKnots,const TColStd_Array1OfReal & VKnots,const TColStd_Array1OfInteger & UMults,const TColStd_Array1OfInteger & VMults,const Standard_Integer UDegree,const Standard_Integer VDegree,const Standard_Boolean URat,const Standard_Boolean VRat,const Standard_Boolean UPer,const Standard_Boolean VPer,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv,gp_Vec & Vuu,gp_Vec & Vvv,gp_Vec & Vuv);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	UIndex(Standard_Integer)
	VIndex(Standard_Integer)
	Poles(TColgp_Array2OfPnt)
	Weights(TColStd_Array2OfReal)
	UKnots(TColStd_Array1OfReal)
	VKnots(TColStd_Array1OfReal)
	UMults(TColStd_Array1OfInteger)
	VMults(TColStd_Array1OfInteger)
	UDegree(Standard_Integer)
	VDegree(Standard_Integer)
	URat(Standard_Boolean)
	VRat(Standard_Boolean)
	UPer(Standard_Boolean)
	VPer(Standard_Boolean)
	P(gp_Pnt)
	Vu(gp_Vec)
	Vv(gp_Vec)
	Vuu(gp_Vec)
	Vvv(gp_Vec)
	Vuv(gp_Vec)
	Vuuu(gp_Vec)
	Vvvv(gp_Vec)
	Vuuv(gp_Vec)
	Vuvv(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") D3;
		static void D3 (const Standard_Real U,const Standard_Real V,const Standard_Integer UIndex,const Standard_Integer VIndex,const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,const TColStd_Array1OfReal & UKnots,const TColStd_Array1OfReal & VKnots,const TColStd_Array1OfInteger & UMults,const TColStd_Array1OfInteger & VMults,const Standard_Integer UDegree,const Standard_Integer VDegree,const Standard_Boolean URat,const Standard_Boolean VRat,const Standard_Boolean UPer,const Standard_Boolean VPer,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv,gp_Vec & Vuu,gp_Vec & Vvv,gp_Vec & Vuv,gp_Vec & Vuuu,gp_Vec & Vvvv,gp_Vec & Vuuv,gp_Vec & Vuvv);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Nu(Standard_Integer)
	Nv(Standard_Integer)
	UIndex(Standard_Integer)
	VIndex(Standard_Integer)
	Poles(TColgp_Array2OfPnt)
	Weights(TColStd_Array2OfReal)
	UKnots(TColStd_Array1OfReal)
	VKnots(TColStd_Array1OfReal)
	UMults(TColStd_Array1OfInteger)
	VMults(TColStd_Array1OfInteger)
	UDegree(Standard_Integer)
	VDegree(Standard_Integer)
	URat(Standard_Boolean)
	VRat(Standard_Boolean)
	UPer(Standard_Boolean)
	VPer(Standard_Boolean)
	Vn(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") DN;
		static void DN (const Standard_Real U,const Standard_Real V,const Standard_Integer Nu,const Standard_Integer Nv,const Standard_Integer UIndex,const Standard_Integer VIndex,const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,const TColStd_Array1OfReal & UKnots,const TColStd_Array1OfReal & VKnots,const TColStd_Array1OfInteger & UMults,const TColStd_Array1OfInteger & VMults,const Standard_Integer UDegree,const Standard_Integer VDegree,const Standard_Boolean URat,const Standard_Boolean VRat,const Standard_Boolean UPer,const Standard_Boolean VPer,gp_Vec & Vn);
		%feature("autodoc", "Args:
	Param(Standard_Real)
	IsU(Standard_Boolean)
	Poles(TColgp_Array2OfPnt)
	Weights(TColStd_Array2OfReal)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	Degree(Standard_Integer)
	Periodic(Standard_Boolean)
	CPoles(TColgp_Array1OfPnt)
	CWeights(TColStd_Array1OfReal)

Returns:
	static void

Computes the  poles and weights of an isoparametric  
         curve at parameter  <Param> (UIso if <IsU> is True,  
         VIso  else).") Iso;
		static void Iso (const Standard_Real Param,const Standard_Boolean IsU,const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer Degree,const Standard_Boolean Periodic,TColgp_Array1OfPnt & CPoles,TColStd_Array1OfReal & CWeights);
		%feature("autodoc", "Args:
	Poles(TColgp_Array2OfPnt)
	Last(Standard_Integer)
	UDirection(Standard_Boolean)

Returns:
	static void

Reverses the array of poles. Last is the Index of  
         the new first Row( Col) of Poles.  
         On  a  non periodic surface Last is  
              Poles.Upper().  
         On a periodic curve last is  
              (number of flat knots - degree - 1)  
         or  
              (sum of multiplicities(but  for the last) + degree  
               - 1)") Reverse;
		static void Reverse (TColgp_Array2OfPnt & Poles,const Standard_Integer Last,const Standard_Boolean UDirection);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	UIndex(Standard_Integer)
	VIndex(Standard_Integer)
	Poles(TColgp_Array2OfPnt)
	Weights(TColStd_Array2OfReal)
	UKnots(TColStd_Array1OfReal)
	VKnots(TColStd_Array1OfReal)
	UMults(TColStd_Array1OfInteger)
	VMults(TColStd_Array1OfInteger)
	UDegree(Standard_Integer)
	VDegree(Standard_Integer)
	URat(Standard_Boolean)
	VRat(Standard_Boolean)
	UPer(Standard_Boolean)
	VPer(Standard_Boolean)
	W(Standard_Real)
	P(gp_Pnt)

Returns:
	static void

Makes an homogeneous  evaluation of Poles and Weights  
          any and returns in P the Numerator value and  
          in W the Denominator value if Weights are present  
          otherwise returns 1.0e0") HomogeneousD0;
		static void HomogeneousD0 (const Standard_Real U,const Standard_Real V,const Standard_Integer UIndex,const Standard_Integer VIndex,const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,const TColStd_Array1OfReal & UKnots,const TColStd_Array1OfReal & VKnots,const TColStd_Array1OfInteger & UMults,const TColStd_Array1OfInteger & VMults,const Standard_Integer UDegree,const Standard_Integer VDegree,const Standard_Boolean URat,const Standard_Boolean VRat,const Standard_Boolean UPer,const Standard_Boolean VPer,Standard_Real &OutValue,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	UIndex(Standard_Integer)
	VIndex(Standard_Integer)
	Poles(TColgp_Array2OfPnt)
	Weights(TColStd_Array2OfReal)
	UKnots(TColStd_Array1OfReal)
	VKnots(TColStd_Array1OfReal)
	UMults(TColStd_Array1OfInteger)
	VMults(TColStd_Array1OfInteger)
	UDegree(Standard_Integer)
	VDegree(Standard_Integer)
	URat(Standard_Boolean)
	VRat(Standard_Boolean)
	UPer(Standard_Boolean)
	VPer(Standard_Boolean)
	N(gp_Pnt)
	Nu(gp_Vec)
	Nv(gp_Vec)
	D(Standard_Real)
	Du(Standard_Real)
	Dv(Standard_Real)

Returns:
	static void

Makes an homogeneous  evaluation of Poles and Weights  
          any and returns in P the Numerator value and  
          in W the Denominator value if Weights are present  
          otherwise returns 1.0e0") HomogeneousD1;
		static void HomogeneousD1 (const Standard_Real U,const Standard_Real V,const Standard_Integer UIndex,const Standard_Integer VIndex,const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,const TColStd_Array1OfReal & UKnots,const TColStd_Array1OfReal & VKnots,const TColStd_Array1OfInteger & UMults,const TColStd_Array1OfInteger & VMults,const Standard_Integer UDegree,const Standard_Integer VDegree,const Standard_Boolean URat,const Standard_Boolean VRat,const Standard_Boolean UPer,const Standard_Boolean VPer,gp_Pnt & N,gp_Vec & Nu,gp_Vec & Nv,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Weights(TColStd_Array2OfReal)
	Last(Standard_Integer)
	UDirection(Standard_Boolean)

Returns:
	static void

Reverses the array of weights.") Reverse;
		static void Reverse (TColStd_Array2OfReal & Weights,const Standard_Integer Last,const Standard_Boolean UDirection);
		%feature("autodoc", "Args:
	Weights(TColStd_Array2OfReal)
	I1(Standard_Integer)
	I2(Standard_Integer)
	J1(Standard_Integer)
	J2(Standard_Integer)
	Epsilon(Standard_Real)=0.0

Returns:
	static Standard_Boolean

Returns False if all the weights  of the  array <Weights>  
  in the area [I1,I2] * [J1,J2] are  identic.  
  Epsilon  is used for comparing  weights.  
  If Epsilon  is 0. the  Epsilon of the first weight is used.") IsRational;
		static Standard_Boolean IsRational (const TColStd_Array2OfReal & Weights,const Standard_Integer I1,const Standard_Integer I2,const Standard_Integer J1,const Standard_Integer J2,const Standard_Real Epsilon = 0.0);
		%feature("autodoc", "Args:
	Poles(TColgp_Array2OfPnt)
	FP(TColStd_Array1OfReal)
	UDirection(Standard_Boolean)

Returns:
	static void

Copy in FP the coordinates of the poles.") SetPoles;
		static void SetPoles (const TColgp_Array2OfPnt & Poles,TColStd_Array1OfReal & FP,const Standard_Boolean UDirection);
		%feature("autodoc", "Args:
	Poles(TColgp_Array2OfPnt)
	Weights(TColStd_Array2OfReal)
	FP(TColStd_Array1OfReal)
	UDirection(Standard_Boolean)

Returns:
	static void

Copy in FP the coordinates of the poles.") SetPoles;
		static void SetPoles (const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,TColStd_Array1OfReal & FP,const Standard_Boolean UDirection);
		%feature("autodoc", "Args:
	FP(TColStd_Array1OfReal)
	Poles(TColgp_Array2OfPnt)
	UDirection(Standard_Boolean)

Returns:
	static void

Get from FP the coordinates of the poles.") GetPoles;
		static void GetPoles (const TColStd_Array1OfReal & FP,TColgp_Array2OfPnt & Poles,const Standard_Boolean UDirection);
		%feature("autodoc", "Args:
	FP(TColStd_Array1OfReal)
	Poles(TColgp_Array2OfPnt)
	Weights(TColStd_Array2OfReal)
	UDirection(Standard_Boolean)

Returns:
	static void

Get from FP the coordinates of the poles.") GetPoles;
		static void GetPoles (const TColStd_Array1OfReal & FP,TColgp_Array2OfPnt & Poles,TColStd_Array2OfReal & Weights,const Standard_Boolean UDirection);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Displ(gp_Vec)
	UIndex1(Standard_Integer)
	UIndex2(Standard_Integer)
	VIndex1(Standard_Integer)
	VIndex2(Standard_Integer)
	UDegree(Standard_Integer)
	VDegree(Standard_Integer)
	Rational(Standard_Boolean)
	Poles(TColgp_Array2OfPnt)
	Weights(TColStd_Array2OfReal)
	UFlatKnots(TColStd_Array1OfReal)
	VFlatKnots(TColStd_Array1OfReal)
	UFirstIndex(Standard_Integer)
	ULastIndex(Standard_Integer)
	VFirstIndex(Standard_Integer)
	VLastIndex(Standard_Integer)
	NewPoles(TColgp_Array2OfPnt)

Returns:
	static void

Find the new poles which allows an old point (with a  
         given u,v  as parameters)  to  reach a  new position  
         UIndex1,UIndex2 indicate the  range of poles we can  
         move for U  
         (1, UNbPoles-1) or (2, UNbPoles) -> no constraint  
         for one side in U  
         (2, UNbPoles-1)   -> the ends are enforced for U  
         don't enter (1,NbPoles) and (1,VNbPoles)  
               -> error: rigid move  
         if problem in BSplineBasis calculation, no change  
         for the curve  and  
             UFirstIndex, VLastIndex = 0  
             VFirstIndex, VLastIndex = 0") MovePoint;
		static void MovePoint (const Standard_Real U,const Standard_Real V,const gp_Vec & Displ,const Standard_Integer UIndex1,const Standard_Integer UIndex2,const Standard_Integer VIndex1,const Standard_Integer VIndex2,const Standard_Integer UDegree,const Standard_Integer VDegree,const Standard_Boolean Rational,const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,const TColStd_Array1OfReal & UFlatKnots,const TColStd_Array1OfReal & VFlatKnots,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,TColgp_Array2OfPnt & NewPoles);
		%feature("autodoc", "Args:
	UDirection(Standard_Boolean)
	Degree(Standard_Integer)
	Periodic(Standard_Boolean)
	Poles(TColgp_Array2OfPnt)
	Weights(TColStd_Array2OfReal)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	AddKnots(TColStd_Array1OfReal)
	AddMults(TColStd_Array1OfInteger)
	NewPoles(TColgp_Array2OfPnt)
	NewWeights(TColStd_Array2OfReal)
	NewKnots(TColStd_Array1OfReal)
	NewMults(TColStd_Array1OfInteger)
	Epsilon(Standard_Real)
	Add(Standard_Boolean)=Standard_True

Returns:
	static void

No detailed docstring for this function.") InsertKnots;
		static void InsertKnots (const Standard_Boolean UDirection,const Standard_Integer Degree,const Standard_Boolean Periodic,const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const TColStd_Array1OfReal & AddKnots,const TColStd_Array1OfInteger & AddMults,TColgp_Array2OfPnt & NewPoles,TColStd_Array2OfReal & NewWeights,TColStd_Array1OfReal & NewKnots,TColStd_Array1OfInteger & NewMults,const Standard_Real Epsilon,const Standard_Boolean Add = Standard_True);
		%feature("autodoc", "Args:
	UDirection(Standard_Boolean)
	Index(Standard_Integer)
	Mult(Standard_Integer)
	Degree(Standard_Integer)
	Periodic(Standard_Boolean)
	Poles(TColgp_Array2OfPnt)
	Weights(TColStd_Array2OfReal)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	NewPoles(TColgp_Array2OfPnt)
	NewWeights(TColStd_Array2OfReal)
	NewKnots(TColStd_Array1OfReal)
	NewMults(TColStd_Array1OfInteger)
	Tolerance(Standard_Real)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") RemoveKnot;
		static Standard_Boolean RemoveKnot (const Standard_Boolean UDirection,const Standard_Integer Index,const Standard_Integer Mult,const Standard_Integer Degree,const Standard_Boolean Periodic,const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,TColgp_Array2OfPnt & NewPoles,TColStd_Array2OfReal & NewWeights,TColStd_Array1OfReal & NewKnots,TColStd_Array1OfInteger & NewMults,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	UDirection(Standard_Boolean)
	Degree(Standard_Integer)
	NewDegree(Standard_Integer)
	Periodic(Standard_Boolean)
	Poles(TColgp_Array2OfPnt)
	Weights(TColStd_Array2OfReal)
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	NewPoles(TColgp_Array2OfPnt)
	NewWeights(TColStd_Array2OfReal)
	NewKnots(TColStd_Array1OfReal)
	NewMults(TColStd_Array1OfInteger)

Returns:
	static void

No detailed docstring for this function.") IncreaseDegree;
		static void IncreaseDegree (const Standard_Boolean UDirection,const Standard_Integer Degree,const Standard_Integer NewDegree,const Standard_Boolean Periodic,const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,TColgp_Array2OfPnt & NewPoles,TColStd_Array2OfReal & NewWeights,TColStd_Array1OfReal & NewKnots,TColStd_Array1OfInteger & NewMults);
		%feature("autodoc", "Args:
	UDirection(Standard_Boolean)
	Degree(Standard_Integer)
	Mults(TColStd_Array1OfInteger)
	Knots(TColStd_Array1OfReal)
	Poles(TColgp_Array2OfPnt)
	Weights(TColStd_Array2OfReal)
	NewMults(TColStd_Array1OfInteger)
	NewKnots(TColStd_Array1OfReal)
	NewPoles(TColgp_Array2OfPnt)
	NewWeights(TColStd_Array2OfReal)

Returns:
	static void

No detailed docstring for this function.") Unperiodize;
		static void Unperiodize (const Standard_Boolean UDirection,const Standard_Integer Degree,const TColStd_Array1OfInteger & Mults,const TColStd_Array1OfReal & Knots,const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,TColStd_Array1OfInteger & NewMults,TColStd_Array1OfReal & NewKnots,TColgp_Array2OfPnt & NewPoles,TColStd_Array2OfReal & NewWeights);
		%feature("autodoc", "Args:
	None
Returns:
	static TColStd_Array2OfReal

Used as argument for a non rational curve.") NoWeights;
		static TColStd_Array2OfReal & NoWeights ();
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	USpanDomain(Standard_Real)
	VSpanDomain(Standard_Real)
	UPeriodicFlag(Standard_Boolean)
	VPeriodicFlag(Standard_Boolean)
	UDegree(Standard_Integer)
	VDegree(Standard_Integer)
	UIndex(Standard_Integer)
	VIndex(Standard_Integer)
	UFlatKnots(TColStd_Array1OfReal)
	VFlatKnots(TColStd_Array1OfReal)
	Poles(TColgp_Array2OfPnt)
	Weights(TColStd_Array2OfReal)
	CachePoles(TColgp_Array2OfPnt)
	CacheWeights(TColStd_Array2OfReal)

Returns:
	static void

Perform the evaluation of the Taylor expansion  
         of the Bspline normalized between 0 and 1.  
         If rational computes the homogeneous Taylor expension  
         for the numerator and stores it in CachePoles") BuildCache;
		static void BuildCache (const Standard_Real U,const Standard_Real V,const Standard_Real USpanDomain,const Standard_Real VSpanDomain,const Standard_Boolean UPeriodicFlag,const Standard_Boolean VPeriodicFlag,const Standard_Integer UDegree,const Standard_Integer VDegree,const Standard_Integer UIndex,const Standard_Integer VIndex,const TColStd_Array1OfReal & UFlatKnots,const TColStd_Array1OfReal & VFlatKnots,const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,TColgp_Array2OfPnt & CachePoles,TColStd_Array2OfReal & CacheWeights);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	UDegree(Standard_Integer)
	VDegree(Standard_Integer)
	UCacheParameter(Standard_Real)
	VCacheParameter(Standard_Real)
	USpanLenght(Standard_Real)
	VSpanLength(Standard_Real)
	Poles(TColgp_Array2OfPnt)
	Weights(TColStd_Array2OfReal)
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
		static void CacheD0 (const Standard_Real U,const Standard_Real V,const Standard_Integer UDegree,const Standard_Integer VDegree,const Standard_Real UCacheParameter,const Standard_Real VCacheParameter,const Standard_Real USpanLenght,const Standard_Real VSpanLength,const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,gp_Pnt & Point);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Poles(TColgp_Array2OfPnt)
	Weights(TColStd_Array2OfReal)
	Point(gp_Pnt)

Returns:
	static void

Calls CacheD0 for Bezier Surfaces Arrays computed with  
         the method PolesCoefficients.  
 Warning: To be used for BezierSurfaces ONLY!!!") CoefsD0;
		static void CoefsD0 (const Standard_Real U,const Standard_Real V,const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,gp_Pnt & Point);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	UDegree(Standard_Integer)
	VDegree(Standard_Integer)
	UCacheParameter(Standard_Real)
	VCacheParameter(Standard_Real)
	USpanLenght(Standard_Real)
	VSpanLength(Standard_Real)
	Poles(TColgp_Array2OfPnt)
	Weights(TColStd_Array2OfReal)
	Point(gp_Pnt)
	VecU(gp_Vec)
	VecV(gp_Vec)

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
		static void CacheD1 (const Standard_Real U,const Standard_Real V,const Standard_Integer UDegree,const Standard_Integer VDegree,const Standard_Real UCacheParameter,const Standard_Real VCacheParameter,const Standard_Real USpanLenght,const Standard_Real VSpanLength,const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,gp_Pnt & Point,gp_Vec & VecU,gp_Vec & VecV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Poles(TColgp_Array2OfPnt)
	Weights(TColStd_Array2OfReal)
	Point(gp_Pnt)
	VecU(gp_Vec)
	VecV(gp_Vec)

Returns:
	static void

Calls CacheD0 for Bezier Surfaces Arrays computed with  
         the method PolesCoefficients.  
 Warning: To be used for BezierSurfaces ONLY!!!") CoefsD1;
		static void CoefsD1 (const Standard_Real U,const Standard_Real V,const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,gp_Pnt & Point,gp_Vec & VecU,gp_Vec & VecV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	UDegree(Standard_Integer)
	VDegree(Standard_Integer)
	UCacheParameter(Standard_Real)
	VCacheParameter(Standard_Real)
	USpanLenght(Standard_Real)
	VSpanLength(Standard_Real)
	Poles(TColgp_Array2OfPnt)
	Weights(TColStd_Array2OfReal)
	Point(gp_Pnt)
	VecU(gp_Vec)
	VecV(gp_Vec)
	VecUU(gp_Vec)
	VecUV(gp_Vec)
	VecVV(gp_Vec)

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
		static void CacheD2 (const Standard_Real U,const Standard_Real V,const Standard_Integer UDegree,const Standard_Integer VDegree,const Standard_Real UCacheParameter,const Standard_Real VCacheParameter,const Standard_Real USpanLenght,const Standard_Real VSpanLength,const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,gp_Pnt & Point,gp_Vec & VecU,gp_Vec & VecV,gp_Vec & VecUU,gp_Vec & VecUV,gp_Vec & VecVV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Poles(TColgp_Array2OfPnt)
	Weights(TColStd_Array2OfReal)
	Point(gp_Pnt)
	VecU(gp_Vec)
	VecV(gp_Vec)
	VecUU(gp_Vec)
	VecUV(gp_Vec)
	VecVV(gp_Vec)

Returns:
	static void

Calls CacheD0 for Bezier Surfaces Arrays computed with  
         the method PolesCoefficients.  
 Warning: To be used for BezierSurfaces ONLY!!!") CoefsD2;
		static void CoefsD2 (const Standard_Real U,const Standard_Real V,const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,gp_Pnt & Point,gp_Vec & VecU,gp_Vec & VecV,gp_Vec & VecUU,gp_Vec & VecUV,gp_Vec & VecVV);
		%feature("autodoc", "Args:
	Poles(TColgp_Array2OfPnt)
	CachePoles(TColgp_Array2OfPnt)

Returns:
	static void

Warning! To be used for BezierSurfaces ONLY!!!") PolesCoefficients;
		static void PolesCoefficients (const TColgp_Array2OfPnt & Poles,TColgp_Array2OfPnt & CachePoles);
		%feature("autodoc", "Args:
	Poles(TColgp_Array2OfPnt)
	Weights(TColStd_Array2OfReal)
	CachePoles(TColgp_Array2OfPnt)
	CacheWeights(TColStd_Array2OfReal)

Returns:
	static void

Encapsulation   of  BuildCache    to   perform   the  
         evaluation  of the Taylor expansion for beziersurfaces  
         at parameters 0.,0.;  
 Warning: To be used for BezierSurfaces ONLY!!!") PolesCoefficients;
		static void PolesCoefficients (const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,TColgp_Array2OfPnt & CachePoles,TColStd_Array2OfReal & CacheWeights);
		%feature("autodoc", "Args:
	Poles(TColgp_Array2OfPnt)
	Weights(TColStd_Array2OfReal)
	UKnots(TColStd_Array1OfReal)
	VKnots(TColStd_Array1OfReal)
	UMults(TColStd_Array1OfInteger)
	VMults(TColStd_Array1OfInteger)
	UDegree(Standard_Integer)
	VDegree(Standard_Integer)
	URat(Standard_Boolean)
	VRat(Standard_Boolean)
	UPer(Standard_Boolean)
	VPer(Standard_Boolean)
	Tolerance3D(Standard_Real)
	UTolerance(Standard_Real)
	VTolerance(Standard_Real)

Returns:
	static void

Given a tolerance in 3D space returns two  
         tolerances, one in U one in V such that for  
         all (u1,v1) and (u0,v0) in the domain of  
         the surface f(u,v)  we have :  
         | u1 - u0 | < UTolerance and  
         | v1 - v0 | < VTolerance  
         we have |f (u1,v1) - f (u0,v0)| < Tolerance3D") Resolution;
		static void Resolution (const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,const TColStd_Array1OfReal & UKnots,const TColStd_Array1OfReal & VKnots,const TColStd_Array1OfInteger & UMults,const TColStd_Array1OfInteger & VMults,const Standard_Integer UDegree,const Standard_Integer VDegree,const Standard_Boolean URat,const Standard_Boolean VRat,const Standard_Boolean UPer,const Standard_Boolean VPer,const Standard_Real Tolerance3D,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	UDegree(Standard_Integer)
	VDegree(Standard_Integer)
	UFlatKnots(TColStd_Array1OfReal)
	VFlatKnots(TColStd_Array1OfReal)
	UParameters(TColStd_Array1OfReal)
	VParameters(TColStd_Array1OfReal)
	Poles(TColgp_Array2OfPnt)
	Weights(TColStd_Array2OfReal)
	InversionProblem(Standard_Integer)

Returns:
	static void

Performs the interpolation of the data points given in  
                the   Poles       array      in   the      form  
           [1,...,RL][1,...,RC][1...PolesDimension]    .    The  
         ColLength CL and the Length of UParameters must be the  
         same. The length of VFlatKnots is VDegree + CL + 1.  
 
         The  RowLength RL and the Length of VParameters must be  
         the  same. The length of VFlatKnots is Degree + RL + 1.  
 
 Warning: the method used  to do that  interpolation  
         is gauss  elimination  WITHOUT pivoting.  Thus if  the  
         diagonal is not  dominant  there is no guarantee  that  
         the   algorithm will    work.  Nevertheless  for Cubic  
         interpolation  at knots or interpolation at Scheonberg  
         points  the method   will work.  The  InversionProblem  
         will  report 0 if there   was no problem  else it will  
         give the index of the faulty pivot") Interpolate;
		static void Interpolate (const Standard_Integer UDegree,const Standard_Integer VDegree,const TColStd_Array1OfReal & UFlatKnots,const TColStd_Array1OfReal & VFlatKnots,const TColStd_Array1OfReal & UParameters,const TColStd_Array1OfReal & VParameters,TColgp_Array2OfPnt & Poles,TColStd_Array2OfReal & Weights,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	UDegree(Standard_Integer)
	VDegree(Standard_Integer)
	UFlatKnots(TColStd_Array1OfReal)
	VFlatKnots(TColStd_Array1OfReal)
	UParameters(TColStd_Array1OfReal)
	VParameters(TColStd_Array1OfReal)
	Poles(TColgp_Array2OfPnt)
	InversionProblem(Standard_Integer)

Returns:
	static void

Performs the interpolation of the data points given in  
         the  Poles array.  
         The  ColLength CL and the Length of UParameters must be  
         the  same. The length of VFlatKnots is VDegree + CL + 1.  
 
         The  RowLength RL and the Length of VParameters must be  
         the  same. The length of VFlatKnots is Degree + RL + 1.  
 
Warning: the method used  to do that  interpolation  
         is gauss  elimination  WITHOUT pivoting.  Thus if  the  
         diagonal is not  dominant  there is no guarantee  that  
         the   algorithm will    work.  Nevertheless  for Cubic  
         interpolation  at knots or interpolation at Scheonberg  
         points  the method   will work.  The  InversionProblem  
         will  report 0 if there   was no problem  else it will  
         give the index of the faulty pivot") Interpolate;
		static void Interpolate (const Standard_Integer UDegree,const Standard_Integer VDegree,const TColStd_Array1OfReal & UFlatKnots,const TColStd_Array1OfReal & VFlatKnots,const TColStd_Array1OfReal & UParameters,const TColStd_Array1OfReal & VParameters,TColgp_Array2OfPnt & Poles,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	Function(BSplSLib_EvaluatorFunction)
	UBSplineDegree(Standard_Integer)
	VBSplineDegree(Standard_Integer)
	UBSplineKnots(TColStd_Array1OfReal)
	VBSplineKnots(TColStd_Array1OfReal)
	UMults(TColStd_Array1OfInteger)
	VMults(TColStd_Array1OfInteger)
	Poles(TColgp_Array2OfPnt)
	Weights(TColStd_Array2OfReal)
	UFlatKnots(TColStd_Array1OfReal)
	VFlatKnots(TColStd_Array1OfReal)
	UNewDegree(Standard_Integer)
	VNewDegree(Standard_Integer)
	NewNumerator(TColgp_Array2OfPnt)
	NewDenominator(TColStd_Array2OfReal)
	Status(Standard_Integer)

Returns:
	static void

this will multiply  a given BSpline numerator  N(u,v)  
            and    denominator    D(u,v)  defined     by   its  
            U/VBSplineDegree   and    U/VBSplineKnots,     and  
         U/VMults. Its Poles  and Weights are arrays which are  
               coded   as      array2      of      the    form  
           [1..UNumPoles][1..VNumPoles]  by  a function a(u,v)  
          which  is assumed  to satisfy    the following :  1.  
         a(u,v)  * N(u,v) and a(u,v) *  D(u,v)  is a polynomial  
         BSpline that can be expressed exactly as a BSpline of  
         degree U/VNewDegree  on  the knots U/VFlatKnots 2. the range  
          of a(u,v) is   the   same as  the range   of  N(u,v)  
          or D(u,v)  
         ---Warning:  it is   the caller's  responsability  to  
         insure that conditions 1. and  2. above are satisfied  
         : no  check  whatsoever is made   in  this method  --  
         Status will  return 0 if  OK else it will return  the  
           pivot index -- of the   matrix that was inverted to  
          compute the multiplied -- BSpline  : the method used  
          is  interpolation   at Schoenenberg   --  points  of  
         a(u,v)* N(u,v) and a(u,v) * D(u,v)  
Status will return 0 if OK else it will return the pivot index  
       of the matrix that was inverted to compute the multiplied  
       BSpline : the method used is interpolation at Schoenenberg  
       points of a(u,v)*F(u,v)  
            --") FunctionMultiply;
		static void FunctionMultiply (const BSplSLib_EvaluatorFunction & Function,const Standard_Integer UBSplineDegree,const Standard_Integer VBSplineDegree,const TColStd_Array1OfReal & UBSplineKnots,const TColStd_Array1OfReal & VBSplineKnots,const TColStd_Array1OfInteger & UMults,const TColStd_Array1OfInteger & VMults,const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,const TColStd_Array1OfReal & UFlatKnots,const TColStd_Array1OfReal & VFlatKnots,const Standard_Integer UNewDegree,const Standard_Integer VNewDegree,TColgp_Array2OfPnt & NewNumerator,TColStd_Array2OfReal & NewDenominator,Standard_Integer &OutValue);
};


%feature("shadow") BSplSLib::~BSplSLib %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BSplSLib {
	void _kill_pointed() {
		delete $self;
	}
};
