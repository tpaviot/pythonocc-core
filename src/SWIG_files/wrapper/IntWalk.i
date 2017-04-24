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
%module (package="OCC") IntWalk

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


%include IntWalk_headers.i


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
enum IntWalk_StatusDeflection {
	IntWalk_PasTropGrand = 0,
	IntWalk_PointConfondu = 1,
	IntWalk_ArretSurPointPrecedent = 2,
	IntWalk_ArretSurPoint = 3,
	IntWalk_OK = 4,
};

/* end public enums declaration */

%nodefaultctor IntWalk_PWalking;
class IntWalk_PWalking {
	public:
		%feature("compactdefaultargs") IntWalk_PWalking;
		%feature("autodoc", "	* Constructor used to set the data to compute intersection lines between Caro1 and Caro2. Deflection is the maximum deflection admitted between two consecutive points on the resulting polyline. TolTangency is the tolerance to find a tangent point. Func is the criterion which has to be evaluated at each solution point (each point of the line). It is necessary to call the Perform method to compute the intersection lines. The line found starts at a point on or in 2 natural domains of surfaces. It can be closed in the standard case if it is open it stops and begins at the border of one of the domains. If an open line stops at the middle of a domain, one stops at the tangent point. Epsilon is SquareTolerance of points confusion.

	:param Caro1:
	:type Caro1: Handle_Adaptor3d_HSurface &
	:param Caro2:
	:type Caro2: Handle_Adaptor3d_HSurface &
	:param TolTangency:
	:type TolTangency: float
	:param Epsilon:
	:type Epsilon: float
	:param Deflection:
	:type Deflection: float
	:param Increment:
	:type Increment: float
	:rtype: None
") IntWalk_PWalking;
		 IntWalk_PWalking (const Handle_Adaptor3d_HSurface & Caro1,const Handle_Adaptor3d_HSurface & Caro2,const Standard_Real TolTangency,const Standard_Real Epsilon,const Standard_Real Deflection,const Standard_Real Increment);
		%feature("compactdefaultargs") IntWalk_PWalking;
		%feature("autodoc", "	* Returns the intersection line containing the exact point Poin. This line is a polygonal line. Deflection is the maximum deflection admitted between two consecutive points on the resulting polyline. TolTangency is the tolerance to find a tangent point. Func is the criterion which has to be evaluated at each solution point (each point of the line). The line found starts at a point on or in 2 natural domains of surfaces. It can be closed in the standard case if it is open it stops and begins at the border of one of the domains. If an open line stops at the middle of a domain, one stops at the tangent point. Epsilon is SquareTolerance of points confusion.

	:param Caro1:
	:type Caro1: Handle_Adaptor3d_HSurface &
	:param Caro2:
	:type Caro2: Handle_Adaptor3d_HSurface &
	:param TolTangency:
	:type TolTangency: float
	:param Epsilon:
	:type Epsilon: float
	:param Deflection:
	:type Deflection: float
	:param Increment:
	:type Increment: float
	:param U1:
	:type U1: float
	:param V1:
	:type V1: float
	:param U2:
	:type U2: float
	:param V2:
	:type V2: float
	:rtype: None
") IntWalk_PWalking;
		 IntWalk_PWalking (const Handle_Adaptor3d_HSurface & Caro1,const Handle_Adaptor3d_HSurface & Caro2,const Standard_Real TolTangency,const Standard_Real Epsilon,const Standard_Real Deflection,const Standard_Real Increment,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* calculate the line of intersection

	:param ParDep:
	:type ParDep: TColStd_Array1OfReal &
	:rtype: None
") Perform;
		void Perform (const TColStd_Array1OfReal & ParDep);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* calculate the line of intersection. The regulation of steps is done using min and max values on u and v. (if this data is not presented as in the previous method, the initial steps are calculated starting from min and max uv of faces).

	:param ParDep:
	:type ParDep: TColStd_Array1OfReal &
	:param u1min:
	:type u1min: float
	:param v1min:
	:type v1min: float
	:param u2min:
	:type u2min: float
	:param v2min:
	:type v2min: float
	:param u1max:
	:type u1max: float
	:param v1max:
	:type v1max: float
	:param u2max:
	:type u2max: float
	:param v2max:
	:type v2max: float
	:rtype: None
") Perform;
		void Perform (const TColStd_Array1OfReal & ParDep,const Standard_Real u1min,const Standard_Real v1min,const Standard_Real u2min,const Standard_Real v2min,const Standard_Real u1max,const Standard_Real v1max,const Standard_Real u2max,const Standard_Real v2max);
		%feature("compactdefaultargs") PerformFirstPoint;
		%feature("autodoc", "	* calculate the first point of a line of intersection

	:param ParDep:
	:type ParDep: TColStd_Array1OfReal &
	:param FirstPoint:
	:type FirstPoint: IntSurf_PntOn2S &
	:rtype: bool
") PerformFirstPoint;
		Standard_Boolean PerformFirstPoint (const TColStd_Array1OfReal & ParDep,IntSurf_PntOn2S & FirstPoint);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns true if the calculus was successful.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "	* Returns the number of points of the resulting polyline. An exception is raised if IsDone returns False.

	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the point of range Index on the polyline. An exception is raised if IsDone returns False. An exception is raised if Index<=0 or Index>NbPoints.

	:param Index:
	:type Index: int
	:rtype: IntSurf_PntOn2S
") Value;
		const IntSurf_PntOn2S & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	:rtype: Handle_IntSurf_LineOn2S
") Line;
		Handle_IntSurf_LineOn2S Line ();
		%feature("compactdefaultargs") TangentAtFirst;
		%feature("autodoc", "	* Returns True if the surface are tangent at the first point of the line. An exception is raised if IsDone returns False.

	:rtype: bool
") TangentAtFirst;
		Standard_Boolean TangentAtFirst ();
		%feature("compactdefaultargs") TangentAtLast;
		%feature("autodoc", "	* Returns true if the surface are tangent at the last point of the line. An exception is raised if IsDone returns False.

	:rtype: bool
") TangentAtLast;
		Standard_Boolean TangentAtLast ();
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "	* Returns True if the line is closed. An exception is raised if IsDone returns False.

	:rtype: bool
") IsClosed;
		Standard_Boolean IsClosed ();
		%feature("compactdefaultargs") TangentAtLine;
		%feature("autodoc", "	:param Index:
	:type Index: int &
	:rtype: gp_Dir
") TangentAtLine;
		const gp_Dir  TangentAtLine (Standard_Integer &OutValue);
		%feature("compactdefaultargs") TestDeflection;
		%feature("autodoc", "	:rtype: IntWalk_StatusDeflection
") TestDeflection;
		IntWalk_StatusDeflection TestDeflection ();
		%feature("compactdefaultargs") TestArret;
		%feature("autodoc", "	:param DejaReparti:
	:type DejaReparti: bool
	:param Param:
	:type Param: TColStd_Array1OfReal &
	:param ChoixIso:
	:type ChoixIso: IntImp_ConstIsoparametric &
	:rtype: bool
") TestArret;
		Standard_Boolean TestArret (const Standard_Boolean DejaReparti,TColStd_Array1OfReal & Param,IntImp_ConstIsoparametric & ChoixIso);
		%feature("compactdefaultargs") RepartirOuDiviser;
		%feature("autodoc", "	:param DejaReparti:
	:type DejaReparti: bool
	:param ChoixIso:
	:type ChoixIso: IntImp_ConstIsoparametric &
	:param Arrive:
	:type Arrive: bool
	:rtype: None
") RepartirOuDiviser;
		void RepartirOuDiviser (Standard_Boolean &OutValue,IntImp_ConstIsoparametric & ChoixIso,Standard_Boolean &OutValue);
		%feature("compactdefaultargs") AddAPoint;
		%feature("autodoc", "	:param line:
	:type line: Handle_IntSurf_LineOn2S &
	:param POn2S:
	:type POn2S: IntSurf_PntOn2S &
	:rtype: None
") AddAPoint;
		void AddAPoint (Handle_IntSurf_LineOn2S & line,const IntSurf_PntOn2S & POn2S);
		%feature("compactdefaultargs") PutToBoundary;
		%feature("autodoc", "	:param theASurf1:
	:type theASurf1: Handle_Adaptor3d_HSurface &
	:param theASurf2:
	:type theASurf2: Handle_Adaptor3d_HSurface &
	:rtype: bool
") PutToBoundary;
		Standard_Boolean PutToBoundary (const Handle_Adaptor3d_HSurface & theASurf1,const Handle_Adaptor3d_HSurface & theASurf2);
		%feature("compactdefaultargs") SeekAdditionalPoints;
		%feature("autodoc", "	:param theASurf1:
	:type theASurf1: Handle_Adaptor3d_HSurface &
	:param theASurf2:
	:type theASurf2: Handle_Adaptor3d_HSurface &
	:param theMinNbPoints:
	:type theMinNbPoints: int
	:rtype: bool
") SeekAdditionalPoints;
		Standard_Boolean SeekAdditionalPoints (const Handle_Adaptor3d_HSurface & theASurf1,const Handle_Adaptor3d_HSurface & theASurf2,const Standard_Integer theMinNbPoints);
};


%extend IntWalk_PWalking {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntWalk_TheFunctionOfTheInt2S;
class IntWalk_TheFunctionOfTheInt2S : public math_FunctionSetWithDerivatives {
	public:
		%feature("compactdefaultargs") IntWalk_TheFunctionOfTheInt2S;
		%feature("autodoc", "	:rtype: None
") IntWalk_TheFunctionOfTheInt2S;
		 IntWalk_TheFunctionOfTheInt2S ();
		%feature("compactdefaultargs") IntWalk_TheFunctionOfTheInt2S;
		%feature("autodoc", "	:param S1:
	:type S1: Handle_Adaptor3d_HSurface &
	:param S2:
	:type S2: Handle_Adaptor3d_HSurface &
	:rtype: None
") IntWalk_TheFunctionOfTheInt2S;
		 IntWalk_TheFunctionOfTheInt2S (const Handle_Adaptor3d_HSurface & S1,const Handle_Adaptor3d_HSurface & S2);
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("compactdefaultargs") ComputeParameters;
		%feature("autodoc", "	:param ChoixIso:
	:type ChoixIso: IntImp_ConstIsoparametric
	:param Param:
	:type Param: TColStd_Array1OfReal &
	:param UVap:
	:type UVap: math_Vector &
	:param BornInf:
	:type BornInf: math_Vector &
	:param BornSup:
	:type BornSup: math_Vector &
	:param Tolerance:
	:type Tolerance: math_Vector &
	:rtype: None
") ComputeParameters;
		void ComputeParameters (const IntImp_ConstIsoparametric ChoixIso,const TColStd_Array1OfReal & Param,math_Vector & UVap,math_Vector & BornInf,math_Vector & BornSup,math_Vector & Tolerance);
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "	:rtype: float
") Root;
		Standard_Real Root ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:rtype: gp_Pnt
") Point;
		gp_Pnt Point ();
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "	:param UVap:
	:type UVap: math_Vector &
	:param Param:
	:type Param: TColStd_Array1OfReal &
	:param BestChoix:
	:type BestChoix: IntImp_ConstIsoparametric &
	:rtype: bool
") IsTangent;
		Standard_Boolean IsTangent (const math_Vector & UVap,TColStd_Array1OfReal & Param,IntImp_ConstIsoparametric & BestChoix);
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "	:rtype: gp_Dir
") Direction;
		gp_Dir Direction ();
		%feature("compactdefaultargs") DirectionOnS1;
		%feature("autodoc", "	:rtype: gp_Dir2d
") DirectionOnS1;
		gp_Dir2d DirectionOnS1 ();
		%feature("compactdefaultargs") DirectionOnS2;
		%feature("autodoc", "	:rtype: gp_Dir2d
") DirectionOnS2;
		gp_Dir2d DirectionOnS2 ();
		%feature("compactdefaultargs") AuxillarSurface1;
		%feature("autodoc", "	:rtype: Handle_Adaptor3d_HSurface
") AuxillarSurface1;
		Handle_Adaptor3d_HSurface AuxillarSurface1 ();
		%feature("compactdefaultargs") AuxillarSurface2;
		%feature("autodoc", "	:rtype: Handle_Adaptor3d_HSurface
") AuxillarSurface2;
		Handle_Adaptor3d_HSurface AuxillarSurface2 ();
};


%extend IntWalk_TheFunctionOfTheInt2S {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntWalk_TheInt2S;
class IntWalk_TheInt2S {
	public:
		%feature("compactdefaultargs") IntWalk_TheInt2S;
		%feature("autodoc", "	:rtype: None
") IntWalk_TheInt2S;
		 IntWalk_TheInt2S ();
		%feature("compactdefaultargs") IntWalk_TheInt2S;
		%feature("autodoc", "	:param Param:
	:type Param: TColStd_Array1OfReal &
	:param S1:
	:type S1: Handle_Adaptor3d_HSurface &
	:param S2:
	:type S2: Handle_Adaptor3d_HSurface &
	:param TolTangency:
	:type TolTangency: float
	:rtype: None
") IntWalk_TheInt2S;
		 IntWalk_TheInt2S (const TColStd_Array1OfReal & Param,const Handle_Adaptor3d_HSurface & S1,const Handle_Adaptor3d_HSurface & S2,const Standard_Real TolTangency);
		%feature("compactdefaultargs") IntWalk_TheInt2S;
		%feature("autodoc", "	:param S1:
	:type S1: Handle_Adaptor3d_HSurface &
	:param S2:
	:type S2: Handle_Adaptor3d_HSurface &
	:param TolTangency:
	:type TolTangency: float
	:rtype: None
") IntWalk_TheInt2S;
		 IntWalk_TheInt2S (const Handle_Adaptor3d_HSurface & S1,const Handle_Adaptor3d_HSurface & S2,const Standard_Real TolTangency);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Param:
	:type Param: TColStd_Array1OfReal &
	:param Rsnld:
	:type Rsnld: math_FunctionSetRoot &
	:rtype: IntImp_ConstIsoparametric
") Perform;
		IntImp_ConstIsoparametric Perform (const TColStd_Array1OfReal & Param,math_FunctionSetRoot & Rsnld);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Param:
	:type Param: TColStd_Array1OfReal &
	:param Rsnld:
	:type Rsnld: math_FunctionSetRoot &
	:param ChoixIso:
	:type ChoixIso: IntImp_ConstIsoparametric
	:rtype: IntImp_ConstIsoparametric
") Perform;
		IntImp_ConstIsoparametric Perform (const TColStd_Array1OfReal & Param,math_FunctionSetRoot & Rsnld,const IntImp_ConstIsoparametric ChoixIso);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:rtype: IntSurf_PntOn2S
") Point;
		const IntSurf_PntOn2S & Point ();
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "	:rtype: bool
") IsTangent;
		Standard_Boolean IsTangent ();
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "	:rtype: gp_Dir
") Direction;
		const gp_Dir  Direction ();
		%feature("compactdefaultargs") DirectionOnS1;
		%feature("autodoc", "	:rtype: gp_Dir2d
") DirectionOnS1;
		const gp_Dir2d  DirectionOnS1 ();
		%feature("compactdefaultargs") DirectionOnS2;
		%feature("autodoc", "	:rtype: gp_Dir2d
") DirectionOnS2;
		const gp_Dir2d  DirectionOnS2 ();
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "	:rtype: IntWalk_TheFunctionOfTheInt2S
") Function;
		IntWalk_TheFunctionOfTheInt2S & Function ();
		%feature("compactdefaultargs") ChangePoint;
		%feature("autodoc", "	:rtype: IntSurf_PntOn2S
") ChangePoint;
		IntSurf_PntOn2S & ChangePoint ();
};


%extend IntWalk_TheInt2S {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntWalk_WalkingData;
class IntWalk_WalkingData {
	public:
		float ustart;
		float vstart;
		int etat;
};


%extend IntWalk_WalkingData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
