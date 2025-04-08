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
%define EXTREMADOCSTRING
"Extrema module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_extrema.html"
%enddef
%module (package="OCC.Core", docstring=EXTREMADOCSTRING) Extrema


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
#include<Extrema_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<math_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Geom2d_module.hxx>
#include<gp_module.hxx>
#include<GeomAbs_module.hxx>
#include<TColStd_module.hxx>
#include<Geom_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Precision_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import math.i
%import Adaptor3d.i
%import Adaptor2d.i
%import Geom2d.i
%import gp.i
%import GeomAbs.i
%import TColStd.i
%import Geom.i
%import GeomAdaptor.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum Extrema_ElementType {
	Extrema_Node = 0,
	Extrema_UIsoEdge = 1,
	Extrema_VIsoEdge = 2,
	Extrema_Face = 3,
};

enum Extrema_ExtAlgo {
	Extrema_ExtAlgo_Grad = 0,
	Extrema_ExtAlgo_Tree = 1,
};

enum Extrema_ExtFlag {
	Extrema_ExtFlag_MIN = 0,
	Extrema_ExtFlag_MAX = 1,
	Extrema_ExtFlag_MINMAX = 2,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class Extrema_ElementType(IntEnum):
	Extrema_Node = 0
	Extrema_UIsoEdge = 1
	Extrema_VIsoEdge = 2
	Extrema_Face = 3
Extrema_Node = Extrema_ElementType.Extrema_Node
Extrema_UIsoEdge = Extrema_ElementType.Extrema_UIsoEdge
Extrema_VIsoEdge = Extrema_ElementType.Extrema_VIsoEdge
Extrema_Face = Extrema_ElementType.Extrema_Face

class Extrema_ExtAlgo(IntEnum):
	Extrema_ExtAlgo_Grad = 0
	Extrema_ExtAlgo_Tree = 1
Extrema_ExtAlgo_Grad = Extrema_ExtAlgo.Extrema_ExtAlgo_Grad
Extrema_ExtAlgo_Tree = Extrema_ExtAlgo.Extrema_ExtAlgo_Tree

class Extrema_ExtFlag(IntEnum):
	Extrema_ExtFlag_MIN = 0
	Extrema_ExtFlag_MAX = 1
	Extrema_ExtFlag_MINMAX = 2
Extrema_ExtFlag_MIN = Extrema_ExtFlag.Extrema_ExtFlag_MIN
Extrema_ExtFlag_MAX = Extrema_ExtFlag.Extrema_ExtFlag_MAX
Extrema_ExtFlag_MINMAX = Extrema_ExtFlag.Extrema_ExtFlag_MINMAX
};
/* end python proxy for enums */

/* handles */
%wrap_handle(Extrema_ExtPExtS)
%wrap_handle(Extrema_ExtPRevS)
%wrap_handle(Extrema_HArray1OfPOnCurv)
%wrap_handle(Extrema_HArray1OfPOnCurv2d)
%wrap_handle(Extrema_HArray1OfPOnSurf)
%wrap_handle(Extrema_HArray2OfPOnCurv)
%wrap_handle(Extrema_HArray2OfPOnCurv2d)
%wrap_handle(Extrema_HArray2OfPOnSurf)
/* end handles declaration */

/* templates */
%template(Extrema_Array1OfPOnCurv) NCollection_Array1<Extrema_POnCurv>;
Array1ExtendIter(Extrema_POnCurv)

%template(Extrema_Array1OfPOnCurv2d) NCollection_Array1<Extrema_POnCurv2d>;
Array1ExtendIter(Extrema_POnCurv2d)

%template(Extrema_Array1OfPOnSurf) NCollection_Array1<Extrema_POnSurf>;
Array1ExtendIter(Extrema_POnSurf)

%template(Extrema_SequenceOfPOnCurv) NCollection_Sequence<Extrema_POnCurv>;

%extend NCollection_Sequence<Extrema_POnCurv> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(Extrema_SequenceOfPOnCurv2d) NCollection_Sequence<Extrema_POnCurv2d>;

%extend NCollection_Sequence<Extrema_POnCurv2d> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(Extrema_SequenceOfPOnSurf) NCollection_Sequence<Extrema_POnSurf>;

%extend NCollection_Sequence<Extrema_POnSurf> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(Extrema_UBTreeFillerOfSphere) NCollection_UBTreeFiller<Standard_Integer,Bnd_Sphere>;
%template(Extrema_UBTreeOfSphere) NCollection_UBTree<Standard_Integer,Bnd_Sphere>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<Extrema_POnCurv> Extrema_Array1OfPOnCurv;
typedef NCollection_Array1<Extrema_POnCurv2d> Extrema_Array1OfPOnCurv2d;
typedef NCollection_Array1<Extrema_POnSurf> Extrema_Array1OfPOnSurf;
typedef NCollection_Array2<Extrema_POnCurv> Extrema_Array2OfPOnCurv;
typedef NCollection_Array2<Extrema_POnCurv2d> Extrema_Array2OfPOnCurv2d;
typedef NCollection_Array2<Extrema_POnSurf> Extrema_Array2OfPOnSurf;
typedef NCollection_Array2<Extrema_POnSurfParams> Extrema_Array2OfPOnSurfParams;
typedef NCollection_Handle<Extrema_UBTreeOfSphere> Extrema_HUBTreeOfSphere;
typedef NCollection_Sequence<Extrema_POnCurv> Extrema_SequenceOfPOnCurv;
typedef NCollection_Sequence<Extrema_POnCurv2d> Extrema_SequenceOfPOnCurv2d;
typedef NCollection_Sequence<Extrema_POnSurf> Extrema_SequenceOfPOnSurf;
typedef NCollection_UBTreeFiller<Standard_Integer, Bnd_Sphere> Extrema_UBTreeFillerOfSphere;
typedef NCollection_UBTree<Standard_Integer, Bnd_Sphere> Extrema_UBTreeOfSphere;
/* end typedefs declaration */

/*******************************
* class Extrema_CCLocFOfLocECC *
*******************************/
class Extrema_CCLocFOfLocECC : public math_FunctionSetWithDerivatives {
	public:
		/****** Extrema_CCLocFOfLocECC::Extrema_CCLocFOfLocECC ******/
		/****** md5 signature: 09f07e8318a21d857c0522bf02f9cc94 ******/
		%feature("compactdefaultargs") Extrema_CCLocFOfLocECC;
		%feature("autodoc", "
Parameters
----------
thetol: float (optional, default to 1.0e-10)

Return
-------
None

Description
-----------
No available documentation.
") Extrema_CCLocFOfLocECC;
		 Extrema_CCLocFOfLocECC(const Standard_Real thetol = 1.0e-10);

		/****** Extrema_CCLocFOfLocECC::Extrema_CCLocFOfLocECC ******/
		/****** md5 signature: 090fe2e06cec13f50f51a29baf2ee8ce ******/
		%feature("compactdefaultargs") Extrema_CCLocFOfLocECC;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor3d_Curve
C2: Adaptor3d_Curve
thetol: float (optional, default to 1.0e-10)

Return
-------
None

Description
-----------
No available documentation.
") Extrema_CCLocFOfLocECC;
		 Extrema_CCLocFOfLocECC(const Adaptor3d_Curve & C1, const Adaptor3d_Curve & C2, const Standard_Real thetol = 1.0e-10);

		/****** Extrema_CCLocFOfLocECC::CurvePtr ******/
		/****** md5 signature: 98417ecf956a56db97322adfa51c9321 ******/
		%feature("compactdefaultargs") CurvePtr;
		%feature("autodoc", "
Parameters
----------
theRank: int

Return
-------
Standard_Address

Description
-----------
Returns a pointer to the curve specified in the constructor or in SetCurve() method.
") CurvePtr;
		Standard_Address CurvePtr(const Standard_Integer theRank);

		/****** Extrema_CCLocFOfLocECC::Derivatives ******/
		/****** md5 signature: 1d38afd641c7de1e5982feb10f2b7ece ******/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "
Parameters
----------
UV: math_Vector
DF: math_Matrix

Return
-------
bool

Description
-----------
Calculate Fi'(U,V).
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & UV, math_Matrix & DF);

		/****** Extrema_CCLocFOfLocECC::GetStateNumber ******/
		/****** md5 signature: 49c44bd66dd4ec2381671c72ebd88158 ******/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Save the found extremum.
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****** Extrema_CCLocFOfLocECC::NbEquations ******/
		/****** md5 signature: 186743efcc98b222ef8f5159fb11b9d2 ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbEquations;
		virtual Standard_Integer NbEquations();

		/****** Extrema_CCLocFOfLocECC::NbExt ******/
		/****** md5 signature: 84ada636e4651cacf916eb056265a1d9 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return the number of found extrema.
") NbExt;
		Standard_Integer NbExt();

		/****** Extrema_CCLocFOfLocECC::NbVariables ******/
		/****** md5 signature: 28ab91d0183585502101892aac2c5b98 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****** Extrema_CCLocFOfLocECC::Points ******/
		/****** md5 signature: 3794ed44489c98c8247e475c96bba9a2 ******/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "
Parameters
----------
N: int
P1: Extrema_POnCurv
P2: Extrema_POnCurv

Return
-------
None

Description
-----------
Return the points of the Nth extreme distance.
") Points;
		void Points(const Standard_Integer N, Extrema_POnCurv & P1, Extrema_POnCurv & P2);

		/****** Extrema_CCLocFOfLocECC::SearchOfTolerance ******/
		/****** md5 signature: 4552b046bde68eb9a19619f431484203 ******/
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "
Parameters
----------
C: Standard_Address

Return
-------
float

Description
-----------
Computes a Tol value. If 1st derivative of curve |D1|<Tol, it is considered D1=0.
") SearchOfTolerance;
		Standard_Real SearchOfTolerance(const Standard_Address C);

		/****** Extrema_CCLocFOfLocECC::SetCurve ******/
		/****** md5 signature: cf01dfc00c20cb696f12c0297a7cad73 ******/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "
Parameters
----------
theRank: int
C1: Adaptor3d_Curve

Return
-------
None

Description
-----------
No available documentation.
") SetCurve;
		void SetCurve(const Standard_Integer theRank, const Adaptor3d_Curve & C1);

		/****** Extrema_CCLocFOfLocECC::SetTolerance ******/
		/****** md5 signature: 6e6be0760517a3f5431539a6e86d9f19 ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
theTol: float

Return
-------
None

Description
-----------
No available documentation.
") SetTolerance;
		void SetTolerance(const Standard_Real theTol);

		/****** Extrema_CCLocFOfLocECC::SquareDistance ******/
		/****** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
float

Description
-----------
Return the value of the Nth distance.
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****** Extrema_CCLocFOfLocECC::SubIntervalInitialize ******/
		/****** md5 signature: 63a75b85c368de02a3ec6e6d8387c3d9 ******/
		%feature("compactdefaultargs") SubIntervalInitialize;
		%feature("autodoc", "
Parameters
----------
theUfirst: math_Vector
theUlast: math_Vector

Return
-------
None

Description
-----------
Determines of boundaries of subinterval for find of root.
") SubIntervalInitialize;
		void SubIntervalInitialize(const math_Vector & theUfirst, const math_Vector & theUlast);

		/****** Extrema_CCLocFOfLocECC::Tolerance ******/
		/****** md5 signature: 9e5775014410d884d1a1adc1cd47930b ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns a tolerance specified in the constructor or in SetTolerance() method.
") Tolerance;
		Standard_Real Tolerance();

		/****** Extrema_CCLocFOfLocECC::Value ******/
		/****** md5 signature: 03c8e8d2d0c02825e7a78c74d4041f96 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
UV: math_Vector
F: math_Vector

Return
-------
bool

Description
-----------
Calculate Fi(U,V).
") Value;
		virtual Standard_Boolean Value(const math_Vector & UV, math_Vector & F);

		/****** Extrema_CCLocFOfLocECC::Values ******/
		/****** md5 signature: aecc35a594e467ec2fc262dd639056f5 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
UV: math_Vector
F: math_Vector
DF: math_Matrix

Return
-------
bool

Description
-----------
Calculate Fi(U,V) and Fi'(U,V).
") Values;
		Standard_Boolean Values(const math_Vector & UV, math_Vector & F, math_Matrix & DF);

};


%extend Extrema_CCLocFOfLocECC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class Extrema_CCLocFOfLocECC2d *
*********************************/
class Extrema_CCLocFOfLocECC2d : public math_FunctionSetWithDerivatives {
	public:
		/****** Extrema_CCLocFOfLocECC2d::Extrema_CCLocFOfLocECC2d ******/
		/****** md5 signature: e1f7f43c9b7b740af089fcb74aafe995 ******/
		%feature("compactdefaultargs") Extrema_CCLocFOfLocECC2d;
		%feature("autodoc", "
Parameters
----------
thetol: float (optional, default to 1.0e-10)

Return
-------
None

Description
-----------
No available documentation.
") Extrema_CCLocFOfLocECC2d;
		 Extrema_CCLocFOfLocECC2d(const Standard_Real thetol = 1.0e-10);

		/****** Extrema_CCLocFOfLocECC2d::Extrema_CCLocFOfLocECC2d ******/
		/****** md5 signature: e674268ba5666a0204c98410925aeeb8 ******/
		%feature("compactdefaultargs") Extrema_CCLocFOfLocECC2d;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d
thetol: float (optional, default to 1.0e-10)

Return
-------
None

Description
-----------
No available documentation.
") Extrema_CCLocFOfLocECC2d;
		 Extrema_CCLocFOfLocECC2d(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2, const Standard_Real thetol = 1.0e-10);

		/****** Extrema_CCLocFOfLocECC2d::CurvePtr ******/
		/****** md5 signature: 98417ecf956a56db97322adfa51c9321 ******/
		%feature("compactdefaultargs") CurvePtr;
		%feature("autodoc", "
Parameters
----------
theRank: int

Return
-------
Standard_Address

Description
-----------
Returns a pointer to the curve specified in the constructor or in SetCurve() method.
") CurvePtr;
		Standard_Address CurvePtr(const Standard_Integer theRank);

		/****** Extrema_CCLocFOfLocECC2d::Derivatives ******/
		/****** md5 signature: 1d38afd641c7de1e5982feb10f2b7ece ******/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "
Parameters
----------
UV: math_Vector
DF: math_Matrix

Return
-------
bool

Description
-----------
Calculate Fi'(U,V).
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & UV, math_Matrix & DF);

		/****** Extrema_CCLocFOfLocECC2d::GetStateNumber ******/
		/****** md5 signature: 49c44bd66dd4ec2381671c72ebd88158 ******/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Save the found extremum.
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****** Extrema_CCLocFOfLocECC2d::NbEquations ******/
		/****** md5 signature: 186743efcc98b222ef8f5159fb11b9d2 ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbEquations;
		virtual Standard_Integer NbEquations();

		/****** Extrema_CCLocFOfLocECC2d::NbExt ******/
		/****** md5 signature: 84ada636e4651cacf916eb056265a1d9 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return the number of found extrema.
") NbExt;
		Standard_Integer NbExt();

		/****** Extrema_CCLocFOfLocECC2d::NbVariables ******/
		/****** md5 signature: 28ab91d0183585502101892aac2c5b98 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****** Extrema_CCLocFOfLocECC2d::Points ******/
		/****** md5 signature: b11c393bae576338fc3f288ecb955b49 ******/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "
Parameters
----------
N: int
P1: Extrema_POnCurv2d
P2: Extrema_POnCurv2d

Return
-------
None

Description
-----------
Return the points of the Nth extreme distance.
") Points;
		void Points(const Standard_Integer N, Extrema_POnCurv2d & P1, Extrema_POnCurv2d & P2);

		/****** Extrema_CCLocFOfLocECC2d::SearchOfTolerance ******/
		/****** md5 signature: 4552b046bde68eb9a19619f431484203 ******/
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "
Parameters
----------
C: Standard_Address

Return
-------
float

Description
-----------
Computes a Tol value. If 1st derivative of curve |D1|<Tol, it is considered D1=0.
") SearchOfTolerance;
		Standard_Real SearchOfTolerance(const Standard_Address C);

		/****** Extrema_CCLocFOfLocECC2d::SetCurve ******/
		/****** md5 signature: 2374b0cbe8538923ca7a60014f115586 ******/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "
Parameters
----------
theRank: int
C1: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
No available documentation.
") SetCurve;
		void SetCurve(const Standard_Integer theRank, const Adaptor2d_Curve2d & C1);

		/****** Extrema_CCLocFOfLocECC2d::SetTolerance ******/
		/****** md5 signature: 6e6be0760517a3f5431539a6e86d9f19 ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
theTol: float

Return
-------
None

Description
-----------
No available documentation.
") SetTolerance;
		void SetTolerance(const Standard_Real theTol);

		/****** Extrema_CCLocFOfLocECC2d::SquareDistance ******/
		/****** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
float

Description
-----------
Return the value of the Nth distance.
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****** Extrema_CCLocFOfLocECC2d::SubIntervalInitialize ******/
		/****** md5 signature: 63a75b85c368de02a3ec6e6d8387c3d9 ******/
		%feature("compactdefaultargs") SubIntervalInitialize;
		%feature("autodoc", "
Parameters
----------
theUfirst: math_Vector
theUlast: math_Vector

Return
-------
None

Description
-----------
Determines of boundaries of subinterval for find of root.
") SubIntervalInitialize;
		void SubIntervalInitialize(const math_Vector & theUfirst, const math_Vector & theUlast);

		/****** Extrema_CCLocFOfLocECC2d::Tolerance ******/
		/****** md5 signature: 9e5775014410d884d1a1adc1cd47930b ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns a tolerance specified in the constructor or in SetTolerance() method.
") Tolerance;
		Standard_Real Tolerance();

		/****** Extrema_CCLocFOfLocECC2d::Value ******/
		/****** md5 signature: 03c8e8d2d0c02825e7a78c74d4041f96 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
UV: math_Vector
F: math_Vector

Return
-------
bool

Description
-----------
Calculate Fi(U,V).
") Value;
		virtual Standard_Boolean Value(const math_Vector & UV, math_Vector & F);

		/****** Extrema_CCLocFOfLocECC2d::Values ******/
		/****** md5 signature: aecc35a594e467ec2fc262dd639056f5 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
UV: math_Vector
F: math_Vector
DF: math_Matrix

Return
-------
bool

Description
-----------
Calculate Fi(U,V) and Fi'(U,V).
") Values;
		Standard_Boolean Values(const math_Vector & UV, math_Vector & F, math_Matrix & DF);

};


%extend Extrema_CCLocFOfLocECC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Extrema_Curve2dTool *
****************************/
class Extrema_Curve2dTool {
	public:
		/****** Extrema_Curve2dTool::BSpline ******/
		/****** md5 signature: c8c4ab959a140651ece46dfbf0baafac ******/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
No available documentation.
") BSpline;
		static opencascade::handle<Geom2d_BSplineCurve> BSpline(const Adaptor2d_Curve2d & C);

		/****** Extrema_Curve2dTool::Bezier ******/
		/****** md5 signature: 0cf64b1707a46a532700c7b7c5d83177 ******/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
opencascade::handle<Geom2d_BezierCurve>

Description
-----------
No available documentation.
") Bezier;
		static opencascade::handle<Geom2d_BezierCurve> Bezier(const Adaptor2d_Curve2d & C);

		/****** Extrema_Curve2dTool::Circle ******/
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
No available documentation.
") Circle;
		static gp_Circ2d Circle(const Adaptor2d_Curve2d & C);

		/****** Extrema_Curve2dTool::Continuity ******/
		/****** md5 signature: 756de29da208da39a83d9e7bd6b260a6 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		static GeomAbs_Shape Continuity(const Adaptor2d_Curve2d & C);

		/****** Extrema_Curve2dTool::D0 ******/
		/****** md5 signature: 2b0f7c6e7628378c5466f63173da2848 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U: float
P: gp_Pnt2d

Return
-------
None

Description
-----------
Computes the point of parameter U on the curve.
") D0;
		static void D0(const Adaptor2d_Curve2d & C, const Standard_Real U, gp_Pnt2d & P);

		/****** Extrema_Curve2dTool::D1 ******/
		/****** md5 signature: 49247c33066cbc5a32b2fb3a95ae0afc ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U: float
P: gp_Pnt2d
V: gp_Vec2d

Return
-------
None

Description
-----------
Computes the point of parameter U on the curve with its first derivative.
") D1;
		static void D1(const Adaptor2d_Curve2d & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V);

		/****** Extrema_Curve2dTool::D2 ******/
		/****** md5 signature: b236b6fa3b804f10ec34110bccfb81c1 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Return
-------
None

Description
-----------
Returns the point P of parameter U, the first and second derivatives V1 and V2.
") D2;
		static void D2(const Adaptor2d_Curve2d & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****** Extrema_Curve2dTool::D3 ******/
		/****** md5 signature: 675beb36a10809a08c64d732d0ffe85f ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Return
-------
None

Description
-----------
Returns the point P of parameter U, the first, the second and the third derivative.
") D3;
		static void D3(const Adaptor2d_Curve2d & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****** Extrema_Curve2dTool::DN ******/
		/****** md5 signature: 4678c9ac681caad59540990ee359a046 ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U: float
N: int

Return
-------
gp_Vec2d

Description
-----------
The returned vector gives the value of the derivative for the order of derivation N.
") DN;
		static gp_Vec2d DN(const Adaptor2d_Curve2d & C, const Standard_Real U, const Standard_Integer N);

		/****** Extrema_Curve2dTool::DeflCurvIntervals ******/
		/****** md5 signature: d98fb15f92669c3bbd8c04f1a9fee06d ******/
		%feature("compactdefaultargs") DeflCurvIntervals;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
Returns the parameters bounding the intervals of subdivision of curve according to Curvature deflection. Value of deflection is defined in method. //!.
") DeflCurvIntervals;
		static opencascade::handle<TColStd_HArray1OfReal> DeflCurvIntervals(const Adaptor2d_Curve2d & C);

		/****** Extrema_Curve2dTool::Degree ******/
		/****** md5 signature: 9581ff0fc0c406a9427befca62ed1f81 ******/
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
		static Standard_Integer Degree(const Adaptor2d_Curve2d & C);

		/****** Extrema_Curve2dTool::Ellipse ******/
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
No available documentation.
") Ellipse;
		static gp_Elips2d Ellipse(const Adaptor2d_Curve2d & C);

		/****** Extrema_Curve2dTool::FirstParameter ******/
		/****** md5 signature: 540078107c638c43eb2ce9ec567932d5 ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
float

Description
-----------
No available documentation.
") FirstParameter;
		static Standard_Real FirstParameter(const Adaptor2d_Curve2d & C);

		/****** Extrema_Curve2dTool::GetType ******/
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
Returns the type of the curve in the current interval: Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.
") GetType;
		static GeomAbs_CurveType GetType(const Adaptor2d_Curve2d & C);

		/****** Extrema_Curve2dTool::Hyperbola ******/
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
No available documentation.
") Hyperbola;
		static gp_Hypr2d Hyperbola(const Adaptor2d_Curve2d & C);

		/****** Extrema_Curve2dTool::Intervals ******/
		/****** md5 signature: b1e1a1a8c70f97665bbcc1237c06a6f1 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>.
") Intervals;
		static void Intervals(const Adaptor2d_Curve2d & C, TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** Extrema_Curve2dTool::IsClosed ******/
		/****** md5 signature: af597bdc835691e612cee746b4bd3270 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
bool

Description
-----------
No available documentation.
") IsClosed;
		static Standard_Boolean IsClosed(const Adaptor2d_Curve2d & C);

		/****** Extrema_Curve2dTool::IsPeriodic ******/
		/****** md5 signature: 24db6e315d488d0546766102053bb345 ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
bool

Description
-----------
No available documentation.
") IsPeriodic;
		static Standard_Boolean IsPeriodic(const Adaptor2d_Curve2d & C);

		/****** Extrema_Curve2dTool::IsRational ******/
		/****** md5 signature: b7a5237e91dc038400c02d702eb1f8a7 ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
bool

Description
-----------
No available documentation.
") IsRational;
		static Standard_Boolean IsRational(const Adaptor2d_Curve2d & C);

		/****** Extrema_Curve2dTool::LastParameter ******/
		/****** md5 signature: b0abc948bceff30cc6ea9b7b21deb71b ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
float

Description
-----------
No available documentation.
") LastParameter;
		static Standard_Real LastParameter(const Adaptor2d_Curve2d & C);

		/****** Extrema_Curve2dTool::Line ******/
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
No available documentation.
") Line;
		static gp_Lin2d Line(const Adaptor2d_Curve2d & C);

		/****** Extrema_Curve2dTool::NbIntervals ******/
		/****** md5 signature: e1f641c900ddcc6ebfcb0a34162a4afb ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
S: GeomAbs_Shape

Return
-------
int

Description
-----------
If necessary, breaks the curve in intervals of continuity <S>. And returns the number of intervals.
") NbIntervals;
		static Standard_Integer NbIntervals(const Adaptor2d_Curve2d & C, const GeomAbs_Shape S);

		/****** Extrema_Curve2dTool::NbKnots ******/
		/****** md5 signature: 37351d3297158df30ae272b9db01eb21 ******/
		%feature("compactdefaultargs") NbKnots;
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
") NbKnots;
		static Standard_Integer NbKnots(const Adaptor2d_Curve2d & C);

		/****** Extrema_Curve2dTool::NbPoles ******/
		/****** md5 signature: fea21d4a9552d51c1cb56925fc498f25 ******/
		%feature("compactdefaultargs") NbPoles;
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
") NbPoles;
		static Standard_Integer NbPoles(const Adaptor2d_Curve2d & C);

		/****** Extrema_Curve2dTool::Parabola ******/
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
No available documentation.
") Parabola;
		static gp_Parab2d Parabola(const Adaptor2d_Curve2d & C);

		/****** Extrema_Curve2dTool::Period ******/
		/****** md5 signature: 3aff9e7fed8d10f77180b7a8f565b0b4 ******/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
float

Description
-----------
No available documentation.
") Period;
		static Standard_Real Period(const Adaptor2d_Curve2d & C);

		/****** Extrema_Curve2dTool::Resolution ******/
		/****** md5 signature: 00a506daa8f861d461577823de6c7258 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
R3d: float

Return
-------
float

Description
-----------
Returns the parametric resolution corresponding to the real space resolution <R3d>.
") Resolution;
		static Standard_Real Resolution(const Adaptor2d_Curve2d & C, const Standard_Real R3d);

		/****** Extrema_Curve2dTool::Value ******/
		/****** md5 signature: 37d2c86e90009879ed2d64d1f3352009 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U: float

Return
-------
gp_Pnt2d

Description
-----------
Computes the point of parameter U on the curve.
") Value;
		static gp_Pnt2d Value(const Adaptor2d_Curve2d & C, const Standard_Real U);

};


%extend Extrema_Curve2dTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Extrema_CurveTool *
**************************/
class Extrema_CurveTool {
	public:
		/****** Extrema_CurveTool::BSpline ******/
		/****** md5 signature: 0c97f5be576526bd2daa9dec9dbdbefd ******/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
opencascade::handle<Geom_BSplineCurve>

Description
-----------
No available documentation.
") BSpline;
		static opencascade::handle<Geom_BSplineCurve> BSpline(const Adaptor3d_Curve & C);

		/****** Extrema_CurveTool::Bezier ******/
		/****** md5 signature: 818858a1835fa105b6c3f6c15c796eed ******/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
opencascade::handle<Geom_BezierCurve>

Description
-----------
No available documentation.
") Bezier;
		static opencascade::handle<Geom_BezierCurve> Bezier(const Adaptor3d_Curve & C);

		/****** Extrema_CurveTool::Circle ******/
		/****** md5 signature: 69b4a6562099293989c9032df5001e91 ******/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
gp_Circ

Description
-----------
No available documentation.
") Circle;
		static gp_Circ Circle(const Adaptor3d_Curve & C);

		/****** Extrema_CurveTool::Continuity ******/
		/****** md5 signature: 7e3ab45085c5f6763876998f88c878c5 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		static GeomAbs_Shape Continuity(const Adaptor3d_Curve & C);

		/****** Extrema_CurveTool::D0 ******/
		/****** md5 signature: bafe9e6acd4c5d61df1a191fd96c9541 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U: float
P: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") D0;
		static void D0(const Adaptor3d_Curve & C, const Standard_Real U, gp_Pnt & P);

		/****** Extrema_CurveTool::D1 ******/
		/****** md5 signature: fe354aa20e6dc4f07e87f863f08729f7 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U: float
P: gp_Pnt
V: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D1;
		static void D1(const Adaptor3d_Curve & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V);

		/****** Extrema_CurveTool::D2 ******/
		/****** md5 signature: 364d76815f0a3ff8c8c8acda8f073f20 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D2;
		static void D2(const Adaptor3d_Curve & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** Extrema_CurveTool::D3 ******/
		/****** md5 signature: fe4e9f030699b826155158b744eeede4 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D3;
		static void D3(const Adaptor3d_Curve & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****** Extrema_CurveTool::DN ******/
		/****** md5 signature: 43f589f46832d631a9b5b3dcd80b303c ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U: float
N: int

Return
-------
gp_Vec

Description
-----------
No available documentation.
") DN;
		static gp_Vec DN(const Adaptor3d_Curve & C, const Standard_Real U, const Standard_Integer N);

		/****** Extrema_CurveTool::DeflCurvIntervals ******/
		/****** md5 signature: a4626f43eaff2e9612562e3bb29a67aa ******/
		%feature("compactdefaultargs") DeflCurvIntervals;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
Returns the parameters bounding the intervals of subdivision of curve according to Curvature deflection. Value of deflection is defined in method. //!.
") DeflCurvIntervals;
		static opencascade::handle<TColStd_HArray1OfReal> DeflCurvIntervals(const Adaptor3d_Curve & C);

		/****** Extrema_CurveTool::Degree ******/
		/****** md5 signature: 4c8f00f81dc52f68c21806e707a3a7b9 ******/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
int

Description
-----------
No available documentation.
") Degree;
		static Standard_Integer Degree(const Adaptor3d_Curve & C);

		/****** Extrema_CurveTool::Ellipse ******/
		/****** md5 signature: 921b94563d156d37bbb656506389cb01 ******/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
gp_Elips

Description
-----------
No available documentation.
") Ellipse;
		static gp_Elips Ellipse(const Adaptor3d_Curve & C);

		/****** Extrema_CurveTool::FirstParameter ******/
		/****** md5 signature: 6cea3f5c9c492795d465235a10707515 ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
float

Description
-----------
No available documentation.
") FirstParameter;
		static Standard_Real FirstParameter(const Adaptor3d_Curve & C);

		/****** Extrema_CurveTool::GetType ******/
		/****** md5 signature: 479ad1024af3da76cf1162450cb47079 ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
GeomAbs_CurveType

Description
-----------
No available documentation.
") GetType;
		static GeomAbs_CurveType GetType(const Adaptor3d_Curve & C);

		/****** Extrema_CurveTool::Hyperbola ******/
		/****** md5 signature: 1dd05079123580f2ca71a6f30ca02156 ******/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
gp_Hypr

Description
-----------
No available documentation.
") Hyperbola;
		static gp_Hypr Hyperbola(const Adaptor3d_Curve & C);

		/****** Extrema_CurveTool::Intervals ******/
		/****** md5 signature: c59b411ed8f13aec3361e6336ed8b81f ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		static void Intervals(Adaptor3d_Curve & C, TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** Extrema_CurveTool::IsPeriodic ******/
		/****** md5 signature: d31f3b4c79afd1942bdd2c78fb2fb259 ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
bool

Description
-----------
No available documentation.
") IsPeriodic;
		static Standard_Boolean IsPeriodic(const Adaptor3d_Curve & C);

		/****** Extrema_CurveTool::IsRational ******/
		/****** md5 signature: 25abf33ff4df5410bf8f820a1547a5e0 ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
bool

Description
-----------
No available documentation.
") IsRational;
		static Standard_Boolean IsRational(const Adaptor3d_Curve & C);

		/****** Extrema_CurveTool::LastParameter ******/
		/****** md5 signature: 2d16a1cb309605946ea3c6ea6342ebc3 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
float

Description
-----------
No available documentation.
") LastParameter;
		static Standard_Real LastParameter(const Adaptor3d_Curve & C);

		/****** Extrema_CurveTool::Line ******/
		/****** md5 signature: 1a7b33fceb2ec97542564608da5f590a ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
gp_Lin

Description
-----------
No available documentation.
") Line;
		static gp_Lin Line(const Adaptor3d_Curve & C);

		/****** Extrema_CurveTool::NbIntervals ******/
		/****** md5 signature: cf97edf44110186eab92181c085ae1f7 ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>.
") NbIntervals;
		static Standard_Integer NbIntervals(Adaptor3d_Curve & C, const GeomAbs_Shape S);

		/****** Extrema_CurveTool::NbKnots ******/
		/****** md5 signature: a42e66d711c34ebe3ab41b1a70f28759 ******/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
int

Description
-----------
No available documentation.
") NbKnots;
		static Standard_Integer NbKnots(const Adaptor3d_Curve & C);

		/****** Extrema_CurveTool::NbPoles ******/
		/****** md5 signature: 3ed8b75caa9bfe8c6840308a79b6a2d8 ******/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
int

Description
-----------
No available documentation.
") NbPoles;
		static Standard_Integer NbPoles(const Adaptor3d_Curve & C);

		/****** Extrema_CurveTool::Parabola ******/
		/****** md5 signature: 4462340c3f523d2746c330836fcf6c5c ******/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
gp_Parab

Description
-----------
No available documentation.
") Parabola;
		static gp_Parab Parabola(const Adaptor3d_Curve & C);

		/****** Extrema_CurveTool::Period ******/
		/****** md5 signature: bc233dfa3cea6c38ee569617bbb51465 ******/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
float

Description
-----------
No available documentation.
") Period;
		static Standard_Real Period(const Adaptor3d_Curve & C);

		/****** Extrema_CurveTool::Resolution ******/
		/****** md5 signature: a7f94e2f406fae25aaf1a3f45a6f3d9f ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
R3d: float

Return
-------
float

Description
-----------
No available documentation.
") Resolution;
		static Standard_Real Resolution(const Adaptor3d_Curve & C, const Standard_Real R3d);

		/****** Extrema_CurveTool::Value ******/
		/****** md5 signature: 0488ad36e3eab18004f93749270bbdec ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U: float

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Value;
		static gp_Pnt Value(const Adaptor3d_Curve & C, const Standard_Real U);

};


%extend Extrema_CurveTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class Extrema_ECC *
********************/
class Extrema_ECC {
	public:
		/****** Extrema_ECC::Extrema_ECC ******/
		/****** md5 signature: f1d52defa9b50dd53f39dc64992c57fb ******/
		%feature("compactdefaultargs") Extrema_ECC;
		%feature("autodoc", "Return
-------
None

Description
-----------
Calculates all the distances as above between Uinf and Usup for C1 and between Vinf and Vsup for C2.
") Extrema_ECC;
		 Extrema_ECC();

		/****** Extrema_ECC::Extrema_ECC ******/
		/****** md5 signature: c8c401f587043bb48010e54044b8b10d ******/
		%feature("compactdefaultargs") Extrema_ECC;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor3d_Curve
C2: Adaptor3d_Curve

Return
-------
None

Description
-----------
It calculates all the distances. The function F(u,v)=distance(C1(u),C2(v)) has an extremum when gradient(f)=0. The algorithm uses Evtushenko's global optimization solver.
") Extrema_ECC;
		 Extrema_ECC(const Adaptor3d_Curve & C1, const Adaptor3d_Curve & C2);

		/****** Extrema_ECC::Extrema_ECC ******/
		/****** md5 signature: 4d4fa8be0cc0769d1a7a82bbcda8a7d0 ******/
		%feature("compactdefaultargs") Extrema_ECC;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor3d_Curve
C2: Adaptor3d_Curve
Uinf: float
Usup: float
Vinf: float
Vsup: float

Return
-------
None

Description
-----------
Calculates all the distances as above between Uinf and Usup for C1 and between Vinf and Vsup for C2.
") Extrema_ECC;
		 Extrema_ECC(const Adaptor3d_Curve & C1, const Adaptor3d_Curve & C2, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real Vinf, const Standard_Real Vsup);

		/****** Extrema_ECC::GetSingleSolutionFlag ******/
		/****** md5 signature: b28121e257a0efb9e2c6c13cf0ce823d ******/
		%feature("compactdefaultargs") GetSingleSolutionFlag;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Get flag for single extrema computation. Works on parametric solver only.
") GetSingleSolutionFlag;
		Standard_Boolean GetSingleSolutionFlag();

		/****** Extrema_ECC::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distances are found.
") IsDone;
		Standard_Boolean IsDone();

		/****** Extrema_ECC::IsParallel ******/
		/****** md5 signature: 47a312fd58e74bf5bb8a9bb6f0484dfb ******/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns state of myParallel flag.
") IsParallel;
		Standard_Boolean IsParallel();

		/****** Extrema_ECC::NbExt ******/
		/****** md5 signature: 84ada636e4651cacf916eb056265a1d9 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		Standard_Integer NbExt();

		/****** Extrema_ECC::Perform ******/
		/****** md5 signature: c04b01412cba7220c024b5eb4532697f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
Performs calculations.
") Perform;
		void Perform();

		/****** Extrema_ECC::Points ******/
		/****** md5 signature: 3794ed44489c98c8247e475c96bba9a2 ******/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "
Parameters
----------
N: int
P1: Extrema_POnCurv
P2: Extrema_POnCurv

Return
-------
None

Description
-----------
Returns the points of the Nth extremum distance. P1 is on the first curve, P2 on the second one.
") Points;
		void Points(const Standard_Integer N, Extrema_POnCurv & P1, Extrema_POnCurv & P2);

		/****** Extrema_ECC::SetParams ******/
		/****** md5 signature: ef14d1cd32f692d88e1fd4c3ca54a0fb ******/
		%feature("compactdefaultargs") SetParams;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor3d_Curve
C2: Adaptor3d_Curve
Uinf: float
Usup: float
Vinf: float
Vsup: float

Return
-------
None

Description
-----------
Set params in case of empty constructor is usage.
") SetParams;
		void SetParams(const Adaptor3d_Curve & C1, const Adaptor3d_Curve & C2, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real Vinf, const Standard_Real Vsup);

		/****** Extrema_ECC::SetSingleSolutionFlag ******/
		/****** md5 signature: 7fa45b94e509fd90dd043f395439167b ******/
		%feature("compactdefaultargs") SetSingleSolutionFlag;
		%feature("autodoc", "
Parameters
----------
theSingleSolutionFlag: bool

Return
-------
None

Description
-----------
Set flag for single extrema computation. Works on parametric solver only.
") SetSingleSolutionFlag;
		void SetSingleSolutionFlag(const Standard_Boolean theSingleSolutionFlag);

		/****** Extrema_ECC::SetTolerance ******/
		/****** md5 signature: fc6e9b0c16aebccb1a4d05571a3e6ef6 ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") SetTolerance;
		void SetTolerance(const Standard_Real Tol);

		/****** Extrema_ECC::SquareDistance ******/
		/****** md5 signature: badb2a0561651254031917071ad28398 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int (optional, default to 1)

Return
-------
float

Description
-----------
Returns the value of the Nth square extremum distance.
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N = 1);

};


%extend Extrema_ECC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Extrema_ECC2d *
**********************/
class Extrema_ECC2d {
	public:
		/****** Extrema_ECC2d::Extrema_ECC2d ******/
		/****** md5 signature: 4d25e00e56aacaff607db9accfe3c80c ******/
		%feature("compactdefaultargs") Extrema_ECC2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Calculates all the distances as above between Uinf and Usup for C1 and between Vinf and Vsup for C2.
") Extrema_ECC2d;
		 Extrema_ECC2d();

		/****** Extrema_ECC2d::Extrema_ECC2d ******/
		/****** md5 signature: 18ec7cc19510c225f86e12c62cee018b ******/
		%feature("compactdefaultargs") Extrema_ECC2d;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
It calculates all the distances. The function F(u,v)=distance(C1(u),C2(v)) has an extremum when gradient(f)=0. The algorithm uses Evtushenko's global optimization solver.
") Extrema_ECC2d;
		 Extrema_ECC2d(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2);

		/****** Extrema_ECC2d::Extrema_ECC2d ******/
		/****** md5 signature: 7753d66a8f0966ab829d7285b21dc28c ******/
		%feature("compactdefaultargs") Extrema_ECC2d;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d
Uinf: float
Usup: float
Vinf: float
Vsup: float

Return
-------
None

Description
-----------
Calculates all the distances as above between Uinf and Usup for C1 and between Vinf and Vsup for C2.
") Extrema_ECC2d;
		 Extrema_ECC2d(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real Vinf, const Standard_Real Vsup);

		/****** Extrema_ECC2d::GetSingleSolutionFlag ******/
		/****** md5 signature: b28121e257a0efb9e2c6c13cf0ce823d ******/
		%feature("compactdefaultargs") GetSingleSolutionFlag;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Get flag for single extrema computation. Works on parametric solver only.
") GetSingleSolutionFlag;
		Standard_Boolean GetSingleSolutionFlag();

		/****** Extrema_ECC2d::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distances are found.
") IsDone;
		Standard_Boolean IsDone();

		/****** Extrema_ECC2d::IsParallel ******/
		/****** md5 signature: 47a312fd58e74bf5bb8a9bb6f0484dfb ******/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns state of myParallel flag.
") IsParallel;
		Standard_Boolean IsParallel();

		/****** Extrema_ECC2d::NbExt ******/
		/****** md5 signature: 84ada636e4651cacf916eb056265a1d9 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		Standard_Integer NbExt();

		/****** Extrema_ECC2d::Perform ******/
		/****** md5 signature: c04b01412cba7220c024b5eb4532697f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
Performs calculations.
") Perform;
		void Perform();

		/****** Extrema_ECC2d::Points ******/
		/****** md5 signature: b11c393bae576338fc3f288ecb955b49 ******/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "
Parameters
----------
N: int
P1: Extrema_POnCurv2d
P2: Extrema_POnCurv2d

Return
-------
None

Description
-----------
Returns the points of the Nth extremum distance. P1 is on the first curve, P2 on the second one.
") Points;
		void Points(const Standard_Integer N, Extrema_POnCurv2d & P1, Extrema_POnCurv2d & P2);

		/****** Extrema_ECC2d::SetParams ******/
		/****** md5 signature: c22ecde336403c4ef664a23c1a078cbc ******/
		%feature("compactdefaultargs") SetParams;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d
Uinf: float
Usup: float
Vinf: float
Vsup: float

Return
-------
None

Description
-----------
Set params in case of empty constructor is usage.
") SetParams;
		void SetParams(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real Vinf, const Standard_Real Vsup);

		/****** Extrema_ECC2d::SetSingleSolutionFlag ******/
		/****** md5 signature: 7fa45b94e509fd90dd043f395439167b ******/
		%feature("compactdefaultargs") SetSingleSolutionFlag;
		%feature("autodoc", "
Parameters
----------
theSingleSolutionFlag: bool

Return
-------
None

Description
-----------
Set flag for single extrema computation. Works on parametric solver only.
") SetSingleSolutionFlag;
		void SetSingleSolutionFlag(const Standard_Boolean theSingleSolutionFlag);

		/****** Extrema_ECC2d::SetTolerance ******/
		/****** md5 signature: fc6e9b0c16aebccb1a4d05571a3e6ef6 ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") SetTolerance;
		void SetTolerance(const Standard_Real Tol);

		/****** Extrema_ECC2d::SquareDistance ******/
		/****** md5 signature: badb2a0561651254031917071ad28398 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int (optional, default to 1)

Return
-------
float

Description
-----------
Returns the value of the Nth square extremum distance.
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N = 1);

};


%extend Extrema_ECC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class Extrema_ELPCOfLocateExtPC *
**********************************/
class Extrema_ELPCOfLocateExtPC {
	public:
		/****** Extrema_ELPCOfLocateExtPC::Extrema_ELPCOfLocateExtPC ******/
		/****** md5 signature: bb936d9df0f63ec27b8e8023e08cd843 ******/
		%feature("compactdefaultargs") Extrema_ELPCOfLocateExtPC;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_ELPCOfLocateExtPC;
		 Extrema_ELPCOfLocateExtPC();

		/****** Extrema_ELPCOfLocateExtPC::Extrema_ELPCOfLocateExtPC ******/
		/****** md5 signature: 5eb013e4fc68fcbf6f33585765f7e07d ******/
		%feature("compactdefaultargs") Extrema_ELPCOfLocateExtPC;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
C: Adaptor3d_Curve
Uinf: float
Usup: float
TolF: float (optional, default to 1.0e-10)

Return
-------
None

Description
-----------
It calculates all the distances. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searches all the zeros inside the definition range of the curve. Zeros are searched between uinf and usup. Tol is used to decide to stop the iterations according to the following condition: if n is the number of iterations, the algorithm stops when abs(F(Un)-F(Un-1)) < Tol.
") Extrema_ELPCOfLocateExtPC;
		 Extrema_ELPCOfLocateExtPC(const gp_Pnt & P, const Adaptor3d_Curve & C, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real TolF = 1.0e-10);

		/****** Extrema_ELPCOfLocateExtPC::Extrema_ELPCOfLocateExtPC ******/
		/****** md5 signature: ead97d1e3f13344482279c11cf20d92f ******/
		%feature("compactdefaultargs") Extrema_ELPCOfLocateExtPC;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
C: Adaptor3d_Curve
TolF: float (optional, default to 1.0e-10)

Return
-------
None

Description
-----------
It calculates all the distances. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searches all the zeros inside the definition range of the curve. Tol is used to decide to stop the iterations according to the following condition: if n is the number of iterations, the algorithm stops when abs(F(Un)-F(Un-1)) < Tol.
") Extrema_ELPCOfLocateExtPC;
		 Extrema_ELPCOfLocateExtPC(const gp_Pnt & P, const Adaptor3d_Curve & C, const Standard_Real TolF = 1.0e-10);

		/****** Extrema_ELPCOfLocateExtPC::Initialize ******/
		/****** md5 signature: 6ac5bc3f72e0a8236c8f51c23167f9f5 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
Uinf: float
Usup: float
TolF: float (optional, default to 1.0e-10)

Return
-------
None

Description
-----------
initializes the fields of the algorithm.
") Initialize;
		void Initialize(const Adaptor3d_Curve & C, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real TolF = 1.0e-10);

		/****** Extrema_ELPCOfLocateExtPC::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if the distances are found.
") IsDone;
		Standard_Boolean IsDone();

		/****** Extrema_ELPCOfLocateExtPC::IsMin ******/
		/****** md5 signature: d296cefb075e9db02ee60a375c81a9f6 ******/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Returns True if the <N>th extremum distance is a minimum.
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****** Extrema_ELPCOfLocateExtPC::NbExt ******/
		/****** md5 signature: 84ada636e4651cacf916eb056265a1d9 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		Standard_Integer NbExt();

		/****** Extrema_ELPCOfLocateExtPC::Perform ******/
		/****** md5 signature: 5f5e57fd55ba2b5f8e2b2be09861a3f9 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
None

Description
-----------
An exception is raised if the fields have not been initialized.
") Perform;
		void Perform(const gp_Pnt & P);

		/****** Extrema_ELPCOfLocateExtPC::Point ******/
		/****** md5 signature: 1a3c4a6f09c4cb823314eefe5165e75c ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
Extrema_POnCurv

Description
-----------
Returns the point of the <N>th extremum distance.
") Point;
		const Extrema_POnCurv & Point(const Standard_Integer N);

		/****** Extrema_ELPCOfLocateExtPC::SquareDistance ******/
		/****** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
float

Description
-----------
Returns the value of the <N>th extremum square distance.
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****** Extrema_ELPCOfLocateExtPC::TrimmedSquareDistances ******/
		/****** md5 signature: 2e689901655c68a486db722f362ab27b ******/
		%feature("compactdefaultargs") TrimmedSquareDistances;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Return
-------
dist1: float
dist2: float

Description
-----------
if the curve is a trimmed curve, dist1 is a square distance between <P> and the point of parameter FirstParameter <P1> and dist2 is a square distance between <P> and the point of parameter LastParameter <P2>.
") TrimmedSquareDistances;
		void TrimmedSquareDistances(Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt & P1, gp_Pnt & P2);

};


%extend Extrema_ELPCOfLocateExtPC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class Extrema_ELPCOfLocateExtPC2d *
************************************/
class Extrema_ELPCOfLocateExtPC2d {
	public:
		/****** Extrema_ELPCOfLocateExtPC2d::Extrema_ELPCOfLocateExtPC2d ******/
		/****** md5 signature: 8f092e293eefb4dd4a9f9ca1c996abcb ******/
		%feature("compactdefaultargs") Extrema_ELPCOfLocateExtPC2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_ELPCOfLocateExtPC2d;
		 Extrema_ELPCOfLocateExtPC2d();

		/****** Extrema_ELPCOfLocateExtPC2d::Extrema_ELPCOfLocateExtPC2d ******/
		/****** md5 signature: ca7ed58355df77b568d0d2b8e4c4d3b5 ******/
		%feature("compactdefaultargs") Extrema_ELPCOfLocateExtPC2d;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d
Uinf: float
Usup: float
TolF: float (optional, default to 1.0e-10)

Return
-------
None

Description
-----------
It calculates all the distances. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searches all the zeros inside the definition range of the curve. Zeros are searched between uinf and usup. Tol is used to decide to stop the iterations according to the following condition: if n is the number of iterations, the algorithm stops when abs(F(Un)-F(Un-1)) < Tol.
") Extrema_ELPCOfLocateExtPC2d;
		 Extrema_ELPCOfLocateExtPC2d(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real TolF = 1.0e-10);

		/****** Extrema_ELPCOfLocateExtPC2d::Extrema_ELPCOfLocateExtPC2d ******/
		/****** md5 signature: 9ae6c47d8acbe1e37a56bc7bb09b19cd ******/
		%feature("compactdefaultargs") Extrema_ELPCOfLocateExtPC2d;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d
TolF: float (optional, default to 1.0e-10)

Return
-------
None

Description
-----------
It calculates all the distances. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searches all the zeros inside the definition range of the curve. Tol is used to decide to stop the iterations according to the following condition: if n is the number of iterations, the algorithm stops when abs(F(Un)-F(Un-1)) < Tol.
") Extrema_ELPCOfLocateExtPC2d;
		 Extrema_ELPCOfLocateExtPC2d(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C, const Standard_Real TolF = 1.0e-10);

		/****** Extrema_ELPCOfLocateExtPC2d::Initialize ******/
		/****** md5 signature: be89f8d1b5b5ecf504acd30e1f24f787 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
Uinf: float
Usup: float
TolF: float (optional, default to 1.0e-10)

Return
-------
None

Description
-----------
initializes the fields of the algorithm.
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real TolF = 1.0e-10);

		/****** Extrema_ELPCOfLocateExtPC2d::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if the distances are found.
") IsDone;
		Standard_Boolean IsDone();

		/****** Extrema_ELPCOfLocateExtPC2d::IsMin ******/
		/****** md5 signature: d296cefb075e9db02ee60a375c81a9f6 ******/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Returns True if the <N>th extremum distance is a minimum.
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****** Extrema_ELPCOfLocateExtPC2d::NbExt ******/
		/****** md5 signature: 84ada636e4651cacf916eb056265a1d9 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		Standard_Integer NbExt();

		/****** Extrema_ELPCOfLocateExtPC2d::Perform ******/
		/****** md5 signature: 59fee48271d5ac79a6de2fe73317998c ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d

Return
-------
None

Description
-----------
An exception is raised if the fields have not been initialized.
") Perform;
		void Perform(const gp_Pnt2d & P);

		/****** Extrema_ELPCOfLocateExtPC2d::Point ******/
		/****** md5 signature: 6123812027804044a54749cfa19bef5e ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
Extrema_POnCurv2d

Description
-----------
Returns the point of the <N>th extremum distance.
") Point;
		const Extrema_POnCurv2d & Point(const Standard_Integer N);

		/****** Extrema_ELPCOfLocateExtPC2d::SquareDistance ******/
		/****** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
float

Description
-----------
Returns the value of the <N>th extremum square distance.
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****** Extrema_ELPCOfLocateExtPC2d::TrimmedSquareDistances ******/
		/****** md5 signature: d92e1ba45ead5acc8c7f33976cfdf6e6 ******/
		%feature("compactdefaultargs") TrimmedSquareDistances;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d

Return
-------
dist1: float
dist2: float

Description
-----------
if the curve is a trimmed curve, dist1 is a square distance between <P> and the point of parameter FirstParameter <P1> and dist2 is a square distance between <P> and the point of parameter LastParameter <P2>.
") TrimmedSquareDistances;
		void TrimmedSquareDistances(Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & P1, gp_Pnt2d & P2);

};


%extend Extrema_ELPCOfLocateExtPC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class Extrema_EPCOfELPCOfLocateExtPC *
***************************************/
class Extrema_EPCOfELPCOfLocateExtPC {
	public:
		/****** Extrema_EPCOfELPCOfLocateExtPC::Extrema_EPCOfELPCOfLocateExtPC ******/
		/****** md5 signature: d031d7ce7ee4902c782ca863539576de ******/
		%feature("compactdefaultargs") Extrema_EPCOfELPCOfLocateExtPC;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_EPCOfELPCOfLocateExtPC;
		 Extrema_EPCOfELPCOfLocateExtPC();

		/****** Extrema_EPCOfELPCOfLocateExtPC::Extrema_EPCOfELPCOfLocateExtPC ******/
		/****** md5 signature: 909eda134dca8bd066edf6f295b1a9d2 ******/
		%feature("compactdefaultargs") Extrema_EPCOfELPCOfLocateExtPC;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
C: Adaptor3d_Curve
NbU: int
TolU: float
TolF: float

Return
-------
None

Description
-----------
It calculates all the distances. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searches all the zeros inside the definition range of the curve. NbU is used to locate the close points to find the zeros. Tol and TolU are used to decide to stop the iterations according to the following condition: if n is the number of iterations, abs(Un-Un-1) < TolU and abs(F(Un)-F(Un-1)) < Tol.
") Extrema_EPCOfELPCOfLocateExtPC;
		 Extrema_EPCOfELPCOfLocateExtPC(const gp_Pnt & P, const Adaptor3d_Curve & C, const Standard_Integer NbU, const Standard_Real TolU, const Standard_Real TolF);

		/****** Extrema_EPCOfELPCOfLocateExtPC::Extrema_EPCOfELPCOfLocateExtPC ******/
		/****** md5 signature: a06ba847c93cff0df9b4ab69c43b3ea4 ******/
		%feature("compactdefaultargs") Extrema_EPCOfELPCOfLocateExtPC;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
C: Adaptor3d_Curve
NbU: int
Umin: float
Usup: float
TolU: float
TolF: float

Return
-------
None

Description
-----------
It calculates all the distances. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searches all the zeros inside the definition range of the curve. NbU is used to locate the close points to find the zeros. Zeros are searched between umin and usup. Tol and TolU are used to decide to stop the iterations according to the following condition: if n is the number of iterations, abs(Un-Un-1) < TolU and abs(F(Un)-F(Un-1)) < Tol.
") Extrema_EPCOfELPCOfLocateExtPC;
		 Extrema_EPCOfELPCOfLocateExtPC(const gp_Pnt & P, const Adaptor3d_Curve & C, const Standard_Integer NbU, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU, const Standard_Real TolF);

		/****** Extrema_EPCOfELPCOfLocateExtPC::Initialize ******/
		/****** md5 signature: b8e83a64d3c33c8a4e28f4682b235bbb ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
NbU: int
TolU: float
TolF: float

Return
-------
None

Description
-----------
sets the fields of the algorithm.
") Initialize;
		void Initialize(const Adaptor3d_Curve & C, const Standard_Integer NbU, const Standard_Real TolU, const Standard_Real TolF);

		/****** Extrema_EPCOfELPCOfLocateExtPC::Initialize ******/
		/****** md5 signature: bf3c9f855e71bda7dd32647a562411bf ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
NbU: int
Umin: float
Usup: float
TolU: float
TolF: float

Return
-------
None

Description
-----------
sets the fields of the algorithm.
") Initialize;
		void Initialize(const Adaptor3d_Curve & C, const Standard_Integer NbU, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU, const Standard_Real TolF);

		/****** Extrema_EPCOfELPCOfLocateExtPC::Initialize ******/
		/****** md5 signature: 96ecca85f670f0aff9194161a9bd5dc1 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
None

Description
-----------
sets the fields of the algorithm.
") Initialize;
		void Initialize(const Adaptor3d_Curve & C);

		/****** Extrema_EPCOfELPCOfLocateExtPC::Initialize ******/
		/****** md5 signature: bdcd99b58831999e0cacf879b57f7aca ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
NbU: int
Umin: float
Usup: float
TolU: float
TolF: float

Return
-------
None

Description
-----------
sets the fields of the algorithm.
") Initialize;
		void Initialize(const Standard_Integer NbU, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU, const Standard_Real TolF);

		/****** Extrema_EPCOfELPCOfLocateExtPC::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if the distances are found.
") IsDone;
		Standard_Boolean IsDone();

		/****** Extrema_EPCOfELPCOfLocateExtPC::IsMin ******/
		/****** md5 signature: d296cefb075e9db02ee60a375c81a9f6 ******/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Returns True if the Nth extremum distance is a minimum.
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****** Extrema_EPCOfELPCOfLocateExtPC::NbExt ******/
		/****** md5 signature: 84ada636e4651cacf916eb056265a1d9 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		Standard_Integer NbExt();

		/****** Extrema_EPCOfELPCOfLocateExtPC::Perform ******/
		/****** md5 signature: 5f5e57fd55ba2b5f8e2b2be09861a3f9 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
None

Description
-----------
the algorithm is done with the point P. An exception is raised if the fields have not been initialized.
") Perform;
		void Perform(const gp_Pnt & P);

		/****** Extrema_EPCOfELPCOfLocateExtPC::Point ******/
		/****** md5 signature: 1a3c4a6f09c4cb823314eefe5165e75c ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
Extrema_POnCurv

Description
-----------
Returns the point of the Nth extremum distance.
") Point;
		const Extrema_POnCurv & Point(const Standard_Integer N);

		/****** Extrema_EPCOfELPCOfLocateExtPC::SquareDistance ******/
		/****** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
float

Description
-----------
Returns the value of the Nth extremum square distance.
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

};


%extend Extrema_EPCOfELPCOfLocateExtPC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class Extrema_EPCOfELPCOfLocateExtPC2d *
*****************************************/
class Extrema_EPCOfELPCOfLocateExtPC2d {
	public:
		/****** Extrema_EPCOfELPCOfLocateExtPC2d::Extrema_EPCOfELPCOfLocateExtPC2d ******/
		/****** md5 signature: e673ff31f47b907e3142f38655a34ff0 ******/
		%feature("compactdefaultargs") Extrema_EPCOfELPCOfLocateExtPC2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_EPCOfELPCOfLocateExtPC2d;
		 Extrema_EPCOfELPCOfLocateExtPC2d();

		/****** Extrema_EPCOfELPCOfLocateExtPC2d::Extrema_EPCOfELPCOfLocateExtPC2d ******/
		/****** md5 signature: 8f3881b23e0058c54bf5de87961608df ******/
		%feature("compactdefaultargs") Extrema_EPCOfELPCOfLocateExtPC2d;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d
NbU: int
TolU: float
TolF: float

Return
-------
None

Description
-----------
It calculates all the distances. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searches all the zeros inside the definition range of the curve. NbU is used to locate the close points to find the zeros. Tol and TolU are used to decide to stop the iterations according to the following condition: if n is the number of iterations, abs(Un-Un-1) < TolU and abs(F(Un)-F(Un-1)) < Tol.
") Extrema_EPCOfELPCOfLocateExtPC2d;
		 Extrema_EPCOfELPCOfLocateExtPC2d(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C, const Standard_Integer NbU, const Standard_Real TolU, const Standard_Real TolF);

		/****** Extrema_EPCOfELPCOfLocateExtPC2d::Extrema_EPCOfELPCOfLocateExtPC2d ******/
		/****** md5 signature: 2ff481b1955aaf32316f2eedc538cb2e ******/
		%feature("compactdefaultargs") Extrema_EPCOfELPCOfLocateExtPC2d;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d
NbU: int
Umin: float
Usup: float
TolU: float
TolF: float

Return
-------
None

Description
-----------
It calculates all the distances. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searches all the zeros inside the definition range of the curve. NbU is used to locate the close points to find the zeros. Zeros are searched between umin and usup. Tol and TolU are used to decide to stop the iterations according to the following condition: if n is the number of iterations, abs(Un-Un-1) < TolU and abs(F(Un)-F(Un-1)) < Tol.
") Extrema_EPCOfELPCOfLocateExtPC2d;
		 Extrema_EPCOfELPCOfLocateExtPC2d(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C, const Standard_Integer NbU, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU, const Standard_Real TolF);

		/****** Extrema_EPCOfELPCOfLocateExtPC2d::Initialize ******/
		/****** md5 signature: 0c4d5ef0210a20d5cfdf67b6198c9095 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
NbU: int
TolU: float
TolF: float

Return
-------
None

Description
-----------
sets the fields of the algorithm.
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C, const Standard_Integer NbU, const Standard_Real TolU, const Standard_Real TolF);

		/****** Extrema_EPCOfELPCOfLocateExtPC2d::Initialize ******/
		/****** md5 signature: 9e172761979bca888575dc8cff8ac8a9 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
NbU: int
Umin: float
Usup: float
TolU: float
TolF: float

Return
-------
None

Description
-----------
sets the fields of the algorithm.
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C, const Standard_Integer NbU, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU, const Standard_Real TolF);

		/****** Extrema_EPCOfELPCOfLocateExtPC2d::Initialize ******/
		/****** md5 signature: 295b46cc3c15eb5116b8523fecaa122c ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
sets the fields of the algorithm.
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C);

		/****** Extrema_EPCOfELPCOfLocateExtPC2d::Initialize ******/
		/****** md5 signature: bdcd99b58831999e0cacf879b57f7aca ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
NbU: int
Umin: float
Usup: float
TolU: float
TolF: float

Return
-------
None

Description
-----------
sets the fields of the algorithm.
") Initialize;
		void Initialize(const Standard_Integer NbU, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU, const Standard_Real TolF);

		/****** Extrema_EPCOfELPCOfLocateExtPC2d::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if the distances are found.
") IsDone;
		Standard_Boolean IsDone();

		/****** Extrema_EPCOfELPCOfLocateExtPC2d::IsMin ******/
		/****** md5 signature: d296cefb075e9db02ee60a375c81a9f6 ******/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Returns True if the Nth extremum distance is a minimum.
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****** Extrema_EPCOfELPCOfLocateExtPC2d::NbExt ******/
		/****** md5 signature: 84ada636e4651cacf916eb056265a1d9 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		Standard_Integer NbExt();

		/****** Extrema_EPCOfELPCOfLocateExtPC2d::Perform ******/
		/****** md5 signature: 59fee48271d5ac79a6de2fe73317998c ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d

Return
-------
None

Description
-----------
the algorithm is done with the point P. An exception is raised if the fields have not been initialized.
") Perform;
		void Perform(const gp_Pnt2d & P);

		/****** Extrema_EPCOfELPCOfLocateExtPC2d::Point ******/
		/****** md5 signature: 6123812027804044a54749cfa19bef5e ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
Extrema_POnCurv2d

Description
-----------
Returns the point of the Nth extremum distance.
") Point;
		const Extrema_POnCurv2d & Point(const Standard_Integer N);

		/****** Extrema_EPCOfELPCOfLocateExtPC2d::SquareDistance ******/
		/****** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
float

Description
-----------
Returns the value of the Nth extremum square distance.
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

};


%extend Extrema_EPCOfELPCOfLocateExtPC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Extrema_EPCOfExtPC *
***************************/
class Extrema_EPCOfExtPC {
	public:
		/****** Extrema_EPCOfExtPC::Extrema_EPCOfExtPC ******/
		/****** md5 signature: b7a31ac2e708fd73365a35020614ea0b ******/
		%feature("compactdefaultargs") Extrema_EPCOfExtPC;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_EPCOfExtPC;
		 Extrema_EPCOfExtPC();

		/****** Extrema_EPCOfExtPC::Extrema_EPCOfExtPC ******/
		/****** md5 signature: 48fc709c66fee1c004b2cc4dd1545dbc ******/
		%feature("compactdefaultargs") Extrema_EPCOfExtPC;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
C: Adaptor3d_Curve
NbU: int
TolU: float
TolF: float

Return
-------
None

Description
-----------
It calculates all the distances. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searches all the zeros inside the definition range of the curve. NbU is used to locate the close points to find the zeros. Tol and TolU are used to decide to stop the iterations according to the following condition: if n is the number of iterations, abs(Un-Un-1) < TolU and abs(F(Un)-F(Un-1)) < Tol.
") Extrema_EPCOfExtPC;
		 Extrema_EPCOfExtPC(const gp_Pnt & P, const Adaptor3d_Curve & C, const Standard_Integer NbU, const Standard_Real TolU, const Standard_Real TolF);

		/****** Extrema_EPCOfExtPC::Extrema_EPCOfExtPC ******/
		/****** md5 signature: 592c802da1f9faf50937c805bbc4dec7 ******/
		%feature("compactdefaultargs") Extrema_EPCOfExtPC;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
C: Adaptor3d_Curve
NbU: int
Umin: float
Usup: float
TolU: float
TolF: float

Return
-------
None

Description
-----------
It calculates all the distances. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searches all the zeros inside the definition range of the curve. NbU is used to locate the close points to find the zeros. Zeros are searched between umin and usup. Tol and TolU are used to decide to stop the iterations according to the following condition: if n is the number of iterations, abs(Un-Un-1) < TolU and abs(F(Un)-F(Un-1)) < Tol.
") Extrema_EPCOfExtPC;
		 Extrema_EPCOfExtPC(const gp_Pnt & P, const Adaptor3d_Curve & C, const Standard_Integer NbU, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU, const Standard_Real TolF);

		/****** Extrema_EPCOfExtPC::Initialize ******/
		/****** md5 signature: b8e83a64d3c33c8a4e28f4682b235bbb ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
NbU: int
TolU: float
TolF: float

Return
-------
None

Description
-----------
sets the fields of the algorithm.
") Initialize;
		void Initialize(const Adaptor3d_Curve & C, const Standard_Integer NbU, const Standard_Real TolU, const Standard_Real TolF);

		/****** Extrema_EPCOfExtPC::Initialize ******/
		/****** md5 signature: bf3c9f855e71bda7dd32647a562411bf ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
NbU: int
Umin: float
Usup: float
TolU: float
TolF: float

Return
-------
None

Description
-----------
sets the fields of the algorithm.
") Initialize;
		void Initialize(const Adaptor3d_Curve & C, const Standard_Integer NbU, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU, const Standard_Real TolF);

		/****** Extrema_EPCOfExtPC::Initialize ******/
		/****** md5 signature: 96ecca85f670f0aff9194161a9bd5dc1 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
None

Description
-----------
sets the fields of the algorithm.
") Initialize;
		void Initialize(const Adaptor3d_Curve & C);

		/****** Extrema_EPCOfExtPC::Initialize ******/
		/****** md5 signature: bdcd99b58831999e0cacf879b57f7aca ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
NbU: int
Umin: float
Usup: float
TolU: float
TolF: float

Return
-------
None

Description
-----------
sets the fields of the algorithm.
") Initialize;
		void Initialize(const Standard_Integer NbU, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU, const Standard_Real TolF);

		/****** Extrema_EPCOfExtPC::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if the distances are found.
") IsDone;
		Standard_Boolean IsDone();

		/****** Extrema_EPCOfExtPC::IsMin ******/
		/****** md5 signature: d296cefb075e9db02ee60a375c81a9f6 ******/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Returns True if the Nth extremum distance is a minimum.
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****** Extrema_EPCOfExtPC::NbExt ******/
		/****** md5 signature: 84ada636e4651cacf916eb056265a1d9 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		Standard_Integer NbExt();

		/****** Extrema_EPCOfExtPC::Perform ******/
		/****** md5 signature: 5f5e57fd55ba2b5f8e2b2be09861a3f9 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
None

Description
-----------
the algorithm is done with the point P. An exception is raised if the fields have not been initialized.
") Perform;
		void Perform(const gp_Pnt & P);

		/****** Extrema_EPCOfExtPC::Point ******/
		/****** md5 signature: 1a3c4a6f09c4cb823314eefe5165e75c ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
Extrema_POnCurv

Description
-----------
Returns the point of the Nth extremum distance.
") Point;
		const Extrema_POnCurv & Point(const Standard_Integer N);

		/****** Extrema_EPCOfExtPC::SquareDistance ******/
		/****** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
float

Description
-----------
Returns the value of the Nth extremum square distance.
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

};


%extend Extrema_EPCOfExtPC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class Extrema_EPCOfExtPC2d *
*****************************/
class Extrema_EPCOfExtPC2d {
	public:
		/****** Extrema_EPCOfExtPC2d::Extrema_EPCOfExtPC2d ******/
		/****** md5 signature: dddcc49f98fdb65c7a826fe02135551c ******/
		%feature("compactdefaultargs") Extrema_EPCOfExtPC2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_EPCOfExtPC2d;
		 Extrema_EPCOfExtPC2d();

		/****** Extrema_EPCOfExtPC2d::Extrema_EPCOfExtPC2d ******/
		/****** md5 signature: e215bb58b06e418352ca7a41838988ff ******/
		%feature("compactdefaultargs") Extrema_EPCOfExtPC2d;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d
NbU: int
TolU: float
TolF: float

Return
-------
None

Description
-----------
It calculates all the distances. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searches all the zeros inside the definition range of the curve. NbU is used to locate the close points to find the zeros. Tol and TolU are used to decide to stop the iterations according to the following condition: if n is the number of iterations, abs(Un-Un-1) < TolU and abs(F(Un)-F(Un-1)) < Tol.
") Extrema_EPCOfExtPC2d;
		 Extrema_EPCOfExtPC2d(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C, const Standard_Integer NbU, const Standard_Real TolU, const Standard_Real TolF);

		/****** Extrema_EPCOfExtPC2d::Extrema_EPCOfExtPC2d ******/
		/****** md5 signature: 180127b2ebbcb30f4366bc818c7a8176 ******/
		%feature("compactdefaultargs") Extrema_EPCOfExtPC2d;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d
NbU: int
Umin: float
Usup: float
TolU: float
TolF: float

Return
-------
None

Description
-----------
It calculates all the distances. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searches all the zeros inside the definition range of the curve. NbU is used to locate the close points to find the zeros. Zeros are searched between umin and usup. Tol and TolU are used to decide to stop the iterations according to the following condition: if n is the number of iterations, abs(Un-Un-1) < TolU and abs(F(Un)-F(Un-1)) < Tol.
") Extrema_EPCOfExtPC2d;
		 Extrema_EPCOfExtPC2d(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C, const Standard_Integer NbU, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU, const Standard_Real TolF);

		/****** Extrema_EPCOfExtPC2d::Initialize ******/
		/****** md5 signature: 0c4d5ef0210a20d5cfdf67b6198c9095 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
NbU: int
TolU: float
TolF: float

Return
-------
None

Description
-----------
sets the fields of the algorithm.
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C, const Standard_Integer NbU, const Standard_Real TolU, const Standard_Real TolF);

		/****** Extrema_EPCOfExtPC2d::Initialize ******/
		/****** md5 signature: 9e172761979bca888575dc8cff8ac8a9 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
NbU: int
Umin: float
Usup: float
TolU: float
TolF: float

Return
-------
None

Description
-----------
sets the fields of the algorithm.
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C, const Standard_Integer NbU, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU, const Standard_Real TolF);

		/****** Extrema_EPCOfExtPC2d::Initialize ******/
		/****** md5 signature: 295b46cc3c15eb5116b8523fecaa122c ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
sets the fields of the algorithm.
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C);

		/****** Extrema_EPCOfExtPC2d::Initialize ******/
		/****** md5 signature: bdcd99b58831999e0cacf879b57f7aca ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
NbU: int
Umin: float
Usup: float
TolU: float
TolF: float

Return
-------
None

Description
-----------
sets the fields of the algorithm.
") Initialize;
		void Initialize(const Standard_Integer NbU, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU, const Standard_Real TolF);

		/****** Extrema_EPCOfExtPC2d::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if the distances are found.
") IsDone;
		Standard_Boolean IsDone();

		/****** Extrema_EPCOfExtPC2d::IsMin ******/
		/****** md5 signature: d296cefb075e9db02ee60a375c81a9f6 ******/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Returns True if the Nth extremum distance is a minimum.
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****** Extrema_EPCOfExtPC2d::NbExt ******/
		/****** md5 signature: 84ada636e4651cacf916eb056265a1d9 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		Standard_Integer NbExt();

		/****** Extrema_EPCOfExtPC2d::Perform ******/
		/****** md5 signature: 59fee48271d5ac79a6de2fe73317998c ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d

Return
-------
None

Description
-----------
the algorithm is done with the point P. An exception is raised if the fields have not been initialized.
") Perform;
		void Perform(const gp_Pnt2d & P);

		/****** Extrema_EPCOfExtPC2d::Point ******/
		/****** md5 signature: 6123812027804044a54749cfa19bef5e ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
Extrema_POnCurv2d

Description
-----------
Returns the point of the Nth extremum distance.
") Point;
		const Extrema_POnCurv2d & Point(const Standard_Integer N);

		/****** Extrema_EPCOfExtPC2d::SquareDistance ******/
		/****** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
float

Description
-----------
Returns the value of the Nth extremum square distance.
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

};


%extend Extrema_EPCOfExtPC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Extrema_ExtCC *
**********************/
class Extrema_ExtCC {
	public:
		/****** Extrema_ExtCC::Extrema_ExtCC ******/
		/****** md5 signature: 1964fd38df4cd129bca5df76f4e60ede ******/
		%feature("compactdefaultargs") Extrema_ExtCC;
		%feature("autodoc", "
Parameters
----------
TolC1: float (optional, default to 1.0e-10)
TolC2: float (optional, default to 1.0e-10)

Return
-------
None

Description
-----------
No available documentation.
") Extrema_ExtCC;
		 Extrema_ExtCC(const Standard_Real TolC1 = 1.0e-10, const Standard_Real TolC2 = 1.0e-10);

		/****** Extrema_ExtCC::Extrema_ExtCC ******/
		/****** md5 signature: d500180d0d13c2ef7c63d04c92f24379 ******/
		%feature("compactdefaultargs") Extrema_ExtCC;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor3d_Curve
C2: Adaptor3d_Curve
TolC1: float (optional, default to 1.0e-10)
TolC2: float (optional, default to 1.0e-10)

Return
-------
None

Description
-----------
It calculates all the distances.
") Extrema_ExtCC;
		 Extrema_ExtCC(const Adaptor3d_Curve & C1, const Adaptor3d_Curve & C2, const Standard_Real TolC1 = 1.0e-10, const Standard_Real TolC2 = 1.0e-10);

		/****** Extrema_ExtCC::Extrema_ExtCC ******/
		/****** md5 signature: 2d456c9708a30ed1803c42204eb75e6c ******/
		%feature("compactdefaultargs") Extrema_ExtCC;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor3d_Curve
C2: Adaptor3d_Curve
U1: float
U2: float
V1: float
V2: float
TolC1: float (optional, default to 1.0e-10)
TolC2: float (optional, default to 1.0e-10)

Return
-------
None

Description
-----------
It calculates all the distances.
") Extrema_ExtCC;
		 Extrema_ExtCC(const Adaptor3d_Curve & C1, const Adaptor3d_Curve & C2, const Standard_Real U1, const Standard_Real U2, const Standard_Real V1, const Standard_Real V2, const Standard_Real TolC1 = 1.0e-10, const Standard_Real TolC2 = 1.0e-10);

		/****** Extrema_ExtCC::GetSingleSolutionFlag ******/
		/****** md5 signature: b28121e257a0efb9e2c6c13cf0ce823d ******/
		%feature("compactdefaultargs") GetSingleSolutionFlag;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Get flag for single extrema computation. Works on parametric solver only.
") GetSingleSolutionFlag;
		Standard_Boolean GetSingleSolutionFlag();

		/****** Extrema_ExtCC::Initialize ******/
		/****** md5 signature: 33f5791b9afdaba1c00cac69bb0ae58a ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor3d_Curve
C2: Adaptor3d_Curve
TolC1: float (optional, default to 1.0e-10)
TolC2: float (optional, default to 1.0e-10)

Return
-------
None

Description
-----------
Initializes but does not perform algorithm.
") Initialize;
		void Initialize(const Adaptor3d_Curve & C1, const Adaptor3d_Curve & C2, const Standard_Real TolC1 = 1.0e-10, const Standard_Real TolC2 = 1.0e-10);

		/****** Extrema_ExtCC::Initialize ******/
		/****** md5 signature: 241a78b6a479e657dbee2350ce37c1ae ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor3d_Curve
C2: Adaptor3d_Curve
U1: float
U2: float
V1: float
V2: float
TolC1: float (optional, default to 1.0e-10)
TolC2: float (optional, default to 1.0e-10)

Return
-------
None

Description
-----------
Initializes but does not perform algorithm.
") Initialize;
		void Initialize(const Adaptor3d_Curve & C1, const Adaptor3d_Curve & C2, const Standard_Real U1, const Standard_Real U2, const Standard_Real V1, const Standard_Real V2, const Standard_Real TolC1 = 1.0e-10, const Standard_Real TolC2 = 1.0e-10);

		/****** Extrema_ExtCC::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distances are found.
") IsDone;
		Standard_Boolean IsDone();

		/****** Extrema_ExtCC::IsParallel ******/
		/****** md5 signature: 47a312fd58e74bf5bb8a9bb6f0484dfb ******/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the two curves are parallel.
") IsParallel;
		Standard_Boolean IsParallel();

		/****** Extrema_ExtCC::NbExt ******/
		/****** md5 signature: 84ada636e4651cacf916eb056265a1d9 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		Standard_Integer NbExt();

		/****** Extrema_ExtCC::Perform ******/
		/****** md5 signature: c04b01412cba7220c024b5eb4532697f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform();

		/****** Extrema_ExtCC::Points ******/
		/****** md5 signature: 3794ed44489c98c8247e475c96bba9a2 ******/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "
Parameters
----------
N: int
P1: Extrema_POnCurv
P2: Extrema_POnCurv

Return
-------
None

Description
-----------
Returns the points of the Nth extremum distance. P1 is on the first curve, P2 on the second one.
") Points;
		void Points(const Standard_Integer N, Extrema_POnCurv & P1, Extrema_POnCurv & P2);

		/****** Extrema_ExtCC::SetCurve ******/
		/****** md5 signature: c05f6a94f7b94d5e89625aaec42d5687 ******/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "
Parameters
----------
theRank: int
C: Adaptor3d_Curve

Return
-------
None

Description
-----------
No available documentation.
") SetCurve;
		void SetCurve(const Standard_Integer theRank, const Adaptor3d_Curve & C);

		/****** Extrema_ExtCC::SetCurve ******/
		/****** md5 signature: 025474c33b1e56b733db458edc65850f ******/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "
Parameters
----------
theRank: int
C: Adaptor3d_Curve
Uinf: float
Usup: float

Return
-------
None

Description
-----------
No available documentation.
") SetCurve;
		void SetCurve(const Standard_Integer theRank, const Adaptor3d_Curve & C, const Standard_Real Uinf, const Standard_Real Usup);

		/****** Extrema_ExtCC::SetRange ******/
		/****** md5 signature: eff4fdd36b8c8eb75e6bc0772ea6313e ******/
		%feature("compactdefaultargs") SetRange;
		%feature("autodoc", "
Parameters
----------
theRank: int
Uinf: float
Usup: float

Return
-------
None

Description
-----------
No available documentation.
") SetRange;
		void SetRange(const Standard_Integer theRank, const Standard_Real Uinf, const Standard_Real Usup);

		/****** Extrema_ExtCC::SetSingleSolutionFlag ******/
		/****** md5 signature: 7fa45b94e509fd90dd043f395439167b ******/
		%feature("compactdefaultargs") SetSingleSolutionFlag;
		%feature("autodoc", "
Parameters
----------
theSingleSolutionFlag: bool

Return
-------
None

Description
-----------
Set flag for single extrema computation. Works on parametric solver only.
") SetSingleSolutionFlag;
		void SetSingleSolutionFlag(const Standard_Boolean theSingleSolutionFlag);

		/****** Extrema_ExtCC::SetTolerance ******/
		/****** md5 signature: 16e60849a33c96f08af47a45ccdfb221 ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
theRank: int
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") SetTolerance;
		void SetTolerance(const Standard_Integer theRank, const Standard_Real Tol);

		/****** Extrema_ExtCC::SquareDistance ******/
		/****** md5 signature: badb2a0561651254031917071ad28398 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int (optional, default to 1)

Return
-------
float

Description
-----------
Returns the value of the Nth extremum square distance.
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N = 1);

		/****** Extrema_ExtCC::TrimmedSquareDistances ******/
		/****** md5 signature: 4e321915bc6b3619a20bb8a4fec39fce ******/
		%feature("compactdefaultargs") TrimmedSquareDistances;
		%feature("autodoc", "
Parameters
----------
P11: gp_Pnt
P12: gp_Pnt
P21: gp_Pnt
P22: gp_Pnt

Return
-------
dist11: float
distP12: float
distP21: float
distP22: float

Description
-----------
if the curve is a trimmed curve, dist11 is a square distance between the point on C1 of parameter FirstParameter and the point of parameter FirstParameter on C2.
") TrimmedSquareDistances;
		void TrimmedSquareDistances(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt & P11, gp_Pnt & P12, gp_Pnt & P21, gp_Pnt & P22);

};


%extend Extrema_ExtCC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Extrema_ExtCC2d *
************************/
class Extrema_ExtCC2d {
	public:
		/****** Extrema_ExtCC2d::Extrema_ExtCC2d ******/
		/****** md5 signature: d77841926d1a7c270feae47e00813b8e ******/
		%feature("compactdefaultargs") Extrema_ExtCC2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_ExtCC2d;
		 Extrema_ExtCC2d();

		/****** Extrema_ExtCC2d::Extrema_ExtCC2d ******/
		/****** md5 signature: 4e71d2eebdbd2103a21286923c8a1ce0 ******/
		%feature("compactdefaultargs") Extrema_ExtCC2d;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d
TolC1: float (optional, default to 1.0e-10)
TolC2: float (optional, default to 1.0e-10)

Return
-------
None

Description
-----------
It calculates all the distances.
") Extrema_ExtCC2d;
		 Extrema_ExtCC2d(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2, const Standard_Real TolC1 = 1.0e-10, const Standard_Real TolC2 = 1.0e-10);

		/****** Extrema_ExtCC2d::Extrema_ExtCC2d ******/
		/****** md5 signature: fab5475c248d3f36cda068af9882ca40 ******/
		%feature("compactdefaultargs") Extrema_ExtCC2d;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d
U1: float
U2: float
V1: float
V2: float
TolC1: float (optional, default to 1.0e-10)
TolC2: float (optional, default to 1.0e-10)

Return
-------
None

Description
-----------
It calculates all the distances.
") Extrema_ExtCC2d;
		 Extrema_ExtCC2d(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2, const Standard_Real U1, const Standard_Real U2, const Standard_Real V1, const Standard_Real V2, const Standard_Real TolC1 = 1.0e-10, const Standard_Real TolC2 = 1.0e-10);

		/****** Extrema_ExtCC2d::GetSingleSolutionFlag ******/
		/****** md5 signature: b28121e257a0efb9e2c6c13cf0ce823d ******/
		%feature("compactdefaultargs") GetSingleSolutionFlag;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Get flag for single extrema computation. Works on parametric solver only.
") GetSingleSolutionFlag;
		Standard_Boolean GetSingleSolutionFlag();

		/****** Extrema_ExtCC2d::Initialize ******/
		/****** md5 signature: 664b6d4f23d9ca50ceb303478cf4c8f1 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
C2: Adaptor2d_Curve2d
V1: float
V2: float
TolC1: float (optional, default to 1.0e-10)
TolC2: float (optional, default to 1.0e-10)

Return
-------
None

Description
-----------
initializes the fields.
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C2, const Standard_Real V1, const Standard_Real V2, const Standard_Real TolC1 = 1.0e-10, const Standard_Real TolC2 = 1.0e-10);

		/****** Extrema_ExtCC2d::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distances are found.
") IsDone;
		Standard_Boolean IsDone();

		/****** Extrema_ExtCC2d::IsParallel ******/
		/****** md5 signature: 47a312fd58e74bf5bb8a9bb6f0484dfb ******/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the two curves are parallel.
") IsParallel;
		Standard_Boolean IsParallel();

		/****** Extrema_ExtCC2d::NbExt ******/
		/****** md5 signature: 84ada636e4651cacf916eb056265a1d9 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		Standard_Integer NbExt();

		/****** Extrema_ExtCC2d::Perform ******/
		/****** md5 signature: 0b7a7e6da6760c9bc5a77ff28b7e53f6 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor2d_Curve2d
U1: float
U2: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const Adaptor2d_Curve2d & C1, const Standard_Real U1, const Standard_Real U2);

		/****** Extrema_ExtCC2d::Points ******/
		/****** md5 signature: b11c393bae576338fc3f288ecb955b49 ******/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "
Parameters
----------
N: int
P1: Extrema_POnCurv2d
P2: Extrema_POnCurv2d

Return
-------
None

Description
-----------
Returns the points of the Nth extremum distance. P1 is on the first curve, P2 on the second one.
") Points;
		void Points(const Standard_Integer N, Extrema_POnCurv2d & P1, Extrema_POnCurv2d & P2);

		/****** Extrema_ExtCC2d::SetSingleSolutionFlag ******/
		/****** md5 signature: 7fa45b94e509fd90dd043f395439167b ******/
		%feature("compactdefaultargs") SetSingleSolutionFlag;
		%feature("autodoc", "
Parameters
----------
theSingleSolutionFlag: bool

Return
-------
None

Description
-----------
Set flag for single extrema computation. Works on parametric solver only.
") SetSingleSolutionFlag;
		void SetSingleSolutionFlag(const Standard_Boolean theSingleSolutionFlag);

		/****** Extrema_ExtCC2d::SquareDistance ******/
		/****** md5 signature: badb2a0561651254031917071ad28398 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int (optional, default to 1)

Return
-------
float

Description
-----------
Returns the value of the Nth extremum square distance.
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N = 1);

		/****** Extrema_ExtCC2d::TrimmedSquareDistances ******/
		/****** md5 signature: 5589d6016051b0d97cdeddc5557c860c ******/
		%feature("compactdefaultargs") TrimmedSquareDistances;
		%feature("autodoc", "
Parameters
----------
P11: gp_Pnt2d
P12: gp_Pnt2d
P21: gp_Pnt2d
P22: gp_Pnt2d

Return
-------
dist11: float
distP12: float
distP21: float
distP22: float

Description
-----------
if the curve is a trimmed curve, dist11 is a square distance between the point on C1 of parameter FirstParameter and the point of parameter FirstParameter on C2.
") TrimmedSquareDistances;
		void TrimmedSquareDistances(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & P11, gp_Pnt2d & P12, gp_Pnt2d & P21, gp_Pnt2d & P22);

};


%extend Extrema_ExtCC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Extrema_ExtCS *
**********************/
class Extrema_ExtCS {
	public:
		/****** Extrema_ExtCS::Extrema_ExtCS ******/
		/****** md5 signature: 4e582899e4155536b1138ca532444328 ******/
		%feature("compactdefaultargs") Extrema_ExtCS;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_ExtCS;
		 Extrema_ExtCS();

		/****** Extrema_ExtCS::Extrema_ExtCS ******/
		/****** md5 signature: a6635ef61a6412c3a4509df4cbb3bf78 ******/
		%feature("compactdefaultargs") Extrema_ExtCS;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
S: Adaptor3d_Surface
TolC: float
TolS: float

Return
-------
None

Description
-----------
It calculates all the distances between C and S.
") Extrema_ExtCS;
		 Extrema_ExtCS(const Adaptor3d_Curve & C, const Adaptor3d_Surface & S, const Standard_Real TolC, const Standard_Real TolS);

		/****** Extrema_ExtCS::Extrema_ExtCS ******/
		/****** md5 signature: 725ca4cb75ba4708abac64dd5588fea5 ******/
		%feature("compactdefaultargs") Extrema_ExtCS;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
S: Adaptor3d_Surface
UCinf: float
UCsup: float
Uinf: float
Usup: float
Vinf: float
Vsup: float
TolC: float
TolS: float

Return
-------
None

Description
-----------
It calculates all the distances between C and S. UCinf and UCmax are the start and end parameters of the curve.
") Extrema_ExtCS;
		 Extrema_ExtCS(const Adaptor3d_Curve & C, const Adaptor3d_Surface & S, const Standard_Real UCinf, const Standard_Real UCsup, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real Vinf, const Standard_Real Vsup, const Standard_Real TolC, const Standard_Real TolS);

		/****** Extrema_ExtCS::Initialize ******/
		/****** md5 signature: e63b3f3f490bda228580d04568edb6b3 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
TolC: float
TolS: float

Return
-------
None

Description
-----------
Initializes the fields of the algorithm.
") Initialize;
		void Initialize(const Adaptor3d_Surface & S, const Standard_Real TolC, const Standard_Real TolS);

		/****** Extrema_ExtCS::Initialize ******/
		/****** md5 signature: 6ca083b40ba666c98208199a3aec58ff ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
Uinf: float
Usup: float
Vinf: float
Vsup: float
TolC: float
TolS: float

Return
-------
None

Description
-----------
Initializes the fields of the algorithm.
") Initialize;
		void Initialize(const Adaptor3d_Surface & S, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real Vinf, const Standard_Real Vsup, const Standard_Real TolC, const Standard_Real TolS);

		/****** Extrema_ExtCS::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distances are found.
") IsDone;
		Standard_Boolean IsDone();

		/****** Extrema_ExtCS::IsParallel ******/
		/****** md5 signature: 47a312fd58e74bf5bb8a9bb6f0484dfb ******/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the curve is on a parallel surface.
") IsParallel;
		Standard_Boolean IsParallel();

		/****** Extrema_ExtCS::NbExt ******/
		/****** md5 signature: 84ada636e4651cacf916eb056265a1d9 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		Standard_Integer NbExt();

		/****** Extrema_ExtCS::Perform ******/
		/****** md5 signature: 0b6b261d405d9a2236021036de30e89c ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
Uinf: float
Usup: float

Return
-------
None

Description
-----------
Computes the distances. An exception is raised if the fields have not been initialized.
") Perform;
		void Perform(const Adaptor3d_Curve & C, const Standard_Real Uinf, const Standard_Real Usup);

		/****** Extrema_ExtCS::Points ******/
		/****** md5 signature: df68325eb2f306b7c0800a3dab036048 ******/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "
Parameters
----------
N: int
P1: Extrema_POnCurv
P2: Extrema_POnSurf

Return
-------
None

Description
-----------
Returns the point of the Nth resulting distance.
") Points;
		void Points(const Standard_Integer N, Extrema_POnCurv & P1, Extrema_POnSurf & P2);

		/****** Extrema_ExtCS::SquareDistance ******/
		/****** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
float

Description
-----------
Returns the value of the Nth resulting square distance.
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

};


%extend Extrema_ExtCS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Extrema_ExtElC *
***********************/
class Extrema_ExtElC {
	public:
		/****** Extrema_ExtElC::Extrema_ExtElC ******/
		/****** md5 signature: 004e98e48c87086a0cef5207641c4089 ******/
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_ExtElC;
		 Extrema_ExtElC();

		/****** Extrema_ExtElC::Extrema_ExtElC ******/
		/****** md5 signature: 7b0656884d84c74368738eb61994ae0b ******/
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "
Parameters
----------
C1: gp_Lin
C2: gp_Lin
AngTol: float

Return
-------
None

Description
-----------
Calculates the distance between two lines. AngTol is used to test if the lines are parallel: Angle(C1,C2) < AngTol.
") Extrema_ExtElC;
		 Extrema_ExtElC(const gp_Lin & C1, const gp_Lin & C2, const Standard_Real AngTol);

		/****** Extrema_ExtElC::Extrema_ExtElC ******/
		/****** md5 signature: 828691bd07be929d1a0d331c962a5189 ******/
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "
Parameters
----------
C1: gp_Lin
C2: gp_Circ
Tol: float

Return
-------
None

Description
-----------
Calculates the distance between a line and a circle.
") Extrema_ExtElC;
		 Extrema_ExtElC(const gp_Lin & C1, const gp_Circ & C2, const Standard_Real Tol);

		/****** Extrema_ExtElC::Extrema_ExtElC ******/
		/****** md5 signature: 9fc2edc96231aa3d1ee6d30a8e95ad20 ******/
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "
Parameters
----------
C1: gp_Lin
C2: gp_Elips

Return
-------
None

Description
-----------
Calculates the distance between a line and an ellipse.
") Extrema_ExtElC;
		 Extrema_ExtElC(const gp_Lin & C1, const gp_Elips & C2);

		/****** Extrema_ExtElC::Extrema_ExtElC ******/
		/****** md5 signature: ad69aa1eba04b7eed28f66eb8e14cf0f ******/
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "
Parameters
----------
C1: gp_Lin
C2: gp_Hypr

Return
-------
None

Description
-----------
Calculates the distance between a line and a hyperbola.
") Extrema_ExtElC;
		 Extrema_ExtElC(const gp_Lin & C1, const gp_Hypr & C2);

		/****** Extrema_ExtElC::Extrema_ExtElC ******/
		/****** md5 signature: 433c188160d67b67d75fa4e3b92c0dee ******/
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "
Parameters
----------
C1: gp_Lin
C2: gp_Parab

Return
-------
None

Description
-----------
Calculates the distance between a line and a parabola.
") Extrema_ExtElC;
		 Extrema_ExtElC(const gp_Lin & C1, const gp_Parab & C2);

		/****** Extrema_ExtElC::Extrema_ExtElC ******/
		/****** md5 signature: efeb94b9af53fc947c0accf8cc40dcce ******/
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "
Parameters
----------
C1: gp_Circ
C2: gp_Circ

Return
-------
None

Description
-----------
Calculates the distance between two circles. The circles can be parallel or identical.
") Extrema_ExtElC;
		 Extrema_ExtElC(const gp_Circ & C1, const gp_Circ & C2);

		/****** Extrema_ExtElC::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distances are found.
") IsDone;
		Standard_Boolean IsDone();

		/****** Extrema_ExtElC::IsParallel ******/
		/****** md5 signature: 47a312fd58e74bf5bb8a9bb6f0484dfb ******/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the two curves are parallel.
") IsParallel;
		Standard_Boolean IsParallel();

		/****** Extrema_ExtElC::NbExt ******/
		/****** md5 signature: 84ada636e4651cacf916eb056265a1d9 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		Standard_Integer NbExt();

		/****** Extrema_ExtElC::Points ******/
		/****** md5 signature: 3794ed44489c98c8247e475c96bba9a2 ******/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "
Parameters
----------
N: int
P1: Extrema_POnCurv
P2: Extrema_POnCurv

Return
-------
None

Description
-----------
Returns the points of the Nth extremum distance. P1 is on the first curve, P2 on the second one.
") Points;
		void Points(const Standard_Integer N, Extrema_POnCurv & P1, Extrema_POnCurv & P2);

		/****** Extrema_ExtElC::SquareDistance ******/
		/****** md5 signature: badb2a0561651254031917071ad28398 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int (optional, default to 1)

Return
-------
float

Description
-----------
Returns the value of the Nth extremum square distance.
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N = 1);

};


%extend Extrema_ExtElC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Extrema_ExtElC2d *
*************************/
class Extrema_ExtElC2d {
	public:
		/****** Extrema_ExtElC2d::Extrema_ExtElC2d ******/
		/****** md5 signature: 3859a3a4c2fb128440cbad11da1747b4 ******/
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d();

		/****** Extrema_ExtElC2d::Extrema_ExtElC2d ******/
		/****** md5 signature: 6dc9aa92330273f445223bbea89fd053 ******/
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "
Parameters
----------
C1: gp_Lin2d
C2: gp_Lin2d
AngTol: float

Return
-------
None

Description
-----------
Calculates the distance between two lines. AngTol is used to test if the lines are parallel: Angle(C1,C2) < AngTol.
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d(const gp_Lin2d & C1, const gp_Lin2d & C2, const Standard_Real AngTol);

		/****** Extrema_ExtElC2d::Extrema_ExtElC2d ******/
		/****** md5 signature: 255dafcf3a543a8e720c60b740b1789e ******/
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "
Parameters
----------
C1: gp_Lin2d
C2: gp_Circ2d
Tol: float

Return
-------
None

Description
-----------
Calculates the distance between a line and a circle.
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d(const gp_Lin2d & C1, const gp_Circ2d & C2, const Standard_Real Tol);

		/****** Extrema_ExtElC2d::Extrema_ExtElC2d ******/
		/****** md5 signature: c5e7e832342f09b3e3f5af22bdc53d53 ******/
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "
Parameters
----------
C1: gp_Lin2d
C2: gp_Elips2d

Return
-------
None

Description
-----------
Calculates the distance between a line and an ellipse.
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d(const gp_Lin2d & C1, const gp_Elips2d & C2);

		/****** Extrema_ExtElC2d::Extrema_ExtElC2d ******/
		/****** md5 signature: 734dd6d1ec09452b28b71c4ba1fe48ef ******/
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "
Parameters
----------
C1: gp_Lin2d
C2: gp_Hypr2d

Return
-------
None

Description
-----------
Calculates the distance between a line and a hyperbola.
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d(const gp_Lin2d & C1, const gp_Hypr2d & C2);

		/****** Extrema_ExtElC2d::Extrema_ExtElC2d ******/
		/****** md5 signature: 5d76994c6ec8a2dbc6f33680f5976c43 ******/
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "
Parameters
----------
C1: gp_Lin2d
C2: gp_Parab2d

Return
-------
None

Description
-----------
Calculates the distance between a line and a parabola.
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d(const gp_Lin2d & C1, const gp_Parab2d & C2);

		/****** Extrema_ExtElC2d::Extrema_ExtElC2d ******/
		/****** md5 signature: dc63d7b4da8be491292987ddc30c1e8d ******/
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "
Parameters
----------
C1: gp_Circ2d
C2: gp_Circ2d

Return
-------
None

Description
-----------
Calculates the distance between two circles. The circles can be parallel or identical.
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d(const gp_Circ2d & C1, const gp_Circ2d & C2);

		/****** Extrema_ExtElC2d::Extrema_ExtElC2d ******/
		/****** md5 signature: 9dfec4428f361b16a6bad7c8b994c894 ******/
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "
Parameters
----------
C1: gp_Circ2d
C2: gp_Elips2d

Return
-------
None

Description
-----------
Calculates the distance between a circle and an ellipse.
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d(const gp_Circ2d & C1, const gp_Elips2d & C2);

		/****** Extrema_ExtElC2d::Extrema_ExtElC2d ******/
		/****** md5 signature: 5edbe9f00fc3b3dc62425701202dcab7 ******/
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "
Parameters
----------
C1: gp_Circ2d
C2: gp_Hypr2d

Return
-------
None

Description
-----------
Calculates the distance between a circle and a hyperbola.
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d(const gp_Circ2d & C1, const gp_Hypr2d & C2);

		/****** Extrema_ExtElC2d::Extrema_ExtElC2d ******/
		/****** md5 signature: 9da5fa8b4354a798c26fde12bca15f59 ******/
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "
Parameters
----------
C1: gp_Circ2d
C2: gp_Parab2d

Return
-------
None

Description
-----------
Calculates the distance between a circle and a parabola.
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d(const gp_Circ2d & C1, const gp_Parab2d & C2);

		/****** Extrema_ExtElC2d::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distances are found.
") IsDone;
		Standard_Boolean IsDone();

		/****** Extrema_ExtElC2d::IsParallel ******/
		/****** md5 signature: 47a312fd58e74bf5bb8a9bb6f0484dfb ******/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the two curves are parallel.
") IsParallel;
		Standard_Boolean IsParallel();

		/****** Extrema_ExtElC2d::NbExt ******/
		/****** md5 signature: 84ada636e4651cacf916eb056265a1d9 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		Standard_Integer NbExt();

		/****** Extrema_ExtElC2d::Points ******/
		/****** md5 signature: b11c393bae576338fc3f288ecb955b49 ******/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "
Parameters
----------
N: int
P1: Extrema_POnCurv2d
P2: Extrema_POnCurv2d

Return
-------
None

Description
-----------
Returns the points of the Nth extremum distance. P1 is on the first curve, P2 on the second one.
") Points;
		void Points(const Standard_Integer N, Extrema_POnCurv2d & P1, Extrema_POnCurv2d & P2);

		/****** Extrema_ExtElC2d::SquareDistance ******/
		/****** md5 signature: badb2a0561651254031917071ad28398 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int (optional, default to 1)

Return
-------
float

Description
-----------
Returns the value of the Nth extremum square distance.
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N = 1);

};


%extend Extrema_ExtElC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Extrema_ExtElCS *
************************/
class Extrema_ExtElCS {
	public:
		/****** Extrema_ExtElCS::Extrema_ExtElCS ******/
		/****** md5 signature: f972ab4716d5de863647c4d782d4f719 ******/
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_ExtElCS;
		 Extrema_ExtElCS();

		/****** Extrema_ExtElCS::Extrema_ExtElCS ******/
		/****** md5 signature: db7d0474d65f1c3ea06c597c9b1064b2 ******/
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
S: gp_Pln

Return
-------
None

Description
-----------
Calculates the distances between a line and a plane. The line can be on the plane or on a parallel plane.
") Extrema_ExtElCS;
		 Extrema_ExtElCS(const gp_Lin & C, const gp_Pln & S);

		/****** Extrema_ExtElCS::Extrema_ExtElCS ******/
		/****** md5 signature: c0d2bcdb0f53cdd2d27d7b05d87048fc ******/
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
S: gp_Cylinder

Return
-------
None

Description
-----------
Calculates the distances between a line and a cylinder.
") Extrema_ExtElCS;
		 Extrema_ExtElCS(const gp_Lin & C, const gp_Cylinder & S);

		/****** Extrema_ExtElCS::Extrema_ExtElCS ******/
		/****** md5 signature: 4a6eb2f64f823821ccb456c18b3730b5 ******/
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
S: gp_Cone

Return
-------
None

Description
-----------
Calculates the distances between a line and a cone.
") Extrema_ExtElCS;
		 Extrema_ExtElCS(const gp_Lin & C, const gp_Cone & S);

		/****** Extrema_ExtElCS::Extrema_ExtElCS ******/
		/****** md5 signature: 0bbd80f7ce8fd4b777392404e4748607 ******/
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
S: gp_Sphere

Return
-------
None

Description
-----------
Calculates the distances between a line and a sphere.
") Extrema_ExtElCS;
		 Extrema_ExtElCS(const gp_Lin & C, const gp_Sphere & S);

		/****** Extrema_ExtElCS::Extrema_ExtElCS ******/
		/****** md5 signature: 3d525b570639c11fefd86b2e7c84552e ******/
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
S: gp_Torus

Return
-------
None

Description
-----------
Calculates the distances between a line and a torus.
") Extrema_ExtElCS;
		 Extrema_ExtElCS(const gp_Lin & C, const gp_Torus & S);

		/****** Extrema_ExtElCS::Extrema_ExtElCS ******/
		/****** md5 signature: a0af8e62e1b3c35b9d74c2fe0aa8ec30 ******/
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ
S: gp_Pln

Return
-------
None

Description
-----------
Calculates the distances between a circle and a plane.
") Extrema_ExtElCS;
		 Extrema_ExtElCS(const gp_Circ & C, const gp_Pln & S);

		/****** Extrema_ExtElCS::Extrema_ExtElCS ******/
		/****** md5 signature: d51444d34658575972b8c800686ab9b6 ******/
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ
S: gp_Cylinder

Return
-------
None

Description
-----------
Calculates the distances between a circle and a cylinder.
") Extrema_ExtElCS;
		 Extrema_ExtElCS(const gp_Circ & C, const gp_Cylinder & S);

		/****** Extrema_ExtElCS::Extrema_ExtElCS ******/
		/****** md5 signature: 2f5894f6aa2bb5c5c44c71cdfb702b1f ******/
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ
S: gp_Cone

Return
-------
None

Description
-----------
Calculates the distances between a circle and a cone.
") Extrema_ExtElCS;
		 Extrema_ExtElCS(const gp_Circ & C, const gp_Cone & S);

		/****** Extrema_ExtElCS::Extrema_ExtElCS ******/
		/****** md5 signature: 67d7cc9a8eb544114fb772f2cd6645a1 ******/
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ
S: gp_Sphere

Return
-------
None

Description
-----------
Calculates the distances between a circle and a sphere.
") Extrema_ExtElCS;
		 Extrema_ExtElCS(const gp_Circ & C, const gp_Sphere & S);

		/****** Extrema_ExtElCS::Extrema_ExtElCS ******/
		/****** md5 signature: 65c35a71b119fb9a5fe14416416247de ******/
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ
S: gp_Torus

Return
-------
None

Description
-----------
Calculates the distances between a circle and a torus.
") Extrema_ExtElCS;
		 Extrema_ExtElCS(const gp_Circ & C, const gp_Torus & S);

		/****** Extrema_ExtElCS::Extrema_ExtElCS ******/
		/****** md5 signature: ea55755f1f248cc3e575d19fc850a68c ******/
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "
Parameters
----------
C: gp_Hypr
S: gp_Pln

Return
-------
None

Description
-----------
Calculates the distances between a hyperbola and a plane.
") Extrema_ExtElCS;
		 Extrema_ExtElCS(const gp_Hypr & C, const gp_Pln & S);

		/****** Extrema_ExtElCS::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distances are found.
") IsDone;
		Standard_Boolean IsDone();

		/****** Extrema_ExtElCS::IsParallel ******/
		/****** md5 signature: 47a312fd58e74bf5bb8a9bb6f0484dfb ******/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the curve is on a parallel surface.
") IsParallel;
		Standard_Boolean IsParallel();

		/****** Extrema_ExtElCS::NbExt ******/
		/****** md5 signature: 84ada636e4651cacf916eb056265a1d9 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		Standard_Integer NbExt();

		/****** Extrema_ExtElCS::Perform ******/
		/****** md5 signature: 53338ec9217fe501d1c94d408fbb526a ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
S: gp_Pln

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Lin & C, const gp_Pln & S);

		/****** Extrema_ExtElCS::Perform ******/
		/****** md5 signature: 3c9464740ac1157499031017e0cfbb64 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
S: gp_Cylinder

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Lin & C, const gp_Cylinder & S);

		/****** Extrema_ExtElCS::Perform ******/
		/****** md5 signature: 521a4ef5d866669e33b3ca356fd51e79 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
S: gp_Cone

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Lin & C, const gp_Cone & S);

		/****** Extrema_ExtElCS::Perform ******/
		/****** md5 signature: 69cd757c0bc859fb33a39049adc05fc0 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
S: gp_Sphere

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Lin & C, const gp_Sphere & S);

		/****** Extrema_ExtElCS::Perform ******/
		/****** md5 signature: d5c283eb996063c758bc4ea115ab544a ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
S: gp_Torus

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Lin & C, const gp_Torus & S);

		/****** Extrema_ExtElCS::Perform ******/
		/****** md5 signature: 66884cd7b5b0d6e6d66f8b6d99e4d8db ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ
S: gp_Pln

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Circ & C, const gp_Pln & S);

		/****** Extrema_ExtElCS::Perform ******/
		/****** md5 signature: 27ad618f21410a465523c3454a53b19a ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ
S: gp_Cylinder

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Circ & C, const gp_Cylinder & S);

		/****** Extrema_ExtElCS::Perform ******/
		/****** md5 signature: 5d0f7254160c3c0cb46a9b6f6abd5939 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ
S: gp_Cone

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Circ & C, const gp_Cone & S);

		/****** Extrema_ExtElCS::Perform ******/
		/****** md5 signature: b5bf6a02a309dc0ef23ec19efe9db94f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ
S: gp_Sphere

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Circ & C, const gp_Sphere & S);

		/****** Extrema_ExtElCS::Perform ******/
		/****** md5 signature: c261ca51addce2475acf5b4ca1e7a468 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ
S: gp_Torus

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Circ & C, const gp_Torus & S);

		/****** Extrema_ExtElCS::Perform ******/
		/****** md5 signature: 3c188f0396340861834945ca664cf796 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Hypr
S: gp_Pln

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Hypr & C, const gp_Pln & S);

		/****** Extrema_ExtElCS::Points ******/
		/****** md5 signature: df68325eb2f306b7c0800a3dab036048 ******/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "
Parameters
----------
N: int
P1: Extrema_POnCurv
P2: Extrema_POnSurf

Return
-------
None

Description
-----------
Returns the points of the Nth extremum distance. P1 is on the curve, P2 on the surface.
") Points;
		void Points(const Standard_Integer N, Extrema_POnCurv & P1, Extrema_POnSurf & P2);

		/****** Extrema_ExtElCS::SquareDistance ******/
		/****** md5 signature: badb2a0561651254031917071ad28398 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int (optional, default to 1)

Return
-------
float

Description
-----------
Returns the value of the Nth extremum square distance.
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N = 1);

};


%extend Extrema_ExtElCS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Extrema_ExtElSS *
************************/
class Extrema_ExtElSS {
	public:
		/****** Extrema_ExtElSS::Extrema_ExtElSS ******/
		/****** md5 signature: 8e0497b9837638576257bc0d167c4464 ******/
		%feature("compactdefaultargs") Extrema_ExtElSS;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_ExtElSS;
		 Extrema_ExtElSS();

		/****** Extrema_ExtElSS::Extrema_ExtElSS ******/
		/****** md5 signature: b925c2a494c3713b8f7e0a979e88dfaa ******/
		%feature("compactdefaultargs") Extrema_ExtElSS;
		%feature("autodoc", "
Parameters
----------
S1: gp_Pln
S2: gp_Pln

Return
-------
None

Description
-----------
Calculates the distances between 2 planes. These planes can be parallel.
") Extrema_ExtElSS;
		 Extrema_ExtElSS(const gp_Pln & S1, const gp_Pln & S2);

		/****** Extrema_ExtElSS::Extrema_ExtElSS ******/
		/****** md5 signature: d683aa7715cf5ab1b592487723c2c527 ******/
		%feature("compactdefaultargs") Extrema_ExtElSS;
		%feature("autodoc", "
Parameters
----------
S1: gp_Pln
S2: gp_Sphere

Return
-------
None

Description
-----------
Calculates the distances between a plane and a sphere.
") Extrema_ExtElSS;
		 Extrema_ExtElSS(const gp_Pln & S1, const gp_Sphere & S2);

		/****** Extrema_ExtElSS::Extrema_ExtElSS ******/
		/****** md5 signature: e4073adaaba080c0db7787020eb2e790 ******/
		%feature("compactdefaultargs") Extrema_ExtElSS;
		%feature("autodoc", "
Parameters
----------
S1: gp_Sphere
S2: gp_Sphere

Return
-------
None

Description
-----------
Calculates the distances between 2 spheres. These spheres can be parallel.
") Extrema_ExtElSS;
		 Extrema_ExtElSS(const gp_Sphere & S1, const gp_Sphere & S2);

		/****** Extrema_ExtElSS::Extrema_ExtElSS ******/
		/****** md5 signature: b2af663e183526c2799b073df395497f ******/
		%feature("compactdefaultargs") Extrema_ExtElSS;
		%feature("autodoc", "
Parameters
----------
S1: gp_Sphere
S2: gp_Cylinder

Return
-------
None

Description
-----------
Calculates the distances between a sphere and a cylinder.
") Extrema_ExtElSS;
		 Extrema_ExtElSS(const gp_Sphere & S1, const gp_Cylinder & S2);

		/****** Extrema_ExtElSS::Extrema_ExtElSS ******/
		/****** md5 signature: 47f34cd25801d4da4c0b2b113413a994 ******/
		%feature("compactdefaultargs") Extrema_ExtElSS;
		%feature("autodoc", "
Parameters
----------
S1: gp_Sphere
S2: gp_Cone

Return
-------
None

Description
-----------
Calculates the distances between a sphere and a cone.
") Extrema_ExtElSS;
		 Extrema_ExtElSS(const gp_Sphere & S1, const gp_Cone & S2);

		/****** Extrema_ExtElSS::Extrema_ExtElSS ******/
		/****** md5 signature: 297d959d30c1c20de7718eb3081a702f ******/
		%feature("compactdefaultargs") Extrema_ExtElSS;
		%feature("autodoc", "
Parameters
----------
S1: gp_Sphere
S2: gp_Torus

Return
-------
None

Description
-----------
Calculates the distances between a sphere and a torus.
") Extrema_ExtElSS;
		 Extrema_ExtElSS(const gp_Sphere & S1, const gp_Torus & S2);

		/****** Extrema_ExtElSS::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distances are found.
") IsDone;
		Standard_Boolean IsDone();

		/****** Extrema_ExtElSS::IsParallel ******/
		/****** md5 signature: 47a312fd58e74bf5bb8a9bb6f0484dfb ******/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the two surfaces are parallel.
") IsParallel;
		Standard_Boolean IsParallel();

		/****** Extrema_ExtElSS::NbExt ******/
		/****** md5 signature: 84ada636e4651cacf916eb056265a1d9 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		Standard_Integer NbExt();

		/****** Extrema_ExtElSS::Perform ******/
		/****** md5 signature: ce57f9a43effeb78e12cb61797bc6543 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S1: gp_Pln
S2: gp_Pln

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Pln & S1, const gp_Pln & S2);

		/****** Extrema_ExtElSS::Perform ******/
		/****** md5 signature: 76cf61b7e9ca82144308666f7f41665c ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S1: gp_Pln
S2: gp_Sphere

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Pln & S1, const gp_Sphere & S2);

		/****** Extrema_ExtElSS::Perform ******/
		/****** md5 signature: 1c6acec214ff9b00343214969dc126aa ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S1: gp_Sphere
S2: gp_Sphere

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Sphere & S1, const gp_Sphere & S2);

		/****** Extrema_ExtElSS::Perform ******/
		/****** md5 signature: 8f8ce841d48bba33b76369ea3172be0a ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S1: gp_Sphere
S2: gp_Cylinder

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Sphere & S1, const gp_Cylinder & S2);

		/****** Extrema_ExtElSS::Perform ******/
		/****** md5 signature: 5ed2cdeb590464eda15e6c060f138d87 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S1: gp_Sphere
S2: gp_Cone

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Sphere & S1, const gp_Cone & S2);

		/****** Extrema_ExtElSS::Perform ******/
		/****** md5 signature: 18f99d4382bb3381950649a5e72e1bd3 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S1: gp_Sphere
S2: gp_Torus

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Sphere & S1, const gp_Torus & S2);

		/****** Extrema_ExtElSS::Points ******/
		/****** md5 signature: 3c61a440dae3b36da20a5cbbb58f55ce ******/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "
Parameters
----------
N: int
P1: Extrema_POnSurf
P2: Extrema_POnSurf

Return
-------
None

Description
-----------
Returns the points for the Nth resulting distance. P1 is on the first surface, P2 on the second one.
") Points;
		void Points(const Standard_Integer N, Extrema_POnSurf & P1, Extrema_POnSurf & P2);

		/****** Extrema_ExtElSS::SquareDistance ******/
		/****** md5 signature: badb2a0561651254031917071ad28398 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int (optional, default to 1)

Return
-------
float

Description
-----------
Returns the value of the Nth extremum square distance.
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N = 1);

};


%extend Extrema_ExtElSS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Extrema_ExtPC *
**********************/
class Extrema_ExtPC {
	public:
		/****** Extrema_ExtPC::Extrema_ExtPC ******/
		/****** md5 signature: be55a3dbd5dd51eefcef6fa83c40e5e0 ******/
		%feature("compactdefaultargs") Extrema_ExtPC;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_ExtPC;
		 Extrema_ExtPC();

		/****** Extrema_ExtPC::Extrema_ExtPC ******/
		/****** md5 signature: 80236a796df22a03cb53e858bdaf4dfe ******/
		%feature("compactdefaultargs") Extrema_ExtPC;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
C: Adaptor3d_Curve
Uinf: float
Usup: float
TolF: float (optional, default to 1.0e-10)

Return
-------
None

Description
-----------
It calculates all the distances. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searches all the zeros inside the definition range of the curve. Zeros are searched between uinf and usup. Tol is used to decide to stop the iterations according to the following condition: if n is the number of iterations, the algorithm stops when abs(F(Un)-F(Un-1)) < Tol.
") Extrema_ExtPC;
		 Extrema_ExtPC(const gp_Pnt & P, const Adaptor3d_Curve & C, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real TolF = 1.0e-10);

		/****** Extrema_ExtPC::Extrema_ExtPC ******/
		/****** md5 signature: 67d047a0517c372399b96860078635d6 ******/
		%feature("compactdefaultargs") Extrema_ExtPC;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
C: Adaptor3d_Curve
TolF: float (optional, default to 1.0e-10)

Return
-------
None

Description
-----------
It calculates all the distances. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searches all the zeros inside the definition range of the curve. Tol is used to decide to stop the iterations according to the following condition: if n is the number of iterations, the algorithm stops when abs(F(Un)-F(Un-1)) < Tol.
") Extrema_ExtPC;
		 Extrema_ExtPC(const gp_Pnt & P, const Adaptor3d_Curve & C, const Standard_Real TolF = 1.0e-10);

		/****** Extrema_ExtPC::Initialize ******/
		/****** md5 signature: 6ac5bc3f72e0a8236c8f51c23167f9f5 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
Uinf: float
Usup: float
TolF: float (optional, default to 1.0e-10)

Return
-------
None

Description
-----------
initializes the fields of the algorithm.
") Initialize;
		void Initialize(const Adaptor3d_Curve & C, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real TolF = 1.0e-10);

		/****** Extrema_ExtPC::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if the distances are found.
") IsDone;
		Standard_Boolean IsDone();

		/****** Extrema_ExtPC::IsMin ******/
		/****** md5 signature: d296cefb075e9db02ee60a375c81a9f6 ******/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Returns True if the <N>th extremum distance is a minimum.
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****** Extrema_ExtPC::NbExt ******/
		/****** md5 signature: 84ada636e4651cacf916eb056265a1d9 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		Standard_Integer NbExt();

		/****** Extrema_ExtPC::Perform ******/
		/****** md5 signature: 5f5e57fd55ba2b5f8e2b2be09861a3f9 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
None

Description
-----------
An exception is raised if the fields have not been initialized.
") Perform;
		void Perform(const gp_Pnt & P);

		/****** Extrema_ExtPC::Point ******/
		/****** md5 signature: 1a3c4a6f09c4cb823314eefe5165e75c ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
Extrema_POnCurv

Description
-----------
Returns the point of the <N>th extremum distance.
") Point;
		const Extrema_POnCurv & Point(const Standard_Integer N);

		/****** Extrema_ExtPC::SquareDistance ******/
		/****** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
float

Description
-----------
Returns the value of the <N>th extremum square distance.
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****** Extrema_ExtPC::TrimmedSquareDistances ******/
		/****** md5 signature: 2e689901655c68a486db722f362ab27b ******/
		%feature("compactdefaultargs") TrimmedSquareDistances;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Return
-------
dist1: float
dist2: float

Description
-----------
if the curve is a trimmed curve, dist1 is a square distance between <P> and the point of parameter FirstParameter <P1> and dist2 is a square distance between <P> and the point of parameter LastParameter <P2>.
") TrimmedSquareDistances;
		void TrimmedSquareDistances(Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt & P1, gp_Pnt & P2);

};


%extend Extrema_ExtPC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Extrema_ExtPC2d *
************************/
class Extrema_ExtPC2d {
	public:
		/****** Extrema_ExtPC2d::Extrema_ExtPC2d ******/
		/****** md5 signature: 3ab8144e6c9a0668da028f2c4f7999da ******/
		%feature("compactdefaultargs") Extrema_ExtPC2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_ExtPC2d;
		 Extrema_ExtPC2d();

		/****** Extrema_ExtPC2d::Extrema_ExtPC2d ******/
		/****** md5 signature: 85453b0ec67e15ba150de917544e3938 ******/
		%feature("compactdefaultargs") Extrema_ExtPC2d;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d
Uinf: float
Usup: float
TolF: float (optional, default to 1.0e-10)

Return
-------
None

Description
-----------
It calculates all the distances. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searches all the zeros inside the definition range of the curve. Zeros are searched between uinf and usup. Tol is used to decide to stop the iterations according to the following condition: if n is the number of iterations, the algorithm stops when abs(F(Un)-F(Un-1)) < Tol.
") Extrema_ExtPC2d;
		 Extrema_ExtPC2d(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real TolF = 1.0e-10);

		/****** Extrema_ExtPC2d::Extrema_ExtPC2d ******/
		/****** md5 signature: b53ba77823cd004a73e74f43a6e53d26 ******/
		%feature("compactdefaultargs") Extrema_ExtPC2d;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d
TolF: float (optional, default to 1.0e-10)

Return
-------
None

Description
-----------
It calculates all the distances. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searches all the zeros inside the definition range of the curve. Tol is used to decide to stop the iterations according to the following condition: if n is the number of iterations, the algorithm stops when abs(F(Un)-F(Un-1)) < Tol.
") Extrema_ExtPC2d;
		 Extrema_ExtPC2d(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C, const Standard_Real TolF = 1.0e-10);

		/****** Extrema_ExtPC2d::Initialize ******/
		/****** md5 signature: be89f8d1b5b5ecf504acd30e1f24f787 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
Uinf: float
Usup: float
TolF: float (optional, default to 1.0e-10)

Return
-------
None

Description
-----------
initializes the fields of the algorithm.
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real TolF = 1.0e-10);

		/****** Extrema_ExtPC2d::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if the distances are found.
") IsDone;
		Standard_Boolean IsDone();

		/****** Extrema_ExtPC2d::IsMin ******/
		/****** md5 signature: d296cefb075e9db02ee60a375c81a9f6 ******/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Returns True if the <N>th extremum distance is a minimum.
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****** Extrema_ExtPC2d::NbExt ******/
		/****** md5 signature: 84ada636e4651cacf916eb056265a1d9 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		Standard_Integer NbExt();

		/****** Extrema_ExtPC2d::Perform ******/
		/****** md5 signature: 59fee48271d5ac79a6de2fe73317998c ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d

Return
-------
None

Description
-----------
An exception is raised if the fields have not been initialized.
") Perform;
		void Perform(const gp_Pnt2d & P);

		/****** Extrema_ExtPC2d::Point ******/
		/****** md5 signature: 6123812027804044a54749cfa19bef5e ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
Extrema_POnCurv2d

Description
-----------
Returns the point of the <N>th extremum distance.
") Point;
		const Extrema_POnCurv2d & Point(const Standard_Integer N);

		/****** Extrema_ExtPC2d::SquareDistance ******/
		/****** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
float

Description
-----------
Returns the value of the <N>th extremum square distance.
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****** Extrema_ExtPC2d::TrimmedSquareDistances ******/
		/****** md5 signature: d92e1ba45ead5acc8c7f33976cfdf6e6 ******/
		%feature("compactdefaultargs") TrimmedSquareDistances;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d

Return
-------
dist1: float
dist2: float

Description
-----------
if the curve is a trimmed curve, dist1 is a square distance between <P> and the point of parameter FirstParameter <P1> and dist2 is a square distance between <P> and the point of parameter LastParameter <P2>.
") TrimmedSquareDistances;
		void TrimmedSquareDistances(Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & P1, gp_Pnt2d & P2);

};


%extend Extrema_ExtPC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Extrema_ExtPElC *
************************/
class Extrema_ExtPElC {
	public:
		/****** Extrema_ExtPElC::Extrema_ExtPElC ******/
		/****** md5 signature: aa316f8b6ce8c27e119c835cba4d43bb ******/
		%feature("compactdefaultargs") Extrema_ExtPElC;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_ExtPElC;
		 Extrema_ExtPElC();

		/****** Extrema_ExtPElC::Extrema_ExtPElC ******/
		/****** md5 signature: 93bc73b76ab3778c58d80e8bf7e3bb4d ******/
		%feature("compactdefaultargs") Extrema_ExtPElC;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
C: gp_Lin
Tol: float
Uinf: float
Usup: float

Return
-------
None

Description
-----------
Calculates the extremum distance between the point P and the segment [Uinf,Usup] of the line C.
") Extrema_ExtPElC;
		 Extrema_ExtPElC(const gp_Pnt & P, const gp_Lin & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****** Extrema_ExtPElC::Extrema_ExtPElC ******/
		/****** md5 signature: 2421c1c1ea2d67e9e0c93039dc777852 ******/
		%feature("compactdefaultargs") Extrema_ExtPElC;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
C: gp_Circ
Tol: float
Uinf: float
Usup: float

Return
-------
None

Description
-----------
Calculates the 2 extremum distances between the point P and the segment [Uinf,Usup] of the circle C. Tol is used to determine if P is on the axis of the circle or if an extremum is on an endpoint of the segment. If P is on the axis of the circle, there are infinite solution then IsDone(me)=False. The conditions on the Uinf and Usup are: 0. <= Uinf <= 2.*PI and Usup > Uinf. If Usup > Uinf + 2.*PI, then only the solutions in the range [Uinf,Uinf+2.*PI[ are computed.
") Extrema_ExtPElC;
		 Extrema_ExtPElC(const gp_Pnt & P, const gp_Circ & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****** Extrema_ExtPElC::Extrema_ExtPElC ******/
		/****** md5 signature: 8aea1ee5525a05788869a67c6ce46ea8 ******/
		%feature("compactdefaultargs") Extrema_ExtPElC;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
C: gp_Elips
Tol: float
Uinf: float
Usup: float

Return
-------
None

Description
-----------
Calculates the 4 extremum distances between the point P and the segment [Uinf,Usup] of the ellipse C. Tol is used to determine if the point is on the axis of the ellipse and if the major radius is equal to the minor radius or if an extremum is on an endpoint of the segment. If P is on the axis of the ellipse, there are infinite solution then IsDone(me)=False. The conditions on the Uinf and Usup are: 0. <= Uinf <= 2.*PI and Usup > Uinf. If Usup > Uinf + 2.*PI, then only the solutions in the range [Uinf,Uinf+2.*PI[ are computed.
") Extrema_ExtPElC;
		 Extrema_ExtPElC(const gp_Pnt & P, const gp_Elips & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****** Extrema_ExtPElC::Extrema_ExtPElC ******/
		/****** md5 signature: a386b6b8b1b6010c6b9571009e5702e8 ******/
		%feature("compactdefaultargs") Extrema_ExtPElC;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
C: gp_Hypr
Tol: float
Uinf: float
Usup: float

Return
-------
None

Description
-----------
Calculates the extremum distances between the point P and the segment [Uinf,Usup] of the hyperbola C. Tol is used to determine if two solutions u and v are identical; the condition is: dist(C(u),C(v)) < Tol.
") Extrema_ExtPElC;
		 Extrema_ExtPElC(const gp_Pnt & P, const gp_Hypr & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****** Extrema_ExtPElC::Extrema_ExtPElC ******/
		/****** md5 signature: 80a4885fd6b9adb857b740213d44758f ******/
		%feature("compactdefaultargs") Extrema_ExtPElC;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
C: gp_Parab
Tol: float
Uinf: float
Usup: float

Return
-------
None

Description
-----------
Calculates the 4 extremum distances between the point P and the segment [Uinf,Usup] of the parabola C. Tol is used to determine if two solutions u and v are identical; the condition is: dist(C(u),C(v)) < Tol.
") Extrema_ExtPElC;
		 Extrema_ExtPElC(const gp_Pnt & P, const gp_Parab & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****** Extrema_ExtPElC::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if the distances are found.
") IsDone;
		Standard_Boolean IsDone();

		/****** Extrema_ExtPElC::IsMin ******/
		/****** md5 signature: d296cefb075e9db02ee60a375c81a9f6 ******/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Returns True if the Nth extremum distance is a minimum.
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****** Extrema_ExtPElC::NbExt ******/
		/****** md5 signature: 84ada636e4651cacf916eb056265a1d9 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		Standard_Integer NbExt();

		/****** Extrema_ExtPElC::Perform ******/
		/****** md5 signature: 387f74370367df916d66e4969cf83798 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
C: gp_Lin
Tol: float
Uinf: float
Usup: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Pnt & P, const gp_Lin & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****** Extrema_ExtPElC::Perform ******/
		/****** md5 signature: 1bae431d03488d75ec67609e8ae39f71 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
C: gp_Circ
Tol: float
Uinf: float
Usup: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Pnt & P, const gp_Circ & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****** Extrema_ExtPElC::Perform ******/
		/****** md5 signature: dfda9ecf65388aa537f7eb877313d1b5 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
C: gp_Elips
Tol: float
Uinf: float
Usup: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Pnt & P, const gp_Elips & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****** Extrema_ExtPElC::Perform ******/
		/****** md5 signature: a1c7b2e90f211be41b1d0d58f47469f9 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
C: gp_Hypr
Tol: float
Uinf: float
Usup: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Pnt & P, const gp_Hypr & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****** Extrema_ExtPElC::Perform ******/
		/****** md5 signature: dd4bc329117483ae226cb12423526181 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
C: gp_Parab
Tol: float
Uinf: float
Usup: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Pnt & P, const gp_Parab & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****** Extrema_ExtPElC::Point ******/
		/****** md5 signature: 1a3c4a6f09c4cb823314eefe5165e75c ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
Extrema_POnCurv

Description
-----------
Returns the point of the Nth extremum distance.
") Point;
		const Extrema_POnCurv & Point(const Standard_Integer N);

		/****** Extrema_ExtPElC::SquareDistance ******/
		/****** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
float

Description
-----------
Returns the value of the Nth extremum square distance.
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

};


%extend Extrema_ExtPElC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Extrema_ExtPElC2d *
**************************/
class Extrema_ExtPElC2d {
	public:
		/****** Extrema_ExtPElC2d::Extrema_ExtPElC2d ******/
		/****** md5 signature: 917f2d7035567fb4d5e2a70c1b9e20ce ******/
		%feature("compactdefaultargs") Extrema_ExtPElC2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_ExtPElC2d;
		 Extrema_ExtPElC2d();

		/****** Extrema_ExtPElC2d::Extrema_ExtPElC2d ******/
		/****** md5 signature: b161287eb698efa6064f94bbbbffaf58 ******/
		%feature("compactdefaultargs") Extrema_ExtPElC2d;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
C: gp_Lin2d
Tol: float
Uinf: float
Usup: float

Return
-------
None

Description
-----------
Calculates the extremum distance between the point P and the segment [Uinf,Usup] of the line L.
") Extrema_ExtPElC2d;
		 Extrema_ExtPElC2d(const gp_Pnt2d & P, const gp_Lin2d & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****** Extrema_ExtPElC2d::Extrema_ExtPElC2d ******/
		/****** md5 signature: 9dacd9abcd93cdfe7255d6d7fba7b46f ******/
		%feature("compactdefaultargs") Extrema_ExtPElC2d;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
C: gp_Circ2d
Tol: float
Uinf: float
Usup: float

Return
-------
None

Description
-----------
Calculates the 2 extremum distances between the point P and the segment [Uinf,Usup] of the circle C. Tol is used to determine if P is on the axis of the circle or if an extremum is on an endpoint of the segment. If P is on the axis of the circle, there are infinite solution then IsDone(me)=False. The conditions on the Uinf and Usup are: 0. <= Uinf <= 2.*PI and Usup > Uinf. If Usup > Uinf + 2.*PI, then only the solutions in the range [Uinf,Uinf+2.*PI[ are computed.
") Extrema_ExtPElC2d;
		 Extrema_ExtPElC2d(const gp_Pnt2d & P, const gp_Circ2d & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****** Extrema_ExtPElC2d::Extrema_ExtPElC2d ******/
		/****** md5 signature: 70b2bf1822d25a12a548d783db318ceb ******/
		%feature("compactdefaultargs") Extrema_ExtPElC2d;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
C: gp_Elips2d
Tol: float
Uinf: float
Usup: float

Return
-------
None

Description
-----------
Calculates the 4 extremum distances between the point P and the segment [Uinf,Usup] of the ellipse C. Tol is used to determine if the point is on the axis of the ellipse and if the major radius is equal to the minor radius or if an extremum is on an endpoint of the segment. If P is on the axis of the ellipse, there are infinite solution then IsDone(me)=False. The conditions on the Uinf and Usup are: 0. <= Uinf <= 2.*PI and Usup > Uinf. If Usup > Uinf + 2.*PI, then only the solutions in the range [Uinf,Uinf+2.*PI[ are computed.
") Extrema_ExtPElC2d;
		 Extrema_ExtPElC2d(const gp_Pnt2d & P, const gp_Elips2d & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****** Extrema_ExtPElC2d::Extrema_ExtPElC2d ******/
		/****** md5 signature: 29b968a8e96e7126b4e4e7831638c99d ******/
		%feature("compactdefaultargs") Extrema_ExtPElC2d;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
C: gp_Hypr2d
Tol: float
Uinf: float
Usup: float

Return
-------
None

Description
-----------
Calculates the extremum distances between the point P and the segment [Uinf,Usup] of the hyperbola C. Tol is used to determine if two solutions u and v are identical; the condition is: dist(C(u),C(v)) < Tol.
") Extrema_ExtPElC2d;
		 Extrema_ExtPElC2d(const gp_Pnt2d & P, const gp_Hypr2d & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****** Extrema_ExtPElC2d::Extrema_ExtPElC2d ******/
		/****** md5 signature: 49b554ea2281bad6ee09f11e7c3a2eb8 ******/
		%feature("compactdefaultargs") Extrema_ExtPElC2d;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
C: gp_Parab2d
Tol: float
Uinf: float
Usup: float

Return
-------
None

Description
-----------
Calculates the 4 extremum distances between the point P and the segment [Uinf,Usup] of the parabola C. Tol is used to determine if two solutions u and v are identical; the condition is: dist(C(u),C(v)) < Tol.
") Extrema_ExtPElC2d;
		 Extrema_ExtPElC2d(const gp_Pnt2d & P, const gp_Parab2d & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****** Extrema_ExtPElC2d::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if the distances are found.
") IsDone;
		Standard_Boolean IsDone();

		/****** Extrema_ExtPElC2d::IsMin ******/
		/****** md5 signature: d296cefb075e9db02ee60a375c81a9f6 ******/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Returns True if the Nth extremum distance is a minimum.
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****** Extrema_ExtPElC2d::NbExt ******/
		/****** md5 signature: 84ada636e4651cacf916eb056265a1d9 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		Standard_Integer NbExt();

		/****** Extrema_ExtPElC2d::Perform ******/
		/****** md5 signature: 15068655d1fb63103f9947c13bc48e19 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
L: gp_Lin2d
Tol: float
Uinf: float
Usup: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Pnt2d & P, const gp_Lin2d & L, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****** Extrema_ExtPElC2d::Perform ******/
		/****** md5 signature: b057d13e3535354f66df5aeca35ddf75 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
C: gp_Circ2d
Tol: float
Uinf: float
Usup: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Pnt2d & P, const gp_Circ2d & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****** Extrema_ExtPElC2d::Perform ******/
		/****** md5 signature: 4ae408c4333b201bce092809c1e3a45f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
C: gp_Elips2d
Tol: float
Uinf: float
Usup: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Pnt2d & P, const gp_Elips2d & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****** Extrema_ExtPElC2d::Perform ******/
		/****** md5 signature: a41602c05f889da301cf87d99625406b ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
C: gp_Hypr2d
Tol: float
Uinf: float
Usup: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Pnt2d & P, const gp_Hypr2d & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****** Extrema_ExtPElC2d::Perform ******/
		/****** md5 signature: 5fd3d554a665d045f61c850b29da2283 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
C: gp_Parab2d
Tol: float
Uinf: float
Usup: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Pnt2d & P, const gp_Parab2d & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****** Extrema_ExtPElC2d::Point ******/
		/****** md5 signature: 6123812027804044a54749cfa19bef5e ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
Extrema_POnCurv2d

Description
-----------
Returns the point of the Nth extremum distance.
") Point;
		const Extrema_POnCurv2d & Point(const Standard_Integer N);

		/****** Extrema_ExtPElC2d::SquareDistance ******/
		/****** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
float

Description
-----------
Returns the value of the Nth extremum square distance.
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

};


%extend Extrema_ExtPElC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Extrema_ExtPElS *
************************/
class Extrema_ExtPElS {
	public:
		/****** Extrema_ExtPElS::Extrema_ExtPElS ******/
		/****** md5 signature: 26281c034aa20ce7723ae98262f1a76b ******/
		%feature("compactdefaultargs") Extrema_ExtPElS;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_ExtPElS;
		 Extrema_ExtPElS();

		/****** Extrema_ExtPElS::Extrema_ExtPElS ******/
		/****** md5 signature: b7873961e78f0878b711346c01e324e2 ******/
		%feature("compactdefaultargs") Extrema_ExtPElS;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
S: gp_Cylinder
Tol: float

Return
-------
None

Description
-----------
It calculates all the distances between a point and a cylinder from gp. Tol is used to test if the point is on the axis.
") Extrema_ExtPElS;
		 Extrema_ExtPElS(const gp_Pnt & P, const gp_Cylinder & S, const Standard_Real Tol);

		/****** Extrema_ExtPElS::Extrema_ExtPElS ******/
		/****** md5 signature: 7897974da8ba1a7a95e93262691e4525 ******/
		%feature("compactdefaultargs") Extrema_ExtPElS;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
S: gp_Pln
Tol: float

Return
-------
None

Description
-----------
It calculates all the distances between a point and a plane from gp. Tol is used to test if the point is on the plane.
") Extrema_ExtPElS;
		 Extrema_ExtPElS(const gp_Pnt & P, const gp_Pln & S, const Standard_Real Tol);

		/****** Extrema_ExtPElS::Extrema_ExtPElS ******/
		/****** md5 signature: 5d42604390c64ff068b315ae4c9277e8 ******/
		%feature("compactdefaultargs") Extrema_ExtPElS;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
S: gp_Cone
Tol: float

Return
-------
None

Description
-----------
It calculates all the distances between a point and a cone from gp. Tol is used to test if the point is at the apex or on the axis.
") Extrema_ExtPElS;
		 Extrema_ExtPElS(const gp_Pnt & P, const gp_Cone & S, const Standard_Real Tol);

		/****** Extrema_ExtPElS::Extrema_ExtPElS ******/
		/****** md5 signature: df9ed72ba021462671b3017fac129dbf ******/
		%feature("compactdefaultargs") Extrema_ExtPElS;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
S: gp_Torus
Tol: float

Return
-------
None

Description
-----------
It calculates all the distances between a point and a torus from gp. Tol is used to test if the point is on the axis.
") Extrema_ExtPElS;
		 Extrema_ExtPElS(const gp_Pnt & P, const gp_Torus & S, const Standard_Real Tol);

		/****** Extrema_ExtPElS::Extrema_ExtPElS ******/
		/****** md5 signature: ac6b1eda3281b6d3ce81dd775a522041 ******/
		%feature("compactdefaultargs") Extrema_ExtPElS;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
S: gp_Sphere
Tol: float

Return
-------
None

Description
-----------
It calculates all the distances between a point and a sphere from gp. Tol is used to test if the point is at the center.
") Extrema_ExtPElS;
		 Extrema_ExtPElS(const gp_Pnt & P, const gp_Sphere & S, const Standard_Real Tol);

		/****** Extrema_ExtPElS::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distances are found.
") IsDone;
		Standard_Boolean IsDone();

		/****** Extrema_ExtPElS::NbExt ******/
		/****** md5 signature: 84ada636e4651cacf916eb056265a1d9 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		Standard_Integer NbExt();

		/****** Extrema_ExtPElS::Perform ******/
		/****** md5 signature: 7a9583898caece842785d1fbbb6a41c7 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
S: gp_Cylinder
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Pnt & P, const gp_Cylinder & S, const Standard_Real Tol);

		/****** Extrema_ExtPElS::Perform ******/
		/****** md5 signature: 182c5b84fd8e40b09851cc166b2cd45b ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
S: gp_Pln
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Pnt & P, const gp_Pln & S, const Standard_Real Tol);

		/****** Extrema_ExtPElS::Perform ******/
		/****** md5 signature: bc41bf6c0844fea1e6ca23f55d184af9 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
S: gp_Cone
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Pnt & P, const gp_Cone & S, const Standard_Real Tol);

		/****** Extrema_ExtPElS::Perform ******/
		/****** md5 signature: 90fd6c44c396b1471c027903a8e071cc ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
S: gp_Torus
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Pnt & P, const gp_Torus & S, const Standard_Real Tol);

		/****** Extrema_ExtPElS::Perform ******/
		/****** md5 signature: ed199a8178cb5ed834c60aa45f034ae9 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
S: gp_Sphere
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Pnt & P, const gp_Sphere & S, const Standard_Real Tol);

		/****** Extrema_ExtPElS::Point ******/
		/****** md5 signature: a4fcffb60ef4a8c249128141ee062afa ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
Extrema_POnSurf

Description
-----------
Returns the point of the Nth resulting distance.
") Point;
		const Extrema_POnSurf & Point(const Standard_Integer N);

		/****** Extrema_ExtPElS::SquareDistance ******/
		/****** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
float

Description
-----------
Returns the value of the Nth resulting square distance.
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

};


%extend Extrema_ExtPElS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Extrema_ExtPExtS *
*************************/
class Extrema_ExtPExtS : public Standard_Transient {
	public:
		/****** Extrema_ExtPExtS::Extrema_ExtPExtS ******/
		/****** md5 signature: dcd91b6b512b4adb355634d4d1fcbd04 ******/
		%feature("compactdefaultargs") Extrema_ExtPExtS;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_ExtPExtS;
		 Extrema_ExtPExtS();

		/****** Extrema_ExtPExtS::Extrema_ExtPExtS ******/
		/****** md5 signature: 8390b68d70e936cf950fa530f03196c5 ******/
		%feature("compactdefaultargs") Extrema_ExtPExtS;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
S: GeomAdaptor_SurfaceOfLinearExtrusion
Umin: float
Usup: float
Vmin: float
Vsup: float
TolU: float
TolV: float

Return
-------
None

Description
-----------
It calculates all the distances between a point from gp and a Surface.
") Extrema_ExtPExtS;
		 Extrema_ExtPExtS(const gp_Pnt & P, const opencascade::handle<GeomAdaptor_SurfaceOfLinearExtrusion> & S, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real Vmin, const Standard_Real Vsup, const Standard_Real TolU, const Standard_Real TolV);

		/****** Extrema_ExtPExtS::Extrema_ExtPExtS ******/
		/****** md5 signature: 40ff9b6a45a9298edc4bc7b99b8b9323 ******/
		%feature("compactdefaultargs") Extrema_ExtPExtS;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
S: GeomAdaptor_SurfaceOfLinearExtrusion
TolU: float
TolV: float

Return
-------
None

Description
-----------
It calculates all the distances between a point from gp and a Surface.
") Extrema_ExtPExtS;
		 Extrema_ExtPExtS(const gp_Pnt & P, const opencascade::handle<GeomAdaptor_SurfaceOfLinearExtrusion> & S, const Standard_Real TolU, const Standard_Real TolV);

		/****** Extrema_ExtPExtS::Initialize ******/
		/****** md5 signature: 2c188151ca29551136581ffad667e7ed ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
S: GeomAdaptor_SurfaceOfLinearExtrusion
Uinf: float
Usup: float
Vinf: float
Vsup: float
TolU: float
TolV: float

Return
-------
None

Description
-----------
Initializes the fields of the algorithm.
") Initialize;
		void Initialize(const opencascade::handle<GeomAdaptor_SurfaceOfLinearExtrusion> & S, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real Vinf, const Standard_Real Vsup, const Standard_Real TolU, const Standard_Real TolV);

		/****** Extrema_ExtPExtS::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distances are found.
") IsDone;
		Standard_Boolean IsDone();

		/****** Extrema_ExtPExtS::NbExt ******/
		/****** md5 signature: 84ada636e4651cacf916eb056265a1d9 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		Standard_Integer NbExt();

		/****** Extrema_ExtPExtS::Perform ******/
		/****** md5 signature: 5f5e57fd55ba2b5f8e2b2be09861a3f9 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Pnt & P);

		/****** Extrema_ExtPExtS::Point ******/
		/****** md5 signature: a4fcffb60ef4a8c249128141ee062afa ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
Extrema_POnSurf

Description
-----------
Returns the point of the Nth resulting distance.
") Point;
		const Extrema_POnSurf & Point(const Standard_Integer N);

		/****** Extrema_ExtPExtS::SquareDistance ******/
		/****** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
float

Description
-----------
Returns the value of the Nth resulting square distance.
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

};


%make_alias(Extrema_ExtPExtS)

%extend Extrema_ExtPExtS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Extrema_ExtPRevS *
*************************/
class Extrema_ExtPRevS : public Standard_Transient {
	public:
		/****** Extrema_ExtPRevS::Extrema_ExtPRevS ******/
		/****** md5 signature: 679dbd4abfc01dec4eefe2229391cfbd ******/
		%feature("compactdefaultargs") Extrema_ExtPRevS;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_ExtPRevS;
		 Extrema_ExtPRevS();

		/****** Extrema_ExtPRevS::Extrema_ExtPRevS ******/
		/****** md5 signature: 1ac9435e6f9a8efe5739acf51bc42518 ******/
		%feature("compactdefaultargs") Extrema_ExtPRevS;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
S: GeomAdaptor_SurfaceOfRevolution
Umin: float
Usup: float
Vmin: float
Vsup: float
TolU: float
TolV: float

Return
-------
None

Description
-----------
It calculates all the distances between a point from gp and a SurfacePtr from Adaptor3d.
") Extrema_ExtPRevS;
		 Extrema_ExtPRevS(const gp_Pnt & P, const opencascade::handle<GeomAdaptor_SurfaceOfRevolution> & S, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real Vmin, const Standard_Real Vsup, const Standard_Real TolU, const Standard_Real TolV);

		/****** Extrema_ExtPRevS::Extrema_ExtPRevS ******/
		/****** md5 signature: e5055c0383c605df1cfed351d87ac4e8 ******/
		%feature("compactdefaultargs") Extrema_ExtPRevS;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
S: GeomAdaptor_SurfaceOfRevolution
TolU: float
TolV: float

Return
-------
None

Description
-----------
It calculates all the distances between a point from gp and a SurfacePtr from Adaptor3d.
") Extrema_ExtPRevS;
		 Extrema_ExtPRevS(const gp_Pnt & P, const opencascade::handle<GeomAdaptor_SurfaceOfRevolution> & S, const Standard_Real TolU, const Standard_Real TolV);

		/****** Extrema_ExtPRevS::Initialize ******/
		/****** md5 signature: 51cbb1f7b6fbef202ed05be3503ea920 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
S: GeomAdaptor_SurfaceOfRevolution
Umin: float
Usup: float
Vmin: float
Vsup: float
TolU: float
TolV: float

Return
-------
None

Description
-----------
No available documentation.
") Initialize;
		void Initialize(const opencascade::handle<GeomAdaptor_SurfaceOfRevolution> & S, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real Vmin, const Standard_Real Vsup, const Standard_Real TolU, const Standard_Real TolV);

		/****** Extrema_ExtPRevS::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distances are found.
") IsDone;
		Standard_Boolean IsDone();

		/****** Extrema_ExtPRevS::NbExt ******/
		/****** md5 signature: 84ada636e4651cacf916eb056265a1d9 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		Standard_Integer NbExt();

		/****** Extrema_ExtPRevS::Perform ******/
		/****** md5 signature: 5f5e57fd55ba2b5f8e2b2be09861a3f9 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Pnt & P);

		/****** Extrema_ExtPRevS::Point ******/
		/****** md5 signature: a4fcffb60ef4a8c249128141ee062afa ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
Extrema_POnSurf

Description
-----------
Returns the point of the Nth resulting distance.
") Point;
		const Extrema_POnSurf & Point(const Standard_Integer N);

		/****** Extrema_ExtPRevS::SquareDistance ******/
		/****** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
float

Description
-----------
Returns the value of the Nth resulting square distance.
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

};


%make_alias(Extrema_ExtPRevS)

%extend Extrema_ExtPRevS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Extrema_ExtPS *
**********************/
class Extrema_ExtPS {
	public:
		/****** Extrema_ExtPS::Extrema_ExtPS ******/
		/****** md5 signature: 793a5e92349ac079113a0a89d2169ffe ******/
		%feature("compactdefaultargs") Extrema_ExtPS;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_ExtPS;
		 Extrema_ExtPS();

		/****** Extrema_ExtPS::Extrema_ExtPS ******/
		/****** md5 signature: 442bc5c874228c2da454483d0c83a01c ******/
		%feature("compactdefaultargs") Extrema_ExtPS;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
S: Adaptor3d_Surface
TolU: float
TolV: float
F: Extrema_ExtFlag (optional, default to Extrema_ExtFlag_MINMAX)
A: Extrema_ExtAlgo (optional, default to Extrema_ExtAlgo_Grad)

Return
-------
None

Description
-----------
It calculates all the distances. NbU and NbV are used to locate the close points to find the zeros. They must be great enough such that if there is N extrema, there will be N extrema between P and the grid. TolU et TolV are used to determine the conditions to stop the iterations; at the iteration number n: (Un - Un-1) < TolU and (Vn - Vn-1) < TolV .
") Extrema_ExtPS;
		 Extrema_ExtPS(const gp_Pnt & P, const Adaptor3d_Surface & S, const Standard_Real TolU, const Standard_Real TolV, const Extrema_ExtFlag F = Extrema_ExtFlag_MINMAX, const Extrema_ExtAlgo A = Extrema_ExtAlgo_Grad);

		/****** Extrema_ExtPS::Extrema_ExtPS ******/
		/****** md5 signature: ae9e0982c6eae0cab46c82b1f5f9b3f2 ******/
		%feature("compactdefaultargs") Extrema_ExtPS;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
S: Adaptor3d_Surface
Uinf: float
Usup: float
Vinf: float
Vsup: float
TolU: float
TolV: float
F: Extrema_ExtFlag (optional, default to Extrema_ExtFlag_MINMAX)
A: Extrema_ExtAlgo (optional, default to Extrema_ExtAlgo_Grad)

Return
-------
None

Description
-----------
It calculates all the distances. NbU and NbV are used to locate the close points to find the zeros. They must be great enough such that if there is N extrema, there will be N extrema between P and the grid. TolU et TolV are used to determine the conditions to stop the iterations; at the iteration number n: (Un - Un-1) < TolU and (Vn - Vn-1) < TolV .
") Extrema_ExtPS;
		 Extrema_ExtPS(const gp_Pnt & P, const Adaptor3d_Surface & S, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real Vinf, const Standard_Real Vsup, const Standard_Real TolU, const Standard_Real TolV, const Extrema_ExtFlag F = Extrema_ExtFlag_MINMAX, const Extrema_ExtAlgo A = Extrema_ExtAlgo_Grad);

		/****** Extrema_ExtPS::Initialize ******/
		/****** md5 signature: 85bf7622aa29bfb02f48b8238eb11094 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
Uinf: float
Usup: float
Vinf: float
Vsup: float
TolU: float
TolV: float

Return
-------
None

Description
-----------
Initializes the fields of the algorithm.
") Initialize;
		void Initialize(const Adaptor3d_Surface & S, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real Vinf, const Standard_Real Vsup, const Standard_Real TolU, const Standard_Real TolV);

		/****** Extrema_ExtPS::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distances are found.
") IsDone;
		Standard_Boolean IsDone();

		/****** Extrema_ExtPS::NbExt ******/
		/****** md5 signature: 84ada636e4651cacf916eb056265a1d9 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		Standard_Integer NbExt();

		/****** Extrema_ExtPS::Perform ******/
		/****** md5 signature: 5f5e57fd55ba2b5f8e2b2be09861a3f9 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
None

Description
-----------
Computes the distances. An exception is raised if the fields have not been initialized.
") Perform;
		void Perform(const gp_Pnt & P);

		/****** Extrema_ExtPS::Point ******/
		/****** md5 signature: a4fcffb60ef4a8c249128141ee062afa ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
Extrema_POnSurf

Description
-----------
Returns the point of the Nth resulting distance.
") Point;
		const Extrema_POnSurf & Point(const Standard_Integer N);

		/****** Extrema_ExtPS::SetAlgo ******/
		/****** md5 signature: dcf7639630bf367993e8e7093ad161ed ******/
		%feature("compactdefaultargs") SetAlgo;
		%feature("autodoc", "
Parameters
----------
A: Extrema_ExtAlgo

Return
-------
None

Description
-----------
No available documentation.
") SetAlgo;
		void SetAlgo(const Extrema_ExtAlgo A);

		/****** Extrema_ExtPS::SetFlag ******/
		/****** md5 signature: d1a9d4d7a9231db47b60f98b2475fcf4 ******/
		%feature("compactdefaultargs") SetFlag;
		%feature("autodoc", "
Parameters
----------
F: Extrema_ExtFlag

Return
-------
None

Description
-----------
No available documentation.
") SetFlag;
		void SetFlag(const Extrema_ExtFlag F);

		/****** Extrema_ExtPS::SquareDistance ******/
		/****** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
float

Description
-----------
Returns the value of the Nth resulting square distance.
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****** Extrema_ExtPS::TrimmedSquareDistances ******/
		/****** md5 signature: 89ae4993de907b460aded6b7f212f89e ******/
		%feature("compactdefaultargs") TrimmedSquareDistances;
		%feature("autodoc", "
Parameters
----------
PUfVf: gp_Pnt
PUfVl: gp_Pnt
PUlVf: gp_Pnt
PUlVl: gp_Pnt

Return
-------
dUfVf: float
dUfVl: float
dUlVf: float
dUlVl: float

Description
-----------
if the surface is a trimmed surface, dUfVf is a square distance between <P> and the point of parameter FirstUParameter and FirstVParameter <PUfVf>. dUfVl is a square distance between <P> and the point of parameter FirstUParameter and LastVParameter <PUfVl>. dUlVf is a square distance between <P> and the point of parameter LastUParameter and FirstVParameter <PUlVf>. dUlVl is a square distance between <P> and the point of parameter LastUParameter and LastVParameter <PUlVl>.
") TrimmedSquareDistances;
		void TrimmedSquareDistances(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt & PUfVf, gp_Pnt & PUfVl, gp_Pnt & PUlVf, gp_Pnt & PUlVl);

};


%extend Extrema_ExtPS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Extrema_ExtSS *
**********************/
class Extrema_ExtSS {
	public:
		/****** Extrema_ExtSS::Extrema_ExtSS ******/
		/****** md5 signature: d54c660a7f43125fd28ce5400500e34f ******/
		%feature("compactdefaultargs") Extrema_ExtSS;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_ExtSS;
		 Extrema_ExtSS();

		/****** Extrema_ExtSS::Extrema_ExtSS ******/
		/****** md5 signature: d41df8248a9ed9aa1ac1f54913a328c1 ******/
		%feature("compactdefaultargs") Extrema_ExtSS;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface
TolS1: float
TolS2: float

Return
-------
None

Description
-----------
It calculates all the distances between S1 and S2.
") Extrema_ExtSS;
		 Extrema_ExtSS(const Adaptor3d_Surface & S1, const Adaptor3d_Surface & S2, const Standard_Real TolS1, const Standard_Real TolS2);

		/****** Extrema_ExtSS::Extrema_ExtSS ******/
		/****** md5 signature: 8a14608402b919fdeb8fbb14914f405f ******/
		%feature("compactdefaultargs") Extrema_ExtSS;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface
Uinf1: float
Usup1: float
Vinf1: float
Vsup1: float
Uinf2: float
Usup2: float
Vinf2: float
Vsup2: float
TolS1: float
TolS2: float

Return
-------
None

Description
-----------
It calculates all the distances between S1 and S2.
") Extrema_ExtSS;
		 Extrema_ExtSS(const Adaptor3d_Surface & S1, const Adaptor3d_Surface & S2, const Standard_Real Uinf1, const Standard_Real Usup1, const Standard_Real Vinf1, const Standard_Real Vsup1, const Standard_Real Uinf2, const Standard_Real Usup2, const Standard_Real Vinf2, const Standard_Real Vsup2, const Standard_Real TolS1, const Standard_Real TolS2);

		/****** Extrema_ExtSS::Initialize ******/
		/****** md5 signature: ad2fa52e6ddd361c6252c886b8810ed6 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
S2: Adaptor3d_Surface
Uinf2: float
Usup2: float
Vinf2: float
Vsup2: float
TolS1: float

Return
-------
None

Description
-----------
Initializes the fields of the algorithm.
") Initialize;
		void Initialize(const Adaptor3d_Surface & S2, const Standard_Real Uinf2, const Standard_Real Usup2, const Standard_Real Vinf2, const Standard_Real Vsup2, const Standard_Real TolS1);

		/****** Extrema_ExtSS::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distances are found.
") IsDone;
		Standard_Boolean IsDone();

		/****** Extrema_ExtSS::IsParallel ******/
		/****** md5 signature: 47a312fd58e74bf5bb8a9bb6f0484dfb ******/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the surfaces are parallel.
") IsParallel;
		Standard_Boolean IsParallel();

		/****** Extrema_ExtSS::NbExt ******/
		/****** md5 signature: 84ada636e4651cacf916eb056265a1d9 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		Standard_Integer NbExt();

		/****** Extrema_ExtSS::Perform ******/
		/****** md5 signature: 615d1558f87698e4b2ee7b4aae202fd8 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
Uinf1: float
Usup1: float
Vinf1: float
Vsup1: float
TolS1: float

Return
-------
None

Description
-----------
Computes the distances. An exception is raised if the fields have not been initialized.
") Perform;
		void Perform(const Adaptor3d_Surface & S1, const Standard_Real Uinf1, const Standard_Real Usup1, const Standard_Real Vinf1, const Standard_Real Vsup1, const Standard_Real TolS1);

		/****** Extrema_ExtSS::Points ******/
		/****** md5 signature: 3c61a440dae3b36da20a5cbbb58f55ce ******/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "
Parameters
----------
N: int
P1: Extrema_POnSurf
P2: Extrema_POnSurf

Return
-------
None

Description
-----------
Returns the point of the Nth resulting distance.
") Points;
		void Points(const Standard_Integer N, Extrema_POnSurf & P1, Extrema_POnSurf & P2);

		/****** Extrema_ExtSS::SquareDistance ******/
		/****** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
float

Description
-----------
Returns the value of the Nth resulting square distance.
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

};


%extend Extrema_ExtSS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Extrema_FuncExtCS *
**************************/
class Extrema_FuncExtCS : public math_FunctionSetWithDerivatives {
	public:
		/****** Extrema_FuncExtCS::Extrema_FuncExtCS ******/
		/****** md5 signature: 6c23b588602334a4bc8250bca08449d6 ******/
		%feature("compactdefaultargs") Extrema_FuncExtCS;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_FuncExtCS;
		 Extrema_FuncExtCS();

		/****** Extrema_FuncExtCS::Extrema_FuncExtCS ******/
		/****** md5 signature: 946df633917621e0dc617833ec3d0066 ******/
		%feature("compactdefaultargs") Extrema_FuncExtCS;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
S: Adaptor3d_Surface

Return
-------
None

Description
-----------
No available documentation.
") Extrema_FuncExtCS;
		 Extrema_FuncExtCS(const Adaptor3d_Curve & C, const Adaptor3d_Surface & S);

		/****** Extrema_FuncExtCS::Derivatives ******/
		/****** md5 signature: 1d38afd641c7de1e5982feb10f2b7ece ******/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "
Parameters
----------
UV: math_Vector
DF: math_Matrix

Return
-------
bool

Description
-----------
Calculation of Fi'(U,V).
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & UV, math_Matrix & DF);

		/****** Extrema_FuncExtCS::GetStateNumber ******/
		/****** md5 signature: 49c44bd66dd4ec2381671c72ebd88158 ******/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Save the found extremum.
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****** Extrema_FuncExtCS::Initialize ******/
		/****** md5 signature: 2a333662de5748b61979b7e3164f3edb ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
S: Adaptor3d_Surface

Return
-------
None

Description
-----------
sets the field mysurf of the function.
") Initialize;
		void Initialize(const Adaptor3d_Curve & C, const Adaptor3d_Surface & S);

		/****** Extrema_FuncExtCS::NbEquations ******/
		/****** md5 signature: 23bde6b2e3d1ee771730481f97ff7ae2 ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbEquations;
		Standard_Integer NbEquations();

		/****** Extrema_FuncExtCS::NbExt ******/
		/****** md5 signature: 84ada636e4651cacf916eb056265a1d9 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return the number of found extrema.
") NbExt;
		Standard_Integer NbExt();

		/****** Extrema_FuncExtCS::NbVariables ******/
		/****** md5 signature: c99b0d96b9b2c7c3fd7890618502162b ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVariables;
		Standard_Integer NbVariables();

		/****** Extrema_FuncExtCS::PointOnCurve ******/
		/****** md5 signature: 443491513fb9009060a015999afb6712 ******/
		%feature("compactdefaultargs") PointOnCurve;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
Extrema_POnCurv

Description
-----------
Returns the Nth extremum on C.
") PointOnCurve;
		const Extrema_POnCurv & PointOnCurve(const Standard_Integer N);

		/****** Extrema_FuncExtCS::PointOnSurface ******/
		/****** md5 signature: 7f1d563227e3ab4a1d4a83ca5fcf610c ******/
		%feature("compactdefaultargs") PointOnSurface;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
Extrema_POnSurf

Description
-----------
Return the Nth extremum on S.
") PointOnSurface;
		const Extrema_POnSurf & PointOnSurface(const Standard_Integer N);

		/****** Extrema_FuncExtCS::PointsOnCurve ******/
		/****** md5 signature: 602d5782674888b934bd4e2fd7fa5cdc ******/
		%feature("compactdefaultargs") PointsOnCurve;
		%feature("autodoc", "Return
-------
Extrema_SequenceOfPOnCurv

Description
-----------
Change Sequence of PointOnCurv.
") PointsOnCurve;
		Extrema_SequenceOfPOnCurv & PointsOnCurve();

		/****** Extrema_FuncExtCS::PointsOnSurf ******/
		/****** md5 signature: 3b5271d65309cd09fd6821dbda16b4be ******/
		%feature("compactdefaultargs") PointsOnSurf;
		%feature("autodoc", "Return
-------
Extrema_SequenceOfPOnSurf

Description
-----------
Change Sequence of PointOnSurf.
") PointsOnSurf;
		Extrema_SequenceOfPOnSurf & PointsOnSurf();

		/****** Extrema_FuncExtCS::SquareDistance ******/
		/****** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
float

Description
-----------
Return the value of the Nth distance.
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****** Extrema_FuncExtCS::SquareDistances ******/
		/****** md5 signature: 87170c9dd06e828cc97a07a8cfa0edbb ******/
		%feature("compactdefaultargs") SquareDistances;
		%feature("autodoc", "Return
-------
TColStd_SequenceOfReal

Description
-----------
Change Sequence of SquareDistance.
") SquareDistances;
		TColStd_SequenceOfReal & SquareDistances();

		/****** Extrema_FuncExtCS::Value ******/
		/****** md5 signature: 4409f39f6024165e606b9b8f7db3892e ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
UV: math_Vector
F: math_Vector

Return
-------
bool

Description
-----------
Calculation of Fi(U,V).
") Value;
		Standard_Boolean Value(const math_Vector & UV, math_Vector & F);

		/****** Extrema_FuncExtCS::Values ******/
		/****** md5 signature: aecc35a594e467ec2fc262dd639056f5 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
UV: math_Vector
F: math_Vector
DF: math_Matrix

Return
-------
bool

Description
-----------
Calculation of Fi(U,V) and Fi'(U,V).
") Values;
		Standard_Boolean Values(const math_Vector & UV, math_Vector & F, math_Matrix & DF);

};


%extend Extrema_FuncExtCS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Extrema_FuncExtSS *
**************************/
class Extrema_FuncExtSS : public math_FunctionSetWithDerivatives {
	public:
		/****** Extrema_FuncExtSS::Extrema_FuncExtSS ******/
		/****** md5 signature: b1c358bff58d260f7c43f0bf32dc9edb ******/
		%feature("compactdefaultargs") Extrema_FuncExtSS;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_FuncExtSS;
		 Extrema_FuncExtSS();

		/****** Extrema_FuncExtSS::Extrema_FuncExtSS ******/
		/****** md5 signature: 8395213c0a954425d4aa66501d53286b ******/
		%feature("compactdefaultargs") Extrema_FuncExtSS;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface

Return
-------
None

Description
-----------
No available documentation.
") Extrema_FuncExtSS;
		 Extrema_FuncExtSS(const Adaptor3d_Surface & S1, const Adaptor3d_Surface & S2);

		/****** Extrema_FuncExtSS::Derivatives ******/
		/****** md5 signature: 1d38afd641c7de1e5982feb10f2b7ece ******/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "
Parameters
----------
UV: math_Vector
DF: math_Matrix

Return
-------
bool

Description
-----------
Calculate Fi'(U,V).
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & UV, math_Matrix & DF);

		/****** Extrema_FuncExtSS::GetStateNumber ******/
		/****** md5 signature: 49c44bd66dd4ec2381671c72ebd88158 ******/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Save the found extremum.
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****** Extrema_FuncExtSS::Initialize ******/
		/****** md5 signature: bbf2a645e1835e618089044c53c8e997 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface

Return
-------
None

Description
-----------
sets the field mysurf of the function.
") Initialize;
		void Initialize(const Adaptor3d_Surface & S1, const Adaptor3d_Surface & S2);

		/****** Extrema_FuncExtSS::NbEquations ******/
		/****** md5 signature: 23bde6b2e3d1ee771730481f97ff7ae2 ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbEquations;
		Standard_Integer NbEquations();

		/****** Extrema_FuncExtSS::NbExt ******/
		/****** md5 signature: 84ada636e4651cacf916eb056265a1d9 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return the number of found extrema.
") NbExt;
		Standard_Integer NbExt();

		/****** Extrema_FuncExtSS::NbVariables ******/
		/****** md5 signature: c99b0d96b9b2c7c3fd7890618502162b ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVariables;
		Standard_Integer NbVariables();

		/****** Extrema_FuncExtSS::PointOnS1 ******/
		/****** md5 signature: 90624d213c63006128caeca879b24fcd ******/
		%feature("compactdefaultargs") PointOnS1;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
Extrema_POnSurf

Description
-----------
Return the Nth extremum on S1.
") PointOnS1;
		const Extrema_POnSurf & PointOnS1(const Standard_Integer N);

		/****** Extrema_FuncExtSS::PointOnS2 ******/
		/****** md5 signature: 38764998c5ddd9ae02fdb7d76f18f157 ******/
		%feature("compactdefaultargs") PointOnS2;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
Extrema_POnSurf

Description
-----------
Renvoie le Nieme extremum sur S2.
") PointOnS2;
		const Extrema_POnSurf & PointOnS2(const Standard_Integer N);

		/****** Extrema_FuncExtSS::SquareDistance ******/
		/****** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
float

Description
-----------
Return the value of the Nth distance.
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****** Extrema_FuncExtSS::Value ******/
		/****** md5 signature: 4409f39f6024165e606b9b8f7db3892e ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
UV: math_Vector
F: math_Vector

Return
-------
bool

Description
-----------
Calculate Fi(U,V).
") Value;
		Standard_Boolean Value(const math_Vector & UV, math_Vector & F);

		/****** Extrema_FuncExtSS::Values ******/
		/****** md5 signature: aecc35a594e467ec2fc262dd639056f5 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
UV: math_Vector
F: math_Vector
DF: math_Matrix

Return
-------
bool

Description
-----------
Calculate Fi(U,V) and Fi'(U,V).
") Values;
		Standard_Boolean Values(const math_Vector & UV, math_Vector & F, math_Matrix & DF);

};


%extend Extrema_FuncExtSS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Extrema_FuncPSDist *
***************************/
class Extrema_FuncPSDist : public math_MultipleVarFunctionWithGradient {
	public:
		/****** Extrema_FuncPSDist::Extrema_FuncPSDist ******/
		/****** md5 signature: d4bd3e85716206a906af143288563b41 ******/
		%feature("compactdefaultargs") Extrema_FuncPSDist;
		%feature("autodoc", "
Parameters
----------
theS: Adaptor3d_Surface
theP: gp_Pnt

Return
-------
None

Description
-----------
Constructor.
") Extrema_FuncPSDist;
		 Extrema_FuncPSDist(const Adaptor3d_Surface & theS, const gp_Pnt & theP);

		/****** Extrema_FuncPSDist::NbVariables ******/
		/****** md5 signature: c99b0d96b9b2c7c3fd7890618502162b ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
Number of variables.
") NbVariables;
		Standard_Integer NbVariables();

		/****** Extrema_FuncPSDist::Value ******/
		/****** md5 signature: 785b7201af1c2abaa75ddcb4aefd5f9e ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_VectorBase<double >

Return
-------
F: float

Description
-----------
Value.
") Value;
		Standard_Boolean Value(math_VectorBase<double > X, Standard_Real &OutValue);

};


%extend Extrema_FuncPSDist {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Gradient(self):
		pass

	@methodnotwrapped
	def Values(self):
		pass
	}
};

/***************************
* class Extrema_FuncPSNorm *
***************************/
class Extrema_FuncPSNorm : public math_FunctionSetWithDerivatives {
	public:
		/****** Extrema_FuncPSNorm::Extrema_FuncPSNorm ******/
		/****** md5 signature: f61a68020ce6f14065b62d66676226a0 ******/
		%feature("compactdefaultargs") Extrema_FuncPSNorm;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_FuncPSNorm;
		 Extrema_FuncPSNorm();

		/****** Extrema_FuncPSNorm::Extrema_FuncPSNorm ******/
		/****** md5 signature: fba66cad2011c86f68853470e71f3a4a ******/
		%feature("compactdefaultargs") Extrema_FuncPSNorm;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
S: Adaptor3d_Surface

Return
-------
None

Description
-----------
No available documentation.
") Extrema_FuncPSNorm;
		 Extrema_FuncPSNorm(const gp_Pnt & P, const Adaptor3d_Surface & S);

		/****** Extrema_FuncPSNorm::Derivatives ******/
		/****** md5 signature: 1d38afd641c7de1e5982feb10f2b7ece ******/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "
Parameters
----------
UV: math_Vector
DF: math_Matrix

Return
-------
bool

Description
-----------
Calculate Fi'(U,V).
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & UV, math_Matrix & DF);

		/****** Extrema_FuncPSNorm::GetStateNumber ******/
		/****** md5 signature: 49c44bd66dd4ec2381671c72ebd88158 ******/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Save the found extremum.
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****** Extrema_FuncPSNorm::Initialize ******/
		/****** md5 signature: 17b5f42375df076d09bf3e8b29e98099 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface

Return
-------
None

Description
-----------
sets the field mysurf of the function.
") Initialize;
		void Initialize(const Adaptor3d_Surface & S);

		/****** Extrema_FuncPSNorm::NbEquations ******/
		/****** md5 signature: 23bde6b2e3d1ee771730481f97ff7ae2 ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbEquations;
		Standard_Integer NbEquations();

		/****** Extrema_FuncPSNorm::NbExt ******/
		/****** md5 signature: 84ada636e4651cacf916eb056265a1d9 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return the number of found extrema.
") NbExt;
		Standard_Integer NbExt();

		/****** Extrema_FuncPSNorm::NbVariables ******/
		/****** md5 signature: c99b0d96b9b2c7c3fd7890618502162b ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVariables;
		Standard_Integer NbVariables();

		/****** Extrema_FuncPSNorm::Point ******/
		/****** md5 signature: a4fcffb60ef4a8c249128141ee062afa ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
Extrema_POnSurf

Description
-----------
Returns the Nth extremum.
") Point;
		const Extrema_POnSurf & Point(const Standard_Integer N);

		/****** Extrema_FuncPSNorm::SetPoint ******/
		/****** md5 signature: ad83fe26e12bb630222b6d2773210931 ******/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
None

Description
-----------
sets the field mysurf of the function.
") SetPoint;
		void SetPoint(const gp_Pnt & P);

		/****** Extrema_FuncPSNorm::SquareDistance ******/
		/****** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
float

Description
-----------
Return the value of the Nth distance.
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****** Extrema_FuncPSNorm::Value ******/
		/****** md5 signature: 4409f39f6024165e606b9b8f7db3892e ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
UV: math_Vector
F: math_Vector

Return
-------
bool

Description
-----------
Calculate Fi(U,V).
") Value;
		Standard_Boolean Value(const math_Vector & UV, math_Vector & F);

		/****** Extrema_FuncPSNorm::Values ******/
		/****** md5 signature: aecc35a594e467ec2fc262dd639056f5 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
UV: math_Vector
F: math_Vector
DF: math_Matrix

Return
-------
bool

Description
-----------
Calculate Fi(U,V) and Fi'(U,V).
") Values;
		Standard_Boolean Values(const math_Vector & UV, math_Vector & F, math_Matrix & DF);

};


%extend Extrema_FuncPSNorm {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Extrema_GenExtCS *
*************************/
class Extrema_GenExtCS {
	public:
		/****** Extrema_GenExtCS::Extrema_GenExtCS ******/
		/****** md5 signature: f167ca7a9c7e606895908255498d3a2f ******/
		%feature("compactdefaultargs") Extrema_GenExtCS;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Extrema_GenExtCS;
		 Extrema_GenExtCS();

		/****** Extrema_GenExtCS::Extrema_GenExtCS ******/
		/****** md5 signature: bba1c45ae7b3a767217c8ab190dca0fe ******/
		%feature("compactdefaultargs") Extrema_GenExtCS;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
S: Adaptor3d_Surface
NbT: int
NbU: int
NbV: int
Tol1: float
Tol2: float

Return
-------
None

Description
-----------
It calculates all the distances. The function F(u,v)=distance(S1(u1,v1),S2(u2,v2)) has an extremum when gradient(F)=0. The algorithm searches all the zeros inside the definition ranges of the surfaces. NbU and NbV are used to locate the close points on the surface and NbT on the curve to find the zeros.
") Extrema_GenExtCS;
		 Extrema_GenExtCS(const Adaptor3d_Curve & C, const Adaptor3d_Surface & S, const Standard_Integer NbT, const Standard_Integer NbU, const Standard_Integer NbV, const Standard_Real Tol1, const Standard_Real Tol2);

		/****** Extrema_GenExtCS::Extrema_GenExtCS ******/
		/****** md5 signature: 327c5ab7f1a3e9581157d19a9c2d2db1 ******/
		%feature("compactdefaultargs") Extrema_GenExtCS;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
S: Adaptor3d_Surface
NbT: int
NbU: int
NbV: int
tmin: float
tsup: float
Umin: float
Usup: float
Vmin: float
Vsup: float
Tol1: float
Tol2: float

Return
-------
None

Description
-----------
It calculates all the distances. The function F(u,v)=distance(P,S(u,v)) has an extremum when gradient(F)=0. The algorithm searches all the zeros inside the definition ranges of the surface. NbT,NbU and NbV are used to locate the close points to find the zeros.
") Extrema_GenExtCS;
		 Extrema_GenExtCS(const Adaptor3d_Curve & C, const Adaptor3d_Surface & S, const Standard_Integer NbT, const Standard_Integer NbU, const Standard_Integer NbV, const Standard_Real tmin, const Standard_Real tsup, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real Vmin, const Standard_Real Vsup, const Standard_Real Tol1, const Standard_Real Tol2);

		/****** Extrema_GenExtCS::Initialize ******/
		/****** md5 signature: 4a83bdcc87d7c0e853c8303703f95130 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
NbU: int
NbV: int
Tol2: float

Return
-------
None

Description
-----------
No available documentation.
") Initialize;
		void Initialize(const Adaptor3d_Surface & S, const Standard_Integer NbU, const Standard_Integer NbV, const Standard_Real Tol2);

		/****** Extrema_GenExtCS::Initialize ******/
		/****** md5 signature: e8ea48bb5f9e12ba1dba0669be5fd2b8 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
NbU: int
NbV: int
Umin: float
Usup: float
Vmin: float
Vsup: float
Tol2: float

Return
-------
None

Description
-----------
No available documentation.
") Initialize;
		void Initialize(const Adaptor3d_Surface & S, const Standard_Integer NbU, const Standard_Integer NbV, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real Vmin, const Standard_Real Vsup, const Standard_Real Tol2);

		/****** Extrema_GenExtCS::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distances are found.
") IsDone;
		Standard_Boolean IsDone();

		/****** Extrema_GenExtCS::NbExt ******/
		/****** md5 signature: 84ada636e4651cacf916eb056265a1d9 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		Standard_Integer NbExt();

		/****** Extrema_GenExtCS::Perform ******/
		/****** md5 signature: b64949bae48db2bea954e43971d938bd ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
NbT: int
Tol1: float

Return
-------
None

Description
-----------
the algorithm is done with S An exception is raised if the fields have not been initialized.
") Perform;
		void Perform(const Adaptor3d_Curve & C, const Standard_Integer NbT, const Standard_Real Tol1);

		/****** Extrema_GenExtCS::Perform ******/
		/****** md5 signature: 7e6ef01ddb8cf6219f4430373c7ecf2a ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
NbT: int
tmin: float
tsup: float
Tol1: float

Return
-------
None

Description
-----------
the algorithm is done with C An exception is raised if the fields have not been initialized.
") Perform;
		void Perform(const Adaptor3d_Curve & C, const Standard_Integer NbT, const Standard_Real tmin, const Standard_Real tsup, const Standard_Real Tol1);

		/****** Extrema_GenExtCS::PointOnCurve ******/
		/****** md5 signature: 443491513fb9009060a015999afb6712 ******/
		%feature("compactdefaultargs") PointOnCurve;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
Extrema_POnCurv

Description
-----------
Returns the point of the Nth resulting distance.
") PointOnCurve;
		const Extrema_POnCurv & PointOnCurve(const Standard_Integer N);

		/****** Extrema_GenExtCS::PointOnSurface ******/
		/****** md5 signature: 7f1d563227e3ab4a1d4a83ca5fcf610c ******/
		%feature("compactdefaultargs") PointOnSurface;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
Extrema_POnSurf

Description
-----------
Returns the point of the Nth resulting distance.
") PointOnSurface;
		const Extrema_POnSurf & PointOnSurface(const Standard_Integer N);

		/****** Extrema_GenExtCS::SquareDistance ******/
		/****** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
float

Description
-----------
Returns the value of the Nth resulting square distance.
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

};


%extend Extrema_GenExtCS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Extrema_GenExtPS *
*************************/
class Extrema_GenExtPS {
	public:
		/****** Extrema_GenExtPS::Extrema_GenExtPS ******/
		/****** md5 signature: a5064b4d9e02a8b5f95bf2e555839ea7 ******/
		%feature("compactdefaultargs") Extrema_GenExtPS;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Extrema_GenExtPS;
		 Extrema_GenExtPS();

		/****** Extrema_GenExtPS::Extrema_GenExtPS ******/
		/****** md5 signature: daed258cc828cde49776b51c85d4209e ******/
		%feature("compactdefaultargs") Extrema_GenExtPS;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
S: Adaptor3d_Surface
NbU: int
NbV: int
TolU: float
TolV: float
F: Extrema_ExtFlag (optional, default to Extrema_ExtFlag_MINMAX)
A: Extrema_ExtAlgo (optional, default to Extrema_ExtAlgo_Grad)

Return
-------
None

Description
-----------
It calculates all the distances. The function F(u,v)=distance(P,S(u,v)) has an extremum when gradient(F)=0. The algorithm searches all the zeros inside the definition ranges of the surface. NbU and NbV are used to locate the close points to find the zeros. They must be great enough such that if there is N extrema, there will be N extrema between P and the grid. TolU et TolV are used to determine the conditions to stop the iterations; at the iteration number n: (Un - Un-1) < TolU and (Vn - Vn-1) < TolV .
") Extrema_GenExtPS;
		 Extrema_GenExtPS(const gp_Pnt & P, const Adaptor3d_Surface & S, const Standard_Integer NbU, const Standard_Integer NbV, const Standard_Real TolU, const Standard_Real TolV, const Extrema_ExtFlag F = Extrema_ExtFlag_MINMAX, const Extrema_ExtAlgo A = Extrema_ExtAlgo_Grad);

		/****** Extrema_GenExtPS::Extrema_GenExtPS ******/
		/****** md5 signature: 9127ff28bfac5b4aee96e6256661db4d ******/
		%feature("compactdefaultargs") Extrema_GenExtPS;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
S: Adaptor3d_Surface
NbU: int
NbV: int
Umin: float
Usup: float
Vmin: float
Vsup: float
TolU: float
TolV: float
F: Extrema_ExtFlag (optional, default to Extrema_ExtFlag_MINMAX)
A: Extrema_ExtAlgo (optional, default to Extrema_ExtAlgo_Grad)

Return
-------
None

Description
-----------
It calculates all the distances. The function F(u,v)=distance(P,S(u,v)) has an extremum when gradient(F)=0. The algorithm searches all the zeros inside the definition ranges of the surface. NbU and NbV are used to locate the close points to find the zeros. They must be great enough such that if there is N extrema, there will be N extrema between P and the grid. TolU et TolV are used to determine the conditions to stop the iterations; at the iteration number n: (Un - Un-1) < TolU and (Vn - Vn-1) < TolV .
") Extrema_GenExtPS;
		 Extrema_GenExtPS(const gp_Pnt & P, const Adaptor3d_Surface & S, const Standard_Integer NbU, const Standard_Integer NbV, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real Vmin, const Standard_Real Vsup, const Standard_Real TolU, const Standard_Real TolV, const Extrema_ExtFlag F = Extrema_ExtFlag_MINMAX, const Extrema_ExtAlgo A = Extrema_ExtAlgo_Grad);

		/****** Extrema_GenExtPS::Initialize ******/
		/****** md5 signature: 3935e57ece45d8f4e70f4ad8a1ac7165 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
NbU: int
NbV: int
TolU: float
TolV: float

Return
-------
None

Description
-----------
No available documentation.
") Initialize;
		void Initialize(const Adaptor3d_Surface & S, const Standard_Integer NbU, const Standard_Integer NbV, const Standard_Real TolU, const Standard_Real TolV);

		/****** Extrema_GenExtPS::Initialize ******/
		/****** md5 signature: af1484acd6b86f4299828f1bce51a25d ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
NbU: int
NbV: int
Umin: float
Usup: float
Vmin: float
Vsup: float
TolU: float
TolV: float

Return
-------
None

Description
-----------
No available documentation.
") Initialize;
		void Initialize(const Adaptor3d_Surface & S, const Standard_Integer NbU, const Standard_Integer NbV, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real Vmin, const Standard_Real Vsup, const Standard_Real TolU, const Standard_Real TolV);

		/****** Extrema_GenExtPS::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distances are found.
") IsDone;
		Standard_Boolean IsDone();

		/****** Extrema_GenExtPS::NbExt ******/
		/****** md5 signature: 84ada636e4651cacf916eb056265a1d9 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		Standard_Integer NbExt();

		/****** Extrema_GenExtPS::Perform ******/
		/****** md5 signature: 5f5e57fd55ba2b5f8e2b2be09861a3f9 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
None

Description
-----------
the algorithm is done with the point P. An exception is raised if the fields have not been initialized.
") Perform;
		void Perform(const gp_Pnt & P);

		/****** Extrema_GenExtPS::Point ******/
		/****** md5 signature: a4fcffb60ef4a8c249128141ee062afa ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
Extrema_POnSurf

Description
-----------
Returns the point of the Nth resulting distance.
") Point;
		const Extrema_POnSurf & Point(const Standard_Integer N);

		/****** Extrema_GenExtPS::SetAlgo ******/
		/****** md5 signature: dcf7639630bf367993e8e7093ad161ed ******/
		%feature("compactdefaultargs") SetAlgo;
		%feature("autodoc", "
Parameters
----------
A: Extrema_ExtAlgo

Return
-------
None

Description
-----------
No available documentation.
") SetAlgo;
		void SetAlgo(const Extrema_ExtAlgo A);

		/****** Extrema_GenExtPS::SetFlag ******/
		/****** md5 signature: d1a9d4d7a9231db47b60f98b2475fcf4 ******/
		%feature("compactdefaultargs") SetFlag;
		%feature("autodoc", "
Parameters
----------
F: Extrema_ExtFlag

Return
-------
None

Description
-----------
No available documentation.
") SetFlag;
		void SetFlag(const Extrema_ExtFlag F);

		/****** Extrema_GenExtPS::SquareDistance ******/
		/****** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
float

Description
-----------
Returns the value of the Nth resulting square distance.
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

};


%extend Extrema_GenExtPS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Extrema_GenExtSS *
*************************/
class Extrema_GenExtSS {
	public:
		/****** Extrema_GenExtSS::Extrema_GenExtSS ******/
		/****** md5 signature: bdbaa032cdecd5329d7e7eff59343f37 ******/
		%feature("compactdefaultargs") Extrema_GenExtSS;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Extrema_GenExtSS;
		 Extrema_GenExtSS();

		/****** Extrema_GenExtSS::Extrema_GenExtSS ******/
		/****** md5 signature: 0360818ba5d986552ab9f07d2828956b ******/
		%feature("compactdefaultargs") Extrema_GenExtSS;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface
NbU: int
NbV: int
Tol1: float
Tol2: float

Return
-------
None

Description
-----------
It calculates all the distances. The function F(u,v)=distance(S1(u1,v1),S2(u2,v2)) has an extremum when gradient(F)=0. The algorithm searches all the zeros inside the definition ranges of the surfaces. NbU and NbV are used to locate the close points to find the zeros.
") Extrema_GenExtSS;
		 Extrema_GenExtSS(const Adaptor3d_Surface & S1, const Adaptor3d_Surface & S2, const Standard_Integer NbU, const Standard_Integer NbV, const Standard_Real Tol1, const Standard_Real Tol2);

		/****** Extrema_GenExtSS::Extrema_GenExtSS ******/
		/****** md5 signature: c712f92876bba0c244979fbd6c3f61fe ******/
		%feature("compactdefaultargs") Extrema_GenExtSS;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface
NbU: int
NbV: int
U1min: float
U1sup: float
V1min: float
V1sup: float
U2min: float
U2sup: float
V2min: float
V2sup: float
Tol1: float
Tol2: float

Return
-------
None

Description
-----------
It calculates all the distances. The function F(u,v)=distance(P,S(u,v)) has an extremum when gradient(F)=0. The algorithm searches all the zeros inside the definition ranges of the surface. NbU and NbV are used to locate the close points to find the zeros.
") Extrema_GenExtSS;
		 Extrema_GenExtSS(const Adaptor3d_Surface & S1, const Adaptor3d_Surface & S2, const Standard_Integer NbU, const Standard_Integer NbV, const Standard_Real U1min, const Standard_Real U1sup, const Standard_Real V1min, const Standard_Real V1sup, const Standard_Real U2min, const Standard_Real U2sup, const Standard_Real V2min, const Standard_Real V2sup, const Standard_Real Tol1, const Standard_Real Tol2);

		/****** Extrema_GenExtSS::Initialize ******/
		/****** md5 signature: d2ac09f99de85d3f3d302c08172f91f5 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
S2: Adaptor3d_Surface
NbU: int
NbV: int
Tol2: float

Return
-------
None

Description
-----------
No available documentation.
") Initialize;
		void Initialize(const Adaptor3d_Surface & S2, const Standard_Integer NbU, const Standard_Integer NbV, const Standard_Real Tol2);

		/****** Extrema_GenExtSS::Initialize ******/
		/****** md5 signature: a2d550e02672d28690103ab17b8cf560 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
S2: Adaptor3d_Surface
NbU: int
NbV: int
U2min: float
U2sup: float
V2min: float
V2sup: float
Tol2: float

Return
-------
None

Description
-----------
No available documentation.
") Initialize;
		void Initialize(const Adaptor3d_Surface & S2, const Standard_Integer NbU, const Standard_Integer NbV, const Standard_Real U2min, const Standard_Real U2sup, const Standard_Real V2min, const Standard_Real V2sup, const Standard_Real Tol2);

		/****** Extrema_GenExtSS::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distances are found.
") IsDone;
		Standard_Boolean IsDone();

		/****** Extrema_GenExtSS::NbExt ******/
		/****** md5 signature: 84ada636e4651cacf916eb056265a1d9 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		Standard_Integer NbExt();

		/****** Extrema_GenExtSS::Perform ******/
		/****** md5 signature: b4320d3a27d0ca1927f3609980ebcf1b ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
Tol1: float

Return
-------
None

Description
-----------
the algorithm is done with S1 An exception is raised if the fields have not been initialized.
") Perform;
		void Perform(const Adaptor3d_Surface & S1, const Standard_Real Tol1);

		/****** Extrema_GenExtSS::Perform ******/
		/****** md5 signature: 3de6570d908fa60d889e1dc36aa1ca23 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
U1min: float
U1sup: float
V1min: float
V1sup: float
Tol1: float

Return
-------
None

Description
-----------
the algorithm is done withS1 An exception is raised if the fields have not been initialized.
") Perform;
		void Perform(const Adaptor3d_Surface & S1, const Standard_Real U1min, const Standard_Real U1sup, const Standard_Real V1min, const Standard_Real V1sup, const Standard_Real Tol1);

		/****** Extrema_GenExtSS::PointOnS1 ******/
		/****** md5 signature: 90624d213c63006128caeca879b24fcd ******/
		%feature("compactdefaultargs") PointOnS1;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
Extrema_POnSurf

Description
-----------
Returns the point of the Nth resulting distance.
") PointOnS1;
		const Extrema_POnSurf & PointOnS1(const Standard_Integer N);

		/****** Extrema_GenExtSS::PointOnS2 ******/
		/****** md5 signature: 38764998c5ddd9ae02fdb7d76f18f157 ******/
		%feature("compactdefaultargs") PointOnS2;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
Extrema_POnSurf

Description
-----------
Returns the point of the Nth resulting distance.
") PointOnS2;
		const Extrema_POnSurf & PointOnS2(const Standard_Integer N);

		/****** Extrema_GenExtSS::SquareDistance ******/
		/****** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
float

Description
-----------
Returns the value of the Nth resulting square distance.
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

};


%extend Extrema_GenExtSS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Extrema_GenLocateExtCS *
*******************************/
class Extrema_GenLocateExtCS {
	public:
		/****** Extrema_GenLocateExtCS::Extrema_GenLocateExtCS ******/
		/****** md5 signature: f03a3323d64c5ae914d60d9d786ba827 ******/
		%feature("compactdefaultargs") Extrema_GenLocateExtCS;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_GenLocateExtCS;
		 Extrema_GenLocateExtCS();

		/****** Extrema_GenLocateExtCS::Extrema_GenLocateExtCS ******/
		/****** md5 signature: e4b395d8dfe4cac4c586cc73639a70bb ******/
		%feature("compactdefaultargs") Extrema_GenLocateExtCS;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
S: Adaptor3d_Surface
T: float
U: float
V: float
Tol1: float
Tol2: float

Return
-------
None

Description
-----------
Calculates the distance with two close points. The close points are defined by the parameter values T for C and (U,V) for S. The function F(t,u,v)=distance(C(t),S(u,v)) has an extremun when gradient(F)=0. The algorithm searches a zero near the close points.
") Extrema_GenLocateExtCS;
		 Extrema_GenLocateExtCS(const Adaptor3d_Curve & C, const Adaptor3d_Surface & S, const Standard_Real T, const Standard_Real U, const Standard_Real V, const Standard_Real Tol1, const Standard_Real Tol2);

		/****** Extrema_GenLocateExtCS::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distance is found.
") IsDone;
		Standard_Boolean IsDone();

		/****** Extrema_GenLocateExtCS::Perform ******/
		/****** md5 signature: be105fb152356ea7c716b2f46c5d1c6f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
S: Adaptor3d_Surface
T: float
U: float
V: float
Tol1: float
Tol2: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const Adaptor3d_Curve & C, const Adaptor3d_Surface & S, const Standard_Real T, const Standard_Real U, const Standard_Real V, const Standard_Real Tol1, const Standard_Real Tol2);

		/****** Extrema_GenLocateExtCS::PointOnCurve ******/
		/****** md5 signature: 12e75a03d4a94b00a001654daac03f2b ******/
		%feature("compactdefaultargs") PointOnCurve;
		%feature("autodoc", "Return
-------
Extrema_POnCurv

Description
-----------
Returns the point of the extremum distance on C.
") PointOnCurve;
		const Extrema_POnCurv & PointOnCurve();

		/****** Extrema_GenLocateExtCS::PointOnSurface ******/
		/****** md5 signature: 93e63de442d026d56322abfcd73004ce ******/
		%feature("compactdefaultargs") PointOnSurface;
		%feature("autodoc", "Return
-------
Extrema_POnSurf

Description
-----------
Returns the point of the extremum distance on S.
") PointOnSurface;
		const Extrema_POnSurf & PointOnSurface();

		/****** Extrema_GenLocateExtCS::SquareDistance ******/
		/****** md5 signature: 2eba58521e0603c1ef0e683534b03956 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of the extremum square distance.
") SquareDistance;
		Standard_Real SquareDistance();

};


%extend Extrema_GenLocateExtCS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Extrema_GenLocateExtPS *
*******************************/
class Extrema_GenLocateExtPS {
	public:
		/****** Extrema_GenLocateExtPS::Extrema_GenLocateExtPS ******/
		/****** md5 signature: c9c8d5943e8eebe4ebf77c504636c800 ******/
		%feature("compactdefaultargs") Extrema_GenLocateExtPS;
		%feature("autodoc", "
Parameters
----------
theS: Adaptor3d_Surface
theTolU: float (optional, default to Precision::PConfusion())
theTolV: float (optional, default to Precision::PConfusion())

Return
-------
None

Description
-----------
Constructor.
") Extrema_GenLocateExtPS;
		 Extrema_GenLocateExtPS(const Adaptor3d_Surface & theS, const Standard_Real theTolU = Precision::PConfusion(), const Standard_Real theTolV = Precision::PConfusion());

		/****** Extrema_GenLocateExtPS::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distance is found.
") IsDone;
		Standard_Boolean IsDone();

		/****** Extrema_GenLocateExtPS::IsMinDist ******/
		/****** md5 signature: 366fbadfb859c8db594bc4646bf37807 ******/
		%feature("compactdefaultargs") IsMinDist;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: Adaptor3d_Surface
theU0: float
theV0: float

Return
-------
bool

Description
-----------
Returns True if UV point theU0, theV0 is point of local minimum of square distance between point theP and points theS(U, V), U, V are in small area around theU0, theV0.
") IsMinDist;
		static Standard_Boolean IsMinDist(const gp_Pnt & theP, const Adaptor3d_Surface & theS, const Standard_Real theU0, const Standard_Real theV0);

		/****** Extrema_GenLocateExtPS::Perform ******/
		/****** md5 signature: 1356c2657a2e0ea627880218a7af615f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theU0: float
theV0: float
isDistanceCriteria: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Calculates the extrema between the point and the surface using a close point. The close point is defined by the parameter values theU0 and theV0. Type of the algorithm depends on the isDistanceCriteria flag. If flag value is false - normal projection criteria will be used. If flag value is true - distance criteria will be used.
") Perform;
		void Perform(const gp_Pnt & theP, const Standard_Real theU0, const Standard_Real theV0, const Standard_Boolean isDistanceCriteria = Standard_False);

		/****** Extrema_GenLocateExtPS::Point ******/
		/****** md5 signature: 495077ccedcb1863c9951b01a84a4bd1 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Return
-------
Extrema_POnSurf

Description
-----------
Returns the point of the extremum distance.
") Point;
		const Extrema_POnSurf & Point();

		/****** Extrema_GenLocateExtPS::SquareDistance ******/
		/****** md5 signature: 2eba58521e0603c1ef0e683534b03956 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of the extremum square distance.
") SquareDistance;
		Standard_Real SquareDistance();

};


%extend Extrema_GenLocateExtPS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Extrema_GenLocateExtSS *
*******************************/
class Extrema_GenLocateExtSS {
	public:
		/****** Extrema_GenLocateExtSS::Extrema_GenLocateExtSS ******/
		/****** md5 signature: 04ab116b2b054b428cded25821b973b5 ******/
		%feature("compactdefaultargs") Extrema_GenLocateExtSS;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_GenLocateExtSS;
		 Extrema_GenLocateExtSS();

		/****** Extrema_GenLocateExtSS::Extrema_GenLocateExtSS ******/
		/****** md5 signature: ecd085c1d3d7d14e4947fbff65cc1cdf ******/
		%feature("compactdefaultargs") Extrema_GenLocateExtSS;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface
U1: float
V1: float
U2: float
V2: float
Tol1: float
Tol2: float

Return
-------
None

Description
-----------
Calculates the distance with two close points. The close points are defined by the parameter values (U1,V1) for S1 and (U2,V2) for S2. The function F(u1,v1,u2,v2)=distance(S1(u1,v1),S2(u2,v2)) has an extremun when gradient(F)=0. The algorithm searches a zero near the close points.
") Extrema_GenLocateExtSS;
		 Extrema_GenLocateExtSS(const Adaptor3d_Surface & S1, const Adaptor3d_Surface & S2, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, const Standard_Real Tol1, const Standard_Real Tol2);

		/****** Extrema_GenLocateExtSS::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distance is found.
") IsDone;
		Standard_Boolean IsDone();

		/****** Extrema_GenLocateExtSS::Perform ******/
		/****** md5 signature: cfe9cb870bc63c0d808034e1ebefe62b ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface
U1: float
V1: float
U2: float
V2: float
Tol1: float
Tol2: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const Adaptor3d_Surface & S1, const Adaptor3d_Surface & S2, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, const Standard_Real Tol1, const Standard_Real Tol2);

		/****** Extrema_GenLocateExtSS::PointOnS1 ******/
		/****** md5 signature: a968c7bd12e452b2a800b3175543fbbd ******/
		%feature("compactdefaultargs") PointOnS1;
		%feature("autodoc", "Return
-------
Extrema_POnSurf

Description
-----------
Returns the point of the extremum distance on S1.
") PointOnS1;
		const Extrema_POnSurf & PointOnS1();

		/****** Extrema_GenLocateExtSS::PointOnS2 ******/
		/****** md5 signature: 158037b8ed7d0d3eff38e68c16d54d08 ******/
		%feature("compactdefaultargs") PointOnS2;
		%feature("autodoc", "Return
-------
Extrema_POnSurf

Description
-----------
Returns the point of the extremum distance on S2.
") PointOnS2;
		const Extrema_POnSurf & PointOnS2();

		/****** Extrema_GenLocateExtSS::SquareDistance ******/
		/****** md5 signature: 2eba58521e0603c1ef0e683534b03956 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of the extremum square distance.
") SquareDistance;
		Standard_Real SquareDistance();

};


%extend Extrema_GenLocateExtSS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class Extrema_GlobOptFuncCCC0 *
********************************/
class Extrema_GlobOptFuncCCC0 : public math_MultipleVarFunction {
	public:
		/****** Extrema_GlobOptFuncCCC0::Extrema_GlobOptFuncCCC0 ******/
		/****** md5 signature: 4c8e75f4abe82a228a576c9c9ebce67c ******/
		%feature("compactdefaultargs") Extrema_GlobOptFuncCCC0;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor3d_Curve
C2: Adaptor3d_Curve

Return
-------
None

Description
-----------
No available documentation.
") Extrema_GlobOptFuncCCC0;
		 Extrema_GlobOptFuncCCC0(const Adaptor3d_Curve & C1, const Adaptor3d_Curve & C2);

		/****** Extrema_GlobOptFuncCCC0::Extrema_GlobOptFuncCCC0 ******/
		/****** md5 signature: e18f677b2f1ba0bff87cb13675251910 ******/
		%feature("compactdefaultargs") Extrema_GlobOptFuncCCC0;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
No available documentation.
") Extrema_GlobOptFuncCCC0;
		 Extrema_GlobOptFuncCCC0(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2);

		/****** Extrema_GlobOptFuncCCC0::NbVariables ******/
		/****** md5 signature: 922c68b9d7f8438f91dc9a997354b8f8 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****** Extrema_GlobOptFuncCCC0::Value ******/
		/****** md5 signature: 22e87ab6030399152b72d08cc5e678ff ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector

Return
-------
F: float

Description
-----------
No available documentation.
") Value;
		virtual Standard_Boolean Value(const math_Vector & X, Standard_Real &OutValue);

};


%extend Extrema_GlobOptFuncCCC0 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class Extrema_GlobOptFuncCCC1 *
********************************/
class Extrema_GlobOptFuncCCC1 : public math_MultipleVarFunctionWithGradient {
	public:
		/****** Extrema_GlobOptFuncCCC1::Extrema_GlobOptFuncCCC1 ******/
		/****** md5 signature: 98857765fc04180c91ffe4cacb51c277 ******/
		%feature("compactdefaultargs") Extrema_GlobOptFuncCCC1;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor3d_Curve
C2: Adaptor3d_Curve

Return
-------
None

Description
-----------
No available documentation.
") Extrema_GlobOptFuncCCC1;
		 Extrema_GlobOptFuncCCC1(const Adaptor3d_Curve & C1, const Adaptor3d_Curve & C2);

		/****** Extrema_GlobOptFuncCCC1::Extrema_GlobOptFuncCCC1 ******/
		/****** md5 signature: 59777f669e43d9a0e0c772dea464c1d3 ******/
		%feature("compactdefaultargs") Extrema_GlobOptFuncCCC1;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
No available documentation.
") Extrema_GlobOptFuncCCC1;
		 Extrema_GlobOptFuncCCC1(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2);

		/****** Extrema_GlobOptFuncCCC1::Gradient ******/
		/****** md5 signature: afb14635ff3747ce6e48aa62585027fc ******/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
G: math_Vector

Return
-------
bool

Description
-----------
No available documentation.
") Gradient;
		virtual Standard_Boolean Gradient(const math_Vector & X, math_Vector & G);

		/****** Extrema_GlobOptFuncCCC1::NbVariables ******/
		/****** md5 signature: 922c68b9d7f8438f91dc9a997354b8f8 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****** Extrema_GlobOptFuncCCC1::Value ******/
		/****** md5 signature: 22e87ab6030399152b72d08cc5e678ff ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector

Return
-------
F: float

Description
-----------
No available documentation.
") Value;
		virtual Standard_Boolean Value(const math_Vector & X, Standard_Real &OutValue);

		/****** Extrema_GlobOptFuncCCC1::Values ******/
		/****** md5 signature: e2748a3160e1b3e6076f299cbf419f60 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
G: math_Vector

Return
-------
F: float

Description
-----------
No available documentation.
") Values;
		virtual Standard_Boolean Values(const math_Vector & X, Standard_Real &OutValue, math_Vector & G);

};


%extend Extrema_GlobOptFuncCCC1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class Extrema_GlobOptFuncCCC2 *
********************************/
class Extrema_GlobOptFuncCCC2 : public math_MultipleVarFunctionWithHessian {
	public:
		/****** Extrema_GlobOptFuncCCC2::Extrema_GlobOptFuncCCC2 ******/
		/****** md5 signature: 352f6f3921ee64f4e551f09f65ab03d9 ******/
		%feature("compactdefaultargs") Extrema_GlobOptFuncCCC2;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor3d_Curve
C2: Adaptor3d_Curve

Return
-------
None

Description
-----------
No available documentation.
") Extrema_GlobOptFuncCCC2;
		 Extrema_GlobOptFuncCCC2(const Adaptor3d_Curve & C1, const Adaptor3d_Curve & C2);

		/****** Extrema_GlobOptFuncCCC2::Extrema_GlobOptFuncCCC2 ******/
		/****** md5 signature: 9fa14c64a37952aec04b224f8f6000e9 ******/
		%feature("compactdefaultargs") Extrema_GlobOptFuncCCC2;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
No available documentation.
") Extrema_GlobOptFuncCCC2;
		 Extrema_GlobOptFuncCCC2(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2);

		/****** Extrema_GlobOptFuncCCC2::Gradient ******/
		/****** md5 signature: afb14635ff3747ce6e48aa62585027fc ******/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
G: math_Vector

Return
-------
bool

Description
-----------
No available documentation.
") Gradient;
		virtual Standard_Boolean Gradient(const math_Vector & X, math_Vector & G);

		/****** Extrema_GlobOptFuncCCC2::NbVariables ******/
		/****** md5 signature: 922c68b9d7f8438f91dc9a997354b8f8 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****** Extrema_GlobOptFuncCCC2::Value ******/
		/****** md5 signature: 22e87ab6030399152b72d08cc5e678ff ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector

Return
-------
F: float

Description
-----------
No available documentation.
") Value;
		virtual Standard_Boolean Value(const math_Vector & X, Standard_Real &OutValue);

		/****** Extrema_GlobOptFuncCCC2::Values ******/
		/****** md5 signature: e2748a3160e1b3e6076f299cbf419f60 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
G: math_Vector

Return
-------
F: float

Description
-----------
No available documentation.
") Values;
		virtual Standard_Boolean Values(const math_Vector & X, Standard_Real &OutValue, math_Vector & G);

		/****** Extrema_GlobOptFuncCCC2::Values ******/
		/****** md5 signature: 71c153f156506b8614d434a26bc9aaff ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
G: math_Vector
H: math_Matrix

Return
-------
F: float

Description
-----------
No available documentation.
") Values;
		virtual Standard_Boolean Values(const math_Vector & X, Standard_Real &OutValue, math_Vector & G, math_Matrix & H);

};


%extend Extrema_GlobOptFuncCCC2 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class Extrema_GlobOptFuncCQuadric *
************************************/
class Extrema_GlobOptFuncCQuadric : public math_MultipleVarFunction {
	public:
		/****** Extrema_GlobOptFuncCQuadric::Extrema_GlobOptFuncCQuadric ******/
		/****** md5 signature: 99114e215beb985216f6c00dc13224d3 ******/
		%feature("compactdefaultargs") Extrema_GlobOptFuncCQuadric;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve *

Return
-------
None

Description
-----------
Curve and surface should exist during all the lifetime of Extrema_GlobOptFuncCQuadric.
") Extrema_GlobOptFuncCQuadric;
		 Extrema_GlobOptFuncCQuadric(const Adaptor3d_Curve * C);

		/****** Extrema_GlobOptFuncCQuadric::Extrema_GlobOptFuncCQuadric ******/
		/****** md5 signature: d7d61981913d1d4e7a277c4d649fe556 ******/
		%feature("compactdefaultargs") Extrema_GlobOptFuncCQuadric;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve *
theTf: float
theTl: float

Return
-------
None

Description
-----------
No available documentation.
") Extrema_GlobOptFuncCQuadric;
		 Extrema_GlobOptFuncCQuadric(const Adaptor3d_Curve * C, const Standard_Real theTf, const Standard_Real theTl);

		/****** Extrema_GlobOptFuncCQuadric::Extrema_GlobOptFuncCQuadric ******/
		/****** md5 signature: fb48d40e095a7a0601592ff43956384b ******/
		%feature("compactdefaultargs") Extrema_GlobOptFuncCQuadric;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve *
S: Adaptor3d_Surface *

Return
-------
None

Description
-----------
No available documentation.
") Extrema_GlobOptFuncCQuadric;
		 Extrema_GlobOptFuncCQuadric(const Adaptor3d_Curve * C, const Adaptor3d_Surface * S);

		/****** Extrema_GlobOptFuncCQuadric::LoadQuad ******/
		/****** md5 signature: b1296108bc605a6d73f7634315ac1035 ******/
		%feature("compactdefaultargs") LoadQuad;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface *
theUf: float
theUl: float
theVf: float
theVl: float

Return
-------
None

Description
-----------
No available documentation.
") LoadQuad;
		void LoadQuad(const Adaptor3d_Surface * S, const Standard_Real theUf, const Standard_Real theUl, const Standard_Real theVf, const Standard_Real theVl);

		/****** Extrema_GlobOptFuncCQuadric::NbVariables ******/
		/****** md5 signature: 922c68b9d7f8438f91dc9a997354b8f8 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****** Extrema_GlobOptFuncCQuadric::QuadricParameters ******/
		/****** md5 signature: 0d6d1773b562190c9fe7c329ab0e0c67 ******/
		%feature("compactdefaultargs") QuadricParameters;
		%feature("autodoc", "
Parameters
----------
theCT: math_Vector
theUV: math_Vector

Return
-------
None

Description
-----------
Parameters of quadric for point on curve defined by theCT.
") QuadricParameters;
		void QuadricParameters(const math_Vector & theCT, math_Vector & theUV);

		/****** Extrema_GlobOptFuncCQuadric::Value ******/
		/****** md5 signature: fb3656bc314c1cff1090e6eb65303c3a ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
theX: math_Vector

Return
-------
theF: float

Description
-----------
No available documentation.
") Value;
		virtual Standard_Boolean Value(const math_Vector & theX, Standard_Real &OutValue);

};


%extend Extrema_GlobOptFuncCQuadric {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Extrema_GlobOptFuncCS *
******************************/
class Extrema_GlobOptFuncCS : public math_MultipleVarFunctionWithHessian {
	public:
		/****** Extrema_GlobOptFuncCS::Extrema_GlobOptFuncCS ******/
		/****** md5 signature: 64fbaf8331a8fc8e7744730ac6295a01 ******/
		%feature("compactdefaultargs") Extrema_GlobOptFuncCS;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve *
S: Adaptor3d_Surface *

Return
-------
None

Description
-----------
Curve and surface should exist during all the lifetime of Extrema_GlobOptFuncCS.
") Extrema_GlobOptFuncCS;
		 Extrema_GlobOptFuncCS(const Adaptor3d_Curve * C, const Adaptor3d_Surface * S);

		/****** Extrema_GlobOptFuncCS::Gradient ******/
		/****** md5 signature: 26c6a323173ad7afe76b93c684ea910c ******/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "
Parameters
----------
theX: math_Vector
theG: math_Vector

Return
-------
bool

Description
-----------
No available documentation.
") Gradient;
		virtual Standard_Boolean Gradient(const math_Vector & theX, math_Vector & theG);

		/****** Extrema_GlobOptFuncCS::NbVariables ******/
		/****** md5 signature: 922c68b9d7f8438f91dc9a997354b8f8 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****** Extrema_GlobOptFuncCS::Value ******/
		/****** md5 signature: fb3656bc314c1cff1090e6eb65303c3a ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
theX: math_Vector

Return
-------
theF: float

Description
-----------
No available documentation.
") Value;
		virtual Standard_Boolean Value(const math_Vector & theX, Standard_Real &OutValue);

		/****** Extrema_GlobOptFuncCS::Values ******/
		/****** md5 signature: 37f6d953c44cf76defcd3c5a888ec005 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
theX: math_Vector
theG: math_Vector

Return
-------
theF: float

Description
-----------
No available documentation.
") Values;
		virtual Standard_Boolean Values(const math_Vector & theX, Standard_Real &OutValue, math_Vector & theG);

		/****** Extrema_GlobOptFuncCS::Values ******/
		/****** md5 signature: b8b1e960aca0090037e8d83ff258eb98 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
theX: math_Vector
theG: math_Vector
theH: math_Matrix

Return
-------
theF: float

Description
-----------
No available documentation.
") Values;
		virtual Standard_Boolean Values(const math_Vector & theX, Standard_Real &OutValue, math_Vector & theG, math_Matrix & theH);

};


%extend Extrema_GlobOptFuncCS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class Extrema_GlobOptFuncConicS *
**********************************/
class Extrema_GlobOptFuncConicS : public math_MultipleVarFunction {
	public:
		/****** Extrema_GlobOptFuncConicS::Extrema_GlobOptFuncConicS ******/
		/****** md5 signature: de0973757811ece0501040b69ceb698c ******/
		%feature("compactdefaultargs") Extrema_GlobOptFuncConicS;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve *
S: Adaptor3d_Surface *

Return
-------
None

Description
-----------
Curve and surface should exist during all the lifetime of Extrema_GlobOptFuncConicS.
") Extrema_GlobOptFuncConicS;
		 Extrema_GlobOptFuncConicS(const Adaptor3d_Curve * C, const Adaptor3d_Surface * S);

		/****** Extrema_GlobOptFuncConicS::Extrema_GlobOptFuncConicS ******/
		/****** md5 signature: 85e49315da7906cf8c9fd935a3e1fbec ******/
		%feature("compactdefaultargs") Extrema_GlobOptFuncConicS;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface *

Return
-------
None

Description
-----------
No available documentation.
") Extrema_GlobOptFuncConicS;
		 Extrema_GlobOptFuncConicS(const Adaptor3d_Surface * S);

		/****** Extrema_GlobOptFuncConicS::Extrema_GlobOptFuncConicS ******/
		/****** md5 signature: 2d1010427e12b5b7ddf1b64a90e1b6b8 ******/
		%feature("compactdefaultargs") Extrema_GlobOptFuncConicS;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface *
theUf: float
theUl: float
theVf: float
theVl: float

Return
-------
None

Description
-----------
No available documentation.
") Extrema_GlobOptFuncConicS;
		 Extrema_GlobOptFuncConicS(const Adaptor3d_Surface * S, const Standard_Real theUf, const Standard_Real theUl, const Standard_Real theVf, const Standard_Real theVl);

		/****** Extrema_GlobOptFuncConicS::ConicParameter ******/
		/****** md5 signature: ddde894a92baf5120f0b5896f8ff23d0 ******/
		%feature("compactdefaultargs") ConicParameter;
		%feature("autodoc", "
Parameters
----------
theUV: math_Vector

Return
-------
float

Description
-----------
Parameter of conic for point on surface defined by theUV.
") ConicParameter;
		Standard_Real ConicParameter(const math_Vector & theUV);

		/****** Extrema_GlobOptFuncConicS::LoadConic ******/
		/****** md5 signature: 2a020f4c8e584a3dddabb791c247f871 ******/
		%feature("compactdefaultargs") LoadConic;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Curve *
theTf: float
theTl: float

Return
-------
None

Description
-----------
No available documentation.
") LoadConic;
		void LoadConic(const Adaptor3d_Curve * S, const Standard_Real theTf, const Standard_Real theTl);

		/****** Extrema_GlobOptFuncConicS::NbVariables ******/
		/****** md5 signature: 922c68b9d7f8438f91dc9a997354b8f8 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****** Extrema_GlobOptFuncConicS::Value ******/
		/****** md5 signature: fb3656bc314c1cff1090e6eb65303c3a ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
theX: math_Vector

Return
-------
theF: float

Description
-----------
No available documentation.
") Value;
		virtual Standard_Boolean Value(const math_Vector & theX, Standard_Real &OutValue);

};


%extend Extrema_GlobOptFuncConicS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Extrema_LocECC *
***********************/
class Extrema_LocECC {
	public:
		/****** Extrema_LocECC::Extrema_LocECC ******/
		/****** md5 signature: b7729509f3f5df86a49fc9bcf1ed4ca4 ******/
		%feature("compactdefaultargs") Extrema_LocECC;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor3d_Curve
C2: Adaptor3d_Curve
U0: float
V0: float
TolU: float
TolV: float

Return
-------
None

Description
-----------
Calculates the distance with a close point. The close point is defined by a parameter value on each curve. The function F(u,v)=distance(C1(u),C2(v)) has an extremun when gradient(f)=0. The algorithm searches the zero near the close point.
") Extrema_LocECC;
		 Extrema_LocECC(const Adaptor3d_Curve & C1, const Adaptor3d_Curve & C2, const Standard_Real U0, const Standard_Real V0, const Standard_Real TolU, const Standard_Real TolV);

		/****** Extrema_LocECC::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distance is found.
") IsDone;
		Standard_Boolean IsDone();

		/****** Extrema_LocECC::Point ******/
		/****** md5 signature: 7be28bf48146b84b5c9a78b62f7a11e6 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
P1: Extrema_POnCurv
P2: Extrema_POnCurv

Return
-------
None

Description
-----------
Returns the points of the extremum distance. P1 is on the first curve, P2 on the second one.
") Point;
		void Point(Extrema_POnCurv & P1, Extrema_POnCurv & P2);

		/****** Extrema_LocECC::SquareDistance ******/
		/****** md5 signature: 2eba58521e0603c1ef0e683534b03956 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of the extremum square distance.
") SquareDistance;
		Standard_Real SquareDistance();

};


%extend Extrema_LocECC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Extrema_LocECC2d *
*************************/
class Extrema_LocECC2d {
	public:
		/****** Extrema_LocECC2d::Extrema_LocECC2d ******/
		/****** md5 signature: 6498e5613a60c1f849de06e79134f45c ******/
		%feature("compactdefaultargs") Extrema_LocECC2d;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d
U0: float
V0: float
TolU: float
TolV: float

Return
-------
None

Description
-----------
Calculates the distance with a close point. The close point is defined by a parameter value on each curve. The function F(u,v)=distance(C1(u),C2(v)) has an extremun when gradient(f)=0. The algorithm searches the zero near the close point.
") Extrema_LocECC2d;
		 Extrema_LocECC2d(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2, const Standard_Real U0, const Standard_Real V0, const Standard_Real TolU, const Standard_Real TolV);

		/****** Extrema_LocECC2d::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distance is found.
") IsDone;
		Standard_Boolean IsDone();

		/****** Extrema_LocECC2d::Point ******/
		/****** md5 signature: 22f957435cf6e3814ad63d5f9079e8df ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
P1: Extrema_POnCurv2d
P2: Extrema_POnCurv2d

Return
-------
None

Description
-----------
Returns the points of the extremum distance. P1 is on the first curve, P2 on the second one.
") Point;
		void Point(Extrema_POnCurv2d & P1, Extrema_POnCurv2d & P2);

		/****** Extrema_LocECC2d::SquareDistance ******/
		/****** md5 signature: 2eba58521e0603c1ef0e683534b03956 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of the extremum square distance.
") SquareDistance;
		Standard_Real SquareDistance();

};


%extend Extrema_LocECC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class Extrema_LocEPCOfLocateExtPC *
************************************/
class Extrema_LocEPCOfLocateExtPC {
	public:
		/****** Extrema_LocEPCOfLocateExtPC::Extrema_LocEPCOfLocateExtPC ******/
		/****** md5 signature: 66f71ce2df9e8f2946e4972c6f72b590 ******/
		%feature("compactdefaultargs") Extrema_LocEPCOfLocateExtPC;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_LocEPCOfLocateExtPC;
		 Extrema_LocEPCOfLocateExtPC();

		/****** Extrema_LocEPCOfLocateExtPC::Extrema_LocEPCOfLocateExtPC ******/
		/****** md5 signature: b7a86f687213d8fba59800755f030350 ******/
		%feature("compactdefaultargs") Extrema_LocEPCOfLocateExtPC;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
C: Adaptor3d_Curve
U0: float
TolU: float

Return
-------
None

Description
-----------
Calculates the distance with a close point. The close point is defined by the parameter value U0. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searches a zero near the close point. TolU is used to decide to stop the iterations. At the nth iteration, the criteria is: abs(Un - Un-1) < TolU.
") Extrema_LocEPCOfLocateExtPC;
		 Extrema_LocEPCOfLocateExtPC(const gp_Pnt & P, const Adaptor3d_Curve & C, const Standard_Real U0, const Standard_Real TolU);

		/****** Extrema_LocEPCOfLocateExtPC::Extrema_LocEPCOfLocateExtPC ******/
		/****** md5 signature: 6dbc9dd4faaee8fbc458b42a67c3818b ******/
		%feature("compactdefaultargs") Extrema_LocEPCOfLocateExtPC;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
C: Adaptor3d_Curve
U0: float
Umin: float
Usup: float
TolU: float

Return
-------
None

Description
-----------
Calculates the distance with a close point. The close point is defined by the parameter value U0. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searches a zero near the close point. Zeros are searched between Umin et Usup. TolU is used to decide to stop the iterations. At the nth iteration, the criteria is: abs(Un - Un-1) < TolU.
") Extrema_LocEPCOfLocateExtPC;
		 Extrema_LocEPCOfLocateExtPC(const gp_Pnt & P, const Adaptor3d_Curve & C, const Standard_Real U0, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU);

		/****** Extrema_LocEPCOfLocateExtPC::Initialize ******/
		/****** md5 signature: b366bc0866e4c9bd91feeb2d622b9429 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
Umin: float
Usup: float
TolU: float

Return
-------
None

Description
-----------
sets the fields of the algorithm.
") Initialize;
		void Initialize(const Adaptor3d_Curve & C, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU);

		/****** Extrema_LocEPCOfLocateExtPC::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distance is found.
") IsDone;
		Standard_Boolean IsDone();

		/****** Extrema_LocEPCOfLocateExtPC::IsMin ******/
		/****** md5 signature: 1c0b1dbd0d0c10c93cbf9fefce4bad3b ******/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the extremum distance is a minimum.
") IsMin;
		Standard_Boolean IsMin();

		/****** Extrema_LocEPCOfLocateExtPC::Perform ******/
		/****** md5 signature: 80dee1efa9a81900cc5a0ffc01b29939 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
U0: float

Return
-------
None

Description
-----------
the algorithm is done with the point P. An exception is raised if the fields have not been initialized.
") Perform;
		void Perform(const gp_Pnt & P, const Standard_Real U0);

		/****** Extrema_LocEPCOfLocateExtPC::Point ******/
		/****** md5 signature: cbae88a409f01ccc40b5f6e748da8348 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Return
-------
Extrema_POnCurv

Description
-----------
Returns the point of the extremum distance.
") Point;
		const Extrema_POnCurv & Point();

		/****** Extrema_LocEPCOfLocateExtPC::SquareDistance ******/
		/****** md5 signature: 2eba58521e0603c1ef0e683534b03956 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of the extremum square distance.
") SquareDistance;
		Standard_Real SquareDistance();

};


%extend Extrema_LocEPCOfLocateExtPC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class Extrema_LocEPCOfLocateExtPC2d *
**************************************/
class Extrema_LocEPCOfLocateExtPC2d {
	public:
		/****** Extrema_LocEPCOfLocateExtPC2d::Extrema_LocEPCOfLocateExtPC2d ******/
		/****** md5 signature: f96b86bdfae52ea044299c58e74051b8 ******/
		%feature("compactdefaultargs") Extrema_LocEPCOfLocateExtPC2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_LocEPCOfLocateExtPC2d;
		 Extrema_LocEPCOfLocateExtPC2d();

		/****** Extrema_LocEPCOfLocateExtPC2d::Extrema_LocEPCOfLocateExtPC2d ******/
		/****** md5 signature: 879fbc456e9fc716f88079cbe4c20275 ******/
		%feature("compactdefaultargs") Extrema_LocEPCOfLocateExtPC2d;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d
U0: float
TolU: float

Return
-------
None

Description
-----------
Calculates the distance with a close point. The close point is defined by the parameter value U0. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searches a zero near the close point. TolU is used to decide to stop the iterations. At the nth iteration, the criteria is: abs(Un - Un-1) < TolU.
") Extrema_LocEPCOfLocateExtPC2d;
		 Extrema_LocEPCOfLocateExtPC2d(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C, const Standard_Real U0, const Standard_Real TolU);

		/****** Extrema_LocEPCOfLocateExtPC2d::Extrema_LocEPCOfLocateExtPC2d ******/
		/****** md5 signature: 03740e511e912a1b646a373d0676107f ******/
		%feature("compactdefaultargs") Extrema_LocEPCOfLocateExtPC2d;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d
U0: float
Umin: float
Usup: float
TolU: float

Return
-------
None

Description
-----------
Calculates the distance with a close point. The close point is defined by the parameter value U0. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searches a zero near the close point. Zeros are searched between Umin et Usup. TolU is used to decide to stop the iterations. At the nth iteration, the criteria is: abs(Un - Un-1) < TolU.
") Extrema_LocEPCOfLocateExtPC2d;
		 Extrema_LocEPCOfLocateExtPC2d(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C, const Standard_Real U0, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU);

		/****** Extrema_LocEPCOfLocateExtPC2d::Initialize ******/
		/****** md5 signature: 673c63ed8f08af5bcfdd5ced5f979463 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
Umin: float
Usup: float
TolU: float

Return
-------
None

Description
-----------
sets the fields of the algorithm.
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU);

		/****** Extrema_LocEPCOfLocateExtPC2d::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distance is found.
") IsDone;
		Standard_Boolean IsDone();

		/****** Extrema_LocEPCOfLocateExtPC2d::IsMin ******/
		/****** md5 signature: 1c0b1dbd0d0c10c93cbf9fefce4bad3b ******/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the extremum distance is a minimum.
") IsMin;
		Standard_Boolean IsMin();

		/****** Extrema_LocEPCOfLocateExtPC2d::Perform ******/
		/****** md5 signature: 572d96f228989fec803e5b8f273e32cd ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
U0: float

Return
-------
None

Description
-----------
the algorithm is done with the point P. An exception is raised if the fields have not been initialized.
") Perform;
		void Perform(const gp_Pnt2d & P, const Standard_Real U0);

		/****** Extrema_LocEPCOfLocateExtPC2d::Point ******/
		/****** md5 signature: 0b14be81c893f7916dafa40cecb53c69 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Return
-------
Extrema_POnCurv2d

Description
-----------
Returns the point of the extremum distance.
") Point;
		const Extrema_POnCurv2d & Point();

		/****** Extrema_LocEPCOfLocateExtPC2d::SquareDistance ******/
		/****** md5 signature: 2eba58521e0603c1ef0e683534b03956 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of the extremum square distance.
") SquareDistance;
		Standard_Real SquareDistance();

};


%extend Extrema_LocEPCOfLocateExtPC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Extrema_LocateExtCC *
****************************/
class Extrema_LocateExtCC {
	public:
		/****** Extrema_LocateExtCC::Extrema_LocateExtCC ******/
		/****** md5 signature: c5d4ad63f928f38bacb40f7e1b99f897 ******/
		%feature("compactdefaultargs") Extrema_LocateExtCC;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor3d_Curve
C2: Adaptor3d_Curve
U0: float
V0: float

Return
-------
None

Description
-----------
Calculates the distance with a close point. The close point is defined by a parameter value on each curve. The function F(u,v)=distance(C1(u),C2(v)) has an extremun when gradient(f)=0. The algorithm searches the zero near the close point.
") Extrema_LocateExtCC;
		 Extrema_LocateExtCC(const Adaptor3d_Curve & C1, const Adaptor3d_Curve & C2, const Standard_Real U0, const Standard_Real V0);

		/****** Extrema_LocateExtCC::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distance is found.
") IsDone;
		Standard_Boolean IsDone();

		/****** Extrema_LocateExtCC::Point ******/
		/****** md5 signature: 7be28bf48146b84b5c9a78b62f7a11e6 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
P1: Extrema_POnCurv
P2: Extrema_POnCurv

Return
-------
None

Description
-----------
Returns the points of the extremum distance. P1 is on the first curve, P2 on the second one.
") Point;
		void Point(Extrema_POnCurv & P1, Extrema_POnCurv & P2);

		/****** Extrema_LocateExtCC::SquareDistance ******/
		/****** md5 signature: 2eba58521e0603c1ef0e683534b03956 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of the extremum square distance.
") SquareDistance;
		Standard_Real SquareDistance();

};


%extend Extrema_LocateExtCC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Extrema_LocateExtCC2d *
******************************/
class Extrema_LocateExtCC2d {
	public:
		/****** Extrema_LocateExtCC2d::Extrema_LocateExtCC2d ******/
		/****** md5 signature: aeae2a9a17c936a1feeafeb2cf4c33c0 ******/
		%feature("compactdefaultargs") Extrema_LocateExtCC2d;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d
U0: float
V0: float

Return
-------
None

Description
-----------
Calculates the distance with a close point. The close point is defined by a parameter value on each curve. The function F(u,v)=distance(C1(u),C2(v)) has an extremun when gradient(f)=0. The algorithm searches the zero near the close point.
") Extrema_LocateExtCC2d;
		 Extrema_LocateExtCC2d(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2, const Standard_Real U0, const Standard_Real V0);

		/****** Extrema_LocateExtCC2d::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distance is found.
") IsDone;
		Standard_Boolean IsDone();

		/****** Extrema_LocateExtCC2d::Point ******/
		/****** md5 signature: 22f957435cf6e3814ad63d5f9079e8df ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
P1: Extrema_POnCurv2d
P2: Extrema_POnCurv2d

Return
-------
None

Description
-----------
Returns the points of the extremum distance. P1 is on the first curve, P2 on the second one.
") Point;
		void Point(Extrema_POnCurv2d & P1, Extrema_POnCurv2d & P2);

		/****** Extrema_LocateExtCC2d::SquareDistance ******/
		/****** md5 signature: 2eba58521e0603c1ef0e683534b03956 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of the extremum square distance.
") SquareDistance;
		Standard_Real SquareDistance();

};


%extend Extrema_LocateExtCC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Extrema_LocateExtPC *
****************************/
class Extrema_LocateExtPC {
	public:
		/****** Extrema_LocateExtPC::Extrema_LocateExtPC ******/
		/****** md5 signature: 7eb1e85b77c9c5c50f1db7e44f76ed63 ******/
		%feature("compactdefaultargs") Extrema_LocateExtPC;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_LocateExtPC;
		 Extrema_LocateExtPC();

		/****** Extrema_LocateExtPC::Extrema_LocateExtPC ******/
		/****** md5 signature: 1f82bfa9e68e569fd665333dc6cc52d7 ******/
		%feature("compactdefaultargs") Extrema_LocateExtPC;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
C: Adaptor3d_Curve
U0: float
TolF: float

Return
-------
None

Description
-----------
Calculates the distance with a close point. The close point is defined by the parameter value U0. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searches a zero near the close point. TolF is used to decide to stop the iterations. At the nth iteration, the criteria is: abs(Un - Un-1) < TolF.
") Extrema_LocateExtPC;
		 Extrema_LocateExtPC(const gp_Pnt & P, const Adaptor3d_Curve & C, const Standard_Real U0, const Standard_Real TolF);

		/****** Extrema_LocateExtPC::Extrema_LocateExtPC ******/
		/****** md5 signature: 562aab74aab68868fccddce757fa6257 ******/
		%feature("compactdefaultargs") Extrema_LocateExtPC;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
C: Adaptor3d_Curve
U0: float
Umin: float
Usup: float
TolF: float

Return
-------
None

Description
-----------
Calculates the distance with a close point. The close point is defined by the parameter value U0. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searches a zero near the close point. Zeros are searched between Umin et Usup. TolF is used to decide to stop the iterations. At the nth iteration, the criteria is: abs(Un - Un-1) < TolF.
") Extrema_LocateExtPC;
		 Extrema_LocateExtPC(const gp_Pnt & P, const Adaptor3d_Curve & C, const Standard_Real U0, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolF);

		/****** Extrema_LocateExtPC::Initialize ******/
		/****** md5 signature: 672c2fe8452184af0062847acc5e004d ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
Umin: float
Usup: float
TolF: float

Return
-------
None

Description
-----------
sets the fields of the algorithm.
") Initialize;
		void Initialize(const Adaptor3d_Curve & C, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolF);

		/****** Extrema_LocateExtPC::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distance is found.
") IsDone;
		Standard_Boolean IsDone();

		/****** Extrema_LocateExtPC::IsMin ******/
		/****** md5 signature: 1c0b1dbd0d0c10c93cbf9fefce4bad3b ******/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the extremum distance is a minimum.
") IsMin;
		Standard_Boolean IsMin();

		/****** Extrema_LocateExtPC::Perform ******/
		/****** md5 signature: 80dee1efa9a81900cc5a0ffc01b29939 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
U0: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Pnt & P, const Standard_Real U0);

		/****** Extrema_LocateExtPC::Point ******/
		/****** md5 signature: cbae88a409f01ccc40b5f6e748da8348 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Return
-------
Extrema_POnCurv

Description
-----------
Returns the point of the extremum distance.
") Point;
		const Extrema_POnCurv & Point();

		/****** Extrema_LocateExtPC::SquareDistance ******/
		/****** md5 signature: 2eba58521e0603c1ef0e683534b03956 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of the extremum square distance.
") SquareDistance;
		Standard_Real SquareDistance();

};


%extend Extrema_LocateExtPC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Extrema_LocateExtPC2d *
******************************/
class Extrema_LocateExtPC2d {
	public:
		/****** Extrema_LocateExtPC2d::Extrema_LocateExtPC2d ******/
		/****** md5 signature: 6f5d46eb2a574ff5eff5a750dadcb13b ******/
		%feature("compactdefaultargs") Extrema_LocateExtPC2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_LocateExtPC2d;
		 Extrema_LocateExtPC2d();

		/****** Extrema_LocateExtPC2d::Extrema_LocateExtPC2d ******/
		/****** md5 signature: b4963ac0ef219fdc026e3860d56ab1ff ******/
		%feature("compactdefaultargs") Extrema_LocateExtPC2d;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d
U0: float
TolF: float

Return
-------
None

Description
-----------
Calculates the distance with a close point. The close point is defined by the parameter value U0. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searches a zero near the close point. TolF is used to decide to stop the iterations. At the nth iteration, the criteria is: abs(Un - Un-1) < TolF.
") Extrema_LocateExtPC2d;
		 Extrema_LocateExtPC2d(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C, const Standard_Real U0, const Standard_Real TolF);

		/****** Extrema_LocateExtPC2d::Extrema_LocateExtPC2d ******/
		/****** md5 signature: b92462651cc4a17c9d9664a4fc8748c0 ******/
		%feature("compactdefaultargs") Extrema_LocateExtPC2d;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d
U0: float
Umin: float
Usup: float
TolF: float

Return
-------
None

Description
-----------
Calculates the distance with a close point. The close point is defined by the parameter value U0. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searches a zero near the close point. Zeros are searched between Umin et Usup. TolF is used to decide to stop the iterations. At the nth iteration, the criteria is: abs(Un - Un-1) < TolF.
") Extrema_LocateExtPC2d;
		 Extrema_LocateExtPC2d(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C, const Standard_Real U0, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolF);

		/****** Extrema_LocateExtPC2d::Initialize ******/
		/****** md5 signature: c490b029df4e55930b61cb6254e04484 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
Umin: float
Usup: float
TolF: float

Return
-------
None

Description
-----------
sets the fields of the algorithm.
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolF);

		/****** Extrema_LocateExtPC2d::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distance is found.
") IsDone;
		Standard_Boolean IsDone();

		/****** Extrema_LocateExtPC2d::IsMin ******/
		/****** md5 signature: 1c0b1dbd0d0c10c93cbf9fefce4bad3b ******/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the extremum distance is a minimum.
") IsMin;
		Standard_Boolean IsMin();

		/****** Extrema_LocateExtPC2d::Perform ******/
		/****** md5 signature: 572d96f228989fec803e5b8f273e32cd ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
U0: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Pnt2d & P, const Standard_Real U0);

		/****** Extrema_LocateExtPC2d::Point ******/
		/****** md5 signature: 0b14be81c893f7916dafa40cecb53c69 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Return
-------
Extrema_POnCurv2d

Description
-----------
Returns the point of the extremum distance.
") Point;
		const Extrema_POnCurv2d & Point();

		/****** Extrema_LocateExtPC2d::SquareDistance ******/
		/****** md5 signature: 2eba58521e0603c1ef0e683534b03956 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of the extremum square distance.
") SquareDistance;
		Standard_Real SquareDistance();

};


%extend Extrema_LocateExtPC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class Extrema_PCFOfEPCOfELPCOfLocateExtPC *
********************************************/
class Extrema_PCFOfEPCOfELPCOfLocateExtPC : public math_FunctionWithDerivative {
	public:
		/****** Extrema_PCFOfEPCOfELPCOfLocateExtPC::Extrema_PCFOfEPCOfELPCOfLocateExtPC ******/
		/****** md5 signature: ede7b80994121dc61efd63baf98ea782 ******/
		%feature("compactdefaultargs") Extrema_PCFOfEPCOfELPCOfLocateExtPC;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_PCFOfEPCOfELPCOfLocateExtPC;
		 Extrema_PCFOfEPCOfELPCOfLocateExtPC();

		/****** Extrema_PCFOfEPCOfELPCOfLocateExtPC::Extrema_PCFOfEPCOfELPCOfLocateExtPC ******/
		/****** md5 signature: 512f484f13df650a452c316f30d2b629 ******/
		%feature("compactdefaultargs") Extrema_PCFOfEPCOfELPCOfLocateExtPC;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
C: Adaptor3d_Curve

Return
-------
None

Description
-----------
No available documentation.
") Extrema_PCFOfEPCOfELPCOfLocateExtPC;
		 Extrema_PCFOfEPCOfELPCOfLocateExtPC(const gp_Pnt & P, const Adaptor3d_Curve & C);

		/****** Extrema_PCFOfEPCOfELPCOfLocateExtPC::Derivative ******/
		/****** md5 signature: 74e45b7ef1cb50395f459121235df2cd ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
DF: float

Description
-----------
Calculation of F'(U).
") Derivative;
		Standard_Boolean Derivative(const Standard_Real U, Standard_Real &OutValue);

		/****** Extrema_PCFOfEPCOfELPCOfLocateExtPC::GetStateNumber ******/
		/****** md5 signature: 49c44bd66dd4ec2381671c72ebd88158 ******/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Save the found extremum.
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****** Extrema_PCFOfEPCOfELPCOfLocateExtPC::Initialize ******/
		/****** md5 signature: 96ecca85f670f0aff9194161a9bd5dc1 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
None

Description
-----------
sets the field mycurve of the function.
") Initialize;
		void Initialize(const Adaptor3d_Curve & C);

		/****** Extrema_PCFOfEPCOfELPCOfLocateExtPC::IsMin ******/
		/****** md5 signature: d296cefb075e9db02ee60a375c81a9f6 ******/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Shows if the Nth distance is a minimum.
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****** Extrema_PCFOfEPCOfELPCOfLocateExtPC::NbExt ******/
		/****** md5 signature: 84ada636e4651cacf916eb056265a1d9 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return the number of found extrema.
") NbExt;
		Standard_Integer NbExt();

		/****** Extrema_PCFOfEPCOfELPCOfLocateExtPC::Point ******/
		/****** md5 signature: 1a3c4a6f09c4cb823314eefe5165e75c ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
Extrema_POnCurv

Description
-----------
Returns the Nth extremum.
") Point;
		const Extrema_POnCurv & Point(const Standard_Integer N);

		/****** Extrema_PCFOfEPCOfELPCOfLocateExtPC::SearchOfTolerance ******/
		/****** md5 signature: 73a2a1f7b776ed3aaadf205798ee8767 ******/
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes a Tol value. If 1st derivative of curve |D1|<Tol, it is considered D1=0.
") SearchOfTolerance;
		Standard_Real SearchOfTolerance();

		/****** Extrema_PCFOfEPCOfELPCOfLocateExtPC::SetPoint ******/
		/****** md5 signature: ad83fe26e12bb630222b6d2773210931 ******/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
None

Description
-----------
sets the field P of the function.
") SetPoint;
		void SetPoint(const gp_Pnt & P);

		/****** Extrema_PCFOfEPCOfELPCOfLocateExtPC::SquareDistance ******/
		/****** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
float

Description
-----------
Returns the Nth distance.
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****** Extrema_PCFOfEPCOfELPCOfLocateExtPC::SubIntervalInitialize ******/
		/****** md5 signature: 424565e975e565ea668d16ca9ce728b5 ******/
		%feature("compactdefaultargs") SubIntervalInitialize;
		%feature("autodoc", "
Parameters
----------
theUfirst: float
theUlast: float

Return
-------
None

Description
-----------
Determines boundaries of subinterval for find of root.
") SubIntervalInitialize;
		void SubIntervalInitialize(const Standard_Real theUfirst, const Standard_Real theUlast);

		/****** Extrema_PCFOfEPCOfELPCOfLocateExtPC::Value ******/
		/****** md5 signature: e3462efa1edccfd4021bca61bc42d936 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
F: float

Description
-----------
Calculation of F(U).
") Value;
		Standard_Boolean Value(const Standard_Real U, Standard_Real &OutValue);

		/****** Extrema_PCFOfEPCOfELPCOfLocateExtPC::Values ******/
		/****** md5 signature: a9de0e54fbbad71406954eb825560b84 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
F: float
DF: float

Description
-----------
Calculation of F(U) and F'(U).
") Values;
		Standard_Boolean Values(const Standard_Real U, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend Extrema_PCFOfEPCOfELPCOfLocateExtPC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class Extrema_PCFOfEPCOfELPCOfLocateExtPC2d *
**********************************************/
class Extrema_PCFOfEPCOfELPCOfLocateExtPC2d : public math_FunctionWithDerivative {
	public:
		/****** Extrema_PCFOfEPCOfELPCOfLocateExtPC2d::Extrema_PCFOfEPCOfELPCOfLocateExtPC2d ******/
		/****** md5 signature: f48caab5be52a078e7f90582d9b9dee9 ******/
		%feature("compactdefaultargs") Extrema_PCFOfEPCOfELPCOfLocateExtPC2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_PCFOfEPCOfELPCOfLocateExtPC2d;
		 Extrema_PCFOfEPCOfELPCOfLocateExtPC2d();

		/****** Extrema_PCFOfEPCOfELPCOfLocateExtPC2d::Extrema_PCFOfEPCOfELPCOfLocateExtPC2d ******/
		/****** md5 signature: dec1f8587bce8cd308827800fd89df3b ******/
		%feature("compactdefaultargs") Extrema_PCFOfEPCOfELPCOfLocateExtPC2d;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
No available documentation.
") Extrema_PCFOfEPCOfELPCOfLocateExtPC2d;
		 Extrema_PCFOfEPCOfELPCOfLocateExtPC2d(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C);

		/****** Extrema_PCFOfEPCOfELPCOfLocateExtPC2d::Derivative ******/
		/****** md5 signature: 74e45b7ef1cb50395f459121235df2cd ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
DF: float

Description
-----------
Calculation of F'(U).
") Derivative;
		Standard_Boolean Derivative(const Standard_Real U, Standard_Real &OutValue);

		/****** Extrema_PCFOfEPCOfELPCOfLocateExtPC2d::GetStateNumber ******/
		/****** md5 signature: 49c44bd66dd4ec2381671c72ebd88158 ******/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Save the found extremum.
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****** Extrema_PCFOfEPCOfELPCOfLocateExtPC2d::Initialize ******/
		/****** md5 signature: 295b46cc3c15eb5116b8523fecaa122c ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
sets the field mycurve of the function.
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C);

		/****** Extrema_PCFOfEPCOfELPCOfLocateExtPC2d::IsMin ******/
		/****** md5 signature: d296cefb075e9db02ee60a375c81a9f6 ******/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Shows if the Nth distance is a minimum.
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****** Extrema_PCFOfEPCOfELPCOfLocateExtPC2d::NbExt ******/
		/****** md5 signature: 84ada636e4651cacf916eb056265a1d9 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return the number of found extrema.
") NbExt;
		Standard_Integer NbExt();

		/****** Extrema_PCFOfEPCOfELPCOfLocateExtPC2d::Point ******/
		/****** md5 signature: 6123812027804044a54749cfa19bef5e ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
Extrema_POnCurv2d

Description
-----------
Returns the Nth extremum.
") Point;
		const Extrema_POnCurv2d & Point(const Standard_Integer N);

		/****** Extrema_PCFOfEPCOfELPCOfLocateExtPC2d::SearchOfTolerance ******/
		/****** md5 signature: 73a2a1f7b776ed3aaadf205798ee8767 ******/
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes a Tol value. If 1st derivative of curve |D1|<Tol, it is considered D1=0.
") SearchOfTolerance;
		Standard_Real SearchOfTolerance();

		/****** Extrema_PCFOfEPCOfELPCOfLocateExtPC2d::SetPoint ******/
		/****** md5 signature: 0ad85ba084f338225cb11e827425ab5f ******/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d

Return
-------
None

Description
-----------
sets the field P of the function.
") SetPoint;
		void SetPoint(const gp_Pnt2d & P);

		/****** Extrema_PCFOfEPCOfELPCOfLocateExtPC2d::SquareDistance ******/
		/****** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
float

Description
-----------
Returns the Nth distance.
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****** Extrema_PCFOfEPCOfELPCOfLocateExtPC2d::SubIntervalInitialize ******/
		/****** md5 signature: 424565e975e565ea668d16ca9ce728b5 ******/
		%feature("compactdefaultargs") SubIntervalInitialize;
		%feature("autodoc", "
Parameters
----------
theUfirst: float
theUlast: float

Return
-------
None

Description
-----------
Determines boundaries of subinterval for find of root.
") SubIntervalInitialize;
		void SubIntervalInitialize(const Standard_Real theUfirst, const Standard_Real theUlast);

		/****** Extrema_PCFOfEPCOfELPCOfLocateExtPC2d::Value ******/
		/****** md5 signature: e3462efa1edccfd4021bca61bc42d936 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
F: float

Description
-----------
Calculation of F(U).
") Value;
		Standard_Boolean Value(const Standard_Real U, Standard_Real &OutValue);

		/****** Extrema_PCFOfEPCOfELPCOfLocateExtPC2d::Values ******/
		/****** md5 signature: a9de0e54fbbad71406954eb825560b84 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
F: float
DF: float

Description
-----------
Calculation of F(U) and F'(U).
") Values;
		Standard_Boolean Values(const Standard_Real U, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend Extrema_PCFOfEPCOfELPCOfLocateExtPC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class Extrema_PCFOfEPCOfExtPC *
********************************/
class Extrema_PCFOfEPCOfExtPC : public math_FunctionWithDerivative {
	public:
		/****** Extrema_PCFOfEPCOfExtPC::Extrema_PCFOfEPCOfExtPC ******/
		/****** md5 signature: 0e2b6fe4341dc464005077b2eac0fbda ******/
		%feature("compactdefaultargs") Extrema_PCFOfEPCOfExtPC;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_PCFOfEPCOfExtPC;
		 Extrema_PCFOfEPCOfExtPC();

		/****** Extrema_PCFOfEPCOfExtPC::Extrema_PCFOfEPCOfExtPC ******/
		/****** md5 signature: 4c6b6b2bd19934a2cdb8b9ed141406a1 ******/
		%feature("compactdefaultargs") Extrema_PCFOfEPCOfExtPC;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
C: Adaptor3d_Curve

Return
-------
None

Description
-----------
No available documentation.
") Extrema_PCFOfEPCOfExtPC;
		 Extrema_PCFOfEPCOfExtPC(const gp_Pnt & P, const Adaptor3d_Curve & C);

		/****** Extrema_PCFOfEPCOfExtPC::Derivative ******/
		/****** md5 signature: 74e45b7ef1cb50395f459121235df2cd ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
DF: float

Description
-----------
Calculation of F'(U).
") Derivative;
		Standard_Boolean Derivative(const Standard_Real U, Standard_Real &OutValue);

		/****** Extrema_PCFOfEPCOfExtPC::GetStateNumber ******/
		/****** md5 signature: 49c44bd66dd4ec2381671c72ebd88158 ******/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Save the found extremum.
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****** Extrema_PCFOfEPCOfExtPC::Initialize ******/
		/****** md5 signature: 96ecca85f670f0aff9194161a9bd5dc1 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
None

Description
-----------
sets the field mycurve of the function.
") Initialize;
		void Initialize(const Adaptor3d_Curve & C);

		/****** Extrema_PCFOfEPCOfExtPC::IsMin ******/
		/****** md5 signature: d296cefb075e9db02ee60a375c81a9f6 ******/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Shows if the Nth distance is a minimum.
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****** Extrema_PCFOfEPCOfExtPC::NbExt ******/
		/****** md5 signature: 84ada636e4651cacf916eb056265a1d9 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return the number of found extrema.
") NbExt;
		Standard_Integer NbExt();

		/****** Extrema_PCFOfEPCOfExtPC::Point ******/
		/****** md5 signature: 1a3c4a6f09c4cb823314eefe5165e75c ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
Extrema_POnCurv

Description
-----------
Returns the Nth extremum.
") Point;
		const Extrema_POnCurv & Point(const Standard_Integer N);

		/****** Extrema_PCFOfEPCOfExtPC::SearchOfTolerance ******/
		/****** md5 signature: 73a2a1f7b776ed3aaadf205798ee8767 ******/
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes a Tol value. If 1st derivative of curve |D1|<Tol, it is considered D1=0.
") SearchOfTolerance;
		Standard_Real SearchOfTolerance();

		/****** Extrema_PCFOfEPCOfExtPC::SetPoint ******/
		/****** md5 signature: ad83fe26e12bb630222b6d2773210931 ******/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
None

Description
-----------
sets the field P of the function.
") SetPoint;
		void SetPoint(const gp_Pnt & P);

		/****** Extrema_PCFOfEPCOfExtPC::SquareDistance ******/
		/****** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
float

Description
-----------
Returns the Nth distance.
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****** Extrema_PCFOfEPCOfExtPC::SubIntervalInitialize ******/
		/****** md5 signature: 424565e975e565ea668d16ca9ce728b5 ******/
		%feature("compactdefaultargs") SubIntervalInitialize;
		%feature("autodoc", "
Parameters
----------
theUfirst: float
theUlast: float

Return
-------
None

Description
-----------
Determines boundaries of subinterval for find of root.
") SubIntervalInitialize;
		void SubIntervalInitialize(const Standard_Real theUfirst, const Standard_Real theUlast);

		/****** Extrema_PCFOfEPCOfExtPC::Value ******/
		/****** md5 signature: e3462efa1edccfd4021bca61bc42d936 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
F: float

Description
-----------
Calculation of F(U).
") Value;
		Standard_Boolean Value(const Standard_Real U, Standard_Real &OutValue);

		/****** Extrema_PCFOfEPCOfExtPC::Values ******/
		/****** md5 signature: a9de0e54fbbad71406954eb825560b84 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
F: float
DF: float

Description
-----------
Calculation of F(U) and F'(U).
") Values;
		Standard_Boolean Values(const Standard_Real U, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend Extrema_PCFOfEPCOfExtPC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class Extrema_PCFOfEPCOfExtPC2d *
**********************************/
class Extrema_PCFOfEPCOfExtPC2d : public math_FunctionWithDerivative {
	public:
		/****** Extrema_PCFOfEPCOfExtPC2d::Extrema_PCFOfEPCOfExtPC2d ******/
		/****** md5 signature: fb0bef4d3c9b63de9a04e4e3ac68ae30 ******/
		%feature("compactdefaultargs") Extrema_PCFOfEPCOfExtPC2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_PCFOfEPCOfExtPC2d;
		 Extrema_PCFOfEPCOfExtPC2d();

		/****** Extrema_PCFOfEPCOfExtPC2d::Extrema_PCFOfEPCOfExtPC2d ******/
		/****** md5 signature: 542b619871e1d255c35bea98edf50c0a ******/
		%feature("compactdefaultargs") Extrema_PCFOfEPCOfExtPC2d;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
No available documentation.
") Extrema_PCFOfEPCOfExtPC2d;
		 Extrema_PCFOfEPCOfExtPC2d(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C);

		/****** Extrema_PCFOfEPCOfExtPC2d::Derivative ******/
		/****** md5 signature: 74e45b7ef1cb50395f459121235df2cd ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
DF: float

Description
-----------
Calculation of F'(U).
") Derivative;
		Standard_Boolean Derivative(const Standard_Real U, Standard_Real &OutValue);

		/****** Extrema_PCFOfEPCOfExtPC2d::GetStateNumber ******/
		/****** md5 signature: 49c44bd66dd4ec2381671c72ebd88158 ******/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Save the found extremum.
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****** Extrema_PCFOfEPCOfExtPC2d::Initialize ******/
		/****** md5 signature: 295b46cc3c15eb5116b8523fecaa122c ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
sets the field mycurve of the function.
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C);

		/****** Extrema_PCFOfEPCOfExtPC2d::IsMin ******/
		/****** md5 signature: d296cefb075e9db02ee60a375c81a9f6 ******/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Shows if the Nth distance is a minimum.
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****** Extrema_PCFOfEPCOfExtPC2d::NbExt ******/
		/****** md5 signature: 84ada636e4651cacf916eb056265a1d9 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return the number of found extrema.
") NbExt;
		Standard_Integer NbExt();

		/****** Extrema_PCFOfEPCOfExtPC2d::Point ******/
		/****** md5 signature: 6123812027804044a54749cfa19bef5e ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
Extrema_POnCurv2d

Description
-----------
Returns the Nth extremum.
") Point;
		const Extrema_POnCurv2d & Point(const Standard_Integer N);

		/****** Extrema_PCFOfEPCOfExtPC2d::SearchOfTolerance ******/
		/****** md5 signature: 73a2a1f7b776ed3aaadf205798ee8767 ******/
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes a Tol value. If 1st derivative of curve |D1|<Tol, it is considered D1=0.
") SearchOfTolerance;
		Standard_Real SearchOfTolerance();

		/****** Extrema_PCFOfEPCOfExtPC2d::SetPoint ******/
		/****** md5 signature: 0ad85ba084f338225cb11e827425ab5f ******/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d

Return
-------
None

Description
-----------
sets the field P of the function.
") SetPoint;
		void SetPoint(const gp_Pnt2d & P);

		/****** Extrema_PCFOfEPCOfExtPC2d::SquareDistance ******/
		/****** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
float

Description
-----------
Returns the Nth distance.
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****** Extrema_PCFOfEPCOfExtPC2d::SubIntervalInitialize ******/
		/****** md5 signature: 424565e975e565ea668d16ca9ce728b5 ******/
		%feature("compactdefaultargs") SubIntervalInitialize;
		%feature("autodoc", "
Parameters
----------
theUfirst: float
theUlast: float

Return
-------
None

Description
-----------
Determines boundaries of subinterval for find of root.
") SubIntervalInitialize;
		void SubIntervalInitialize(const Standard_Real theUfirst, const Standard_Real theUlast);

		/****** Extrema_PCFOfEPCOfExtPC2d::Value ******/
		/****** md5 signature: e3462efa1edccfd4021bca61bc42d936 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
F: float

Description
-----------
Calculation of F(U).
") Value;
		Standard_Boolean Value(const Standard_Real U, Standard_Real &OutValue);

		/****** Extrema_PCFOfEPCOfExtPC2d::Values ******/
		/****** md5 signature: a9de0e54fbbad71406954eb825560b84 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
F: float
DF: float

Description
-----------
Calculation of F(U) and F'(U).
") Values;
		Standard_Boolean Values(const Standard_Real U, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend Extrema_PCFOfEPCOfExtPC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class Extrema_PCLocFOfLocEPCOfLocateExtPC *
********************************************/
class Extrema_PCLocFOfLocEPCOfLocateExtPC : public math_FunctionWithDerivative {
	public:
		/****** Extrema_PCLocFOfLocEPCOfLocateExtPC::Extrema_PCLocFOfLocEPCOfLocateExtPC ******/
		/****** md5 signature: 3ad596f7d25ef981146e2321fc0b516f ******/
		%feature("compactdefaultargs") Extrema_PCLocFOfLocEPCOfLocateExtPC;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_PCLocFOfLocEPCOfLocateExtPC;
		 Extrema_PCLocFOfLocEPCOfLocateExtPC();

		/****** Extrema_PCLocFOfLocEPCOfLocateExtPC::Extrema_PCLocFOfLocEPCOfLocateExtPC ******/
		/****** md5 signature: e78e54923ad931caf8e1fdd0fde5e43e ******/
		%feature("compactdefaultargs") Extrema_PCLocFOfLocEPCOfLocateExtPC;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
C: Adaptor3d_Curve

Return
-------
None

Description
-----------
No available documentation.
") Extrema_PCLocFOfLocEPCOfLocateExtPC;
		 Extrema_PCLocFOfLocEPCOfLocateExtPC(const gp_Pnt & P, const Adaptor3d_Curve & C);

		/****** Extrema_PCLocFOfLocEPCOfLocateExtPC::Derivative ******/
		/****** md5 signature: 74e45b7ef1cb50395f459121235df2cd ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
DF: float

Description
-----------
Calculation of F'(U).
") Derivative;
		Standard_Boolean Derivative(const Standard_Real U, Standard_Real &OutValue);

		/****** Extrema_PCLocFOfLocEPCOfLocateExtPC::GetStateNumber ******/
		/****** md5 signature: 49c44bd66dd4ec2381671c72ebd88158 ******/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Save the found extremum.
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****** Extrema_PCLocFOfLocEPCOfLocateExtPC::Initialize ******/
		/****** md5 signature: 96ecca85f670f0aff9194161a9bd5dc1 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
None

Description
-----------
sets the field mycurve of the function.
") Initialize;
		void Initialize(const Adaptor3d_Curve & C);

		/****** Extrema_PCLocFOfLocEPCOfLocateExtPC::IsMin ******/
		/****** md5 signature: d296cefb075e9db02ee60a375c81a9f6 ******/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Shows if the Nth distance is a minimum.
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****** Extrema_PCLocFOfLocEPCOfLocateExtPC::NbExt ******/
		/****** md5 signature: 84ada636e4651cacf916eb056265a1d9 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return the number of found extrema.
") NbExt;
		Standard_Integer NbExt();

		/****** Extrema_PCLocFOfLocEPCOfLocateExtPC::Point ******/
		/****** md5 signature: 1a3c4a6f09c4cb823314eefe5165e75c ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
Extrema_POnCurv

Description
-----------
Returns the Nth extremum.
") Point;
		const Extrema_POnCurv & Point(const Standard_Integer N);

		/****** Extrema_PCLocFOfLocEPCOfLocateExtPC::SearchOfTolerance ******/
		/****** md5 signature: 73a2a1f7b776ed3aaadf205798ee8767 ******/
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes a Tol value. If 1st derivative of curve |D1|<Tol, it is considered D1=0.
") SearchOfTolerance;
		Standard_Real SearchOfTolerance();

		/****** Extrema_PCLocFOfLocEPCOfLocateExtPC::SetPoint ******/
		/****** md5 signature: ad83fe26e12bb630222b6d2773210931 ******/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
None

Description
-----------
sets the field P of the function.
") SetPoint;
		void SetPoint(const gp_Pnt & P);

		/****** Extrema_PCLocFOfLocEPCOfLocateExtPC::SquareDistance ******/
		/****** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
float

Description
-----------
Returns the Nth distance.
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****** Extrema_PCLocFOfLocEPCOfLocateExtPC::SubIntervalInitialize ******/
		/****** md5 signature: 424565e975e565ea668d16ca9ce728b5 ******/
		%feature("compactdefaultargs") SubIntervalInitialize;
		%feature("autodoc", "
Parameters
----------
theUfirst: float
theUlast: float

Return
-------
None

Description
-----------
Determines boundaries of subinterval for find of root.
") SubIntervalInitialize;
		void SubIntervalInitialize(const Standard_Real theUfirst, const Standard_Real theUlast);

		/****** Extrema_PCLocFOfLocEPCOfLocateExtPC::Value ******/
		/****** md5 signature: e3462efa1edccfd4021bca61bc42d936 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
F: float

Description
-----------
Calculation of F(U).
") Value;
		Standard_Boolean Value(const Standard_Real U, Standard_Real &OutValue);

		/****** Extrema_PCLocFOfLocEPCOfLocateExtPC::Values ******/
		/****** md5 signature: a9de0e54fbbad71406954eb825560b84 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
F: float
DF: float

Description
-----------
Calculation of F(U) and F'(U).
") Values;
		Standard_Boolean Values(const Standard_Real U, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend Extrema_PCLocFOfLocEPCOfLocateExtPC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class Extrema_PCLocFOfLocEPCOfLocateExtPC2d *
**********************************************/
class Extrema_PCLocFOfLocEPCOfLocateExtPC2d : public math_FunctionWithDerivative {
	public:
		/****** Extrema_PCLocFOfLocEPCOfLocateExtPC2d::Extrema_PCLocFOfLocEPCOfLocateExtPC2d ******/
		/****** md5 signature: d7725c8d91a5bbff28ab4a7b952bd2b4 ******/
		%feature("compactdefaultargs") Extrema_PCLocFOfLocEPCOfLocateExtPC2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_PCLocFOfLocEPCOfLocateExtPC2d;
		 Extrema_PCLocFOfLocEPCOfLocateExtPC2d();

		/****** Extrema_PCLocFOfLocEPCOfLocateExtPC2d::Extrema_PCLocFOfLocEPCOfLocateExtPC2d ******/
		/****** md5 signature: 31ac1d63745ee80d599024dcffff988f ******/
		%feature("compactdefaultargs") Extrema_PCLocFOfLocEPCOfLocateExtPC2d;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
No available documentation.
") Extrema_PCLocFOfLocEPCOfLocateExtPC2d;
		 Extrema_PCLocFOfLocEPCOfLocateExtPC2d(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C);

		/****** Extrema_PCLocFOfLocEPCOfLocateExtPC2d::Derivative ******/
		/****** md5 signature: 74e45b7ef1cb50395f459121235df2cd ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
DF: float

Description
-----------
Calculation of F'(U).
") Derivative;
		Standard_Boolean Derivative(const Standard_Real U, Standard_Real &OutValue);

		/****** Extrema_PCLocFOfLocEPCOfLocateExtPC2d::GetStateNumber ******/
		/****** md5 signature: 49c44bd66dd4ec2381671c72ebd88158 ******/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Save the found extremum.
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****** Extrema_PCLocFOfLocEPCOfLocateExtPC2d::Initialize ******/
		/****** md5 signature: 295b46cc3c15eb5116b8523fecaa122c ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
sets the field mycurve of the function.
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C);

		/****** Extrema_PCLocFOfLocEPCOfLocateExtPC2d::IsMin ******/
		/****** md5 signature: d296cefb075e9db02ee60a375c81a9f6 ******/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Shows if the Nth distance is a minimum.
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****** Extrema_PCLocFOfLocEPCOfLocateExtPC2d::NbExt ******/
		/****** md5 signature: 84ada636e4651cacf916eb056265a1d9 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return the number of found extrema.
") NbExt;
		Standard_Integer NbExt();

		/****** Extrema_PCLocFOfLocEPCOfLocateExtPC2d::Point ******/
		/****** md5 signature: 6123812027804044a54749cfa19bef5e ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
Extrema_POnCurv2d

Description
-----------
Returns the Nth extremum.
") Point;
		const Extrema_POnCurv2d & Point(const Standard_Integer N);

		/****** Extrema_PCLocFOfLocEPCOfLocateExtPC2d::SearchOfTolerance ******/
		/****** md5 signature: 73a2a1f7b776ed3aaadf205798ee8767 ******/
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes a Tol value. If 1st derivative of curve |D1|<Tol, it is considered D1=0.
") SearchOfTolerance;
		Standard_Real SearchOfTolerance();

		/****** Extrema_PCLocFOfLocEPCOfLocateExtPC2d::SetPoint ******/
		/****** md5 signature: 0ad85ba084f338225cb11e827425ab5f ******/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d

Return
-------
None

Description
-----------
sets the field P of the function.
") SetPoint;
		void SetPoint(const gp_Pnt2d & P);

		/****** Extrema_PCLocFOfLocEPCOfLocateExtPC2d::SquareDistance ******/
		/****** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
float

Description
-----------
Returns the Nth distance.
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****** Extrema_PCLocFOfLocEPCOfLocateExtPC2d::SubIntervalInitialize ******/
		/****** md5 signature: 424565e975e565ea668d16ca9ce728b5 ******/
		%feature("compactdefaultargs") SubIntervalInitialize;
		%feature("autodoc", "
Parameters
----------
theUfirst: float
theUlast: float

Return
-------
None

Description
-----------
Determines boundaries of subinterval for find of root.
") SubIntervalInitialize;
		void SubIntervalInitialize(const Standard_Real theUfirst, const Standard_Real theUlast);

		/****** Extrema_PCLocFOfLocEPCOfLocateExtPC2d::Value ******/
		/****** md5 signature: e3462efa1edccfd4021bca61bc42d936 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
F: float

Description
-----------
Calculation of F(U).
") Value;
		Standard_Boolean Value(const Standard_Real U, Standard_Real &OutValue);

		/****** Extrema_PCLocFOfLocEPCOfLocateExtPC2d::Values ******/
		/****** md5 signature: a9de0e54fbbad71406954eb825560b84 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
F: float
DF: float

Description
-----------
Calculation of F(U) and F'(U).
") Values;
		Standard_Boolean Values(const Standard_Real U, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend Extrema_PCLocFOfLocEPCOfLocateExtPC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Extrema_POnCurv *
************************/
class Extrema_POnCurv {
	public:
		/****** Extrema_POnCurv::Extrema_POnCurv ******/
		/****** md5 signature: 52dfe5963e88211ea2076f961c70509e ******/
		%feature("compactdefaultargs") Extrema_POnCurv;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creation of an indefinite point on curve.
") Extrema_POnCurv;
		 Extrema_POnCurv();

		/****** Extrema_POnCurv::Extrema_POnCurv ******/
		/****** md5 signature: 9f696a7624ca87ff2628d33075aa7788 ******/
		%feature("compactdefaultargs") Extrema_POnCurv;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt

Return
-------
None

Description
-----------
Creation of a point on curve with a parameter value on the curve and a Pnt from gp.
") Extrema_POnCurv;
		 Extrema_POnCurv(const Standard_Real U, const gp_Pnt & P);

		/****** Extrema_POnCurv::Parameter ******/
		/****** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the parameter on the curve.
") Parameter;
		Standard_Real Parameter();

		/****** Extrema_POnCurv::SetValues ******/
		/****** md5 signature: aa1d99b2f7a5b5f72a235b82b7085127 ******/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt

Return
-------
None

Description
-----------
sets the point and parameter values.
") SetValues;
		void SetValues(const Standard_Real U, const gp_Pnt & P);

		/****** Extrema_POnCurv::Value ******/
		/****** md5 signature: eddd2908948849b73f6d8aacab318652 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the point.
") Value;
		const gp_Pnt Value();

};


%extend Extrema_POnCurv {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Extrema_POnCurv2d *
**************************/
class Extrema_POnCurv2d {
	public:
		/****** Extrema_POnCurv2d::Extrema_POnCurv2d ******/
		/****** md5 signature: a63d3ab900ee7945dc1885e5318b0b84 ******/
		%feature("compactdefaultargs") Extrema_POnCurv2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creation of an indefinite point on curve.
") Extrema_POnCurv2d;
		 Extrema_POnCurv2d();

		/****** Extrema_POnCurv2d::Extrema_POnCurv2d ******/
		/****** md5 signature: 847a375a1f0352b5a22d642679cccea7 ******/
		%feature("compactdefaultargs") Extrema_POnCurv2d;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt2d

Return
-------
None

Description
-----------
Creation of a point on curve with a parameter value on the curve and a Pnt from gp.
") Extrema_POnCurv2d;
		 Extrema_POnCurv2d(const Standard_Real U, const gp_Pnt2d & P);

		/****** Extrema_POnCurv2d::Parameter ******/
		/****** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the parameter on the curve.
") Parameter;
		Standard_Real Parameter();

		/****** Extrema_POnCurv2d::SetValues ******/
		/****** md5 signature: 73e81399e0b63647cfa08274d87156c6 ******/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt2d

Return
-------
None

Description
-----------
sets the point and parameter values.
") SetValues;
		void SetValues(const Standard_Real U, const gp_Pnt2d & P);

		/****** Extrema_POnCurv2d::Value ******/
		/****** md5 signature: 01b97600ad700e4edb97bc6008ad0c9b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the point.
") Value;
		const gp_Pnt2d Value();

};


%extend Extrema_POnCurv2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Extrema_POnSurf *
************************/
class Extrema_POnSurf {
	public:
		/****** Extrema_POnSurf::Extrema_POnSurf ******/
		/****** md5 signature: 7a7f9a147e1d8046e0b166e28cee5944 ******/
		%feature("compactdefaultargs") Extrema_POnSurf;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creation of an indefinite point on surface.
") Extrema_POnSurf;
		 Extrema_POnSurf();

		/****** Extrema_POnSurf::Extrema_POnSurf ******/
		/****** md5 signature: 488489f3913a70f368881e2df8c7e89d ******/
		%feature("compactdefaultargs") Extrema_POnSurf;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
P: gp_Pnt

Return
-------
None

Description
-----------
Creation of a point on surface with parameter values on the surface and a Pnt from gp.
") Extrema_POnSurf;
		 Extrema_POnSurf(const Standard_Real U, const Standard_Real V, const gp_Pnt & P);

		/****** Extrema_POnSurf::Parameter ******/
		/****** md5 signature: fcb6dca6c2af6b1cc54badf10520865d ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------

Return
-------
U: float
V: float

Description
-----------
Returns the parameter values on the surface.
") Parameter;
		void Parameter(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Extrema_POnSurf::SetParameters ******/
		/****** md5 signature: 4c240a23953c1ca8e8b266568bf3fefa ******/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "
Parameters
----------
theU: float
theV: float
thePnt: gp_Pnt

Return
-------
None

Description
-----------
Sets the params of current POnSurf instance. (e.g. to the point to be projected).
") SetParameters;
		void SetParameters(const Standard_Real theU, const Standard_Real theV, const gp_Pnt & thePnt);

		/****** Extrema_POnSurf::Value ******/
		/****** md5 signature: eddd2908948849b73f6d8aacab318652 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the 3d point.
") Value;
		const gp_Pnt Value();

};


%extend Extrema_POnSurf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Extrema_POnSurfParams *
******************************/
class Extrema_POnSurfParams : public Extrema_POnSurf {
	public:
		/****** Extrema_POnSurfParams::Extrema_POnSurfParams ******/
		/****** md5 signature: 7ca8b3e55bb725a3ccd8bae5c2b7e034 ******/
		%feature("compactdefaultargs") Extrema_POnSurfParams;
		%feature("autodoc", "Return
-------
None

Description
-----------
empty constructor.
") Extrema_POnSurfParams;
		 Extrema_POnSurfParams();

		/****** Extrema_POnSurfParams::Extrema_POnSurfParams ******/
		/****** md5 signature: 7d6692954a90691fa2bfca78f894059c ******/
		%feature("compactdefaultargs") Extrema_POnSurfParams;
		%feature("autodoc", "
Parameters
----------
theU: float
theV: float
thePnt: gp_Pnt

Return
-------
None

Description
-----------
Creation of a point on surface with parameter values on the surface and a Pnt from gp.
") Extrema_POnSurfParams;
		 Extrema_POnSurfParams(const Standard_Real theU, const Standard_Real theV, const gp_Pnt & thePnt);

		/****** Extrema_POnSurfParams::GetElementType ******/
		/****** md5 signature: 190b208e8025f3833e36ff48d47966dd ******/
		%feature("compactdefaultargs") GetElementType;
		%feature("autodoc", "Return
-------
Extrema_ElementType

Description
-----------
Query the element type on which this point is situated.
") GetElementType;
		Extrema_ElementType GetElementType();

		/****** Extrema_POnSurfParams::GetIndices ******/
		/****** md5 signature: 02a37724aecaea94d73cc242dd683854 ******/
		%feature("compactdefaultargs") GetIndices;
		%feature("autodoc", "
Parameters
----------

Return
-------
theIndexU: int
theIndexV: int

Description
-----------
Query the U and V indices of an element that contains this point.
") GetIndices;
		void GetIndices(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** Extrema_POnSurfParams::GetSqrDistance ******/
		/****** md5 signature: 5f9e48f078be4fe223ad9e4b4bb6c03f ******/
		%feature("compactdefaultargs") GetSqrDistance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Query the square distance from this point to another one.
") GetSqrDistance;
		Standard_Real GetSqrDistance();

		/****** Extrema_POnSurfParams::SetElementType ******/
		/****** md5 signature: 4318662b8606c94578706f86f16f78de ******/
		%feature("compactdefaultargs") SetElementType;
		%feature("autodoc", "
Parameters
----------
theElementType: Extrema_ElementType

Return
-------
None

Description
-----------
Sets the element type on which this point is situated.
") SetElementType;
		void SetElementType(const Extrema_ElementType theElementType);

		/****** Extrema_POnSurfParams::SetIndices ******/
		/****** md5 signature: d6f7eb3492fda15b2bdfa3e6194846e6 ******/
		%feature("compactdefaultargs") SetIndices;
		%feature("autodoc", "
Parameters
----------
theIndexU: int
theIndexV: int

Return
-------
None

Description
-----------
Sets the U and V indices of an element that contains this point.
") SetIndices;
		void SetIndices(const Standard_Integer theIndexU, const Standard_Integer theIndexV);

		/****** Extrema_POnSurfParams::SetSqrDistance ******/
		/****** md5 signature: f5a2aae4a6b8e482a18305426185cc47 ******/
		%feature("compactdefaultargs") SetSqrDistance;
		%feature("autodoc", "
Parameters
----------
theSqrDistance: float

Return
-------
None

Description
-----------
Sets the square distance from this point to another one (e.g. to the point to be projected).
") SetSqrDistance;
		void SetSqrDistance(const Standard_Real theSqrDistance);

};


%extend Extrema_POnSurfParams {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */

class Extrema_HArray1OfPOnCurv : public Extrema_Array1OfPOnCurv, public Standard_Transient {
  public:
    Extrema_HArray1OfPOnCurv(const Standard_Integer theLower, const Standard_Integer theUpper);
    Extrema_HArray1OfPOnCurv(const Standard_Integer theLower, const Standard_Integer theUpper, const Extrema_Array1OfPOnCurv::value_type& theValue);
    Extrema_HArray1OfPOnCurv(const Extrema_Array1OfPOnCurv& theOther);
    const Extrema_Array1OfPOnCurv& Array1();
    Extrema_Array1OfPOnCurv& ChangeArray1();
};
%make_alias(Extrema_HArray1OfPOnCurv)


class Extrema_HArray1OfPOnCurv2d : public Extrema_Array1OfPOnCurv2d, public Standard_Transient {
  public:
    Extrema_HArray1OfPOnCurv2d(const Standard_Integer theLower, const Standard_Integer theUpper);
    Extrema_HArray1OfPOnCurv2d(const Standard_Integer theLower, const Standard_Integer theUpper, const Extrema_Array1OfPOnCurv2d::value_type& theValue);
    Extrema_HArray1OfPOnCurv2d(const Extrema_Array1OfPOnCurv2d& theOther);
    const Extrema_Array1OfPOnCurv2d& Array1();
    Extrema_Array1OfPOnCurv2d& ChangeArray1();
};
%make_alias(Extrema_HArray1OfPOnCurv2d)


class Extrema_HArray1OfPOnSurf : public Extrema_Array1OfPOnSurf, public Standard_Transient {
  public:
    Extrema_HArray1OfPOnSurf(const Standard_Integer theLower, const Standard_Integer theUpper);
    Extrema_HArray1OfPOnSurf(const Standard_Integer theLower, const Standard_Integer theUpper, const Extrema_Array1OfPOnSurf::value_type& theValue);
    Extrema_HArray1OfPOnSurf(const Extrema_Array1OfPOnSurf& theOther);
    const Extrema_Array1OfPOnSurf& Array1();
    Extrema_Array1OfPOnSurf& ChangeArray1();
};
%make_alias(Extrema_HArray1OfPOnSurf)

/* harray2 classes */
class Extrema_HArray2OfPOnCurv : public Extrema_Array2OfPOnCurv, public Standard_Transient {
  public:
    Extrema_HArray2OfPOnCurv(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    Extrema_HArray2OfPOnCurv(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const Extrema_Array2OfPOnCurv::value_type& theValue);
    Extrema_HArray2OfPOnCurv(const Extrema_Array2OfPOnCurv& theOther);
    const Extrema_Array2OfPOnCurv& Array2 ();
    Extrema_Array2OfPOnCurv& ChangeArray2 (); 
};
%make_alias(Extrema_HArray2OfPOnCurv)


class Extrema_HArray2OfPOnCurv2d : public Extrema_Array2OfPOnCurv2d, public Standard_Transient {
  public:
    Extrema_HArray2OfPOnCurv2d(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    Extrema_HArray2OfPOnCurv2d(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const Extrema_Array2OfPOnCurv2d::value_type& theValue);
    Extrema_HArray2OfPOnCurv2d(const Extrema_Array2OfPOnCurv2d& theOther);
    const Extrema_Array2OfPOnCurv2d& Array2 ();
    Extrema_Array2OfPOnCurv2d& ChangeArray2 (); 
};
%make_alias(Extrema_HArray2OfPOnCurv2d)


class Extrema_HArray2OfPOnSurf : public Extrema_Array2OfPOnSurf, public Standard_Transient {
  public:
    Extrema_HArray2OfPOnSurf(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    Extrema_HArray2OfPOnSurf(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const Extrema_Array2OfPOnSurf::value_type& theValue);
    Extrema_HArray2OfPOnSurf(const Extrema_Array2OfPOnSurf& theOther);
    const Extrema_Array2OfPOnSurf& Array2 ();
    Extrema_Array2OfPOnSurf& ChangeArray2 (); 
};
%make_alias(Extrema_HArray2OfPOnSurf)


/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def Extrema_Curve2dTool_BSpline(*args):
	return Extrema_Curve2dTool.BSpline(*args)

@deprecated
def Extrema_Curve2dTool_Bezier(*args):
	return Extrema_Curve2dTool.Bezier(*args)

@deprecated
def Extrema_Curve2dTool_Circle(*args):
	return Extrema_Curve2dTool.Circle(*args)

@deprecated
def Extrema_Curve2dTool_Continuity(*args):
	return Extrema_Curve2dTool.Continuity(*args)

@deprecated
def Extrema_Curve2dTool_D0(*args):
	return Extrema_Curve2dTool.D0(*args)

@deprecated
def Extrema_Curve2dTool_D1(*args):
	return Extrema_Curve2dTool.D1(*args)

@deprecated
def Extrema_Curve2dTool_D2(*args):
	return Extrema_Curve2dTool.D2(*args)

@deprecated
def Extrema_Curve2dTool_D3(*args):
	return Extrema_Curve2dTool.D3(*args)

@deprecated
def Extrema_Curve2dTool_DN(*args):
	return Extrema_Curve2dTool.DN(*args)

@deprecated
def Extrema_Curve2dTool_DeflCurvIntervals(*args):
	return Extrema_Curve2dTool.DeflCurvIntervals(*args)

@deprecated
def Extrema_Curve2dTool_Degree(*args):
	return Extrema_Curve2dTool.Degree(*args)

@deprecated
def Extrema_Curve2dTool_Ellipse(*args):
	return Extrema_Curve2dTool.Ellipse(*args)

@deprecated
def Extrema_Curve2dTool_FirstParameter(*args):
	return Extrema_Curve2dTool.FirstParameter(*args)

@deprecated
def Extrema_Curve2dTool_GetType(*args):
	return Extrema_Curve2dTool.GetType(*args)

@deprecated
def Extrema_Curve2dTool_Hyperbola(*args):
	return Extrema_Curve2dTool.Hyperbola(*args)

@deprecated
def Extrema_Curve2dTool_Intervals(*args):
	return Extrema_Curve2dTool.Intervals(*args)

@deprecated
def Extrema_Curve2dTool_IsClosed(*args):
	return Extrema_Curve2dTool.IsClosed(*args)

@deprecated
def Extrema_Curve2dTool_IsPeriodic(*args):
	return Extrema_Curve2dTool.IsPeriodic(*args)

@deprecated
def Extrema_Curve2dTool_IsRational(*args):
	return Extrema_Curve2dTool.IsRational(*args)

@deprecated
def Extrema_Curve2dTool_LastParameter(*args):
	return Extrema_Curve2dTool.LastParameter(*args)

@deprecated
def Extrema_Curve2dTool_Line(*args):
	return Extrema_Curve2dTool.Line(*args)

@deprecated
def Extrema_Curve2dTool_NbIntervals(*args):
	return Extrema_Curve2dTool.NbIntervals(*args)

@deprecated
def Extrema_Curve2dTool_NbKnots(*args):
	return Extrema_Curve2dTool.NbKnots(*args)

@deprecated
def Extrema_Curve2dTool_NbPoles(*args):
	return Extrema_Curve2dTool.NbPoles(*args)

@deprecated
def Extrema_Curve2dTool_Parabola(*args):
	return Extrema_Curve2dTool.Parabola(*args)

@deprecated
def Extrema_Curve2dTool_Period(*args):
	return Extrema_Curve2dTool.Period(*args)

@deprecated
def Extrema_Curve2dTool_Resolution(*args):
	return Extrema_Curve2dTool.Resolution(*args)

@deprecated
def Extrema_Curve2dTool_Value(*args):
	return Extrema_Curve2dTool.Value(*args)

@deprecated
def Extrema_CurveTool_BSpline(*args):
	return Extrema_CurveTool.BSpline(*args)

@deprecated
def Extrema_CurveTool_Bezier(*args):
	return Extrema_CurveTool.Bezier(*args)

@deprecated
def Extrema_CurveTool_Circle(*args):
	return Extrema_CurveTool.Circle(*args)

@deprecated
def Extrema_CurveTool_Continuity(*args):
	return Extrema_CurveTool.Continuity(*args)

@deprecated
def Extrema_CurveTool_D0(*args):
	return Extrema_CurveTool.D0(*args)

@deprecated
def Extrema_CurveTool_D1(*args):
	return Extrema_CurveTool.D1(*args)

@deprecated
def Extrema_CurveTool_D2(*args):
	return Extrema_CurveTool.D2(*args)

@deprecated
def Extrema_CurveTool_D3(*args):
	return Extrema_CurveTool.D3(*args)

@deprecated
def Extrema_CurveTool_DN(*args):
	return Extrema_CurveTool.DN(*args)

@deprecated
def Extrema_CurveTool_DeflCurvIntervals(*args):
	return Extrema_CurveTool.DeflCurvIntervals(*args)

@deprecated
def Extrema_CurveTool_Degree(*args):
	return Extrema_CurveTool.Degree(*args)

@deprecated
def Extrema_CurveTool_Ellipse(*args):
	return Extrema_CurveTool.Ellipse(*args)

@deprecated
def Extrema_CurveTool_FirstParameter(*args):
	return Extrema_CurveTool.FirstParameter(*args)

@deprecated
def Extrema_CurveTool_GetType(*args):
	return Extrema_CurveTool.GetType(*args)

@deprecated
def Extrema_CurveTool_Hyperbola(*args):
	return Extrema_CurveTool.Hyperbola(*args)

@deprecated
def Extrema_CurveTool_Intervals(*args):
	return Extrema_CurveTool.Intervals(*args)

@deprecated
def Extrema_CurveTool_IsPeriodic(*args):
	return Extrema_CurveTool.IsPeriodic(*args)

@deprecated
def Extrema_CurveTool_IsRational(*args):
	return Extrema_CurveTool.IsRational(*args)

@deprecated
def Extrema_CurveTool_LastParameter(*args):
	return Extrema_CurveTool.LastParameter(*args)

@deprecated
def Extrema_CurveTool_Line(*args):
	return Extrema_CurveTool.Line(*args)

@deprecated
def Extrema_CurveTool_NbIntervals(*args):
	return Extrema_CurveTool.NbIntervals(*args)

@deprecated
def Extrema_CurveTool_NbKnots(*args):
	return Extrema_CurveTool.NbKnots(*args)

@deprecated
def Extrema_CurveTool_NbPoles(*args):
	return Extrema_CurveTool.NbPoles(*args)

@deprecated
def Extrema_CurveTool_Parabola(*args):
	return Extrema_CurveTool.Parabola(*args)

@deprecated
def Extrema_CurveTool_Period(*args):
	return Extrema_CurveTool.Period(*args)

@deprecated
def Extrema_CurveTool_Resolution(*args):
	return Extrema_CurveTool.Resolution(*args)

@deprecated
def Extrema_CurveTool_Value(*args):
	return Extrema_CurveTool.Value(*args)

@deprecated
def Extrema_GenLocateExtPS_IsMinDist(*args):
	return Extrema_GenLocateExtPS.IsMinDist(*args)

}
