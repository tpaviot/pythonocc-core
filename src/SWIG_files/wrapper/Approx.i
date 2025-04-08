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
%define APPROXDOCSTRING
"Approx module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_approx.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
#include<Approx_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Adaptor3d_module.hxx>
#include<TColStd_module.hxx>
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
%import Adaptor3d.i
%import TColStd.i
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
enum Approx_ParametrizationType {
	Approx_ChordLength = 0,
	Approx_Centripetal = 1,
	Approx_IsoParametric = 2,
};

enum Approx_Status {
	Approx_PointsAdded = 0,
	Approx_NoPointsAdded = 1,
	Approx_NoApproximation = 2,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class Approx_ParametrizationType(IntEnum):
	Approx_ChordLength = 0
	Approx_Centripetal = 1
	Approx_IsoParametric = 2
Approx_ChordLength = Approx_ParametrizationType.Approx_ChordLength
Approx_Centripetal = Approx_ParametrizationType.Approx_Centripetal
Approx_IsoParametric = Approx_ParametrizationType.Approx_IsoParametric

class Approx_Status(IntEnum):
	Approx_PointsAdded = 0
	Approx_NoPointsAdded = 1
	Approx_NoApproximation = 2
Approx_PointsAdded = Approx_Status.Approx_PointsAdded
Approx_NoPointsAdded = Approx_Status.Approx_NoPointsAdded
Approx_NoApproximation = Approx_Status.Approx_NoApproximation
};
/* end python proxy for enums */

/* handles */
%wrap_handle(Approx_CurvlinFunc)
%wrap_handle(Approx_SweepFunction)
%wrap_handle(Approx_HArray1OfAdHSurface)
%wrap_handle(Approx_HArray1OfGTrsf2d)
/* end handles declaration */

/* templates */
%template(Approx_Array1OfAdHSurface) NCollection_Array1<opencascade::handle<Adaptor3d_Surface>>;
Array1ExtendIter(opencascade::handle<Adaptor3d_Surface>)

%template(Approx_Array1OfGTrsf2d) NCollection_Array1<gp_GTrsf2d>;
Array1ExtendIter(gp_GTrsf2d)

%template(Approx_SequenceOfHArray1OfReal) NCollection_Sequence<opencascade::handle<TColStd_HArray1OfReal>>;

%extend NCollection_Sequence<opencascade::handle<TColStd_HArray1OfReal>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<opencascade::handle<Adaptor3d_Surface>> Approx_Array1OfAdHSurface;
typedef NCollection_Array1<gp_GTrsf2d> Approx_Array1OfGTrsf2d;
typedef NCollection_Sequence<opencascade::handle<TColStd_HArray1OfReal>> Approx_SequenceOfHArray1OfReal;
/* end typedefs declaration */

/***********************
* class Approx_Curve2d *
***********************/
class Approx_Curve2d {
	public:
		/****** Approx_Curve2d::Approx_Curve2d ******/
		/****** md5 signature: 1cf9afd9ee459ec2a81ee32abee6de50 ******/
		%feature("compactdefaultargs") Approx_Curve2d;
		%feature("autodoc", "
Parameters
----------
C2D: Adaptor2d_Curve2d
First: float
Last: float
TolU: float
TolV: float
Continuity: GeomAbs_Shape
MaxDegree: int
MaxSegments: int

Return
-------
None

Description
-----------
No available documentation.
") Approx_Curve2d;
		 Approx_Curve2d(const opencascade::handle<Adaptor2d_Curve2d> & C2D, const Standard_Real First, const Standard_Real Last, const Standard_Real TolU, const Standard_Real TolV, const GeomAbs_Shape Continuity, const Standard_Integer MaxDegree, const Standard_Integer MaxSegments);

		/****** Approx_Curve2d::Curve ******/
		/****** md5 signature: 1960069de54819d72fccc75ab85806ec ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
No available documentation.
") Curve;
		opencascade::handle<Geom2d_BSplineCurve> Curve();

		/****** Approx_Curve2d::HasResult ******/
		/****** md5 signature: 345d4b0f7e88f528928167976d8256d5 ******/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasResult;
		Standard_Boolean HasResult();

		/****** Approx_Curve2d::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****** Approx_Curve2d::MaxError2dU ******/
		/****** md5 signature: 847075004569102dbcc931f742530c0e ******/
		%feature("compactdefaultargs") MaxError2dU;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") MaxError2dU;
		Standard_Real MaxError2dU();

		/****** Approx_Curve2d::MaxError2dV ******/
		/****** md5 signature: 641a3fe3b7d3b163d6a32b23f94b6eec ******/
		%feature("compactdefaultargs") MaxError2dV;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
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
		/****** Approx_Curve3d::Approx_Curve3d ******/
		/****** md5 signature: 4662771ab9a9bb958e880ba73bec8340 ******/
		%feature("compactdefaultargs") Approx_Curve3d;
		%feature("autodoc", "
Parameters
----------
Curve: Adaptor3d_Curve
Tol3d: float
Order: GeomAbs_Shape
MaxSegments: int
MaxDegree: int

Return
-------
None

Description
-----------
Approximation of a curve with respect of the required tolerance Tol3D.
") Approx_Curve3d;
		 Approx_Curve3d(const opencascade::handle<Adaptor3d_Curve> & Curve, const Standard_Real Tol3d, const GeomAbs_Shape Order, const Standard_Integer MaxSegments, const Standard_Integer MaxDegree);

		/****** Approx_Curve3d::Curve ******/
		/****** md5 signature: 8f61eb8bebb31bbd1fd75a7da450accd ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineCurve>

Description
-----------
No available documentation.
") Curve;
		opencascade::handle<Geom_BSplineCurve> Curve();

		/****** Approx_Curve3d::Dump ******/
		/****** md5 signature: d37b43e0b2386dc096d5d707876db157 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
o: Standard_OStream

Description
-----------
Print on the stream o information about the object.
") Dump;
		void Dump(std::ostream &OutValue);

		/****** Approx_Curve3d::HasResult ******/
		/****** md5 signature: 345d4b0f7e88f528928167976d8256d5 ******/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns Standard_True if the approximation did come out with a result that is not NECESSARELY within the required tolerance.
") HasResult;
		Standard_Boolean HasResult();

		/****** Approx_Curve3d::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns Standard_True if the approximation has been done within required tolerance.
") IsDone;
		Standard_Boolean IsDone();

		/****** Approx_Curve3d::MaxError ******/
		/****** md5 signature: 90f2419f0b1537a77da84305579339a2 ******/
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the Maximum Error (>0 when an approximation has been done, 0 if no approximation).
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
		/****** Approx_CurveOnSurface::Approx_CurveOnSurface ******/
		/****** md5 signature: 8924b9935f0fc05dc273ee96b9ecd51b ******/
		%feature("compactdefaultargs") Approx_CurveOnSurface;
		%feature("autodoc", "
Parameters
----------
C2D: Adaptor2d_Curve2d
Surf: Adaptor3d_Surface
First: float
Last: float
Tol: float
Continuity: GeomAbs_Shape
MaxDegree: int
MaxSegments: int
Only3d: bool (optional, default to Standard_False)
Only2d: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
This constructor calls perform method. This constructor is deprecated.
") Approx_CurveOnSurface;
		 Approx_CurveOnSurface(const opencascade::handle<Adaptor2d_Curve2d> & C2D, const opencascade::handle<Adaptor3d_Surface> & Surf, const Standard_Real First, const Standard_Real Last, const Standard_Real Tol, const GeomAbs_Shape Continuity, const Standard_Integer MaxDegree, const Standard_Integer MaxSegments, const Standard_Boolean Only3d = Standard_False, const Standard_Boolean Only2d = Standard_False);

		/****** Approx_CurveOnSurface::Approx_CurveOnSurface ******/
		/****** md5 signature: 6bf6e1de687ad8553d00cd8a3f1f8344 ******/
		%feature("compactdefaultargs") Approx_CurveOnSurface;
		%feature("autodoc", "
Parameters
----------
theC2D: Adaptor2d_Curve2d
theSurf: Adaptor3d_Surface
theFirst: float
theLast: float
theTol: float

Return
-------
None

Description
-----------
This constructor does not call perform method. 
Parameter theC2D 2D Curve to be approximated in 3D. 
Parameter theSurf Surface where 2D curve is located. 
Parameter theFirst First parameter of resulting curve. 
Parameter theFirst Last parameter of resulting curve. 
Parameter theTol Computation tolerance.
") Approx_CurveOnSurface;
		 Approx_CurveOnSurface(const opencascade::handle<Adaptor2d_Curve2d> & theC2D, const opencascade::handle<Adaptor3d_Surface> & theSurf, const Standard_Real theFirst, const Standard_Real theLast, const Standard_Real theTol);

		/****** Approx_CurveOnSurface::Curve2d ******/
		/****** md5 signature: a68a2dac2ad11e4da3864dc2433ead7f ******/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
No available documentation.
") Curve2d;
		opencascade::handle<Geom2d_BSplineCurve> Curve2d();

		/****** Approx_CurveOnSurface::Curve3d ******/
		/****** md5 signature: 40af7069a21d4ba6c9b73d59c7d6dc50 ******/
		%feature("compactdefaultargs") Curve3d;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineCurve>

Description
-----------
No available documentation.
") Curve3d;
		opencascade::handle<Geom_BSplineCurve> Curve3d();

		/****** Approx_CurveOnSurface::HasResult ******/
		/****** md5 signature: 345d4b0f7e88f528928167976d8256d5 ******/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasResult;
		Standard_Boolean HasResult();

		/****** Approx_CurveOnSurface::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****** Approx_CurveOnSurface::MaxError2dU ******/
		/****** md5 signature: 847075004569102dbcc931f742530c0e ******/
		%feature("compactdefaultargs") MaxError2dU;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") MaxError2dU;
		Standard_Real MaxError2dU();

		/****** Approx_CurveOnSurface::MaxError2dV ******/
		/****** md5 signature: 641a3fe3b7d3b163d6a32b23f94b6eec ******/
		%feature("compactdefaultargs") MaxError2dV;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the maximum errors relatively to the U component or the V component of the 2d Curve.
") MaxError2dV;
		Standard_Real MaxError2dV();

		/****** Approx_CurveOnSurface::MaxError3d ******/
		/****** md5 signature: c6ba463cdf4a0e426329b589363186b7 ******/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") MaxError3d;
		Standard_Real MaxError3d();

		/****** Approx_CurveOnSurface::Perform ******/
		/****** md5 signature: fe8b2a86aab3827740ea72c22a54e926 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theMaxSegments: int
theMaxDegree: int
theContinuity: GeomAbs_Shape
theOnly3d: bool (optional, default to Standard_False)
theOnly2d: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Constructs the 3d curve. Input parameters are ignored when the input curve is U-isoline or V-isoline. 
Parameter theMaxSegments Maximal number of segments in the resulting spline. 
Parameter theMaxDegree Maximal degree of the result. 
Parameter theContinuity Resulting continuity. 
Parameter theOnly3d Determines building only 3D curve. 
Parameter theOnly2d Determines building only 2D curve.
") Perform;
		void Perform(const Standard_Integer theMaxSegments, const Standard_Integer theMaxDegree, const GeomAbs_Shape theContinuity, const Standard_Boolean theOnly3d = Standard_False, const Standard_Boolean theOnly2d = Standard_False);

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
		/****** Approx_CurvilinearParameter::Approx_CurvilinearParameter ******/
		/****** md5 signature: 8d18e8dfacd0a079eb20447b49586c35 ******/
		%feature("compactdefaultargs") Approx_CurvilinearParameter;
		%feature("autodoc", "
Parameters
----------
C3D: Adaptor3d_Curve
Tol: float
Order: GeomAbs_Shape
MaxDegree: int
MaxSegments: int

Return
-------
None

Description
-----------
case of a free 3D curve.
") Approx_CurvilinearParameter;
		 Approx_CurvilinearParameter(const opencascade::handle<Adaptor3d_Curve> & C3D, const Standard_Real Tol, const GeomAbs_Shape Order, const Standard_Integer MaxDegree, const Standard_Integer MaxSegments);

		/****** Approx_CurvilinearParameter::Approx_CurvilinearParameter ******/
		/****** md5 signature: 55fdfdb6b236c7342a9df38b0c499ba5 ******/
		%feature("compactdefaultargs") Approx_CurvilinearParameter;
		%feature("autodoc", "
Parameters
----------
C2D: Adaptor2d_Curve2d
Surf: Adaptor3d_Surface
Tol: float
Order: GeomAbs_Shape
MaxDegree: int
MaxSegments: int

Return
-------
None

Description
-----------
case of a curve on one surface.
") Approx_CurvilinearParameter;
		 Approx_CurvilinearParameter(const opencascade::handle<Adaptor2d_Curve2d> & C2D, const opencascade::handle<Adaptor3d_Surface> & Surf, const Standard_Real Tol, const GeomAbs_Shape Order, const Standard_Integer MaxDegree, const Standard_Integer MaxSegments);

		/****** Approx_CurvilinearParameter::Approx_CurvilinearParameter ******/
		/****** md5 signature: c239a7061007faa74c11bd361d60ce57 ******/
		%feature("compactdefaultargs") Approx_CurvilinearParameter;
		%feature("autodoc", "
Parameters
----------
C2D1: Adaptor2d_Curve2d
Surf1: Adaptor3d_Surface
C2D2: Adaptor2d_Curve2d
Surf2: Adaptor3d_Surface
Tol: float
Order: GeomAbs_Shape
MaxDegree: int
MaxSegments: int

Return
-------
None

Description
-----------
case of a curve on two surfaces.
") Approx_CurvilinearParameter;
		 Approx_CurvilinearParameter(const opencascade::handle<Adaptor2d_Curve2d> & C2D1, const opencascade::handle<Adaptor3d_Surface> & Surf1, const opencascade::handle<Adaptor2d_Curve2d> & C2D2, const opencascade::handle<Adaptor3d_Surface> & Surf2, const Standard_Real Tol, const GeomAbs_Shape Order, const Standard_Integer MaxDegree, const Standard_Integer MaxSegments);

		/****** Approx_CurvilinearParameter::Curve2d1 ******/
		/****** md5 signature: 320386716849305473262b1fbe175d01 ******/
		%feature("compactdefaultargs") Curve2d1;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
returns the BsplineCurve representing the reparametrized 2D curve on the first surface (case of a curve on one or two surfaces).
") Curve2d1;
		opencascade::handle<Geom2d_BSplineCurve> Curve2d1();

		/****** Approx_CurvilinearParameter::Curve2d2 ******/
		/****** md5 signature: c454b48582ae4e125bffbd0a7c1ecb65 ******/
		%feature("compactdefaultargs") Curve2d2;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
returns the BsplineCurve representing the reparametrized 2D curve on the second surface (case of a curve on two surfaces).
") Curve2d2;
		opencascade::handle<Geom2d_BSplineCurve> Curve2d2();

		/****** Approx_CurvilinearParameter::Curve3d ******/
		/****** md5 signature: 40af7069a21d4ba6c9b73d59c7d6dc50 ******/
		%feature("compactdefaultargs") Curve3d;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineCurve>

Description
-----------
returns the Bspline curve corresponding to the reparametrized 3D curve.
") Curve3d;
		opencascade::handle<Geom_BSplineCurve> Curve3d();

		/****** Approx_CurvilinearParameter::Dump ******/
		/****** md5 signature: d37b43e0b2386dc096d5d707876db157 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
o: Standard_OStream

Description
-----------
print the maximum errors(s).
") Dump;
		void Dump(std::ostream &OutValue);

		/****** Approx_CurvilinearParameter::HasResult ******/
		/****** md5 signature: 345d4b0f7e88f528928167976d8256d5 ******/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasResult;
		Standard_Boolean HasResult();

		/****** Approx_CurvilinearParameter::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****** Approx_CurvilinearParameter::MaxError2d1 ******/
		/****** md5 signature: 455a6dc1101b77daa7669b3852e634a6 ******/
		%feature("compactdefaultargs") MaxError2d1;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the maximum error on the first reparametrized 2D curve.
") MaxError2d1;
		Standard_Real MaxError2d1();

		/****** Approx_CurvilinearParameter::MaxError2d2 ******/
		/****** md5 signature: 415b1db6afd0a77c250335998bc39142 ******/
		%feature("compactdefaultargs") MaxError2d2;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the maximum error on the second reparametrized 2D curve.
") MaxError2d2;
		Standard_Real MaxError2d2();

		/****** Approx_CurvilinearParameter::MaxError3d ******/
		/****** md5 signature: c6ba463cdf4a0e426329b589363186b7 ******/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the maximum error on the reparametrized 3D curve.
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
		/****** Approx_CurvlinFunc::Approx_CurvlinFunc ******/
		/****** md5 signature: c91fd83aabe931a1e52d13473ccfd009 ******/
		%feature("compactdefaultargs") Approx_CurvlinFunc;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") Approx_CurvlinFunc;
		 Approx_CurvlinFunc(const opencascade::handle<Adaptor3d_Curve> & C, const Standard_Real Tol);

		/****** Approx_CurvlinFunc::Approx_CurvlinFunc ******/
		/****** md5 signature: c69a4fe4cbfe7c5d7648f238e2e8b84a ******/
		%feature("compactdefaultargs") Approx_CurvlinFunc;
		%feature("autodoc", "
Parameters
----------
C2D: Adaptor2d_Curve2d
S: Adaptor3d_Surface
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") Approx_CurvlinFunc;
		 Approx_CurvlinFunc(const opencascade::handle<Adaptor2d_Curve2d> & C2D, const opencascade::handle<Adaptor3d_Surface> & S, const Standard_Real Tol);

		/****** Approx_CurvlinFunc::Approx_CurvlinFunc ******/
		/****** md5 signature: d04cb6fd18225e82ef40a4e61e7e3bdf ******/
		%feature("compactdefaultargs") Approx_CurvlinFunc;
		%feature("autodoc", "
Parameters
----------
C2D1: Adaptor2d_Curve2d
C2D2: Adaptor2d_Curve2d
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") Approx_CurvlinFunc;
		 Approx_CurvlinFunc(const opencascade::handle<Adaptor2d_Curve2d> & C2D1, const opencascade::handle<Adaptor2d_Curve2d> & C2D2, const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_Surface> & S2, const Standard_Real Tol);

		/****** Approx_CurvlinFunc::EvalCase1 ******/
		/****** md5 signature: d6f977aec2ba6ef7261ad448995f2a1d ******/
		%feature("compactdefaultargs") EvalCase1;
		%feature("autodoc", "
Parameters
----------
S: float
Order: int
Result: TColStd_Array1OfReal

Return
-------
bool

Description
-----------
if myCase != 1.
") EvalCase1;
		Standard_Boolean EvalCase1(const Standard_Real S, const Standard_Integer Order, TColStd_Array1OfReal & Result);

		/****** Approx_CurvlinFunc::EvalCase2 ******/
		/****** md5 signature: af7190c5733447d4dcb3107db703f25d ******/
		%feature("compactdefaultargs") EvalCase2;
		%feature("autodoc", "
Parameters
----------
S: float
Order: int
Result: TColStd_Array1OfReal

Return
-------
bool

Description
-----------
if myCase != 2.
") EvalCase2;
		Standard_Boolean EvalCase2(const Standard_Real S, const Standard_Integer Order, TColStd_Array1OfReal & Result);

		/****** Approx_CurvlinFunc::EvalCase3 ******/
		/****** md5 signature: 6ecbd89f3323d6c9fcd40c282e079d3c ******/
		%feature("compactdefaultargs") EvalCase3;
		%feature("autodoc", "
Parameters
----------
S: float
Order: int
Result: TColStd_Array1OfReal

Return
-------
bool

Description
-----------
if myCase != 3.
") EvalCase3;
		Standard_Boolean EvalCase3(const Standard_Real S, const Standard_Integer Order, TColStd_Array1OfReal & Result);

		/****** Approx_CurvlinFunc::FirstParameter ******/
		/****** md5 signature: 4ccedbaad83be904f510b4760c75f69c ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") FirstParameter;
		Standard_Real FirstParameter();

		/****** Approx_CurvlinFunc::GetLength ******/
		/****** md5 signature: 9390a920d888683f8b474026b2d95a49 ******/
		%feature("compactdefaultargs") GetLength;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") GetLength;
		Standard_Real GetLength();

		/****** Approx_CurvlinFunc::GetSParameter ******/
		/****** md5 signature: de8883031fb26c06bc41920f0af259b5 ******/
		%feature("compactdefaultargs") GetSParameter;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
float

Description
-----------
returns original parameter corresponding S.
") GetSParameter;
		Standard_Real GetSParameter(const Standard_Real U);

		/****** Approx_CurvlinFunc::GetUParameter ******/
		/****** md5 signature: a288323291b5a7c86e97e5e379347550 ******/
		%feature("compactdefaultargs") GetUParameter;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
S: float
NumberOfCurve: int

Return
-------
float

Description
-----------
returns original parameter corresponding S. if Case == 1 computation is performed on myC2D1 and mySurf1, otherwise it is done on myC2D2 and mySurf2.
") GetUParameter;
		Standard_Real GetUParameter(Adaptor3d_Curve & C, const Standard_Real S, const Standard_Integer NumberOfCurve);

		/****** Approx_CurvlinFunc::Intervals ******/
		/****** md5 signature: c7a2f17df7514293a67a56baae0afb68 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** Approx_CurvlinFunc::LastParameter ******/
		/****** md5 signature: 7cdf630921ee47ad365a5a6bafd4b46e ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") LastParameter;
		Standard_Real LastParameter();

		/****** Approx_CurvlinFunc::Length ******/
		/****** md5 signature: 389864b782ecf5fea5b568ea6b4ee166 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
None

Description
-----------
Computes length of the curve.
") Length;
		void Length();

		/****** Approx_CurvlinFunc::Length ******/
		/****** md5 signature: a36b32537f2aaeb51d308d784a8bcd1e ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
FirstU: float
LasrU: float

Return
-------
float

Description
-----------
Computes length of the curve segment.
") Length;
		Standard_Real Length(Adaptor3d_Curve & C, const Standard_Real FirstU, const Standard_Real LasrU);

		/****** Approx_CurvlinFunc::NbIntervals ******/
		/****** md5 signature: a9cec7e4e6cb5b355a27e6de1f3fc9d9 ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>.
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****** Approx_CurvlinFunc::SetTol ******/
		/****** md5 signature: 807eaaa5cf0c0afd4dc54d9743374704 ******/
		%feature("compactdefaultargs") SetTol;
		%feature("autodoc", "
Parameters
----------
Tol: float

Return
-------
None

Description
-----------
---Purpose Update the tolerance to used.
") SetTol;
		void SetTol(const Standard_Real Tol);

		/****** Approx_CurvlinFunc::Trim ******/
		/****** md5 signature: e4c090d64e46a6e2ad68afd1ac49d0f1 ******/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float
Tol: float

Return
-------
None

Description
-----------
if First < 0 or Last > 1.
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
		/****** Approx_FitAndDivide::Approx_FitAndDivide ******/
		/****** md5 signature: ea3ebc13b87efed4a03fe4693299cd01 ******/
		%feature("compactdefaultargs") Approx_FitAndDivide;
		%feature("autodoc", "
Parameters
----------
Line: AppCont_Function
degreemin: int (optional, default to 3)
degreemax: int (optional, default to 8)
Tolerance3d: float (optional, default to 1.0e-5)
Tolerance2d: float (optional, default to 1.0e-5)
cutting: bool (optional, default to Standard_False)
FirstC: AppParCurves_Constraint (optional, default to AppParCurves_TangencyPoint)
LastC: AppParCurves_Constraint (optional, default to AppParCurves_TangencyPoint)

Return
-------
None

Description
-----------
The MultiLine <Line> will be approximated until tolerances will be reached. The approximation will be done from degreemin to degreemax with a cutting if the corresponding boolean is True.
") Approx_FitAndDivide;
		 Approx_FitAndDivide(const AppCont_Function & Line, const Standard_Integer degreemin = 3, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-5, const Standard_Real Tolerance2d = 1.0e-5, const Standard_Boolean cutting = Standard_False, const AppParCurves_Constraint FirstC = AppParCurves_TangencyPoint, const AppParCurves_Constraint LastC = AppParCurves_TangencyPoint);

		/****** Approx_FitAndDivide::Approx_FitAndDivide ******/
		/****** md5 signature: c98a0117adc1bef392f7f6b0763498fd ******/
		%feature("compactdefaultargs") Approx_FitAndDivide;
		%feature("autodoc", "
Parameters
----------
degreemin: int (optional, default to 3)
degreemax: int (optional, default to 8)
Tolerance3d: float (optional, default to 1.0e-05)
Tolerance2d: float (optional, default to 1.0e-05)
cutting: bool (optional, default to Standard_False)
FirstC: AppParCurves_Constraint (optional, default to AppParCurves_TangencyPoint)
LastC: AppParCurves_Constraint (optional, default to AppParCurves_TangencyPoint)

Return
-------
None

Description
-----------
Initializes the fields of the algorithm.
") Approx_FitAndDivide;
		 Approx_FitAndDivide(const Standard_Integer degreemin = 3, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-05, const Standard_Real Tolerance2d = 1.0e-05, const Standard_Boolean cutting = Standard_False, const AppParCurves_Constraint FirstC = AppParCurves_TangencyPoint, const AppParCurves_Constraint LastC = AppParCurves_TangencyPoint);

		/****** Approx_FitAndDivide::Error ******/
		/****** md5 signature: 6a8061230005ba951097d8b73e7dbec6 ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
tol3d: float
tol2d: float

Description
-----------
returns the tolerances 2d and 3d of the <Index> MultiCurve.
") Error;
		void Error(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Approx_FitAndDivide::IsAllApproximated ******/
		/****** md5 signature: bf42a9f9ee3a867655d96a0c1fdcd853 ******/
		%feature("compactdefaultargs") IsAllApproximated;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns False if at a moment of the approximation, the status NoApproximation has been sent by the user when more points were needed.
") IsAllApproximated;
		Standard_Boolean IsAllApproximated();

		/****** Approx_FitAndDivide::IsToleranceReached ******/
		/****** md5 signature: cbd7380250e74c96655b10c8025eb873 ******/
		%feature("compactdefaultargs") IsToleranceReached;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns False if the status NoPointsAdded has been sent.
") IsToleranceReached;
		Standard_Boolean IsToleranceReached();

		/****** Approx_FitAndDivide::NbMultiCurves ******/
		/****** md5 signature: 944d4af40d93d46a8a3a888df2d8b388 ******/
		%feature("compactdefaultargs") NbMultiCurves;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of MultiCurve doing the approximation of the MultiLine.
") NbMultiCurves;
		Standard_Integer NbMultiCurves();

		/****** Approx_FitAndDivide::Parameters ******/
		/****** md5 signature: da3dbf6a597566992bf85427f2de867b ******/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
firstp: float
lastp: float

Description
-----------
No available documentation.
") Parameters;
		void Parameters(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Approx_FitAndDivide::Perform ******/
		/****** md5 signature: caf6a1aea817b16df8ee08ce9b993f4f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Line: AppCont_Function

Return
-------
None

Description
-----------
runs the algorithm after having initialized the fields.
") Perform;
		void Perform(const AppCont_Function & Line);

		/****** Approx_FitAndDivide::SetConstraints ******/
		/****** md5 signature: 99b92dc193142adf44568f800cd394dc ******/
		%feature("compactdefaultargs") SetConstraints;
		%feature("autodoc", "
Parameters
----------
FirstC: AppParCurves_Constraint
LastC: AppParCurves_Constraint

Return
-------
None

Description
-----------
Changes the constraints of the approximation.
") SetConstraints;
		void SetConstraints(const AppParCurves_Constraint FirstC, const AppParCurves_Constraint LastC);

		/****** Approx_FitAndDivide::SetDegrees ******/
		/****** md5 signature: 545fdd7d739fa58cc970e73d0413f8ef ******/
		%feature("compactdefaultargs") SetDegrees;
		%feature("autodoc", "
Parameters
----------
degreemin: int
degreemax: int

Return
-------
None

Description
-----------
changes the degrees of the approximation.
") SetDegrees;
		void SetDegrees(const Standard_Integer degreemin, const Standard_Integer degreemax);

		/****** Approx_FitAndDivide::SetHangChecking ******/
		/****** md5 signature: 082382da7c6c3da9061b500893941826 ******/
		%feature("compactdefaultargs") SetHangChecking;
		%feature("autodoc", "
Parameters
----------
theHangChecking: bool

Return
-------
None

Description
-----------
Set value of hang checking flag if this flag = true, possible hang of algorithm is checked and algorithm is forced to stop. By default hang checking is used.
") SetHangChecking;
		void SetHangChecking(const Standard_Boolean theHangChecking);

		/****** Approx_FitAndDivide::SetInvOrder ******/
		/****** md5 signature: 50bac5968816111fd573c6f1be407215 ******/
		%feature("compactdefaultargs") SetInvOrder;
		%feature("autodoc", "
Parameters
----------
theInvOrder: bool

Return
-------
None

Description
-----------
Set inverse order of degree selection: if theInvOrdr = true, current degree is chosen by inverse order - from maxdegree to mindegree. By default inverse order is used.
") SetInvOrder;
		void SetInvOrder(const Standard_Boolean theInvOrder);

		/****** Approx_FitAndDivide::SetMaxSegments ******/
		/****** md5 signature: 649dded305ab339e1c7f2a819b32eedd ******/
		%feature("compactdefaultargs") SetMaxSegments;
		%feature("autodoc", "
Parameters
----------
theMaxSegments: int

Return
-------
None

Description
-----------
Changes the max number of segments, which is allowed for cutting.
") SetMaxSegments;
		void SetMaxSegments(const Standard_Integer theMaxSegments);

		/****** Approx_FitAndDivide::SetTolerances ******/
		/****** md5 signature: ce7879738ace848f7a3a27c56467be10 ******/
		%feature("compactdefaultargs") SetTolerances;
		%feature("autodoc", "
Parameters
----------
Tolerance3d: float
Tolerance2d: float

Return
-------
None

Description
-----------
Changes the tolerances of the approximation.
") SetTolerances;
		void SetTolerances(const Standard_Real Tolerance3d, const Standard_Real Tolerance2d);

		/****** Approx_FitAndDivide::Value ******/
		/****** md5 signature: 89790f3ff3d6d18a45f409a34e79bd67 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Index: int (optional, default to 1)

Return
-------
AppParCurves_MultiCurve

Description
-----------
returns the approximation MultiCurve of range <Index>.
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
		/****** Approx_FitAndDivide2d::Approx_FitAndDivide2d ******/
		/****** md5 signature: 661477a957a15a70835b41b5c2bb9698 ******/
		%feature("compactdefaultargs") Approx_FitAndDivide2d;
		%feature("autodoc", "
Parameters
----------
Line: AppCont_Function
degreemin: int (optional, default to 3)
degreemax: int (optional, default to 8)
Tolerance3d: float (optional, default to 1.0e-5)
Tolerance2d: float (optional, default to 1.0e-5)
cutting: bool (optional, default to Standard_False)
FirstC: AppParCurves_Constraint (optional, default to AppParCurves_TangencyPoint)
LastC: AppParCurves_Constraint (optional, default to AppParCurves_TangencyPoint)

Return
-------
None

Description
-----------
The MultiLine <Line> will be approximated until tolerances will be reached. The approximation will be done from degreemin to degreemax with a cutting if the corresponding boolean is True.
") Approx_FitAndDivide2d;
		 Approx_FitAndDivide2d(const AppCont_Function & Line, const Standard_Integer degreemin = 3, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-5, const Standard_Real Tolerance2d = 1.0e-5, const Standard_Boolean cutting = Standard_False, const AppParCurves_Constraint FirstC = AppParCurves_TangencyPoint, const AppParCurves_Constraint LastC = AppParCurves_TangencyPoint);

		/****** Approx_FitAndDivide2d::Approx_FitAndDivide2d ******/
		/****** md5 signature: bca52594fb84bdf1c9b46ce4d487e8cb ******/
		%feature("compactdefaultargs") Approx_FitAndDivide2d;
		%feature("autodoc", "
Parameters
----------
degreemin: int (optional, default to 3)
degreemax: int (optional, default to 8)
Tolerance3d: float (optional, default to 1.0e-05)
Tolerance2d: float (optional, default to 1.0e-05)
cutting: bool (optional, default to Standard_False)
FirstC: AppParCurves_Constraint (optional, default to AppParCurves_TangencyPoint)
LastC: AppParCurves_Constraint (optional, default to AppParCurves_TangencyPoint)

Return
-------
None

Description
-----------
Initializes the fields of the algorithm.
") Approx_FitAndDivide2d;
		 Approx_FitAndDivide2d(const Standard_Integer degreemin = 3, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-05, const Standard_Real Tolerance2d = 1.0e-05, const Standard_Boolean cutting = Standard_False, const AppParCurves_Constraint FirstC = AppParCurves_TangencyPoint, const AppParCurves_Constraint LastC = AppParCurves_TangencyPoint);

		/****** Approx_FitAndDivide2d::Error ******/
		/****** md5 signature: 6a8061230005ba951097d8b73e7dbec6 ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
tol3d: float
tol2d: float

Description
-----------
returns the tolerances 2d and 3d of the <Index> MultiCurve.
") Error;
		void Error(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Approx_FitAndDivide2d::IsAllApproximated ******/
		/****** md5 signature: bf42a9f9ee3a867655d96a0c1fdcd853 ******/
		%feature("compactdefaultargs") IsAllApproximated;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns False if at a moment of the approximation, the status NoApproximation has been sent by the user when more points were needed.
") IsAllApproximated;
		Standard_Boolean IsAllApproximated();

		/****** Approx_FitAndDivide2d::IsToleranceReached ******/
		/****** md5 signature: cbd7380250e74c96655b10c8025eb873 ******/
		%feature("compactdefaultargs") IsToleranceReached;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns False if the status NoPointsAdded has been sent.
") IsToleranceReached;
		Standard_Boolean IsToleranceReached();

		/****** Approx_FitAndDivide2d::NbMultiCurves ******/
		/****** md5 signature: 944d4af40d93d46a8a3a888df2d8b388 ******/
		%feature("compactdefaultargs") NbMultiCurves;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of MultiCurve doing the approximation of the MultiLine.
") NbMultiCurves;
		Standard_Integer NbMultiCurves();

		/****** Approx_FitAndDivide2d::Parameters ******/
		/****** md5 signature: da3dbf6a597566992bf85427f2de867b ******/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
firstp: float
lastp: float

Description
-----------
No available documentation.
") Parameters;
		void Parameters(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Approx_FitAndDivide2d::Perform ******/
		/****** md5 signature: caf6a1aea817b16df8ee08ce9b993f4f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Line: AppCont_Function

Return
-------
None

Description
-----------
runs the algorithm after having initialized the fields.
") Perform;
		void Perform(const AppCont_Function & Line);

		/****** Approx_FitAndDivide2d::SetConstraints ******/
		/****** md5 signature: 99b92dc193142adf44568f800cd394dc ******/
		%feature("compactdefaultargs") SetConstraints;
		%feature("autodoc", "
Parameters
----------
FirstC: AppParCurves_Constraint
LastC: AppParCurves_Constraint

Return
-------
None

Description
-----------
Changes the constraints of the approximation.
") SetConstraints;
		void SetConstraints(const AppParCurves_Constraint FirstC, const AppParCurves_Constraint LastC);

		/****** Approx_FitAndDivide2d::SetDegrees ******/
		/****** md5 signature: 545fdd7d739fa58cc970e73d0413f8ef ******/
		%feature("compactdefaultargs") SetDegrees;
		%feature("autodoc", "
Parameters
----------
degreemin: int
degreemax: int

Return
-------
None

Description
-----------
changes the degrees of the approximation.
") SetDegrees;
		void SetDegrees(const Standard_Integer degreemin, const Standard_Integer degreemax);

		/****** Approx_FitAndDivide2d::SetHangChecking ******/
		/****** md5 signature: 082382da7c6c3da9061b500893941826 ******/
		%feature("compactdefaultargs") SetHangChecking;
		%feature("autodoc", "
Parameters
----------
theHangChecking: bool

Return
-------
None

Description
-----------
Set value of hang checking flag if this flag = true, possible hang of algorithm is checked and algorithm is forced to stop. By default hang checking is used.
") SetHangChecking;
		void SetHangChecking(const Standard_Boolean theHangChecking);

		/****** Approx_FitAndDivide2d::SetInvOrder ******/
		/****** md5 signature: 50bac5968816111fd573c6f1be407215 ******/
		%feature("compactdefaultargs") SetInvOrder;
		%feature("autodoc", "
Parameters
----------
theInvOrder: bool

Return
-------
None

Description
-----------
Set inverse order of degree selection: if theInvOrdr = true, current degree is chosen by inverse order - from maxdegree to mindegree. By default inverse order is used.
") SetInvOrder;
		void SetInvOrder(const Standard_Boolean theInvOrder);

		/****** Approx_FitAndDivide2d::SetMaxSegments ******/
		/****** md5 signature: 649dded305ab339e1c7f2a819b32eedd ******/
		%feature("compactdefaultargs") SetMaxSegments;
		%feature("autodoc", "
Parameters
----------
theMaxSegments: int

Return
-------
None

Description
-----------
Changes the max number of segments, which is allowed for cutting.
") SetMaxSegments;
		void SetMaxSegments(const Standard_Integer theMaxSegments);

		/****** Approx_FitAndDivide2d::SetTolerances ******/
		/****** md5 signature: ce7879738ace848f7a3a27c56467be10 ******/
		%feature("compactdefaultargs") SetTolerances;
		%feature("autodoc", "
Parameters
----------
Tolerance3d: float
Tolerance2d: float

Return
-------
None

Description
-----------
Changes the tolerances of the approximation.
") SetTolerances;
		void SetTolerances(const Standard_Real Tolerance3d, const Standard_Real Tolerance2d);

		/****** Approx_FitAndDivide2d::Value ******/
		/****** md5 signature: 89790f3ff3d6d18a45f409a34e79bd67 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Index: int (optional, default to 1)

Return
-------
AppParCurves_MultiCurve

Description
-----------
returns the approximation MultiCurve of range <Index>.
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
		/****** Approx_MCurvesToBSpCurve::Approx_MCurvesToBSpCurve ******/
		/****** md5 signature: f2ce6c1a8e6e0de7a78187ebdf09738b ******/
		%feature("compactdefaultargs") Approx_MCurvesToBSpCurve;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Approx_MCurvesToBSpCurve;
		 Approx_MCurvesToBSpCurve();

		/****** Approx_MCurvesToBSpCurve::Append ******/
		/****** md5 signature: ffc631c7b8994b3171041a1a53a9ce0c ******/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
MC: AppParCurves_MultiCurve

Return
-------
None

Description
-----------
No available documentation.
") Append;
		void Append(const AppParCurves_MultiCurve & MC);

		/****** Approx_MCurvesToBSpCurve::ChangeValue ******/
		/****** md5 signature: 2275e53c2101f0a946b62e87720ec0a1 ******/
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "Return
-------
AppParCurves_MultiBSpCurve

Description
-----------
return the composite MultiCurves as a MultiBSpCurve.
") ChangeValue;
		AppParCurves_MultiBSpCurve ChangeValue();

		/****** Approx_MCurvesToBSpCurve::Perform ******/
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

		/****** Approx_MCurvesToBSpCurve::Perform ******/
		/****** md5 signature: ecc994138ac3982c8ac29315eac11580 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
TheSeq: AppParCurves_SequenceOfMultiCurve

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const AppParCurves_SequenceOfMultiCurve & TheSeq);

		/****** Approx_MCurvesToBSpCurve::Reset ******/
		/****** md5 signature: 7beb446fe26b948f797f8de87e46c23d ******/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Reset;
		void Reset();

		/****** Approx_MCurvesToBSpCurve::Value ******/
		/****** md5 signature: c818c96a9a832640b6267a997c4dbd3b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
AppParCurves_MultiBSpCurve

Description
-----------
return the composite MultiCurves as a MultiBSpCurve.
") Value;
		AppParCurves_MultiBSpCurve Value();

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
		class Approx_SameParameter_Data {};
		/****** Approx_SameParameter::Approx_SameParameter ******/
		/****** md5 signature: 2930666ec596179e1ab77039278ff0c2 ******/
		%feature("compactdefaultargs") Approx_SameParameter;
		%feature("autodoc", "
Parameters
----------
C3D: Geom_Curve
C2D: Geom2d_Curve
S: Geom_Surface
Tol: float

Return
-------
None

Description
-----------
Warning: the C3D and C2D must have the same parametric domain.
") Approx_SameParameter;
		 Approx_SameParameter(const opencascade::handle<Geom_Curve> & C3D, const opencascade::handle<Geom2d_Curve> & C2D, const opencascade::handle<Geom_Surface> & S, const Standard_Real Tol);

		/****** Approx_SameParameter::Approx_SameParameter ******/
		/****** md5 signature: c5ca4b0fa91714a7d8dbbb7f74166b6e ******/
		%feature("compactdefaultargs") Approx_SameParameter;
		%feature("autodoc", "
Parameters
----------
C3D: Adaptor3d_Curve
C2D: Geom2d_Curve
S: Adaptor3d_Surface
Tol: float

Return
-------
None

Description
-----------
Warning: the C3D and C2D must have the same parametric domain.
") Approx_SameParameter;
		 Approx_SameParameter(const opencascade::handle<Adaptor3d_Curve> & C3D, const opencascade::handle<Geom2d_Curve> & C2D, const opencascade::handle<Adaptor3d_Surface> & S, const Standard_Real Tol);

		/****** Approx_SameParameter::Approx_SameParameter ******/
		/****** md5 signature: fd528457c519a0cdcaefab6e6d47b26f ******/
		%feature("compactdefaultargs") Approx_SameParameter;
		%feature("autodoc", "
Parameters
----------
C3D: Adaptor3d_Curve
C2D: Adaptor2d_Curve2d
S: Adaptor3d_Surface
Tol: float

Return
-------
None

Description
-----------
Warning: the C3D and C2D must have the same parametric domain.
") Approx_SameParameter;
		 Approx_SameParameter(const opencascade::handle<Adaptor3d_Curve> & C3D, const opencascade::handle<Adaptor2d_Curve2d> & C2D, const opencascade::handle<Adaptor3d_Surface> & S, const Standard_Real Tol);

		/****** Approx_SameParameter::Curve2d ******/
		/****** md5 signature: 5fab5e35541cfe36f16f0294e27855ba ******/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
Returns the 2D curve that has the same parameter as the 3D curve once evaluated on the surface up to the specified tolerance.
") Curve2d;
		opencascade::handle<Geom2d_Curve> Curve2d();

		/****** Approx_SameParameter::Curve3d ******/
		/****** md5 signature: bf4d235dc27cc25572185a2b068878b7 ******/
		%feature("compactdefaultargs") Curve3d;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
Returns the 3D curve that has the same parameter as the 3D curve once evaluated on the surface up to the specified tolerance.
") Curve3d;
		opencascade::handle<Adaptor3d_Curve> Curve3d();

		/****** Approx_SameParameter::CurveOnSurface ******/
		/****** md5 signature: 4576c068b1d09f135c33c1fb035c3e4f ******/
		%feature("compactdefaultargs") CurveOnSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_CurveOnSurface>

Description
-----------
Returns the 3D curve on surface that has the same parameter as the 3D curve up to the specified tolerance.
") CurveOnSurface;
		opencascade::handle<Adaptor3d_CurveOnSurface> CurveOnSurface();

		/****** Approx_SameParameter::IsDone ******/
		/****** md5 signature: e385477ab1bec806154173d4a550fd68 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
//!@Returns .false. if calculations failed, .true. if calculations succeed.
") IsDone;
		Standard_Boolean IsDone();

		/****** Approx_SameParameter::IsSameParameter ******/
		/****** md5 signature: cc3eb7385472632cf8547c37090fb098 ******/
		%feature("compactdefaultargs") IsSameParameter;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells whether the original data had already the same parameter up to the tolerance: in that case nothing is done.
") IsSameParameter;
		Standard_Boolean IsSameParameter();

		/****** Approx_SameParameter::TolReached ******/
		/****** md5 signature: 1f37a98b0772d31c830ed1321616b6c5 ******/
		%feature("compactdefaultargs") TolReached;
		%feature("autodoc", "Return
-------
float

Description
-----------
//!@Returns tolerance (maximal distance) between 3d curve and curve on surface, generated by 2d curve and surface.
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
		/****** Approx_SweepApproximation::Approx_SweepApproximation ******/
		/****** md5 signature: 1e58ff1dd49473e8ec1efa55877921aa ******/
		%feature("compactdefaultargs") Approx_SweepApproximation;
		%feature("autodoc", "
Parameters
----------
Func: Approx_SweepFunction

Return
-------
None

Description
-----------
No available documentation.
") Approx_SweepApproximation;
		 Approx_SweepApproximation(const opencascade::handle<Approx_SweepFunction> & Func);

		/****** Approx_SweepApproximation::Average2dError ******/
		/****** md5 signature: 8ed28c3aca266ff5de26936a7d153ffb ******/
		%feature("compactdefaultargs") Average2dError;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
returns the average error of the <Index> 2d curve approximation.
") Average2dError;
		Standard_Real Average2dError(const Standard_Integer Index);

		/****** Approx_SweepApproximation::AverageErrorOnSurf ******/
		/****** md5 signature: bac8be79201b06f130f6dd21a4817d03 ******/
		%feature("compactdefaultargs") AverageErrorOnSurf;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the average error in the surface approximation.
") AverageErrorOnSurf;
		Standard_Real AverageErrorOnSurf();

		/****** Approx_SweepApproximation::Curve2d ******/
		/****** md5 signature: 45f5fb41b7daba7a20d1fb56ead05f0f ******/
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
		void Curve2d(const Standard_Integer Index, TColgp_Array1OfPnt2d & TPoles, TColStd_Array1OfReal & TKnots, TColStd_Array1OfInteger & TMults);

		/****** Approx_SweepApproximation::Curve2dPoles ******/
		/****** md5 signature: 8df321abd16a4651f96229eab1c5f048 ******/
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
		const TColgp_Array1OfPnt2d & Curve2dPoles(const Standard_Integer Index);

		/****** Approx_SweepApproximation::Curves2dDegree ******/
		/****** md5 signature: 85ba31033da623d05ad75c9b051842b3 ******/
		%feature("compactdefaultargs") Curves2dDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Curves2dDegree;
		Standard_Integer Curves2dDegree();

		/****** Approx_SweepApproximation::Curves2dKnots ******/
		/****** md5 signature: cd12725d88c425f3fe1ebccf9467256f ******/
		%feature("compactdefaultargs") Curves2dKnots;
		%feature("autodoc", "Return
-------
TColStd_Array1OfReal

Description
-----------
No available documentation.
") Curves2dKnots;
		const TColStd_Array1OfReal & Curves2dKnots();

		/****** Approx_SweepApproximation::Curves2dMults ******/
		/****** md5 signature: d4f1ca5a39a589bb289460010c5bbf39 ******/
		%feature("compactdefaultargs") Curves2dMults;
		%feature("autodoc", "Return
-------
TColStd_Array1OfInteger

Description
-----------
No available documentation.
") Curves2dMults;
		const TColStd_Array1OfInteger & Curves2dMults();

		/****** Approx_SweepApproximation::Curves2dShape ******/
		/****** md5 signature: 28bf2faa4b8e811f12223cb99d1721ea ******/
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
		void Curves2dShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** Approx_SweepApproximation::Dump ******/
		/****** md5 signature: d37b43e0b2386dc096d5d707876db157 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
o: Standard_OStream

Description
-----------
display information on approximation.
") Dump;
		void Dump(std::ostream &OutValue);

		/****** Approx_SweepApproximation::Eval ******/
		/****** md5 signature: 71e7f11e45548ac47de3b270019a0b2d ******/
		%feature("compactdefaultargs") Eval;
		%feature("autodoc", "
Parameters
----------
Parameter: float
DerivativeRequest: int
First: float
Last: float

Return
-------
Result: float

Description
-----------
The EvaluatorFunction from AdvApprox;.
") Eval;
		Standard_Integer Eval(const Standard_Real Parameter, const Standard_Integer DerivativeRequest, const Standard_Real First, const Standard_Real Last, Standard_Real &OutValue);

		/****** Approx_SweepApproximation::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns if we have an result.
") IsDone;
		Standard_Boolean IsDone();

		/****** Approx_SweepApproximation::Max2dError ******/
		/****** md5 signature: bb3f56b4b55e0d91b8620b3ad4fad758 ******/
		%feature("compactdefaultargs") Max2dError;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
returns the maximum error of the <Index> 2d curve approximation.
") Max2dError;
		Standard_Real Max2dError(const Standard_Integer Index);

		/****** Approx_SweepApproximation::MaxErrorOnSurf ******/
		/****** md5 signature: e42290da593c42adaac24f68c51ecbda ******/
		%feature("compactdefaultargs") MaxErrorOnSurf;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the maximum error in the surface approximation.
") MaxErrorOnSurf;
		Standard_Real MaxErrorOnSurf();

		/****** Approx_SweepApproximation::NbCurves2d ******/
		/****** md5 signature: 91ae967daa54efe7d38afad4a5698e5b ******/
		%feature("compactdefaultargs") NbCurves2d;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbCurves2d;
		Standard_Integer NbCurves2d();

		/****** Approx_SweepApproximation::Perform ******/
		/****** md5 signature: 306f26941735cb759216a105543fe10a ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float
Tol3d: float
BoundTol: float
Tol2d: float
TolAngular: float
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C0)
Degmax: int (optional, default to 11)
Segmax: int (optional, default to 50)

Return
-------
None

Description
-----------
Perform the Approximation [First, Last]: Approx_SweepApproximation.cdl Tol3d: Tolerance to surface approximation Tol2d: Tolerance used to perform curve approximation Normally the 2d curve are approximated with a tolerance given by the resolution on support surfaces, but if this tolerance is too large Tol2d is used. TolAngular: Tolerance (in radian) to control the angle between tangents on the section law and tangent of iso-v on approximated surface Continuity: The continuity in v waiting on the surface Degmax: The maximum degree in v required on the surface Segmax: The maximum number of span in v required on the surface Warning: The continuity ci can be obtained only if Ft is Ci.
") Perform;
		void Perform(const Standard_Real First, const Standard_Real Last, const Standard_Real Tol3d, const Standard_Real BoundTol, const Standard_Real Tol2d, const Standard_Real TolAngular, const GeomAbs_Shape Continuity = GeomAbs_C0, const Standard_Integer Degmax = 11, const Standard_Integer Segmax = 50);

		/****** Approx_SweepApproximation::SurfPoles ******/
		/****** md5 signature: 33be5d08621b237fcd73b5b9accd2338 ******/
		%feature("compactdefaultargs") SurfPoles;
		%feature("autodoc", "Return
-------
TColgp_Array2OfPnt

Description
-----------
No available documentation.
") SurfPoles;
		const TColgp_Array2OfPnt & SurfPoles();

		/****** Approx_SweepApproximation::SurfShape ******/
		/****** md5 signature: 6dbc9c018a92aabb9f9d1988ac20cb43 ******/
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
		void SurfShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** Approx_SweepApproximation::SurfUKnots ******/
		/****** md5 signature: 30cf4dd9deaf04a1c77052e14ae7392b ******/
		%feature("compactdefaultargs") SurfUKnots;
		%feature("autodoc", "Return
-------
TColStd_Array1OfReal

Description
-----------
No available documentation.
") SurfUKnots;
		const TColStd_Array1OfReal & SurfUKnots();

		/****** Approx_SweepApproximation::SurfUMults ******/
		/****** md5 signature: ef046447df8e4b2931da90e1475e731f ******/
		%feature("compactdefaultargs") SurfUMults;
		%feature("autodoc", "Return
-------
TColStd_Array1OfInteger

Description
-----------
No available documentation.
") SurfUMults;
		const TColStd_Array1OfInteger & SurfUMults();

		/****** Approx_SweepApproximation::SurfVKnots ******/
		/****** md5 signature: 52c9dafc43c5e3713c77d7aa4381da5c ******/
		%feature("compactdefaultargs") SurfVKnots;
		%feature("autodoc", "Return
-------
TColStd_Array1OfReal

Description
-----------
No available documentation.
") SurfVKnots;
		const TColStd_Array1OfReal & SurfVKnots();

		/****** Approx_SweepApproximation::SurfVMults ******/
		/****** md5 signature: 589e6536c77c512e7a37f99faf0fa21c ******/
		%feature("compactdefaultargs") SurfVMults;
		%feature("autodoc", "Return
-------
TColStd_Array1OfInteger

Description
-----------
No available documentation.
") SurfVMults;
		const TColStd_Array1OfInteger & SurfVMults();

		/****** Approx_SweepApproximation::SurfWeights ******/
		/****** md5 signature: 894d2a3f2c33f7d641aef9c7f9e3fa57 ******/
		%feature("compactdefaultargs") SurfWeights;
		%feature("autodoc", "Return
-------
TColStd_Array2OfReal

Description
-----------
No available documentation.
") SurfWeights;
		const TColStd_Array2OfReal & SurfWeights();

		/****** Approx_SweepApproximation::Surface ******/
		/****** md5 signature: 49bb9dd6da49966f0010e14dd0ffef04 ******/
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
		void Surface(TColgp_Array2OfPnt & TPoles, TColStd_Array2OfReal & TWeights, TColStd_Array1OfReal & TUKnots, TColStd_Array1OfReal & TVKnots, TColStd_Array1OfInteger & TUMults, TColStd_Array1OfInteger & TVMults);

		/****** Approx_SweepApproximation::TolCurveOnSurf ******/
		/****** md5 signature: f21f0f877b35cf67581fa59260f72857 ******/
		%feature("compactdefaultargs") TolCurveOnSurf;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
returns the maximum 3d error of the <Index> 2d curve approximation on the Surface.
") TolCurveOnSurf;
		Standard_Real TolCurveOnSurf(const Standard_Integer Index);

		/****** Approx_SweepApproximation::UDegree ******/
		/****** md5 signature: f204e5fbf1c49e3d9e4889dfead5a190 ******/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") UDegree;
		Standard_Integer UDegree();

		/****** Approx_SweepApproximation::VDegree ******/
		/****** md5 signature: 4901bdb3b29a5c2410ca93d6a7816f06 ******/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
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
		/****** Approx_SweepFunction::BarycentreOfSurf ******/
		/****** md5 signature: cbc6eaf5619edbfc0f2839466f8de856 ******/
		%feature("compactdefaultargs") BarycentreOfSurf;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Get the barycentre of Surface. An very poor estimation is sufficient. This information is useful to perform well conditioned rational approximation. Warning: Used only if <self> IsRational.
") BarycentreOfSurf;
		virtual gp_Pnt BarycentreOfSurf();

		/****** Approx_SweepFunction::D0 ******/
		/****** md5 signature: 59d4398da857a954d97c3c261c2f0d6a ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: float
First: float
Last: float
Poles: TColgp_Array1OfPnt
Poles2d: TColgp_Array1OfPnt2d
Weigths: TColStd_Array1OfReal

Return
-------
bool

Description
-----------
compute the section for v = param.
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, const Standard_Real First, const Standard_Real Last, TColgp_Array1OfPnt & Poles, TColgp_Array1OfPnt2d & Poles2d, TColStd_Array1OfReal & Weigths);

		/****** Approx_SweepFunction::D1 ******/
		/****** md5 signature: 509d473b60471c40fb84a525daccf7b2 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
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

Return
-------
bool

Description
-----------
compute the first derivative in v direction of the section for v = param Warning: It used only for C1 or C2 approximation.
") D1;
		virtual Standard_Boolean D1(const Standard_Real Param, const Standard_Real First, const Standard_Real Last, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****** Approx_SweepFunction::D2 ******/
		/****** md5 signature: 9688db55fcb73e40afa5da6bce93a93e ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
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

Return
-------
bool

Description
-----------
compute the second derivative in v direction of the section for v = param Warning: It used only for C2 approximation.
") D2;
		virtual Standard_Boolean D2(const Standard_Real Param, const Standard_Real First, const Standard_Real Last, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****** Approx_SweepFunction::GetMinimalWeight ******/
		/****** md5 signature: 6fdd12d5da1669c5217b9449c91c0d9e ******/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "
Parameters
----------
Weigths: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Compute the minimal value of weight for each poles in all sections. This information is useful to control error in rational approximation. Warning: Used only if <self> IsRational.
") GetMinimalWeight;
		virtual void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****** Approx_SweepFunction::GetTolerance ******/
		/****** md5 signature: 1096196f89d9fc10f33e62e0d43284fe ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
BoundTol: float
SurfTol: float
AngleTol: float
Tol3d: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Returns the tolerance to reach in approximation to satisfy. BoundTol error at the Boundary AngleTol tangent error at the Boundary (in radian) SurfTol error inside the surface.
") GetTolerance;
		virtual void GetTolerance(const Standard_Real BoundTol, const Standard_Real SurfTol, const Standard_Real AngleTol, TColStd_Array1OfReal & Tol3d);

		/****** Approx_SweepFunction::Intervals ******/
		/****** md5 signature: 7d2bf038a9213acf1609cc1244a3ee03 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** Approx_SweepFunction::IsRational ******/
		/****** md5 signature: e2d546fe827c13e22032dacc2ce90819 ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the sections are rational or not.
") IsRational;
		virtual Standard_Boolean IsRational();

		/****** Approx_SweepFunction::Knots ******/
		/****** md5 signature: 7e71a376fdfa4fc27638b1b7f6f203bb ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "
Parameters
----------
TKnots: TColStd_Array1OfReal

Return
-------
None

Description
-----------
get the Knots of the section.
") Knots;
		virtual void Knots(TColStd_Array1OfReal & TKnots);

		/****** Approx_SweepFunction::MaximalSection ******/
		/****** md5 signature: d9acdf10cc3735a15f259a425c017f62 ******/
		%feature("compactdefaultargs") MaximalSection;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the length of the greater section. Thisinformation is useful to G1's control. Warning: With an little value, approximation can be slower.
") MaximalSection;
		virtual Standard_Real MaximalSection();

		/****** Approx_SweepFunction::Mults ******/
		/****** md5 signature: d5fb3b1381d15914585fd7e6e0eafecb ******/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "
Parameters
----------
TMults: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
get the Multplicities of the section.
") Mults;
		virtual void Mults(TColStd_Array1OfInteger & TMults);

		/****** Approx_SweepFunction::Nb2dCurves ******/
		/****** md5 signature: 1badd0e2d38d18f16705a0a708ba7c67 ******/
		%feature("compactdefaultargs") Nb2dCurves;
		%feature("autodoc", "Return
-------
int

Description
-----------
get the number of 2d curves to approximate.
") Nb2dCurves;
		virtual Standard_Integer Nb2dCurves();

		/****** Approx_SweepFunction::NbIntervals ******/
		/****** md5 signature: cb7f68d4b2c30f29cd5ba6f81443d314 ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>.
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****** Approx_SweepFunction::Resolution ******/
		/****** md5 signature: 70b0f0265ef5802a650e7ab2f0220a7e ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
Index: int
Tol: float

Return
-------
TolU: float
TolV: float

Description
-----------
Returns the resolutions in the sub-space 2d <Index> This information is usfull to find an good tolerance in 2d approximation.
") Resolution;
		virtual void Resolution(const Standard_Integer Index, const Standard_Real Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Approx_SweepFunction::SectionShape ******/
		/****** md5 signature: 2709d0545e048eec44ae3de66392188f ******/
		%feature("compactdefaultargs") SectionShape;
		%feature("autodoc", "
Parameters
----------

Return
-------
NbPoles: int
NbKnots: int
Degree: int

Description
-----------
get the format of an section.
") SectionShape;
		virtual void SectionShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** Approx_SweepFunction::SetInterval ******/
		/****** md5 signature: 0547f3a9c04c5f6c0363c26295b2e795 ******/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float

Return
-------
None

Description
-----------
Sets the bounds of the parametric interval on the fonction This determines the derivatives in these values if the function is not Cn.
") SetInterval;
		virtual void SetInterval(const Standard_Real First, const Standard_Real Last);

		/****** Approx_SweepFunction::SetTolerance ******/
		/****** md5 signature: 93e9274684dae026e60334d9dec71409 ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
Tol3d: float
Tol2d: float

Return
-------
None

Description
-----------
Is useful, if (me) have to run numerical algorithm to perform D0, D1 or D2.
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

class Approx_HArray1OfAdHSurface : public Approx_Array1OfAdHSurface, public Standard_Transient {
  public:
    Approx_HArray1OfAdHSurface(const Standard_Integer theLower, const Standard_Integer theUpper);
    Approx_HArray1OfAdHSurface(const Standard_Integer theLower, const Standard_Integer theUpper, const Approx_Array1OfAdHSurface::value_type& theValue);
    Approx_HArray1OfAdHSurface(const Approx_Array1OfAdHSurface& theOther);
    const Approx_Array1OfAdHSurface& Array1();
    Approx_Array1OfAdHSurface& ChangeArray1();
};
%make_alias(Approx_HArray1OfAdHSurface)


class Approx_HArray1OfGTrsf2d : public Approx_Array1OfGTrsf2d, public Standard_Transient {
  public:
    Approx_HArray1OfGTrsf2d(const Standard_Integer theLower, const Standard_Integer theUpper);
    Approx_HArray1OfGTrsf2d(const Standard_Integer theLower, const Standard_Integer theUpper, const Approx_Array1OfGTrsf2d::value_type& theValue);
    Approx_HArray1OfGTrsf2d(const Approx_Array1OfGTrsf2d& theOther);
    const Approx_Array1OfGTrsf2d& Array1();
    Approx_Array1OfGTrsf2d& ChangeArray1();
};
%make_alias(Approx_HArray1OfGTrsf2d)

/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
