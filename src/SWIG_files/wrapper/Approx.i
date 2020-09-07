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
%define APPROXDOCSTRING
"Approx module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_approx.html"
%enddef
%module (package="OCC.Core", docstring=APPROXDOCSTRING) Approx


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
#include<Approx_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColStd_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Adaptor2d_module.hxx>
#include<GeomAbs_module.hxx>
#include<Geom2d_module.hxx>
#include<Geom_module.hxx>
#include<AppCont_module.hxx>
#include<AppParCurves_module.hxx>
#include<TColgp_module.hxx>
#include<gp_module.hxx>
#include<FEmTool_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TColStd.i
%import Adaptor3d.i
%import Adaptor2d.i
%import GeomAbs.i
%import Geom2d.i
%import Geom.i
%import AppCont.i
%import AppParCurves.i
%import TColgp.i
%import gp.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum Approx_Status {
	Approx_PointsAdded = 0,
	Approx_NoPointsAdded = 1,
	Approx_NoApproximation = 2,
};

enum Approx_ParametrizationType {
	Approx_ChordLength = 0,
	Approx_Centripetal = 1,
	Approx_IsoParametric = 2,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class Approx_Status(IntEnum):
	Approx_PointsAdded = 0
	Approx_NoPointsAdded = 1
	Approx_NoApproximation = 2
Approx_PointsAdded = Approx_Status.Approx_PointsAdded
Approx_NoPointsAdded = Approx_Status.Approx_NoPointsAdded
Approx_NoApproximation = Approx_Status.Approx_NoApproximation

class Approx_ParametrizationType(IntEnum):
	Approx_ChordLength = 0
	Approx_Centripetal = 1
	Approx_IsoParametric = 2
Approx_ChordLength = Approx_ParametrizationType.Approx_ChordLength
Approx_Centripetal = Approx_ParametrizationType.Approx_Centripetal
Approx_IsoParametric = Approx_ParametrizationType.Approx_IsoParametric
};
/* end python proxy for enums */

/* handles */
%wrap_handle(Approx_CurvlinFunc)
%wrap_handle(Approx_SweepFunction)
%wrap_handle(Approx_HArray1OfGTrsf2d)
%wrap_handle(Approx_HArray1OfAdHSurface)
/* end handles declaration */

/* templates */
%template(Approx_Array1OfAdHSurface) NCollection_Array1<opencascade::handle<Adaptor3d_HSurface>>;

%extend NCollection_Array1<opencascade::handle<Adaptor3d_HSurface>> {
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
%template(Approx_Array1OfGTrsf2d) NCollection_Array1<gp_GTrsf2d>;

%extend NCollection_Array1<gp_GTrsf2d> {
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
%template(Approx_SequenceOfHArray1OfReal) NCollection_Sequence<opencascade::handle<TColStd_HArray1OfReal>>;

%extend NCollection_Sequence<opencascade::handle<TColStd_HArray1OfReal>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<opencascade::handle<Adaptor3d_HSurface>> Approx_Array1OfAdHSurface;
typedef NCollection_Array1<gp_GTrsf2d> Approx_Array1OfGTrsf2d;
typedef NCollection_Sequence<opencascade::handle<TColStd_HArray1OfReal>> Approx_SequenceOfHArray1OfReal;
/* end typedefs declaration */

/***********************
* class Approx_Curve2d *
***********************/
class Approx_Curve2d {
	public:
		/****************** Approx_Curve2d ******************/
		/**** md5 signature: 3808819d209e1def3c108ec4c293e785 ****/
		%feature("compactdefaultargs") Approx_Curve2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
C2D: Adaptor2d_HCurve2d
First: float
Last: float
TolU: float
TolV: float
Continuity: GeomAbs_Shape
MaxDegree: int
MaxSegments: int

Returns
-------
None
") Approx_Curve2d;
		 Approx_Curve2d(const opencascade::handle<Adaptor2d_HCurve2d> & C2D, const Standard_Real First, const Standard_Real Last, const Standard_Real TolU, const Standard_Real TolV, const GeomAbs_Shape Continuity, const Standard_Integer MaxDegree, const Standard_Integer MaxSegments);

		/****************** Curve ******************/
		/**** md5 signature: 1960069de54819d72fccc75ab85806ec ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") Curve;
		opencascade::handle<Geom2d_BSplineCurve> Curve();

		/****************** HasResult ******************/
		/**** md5 signature: 345d4b0f7e88f528928167976d8256d5 ****/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasResult;
		Standard_Boolean HasResult();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** MaxError2dU ******************/
		/**** md5 signature: 847075004569102dbcc931f742530c0e ****/
		%feature("compactdefaultargs") MaxError2dU;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") MaxError2dU;
		Standard_Real MaxError2dU();

		/****************** MaxError2dV ******************/
		/**** md5 signature: 641a3fe3b7d3b163d6a32b23f94b6eec ****/
		%feature("compactdefaultargs") MaxError2dV;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") MaxError2dV;
		Standard_Real MaxError2dV();

};


%extend Approx_Curve2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Approx_Curve3d *
***********************/
class Approx_Curve3d {
	public:
		/****************** Approx_Curve3d ******************/
		/**** md5 signature: 65c8fcb0b3c6c7d1df42f0bb0ba09688 ****/
		%feature("compactdefaultargs") Approx_Curve3d;
		%feature("autodoc", "Approximation of a curve with respect of the requiered tolerance tol3d.

Parameters
----------
Curve: Adaptor3d_HCurve
Tol3d: float
Order: GeomAbs_Shape
MaxSegments: int
MaxDegree: int

Returns
-------
None
") Approx_Curve3d;
		 Approx_Curve3d(const opencascade::handle<Adaptor3d_HCurve> & Curve, const Standard_Real Tol3d, const GeomAbs_Shape Order, const Standard_Integer MaxSegments, const Standard_Integer MaxDegree);

		/****************** Curve ******************/
		/**** md5 signature: 8f61eb8bebb31bbd1fd75a7da450accd ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_BSplineCurve>
") Curve;
		opencascade::handle<Geom_BSplineCurve> Curve();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** HasResult ******************/
		/**** md5 signature: 345d4b0f7e88f528928167976d8256d5 ****/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "Returns standard_true if the approximation did come out with a result that is not necessarely within the required tolerance.

Returns
-------
bool
") HasResult;
		Standard_Boolean HasResult();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns standard_true if the approximation has been done within requiered tolerance.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** MaxError ******************/
		/**** md5 signature: 90f2419f0b1537a77da84305579339a2 ****/
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "Returns the maximum error (>0 when an approximation has been done, 0 if no approximation).

Returns
-------
float
") MaxError;
		Standard_Real MaxError();

};


%extend Approx_Curve3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Approx_CurveOnSurface *
******************************/
class Approx_CurveOnSurface {
	public:
		/****************** Approx_CurveOnSurface ******************/
		/**** md5 signature: 44953400bcecd6141157e0f3eb58084e ****/
		%feature("compactdefaultargs") Approx_CurveOnSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
C2D: Adaptor2d_HCurve2d
Surf: Adaptor3d_HSurface
First: float
Last: float
Tol: float
Continuity: GeomAbs_Shape
MaxDegree: int
MaxSegments: int
Only3d: bool,optional
	default value is Standard_False
Only2d: bool,optional
	default value is Standard_False

Returns
-------
None
") Approx_CurveOnSurface;
		 Approx_CurveOnSurface(const opencascade::handle<Adaptor2d_HCurve2d> & C2D, const opencascade::handle<Adaptor3d_HSurface> & Surf, const Standard_Real First, const Standard_Real Last, const Standard_Real Tol, const GeomAbs_Shape Continuity, const Standard_Integer MaxDegree, const Standard_Integer MaxSegments, const Standard_Boolean Only3d = Standard_False, const Standard_Boolean Only2d = Standard_False);

		/****************** Curve2d ******************/
		/**** md5 signature: a68a2dac2ad11e4da3864dc2433ead7f ****/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") Curve2d;
		opencascade::handle<Geom2d_BSplineCurve> Curve2d();

		/****************** Curve3d ******************/
		/**** md5 signature: 40af7069a21d4ba6c9b73d59c7d6dc50 ****/
		%feature("compactdefaultargs") Curve3d;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_BSplineCurve>
") Curve3d;
		opencascade::handle<Geom_BSplineCurve> Curve3d();

		/****************** HasResult ******************/
		/**** md5 signature: 345d4b0f7e88f528928167976d8256d5 ****/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasResult;
		Standard_Boolean HasResult();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** MaxError2dU ******************/
		/**** md5 signature: 847075004569102dbcc931f742530c0e ****/
		%feature("compactdefaultargs") MaxError2dU;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") MaxError2dU;
		Standard_Real MaxError2dU();

		/****************** MaxError2dV ******************/
		/**** md5 signature: 641a3fe3b7d3b163d6a32b23f94b6eec ****/
		%feature("compactdefaultargs") MaxError2dV;
		%feature("autodoc", "Returns the maximum errors relativly to the u component or the v component of the 2d curve.

Returns
-------
float
") MaxError2dV;
		Standard_Real MaxError2dV();

		/****************** MaxError3d ******************/
		/**** md5 signature: c6ba463cdf4a0e426329b589363186b7 ****/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") MaxError3d;
		Standard_Real MaxError3d();

};


%extend Approx_CurveOnSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class Approx_CurvilinearParameter *
************************************/
class Approx_CurvilinearParameter {
	public:
		/****************** Approx_CurvilinearParameter ******************/
		/**** md5 signature: 87a8d57e93c58fe13b36b4f14487e297 ****/
		%feature("compactdefaultargs") Approx_CurvilinearParameter;
		%feature("autodoc", "Case of a free 3d curve.

Parameters
----------
C3D: Adaptor3d_HCurve
Tol: float
Order: GeomAbs_Shape
MaxDegree: int
MaxSegments: int

Returns
-------
None
") Approx_CurvilinearParameter;
		 Approx_CurvilinearParameter(const opencascade::handle<Adaptor3d_HCurve> & C3D, const Standard_Real Tol, const GeomAbs_Shape Order, const Standard_Integer MaxDegree, const Standard_Integer MaxSegments);

		/****************** Approx_CurvilinearParameter ******************/
		/**** md5 signature: 5e6af048127e41f0e55fb4904bc8c476 ****/
		%feature("compactdefaultargs") Approx_CurvilinearParameter;
		%feature("autodoc", "Case of a curve on one surface.

Parameters
----------
C2D: Adaptor2d_HCurve2d
Surf: Adaptor3d_HSurface
Tol: float
Order: GeomAbs_Shape
MaxDegree: int
MaxSegments: int

Returns
-------
None
") Approx_CurvilinearParameter;
		 Approx_CurvilinearParameter(const opencascade::handle<Adaptor2d_HCurve2d> & C2D, const opencascade::handle<Adaptor3d_HSurface> & Surf, const Standard_Real Tol, const GeomAbs_Shape Order, const Standard_Integer MaxDegree, const Standard_Integer MaxSegments);

		/****************** Approx_CurvilinearParameter ******************/
		/**** md5 signature: c20ec6318bb423836fdfcdd350ec13c6 ****/
		%feature("compactdefaultargs") Approx_CurvilinearParameter;
		%feature("autodoc", "Case of a curve on two surfaces.

Parameters
----------
C2D1: Adaptor2d_HCurve2d
Surf1: Adaptor3d_HSurface
C2D2: Adaptor2d_HCurve2d
Surf2: Adaptor3d_HSurface
Tol: float
Order: GeomAbs_Shape
MaxDegree: int
MaxSegments: int

Returns
-------
None
") Approx_CurvilinearParameter;
		 Approx_CurvilinearParameter(const opencascade::handle<Adaptor2d_HCurve2d> & C2D1, const opencascade::handle<Adaptor3d_HSurface> & Surf1, const opencascade::handle<Adaptor2d_HCurve2d> & C2D2, const opencascade::handle<Adaptor3d_HSurface> & Surf2, const Standard_Real Tol, const GeomAbs_Shape Order, const Standard_Integer MaxDegree, const Standard_Integer MaxSegments);

		/****************** Curve2d1 ******************/
		/**** md5 signature: 320386716849305473262b1fbe175d01 ****/
		%feature("compactdefaultargs") Curve2d1;
		%feature("autodoc", "Returns the bsplinecurve representing the reparametrized 2d curve on the first surface (case of a curve on one or two surfaces).

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") Curve2d1;
		opencascade::handle<Geom2d_BSplineCurve> Curve2d1();

		/****************** Curve2d2 ******************/
		/**** md5 signature: c454b48582ae4e125bffbd0a7c1ecb65 ****/
		%feature("compactdefaultargs") Curve2d2;
		%feature("autodoc", "Returns the bsplinecurve representing the reparametrized 2d curve on the second surface (case of a curve on two surfaces).

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") Curve2d2;
		opencascade::handle<Geom2d_BSplineCurve> Curve2d2();

		/****************** Curve3d ******************/
		/**** md5 signature: 40af7069a21d4ba6c9b73d59c7d6dc50 ****/
		%feature("compactdefaultargs") Curve3d;
		%feature("autodoc", "Returns the bspline curve corresponding to the reparametrized 3d curve.

Returns
-------
opencascade::handle<Geom_BSplineCurve>
") Curve3d;
		opencascade::handle<Geom_BSplineCurve> Curve3d();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** HasResult ******************/
		/**** md5 signature: 345d4b0f7e88f528928167976d8256d5 ****/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasResult;
		Standard_Boolean HasResult();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** MaxError2d1 ******************/
		/**** md5 signature: 455a6dc1101b77daa7669b3852e634a6 ****/
		%feature("compactdefaultargs") MaxError2d1;
		%feature("autodoc", "Returns the maximum error on the first reparametrized 2d curve.

Returns
-------
float
") MaxError2d1;
		Standard_Real MaxError2d1();

		/****************** MaxError2d2 ******************/
		/**** md5 signature: 415b1db6afd0a77c250335998bc39142 ****/
		%feature("compactdefaultargs") MaxError2d2;
		%feature("autodoc", "Returns the maximum error on the second reparametrized 2d curve.

Returns
-------
float
") MaxError2d2;
		Standard_Real MaxError2d2();

		/****************** MaxError3d ******************/
		/**** md5 signature: c6ba463cdf4a0e426329b589363186b7 ****/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "Returns the maximum error on the reparametrized 3d curve.

Returns
-------
float
") MaxError3d;
		Standard_Real MaxError3d();

};


%extend Approx_CurvilinearParameter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Approx_CurvlinFunc *
***************************/
class Approx_CurvlinFunc : public Standard_Transient {
	public:
		/****************** Approx_CurvlinFunc ******************/
		/**** md5 signature: 13612be4e5b55611b7eb0ad987bab15a ****/
		%feature("compactdefaultargs") Approx_CurvlinFunc;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_HCurve
Tol: float

Returns
-------
None
") Approx_CurvlinFunc;
		 Approx_CurvlinFunc(const opencascade::handle<Adaptor3d_HCurve> & C, const Standard_Real Tol);

		/****************** Approx_CurvlinFunc ******************/
		/**** md5 signature: 07e78bf99be942395ed9cc13ea9bc1cf ****/
		%feature("compactdefaultargs") Approx_CurvlinFunc;
		%feature("autodoc", "No available documentation.

Parameters
----------
C2D: Adaptor2d_HCurve2d
S: Adaptor3d_HSurface
Tol: float

Returns
-------
None
") Approx_CurvlinFunc;
		 Approx_CurvlinFunc(const opencascade::handle<Adaptor2d_HCurve2d> & C2D, const opencascade::handle<Adaptor3d_HSurface> & S, const Standard_Real Tol);

		/****************** Approx_CurvlinFunc ******************/
		/**** md5 signature: e575afd63226bf2aaec13682942a488d ****/
		%feature("compactdefaultargs") Approx_CurvlinFunc;
		%feature("autodoc", "No available documentation.

Parameters
----------
C2D1: Adaptor2d_HCurve2d
C2D2: Adaptor2d_HCurve2d
S1: Adaptor3d_HSurface
S2: Adaptor3d_HSurface
Tol: float

Returns
-------
None
") Approx_CurvlinFunc;
		 Approx_CurvlinFunc(const opencascade::handle<Adaptor2d_HCurve2d> & C2D1, const opencascade::handle<Adaptor2d_HCurve2d> & C2D2, const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor3d_HSurface> & S2, const Standard_Real Tol);

		/****************** EvalCase1 ******************/
		/**** md5 signature: d6f977aec2ba6ef7261ad448995f2a1d ****/
		%feature("compactdefaultargs") EvalCase1;
		%feature("autodoc", "If mycase != 1.

Parameters
----------
S: float
Order: int
Result: TColStd_Array1OfReal

Returns
-------
bool
") EvalCase1;
		Standard_Boolean EvalCase1(const Standard_Real S, const Standard_Integer Order, TColStd_Array1OfReal & Result);

		/****************** EvalCase2 ******************/
		/**** md5 signature: af7190c5733447d4dcb3107db703f25d ****/
		%feature("compactdefaultargs") EvalCase2;
		%feature("autodoc", "If mycase != 2.

Parameters
----------
S: float
Order: int
Result: TColStd_Array1OfReal

Returns
-------
bool
") EvalCase2;
		Standard_Boolean EvalCase2(const Standard_Real S, const Standard_Integer Order, TColStd_Array1OfReal & Result);

		/****************** EvalCase3 ******************/
		/**** md5 signature: 6ecbd89f3323d6c9fcd40c282e079d3c ****/
		%feature("compactdefaultargs") EvalCase3;
		%feature("autodoc", "If mycase != 3.

Parameters
----------
S: float
Order: int
Result: TColStd_Array1OfReal

Returns
-------
bool
") EvalCase3;
		Standard_Boolean EvalCase3(const Standard_Real S, const Standard_Integer Order, TColStd_Array1OfReal & Result);

		/****************** FirstParameter ******************/
		/**** md5 signature: 4ccedbaad83be904f510b4760c75f69c ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** GetLength ******************/
		/**** md5 signature: 9390a920d888683f8b474026b2d95a49 ****/
		%feature("compactdefaultargs") GetLength;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") GetLength;
		Standard_Real GetLength();

		/****************** GetSParameter ******************/
		/**** md5 signature: de8883031fb26c06bc41920f0af259b5 ****/
		%feature("compactdefaultargs") GetSParameter;
		%feature("autodoc", "Returns original parameter correponding s.

Parameters
----------
U: float

Returns
-------
float
") GetSParameter;
		Standard_Real GetSParameter(const Standard_Real U);

		/****************** GetUParameter ******************/
		/**** md5 signature: a288323291b5a7c86e97e5e379347550 ****/
		%feature("compactdefaultargs") GetUParameter;
		%feature("autodoc", "Returns original parameter correponding s. if case == 1 computation is performed on myc2d1 and mysurf1, otherwise it is done on myc2d2 and mysurf2.

Parameters
----------
C: Adaptor3d_Curve
S: float
NumberOfCurve: int

Returns
-------
float
") GetUParameter;
		Standard_Real GetUParameter(Adaptor3d_Curve & C, const Standard_Real S, const Standard_Integer NumberOfCurve);

		/****************** Intervals ******************/
		/**** md5 signature: c7a2f17df7514293a67a56baae0afb68 ****/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** LastParameter ******************/
		/**** md5 signature: 7cdf630921ee47ad365a5a6bafd4b46e ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** Length ******************/
		/**** md5 signature: 389864b782ecf5fea5b568ea6b4ee166 ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Computes length of the curve.

Returns
-------
None
") Length;
		void Length();

		/****************** Length ******************/
		/**** md5 signature: a36b32537f2aaeb51d308d784a8bcd1e ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Computes length of the curve segment.

Parameters
----------
C: Adaptor3d_Curve
FirstU: float
LasrU: float

Returns
-------
float
") Length;
		Standard_Real Length(Adaptor3d_Curve & C, const Standard_Real FirstU, const Standard_Real LasrU);

		/****************** NbIntervals ******************/
		/**** md5 signature: a9cec7e4e6cb5b355a27e6de1f3fc9d9 ****/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** SetTol ******************/
		/**** md5 signature: 807eaaa5cf0c0afd4dc54d9743374704 ****/
		%feature("compactdefaultargs") SetTol;
		%feature("autodoc", "---purpose update the tolerance to used.

Parameters
----------
Tol: float

Returns
-------
None
") SetTol;
		void SetTol(const Standard_Real Tol);

		/****************** Trim ******************/
		/**** md5 signature: e4c090d64e46a6e2ad68afd1ac49d0f1 ****/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "If first < 0 or last > 1.

Parameters
----------
First: float
Last: float
Tol: float

Returns
-------
None
") Trim;
		void Trim(const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

};


%make_alias(Approx_CurvlinFunc)

%extend Approx_CurvlinFunc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Approx_FitAndDivide *
****************************/
class Approx_FitAndDivide {
	public:
		/****************** Approx_FitAndDivide ******************/
		/**** md5 signature: ea3ebc13b87efed4a03fe4693299cd01 ****/
		%feature("compactdefaultargs") Approx_FitAndDivide;
		%feature("autodoc", "The multiline <line> will be approximated until tolerances will be reached. the approximation will be done from degreemin to degreemax with a cutting if the corresponding boolean is true.

Parameters
----------
Line: AppCont_Function
degreemin: int,optional
	default value is 3
degreemax: int,optional
	default value is 8
Tolerance3d: float,optional
	default value is 1.0e-5
Tolerance2d: float,optional
	default value is 1.0e-5
cutting: bool,optional
	default value is Standard_False
FirstC: AppParCurves_Constraint,optional
	default value is AppParCurves_TangencyPoint
LastC: AppParCurves_Constraint,optional
	default value is AppParCurves_TangencyPoint

Returns
-------
None
") Approx_FitAndDivide;
		 Approx_FitAndDivide(const AppCont_Function & Line, const Standard_Integer degreemin = 3, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-5, const Standard_Real Tolerance2d = 1.0e-5, const Standard_Boolean cutting = Standard_False, const AppParCurves_Constraint FirstC = AppParCurves_TangencyPoint, const AppParCurves_Constraint LastC = AppParCurves_TangencyPoint);

		/****************** Approx_FitAndDivide ******************/
		/**** md5 signature: c98a0117adc1bef392f7f6b0763498fd ****/
		%feature("compactdefaultargs") Approx_FitAndDivide;
		%feature("autodoc", "Initializes the fields of the algorithm.

Parameters
----------
degreemin: int,optional
	default value is 3
degreemax: int,optional
	default value is 8
Tolerance3d: float,optional
	default value is 1.0e-05
Tolerance2d: float,optional
	default value is 1.0e-05
cutting: bool,optional
	default value is Standard_False
FirstC: AppParCurves_Constraint,optional
	default value is AppParCurves_TangencyPoint
LastC: AppParCurves_Constraint,optional
	default value is AppParCurves_TangencyPoint

Returns
-------
None
") Approx_FitAndDivide;
		 Approx_FitAndDivide(const Standard_Integer degreemin = 3, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-05, const Standard_Real Tolerance2d = 1.0e-05, const Standard_Boolean cutting = Standard_False, const AppParCurves_Constraint FirstC = AppParCurves_TangencyPoint, const AppParCurves_Constraint LastC = AppParCurves_TangencyPoint);

		/****************** Error ******************/
		/**** md5 signature: 6a8061230005ba951097d8b73e7dbec6 ****/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Returns the tolerances 2d and 3d of the <index> multicurve.

Parameters
----------
Index: int

Returns
-------
tol3d: float
tol2d: float
") Error;
		void Error(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** IsAllApproximated ******************/
		/**** md5 signature: bf42a9f9ee3a867655d96a0c1fdcd853 ****/
		%feature("compactdefaultargs") IsAllApproximated;
		%feature("autodoc", "Returns false if at a moment of the approximation, the status noapproximation has been sent by the user when more points were needed.

Returns
-------
bool
") IsAllApproximated;
		Standard_Boolean IsAllApproximated();

		/****************** IsToleranceReached ******************/
		/**** md5 signature: cbd7380250e74c96655b10c8025eb873 ****/
		%feature("compactdefaultargs") IsToleranceReached;
		%feature("autodoc", "Returns false if the status nopointsadded has been sent.

Returns
-------
bool
") IsToleranceReached;
		Standard_Boolean IsToleranceReached();

		/****************** NbMultiCurves ******************/
		/**** md5 signature: 944d4af40d93d46a8a3a888df2d8b388 ****/
		%feature("compactdefaultargs") NbMultiCurves;
		%feature("autodoc", "Returns the number of multicurve doing the approximation of the multiline.

Returns
-------
int
") NbMultiCurves;
		Standard_Integer NbMultiCurves();

		/****************** Parameters ******************/
		/**** md5 signature: da3dbf6a597566992bf85427f2de867b ****/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
firstp: float
lastp: float
") Parameters;
		void Parameters(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Perform ******************/
		/**** md5 signature: caf6a1aea817b16df8ee08ce9b993f4f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Runs the algorithm after having initialized the fields.

Parameters
----------
Line: AppCont_Function

Returns
-------
None
") Perform;
		void Perform(const AppCont_Function & Line);

		/****************** SetConstraints ******************/
		/**** md5 signature: 99b92dc193142adf44568f800cd394dc ****/
		%feature("compactdefaultargs") SetConstraints;
		%feature("autodoc", "Changes the constraints of the approximation.

Parameters
----------
FirstC: AppParCurves_Constraint
LastC: AppParCurves_Constraint

Returns
-------
None
") SetConstraints;
		void SetConstraints(const AppParCurves_Constraint FirstC, const AppParCurves_Constraint LastC);

		/****************** SetDegrees ******************/
		/**** md5 signature: 545fdd7d739fa58cc970e73d0413f8ef ****/
		%feature("compactdefaultargs") SetDegrees;
		%feature("autodoc", "Changes the degrees of the approximation.

Parameters
----------
degreemin: int
degreemax: int

Returns
-------
None
") SetDegrees;
		void SetDegrees(const Standard_Integer degreemin, const Standard_Integer degreemax);

		/****************** SetInvOrder ******************/
		/**** md5 signature: 50bac5968816111fd573c6f1be407215 ****/
		%feature("compactdefaultargs") SetInvOrder;
		%feature("autodoc", "Set inverse order of degree selection: if theinvordr = true, current degree is chosen by inverse order - from maxdegree to mindegree. by default inverse order is used.

Parameters
----------
theInvOrder: bool

Returns
-------
None
") SetInvOrder;
		void SetInvOrder(const Standard_Boolean theInvOrder);

		/****************** SetMaxSegments ******************/
		/**** md5 signature: 649dded305ab339e1c7f2a819b32eedd ****/
		%feature("compactdefaultargs") SetMaxSegments;
		%feature("autodoc", "Changes the max number of segments, which is allowed for cutting.

Parameters
----------
theMaxSegments: int

Returns
-------
None
") SetMaxSegments;
		void SetMaxSegments(const Standard_Integer theMaxSegments);

		/****************** SetTolerances ******************/
		/**** md5 signature: ce7879738ace848f7a3a27c56467be10 ****/
		%feature("compactdefaultargs") SetTolerances;
		%feature("autodoc", "Changes the tolerances of the approximation.

Parameters
----------
Tolerance3d: float
Tolerance2d: float

Returns
-------
None
") SetTolerances;
		void SetTolerances(const Standard_Real Tolerance3d, const Standard_Real Tolerance2d);

		/****************** Value ******************/
		/**** md5 signature: 89790f3ff3d6d18a45f409a34e79bd67 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the approximation multicurve of range <index>.

Parameters
----------
Index: int,optional
	default value is 1

Returns
-------
AppParCurves_MultiCurve
") Value;
		AppParCurves_MultiCurve Value(const Standard_Integer Index = 1);

};


%extend Approx_FitAndDivide {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Approx_FitAndDivide2d *
******************************/
class Approx_FitAndDivide2d {
	public:
		/****************** Approx_FitAndDivide2d ******************/
		/**** md5 signature: 661477a957a15a70835b41b5c2bb9698 ****/
		%feature("compactdefaultargs") Approx_FitAndDivide2d;
		%feature("autodoc", "The multiline <line> will be approximated until tolerances will be reached. the approximation will be done from degreemin to degreemax with a cutting if the corresponding boolean is true.

Parameters
----------
Line: AppCont_Function
degreemin: int,optional
	default value is 3
degreemax: int,optional
	default value is 8
Tolerance3d: float,optional
	default value is 1.0e-5
Tolerance2d: float,optional
	default value is 1.0e-5
cutting: bool,optional
	default value is Standard_False
FirstC: AppParCurves_Constraint,optional
	default value is AppParCurves_TangencyPoint
LastC: AppParCurves_Constraint,optional
	default value is AppParCurves_TangencyPoint

Returns
-------
None
") Approx_FitAndDivide2d;
		 Approx_FitAndDivide2d(const AppCont_Function & Line, const Standard_Integer degreemin = 3, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-5, const Standard_Real Tolerance2d = 1.0e-5, const Standard_Boolean cutting = Standard_False, const AppParCurves_Constraint FirstC = AppParCurves_TangencyPoint, const AppParCurves_Constraint LastC = AppParCurves_TangencyPoint);

		/****************** Approx_FitAndDivide2d ******************/
		/**** md5 signature: bca52594fb84bdf1c9b46ce4d487e8cb ****/
		%feature("compactdefaultargs") Approx_FitAndDivide2d;
		%feature("autodoc", "Initializes the fields of the algorithm.

Parameters
----------
degreemin: int,optional
	default value is 3
degreemax: int,optional
	default value is 8
Tolerance3d: float,optional
	default value is 1.0e-05
Tolerance2d: float,optional
	default value is 1.0e-05
cutting: bool,optional
	default value is Standard_False
FirstC: AppParCurves_Constraint,optional
	default value is AppParCurves_TangencyPoint
LastC: AppParCurves_Constraint,optional
	default value is AppParCurves_TangencyPoint

Returns
-------
None
") Approx_FitAndDivide2d;
		 Approx_FitAndDivide2d(const Standard_Integer degreemin = 3, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-05, const Standard_Real Tolerance2d = 1.0e-05, const Standard_Boolean cutting = Standard_False, const AppParCurves_Constraint FirstC = AppParCurves_TangencyPoint, const AppParCurves_Constraint LastC = AppParCurves_TangencyPoint);

		/****************** Error ******************/
		/**** md5 signature: 6a8061230005ba951097d8b73e7dbec6 ****/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Returns the tolerances 2d and 3d of the <index> multicurve.

Parameters
----------
Index: int

Returns
-------
tol3d: float
tol2d: float
") Error;
		void Error(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** IsAllApproximated ******************/
		/**** md5 signature: bf42a9f9ee3a867655d96a0c1fdcd853 ****/
		%feature("compactdefaultargs") IsAllApproximated;
		%feature("autodoc", "Returns false if at a moment of the approximation, the status noapproximation has been sent by the user when more points were needed.

Returns
-------
bool
") IsAllApproximated;
		Standard_Boolean IsAllApproximated();

		/****************** IsToleranceReached ******************/
		/**** md5 signature: cbd7380250e74c96655b10c8025eb873 ****/
		%feature("compactdefaultargs") IsToleranceReached;
		%feature("autodoc", "Returns false if the status nopointsadded has been sent.

Returns
-------
bool
") IsToleranceReached;
		Standard_Boolean IsToleranceReached();

		/****************** NbMultiCurves ******************/
		/**** md5 signature: 944d4af40d93d46a8a3a888df2d8b388 ****/
		%feature("compactdefaultargs") NbMultiCurves;
		%feature("autodoc", "Returns the number of multicurve doing the approximation of the multiline.

Returns
-------
int
") NbMultiCurves;
		Standard_Integer NbMultiCurves();

		/****************** Parameters ******************/
		/**** md5 signature: da3dbf6a597566992bf85427f2de867b ****/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
firstp: float
lastp: float
") Parameters;
		void Parameters(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Perform ******************/
		/**** md5 signature: caf6a1aea817b16df8ee08ce9b993f4f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Runs the algorithm after having initialized the fields.

Parameters
----------
Line: AppCont_Function

Returns
-------
None
") Perform;
		void Perform(const AppCont_Function & Line);

		/****************** SetConstraints ******************/
		/**** md5 signature: 99b92dc193142adf44568f800cd394dc ****/
		%feature("compactdefaultargs") SetConstraints;
		%feature("autodoc", "Changes the constraints of the approximation.

Parameters
----------
FirstC: AppParCurves_Constraint
LastC: AppParCurves_Constraint

Returns
-------
None
") SetConstraints;
		void SetConstraints(const AppParCurves_Constraint FirstC, const AppParCurves_Constraint LastC);

		/****************** SetDegrees ******************/
		/**** md5 signature: 545fdd7d739fa58cc970e73d0413f8ef ****/
		%feature("compactdefaultargs") SetDegrees;
		%feature("autodoc", "Changes the degrees of the approximation.

Parameters
----------
degreemin: int
degreemax: int

Returns
-------
None
") SetDegrees;
		void SetDegrees(const Standard_Integer degreemin, const Standard_Integer degreemax);

		/****************** SetInvOrder ******************/
		/**** md5 signature: 50bac5968816111fd573c6f1be407215 ****/
		%feature("compactdefaultargs") SetInvOrder;
		%feature("autodoc", "Set inverse order of degree selection: if theinvordr = true, current degree is chosen by inverse order - from maxdegree to mindegree. by default inverse order is used.

Parameters
----------
theInvOrder: bool

Returns
-------
None
") SetInvOrder;
		void SetInvOrder(const Standard_Boolean theInvOrder);

		/****************** SetMaxSegments ******************/
		/**** md5 signature: 649dded305ab339e1c7f2a819b32eedd ****/
		%feature("compactdefaultargs") SetMaxSegments;
		%feature("autodoc", "Changes the max number of segments, which is allowed for cutting.

Parameters
----------
theMaxSegments: int

Returns
-------
None
") SetMaxSegments;
		void SetMaxSegments(const Standard_Integer theMaxSegments);

		/****************** SetTolerances ******************/
		/**** md5 signature: ce7879738ace848f7a3a27c56467be10 ****/
		%feature("compactdefaultargs") SetTolerances;
		%feature("autodoc", "Changes the tolerances of the approximation.

Parameters
----------
Tolerance3d: float
Tolerance2d: float

Returns
-------
None
") SetTolerances;
		void SetTolerances(const Standard_Real Tolerance3d, const Standard_Real Tolerance2d);

		/****************** Value ******************/
		/**** md5 signature: 89790f3ff3d6d18a45f409a34e79bd67 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the approximation multicurve of range <index>.

Parameters
----------
Index: int,optional
	default value is 1

Returns
-------
AppParCurves_MultiCurve
") Value;
		AppParCurves_MultiCurve Value(const Standard_Integer Index = 1);

};


%extend Approx_FitAndDivide2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class Approx_MCurvesToBSpCurve *
*********************************/
class Approx_MCurvesToBSpCurve {
	public:
		/****************** Approx_MCurvesToBSpCurve ******************/
		/**** md5 signature: f2ce6c1a8e6e0de7a78187ebdf09738b ****/
		%feature("compactdefaultargs") Approx_MCurvesToBSpCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Approx_MCurvesToBSpCurve;
		 Approx_MCurvesToBSpCurve();

		/****************** Append ******************/
		/**** md5 signature: ffc631c7b8994b3171041a1a53a9ce0c ****/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "No available documentation.

Parameters
----------
MC: AppParCurves_MultiCurve

Returns
-------
None
") Append;
		void Append(const AppParCurves_MultiCurve & MC);

		/****************** ChangeValue ******************/
		/**** md5 signature: 2275e53c2101f0a946b62e87720ec0a1 ****/
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "Return the composite multicurves as a multibspcurve.

Returns
-------
AppParCurves_MultiBSpCurve
") ChangeValue;
		const AppParCurves_MultiBSpCurve & ChangeValue();

		/****************** Perform ******************/
		/**** md5 signature: c04b01412cba7220c024b5eb4532697f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Perform;
		void Perform();

		/****************** Perform ******************/
		/**** md5 signature: ecc994138ac3982c8ac29315eac11580 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
TheSeq: AppParCurves_SequenceOfMultiCurve

Returns
-------
None
") Perform;
		void Perform(const AppParCurves_SequenceOfMultiCurve & TheSeq);

		/****************** Reset ******************/
		/**** md5 signature: 7beb446fe26b948f797f8de87e46c23d ****/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Reset;
		void Reset();

		/****************** Value ******************/
		/**** md5 signature: c818c96a9a832640b6267a997c4dbd3b ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return the composite multicurves as a multibspcurve.

Returns
-------
AppParCurves_MultiBSpCurve
") Value;
		const AppParCurves_MultiBSpCurve & Value();

};


%extend Approx_MCurvesToBSpCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class Approx_SameParameter *
*****************************/
class Approx_SameParameter {
	public:
		/****************** Approx_SameParameter ******************/
		/**** md5 signature: 2930666ec596179e1ab77039278ff0c2 ****/
		%feature("compactdefaultargs") Approx_SameParameter;
		%feature("autodoc", "Warning: the c3d and c2d must have the same parametric domain.

Parameters
----------
C3D: Geom_Curve
C2D: Geom2d_Curve
S: Geom_Surface
Tol: float

Returns
-------
None
") Approx_SameParameter;
		 Approx_SameParameter(const opencascade::handle<Geom_Curve> & C3D, const opencascade::handle<Geom2d_Curve> & C2D, const opencascade::handle<Geom_Surface> & S, const Standard_Real Tol);

		/****************** Approx_SameParameter ******************/
		/**** md5 signature: bcc24beb554e4ba834ebfad460b28050 ****/
		%feature("compactdefaultargs") Approx_SameParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
C3D: Adaptor3d_HCurve
C2D: Geom2d_Curve
S: Adaptor3d_HSurface
Tol: float

Returns
-------
None
") Approx_SameParameter;
		 Approx_SameParameter(const opencascade::handle<Adaptor3d_HCurve> & C3D, const opencascade::handle<Geom2d_Curve> & C2D, const opencascade::handle<Adaptor3d_HSurface> & S, const Standard_Real Tol);

		/****************** Approx_SameParameter ******************/
		/**** md5 signature: b09fa1bc62b4172d25965850dec9f2da ****/
		%feature("compactdefaultargs") Approx_SameParameter;
		%feature("autodoc", "Warning: the c3d and c2d must have the same parametric domain.

Parameters
----------
C3D: Adaptor3d_HCurve
C2D: Adaptor2d_HCurve2d
S: Adaptor3d_HSurface
Tol: float

Returns
-------
None
") Approx_SameParameter;
		 Approx_SameParameter(const opencascade::handle<Adaptor3d_HCurve> & C3D, const opencascade::handle<Adaptor2d_HCurve2d> & C2D, const opencascade::handle<Adaptor3d_HSurface> & S, const Standard_Real Tol);

		/****************** Curve2d ******************/
		/**** md5 signature: a68a2dac2ad11e4da3864dc2433ead7f ****/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "Returns the 2d curve that has the same parameter as the 3d curve once evaluated on the surface up to the specified tolerance.

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") Curve2d;
		opencascade::handle<Geom2d_BSplineCurve> Curve2d();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsSameParameter ******************/
		/**** md5 signature: aee4524a1b3779c820860bcd014293ec ****/
		%feature("compactdefaultargs") IsSameParameter;
		%feature("autodoc", "Tells whether the original data had already the same parameter up to the tolerance : in that case nothing is done.

Returns
-------
bool
") IsSameParameter;
		Standard_Boolean IsSameParameter();

		/****************** TolReached ******************/
		/**** md5 signature: 6afc0155da93ccb66d9c7f09c6a7d0e0 ****/
		%feature("compactdefaultargs") TolReached;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") TolReached;
		Standard_Real TolReached();

};


%extend Approx_SameParameter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class Approx_SweepApproximation *
**********************************/
class Approx_SweepApproximation {
	public:
		/****************** Approx_SweepApproximation ******************/
		/**** md5 signature: 1e58ff1dd49473e8ec1efa55877921aa ****/
		%feature("compactdefaultargs") Approx_SweepApproximation;
		%feature("autodoc", "No available documentation.

Parameters
----------
Func: Approx_SweepFunction

Returns
-------
None
") Approx_SweepApproximation;
		 Approx_SweepApproximation(const opencascade::handle<Approx_SweepFunction> & Func);

		/****************** Average2dError ******************/
		/**** md5 signature: 8ed28c3aca266ff5de26936a7d153ffb ****/
		%feature("compactdefaultargs") Average2dError;
		%feature("autodoc", "Returns the average error of the <index> 2d curve approximation.

Parameters
----------
Index: int

Returns
-------
float
") Average2dError;
		Standard_Real Average2dError(const Standard_Integer Index);

		/****************** AverageErrorOnSurf ******************/
		/**** md5 signature: bac8be79201b06f130f6dd21a4817d03 ****/
		%feature("compactdefaultargs") AverageErrorOnSurf;
		%feature("autodoc", "Returns the average error in the suface approximation.

Returns
-------
float
") AverageErrorOnSurf;
		Standard_Real AverageErrorOnSurf();

		/****************** Curve2d ******************/
		/**** md5 signature: 45f5fb41b7daba7a20d1fb56ead05f0f ****/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int
TPoles: TColgp_Array1OfPnt2d
TKnots: TColStd_Array1OfReal
TMults: TColStd_Array1OfInteger

Returns
-------
None
") Curve2d;
		void Curve2d(const Standard_Integer Index, TColgp_Array1OfPnt2d & TPoles, TColStd_Array1OfReal & TKnots, TColStd_Array1OfInteger & TMults);

		/****************** Curve2dPoles ******************/
		/**** md5 signature: 8df321abd16a4651f96229eab1c5f048 ****/
		%feature("compactdefaultargs") Curve2dPoles;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
TColgp_Array1OfPnt2d
") Curve2dPoles;
		const TColgp_Array1OfPnt2d & Curve2dPoles(const Standard_Integer Index);

		/****************** Curves2dDegree ******************/
		/**** md5 signature: 85ba31033da623d05ad75c9b051842b3 ****/
		%feature("compactdefaultargs") Curves2dDegree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Curves2dDegree;
		Standard_Integer Curves2dDegree();

		/****************** Curves2dKnots ******************/
		/**** md5 signature: cd12725d88c425f3fe1ebccf9467256f ****/
		%feature("compactdefaultargs") Curves2dKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfReal
") Curves2dKnots;
		const TColStd_Array1OfReal & Curves2dKnots();

		/****************** Curves2dMults ******************/
		/**** md5 signature: d4f1ca5a39a589bb289460010c5bbf39 ****/
		%feature("compactdefaultargs") Curves2dMults;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfInteger
") Curves2dMults;
		const TColStd_Array1OfInteger & Curves2dMults();

		/****************** Curves2dShape ******************/
		/**** md5 signature: 28bf2faa4b8e811f12223cb99d1721ea ****/
		%feature("compactdefaultargs") Curves2dShape;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
Degree: int
NbPoles: int
NbKnots: int
") Curves2dShape;
		void Curves2dShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Eval ******************/
		/**** md5 signature: 71e7f11e45548ac47de3b270019a0b2d ****/
		%feature("compactdefaultargs") Eval;
		%feature("autodoc", "The evaluatorfunction from advapprox;.

Parameters
----------
Parameter: float
DerivativeRequest: int
First: float
Last: float

Returns
-------
Result: float
") Eval;
		Standard_Integer Eval(const Standard_Real Parameter, const Standard_Integer DerivativeRequest, const Standard_Real First, const Standard_Real Last, Standard_Real &OutValue);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns if we have an result.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Max2dError ******************/
		/**** md5 signature: bb3f56b4b55e0d91b8620b3ad4fad758 ****/
		%feature("compactdefaultargs") Max2dError;
		%feature("autodoc", "Returns the maximum error of the <index> 2d curve approximation.

Parameters
----------
Index: int

Returns
-------
float
") Max2dError;
		Standard_Real Max2dError(const Standard_Integer Index);

		/****************** MaxErrorOnSurf ******************/
		/**** md5 signature: e42290da593c42adaac24f68c51ecbda ****/
		%feature("compactdefaultargs") MaxErrorOnSurf;
		%feature("autodoc", "Returns the maximum error in the suface approximation.

Returns
-------
float
") MaxErrorOnSurf;
		Standard_Real MaxErrorOnSurf();

		/****************** NbCurves2d ******************/
		/**** md5 signature: 91ae967daa54efe7d38afad4a5698e5b ****/
		%feature("compactdefaultargs") NbCurves2d;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbCurves2d;
		Standard_Integer NbCurves2d();

		/****************** Perform ******************/
		/**** md5 signature: 306f26941735cb759216a105543fe10a ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Perform the approximation [first, last] : approx_sweepapproximation.cdl tol3d : tolerance to surface approximation tol2d : tolerance used to perform curve approximation normaly the 2d curve are approximated with a tolerance given by the resolution on support surfaces, but if this tolerance is too large tol2d is used. tolangular : tolerance (in radian) to control the angle beetween tangents on the section law and tangent of iso-v on approximed surface continuity : the continuity in v waiting on the surface degmax : the maximum degree in v requiered on the surface segmax : the maximum number of span in v requiered on the surface warning : the continuity ci can be obtained only if ft is ci.

Parameters
----------
First: float
Last: float
Tol3d: float
BoundTol: float
Tol2d: float
TolAngular: float
Continuity: GeomAbs_Shape,optional
	default value is GeomAbs_C0
Degmax: int,optional
	default value is 11
Segmax: int,optional
	default value is 50

Returns
-------
None
") Perform;
		void Perform(const Standard_Real First, const Standard_Real Last, const Standard_Real Tol3d, const Standard_Real BoundTol, const Standard_Real Tol2d, const Standard_Real TolAngular, const GeomAbs_Shape Continuity = GeomAbs_C0, const Standard_Integer Degmax = 11, const Standard_Integer Segmax = 50);

		/****************** SurfPoles ******************/
		/**** md5 signature: 33be5d08621b237fcd73b5b9accd2338 ****/
		%feature("compactdefaultargs") SurfPoles;
		%feature("autodoc", "No available documentation.

Returns
-------
TColgp_Array2OfPnt
") SurfPoles;
		const TColgp_Array2OfPnt & SurfPoles();

		/****************** SurfShape ******************/
		/**** md5 signature: 6dbc9c018a92aabb9f9d1988ac20cb43 ****/
		%feature("compactdefaultargs") SurfShape;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
UDegree: int
VDegree: int
NbUPoles: int
NbVPoles: int
NbUKnots: int
NbVKnots: int
") SurfShape;
		void SurfShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** SurfUKnots ******************/
		/**** md5 signature: 30cf4dd9deaf04a1c77052e14ae7392b ****/
		%feature("compactdefaultargs") SurfUKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfReal
") SurfUKnots;
		const TColStd_Array1OfReal & SurfUKnots();

		/****************** SurfUMults ******************/
		/**** md5 signature: ef046447df8e4b2931da90e1475e731f ****/
		%feature("compactdefaultargs") SurfUMults;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfInteger
") SurfUMults;
		const TColStd_Array1OfInteger & SurfUMults();

		/****************** SurfVKnots ******************/
		/**** md5 signature: 52c9dafc43c5e3713c77d7aa4381da5c ****/
		%feature("compactdefaultargs") SurfVKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfReal
") SurfVKnots;
		const TColStd_Array1OfReal & SurfVKnots();

		/****************** SurfVMults ******************/
		/**** md5 signature: 589e6536c77c512e7a37f99faf0fa21c ****/
		%feature("compactdefaultargs") SurfVMults;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfInteger
") SurfVMults;
		const TColStd_Array1OfInteger & SurfVMults();

		/****************** SurfWeights ******************/
		/**** md5 signature: 894d2a3f2c33f7d641aef9c7f9e3fa57 ****/
		%feature("compactdefaultargs") SurfWeights;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array2OfReal
") SurfWeights;
		const TColStd_Array2OfReal & SurfWeights();

		/****************** Surface ******************/
		/**** md5 signature: 49bb9dd6da49966f0010e14dd0ffef04 ****/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "No available documentation.

Parameters
----------
TPoles: TColgp_Array2OfPnt
TWeights: TColStd_Array2OfReal
TUKnots: TColStd_Array1OfReal
TVKnots: TColStd_Array1OfReal
TUMults: TColStd_Array1OfInteger
TVMults: TColStd_Array1OfInteger

Returns
-------
None
") Surface;
		void Surface(TColgp_Array2OfPnt & TPoles, TColStd_Array2OfReal & TWeights, TColStd_Array1OfReal & TUKnots, TColStd_Array1OfReal & TVKnots, TColStd_Array1OfInteger & TUMults, TColStd_Array1OfInteger & TVMults);

		/****************** TolCurveOnSurf ******************/
		/**** md5 signature: f21f0f877b35cf67581fa59260f72857 ****/
		%feature("compactdefaultargs") TolCurveOnSurf;
		%feature("autodoc", "Returns the maximum 3d error of the <index> 2d curve approximation on the surface.

Parameters
----------
Index: int

Returns
-------
float
") TolCurveOnSurf;
		Standard_Real TolCurveOnSurf(const Standard_Integer Index);

		/****************** UDegree ******************/
		/**** md5 signature: f204e5fbf1c49e3d9e4889dfead5a190 ****/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") UDegree;
		Standard_Integer UDegree();

		/****************** VDegree ******************/
		/**** md5 signature: 4901bdb3b29a5c2410ca93d6a7816f06 ****/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") VDegree;
		Standard_Integer VDegree();

};


%extend Approx_SweepApproximation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class Approx_SweepFunction *
*****************************/
%nodefaultctor Approx_SweepFunction;
class Approx_SweepFunction : public Standard_Transient {
	public:
		/****************** BarycentreOfSurf ******************/
		/**** md5 signature: cbc6eaf5619edbfc0f2839466f8de856 ****/
		%feature("compactdefaultargs") BarycentreOfSurf;
		%feature("autodoc", "Get the barycentre of surface. an very poor estimation is sufficent. this information is usefull to perform well conditioned rational approximation. warning: used only if <self> isrational.

Returns
-------
gp_Pnt
") BarycentreOfSurf;
		virtual gp_Pnt BarycentreOfSurf();

		/****************** D0 ******************/
		/**** md5 signature: 59d4398da857a954d97c3c261c2f0d6a ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Compute the section for v = param.

Parameters
----------
Param: float
First: float
Last: float
Poles: TColgp_Array1OfPnt
Poles2d: TColgp_Array1OfPnt2d
Weigths: TColStd_Array1OfReal

Returns
-------
bool
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, const Standard_Real First, const Standard_Real Last, TColgp_Array1OfPnt & Poles, TColgp_Array1OfPnt2d & Poles2d, TColStd_Array1OfReal & Weigths);

		/****************** D1 ******************/
		/**** md5 signature: 509d473b60471c40fb84a525daccf7b2 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Compute the first derivative in v direction of the section for v = param warning : it used only for c1 or c2 aproximation.

Parameters
----------
Param: float
First: float
Last: float
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal

Returns
-------
bool
") D1;
		virtual Standard_Boolean D1(const Standard_Real Param, const Standard_Real First, const Standard_Real Last, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****************** D2 ******************/
		/**** md5 signature: 9688db55fcb73e40afa5da6bce93a93e ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Compute the second derivative in v direction of the section for v = param warning : it used only for c2 aproximation.

Parameters
----------
Param: float
First: float
Last: float
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
D2Poles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
D2Poles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal
D2Weigths: TColStd_Array1OfReal

Returns
-------
bool
") D2;
		virtual Standard_Boolean D2(const Standard_Real Param, const Standard_Real First, const Standard_Real Last, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****************** GetMinimalWeight ******************/
		/**** md5 signature: 6fdd12d5da1669c5217b9449c91c0d9e ****/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "Compute the minimal value of weight for each poles in all sections. this information is usefull to control error in rational approximation. warning: used only if <self> isrational.

Parameters
----------
Weigths: TColStd_Array1OfReal

Returns
-------
None
") GetMinimalWeight;
		virtual void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****************** GetTolerance ******************/
		/**** md5 signature: 1096196f89d9fc10f33e62e0d43284fe ****/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "Returns the tolerance to reach in approximation to satisfy. boundtol error at the boundary angletol tangent error at the boundary (in radian) surftol error inside the surface.

Parameters
----------
BoundTol: float
SurfTol: float
AngleTol: float
Tol3d: TColStd_Array1OfReal

Returns
-------
None
") GetTolerance;
		virtual void GetTolerance(const Standard_Real BoundTol, const Standard_Real SurfTol, const Standard_Real AngleTol, TColStd_Array1OfReal & Tol3d);

		/****************** Intervals ******************/
		/**** md5 signature: 7d2bf038a9213acf1609cc1244a3ee03 ****/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsRational ******************/
		/**** md5 signature: e2d546fe827c13e22032dacc2ce90819 ****/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns if the sections are rationnal or not.

Returns
-------
bool
") IsRational;
		virtual Standard_Boolean IsRational();

		/****************** Knots ******************/
		/**** md5 signature: 7e71a376fdfa4fc27638b1b7f6f203bb ****/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "Get the knots of the section.

Parameters
----------
TKnots: TColStd_Array1OfReal

Returns
-------
None
") Knots;
		virtual void Knots(TColStd_Array1OfReal & TKnots);

		/****************** MaximalSection ******************/
		/**** md5 signature: d9acdf10cc3735a15f259a425c017f62 ****/
		%feature("compactdefaultargs") MaximalSection;
		%feature("autodoc", "Returns the length of the greater section. this information is usefull to g1's control. warning: with an little value, approximation can be slower.

Returns
-------
float
") MaximalSection;
		virtual Standard_Real MaximalSection();

		/****************** Mults ******************/
		/**** md5 signature: d5fb3b1381d15914585fd7e6e0eafecb ****/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "Get the multplicities of the section.

Parameters
----------
TMults: TColStd_Array1OfInteger

Returns
-------
None
") Mults;
		virtual void Mults(TColStd_Array1OfInteger & TMults);

		/****************** Nb2dCurves ******************/
		/**** md5 signature: 1badd0e2d38d18f16705a0a708ba7c67 ****/
		%feature("compactdefaultargs") Nb2dCurves;
		%feature("autodoc", "Get the number of 2d curves to approximate.

Returns
-------
int
") Nb2dCurves;
		virtual Standard_Integer Nb2dCurves();

		/****************** NbIntervals ******************/
		/**** md5 signature: cb7f68d4b2c30f29cd5ba6f81443d314 ****/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** Resolution ******************/
		/**** md5 signature: 70b0f0265ef5802a650e7ab2f0220a7e ****/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Returns the resolutions in the sub-space 2d <index> this information is usfull to find an good tolerance in 2d approximation.

Parameters
----------
Index: int
Tol: float

Returns
-------
TolU: float
TolV: float
") Resolution;
		virtual void Resolution(const Standard_Integer Index, const Standard_Real Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** SectionShape ******************/
		/**** md5 signature: 2709d0545e048eec44ae3de66392188f ****/
		%feature("compactdefaultargs") SectionShape;
		%feature("autodoc", "Get the format of an section.

Parameters
----------

Returns
-------
NbPoles: int
NbKnots: int
Degree: int
") SectionShape;
		virtual void SectionShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** SetInterval ******************/
		/**** md5 signature: 0547f3a9c04c5f6c0363c26295b2e795 ****/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "Sets the bounds of the parametric interval on the fonction this determines the derivatives in these values if the function is not cn.

Parameters
----------
First: float
Last: float

Returns
-------
None
") SetInterval;
		virtual void SetInterval(const Standard_Real First, const Standard_Real Last);

		/****************** SetTolerance ******************/
		/**** md5 signature: 93e9274684dae026e60334d9dec71409 ****/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "Is usefull, if (me) have to run numerical algorithm to perform d0, d1 or d2.

Parameters
----------
Tol3d: float
Tol2d: float

Returns
-------
None
") SetTolerance;
		virtual void SetTolerance(const Standard_Real Tol3d, const Standard_Real Tol2d);

};


%make_alias(Approx_SweepFunction)

%extend Approx_SweepFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */

class Approx_HArray1OfGTrsf2d : public Approx_Array1OfGTrsf2d, public Standard_Transient {
  public:
    Approx_HArray1OfGTrsf2d(const Standard_Integer theLower, const Standard_Integer theUpper);
    Approx_HArray1OfGTrsf2d(const Standard_Integer theLower, const Standard_Integer theUpper, const Approx_Array1OfGTrsf2d::value_type& theValue);
    Approx_HArray1OfGTrsf2d(const Approx_Array1OfGTrsf2d& theOther);
    const Approx_Array1OfGTrsf2d& Array1();
    Approx_Array1OfGTrsf2d& ChangeArray1();
};
%make_alias(Approx_HArray1OfGTrsf2d)


class Approx_HArray1OfAdHSurface : public Approx_Array1OfAdHSurface, public Standard_Transient {
  public:
    Approx_HArray1OfAdHSurface(const Standard_Integer theLower, const Standard_Integer theUpper);
    Approx_HArray1OfAdHSurface(const Standard_Integer theLower, const Standard_Integer theUpper, const Approx_Array1OfAdHSurface::value_type& theValue);
    Approx_HArray1OfAdHSurface(const Approx_Array1OfAdHSurface& theOther);
    const Approx_Array1OfAdHSurface& Array1();
    Approx_Array1OfAdHSurface& ChangeArray1();
};
%make_alias(Approx_HArray1OfAdHSurface)

/* harray2 classes */
/* hsequence classes */
