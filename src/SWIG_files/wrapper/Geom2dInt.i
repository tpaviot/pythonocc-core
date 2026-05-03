/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
%define GEOM2DINTDOCSTRING
"Geom2dInt module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_geom2dint.html"
%enddef
%module (package="OCC.Core", docstring=GEOM2DINTDOCSTRING) Geom2dInt


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
#include<Geom2dInt_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Adaptor2d_module.hxx>
#include<IntRes2d_module.hxx>
#include<gp_module.hxx>
#include<GeomAbs_module.hxx>
#include<math_module.hxx>
#include<IntCurve_module.hxx>
#include<Intf_module.hxx>
#include<Bnd_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Adaptor2d.i
%import IntRes2d.i
%import gp.i
%import GeomAbs.i
%import math.i
%import IntCurve.i
%import Intf.i
%import Bnd.i

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

/*********************************************************************
* class Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter *
*********************************************************************/
class Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter {
	public:
		/****** Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter::Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter ******/
		/****** md5 signature: e711bb5665d6278e16b2d7daa512a799 ******/
		%feature("compactdefaultargs") Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter;
		 Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2, const double Tol);

		/****** Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter::AnErrorOccurred ******/
		/****** md5 signature: 7d94c3d5c515369c6ad5964d268d2351 ******/
		%feature("compactdefaultargs") AnErrorOccurred;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") AnErrorOccurred;
		bool AnErrorOccurred();

		/****** Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter::NbRoots ******/
		/****** md5 signature: fe443a1190b192943b5fddf45586a22a ******/
		%feature("compactdefaultargs") NbRoots;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbRoots;
		int NbRoots();

		/****** Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter::Perform ******/
		/****** md5 signature: ce04bde38348e78f2039e38b019edb18 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Poly1: Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter
Poly2: Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter

Return
-------
NumSegOn1: int
NumSegOn2: int
ParamOnSeg1: double
ParamOnSeg2: double

Description
-----------
No available documentation.
") Perform;
		void Perform(const Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter & Poly1, const Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter & Poly2, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter::Perform ******/
		/****** md5 signature: b341aed1ff0668c7471621afc1e6ebee ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Uo: double
Vo: double
UInf: double
VInf: double
USup: double
VSup: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const double Uo, const double Vo, const double UInf, const double VInf, const double USup, const double VSup);

		/****** Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter::Roots ******/
		/****** md5 signature: 924b6eebb61ca2e1dfbab661d402f781 ******/
		%feature("compactdefaultargs") Roots;
		%feature("autodoc", "
Parameters
----------

Return
-------
U: double
V: double

Description
-----------
No available documentation.
") Roots;
		void Roots(Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Geom2dInt_GInter *
*************************/
class Geom2dInt_GInter : public IntRes2d_Intersection {
	public:
		/****** Geom2dInt_GInter::Geom2dInt_GInter ******/
		/****** md5 signature: 672e83162d340450c3b90f88abfc10a8 ******/
		%feature("compactdefaultargs") Geom2dInt_GInter;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Geom2dInt_GInter;
		 Geom2dInt_GInter();

		/****** Geom2dInt_GInter::Geom2dInt_GInter ******/
		/****** md5 signature: a1f7461af84e6187951c23ea722e62bc ******/
		%feature("compactdefaultargs") Geom2dInt_GInter;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Self Intersection of a curve.
") Geom2dInt_GInter;
		 Geom2dInt_GInter(const Adaptor2d_Curve2d & C, const double TolConf, const double Tol);

		/****** Geom2dInt_GInter::Geom2dInt_GInter ******/
		/****** md5 signature: dee0f4948c7e5d66270edf4772bb5725 ******/
		%feature("compactdefaultargs") Geom2dInt_GInter;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
D: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Self Intersection of a curve with a domain.
") Geom2dInt_GInter;
		 Geom2dInt_GInter(const Adaptor2d_Curve2d & C, const IntRes2d_Domain & D, const double TolConf, const double Tol);

		/****** Geom2dInt_GInter::Geom2dInt_GInter ******/
		/****** md5 signature: 185a4144d18cd42c04d159327b4d8667 ******/
		%feature("compactdefaultargs") Geom2dInt_GInter;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between 2 curves.
") Geom2dInt_GInter;
		 Geom2dInt_GInter(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2, const double TolConf, const double Tol);

		/****** Geom2dInt_GInter::Geom2dInt_GInter ******/
		/****** md5 signature: 473dd004d3c4cb530665a79a07cb193a ******/
		%feature("compactdefaultargs") Geom2dInt_GInter;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor2d_Curve2d
D1: IntRes2d_Domain
C2: Adaptor2d_Curve2d
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between 2 curves.
") Geom2dInt_GInter;
		 Geom2dInt_GInter(const Adaptor2d_Curve2d & C1, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & C2, const double TolConf, const double Tol);

		/****** Geom2dInt_GInter::Geom2dInt_GInter ******/
		/****** md5 signature: 8642732b3bcdfa6549698f8b578d02bc ******/
		%feature("compactdefaultargs") Geom2dInt_GInter;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between 2 curves.
") Geom2dInt_GInter;
		 Geom2dInt_GInter(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** Geom2dInt_GInter::Geom2dInt_GInter ******/
		/****** md5 signature: 852b380b9d0240a67fdb8d98d17f6b15 ******/
		%feature("compactdefaultargs") Geom2dInt_GInter;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor2d_Curve2d
D1: IntRes2d_Domain
C2: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between 2 curves.
") Geom2dInt_GInter;
		 Geom2dInt_GInter(const Adaptor2d_Curve2d & C1, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & C2, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** Geom2dInt_GInter::ComputeDomain ******/
		/****** md5 signature: 4fe5fb09803e2e6dac06929cfe919f07 ******/
		%feature("compactdefaultargs") ComputeDomain;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor2d_Curve2d
TolDomain: double

Return
-------
IntRes2d_Domain

Description
-----------
Create a domain from a curve.
") ComputeDomain;
		IntRes2d_Domain ComputeDomain(const Adaptor2d_Curve2d & C1, const double TolDomain);

		/****** Geom2dInt_GInter::GetMinNbSamples ******/
		/****** md5 signature: fd21667dcec0124f6dfae4103cb5ec2b ******/
		%feature("compactdefaultargs") GetMinNbSamples;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") GetMinNbSamples;
		int GetMinNbSamples();

		/****** Geom2dInt_GInter::Perform ******/
		/****** md5 signature: 16348e04075cdbfdec69b3b2baadeac6 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor2d_Curve2d
D1: IntRes2d_Domain
C2: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between 2 curves.
") Perform;
		void Perform(const Adaptor2d_Curve2d & C1, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & C2, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** Geom2dInt_GInter::Perform ******/
		/****** md5 signature: cf864fa9028146a43d65b84757ec19b8 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between 2 curves.
") Perform;
		void Perform(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2, const double TolConf, const double Tol);

		/****** Geom2dInt_GInter::Perform ******/
		/****** md5 signature: 61609f8fc4f1082d4e6da81212ee0a79 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor2d_Curve2d
D1: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between 2 curves.
") Perform;
		void Perform(const Adaptor2d_Curve2d & C1, const IntRes2d_Domain & D1, const double TolConf, const double Tol);

		/****** Geom2dInt_GInter::Perform ******/
		/****** md5 signature: 31ea4182f3f28a58d9acf37307a383d0 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor2d_Curve2d
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between 2 curves.
") Perform;
		void Perform(const Adaptor2d_Curve2d & C1, const double TolConf, const double Tol);

		/****** Geom2dInt_GInter::Perform ******/
		/****** md5 signature: 0280260c061d72df0dda4fc5b8cb627f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor2d_Curve2d
D1: IntRes2d_Domain
C2: Adaptor2d_Curve2d
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between 2 curves.
") Perform;
		void Perform(const Adaptor2d_Curve2d & C1, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & C2, const double TolConf, const double Tol);

		/****** Geom2dInt_GInter::Perform ******/
		/****** md5 signature: df75b42c8ab8d12a7695eaaca06945ff ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between 2 curves.
") Perform;
		void Perform(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** Geom2dInt_GInter::SetMinNbSamples ******/
		/****** md5 signature: 9d653919fbe121787c6b21a6579f45a2 ******/
		%feature("compactdefaultargs") SetMinNbSamples;
		%feature("autodoc", "
Parameters
----------
theMinNbSamples: int

Return
-------
None

Description
-----------
Set / get minimum number of points in polygon intersection.
") SetMinNbSamples;
		void SetMinNbSamples(const int theMinNbSamples);

};


%extend Geom2dInt_GInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class Geom2dInt_Geom2dCurveTool *
**********************************/
class Geom2dInt_Geom2dCurveTool {
	public:
		/****** Geom2dInt_Geom2dCurveTool::Circle ******/
		/****** md5 signature: f83d3b524bcebc84f76bd577a264bd65 ******/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
gp_Circ2d

Description
-----------
Returns the Circ2d from gp corresponding to the curve C. This method is called only when TheType returns GeomAbs_Circle.
") Circle;
		static gp_Circ2d Circle(const Adaptor2d_Curve2d & C);

		/****** Geom2dInt_Geom2dCurveTool::D0 ******/
		/****** md5 signature: d3800ec495da5f633be0d563f2dc746d ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U: double
P: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") D0;
		static void D0(const Adaptor2d_Curve2d & C, const double U, gp_Pnt2d & P);

		/****** Geom2dInt_Geom2dCurveTool::D1 ******/
		/****** md5 signature: 19142f443e55440f0963f9ce1b0fdacf ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
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
		static void D1(const Adaptor2d_Curve2d & C, const double U, gp_Pnt2d & P, gp_Vec2d & T);

		/****** Geom2dInt_Geom2dCurveTool::D2 ******/
		/****** md5 signature: 42a0c882bd7422902551e0b2f4160ea2 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
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
		static void D2(const Adaptor2d_Curve2d & C, const double U, gp_Pnt2d & P, gp_Vec2d & T, gp_Vec2d & N);

		/****** Geom2dInt_Geom2dCurveTool::D3 ******/
		/****** md5 signature: 5875681113dc6b130051626fad8c2f78 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U: double
P: gp_Pnt2d
T: gp_Vec2d
N: gp_Vec2d
V: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") D3;
		static void D3(const Adaptor2d_Curve2d & C, const double U, gp_Pnt2d & P, gp_Vec2d & T, gp_Vec2d & N, gp_Vec2d & V);

		/****** Geom2dInt_Geom2dCurveTool::DN ******/
		/****** md5 signature: ab6112d52fadcd8cf80f60bb7831387b ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U: double
N: int

Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") DN;
		static gp_Vec2d DN(const Adaptor2d_Curve2d & C, const double U, const int N);

		/****** Geom2dInt_Geom2dCurveTool::Degree ******/
		/****** md5 signature: 17537a7df466386117ebaf44cea4ee79 ******/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
int

Description
-----------
No available documentation.
") Degree;
		static int Degree(const Adaptor2d_Curve2d & C);

		/****** Geom2dInt_Geom2dCurveTool::Ellipse ******/
		/****** md5 signature: 6b3d2146deb980d4d62eb8bafed2a0e1 ******/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
gp_Elips2d

Description
-----------
Returns the Elips2d from gp corresponding to the curve C. This method is called only when TheType returns GeomAbs_Ellipse.
") Ellipse;
		static gp_Elips2d Ellipse(const Adaptor2d_Curve2d & C);

		/****** Geom2dInt_Geom2dCurveTool::EpsX ******/
		/****** md5 signature: b0d9643be70b9ec6e904d11f7035f491 ******/
		%feature("compactdefaultargs") EpsX;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
double

Description
-----------
No available documentation.
") EpsX;
		static double EpsX(const Adaptor2d_Curve2d & C);

		/****** Geom2dInt_Geom2dCurveTool::EpsX ******/
		/****** md5 signature: 59feef605b05104aee0867d607fbf37d ******/
		%feature("compactdefaultargs") EpsX;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
Eps_XYZ: double

Return
-------
double

Description
-----------
No available documentation.
") EpsX;
		static double EpsX(const Adaptor2d_Curve2d & C, const double Eps_XYZ);

		/****** Geom2dInt_Geom2dCurveTool::FirstParameter ******/
		/****** md5 signature: b1ddbab00f901132cfc6e1721dd13a91 ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
double

Description
-----------
No available documentation.
") FirstParameter;
		static double FirstParameter(const Adaptor2d_Curve2d & C);

		/****** Geom2dInt_Geom2dCurveTool::GetInterval ******/
		/****** md5 signature: d1c89e5044a7a4244d977045cafed144 ******/
		%feature("compactdefaultargs") GetInterval;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
Index: int
Tab: NCollection_Array1<double>

Return
-------
U1: double
U2: double

Description
-----------
output the bounds of interval of index <Index> used if Type == Composite.
") GetInterval;
		static void GetInterval(const Adaptor2d_Curve2d & C, const int Index, const NCollection_Array1<double> & Tab, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Geom2dInt_Geom2dCurveTool::GetType ******/
		/****** md5 signature: 3307087cce71727ba86c3994c56d1dfd ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
GeomAbs_CurveType

Description
-----------
No available documentation.
") GetType;
		static GeomAbs_CurveType GetType(const Adaptor2d_Curve2d & C);

		/****** Geom2dInt_Geom2dCurveTool::Hyperbola ******/
		/****** md5 signature: d765efdcf68c3ccb564b090d516d2f0c ******/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
gp_Hypr2d

Description
-----------
Returns the Hypr2d from gp corresponding to the curve C. This method is called only when TheType returns GeomAbs_Hyperbola.
") Hyperbola;
		static gp_Hypr2d Hyperbola(const Adaptor2d_Curve2d & C);

		/****** Geom2dInt_Geom2dCurveTool::Intervals ******/
		/****** md5 signature: adb52a15005749a51e42f1542dc43632 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
Tab: NCollection_Array1<double>

Return
-------
None

Description
-----------
compute Tab.
") Intervals;
		static void Intervals(const Adaptor2d_Curve2d & C, NCollection_Array1<double> & Tab);

		/****** Geom2dInt_Geom2dCurveTool::LastParameter ******/
		/****** md5 signature: 6ee41bce6c1996bc4bd48036bcb7bcfd ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
double

Description
-----------
No available documentation.
") LastParameter;
		static double LastParameter(const Adaptor2d_Curve2d & C);

		/****** Geom2dInt_Geom2dCurveTool::Line ******/
		/****** md5 signature: 2ed473b8b806549a67acbbb8f7054334 ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
gp_Lin2d

Description
-----------
Returns the Lin2d from gp corresponding to the curve C. This method is called only when TheType returns GeomAbs_Line.
") Line;
		static gp_Lin2d Line(const Adaptor2d_Curve2d & C);

		/****** Geom2dInt_Geom2dCurveTool::NbIntervals ******/
		/****** md5 signature: bd0764af60cb99ce975790d73c8a8c09 ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
int

Description
-----------
output the number of interval of continuity C2 of the curve.
") NbIntervals;
		static int NbIntervals(const Adaptor2d_Curve2d & C);

		/****** Geom2dInt_Geom2dCurveTool::NbSamples ******/
		/****** md5 signature: 9eb5230dcc9304917f037a7300ca72fa ******/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
int

Description
-----------
No available documentation.
") NbSamples;
		static int NbSamples(const Adaptor2d_Curve2d & C);

		/****** Geom2dInt_Geom2dCurveTool::NbSamples ******/
		/****** md5 signature: 1999384af509f1adfc2dda97c23e8216 ******/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U0: double
U1: double

Return
-------
int

Description
-----------
No available documentation.
") NbSamples;
		static int NbSamples(const Adaptor2d_Curve2d & C, const double U0, const double U1);

		/****** Geom2dInt_Geom2dCurveTool::Parabola ******/
		/****** md5 signature: 91ce2d6bffca5cc115a4e157ac689f40 ******/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
gp_Parab2d

Description
-----------
Returns the Parab2d from gp corresponding to the curve C. This method is called only when TheType returns GeomAbs_Parabola.
") Parabola;
		static gp_Parab2d Parabola(const Adaptor2d_Curve2d & C);

		/****** Geom2dInt_Geom2dCurveTool::Value ******/
		/****** md5 signature: e62b4210b30e43ce993cebd7596acaaa ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
X: double

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") Value;
		static gp_Pnt2d Value(const Adaptor2d_Curve2d & C, const double X);

};


%extend Geom2dInt_Geom2dCurveTool {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def IsComposite(self):
		pass
	}
};

/****************************************
* class Geom2dInt_IntConicCurveOfGInter *
****************************************/
class Geom2dInt_IntConicCurveOfGInter : public IntRes2d_Intersection {
	public:
		/****** Geom2dInt_IntConicCurveOfGInter::Geom2dInt_IntConicCurveOfGInter ******/
		/****** md5 signature: d326152ab7d26261f0a1b3e4f48a0ba6 ******/
		%feature("compactdefaultargs") Geom2dInt_IntConicCurveOfGInter;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Geom2dInt_IntConicCurveOfGInter;
		 Geom2dInt_IntConicCurveOfGInter();

		/****** Geom2dInt_IntConicCurveOfGInter::Geom2dInt_IntConicCurveOfGInter ******/
		/****** md5 signature: 3d8fea4d28973a0a4cc213e0e5695816 ******/
		%feature("compactdefaultargs") Geom2dInt_IntConicCurveOfGInter;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between a line and a parametric curve.
") Geom2dInt_IntConicCurveOfGInter;
		 Geom2dInt_IntConicCurveOfGInter(const gp_Lin2d & L, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** Geom2dInt_IntConicCurveOfGInter::Geom2dInt_IntConicCurveOfGInter ******/
		/****** md5 signature: 53506a8e7972aaae82e4a61684c352c2 ******/
		%feature("compactdefaultargs") Geom2dInt_IntConicCurveOfGInter;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between a line and a parametric curve.
") Geom2dInt_IntConicCurveOfGInter;
		 Geom2dInt_IntConicCurveOfGInter(const gp_Circ2d & C, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** Geom2dInt_IntConicCurveOfGInter::Geom2dInt_IntConicCurveOfGInter ******/
		/****** md5 signature: 30d663508666b1446c31298a0dcbea28 ******/
		%feature("compactdefaultargs") Geom2dInt_IntConicCurveOfGInter;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between an ellipse and a parametric curve.
") Geom2dInt_IntConicCurveOfGInter;
		 Geom2dInt_IntConicCurveOfGInter(const gp_Elips2d & E, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** Geom2dInt_IntConicCurveOfGInter::Geom2dInt_IntConicCurveOfGInter ******/
		/****** md5 signature: 34993c420b4da29ed9649a234600ca4f ******/
		%feature("compactdefaultargs") Geom2dInt_IntConicCurveOfGInter;
		%feature("autodoc", "
Parameters
----------
Prb: gp_Parab2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between a parabola and a parametric curve.
") Geom2dInt_IntConicCurveOfGInter;
		 Geom2dInt_IntConicCurveOfGInter(const gp_Parab2d & Prb, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** Geom2dInt_IntConicCurveOfGInter::Geom2dInt_IntConicCurveOfGInter ******/
		/****** md5 signature: d46c4f5ac0389fa1ac6ee193fab54c50 ******/
		%feature("compactdefaultargs") Geom2dInt_IntConicCurveOfGInter;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between the main branch of an hyperbola and a parametric curve.
") Geom2dInt_IntConicCurveOfGInter;
		 Geom2dInt_IntConicCurveOfGInter(const gp_Hypr2d & H, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** Geom2dInt_IntConicCurveOfGInter::Perform ******/
		/****** md5 signature: 6c6c38c59d120ac1456e98f86cffc2db ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between a line and a parametric curve.
") Perform;
		void Perform(const gp_Lin2d & L, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** Geom2dInt_IntConicCurveOfGInter::Perform ******/
		/****** md5 signature: 4e22ae1daac2598cc3a1e71e55315762 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between a line and a parametric curve.
") Perform;
		void Perform(const gp_Circ2d & C, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** Geom2dInt_IntConicCurveOfGInter::Perform ******/
		/****** md5 signature: 6aa930cc1ca75bde3cd2b1ee37de187c ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between an ellipse and a parametric curve.
") Perform;
		void Perform(const gp_Elips2d & E, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** Geom2dInt_IntConicCurveOfGInter::Perform ******/
		/****** md5 signature: a2d1a886455948191f05efc45e8eb09d ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Prb: gp_Parab2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between a parabola and a parametric curve.
") Perform;
		void Perform(const gp_Parab2d & Prb, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** Geom2dInt_IntConicCurveOfGInter::Perform ******/
		/****** md5 signature: 25d1ad5d1b76930ef193e50b32b127a6 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between the main branch of an hyperbola and a parametric curve.
") Perform;
		void Perform(const gp_Hypr2d & H, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

};


%extend Geom2dInt_IntConicCurveOfGInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************************************
* class Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter *
*************************************************************************/
class Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter : public math_FunctionWithDerivative {
	public:
		/****** Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter::Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter ******/
		/****** md5 signature: 5773547517531f059b69ac71dcd61497 ******/
		%feature("compactdefaultargs") Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter;
		%feature("autodoc", "
Parameters
----------
IT: IntCurve_IConicTool
PC: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
Constructor of the class.
") Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter;
		 Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter(const IntCurve_IConicTool & IT, const Adaptor2d_Curve2d & PC);

		/****** Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter::Derivative ******/
		/****** md5 signature: 9056fc5f695c62612651effc85cb18ad ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
Param: double

Return
-------
D: double

Description
-----------
Computes the derivative of the previous function at parameter Param.
") Derivative;
		bool Derivative(const double Param, Standard_Real &OutValue);

		/****** Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter::Value ******/
		/****** md5 signature: 92dd35931de1aecdc8277d063de13ec7 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Param: double

Return
-------
F: double

Description
-----------
Computes the value of the signed distance between the implicit curve and the point at parameter Param on the parametrised curve.
") Value;
		bool Value(const double Param, Standard_Real &OutValue);

		/****** Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter::Values ******/
		/****** md5 signature: 03dca4b59c48db2ee672dd2d7904db60 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
Param: double

Return
-------
F: double
D: double

Description
-----------
Computes the value and the derivative of the function.
") Values;
		bool Values(const double Param, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************************************
* class Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter *
********************************************************************/
class Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter : public math_FunctionSetWithDerivatives {
	public:
		/****** Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter::Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter ******/
		/****** md5 signature: 89dc6631bcd06f3348bc4fcc91c073a6 ******/
		%feature("compactdefaultargs") Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter;
		%feature("autodoc", "
Parameters
----------
curve1: Adaptor2d_Curve2d
curve2: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
No available documentation.
") Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter;
		 Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter(const Adaptor2d_Curve2d & curve1, const Adaptor2d_Curve2d & curve2);

		/****** Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter::Derivatives ******/
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
returns the values <D> of the derivatives for the variable <X>. returns True if the computation was done successfully, False otherwise.
") Derivatives;
		bool Derivatives(const math_Vector & X, math_Matrix & D);

		/****** Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter::NbEquations ******/
		/****** md5 signature: d96db90f938251af5669711b5ae9a95b ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns 2.
") NbEquations;
		int NbEquations();

		/****** Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter::NbVariables ******/
		/****** md5 signature: ac9e90c594b52fb2529a5f6212b74800 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns 2.
") NbVariables;
		int NbVariables();

		/****** Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter::Value ******/
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
computes the values <F> of the Functions for the variable <X>. returns True if the computation was done successfully, False otherwise.
") Value;
		bool Value(const math_Vector & X, math_Vector & F);

		/****** Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter::Values ******/
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
returns the values <F> of the functions and the derivatives <D> for the variable <X>. returns True if the computation was done successfully, False otherwise.
") Values;
		bool Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

};


%extend Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class Geom2dInt_TheIntConicCurveOfGInter *
*******************************************/
class Geom2dInt_TheIntConicCurveOfGInter : public IntRes2d_Intersection {
	public:
		/****** Geom2dInt_TheIntConicCurveOfGInter::Geom2dInt_TheIntConicCurveOfGInter ******/
		/****** md5 signature: 442235095cb83e65c4d163949e4b639f ******/
		%feature("compactdefaultargs") Geom2dInt_TheIntConicCurveOfGInter;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Geom2dInt_TheIntConicCurveOfGInter;
		 Geom2dInt_TheIntConicCurveOfGInter();

		/****** Geom2dInt_TheIntConicCurveOfGInter::Geom2dInt_TheIntConicCurveOfGInter ******/
		/****** md5 signature: 95233f992464e58462a23c65be5803c6 ******/
		%feature("compactdefaultargs") Geom2dInt_TheIntConicCurveOfGInter;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between a line and a parametric curve.
") Geom2dInt_TheIntConicCurveOfGInter;
		 Geom2dInt_TheIntConicCurveOfGInter(const gp_Lin2d & L, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** Geom2dInt_TheIntConicCurveOfGInter::Geom2dInt_TheIntConicCurveOfGInter ******/
		/****** md5 signature: a3ba4ad2953e8da85422079de8e3604a ******/
		%feature("compactdefaultargs") Geom2dInt_TheIntConicCurveOfGInter;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between a line and a parametric curve.
") Geom2dInt_TheIntConicCurveOfGInter;
		 Geom2dInt_TheIntConicCurveOfGInter(const gp_Circ2d & C, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** Geom2dInt_TheIntConicCurveOfGInter::Geom2dInt_TheIntConicCurveOfGInter ******/
		/****** md5 signature: fd3edf8a54bb921640dce0a8f07ebd5d ******/
		%feature("compactdefaultargs") Geom2dInt_TheIntConicCurveOfGInter;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between an ellipse and a parametric curve.
") Geom2dInt_TheIntConicCurveOfGInter;
		 Geom2dInt_TheIntConicCurveOfGInter(const gp_Elips2d & E, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** Geom2dInt_TheIntConicCurveOfGInter::Geom2dInt_TheIntConicCurveOfGInter ******/
		/****** md5 signature: 58079062c7e7a0b4b4d997e1c397153f ******/
		%feature("compactdefaultargs") Geom2dInt_TheIntConicCurveOfGInter;
		%feature("autodoc", "
Parameters
----------
Prb: gp_Parab2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between a parabola and a parametric curve.
") Geom2dInt_TheIntConicCurveOfGInter;
		 Geom2dInt_TheIntConicCurveOfGInter(const gp_Parab2d & Prb, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** Geom2dInt_TheIntConicCurveOfGInter::Geom2dInt_TheIntConicCurveOfGInter ******/
		/****** md5 signature: b789369e5f8fdc3583f6362076ace8de ******/
		%feature("compactdefaultargs") Geom2dInt_TheIntConicCurveOfGInter;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between the main branch of an hyperbola and a parametric curve.
") Geom2dInt_TheIntConicCurveOfGInter;
		 Geom2dInt_TheIntConicCurveOfGInter(const gp_Hypr2d & H, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** Geom2dInt_TheIntConicCurveOfGInter::Perform ******/
		/****** md5 signature: 6c6c38c59d120ac1456e98f86cffc2db ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between a line and a parametric curve.
") Perform;
		void Perform(const gp_Lin2d & L, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** Geom2dInt_TheIntConicCurveOfGInter::Perform ******/
		/****** md5 signature: 4e22ae1daac2598cc3a1e71e55315762 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between a line and a parametric curve.
") Perform;
		void Perform(const gp_Circ2d & C, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** Geom2dInt_TheIntConicCurveOfGInter::Perform ******/
		/****** md5 signature: 6aa930cc1ca75bde3cd2b1ee37de187c ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between an ellipse and a parametric curve.
") Perform;
		void Perform(const gp_Elips2d & E, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** Geom2dInt_TheIntConicCurveOfGInter::Perform ******/
		/****** md5 signature: a2d1a886455948191f05efc45e8eb09d ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Prb: gp_Parab2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between a parabola and a parametric curve.
") Perform;
		void Perform(const gp_Parab2d & Prb, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** Geom2dInt_TheIntConicCurveOfGInter::Perform ******/
		/****** md5 signature: 25d1ad5d1b76930ef193e50b32b127a6 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr2d
D1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between the main branch of an hyperbola and a parametric curve.
") Perform;
		void Perform(const gp_Hypr2d & H, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

};


%extend Geom2dInt_TheIntConicCurveOfGInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class Geom2dInt_TheIntPCurvePCurveOfGInter *
*********************************************/
class Geom2dInt_TheIntPCurvePCurveOfGInter : public IntRes2d_Intersection {
	public:
		/****** Geom2dInt_TheIntPCurvePCurveOfGInter::Geom2dInt_TheIntPCurvePCurveOfGInter ******/
		/****** md5 signature: 29b0f855a1d18b661dc904c525704e14 ******/
		%feature("compactdefaultargs") Geom2dInt_TheIntPCurvePCurveOfGInter;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Geom2dInt_TheIntPCurvePCurveOfGInter;
		 Geom2dInt_TheIntPCurvePCurveOfGInter();

		/****** Geom2dInt_TheIntPCurvePCurveOfGInter::GetMinNbSamples ******/
		/****** md5 signature: fd21667dcec0124f6dfae4103cb5ec2b ******/
		%feature("compactdefaultargs") GetMinNbSamples;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") GetMinNbSamples;
		int GetMinNbSamples();

		/****** Geom2dInt_TheIntPCurvePCurveOfGInter::Perform ******/
		/****** md5 signature: b91a79237ea0af9032a86667bdf22b78 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Curve1: Adaptor2d_Curve2d
Domain1: IntRes2d_Domain
Curve2: Adaptor2d_Curve2d
Domain2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const Adaptor2d_Curve2d & Curve1, const IntRes2d_Domain & Domain1, const Adaptor2d_Curve2d & Curve2, const IntRes2d_Domain & Domain2, const double TolConf, const double Tol);

		/****** Geom2dInt_TheIntPCurvePCurveOfGInter::Perform ******/
		/****** md5 signature: 3c53ac38320c65b3ca0996f2cc83d75d ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Curve1: Adaptor2d_Curve2d
Domain1: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const Adaptor2d_Curve2d & Curve1, const IntRes2d_Domain & Domain1, const double TolConf, const double Tol);

		/****** Geom2dInt_TheIntPCurvePCurveOfGInter::SetMinNbSamples ******/
		/****** md5 signature: 9d653919fbe121787c6b21a6579f45a2 ******/
		%feature("compactdefaultargs") SetMinNbSamples;
		%feature("autodoc", "
Parameters
----------
theMinNbSamples: int

Return
-------
None

Description
-----------
Set / get minimum number of points in polygon for intersection.
") SetMinNbSamples;
		void SetMinNbSamples(const int theMinNbSamples);

};


%extend Geom2dInt_TheIntPCurvePCurveOfGInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************************
* class Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter *
***********************************************************/
class Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter : public IntRes2d_Intersection {
	public:
		/****** Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter::Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter ******/
		/****** md5 signature: 8b50729718ad9c424b34e560a84ada54 ******/
		%feature("compactdefaultargs") Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter;
		 Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter();

		/****** Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter::Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter ******/
		/****** md5 signature: 7c285353c331332d70c0ccfcb0d0b858 ******/
		%feature("compactdefaultargs") Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter;
		%feature("autodoc", "
Parameters
----------
ITool: IntCurve_IConicTool
Dom1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
Dom2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between an implicit curve and a parametrised curve. The exception ConstructionError is raised if the domain of the parametrised curve does not verify HasFirstPoint and HasLastPoint return True.
") Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter;
		 Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter(const IntCurve_IConicTool & ITool, const IntRes2d_Domain & Dom1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & Dom2, const double TolConf, const double Tol);

		/****** Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter::And_Domaine_Objet1_Intersections ******/
		/****** md5 signature: 6f0706d5d076fa1e4c6ed757867410d6 ******/
		%feature("compactdefaultargs") And_Domaine_Objet1_Intersections;
		%feature("autodoc", "
Parameters
----------
TheImpTool: IntCurve_IConicTool
TheParCurve: Adaptor2d_Curve2d
TheImpCurveDomain: IntRes2d_Domain
TheParCurveDomain: IntRes2d_Domain
Inter2_And_Domain2: NCollection_Array1<double>
Inter1: NCollection_Array1<double>
Resultat1: NCollection_Array1<double>
Resultat2: NCollection_Array1<double>
EpsNul: double

Return
-------
NbResultats: int

Description
-----------
No available documentation.
") And_Domaine_Objet1_Intersections;
		void And_Domaine_Objet1_Intersections(const IntCurve_IConicTool & TheImpTool, const Adaptor2d_Curve2d & TheParCurve, const IntRes2d_Domain & TheImpCurveDomain, const IntRes2d_Domain & TheParCurveDomain, Standard_Integer &OutValue, NCollection_Array1<double> & Inter2_And_Domain2, NCollection_Array1<double> & Inter1, NCollection_Array1<double> & Resultat1, NCollection_Array1<double> & Resultat2, const double EpsNul);

		/****** Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter::FindU ******/
		/****** md5 signature: 20ec63826e43bd2e6a8f6ecefcfe8aca ******/
		%feature("compactdefaultargs") FindU;
		%feature("autodoc", "
Parameters
----------
parameter: double
point: gp_Pnt2d
TheParCurev: Adaptor2d_Curve2d
TheImpTool: IntCurve_IConicTool

Return
-------
double

Description
-----------
No available documentation.
") FindU;
		double FindU(const double parameter, gp_Pnt2d & point, const Adaptor2d_Curve2d & TheParCurev, const IntCurve_IConicTool & TheImpTool);

		/****** Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter::FindV ******/
		/****** md5 signature: 14e3684a95704c53011d78d79971bb0a ******/
		%feature("compactdefaultargs") FindV;
		%feature("autodoc", "
Parameters
----------
parameter: double
point: gp_Pnt2d
TheImpTool: IntCurve_IConicTool
ParCurve: Adaptor2d_Curve2d
TheParCurveDomain: IntRes2d_Domain
V0: double
V1: double
Tolerance: double

Return
-------
double

Description
-----------
No available documentation.
") FindV;
		double FindV(const double parameter, gp_Pnt2d & point, const IntCurve_IConicTool & TheImpTool, const Adaptor2d_Curve2d & ParCurve, const IntRes2d_Domain & TheParCurveDomain, const double V0, const double V1, const double Tolerance);

		/****** Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter::Perform ******/
		/****** md5 signature: 85e0905e6ee1ae4e66be107893d3daaf ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
ITool: IntCurve_IConicTool
Dom1: IntRes2d_Domain
PCurve: Adaptor2d_Curve2d
Dom2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between an implicit curve and a parametrised curve. The exception ConstructionError is raised if the domain of the parametrised curve does not verify HasFirstPoint and HasLastPoint return True.
") Perform;
		void Perform(const IntCurve_IConicTool & ITool, const IntRes2d_Domain & Dom1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & Dom2, const double TolConf, const double Tol);

};


%extend Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************************
* class Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter *
***********************************************************/
class Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter : public Intf_Polygon2d {
	public:
		/****** Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter::Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter ******/
		/****** md5 signature: 0ed3cbcec7c9c8a176b8485ec88692dd ******/
		%feature("compactdefaultargs") Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter;
		%feature("autodoc", "
Parameters
----------
Curve: Adaptor2d_Curve2d
NbPnt: int
Domain: IntRes2d_Domain
Tol: double

Return
-------
None

Description
-----------
Compute a polygon on the domain of the curve.
") Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter;
		 Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter(const Adaptor2d_Curve2d & Curve, const int NbPnt, const IntRes2d_Domain & Domain, const double Tol);

		/****** Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter::ApproxParamOnCurve ******/
		/****** md5 signature: 520ca19aee00f08506bff5bce4928594 ******/
		%feature("compactdefaultargs") ApproxParamOnCurve;
		%feature("autodoc", "
Parameters
----------
Index: int
ParamOnLine: double

Return
-------
double

Description
-----------
Give an approximation of the parameter on the curve according to the discretization of the Curve.
") ApproxParamOnCurve;
		double ApproxParamOnCurve(const int Index, const double ParamOnLine);

		/****** Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter::AutoIntersectionIsPossible ******/
		/****** md5 signature: c0c30ede09ff6c71792ccade65941d74 ******/
		%feature("compactdefaultargs") AutoIntersectionIsPossible;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") AutoIntersectionIsPossible;
		bool AutoIntersectionIsPossible();

		/****** Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter::CalculRegion ******/
		/****** md5 signature: 2cbc0f90983b45c167b6b92efc5060b4 ******/
		%feature("compactdefaultargs") CalculRegion;
		%feature("autodoc", "
Parameters
----------
x: double
y: double
x1: double
x2: double
y1: double
y2: double

Return
-------
int

Description
-----------
No available documentation.
") CalculRegion;
		int CalculRegion(const double x, const double y, const double x1, const double x2, const double y1, const double y2);

		/****** Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter::Closed ******/
		/****** md5 signature: 343c462cc9a130bb05f2dc37938d483b ******/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "
Parameters
----------
clos: bool

Return
-------
None

Description
-----------
No available documentation.
") Closed;
		void Closed(const bool clos);

		/****** Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter::Closed ******/
		/****** md5 signature: 3092748280563d0fa6546c2fddc4b4a5 ******/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the polyline is closed.
") Closed;
		bool Closed();

		/****** Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter::ComputeWithBox ******/
		/****** md5 signature: a2577e286c7447afd172b5be81ef7131 ******/
		%feature("compactdefaultargs") ComputeWithBox;
		%feature("autodoc", "
Parameters
----------
Curve: Adaptor2d_Curve2d
OtherBox: Bnd_Box2d

Return
-------
None

Description
-----------
The current polygon is modified if most of the points of the polygon are outside the box <OtherBox>. In this situation, bounds are computed to build a polygon inside or near the OtherBox.
") ComputeWithBox;
		void ComputeWithBox(const Adaptor2d_Curve2d & Curve, const Bnd_Box2d & OtherBox);

		/****** Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter::DeflectionOverEstimation ******/
		/****** md5 signature: 1fad6591a4ff1f9e8e821a3a0670bc18 ******/
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") DeflectionOverEstimation;
		double DeflectionOverEstimation();

		/****** Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter::Dump ******/
		/****** md5 signature: 15b4b2e195645aebb43170ff7f15952a ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Dump;
		void Dump();

		/****** Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter::InfParameter ******/
		/****** md5 signature: 7a45ea36426f6319ca9fdcc45fed2b64 ******/
		%feature("compactdefaultargs") InfParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the parameter (On the curve) of the first point of the Polygon.
") InfParameter;
		double InfParameter();

		/****** Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter::NbSegments ******/
		/****** md5 signature: dd047a9d60ac19f7e8995b778d22aba9 ******/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Return
-------
int

Description
-----------
Give the number of Segments in the polyline.
") NbSegments;
		int NbSegments();

		/****** Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter::Segment ******/
		/****** md5 signature: 492f28c821222ab2c8cda9dffc334375 ******/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theBegin: gp_Pnt2d
theEnd: gp_Pnt2d

Return
-------
None

Description
-----------
Returns the points of the segment <Index> in the Polygon.
") Segment;
		void Segment(const int theIndex, gp_Pnt2d & theBegin, gp_Pnt2d & theEnd);

		/****** Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter::SetDeflectionOverEstimation ******/
		/****** md5 signature: 7b7a5fb89a75e64dee0d34a28f8ad75a ******/
		%feature("compactdefaultargs") SetDeflectionOverEstimation;
		%feature("autodoc", "
Parameters
----------
x: double

Return
-------
None

Description
-----------
No available documentation.
") SetDeflectionOverEstimation;
		void SetDeflectionOverEstimation(const double x);

		/****** Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter::SupParameter ******/
		/****** md5 signature: 0badd8e202f44bc5962c793cc4fca7e8 ******/
		%feature("compactdefaultargs") SupParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the parameter (On the curve) of the last point of the Polygon.
") SupParameter;
		double SupParameter();

};


%extend Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class Geom2dInt_TheProjPCurOfGInter *
**************************************/
class Geom2dInt_TheProjPCurOfGInter {
	public:
		/****** Geom2dInt_TheProjPCurOfGInter::FindParameter ******/
		/****** md5 signature: 675020120e49de9cf7ffa44582d1f3b9 ******/
		%feature("compactdefaultargs") FindParameter;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
Pnt: gp_Pnt2d
Tol: double

Return
-------
double

Description
-----------
Returns the parameter V of the point on the parametric curve corresponding to the Point Pnt. The Correspondence between Pnt and the point P(V) on the parametric curve must be coherent with the way of determination of the signed distance between a point and the implicit curve. Tol is the tolerance on the distance between a point and the parametrised curve. In that case, no bounds are given. The research of the right parameter has to be made on the natural parametric domain of the curve.
") FindParameter;
		static double FindParameter(const Adaptor2d_Curve2d & C, const gp_Pnt2d & Pnt, const double Tol);

		/****** Geom2dInt_TheProjPCurOfGInter::FindParameter ******/
		/****** md5 signature: ff25cb3a3fd69092677a366c6935eac2 ******/
		%feature("compactdefaultargs") FindParameter;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
Pnt: gp_Pnt2d
LowParameter: double
HighParameter: double
Tol: double

Return
-------
double

Description
-----------
Returns the parameter V of the point on the parametric curve corresponding to the Point Pnt. The Correspondence between Pnt and the point P(V) on the parametric curve must be coherent with the way of determination of the signed distance between a point and the implicit curve. Tol is the tolerance on the distance between a point and the parametrised curve. LowParameter and HighParameter give the boundaries of the interval in which the parameter certainly lies. These parameters are given to implement a more efficient algorithm. So, it is not necessary to check that the returned value verifies LowParameter <= Value <= HighParameter.
") FindParameter;
		static double FindParameter(const Adaptor2d_Curve2d & C, const gp_Pnt2d & Pnt, const double LowParameter, const double HighParameter, const double Tol);

};


%extend Geom2dInt_TheProjPCurOfGInter {
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
/* deprecated methods */
%pythoncode {
@deprecated
def Geom2dInt_Geom2dCurveTool_Circle(*args):
	return Geom2dInt_Geom2dCurveTool.Circle(*args)

@deprecated
def Geom2dInt_Geom2dCurveTool_D0(*args):
	return Geom2dInt_Geom2dCurveTool.D0(*args)

@deprecated
def Geom2dInt_Geom2dCurveTool_D1(*args):
	return Geom2dInt_Geom2dCurveTool.D1(*args)

@deprecated
def Geom2dInt_Geom2dCurveTool_D2(*args):
	return Geom2dInt_Geom2dCurveTool.D2(*args)

@deprecated
def Geom2dInt_Geom2dCurveTool_D3(*args):
	return Geom2dInt_Geom2dCurveTool.D3(*args)

@deprecated
def Geom2dInt_Geom2dCurveTool_DN(*args):
	return Geom2dInt_Geom2dCurveTool.DN(*args)

@deprecated
def Geom2dInt_Geom2dCurveTool_Degree(*args):
	return Geom2dInt_Geom2dCurveTool.Degree(*args)

@deprecated
def Geom2dInt_Geom2dCurveTool_Ellipse(*args):
	return Geom2dInt_Geom2dCurveTool.Ellipse(*args)

@deprecated
def Geom2dInt_Geom2dCurveTool_EpsX(*args):
	return Geom2dInt_Geom2dCurveTool.EpsX(*args)

@deprecated
def Geom2dInt_Geom2dCurveTool_EpsX(*args):
	return Geom2dInt_Geom2dCurveTool.EpsX(*args)

@deprecated
def Geom2dInt_Geom2dCurveTool_FirstParameter(*args):
	return Geom2dInt_Geom2dCurveTool.FirstParameter(*args)

@deprecated
def Geom2dInt_Geom2dCurveTool_GetInterval(*args):
	return Geom2dInt_Geom2dCurveTool.GetInterval(*args)

@deprecated
def Geom2dInt_Geom2dCurveTool_GetType(*args):
	return Geom2dInt_Geom2dCurveTool.GetType(*args)

@deprecated
def Geom2dInt_Geom2dCurveTool_Hyperbola(*args):
	return Geom2dInt_Geom2dCurveTool.Hyperbola(*args)

@deprecated
def Geom2dInt_Geom2dCurveTool_Intervals(*args):
	return Geom2dInt_Geom2dCurveTool.Intervals(*args)

@deprecated
def Geom2dInt_Geom2dCurveTool_LastParameter(*args):
	return Geom2dInt_Geom2dCurveTool.LastParameter(*args)

@deprecated
def Geom2dInt_Geom2dCurveTool_Line(*args):
	return Geom2dInt_Geom2dCurveTool.Line(*args)

@deprecated
def Geom2dInt_Geom2dCurveTool_NbIntervals(*args):
	return Geom2dInt_Geom2dCurveTool.NbIntervals(*args)

@deprecated
def Geom2dInt_Geom2dCurveTool_NbSamples(*args):
	return Geom2dInt_Geom2dCurveTool.NbSamples(*args)

@deprecated
def Geom2dInt_Geom2dCurveTool_NbSamples(*args):
	return Geom2dInt_Geom2dCurveTool.NbSamples(*args)

@deprecated
def Geom2dInt_Geom2dCurveTool_Parabola(*args):
	return Geom2dInt_Geom2dCurveTool.Parabola(*args)

@deprecated
def Geom2dInt_Geom2dCurveTool_Value(*args):
	return Geom2dInt_Geom2dCurveTool.Value(*args)

@deprecated
def Geom2dInt_TheProjPCurOfGInter_FindParameter(*args):
	return Geom2dInt_TheProjPCurOfGInter.FindParameter(*args)

@deprecated
def Geom2dInt_TheProjPCurOfGInter_FindParameter(*args):
	return Geom2dInt_TheProjPCurOfGInter.FindParameter(*args)

}
