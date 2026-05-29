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
%define GCCANADOCSTRING
"GccAna module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_gccana.html"
%enddef
%module (package="OCC.Core", docstring=GCCANADOCSTRING) GccAna


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
#include<GccAna_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<GccEnt_module.hxx>
#include<gp_module.hxx>
#include<GccInt_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import GccEnt.i
%import gp.i
%import GccInt.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/****************************
* class GccAna_Circ2d2TanOn *
****************************/
class GccAna_Circ2d2TanOn {
	public:
		/****** GccAna_Circ2d2TanOn::GccAna_Circ2d2TanOn ******/
		/****** md5 signature: 0f53323848c584d422de9109f5ff9f60 ******/
		%feature("compactdefaultargs") GccAna_Circ2d2TanOn;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: GccEnt_QualifiedCirc
OnLine: gp_Lin2d
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to two 2d circles and having the center ON a 2d line.
") GccAna_Circ2d2TanOn;
		 GccAna_Circ2d2TanOn(const GccEnt_QualifiedCirc & Qualified1, const GccEnt_QualifiedCirc & Qualified2, const gp_Lin2d & OnLine, const double Tolerance);

		/****** GccAna_Circ2d2TanOn::GccAna_Circ2d2TanOn ******/
		/****** md5 signature: 88eed79f24dc8765e2fbfad866fa088c ******/
		%feature("compactdefaultargs") GccAna_Circ2d2TanOn;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: GccEnt_QualifiedLin
OnLine: gp_Lin2d
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to a 2d circle and a 2d line having the center ON a 2d line.
") GccAna_Circ2d2TanOn;
		 GccAna_Circ2d2TanOn(const GccEnt_QualifiedCirc & Qualified1, const GccEnt_QualifiedLin & Qualified2, const gp_Lin2d & OnLine, const double Tolerance);

		/****** GccAna_Circ2d2TanOn::GccAna_Circ2d2TanOn ******/
		/****** md5 signature: 1d5200ba3fa976848798dde24579c36a ******/
		%feature("compactdefaultargs") GccAna_Circ2d2TanOn;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedLin
Qualified2: GccEnt_QualifiedLin
OnLine: gp_Lin2d
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to two 2d lines having the center ON a 2d line.
") GccAna_Circ2d2TanOn;
		 GccAna_Circ2d2TanOn(const GccEnt_QualifiedLin & Qualified1, const GccEnt_QualifiedLin & Qualified2, const gp_Lin2d & OnLine, const double Tolerance);

		/****** GccAna_Circ2d2TanOn::GccAna_Circ2d2TanOn ******/
		/****** md5 signature: e968364e29c0a23b2eefbcdad2322d66 ******/
		%feature("compactdefaultargs") GccAna_Circ2d2TanOn;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Point2: gp_Pnt2d
OnLine: gp_Lin2d
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to a 2d circle and a point having the center ON a 2d line.
") GccAna_Circ2d2TanOn;
		 GccAna_Circ2d2TanOn(const GccEnt_QualifiedCirc & Qualified1, const gp_Pnt2d & Point2, const gp_Lin2d & OnLine, const double Tolerance);

		/****** GccAna_Circ2d2TanOn::GccAna_Circ2d2TanOn ******/
		/****** md5 signature: 9de8e3d64b73525f8bb25c84335e0e83 ******/
		%feature("compactdefaultargs") GccAna_Circ2d2TanOn;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedLin
Point2: gp_Pnt2d
OnLine: gp_Lin2d
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to a 2d line and a point having the center ON a 2d line.
") GccAna_Circ2d2TanOn;
		 GccAna_Circ2d2TanOn(const GccEnt_QualifiedLin & Qualified1, const gp_Pnt2d & Point2, const gp_Lin2d & OnLine, const double Tolerance);

		/****** GccAna_Circ2d2TanOn::GccAna_Circ2d2TanOn ******/
		/****** md5 signature: feb46e145ddc477976c27895299d148d ******/
		%feature("compactdefaultargs") GccAna_Circ2d2TanOn;
		%feature("autodoc", "
Parameters
----------
Point1: gp_Pnt2d
Point2: gp_Pnt2d
OnLine: gp_Lin2d
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to two points having the center ON a 2d line.
") GccAna_Circ2d2TanOn;
		 GccAna_Circ2d2TanOn(const gp_Pnt2d & Point1, const gp_Pnt2d & Point2, const gp_Lin2d & OnLine, const double Tolerance);

		/****** GccAna_Circ2d2TanOn::GccAna_Circ2d2TanOn ******/
		/****** md5 signature: 1e34897ed2efc127b61c20b2d9ddb733 ******/
		%feature("compactdefaultargs") GccAna_Circ2d2TanOn;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: GccEnt_QualifiedCirc
OnCirc: gp_Circ2d
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to two 2d circles and having the center ON a 2d circle.
") GccAna_Circ2d2TanOn;
		 GccAna_Circ2d2TanOn(const GccEnt_QualifiedCirc & Qualified1, const GccEnt_QualifiedCirc & Qualified2, const gp_Circ2d & OnCirc, const double Tolerance);

		/****** GccAna_Circ2d2TanOn::GccAna_Circ2d2TanOn ******/
		/****** md5 signature: 1994465009431e5d856e4b7ad468ea79 ******/
		%feature("compactdefaultargs") GccAna_Circ2d2TanOn;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: GccEnt_QualifiedLin
OnCirc: gp_Circ2d
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to a circle and a line having the center ON a 2d circle.
") GccAna_Circ2d2TanOn;
		 GccAna_Circ2d2TanOn(const GccEnt_QualifiedCirc & Qualified1, const GccEnt_QualifiedLin & Qualified2, const gp_Circ2d & OnCirc, const double Tolerance);

		/****** GccAna_Circ2d2TanOn::GccAna_Circ2d2TanOn ******/
		/****** md5 signature: 5b29a3281c191f56f1250811b5d26e6c ******/
		%feature("compactdefaultargs") GccAna_Circ2d2TanOn;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Point2: gp_Pnt2d
OnCirc: gp_Circ2d
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to a circle and a point having the center ON a 2d circle.
") GccAna_Circ2d2TanOn;
		 GccAna_Circ2d2TanOn(const GccEnt_QualifiedCirc & Qualified1, const gp_Pnt2d & Point2, const gp_Circ2d & OnCirc, const double Tolerance);

		/****** GccAna_Circ2d2TanOn::GccAna_Circ2d2TanOn ******/
		/****** md5 signature: 0cb33836dbf4a9c315935e8346ba623a ******/
		%feature("compactdefaultargs") GccAna_Circ2d2TanOn;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedLin
Qualified2: GccEnt_QualifiedLin
OnCirc: gp_Circ2d
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to two 2d lines having the center ON a 2d circle.
") GccAna_Circ2d2TanOn;
		 GccAna_Circ2d2TanOn(const GccEnt_QualifiedLin & Qualified1, const GccEnt_QualifiedLin & Qualified2, const gp_Circ2d & OnCirc, const double Tolerance);

		/****** GccAna_Circ2d2TanOn::GccAna_Circ2d2TanOn ******/
		/****** md5 signature: 636d9ff4c758cf3bcb262f90c9d2b6bd ******/
		%feature("compactdefaultargs") GccAna_Circ2d2TanOn;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedLin
Point2: gp_Pnt2d
OnCirc: gp_Circ2d
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to a line and a point having the center ON a 2d circle.
") GccAna_Circ2d2TanOn;
		 GccAna_Circ2d2TanOn(const GccEnt_QualifiedLin & Qualified1, const gp_Pnt2d & Point2, const gp_Circ2d & OnCirc, const double Tolerance);

		/****** GccAna_Circ2d2TanOn::GccAna_Circ2d2TanOn ******/
		/****** md5 signature: bab61c0167a5043c2a043ccddb54417f ******/
		%feature("compactdefaultargs") GccAna_Circ2d2TanOn;
		%feature("autodoc", "
Parameters
----------
Point1: gp_Pnt2d
Point2: gp_Pnt2d
OnCirc: gp_Circ2d
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to two points having the center ON a 2d circle.
") GccAna_Circ2d2TanOn;
		 GccAna_Circ2d2TanOn(const gp_Pnt2d & Point1, const gp_Pnt2d & Point2, const gp_Circ2d & OnCirc, const double Tolerance);

		/****** GccAna_Circ2d2TanOn::CenterOn3 ******/
		/****** md5 signature: 2cf5a74a69f11591c9f11aad7461c0ea ******/
		%feature("compactdefaultargs") CenterOn3;
		%feature("autodoc", "
Parameters
----------
Index: int
PntArg: gp_Pnt2d

Return
-------
ParArg: double

Description
-----------
Returns the information about the center (on the curv) of the result number Index and the third argument. ParArg is the intrinsic parameter of the point PntArg on the third argument. Exceptions Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.
") CenterOn3;
		void CenterOn3(const int Index, Standard_Real &OutValue, gp_Pnt2d & PntArg);

		/****** GccAna_Circ2d2TanOn::IsDone ******/
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

		/****** GccAna_Circ2d2TanOn::IsTheSame1 ******/
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
True if the solution and the first argument are the same (2 circles). If R1 is the radius of the first argument and Rsol the radius of the solution and dist the distance between the two centers, we consider the two circles are identical if R1+dist-Rsol is less than Tolerance. False in the other cases. Raises OutOfRange if Index is greater than the number of solutions and NotDone if IsDone returns false.
") IsTheSame1;
		bool IsTheSame1(const int Index);

		/****** GccAna_Circ2d2TanOn::IsTheSame2 ******/
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
True if the solution and the second argument are the same (2 circles). If R2 is the radius of the second argument and Rsol the radius of the solution and dist the distance between the two centers, we consider the two circles are identical if R2+dist-Rsol is less than Tolerance. False in the other cases. Raises OutOfRange if Index is greater than the number of solutions and NotDone if IsDone returns false.
") IsTheSame2;
		bool IsTheSame2(const int Index);

		/****** GccAna_Circ2d2TanOn::NbSolutions ******/
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

		/****** GccAna_Circ2d2TanOn::Tangency1 ******/
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
Returns the information about the tangency point between the result number Index and the first argument. ParSol is the intrinsic parameter of the point PntSol on the solution ParArg is the intrinsic parameter of the point PntSol on the first argument. Raises OutOfRange if Index is greater than the number of solutions and NotDone if IsDone returns false.
") Tangency1;
		void Tangency1(const int Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** GccAna_Circ2d2TanOn::Tangency2 ******/
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
Returns the information about the tangency point between the result number Index and the second argument. ParSol is the intrinsic parameter of the point PntSol on the solution. ParArg is the intrinsic parameter of the point PntSol on the second argument. Raises OutOfRange if Index is greater than the number of solutions and NotDone if IsDone returns false.
") Tangency2;
		void Tangency2(const int Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** GccAna_Circ2d2TanOn::ThisSolution ******/
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
Returns the solution number Index and raises OutOfRange exception if Index is greater than the number of solutions. Be careful: the Index is only a way to get all the solutions, but is not associated to those outside the context of the algorithm-object. Exceptions Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.
") ThisSolution;
		gp_Circ2d ThisSolution(const int Index);

		/****** GccAna_Circ2d2TanOn::WhichQualifier ******/
		/****** md5 signature: af20731e994c9da3e41b1695171b3bae ******/
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "
Parameters
----------
Index: int
Qualif1: GccEnt_Position
Qualif2: GccEnt_Position

Return
-------
None

Description
-----------
Returns the qualifiers Qualif1 and Qualif2 of the tangency arguments for the solution of index Index computed by this algorithm. The returned qualifiers are: - those specified at the start of construction when the solutions are defined as enclosed, enclosing or outside with respect to the arguments, or - those computed during construction (i.e. enclosed, enclosing or outside) when the solutions are defined as unqualified with respect to the arguments, or - GccEnt_noqualifier if the tangency argument is a point. Exceptions Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.
") WhichQualifier;
		void WhichQualifier(const int Index, GccEnt_Position & Qualif1, GccEnt_Position & Qualif2);

};


%extend GccAna_Circ2d2TanOn {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class GccAna_Circ2d2TanRad *
*****************************/
class GccAna_Circ2d2TanRad {
	public:
		/****** GccAna_Circ2d2TanRad::GccAna_Circ2d2TanRad ******/
		/****** md5 signature: 0e110354b33c746aa190320d36ab3cda ******/
		%feature("compactdefaultargs") GccAna_Circ2d2TanRad;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: GccEnt_QualifiedCirc
Radius: double
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to two 2d circle with a radius of Radius. It raises NegativeValue if Radius is lower than zero.
") GccAna_Circ2d2TanRad;
		 GccAna_Circ2d2TanRad(const GccEnt_QualifiedCirc & Qualified1, const GccEnt_QualifiedCirc & Qualified2, const double Radius, const double Tolerance);

		/****** GccAna_Circ2d2TanRad::GccAna_Circ2d2TanRad ******/
		/****** md5 signature: 4b873c538df0f41bc57e86a70af9cdc7 ******/
		%feature("compactdefaultargs") GccAna_Circ2d2TanRad;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: GccEnt_QualifiedLin
Radius: double
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to a 2d circle and a 2d line with a radius of Radius. It raises NegativeValue if Radius is lower than zero.
") GccAna_Circ2d2TanRad;
		 GccAna_Circ2d2TanRad(const GccEnt_QualifiedCirc & Qualified1, const GccEnt_QualifiedLin & Qualified2, const double Radius, const double Tolerance);

		/****** GccAna_Circ2d2TanRad::GccAna_Circ2d2TanRad ******/
		/****** md5 signature: 1531d00b6d6b5e7c60cc66995161e2cd ******/
		%feature("compactdefaultargs") GccAna_Circ2d2TanRad;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Point2: gp_Pnt2d
Radius: double
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to a 2d circle and a point with a radius of Radius. It raises NegativeValue if Radius is lower than zero.
") GccAna_Circ2d2TanRad;
		 GccAna_Circ2d2TanRad(const GccEnt_QualifiedCirc & Qualified1, const gp_Pnt2d & Point2, const double Radius, const double Tolerance);

		/****** GccAna_Circ2d2TanRad::GccAna_Circ2d2TanRad ******/
		/****** md5 signature: 163a4b703a5ea21b96af831cff4990d2 ******/
		%feature("compactdefaultargs") GccAna_Circ2d2TanRad;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedLin
Point2: gp_Pnt2d
Radius: double
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to a 2d line and a point with a radius of Radius. It raises NegativeValue if Radius is lower than zero.
") GccAna_Circ2d2TanRad;
		 GccAna_Circ2d2TanRad(const GccEnt_QualifiedLin & Qualified1, const gp_Pnt2d & Point2, const double Radius, const double Tolerance);

		/****** GccAna_Circ2d2TanRad::GccAna_Circ2d2TanRad ******/
		/****** md5 signature: 60df831fa5aec9d4da464c3cee3b652c ******/
		%feature("compactdefaultargs") GccAna_Circ2d2TanRad;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedLin
Qualified2: GccEnt_QualifiedLin
Radius: double
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to two 2d lines with a radius of Radius. It raises NegativeValue if Radius is lower than zero.
") GccAna_Circ2d2TanRad;
		 GccAna_Circ2d2TanRad(const GccEnt_QualifiedLin & Qualified1, const GccEnt_QualifiedLin & Qualified2, const double Radius, const double Tolerance);

		/****** GccAna_Circ2d2TanRad::GccAna_Circ2d2TanRad ******/
		/****** md5 signature: 232db1ec076deddf83e111798bc95314 ******/
		%feature("compactdefaultargs") GccAna_Circ2d2TanRad;
		%feature("autodoc", "
Parameters
----------
Point1: gp_Pnt2d
Point2: gp_Pnt2d
Radius: double
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles passing through two points with a radius of Radius. It raises NegativeValue if Radius is lower than zero.
") GccAna_Circ2d2TanRad;
		 GccAna_Circ2d2TanRad(const gp_Pnt2d & Point1, const gp_Pnt2d & Point2, const double Radius, const double Tolerance);

		/****** GccAna_Circ2d2TanRad::IsDone ******/
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

		/****** GccAna_Circ2d2TanRad::IsTheSame1 ******/
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
Returns True if the solution number Index is equal to the first argument. Raises OutOfRange if Index is greater than the number of solutions. It raises NotDone if the construction algorithm did not succeed.
") IsTheSame1;
		bool IsTheSame1(const int Index);

		/****** GccAna_Circ2d2TanRad::IsTheSame2 ******/
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
Returns True if the solution number Index is equal to the second argument. Raises OutOfRange if Index is greater than the number of solutions. It raises NotDone if the construction algorithm did not succeed.
") IsTheSame2;
		bool IsTheSame2(const int Index);

		/****** GccAna_Circ2d2TanRad::NbSolutions ******/
		/****** md5 signature: 55162d50f2670468f6ab0d146e7a9b77 ******/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Return
-------
int

Description
-----------
This method returns the number of circles, representing solutions computed by this algorithm. Exceptions StdFail_NotDone if the construction fails. of solutions.
") NbSolutions;
		int NbSolutions();

		/****** GccAna_Circ2d2TanRad::Tangency1 ******/
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
Returns information about the tangency point between the result number Index and the first argument. ParSol is the intrinsic parameter of the point PntSol on the solution. ParArg is the intrinsic parameter of the point PntSol on the first argument. Raises OutOfRange if Index is greater than the number of solutions. It raises NotDone if the construction algorithm did not succeed.
") Tangency1;
		void Tangency1(const int Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** GccAna_Circ2d2TanRad::Tangency2 ******/
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
Returns information about the tangency point between the result number Index and the second argument. ParSol is the intrinsic parameter of the point PntSol on the solution. ParArg is the intrinsic parameter of the point PntArg on the second argument. Raises OutOfRange if Index is greater than the number of solutions. It raises NotDone if the construction algorithm did not succeed.
") Tangency2;
		void Tangency2(const int Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** GccAna_Circ2d2TanRad::ThisSolution ******/
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
Returns the solution number Index. Be careful: the Index is only a way to get all the solutions, but is not associated to those outside the context of the algorithm-object. Raises OutOfRange exception if Index is greater than the number of solutions. It raises NotDone if the construction algorithm did not succeed.
") ThisSolution;
		gp_Circ2d ThisSolution(const int Index);

		/****** GccAna_Circ2d2TanRad::WhichQualifier ******/
		/****** md5 signature: af20731e994c9da3e41b1695171b3bae ******/
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "
Parameters
----------
Index: int
Qualif1: GccEnt_Position
Qualif2: GccEnt_Position

Return
-------
None

Description
-----------
Returns the information about the qualifiers of the tangency arguments concerning the solution number Index. It returns the real qualifiers (the qualifiers given to the constructor method in case of enclosed, enclosing and outside and the qualifiers computedin case of unqualified).
") WhichQualifier;
		void WhichQualifier(const int Index, GccEnt_Position & Qualif1, GccEnt_Position & Qualif2);

};


%extend GccAna_Circ2d2TanRad {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class GccAna_Circ2d3Tan *
**************************/
class GccAna_Circ2d3Tan {
	public:
		/****** GccAna_Circ2d3Tan::GccAna_Circ2d3Tan ******/
		/****** md5 signature: 3c06f4af32457c3eb3847ebc4f158075 ******/
		%feature("compactdefaultargs") GccAna_Circ2d3Tan;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: GccEnt_QualifiedCirc
Qualified3: GccEnt_QualifiedCirc
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles tangent to 3 circles. ConstructionError is raised if there is a problem during the computation.
") GccAna_Circ2d3Tan;
		 GccAna_Circ2d3Tan(const GccEnt_QualifiedCirc & Qualified1, const GccEnt_QualifiedCirc & Qualified2, const GccEnt_QualifiedCirc & Qualified3, const double Tolerance);

		/****** GccAna_Circ2d3Tan::GccAna_Circ2d3Tan ******/
		/****** md5 signature: 97ed317a2632ae5c3ea805de7dda068d ******/
		%feature("compactdefaultargs") GccAna_Circ2d3Tan;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: GccEnt_QualifiedCirc
Qualified3: GccEnt_QualifiedLin
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles tangent to 2 circles and 1 line. ConstructionError is raised if there is a problem during the computation.
") GccAna_Circ2d3Tan;
		 GccAna_Circ2d3Tan(const GccEnt_QualifiedCirc & Qualified1, const GccEnt_QualifiedCirc & Qualified2, const GccEnt_QualifiedLin & Qualified3, const double Tolerance);

		/****** GccAna_Circ2d3Tan::GccAna_Circ2d3Tan ******/
		/****** md5 signature: 4140eca63b8c7658448e89070dad19fa ******/
		%feature("compactdefaultargs") GccAna_Circ2d3Tan;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: GccEnt_QualifiedLin
Qualified3: GccEnt_QualifiedLin
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles tangent to 1 circle and 2 lines. ConstructionError is raised if there is a problem during the computation.
") GccAna_Circ2d3Tan;
		 GccAna_Circ2d3Tan(const GccEnt_QualifiedCirc & Qualified1, const GccEnt_QualifiedLin & Qualified2, const GccEnt_QualifiedLin & Qualified3, const double Tolerance);

		/****** GccAna_Circ2d3Tan::GccAna_Circ2d3Tan ******/
		/****** md5 signature: 08fa940a84ed2972367f1ed3ef6c1892 ******/
		%feature("compactdefaultargs") GccAna_Circ2d3Tan;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedLin
Qualified2: GccEnt_QualifiedLin
Qualified3: GccEnt_QualifiedLin
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles tangent to 3 lines. ConstructionError is raised if there is a problem during the computation.
") GccAna_Circ2d3Tan;
		 GccAna_Circ2d3Tan(const GccEnt_QualifiedLin & Qualified1, const GccEnt_QualifiedLin & Qualified2, const GccEnt_QualifiedLin & Qualified3, const double Tolerance);

		/****** GccAna_Circ2d3Tan::GccAna_Circ2d3Tan ******/
		/****** md5 signature: 8b9aeb4b69af8194b7cdf5532f674448 ******/
		%feature("compactdefaultargs") GccAna_Circ2d3Tan;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: GccEnt_QualifiedCirc
Point3: gp_Pnt2d
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles tangent to 2 circles and 1 Point. ConstructionError is raised if there is a problem during the computation.
") GccAna_Circ2d3Tan;
		 GccAna_Circ2d3Tan(const GccEnt_QualifiedCirc & Qualified1, const GccEnt_QualifiedCirc & Qualified2, const gp_Pnt2d & Point3, const double Tolerance);

		/****** GccAna_Circ2d3Tan::GccAna_Circ2d3Tan ******/
		/****** md5 signature: b1f3ab5f251d7bb9c63bacf02db83240 ******/
		%feature("compactdefaultargs") GccAna_Circ2d3Tan;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: GccEnt_QualifiedLin
Point3: gp_Pnt2d
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles tangent to a circle and a line and 1 Point. ConstructionError is raised if there is a problem during the computation.
") GccAna_Circ2d3Tan;
		 GccAna_Circ2d3Tan(const GccEnt_QualifiedCirc & Qualified1, const GccEnt_QualifiedLin & Qualified2, const gp_Pnt2d & Point3, const double Tolerance);

		/****** GccAna_Circ2d3Tan::GccAna_Circ2d3Tan ******/
		/****** md5 signature: 79e5bad08d2a95bd4f3aa7e63986666f ******/
		%feature("compactdefaultargs") GccAna_Circ2d3Tan;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedLin
Qualified2: GccEnt_QualifiedLin
Point3: gp_Pnt2d
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles tangent to 2 lines and 1 Point. ConstructionError is raised if there is a problem during the computation.
") GccAna_Circ2d3Tan;
		 GccAna_Circ2d3Tan(const GccEnt_QualifiedLin & Qualified1, const GccEnt_QualifiedLin & Qualified2, const gp_Pnt2d & Point3, const double Tolerance);

		/****** GccAna_Circ2d3Tan::GccAna_Circ2d3Tan ******/
		/****** md5 signature: 99de5b6ca9817c663c81ac7ee4f71e11 ******/
		%feature("compactdefaultargs") GccAna_Circ2d3Tan;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Point2: gp_Pnt2d
Point3: gp_Pnt2d
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles tangent to a circle and passing through 2 Points. ConstructionError is raised if there is a problem during the computation.
") GccAna_Circ2d3Tan;
		 GccAna_Circ2d3Tan(const GccEnt_QualifiedCirc & Qualified1, const gp_Pnt2d & Point2, const gp_Pnt2d & Point3, const double Tolerance);

		/****** GccAna_Circ2d3Tan::GccAna_Circ2d3Tan ******/
		/****** md5 signature: 4927eee10379b0acc49d9599a8dc4a9a ******/
		%feature("compactdefaultargs") GccAna_Circ2d3Tan;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedLin
Point2: gp_Pnt2d
Point3: gp_Pnt2d
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles tangent to a line and passing through 2 Points. ConstructionError is raised if there is a problem during the computation.
") GccAna_Circ2d3Tan;
		 GccAna_Circ2d3Tan(const GccEnt_QualifiedLin & Qualified1, const gp_Pnt2d & Point2, const gp_Pnt2d & Point3, const double Tolerance);

		/****** GccAna_Circ2d3Tan::GccAna_Circ2d3Tan ******/
		/****** md5 signature: b320f2647557758190349fa4d77b3e84 ******/
		%feature("compactdefaultargs") GccAna_Circ2d3Tan;
		%feature("autodoc", "
Parameters
----------
Point1: gp_Pnt2d
Point2: gp_Pnt2d
Point3: gp_Pnt2d
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles passing through 3 Points. ConstructionError is raised if there is a problem during the computation.
") GccAna_Circ2d3Tan;
		 GccAna_Circ2d3Tan(const gp_Pnt2d & Point1, const gp_Pnt2d & Point2, const gp_Pnt2d & Point3, const double Tolerance);

		/****** GccAna_Circ2d3Tan::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
This method returns True if the construction algorithm succeeded. Note: IsDone protects against a failure arising from a more internal intersection algorithm, which has reached its numeric limits.
") IsDone;
		bool IsDone();

		/****** GccAna_Circ2d3Tan::IsTheSame1 ******/
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
Returns True if the solution number Index is equal to the first argument. Raises OutOfRange if Index is greater than the number of solutions. It raises NotDone if the algorithm failed.
") IsTheSame1;
		bool IsTheSame1(const int Index);

		/****** GccAna_Circ2d3Tan::IsTheSame2 ******/
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
Returns True if the solution number Index is equal to the second argument. Raises OutOfRange Index is greater than the number of solutions. It raises NotDone if the algorithm failed.
") IsTheSame2;
		bool IsTheSame2(const int Index);

		/****** GccAna_Circ2d3Tan::IsTheSame3 ******/
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
Returns True if the solution number Index is equal to the third argument. Raises OutOfRange if Index is greater than the number of solutions. It raises NotDone if the algorithm failed.
") IsTheSame3;
		bool IsTheSame3(const int Index);

		/****** GccAna_Circ2d3Tan::NbSolutions ******/
		/****** md5 signature: 55162d50f2670468f6ab0d146e7a9b77 ******/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Return
-------
int

Description
-----------
This method returns the number of solutions. Raises NotDone if the construction algorithm didn't succeed.
") NbSolutions;
		int NbSolutions();

		/****** GccAna_Circ2d3Tan::Tangency1 ******/
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
Returns information about the tangency point between the result number Index and the first argument. ParSol is the intrinsic parameter of the point PntSol on the solution curv. ParArg is the intrinsic parameter of the point PntArg on the argument curv. Raises OutOfRange if Index is greater than the number of solutions. It raises NotDone if the algorithm failed.
") Tangency1;
		void Tangency1(const int Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** GccAna_Circ2d3Tan::Tangency2 ******/
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
Returns information about the tangency point between the result number Index and the first argument. ParSol is the intrinsic parameter of the point PntSol on the solution curv. ParArg is the intrinsic parameter of the point Pntsol on the argument curv. Raises OutOfRange if Index is greater than the number of solutions. It raises NotDone if the algorithm failed.
") Tangency2;
		void Tangency2(const int Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** GccAna_Circ2d3Tan::Tangency3 ******/
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
Returns information about the tangency point between the result number Index and the first argument. ParSol is the intrinsic parameter of the point PntSol on the solution curv. ParArg is the intrinsic parameter of the point Pntsol on the argument curv. Raises OutOfRange if Index is greater than the number of solutions. It raises NotDone if the algorithm failed.
") Tangency3;
		void Tangency3(const int Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** GccAna_Circ2d3Tan::ThisSolution ******/
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
Returns the solution number Index and raises OutOfRange exception if Index is greater than the number of solutions. Be careful: the Index is only a way to get all the solutions, but is not associated to those outside the context of the algorithm-object. Raises OutOfRange if Index is greater than the number of solutions. It raises NotDone if the algorithm failed.
") ThisSolution;
		gp_Circ2d ThisSolution(const int Index);

		/****** GccAna_Circ2d3Tan::WhichQualifier ******/
		/****** md5 signature: 2f42300cec25cd6b913dacdacb67c9b6 ******/
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "
Parameters
----------
Index: int
Qualif1: GccEnt_Position
Qualif2: GccEnt_Position
Qualif3: GccEnt_Position

Return
-------
None

Description
-----------
Returns the information about the qualifiers of the tangency arguments concerning the solution number Index. It returns the real qualifiers (the qualifiers given to the constructor method in case of enclosed, enclosing and outside and the qualifiers computedin case of unqualified).
") WhichQualifier;
		void WhichQualifier(const int Index, GccEnt_Position & Qualif1, GccEnt_Position & Qualif2, GccEnt_Position & Qualif3);

};


%extend GccAna_Circ2d3Tan {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class GccAna_Circ2dBisec *
***************************/
class GccAna_Circ2dBisec {
	public:
		/****** GccAna_Circ2dBisec::GccAna_Circ2dBisec ******/
		/****** md5 signature: 96b7e55cbf3b08bc7fa908eca5dd03db ******/
		%feature("compactdefaultargs") GccAna_Circ2dBisec;
		%feature("autodoc", "
Parameters
----------
Circ1: gp_Circ2d
Circ2: gp_Circ2d

Return
-------
None

Description
-----------
Constructs bisecting curves between the two circles Circ1 and Circ2.
") GccAna_Circ2dBisec;
		 GccAna_Circ2dBisec(const gp_Circ2d & Circ1, const gp_Circ2d & Circ2);

		/****** GccAna_Circ2dBisec::IsDone ******/
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

		/****** GccAna_Circ2dBisec::NbSolutions ******/
		/****** md5 signature: 55162d50f2670468f6ab0d146e7a9b77 ******/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Return
-------
int

Description
-----------
This method returns the number of solutions. Raises NotDone if the construction algorithm didn't succeed.
") NbSolutions;
		int NbSolutions();

		/****** GccAna_Circ2dBisec::ThisSolution ******/
		/****** md5 signature: f69ba2b9012e9086ee083262578da809 ******/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<GccInt_Bisec>

Description
-----------
Returns the solution number Index Raises OutOfRange exception if Index is greater than the number of solutions. It raises NotDone if the construction algorithm didn't succeed.
") ThisSolution;
		opencascade::handle<GccInt_Bisec> ThisSolution(const int Index);

};


%extend GccAna_Circ2dBisec {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class GccAna_Circ2dTanCen *
****************************/
class GccAna_Circ2dTanCen {
	public:
		/****** GccAna_Circ2dTanCen::GccAna_Circ2dTanCen ******/
		/****** md5 signature: b25c0a34f9d18ce39465ad36c7de761f ******/
		%feature("compactdefaultargs") GccAna_Circ2dTanCen;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Pcenter: gp_Pnt2d
Tolerance: double

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles tangent to a circle and centered on a point.
") GccAna_Circ2dTanCen;
		 GccAna_Circ2dTanCen(const GccEnt_QualifiedCirc & Qualified1, const gp_Pnt2d & Pcenter, const double Tolerance);

		/****** GccAna_Circ2dTanCen::GccAna_Circ2dTanCen ******/
		/****** md5 signature: 6c304bbd46bdd120f2ef6d03897dacbf ******/
		%feature("compactdefaultargs") GccAna_Circ2dTanCen;
		%feature("autodoc", "
Parameters
----------
Linetan: gp_Lin2d
Pcenter: gp_Pnt2d

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles tangent to a line and centered on a point.
") GccAna_Circ2dTanCen;
		 GccAna_Circ2dTanCen(const gp_Lin2d & Linetan, const gp_Pnt2d & Pcenter);

		/****** GccAna_Circ2dTanCen::GccAna_Circ2dTanCen ******/
		/****** md5 signature: e4011363fd322219f6eccfea846244d4 ******/
		%feature("compactdefaultargs") GccAna_Circ2dTanCen;
		%feature("autodoc", "
Parameters
----------
Point1: gp_Pnt2d
Pcenter: gp_Pnt2d

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles passing through a point and centered on a point. Tolerance is a tolerance criterion used by the algorithm to find a solution when, mathematically, the problem posed does not have a solution, but where there is numeric uncertainty attached to the arguments. In these algorithms Tolerance is only used in very specific cases where the center of the solution is very close to the circle to which it is tangential, and where the solution is therefore a very small circle. Exceptions GccEnt_BadQualifier if a qualifier is inconsistent with the argument it qualifies (for example, enclosing for a line).
") GccAna_Circ2dTanCen;
		 GccAna_Circ2dTanCen(const gp_Pnt2d & Point1, const gp_Pnt2d & Pcenter);

		/****** GccAna_Circ2dTanCen::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
This method returns True if the construction algorithm succeeded. Note: IsDone protects against a failure arising from a more internal intersection algorithm, which has reached its numeric limits.
") IsDone;
		bool IsDone();

		/****** GccAna_Circ2dTanCen::IsTheSame1 ******/
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
Returns True if the solution number Index is equal to the first argument. It raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions or less than zero.
") IsTheSame1;
		bool IsTheSame1(const int Index);

		/****** GccAna_Circ2dTanCen::NbSolutions ******/
		/****** md5 signature: 55162d50f2670468f6ab0d146e7a9b77 ******/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of circles, representing solutions computed by this algorithm and raises NotDone exception if the algorithm didn't succeed.
") NbSolutions;
		int NbSolutions();

		/****** GccAna_Circ2dTanCen::Tangency1 ******/
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

		/****** GccAna_Circ2dTanCen::ThisSolution ******/
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
Returns the circle, representing the solution number Index and raises OutOfRange exception if Index is greater than the number of solutions. Be careful: the Index is only a way to get all the solutions, but is not associated to these outside the context of the algorithm-object. Raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions or less than zer.
") ThisSolution;
		gp_Circ2d ThisSolution(const int Index);

		/****** GccAna_Circ2dTanCen::WhichQualifier ******/
		/****** md5 signature: 4daf73703788dec976e70ecd6d32d56c ******/
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "
Parameters
----------
Index: int
Qualif1: GccEnt_Position

Return
-------
None

Description
-----------
Returns the qualifier Qualif1 of the tangency argument for the solution of index Index computed by this algorithm. The returned qualifier is: - that specified at the start of construction when the solutions are defined as enclosed, enclosing or It returns the real qualifiers (the qualifiers given to the constructor method in case of enclosed, enclosing and outside and the qualifiers computedin case of unqualified).
") WhichQualifier;
		void WhichQualifier(const int Index, GccEnt_Position & Qualif1);

};


%extend GccAna_Circ2dTanCen {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class GccAna_Circ2dTanOnRad *
******************************/
class GccAna_Circ2dTanOnRad {
	public:
		/****** GccAna_Circ2dTanOnRad::GccAna_Circ2dTanOnRad ******/
		/****** md5 signature: cec24bfd410fa0691e9590e08fe0729d ******/
		%feature("compactdefaultargs") GccAna_Circ2dTanOnRad;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
OnLine: gp_Lin2d
Radius: double
Tolerance: double

Return
-------
None

Description
-----------
This methods implements the algorithms used to create 2d Circles tangent to a circle and centered on a 2d Line with a given radius. Tolerance is used to find solution in every limit cases. For example Tolerance is used in the case of EnclosedCirc when Radius-R1+dist is greater Tolerance (dist is the distance between the line and the location of the circ, R1 is the radius of the circ) because there is no solution. raises NegativeValue in case of NegativeRadius.
") GccAna_Circ2dTanOnRad;
		 GccAna_Circ2dTanOnRad(const GccEnt_QualifiedCirc & Qualified1, const gp_Lin2d & OnLine, const double Radius, const double Tolerance);

		/****** GccAna_Circ2dTanOnRad::GccAna_Circ2dTanOnRad ******/
		/****** md5 signature: 23be715834f9787f96f07ac7de4bb5cf ******/
		%feature("compactdefaultargs") GccAna_Circ2dTanOnRad;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedLin
OnLine: gp_Lin2d
Radius: double
Tolerance: double

Return
-------
None

Description
-----------
This methods implements the algorithms used to create 2d Circles tangent to a 2d Line and centered on a 2d Line with a given radius. Tolerance is used to find solution in every limit cases. raises NegativeValue in case of NegativeRadius.
") GccAna_Circ2dTanOnRad;
		 GccAna_Circ2dTanOnRad(const GccEnt_QualifiedLin & Qualified1, const gp_Lin2d & OnLine, const double Radius, const double Tolerance);

		/****** GccAna_Circ2dTanOnRad::GccAna_Circ2dTanOnRad ******/
		/****** md5 signature: 36c36e5142b6223bfbab92a9d3f81f24 ******/
		%feature("compactdefaultargs") GccAna_Circ2dTanOnRad;
		%feature("autodoc", "
Parameters
----------
Point1: gp_Pnt2d
OnLine: gp_Lin2d
Radius: double
Tolerance: double

Return
-------
None

Description
-----------
This methods implements the algorithms used to create 2d Circles passing through a 2d Point and centered on a 2d Line with a given radius. Tolerance is used to find solution in every limit cases.
") GccAna_Circ2dTanOnRad;
		 GccAna_Circ2dTanOnRad(const gp_Pnt2d & Point1, const gp_Lin2d & OnLine, const double Radius, const double Tolerance);

		/****** GccAna_Circ2dTanOnRad::GccAna_Circ2dTanOnRad ******/
		/****** md5 signature: f76159a0a93a2884a7f83fa4fb3142e1 ******/
		%feature("compactdefaultargs") GccAna_Circ2dTanOnRad;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
OnCirc: gp_Circ2d
Radius: double
Tolerance: double

Return
-------
None

Description
-----------
This methods implements the algorithms used to create 2d Circles tangent to a circle and centered on a 2d Circle with a given radius. Tolerance is used to find solution in every limit cases. raises NegativeValue in case of NegativeRadius.
") GccAna_Circ2dTanOnRad;
		 GccAna_Circ2dTanOnRad(const GccEnt_QualifiedCirc & Qualified1, const gp_Circ2d & OnCirc, const double Radius, const double Tolerance);

		/****** GccAna_Circ2dTanOnRad::GccAna_Circ2dTanOnRad ******/
		/****** md5 signature: 6203ca581951dbce3064bb633b508bfa ******/
		%feature("compactdefaultargs") GccAna_Circ2dTanOnRad;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedLin
OnCirc: gp_Circ2d
Radius: double
Tolerance: double

Return
-------
None

Description
-----------
This methods implements the algorithms used to create 2d Circles tangent to a 2d Line and centered on a 2d Line with a given radius. Tolerance is used to find solution in every limit cases. raises NegativeValue in case of NegativeRadius.
") GccAna_Circ2dTanOnRad;
		 GccAna_Circ2dTanOnRad(const GccEnt_QualifiedLin & Qualified1, const gp_Circ2d & OnCirc, const double Radius, const double Tolerance);

		/****** GccAna_Circ2dTanOnRad::GccAna_Circ2dTanOnRad ******/
		/****** md5 signature: 23eb2fce4937a91aac66ddcfd15ec4c6 ******/
		%feature("compactdefaultargs") GccAna_Circ2dTanOnRad;
		%feature("autodoc", "
Parameters
----------
Point1: gp_Pnt2d
OnCirc: gp_Circ2d
Radius: double
Tolerance: double

Return
-------
None

Description
-----------
This methods implements the algorithms used to create 2d Circles passing through a 2d Point and centered on a 2d Line with a given radius. Tolerance is used to find solution in every limit cases. raises NegativeValue in case of NegativeRadius.
") GccAna_Circ2dTanOnRad;
		 GccAna_Circ2dTanOnRad(const gp_Pnt2d & Point1, const gp_Circ2d & OnCirc, const double Radius, const double Tolerance);

		/****** GccAna_Circ2dTanOnRad::CenterOn3 ******/
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
Returns information about the center (on the curv) of the result. ParArg is the intrinsic parameter of the point on the argument curv. PntSol is the center point of the solution curv. Raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions.
") CenterOn3;
		void CenterOn3(const int Index, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** GccAna_Circ2dTanOnRad::IsDone ******/
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

		/****** GccAna_Circ2dTanOnRad::IsTheSame1 ******/
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
Returns True if the solution number Index is equal to the first argument and False in the other cases. Raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions.
") IsTheSame1;
		bool IsTheSame1(const int Index);

		/****** GccAna_Circ2dTanOnRad::NbSolutions ******/
		/****** md5 signature: 55162d50f2670468f6ab0d146e7a9b77 ******/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Return
-------
int

Description
-----------
This method returns the number of circles, representing solutions. Raises NotDone if the construction algorithm didn't succeed.
") NbSolutions;
		int NbSolutions();

		/****** GccAna_Circ2dTanOnRad::Tangency1 ******/
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
Returns information about the tangency point between the result number Index and the first argument. ParSol is the intrinsic parameter of the point on the solution curv. ParArg is the intrinsic parameter of the point on the argument curv. PntSol is the tangency point on the solution curv. PntArg is the tangency point on the argument curv. Raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions.
") Tangency1;
		void Tangency1(const int Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** GccAna_Circ2dTanOnRad::ThisSolution ******/
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
Returns the solution number Index and raises OutOfRange exception if Index is greater than the number of solutions. Be careful: the Index is only a way to get all the solutions, but is not associated to these outside the context of the algorithm-object. Raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions.
") ThisSolution;
		gp_Circ2d ThisSolution(const int Index);

		/****** GccAna_Circ2dTanOnRad::WhichQualifier ******/
		/****** md5 signature: 4daf73703788dec976e70ecd6d32d56c ******/
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "
Parameters
----------
Index: int
Qualif1: GccEnt_Position

Return
-------
None

Description
-----------
Returns the qualifier Qualif1 of the tangency argument for the solution of index Index computed by this algorithm. The returned qualifier is: - that specified at the start of construction when the solutions are defined as enclosed, enclosing or outside with respect to the argument, or - that computed during construction (i.e. enclosed, enclosing or outside) when the solutions are defined as unqualified with respect to the argument, or - GccEnt_noqualifier if the tangency argument is a point. Exceptions Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.
") WhichQualifier;
		void WhichQualifier(const int Index, GccEnt_Position & Qualif1);

};


%extend GccAna_Circ2dTanOnRad {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class GccAna_CircLin2dBisec *
******************************/
class GccAna_CircLin2dBisec {
	public:
		/****** GccAna_CircLin2dBisec::GccAna_CircLin2dBisec ******/
		/****** md5 signature: b67f5059aeaf823e002bf5c3d9cbc6fb ******/
		%feature("compactdefaultargs") GccAna_CircLin2dBisec;
		%feature("autodoc", "
Parameters
----------
Circle: gp_Circ2d
Line: gp_Lin2d

Return
-------
None

Description
-----------
Constructs bisecting curves between the circle Circle and the line Line.
") GccAna_CircLin2dBisec;
		 GccAna_CircLin2dBisec(const gp_Circ2d & Circle, const gp_Lin2d & Line);

		/****** GccAna_CircLin2dBisec::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true (this construction algorithm never fails).
") IsDone;
		bool IsDone();

		/****** GccAna_CircLin2dBisec::NbSolutions ******/
		/****** md5 signature: 55162d50f2670468f6ab0d146e7a9b77 ******/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of curves, representing solutions computed by this algorithm.
") NbSolutions;
		int NbSolutions();

		/****** GccAna_CircLin2dBisec::ThisSolution ******/
		/****** md5 signature: f69ba2b9012e9086ee083262578da809 ******/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<GccInt_Bisec>

Description
-----------
Returns the solution number Index and raises OutOfRange exception if Index is greater than the number of solutions Exceptions Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm.
") ThisSolution;
		opencascade::handle<GccInt_Bisec> ThisSolution(const int Index);

};


%extend GccAna_CircLin2dBisec {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class GccAna_CircPnt2dBisec *
******************************/
class GccAna_CircPnt2dBisec {
	public:
		/****** GccAna_CircPnt2dBisec::GccAna_CircPnt2dBisec ******/
		/****** md5 signature: b15af1e7a4aa95b21ea9f592a088b788 ******/
		%feature("compactdefaultargs") GccAna_CircPnt2dBisec;
		%feature("autodoc", "
Parameters
----------
Circle1: gp_Circ2d
Point2: gp_Pnt2d

Return
-------
None

Description
-----------
Constructs bisecting curves between the circle Circle1 and the point Point2.
") GccAna_CircPnt2dBisec;
		 GccAna_CircPnt2dBisec(const gp_Circ2d & Circle1, const gp_Pnt2d & Point2);

		/****** GccAna_CircPnt2dBisec::GccAna_CircPnt2dBisec ******/
		/****** md5 signature: 214e8446f33ffd7964bbae9937af5d8e ******/
		%feature("compactdefaultargs") GccAna_CircPnt2dBisec;
		%feature("autodoc", "
Parameters
----------
Circle1: gp_Circ2d
Point2: gp_Pnt2d
Tolerance: double

Return
-------
None

Description
-----------
Constructs bisecting curves between the circle Circle1 and the point Point2. Tolerance is used.
") GccAna_CircPnt2dBisec;
		 GccAna_CircPnt2dBisec(const gp_Circ2d & Circle1, const gp_Pnt2d & Point2, const double Tolerance);

		/****** GccAna_CircPnt2dBisec::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true (this construction algorithm never fails).
") IsDone;
		bool IsDone();

		/****** GccAna_CircPnt2dBisec::NbSolutions ******/
		/****** md5 signature: 55162d50f2670468f6ab0d146e7a9b77 ******/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of curves, representing solutions computed by this algorithm.
") NbSolutions;
		int NbSolutions();

		/****** GccAna_CircPnt2dBisec::ThisSolution ******/
		/****** md5 signature: f69ba2b9012e9086ee083262578da809 ******/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<GccInt_Bisec>

Description
-----------
Returns the solution number Index and raises OutOfRange exception if Index is greater than the number of solutions. Exceptions Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm.
") ThisSolution;
		opencascade::handle<GccInt_Bisec> ThisSolution(const int Index);

};


%extend GccAna_CircPnt2dBisec {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class GccAna_Lin2d2Tan *
*************************/
class GccAna_Lin2d2Tan {
	public:
		/****** GccAna_Lin2d2Tan::GccAna_Lin2d2Tan ******/
		/****** md5 signature: eb34557ea1a7a99cbb2afd7faf5671af ******/
		%feature("compactdefaultargs") GccAna_Lin2d2Tan;
		%feature("autodoc", "
Parameters
----------
ThePoint1: gp_Pnt2d
ThePoint2: gp_Pnt2d
Tolerance: double

Return
-------
None

Description
-----------
This methods implements the algorithms used to create 2d lines passing through 2 points. Tolerance is used because we can't create a line when the distance between the two points is too small.
") GccAna_Lin2d2Tan;
		 GccAna_Lin2d2Tan(const gp_Pnt2d & ThePoint1, const gp_Pnt2d & ThePoint2, const double Tolerance);

		/****** GccAna_Lin2d2Tan::GccAna_Lin2d2Tan ******/
		/****** md5 signature: 3ebbbbf12c5671e9ef6d09b42c93c2f8 ******/
		%feature("compactdefaultargs") GccAna_Lin2d2Tan;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
ThePoint: gp_Pnt2d
Tolerance: double

Return
-------
None

Description
-----------
This methods implements the algorithms used to create 2d lines tangent to one circle and passing through a point. Exception BadQualifier is raised in the case of EnclosedCirc Tolerance is used because there is no solution when the point is inside the solution according to the tolerance.
") GccAna_Lin2d2Tan;
		 GccAna_Lin2d2Tan(const GccEnt_QualifiedCirc & Qualified1, const gp_Pnt2d & ThePoint, const double Tolerance);

		/****** GccAna_Lin2d2Tan::GccAna_Lin2d2Tan ******/
		/****** md5 signature: 618bd0ca3e7f89aeeb076d225fab5540 ******/
		%feature("compactdefaultargs") GccAna_Lin2d2Tan;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: GccEnt_QualifiedCirc
Tolerance: double

Return
-------
None

Description
-----------
This methods implements the algorithms used to create 2d lines tangent to 2 circles. Exception BadQualifier is raised in the case of EnclosedCirc.
") GccAna_Lin2d2Tan;
		 GccAna_Lin2d2Tan(const GccEnt_QualifiedCirc & Qualified1, const GccEnt_QualifiedCirc & Qualified2, const double Tolerance);

		/****** GccAna_Lin2d2Tan::IsDone ******/
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

		/****** GccAna_Lin2d2Tan::NbSolutions ******/
		/****** md5 signature: 55162d50f2670468f6ab0d146e7a9b77 ******/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Return
-------
int

Description
-----------
This method returns the number of solutions. Raises NotDone if the construction algorithm didn't succeed.
") NbSolutions;
		int NbSolutions();

		/****** GccAna_Lin2d2Tan::Tangency1 ******/
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
Returns information about the tangency point between the result number Index and the first argument. ParSol is the intrinsic parameter of the point PntSol on the solution curv. ParArg is the intrinsic parameter of the point PntSol on the argument curv. Raises OutOfRange is raised if Index is greater than the number of solutions. It raises NotDone if the algorithm failed.
") Tangency1;
		void Tangency1(const int Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** GccAna_Lin2d2Tan::Tangency2 ******/
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
Returns information about the tangency point between the result number Index and the second argument. ParSol is the intrinsic parameter of the point ParSol on the solution curv. ParArg is the intrinsic parameter of the point PntSol on the argument curv. Raises OutOfRange is raised if Index is greater than the number of solutions. It raises NotDone if the algorithm failed.
") Tangency2;
		void Tangency2(const int Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** GccAna_Lin2d2Tan::ThisSolution ******/
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
Returns the solution number Index and raises OutOfRange exception if Index is greater than the number of solutions. Be careful: the Index is only a way to get all the solutions, but is not associated to these outside the context of the algorithm-object. Raises OutOfRange is raised if Index is greater than the number of solutions. It raises NotDone if the algorithm failed.
") ThisSolution;
		gp_Lin2d ThisSolution(const int Index);

		/****** GccAna_Lin2d2Tan::WhichQualifier ******/
		/****** md5 signature: af20731e994c9da3e41b1695171b3bae ******/
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "
Parameters
----------
Index: int
Qualif1: GccEnt_Position
Qualif2: GccEnt_Position

Return
-------
None

Description
-----------
Returns the qualifiers Qualif1 and Qualif2 of the tangency arguments for the solution of index Index computed by this algorithm. The returned qualifiers are: - those specified at the start of construction when the solutions are defined as enclosing or outside with respect to the arguments, or - those computed during construction (i.e. enclosing or outside) when the solutions are defined as unqualified with respect to the arguments, or - GccEnt_noqualifier if the tangency argument is a point. Exceptions Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.
") WhichQualifier;
		void WhichQualifier(const int Index, GccEnt_Position & Qualif1, GccEnt_Position & Qualif2);

};


%extend GccAna_Lin2d2Tan {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class GccAna_Lin2dBisec *
**************************/
class GccAna_Lin2dBisec {
	public:
		/****** GccAna_Lin2dBisec::GccAna_Lin2dBisec ******/
		/****** md5 signature: 27748dfa51dc753aa7d97ccfd97888cc ******/
		%feature("compactdefaultargs") GccAna_Lin2dBisec;
		%feature("autodoc", "
Parameters
----------
Lin1: gp_Lin2d
Lin2: gp_Lin2d

Return
-------
None

Description
-----------
Constructs bisecting lines between the two lines Lin1 and Lin2.
") GccAna_Lin2dBisec;
		 GccAna_Lin2dBisec(const gp_Lin2d & Lin1, const gp_Lin2d & Lin2);

		/****** GccAna_Lin2dBisec::Intersection1 ******/
		/****** md5 signature: 789e58bb834e4dacfd007d25315a1617 ******/
		%feature("compactdefaultargs") Intersection1;
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
Returns information about the intersection point between the result number Index and the first argument. Raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions.
") Intersection1;
		void Intersection1(const int Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** GccAna_Lin2dBisec::Intersection2 ******/
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
Returns information about the intersection point between the result number Index and the second argument. Raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions.
") Intersection2;
		void Intersection2(const int Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** GccAna_Lin2dBisec::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True when the algorithm succeeded.
") IsDone;
		bool IsDone();

		/****** GccAna_Lin2dBisec::NbSolutions ******/
		/****** md5 signature: 55162d50f2670468f6ab0d146e7a9b77 ******/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of solutions and raise NotDone if the constructor wasn't called before.
") NbSolutions;
		int NbSolutions();

		/****** GccAna_Lin2dBisec::ThisSolution ******/
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
Returns the solution number Index . The first solution is the inside one and the second is the outside one. For the first solution the direction is D1+D2 (D1 is the direction of the first argument and D2 the direction of the second argument). For the second solution the direction is D1-D2. Raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions.
") ThisSolution;
		gp_Lin2d ThisSolution(const int Index);

};


%extend GccAna_Lin2dBisec {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class GccAna_Lin2dTanObl *
***************************/
class GccAna_Lin2dTanObl {
	public:
		/****** GccAna_Lin2dTanObl::GccAna_Lin2dTanObl ******/
		/****** md5 signature: eb0a2a1b0fce4af42d5082d3d5044391 ******/
		%feature("compactdefaultargs") GccAna_Lin2dTanObl;
		%feature("autodoc", "
Parameters
----------
ThePoint: gp_Pnt2d
TheLine: gp_Lin2d
TheAngle: double

Return
-------
None

Description
-----------
This class implements the algorithms used to create 2d line passing through a point and making an angle with a line.
") GccAna_Lin2dTanObl;
		 GccAna_Lin2dTanObl(const gp_Pnt2d & ThePoint, const gp_Lin2d & TheLine, const double TheAngle);

		/****** GccAna_Lin2dTanObl::GccAna_Lin2dTanObl ******/
		/****** md5 signature: a5dc6749113aa69c0a32ae36e8c8078b ******/
		%feature("compactdefaultargs") GccAna_Lin2dTanObl;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
TheLine: gp_Lin2d
TheAngle: double

Return
-------
None

Description
-----------
This class implements the algorithms used to create 2d line tangent to a circle and making an angle with a line. Exceptions GccEnt_BadQualifier if a qualifier is inconsistent with the argument it qualifies (for example, enclosed for a circle).
") GccAna_Lin2dTanObl;
		 GccAna_Lin2dTanObl(const GccEnt_QualifiedCirc & Qualified1, const gp_Lin2d & TheLine, const double TheAngle);

		/****** GccAna_Lin2dTanObl::Intersection2 ******/
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
Returns information about the intersection between the result number Index and the third argument. Raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions.
") Intersection2;
		void Intersection2(const int Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** GccAna_Lin2dTanObl::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the algorithm succeeded. Note: IsDone protects against a failure arising from a more internal intersection algorithm, which has reached its numeric limits.
") IsDone;
		bool IsDone();

		/****** GccAna_Lin2dTanObl::NbSolutions ******/
		/****** md5 signature: 55162d50f2670468f6ab0d146e7a9b77 ******/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of lines, representing solutions computed by this algorithm. Raises NotDone if the construction algorithm didn't succeed.
") NbSolutions;
		int NbSolutions();

		/****** GccAna_Lin2dTanObl::Tangency1 ******/
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
Returns information about the tangency point between the result number Index and the first argument. ParSol is the intrinsic parameter of the point ParSol on the solution curv. ParArg is the intrinsic parameter of the point ParArg on the argument curv. Raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions.
") Tangency1;
		void Tangency1(const int Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** GccAna_Lin2dTanObl::ThisSolution ******/
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
Returns the solution number Index. Be careful: the Index is only a way to get all the solutions, but is not associated to these outside the context of the algorithm-object. raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions.
") ThisSolution;
		gp_Lin2d ThisSolution(const int Index);

		/****** GccAna_Lin2dTanObl::WhichQualifier ******/
		/****** md5 signature: 4daf73703788dec976e70ecd6d32d56c ******/
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "
Parameters
----------
Index: int
Qualif1: GccEnt_Position

Return
-------
None

Description
-----------
Returns the qualifier Qualif1 of the tangency argument for the solution of index Index computed by this algorithm. The returned qualifier is: - that specified at the start of construction when the solutions are defined as enclosing or outside with respect to the argument, or - that computed during construction (i.e. enclosing or outside) when the solutions are defined as unqualified with respect to the argument, or - GccEnt_noqualifier if the tangency argument is a point. Exceptions Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.
") WhichQualifier;
		void WhichQualifier(const int Index, GccEnt_Position & Qualif1);

};


%extend GccAna_Lin2dTanObl {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class GccAna_Lin2dTanPar *
***************************/
class GccAna_Lin2dTanPar {
	public:
		/****** GccAna_Lin2dTanPar::GccAna_Lin2dTanPar ******/
		/****** md5 signature: c881afbdd634f9df839fddb1eeb9ac71 ******/
		%feature("compactdefaultargs") GccAna_Lin2dTanPar;
		%feature("autodoc", "
Parameters
----------
ThePoint: gp_Pnt2d
Lin1: gp_Lin2d

Return
-------
None

Description
-----------
This method implements the algorithms used to create a 2d line passing through a point and parallel to another line.
") GccAna_Lin2dTanPar;
		 GccAna_Lin2dTanPar(const gp_Pnt2d & ThePoint, const gp_Lin2d & Lin1);

		/****** GccAna_Lin2dTanPar::GccAna_Lin2dTanPar ******/
		/****** md5 signature: 89c33b03f29a6a0f5a40629902b88bea ******/
		%feature("compactdefaultargs") GccAna_Lin2dTanPar;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Lin1: gp_Lin2d

Return
-------
None

Description
-----------
This method implements the algorithms used to create a 2d line tangent to a circle and parallel to another line. It raises BadQualifier in case of EnclosedCirc. Exceptions GccEnt_BadQualifier if a qualifier is inconsistent with the argument it qualifies (for example, enclosed for a circle).
") GccAna_Lin2dTanPar;
		 GccAna_Lin2dTanPar(const GccEnt_QualifiedCirc & Qualified1, const gp_Lin2d & Lin1);

		/****** GccAna_Lin2dTanPar::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the algorithm succeeded.
") IsDone;
		bool IsDone();

		/****** GccAna_Lin2dTanPar::NbSolutions ******/
		/****** md5 signature: 55162d50f2670468f6ab0d146e7a9b77 ******/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of solutions. Raises NotDone if the construction algorithm didn't succeed.
") NbSolutions;
		int NbSolutions();

		/****** GccAna_Lin2dTanPar::Tangency1 ******/
		/****** md5 signature: 61a43a29e2f90255ddc4af24e789a543 ******/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "
Parameters
----------
Index: int
Pnt: gp_Pnt2d

Return
-------
ParSol: double
ParArg: double

Description
-----------
Returns information about the tangency point between the result number Index and the first argument. ParSol is the intrinsic parameter of the point on the solution curv. ParArg is the intrinsic parameter of the point on the argument curv. ParArg is equal 0 when the solution is passing through a point. Raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions.
") Tangency1;
		void Tangency1(const int Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & Pnt);

		/****** GccAna_Lin2dTanPar::ThisSolution ******/
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
Returns the solution number Index and raises OutOfRange exception if Index is greater than the number of solutions. Be careful: the Index is only a way to get all the solutions, but is not associated to those outside the context of the algorithm-object. raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions.
") ThisSolution;
		gp_Lin2d ThisSolution(const int Index);

		/****** GccAna_Lin2dTanPar::WhichQualifier ******/
		/****** md5 signature: 4daf73703788dec976e70ecd6d32d56c ******/
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "
Parameters
----------
Index: int
Qualif1: GccEnt_Position

Return
-------
None

Description
-----------
Returns the information about the qualifiers of the tangency arguments concerning the solution number Index. It returns the real qualifiers (the qualifiers given to the constructor method in case of enclosed, enclosing and outside and the qualifiers computed in case of unqualified). Raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions.
") WhichQualifier;
		void WhichQualifier(const int Index, GccEnt_Position & Qualif1);

};


%extend GccAna_Lin2dTanPar {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class GccAna_Lin2dTanPer *
***************************/
class GccAna_Lin2dTanPer {
	public:
		/****** GccAna_Lin2dTanPer::GccAna_Lin2dTanPer ******/
		/****** md5 signature: f6bf9d44d3e72f4cec3042dce7defa9a ******/
		%feature("compactdefaultargs") GccAna_Lin2dTanPer;
		%feature("autodoc", "
Parameters
----------
ThePnt: gp_Pnt2d
TheLin: gp_Lin2d

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d lines passing through a point and perpendicular to a line.
") GccAna_Lin2dTanPer;
		 GccAna_Lin2dTanPer(const gp_Pnt2d & ThePnt, const gp_Lin2d & TheLin);

		/****** GccAna_Lin2dTanPer::GccAna_Lin2dTanPer ******/
		/****** md5 signature: 374b2546dad202788116acf69bed120f ******/
		%feature("compactdefaultargs") GccAna_Lin2dTanPer;
		%feature("autodoc", "
Parameters
----------
ThePnt: gp_Pnt2d
TheCircle: gp_Circ2d

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d lines passing through a point and perpendicular to a circle.
") GccAna_Lin2dTanPer;
		 GccAna_Lin2dTanPer(const gp_Pnt2d & ThePnt, const gp_Circ2d & TheCircle);

		/****** GccAna_Lin2dTanPer::GccAna_Lin2dTanPer ******/
		/****** md5 signature: 79faa2fb57bccb81e97ae06a99138b62 ******/
		%feature("compactdefaultargs") GccAna_Lin2dTanPer;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
TheLin: gp_Lin2d

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d lines tangent to a circle and perpendicular to a line.
") GccAna_Lin2dTanPer;
		 GccAna_Lin2dTanPer(const GccEnt_QualifiedCirc & Qualified1, const gp_Lin2d & TheLin);

		/****** GccAna_Lin2dTanPer::GccAna_Lin2dTanPer ******/
		/****** md5 signature: 6f6ba382cc8ec2155da6b36128c79d63 ******/
		%feature("compactdefaultargs") GccAna_Lin2dTanPer;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
TheCircle: gp_Circ2d

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d lines tangent to a circle and perpendicular to a circle.
") GccAna_Lin2dTanPer;
		 GccAna_Lin2dTanPer(const GccEnt_QualifiedCirc & Qualified1, const gp_Circ2d & TheCircle);

		/****** GccAna_Lin2dTanPer::Intersection2 ******/
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
Returns information about the intersection between the solution number Index and the second argument. It returns the first intersection in a case of Lin2dTanPer which is perpendicular to a circle . ParSol is the intrinsic parameter of the point on the solution curv. ParArg is the intrinsic parameter of the point on the argument curv. Raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions.
") Intersection2;
		void Intersection2(const int Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** GccAna_Lin2dTanPer::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the algorithm succeeded.
") IsDone;
		bool IsDone();

		/****** GccAna_Lin2dTanPer::NbSolutions ******/
		/****** md5 signature: 55162d50f2670468f6ab0d146e7a9b77 ******/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of solutions. Raises NotDone if the construction algorithm didn't succeed.
") NbSolutions;
		int NbSolutions();

		/****** GccAna_Lin2dTanPer::Tangency1 ******/
		/****** md5 signature: 61a43a29e2f90255ddc4af24e789a543 ******/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "
Parameters
----------
Index: int
Pnt: gp_Pnt2d

Return
-------
ParSol: double
ParArg: double

Description
-----------
Returns information about the tangency point between the result number Index and the first argument. ParSol is the intrinsic parameter of the point on the solution curv. ParArg is the intrinsic parameter of the point on the argument curv. If the first argument is a point ParArg is equal zero. raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions.
") Tangency1;
		void Tangency1(const int Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & Pnt);

		/****** GccAna_Lin2dTanPer::ThisSolution ******/
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
Returns the solution number Index and raises OutOfRange exception if Index is greater than the number of solutions. Be careful: the Index is only a way to get all the solutions, but is not associated to those outside the context of the algorithm-object. Raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions.
") ThisSolution;
		gp_Lin2d ThisSolution(const int Index);

		/****** GccAna_Lin2dTanPer::WhichQualifier ******/
		/****** md5 signature: 4daf73703788dec976e70ecd6d32d56c ******/
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "
Parameters
----------
Index: int
Qualif1: GccEnt_Position

Return
-------
None

Description
-----------
Returns the qualifier Qualif1 of the tangency argument for the solution of index Index computed by this algorithm. The returned qualifier is: - that specified at the start of construction when the solutions are defined as enclosing or outside with respect to the argument, or - that computed during construction (i.e. enclosing or outside) when the solutions are defined as unqualified with respect to the argument, or - GccEnt_noqualifier if the tangency argument is a point. Exceptions Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.
") WhichQualifier;
		void WhichQualifier(const int Index, GccEnt_Position & Qualif1);

};


%extend GccAna_Lin2dTanPer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class GccAna_LinPnt2dBisec *
*****************************/
class GccAna_LinPnt2dBisec {
	public:
		/****** GccAna_LinPnt2dBisec::GccAna_LinPnt2dBisec ******/
		/****** md5 signature: 9b8fb736653b04a51d78e905419cfbb4 ******/
		%feature("compactdefaultargs") GccAna_LinPnt2dBisec;
		%feature("autodoc", "
Parameters
----------
Line1: gp_Lin2d
Point2: gp_Pnt2d

Return
-------
None

Description
-----------
Constructs a bisecting curve between the line Line1 and the point Point2.
") GccAna_LinPnt2dBisec;
		 GccAna_LinPnt2dBisec(const gp_Lin2d & Line1, const gp_Pnt2d & Point2);

		/****** GccAna_LinPnt2dBisec::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the algorithm succeeded.
") IsDone;
		bool IsDone();

		/****** GccAna_LinPnt2dBisec::ThisSolution ******/
		/****** md5 signature: 638689030e006ab6b93f0c543a450e90 ******/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "Return
-------
opencascade::handle<GccInt_Bisec>

Description
-----------
Returns the number of solutions. It raises NotDone if the construction algorithm didn't succeed.
") ThisSolution;
		opencascade::handle<GccInt_Bisec> ThisSolution();

};


%extend GccAna_LinPnt2dBisec {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class GccAna_Pnt2dBisec *
**************************/
class GccAna_Pnt2dBisec {
	public:
		/****** GccAna_Pnt2dBisec::GccAna_Pnt2dBisec ******/
		/****** md5 signature: eb68fafde6440a59d787a34fe2c63f6b ******/
		%feature("compactdefaultargs") GccAna_Pnt2dBisec;
		%feature("autodoc", "
Parameters
----------
Point1: gp_Pnt2d
Point2: gp_Pnt2d

Return
-------
None

Description
-----------
Constructs a bisecting line between the points Point1 and Point2.
") GccAna_Pnt2dBisec;
		 GccAna_Pnt2dBisec(const gp_Pnt2d & Point1, const gp_Pnt2d & Point2);

		/****** GccAna_Pnt2dBisec::HasSolution ******/
		/****** md5 signature: 1da0a8810d0b60d25449dae8f12e9926 ******/
		%feature("compactdefaultargs") HasSolution;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this algorithm has a solution, i.e. if the two points are not coincident.
") HasSolution;
		bool HasSolution();

		/****** GccAna_Pnt2dBisec::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true (this construction algorithm never fails).
") IsDone;
		bool IsDone();

		/****** GccAna_Pnt2dBisec::ThisSolution ******/
		/****** md5 signature: 4236a79f3dec284a3f8c2579f4fda830 ******/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "Return
-------
gp_Lin2d

Description
-----------
Returns a line, representing the solution computed by this algorithm.
") ThisSolution;
		gp_Lin2d ThisSolution();

};


%extend GccAna_Pnt2dBisec {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
