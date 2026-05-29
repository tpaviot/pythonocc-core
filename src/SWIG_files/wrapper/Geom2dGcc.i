/*
Copyright 2008-2026 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_geom2dgcc.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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
#include<Geom2d_module.hxx>
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

/* python proxy classes for enums */
%pythoncode {

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
		/****** Geom2dGcc::Enclosed ******/
		/****** md5 signature: 2789b821f91dea1fffbdc7cd59541153 ******/
		%feature("compactdefaultargs") Enclosed;
		%feature("autodoc", "
Parameters
----------
Obj: Geom2dAdaptor_Curve

Return
-------
Geom2dGcc_QualifiedCurve

Description
-----------
Constructs such a qualified curve that the solution computed by a construction algorithm using the qualified curve is enclosed by the curve. Warning Obj is an adapted curve, i.e. an object which is an interface between: - the services provided by a 2D curve from the package Geom2d, - and those required on the curve by a computation algorithm. The adapted curve is created in the following way: opencascade::handle<Geom2d_Curve> mycurve = ... ; Geom2dAdaptor_Curve Obj ( mycurve ) ; The qualified curve is then constructed with this object: Geom2dGcc_QualifiedCurve myQCurve = Geom2dGcc::Enclosed(Obj);.
") Enclosed;
		static Geom2dGcc_QualifiedCurve Enclosed(const Geom2dAdaptor_Curve & Obj);

		/****** Geom2dGcc::Enclosing ******/
		/****** md5 signature: 4f0affeedeb6dc54e820c87bf4042334 ******/
		%feature("compactdefaultargs") Enclosing;
		%feature("autodoc", "
Parameters
----------
Obj: Geom2dAdaptor_Curve

Return
-------
Geom2dGcc_QualifiedCurve

Description
-----------
Constructs such a qualified curve that the solution computed by a construction algorithm using the qualified curve encloses the curve. Warning Obj is an adapted curve, i.e. an object which is an interface between: - the services provided by a 2D curve from the package Geom2d, - and those required on the curve by a computation algorithm. The adapted curve is created in the following way: opencascade::handle<Geom2d_Curve> mycurve = ... ; Geom2dAdaptor_Curve Obj ( mycurve ) ; The qualified curve is then constructed with this object: Geom2dGcc_QualifiedCurve myQCurve = Geom2dGcc::Enclosing(Obj);.
") Enclosing;
		static Geom2dGcc_QualifiedCurve Enclosing(const Geom2dAdaptor_Curve & Obj);

		/****** Geom2dGcc::Outside ******/
		/****** md5 signature: 70473d4dc01072408ae8c5c390a4d94d ******/
		%feature("compactdefaultargs") Outside;
		%feature("autodoc", "
Parameters
----------
Obj: Geom2dAdaptor_Curve

Return
-------
Geom2dGcc_QualifiedCurve

Description
-----------
Constructs such a qualified curve that the solution computed by a construction algorithm using the qualified curve and the curve are external to one another. Warning Obj is an adapted curve, i.e. an object which is an interface between: - the services provided by a 2D curve from the package Geom2d, - and those required on the curve by a computation algorithm. The adapted curve is created in the following way: opencascade::handle<Geom2d_Curve> mycurve = ... ; Geom2dAdaptor_Curve Obj ( mycurve ) ; The qualified curve is then constructed with this object: Geom2dGcc_QualifiedCurve myQCurve = Geom2dGcc::Outside(Obj);.
") Outside;
		static Geom2dGcc_QualifiedCurve Outside(const Geom2dAdaptor_Curve & Obj);

		/****** Geom2dGcc::Unqualified ******/
		/****** md5 signature: c1997a3fd1d847ca2a0844473a0de941 ******/
		%feature("compactdefaultargs") Unqualified;
		%feature("autodoc", "
Parameters
----------
Obj: Geom2dAdaptor_Curve

Return
-------
Geom2dGcc_QualifiedCurve

Description
-----------
Constructs such a qualified curve that the relative position of the solution computed by a construction algorithm using the qualified curve to the circle or line is not qualified, i.e. all solutions apply. Warning Obj is an adapted curve, i.e. an object which is an interface between: - the services provided by a 2D curve from the package Geom2d, - and those required on the curve by a computation algorithm. The adapted curve is created in the following way: opencascade::handle<Geom2d_Curve> mycurve = ... ; Geom2dAdaptor_Curve Obj ( mycurve ) ; The qualified curve is then constructed with this object: Geom2dGcc_QualifiedCurve myQCurve = Geom2dGcc::Unqualified(Obj);.
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
		/****** Geom2dGcc_Circ2d2TanOn::Geom2dGcc_Circ2d2TanOn ******/
		/****** md5 signature: 59094b9e8581a9fde59dcfa754cd6bec ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOn;
		%feature("autodoc", "
Parameters
----------
Qualified1: Geom2dGcc_QualifiedCurve
Qualified2: Geom2dGcc_QualifiedCurve
OnCurve: Geom2dAdaptor_Curve
Tolerance: double
Param1: double
Param2: double
ParamOn: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to two curves and having the center ON a 2d curve. Param1 is the initial guess on the first curve QualifiedCurv. Param1 is the initial guess on the second curve QualifiedCurv. ParamOn is the initial guess on the center curve OnCurv. Tolerance is used for the limit cases.
") Geom2dGcc_Circ2d2TanOn;
		 Geom2dGcc_Circ2d2TanOn(const Geom2dGcc_QualifiedCurve & Qualified1, const Geom2dGcc_QualifiedCurve & Qualified2, const Geom2dAdaptor_Curve & OnCurve, const double Tolerance, const double Param1, const double Param2, const double ParamOn);

		/****** Geom2dGcc_Circ2d2TanOn::Geom2dGcc_Circ2d2TanOn ******/
		/****** md5 signature: f8fb7d9e590b26dae827ba567107d3fe ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOn;
		%feature("autodoc", "
Parameters
----------
Qualified1: Geom2dGcc_QualifiedCurve
Point: Geom2d_Point
OnCurve: Geom2dAdaptor_Curve
Tolerance: double
Param1: double
ParamOn: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to one curve and one point and having the center ON a 2d curve. Param1 is the initial guess on the first curve QualifiedCurv. ParamOn is the initial guess on the center curve OnCurv. Tolerance is used for the limit cases.
") Geom2dGcc_Circ2d2TanOn;
		 Geom2dGcc_Circ2d2TanOn(const Geom2dGcc_QualifiedCurve & Qualified1, const opencascade::handle<Geom2d_Point> & Point, const Geom2dAdaptor_Curve & OnCurve, const double Tolerance, const double Param1, const double ParamOn);

		/****** Geom2dGcc_Circ2d2TanOn::Geom2dGcc_Circ2d2TanOn ******/
		/****** md5 signature: 89930f542caaaf1f915ab0634c87d2cd ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOn;
		%feature("autodoc", "
Parameters
----------
Point1: Geom2d_Point
Point2: Geom2d_Point
OnCurve: Geom2dAdaptor_Curve
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to two points and having the center ON a 2d curve. Tolerance is used for the limit cases.
") Geom2dGcc_Circ2d2TanOn;
		 Geom2dGcc_Circ2d2TanOn(const opencascade::handle<Geom2d_Point> & Point1, const opencascade::handle<Geom2d_Point> & Point2, const Geom2dAdaptor_Curve & OnCurve, const double Tolerance);

		/****** Geom2dGcc_Circ2d2TanOn::CenterOn3 ******/
		/****** md5 signature: 0cf0897b69e4f36e74d8300f02fce1f6 ******/
		%feature("compactdefaultargs") CenterOn3;
		%feature("autodoc", "
Parameters
----------
Index: int
PntSol: gp_Pnt2d

Return
-------
ParArg: double

Description
-----------
Returns the center PntSol of the solution of index Index computed by this algorithm. ParArg is the parameter of the point PntSol on the third argument. Exceptions Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.
") CenterOn3;
		void CenterOn3(const int Index, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** Geom2dGcc_Circ2d2TanOn::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the construction algorithm does not fail (even if it finds no solution). Note: IsDone protects against a failure arising from a more internal intersection algorithm, which has reached its numeric limits.
") IsDone;
		bool IsDone();

		/****** Geom2dGcc_Circ2d2TanOn::IsTheSame1 ******/
		/****** md5 signature: dca7508c3bfc2cd444c9a790b211d29e ******/
		%feature("compactdefaultargs") IsTheSame1;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
bool

Description
-----------
Returns true if the solution of index Index and, respectively, the first or second argument of this algorithm are the same (i.e. there are 2 identical circles). If Rarg is the radius of the first or second argument, Rsol is the radius of the solution and dist is the distance between the two centers, we consider the two circles to be identical if |Rarg - Rsol| and dist are less than or equal to the tolerance criterion given at the time of construction of this algorithm. Exceptions Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.
") IsTheSame1;
		bool IsTheSame1(const int Index);

		/****** Geom2dGcc_Circ2d2TanOn::IsTheSame2 ******/
		/****** md5 signature: 121515308b9bb4116635801988b1d5af ******/
		%feature("compactdefaultargs") IsTheSame2;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
bool

Description
-----------
Returns true if the solution of index Index and, respectively, the first or second argument of this algorithm are the same (i.e. there are 2 identical circles). If Rarg is the radius of the first or second argument, Rsol is the radius of the solution and dist is the distance between the two centers, we consider the two circles to be identical if |Rarg - Rsol| and dist are less than or equal to the tolerance criterion given at the time of construction of this algorithm. Exceptions Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.
") IsTheSame2;
		bool IsTheSame2(const int Index);

		/****** Geom2dGcc_Circ2d2TanOn::NbSolutions ******/
		/****** md5 signature: 55162d50f2670468f6ab0d146e7a9b77 ******/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Return
-------
int

Description
-----------
This method returns the number of solutions. NotDone is raised if the algorithm failed.
") NbSolutions;
		int NbSolutions();

		/****** Geom2dGcc_Circ2d2TanOn::Results ******/
		/****** md5 signature: ecd78e889d3cf226639f40434c419fbb ******/
		%feature("compactdefaultargs") Results;
		%feature("autodoc", "
Parameters
----------
Circ: GccAna_Circ2d2TanOn

Return
-------
None

Description
-----------
No available documentation.
") Results;
		void Results(const GccAna_Circ2d2TanOn & Circ);

		/****** Geom2dGcc_Circ2d2TanOn::Results ******/
		/****** md5 signature: 3ca5e2028bbadd5311772e1359385105 ******/
		%feature("compactdefaultargs") Results;
		%feature("autodoc", "
Parameters
----------
Circ: Geom2dGcc_Circ2d2TanOnGeo

Return
-------
None

Description
-----------
No available documentation.
") Results;
		void Results(const Geom2dGcc_Circ2d2TanOnGeo & Circ);

		/****** Geom2dGcc_Circ2d2TanOn::Tangency1 ******/
		/****** md5 signature: 8e976db6ec5fed2b45f5bcd201f60aaa ******/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "
Parameters
----------
Index: int
PntSol: gp_Pnt2d

Return
-------
ParSol: double
ParArg: double

Description
-----------
Returns information about the tangency point between the result and the first argument. ParSol is the intrinsic parameter of the point PntSol on the solution curv. ParArg is the intrinsic parameter of the point PntSol on the argument curv.
") Tangency1;
		void Tangency1(const int Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** Geom2dGcc_Circ2d2TanOn::Tangency2 ******/
		/****** md5 signature: 3f1f83dbdaea1988497a83645ade6207 ******/
		%feature("compactdefaultargs") Tangency2;
		%feature("autodoc", "
Parameters
----------
Index: int
PntSol: gp_Pnt2d

Return
-------
ParSol: double
ParArg: double

Description
-----------
Returns information about the tangency point between the result and the second argument. ParSol is the intrinsic parameter of the point PntSol on the solution curv. ParArg is the intrinsic parameter of the point PntSol on the argument curv.
") Tangency2;
		void Tangency2(const int Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** Geom2dGcc_Circ2d2TanOn::ThisSolution ******/
		/****** md5 signature: 2e1125d1397b55b627ac75adbb37458f ******/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
gp_Circ2d

Description
-----------
Returns the solution number Index and raises OutOfRange exception if Index is greater than the number of solutions. Be careful: the Index is only a way to get all the solutions, but is not associated to these outside the context of the algorithm-object. Exceptions Standard_OutOfRange if Index is less than or equal to zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.
") ThisSolution;
		gp_Circ2d ThisSolution(const int Index);

		/****** Geom2dGcc_Circ2d2TanOn::WhichQualifier ******/
		/****** md5 signature: af20731e994c9da3e41b1695171b3bae ******/
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
Qualif1: GccEnt_Position
Qualif2: GccEnt_Position

Description
-----------
It returns the information about the qualifiers of the tangency arguments concerning the solution number Index. It returns the real qualifiers (the qualifiers given to the constructor method in case of enclosed, enclosing and outside and the qualifiers computedin case of unqualified). Exceptions Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.
") WhichQualifier;
		void WhichQualifier(const int Index, GccEnt_Position &OutValue, GccEnt_Position &OutValue);

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
		/****** Geom2dGcc_Circ2d2TanOnGeo::Geom2dGcc_Circ2d2TanOnGeo ******/
		/****** md5 signature: ab42c3a698db72cabd2d28045c146f37 ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnGeo;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: GccEnt_QualifiedCirc
OnCurv: Geom2dAdaptor_Curve
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to two 2d circles and having the center ON a curve.
") Geom2dGcc_Circ2d2TanOnGeo;
		 Geom2dGcc_Circ2d2TanOnGeo(const GccEnt_QualifiedCirc & Qualified1, const GccEnt_QualifiedCirc & Qualified2, const Geom2dAdaptor_Curve & OnCurv, const double Tolerance);

		/****** Geom2dGcc_Circ2d2TanOnGeo::Geom2dGcc_Circ2d2TanOnGeo ******/
		/****** md5 signature: f307fc74d10d8e2abdd9654a7bec8b4e ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnGeo;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: GccEnt_QualifiedLin
OnCurv: Geom2dAdaptor_Curve
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to a 2d circle and a 2d line having the center ON a curve.
") Geom2dGcc_Circ2d2TanOnGeo;
		 Geom2dGcc_Circ2d2TanOnGeo(const GccEnt_QualifiedCirc & Qualified1, const GccEnt_QualifiedLin & Qualified2, const Geom2dAdaptor_Curve & OnCurv, const double Tolerance);

		/****** Geom2dGcc_Circ2d2TanOnGeo::Geom2dGcc_Circ2d2TanOnGeo ******/
		/****** md5 signature: 8a9334793eea3312f6fd6c6388717166 ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnGeo;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Point2: gp_Pnt2d
OnCurv: Geom2dAdaptor_Curve
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to a 2d circle and a point having the center ON a curve.
") Geom2dGcc_Circ2d2TanOnGeo;
		 Geom2dGcc_Circ2d2TanOnGeo(const GccEnt_QualifiedCirc & Qualified1, const gp_Pnt2d & Point2, const Geom2dAdaptor_Curve & OnCurv, const double Tolerance);

		/****** Geom2dGcc_Circ2d2TanOnGeo::Geom2dGcc_Circ2d2TanOnGeo ******/
		/****** md5 signature: 29fb74e1ff8b8d4a0140ec792512333d ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnGeo;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedLin
Qualified2: GccEnt_QualifiedLin
OnCurv: Geom2dAdaptor_Curve
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to two 2d lines having the center ON a curve.
") Geom2dGcc_Circ2d2TanOnGeo;
		 Geom2dGcc_Circ2d2TanOnGeo(const GccEnt_QualifiedLin & Qualified1, const GccEnt_QualifiedLin & Qualified2, const Geom2dAdaptor_Curve & OnCurv, const double Tolerance);

		/****** Geom2dGcc_Circ2d2TanOnGeo::Geom2dGcc_Circ2d2TanOnGeo ******/
		/****** md5 signature: 0958523742fc5d5488d250c7b338bfb4 ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnGeo;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedLin
Qualified2: gp_Pnt2d
OnCurv: Geom2dAdaptor_Curve
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to a 2d line and a point having the center ON a 2d line.
") Geom2dGcc_Circ2d2TanOnGeo;
		 Geom2dGcc_Circ2d2TanOnGeo(const GccEnt_QualifiedLin & Qualified1, const gp_Pnt2d & Qualified2, const Geom2dAdaptor_Curve & OnCurv, const double Tolerance);

		/****** Geom2dGcc_Circ2d2TanOnGeo::Geom2dGcc_Circ2d2TanOnGeo ******/
		/****** md5 signature: 374925ce07558268bdc4195ec8cf15ec ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnGeo;
		%feature("autodoc", "
Parameters
----------
Point1: gp_Pnt2d
Point2: gp_Pnt2d
OnCurv: Geom2dAdaptor_Curve
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to two points having the center ON a 2d line.
") Geom2dGcc_Circ2d2TanOnGeo;
		 Geom2dGcc_Circ2d2TanOnGeo(const gp_Pnt2d & Point1, const gp_Pnt2d & Point2, const Geom2dAdaptor_Curve & OnCurv, const double Tolerance);

		/****** Geom2dGcc_Circ2d2TanOnGeo::CenterOn3 ******/
		/****** md5 signature: 0cf0897b69e4f36e74d8300f02fce1f6 ******/
		%feature("compactdefaultargs") CenterOn3;
		%feature("autodoc", "
Parameters
----------
Index: int
PntSol: gp_Pnt2d

Return
-------
ParArg: double

Description
-----------
Returns information about the center (on the curv) of the result. ParArg is the intrinsic parameter of the point on the argument curv. PntSol is the center point of the solution curv. It raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions.
") CenterOn3;
		void CenterOn3(const int Index, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** Geom2dGcc_Circ2d2TanOnGeo::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
This method returns True if the construction algorithm succeeded.
") IsDone;
		bool IsDone();

		/****** Geom2dGcc_Circ2d2TanOnGeo::IsTheSame1 ******/
		/****** md5 signature: dca7508c3bfc2cd444c9a790b211d29e ******/
		%feature("compactdefaultargs") IsTheSame1;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
bool

Description
-----------
Returns True if the solution number Index is equal to the first argument and False in the other cases. It raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions.
") IsTheSame1;
		bool IsTheSame1(const int Index);

		/****** Geom2dGcc_Circ2d2TanOnGeo::IsTheSame2 ******/
		/****** md5 signature: 121515308b9bb4116635801988b1d5af ******/
		%feature("compactdefaultargs") IsTheSame2;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
bool

Description
-----------
Returns True if the solution number Index is equal to the second argument and False in the other cases. It raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions.
") IsTheSame2;
		bool IsTheSame2(const int Index);

		/****** Geom2dGcc_Circ2d2TanOnGeo::NbSolutions ******/
		/****** md5 signature: 55162d50f2670468f6ab0d146e7a9b77 ******/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Return
-------
int

Description
-----------
This method returns the number of solutions. It raises NotDone if the construction algorithm didn't succeed.
") NbSolutions;
		int NbSolutions();

		/****** Geom2dGcc_Circ2d2TanOnGeo::Tangency1 ******/
		/****** md5 signature: 8e976db6ec5fed2b45f5bcd201f60aaa ******/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "
Parameters
----------
Index: int
PntSol: gp_Pnt2d

Return
-------
ParSol: double
ParArg: double

Description
-----------
Returns information about the tangency point between the result number Index and the first argument. ParSol is the intrinsic parameter of the point on the solution curv. ParArg is the intrinsic parameter of the point on the argument curv. PntSol is the tangency point on the solution curv. PntArg is the tangency point on the argument curv. It raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions.
") Tangency1;
		void Tangency1(const int Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** Geom2dGcc_Circ2d2TanOnGeo::Tangency2 ******/
		/****** md5 signature: 3f1f83dbdaea1988497a83645ade6207 ******/
		%feature("compactdefaultargs") Tangency2;
		%feature("autodoc", "
Parameters
----------
Index: int
PntSol: gp_Pnt2d

Return
-------
ParSol: double
ParArg: double

Description
-----------
Returns information about the tangency point between the result number Index and the second argument. ParSol is the intrinsic parameter of the point on the solution curv. ParArg is the intrinsic parameter of the point on the argument curv. PntSol is the tangency point on the solution curv. PntArg is the tangency point on the argument curv. It raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions.
") Tangency2;
		void Tangency2(const int Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** Geom2dGcc_Circ2d2TanOnGeo::ThisSolution ******/
		/****** md5 signature: 2e1125d1397b55b627ac75adbb37458f ******/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
gp_Circ2d

Description
-----------
Returns the solution number Index and raises OutOfRange exception if Index is greater than the number of solutions. Be careful: the Index is only a way to get all the solutions, but is not associated to those outside the context of the algorithm-object. It raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions.
") ThisSolution;
		gp_Circ2d ThisSolution(const int Index);

		/****** Geom2dGcc_Circ2d2TanOnGeo::WhichQualifier ******/
		/****** md5 signature: af20731e994c9da3e41b1695171b3bae ******/
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
Qualif1: GccEnt_Position
Qualif2: GccEnt_Position

Description
-----------
It returns the information about the qualifiers of the tangency arguments concerning the solution number Index. It returns the real qualifiers (the qualifiers given to the constructor method in case of enclosed, enclosing and outside and the qualifiers computedin case of unqualified).
") WhichQualifier;
		void WhichQualifier(const int Index, GccEnt_Position &OutValue, GccEnt_Position &OutValue);

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
		/****** Geom2dGcc_Circ2d2TanOnIter::Geom2dGcc_Circ2d2TanOnIter ******/
		/****** md5 signature: ffc42a5121dd471cd04b4277cc303d07 ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnIter;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: Geom2dGcc_QCurve
OnLine: gp_Lin2d
Param1: double
Param2: double
Param3: double
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to a 2d circle and a curve and having the center ON a 2d line. Param2 is the initial guess on the curve QualifiedCurv. Tolerance is used for the limit cases.
") Geom2dGcc_Circ2d2TanOnIter;
		 Geom2dGcc_Circ2d2TanOnIter(const GccEnt_QualifiedCirc & Qualified1, const Geom2dGcc_QCurve & Qualified2, const gp_Lin2d & OnLine, const double Param1, const double Param2, const double Param3, const double Tolerance);

		/****** Geom2dGcc_Circ2d2TanOnIter::Geom2dGcc_Circ2d2TanOnIter ******/
		/****** md5 signature: 573f182865aa26f69fa195cf91575eed ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnIter;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedLin
Qualified2: Geom2dGcc_QCurve
OnLine: gp_Lin2d
Param1: double
Param2: double
Param3: double
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to a 2d line and a curve and having the center ON a 2d line. Param2 is the initial guess on the curve QualifiedCurv. Tolerance is used for the limit cases.
") Geom2dGcc_Circ2d2TanOnIter;
		 Geom2dGcc_Circ2d2TanOnIter(const GccEnt_QualifiedLin & Qualified1, const Geom2dGcc_QCurve & Qualified2, const gp_Lin2d & OnLine, const double Param1, const double Param2, const double Param3, const double Tolerance);

		/****** Geom2dGcc_Circ2d2TanOnIter::Geom2dGcc_Circ2d2TanOnIter ******/
		/****** md5 signature: c96a454753eda9e655a13211aa70c6a8 ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnIter;
		%feature("autodoc", "
Parameters
----------
Qualified1: Geom2dGcc_QCurve
Qualified2: Geom2dGcc_QCurve
OnLine: gp_Lin2d
Param1: double
Param2: double
Param3: double
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to two curves and having the center ON a 2d line. Param1 is the initial guess on the first QualifiedCurv. Param2 is the initial guess on the first QualifiedCurv. Tolerance is used for the limit cases.
") Geom2dGcc_Circ2d2TanOnIter;
		 Geom2dGcc_Circ2d2TanOnIter(const Geom2dGcc_QCurve & Qualified1, const Geom2dGcc_QCurve & Qualified2, const gp_Lin2d & OnLine, const double Param1, const double Param2, const double Param3, const double Tolerance);

		/****** Geom2dGcc_Circ2d2TanOnIter::Geom2dGcc_Circ2d2TanOnIter ******/
		/****** md5 signature: c7b8666479c5ca2c9d44e01633b06f99 ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnIter;
		%feature("autodoc", "
Parameters
----------
Qualified1: Geom2dGcc_QCurve
Point2: gp_Pnt2d
OnLine: gp_Lin2d
Param1: double
Param2: double
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to a 2d point and a curve and having the center ON a 2d line. Param2 is the initial guess on the curve QualifiedCurv. Tolerance is used for the limit cases.
") Geom2dGcc_Circ2d2TanOnIter;
		 Geom2dGcc_Circ2d2TanOnIter(const Geom2dGcc_QCurve & Qualified1, const gp_Pnt2d & Point2, const gp_Lin2d & OnLine, const double Param1, const double Param2, const double Tolerance);

		/****** Geom2dGcc_Circ2d2TanOnIter::Geom2dGcc_Circ2d2TanOnIter ******/
		/****** md5 signature: 418d4ecdf7352c7b070072ca814ad23f ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnIter;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: Geom2dGcc_QCurve
OnCirc: gp_Circ2d
Param1: double
Param2: double
Param3: double
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to a 2d circle and a curve and having the center ON a 2d circle. Param2 is the initial guess on the curve QualifiedCurv. Tolerance is used for the limit cases.
") Geom2dGcc_Circ2d2TanOnIter;
		 Geom2dGcc_Circ2d2TanOnIter(const GccEnt_QualifiedCirc & Qualified1, const Geom2dGcc_QCurve & Qualified2, const gp_Circ2d & OnCirc, const double Param1, const double Param2, const double Param3, const double Tolerance);

		/****** Geom2dGcc_Circ2d2TanOnIter::Geom2dGcc_Circ2d2TanOnIter ******/
		/****** md5 signature: 140e6d39bb200613d96ab42456431e65 ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnIter;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedLin
Qualified2: Geom2dGcc_QCurve
OnCirc: gp_Circ2d
Param1: double
Param2: double
Param3: double
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to a 2d line and a curve and having the center ON a 2d circle. Param2 is the initial guess on the curve QualifiedCurv. Tolerance is used for the limit cases.
") Geom2dGcc_Circ2d2TanOnIter;
		 Geom2dGcc_Circ2d2TanOnIter(const GccEnt_QualifiedLin & Qualified1, const Geom2dGcc_QCurve & Qualified2, const gp_Circ2d & OnCirc, const double Param1, const double Param2, const double Param3, const double Tolerance);

		/****** Geom2dGcc_Circ2d2TanOnIter::Geom2dGcc_Circ2d2TanOnIter ******/
		/****** md5 signature: 44af146f8b5477b935c45cc5a279bd76 ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnIter;
		%feature("autodoc", "
Parameters
----------
Qualified1: Geom2dGcc_QCurve
Qualified2: Geom2dGcc_QCurve
OnCirc: gp_Circ2d
Param1: double
Param2: double
Param3: double
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to two curves and having the center ON a 2d circle. Param1 is the initial guess on the first QualifiedCurv. Param2 is the initial guess on the first QualifiedCurv. Tolerance is used for the limit cases.
") Geom2dGcc_Circ2d2TanOnIter;
		 Geom2dGcc_Circ2d2TanOnIter(const Geom2dGcc_QCurve & Qualified1, const Geom2dGcc_QCurve & Qualified2, const gp_Circ2d & OnCirc, const double Param1, const double Param2, const double Param3, const double Tolerance);

		/****** Geom2dGcc_Circ2d2TanOnIter::Geom2dGcc_Circ2d2TanOnIter ******/
		/****** md5 signature: 77dc6acc7596b2e0bc4d80d2360798b1 ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnIter;
		%feature("autodoc", "
Parameters
----------
Qualified1: Geom2dGcc_QCurve
Point2: gp_Pnt2d
OnCirc: gp_Circ2d
Param1: double
Param2: double
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to a 2d point and a curve and having the center ON a 2d circle. Param2 is the initial guess on the curve QualifiedCurv. Tolerance is used for the limit cases.
") Geom2dGcc_Circ2d2TanOnIter;
		 Geom2dGcc_Circ2d2TanOnIter(const Geom2dGcc_QCurve & Qualified1, const gp_Pnt2d & Point2, const gp_Circ2d & OnCirc, const double Param1, const double Param2, const double Tolerance);

		/****** Geom2dGcc_Circ2d2TanOnIter::Geom2dGcc_Circ2d2TanOnIter ******/
		/****** md5 signature: 68db5f611d362e2d716ecc1fdf423819 ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnIter;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: Geom2dGcc_QCurve
OnCurv: Geom2dAdaptor_Curve
Param1: double
Param2: double
ParamOn: double
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to a 2d circle and a curve and having the center ON a 2d curve. Param2 is the initial guess on the curve QualifiedCurv. ParamOn is the initial guess on the center curve OnCurv. Tolerance is used for the limit cases.
") Geom2dGcc_Circ2d2TanOnIter;
		 Geom2dGcc_Circ2d2TanOnIter(const GccEnt_QualifiedCirc & Qualified1, const Geom2dGcc_QCurve & Qualified2, const Geom2dAdaptor_Curve & OnCurv, const double Param1, const double Param2, const double ParamOn, const double Tolerance);

		/****** Geom2dGcc_Circ2d2TanOnIter::Geom2dGcc_Circ2d2TanOnIter ******/
		/****** md5 signature: 3d790f487de7824b384a1c5d0ccf857a ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnIter;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedLin
Qualified2: Geom2dGcc_QCurve
OnCurve: Geom2dAdaptor_Curve
Param1: double
Param2: double
ParamOn: double
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to a 2d line and a curve and having the center ON a 2d curve. Param2 is the initial guess on the curve QualifiedCurv. ParamOn is the initial guess on the center curve OnCurv. Tolerance is used for the limit cases.
") Geom2dGcc_Circ2d2TanOnIter;
		 Geom2dGcc_Circ2d2TanOnIter(const GccEnt_QualifiedLin & Qualified1, const Geom2dGcc_QCurve & Qualified2, const Geom2dAdaptor_Curve & OnCurve, const double Param1, const double Param2, const double ParamOn, const double Tolerance);

		/****** Geom2dGcc_Circ2d2TanOnIter::Geom2dGcc_Circ2d2TanOnIter ******/
		/****** md5 signature: 50466a38426bb4f0d7e37a3fdda1a191 ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnIter;
		%feature("autodoc", "
Parameters
----------
Qualified1: Geom2dGcc_QCurve
Point2: gp_Pnt2d
OnCurve: Geom2dAdaptor_Curve
Param1: double
ParamOn: double
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to a 2d Point and a curve and having the center ON a 2d curve. Param1 is the initial guess on the curve QualifiedCurv. ParamOn is the initial guess on the center curve OnCurv. Tolerance is used for the limit cases.
") Geom2dGcc_Circ2d2TanOnIter;
		 Geom2dGcc_Circ2d2TanOnIter(const Geom2dGcc_QCurve & Qualified1, const gp_Pnt2d & Point2, const Geom2dAdaptor_Curve & OnCurve, const double Param1, const double ParamOn, const double Tolerance);

		/****** Geom2dGcc_Circ2d2TanOnIter::Geom2dGcc_Circ2d2TanOnIter ******/
		/****** md5 signature: 9cbd8099252b96572e28a1b10370684d ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanOnIter;
		%feature("autodoc", "
Parameters
----------
Qualified1: Geom2dGcc_QCurve
Qualified2: Geom2dGcc_QCurve
OnCurve: Geom2dAdaptor_Curve
Param1: double
Param2: double
ParamOn: double
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to two curves and having the center ON a 2d curve. Param1 is the initial guess on the first curve QualifiedCurv. Param1 is the initial guess on the second curve QualifiedCurv. ParamOn is the initial guess on the center curve OnCurv. Tolerance is used for the limit cases.
") Geom2dGcc_Circ2d2TanOnIter;
		 Geom2dGcc_Circ2d2TanOnIter(const Geom2dGcc_QCurve & Qualified1, const Geom2dGcc_QCurve & Qualified2, const Geom2dAdaptor_Curve & OnCurve, const double Param1, const double Param2, const double ParamOn, const double Tolerance);

		/****** Geom2dGcc_Circ2d2TanOnIter::CenterOn3 ******/
		/****** md5 signature: 4cdf3cd17d8f42808b00555b950e5d23 ******/
		%feature("compactdefaultargs") CenterOn3;
		%feature("autodoc", "
Parameters
----------
PntSol: gp_Pnt2d

Return
-------
ParArg: double

Description
-----------
Returns information about the center (on the curv) of the result and the third argument. It raises NotDone if the construction algorithm didn't succeed.
") CenterOn3;
		void CenterOn3(Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** Geom2dGcc_Circ2d2TanOnIter::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
This method returns True if the construction algorithm succeeded.
") IsDone;
		bool IsDone();

		/****** Geom2dGcc_Circ2d2TanOnIter::IsTheSame1 ******/
		/****** md5 signature: de67e15c7674560b2ec23b67c82fa772 ******/
		%feature("compactdefaultargs") IsTheSame1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
It raises NotDone if the construction algorithm didn't succeed.
") IsTheSame1;
		bool IsTheSame1();

		/****** Geom2dGcc_Circ2d2TanOnIter::IsTheSame2 ******/
		/****** md5 signature: 19b030f50d8abba95198a80bc87bb8dd ******/
		%feature("compactdefaultargs") IsTheSame2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
It raises NotDone if the construction algorithm didn't succeed.
") IsTheSame2;
		bool IsTheSame2();

		/****** Geom2dGcc_Circ2d2TanOnIter::Tangency1 ******/
		/****** md5 signature: 0bc466d77eab1fdc5b48801bafdc49ce ******/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "
Parameters
----------
PntSol: gp_Pnt2d

Return
-------
ParSol: double
ParArg: double

Description
-----------
Returns information about the tangency point between the result and the first argument. ParSol is the intrinsic parameter of the point PntSol on the solution curv. ParArg is the intrinsic parameter of the point PntSol on the argument curv. It raises NotDone if the construction algorithm didn't succeed.
") Tangency1;
		void Tangency1(Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** Geom2dGcc_Circ2d2TanOnIter::Tangency2 ******/
		/****** md5 signature: aa83bd7c252a51c566b5423ff9226e67 ******/
		%feature("compactdefaultargs") Tangency2;
		%feature("autodoc", "
Parameters
----------
PntSol: gp_Pnt2d

Return
-------
ParSol: double
ParArg: double

Description
-----------
Returns information about the tangency point between the result and the second argument. ParSol is the intrinsic parameter of the point PntSol on the solution curv. ParArg is the intrinsic parameter of the point PntSol on the argument curv. It raises NotDone if the construction algorithm didn't succeed.
") Tangency2;
		void Tangency2(Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** Geom2dGcc_Circ2d2TanOnIter::ThisSolution ******/
		/****** md5 signature: 50650dcd3805abd7ee971e85270fb1f3 ******/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "Return
-------
gp_Circ2d

Description
-----------
Returns the solution. It raises NotDone if the construction algorithm didn't succeed.
") ThisSolution;
		gp_Circ2d ThisSolution();

		/****** Geom2dGcc_Circ2d2TanOnIter::WhichQualifier ******/
		/****** md5 signature: 1ab6984ef65a32f2b20ea0a40b6d02a7 ******/
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "
Parameters
----------

Return
-------
Qualif1: GccEnt_Position
Qualif2: GccEnt_Position

Description
-----------
No available documentation.
") WhichQualifier;
		void WhichQualifier(GccEnt_Position &OutValue, GccEnt_Position &OutValue);

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
		/****** Geom2dGcc_Circ2d2TanRad::Geom2dGcc_Circ2d2TanRad ******/
		/****** md5 signature: a723c1afaffb469b9a7bb03021d3b814 ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanRad;
		%feature("autodoc", "
Parameters
----------
Qualified1: Geom2dGcc_QualifiedCurve
Qualified2: Geom2dGcc_QualifiedCurve
Radius: double
Tolerance: double

Return
-------
None

Description
-----------
No available documentation.
") Geom2dGcc_Circ2d2TanRad;
		 Geom2dGcc_Circ2d2TanRad(const Geom2dGcc_QualifiedCurve & Qualified1, const Geom2dGcc_QualifiedCurve & Qualified2, const double Radius, const double Tolerance);

		/****** Geom2dGcc_Circ2d2TanRad::Geom2dGcc_Circ2d2TanRad ******/
		/****** md5 signature: b6498facacc36b8ceb1eea3fcc7e6bac ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanRad;
		%feature("autodoc", "
Parameters
----------
Qualified1: Geom2dGcc_QualifiedCurve
Point: Geom2d_Point
Radius: double
Tolerance: double

Return
-------
None

Description
-----------
No available documentation.
") Geom2dGcc_Circ2d2TanRad;
		 Geom2dGcc_Circ2d2TanRad(const Geom2dGcc_QualifiedCurve & Qualified1, const opencascade::handle<Geom2d_Point> & Point, const double Radius, const double Tolerance);

		/****** Geom2dGcc_Circ2d2TanRad::Geom2dGcc_Circ2d2TanRad ******/
		/****** md5 signature: 47747dea54d74e3e22fc4d675d5c728a ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanRad;
		%feature("autodoc", "
Parameters
----------
Point1: Geom2d_Point
Point2: Geom2d_Point
Radius: double
Tolerance: double

Return
-------
None

Description
-----------
These constructors create one or more 2D circles of radius Radius either - tangential to the 2 curves Qualified1 and Qualified2, or - tangential to the curve Qualified1 and passing through the point Point, or - passing through two points Point1 and Point2. Tolerance is a tolerance criterion used by the algorithm to find a solution when, mathematically, the problem posed does not have a solution, but where there is numeric uncertainty attached to the arguments. For example, take two circles C1 and C2, such that C2 is inside C1, and almost tangential to C1. There is, in fact, no point of intersection between C1 and C2. You now want to find a circle of radius R (smaller than the radius of C2), which is tangential to C1 and C2, and inside these two circles: a pure mathematical resolution will not find a solution. This is where the tolerance criterion is used: the algorithm considers that C1 and C2 are tangential if the shortest distance between these two circles is less than or equal to Tolerance. Thus, a solution is found by the algorithm. Exceptions GccEnt_BadQualifier if a qualifier is inconsistent with the argument it qualifies (for example, enclosing for a line). Standard_NegativeValue if Radius is negative.
") Geom2dGcc_Circ2d2TanRad;
		 Geom2dGcc_Circ2d2TanRad(const opencascade::handle<Geom2d_Point> & Point1, const opencascade::handle<Geom2d_Point> & Point2, const double Radius, const double Tolerance);

		/****** Geom2dGcc_Circ2d2TanRad::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
This method returns True if the algorithm succeeded. Note: IsDone protects against a failure arising from a more internal intersection algorithm, which has reached its numeric limits.
") IsDone;
		bool IsDone();

		/****** Geom2dGcc_Circ2d2TanRad::IsTheSame1 ******/
		/****** md5 signature: dca7508c3bfc2cd444c9a790b211d29e ******/
		%feature("compactdefaultargs") IsTheSame1;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
bool

Description
-----------
Returns true if the solution of index Index and, respectively, the first or second argument of this algorithm are the same (i.e. there are 2 identical circles). If Rarg is the radius of the first or second argument, Rsol is the radius of the solution and dist is the distance between the two centers, we consider the two circles to be identical if |Rarg - Rsol| and dist are less than or equal to the tolerance criterion given at the time of construction of this algorithm. OutOfRange is raised if Index is greater than the number of solutions. notDone is raised if the construction algorithm did not succeed.
") IsTheSame1;
		bool IsTheSame1(const int Index);

		/****** Geom2dGcc_Circ2d2TanRad::IsTheSame2 ******/
		/****** md5 signature: 121515308b9bb4116635801988b1d5af ******/
		%feature("compactdefaultargs") IsTheSame2;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
bool

Description
-----------
Returns true if the solution of index Index and, respectively, the first or second argument of this algorithm are the same (i.e. there are 2 identical circles). If Rarg is the radius of the first or second argument, Rsol is the radius of the solution and dist is the distance between the two centers, we consider the two circles to be identical if |Rarg - Rsol| and dist are less than or equal to the tolerance criterion given at the time of construction of this algorithm. OutOfRange is raised if Index is greater than the number of solutions. notDone is raised if the construction algorithm did not succeed.
") IsTheSame2;
		bool IsTheSame2(const int Index);

		/****** Geom2dGcc_Circ2d2TanRad::NbSolutions ******/
		/****** md5 signature: 55162d50f2670468f6ab0d146e7a9b77 ******/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Return
-------
int

Description
-----------
This method returns the number of solutions. NotDone is raised if the algorithm failed. Exceptions StdFail_NotDone if the construction fails.
") NbSolutions;
		int NbSolutions();

		/****** Geom2dGcc_Circ2d2TanRad::Results ******/
		/****** md5 signature: dab00ed57857c55e9097aeb5b04f5323 ******/
		%feature("compactdefaultargs") Results;
		%feature("autodoc", "
Parameters
----------
Circ: GccAna_Circ2d2TanRad

Return
-------
None

Description
-----------
No available documentation.
") Results;
		void Results(const GccAna_Circ2d2TanRad & Circ);

		/****** Geom2dGcc_Circ2d2TanRad::Results ******/
		/****** md5 signature: 7d91edbeabc277dc23f6db22769d8c1c ******/
		%feature("compactdefaultargs") Results;
		%feature("autodoc", "
Parameters
----------
Circ: Geom2dGcc_Circ2d2TanRadGeo

Return
-------
None

Description
-----------
No available documentation.
") Results;
		void Results(const Geom2dGcc_Circ2d2TanRadGeo & Circ);

		/****** Geom2dGcc_Circ2d2TanRad::Tangency1 ******/
		/****** md5 signature: 8e976db6ec5fed2b45f5bcd201f60aaa ******/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "
Parameters
----------
Index: int
PntSol: gp_Pnt2d

Return
-------
ParSol: double
ParArg: double

Description
-----------
Returns information about the tangency point between the result number Index and the first argument. ParSol is the intrinsic parameter of the point PntSol on the solution curv. ParArg is the intrinsic parameter of the point PntSol on the argument curv. OutOfRange is raised if Index is greater than the number of solutions. notDone is raised if the construction algorithm did not succeed.
") Tangency1;
		void Tangency1(const int Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** Geom2dGcc_Circ2d2TanRad::Tangency2 ******/
		/****** md5 signature: 3f1f83dbdaea1988497a83645ade6207 ******/
		%feature("compactdefaultargs") Tangency2;
		%feature("autodoc", "
Parameters
----------
Index: int
PntSol: gp_Pnt2d

Return
-------
ParSol: double
ParArg: double

Description
-----------
Returns information about the tangency point between the result number Index and the second argument. ParSol is the intrinsic parameter of the point PntSol on the solution curv. ParArg is the intrinsic parameter of the point PntSol on the argument curv. OutOfRange is raised if Index is greater than the number of solutions. notDone is raised if the construction algorithm did not succeed.
") Tangency2;
		void Tangency2(const int Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** Geom2dGcc_Circ2d2TanRad::ThisSolution ******/
		/****** md5 signature: 2e1125d1397b55b627ac75adbb37458f ******/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
gp_Circ2d

Description
-----------
Returns the solution number Index and raises OutOfRange exception if Index is greater than the number of solutions. Be careful: the Index is only a way to get all the solutions, but is not associated to these outside the context of the algorithm-object. Warning This indexing simply provides a means of consulting the solutions. The index values are not associated with these solutions outside the context of the algorithm object. Exceptions Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.
") ThisSolution;
		gp_Circ2d ThisSolution(const int Index);

		/****** Geom2dGcc_Circ2d2TanRad::WhichQualifier ******/
		/****** md5 signature: af20731e994c9da3e41b1695171b3bae ******/
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
Qualif1: GccEnt_Position
Qualif2: GccEnt_Position

Description
-----------
Returns the qualifiers Qualif1 and Qualif2 of the tangency arguments for the solution of index Index computed by this algorithm. The returned qualifiers are: - those specified at the start of construction when the solutions are defined as enclosed, enclosing or outside with respect to the arguments, or - those computed during construction (i.e. enclosed, enclosing or outside) when the solutions are defined as unqualified with respect to the arguments, or - GccEnt_noqualifier if the tangency argument is a point, or - GccEnt_unqualified in certain limit cases where it is impossible to qualify the solution as enclosed, enclosing or outside. Exceptions Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.
") WhichQualifier;
		void WhichQualifier(const int Index, GccEnt_Position &OutValue, GccEnt_Position &OutValue);

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
		/****** Geom2dGcc_Circ2d2TanRadGeo::Geom2dGcc_Circ2d2TanRadGeo ******/
		/****** md5 signature: bea30652a574d348a7234c32baf213c8 ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanRadGeo;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: Geom2dGcc_QCurve
Radius: double
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to a 2d circle and a curve with a radius of Radius. It raises NegativeValue if Radius is lower than zero.
") Geom2dGcc_Circ2d2TanRadGeo;
		 Geom2dGcc_Circ2d2TanRadGeo(const GccEnt_QualifiedCirc & Qualified1, const Geom2dGcc_QCurve & Qualified2, const double Radius, const double Tolerance);

		/****** Geom2dGcc_Circ2d2TanRadGeo::Geom2dGcc_Circ2d2TanRadGeo ******/
		/****** md5 signature: 1fd6c5bd793b48229fcd2457842b7bdb ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanRadGeo;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedLin
Qualified2: Geom2dGcc_QCurve
Radius: double
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to a 2d line and a curve with a radius of Radius. It raises NegativeValue if Radius is lower than zero.
") Geom2dGcc_Circ2d2TanRadGeo;
		 Geom2dGcc_Circ2d2TanRadGeo(const GccEnt_QualifiedLin & Qualified1, const Geom2dGcc_QCurve & Qualified2, const double Radius, const double Tolerance);

		/****** Geom2dGcc_Circ2d2TanRadGeo::Geom2dGcc_Circ2d2TanRadGeo ******/
		/****** md5 signature: f42fac290c9e89ce30aa77d456cb9d60 ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanRadGeo;
		%feature("autodoc", "
Parameters
----------
Qualified1: Geom2dGcc_QCurve
Qualified2: Geom2dGcc_QCurve
Radius: double
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to two curves with a radius of Radius. It raises NegativeValue if Radius is lower than zero.
") Geom2dGcc_Circ2d2TanRadGeo;
		 Geom2dGcc_Circ2d2TanRadGeo(const Geom2dGcc_QCurve & Qualified1, const Geom2dGcc_QCurve & Qualified2, const double Radius, const double Tolerance);

		/****** Geom2dGcc_Circ2d2TanRadGeo::Geom2dGcc_Circ2d2TanRadGeo ******/
		/****** md5 signature: 9c7fbd966faa2a97a487b7c609b7f758 ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d2TanRadGeo;
		%feature("autodoc", "
Parameters
----------
Qualified1: Geom2dGcc_QCurve
Point2: gp_Pnt2d
Radius: double
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to a curve and a point with a radius of Radius. It raises NegativeValue if Radius is lower than zero.
") Geom2dGcc_Circ2d2TanRadGeo;
		 Geom2dGcc_Circ2d2TanRadGeo(const Geom2dGcc_QCurve & Qualified1, const gp_Pnt2d & Point2, const double Radius, const double Tolerance);

		/****** Geom2dGcc_Circ2d2TanRadGeo::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
This method returns True if the algorithm succeeded.
") IsDone;
		bool IsDone();

		/****** Geom2dGcc_Circ2d2TanRadGeo::IsTheSame1 ******/
		/****** md5 signature: dca7508c3bfc2cd444c9a790b211d29e ******/
		%feature("compactdefaultargs") IsTheSame1;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
bool

Description
-----------
Returns True if the solution number Index is equal to the first argument. It raises OutOfRange if Index is greater than the number of solutions. It raises NotDone if the construction algorithm did not succeed.
") IsTheSame1;
		bool IsTheSame1(const int Index);

		/****** Geom2dGcc_Circ2d2TanRadGeo::IsTheSame2 ******/
		/****** md5 signature: 121515308b9bb4116635801988b1d5af ******/
		%feature("compactdefaultargs") IsTheSame2;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
bool

Description
-----------
Returns True if the solution number Index is equal to the second argument. It raises OutOfRange if Index is greater than the number of solutions. It raises NotDone if the construction algorithm did not succeed.
") IsTheSame2;
		bool IsTheSame2(const int Index);

		/****** Geom2dGcc_Circ2d2TanRadGeo::NbSolutions ******/
		/****** md5 signature: 55162d50f2670468f6ab0d146e7a9b77 ******/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Return
-------
int

Description
-----------
This method returns the number of solutions. It raises NotDone if the algorithm failed.
") NbSolutions;
		int NbSolutions();

		/****** Geom2dGcc_Circ2d2TanRadGeo::Tangency1 ******/
		/****** md5 signature: 8e976db6ec5fed2b45f5bcd201f60aaa ******/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "
Parameters
----------
Index: int
PntSol: gp_Pnt2d

Return
-------
ParSol: double
ParArg: double

Description
-----------
Returns information about the tangency point between the result number Index and the first argument. ParSol is the intrinsic parameter of the point PntSol on the solution. ParArg is the intrinsic parameter of the point PntSol on the first argument. It raises OutOfRange if Index is greater than the number of solutions. It raises NotDone if the construction algorithm did not succeed.
") Tangency1;
		void Tangency1(const int Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** Geom2dGcc_Circ2d2TanRadGeo::Tangency2 ******/
		/****** md5 signature: 3f1f83dbdaea1988497a83645ade6207 ******/
		%feature("compactdefaultargs") Tangency2;
		%feature("autodoc", "
Parameters
----------
Index: int
PntSol: gp_Pnt2d

Return
-------
ParSol: double
ParArg: double

Description
-----------
Returns information about the tangency point between the result number Index and the second argument. ParSol is the intrinsic parameter of the point PntSol on the solution. ParArg is the intrinsic parameter of the point PntArg on the second argument. It raises OutOfRange if Index is greater than the number of solutions. It raises NotDone if the construction algorithm did not succeed.
") Tangency2;
		void Tangency2(const int Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** Geom2dGcc_Circ2d2TanRadGeo::ThisSolution ******/
		/****** md5 signature: 2e1125d1397b55b627ac75adbb37458f ******/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
gp_Circ2d

Description
-----------
Returns the solution number Index. Be careful: the Index is only a way to get all the solutions, but is not associated to those outside the context of the algorithm-object. It raises OutOfRange exception if Index is greater than the number of solutions. It raises NotDone if the construction algorithm did not succeed.
") ThisSolution;
		gp_Circ2d ThisSolution(const int Index);

		/****** Geom2dGcc_Circ2d2TanRadGeo::WhichQualifier ******/
		/****** md5 signature: af20731e994c9da3e41b1695171b3bae ******/
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
Qualif1: GccEnt_Position
Qualif2: GccEnt_Position

Description
-----------
It returns the information about the qualifiers of the tangency arguments concerning the solution number Index. It returns the real qualifiers (the qualifiers given to the constructor method in case of enclosed, enclosing and outside and the qualifiers computedin case of unqualified).
") WhichQualifier;
		void WhichQualifier(const int Index, GccEnt_Position &OutValue, GccEnt_Position &OutValue);

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
		/****** Geom2dGcc_Circ2d3Tan::Geom2dGcc_Circ2d3Tan ******/
		/****** md5 signature: 6e02b1c0c708b62a34d83904423eb309 ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d3Tan;
		%feature("autodoc", "
Parameters
----------
Qualified1: Geom2dGcc_QualifiedCurve
Qualified2: Geom2dGcc_QualifiedCurve
Qualified3: Geom2dGcc_QualifiedCurve
Tolerance: double
Param1: double
Param2: double
Param3: double

Return
-------
None

Description
-----------
Constructs one or more 2D circles tangential to three curves Qualified1, Qualified2 and Qualified3, where Param1, Param2 and Param3 are used, respectively, as the initial values of the parameters on Qualified1, Qualified2 and Qualified3 of the tangency point between these arguments and the solution sought, if the algorithm chooses an iterative method to find the solution (i.e. if either Qualified1, Qualified2 or Qualified3 is more complex than a line or a circle).
") Geom2dGcc_Circ2d3Tan;
		 Geom2dGcc_Circ2d3Tan(const Geom2dGcc_QualifiedCurve & Qualified1, const Geom2dGcc_QualifiedCurve & Qualified2, const Geom2dGcc_QualifiedCurve & Qualified3, const double Tolerance, const double Param1, const double Param2, const double Param3);

		/****** Geom2dGcc_Circ2d3Tan::Geom2dGcc_Circ2d3Tan ******/
		/****** md5 signature: b8099c2adc271ce5265e3b65d29c4a9c ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d3Tan;
		%feature("autodoc", "
Parameters
----------
Qualified1: Geom2dGcc_QualifiedCurve
Qualified2: Geom2dGcc_QualifiedCurve
Point: Geom2d_Point
Tolerance: double
Param1: double
Param2: double

Return
-------
None

Description
-----------
Constructs one or more 2D circles tangential to two curves Qualified1 and Qualified2 and passing through the point Point, where Param1 and Param2 are used, respectively, as the initial values of the parameters on Qualified1 and Qualified2 of the tangency point between this argument and the solution sought, if the algorithm chooses an iterative method to find the solution (i.e. if either Qualified1 or Qualified2 is more complex than a line or a circle).
") Geom2dGcc_Circ2d3Tan;
		 Geom2dGcc_Circ2d3Tan(const Geom2dGcc_QualifiedCurve & Qualified1, const Geom2dGcc_QualifiedCurve & Qualified2, const opencascade::handle<Geom2d_Point> & Point, const double Tolerance, const double Param1, const double Param2);

		/****** Geom2dGcc_Circ2d3Tan::Geom2dGcc_Circ2d3Tan ******/
		/****** md5 signature: 505ee80768658a062de1a35d8ca3c479 ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d3Tan;
		%feature("autodoc", "
Parameters
----------
Qualified1: Geom2dGcc_QualifiedCurve
Point1: Geom2d_Point
Point2: Geom2d_Point
Tolerance: double
Param1: double

Return
-------
None

Description
-----------
Constructs one or more 2D circles tangential to the curve Qualified1 and passing through two points Point1 and Point2, where Param1 is used as the initial value of the parameter on Qualified1 of the tangency point between this argument and the solution sought, if the algorithm chooses an iterative method to find the solution (i.e. if Qualified1 is more complex than a line or a circle).
") Geom2dGcc_Circ2d3Tan;
		 Geom2dGcc_Circ2d3Tan(const Geom2dGcc_QualifiedCurve & Qualified1, const opencascade::handle<Geom2d_Point> & Point1, const opencascade::handle<Geom2d_Point> & Point2, const double Tolerance, const double Param1);

		/****** Geom2dGcc_Circ2d3Tan::Geom2dGcc_Circ2d3Tan ******/
		/****** md5 signature: 43ce6410c156c0a91d3cb8f2f7dba1f2 ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d3Tan;
		%feature("autodoc", "
Parameters
----------
Point1: Geom2d_Point
Point2: Geom2d_Point
Point3: Geom2d_Point
Tolerance: double

Return
-------
None

Description
-----------
Constructs one or more 2D circles passing through three points Point1, Point2 and Point3. Tolerance is a tolerance criterion used by the algorithm to find a solution when, mathematically, the problem posed does not have a solution, but where there is numeric uncertainty attached to the arguments. For example, take: - two circles C1 and C2, such that C2 is inside C1, and almost tangential to C1; there is in fact no point of intersection between C1 and C2; and - a circle C3 outside C1. You now want to find a circle which is tangential to C1, C2 and C3: a pure mathematical resolution will not find a solution. This is where the tolerance criterion is used: the algorithm considers that C1 and C2 are tangential if the shortest distance between these two circles is less than or equal to Tolerance. Thus, the algorithm finds a solution. Warning An iterative algorithm is used if Qualified1, Qualified2 or Qualified3 is more complex than a line or a circle. In such cases, the algorithm constructs only one solution. Exceptions GccEnt_BadQualifier if a qualifier is inconsistent with the argument it qualifies (for example, enclosing for a line).
") Geom2dGcc_Circ2d3Tan;
		 Geom2dGcc_Circ2d3Tan(const opencascade::handle<Geom2d_Point> & Point1, const opencascade::handle<Geom2d_Point> & Point2, const opencascade::handle<Geom2d_Point> & Point3, const double Tolerance);

		/****** Geom2dGcc_Circ2d3Tan::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the construction algorithm does not fail (even if it finds no solution). Note: IsDone protects against a failure arising from a more internal intersection algorithm, which has reached its numeric limits.
") IsDone;
		bool IsDone();

		/****** Geom2dGcc_Circ2d3Tan::IsTheSame1 ******/
		/****** md5 signature: dca7508c3bfc2cd444c9a790b211d29e ******/
		%feature("compactdefaultargs") IsTheSame1;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
bool

Description
-----------
Returns True if the solution is equal to the first argument.
") IsTheSame1;
		bool IsTheSame1(const int Index);

		/****** Geom2dGcc_Circ2d3Tan::IsTheSame2 ******/
		/****** md5 signature: 121515308b9bb4116635801988b1d5af ******/
		%feature("compactdefaultargs") IsTheSame2;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
bool

Description
-----------
Returns True if the solution is equal to the second argument.
") IsTheSame2;
		bool IsTheSame2(const int Index);

		/****** Geom2dGcc_Circ2d3Tan::IsTheSame3 ******/
		/****** md5 signature: 306bfe59d22bd90235756519011daa7e ******/
		%feature("compactdefaultargs") IsTheSame3;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
bool

Description
-----------
Returns True if the solution is equal to the third argument. If Rarg is the radius of the first, second or third argument, Rsol is the radius of the solution and dist is the distance between the two centers, we consider the two circles to be identical if |Rarg - Rsol| and dist are less than or equal to the tolerance criterion given at the time of construction of this algorithm. Exceptions Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.
") IsTheSame3;
		bool IsTheSame3(const int Index);

		/****** Geom2dGcc_Circ2d3Tan::NbSolutions ******/
		/****** md5 signature: 55162d50f2670468f6ab0d146e7a9b77 ******/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Return
-------
int

Description
-----------
This method returns the number of solutions. NotDone is raised if the algorithm failed.
") NbSolutions;
		int NbSolutions();

		/****** Geom2dGcc_Circ2d3Tan::Results ******/
		/****** md5 signature: df2e99f9ad29183888b6bb43f0c108af ******/
		%feature("compactdefaultargs") Results;
		%feature("autodoc", "
Parameters
----------
Circ: GccAna_Circ2d3Tan
Rank1: int
Rank2: int
Rank3: int

Return
-------
None

Description
-----------
No available documentation.
") Results;
		void Results(const GccAna_Circ2d3Tan & Circ, const int Rank1, const int Rank2, const int Rank3);

		/****** Geom2dGcc_Circ2d3Tan::Tangency1 ******/
		/****** md5 signature: 8e976db6ec5fed2b45f5bcd201f60aaa ******/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "
Parameters
----------
Index: int
PntSol: gp_Pnt2d

Return
-------
ParSol: double
ParArg: double

Description
-----------
Returns information about the tangency point between the result and the first argument. ParSol is the intrinsic parameter of the point PntSol on the solution curv. ParArg is the intrinsic parameter of the point PntSol on the argument curv.
") Tangency1;
		void Tangency1(const int Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** Geom2dGcc_Circ2d3Tan::Tangency2 ******/
		/****** md5 signature: 3f1f83dbdaea1988497a83645ade6207 ******/
		%feature("compactdefaultargs") Tangency2;
		%feature("autodoc", "
Parameters
----------
Index: int
PntSol: gp_Pnt2d

Return
-------
ParSol: double
ParArg: double

Description
-----------
Returns information about the tangency point between the result and the second argument. ParSol is the intrinsic parameter of the point PntSol on the solution curv. ParArg is the intrinsic parameter of the point PntSol on the argument curv.
") Tangency2;
		void Tangency2(const int Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** Geom2dGcc_Circ2d3Tan::Tangency3 ******/
		/****** md5 signature: d1ba1e2bb348d3ca5aa086bf5c9f8c6c ******/
		%feature("compactdefaultargs") Tangency3;
		%feature("autodoc", "
Parameters
----------
Index: int
PntSol: gp_Pnt2d

Return
-------
ParSol: double
ParArg: double

Description
-----------
Returns information about the tangency point between the result and the third argument. ParSol is the intrinsic parameter of the point PntSol on the solution curv. ParArg is the intrinsic parameter of the point PntSol on the argument curv.
") Tangency3;
		void Tangency3(const int Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** Geom2dGcc_Circ2d3Tan::ThisSolution ******/
		/****** md5 signature: 2e1125d1397b55b627ac75adbb37458f ******/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
gp_Circ2d

Description
-----------
Returns the solution number Index and raises OutOfRange exception if Index is greater than the number of solutions. Be careful: the Index is only a way to get all the solutions, but is not associated to these outside the context of the algorithm-object.
") ThisSolution;
		gp_Circ2d ThisSolution(const int Index);

		/****** Geom2dGcc_Circ2d3Tan::WhichQualifier ******/
		/****** md5 signature: 2f42300cec25cd6b913dacdacb67c9b6 ******/
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
Qualif1: GccEnt_Position
Qualif2: GccEnt_Position
Qualif3: GccEnt_Position

Description
-----------
It returns the information about the qualifiers of the tangency arguments concerning the solution number Index. It returns the real qualifiers (the qualifiers given to the constructor method in case of enclosed, enclosing and outside and the qualifiers computedin case of unqualified).
") WhichQualifier;
		void WhichQualifier(const int Index, GccEnt_Position &OutValue, GccEnt_Position &OutValue, GccEnt_Position &OutValue);

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
		/****** Geom2dGcc_Circ2d3TanIter::Geom2dGcc_Circ2d3TanIter ******/
		/****** md5 signature: 76beae64ea02d90bc0fafcc3fc6a19e8 ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d3TanIter;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: GccEnt_QualifiedCirc
Qualified3: Geom2dGcc_QCurve
Param1: double
Param2: double
Param3: double
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles tangent to 2 circles and a curve.
") Geom2dGcc_Circ2d3TanIter;
		 Geom2dGcc_Circ2d3TanIter(const GccEnt_QualifiedCirc & Qualified1, const GccEnt_QualifiedCirc & Qualified2, const Geom2dGcc_QCurve & Qualified3, const double Param1, const double Param2, const double Param3, const double Tolerance);

		/****** Geom2dGcc_Circ2d3TanIter::Geom2dGcc_Circ2d3TanIter ******/
		/****** md5 signature: 015b034f6a40c550e778968168617850 ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d3TanIter;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: Geom2dGcc_QCurve
Qualified3: Geom2dGcc_QCurve
Param1: double
Param2: double
Param3: double
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles tangent to a circle and 2 curves.
") Geom2dGcc_Circ2d3TanIter;
		 Geom2dGcc_Circ2d3TanIter(const GccEnt_QualifiedCirc & Qualified1, const Geom2dGcc_QCurve & Qualified2, const Geom2dGcc_QCurve & Qualified3, const double Param1, const double Param2, const double Param3, const double Tolerance);

		/****** Geom2dGcc_Circ2d3TanIter::Geom2dGcc_Circ2d3TanIter ******/
		/****** md5 signature: 4c01dd9264ec8cca721d718c767f68ec ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d3TanIter;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: GccEnt_QualifiedLin
Qualified3: Geom2dGcc_QCurve
Param1: double
Param2: double
Param3: double
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles tangent to a circle and a line and a curve.
") Geom2dGcc_Circ2d3TanIter;
		 Geom2dGcc_Circ2d3TanIter(const GccEnt_QualifiedCirc & Qualified1, const GccEnt_QualifiedLin & Qualified2, const Geom2dGcc_QCurve & Qualified3, const double Param1, const double Param2, const double Param3, const double Tolerance);

		/****** Geom2dGcc_Circ2d3TanIter::Geom2dGcc_Circ2d3TanIter ******/
		/****** md5 signature: 0ff5edba092f306f12aad7a3ba6c4fd9 ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d3TanIter;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: Geom2dGcc_QCurve
Point3: gp_Pnt2d
Param1: double
Param2: double
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles tangent to a circle and a point and a curve.
") Geom2dGcc_Circ2d3TanIter;
		 Geom2dGcc_Circ2d3TanIter(const GccEnt_QualifiedCirc & Qualified1, const Geom2dGcc_QCurve & Qualified2, const gp_Pnt2d & Point3, const double Param1, const double Param2, const double Tolerance);

		/****** Geom2dGcc_Circ2d3TanIter::Geom2dGcc_Circ2d3TanIter ******/
		/****** md5 signature: 4b86265704c7f767e1e3fc35c3e7af46 ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d3TanIter;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedLin
Qualified2: GccEnt_QualifiedLin
Qualified3: Geom2dGcc_QCurve
Param1: double
Param2: double
Param3: double
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles tangent to 2 lines and a curve.
") Geom2dGcc_Circ2d3TanIter;
		 Geom2dGcc_Circ2d3TanIter(const GccEnt_QualifiedLin & Qualified1, const GccEnt_QualifiedLin & Qualified2, const Geom2dGcc_QCurve & Qualified3, const double Param1, const double Param2, const double Param3, const double Tolerance);

		/****** Geom2dGcc_Circ2d3TanIter::Geom2dGcc_Circ2d3TanIter ******/
		/****** md5 signature: 862941dd342551b1ad9a65d9f414274e ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d3TanIter;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedLin
Qualified2: Geom2dGcc_QCurve
Qualified3: Geom2dGcc_QCurve
Param1: double
Param2: double
Param3: double
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles tangent to a line and 2 curves.
") Geom2dGcc_Circ2d3TanIter;
		 Geom2dGcc_Circ2d3TanIter(const GccEnt_QualifiedLin & Qualified1, const Geom2dGcc_QCurve & Qualified2, const Geom2dGcc_QCurve & Qualified3, const double Param1, const double Param2, const double Param3, const double Tolerance);

		/****** Geom2dGcc_Circ2d3TanIter::Geom2dGcc_Circ2d3TanIter ******/
		/****** md5 signature: 86a1b8669cd63e0f8f4b4a8d127ed613 ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d3TanIter;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedLin
Qualified2: Geom2dGcc_QCurve
Point3: gp_Pnt2d
Param1: double
Param2: double
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles tangent to a line and a curve and a point.
") Geom2dGcc_Circ2d3TanIter;
		 Geom2dGcc_Circ2d3TanIter(const GccEnt_QualifiedLin & Qualified1, const Geom2dGcc_QCurve & Qualified2, const gp_Pnt2d & Point3, const double Param1, const double Param2, const double Tolerance);

		/****** Geom2dGcc_Circ2d3TanIter::Geom2dGcc_Circ2d3TanIter ******/
		/****** md5 signature: 552cbb7b0e7a9f1d52a1f0c29cb7ec43 ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d3TanIter;
		%feature("autodoc", "
Parameters
----------
Qualified1: Geom2dGcc_QCurve
Point1: gp_Pnt2d
Point2: gp_Pnt2d
Param1: double
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles tangent to a curve and 2 points.
") Geom2dGcc_Circ2d3TanIter;
		 Geom2dGcc_Circ2d3TanIter(const Geom2dGcc_QCurve & Qualified1, const gp_Pnt2d & Point1, const gp_Pnt2d & Point2, const double Param1, const double Tolerance);

		/****** Geom2dGcc_Circ2d3TanIter::Geom2dGcc_Circ2d3TanIter ******/
		/****** md5 signature: 1ea6b74e7b742ccf56eaaf5e91de01fd ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d3TanIter;
		%feature("autodoc", "
Parameters
----------
Qualified1: Geom2dGcc_QCurve
Qualified2: Geom2dGcc_QCurve
Point2: gp_Pnt2d
Param1: double
Param2: double
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles tangent to 2 curves and a point.
") Geom2dGcc_Circ2d3TanIter;
		 Geom2dGcc_Circ2d3TanIter(const Geom2dGcc_QCurve & Qualified1, const Geom2dGcc_QCurve & Qualified2, const gp_Pnt2d & Point2, const double Param1, const double Param2, const double Tolerance);

		/****** Geom2dGcc_Circ2d3TanIter::Geom2dGcc_Circ2d3TanIter ******/
		/****** md5 signature: 1c4a94f70b986ca18fe95c489284cfca ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2d3TanIter;
		%feature("autodoc", "
Parameters
----------
Qualified1: Geom2dGcc_QCurve
Qualified2: Geom2dGcc_QCurve
Qualified3: Geom2dGcc_QCurve
Param1: double
Param2: double
Param3: double
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles tangent to 3 curves.
") Geom2dGcc_Circ2d3TanIter;
		 Geom2dGcc_Circ2d3TanIter(const Geom2dGcc_QCurve & Qualified1, const Geom2dGcc_QCurve & Qualified2, const Geom2dGcc_QCurve & Qualified3, const double Param1, const double Param2, const double Param3, const double Tolerance);

		/****** Geom2dGcc_Circ2d3TanIter::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
This method returns True if the construction algorithm succeeded.
") IsDone;
		bool IsDone();

		/****** Geom2dGcc_Circ2d3TanIter::IsTheSame1 ******/
		/****** md5 signature: de67e15c7674560b2ec23b67c82fa772 ******/
		%feature("compactdefaultargs") IsTheSame1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
It raises NotDone if the construction algorithm didn't succeed.
") IsTheSame1;
		bool IsTheSame1();

		/****** Geom2dGcc_Circ2d3TanIter::IsTheSame2 ******/
		/****** md5 signature: 19b030f50d8abba95198a80bc87bb8dd ******/
		%feature("compactdefaultargs") IsTheSame2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
It raises NotDone if the construction algorithm didn't succeed.
") IsTheSame2;
		bool IsTheSame2();

		/****** Geom2dGcc_Circ2d3TanIter::IsTheSame3 ******/
		/****** md5 signature: 34bc280c5f688c136c4bc1ae89e8a443 ******/
		%feature("compactdefaultargs") IsTheSame3;
		%feature("autodoc", "Return
-------
bool

Description
-----------
It raises NotDone if the construction algorithm didn't succeed.
") IsTheSame3;
		bool IsTheSame3();

		/****** Geom2dGcc_Circ2d3TanIter::Tangency1 ******/
		/****** md5 signature: 0bc466d77eab1fdc5b48801bafdc49ce ******/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "
Parameters
----------
PntSol: gp_Pnt2d

Return
-------
ParSol: double
ParArg: double

Description
-----------
Returns information about the tangency point between the result and the first argument. ParSol is the intrinsic parameter of the point PntSol on the solution curv. ParArg is the intrinsic parameter of the point PntSol on the argument curv. It raises NotDone if the construction algorithm didn't succeed.
") Tangency1;
		void Tangency1(Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** Geom2dGcc_Circ2d3TanIter::Tangency2 ******/
		/****** md5 signature: aa83bd7c252a51c566b5423ff9226e67 ******/
		%feature("compactdefaultargs") Tangency2;
		%feature("autodoc", "
Parameters
----------
PntSol: gp_Pnt2d

Return
-------
ParSol: double
ParArg: double

Description
-----------
Returns information about the tangency point between the result and the second argument. ParSol is the intrinsic parameter of the point PntSol on the solution curv. ParArg is the intrinsic parameter of the point PntSol on the argument curv. It raises NotDone if the construction algorithm didn't succeed.
") Tangency2;
		void Tangency2(Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** Geom2dGcc_Circ2d3TanIter::Tangency3 ******/
		/****** md5 signature: 2a05b52e46b8caa346bfaa19d3f20832 ******/
		%feature("compactdefaultargs") Tangency3;
		%feature("autodoc", "
Parameters
----------
PntSol: gp_Pnt2d

Return
-------
ParSol: double
ParArg: double

Description
-----------
Returns information about the tangency point between the result and the third argument. ParSol is the intrinsic parameter of the point PntSol on the solution curv. ParArg is the intrinsic parameter of the point PntSol on the argument curv. It raises NotDone if the construction algorithm didn't succeed.
") Tangency3;
		void Tangency3(Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** Geom2dGcc_Circ2d3TanIter::ThisSolution ******/
		/****** md5 signature: 50650dcd3805abd7ee971e85270fb1f3 ******/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "Return
-------
gp_Circ2d

Description
-----------
Returns the solution. It raises NotDone if the construction algorithm didn't succeed.
") ThisSolution;
		gp_Circ2d ThisSolution();

		/****** Geom2dGcc_Circ2d3TanIter::WhichQualifier ******/
		/****** md5 signature: 9ee6e5b3a0b6b56d15e7207bfc162bb7 ******/
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "
Parameters
----------

Return
-------
Qualif1: GccEnt_Position
Qualif2: GccEnt_Position
Qualif3: GccEnt_Position

Description
-----------
No available documentation.
") WhichQualifier;
		void WhichQualifier(GccEnt_Position &OutValue, GccEnt_Position &OutValue, GccEnt_Position &OutValue);

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
		/****** Geom2dGcc_Circ2dTanCen::Geom2dGcc_Circ2dTanCen ******/
		/****** md5 signature: 94b394c381b736591dc8e227355581cd ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2dTanCen;
		%feature("autodoc", "
Parameters
----------
Qualified1: Geom2dGcc_QualifiedCurve
Pcenter: Geom2d_Point
Tolerance: double

Return
-------
None

Description
-----------
Constructs one or more 2D circles tangential to the curve Qualified1 and centered on the point Pcenter. Tolerance is a tolerance criterion used by the algorithm to find a solution when, mathematically, the problem posed does not have a solution, but where there is numeric uncertainty attached to the arguments. Tolerance is only used in these algorithms in very specific cases where the center of the solution is very close to the circle to which it is tangential, and where the solution is thus a very small circle. Exceptions GccEnt_BadQualifier if a qualifier is inconsistent with the argument it qualifies (for example, enclosing for a line).
") Geom2dGcc_Circ2dTanCen;
		 Geom2dGcc_Circ2dTanCen(const Geom2dGcc_QualifiedCurve & Qualified1, const opencascade::handle<Geom2d_Point> & Pcenter, const double Tolerance);

		/****** Geom2dGcc_Circ2dTanCen::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the construction algorithm does not fail (even if it finds no solution). Note: IsDone protects against a failure arising from a more internal intersection algorithm, which has reached its numeric limits.
") IsDone;
		bool IsDone();

		/****** Geom2dGcc_Circ2dTanCen::IsTheSame1 ******/
		/****** md5 signature: dca7508c3bfc2cd444c9a790b211d29e ******/
		%feature("compactdefaultargs") IsTheSame1;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
bool

Description
-----------
Returns true if the solution of index Index and the first argument of this algorithm are the same (i.e. there are 2 identical circles). If Rarg is the radius of the first argument, Rsol is the radius of the solution and dist is the distance between the two centers, we consider the two circles to be identical if |Rarg - Rsol| and dist are less than or equal to the tolerance criterion given at the time of construction of this algorithm. NotDone is raised if the construction algorithm didn't succeed. OutOfRange is raised if Index is greater than the number of solutions.
") IsTheSame1;
		bool IsTheSame1(const int Index);

		/****** Geom2dGcc_Circ2dTanCen::NbSolutions ******/
		/****** md5 signature: 55162d50f2670468f6ab0d146e7a9b77 ******/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of circles, representing solutions computed by this algorithm. Exceptions StdFail_NotDone if the construction fails.
") NbSolutions;
		int NbSolutions();

		/****** Geom2dGcc_Circ2dTanCen::Tangency1 ******/
		/****** md5 signature: 8e976db6ec5fed2b45f5bcd201f60aaa ******/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "
Parameters
----------
Index: int
PntSol: gp_Pnt2d

Return
-------
ParSol: double
ParArg: double

Description
-----------
Returns information about the tangency point between the result number Index and the first argument. ParSol is the intrinsic parameter of the point PntSol on the solution curv. ParArg is the intrinsic parameter of the point PntSol on the argument curv. Exceptions Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.
") Tangency1;
		void Tangency1(const int Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** Geom2dGcc_Circ2dTanCen::ThisSolution ******/
		/****** md5 signature: 2e1125d1397b55b627ac75adbb37458f ******/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
gp_Circ2d

Description
-----------
Returns a circle, representing the solution of index Index computed by this algorithm. Warning This indexing simply provides a means of consulting the solutions. The index values are not associated with these solutions outside the context of the algorithm object. Exceptions Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.
") ThisSolution;
		gp_Circ2d ThisSolution(const int Index);

		/****** Geom2dGcc_Circ2dTanCen::WhichQualifier ******/
		/****** md5 signature: 4daf73703788dec976e70ecd6d32d56c ******/
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
Qualif1: GccEnt_Position

Description
-----------
Returns the qualifier Qualif1 of the tangency argument for the solution of index Index computed by this algorithm. The returned qualifier is: - that specified at the start of construction when the solutions are defined as enclosed, enclosing or outside with respect to the argument, or - that computed during construction (i.e. enclosed, enclosing or outside) when the solutions are defined as unqualified with respect to the argument. Exceptions Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.
") WhichQualifier;
		void WhichQualifier(const int Index, GccEnt_Position &OutValue);

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
		/****** Geom2dGcc_Circ2dTanCenGeo::Geom2dGcc_Circ2dTanCenGeo ******/
		/****** md5 signature: 86909382e0f64e56601db1e2fd60c447 ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2dTanCenGeo;
		%feature("autodoc", "
Parameters
----------
Qualified1: Geom2dGcc_QCurve
Pcenter: gp_Pnt2d
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles tangent to a circle and centered on a point.
") Geom2dGcc_Circ2dTanCenGeo;
		 Geom2dGcc_Circ2dTanCenGeo(const Geom2dGcc_QCurve & Qualified1, const gp_Pnt2d & Pcenter, const double Tolerance);

		/****** Geom2dGcc_Circ2dTanCenGeo::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
This method returns True if the construction algorithm succeeded.
") IsDone;
		bool IsDone();

		/****** Geom2dGcc_Circ2dTanCenGeo::NbSolutions ******/
		/****** md5 signature: 55162d50f2670468f6ab0d146e7a9b77 ******/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of solutions and raises NotDone exception if the algorithm didn't succeed. It raises NotDone if the construction algorithm didn't succeed.
") NbSolutions;
		int NbSolutions();

		/****** Geom2dGcc_Circ2dTanCenGeo::Tangency1 ******/
		/****** md5 signature: 8e976db6ec5fed2b45f5bcd201f60aaa ******/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "
Parameters
----------
Index: int
PntSol: gp_Pnt2d

Return
-------
ParSol: double
ParArg: double

Description
-----------
Returns information about the tangency point between the result number Index and the first argument. ParSol is the intrinsic parameter of the point PntSol on the solution curv. ParArg is the intrinsic parameter of the point PntArg on the argument curv. It raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions or less than zero.
") Tangency1;
		void Tangency1(const int Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** Geom2dGcc_Circ2dTanCenGeo::ThisSolution ******/
		/****** md5 signature: 2e1125d1397b55b627ac75adbb37458f ******/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
gp_Circ2d

Description
-----------
Returns the solution number Index and raises OutOfRange exception if Index is greater than the number of solutions. Be careful: the Index is only a way to get all the solutions, but is not associated to these outside the context of the algorithm-object. It raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions or less than zero.
") ThisSolution;
		gp_Circ2d ThisSolution(const int Index);

		/****** Geom2dGcc_Circ2dTanCenGeo::WhichQualifier ******/
		/****** md5 signature: 4daf73703788dec976e70ecd6d32d56c ******/
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
Qualif1: GccEnt_Position

Description
-----------
No available documentation.
") WhichQualifier;
		void WhichQualifier(const int Index, GccEnt_Position &OutValue);

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
		/****** Geom2dGcc_Circ2dTanOnRad::Geom2dGcc_Circ2dTanOnRad ******/
		/****** md5 signature: 6c9b5e51ca4f0ea9666492afeaf60817 ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2dTanOnRad;
		%feature("autodoc", "
Parameters
----------
Qualified1: Geom2dGcc_QualifiedCurve
OnCurv: Geom2dAdaptor_Curve
Radius: double
Tolerance: double

Return
-------
None

Description
-----------
Constructs one or more 2D circles of radius Radius, centered on the 2D curve OnCurv and: - tangential to the curve Qualified1.
") Geom2dGcc_Circ2dTanOnRad;
		 Geom2dGcc_Circ2dTanOnRad(const Geom2dGcc_QualifiedCurve & Qualified1, const Geom2dAdaptor_Curve & OnCurv, const double Radius, const double Tolerance);

		/****** Geom2dGcc_Circ2dTanOnRad::Geom2dGcc_Circ2dTanOnRad ******/
		/****** md5 signature: bc483b9cb9934cf1782f464ac8e2b3d9 ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2dTanOnRad;
		%feature("autodoc", "
Parameters
----------
Point1: Geom2d_Point
OnCurv: Geom2dAdaptor_Curve
Radius: double
Tolerance: double

Return
-------
None

Description
-----------
Constructs one or more 2D circles of radius Radius, centered on the 2D curve OnCurv and: passing through the point Point1. OnCurv is an adapted curve, i.e. an object which is an interface between: - the services provided by a 2D curve from the package Geom2d, - and those required on the curve by the construction algorithm. Similarly, the qualified curve Qualified1 is created from an adapted curve. Adapted curves are created in the following way: opencascade::handle<Geom2d_Curve> myCurveOn = ... ; Geom2dAdaptor_Curve OnCurv ( myCurveOn ) ; The algorithm is then constructed with this object: opencascade::handle<Geom2d_Curve> myCurve1 = ... ; Geom2dAdaptor_Curve Adapted1 ( myCurve1 ) ; Geom2dGcc_QualifiedCurve Qualified1 = Geom2dGcc::Outside(Adapted1); double Radius = ... , Tolerance = ... ; Geom2dGcc_Circ2dTanOnRad myAlgo ( Qualified1 , OnCurv , Radius , Tolerance ) ; if ( myAlgo.IsDone() ) { int Nbr = myAlgo.NbSolutions() ; gp_Circ2d Circ ; for ( int i = 1 ; i <= nbr ; i++ ) { Circ = myAlgo.ThisSolution (i) ; ... } }.
") Geom2dGcc_Circ2dTanOnRad;
		 Geom2dGcc_Circ2dTanOnRad(const opencascade::handle<Geom2d_Point> & Point1, const Geom2dAdaptor_Curve & OnCurv, const double Radius, const double Tolerance);

		/****** Geom2dGcc_Circ2dTanOnRad::CenterOn3 ******/
		/****** md5 signature: 0cf0897b69e4f36e74d8300f02fce1f6 ******/
		%feature("compactdefaultargs") CenterOn3;
		%feature("autodoc", "
Parameters
----------
Index: int
PntSol: gp_Pnt2d

Return
-------
ParArg: double

Description
-----------
Returns the center PntSol on the second argument (i.e. line or circle) of the solution of index Index computed by this algorithm. ParArg is the intrinsic parameter of the point on the argument curv. PntSol is the center point of the solution curv. PntArg is the projection of PntSol on the argument curv. Exceptions: Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.
") CenterOn3;
		void CenterOn3(const int Index, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** Geom2dGcc_Circ2dTanOnRad::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the construction algorithm does not fail (even if it finds no solution). Note: IsDone protects against a failure arising from a more internal intersection algorithm which has reached its numeric limits.
") IsDone;
		bool IsDone();

		/****** Geom2dGcc_Circ2dTanOnRad::IsTheSame1 ******/
		/****** md5 signature: dca7508c3bfc2cd444c9a790b211d29e ******/
		%feature("compactdefaultargs") IsTheSame1;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
bool

Description
-----------
Returns true if the solution of index Index and the first argument of this algorithm are the same (i.e. there are 2 identical circles). If Rarg is the radius of the first argument, Rsol is the radius of the solution and dist is the distance between the two centers, we consider the two circles to be identical if |Rarg - Rsol| and dist are less than or equal to the tolerance criterion given at the time of construction of this algorithm. OutOfRange is raised if Index is greater than the number of solutions. notDone is raised if the construction algorithm did not succeed.
") IsTheSame1;
		bool IsTheSame1(const int Index);

		/****** Geom2dGcc_Circ2dTanOnRad::NbSolutions ******/
		/****** md5 signature: 55162d50f2670468f6ab0d146e7a9b77 ******/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of circles, representing solutions computed by this algorithm. Exceptions: StdFail_NotDone if the construction fails.
") NbSolutions;
		int NbSolutions();

		/****** Geom2dGcc_Circ2dTanOnRad::Results ******/
		/****** md5 signature: 890524873211d792557d868c59adc1ff ******/
		%feature("compactdefaultargs") Results;
		%feature("autodoc", "
Parameters
----------
Circ: GccAna_Circ2dTanOnRad

Return
-------
None

Description
-----------
No available documentation.
") Results;
		void Results(const GccAna_Circ2dTanOnRad & Circ);

		/****** Geom2dGcc_Circ2dTanOnRad::Results ******/
		/****** md5 signature: bc3442d33cad11a7038d775212c3b5f6 ******/
		%feature("compactdefaultargs") Results;
		%feature("autodoc", "
Parameters
----------
Circ: Geom2dGcc_Circ2dTanOnRadGeo

Return
-------
None

Description
-----------
No available documentation.
") Results;
		void Results(const Geom2dGcc_Circ2dTanOnRadGeo & Circ);

		/****** Geom2dGcc_Circ2dTanOnRad::Tangency1 ******/
		/****** md5 signature: 8e976db6ec5fed2b45f5bcd201f60aaa ******/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "
Parameters
----------
Index: int
PntSol: gp_Pnt2d

Return
-------
ParSol: double
ParArg: double

Description
-----------
Returns information about the tangency point between the result number Index and the first argument. ParSol is the intrinsic parameter of the point on the solution curv. ParArg is the intrinsic parameter of the point on the argument curv. PntSol is the tangency point on the solution curv. PntArg is the tangency point on the argument curv. Exceptions Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.
") Tangency1;
		void Tangency1(const int Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** Geom2dGcc_Circ2dTanOnRad::ThisSolution ******/
		/****** md5 signature: 2e1125d1397b55b627ac75adbb37458f ******/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
gp_Circ2d

Description
-----------
Returns the solution number Index and raises OutOfRange exception if Index is greater than the number of solutions. Be careful: the Index is only a way to get all the solutions, but is not associated to these outside the context of the algorithm-object. Exceptions Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.
") ThisSolution;
		gp_Circ2d ThisSolution(const int Index);

		/****** Geom2dGcc_Circ2dTanOnRad::WhichQualifier ******/
		/****** md5 signature: 4daf73703788dec976e70ecd6d32d56c ******/
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
Qualif1: GccEnt_Position

Description
-----------
Returns the qualifier Qualif1 of the tangency argument for the solution of index Index computed by this algorithm. The returned qualifier is: - that specified at the start of construction when the solutions are defined as enclosed, enclosing or outside with respect to the arguments, or - that computed during construction (i.e. enclosed, enclosing or outside) when the solutions are defined as unqualified with respect to the arguments, or - GccEnt_noqualifier if the tangency argument is a point. Exceptions Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.
") WhichQualifier;
		void WhichQualifier(const int Index, GccEnt_Position &OutValue);

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
		/****** Geom2dGcc_Circ2dTanOnRadGeo::Geom2dGcc_Circ2dTanOnRadGeo ******/
		/****** md5 signature: 4a6e7e978133f9a5fc20fdd8b53b9b52 ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2dTanOnRadGeo;
		%feature("autodoc", "
Parameters
----------
Qualified1: Geom2dGcc_QCurve
OnLine: gp_Lin2d
Radius: double
Tolerance: double

Return
-------
None

Description
-----------
This methods implements the algorithms used to create 2d Circles tangent to a curve and centered on a 2d Line with a given radius. Tolerance is used to find solution in every limit cases. raises NegativeValue in case of NegativeRadius.
") Geom2dGcc_Circ2dTanOnRadGeo;
		 Geom2dGcc_Circ2dTanOnRadGeo(const Geom2dGcc_QCurve & Qualified1, const gp_Lin2d & OnLine, const double Radius, const double Tolerance);

		/****** Geom2dGcc_Circ2dTanOnRadGeo::Geom2dGcc_Circ2dTanOnRadGeo ******/
		/****** md5 signature: edc56bee675d16536c1d75491f037449 ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2dTanOnRadGeo;
		%feature("autodoc", "
Parameters
----------
Qualified1: Geom2dGcc_QCurve
OnCirc: gp_Circ2d
Radius: double
Tolerance: double

Return
-------
None

Description
-----------
This methods implements the algorithms used to create 2d Circles tangent to a curve and centered on a 2d Circle with a given radius. Tolerance is used to find solution in every limit cases. raises NegativeValue in case of NegativeRadius.
") Geom2dGcc_Circ2dTanOnRadGeo;
		 Geom2dGcc_Circ2dTanOnRadGeo(const Geom2dGcc_QCurve & Qualified1, const gp_Circ2d & OnCirc, const double Radius, const double Tolerance);

		/****** Geom2dGcc_Circ2dTanOnRadGeo::Geom2dGcc_Circ2dTanOnRadGeo ******/
		/****** md5 signature: 1ed7be322ddc552b9ae7391293e2246c ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2dTanOnRadGeo;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
OnCurv: Geom2dAdaptor_Curve
Radius: double
Tolerance: double

Return
-------
None

Description
-----------
This methods implements the algorithms used to create 2d Circles tangent to a circle and centered on a 2d curve with a given radius. Tolerance is used to find solution in every limit cases. raises NegativeValue in case of NegativeRadius.
") Geom2dGcc_Circ2dTanOnRadGeo;
		 Geom2dGcc_Circ2dTanOnRadGeo(const GccEnt_QualifiedCirc & Qualified1, const Geom2dAdaptor_Curve & OnCurv, const double Radius, const double Tolerance);

		/****** Geom2dGcc_Circ2dTanOnRadGeo::Geom2dGcc_Circ2dTanOnRadGeo ******/
		/****** md5 signature: b9e0d2b74679206e57491aef221c2ff7 ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2dTanOnRadGeo;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedLin
OnCurv: Geom2dAdaptor_Curve
Radius: double
Tolerance: double

Return
-------
None

Description
-----------
This methods implements the algorithms used to create 2d Circles tangent to a 2d Line and centered on a 2d curve with a given radius. Tolerance is used to find solution in every limit cases. raises NegativeValue in case of NegativeRadius.
") Geom2dGcc_Circ2dTanOnRadGeo;
		 Geom2dGcc_Circ2dTanOnRadGeo(const GccEnt_QualifiedLin & Qualified1, const Geom2dAdaptor_Curve & OnCurv, const double Radius, const double Tolerance);

		/****** Geom2dGcc_Circ2dTanOnRadGeo::Geom2dGcc_Circ2dTanOnRadGeo ******/
		/****** md5 signature: 0a5f93b4a42db46cb94531e4dafb3764 ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2dTanOnRadGeo;
		%feature("autodoc", "
Parameters
----------
Qualified1: Geom2dGcc_QCurve
OnCurv: Geom2dAdaptor_Curve
Radius: double
Tolerance: double

Return
-------
None

Description
-----------
This methods implements the algorithms used to create 2d Circles tangent to a 2d curve and centered on a 2d curve with a given radius. Tolerance is used to find solution in every limit cases. raises NegativeValue in case of NegativeRadius.
") Geom2dGcc_Circ2dTanOnRadGeo;
		 Geom2dGcc_Circ2dTanOnRadGeo(const Geom2dGcc_QCurve & Qualified1, const Geom2dAdaptor_Curve & OnCurv, const double Radius, const double Tolerance);

		/****** Geom2dGcc_Circ2dTanOnRadGeo::Geom2dGcc_Circ2dTanOnRadGeo ******/
		/****** md5 signature: d828e42562b6f8b229fcadef91efcf2b ******/
		%feature("compactdefaultargs") Geom2dGcc_Circ2dTanOnRadGeo;
		%feature("autodoc", "
Parameters
----------
Point1: gp_Pnt2d
OnCurv: Geom2dAdaptor_Curve
Radius: double
Tolerance: double

Return
-------
None

Description
-----------
This methods implements the algorithms used to create 2d Circles passing through a 2d point and centered on a 2d curve with a given radius. Tolerance is used to find solution in every limit cases. raises NegativeValue in case of NegativeRadius.
") Geom2dGcc_Circ2dTanOnRadGeo;
		 Geom2dGcc_Circ2dTanOnRadGeo(const gp_Pnt2d & Point1, const Geom2dAdaptor_Curve & OnCurv, const double Radius, const double Tolerance);

		/****** Geom2dGcc_Circ2dTanOnRadGeo::CenterOn3 ******/
		/****** md5 signature: 0cf0897b69e4f36e74d8300f02fce1f6 ******/
		%feature("compactdefaultargs") CenterOn3;
		%feature("autodoc", "
Parameters
----------
Index: int
PntSol: gp_Pnt2d

Return
-------
ParArg: double

Description
-----------
Returns information about the center (on the curv) of the result. ParArg is the intrinsic parameter of the point on the argument curv. PntSol is the center point of the solution curv. It raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions.
") CenterOn3;
		void CenterOn3(const int Index, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** Geom2dGcc_Circ2dTanOnRadGeo::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
This method returns True if the construction algorithm succeeded.
") IsDone;
		bool IsDone();

		/****** Geom2dGcc_Circ2dTanOnRadGeo::IsTheSame1 ******/
		/****** md5 signature: dca7508c3bfc2cd444c9a790b211d29e ******/
		%feature("compactdefaultargs") IsTheSame1;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
bool

Description
-----------
Returns True if the solution number Index is equal to the first argument and False in the other cases. It raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions.
") IsTheSame1;
		bool IsTheSame1(const int Index);

		/****** Geom2dGcc_Circ2dTanOnRadGeo::NbSolutions ******/
		/****** md5 signature: 55162d50f2670468f6ab0d146e7a9b77 ******/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Return
-------
int

Description
-----------
This method returns the number of solutions. It raises NotDone if the construction algorithm didn't succeed.
") NbSolutions;
		int NbSolutions();

		/****** Geom2dGcc_Circ2dTanOnRadGeo::Tangency1 ******/
		/****** md5 signature: 8e976db6ec5fed2b45f5bcd201f60aaa ******/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "
Parameters
----------
Index: int
PntSol: gp_Pnt2d

Return
-------
ParSol: double
ParArg: double

Description
-----------
Returns information about the tangency point between the result number Index and the first argument. ParSol is the intrinsic parameter of the point on the solution curv. ParArg is the intrinsic parameter of the point on the argument curv. PntSol is the tangency point on the solution curv. PntArg is the tangency point on the argument curv. It raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions.
") Tangency1;
		void Tangency1(const int Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** Geom2dGcc_Circ2dTanOnRadGeo::ThisSolution ******/
		/****** md5 signature: 2e1125d1397b55b627ac75adbb37458f ******/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
gp_Circ2d

Description
-----------
Returns the solution number Index and raises OutOfRange exception if Index is greater than the number of solutions. Be careful: the Index is only a way to get all the solutions, but is not associated to these outside the context of the algorithm-object. It raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions.
") ThisSolution;
		gp_Circ2d ThisSolution(const int Index);

		/****** Geom2dGcc_Circ2dTanOnRadGeo::WhichQualifier ******/
		/****** md5 signature: 4daf73703788dec976e70ecd6d32d56c ******/
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
Qualif1: GccEnt_Position

Description
-----------
No available documentation.
") WhichQualifier;
		void WhichQualifier(const int Index, GccEnt_Position &OutValue);

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
		/****** Geom2dGcc_CurveTool::D1 ******/
		/****** md5 signature: 07d04905a93e59abfdfd89322087cc54 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
C: Geom2dAdaptor_Curve
U: double
P: gp_Pnt2d
T: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") D1;
		static void D1(const Geom2dAdaptor_Curve & C, const double U, gp_Pnt2d & P, gp_Vec2d & T);

		/****** Geom2dGcc_CurveTool::D2 ******/
		/****** md5 signature: 90e0e6f09624aca6ffdce7a9f5e5eb8e ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
C: Geom2dAdaptor_Curve
U: double
P: gp_Pnt2d
T: gp_Vec2d
N: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") D2;
		static void D2(const Geom2dAdaptor_Curve & C, const double U, gp_Pnt2d & P, gp_Vec2d & T, gp_Vec2d & N);

		/****** Geom2dGcc_CurveTool::D3 ******/
		/****** md5 signature: dcc8bbc06de751c5c4f6124a8d6be272 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
C: Geom2dAdaptor_Curve
U: double
P: gp_Pnt2d
T: gp_Vec2d
N: gp_Vec2d
dN: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") D3;
		static void D3(const Geom2dAdaptor_Curve & C, const double U, gp_Pnt2d & P, gp_Vec2d & T, gp_Vec2d & N, gp_Vec2d & dN);

		/****** Geom2dGcc_CurveTool::EpsX ******/
		/****** md5 signature: 87db7988a7b21f86b71d54790ec2b1bd ******/
		%feature("compactdefaultargs") EpsX;
		%feature("autodoc", "
Parameters
----------
C: Geom2dAdaptor_Curve
Tol: double

Return
-------
double

Description
-----------
No available documentation.
") EpsX;
		static double EpsX(const Geom2dAdaptor_Curve & C, const double Tol);

		/****** Geom2dGcc_CurveTool::FirstParameter ******/
		/****** md5 signature: 4c9292eedebfbc6db91b052f73067ee6 ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "
Parameters
----------
C: Geom2dAdaptor_Curve

Return
-------
double

Description
-----------
No available documentation.
") FirstParameter;
		static double FirstParameter(const Geom2dAdaptor_Curve & C);

		/****** Geom2dGcc_CurveTool::LastParameter ******/
		/****** md5 signature: c85eabf3443190819d744d785954a890 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "
Parameters
----------
C: Geom2dAdaptor_Curve

Return
-------
double

Description
-----------
No available documentation.
") LastParameter;
		static double LastParameter(const Geom2dAdaptor_Curve & C);

		/****** Geom2dGcc_CurveTool::NbSamples ******/
		/****** md5 signature: e0f140bd66f386599d7de65331fb9561 ******/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "
Parameters
----------
C: Geom2dAdaptor_Curve

Return
-------
int

Description
-----------
No available documentation.
") NbSamples;
		static int NbSamples(const Geom2dAdaptor_Curve & C);

		/****** Geom2dGcc_CurveTool::Value ******/
		/****** md5 signature: 8d7ca83cb197def4a4f2ddc2c0fbeb1c ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
C: Geom2dAdaptor_Curve
X: double

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") Value;
		static gp_Pnt2d Value(const Geom2dAdaptor_Curve & C, const double X);

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
		/****** Geom2dGcc_FunctionTanCirCu::Geom2dGcc_FunctionTanCirCu ******/
		/****** md5 signature: 5c0aba48421ba0f4836a0867c7b36eac ******/
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanCirCu;
		%feature("autodoc", "
Parameters
----------
Circ: gp_Circ2d
Curv: Geom2dAdaptor_Curve

Return
-------
None

Description
-----------
No available documentation.
") Geom2dGcc_FunctionTanCirCu;
		 Geom2dGcc_FunctionTanCirCu(const gp_Circ2d & Circ, const Geom2dAdaptor_Curve & Curv);

		/****** Geom2dGcc_FunctionTanCirCu::Derivative ******/
		/****** md5 signature: 3ced726b6ba5a8abfc4b40fcf5dd3e60 ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
Deriv: double

Description
-----------
Computes the derivative of the function F for the variable X. It returns True if the computation is successfully done, False otherwise.
") Derivative;
		bool Derivative(const double X, Standard_Real &OutValue);

		/****** Geom2dGcc_FunctionTanCirCu::Value ******/
		/****** md5 signature: 2fdd0f48acb4882f76bbbe432a18ac3a ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
F: double

Description
-----------
Computes the value of the function F for the variable X. It returns True if the computation is successfully done, False otherwise.
") Value;
		bool Value(const double X, Standard_Real &OutValue);

		/****** Geom2dGcc_FunctionTanCirCu::Values ******/
		/****** md5 signature: 60005c82ef3dbf812b335b2b66003602 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
F: double
Deriv: double

Description
-----------
Computes the value and the derivative of the function F for the variable X. It returns True if the computation is successfully done, False otherwise.
") Values;
		bool Values(const double X, Standard_Real &OutValue, Standard_Real &OutValue);

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
		/****** Geom2dGcc_FunctionTanCuCu::Geom2dGcc_FunctionTanCuCu ******/
		/****** md5 signature: c42c8339b42c6552694bdd2e914f375c ******/
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanCuCu;
		%feature("autodoc", "
Parameters
----------
Curv1: Geom2dAdaptor_Curve
Curv2: Geom2dAdaptor_Curve

Return
-------
None

Description
-----------
No available documentation.
") Geom2dGcc_FunctionTanCuCu;
		 Geom2dGcc_FunctionTanCuCu(const Geom2dAdaptor_Curve & Curv1, const Geom2dAdaptor_Curve & Curv2);

		/****** Geom2dGcc_FunctionTanCuCu::Geom2dGcc_FunctionTanCuCu ******/
		/****** md5 signature: 6d23800dda88ef6c40cea7f9f773714c ******/
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanCuCu;
		%feature("autodoc", "
Parameters
----------
Circ1: gp_Circ2d
Curv2: Geom2dAdaptor_Curve

Return
-------
None

Description
-----------
No available documentation.
") Geom2dGcc_FunctionTanCuCu;
		 Geom2dGcc_FunctionTanCuCu(const gp_Circ2d & Circ1, const Geom2dAdaptor_Curve & Curv2);

		/****** Geom2dGcc_FunctionTanCuCu::Derivatives ******/
		/****** md5 signature: 04bdec1eb73d46b11063091d9d6985a0 ******/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
Deriv: math_Matrix

Return
-------
bool

Description
-----------
Computes the derivative of the function F for the variable X. It returns True if the computation is successfully done, False otherwise.
") Derivatives;
		bool Derivatives(const math_Vector & X, math_Matrix & Deriv);

		/****** Geom2dGcc_FunctionTanCuCu::InitDerivative ******/
		/****** md5 signature: 4c20295da771c18d914870533a948899 ******/
		%feature("compactdefaultargs") InitDerivative;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
Point1: gp_Pnt2d
Point2: gp_Pnt2d
Tan1: gp_Vec2d
Tan2: gp_Vec2d
D21: gp_Vec2d
D22: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") InitDerivative;
		void InitDerivative(const math_Vector & X, gp_Pnt2d & Point1, gp_Pnt2d & Point2, gp_Vec2d & Tan1, gp_Vec2d & Tan2, gp_Vec2d & D21, gp_Vec2d & D22);

		/****** Geom2dGcc_FunctionTanCuCu::NbEquations ******/
		/****** md5 signature: d96db90f938251af5669711b5ae9a95b ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of equations of the function.
") NbEquations;
		int NbEquations();

		/****** Geom2dGcc_FunctionTanCuCu::NbVariables ******/
		/****** md5 signature: ac9e90c594b52fb2529a5f6212b74800 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of variables of the function.
") NbVariables;
		int NbVariables();

		/****** Geom2dGcc_FunctionTanCuCu::Value ******/
		/****** md5 signature: 0c7370340ec5630e535d5a2268027fba ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector

Return
-------
bool

Description
-----------
Computes the value of the function F for the variable X. It returns True if the computation is successfully done, False otherwise.
") Value;
		bool Value(const math_Vector & X, math_Vector & F);

		/****** Geom2dGcc_FunctionTanCuCu::Values ******/
		/****** md5 signature: 27411a829e376e8fc4704c37417e6845 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector
Deriv: math_Matrix

Return
-------
bool

Description
-----------
Computes the value and the derivative of the function F for the variable X. It returns True if the computation is successfully done, False otherwise.
") Values;
		bool Values(const math_Vector & X, math_Vector & F, math_Matrix & Deriv);

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
		/****** Geom2dGcc_FunctionTanCuCuOnCu::Geom2dGcc_FunctionTanCuCuOnCu ******/
		/****** md5 signature: 689104dcc2996d3c6d69467e2c6d2d2e ******/
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanCuCuOnCu;
		%feature("autodoc", "
Parameters
----------
C1: Geom2dAdaptor_Curve
C2: Geom2dAdaptor_Curve
OnCi: gp_Circ2d
Rad: double

Return
-------
None

Description
-----------
No available documentation.
") Geom2dGcc_FunctionTanCuCuOnCu;
		 Geom2dGcc_FunctionTanCuCuOnCu(const Geom2dAdaptor_Curve & C1, const Geom2dAdaptor_Curve & C2, const gp_Circ2d & OnCi, const double Rad);

		/****** Geom2dGcc_FunctionTanCuCuOnCu::Geom2dGcc_FunctionTanCuCuOnCu ******/
		/****** md5 signature: 5721c11ad159a4b517706aa6a54fc24e ******/
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanCuCuOnCu;
		%feature("autodoc", "
Parameters
----------
C1: gp_Circ2d
C2: Geom2dAdaptor_Curve
OnCi: gp_Circ2d
Rad: double

Return
-------
None

Description
-----------
No available documentation.
") Geom2dGcc_FunctionTanCuCuOnCu;
		 Geom2dGcc_FunctionTanCuCuOnCu(const gp_Circ2d & C1, const Geom2dAdaptor_Curve & C2, const gp_Circ2d & OnCi, const double Rad);

		/****** Geom2dGcc_FunctionTanCuCuOnCu::Geom2dGcc_FunctionTanCuCuOnCu ******/
		/****** md5 signature: 8a463200ef9f676e17ed4dc974ebaa0e ******/
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanCuCuOnCu;
		%feature("autodoc", "
Parameters
----------
L1: gp_Lin2d
C2: Geom2dAdaptor_Curve
OnCi: gp_Circ2d
Rad: double

Return
-------
None

Description
-----------
No available documentation.
") Geom2dGcc_FunctionTanCuCuOnCu;
		 Geom2dGcc_FunctionTanCuCuOnCu(const gp_Lin2d & L1, const Geom2dAdaptor_Curve & C2, const gp_Circ2d & OnCi, const double Rad);

		/****** Geom2dGcc_FunctionTanCuCuOnCu::Geom2dGcc_FunctionTanCuCuOnCu ******/
		/****** md5 signature: 25b7d2ab544e14b44b66689b200599ea ******/
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanCuCuOnCu;
		%feature("autodoc", "
Parameters
----------
C1: Geom2dAdaptor_Curve
P2: gp_Pnt2d
OnCi: gp_Circ2d
Rad: double

Return
-------
None

Description
-----------
No available documentation.
") Geom2dGcc_FunctionTanCuCuOnCu;
		 Geom2dGcc_FunctionTanCuCuOnCu(const Geom2dAdaptor_Curve & C1, const gp_Pnt2d & P2, const gp_Circ2d & OnCi, const double Rad);

		/****** Geom2dGcc_FunctionTanCuCuOnCu::Geom2dGcc_FunctionTanCuCuOnCu ******/
		/****** md5 signature: 14a9134361dd71021c2c450b3c8b475a ******/
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanCuCuOnCu;
		%feature("autodoc", "
Parameters
----------
C1: Geom2dAdaptor_Curve
C2: Geom2dAdaptor_Curve
OnLi: gp_Lin2d
Rad: double

Return
-------
None

Description
-----------
No available documentation.
") Geom2dGcc_FunctionTanCuCuOnCu;
		 Geom2dGcc_FunctionTanCuCuOnCu(const Geom2dAdaptor_Curve & C1, const Geom2dAdaptor_Curve & C2, const gp_Lin2d & OnLi, const double Rad);

		/****** Geom2dGcc_FunctionTanCuCuOnCu::Geom2dGcc_FunctionTanCuCuOnCu ******/
		/****** md5 signature: b0d87cfb5e0ad81cc2ca3f472e349337 ******/
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanCuCuOnCu;
		%feature("autodoc", "
Parameters
----------
C1: gp_Circ2d
C2: Geom2dAdaptor_Curve
OnLi: gp_Lin2d
Rad: double

Return
-------
None

Description
-----------
No available documentation.
") Geom2dGcc_FunctionTanCuCuOnCu;
		 Geom2dGcc_FunctionTanCuCuOnCu(const gp_Circ2d & C1, const Geom2dAdaptor_Curve & C2, const gp_Lin2d & OnLi, const double Rad);

		/****** Geom2dGcc_FunctionTanCuCuOnCu::Geom2dGcc_FunctionTanCuCuOnCu ******/
		/****** md5 signature: d372134d6221b104e8702bcabc0f289d ******/
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanCuCuOnCu;
		%feature("autodoc", "
Parameters
----------
L1: gp_Lin2d
C2: Geom2dAdaptor_Curve
OnLi: gp_Lin2d
Rad: double

Return
-------
None

Description
-----------
No available documentation.
") Geom2dGcc_FunctionTanCuCuOnCu;
		 Geom2dGcc_FunctionTanCuCuOnCu(const gp_Lin2d & L1, const Geom2dAdaptor_Curve & C2, const gp_Lin2d & OnLi, const double Rad);

		/****** Geom2dGcc_FunctionTanCuCuOnCu::Geom2dGcc_FunctionTanCuCuOnCu ******/
		/****** md5 signature: 748641afdb013609f29f296293a997f2 ******/
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanCuCuOnCu;
		%feature("autodoc", "
Parameters
----------
C1: Geom2dAdaptor_Curve
P2: gp_Pnt2d
OnLi: gp_Lin2d
Rad: double

Return
-------
None

Description
-----------
No available documentation.
") Geom2dGcc_FunctionTanCuCuOnCu;
		 Geom2dGcc_FunctionTanCuCuOnCu(const Geom2dAdaptor_Curve & C1, const gp_Pnt2d & P2, const gp_Lin2d & OnLi, const double Rad);

		/****** Geom2dGcc_FunctionTanCuCuOnCu::Geom2dGcc_FunctionTanCuCuOnCu ******/
		/****** md5 signature: 30bb8f28523a26775e0711c2e94a3526 ******/
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanCuCuOnCu;
		%feature("autodoc", "
Parameters
----------
C1: Geom2dAdaptor_Curve
C2: Geom2dAdaptor_Curve
OnCu: Geom2dAdaptor_Curve
Rad: double

Return
-------
None

Description
-----------
No available documentation.
") Geom2dGcc_FunctionTanCuCuOnCu;
		 Geom2dGcc_FunctionTanCuCuOnCu(const Geom2dAdaptor_Curve & C1, const Geom2dAdaptor_Curve & C2, const Geom2dAdaptor_Curve & OnCu, const double Rad);

		/****** Geom2dGcc_FunctionTanCuCuOnCu::Geom2dGcc_FunctionTanCuCuOnCu ******/
		/****** md5 signature: a9f20747f3bf95448d83981cbce5a321 ******/
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanCuCuOnCu;
		%feature("autodoc", "
Parameters
----------
C1: gp_Circ2d
C2: Geom2dAdaptor_Curve
OnCu: Geom2dAdaptor_Curve
Rad: double

Return
-------
None

Description
-----------
No available documentation.
") Geom2dGcc_FunctionTanCuCuOnCu;
		 Geom2dGcc_FunctionTanCuCuOnCu(const gp_Circ2d & C1, const Geom2dAdaptor_Curve & C2, const Geom2dAdaptor_Curve & OnCu, const double Rad);

		/****** Geom2dGcc_FunctionTanCuCuOnCu::Geom2dGcc_FunctionTanCuCuOnCu ******/
		/****** md5 signature: 3a5d82a25f8ed57615af79ecba692a1d ******/
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanCuCuOnCu;
		%feature("autodoc", "
Parameters
----------
L1: gp_Lin2d
C2: Geom2dAdaptor_Curve
OnCu: Geom2dAdaptor_Curve
Rad: double

Return
-------
None

Description
-----------
No available documentation.
") Geom2dGcc_FunctionTanCuCuOnCu;
		 Geom2dGcc_FunctionTanCuCuOnCu(const gp_Lin2d & L1, const Geom2dAdaptor_Curve & C2, const Geom2dAdaptor_Curve & OnCu, const double Rad);

		/****** Geom2dGcc_FunctionTanCuCuOnCu::Geom2dGcc_FunctionTanCuCuOnCu ******/
		/****** md5 signature: 6ccc987d67a686fc987b2d07e09fdc9b ******/
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanCuCuOnCu;
		%feature("autodoc", "
Parameters
----------
C1: Geom2dAdaptor_Curve
P1: gp_Pnt2d
OnCu: Geom2dAdaptor_Curve
Rad: double

Return
-------
None

Description
-----------
No available documentation.
") Geom2dGcc_FunctionTanCuCuOnCu;
		 Geom2dGcc_FunctionTanCuCuOnCu(const Geom2dAdaptor_Curve & C1, const gp_Pnt2d & P1, const Geom2dAdaptor_Curve & OnCu, const double Rad);

		/****** Geom2dGcc_FunctionTanCuCuOnCu::Derivatives ******/
		/****** md5 signature: 00f7bf70701f1cd8a54c33dd76de6f69 ******/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
Returns the values of the derivatives for the variable <X>.
") Derivatives;
		bool Derivatives(const math_Vector & X, math_Matrix & D);

		/****** Geom2dGcc_FunctionTanCuCuOnCu::InitDerivative ******/
		/****** md5 signature: d69fa65d151215dd6a3ffff4621024e4 ******/
		%feature("compactdefaultargs") InitDerivative;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
No available documentation.
") InitDerivative;
		void InitDerivative(const math_Vector & X, gp_Pnt2d & Point1, gp_Pnt2d & Point2, gp_Pnt2d & Point3, gp_Vec2d & Tan1, gp_Vec2d & Tan2, gp_Vec2d & Tan3, gp_Vec2d & D21, gp_Vec2d & D22, gp_Vec2d & D23);

		/****** Geom2dGcc_FunctionTanCuCuOnCu::NbEquations ******/
		/****** md5 signature: d96db90f938251af5669711b5ae9a95b ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of equations of the function.
") NbEquations;
		int NbEquations();

		/****** Geom2dGcc_FunctionTanCuCuOnCu::NbVariables ******/
		/****** md5 signature: ac9e90c594b52fb2529a5f6212b74800 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of variables of the function.
") NbVariables;
		int NbVariables();

		/****** Geom2dGcc_FunctionTanCuCuOnCu::Value ******/
		/****** md5 signature: 0c7370340ec5630e535d5a2268027fba ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector

Return
-------
bool

Description
-----------
Computes the values of the Functions for the variable <X>.
") Value;
		bool Value(const math_Vector & X, math_Vector & F);

		/****** Geom2dGcc_FunctionTanCuCuOnCu::Values ******/
		/****** md5 signature: 4b9240a0e5cabe81bc6533f7aaa2df5f ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
Returns the values of the functions and the derivatives for the variable <X>.
") Values;
		bool Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

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
		/****** Geom2dGcc_FunctionTanCuPnt::Geom2dGcc_FunctionTanCuPnt ******/
		/****** md5 signature: ed3e362dadf4d71fb5f19f298e3917d5 ******/
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanCuPnt;
		%feature("autodoc", "
Parameters
----------
C: Geom2dAdaptor_Curve
Point: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") Geom2dGcc_FunctionTanCuPnt;
		 Geom2dGcc_FunctionTanCuPnt(const Geom2dAdaptor_Curve & C, const gp_Pnt2d & Point);

		/****** Geom2dGcc_FunctionTanCuPnt::Derivative ******/
		/****** md5 signature: 3ced726b6ba5a8abfc4b40fcf5dd3e60 ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
Deriv: double

Description
-----------
Computes the derivative of the function F for the variable X. It returns True if the computation is successfully done, False otherwise.
") Derivative;
		bool Derivative(const double X, Standard_Real &OutValue);

		/****** Geom2dGcc_FunctionTanCuPnt::Value ******/
		/****** md5 signature: 2fdd0f48acb4882f76bbbe432a18ac3a ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
F: double

Description
-----------
Computes the value of the function F for the variable X. It returns True if the computation is successfully done, False otherwise.
") Value;
		bool Value(const double X, Standard_Real &OutValue);

		/****** Geom2dGcc_FunctionTanCuPnt::Values ******/
		/****** md5 signature: 60005c82ef3dbf812b335b2b66003602 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
F: double
Deriv: double

Description
-----------
Computes the value and the derivative of the function F for the variable X. It returns True if the computation is successfully done, False otherwise.
") Values;
		bool Values(const double X, Standard_Real &OutValue, Standard_Real &OutValue);

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
		/****** Geom2dGcc_FunctionTanObl::Geom2dGcc_FunctionTanObl ******/
		/****** md5 signature: 27f748481302cb458bd68385e81c5f57 ******/
		%feature("compactdefaultargs") Geom2dGcc_FunctionTanObl;
		%feature("autodoc", "
Parameters
----------
Curve: Geom2dAdaptor_Curve
Dir: gp_Dir2d

Return
-------
None

Description
-----------
No available documentation.
") Geom2dGcc_FunctionTanObl;
		 Geom2dGcc_FunctionTanObl(const Geom2dAdaptor_Curve & Curve, const gp_Dir2d & Dir);

		/****** Geom2dGcc_FunctionTanObl::Derivative ******/
		/****** md5 signature: 3ced726b6ba5a8abfc4b40fcf5dd3e60 ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
Deriv: double

Description
-----------
Computes the derivative of the function F for the variable X. It returns True if the computation is successfully done, False otherwise.
") Derivative;
		bool Derivative(const double X, Standard_Real &OutValue);

		/****** Geom2dGcc_FunctionTanObl::Value ******/
		/****** md5 signature: 2fdd0f48acb4882f76bbbe432a18ac3a ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
F: double

Description
-----------
Computes the value of the function F for the variable X. It returns True if the computation is successfully done, False otherwise.
") Value;
		bool Value(const double X, Standard_Real &OutValue);

		/****** Geom2dGcc_FunctionTanObl::Values ******/
		/****** md5 signature: 60005c82ef3dbf812b335b2b66003602 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
F: double
Deriv: double

Description
-----------
Computes the value and the derivative of the function F for the variable X. It returns True if the computation is successfully done, False otherwise.
") Values;
		bool Values(const double X, Standard_Real &OutValue, Standard_Real &OutValue);

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
		/****** Geom2dGcc_Lin2d2Tan::Geom2dGcc_Lin2d2Tan ******/
		/****** md5 signature: d2a913018ab0345332c9da546da1620d ******/
		%feature("compactdefaultargs") Geom2dGcc_Lin2d2Tan;
		%feature("autodoc", "
Parameters
----------
Qualified1: Geom2dGcc_QualifiedCurve
Qualified2: Geom2dGcc_QualifiedCurve
Tolang: double

Return
-------
None

Description
-----------
This class implements the algorithms used to create 2d line tangent to two curves. Tolang is used to determine the tolerance for the tangency points.
") Geom2dGcc_Lin2d2Tan;
		 Geom2dGcc_Lin2d2Tan(const Geom2dGcc_QualifiedCurve & Qualified1, const Geom2dGcc_QualifiedCurve & Qualified2, const double Tolang);

		/****** Geom2dGcc_Lin2d2Tan::Geom2dGcc_Lin2d2Tan ******/
		/****** md5 signature: a755b72ad6e687415729392797900bbf ******/
		%feature("compactdefaultargs") Geom2dGcc_Lin2d2Tan;
		%feature("autodoc", "
Parameters
----------
Qualified1: Geom2dGcc_QualifiedCurve
ThePoint: gp_Pnt2d
Tolang: double

Return
-------
None

Description
-----------
This class implements the algorithms used to create 2d lines passing through a point and tangent to a curve. Tolang is used to determine the tolerance for the tangency points.
") Geom2dGcc_Lin2d2Tan;
		 Geom2dGcc_Lin2d2Tan(const Geom2dGcc_QualifiedCurve & Qualified1, const gp_Pnt2d & ThePoint, const double Tolang);

		/****** Geom2dGcc_Lin2d2Tan::Geom2dGcc_Lin2d2Tan ******/
		/****** md5 signature: ea7073f0e8431ff4fbdc468680552ca3 ******/
		%feature("compactdefaultargs") Geom2dGcc_Lin2d2Tan;
		%feature("autodoc", "
Parameters
----------
Qualified1: Geom2dGcc_QualifiedCurve
Qualified2: Geom2dGcc_QualifiedCurve
Tolang: double
Param1: double
Param2: double

Return
-------
None

Description
-----------
This class implements the algorithms used to create 2d line tangent to two curves. Tolang is used to determine the tolerance for the tangency points. Param1 is used for the initial guess on the first curve. Param2 is used for the initial guess on the second curve.
") Geom2dGcc_Lin2d2Tan;
		 Geom2dGcc_Lin2d2Tan(const Geom2dGcc_QualifiedCurve & Qualified1, const Geom2dGcc_QualifiedCurve & Qualified2, const double Tolang, const double Param1, const double Param2);

		/****** Geom2dGcc_Lin2d2Tan::Geom2dGcc_Lin2d2Tan ******/
		/****** md5 signature: b5345d5cb362ec54fe400da47f0e254b ******/
		%feature("compactdefaultargs") Geom2dGcc_Lin2d2Tan;
		%feature("autodoc", "
Parameters
----------
Qualified1: Geom2dGcc_QualifiedCurve
ThePoint: gp_Pnt2d
Tolang: double
Param1: double

Return
-------
None

Description
-----------
This class implements the algorithms used to create 2d lines passing through a point and tangent to a curve. Tolang is used to determine the tolerance for the tangency points. Param2 is used for the initial guess on the curve.
") Geom2dGcc_Lin2d2Tan;
		 Geom2dGcc_Lin2d2Tan(const Geom2dGcc_QualifiedCurve & Qualified1, const gp_Pnt2d & ThePoint, const double Tolang, const double Param1);

		/****** Geom2dGcc_Lin2d2Tan::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the construction algorithm does not fail (even if it finds no solution). Note: IsDone protects against a failure arising from a more internal intersection algorithm, which has reached its numeric limits.
") IsDone;
		bool IsDone();

		/****** Geom2dGcc_Lin2d2Tan::NbSolutions ******/
		/****** md5 signature: 55162d50f2670468f6ab0d146e7a9b77 ******/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of lines, representing solutions computed by this algorithm. Exceptions StdFail_NotDone if the construction fails.R.
") NbSolutions;
		int NbSolutions();

		/****** Geom2dGcc_Lin2d2Tan::Tangency1 ******/
		/****** md5 signature: 8e976db6ec5fed2b45f5bcd201f60aaa ******/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "
Parameters
----------
Index: int
PntSol: gp_Pnt2d

Return
-------
ParSol: double
ParArg: double

Description
-----------
Returns information about the tangency point between the result and the first argument. ParSol is the intrinsic parameter of the point PntSol on the solution curv. ParArg is the intrinsic parameter of the point PntSol on the argument curv. Exceptions Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.
") Tangency1;
		void Tangency1(const int Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** Geom2dGcc_Lin2d2Tan::Tangency2 ******/
		/****** md5 signature: 3f1f83dbdaea1988497a83645ade6207 ******/
		%feature("compactdefaultargs") Tangency2;
		%feature("autodoc", "
Parameters
----------
Index: int
PntSol: gp_Pnt2d

Return
-------
ParSol: double
ParArg: double

Description
-----------
Returns information about the tangency point between the result and the first argument. ParSol is the intrinsic parameter of the point PntSol on the solution curv. ParArg is the intrinsic parameter of the point PntSol on the argument curv. Exceptions Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.
") Tangency2;
		void Tangency2(const int Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** Geom2dGcc_Lin2d2Tan::ThisSolution ******/
		/****** md5 signature: e0004bbd053501e7988ff8161d2d5527 ******/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
gp_Lin2d

Description
-----------
Returns a line, representing the solution of index Index computed by this algorithm. Warning This indexing simply provides a means of consulting the solutions. The index values are not associated with these solutions outside the context of the algorithm object. Exceptions Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.
") ThisSolution;
		gp_Lin2d ThisSolution(const int Index);

		/****** Geom2dGcc_Lin2d2Tan::WhichQualifier ******/
		/****** md5 signature: af20731e994c9da3e41b1695171b3bae ******/
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
Qualif1: GccEnt_Position
Qualif2: GccEnt_Position

Description
-----------
Returns the qualifiers Qualif1 and Qualif2 of the tangency arguments for the solution of index Index computed by this algorithm. The returned qualifiers are: - those specified at the start of construction when the solutions are defined as enclosing or outside with respect to the arguments, or - those computed during construction (i.e. enclosing or outside) when the solutions are defined as unqualified with respect to the arguments, or - GccEnt_noqualifier if the tangency argument is a point. Exceptions Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.
") WhichQualifier;
		void WhichQualifier(const int Index, GccEnt_Position &OutValue, GccEnt_Position &OutValue);

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
		/****** Geom2dGcc_Lin2d2TanIter::Geom2dGcc_Lin2d2TanIter ******/
		/****** md5 signature: eaea173719b24c9387b7ecd4876ffa6e ******/
		%feature("compactdefaultargs") Geom2dGcc_Lin2d2TanIter;
		%feature("autodoc", "
Parameters
----------
Qualified1: Geom2dGcc_QCurve
ThePoint: gp_Pnt2d
Param1: double
Tolang: double

Return
-------
None

Description
-----------
This class implements the algorithms used to create 2d lines passing through a point and tangent to a curve. Tolang is used to determine the tolerance for the tangency points. Param2 is used for the initial guess on the curve.
") Geom2dGcc_Lin2d2TanIter;
		 Geom2dGcc_Lin2d2TanIter(const Geom2dGcc_QCurve & Qualified1, const gp_Pnt2d & ThePoint, const double Param1, const double Tolang);

		/****** Geom2dGcc_Lin2d2TanIter::Geom2dGcc_Lin2d2TanIter ******/
		/****** md5 signature: 8f226474d7d05a46eb92fcd467c4cfcf ******/
		%feature("compactdefaultargs") Geom2dGcc_Lin2d2TanIter;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: Geom2dGcc_QCurve
Param2: double
Tolang: double

Return
-------
None

Description
-----------
This class implements the algorithms used to create 2d line tangent to a circle and to a curve. Tolang is used to determine the tolerance for the tangency points. Param2 is used for the initial guess on the curve. Exception BadQualifier is raised in the case of EnclosedCirc.
") Geom2dGcc_Lin2d2TanIter;
		 Geom2dGcc_Lin2d2TanIter(const GccEnt_QualifiedCirc & Qualified1, const Geom2dGcc_QCurve & Qualified2, const double Param2, const double Tolang);

		/****** Geom2dGcc_Lin2d2TanIter::Geom2dGcc_Lin2d2TanIter ******/
		/****** md5 signature: 4b7e027683719f5e85f97b2ecbc72adf ******/
		%feature("compactdefaultargs") Geom2dGcc_Lin2d2TanIter;
		%feature("autodoc", "
Parameters
----------
Qualified1: Geom2dGcc_QCurve
Qualified2: Geom2dGcc_QCurve
Param1: double
Param2: double
Tolang: double

Return
-------
None

Description
-----------
This class implements the algorithms used to create 2d line tangent to two curves. Tolang is used to determine the tolerance for the tangency points. Param1 is used for the initial guess on the first curve. Param2 is used for the initial guess on the second curve.
") Geom2dGcc_Lin2d2TanIter;
		 Geom2dGcc_Lin2d2TanIter(const Geom2dGcc_QCurve & Qualified1, const Geom2dGcc_QCurve & Qualified2, const double Param1, const double Param2, const double Tolang);

		/****** Geom2dGcc_Lin2d2TanIter::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
This methode returns true when there is a solution and false in the other cases.
") IsDone;
		bool IsDone();

		/****** Geom2dGcc_Lin2d2TanIter::Tangency1 ******/
		/****** md5 signature: 0bc466d77eab1fdc5b48801bafdc49ce ******/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "
Parameters
----------
PntSol: gp_Pnt2d

Return
-------
ParSol: double
ParArg: double

Description
-----------
Returns information about the tangency point between the result and the first argument. ParSol is the intrinsic parameter of the point PntSol on the solution curv. ParArg is the intrinsic parameter of the point PntSol on the argument curv.
") Tangency1;
		void Tangency1(Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** Geom2dGcc_Lin2d2TanIter::Tangency2 ******/
		/****** md5 signature: aa83bd7c252a51c566b5423ff9226e67 ******/
		%feature("compactdefaultargs") Tangency2;
		%feature("autodoc", "
Parameters
----------
PntSol: gp_Pnt2d

Return
-------
ParSol: double
ParArg: double

Description
-----------
No available documentation.
") Tangency2;
		void Tangency2(Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** Geom2dGcc_Lin2d2TanIter::ThisSolution ******/
		/****** md5 signature: 4236a79f3dec284a3f8c2579f4fda830 ******/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "Return
-------
gp_Lin2d

Description
-----------
Returns the solution.
") ThisSolution;
		gp_Lin2d ThisSolution();

		/****** Geom2dGcc_Lin2d2TanIter::WhichQualifier ******/
		/****** md5 signature: 1ab6984ef65a32f2b20ea0a40b6d02a7 ******/
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "
Parameters
----------

Return
-------
Qualif1: GccEnt_Position
Qualif2: GccEnt_Position

Description
-----------
No available documentation.
") WhichQualifier;
		void WhichQualifier(GccEnt_Position &OutValue, GccEnt_Position &OutValue);

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
		/****** Geom2dGcc_Lin2dTanObl::Geom2dGcc_Lin2dTanObl ******/
		/****** md5 signature: 3f7bb3b03d4ed3133cff00861144724c ******/
		%feature("compactdefaultargs") Geom2dGcc_Lin2dTanObl;
		%feature("autodoc", "
Parameters
----------
Qualified1: Geom2dGcc_QualifiedCurve
TheLin: gp_Lin2d
TolAng: double
Angle: double

Return
-------
None

Description
-----------
This class implements the algorithm used to create 2d line tangent to a curve and doing an angle Angle with the line TheLin. Angle must be in Radian. Tolang is the angular tolerance.
") Geom2dGcc_Lin2dTanObl;
		 Geom2dGcc_Lin2dTanObl(const Geom2dGcc_QualifiedCurve & Qualified1, const gp_Lin2d & TheLin, const double TolAng, const double Angle);

		/****** Geom2dGcc_Lin2dTanObl::Geom2dGcc_Lin2dTanObl ******/
		/****** md5 signature: 99d956a5f6f4008f352a3e068219c082 ******/
		%feature("compactdefaultargs") Geom2dGcc_Lin2dTanObl;
		%feature("autodoc", "
Parameters
----------
Qualified1: Geom2dGcc_QualifiedCurve
TheLin: gp_Lin2d
TolAng: double
Param1: double
Angle: double

Return
-------
None

Description
-----------
This class implements the algorithm used to create 2d line tangent to a curve and doing an angle Angle with the line TheLin. Angle must be in Radian. Param2 is the initial guess on the curve QualifiedCurv. Tolang is the angular tolerance. Warning An iterative algorithm is used if Qualified1 is more complex than a line or a circle. In such cases, the algorithm constructs only one solution. Exceptions GccEnt_BadQualifier if a qualifier is inconsistent with the argument it qualifies (for example, enclosed for a circle).
") Geom2dGcc_Lin2dTanObl;
		 Geom2dGcc_Lin2dTanObl(const Geom2dGcc_QualifiedCurve & Qualified1, const gp_Lin2d & TheLin, const double TolAng, const double Param1, const double Angle);

		/****** Geom2dGcc_Lin2dTanObl::Intersection2 ******/
		/****** md5 signature: 46959593a331fbf23512924ed5322db9 ******/
		%feature("compactdefaultargs") Intersection2;
		%feature("autodoc", "
Parameters
----------
Index: int
PntSol: gp_Pnt2d

Return
-------
ParSol: double
ParArg: double

Description
-----------
Returns the point of intersection PntSol between the solution of index Index and the second argument (the line) of this algorithm. ParSol is the parameter of the point PntSol on the solution. ParArg is the parameter of the point PntSol on the second argument (the line). Exceptions StdFail_NotDone if the construction fails. Geom2dGcc_IsParallel if the solution and the second argument (the line) are parallel. Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm.
") Intersection2;
		void Intersection2(const int Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** Geom2dGcc_Lin2dTanObl::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the construction algorithm does not fail (even if it finds no solution). Note: IsDone protects against a failure arising from a more internal intersection algorithm, which has reached its numeric limits.
") IsDone;
		bool IsDone();

		/****** Geom2dGcc_Lin2dTanObl::NbSolutions ******/
		/****** md5 signature: 55162d50f2670468f6ab0d146e7a9b77 ******/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of lines, representing solutions computed by this algorithm. Exceptions StdFail_NotDone if the construction fails.
") NbSolutions;
		int NbSolutions();

		/****** Geom2dGcc_Lin2dTanObl::Tangency1 ******/
		/****** md5 signature: 8e976db6ec5fed2b45f5bcd201f60aaa ******/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "
Parameters
----------
Index: int
PntSol: gp_Pnt2d

Return
-------
ParSol: double
ParArg: double

Description
-----------
Returns information about the tangency point between the result and the first argument. ParSol is the intrinsic parameter of the point PntSol on the solution curv. ParArg is the intrinsic parameter of the point PntSol on the argument curv.
") Tangency1;
		void Tangency1(const int Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** Geom2dGcc_Lin2dTanObl::ThisSolution ******/
		/****** md5 signature: e0004bbd053501e7988ff8161d2d5527 ******/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
gp_Lin2d

Description
-----------
Returns a line, representing the solution of index Index computed by this algorithm. Exceptions Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.
") ThisSolution;
		gp_Lin2d ThisSolution(const int Index);

		/****** Geom2dGcc_Lin2dTanObl::WhichQualifier ******/
		/****** md5 signature: 4daf73703788dec976e70ecd6d32d56c ******/
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
Qualif1: GccEnt_Position

Description
-----------
Returns the qualifier Qualif1 of the tangency argument for the solution of index Index computed by this algorithm. The returned qualifier is: - that specified at the start of construction when the solutions are defined as enclosing or outside with respect to the argument, or - that computed during construction (i.e. enclosing or outside) when the solutions are defined as unqualified with respect to the argument, or - GccEnt_noqualifier if the tangency argument is a point. Exceptions Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.
") WhichQualifier;
		void WhichQualifier(const int Index, GccEnt_Position &OutValue);

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
		/****** Geom2dGcc_Lin2dTanOblIter::Geom2dGcc_Lin2dTanOblIter ******/
		/****** md5 signature: 4cf61adc92eab70885548bdf8b898fdc ******/
		%feature("compactdefaultargs") Geom2dGcc_Lin2dTanOblIter;
		%feature("autodoc", "
Parameters
----------
Qualified1: Geom2dGcc_QCurve
TheLin: gp_Lin2d
Param1: double
TolAng: double
Angle: double (optional, default to 0)

Return
-------
None

Description
-----------
This class implements the algorithm used to create 2d line tangent to a curve and doing an angle Angle with the line TheLin. Angle must be in Radian. Param2 is the initial guess on the curve QualifiedCurv. Tolang is the angular tolerance.
") Geom2dGcc_Lin2dTanOblIter;
		 Geom2dGcc_Lin2dTanOblIter(const Geom2dGcc_QCurve & Qualified1, const gp_Lin2d & TheLin, const double Param1, const double TolAng, const double Angle = 0);

		/****** Geom2dGcc_Lin2dTanOblIter::Intersection2 ******/
		/****** md5 signature: d58f374e2422b6f2200c4848e1fca5e9 ******/
		%feature("compactdefaultargs") Intersection2;
		%feature("autodoc", "
Parameters
----------
PntSol: gp_Pnt2d

Return
-------
ParSol: double
ParArg: double

Description
-----------
No available documentation.
") Intersection2;
		void Intersection2(Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** Geom2dGcc_Lin2dTanOblIter::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
This method returns true when there is a solution and false in the other cases.
") IsDone;
		bool IsDone();

		/****** Geom2dGcc_Lin2dTanOblIter::IsParallel2 ******/
		/****** md5 signature: 3b968b5633a9f97b10dc42677e238945 ******/
		%feature("compactdefaultargs") IsParallel2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsParallel2;
		bool IsParallel2();

		/****** Geom2dGcc_Lin2dTanOblIter::Tangency1 ******/
		/****** md5 signature: 0bc466d77eab1fdc5b48801bafdc49ce ******/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "
Parameters
----------
PntSol: gp_Pnt2d

Return
-------
ParSol: double
ParArg: double

Description
-----------
No available documentation.
") Tangency1;
		void Tangency1(Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** Geom2dGcc_Lin2dTanOblIter::ThisSolution ******/
		/****** md5 signature: 4236a79f3dec284a3f8c2579f4fda830 ******/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "Return
-------
gp_Lin2d

Description
-----------
No available documentation.
") ThisSolution;
		gp_Lin2d ThisSolution();

		/****** Geom2dGcc_Lin2dTanOblIter::WhichQualifier ******/
		/****** md5 signature: fc715cc6715cb1bd910aa4f96d430e1c ******/
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "
Parameters
----------

Return
-------
Qualif1: GccEnt_Position

Description
-----------
No available documentation.
") WhichQualifier;
		void WhichQualifier(GccEnt_Position &OutValue);

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
		/****** Geom2dGcc_QCurve::Geom2dGcc_QCurve ******/
		/****** md5 signature: acd4edf0c4c8ef7fbf4777ccdfd55c02 ******/
		%feature("compactdefaultargs") Geom2dGcc_QCurve;
		%feature("autodoc", "
Parameters
----------
Curve: Geom2dAdaptor_Curve
Qualifier: GccEnt_Position

Return
-------
None

Description
-----------
No available documentation.
") Geom2dGcc_QCurve;
		 Geom2dGcc_QCurve(const Geom2dAdaptor_Curve & Curve, const GccEnt_Position Qualifier);

		/****** Geom2dGcc_QCurve::IsEnclosed ******/
		/****** md5 signature: ef26e2deb15a92ace2f64c92e97787b7 ******/
		%feature("compactdefaultargs") IsEnclosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the solution is Enclosed in the Curv and false in the other cases.
") IsEnclosed;
		bool IsEnclosed();

		/****** Geom2dGcc_QCurve::IsEnclosing ******/
		/****** md5 signature: 9e4997d6c35ccbe37e40929c148852e6 ******/
		%feature("compactdefaultargs") IsEnclosing;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the solution is Enclosing the Curv and false in the other cases.
") IsEnclosing;
		bool IsEnclosing();

		/****** Geom2dGcc_QCurve::IsOutside ******/
		/****** md5 signature: f10d4830bab55e135eafa51fff8b43bc ******/
		%feature("compactdefaultargs") IsOutside;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the solution is Outside the Curv and false in the other cases.
") IsOutside;
		bool IsOutside();

		/****** Geom2dGcc_QCurve::IsUnqualified ******/
		/****** md5 signature: 64ad1926e7a83fc1d36ac5f883984b24 ******/
		%feature("compactdefaultargs") IsUnqualified;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the solution is unqualified and false in the other cases.
") IsUnqualified;
		bool IsUnqualified();

		/****** Geom2dGcc_QCurve::Qualified ******/
		/****** md5 signature: 8784ef162dda28c379f5ea9d98369724 ******/
		%feature("compactdefaultargs") Qualified;
		%feature("autodoc", "Return
-------
Geom2dAdaptor_Curve

Description
-----------
No available documentation.
") Qualified;
		Geom2dAdaptor_Curve Qualified();

		/****** Geom2dGcc_QCurve::Qualifier ******/
		/****** md5 signature: 138b4f724fb9bbc26d98eaef998d4f32 ******/
		%feature("compactdefaultargs") Qualifier;
		%feature("autodoc", "Return
-------
GccEnt_Position

Description
-----------
No available documentation.
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
		/****** Geom2dGcc_QualifiedCurve::Geom2dGcc_QualifiedCurve ******/
		/****** md5 signature: 9c08f018bdc44342428f7cb468031568 ******/
		%feature("compactdefaultargs") Geom2dGcc_QualifiedCurve;
		%feature("autodoc", "
Parameters
----------
Curve: Geom2dAdaptor_Curve
Qualifier: GccEnt_Position

Return
-------
None

Description
-----------
Constructs a qualified curve by assigning the qualifier Qualifier to the curve Curve. Qualifier may be: - GccEnt_enclosing if the solution of a construction algorithm using the qualified curve encloses the curve, or - GccEnt_enclosed if the solution is enclosed by the curve, or - GccEnt_outside if both the solution and the curve are external to one another, or - GccEnt_unqualified if all solutions apply. Note: The interior of a curve is defined as the left-hand side of the curve in relation to its orientation. Warning Curve is an adapted curve, i.e. an object which is an interface between: - the services provided by a 2D curve from the package Geom2d, - and those required on the curve by a computation algorithm. The adapted curve is created in the following way: opencascade::handle<Geom2d_Curve> mycurve = ... ; Geom2dAdaptor_Curve Curve ( mycurve ) ; The qualified curve is then constructed with this object: GccEnt_Position myQualif = GccEnt_outside ; Geom2dGcc_QualifiedCurve myQCurve ( Curve, myQualif ); is private;.
") Geom2dGcc_QualifiedCurve;
		 Geom2dGcc_QualifiedCurve(const Geom2dAdaptor_Curve & Curve, const GccEnt_Position Qualifier);

		/****** Geom2dGcc_QualifiedCurve::IsEnclosed ******/
		/****** md5 signature: ef26e2deb15a92ace2f64c92e97787b7 ******/
		%feature("compactdefaultargs") IsEnclosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
It returns true if the solution is Enclosed in the Curv and false in the other cases.
") IsEnclosed;
		bool IsEnclosed();

		/****** Geom2dGcc_QualifiedCurve::IsEnclosing ******/
		/****** md5 signature: 9e4997d6c35ccbe37e40929c148852e6 ******/
		%feature("compactdefaultargs") IsEnclosing;
		%feature("autodoc", "Return
-------
bool

Description
-----------
It returns true if the solution is Enclosing the Curv and false in the other cases.
") IsEnclosing;
		bool IsEnclosing();

		/****** Geom2dGcc_QualifiedCurve::IsOutside ******/
		/****** md5 signature: f10d4830bab55e135eafa51fff8b43bc ******/
		%feature("compactdefaultargs") IsOutside;
		%feature("autodoc", "Return
-------
bool

Description
-----------
It returns true if the solution is Outside the Curv and false in the other cases.
") IsOutside;
		bool IsOutside();

		/****** Geom2dGcc_QualifiedCurve::IsUnqualified ******/
		/****** md5 signature: 64ad1926e7a83fc1d36ac5f883984b24 ******/
		%feature("compactdefaultargs") IsUnqualified;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the solution is unqualified and false in the other cases.
") IsUnqualified;
		bool IsUnqualified();

		/****** Geom2dGcc_QualifiedCurve::Qualified ******/
		/****** md5 signature: 8784ef162dda28c379f5ea9d98369724 ******/
		%feature("compactdefaultargs") Qualified;
		%feature("autodoc", "Return
-------
Geom2dAdaptor_Curve

Description
-----------
Returns a 2D curve to which the qualifier is assigned. Warning The returned curve is an adapted curve, i.e. an object which is an interface between: - the services provided by a 2D curve from the package Geom2d, - and those required on the curve by a computation algorithm. The Geom2d curve on which the adapted curve is based can be obtained in the following way: myQualifiedCurve = ... ; Geom2dAdaptor_Curve myAdaptedCurve = myQualifiedCurve.Qualified(); opencascade::handle<Geom2d_Curve> = myAdaptedCurve.Curve();.
") Qualified;
		Geom2dAdaptor_Curve Qualified();

		/****** Geom2dGcc_QualifiedCurve::Qualifier ******/
		/****** md5 signature: 138b4f724fb9bbc26d98eaef998d4f32 ******/
		%feature("compactdefaultargs") Qualifier;
		%feature("autodoc", "Return
-------
GccEnt_Position

Description
-----------
Returns - the qualifier of this qualified curve if it is enclosing, enclosed or outside, or - GccEnt_noqualifier if it is unqualified.
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
class Geom2dGcc_FunctionTanCuCuCu:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def geom2dgcc_Enclosed(*args):
	return geom2dgcc.Enclosed(*args)

@deprecated
def geom2dgcc_Enclosing(*args):
	return geom2dgcc.Enclosing(*args)

@deprecated
def geom2dgcc_Outside(*args):
	return geom2dgcc.Outside(*args)

@deprecated
def geom2dgcc_Unqualified(*args):
	return geom2dgcc.Unqualified(*args)

@deprecated
def Geom2dGcc_CurveTool_D1(*args):
	return Geom2dGcc_CurveTool.D1(*args)

@deprecated
def Geom2dGcc_CurveTool_D2(*args):
	return Geom2dGcc_CurveTool.D2(*args)

@deprecated
def Geom2dGcc_CurveTool_D3(*args):
	return Geom2dGcc_CurveTool.D3(*args)

@deprecated
def Geom2dGcc_CurveTool_EpsX(*args):
	return Geom2dGcc_CurveTool.EpsX(*args)

@deprecated
def Geom2dGcc_CurveTool_FirstParameter(*args):
	return Geom2dGcc_CurveTool.FirstParameter(*args)

@deprecated
def Geom2dGcc_CurveTool_LastParameter(*args):
	return Geom2dGcc_CurveTool.LastParameter(*args)

@deprecated
def Geom2dGcc_CurveTool_NbSamples(*args):
	return Geom2dGcc_CurveTool.NbSamples(*args)

@deprecated
def Geom2dGcc_CurveTool_Value(*args):
	return Geom2dGcc_CurveTool.Value(*args)

}
