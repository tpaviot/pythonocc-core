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
%define EXTREMADOCSTRING
"Extrema module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_extrema.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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
enum Extrema_ExtAlgo {
	Extrema_ExtAlgo_Grad = 0,
	Extrema_ExtAlgo_Tree = 1,
};

enum Extrema_ExtFlag {
	Extrema_ExtFlag_MIN = 0,
	Extrema_ExtFlag_MAX = 1,
	Extrema_ExtFlag_MINMAX = 2,
};

enum Extrema_ElementType {
	Extrema_Node = 0,
	Extrema_UIsoEdge = 1,
	Extrema_VIsoEdge = 2,
	Extrema_Face = 3,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

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

class Extrema_ElementType(IntEnum):
	Extrema_Node = 0
	Extrema_UIsoEdge = 1
	Extrema_VIsoEdge = 2
	Extrema_Face = 3
Extrema_Node = Extrema_ElementType.Extrema_Node
Extrema_UIsoEdge = Extrema_ElementType.Extrema_UIsoEdge
Extrema_VIsoEdge = Extrema_ElementType.Extrema_VIsoEdge
Extrema_Face = Extrema_ElementType.Extrema_Face
};
/* end python proxy for enums */

/* handles */
%wrap_handle(Extrema_ExtPExtS)
%wrap_handle(Extrema_ExtPRevS)
%wrap_handle(Extrema_HArray1OfPOnSurf)
%wrap_handle(Extrema_HArray1OfPOnCurv)
%wrap_handle(Extrema_HArray1OfPOnCurv2d)
%wrap_handle(Extrema_HArray2OfPOnCurv2d)
%wrap_handle(Extrema_HArray2OfPOnCurv)
%wrap_handle(Extrema_HArray2OfPOnSurf)
%wrap_handle(Extrema_HArray2OfPOnSurfParams)
/* end handles declaration */

/* templates */
%template(Extrema_Array1OfPOnCurv) NCollection_Array1<Extrema_POnCurv>;

%extend NCollection_Array1<Extrema_POnCurv> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(Extrema_Array1OfPOnCurv2d) NCollection_Array1<Extrema_POnCurv2d>;

%extend NCollection_Array1<Extrema_POnCurv2d> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(Extrema_Array1OfPOnSurf) NCollection_Array1<Extrema_POnSurf>;

%extend NCollection_Array1<Extrema_POnSurf> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(Extrema_Array2OfPOnCurv) NCollection_Array2<Extrema_POnCurv>;
%template(Extrema_Array2OfPOnCurv2d) NCollection_Array2<Extrema_POnCurv2d>;
%template(Extrema_Array2OfPOnSurf) NCollection_Array2<Extrema_POnSurf>;
%template(Extrema_Array2OfPOnSurfParams) NCollection_Array2<Extrema_POnSurfParams>;
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
		/****************** Extrema_CCLocFOfLocECC ******************/
		/**** md5 signature: 09f07e8318a21d857c0522bf02f9cc94 ****/
		%feature("compactdefaultargs") Extrema_CCLocFOfLocECC;
		%feature("autodoc", "No available documentation.

Parameters
----------
thetol: float,optional
	default value is 1.0e-10

Returns
-------
None
") Extrema_CCLocFOfLocECC;
		 Extrema_CCLocFOfLocECC(const Standard_Real thetol = 1.0e-10);

		/****************** Extrema_CCLocFOfLocECC ******************/
		/**** md5 signature: 090fe2e06cec13f50f51a29baf2ee8ce ****/
		%feature("compactdefaultargs") Extrema_CCLocFOfLocECC;
		%feature("autodoc", "No available documentation.

Parameters
----------
C1: Adaptor3d_Curve
C2: Adaptor3d_Curve
thetol: float,optional
	default value is 1.0e-10

Returns
-------
None
") Extrema_CCLocFOfLocECC;
		 Extrema_CCLocFOfLocECC(const Adaptor3d_Curve & C1, const Adaptor3d_Curve & C2, const Standard_Real thetol = 1.0e-10);

		/****************** CurvePtr ******************/
		/**** md5 signature: 98417ecf956a56db97322adfa51c9321 ****/
		%feature("compactdefaultargs") CurvePtr;
		%feature("autodoc", "Returns a pointer to the curve specified in the constructor or in setcurve() method.

Parameters
----------
theRank: int

Returns
-------
Standard_Address
") CurvePtr;
		Standard_Address CurvePtr(const Standard_Integer theRank);

		/****************** Derivatives ******************/
		/**** md5 signature: 1d38afd641c7de1e5982feb10f2b7ece ****/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "Calculate fi'(u,v).

Parameters
----------
UV: math_Vector
DF: math_Matrix

Returns
-------
bool
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & UV, math_Matrix & DF);

		/****************** GetStateNumber ******************/
		/**** md5 signature: 49c44bd66dd4ec2381671c72ebd88158 ****/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Save the found extremum.

Returns
-------
int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****************** NbEquations ******************/
		/**** md5 signature: 186743efcc98b222ef8f5159fb11b9d2 ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbEquations;
		virtual Standard_Integer NbEquations();

		/****************** NbExt ******************/
		/**** md5 signature: 84ada636e4651cacf916eb056265a1d9 ****/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return the number of found extrema.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** NbVariables ******************/
		/**** md5 signature: 28ab91d0183585502101892aac2c5b98 ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****************** Points ******************/
		/**** md5 signature: 3794ed44489c98c8247e475c96bba9a2 ****/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Return the points of the nth extreme distance.

Parameters
----------
N: int
P1: Extrema_POnCurv
P2: Extrema_POnCurv

Returns
-------
None
") Points;
		void Points(const Standard_Integer N, Extrema_POnCurv & P1, Extrema_POnCurv & P2);

		/****************** SearchOfTolerance ******************/
		/**** md5 signature: 4552b046bde68eb9a19619f431484203 ****/
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "Computes a tol value. if 1st derivative of curve |d1|<tol, it is considered d1=0.

Parameters
----------
C: Standard_Address

Returns
-------
float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance(const Standard_Address C);

		/****************** SetCurve ******************/
		/**** md5 signature: cf01dfc00c20cb696f12c0297a7cad73 ****/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
theRank: int
C1: Adaptor3d_Curve

Returns
-------
None
") SetCurve;
		void SetCurve(const Standard_Integer theRank, const Adaptor3d_Curve & C1);

		/****************** SetTolerance ******************/
		/**** md5 signature: 6e6be0760517a3f5431539a6e86d9f19 ****/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "No available documentation.

Parameters
----------
theTol: float

Returns
-------
None
") SetTolerance;
		void SetTolerance(const Standard_Real theTol);

		/****************** SquareDistance ******************/
		/**** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Return the value of the nth distance.

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****************** SubIntervalInitialize ******************/
		/**** md5 signature: 63a75b85c368de02a3ec6e6d8387c3d9 ****/
		%feature("compactdefaultargs") SubIntervalInitialize;
		%feature("autodoc", "Determines of boundaries of subinterval for find of root.

Parameters
----------
theUfirst: math_Vector
theUlast: math_Vector

Returns
-------
None
") SubIntervalInitialize;
		void SubIntervalInitialize(const math_Vector & theUfirst, const math_Vector & theUlast);

		/****************** Tolerance ******************/
		/**** md5 signature: 9e5775014410d884d1a1adc1cd47930b ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Returns a tolerance specified in the constructor or in settolerance() method.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

		/****************** Value ******************/
		/**** md5 signature: 03c8e8d2d0c02825e7a78c74d4041f96 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Calculate fi(u,v).

Parameters
----------
UV: math_Vector
F: math_Vector

Returns
-------
bool
") Value;
		virtual Standard_Boolean Value(const math_Vector & UV, math_Vector & F);

		/****************** Values ******************/
		/**** md5 signature: aecc35a594e467ec2fc262dd639056f5 ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Calculate fi(u,v) and fi'(u,v).

Parameters
----------
UV: math_Vector
F: math_Vector
DF: math_Matrix

Returns
-------
bool
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
		/****************** Extrema_CCLocFOfLocECC2d ******************/
		/**** md5 signature: e1f7f43c9b7b740af089fcb74aafe995 ****/
		%feature("compactdefaultargs") Extrema_CCLocFOfLocECC2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
thetol: float,optional
	default value is 1.0e-10

Returns
-------
None
") Extrema_CCLocFOfLocECC2d;
		 Extrema_CCLocFOfLocECC2d(const Standard_Real thetol = 1.0e-10);

		/****************** Extrema_CCLocFOfLocECC2d ******************/
		/**** md5 signature: e674268ba5666a0204c98410925aeeb8 ****/
		%feature("compactdefaultargs") Extrema_CCLocFOfLocECC2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d
thetol: float,optional
	default value is 1.0e-10

Returns
-------
None
") Extrema_CCLocFOfLocECC2d;
		 Extrema_CCLocFOfLocECC2d(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2, const Standard_Real thetol = 1.0e-10);

		/****************** CurvePtr ******************/
		/**** md5 signature: 98417ecf956a56db97322adfa51c9321 ****/
		%feature("compactdefaultargs") CurvePtr;
		%feature("autodoc", "Returns a pointer to the curve specified in the constructor or in setcurve() method.

Parameters
----------
theRank: int

Returns
-------
Standard_Address
") CurvePtr;
		Standard_Address CurvePtr(const Standard_Integer theRank);

		/****************** Derivatives ******************/
		/**** md5 signature: 1d38afd641c7de1e5982feb10f2b7ece ****/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "Calculate fi'(u,v).

Parameters
----------
UV: math_Vector
DF: math_Matrix

Returns
-------
bool
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & UV, math_Matrix & DF);

		/****************** GetStateNumber ******************/
		/**** md5 signature: 49c44bd66dd4ec2381671c72ebd88158 ****/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Save the found extremum.

Returns
-------
int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****************** NbEquations ******************/
		/**** md5 signature: 186743efcc98b222ef8f5159fb11b9d2 ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbEquations;
		virtual Standard_Integer NbEquations();

		/****************** NbExt ******************/
		/**** md5 signature: 84ada636e4651cacf916eb056265a1d9 ****/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return the number of found extrema.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** NbVariables ******************/
		/**** md5 signature: 28ab91d0183585502101892aac2c5b98 ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****************** Points ******************/
		/**** md5 signature: b11c393bae576338fc3f288ecb955b49 ****/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Return the points of the nth extreme distance.

Parameters
----------
N: int
P1: Extrema_POnCurv2d
P2: Extrema_POnCurv2d

Returns
-------
None
") Points;
		void Points(const Standard_Integer N, Extrema_POnCurv2d & P1, Extrema_POnCurv2d & P2);

		/****************** SearchOfTolerance ******************/
		/**** md5 signature: 4552b046bde68eb9a19619f431484203 ****/
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "Computes a tol value. if 1st derivative of curve |d1|<tol, it is considered d1=0.

Parameters
----------
C: Standard_Address

Returns
-------
float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance(const Standard_Address C);

		/****************** SetCurve ******************/
		/**** md5 signature: 2374b0cbe8538923ca7a60014f115586 ****/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
theRank: int
C1: Adaptor2d_Curve2d

Returns
-------
None
") SetCurve;
		void SetCurve(const Standard_Integer theRank, const Adaptor2d_Curve2d & C1);

		/****************** SetTolerance ******************/
		/**** md5 signature: 6e6be0760517a3f5431539a6e86d9f19 ****/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "No available documentation.

Parameters
----------
theTol: float

Returns
-------
None
") SetTolerance;
		void SetTolerance(const Standard_Real theTol);

		/****************** SquareDistance ******************/
		/**** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Return the value of the nth distance.

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****************** SubIntervalInitialize ******************/
		/**** md5 signature: 63a75b85c368de02a3ec6e6d8387c3d9 ****/
		%feature("compactdefaultargs") SubIntervalInitialize;
		%feature("autodoc", "Determines of boundaries of subinterval for find of root.

Parameters
----------
theUfirst: math_Vector
theUlast: math_Vector

Returns
-------
None
") SubIntervalInitialize;
		void SubIntervalInitialize(const math_Vector & theUfirst, const math_Vector & theUlast);

		/****************** Tolerance ******************/
		/**** md5 signature: 9e5775014410d884d1a1adc1cd47930b ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Returns a tolerance specified in the constructor or in settolerance() method.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

		/****************** Value ******************/
		/**** md5 signature: 03c8e8d2d0c02825e7a78c74d4041f96 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Calculate fi(u,v).

Parameters
----------
UV: math_Vector
F: math_Vector

Returns
-------
bool
") Value;
		virtual Standard_Boolean Value(const math_Vector & UV, math_Vector & F);

		/****************** Values ******************/
		/**** md5 signature: aecc35a594e467ec2fc262dd639056f5 ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Calculate fi(u,v) and fi'(u,v).

Parameters
----------
UV: math_Vector
F: math_Vector
DF: math_Matrix

Returns
-------
bool
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
		/****************** BSpline ******************/
		/**** md5 signature: c8c4ab959a140651ece46dfbf0baafac ****/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") BSpline;
		static opencascade::handle<Geom2d_BSplineCurve> BSpline(const Adaptor2d_Curve2d & C);

		/****************** Bezier ******************/
		/**** md5 signature: 0cf64b1707a46a532700c7b7c5d83177 ****/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
opencascade::handle<Geom2d_BezierCurve>
") Bezier;
		static opencascade::handle<Geom2d_BezierCurve> Bezier(const Adaptor2d_Curve2d & C);

		/****************** Circle ******************/
		/**** md5 signature: f83d3b524bcebc84f76bd577a264bd65 ****/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
gp_Circ2d
") Circle;
		static gp_Circ2d Circle(const Adaptor2d_Curve2d & C);

		/****************** Continuity ******************/
		/**** md5 signature: 756de29da208da39a83d9e7bd6b260a6 ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
GeomAbs_Shape
") Continuity;
		static GeomAbs_Shape Continuity(const Adaptor2d_Curve2d & C);

		/****************** D0 ******************/
		/**** md5 signature: 2b0f7c6e7628378c5466f63173da2848 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Computes the point of parameter u on the curve.

Parameters
----------
C: Adaptor2d_Curve2d
U: float
P: gp_Pnt2d

Returns
-------
None
") D0;
		static void D0(const Adaptor2d_Curve2d & C, const Standard_Real U, gp_Pnt2d & P);

		/****************** D1 ******************/
		/**** md5 signature: 49247c33066cbc5a32b2fb3a95ae0afc ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Computes the point of parameter u on the curve with its first derivative.

Parameters
----------
C: Adaptor2d_Curve2d
U: float
P: gp_Pnt2d
V: gp_Vec2d

Returns
-------
None
") D1;
		static void D1(const Adaptor2d_Curve2d & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V);

		/****************** D2 ******************/
		/**** md5 signature: b236b6fa3b804f10ec34110bccfb81c1 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the point p of parameter u, the first and second derivatives v1 and v2.

Parameters
----------
C: Adaptor2d_Curve2d
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Returns
-------
None
") D2;
		static void D2(const Adaptor2d_Curve2d & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D3 ******************/
		/**** md5 signature: 675beb36a10809a08c64d732d0ffe85f ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Returns the point p of parameter u, the first, the second and the third derivative.

Parameters
----------
C: Adaptor2d_Curve2d
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Returns
-------
None
") D3;
		static void D3(const Adaptor2d_Curve2d & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** DN ******************/
		/**** md5 signature: 4678c9ac681caad59540990ee359a046 ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "The returned vector gives the value of the derivative for the order of derivation n.

Parameters
----------
C: Adaptor2d_Curve2d
U: float
N: int

Returns
-------
gp_Vec2d
") DN;
		static gp_Vec2d DN(const Adaptor2d_Curve2d & C, const Standard_Real U, const Standard_Integer N);

		/****************** DeflCurvIntervals ******************/
		/**** md5 signature: d98fb15f92669c3bbd8c04f1a9fee06d ****/
		%feature("compactdefaultargs") DeflCurvIntervals;
		%feature("autodoc", "Returns the parameters bounding the intervals of subdivision of curve according to curvature deflection. value of deflection is defined in method. //!.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") DeflCurvIntervals;
		static opencascade::handle<TColStd_HArray1OfReal> DeflCurvIntervals(const Adaptor2d_Curve2d & C);

		/****************** Degree ******************/
		/**** md5 signature: 9581ff0fc0c406a9427befca62ed1f81 ****/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
int
") Degree;
		static Standard_Integer Degree(const Adaptor2d_Curve2d & C);

		/****************** Ellipse ******************/
		/**** md5 signature: 6b3d2146deb980d4d62eb8bafed2a0e1 ****/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
gp_Elips2d
") Ellipse;
		static gp_Elips2d Ellipse(const Adaptor2d_Curve2d & C);

		/****************** FirstParameter ******************/
		/**** md5 signature: 540078107c638c43eb2ce9ec567932d5 ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
float
") FirstParameter;
		static Standard_Real FirstParameter(const Adaptor2d_Curve2d & C);

		/****************** GetType ******************/
		/**** md5 signature: 3307087cce71727ba86c3994c56d1dfd ****/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Returns the type of the curve in the current interval : line, circle, ellipse, hyperbola, parabola, beziercurve, bsplinecurve, othercurve.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
GeomAbs_CurveType
") GetType;
		static GeomAbs_CurveType GetType(const Adaptor2d_Curve2d & C);

		/****************** Hyperbola ******************/
		/**** md5 signature: d765efdcf68c3ccb564b090d516d2f0c ****/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
gp_Hypr2d
") Hyperbola;
		static gp_Hypr2d Hyperbola(const Adaptor2d_Curve2d & C);

		/****************** Intervals ******************/
		/**** md5 signature: b1e1a1a8c70f97665bbcc1237c06a6f1 ****/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>.

Parameters
----------
C: Adaptor2d_Curve2d
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		static void Intervals(const Adaptor2d_Curve2d & C, TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsClosed ******************/
		/**** md5 signature: af597bdc835691e612cee746b4bd3270 ****/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
bool
") IsClosed;
		static Standard_Boolean IsClosed(const Adaptor2d_Curve2d & C);

		/****************** IsPeriodic ******************/
		/**** md5 signature: 24db6e315d488d0546766102053bb345 ****/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
bool
") IsPeriodic;
		static Standard_Boolean IsPeriodic(const Adaptor2d_Curve2d & C);

		/****************** IsRational ******************/
		/**** md5 signature: b7a5237e91dc038400c02d702eb1f8a7 ****/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
bool
") IsRational;
		static Standard_Boolean IsRational(const Adaptor2d_Curve2d & C);

		/****************** LastParameter ******************/
		/**** md5 signature: b0abc948bceff30cc6ea9b7b21deb71b ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
float
") LastParameter;
		static Standard_Real LastParameter(const Adaptor2d_Curve2d & C);

		/****************** Line ******************/
		/**** md5 signature: 2ed473b8b806549a67acbbb8f7054334 ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
gp_Lin2d
") Line;
		static gp_Lin2d Line(const Adaptor2d_Curve2d & C);

		/****************** NbIntervals ******************/
		/**** md5 signature: e1f641c900ddcc6ebfcb0a34162a4afb ****/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "If necessary, breaks the curve in intervals of continuity <s>. and returns the number of intervals.

Parameters
----------
C: Adaptor2d_Curve2d
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		static Standard_Integer NbIntervals(const Adaptor2d_Curve2d & C, const GeomAbs_Shape S);

		/****************** NbKnots ******************/
		/**** md5 signature: 37351d3297158df30ae272b9db01eb21 ****/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
int
") NbKnots;
		static Standard_Integer NbKnots(const Adaptor2d_Curve2d & C);

		/****************** NbPoles ******************/
		/**** md5 signature: fea21d4a9552d51c1cb56925fc498f25 ****/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
int
") NbPoles;
		static Standard_Integer NbPoles(const Adaptor2d_Curve2d & C);

		/****************** Parabola ******************/
		/**** md5 signature: 91ce2d6bffca5cc115a4e157ac689f40 ****/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
gp_Parab2d
") Parabola;
		static gp_Parab2d Parabola(const Adaptor2d_Curve2d & C);

		/****************** Period ******************/
		/**** md5 signature: 3aff9e7fed8d10f77180b7a8f565b0b4 ****/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
float
") Period;
		static Standard_Real Period(const Adaptor2d_Curve2d & C);

		/****************** Resolution ******************/
		/**** md5 signature: 00a506daa8f861d461577823de6c7258 ****/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Returns the parametric resolution corresponding to the real space resolution <r3d>.

Parameters
----------
C: Adaptor2d_Curve2d
R3d: float

Returns
-------
float
") Resolution;
		static Standard_Real Resolution(const Adaptor2d_Curve2d & C, const Standard_Real R3d);

		/****************** Value ******************/
		/**** md5 signature: 37d2c86e90009879ed2d64d1f3352009 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the point of parameter u on the curve.

Parameters
----------
C: Adaptor2d_Curve2d
U: float

Returns
-------
gp_Pnt2d
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
		/****************** BSpline ******************/
		/**** md5 signature: 0c97f5be576526bd2daa9dec9dbdbefd ****/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
opencascade::handle<Geom_BSplineCurve>
") BSpline;
		static opencascade::handle<Geom_BSplineCurve> BSpline(const Adaptor3d_Curve & C);

		/****************** Bezier ******************/
		/**** md5 signature: 818858a1835fa105b6c3f6c15c796eed ****/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
opencascade::handle<Geom_BezierCurve>
") Bezier;
		static opencascade::handle<Geom_BezierCurve> Bezier(const Adaptor3d_Curve & C);

		/****************** Circle ******************/
		/**** md5 signature: 69b4a6562099293989c9032df5001e91 ****/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
gp_Circ
") Circle;
		static gp_Circ Circle(const Adaptor3d_Curve & C);

		/****************** Continuity ******************/
		/**** md5 signature: 7e3ab45085c5f6763876998f88c878c5 ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
GeomAbs_Shape
") Continuity;
		static GeomAbs_Shape Continuity(const Adaptor3d_Curve & C);

		/****************** D0 ******************/
		/**** md5 signature: bafe9e6acd4c5d61df1a191fd96c9541 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve
U: float
P: gp_Pnt

Returns
-------
None
") D0;
		static void D0(const Adaptor3d_Curve & C, const Standard_Real U, gp_Pnt & P);

		/****************** D1 ******************/
		/**** md5 signature: fe354aa20e6dc4f07e87f863f08729f7 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve
U: float
P: gp_Pnt
V: gp_Vec

Returns
-------
None
") D1;
		static void D1(const Adaptor3d_Curve & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V);

		/****************** D2 ******************/
		/**** md5 signature: 364d76815f0a3ff8c8c8acda8f073f20 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Returns
-------
None
") D2;
		static void D2(const Adaptor3d_Curve & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****************** D3 ******************/
		/**** md5 signature: fe4e9f030699b826155158b744eeede4 ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Returns
-------
None
") D3;
		static void D3(const Adaptor3d_Curve & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****************** DN ******************/
		/**** md5 signature: 43f589f46832d631a9b5b3dcd80b303c ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve
U: float
N: int

Returns
-------
gp_Vec
") DN;
		static gp_Vec DN(const Adaptor3d_Curve & C, const Standard_Real U, const Standard_Integer N);

		/****************** DeflCurvIntervals ******************/
		/**** md5 signature: a4626f43eaff2e9612562e3bb29a67aa ****/
		%feature("compactdefaultargs") DeflCurvIntervals;
		%feature("autodoc", "Returns the parameters bounding the intervals of subdivision of curve according to curvature deflection. value of deflection is defined in method. //!.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") DeflCurvIntervals;
		static opencascade::handle<TColStd_HArray1OfReal> DeflCurvIntervals(const Adaptor3d_Curve & C);

		/****************** Degree ******************/
		/**** md5 signature: 4c8f00f81dc52f68c21806e707a3a7b9 ****/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
int
") Degree;
		static Standard_Integer Degree(const Adaptor3d_Curve & C);

		/****************** Ellipse ******************/
		/**** md5 signature: 921b94563d156d37bbb656506389cb01 ****/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
gp_Elips
") Ellipse;
		static gp_Elips Ellipse(const Adaptor3d_Curve & C);

		/****************** FirstParameter ******************/
		/**** md5 signature: 6cea3f5c9c492795d465235a10707515 ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
float
") FirstParameter;
		static Standard_Real FirstParameter(const Adaptor3d_Curve & C);

		/****************** GetType ******************/
		/**** md5 signature: 479ad1024af3da76cf1162450cb47079 ****/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
GeomAbs_CurveType
") GetType;
		static GeomAbs_CurveType GetType(const Adaptor3d_Curve & C);

		/****************** Hyperbola ******************/
		/**** md5 signature: 1dd05079123580f2ca71a6f30ca02156 ****/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
gp_Hypr
") Hyperbola;
		static gp_Hypr Hyperbola(const Adaptor3d_Curve & C);

		/****************** Intervals ******************/
		/**** md5 signature: c59b411ed8f13aec3361e6336ed8b81f ****/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
C: Adaptor3d_Curve
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		static void Intervals(Adaptor3d_Curve & C, TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsPeriodic ******************/
		/**** md5 signature: d31f3b4c79afd1942bdd2c78fb2fb259 ****/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
bool
") IsPeriodic;
		static Standard_Boolean IsPeriodic(const Adaptor3d_Curve & C);

		/****************** IsRational ******************/
		/**** md5 signature: 25abf33ff4df5410bf8f820a1547a5e0 ****/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
bool
") IsRational;
		static Standard_Boolean IsRational(const Adaptor3d_Curve & C);

		/****************** LastParameter ******************/
		/**** md5 signature: 2d16a1cb309605946ea3c6ea6342ebc3 ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
float
") LastParameter;
		static Standard_Real LastParameter(const Adaptor3d_Curve & C);

		/****************** Line ******************/
		/**** md5 signature: 1a7b33fceb2ec97542564608da5f590a ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
gp_Lin
") Line;
		static gp_Lin Line(const Adaptor3d_Curve & C);

		/****************** NbIntervals ******************/
		/**** md5 signature: cf97edf44110186eab92181c085ae1f7 ****/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

Parameters
----------
C: Adaptor3d_Curve
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		static Standard_Integer NbIntervals(Adaptor3d_Curve & C, const GeomAbs_Shape S);

		/****************** NbKnots ******************/
		/**** md5 signature: a42e66d711c34ebe3ab41b1a70f28759 ****/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
int
") NbKnots;
		static Standard_Integer NbKnots(const Adaptor3d_Curve & C);

		/****************** NbPoles ******************/
		/**** md5 signature: 3ed8b75caa9bfe8c6840308a79b6a2d8 ****/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
int
") NbPoles;
		static Standard_Integer NbPoles(const Adaptor3d_Curve & C);

		/****************** Parabola ******************/
		/**** md5 signature: 4462340c3f523d2746c330836fcf6c5c ****/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
gp_Parab
") Parabola;
		static gp_Parab Parabola(const Adaptor3d_Curve & C);

		/****************** Period ******************/
		/**** md5 signature: bc233dfa3cea6c38ee569617bbb51465 ****/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
float
") Period;
		static Standard_Real Period(const Adaptor3d_Curve & C);

		/****************** Resolution ******************/
		/**** md5 signature: a7f94e2f406fae25aaf1a3f45a6f3d9f ****/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve
R3d: float

Returns
-------
float
") Resolution;
		static Standard_Real Resolution(const Adaptor3d_Curve & C, const Standard_Real R3d);

		/****************** Value ******************/
		/**** md5 signature: 0488ad36e3eab18004f93749270bbdec ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve
U: float

Returns
-------
gp_Pnt
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
		/****************** Extrema_ECC ******************/
		/**** md5 signature: f1d52defa9b50dd53f39dc64992c57fb ****/
		%feature("compactdefaultargs") Extrema_ECC;
		%feature("autodoc", "Calculates all the distances as above between uinf and usup for c1 and between vinf and vsup for c2.

Returns
-------
None
") Extrema_ECC;
		 Extrema_ECC();

		/****************** Extrema_ECC ******************/
		/**** md5 signature: c8c401f587043bb48010e54044b8b10d ****/
		%feature("compactdefaultargs") Extrema_ECC;
		%feature("autodoc", "It calculates all the distances. the function f(u,v)=distance(c1(u),c2(v)) has an extremum when gradient(f)=0. the algorithm uses evtushenko's global optimization solver.

Parameters
----------
C1: Adaptor3d_Curve
C2: Adaptor3d_Curve

Returns
-------
None
") Extrema_ECC;
		 Extrema_ECC(const Adaptor3d_Curve & C1, const Adaptor3d_Curve & C2);

		/****************** Extrema_ECC ******************/
		/**** md5 signature: 4d4fa8be0cc0769d1a7a82bbcda8a7d0 ****/
		%feature("compactdefaultargs") Extrema_ECC;
		%feature("autodoc", "Calculates all the distances as above between uinf and usup for c1 and between vinf and vsup for c2.

Parameters
----------
C1: Adaptor3d_Curve
C2: Adaptor3d_Curve
Uinf: float
Usup: float
Vinf: float
Vsup: float

Returns
-------
None
") Extrema_ECC;
		 Extrema_ECC(const Adaptor3d_Curve & C1, const Adaptor3d_Curve & C2, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real Vinf, const Standard_Real Vsup);

		/****************** GetSingleSolutionFlag ******************/
		/**** md5 signature: b28121e257a0efb9e2c6c13cf0ce823d ****/
		%feature("compactdefaultargs") GetSingleSolutionFlag;
		%feature("autodoc", "Get flag for single extrema computation. works on parametric solver only.

Returns
-------
bool
") GetSingleSolutionFlag;
		Standard_Boolean GetSingleSolutionFlag();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsParallel ******************/
		/**** md5 signature: 47a312fd58e74bf5bb8a9bb6f0484dfb ****/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Returns state of myparallel flag.

Returns
-------
bool
") IsParallel;
		Standard_Boolean IsParallel();

		/****************** NbExt ******************/
		/**** md5 signature: 84ada636e4651cacf916eb056265a1d9 ****/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		/**** md5 signature: c04b01412cba7220c024b5eb4532697f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs calculations.

Returns
-------
None
") Perform;
		void Perform();

		/****************** Points ******************/
		/**** md5 signature: 3794ed44489c98c8247e475c96bba9a2 ****/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Returns the points of the nth extremum distance. p1 is on the first curve, p2 on the second one.

Parameters
----------
N: int
P1: Extrema_POnCurv
P2: Extrema_POnCurv

Returns
-------
None
") Points;
		void Points(const Standard_Integer N, Extrema_POnCurv & P1, Extrema_POnCurv & P2);

		/****************** SetParams ******************/
		/**** md5 signature: ef14d1cd32f692d88e1fd4c3ca54a0fb ****/
		%feature("compactdefaultargs") SetParams;
		%feature("autodoc", "Set params in case of empty constructor is usage.

Parameters
----------
C1: Adaptor3d_Curve
C2: Adaptor3d_Curve
Uinf: float
Usup: float
Vinf: float
Vsup: float

Returns
-------
None
") SetParams;
		void SetParams(const Adaptor3d_Curve & C1, const Adaptor3d_Curve & C2, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real Vinf, const Standard_Real Vsup);

		/****************** SetSingleSolutionFlag ******************/
		/**** md5 signature: 7fa45b94e509fd90dd043f395439167b ****/
		%feature("compactdefaultargs") SetSingleSolutionFlag;
		%feature("autodoc", "Set flag for single extrema computation. works on parametric solver only.

Parameters
----------
theSingleSolutionFlag: bool

Returns
-------
None
") SetSingleSolutionFlag;
		void SetSingleSolutionFlag(const Standard_Boolean theSingleSolutionFlag);

		/****************** SetTolerance ******************/
		/**** md5 signature: fc6e9b0c16aebccb1a4d05571a3e6ef6 ****/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tol: float

Returns
-------
None
") SetTolerance;
		void SetTolerance(const Standard_Real Tol);

		/****************** SquareDistance ******************/
		/**** md5 signature: badb2a0561651254031917071ad28398 ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the nth square extremum distance.

Parameters
----------
N: int,optional
	default value is 1

Returns
-------
float
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
		/****************** Extrema_ECC2d ******************/
		/**** md5 signature: 4d25e00e56aacaff607db9accfe3c80c ****/
		%feature("compactdefaultargs") Extrema_ECC2d;
		%feature("autodoc", "Calculates all the distances as above between uinf and usup for c1 and between vinf and vsup for c2.

Returns
-------
None
") Extrema_ECC2d;
		 Extrema_ECC2d();

		/****************** Extrema_ECC2d ******************/
		/**** md5 signature: 18ec7cc19510c225f86e12c62cee018b ****/
		%feature("compactdefaultargs") Extrema_ECC2d;
		%feature("autodoc", "It calculates all the distances. the function f(u,v)=distance(c1(u),c2(v)) has an extremum when gradient(f)=0. the algorithm uses evtushenko's global optimization solver.

Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d

Returns
-------
None
") Extrema_ECC2d;
		 Extrema_ECC2d(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2);

		/****************** Extrema_ECC2d ******************/
		/**** md5 signature: 7753d66a8f0966ab829d7285b21dc28c ****/
		%feature("compactdefaultargs") Extrema_ECC2d;
		%feature("autodoc", "Calculates all the distances as above between uinf and usup for c1 and between vinf and vsup for c2.

Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d
Uinf: float
Usup: float
Vinf: float
Vsup: float

Returns
-------
None
") Extrema_ECC2d;
		 Extrema_ECC2d(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real Vinf, const Standard_Real Vsup);

		/****************** GetSingleSolutionFlag ******************/
		/**** md5 signature: b28121e257a0efb9e2c6c13cf0ce823d ****/
		%feature("compactdefaultargs") GetSingleSolutionFlag;
		%feature("autodoc", "Get flag for single extrema computation. works on parametric solver only.

Returns
-------
bool
") GetSingleSolutionFlag;
		Standard_Boolean GetSingleSolutionFlag();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsParallel ******************/
		/**** md5 signature: 47a312fd58e74bf5bb8a9bb6f0484dfb ****/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Returns state of myparallel flag.

Returns
-------
bool
") IsParallel;
		Standard_Boolean IsParallel();

		/****************** NbExt ******************/
		/**** md5 signature: 84ada636e4651cacf916eb056265a1d9 ****/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		/**** md5 signature: c04b01412cba7220c024b5eb4532697f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs calculations.

Returns
-------
None
") Perform;
		void Perform();

		/****************** Points ******************/
		/**** md5 signature: b11c393bae576338fc3f288ecb955b49 ****/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Returns the points of the nth extremum distance. p1 is on the first curve, p2 on the second one.

Parameters
----------
N: int
P1: Extrema_POnCurv2d
P2: Extrema_POnCurv2d

Returns
-------
None
") Points;
		void Points(const Standard_Integer N, Extrema_POnCurv2d & P1, Extrema_POnCurv2d & P2);

		/****************** SetParams ******************/
		/**** md5 signature: c22ecde336403c4ef664a23c1a078cbc ****/
		%feature("compactdefaultargs") SetParams;
		%feature("autodoc", "Set params in case of empty constructor is usage.

Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d
Uinf: float
Usup: float
Vinf: float
Vsup: float

Returns
-------
None
") SetParams;
		void SetParams(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real Vinf, const Standard_Real Vsup);

		/****************** SetSingleSolutionFlag ******************/
		/**** md5 signature: 7fa45b94e509fd90dd043f395439167b ****/
		%feature("compactdefaultargs") SetSingleSolutionFlag;
		%feature("autodoc", "Set flag for single extrema computation. works on parametric solver only.

Parameters
----------
theSingleSolutionFlag: bool

Returns
-------
None
") SetSingleSolutionFlag;
		void SetSingleSolutionFlag(const Standard_Boolean theSingleSolutionFlag);

		/****************** SetTolerance ******************/
		/**** md5 signature: fc6e9b0c16aebccb1a4d05571a3e6ef6 ****/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tol: float

Returns
-------
None
") SetTolerance;
		void SetTolerance(const Standard_Real Tol);

		/****************** SquareDistance ******************/
		/**** md5 signature: badb2a0561651254031917071ad28398 ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the nth square extremum distance.

Parameters
----------
N: int,optional
	default value is 1

Returns
-------
float
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
		/****************** Extrema_ELPCOfLocateExtPC ******************/
		/**** md5 signature: bb936d9df0f63ec27b8e8023e08cd843 ****/
		%feature("compactdefaultargs") Extrema_ELPCOfLocateExtPC;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_ELPCOfLocateExtPC;
		 Extrema_ELPCOfLocateExtPC();

		/****************** Extrema_ELPCOfLocateExtPC ******************/
		/**** md5 signature: 5eb013e4fc68fcbf6f33585765f7e07d ****/
		%feature("compactdefaultargs") Extrema_ELPCOfLocateExtPC;
		%feature("autodoc", "It calculates all the distances. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs all the zeros inside the definition range of the curve. zeros are searched between uinf and usup. tol is used to decide to stop the iterations according to the following condition: if n is the number of iterations, the algorithm stops when abs(f(un)-f(un-1)) < tol.

Parameters
----------
P: gp_Pnt
C: Adaptor3d_Curve
Uinf: float
Usup: float
TolF: float,optional
	default value is 1.0e-10

Returns
-------
None
") Extrema_ELPCOfLocateExtPC;
		 Extrema_ELPCOfLocateExtPC(const gp_Pnt & P, const Adaptor3d_Curve & C, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real TolF = 1.0e-10);

		/****************** Extrema_ELPCOfLocateExtPC ******************/
		/**** md5 signature: ead97d1e3f13344482279c11cf20d92f ****/
		%feature("compactdefaultargs") Extrema_ELPCOfLocateExtPC;
		%feature("autodoc", "It calculates all the distances. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs all the zeros inside the definition range of the curve. tol is used to decide to stop the iterations according to the following condition: if n is the number of iterations, the algorithm stops when abs(f(un)-f(un-1)) < tol.

Parameters
----------
P: gp_Pnt
C: Adaptor3d_Curve
TolF: float,optional
	default value is 1.0e-10

Returns
-------
None
") Extrema_ELPCOfLocateExtPC;
		 Extrema_ELPCOfLocateExtPC(const gp_Pnt & P, const Adaptor3d_Curve & C, const Standard_Real TolF = 1.0e-10);

		/****************** Initialize ******************/
		/**** md5 signature: 6ac5bc3f72e0a8236c8f51c23167f9f5 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initializes the fields of the algorithm.

Parameters
----------
C: Adaptor3d_Curve
Uinf: float
Usup: float
TolF: float,optional
	default value is 1.0e-10

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & C, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real TolF = 1.0e-10);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "True if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsMin ******************/
		/**** md5 signature: d296cefb075e9db02ee60a375c81a9f6 ****/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Returns true if the <n>th extremum distance is a minimum.

Parameters
----------
N: int

Returns
-------
bool
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****************** NbExt ******************/
		/**** md5 signature: 84ada636e4651cacf916eb056265a1d9 ****/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		/**** md5 signature: 5f5e57fd55ba2b5f8e2b2be09861a3f9 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "An exception is raised if the fields have not been initialized.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt & P);

		/****************** Point ******************/
		/**** md5 signature: 1a3c4a6f09c4cb823314eefe5165e75c ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of the <n>th extremum distance.

Parameters
----------
N: int

Returns
-------
Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point(const Standard_Integer N);

		/****************** SquareDistance ******************/
		/**** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the <n>th extremum square distance.

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****************** TrimmedSquareDistances ******************/
		/**** md5 signature: 2e689901655c68a486db722f362ab27b ****/
		%feature("compactdefaultargs") TrimmedSquareDistances;
		%feature("autodoc", "If the curve is a trimmed curve, dist1 is a square distance between <p> and the point of parameter firstparameter <p1> and dist2 is a square distance between <p> and the point of parameter lastparameter <p2>.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
dist1: float
dist2: float
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
		/****************** Extrema_ELPCOfLocateExtPC2d ******************/
		/**** md5 signature: 8f092e293eefb4dd4a9f9ca1c996abcb ****/
		%feature("compactdefaultargs") Extrema_ELPCOfLocateExtPC2d;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_ELPCOfLocateExtPC2d;
		 Extrema_ELPCOfLocateExtPC2d();

		/****************** Extrema_ELPCOfLocateExtPC2d ******************/
		/**** md5 signature: ca7ed58355df77b568d0d2b8e4c4d3b5 ****/
		%feature("compactdefaultargs") Extrema_ELPCOfLocateExtPC2d;
		%feature("autodoc", "It calculates all the distances. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs all the zeros inside the definition range of the curve. zeros are searched between uinf and usup. tol is used to decide to stop the iterations according to the following condition: if n is the number of iterations, the algorithm stops when abs(f(un)-f(un-1)) < tol.

Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d
Uinf: float
Usup: float
TolF: float,optional
	default value is 1.0e-10

Returns
-------
None
") Extrema_ELPCOfLocateExtPC2d;
		 Extrema_ELPCOfLocateExtPC2d(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real TolF = 1.0e-10);

		/****************** Extrema_ELPCOfLocateExtPC2d ******************/
		/**** md5 signature: 9ae6c47d8acbe1e37a56bc7bb09b19cd ****/
		%feature("compactdefaultargs") Extrema_ELPCOfLocateExtPC2d;
		%feature("autodoc", "It calculates all the distances. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs all the zeros inside the definition range of the curve. tol is used to decide to stop the iterations according to the following condition: if n is the number of iterations, the algorithm stops when abs(f(un)-f(un-1)) < tol.

Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d
TolF: float,optional
	default value is 1.0e-10

Returns
-------
None
") Extrema_ELPCOfLocateExtPC2d;
		 Extrema_ELPCOfLocateExtPC2d(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C, const Standard_Real TolF = 1.0e-10);

		/****************** Initialize ******************/
		/**** md5 signature: be89f8d1b5b5ecf504acd30e1f24f787 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initializes the fields of the algorithm.

Parameters
----------
C: Adaptor2d_Curve2d
Uinf: float
Usup: float
TolF: float,optional
	default value is 1.0e-10

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real TolF = 1.0e-10);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "True if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsMin ******************/
		/**** md5 signature: d296cefb075e9db02ee60a375c81a9f6 ****/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Returns true if the <n>th extremum distance is a minimum.

Parameters
----------
N: int

Returns
-------
bool
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****************** NbExt ******************/
		/**** md5 signature: 84ada636e4651cacf916eb056265a1d9 ****/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		/**** md5 signature: 59fee48271d5ac79a6de2fe73317998c ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "An exception is raised if the fields have not been initialized.

Parameters
----------
P: gp_Pnt2d

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt2d & P);

		/****************** Point ******************/
		/**** md5 signature: 6123812027804044a54749cfa19bef5e ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of the <n>th extremum distance.

Parameters
----------
N: int

Returns
-------
Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point(const Standard_Integer N);

		/****************** SquareDistance ******************/
		/**** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the <n>th extremum square distance.

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****************** TrimmedSquareDistances ******************/
		/**** md5 signature: d92e1ba45ead5acc8c7f33976cfdf6e6 ****/
		%feature("compactdefaultargs") TrimmedSquareDistances;
		%feature("autodoc", "If the curve is a trimmed curve, dist1 is a square distance between <p> and the point of parameter firstparameter <p1> and dist2 is a square distance between <p> and the point of parameter lastparameter <p2>.

Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d

Returns
-------
dist1: float
dist2: float
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
		/****************** Extrema_EPCOfELPCOfLocateExtPC ******************/
		/**** md5 signature: d031d7ce7ee4902c782ca863539576de ****/
		%feature("compactdefaultargs") Extrema_EPCOfELPCOfLocateExtPC;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_EPCOfELPCOfLocateExtPC;
		 Extrema_EPCOfELPCOfLocateExtPC();

		/****************** Extrema_EPCOfELPCOfLocateExtPC ******************/
		/**** md5 signature: 909eda134dca8bd066edf6f295b1a9d2 ****/
		%feature("compactdefaultargs") Extrema_EPCOfELPCOfLocateExtPC;
		%feature("autodoc", "It calculates all the distances. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs all the zeros inside the definition range of the curve. nbu is used to locate the close points to find the zeros. tol and tolu are used to decide to stop the iterations according to the following condition: if n is the number of iterations, abs(un-un-1) < tolu and abs(f(un)-f(un-1)) < tol.

Parameters
----------
P: gp_Pnt
C: Adaptor3d_Curve
NbU: int
TolU: float
TolF: float

Returns
-------
None
") Extrema_EPCOfELPCOfLocateExtPC;
		 Extrema_EPCOfELPCOfLocateExtPC(const gp_Pnt & P, const Adaptor3d_Curve & C, const Standard_Integer NbU, const Standard_Real TolU, const Standard_Real TolF);

		/****************** Extrema_EPCOfELPCOfLocateExtPC ******************/
		/**** md5 signature: a06ba847c93cff0df9b4ab69c43b3ea4 ****/
		%feature("compactdefaultargs") Extrema_EPCOfELPCOfLocateExtPC;
		%feature("autodoc", "It calculates all the distances. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs all the zeros inside the definition range of the curve. nbu is used to locate the close points to find the zeros. zeros are searched between umin and usup. tol and tolu are used to decide to stop the iterations according to the following condition: if n is the number of iterations, abs(un-un-1) < tolu and abs(f(un)-f(un-1)) < tol.

Parameters
----------
P: gp_Pnt
C: Adaptor3d_Curve
NbU: int
Umin: float
Usup: float
TolU: float
TolF: float

Returns
-------
None
") Extrema_EPCOfELPCOfLocateExtPC;
		 Extrema_EPCOfELPCOfLocateExtPC(const gp_Pnt & P, const Adaptor3d_Curve & C, const Standard_Integer NbU, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU, const Standard_Real TolF);

		/****************** Initialize ******************/
		/**** md5 signature: b8e83a64d3c33c8a4e28f4682b235bbb ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the fields of the algorithm.

Parameters
----------
C: Adaptor3d_Curve
NbU: int
TolU: float
TolF: float

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & C, const Standard_Integer NbU, const Standard_Real TolU, const Standard_Real TolF);

		/****************** Initialize ******************/
		/**** md5 signature: bf3c9f855e71bda7dd32647a562411bf ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the fields of the algorithm.

Parameters
----------
C: Adaptor3d_Curve
NbU: int
Umin: float
Usup: float
TolU: float
TolF: float

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & C, const Standard_Integer NbU, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU, const Standard_Real TolF);

		/****************** Initialize ******************/
		/**** md5 signature: 96ecca85f670f0aff9194161a9bd5dc1 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the fields of the algorithm.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & C);

		/****************** Initialize ******************/
		/**** md5 signature: bdcd99b58831999e0cacf879b57f7aca ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the fields of the algorithm.

Parameters
----------
NbU: int
Umin: float
Usup: float
TolU: float
TolF: float

Returns
-------
None
") Initialize;
		void Initialize(const Standard_Integer NbU, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU, const Standard_Real TolF);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "True if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsMin ******************/
		/**** md5 signature: d296cefb075e9db02ee60a375c81a9f6 ****/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Returns true if the nth extremum distance is a minimum.

Parameters
----------
N: int

Returns
-------
bool
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****************** NbExt ******************/
		/**** md5 signature: 84ada636e4651cacf916eb056265a1d9 ****/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		/**** md5 signature: 5f5e57fd55ba2b5f8e2b2be09861a3f9 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "The algorithm is done with the point p. an exception is raised if the fields have not been initialized.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt & P);

		/****************** Point ******************/
		/**** md5 signature: 1a3c4a6f09c4cb823314eefe5165e75c ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of the nth extremum distance.

Parameters
----------
N: int

Returns
-------
Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point(const Standard_Integer N);

		/****************** SquareDistance ******************/
		/**** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the nth extremum square distance.

Parameters
----------
N: int

Returns
-------
float
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
		/****************** Extrema_EPCOfELPCOfLocateExtPC2d ******************/
		/**** md5 signature: e673ff31f47b907e3142f38655a34ff0 ****/
		%feature("compactdefaultargs") Extrema_EPCOfELPCOfLocateExtPC2d;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_EPCOfELPCOfLocateExtPC2d;
		 Extrema_EPCOfELPCOfLocateExtPC2d();

		/****************** Extrema_EPCOfELPCOfLocateExtPC2d ******************/
		/**** md5 signature: 8f3881b23e0058c54bf5de87961608df ****/
		%feature("compactdefaultargs") Extrema_EPCOfELPCOfLocateExtPC2d;
		%feature("autodoc", "It calculates all the distances. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs all the zeros inside the definition range of the curve. nbu is used to locate the close points to find the zeros. tol and tolu are used to decide to stop the iterations according to the following condition: if n is the number of iterations, abs(un-un-1) < tolu and abs(f(un)-f(un-1)) < tol.

Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d
NbU: int
TolU: float
TolF: float

Returns
-------
None
") Extrema_EPCOfELPCOfLocateExtPC2d;
		 Extrema_EPCOfELPCOfLocateExtPC2d(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C, const Standard_Integer NbU, const Standard_Real TolU, const Standard_Real TolF);

		/****************** Extrema_EPCOfELPCOfLocateExtPC2d ******************/
		/**** md5 signature: 2ff481b1955aaf32316f2eedc538cb2e ****/
		%feature("compactdefaultargs") Extrema_EPCOfELPCOfLocateExtPC2d;
		%feature("autodoc", "It calculates all the distances. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs all the zeros inside the definition range of the curve. nbu is used to locate the close points to find the zeros. zeros are searched between umin and usup. tol and tolu are used to decide to stop the iterations according to the following condition: if n is the number of iterations, abs(un-un-1) < tolu and abs(f(un)-f(un-1)) < tol.

Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d
NbU: int
Umin: float
Usup: float
TolU: float
TolF: float

Returns
-------
None
") Extrema_EPCOfELPCOfLocateExtPC2d;
		 Extrema_EPCOfELPCOfLocateExtPC2d(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C, const Standard_Integer NbU, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU, const Standard_Real TolF);

		/****************** Initialize ******************/
		/**** md5 signature: 0c4d5ef0210a20d5cfdf67b6198c9095 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the fields of the algorithm.

Parameters
----------
C: Adaptor2d_Curve2d
NbU: int
TolU: float
TolF: float

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C, const Standard_Integer NbU, const Standard_Real TolU, const Standard_Real TolF);

		/****************** Initialize ******************/
		/**** md5 signature: 9e172761979bca888575dc8cff8ac8a9 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the fields of the algorithm.

Parameters
----------
C: Adaptor2d_Curve2d
NbU: int
Umin: float
Usup: float
TolU: float
TolF: float

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C, const Standard_Integer NbU, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU, const Standard_Real TolF);

		/****************** Initialize ******************/
		/**** md5 signature: 295b46cc3c15eb5116b8523fecaa122c ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the fields of the algorithm.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C);

		/****************** Initialize ******************/
		/**** md5 signature: bdcd99b58831999e0cacf879b57f7aca ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the fields of the algorithm.

Parameters
----------
NbU: int
Umin: float
Usup: float
TolU: float
TolF: float

Returns
-------
None
") Initialize;
		void Initialize(const Standard_Integer NbU, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU, const Standard_Real TolF);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "True if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsMin ******************/
		/**** md5 signature: d296cefb075e9db02ee60a375c81a9f6 ****/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Returns true if the nth extremum distance is a minimum.

Parameters
----------
N: int

Returns
-------
bool
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****************** NbExt ******************/
		/**** md5 signature: 84ada636e4651cacf916eb056265a1d9 ****/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		/**** md5 signature: 59fee48271d5ac79a6de2fe73317998c ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "The algorithm is done with the point p. an exception is raised if the fields have not been initialized.

Parameters
----------
P: gp_Pnt2d

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt2d & P);

		/****************** Point ******************/
		/**** md5 signature: 6123812027804044a54749cfa19bef5e ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of the nth extremum distance.

Parameters
----------
N: int

Returns
-------
Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point(const Standard_Integer N);

		/****************** SquareDistance ******************/
		/**** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the nth extremum square distance.

Parameters
----------
N: int

Returns
-------
float
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
		/****************** Extrema_EPCOfExtPC ******************/
		/**** md5 signature: b7a31ac2e708fd73365a35020614ea0b ****/
		%feature("compactdefaultargs") Extrema_EPCOfExtPC;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_EPCOfExtPC;
		 Extrema_EPCOfExtPC();

		/****************** Extrema_EPCOfExtPC ******************/
		/**** md5 signature: 48fc709c66fee1c004b2cc4dd1545dbc ****/
		%feature("compactdefaultargs") Extrema_EPCOfExtPC;
		%feature("autodoc", "It calculates all the distances. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs all the zeros inside the definition range of the curve. nbu is used to locate the close points to find the zeros. tol and tolu are used to decide to stop the iterations according to the following condition: if n is the number of iterations, abs(un-un-1) < tolu and abs(f(un)-f(un-1)) < tol.

Parameters
----------
P: gp_Pnt
C: Adaptor3d_Curve
NbU: int
TolU: float
TolF: float

Returns
-------
None
") Extrema_EPCOfExtPC;
		 Extrema_EPCOfExtPC(const gp_Pnt & P, const Adaptor3d_Curve & C, const Standard_Integer NbU, const Standard_Real TolU, const Standard_Real TolF);

		/****************** Extrema_EPCOfExtPC ******************/
		/**** md5 signature: 592c802da1f9faf50937c805bbc4dec7 ****/
		%feature("compactdefaultargs") Extrema_EPCOfExtPC;
		%feature("autodoc", "It calculates all the distances. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs all the zeros inside the definition range of the curve. nbu is used to locate the close points to find the zeros. zeros are searched between umin and usup. tol and tolu are used to decide to stop the iterations according to the following condition: if n is the number of iterations, abs(un-un-1) < tolu and abs(f(un)-f(un-1)) < tol.

Parameters
----------
P: gp_Pnt
C: Adaptor3d_Curve
NbU: int
Umin: float
Usup: float
TolU: float
TolF: float

Returns
-------
None
") Extrema_EPCOfExtPC;
		 Extrema_EPCOfExtPC(const gp_Pnt & P, const Adaptor3d_Curve & C, const Standard_Integer NbU, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU, const Standard_Real TolF);

		/****************** Initialize ******************/
		/**** md5 signature: b8e83a64d3c33c8a4e28f4682b235bbb ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the fields of the algorithm.

Parameters
----------
C: Adaptor3d_Curve
NbU: int
TolU: float
TolF: float

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & C, const Standard_Integer NbU, const Standard_Real TolU, const Standard_Real TolF);

		/****************** Initialize ******************/
		/**** md5 signature: bf3c9f855e71bda7dd32647a562411bf ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the fields of the algorithm.

Parameters
----------
C: Adaptor3d_Curve
NbU: int
Umin: float
Usup: float
TolU: float
TolF: float

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & C, const Standard_Integer NbU, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU, const Standard_Real TolF);

		/****************** Initialize ******************/
		/**** md5 signature: 96ecca85f670f0aff9194161a9bd5dc1 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the fields of the algorithm.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & C);

		/****************** Initialize ******************/
		/**** md5 signature: bdcd99b58831999e0cacf879b57f7aca ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the fields of the algorithm.

Parameters
----------
NbU: int
Umin: float
Usup: float
TolU: float
TolF: float

Returns
-------
None
") Initialize;
		void Initialize(const Standard_Integer NbU, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU, const Standard_Real TolF);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "True if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsMin ******************/
		/**** md5 signature: d296cefb075e9db02ee60a375c81a9f6 ****/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Returns true if the nth extremum distance is a minimum.

Parameters
----------
N: int

Returns
-------
bool
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****************** NbExt ******************/
		/**** md5 signature: 84ada636e4651cacf916eb056265a1d9 ****/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		/**** md5 signature: 5f5e57fd55ba2b5f8e2b2be09861a3f9 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "The algorithm is done with the point p. an exception is raised if the fields have not been initialized.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt & P);

		/****************** Point ******************/
		/**** md5 signature: 1a3c4a6f09c4cb823314eefe5165e75c ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of the nth extremum distance.

Parameters
----------
N: int

Returns
-------
Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point(const Standard_Integer N);

		/****************** SquareDistance ******************/
		/**** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the nth extremum square distance.

Parameters
----------
N: int

Returns
-------
float
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
		/****************** Extrema_EPCOfExtPC2d ******************/
		/**** md5 signature: dddcc49f98fdb65c7a826fe02135551c ****/
		%feature("compactdefaultargs") Extrema_EPCOfExtPC2d;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_EPCOfExtPC2d;
		 Extrema_EPCOfExtPC2d();

		/****************** Extrema_EPCOfExtPC2d ******************/
		/**** md5 signature: e215bb58b06e418352ca7a41838988ff ****/
		%feature("compactdefaultargs") Extrema_EPCOfExtPC2d;
		%feature("autodoc", "It calculates all the distances. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs all the zeros inside the definition range of the curve. nbu is used to locate the close points to find the zeros. tol and tolu are used to decide to stop the iterations according to the following condition: if n is the number of iterations, abs(un-un-1) < tolu and abs(f(un)-f(un-1)) < tol.

Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d
NbU: int
TolU: float
TolF: float

Returns
-------
None
") Extrema_EPCOfExtPC2d;
		 Extrema_EPCOfExtPC2d(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C, const Standard_Integer NbU, const Standard_Real TolU, const Standard_Real TolF);

		/****************** Extrema_EPCOfExtPC2d ******************/
		/**** md5 signature: 180127b2ebbcb30f4366bc818c7a8176 ****/
		%feature("compactdefaultargs") Extrema_EPCOfExtPC2d;
		%feature("autodoc", "It calculates all the distances. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs all the zeros inside the definition range of the curve. nbu is used to locate the close points to find the zeros. zeros are searched between umin and usup. tol and tolu are used to decide to stop the iterations according to the following condition: if n is the number of iterations, abs(un-un-1) < tolu and abs(f(un)-f(un-1)) < tol.

Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d
NbU: int
Umin: float
Usup: float
TolU: float
TolF: float

Returns
-------
None
") Extrema_EPCOfExtPC2d;
		 Extrema_EPCOfExtPC2d(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C, const Standard_Integer NbU, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU, const Standard_Real TolF);

		/****************** Initialize ******************/
		/**** md5 signature: 0c4d5ef0210a20d5cfdf67b6198c9095 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the fields of the algorithm.

Parameters
----------
C: Adaptor2d_Curve2d
NbU: int
TolU: float
TolF: float

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C, const Standard_Integer NbU, const Standard_Real TolU, const Standard_Real TolF);

		/****************** Initialize ******************/
		/**** md5 signature: 9e172761979bca888575dc8cff8ac8a9 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the fields of the algorithm.

Parameters
----------
C: Adaptor2d_Curve2d
NbU: int
Umin: float
Usup: float
TolU: float
TolF: float

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C, const Standard_Integer NbU, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU, const Standard_Real TolF);

		/****************** Initialize ******************/
		/**** md5 signature: 295b46cc3c15eb5116b8523fecaa122c ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the fields of the algorithm.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C);

		/****************** Initialize ******************/
		/**** md5 signature: bdcd99b58831999e0cacf879b57f7aca ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the fields of the algorithm.

Parameters
----------
NbU: int
Umin: float
Usup: float
TolU: float
TolF: float

Returns
-------
None
") Initialize;
		void Initialize(const Standard_Integer NbU, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU, const Standard_Real TolF);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "True if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsMin ******************/
		/**** md5 signature: d296cefb075e9db02ee60a375c81a9f6 ****/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Returns true if the nth extremum distance is a minimum.

Parameters
----------
N: int

Returns
-------
bool
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****************** NbExt ******************/
		/**** md5 signature: 84ada636e4651cacf916eb056265a1d9 ****/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		/**** md5 signature: 59fee48271d5ac79a6de2fe73317998c ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "The algorithm is done with the point p. an exception is raised if the fields have not been initialized.

Parameters
----------
P: gp_Pnt2d

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt2d & P);

		/****************** Point ******************/
		/**** md5 signature: 6123812027804044a54749cfa19bef5e ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of the nth extremum distance.

Parameters
----------
N: int

Returns
-------
Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point(const Standard_Integer N);

		/****************** SquareDistance ******************/
		/**** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the nth extremum square distance.

Parameters
----------
N: int

Returns
-------
float
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
		/****************** Extrema_ExtCC ******************/
		/**** md5 signature: 1964fd38df4cd129bca5df76f4e60ede ****/
		%feature("compactdefaultargs") Extrema_ExtCC;
		%feature("autodoc", "No available documentation.

Parameters
----------
TolC1: float,optional
	default value is 1.0e-10
TolC2: float,optional
	default value is 1.0e-10

Returns
-------
None
") Extrema_ExtCC;
		 Extrema_ExtCC(const Standard_Real TolC1 = 1.0e-10, const Standard_Real TolC2 = 1.0e-10);

		/****************** Extrema_ExtCC ******************/
		/**** md5 signature: d500180d0d13c2ef7c63d04c92f24379 ****/
		%feature("compactdefaultargs") Extrema_ExtCC;
		%feature("autodoc", "It calculates all the distances.

Parameters
----------
C1: Adaptor3d_Curve
C2: Adaptor3d_Curve
TolC1: float,optional
	default value is 1.0e-10
TolC2: float,optional
	default value is 1.0e-10

Returns
-------
None
") Extrema_ExtCC;
		 Extrema_ExtCC(const Adaptor3d_Curve & C1, const Adaptor3d_Curve & C2, const Standard_Real TolC1 = 1.0e-10, const Standard_Real TolC2 = 1.0e-10);

		/****************** Extrema_ExtCC ******************/
		/**** md5 signature: 2d456c9708a30ed1803c42204eb75e6c ****/
		%feature("compactdefaultargs") Extrema_ExtCC;
		%feature("autodoc", "It calculates all the distances.

Parameters
----------
C1: Adaptor3d_Curve
C2: Adaptor3d_Curve
U1: float
U2: float
V1: float
V2: float
TolC1: float,optional
	default value is 1.0e-10
TolC2: float,optional
	default value is 1.0e-10

Returns
-------
None
") Extrema_ExtCC;
		 Extrema_ExtCC(const Adaptor3d_Curve & C1, const Adaptor3d_Curve & C2, const Standard_Real U1, const Standard_Real U2, const Standard_Real V1, const Standard_Real V2, const Standard_Real TolC1 = 1.0e-10, const Standard_Real TolC2 = 1.0e-10);

		/****************** GetSingleSolutionFlag ******************/
		/**** md5 signature: b28121e257a0efb9e2c6c13cf0ce823d ****/
		%feature("compactdefaultargs") GetSingleSolutionFlag;
		%feature("autodoc", "Get flag for single extrema computation. works on parametric solver only.

Returns
-------
bool
") GetSingleSolutionFlag;
		Standard_Boolean GetSingleSolutionFlag();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsParallel ******************/
		/**** md5 signature: 47a312fd58e74bf5bb8a9bb6f0484dfb ****/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Returns true if the two curves are parallel.

Returns
-------
bool
") IsParallel;
		Standard_Boolean IsParallel();

		/****************** NbExt ******************/
		/**** md5 signature: 84ada636e4651cacf916eb056265a1d9 ****/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		/**** md5 signature: c04b01412cba7220c024b5eb4532697f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Perform;
		void Perform();

		/****************** Points ******************/
		/**** md5 signature: 3794ed44489c98c8247e475c96bba9a2 ****/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Returns the points of the nth extremum distance. p1 is on the first curve, p2 on the second one.

Parameters
----------
N: int
P1: Extrema_POnCurv
P2: Extrema_POnCurv

Returns
-------
None
") Points;
		void Points(const Standard_Integer N, Extrema_POnCurv & P1, Extrema_POnCurv & P2);

		/****************** SetCurve ******************/
		/**** md5 signature: c05f6a94f7b94d5e89625aaec42d5687 ****/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
theRank: int
C: Adaptor3d_Curve

Returns
-------
None
") SetCurve;
		void SetCurve(const Standard_Integer theRank, const Adaptor3d_Curve & C);

		/****************** SetCurve ******************/
		/**** md5 signature: 025474c33b1e56b733db458edc65850f ****/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
theRank: int
C: Adaptor3d_Curve
Uinf: float
Usup: float

Returns
-------
None
") SetCurve;
		void SetCurve(const Standard_Integer theRank, const Adaptor3d_Curve & C, const Standard_Real Uinf, const Standard_Real Usup);

		/****************** SetRange ******************/
		/**** md5 signature: eff4fdd36b8c8eb75e6bc0772ea6313e ****/
		%feature("compactdefaultargs") SetRange;
		%feature("autodoc", "No available documentation.

Parameters
----------
theRank: int
Uinf: float
Usup: float

Returns
-------
None
") SetRange;
		void SetRange(const Standard_Integer theRank, const Standard_Real Uinf, const Standard_Real Usup);

		/****************** SetSingleSolutionFlag ******************/
		/**** md5 signature: 7fa45b94e509fd90dd043f395439167b ****/
		%feature("compactdefaultargs") SetSingleSolutionFlag;
		%feature("autodoc", "Set flag for single extrema computation. works on parametric solver only.

Parameters
----------
theSingleSolutionFlag: bool

Returns
-------
None
") SetSingleSolutionFlag;
		void SetSingleSolutionFlag(const Standard_Boolean theSingleSolutionFlag);

		/****************** SetTolerance ******************/
		/**** md5 signature: 16e60849a33c96f08af47a45ccdfb221 ****/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "No available documentation.

Parameters
----------
theRank: int
Tol: float

Returns
-------
None
") SetTolerance;
		void SetTolerance(const Standard_Integer theRank, const Standard_Real Tol);

		/****************** SquareDistance ******************/
		/**** md5 signature: badb2a0561651254031917071ad28398 ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the nth extremum square distance.

Parameters
----------
N: int,optional
	default value is 1

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N = 1);

		/****************** TrimmedSquareDistances ******************/
		/**** md5 signature: 4e321915bc6b3619a20bb8a4fec39fce ****/
		%feature("compactdefaultargs") TrimmedSquareDistances;
		%feature("autodoc", "If the curve is a trimmed curve, dist11 is a square distance between the point on c1 of parameter firstparameter and the point of parameter firstparameter on c2.

Parameters
----------
P11: gp_Pnt
P12: gp_Pnt
P21: gp_Pnt
P22: gp_Pnt

Returns
-------
dist11: float
distP12: float
distP21: float
distP22: float
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
		/****************** Extrema_ExtCC2d ******************/
		/**** md5 signature: d77841926d1a7c270feae47e00813b8e ****/
		%feature("compactdefaultargs") Extrema_ExtCC2d;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_ExtCC2d;
		 Extrema_ExtCC2d();

		/****************** Extrema_ExtCC2d ******************/
		/**** md5 signature: 4e71d2eebdbd2103a21286923c8a1ce0 ****/
		%feature("compactdefaultargs") Extrema_ExtCC2d;
		%feature("autodoc", "It calculates all the distances.

Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d
TolC1: float,optional
	default value is 1.0e-10
TolC2: float,optional
	default value is 1.0e-10

Returns
-------
None
") Extrema_ExtCC2d;
		 Extrema_ExtCC2d(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2, const Standard_Real TolC1 = 1.0e-10, const Standard_Real TolC2 = 1.0e-10);

		/****************** Extrema_ExtCC2d ******************/
		/**** md5 signature: fab5475c248d3f36cda068af9882ca40 ****/
		%feature("compactdefaultargs") Extrema_ExtCC2d;
		%feature("autodoc", "It calculates all the distances.

Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d
U1: float
U2: float
V1: float
V2: float
TolC1: float,optional
	default value is 1.0e-10
TolC2: float,optional
	default value is 1.0e-10

Returns
-------
None
") Extrema_ExtCC2d;
		 Extrema_ExtCC2d(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2, const Standard_Real U1, const Standard_Real U2, const Standard_Real V1, const Standard_Real V2, const Standard_Real TolC1 = 1.0e-10, const Standard_Real TolC2 = 1.0e-10);

		/****************** GetSingleSolutionFlag ******************/
		/**** md5 signature: b28121e257a0efb9e2c6c13cf0ce823d ****/
		%feature("compactdefaultargs") GetSingleSolutionFlag;
		%feature("autodoc", "Get flag for single extrema computation. works on parametric solver only.

Returns
-------
bool
") GetSingleSolutionFlag;
		Standard_Boolean GetSingleSolutionFlag();

		/****************** Initialize ******************/
		/**** md5 signature: 664b6d4f23d9ca50ceb303478cf4c8f1 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initializes the fields.

Parameters
----------
C2: Adaptor2d_Curve2d
V1: float
V2: float
TolC1: float,optional
	default value is 1.0e-10
TolC2: float,optional
	default value is 1.0e-10

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C2, const Standard_Real V1, const Standard_Real V2, const Standard_Real TolC1 = 1.0e-10, const Standard_Real TolC2 = 1.0e-10);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsParallel ******************/
		/**** md5 signature: 47a312fd58e74bf5bb8a9bb6f0484dfb ****/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Returns true if the two curves are parallel.

Returns
-------
bool
") IsParallel;
		Standard_Boolean IsParallel();

		/****************** NbExt ******************/
		/**** md5 signature: 84ada636e4651cacf916eb056265a1d9 ****/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		/**** md5 signature: 0b7a7e6da6760c9bc5a77ff28b7e53f6 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
C1: Adaptor2d_Curve2d
U1: float
U2: float

Returns
-------
None
") Perform;
		void Perform(const Adaptor2d_Curve2d & C1, const Standard_Real U1, const Standard_Real U2);

		/****************** Points ******************/
		/**** md5 signature: b11c393bae576338fc3f288ecb955b49 ****/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Returns the points of the nth extremum distance. p1 is on the first curve, p2 on the second one.

Parameters
----------
N: int
P1: Extrema_POnCurv2d
P2: Extrema_POnCurv2d

Returns
-------
None
") Points;
		void Points(const Standard_Integer N, Extrema_POnCurv2d & P1, Extrema_POnCurv2d & P2);

		/****************** SetSingleSolutionFlag ******************/
		/**** md5 signature: 7fa45b94e509fd90dd043f395439167b ****/
		%feature("compactdefaultargs") SetSingleSolutionFlag;
		%feature("autodoc", "Set flag for single extrema computation. works on parametric solver only.

Parameters
----------
theSingleSolutionFlag: bool

Returns
-------
None
") SetSingleSolutionFlag;
		void SetSingleSolutionFlag(const Standard_Boolean theSingleSolutionFlag);

		/****************** SquareDistance ******************/
		/**** md5 signature: badb2a0561651254031917071ad28398 ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the nth extremum square distance.

Parameters
----------
N: int,optional
	default value is 1

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N = 1);

		/****************** TrimmedSquareDistances ******************/
		/**** md5 signature: 5589d6016051b0d97cdeddc5557c860c ****/
		%feature("compactdefaultargs") TrimmedSquareDistances;
		%feature("autodoc", "If the curve is a trimmed curve, dist11 is a square distance between the point on c1 of parameter firstparameter and the point of parameter firstparameter on c2.

Parameters
----------
P11: gp_Pnt2d
P12: gp_Pnt2d
P21: gp_Pnt2d
P22: gp_Pnt2d

Returns
-------
dist11: float
distP12: float
distP21: float
distP22: float
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
		/****************** Extrema_ExtCS ******************/
		/**** md5 signature: 4e582899e4155536b1138ca532444328 ****/
		%feature("compactdefaultargs") Extrema_ExtCS;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_ExtCS;
		 Extrema_ExtCS();

		/****************** Extrema_ExtCS ******************/
		/**** md5 signature: a6635ef61a6412c3a4509df4cbb3bf78 ****/
		%feature("compactdefaultargs") Extrema_ExtCS;
		%feature("autodoc", "It calculates all the distances between c and s.

Parameters
----------
C: Adaptor3d_Curve
S: Adaptor3d_Surface
TolC: float
TolS: float

Returns
-------
None
") Extrema_ExtCS;
		 Extrema_ExtCS(const Adaptor3d_Curve & C, const Adaptor3d_Surface & S, const Standard_Real TolC, const Standard_Real TolS);

		/****************** Extrema_ExtCS ******************/
		/**** md5 signature: 725ca4cb75ba4708abac64dd5588fea5 ****/
		%feature("compactdefaultargs") Extrema_ExtCS;
		%feature("autodoc", "It calculates all the distances between c and s. ucinf and ucmax are the start and end parameters of the curve.

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

Returns
-------
None
") Extrema_ExtCS;
		 Extrema_ExtCS(const Adaptor3d_Curve & C, const Adaptor3d_Surface & S, const Standard_Real UCinf, const Standard_Real UCsup, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real Vinf, const Standard_Real Vsup, const Standard_Real TolC, const Standard_Real TolS);

		/****************** Initialize ******************/
		/**** md5 signature: 6ca083b40ba666c98208199a3aec58ff ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initializes the fields of the algorithm.

Parameters
----------
S: Adaptor3d_Surface
Uinf: float
Usup: float
Vinf: float
Vsup: float
TolC: float
TolS: float

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Surface & S, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real Vinf, const Standard_Real Vsup, const Standard_Real TolC, const Standard_Real TolS);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsParallel ******************/
		/**** md5 signature: 47a312fd58e74bf5bb8a9bb6f0484dfb ****/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Returns true if the curve is on a parallel surface.

Returns
-------
bool
") IsParallel;
		Standard_Boolean IsParallel();

		/****************** NbExt ******************/
		/**** md5 signature: 84ada636e4651cacf916eb056265a1d9 ****/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		/**** md5 signature: 0b6b261d405d9a2236021036de30e89c ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes the distances. an exception is raised if the fieds have not been initialized.

Parameters
----------
C: Adaptor3d_Curve
Uinf: float
Usup: float

Returns
-------
None
") Perform;
		void Perform(const Adaptor3d_Curve & C, const Standard_Real Uinf, const Standard_Real Usup);

		/****************** Points ******************/
		/**** md5 signature: df68325eb2f306b7c0800a3dab036048 ****/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Returns the point of the nth resulting distance.

Parameters
----------
N: int
P1: Extrema_POnCurv
P2: Extrema_POnSurf

Returns
-------
None
") Points;
		void Points(const Standard_Integer N, Extrema_POnCurv & P1, Extrema_POnSurf & P2);

		/****************** SquareDistance ******************/
		/**** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the nth resulting square distance.

Parameters
----------
N: int

Returns
-------
float
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
		/****************** Extrema_ExtElC ******************/
		/**** md5 signature: 004e98e48c87086a0cef5207641c4089 ****/
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_ExtElC;
		 Extrema_ExtElC();

		/****************** Extrema_ExtElC ******************/
		/**** md5 signature: 7b0656884d84c74368738eb61994ae0b ****/
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "Calculates the distance between two lines. angtol is used to test if the lines are parallel: angle(c1,c2) < angtol.

Parameters
----------
C1: gp_Lin
C2: gp_Lin
AngTol: float

Returns
-------
None
") Extrema_ExtElC;
		 Extrema_ExtElC(const gp_Lin & C1, const gp_Lin & C2, const Standard_Real AngTol);

		/****************** Extrema_ExtElC ******************/
		/**** md5 signature: 828691bd07be929d1a0d331c962a5189 ****/
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "Calculates the distance between a line and a circle.

Parameters
----------
C1: gp_Lin
C2: gp_Circ
Tol: float

Returns
-------
None
") Extrema_ExtElC;
		 Extrema_ExtElC(const gp_Lin & C1, const gp_Circ & C2, const Standard_Real Tol);

		/****************** Extrema_ExtElC ******************/
		/**** md5 signature: 9fc2edc96231aa3d1ee6d30a8e95ad20 ****/
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "Calculates the distance between a line and an elipse.

Parameters
----------
C1: gp_Lin
C2: gp_Elips

Returns
-------
None
") Extrema_ExtElC;
		 Extrema_ExtElC(const gp_Lin & C1, const gp_Elips & C2);

		/****************** Extrema_ExtElC ******************/
		/**** md5 signature: ad69aa1eba04b7eed28f66eb8e14cf0f ****/
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "Calculates the distance between a line and a hyperbola.

Parameters
----------
C1: gp_Lin
C2: gp_Hypr

Returns
-------
None
") Extrema_ExtElC;
		 Extrema_ExtElC(const gp_Lin & C1, const gp_Hypr & C2);

		/****************** Extrema_ExtElC ******************/
		/**** md5 signature: 433c188160d67b67d75fa4e3b92c0dee ****/
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "Calculates the distance between a line and a parabola.

Parameters
----------
C1: gp_Lin
C2: gp_Parab

Returns
-------
None
") Extrema_ExtElC;
		 Extrema_ExtElC(const gp_Lin & C1, const gp_Parab & C2);

		/****************** Extrema_ExtElC ******************/
		/**** md5 signature: efeb94b9af53fc947c0accf8cc40dcce ****/
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "Calculates the distance between two circles. the circles can be parallel or identical.

Parameters
----------
C1: gp_Circ
C2: gp_Circ

Returns
-------
None
") Extrema_ExtElC;
		 Extrema_ExtElC(const gp_Circ & C1, const gp_Circ & C2);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsParallel ******************/
		/**** md5 signature: 47a312fd58e74bf5bb8a9bb6f0484dfb ****/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Returns true if the two curves are parallel.

Returns
-------
bool
") IsParallel;
		Standard_Boolean IsParallel();

		/****************** NbExt ******************/
		/**** md5 signature: 84ada636e4651cacf916eb056265a1d9 ****/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Points ******************/
		/**** md5 signature: 3794ed44489c98c8247e475c96bba9a2 ****/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Returns the points of the nth extremum distance. p1 is on the first curve, p2 on the second one.

Parameters
----------
N: int
P1: Extrema_POnCurv
P2: Extrema_POnCurv

Returns
-------
None
") Points;
		void Points(const Standard_Integer N, Extrema_POnCurv & P1, Extrema_POnCurv & P2);

		/****************** SquareDistance ******************/
		/**** md5 signature: badb2a0561651254031917071ad28398 ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the nth extremum square distance.

Parameters
----------
N: int,optional
	default value is 1

Returns
-------
float
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
		/****************** Extrema_ExtElC2d ******************/
		/**** md5 signature: 3859a3a4c2fb128440cbad11da1747b4 ****/
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d();

		/****************** Extrema_ExtElC2d ******************/
		/**** md5 signature: 6dc9aa92330273f445223bbea89fd053 ****/
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "Calculates the distance between two lines. angtol is used to test if the lines are parallel: angle(c1,c2) < angtol.

Parameters
----------
C1: gp_Lin2d
C2: gp_Lin2d
AngTol: float

Returns
-------
None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d(const gp_Lin2d & C1, const gp_Lin2d & C2, const Standard_Real AngTol);

		/****************** Extrema_ExtElC2d ******************/
		/**** md5 signature: 255dafcf3a543a8e720c60b740b1789e ****/
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "Calculates the distance between a line and a circle.

Parameters
----------
C1: gp_Lin2d
C2: gp_Circ2d
Tol: float

Returns
-------
None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d(const gp_Lin2d & C1, const gp_Circ2d & C2, const Standard_Real Tol);

		/****************** Extrema_ExtElC2d ******************/
		/**** md5 signature: c5e7e832342f09b3e3f5af22bdc53d53 ****/
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "Calculates the distance between a line and an elipse.

Parameters
----------
C1: gp_Lin2d
C2: gp_Elips2d

Returns
-------
None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d(const gp_Lin2d & C1, const gp_Elips2d & C2);

		/****************** Extrema_ExtElC2d ******************/
		/**** md5 signature: 734dd6d1ec09452b28b71c4ba1fe48ef ****/
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "Calculates the distance between a line and a hyperbola.

Parameters
----------
C1: gp_Lin2d
C2: gp_Hypr2d

Returns
-------
None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d(const gp_Lin2d & C1, const gp_Hypr2d & C2);

		/****************** Extrema_ExtElC2d ******************/
		/**** md5 signature: 5d76994c6ec8a2dbc6f33680f5976c43 ****/
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "Calculates the distance between a line and a parabola.

Parameters
----------
C1: gp_Lin2d
C2: gp_Parab2d

Returns
-------
None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d(const gp_Lin2d & C1, const gp_Parab2d & C2);

		/****************** Extrema_ExtElC2d ******************/
		/**** md5 signature: dc63d7b4da8be491292987ddc30c1e8d ****/
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "Calculates the distance between two circles. the circles can be parallel or identical.

Parameters
----------
C1: gp_Circ2d
C2: gp_Circ2d

Returns
-------
None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d(const gp_Circ2d & C1, const gp_Circ2d & C2);

		/****************** Extrema_ExtElC2d ******************/
		/**** md5 signature: 9dfec4428f361b16a6bad7c8b994c894 ****/
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "Calculates the distance between a circle and an elipse.

Parameters
----------
C1: gp_Circ2d
C2: gp_Elips2d

Returns
-------
None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d(const gp_Circ2d & C1, const gp_Elips2d & C2);

		/****************** Extrema_ExtElC2d ******************/
		/**** md5 signature: 5edbe9f00fc3b3dc62425701202dcab7 ****/
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "Calculates the distance between a circle and a hyperbola.

Parameters
----------
C1: gp_Circ2d
C2: gp_Hypr2d

Returns
-------
None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d(const gp_Circ2d & C1, const gp_Hypr2d & C2);

		/****************** Extrema_ExtElC2d ******************/
		/**** md5 signature: 9da5fa8b4354a798c26fde12bca15f59 ****/
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "Calculates the distance between a circle and a parabola.

Parameters
----------
C1: gp_Circ2d
C2: gp_Parab2d

Returns
-------
None
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d(const gp_Circ2d & C1, const gp_Parab2d & C2);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsParallel ******************/
		/**** md5 signature: 47a312fd58e74bf5bb8a9bb6f0484dfb ****/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Returns true if the two curves are parallel.

Returns
-------
bool
") IsParallel;
		Standard_Boolean IsParallel();

		/****************** NbExt ******************/
		/**** md5 signature: 84ada636e4651cacf916eb056265a1d9 ****/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Points ******************/
		/**** md5 signature: b11c393bae576338fc3f288ecb955b49 ****/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Returns the points of the nth extremum distance. p1 is on the first curve, p2 on the second one.

Parameters
----------
N: int
P1: Extrema_POnCurv2d
P2: Extrema_POnCurv2d

Returns
-------
None
") Points;
		void Points(const Standard_Integer N, Extrema_POnCurv2d & P1, Extrema_POnCurv2d & P2);

		/****************** SquareDistance ******************/
		/**** md5 signature: badb2a0561651254031917071ad28398 ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the nth extremum square distance.

Parameters
----------
N: int,optional
	default value is 1

Returns
-------
float
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
		/****************** Extrema_ExtElCS ******************/
		/**** md5 signature: f972ab4716d5de863647c4d782d4f719 ****/
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_ExtElCS;
		 Extrema_ExtElCS();

		/****************** Extrema_ExtElCS ******************/
		/**** md5 signature: db7d0474d65f1c3ea06c597c9b1064b2 ****/
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "Calculates the distances between a line and a plane. the line can be on the plane or on a parallel plane.

Parameters
----------
C: gp_Lin
S: gp_Pln

Returns
-------
None
") Extrema_ExtElCS;
		 Extrema_ExtElCS(const gp_Lin & C, const gp_Pln & S);

		/****************** Extrema_ExtElCS ******************/
		/**** md5 signature: c0d2bcdb0f53cdd2d27d7b05d87048fc ****/
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "Calculates the distances between a line and a cylinder.

Parameters
----------
C: gp_Lin
S: gp_Cylinder

Returns
-------
None
") Extrema_ExtElCS;
		 Extrema_ExtElCS(const gp_Lin & C, const gp_Cylinder & S);

		/****************** Extrema_ExtElCS ******************/
		/**** md5 signature: 4a6eb2f64f823821ccb456c18b3730b5 ****/
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "Calculates the distances between a line and a cone.

Parameters
----------
C: gp_Lin
S: gp_Cone

Returns
-------
None
") Extrema_ExtElCS;
		 Extrema_ExtElCS(const gp_Lin & C, const gp_Cone & S);

		/****************** Extrema_ExtElCS ******************/
		/**** md5 signature: 0bbd80f7ce8fd4b777392404e4748607 ****/
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "Calculates the distances between a line and a sphere.

Parameters
----------
C: gp_Lin
S: gp_Sphere

Returns
-------
None
") Extrema_ExtElCS;
		 Extrema_ExtElCS(const gp_Lin & C, const gp_Sphere & S);

		/****************** Extrema_ExtElCS ******************/
		/**** md5 signature: 3d525b570639c11fefd86b2e7c84552e ****/
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "Calculates the distances between a line and a torus.

Parameters
----------
C: gp_Lin
S: gp_Torus

Returns
-------
None
") Extrema_ExtElCS;
		 Extrema_ExtElCS(const gp_Lin & C, const gp_Torus & S);

		/****************** Extrema_ExtElCS ******************/
		/**** md5 signature: a0af8e62e1b3c35b9d74c2fe0aa8ec30 ****/
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "Calculates the distances between a circle and a plane.

Parameters
----------
C: gp_Circ
S: gp_Pln

Returns
-------
None
") Extrema_ExtElCS;
		 Extrema_ExtElCS(const gp_Circ & C, const gp_Pln & S);

		/****************** Extrema_ExtElCS ******************/
		/**** md5 signature: d51444d34658575972b8c800686ab9b6 ****/
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "Calculates the distances between a circle and a cylinder.

Parameters
----------
C: gp_Circ
S: gp_Cylinder

Returns
-------
None
") Extrema_ExtElCS;
		 Extrema_ExtElCS(const gp_Circ & C, const gp_Cylinder & S);

		/****************** Extrema_ExtElCS ******************/
		/**** md5 signature: 2f5894f6aa2bb5c5c44c71cdfb702b1f ****/
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "Calculates the distances between a circle and a cone.

Parameters
----------
C: gp_Circ
S: gp_Cone

Returns
-------
None
") Extrema_ExtElCS;
		 Extrema_ExtElCS(const gp_Circ & C, const gp_Cone & S);

		/****************** Extrema_ExtElCS ******************/
		/**** md5 signature: 67d7cc9a8eb544114fb772f2cd6645a1 ****/
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "Calculates the distances between a circle and a sphere.

Parameters
----------
C: gp_Circ
S: gp_Sphere

Returns
-------
None
") Extrema_ExtElCS;
		 Extrema_ExtElCS(const gp_Circ & C, const gp_Sphere & S);

		/****************** Extrema_ExtElCS ******************/
		/**** md5 signature: 65c35a71b119fb9a5fe14416416247de ****/
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "Calculates the distances between a circle and a torus.

Parameters
----------
C: gp_Circ
S: gp_Torus

Returns
-------
None
") Extrema_ExtElCS;
		 Extrema_ExtElCS(const gp_Circ & C, const gp_Torus & S);

		/****************** Extrema_ExtElCS ******************/
		/**** md5 signature: ea55755f1f248cc3e575d19fc850a68c ****/
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "Calculates the distances between a hyperbola and a plane.

Parameters
----------
C: gp_Hypr
S: gp_Pln

Returns
-------
None
") Extrema_ExtElCS;
		 Extrema_ExtElCS(const gp_Hypr & C, const gp_Pln & S);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsParallel ******************/
		/**** md5 signature: 47a312fd58e74bf5bb8a9bb6f0484dfb ****/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Returns true if the curve is on a parallel surface.

Returns
-------
bool
") IsParallel;
		Standard_Boolean IsParallel();

		/****************** NbExt ******************/
		/**** md5 signature: 84ada636e4651cacf916eb056265a1d9 ****/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		/**** md5 signature: 53338ec9217fe501d1c94d408fbb526a ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Lin
S: gp_Pln

Returns
-------
None
") Perform;
		void Perform(const gp_Lin & C, const gp_Pln & S);

		/****************** Perform ******************/
		/**** md5 signature: 3c9464740ac1157499031017e0cfbb64 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Lin
S: gp_Cylinder

Returns
-------
None
") Perform;
		void Perform(const gp_Lin & C, const gp_Cylinder & S);

		/****************** Perform ******************/
		/**** md5 signature: 521a4ef5d866669e33b3ca356fd51e79 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Lin
S: gp_Cone

Returns
-------
None
") Perform;
		void Perform(const gp_Lin & C, const gp_Cone & S);

		/****************** Perform ******************/
		/**** md5 signature: 69cd757c0bc859fb33a39049adc05fc0 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Lin
S: gp_Sphere

Returns
-------
None
") Perform;
		void Perform(const gp_Lin & C, const gp_Sphere & S);

		/****************** Perform ******************/
		/**** md5 signature: d5c283eb996063c758bc4ea115ab544a ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Lin
S: gp_Torus

Returns
-------
None
") Perform;
		void Perform(const gp_Lin & C, const gp_Torus & S);

		/****************** Perform ******************/
		/**** md5 signature: 66884cd7b5b0d6e6d66f8b6d99e4d8db ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Circ
S: gp_Pln

Returns
-------
None
") Perform;
		void Perform(const gp_Circ & C, const gp_Pln & S);

		/****************** Perform ******************/
		/**** md5 signature: 27ad618f21410a465523c3454a53b19a ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Circ
S: gp_Cylinder

Returns
-------
None
") Perform;
		void Perform(const gp_Circ & C, const gp_Cylinder & S);

		/****************** Perform ******************/
		/**** md5 signature: 5d0f7254160c3c0cb46a9b6f6abd5939 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Circ
S: gp_Cone

Returns
-------
None
") Perform;
		void Perform(const gp_Circ & C, const gp_Cone & S);

		/****************** Perform ******************/
		/**** md5 signature: b5bf6a02a309dc0ef23ec19efe9db94f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Circ
S: gp_Sphere

Returns
-------
None
") Perform;
		void Perform(const gp_Circ & C, const gp_Sphere & S);

		/****************** Perform ******************/
		/**** md5 signature: c261ca51addce2475acf5b4ca1e7a468 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Circ
S: gp_Torus

Returns
-------
None
") Perform;
		void Perform(const gp_Circ & C, const gp_Torus & S);

		/****************** Perform ******************/
		/**** md5 signature: 3c188f0396340861834945ca664cf796 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Hypr
S: gp_Pln

Returns
-------
None
") Perform;
		void Perform(const gp_Hypr & C, const gp_Pln & S);

		/****************** Points ******************/
		/**** md5 signature: df68325eb2f306b7c0800a3dab036048 ****/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Returns the points of the nth extremum distance. p1 is on the curve, p2 on the surface.

Parameters
----------
N: int
P1: Extrema_POnCurv
P2: Extrema_POnSurf

Returns
-------
None
") Points;
		void Points(const Standard_Integer N, Extrema_POnCurv & P1, Extrema_POnSurf & P2);

		/****************** SquareDistance ******************/
		/**** md5 signature: badb2a0561651254031917071ad28398 ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the nth extremum square distance.

Parameters
----------
N: int,optional
	default value is 1

Returns
-------
float
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
		/****************** Extrema_ExtElSS ******************/
		/**** md5 signature: 8e0497b9837638576257bc0d167c4464 ****/
		%feature("compactdefaultargs") Extrema_ExtElSS;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_ExtElSS;
		 Extrema_ExtElSS();

		/****************** Extrema_ExtElSS ******************/
		/**** md5 signature: b925c2a494c3713b8f7e0a979e88dfaa ****/
		%feature("compactdefaultargs") Extrema_ExtElSS;
		%feature("autodoc", "Calculates the distances between 2 planes. these planes can be parallel.

Parameters
----------
S1: gp_Pln
S2: gp_Pln

Returns
-------
None
") Extrema_ExtElSS;
		 Extrema_ExtElSS(const gp_Pln & S1, const gp_Pln & S2);

		/****************** Extrema_ExtElSS ******************/
		/**** md5 signature: d683aa7715cf5ab1b592487723c2c527 ****/
		%feature("compactdefaultargs") Extrema_ExtElSS;
		%feature("autodoc", "Calculates the distances between a plane and a sphere.

Parameters
----------
S1: gp_Pln
S2: gp_Sphere

Returns
-------
None
") Extrema_ExtElSS;
		 Extrema_ExtElSS(const gp_Pln & S1, const gp_Sphere & S2);

		/****************** Extrema_ExtElSS ******************/
		/**** md5 signature: e4073adaaba080c0db7787020eb2e790 ****/
		%feature("compactdefaultargs") Extrema_ExtElSS;
		%feature("autodoc", "Calculates the distances between 2 spheres. these spheres can be parallel.

Parameters
----------
S1: gp_Sphere
S2: gp_Sphere

Returns
-------
None
") Extrema_ExtElSS;
		 Extrema_ExtElSS(const gp_Sphere & S1, const gp_Sphere & S2);

		/****************** Extrema_ExtElSS ******************/
		/**** md5 signature: b2af663e183526c2799b073df395497f ****/
		%feature("compactdefaultargs") Extrema_ExtElSS;
		%feature("autodoc", "Calculates the distances between a sphere and a cylinder.

Parameters
----------
S1: gp_Sphere
S2: gp_Cylinder

Returns
-------
None
") Extrema_ExtElSS;
		 Extrema_ExtElSS(const gp_Sphere & S1, const gp_Cylinder & S2);

		/****************** Extrema_ExtElSS ******************/
		/**** md5 signature: 47f34cd25801d4da4c0b2b113413a994 ****/
		%feature("compactdefaultargs") Extrema_ExtElSS;
		%feature("autodoc", "Calculates the distances between a sphere and a cone.

Parameters
----------
S1: gp_Sphere
S2: gp_Cone

Returns
-------
None
") Extrema_ExtElSS;
		 Extrema_ExtElSS(const gp_Sphere & S1, const gp_Cone & S2);

		/****************** Extrema_ExtElSS ******************/
		/**** md5 signature: 297d959d30c1c20de7718eb3081a702f ****/
		%feature("compactdefaultargs") Extrema_ExtElSS;
		%feature("autodoc", "Calculates the distances between a sphere and a torus.

Parameters
----------
S1: gp_Sphere
S2: gp_Torus

Returns
-------
None
") Extrema_ExtElSS;
		 Extrema_ExtElSS(const gp_Sphere & S1, const gp_Torus & S2);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsParallel ******************/
		/**** md5 signature: 47a312fd58e74bf5bb8a9bb6f0484dfb ****/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Returns true if the two surfaces are parallel.

Returns
-------
bool
") IsParallel;
		Standard_Boolean IsParallel();

		/****************** NbExt ******************/
		/**** md5 signature: 84ada636e4651cacf916eb056265a1d9 ****/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		/**** md5 signature: ce57f9a43effeb78e12cb61797bc6543 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: gp_Pln
S2: gp_Pln

Returns
-------
None
") Perform;
		void Perform(const gp_Pln & S1, const gp_Pln & S2);

		/****************** Perform ******************/
		/**** md5 signature: 76cf61b7e9ca82144308666f7f41665c ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: gp_Pln
S2: gp_Sphere

Returns
-------
None
") Perform;
		void Perform(const gp_Pln & S1, const gp_Sphere & S2);

		/****************** Perform ******************/
		/**** md5 signature: 1c6acec214ff9b00343214969dc126aa ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: gp_Sphere
S2: gp_Sphere

Returns
-------
None
") Perform;
		void Perform(const gp_Sphere & S1, const gp_Sphere & S2);

		/****************** Perform ******************/
		/**** md5 signature: 8f8ce841d48bba33b76369ea3172be0a ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: gp_Sphere
S2: gp_Cylinder

Returns
-------
None
") Perform;
		void Perform(const gp_Sphere & S1, const gp_Cylinder & S2);

		/****************** Perform ******************/
		/**** md5 signature: 5ed2cdeb590464eda15e6c060f138d87 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: gp_Sphere
S2: gp_Cone

Returns
-------
None
") Perform;
		void Perform(const gp_Sphere & S1, const gp_Cone & S2);

		/****************** Perform ******************/
		/**** md5 signature: 18f99d4382bb3381950649a5e72e1bd3 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: gp_Sphere
S2: gp_Torus

Returns
-------
None
") Perform;
		void Perform(const gp_Sphere & S1, const gp_Torus & S2);

		/****************** Points ******************/
		/**** md5 signature: 3c61a440dae3b36da20a5cbbb58f55ce ****/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Returns the points for the nth resulting distance. p1 is on the first surface, p2 on the second one.

Parameters
----------
N: int
P1: Extrema_POnSurf
P2: Extrema_POnSurf

Returns
-------
None
") Points;
		void Points(const Standard_Integer N, Extrema_POnSurf & P1, Extrema_POnSurf & P2);

		/****************** SquareDistance ******************/
		/**** md5 signature: badb2a0561651254031917071ad28398 ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the nth extremum square distance.

Parameters
----------
N: int,optional
	default value is 1

Returns
-------
float
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
		/****************** Extrema_ExtPC ******************/
		/**** md5 signature: be55a3dbd5dd51eefcef6fa83c40e5e0 ****/
		%feature("compactdefaultargs") Extrema_ExtPC;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_ExtPC;
		 Extrema_ExtPC();

		/****************** Extrema_ExtPC ******************/
		/**** md5 signature: 80236a796df22a03cb53e858bdaf4dfe ****/
		%feature("compactdefaultargs") Extrema_ExtPC;
		%feature("autodoc", "It calculates all the distances. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs all the zeros inside the definition range of the curve. zeros are searched between uinf and usup. tol is used to decide to stop the iterations according to the following condition: if n is the number of iterations, the algorithm stops when abs(f(un)-f(un-1)) < tol.

Parameters
----------
P: gp_Pnt
C: Adaptor3d_Curve
Uinf: float
Usup: float
TolF: float,optional
	default value is 1.0e-10

Returns
-------
None
") Extrema_ExtPC;
		 Extrema_ExtPC(const gp_Pnt & P, const Adaptor3d_Curve & C, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real TolF = 1.0e-10);

		/****************** Extrema_ExtPC ******************/
		/**** md5 signature: 67d047a0517c372399b96860078635d6 ****/
		%feature("compactdefaultargs") Extrema_ExtPC;
		%feature("autodoc", "It calculates all the distances. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs all the zeros inside the definition range of the curve. tol is used to decide to stop the iterations according to the following condition: if n is the number of iterations, the algorithm stops when abs(f(un)-f(un-1)) < tol.

Parameters
----------
P: gp_Pnt
C: Adaptor3d_Curve
TolF: float,optional
	default value is 1.0e-10

Returns
-------
None
") Extrema_ExtPC;
		 Extrema_ExtPC(const gp_Pnt & P, const Adaptor3d_Curve & C, const Standard_Real TolF = 1.0e-10);

		/****************** Initialize ******************/
		/**** md5 signature: 6ac5bc3f72e0a8236c8f51c23167f9f5 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initializes the fields of the algorithm.

Parameters
----------
C: Adaptor3d_Curve
Uinf: float
Usup: float
TolF: float,optional
	default value is 1.0e-10

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & C, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real TolF = 1.0e-10);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "True if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsMin ******************/
		/**** md5 signature: d296cefb075e9db02ee60a375c81a9f6 ****/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Returns true if the <n>th extremum distance is a minimum.

Parameters
----------
N: int

Returns
-------
bool
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****************** NbExt ******************/
		/**** md5 signature: 84ada636e4651cacf916eb056265a1d9 ****/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		/**** md5 signature: 5f5e57fd55ba2b5f8e2b2be09861a3f9 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "An exception is raised if the fields have not been initialized.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt & P);

		/****************** Point ******************/
		/**** md5 signature: 1a3c4a6f09c4cb823314eefe5165e75c ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of the <n>th extremum distance.

Parameters
----------
N: int

Returns
-------
Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point(const Standard_Integer N);

		/****************** SquareDistance ******************/
		/**** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the <n>th extremum square distance.

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****************** TrimmedSquareDistances ******************/
		/**** md5 signature: 2e689901655c68a486db722f362ab27b ****/
		%feature("compactdefaultargs") TrimmedSquareDistances;
		%feature("autodoc", "If the curve is a trimmed curve, dist1 is a square distance between <p> and the point of parameter firstparameter <p1> and dist2 is a square distance between <p> and the point of parameter lastparameter <p2>.

Parameters
----------
P1: gp_Pnt
P2: gp_Pnt

Returns
-------
dist1: float
dist2: float
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
		/****************** Extrema_ExtPC2d ******************/
		/**** md5 signature: 3ab8144e6c9a0668da028f2c4f7999da ****/
		%feature("compactdefaultargs") Extrema_ExtPC2d;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_ExtPC2d;
		 Extrema_ExtPC2d();

		/****************** Extrema_ExtPC2d ******************/
		/**** md5 signature: 85453b0ec67e15ba150de917544e3938 ****/
		%feature("compactdefaultargs") Extrema_ExtPC2d;
		%feature("autodoc", "It calculates all the distances. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs all the zeros inside the definition range of the curve. zeros are searched between uinf and usup. tol is used to decide to stop the iterations according to the following condition: if n is the number of iterations, the algorithm stops when abs(f(un)-f(un-1)) < tol.

Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d
Uinf: float
Usup: float
TolF: float,optional
	default value is 1.0e-10

Returns
-------
None
") Extrema_ExtPC2d;
		 Extrema_ExtPC2d(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real TolF = 1.0e-10);

		/****************** Extrema_ExtPC2d ******************/
		/**** md5 signature: b53ba77823cd004a73e74f43a6e53d26 ****/
		%feature("compactdefaultargs") Extrema_ExtPC2d;
		%feature("autodoc", "It calculates all the distances. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs all the zeros inside the definition range of the curve. tol is used to decide to stop the iterations according to the following condition: if n is the number of iterations, the algorithm stops when abs(f(un)-f(un-1)) < tol.

Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d
TolF: float,optional
	default value is 1.0e-10

Returns
-------
None
") Extrema_ExtPC2d;
		 Extrema_ExtPC2d(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C, const Standard_Real TolF = 1.0e-10);

		/****************** Initialize ******************/
		/**** md5 signature: be89f8d1b5b5ecf504acd30e1f24f787 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initializes the fields of the algorithm.

Parameters
----------
C: Adaptor2d_Curve2d
Uinf: float
Usup: float
TolF: float,optional
	default value is 1.0e-10

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real TolF = 1.0e-10);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "True if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsMin ******************/
		/**** md5 signature: d296cefb075e9db02ee60a375c81a9f6 ****/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Returns true if the <n>th extremum distance is a minimum.

Parameters
----------
N: int

Returns
-------
bool
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****************** NbExt ******************/
		/**** md5 signature: 84ada636e4651cacf916eb056265a1d9 ****/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		/**** md5 signature: 59fee48271d5ac79a6de2fe73317998c ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "An exception is raised if the fields have not been initialized.

Parameters
----------
P: gp_Pnt2d

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt2d & P);

		/****************** Point ******************/
		/**** md5 signature: 6123812027804044a54749cfa19bef5e ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of the <n>th extremum distance.

Parameters
----------
N: int

Returns
-------
Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point(const Standard_Integer N);

		/****************** SquareDistance ******************/
		/**** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the <n>th extremum square distance.

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****************** TrimmedSquareDistances ******************/
		/**** md5 signature: d92e1ba45ead5acc8c7f33976cfdf6e6 ****/
		%feature("compactdefaultargs") TrimmedSquareDistances;
		%feature("autodoc", "If the curve is a trimmed curve, dist1 is a square distance between <p> and the point of parameter firstparameter <p1> and dist2 is a square distance between <p> and the point of parameter lastparameter <p2>.

Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d

Returns
-------
dist1: float
dist2: float
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
		/****************** Extrema_ExtPElC ******************/
		/**** md5 signature: aa316f8b6ce8c27e119c835cba4d43bb ****/
		%feature("compactdefaultargs") Extrema_ExtPElC;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_ExtPElC;
		 Extrema_ExtPElC();

		/****************** Extrema_ExtPElC ******************/
		/**** md5 signature: 93bc73b76ab3778c58d80e8bf7e3bb4d ****/
		%feature("compactdefaultargs") Extrema_ExtPElC;
		%feature("autodoc", "Calculates the extremum distance between the point p and the segment [uinf,usup] of the line c.

Parameters
----------
P: gp_Pnt
C: gp_Lin
Tol: float
Uinf: float
Usup: float

Returns
-------
None
") Extrema_ExtPElC;
		 Extrema_ExtPElC(const gp_Pnt & P, const gp_Lin & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****************** Extrema_ExtPElC ******************/
		/**** md5 signature: 2421c1c1ea2d67e9e0c93039dc777852 ****/
		%feature("compactdefaultargs") Extrema_ExtPElC;
		%feature("autodoc", "Calculates the 2 extremum distances between the point p and the segment [uinf,usup] of the circle c. tol is used to determine if p is on the axis of the circle or if an extremum is on an endpoint of the segment. if p is on the axis of the circle, there are infinite solution then isdone(me)=false. the conditions on the uinf and usup are: 0. <= uinf <= 2.*pi and usup > uinf. if usup > uinf + 2.*pi, then only the solutions in the range [uinf,uinf+2.*pi[ are computed.

Parameters
----------
P: gp_Pnt
C: gp_Circ
Tol: float
Uinf: float
Usup: float

Returns
-------
None
") Extrema_ExtPElC;
		 Extrema_ExtPElC(const gp_Pnt & P, const gp_Circ & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****************** Extrema_ExtPElC ******************/
		/**** md5 signature: 8aea1ee5525a05788869a67c6ce46ea8 ****/
		%feature("compactdefaultargs") Extrema_ExtPElC;
		%feature("autodoc", "Calculates the 4 extremum distances between the point p and the segment [uinf,usup] of the elipse c. tol is used to determine if the point is on the axis of the elipse and if the major radius is equal to the minor radius or if an extremum is on an endpoint of the segment. if p is on the axis of the elipse, there are infinite solution then isdone(me)=false. the conditions on the uinf and usup are: 0. <= uinf <= 2.*pi and usup > uinf. if usup > uinf + 2.*pi, then only the solutions in the range [uinf,uinf+2.*pi[ are computed.

Parameters
----------
P: gp_Pnt
C: gp_Elips
Tol: float
Uinf: float
Usup: float

Returns
-------
None
") Extrema_ExtPElC;
		 Extrema_ExtPElC(const gp_Pnt & P, const gp_Elips & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****************** Extrema_ExtPElC ******************/
		/**** md5 signature: a386b6b8b1b6010c6b9571009e5702e8 ****/
		%feature("compactdefaultargs") Extrema_ExtPElC;
		%feature("autodoc", "Calculates the extremum distances between the point p and the segment [uinf,usup] of the hyperbola c. tol is used to determine if two solutions u and v are identical; the condition is: dist(c(u),c(v)) < tol.

Parameters
----------
P: gp_Pnt
C: gp_Hypr
Tol: float
Uinf: float
Usup: float

Returns
-------
None
") Extrema_ExtPElC;
		 Extrema_ExtPElC(const gp_Pnt & P, const gp_Hypr & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****************** Extrema_ExtPElC ******************/
		/**** md5 signature: 80a4885fd6b9adb857b740213d44758f ****/
		%feature("compactdefaultargs") Extrema_ExtPElC;
		%feature("autodoc", "Calculates the 4 extremum distances between the point p and the segment [uinf,usup] of the parabola c. tol is used to determine if two solutions u and v are identical; the condition is: dist(c(u),c(v)) < tol.

Parameters
----------
P: gp_Pnt
C: gp_Parab
Tol: float
Uinf: float
Usup: float

Returns
-------
None
") Extrema_ExtPElC;
		 Extrema_ExtPElC(const gp_Pnt & P, const gp_Parab & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "True if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsMin ******************/
		/**** md5 signature: d296cefb075e9db02ee60a375c81a9f6 ****/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Returns true if the nth extremum distance is a minimum.

Parameters
----------
N: int

Returns
-------
bool
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****************** NbExt ******************/
		/**** md5 signature: 84ada636e4651cacf916eb056265a1d9 ****/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		/**** md5 signature: 387f74370367df916d66e4969cf83798 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
C: gp_Lin
Tol: float
Uinf: float
Usup: float

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt & P, const gp_Lin & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****************** Perform ******************/
		/**** md5 signature: 1bae431d03488d75ec67609e8ae39f71 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
C: gp_Circ
Tol: float
Uinf: float
Usup: float

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt & P, const gp_Circ & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****************** Perform ******************/
		/**** md5 signature: dfda9ecf65388aa537f7eb877313d1b5 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
C: gp_Elips
Tol: float
Uinf: float
Usup: float

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt & P, const gp_Elips & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****************** Perform ******************/
		/**** md5 signature: a1c7b2e90f211be41b1d0d58f47469f9 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
C: gp_Hypr
Tol: float
Uinf: float
Usup: float

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt & P, const gp_Hypr & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****************** Perform ******************/
		/**** md5 signature: dd4bc329117483ae226cb12423526181 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
C: gp_Parab
Tol: float
Uinf: float
Usup: float

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt & P, const gp_Parab & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****************** Point ******************/
		/**** md5 signature: 1a3c4a6f09c4cb823314eefe5165e75c ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of the nth extremum distance.

Parameters
----------
N: int

Returns
-------
Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point(const Standard_Integer N);

		/****************** SquareDistance ******************/
		/**** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the nth extremum square distance.

Parameters
----------
N: int

Returns
-------
float
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
		/****************** Extrema_ExtPElC2d ******************/
		/**** md5 signature: 917f2d7035567fb4d5e2a70c1b9e20ce ****/
		%feature("compactdefaultargs") Extrema_ExtPElC2d;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_ExtPElC2d;
		 Extrema_ExtPElC2d();

		/****************** Extrema_ExtPElC2d ******************/
		/**** md5 signature: b161287eb698efa6064f94bbbbffaf58 ****/
		%feature("compactdefaultargs") Extrema_ExtPElC2d;
		%feature("autodoc", "Calculates the extremum distance between the point p and the segment [uinf,usup] of the line l.

Parameters
----------
P: gp_Pnt2d
C: gp_Lin2d
Tol: float
Uinf: float
Usup: float

Returns
-------
None
") Extrema_ExtPElC2d;
		 Extrema_ExtPElC2d(const gp_Pnt2d & P, const gp_Lin2d & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****************** Extrema_ExtPElC2d ******************/
		/**** md5 signature: 9dacd9abcd93cdfe7255d6d7fba7b46f ****/
		%feature("compactdefaultargs") Extrema_ExtPElC2d;
		%feature("autodoc", "Calculates the 2 extremum distances between the point p and the segment [uinf,usup] of the circle c. tol is used to determine if p is on the axis of the circle or if an extremum is on an endpoint of the segment. if p is on the axis of the circle, there are infinite solution then isdone(me)=false. the conditions on the uinf and usup are: 0. <= uinf <= 2.*pi and usup > uinf. if usup > uinf + 2.*pi, then only the solutions in the range [uinf,uinf+2.*pi[ are computed.

Parameters
----------
P: gp_Pnt2d
C: gp_Circ2d
Tol: float
Uinf: float
Usup: float

Returns
-------
None
") Extrema_ExtPElC2d;
		 Extrema_ExtPElC2d(const gp_Pnt2d & P, const gp_Circ2d & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****************** Extrema_ExtPElC2d ******************/
		/**** md5 signature: 70b2bf1822d25a12a548d783db318ceb ****/
		%feature("compactdefaultargs") Extrema_ExtPElC2d;
		%feature("autodoc", "Calculates the 4 extremum distances between the point p and the segment [uinf,usup] of the elipse c. tol is used to determine if the point is on the axis of the elipse and if the major radius is equal to the minor radius or if an extremum is on an endpoint of the segment. if p is on the axis of the elipse, there are infinite solution then isdone(me)=false. the conditions on the uinf and usup are: 0. <= uinf <= 2.*pi and usup > uinf. if usup > uinf + 2.*pi, then only the solutions in the range [uinf,uinf+2.*pi[ are computed.

Parameters
----------
P: gp_Pnt2d
C: gp_Elips2d
Tol: float
Uinf: float
Usup: float

Returns
-------
None
") Extrema_ExtPElC2d;
		 Extrema_ExtPElC2d(const gp_Pnt2d & P, const gp_Elips2d & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****************** Extrema_ExtPElC2d ******************/
		/**** md5 signature: 29b968a8e96e7126b4e4e7831638c99d ****/
		%feature("compactdefaultargs") Extrema_ExtPElC2d;
		%feature("autodoc", "Calculates the extremum distances between the point p and the segment [uinf,usup] of the hyperbola c. tol is used to determine if two solutions u and v are identical; the condition is: dist(c(u),c(v)) < tol.

Parameters
----------
P: gp_Pnt2d
C: gp_Hypr2d
Tol: float
Uinf: float
Usup: float

Returns
-------
None
") Extrema_ExtPElC2d;
		 Extrema_ExtPElC2d(const gp_Pnt2d & P, const gp_Hypr2d & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****************** Extrema_ExtPElC2d ******************/
		/**** md5 signature: 49b554ea2281bad6ee09f11e7c3a2eb8 ****/
		%feature("compactdefaultargs") Extrema_ExtPElC2d;
		%feature("autodoc", "Calculates the 4 extremum distances between the point p and the segment [uinf,usup] of the parabola c. tol is used to determine if two solutions u and v are identical; the condition is: dist(c(u),c(v)) < tol.

Parameters
----------
P: gp_Pnt2d
C: gp_Parab2d
Tol: float
Uinf: float
Usup: float

Returns
-------
None
") Extrema_ExtPElC2d;
		 Extrema_ExtPElC2d(const gp_Pnt2d & P, const gp_Parab2d & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "True if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsMin ******************/
		/**** md5 signature: d296cefb075e9db02ee60a375c81a9f6 ****/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Returns true if the nth extremum distance is a minimum.

Parameters
----------
N: int

Returns
-------
bool
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****************** NbExt ******************/
		/**** md5 signature: 84ada636e4651cacf916eb056265a1d9 ****/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		/**** md5 signature: 15068655d1fb63103f9947c13bc48e19 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt2d
L: gp_Lin2d
Tol: float
Uinf: float
Usup: float

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt2d & P, const gp_Lin2d & L, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****************** Perform ******************/
		/**** md5 signature: b057d13e3535354f66df5aeca35ddf75 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt2d
C: gp_Circ2d
Tol: float
Uinf: float
Usup: float

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt2d & P, const gp_Circ2d & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****************** Perform ******************/
		/**** md5 signature: 4ae408c4333b201bce092809c1e3a45f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt2d
C: gp_Elips2d
Tol: float
Uinf: float
Usup: float

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt2d & P, const gp_Elips2d & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****************** Perform ******************/
		/**** md5 signature: a41602c05f889da301cf87d99625406b ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt2d
C: gp_Hypr2d
Tol: float
Uinf: float
Usup: float

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt2d & P, const gp_Hypr2d & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****************** Perform ******************/
		/**** md5 signature: 5fd3d554a665d045f61c850b29da2283 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt2d
C: gp_Parab2d
Tol: float
Uinf: float
Usup: float

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt2d & P, const gp_Parab2d & C, const Standard_Real Tol, const Standard_Real Uinf, const Standard_Real Usup);

		/****************** Point ******************/
		/**** md5 signature: 6123812027804044a54749cfa19bef5e ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of the nth extremum distance.

Parameters
----------
N: int

Returns
-------
Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point(const Standard_Integer N);

		/****************** SquareDistance ******************/
		/**** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the nth extremum square distance.

Parameters
----------
N: int

Returns
-------
float
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
		/****************** Extrema_ExtPElS ******************/
		/**** md5 signature: 26281c034aa20ce7723ae98262f1a76b ****/
		%feature("compactdefaultargs") Extrema_ExtPElS;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_ExtPElS;
		 Extrema_ExtPElS();

		/****************** Extrema_ExtPElS ******************/
		/**** md5 signature: b7873961e78f0878b711346c01e324e2 ****/
		%feature("compactdefaultargs") Extrema_ExtPElS;
		%feature("autodoc", "It calculates all the distances between a point and a cylinder from gp. tol is used to test if the point is on the axis.

Parameters
----------
P: gp_Pnt
S: gp_Cylinder
Tol: float

Returns
-------
None
") Extrema_ExtPElS;
		 Extrema_ExtPElS(const gp_Pnt & P, const gp_Cylinder & S, const Standard_Real Tol);

		/****************** Extrema_ExtPElS ******************/
		/**** md5 signature: 7897974da8ba1a7a95e93262691e4525 ****/
		%feature("compactdefaultargs") Extrema_ExtPElS;
		%feature("autodoc", "It calculates all the distances between a point and a plane from gp. tol is used to test if the point is on the plane.

Parameters
----------
P: gp_Pnt
S: gp_Pln
Tol: float

Returns
-------
None
") Extrema_ExtPElS;
		 Extrema_ExtPElS(const gp_Pnt & P, const gp_Pln & S, const Standard_Real Tol);

		/****************** Extrema_ExtPElS ******************/
		/**** md5 signature: 5d42604390c64ff068b315ae4c9277e8 ****/
		%feature("compactdefaultargs") Extrema_ExtPElS;
		%feature("autodoc", "It calculates all the distances between a point and a cone from gp. tol is used to test if the point is at the apex or on the axis.

Parameters
----------
P: gp_Pnt
S: gp_Cone
Tol: float

Returns
-------
None
") Extrema_ExtPElS;
		 Extrema_ExtPElS(const gp_Pnt & P, const gp_Cone & S, const Standard_Real Tol);

		/****************** Extrema_ExtPElS ******************/
		/**** md5 signature: df9ed72ba021462671b3017fac129dbf ****/
		%feature("compactdefaultargs") Extrema_ExtPElS;
		%feature("autodoc", "It calculates all the distances between a point and a torus from gp. tol is used to test if the point is on the axis.

Parameters
----------
P: gp_Pnt
S: gp_Torus
Tol: float

Returns
-------
None
") Extrema_ExtPElS;
		 Extrema_ExtPElS(const gp_Pnt & P, const gp_Torus & S, const Standard_Real Tol);

		/****************** Extrema_ExtPElS ******************/
		/**** md5 signature: ac6b1eda3281b6d3ce81dd775a522041 ****/
		%feature("compactdefaultargs") Extrema_ExtPElS;
		%feature("autodoc", "It calculates all the distances between a point and a sphere from gp. tol is used to test if the point is at the center.

Parameters
----------
P: gp_Pnt
S: gp_Sphere
Tol: float

Returns
-------
None
") Extrema_ExtPElS;
		 Extrema_ExtPElS(const gp_Pnt & P, const gp_Sphere & S, const Standard_Real Tol);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbExt ******************/
		/**** md5 signature: 84ada636e4651cacf916eb056265a1d9 ****/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		/**** md5 signature: 7a9583898caece842785d1fbbb6a41c7 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
S: gp_Cylinder
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt & P, const gp_Cylinder & S, const Standard_Real Tol);

		/****************** Perform ******************/
		/**** md5 signature: 182c5b84fd8e40b09851cc166b2cd45b ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
S: gp_Pln
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt & P, const gp_Pln & S, const Standard_Real Tol);

		/****************** Perform ******************/
		/**** md5 signature: bc41bf6c0844fea1e6ca23f55d184af9 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
S: gp_Cone
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt & P, const gp_Cone & S, const Standard_Real Tol);

		/****************** Perform ******************/
		/**** md5 signature: 90fd6c44c396b1471c027903a8e071cc ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
S: gp_Torus
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt & P, const gp_Torus & S, const Standard_Real Tol);

		/****************** Perform ******************/
		/**** md5 signature: ed199a8178cb5ed834c60aa45f034ae9 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
S: gp_Sphere
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt & P, const gp_Sphere & S, const Standard_Real Tol);

		/****************** Point ******************/
		/**** md5 signature: a4fcffb60ef4a8c249128141ee062afa ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of the nth resulting distance.

Parameters
----------
N: int

Returns
-------
Extrema_POnSurf
") Point;
		const Extrema_POnSurf & Point(const Standard_Integer N);

		/****************** SquareDistance ******************/
		/**** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the nth resulting square distance.

Parameters
----------
N: int

Returns
-------
float
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
		/****************** Extrema_ExtPExtS ******************/
		/**** md5 signature: dcd91b6b512b4adb355634d4d1fcbd04 ****/
		%feature("compactdefaultargs") Extrema_ExtPExtS;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_ExtPExtS;
		 Extrema_ExtPExtS();

		/****************** Extrema_ExtPExtS ******************/
		/**** md5 signature: f1d913eeae325e790b9432275629930b ****/
		%feature("compactdefaultargs") Extrema_ExtPExtS;
		%feature("autodoc", "It calculates all the distances between a point from gp and a surface.

Parameters
----------
P: gp_Pnt
S: GeomAdaptor_HSurfaceOfLinearExtrusion
Umin: float
Usup: float
Vmin: float
Vsup: float
TolU: float
TolV: float

Returns
-------
None
") Extrema_ExtPExtS;
		 Extrema_ExtPExtS(const gp_Pnt & P, const opencascade::handle<GeomAdaptor_HSurfaceOfLinearExtrusion> & S, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real Vmin, const Standard_Real Vsup, const Standard_Real TolU, const Standard_Real TolV);

		/****************** Extrema_ExtPExtS ******************/
		/**** md5 signature: ace865e0e17c924debb403f840ef6dde ****/
		%feature("compactdefaultargs") Extrema_ExtPExtS;
		%feature("autodoc", "It calculates all the distances between a point from gp and a surface.

Parameters
----------
P: gp_Pnt
S: GeomAdaptor_HSurfaceOfLinearExtrusion
TolU: float
TolV: float

Returns
-------
None
") Extrema_ExtPExtS;
		 Extrema_ExtPExtS(const gp_Pnt & P, const opencascade::handle<GeomAdaptor_HSurfaceOfLinearExtrusion> & S, const Standard_Real TolU, const Standard_Real TolV);

		/****************** Initialize ******************/
		/**** md5 signature: 0758c9e0bbaad928803c39a5e7bd9060 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initializes the fields of the algorithm.

Parameters
----------
S: GeomAdaptor_HSurfaceOfLinearExtrusion
Uinf: float
Usup: float
Vinf: float
Vsup: float
TolU: float
TolV: float

Returns
-------
None
") Initialize;
		void Initialize(const opencascade::handle<GeomAdaptor_HSurfaceOfLinearExtrusion> & S, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real Vinf, const Standard_Real Vsup, const Standard_Real TolU, const Standard_Real TolV);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbExt ******************/
		/**** md5 signature: 84ada636e4651cacf916eb056265a1d9 ****/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		/**** md5 signature: 5f5e57fd55ba2b5f8e2b2be09861a3f9 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt & P);

		/****************** Point ******************/
		/**** md5 signature: a4fcffb60ef4a8c249128141ee062afa ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of the nth resulting distance.

Parameters
----------
N: int

Returns
-------
Extrema_POnSurf
") Point;
		const Extrema_POnSurf & Point(const Standard_Integer N);

		/****************** SquareDistance ******************/
		/**** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the nth resulting square distance.

Parameters
----------
N: int

Returns
-------
float
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
		/****************** Extrema_ExtPRevS ******************/
		/**** md5 signature: 679dbd4abfc01dec4eefe2229391cfbd ****/
		%feature("compactdefaultargs") Extrema_ExtPRevS;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_ExtPRevS;
		 Extrema_ExtPRevS();

		/****************** Extrema_ExtPRevS ******************/
		/**** md5 signature: 67d30f13480087ad21b924aee50e378b ****/
		%feature("compactdefaultargs") Extrema_ExtPRevS;
		%feature("autodoc", "It calculates all the distances between a point from gp and a surfaceptr from adaptor3d.

Parameters
----------
P: gp_Pnt
S: GeomAdaptor_HSurfaceOfRevolution
Umin: float
Usup: float
Vmin: float
Vsup: float
TolU: float
TolV: float

Returns
-------
None
") Extrema_ExtPRevS;
		 Extrema_ExtPRevS(const gp_Pnt & P, const opencascade::handle<GeomAdaptor_HSurfaceOfRevolution> & S, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real Vmin, const Standard_Real Vsup, const Standard_Real TolU, const Standard_Real TolV);

		/****************** Extrema_ExtPRevS ******************/
		/**** md5 signature: 8c5194fce2c1f87ce692a7a5123971e9 ****/
		%feature("compactdefaultargs") Extrema_ExtPRevS;
		%feature("autodoc", "It calculates all the distances between a point from gp and a surfaceptr from adaptor3d.

Parameters
----------
P: gp_Pnt
S: GeomAdaptor_HSurfaceOfRevolution
TolU: float
TolV: float

Returns
-------
None
") Extrema_ExtPRevS;
		 Extrema_ExtPRevS(const gp_Pnt & P, const opencascade::handle<GeomAdaptor_HSurfaceOfRevolution> & S, const Standard_Real TolU, const Standard_Real TolV);

		/****************** Initialize ******************/
		/**** md5 signature: 503e26ea2c1d6cc0791266f1a243bf10 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: GeomAdaptor_HSurfaceOfRevolution
Umin: float
Usup: float
Vmin: float
Vsup: float
TolU: float
TolV: float

Returns
-------
None
") Initialize;
		void Initialize(const opencascade::handle<GeomAdaptor_HSurfaceOfRevolution> & S, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real Vmin, const Standard_Real Vsup, const Standard_Real TolU, const Standard_Real TolV);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbExt ******************/
		/**** md5 signature: 84ada636e4651cacf916eb056265a1d9 ****/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		/**** md5 signature: 5f5e57fd55ba2b5f8e2b2be09861a3f9 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt & P);

		/****************** Point ******************/
		/**** md5 signature: a4fcffb60ef4a8c249128141ee062afa ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of the nth resulting distance.

Parameters
----------
N: int

Returns
-------
Extrema_POnSurf
") Point;
		const Extrema_POnSurf & Point(const Standard_Integer N);

		/****************** SquareDistance ******************/
		/**** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the nth resulting square distance.

Parameters
----------
N: int

Returns
-------
float
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
		/****************** Extrema_ExtPS ******************/
		/**** md5 signature: 793a5e92349ac079113a0a89d2169ffe ****/
		%feature("compactdefaultargs") Extrema_ExtPS;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_ExtPS;
		 Extrema_ExtPS();

		/****************** Extrema_ExtPS ******************/
		/**** md5 signature: 442bc5c874228c2da454483d0c83a01c ****/
		%feature("compactdefaultargs") Extrema_ExtPS;
		%feature("autodoc", "It calculates all the distances. nbu and nbv are used to locate the close points to find the zeros. they must be great enough such that if there is n extrema, there will be n extrema between p and the grid. tolu et tolv are used to determine the conditions to stop the iterations; at the iteration number n: (un - un-1) < tolu and (vn - vn-1) < tolv .

Parameters
----------
P: gp_Pnt
S: Adaptor3d_Surface
TolU: float
TolV: float
F: Extrema_ExtFlag,optional
	default value is Extrema_ExtFlag_MINMAX
A: Extrema_ExtAlgo,optional
	default value is Extrema_ExtAlgo_Grad

Returns
-------
None
") Extrema_ExtPS;
		 Extrema_ExtPS(const gp_Pnt & P, const Adaptor3d_Surface & S, const Standard_Real TolU, const Standard_Real TolV, const Extrema_ExtFlag F = Extrema_ExtFlag_MINMAX, const Extrema_ExtAlgo A = Extrema_ExtAlgo_Grad);

		/****************** Extrema_ExtPS ******************/
		/**** md5 signature: ae9e0982c6eae0cab46c82b1f5f9b3f2 ****/
		%feature("compactdefaultargs") Extrema_ExtPS;
		%feature("autodoc", "It calculates all the distances. nbu and nbv are used to locate the close points to find the zeros. they must be great enough such that if there is n extrema, there will be n extrema between p and the grid. tolu et tolv are used to determine the conditions to stop the iterations; at the iteration number n: (un - un-1) < tolu and (vn - vn-1) < tolv .

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
F: Extrema_ExtFlag,optional
	default value is Extrema_ExtFlag_MINMAX
A: Extrema_ExtAlgo,optional
	default value is Extrema_ExtAlgo_Grad

Returns
-------
None
") Extrema_ExtPS;
		 Extrema_ExtPS(const gp_Pnt & P, const Adaptor3d_Surface & S, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real Vinf, const Standard_Real Vsup, const Standard_Real TolU, const Standard_Real TolV, const Extrema_ExtFlag F = Extrema_ExtFlag_MINMAX, const Extrema_ExtAlgo A = Extrema_ExtAlgo_Grad);

		/****************** Initialize ******************/
		/**** md5 signature: 85bf7622aa29bfb02f48b8238eb11094 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initializes the fields of the algorithm.

Parameters
----------
S: Adaptor3d_Surface
Uinf: float
Usup: float
Vinf: float
Vsup: float
TolU: float
TolV: float

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Surface & S, const Standard_Real Uinf, const Standard_Real Usup, const Standard_Real Vinf, const Standard_Real Vsup, const Standard_Real TolU, const Standard_Real TolV);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbExt ******************/
		/**** md5 signature: 84ada636e4651cacf916eb056265a1d9 ****/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		/**** md5 signature: 5f5e57fd55ba2b5f8e2b2be09861a3f9 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes the distances. an exception is raised if the fieds have not been initialized.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt & P);

		/****************** Point ******************/
		/**** md5 signature: a4fcffb60ef4a8c249128141ee062afa ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of the nth resulting distance.

Parameters
----------
N: int

Returns
-------
Extrema_POnSurf
") Point;
		const Extrema_POnSurf & Point(const Standard_Integer N);

		/****************** SetAlgo ******************/
		/**** md5 signature: dcf7639630bf367993e8e7093ad161ed ****/
		%feature("compactdefaultargs") SetAlgo;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: Extrema_ExtAlgo

Returns
-------
None
") SetAlgo;
		void SetAlgo(const Extrema_ExtAlgo A);

		/****************** SetFlag ******************/
		/**** md5 signature: d1a9d4d7a9231db47b60f98b2475fcf4 ****/
		%feature("compactdefaultargs") SetFlag;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: Extrema_ExtFlag

Returns
-------
None
") SetFlag;
		void SetFlag(const Extrema_ExtFlag F);

		/****************** SquareDistance ******************/
		/**** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the nth resulting square distance.

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****************** TrimmedSquareDistances ******************/
		/**** md5 signature: 89ae4993de907b460aded6b7f212f89e ****/
		%feature("compactdefaultargs") TrimmedSquareDistances;
		%feature("autodoc", "If the surface is a trimmed surface, dufvf is a square distance between <p> and the point of parameter firstuparameter and firstvparameter <pufvf>. dufvl is a square distance between <p> and the point of parameter firstuparameter and lastvparameter <pufvl>. dulvf is a square distance between <p> and the point of parameter lastuparameter and firstvparameter <pulvf>. dulvl is a square distance between <p> and the point of parameter lastuparameter and lastvparameter <pulvl>.

Parameters
----------
PUfVf: gp_Pnt
PUfVl: gp_Pnt
PUlVf: gp_Pnt
PUlVl: gp_Pnt

Returns
-------
dUfVf: float
dUfVl: float
dUlVf: float
dUlVl: float
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
		/****************** Extrema_ExtSS ******************/
		/**** md5 signature: d54c660a7f43125fd28ce5400500e34f ****/
		%feature("compactdefaultargs") Extrema_ExtSS;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_ExtSS;
		 Extrema_ExtSS();

		/****************** Extrema_ExtSS ******************/
		/**** md5 signature: d41df8248a9ed9aa1ac1f54913a328c1 ****/
		%feature("compactdefaultargs") Extrema_ExtSS;
		%feature("autodoc", "It calculates all the distances between s1 and s2.

Parameters
----------
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface
TolS1: float
TolS2: float

Returns
-------
None
") Extrema_ExtSS;
		 Extrema_ExtSS(const Adaptor3d_Surface & S1, const Adaptor3d_Surface & S2, const Standard_Real TolS1, const Standard_Real TolS2);

		/****************** Extrema_ExtSS ******************/
		/**** md5 signature: 8a14608402b919fdeb8fbb14914f405f ****/
		%feature("compactdefaultargs") Extrema_ExtSS;
		%feature("autodoc", "It calculates all the distances between s1 and s2.

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

Returns
-------
None
") Extrema_ExtSS;
		 Extrema_ExtSS(const Adaptor3d_Surface & S1, const Adaptor3d_Surface & S2, const Standard_Real Uinf1, const Standard_Real Usup1, const Standard_Real Vinf1, const Standard_Real Vsup1, const Standard_Real Uinf2, const Standard_Real Usup2, const Standard_Real Vinf2, const Standard_Real Vsup2, const Standard_Real TolS1, const Standard_Real TolS2);

		/****************** Initialize ******************/
		/**** md5 signature: ad2fa52e6ddd361c6252c886b8810ed6 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initializes the fields of the algorithm.

Parameters
----------
S2: Adaptor3d_Surface
Uinf2: float
Usup2: float
Vinf2: float
Vsup2: float
TolS1: float

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Surface & S2, const Standard_Real Uinf2, const Standard_Real Usup2, const Standard_Real Vinf2, const Standard_Real Vsup2, const Standard_Real TolS1);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsParallel ******************/
		/**** md5 signature: 47a312fd58e74bf5bb8a9bb6f0484dfb ****/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Returns true if the curve is on a parallel surface.

Returns
-------
bool
") IsParallel;
		Standard_Boolean IsParallel();

		/****************** NbExt ******************/
		/**** md5 signature: 84ada636e4651cacf916eb056265a1d9 ****/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		/**** md5 signature: 615d1558f87698e4b2ee7b4aae202fd8 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes the distances. an exception is raised if the fieds have not been initialized.

Parameters
----------
S1: Adaptor3d_Surface
Uinf1: float
Usup1: float
Vinf1: float
Vsup1: float
TolS1: float

Returns
-------
None
") Perform;
		void Perform(const Adaptor3d_Surface & S1, const Standard_Real Uinf1, const Standard_Real Usup1, const Standard_Real Vinf1, const Standard_Real Vsup1, const Standard_Real TolS1);

		/****************** Points ******************/
		/**** md5 signature: 3c61a440dae3b36da20a5cbbb58f55ce ****/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Returns the point of the nth resulting distance.

Parameters
----------
N: int
P1: Extrema_POnSurf
P2: Extrema_POnSurf

Returns
-------
None
") Points;
		void Points(const Standard_Integer N, Extrema_POnSurf & P1, Extrema_POnSurf & P2);

		/****************** SquareDistance ******************/
		/**** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the nth resulting square distance.

Parameters
----------
N: int

Returns
-------
float
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
		/****************** Extrema_FuncExtCS ******************/
		/**** md5 signature: 6c23b588602334a4bc8250bca08449d6 ****/
		%feature("compactdefaultargs") Extrema_FuncExtCS;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_FuncExtCS;
		 Extrema_FuncExtCS();

		/****************** Extrema_FuncExtCS ******************/
		/**** md5 signature: 946df633917621e0dc617833ec3d0066 ****/
		%feature("compactdefaultargs") Extrema_FuncExtCS;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve
S: Adaptor3d_Surface

Returns
-------
None
") Extrema_FuncExtCS;
		 Extrema_FuncExtCS(const Adaptor3d_Curve & C, const Adaptor3d_Surface & S);

		/****************** Derivatives ******************/
		/**** md5 signature: 1d38afd641c7de1e5982feb10f2b7ece ****/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "Calculation of fi'(u,v).

Parameters
----------
UV: math_Vector
DF: math_Matrix

Returns
-------
bool
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & UV, math_Matrix & DF);

		/****************** GetStateNumber ******************/
		/**** md5 signature: 49c44bd66dd4ec2381671c72ebd88158 ****/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Save the found extremum.

Returns
-------
int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****************** Initialize ******************/
		/**** md5 signature: 2a333662de5748b61979b7e3164f3edb ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the field mysurf of the function.

Parameters
----------
C: Adaptor3d_Curve
S: Adaptor3d_Surface

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & C, const Adaptor3d_Surface & S);

		/****************** NbEquations ******************/
		/**** md5 signature: 23bde6b2e3d1ee771730481f97ff7ae2 ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbExt ******************/
		/**** md5 signature: 84ada636e4651cacf916eb056265a1d9 ****/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return the number of found extrema.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** NbVariables ******************/
		/**** md5 signature: c99b0d96b9b2c7c3fd7890618502162b ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** PointOnCurve ******************/
		/**** md5 signature: 443491513fb9009060a015999afb6712 ****/
		%feature("compactdefaultargs") PointOnCurve;
		%feature("autodoc", "Returns the nth extremum on c.

Parameters
----------
N: int

Returns
-------
Extrema_POnCurv
") PointOnCurve;
		const Extrema_POnCurv & PointOnCurve(const Standard_Integer N);

		/****************** PointOnSurface ******************/
		/**** md5 signature: 7f1d563227e3ab4a1d4a83ca5fcf610c ****/
		%feature("compactdefaultargs") PointOnSurface;
		%feature("autodoc", "Return the nth extremum on s.

Parameters
----------
N: int

Returns
-------
Extrema_POnSurf
") PointOnSurface;
		const Extrema_POnSurf & PointOnSurface(const Standard_Integer N);

		/****************** SquareDistance ******************/
		/**** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Return the value of the nth distance.

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****************** Value ******************/
		/**** md5 signature: 4409f39f6024165e606b9b8f7db3892e ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Calculation of fi(u,v).

Parameters
----------
UV: math_Vector
F: math_Vector

Returns
-------
bool
") Value;
		Standard_Boolean Value(const math_Vector & UV, math_Vector & F);

		/****************** Values ******************/
		/**** md5 signature: aecc35a594e467ec2fc262dd639056f5 ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Calculation of fi(u,v) and fi'(u,v).

Parameters
----------
UV: math_Vector
F: math_Vector
DF: math_Matrix

Returns
-------
bool
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
		/****************** Extrema_FuncExtSS ******************/
		/**** md5 signature: b1c358bff58d260f7c43f0bf32dc9edb ****/
		%feature("compactdefaultargs") Extrema_FuncExtSS;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_FuncExtSS;
		 Extrema_FuncExtSS();

		/****************** Extrema_FuncExtSS ******************/
		/**** md5 signature: 8395213c0a954425d4aa66501d53286b ****/
		%feature("compactdefaultargs") Extrema_FuncExtSS;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface

Returns
-------
None
") Extrema_FuncExtSS;
		 Extrema_FuncExtSS(const Adaptor3d_Surface & S1, const Adaptor3d_Surface & S2);

		/****************** Derivatives ******************/
		/**** md5 signature: 1d38afd641c7de1e5982feb10f2b7ece ****/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "Calculate fi'(u,v).

Parameters
----------
UV: math_Vector
DF: math_Matrix

Returns
-------
bool
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & UV, math_Matrix & DF);

		/****************** GetStateNumber ******************/
		/**** md5 signature: 49c44bd66dd4ec2381671c72ebd88158 ****/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Save the found extremum.

Returns
-------
int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****************** Initialize ******************/
		/**** md5 signature: bbf2a645e1835e618089044c53c8e997 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the field mysurf of the function.

Parameters
----------
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Surface & S1, const Adaptor3d_Surface & S2);

		/****************** NbEquations ******************/
		/**** md5 signature: 23bde6b2e3d1ee771730481f97ff7ae2 ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbExt ******************/
		/**** md5 signature: 84ada636e4651cacf916eb056265a1d9 ****/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return the number of found extrema.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** NbVariables ******************/
		/**** md5 signature: c99b0d96b9b2c7c3fd7890618502162b ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** PointOnS1 ******************/
		/**** md5 signature: 90624d213c63006128caeca879b24fcd ****/
		%feature("compactdefaultargs") PointOnS1;
		%feature("autodoc", "Return the nth extremum on s1.

Parameters
----------
N: int

Returns
-------
Extrema_POnSurf
") PointOnS1;
		const Extrema_POnSurf & PointOnS1(const Standard_Integer N);

		/****************** PointOnS2 ******************/
		/**** md5 signature: 38764998c5ddd9ae02fdb7d76f18f157 ****/
		%feature("compactdefaultargs") PointOnS2;
		%feature("autodoc", "Renvoie le nieme extremum sur s2.

Parameters
----------
N: int

Returns
-------
Extrema_POnSurf
") PointOnS2;
		const Extrema_POnSurf & PointOnS2(const Standard_Integer N);

		/****************** SquareDistance ******************/
		/**** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Return the value of the nth distance.

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****************** Value ******************/
		/**** md5 signature: 4409f39f6024165e606b9b8f7db3892e ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Calculate fi(u,v).

Parameters
----------
UV: math_Vector
F: math_Vector

Returns
-------
bool
") Value;
		Standard_Boolean Value(const math_Vector & UV, math_Vector & F);

		/****************** Values ******************/
		/**** md5 signature: aecc35a594e467ec2fc262dd639056f5 ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Calculate fi(u,v) and fi'(u,v).

Parameters
----------
UV: math_Vector
F: math_Vector
DF: math_Matrix

Returns
-------
bool
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
		/****************** Extrema_FuncPSDist ******************/
		/**** md5 signature: d4bd3e85716206a906af143288563b41 ****/
		%feature("compactdefaultargs") Extrema_FuncPSDist;
		%feature("autodoc", "Constructor.

Parameters
----------
theS: Adaptor3d_Surface
theP: gp_Pnt

Returns
-------
None
") Extrema_FuncPSDist;
		 Extrema_FuncPSDist(const Adaptor3d_Surface & theS, const gp_Pnt & theP);

		/****************** Gradient ******************/
		/**** md5 signature: 3c2c6e3dc1adb80c90a5b990a7bd765e ****/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "Gradient.

Parameters
----------
X: math_Vector
G: math_Vector

Returns
-------
bool
") Gradient;
		Standard_Boolean Gradient(const math_Vector & X, math_Vector & G);

		/****************** NbVariables ******************/
		/**** md5 signature: c99b0d96b9b2c7c3fd7890618502162b ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Number of variables.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** Value ******************/
		/**** md5 signature: 785b7201af1c2abaa75ddcb4aefd5f9e ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Value.

Parameters
----------
X: math_Vector

Returns
-------
F: float
") Value;
		Standard_Boolean Value(const math_Vector & X, Standard_Real &OutValue);

		/****************** Values ******************/
		/**** md5 signature: f0f16d7b5e9269bb29d01310f0af0e74 ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Value and gradient.

Parameters
----------
X: math_Vector
G: math_Vector

Returns
-------
F: float
") Values;
		Standard_Boolean Values(const math_Vector & X, Standard_Real &OutValue, math_Vector & G);

};


%extend Extrema_FuncPSDist {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Extrema_FuncPSNorm *
***************************/
class Extrema_FuncPSNorm : public math_FunctionSetWithDerivatives {
	public:
		/****************** Extrema_FuncPSNorm ******************/
		/**** md5 signature: f61a68020ce6f14065b62d66676226a0 ****/
		%feature("compactdefaultargs") Extrema_FuncPSNorm;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_FuncPSNorm;
		 Extrema_FuncPSNorm();

		/****************** Extrema_FuncPSNorm ******************/
		/**** md5 signature: fba66cad2011c86f68853470e71f3a4a ****/
		%feature("compactdefaultargs") Extrema_FuncPSNorm;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
S: Adaptor3d_Surface

Returns
-------
None
") Extrema_FuncPSNorm;
		 Extrema_FuncPSNorm(const gp_Pnt & P, const Adaptor3d_Surface & S);

		/****************** Derivatives ******************/
		/**** md5 signature: 1d38afd641c7de1e5982feb10f2b7ece ****/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "Calculate fi'(u,v).

Parameters
----------
UV: math_Vector
DF: math_Matrix

Returns
-------
bool
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & UV, math_Matrix & DF);

		/****************** GetStateNumber ******************/
		/**** md5 signature: 49c44bd66dd4ec2381671c72ebd88158 ****/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Save the found extremum.

Returns
-------
int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****************** Initialize ******************/
		/**** md5 signature: 17b5f42375df076d09bf3e8b29e98099 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the field mysurf of the function.

Parameters
----------
S: Adaptor3d_Surface

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Surface & S);

		/****************** NbEquations ******************/
		/**** md5 signature: 23bde6b2e3d1ee771730481f97ff7ae2 ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbExt ******************/
		/**** md5 signature: 84ada636e4651cacf916eb056265a1d9 ****/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return the number of found extrema.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** NbVariables ******************/
		/**** md5 signature: c99b0d96b9b2c7c3fd7890618502162b ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** Point ******************/
		/**** md5 signature: a4fcffb60ef4a8c249128141ee062afa ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the nth extremum.

Parameters
----------
N: int

Returns
-------
Extrema_POnSurf
") Point;
		const Extrema_POnSurf & Point(const Standard_Integer N);

		/****************** SetPoint ******************/
		/**** md5 signature: ad83fe26e12bb630222b6d2773210931 ****/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "Sets the field mysurf of the function.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") SetPoint;
		void SetPoint(const gp_Pnt & P);

		/****************** SquareDistance ******************/
		/**** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Return the value of the nth distance.

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****************** Value ******************/
		/**** md5 signature: 4409f39f6024165e606b9b8f7db3892e ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Calculate fi(u,v).

Parameters
----------
UV: math_Vector
F: math_Vector

Returns
-------
bool
") Value;
		Standard_Boolean Value(const math_Vector & UV, math_Vector & F);

		/****************** Values ******************/
		/**** md5 signature: aecc35a594e467ec2fc262dd639056f5 ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Calculate fi(u,v) and fi'(u,v).

Parameters
----------
UV: math_Vector
F: math_Vector
DF: math_Matrix

Returns
-------
bool
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
		/****************** Extrema_GenExtCS ******************/
		/**** md5 signature: f167ca7a9c7e606895908255498d3a2f ****/
		%feature("compactdefaultargs") Extrema_GenExtCS;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_GenExtCS;
		 Extrema_GenExtCS();

		/****************** Extrema_GenExtCS ******************/
		/**** md5 signature: bba1c45ae7b3a767217c8ab190dca0fe ****/
		%feature("compactdefaultargs") Extrema_GenExtCS;
		%feature("autodoc", "It calculates all the distances. the function f(u,v)=distance(s1(u1,v1),s2(u2,v2)) has an extremum when gradient(f)=0. the algorithm searchs all the zeros inside the definition ranges of the surfaces. nbu and nbv are used to locate the close points on the surface and nbt on the curve to find the zeros.

Parameters
----------
C: Adaptor3d_Curve
S: Adaptor3d_Surface
NbT: int
NbU: int
NbV: int
Tol1: float
Tol2: float

Returns
-------
None
") Extrema_GenExtCS;
		 Extrema_GenExtCS(const Adaptor3d_Curve & C, const Adaptor3d_Surface & S, const Standard_Integer NbT, const Standard_Integer NbU, const Standard_Integer NbV, const Standard_Real Tol1, const Standard_Real Tol2);

		/****************** Extrema_GenExtCS ******************/
		/**** md5 signature: 327c5ab7f1a3e9581157d19a9c2d2db1 ****/
		%feature("compactdefaultargs") Extrema_GenExtCS;
		%feature("autodoc", "It calculates all the distances. the function f(u,v)=distance(p,s(u,v)) has an extremum when gradient(f)=0. the algorithm searchs all the zeros inside the definition ranges of the surface. nbt,nbu and nbv are used to locate the close points to find the zeros.

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

Returns
-------
None
") Extrema_GenExtCS;
		 Extrema_GenExtCS(const Adaptor3d_Curve & C, const Adaptor3d_Surface & S, const Standard_Integer NbT, const Standard_Integer NbU, const Standard_Integer NbV, const Standard_Real tmin, const Standard_Real tsup, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real Vmin, const Standard_Real Vsup, const Standard_Real Tol1, const Standard_Real Tol2);

		/****************** Initialize ******************/
		/**** md5 signature: 4a83bdcc87d7c0e853c8303703f95130 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_Surface
NbU: int
NbV: int
Tol2: float

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Surface & S, const Standard_Integer NbU, const Standard_Integer NbV, const Standard_Real Tol2);

		/****************** Initialize ******************/
		/**** md5 signature: e8ea48bb5f9e12ba1dba0669be5fd2b8 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "No available documentation.

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

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Surface & S, const Standard_Integer NbU, const Standard_Integer NbV, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real Vmin, const Standard_Real Vsup, const Standard_Real Tol2);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbExt ******************/
		/**** md5 signature: 84ada636e4651cacf916eb056265a1d9 ****/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		/**** md5 signature: b64949bae48db2bea954e43971d938bd ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "The algorithm is done with s an exception is raised if the fields have not been initialized.

Parameters
----------
C: Adaptor3d_Curve
NbT: int
Tol1: float

Returns
-------
None
") Perform;
		void Perform(const Adaptor3d_Curve & C, const Standard_Integer NbT, const Standard_Real Tol1);

		/****************** Perform ******************/
		/**** md5 signature: 7e6ef01ddb8cf6219f4430373c7ecf2a ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "The algorithm is done with c an exception is raised if the fields have not been initialized.

Parameters
----------
C: Adaptor3d_Curve
NbT: int
tmin: float
tsup: float
Tol1: float

Returns
-------
None
") Perform;
		void Perform(const Adaptor3d_Curve & C, const Standard_Integer NbT, const Standard_Real tmin, const Standard_Real tsup, const Standard_Real Tol1);

		/****************** PointOnCurve ******************/
		/**** md5 signature: 443491513fb9009060a015999afb6712 ****/
		%feature("compactdefaultargs") PointOnCurve;
		%feature("autodoc", "Returns the point of the nth resulting distance.

Parameters
----------
N: int

Returns
-------
Extrema_POnCurv
") PointOnCurve;
		const Extrema_POnCurv & PointOnCurve(const Standard_Integer N);

		/****************** PointOnSurface ******************/
		/**** md5 signature: 7f1d563227e3ab4a1d4a83ca5fcf610c ****/
		%feature("compactdefaultargs") PointOnSurface;
		%feature("autodoc", "Returns the point of the nth resulting distance.

Parameters
----------
N: int

Returns
-------
Extrema_POnSurf
") PointOnSurface;
		const Extrema_POnSurf & PointOnSurface(const Standard_Integer N);

		/****************** SquareDistance ******************/
		/**** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the nth resulting square distance.

Parameters
----------
N: int

Returns
-------
float
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
		/****************** Extrema_GenExtPS ******************/
		/**** md5 signature: a5064b4d9e02a8b5f95bf2e555839ea7 ****/
		%feature("compactdefaultargs") Extrema_GenExtPS;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_GenExtPS;
		 Extrema_GenExtPS();

		/****************** Extrema_GenExtPS ******************/
		/**** md5 signature: daed258cc828cde49776b51c85d4209e ****/
		%feature("compactdefaultargs") Extrema_GenExtPS;
		%feature("autodoc", "It calculates all the distances. the function f(u,v)=distance(p,s(u,v)) has an extremum when gradient(f)=0. the algorithm searchs all the zeros inside the definition ranges of the surface. nbu and nbv are used to locate the close points to find the zeros. they must be great enough such that if there is n extrema, there will be n extrema between p and the grid. tolu et tolv are used to determine the conditions to stop the iterations; at the iteration number n: (un - un-1) < tolu and (vn - vn-1) < tolv .

Parameters
----------
P: gp_Pnt
S: Adaptor3d_Surface
NbU: int
NbV: int
TolU: float
TolV: float
F: Extrema_ExtFlag,optional
	default value is Extrema_ExtFlag_MINMAX
A: Extrema_ExtAlgo,optional
	default value is Extrema_ExtAlgo_Grad

Returns
-------
None
") Extrema_GenExtPS;
		 Extrema_GenExtPS(const gp_Pnt & P, const Adaptor3d_Surface & S, const Standard_Integer NbU, const Standard_Integer NbV, const Standard_Real TolU, const Standard_Real TolV, const Extrema_ExtFlag F = Extrema_ExtFlag_MINMAX, const Extrema_ExtAlgo A = Extrema_ExtAlgo_Grad);

		/****************** Extrema_GenExtPS ******************/
		/**** md5 signature: 9127ff28bfac5b4aee96e6256661db4d ****/
		%feature("compactdefaultargs") Extrema_GenExtPS;
		%feature("autodoc", "It calculates all the distances. the function f(u,v)=distance(p,s(u,v)) has an extremum when gradient(f)=0. the algorithm searchs all the zeros inside the definition ranges of the surface. nbu and nbv are used to locate the close points to find the zeros. they must be great enough such that if there is n extrema, there will be n extrema between p and the grid. tolu et tolv are used to determine the conditions to stop the iterations; at the iteration number n: (un - un-1) < tolu and (vn - vn-1) < tolv .

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
F: Extrema_ExtFlag,optional
	default value is Extrema_ExtFlag_MINMAX
A: Extrema_ExtAlgo,optional
	default value is Extrema_ExtAlgo_Grad

Returns
-------
None
") Extrema_GenExtPS;
		 Extrema_GenExtPS(const gp_Pnt & P, const Adaptor3d_Surface & S, const Standard_Integer NbU, const Standard_Integer NbV, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real Vmin, const Standard_Real Vsup, const Standard_Real TolU, const Standard_Real TolV, const Extrema_ExtFlag F = Extrema_ExtFlag_MINMAX, const Extrema_ExtAlgo A = Extrema_ExtAlgo_Grad);

		/****************** Initialize ******************/
		/**** md5 signature: 3935e57ece45d8f4e70f4ad8a1ac7165 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_Surface
NbU: int
NbV: int
TolU: float
TolV: float

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Surface & S, const Standard_Integer NbU, const Standard_Integer NbV, const Standard_Real TolU, const Standard_Real TolV);

		/****************** Initialize ******************/
		/**** md5 signature: af1484acd6b86f4299828f1bce51a25d ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "No available documentation.

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

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Surface & S, const Standard_Integer NbU, const Standard_Integer NbV, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real Vmin, const Standard_Real Vsup, const Standard_Real TolU, const Standard_Real TolV);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbExt ******************/
		/**** md5 signature: 84ada636e4651cacf916eb056265a1d9 ****/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		/**** md5 signature: 5f5e57fd55ba2b5f8e2b2be09861a3f9 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "The algorithm is done with the point p. an exception is raised if the fields have not been initialized.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt & P);

		/****************** Point ******************/
		/**** md5 signature: a4fcffb60ef4a8c249128141ee062afa ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of the nth resulting distance.

Parameters
----------
N: int

Returns
-------
Extrema_POnSurf
") Point;
		const Extrema_POnSurf & Point(const Standard_Integer N);

		/****************** SetAlgo ******************/
		/**** md5 signature: dcf7639630bf367993e8e7093ad161ed ****/
		%feature("compactdefaultargs") SetAlgo;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: Extrema_ExtAlgo

Returns
-------
None
") SetAlgo;
		void SetAlgo(const Extrema_ExtAlgo A);

		/****************** SetFlag ******************/
		/**** md5 signature: d1a9d4d7a9231db47b60f98b2475fcf4 ****/
		%feature("compactdefaultargs") SetFlag;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: Extrema_ExtFlag

Returns
-------
None
") SetFlag;
		void SetFlag(const Extrema_ExtFlag F);

		/****************** SquareDistance ******************/
		/**** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the nth resulting square distance.

Parameters
----------
N: int

Returns
-------
float
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
		/****************** Extrema_GenExtSS ******************/
		/**** md5 signature: bdbaa032cdecd5329d7e7eff59343f37 ****/
		%feature("compactdefaultargs") Extrema_GenExtSS;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_GenExtSS;
		 Extrema_GenExtSS();

		/****************** Extrema_GenExtSS ******************/
		/**** md5 signature: 0360818ba5d986552ab9f07d2828956b ****/
		%feature("compactdefaultargs") Extrema_GenExtSS;
		%feature("autodoc", "It calculates all the distances. the function f(u,v)=distance(s1(u1,v1),s2(u2,v2)) has an extremum when gradient(f)=0. the algorithm searchs all the zeros inside the definition ranges of the surfaces. nbu and nbv are used to locate the close points to find the zeros.

Parameters
----------
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface
NbU: int
NbV: int
Tol1: float
Tol2: float

Returns
-------
None
") Extrema_GenExtSS;
		 Extrema_GenExtSS(const Adaptor3d_Surface & S1, const Adaptor3d_Surface & S2, const Standard_Integer NbU, const Standard_Integer NbV, const Standard_Real Tol1, const Standard_Real Tol2);

		/****************** Extrema_GenExtSS ******************/
		/**** md5 signature: c712f92876bba0c244979fbd6c3f61fe ****/
		%feature("compactdefaultargs") Extrema_GenExtSS;
		%feature("autodoc", "It calculates all the distances. the function f(u,v)=distance(p,s(u,v)) has an extremum when gradient(f)=0. the algorithm searchs all the zeros inside the definition ranges of the surface. nbu and nbv are used to locate the close points to find the zeros.

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

Returns
-------
None
") Extrema_GenExtSS;
		 Extrema_GenExtSS(const Adaptor3d_Surface & S1, const Adaptor3d_Surface & S2, const Standard_Integer NbU, const Standard_Integer NbV, const Standard_Real U1min, const Standard_Real U1sup, const Standard_Real V1min, const Standard_Real V1sup, const Standard_Real U2min, const Standard_Real U2sup, const Standard_Real V2min, const Standard_Real V2sup, const Standard_Real Tol1, const Standard_Real Tol2);

		/****************** Initialize ******************/
		/**** md5 signature: d2ac09f99de85d3f3d302c08172f91f5 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "No available documentation.

Parameters
----------
S2: Adaptor3d_Surface
NbU: int
NbV: int
Tol2: float

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Surface & S2, const Standard_Integer NbU, const Standard_Integer NbV, const Standard_Real Tol2);

		/****************** Initialize ******************/
		/**** md5 signature: a2d550e02672d28690103ab17b8cf560 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "No available documentation.

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

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Surface & S2, const Standard_Integer NbU, const Standard_Integer NbV, const Standard_Real U2min, const Standard_Real U2sup, const Standard_Real V2min, const Standard_Real V2sup, const Standard_Real Tol2);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distances are found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbExt ******************/
		/**** md5 signature: 84ada636e4651cacf916eb056265a1d9 ****/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Returns the number of extremum distances.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Perform ******************/
		/**** md5 signature: b4320d3a27d0ca1927f3609980ebcf1b ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "The algorithm is done with s1 an exception is raised if the fields have not been initialized.

Parameters
----------
S1: Adaptor3d_Surface
Tol1: float

Returns
-------
None
") Perform;
		void Perform(const Adaptor3d_Surface & S1, const Standard_Real Tol1);

		/****************** Perform ******************/
		/**** md5 signature: 3de6570d908fa60d889e1dc36aa1ca23 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "The algorithm is done withs1 an exception is raised if the fields have not been initialized.

Parameters
----------
S1: Adaptor3d_Surface
U1min: float
U1sup: float
V1min: float
V1sup: float
Tol1: float

Returns
-------
None
") Perform;
		void Perform(const Adaptor3d_Surface & S1, const Standard_Real U1min, const Standard_Real U1sup, const Standard_Real V1min, const Standard_Real V1sup, const Standard_Real Tol1);

		/****************** PointOnS1 ******************/
		/**** md5 signature: 90624d213c63006128caeca879b24fcd ****/
		%feature("compactdefaultargs") PointOnS1;
		%feature("autodoc", "Returns the point of the nth resulting distance.

Parameters
----------
N: int

Returns
-------
Extrema_POnSurf
") PointOnS1;
		const Extrema_POnSurf & PointOnS1(const Standard_Integer N);

		/****************** PointOnS2 ******************/
		/**** md5 signature: 38764998c5ddd9ae02fdb7d76f18f157 ****/
		%feature("compactdefaultargs") PointOnS2;
		%feature("autodoc", "Returns the point of the nth resulting distance.

Parameters
----------
N: int

Returns
-------
Extrema_POnSurf
") PointOnS2;
		const Extrema_POnSurf & PointOnS2(const Standard_Integer N);

		/****************** SquareDistance ******************/
		/**** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the nth resulting square distance.

Parameters
----------
N: int

Returns
-------
float
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
		/****************** Extrema_GenLocateExtCS ******************/
		/**** md5 signature: f03a3323d64c5ae914d60d9d786ba827 ****/
		%feature("compactdefaultargs") Extrema_GenLocateExtCS;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_GenLocateExtCS;
		 Extrema_GenLocateExtCS();

		/****************** Extrema_GenLocateExtCS ******************/
		/**** md5 signature: e4b395d8dfe4cac4c586cc73639a70bb ****/
		%feature("compactdefaultargs") Extrema_GenLocateExtCS;
		%feature("autodoc", "Calculates the distance with two close points. the close points are defined by the parameter values t for c and (u,v) for s. the function f(t,u,v)=distance(c(t),s(u,v)) has an extremun when gradient(f)=0. the algorithm searchs a zero near the close points.

Parameters
----------
C: Adaptor3d_Curve
S: Adaptor3d_Surface
T: float
U: float
V: float
Tol1: float
Tol2: float

Returns
-------
None
") Extrema_GenLocateExtCS;
		 Extrema_GenLocateExtCS(const Adaptor3d_Curve & C, const Adaptor3d_Surface & S, const Standard_Real T, const Standard_Real U, const Standard_Real V, const Standard_Real Tol1, const Standard_Real Tol2);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distance is found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Perform ******************/
		/**** md5 signature: be105fb152356ea7c716b2f46c5d1c6f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_Curve
S: Adaptor3d_Surface
T: float
U: float
V: float
Tol1: float
Tol2: float

Returns
-------
None
") Perform;
		void Perform(const Adaptor3d_Curve & C, const Adaptor3d_Surface & S, const Standard_Real T, const Standard_Real U, const Standard_Real V, const Standard_Real Tol1, const Standard_Real Tol2);

		/****************** PointOnCurve ******************/
		/**** md5 signature: 12e75a03d4a94b00a001654daac03f2b ****/
		%feature("compactdefaultargs") PointOnCurve;
		%feature("autodoc", "Returns the point of the extremum distance on c.

Returns
-------
Extrema_POnCurv
") PointOnCurve;
		const Extrema_POnCurv & PointOnCurve();

		/****************** PointOnSurface ******************/
		/**** md5 signature: 93e63de442d026d56322abfcd73004ce ****/
		%feature("compactdefaultargs") PointOnSurface;
		%feature("autodoc", "Returns the point of the extremum distance on s.

Returns
-------
Extrema_POnSurf
") PointOnSurface;
		const Extrema_POnSurf & PointOnSurface();

		/****************** SquareDistance ******************/
		/**** md5 signature: 2eba58521e0603c1ef0e683534b03956 ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the extremum square distance.

Returns
-------
float
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
		/****************** Extrema_GenLocateExtPS ******************/
		/**** md5 signature: c9c8d5943e8eebe4ebf77c504636c800 ****/
		%feature("compactdefaultargs") Extrema_GenLocateExtPS;
		%feature("autodoc", "Constructor.

Parameters
----------
theS: Adaptor3d_Surface
theTolU: float,optional
	default value is Precision::PConfusion()
theTolV: float,optional
	default value is Precision::PConfusion()

Returns
-------
None
") Extrema_GenLocateExtPS;
		 Extrema_GenLocateExtPS(const Adaptor3d_Surface & theS, const Standard_Real theTolU = Precision::PConfusion(), const Standard_Real theTolV = Precision::PConfusion());

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distance is found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Perform ******************/
		/**** md5 signature: 1356c2657a2e0ea627880218a7af615f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Calculates the extrema between the point and the surface using a close point. the close point is defined by the parameter values theu0 and thev0. type of the algorithm depends on the isdistancecriteria flag. if flag value is false - normal projection criteria will be used. if flag value is true - distance criteria will be used.

Parameters
----------
theP: gp_Pnt
theU0: float
theV0: float
isDistanceCriteria: bool,optional
	default value is Standard_False

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt & theP, const Standard_Real theU0, const Standard_Real theV0, const Standard_Boolean isDistanceCriteria = Standard_False);

		/****************** Point ******************/
		/**** md5 signature: 495077ccedcb1863c9951b01a84a4bd1 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of the extremum distance.

Returns
-------
Extrema_POnSurf
") Point;
		const Extrema_POnSurf & Point();

		/****************** SquareDistance ******************/
		/**** md5 signature: 2eba58521e0603c1ef0e683534b03956 ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the extremum square distance.

Returns
-------
float
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
		/****************** Extrema_GenLocateExtSS ******************/
		/**** md5 signature: 04ab116b2b054b428cded25821b973b5 ****/
		%feature("compactdefaultargs") Extrema_GenLocateExtSS;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_GenLocateExtSS;
		 Extrema_GenLocateExtSS();

		/****************** Extrema_GenLocateExtSS ******************/
		/**** md5 signature: ecd085c1d3d7d14e4947fbff65cc1cdf ****/
		%feature("compactdefaultargs") Extrema_GenLocateExtSS;
		%feature("autodoc", "Calculates the distance with two close points. the close points are defined by the parameter values (u1,v1) for s1 and (u2,v2) for s2. the function f(u1,v1,u2,v2)=distance(s1(u1,v1),s2(u2,v2)) has an extremun when gradient(f)=0. the algorithm searchs a zero near the close points.

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

Returns
-------
None
") Extrema_GenLocateExtSS;
		 Extrema_GenLocateExtSS(const Adaptor3d_Surface & S1, const Adaptor3d_Surface & S2, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, const Standard_Real Tol1, const Standard_Real Tol2);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distance is found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Perform ******************/
		/**** md5 signature: cfe9cb870bc63c0d808034e1ebefe62b ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

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

Returns
-------
None
") Perform;
		void Perform(const Adaptor3d_Surface & S1, const Adaptor3d_Surface & S2, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, const Standard_Real Tol1, const Standard_Real Tol2);

		/****************** PointOnS1 ******************/
		/**** md5 signature: a968c7bd12e452b2a800b3175543fbbd ****/
		%feature("compactdefaultargs") PointOnS1;
		%feature("autodoc", "Returns the point of the extremum distance on s1.

Returns
-------
Extrema_POnSurf
") PointOnS1;
		const Extrema_POnSurf & PointOnS1();

		/****************** PointOnS2 ******************/
		/**** md5 signature: 158037b8ed7d0d3eff38e68c16d54d08 ****/
		%feature("compactdefaultargs") PointOnS2;
		%feature("autodoc", "Returns the point of the extremum distance on s2.

Returns
-------
Extrema_POnSurf
") PointOnS2;
		const Extrema_POnSurf & PointOnS2();

		/****************** SquareDistance ******************/
		/**** md5 signature: 2eba58521e0603c1ef0e683534b03956 ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the extremum square distance.

Returns
-------
float
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
		/****************** Extrema_GlobOptFuncCCC0 ******************/
		/**** md5 signature: 4c8e75f4abe82a228a576c9c9ebce67c ****/
		%feature("compactdefaultargs") Extrema_GlobOptFuncCCC0;
		%feature("autodoc", "No available documentation.

Parameters
----------
C1: Adaptor3d_Curve
C2: Adaptor3d_Curve

Returns
-------
None
") Extrema_GlobOptFuncCCC0;
		 Extrema_GlobOptFuncCCC0(const Adaptor3d_Curve & C1, const Adaptor3d_Curve & C2);

		/****************** Extrema_GlobOptFuncCCC0 ******************/
		/**** md5 signature: e18f677b2f1ba0bff87cb13675251910 ****/
		%feature("compactdefaultargs") Extrema_GlobOptFuncCCC0;
		%feature("autodoc", "No available documentation.

Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d

Returns
-------
None
") Extrema_GlobOptFuncCCC0;
		 Extrema_GlobOptFuncCCC0(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2);

		/****************** NbVariables ******************/
		/**** md5 signature: 922c68b9d7f8438f91dc9a997354b8f8 ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****************** Value ******************/
		/**** md5 signature: 22e87ab6030399152b72d08cc5e678ff ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: math_Vector

Returns
-------
F: float
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
		/****************** Extrema_GlobOptFuncCCC1 ******************/
		/**** md5 signature: 98857765fc04180c91ffe4cacb51c277 ****/
		%feature("compactdefaultargs") Extrema_GlobOptFuncCCC1;
		%feature("autodoc", "No available documentation.

Parameters
----------
C1: Adaptor3d_Curve
C2: Adaptor3d_Curve

Returns
-------
None
") Extrema_GlobOptFuncCCC1;
		 Extrema_GlobOptFuncCCC1(const Adaptor3d_Curve & C1, const Adaptor3d_Curve & C2);

		/****************** Extrema_GlobOptFuncCCC1 ******************/
		/**** md5 signature: 59777f669e43d9a0e0c772dea464c1d3 ****/
		%feature("compactdefaultargs") Extrema_GlobOptFuncCCC1;
		%feature("autodoc", "No available documentation.

Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d

Returns
-------
None
") Extrema_GlobOptFuncCCC1;
		 Extrema_GlobOptFuncCCC1(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2);

		/****************** Gradient ******************/
		/**** md5 signature: afb14635ff3747ce6e48aa62585027fc ****/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: math_Vector
G: math_Vector

Returns
-------
bool
") Gradient;
		virtual Standard_Boolean Gradient(const math_Vector & X, math_Vector & G);

		/****************** NbVariables ******************/
		/**** md5 signature: 922c68b9d7f8438f91dc9a997354b8f8 ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****************** Value ******************/
		/**** md5 signature: 22e87ab6030399152b72d08cc5e678ff ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: math_Vector

Returns
-------
F: float
") Value;
		virtual Standard_Boolean Value(const math_Vector & X, Standard_Real &OutValue);

		/****************** Values ******************/
		/**** md5 signature: e2748a3160e1b3e6076f299cbf419f60 ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: math_Vector
G: math_Vector

Returns
-------
F: float
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
		/****************** Extrema_GlobOptFuncCCC2 ******************/
		/**** md5 signature: 352f6f3921ee64f4e551f09f65ab03d9 ****/
		%feature("compactdefaultargs") Extrema_GlobOptFuncCCC2;
		%feature("autodoc", "No available documentation.

Parameters
----------
C1: Adaptor3d_Curve
C2: Adaptor3d_Curve

Returns
-------
None
") Extrema_GlobOptFuncCCC2;
		 Extrema_GlobOptFuncCCC2(const Adaptor3d_Curve & C1, const Adaptor3d_Curve & C2);

		/****************** Extrema_GlobOptFuncCCC2 ******************/
		/**** md5 signature: 9fa14c64a37952aec04b224f8f6000e9 ****/
		%feature("compactdefaultargs") Extrema_GlobOptFuncCCC2;
		%feature("autodoc", "No available documentation.

Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d

Returns
-------
None
") Extrema_GlobOptFuncCCC2;
		 Extrema_GlobOptFuncCCC2(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2);

		/****************** Gradient ******************/
		/**** md5 signature: afb14635ff3747ce6e48aa62585027fc ****/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: math_Vector
G: math_Vector

Returns
-------
bool
") Gradient;
		virtual Standard_Boolean Gradient(const math_Vector & X, math_Vector & G);

		/****************** NbVariables ******************/
		/**** md5 signature: 922c68b9d7f8438f91dc9a997354b8f8 ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****************** Value ******************/
		/**** md5 signature: 22e87ab6030399152b72d08cc5e678ff ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: math_Vector

Returns
-------
F: float
") Value;
		virtual Standard_Boolean Value(const math_Vector & X, Standard_Real &OutValue);

		/****************** Values ******************/
		/**** md5 signature: e2748a3160e1b3e6076f299cbf419f60 ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: math_Vector
G: math_Vector

Returns
-------
F: float
") Values;
		virtual Standard_Boolean Values(const math_Vector & X, Standard_Real &OutValue, math_Vector & G);

		/****************** Values ******************/
		/**** md5 signature: 71c153f156506b8614d434a26bc9aaff ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: math_Vector
G: math_Vector
H: math_Matrix

Returns
-------
F: float
") Values;
		virtual Standard_Boolean Values(const math_Vector & X, Standard_Real &OutValue, math_Vector & G, math_Matrix & H);

};


%extend Extrema_GlobOptFuncCCC2 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Extrema_GlobOptFuncCS *
******************************/
class Extrema_GlobOptFuncCS : public math_MultipleVarFunctionWithHessian {
	public:
		/****************** Extrema_GlobOptFuncCS ******************/
		/**** md5 signature: 64fbaf8331a8fc8e7744730ac6295a01 ****/
		%feature("compactdefaultargs") Extrema_GlobOptFuncCS;
		%feature("autodoc", "Curve and surface should exist during all the lifetime of extrema_globoptfunccs.

Parameters
----------
C: Adaptor3d_Curve *
S: Adaptor3d_Surface *

Returns
-------
None
") Extrema_GlobOptFuncCS;
		 Extrema_GlobOptFuncCS(const Adaptor3d_Curve * C, const Adaptor3d_Surface * S);

		/****************** Gradient ******************/
		/**** md5 signature: 26c6a323173ad7afe76b93c684ea910c ****/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "No available documentation.

Parameters
----------
theX: math_Vector
theG: math_Vector

Returns
-------
bool
") Gradient;
		virtual Standard_Boolean Gradient(const math_Vector & theX, math_Vector & theG);

		/****************** NbVariables ******************/
		/**** md5 signature: 922c68b9d7f8438f91dc9a997354b8f8 ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****************** Value ******************/
		/**** md5 signature: fb3656bc314c1cff1090e6eb65303c3a ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
theX: math_Vector

Returns
-------
theF: float
") Value;
		virtual Standard_Boolean Value(const math_Vector & theX, Standard_Real &OutValue);

		/****************** Values ******************/
		/**** md5 signature: 37f6d953c44cf76defcd3c5a888ec005 ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "No available documentation.

Parameters
----------
theX: math_Vector
theG: math_Vector

Returns
-------
theF: float
") Values;
		virtual Standard_Boolean Values(const math_Vector & theX, Standard_Real &OutValue, math_Vector & theG);

		/****************** Values ******************/
		/**** md5 signature: b8b1e960aca0090037e8d83ff258eb98 ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "No available documentation.

Parameters
----------
theX: math_Vector
theG: math_Vector
theH: math_Matrix

Returns
-------
theF: float
") Values;
		virtual Standard_Boolean Values(const math_Vector & theX, Standard_Real &OutValue, math_Vector & theG, math_Matrix & theH);

};


%extend Extrema_GlobOptFuncCS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Extrema_LocECC *
***********************/
class Extrema_LocECC {
	public:
		/****************** Extrema_LocECC ******************/
		/**** md5 signature: b7729509f3f5df86a49fc9bcf1ed4ca4 ****/
		%feature("compactdefaultargs") Extrema_LocECC;
		%feature("autodoc", "Calculates the distance with a close point. the close point is defined by a parameter value on each curve. the function f(u,v)=distance(c1(u),c2(v)) has an extremun when gradient(f)=0. the algorithm searchs the zero near the close point.

Parameters
----------
C1: Adaptor3d_Curve
C2: Adaptor3d_Curve
U0: float
V0: float
TolU: float
TolV: float

Returns
-------
None
") Extrema_LocECC;
		 Extrema_LocECC(const Adaptor3d_Curve & C1, const Adaptor3d_Curve & C2, const Standard_Real U0, const Standard_Real V0, const Standard_Real TolU, const Standard_Real TolV);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distance is found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Point ******************/
		/**** md5 signature: 7be28bf48146b84b5c9a78b62f7a11e6 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the points of the extremum distance. p1 is on the first curve, p2 on the second one.

Parameters
----------
P1: Extrema_POnCurv
P2: Extrema_POnCurv

Returns
-------
None
") Point;
		void Point(Extrema_POnCurv & P1, Extrema_POnCurv & P2);

		/****************** SquareDistance ******************/
		/**** md5 signature: 2eba58521e0603c1ef0e683534b03956 ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the extremum square distance.

Returns
-------
float
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
		/****************** Extrema_LocECC2d ******************/
		/**** md5 signature: 6498e5613a60c1f849de06e79134f45c ****/
		%feature("compactdefaultargs") Extrema_LocECC2d;
		%feature("autodoc", "Calculates the distance with a close point. the close point is defined by a parameter value on each curve. the function f(u,v)=distance(c1(u),c2(v)) has an extremun when gradient(f)=0. the algorithm searchs the zero near the close point.

Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d
U0: float
V0: float
TolU: float
TolV: float

Returns
-------
None
") Extrema_LocECC2d;
		 Extrema_LocECC2d(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2, const Standard_Real U0, const Standard_Real V0, const Standard_Real TolU, const Standard_Real TolV);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distance is found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Point ******************/
		/**** md5 signature: 22f957435cf6e3814ad63d5f9079e8df ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the points of the extremum distance. p1 is on the first curve, p2 on the second one.

Parameters
----------
P1: Extrema_POnCurv2d
P2: Extrema_POnCurv2d

Returns
-------
None
") Point;
		void Point(Extrema_POnCurv2d & P1, Extrema_POnCurv2d & P2);

		/****************** SquareDistance ******************/
		/**** md5 signature: 2eba58521e0603c1ef0e683534b03956 ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the extremum square distance.

Returns
-------
float
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
		/****************** Extrema_LocEPCOfLocateExtPC ******************/
		/**** md5 signature: 66f71ce2df9e8f2946e4972c6f72b590 ****/
		%feature("compactdefaultargs") Extrema_LocEPCOfLocateExtPC;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_LocEPCOfLocateExtPC;
		 Extrema_LocEPCOfLocateExtPC();

		/****************** Extrema_LocEPCOfLocateExtPC ******************/
		/**** md5 signature: b7a86f687213d8fba59800755f030350 ****/
		%feature("compactdefaultargs") Extrema_LocEPCOfLocateExtPC;
		%feature("autodoc", "Calculates the distance with a close point. the close point is defined by the parameter value u0. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs a zero near the close point. tolu is used to decide to stop the iterations. at the nth iteration, the criteria is: abs(un - un-1) < tolu.

Parameters
----------
P: gp_Pnt
C: Adaptor3d_Curve
U0: float
TolU: float

Returns
-------
None
") Extrema_LocEPCOfLocateExtPC;
		 Extrema_LocEPCOfLocateExtPC(const gp_Pnt & P, const Adaptor3d_Curve & C, const Standard_Real U0, const Standard_Real TolU);

		/****************** Extrema_LocEPCOfLocateExtPC ******************/
		/**** md5 signature: 6dbc9dd4faaee8fbc458b42a67c3818b ****/
		%feature("compactdefaultargs") Extrema_LocEPCOfLocateExtPC;
		%feature("autodoc", "Calculates the distance with a close point. the close point is defined by the parameter value u0. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs a zero near the close point. zeros are searched between umin et usup. tolu is used to decide to stop the iterations. at the nth iteration, the criteria is: abs(un - un-1) < tolu.

Parameters
----------
P: gp_Pnt
C: Adaptor3d_Curve
U0: float
Umin: float
Usup: float
TolU: float

Returns
-------
None
") Extrema_LocEPCOfLocateExtPC;
		 Extrema_LocEPCOfLocateExtPC(const gp_Pnt & P, const Adaptor3d_Curve & C, const Standard_Real U0, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU);

		/****************** Initialize ******************/
		/**** md5 signature: b366bc0866e4c9bd91feeb2d622b9429 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the fields of the algorithm.

Parameters
----------
C: Adaptor3d_Curve
Umin: float
Usup: float
TolU: float

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & C, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distance is found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsMin ******************/
		/**** md5 signature: 1c0b1dbd0d0c10c93cbf9fefce4bad3b ****/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Returns true if the extremum distance is a minimum.

Returns
-------
bool
") IsMin;
		Standard_Boolean IsMin();

		/****************** Perform ******************/
		/**** md5 signature: 80dee1efa9a81900cc5a0ffc01b29939 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "The algorithm is done with the point p. an exception is raised if the fields have not been initialized.

Parameters
----------
P: gp_Pnt
U0: float

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt & P, const Standard_Real U0);

		/****************** Point ******************/
		/**** md5 signature: cbae88a409f01ccc40b5f6e748da8348 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of the extremum distance.

Returns
-------
Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point();

		/****************** SquareDistance ******************/
		/**** md5 signature: 2eba58521e0603c1ef0e683534b03956 ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the extremum square distance.

Returns
-------
float
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
		/****************** Extrema_LocEPCOfLocateExtPC2d ******************/
		/**** md5 signature: f96b86bdfae52ea044299c58e74051b8 ****/
		%feature("compactdefaultargs") Extrema_LocEPCOfLocateExtPC2d;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_LocEPCOfLocateExtPC2d;
		 Extrema_LocEPCOfLocateExtPC2d();

		/****************** Extrema_LocEPCOfLocateExtPC2d ******************/
		/**** md5 signature: 879fbc456e9fc716f88079cbe4c20275 ****/
		%feature("compactdefaultargs") Extrema_LocEPCOfLocateExtPC2d;
		%feature("autodoc", "Calculates the distance with a close point. the close point is defined by the parameter value u0. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs a zero near the close point. tolu is used to decide to stop the iterations. at the nth iteration, the criteria is: abs(un - un-1) < tolu.

Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d
U0: float
TolU: float

Returns
-------
None
") Extrema_LocEPCOfLocateExtPC2d;
		 Extrema_LocEPCOfLocateExtPC2d(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C, const Standard_Real U0, const Standard_Real TolU);

		/****************** Extrema_LocEPCOfLocateExtPC2d ******************/
		/**** md5 signature: 03740e511e912a1b646a373d0676107f ****/
		%feature("compactdefaultargs") Extrema_LocEPCOfLocateExtPC2d;
		%feature("autodoc", "Calculates the distance with a close point. the close point is defined by the parameter value u0. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs a zero near the close point. zeros are searched between umin et usup. tolu is used to decide to stop the iterations. at the nth iteration, the criteria is: abs(un - un-1) < tolu.

Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d
U0: float
Umin: float
Usup: float
TolU: float

Returns
-------
None
") Extrema_LocEPCOfLocateExtPC2d;
		 Extrema_LocEPCOfLocateExtPC2d(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C, const Standard_Real U0, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU);

		/****************** Initialize ******************/
		/**** md5 signature: 673c63ed8f08af5bcfdd5ced5f979463 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the fields of the algorithm.

Parameters
----------
C: Adaptor2d_Curve2d
Umin: float
Usup: float
TolU: float

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distance is found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsMin ******************/
		/**** md5 signature: 1c0b1dbd0d0c10c93cbf9fefce4bad3b ****/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Returns true if the extremum distance is a minimum.

Returns
-------
bool
") IsMin;
		Standard_Boolean IsMin();

		/****************** Perform ******************/
		/**** md5 signature: 572d96f228989fec803e5b8f273e32cd ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "The algorithm is done with the point p. an exception is raised if the fields have not been initialized.

Parameters
----------
P: gp_Pnt2d
U0: float

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt2d & P, const Standard_Real U0);

		/****************** Point ******************/
		/**** md5 signature: 0b14be81c893f7916dafa40cecb53c69 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of the extremum distance.

Returns
-------
Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point();

		/****************** SquareDistance ******************/
		/**** md5 signature: 2eba58521e0603c1ef0e683534b03956 ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the extremum square distance.

Returns
-------
float
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
		/****************** Extrema_LocateExtCC ******************/
		/**** md5 signature: c5d4ad63f928f38bacb40f7e1b99f897 ****/
		%feature("compactdefaultargs") Extrema_LocateExtCC;
		%feature("autodoc", "Calculates the distance with a close point. the close point is defined by a parameter value on each curve. the function f(u,v)=distance(c1(u),c2(v)) has an extremun when gradient(f)=0. the algorithm searchs the zero near the close point.

Parameters
----------
C1: Adaptor3d_Curve
C2: Adaptor3d_Curve
U0: float
V0: float

Returns
-------
None
") Extrema_LocateExtCC;
		 Extrema_LocateExtCC(const Adaptor3d_Curve & C1, const Adaptor3d_Curve & C2, const Standard_Real U0, const Standard_Real V0);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distance is found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Point ******************/
		/**** md5 signature: 7be28bf48146b84b5c9a78b62f7a11e6 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the points of the extremum distance. p1 is on the first curve, p2 on the second one.

Parameters
----------
P1: Extrema_POnCurv
P2: Extrema_POnCurv

Returns
-------
None
") Point;
		void Point(Extrema_POnCurv & P1, Extrema_POnCurv & P2);

		/****************** SquareDistance ******************/
		/**** md5 signature: 2eba58521e0603c1ef0e683534b03956 ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the extremum square distance.

Returns
-------
float
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
		/****************** Extrema_LocateExtCC2d ******************/
		/**** md5 signature: aeae2a9a17c936a1feeafeb2cf4c33c0 ****/
		%feature("compactdefaultargs") Extrema_LocateExtCC2d;
		%feature("autodoc", "Calculates the distance with a close point. the close point is defined by a parameter value on each curve. the function f(u,v)=distance(c1(u),c2(v)) has an extremun when gradient(f)=0. the algorithm searchs the zero near the close point.

Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d
U0: float
V0: float

Returns
-------
None
") Extrema_LocateExtCC2d;
		 Extrema_LocateExtCC2d(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2, const Standard_Real U0, const Standard_Real V0);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distance is found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Point ******************/
		/**** md5 signature: 22f957435cf6e3814ad63d5f9079e8df ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the points of the extremum distance. p1 is on the first curve, p2 on the second one.

Parameters
----------
P1: Extrema_POnCurv2d
P2: Extrema_POnCurv2d

Returns
-------
None
") Point;
		void Point(Extrema_POnCurv2d & P1, Extrema_POnCurv2d & P2);

		/****************** SquareDistance ******************/
		/**** md5 signature: 2eba58521e0603c1ef0e683534b03956 ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the extremum square distance.

Returns
-------
float
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
		/****************** Extrema_LocateExtPC ******************/
		/**** md5 signature: 7eb1e85b77c9c5c50f1db7e44f76ed63 ****/
		%feature("compactdefaultargs") Extrema_LocateExtPC;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_LocateExtPC;
		 Extrema_LocateExtPC();

		/****************** Extrema_LocateExtPC ******************/
		/**** md5 signature: 1f82bfa9e68e569fd665333dc6cc52d7 ****/
		%feature("compactdefaultargs") Extrema_LocateExtPC;
		%feature("autodoc", "Calculates the distance with a close point. the close point is defined by the parameter value u0. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs a zero near the close point. tolf is used to decide to stop the iterations. at the nth iteration, the criteria is: abs(un - un-1) < tolf.

Parameters
----------
P: gp_Pnt
C: Adaptor3d_Curve
U0: float
TolF: float

Returns
-------
None
") Extrema_LocateExtPC;
		 Extrema_LocateExtPC(const gp_Pnt & P, const Adaptor3d_Curve & C, const Standard_Real U0, const Standard_Real TolF);

		/****************** Extrema_LocateExtPC ******************/
		/**** md5 signature: 562aab74aab68868fccddce757fa6257 ****/
		%feature("compactdefaultargs") Extrema_LocateExtPC;
		%feature("autodoc", "Calculates the distance with a close point. the close point is defined by the parameter value u0. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs a zero near the close point. zeros are searched between umin et usup. tolf is used to decide to stop the iterations. at the nth iteration, the criteria is: abs(un - un-1) < tolf.

Parameters
----------
P: gp_Pnt
C: Adaptor3d_Curve
U0: float
Umin: float
Usup: float
TolF: float

Returns
-------
None
") Extrema_LocateExtPC;
		 Extrema_LocateExtPC(const gp_Pnt & P, const Adaptor3d_Curve & C, const Standard_Real U0, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolF);

		/****************** Initialize ******************/
		/**** md5 signature: 672c2fe8452184af0062847acc5e004d ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the fields of the algorithm.

Parameters
----------
C: Adaptor3d_Curve
Umin: float
Usup: float
TolF: float

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & C, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolF);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distance is found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsMin ******************/
		/**** md5 signature: 1c0b1dbd0d0c10c93cbf9fefce4bad3b ****/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Returns true if the extremum distance is a minimum.

Returns
-------
bool
") IsMin;
		Standard_Boolean IsMin();

		/****************** Perform ******************/
		/**** md5 signature: 80dee1efa9a81900cc5a0ffc01b29939 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
U0: float

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt & P, const Standard_Real U0);

		/****************** Point ******************/
		/**** md5 signature: cbae88a409f01ccc40b5f6e748da8348 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of the extremum distance.

Returns
-------
Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point();

		/****************** SquareDistance ******************/
		/**** md5 signature: 2eba58521e0603c1ef0e683534b03956 ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the extremum square distance.

Returns
-------
float
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
		/****************** Extrema_LocateExtPC2d ******************/
		/**** md5 signature: 6f5d46eb2a574ff5eff5a750dadcb13b ****/
		%feature("compactdefaultargs") Extrema_LocateExtPC2d;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_LocateExtPC2d;
		 Extrema_LocateExtPC2d();

		/****************** Extrema_LocateExtPC2d ******************/
		/**** md5 signature: b4963ac0ef219fdc026e3860d56ab1ff ****/
		%feature("compactdefaultargs") Extrema_LocateExtPC2d;
		%feature("autodoc", "Calculates the distance with a close point. the close point is defined by the parameter value u0. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs a zero near the close point. tolf is used to decide to stop the iterations. at the nth iteration, the criteria is: abs(un - un-1) < tolf.

Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d
U0: float
TolF: float

Returns
-------
None
") Extrema_LocateExtPC2d;
		 Extrema_LocateExtPC2d(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C, const Standard_Real U0, const Standard_Real TolF);

		/****************** Extrema_LocateExtPC2d ******************/
		/**** md5 signature: b92462651cc4a17c9d9664a4fc8748c0 ****/
		%feature("compactdefaultargs") Extrema_LocateExtPC2d;
		%feature("autodoc", "Calculates the distance with a close point. the close point is defined by the parameter value u0. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs a zero near the close point. zeros are searched between umin et usup. tolf is used to decide to stop the iterations. at the nth iteration, the criteria is: abs(un - un-1) < tolf.

Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d
U0: float
Umin: float
Usup: float
TolF: float

Returns
-------
None
") Extrema_LocateExtPC2d;
		 Extrema_LocateExtPC2d(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C, const Standard_Real U0, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolF);

		/****************** Initialize ******************/
		/**** md5 signature: c490b029df4e55930b61cb6254e04484 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the fields of the algorithm.

Parameters
----------
C: Adaptor2d_Curve2d
Umin: float
Usup: float
TolF: float

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolF);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distance is found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsMin ******************/
		/**** md5 signature: 1c0b1dbd0d0c10c93cbf9fefce4bad3b ****/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Returns true if the extremum distance is a minimum.

Returns
-------
bool
") IsMin;
		Standard_Boolean IsMin();

		/****************** Perform ******************/
		/**** md5 signature: 572d96f228989fec803e5b8f273e32cd ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt2d
U0: float

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt2d & P, const Standard_Real U0);

		/****************** Point ******************/
		/**** md5 signature: 0b14be81c893f7916dafa40cecb53c69 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of the extremum distance.

Returns
-------
Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point();

		/****************** SquareDistance ******************/
		/**** md5 signature: 2eba58521e0603c1ef0e683534b03956 ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the extremum square distance.

Returns
-------
float
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
		/****************** Extrema_PCFOfEPCOfELPCOfLocateExtPC ******************/
		/**** md5 signature: ede7b80994121dc61efd63baf98ea782 ****/
		%feature("compactdefaultargs") Extrema_PCFOfEPCOfELPCOfLocateExtPC;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_PCFOfEPCOfELPCOfLocateExtPC;
		 Extrema_PCFOfEPCOfELPCOfLocateExtPC();

		/****************** Extrema_PCFOfEPCOfELPCOfLocateExtPC ******************/
		/**** md5 signature: 512f484f13df650a452c316f30d2b629 ****/
		%feature("compactdefaultargs") Extrema_PCFOfEPCOfELPCOfLocateExtPC;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
C: Adaptor3d_Curve

Returns
-------
None
") Extrema_PCFOfEPCOfELPCOfLocateExtPC;
		 Extrema_PCFOfEPCOfELPCOfLocateExtPC(const gp_Pnt & P, const Adaptor3d_Curve & C);

		/****************** Derivative ******************/
		/**** md5 signature: 74e45b7ef1cb50395f459121235df2cd ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Calculation of f'(u).

Parameters
----------
U: float

Returns
-------
DF: float
") Derivative;
		Standard_Boolean Derivative(const Standard_Real U, Standard_Real &OutValue);

		/****************** GetStateNumber ******************/
		/**** md5 signature: 49c44bd66dd4ec2381671c72ebd88158 ****/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Save the found extremum.

Returns
-------
int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****************** Initialize ******************/
		/**** md5 signature: 96ecca85f670f0aff9194161a9bd5dc1 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the field mycurve of the function.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & C);

		/****************** IsMin ******************/
		/**** md5 signature: d296cefb075e9db02ee60a375c81a9f6 ****/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Shows if the nth distance is a minimum.

Parameters
----------
N: int

Returns
-------
bool
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****************** NbExt ******************/
		/**** md5 signature: 84ada636e4651cacf916eb056265a1d9 ****/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return the nunber of found extrema.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Point ******************/
		/**** md5 signature: 1a3c4a6f09c4cb823314eefe5165e75c ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the nth extremum.

Parameters
----------
N: int

Returns
-------
Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point(const Standard_Integer N);

		/****************** SearchOfTolerance ******************/
		/**** md5 signature: 73a2a1f7b776ed3aaadf205798ee8767 ****/
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "Computes a tol value. if 1st derivative of curve |d1|<tol, it is considered d1=0.

Returns
-------
float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance();

		/****************** SetPoint ******************/
		/**** md5 signature: ad83fe26e12bb630222b6d2773210931 ****/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "Sets the field p of the function.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") SetPoint;
		void SetPoint(const gp_Pnt & P);

		/****************** SquareDistance ******************/
		/**** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the nth distance.

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****************** SubIntervalInitialize ******************/
		/**** md5 signature: 424565e975e565ea668d16ca9ce728b5 ****/
		%feature("compactdefaultargs") SubIntervalInitialize;
		%feature("autodoc", "Determines boundaries of subinterval for find of root.

Parameters
----------
theUfirst: float
theUlast: float

Returns
-------
None
") SubIntervalInitialize;
		void SubIntervalInitialize(const Standard_Real theUfirst, const Standard_Real theUlast);

		/****************** Value ******************/
		/**** md5 signature: e3462efa1edccfd4021bca61bc42d936 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Calculation of f(u).

Parameters
----------
U: float

Returns
-------
F: float
") Value;
		Standard_Boolean Value(const Standard_Real U, Standard_Real &OutValue);

		/****************** Values ******************/
		/**** md5 signature: a9de0e54fbbad71406954eb825560b84 ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Calculation of f(u) and f'(u).

Parameters
----------
U: float

Returns
-------
F: float
DF: float
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
		/****************** Extrema_PCFOfEPCOfELPCOfLocateExtPC2d ******************/
		/**** md5 signature: f48caab5be52a078e7f90582d9b9dee9 ****/
		%feature("compactdefaultargs") Extrema_PCFOfEPCOfELPCOfLocateExtPC2d;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_PCFOfEPCOfELPCOfLocateExtPC2d;
		 Extrema_PCFOfEPCOfELPCOfLocateExtPC2d();

		/****************** Extrema_PCFOfEPCOfELPCOfLocateExtPC2d ******************/
		/**** md5 signature: dec1f8587bce8cd308827800fd89df3b ****/
		%feature("compactdefaultargs") Extrema_PCFOfEPCOfELPCOfLocateExtPC2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d

Returns
-------
None
") Extrema_PCFOfEPCOfELPCOfLocateExtPC2d;
		 Extrema_PCFOfEPCOfELPCOfLocateExtPC2d(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C);

		/****************** Derivative ******************/
		/**** md5 signature: 74e45b7ef1cb50395f459121235df2cd ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Calculation of f'(u).

Parameters
----------
U: float

Returns
-------
DF: float
") Derivative;
		Standard_Boolean Derivative(const Standard_Real U, Standard_Real &OutValue);

		/****************** GetStateNumber ******************/
		/**** md5 signature: 49c44bd66dd4ec2381671c72ebd88158 ****/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Save the found extremum.

Returns
-------
int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****************** Initialize ******************/
		/**** md5 signature: 295b46cc3c15eb5116b8523fecaa122c ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the field mycurve of the function.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C);

		/****************** IsMin ******************/
		/**** md5 signature: d296cefb075e9db02ee60a375c81a9f6 ****/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Shows if the nth distance is a minimum.

Parameters
----------
N: int

Returns
-------
bool
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****************** NbExt ******************/
		/**** md5 signature: 84ada636e4651cacf916eb056265a1d9 ****/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return the nunber of found extrema.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Point ******************/
		/**** md5 signature: 6123812027804044a54749cfa19bef5e ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the nth extremum.

Parameters
----------
N: int

Returns
-------
Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point(const Standard_Integer N);

		/****************** SearchOfTolerance ******************/
		/**** md5 signature: 73a2a1f7b776ed3aaadf205798ee8767 ****/
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "Computes a tol value. if 1st derivative of curve |d1|<tol, it is considered d1=0.

Returns
-------
float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance();

		/****************** SetPoint ******************/
		/**** md5 signature: 0ad85ba084f338225cb11e827425ab5f ****/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "Sets the field p of the function.

Parameters
----------
P: gp_Pnt2d

Returns
-------
None
") SetPoint;
		void SetPoint(const gp_Pnt2d & P);

		/****************** SquareDistance ******************/
		/**** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the nth distance.

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****************** SubIntervalInitialize ******************/
		/**** md5 signature: 424565e975e565ea668d16ca9ce728b5 ****/
		%feature("compactdefaultargs") SubIntervalInitialize;
		%feature("autodoc", "Determines boundaries of subinterval for find of root.

Parameters
----------
theUfirst: float
theUlast: float

Returns
-------
None
") SubIntervalInitialize;
		void SubIntervalInitialize(const Standard_Real theUfirst, const Standard_Real theUlast);

		/****************** Value ******************/
		/**** md5 signature: e3462efa1edccfd4021bca61bc42d936 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Calculation of f(u).

Parameters
----------
U: float

Returns
-------
F: float
") Value;
		Standard_Boolean Value(const Standard_Real U, Standard_Real &OutValue);

		/****************** Values ******************/
		/**** md5 signature: a9de0e54fbbad71406954eb825560b84 ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Calculation of f(u) and f'(u).

Parameters
----------
U: float

Returns
-------
F: float
DF: float
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
		/****************** Extrema_PCFOfEPCOfExtPC ******************/
		/**** md5 signature: 0e2b6fe4341dc464005077b2eac0fbda ****/
		%feature("compactdefaultargs") Extrema_PCFOfEPCOfExtPC;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_PCFOfEPCOfExtPC;
		 Extrema_PCFOfEPCOfExtPC();

		/****************** Extrema_PCFOfEPCOfExtPC ******************/
		/**** md5 signature: 4c6b6b2bd19934a2cdb8b9ed141406a1 ****/
		%feature("compactdefaultargs") Extrema_PCFOfEPCOfExtPC;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
C: Adaptor3d_Curve

Returns
-------
None
") Extrema_PCFOfEPCOfExtPC;
		 Extrema_PCFOfEPCOfExtPC(const gp_Pnt & P, const Adaptor3d_Curve & C);

		/****************** Derivative ******************/
		/**** md5 signature: 74e45b7ef1cb50395f459121235df2cd ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Calculation of f'(u).

Parameters
----------
U: float

Returns
-------
DF: float
") Derivative;
		Standard_Boolean Derivative(const Standard_Real U, Standard_Real &OutValue);

		/****************** GetStateNumber ******************/
		/**** md5 signature: 49c44bd66dd4ec2381671c72ebd88158 ****/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Save the found extremum.

Returns
-------
int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****************** Initialize ******************/
		/**** md5 signature: 96ecca85f670f0aff9194161a9bd5dc1 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the field mycurve of the function.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & C);

		/****************** IsMin ******************/
		/**** md5 signature: d296cefb075e9db02ee60a375c81a9f6 ****/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Shows if the nth distance is a minimum.

Parameters
----------
N: int

Returns
-------
bool
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****************** NbExt ******************/
		/**** md5 signature: 84ada636e4651cacf916eb056265a1d9 ****/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return the nunber of found extrema.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Point ******************/
		/**** md5 signature: 1a3c4a6f09c4cb823314eefe5165e75c ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the nth extremum.

Parameters
----------
N: int

Returns
-------
Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point(const Standard_Integer N);

		/****************** SearchOfTolerance ******************/
		/**** md5 signature: 73a2a1f7b776ed3aaadf205798ee8767 ****/
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "Computes a tol value. if 1st derivative of curve |d1|<tol, it is considered d1=0.

Returns
-------
float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance();

		/****************** SetPoint ******************/
		/**** md5 signature: ad83fe26e12bb630222b6d2773210931 ****/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "Sets the field p of the function.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") SetPoint;
		void SetPoint(const gp_Pnt & P);

		/****************** SquareDistance ******************/
		/**** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the nth distance.

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****************** SubIntervalInitialize ******************/
		/**** md5 signature: 424565e975e565ea668d16ca9ce728b5 ****/
		%feature("compactdefaultargs") SubIntervalInitialize;
		%feature("autodoc", "Determines boundaries of subinterval for find of root.

Parameters
----------
theUfirst: float
theUlast: float

Returns
-------
None
") SubIntervalInitialize;
		void SubIntervalInitialize(const Standard_Real theUfirst, const Standard_Real theUlast);

		/****************** Value ******************/
		/**** md5 signature: e3462efa1edccfd4021bca61bc42d936 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Calculation of f(u).

Parameters
----------
U: float

Returns
-------
F: float
") Value;
		Standard_Boolean Value(const Standard_Real U, Standard_Real &OutValue);

		/****************** Values ******************/
		/**** md5 signature: a9de0e54fbbad71406954eb825560b84 ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Calculation of f(u) and f'(u).

Parameters
----------
U: float

Returns
-------
F: float
DF: float
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
		/****************** Extrema_PCFOfEPCOfExtPC2d ******************/
		/**** md5 signature: fb0bef4d3c9b63de9a04e4e3ac68ae30 ****/
		%feature("compactdefaultargs") Extrema_PCFOfEPCOfExtPC2d;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_PCFOfEPCOfExtPC2d;
		 Extrema_PCFOfEPCOfExtPC2d();

		/****************** Extrema_PCFOfEPCOfExtPC2d ******************/
		/**** md5 signature: 542b619871e1d255c35bea98edf50c0a ****/
		%feature("compactdefaultargs") Extrema_PCFOfEPCOfExtPC2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d

Returns
-------
None
") Extrema_PCFOfEPCOfExtPC2d;
		 Extrema_PCFOfEPCOfExtPC2d(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C);

		/****************** Derivative ******************/
		/**** md5 signature: 74e45b7ef1cb50395f459121235df2cd ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Calculation of f'(u).

Parameters
----------
U: float

Returns
-------
DF: float
") Derivative;
		Standard_Boolean Derivative(const Standard_Real U, Standard_Real &OutValue);

		/****************** GetStateNumber ******************/
		/**** md5 signature: 49c44bd66dd4ec2381671c72ebd88158 ****/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Save the found extremum.

Returns
-------
int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****************** Initialize ******************/
		/**** md5 signature: 295b46cc3c15eb5116b8523fecaa122c ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the field mycurve of the function.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C);

		/****************** IsMin ******************/
		/**** md5 signature: d296cefb075e9db02ee60a375c81a9f6 ****/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Shows if the nth distance is a minimum.

Parameters
----------
N: int

Returns
-------
bool
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****************** NbExt ******************/
		/**** md5 signature: 84ada636e4651cacf916eb056265a1d9 ****/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return the nunber of found extrema.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Point ******************/
		/**** md5 signature: 6123812027804044a54749cfa19bef5e ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the nth extremum.

Parameters
----------
N: int

Returns
-------
Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point(const Standard_Integer N);

		/****************** SearchOfTolerance ******************/
		/**** md5 signature: 73a2a1f7b776ed3aaadf205798ee8767 ****/
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "Computes a tol value. if 1st derivative of curve |d1|<tol, it is considered d1=0.

Returns
-------
float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance();

		/****************** SetPoint ******************/
		/**** md5 signature: 0ad85ba084f338225cb11e827425ab5f ****/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "Sets the field p of the function.

Parameters
----------
P: gp_Pnt2d

Returns
-------
None
") SetPoint;
		void SetPoint(const gp_Pnt2d & P);

		/****************** SquareDistance ******************/
		/**** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the nth distance.

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****************** SubIntervalInitialize ******************/
		/**** md5 signature: 424565e975e565ea668d16ca9ce728b5 ****/
		%feature("compactdefaultargs") SubIntervalInitialize;
		%feature("autodoc", "Determines boundaries of subinterval for find of root.

Parameters
----------
theUfirst: float
theUlast: float

Returns
-------
None
") SubIntervalInitialize;
		void SubIntervalInitialize(const Standard_Real theUfirst, const Standard_Real theUlast);

		/****************** Value ******************/
		/**** md5 signature: e3462efa1edccfd4021bca61bc42d936 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Calculation of f(u).

Parameters
----------
U: float

Returns
-------
F: float
") Value;
		Standard_Boolean Value(const Standard_Real U, Standard_Real &OutValue);

		/****************** Values ******************/
		/**** md5 signature: a9de0e54fbbad71406954eb825560b84 ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Calculation of f(u) and f'(u).

Parameters
----------
U: float

Returns
-------
F: float
DF: float
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
		/****************** Extrema_PCLocFOfLocEPCOfLocateExtPC ******************/
		/**** md5 signature: 3ad596f7d25ef981146e2321fc0b516f ****/
		%feature("compactdefaultargs") Extrema_PCLocFOfLocEPCOfLocateExtPC;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_PCLocFOfLocEPCOfLocateExtPC;
		 Extrema_PCLocFOfLocEPCOfLocateExtPC();

		/****************** Extrema_PCLocFOfLocEPCOfLocateExtPC ******************/
		/**** md5 signature: e78e54923ad931caf8e1fdd0fde5e43e ****/
		%feature("compactdefaultargs") Extrema_PCLocFOfLocEPCOfLocateExtPC;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
C: Adaptor3d_Curve

Returns
-------
None
") Extrema_PCLocFOfLocEPCOfLocateExtPC;
		 Extrema_PCLocFOfLocEPCOfLocateExtPC(const gp_Pnt & P, const Adaptor3d_Curve & C);

		/****************** Derivative ******************/
		/**** md5 signature: 74e45b7ef1cb50395f459121235df2cd ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Calculation of f'(u).

Parameters
----------
U: float

Returns
-------
DF: float
") Derivative;
		Standard_Boolean Derivative(const Standard_Real U, Standard_Real &OutValue);

		/****************** GetStateNumber ******************/
		/**** md5 signature: 49c44bd66dd4ec2381671c72ebd88158 ****/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Save the found extremum.

Returns
-------
int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****************** Initialize ******************/
		/**** md5 signature: 96ecca85f670f0aff9194161a9bd5dc1 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the field mycurve of the function.

Parameters
----------
C: Adaptor3d_Curve

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor3d_Curve & C);

		/****************** IsMin ******************/
		/**** md5 signature: d296cefb075e9db02ee60a375c81a9f6 ****/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Shows if the nth distance is a minimum.

Parameters
----------
N: int

Returns
-------
bool
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****************** NbExt ******************/
		/**** md5 signature: 84ada636e4651cacf916eb056265a1d9 ****/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return the nunber of found extrema.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Point ******************/
		/**** md5 signature: 1a3c4a6f09c4cb823314eefe5165e75c ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the nth extremum.

Parameters
----------
N: int

Returns
-------
Extrema_POnCurv
") Point;
		const Extrema_POnCurv & Point(const Standard_Integer N);

		/****************** SearchOfTolerance ******************/
		/**** md5 signature: 73a2a1f7b776ed3aaadf205798ee8767 ****/
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "Computes a tol value. if 1st derivative of curve |d1|<tol, it is considered d1=0.

Returns
-------
float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance();

		/****************** SetPoint ******************/
		/**** md5 signature: ad83fe26e12bb630222b6d2773210931 ****/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "Sets the field p of the function.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") SetPoint;
		void SetPoint(const gp_Pnt & P);

		/****************** SquareDistance ******************/
		/**** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the nth distance.

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****************** SubIntervalInitialize ******************/
		/**** md5 signature: 424565e975e565ea668d16ca9ce728b5 ****/
		%feature("compactdefaultargs") SubIntervalInitialize;
		%feature("autodoc", "Determines boundaries of subinterval for find of root.

Parameters
----------
theUfirst: float
theUlast: float

Returns
-------
None
") SubIntervalInitialize;
		void SubIntervalInitialize(const Standard_Real theUfirst, const Standard_Real theUlast);

		/****************** Value ******************/
		/**** md5 signature: e3462efa1edccfd4021bca61bc42d936 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Calculation of f(u).

Parameters
----------
U: float

Returns
-------
F: float
") Value;
		Standard_Boolean Value(const Standard_Real U, Standard_Real &OutValue);

		/****************** Values ******************/
		/**** md5 signature: a9de0e54fbbad71406954eb825560b84 ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Calculation of f(u) and f'(u).

Parameters
----------
U: float

Returns
-------
F: float
DF: float
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
		/****************** Extrema_PCLocFOfLocEPCOfLocateExtPC2d ******************/
		/**** md5 signature: d7725c8d91a5bbff28ab4a7b952bd2b4 ****/
		%feature("compactdefaultargs") Extrema_PCLocFOfLocEPCOfLocateExtPC2d;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Extrema_PCLocFOfLocEPCOfLocateExtPC2d;
		 Extrema_PCLocFOfLocEPCOfLocateExtPC2d();

		/****************** Extrema_PCLocFOfLocEPCOfLocateExtPC2d ******************/
		/**** md5 signature: 31ac1d63745ee80d599024dcffff988f ****/
		%feature("compactdefaultargs") Extrema_PCLocFOfLocEPCOfLocateExtPC2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt2d
C: Adaptor2d_Curve2d

Returns
-------
None
") Extrema_PCLocFOfLocEPCOfLocateExtPC2d;
		 Extrema_PCLocFOfLocEPCOfLocateExtPC2d(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C);

		/****************** Derivative ******************/
		/**** md5 signature: 74e45b7ef1cb50395f459121235df2cd ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Calculation of f'(u).

Parameters
----------
U: float

Returns
-------
DF: float
") Derivative;
		Standard_Boolean Derivative(const Standard_Real U, Standard_Real &OutValue);

		/****************** GetStateNumber ******************/
		/**** md5 signature: 49c44bd66dd4ec2381671c72ebd88158 ****/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Save the found extremum.

Returns
-------
int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****************** Initialize ******************/
		/**** md5 signature: 295b46cc3c15eb5116b8523fecaa122c ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the field mycurve of the function.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C);

		/****************** IsMin ******************/
		/**** md5 signature: d296cefb075e9db02ee60a375c81a9f6 ****/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Shows if the nth distance is a minimum.

Parameters
----------
N: int

Returns
-------
bool
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****************** NbExt ******************/
		/**** md5 signature: 84ada636e4651cacf916eb056265a1d9 ****/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return the nunber of found extrema.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Point ******************/
		/**** md5 signature: 6123812027804044a54749cfa19bef5e ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the nth extremum.

Parameters
----------
N: int

Returns
-------
Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point(const Standard_Integer N);

		/****************** SearchOfTolerance ******************/
		/**** md5 signature: 73a2a1f7b776ed3aaadf205798ee8767 ****/
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "Computes a tol value. if 1st derivative of curve |d1|<tol, it is considered d1=0.

Returns
-------
float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance();

		/****************** SetPoint ******************/
		/**** md5 signature: 0ad85ba084f338225cb11e827425ab5f ****/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "Sets the field p of the function.

Parameters
----------
P: gp_Pnt2d

Returns
-------
None
") SetPoint;
		void SetPoint(const gp_Pnt2d & P);

		/****************** SquareDistance ******************/
		/**** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the nth distance.

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****************** SubIntervalInitialize ******************/
		/**** md5 signature: 424565e975e565ea668d16ca9ce728b5 ****/
		%feature("compactdefaultargs") SubIntervalInitialize;
		%feature("autodoc", "Determines boundaries of subinterval for find of root.

Parameters
----------
theUfirst: float
theUlast: float

Returns
-------
None
") SubIntervalInitialize;
		void SubIntervalInitialize(const Standard_Real theUfirst, const Standard_Real theUlast);

		/****************** Value ******************/
		/**** md5 signature: e3462efa1edccfd4021bca61bc42d936 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Calculation of f(u).

Parameters
----------
U: float

Returns
-------
F: float
") Value;
		Standard_Boolean Value(const Standard_Real U, Standard_Real &OutValue);

		/****************** Values ******************/
		/**** md5 signature: a9de0e54fbbad71406954eb825560b84 ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Calculation of f(u) and f'(u).

Parameters
----------
U: float

Returns
-------
F: float
DF: float
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
		/****************** Extrema_POnCurv ******************/
		/**** md5 signature: 52dfe5963e88211ea2076f961c70509e ****/
		%feature("compactdefaultargs") Extrema_POnCurv;
		%feature("autodoc", "Creation of an indefinite point on curve.

Returns
-------
None
") Extrema_POnCurv;
		 Extrema_POnCurv();

		/****************** Extrema_POnCurv ******************/
		/**** md5 signature: 9f696a7624ca87ff2628d33075aa7788 ****/
		%feature("compactdefaultargs") Extrema_POnCurv;
		%feature("autodoc", "Creation of a point on curve with a parameter value on the curve and a pnt from gp.

Parameters
----------
U: float
P: gp_Pnt

Returns
-------
None
") Extrema_POnCurv;
		 Extrema_POnCurv(const Standard_Real U, const gp_Pnt & P);

		/****************** Parameter ******************/
		/**** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns the parameter on the curve.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** SetValues ******************/
		/**** md5 signature: aa1d99b2f7a5b5f72a235b82b7085127 ****/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "Sets the point and parameter values.

Parameters
----------
U: float
P: gp_Pnt

Returns
-------
None
") SetValues;
		void SetValues(const Standard_Real U, const gp_Pnt & P);

		/****************** Value ******************/
		/**** md5 signature: eddd2908948849b73f6d8aacab318652 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the point.

Returns
-------
gp_Pnt
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
		/****************** Extrema_POnCurv2d ******************/
		/**** md5 signature: a63d3ab900ee7945dc1885e5318b0b84 ****/
		%feature("compactdefaultargs") Extrema_POnCurv2d;
		%feature("autodoc", "Creation of an indefinite point on curve.

Returns
-------
None
") Extrema_POnCurv2d;
		 Extrema_POnCurv2d();

		/****************** Extrema_POnCurv2d ******************/
		/**** md5 signature: 847a375a1f0352b5a22d642679cccea7 ****/
		%feature("compactdefaultargs") Extrema_POnCurv2d;
		%feature("autodoc", "Creation of a point on curve with a parameter value on the curve and a pnt from gp.

Parameters
----------
U: float
P: gp_Pnt2d

Returns
-------
None
") Extrema_POnCurv2d;
		 Extrema_POnCurv2d(const Standard_Real U, const gp_Pnt2d & P);

		/****************** Parameter ******************/
		/**** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns the parameter on the curve.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** SetValues ******************/
		/**** md5 signature: 73e81399e0b63647cfa08274d87156c6 ****/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "Sets the point and parameter values.

Parameters
----------
U: float
P: gp_Pnt2d

Returns
-------
None
") SetValues;
		void SetValues(const Standard_Real U, const gp_Pnt2d & P);

		/****************** Value ******************/
		/**** md5 signature: 01b97600ad700e4edb97bc6008ad0c9b ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the point.

Returns
-------
gp_Pnt2d
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
		/****************** Extrema_POnSurf ******************/
		/**** md5 signature: 7a7f9a147e1d8046e0b166e28cee5944 ****/
		%feature("compactdefaultargs") Extrema_POnSurf;
		%feature("autodoc", "Creation of an indefinite point on surface.

Returns
-------
None
") Extrema_POnSurf;
		 Extrema_POnSurf();

		/****************** Extrema_POnSurf ******************/
		/**** md5 signature: 488489f3913a70f368881e2df8c7e89d ****/
		%feature("compactdefaultargs") Extrema_POnSurf;
		%feature("autodoc", "Creation of a point on surface with parameter values on the surface and a pnt from gp.

Parameters
----------
U: float
V: float
P: gp_Pnt

Returns
-------
None
") Extrema_POnSurf;
		 Extrema_POnSurf(const Standard_Real U, const Standard_Real V, const gp_Pnt & P);

		/****************** Parameter ******************/
		/**** md5 signature: fcb6dca6c2af6b1cc54badf10520865d ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns the parameter values on the surface.

Parameters
----------

Returns
-------
U: float
V: float
") Parameter;
		void Parameter(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** SetParameters ******************/
		/**** md5 signature: 4c240a23953c1ca8e8b266568bf3fefa ****/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "Sets the params of current ponsurf instance. (e.g. to the point to be projected).

Parameters
----------
theU: float
theV: float
thePnt: gp_Pnt

Returns
-------
None
") SetParameters;
		void SetParameters(const Standard_Real theU, const Standard_Real theV, const gp_Pnt & thePnt);

		/****************** Value ******************/
		/**** md5 signature: eddd2908948849b73f6d8aacab318652 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the 3d point.

Returns
-------
gp_Pnt
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
		/****************** Extrema_POnSurfParams ******************/
		/**** md5 signature: 7ca8b3e55bb725a3ccd8bae5c2b7e034 ****/
		%feature("compactdefaultargs") Extrema_POnSurfParams;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Extrema_POnSurfParams;
		 Extrema_POnSurfParams();

		/****************** Extrema_POnSurfParams ******************/
		/**** md5 signature: 7d6692954a90691fa2bfca78f894059c ****/
		%feature("compactdefaultargs") Extrema_POnSurfParams;
		%feature("autodoc", "Creation of a point on surface with parameter values on the surface and a pnt from gp.

Parameters
----------
theU: float
theV: float
thePnt: gp_Pnt

Returns
-------
None
") Extrema_POnSurfParams;
		 Extrema_POnSurfParams(const Standard_Real theU, const Standard_Real theV, const gp_Pnt & thePnt);

		/****************** GetElementType ******************/
		/**** md5 signature: 190b208e8025f3833e36ff48d47966dd ****/
		%feature("compactdefaultargs") GetElementType;
		%feature("autodoc", "Query the element type on which this point is situated.

Returns
-------
Extrema_ElementType
") GetElementType;
		Extrema_ElementType GetElementType();

		/****************** GetIndices ******************/
		/**** md5 signature: 02a37724aecaea94d73cc242dd683854 ****/
		%feature("compactdefaultargs") GetIndices;
		%feature("autodoc", "Query the u and v indices of an element that contains this point.

Parameters
----------

Returns
-------
theIndexU: int
theIndexV: int
") GetIndices;
		void GetIndices(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** GetSqrDistance ******************/
		/**** md5 signature: 5f9e48f078be4fe223ad9e4b4bb6c03f ****/
		%feature("compactdefaultargs") GetSqrDistance;
		%feature("autodoc", "Query the square distance from this point to another one.

Returns
-------
float
") GetSqrDistance;
		Standard_Real GetSqrDistance();

		/****************** SetElementType ******************/
		/**** md5 signature: 4318662b8606c94578706f86f16f78de ****/
		%feature("compactdefaultargs") SetElementType;
		%feature("autodoc", "Sets the element type on which this point is situated.

Parameters
----------
theElementType: Extrema_ElementType

Returns
-------
None
") SetElementType;
		void SetElementType(const Extrema_ElementType theElementType);

		/****************** SetIndices ******************/
		/**** md5 signature: d6f7eb3492fda15b2bdfa3e6194846e6 ****/
		%feature("compactdefaultargs") SetIndices;
		%feature("autodoc", "Sets the u and v indices of an element that contains this point.

Parameters
----------
theIndexU: int
theIndexV: int

Returns
-------
None
") SetIndices;
		void SetIndices(const Standard_Integer theIndexU, const Standard_Integer theIndexV);

		/****************** SetSqrDistance ******************/
		/**** md5 signature: f5a2aae4a6b8e482a18305426185cc47 ****/
		%feature("compactdefaultargs") SetSqrDistance;
		%feature("autodoc", "Sets the square distance from this point to another one (e.g. to the point to be projected).

Parameters
----------
theSqrDistance: float

Returns
-------
None
") SetSqrDistance;
		void SetSqrDistance(const Standard_Real theSqrDistance);

};


%extend Extrema_POnSurfParams {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */

class Extrema_HArray1OfPOnSurf : public Extrema_Array1OfPOnSurf, public Standard_Transient {
  public:
    Extrema_HArray1OfPOnSurf(const Standard_Integer theLower, const Standard_Integer theUpper);
    Extrema_HArray1OfPOnSurf(const Standard_Integer theLower, const Standard_Integer theUpper, const Extrema_Array1OfPOnSurf::value_type& theValue);
    Extrema_HArray1OfPOnSurf(const Extrema_Array1OfPOnSurf& theOther);
    const Extrema_Array1OfPOnSurf& Array1();
    Extrema_Array1OfPOnSurf& ChangeArray1();
};
%make_alias(Extrema_HArray1OfPOnSurf)


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

/* harray2 classes */
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


class Extrema_HArray2OfPOnSurfParams : public Extrema_Array2OfPOnSurfParams, public Standard_Transient {
  public:
    Extrema_HArray2OfPOnSurfParams(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    Extrema_HArray2OfPOnSurfParams(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const Extrema_Array2OfPOnSurfParams::value_type& theValue);
    Extrema_HArray2OfPOnSurfParams(const Extrema_Array2OfPOnSurfParams& theOther);
    const Extrema_Array2OfPOnSurfParams& Array2 ();
    Extrema_Array2OfPOnSurfParams& ChangeArray2 (); 
};
%make_alias(Extrema_HArray2OfPOnSurfParams)


/* hsequence classes */
