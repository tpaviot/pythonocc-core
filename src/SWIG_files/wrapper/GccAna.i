/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_gccana.html"
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
		/****** md5 signature: 2bb407b705201ca59ce4bd554ff86388 ******/
		%feature("compactdefaultargs") GccAna_Circ2d2TanOn;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: GccEnt_QualifiedCirc
OnLine: gp_Lin2d
Tolerance: float

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to two 2d circles and having the center ON a 2d line.
") GccAna_Circ2d2TanOn;
		 GccAna_Circ2d2TanOn(const GccEnt_QualifiedCirc & Qualified1, const GccEnt_QualifiedCirc & Qualified2, const gp_Lin2d & OnLine, const Standard_Real Tolerance);

		/****** GccAna_Circ2d2TanOn::GccAna_Circ2d2TanOn ******/
		/****** md5 signature: 5def6677f4aec59bad70d0df9457da51 ******/
		%feature("compactdefaultargs") GccAna_Circ2d2TanOn;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: GccEnt_QualifiedLin
OnLine: gp_Lin2d
Tolerance: float

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to a 2d circle and a 2d line having the center ON a 2d line.
") GccAna_Circ2d2TanOn;
		 GccAna_Circ2d2TanOn(const GccEnt_QualifiedCirc & Qualified1, const GccEnt_QualifiedLin & Qualified2, const gp_Lin2d & OnLine, const Standard_Real Tolerance);

		/****** GccAna_Circ2d2TanOn::GccAna_Circ2d2TanOn ******/
		/****** md5 signature: 9a62877d73b4b4e5824de0187aeef2d4 ******/
		%feature("compactdefaultargs") GccAna_Circ2d2TanOn;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedLin
Qualified2: GccEnt_QualifiedLin
OnLine: gp_Lin2d
Tolerance: float

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to two 2d lines having the center ON a 2d line.
") GccAna_Circ2d2TanOn;
		 GccAna_Circ2d2TanOn(const GccEnt_QualifiedLin & Qualified1, const GccEnt_QualifiedLin & Qualified2, const gp_Lin2d & OnLine, const Standard_Real Tolerance);

		/****** GccAna_Circ2d2TanOn::GccAna_Circ2d2TanOn ******/
		/****** md5 signature: acf69d81e985b79442aeda8f2ff23e8d ******/
		%feature("compactdefaultargs") GccAna_Circ2d2TanOn;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Point2: gp_Pnt2d
OnLine: gp_Lin2d
Tolerance: float

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to a 2d circle and a point having the center ON a 2d line.
") GccAna_Circ2d2TanOn;
		 GccAna_Circ2d2TanOn(const GccEnt_QualifiedCirc & Qualified1, const gp_Pnt2d & Point2, const gp_Lin2d & OnLine, const Standard_Real Tolerance);

		/****** GccAna_Circ2d2TanOn::GccAna_Circ2d2TanOn ******/
		/****** md5 signature: 8cf98517f5e62cf59d7cb2c2723556ea ******/
		%feature("compactdefaultargs") GccAna_Circ2d2TanOn;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedLin
Point2: gp_Pnt2d
OnLine: gp_Lin2d
Tolerance: float

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to a 2d line and a point having the center ON a 2d line.
") GccAna_Circ2d2TanOn;
		 GccAna_Circ2d2TanOn(const GccEnt_QualifiedLin & Qualified1, const gp_Pnt2d & Point2, const gp_Lin2d & OnLine, const Standard_Real Tolerance);

		/****** GccAna_Circ2d2TanOn::GccAna_Circ2d2TanOn ******/
		/****** md5 signature: 105e7c8b0cb49ccab4e2dbde93a93250 ******/
		%feature("compactdefaultargs") GccAna_Circ2d2TanOn;
		%feature("autodoc", "
Parameters
----------
Point1: gp_Pnt2d
Point2: gp_Pnt2d
OnLine: gp_Lin2d
Tolerance: float

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to two points having the center ON a 2d line.
") GccAna_Circ2d2TanOn;
		 GccAna_Circ2d2TanOn(const gp_Pnt2d & Point1, const gp_Pnt2d & Point2, const gp_Lin2d & OnLine, const Standard_Real Tolerance);

		/****** GccAna_Circ2d2TanOn::GccAna_Circ2d2TanOn ******/
		/****** md5 signature: 0e3b23d9de8043707121d2a6930d4233 ******/
		%feature("compactdefaultargs") GccAna_Circ2d2TanOn;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: GccEnt_QualifiedCirc
OnCirc: gp_Circ2d
Tolerance: float

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to two 2d circles and having the center ON a 2d circle.
") GccAna_Circ2d2TanOn;
		 GccAna_Circ2d2TanOn(const GccEnt_QualifiedCirc & Qualified1, const GccEnt_QualifiedCirc & Qualified2, const gp_Circ2d & OnCirc, const Standard_Real Tolerance);

		/****** GccAna_Circ2d2TanOn::GccAna_Circ2d2TanOn ******/
		/****** md5 signature: d27b643265e960dd8e3a70d8d6c334e2 ******/
		%feature("compactdefaultargs") GccAna_Circ2d2TanOn;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: GccEnt_QualifiedLin
OnCirc: gp_Circ2d
Tolerance: float

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to a circle and a line having the center ON a 2d circle.
") GccAna_Circ2d2TanOn;
		 GccAna_Circ2d2TanOn(const GccEnt_QualifiedCirc & Qualified1, const GccEnt_QualifiedLin & Qualified2, const gp_Circ2d & OnCirc, const Standard_Real Tolerance);

		/****** GccAna_Circ2d2TanOn::GccAna_Circ2d2TanOn ******/
		/****** md5 signature: 5fa57362f351ae9e64f160872655649c ******/
		%feature("compactdefaultargs") GccAna_Circ2d2TanOn;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Point2: gp_Pnt2d
OnCirc: gp_Circ2d
Tolerance: float

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to a circle and a point having the center ON a 2d circle.
") GccAna_Circ2d2TanOn;
		 GccAna_Circ2d2TanOn(const GccEnt_QualifiedCirc & Qualified1, const gp_Pnt2d & Point2, const gp_Circ2d & OnCirc, const Standard_Real Tolerance);

		/****** GccAna_Circ2d2TanOn::GccAna_Circ2d2TanOn ******/
		/****** md5 signature: 0c4b413c8c48272452690f99eab7398e ******/
		%feature("compactdefaultargs") GccAna_Circ2d2TanOn;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedLin
Qualified2: GccEnt_QualifiedLin
OnCirc: gp_Circ2d
Tolerance: float

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to two 2d lines having the center ON a 2d circle.
") GccAna_Circ2d2TanOn;
		 GccAna_Circ2d2TanOn(const GccEnt_QualifiedLin & Qualified1, const GccEnt_QualifiedLin & Qualified2, const gp_Circ2d & OnCirc, const Standard_Real Tolerance);

		/****** GccAna_Circ2d2TanOn::GccAna_Circ2d2TanOn ******/
		/****** md5 signature: ced21bdfc5e50bcf8fd5c14ab7dad344 ******/
		%feature("compactdefaultargs") GccAna_Circ2d2TanOn;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedLin
Point2: gp_Pnt2d
OnCirc: gp_Circ2d
Tolerance: float

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to a line and a point having the center ON a 2d circle.
") GccAna_Circ2d2TanOn;
		 GccAna_Circ2d2TanOn(const GccEnt_QualifiedLin & Qualified1, const gp_Pnt2d & Point2, const gp_Circ2d & OnCirc, const Standard_Real Tolerance);

		/****** GccAna_Circ2d2TanOn::GccAna_Circ2d2TanOn ******/
		/****** md5 signature: 6ff7022cad2a36a011fcb377367c18ff ******/
		%feature("compactdefaultargs") GccAna_Circ2d2TanOn;
		%feature("autodoc", "
Parameters
----------
Point1: gp_Pnt2d
Point2: gp_Pnt2d
OnCirc: gp_Circ2d
Tolerance: float

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to two points having the center ON a 2d circle.
") GccAna_Circ2d2TanOn;
		 GccAna_Circ2d2TanOn(const gp_Pnt2d & Point1, const gp_Pnt2d & Point2, const gp_Circ2d & OnCirc, const Standard_Real Tolerance);

		/****** GccAna_Circ2d2TanOn::CenterOn3 ******/
		/****** md5 signature: b84288e9132f5c4ac31073a7171b086e ******/
		%feature("compactdefaultargs") CenterOn3;
		%feature("autodoc", "
Parameters
----------
Index: int
PntArg: gp_Pnt2d

Return
-------
ParArg: float

Description
-----------
Returns the information about the center (on the curv) of the result number Index and the third argument. ParArg is the intrinsic parameter of the point PntArg on the third argument. Exceptions Standard_OutOfRange if Index is less than zero or greater than the number of solutions computed by this algorithm. StdFail_NotDone if the construction fails.
") CenterOn3;
		void CenterOn3(const Standard_Integer Index, Standard_Real &OutValue, gp_Pnt2d & PntArg);

		/****** GccAna_Circ2d2TanOn::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the construction algorithm does not fail (even if it finds no solution). Note: IsDone protects against a failure arising from a more internal intersection algorithm, which has reached its numeric limits.
") IsDone;
		Standard_Boolean IsDone();

		/****** GccAna_Circ2d2TanOn::IsTheSame1 ******/
		/****** md5 signature: a8b1c8a0e7512c619b1f66f2bb9e39a6 ******/
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
		Standard_Boolean IsTheSame1(const Standard_Integer Index);

		/****** GccAna_Circ2d2TanOn::IsTheSame2 ******/
		/****** md5 signature: a9dd3589d0d4332d52c7b28a62c5e764 ******/
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
		Standard_Boolean IsTheSame2(const Standard_Integer Index);

		/****** GccAna_Circ2d2TanOn::NbSolutions ******/
		/****** md5 signature: 02fdbddb1f7eff080419f602203d8f8b ******/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of circles, representing solutions computed by this algorithm. Exceptions StdFail_NotDone if the construction fails.
") NbSolutions;
		Standard_Integer NbSolutions();

		/****** GccAna_Circ2d2TanOn::Tangency1 ******/
		/****** md5 signature: 2560a863e327c3fcf6bbfde26d55fd79 ******/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "
Parameters
----------
Index: int
PntSol: gp_Pnt2d

Return
-------
ParSol: float
ParArg: float

Description
-----------
Returns the information about the tangency point between the result number Index and the first argument. ParSol is the intrinsic parameter of the point PntSol on the solution ParArg is the intrinsic parameter of the point PntSol on the first argument. Raises OutOfRange if Index is greater than the number of solutions and NotDone if IsDone returns false.
") Tangency1;
		void Tangency1(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** GccAna_Circ2d2TanOn::Tangency2 ******/
		/****** md5 signature: aa2c229192467eeb8e5b8843ab43ae52 ******/
		%feature("compactdefaultargs") Tangency2;
		%feature("autodoc", "
Parameters
----------
Index: int
PntSol: gp_Pnt2d

Return
-------
ParSol: float
ParArg: float

Description
-----------
Returns the information about the tangency point between the result number Index and the second argument. ParSol is the intrinsic parameter of the point PntSol on the solution. ParArg is the intrinsic parameter of the point PntSol on the second argument. Raises OutOfRange if Index is greater than the number of solutions and NotDone if IsDone returns false.
") Tangency2;
		void Tangency2(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** GccAna_Circ2d2TanOn::ThisSolution ******/
		/****** md5 signature: 6411fa8d68e628aba08bd186d18a6e49 ******/
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
		gp_Circ2d ThisSolution(const Standard_Integer Index);

		/****** GccAna_Circ2d2TanOn::WhichQualifier ******/
		/****** md5 signature: 6aa541a02c7988b37a04a532d9174284 ******/
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
		void WhichQualifier(const Standard_Integer Index, GccEnt_Position & Qualif1, GccEnt_Position & Qualif2);

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
		/****** md5 signature: 03077fcb00dbd29830a11717606ebbc9 ******/
		%feature("compactdefaultargs") GccAna_Circ2d2TanRad;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: GccEnt_QualifiedCirc
Radius: float
Tolerance: float

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to two 2d circle with a radius of Radius. It raises NegativeValue if Radius is lower than zero.
") GccAna_Circ2d2TanRad;
		 GccAna_Circ2d2TanRad(const GccEnt_QualifiedCirc & Qualified1, const GccEnt_QualifiedCirc & Qualified2, const Standard_Real Radius, const Standard_Real Tolerance);

		/****** GccAna_Circ2d2TanRad::GccAna_Circ2d2TanRad ******/
		/****** md5 signature: defd8a0e3d243ea2573630102c9f56c6 ******/
		%feature("compactdefaultargs") GccAna_Circ2d2TanRad;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: GccEnt_QualifiedLin
Radius: float
Tolerance: float

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to a 2d circle and a 2d line with a radius of Radius. It raises NegativeValue if Radius is lower than zero.
") GccAna_Circ2d2TanRad;
		 GccAna_Circ2d2TanRad(const GccEnt_QualifiedCirc & Qualified1, const GccEnt_QualifiedLin & Qualified2, const Standard_Real Radius, const Standard_Real Tolerance);

		/****** GccAna_Circ2d2TanRad::GccAna_Circ2d2TanRad ******/
		/****** md5 signature: 995f0517daea11068d2d34ac400c40c9 ******/
		%feature("compactdefaultargs") GccAna_Circ2d2TanRad;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Point2: gp_Pnt2d
Radius: float
Tolerance: float

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to a 2d circle and a point with a radius of Radius. It raises NegativeValue if Radius is lower than zero.
") GccAna_Circ2d2TanRad;
		 GccAna_Circ2d2TanRad(const GccEnt_QualifiedCirc & Qualified1, const gp_Pnt2d & Point2, const Standard_Real Radius, const Standard_Real Tolerance);

		/****** GccAna_Circ2d2TanRad::GccAna_Circ2d2TanRad ******/
		/****** md5 signature: 084258399311d7af760c1a0ca8ee3acd ******/
		%feature("compactdefaultargs") GccAna_Circ2d2TanRad;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedLin
Point2: gp_Pnt2d
Radius: float
Tolerance: float

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to a 2d line and a point with a radius of Radius. It raises NegativeValue if Radius is lower than zero.
") GccAna_Circ2d2TanRad;
		 GccAna_Circ2d2TanRad(const GccEnt_QualifiedLin & Qualified1, const gp_Pnt2d & Point2, const Standard_Real Radius, const Standard_Real Tolerance);

		/****** GccAna_Circ2d2TanRad::GccAna_Circ2d2TanRad ******/
		/****** md5 signature: 4eb59f8709f9fe2bced34d1847a99932 ******/
		%feature("compactdefaultargs") GccAna_Circ2d2TanRad;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedLin
Qualified2: GccEnt_QualifiedLin
Radius: float
Tolerance: float

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles TANgent to two 2d lines with a radius of Radius. It raises NegativeValue if Radius is lower than zero.
") GccAna_Circ2d2TanRad;
		 GccAna_Circ2d2TanRad(const GccEnt_QualifiedLin & Qualified1, const GccEnt_QualifiedLin & Qualified2, const Standard_Real Radius, const Standard_Real Tolerance);

		/****** GccAna_Circ2d2TanRad::GccAna_Circ2d2TanRad ******/
		/****** md5 signature: 204510de7d84946246be3ee05fc5cfc9 ******/
		%feature("compactdefaultargs") GccAna_Circ2d2TanRad;
		%feature("autodoc", "
Parameters
----------
Point1: gp_Pnt2d
Point2: gp_Pnt2d
Radius: float
Tolerance: float

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles passing through two points with a radius of Radius. It raises NegativeValue if Radius is lower than zero.
") GccAna_Circ2d2TanRad;
		 GccAna_Circ2d2TanRad(const gp_Pnt2d & Point1, const gp_Pnt2d & Point2, const Standard_Real Radius, const Standard_Real Tolerance);

		/****** GccAna_Circ2d2TanRad::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
This method returns True if the algorithm succeeded. Note: IsDone protects against a failure arising from a more internal intersection algorithm, which has reached its numeric limits.
") IsDone;
		Standard_Boolean IsDone();

		/****** GccAna_Circ2d2TanRad::IsTheSame1 ******/
		/****** md5 signature: a8b1c8a0e7512c619b1f66f2bb9e39a6 ******/
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
		Standard_Boolean IsTheSame1(const Standard_Integer Index);

		/****** GccAna_Circ2d2TanRad::IsTheSame2 ******/
		/****** md5 signature: a9dd3589d0d4332d52c7b28a62c5e764 ******/
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
		Standard_Boolean IsTheSame2(const Standard_Integer Index);

		/****** GccAna_Circ2d2TanRad::NbSolutions ******/
		/****** md5 signature: 02fdbddb1f7eff080419f602203d8f8b ******/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Return
-------
int

Description
-----------
This method returns the number of circles, representing solutions computed by this algorithm. Exceptions StdFail_NotDone if the construction fails. of solutions.
") NbSolutions;
		Standard_Integer NbSolutions();

		/****** GccAna_Circ2d2TanRad::Tangency1 ******/
		/****** md5 signature: 2560a863e327c3fcf6bbfde26d55fd79 ******/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "
Parameters
----------
Index: int
PntSol: gp_Pnt2d

Return
-------
ParSol: float
ParArg: float

Description
-----------
Returns information about the tangency point between the result number Index and the first argument. ParSol is the intrinsic parameter of the point PntSol on the solution. ParArg is the intrinsic parameter of the point PntSol on the first argument. Raises OutOfRange if Index is greater than the number of solutions. It raises NotDone if the construction algorithm did not succeed.
") Tangency1;
		void Tangency1(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** GccAna_Circ2d2TanRad::Tangency2 ******/
		/****** md5 signature: aa2c229192467eeb8e5b8843ab43ae52 ******/
		%feature("compactdefaultargs") Tangency2;
		%feature("autodoc", "
Parameters
----------
Index: int
PntSol: gp_Pnt2d

Return
-------
ParSol: float
ParArg: float

Description
-----------
Returns information about the tangency point between the result number Index and the second argument. ParSol is the intrinsic parameter of the point PntSol on the solution. ParArg is the intrinsic parameter of the point PntArg on the second argument. Raises OutOfRange if Index is greater than the number of solutions. It raises NotDone if the construction algorithm did not succeed.
") Tangency2;
		void Tangency2(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** GccAna_Circ2d2TanRad::ThisSolution ******/
		/****** md5 signature: 6411fa8d68e628aba08bd186d18a6e49 ******/
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
		gp_Circ2d ThisSolution(const Standard_Integer Index);

		/****** GccAna_Circ2d2TanRad::WhichQualifier ******/
		/****** md5 signature: 6aa541a02c7988b37a04a532d9174284 ******/
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
		void WhichQualifier(const Standard_Integer Index, GccEnt_Position & Qualif1, GccEnt_Position & Qualif2);

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
		/****** md5 signature: f8f964b76b262dd3502e96072de8f300 ******/
		%feature("compactdefaultargs") GccAna_Circ2d3Tan;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: GccEnt_QualifiedCirc
Qualified3: GccEnt_QualifiedCirc
Tolerance: float

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles tangent to 3 circles. ConstructionError is raised if there is a problem during the computation.
") GccAna_Circ2d3Tan;
		 GccAna_Circ2d3Tan(const GccEnt_QualifiedCirc & Qualified1, const GccEnt_QualifiedCirc & Qualified2, const GccEnt_QualifiedCirc & Qualified3, const Standard_Real Tolerance);

		/****** GccAna_Circ2d3Tan::GccAna_Circ2d3Tan ******/
		/****** md5 signature: b47db5ce4e480ee56f0abf606eb1c531 ******/
		%feature("compactdefaultargs") GccAna_Circ2d3Tan;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: GccEnt_QualifiedCirc
Qualified3: GccEnt_QualifiedLin
Tolerance: float

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles tangent to 2 circles and 1 line. ConstructionError is raised if there is a problem during the computation.
") GccAna_Circ2d3Tan;
		 GccAna_Circ2d3Tan(const GccEnt_QualifiedCirc & Qualified1, const GccEnt_QualifiedCirc & Qualified2, const GccEnt_QualifiedLin & Qualified3, const Standard_Real Tolerance);

		/****** GccAna_Circ2d3Tan::GccAna_Circ2d3Tan ******/
		/****** md5 signature: b857ac02330208f7df1f0570716465e0 ******/
		%feature("compactdefaultargs") GccAna_Circ2d3Tan;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: GccEnt_QualifiedLin
Qualified3: GccEnt_QualifiedLin
Tolerance: float

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles tangent to 1 circle and 2 lines. ConstructionError is raised if there is a problem during the computation.
") GccAna_Circ2d3Tan;
		 GccAna_Circ2d3Tan(const GccEnt_QualifiedCirc & Qualified1, const GccEnt_QualifiedLin & Qualified2, const GccEnt_QualifiedLin & Qualified3, const Standard_Real Tolerance);

		/****** GccAna_Circ2d3Tan::GccAna_Circ2d3Tan ******/
		/****** md5 signature: 1769efb935d0c72a05740f6fd5eca73e ******/
		%feature("compactdefaultargs") GccAna_Circ2d3Tan;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedLin
Qualified2: GccEnt_QualifiedLin
Qualified3: GccEnt_QualifiedLin
Tolerance: float

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles tangent to 3 lines. ConstructionError is raised if there is a problem during the computation.
") GccAna_Circ2d3Tan;
		 GccAna_Circ2d3Tan(const GccEnt_QualifiedLin & Qualified1, const GccEnt_QualifiedLin & Qualified2, const GccEnt_QualifiedLin & Qualified3, const Standard_Real Tolerance);

		/****** GccAna_Circ2d3Tan::GccAna_Circ2d3Tan ******/
		/****** md5 signature: dc951ea641df0a66e216323a4f8d01d5 ******/
		%feature("compactdefaultargs") GccAna_Circ2d3Tan;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: GccEnt_QualifiedCirc
Point3: gp_Pnt2d
Tolerance: float

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles tangent to 2 circles and 1 Point. ConstructionError is raised if there is a problem during the computation.
") GccAna_Circ2d3Tan;
		 GccAna_Circ2d3Tan(const GccEnt_QualifiedCirc & Qualified1, const GccEnt_QualifiedCirc & Qualified2, const gp_Pnt2d & Point3, const Standard_Real Tolerance);

		/****** GccAna_Circ2d3Tan::GccAna_Circ2d3Tan ******/
		/****** md5 signature: 75533fa6c57a0d7ed4bd8e199bda37d7 ******/
		%feature("compactdefaultargs") GccAna_Circ2d3Tan;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: GccEnt_QualifiedLin
Point3: gp_Pnt2d
Tolerance: float

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles tangent to a circle and a line and 1 Point. ConstructionError is raised if there is a problem during the computation.
") GccAna_Circ2d3Tan;
		 GccAna_Circ2d3Tan(const GccEnt_QualifiedCirc & Qualified1, const GccEnt_QualifiedLin & Qualified2, const gp_Pnt2d & Point3, const Standard_Real Tolerance);

		/****** GccAna_Circ2d3Tan::GccAna_Circ2d3Tan ******/
		/****** md5 signature: dbf10928c370bfa25ce4019474bb8f53 ******/
		%feature("compactdefaultargs") GccAna_Circ2d3Tan;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedLin
Qualified2: GccEnt_QualifiedLin
Point3: gp_Pnt2d
Tolerance: float

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles tangent to 2 lines and 1 Point. ConstructionError is raised if there is a problem during the computation.
") GccAna_Circ2d3Tan;
		 GccAna_Circ2d3Tan(const GccEnt_QualifiedLin & Qualified1, const GccEnt_QualifiedLin & Qualified2, const gp_Pnt2d & Point3, const Standard_Real Tolerance);

		/****** GccAna_Circ2d3Tan::GccAna_Circ2d3Tan ******/
		/****** md5 signature: ccacbacc59448541d378a070840f3b7a ******/
		%feature("compactdefaultargs") GccAna_Circ2d3Tan;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Point2: gp_Pnt2d
Point3: gp_Pnt2d
Tolerance: float

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles tangent to a circle and passing through 2 Points. ConstructionError is raised if there is a problem during the computation.
") GccAna_Circ2d3Tan;
		 GccAna_Circ2d3Tan(const GccEnt_QualifiedCirc & Qualified1, const gp_Pnt2d & Point2, const gp_Pnt2d & Point3, const Standard_Real Tolerance);

		/****** GccAna_Circ2d3Tan::GccAna_Circ2d3Tan ******/
		/****** md5 signature: c4207c6b3d25b5c4cb5841f1daf562df ******/
		%feature("compactdefaultargs") GccAna_Circ2d3Tan;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedLin
Point2: gp_Pnt2d
Point3: gp_Pnt2d
Tolerance: float

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles tangent to a line and passing through 2 Points. ConstructionError is raised if there is a problem during the computation.
") GccAna_Circ2d3Tan;
		 GccAna_Circ2d3Tan(const GccEnt_QualifiedLin & Qualified1, const gp_Pnt2d & Point2, const gp_Pnt2d & Point3, const Standard_Real Tolerance);

		/****** GccAna_Circ2d3Tan::GccAna_Circ2d3Tan ******/
		/****** md5 signature: 4ae692732419aa36f01019d6400237da ******/
		%feature("compactdefaultargs") GccAna_Circ2d3Tan;
		%feature("autodoc", "
Parameters
----------
Point1: gp_Pnt2d
Point2: gp_Pnt2d
Point3: gp_Pnt2d
Tolerance: float

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles passing through 3 Points. ConstructionError is raised if there is a problem during the computation.
") GccAna_Circ2d3Tan;
		 GccAna_Circ2d3Tan(const gp_Pnt2d & Point1, const gp_Pnt2d & Point2, const gp_Pnt2d & Point3, const Standard_Real Tolerance);

		/****** GccAna_Circ2d3Tan::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
This method returns True if the construction algorithm succeeded. Note: IsDone protects against a failure arising from a more internal intersection algorithm, which has reached its numeric limits.
") IsDone;
		Standard_Boolean IsDone();

		/****** GccAna_Circ2d3Tan::IsTheSame1 ******/
		/****** md5 signature: a8b1c8a0e7512c619b1f66f2bb9e39a6 ******/
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
		Standard_Boolean IsTheSame1(const Standard_Integer Index);

		/****** GccAna_Circ2d3Tan::IsTheSame2 ******/
		/****** md5 signature: a9dd3589d0d4332d52c7b28a62c5e764 ******/
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
		Standard_Boolean IsTheSame2(const Standard_Integer Index);

		/****** GccAna_Circ2d3Tan::IsTheSame3 ******/
		/****** md5 signature: a1a8ddd14236690538e70195d30d31e9 ******/
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
		Standard_Boolean IsTheSame3(const Standard_Integer Index);

		/****** GccAna_Circ2d3Tan::NbSolutions ******/
		/****** md5 signature: 02fdbddb1f7eff080419f602203d8f8b ******/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Return
-------
int

Description
-----------
This method returns the number of solutions. Raises NotDone if the construction algorithm didn't succeed.
") NbSolutions;
		Standard_Integer NbSolutions();

		/****** GccAna_Circ2d3Tan::Tangency1 ******/
		/****** md5 signature: 2560a863e327c3fcf6bbfde26d55fd79 ******/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "
Parameters
----------
Index: int
PntSol: gp_Pnt2d

Return
-------
ParSol: float
ParArg: float

Description
-----------
Returns information about the tangency point between the result number Index and the first argument. ParSol is the intrinsic parameter of the point PntSol on the solution curv. ParArg is the intrinsic parameter of the point PntArg on the argument curv. Raises OutOfRange if Index is greater than the number of solutions. It raises NotDone if the algorithm failed.
") Tangency1;
		void Tangency1(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** GccAna_Circ2d3Tan::Tangency2 ******/
		/****** md5 signature: aa2c229192467eeb8e5b8843ab43ae52 ******/
		%feature("compactdefaultargs") Tangency2;
		%feature("autodoc", "
Parameters
----------
Index: int
PntSol: gp_Pnt2d

Return
-------
ParSol: float
ParArg: float

Description
-----------
Returns information about the tangency point between the result number Index and the first argument. ParSol is the intrinsic parameter of the point PntSol on the solution curv. ParArg is the intrinsic parameter of the point Pntsol on the argument curv. Raises OutOfRange if Index is greater than the number of solutions. It raises NotDone if the algorithm failed.
") Tangency2;
		void Tangency2(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** GccAna_Circ2d3Tan::Tangency3 ******/
		/****** md5 signature: 0aa5ec0c7341ae28374df63d96d61594 ******/
		%feature("compactdefaultargs") Tangency3;
		%feature("autodoc", "
Parameters
----------
Index: int
PntSol: gp_Pnt2d

Return
-------
ParSol: float
ParArg: float

Description
-----------
Returns information about the tangency point between the result number Index and the first argument. ParSol is the intrinsic parameter of the point PntSol on the solution curv. ParArg is the intrinsic parameter of the point Pntsol on the argument curv. Raises OutOfRange if Index is greater than the number of solutions. It raises NotDone if the algorithm failed.
") Tangency3;
		void Tangency3(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** GccAna_Circ2d3Tan::ThisSolution ******/
		/****** md5 signature: 6411fa8d68e628aba08bd186d18a6e49 ******/
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
		gp_Circ2d ThisSolution(const Standard_Integer Index);

		/****** GccAna_Circ2d3Tan::WhichQualifier ******/
		/****** md5 signature: a7c8640b1f68ed172a2307977dbf7e77 ******/
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
		void WhichQualifier(const Standard_Integer Index, GccEnt_Position & Qualif1, GccEnt_Position & Qualif2, GccEnt_Position & Qualif3);

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
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
This method returns True if the construction algorithm succeeded.
") IsDone;
		Standard_Boolean IsDone();

		/****** GccAna_Circ2dBisec::NbSolutions ******/
		/****** md5 signature: 02fdbddb1f7eff080419f602203d8f8b ******/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Return
-------
int

Description
-----------
This method returns the number of solutions. Raises NotDone if the construction algorithm didn't succeed.
") NbSolutions;
		Standard_Integer NbSolutions();

		/****** GccAna_Circ2dBisec::ThisSolution ******/
		/****** md5 signature: 6df4cf8ad902f791256b807b0a0d0bd3 ******/
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
		opencascade::handle<GccInt_Bisec> ThisSolution(const Standard_Integer Index);

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
		/****** md5 signature: 03c76e41d4f72341c199827d05a5de1f ******/
		%feature("compactdefaultargs") GccAna_Circ2dTanCen;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Pcenter: gp_Pnt2d
Tolerance: float

Return
-------
None

Description
-----------
This method implements the algorithms used to create 2d circles tangent to a circle and centered on a point.
") GccAna_Circ2dTanCen;
		 GccAna_Circ2dTanCen(const GccEnt_QualifiedCirc & Qualified1, const gp_Pnt2d & Pcenter, const Standard_Real Tolerance);

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
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
This method returns True if the construction algorithm succeeded. Note: IsDone protects against a failure arising from a more internal intersection algorithm, which has reached its numeric limits.
") IsDone;
		Standard_Boolean IsDone();

		/****** GccAna_Circ2dTanCen::IsTheSame1 ******/
		/****** md5 signature: a8b1c8a0e7512c619b1f66f2bb9e39a6 ******/
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
		Standard_Boolean IsTheSame1(const Standard_Integer Index);

		/****** GccAna_Circ2dTanCen::NbSolutions ******/
		/****** md5 signature: 02fdbddb1f7eff080419f602203d8f8b ******/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of circles, representing solutions computed by this algorithm and raises NotDone exception if the algorithm didn't succeed.
") NbSolutions;
		Standard_Integer NbSolutions();

		/****** GccAna_Circ2dTanCen::Tangency1 ******/
		/****** md5 signature: 2560a863e327c3fcf6bbfde26d55fd79 ******/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "
Parameters
----------
Index: int
PntSol: gp_Pnt2d

Return
-------
ParSol: float
ParArg: float

Description
-----------
Returns information about the tangency point between the result number Index and the first argument. ParSol is the intrinsic parameter of the point PntSol on the solution curv. ParArg is the intrinsic parameter of the point PntArg on the argument curv. It raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions or less than zero.
") Tangency1;
		void Tangency1(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** GccAna_Circ2dTanCen::ThisSolution ******/
		/****** md5 signature: 6411fa8d68e628aba08bd186d18a6e49 ******/
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
		gp_Circ2d ThisSolution(const Standard_Integer Index);

		/****** GccAna_Circ2dTanCen::WhichQualifier ******/
		/****** md5 signature: 0ea2282c206094fba20eed9ca0e0787e ******/
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
		void WhichQualifier(const Standard_Integer Index, GccEnt_Position & Qualif1);

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
		/****** md5 signature: 4882ea5baf21191b2ba2e703d01cf447 ******/
		%feature("compactdefaultargs") GccAna_Circ2dTanOnRad;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
OnLine: gp_Lin2d
Radius: float
Tolerance: float

Return
-------
None

Description
-----------
This methods implements the algorithms used to create 2d Circles tangent to a circle and centered on a 2d Line with a given radius. Tolerance is used to find solution in every limit cases. For example Tolerance is used in the case of EnclosedCirc when Radius-R1+dist is greater Tolerance (dist is the distance between the line and the location of the circ, R1 is the radius of the circ) because there is no solution. raises NegativeValue in case of NegativeRadius.
") GccAna_Circ2dTanOnRad;
		 GccAna_Circ2dTanOnRad(const GccEnt_QualifiedCirc & Qualified1, const gp_Lin2d & OnLine, const Standard_Real Radius, const Standard_Real Tolerance);

		/****** GccAna_Circ2dTanOnRad::GccAna_Circ2dTanOnRad ******/
		/****** md5 signature: ed4bc844f130aac757078b640cf23b1b ******/
		%feature("compactdefaultargs") GccAna_Circ2dTanOnRad;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedLin
OnLine: gp_Lin2d
Radius: float
Tolerance: float

Return
-------
None

Description
-----------
This methods implements the algorithms used to create 2d Circles tangent to a 2d Line and centered on a 2d Line with a given radius. Tolerance is used to find solution in every limit cases. raises NegativeValue in case of NegativeRadius.
") GccAna_Circ2dTanOnRad;
		 GccAna_Circ2dTanOnRad(const GccEnt_QualifiedLin & Qualified1, const gp_Lin2d & OnLine, const Standard_Real Radius, const Standard_Real Tolerance);

		/****** GccAna_Circ2dTanOnRad::GccAna_Circ2dTanOnRad ******/
		/****** md5 signature: 5b31fba2332b509ab5d356b81ce6ad80 ******/
		%feature("compactdefaultargs") GccAna_Circ2dTanOnRad;
		%feature("autodoc", "
Parameters
----------
Point1: gp_Pnt2d
OnLine: gp_Lin2d
Radius: float
Tolerance: float

Return
-------
None

Description
-----------
This methods implements the algorithms used to create 2d Circles passing through a 2d Point and centered on a 2d Line with a given radius. Tolerance is used to find solution in every limit cases.
") GccAna_Circ2dTanOnRad;
		 GccAna_Circ2dTanOnRad(const gp_Pnt2d & Point1, const gp_Lin2d & OnLine, const Standard_Real Radius, const Standard_Real Tolerance);

		/****** GccAna_Circ2dTanOnRad::GccAna_Circ2dTanOnRad ******/
		/****** md5 signature: e8d7337627d1ad5d1958c99be3fa1864 ******/
		%feature("compactdefaultargs") GccAna_Circ2dTanOnRad;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
OnCirc: gp_Circ2d
Radius: float
Tolerance: float

Return
-------
None

Description
-----------
This methods implements the algorithms used to create 2d Circles tangent to a circle and centered on a 2d Circle with a given radius. Tolerance is used to find solution in every limit cases. raises NegativeValue in case of NegativeRadius.
") GccAna_Circ2dTanOnRad;
		 GccAna_Circ2dTanOnRad(const GccEnt_QualifiedCirc & Qualified1, const gp_Circ2d & OnCirc, const Standard_Real Radius, const Standard_Real Tolerance);

		/****** GccAna_Circ2dTanOnRad::GccAna_Circ2dTanOnRad ******/
		/****** md5 signature: 4543d38f3dfd1c21786ad3aa4124e44d ******/
		%feature("compactdefaultargs") GccAna_Circ2dTanOnRad;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedLin
OnCirc: gp_Circ2d
Radius: float
Tolerance: float

Return
-------
None

Description
-----------
This methods implements the algorithms used to create 2d Circles tangent to a 2d Line and centered on a 2d Line with a given radius. Tolerance is used to find solution in every limit cases. raises NegativeValue in case of NegativeRadius.
") GccAna_Circ2dTanOnRad;
		 GccAna_Circ2dTanOnRad(const GccEnt_QualifiedLin & Qualified1, const gp_Circ2d & OnCirc, const Standard_Real Radius, const Standard_Real Tolerance);

		/****** GccAna_Circ2dTanOnRad::GccAna_Circ2dTanOnRad ******/
		/****** md5 signature: cca05e8ffec318c54b70c2428c935206 ******/
		%feature("compactdefaultargs") GccAna_Circ2dTanOnRad;
		%feature("autodoc", "
Parameters
----------
Point1: gp_Pnt2d
OnCirc: gp_Circ2d
Radius: float
Tolerance: float

Return
-------
None

Description
-----------
This methods implements the algorithms used to create 2d Circles passing through a 2d Point and centered on a 2d Line with a given radius. Tolerance is used to find solution in every limit cases. raises NegativeValue in case of NegativeRadius.
") GccAna_Circ2dTanOnRad;
		 GccAna_Circ2dTanOnRad(const gp_Pnt2d & Point1, const gp_Circ2d & OnCirc, const Standard_Real Radius, const Standard_Real Tolerance);

		/****** GccAna_Circ2dTanOnRad::CenterOn3 ******/
		/****** md5 signature: 713cefd806df05d39f2ba710d8a8d081 ******/
		%feature("compactdefaultargs") CenterOn3;
		%feature("autodoc", "
Parameters
----------
Index: int
PntSol: gp_Pnt2d

Return
-------
ParArg: float

Description
-----------
Returns information about the center (on the curv) of the result. ParArg is the intrinsic parameter of the point on the argument curv. PntSol is the center point of the solution curv. Raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions.
") CenterOn3;
		void CenterOn3(const Standard_Integer Index, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** GccAna_Circ2dTanOnRad::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the construction algorithm does not fail (even if it finds no solution). Note: IsDone protects against a failure arising from a more internal intersection algorithm, which has reached its numeric limits.
") IsDone;
		Standard_Boolean IsDone();

		/****** GccAna_Circ2dTanOnRad::IsTheSame1 ******/
		/****** md5 signature: a8b1c8a0e7512c619b1f66f2bb9e39a6 ******/
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
		Standard_Boolean IsTheSame1(const Standard_Integer Index);

		/****** GccAna_Circ2dTanOnRad::NbSolutions ******/
		/****** md5 signature: 02fdbddb1f7eff080419f602203d8f8b ******/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Return
-------
int

Description
-----------
This method returns the number of circles, representing solutions. Raises NotDone if the construction algorithm didn't succeed.
") NbSolutions;
		Standard_Integer NbSolutions();

		/****** GccAna_Circ2dTanOnRad::Tangency1 ******/
		/****** md5 signature: 2560a863e327c3fcf6bbfde26d55fd79 ******/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "
Parameters
----------
Index: int
PntSol: gp_Pnt2d

Return
-------
ParSol: float
ParArg: float

Description
-----------
Returns information about the tangency point between the result number Index and the first argument. ParSol is the intrinsic parameter of the point on the solution curv. ParArg is the intrinsic parameter of the point on the argument curv. PntSol is the tangency point on the solution curv. PntArg is the tangency point on the argument curv. Raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions.
") Tangency1;
		void Tangency1(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** GccAna_Circ2dTanOnRad::ThisSolution ******/
		/****** md5 signature: 6411fa8d68e628aba08bd186d18a6e49 ******/
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
		gp_Circ2d ThisSolution(const Standard_Integer Index);

		/****** GccAna_Circ2dTanOnRad::WhichQualifier ******/
		/****** md5 signature: 0ea2282c206094fba20eed9ca0e0787e ******/
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
		void WhichQualifier(const Standard_Integer Index, GccEnt_Position & Qualif1);

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
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true (this construction algorithm never fails).
") IsDone;
		Standard_Boolean IsDone();

		/****** GccAna_CircLin2dBisec::NbSolutions ******/
		/****** md5 signature: 02fdbddb1f7eff080419f602203d8f8b ******/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of curves, representing solutions computed by this algorithm.
") NbSolutions;
		Standard_Integer NbSolutions();

		/****** GccAna_CircLin2dBisec::ThisSolution ******/
		/****** md5 signature: 6df4cf8ad902f791256b807b0a0d0bd3 ******/
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
		opencascade::handle<GccInt_Bisec> ThisSolution(const Standard_Integer Index);

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
		/****** md5 signature: 9b11df42db407bd8004cdfb8fd5173ef ******/
		%feature("compactdefaultargs") GccAna_CircPnt2dBisec;
		%feature("autodoc", "
Parameters
----------
Circle1: gp_Circ2d
Point2: gp_Pnt2d
Tolerance: float

Return
-------
None

Description
-----------
Constructs bisecting curves between the circle Circle1 and the point Point2. Tolerance is used.
") GccAna_CircPnt2dBisec;
		 GccAna_CircPnt2dBisec(const gp_Circ2d & Circle1, const gp_Pnt2d & Point2, const Standard_Real Tolerance);

		/****** GccAna_CircPnt2dBisec::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true (this construction algorithm never fails).
") IsDone;
		Standard_Boolean IsDone();

		/****** GccAna_CircPnt2dBisec::NbSolutions ******/
		/****** md5 signature: 02fdbddb1f7eff080419f602203d8f8b ******/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of curves, representing solutions computed by this algorithm.
") NbSolutions;
		Standard_Integer NbSolutions();

		/****** GccAna_CircPnt2dBisec::ThisSolution ******/
		/****** md5 signature: 6df4cf8ad902f791256b807b0a0d0bd3 ******/
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
		opencascade::handle<GccInt_Bisec> ThisSolution(const Standard_Integer Index);

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
		/****** md5 signature: d217055dd19c4ad537b6670197044029 ******/
		%feature("compactdefaultargs") GccAna_Lin2d2Tan;
		%feature("autodoc", "
Parameters
----------
ThePoint1: gp_Pnt2d
ThePoint2: gp_Pnt2d
Tolerance: float

Return
-------
None

Description
-----------
This methods implements the algorithms used to create 2d lines passing through 2 points. Tolerance is used because we can't create a line when the distance between the two points is too small.
") GccAna_Lin2d2Tan;
		 GccAna_Lin2d2Tan(const gp_Pnt2d & ThePoint1, const gp_Pnt2d & ThePoint2, const Standard_Real Tolerance);

		/****** GccAna_Lin2d2Tan::GccAna_Lin2d2Tan ******/
		/****** md5 signature: bdc59b7aa8cd6b8f75211b5ebd7a8b08 ******/
		%feature("compactdefaultargs") GccAna_Lin2d2Tan;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
ThePoint: gp_Pnt2d
Tolerance: float

Return
-------
None

Description
-----------
This methods implements the algorithms used to create 2d lines tangent to one circle and passing through a point. Exception BadQualifier is raised in the case of EnclosedCirc Tolerance is used because there is no solution when the point is inside the solution according to the tolerance.
") GccAna_Lin2d2Tan;
		 GccAna_Lin2d2Tan(const GccEnt_QualifiedCirc & Qualified1, const gp_Pnt2d & ThePoint, const Standard_Real Tolerance);

		/****** GccAna_Lin2d2Tan::GccAna_Lin2d2Tan ******/
		/****** md5 signature: 8ac973a5ba56fea5ba95c5ad802a7d7d ******/
		%feature("compactdefaultargs") GccAna_Lin2d2Tan;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: GccEnt_QualifiedCirc
Tolerance: float

Return
-------
None

Description
-----------
This methods implements the algorithms used to create 2d lines tangent to 2 circles. Exception BadQualifier is raised in the case of EnclosedCirc.
") GccAna_Lin2d2Tan;
		 GccAna_Lin2d2Tan(const GccEnt_QualifiedCirc & Qualified1, const GccEnt_QualifiedCirc & Qualified2, const Standard_Real Tolerance);

		/****** GccAna_Lin2d2Tan::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
This method returns true when there is a solution and false in the other cases.
") IsDone;
		Standard_Boolean IsDone();

		/****** GccAna_Lin2d2Tan::NbSolutions ******/
		/****** md5 signature: 02fdbddb1f7eff080419f602203d8f8b ******/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Return
-------
int

Description
-----------
This method returns the number of solutions. Raises NotDone if the construction algorithm didn't succeed.
") NbSolutions;
		Standard_Integer NbSolutions();

		/****** GccAna_Lin2d2Tan::Tangency1 ******/
		/****** md5 signature: 2560a863e327c3fcf6bbfde26d55fd79 ******/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "
Parameters
----------
Index: int
PntSol: gp_Pnt2d

Return
-------
ParSol: float
ParArg: float

Description
-----------
Returns information about the tangency point between the result number Index and the first argument. ParSol is the intrinsic parameter of the point PntSol on the solution curv. ParArg is the intrinsic parameter of the point PntSol on the argument curv. Raises OutOfRange is raised if Index is greater than the number of solutions. It raises NotDone if the algorithm failed.
") Tangency1;
		void Tangency1(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** GccAna_Lin2d2Tan::Tangency2 ******/
		/****** md5 signature: aa2c229192467eeb8e5b8843ab43ae52 ******/
		%feature("compactdefaultargs") Tangency2;
		%feature("autodoc", "
Parameters
----------
Index: int
PntSol: gp_Pnt2d

Return
-------
ParSol: float
ParArg: float

Description
-----------
Returns information about the tangency point between the result number Index and the second argument. ParSol is the intrinsic parameter of the point ParSol on the solution curv. ParArg is the intrinsic parameter of the point PntSol on the argument curv. Raises OutOfRange is raised if Index is greater than the number of solutions. It raises NotDone if the algorithm failed.
") Tangency2;
		void Tangency2(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** GccAna_Lin2d2Tan::ThisSolution ******/
		/****** md5 signature: 96dd6b3b788fc0b155d75bed87794c74 ******/
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
		gp_Lin2d ThisSolution(const Standard_Integer Index);

		/****** GccAna_Lin2d2Tan::WhichQualifier ******/
		/****** md5 signature: 6aa541a02c7988b37a04a532d9174284 ******/
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
		void WhichQualifier(const Standard_Integer Index, GccEnt_Position & Qualif1, GccEnt_Position & Qualif2);

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
		/****** md5 signature: 77db5554380ec88a636c5d923715b5a3 ******/
		%feature("compactdefaultargs") Intersection1;
		%feature("autodoc", "
Parameters
----------
Index: int
PntSol: gp_Pnt2d

Return
-------
ParSol: float
ParArg: float

Description
-----------
Returns information about the intersection point between the result number Index and the first argument. Raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions.
") Intersection1;
		void Intersection1(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** GccAna_Lin2dBisec::Intersection2 ******/
		/****** md5 signature: 3a8002e96f3bc12ac0919f98e024e3f2 ******/
		%feature("compactdefaultargs") Intersection2;
		%feature("autodoc", "
Parameters
----------
Index: int
PntSol: gp_Pnt2d

Return
-------
ParSol: float
ParArg: float

Description
-----------
Returns information about the intersection point between the result number Index and the second argument. Raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions.
") Intersection2;
		void Intersection2(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** GccAna_Lin2dBisec::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True when the algorithm succeeded.
") IsDone;
		Standard_Boolean IsDone();

		/****** GccAna_Lin2dBisec::NbSolutions ******/
		/****** md5 signature: 02fdbddb1f7eff080419f602203d8f8b ******/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of solutions and raise NotDone if the constructor wasn't called before.
") NbSolutions;
		Standard_Integer NbSolutions();

		/****** GccAna_Lin2dBisec::ThisSolution ******/
		/****** md5 signature: 96dd6b3b788fc0b155d75bed87794c74 ******/
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
		gp_Lin2d ThisSolution(const Standard_Integer Index);

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
		/****** md5 signature: 7eb2845925f436aa37476ec0a3500de7 ******/
		%feature("compactdefaultargs") GccAna_Lin2dTanObl;
		%feature("autodoc", "
Parameters
----------
ThePoint: gp_Pnt2d
TheLine: gp_Lin2d
TheAngle: float

Return
-------
None

Description
-----------
This class implements the algorithms used to create 2d line passing through a point and making an angle with a line.
") GccAna_Lin2dTanObl;
		 GccAna_Lin2dTanObl(const gp_Pnt2d & ThePoint, const gp_Lin2d & TheLine, const Standard_Real TheAngle);

		/****** GccAna_Lin2dTanObl::GccAna_Lin2dTanObl ******/
		/****** md5 signature: f43e6e3fb85ca36e1c44a55e5df13fb3 ******/
		%feature("compactdefaultargs") GccAna_Lin2dTanObl;
		%feature("autodoc", "
Parameters
----------
Qualified1: GccEnt_QualifiedCirc
TheLine: gp_Lin2d
TheAngle: float

Return
-------
None

Description
-----------
This class implements the algorithms used to create 2d line tangent to a circle and making an angle with a line. Exceptions GccEnt_BadQualifier if a qualifier is inconsistent with the argument it qualifies (for example, enclosed for a circle).
") GccAna_Lin2dTanObl;
		 GccAna_Lin2dTanObl(const GccEnt_QualifiedCirc & Qualified1, const gp_Lin2d & TheLine, const Standard_Real TheAngle);

		/****** GccAna_Lin2dTanObl::Intersection2 ******/
		/****** md5 signature: 3a8002e96f3bc12ac0919f98e024e3f2 ******/
		%feature("compactdefaultargs") Intersection2;
		%feature("autodoc", "
Parameters
----------
Index: int
PntSol: gp_Pnt2d

Return
-------
ParSol: float
ParArg: float

Description
-----------
Returns information about the intersection between the result number Index and the third argument. Raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions.
") Intersection2;
		void Intersection2(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** GccAna_Lin2dTanObl::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the algorithm succeeded. Note: IsDone protects against a failure arising from a more internal intersection algorithm, which has reached its numeric limits.
") IsDone;
		Standard_Boolean IsDone();

		/****** GccAna_Lin2dTanObl::NbSolutions ******/
		/****** md5 signature: 02fdbddb1f7eff080419f602203d8f8b ******/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of of lines, representing solutions computed by this algorithm. Raises NotDone if the construction algorithm didn't succeed.
") NbSolutions;
		Standard_Integer NbSolutions();

		/****** GccAna_Lin2dTanObl::Tangency1 ******/
		/****** md5 signature: 2560a863e327c3fcf6bbfde26d55fd79 ******/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "
Parameters
----------
Index: int
PntSol: gp_Pnt2d

Return
-------
ParSol: float
ParArg: float

Description
-----------
Returns information about the tangency point between the result number Index and the first argument. ParSol is the intrinsic parameter of the point ParSol on the solution curv. ParArg is the intrinsic parameter of the point ParArg on the argument curv. Raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions.
") Tangency1;
		void Tangency1(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** GccAna_Lin2dTanObl::ThisSolution ******/
		/****** md5 signature: 96dd6b3b788fc0b155d75bed87794c74 ******/
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
		gp_Lin2d ThisSolution(const Standard_Integer Index);

		/****** GccAna_Lin2dTanObl::WhichQualifier ******/
		/****** md5 signature: 0ea2282c206094fba20eed9ca0e0787e ******/
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
		void WhichQualifier(const Standard_Integer Index, GccEnt_Position & Qualif1);

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
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the algorithm succeeded.
") IsDone;
		Standard_Boolean IsDone();

		/****** GccAna_Lin2dTanPar::NbSolutions ******/
		/****** md5 signature: 02fdbddb1f7eff080419f602203d8f8b ******/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of solutions. Raises NotDone if the construction algorithm didn't succeed.
") NbSolutions;
		Standard_Integer NbSolutions();

		/****** GccAna_Lin2dTanPar::Tangency1 ******/
		/****** md5 signature: ac6b428c3f88d193815480de09ccbe56 ******/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "
Parameters
----------
Index: int
Pnt: gp_Pnt2d

Return
-------
ParSol: float
ParArg: float

Description
-----------
Returns information about the tangency point between the result number Index and the first argument. ParSol is the intrinsic parameter of the point on the solution curv. ParArg is the intrinsic parameter of the point on the argument curv. ParArg is equal 0 when the solution is passing through a point. Raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions.
") Tangency1;
		void Tangency1(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & Pnt);

		/****** GccAna_Lin2dTanPar::ThisSolution ******/
		/****** md5 signature: 96dd6b3b788fc0b155d75bed87794c74 ******/
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
		gp_Lin2d ThisSolution(const Standard_Integer Index);

		/****** GccAna_Lin2dTanPar::WhichQualifier ******/
		/****** md5 signature: 0ea2282c206094fba20eed9ca0e0787e ******/
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
		void WhichQualifier(const Standard_Integer Index, GccEnt_Position & Qualif1);

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
		/****** md5 signature: 3a8002e96f3bc12ac0919f98e024e3f2 ******/
		%feature("compactdefaultargs") Intersection2;
		%feature("autodoc", "
Parameters
----------
Index: int
PntSol: gp_Pnt2d

Return
-------
ParSol: float
ParArg: float

Description
-----------
Returns information about the intersection between the solution number Index and the second argument. It returns the first intersection in a case of Lin2dTanPer which is perpendicular to a circle . ParSol is the intrinsic parameter of the point on the solution curv. ParArg is the intrinsic parameter of the point on the argument curv. Raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions.
") Intersection2;
		void Intersection2(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****** GccAna_Lin2dTanPer::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the algorithm succeeded.
") IsDone;
		Standard_Boolean IsDone();

		/****** GccAna_Lin2dTanPer::NbSolutions ******/
		/****** md5 signature: 02fdbddb1f7eff080419f602203d8f8b ******/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of solutions. Raises NotDone if the construction algorithm didn't succeed.
") NbSolutions;
		Standard_Integer NbSolutions();

		/****** GccAna_Lin2dTanPer::Tangency1 ******/
		/****** md5 signature: ac6b428c3f88d193815480de09ccbe56 ******/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "
Parameters
----------
Index: int
Pnt: gp_Pnt2d

Return
-------
ParSol: float
ParArg: float

Description
-----------
Returns information about the tangency point between the result number Index and the first argument. ParSol is the intrinsic parameter of the point on the solution curv. ParArg is the intrinsic parameter of the point on the argument curv. If the first argument is a point ParArg is equal zero. raises NotDone if the construction algorithm didn't succeed. It raises OutOfRange if Index is greater than the number of solutions.
") Tangency1;
		void Tangency1(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & Pnt);

		/****** GccAna_Lin2dTanPer::ThisSolution ******/
		/****** md5 signature: 96dd6b3b788fc0b155d75bed87794c74 ******/
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
		gp_Lin2d ThisSolution(const Standard_Integer Index);

		/****** GccAna_Lin2dTanPer::WhichQualifier ******/
		/****** md5 signature: 0ea2282c206094fba20eed9ca0e0787e ******/
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
		void WhichQualifier(const Standard_Integer Index, GccEnt_Position & Qualif1);

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
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the algorithm succeeded.
") IsDone;
		Standard_Boolean IsDone();

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
		/****** md5 signature: f9ff4e6e008069e4ae618904bd89decf ******/
		%feature("compactdefaultargs") HasSolution;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this algorithm has a solution, i.e. if the two points are not coincident.
") HasSolution;
		Standard_Boolean HasSolution();

		/****** GccAna_Pnt2dBisec::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true (this construction algorithm never fails).
") IsDone;
		Standard_Boolean IsDone();

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
