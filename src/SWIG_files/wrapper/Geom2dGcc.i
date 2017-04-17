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
%module (package="OCC") Geom2dGcc

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


%include Geom2dGcc_headers.i


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
enum Geom2dGcc_Type1 {
	Geom2dGcc_CuCuCu = 0,
	Geom2dGcc_CiCuCu = 1,
	Geom2dGcc_CiCiCu = 2,
	Geom2dGcc_CiLiCu = 3,
	Geom2dGcc_LiLiCu = 4,
	Geom2dGcc_LiCuCu = 5,
};

enum Geom2dGcc_Type2 {
	Geom2dGcc_CuCuOnCu = 0,
	Geom2dGcc_CiCuOnCu = 1,
	Geom2dGcc_LiCuOnCu = 2,
	Geom2dGcc_CuPtOnCu = 3,
	Geom2dGcc_CuCuOnLi = 4,
	Geom2dGcc_CiCuOnLi = 5,
	Geom2dGcc_LiCuOnLi = 6,
	Geom2dGcc_CuPtOnLi = 7,
	Geom2dGcc_CuCuOnCi = 8,
	Geom2dGcc_CiCuOnCi = 9,
	Geom2dGcc_LiCuOnCi = 10,
	Geom2dGcc_CuPtOnCi = 11,
};

enum Geom2dGcc_Type3 {
	Geom2dGcc_CuCu = 0,
	Geom2dGcc_CiCu = 1,
};

/* end public enums declaration */

%rename(geom2dgcc) Geom2dGcc;
class Geom2dGcc {
	public:
		%feature("compactdefaultargs") Unqualified;
		%feature("autodoc", "	* Constructs such a qualified curve that the relative position of the solution computed by a construction algorithm using the qualified curve to the circle or line is not qualified, i.e. all solutions apply. Warning Obj is an adapted curve, i.e. an object which is an interface between: - the services provided by a 2D curve from the package Geom2d, - and those required on the curve by a computation algorithm. The adapted curve is created in the following way: Handle_Geom2d_Curve mycurve = ... ; Geom2dAdaptor_Curve Obj ( mycurve ) ; The qualified curve is then constructed with this object: Geom2dGcc_QualifiedCurve myQCurve = Geom2dGcc::Unqualified(Obj);

	:param Obj:
	:type Obj: Geom2dAdaptor_Curve &
	:rtype: Geom2dGcc_QualifiedCurve
") Unqualified;
		static Geom2dGcc_QualifiedCurve Unqualified (const Geom2dAdaptor_Curve & Obj);
		%feature("compactdefaultargs") Enclosing;
		%feature("autodoc", "	* Constructs such a qualified curve that the solution computed by a construction algorithm using the qualified curve encloses the curve. Warning Obj is an adapted curve, i.e. an object which is an interface between: - the services provided by a 2D curve from the package Geom2d, - and those required on the curve by a computation algorithm. The adapted curve is created in the following way: Handle_Geom2d_Curve mycurve = ... ; Geom2dAdaptor_Curve Obj ( mycurve ) ; The qualified curve is then constructed with this object: Geom2dGcc_QualifiedCurve myQCurve = Geom2dGcc::Enclosing(Obj);

	:param Obj:
	:type Obj: Geom2dAdaptor_Curve &
	:rtype: Geom2dGcc_QualifiedCurve
") Enclosing;
		static Geom2dGcc_QualifiedCurve Enclosing (const Geom2dAdaptor_Curve & Obj);
		%feature("compactdefaultargs") Enclosed;
		%feature("autodoc", "	* Constructs such a qualified curve that the solution computed by a construction algorithm using the qualified curve is enclosed by the curve. Warning Obj is an adapted curve, i.e. an object which is an interface between: - the services provided by a 2D curve from the package Geom2d, - and those required on the curve by a computation algorithm. The adapted curve is created in the following way: Handle_Geom2d_Curve mycurve = ... ; Geom2dAdaptor_Curve Obj ( mycurve ) ; The qualified curve is then constructed with this object: Geom2dGcc_QualifiedCurve myQCurve = Geom2dGcc::Enclosed(Obj);

	:param Obj:
	:type Obj: Geom2dAdaptor_Curve &
	:rtype: Geom2dGcc_QualifiedCurve
") Enclosed;
		static Geom2dGcc_QualifiedCurve Enclosed (const Geom2dAdaptor_Curve & Obj);
		%feature("compactdefaultargs") Outside;
		%feature("autodoc", "	* Constructs such a qualified curve that the solution computed by a construction algorithm using the qualified curve and the curve are external to one another. Warning Obj is an adapted curve, i.e. an object which is an interface between: - the services provided by a 2D curve from the package Geom2d, - and those required on the curve by a computation algorithm. The adapted curve is created in the following way: Handle_Geom2d_Curve mycurve = ... ; Geom2dAdaptor_Curve Obj ( mycurve ) ; The qualified curve is then constructed with this object: Geom2dGcc_QualifiedCurve myQCurve = Geom2dGcc::Outside(Obj);

	:param Obj:
	:type Obj: Geom2dAdaptor_Curve &
	:rtype: Geom2dGcc_QualifiedCurve
") Outside;
		static Geom2dGcc_QualifiedCurve Outside (const Geom2dAdaptor_Curve & Obj);
};


%extend Geom2dGcc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Geom2dGcc_Circ2d2TanOn;
class Geom2dGcc_Circ2d2TanOn {
	public:
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOn;
		%feature("autodoc", "	* This method implements the algorithms used to create 2d circles TANgent to two curves and having the center ON a 2d curve. Param1 is the initial guess on the first curve QualifiedCurv. Param1 is the initial guess on the second curve QualifiedCurv. ParamOn is the initial guess on the center curve OnCurv. Tolerance is used for the limit cases.

	:param Qualified1:
	:type Qualified1: Geom2dGcc_QualifiedCurve &
	:param Qualified2:
	:type Qualified2: Geom2dGcc_QualifiedCurve &
	:param OnCurve:
	:type OnCurve: Geom2dAdaptor_Curve &
	:param Tolerance:
	:type Tolerance: float
	:param Param1:
	:type Param1: float
	:param Param2:
	:type Param2: float
	:param ParamOn:
	:type ParamOn: float
	:rtype: None
") Geom2dGcc_Circ2d2TanOn;
		 Geom2dGcc_Circ2d2TanOn (const Geom2dGcc_QualifiedCurve & Qualified1,const Geom2dGcc_QualifiedCurve & Qualified2,const Geom2dAdaptor_Curve & OnCurve,const Standard_Real Tolerance,const Standard_Real Param1,const Standard_Real Param2,const Standard_Real ParamOn);
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOn;
		%feature("autodoc", "	* This method implements the algorithms used to create 2d circles TANgent to one curve and one point and having the center ON a 2d curve. Param1 is the initial guess on the first curve QualifiedCurv. ParamOn is the initial guess on the center curve OnCurv. Tolerance is used for the limit cases.

	:param Qualified1:
	:type Qualified1: Geom2dGcc_QualifiedCurve &
	:param Point:
	:type Point: Handle_Geom2d_Point &
	:param OnCurve:
	:type OnCurve: Geom2dAdaptor_Curve &
	:param Tolerance:
	:type Tolerance: float
	:param Param1:
	:type Param1: float
	:param ParamOn:
	:type ParamOn: float
	:rtype: None
") Geom2dGcc_Circ2d2TanOn;
		 Geom2dGcc_Circ2d2TanOn (const Geom2dGcc_QualifiedCurve & Qualified1,const Handle_Geom2d_Point & Point,const Geom2dAdaptor_Curve & OnCurve,const Standard_Real Tolerance,const Standard_Real Param1,const Standard_Real ParamOn);
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOn;
		%feature("autodoc", "	* This method implements the algorithms used to create 2d circles TANgent to two points and having the center ON a 2d curve. Tolerance is used for the limit cases.

	:param Point1:
	:type Point1: Handle_Geom2d_Point &
	:param Point2:
	:type Point2: Handle_Geom2d_Point &
	:param OnCurve:
	:type OnCurve: Geom2dAdaptor_Curve &
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Geom2dGcc_Circ2d2TanOn;
		 Geom2dGcc_Circ2d2TanOn (const Handle_Geom2d_Point & Point1,const Handle_Geom2d_Point & Point2,const Geom2dAdaptor_Curve & OnCurve,const Standard_Real Tolerance);
		%feature("compactdefaultargs") Results;
		%feature("autodoc", "	:param Circ:
	:type Circ: GccAna_Circ2d2TanOn &
	:rtype: None
") Results;
		void Results (const GccAna_Circ2d2TanOn & Circ);
		%feature("compactdefaultargs") Results;
		%feature("autodoc", "	:param Circ:
	:type Circ: Geom2dGcc_Circ2d2TanOnGeo &
	:rtype: None
") Results;
		void Results (const Geom2dGcc_Circ2d2TanOnGeo & Circ);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns true if the construction algorithm does not fail (even if it finds no solution). Note: IsDone protects against a failure arising from a more internal intersection algorithm, which has reached its numeric limits.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "	* This method returns the number of solutions. NotDone is raised if the algorithm failed.

	:rtype: int
") NbSolutions;
		Standard_Integer NbSolutions ();
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "	* Returns the solution number Index and raises OutOfRange exception if Index is greater than the number of solutions. Be carefull: the Index is only a way to get all the solutions, but is not associated to theses outside the context of the algorithm-object. Exceptions Standard_OutOfRange if Index is less than or equal to zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.

	:param Index:
	:type Index: int
	:rtype: gp_Circ2d
") ThisSolution;
		gp_Circ2d ThisSolution (const Standard_Integer Index);
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "	* It returns the informations about the qualifiers of the tangency arguments concerning the solution number Index. It returns the real qualifiers (the qualifiers given to the constructor method in case of enclosed, enclosing and outside and the qualifiers computedin case of unqualified). Exceptions Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.

	:param Index:
	:type Index: int
	:param Qualif1:
	:type Qualif1: GccEnt_Position &
	:param Qualif2:
	:type Qualif2: GccEnt_Position &
	:rtype: None
") WhichQualifier;
		void WhichQualifier (const Standard_Integer Index,GccEnt_Position & Qualif1,GccEnt_Position & Qualif2);
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "	* Returns informations about the tangency point between the result and the first argument. ParSol is the intrinsic parameter of the point PntSol on the solution curv. ParArg is the intrinsic parameter of the point PntSol on the argument curv.

	:param Index:
	:type Index: int
	:param ParSol:
	:type ParSol: float &
	:param ParArg:
	:type ParArg: float &
	:param PntSol:
	:type PntSol: gp_Pnt2d
	:rtype: None
") Tangency1;
		void Tangency1 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("compactdefaultargs") Tangency2;
		%feature("autodoc", "	* Returns informations about the tangency point between the result and the second argument. ParSol is the intrinsic parameter of the point PntSol on the solution curv. ParArg is the intrinsic parameter of the point PntSol on the argument curv.

	:param Index:
	:type Index: int
	:param ParSol:
	:type ParSol: float &
	:param ParArg:
	:type ParArg: float &
	:param PntSol:
	:type PntSol: gp_Pnt2d
	:rtype: None
") Tangency2;
		void Tangency2 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("compactdefaultargs") CenterOn3;
		%feature("autodoc", "	* Returns the center PntSol of the solution of index Index computed by this algorithm. ParArg is the parameter of the point PntSol on the third argument. Exceptions Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.

	:param Index:
	:type Index: int
	:param ParArg:
	:type ParArg: float &
	:param PntSol:
	:type PntSol: gp_Pnt2d
	:rtype: None
") CenterOn3;
		void CenterOn3 (const Standard_Integer Index,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("compactdefaultargs") IsTheSame1;
		%feature("autodoc", "	* Returns true if the solution of index Index and, respectively, the first or second argument of this algorithm are the same (i.e. there are 2 identical circles). If Rarg is the radius of the first or second argument, Rsol is the radius of the solution and dist is the distance between the two centers, we consider the two circles to be identical if |Rarg - Rsol| and dist are less than or equal to the tolerance criterion given at the time of construction of this algorithm. Exceptions Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.

	:param Index:
	:type Index: int
	:rtype: bool
") IsTheSame1;
		Standard_Boolean IsTheSame1 (const Standard_Integer Index);
		%feature("compactdefaultargs") IsTheSame2;
		%feature("autodoc", "	* Returns true if the solution of index Index and, respectively, the first or second argument of this algorithm are the same (i.e. there are 2 identical circles). If Rarg is the radius of the first or second argument, Rsol is the radius of the solution and dist is the distance between the two centers, we consider the two circles to be identical if |Rarg - Rsol| and dist are less than or equal to the tolerance criterion given at the time of construction of this algorithm. Exceptions Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.

	:param Index:
	:type Index: int
	:rtype: bool
") IsTheSame2;
		Standard_Boolean IsTheSame2 (const Standard_Integer Index);
};


%extend Geom2dGcc_Circ2d2TanOn {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Geom2dGcc_Circ2d2TanOnGeo;
class Geom2dGcc_Circ2d2TanOnGeo {
	public:
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnGeo;
		%feature("autodoc", "	* This method implements the algorithms used to create 2d circles TANgent to two 2d circles and having the center ON a curve.

	:param Qualified1:
	:type Qualified1: GccEnt_QualifiedCirc &
	:param Qualified2:
	:type Qualified2: GccEnt_QualifiedCirc &
	:param OnCurv:
	:type OnCurv: Geom2dAdaptor_Curve &
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Geom2dGcc_Circ2d2TanOnGeo;
		 Geom2dGcc_Circ2d2TanOnGeo (const GccEnt_QualifiedCirc & Qualified1,const GccEnt_QualifiedCirc & Qualified2,const Geom2dAdaptor_Curve & OnCurv,const Standard_Real Tolerance);
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnGeo;
		%feature("autodoc", "	* This method implements the algorithms used to create 2d circles TANgent to a 2d circle and a 2d line having the center ON a curve.

	:param Qualified1:
	:type Qualified1: GccEnt_QualifiedCirc &
	:param Qualified2:
	:type Qualified2: GccEnt_QualifiedLin &
	:param OnCurv:
	:type OnCurv: Geom2dAdaptor_Curve &
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Geom2dGcc_Circ2d2TanOnGeo;
		 Geom2dGcc_Circ2d2TanOnGeo (const GccEnt_QualifiedCirc & Qualified1,const GccEnt_QualifiedLin & Qualified2,const Geom2dAdaptor_Curve & OnCurv,const Standard_Real Tolerance);
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnGeo;
		%feature("autodoc", "	* This method implements the algorithms used to create 2d circles TANgent to a 2d circle and a point having the center ON a curve.

	:param Qualified1:
	:type Qualified1: GccEnt_QualifiedCirc &
	:param Point2:
	:type Point2: gp_Pnt2d
	:param OnCurv:
	:type OnCurv: Geom2dAdaptor_Curve &
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Geom2dGcc_Circ2d2TanOnGeo;
		 Geom2dGcc_Circ2d2TanOnGeo (const GccEnt_QualifiedCirc & Qualified1,const gp_Pnt2d & Point2,const Geom2dAdaptor_Curve & OnCurv,const Standard_Real Tolerance);
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnGeo;
		%feature("autodoc", "	* This method implements the algorithms used to create 2d circles TANgent to two 2d lines having the center ON a curve.

	:param Qualified1:
	:type Qualified1: GccEnt_QualifiedLin &
	:param Qualified2:
	:type Qualified2: GccEnt_QualifiedLin &
	:param OnCurv:
	:type OnCurv: Geom2dAdaptor_Curve &
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Geom2dGcc_Circ2d2TanOnGeo;
		 Geom2dGcc_Circ2d2TanOnGeo (const GccEnt_QualifiedLin & Qualified1,const GccEnt_QualifiedLin & Qualified2,const Geom2dAdaptor_Curve & OnCurv,const Standard_Real Tolerance);
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnGeo;
		%feature("autodoc", "	* This method implements the algorithms used to create 2d circles TANgent to a 2d line and a point having the center ON a 2d line.

	:param Qualified1:
	:type Qualified1: GccEnt_QualifiedLin &
	:param Qualified2:
	:type Qualified2: gp_Pnt2d
	:param OnCurv:
	:type OnCurv: Geom2dAdaptor_Curve &
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Geom2dGcc_Circ2d2TanOnGeo;
		 Geom2dGcc_Circ2d2TanOnGeo (const GccEnt_QualifiedLin & Qualified1,const gp_Pnt2d & Qualified2,const Geom2dAdaptor_Curve & OnCurv,const Standard_Real Tolerance);
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnGeo;
		%feature("autodoc", "	* This method implements the algorithms used to create 2d circles TANgent to two points having the center ON a 2d line.

	:param Point1:
	:type Point1: gp_Pnt2d
	:param Point2:
	:type Point2: gp_Pnt2d
	:param OnCurv:
	:type OnCurv: Geom2dAdaptor_Curve &
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Geom2dGcc_Circ2d2TanOnGeo;
		 Geom2dGcc_Circ2d2TanOnGeo (const gp_Pnt2d & Point1,const gp_Pnt2d & Point2,const Geom2dAdaptor_Curve & OnCurv,const Standard_Real Tolerance);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* This method returns True if the construction algorithm succeeded.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "	* This method returns the number of solutions. It raises NotDone if the construction algorithm didn't succeed.

	:rtype: int
") NbSolutions;
		Standard_Integer NbSolutions ();
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "	* Returns the solution number Index and raises OutOfRange exception if Index is greater than the number of solutions. Be careful: the Index is only a way to get all the solutions, but is not associated to those outside the context of the algorithm-object. It raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions.

	:param Index:
	:type Index: int
	:rtype: gp_Circ2d
") ThisSolution;
		gp_Circ2d ThisSolution (const Standard_Integer Index);
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "	* It returns the informations about the qualifiers of the tangency arguments concerning the solution number Index. It returns the real qualifiers (the qualifiers given to the constructor method in case of enclosed, enclosing and outside and the qualifiers computedin case of unqualified).

	:param Index:
	:type Index: int
	:param Qualif1:
	:type Qualif1: GccEnt_Position &
	:param Qualif2:
	:type Qualif2: GccEnt_Position &
	:rtype: None
") WhichQualifier;
		void WhichQualifier (const Standard_Integer Index,GccEnt_Position & Qualif1,GccEnt_Position & Qualif2);
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "	* Returns informations about the tangency point between the result number Index and the first argument. ParSol is the intrinsic parameter of the point on the solution curv. ParArg is the intrinsic parameter of the point on the argument curv. PntSol is the tangency point on the solution curv. PntArg is the tangency point on the argument curv. It raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions.

	:param Index:
	:type Index: int
	:param ParSol:
	:type ParSol: float &
	:param ParArg:
	:type ParArg: float &
	:param PntSol:
	:type PntSol: gp_Pnt2d
	:rtype: None
") Tangency1;
		void Tangency1 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("compactdefaultargs") Tangency2;
		%feature("autodoc", "	* Returns informations about the tangency point between the result number Index and the second argument. ParSol is the intrinsic parameter of the point on the solution curv. ParArg is the intrinsic parameter of the point on the argument curv. PntSol is the tangency point on the solution curv. PntArg is the tangency point on the argument curv. It raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions.

	:param Index:
	:type Index: int
	:param ParSol:
	:type ParSol: float &
	:param ParArg:
	:type ParArg: float &
	:param PntSol:
	:type PntSol: gp_Pnt2d
	:rtype: None
") Tangency2;
		void Tangency2 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("compactdefaultargs") CenterOn3;
		%feature("autodoc", "	* Returns informations about the center (on the curv) of the result. ParArg is the intrinsic parameter of the point on the argument curv. PntSol is the center point of the solution curv. It raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions.

	:param Index:
	:type Index: int
	:param ParArg:
	:type ParArg: float &
	:param PntSol:
	:type PntSol: gp_Pnt2d
	:rtype: None
") CenterOn3;
		void CenterOn3 (const Standard_Integer Index,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("compactdefaultargs") IsTheSame1;
		%feature("autodoc", "	* Returns True if the solution number Index is equal to the first argument and False in the other cases. It raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions.

	:param Index:
	:type Index: int
	:rtype: bool
") IsTheSame1;
		Standard_Boolean IsTheSame1 (const Standard_Integer Index);
		%feature("compactdefaultargs") IsTheSame2;
		%feature("autodoc", "	* Returns True if the solution number Index is equal to the second argument and False in the other cases. It raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions.

	:param Index:
	:type Index: int
	:rtype: bool
") IsTheSame2;
		Standard_Boolean IsTheSame2 (const Standard_Integer Index);
};


%extend Geom2dGcc_Circ2d2TanOnGeo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Geom2dGcc_Circ2d2TanOnIter;
class Geom2dGcc_Circ2d2TanOnIter {
	public:
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnIter;
		%feature("autodoc", "	* This method implements the algorithms used to create 2d circles TANgent to a 2d circle and a curve and having the center ON a 2d line. Param2 is the initial guess on the curve QualifiedCurv. Tolerance is used for the limit cases.

	:param Qualified1:
	:type Qualified1: GccEnt_QualifiedCirc &
	:param Qualified2:
	:type Qualified2: Geom2dGcc_QCurve &
	:param OnLine:
	:type OnLine: gp_Lin2d
	:param Param1:
	:type Param1: float
	:param Param2:
	:type Param2: float
	:param Param3:
	:type Param3: float
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Geom2dGcc_Circ2d2TanOnIter;
		 Geom2dGcc_Circ2d2TanOnIter (const GccEnt_QualifiedCirc & Qualified1,const Geom2dGcc_QCurve & Qualified2,const gp_Lin2d & OnLine,const Standard_Real Param1,const Standard_Real Param2,const Standard_Real Param3,const Standard_Real Tolerance);
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnIter;
		%feature("autodoc", "	* This method implements the algorithms used to create 2d circles TANgent to a 2d line and a curve and having the center ON a 2d line. Param2 is the initial guess on the curve QualifiedCurv. Tolerance is used for the limit cases.

	:param Qualified1:
	:type Qualified1: GccEnt_QualifiedLin &
	:param Qualified2:
	:type Qualified2: Geom2dGcc_QCurve &
	:param OnLine:
	:type OnLine: gp_Lin2d
	:param Param1:
	:type Param1: float
	:param Param2:
	:type Param2: float
	:param Param3:
	:type Param3: float
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Geom2dGcc_Circ2d2TanOnIter;
		 Geom2dGcc_Circ2d2TanOnIter (const GccEnt_QualifiedLin & Qualified1,const Geom2dGcc_QCurve & Qualified2,const gp_Lin2d & OnLine,const Standard_Real Param1,const Standard_Real Param2,const Standard_Real Param3,const Standard_Real Tolerance);
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnIter;
		%feature("autodoc", "	* This method implements the algorithms used to create 2d circles TANgent to two curves and having the center ON a 2d line. Param1 is the initial guess on the first QualifiedCurv. Param2 is the initial guess on the first QualifiedCurv. Tolerance is used for the limit cases.

	:param Qualified1:
	:type Qualified1: Geom2dGcc_QCurve &
	:param Qualified2:
	:type Qualified2: Geom2dGcc_QCurve &
	:param OnLine:
	:type OnLine: gp_Lin2d
	:param Param1:
	:type Param1: float
	:param Param2:
	:type Param2: float
	:param Param3:
	:type Param3: float
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Geom2dGcc_Circ2d2TanOnIter;
		 Geom2dGcc_Circ2d2TanOnIter (const Geom2dGcc_QCurve & Qualified1,const Geom2dGcc_QCurve & Qualified2,const gp_Lin2d & OnLine,const Standard_Real Param1,const Standard_Real Param2,const Standard_Real Param3,const Standard_Real Tolerance);
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnIter;
		%feature("autodoc", "	* This method implements the algorithms used to create 2d circles TANgent to a 2d point and a curve and having the center ON a 2d line. Param2 is the initial guess on the curve QualifiedCurv. Tolerance is used for the limit cases.

	:param Qualified1:
	:type Qualified1: Geom2dGcc_QCurve &
	:param Point2:
	:type Point2: gp_Pnt2d
	:param OnLine:
	:type OnLine: gp_Lin2d
	:param Param1:
	:type Param1: float
	:param Param2:
	:type Param2: float
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Geom2dGcc_Circ2d2TanOnIter;
		 Geom2dGcc_Circ2d2TanOnIter (const Geom2dGcc_QCurve & Qualified1,const gp_Pnt2d & Point2,const gp_Lin2d & OnLine,const Standard_Real Param1,const Standard_Real Param2,const Standard_Real Tolerance);
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnIter;
		%feature("autodoc", "	* This method implements the algorithms used to create 2d circles TANgent to a 2d circle and a curve and having the center ON a 2d circle. Param2 is the initial guess on the curve QualifiedCurv. Tolerance is used for the limit cases.

	:param Qualified1:
	:type Qualified1: GccEnt_QualifiedCirc &
	:param Qualified2:
	:type Qualified2: Geom2dGcc_QCurve &
	:param OnCirc:
	:type OnCirc: gp_Circ2d
	:param Param1:
	:type Param1: float
	:param Param2:
	:type Param2: float
	:param Param3:
	:type Param3: float
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Geom2dGcc_Circ2d2TanOnIter;
		 Geom2dGcc_Circ2d2TanOnIter (const GccEnt_QualifiedCirc & Qualified1,const Geom2dGcc_QCurve & Qualified2,const gp_Circ2d & OnCirc,const Standard_Real Param1,const Standard_Real Param2,const Standard_Real Param3,const Standard_Real Tolerance);
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnIter;
		%feature("autodoc", "	* This method implements the algorithms used to create 2d circles TANgent to a 2d line and a curve and having the center ON a 2d circle. Param2 is the initial guess on the curve QualifiedCurv. Tolerance is used for the limit cases.

	:param Qualified1:
	:type Qualified1: GccEnt_QualifiedLin &
	:param Qualified2:
	:type Qualified2: Geom2dGcc_QCurve &
	:param OnCirc:
	:type OnCirc: gp_Circ2d
	:param Param1:
	:type Param1: float
	:param Param2:
	:type Param2: float
	:param Param3:
	:type Param3: float
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Geom2dGcc_Circ2d2TanOnIter;
		 Geom2dGcc_Circ2d2TanOnIter (const GccEnt_QualifiedLin & Qualified1,const Geom2dGcc_QCurve & Qualified2,const gp_Circ2d & OnCirc,const Standard_Real Param1,const Standard_Real Param2,const Standard_Real Param3,const Standard_Real Tolerance);
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnIter;
		%feature("autodoc", "	* This method implements the algorithms used to create 2d circles TANgent to two curves and having the center ON a 2d circle. Param1 is the initial guess on the first QualifiedCurv. Param2 is the initial guess on the first QualifiedCurv. Tolerance is used for the limit cases.

	:param Qualified1:
	:type Qualified1: Geom2dGcc_QCurve &
	:param Qualified2:
	:type Qualified2: Geom2dGcc_QCurve &
	:param OnCirc:
	:type OnCirc: gp_Circ2d
	:param Param1:
	:type Param1: float
	:param Param2:
	:type Param2: float
	:param Param3:
	:type Param3: float
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Geom2dGcc_Circ2d2TanOnIter;
		 Geom2dGcc_Circ2d2TanOnIter (const Geom2dGcc_QCurve & Qualified1,const Geom2dGcc_QCurve & Qualified2,const gp_Circ2d & OnCirc,const Standard_Real Param1,const Standard_Real Param2,const Standard_Real Param3,const Standard_Real Tolerance);
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnIter;
		%feature("autodoc", "	* This method implements the algorithms used to create 2d circles TANgent to a 2d point and a curve and having the center ON a 2d circle. Param2 is the initial guess on the curve QualifiedCurv. Tolerance is used for the limit cases.

	:param Qualified1:
	:type Qualified1: Geom2dGcc_QCurve &
	:param Point2:
	:type Point2: gp_Pnt2d
	:param OnCirc:
	:type OnCirc: gp_Circ2d
	:param Param1:
	:type Param1: float
	:param Param2:
	:type Param2: float
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Geom2dGcc_Circ2d2TanOnIter;
		 Geom2dGcc_Circ2d2TanOnIter (const Geom2dGcc_QCurve & Qualified1,const gp_Pnt2d & Point2,const gp_Circ2d & OnCirc,const Standard_Real Param1,const Standard_Real Param2,const Standard_Real Tolerance);
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnIter;
		%feature("autodoc", "	* This method implements the algorithms used to create 2d circles TANgent to a 2d circle and a curve and having the center ON a 2d curve. Param2 is the initial guess on the curve QualifiedCurv. ParamOn is the initial guess on the center curve OnCurv. Tolerance is used for the limit cases.

	:param Qualified1:
	:type Qualified1: GccEnt_QualifiedCirc &
	:param Qualified2:
	:type Qualified2: Geom2dGcc_QCurve &
	:param OnCurv:
	:type OnCurv: Geom2dAdaptor_Curve &
	:param Param1:
	:type Param1: float
	:param Param2:
	:type Param2: float
	:param ParamOn:
	:type ParamOn: float
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Geom2dGcc_Circ2d2TanOnIter;
		 Geom2dGcc_Circ2d2TanOnIter (const GccEnt_QualifiedCirc & Qualified1,const Geom2dGcc_QCurve & Qualified2,const Geom2dAdaptor_Curve & OnCurv,const Standard_Real Param1,const Standard_Real Param2,const Standard_Real ParamOn,const Standard_Real Tolerance);
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnIter;
		%feature("autodoc", "	* This method implements the algorithms used to create 2d circles TANgent to a 2d line and a curve and having the center ON a 2d curve. Param2 is the initial guess on the curve QualifiedCurv. ParamOn is the initial guess on the center curve OnCurv. Tolerance is used for the limit cases.

	:param Qualified1:
	:type Qualified1: GccEnt_QualifiedLin &
	:param Qualified2:
	:type Qualified2: Geom2dGcc_QCurve &
	:param OnCurve:
	:type OnCurve: Geom2dAdaptor_Curve &
	:param Param1:
	:type Param1: float
	:param Param2:
	:type Param2: float
	:param ParamOn:
	:type ParamOn: float
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Geom2dGcc_Circ2d2TanOnIter;
		 Geom2dGcc_Circ2d2TanOnIter (const GccEnt_QualifiedLin & Qualified1,const Geom2dGcc_QCurve & Qualified2,const Geom2dAdaptor_Curve & OnCurve,const Standard_Real Param1,const Standard_Real Param2,const Standard_Real ParamOn,const Standard_Real Tolerance);
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnIter;
		%feature("autodoc", "	* This method implements the algorithms used to create 2d circles TANgent to a 2d Point and a curve and having the center ON a 2d curve. Param1 is the initial guess on the curve QualifiedCurv. ParamOn is the initial guess on the center curve OnCurv. Tolerance is used for the limit cases.

	:param Qualified1:
	:type Qualified1: Geom2dGcc_QCurve &
	:param Point2:
	:type Point2: gp_Pnt2d
	:param OnCurve:
	:type OnCurve: Geom2dAdaptor_Curve &
	:param Param1:
	:type Param1: float
	:param ParamOn:
	:type ParamOn: float
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Geom2dGcc_Circ2d2TanOnIter;
		 Geom2dGcc_Circ2d2TanOnIter (const Geom2dGcc_QCurve & Qualified1,const gp_Pnt2d & Point2,const Geom2dAdaptor_Curve & OnCurve,const Standard_Real Param1,const Standard_Real ParamOn,const Standard_Real Tolerance);
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnIter;
		%feature("autodoc", "	* This method implements the algorithms used to create 2d circles TANgent to two curves and having the center ON a 2d curve. Param1 is the initial guess on the first curve QualifiedCurv. Param1 is the initial guess on the second curve QualifiedCurv. ParamOn is the initial guess on the center curve OnCurv. Tolerance is used for the limit cases.

	:param Qualified1:
	:type Qualified1: Geom2dGcc_QCurve &
	:param Qualified2:
	:type Qualified2: Geom2dGcc_QCurve &
	:param OnCurve:
	:type OnCurve: Geom2dAdaptor_Curve &
	:param Param1:
	:type Param1: float
	:param Param2:
	:type Param2: float
	:param ParamOn:
	:type ParamOn: float
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Geom2dGcc_Circ2d2TanOnIter;
		 Geom2dGcc_Circ2d2TanOnIter (const Geom2dGcc_QCurve & Qualified1,const Geom2dGcc_QCurve & Qualified2,const Geom2dAdaptor_Curve & OnCurve,const Standard_Real Param1,const Standard_Real Param2,const Standard_Real ParamOn,const Standard_Real Tolerance);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* This method returns True if the construction algorithm succeeded.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "	* Returns the solution. It raises NotDone if the construction algorithm didn't succeed.

	:rtype: gp_Circ2d
") ThisSolution;
		gp_Circ2d ThisSolution ();
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "	:param Qualif1:
	:type Qualif1: GccEnt_Position &
	:param Qualif2:
	:type Qualif2: GccEnt_Position &
	:rtype: None
") WhichQualifier;
		void WhichQualifier (GccEnt_Position & Qualif1,GccEnt_Position & Qualif2);
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "	* Returns information about the tangency point between the result and the first argument. ParSol is the intrinsic parameter of the point PntSol on the solution curv. ParArg is the intrinsic parameter of the point PntSol on the argument curv. It raises NotDone if the construction algorithm didn't succeed.

	:param ParSol:
	:type ParSol: float &
	:param ParArg:
	:type ParArg: float &
	:param PntSol:
	:type PntSol: gp_Pnt2d
	:rtype: None
") Tangency1;
		void Tangency1 (Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("compactdefaultargs") Tangency2;
		%feature("autodoc", "	* Returns information about the tangency point between the result and the second argument. ParSol is the intrinsic parameter of the point PntSol on the solution curv. ParArg is the intrinsic parameter of the point PntSol on the argument curv. It raises NotDone if the construction algorithm didn't succeed.

	:param ParSol:
	:type ParSol: float &
	:param ParArg:
	:type ParArg: float &
	:param PntSol:
	:type PntSol: gp_Pnt2d
	:rtype: None
") Tangency2;
		void Tangency2 (Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("compactdefaultargs") CenterOn3;
		%feature("autodoc", "	* Returns information about the center (on the curv) of the result and the third argument. It raises NotDone if the construction algorithm didn't succeed.

	:param ParArg:
	:type ParArg: float &
	:param PntSol:
	:type PntSol: gp_Pnt2d
	:rtype: None
") CenterOn3;
		void CenterOn3 (Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("compactdefaultargs") IsTheSame1;
		%feature("autodoc", "	* It raises NotDone if the construction algorithm didn't succeed.

	:rtype: bool
") IsTheSame1;
		Standard_Boolean IsTheSame1 ();
		%feature("compactdefaultargs") IsTheSame2;
		%feature("autodoc", "	* It raises NotDone if the construction algorithm didn't succeed.

	:rtype: bool
") IsTheSame2;
		Standard_Boolean IsTheSame2 ();
};


%extend Geom2dGcc_Circ2d2TanOnIter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Geom2dGcc_Circ2d2TanRad;
class Geom2dGcc_Circ2d2TanRad {
	public:
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanRad;
		%feature("autodoc", "	:param Qualified1:
	:type Qualified1: Geom2dGcc_QualifiedCurve &
	:param Qualified2:
	:type Qualified2: Geom2dGcc_QualifiedCurve &
	:param Radius:
	:type Radius: float
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Geom2dGcc_Circ2d2TanRad;
		 Geom2dGcc_Circ2d2TanRad (const Geom2dGcc_QualifiedCurve & Qualified1,const Geom2dGcc_QualifiedCurve & Qualified2,const Standard_Real Radius,const Standard_Real Tolerance);
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanRad;
		%feature("autodoc", "	:param Qualified1:
	:type Qualified1: Geom2dGcc_QualifiedCurve &
	:param Point:
	:type Point: Handle_Geom2d_Point &
	:param Radius:
	:type Radius: float
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Geom2dGcc_Circ2d2TanRad;
		 Geom2dGcc_Circ2d2TanRad (const Geom2dGcc_QualifiedCurve & Qualified1,const Handle_Geom2d_Point & Point,const Standard_Real Radius,const Standard_Real Tolerance);
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanRad;
		%feature("autodoc", "	* These constructors create one or more 2D circles of radius Radius either - tangential to the 2 curves Qualified1 and Qualified2, or - tangential to the curve Qualified1 and passing through the point Point, or - passing through two points Point1 and Point2. Tolerance is a tolerance criterion used by the algorithm to find a solution when, mathematically, the problem posed does not have a solution, but where there is numeric uncertainty attached to the arguments. For example, take two circles C1 and C2, such that C2 is inside C1, and almost tangential to C1. There is, in fact, no point of intersection between C1 and C2. You now want to find a circle of radius R (smaller than the radius of C2), which is tangential to C1 and C2, and inside these two circles: a pure mathematical resolution will not find a solution. This is where the tolerance criterion is used: the algorithm considers that C1 and C2 are tangential if the shortest distance between these two circles is less than or equal to Tolerance. Thus, a solution is found by the algorithm. Exceptions GccEnt_BadQualifier if a qualifier is inconsistent with the argument it qualifies (for example, enclosing for a line). Standard_NegativeValue if Radius is negative.

	:param Point1:
	:type Point1: Handle_Geom2d_Point &
	:param Point2:
	:type Point2: Handle_Geom2d_Point &
	:param Radius:
	:type Radius: float
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Geom2dGcc_Circ2d2TanRad;
		 Geom2dGcc_Circ2d2TanRad (const Handle_Geom2d_Point & Point1,const Handle_Geom2d_Point & Point2,const Standard_Real Radius,const Standard_Real Tolerance);
		%feature("compactdefaultargs") Results;
		%feature("autodoc", "	:param Circ:
	:type Circ: GccAna_Circ2d2TanRad &
	:rtype: None
") Results;
		void Results (const GccAna_Circ2d2TanRad & Circ);
		%feature("compactdefaultargs") Results;
		%feature("autodoc", "	:param Circ:
	:type Circ: Geom2dGcc_Circ2d2TanRadGeo &
	:rtype: None
") Results;
		void Results (const Geom2dGcc_Circ2d2TanRadGeo & Circ);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* This method returns True if the algorithm succeeded. Note: IsDone protects against a failure arising from a more internal intersection algorithm, which has reached its numeric limits.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "	* This method returns the number of solutions. NotDone is raised if the algorithm failed. Exceptions StdFail_NotDone if the construction fails.

	:rtype: int
") NbSolutions;
		Standard_Integer NbSolutions ();
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "	* Returns the solution number Index and raises OutOfRange exception if Index is greater than the number of solutions. Be carefull: the Index is only a way to get all the solutions, but is not associated to theses outside the context of the algorithm-object. Warning This indexing simply provides a means of consulting the solutions. The index values are not associated with these solutions outside the context of the algorithm object. Exceptions Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.

	:param Index:
	:type Index: int
	:rtype: gp_Circ2d
") ThisSolution;
		gp_Circ2d ThisSolution (const Standard_Integer Index);
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "	* Returns the qualifiers Qualif1 and Qualif2 of the tangency arguments for the solution of index Index computed by this algorithm. The returned qualifiers are: - those specified at the start of construction when the solutions are defined as enclosed, enclosing or outside with respect to the arguments, or - those computed during construction (i.e. enclosed, enclosing or outside) when the solutions are defined as unqualified with respect to the arguments, or - GccEnt_noqualifier if the tangency argument is a point, or - GccEnt_unqualified in certain limit cases where it is impossible to qualify the solution as enclosed, enclosing or outside. Exceptions Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.

	:param Index:
	:type Index: int
	:param Qualif1:
	:type Qualif1: GccEnt_Position &
	:param Qualif2:
	:type Qualif2: GccEnt_Position &
	:rtype: None
") WhichQualifier;
		void WhichQualifier (const Standard_Integer Index,GccEnt_Position & Qualif1,GccEnt_Position & Qualif2);
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "	* Returns informations about the tangency point between the result number Index and the first argument. ParSol is the intrinsic parameter of the point PntSol on the solution curv. ParArg is the intrinsic parameter of the point PntSol on the argument curv. OutOfRange is raised if Index is greater than the number of solutions. notDone is raised if the construction algorithm did not succeed.

	:param Index:
	:type Index: int
	:param ParSol:
	:type ParSol: float &
	:param ParArg:
	:type ParArg: float &
	:param PntSol:
	:type PntSol: gp_Pnt2d
	:rtype: None
") Tangency1;
		void Tangency1 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("compactdefaultargs") Tangency2;
		%feature("autodoc", "	* Returns informations about the tangency point between the result number Index and the second argument. ParSol is the intrinsic parameter of the point PntSol on the solution curv. ParArg is the intrinsic parameter of the point PntSol on the argument curv. OutOfRange is raised if Index is greater than the number of solutions. notDone is raised if the construction algorithm did not succeed.

	:param Index:
	:type Index: int
	:param ParSol:
	:type ParSol: float &
	:param ParArg:
	:type ParArg: float &
	:param PntSol:
	:type PntSol: gp_Pnt2d
	:rtype: None
") Tangency2;
		void Tangency2 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("compactdefaultargs") IsTheSame1;
		%feature("autodoc", "	* Returns true if the solution of index Index and, respectively, the first or second argument of this algorithm are the same (i.e. there are 2 identical circles). If Rarg is the radius of the first or second argument, Rsol is the radius of the solution and dist is the distance between the two centers, we consider the two circles to be identical if |Rarg - Rsol| and dist are less than or equal to the tolerance criterion given at the time of construction of this algorithm. OutOfRange is raised if Index is greater than the number of solutions. notDone is raised if the construction algorithm did not succeed.

	:param Index:
	:type Index: int
	:rtype: bool
") IsTheSame1;
		Standard_Boolean IsTheSame1 (const Standard_Integer Index);
		%feature("compactdefaultargs") IsTheSame2;
		%feature("autodoc", "	* Returns true if the solution of index Index and, respectively, the first or second argument of this algorithm are the same (i.e. there are 2 identical circles). If Rarg is the radius of the first or second argument, Rsol is the radius of the solution and dist is the distance between the two centers, we consider the two circles to be identical if |Rarg - Rsol| and dist are less than or equal to the tolerance criterion given at the time of construction of this algorithm. OutOfRange is raised if Index is greater than the number of solutions. notDone is raised if the construction algorithm did not succeed.

	:param Index:
	:type Index: int
	:rtype: bool
") IsTheSame2;
		Standard_Boolean IsTheSame2 (const Standard_Integer Index);
};


%extend Geom2dGcc_Circ2d2TanRad {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Geom2dGcc_Circ2d2TanRadGeo;
class Geom2dGcc_Circ2d2TanRadGeo {
	public:
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanRadGeo;
		%feature("autodoc", "	* This method implements the algorithms used to create 2d circles TANgent to a 2d circle and a curve with a radius of Radius. It raises NegativeValue if Radius is lower than zero.

	:param Qualified1:
	:type Qualified1: GccEnt_QualifiedCirc &
	:param Qualified2:
	:type Qualified2: Geom2dGcc_QCurve &
	:param Radius:
	:type Radius: float
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Geom2dGcc_Circ2d2TanRadGeo;
		 Geom2dGcc_Circ2d2TanRadGeo (const GccEnt_QualifiedCirc & Qualified1,const Geom2dGcc_QCurve & Qualified2,const Standard_Real Radius,const Standard_Real Tolerance);
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanRadGeo;
		%feature("autodoc", "	* This method implements the algorithms used to create 2d circles TANgent to a 2d line and a curve with a radius of Radius. It raises NegativeValue if Radius is lower than zero.

	:param Qualified1:
	:type Qualified1: GccEnt_QualifiedLin &
	:param Qualified2:
	:type Qualified2: Geom2dGcc_QCurve &
	:param Radius:
	:type Radius: float
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Geom2dGcc_Circ2d2TanRadGeo;
		 Geom2dGcc_Circ2d2TanRadGeo (const GccEnt_QualifiedLin & Qualified1,const Geom2dGcc_QCurve & Qualified2,const Standard_Real Radius,const Standard_Real Tolerance);
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanRadGeo;
		%feature("autodoc", "	* This method implements the algorithms used to create 2d circles TANgent to two curves with a radius of Radius. It raises NegativeValue if Radius is lower than zero.

	:param Qualified1:
	:type Qualified1: Geom2dGcc_QCurve &
	:param Qualified2:
	:type Qualified2: Geom2dGcc_QCurve &
	:param Radius:
	:type Radius: float
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Geom2dGcc_Circ2d2TanRadGeo;
		 Geom2dGcc_Circ2d2TanRadGeo (const Geom2dGcc_QCurve & Qualified1,const Geom2dGcc_QCurve & Qualified2,const Standard_Real Radius,const Standard_Real Tolerance);
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanRadGeo;
		%feature("autodoc", "	* This method implements the algorithms used to create 2d circles TANgent to a curve and a point with a radius of Radius. It raises NegativeValue if Radius is lower than zero.

	:param Qualified1:
	:type Qualified1: Geom2dGcc_QCurve &
	:param Point2:
	:type Point2: gp_Pnt2d
	:param Radius:
	:type Radius: float
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Geom2dGcc_Circ2d2TanRadGeo;
		 Geom2dGcc_Circ2d2TanRadGeo (const Geom2dGcc_QCurve & Qualified1,const gp_Pnt2d & Point2,const Standard_Real Radius,const Standard_Real Tolerance);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* This method returns True if the algorithm succeeded.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "	* This method returns the number of solutions. It raises NotDone if the algorithm failed.

	:rtype: int
") NbSolutions;
		Standard_Integer NbSolutions ();
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "	* Returns the solution number Index. Be careful: the Index is only a way to get all the solutions, but is not associated to those outside the context of the algorithm-object. It raises OutOfRange exception if Index is greater than the number of solutions. It raises NotDone if the construction algorithm did not succeed.

	:param Index:
	:type Index: int
	:rtype: gp_Circ2d
") ThisSolution;
		gp_Circ2d ThisSolution (const Standard_Integer Index);
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "	* It returns the information about the qualifiers of the tangency arguments concerning the solution number Index. It returns the real qualifiers (the qualifiers given to the constructor method in case of enclosed, enclosing and outside and the qualifiers computedin case of unqualified).

	:param Index:
	:type Index: int
	:param Qualif1:
	:type Qualif1: GccEnt_Position &
	:param Qualif2:
	:type Qualif2: GccEnt_Position &
	:rtype: None
") WhichQualifier;
		void WhichQualifier (const Standard_Integer Index,GccEnt_Position & Qualif1,GccEnt_Position & Qualif2);
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "	* Returns information about the tangency point between the result number Index and the first argument. ParSol is the intrinsic parameter of the point PntSol on the solution. ParArg is the intrinsic parameter of the point PntSol on the first argument. It raises OutOfRange if Index is greater than the number of solutions. It raises NotDone if the construction algorithm did not succeed.

	:param Index:
	:type Index: int
	:param ParSol:
	:type ParSol: float &
	:param ParArg:
	:type ParArg: float &
	:param PntSol:
	:type PntSol: gp_Pnt2d
	:rtype: None
") Tangency1;
		void Tangency1 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("compactdefaultargs") Tangency2;
		%feature("autodoc", "	* Returns information about the tangency point between the result number Index and the second argument. ParSol is the intrinsic parameter of the point PntSol on the solution. ParArg is the intrinsic parameter of the point PntArg on the second argument. It raises OutOfRange if Index is greater than the number of solutions. It raises NotDone if the construction algorithm did not succeed.

	:param Index:
	:type Index: int
	:param ParSol:
	:type ParSol: float &
	:param ParArg:
	:type ParArg: float &
	:param PntSol:
	:type PntSol: gp_Pnt2d
	:rtype: None
") Tangency2;
		void Tangency2 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("compactdefaultargs") IsTheSame1;
		%feature("autodoc", "	* Returns True if the solution number Index is equal to the first argument. It raises OutOfRange if Index is greater than the number of solutions. It raises NotDone if the construction algorithm did not succeed.

	:param Index:
	:type Index: int
	:rtype: bool
") IsTheSame1;
		Standard_Boolean IsTheSame1 (const Standard_Integer Index);
		%feature("compactdefaultargs") IsTheSame2;
		%feature("autodoc", "	* Returns True if the solution number Index is equal to the second argument. It raises OutOfRange if Index is greater than the number of solutions. It raises NotDone if the construction algorithm did not succeed.

	:param Index:
	:type Index: int
	:rtype: bool
") IsTheSame2;
		Standard_Boolean IsTheSame2 (const Standard_Integer Index);
};


%extend Geom2dGcc_Circ2d2TanRadGeo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Geom2dGcc_Circ2d3Tan;
class Geom2dGcc_Circ2d3Tan {
	public:
		%feature("compactdefaultargs") Geom2dGcc_Circ2d3Tan;
		%feature("autodoc", "	* Constructs one or more 2D circles tangential to three curves Qualified1, Qualified2 and Qualified3, where Param1, Param2 and Param3 are used, respectively, as the initial values of the parameters on Qualified1, Qualified2 and Qualified3 of the tangency point between these arguments and the solution sought, if the algorithm chooses an iterative method to find the solution (i.e. if either Qualified1, Qualified2 or Qualified3 is more complex than a line or a circle).

	:param Qualified1:
	:type Qualified1: Geom2dGcc_QualifiedCurve &
	:param Qualified2:
	:type Qualified2: Geom2dGcc_QualifiedCurve &
	:param Qualified3:
	:type Qualified3: Geom2dGcc_QualifiedCurve &
	:param Tolerance:
	:type Tolerance: float
	:param Param1:
	:type Param1: float
	:param Param2:
	:type Param2: float
	:param Param3:
	:type Param3: float
	:rtype: None
") Geom2dGcc_Circ2d3Tan;
		 Geom2dGcc_Circ2d3Tan (const Geom2dGcc_QualifiedCurve & Qualified1,const Geom2dGcc_QualifiedCurve & Qualified2,const Geom2dGcc_QualifiedCurve & Qualified3,const Standard_Real Tolerance,const Standard_Real Param1,const Standard_Real Param2,const Standard_Real Param3);
		%feature("compactdefaultargs") Geom2dGcc_Circ2d3Tan;
		%feature("autodoc", "	* Constructs one or more 2D circles tangential to two curves Qualified1 and Qualified2 and passing through the point Point, where Param1 and Param2 are used, respectively, as the initial values of the parameters on Qualified1 and Qualified2 of the tangency point between this argument and the solution sought, if the algorithm chooses an iterative method to find the solution (i.e. if either Qualified1 or Qualified2 is more complex than a line or a circle).

	:param Qualified1:
	:type Qualified1: Geom2dGcc_QualifiedCurve &
	:param Qualified2:
	:type Qualified2: Geom2dGcc_QualifiedCurve &
	:param Point:
	:type Point: Handle_Geom2d_Point &
	:param Tolerance:
	:type Tolerance: float
	:param Param1:
	:type Param1: float
	:param Param2:
	:type Param2: float
	:rtype: None
") Geom2dGcc_Circ2d3Tan;
		 Geom2dGcc_Circ2d3Tan (const Geom2dGcc_QualifiedCurve & Qualified1,const Geom2dGcc_QualifiedCurve & Qualified2,const Handle_Geom2d_Point & Point,const Standard_Real Tolerance,const Standard_Real Param1,const Standard_Real Param2);
		%feature("compactdefaultargs") Geom2dGcc_Circ2d3Tan;
		%feature("autodoc", "	* Constructs one or more 2D circles tangential to the curve Qualified1 and passing through two points Point1 and Point2, where Param1 is used as the initial value of the parameter on Qualified1 of the tangency point between this argument and the solution sought, if the algorithm chooses an iterative method to find the solution (i.e. if Qualified1 is more complex than a line or a circle)

	:param Qualified1:
	:type Qualified1: Geom2dGcc_QualifiedCurve &
	:param Point1:
	:type Point1: Handle_Geom2d_Point &
	:param Point2:
	:type Point2: Handle_Geom2d_Point &
	:param Tolerance:
	:type Tolerance: float
	:param Param1:
	:type Param1: float
	:rtype: None
") Geom2dGcc_Circ2d3Tan;
		 Geom2dGcc_Circ2d3Tan (const Geom2dGcc_QualifiedCurve & Qualified1,const Handle_Geom2d_Point & Point1,const Handle_Geom2d_Point & Point2,const Standard_Real Tolerance,const Standard_Real Param1);
		%feature("compactdefaultargs") Geom2dGcc_Circ2d3Tan;
		%feature("autodoc", "	* Constructs one or more 2D circles passing through three points Point1, Point2 and Point3. Tolerance is a tolerance criterion used by the algorithm to find a solution when, mathematically, the problem posed does not have a solution, but where there is numeric uncertainty attached to the arguments. For example, take: - two circles C1 and C2, such that C2 is inside C1, and almost tangential to C1; there is in fact no point of intersection between C1 and C2; and - a circle C3 outside C1. You now want to find a circle which is tangential to C1, C2 and C3: a pure mathematical resolution will not find a solution. This is where the tolerance criterion is used: the algorithm considers that C1 and C2 are tangential if the shortest distance between these two circles is less than or equal to Tolerance. Thus, the algorithm finds a solution. Warning An iterative algorithm is used if Qualified1, Qualified2 or Qualified3 is more complex than a line or a circle. In such cases, the algorithm constructs only one solution. Exceptions GccEnt_BadQualifier if a qualifier is inconsistent with the argument it qualifies (for example, enclosing for a line).

	:param Point1:
	:type Point1: Handle_Geom2d_Point &
	:param Point2:
	:type Point2: Handle_Geom2d_Point &
	:param Point3:
	:type Point3: Handle_Geom2d_Point &
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Geom2dGcc_Circ2d3Tan;
		 Geom2dGcc_Circ2d3Tan (const Handle_Geom2d_Point & Point1,const Handle_Geom2d_Point & Point2,const Handle_Geom2d_Point & Point3,const Standard_Real Tolerance);
		%feature("compactdefaultargs") Results;
		%feature("autodoc", "	:param Circ:
	:type Circ: GccAna_Circ2d3Tan &
	:param Rank1:
	:type Rank1: int
	:param Rank2:
	:type Rank2: int
	:param Rank3:
	:type Rank3: int
	:rtype: None
") Results;
		void Results (const GccAna_Circ2d3Tan & Circ,const Standard_Integer Rank1,const Standard_Integer Rank2,const Standard_Integer Rank3);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns true if the construction algorithm does not fail (even if it finds no solution). Note: IsDone protects against a failure arising from a more internal intersection algorithm, which has reached its numeric limits.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "	* This method returns the number of solutions. NotDone is raised if the algorithm failed.

	:rtype: int
") NbSolutions;
		Standard_Integer NbSolutions ();
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "	* Returns the solution number Index and raises OutOfRange exception if Index is greater than the number of solutions. Be carefull: the Index is only a way to get all the solutions, but is not associated to theses outside the context of the algorithm-object.

	:param Index:
	:type Index: int
	:rtype: gp_Circ2d
") ThisSolution;
		gp_Circ2d ThisSolution (const Standard_Integer Index);
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "	* It returns the informations about the qualifiers of the tangency arguments concerning the solution number Index. It returns the real qualifiers (the qualifiers given to the constructor method in case of enclosed, enclosing and outside and the qualifiers computedin case of unqualified).

	:param Index:
	:type Index: int
	:param Qualif1:
	:type Qualif1: GccEnt_Position &
	:param Qualif2:
	:type Qualif2: GccEnt_Position &
	:param Qualif3:
	:type Qualif3: GccEnt_Position &
	:rtype: None
") WhichQualifier;
		void WhichQualifier (const Standard_Integer Index,GccEnt_Position & Qualif1,GccEnt_Position & Qualif2,GccEnt_Position & Qualif3);
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "	* Returns informations about the tangency point between the result and the first argument. ParSol is the intrinsic parameter of the point PntSol on the solution curv. ParArg is the intrinsic parameter of the point PntSol on the argument curv.

	:param Index:
	:type Index: int
	:param ParSol:
	:type ParSol: float &
	:param ParArg:
	:type ParArg: float &
	:param PntSol:
	:type PntSol: gp_Pnt2d
	:rtype: None
") Tangency1;
		void Tangency1 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("compactdefaultargs") Tangency2;
		%feature("autodoc", "	* Returns informations about the tangency point between the result and the second argument. ParSol is the intrinsic parameter of the point PntSol on the solution curv. ParArg is the intrinsic parameter of the point PntSol on the argument curv.

	:param Index:
	:type Index: int
	:param ParSol:
	:type ParSol: float &
	:param ParArg:
	:type ParArg: float &
	:param PntSol:
	:type PntSol: gp_Pnt2d
	:rtype: None
") Tangency2;
		void Tangency2 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("compactdefaultargs") Tangency3;
		%feature("autodoc", "	* Returns informations about the tangency point between the result and the third argument. ParSol is the intrinsic parameter of the point PntSol on the solution curv. ParArg is the intrinsic parameter of the point PntSol on the argument curv.

	:param Index:
	:type Index: int
	:param ParSol:
	:type ParSol: float &
	:param ParArg:
	:type ParArg: float &
	:param PntSol:
	:type PntSol: gp_Pnt2d
	:rtype: None
") Tangency3;
		void Tangency3 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("compactdefaultargs") IsTheSame1;
		%feature("autodoc", "	* Returns True if the solution is equal to the first argument.

	:param Index:
	:type Index: int
	:rtype: bool
") IsTheSame1;
		Standard_Boolean IsTheSame1 (const Standard_Integer Index);
		%feature("compactdefaultargs") IsTheSame2;
		%feature("autodoc", "	* Returns True if the solution is equal to the second argument.

	:param Index:
	:type Index: int
	:rtype: bool
") IsTheSame2;
		Standard_Boolean IsTheSame2 (const Standard_Integer Index);
		%feature("compactdefaultargs") IsTheSame3;
		%feature("autodoc", "	* Returns True if the solution is equal to the third argument. If Rarg is the radius of the first, second or third argument, Rsol is the radius of the solution and dist is the distance between the two centers, we consider the two circles to be identical if |Rarg - Rsol| and dist are less than or equal to the tolerance criterion given at the time of construction of this algorithm. Exceptions Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.

	:param Index:
	:type Index: int
	:rtype: bool
") IsTheSame3;
		Standard_Boolean IsTheSame3 (const Standard_Integer Index);
};


%extend Geom2dGcc_Circ2d3Tan {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Geom2dGcc_Circ2d3TanIter;
class Geom2dGcc_Circ2d3TanIter {
	public:
		%feature("compactdefaultargs") Geom2dGcc_Circ2d3TanIter;
		%feature("autodoc", "	* This method implements the algorithms used to create 2d circles tangent to 2 circles and a curve.

	:param Qualified1:
	:type Qualified1: GccEnt_QualifiedCirc &
	:param Qualified2:
	:type Qualified2: GccEnt_QualifiedCirc &
	:param Qualified3:
	:type Qualified3: Geom2dGcc_QCurve &
	:param Param1:
	:type Param1: float
	:param Param2:
	:type Param2: float
	:param Param3:
	:type Param3: float
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Geom2dGcc_Circ2d3TanIter;
		 Geom2dGcc_Circ2d3TanIter (const GccEnt_QualifiedCirc & Qualified1,const GccEnt_QualifiedCirc & Qualified2,const Geom2dGcc_QCurve & Qualified3,const Standard_Real Param1,const Standard_Real Param2,const Standard_Real Param3,const Standard_Real Tolerance);
		%feature("compactdefaultargs") Geom2dGcc_Circ2d3TanIter;
		%feature("autodoc", "	* This method implements the algorithms used to create 2d circles tangent to a circle and 2 curves.

	:param Qualified1:
	:type Qualified1: GccEnt_QualifiedCirc &
	:param Qualified2:
	:type Qualified2: Geom2dGcc_QCurve &
	:param Qualified3:
	:type Qualified3: Geom2dGcc_QCurve &
	:param Param1:
	:type Param1: float
	:param Param2:
	:type Param2: float
	:param Param3:
	:type Param3: float
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Geom2dGcc_Circ2d3TanIter;
		 Geom2dGcc_Circ2d3TanIter (const GccEnt_QualifiedCirc & Qualified1,const Geom2dGcc_QCurve & Qualified2,const Geom2dGcc_QCurve & Qualified3,const Standard_Real Param1,const Standard_Real Param2,const Standard_Real Param3,const Standard_Real Tolerance);
		%feature("compactdefaultargs") Geom2dGcc_Circ2d3TanIter;
		%feature("autodoc", "	* This method implements the algorithms used to create 2d circles tangent to a circle and a line and a curve.

	:param Qualified1:
	:type Qualified1: GccEnt_QualifiedCirc &
	:param Qualified2:
	:type Qualified2: GccEnt_QualifiedLin &
	:param Qualified3:
	:type Qualified3: Geom2dGcc_QCurve &
	:param Param1:
	:type Param1: float
	:param Param2:
	:type Param2: float
	:param Param3:
	:type Param3: float
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Geom2dGcc_Circ2d3TanIter;
		 Geom2dGcc_Circ2d3TanIter (const GccEnt_QualifiedCirc & Qualified1,const GccEnt_QualifiedLin & Qualified2,const Geom2dGcc_QCurve & Qualified3,const Standard_Real Param1,const Standard_Real Param2,const Standard_Real Param3,const Standard_Real Tolerance);
		%feature("compactdefaultargs") Geom2dGcc_Circ2d3TanIter;
		%feature("autodoc", "	* This method implements the algorithms used to create 2d circles tangent to a circle and a point and a curve.

	:param Qualified1:
	:type Qualified1: GccEnt_QualifiedCirc &
	:param Qualified2:
	:type Qualified2: Geom2dGcc_QCurve &
	:param Point3:
	:type Point3: gp_Pnt2d
	:param Param1:
	:type Param1: float
	:param Param2:
	:type Param2: float
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Geom2dGcc_Circ2d3TanIter;
		 Geom2dGcc_Circ2d3TanIter (const GccEnt_QualifiedCirc & Qualified1,const Geom2dGcc_QCurve & Qualified2,const gp_Pnt2d & Point3,const Standard_Real Param1,const Standard_Real Param2,const Standard_Real Tolerance);
		%feature("compactdefaultargs") Geom2dGcc_Circ2d3TanIter;
		%feature("autodoc", "	* This method implements the algorithms used to create 2d circles tangent to 2 lines and a curve.

	:param Qualified1:
	:type Qualified1: GccEnt_QualifiedLin &
	:param Qualified2:
	:type Qualified2: GccEnt_QualifiedLin &
	:param Qualified3:
	:type Qualified3: Geom2dGcc_QCurve &
	:param Param1:
	:type Param1: float
	:param Param2:
	:type Param2: float
	:param Param3:
	:type Param3: float
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Geom2dGcc_Circ2d3TanIter;
		 Geom2dGcc_Circ2d3TanIter (const GccEnt_QualifiedLin & Qualified1,const GccEnt_QualifiedLin & Qualified2,const Geom2dGcc_QCurve & Qualified3,const Standard_Real Param1,const Standard_Real Param2,const Standard_Real Param3,const Standard_Real Tolerance);
		%feature("compactdefaultargs") Geom2dGcc_Circ2d3TanIter;
		%feature("autodoc", "	* This method implements the algorithms used to create 2d circles tangent to a line and 2 curves.

	:param Qualified1:
	:type Qualified1: GccEnt_QualifiedLin &
	:param Qualified2:
	:type Qualified2: Geom2dGcc_QCurve &
	:param Qualified3:
	:type Qualified3: Geom2dGcc_QCurve &
	:param Param1:
	:type Param1: float
	:param Param2:
	:type Param2: float
	:param Param3:
	:type Param3: float
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Geom2dGcc_Circ2d3TanIter;
		 Geom2dGcc_Circ2d3TanIter (const GccEnt_QualifiedLin & Qualified1,const Geom2dGcc_QCurve & Qualified2,const Geom2dGcc_QCurve & Qualified3,const Standard_Real Param1,const Standard_Real Param2,const Standard_Real Param3,const Standard_Real Tolerance);
		%feature("compactdefaultargs") Geom2dGcc_Circ2d3TanIter;
		%feature("autodoc", "	* This method implements the algorithms used to create 2d circles tangent to a line and a curve and a point.

	:param Qualified1:
	:type Qualified1: GccEnt_QualifiedLin &
	:param Qualified2:
	:type Qualified2: Geom2dGcc_QCurve &
	:param Point3:
	:type Point3: gp_Pnt2d
	:param Param1:
	:type Param1: float
	:param Param2:
	:type Param2: float
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Geom2dGcc_Circ2d3TanIter;
		 Geom2dGcc_Circ2d3TanIter (const GccEnt_QualifiedLin & Qualified1,const Geom2dGcc_QCurve & Qualified2,const gp_Pnt2d & Point3,const Standard_Real Param1,const Standard_Real Param2,const Standard_Real Tolerance);
		%feature("compactdefaultargs") Geom2dGcc_Circ2d3TanIter;
		%feature("autodoc", "	* This method implements the algorithms used to create 2d circles tangent to a curve and 2 points.

	:param Qualified1:
	:type Qualified1: Geom2dGcc_QCurve &
	:param Point1:
	:type Point1: gp_Pnt2d
	:param Point2:
	:type Point2: gp_Pnt2d
	:param Param1:
	:type Param1: float
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Geom2dGcc_Circ2d3TanIter;
		 Geom2dGcc_Circ2d3TanIter (const Geom2dGcc_QCurve & Qualified1,const gp_Pnt2d & Point1,const gp_Pnt2d & Point2,const Standard_Real Param1,const Standard_Real Tolerance);
		%feature("compactdefaultargs") Geom2dGcc_Circ2d3TanIter;
		%feature("autodoc", "	* This method implements the algorithms used to create 2d circles tangent to 2 curves and a point.

	:param Qualified1:
	:type Qualified1: Geom2dGcc_QCurve &
	:param Qualified2:
	:type Qualified2: Geom2dGcc_QCurve &
	:param Point2:
	:type Point2: gp_Pnt2d
	:param Param1:
	:type Param1: float
	:param Param2:
	:type Param2: float
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Geom2dGcc_Circ2d3TanIter;
		 Geom2dGcc_Circ2d3TanIter (const Geom2dGcc_QCurve & Qualified1,const Geom2dGcc_QCurve & Qualified2,const gp_Pnt2d & Point2,const Standard_Real Param1,const Standard_Real Param2,const Standard_Real Tolerance);
		%feature("compactdefaultargs") Geom2dGcc_Circ2d3TanIter;
		%feature("autodoc", "	* This method implements the algorithms used to create 2d circles tangent to 3 curves.

	:param Qualified1:
	:type Qualified1: Geom2dGcc_QCurve &
	:param Qualified2:
	:type Qualified2: Geom2dGcc_QCurve &
	:param Qualified3:
	:type Qualified3: Geom2dGcc_QCurve &
	:param Param1:
	:type Param1: float
	:param Param2:
	:type Param2: float
	:param Param3:
	:type Param3: float
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Geom2dGcc_Circ2d3TanIter;
		 Geom2dGcc_Circ2d3TanIter (const Geom2dGcc_QCurve & Qualified1,const Geom2dGcc_QCurve & Qualified2,const Geom2dGcc_QCurve & Qualified3,const Standard_Real Param1,const Standard_Real Param2,const Standard_Real Param3,const Standard_Real Tolerance);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* This method returns True if the construction algorithm succeeded.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "	* Returns the solution. It raises NotDone if the construction algorithm didn't succeed.

	:rtype: gp_Circ2d
") ThisSolution;
		gp_Circ2d ThisSolution ();
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "	:param Qualif1:
	:type Qualif1: GccEnt_Position &
	:param Qualif2:
	:type Qualif2: GccEnt_Position &
	:param Qualif3:
	:type Qualif3: GccEnt_Position &
	:rtype: None
") WhichQualifier;
		void WhichQualifier (GccEnt_Position & Qualif1,GccEnt_Position & Qualif2,GccEnt_Position & Qualif3);
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "	* Returns informations about the tangency point between the result and the first argument. ParSol is the intrinsic parameter of the point PntSol on the solution curv. ParArg is the intrinsic parameter of the point PntSol on the argument curv. It raises NotDone if the construction algorithm didn't succeed.

	:param ParSol:
	:type ParSol: float &
	:param ParArg:
	:type ParArg: float &
	:param PntSol:
	:type PntSol: gp_Pnt2d
	:rtype: None
") Tangency1;
		void Tangency1 (Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("compactdefaultargs") Tangency2;
		%feature("autodoc", "	* Returns informations about the tangency point between the result and the second argument. ParSol is the intrinsic parameter of the point PntSol on the solution curv. ParArg is the intrinsic parameter of the point PntSol on the argument curv. It raises NotDone if the construction algorithm didn't succeed.

	:param ParSol:
	:type ParSol: float &
	:param ParArg:
	:type ParArg: float &
	:param PntSol:
	:type PntSol: gp_Pnt2d
	:rtype: None
") Tangency2;
		void Tangency2 (Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("compactdefaultargs") Tangency3;
		%feature("autodoc", "	* Returns informations about the tangency point between the result and the third argument. ParSol is the intrinsic parameter of the point PntSol on the solution curv. ParArg is the intrinsic parameter of the point PntSol on the argument curv. It raises NotDone if the construction algorithm didn't succeed.

	:param ParSol:
	:type ParSol: float &
	:param ParArg:
	:type ParArg: float &
	:param PntSol:
	:type PntSol: gp_Pnt2d
	:rtype: None
") Tangency3;
		void Tangency3 (Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("compactdefaultargs") IsTheSame1;
		%feature("autodoc", "	* It raises NotDone if the construction algorithm didn't succeed.

	:rtype: bool
") IsTheSame1;
		Standard_Boolean IsTheSame1 ();
		%feature("compactdefaultargs") IsTheSame2;
		%feature("autodoc", "	* It raises NotDone if the construction algorithm didn't succeed.

	:rtype: bool
") IsTheSame2;
		Standard_Boolean IsTheSame2 ();
		%feature("compactdefaultargs") IsTheSame3;
		%feature("autodoc", "	* It raises NotDone if the construction algorithm didn't succeed.

	:rtype: bool
") IsTheSame3;
		Standard_Boolean IsTheSame3 ();
};


%extend Geom2dGcc_Circ2d3TanIter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Geom2dGcc_Circ2dTanCen;
class Geom2dGcc_Circ2dTanCen {
	public:
		%feature("compactdefaultargs") Geom2dGcc_Circ2dTanCen;
		%feature("autodoc", "	* Constructs one or more 2D circles tangential to the curve Qualified1 and centered on the point Pcenter. Tolerance is a tolerance criterion used by the algorithm to find a solution when, mathematically, the problem posed does not have a solution, but where there is numeric uncertainty attached to the arguments. Tolerance is only used in these algorithms in very specific cases where the center of the solution is very close to the circle to which it is tangential, and where the solution is thus a very small circle. Exceptions GccEnt_BadQualifier if a qualifier is inconsistent with the argument it qualifies (for example, enclosing for a line).

	:param Qualified1:
	:type Qualified1: Geom2dGcc_QualifiedCurve &
	:param Pcenter:
	:type Pcenter: Handle_Geom2d_Point &
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Geom2dGcc_Circ2dTanCen;
		 Geom2dGcc_Circ2dTanCen (const Geom2dGcc_QualifiedCurve & Qualified1,const Handle_Geom2d_Point & Pcenter,const Standard_Real Tolerance);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns true if the construction algorithm does not fail (even if it finds no solution). Note: IsDone protects against a failure arising from a more internal intersection algorithm, which has reached its numeric limits.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "	* Returns the number of circles, representing solutions computed by this algorithm. Exceptions StdFail_NotDone if the construction fails.

	:rtype: int
") NbSolutions;
		Standard_Integer NbSolutions ();
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "	* Returns a circle, representing the solution of index Index computed by this algorithm. Warning This indexing simply provides a means of consulting the solutions. The index values are not associated with these solutions outside the context of the algorithm object. Exceptions Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails

	:param Index:
	:type Index: int
	:rtype: gp_Circ2d
") ThisSolution;
		gp_Circ2d ThisSolution (const Standard_Integer Index);
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "	* Returns the qualifier Qualif1 of the tangency argument for the solution of index Index computed by this algorithm. The returned qualifier is: - that specified at the start of construction when the solutions are defined as enclosed, enclosing or outside with respect to the argument, or - that computed during construction (i.e. enclosed, enclosing or outside) when the solutions are defined as unqualified with respect to the argument. Exceptions Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.

	:param Index:
	:type Index: int
	:param Qualif1:
	:type Qualif1: GccEnt_Position &
	:rtype: None
") WhichQualifier;
		void WhichQualifier (const Standard_Integer Index,GccEnt_Position & Qualif1);
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "	* Returns informations about the tangency point between the result number Index and the first argument. ParSol is the intrinsic parameter of the point PntSol on the solution curv. ParArg is the intrinsic parameter of the point PntSol on the argument curv. Exceptions Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.

	:param Index:
	:type Index: int
	:param ParSol:
	:type ParSol: float &
	:param ParArg:
	:type ParArg: float &
	:param PntSol:
	:type PntSol: gp_Pnt2d
	:rtype: None
") Tangency1;
		void Tangency1 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("compactdefaultargs") IsTheSame1;
		%feature("autodoc", "	* Returns true if the solution of index Index and the first argument of this algorithm are the same (i.e. there are 2 identical circles). If Rarg is the radius of the first argument, Rsol is the radius of the solution and dist is the distance between the two centers, we consider the two circles to be identical if |Rarg - Rsol| and dist are less than or equal to the tolerance criterion given at the time of construction of this algorithm. NotDone is raised if the construction algorithm didn't succeed. OutOfRange is raised if Index is greater than the number of solutions.

	:param Index:
	:type Index: int
	:rtype: bool
") IsTheSame1;
		Standard_Boolean IsTheSame1 (const Standard_Integer Index);
};


%extend Geom2dGcc_Circ2dTanCen {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Geom2dGcc_Circ2dTanCenGeo;
class Geom2dGcc_Circ2dTanCenGeo {
	public:
		%feature("compactdefaultargs") Geom2dGcc_Circ2dTanCenGeo;
		%feature("autodoc", "	* This method implements the algorithms used to create 2d circles tangent to a circle and centered on a point.

	:param Qualified1:
	:type Qualified1: Geom2dGcc_QCurve &
	:param Pcenter:
	:type Pcenter: gp_Pnt2d
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Geom2dGcc_Circ2dTanCenGeo;
		 Geom2dGcc_Circ2dTanCenGeo (const Geom2dGcc_QCurve & Qualified1,const gp_Pnt2d & Pcenter,const Standard_Real Tolerance);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* This method returns True if the construction algorithm succeeded.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "	* Returns the number of solutions and raises NotDone exception if the algorithm didn't succeed. It raises NotDone if the construction algorithm didn't succeed.

	:rtype: int
") NbSolutions;
		Standard_Integer NbSolutions ();
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "	* Returns the solution number Index and raises OutOfRange exception if Index is greater than the number of solutions. Be carefull: the Index is only a way to get all the solutions, but is not associated to theses outside the context of the algorithm-object. It raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions or less than zero.

	:param Index:
	:type Index: int
	:rtype: gp_Circ2d
") ThisSolution;
		gp_Circ2d ThisSolution (const Standard_Integer Index);
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Qualif1:
	:type Qualif1: GccEnt_Position &
	:rtype: None
") WhichQualifier;
		void WhichQualifier (const Standard_Integer Index,GccEnt_Position & Qualif1);
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "	* Returns informations about the tangency point between the result number Index and the first argument. ParSol is the intrinsic parameter of the point PntSol on the solution curv. ParArg is the intrinsic parameter of the point PntArg on the argument curv. It raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions or less than zero.

	:param Index:
	:type Index: int
	:param ParSol:
	:type ParSol: float &
	:param ParArg:
	:type ParArg: float &
	:param PntSol:
	:type PntSol: gp_Pnt2d
	:rtype: None
") Tangency1;
		void Tangency1 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
};


%extend Geom2dGcc_Circ2dTanCenGeo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Geom2dGcc_Circ2dTanOnRad;
class Geom2dGcc_Circ2dTanOnRad {
	public:
		%feature("compactdefaultargs") Geom2dGcc_Circ2dTanOnRad;
		%feature("autodoc", "	* Constructs one or more 2D circles of radius Radius, centered on the 2D curve OnCurv and: - tangential to the curve Qualified1

	:param Qualified1:
	:type Qualified1: Geom2dGcc_QualifiedCurve &
	:param OnCurv:
	:type OnCurv: Geom2dAdaptor_Curve &
	:param Radius:
	:type Radius: float
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Geom2dGcc_Circ2dTanOnRad;
		 Geom2dGcc_Circ2dTanOnRad (const Geom2dGcc_QualifiedCurve & Qualified1,const Geom2dAdaptor_Curve & OnCurv,const Standard_Real Radius,const Standard_Real Tolerance);
		%feature("compactdefaultargs") Geom2dGcc_Circ2dTanOnRad;
		%feature("autodoc", "	* Constructs one or more 2D circles of radius Radius, centered on the 2D curve OnCurv and: passing through the point Point1. OnCurv is an adapted curve, i.e. an object which is an interface between: - the services provided by a 2D curve from the package Geom2d, - and those required on the curve by the construction algorithm. Similarly, the qualified curve Qualified1 is created from an adapted curve. Adapted curves are created in the following way: Handle_Geom2d_Curve myCurveOn = ... ; Geom2dAdaptor_Curve OnCurv ( myCurveOn ) ; The algorithm is then constructed with this object: Handle_Geom2d_Curve myCurve1 = ... ; Geom2dAdaptor_Curve Adapted1 ( myCurve1 ) ; Geom2dGcc_QualifiedCurve Qualified1 = Geom2dGcc::Outside(Adapted1); Standard_Real Radius = ... , Tolerance = ... ; Geom2dGcc_Circ2dTanOnRad myAlgo ( Qualified1 , OnCurv , Radius , Tolerance ) ; if ( myAlgo.IsDone() ) { Standard_Integer Nbr = myAlgo.NbSolutions() ; gp_Circ2d Circ ; for ( Standard_Integer i = 1 ; i <= nbr ; i++ ) { Circ = myAlgo.ThisSolution (i) ; ... } }

	:param Point1:
	:type Point1: Handle_Geom2d_Point &
	:param OnCurv:
	:type OnCurv: Geom2dAdaptor_Curve &
	:param Radius:
	:type Radius: float
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Geom2dGcc_Circ2dTanOnRad;
		 Geom2dGcc_Circ2dTanOnRad (const Handle_Geom2d_Point & Point1,const Geom2dAdaptor_Curve & OnCurv,const Standard_Real Radius,const Standard_Real Tolerance);
		%feature("compactdefaultargs") Results;
		%feature("autodoc", "	:param Circ:
	:type Circ: GccAna_Circ2dTanOnRad &
	:rtype: None
") Results;
		void Results (const GccAna_Circ2dTanOnRad & Circ);
		%feature("compactdefaultargs") Results;
		%feature("autodoc", "	:param Circ:
	:type Circ: Geom2dGcc_Circ2dTanOnRadGeo &
	:rtype: None
") Results;
		void Results (const Geom2dGcc_Circ2dTanOnRadGeo & Circ);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns true if the construction algorithm does not fail (even if it finds no solution). Note: IsDone protects against a failure arising from a more internal intersection algorithm which has reached its numeric limits.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "	* Returns the number of circles, representing solutions computed by this algorithm. Exceptions: StdFail_NotDone if the construction fails.

	:rtype: int
") NbSolutions;
		Standard_Integer NbSolutions ();
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "	* Returns the solution number Index and raises OutOfRange exception if Index is greater than the number of solutions. Be carefull: the Index is only a way to get all the solutions, but is not associated to theses outside the context of the algorithm-object. Exceptions Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.

	:param Index:
	:type Index: int
	:rtype: gp_Circ2d
") ThisSolution;
		gp_Circ2d ThisSolution (const Standard_Integer Index);
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "	* Returns the qualifier Qualif1 of the tangency argument for the solution of index Index computed by this algorithm. The returned qualifier is: - that specified at the start of construction when the solutions are defined as enclosed, enclosing or outside with respect to the arguments, or - that computed during construction (i.e. enclosed, enclosing or outside) when the solutions are defined as unqualified with respect to the arguments, or - GccEnt_noqualifier if the tangency argument is a point. Exceptions Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.

	:param Index:
	:type Index: int
	:param Qualif1:
	:type Qualif1: GccEnt_Position &
	:rtype: None
") WhichQualifier;
		void WhichQualifier (const Standard_Integer Index,GccEnt_Position & Qualif1);
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "	* Returns informations about the tangency point between the result number Index and the first argument. ParSol is the intrinsic parameter of the point on the solution curv. ParArg is the intrinsic parameter of the point on the argument curv. PntSol is the tangency point on the solution curv. PntArg is the tangency point on the argument curv. Exceptions Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.

	:param Index:
	:type Index: int
	:param ParSol:
	:type ParSol: float &
	:param ParArg:
	:type ParArg: float &
	:param PntSol:
	:type PntSol: gp_Pnt2d
	:rtype: None
") Tangency1;
		void Tangency1 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("compactdefaultargs") CenterOn3;
		%feature("autodoc", "	* Returns the center PntSol on the second argument (i.e. line or circle) of the solution of index Index computed by this algorithm. ParArg is the intrinsic parameter of the point on the argument curv. PntSol is the center point of the solution curv. PntArg is the projection of PntSol on the argument curv. Exceptions: Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.

	:param Index:
	:type Index: int
	:param ParArg:
	:type ParArg: float &
	:param PntSol:
	:type PntSol: gp_Pnt2d
	:rtype: None
") CenterOn3;
		void CenterOn3 (const Standard_Integer Index,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("compactdefaultargs") IsTheSame1;
		%feature("autodoc", "	* Returns true if the solution of index Index and the first argument of this algorithm are the same (i.e. there are 2 identical circles). If Rarg is the radius of the first argument, Rsol is the radius of the solution and dist is the distance between the two centers, we consider the two circles to be identical if |Rarg - Rsol| and dist are less than or equal to the tolerance criterion given at the time of construction of this algorithm. OutOfRange is raised if Index is greater than the number of solutions. notDone is raised if the construction algorithm did not succeed.

	:param Index:
	:type Index: int
	:rtype: bool
") IsTheSame1;
		Standard_Boolean IsTheSame1 (const Standard_Integer Index);
};


%extend Geom2dGcc_Circ2dTanOnRad {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Geom2dGcc_Circ2dTanOnRadGeo;
class Geom2dGcc_Circ2dTanOnRadGeo {
	public:
		%feature("compactdefaultargs") Geom2dGcc_Circ2dTanOnRadGeo;
		%feature("autodoc", "	* This methods implements the algorithms used to create 2d Circles tangent to a curve and centered on a 2d Line with a given radius. Tolerance is used to find solution in every limit cases. raises NegativeValue in case of NegativeRadius.

	:param Qualified1:
	:type Qualified1: Geom2dGcc_QCurve &
	:param OnLine:
	:type OnLine: gp_Lin2d
	:param Radius:
	:type Radius: float
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Geom2dGcc_Circ2dTanOnRadGeo;
		 Geom2dGcc_Circ2dTanOnRadGeo (const Geom2dGcc_QCurve & Qualified1,const gp_Lin2d & OnLine,const Standard_Real Radius,const Standard_Real Tolerance);
		%feature("compactdefaultargs") Geom2dGcc_Circ2dTanOnRadGeo;
		%feature("autodoc", "	* This methods implements the algorithms used to create 2d Circles tangent to a curve and centered on a 2d Circle with a given radius. Tolerance is used to find solution in every limit cases. raises NegativeValue in case of NegativeRadius.

	:param Qualified1:
	:type Qualified1: Geom2dGcc_QCurve &
	:param OnCirc:
	:type OnCirc: gp_Circ2d
	:param Radius:
	:type Radius: float
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Geom2dGcc_Circ2dTanOnRadGeo;
		 Geom2dGcc_Circ2dTanOnRadGeo (const Geom2dGcc_QCurve & Qualified1,const gp_Circ2d & OnCirc,const Standard_Real Radius,const Standard_Real Tolerance);
		%feature("compactdefaultargs") Geom2dGcc_Circ2dTanOnRadGeo;
		%feature("autodoc", "	* This methods implements the algorithms used to create 2d Circles tangent to a circle and centered on a 2d curve with a given radius. Tolerance is used to find solution in every limit cases. raises NegativeValue in case of NegativeRadius.

	:param Qualified1:
	:type Qualified1: GccEnt_QualifiedCirc &
	:param OnCurv:
	:type OnCurv: Geom2dAdaptor_Curve &
	:param Radius:
	:type Radius: float
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Geom2dGcc_Circ2dTanOnRadGeo;
		 Geom2dGcc_Circ2dTanOnRadGeo (const GccEnt_QualifiedCirc & Qualified1,const Geom2dAdaptor_Curve & OnCurv,const Standard_Real Radius,const Standard_Real Tolerance);
		%feature("compactdefaultargs") Geom2dGcc_Circ2dTanOnRadGeo;
		%feature("autodoc", "	* This methods implements the algorithms used to create 2d Circles tangent to a 2d Line and centered on a 2d curve with a given radius. Tolerance is used to find solution in every limit cases. raises NegativeValue in case of NegativeRadius.

	:param Qualified1:
	:type Qualified1: GccEnt_QualifiedLin &
	:param OnCurv:
	:type OnCurv: Geom2dAdaptor_Curve &
	:param Radius:
	:type Radius: float
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Geom2dGcc_Circ2dTanOnRadGeo;
		 Geom2dGcc_Circ2dTanOnRadGeo (const GccEnt_QualifiedLin & Qualified1,const Geom2dAdaptor_Curve & OnCurv,const Standard_Real Radius,const Standard_Real Tolerance);
		%feature("compactdefaultargs") Geom2dGcc_Circ2dTanOnRadGeo;
		%feature("autodoc", "	* This methods implements the algorithms used to create 2d Circles tangent to a 2d curve and centered on a 2d curve with a given radius. Tolerance is used to find solution in every limit cases. raises NegativeValue in case of NegativeRadius.

	:param Qualified1:
	:type Qualified1: Geom2dGcc_QCurve &
	:param OnCurv:
	:type OnCurv: Geom2dAdaptor_Curve &
	:param Radius:
	:type Radius: float
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Geom2dGcc_Circ2dTanOnRadGeo;
		 Geom2dGcc_Circ2dTanOnRadGeo (const Geom2dGcc_QCurve & Qualified1,const Geom2dAdaptor_Curve & OnCurv,const Standard_Real Radius,const Standard_Real Tolerance);
		%feature("compactdefaultargs") Geom2dGcc_Circ2dTanOnRadGeo;
		%feature("autodoc", "	* This methods implements the algorithms used to create 2d Circles passing through a 2d point and centered on a 2d curve with a given radius. Tolerance is used to find solution in every limit cases. raises NegativeValue in case of NegativeRadius.

	:param Point1:
	:type Point1: gp_Pnt2d
	:param OnCurv:
	:type OnCurv: Geom2dAdaptor_Curve &
	:param Radius:
	:type Radius: float
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Geom2dGcc_Circ2dTanOnRadGeo;
		 Geom2dGcc_Circ2dTanOnRadGeo (const gp_Pnt2d & Point1,const Geom2dAdaptor_Curve & OnCurv,const Standard_Real Radius,const Standard_Real Tolerance);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* This method returns True if the construction algorithm succeeded.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "	* This method returns the number of solutions. It raises NotDone if the construction algorithm didn't succeed.

	:rtype: int
") NbSolutions;
		Standard_Integer NbSolutions ();
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "	* Returns the solution number Index and raises OutOfRange exception if Index is greater than the number of solutions. Be careful: the Index is only a way to get all the solutions, but is not associated to theses outside the context of the algorithm-object. It raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions.

	:param Index:
	:type Index: int
	:rtype: gp_Circ2d
") ThisSolution;
		gp_Circ2d ThisSolution (const Standard_Integer Index);
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Qualif1:
	:type Qualif1: GccEnt_Position &
	:rtype: None
") WhichQualifier;
		void WhichQualifier (const Standard_Integer Index,GccEnt_Position & Qualif1);
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "	* Returns informations about the tangency point between the result number Index and the first argument. ParSol is the intrinsic parameter of the point on the solution curv. ParArg is the intrinsic parameter of the point on the argument curv. PntSol is the tangency point on the solution curv. PntArg is the tangency point on the argument curv. It raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions.

	:param Index:
	:type Index: int
	:param ParSol:
	:type ParSol: float &
	:param ParArg:
	:type ParArg: float &
	:param PntSol:
	:type PntSol: gp_Pnt2d
	:rtype: None
") Tangency1;
		void Tangency1 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("compactdefaultargs") CenterOn3;
		%feature("autodoc", "	* Returns informations about the center (on the curv) of the result. ParArg is the intrinsic parameter of the point on the argument curv. PntSol is the center point of the solution curv. It raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions.

	:param Index:
	:type Index: int
	:param ParArg:
	:type ParArg: float &
	:param PntSol:
	:type PntSol: gp_Pnt2d
	:rtype: None
") CenterOn3;
		void CenterOn3 (const Standard_Integer Index,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("compactdefaultargs") IsTheSame1;
		%feature("autodoc", "	* Returns True if the solution number Index is equal to the first argument and False in the other cases. It raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions.

	:param Index:
	:type Index: int
	:rtype: bool
") IsTheSame1;
		Standard_Boolean IsTheSame1 (const Standard_Integer Index);
};


%extend Geom2dGcc_Circ2dTanOnRadGeo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class Geom2dGcc_CurveTool {
	public:
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "	:param C:
	:type C: Geom2dAdaptor_Curve &
	:rtype: float
") FirstParameter;
		static Standard_Real FirstParameter (const Geom2dAdaptor_Curve & C);
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "	:param C:
	:type C: Geom2dAdaptor_Curve &
	:rtype: float
") LastParameter;
		static Standard_Real LastParameter (const Geom2dAdaptor_Curve & C);
		%feature("compactdefaultargs") EpsX;
		%feature("autodoc", "	:param C:
	:type C: Geom2dAdaptor_Curve &
	:param Tol:
	:type Tol: float
	:rtype: float
") EpsX;
		static Standard_Real EpsX (const Geom2dAdaptor_Curve & C,const Standard_Real Tol);
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "	:param C:
	:type C: Geom2dAdaptor_Curve &
	:rtype: int
") NbSamples;
		static Standard_Integer NbSamples (const Geom2dAdaptor_Curve & C);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param C:
	:type C: Geom2dAdaptor_Curve &
	:param X:
	:type X: float
	:rtype: gp_Pnt2d
") Value;
		static gp_Pnt2d Value (const Geom2dAdaptor_Curve & C,const Standard_Real X);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param C:
	:type C: Geom2dAdaptor_Curve &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param T:
	:type T: gp_Vec2d
	:rtype: void
") D1;
		static void D1 (const Geom2dAdaptor_Curve & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & T);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	:param C:
	:type C: Geom2dAdaptor_Curve &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param T:
	:type T: gp_Vec2d
	:param N:
	:type N: gp_Vec2d
	:rtype: void
") D2;
		static void D2 (const Geom2dAdaptor_Curve & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & T,gp_Vec2d & N);
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	:param C:
	:type C: Geom2dAdaptor_Curve &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param T:
	:type T: gp_Vec2d
	:param N:
	:type N: gp_Vec2d
	:param dN:
	:type dN: gp_Vec2d
	:rtype: void
") D3;
		static void D3 (const Geom2dAdaptor_Curve & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & T,gp_Vec2d & N,gp_Vec2d & dN);
};


%extend Geom2dGcc_CurveTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class Geom2dGcc_CurveToolGeo {
	public:
		%feature("compactdefaultargs") TheType;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_OffsetCurve &
	:rtype: GeomAbs_CurveType
") TheType;
		static GeomAbs_CurveType TheType (const Adaptor3d_OffsetCurve & C);
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	* Returns the Lin2d from gp corresponding to the curve C. This method is called only when TheType returns IntCurve_Lin.

	:param C:
	:type C: Adaptor3d_OffsetCurve &
	:rtype: gp_Lin2d
") Line;
		static gp_Lin2d Line (const Adaptor3d_OffsetCurve & C);
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "	* Returns the Circ2d from gp corresponding to the curve C. This method is called only when TheType returns IntCurve_Cir.

	:param C:
	:type C: Adaptor3d_OffsetCurve &
	:rtype: gp_Circ2d
") Circle;
		static gp_Circ2d Circle (const Adaptor3d_OffsetCurve & C);
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "	* Returns the Elips2d from gp corresponding to the curve C. This method is called only when TheType returns IntCurve_Eli.

	:param C:
	:type C: Adaptor3d_OffsetCurve &
	:rtype: gp_Elips2d
") Ellipse;
		static gp_Elips2d Ellipse (const Adaptor3d_OffsetCurve & C);
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "	* Returns the Parab2d from gp corresponding to the curve C. This method is called only when TheType returns IntCurve_Prb.

	:param C:
	:type C: Adaptor3d_OffsetCurve &
	:rtype: gp_Parab2d
") Parabola;
		static gp_Parab2d Parabola (const Adaptor3d_OffsetCurve & C);
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "	* Returns the Hypr2d from gp corresponding to the curve C. This method is called only when TheType returns IntCurve_Hpr.

	:param C:
	:type C: Adaptor3d_OffsetCurve &
	:rtype: gp_Hypr2d
") Hyperbola;
		static gp_Hypr2d Hyperbola (const Adaptor3d_OffsetCurve & C);
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_OffsetCurve &
	:rtype: float
") FirstParameter;
		static Standard_Real FirstParameter (const Adaptor3d_OffsetCurve & C);
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_OffsetCurve &
	:rtype: float
") LastParameter;
		static Standard_Real LastParameter (const Adaptor3d_OffsetCurve & C);
		%feature("compactdefaultargs") EpsX;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_OffsetCurve &
	:param Tol:
	:type Tol: float
	:rtype: float
") EpsX;
		static Standard_Real EpsX (const Adaptor3d_OffsetCurve & C,const Standard_Real Tol);
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_OffsetCurve &
	:rtype: int
") NbSamples;
		static Standard_Integer NbSamples (const Adaptor3d_OffsetCurve & C);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_OffsetCurve &
	:param X:
	:type X: float
	:rtype: gp_Pnt2d
") Value;
		static gp_Pnt2d Value (const Adaptor3d_OffsetCurve & C,const Standard_Real X);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_OffsetCurve &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param T:
	:type T: gp_Vec2d
	:rtype: void
") D1;
		static void D1 (const Adaptor3d_OffsetCurve & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & T);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_OffsetCurve &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param T:
	:type T: gp_Vec2d
	:param N:
	:type N: gp_Vec2d
	:rtype: void
") D2;
		static void D2 (const Adaptor3d_OffsetCurve & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & T,gp_Vec2d & N);
		%feature("compactdefaultargs") IsComposite;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_OffsetCurve &
	:rtype: bool
") IsComposite;
		static Standard_Boolean IsComposite (const Adaptor3d_OffsetCurve & C);
		%feature("compactdefaultargs") GetIntervals;
		%feature("autodoc", "	* Outputs the number of interval of continuity C1 of the curve used if Type == Composite.

	:param C:
	:type C: Adaptor3d_OffsetCurve &
	:rtype: int
") GetIntervals;
		static Standard_Integer GetIntervals (const Adaptor3d_OffsetCurve & C);
		%feature("compactdefaultargs") GetInterval;
		%feature("autodoc", "	* Outputs the bounds of interval of index <Index> used if Type == Composite.

	:param C:
	:type C: Adaptor3d_OffsetCurve &
	:param Index:
	:type Index: int
	:param U1:
	:type U1: float &
	:param U2:
	:type U2: float &
	:rtype: void
") GetInterval;
		static void GetInterval (const Adaptor3d_OffsetCurve & C,const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") SetCurrentInterval;
		%feature("autodoc", "	* Set the current valid interval of index <Index> inside which the computations will be done (used if Type == Composite).

	:param C:
	:type C: Adaptor3d_OffsetCurve &
	:param Index:
	:type Index: int
	:rtype: void
") SetCurrentInterval;
		static void SetCurrentInterval (Adaptor3d_OffsetCurve & C,const Standard_Integer Index);
};


%extend Geom2dGcc_CurveToolGeo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Geom2dGcc_FunctionTanCirCu;
class Geom2dGcc_FunctionTanCirCu : public math_FunctionWithDerivative {
	public:
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanCirCu;
		%feature("autodoc", "	:param Circ:
	:type Circ: gp_Circ2d
	:param Curv:
	:type Curv: Geom2dAdaptor_Curve &
	:rtype: None
") Geom2dGcc_FunctionTanCirCu;
		 Geom2dGcc_FunctionTanCirCu (const gp_Circ2d & Circ,const Geom2dAdaptor_Curve & Curv);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Computes the value of the function F for the variable X. It returns True if the computation is successfully done, False otherwise.

	:param X:
	:type X: float
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Real X,Standard_Real &OutValue);
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Computes the derivative of the function F for the variable X. It returns True if the computation is successfully done, False otherwise.

	:param X:
	:type X: float
	:param Deriv:
	:type Deriv: float &
	:rtype: bool
") Derivative;
		Standard_Boolean Derivative (const Standard_Real X,Standard_Real &OutValue);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Computes the value and the derivative of the function F for the variable X. It returns True if the computation is successfully done, False otherwise.

	:param X:
	:type X: float
	:param F:
	:type F: float &
	:param Deriv:
	:type Deriv: float &
	:rtype: bool
") Values;
		Standard_Boolean Values (const Standard_Real X,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend Geom2dGcc_FunctionTanCirCu {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Geom2dGcc_FunctionTanCuCu;
class Geom2dGcc_FunctionTanCuCu : public math_FunctionSetWithDerivatives {
	public:
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanCuCu;
		%feature("autodoc", "	:param Curv1:
	:type Curv1: Geom2dAdaptor_Curve &
	:param Curv2:
	:type Curv2: Geom2dAdaptor_Curve &
	:rtype: None
") Geom2dGcc_FunctionTanCuCu;
		 Geom2dGcc_FunctionTanCuCu (const Geom2dAdaptor_Curve & Curv1,const Geom2dAdaptor_Curve & Curv2);
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanCuCu;
		%feature("autodoc", "	:param Circ1:
	:type Circ1: gp_Circ2d
	:param Curv2:
	:type Curv2: Geom2dAdaptor_Curve &
	:rtype: None
") Geom2dGcc_FunctionTanCuCu;
		 Geom2dGcc_FunctionTanCuCu (const gp_Circ2d & Circ1,const Geom2dAdaptor_Curve & Curv2);
		%feature("compactdefaultargs") InitDerivative;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param Point1:
	:type Point1: gp_Pnt2d
	:param Point2:
	:type Point2: gp_Pnt2d
	:param Tan1:
	:type Tan1: gp_Vec2d
	:param Tan2:
	:type Tan2: gp_Vec2d
	:param D21:
	:type D21: gp_Vec2d
	:param D22:
	:type D22: gp_Vec2d
	:rtype: None
") InitDerivative;
		void InitDerivative (const math_Vector & X,gp_Pnt2d & Point1,gp_Pnt2d & Point2,gp_Vec2d & Tan1,gp_Vec2d & Tan2,gp_Vec2d & D21,gp_Vec2d & D22);
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	* returns the number of variables of the function.

	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	* returns the number of equations of the function.

	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Computes the value of the function F for the variable X. It returns True if the computation is successfully done, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "	* Computes the derivative of the function F for the variable X. It returns True if the computation is successfully done, False otherwise.

	:param X:
	:type X: math_Vector &
	:param Deriv:
	:type Deriv: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & Deriv);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Computes the value and the derivative of the function F for the variable X. It returns True if the computation is successfully done, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:param Deriv:
	:type Deriv: math_Matrix &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & Deriv);
};


%extend Geom2dGcc_FunctionTanCuCu {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Geom2dGcc_FunctionTanCuCuOnCu;
class Geom2dGcc_FunctionTanCuCuOnCu : public math_FunctionSetWithDerivatives {
	public:
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanCuCuOnCu;
		%feature("autodoc", "	:param C1:
	:type C1: Geom2dAdaptor_Curve &
	:param C2:
	:type C2: Geom2dAdaptor_Curve &
	:param OnCi:
	:type OnCi: gp_Circ2d
	:param Rad:
	:type Rad: float
	:rtype: None
") Geom2dGcc_FunctionTanCuCuOnCu;
		 Geom2dGcc_FunctionTanCuCuOnCu (const Geom2dAdaptor_Curve & C1,const Geom2dAdaptor_Curve & C2,const gp_Circ2d & OnCi,const Standard_Real Rad);
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanCuCuOnCu;
		%feature("autodoc", "	:param C1:
	:type C1: gp_Circ2d
	:param C2:
	:type C2: Geom2dAdaptor_Curve &
	:param OnCi:
	:type OnCi: gp_Circ2d
	:param Rad:
	:type Rad: float
	:rtype: None
") Geom2dGcc_FunctionTanCuCuOnCu;
		 Geom2dGcc_FunctionTanCuCuOnCu (const gp_Circ2d & C1,const Geom2dAdaptor_Curve & C2,const gp_Circ2d & OnCi,const Standard_Real Rad);
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanCuCuOnCu;
		%feature("autodoc", "	:param L1:
	:type L1: gp_Lin2d
	:param C2:
	:type C2: Geom2dAdaptor_Curve &
	:param OnCi:
	:type OnCi: gp_Circ2d
	:param Rad:
	:type Rad: float
	:rtype: None
") Geom2dGcc_FunctionTanCuCuOnCu;
		 Geom2dGcc_FunctionTanCuCuOnCu (const gp_Lin2d & L1,const Geom2dAdaptor_Curve & C2,const gp_Circ2d & OnCi,const Standard_Real Rad);
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanCuCuOnCu;
		%feature("autodoc", "	:param C1:
	:type C1: Geom2dAdaptor_Curve &
	:param P2:
	:type P2: gp_Pnt2d
	:param OnCi:
	:type OnCi: gp_Circ2d
	:param Rad:
	:type Rad: float
	:rtype: None
") Geom2dGcc_FunctionTanCuCuOnCu;
		 Geom2dGcc_FunctionTanCuCuOnCu (const Geom2dAdaptor_Curve & C1,const gp_Pnt2d & P2,const gp_Circ2d & OnCi,const Standard_Real Rad);
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanCuCuOnCu;
		%feature("autodoc", "	:param C1:
	:type C1: Geom2dAdaptor_Curve &
	:param C2:
	:type C2: Geom2dAdaptor_Curve &
	:param OnLi:
	:type OnLi: gp_Lin2d
	:param Rad:
	:type Rad: float
	:rtype: None
") Geom2dGcc_FunctionTanCuCuOnCu;
		 Geom2dGcc_FunctionTanCuCuOnCu (const Geom2dAdaptor_Curve & C1,const Geom2dAdaptor_Curve & C2,const gp_Lin2d & OnLi,const Standard_Real Rad);
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanCuCuOnCu;
		%feature("autodoc", "	:param C1:
	:type C1: gp_Circ2d
	:param C2:
	:type C2: Geom2dAdaptor_Curve &
	:param OnLi:
	:type OnLi: gp_Lin2d
	:param Rad:
	:type Rad: float
	:rtype: None
") Geom2dGcc_FunctionTanCuCuOnCu;
		 Geom2dGcc_FunctionTanCuCuOnCu (const gp_Circ2d & C1,const Geom2dAdaptor_Curve & C2,const gp_Lin2d & OnLi,const Standard_Real Rad);
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanCuCuOnCu;
		%feature("autodoc", "	:param L1:
	:type L1: gp_Lin2d
	:param C2:
	:type C2: Geom2dAdaptor_Curve &
	:param OnLi:
	:type OnLi: gp_Lin2d
	:param Rad:
	:type Rad: float
	:rtype: None
") Geom2dGcc_FunctionTanCuCuOnCu;
		 Geom2dGcc_FunctionTanCuCuOnCu (const gp_Lin2d & L1,const Geom2dAdaptor_Curve & C2,const gp_Lin2d & OnLi,const Standard_Real Rad);
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanCuCuOnCu;
		%feature("autodoc", "	:param C1:
	:type C1: Geom2dAdaptor_Curve &
	:param P2:
	:type P2: gp_Pnt2d
	:param OnLi:
	:type OnLi: gp_Lin2d
	:param Rad:
	:type Rad: float
	:rtype: None
") Geom2dGcc_FunctionTanCuCuOnCu;
		 Geom2dGcc_FunctionTanCuCuOnCu (const Geom2dAdaptor_Curve & C1,const gp_Pnt2d & P2,const gp_Lin2d & OnLi,const Standard_Real Rad);
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanCuCuOnCu;
		%feature("autodoc", "	:param C1:
	:type C1: Geom2dAdaptor_Curve &
	:param C2:
	:type C2: Geom2dAdaptor_Curve &
	:param OnCu:
	:type OnCu: Geom2dAdaptor_Curve &
	:param Rad:
	:type Rad: float
	:rtype: None
") Geom2dGcc_FunctionTanCuCuOnCu;
		 Geom2dGcc_FunctionTanCuCuOnCu (const Geom2dAdaptor_Curve & C1,const Geom2dAdaptor_Curve & C2,const Geom2dAdaptor_Curve & OnCu,const Standard_Real Rad);
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanCuCuOnCu;
		%feature("autodoc", "	:param C1:
	:type C1: gp_Circ2d
	:param C2:
	:type C2: Geom2dAdaptor_Curve &
	:param OnCu:
	:type OnCu: Geom2dAdaptor_Curve &
	:param Rad:
	:type Rad: float
	:rtype: None
") Geom2dGcc_FunctionTanCuCuOnCu;
		 Geom2dGcc_FunctionTanCuCuOnCu (const gp_Circ2d & C1,const Geom2dAdaptor_Curve & C2,const Geom2dAdaptor_Curve & OnCu,const Standard_Real Rad);
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanCuCuOnCu;
		%feature("autodoc", "	:param L1:
	:type L1: gp_Lin2d
	:param C2:
	:type C2: Geom2dAdaptor_Curve &
	:param OnCu:
	:type OnCu: Geom2dAdaptor_Curve &
	:param Rad:
	:type Rad: float
	:rtype: None
") Geom2dGcc_FunctionTanCuCuOnCu;
		 Geom2dGcc_FunctionTanCuCuOnCu (const gp_Lin2d & L1,const Geom2dAdaptor_Curve & C2,const Geom2dAdaptor_Curve & OnCu,const Standard_Real Rad);
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanCuCuOnCu;
		%feature("autodoc", "	:param C1:
	:type C1: Geom2dAdaptor_Curve &
	:param P1:
	:type P1: gp_Pnt2d
	:param OnCu:
	:type OnCu: Geom2dAdaptor_Curve &
	:param Rad:
	:type Rad: float
	:rtype: None
") Geom2dGcc_FunctionTanCuCuOnCu;
		 Geom2dGcc_FunctionTanCuCuOnCu (const Geom2dAdaptor_Curve & C1,const gp_Pnt2d & P1,const Geom2dAdaptor_Curve & OnCu,const Standard_Real Rad);
		%feature("compactdefaultargs") InitDerivative;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param Point1:
	:type Point1: gp_Pnt2d
	:param Point2:
	:type Point2: gp_Pnt2d
	:param Point3:
	:type Point3: gp_Pnt2d
	:param Tan1:
	:type Tan1: gp_Vec2d
	:param Tan2:
	:type Tan2: gp_Vec2d
	:param Tan3:
	:type Tan3: gp_Vec2d
	:param D21:
	:type D21: gp_Vec2d
	:param D22:
	:type D22: gp_Vec2d
	:param D23:
	:type D23: gp_Vec2d
	:rtype: None
") InitDerivative;
		void InitDerivative (const math_Vector & X,gp_Pnt2d & Point1,gp_Pnt2d & Point2,gp_Pnt2d & Point3,gp_Vec2d & Tan1,gp_Vec2d & Tan2,gp_Vec2d & Tan3,gp_Vec2d & D21,gp_Vec2d & D22,gp_Vec2d & D23);
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	* Returns the number of variables of the function.

	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	* Returns the number of equations of the function.

	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Computes the values of the Functions for the variable <X>.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "	* Returns the values of the derivatives for the variable <X>.

	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Returns the values of the functions and the derivatives for the variable <X>.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
};


%extend Geom2dGcc_FunctionTanCuCuOnCu {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Geom2dGcc_FunctionTanCuPnt;
class Geom2dGcc_FunctionTanCuPnt : public math_FunctionWithDerivative {
	public:
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanCuPnt;
		%feature("autodoc", "	:param C:
	:type C: Geom2dAdaptor_Curve &
	:param Point:
	:type Point: gp_Pnt2d
	:rtype: None
") Geom2dGcc_FunctionTanCuPnt;
		 Geom2dGcc_FunctionTanCuPnt (const Geom2dAdaptor_Curve & C,const gp_Pnt2d & Point);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Computes the value of the function F for the variable X. It returns True if the computation is successfully done, False otherwise.

	:param X:
	:type X: float
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Real X,Standard_Real &OutValue);
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Computes the derivative of the function F for the variable X. It returns True if the computation is successfully done, False otherwise.

	:param X:
	:type X: float
	:param Deriv:
	:type Deriv: float &
	:rtype: bool
") Derivative;
		Standard_Boolean Derivative (const Standard_Real X,Standard_Real &OutValue);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Computes the value and the derivative of the function F for the variable X. It returns True if the computation is successfully done, False otherwise.

	:param X:
	:type X: float
	:param F:
	:type F: float &
	:param Deriv:
	:type Deriv: float &
	:rtype: bool
") Values;
		Standard_Boolean Values (const Standard_Real X,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend Geom2dGcc_FunctionTanCuPnt {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Geom2dGcc_FunctionTanObl;
class Geom2dGcc_FunctionTanObl : public math_FunctionWithDerivative {
	public:
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanObl;
		%feature("autodoc", "	:param Curve:
	:type Curve: Geom2dAdaptor_Curve &
	:param Dir:
	:type Dir: gp_Dir2d
	:rtype: None
") Geom2dGcc_FunctionTanObl;
		 Geom2dGcc_FunctionTanObl (const Geom2dAdaptor_Curve & Curve,const gp_Dir2d & Dir);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Computes the value of the function F for the variable X. It returns True if the computation is successfully done, False otherwise.

	:param X:
	:type X: float
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Real X,Standard_Real &OutValue);
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Computes the derivative of the function F for the variable X. It returns True if the computation is successfully done, False otherwise.

	:param X:
	:type X: float
	:param Deriv:
	:type Deriv: float &
	:rtype: bool
") Derivative;
		Standard_Boolean Derivative (const Standard_Real X,Standard_Real &OutValue);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Computes the value and the derivative of the function F for the variable X. It returns True if the computation is successfully done, False otherwise.

	:param X:
	:type X: float
	:param F:
	:type F: float &
	:param Deriv:
	:type Deriv: float &
	:rtype: bool
") Values;
		Standard_Boolean Values (const Standard_Real X,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend Geom2dGcc_FunctionTanObl {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Geom2dGcc_Lin2d2Tan;
class Geom2dGcc_Lin2d2Tan {
	public:
		%feature("compactdefaultargs") Geom2dGcc_Lin2d2Tan;
		%feature("autodoc", "	* This class implements the algorithms used to create 2d line tangent to two curves. Tolang is used to determine the tolerance for the tangency points.

	:param Qualified1:
	:type Qualified1: Geom2dGcc_QualifiedCurve &
	:param Qualified2:
	:type Qualified2: Geom2dGcc_QualifiedCurve &
	:param Tolang:
	:type Tolang: float
	:rtype: None
") Geom2dGcc_Lin2d2Tan;
		 Geom2dGcc_Lin2d2Tan (const Geom2dGcc_QualifiedCurve & Qualified1,const Geom2dGcc_QualifiedCurve & Qualified2,const Standard_Real Tolang);
		%feature("compactdefaultargs") Geom2dGcc_Lin2d2Tan;
		%feature("autodoc", "	* This class implements the algorithms used to create 2d lines passing thrue a point and tangent to a curve. Tolang is used to determine the tolerance for the tangency points.

	:param Qualified1:
	:type Qualified1: Geom2dGcc_QualifiedCurve &
	:param ThePoint:
	:type ThePoint: gp_Pnt2d
	:param Tolang:
	:type Tolang: float
	:rtype: None
") Geom2dGcc_Lin2d2Tan;
		 Geom2dGcc_Lin2d2Tan (const Geom2dGcc_QualifiedCurve & Qualified1,const gp_Pnt2d & ThePoint,const Standard_Real Tolang);
		%feature("compactdefaultargs") Geom2dGcc_Lin2d2Tan;
		%feature("autodoc", "	* This class implements the algorithms used to create 2d line tangent to two curves. Tolang is used to determine the tolerance for the tangency points. Param1 is used for the initial guess on the first curve. Param2 is used for the initial guess on the second curve.

	:param Qualified1:
	:type Qualified1: Geom2dGcc_QualifiedCurve &
	:param Qualified2:
	:type Qualified2: Geom2dGcc_QualifiedCurve &
	:param Tolang:
	:type Tolang: float
	:param Param1:
	:type Param1: float
	:param Param2:
	:type Param2: float
	:rtype: None
") Geom2dGcc_Lin2d2Tan;
		 Geom2dGcc_Lin2d2Tan (const Geom2dGcc_QualifiedCurve & Qualified1,const Geom2dGcc_QualifiedCurve & Qualified2,const Standard_Real Tolang,const Standard_Real Param1,const Standard_Real Param2);
		%feature("compactdefaultargs") Geom2dGcc_Lin2d2Tan;
		%feature("autodoc", "	* This class implements the algorithms used to create 2d lines passing thrue a point and tangent to a curve. Tolang is used to determine the tolerance for the tangency points. Param2 is used for the initial guess on the curve.

	:param Qualified1:
	:type Qualified1: Geom2dGcc_QualifiedCurve &
	:param ThePoint:
	:type ThePoint: gp_Pnt2d
	:param Tolang:
	:type Tolang: float
	:param Param1:
	:type Param1: float
	:rtype: None
") Geom2dGcc_Lin2d2Tan;
		 Geom2dGcc_Lin2d2Tan (const Geom2dGcc_QualifiedCurve & Qualified1,const gp_Pnt2d & ThePoint,const Standard_Real Tolang,const Standard_Real Param1);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns true if the construction algorithm does not fail (even if it finds no solution). Note: IsDone protects against a failure arising from a more internal intersection algorithm, which has reached its numeric limits.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "	* Returns the number of lines, representing solutions computed by this algorithm. Exceptions StdFail_NotDone if the construction fails.R

	:rtype: int
") NbSolutions;
		Standard_Integer NbSolutions ();
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "	* Returns a line, representing the solution of index Index computed by this algorithm. Warning This indexing simply provides a means of consulting the solutions. The index values are not associated with these solutions outside the context of the algorithm object. Exceptions Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.

	:param Index:
	:type Index: int
	:rtype: gp_Lin2d
") ThisSolution;
		gp_Lin2d ThisSolution (const Standard_Integer Index);
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "	* Returns the qualifiers Qualif1 and Qualif2 of the tangency arguments for the solution of index Index computed by this algorithm. The returned qualifiers are: - those specified at the start of construction when the solutions are defined as enclosing or outside with respect to the arguments, or - those computed during construction (i.e. enclosing or outside) when the solutions are defined as unqualified with respect to the arguments, or - GccEnt_noqualifier if the tangency argument is a point. Exceptions Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.

	:param Index:
	:type Index: int
	:param Qualif1:
	:type Qualif1: GccEnt_Position &
	:param Qualif2:
	:type Qualif2: GccEnt_Position &
	:rtype: None
") WhichQualifier;
		void WhichQualifier (const Standard_Integer Index,GccEnt_Position & Qualif1,GccEnt_Position & Qualif2);
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "	* Returns informations about the tangency point between the result and the first argument. ParSol is the intrinsic parameter of the point PntSol on the solution curv. ParArg is the intrinsic parameter of the point PntSol on the argument curv. Exceptions Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.

	:param Index:
	:type Index: int
	:param ParSol:
	:type ParSol: float &
	:param ParArg:
	:type ParArg: float &
	:param PntSol:
	:type PntSol: gp_Pnt2d
	:rtype: None
") Tangency1;
		void Tangency1 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("compactdefaultargs") Tangency2;
		%feature("autodoc", "	* Returns informations about the tangency point between the result and the first argument. ParSol is the intrinsic parameter of the point PntSol on the solution curv. ParArg is the intrinsic parameter of the point PntSol on the argument curv. Exceptions Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.

	:param Index:
	:type Index: int
	:param ParSol:
	:type ParSol: float &
	:param ParArg:
	:type ParArg: float &
	:param PntSol:
	:type PntSol: gp_Pnt2d
	:rtype: None
") Tangency2;
		void Tangency2 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
};


%extend Geom2dGcc_Lin2d2Tan {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Geom2dGcc_Lin2d2TanIter;
class Geom2dGcc_Lin2d2TanIter {
	public:
		%feature("compactdefaultargs") Geom2dGcc_Lin2d2TanIter;
		%feature("autodoc", "	* This class implements the algorithms used to create 2d lines passing thrue a point and tangent to a curve. Tolang is used to determine the tolerance for the tangency points. Param2 is used for the initial guess on the curve.

	:param Qualified1:
	:type Qualified1: Geom2dGcc_QCurve &
	:param ThePoint:
	:type ThePoint: gp_Pnt2d
	:param Param1:
	:type Param1: float
	:param Tolang:
	:type Tolang: float
	:rtype: None
") Geom2dGcc_Lin2d2TanIter;
		 Geom2dGcc_Lin2d2TanIter (const Geom2dGcc_QCurve & Qualified1,const gp_Pnt2d & ThePoint,const Standard_Real Param1,const Standard_Real Tolang);
		%feature("compactdefaultargs") Geom2dGcc_Lin2d2TanIter;
		%feature("autodoc", "	* This class implements the algorithms used to create 2d line tangent to a circle and to a cuve. Tolang is used to determine the tolerance for the tangency points. Param2 is used for the initial guess on the curve. Exception BadQualifier is raised in the case of EnclosedCirc

	:param Qualified1:
	:type Qualified1: GccEnt_QualifiedCirc &
	:param Qualified2:
	:type Qualified2: Geom2dGcc_QCurve &
	:param Param2:
	:type Param2: float
	:param Tolang:
	:type Tolang: float
	:rtype: None
") Geom2dGcc_Lin2d2TanIter;
		 Geom2dGcc_Lin2d2TanIter (const GccEnt_QualifiedCirc & Qualified1,const Geom2dGcc_QCurve & Qualified2,const Standard_Real Param2,const Standard_Real Tolang);
		%feature("compactdefaultargs") Geom2dGcc_Lin2d2TanIter;
		%feature("autodoc", "	* This class implements the algorithms used to create 2d line tangent to two curves. Tolang is used to determine the tolerance for the tangency points. Param1 is used for the initial guess on the first curve. Param2 is used for the initial guess on the second curve.

	:param Qualified1:
	:type Qualified1: Geom2dGcc_QCurve &
	:param Qualified2:
	:type Qualified2: Geom2dGcc_QCurve &
	:param Param1:
	:type Param1: float
	:param Param2:
	:type Param2: float
	:param Tolang:
	:type Tolang: float
	:rtype: None
") Geom2dGcc_Lin2d2TanIter;
		 Geom2dGcc_Lin2d2TanIter (const Geom2dGcc_QCurve & Qualified1,const Geom2dGcc_QCurve & Qualified2,const Standard_Real Param1,const Standard_Real Param2,const Standard_Real Tolang);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* This methode returns true when there is a solution and false in the other cases.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "	* Returns the solution.

	:rtype: gp_Lin2d
") ThisSolution;
		gp_Lin2d ThisSolution ();
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "	:param Qualif1:
	:type Qualif1: GccEnt_Position &
	:param Qualif2:
	:type Qualif2: GccEnt_Position &
	:rtype: None
") WhichQualifier;
		void WhichQualifier (GccEnt_Position & Qualif1,GccEnt_Position & Qualif2);
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "	* Returns informations about the tangency point between the result and the first argument. ParSol is the intrinsic parameter of the point PntSol on the solution curv. ParArg is the intrinsic parameter of the point PntSol on the argument curv.

	:param ParSol:
	:type ParSol: float &
	:param ParArg:
	:type ParArg: float &
	:param PntSol:
	:type PntSol: gp_Pnt2d
	:rtype: None
") Tangency1;
		void Tangency1 (Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("compactdefaultargs") Tangency2;
		%feature("autodoc", "	:param ParSol:
	:type ParSol: float &
	:param ParArg:
	:type ParArg: float &
	:param PntSol:
	:type PntSol: gp_Pnt2d
	:rtype: None
") Tangency2;
		void Tangency2 (Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
};


%extend Geom2dGcc_Lin2d2TanIter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Geom2dGcc_Lin2dTanObl;
class Geom2dGcc_Lin2dTanObl {
	public:
		%feature("compactdefaultargs") Geom2dGcc_Lin2dTanObl;
		%feature("autodoc", "	* This class implements the algorithm used to create 2d line tangent to a curve and doing an angle Angle with the line TheLin. Angle must be in Radian. Tolang is the angular tolerance.

	:param Qualified1:
	:type Qualified1: Geom2dGcc_QualifiedCurve &
	:param TheLin:
	:type TheLin: gp_Lin2d
	:param TolAng:
	:type TolAng: float
	:param Angle:
	:type Angle: float
	:rtype: None
") Geom2dGcc_Lin2dTanObl;
		 Geom2dGcc_Lin2dTanObl (const Geom2dGcc_QualifiedCurve & Qualified1,const gp_Lin2d & TheLin,const Standard_Real TolAng,const Standard_Real Angle);
		%feature("compactdefaultargs") Geom2dGcc_Lin2dTanObl;
		%feature("autodoc", "	* This class implements the algorithm used to create 2d line tangent to a curve and doing an angle Angle with the line TheLin. Angle must be in Radian. Param2 is the initial guess on the curve QualifiedCurv. Tolang is the angular tolerance. Warning An iterative algorithm is used if Qualified1 is more complex than a line or a circle. In such cases, the algorithm constructs only one solution. Exceptions GccEnt_BadQualifier if a qualifier is inconsistent with the argument it qualifies (for example, enclosed for a circle).

	:param Qualified1:
	:type Qualified1: Geom2dGcc_QualifiedCurve &
	:param TheLin:
	:type TheLin: gp_Lin2d
	:param TolAng:
	:type TolAng: float
	:param Param1:
	:type Param1: float
	:param Angle:
	:type Angle: float
	:rtype: None
") Geom2dGcc_Lin2dTanObl;
		 Geom2dGcc_Lin2dTanObl (const Geom2dGcc_QualifiedCurve & Qualified1,const gp_Lin2d & TheLin,const Standard_Real TolAng,const Standard_Real Param1,const Standard_Real Angle);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns true if the construction algorithm does not fail (even if it finds no solution). Note: IsDone protects against a failure arising from a more internal intersection algorithm, which has reached its numeric limits.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "	* Returns the number of lines, representing solutions computed by this algorithm. Exceptions StdFail_NotDone if the construction fails.

	:rtype: int
") NbSolutions;
		Standard_Integer NbSolutions ();
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "	* Returns a line, representing the solution of index Index computed by this algorithm. Exceptions Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.

	:param Index:
	:type Index: int
	:rtype: gp_Lin2d
") ThisSolution;
		gp_Lin2d ThisSolution (const Standard_Integer Index);
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "	* Returns the qualifier Qualif1 of the tangency argument for the solution of index Index computed by this algorithm. The returned qualifier is: - that specified at the start of construction when the solutions are defined as enclosing or outside with respect to the argument, or - that computed during construction (i.e. enclosing or outside) when the solutions are defined as unqualified with respect to the argument, or - GccEnt_noqualifier if the tangency argument is a point. Exceptions Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.

	:param Index:
	:type Index: int
	:param Qualif1:
	:type Qualif1: GccEnt_Position &
	:rtype: None
") WhichQualifier;
		void WhichQualifier (const Standard_Integer Index,GccEnt_Position & Qualif1);
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "	* Returns informations about the tangency point between the result and the first argument. ParSol is the intrinsic parameter of the point PntSol on the solution curv. ParArg is the intrinsic parameter of the point PntSol on the argument curv.

	:param Index:
	:type Index: int
	:param ParSol:
	:type ParSol: float &
	:param ParArg:
	:type ParArg: float &
	:param PntSol:
	:type PntSol: gp_Pnt2d
	:rtype: None
") Tangency1;
		void Tangency1 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("compactdefaultargs") Intersection2;
		%feature("autodoc", "	* Returns the point of intersection PntSol between the solution of index Index and the second argument (the line) of this algorithm. ParSol is the parameter of the point PntSol on the solution. ParArg is the parameter of the point PntSol on the second argument (the line). Exceptions StdFail_NotDone if the construction fails. Geom2dGcc_IsParallel if the solution and the second argument (the line) are parallel. Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm.

	:param Index:
	:type Index: int
	:param ParSol:
	:type ParSol: float &
	:param ParArg:
	:type ParArg: float &
	:param PntSol:
	:type PntSol: gp_Pnt2d
	:rtype: None
") Intersection2;
		void Intersection2 (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
};


%extend Geom2dGcc_Lin2dTanObl {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Geom2dGcc_Lin2dTanOblIter;
class Geom2dGcc_Lin2dTanOblIter {
	public:
		%feature("compactdefaultargs") Geom2dGcc_Lin2dTanOblIter;
		%feature("autodoc", "	* This class implements the algorithm used to create 2d line tangent to a curve and doing an angle Angle with the line TheLin. Angle must be in Radian. Param2 is the initial guess on the curve QualifiedCurv. Tolang is the angular tolerance.

	:param Qualified1:
	:type Qualified1: Geom2dGcc_QCurve &
	:param TheLin:
	:type TheLin: gp_Lin2d
	:param Param1:
	:type Param1: float
	:param TolAng:
	:type TolAng: float
	:param Angle: default value is 0
	:type Angle: float
	:rtype: None
") Geom2dGcc_Lin2dTanOblIter;
		 Geom2dGcc_Lin2dTanOblIter (const Geom2dGcc_QCurve & Qualified1,const gp_Lin2d & TheLin,const Standard_Real Param1,const Standard_Real TolAng,const Standard_Real Angle = 0);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* This method returns true when there is a solution and false in the other cases.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "	:rtype: gp_Lin2d
") ThisSolution;
		gp_Lin2d ThisSolution ();
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "	:param Qualif1:
	:type Qualif1: GccEnt_Position &
	:rtype: None
") WhichQualifier;
		void WhichQualifier (GccEnt_Position & Qualif1);
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "	:param ParSol:
	:type ParSol: float &
	:param ParArg:
	:type ParArg: float &
	:param PntSol:
	:type PntSol: gp_Pnt2d
	:rtype: None
") Tangency1;
		void Tangency1 (Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("compactdefaultargs") Intersection2;
		%feature("autodoc", "	:param ParSol:
	:type ParSol: float &
	:param ParArg:
	:type ParArg: float &
	:param PntSol:
	:type PntSol: gp_Pnt2d
	:rtype: None
") Intersection2;
		void Intersection2 (Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & PntSol);
		%feature("compactdefaultargs") IsParallel2;
		%feature("autodoc", "	:rtype: bool
") IsParallel2;
		Standard_Boolean IsParallel2 ();
};


%extend Geom2dGcc_Lin2dTanOblIter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Geom2dGcc_QCurve;
class Geom2dGcc_QCurve {
	public:
		%feature("compactdefaultargs") Geom2dGcc_QCurve;
		%feature("autodoc", "	:param Curve:
	:type Curve: Geom2dAdaptor_Curve &
	:param Qualifier:
	:type Qualifier: GccEnt_Position
	:rtype: None
") Geom2dGcc_QCurve;
		 Geom2dGcc_QCurve (const Geom2dAdaptor_Curve & Curve,const GccEnt_Position Qualifier);
		%feature("compactdefaultargs") Qualified;
		%feature("autodoc", "	:rtype: Geom2dAdaptor_Curve
") Qualified;
		Geom2dAdaptor_Curve Qualified ();
		%feature("compactdefaultargs") Qualifier;
		%feature("autodoc", "	:rtype: GccEnt_Position
") Qualifier;
		GccEnt_Position Qualifier ();
		%feature("compactdefaultargs") IsUnqualified;
		%feature("autodoc", "	* Returns true if the solution is unqualified and false in the other cases.

	:rtype: bool
") IsUnqualified;
		Standard_Boolean IsUnqualified ();
		%feature("compactdefaultargs") IsEnclosing;
		%feature("autodoc", "	* Returns true if the solution is Enclosing the Curv and false in the other cases.

	:rtype: bool
") IsEnclosing;
		Standard_Boolean IsEnclosing ();
		%feature("compactdefaultargs") IsEnclosed;
		%feature("autodoc", "	* Returns true if the solution is Enclosed in the Curv and false in the other cases.

	:rtype: bool
") IsEnclosed;
		Standard_Boolean IsEnclosed ();
		%feature("compactdefaultargs") IsOutside;
		%feature("autodoc", "	* Returns true if the solution is Outside the Curv and false in the other cases.

	:rtype: bool
") IsOutside;
		Standard_Boolean IsOutside ();
};


%extend Geom2dGcc_QCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Geom2dGcc_QualifiedCurve;
class Geom2dGcc_QualifiedCurve {
	public:
		%feature("compactdefaultargs") Geom2dGcc_QualifiedCurve;
		%feature("autodoc", "	* Constructs a qualified curve by assigning the qualifier Qualifier to the curve Curve. Qualifier may be: - GccEnt_enclosing if the solution of a construction algorithm using the qualified curve encloses the curve, or - GccEnt_enclosed if the solution is enclosed by the curve, or - GccEnt_outside if both the solution and the curve are external to one another, or - GccEnt_unqualified if all solutions apply. Note: The interior of a curve is defined as the left-hand side of the curve in relation to its orientation. Warning Curve is an adapted curve, i.e. an object which is an interface between: - the services provided by a 2D curve from the package Geom2d, - and those required on the curve by a computation algorithm. The adapted curve is created in the following way: Handle_Geom2d_Curve mycurve = ... ; Geom2dAdaptor_Curve Curve ( mycurve ) ; The qualified curve is then constructed with this object: GccEnt_Position myQualif = GccEnt_outside ; Geom2dGcc_QualifiedCurve myQCurve ( Curve, myQualif ); is private;

	:param Curve:
	:type Curve: Geom2dAdaptor_Curve &
	:param Qualifier:
	:type Qualifier: GccEnt_Position
	:rtype: None
") Geom2dGcc_QualifiedCurve;
		 Geom2dGcc_QualifiedCurve (const Geom2dAdaptor_Curve & Curve,const GccEnt_Position Qualifier);
		%feature("compactdefaultargs") Qualified;
		%feature("autodoc", "	* Returns a 2D curve to which the qualifier is assigned. Warning The returned curve is an adapted curve, i.e. an object which is an interface between: - the services provided by a 2D curve from the package Geom2d, - and those required on the curve by a computation algorithm. The Geom2d curve on which the adapted curve is based can be obtained in the following way: myQualifiedCurve = ... ; Geom2dAdaptor_Curve myAdaptedCurve = myQualifiedCurve.Qualified(); Handle_Geom2d_Curve = myAdaptedCurve.Curve();

	:rtype: Geom2dAdaptor_Curve
") Qualified;
		Geom2dAdaptor_Curve Qualified ();
		%feature("compactdefaultargs") Qualifier;
		%feature("autodoc", "	* Returns - the qualifier of this qualified curve if it is enclosing, enclosed or outside, or - GccEnt_noqualifier if it is unqualified.

	:rtype: GccEnt_Position
") Qualifier;
		GccEnt_Position Qualifier ();
		%feature("compactdefaultargs") IsUnqualified;
		%feature("autodoc", "	* Returns true if the solution is unqualified and false in the other cases.

	:rtype: bool
") IsUnqualified;
		Standard_Boolean IsUnqualified ();
		%feature("compactdefaultargs") IsEnclosing;
		%feature("autodoc", "	* It returns true if the solution is Enclosing the Curv and false in the other cases.

	:rtype: bool
") IsEnclosing;
		Standard_Boolean IsEnclosing ();
		%feature("compactdefaultargs") IsEnclosed;
		%feature("autodoc", "	* It returns true if the solution is Enclosed in the Curv and false in the other cases.

	:rtype: bool
") IsEnclosed;
		Standard_Boolean IsEnclosed ();
		%feature("compactdefaultargs") IsOutside;
		%feature("autodoc", "	* It returns true if the solution is Outside the Curv and false in the other cases.

	:rtype: bool
") IsOutside;
		Standard_Boolean IsOutside ();
};


%extend Geom2dGcc_QualifiedCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
