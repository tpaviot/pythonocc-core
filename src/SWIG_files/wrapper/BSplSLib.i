/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include BSplSLib_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(bsplslib) BSplSLib;
class BSplSLib {
	public:
		%feature("compactdefaultargs") RationalDerivative;
		%feature("autodoc", "	* this is a one dimensional function typedef void (*EvaluatorFunction) ( Standard_Integer // Derivative Request Standard_Real * // StartEnd[2][2] // [0] = U // [1] = V // [0] = start // [1] = end Standard_Real // UParameter Standard_Real // VParamerer Standard_Real & // Result Standard_Integer &) ;// Error Code serves to multiply a given vectorial BSpline by a function Computes the derivatives of a ratio of two-variables functions x(u,v) / w(u,v) at orders <N,M>, x(u,v) is a vector in dimension <3>. //! <Ders> is an array containing the values of the input derivatives from 0 to Min(<N>,<UDeg>), 0 to Min(<M>,<VDeg>). For orders higher than <UDeg,VDeg> the input derivatives are assumed to be 0. //! The <Ders> is a 2d array and the dimension of the lines is always (<VDeg>+1) * (<3>+1), even if <N> is smaller than <Udeg> (the derivatives higher than <N> are not used). //! Content of <Ders> : //! x(i,j)[k] means : the composant k of x derivated (i) times in u and (j) times in v. //! ... First line ... //! x[1],x[2],...,x[3],w x(0,1)[1],...,x(0,1)[3],w(1,0) ... x(0,VDeg)[1],...,x(0,VDeg)[3],w(0,VDeg) //! ... Then second line ... //! x(1,0)[1],...,x(1,0)[3],w(1,0) x(1,1)[1],...,x(1,1)[3],w(1,1) ... x(1,VDeg)[1],...,x(1,VDeg)[3],w(1,VDeg) //! ... //! ... Last line ... //! x(UDeg,0)[1],...,x(UDeg,0)[3],w(UDeg,0) x(UDeg,1)[1],...,x(UDeg,1)[3],w(UDeg,1) ... x(Udeg,VDeg)[1],...,x(UDeg,VDeg)[3],w(Udeg,VDeg) //! If <All> is false, only the derivative at order <N,M> is computed. <RDers> is an array of length 3 which will contain the result : //! x(1)/w , x(2)/w , ... derivated <N> <M> times //! If <All> is true multiples derivatives are computed. All the derivatives (i,j) with 0 <= i+j <= Max(N,M) are computed. <RDers> is an array of length 3 * (<N>+1) * (<M>+1) which will contains : //! x(1)/w , x(2)/w , ... x(1)/w , x(2)/w , ... derivated <0,1> times x(1)/w , x(2)/w , ... derivated <0,2> times ... x(1)/w , x(2)/w , ... derivated <0,N> times //! x(1)/w , x(2)/w , ... derivated <1,0> times x(1)/w , x(2)/w , ... derivated <1,1> times ... x(1)/w , x(2)/w , ... derivated <1,N> times //! x(1)/w , x(2)/w , ... derivated <N,0> times .... Warning: <RDers> must be dimensionned properly.

	:param UDeg:
	:type UDeg: int
	:param VDeg:
	:type VDeg: int
	:param N:
	:type N: int
	:param M:
	:type M: int
	:param Ders:
	:type Ders: float &
	:param RDers:
	:type RDers: float &
	:param All: default value is Standard_True
	:type All: bool
	:rtype: void
") RationalDerivative;
		static void RationalDerivative (const Standard_Integer UDeg,const Standard_Integer VDeg,const Standard_Integer N,const Standard_Integer M,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Boolean All = Standard_True);
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param UIndex:
	:type UIndex: int
	:param VIndex:
	:type VIndex: int
	:param Poles:
	:type Poles: TColgp_Array2OfPnt
	:param Weights:
	:type Weights: TColStd_Array2OfReal &
	:param UKnots:
	:type UKnots: TColStd_Array1OfReal &
	:param VKnots:
	:type VKnots: TColStd_Array1OfReal &
	:param UMults:
	:type UMults: TColStd_Array1OfInteger &
	:param VMults:
	:type VMults: TColStd_Array1OfInteger &
	:param UDegree:
	:type UDegree: int
	:param VDegree:
	:type VDegree: int
	:param URat:
	:type URat: bool
	:param VRat:
	:type VRat: bool
	:param UPer:
	:type UPer: bool
	:param VPer:
	:type VPer: bool
	:param P:
	:type P: gp_Pnt
	:rtype: void
") D0;
		static void D0 (const Standard_Real U,const Standard_Real V,const Standard_Integer UIndex,const Standard_Integer VIndex,const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,const TColStd_Array1OfReal & UKnots,const TColStd_Array1OfReal & VKnots,const TColStd_Array1OfInteger & UMults,const TColStd_Array1OfInteger & VMults,const Standard_Integer UDegree,const Standard_Integer VDegree,const Standard_Boolean URat,const Standard_Boolean VRat,const Standard_Boolean UPer,const Standard_Boolean VPer,gp_Pnt & P);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param UIndex:
	:type UIndex: int
	:param VIndex:
	:type VIndex: int
	:param Poles:
	:type Poles: TColgp_Array2OfPnt
	:param Weights:
	:type Weights: TColStd_Array2OfReal &
	:param UKnots:
	:type UKnots: TColStd_Array1OfReal &
	:param VKnots:
	:type VKnots: TColStd_Array1OfReal &
	:param UMults:
	:type UMults: TColStd_Array1OfInteger &
	:param VMults:
	:type VMults: TColStd_Array1OfInteger &
	:param Degree:
	:type Degree: int
	:param VDegree:
	:type VDegree: int
	:param URat:
	:type URat: bool
	:param VRat:
	:type VRat: bool
	:param UPer:
	:type UPer: bool
	:param VPer:
	:type VPer: bool
	:param P:
	:type P: gp_Pnt
	:param Vu:
	:type Vu: gp_Vec
	:param Vv:
	:type Vv: gp_Vec
	:rtype: void
") D1;
		static void D1 (const Standard_Real U,const Standard_Real V,const Standard_Integer UIndex,const Standard_Integer VIndex,const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,const TColStd_Array1OfReal & UKnots,const TColStd_Array1OfReal & VKnots,const TColStd_Array1OfInteger & UMults,const TColStd_Array1OfInteger & VMults,const Standard_Integer Degree,const Standard_Integer VDegree,const Standard_Boolean URat,const Standard_Boolean VRat,const Standard_Boolean UPer,const Standard_Boolean VPer,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param UIndex:
	:type UIndex: int
	:param VIndex:
	:type VIndex: int
	:param Poles:
	:type Poles: TColgp_Array2OfPnt
	:param Weights:
	:type Weights: TColStd_Array2OfReal &
	:param UKnots:
	:type UKnots: TColStd_Array1OfReal &
	:param VKnots:
	:type VKnots: TColStd_Array1OfReal &
	:param UMults:
	:type UMults: TColStd_Array1OfInteger &
	:param VMults:
	:type VMults: TColStd_Array1OfInteger &
	:param UDegree:
	:type UDegree: int
	:param VDegree:
	:type VDegree: int
	:param URat:
	:type URat: bool
	:param VRat:
	:type VRat: bool
	:param UPer:
	:type UPer: bool
	:param VPer:
	:type VPer: bool
	:param P:
	:type P: gp_Pnt
	:param Vu:
	:type Vu: gp_Vec
	:param Vv:
	:type Vv: gp_Vec
	:param Vuu:
	:type Vuu: gp_Vec
	:param Vvv:
	:type Vvv: gp_Vec
	:param Vuv:
	:type Vuv: gp_Vec
	:rtype: void
") D2;
		static void D2 (const Standard_Real U,const Standard_Real V,const Standard_Integer UIndex,const Standard_Integer VIndex,const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,const TColStd_Array1OfReal & UKnots,const TColStd_Array1OfReal & VKnots,const TColStd_Array1OfInteger & UMults,const TColStd_Array1OfInteger & VMults,const Standard_Integer UDegree,const Standard_Integer VDegree,const Standard_Boolean URat,const Standard_Boolean VRat,const Standard_Boolean UPer,const Standard_Boolean VPer,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv,gp_Vec & Vuu,gp_Vec & Vvv,gp_Vec & Vuv);
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param UIndex:
	:type UIndex: int
	:param VIndex:
	:type VIndex: int
	:param Poles:
	:type Poles: TColgp_Array2OfPnt
	:param Weights:
	:type Weights: TColStd_Array2OfReal &
	:param UKnots:
	:type UKnots: TColStd_Array1OfReal &
	:param VKnots:
	:type VKnots: TColStd_Array1OfReal &
	:param UMults:
	:type UMults: TColStd_Array1OfInteger &
	:param VMults:
	:type VMults: TColStd_Array1OfInteger &
	:param UDegree:
	:type UDegree: int
	:param VDegree:
	:type VDegree: int
	:param URat:
	:type URat: bool
	:param VRat:
	:type VRat: bool
	:param UPer:
	:type UPer: bool
	:param VPer:
	:type VPer: bool
	:param P:
	:type P: gp_Pnt
	:param Vu:
	:type Vu: gp_Vec
	:param Vv:
	:type Vv: gp_Vec
	:param Vuu:
	:type Vuu: gp_Vec
	:param Vvv:
	:type Vvv: gp_Vec
	:param Vuv:
	:type Vuv: gp_Vec
	:param Vuuu:
	:type Vuuu: gp_Vec
	:param Vvvv:
	:type Vvvv: gp_Vec
	:param Vuuv:
	:type Vuuv: gp_Vec
	:param Vuvv:
	:type Vuvv: gp_Vec
	:rtype: void
") D3;
		static void D3 (const Standard_Real U,const Standard_Real V,const Standard_Integer UIndex,const Standard_Integer VIndex,const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,const TColStd_Array1OfReal & UKnots,const TColStd_Array1OfReal & VKnots,const TColStd_Array1OfInteger & UMults,const TColStd_Array1OfInteger & VMults,const Standard_Integer UDegree,const Standard_Integer VDegree,const Standard_Boolean URat,const Standard_Boolean VRat,const Standard_Boolean UPer,const Standard_Boolean VPer,gp_Pnt & P,gp_Vec & Vu,gp_Vec & Vv,gp_Vec & Vuu,gp_Vec & Vvv,gp_Vec & Vuv,gp_Vec & Vuuu,gp_Vec & Vvvv,gp_Vec & Vuuv,gp_Vec & Vuvv);
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Nu:
	:type Nu: int
	:param Nv:
	:type Nv: int
	:param UIndex:
	:type UIndex: int
	:param VIndex:
	:type VIndex: int
	:param Poles:
	:type Poles: TColgp_Array2OfPnt
	:param Weights:
	:type Weights: TColStd_Array2OfReal &
	:param UKnots:
	:type UKnots: TColStd_Array1OfReal &
	:param VKnots:
	:type VKnots: TColStd_Array1OfReal &
	:param UMults:
	:type UMults: TColStd_Array1OfInteger &
	:param VMults:
	:type VMults: TColStd_Array1OfInteger &
	:param UDegree:
	:type UDegree: int
	:param VDegree:
	:type VDegree: int
	:param URat:
	:type URat: bool
	:param VRat:
	:type VRat: bool
	:param UPer:
	:type UPer: bool
	:param VPer:
	:type VPer: bool
	:param Vn:
	:type Vn: gp_Vec
	:rtype: void
") DN;
		static void DN (const Standard_Real U,const Standard_Real V,const Standard_Integer Nu,const Standard_Integer Nv,const Standard_Integer UIndex,const Standard_Integer VIndex,const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,const TColStd_Array1OfReal & UKnots,const TColStd_Array1OfReal & VKnots,const TColStd_Array1OfInteger & UMults,const TColStd_Array1OfInteger & VMults,const Standard_Integer UDegree,const Standard_Integer VDegree,const Standard_Boolean URat,const Standard_Boolean VRat,const Standard_Boolean UPer,const Standard_Boolean VPer,gp_Vec & Vn);
		%feature("compactdefaultargs") Iso;
		%feature("autodoc", "	* Computes the poles and weights of an isoparametric curve at parameter <Param> (UIso if <IsU> is True, VIso else).

	:param Param:
	:type Param: float
	:param IsU:
	:type IsU: bool
	:param Poles:
	:type Poles: TColgp_Array2OfPnt
	:param Weights:
	:type Weights: TColStd_Array2OfReal &
	:param Knots:
	:type Knots: TColStd_Array1OfReal &
	:param Mults:
	:type Mults: TColStd_Array1OfInteger &
	:param Degree:
	:type Degree: int
	:param Periodic:
	:type Periodic: bool
	:param CPoles:
	:type CPoles: TColgp_Array1OfPnt
	:param CWeights:
	:type CWeights: TColStd_Array1OfReal &
	:rtype: void
") Iso;
		static void Iso (const Standard_Real Param,const Standard_Boolean IsU,const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Integer Degree,const Standard_Boolean Periodic,TColgp_Array1OfPnt & CPoles,TColStd_Array1OfReal & CWeights);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	* Reverses the array of poles. Last is the Index of the new first Row( Col) of Poles. On a non periodic surface Last is Poles.Upper(). On a periodic curve last is (number of flat knots - degree - 1) or (sum of multiplicities(but for the last) + degree - 1)

	:param Poles:
	:type Poles: TColgp_Array2OfPnt
	:param Last:
	:type Last: int
	:param UDirection:
	:type UDirection: bool
	:rtype: void
") Reverse;
		static void Reverse (TColgp_Array2OfPnt & Poles,const Standard_Integer Last,const Standard_Boolean UDirection);
		%feature("compactdefaultargs") HomogeneousD0;
		%feature("autodoc", "	* Makes an homogeneous evaluation of Poles and Weights any and returns in P the Numerator value and in W the Denominator value if Weights are present otherwise returns 1.0e0

	:param U:
	:type U: float
	:param V:
	:type V: float
	:param UIndex:
	:type UIndex: int
	:param VIndex:
	:type VIndex: int
	:param Poles:
	:type Poles: TColgp_Array2OfPnt
	:param Weights:
	:type Weights: TColStd_Array2OfReal &
	:param UKnots:
	:type UKnots: TColStd_Array1OfReal &
	:param VKnots:
	:type VKnots: TColStd_Array1OfReal &
	:param UMults:
	:type UMults: TColStd_Array1OfInteger &
	:param VMults:
	:type VMults: TColStd_Array1OfInteger &
	:param UDegree:
	:type UDegree: int
	:param VDegree:
	:type VDegree: int
	:param URat:
	:type URat: bool
	:param VRat:
	:type VRat: bool
	:param UPer:
	:type UPer: bool
	:param VPer:
	:type VPer: bool
	:param W:
	:type W: float &
	:param P:
	:type P: gp_Pnt
	:rtype: void
") HomogeneousD0;
		static void HomogeneousD0 (const Standard_Real U,const Standard_Real V,const Standard_Integer UIndex,const Standard_Integer VIndex,const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,const TColStd_Array1OfReal & UKnots,const TColStd_Array1OfReal & VKnots,const TColStd_Array1OfInteger & UMults,const TColStd_Array1OfInteger & VMults,const Standard_Integer UDegree,const Standard_Integer VDegree,const Standard_Boolean URat,const Standard_Boolean VRat,const Standard_Boolean UPer,const Standard_Boolean VPer,Standard_Real &OutValue,gp_Pnt & P);
		%feature("compactdefaultargs") HomogeneousD1;
		%feature("autodoc", "	* Makes an homogeneous evaluation of Poles and Weights any and returns in P the Numerator value and in W the Denominator value if Weights are present otherwise returns 1.0e0

	:param U:
	:type U: float
	:param V:
	:type V: float
	:param UIndex:
	:type UIndex: int
	:param VIndex:
	:type VIndex: int
	:param Poles:
	:type Poles: TColgp_Array2OfPnt
	:param Weights:
	:type Weights: TColStd_Array2OfReal &
	:param UKnots:
	:type UKnots: TColStd_Array1OfReal &
	:param VKnots:
	:type VKnots: TColStd_Array1OfReal &
	:param UMults:
	:type UMults: TColStd_Array1OfInteger &
	:param VMults:
	:type VMults: TColStd_Array1OfInteger &
	:param UDegree:
	:type UDegree: int
	:param VDegree:
	:type VDegree: int
	:param URat:
	:type URat: bool
	:param VRat:
	:type VRat: bool
	:param UPer:
	:type UPer: bool
	:param VPer:
	:type VPer: bool
	:param N:
	:type N: gp_Pnt
	:param Nu:
	:type Nu: gp_Vec
	:param Nv:
	:type Nv: gp_Vec
	:param D:
	:type D: float &
	:param Du:
	:type Du: float &
	:param Dv:
	:type Dv: float &
	:rtype: void
") HomogeneousD1;
		static void HomogeneousD1 (const Standard_Real U,const Standard_Real V,const Standard_Integer UIndex,const Standard_Integer VIndex,const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,const TColStd_Array1OfReal & UKnots,const TColStd_Array1OfReal & VKnots,const TColStd_Array1OfInteger & UMults,const TColStd_Array1OfInteger & VMults,const Standard_Integer UDegree,const Standard_Integer VDegree,const Standard_Boolean URat,const Standard_Boolean VRat,const Standard_Boolean UPer,const Standard_Boolean VPer,gp_Pnt & N,gp_Vec & Nu,gp_Vec & Nv,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	* Reverses the array of weights.

	:param Weights:
	:type Weights: TColStd_Array2OfReal &
	:param Last:
	:type Last: int
	:param UDirection:
	:type UDirection: bool
	:rtype: void
") Reverse;
		static void Reverse (TColStd_Array2OfReal & Weights,const Standard_Integer Last,const Standard_Boolean UDirection);
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "	* Returns False if all the weights of the array <Weights> in the area [I1,I2] * [J1,J2] are identic. Epsilon is used for comparing weights. If Epsilon is 0. the Epsilon of the first weight is used.

	:param Weights:
	:type Weights: TColStd_Array2OfReal &
	:param I1:
	:type I1: int
	:param I2:
	:type I2: int
	:param J1:
	:type J1: int
	:param J2:
	:type J2: int
	:param Epsilon: default value is 0.0
	:type Epsilon: float
	:rtype: bool
") IsRational;
		static Standard_Boolean IsRational (const TColStd_Array2OfReal & Weights,const Standard_Integer I1,const Standard_Integer I2,const Standard_Integer J1,const Standard_Integer J2,const Standard_Real Epsilon = 0.0);
		%feature("compactdefaultargs") SetPoles;
		%feature("autodoc", "	* Copy in FP the coordinates of the poles.

	:param Poles:
	:type Poles: TColgp_Array2OfPnt
	:param FP:
	:type FP: TColStd_Array1OfReal &
	:param UDirection:
	:type UDirection: bool
	:rtype: void
") SetPoles;
		static void SetPoles (const TColgp_Array2OfPnt & Poles,TColStd_Array1OfReal & FP,const Standard_Boolean UDirection);
		%feature("compactdefaultargs") SetPoles;
		%feature("autodoc", "	* Copy in FP the coordinates of the poles.

	:param Poles:
	:type Poles: TColgp_Array2OfPnt
	:param Weights:
	:type Weights: TColStd_Array2OfReal &
	:param FP:
	:type FP: TColStd_Array1OfReal &
	:param UDirection:
	:type UDirection: bool
	:rtype: void
") SetPoles;
		static void SetPoles (const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,TColStd_Array1OfReal & FP,const Standard_Boolean UDirection);
		%feature("compactdefaultargs") GetPoles;
		%feature("autodoc", "	* Get from FP the coordinates of the poles.

	:param FP:
	:type FP: TColStd_Array1OfReal &
	:param Poles:
	:type Poles: TColgp_Array2OfPnt
	:param UDirection:
	:type UDirection: bool
	:rtype: void
") GetPoles;
		static void GetPoles (const TColStd_Array1OfReal & FP,TColgp_Array2OfPnt & Poles,const Standard_Boolean UDirection);
		%feature("compactdefaultargs") GetPoles;
		%feature("autodoc", "	* Get from FP the coordinates of the poles.

	:param FP:
	:type FP: TColStd_Array1OfReal &
	:param Poles:
	:type Poles: TColgp_Array2OfPnt
	:param Weights:
	:type Weights: TColStd_Array2OfReal &
	:param UDirection:
	:type UDirection: bool
	:rtype: void
") GetPoles;
		static void GetPoles (const TColStd_Array1OfReal & FP,TColgp_Array2OfPnt & Poles,TColStd_Array2OfReal & Weights,const Standard_Boolean UDirection);
		%feature("compactdefaultargs") MovePoint;
		%feature("autodoc", "	* Find the new poles which allows an old point (with a given u,v as parameters) to reach a new position UIndex1,UIndex2 indicate the range of poles we can move for U (1, UNbPoles-1) or (2, UNbPoles) -> no constraint for one side in U (2, UNbPoles-1) -> the ends are enforced for U don't enter (1,NbPoles) and (1,VNbPoles) -> error: rigid move if problem in BSplineBasis calculation, no change for the curve and UFirstIndex, VLastIndex = 0 VFirstIndex, VLastIndex = 0

	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Displ:
	:type Displ: gp_Vec
	:param UIndex1:
	:type UIndex1: int
	:param UIndex2:
	:type UIndex2: int
	:param VIndex1:
	:type VIndex1: int
	:param VIndex2:
	:type VIndex2: int
	:param UDegree:
	:type UDegree: int
	:param VDegree:
	:type VDegree: int
	:param Rational:
	:type Rational: bool
	:param Poles:
	:type Poles: TColgp_Array2OfPnt
	:param Weights:
	:type Weights: TColStd_Array2OfReal &
	:param UFlatKnots:
	:type UFlatKnots: TColStd_Array1OfReal &
	:param VFlatKnots:
	:type VFlatKnots: TColStd_Array1OfReal &
	:param UFirstIndex:
	:type UFirstIndex: int &
	:param ULastIndex:
	:type ULastIndex: int &
	:param VFirstIndex:
	:type VFirstIndex: int &
	:param VLastIndex:
	:type VLastIndex: int &
	:param NewPoles:
	:type NewPoles: TColgp_Array2OfPnt
	:rtype: void
") MovePoint;
		static void MovePoint (const Standard_Real U,const Standard_Real V,const gp_Vec & Displ,const Standard_Integer UIndex1,const Standard_Integer UIndex2,const Standard_Integer VIndex1,const Standard_Integer VIndex2,const Standard_Integer UDegree,const Standard_Integer VDegree,const Standard_Boolean Rational,const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,const TColStd_Array1OfReal & UFlatKnots,const TColStd_Array1OfReal & VFlatKnots,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,TColgp_Array2OfPnt & NewPoles);
		%feature("compactdefaultargs") InsertKnots;
		%feature("autodoc", "	:param UDirection:
	:type UDirection: bool
	:param Degree:
	:type Degree: int
	:param Periodic:
	:type Periodic: bool
	:param Poles:
	:type Poles: TColgp_Array2OfPnt
	:param Weights:
	:type Weights: TColStd_Array2OfReal &
	:param Knots:
	:type Knots: TColStd_Array1OfReal &
	:param Mults:
	:type Mults: TColStd_Array1OfInteger &
	:param AddKnots:
	:type AddKnots: TColStd_Array1OfReal &
	:param AddMults:
	:type AddMults: TColStd_Array1OfInteger &
	:param NewPoles:
	:type NewPoles: TColgp_Array2OfPnt
	:param NewWeights:
	:type NewWeights: TColStd_Array2OfReal &
	:param NewKnots:
	:type NewKnots: TColStd_Array1OfReal &
	:param NewMults:
	:type NewMults: TColStd_Array1OfInteger &
	:param Epsilon:
	:type Epsilon: float
	:param Add: default value is Standard_True
	:type Add: bool
	:rtype: void
") InsertKnots;
		static void InsertKnots (const Standard_Boolean UDirection,const Standard_Integer Degree,const Standard_Boolean Periodic,const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const TColStd_Array1OfReal & AddKnots,const TColStd_Array1OfInteger & AddMults,TColgp_Array2OfPnt & NewPoles,TColStd_Array2OfReal & NewWeights,TColStd_Array1OfReal & NewKnots,TColStd_Array1OfInteger & NewMults,const Standard_Real Epsilon,const Standard_Boolean Add = Standard_True);
		%feature("compactdefaultargs") RemoveKnot;
		%feature("autodoc", "	:param UDirection:
	:type UDirection: bool
	:param Index:
	:type Index: int
	:param Mult:
	:type Mult: int
	:param Degree:
	:type Degree: int
	:param Periodic:
	:type Periodic: bool
	:param Poles:
	:type Poles: TColgp_Array2OfPnt
	:param Weights:
	:type Weights: TColStd_Array2OfReal &
	:param Knots:
	:type Knots: TColStd_Array1OfReal &
	:param Mults:
	:type Mults: TColStd_Array1OfInteger &
	:param NewPoles:
	:type NewPoles: TColgp_Array2OfPnt
	:param NewWeights:
	:type NewWeights: TColStd_Array2OfReal &
	:param NewKnots:
	:type NewKnots: TColStd_Array1OfReal &
	:param NewMults:
	:type NewMults: TColStd_Array1OfInteger &
	:param Tolerance:
	:type Tolerance: float
	:rtype: bool
") RemoveKnot;
		static Standard_Boolean RemoveKnot (const Standard_Boolean UDirection,const Standard_Integer Index,const Standard_Integer Mult,const Standard_Integer Degree,const Standard_Boolean Periodic,const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,TColgp_Array2OfPnt & NewPoles,TColStd_Array2OfReal & NewWeights,TColStd_Array1OfReal & NewKnots,TColStd_Array1OfInteger & NewMults,const Standard_Real Tolerance);
		%feature("compactdefaultargs") IncreaseDegree;
		%feature("autodoc", "	:param UDirection:
	:type UDirection: bool
	:param Degree:
	:type Degree: int
	:param NewDegree:
	:type NewDegree: int
	:param Periodic:
	:type Periodic: bool
	:param Poles:
	:type Poles: TColgp_Array2OfPnt
	:param Weights:
	:type Weights: TColStd_Array2OfReal &
	:param Knots:
	:type Knots: TColStd_Array1OfReal &
	:param Mults:
	:type Mults: TColStd_Array1OfInteger &
	:param NewPoles:
	:type NewPoles: TColgp_Array2OfPnt
	:param NewWeights:
	:type NewWeights: TColStd_Array2OfReal &
	:param NewKnots:
	:type NewKnots: TColStd_Array1OfReal &
	:param NewMults:
	:type NewMults: TColStd_Array1OfInteger &
	:rtype: void
") IncreaseDegree;
		static void IncreaseDegree (const Standard_Boolean UDirection,const Standard_Integer Degree,const Standard_Integer NewDegree,const Standard_Boolean Periodic,const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,TColgp_Array2OfPnt & NewPoles,TColStd_Array2OfReal & NewWeights,TColStd_Array1OfReal & NewKnots,TColStd_Array1OfInteger & NewMults);
		%feature("compactdefaultargs") Unperiodize;
		%feature("autodoc", "	:param UDirection:
	:type UDirection: bool
	:param Degree:
	:type Degree: int
	:param Mults:
	:type Mults: TColStd_Array1OfInteger &
	:param Knots:
	:type Knots: TColStd_Array1OfReal &
	:param Poles:
	:type Poles: TColgp_Array2OfPnt
	:param Weights:
	:type Weights: TColStd_Array2OfReal &
	:param NewMults:
	:type NewMults: TColStd_Array1OfInteger &
	:param NewKnots:
	:type NewKnots: TColStd_Array1OfReal &
	:param NewPoles:
	:type NewPoles: TColgp_Array2OfPnt
	:param NewWeights:
	:type NewWeights: TColStd_Array2OfReal &
	:rtype: void
") Unperiodize;
		static void Unperiodize (const Standard_Boolean UDirection,const Standard_Integer Degree,const TColStd_Array1OfInteger & Mults,const TColStd_Array1OfReal & Knots,const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,TColStd_Array1OfInteger & NewMults,TColStd_Array1OfReal & NewKnots,TColgp_Array2OfPnt & NewPoles,TColStd_Array2OfReal & NewWeights);
		%feature("compactdefaultargs") NoWeights;
		%feature("autodoc", "	* Used as argument for a non rational curve.

	:rtype: TColStd_Array2OfReal
") NoWeights;
		static TColStd_Array2OfReal & NoWeights ();
		%feature("compactdefaultargs") BuildCache;
		%feature("autodoc", "	* Perform the evaluation of the Taylor expansion of the Bspline normalized between 0 and 1. If rational computes the homogeneous Taylor expension for the numerator and stores it in CachePoles

	:param U:
	:type U: float
	:param V:
	:type V: float
	:param USpanDomain:
	:type USpanDomain: float
	:param VSpanDomain:
	:type VSpanDomain: float
	:param UPeriodicFlag:
	:type UPeriodicFlag: bool
	:param VPeriodicFlag:
	:type VPeriodicFlag: bool
	:param UDegree:
	:type UDegree: int
	:param VDegree:
	:type VDegree: int
	:param UIndex:
	:type UIndex: int
	:param VIndex:
	:type VIndex: int
	:param UFlatKnots:
	:type UFlatKnots: TColStd_Array1OfReal &
	:param VFlatKnots:
	:type VFlatKnots: TColStd_Array1OfReal &
	:param Poles:
	:type Poles: TColgp_Array2OfPnt
	:param Weights:
	:type Weights: TColStd_Array2OfReal &
	:param CachePoles:
	:type CachePoles: TColgp_Array2OfPnt
	:param CacheWeights:
	:type CacheWeights: TColStd_Array2OfReal &
	:rtype: void
") BuildCache;
		static void BuildCache (const Standard_Real U,const Standard_Real V,const Standard_Real USpanDomain,const Standard_Real VSpanDomain,const Standard_Boolean UPeriodicFlag,const Standard_Boolean VPeriodicFlag,const Standard_Integer UDegree,const Standard_Integer VDegree,const Standard_Integer UIndex,const Standard_Integer VIndex,const TColStd_Array1OfReal & UFlatKnots,const TColStd_Array1OfReal & VFlatKnots,const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,TColgp_Array2OfPnt & CachePoles,TColStd_Array2OfReal & CacheWeights);
		%feature("compactdefaultargs") CacheD0;
		%feature("autodoc", "	* Perform the evaluation of the of the cache the parameter must be normalized between the 0 and 1 for the span. The Cache must be valid when calling this routine. Geom Package will insure that. and then multiplies by the weights this just evaluates the current point the CacheParameter is where the Cache was constructed the SpanLength is to normalize the polynomial in the cache to avoid bad conditioning effects

	:param U:
	:type U: float
	:param V:
	:type V: float
	:param UDegree:
	:type UDegree: int
	:param VDegree:
	:type VDegree: int
	:param UCacheParameter:
	:type UCacheParameter: float
	:param VCacheParameter:
	:type VCacheParameter: float
	:param USpanLenght:
	:type USpanLenght: float
	:param VSpanLength:
	:type VSpanLength: float
	:param Poles:
	:type Poles: TColgp_Array2OfPnt
	:param Weights:
	:type Weights: TColStd_Array2OfReal &
	:param Point:
	:type Point: gp_Pnt
	:rtype: void
") CacheD0;
		static void CacheD0 (const Standard_Real U,const Standard_Real V,const Standard_Integer UDegree,const Standard_Integer VDegree,const Standard_Real UCacheParameter,const Standard_Real VCacheParameter,const Standard_Real USpanLenght,const Standard_Real VSpanLength,const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,gp_Pnt & Point);
		%feature("compactdefaultargs") CoefsD0;
		%feature("autodoc", "	* Calls CacheD0 for Bezier Surfaces Arrays computed with the method PolesCoefficients. Warning: To be used for BezierSurfaces ONLY!!!

	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Poles:
	:type Poles: TColgp_Array2OfPnt
	:param Weights:
	:type Weights: TColStd_Array2OfReal &
	:param Point:
	:type Point: gp_Pnt
	:rtype: void
") CoefsD0;
		static void CoefsD0 (const Standard_Real U,const Standard_Real V,const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,gp_Pnt & Point);
		%feature("compactdefaultargs") CacheD1;
		%feature("autodoc", "	* Perform the evaluation of the of the cache the parameter must be normalized between the 0 and 1 for the span. The Cache must be valid when calling this routine. Geom Package will insure that. and then multiplies by the weights this just evaluates the current point the CacheParameter is where the Cache was constructed the SpanLength is to normalize the polynomial in the cache to avoid bad conditioning effects

	:param U:
	:type U: float
	:param V:
	:type V: float
	:param UDegree:
	:type UDegree: int
	:param VDegree:
	:type VDegree: int
	:param UCacheParameter:
	:type UCacheParameter: float
	:param VCacheParameter:
	:type VCacheParameter: float
	:param USpanLenght:
	:type USpanLenght: float
	:param VSpanLength:
	:type VSpanLength: float
	:param Poles:
	:type Poles: TColgp_Array2OfPnt
	:param Weights:
	:type Weights: TColStd_Array2OfReal &
	:param Point:
	:type Point: gp_Pnt
	:param VecU:
	:type VecU: gp_Vec
	:param VecV:
	:type VecV: gp_Vec
	:rtype: void
") CacheD1;
		static void CacheD1 (const Standard_Real U,const Standard_Real V,const Standard_Integer UDegree,const Standard_Integer VDegree,const Standard_Real UCacheParameter,const Standard_Real VCacheParameter,const Standard_Real USpanLenght,const Standard_Real VSpanLength,const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,gp_Pnt & Point,gp_Vec & VecU,gp_Vec & VecV);
		%feature("compactdefaultargs") CoefsD1;
		%feature("autodoc", "	* Calls CacheD0 for Bezier Surfaces Arrays computed with the method PolesCoefficients. Warning: To be used for BezierSurfaces ONLY!!!

	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Poles:
	:type Poles: TColgp_Array2OfPnt
	:param Weights:
	:type Weights: TColStd_Array2OfReal &
	:param Point:
	:type Point: gp_Pnt
	:param VecU:
	:type VecU: gp_Vec
	:param VecV:
	:type VecV: gp_Vec
	:rtype: void
") CoefsD1;
		static void CoefsD1 (const Standard_Real U,const Standard_Real V,const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,gp_Pnt & Point,gp_Vec & VecU,gp_Vec & VecV);
		%feature("compactdefaultargs") CacheD2;
		%feature("autodoc", "	* Perform the evaluation of the of the cache the parameter must be normalized between the 0 and 1 for the span. The Cache must be valid when calling this routine. Geom Package will insure that. and then multiplies by the weights this just evaluates the current point the CacheParameter is where the Cache was constructed the SpanLength is to normalize the polynomial in the cache to avoid bad conditioning effects

	:param U:
	:type U: float
	:param V:
	:type V: float
	:param UDegree:
	:type UDegree: int
	:param VDegree:
	:type VDegree: int
	:param UCacheParameter:
	:type UCacheParameter: float
	:param VCacheParameter:
	:type VCacheParameter: float
	:param USpanLenght:
	:type USpanLenght: float
	:param VSpanLength:
	:type VSpanLength: float
	:param Poles:
	:type Poles: TColgp_Array2OfPnt
	:param Weights:
	:type Weights: TColStd_Array2OfReal &
	:param Point:
	:type Point: gp_Pnt
	:param VecU:
	:type VecU: gp_Vec
	:param VecV:
	:type VecV: gp_Vec
	:param VecUU:
	:type VecUU: gp_Vec
	:param VecUV:
	:type VecUV: gp_Vec
	:param VecVV:
	:type VecVV: gp_Vec
	:rtype: void
") CacheD2;
		static void CacheD2 (const Standard_Real U,const Standard_Real V,const Standard_Integer UDegree,const Standard_Integer VDegree,const Standard_Real UCacheParameter,const Standard_Real VCacheParameter,const Standard_Real USpanLenght,const Standard_Real VSpanLength,const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,gp_Pnt & Point,gp_Vec & VecU,gp_Vec & VecV,gp_Vec & VecUU,gp_Vec & VecUV,gp_Vec & VecVV);
		%feature("compactdefaultargs") CoefsD2;
		%feature("autodoc", "	* Calls CacheD0 for Bezier Surfaces Arrays computed with the method PolesCoefficients. Warning: To be used for BezierSurfaces ONLY!!!

	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Poles:
	:type Poles: TColgp_Array2OfPnt
	:param Weights:
	:type Weights: TColStd_Array2OfReal &
	:param Point:
	:type Point: gp_Pnt
	:param VecU:
	:type VecU: gp_Vec
	:param VecV:
	:type VecV: gp_Vec
	:param VecUU:
	:type VecUU: gp_Vec
	:param VecUV:
	:type VecUV: gp_Vec
	:param VecVV:
	:type VecVV: gp_Vec
	:rtype: void
") CoefsD2;
		static void CoefsD2 (const Standard_Real U,const Standard_Real V,const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,gp_Pnt & Point,gp_Vec & VecU,gp_Vec & VecV,gp_Vec & VecUU,gp_Vec & VecUV,gp_Vec & VecVV);
		%feature("compactdefaultargs") PolesCoefficients;
		%feature("autodoc", "	* Warning! To be used for BezierSurfaces ONLY!!!

	:param Poles:
	:type Poles: TColgp_Array2OfPnt
	:param CachePoles:
	:type CachePoles: TColgp_Array2OfPnt
	:rtype: void
") PolesCoefficients;
		static void PolesCoefficients (const TColgp_Array2OfPnt & Poles,TColgp_Array2OfPnt & CachePoles);
		%feature("compactdefaultargs") PolesCoefficients;
		%feature("autodoc", "	* Encapsulation of BuildCache to perform the evaluation of the Taylor expansion for beziersurfaces at parameters 0.,0.; Warning: To be used for BezierSurfaces ONLY!!!

	:param Poles:
	:type Poles: TColgp_Array2OfPnt
	:param Weights:
	:type Weights: TColStd_Array2OfReal &
	:param CachePoles:
	:type CachePoles: TColgp_Array2OfPnt
	:param CacheWeights:
	:type CacheWeights: TColStd_Array2OfReal &
	:rtype: void
") PolesCoefficients;
		static void PolesCoefficients (const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,TColgp_Array2OfPnt & CachePoles,TColStd_Array2OfReal & CacheWeights);
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "	* Given a tolerance in 3D space returns two tolerances, one in U one in V such that for all (u1,v1) and (u0,v0) in the domain of the surface f(u,v) we have : | u1 - u0 | < UTolerance and | v1 - v0 | < VTolerance we have |f (u1,v1) - f (u0,v0)| < Tolerance3D

	:param Poles:
	:type Poles: TColgp_Array2OfPnt
	:param Weights:
	:type Weights: TColStd_Array2OfReal &
	:param UKnots:
	:type UKnots: TColStd_Array1OfReal &
	:param VKnots:
	:type VKnots: TColStd_Array1OfReal &
	:param UMults:
	:type UMults: TColStd_Array1OfInteger &
	:param VMults:
	:type VMults: TColStd_Array1OfInteger &
	:param UDegree:
	:type UDegree: int
	:param VDegree:
	:type VDegree: int
	:param URat:
	:type URat: bool
	:param VRat:
	:type VRat: bool
	:param UPer:
	:type UPer: bool
	:param VPer:
	:type VPer: bool
	:param Tolerance3D:
	:type Tolerance3D: float
	:param UTolerance:
	:type UTolerance: float &
	:param VTolerance:
	:type VTolerance: float &
	:rtype: void
") Resolution;
		static void Resolution (const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,const TColStd_Array1OfReal & UKnots,const TColStd_Array1OfReal & VKnots,const TColStd_Array1OfInteger & UMults,const TColStd_Array1OfInteger & VMults,const Standard_Integer UDegree,const Standard_Integer VDegree,const Standard_Boolean URat,const Standard_Boolean VRat,const Standard_Boolean UPer,const Standard_Boolean VPer,const Standard_Real Tolerance3D,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "	* Performs the interpolation of the data points given in the Poles array in the form [1,...,RL][1,...,RC][1...PolesDimension] . The ColLength CL and the Length of UParameters must be the same. The length of VFlatKnots is VDegree + CL + 1. //! The RowLength RL and the Length of VParameters must be the same. The length of VFlatKnots is Degree + RL + 1. //! Warning: the method used to do that interpolation is gauss elimination WITHOUT pivoting. Thus if the diagonal is not dominant there is no guarantee that the algorithm will work. Nevertheless for Cubic interpolation at knots or interpolation at Scheonberg points the method will work. The InversionProblem will report 0 if there was no problem else it will give the index of the faulty pivot

	:param UDegree:
	:type UDegree: int
	:param VDegree:
	:type VDegree: int
	:param UFlatKnots:
	:type UFlatKnots: TColStd_Array1OfReal &
	:param VFlatKnots:
	:type VFlatKnots: TColStd_Array1OfReal &
	:param UParameters:
	:type UParameters: TColStd_Array1OfReal &
	:param VParameters:
	:type VParameters: TColStd_Array1OfReal &
	:param Poles:
	:type Poles: TColgp_Array2OfPnt
	:param Weights:
	:type Weights: TColStd_Array2OfReal &
	:param InversionProblem:
	:type InversionProblem: int &
	:rtype: void
") Interpolate;
		static void Interpolate (const Standard_Integer UDegree,const Standard_Integer VDegree,const TColStd_Array1OfReal & UFlatKnots,const TColStd_Array1OfReal & VFlatKnots,const TColStd_Array1OfReal & UParameters,const TColStd_Array1OfReal & VParameters,TColgp_Array2OfPnt & Poles,TColStd_Array2OfReal & Weights,Standard_Integer &OutValue);
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "	* Performs the interpolation of the data points given in the Poles array. The ColLength CL and the Length of UParameters must be the same. The length of VFlatKnots is VDegree + CL + 1. //! The RowLength RL and the Length of VParameters must be the same. The length of VFlatKnots is Degree + RL + 1. //! Warning: the method used to do that interpolation is gauss elimination WITHOUT pivoting. Thus if the diagonal is not dominant there is no guarantee that the algorithm will work. Nevertheless for Cubic interpolation at knots or interpolation at Scheonberg points the method will work. The InversionProblem will report 0 if there was no problem else it will give the index of the faulty pivot

	:param UDegree:
	:type UDegree: int
	:param VDegree:
	:type VDegree: int
	:param UFlatKnots:
	:type UFlatKnots: TColStd_Array1OfReal &
	:param VFlatKnots:
	:type VFlatKnots: TColStd_Array1OfReal &
	:param UParameters:
	:type UParameters: TColStd_Array1OfReal &
	:param VParameters:
	:type VParameters: TColStd_Array1OfReal &
	:param Poles:
	:type Poles: TColgp_Array2OfPnt
	:param InversionProblem:
	:type InversionProblem: int &
	:rtype: void
") Interpolate;
		static void Interpolate (const Standard_Integer UDegree,const Standard_Integer VDegree,const TColStd_Array1OfReal & UFlatKnots,const TColStd_Array1OfReal & VFlatKnots,const TColStd_Array1OfReal & UParameters,const TColStd_Array1OfReal & VParameters,TColgp_Array2OfPnt & Poles,Standard_Integer &OutValue);
		%feature("compactdefaultargs") FunctionMultiply;
		%feature("autodoc", "	* this will multiply a given BSpline numerator N(u,v) and denominator D(u,v) defined by its U/VBSplineDegree and U/VBSplineKnots, and U/VMults. Its Poles and Weights are arrays which are coded as array2 of the form [1..UNumPoles][1..VNumPoles] by a function a(u,v) which is assumed to satisfy the following : 1. a(u,v) * N(u,v) and a(u,v) * D(u,v) is a polynomial BSpline that can be expressed exactly as a BSpline of degree U/VNewDegree on the knots U/VFlatKnots 2. the range of a(u,v) is the same as the range of N(u,v) or D(u,v) ---Warning: it is the caller's responsability to insure that conditions 1. and 2. above are satisfied : no check whatsoever is made in this method -- Status will return 0 if OK else it will return the pivot index -- of the matrix that was inverted to compute the multiplied -- BSpline : the method used is interpolation at Schoenenberg -- points of a(u,v)* N(u,v) and a(u,v) * D(u,v) Status will return 0 if OK else it will return the pivot index of the matrix that was inverted to compute the multiplied BSpline : the method used is interpolation at Schoenenberg points of a(u,v)*F(u,v) --

	:param Function:
	:type Function: BSplSLib_EvaluatorFunction &
	:param UBSplineDegree:
	:type UBSplineDegree: int
	:param VBSplineDegree:
	:type VBSplineDegree: int
	:param UBSplineKnots:
	:type UBSplineKnots: TColStd_Array1OfReal &
	:param VBSplineKnots:
	:type VBSplineKnots: TColStd_Array1OfReal &
	:param UMults:
	:type UMults: TColStd_Array1OfInteger &
	:param VMults:
	:type VMults: TColStd_Array1OfInteger &
	:param Poles:
	:type Poles: TColgp_Array2OfPnt
	:param Weights:
	:type Weights: TColStd_Array2OfReal &
	:param UFlatKnots:
	:type UFlatKnots: TColStd_Array1OfReal &
	:param VFlatKnots:
	:type VFlatKnots: TColStd_Array1OfReal &
	:param UNewDegree:
	:type UNewDegree: int
	:param VNewDegree:
	:type VNewDegree: int
	:param NewNumerator:
	:type NewNumerator: TColgp_Array2OfPnt
	:param NewDenominator:
	:type NewDenominator: TColStd_Array2OfReal &
	:param Status:
	:type Status: int &
	:rtype: void
") FunctionMultiply;
		static void FunctionMultiply (const BSplSLib_EvaluatorFunction & Function,const Standard_Integer UBSplineDegree,const Standard_Integer VBSplineDegree,const TColStd_Array1OfReal & UBSplineKnots,const TColStd_Array1OfReal & VBSplineKnots,const TColStd_Array1OfInteger & UMults,const TColStd_Array1OfInteger & VMults,const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,const TColStd_Array1OfReal & UFlatKnots,const TColStd_Array1OfReal & VFlatKnots,const Standard_Integer UNewDegree,const Standard_Integer VNewDegree,TColgp_Array2OfPnt & NewNumerator,TColStd_Array2OfReal & NewDenominator,Standard_Integer &OutValue);
};


%extend BSplSLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
