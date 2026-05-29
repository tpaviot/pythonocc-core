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
%define APPBLENDDOCSTRING
"AppBlend module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_appblend.html"
%enddef
%module (package="OCC.Core", docstring=APPBLENDDOCSTRING) AppBlend


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
#include<AppBlend_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TColgp.i
%import TColStd.i

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

/************************
* class AppBlend_Approx *
************************/
%nodefaultctor AppBlend_Approx;
class AppBlend_Approx {
	public:
		/****** AppBlend_Approx::Curve2d ******/
		/****** md5 signature: 515447d5e2036556c47c83efc879b13a ******/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "
Parameters
----------
Index: int
TPoles: TColgp_Array1OfPnt2d
TKnots: TColStd_Array1OfReal
TMults: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
No available documentation.
") Curve2d;
		virtual void Curve2d(const int Index, TColgp_Array1OfPnt2d & TPoles, TColStd_Array1OfReal & TKnots, TColStd_Array1OfInteger & TMults);

		/****** AppBlend_Approx::Curve2dPoles ******/
		/****** md5 signature: ee57003ff0c5712eaa866dc33525e5bd ******/
		%feature("compactdefaultargs") Curve2dPoles;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
TColgp_Array1OfPnt2d

Description
-----------
No available documentation.
") Curve2dPoles;
		virtual const TColgp_Array1OfPnt2d & Curve2dPoles(const int Index);

		/****** AppBlend_Approx::Curves2dDegree ******/
		/****** md5 signature: 5eddd2ba90f3ee64261188998e00e95d ******/
		%feature("compactdefaultargs") Curves2dDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Curves2dDegree;
		virtual int Curves2dDegree();

		/****** AppBlend_Approx::Curves2dKnots ******/
		/****** md5 signature: 004dbd5d154c8ff27540649a0e4c547a ******/
		%feature("compactdefaultargs") Curves2dKnots;
		%feature("autodoc", "Return
-------
TColStd_Array1OfReal

Description
-----------
No available documentation.
") Curves2dKnots;
		virtual const TColStd_Array1OfReal & Curves2dKnots();

		/****** AppBlend_Approx::Curves2dMults ******/
		/****** md5 signature: 3a4ca2b3e696c9c5f6ffff1e1fe5597d ******/
		%feature("compactdefaultargs") Curves2dMults;
		%feature("autodoc", "Return
-------
TColStd_Array1OfInteger

Description
-----------
No available documentation.
") Curves2dMults;
		virtual const TColStd_Array1OfInteger & Curves2dMults();

		/****** AppBlend_Approx::Curves2dShape ******/
		/****** md5 signature: b12bca79ee5ba064b06354b1bb11ffaa ******/
		%feature("compactdefaultargs") Curves2dShape;
		%feature("autodoc", "
Parameters
----------

Return
-------
Degree: int
NbPoles: int
NbKnots: int

Description
-----------
No available documentation.
") Curves2dShape;
		virtual void Curves2dShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** AppBlend_Approx::IsDone ******/
		/****** md5 signature: 407dc72443d0cc9ea54f99887cb3da91 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		virtual bool IsDone();

		/****** AppBlend_Approx::NbCurves2d ******/
		/****** md5 signature: 81c33b6305c877f16951f89ca2931fd5 ******/
		%feature("compactdefaultargs") NbCurves2d;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbCurves2d;
		virtual int NbCurves2d();

		/****** AppBlend_Approx::SurfPoles ******/
		/****** md5 signature: b4a08936611973b53ddb90f908c55e90 ******/
		%feature("compactdefaultargs") SurfPoles;
		%feature("autodoc", "Return
-------
TColgp_Array2OfPnt

Description
-----------
No available documentation.
") SurfPoles;
		virtual const TColgp_Array2OfPnt & SurfPoles();

		/****** AppBlend_Approx::SurfShape ******/
		/****** md5 signature: 652871a3a1a72d6225cfd174c21a5b93 ******/
		%feature("compactdefaultargs") SurfShape;
		%feature("autodoc", "
Parameters
----------

Return
-------
UDegree: int
VDegree: int
NbUPoles: int
NbVPoles: int
NbUKnots: int
NbVKnots: int

Description
-----------
No available documentation.
") SurfShape;
		virtual void SurfShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** AppBlend_Approx::SurfUKnots ******/
		/****** md5 signature: 3bf796b01a621a11f3c5efb753999f21 ******/
		%feature("compactdefaultargs") SurfUKnots;
		%feature("autodoc", "Return
-------
TColStd_Array1OfReal

Description
-----------
No available documentation.
") SurfUKnots;
		virtual const TColStd_Array1OfReal & SurfUKnots();

		/****** AppBlend_Approx::SurfUMults ******/
		/****** md5 signature: b8253c0fc96341f6d905ef1c8ec8fef8 ******/
		%feature("compactdefaultargs") SurfUMults;
		%feature("autodoc", "Return
-------
TColStd_Array1OfInteger

Description
-----------
No available documentation.
") SurfUMults;
		virtual const TColStd_Array1OfInteger & SurfUMults();

		/****** AppBlend_Approx::SurfVKnots ******/
		/****** md5 signature: 36f4a91bde1263a302488b17387c702b ******/
		%feature("compactdefaultargs") SurfVKnots;
		%feature("autodoc", "Return
-------
TColStd_Array1OfReal

Description
-----------
No available documentation.
") SurfVKnots;
		virtual const TColStd_Array1OfReal & SurfVKnots();

		/****** AppBlend_Approx::SurfVMults ******/
		/****** md5 signature: 905fac2cd44d34b91213e1fad3e5065c ******/
		%feature("compactdefaultargs") SurfVMults;
		%feature("autodoc", "Return
-------
TColStd_Array1OfInteger

Description
-----------
No available documentation.
") SurfVMults;
		virtual const TColStd_Array1OfInteger & SurfVMults();

		/****** AppBlend_Approx::SurfWeights ******/
		/****** md5 signature: eb7c4872394cba0783fa64de049bcff7 ******/
		%feature("compactdefaultargs") SurfWeights;
		%feature("autodoc", "Return
-------
TColStd_Array2OfReal

Description
-----------
No available documentation.
") SurfWeights;
		virtual const TColStd_Array2OfReal & SurfWeights();

		/****** AppBlend_Approx::Surface ******/
		/****** md5 signature: ead0fd55e847bed4839abad72f787c6e ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "
Parameters
----------
TPoles: TColgp_Array2OfPnt
TWeights: TColStd_Array2OfReal
TUKnots: TColStd_Array1OfReal
TVKnots: TColStd_Array1OfReal
TUMults: TColStd_Array1OfInteger
TVMults: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
No available documentation.
") Surface;
		virtual void Surface(TColgp_Array2OfPnt & TPoles, TColStd_Array2OfReal & TWeights, TColStd_Array1OfReal & TUKnots, TColStd_Array1OfReal & TVKnots, TColStd_Array1OfInteger & TUMults, TColStd_Array1OfInteger & TVMults);

		/****** AppBlend_Approx::TolCurveOnSurf ******/
		/****** md5 signature: 487f55a5bdd09cc55994cebb8e104c05 ******/
		%feature("compactdefaultargs") TolCurveOnSurf;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
No available documentation.
") TolCurveOnSurf;
		virtual double TolCurveOnSurf(const int Index);

		/****** AppBlend_Approx::TolReached ******/
		/****** md5 signature: 49bb6d992656112994092f1b72bb3d00 ******/
		%feature("compactdefaultargs") TolReached;
		%feature("autodoc", "
Parameters
----------

Return
-------
Tol3d: double
Tol2d: double

Description
-----------
No available documentation.
") TolReached;
		virtual void TolReached(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** AppBlend_Approx::UDegree ******/
		/****** md5 signature: 4f678a391fe3e702afa71d1e01e72762 ******/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") UDegree;
		virtual int UDegree();

		/****** AppBlend_Approx::VDegree ******/
		/****** md5 signature: 8bc398ff7f92f210b9df0ad0981e5168 ******/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") VDegree;
		virtual int VDegree();

};


%extend AppBlend_Approx {
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
