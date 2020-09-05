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
%define GCCANADOCSTRING
"GccAna module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_gccana.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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

/* python proy classes for enums */
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
		/****************** GccAna_Circ2d2TanOn ******************/
		/**** md5 signature: 2bb407b705201ca59ce4bd554ff86388 ****/
		%feature("compactdefaultargs") GccAna_Circ2d2TanOn;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to two 2d circles and having the center on a 2d line.

Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: GccEnt_QualifiedCirc
OnLine: gp_Lin2d
Tolerance: float

Returns
-------
None
") GccAna_Circ2d2TanOn;
		 GccAna_Circ2d2TanOn(const GccEnt_QualifiedCirc & Qualified1, const GccEnt_QualifiedCirc & Qualified2, const gp_Lin2d & OnLine, const Standard_Real Tolerance);

		/****************** GccAna_Circ2d2TanOn ******************/
		/**** md5 signature: 5def6677f4aec59bad70d0df9457da51 ****/
		%feature("compactdefaultargs") GccAna_Circ2d2TanOn;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to a 2d circle and a 2d line having the center on a 2d line.

Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: GccEnt_QualifiedLin
OnLine: gp_Lin2d
Tolerance: float

Returns
-------
None
") GccAna_Circ2d2TanOn;
		 GccAna_Circ2d2TanOn(const GccEnt_QualifiedCirc & Qualified1, const GccEnt_QualifiedLin & Qualified2, const gp_Lin2d & OnLine, const Standard_Real Tolerance);

		/****************** GccAna_Circ2d2TanOn ******************/
		/**** md5 signature: 9a62877d73b4b4e5824de0187aeef2d4 ****/
		%feature("compactdefaultargs") GccAna_Circ2d2TanOn;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to two 2d lines having the center on a 2d line.

Parameters
----------
Qualified1: GccEnt_QualifiedLin
Qualified2: GccEnt_QualifiedLin
OnLine: gp_Lin2d
Tolerance: float

Returns
-------
None
") GccAna_Circ2d2TanOn;
		 GccAna_Circ2d2TanOn(const GccEnt_QualifiedLin & Qualified1, const GccEnt_QualifiedLin & Qualified2, const gp_Lin2d & OnLine, const Standard_Real Tolerance);

		/****************** GccAna_Circ2d2TanOn ******************/
		/**** md5 signature: acf69d81e985b79442aeda8f2ff23e8d ****/
		%feature("compactdefaultargs") GccAna_Circ2d2TanOn;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to a 2d circle and a point having the center on a 2d line.

Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Point2: gp_Pnt2d
OnLine: gp_Lin2d
Tolerance: float

Returns
-------
None
") GccAna_Circ2d2TanOn;
		 GccAna_Circ2d2TanOn(const GccEnt_QualifiedCirc & Qualified1, const gp_Pnt2d & Point2, const gp_Lin2d & OnLine, const Standard_Real Tolerance);

		/****************** GccAna_Circ2d2TanOn ******************/
		/**** md5 signature: 8cf98517f5e62cf59d7cb2c2723556ea ****/
		%feature("compactdefaultargs") GccAna_Circ2d2TanOn;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to a 2d line and a point having the center on a 2d line.

Parameters
----------
Qualified1: GccEnt_QualifiedLin
Point2: gp_Pnt2d
OnLine: gp_Lin2d
Tolerance: float

Returns
-------
None
") GccAna_Circ2d2TanOn;
		 GccAna_Circ2d2TanOn(const GccEnt_QualifiedLin & Qualified1, const gp_Pnt2d & Point2, const gp_Lin2d & OnLine, const Standard_Real Tolerance);

		/****************** GccAna_Circ2d2TanOn ******************/
		/**** md5 signature: 105e7c8b0cb49ccab4e2dbde93a93250 ****/
		%feature("compactdefaultargs") GccAna_Circ2d2TanOn;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to two points having the center on a 2d line.

Parameters
----------
Point1: gp_Pnt2d
Point2: gp_Pnt2d
OnLine: gp_Lin2d
Tolerance: float

Returns
-------
None
") GccAna_Circ2d2TanOn;
		 GccAna_Circ2d2TanOn(const gp_Pnt2d & Point1, const gp_Pnt2d & Point2, const gp_Lin2d & OnLine, const Standard_Real Tolerance);

		/****************** GccAna_Circ2d2TanOn ******************/
		/**** md5 signature: 0e3b23d9de8043707121d2a6930d4233 ****/
		%feature("compactdefaultargs") GccAna_Circ2d2TanOn;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to two 2d circles and having the center on a 2d circle.

Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: GccEnt_QualifiedCirc
OnCirc: gp_Circ2d
Tolerance: float

Returns
-------
None
") GccAna_Circ2d2TanOn;
		 GccAna_Circ2d2TanOn(const GccEnt_QualifiedCirc & Qualified1, const GccEnt_QualifiedCirc & Qualified2, const gp_Circ2d & OnCirc, const Standard_Real Tolerance);

		/****************** GccAna_Circ2d2TanOn ******************/
		/**** md5 signature: d27b643265e960dd8e3a70d8d6c334e2 ****/
		%feature("compactdefaultargs") GccAna_Circ2d2TanOn;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to a circle and a line having the center on a 2d circle.

Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: GccEnt_QualifiedLin
OnCirc: gp_Circ2d
Tolerance: float

Returns
-------
None
") GccAna_Circ2d2TanOn;
		 GccAna_Circ2d2TanOn(const GccEnt_QualifiedCirc & Qualified1, const GccEnt_QualifiedLin & Qualified2, const gp_Circ2d & OnCirc, const Standard_Real Tolerance);

		/****************** GccAna_Circ2d2TanOn ******************/
		/**** md5 signature: 5fa57362f351ae9e64f160872655649c ****/
		%feature("compactdefaultargs") GccAna_Circ2d2TanOn;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to a circle and a point having the center on a 2d circle.

Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Point2: gp_Pnt2d
OnCirc: gp_Circ2d
Tolerance: float

Returns
-------
None
") GccAna_Circ2d2TanOn;
		 GccAna_Circ2d2TanOn(const GccEnt_QualifiedCirc & Qualified1, const gp_Pnt2d & Point2, const gp_Circ2d & OnCirc, const Standard_Real Tolerance);

		/****************** GccAna_Circ2d2TanOn ******************/
		/**** md5 signature: 0c4b413c8c48272452690f99eab7398e ****/
		%feature("compactdefaultargs") GccAna_Circ2d2TanOn;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to two 2d lines having the center on a 2d circle.

Parameters
----------
Qualified1: GccEnt_QualifiedLin
Qualified2: GccEnt_QualifiedLin
OnCirc: gp_Circ2d
Tolerance: float

Returns
-------
None
") GccAna_Circ2d2TanOn;
		 GccAna_Circ2d2TanOn(const GccEnt_QualifiedLin & Qualified1, const GccEnt_QualifiedLin & Qualified2, const gp_Circ2d & OnCirc, const Standard_Real Tolerance);

		/****************** GccAna_Circ2d2TanOn ******************/
		/**** md5 signature: ced21bdfc5e50bcf8fd5c14ab7dad344 ****/
		%feature("compactdefaultargs") GccAna_Circ2d2TanOn;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to a line and a point having the center on a 2d circle.

Parameters
----------
Qualified1: GccEnt_QualifiedLin
Point2: gp_Pnt2d
OnCirc: gp_Circ2d
Tolerance: float

Returns
-------
None
") GccAna_Circ2d2TanOn;
		 GccAna_Circ2d2TanOn(const GccEnt_QualifiedLin & Qualified1, const gp_Pnt2d & Point2, const gp_Circ2d & OnCirc, const Standard_Real Tolerance);

		/****************** GccAna_Circ2d2TanOn ******************/
		/**** md5 signature: 6ff7022cad2a36a011fcb377367c18ff ****/
		%feature("compactdefaultargs") GccAna_Circ2d2TanOn;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to two points having the center on a 2d circle.

Parameters
----------
Point1: gp_Pnt2d
Point2: gp_Pnt2d
OnCirc: gp_Circ2d
Tolerance: float

Returns
-------
None
") GccAna_Circ2d2TanOn;
		 GccAna_Circ2d2TanOn(const gp_Pnt2d & Point1, const gp_Pnt2d & Point2, const gp_Circ2d & OnCirc, const Standard_Real Tolerance);

		/****************** CenterOn3 ******************/
		/**** md5 signature: b84288e9132f5c4ac31073a7171b086e ****/
		%feature("compactdefaultargs") CenterOn3;
		%feature("autodoc", "Returns the informations about the center (on the curv) of the result number index and the third argument. pararg is the intrinsic parameter of the point pntarg on the third argument. exceptions standard_outofrange if index is less than zero or greater than the number of solutions computed by this algorithm. stdfail_notdone if the construction fails.

Parameters
----------
Index: int
PntArg: gp_Pnt2d

Returns
-------
ParArg: float
") CenterOn3;
		void CenterOn3(const Standard_Integer Index, Standard_Real &OutValue, gp_Pnt2d & PntArg);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the construction algorithm does not fail (even if it finds no solution). note: isdone protects against a failure arising from a more internal intersection algorithm, which has reached its numeric limits.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsTheSame1 ******************/
		/**** md5 signature: a8b1c8a0e7512c619b1f66f2bb9e39a6 ****/
		%feature("compactdefaultargs") IsTheSame1;
		%feature("autodoc", "True if the solution and the first argument are the same (2 circles). if r1 is the radius of the first argument and rsol the radius of the solution and dist the distance between the two centers, we concider the two circles are identical if r1+dist-rsol is less than tolerance. false in the other cases. raises outofrange if index is greater than the number of solutions and notdone if isdone returns false.

Parameters
----------
Index: int

Returns
-------
bool
") IsTheSame1;
		Standard_Boolean IsTheSame1(const Standard_Integer Index);

		/****************** IsTheSame2 ******************/
		/**** md5 signature: a9dd3589d0d4332d52c7b28a62c5e764 ****/
		%feature("compactdefaultargs") IsTheSame2;
		%feature("autodoc", "True if the solution and the second argument are the same (2 circles). if r2 is the radius of the second argument and rsol the radius of the solution and dist the distance between the two centers, we concider the two circles are identical if r2+dist-rsol is less than tolerance. false in the other cases. raises outofrange if index is greater than the number of solutions and notdone if isdone returns false.

Parameters
----------
Index: int

Returns
-------
bool
") IsTheSame2;
		Standard_Boolean IsTheSame2(const Standard_Integer Index);

		/****************** NbSolutions ******************/
		/**** md5 signature: 02fdbddb1f7eff080419f602203d8f8b ****/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Returns the number of circles, representing solutions computed by this algorithm. exceptions stdfail_notdone if the construction fails.

Returns
-------
int
") NbSolutions;
		Standard_Integer NbSolutions();

		/****************** Tangency1 ******************/
		/**** md5 signature: 2560a863e327c3fcf6bbfde26d55fd79 ****/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "Returns the informations about the tangency point between the result number index and the first argument. parsol is the intrinsic parameter of the point pntsol on the solution pararg is the intrinsic parameter of the point pntsol on the first argument. raises outofrange if index is greater than the number of solutions and notdone if isdone returns false.

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
		/**** md5 signature: aa2c229192467eeb8e5b8843ab43ae52 ****/
		%feature("compactdefaultargs") Tangency2;
		%feature("autodoc", "Returns the informations about the tangency point between the result number index and the second argument. parsol is the intrinsic parameter of the point pntsol on the solution. pararg is the intrinsic parameter of the point pntsol on the second argument. raises outofrange if index is greater than the number of solutions and notdone if isdone returns false.

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
		/**** md5 signature: 6411fa8d68e628aba08bd186d18a6e49 ****/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "Returns the solution number index and raises outofrange exception if index is greater than the number of solutions. be careful: the index is only a way to get all the solutions, but is not associated to those outside the context of the algorithm-object. exceptions standard_outofrange if index is less than zero or greater than the number of solutions computed by this algorithm. stdfail_notdone if the construction fails.

Parameters
----------
Index: int

Returns
-------
gp_Circ2d
") ThisSolution;
		gp_Circ2d ThisSolution(const Standard_Integer Index);

		/****************** WhichQualifier ******************/
		/**** md5 signature: 6aa541a02c7988b37a04a532d9174284 ****/
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "Returns the qualifiers qualif1 and qualif2 of the tangency arguments for the solution of index index computed by this algorithm. the returned qualifiers are: - those specified at the start of construction when the solutions are defined as enclosed, enclosing or outside with respect to the arguments, or - those computed during construction (i.e. enclosed, enclosing or outside) when the solutions are defined as unqualified with respect to the arguments, or - gccent_noqualifier if the tangency argument is a point. exceptions standard_outofrange if index is less than zero or greater than the number of solutions computed by this algorithm. stdfail_notdone if the construction fails.

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
		/****************** GccAna_Circ2d2TanRad ******************/
		/**** md5 signature: 03077fcb00dbd29830a11717606ebbc9 ****/
		%feature("compactdefaultargs") GccAna_Circ2d2TanRad;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to two 2d circle with a radius of radius. it raises negativevalue if radius is lower than zero.

Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: GccEnt_QualifiedCirc
Radius: float
Tolerance: float

Returns
-------
None
") GccAna_Circ2d2TanRad;
		 GccAna_Circ2d2TanRad(const GccEnt_QualifiedCirc & Qualified1, const GccEnt_QualifiedCirc & Qualified2, const Standard_Real Radius, const Standard_Real Tolerance);

		/****************** GccAna_Circ2d2TanRad ******************/
		/**** md5 signature: defd8a0e3d243ea2573630102c9f56c6 ****/
		%feature("compactdefaultargs") GccAna_Circ2d2TanRad;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to a 2d circle and a 2d line with a radius of radius. it raises negativevalue if radius is lower than zero.

Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: GccEnt_QualifiedLin
Radius: float
Tolerance: float

Returns
-------
None
") GccAna_Circ2d2TanRad;
		 GccAna_Circ2d2TanRad(const GccEnt_QualifiedCirc & Qualified1, const GccEnt_QualifiedLin & Qualified2, const Standard_Real Radius, const Standard_Real Tolerance);

		/****************** GccAna_Circ2d2TanRad ******************/
		/**** md5 signature: 995f0517daea11068d2d34ac400c40c9 ****/
		%feature("compactdefaultargs") GccAna_Circ2d2TanRad;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to a 2d circle and a point with a radius of radius. it raises negativevalue if radius is lower than zero.

Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Point2: gp_Pnt2d
Radius: float
Tolerance: float

Returns
-------
None
") GccAna_Circ2d2TanRad;
		 GccAna_Circ2d2TanRad(const GccEnt_QualifiedCirc & Qualified1, const gp_Pnt2d & Point2, const Standard_Real Radius, const Standard_Real Tolerance);

		/****************** GccAna_Circ2d2TanRad ******************/
		/**** md5 signature: 084258399311d7af760c1a0ca8ee3acd ****/
		%feature("compactdefaultargs") GccAna_Circ2d2TanRad;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to a 2d line and a point with a radius of radius. it raises negativevalue if radius is lower than zero.

Parameters
----------
Qualified1: GccEnt_QualifiedLin
Point2: gp_Pnt2d
Radius: float
Tolerance: float

Returns
-------
None
") GccAna_Circ2d2TanRad;
		 GccAna_Circ2d2TanRad(const GccEnt_QualifiedLin & Qualified1, const gp_Pnt2d & Point2, const Standard_Real Radius, const Standard_Real Tolerance);

		/****************** GccAna_Circ2d2TanRad ******************/
		/**** md5 signature: 4eb59f8709f9fe2bced34d1847a99932 ****/
		%feature("compactdefaultargs") GccAna_Circ2d2TanRad;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to two 2d lines with a radius of radius. it raises negativevalue if radius is lower than zero.

Parameters
----------
Qualified1: GccEnt_QualifiedLin
Qualified2: GccEnt_QualifiedLin
Radius: float
Tolerance: float

Returns
-------
None
") GccAna_Circ2d2TanRad;
		 GccAna_Circ2d2TanRad(const GccEnt_QualifiedLin & Qualified1, const GccEnt_QualifiedLin & Qualified2, const Standard_Real Radius, const Standard_Real Tolerance);

		/****************** GccAna_Circ2d2TanRad ******************/
		/**** md5 signature: 204510de7d84946246be3ee05fc5cfc9 ****/
		%feature("compactdefaultargs") GccAna_Circ2d2TanRad;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles passing through two points with a radius of radius. it raises negativevalue if radius is lower than zero.

Parameters
----------
Point1: gp_Pnt2d
Point2: gp_Pnt2d
Radius: float
Tolerance: float

Returns
-------
None
") GccAna_Circ2d2TanRad;
		 GccAna_Circ2d2TanRad(const gp_Pnt2d & Point1, const gp_Pnt2d & Point2, const Standard_Real Radius, const Standard_Real Tolerance);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "This method returns true if the algorithm succeeded. note: isdone protects against a failure arising from a more internal intersection algorithm, which has reached its numeric limits.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsTheSame1 ******************/
		/**** md5 signature: a8b1c8a0e7512c619b1f66f2bb9e39a6 ****/
		%feature("compactdefaultargs") IsTheSame1;
		%feature("autodoc", "Returns true if the solution number index is equal to the first argument. raises outofrange if index is greater than the number of solutions. it raises notdone if the construction algorithm did not succeed.

Parameters
----------
Index: int

Returns
-------
bool
") IsTheSame1;
		Standard_Boolean IsTheSame1(const Standard_Integer Index);

		/****************** IsTheSame2 ******************/
		/**** md5 signature: a9dd3589d0d4332d52c7b28a62c5e764 ****/
		%feature("compactdefaultargs") IsTheSame2;
		%feature("autodoc", "Returns true if the solution number index is equal to the second argument. raises outofrange if index is greater than the number of solutions. it raises notdone if the construction algorithm did not succeed.

Parameters
----------
Index: int

Returns
-------
bool
") IsTheSame2;
		Standard_Boolean IsTheSame2(const Standard_Integer Index);

		/****************** NbSolutions ******************/
		/**** md5 signature: 02fdbddb1f7eff080419f602203d8f8b ****/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "This method returns the number of circles, representing solutions computed by this algorithm. exceptions stdfail_notdone if the construction fails. of solutions.

Returns
-------
int
") NbSolutions;
		Standard_Integer NbSolutions();

		/****************** Tangency1 ******************/
		/**** md5 signature: 2560a863e327c3fcf6bbfde26d55fd79 ****/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "Returns information about the tangency point between the result number index and the first argument. parsol is the intrinsic parameter of the point pntsol on the solution. pararg is the intrinsic parameter of the point pntsol on the first argument. raises outofrange if index is greater than the number of solutions. it raises notdone if the construction algorithm did not succeed.

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
		/**** md5 signature: aa2c229192467eeb8e5b8843ab43ae52 ****/
		%feature("compactdefaultargs") Tangency2;
		%feature("autodoc", "Returns information about the tangency point between the result number index and the second argument. parsol is the intrinsic parameter of the point pntsol on the solution. pararg is the intrinsic parameter of the point pntarg on the second argument. raises outofrange if index is greater than the number of solutions. it raises notdone if the construction algorithm did not succeed.

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
		/**** md5 signature: 6411fa8d68e628aba08bd186d18a6e49 ****/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "Returns the solution number index. be careful: the index is only a way to get all the solutions, but is not associated to those outside the context of the algorithm-object. raises outofrange exception if index is greater than the number of solutions. it raises notdone if the construction algorithm did not succeed.

Parameters
----------
Index: int

Returns
-------
gp_Circ2d
") ThisSolution;
		gp_Circ2d ThisSolution(const Standard_Integer Index);

		/****************** WhichQualifier ******************/
		/**** md5 signature: 6aa541a02c7988b37a04a532d9174284 ****/
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "Returns the information about the qualifiers of the tangency arguments concerning the solution number index. it returns the real qualifiers (the qualifiers given to the constructor method in case of enclosed, enclosing and outside and the qualifiers computedin case of unqualified).

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
		/****************** GccAna_Circ2d3Tan ******************/
		/**** md5 signature: f8f964b76b262dd3502e96072de8f300 ****/
		%feature("compactdefaultargs") GccAna_Circ2d3Tan;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to 3 circles. constructionerror is raised if there is a problem during the computation.

Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: GccEnt_QualifiedCirc
Qualified3: GccEnt_QualifiedCirc
Tolerance: float

Returns
-------
None
") GccAna_Circ2d3Tan;
		 GccAna_Circ2d3Tan(const GccEnt_QualifiedCirc & Qualified1, const GccEnt_QualifiedCirc & Qualified2, const GccEnt_QualifiedCirc & Qualified3, const Standard_Real Tolerance);

		/****************** GccAna_Circ2d3Tan ******************/
		/**** md5 signature: b47db5ce4e480ee56f0abf606eb1c531 ****/
		%feature("compactdefaultargs") GccAna_Circ2d3Tan;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to 2 circles and 1 line. constructionerror is raised if there is a problem during the computation.

Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: GccEnt_QualifiedCirc
Qualified3: GccEnt_QualifiedLin
Tolerance: float

Returns
-------
None
") GccAna_Circ2d3Tan;
		 GccAna_Circ2d3Tan(const GccEnt_QualifiedCirc & Qualified1, const GccEnt_QualifiedCirc & Qualified2, const GccEnt_QualifiedLin & Qualified3, const Standard_Real Tolerance);

		/****************** GccAna_Circ2d3Tan ******************/
		/**** md5 signature: b857ac02330208f7df1f0570716465e0 ****/
		%feature("compactdefaultargs") GccAna_Circ2d3Tan;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to 1 circle and 2 lines. constructionerror is raised if there is a problem during the computation.

Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: GccEnt_QualifiedLin
Qualified3: GccEnt_QualifiedLin
Tolerance: float

Returns
-------
None
") GccAna_Circ2d3Tan;
		 GccAna_Circ2d3Tan(const GccEnt_QualifiedCirc & Qualified1, const GccEnt_QualifiedLin & Qualified2, const GccEnt_QualifiedLin & Qualified3, const Standard_Real Tolerance);

		/****************** GccAna_Circ2d3Tan ******************/
		/**** md5 signature: 1769efb935d0c72a05740f6fd5eca73e ****/
		%feature("compactdefaultargs") GccAna_Circ2d3Tan;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to 3 lines. constructionerror is raised if there is a problem during the computation.

Parameters
----------
Qualified1: GccEnt_QualifiedLin
Qualified2: GccEnt_QualifiedLin
Qualified3: GccEnt_QualifiedLin
Tolerance: float

Returns
-------
None
") GccAna_Circ2d3Tan;
		 GccAna_Circ2d3Tan(const GccEnt_QualifiedLin & Qualified1, const GccEnt_QualifiedLin & Qualified2, const GccEnt_QualifiedLin & Qualified3, const Standard_Real Tolerance);

		/****************** GccAna_Circ2d3Tan ******************/
		/**** md5 signature: dc951ea641df0a66e216323a4f8d01d5 ****/
		%feature("compactdefaultargs") GccAna_Circ2d3Tan;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to 2 circles and 1 point. constructionerror is raised if there is a problem during the computation.

Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: GccEnt_QualifiedCirc
Point3: gp_Pnt2d
Tolerance: float

Returns
-------
None
") GccAna_Circ2d3Tan;
		 GccAna_Circ2d3Tan(const GccEnt_QualifiedCirc & Qualified1, const GccEnt_QualifiedCirc & Qualified2, const gp_Pnt2d & Point3, const Standard_Real Tolerance);

		/****************** GccAna_Circ2d3Tan ******************/
		/**** md5 signature: 75533fa6c57a0d7ed4bd8e199bda37d7 ****/
		%feature("compactdefaultargs") GccAna_Circ2d3Tan;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to a circle and a line and 1 point. constructionerror is raised if there is a problem during the computation.

Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: GccEnt_QualifiedLin
Point3: gp_Pnt2d
Tolerance: float

Returns
-------
None
") GccAna_Circ2d3Tan;
		 GccAna_Circ2d3Tan(const GccEnt_QualifiedCirc & Qualified1, const GccEnt_QualifiedLin & Qualified2, const gp_Pnt2d & Point3, const Standard_Real Tolerance);

		/****************** GccAna_Circ2d3Tan ******************/
		/**** md5 signature: dbf10928c370bfa25ce4019474bb8f53 ****/
		%feature("compactdefaultargs") GccAna_Circ2d3Tan;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to 2 lines and 1 point. constructionerror is raised if there is a problem during the computation.

Parameters
----------
Qualified1: GccEnt_QualifiedLin
Qualified2: GccEnt_QualifiedLin
Point3: gp_Pnt2d
Tolerance: float

Returns
-------
None
") GccAna_Circ2d3Tan;
		 GccAna_Circ2d3Tan(const GccEnt_QualifiedLin & Qualified1, const GccEnt_QualifiedLin & Qualified2, const gp_Pnt2d & Point3, const Standard_Real Tolerance);

		/****************** GccAna_Circ2d3Tan ******************/
		/**** md5 signature: ccacbacc59448541d378a070840f3b7a ****/
		%feature("compactdefaultargs") GccAna_Circ2d3Tan;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to a circle and passing thrue 2 points. constructionerror is raised if there is a problem during the computation.

Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Point2: gp_Pnt2d
Point3: gp_Pnt2d
Tolerance: float

Returns
-------
None
") GccAna_Circ2d3Tan;
		 GccAna_Circ2d3Tan(const GccEnt_QualifiedCirc & Qualified1, const gp_Pnt2d & Point2, const gp_Pnt2d & Point3, const Standard_Real Tolerance);

		/****************** GccAna_Circ2d3Tan ******************/
		/**** md5 signature: c4207c6b3d25b5c4cb5841f1daf562df ****/
		%feature("compactdefaultargs") GccAna_Circ2d3Tan;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to a line and passing thrue 2 points. constructionerror is raised if there is a problem during the computation.

Parameters
----------
Qualified1: GccEnt_QualifiedLin
Point2: gp_Pnt2d
Point3: gp_Pnt2d
Tolerance: float

Returns
-------
None
") GccAna_Circ2d3Tan;
		 GccAna_Circ2d3Tan(const GccEnt_QualifiedLin & Qualified1, const gp_Pnt2d & Point2, const gp_Pnt2d & Point3, const Standard_Real Tolerance);

		/****************** GccAna_Circ2d3Tan ******************/
		/**** md5 signature: 4ae692732419aa36f01019d6400237da ****/
		%feature("compactdefaultargs") GccAna_Circ2d3Tan;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles passing thrue 3 points. constructionerror is raised if there is a problem during the computation.

Parameters
----------
Point1: gp_Pnt2d
Point2: gp_Pnt2d
Point3: gp_Pnt2d
Tolerance: float

Returns
-------
None
") GccAna_Circ2d3Tan;
		 GccAna_Circ2d3Tan(const gp_Pnt2d & Point1, const gp_Pnt2d & Point2, const gp_Pnt2d & Point3, const Standard_Real Tolerance);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "This method returns true if the construction algorithm succeeded. note: isdone protects against a failure arising from a more internal intersection algorithm, which has reached its numeric limits.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsTheSame1 ******************/
		/**** md5 signature: a8b1c8a0e7512c619b1f66f2bb9e39a6 ****/
		%feature("compactdefaultargs") IsTheSame1;
		%feature("autodoc", "Returns true if the solution number index is equal to the first argument. raises outofrange if index is greater than the number of solutions. it raises notdone if the algorithm failed.

Parameters
----------
Index: int

Returns
-------
bool
") IsTheSame1;
		Standard_Boolean IsTheSame1(const Standard_Integer Index);

		/****************** IsTheSame2 ******************/
		/**** md5 signature: a9dd3589d0d4332d52c7b28a62c5e764 ****/
		%feature("compactdefaultargs") IsTheSame2;
		%feature("autodoc", "Returns true if the solution number index is equal to the second argument. raises outofrange index is greater than the number of solutions. it raises notdone if the algorithm failed.

Parameters
----------
Index: int

Returns
-------
bool
") IsTheSame2;
		Standard_Boolean IsTheSame2(const Standard_Integer Index);

		/****************** IsTheSame3 ******************/
		/**** md5 signature: a1a8ddd14236690538e70195d30d31e9 ****/
		%feature("compactdefaultargs") IsTheSame3;
		%feature("autodoc", "Returns true if the solution number index is equal to the third argument. raises outofrange if index is greater than the number of solutions. it raises notdone if the algorithm failed.

Parameters
----------
Index: int

Returns
-------
bool
") IsTheSame3;
		Standard_Boolean IsTheSame3(const Standard_Integer Index);

		/****************** NbSolutions ******************/
		/**** md5 signature: 02fdbddb1f7eff080419f602203d8f8b ****/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "This method returns the number of solutions. raises notdone if the construction algorithm didn't succeed.

Returns
-------
int
") NbSolutions;
		Standard_Integer NbSolutions();

		/****************** Tangency1 ******************/
		/**** md5 signature: 2560a863e327c3fcf6bbfde26d55fd79 ****/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "Returns informations about the tangency point between the result number index and the first argument. parsol is the intrinsic parameter of the point pntsol on the solution curv. pararg is the intrinsic parameter of the point pntarg on the argument curv. raises outofrange if index is greater than the number of solutions. it raises notdone if the algorithm failed.

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
		/**** md5 signature: aa2c229192467eeb8e5b8843ab43ae52 ****/
		%feature("compactdefaultargs") Tangency2;
		%feature("autodoc", "Returns informations about the tangency point between the result number index and the first argument. parsol is the intrinsic parameter of the point pntsol on the solution curv. pararg is the intrinsic parameter of the point pntsol on the argument curv. raises outofrange if index is greater than the number of solutions. it raises notdone if the algorithm failed.

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
		/**** md5 signature: 0aa5ec0c7341ae28374df63d96d61594 ****/
		%feature("compactdefaultargs") Tangency3;
		%feature("autodoc", "Returns informations about the tangency point between the result number index and the first argument. parsol is the intrinsic parameter of the point pntsol on the solution curv. pararg is the intrinsic parameter of the point pntsol on the argument curv. raises outofrange if index is greater than the number of solutions. it raises notdone if the algorithm failed.

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
		/**** md5 signature: 6411fa8d68e628aba08bd186d18a6e49 ****/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "Returns the solution number index and raises outofrange exception if index is greater than the number of solutions. be careful: the index is only a way to get all the solutions, but is not associated to those outside the context of the algorithm-object. raises outofrange if index is greater than the number of solutions. it raises notdone if the algorithm failed.

Parameters
----------
Index: int

Returns
-------
gp_Circ2d
") ThisSolution;
		gp_Circ2d ThisSolution(const Standard_Integer Index);

		/****************** WhichQualifier ******************/
		/**** md5 signature: a7c8640b1f68ed172a2307977dbf7e77 ****/
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "Returns the informations about the qualifiers of the tangency arguments concerning the solution number index. it returns the real qualifiers (the qualifiers given to the constructor method in case of enclosed, enclosing and outside and the qualifiers computedin case of unqualified).

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
		/****************** GccAna_Circ2dBisec ******************/
		/**** md5 signature: 96b7e55cbf3b08bc7fa908eca5dd03db ****/
		%feature("compactdefaultargs") GccAna_Circ2dBisec;
		%feature("autodoc", "Constructs bisecting curves between the two circles circ1 and circ2.

Parameters
----------
Circ1: gp_Circ2d
Circ2: gp_Circ2d

Returns
-------
None
") GccAna_Circ2dBisec;
		 GccAna_Circ2dBisec(const gp_Circ2d & Circ1, const gp_Circ2d & Circ2);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "This method returns true if the construction algorithm succeeded.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbSolutions ******************/
		/**** md5 signature: 02fdbddb1f7eff080419f602203d8f8b ****/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "This method returns the number of solutions. raises notdone if the construction algorithm didn't succeed.

Returns
-------
int
") NbSolutions;
		Standard_Integer NbSolutions();

		/****************** ThisSolution ******************/
		/**** md5 signature: 6df4cf8ad902f791256b807b0a0d0bd3 ****/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "Returns the solution number index raises outofrange exception if index is greater than the number of solutions. it raises notdone if the construction algorithm didn't succeed.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<GccInt_Bisec>
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
		/****************** GccAna_Circ2dTanCen ******************/
		/**** md5 signature: 03c76e41d4f72341c199827d05a5de1f ****/
		%feature("compactdefaultargs") GccAna_Circ2dTanCen;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to a circle and centered on a point.

Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Pcenter: gp_Pnt2d
Tolerance: float

Returns
-------
None
") GccAna_Circ2dTanCen;
		 GccAna_Circ2dTanCen(const GccEnt_QualifiedCirc & Qualified1, const gp_Pnt2d & Pcenter, const Standard_Real Tolerance);

		/****************** GccAna_Circ2dTanCen ******************/
		/**** md5 signature: 6c304bbd46bdd120f2ef6d03897dacbf ****/
		%feature("compactdefaultargs") GccAna_Circ2dTanCen;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles tangent to a line and centered on a point.

Parameters
----------
Linetan: gp_Lin2d
Pcenter: gp_Pnt2d

Returns
-------
None
") GccAna_Circ2dTanCen;
		 GccAna_Circ2dTanCen(const gp_Lin2d & Linetan, const gp_Pnt2d & Pcenter);

		/****************** GccAna_Circ2dTanCen ******************/
		/**** md5 signature: e4011363fd322219f6eccfea846244d4 ****/
		%feature("compactdefaultargs") GccAna_Circ2dTanCen;
		%feature("autodoc", "This method implements the algorithms used to create 2d circles passing thrue a point and centered on a point. tolerance is a tolerance criterion used by the algorithm to find a solution when, mathematically, the problem posed does not have a solution, but where there is numeric uncertainty attached to the arguments. in these algorithms tolerance is only used in very specific cases where the center of the solution is very close to the circle to which it is tangential, and where the solution is therefore a very small circle. exceptions gccent_badqualifier if a qualifier is inconsistent with the argument it qualifies (for example, enclosing for a line).

Parameters
----------
Point1: gp_Pnt2d
Pcenter: gp_Pnt2d

Returns
-------
None
") GccAna_Circ2dTanCen;
		 GccAna_Circ2dTanCen(const gp_Pnt2d & Point1, const gp_Pnt2d & Pcenter);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "This method returns true if the construction algorithm succeeded. note: isdone protects against a failure arising from a more internal intersection algorithm, which has reached its numeric limits.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsTheSame1 ******************/
		/**** md5 signature: a8b1c8a0e7512c619b1f66f2bb9e39a6 ****/
		%feature("compactdefaultargs") IsTheSame1;
		%feature("autodoc", "Returns true if the solution number index is equal to the first argument. it raises notdone if the construction algorithm didn't succeed. it raises outofrange if index is greater than the number of solutions or less than zero.

Parameters
----------
Index: int

Returns
-------
bool
") IsTheSame1;
		Standard_Boolean IsTheSame1(const Standard_Integer Index);

		/****************** NbSolutions ******************/
		/**** md5 signature: 02fdbddb1f7eff080419f602203d8f8b ****/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Returns the number of circles, representing solutions computed by this algorithm and raises notdone exception if the algorithm didn't succeed.

Returns
-------
int
") NbSolutions;
		Standard_Integer NbSolutions();

		/****************** Tangency1 ******************/
		/**** md5 signature: 2560a863e327c3fcf6bbfde26d55fd79 ****/
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
		/**** md5 signature: 6411fa8d68e628aba08bd186d18a6e49 ****/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "Returns the circle, representing the solution number index and raises outofrange exception if index is greater than the number of solutions. be carefull: the index is only a way to get all the solutions, but is not associated to theses outside the context of the algorithm-object. raises notdone if the construction algorithm didn't succeed. it raises outofrange if index is greater than the number of solutions or less than zer.

Parameters
----------
Index: int

Returns
-------
gp_Circ2d
") ThisSolution;
		gp_Circ2d ThisSolution(const Standard_Integer Index);

		/****************** WhichQualifier ******************/
		/**** md5 signature: 0ea2282c206094fba20eed9ca0e0787e ****/
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "Returns the qualifier qualif1 of the tangency argument for the solution of index index computed by this algorithm. the returned qualifier is: - that specified at the start of construction when the solutions are defined as enclosed, enclosing or it returns the real qualifiers (the qualifiers given to the constructor method in case of enclosed, enclosing and outside and the qualifiers computedin case of unqualified).

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
		/****************** GccAna_Circ2dTanOnRad ******************/
		/**** md5 signature: 4882ea5baf21191b2ba2e703d01cf447 ****/
		%feature("compactdefaultargs") GccAna_Circ2dTanOnRad;
		%feature("autodoc", "This methods implements the algorithms used to create 2d circles tangent to a circle and centered on a 2d line with a given radius. tolerance is used to find solution in every limit cases. for example tolerance is used in the case of enclosedcirc when radius-r1+dist is greater tolerance (dist is the distance between the line and the location of the circ, r1 is the radius of the circ) because there is no solution. raises negativevalue in case of negativeradius.

Parameters
----------
Qualified1: GccEnt_QualifiedCirc
OnLine: gp_Lin2d
Radius: float
Tolerance: float

Returns
-------
None
") GccAna_Circ2dTanOnRad;
		 GccAna_Circ2dTanOnRad(const GccEnt_QualifiedCirc & Qualified1, const gp_Lin2d & OnLine, const Standard_Real Radius, const Standard_Real Tolerance);

		/****************** GccAna_Circ2dTanOnRad ******************/
		/**** md5 signature: ed4bc844f130aac757078b640cf23b1b ****/
		%feature("compactdefaultargs") GccAna_Circ2dTanOnRad;
		%feature("autodoc", "This methods implements the algorithms used to create 2d circles tangent to a 2d line and centered on a 2d line with a given radius. tolerance is used to find solution in every limit cases. raises negativevalue in case of negativeradius.

Parameters
----------
Qualified1: GccEnt_QualifiedLin
OnLine: gp_Lin2d
Radius: float
Tolerance: float

Returns
-------
None
") GccAna_Circ2dTanOnRad;
		 GccAna_Circ2dTanOnRad(const GccEnt_QualifiedLin & Qualified1, const gp_Lin2d & OnLine, const Standard_Real Radius, const Standard_Real Tolerance);

		/****************** GccAna_Circ2dTanOnRad ******************/
		/**** md5 signature: 5b31fba2332b509ab5d356b81ce6ad80 ****/
		%feature("compactdefaultargs") GccAna_Circ2dTanOnRad;
		%feature("autodoc", "This methods implements the algorithms used to create 2d circles passing through a 2d point and centered on a 2d line with a given radius. tolerance is used to find solution in every limit cases.

Parameters
----------
Point1: gp_Pnt2d
OnLine: gp_Lin2d
Radius: float
Tolerance: float

Returns
-------
None
") GccAna_Circ2dTanOnRad;
		 GccAna_Circ2dTanOnRad(const gp_Pnt2d & Point1, const gp_Lin2d & OnLine, const Standard_Real Radius, const Standard_Real Tolerance);

		/****************** GccAna_Circ2dTanOnRad ******************/
		/**** md5 signature: e8d7337627d1ad5d1958c99be3fa1864 ****/
		%feature("compactdefaultargs") GccAna_Circ2dTanOnRad;
		%feature("autodoc", "This methods implements the algorithms used to create 2d circles tangent to a circle and centered on a 2d circle with a given radius. tolerance is used to find solution in every limit cases. raises negativevalue in case of negativeradius.

Parameters
----------
Qualified1: GccEnt_QualifiedCirc
OnCirc: gp_Circ2d
Radius: float
Tolerance: float

Returns
-------
None
") GccAna_Circ2dTanOnRad;
		 GccAna_Circ2dTanOnRad(const GccEnt_QualifiedCirc & Qualified1, const gp_Circ2d & OnCirc, const Standard_Real Radius, const Standard_Real Tolerance);

		/****************** GccAna_Circ2dTanOnRad ******************/
		/**** md5 signature: 4543d38f3dfd1c21786ad3aa4124e44d ****/
		%feature("compactdefaultargs") GccAna_Circ2dTanOnRad;
		%feature("autodoc", "This methods implements the algorithms used to create 2d circles tangent to a 2d line and centered on a 2d line with a given radius. tolerance is used to find solution in every limit cases. raises negativevalue in case of negativeradius.

Parameters
----------
Qualified1: GccEnt_QualifiedLin
OnCirc: gp_Circ2d
Radius: float
Tolerance: float

Returns
-------
None
") GccAna_Circ2dTanOnRad;
		 GccAna_Circ2dTanOnRad(const GccEnt_QualifiedLin & Qualified1, const gp_Circ2d & OnCirc, const Standard_Real Radius, const Standard_Real Tolerance);

		/****************** GccAna_Circ2dTanOnRad ******************/
		/**** md5 signature: cca05e8ffec318c54b70c2428c935206 ****/
		%feature("compactdefaultargs") GccAna_Circ2dTanOnRad;
		%feature("autodoc", "This methods implements the algorithms used to create 2d circles passing through a 2d point and centered on a 2d line with a given radius. tolerance is used to find solution in every limit cases. raises negativevalue in case of negativeradius.

Parameters
----------
Point1: gp_Pnt2d
OnCirc: gp_Circ2d
Radius: float
Tolerance: float

Returns
-------
None
") GccAna_Circ2dTanOnRad;
		 GccAna_Circ2dTanOnRad(const gp_Pnt2d & Point1, const gp_Circ2d & OnCirc, const Standard_Real Radius, const Standard_Real Tolerance);

		/****************** CenterOn3 ******************/
		/**** md5 signature: 713cefd806df05d39f2ba710d8a8d081 ****/
		%feature("compactdefaultargs") CenterOn3;
		%feature("autodoc", "Returns informations about the center (on the curv) of the result. pararg is the intrinsic parameter of the point on the argument curv. pntsol is the center point of the solution curv. raises notdone if the construction algorithm didn't succeed. it raises outofrange if index is greater than the number of solutions.

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
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the construction algorithm does not fail (even if it finds no solution). note: isdone protects against a failure arising from a more internal intersection algorithm, which has reached its numeric limits.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsTheSame1 ******************/
		/**** md5 signature: a8b1c8a0e7512c619b1f66f2bb9e39a6 ****/
		%feature("compactdefaultargs") IsTheSame1;
		%feature("autodoc", "Returns true if the solution number index is equal to the first argument and false in the other cases. raises notdone if the construction algorithm didn't succeed. it raises outofrange if index is greater than the number of solutions.

Parameters
----------
Index: int

Returns
-------
bool
") IsTheSame1;
		Standard_Boolean IsTheSame1(const Standard_Integer Index);

		/****************** NbSolutions ******************/
		/**** md5 signature: 02fdbddb1f7eff080419f602203d8f8b ****/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "This method returns the number of circles, representing solutions. raises notdone if the construction algorithm didn't succeed.

Returns
-------
int
") NbSolutions;
		Standard_Integer NbSolutions();

		/****************** Tangency1 ******************/
		/**** md5 signature: 2560a863e327c3fcf6bbfde26d55fd79 ****/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "Returns informations about the tangency point between the result number index and the first argument. parsol is the intrinsic parameter of the point on the solution curv. pararg is the intrinsic parameter of the point on the argument curv. pntsol is the tangency point on the solution curv. pntarg is the tangency point on the argument curv. raises notdone if the construction algorithm didn't succeed. it raises outofrange if index is greater than the number of solutions.

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
		/**** md5 signature: 6411fa8d68e628aba08bd186d18a6e49 ****/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "Returns the solution number index and raises outofrange exception if index is greater than the number of solutions. be careful: the index is only a way to get all the solutions, but is not associated to theses outside the context of the algorithm-object. raises notdone if the construction algorithm didn't succeed. it raises outofrange if index is greater than the number of solutions.

Parameters
----------
Index: int

Returns
-------
gp_Circ2d
") ThisSolution;
		gp_Circ2d ThisSolution(const Standard_Integer Index);

		/****************** WhichQualifier ******************/
		/**** md5 signature: 0ea2282c206094fba20eed9ca0e0787e ****/
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "Returns the qualifier qualif1 of the tangency argument for the solution of index index computed by this algorithm. the returned qualifier is: - that specified at the start of construction when the solutions are defined as enclosed, enclosing or outside with respect to the argument, or - that computed during construction (i.e. enclosed, enclosing or outside) when the solutions are defined as unqualified with respect to the argument, or - gccent_noqualifier if the tangency argument is a point. exceptions standard_outofrange if index is less than zero or greater than the number of solutions computed by this algorithm. stdfail_notdone if the construction fails.

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
		/****************** GccAna_CircLin2dBisec ******************/
		/**** md5 signature: b67f5059aeaf823e002bf5c3d9cbc6fb ****/
		%feature("compactdefaultargs") GccAna_CircLin2dBisec;
		%feature("autodoc", "Constructs bisecting curves between the circle circle and the line line.

Parameters
----------
Circle: gp_Circ2d
Line: gp_Lin2d

Returns
-------
None
") GccAna_CircLin2dBisec;
		 GccAna_CircLin2dBisec(const gp_Circ2d & Circle, const gp_Lin2d & Line);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true (this construction algorithm never fails).

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbSolutions ******************/
		/**** md5 signature: 02fdbddb1f7eff080419f602203d8f8b ****/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Returns the number of curves, representing solutions computed by this algorithm.

Returns
-------
int
") NbSolutions;
		Standard_Integer NbSolutions();

		/****************** ThisSolution ******************/
		/**** md5 signature: 6df4cf8ad902f791256b807b0a0d0bd3 ****/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "Returns the solution number index and raises outofrange exception if index is greater than the number of solutions exceptions standard_outofrange if index is less than zero or greater than the number of solutions computed by this algorithm.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<GccInt_Bisec>
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
		/****************** GccAna_CircPnt2dBisec ******************/
		/**** md5 signature: b15af1e7a4aa95b21ea9f592a088b788 ****/
		%feature("compactdefaultargs") GccAna_CircPnt2dBisec;
		%feature("autodoc", "Constructs bisecting curves between the circle circle1 and the point point2.

Parameters
----------
Circle1: gp_Circ2d
Point2: gp_Pnt2d

Returns
-------
None
") GccAna_CircPnt2dBisec;
		 GccAna_CircPnt2dBisec(const gp_Circ2d & Circle1, const gp_Pnt2d & Point2);

		/****************** GccAna_CircPnt2dBisec ******************/
		/**** md5 signature: 9b11df42db407bd8004cdfb8fd5173ef ****/
		%feature("compactdefaultargs") GccAna_CircPnt2dBisec;
		%feature("autodoc", "Constructs bisecting curves between the circle circle1 and the point point2. tolerance is used.

Parameters
----------
Circle1: gp_Circ2d
Point2: gp_Pnt2d
Tolerance: float

Returns
-------
None
") GccAna_CircPnt2dBisec;
		 GccAna_CircPnt2dBisec(const gp_Circ2d & Circle1, const gp_Pnt2d & Point2, const Standard_Real Tolerance);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true (this construction algorithm never fails).

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbSolutions ******************/
		/**** md5 signature: 02fdbddb1f7eff080419f602203d8f8b ****/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Returns the number of curves, representing solutions computed by this algorithm.

Returns
-------
int
") NbSolutions;
		Standard_Integer NbSolutions();

		/****************** ThisSolution ******************/
		/**** md5 signature: 6df4cf8ad902f791256b807b0a0d0bd3 ****/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "Returns the solution number index and raises outofrange exception if index is greater than the number of solutions. exceptions standard_outofrange if index is less than zero or greater than the number of solutions computed by this algorithm.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<GccInt_Bisec>
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
		/****************** GccAna_Lin2d2Tan ******************/
		/**** md5 signature: d217055dd19c4ad537b6670197044029 ****/
		%feature("compactdefaultargs") GccAna_Lin2d2Tan;
		%feature("autodoc", "This methods implements the algorithms used to create 2d lines passing thrue 2 points. tolerance is used because we can't create a line when the distance between the two points is too small.

Parameters
----------
ThePoint1: gp_Pnt2d
ThePoint2: gp_Pnt2d
Tolerance: float

Returns
-------
None
") GccAna_Lin2d2Tan;
		 GccAna_Lin2d2Tan(const gp_Pnt2d & ThePoint1, const gp_Pnt2d & ThePoint2, const Standard_Real Tolerance);

		/****************** GccAna_Lin2d2Tan ******************/
		/**** md5 signature: bdc59b7aa8cd6b8f75211b5ebd7a8b08 ****/
		%feature("compactdefaultargs") GccAna_Lin2d2Tan;
		%feature("autodoc", "This methods implements the algorithms used to create 2d lines tangent to one circle and passing thrue a point. exception badqualifier is raised in the case of enclosedcirc tolerance is used because there is no solution when the point is inside the solution according to the tolerance.

Parameters
----------
Qualified1: GccEnt_QualifiedCirc
ThePoint: gp_Pnt2d
Tolerance: float

Returns
-------
None
") GccAna_Lin2d2Tan;
		 GccAna_Lin2d2Tan(const GccEnt_QualifiedCirc & Qualified1, const gp_Pnt2d & ThePoint, const Standard_Real Tolerance);

		/****************** GccAna_Lin2d2Tan ******************/
		/**** md5 signature: 8ac973a5ba56fea5ba95c5ad802a7d7d ****/
		%feature("compactdefaultargs") GccAna_Lin2d2Tan;
		%feature("autodoc", "This methods implements the algorithms used to create 2d lines tangent to 2 circles. exception badqualifier is raised in the case of enclosedcirc.

Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Qualified2: GccEnt_QualifiedCirc
Tolerance: float

Returns
-------
None
") GccAna_Lin2d2Tan;
		 GccAna_Lin2d2Tan(const GccEnt_QualifiedCirc & Qualified1, const GccEnt_QualifiedCirc & Qualified2, const Standard_Real Tolerance);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "This method returns true when there is a solution and false in the other cases.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbSolutions ******************/
		/**** md5 signature: 02fdbddb1f7eff080419f602203d8f8b ****/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "This method returns the number of solutions. raises notdone if the construction algorithm didn't succeed.

Returns
-------
int
") NbSolutions;
		Standard_Integer NbSolutions();

		/****************** Tangency1 ******************/
		/**** md5 signature: 2560a863e327c3fcf6bbfde26d55fd79 ****/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "Returns informations about the tangency point between the result number index and the first argument. parsol is the intrinsic parameter of the point pntsol on the solution curv. pararg is the intrinsic parameter of the point pntsol on the argument curv. raises outofrange is raised if index is greater than the number of solutions. it raises notdone if the algorithm failed.

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
		/**** md5 signature: aa2c229192467eeb8e5b8843ab43ae52 ****/
		%feature("compactdefaultargs") Tangency2;
		%feature("autodoc", "Returns informations about the tangency point between the result number index and the second argument. parsol is the intrinsic parameter of the point parsol on the solution curv. pararg is the intrinsic parameter of the point pntsol on the argument curv. raises outofrange is raised if index is greater than the number of solutions. it raises notdone if the algorithm failed.

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
		/**** md5 signature: 96dd6b3b788fc0b155d75bed87794c74 ****/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "Returns the solution number index and raises outofrange exception if index is greater than the number of solutions. be carefull: the index is only a way to get all the solutions, but is not associated to theses outside the context of the algorithm-object. raises outofrange is raised if index is greater than the number of solutions. it raises notdone if the algorithm failed.

Parameters
----------
Index: int

Returns
-------
gp_Lin2d
") ThisSolution;
		gp_Lin2d ThisSolution(const Standard_Integer Index);

		/****************** WhichQualifier ******************/
		/**** md5 signature: 6aa541a02c7988b37a04a532d9174284 ****/
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
		/****************** GccAna_Lin2dBisec ******************/
		/**** md5 signature: 27748dfa51dc753aa7d97ccfd97888cc ****/
		%feature("compactdefaultargs") GccAna_Lin2dBisec;
		%feature("autodoc", "Constructs bisecting lines between the two lines lin1 and lin2.

Parameters
----------
Lin1: gp_Lin2d
Lin2: gp_Lin2d

Returns
-------
None
") GccAna_Lin2dBisec;
		 GccAna_Lin2dBisec(const gp_Lin2d & Lin1, const gp_Lin2d & Lin2);

		/****************** Intersection1 ******************/
		/**** md5 signature: 77db5554380ec88a636c5d923715b5a3 ****/
		%feature("compactdefaultargs") Intersection1;
		%feature("autodoc", "Returns informations about the intersection point between the result number index and the first argument. raises notdone if the construction algorithm didn't succeed. it raises outofrange if index is greater than the number of solutions.

Parameters
----------
Index: int
PntSol: gp_Pnt2d

Returns
-------
ParSol: float
ParArg: float
") Intersection1;
		void Intersection1(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & PntSol);

		/****************** Intersection2 ******************/
		/**** md5 signature: 3a8002e96f3bc12ac0919f98e024e3f2 ****/
		%feature("compactdefaultargs") Intersection2;
		%feature("autodoc", "Returns informations about the intersection point between the result number index and the second argument. raises notdone if the construction algorithm didn't succeed. it raises outofrange if index is greater than the number of solutions.

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
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true when the algorithm succeded.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbSolutions ******************/
		/**** md5 signature: 02fdbddb1f7eff080419f602203d8f8b ****/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Returns the number of solutions and raise notdone if the constructor wasn't called before.

Returns
-------
int
") NbSolutions;
		Standard_Integer NbSolutions();

		/****************** ThisSolution ******************/
		/**** md5 signature: 96dd6b3b788fc0b155d75bed87794c74 ****/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "Returns the solution number index . the first solution is the inside one and the second is the outside one. for the first solution the direction is d1+d2 (d1 is the direction of the first argument and d2 the direction of the second argument). for the second solution the direction is d1-d2. raises notdone if the construction algorithm didn't succeed. it raises outofrange if index is greater than the number of solutions.

Parameters
----------
Index: int

Returns
-------
gp_Lin2d
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
		/****************** GccAna_Lin2dTanObl ******************/
		/**** md5 signature: 7eb2845925f436aa37476ec0a3500de7 ****/
		%feature("compactdefaultargs") GccAna_Lin2dTanObl;
		%feature("autodoc", "This class implements the algorithms used to create 2d line passing through a point and making an angle with a line.

Parameters
----------
ThePoint: gp_Pnt2d
TheLine: gp_Lin2d
TheAngle: float

Returns
-------
None
") GccAna_Lin2dTanObl;
		 GccAna_Lin2dTanObl(const gp_Pnt2d & ThePoint, const gp_Lin2d & TheLine, const Standard_Real TheAngle);

		/****************** GccAna_Lin2dTanObl ******************/
		/**** md5 signature: f43e6e3fb85ca36e1c44a55e5df13fb3 ****/
		%feature("compactdefaultargs") GccAna_Lin2dTanObl;
		%feature("autodoc", "This class implements the algorithms used to create 2d line tangent to a circle and making an angle with a line. exceptions gccent_badqualifier if a qualifier is inconsistent with the argument it qualifies (for example, enclosed for a circle).

Parameters
----------
Qualified1: GccEnt_QualifiedCirc
TheLine: gp_Lin2d
TheAngle: float

Returns
-------
None
") GccAna_Lin2dTanObl;
		 GccAna_Lin2dTanObl(const GccEnt_QualifiedCirc & Qualified1, const gp_Lin2d & TheLine, const Standard_Real TheAngle);

		/****************** Intersection2 ******************/
		/**** md5 signature: 3a8002e96f3bc12ac0919f98e024e3f2 ****/
		%feature("compactdefaultargs") Intersection2;
		%feature("autodoc", "Returns informations about the intersection between the result number index and the third argument. raises notdone if the construction algorithm didn't succeed. it raises outofrange if index is greater than the number of solutions.

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
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the algorithm succeeded. note: isdone protects against a failure arising from a more internal intersection algorithm, which has reached its numeric limits.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbSolutions ******************/
		/**** md5 signature: 02fdbddb1f7eff080419f602203d8f8b ****/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Returns the number of of lines, representing solutions computed by this algorithm. raises notdone if the construction algorithm didn't succeed.

Returns
-------
int
") NbSolutions;
		Standard_Integer NbSolutions();

		/****************** Tangency1 ******************/
		/**** md5 signature: 2560a863e327c3fcf6bbfde26d55fd79 ****/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "Returns informations about the tangency point between the result number index and the first argument. parsol is the intrinsic parameter of the point parsol on the solution curv. pararg is the intrinsic parameter of the point pararg on the argument curv. raises notdone if the construction algorithm didn't succeed. it raises outofrange if index is greater than the number of solutions.

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
		/**** md5 signature: 96dd6b3b788fc0b155d75bed87794c74 ****/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "Returns the solution number index. be careful: the index is only a way to get all the solutions, but is not associated to theses outside the context of the algorithm-object. raises notdone if the construction algorithm didn't succeed. it raises outofrange if index is greater than the number of solutions.

Parameters
----------
Index: int

Returns
-------
gp_Lin2d
") ThisSolution;
		gp_Lin2d ThisSolution(const Standard_Integer Index);

		/****************** WhichQualifier ******************/
		/**** md5 signature: 0ea2282c206094fba20eed9ca0e0787e ****/
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
		/****************** GccAna_Lin2dTanPar ******************/
		/**** md5 signature: c881afbdd634f9df839fddb1eeb9ac71 ****/
		%feature("compactdefaultargs") GccAna_Lin2dTanPar;
		%feature("autodoc", "This method implements the algorithms used to create a 2d line passing through a point and parallel to another line.

Parameters
----------
ThePoint: gp_Pnt2d
Lin1: gp_Lin2d

Returns
-------
None
") GccAna_Lin2dTanPar;
		 GccAna_Lin2dTanPar(const gp_Pnt2d & ThePoint, const gp_Lin2d & Lin1);

		/****************** GccAna_Lin2dTanPar ******************/
		/**** md5 signature: 89c33b03f29a6a0f5a40629902b88bea ****/
		%feature("compactdefaultargs") GccAna_Lin2dTanPar;
		%feature("autodoc", "This method implements the algorithms used to create a 2d line tangent to a circle and parallel to another line. it raises badqualifier in case of enclosedcirc. exceptions gccent_badqualifier if a qualifier is inconsistent with the argument it qualifies (for example, enclosed for a circle).

Parameters
----------
Qualified1: GccEnt_QualifiedCirc
Lin1: gp_Lin2d

Returns
-------
None
") GccAna_Lin2dTanPar;
		 GccAna_Lin2dTanPar(const GccEnt_QualifiedCirc & Qualified1, const gp_Lin2d & Lin1);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the algorithm succeeded.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbSolutions ******************/
		/**** md5 signature: 02fdbddb1f7eff080419f602203d8f8b ****/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Returns the number of solutions. raises notdone if the construction algorithm didn't succeed.

Returns
-------
int
") NbSolutions;
		Standard_Integer NbSolutions();

		/****************** Tangency1 ******************/
		/**** md5 signature: ac6b428c3f88d193815480de09ccbe56 ****/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "Returns informations about the tangency point between the result number index and the first argument. parsol is the intrinsic parameter of the point on the solution curv. pararg is the intrinsic parameter of the point on the argument curv. pararg is equal 0 when the solution is passing thrue a point. raises notdone if the construction algorithm didn't succeed. it raises outofrange if index is greater than the number of solutions.

Parameters
----------
Index: int
Pnt: gp_Pnt2d

Returns
-------
ParSol: float
ParArg: float
") Tangency1;
		void Tangency1(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & Pnt);

		/****************** ThisSolution ******************/
		/**** md5 signature: 96dd6b3b788fc0b155d75bed87794c74 ****/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "Returns the solution number index and raises outofrange exception if index is greater than the number of solutions. be careful: the index is only a way to get all the solutions, but is not associated to those outside the context of the algorithm-object. raises notdone if the construction algorithm didn't succeed. it raises outofrange if index is greater than the number of solutions.

Parameters
----------
Index: int

Returns
-------
gp_Lin2d
") ThisSolution;
		gp_Lin2d ThisSolution(const Standard_Integer Index);

		/****************** WhichQualifier ******************/
		/**** md5 signature: 0ea2282c206094fba20eed9ca0e0787e ****/
		%feature("compactdefaultargs") WhichQualifier;
		%feature("autodoc", "Returns the informations about the qualifiers of the tangency arguments concerning the solution number index. it returns the real qualifiers (the qualifiers given to the constructor method in case of enclosed, enclosing and outside and the qualifiers computed in case of unqualified). raises notdone if the construction algorithm didn't succeed. it raises outofrange if index is greater than the number of solutions.

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
		/****************** GccAna_Lin2dTanPer ******************/
		/**** md5 signature: f6bf9d44d3e72f4cec3042dce7defa9a ****/
		%feature("compactdefaultargs") GccAna_Lin2dTanPer;
		%feature("autodoc", "This method implements the algorithms used to create 2d lines passing through a point and perpendicular to a line.

Parameters
----------
ThePnt: gp_Pnt2d
TheLin: gp_Lin2d

Returns
-------
None
") GccAna_Lin2dTanPer;
		 GccAna_Lin2dTanPer(const gp_Pnt2d & ThePnt, const gp_Lin2d & TheLin);

		/****************** GccAna_Lin2dTanPer ******************/
		/**** md5 signature: 374b2546dad202788116acf69bed120f ****/
		%feature("compactdefaultargs") GccAna_Lin2dTanPer;
		%feature("autodoc", "This method implements the algorithms used to create 2d lines passing through a point and perpendicular to a circle.

Parameters
----------
ThePnt: gp_Pnt2d
TheCircle: gp_Circ2d

Returns
-------
None
") GccAna_Lin2dTanPer;
		 GccAna_Lin2dTanPer(const gp_Pnt2d & ThePnt, const gp_Circ2d & TheCircle);

		/****************** GccAna_Lin2dTanPer ******************/
		/**** md5 signature: 79faa2fb57bccb81e97ae06a99138b62 ****/
		%feature("compactdefaultargs") GccAna_Lin2dTanPer;
		%feature("autodoc", "This method implements the algorithms used to create 2d lines tangent to a circle and perpendicular to a line.

Parameters
----------
Qualified1: GccEnt_QualifiedCirc
TheLin: gp_Lin2d

Returns
-------
None
") GccAna_Lin2dTanPer;
		 GccAna_Lin2dTanPer(const GccEnt_QualifiedCirc & Qualified1, const gp_Lin2d & TheLin);

		/****************** GccAna_Lin2dTanPer ******************/
		/**** md5 signature: 6f6ba382cc8ec2155da6b36128c79d63 ****/
		%feature("compactdefaultargs") GccAna_Lin2dTanPer;
		%feature("autodoc", "This method implements the algorithms used to create 2d lines tangent to a circle and perpendicular to a circle.

Parameters
----------
Qualified1: GccEnt_QualifiedCirc
TheCircle: gp_Circ2d

Returns
-------
None
") GccAna_Lin2dTanPer;
		 GccAna_Lin2dTanPer(const GccEnt_QualifiedCirc & Qualified1, const gp_Circ2d & TheCircle);

		/****************** Intersection2 ******************/
		/**** md5 signature: 3a8002e96f3bc12ac0919f98e024e3f2 ****/
		%feature("compactdefaultargs") Intersection2;
		%feature("autodoc", "Returns informations about the intersection between the solution number index and the second argument. it returns the first intersection in a case of lin2dtanper which is perpendicular to a circle . parsol is the intrinsic parameter of the point on the solution curv. pararg is the intrinsic parameter of the point on the argument curv. raises notdone if the construction algorithm didn't succeed. it raises outofrange if index is greater than the number of solutions.

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
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the algorithm succeeded.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbSolutions ******************/
		/**** md5 signature: 02fdbddb1f7eff080419f602203d8f8b ****/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Returns the number of solutions. raises notdone if the construction algorithm didn't succeed.

Returns
-------
int
") NbSolutions;
		Standard_Integer NbSolutions();

		/****************** Tangency1 ******************/
		/**** md5 signature: ac6b428c3f88d193815480de09ccbe56 ****/
		%feature("compactdefaultargs") Tangency1;
		%feature("autodoc", "Returns informations about the tangency point between the result number index and the first argument. parsol is the intrinsic parameter of the point on the solution curv. pararg is the intrinsic parameter of the point on the argument curv. if the first argument is a point pararg is equal zero. raises notdone if the construction algorithm didn't succeed. it raises outofrange if index is greater than the number of solutions.

Parameters
----------
Index: int
Pnt: gp_Pnt2d

Returns
-------
ParSol: float
ParArg: float
") Tangency1;
		void Tangency1(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & Pnt);

		/****************** ThisSolution ******************/
		/**** md5 signature: 96dd6b3b788fc0b155d75bed87794c74 ****/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "Returns the solution number index and raises outofrange exception if index is greater than the number of solutions. be careful: the index is only a way to get all the solutions, but is not associated to those outside the context of the algorithm-object. raises notdone if the construction algorithm didn't succeed. it raises outofrange if index is greater than the number of solutions.

Parameters
----------
Index: int

Returns
-------
gp_Lin2d
") ThisSolution;
		gp_Lin2d ThisSolution(const Standard_Integer Index);

		/****************** WhichQualifier ******************/
		/**** md5 signature: 0ea2282c206094fba20eed9ca0e0787e ****/
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
		/****************** GccAna_LinPnt2dBisec ******************/
		/**** md5 signature: 9b8fb736653b04a51d78e905419cfbb4 ****/
		%feature("compactdefaultargs") GccAna_LinPnt2dBisec;
		%feature("autodoc", "Constructs a bisecting curve between the line line1 and the point point2.

Parameters
----------
Line1: gp_Lin2d
Point2: gp_Pnt2d

Returns
-------
None
") GccAna_LinPnt2dBisec;
		 GccAna_LinPnt2dBisec(const gp_Lin2d & Line1, const gp_Pnt2d & Point2);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the algorithm succeeded.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** ThisSolution ******************/
		/**** md5 signature: 638689030e006ab6b93f0c543a450e90 ****/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "Returns the number of solutions. it raises notdone if the construction algorithm didn't succeed.

Returns
-------
opencascade::handle<GccInt_Bisec>
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
		/****************** GccAna_Pnt2dBisec ******************/
		/**** md5 signature: eb68fafde6440a59d787a34fe2c63f6b ****/
		%feature("compactdefaultargs") GccAna_Pnt2dBisec;
		%feature("autodoc", "Constructs a bisecting line between the points point1 and point2.

Parameters
----------
Point1: gp_Pnt2d
Point2: gp_Pnt2d

Returns
-------
None
") GccAna_Pnt2dBisec;
		 GccAna_Pnt2dBisec(const gp_Pnt2d & Point1, const gp_Pnt2d & Point2);

		/****************** HasSolution ******************/
		/**** md5 signature: f9ff4e6e008069e4ae618904bd89decf ****/
		%feature("compactdefaultargs") HasSolution;
		%feature("autodoc", "Returns true if this algorithm has a solution, i.e. if the two points are not coincident.

Returns
-------
bool
") HasSolution;
		Standard_Boolean HasSolution();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true (this construction algorithm never fails).

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** ThisSolution ******************/
		/**** md5 signature: 4236a79f3dec284a3f8c2579f4fda830 ****/
		%feature("compactdefaultargs") ThisSolution;
		%feature("autodoc", "Returns a line, representing the solution computed by this algorithm.

Returns
-------
gp_Lin2d
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
