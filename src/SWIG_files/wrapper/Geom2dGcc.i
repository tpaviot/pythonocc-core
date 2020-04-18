/*
Copyright 2008-2020 Thomas Paviot (tpaviot@gmail.com)

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
%define GEOM2DGCCDOCSTRING
"Geom2dGcc module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_geom2dgcc.html"
%enddef
%module (package="OCC.Core", docstring=GEOM2DGCCDOCSTRING) Geom2dGcc


%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<Geom2dGcc_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<Geom2d_module.hxx>
#include<gp_module.hxx>
#include<GccAna_module.hxx>
#include<GccEnt_module.hxx>
#include<math_module.hxx>
#include<GccInt_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Geom2dAdaptor.i
%import Geom2d.i
%import gp.i
%import GccAna.i
%import GccEnt.i
%import math.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
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

enum Geom2dGcc_Type1 {
	Geom2dGcc_CuCuCu = 0,
	Geom2dGcc_CiCuCu = 1,
	Geom2dGcc_CiCiCu = 2,
	Geom2dGcc_CiLiCu = 3,
	Geom2dGcc_LiLiCu = 4,
	Geom2dGcc_LiCuCu = 5,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class Geom2dGcc_Type2(IntEnum):
	Geom2dGcc_CuCuOnCu = 0
	Geom2dGcc_CiCuOnCu = 1
	Geom2dGcc_LiCuOnCu = 2
	Geom2dGcc_CuPtOnCu = 3
	Geom2dGcc_CuCuOnLi = 4
	Geom2dGcc_CiCuOnLi = 5
	Geom2dGcc_LiCuOnLi = 6
	Geom2dGcc_CuPtOnLi = 7
	Geom2dGcc_CuCuOnCi = 8
	Geom2dGcc_CiCuOnCi = 9
	Geom2dGcc_LiCuOnCi = 10
	Geom2dGcc_CuPtOnCi = 11
Geom2dGcc_CuCuOnCu = Geom2dGcc_Type2.Geom2dGcc_CuCuOnCu
Geom2dGcc_CiCuOnCu = Geom2dGcc_Type2.Geom2dGcc_CiCuOnCu
Geom2dGcc_LiCuOnCu = Geom2dGcc_Type2.Geom2dGcc_LiCuOnCu
Geom2dGcc_CuPtOnCu = Geom2dGcc_Type2.Geom2dGcc_CuPtOnCu
Geom2dGcc_CuCuOnLi = Geom2dGcc_Type2.Geom2dGcc_CuCuOnLi
Geom2dGcc_CiCuOnLi = Geom2dGcc_Type2.Geom2dGcc_CiCuOnLi
Geom2dGcc_LiCuOnLi = Geom2dGcc_Type2.Geom2dGcc_LiCuOnLi
Geom2dGcc_CuPtOnLi = Geom2dGcc_Type2.Geom2dGcc_CuPtOnLi
Geom2dGcc_CuCuOnCi = Geom2dGcc_Type2.Geom2dGcc_CuCuOnCi
Geom2dGcc_CiCuOnCi = Geom2dGcc_Type2.Geom2dGcc_CiCuOnCi
Geom2dGcc_LiCuOnCi = Geom2dGcc_Type2.Geom2dGcc_LiCuOnCi
Geom2dGcc_CuPtOnCi = Geom2dGcc_Type2.Geom2dGcc_CuPtOnCi

class Geom2dGcc_Type3(IntEnum):
	Geom2dGcc_CuCu = 0
	Geom2dGcc_CiCu = 1
Geom2dGcc_CuCu = Geom2dGcc_Type3.Geom2dGcc_CuCu
Geom2dGcc_CiCu = Geom2dGcc_Type3.Geom2dGcc_CiCu

class Geom2dGcc_Type1(IntEnum):
	Geom2dGcc_CuCuCu = 0
	Geom2dGcc_CiCuCu = 1
	Geom2dGcc_CiCiCu = 2
	Geom2dGcc_CiLiCu = 3
	Geom2dGcc_LiLiCu = 4
	Geom2dGcc_LiCuCu = 5
Geom2dGcc_CuCuCu = Geom2dGcc_Type1.Geom2dGcc_CuCuCu
Geom2dGcc_CiCuCu = Geom2dGcc_Type1.Geom2dGcc_CiCuCu
Geom2dGcc_CiCiCu = Geom2dGcc_Type1.Geom2dGcc_CiCiCu
Geom2dGcc_CiLiCu = Geom2dGcc_Type1.Geom2dGcc_CiLiCu
Geom2dGcc_LiLiCu = Geom2dGcc_Type1.Geom2dGcc_LiLiCu
Geom2dGcc_LiCuCu = Geom2dGcc_Type1.Geom2dGcc_LiCuCu
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/******************
* class Geom2dGcc *
******************/
%rename(geom2dgcc) Geom2dGcc;
class Geom2dGcc {
	public:
		/****************** Enclosed ******************/
		%feature("compactdefaultargs") Enclosed;
		%feature("autodoc", "Constructs such a qualified curve that the solution computed by a construction algorithm using the qualified curve is enclosed by the curve. warning obj is an adapted curve, i.e. an object which is an interface between: - the services provided by a 2d curve from the package geom2d, - and those required on the curve by a computation algorithm. the adapted curve is created in the following way: opencascade::handle<geom2d_curve> mycurve = ... ; geom2dadaptor_curve obj ( mycurve ) ; the qualified curve is then constructed with this object: geom2dgcc_qualifiedcurve myqcurve = geom2dgcc::enclosed(obj);.

Parameters
----------
Obj: Geom2dAdaptor_Curve

Returns
-------
Geom2dGcc_QualifiedCurve
") Enclosed;
		static Geom2dGcc_QualifiedCurve Enclosed(const Geom2dAdaptor_Curve & Obj);

		/****************** Enclosing ******************/
		%feature("compactdefaultargs") Enclosing;
		%feature("autodoc", "Constructs such a qualified curve that the solution computed by a construction algorithm using the qualified curve encloses the curve. warning obj is an adapted curve, i.e. an object which is an interface between: - the services provided by a 2d curve from the package geom2d, - and those required on the curve by a computation algorithm. the adapted curve is created in the following way: opencascade::handle<geom2d_curve> mycurve = ... ; geom2dadaptor_curve obj ( mycurve ) ; the qualified curve is then constructed with this object: geom2dgcc_qualifiedcurve myqcurve = geom2dgcc::enclosing(obj);.

Parameters
----------
Obj: Geom2dAdaptor_Curve

Returns
-------
Geom2dGcc_QualifiedCurve
") Enclosing;
		static Geom2dGcc_QualifiedCurve Enclosing(const Geom2dAdaptor_Curve & Obj);

		/****************** Outside ******************/
		%feature("compactdefaultargs") Outside;
		%feature("autodoc", "Constructs such a qualified curve that the solution computed by a construction algorithm using the qualified curve and the curve are external to one another. warning obj is an adapted curve, i.e. an object which is an interface between: - the services provided by a 2d curve from the package geom2d, - and those required on the curve by a computation algorithm. the adapted curve is created in the following way: opencascade::handle<geom2d_curve> mycurve = ... ; geom2dadaptor_curve obj ( mycurve ) ; the qualified curve is then constructed with this object: geom2dgcc_qualifiedcurve myqcurve = geom2dgcc::outside(obj);.

Parameters
----------
Obj: Geom2dAdaptor_Curve

Returns
-------
Geom2dGcc_QualifiedCurve
") Outside;
		static Geom2dGcc_QualifiedCurve Outside(const Geom2dAdaptor_Curve & Obj);

		/****************** Unqualified ******************/
		%feature("compactdefaultargs") Unqualified;
		%feature("autodoc", "Constructs such a qualified curve that the relative position of the solution computed by a construction algorithm using the qualified curve to the circle or line is not qualified, i.e. all solutions apply. warning obj is an adapted curve, i.e. an object which is an interface between: - the services provided by a 2d curve from the package geom2d, - and those required on the curve by a computation algorithm. the adapted curve is created in the following way: opencascade::handle<geom2d_curve> mycurve = ... ; geom2dadaptor_curve obj ( mycurve ) ; the qualified curve is then constructed with this object: geom2dgcc_qualifiedcurve myqcurve = geom2dgcc::unqualified(obj);.

Parameters
----------
Obj: Geom2dAdaptor_Curve

Returns
-------
Geom2dGcc_QualifiedCurve
") Unqualified;
		static Geom2dGcc_QualifiedCurve Unqualified(const Geom2dAdaptor_Curve & Obj);

};


%extend Geom2dGcc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Geom2dGcc_Circ2d2TanOn *
*******************************/
class Geom2dGcc_Circ2d2TanOn {
	public:
		/****************** Geom2dGcc_Circ2d2TanOn ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOn;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to two curves and having the center on a 2d curve. param1 is the initial guess on the first curve qualifiedcurv. param1 is the initial guess on the second curve qualifiedcurv. paramon is the initial guess on the center curve oncurv. tolerance is used for the limit cases.

Parameters
----------
Qualified1: Geom2dGcc_QualifiedCurve
Qualified2: Geom2dGcc_QualifiedCurve
OnCurve: Geom2dAdaptor_Curve
Tolerance: float
Param1: float
Param2: float
ParamOn: float

Returns
-------
None
") Geom2dGcc_Circ2d2TanOn;
		 Geom2dGcc_Circ2d2TanOn(const Geom2dGcc_QualifiedCurve & Qualified1, const Geom2dGcc_QualifiedCurve & Qualified2, const Geom2dAdaptor_Curve & OnCurve, const Standard_Real Tolerance, const Standard_Real Param1, const Standard_Real Param2, const Standard_Real ParamOn);

		/****************** Geom2dGcc_Circ2d2TanOn ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOn;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to one curve and one point and having the center on a 2d curve. param1 is the initial guess on the first curve qualifiedcurv. paramon is the initial guess on the center curve oncurv. tolerance is used for the limit cases.

Parameters
----------
Qualified1: Geom2dGcc_QualifiedCurve
Point: Geom2d_Point
OnCurve: Geom2dAdaptor_Curve
Tolerance: float
Param1: float
ParamOn: float

Returns
-------
None
") Geom2dGcc_Circ2d2TanOn;
		 Geom2dGcc_Circ2d2TanOn(const Geom2dGcc_QualifiedCurve & Qualified1, const opencascade::handle<Geom2d_Point> & Point, const Geom2dAdaptor_Curve & OnCurve, const Standard_Real Tolerance, const Standard_Real Param1, const Standard_Real ParamOn);

		/****************** Geom2dGcc_Circ2d2TanOn ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOn;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to two points and having the center on a 2d curve. tolerance is used for the limit cases.

Parameters
----------
Point1: Geom2d_Point
Point2: Geom2d_Point
OnCurve: Geom2dAdaptor_Curve
Tolerance: float

Returns
-------
None
") Geom2dGcc_Circ2d2TanOn;
		 Geom2dGcc_Circ2d2TanOn(const opencascade::handle<Geom2d_Point> & Point1, const opencascade::handle<Geom2d_Point> & Point2, const Geom2dAdaptor_Curve & OnCurve, const Standard_Real Tolerance);

		/****************** CenterOn3 ******************/
		%feature("compactdefaultargs") CenterOn3;
		%feature("autodoc", "Returns the center pntsol of the solution of index index computed by this algorithm. pararg is the parameter of the point pntsol on the third argument. exceptions standard_outofrange if index is less than zero or greater than the number of solutions computed by this algorithm. stdfail_notdone if the construction fails.

Parameters
----------
Index: int
PntSol: gp_Pnt2d

Returns
-------
ParArg: float
") CenterOn3;
		void CenterOn3(const Standard_Integer Index, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the construction algorithm does not fail (even if it finds no solution). note: isdone protects against a failure arising from a more internal intersection algorithm, which has reached its numeric limits.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsTheSame1 ******************/
		%feature("compactdefaultargs") IsTheSame1;
		%feature("autodoc", "Returns true if the solution of index index and, respectively, the first or second argument of this algorithm are the same (i.e. there are 2 identical circles). if rarg is the radius of the first or second argument, rsol is the radius of the solution and dist is the distance between the two centers, we consider the two circles to be identical if |rarg - rsol| and dist are less than or equal to the tolerance criterion given at the time of construction of this algorithm. exceptions standard_outofrange if index is less than zero or greater than the number of solutions computed by this algorithm. stdfail_notdone if the construction fails.

Parameters
----------
Index: int

Returns
-------
bool
") IsTheSame1;
		Standard_Boolean IsTheSame1(const Standard_Integer Index);

		/****************** IsTheSame2 ******************/
		%feature("compactdefaultargs") IsTheSame2;
		%feature("autodoc", "Returns true if the solution of index index and, respectively, the first or second argument of this algorithm are the same (i.e. there are 2 identical circles). if rarg is the radius of the first or second argument, rsol is the radius of the solution and dist is the distance between the two centers, we consider the two circles to be identical if |rarg - rsol| and dist are less than or equal to the tolerance criterion given at the time of construction of this algorithm. exceptions standard_outofrange if index is less than zero or greater than the number of solutions computed by this algorithm. stdfail_notdone if the construction fails.

Parameters
----------
Index: int

Returns
-------
bool
") IsTheSame2;
		Standard_Boolean IsTheSame2(const Standard_Integer Index);

		/****************** NbSolutions ******************/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "This method returns the number of solutions. notdone is raised if the algorithm failed.

Returns
-------
int
") NbSolutions;
		Standard_Integer NbSolutions();

		/****************** Results ******************/
		%feature("compactdefaultargs") Results;
		%feature("autodoc", "No available documentation.

Parameters
----------
Circ: GccAna_Circ2d2TanOn

Returns
-------
None
") Results;
		void Results(const GccAna_Circ2d2TanOn & Circ);

		/****************** Results ******************/
		%feature("compactdefaultargs") Results;
		%feature("autodoc", "No available documentation.

Parameters
----------
Circ: Geom2dGcc_Circ2d2TanOnGeo

Returns
-------
None
") Results;
		void Results(const Geom2dGcc_Circ2d2TanOnGeo & Circ);

		/****************** Tangency1 ******************/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "Returns informations about the tangency point between the result and the first argument. parsol is the intrinsic parameter of the point pntsol on the solution curv. pararg is the intrinsic parameter of the point pntsol on the argument curv.

Parameters
----------
Index: int
PntSol: gp_Pnt2d

Returns
-------
ParSol: float
ParArg: float
") Tangency1;
		void Tangency1(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****************** Tangency2 ******************/
		%feature("compactdefaultargs") Tangency2;
		%feature("autodoc", "Returns informations about the tangency point between the result and the second argument. parsol is the intrinsic parameter of the point pntsol on the solution curv. pararg is the intrinsic parameter of the point pntsol on the argument curv.

Parameters
----------
Index: int
PntSol: gp_Pnt2d

Returns
-------
ParSol: float
ParArg: float
") Tangency2;
		void Tangency2(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****************** ThisSolution ******************/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "Returns the solution number index and raises outofrange exception if index is greater than the number of solutions. be carefull: the index is only a way to get all the solutions, but is not associated to theses outside the context of the algorithm-object. exceptions standard_outofrange if index is less than or equal to zero or greater than the number of solutions computed by this algorithm. stdfail_notdone if the construction fails.

Parameters
----------
Index: int

Returns
-------
gp_Circ2d
") ThisSolution;
		gp_Circ2d ThisSolution(const Standard_Integer Index);

		/****************** WhichQualifier ******************/
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "It returns the informations about the qualifiers of the tangency arguments concerning the solution number index. it returns the real qualifiers (the qualifiers given to the constructor method in case of enclosed, enclosing and outside and the qualifiers computedin case of unqualified). exceptions standard_outofrange if index is less than zero or greater than the number of solutions computed by this algorithm. stdfail_notdone if the construction fails.

Parameters
----------
Index: int
Qualif1: GccEnt_Position
Qualif2: GccEnt_Position

Returns
-------
None
") WhichQualifier;
		void WhichQualifier(const Standard_Integer Index, GccEnt_Position & Qualif1, GccEnt_Position & Qualif2);

};


%extend Geom2dGcc_Circ2d2TanOn {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class Geom2dGcc_Circ2d2TanOnGeo *
**********************************/
class Geom2dGcc_Circ2d2TanOnGeo {
	public:
		/****************** Geom2dGcc_Circ2d2TanOnGeo ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnGeo;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to two 2d circles and having the center on a curve.

Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: GccEnt_QualifiedCirc
OnCurv: Geom2dAdaptor_Curve
Tolerance: float

Returns
-------
None
") Geom2dGcc_Circ2d2TanOnGeo;
		 Geom2dGcc_Circ2d2TanOnGeo(const GccEnt_QualifiedCirc & Qualified1, const GccEnt_QualifiedCirc & Qualified2, const Geom2dAdaptor_Curve & OnCurv, const Standard_Real Tolerance);

		/****************** Geom2dGcc_Circ2d2TanOnGeo ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnGeo;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to a 2d circle and a 2d line having the center on a curve.

Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: GccEnt_QualifiedLin
OnCurv: Geom2dAdaptor_Curve
Tolerance: float

Returns
-------
None
") Geom2dGcc_Circ2d2TanOnGeo;
		 Geom2dGcc_Circ2d2TanOnGeo(const GccEnt_QualifiedCirc & Qualified1, const GccEnt_QualifiedLin & Qualified2, const Geom2dAdaptor_Curve & OnCurv, const Standard_Real Tolerance);

		/****************** Geom2dGcc_Circ2d2TanOnGeo ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnGeo;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to a 2d circle and a point having the center on a curve.

Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Point2: gp_Pnt2d
OnCurv: Geom2dAdaptor_Curve
Tolerance: float

Returns
-------
None
") Geom2dGcc_Circ2d2TanOnGeo;
		 Geom2dGcc_Circ2d2TanOnGeo(const GccEnt_QualifiedCirc & Qualified1, const gp_Pnt2d & Point2, const Geom2dAdaptor_Curve & OnCurv, const Standard_Real Tolerance);

		/****************** Geom2dGcc_Circ2d2TanOnGeo ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnGeo;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to two 2d lines having the center on a curve.

Parameters
----------
Qualified1: GccEnt_QualifiedLin
Qualified2: GccEnt_QualifiedLin
OnCurv: Geom2dAdaptor_Curve
Tolerance: float

Returns
-------
None
") Geom2dGcc_Circ2d2TanOnGeo;
		 Geom2dGcc_Circ2d2TanOnGeo(const GccEnt_QualifiedLin & Qualified1, const GccEnt_QualifiedLin & Qualified2, const Geom2dAdaptor_Curve & OnCurv, const Standard_Real Tolerance);

		/****************** Geom2dGcc_Circ2d2TanOnGeo ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnGeo;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to a 2d line and a point having the center on a 2d line.

Parameters
----------
Qualified1: GccEnt_QualifiedLin
Qualified2: gp_Pnt2d
OnCurv: Geom2dAdaptor_Curve
Tolerance: float

Returns
-------
None
") Geom2dGcc_Circ2d2TanOnGeo;
		 Geom2dGcc_Circ2d2TanOnGeo(const GccEnt_QualifiedLin & Qualified1, const gp_Pnt2d & Qualified2, const Geom2dAdaptor_Curve & OnCurv, const Standard_Real Tolerance);

		/****************** Geom2dGcc_Circ2d2TanOnGeo ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnGeo;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to two points having the center on a 2d line.

Parameters
----------
Point1: gp_Pnt2d
Point2: gp_Pnt2d
OnCurv: Geom2dAdaptor_Curve
Tolerance: float

Returns
-------
None
") Geom2dGcc_Circ2d2TanOnGeo;
		 Geom2dGcc_Circ2d2TanOnGeo(const gp_Pnt2d & Point1, const gp_Pnt2d & Point2, const Geom2dAdaptor_Curve & OnCurv, const Standard_Real Tolerance);

		/****************** CenterOn3 ******************/
		%feature("compactdefaultargs") CenterOn3;
		%feature("autodoc", "Returns informations about the center (on the curv) of the result. pararg is the intrinsic parameter of the point on the argument curv. pntsol is the center point of the solution curv. it raises notdone if the construction algorithm didn't succeed. it raises outofrange if index is greater than the number of solutions.

Parameters
----------
Index: int
PntSol: gp_Pnt2d

Returns
-------
ParArg: float
") CenterOn3;
		void CenterOn3(const Standard_Integer Index, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "This method returns true if the construction algorithm succeeded.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsTheSame1 ******************/
		%feature("compactdefaultargs") IsTheSame1;
		%feature("autodoc", "Returns true if the solution number index is equal to the first argument and false in the other cases. it raises notdone if the construction algorithm didn't succeed. it raises outofrange if index is greater than the number of solutions.

Parameters
----------
Index: int

Returns
-------
bool
") IsTheSame1;
		Standard_Boolean IsTheSame1(const Standard_Integer Index);

		/****************** IsTheSame2 ******************/
		%feature("compactdefaultargs") IsTheSame2;
		%feature("autodoc", "Returns true if the solution number index is equal to the second argument and false in the other cases. it raises notdone if the construction algorithm didn't succeed. it raises outofrange if index is greater than the number of solutions.

Parameters
----------
Index: int

Returns
-------
bool
") IsTheSame2;
		Standard_Boolean IsTheSame2(const Standard_Integer Index);

		/****************** NbSolutions ******************/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "This method returns the number of solutions. it raises notdone if the construction algorithm didn't succeed.

Returns
-------
int
") NbSolutions;
		Standard_Integer NbSolutions();

		/****************** Tangency1 ******************/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "Returns informations about the tangency point between the result number index and the first argument. parsol is the intrinsic parameter of the point on the solution curv. pararg is the intrinsic parameter of the point on the argument curv. pntsol is the tangency point on the solution curv. pntarg is the tangency point on the argument curv. it raises notdone if the construction algorithm didn't succeed. it raises outofrange if index is greater than the number of solutions.

Parameters
----------
Index: int
PntSol: gp_Pnt2d

Returns
-------
ParSol: float
ParArg: float
") Tangency1;
		void Tangency1(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****************** Tangency2 ******************/
		%feature("compactdefaultargs") Tangency2;
		%feature("autodoc", "Returns informations about the tangency point between the result number index and the second argument. parsol is the intrinsic parameter of the point on the solution curv. pararg is the intrinsic parameter of the point on the argument curv. pntsol is the tangency point on the solution curv. pntarg is the tangency point on the argument curv. it raises notdone if the construction algorithm didn't succeed. it raises outofrange if index is greater than the number of solutions.

Parameters
----------
Index: int
PntSol: gp_Pnt2d

Returns
-------
ParSol: float
ParArg: float
") Tangency2;
		void Tangency2(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****************** ThisSolution ******************/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "Returns the solution number index and raises outofrange exception if index is greater than the number of solutions. be careful: the index is only a way to get all the solutions, but is not associated to those outside the context of the algorithm-object. it raises notdone if the construction algorithm didn't succeed. it raises outofrange if index is greater than the number of solutions.

Parameters
----------
Index: int

Returns
-------
gp_Circ2d
") ThisSolution;
		gp_Circ2d ThisSolution(const Standard_Integer Index);

		/****************** WhichQualifier ******************/
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "It returns the informations about the qualifiers of the tangency arguments concerning the solution number index. it returns the real qualifiers (the qualifiers given to the constructor method in case of enclosed, enclosing and outside and the qualifiers computedin case of unqualified).

Parameters
----------
Index: int
Qualif1: GccEnt_Position
Qualif2: GccEnt_Position

Returns
-------
None
") WhichQualifier;
		void WhichQualifier(const Standard_Integer Index, GccEnt_Position & Qualif1, GccEnt_Position & Qualif2);

};


%extend Geom2dGcc_Circ2d2TanOnGeo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class Geom2dGcc_Circ2d2TanOnIter *
***********************************/
class Geom2dGcc_Circ2d2TanOnIter {
	public:
		/****************** Geom2dGcc_Circ2d2TanOnIter ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnIter;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to a 2d circle and a curve and having the center on a 2d line. param2 is the initial guess on the curve qualifiedcurv. tolerance is used for the limit cases.

Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: Geom2dGcc_QCurve
OnLine: gp_Lin2d
Param1: float
Param2: float
Param3: float
Tolerance: float

Returns
-------
None
") Geom2dGcc_Circ2d2TanOnIter;
		 Geom2dGcc_Circ2d2TanOnIter(const GccEnt_QualifiedCirc & Qualified1, const Geom2dGcc_QCurve & Qualified2, const gp_Lin2d & OnLine, const Standard_Real Param1, const Standard_Real Param2, const Standard_Real Param3, const Standard_Real Tolerance);

		/****************** Geom2dGcc_Circ2d2TanOnIter ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnIter;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to a 2d line and a curve and having the center on a 2d line. param2 is the initial guess on the curve qualifiedcurv. tolerance is used for the limit cases.

Parameters
----------
Qualified1: GccEnt_QualifiedLin
Qualified2: Geom2dGcc_QCurve
OnLine: gp_Lin2d
Param1: float
Param2: float
Param3: float
Tolerance: float

Returns
-------
None
") Geom2dGcc_Circ2d2TanOnIter;
		 Geom2dGcc_Circ2d2TanOnIter(const GccEnt_QualifiedLin & Qualified1, const Geom2dGcc_QCurve & Qualified2, const gp_Lin2d & OnLine, const Standard_Real Param1, const Standard_Real Param2, const Standard_Real Param3, const Standard_Real Tolerance);

		/****************** Geom2dGcc_Circ2d2TanOnIter ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnIter;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to two curves and having the center on a 2d line. param1 is the initial guess on the first qualifiedcurv. param2 is the initial guess on the first qualifiedcurv. tolerance is used for the limit cases.

Parameters
----------
Qualified1: Geom2dGcc_QCurve
Qualified2: Geom2dGcc_QCurve
OnLine: gp_Lin2d
Param1: float
Param2: float
Param3: float
Tolerance: float

Returns
-------
None
") Geom2dGcc_Circ2d2TanOnIter;
		 Geom2dGcc_Circ2d2TanOnIter(const Geom2dGcc_QCurve & Qualified1, const Geom2dGcc_QCurve & Qualified2, const gp_Lin2d & OnLine, const Standard_Real Param1, const Standard_Real Param2, const Standard_Real Param3, const Standard_Real Tolerance);

		/****************** Geom2dGcc_Circ2d2TanOnIter ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnIter;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to a 2d point and a curve and having the center on a 2d line. param2 is the initial guess on the curve qualifiedcurv. tolerance is used for the limit cases.

Parameters
----------
Qualified1: Geom2dGcc_QCurve
Point2: gp_Pnt2d
OnLine: gp_Lin2d
Param1: float
Param2: float
Tolerance: float

Returns
-------
None
") Geom2dGcc_Circ2d2TanOnIter;
		 Geom2dGcc_Circ2d2TanOnIter(const Geom2dGcc_QCurve & Qualified1, const gp_Pnt2d & Point2, const gp_Lin2d & OnLine, const Standard_Real Param1, const Standard_Real Param2, const Standard_Real Tolerance);

		/****************** Geom2dGcc_Circ2d2TanOnIter ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnIter;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to a 2d circle and a curve and having the center on a 2d circle. param2 is the initial guess on the curve qualifiedcurv. tolerance is used for the limit cases.

Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: Geom2dGcc_QCurve
OnCirc: gp_Circ2d
Param1: float
Param2: float
Param3: float
Tolerance: float

Returns
-------
None
") Geom2dGcc_Circ2d2TanOnIter;
		 Geom2dGcc_Circ2d2TanOnIter(const GccEnt_QualifiedCirc & Qualified1, const Geom2dGcc_QCurve & Qualified2, const gp_Circ2d & OnCirc, const Standard_Real Param1, const Standard_Real Param2, const Standard_Real Param3, const Standard_Real Tolerance);

		/****************** Geom2dGcc_Circ2d2TanOnIter ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnIter;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to a 2d line and a curve and having the center on a 2d circle. param2 is the initial guess on the curve qualifiedcurv. tolerance is used for the limit cases.

Parameters
----------
Qualified1: GccEnt_QualifiedLin
Qualified2: Geom2dGcc_QCurve
OnCirc: gp_Circ2d
Param1: float
Param2: float
Param3: float
Tolerance: float

Returns
-------
None
") Geom2dGcc_Circ2d2TanOnIter;
		 Geom2dGcc_Circ2d2TanOnIter(const GccEnt_QualifiedLin & Qualified1, const Geom2dGcc_QCurve & Qualified2, const gp_Circ2d & OnCirc, const Standard_Real Param1, const Standard_Real Param2, const Standard_Real Param3, const Standard_Real Tolerance);

		/****************** Geom2dGcc_Circ2d2TanOnIter ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnIter;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to two curves and having the center on a 2d circle. param1 is the initial guess on the first qualifiedcurv. param2 is the initial guess on the first qualifiedcurv. tolerance is used for the limit cases.

Parameters
----------
Qualified1: Geom2dGcc_QCurve
Qualified2: Geom2dGcc_QCurve
OnCirc: gp_Circ2d
Param1: float
Param2: float
Param3: float
Tolerance: float

Returns
-------
None
") Geom2dGcc_Circ2d2TanOnIter;
		 Geom2dGcc_Circ2d2TanOnIter(const Geom2dGcc_QCurve & Qualified1, const Geom2dGcc_QCurve & Qualified2, const gp_Circ2d & OnCirc, const Standard_Real Param1, const Standard_Real Param2, const Standard_Real Param3, const Standard_Real Tolerance);

		/****************** Geom2dGcc_Circ2d2TanOnIter ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnIter;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to a 2d point and a curve and having the center on a 2d circle. param2 is the initial guess on the curve qualifiedcurv. tolerance is used for the limit cases.

Parameters
----------
Qualified1: Geom2dGcc_QCurve
Point2: gp_Pnt2d
OnCirc: gp_Circ2d
Param1: float
Param2: float
Tolerance: float

Returns
-------
None
") Geom2dGcc_Circ2d2TanOnIter;
		 Geom2dGcc_Circ2d2TanOnIter(const Geom2dGcc_QCurve & Qualified1, const gp_Pnt2d & Point2, const gp_Circ2d & OnCirc, const Standard_Real Param1, const Standard_Real Param2, const Standard_Real Tolerance);

		/****************** Geom2dGcc_Circ2d2TanOnIter ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnIter;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to a 2d circle and a curve and having the center on a 2d curve. param2 is the initial guess on the curve qualifiedcurv. paramon is the initial guess on the center curve oncurv. tolerance is used for the limit cases.

Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: Geom2dGcc_QCurve
OnCurv: Geom2dAdaptor_Curve
Param1: float
Param2: float
ParamOn: float
Tolerance: float

Returns
-------
None
") Geom2dGcc_Circ2d2TanOnIter;
		 Geom2dGcc_Circ2d2TanOnIter(const GccEnt_QualifiedCirc & Qualified1, const Geom2dGcc_QCurve & Qualified2, const Geom2dAdaptor_Curve & OnCurv, const Standard_Real Param1, const Standard_Real Param2, const Standard_Real ParamOn, const Standard_Real Tolerance);

		/****************** Geom2dGcc_Circ2d2TanOnIter ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnIter;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to a 2d line and a curve and having the center on a 2d curve. param2 is the initial guess on the curve qualifiedcurv. paramon is the initial guess on the center curve oncurv. tolerance is used for the limit cases.

Parameters
----------
Qualified1: GccEnt_QualifiedLin
Qualified2: Geom2dGcc_QCurve
OnCurve: Geom2dAdaptor_Curve
Param1: float
Param2: float
ParamOn: float
Tolerance: float

Returns
-------
None
") Geom2dGcc_Circ2d2TanOnIter;
		 Geom2dGcc_Circ2d2TanOnIter(const GccEnt_QualifiedLin & Qualified1, const Geom2dGcc_QCurve & Qualified2, const Geom2dAdaptor_Curve & OnCurve, const Standard_Real Param1, const Standard_Real Param2, const Standard_Real ParamOn, const Standard_Real Tolerance);

		/****************** Geom2dGcc_Circ2d2TanOnIter ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnIter;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to a 2d point and a curve and having the center on a 2d curve. param1 is the initial guess on the curve qualifiedcurv. paramon is the initial guess on the center curve oncurv. tolerance is used for the limit cases.

Parameters
----------
Qualified1: Geom2dGcc_QCurve
Point2: gp_Pnt2d
OnCurve: Geom2dAdaptor_Curve
Param1: float
ParamOn: float
Tolerance: float

Returns
-------
None
") Geom2dGcc_Circ2d2TanOnIter;
		 Geom2dGcc_Circ2d2TanOnIter(const Geom2dGcc_QCurve & Qualified1, const gp_Pnt2d & Point2, const Geom2dAdaptor_Curve & OnCurve, const Standard_Real Param1, const Standard_Real ParamOn, const Standard_Real Tolerance);

		/****************** Geom2dGcc_Circ2d2TanOnIter ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnIter;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to two curves and having the center on a 2d curve. param1 is the initial guess on the first curve qualifiedcurv. param1 is the initial guess on the second curve qualifiedcurv. paramon is the initial guess on the center curve oncurv. tolerance is used for the limit cases.

Parameters
----------
Qualified1: Geom2dGcc_QCurve
Qualified2: Geom2dGcc_QCurve
OnCurve: Geom2dAdaptor_Curve
Param1: float
Param2: float
ParamOn: float
Tolerance: float

Returns
-------
None
") Geom2dGcc_Circ2d2TanOnIter;
		 Geom2dGcc_Circ2d2TanOnIter(const Geom2dGcc_QCurve & Qualified1, const Geom2dGcc_QCurve & Qualified2, const Geom2dAdaptor_Curve & OnCurve, const Standard_Real Param1, const Standard_Real Param2, const Standard_Real ParamOn, const Standard_Real Tolerance);

		/****************** CenterOn3 ******************/
		%feature("compactdefaultargs") CenterOn3;
		%feature("autodoc", "Returns information about the center (on the curv) of the result and the third argument. it raises notdone if the construction algorithm didn't succeed.

Parameters
----------
PntSol: gp_Pnt2d

Returns
-------
ParArg: float
") CenterOn3;
		void CenterOn3(Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "This method returns true if the construction algorithm succeeded.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsTheSame1 ******************/
		%feature("compactdefaultargs") IsTheSame1;
		%feature("autodoc", "It raises notdone if the construction algorithm didn't succeed.

Returns
-------
bool
") IsTheSame1;
		Standard_Boolean IsTheSame1();

		/****************** IsTheSame2 ******************/
		%feature("compactdefaultargs") IsTheSame2;
		%feature("autodoc", "It raises notdone if the construction algorithm didn't succeed.

Returns
-------
bool
") IsTheSame2;
		Standard_Boolean IsTheSame2();

		/****************** Tangency1 ******************/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "Returns information about the tangency point between the result and the first argument. parsol is the intrinsic parameter of the point pntsol on the solution curv. pararg is the intrinsic parameter of the point pntsol on the argument curv. it raises notdone if the construction algorithm didn't succeed.

Parameters
----------
PntSol: gp_Pnt2d

Returns
-------
ParSol: float
ParArg: float
") Tangency1;
		void Tangency1(Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****************** Tangency2 ******************/
		%feature("compactdefaultargs") Tangency2;
		%feature("autodoc", "Returns information about the tangency point between the result and the second argument. parsol is the intrinsic parameter of the point pntsol on the solution curv. pararg is the intrinsic parameter of the point pntsol on the argument curv. it raises notdone if the construction algorithm didn't succeed.

Parameters
----------
PntSol: gp_Pnt2d

Returns
-------
ParSol: float
ParArg: float
") Tangency2;
		void Tangency2(Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****************** ThisSolution ******************/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "Returns the solution. it raises notdone if the construction algorithm didn't succeed.

Returns
-------
gp_Circ2d
") ThisSolution;
		gp_Circ2d ThisSolution();

		/****************** WhichQualifier ******************/
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "No available documentation.

Parameters
----------
Qualif1: GccEnt_Position
Qualif2: GccEnt_Position

Returns
-------
None
") WhichQualifier;
		void WhichQualifier(GccEnt_Position & Qualif1, GccEnt_Position & Qualif2);

};


%extend Geom2dGcc_Circ2d2TanOnIter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class Geom2dGcc_Circ2d2TanRad *
********************************/
class Geom2dGcc_Circ2d2TanRad {
	public:
		/****************** Geom2dGcc_Circ2d2TanRad ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanRad;
		%feature("autodoc", "No available documentation.

Parameters
----------
Qualified1: Geom2dGcc_QualifiedCurve
Qualified2: Geom2dGcc_QualifiedCurve
Radius: float
Tolerance: float

Returns
-------
None
") Geom2dGcc_Circ2d2TanRad;
		 Geom2dGcc_Circ2d2TanRad(const Geom2dGcc_QualifiedCurve & Qualified1, const Geom2dGcc_QualifiedCurve & Qualified2, const Standard_Real Radius, const Standard_Real Tolerance);

		/****************** Geom2dGcc_Circ2d2TanRad ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanRad;
		%feature("autodoc", "No available documentation.

Parameters
----------
Qualified1: Geom2dGcc_QualifiedCurve
Point: Geom2d_Point
Radius: float
Tolerance: float

Returns
-------
None
") Geom2dGcc_Circ2d2TanRad;
		 Geom2dGcc_Circ2d2TanRad(const Geom2dGcc_QualifiedCurve & Qualified1, const opencascade::handle<Geom2d_Point> & Point, const Standard_Real Radius, const Standard_Real Tolerance);

		/****************** Geom2dGcc_Circ2d2TanRad ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanRad;
		%feature("autodoc", "These constructors create one or more 2d circles of radius radius either - tangential to the 2 curves qualified1 and qualified2, or - tangential to the curve qualified1 and passing through the point point, or - passing through two points point1 and point2. tolerance is a tolerance criterion used by the algorithm to find a solution when, mathematically, the problem posed does not have a solution, but where there is numeric uncertainty attached to the arguments. for example, take two circles c1 and c2, such that c2 is inside c1, and almost tangential to c1. there is, in fact, no point of intersection between c1 and c2. you now want to find a circle of radius r (smaller than the radius of c2), which is tangential to c1 and c2, and inside these two circles: a pure mathematical resolution will not find a solution. this is where the tolerance criterion is used: the algorithm considers that c1 and c2 are tangential if the shortest distance between these two circles is less than or equal to tolerance. thus, a solution is found by the algorithm. exceptions gccent_badqualifier if a qualifier is inconsistent with the argument it qualifies (for example, enclosing for a line). standard_negativevalue if radius is negative.

Parameters
----------
Point1: Geom2d_Point
Point2: Geom2d_Point
Radius: float
Tolerance: float

Returns
-------
None
") Geom2dGcc_Circ2d2TanRad;
		 Geom2dGcc_Circ2d2TanRad(const opencascade::handle<Geom2d_Point> & Point1, const opencascade::handle<Geom2d_Point> & Point2, const Standard_Real Radius, const Standard_Real Tolerance);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "This method returns true if the algorithm succeeded. note: isdone protects against a failure arising from a more internal intersection algorithm, which has reached its numeric limits.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsTheSame1 ******************/
		%feature("compactdefaultargs") IsTheSame1;
		%feature("autodoc", "Returns true if the solution of index index and, respectively, the first or second argument of this algorithm are the same (i.e. there are 2 identical circles). if rarg is the radius of the first or second argument, rsol is the radius of the solution and dist is the distance between the two centers, we consider the two circles to be identical if |rarg - rsol| and dist are less than or equal to the tolerance criterion given at the time of construction of this algorithm. outofrange is raised if index is greater than the number of solutions. notdone is raised if the construction algorithm did not succeed.

Parameters
----------
Index: int

Returns
-------
bool
") IsTheSame1;
		Standard_Boolean IsTheSame1(const Standard_Integer Index);

		/****************** IsTheSame2 ******************/
		%feature("compactdefaultargs") IsTheSame2;
		%feature("autodoc", "Returns true if the solution of index index and, respectively, the first or second argument of this algorithm are the same (i.e. there are 2 identical circles). if rarg is the radius of the first or second argument, rsol is the radius of the solution and dist is the distance between the two centers, we consider the two circles to be identical if |rarg - rsol| and dist are less than or equal to the tolerance criterion given at the time of construction of this algorithm. outofrange is raised if index is greater than the number of solutions. notdone is raised if the construction algorithm did not succeed.

Parameters
----------
Index: int

Returns
-------
bool
") IsTheSame2;
		Standard_Boolean IsTheSame2(const Standard_Integer Index);

		/****************** NbSolutions ******************/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "This method returns the number of solutions. notdone is raised if the algorithm failed. exceptions stdfail_notdone if the construction fails.

Returns
-------
int
") NbSolutions;
		Standard_Integer NbSolutions();

		/****************** Results ******************/
		%feature("compactdefaultargs") Results;
		%feature("autodoc", "No available documentation.

Parameters
----------
Circ: GccAna_Circ2d2TanRad

Returns
-------
None
") Results;
		void Results(const GccAna_Circ2d2TanRad & Circ);

		/****************** Results ******************/
		%feature("compactdefaultargs") Results;
		%feature("autodoc", "No available documentation.

Parameters
----------
Circ: Geom2dGcc_Circ2d2TanRadGeo

Returns
-------
None
") Results;
		void Results(const Geom2dGcc_Circ2d2TanRadGeo & Circ);

		/****************** Tangency1 ******************/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "Returns informations about the tangency point between the result number index and the first argument. parsol is the intrinsic parameter of the point pntsol on the solution curv. pararg is the intrinsic parameter of the point pntsol on the argument curv. outofrange is raised if index is greater than the number of solutions. notdone is raised if the construction algorithm did not succeed.

Parameters
----------
Index: int
PntSol: gp_Pnt2d

Returns
-------
ParSol: float
ParArg: float
") Tangency1;
		void Tangency1(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****************** Tangency2 ******************/
		%feature("compactdefaultargs") Tangency2;
		%feature("autodoc", "Returns informations about the tangency point between the result number index and the second argument. parsol is the intrinsic parameter of the point pntsol on the solution curv. pararg is the intrinsic parameter of the point pntsol on the argument curv. outofrange is raised if index is greater than the number of solutions. notdone is raised if the construction algorithm did not succeed.

Parameters
----------
Index: int
PntSol: gp_Pnt2d

Returns
-------
ParSol: float
ParArg: float
") Tangency2;
		void Tangency2(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****************** ThisSolution ******************/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "Returns the solution number index and raises outofrange exception if index is greater than the number of solutions. be carefull: the index is only a way to get all the solutions, but is not associated to theses outside the context of the algorithm-object. warning this indexing simply provides a means of consulting the solutions. the index values are not associated with these solutions outside the context of the algorithm object. exceptions standard_outofrange if index is less than zero or greater than the number of solutions computed by this algorithm. stdfail_notdone if the construction fails.

Parameters
----------
Index: int

Returns
-------
gp_Circ2d
") ThisSolution;
		gp_Circ2d ThisSolution(const Standard_Integer Index);

		/****************** WhichQualifier ******************/
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "Returns the qualifiers qualif1 and qualif2 of the tangency arguments for the solution of index index computed by this algorithm. the returned qualifiers are: - those specified at the start of construction when the solutions are defined as enclosed, enclosing or outside with respect to the arguments, or - those computed during construction (i.e. enclosed, enclosing or outside) when the solutions are defined as unqualified with respect to the arguments, or - gccent_noqualifier if the tangency argument is a point, or - gccent_unqualified in certain limit cases where it is impossible to qualify the solution as enclosed, enclosing or outside. exceptions standard_outofrange if index is less than zero or greater than the number of solutions computed by this algorithm. stdfail_notdone if the construction fails.

Parameters
----------
Index: int
Qualif1: GccEnt_Position
Qualif2: GccEnt_Position

Returns
-------
None
") WhichQualifier;
		void WhichQualifier(const Standard_Integer Index, GccEnt_Position & Qualif1, GccEnt_Position & Qualif2);

};


%extend Geom2dGcc_Circ2d2TanRad {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class Geom2dGcc_Circ2d2TanRadGeo *
***********************************/
class Geom2dGcc_Circ2d2TanRadGeo {
	public:
		/****************** Geom2dGcc_Circ2d2TanRadGeo ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanRadGeo;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to a 2d circle and a curve with a radius of radius. it raises negativevalue if radius is lower than zero.

Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: Geom2dGcc_QCurve
Radius: float
Tolerance: float

Returns
-------
None
") Geom2dGcc_Circ2d2TanRadGeo;
		 Geom2dGcc_Circ2d2TanRadGeo(const GccEnt_QualifiedCirc & Qualified1, const Geom2dGcc_QCurve & Qualified2, const Standard_Real Radius, const Standard_Real Tolerance);

		/****************** Geom2dGcc_Circ2d2TanRadGeo ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanRadGeo;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to a 2d line and a curve with a radius of radius. it raises negativevalue if radius is lower than zero.

Parameters
----------
Qualified1: GccEnt_QualifiedLin
Qualified2: Geom2dGcc_QCurve
Radius: float
Tolerance: float

Returns
-------
None
") Geom2dGcc_Circ2d2TanRadGeo;
		 Geom2dGcc_Circ2d2TanRadGeo(const GccEnt_QualifiedLin & Qualified1, const Geom2dGcc_QCurve & Qualified2, const Standard_Real Radius, const Standard_Real Tolerance);

		/****************** Geom2dGcc_Circ2d2TanRadGeo ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanRadGeo;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to two curves with a radius of radius. it raises negativevalue if radius is lower than zero.

Parameters
----------
Qualified1: Geom2dGcc_QCurve
Qualified2: Geom2dGcc_QCurve
Radius: float
Tolerance: float

Returns
-------
None
") Geom2dGcc_Circ2d2TanRadGeo;
		 Geom2dGcc_Circ2d2TanRadGeo(const Geom2dGcc_QCurve & Qualified1, const Geom2dGcc_QCurve & Qualified2, const Standard_Real Radius, const Standard_Real Tolerance);

		/****************** Geom2dGcc_Circ2d2TanRadGeo ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanRadGeo;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to a curve and a point with a radius of radius. it raises negativevalue if radius is lower than zero.

Parameters
----------
Qualified1: Geom2dGcc_QCurve
Point2: gp_Pnt2d
Radius: float
Tolerance: float

Returns
-------
None
") Geom2dGcc_Circ2d2TanRadGeo;
		 Geom2dGcc_Circ2d2TanRadGeo(const Geom2dGcc_QCurve & Qualified1, const gp_Pnt2d & Point2, const Standard_Real Radius, const Standard_Real Tolerance);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "This method returns true if the algorithm succeeded.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsTheSame1 ******************/
		%feature("compactdefaultargs") IsTheSame1;
		%feature("autodoc", "Returns true if the solution number index is equal to the first argument. it raises outofrange if index is greater than the number of solutions. it raises notdone if the construction algorithm did not succeed.

Parameters
----------
Index: int

Returns
-------
bool
") IsTheSame1;
		Standard_Boolean IsTheSame1(const Standard_Integer Index);

		/****************** IsTheSame2 ******************/
		%feature("compactdefaultargs") IsTheSame2;
		%feature("autodoc", "Returns true if the solution number index is equal to the second argument. it raises outofrange if index is greater than the number of solutions. it raises notdone if the construction algorithm did not succeed.

Parameters
----------
Index: int

Returns
-------
bool
") IsTheSame2;
		Standard_Boolean IsTheSame2(const Standard_Integer Index);

		/****************** NbSolutions ******************/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "This method returns the number of solutions. it raises notdone if the algorithm failed.

Returns
-------
int
") NbSolutions;
		Standard_Integer NbSolutions();

		/****************** Tangency1 ******************/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "Returns information about the tangency point between the result number index and the first argument. parsol is the intrinsic parameter of the point pntsol on the solution. pararg is the intrinsic parameter of the point pntsol on the first argument. it raises outofrange if index is greater than the number of solutions. it raises notdone if the construction algorithm did not succeed.

Parameters
----------
Index: int
PntSol: gp_Pnt2d

Returns
-------
ParSol: float
ParArg: float
") Tangency1;
		void Tangency1(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****************** Tangency2 ******************/
		%feature("compactdefaultargs") Tangency2;
		%feature("autodoc", "Returns information about the tangency point between the result number index and the second argument. parsol is the intrinsic parameter of the point pntsol on the solution. pararg is the intrinsic parameter of the point pntarg on the second argument. it raises outofrange if index is greater than the number of solutions. it raises notdone if the construction algorithm did not succeed.

Parameters
----------
Index: int
PntSol: gp_Pnt2d

Returns
-------
ParSol: float
ParArg: float
") Tangency2;
		void Tangency2(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****************** ThisSolution ******************/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "Returns the solution number index. be careful: the index is only a way to get all the solutions, but is not associated to those outside the context of the algorithm-object. it raises outofrange exception if index is greater than the number of solutions. it raises notdone if the construction algorithm did not succeed.

Parameters
----------
Index: int

Returns
-------
gp_Circ2d
") ThisSolution;
		gp_Circ2d ThisSolution(const Standard_Integer Index);

		/****************** WhichQualifier ******************/
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "It returns the information about the qualifiers of the tangency arguments concerning the solution number index. it returns the real qualifiers (the qualifiers given to the constructor method in case of enclosed, enclosing and outside and the qualifiers computedin case of unqualified).

Parameters
----------
Index: int
Qualif1: GccEnt_Position
Qualif2: GccEnt_Position

Returns
-------
None
") WhichQualifier;
		void WhichQualifier(const Standard_Integer Index, GccEnt_Position & Qualif1, GccEnt_Position & Qualif2);

};


%extend Geom2dGcc_Circ2d2TanRadGeo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class Geom2dGcc_Circ2d3Tan *
*****************************/
class Geom2dGcc_Circ2d3Tan {
	public:
		/****************** Geom2dGcc_Circ2d3Tan ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d3Tan;
		%feature("autodoc", "Constructs one or more 2d circles tangential to three curves qualified1, qualified2 and qualified3, where param1, param2 and param3 are used, respectively, as the initial values of the parameters on qualified1, qualified2 and qualified3 of the tangency point between these arguments and the solution sought, if the algorithm chooses an iterative method to find the solution (i.e. if either qualified1, qualified2 or qualified3 is more complex than a line or a circle).

Parameters
----------
Qualified1: Geom2dGcc_QualifiedCurve
Qualified2: Geom2dGcc_QualifiedCurve
Qualified3: Geom2dGcc_QualifiedCurve
Tolerance: float
Param1: float
Param2: float
Param3: float

Returns
-------
None
") Geom2dGcc_Circ2d3Tan;
		 Geom2dGcc_Circ2d3Tan(const Geom2dGcc_QualifiedCurve & Qualified1, const Geom2dGcc_QualifiedCurve & Qualified2, const Geom2dGcc_QualifiedCurve & Qualified3, const Standard_Real Tolerance, const Standard_Real Param1, const Standard_Real Param2, const Standard_Real Param3);

		/****************** Geom2dGcc_Circ2d3Tan ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d3Tan;
		%feature("autodoc", "Constructs one or more 2d circles tangential to two curves qualified1 and qualified2 and passing through the point point, where param1 and param2 are used, respectively, as the initial values of the parameters on qualified1 and qualified2 of the tangency point between this argument and the solution sought, if the algorithm chooses an iterative method to find the solution (i.e. if either qualified1 or qualified2 is more complex than a line or a circle).

Parameters
----------
Qualified1: Geom2dGcc_QualifiedCurve
Qualified2: Geom2dGcc_QualifiedCurve
Point: Geom2d_Point
Tolerance: float
Param1: float
Param2: float

Returns
-------
None
") Geom2dGcc_Circ2d3Tan;
		 Geom2dGcc_Circ2d3Tan(const Geom2dGcc_QualifiedCurve & Qualified1, const Geom2dGcc_QualifiedCurve & Qualified2, const opencascade::handle<Geom2d_Point> & Point, const Standard_Real Tolerance, const Standard_Real Param1, const Standard_Real Param2);

		/****************** Geom2dGcc_Circ2d3Tan ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d3Tan;
		%feature("autodoc", "Constructs one or more 2d circles tangential to the curve qualified1 and passing through two points point1 and point2, where param1 is used as the initial value of the parameter on qualified1 of the tangency point between this argument and the solution sought, if the algorithm chooses an iterative method to find the solution (i.e. if qualified1 is more complex than a line or a circle).

Parameters
----------
Qualified1: Geom2dGcc_QualifiedCurve
Point1: Geom2d_Point
Point2: Geom2d_Point
Tolerance: float
Param1: float

Returns
-------
None
") Geom2dGcc_Circ2d3Tan;
		 Geom2dGcc_Circ2d3Tan(const Geom2dGcc_QualifiedCurve & Qualified1, const opencascade::handle<Geom2d_Point> & Point1, const opencascade::handle<Geom2d_Point> & Point2, const Standard_Real Tolerance, const Standard_Real Param1);

		/****************** Geom2dGcc_Circ2d3Tan ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d3Tan;
		%feature("autodoc", "Constructs one or more 2d circles passing through three points point1, point2 and point3. tolerance is a tolerance criterion used by the algorithm to find a solution when, mathematically, the problem posed does not have a solution, but where there is numeric uncertainty attached to the arguments. for example, take: - two circles c1 and c2, such that c2 is inside c1, and almost tangential to c1; there is in fact no point of intersection between c1 and c2; and - a circle c3 outside c1. you now want to find a circle which is tangential to c1, c2 and c3: a pure mathematical resolution will not find a solution. this is where the tolerance criterion is used: the algorithm considers that c1 and c2 are tangential if the shortest distance between these two circles is less than or equal to tolerance. thus, the algorithm finds a solution. warning an iterative algorithm is used if qualified1, qualified2 or qualified3 is more complex than a line or a circle. in such cases, the algorithm constructs only one solution. exceptions gccent_badqualifier if a qualifier is inconsistent with the argument it qualifies (for example, enclosing for a line).

Parameters
----------
Point1: Geom2d_Point
Point2: Geom2d_Point
Point3: Geom2d_Point
Tolerance: float

Returns
-------
None
") Geom2dGcc_Circ2d3Tan;
		 Geom2dGcc_Circ2d3Tan(const opencascade::handle<Geom2d_Point> & Point1, const opencascade::handle<Geom2d_Point> & Point2, const opencascade::handle<Geom2d_Point> & Point3, const Standard_Real Tolerance);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the construction algorithm does not fail (even if it finds no solution). note: isdone protects against a failure arising from a more internal intersection algorithm, which has reached its numeric limits.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsTheSame1 ******************/
		%feature("compactdefaultargs") IsTheSame1;
		%feature("autodoc", "Returns true if the solution is equal to the first argument.

Parameters
----------
Index: int

Returns
-------
bool
") IsTheSame1;
		Standard_Boolean IsTheSame1(const Standard_Integer Index);

		/****************** IsTheSame2 ******************/
		%feature("compactdefaultargs") IsTheSame2;
		%feature("autodoc", "Returns true if the solution is equal to the second argument.

Parameters
----------
Index: int

Returns
-------
bool
") IsTheSame2;
		Standard_Boolean IsTheSame2(const Standard_Integer Index);

		/****************** IsTheSame3 ******************/
		%feature("compactdefaultargs") IsTheSame3;
		%feature("autodoc", "Returns true if the solution is equal to the third argument. if rarg is the radius of the first, second or third argument, rsol is the radius of the solution and dist is the distance between the two centers, we consider the two circles to be identical if |rarg - rsol| and dist are less than or equal to the tolerance criterion given at the time of construction of this algorithm. exceptions standard_outofrange if index is less than zero or greater than the number of solutions computed by this algorithm. stdfail_notdone if the construction fails.

Parameters
----------
Index: int

Returns
-------
bool
") IsTheSame3;
		Standard_Boolean IsTheSame3(const Standard_Integer Index);

		/****************** NbSolutions ******************/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "This method returns the number of solutions. notdone is raised if the algorithm failed.

Returns
-------
int
") NbSolutions;
		Standard_Integer NbSolutions();

		/****************** Results ******************/
		%feature("compactdefaultargs") Results;
		%feature("autodoc", "No available documentation.

Parameters
----------
Circ: GccAna_Circ2d3Tan
Rank1: int
Rank2: int
Rank3: int

Returns
-------
None
") Results;
		void Results(const GccAna_Circ2d3Tan & Circ, const Standard_Integer Rank1, const Standard_Integer Rank2, const Standard_Integer Rank3);

		/****************** Tangency1 ******************/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "Returns informations about the tangency point between the result and the first argument. parsol is the intrinsic parameter of the point pntsol on the solution curv. pararg is the intrinsic parameter of the point pntsol on the argument curv.

Parameters
----------
Index: int
PntSol: gp_Pnt2d

Returns
-------
ParSol: float
ParArg: float
") Tangency1;
		void Tangency1(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****************** Tangency2 ******************/
		%feature("compactdefaultargs") Tangency2;
		%feature("autodoc", "Returns informations about the tangency point between the result and the second argument. parsol is the intrinsic parameter of the point pntsol on the solution curv. pararg is the intrinsic parameter of the point pntsol on the argument curv.

Parameters
----------
Index: int
PntSol: gp_Pnt2d

Returns
-------
ParSol: float
ParArg: float
") Tangency2;
		void Tangency2(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****************** Tangency3 ******************/
		%feature("compactdefaultargs") Tangency3;
		%feature("autodoc", "Returns informations about the tangency point between the result and the third argument. parsol is the intrinsic parameter of the point pntsol on the solution curv. pararg is the intrinsic parameter of the point pntsol on the argument curv.

Parameters
----------
Index: int
PntSol: gp_Pnt2d

Returns
-------
ParSol: float
ParArg: float
") Tangency3;
		void Tangency3(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****************** ThisSolution ******************/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "Returns the solution number index and raises outofrange exception if index is greater than the number of solutions. be carefull: the index is only a way to get all the solutions, but is not associated to theses outside the context of the algorithm-object.

Parameters
----------
Index: int

Returns
-------
gp_Circ2d
") ThisSolution;
		gp_Circ2d ThisSolution(const Standard_Integer Index);

		/****************** WhichQualifier ******************/
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "It returns the informations about the qualifiers of the tangency arguments concerning the solution number index. it returns the real qualifiers (the qualifiers given to the constructor method in case of enclosed, enclosing and outside and the qualifiers computedin case of unqualified).

Parameters
----------
Index: int
Qualif1: GccEnt_Position
Qualif2: GccEnt_Position
Qualif3: GccEnt_Position

Returns
-------
None
") WhichQualifier;
		void WhichQualifier(const Standard_Integer Index, GccEnt_Position & Qualif1, GccEnt_Position & Qualif2, GccEnt_Position & Qualif3);

};


%extend Geom2dGcc_Circ2d3Tan {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class Geom2dGcc_Circ2d3TanIter *
*********************************/
class Geom2dGcc_Circ2d3TanIter {
	public:
		/****************** Geom2dGcc_Circ2d3TanIter ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d3TanIter;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to 2 circles and a curve.

Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: GccEnt_QualifiedCirc
Qualified3: Geom2dGcc_QCurve
Param1: float
Param2: float
Param3: float
Tolerance: float

Returns
-------
None
") Geom2dGcc_Circ2d3TanIter;
		 Geom2dGcc_Circ2d3TanIter(const GccEnt_QualifiedCirc & Qualified1, const GccEnt_QualifiedCirc & Qualified2, const Geom2dGcc_QCurve & Qualified3, const Standard_Real Param1, const Standard_Real Param2, const Standard_Real Param3, const Standard_Real Tolerance);

		/****************** Geom2dGcc_Circ2d3TanIter ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d3TanIter;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to a circle and 2 curves.

Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: Geom2dGcc_QCurve
Qualified3: Geom2dGcc_QCurve
Param1: float
Param2: float
Param3: float
Tolerance: float

Returns
-------
None
") Geom2dGcc_Circ2d3TanIter;
		 Geom2dGcc_Circ2d3TanIter(const GccEnt_QualifiedCirc & Qualified1, const Geom2dGcc_QCurve & Qualified2, const Geom2dGcc_QCurve & Qualified3, const Standard_Real Param1, const Standard_Real Param2, const Standard_Real Param3, const Standard_Real Tolerance);

		/****************** Geom2dGcc_Circ2d3TanIter ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d3TanIter;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to a circle and a line and a curve.

Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: GccEnt_QualifiedLin
Qualified3: Geom2dGcc_QCurve
Param1: float
Param2: float
Param3: float
Tolerance: float

Returns
-------
None
") Geom2dGcc_Circ2d3TanIter;
		 Geom2dGcc_Circ2d3TanIter(const GccEnt_QualifiedCirc & Qualified1, const GccEnt_QualifiedLin & Qualified2, const Geom2dGcc_QCurve & Qualified3, const Standard_Real Param1, const Standard_Real Param2, const Standard_Real Param3, const Standard_Real Tolerance);

		/****************** Geom2dGcc_Circ2d3TanIter ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d3TanIter;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to a circle and a point and a curve.

Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: Geom2dGcc_QCurve
Point3: gp_Pnt2d
Param1: float
Param2: float
Tolerance: float

Returns
-------
None
") Geom2dGcc_Circ2d3TanIter;
		 Geom2dGcc_Circ2d3TanIter(const GccEnt_QualifiedCirc & Qualified1, const Geom2dGcc_QCurve & Qualified2, const gp_Pnt2d & Point3, const Standard_Real Param1, const Standard_Real Param2, const Standard_Real Tolerance);

		/****************** Geom2dGcc_Circ2d3TanIter ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d3TanIter;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to 2 lines and a curve.

Parameters
----------
Qualified1: GccEnt_QualifiedLin
Qualified2: GccEnt_QualifiedLin
Qualified3: Geom2dGcc_QCurve
Param1: float
Param2: float
Param3: float
Tolerance: float

Returns
-------
None
") Geom2dGcc_Circ2d3TanIter;
		 Geom2dGcc_Circ2d3TanIter(const GccEnt_QualifiedLin & Qualified1, const GccEnt_QualifiedLin & Qualified2, const Geom2dGcc_QCurve & Qualified3, const Standard_Real Param1, const Standard_Real Param2, const Standard_Real Param3, const Standard_Real Tolerance);

		/****************** Geom2dGcc_Circ2d3TanIter ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d3TanIter;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to a line and 2 curves.

Parameters
----------
Qualified1: GccEnt_QualifiedLin
Qualified2: Geom2dGcc_QCurve
Qualified3: Geom2dGcc_QCurve
Param1: float
Param2: float
Param3: float
Tolerance: float

Returns
-------
None
") Geom2dGcc_Circ2d3TanIter;
		 Geom2dGcc_Circ2d3TanIter(const GccEnt_QualifiedLin & Qualified1, const Geom2dGcc_QCurve & Qualified2, const Geom2dGcc_QCurve & Qualified3, const Standard_Real Param1, const Standard_Real Param2, const Standard_Real Param3, const Standard_Real Tolerance);

		/****************** Geom2dGcc_Circ2d3TanIter ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d3TanIter;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to a line and a curve and a point.

Parameters
----------
Qualified1: GccEnt_QualifiedLin
Qualified2: Geom2dGcc_QCurve
Point3: gp_Pnt2d
Param1: float
Param2: float
Tolerance: float

Returns
-------
None
") Geom2dGcc_Circ2d3TanIter;
		 Geom2dGcc_Circ2d3TanIter(const GccEnt_QualifiedLin & Qualified1, const Geom2dGcc_QCurve & Qualified2, const gp_Pnt2d & Point3, const Standard_Real Param1, const Standard_Real Param2, const Standard_Real Tolerance);

		/****************** Geom2dGcc_Circ2d3TanIter ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d3TanIter;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to a curve and 2 points.

Parameters
----------
Qualified1: Geom2dGcc_QCurve
Point1: gp_Pnt2d
Point2: gp_Pnt2d
Param1: float
Tolerance: float

Returns
-------
None
") Geom2dGcc_Circ2d3TanIter;
		 Geom2dGcc_Circ2d3TanIter(const Geom2dGcc_QCurve & Qualified1, const gp_Pnt2d & Point1, const gp_Pnt2d & Point2, const Standard_Real Param1, const Standard_Real Tolerance);

		/****************** Geom2dGcc_Circ2d3TanIter ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d3TanIter;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to 2 curves and a point.

Parameters
----------
Qualified1: Geom2dGcc_QCurve
Qualified2: Geom2dGcc_QCurve
Point2: gp_Pnt2d
Param1: float
Param2: float
Tolerance: float

Returns
-------
None
") Geom2dGcc_Circ2d3TanIter;
		 Geom2dGcc_Circ2d3TanIter(const Geom2dGcc_QCurve & Qualified1, const Geom2dGcc_QCurve & Qualified2, const gp_Pnt2d & Point2, const Standard_Real Param1, const Standard_Real Param2, const Standard_Real Tolerance);

		/****************** Geom2dGcc_Circ2d3TanIter ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d3TanIter;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to 3 curves.

Parameters
----------
Qualified1: Geom2dGcc_QCurve
Qualified2: Geom2dGcc_QCurve
Qualified3: Geom2dGcc_QCurve
Param1: float
Param2: float
Param3: float
Tolerance: float

Returns
-------
None
") Geom2dGcc_Circ2d3TanIter;
		 Geom2dGcc_Circ2d3TanIter(const Geom2dGcc_QCurve & Qualified1, const Geom2dGcc_QCurve & Qualified2, const Geom2dGcc_QCurve & Qualified3, const Standard_Real Param1, const Standard_Real Param2, const Standard_Real Param3, const Standard_Real Tolerance);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "This method returns true if the construction algorithm succeeded.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsTheSame1 ******************/
		%feature("compactdefaultargs") IsTheSame1;
		%feature("autodoc", "It raises notdone if the construction algorithm didn't succeed.

Returns
-------
bool
") IsTheSame1;
		Standard_Boolean IsTheSame1();

		/****************** IsTheSame2 ******************/
		%feature("compactdefaultargs") IsTheSame2;
		%feature("autodoc", "It raises notdone if the construction algorithm didn't succeed.

Returns
-------
bool
") IsTheSame2;
		Standard_Boolean IsTheSame2();

		/****************** IsTheSame3 ******************/
		%feature("compactdefaultargs") IsTheSame3;
		%feature("autodoc", "It raises notdone if the construction algorithm didn't succeed.

Returns
-------
bool
") IsTheSame3;
		Standard_Boolean IsTheSame3();

		/****************** Tangency1 ******************/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "Returns informations about the tangency point between the result and the first argument. parsol is the intrinsic parameter of the point pntsol on the solution curv. pararg is the intrinsic parameter of the point pntsol on the argument curv. it raises notdone if the construction algorithm didn't succeed.

Parameters
----------
PntSol: gp_Pnt2d

Returns
-------
ParSol: float
ParArg: float
") Tangency1;
		void Tangency1(Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****************** Tangency2 ******************/
		%feature("compactdefaultargs") Tangency2;
		%feature("autodoc", "Returns informations about the tangency point between the result and the second argument. parsol is the intrinsic parameter of the point pntsol on the solution curv. pararg is the intrinsic parameter of the point pntsol on the argument curv. it raises notdone if the construction algorithm didn't succeed.

Parameters
----------
PntSol: gp_Pnt2d

Returns
-------
ParSol: float
ParArg: float
") Tangency2;
		void Tangency2(Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****************** Tangency3 ******************/
		%feature("compactdefaultargs") Tangency3;
		%feature("autodoc", "Returns informations about the tangency point between the result and the third argument. parsol is the intrinsic parameter of the point pntsol on the solution curv. pararg is the intrinsic parameter of the point pntsol on the argument curv. it raises notdone if the construction algorithm didn't succeed.

Parameters
----------
PntSol: gp_Pnt2d

Returns
-------
ParSol: float
ParArg: float
") Tangency3;
		void Tangency3(Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****************** ThisSolution ******************/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "Returns the solution. it raises notdone if the construction algorithm didn't succeed.

Returns
-------
gp_Circ2d
") ThisSolution;
		gp_Circ2d ThisSolution();

		/****************** WhichQualifier ******************/
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "No available documentation.

Parameters
----------
Qualif1: GccEnt_Position
Qualif2: GccEnt_Position
Qualif3: GccEnt_Position

Returns
-------
None
") WhichQualifier;
		void WhichQualifier(GccEnt_Position & Qualif1, GccEnt_Position & Qualif2, GccEnt_Position & Qualif3);

};


%extend Geom2dGcc_Circ2d3TanIter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Geom2dGcc_Circ2dTanCen *
*******************************/
class Geom2dGcc_Circ2dTanCen {
	public:
		/****************** Geom2dGcc_Circ2dTanCen ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2dTanCen;
		%feature("autodoc", "Constructs one or more 2d circles tangential to the curve qualified1 and centered on the point pcenter. tolerance is a tolerance criterion used by the algorithm to find a solution when, mathematically, the problem posed does not have a solution, but where there is numeric uncertainty attached to the arguments. tolerance is only used in these algorithms in very specific cases where the center of the solution is very close to the circle to which it is tangential, and where the solution is thus a very small circle. exceptions gccent_badqualifier if a qualifier is inconsistent with the argument it qualifies (for example, enclosing for a line).

Parameters
----------
Qualified1: Geom2dGcc_QualifiedCurve
Pcenter: Geom2d_Point
Tolerance: float

Returns
-------
None
") Geom2dGcc_Circ2dTanCen;
		 Geom2dGcc_Circ2dTanCen(const Geom2dGcc_QualifiedCurve & Qualified1, const opencascade::handle<Geom2d_Point> & Pcenter, const Standard_Real Tolerance);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the construction algorithm does not fail (even if it finds no solution). note: isdone protects against a failure arising from a more internal intersection algorithm, which has reached its numeric limits.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsTheSame1 ******************/
		%feature("compactdefaultargs") IsTheSame1;
		%feature("autodoc", "Returns true if the solution of index index and the first argument of this algorithm are the same (i.e. there are 2 identical circles). if rarg is the radius of the first argument, rsol is the radius of the solution and dist is the distance between the two centers, we consider the two circles to be identical if |rarg - rsol| and dist are less than or equal to the tolerance criterion given at the time of construction of this algorithm. notdone is raised if the construction algorithm didn't succeed. outofrange is raised if index is greater than the number of solutions.

Parameters
----------
Index: int

Returns
-------
bool
") IsTheSame1;
		Standard_Boolean IsTheSame1(const Standard_Integer Index);

		/****************** NbSolutions ******************/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Returns the number of circles, representing solutions computed by this algorithm. exceptions stdfail_notdone if the construction fails.

Returns
-------
int
") NbSolutions;
		Standard_Integer NbSolutions();

		/****************** Tangency1 ******************/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "Returns informations about the tangency point between the result number index and the first argument. parsol is the intrinsic parameter of the point pntsol on the solution curv. pararg is the intrinsic parameter of the point pntsol on the argument curv. exceptions standard_outofrange if index is less than zero or greater than the number of solutions computed by this algorithm. stdfail_notdone if the construction fails.

Parameters
----------
Index: int
PntSol: gp_Pnt2d

Returns
-------
ParSol: float
ParArg: float
") Tangency1;
		void Tangency1(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****************** ThisSolution ******************/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "Returns a circle, representing the solution of index index computed by this algorithm. warning this indexing simply provides a means of consulting the solutions. the index values are not associated with these solutions outside the context of the algorithm object. exceptions standard_outofrange if index is less than zero or greater than the number of solutions computed by this algorithm. stdfail_notdone if the construction fails.

Parameters
----------
Index: int

Returns
-------
gp_Circ2d
") ThisSolution;
		gp_Circ2d ThisSolution(const Standard_Integer Index);

		/****************** WhichQualifier ******************/
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "Returns the qualifier qualif1 of the tangency argument for the solution of index index computed by this algorithm. the returned qualifier is: - that specified at the start of construction when the solutions are defined as enclosed, enclosing or outside with respect to the argument, or - that computed during construction (i.e. enclosed, enclosing or outside) when the solutions are defined as unqualified with respect to the argument. exceptions standard_outofrange if index is less than zero or greater than the number of solutions computed by this algorithm. stdfail_notdone if the construction fails.

Parameters
----------
Index: int
Qualif1: GccEnt_Position

Returns
-------
None
") WhichQualifier;
		void WhichQualifier(const Standard_Integer Index, GccEnt_Position & Qualif1);

};


%extend Geom2dGcc_Circ2dTanCen {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class Geom2dGcc_Circ2dTanCenGeo *
**********************************/
class Geom2dGcc_Circ2dTanCenGeo {
	public:
		/****************** Geom2dGcc_Circ2dTanCenGeo ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2dTanCenGeo;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to a circle and centered on a point.

Parameters
----------
Qualified1: Geom2dGcc_QCurve
Pcenter: gp_Pnt2d
Tolerance: float

Returns
-------
None
") Geom2dGcc_Circ2dTanCenGeo;
		 Geom2dGcc_Circ2dTanCenGeo(const Geom2dGcc_QCurve & Qualified1, const gp_Pnt2d & Pcenter, const Standard_Real Tolerance);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "This method returns true if the construction algorithm succeeded.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbSolutions ******************/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Returns the number of solutions and raises notdone exception if the algorithm didn't succeed. it raises notdone if the construction algorithm didn't succeed.

Returns
-------
int
") NbSolutions;
		Standard_Integer NbSolutions();

		/****************** Tangency1 ******************/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "Returns informations about the tangency point between the result number index and the first argument. parsol is the intrinsic parameter of the point pntsol on the solution curv. pararg is the intrinsic parameter of the point pntarg on the argument curv. it raises notdone if the construction algorithm didn't succeed. it raises outofrange if index is greater than the number of solutions or less than zero.

Parameters
----------
Index: int
PntSol: gp_Pnt2d

Returns
-------
ParSol: float
ParArg: float
") Tangency1;
		void Tangency1(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****************** ThisSolution ******************/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "Returns the solution number index and raises outofrange exception if index is greater than the number of solutions. be carefull: the index is only a way to get all the solutions, but is not associated to theses outside the context of the algorithm-object. it raises notdone if the construction algorithm didn't succeed. it raises outofrange if index is greater than the number of solutions or less than zero.

Parameters
----------
Index: int

Returns
-------
gp_Circ2d
") ThisSolution;
		gp_Circ2d ThisSolution(const Standard_Integer Index);

		/****************** WhichQualifier ******************/
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int
Qualif1: GccEnt_Position

Returns
-------
None
") WhichQualifier;
		void WhichQualifier(const Standard_Integer Index, GccEnt_Position & Qualif1);

};


%extend Geom2dGcc_Circ2dTanCenGeo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class Geom2dGcc_Circ2dTanOnRad *
*********************************/
class Geom2dGcc_Circ2dTanOnRad {
	public:
		/****************** Geom2dGcc_Circ2dTanOnRad ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2dTanOnRad;
		%feature("autodoc", "Constructs one or more 2d circles of radius radius, centered on the 2d curve oncurv and: - tangential to the curve qualified1.

Parameters
----------
Qualified1: Geom2dGcc_QualifiedCurve
OnCurv: Geom2dAdaptor_Curve
Radius: float
Tolerance: float

Returns
-------
None
") Geom2dGcc_Circ2dTanOnRad;
		 Geom2dGcc_Circ2dTanOnRad(const Geom2dGcc_QualifiedCurve & Qualified1, const Geom2dAdaptor_Curve & OnCurv, const Standard_Real Radius, const Standard_Real Tolerance);

		/****************** Geom2dGcc_Circ2dTanOnRad ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2dTanOnRad;
		%feature("autodoc", "Constructs one or more 2d circles of radius radius, centered on the 2d curve oncurv and: passing through the point point1. oncurv is an adapted curve, i.e. an object which is an interface between: - the services provided by a 2d curve from the package geom2d, - and those required on the curve by the construction algorithm. similarly, the qualified curve qualified1 is created from an adapted curve. adapted curves are created in the following way: opencascade::handle<geom2d_curve> mycurveon = ... ; geom2dadaptor_curve oncurv ( mycurveon ) ; the algorithm is then constructed with this object: opencascade::handle<geom2d_curve> mycurve1 = ... ; geom2dadaptor_curve adapted1 ( mycurve1 ) ; geom2dgcc_qualifiedcurve qualified1 = geom2dgcc::outside(adapted1); standard_real radius = ... , tolerance = ... ; geom2dgcc_circ2dtanonrad myalgo ( qualified1 , oncurv , radius , tolerance ) ; if ( myalgo.isdone() ) { standard_integer nbr = myalgo.nbsolutions() ; gp_circ2d circ ; for ( standard_integer i = 1 ; i <= nbr ; i++ ) { circ = myalgo.thissolution (i) ; ... } }.

Parameters
----------
Point1: Geom2d_Point
OnCurv: Geom2dAdaptor_Curve
Radius: float
Tolerance: float

Returns
-------
None
") Geom2dGcc_Circ2dTanOnRad;
		 Geom2dGcc_Circ2dTanOnRad(const opencascade::handle<Geom2d_Point> & Point1, const Geom2dAdaptor_Curve & OnCurv, const Standard_Real Radius, const Standard_Real Tolerance);

		/****************** CenterOn3 ******************/
		%feature("compactdefaultargs") CenterOn3;
		%feature("autodoc", "Returns the center pntsol on the second argument (i.e. line or circle) of the solution of index index computed by this algorithm. pararg is the intrinsic parameter of the point on the argument curv. pntsol is the center point of the solution curv. pntarg is the projection of pntsol on the argument curv. exceptions: standard_outofrange if index is less than zero or greater than the number of solutions computed by this algorithm. stdfail_notdone if the construction fails.

Parameters
----------
Index: int
PntSol: gp_Pnt2d

Returns
-------
ParArg: float
") CenterOn3;
		void CenterOn3(const Standard_Integer Index, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the construction algorithm does not fail (even if it finds no solution). note: isdone protects against a failure arising from a more internal intersection algorithm which has reached its numeric limits.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsTheSame1 ******************/
		%feature("compactdefaultargs") IsTheSame1;
		%feature("autodoc", "Returns true if the solution of index index and the first argument of this algorithm are the same (i.e. there are 2 identical circles). if rarg is the radius of the first argument, rsol is the radius of the solution and dist is the distance between the two centers, we consider the two circles to be identical if |rarg - rsol| and dist are less than or equal to the tolerance criterion given at the time of construction of this algorithm. outofrange is raised if index is greater than the number of solutions. notdone is raised if the construction algorithm did not succeed.

Parameters
----------
Index: int

Returns
-------
bool
") IsTheSame1;
		Standard_Boolean IsTheSame1(const Standard_Integer Index);

		/****************** NbSolutions ******************/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Returns the number of circles, representing solutions computed by this algorithm. exceptions: stdfail_notdone if the construction fails.

Returns
-------
int
") NbSolutions;
		Standard_Integer NbSolutions();

		/****************** Results ******************/
		%feature("compactdefaultargs") Results;
		%feature("autodoc", "No available documentation.

Parameters
----------
Circ: GccAna_Circ2dTanOnRad

Returns
-------
None
") Results;
		void Results(const GccAna_Circ2dTanOnRad & Circ);

		/****************** Results ******************/
		%feature("compactdefaultargs") Results;
		%feature("autodoc", "No available documentation.

Parameters
----------
Circ: Geom2dGcc_Circ2dTanOnRadGeo

Returns
-------
None
") Results;
		void Results(const Geom2dGcc_Circ2dTanOnRadGeo & Circ);

		/****************** Tangency1 ******************/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "Returns informations about the tangency point between the result number index and the first argument. parsol is the intrinsic parameter of the point on the solution curv. pararg is the intrinsic parameter of the point on the argument curv. pntsol is the tangency point on the solution curv. pntarg is the tangency point on the argument curv. exceptions standard_outofrange if index is less than zero or greater than the number of solutions computed by this algorithm. stdfail_notdone if the construction fails.

Parameters
----------
Index: int
PntSol: gp_Pnt2d

Returns
-------
ParSol: float
ParArg: float
") Tangency1;
		void Tangency1(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****************** ThisSolution ******************/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "Returns the solution number index and raises outofrange exception if index is greater than the number of solutions. be carefull: the index is only a way to get all the solutions, but is not associated to theses outside the context of the algorithm-object. exceptions standard_outofrange if index is less than zero or greater than the number of solutions computed by this algorithm. stdfail_notdone if the construction fails.

Parameters
----------
Index: int

Returns
-------
gp_Circ2d
") ThisSolution;
		gp_Circ2d ThisSolution(const Standard_Integer Index);

		/****************** WhichQualifier ******************/
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "Returns the qualifier qualif1 of the tangency argument for the solution of index index computed by this algorithm. the returned qualifier is: - that specified at the start of construction when the solutions are defined as enclosed, enclosing or outside with respect to the arguments, or - that computed during construction (i.e. enclosed, enclosing or outside) when the solutions are defined as unqualified with respect to the arguments, or - gccent_noqualifier if the tangency argument is a point. exceptions standard_outofrange if index is less than zero or greater than the number of solutions computed by this algorithm. stdfail_notdone if the construction fails.

Parameters
----------
Index: int
Qualif1: GccEnt_Position

Returns
-------
None
") WhichQualifier;
		void WhichQualifier(const Standard_Integer Index, GccEnt_Position & Qualif1);

};


%extend Geom2dGcc_Circ2dTanOnRad {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class Geom2dGcc_Circ2dTanOnRadGeo *
************************************/
class Geom2dGcc_Circ2dTanOnRadGeo {
	public:
		/****************** Geom2dGcc_Circ2dTanOnRadGeo ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2dTanOnRadGeo;
		%feature("autodoc", "This methods implements the algorithms used to create 2d circles tangent to a curve and centered on a 2d line with a given radius. tolerance is used to find solution in every limit cases. raises negativevalue in case of negativeradius.

Parameters
----------
Qualified1: Geom2dGcc_QCurve
OnLine: gp_Lin2d
Radius: float
Tolerance: float

Returns
-------
None
") Geom2dGcc_Circ2dTanOnRadGeo;
		 Geom2dGcc_Circ2dTanOnRadGeo(const Geom2dGcc_QCurve & Qualified1, const gp_Lin2d & OnLine, const Standard_Real Radius, const Standard_Real Tolerance);

		/****************** Geom2dGcc_Circ2dTanOnRadGeo ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2dTanOnRadGeo;
		%feature("autodoc", "This methods implements the algorithms used to create 2d circles tangent to a curve and centered on a 2d circle with a given radius. tolerance is used to find solution in every limit cases. raises negativevalue in case of negativeradius.

Parameters
----------
Qualified1: Geom2dGcc_QCurve
OnCirc: gp_Circ2d
Radius: float
Tolerance: float

Returns
-------
None
") Geom2dGcc_Circ2dTanOnRadGeo;
		 Geom2dGcc_Circ2dTanOnRadGeo(const Geom2dGcc_QCurve & Qualified1, const gp_Circ2d & OnCirc, const Standard_Real Radius, const Standard_Real Tolerance);

		/****************** Geom2dGcc_Circ2dTanOnRadGeo ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2dTanOnRadGeo;
		%feature("autodoc", "This methods implements the algorithms used to create 2d circles tangent to a circle and centered on a 2d curve with a given radius. tolerance is used to find solution in every limit cases. raises negativevalue in case of negativeradius.

Parameters
----------
Qualified1: GccEnt_QualifiedCirc
OnCurv: Geom2dAdaptor_Curve
Radius: float
Tolerance: float

Returns
-------
None
") Geom2dGcc_Circ2dTanOnRadGeo;
		 Geom2dGcc_Circ2dTanOnRadGeo(const GccEnt_QualifiedCirc & Qualified1, const Geom2dAdaptor_Curve & OnCurv, const Standard_Real Radius, const Standard_Real Tolerance);

		/****************** Geom2dGcc_Circ2dTanOnRadGeo ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2dTanOnRadGeo;
		%feature("autodoc", "This methods implements the algorithms used to create 2d circles tangent to a 2d line and centered on a 2d curve with a given radius. tolerance is used to find solution in every limit cases. raises negativevalue in case of negativeradius.

Parameters
----------
Qualified1: GccEnt_QualifiedLin
OnCurv: Geom2dAdaptor_Curve
Radius: float
Tolerance: float

Returns
-------
None
") Geom2dGcc_Circ2dTanOnRadGeo;
		 Geom2dGcc_Circ2dTanOnRadGeo(const GccEnt_QualifiedLin & Qualified1, const Geom2dAdaptor_Curve & OnCurv, const Standard_Real Radius, const Standard_Real Tolerance);

		/****************** Geom2dGcc_Circ2dTanOnRadGeo ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2dTanOnRadGeo;
		%feature("autodoc", "This methods implements the algorithms used to create 2d circles tangent to a 2d curve and centered on a 2d curve with a given radius. tolerance is used to find solution in every limit cases. raises negativevalue in case of negativeradius.

Parameters
----------
Qualified1: Geom2dGcc_QCurve
OnCurv: Geom2dAdaptor_Curve
Radius: float
Tolerance: float

Returns
-------
None
") Geom2dGcc_Circ2dTanOnRadGeo;
		 Geom2dGcc_Circ2dTanOnRadGeo(const Geom2dGcc_QCurve & Qualified1, const Geom2dAdaptor_Curve & OnCurv, const Standard_Real Radius, const Standard_Real Tolerance);

		/****************** Geom2dGcc_Circ2dTanOnRadGeo ******************/
		%feature("compactdefaultargs") Geom2dGcc_Circ2dTanOnRadGeo;
		%feature("autodoc", "This methods implements the algorithms used to create 2d circles passing through a 2d point and centered on a 2d curve with a given radius. tolerance is used to find solution in every limit cases. raises negativevalue in case of negativeradius.

Parameters
----------
Point1: gp_Pnt2d
OnCurv: Geom2dAdaptor_Curve
Radius: float
Tolerance: float

Returns
-------
None
") Geom2dGcc_Circ2dTanOnRadGeo;
		 Geom2dGcc_Circ2dTanOnRadGeo(const gp_Pnt2d & Point1, const Geom2dAdaptor_Curve & OnCurv, const Standard_Real Radius, const Standard_Real Tolerance);

		/****************** CenterOn3 ******************/
		%feature("compactdefaultargs") CenterOn3;
		%feature("autodoc", "Returns informations about the center (on the curv) of the result. pararg is the intrinsic parameter of the point on the argument curv. pntsol is the center point of the solution curv. it raises notdone if the construction algorithm didn't succeed. it raises outofrange if index is greater than the number of solutions.

Parameters
----------
Index: int
PntSol: gp_Pnt2d

Returns
-------
ParArg: float
") CenterOn3;
		void CenterOn3(const Standard_Integer Index, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "This method returns true if the construction algorithm succeeded.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsTheSame1 ******************/
		%feature("compactdefaultargs") IsTheSame1;
		%feature("autodoc", "Returns true if the solution number index is equal to the first argument and false in the other cases. it raises notdone if the construction algorithm didn't succeed. it raises outofrange if index is greater than the number of solutions.

Parameters
----------
Index: int

Returns
-------
bool
") IsTheSame1;
		Standard_Boolean IsTheSame1(const Standard_Integer Index);

		/****************** NbSolutions ******************/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "This method returns the number of solutions. it raises notdone if the construction algorithm didn't succeed.

Returns
-------
int
") NbSolutions;
		Standard_Integer NbSolutions();

		/****************** Tangency1 ******************/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "Returns informations about the tangency point between the result number index and the first argument. parsol is the intrinsic parameter of the point on the solution curv. pararg is the intrinsic parameter of the point on the argument curv. pntsol is the tangency point on the solution curv. pntarg is the tangency point on the argument curv. it raises notdone if the construction algorithm didn't succeed. it raises outofrange if index is greater than the number of solutions.

Parameters
----------
Index: int
PntSol: gp_Pnt2d

Returns
-------
ParSol: float
ParArg: float
") Tangency1;
		void Tangency1(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****************** ThisSolution ******************/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "Returns the solution number index and raises outofrange exception if index is greater than the number of solutions. be careful: the index is only a way to get all the solutions, but is not associated to theses outside the context of the algorithm-object. it raises notdone if the construction algorithm didn't succeed. it raises outofrange if index is greater than the number of solutions.

Parameters
----------
Index: int

Returns
-------
gp_Circ2d
") ThisSolution;
		gp_Circ2d ThisSolution(const Standard_Integer Index);

		/****************** WhichQualifier ******************/
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int
Qualif1: GccEnt_Position

Returns
-------
None
") WhichQualifier;
		void WhichQualifier(const Standard_Integer Index, GccEnt_Position & Qualif1);

};


%extend Geom2dGcc_Circ2dTanOnRadGeo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Geom2dGcc_CurveTool *
****************************/
class Geom2dGcc_CurveTool {
	public:
		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom2dAdaptor_Curve
U: float
P: gp_Pnt2d
T: gp_Vec2d

Returns
-------
None
") D1;
		static void D1(const Geom2dAdaptor_Curve & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & T);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom2dAdaptor_Curve
U: float
P: gp_Pnt2d
T: gp_Vec2d
N: gp_Vec2d

Returns
-------
None
") D2;
		static void D2(const Geom2dAdaptor_Curve & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & T, gp_Vec2d & N);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom2dAdaptor_Curve
U: float
P: gp_Pnt2d
T: gp_Vec2d
N: gp_Vec2d
dN: gp_Vec2d

Returns
-------
None
") D3;
		static void D3(const Geom2dAdaptor_Curve & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & T, gp_Vec2d & N, gp_Vec2d & dN);

		/****************** EpsX ******************/
		%feature("compactdefaultargs") EpsX;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom2dAdaptor_Curve
Tol: float

Returns
-------
float
") EpsX;
		static Standard_Real EpsX(const Geom2dAdaptor_Curve & C, const Standard_Real Tol);

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom2dAdaptor_Curve

Returns
-------
float
") FirstParameter;
		static Standard_Real FirstParameter(const Geom2dAdaptor_Curve & C);

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom2dAdaptor_Curve

Returns
-------
float
") LastParameter;
		static Standard_Real LastParameter(const Geom2dAdaptor_Curve & C);

		/****************** NbSamples ******************/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom2dAdaptor_Curve

Returns
-------
int
") NbSamples;
		static Standard_Integer NbSamples(const Geom2dAdaptor_Curve & C);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom2dAdaptor_Curve
X: float

Returns
-------
gp_Pnt2d
") Value;
		static gp_Pnt2d Value(const Geom2dAdaptor_Curve & C, const Standard_Real X);

};


%extend Geom2dGcc_CurveTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class Geom2dGcc_FunctionTanCirCu *
***********************************/
class Geom2dGcc_FunctionTanCirCu : public math_FunctionWithDerivative {
	public:
		/****************** Geom2dGcc_FunctionTanCirCu ******************/
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanCirCu;
		%feature("autodoc", "No available documentation.

Parameters
----------
Circ: gp_Circ2d
Curv: Geom2dAdaptor_Curve

Returns
-------
None
") Geom2dGcc_FunctionTanCirCu;
		 Geom2dGcc_FunctionTanCirCu(const gp_Circ2d & Circ, const Geom2dAdaptor_Curve & Curv);

		/****************** Derivative ******************/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Computes the derivative of the function f for the variable x. it returns true if the computation is successfully done, false otherwise.

Parameters
----------
X: float

Returns
-------
Deriv: float
") Derivative;
		Standard_Boolean Derivative(const Standard_Real X, Standard_Real &OutValue);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the value of the function f for the variable x. it returns true if the computation is successfully done, false otherwise.

Parameters
----------
X: float

Returns
-------
F: float
") Value;
		Standard_Boolean Value(const Standard_Real X, Standard_Real &OutValue);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Computes the value and the derivative of the function f for the variable x. it returns true if the computation is successfully done, false otherwise.

Parameters
----------
X: float

Returns
-------
F: float
Deriv: float
") Values;
		Standard_Boolean Values(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend Geom2dGcc_FunctionTanCirCu {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class Geom2dGcc_FunctionTanCuCu *
**********************************/
class Geom2dGcc_FunctionTanCuCu : public math_FunctionSetWithDerivatives {
	public:
		/****************** Geom2dGcc_FunctionTanCuCu ******************/
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanCuCu;
		%feature("autodoc", "No available documentation.

Parameters
----------
Curv1: Geom2dAdaptor_Curve
Curv2: Geom2dAdaptor_Curve

Returns
-------
None
") Geom2dGcc_FunctionTanCuCu;
		 Geom2dGcc_FunctionTanCuCu(const Geom2dAdaptor_Curve & Curv1, const Geom2dAdaptor_Curve & Curv2);

		/****************** Geom2dGcc_FunctionTanCuCu ******************/
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanCuCu;
		%feature("autodoc", "No available documentation.

Parameters
----------
Circ1: gp_Circ2d
Curv2: Geom2dAdaptor_Curve

Returns
-------
None
") Geom2dGcc_FunctionTanCuCu;
		 Geom2dGcc_FunctionTanCuCu(const gp_Circ2d & Circ1, const Geom2dAdaptor_Curve & Curv2);

		/****************** Derivatives ******************/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "Computes the derivative of the function f for the variable x. it returns true if the computation is successfully done, false otherwise.

Parameters
----------
X: math_Vector
Deriv: math_Matrix

Returns
-------
bool
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & Deriv);

		/****************** InitDerivative ******************/
		%feature("compactdefaultargs") InitDerivative;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: math_Vector
Point1: gp_Pnt2d
Point2: gp_Pnt2d
Tan1: gp_Vec2d
Tan2: gp_Vec2d
D21: gp_Vec2d
D22: gp_Vec2d

Returns
-------
None
") InitDerivative;
		void InitDerivative(const math_Vector & X, gp_Pnt2d & Point1, gp_Pnt2d & Point2, gp_Vec2d & Tan1, gp_Vec2d & Tan2, gp_Vec2d & D21, gp_Vec2d & D22);

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns the number of variables of the function.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the value of the function f for the variable x. it returns true if the computation is successfully done, false otherwise.

Parameters
----------
X: math_Vector
F: math_Vector

Returns
-------
bool
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Computes the value and the derivative of the function f for the variable x. it returns true if the computation is successfully done, false otherwise.

Parameters
----------
X: math_Vector
F: math_Vector
Deriv: math_Matrix

Returns
-------
bool
") Values;
		Standard_Boolean Values(const math_Vector & X, math_Vector & F, math_Matrix & Deriv);

};


%extend Geom2dGcc_FunctionTanCuCu {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class Geom2dGcc_FunctionTanCuCuCu *
************************************/
/**************************************
* class Geom2dGcc_FunctionTanCuCuOnCu *
**************************************/
class Geom2dGcc_FunctionTanCuCuOnCu : public math_FunctionSetWithDerivatives {
	public:
		/****************** Geom2dGcc_FunctionTanCuCuOnCu ******************/
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanCuCuOnCu;
		%feature("autodoc", "No available documentation.

Parameters
----------
C1: Geom2dAdaptor_Curve
C2: Geom2dAdaptor_Curve
OnCi: gp_Circ2d
Rad: float

Returns
-------
None
") Geom2dGcc_FunctionTanCuCuOnCu;
		 Geom2dGcc_FunctionTanCuCuOnCu(const Geom2dAdaptor_Curve & C1, const Geom2dAdaptor_Curve & C2, const gp_Circ2d & OnCi, const Standard_Real Rad);

		/****************** Geom2dGcc_FunctionTanCuCuOnCu ******************/
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanCuCuOnCu;
		%feature("autodoc", "No available documentation.

Parameters
----------
C1: gp_Circ2d
C2: Geom2dAdaptor_Curve
OnCi: gp_Circ2d
Rad: float

Returns
-------
None
") Geom2dGcc_FunctionTanCuCuOnCu;
		 Geom2dGcc_FunctionTanCuCuOnCu(const gp_Circ2d & C1, const Geom2dAdaptor_Curve & C2, const gp_Circ2d & OnCi, const Standard_Real Rad);

		/****************** Geom2dGcc_FunctionTanCuCuOnCu ******************/
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanCuCuOnCu;
		%feature("autodoc", "No available documentation.

Parameters
----------
L1: gp_Lin2d
C2: Geom2dAdaptor_Curve
OnCi: gp_Circ2d
Rad: float

Returns
-------
None
") Geom2dGcc_FunctionTanCuCuOnCu;
		 Geom2dGcc_FunctionTanCuCuOnCu(const gp_Lin2d & L1, const Geom2dAdaptor_Curve & C2, const gp_Circ2d & OnCi, const Standard_Real Rad);

		/****************** Geom2dGcc_FunctionTanCuCuOnCu ******************/
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanCuCuOnCu;
		%feature("autodoc", "No available documentation.

Parameters
----------
C1: Geom2dAdaptor_Curve
P2: gp_Pnt2d
OnCi: gp_Circ2d
Rad: float

Returns
-------
None
") Geom2dGcc_FunctionTanCuCuOnCu;
		 Geom2dGcc_FunctionTanCuCuOnCu(const Geom2dAdaptor_Curve & C1, const gp_Pnt2d & P2, const gp_Circ2d & OnCi, const Standard_Real Rad);

		/****************** Geom2dGcc_FunctionTanCuCuOnCu ******************/
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanCuCuOnCu;
		%feature("autodoc", "No available documentation.

Parameters
----------
C1: Geom2dAdaptor_Curve
C2: Geom2dAdaptor_Curve
OnLi: gp_Lin2d
Rad: float

Returns
-------
None
") Geom2dGcc_FunctionTanCuCuOnCu;
		 Geom2dGcc_FunctionTanCuCuOnCu(const Geom2dAdaptor_Curve & C1, const Geom2dAdaptor_Curve & C2, const gp_Lin2d & OnLi, const Standard_Real Rad);

		/****************** Geom2dGcc_FunctionTanCuCuOnCu ******************/
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanCuCuOnCu;
		%feature("autodoc", "No available documentation.

Parameters
----------
C1: gp_Circ2d
C2: Geom2dAdaptor_Curve
OnLi: gp_Lin2d
Rad: float

Returns
-------
None
") Geom2dGcc_FunctionTanCuCuOnCu;
		 Geom2dGcc_FunctionTanCuCuOnCu(const gp_Circ2d & C1, const Geom2dAdaptor_Curve & C2, const gp_Lin2d & OnLi, const Standard_Real Rad);

		/****************** Geom2dGcc_FunctionTanCuCuOnCu ******************/
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanCuCuOnCu;
		%feature("autodoc", "No available documentation.

Parameters
----------
L1: gp_Lin2d
C2: Geom2dAdaptor_Curve
OnLi: gp_Lin2d
Rad: float

Returns
-------
None
") Geom2dGcc_FunctionTanCuCuOnCu;
		 Geom2dGcc_FunctionTanCuCuOnCu(const gp_Lin2d & L1, const Geom2dAdaptor_Curve & C2, const gp_Lin2d & OnLi, const Standard_Real Rad);

		/****************** Geom2dGcc_FunctionTanCuCuOnCu ******************/
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanCuCuOnCu;
		%feature("autodoc", "No available documentation.

Parameters
----------
C1: Geom2dAdaptor_Curve
P2: gp_Pnt2d
OnLi: gp_Lin2d
Rad: float

Returns
-------
None
") Geom2dGcc_FunctionTanCuCuOnCu;
		 Geom2dGcc_FunctionTanCuCuOnCu(const Geom2dAdaptor_Curve & C1, const gp_Pnt2d & P2, const gp_Lin2d & OnLi, const Standard_Real Rad);

		/****************** Geom2dGcc_FunctionTanCuCuOnCu ******************/
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanCuCuOnCu;
		%feature("autodoc", "No available documentation.

Parameters
----------
C1: Geom2dAdaptor_Curve
C2: Geom2dAdaptor_Curve
OnCu: Geom2dAdaptor_Curve
Rad: float

Returns
-------
None
") Geom2dGcc_FunctionTanCuCuOnCu;
		 Geom2dGcc_FunctionTanCuCuOnCu(const Geom2dAdaptor_Curve & C1, const Geom2dAdaptor_Curve & C2, const Geom2dAdaptor_Curve & OnCu, const Standard_Real Rad);

		/****************** Geom2dGcc_FunctionTanCuCuOnCu ******************/
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanCuCuOnCu;
		%feature("autodoc", "No available documentation.

Parameters
----------
C1: gp_Circ2d
C2: Geom2dAdaptor_Curve
OnCu: Geom2dAdaptor_Curve
Rad: float

Returns
-------
None
") Geom2dGcc_FunctionTanCuCuOnCu;
		 Geom2dGcc_FunctionTanCuCuOnCu(const gp_Circ2d & C1, const Geom2dAdaptor_Curve & C2, const Geom2dAdaptor_Curve & OnCu, const Standard_Real Rad);

		/****************** Geom2dGcc_FunctionTanCuCuOnCu ******************/
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanCuCuOnCu;
		%feature("autodoc", "No available documentation.

Parameters
----------
L1: gp_Lin2d
C2: Geom2dAdaptor_Curve
OnCu: Geom2dAdaptor_Curve
Rad: float

Returns
-------
None
") Geom2dGcc_FunctionTanCuCuOnCu;
		 Geom2dGcc_FunctionTanCuCuOnCu(const gp_Lin2d & L1, const Geom2dAdaptor_Curve & C2, const Geom2dAdaptor_Curve & OnCu, const Standard_Real Rad);

		/****************** Geom2dGcc_FunctionTanCuCuOnCu ******************/
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanCuCuOnCu;
		%feature("autodoc", "No available documentation.

Parameters
----------
C1: Geom2dAdaptor_Curve
P1: gp_Pnt2d
OnCu: Geom2dAdaptor_Curve
Rad: float

Returns
-------
None
") Geom2dGcc_FunctionTanCuCuOnCu;
		 Geom2dGcc_FunctionTanCuCuOnCu(const Geom2dAdaptor_Curve & C1, const gp_Pnt2d & P1, const Geom2dAdaptor_Curve & OnCu, const Standard_Real Rad);

		/****************** Derivatives ******************/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "Returns the values of the derivatives for the variable <x>.

Parameters
----------
X: math_Vector
D: math_Matrix

Returns
-------
bool
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** InitDerivative ******************/
		%feature("compactdefaultargs") InitDerivative;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: math_Vector
Point1: gp_Pnt2d
Point2: gp_Pnt2d
Point3: gp_Pnt2d
Tan1: gp_Vec2d
Tan2: gp_Vec2d
Tan3: gp_Vec2d
D21: gp_Vec2d
D22: gp_Vec2d
D23: gp_Vec2d

Returns
-------
None
") InitDerivative;
		void InitDerivative(const math_Vector & X, gp_Pnt2d & Point1, gp_Pnt2d & Point2, gp_Pnt2d & Point3, gp_Vec2d & Tan1, gp_Vec2d & Tan2, gp_Vec2d & Tan3, gp_Vec2d & D21, gp_Vec2d & D22, gp_Vec2d & D23);

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns the number of variables of the function.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the values of the functions for the variable <x>.

Parameters
----------
X: math_Vector
F: math_Vector

Returns
-------
bool
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Returns the values of the functions and the derivatives for the variable <x>.

Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Returns
-------
bool
") Values;
		Standard_Boolean Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

};


%extend Geom2dGcc_FunctionTanCuCuOnCu {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class Geom2dGcc_FunctionTanCuPnt *
***********************************/
class Geom2dGcc_FunctionTanCuPnt : public math_FunctionWithDerivative {
	public:
		/****************** Geom2dGcc_FunctionTanCuPnt ******************/
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanCuPnt;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom2dAdaptor_Curve
Point: gp_Pnt2d

Returns
-------
None
") Geom2dGcc_FunctionTanCuPnt;
		 Geom2dGcc_FunctionTanCuPnt(const Geom2dAdaptor_Curve & C, const gp_Pnt2d & Point);

		/****************** Derivative ******************/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Computes the derivative of the function f for the variable x. it returns true if the computation is successfully done, false otherwise.

Parameters
----------
X: float

Returns
-------
Deriv: float
") Derivative;
		Standard_Boolean Derivative(const Standard_Real X, Standard_Real &OutValue);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the value of the function f for the variable x. it returns true if the computation is successfully done, false otherwise.

Parameters
----------
X: float

Returns
-------
F: float
") Value;
		Standard_Boolean Value(const Standard_Real X, Standard_Real &OutValue);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Computes the value and the derivative of the function f for the variable x. it returns true if the computation is successfully done, false otherwise.

Parameters
----------
X: float

Returns
-------
F: float
Deriv: float
") Values;
		Standard_Boolean Values(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend Geom2dGcc_FunctionTanCuPnt {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class Geom2dGcc_FunctionTanObl *
*********************************/
class Geom2dGcc_FunctionTanObl : public math_FunctionWithDerivative {
	public:
		/****************** Geom2dGcc_FunctionTanObl ******************/
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanObl;
		%feature("autodoc", "No available documentation.

Parameters
----------
Curve: Geom2dAdaptor_Curve
Dir: gp_Dir2d

Returns
-------
None
") Geom2dGcc_FunctionTanObl;
		 Geom2dGcc_FunctionTanObl(const Geom2dAdaptor_Curve & Curve, const gp_Dir2d & Dir);

		/****************** Derivative ******************/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Computes the derivative of the function f for the variable x. it returns true if the computation is successfully done, false otherwise.

Parameters
----------
X: float

Returns
-------
Deriv: float
") Derivative;
		Standard_Boolean Derivative(const Standard_Real X, Standard_Real &OutValue);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the value of the function f for the variable x. it returns true if the computation is successfully done, false otherwise.

Parameters
----------
X: float

Returns
-------
F: float
") Value;
		Standard_Boolean Value(const Standard_Real X, Standard_Real &OutValue);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Computes the value and the derivative of the function f for the variable x. it returns true if the computation is successfully done, false otherwise.

Parameters
----------
X: float

Returns
-------
F: float
Deriv: float
") Values;
		Standard_Boolean Values(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend Geom2dGcc_FunctionTanObl {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Geom2dGcc_Lin2d2Tan *
****************************/
class Geom2dGcc_Lin2d2Tan {
	public:
		/****************** Geom2dGcc_Lin2d2Tan ******************/
		%feature("compactdefaultargs") Geom2dGcc_Lin2d2Tan;
		%feature("autodoc", "This class implements the algorithms used to create 2d line tangent to two curves. tolang is used to determine the tolerance for the tangency points.

Parameters
----------
Qualified1: Geom2dGcc_QualifiedCurve
Qualified2: Geom2dGcc_QualifiedCurve
Tolang: float

Returns
-------
None
") Geom2dGcc_Lin2d2Tan;
		 Geom2dGcc_Lin2d2Tan(const Geom2dGcc_QualifiedCurve & Qualified1, const Geom2dGcc_QualifiedCurve & Qualified2, const Standard_Real Tolang);

		/****************** Geom2dGcc_Lin2d2Tan ******************/
		%feature("compactdefaultargs") Geom2dGcc_Lin2d2Tan;
		%feature("autodoc", "This class implements the algorithms used to create 2d lines passing thrue a point and tangent to a curve. tolang is used to determine the tolerance for the tangency points.

Parameters
----------
Qualified1: Geom2dGcc_QualifiedCurve
ThePoint: gp_Pnt2d
Tolang: float

Returns
-------
None
") Geom2dGcc_Lin2d2Tan;
		 Geom2dGcc_Lin2d2Tan(const Geom2dGcc_QualifiedCurve & Qualified1, const gp_Pnt2d & ThePoint, const Standard_Real Tolang);

		/****************** Geom2dGcc_Lin2d2Tan ******************/
		%feature("compactdefaultargs") Geom2dGcc_Lin2d2Tan;
		%feature("autodoc", "This class implements the algorithms used to create 2d line tangent to two curves. tolang is used to determine the tolerance for the tangency points. param1 is used for the initial guess on the first curve. param2 is used for the initial guess on the second curve.

Parameters
----------
Qualified1: Geom2dGcc_QualifiedCurve
Qualified2: Geom2dGcc_QualifiedCurve
Tolang: float
Param1: float
Param2: float

Returns
-------
None
") Geom2dGcc_Lin2d2Tan;
		 Geom2dGcc_Lin2d2Tan(const Geom2dGcc_QualifiedCurve & Qualified1, const Geom2dGcc_QualifiedCurve & Qualified2, const Standard_Real Tolang, const Standard_Real Param1, const Standard_Real Param2);

		/****************** Geom2dGcc_Lin2d2Tan ******************/
		%feature("compactdefaultargs") Geom2dGcc_Lin2d2Tan;
		%feature("autodoc", "This class implements the algorithms used to create 2d lines passing thrue a point and tangent to a curve. tolang is used to determine the tolerance for the tangency points. param2 is used for the initial guess on the curve.

Parameters
----------
Qualified1: Geom2dGcc_QualifiedCurve
ThePoint: gp_Pnt2d
Tolang: float
Param1: float

Returns
-------
None
") Geom2dGcc_Lin2d2Tan;
		 Geom2dGcc_Lin2d2Tan(const Geom2dGcc_QualifiedCurve & Qualified1, const gp_Pnt2d & ThePoint, const Standard_Real Tolang, const Standard_Real Param1);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the construction algorithm does not fail (even if it finds no solution). note: isdone protects against a failure arising from a more internal intersection algorithm, which has reached its numeric limits.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbSolutions ******************/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Returns the number of lines, representing solutions computed by this algorithm. exceptions stdfail_notdone if the construction fails.r.

Returns
-------
int
") NbSolutions;
		Standard_Integer NbSolutions();

		/****************** Tangency1 ******************/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "Returns informations about the tangency point between the result and the first argument. parsol is the intrinsic parameter of the point pntsol on the solution curv. pararg is the intrinsic parameter of the point pntsol on the argument curv. exceptions standard_outofrange if index is less than zero or greater than the number of solutions computed by this algorithm. stdfail_notdone if the construction fails.

Parameters
----------
Index: int
PntSol: gp_Pnt2d

Returns
-------
ParSol: float
ParArg: float
") Tangency1;
		void Tangency1(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****************** Tangency2 ******************/
		%feature("compactdefaultargs") Tangency2;
		%feature("autodoc", "Returns informations about the tangency point between the result and the first argument. parsol is the intrinsic parameter of the point pntsol on the solution curv. pararg is the intrinsic parameter of the point pntsol on the argument curv. exceptions standard_outofrange if index is less than zero or greater than the number of solutions computed by this algorithm. stdfail_notdone if the construction fails.

Parameters
----------
Index: int
PntSol: gp_Pnt2d

Returns
-------
ParSol: float
ParArg: float
") Tangency2;
		void Tangency2(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****************** ThisSolution ******************/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "Returns a line, representing the solution of index index computed by this algorithm. warning this indexing simply provides a means of consulting the solutions. the index values are not associated with these solutions outside the context of the algorithm object. exceptions standard_outofrange if index is less than zero or greater than the number of solutions computed by this algorithm. stdfail_notdone if the construction fails.

Parameters
----------
Index: int

Returns
-------
gp_Lin2d
") ThisSolution;
		gp_Lin2d ThisSolution(const Standard_Integer Index);

		/****************** WhichQualifier ******************/
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "Returns the qualifiers qualif1 and qualif2 of the tangency arguments for the solution of index index computed by this algorithm. the returned qualifiers are: - those specified at the start of construction when the solutions are defined as enclosing or outside with respect to the arguments, or - those computed during construction (i.e. enclosing or outside) when the solutions are defined as unqualified with respect to the arguments, or - gccent_noqualifier if the tangency argument is a point. exceptions standard_outofrange if index is less than zero or greater than the number of solutions computed by this algorithm. stdfail_notdone if the construction fails.

Parameters
----------
Index: int
Qualif1: GccEnt_Position
Qualif2: GccEnt_Position

Returns
-------
None
") WhichQualifier;
		void WhichQualifier(const Standard_Integer Index, GccEnt_Position & Qualif1, GccEnt_Position & Qualif2);

};


%extend Geom2dGcc_Lin2d2Tan {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class Geom2dGcc_Lin2d2TanIter *
********************************/
class Geom2dGcc_Lin2d2TanIter {
	public:
		/****************** Geom2dGcc_Lin2d2TanIter ******************/
		%feature("compactdefaultargs") Geom2dGcc_Lin2d2TanIter;
		%feature("autodoc", "This class implements the algorithms used to create 2d lines passing thrue a point and tangent to a curve. tolang is used to determine the tolerance for the tangency points. param2 is used for the initial guess on the curve.

Parameters
----------
Qualified1: Geom2dGcc_QCurve
ThePoint: gp_Pnt2d
Param1: float
Tolang: float

Returns
-------
None
") Geom2dGcc_Lin2d2TanIter;
		 Geom2dGcc_Lin2d2TanIter(const Geom2dGcc_QCurve & Qualified1, const gp_Pnt2d & ThePoint, const Standard_Real Param1, const Standard_Real Tolang);

		/****************** Geom2dGcc_Lin2d2TanIter ******************/
		%feature("compactdefaultargs") Geom2dGcc_Lin2d2TanIter;
		%feature("autodoc", "This class implements the algorithms used to create 2d line tangent to a circle and to a cuve. tolang is used to determine the tolerance for the tangency points. param2 is used for the initial guess on the curve. exception badqualifier is raised in the case of enclosedcirc.

Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: Geom2dGcc_QCurve
Param2: float
Tolang: float

Returns
-------
None
") Geom2dGcc_Lin2d2TanIter;
		 Geom2dGcc_Lin2d2TanIter(const GccEnt_QualifiedCirc & Qualified1, const Geom2dGcc_QCurve & Qualified2, const Standard_Real Param2, const Standard_Real Tolang);

		/****************** Geom2dGcc_Lin2d2TanIter ******************/
		%feature("compactdefaultargs") Geom2dGcc_Lin2d2TanIter;
		%feature("autodoc", "This class implements the algorithms used to create 2d line tangent to two curves. tolang is used to determine the tolerance for the tangency points. param1 is used for the initial guess on the first curve. param2 is used for the initial guess on the second curve.

Parameters
----------
Qualified1: Geom2dGcc_QCurve
Qualified2: Geom2dGcc_QCurve
Param1: float
Param2: float
Tolang: float

Returns
-------
None
") Geom2dGcc_Lin2d2TanIter;
		 Geom2dGcc_Lin2d2TanIter(const Geom2dGcc_QCurve & Qualified1, const Geom2dGcc_QCurve & Qualified2, const Standard_Real Param1, const Standard_Real Param2, const Standard_Real Tolang);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "This methode returns true when there is a solution and false in the other cases.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Tangency1 ******************/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "Returns informations about the tangency point between the result and the first argument. parsol is the intrinsic parameter of the point pntsol on the solution curv. pararg is the intrinsic parameter of the point pntsol on the argument curv.

Parameters
----------
PntSol: gp_Pnt2d

Returns
-------
ParSol: float
ParArg: float
") Tangency1;
		void Tangency1(Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****************** Tangency2 ******************/
		%feature("compactdefaultargs") Tangency2;
		%feature("autodoc", "No available documentation.

Parameters
----------
PntSol: gp_Pnt2d

Returns
-------
ParSol: float
ParArg: float
") Tangency2;
		void Tangency2(Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****************** ThisSolution ******************/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "Returns the solution.

Returns
-------
gp_Lin2d
") ThisSolution;
		gp_Lin2d ThisSolution();

		/****************** WhichQualifier ******************/
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "No available documentation.

Parameters
----------
Qualif1: GccEnt_Position
Qualif2: GccEnt_Position

Returns
-------
None
") WhichQualifier;
		void WhichQualifier(GccEnt_Position & Qualif1, GccEnt_Position & Qualif2);

};


%extend Geom2dGcc_Lin2d2TanIter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Geom2dGcc_Lin2dTanObl *
******************************/
class Geom2dGcc_Lin2dTanObl {
	public:
		/****************** Geom2dGcc_Lin2dTanObl ******************/
		%feature("compactdefaultargs") Geom2dGcc_Lin2dTanObl;
		%feature("autodoc", "This class implements the algorithm used to create 2d line tangent to a curve and doing an angle angle with the line thelin. angle must be in radian. tolang is the angular tolerance.

Parameters
----------
Qualified1: Geom2dGcc_QualifiedCurve
TheLin: gp_Lin2d
TolAng: float
Angle: float

Returns
-------
None
") Geom2dGcc_Lin2dTanObl;
		 Geom2dGcc_Lin2dTanObl(const Geom2dGcc_QualifiedCurve & Qualified1, const gp_Lin2d & TheLin, const Standard_Real TolAng, const Standard_Real Angle);

		/****************** Geom2dGcc_Lin2dTanObl ******************/
		%feature("compactdefaultargs") Geom2dGcc_Lin2dTanObl;
		%feature("autodoc", "This class implements the algorithm used to create 2d line tangent to a curve and doing an angle angle with the line thelin. angle must be in radian. param2 is the initial guess on the curve qualifiedcurv. tolang is the angular tolerance. warning an iterative algorithm is used if qualified1 is more complex than a line or a circle. in such cases, the algorithm constructs only one solution. exceptions gccent_badqualifier if a qualifier is inconsistent with the argument it qualifies (for example, enclosed for a circle).

Parameters
----------
Qualified1: Geom2dGcc_QualifiedCurve
TheLin: gp_Lin2d
TolAng: float
Param1: float
Angle: float

Returns
-------
None
") Geom2dGcc_Lin2dTanObl;
		 Geom2dGcc_Lin2dTanObl(const Geom2dGcc_QualifiedCurve & Qualified1, const gp_Lin2d & TheLin, const Standard_Real TolAng, const Standard_Real Param1, const Standard_Real Angle);

		/****************** Intersection2 ******************/
		%feature("compactdefaultargs") Intersection2;
		%feature("autodoc", "Returns the point of intersection pntsol between the solution of index index and the second argument (the line) of this algorithm. parsol is the parameter of the point pntsol on the solution. pararg is the parameter of the point pntsol on the second argument (the line). exceptions stdfail_notdone if the construction fails. geom2dgcc_isparallel if the solution and the second argument (the line) are parallel. standard_outofrange if index is less than zero or greater than the number of solutions computed by this algorithm.

Parameters
----------
Index: int
PntSol: gp_Pnt2d

Returns
-------
ParSol: float
ParArg: float
") Intersection2;
		void Intersection2(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the construction algorithm does not fail (even if it finds no solution). note: isdone protects against a failure arising from a more internal intersection algorithm, which has reached its numeric limits.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbSolutions ******************/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Returns the number of lines, representing solutions computed by this algorithm. exceptions stdfail_notdone if the construction fails.

Returns
-------
int
") NbSolutions;
		Standard_Integer NbSolutions();

		/****************** Tangency1 ******************/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "Returns informations about the tangency point between the result and the first argument. parsol is the intrinsic parameter of the point pntsol on the solution curv. pararg is the intrinsic parameter of the point pntsol on the argument curv.

Parameters
----------
Index: int
PntSol: gp_Pnt2d

Returns
-------
ParSol: float
ParArg: float
") Tangency1;
		void Tangency1(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****************** ThisSolution ******************/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "Returns a line, representing the solution of index index computed by this algorithm. exceptions standard_outofrange if index is less than zero or greater than the number of solutions computed by this algorithm. stdfail_notdone if the construction fails.

Parameters
----------
Index: int

Returns
-------
gp_Lin2d
") ThisSolution;
		gp_Lin2d ThisSolution(const Standard_Integer Index);

		/****************** WhichQualifier ******************/
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "Returns the qualifier qualif1 of the tangency argument for the solution of index index computed by this algorithm. the returned qualifier is: - that specified at the start of construction when the solutions are defined as enclosing or outside with respect to the argument, or - that computed during construction (i.e. enclosing or outside) when the solutions are defined as unqualified with respect to the argument, or - gccent_noqualifier if the tangency argument is a point. exceptions standard_outofrange if index is less than zero or greater than the number of solutions computed by this algorithm. stdfail_notdone if the construction fails.

Parameters
----------
Index: int
Qualif1: GccEnt_Position

Returns
-------
None
") WhichQualifier;
		void WhichQualifier(const Standard_Integer Index, GccEnt_Position & Qualif1);

};


%extend Geom2dGcc_Lin2dTanObl {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def IsParallel2(self):
		pass
	}
};

/**********************************
* class Geom2dGcc_Lin2dTanOblIter *
**********************************/
class Geom2dGcc_Lin2dTanOblIter {
	public:
		/****************** Geom2dGcc_Lin2dTanOblIter ******************/
		%feature("compactdefaultargs") Geom2dGcc_Lin2dTanOblIter;
		%feature("autodoc", "This class implements the algorithm used to create 2d line tangent to a curve and doing an angle angle with the line thelin. angle must be in radian. param2 is the initial guess on the curve qualifiedcurv. tolang is the angular tolerance.

Parameters
----------
Qualified1: Geom2dGcc_QCurve
TheLin: gp_Lin2d
Param1: float
TolAng: float
Angle: float,optional
	default value is 0

Returns
-------
None
") Geom2dGcc_Lin2dTanOblIter;
		 Geom2dGcc_Lin2dTanOblIter(const Geom2dGcc_QCurve & Qualified1, const gp_Lin2d & TheLin, const Standard_Real Param1, const Standard_Real TolAng, const Standard_Real Angle = 0);

		/****************** Intersection2 ******************/
		%feature("compactdefaultargs") Intersection2;
		%feature("autodoc", "No available documentation.

Parameters
----------
PntSol: gp_Pnt2d

Returns
-------
ParSol: float
ParArg: float
") Intersection2;
		void Intersection2(Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "This method returns true when there is a solution and false in the other cases.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsParallel2 ******************/
		%feature("compactdefaultargs") IsParallel2;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsParallel2;
		Standard_Boolean IsParallel2();

		/****************** Tangency1 ******************/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "No available documentation.

Parameters
----------
PntSol: gp_Pnt2d

Returns
-------
ParSol: float
ParArg: float
") Tangency1;
		void Tangency1(Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****************** ThisSolution ******************/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Lin2d
") ThisSolution;
		gp_Lin2d ThisSolution();

		/****************** WhichQualifier ******************/
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "No available documentation.

Parameters
----------
Qualif1: GccEnt_Position

Returns
-------
None
") WhichQualifier;
		void WhichQualifier(GccEnt_Position & Qualif1);

};


%extend Geom2dGcc_Lin2dTanOblIter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Geom2dGcc_QCurve *
*************************/
class Geom2dGcc_QCurve {
	public:
		/****************** Geom2dGcc_QCurve ******************/
		%feature("compactdefaultargs") Geom2dGcc_QCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
Curve: Geom2dAdaptor_Curve
Qualifier: GccEnt_Position

Returns
-------
None
") Geom2dGcc_QCurve;
		 Geom2dGcc_QCurve(const Geom2dAdaptor_Curve & Curve, const GccEnt_Position Qualifier);

		/****************** IsEnclosed ******************/
		%feature("compactdefaultargs") IsEnclosed;
		%feature("autodoc", "Returns true if the solution is enclosed in the curv and false in the other cases.

Returns
-------
bool
") IsEnclosed;
		Standard_Boolean IsEnclosed();

		/****************** IsEnclosing ******************/
		%feature("compactdefaultargs") IsEnclosing;
		%feature("autodoc", "Returns true if the solution is enclosing the curv and false in the other cases.

Returns
-------
bool
") IsEnclosing;
		Standard_Boolean IsEnclosing();

		/****************** IsOutside ******************/
		%feature("compactdefaultargs") IsOutside;
		%feature("autodoc", "Returns true if the solution is outside the curv and false in the other cases.

Returns
-------
bool
") IsOutside;
		Standard_Boolean IsOutside();

		/****************** IsUnqualified ******************/
		%feature("compactdefaultargs") IsUnqualified;
		%feature("autodoc", "Returns true if the solution is unqualified and false in the other cases.

Returns
-------
bool
") IsUnqualified;
		Standard_Boolean IsUnqualified();

		/****************** Qualified ******************/
		%feature("compactdefaultargs") Qualified;
		%feature("autodoc", "No available documentation.

Returns
-------
Geom2dAdaptor_Curve
") Qualified;
		Geom2dAdaptor_Curve Qualified();

		/****************** Qualifier ******************/
		%feature("compactdefaultargs") Qualifier;
		%feature("autodoc", "No available documentation.

Returns
-------
GccEnt_Position
") Qualifier;
		GccEnt_Position Qualifier();

};


%extend Geom2dGcc_QCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class Geom2dGcc_QualifiedCurve *
*********************************/
class Geom2dGcc_QualifiedCurve {
	public:
		/****************** Geom2dGcc_QualifiedCurve ******************/
		%feature("compactdefaultargs") Geom2dGcc_QualifiedCurve;
		%feature("autodoc", "Constructs a qualified curve by assigning the qualifier qualifier to the curve curve. qualifier may be: - gccent_enclosing if the solution of a construction algorithm using the qualified curve encloses the curve, or - gccent_enclosed if the solution is enclosed by the curve, or - gccent_outside if both the solution and the curve are external to one another, or - gccent_unqualified if all solutions apply. note: the interior of a curve is defined as the left-hand side of the curve in relation to its orientation. warning curve is an adapted curve, i.e. an object which is an interface between: - the services provided by a 2d curve from the package geom2d, - and those required on the curve by a computation algorithm. the adapted curve is created in the following way: opencascade::handle<geom2d_curve> mycurve = ... ; geom2dadaptor_curve curve ( mycurve ) ; the qualified curve is then constructed with this object: gccent_position myqualif = gccent_outside ; geom2dgcc_qualifiedcurve myqcurve ( curve, myqualif ); is private;.

Parameters
----------
Curve: Geom2dAdaptor_Curve
Qualifier: GccEnt_Position

Returns
-------
None
") Geom2dGcc_QualifiedCurve;
		 Geom2dGcc_QualifiedCurve(const Geom2dAdaptor_Curve & Curve, const GccEnt_Position Qualifier);

		/****************** IsEnclosed ******************/
		%feature("compactdefaultargs") IsEnclosed;
		%feature("autodoc", "It returns true if the solution is enclosed in the curv and false in the other cases.

Returns
-------
bool
") IsEnclosed;
		Standard_Boolean IsEnclosed();

		/****************** IsEnclosing ******************/
		%feature("compactdefaultargs") IsEnclosing;
		%feature("autodoc", "It returns true if the solution is enclosing the curv and false in the other cases.

Returns
-------
bool
") IsEnclosing;
		Standard_Boolean IsEnclosing();

		/****************** IsOutside ******************/
		%feature("compactdefaultargs") IsOutside;
		%feature("autodoc", "It returns true if the solution is outside the curv and false in the other cases.

Returns
-------
bool
") IsOutside;
		Standard_Boolean IsOutside();

		/****************** IsUnqualified ******************/
		%feature("compactdefaultargs") IsUnqualified;
		%feature("autodoc", "Returns true if the solution is unqualified and false in the other cases.

Returns
-------
bool
") IsUnqualified;
		Standard_Boolean IsUnqualified();

		/****************** Qualified ******************/
		%feature("compactdefaultargs") Qualified;
		%feature("autodoc", "Returns a 2d curve to which the qualifier is assigned. warning the returned curve is an adapted curve, i.e. an object which is an interface between: - the services provided by a 2d curve from the package geom2d, - and those required on the curve by a computation algorithm. the geom2d curve on which the adapted curve is based can be obtained in the following way: myqualifiedcurve = ... ; geom2dadaptor_curve myadaptedcurve = myqualifiedcurve.qualified(); opencascade::handle<geom2d_curve> = myadaptedcurve.curve();.

Returns
-------
Geom2dAdaptor_Curve
") Qualified;
		Geom2dAdaptor_Curve Qualified();

		/****************** Qualifier ******************/
		%feature("compactdefaultargs") Qualifier;
		%feature("autodoc", "Returns - the qualifier of this qualified curve if it is enclosing, enclosed or outside, or - gccent_noqualifier if it is unqualified.

Returns
-------
GccEnt_Position
") Qualifier;
		GccEnt_Position Qualifier();

};


%extend Geom2dGcc_QualifiedCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class Geom2dGcc_FuncTCuCuCuOfMyC2d3Tan:
	pass

@classnotwrapped
class Geom2dGcc_FunctionTanCuCuCu:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
