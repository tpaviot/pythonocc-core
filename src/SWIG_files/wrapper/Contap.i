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
%define CONTAPDOCSTRING
"Contap module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_contap.html"
%enddef
%module (package="OCC.Core", docstring=CONTAPDOCSTRING) Contap


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
#include<Contap_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<math_module.hxx>
#include<gp_module.hxx>
#include<IntSurf_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Adaptor2d_module.hxx>
#include<GeomAbs_module.hxx>
#include<Geom2d_module.hxx>
#include<TColStd_module.hxx>
#include<TColgp_module.hxx>
#include<Geom_module.hxx>
#include<NCollection_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import math.i
%import gp.i
%import IntSurf.i
%import Adaptor3d.i
%import Adaptor2d.i
%import GeomAbs.i
%import Geom2d.i
%import TColStd.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum Contap_IType {
	Contap_Lin = 0,
	Contap_Circle = 1,
	Contap_Walking = 2,
	Contap_Restriction = 3,
};

enum Contap_TFunction {
	Contap_ContourStd = 0,
	Contap_ContourPrs = 1,
	Contap_DraftStd = 2,
	Contap_DraftPrs = 3,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class Contap_IType(IntEnum):
	Contap_Lin = 0
	Contap_Circle = 1
	Contap_Walking = 2
	Contap_Restriction = 3
Contap_Lin = Contap_IType.Contap_Lin
Contap_Circle = Contap_IType.Contap_Circle
Contap_Walking = Contap_IType.Contap_Walking
Contap_Restriction = Contap_IType.Contap_Restriction

class Contap_TFunction(IntEnum):
	Contap_ContourStd = 0
	Contap_ContourPrs = 1
	Contap_DraftStd = 2
	Contap_DraftPrs = 3
Contap_ContourStd = Contap_TFunction.Contap_ContourStd
Contap_ContourPrs = Contap_TFunction.Contap_ContourPrs
Contap_DraftStd = Contap_TFunction.Contap_DraftStd
Contap_DraftPrs = Contap_TFunction.Contap_DraftPrs
};
/* end python proxy for enums */

/* handles */
%wrap_handle(Contap_TheIWLineOfTheIWalking)
%wrap_handle(Contap_TheHSequenceOfPoint)
/* end handles declaration */

/* templates */
%template(Contap_SequenceOfIWLineOfTheIWalking) NCollection_Sequence<opencascade::handle<Contap_TheIWLineOfTheIWalking>>;

%extend NCollection_Sequence<opencascade::handle<Contap_TheIWLineOfTheIWalking>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(Contap_SequenceOfPathPointOfTheSearch) NCollection_Sequence<Contap_ThePathPointOfTheSearch>;

%extend NCollection_Sequence<Contap_ThePathPointOfTheSearch> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(Contap_SequenceOfSegmentOfTheSearch) NCollection_Sequence<Contap_TheSegmentOfTheSearch>;

%extend NCollection_Sequence<Contap_TheSegmentOfTheSearch> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(Contap_TheSequenceOfLine) NCollection_Sequence<Contap_Line>;

%extend NCollection_Sequence<Contap_Line> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(Contap_TheSequenceOfPoint) NCollection_Sequence<Contap_Point>;

%extend NCollection_Sequence<Contap_Point> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence<opencascade::handle<Contap_TheIWLineOfTheIWalking>> Contap_SequenceOfIWLineOfTheIWalking;
typedef NCollection_Sequence<Contap_ThePathPointOfTheSearch> Contap_SequenceOfPathPointOfTheSearch;
typedef NCollection_Sequence<Contap_TheSegmentOfTheSearch> Contap_SequenceOfSegmentOfTheSearch;
typedef NCollection_Sequence<Contap_Line> Contap_TheSequenceOfLine;
typedef NCollection_Sequence<Contap_Point> Contap_TheSequenceOfPoint;
/* end typedefs declaration */

/***************************
* class Contap_ArcFunction *
***************************/
class Contap_ArcFunction : public math_FunctionWithDerivative {
	public:
		/****************** Contap_ArcFunction ******************/
		/**** md5 signature: cece6392d8a41c80644c929adb23fb57 ****/
		%feature("compactdefaultargs") Contap_ArcFunction;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Contap_ArcFunction;
		 Contap_ArcFunction();

		/****************** Derivative ******************/
		/**** md5 signature: 99d758c6c475cdb086620552a67d08e7 ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: float

Returns
-------
D: float
") Derivative;
		Standard_Boolean Derivative(const Standard_Real X, Standard_Real &OutValue);

		/****************** GetStateNumber ******************/
		/**** md5 signature: 49c44bd66dd4ec2381671c72ebd88158 ****/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****************** LastComputedPoint ******************/
		/**** md5 signature: 151ab65e948ef31dff9bbbd66f058a30 ****/
		%feature("compactdefaultargs") LastComputedPoint;
		%feature("autodoc", "Returns the point, which has been computed while the last calling value() method.

Returns
-------
gp_Pnt
") LastComputedPoint;
		const gp_Pnt LastComputedPoint();

		/****************** NbSamples ******************/
		/**** md5 signature: 1e61299a12ab2ebed2590e1021ec4bae ****/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbSamples;
		Standard_Integer NbSamples();

		/****************** Quadric ******************/
		/**** md5 signature: 412540fe449bd77bf89b8085f1fe1701 ****/
		%feature("compactdefaultargs") Quadric;
		%feature("autodoc", "No available documentation.

Returns
-------
IntSurf_Quadric
") Quadric;
		const IntSurf_Quadric & Quadric();

		/****************** Set ******************/
		/**** md5 signature: c9230f42bb12d45a693a7ae3204732ab ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_HSurface

Returns
-------
None
") Set;
		void Set(const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** Set ******************/
		/**** md5 signature: 7b60fb3b1252eb4013a37f792be86766 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Direction: gp_Dir

Returns
-------
None
") Set;
		void Set(const gp_Dir & Direction);

		/****************** Set ******************/
		/**** md5 signature: 9cf83fdf904bc30ff499b59d9a3cd4a0 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Direction: gp_Dir
Angle: float

Returns
-------
None
") Set;
		void Set(const gp_Dir & Direction, const Standard_Real Angle);

		/****************** Set ******************/
		/**** md5 signature: 82e61fcbcd023e361c983ac9b10b051a ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Eye: gp_Pnt

Returns
-------
None
") Set;
		void Set(const gp_Pnt & Eye);

		/****************** Set ******************/
		/**** md5 signature: df4b9353625a35b43eacf0999ffe2b0e ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Eye: gp_Pnt
Angle: float

Returns
-------
None
") Set;
		void Set(const gp_Pnt & Eye, const Standard_Real Angle);

		/****************** Set ******************/
		/**** md5 signature: 39b28571bbfbb9613c66992d83b4c72e ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: Adaptor2d_HCurve2d

Returns
-------
None
") Set;
		void Set(const opencascade::handle<Adaptor2d_HCurve2d> & A);

		/****************** Surface ******************/
		/**** md5 signature: 81999f08eca68bee259ba395fdac1a30 ****/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Returns mysurf field.

Returns
-------
opencascade::handle<Adaptor3d_HSurface>
") Surface;
		const opencascade::handle<Adaptor3d_HSurface> & Surface();

		/****************** Valpoint ******************/
		/**** md5 signature: 3a2ceb97db1e39a13d0a9061e49cb920 ****/
		%feature("compactdefaultargs") Valpoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
gp_Pnt
") Valpoint;
		const gp_Pnt Valpoint(const Standard_Integer Index);

		/****************** Value ******************/
		/**** md5 signature: af675141386b20e819be1017ca5afac2 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: float

Returns
-------
F: float
") Value;
		Standard_Boolean Value(const Standard_Real X, Standard_Real &OutValue);

		/****************** Values ******************/
		/**** md5 signature: 3835d085291235e285cceabd6d1dd2b9 ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: float

Returns
-------
F: float
D: float
") Values;
		Standard_Boolean Values(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend Contap_ArcFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Contap_ContAna *
***********************/
class Contap_ContAna {
	public:
		/****************** Contap_ContAna ******************/
		/**** md5 signature: 34b8def8c8965bff09152db88478f3eb ****/
		%feature("compactdefaultargs") Contap_ContAna;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Contap_ContAna;
		 Contap_ContAna();

		/****************** Circle ******************/
		/**** md5 signature: cab8b08988d177bd7107adbbccc4ef89 ****/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Circ
") Circle;
		gp_Circ Circle();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Line ******************/
		/**** md5 signature: f891b9d0be5f66ff9a406dfed37e1991 ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
gp_Lin
") Line;
		gp_Lin Line(const Standard_Integer Index);

		/****************** NbContours ******************/
		/**** md5 signature: 9bc6c7042c1b062de00f5626f3ec367e ****/
		%feature("compactdefaultargs") NbContours;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbContours;
		Standard_Integer NbContours();

		/****************** Perform ******************/
		/**** md5 signature: b9f75b8393c6cd183c564d2cf1768f58 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: gp_Sphere
D: gp_Dir

Returns
-------
None
") Perform;
		void Perform(const gp_Sphere & S, const gp_Dir & D);

		/****************** Perform ******************/
		/**** md5 signature: 9e3a7f6299476f22fc94426b5f6eb15a ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: gp_Sphere
D: gp_Dir
Ang: float

Returns
-------
None
") Perform;
		void Perform(const gp_Sphere & S, const gp_Dir & D, const Standard_Real Ang);

		/****************** Perform ******************/
		/**** md5 signature: 83e5be324f2e2c73bbe8c50fd37f8fc0 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: gp_Sphere
Eye: gp_Pnt

Returns
-------
None
") Perform;
		void Perform(const gp_Sphere & S, const gp_Pnt & Eye);

		/****************** Perform ******************/
		/**** md5 signature: a11a7f0b0850419c1c57238048e54f31 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Cylinder
D: gp_Dir

Returns
-------
None
") Perform;
		void Perform(const gp_Cylinder & C, const gp_Dir & D);

		/****************** Perform ******************/
		/**** md5 signature: 6677b9abfa575ea86b1cb2c3d80cbb21 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Cylinder
D: gp_Dir
Ang: float

Returns
-------
None
") Perform;
		void Perform(const gp_Cylinder & C, const gp_Dir & D, const Standard_Real Ang);

		/****************** Perform ******************/
		/**** md5 signature: f7fbe617dc60d1ff7b48291ef8af9b77 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Cylinder
Eye: gp_Pnt

Returns
-------
None
") Perform;
		void Perform(const gp_Cylinder & C, const gp_Pnt & Eye);

		/****************** Perform ******************/
		/**** md5 signature: 7412caececa5d30e287fc66233cf2264 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Cone
D: gp_Dir

Returns
-------
None
") Perform;
		void Perform(const gp_Cone & C, const gp_Dir & D);

		/****************** Perform ******************/
		/**** md5 signature: b0bdcde5ac71912f96c9d22de0c98e9c ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Cone
D: gp_Dir
Ang: float

Returns
-------
None
") Perform;
		void Perform(const gp_Cone & C, const gp_Dir & D, const Standard_Real Ang);

		/****************** Perform ******************/
		/**** md5 signature: 879c7165991c9f0ff7be8883e8f0e98c ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Cone
Eye: gp_Pnt

Returns
-------
None
") Perform;
		void Perform(const gp_Cone & C, const gp_Pnt & Eye);

		/****************** TypeContour ******************/
		/**** md5 signature: d3534623a7f7cecab5a391d5a853d774 ****/
		%feature("compactdefaultargs") TypeContour;
		%feature("autodoc", "Returns geomabs_line or geomabs_circle, when isdone() returns true.

Returns
-------
GeomAbs_CurveType
") TypeContour;
		GeomAbs_CurveType TypeContour();

};


%extend Contap_ContAna {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Contap_Contour *
***********************/
class Contap_Contour {
	public:
		/****************** Contap_Contour ******************/
		/**** md5 signature: 32102b3b6d93dd029f6dde0e589735e0 ****/
		%feature("compactdefaultargs") Contap_Contour;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Contap_Contour;
		 Contap_Contour();

		/****************** Contap_Contour ******************/
		/**** md5 signature: bd91b0d3a8a64bcd82393bb6259770cf ****/
		%feature("compactdefaultargs") Contap_Contour;
		%feature("autodoc", "No available documentation.

Parameters
----------
Direction: gp_Vec

Returns
-------
None
") Contap_Contour;
		 Contap_Contour(const gp_Vec & Direction);

		/****************** Contap_Contour ******************/
		/**** md5 signature: f347113f128de03764c976388dd763fa ****/
		%feature("compactdefaultargs") Contap_Contour;
		%feature("autodoc", "No available documentation.

Parameters
----------
Direction: gp_Vec
Angle: float

Returns
-------
None
") Contap_Contour;
		 Contap_Contour(const gp_Vec & Direction, const Standard_Real Angle);

		/****************** Contap_Contour ******************/
		/**** md5 signature: a1d711354b1cae160e79b4e231bd07b4 ****/
		%feature("compactdefaultargs") Contap_Contour;
		%feature("autodoc", "No available documentation.

Parameters
----------
Eye: gp_Pnt

Returns
-------
None
") Contap_Contour;
		 Contap_Contour(const gp_Pnt & Eye);

		/****************** Contap_Contour ******************/
		/**** md5 signature: 462dfd2cb5699c402de523a07aaed249 ****/
		%feature("compactdefaultargs") Contap_Contour;
		%feature("autodoc", "Creates the contour in a given direction.

Parameters
----------
Surf: Adaptor3d_HSurface
Domain: Adaptor3d_TopolTool
Direction: gp_Vec

Returns
-------
None
") Contap_Contour;
		 Contap_Contour(const opencascade::handle<Adaptor3d_HSurface> & Surf, const opencascade::handle<Adaptor3d_TopolTool> & Domain, const gp_Vec & Direction);

		/****************** Contap_Contour ******************/
		/**** md5 signature: c092062c8a84e1b30fd2eedc67ea9acb ****/
		%feature("compactdefaultargs") Contap_Contour;
		%feature("autodoc", "Creates the contour in a given direction.

Parameters
----------
Surf: Adaptor3d_HSurface
Domain: Adaptor3d_TopolTool
Direction: gp_Vec
Angle: float

Returns
-------
None
") Contap_Contour;
		 Contap_Contour(const opencascade::handle<Adaptor3d_HSurface> & Surf, const opencascade::handle<Adaptor3d_TopolTool> & Domain, const gp_Vec & Direction, const Standard_Real Angle);

		/****************** Contap_Contour ******************/
		/**** md5 signature: 384cb66f2002a6109dad6e7f52c6a8d5 ****/
		%feature("compactdefaultargs") Contap_Contour;
		%feature("autodoc", "Creates the contour for a perspective view.

Parameters
----------
Surf: Adaptor3d_HSurface
Domain: Adaptor3d_TopolTool
Eye: gp_Pnt

Returns
-------
None
") Contap_Contour;
		 Contap_Contour(const opencascade::handle<Adaptor3d_HSurface> & Surf, const opencascade::handle<Adaptor3d_TopolTool> & Domain, const gp_Pnt & Eye);

		/****************** Init ******************/
		/**** md5 signature: deab7f18a5b73dea8633b272c74ec953 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
Direction: gp_Vec

Returns
-------
None
") Init;
		void Init(const gp_Vec & Direction);

		/****************** Init ******************/
		/**** md5 signature: 54e24371bc5b544519382c90e6ae1c36 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
Direction: gp_Vec
Angle: float

Returns
-------
None
") Init;
		void Init(const gp_Vec & Direction, const Standard_Real Angle);

		/****************** Init ******************/
		/**** md5 signature: 44a2c71985162287cc60ada71418f1d1 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
Eye: gp_Pnt

Returns
-------
None
") Init;
		void Init(const gp_Pnt & Eye);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsEmpty ******************/
		/**** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returns true if the is no line.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** Line ******************/
		/**** md5 signature: e1f84a12db582fc2be0b030fbc71189b ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
Contap_Line
") Line;
		const Contap_Line & Line(const Standard_Integer Index);

		/****************** NbLines ******************/
		/**** md5 signature: 4f8001fdc02f82f8f981f090a37ac7d4 ****/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbLines;
		Standard_Integer NbLines();

		/****************** Perform ******************/
		/**** md5 signature: e0e4baac189bbfbab85e24274fff310d ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Creates the contour in a given direction.

Parameters
----------
Surf: Adaptor3d_HSurface
Domain: Adaptor3d_TopolTool

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_HSurface> & Surf, const opencascade::handle<Adaptor3d_TopolTool> & Domain);

		/****************** Perform ******************/
		/**** md5 signature: e0993cf897070750a3cd8de9eb8442c0 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Creates the contour in a given direction.

Parameters
----------
Surf: Adaptor3d_HSurface
Domain: Adaptor3d_TopolTool
Direction: gp_Vec

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_HSurface> & Surf, const opencascade::handle<Adaptor3d_TopolTool> & Domain, const gp_Vec & Direction);

		/****************** Perform ******************/
		/**** md5 signature: 646d1e133cf129836e04dc7ef360f488 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Creates the contour in a given direction.

Parameters
----------
Surf: Adaptor3d_HSurface
Domain: Adaptor3d_TopolTool
Direction: gp_Vec
Angle: float

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_HSurface> & Surf, const opencascade::handle<Adaptor3d_TopolTool> & Domain, const gp_Vec & Direction, const Standard_Real Angle);

		/****************** Perform ******************/
		/**** md5 signature: 23c9b9e5ded059f020cbc263d2d1b835 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Creates the contour for a perspective view.

Parameters
----------
Surf: Adaptor3d_HSurface
Domain: Adaptor3d_TopolTool
Eye: gp_Pnt

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_HSurface> & Surf, const opencascade::handle<Adaptor3d_TopolTool> & Domain, const gp_Pnt & Eye);

		/****************** SurfaceFunction ******************/
		/**** md5 signature: 4a38b2f929c85d9d66c55cb5e593a36b ****/
		%feature("compactdefaultargs") SurfaceFunction;
		%feature("autodoc", "Returns a reference on the internal surfacefunction. this is used to compute tangents on the lines.

Returns
-------
Contap_SurfFunction
") SurfaceFunction;
		Contap_SurfFunction & SurfaceFunction();

};


%extend Contap_Contour {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Contap_HContTool *
*************************/
class Contap_HContTool {
	public:
		/****************** Bounds ******************/
		/**** md5 signature: 9d7011a3f7bf9140e97d4cca3a13d459 ****/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "Returns the parametric limits on the arc c. these limits must be finite : they are either the real limits of the arc, for a finite arc, or a bounding box for an infinite arc.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
Ufirst: float
Ulast: float
") Bounds;
		static void Bounds(const opencascade::handle<Adaptor2d_HCurve2d> & C, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** HasBeenSeen ******************/
		/**** md5 signature: c459516f806b782c6912d96e17f167c2 ****/
		%feature("compactdefaultargs") HasBeenSeen;
		%feature("autodoc", "Returns true if all the intersection point and edges are known on the arc. the intersection point are given as vertices. the intersection edges are given as intervals between two vertices.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
bool
") HasBeenSeen;
		static Standard_Boolean HasBeenSeen(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** HasFirstPoint ******************/
		/**** md5 signature: 21dbd03b2bfe6401a9ae58a73e3b9d1c ****/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "Returns true when the segment of range index is not open at the left side. in that case, indfirst is the range in the list intersection points (see nbpoints) of the one which defines the left bound of the segment. otherwise, the method has to return false, and indfirst has no meaning.

Parameters
----------
C: Adaptor2d_HCurve2d
Index: int

Returns
-------
IndFirst: int
") HasFirstPoint;
		static Standard_Boolean HasFirstPoint(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Integer Index, Standard_Integer &OutValue);

		/****************** HasLastPoint ******************/
		/**** md5 signature: a4dadcf8bd34f0f89f5ae609438fa233 ****/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "Returns true when the segment of range index is not open at the right side. in that case, indlast is the range in the list intersection points (see nbpoints) of the one which defines the right bound of the segment. otherwise, the method has to return false, and indlast has no meaning.

Parameters
----------
C: Adaptor2d_HCurve2d
Index: int

Returns
-------
IndLast: int
") HasLastPoint;
		static Standard_Boolean HasLastPoint(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Integer Index, Standard_Integer &OutValue);

		/****************** IsAllSolution ******************/
		/**** md5 signature: 0c6c1768ff2598386bae6ed220465e90 ****/
		%feature("compactdefaultargs") IsAllSolution;
		%feature("autodoc", "Returns true when the whole restriction is solution of the intersection problem.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
bool
") IsAllSolution;
		static Standard_Boolean IsAllSolution(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** IsVertex ******************/
		/**** md5 signature: be51c8dbf9d3585b6d3eab81b6b976ce ****/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "Returns true if the intersection point of range index corresponds with a vertex on the arc a.

Parameters
----------
C: Adaptor2d_HCurve2d
Index: int

Returns
-------
bool
") IsVertex;
		static Standard_Boolean IsVertex(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Integer Index);

		/****************** NbPoints ******************/
		/**** md5 signature: 17b706dc3883e4250f166019ea7dae25 ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of intersection points on the arc a.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
int
") NbPoints;
		static Standard_Integer NbPoints(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** NbSamplePoints ******************/
		/**** md5 signature: 1d44fd6ad4cd26d8b6fc1c0b944b7c47 ****/
		%feature("compactdefaultargs") NbSamplePoints;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_HSurface

Returns
-------
int
") NbSamplePoints;
		static Standard_Integer NbSamplePoints(const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** NbSamplesOnArc ******************/
		/**** md5 signature: 5d5251a65ac23da48e83da611222dcfc ****/
		%feature("compactdefaultargs") NbSamplesOnArc;
		%feature("autodoc", "Returns the number of points which is used to make a sample on the arc. this number is a function of the surface and the curveonsurface complexity.

Parameters
----------
A: Adaptor2d_HCurve2d

Returns
-------
int
") NbSamplesOnArc;
		static Standard_Integer NbSamplesOnArc(const opencascade::handle<Adaptor2d_HCurve2d> & A);

		/****************** NbSamplesU ******************/
		/**** md5 signature: 97232a7a843cb20e7362e1978825fb60 ****/
		%feature("compactdefaultargs") NbSamplesU;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_HSurface
u1: float
u2: float

Returns
-------
int
") NbSamplesU;
		static Standard_Integer NbSamplesU(const opencascade::handle<Adaptor3d_HSurface> & S, const Standard_Real u1, const Standard_Real u2);

		/****************** NbSamplesV ******************/
		/**** md5 signature: 3cd7a5ede88f3424fd1fcf0d55b10994 ****/
		%feature("compactdefaultargs") NbSamplesV;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_HSurface
v1: float
v2: float

Returns
-------
int
") NbSamplesV;
		static Standard_Integer NbSamplesV(const opencascade::handle<Adaptor3d_HSurface> & S, const Standard_Real v1, const Standard_Real v2);

		/****************** NbSegments ******************/
		/**** md5 signature: 0ae6c2f8194d2736e98ab44bdf7746bf ****/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Returns the number of part of a solution of the of intersection problem.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
int
") NbSegments;
		static Standard_Integer NbSegments(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Parameter ******************/
		/**** md5 signature: 4bd4573724cb995d25117b32c6301dbf ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns the parameter of the vertex v on the arc a.

Parameters
----------
V: Adaptor3d_HVertex
C: Adaptor2d_HCurve2d

Returns
-------
float
") Parameter;
		static Standard_Real Parameter(const opencascade::handle<Adaptor3d_HVertex> & V, const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Project ******************/
		/**** md5 signature: c906bf41c5c252a3dc2813aa763bf1d4 ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "Projects the point p on the arc c. if the methods returns standard_true, the projection is successful, and paramproj is the parameter on the arc of the projected point, ptproj is the projected point. if the method returns standard_false, param proj and ptproj are not significant.

Parameters
----------
C: Adaptor2d_HCurve2d
P: gp_Pnt2d
Ptproj: gp_Pnt2d

Returns
-------
Paramproj: float
") Project;
		static Standard_Boolean Project(const opencascade::handle<Adaptor2d_HCurve2d> & C, const gp_Pnt2d & P, Standard_Real &OutValue, gp_Pnt2d & Ptproj);

		/****************** SamplePoint ******************/
		/**** md5 signature: a955c19e2de48e3afe1a124d596ec476 ****/
		%feature("compactdefaultargs") SamplePoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_HSurface
Index: int

Returns
-------
U: float
V: float
") SamplePoint;
		static void SamplePoint(const opencascade::handle<Adaptor3d_HSurface> & S, const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Tolerance ******************/
		/**** md5 signature: 3a8783bb4f0487b28d64a7cbca026b23 ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Returns the parametric tolerance used to consider that the vertex and another point meet, i-e if abs(parameter(vertex) - parameter(otherpnt))<= tolerance, the points are 'merged'.

Parameters
----------
V: Adaptor3d_HVertex
C: Adaptor2d_HCurve2d

Returns
-------
float
") Tolerance;
		static Standard_Real Tolerance(const opencascade::handle<Adaptor3d_HVertex> & V, const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Value ******************/
		/**** md5 signature: 18b3b6d81fbdc955a12ee74b07f30c25 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the value (pt), the tolerance (tol), and the parameter (u) on the arc a , of the intersection point of range index.

Parameters
----------
C: Adaptor2d_HCurve2d
Index: int
Pt: gp_Pnt

Returns
-------
Tol: float
U: float
") Value;
		static void Value(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Integer Index, gp_Pnt & Pt, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Vertex ******************/
		/**** md5 signature: 6f27b126d27d77cd929cf0d82a6331b7 ****/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "When isvertex returns true, this method returns the vertex on the arc a.

Parameters
----------
C: Adaptor2d_HCurve2d
Index: int
V: Adaptor3d_HVertex

Returns
-------
None
") Vertex;
		static void Vertex(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Integer Index, opencascade::handle<Adaptor3d_HVertex> & V);

};


%extend Contap_HContTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Contap_HCurve2dTool *
****************************/
class Contap_HCurve2dTool {
	public:
		/****************** BSpline ******************/
		/**** md5 signature: 51c6af526482fdefe22b195f9e7f642b ****/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") BSpline;
		static opencascade::handle<Geom2d_BSplineCurve> BSpline(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Bezier ******************/
		/**** md5 signature: f3f25a1b425466642d5538101f636952 ****/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
opencascade::handle<Geom2d_BezierCurve>
") Bezier;
		static opencascade::handle<Geom2d_BezierCurve> Bezier(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Circle ******************/
		/**** md5 signature: 25cca94b6abda39a58f3572d7e1269e1 ****/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
gp_Circ2d
") Circle;
		static gp_Circ2d Circle(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Continuity ******************/
		/**** md5 signature: c3f4e05ac1409417c3a49b2ba86768c1 ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
GeomAbs_Shape
") Continuity;
		static GeomAbs_Shape Continuity(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** D0 ******************/
		/**** md5 signature: 46487cddba3993af60eac47b2d9fb4ec ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Computes the point of parameter u on the curve.

Parameters
----------
C: Adaptor2d_HCurve2d
U: float
P: gp_Pnt2d

Returns
-------
None
") D0;
		static void D0(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Real U, gp_Pnt2d & P);

		/****************** D1 ******************/
		/**** md5 signature: 47f0ee388b0110afd0acc19f4f31143b ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Computes the point of parameter u on the curve with its first derivative. raised if the continuity of the current interval is not c1.

Parameters
----------
C: Adaptor2d_HCurve2d
U: float
P: gp_Pnt2d
V: gp_Vec2d

Returns
-------
None
") D1;
		static void D1(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V);

		/****************** D2 ******************/
		/**** md5 signature: 67bd4dfba43285ed3ba3fa4db342511d ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the point p of parameter u, the first and second derivatives v1 and v2. raised if the continuity of the current interval is not c2.

Parameters
----------
C: Adaptor2d_HCurve2d
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Returns
-------
None
") D2;
		static void D2(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D3 ******************/
		/**** md5 signature: a12143246ff3c675c374e091b8bb4126 ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Returns the point p of parameter u, the first, the second and the third derivative. raised if the continuity of the current interval is not c3.

Parameters
----------
C: Adaptor2d_HCurve2d
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Returns
-------
None
") D3;
		static void D3(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** DN ******************/
		/**** md5 signature: b51d40fcc387fcff2c771e816a837a26 ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "The returned vector gives the value of the derivative for the order of derivation n. raised if the continuity of the current interval is not cn. raised if n < 1.

Parameters
----------
C: Adaptor2d_HCurve2d
U: float
N: int

Returns
-------
gp_Vec2d
") DN;
		static gp_Vec2d DN(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Real U, const Standard_Integer N);

		/****************** Ellipse ******************/
		/**** md5 signature: f3a29109984a1143a6cb5514fa451f90 ****/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
gp_Elips2d
") Ellipse;
		static gp_Elips2d Ellipse(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** FirstParameter ******************/
		/**** md5 signature: eaf98bddee98d43872dfec9b2cd68150 ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
float
") FirstParameter;
		static Standard_Real FirstParameter(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** GetType ******************/
		/**** md5 signature: ec77b3306d37c7299568c0a36686922d ****/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Returns the type of the curve in the current interval : line, circle, ellipse, hyperbola, parabola, beziercurve, bsplinecurve, othercurve.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
GeomAbs_CurveType
") GetType;
		static GeomAbs_CurveType GetType(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Hyperbola ******************/
		/**** md5 signature: 164051c7a5f0ff11dadb1050a2b5196c ****/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
gp_Hypr2d
") Hyperbola;
		static gp_Hypr2d Hyperbola(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Intervals ******************/
		/**** md5 signature: 3b05031b8de1688bfd3ab21d174798f0 ****/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
C: Adaptor2d_HCurve2d
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		static void Intervals(const opencascade::handle<Adaptor2d_HCurve2d> & C, TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsClosed ******************/
		/**** md5 signature: 0e22a421e5652f2d44cc8cf1dd94b7c3 ****/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
bool
") IsClosed;
		static Standard_Boolean IsClosed(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** IsPeriodic ******************/
		/**** md5 signature: 4aba8b2dd73d6a9faa95857fea2fa1c8 ****/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
bool
") IsPeriodic;
		static Standard_Boolean IsPeriodic(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** LastParameter ******************/
		/**** md5 signature: c7ee808a0daf7f6c32882e5c11459a8d ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
float
") LastParameter;
		static Standard_Real LastParameter(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Line ******************/
		/**** md5 signature: 5add7292d5bf7b9e27a7ab736f1e7435 ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
gp_Lin2d
") Line;
		static gp_Lin2d Line(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** NbIntervals ******************/
		/**** md5 signature: 042b8a87b181044ce642f6e33059fda9 ****/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(myclass) >= <s>.

Parameters
----------
C: Adaptor2d_HCurve2d
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		static Standard_Integer NbIntervals(const opencascade::handle<Adaptor2d_HCurve2d> & C, const GeomAbs_Shape S);

		/****************** NbSamples ******************/
		/**** md5 signature: 9c572bc378ed84a8420fac29109ee0cc ****/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d
U0: float
U1: float

Returns
-------
int
") NbSamples;
		static Standard_Integer NbSamples(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Real U0, const Standard_Real U1);

		/****************** Parabola ******************/
		/**** md5 signature: aa68878e794db72dae1959cec7bf2f61 ****/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
gp_Parab2d
") Parabola;
		static gp_Parab2d Parabola(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Period ******************/
		/**** md5 signature: 7aa66d879cd9e56bcd3f2e6f17863699 ****/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
float
") Period;
		static Standard_Real Period(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Resolution ******************/
		/**** md5 signature: 76c8a3dbf7f89f06f48d44960220ce20 ****/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Returns the parametric resolution corresponding to the real space resolution <r3d>.

Parameters
----------
C: Adaptor2d_HCurve2d
R3d: float

Returns
-------
float
") Resolution;
		static Standard_Real Resolution(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Real R3d);

		/****************** Value ******************/
		/**** md5 signature: ca7870ae23348f83eb576a5911436760 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the point of parameter u on the curve.

Parameters
----------
C: Adaptor2d_HCurve2d
U: float

Returns
-------
gp_Pnt2d
") Value;
		static gp_Pnt2d Value(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Real U);

};


%extend Contap_HCurve2dTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class Contap_Line *
********************/
class Contap_Line {
	public:
		/****************** Contap_Line ******************/
		/**** md5 signature: 31a4005b50852e1945ca19d1e047ab86 ****/
		%feature("compactdefaultargs") Contap_Line;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Contap_Line;
		 Contap_Line();

		/****************** Add ******************/
		/**** md5 signature: 01be3efa9c74c4d8432a102f97f9361d ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: IntSurf_PntOn2S

Returns
-------
None
") Add;
		void Add(const IntSurf_PntOn2S & P);

		/****************** Add ******************/
		/**** md5 signature: 056936562dcf77b940ba3130c47afdae ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: Contap_Point

Returns
-------
None
") Add;
		void Add(const Contap_Point & P);

		/****************** Arc ******************/
		/**** md5 signature: b2e2a2b000ebbda9cef9186aeead5385 ****/
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor2d_HCurve2d>
") Arc;
		const opencascade::handle<Adaptor2d_HCurve2d> & Arc();

		/****************** Circle ******************/
		/**** md5 signature: cab8b08988d177bd7107adbbccc4ef89 ****/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Circ
") Circle;
		gp_Circ Circle();

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Line ******************/
		/**** md5 signature: 63e1fa189ca3bcfdb401241217a93bfb ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Lin
") Line;
		gp_Lin Line();

		/****************** LineOn2S ******************/
		/**** md5 signature: 31b349cb17d652cab4ad0cf52e88a2aa ****/
		%feature("compactdefaultargs") LineOn2S;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<IntSurf_LineOn2S>
") LineOn2S;
		const opencascade::handle<IntSurf_LineOn2S> & LineOn2S();

		/****************** NbPnts ******************/
		/**** md5 signature: 11421df812eef5f47a644a70b75ab60a ****/
		%feature("compactdefaultargs") NbPnts;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPnts;
		Standard_Integer NbPnts();

		/****************** NbVertex ******************/
		/**** md5 signature: b2d226bac64a106c7941ef45ff4e07f1 ****/
		%feature("compactdefaultargs") NbVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVertex;
		Standard_Integer NbVertex();

		/****************** Point ******************/
		/**** md5 signature: f91b2c05b43dfb8aaadba8068bf4b32a ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
IntSurf_PntOn2S
") Point;
		const IntSurf_PntOn2S & Point(const Standard_Integer Index);

		/****************** ResetSeqOfVertex ******************/
		/**** md5 signature: a6c5afb6e069ea40eab99b45a50ab6bd ****/
		%feature("compactdefaultargs") ResetSeqOfVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ResetSeqOfVertex;
		void ResetSeqOfVertex();

		/****************** SetLineOn2S ******************/
		/**** md5 signature: 10da8691bc4dbff6817878acc12fd279 ****/
		%feature("compactdefaultargs") SetLineOn2S;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: IntSurf_LineOn2S

Returns
-------
None
") SetLineOn2S;
		void SetLineOn2S(const opencascade::handle<IntSurf_LineOn2S> & L);

		/****************** SetTransitionOnS ******************/
		/**** md5 signature: 3e11bbe314ad3435d0d0c939af6c7e0c ****/
		%feature("compactdefaultargs") SetTransitionOnS;
		%feature("autodoc", "Set the tansition of the line.

Parameters
----------
T: IntSurf_TypeTrans

Returns
-------
None
") SetTransitionOnS;
		void SetTransitionOnS(const IntSurf_TypeTrans T);

		/****************** SetValue ******************/
		/**** md5 signature: 1ae32c88ce581ccde7cd37fbe879a748 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Lin

Returns
-------
None
") SetValue;
		void SetValue(const gp_Lin & L);

		/****************** SetValue ******************/
		/**** md5 signature: df8c025f756bd837345d152a2edc2a47 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Circ

Returns
-------
None
") SetValue;
		void SetValue(const gp_Circ & C);

		/****************** SetValue ******************/
		/**** md5 signature: 54e9174a5a70b6567ab6ab5b478e8d12 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: Adaptor2d_HCurve2d

Returns
-------
None
") SetValue;
		void SetValue(const opencascade::handle<Adaptor2d_HCurve2d> & A);

		/****************** TransitionOnS ******************/
		/**** md5 signature: ac2f27afdd16ab93ea1f959cb2bf6e33 ****/
		%feature("compactdefaultargs") TransitionOnS;
		%feature("autodoc", "Returns in if at the 'left' of the line, the normale of the surface is oriented to the observator.

Returns
-------
IntSurf_TypeTrans
") TransitionOnS;
		IntSurf_TypeTrans TransitionOnS();

		/****************** TypeContour ******************/
		/**** md5 signature: ccb9b7428ffec80adf355a2d32ee6f36 ****/
		%feature("compactdefaultargs") TypeContour;
		%feature("autodoc", "Returns contap_lin for a line, contap_circle for a circle, and contap_walking for a walking line, contap_restriction for a part of boundarie.

Returns
-------
Contap_IType
") TypeContour;
		Contap_IType TypeContour();

		/****************** Vertex ******************/
		/**** md5 signature: a9752a4d0f1a95aac4c22e2cbc715081 ****/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
Contap_Point
") Vertex;
		Contap_Point & Vertex(const Standard_Integer Index);

};


%extend Contap_Line {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class Contap_Point *
*********************/
class Contap_Point {
	public:
		/****************** Contap_Point ******************/
		/**** md5 signature: 7f542237bdf60ef9ad56bb116a72608a ****/
		%feature("compactdefaultargs") Contap_Point;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Contap_Point;
		 Contap_Point();

		/****************** Contap_Point ******************/
		/**** md5 signature: e63a495e15d3f926ffe70feb26e98122 ****/
		%feature("compactdefaultargs") Contap_Point;
		%feature("autodoc", "Creates a point.

Parameters
----------
Pt: gp_Pnt
U: float
V: float

Returns
-------
None
") Contap_Point;
		 Contap_Point(const gp_Pnt & Pt, const Standard_Real U, const Standard_Real V);

		/****************** Arc ******************/
		/**** md5 signature: b2e2a2b000ebbda9cef9186aeead5385 ****/
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", "Returns the arc of restriction containing the vertex.

Returns
-------
opencascade::handle<Adaptor2d_HCurve2d>
") Arc;
		const opencascade::handle<Adaptor2d_HCurve2d> & Arc();

		/****************** IsInternal ******************/
		/**** md5 signature: d02f8c187f927a9ba16cc17de3466e18 ****/
		%feature("compactdefaultargs") IsInternal;
		%feature("autodoc", "Returns true if the point is an internal one, i.e if the tangent to the line on the point and the eye direction are parallel.

Returns
-------
bool
") IsInternal;
		Standard_Boolean IsInternal();

		/****************** IsMultiple ******************/
		/**** md5 signature: d5ff9ea3f75ee3e6e0efda5814b9e44e ****/
		%feature("compactdefaultargs") IsMultiple;
		%feature("autodoc", "Returns true if the point belongs to several lines.

Returns
-------
bool
") IsMultiple;
		Standard_Boolean IsMultiple();

		/****************** IsOnArc ******************/
		/**** md5 signature: f74dbf32a42236bf36dcd24dd76a342c ****/
		%feature("compactdefaultargs") IsOnArc;
		%feature("autodoc", "Returns true when the point is an intersection between the contour and a restriction.

Returns
-------
bool
") IsOnArc;
		Standard_Boolean IsOnArc();

		/****************** IsVertex ******************/
		/**** md5 signature: 7dbb6189450b7f2ae76146c6d5d6e875 ****/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "Returns true if the point is a vertex on the initial restriction facet of the surface.

Returns
-------
bool
") IsVertex;
		Standard_Boolean IsVertex();

		/****************** ParameterOnArc ******************/
		/**** md5 signature: 53d2051734836b1f3c7d9edd7c3c1884 ****/
		%feature("compactdefaultargs") ParameterOnArc;
		%feature("autodoc", "Returns the parameter of the point on the arc returned by the method arc().

Returns
-------
float
") ParameterOnArc;
		Standard_Real ParameterOnArc();

		/****************** ParameterOnLine ******************/
		/**** md5 signature: 737a2a57e32e63a1ba587dea488e9583 ****/
		%feature("compactdefaultargs") ParameterOnLine;
		%feature("autodoc", "This method returns the parameter of the point on the intersection line. if the points does not belong to an intersection line, the value returned does not have any sens.

Returns
-------
float
") ParameterOnLine;
		Standard_Real ParameterOnLine();

		/****************** Parameters ******************/
		/**** md5 signature: 27c7f851c77cf6105be13a7890f1f0e0 ****/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "Returns the parameters on the surface of the point.

Parameters
----------

Returns
-------
U1: float
V1: float
") Parameters;
		void Parameters(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** SetArc ******************/
		/**** md5 signature: ef419e28df8105759150b9a6c4afee00 ****/
		%feature("compactdefaultargs") SetArc;
		%feature("autodoc", "Sets the value of the arc and of the parameter on this arc of the point.

Parameters
----------
A: Adaptor2d_HCurve2d
Param: float
TLine: IntSurf_Transition
TArc: IntSurf_Transition

Returns
-------
None
") SetArc;
		void SetArc(const opencascade::handle<Adaptor2d_HCurve2d> & A, const Standard_Real Param, const IntSurf_Transition & TLine, const IntSurf_Transition & TArc);

		/****************** SetInternal ******************/
		/**** md5 signature: f29227e746cced65920ee7fe48924495 ****/
		%feature("compactdefaultargs") SetInternal;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") SetInternal;
		void SetInternal();

		/****************** SetMultiple ******************/
		/**** md5 signature: 1ac6220c2c8c7b2e4c947976b7d1c954 ****/
		%feature("compactdefaultargs") SetMultiple;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") SetMultiple;
		void SetMultiple();

		/****************** SetParameter ******************/
		/**** md5 signature: 9c20628bfb58eb45593287ce353000c6 ****/
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "Set the value of the parameter on the intersection line.

Parameters
----------
Para: float

Returns
-------
None
") SetParameter;
		void SetParameter(const Standard_Real Para);

		/****************** SetValue ******************/
		/**** md5 signature: c88313e81258115c4934b9fff4b38a78 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Sets the values for a point.

Parameters
----------
Pt: gp_Pnt
U: float
V: float

Returns
-------
None
") SetValue;
		void SetValue(const gp_Pnt & Pt, const Standard_Real U, const Standard_Real V);

		/****************** SetVertex ******************/
		/**** md5 signature: 1c2d847f9895dadcabe6f5a142550e35 ****/
		%feature("compactdefaultargs") SetVertex;
		%feature("autodoc", "Sets the values of a point which is a vertex on the initial facet of restriction of one of the surface.

Parameters
----------
V: Adaptor3d_HVertex

Returns
-------
None
") SetVertex;
		void SetVertex(const opencascade::handle<Adaptor3d_HVertex> & V);

		/****************** TransitionOnArc ******************/
		/**** md5 signature: adc9ee508ec8cbe59ce8b05248cd454a ****/
		%feature("compactdefaultargs") TransitionOnArc;
		%feature("autodoc", "Returns the transition of the point on the arc.

Returns
-------
IntSurf_Transition
") TransitionOnArc;
		const IntSurf_Transition & TransitionOnArc();

		/****************** TransitionOnLine ******************/
		/**** md5 signature: 1ffbcf064eb110daaac7ceebff0fcde5 ****/
		%feature("compactdefaultargs") TransitionOnLine;
		%feature("autodoc", "Returns the transition of the point on the contour.

Returns
-------
IntSurf_Transition
") TransitionOnLine;
		const IntSurf_Transition & TransitionOnLine();

		/****************** Value ******************/
		/**** md5 signature: eddd2908948849b73f6d8aacab318652 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the intersection point (geometric information).

Returns
-------
gp_Pnt
") Value;
		const gp_Pnt Value();

		/****************** Vertex ******************/
		/**** md5 signature: 7213fb18dc3be1f48818ab739bb98dfa ****/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Returns the information about the point when it is on the domain of the patch, i-e when the function isvertex returns true. otherwise, an exception is raised.

Returns
-------
opencascade::handle<Adaptor3d_HVertex>
") Vertex;
		const opencascade::handle<Adaptor3d_HVertex> & Vertex();

};


%extend Contap_Point {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Contap_SurfFunction *
****************************/
class Contap_SurfFunction : public math_FunctionSetWithDerivatives {
	public:
		/****************** Contap_SurfFunction ******************/
		/**** md5 signature: 551ec67d4c15a771ab94a5939f31e633 ****/
		%feature("compactdefaultargs") Contap_SurfFunction;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Contap_SurfFunction;
		 Contap_SurfFunction();

		/****************** Angle ******************/
		/**** md5 signature: dce50192c350c43b54f2e88e94e5372a ****/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Angle;
		Standard_Real Angle();

		/****************** Derivatives ******************/
		/**** md5 signature: 80ee5f16e62731c095910ad60228848b ****/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "The dimension of d is (1,2).

Parameters
----------
X: math_Vector
D: math_Matrix

Returns
-------
bool
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** Direction ******************/
		/**** md5 signature: 6107c9113155a9ae9007c5c8e526a738 ****/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Dir
") Direction;
		const gp_Dir Direction();

		/****************** Direction2d ******************/
		/**** md5 signature: e46e583c3b745511fb8654831bfa19d7 ****/
		%feature("compactdefaultargs") Direction2d;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Dir2d
") Direction2d;
		const gp_Dir2d Direction2d();

		/****************** Direction3d ******************/
		/**** md5 signature: ceda05eba57d20f6f3ce262f42faf157 ****/
		%feature("compactdefaultargs") Direction3d;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") Direction3d;
		const gp_Vec Direction3d();

		/****************** Eye ******************/
		/**** md5 signature: aa99970f6e90715f8213e1ab0b8ace3e ****/
		%feature("compactdefaultargs") Eye;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") Eye;
		const gp_Pnt Eye();

		/****************** FunctionType ******************/
		/**** md5 signature: be07ad13be6828eeadd86e0c10f87452 ****/
		%feature("compactdefaultargs") FunctionType;
		%feature("autodoc", "No available documentation.

Returns
-------
Contap_TFunction
") FunctionType;
		Contap_TFunction FunctionType();

		/****************** IsTangent ******************/
		/**** md5 signature: 52337431677eb50512a9391c1db95a81 ****/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsTangent;
		Standard_Boolean IsTangent();

		/****************** NbEquations ******************/
		/**** md5 signature: 42be0dc2e32c8e563393e8490171707e ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "This method has to return 1.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbVariables ******************/
		/**** md5 signature: a3de6b8a577fc113199e11b2b0bcdced ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "This method has to return 2.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** PSurface ******************/
		/**** md5 signature: 00164b0a6d38c86b9c6a224245b50df3 ****/
		%feature("compactdefaultargs") PSurface;
		%feature("autodoc", "Method is entered for compatibility with intpatch_thesurffunction.

Returns
-------
opencascade::handle<Adaptor3d_HSurface>
") PSurface;
		const opencascade::handle<Adaptor3d_HSurface> & PSurface();

		/****************** Point ******************/
		/**** md5 signature: 177e376cc11d1fedb2819bac56591ea8 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the value of the solution point on the surface.

Returns
-------
gp_Pnt
") Point;
		const gp_Pnt Point();

		/****************** Root ******************/
		/**** md5 signature: 1f1a437be6bd034392962de6cf04ded1 ****/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Root is the value of the function at the solution. it is a vector of dimension 1, i-e a real.

Returns
-------
float
") Root;
		Standard_Real Root();

		/****************** Set ******************/
		/**** md5 signature: c9230f42bb12d45a693a7ae3204732ab ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_HSurface

Returns
-------
None
") Set;
		void Set(const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** Set ******************/
		/**** md5 signature: 82e61fcbcd023e361c983ac9b10b051a ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Eye: gp_Pnt

Returns
-------
None
") Set;
		void Set(const gp_Pnt & Eye);

		/****************** Set ******************/
		/**** md5 signature: 15b1468c79fc4757515151f835f2d3d0 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Dir: gp_Dir

Returns
-------
None
") Set;
		void Set(const gp_Dir & Dir);

		/****************** Set ******************/
		/**** md5 signature: a5b90781feaa7ec1e0840ad075ed12d1 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Dir: gp_Dir
Angle: float

Returns
-------
None
") Set;
		void Set(const gp_Dir & Dir, const Standard_Real Angle);

		/****************** Set ******************/
		/**** md5 signature: df4b9353625a35b43eacf0999ffe2b0e ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Eye: gp_Pnt
Angle: float

Returns
-------
None
") Set;
		void Set(const gp_Pnt & Eye, const Standard_Real Angle);

		/****************** Set ******************/
		/**** md5 signature: 7e3e1092ebe5da1f71e965a1091893e3 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tolerance: float

Returns
-------
None
") Set;
		void Set(const Standard_Real Tolerance);

		/****************** Surface ******************/
		/**** md5 signature: 81999f08eca68bee259ba395fdac1a30 ****/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HSurface>
") Surface;
		const opencascade::handle<Adaptor3d_HSurface> & Surface();

		/****************** Tolerance ******************/
		/**** md5 signature: 9e5775014410d884d1a1adc1cd47930b ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Returns the value tol so that if abs(func.root())<tol the function is considered null.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

		/****************** Value ******************/
		/**** md5 signature: 31f6ba581b8fae503400d98976418349 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "The dimension of f is 1.

Parameters
----------
X: math_Vector
F: math_Vector

Returns
-------
bool
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****************** Values ******************/
		/**** md5 signature: 17c41f2c2b925e9ddfe2f61a9052313c ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Returns
-------
bool
") Values;
		Standard_Boolean Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

};


%extend Contap_SurfFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Contap_SurfProps *
*************************/
class Contap_SurfProps {
	public:
		/****************** DerivAndNorm ******************/
		/**** md5 signature: ce7945825ad002666cb45d5aac41cfae ****/
		%feature("compactdefaultargs") DerivAndNorm;
		%feature("autodoc", "Computes the point <p>, and normal vector <n> on <s> at parameters u,v.

Parameters
----------
S: Adaptor3d_HSurface
U: float
V: float
P: gp_Pnt
d1u: gp_Vec
d1v: gp_Vec
N: gp_Vec

Returns
-------
None
") DerivAndNorm;
		static void DerivAndNorm(const opencascade::handle<Adaptor3d_HSurface> & S, const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & d1u, gp_Vec & d1v, gp_Vec & N);

		/****************** NormAndDn ******************/
		/**** md5 signature: 6f4c431b6958c44491dc2251db446c2a ****/
		%feature("compactdefaultargs") NormAndDn;
		%feature("autodoc", "Computes the point <p>, normal vector <n>, and its derivatives <dnu> and <dnv> on <s> at parameters u,v.

Parameters
----------
S: Adaptor3d_HSurface
U: float
V: float
P: gp_Pnt
N: gp_Vec
Dnu: gp_Vec
Dnv: gp_Vec

Returns
-------
None
") NormAndDn;
		static void NormAndDn(const opencascade::handle<Adaptor3d_HSurface> & S, const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & N, gp_Vec & Dnu, gp_Vec & Dnv);

		/****************** Normale ******************/
		/**** md5 signature: 6395da9af750ad2ef9f9ce0623577f57 ****/
		%feature("compactdefaultargs") Normale;
		%feature("autodoc", "Computes the point <p>, and normal vector <n> on <s> at parameters u,v.

Parameters
----------
S: Adaptor3d_HSurface
U: float
V: float
P: gp_Pnt
N: gp_Vec

Returns
-------
None
") Normale;
		static void Normale(const opencascade::handle<Adaptor3d_HSurface> & S, const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & N);

};


%extend Contap_SurfProps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class Contap_TheIWLineOfTheIWalking *
**************************************/
class Contap_TheIWLineOfTheIWalking : public Standard_Transient {
	public:
		/****************** Contap_TheIWLineOfTheIWalking ******************/
		/**** md5 signature: ab259db8b2077633153b44fa739f81e2 ****/
		%feature("compactdefaultargs") Contap_TheIWLineOfTheIWalking;
		%feature("autodoc", "No available documentation.

Parameters
----------
theAllocator: IntSurf_Allocator,optional
	default value is 0

Returns
-------
None
") Contap_TheIWLineOfTheIWalking;
		 Contap_TheIWLineOfTheIWalking(const IntSurf_Allocator & theAllocator = 0);

		/****************** AddIndexPassing ******************/
		/**** md5 signature: 5211f3a2dbfeb4744c3451bde1b6a45c ****/
		%feature("compactdefaultargs") AddIndexPassing;
		%feature("autodoc", "Associer a l 'indice du point sur la ligne l'indice du point passant dans l'iterateur de depart.

Parameters
----------
Index: int

Returns
-------
None
") AddIndexPassing;
		void AddIndexPassing(const Standard_Integer Index);

		/****************** AddPoint ******************/
		/**** md5 signature: 806b6da489848ff70e42ef52b8d76d5c ****/
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "Add a point in the line.

Parameters
----------
P: IntSurf_PntOn2S

Returns
-------
None
") AddPoint;
		void AddPoint(const IntSurf_PntOn2S & P);

		/****************** AddStatusFirst ******************/
		/**** md5 signature: 57c24fab44c44bc9f08fb80e64391777 ****/
		%feature("compactdefaultargs") AddStatusFirst;
		%feature("autodoc", "No available documentation.

Parameters
----------
Closed: bool
HasFirst: bool

Returns
-------
None
") AddStatusFirst;
		void AddStatusFirst(const Standard_Boolean Closed, const Standard_Boolean HasFirst);

		/****************** AddStatusFirst ******************/
		/**** md5 signature: 3bcc39dd9b427e47834d54029a984cdb ****/
		%feature("compactdefaultargs") AddStatusFirst;
		%feature("autodoc", "No available documentation.

Parameters
----------
Closed: bool
HasLast: bool
Index: int
P: IntSurf_PathPoint

Returns
-------
None
") AddStatusFirst;
		void AddStatusFirst(const Standard_Boolean Closed, const Standard_Boolean HasLast, const Standard_Integer Index, const IntSurf_PathPoint & P);

		/****************** AddStatusFirstLast ******************/
		/**** md5 signature: 9b5b9adcff3655cf97dda89c630e8677 ****/
		%feature("compactdefaultargs") AddStatusFirstLast;
		%feature("autodoc", "No available documentation.

Parameters
----------
Closed: bool
HasFirst: bool
HasLast: bool

Returns
-------
None
") AddStatusFirstLast;
		void AddStatusFirstLast(const Standard_Boolean Closed, const Standard_Boolean HasFirst, const Standard_Boolean HasLast);

		/****************** AddStatusLast ******************/
		/**** md5 signature: 9df59b95ec4c6ad4a61e31770913147d ****/
		%feature("compactdefaultargs") AddStatusLast;
		%feature("autodoc", "No available documentation.

Parameters
----------
HasLast: bool

Returns
-------
None
") AddStatusLast;
		void AddStatusLast(const Standard_Boolean HasLast);

		/****************** AddStatusLast ******************/
		/**** md5 signature: 9af95226c154f17c39d5609cdec7266e ****/
		%feature("compactdefaultargs") AddStatusLast;
		%feature("autodoc", "No available documentation.

Parameters
----------
HasLast: bool
Index: int
P: IntSurf_PathPoint

Returns
-------
None
") AddStatusLast;
		void AddStatusLast(const Standard_Boolean HasLast, const Standard_Integer Index, const IntSurf_PathPoint & P);

		/****************** Cut ******************/
		/**** md5 signature: f0e9f7dd0e1c0316cdc67bc759be51c9 ****/
		%feature("compactdefaultargs") Cut;
		%feature("autodoc", "Cut the line at the point of rank index.

Parameters
----------
Index: int

Returns
-------
None
") Cut;
		void Cut(const Standard_Integer Index);

		/****************** FirstPoint ******************/
		/**** md5 signature: e0c1dbe8c28165db2dbe2ecf721fcc02 ****/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Returns the first point of the line when it is a marching point. an exception is raised if hasfirstpoint returns false.

Returns
-------
IntSurf_PathPoint
") FirstPoint;
		const IntSurf_PathPoint & FirstPoint();

		/****************** FirstPointIndex ******************/
		/**** md5 signature: 286ccb2e16a94010c49f690b00f54ac3 ****/
		%feature("compactdefaultargs") FirstPointIndex;
		%feature("autodoc", "Returns the index of first point of the line when it is a marching point.this index is the index in the pointstartiterator. an exception is raised if hasfirstpoint returns false.

Returns
-------
int
") FirstPointIndex;
		Standard_Integer FirstPointIndex();

		/****************** HasFirstPoint ******************/
		/**** md5 signature: 76549d304d78c4a9c8d3c420139524d3 ****/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "Returns true if the first point of the line is a marching point . when is hasfirstpoint==false ,the line begins on the natural bound of the surface.the line can be too long.

Returns
-------
bool
") HasFirstPoint;
		Standard_Boolean HasFirstPoint();

		/****************** HasLastPoint ******************/
		/**** md5 signature: 66b261e1c2b182701ee59bfbc6bde915 ****/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "Returns true if the end point of the line is a marching point (point from intws). when is hasfirstpoint==false ,the line ends on the natural bound of the surface.the line can be too long.

Returns
-------
bool
") HasLastPoint;
		Standard_Boolean HasLastPoint();

		/****************** IsClosed ******************/
		/**** md5 signature: 29709d02fadc9fcb79a766bc9679271b ****/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Returns true if the line is closed.

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsTangentAtBegining ******************/
		/**** md5 signature: a56d1f9469c98eadc8b6f319bc216c7b ****/
		%feature("compactdefaultargs") IsTangentAtBegining;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsTangentAtBegining;
		Standard_Boolean IsTangentAtBegining();

		/****************** IsTangentAtEnd ******************/
		/**** md5 signature: 105311500b205bba41fd4ab317165070 ****/
		%feature("compactdefaultargs") IsTangentAtEnd;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsTangentAtEnd;
		Standard_Boolean IsTangentAtEnd();

		/****************** LastPoint ******************/
		/**** md5 signature: 7876841b5cf564c633cdd87a1ac1e722 ****/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "Returns the last point of the line when it is a marching point. an exception is raised if haslastpoint returns false.

Returns
-------
IntSurf_PathPoint
") LastPoint;
		const IntSurf_PathPoint & LastPoint();

		/****************** LastPointIndex ******************/
		/**** md5 signature: 03702a2b3ccf8f424cd597daef257efb ****/
		%feature("compactdefaultargs") LastPointIndex;
		%feature("autodoc", "Returns the index of last point of the line when it is a marching point.this index is the index in the pointstartiterator. an exception is raised if haslastpoint returns false.

Returns
-------
int
") LastPointIndex;
		Standard_Integer LastPointIndex();

		/****************** Line ******************/
		/**** md5 signature: d5c2cd917d9e773fdb8b23c68d6a1fdc ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Returns the lineon2s contained in the walking line.

Returns
-------
opencascade::handle<IntSurf_LineOn2S>
") Line;
		const opencascade::handle<IntSurf_LineOn2S> & Line();

		/****************** NbPassingPoint ******************/
		/**** md5 signature: d0f6265bbd27e7d9360e0b1105cff054 ****/
		%feature("compactdefaultargs") NbPassingPoint;
		%feature("autodoc", "Returns the number of points belonging to pnts1 which are passing point.

Returns
-------
int
") NbPassingPoint;
		Standard_Integer NbPassingPoint();

		/****************** NbPoints ******************/
		/**** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of points of the line (including first point and end point : see haslastpoint and hasfirstpoint).

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** PassingPoint ******************/
		/**** md5 signature: 1ecf07ef770669b4329e847aa98917ae ****/
		%feature("compactdefaultargs") PassingPoint;
		%feature("autodoc", "Returns the index of the point belonging to the line which is associated to the passing point belonging to pnts1 an exception is raised if index > nbpassingpoint().

Parameters
----------
Index: int

Returns
-------
IndexLine: int
IndexPnts: int
") PassingPoint;
		void PassingPoint(const Standard_Integer Index, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** Reverse ******************/
		/**** md5 signature: b751d6874fc026e19a7a6cb37e9ac1b4 ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Reverse the points in the line. hasfirst, haslast are kept.

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** SetTangencyAtBegining ******************/
		/**** md5 signature: ea533706f2c44ba6eebb50b37aa11bce ****/
		%feature("compactdefaultargs") SetTangencyAtBegining;
		%feature("autodoc", "No available documentation.

Parameters
----------
IsTangent: bool

Returns
-------
None
") SetTangencyAtBegining;
		void SetTangencyAtBegining(const Standard_Boolean IsTangent);

		/****************** SetTangencyAtEnd ******************/
		/**** md5 signature: e69c7af21e7cb5c30f8431e2a8de655b ****/
		%feature("compactdefaultargs") SetTangencyAtEnd;
		%feature("autodoc", "No available documentation.

Parameters
----------
IsTangent: bool

Returns
-------
None
") SetTangencyAtEnd;
		void SetTangencyAtEnd(const Standard_Boolean IsTangent);

		/****************** SetTangentVector ******************/
		/**** md5 signature: 0e32ea065ed79437c3090e852108262e ****/
		%feature("compactdefaultargs") SetTangentVector;
		%feature("autodoc", "No available documentation.

Parameters
----------
V: gp_Vec
Index: int

Returns
-------
None
") SetTangentVector;
		void SetTangentVector(const gp_Vec & V, const Standard_Integer Index);

		/****************** TangentVector ******************/
		/**** md5 signature: e2d9d7aae22a66c0f8d3bfaf92d891c0 ****/
		%feature("compactdefaultargs") TangentVector;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
Index: int
") TangentVector;
		const gp_Vec TangentVector(Standard_Integer &OutValue);

		/****************** Value ******************/
		/**** md5 signature: 8dd9e41f579d9d6e26d29bbd4f60e2b9 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the point of range index. if index <= 0 or index > nbpoints, an exception is raised.

Parameters
----------
Index: int

Returns
-------
IntSurf_PntOn2S
") Value;
		const IntSurf_PntOn2S & Value(const Standard_Integer Index);

};


%make_alias(Contap_TheIWLineOfTheIWalking)

%extend Contap_TheIWLineOfTheIWalking {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Contap_TheIWalking *
***************************/
class Contap_TheIWalking {
	public:
		/****************** Contap_TheIWalking ******************/
		/**** md5 signature: 4f71e64347c62202a5b4b03cbe630737 ****/
		%feature("compactdefaultargs") Contap_TheIWalking;
		%feature("autodoc", "Deflection is the maximum deflection admitted between two consecutive points on a resulting polyline. step is the maximum increment admitted between two consecutive points (in 2d space). epsilon is the tolerance beyond which 2 points are confused. thetofillholes is the flag defining whether possible holes between resulting curves are filled or not in case of contap walking thetofillholes is true.

Parameters
----------
Epsilon: float
Deflection: float
Step: float
theToFillHoles: bool,optional
	default value is Standard_False

Returns
-------
None
") Contap_TheIWalking;
		 Contap_TheIWalking(const Standard_Real Epsilon, const Standard_Real Deflection, const Standard_Real Step, const Standard_Boolean theToFillHoles = Standard_False);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the calculus was successful.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbLines ******************/
		/**** md5 signature: 4f8001fdc02f82f8f981f090a37ac7d4 ****/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "Returns the number of resulting polylines. an exception is raised if isdone returns false.

Returns
-------
int
") NbLines;
		Standard_Integer NbLines();

		/****************** NbSinglePnts ******************/
		/**** md5 signature: 8a33644475ee84e2750fa4624ebcf8c0 ****/
		%feature("compactdefaultargs") NbSinglePnts;
		%feature("autodoc", "Returns the number of points belonging to pnts on which no line starts or ends. an exception is raised if isdone returns false.

Returns
-------
int
") NbSinglePnts;
		Standard_Integer NbSinglePnts();

		/****************** Perform ******************/
		/**** md5 signature: c661e9774be7f18d3e07e7032c13432f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Searches a set of polylines starting on a point of pnts1 or pnts2. each point on a resulting polyline verifies f(u,v)=0.

Parameters
----------
Pnts1: IntSurf_SequenceOfPathPoint
Pnts2: IntSurf_SequenceOfInteriorPoint
Func: Contap_SurfFunction
S: Adaptor3d_HSurface
Reversed: bool,optional
	default value is Standard_False

Returns
-------
None
") Perform;
		void Perform(const IntSurf_SequenceOfPathPoint & Pnts1, const IntSurf_SequenceOfInteriorPoint & Pnts2, Contap_SurfFunction & Func, const opencascade::handle<Adaptor3d_HSurface> & S, const Standard_Boolean Reversed = Standard_False);

		/****************** Perform ******************/
		/**** md5 signature: c8a7e4f6eaf4e50e46b4512dea0bd82b ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Searches a set of polylines starting on a point of pnts1. each point on a resulting polyline verifies f(u,v)=0.

Parameters
----------
Pnts1: IntSurf_SequenceOfPathPoint
Func: Contap_SurfFunction
S: Adaptor3d_HSurface
Reversed: bool,optional
	default value is Standard_False

Returns
-------
None
") Perform;
		void Perform(const IntSurf_SequenceOfPathPoint & Pnts1, Contap_SurfFunction & Func, const opencascade::handle<Adaptor3d_HSurface> & S, const Standard_Boolean Reversed = Standard_False);

		/****************** SetTolerance ******************/
		/**** md5 signature: 081b0efb39976d786ea1e8e9992511b4 ****/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "Deflection is the maximum deflection admitted between two consecutive points on a resulting polyline. step is the maximum increment admitted between two consecutive points (in 2d space). epsilon is the tolerance beyond which 2 points are confused.

Parameters
----------
Epsilon: float
Deflection: float
Step: float

Returns
-------
None
") SetTolerance;
		void SetTolerance(const Standard_Real Epsilon, const Standard_Real Deflection, const Standard_Real Step);

		/****************** SinglePnt ******************/
		/**** md5 signature: 6dd92e40051e4e916aa83e976db4a997 ****/
		%feature("compactdefaultargs") SinglePnt;
		%feature("autodoc", "Returns the point of range index . an exception is raised if isdone returns false. an exception is raised if index<=0 or index > nbsinglepnts.

Parameters
----------
Index: int

Returns
-------
IntSurf_PathPoint
") SinglePnt;
		const IntSurf_PathPoint & SinglePnt(const Standard_Integer Index);

		/****************** Value ******************/
		/**** md5 signature: 71e95ff141784c73dc31a05edff86b0b ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the polyline of range index. an exception is raised if isdone is false. an exception is raised if index<=0 or index>nblines.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<Contap_TheIWLineOfTheIWalking>
") Value;
		const opencascade::handle<Contap_TheIWLineOfTheIWalking> & Value(const Standard_Integer Index);

};


%extend Contap_TheIWalking {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class Contap_ThePathPointOfTheSearch *
***************************************/
class Contap_ThePathPointOfTheSearch {
	public:
		/****************** Contap_ThePathPointOfTheSearch ******************/
		/**** md5 signature: 5503b331f6af653d85c09254453a08e7 ****/
		%feature("compactdefaultargs") Contap_ThePathPointOfTheSearch;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Contap_ThePathPointOfTheSearch;
		 Contap_ThePathPointOfTheSearch();

		/****************** Contap_ThePathPointOfTheSearch ******************/
		/**** md5 signature: eb66ab7a9aabe8796e43a265904c2220 ****/
		%feature("compactdefaultargs") Contap_ThePathPointOfTheSearch;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
Tol: float
V: Adaptor3d_HVertex
A: Adaptor2d_HCurve2d
Parameter: float

Returns
-------
None
") Contap_ThePathPointOfTheSearch;
		 Contap_ThePathPointOfTheSearch(const gp_Pnt & P, const Standard_Real Tol, const opencascade::handle<Adaptor3d_HVertex> & V, const opencascade::handle<Adaptor2d_HCurve2d> & A, const Standard_Real Parameter);

		/****************** Contap_ThePathPointOfTheSearch ******************/
		/**** md5 signature: d5fbd3229296232afbce87b9fb0f46b0 ****/
		%feature("compactdefaultargs") Contap_ThePathPointOfTheSearch;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
Tol: float
A: Adaptor2d_HCurve2d
Parameter: float

Returns
-------
None
") Contap_ThePathPointOfTheSearch;
		 Contap_ThePathPointOfTheSearch(const gp_Pnt & P, const Standard_Real Tol, const opencascade::handle<Adaptor2d_HCurve2d> & A, const Standard_Real Parameter);

		/****************** Arc ******************/
		/**** md5 signature: b2e2a2b000ebbda9cef9186aeead5385 ****/
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor2d_HCurve2d>
") Arc;
		const opencascade::handle<Adaptor2d_HCurve2d> & Arc();

		/****************** IsNew ******************/
		/**** md5 signature: 3a3a8bc6ebd2fc2c25f224ff9e99af70 ****/
		%feature("compactdefaultargs") IsNew;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsNew;
		Standard_Boolean IsNew();

		/****************** Parameter ******************/
		/**** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** SetValue ******************/
		/**** md5 signature: afb7aa5124d314f5c392641b53c1d492 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
Tol: float
V: Adaptor3d_HVertex
A: Adaptor2d_HCurve2d
Parameter: float

Returns
-------
None
") SetValue;
		void SetValue(const gp_Pnt & P, const Standard_Real Tol, const opencascade::handle<Adaptor3d_HVertex> & V, const opencascade::handle<Adaptor2d_HCurve2d> & A, const Standard_Real Parameter);

		/****************** SetValue ******************/
		/**** md5 signature: 703f4ebe5bc0f77377a3392165fd60e0 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
Tol: float
A: Adaptor2d_HCurve2d
Parameter: float

Returns
-------
None
") SetValue;
		void SetValue(const gp_Pnt & P, const Standard_Real Tol, const opencascade::handle<Adaptor2d_HCurve2d> & A, const Standard_Real Parameter);

		/****************** Tolerance ******************/
		/**** md5 signature: 9e5775014410d884d1a1adc1cd47930b ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

		/****************** Value ******************/
		/**** md5 signature: eddd2908948849b73f6d8aacab318652 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") Value;
		const gp_Pnt Value();

		/****************** Vertex ******************/
		/**** md5 signature: 7213fb18dc3be1f48818ab739bb98dfa ****/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HVertex>
") Vertex;
		const opencascade::handle<Adaptor3d_HVertex> & Vertex();

};


%extend Contap_ThePathPointOfTheSearch {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Contap_TheSearch *
*************************/
class Contap_TheSearch {
	public:
		/****************** Contap_TheSearch ******************/
		/**** md5 signature: a7b004399382c1df1c7a307ba64b5fcc ****/
		%feature("compactdefaultargs") Contap_TheSearch;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Contap_TheSearch;
		 Contap_TheSearch();

		/****************** AllArcSolution ******************/
		/**** md5 signature: fd074d16584452fef4f16b506eae3de1 ****/
		%feature("compactdefaultargs") AllArcSolution;
		%feature("autodoc", "Returns true if all arc of the arcs are solution (inside the surface). an exception is raised if isdone returns false.

Returns
-------
bool
") AllArcSolution;
		Standard_Boolean AllArcSolution();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the calculus was successful.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbPoints ******************/
		/**** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of resulting points. an exception is raised if isdone returns false (notdone).

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** NbSegments ******************/
		/**** md5 signature: 6791e2039921b3bb6b2ff0f8e741d76b ****/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Returns the number of the resulting segments. an exception is raised if isdone returns false (notdone).

Returns
-------
int
") NbSegments;
		Standard_Integer NbSegments();

		/****************** Perform ******************/
		/**** md5 signature: bd400ef409e0f615858d49e533cc7623 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Algorithm to find the points and parts of curves of domain (domain of of restriction of a surface) which verify f = 0. tolboundary defines if a curve is on q. toltangency defines if a point is on q.

Parameters
----------
F: Contap_ArcFunction
Domain: Adaptor3d_TopolTool
TolBoundary: float
TolTangency: float
RecheckOnRegularity: bool,optional
	default value is Standard_False

Returns
-------
None
") Perform;
		void Perform(Contap_ArcFunction & F, const opencascade::handle<Adaptor3d_TopolTool> & Domain, const Standard_Real TolBoundary, const Standard_Real TolTangency, const Standard_Boolean RecheckOnRegularity = Standard_False);

		/****************** Point ******************/
		/**** md5 signature: 42cacb4a4712c4ca6505f55590e76eeb ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the resulting point of range index. the exception notdone is raised if isdone() returns false. the exception outofrange is raised if index <= 0 or index > nbpoints.

Parameters
----------
Index: int

Returns
-------
Contap_ThePathPointOfTheSearch
") Point;
		const Contap_ThePathPointOfTheSearch & Point(const Standard_Integer Index);

		/****************** Segment ******************/
		/**** md5 signature: 63b49e816a04d69ef4920a463a3974dc ****/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "Returns the resulting segment of range index. the exception notdone is raised if isdone() returns false. the exception outofrange is raised if index <= 0 or index > nbpoints.

Parameters
----------
Index: int

Returns
-------
Contap_TheSegmentOfTheSearch
") Segment;
		const Contap_TheSegmentOfTheSearch & Segment(const Standard_Integer Index);

};


%extend Contap_TheSearch {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Contap_TheSearchInside *
*******************************/
class Contap_TheSearchInside {
	public:
		/****************** Contap_TheSearchInside ******************/
		/**** md5 signature: 9b83ea07cc6d12c653098cd9fa891ec3 ****/
		%feature("compactdefaultargs") Contap_TheSearchInside;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Contap_TheSearchInside;
		 Contap_TheSearchInside();

		/****************** Contap_TheSearchInside ******************/
		/**** md5 signature: f62620b87119dfd0f74b77ea1d2a87a4 ****/
		%feature("compactdefaultargs") Contap_TheSearchInside;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: Contap_SurfFunction
Surf: Adaptor3d_HSurface
T: Adaptor3d_TopolTool
Epsilon: float

Returns
-------
None
") Contap_TheSearchInside;
		 Contap_TheSearchInside(Contap_SurfFunction & F, const opencascade::handle<Adaptor3d_HSurface> & Surf, const opencascade::handle<Adaptor3d_TopolTool> & T, const Standard_Real Epsilon);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbPoints ******************/
		/**** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of points. the exception notdone if raised if isdone returns false.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** Perform ******************/
		/**** md5 signature: 4e74f474e1680e44dda63caeaff12a97 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: Contap_SurfFunction
Surf: Adaptor3d_HSurface
T: Adaptor3d_TopolTool
Epsilon: float

Returns
-------
None
") Perform;
		void Perform(Contap_SurfFunction & F, const opencascade::handle<Adaptor3d_HSurface> & Surf, const opencascade::handle<Adaptor3d_TopolTool> & T, const Standard_Real Epsilon);

		/****************** Perform ******************/
		/**** md5 signature: a7999858c7502854d15de680c166ebf7 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: Contap_SurfFunction
Surf: Adaptor3d_HSurface
UStart: float
VStart: float

Returns
-------
None
") Perform;
		void Perform(Contap_SurfFunction & F, const opencascade::handle<Adaptor3d_HSurface> & Surf, const Standard_Real UStart, const Standard_Real VStart);

		/****************** Value ******************/
		/**** md5 signature: 32b603bd5d3112334230c3e7fbb789a7 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the point of range index. the exception notdone if raised if isdone returns false. the exception outofrange if raised if index <= 0 or index > nbpoints.

Parameters
----------
Index: int

Returns
-------
IntSurf_InteriorPoint
") Value;
		const IntSurf_InteriorPoint & Value(const Standard_Integer Index);

};


%extend Contap_TheSearchInside {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class Contap_TheSegmentOfTheSearch *
*************************************/
class Contap_TheSegmentOfTheSearch {
	public:
		/****************** Contap_TheSegmentOfTheSearch ******************/
		/**** md5 signature: 1d285dd74c990245cf5f590658f7423b ****/
		%feature("compactdefaultargs") Contap_TheSegmentOfTheSearch;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Contap_TheSegmentOfTheSearch;
		 Contap_TheSegmentOfTheSearch();

		/****************** Curve ******************/
		/**** md5 signature: f5519de5cf0d739f28ebd5b0ec724522 ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns the geometric curve on the surface 's domain which is solution.

Returns
-------
opencascade::handle<Adaptor2d_HCurve2d>
") Curve;
		const opencascade::handle<Adaptor2d_HCurve2d> & Curve();

		/****************** FirstPoint ******************/
		/**** md5 signature: e40c5283a03725d6ebc8922755a1d1ca ****/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Returns the first point.

Returns
-------
Contap_ThePathPointOfTheSearch
") FirstPoint;
		const Contap_ThePathPointOfTheSearch & FirstPoint();

		/****************** HasFirstPoint ******************/
		/**** md5 signature: 76549d304d78c4a9c8d3c420139524d3 ****/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "Returns true if there is a vertex (thepathpoint) defining the lowest valid parameter on the arc.

Returns
-------
bool
") HasFirstPoint;
		Standard_Boolean HasFirstPoint();

		/****************** HasLastPoint ******************/
		/**** md5 signature: 66b261e1c2b182701ee59bfbc6bde915 ****/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "Returns true if there is a vertex (thepathpoint) defining the greatest valid parameter on the arc.

Returns
-------
bool
") HasLastPoint;
		Standard_Boolean HasLastPoint();

		/****************** LastPoint ******************/
		/**** md5 signature: 7278121f151ef35144b484648f11d70b ****/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "Returns the last point.

Returns
-------
Contap_ThePathPointOfTheSearch
") LastPoint;
		const Contap_ThePathPointOfTheSearch & LastPoint();

		/****************** SetLimitPoint ******************/
		/**** md5 signature: 652ce8c8bcf5a5337b319397afec1f06 ****/
		%feature("compactdefaultargs") SetLimitPoint;
		%feature("autodoc", "Defines the first point or the last point, depending on the value of the boolean first.

Parameters
----------
V: Contap_ThePathPointOfTheSearch
First: bool

Returns
-------
None
") SetLimitPoint;
		void SetLimitPoint(const Contap_ThePathPointOfTheSearch & V, const Standard_Boolean First);

		/****************** SetValue ******************/
		/**** md5 signature: 54e9174a5a70b6567ab6ab5b478e8d12 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Defines the concerned arc.

Parameters
----------
A: Adaptor2d_HCurve2d

Returns
-------
None
") SetValue;
		void SetValue(const opencascade::handle<Adaptor2d_HCurve2d> & A);

};


%extend Contap_TheSegmentOfTheSearch {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
class Contap_TheHSequenceOfPoint : public Contap_TheSequenceOfPoint, public Standard_Transient {
  public:
    Contap_TheHSequenceOfPoint();
    Contap_TheHSequenceOfPoint(const Contap_TheSequenceOfPoint& theOther);
    const Contap_TheSequenceOfPoint& Sequence();
    void Append (const Contap_TheSequenceOfPoint::value_type& theItem);
    void Append (Contap_TheSequenceOfPoint& theSequence);
    Contap_TheSequenceOfPoint& ChangeSequence();
};
%make_alias(Contap_TheHSequenceOfPoint)


