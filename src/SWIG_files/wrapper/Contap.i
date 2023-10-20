/*
Copyright 2008-2023 Thomas Paviot (tpaviot@gmail.com)

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
https://www.opencascade.com/doc/occt-7.7.0/refman/html/package_contap.html"
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
%include ../common/EnumTemplates.i
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

/* python proxy classes for enums */
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
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Contap_ArcFunction;
		 Contap_ArcFunction();

		/****************** Derivative ******************/
		/**** md5 signature: 99d758c6c475cdb086620552a67d08e7 ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: float

Return
-------
D: float

Description
-----------
No available documentation.
") Derivative;
		Standard_Boolean Derivative(const Standard_Real X, Standard_Real &OutValue);

		/****************** GetStateNumber ******************/
		/**** md5 signature: 49c44bd66dd4ec2381671c72ebd88158 ****/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****************** LastComputedPoint ******************/
		/**** md5 signature: 151ab65e948ef31dff9bbbd66f058a30 ****/
		%feature("compactdefaultargs") LastComputedPoint;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the point, which has been computed while the last calling value() method.
") LastComputedPoint;
		const gp_Pnt LastComputedPoint();

		/****************** NbSamples ******************/
		/**** md5 signature: 1e61299a12ab2ebed2590e1021ec4bae ****/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSamples;
		Standard_Integer NbSamples();

		/****************** Quadric ******************/
		/**** md5 signature: 412540fe449bd77bf89b8085f1fe1701 ****/
		%feature("compactdefaultargs") Quadric;
		%feature("autodoc", "Return
-------
IntSurf_Quadric

Description
-----------
No available documentation.
") Quadric;
		const IntSurf_Quadric & Quadric();

		/****************** Set ******************/
		/**** md5 signature: fe1f4e54b6d838c88f545f7975616591 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const opencascade::handle<Adaptor3d_Surface> & S);

		/****************** Set ******************/
		/**** md5 signature: 7b60fb3b1252eb4013a37f792be86766 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Direction: gp_Dir

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const gp_Dir & Direction);

		/****************** Set ******************/
		/**** md5 signature: 9cf83fdf904bc30ff499b59d9a3cd4a0 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Direction: gp_Dir
Angle: float

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const gp_Dir & Direction, const Standard_Real Angle);

		/****************** Set ******************/
		/**** md5 signature: 82e61fcbcd023e361c983ac9b10b051a ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Eye: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const gp_Pnt & Eye);

		/****************** Set ******************/
		/**** md5 signature: df4b9353625a35b43eacf0999ffe2b0e ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Eye: gp_Pnt
Angle: float

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const gp_Pnt & Eye, const Standard_Real Angle);

		/****************** Set ******************/
		/**** md5 signature: 70ab888f546bf04b92c8032f862436af ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
A: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const opencascade::handle<Adaptor2d_Curve2d> & A);

		/****************** Surface ******************/
		/**** md5 signature: d36dc8d293d03901e5a1cace2e167115 ****/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
Returns mysurf field.
") Surface;
		const opencascade::handle<Adaptor3d_Surface> & Surface();

		/****************** Valpoint ******************/
		/**** md5 signature: 3a2ceb97db1e39a13d0a9061e49cb920 ****/
		%feature("compactdefaultargs") Valpoint;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Valpoint;
		const gp_Pnt Valpoint(const Standard_Integer Index);

		/****************** Value ******************/
		/**** md5 signature: af675141386b20e819be1017ca5afac2 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: float

Return
-------
F: float

Description
-----------
No available documentation.
") Value;
		Standard_Boolean Value(const Standard_Real X, Standard_Real &OutValue);

		/****************** Values ******************/
		/**** md5 signature: 3835d085291235e285cceabd6d1dd2b9 ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: float

Return
-------
F: float
D: float

Description
-----------
No available documentation.
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
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Contap_ContAna;
		 Contap_ContAna();

		/****************** Circle ******************/
		/**** md5 signature: cab8b08988d177bd7107adbbccc4ef89 ****/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "Return
-------
gp_Circ

Description
-----------
No available documentation.
") Circle;
		gp_Circ Circle();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****************** Line ******************/
		/**** md5 signature: f891b9d0be5f66ff9a406dfed37e1991 ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
gp_Lin

Description
-----------
No available documentation.
") Line;
		gp_Lin Line(const Standard_Integer Index);

		/****************** NbContours ******************/
		/**** md5 signature: 9bc6c7042c1b062de00f5626f3ec367e ****/
		%feature("compactdefaultargs") NbContours;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbContours;
		Standard_Integer NbContours();

		/****************** Perform ******************/
		/**** md5 signature: b9f75b8393c6cd183c564d2cf1768f58 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S: gp_Sphere
D: gp_Dir

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Sphere & S, const gp_Dir & D);

		/****************** Perform ******************/
		/**** md5 signature: 9e3a7f6299476f22fc94426b5f6eb15a ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S: gp_Sphere
D: gp_Dir
Ang: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Sphere & S, const gp_Dir & D, const Standard_Real Ang);

		/****************** Perform ******************/
		/**** md5 signature: 83e5be324f2e2c73bbe8c50fd37f8fc0 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S: gp_Sphere
Eye: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Sphere & S, const gp_Pnt & Eye);

		/****************** Perform ******************/
		/**** md5 signature: a11a7f0b0850419c1c57238048e54f31 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Cylinder
D: gp_Dir

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Cylinder & C, const gp_Dir & D);

		/****************** Perform ******************/
		/**** md5 signature: 6677b9abfa575ea86b1cb2c3d80cbb21 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Cylinder
D: gp_Dir
Ang: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Cylinder & C, const gp_Dir & D, const Standard_Real Ang);

		/****************** Perform ******************/
		/**** md5 signature: f7fbe617dc60d1ff7b48291ef8af9b77 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Cylinder
Eye: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Cylinder & C, const gp_Pnt & Eye);

		/****************** Perform ******************/
		/**** md5 signature: 7412caececa5d30e287fc66233cf2264 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Cone
D: gp_Dir

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Cone & C, const gp_Dir & D);

		/****************** Perform ******************/
		/**** md5 signature: b0bdcde5ac71912f96c9d22de0c98e9c ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Cone
D: gp_Dir
Ang: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Cone & C, const gp_Dir & D, const Standard_Real Ang);

		/****************** Perform ******************/
		/**** md5 signature: 879c7165991c9f0ff7be8883e8f0e98c ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Cone
Eye: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Cone & C, const gp_Pnt & Eye);

		/****************** TypeContour ******************/
		/**** md5 signature: d3534623a7f7cecab5a391d5a853d774 ****/
		%feature("compactdefaultargs") TypeContour;
		%feature("autodoc", "Return
-------
GeomAbs_CurveType

Description
-----------
Returns geomabs_line or geomabs_circle, when isdone() returns true.
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
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Contap_Contour;
		 Contap_Contour();

		/****************** Contap_Contour ******************/
		/**** md5 signature: bd91b0d3a8a64bcd82393bb6259770cf ****/
		%feature("compactdefaultargs") Contap_Contour;
		%feature("autodoc", "
Parameters
----------
Direction: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") Contap_Contour;
		 Contap_Contour(const gp_Vec & Direction);

		/****************** Contap_Contour ******************/
		/**** md5 signature: f347113f128de03764c976388dd763fa ****/
		%feature("compactdefaultargs") Contap_Contour;
		%feature("autodoc", "
Parameters
----------
Direction: gp_Vec
Angle: float

Return
-------
None

Description
-----------
No available documentation.
") Contap_Contour;
		 Contap_Contour(const gp_Vec & Direction, const Standard_Real Angle);

		/****************** Contap_Contour ******************/
		/**** md5 signature: a1d711354b1cae160e79b4e231bd07b4 ****/
		%feature("compactdefaultargs") Contap_Contour;
		%feature("autodoc", "
Parameters
----------
Eye: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Contap_Contour;
		 Contap_Contour(const gp_Pnt & Eye);

		/****************** Contap_Contour ******************/
		/**** md5 signature: 25645dae103420d74f7a669531e03e3a ****/
		%feature("compactdefaultargs") Contap_Contour;
		%feature("autodoc", "
Parameters
----------
Surf: Adaptor3d_Surface
Domain: Adaptor3d_TopolTool
Direction: gp_Vec

Return
-------
None

Description
-----------
Creates the contour in a given direction.
") Contap_Contour;
		 Contap_Contour(const opencascade::handle<Adaptor3d_Surface> & Surf, const opencascade::handle<Adaptor3d_TopolTool> & Domain, const gp_Vec & Direction);

		/****************** Contap_Contour ******************/
		/**** md5 signature: 477d93fc923faa8291a1a3940a1672cc ****/
		%feature("compactdefaultargs") Contap_Contour;
		%feature("autodoc", "
Parameters
----------
Surf: Adaptor3d_Surface
Domain: Adaptor3d_TopolTool
Direction: gp_Vec
Angle: float

Return
-------
None

Description
-----------
Creates the contour in a given direction.
") Contap_Contour;
		 Contap_Contour(const opencascade::handle<Adaptor3d_Surface> & Surf, const opencascade::handle<Adaptor3d_TopolTool> & Domain, const gp_Vec & Direction, const Standard_Real Angle);

		/****************** Contap_Contour ******************/
		/**** md5 signature: 56cac3764cf1b3b815e5af09b9b8027c ****/
		%feature("compactdefaultargs") Contap_Contour;
		%feature("autodoc", "
Parameters
----------
Surf: Adaptor3d_Surface
Domain: Adaptor3d_TopolTool
Eye: gp_Pnt

Return
-------
None

Description
-----------
Creates the contour for a perspective view.
") Contap_Contour;
		 Contap_Contour(const opencascade::handle<Adaptor3d_Surface> & Surf, const opencascade::handle<Adaptor3d_TopolTool> & Domain, const gp_Pnt & Eye);

		/****************** Init ******************/
		/**** md5 signature: deab7f18a5b73dea8633b272c74ec953 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Direction: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const gp_Vec & Direction);

		/****************** Init ******************/
		/**** md5 signature: 54e24371bc5b544519382c90e6ae1c36 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Direction: gp_Vec
Angle: float

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const gp_Vec & Direction, const Standard_Real Angle);

		/****************** Init ******************/
		/**** md5 signature: 44a2c71985162287cc60ada71418f1d1 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Eye: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const gp_Pnt & Eye);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsEmpty ******************/
		/**** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the is no line.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** Line ******************/
		/**** md5 signature: e1f84a12db582fc2be0b030fbc71189b ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
Contap_Line

Description
-----------
No available documentation.
") Line;
		const Contap_Line & Line(const Standard_Integer Index);

		/****************** NbLines ******************/
		/**** md5 signature: 4f8001fdc02f82f8f981f090a37ac7d4 ****/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbLines;
		Standard_Integer NbLines();

		/****************** Perform ******************/
		/**** md5 signature: f325c0d93f36bc064924753d683f809a ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Surf: Adaptor3d_Surface
Domain: Adaptor3d_TopolTool

Return
-------
None

Description
-----------
Creates the contour in a given direction.
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Surface> & Surf, const opencascade::handle<Adaptor3d_TopolTool> & Domain);

		/****************** Perform ******************/
		/**** md5 signature: 0b4fd3b0fec6772a0904131288cdfdd2 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Surf: Adaptor3d_Surface
Domain: Adaptor3d_TopolTool
Direction: gp_Vec

Return
-------
None

Description
-----------
Creates the contour in a given direction.
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Surface> & Surf, const opencascade::handle<Adaptor3d_TopolTool> & Domain, const gp_Vec & Direction);

		/****************** Perform ******************/
		/**** md5 signature: 3262b2a18ac7cca247352dff7df5c35a ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Surf: Adaptor3d_Surface
Domain: Adaptor3d_TopolTool
Direction: gp_Vec
Angle: float

Return
-------
None

Description
-----------
Creates the contour in a given direction.
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Surface> & Surf, const opencascade::handle<Adaptor3d_TopolTool> & Domain, const gp_Vec & Direction, const Standard_Real Angle);

		/****************** Perform ******************/
		/**** md5 signature: 1211ae19df2ef1905fcbbf0375510d47 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Surf: Adaptor3d_Surface
Domain: Adaptor3d_TopolTool
Eye: gp_Pnt

Return
-------
None

Description
-----------
Creates the contour for a perspective view.
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Surface> & Surf, const opencascade::handle<Adaptor3d_TopolTool> & Domain, const gp_Pnt & Eye);

		/****************** SurfaceFunction ******************/
		/**** md5 signature: 4a38b2f929c85d9d66c55cb5e593a36b ****/
		%feature("compactdefaultargs") SurfaceFunction;
		%feature("autodoc", "Return
-------
Contap_SurfFunction

Description
-----------
Returns a reference on the internal surfacefunction. this is used to compute tangents on the lines.
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
		/**** md5 signature: 14979ddc3175e995d5548477ac5bcd4b ****/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
Ufirst: float
Ulast: float

Description
-----------
Returns the parametric limits on the arc c. these limits must be finite: they are either the real limits of the arc, for a finite arc, or a bounding box for an infinite arc.
") Bounds;
		static void Bounds(const opencascade::handle<Adaptor2d_Curve2d> & C, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** HasBeenSeen ******************/
		/**** md5 signature: 52a722c5d4a9984d26ad321cf3630b48 ****/
		%feature("compactdefaultargs") HasBeenSeen;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
bool

Description
-----------
Returns true if all the intersection point and edges are known on the arc. the intersection point are given as vertices. the intersection edges are given as intervals between two vertices.
") HasBeenSeen;
		static Standard_Boolean HasBeenSeen(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****************** HasFirstPoint ******************/
		/**** md5 signature: af276ff6ae83b4e53affd31093f8bfdc ****/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
Index: int

Return
-------
IndFirst: int

Description
-----------
Returns true when the segment of range index is not open at the left side. in that case, indfirst is the range in the list intersection points (see nbpoints) of the one which defines the left bound of the segment. otherwise, the method has to return false, and indfirst has no meaning.
") HasFirstPoint;
		static Standard_Boolean HasFirstPoint(const opencascade::handle<Adaptor2d_Curve2d> & C, const Standard_Integer Index, Standard_Integer &OutValue);

		/****************** HasLastPoint ******************/
		/**** md5 signature: a28a12263a39eecc4acc9708fdf256c7 ****/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
Index: int

Return
-------
IndLast: int

Description
-----------
Returns true when the segment of range index is not open at the right side. in that case, indlast is the range in the list intersection points (see nbpoints) of the one which defines the right bound of the segment. otherwise, the method has to return false, and indlast has no meaning.
") HasLastPoint;
		static Standard_Boolean HasLastPoint(const opencascade::handle<Adaptor2d_Curve2d> & C, const Standard_Integer Index, Standard_Integer &OutValue);

		/****************** IsAllSolution ******************/
		/**** md5 signature: a0e5f5bbe827235fe1ddb52793e5eb42 ****/
		%feature("compactdefaultargs") IsAllSolution;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
bool

Description
-----------
Returns true when the whole restriction is solution of the intersection problem.
") IsAllSolution;
		static Standard_Boolean IsAllSolution(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****************** IsVertex ******************/
		/**** md5 signature: ffecad0cdf7d56d3c7a670cde7e75bc2 ****/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
Index: int

Return
-------
bool

Description
-----------
Returns true if the intersection point of range index corresponds with a vertex on the arc a.
") IsVertex;
		static Standard_Boolean IsVertex(const opencascade::handle<Adaptor2d_Curve2d> & C, const Standard_Integer Index);

		/****************** NbPoints ******************/
		/**** md5 signature: 54aec07f3b6dd332421dfbc4dec3568c ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
int

Description
-----------
Returns the number of intersection points on the arc a.
") NbPoints;
		static Standard_Integer NbPoints(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****************** NbSamplePoints ******************/
		/**** md5 signature: f9bf587e348ded4c9e8073b6938de72d ****/
		%feature("compactdefaultargs") NbSamplePoints;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface

Return
-------
int

Description
-----------
No available documentation.
") NbSamplePoints;
		static Standard_Integer NbSamplePoints(const opencascade::handle<Adaptor3d_Surface> & S);

		/****************** NbSamplesOnArc ******************/
		/**** md5 signature: 99a1330c1c671d353c2bee9fd23c27cc ****/
		%feature("compactdefaultargs") NbSamplesOnArc;
		%feature("autodoc", "
Parameters
----------
A: Adaptor2d_Curve2d

Return
-------
int

Description
-----------
Returns the number of points which is used to make a sample on the arc. this number is a function of the surface and the curveonsurface complexity.
") NbSamplesOnArc;
		static Standard_Integer NbSamplesOnArc(const opencascade::handle<Adaptor2d_Curve2d> & A);

		/****************** NbSamplesU ******************/
		/**** md5 signature: 7ffe816252db97bdbf2950cea2ca2037 ****/
		%feature("compactdefaultargs") NbSamplesU;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
u1: float
u2: float

Return
-------
int

Description
-----------
No available documentation.
") NbSamplesU;
		static Standard_Integer NbSamplesU(const opencascade::handle<Adaptor3d_Surface> & S, const Standard_Real u1, const Standard_Real u2);

		/****************** NbSamplesV ******************/
		/**** md5 signature: 183861bdb84cb1597bd3a1324a097e8e ****/
		%feature("compactdefaultargs") NbSamplesV;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
v1: float
v2: float

Return
-------
int

Description
-----------
No available documentation.
") NbSamplesV;
		static Standard_Integer NbSamplesV(const opencascade::handle<Adaptor3d_Surface> & S, const Standard_Real v1, const Standard_Real v2);

		/****************** NbSegments ******************/
		/**** md5 signature: 2689aa0fe05c64574e603c4eb512caa4 ****/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
int

Description
-----------
Returns the number of part of a solution of the of intersection problem.
") NbSegments;
		static Standard_Integer NbSegments(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****************** Parameter ******************/
		/**** md5 signature: f5a937c546746bb35bafec928fdc442d ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
V: Adaptor3d_HVertex
C: Adaptor2d_Curve2d

Return
-------
float

Description
-----------
Returns the parameter of the vertex v on the arc a.
") Parameter;
		static Standard_Real Parameter(const opencascade::handle<Adaptor3d_HVertex> & V, const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****************** Project ******************/
		/**** md5 signature: b602a334ba1cfcdefae0bd304b479ee8 ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
P: gp_Pnt2d
Ptproj: gp_Pnt2d

Return
-------
Paramproj: float

Description
-----------
Projects the point p on the arc c. if the methods returns standard_true, the projection is successful, and paramproj is the parameter on the arc of the projected point, ptproj is the projected point. if the method returns standard_false, param proj and ptproj are not significant.
") Project;
		static Standard_Boolean Project(const opencascade::handle<Adaptor2d_Curve2d> & C, const gp_Pnt2d & P, Standard_Real &OutValue, gp_Pnt2d & Ptproj);

		/****************** SamplePoint ******************/
		/**** md5 signature: da2e08ebb1b31e85cabbb780a9cea7b5 ****/
		%feature("compactdefaultargs") SamplePoint;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
Index: int

Return
-------
U: float
V: float

Description
-----------
No available documentation.
") SamplePoint;
		static void SamplePoint(const opencascade::handle<Adaptor3d_Surface> & S, const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Tolerance ******************/
		/**** md5 signature: 35f5531e9c358e20c7f5723f26e0a7ba ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "
Parameters
----------
V: Adaptor3d_HVertex
C: Adaptor2d_Curve2d

Return
-------
float

Description
-----------
Returns the parametric tolerance used to consider that the vertex and another point meet, i-e if abs(parameter(vertex) - parameter(otherpnt))<= tolerance, the points are 'merged'.
") Tolerance;
		static Standard_Real Tolerance(const opencascade::handle<Adaptor3d_HVertex> & V, const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****************** Value ******************/
		/**** md5 signature: ba54f1e0e4e6802571668cb2c0638480 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
Index: int
Pt: gp_Pnt

Return
-------
Tol: float
U: float

Description
-----------
Returns the value (pt), the tolerance (tol), and the parameter (u) on the arc a , of the intersection point of range index.
") Value;
		static void Value(const opencascade::handle<Adaptor2d_Curve2d> & C, const Standard_Integer Index, gp_Pnt & Pt, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Vertex ******************/
		/**** md5 signature: f58ee2175cbc1af1161d7220a9c11ff1 ****/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
Index: int
V: Adaptor3d_HVertex

Return
-------
None

Description
-----------
When isvertex returns true, this method returns the vertex on the arc a.
") Vertex;
		static void Vertex(const opencascade::handle<Adaptor2d_Curve2d> & C, const Standard_Integer Index, opencascade::handle<Adaptor3d_HVertex> & V);

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
		/**** md5 signature: 1151b84776305bc0a5c8aaee6f50252d ****/
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
		static opencascade::handle<Geom2d_BSplineCurve> BSpline(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****************** Bezier ******************/
		/**** md5 signature: 55afc4c0fc79e07de6077214558af461 ****/
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
		static opencascade::handle<Geom2d_BezierCurve> Bezier(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****************** Circle ******************/
		/**** md5 signature: 3e4b216e090c5747e712418f4fa66d2c ****/
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
		static gp_Circ2d Circle(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****************** Continuity ******************/
		/**** md5 signature: 93cd5f75c1ce867aba7a7f12421275f0 ****/
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
		static GeomAbs_Shape Continuity(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****************** D0 ******************/
		/**** md5 signature: 54c6bd0c456279db2610c0ff0808eb84 ****/
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
Computes the point of parameter u on the curve.
") D0;
		static void D0(const opencascade::handle<Adaptor2d_Curve2d> & C, const Standard_Real U, gp_Pnt2d & P);

		/****************** D1 ******************/
		/**** md5 signature: 918bee38d3c31b02180315ab8bd4beb7 ****/
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
Computes the point of parameter u on the curve with its first derivative. raised if the continuity of the current interval is not c1.
") D1;
		static void D1(const opencascade::handle<Adaptor2d_Curve2d> & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V);

		/****************** D2 ******************/
		/**** md5 signature: d9e326efa98865a213fce49a3626a678 ****/
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
Returns the point p of parameter u, the first and second derivatives v1 and v2. raised if the continuity of the current interval is not c2.
") D2;
		static void D2(const opencascade::handle<Adaptor2d_Curve2d> & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D3 ******************/
		/**** md5 signature: 4951d7379750f8dbc9e426361fa2b365 ****/
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
Returns the point p of parameter u, the first, the second and the third derivative. raised if the continuity of the current interval is not c3.
") D3;
		static void D3(const opencascade::handle<Adaptor2d_Curve2d> & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** DN ******************/
		/**** md5 signature: edb6f0f7cc5bdd7864a248db788f4d84 ****/
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
The returned vector gives the value of the derivative for the order of derivation n. raised if the continuity of the current interval is not cn. raised if n < 1.
") DN;
		static gp_Vec2d DN(const opencascade::handle<Adaptor2d_Curve2d> & C, const Standard_Real U, const Standard_Integer N);

		/****************** Ellipse ******************/
		/**** md5 signature: 9ddecf68838c4598b17a43e7ee186e6e ****/
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
		static gp_Elips2d Ellipse(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****************** FirstParameter ******************/
		/**** md5 signature: a4d9a6241f0c3cafc57f60a68d9c9127 ****/
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
		static Standard_Real FirstParameter(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****************** GetType ******************/
		/**** md5 signature: 29ec5067d7e913f214c553444ec99b6a ****/
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
Returns the type of the curve in the current interval: line, circle, ellipse, hyperbola, parabola, beziercurve, bsplinecurve, othercurve.
") GetType;
		static GeomAbs_CurveType GetType(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****************** Hyperbola ******************/
		/**** md5 signature: d710d90c07a9bd6c6e8e1ba3fc1c92bf ****/
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
		static gp_Hypr2d Hyperbola(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****************** Intervals ******************/
		/**** md5 signature: 7f25b6c48f712ccc9ec416d83eb97ef8 ****/
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
Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accommodate for the parameters. i.e. t.length() > nbintervals().
") Intervals;
		static void Intervals(const opencascade::handle<Adaptor2d_Curve2d> & C, TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsClosed ******************/
		/**** md5 signature: e2e4c5d0ae21ac59c815ef761d7e7eb0 ****/
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
		static Standard_Boolean IsClosed(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****************** IsPeriodic ******************/
		/**** md5 signature: 343c2522f84a0271d505fb5a7b6123ee ****/
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
		static Standard_Boolean IsPeriodic(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****************** LastParameter ******************/
		/**** md5 signature: a84c73d5efee27b935b3bc64eba5e8ab ****/
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
		static Standard_Real LastParameter(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****************** Line ******************/
		/**** md5 signature: cc50bf5bbcfff1340d1951ad804f481d ****/
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
		static gp_Lin2d Line(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****************** NbIntervals ******************/
		/**** md5 signature: 296d2d406ae6365ab4187665e47f6beb ****/
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
Returns the number of intervals for continuity <s>. may be one if continuity(myclass) >= <s>.
") NbIntervals;
		static Standard_Integer NbIntervals(const opencascade::handle<Adaptor2d_Curve2d> & C, const GeomAbs_Shape S);

		/****************** NbSamples ******************/
		/**** md5 signature: 4846c46ec026f7e5cf2080eb1601445a ****/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U0: float
U1: float

Return
-------
int

Description
-----------
No available documentation.
") NbSamples;
		static Standard_Integer NbSamples(const opencascade::handle<Adaptor2d_Curve2d> & C, const Standard_Real U0, const Standard_Real U1);

		/****************** Parabola ******************/
		/**** md5 signature: 638d7ecde6dd9f67180eadf45347f22e ****/
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
		static gp_Parab2d Parabola(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****************** Period ******************/
		/**** md5 signature: 2a78d8fc20cccabaa0fb7d52397ae7ba ****/
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
		static Standard_Real Period(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****************** Resolution ******************/
		/**** md5 signature: 1567f92dacdcdb24e1f4d21710c525e2 ****/
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
Returns the parametric resolution corresponding to the real space resolution <r3d>.
") Resolution;
		static Standard_Real Resolution(const opencascade::handle<Adaptor2d_Curve2d> & C, const Standard_Real R3d);

		/****************** Value ******************/
		/**** md5 signature: f88e121e984f9cbec46065eb86a1e379 ****/
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
Computes the point of parameter u on the curve.
") Value;
		static gp_Pnt2d Value(const opencascade::handle<Adaptor2d_Curve2d> & C, const Standard_Real U);

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
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Contap_Line;
		 Contap_Line();

		/****************** Add ******************/
		/**** md5 signature: 01be3efa9c74c4d8432a102f97f9361d ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
P: IntSurf_PntOn2S

Return
-------
None

Description
-----------
No available documentation.
") Add;
		void Add(const IntSurf_PntOn2S & P);

		/****************** Add ******************/
		/**** md5 signature: 056936562dcf77b940ba3130c47afdae ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
P: Contap_Point

Return
-------
None

Description
-----------
No available documentation.
") Add;
		void Add(const Contap_Point & P);

		/****************** Arc ******************/
		/**** md5 signature: de8e47510fc50811ee5a3e0bc98029e6 ****/
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
No available documentation.
") Arc;
		const opencascade::handle<Adaptor2d_Curve2d> & Arc();

		/****************** Circle ******************/
		/**** md5 signature: cab8b08988d177bd7107adbbccc4ef89 ****/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "Return
-------
gp_Circ

Description
-----------
No available documentation.
") Circle;
		gp_Circ Circle();

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Clear;
		void Clear();

		/****************** Line ******************/
		/**** md5 signature: 63e1fa189ca3bcfdb401241217a93bfb ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Return
-------
gp_Lin

Description
-----------
No available documentation.
") Line;
		gp_Lin Line();

		/****************** LineOn2S ******************/
		/**** md5 signature: 31b349cb17d652cab4ad0cf52e88a2aa ****/
		%feature("compactdefaultargs") LineOn2S;
		%feature("autodoc", "Return
-------
opencascade::handle<IntSurf_LineOn2S>

Description
-----------
No available documentation.
") LineOn2S;
		const opencascade::handle<IntSurf_LineOn2S> & LineOn2S();

		/****************** NbPnts ******************/
		/**** md5 signature: 11421df812eef5f47a644a70b75ab60a ****/
		%feature("compactdefaultargs") NbPnts;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPnts;
		Standard_Integer NbPnts();

		/****************** NbVertex ******************/
		/**** md5 signature: b2d226bac64a106c7941ef45ff4e07f1 ****/
		%feature("compactdefaultargs") NbVertex;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVertex;
		Standard_Integer NbVertex();

		/****************** Point ******************/
		/**** md5 signature: f91b2c05b43dfb8aaadba8068bf4b32a ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IntSurf_PntOn2S

Description
-----------
No available documentation.
") Point;
		const IntSurf_PntOn2S & Point(const Standard_Integer Index);

		/****************** ResetSeqOfVertex ******************/
		/**** md5 signature: a6c5afb6e069ea40eab99b45a50ab6bd ****/
		%feature("compactdefaultargs") ResetSeqOfVertex;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ResetSeqOfVertex;
		void ResetSeqOfVertex();

		/****************** SetLineOn2S ******************/
		/**** md5 signature: 10da8691bc4dbff6817878acc12fd279 ****/
		%feature("compactdefaultargs") SetLineOn2S;
		%feature("autodoc", "
Parameters
----------
L: IntSurf_LineOn2S

Return
-------
None

Description
-----------
No available documentation.
") SetLineOn2S;
		void SetLineOn2S(const opencascade::handle<IntSurf_LineOn2S> & L);

		/****************** SetTransitionOnS ******************/
		/**** md5 signature: 3e11bbe314ad3435d0d0c939af6c7e0c ****/
		%feature("compactdefaultargs") SetTransitionOnS;
		%feature("autodoc", "
Parameters
----------
T: IntSurf_TypeTrans

Return
-------
None

Description
-----------
Set the tansition of the line.
") SetTransitionOnS;
		void SetTransitionOnS(const IntSurf_TypeTrans T);

		/****************** SetValue ******************/
		/**** md5 signature: 1ae32c88ce581ccde7cd37fbe879a748 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin

Return
-------
None

Description
-----------
No available documentation.
") SetValue;
		void SetValue(const gp_Lin & L);

		/****************** SetValue ******************/
		/**** md5 signature: df8c025f756bd837345d152a2edc2a47 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ

Return
-------
None

Description
-----------
No available documentation.
") SetValue;
		void SetValue(const gp_Circ & C);

		/****************** SetValue ******************/
		/**** md5 signature: 53ce9238106071febf6db57a0ff8a99c ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
A: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
No available documentation.
") SetValue;
		void SetValue(const opencascade::handle<Adaptor2d_Curve2d> & A);

		/****************** TransitionOnS ******************/
		/**** md5 signature: ac2f27afdd16ab93ea1f959cb2bf6e33 ****/
		%feature("compactdefaultargs") TransitionOnS;
		%feature("autodoc", "Return
-------
IntSurf_TypeTrans

Description
-----------
Returns in if at the 'left' of the line, the normale of the surface is oriented to the observator.
") TransitionOnS;
		IntSurf_TypeTrans TransitionOnS();

		/****************** TypeContour ******************/
		/**** md5 signature: ccb9b7428ffec80adf355a2d32ee6f36 ****/
		%feature("compactdefaultargs") TypeContour;
		%feature("autodoc", "Return
-------
Contap_IType

Description
-----------
Returns contap_lin for a line, contap_circle for a circle, and contap_walking for a walking line, contap_restriction for a part of boundarie.
") TypeContour;
		Contap_IType TypeContour();

		/****************** Vertex ******************/
		/**** md5 signature: a9752a4d0f1a95aac4c22e2cbc715081 ****/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
Contap_Point

Description
-----------
No available documentation.
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
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Contap_Point;
		 Contap_Point();

		/****************** Contap_Point ******************/
		/**** md5 signature: e63a495e15d3f926ffe70feb26e98122 ****/
		%feature("compactdefaultargs") Contap_Point;
		%feature("autodoc", "
Parameters
----------
Pt: gp_Pnt
U: float
V: float

Return
-------
None

Description
-----------
Creates a point.
") Contap_Point;
		 Contap_Point(const gp_Pnt & Pt, const Standard_Real U, const Standard_Real V);

		/****************** Arc ******************/
		/**** md5 signature: de8e47510fc50811ee5a3e0bc98029e6 ****/
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
Returns the arc of restriction containing the vertex.
") Arc;
		const opencascade::handle<Adaptor2d_Curve2d> & Arc();

		/****************** IsInternal ******************/
		/**** md5 signature: d02f8c187f927a9ba16cc17de3466e18 ****/
		%feature("compactdefaultargs") IsInternal;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the point is an internal one, i.e if the tangent to the line on the point and the eye direction are parallel.
") IsInternal;
		Standard_Boolean IsInternal();

		/****************** IsMultiple ******************/
		/**** md5 signature: d5ff9ea3f75ee3e6e0efda5814b9e44e ****/
		%feature("compactdefaultargs") IsMultiple;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the point belongs to several lines.
") IsMultiple;
		Standard_Boolean IsMultiple();

		/****************** IsOnArc ******************/
		/**** md5 signature: f74dbf32a42236bf36dcd24dd76a342c ****/
		%feature("compactdefaultargs") IsOnArc;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true when the point is an intersection between the contour and a restriction.
") IsOnArc;
		Standard_Boolean IsOnArc();

		/****************** IsVertex ******************/
		/**** md5 signature: 7dbb6189450b7f2ae76146c6d5d6e875 ****/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the point is a vertex on the initial restriction facet of the surface.
") IsVertex;
		Standard_Boolean IsVertex();

		/****************** ParameterOnArc ******************/
		/**** md5 signature: 53d2051734836b1f3c7d9edd7c3c1884 ****/
		%feature("compactdefaultargs") ParameterOnArc;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the parameter of the point on the arc returned by the method arc().
") ParameterOnArc;
		Standard_Real ParameterOnArc();

		/****************** ParameterOnLine ******************/
		/**** md5 signature: 737a2a57e32e63a1ba587dea488e9583 ****/
		%feature("compactdefaultargs") ParameterOnLine;
		%feature("autodoc", "Return
-------
float

Description
-----------
This method returns the parameter of the point on the intersection line. if the points does not belong to an intersection line, the value returned does not have any sens.
") ParameterOnLine;
		Standard_Real ParameterOnLine();

		/****************** Parameters ******************/
		/**** md5 signature: 27c7f851c77cf6105be13a7890f1f0e0 ****/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "
Parameters
----------

Return
-------
U1: float
V1: float

Description
-----------
Returns the parameters on the surface of the point.
") Parameters;
		void Parameters(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** SetArc ******************/
		/**** md5 signature: ceabf78102f113c25de4b4f678682f05 ****/
		%feature("compactdefaultargs") SetArc;
		%feature("autodoc", "
Parameters
----------
A: Adaptor2d_Curve2d
Param: float
TLine: IntSurf_Transition
TArc: IntSurf_Transition

Return
-------
None

Description
-----------
Sets the value of the arc and of the parameter on this arc of the point.
") SetArc;
		void SetArc(const opencascade::handle<Adaptor2d_Curve2d> & A, const Standard_Real Param, const IntSurf_Transition & TLine, const IntSurf_Transition & TArc);

		/****************** SetInternal ******************/
		/**** md5 signature: f29227e746cced65920ee7fe48924495 ****/
		%feature("compactdefaultargs") SetInternal;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") SetInternal;
		void SetInternal();

		/****************** SetMultiple ******************/
		/**** md5 signature: 1ac6220c2c8c7b2e4c947976b7d1c954 ****/
		%feature("compactdefaultargs") SetMultiple;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") SetMultiple;
		void SetMultiple();

		/****************** SetParameter ******************/
		/**** md5 signature: 9c20628bfb58eb45593287ce353000c6 ****/
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "
Parameters
----------
Para: float

Return
-------
None

Description
-----------
Set the value of the parameter on the intersection line.
") SetParameter;
		void SetParameter(const Standard_Real Para);

		/****************** SetValue ******************/
		/**** md5 signature: c88313e81258115c4934b9fff4b38a78 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
Pt: gp_Pnt
U: float
V: float

Return
-------
None

Description
-----------
Sets the values for a point.
") SetValue;
		void SetValue(const gp_Pnt & Pt, const Standard_Real U, const Standard_Real V);

		/****************** SetVertex ******************/
		/**** md5 signature: 1c2d847f9895dadcabe6f5a142550e35 ****/
		%feature("compactdefaultargs") SetVertex;
		%feature("autodoc", "
Parameters
----------
V: Adaptor3d_HVertex

Return
-------
None

Description
-----------
Sets the values of a point which is a vertex on the initial facet of restriction of one of the surface.
") SetVertex;
		void SetVertex(const opencascade::handle<Adaptor3d_HVertex> & V);

		/****************** TransitionOnArc ******************/
		/**** md5 signature: adc9ee508ec8cbe59ce8b05248cd454a ****/
		%feature("compactdefaultargs") TransitionOnArc;
		%feature("autodoc", "Return
-------
IntSurf_Transition

Description
-----------
Returns the transition of the point on the arc.
") TransitionOnArc;
		const IntSurf_Transition & TransitionOnArc();

		/****************** TransitionOnLine ******************/
		/**** md5 signature: 1ffbcf064eb110daaac7ceebff0fcde5 ****/
		%feature("compactdefaultargs") TransitionOnLine;
		%feature("autodoc", "Return
-------
IntSurf_Transition

Description
-----------
Returns the transition of the point on the contour.
") TransitionOnLine;
		const IntSurf_Transition & TransitionOnLine();

		/****************** Value ******************/
		/**** md5 signature: eddd2908948849b73f6d8aacab318652 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the intersection point (geometric information).
") Value;
		const gp_Pnt Value();

		/****************** Vertex ******************/
		/**** md5 signature: 7213fb18dc3be1f48818ab739bb98dfa ****/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_HVertex>

Description
-----------
Returns the information about the point when it is on the domain of the patch, i-e when the function isvertex returns true. otherwise, an exception is raised.
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
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Contap_SurfFunction;
		 Contap_SurfFunction();

		/****************** Angle ******************/
		/**** md5 signature: dce50192c350c43b54f2e88e94e5372a ****/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Angle;
		Standard_Real Angle();

		/****************** Derivatives ******************/
		/**** md5 signature: 80ee5f16e62731c095910ad60228848b ****/
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
The dimension of d is (1,2).
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** Direction ******************/
		/**** md5 signature: 6107c9113155a9ae9007c5c8e526a738 ****/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
No available documentation.
") Direction;
		const gp_Dir Direction();

		/****************** Direction2d ******************/
		/**** md5 signature: e46e583c3b745511fb8654831bfa19d7 ****/
		%feature("compactdefaultargs") Direction2d;
		%feature("autodoc", "Return
-------
gp_Dir2d

Description
-----------
No available documentation.
") Direction2d;
		const gp_Dir2d Direction2d();

		/****************** Direction3d ******************/
		/**** md5 signature: ceda05eba57d20f6f3ce262f42faf157 ****/
		%feature("compactdefaultargs") Direction3d;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") Direction3d;
		const gp_Vec Direction3d();

		/****************** Eye ******************/
		/**** md5 signature: aa99970f6e90715f8213e1ab0b8ace3e ****/
		%feature("compactdefaultargs") Eye;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Eye;
		const gp_Pnt Eye();

		/****************** FunctionType ******************/
		/**** md5 signature: be07ad13be6828eeadd86e0c10f87452 ****/
		%feature("compactdefaultargs") FunctionType;
		%feature("autodoc", "Return
-------
Contap_TFunction

Description
-----------
No available documentation.
") FunctionType;
		Contap_TFunction FunctionType();

		/****************** IsTangent ******************/
		/**** md5 signature: 52337431677eb50512a9391c1db95a81 ****/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsTangent;
		Standard_Boolean IsTangent();

		/****************** NbEquations ******************/
		/**** md5 signature: 42be0dc2e32c8e563393e8490171707e ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
This method has to return 1.
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbVariables ******************/
		/**** md5 signature: a3de6b8a577fc113199e11b2b0bcdced ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
This method has to return 2.
") NbVariables;
		Standard_Integer NbVariables();

		/****************** PSurface ******************/
		/**** md5 signature: e04a186cf5fc0c76577d479297dac08c ****/
		%feature("compactdefaultargs") PSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
Method is entered for compatibility with intpatch_thesurffunction.
") PSurface;
		const opencascade::handle<Adaptor3d_Surface> & PSurface();

		/****************** Point ******************/
		/**** md5 signature: 177e376cc11d1fedb2819bac56591ea8 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the value of the solution point on the surface.
") Point;
		const gp_Pnt Point();

		/****************** Root ******************/
		/**** md5 signature: 1f1a437be6bd034392962de6cf04ded1 ****/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Return
-------
float

Description
-----------
Root is the value of the function at the solution. it is a vector of dimension 1, i-e a real.
") Root;
		Standard_Real Root();

		/****************** Set ******************/
		/**** md5 signature: fe1f4e54b6d838c88f545f7975616591 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const opencascade::handle<Adaptor3d_Surface> & S);

		/****************** Set ******************/
		/**** md5 signature: 82e61fcbcd023e361c983ac9b10b051a ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Eye: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const gp_Pnt & Eye);

		/****************** Set ******************/
		/**** md5 signature: 15b1468c79fc4757515151f835f2d3d0 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Dir: gp_Dir

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const gp_Dir & Dir);

		/****************** Set ******************/
		/**** md5 signature: a5b90781feaa7ec1e0840ad075ed12d1 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Dir: gp_Dir
Angle: float

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const gp_Dir & Dir, const Standard_Real Angle);

		/****************** Set ******************/
		/**** md5 signature: df4b9353625a35b43eacf0999ffe2b0e ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Eye: gp_Pnt
Angle: float

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const gp_Pnt & Eye, const Standard_Real Angle);

		/****************** Set ******************/
		/**** md5 signature: 7e3e1092ebe5da1f71e965a1091893e3 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Tolerance: float

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const Standard_Real Tolerance);

		/****************** Surface ******************/
		/**** md5 signature: d36dc8d293d03901e5a1cace2e167115 ****/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
No available documentation.
") Surface;
		const opencascade::handle<Adaptor3d_Surface> & Surface();

		/****************** Tolerance ******************/
		/**** md5 signature: 9e5775014410d884d1a1adc1cd47930b ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value tol so that if abs(func.root())<tol the function is considered null.
") Tolerance;
		Standard_Real Tolerance();

		/****************** Value ******************/
		/**** md5 signature: 31f6ba581b8fae503400d98976418349 ****/
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
The dimension of f is 1.
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****************** Values ******************/
		/**** md5 signature: 17c41f2c2b925e9ddfe2f61a9052313c ****/
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
No available documentation.
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
		/**** md5 signature: 494f3cc4dc053a12120899c5b844eaeb ****/
		%feature("compactdefaultargs") DerivAndNorm;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
U: float
V: float
P: gp_Pnt
d1u: gp_Vec
d1v: gp_Vec
N: gp_Vec

Return
-------
None

Description
-----------
Computes the point <p>, and normal vector <n> on <s> at parameters u,v.
") DerivAndNorm;
		static void DerivAndNorm(const opencascade::handle<Adaptor3d_Surface> & S, const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & d1u, gp_Vec & d1v, gp_Vec & N);

		/****************** NormAndDn ******************/
		/**** md5 signature: 7ef18f7af52a8716166a07f9a349d010 ****/
		%feature("compactdefaultargs") NormAndDn;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
U: float
V: float
P: gp_Pnt
N: gp_Vec
Dnu: gp_Vec
Dnv: gp_Vec

Return
-------
None

Description
-----------
Computes the point <p>, normal vector <n>, and its derivatives <dnu> and <dnv> on <s> at parameters u,v.
") NormAndDn;
		static void NormAndDn(const opencascade::handle<Adaptor3d_Surface> & S, const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & N, gp_Vec & Dnu, gp_Vec & Dnv);

		/****************** Normale ******************/
		/**** md5 signature: b3f97a0775cb34601ed9b104b4252c02 ****/
		%feature("compactdefaultargs") Normale;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
U: float
V: float
P: gp_Pnt
N: gp_Vec

Return
-------
None

Description
-----------
Computes the point <p>, and normal vector <n> on <s> at parameters u,v.
") Normale;
		static void Normale(const opencascade::handle<Adaptor3d_Surface> & S, const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & N);

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
		%feature("autodoc", "
Parameters
----------
theAllocator: IntSurf_Allocator (optional, default to 0)

Return
-------
None

Description
-----------
No available documentation.
") Contap_TheIWLineOfTheIWalking;
		 Contap_TheIWLineOfTheIWalking(const IntSurf_Allocator & theAllocator = 0);

		/****************** AddIndexPassing ******************/
		/**** md5 signature: 5211f3a2dbfeb4744c3451bde1b6a45c ****/
		%feature("compactdefaultargs") AddIndexPassing;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
None

Description
-----------
Associer a l 'indice du point sur la ligne l'indice du point passant dans l'iterateur de depart.
") AddIndexPassing;
		void AddIndexPassing(const Standard_Integer Index);

		/****************** AddPoint ******************/
		/**** md5 signature: 806b6da489848ff70e42ef52b8d76d5c ****/
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "
Parameters
----------
P: IntSurf_PntOn2S

Return
-------
None

Description
-----------
Add a point in the line.
") AddPoint;
		void AddPoint(const IntSurf_PntOn2S & P);

		/****************** AddStatusFirst ******************/
		/**** md5 signature: 57c24fab44c44bc9f08fb80e64391777 ****/
		%feature("compactdefaultargs") AddStatusFirst;
		%feature("autodoc", "
Parameters
----------
Closed: bool
HasFirst: bool

Return
-------
None

Description
-----------
No available documentation.
") AddStatusFirst;
		void AddStatusFirst(const Standard_Boolean Closed, const Standard_Boolean HasFirst);

		/****************** AddStatusFirst ******************/
		/**** md5 signature: 3bcc39dd9b427e47834d54029a984cdb ****/
		%feature("compactdefaultargs") AddStatusFirst;
		%feature("autodoc", "
Parameters
----------
Closed: bool
HasLast: bool
Index: int
P: IntSurf_PathPoint

Return
-------
None

Description
-----------
No available documentation.
") AddStatusFirst;
		void AddStatusFirst(const Standard_Boolean Closed, const Standard_Boolean HasLast, const Standard_Integer Index, const IntSurf_PathPoint & P);

		/****************** AddStatusFirstLast ******************/
		/**** md5 signature: 9b5b9adcff3655cf97dda89c630e8677 ****/
		%feature("compactdefaultargs") AddStatusFirstLast;
		%feature("autodoc", "
Parameters
----------
Closed: bool
HasFirst: bool
HasLast: bool

Return
-------
None

Description
-----------
No available documentation.
") AddStatusFirstLast;
		void AddStatusFirstLast(const Standard_Boolean Closed, const Standard_Boolean HasFirst, const Standard_Boolean HasLast);

		/****************** AddStatusLast ******************/
		/**** md5 signature: 9df59b95ec4c6ad4a61e31770913147d ****/
		%feature("compactdefaultargs") AddStatusLast;
		%feature("autodoc", "
Parameters
----------
HasLast: bool

Return
-------
None

Description
-----------
No available documentation.
") AddStatusLast;
		void AddStatusLast(const Standard_Boolean HasLast);

		/****************** AddStatusLast ******************/
		/**** md5 signature: 9af95226c154f17c39d5609cdec7266e ****/
		%feature("compactdefaultargs") AddStatusLast;
		%feature("autodoc", "
Parameters
----------
HasLast: bool
Index: int
P: IntSurf_PathPoint

Return
-------
None

Description
-----------
No available documentation.
") AddStatusLast;
		void AddStatusLast(const Standard_Boolean HasLast, const Standard_Integer Index, const IntSurf_PathPoint & P);

		/****************** Cut ******************/
		/**** md5 signature: f0e9f7dd0e1c0316cdc67bc759be51c9 ****/
		%feature("compactdefaultargs") Cut;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
None

Description
-----------
Cut the line at the point of rank index.
") Cut;
		void Cut(const Standard_Integer Index);

		/****************** FirstPoint ******************/
		/**** md5 signature: e0c1dbe8c28165db2dbe2ecf721fcc02 ****/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Return
-------
IntSurf_PathPoint

Description
-----------
Returns the first point of the line when it is a marching point. an exception is raised if hasfirstpoint returns false.
") FirstPoint;
		const IntSurf_PathPoint & FirstPoint();

		/****************** FirstPointIndex ******************/
		/**** md5 signature: 286ccb2e16a94010c49f690b00f54ac3 ****/
		%feature("compactdefaultargs") FirstPointIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the index of first point of the line when it is a marching point.this index is the index in the pointstartiterator. an exception is raised if hasfirstpoint returns false.
") FirstPointIndex;
		Standard_Integer FirstPointIndex();

		/****************** HasFirstPoint ******************/
		/**** md5 signature: 76549d304d78c4a9c8d3c420139524d3 ****/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the first point of the line is a marching point . when is hasfirstpoint==false ,the line begins on the natural bound of the surface.the line can be too long.
") HasFirstPoint;
		Standard_Boolean HasFirstPoint();

		/****************** HasLastPoint ******************/
		/**** md5 signature: 66b261e1c2b182701ee59bfbc6bde915 ****/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the end point of the line is a marching point (point from intws). when is hasfirstpoint==false ,the line ends on the natural bound of the surface.the line can be too long.
") HasLastPoint;
		Standard_Boolean HasLastPoint();

		/****************** IsClosed ******************/
		/**** md5 signature: 29709d02fadc9fcb79a766bc9679271b ****/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the line is closed.
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsTangentAtBegining ******************/
		/**** md5 signature: a56d1f9469c98eadc8b6f319bc216c7b ****/
		%feature("compactdefaultargs") IsTangentAtBegining;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsTangentAtBegining;
		Standard_Boolean IsTangentAtBegining();

		/****************** IsTangentAtEnd ******************/
		/**** md5 signature: 105311500b205bba41fd4ab317165070 ****/
		%feature("compactdefaultargs") IsTangentAtEnd;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsTangentAtEnd;
		Standard_Boolean IsTangentAtEnd();

		/****************** LastPoint ******************/
		/**** md5 signature: 7876841b5cf564c633cdd87a1ac1e722 ****/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "Return
-------
IntSurf_PathPoint

Description
-----------
Returns the last point of the line when it is a marching point. an exception is raised if haslastpoint returns false.
") LastPoint;
		const IntSurf_PathPoint & LastPoint();

		/****************** LastPointIndex ******************/
		/**** md5 signature: 03702a2b3ccf8f424cd597daef257efb ****/
		%feature("compactdefaultargs") LastPointIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the index of last point of the line when it is a marching point.this index is the index in the pointstartiterator. an exception is raised if haslastpoint returns false.
") LastPointIndex;
		Standard_Integer LastPointIndex();

		/****************** Line ******************/
		/**** md5 signature: d5c2cd917d9e773fdb8b23c68d6a1fdc ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Return
-------
opencascade::handle<IntSurf_LineOn2S>

Description
-----------
Returns the lineon2s contained in the walking line.
") Line;
		const opencascade::handle<IntSurf_LineOn2S> & Line();

		/****************** NbPassingPoint ******************/
		/**** md5 signature: d0f6265bbd27e7d9360e0b1105cff054 ****/
		%feature("compactdefaultargs") NbPassingPoint;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of points belonging to pnts1 which are passing point.
") NbPassingPoint;
		Standard_Integer NbPassingPoint();

		/****************** NbPoints ******************/
		/**** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of points of the line (including first point and end point: see haslastpoint and hasfirstpoint).
") NbPoints;
		Standard_Integer NbPoints();

		/****************** PassingPoint ******************/
		/**** md5 signature: 1ecf07ef770669b4329e847aa98917ae ****/
		%feature("compactdefaultargs") PassingPoint;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IndexLine: int
IndexPnts: int

Description
-----------
Returns the index of the point belonging to the line which is associated to the passing point belonging to pnts1 an exception is raised if index > nbpassingpoint().
") PassingPoint;
		void PassingPoint(const Standard_Integer Index, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** Reverse ******************/
		/**** md5 signature: b751d6874fc026e19a7a6cb37e9ac1b4 ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverse the points in the line. hasfirst, haslast are kept.
") Reverse;
		void Reverse();

		/****************** SetTangencyAtBegining ******************/
		/**** md5 signature: ea533706f2c44ba6eebb50b37aa11bce ****/
		%feature("compactdefaultargs") SetTangencyAtBegining;
		%feature("autodoc", "
Parameters
----------
IsTangent: bool

Return
-------
None

Description
-----------
No available documentation.
") SetTangencyAtBegining;
		void SetTangencyAtBegining(const Standard_Boolean IsTangent);

		/****************** SetTangencyAtEnd ******************/
		/**** md5 signature: e69c7af21e7cb5c30f8431e2a8de655b ****/
		%feature("compactdefaultargs") SetTangencyAtEnd;
		%feature("autodoc", "
Parameters
----------
IsTangent: bool

Return
-------
None

Description
-----------
No available documentation.
") SetTangencyAtEnd;
		void SetTangencyAtEnd(const Standard_Boolean IsTangent);

		/****************** SetTangentVector ******************/
		/**** md5 signature: 0e32ea065ed79437c3090e852108262e ****/
		%feature("compactdefaultargs") SetTangentVector;
		%feature("autodoc", "
Parameters
----------
V: gp_Vec
Index: int

Return
-------
None

Description
-----------
No available documentation.
") SetTangentVector;
		void SetTangentVector(const gp_Vec & V, const Standard_Integer Index);

		/****************** TangentVector ******************/
		/**** md5 signature: e2d9d7aae22a66c0f8d3bfaf92d891c0 ****/
		%feature("compactdefaultargs") TangentVector;
		%feature("autodoc", "
Parameters
----------

Return
-------
Index: int

Description
-----------
No available documentation.
") TangentVector;
		const gp_Vec TangentVector(Standard_Integer &OutValue);

		/****************** Value ******************/
		/**** md5 signature: 8dd9e41f579d9d6e26d29bbd4f60e2b9 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IntSurf_PntOn2S

Description
-----------
Returns the point of range index. if index <= 0 or index > nbpoints, an exception is raised.
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
		%feature("autodoc", "
Parameters
----------
Epsilon: float
Deflection: float
Step: float
theToFillHoles: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Deflection is the maximum deflection admitted between two consecutive points on a resulting polyline. step is the maximum increment admitted between two consecutive points (in 2d space). epsilon is the tolerance beyond which 2 points are confused. thetofillholes is the flag defining whether possible holes between resulting curves are filled or not in case of contap walking thetofillholes is true.
") Contap_TheIWalking;
		 Contap_TheIWalking(const Standard_Real Epsilon, const Standard_Real Deflection, const Standard_Real Step, const Standard_Boolean theToFillHoles = Standard_False);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the calculus was successful.
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbLines ******************/
		/**** md5 signature: 4f8001fdc02f82f8f981f090a37ac7d4 ****/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of resulting polylines. an exception is raised if isdone returns false.
") NbLines;
		Standard_Integer NbLines();

		/****************** NbSinglePnts ******************/
		/**** md5 signature: 8a33644475ee84e2750fa4624ebcf8c0 ****/
		%feature("compactdefaultargs") NbSinglePnts;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of points belonging to pnts on which no line starts or ends. an exception is raised if isdone returns false.
") NbSinglePnts;
		Standard_Integer NbSinglePnts();

		/****************** Perform ******************/
		/**** md5 signature: 6ee1d46056a60420bd507e5e36581550 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Pnts1: IntSurf_SequenceOfPathPoint
Pnts2: IntSurf_SequenceOfInteriorPoint
Func: Contap_SurfFunction
S: Adaptor3d_Surface
Reversed: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Searches a set of polylines starting on a point of pnts1 or pnts2. each point on a resulting polyline verifies f(u,v)=0.
") Perform;
		void Perform(const IntSurf_SequenceOfPathPoint & Pnts1, const IntSurf_SequenceOfInteriorPoint & Pnts2, Contap_SurfFunction & Func, const opencascade::handle<Adaptor3d_Surface> & S, const Standard_Boolean Reversed = Standard_False);

		/****************** Perform ******************/
		/**** md5 signature: 93b19c25eeba3691dea16acebbbf8ef7 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Pnts1: IntSurf_SequenceOfPathPoint
Func: Contap_SurfFunction
S: Adaptor3d_Surface
Reversed: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Searches a set of polylines starting on a point of pnts1. each point on a resulting polyline verifies f(u,v)=0.
") Perform;
		void Perform(const IntSurf_SequenceOfPathPoint & Pnts1, Contap_SurfFunction & Func, const opencascade::handle<Adaptor3d_Surface> & S, const Standard_Boolean Reversed = Standard_False);

		/****************** SetTolerance ******************/
		/**** md5 signature: 081b0efb39976d786ea1e8e9992511b4 ****/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
Epsilon: float
Deflection: float
Step: float

Return
-------
None

Description
-----------
Deflection is the maximum deflection admitted between two consecutive points on a resulting polyline. step is the maximum increment admitted between two consecutive points (in 2d space). epsilon is the tolerance beyond which 2 points are confused.
") SetTolerance;
		void SetTolerance(const Standard_Real Epsilon, const Standard_Real Deflection, const Standard_Real Step);

		/****************** SinglePnt ******************/
		/**** md5 signature: 6dd92e40051e4e916aa83e976db4a997 ****/
		%feature("compactdefaultargs") SinglePnt;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IntSurf_PathPoint

Description
-----------
Returns the point of range index . an exception is raised if isdone returns false. an exception is raised if index<=0 or index > nbsinglepnts.
") SinglePnt;
		const IntSurf_PathPoint & SinglePnt(const Standard_Integer Index);

		/****************** Value ******************/
		/**** md5 signature: 71e95ff141784c73dc31a05edff86b0b ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<Contap_TheIWLineOfTheIWalking>

Description
-----------
Returns the polyline of range index. an exception is raised if isdone is false. an exception is raised if index<=0 or index>nblines.
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
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Contap_ThePathPointOfTheSearch;
		 Contap_ThePathPointOfTheSearch();

		/****************** Contap_ThePathPointOfTheSearch ******************/
		/**** md5 signature: 84947d4a9220cf3839150816fa8ebebf ****/
		%feature("compactdefaultargs") Contap_ThePathPointOfTheSearch;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
Tol: float
V: Adaptor3d_HVertex
A: Adaptor2d_Curve2d
Parameter: float

Return
-------
None

Description
-----------
No available documentation.
") Contap_ThePathPointOfTheSearch;
		 Contap_ThePathPointOfTheSearch(const gp_Pnt & P, const Standard_Real Tol, const opencascade::handle<Adaptor3d_HVertex> & V, const opencascade::handle<Adaptor2d_Curve2d> & A, const Standard_Real Parameter);

		/****************** Contap_ThePathPointOfTheSearch ******************/
		/**** md5 signature: 131c6fd3d17dfa54a07c3c9a5ab67447 ****/
		%feature("compactdefaultargs") Contap_ThePathPointOfTheSearch;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
Tol: float
A: Adaptor2d_Curve2d
Parameter: float

Return
-------
None

Description
-----------
No available documentation.
") Contap_ThePathPointOfTheSearch;
		 Contap_ThePathPointOfTheSearch(const gp_Pnt & P, const Standard_Real Tol, const opencascade::handle<Adaptor2d_Curve2d> & A, const Standard_Real Parameter);

		/****************** Arc ******************/
		/**** md5 signature: de8e47510fc50811ee5a3e0bc98029e6 ****/
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
No available documentation.
") Arc;
		const opencascade::handle<Adaptor2d_Curve2d> & Arc();

		/****************** IsNew ******************/
		/**** md5 signature: 3a3a8bc6ebd2fc2c25f224ff9e99af70 ****/
		%feature("compactdefaultargs") IsNew;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsNew;
		Standard_Boolean IsNew();

		/****************** Parameter ******************/
		/**** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Parameter;
		Standard_Real Parameter();

		/****************** SetValue ******************/
		/**** md5 signature: 03dce41028774d848e3e96d2ef0ca499 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
Tol: float
V: Adaptor3d_HVertex
A: Adaptor2d_Curve2d
Parameter: float

Return
-------
None

Description
-----------
No available documentation.
") SetValue;
		void SetValue(const gp_Pnt & P, const Standard_Real Tol, const opencascade::handle<Adaptor3d_HVertex> & V, const opencascade::handle<Adaptor2d_Curve2d> & A, const Standard_Real Parameter);

		/****************** SetValue ******************/
		/**** md5 signature: a4bb4cd1b8bb6bbe4fb31de340a9931c ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
Tol: float
A: Adaptor2d_Curve2d
Parameter: float

Return
-------
None

Description
-----------
No available documentation.
") SetValue;
		void SetValue(const gp_Pnt & P, const Standard_Real Tol, const opencascade::handle<Adaptor2d_Curve2d> & A, const Standard_Real Parameter);

		/****************** Tolerance ******************/
		/**** md5 signature: 9e5775014410d884d1a1adc1cd47930b ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Tolerance;
		Standard_Real Tolerance();

		/****************** Value ******************/
		/**** md5 signature: eddd2908948849b73f6d8aacab318652 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Value;
		const gp_Pnt Value();

		/****************** Vertex ******************/
		/**** md5 signature: 7213fb18dc3be1f48818ab739bb98dfa ****/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_HVertex>

Description
-----------
No available documentation.
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
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Contap_TheSearch;
		 Contap_TheSearch();

		/****************** AllArcSolution ******************/
		/**** md5 signature: fd074d16584452fef4f16b506eae3de1 ****/
		%feature("compactdefaultargs") AllArcSolution;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if all arc of the arcs are solution (inside the surface). an exception is raised if isdone returns false.
") AllArcSolution;
		Standard_Boolean AllArcSolution();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the calculus was successful.
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbPoints ******************/
		/**** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of resulting points. an exception is raised if isdone returns false (notdone).
") NbPoints;
		Standard_Integer NbPoints();

		/****************** NbSegments ******************/
		/**** md5 signature: 6791e2039921b3bb6b2ff0f8e741d76b ****/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of the resulting segments. an exception is raised if isdone returns false (notdone).
") NbSegments;
		Standard_Integer NbSegments();

		/****************** Perform ******************/
		/**** md5 signature: bd400ef409e0f615858d49e533cc7623 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
F: Contap_ArcFunction
Domain: Adaptor3d_TopolTool
TolBoundary: float
TolTangency: float
RecheckOnRegularity: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Algorithm to find the points and parts of curves of domain (domain of of restriction of a surface) which verify f = 0. tolboundary defines if a curve is on q. toltangency defines if a point is on q.
") Perform;
		void Perform(Contap_ArcFunction & F, const opencascade::handle<Adaptor3d_TopolTool> & Domain, const Standard_Real TolBoundary, const Standard_Real TolTangency, const Standard_Boolean RecheckOnRegularity = Standard_False);

		/****************** Point ******************/
		/**** md5 signature: 42cacb4a4712c4ca6505f55590e76eeb ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
Contap_ThePathPointOfTheSearch

Description
-----------
Returns the resulting point of range index. the exception notdone is raised if isdone() returns false. the exception outofrange is raised if index <= 0 or index > nbpoints.
") Point;
		const Contap_ThePathPointOfTheSearch & Point(const Standard_Integer Index);

		/****************** Segment ******************/
		/**** md5 signature: 63b49e816a04d69ef4920a463a3974dc ****/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
Contap_TheSegmentOfTheSearch

Description
-----------
Returns the resulting segment of range index. the exception notdone is raised if isdone() returns false. the exception outofrange is raised if index <= 0 or index > nbpoints.
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
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Contap_TheSearchInside;
		 Contap_TheSearchInside();

		/****************** Contap_TheSearchInside ******************/
		/**** md5 signature: be026f64fb11d6b5faa1920177122e51 ****/
		%feature("compactdefaultargs") Contap_TheSearchInside;
		%feature("autodoc", "
Parameters
----------
F: Contap_SurfFunction
Surf: Adaptor3d_Surface
T: Adaptor3d_TopolTool
Epsilon: float

Return
-------
None

Description
-----------
No available documentation.
") Contap_TheSearchInside;
		 Contap_TheSearchInside(Contap_SurfFunction & F, const opencascade::handle<Adaptor3d_Surface> & Surf, const opencascade::handle<Adaptor3d_TopolTool> & T, const Standard_Real Epsilon);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbPoints ******************/
		/**** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of points. the exception notdone if raised if isdone returns false.
") NbPoints;
		Standard_Integer NbPoints();

		/****************** Perform ******************/
		/**** md5 signature: e2775fe4590ca17de96cf8a00b01ec25 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
F: Contap_SurfFunction
Surf: Adaptor3d_Surface
T: Adaptor3d_TopolTool
Epsilon: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(Contap_SurfFunction & F, const opencascade::handle<Adaptor3d_Surface> & Surf, const opencascade::handle<Adaptor3d_TopolTool> & T, const Standard_Real Epsilon);

		/****************** Perform ******************/
		/**** md5 signature: 50494323939fb97c348431e61a02fda6 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
F: Contap_SurfFunction
Surf: Adaptor3d_Surface
UStart: float
VStart: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(Contap_SurfFunction & F, const opencascade::handle<Adaptor3d_Surface> & Surf, const Standard_Real UStart, const Standard_Real VStart);

		/****************** Value ******************/
		/**** md5 signature: 32b603bd5d3112334230c3e7fbb789a7 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IntSurf_InteriorPoint

Description
-----------
Returns the point of range index. the exception notdone if raised if isdone returns false. the exception outofrange if raised if index <= 0 or index > nbpoints.
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
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Contap_TheSegmentOfTheSearch;
		 Contap_TheSegmentOfTheSearch();

		/****************** Curve ******************/
		/**** md5 signature: 7869036a594a0e406162d60b4f92dc85 ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
Returns the geometric curve on the surface 's domain which is solution.
") Curve;
		const opencascade::handle<Adaptor2d_Curve2d> & Curve();

		/****************** FirstPoint ******************/
		/**** md5 signature: e40c5283a03725d6ebc8922755a1d1ca ****/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Return
-------
Contap_ThePathPointOfTheSearch

Description
-----------
Returns the first point.
") FirstPoint;
		const Contap_ThePathPointOfTheSearch & FirstPoint();

		/****************** HasFirstPoint ******************/
		/**** md5 signature: 76549d304d78c4a9c8d3c420139524d3 ****/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if there is a vertex (thepathpoint) defining the lowest valid parameter on the arc.
") HasFirstPoint;
		Standard_Boolean HasFirstPoint();

		/****************** HasLastPoint ******************/
		/**** md5 signature: 66b261e1c2b182701ee59bfbc6bde915 ****/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if there is a vertex (thepathpoint) defining the greatest valid parameter on the arc.
") HasLastPoint;
		Standard_Boolean HasLastPoint();

		/****************** LastPoint ******************/
		/**** md5 signature: 7278121f151ef35144b484648f11d70b ****/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "Return
-------
Contap_ThePathPointOfTheSearch

Description
-----------
Returns the last point.
") LastPoint;
		const Contap_ThePathPointOfTheSearch & LastPoint();

		/****************** SetLimitPoint ******************/
		/**** md5 signature: 652ce8c8bcf5a5337b319397afec1f06 ****/
		%feature("compactdefaultargs") SetLimitPoint;
		%feature("autodoc", "
Parameters
----------
V: Contap_ThePathPointOfTheSearch
First: bool

Return
-------
None

Description
-----------
Defines the first point or the last point, depending on the value of the boolean first.
") SetLimitPoint;
		void SetLimitPoint(const Contap_ThePathPointOfTheSearch & V, const Standard_Boolean First);

		/****************** SetValue ******************/
		/**** md5 signature: 53ce9238106071febf6db57a0ff8a99c ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
A: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
Defines the concerned arc.
") SetValue;
		void SetValue(const opencascade::handle<Adaptor2d_Curve2d> & A);

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


/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def Contap_HContTool_Bounds(*args):
	return Contap_HContTool.Bounds(*args)

@deprecated
def Contap_HContTool_HasBeenSeen(*args):
	return Contap_HContTool.HasBeenSeen(*args)

@deprecated
def Contap_HContTool_HasFirstPoint(*args):
	return Contap_HContTool.HasFirstPoint(*args)

@deprecated
def Contap_HContTool_HasLastPoint(*args):
	return Contap_HContTool.HasLastPoint(*args)

@deprecated
def Contap_HContTool_IsAllSolution(*args):
	return Contap_HContTool.IsAllSolution(*args)

@deprecated
def Contap_HContTool_IsVertex(*args):
	return Contap_HContTool.IsVertex(*args)

@deprecated
def Contap_HContTool_NbPoints(*args):
	return Contap_HContTool.NbPoints(*args)

@deprecated
def Contap_HContTool_NbSamplePoints(*args):
	return Contap_HContTool.NbSamplePoints(*args)

@deprecated
def Contap_HContTool_NbSamplesOnArc(*args):
	return Contap_HContTool.NbSamplesOnArc(*args)

@deprecated
def Contap_HContTool_NbSamplesU(*args):
	return Contap_HContTool.NbSamplesU(*args)

@deprecated
def Contap_HContTool_NbSamplesV(*args):
	return Contap_HContTool.NbSamplesV(*args)

@deprecated
def Contap_HContTool_NbSegments(*args):
	return Contap_HContTool.NbSegments(*args)

@deprecated
def Contap_HContTool_Parameter(*args):
	return Contap_HContTool.Parameter(*args)

@deprecated
def Contap_HContTool_Project(*args):
	return Contap_HContTool.Project(*args)

@deprecated
def Contap_HContTool_SamplePoint(*args):
	return Contap_HContTool.SamplePoint(*args)

@deprecated
def Contap_HContTool_Tolerance(*args):
	return Contap_HContTool.Tolerance(*args)

@deprecated
def Contap_HContTool_Value(*args):
	return Contap_HContTool.Value(*args)

@deprecated
def Contap_HContTool_Vertex(*args):
	return Contap_HContTool.Vertex(*args)

@deprecated
def Contap_HCurve2dTool_BSpline(*args):
	return Contap_HCurve2dTool.BSpline(*args)

@deprecated
def Contap_HCurve2dTool_Bezier(*args):
	return Contap_HCurve2dTool.Bezier(*args)

@deprecated
def Contap_HCurve2dTool_Circle(*args):
	return Contap_HCurve2dTool.Circle(*args)

@deprecated
def Contap_HCurve2dTool_Continuity(*args):
	return Contap_HCurve2dTool.Continuity(*args)

@deprecated
def Contap_HCurve2dTool_D0(*args):
	return Contap_HCurve2dTool.D0(*args)

@deprecated
def Contap_HCurve2dTool_D1(*args):
	return Contap_HCurve2dTool.D1(*args)

@deprecated
def Contap_HCurve2dTool_D2(*args):
	return Contap_HCurve2dTool.D2(*args)

@deprecated
def Contap_HCurve2dTool_D3(*args):
	return Contap_HCurve2dTool.D3(*args)

@deprecated
def Contap_HCurve2dTool_DN(*args):
	return Contap_HCurve2dTool.DN(*args)

@deprecated
def Contap_HCurve2dTool_Ellipse(*args):
	return Contap_HCurve2dTool.Ellipse(*args)

@deprecated
def Contap_HCurve2dTool_FirstParameter(*args):
	return Contap_HCurve2dTool.FirstParameter(*args)

@deprecated
def Contap_HCurve2dTool_GetType(*args):
	return Contap_HCurve2dTool.GetType(*args)

@deprecated
def Contap_HCurve2dTool_Hyperbola(*args):
	return Contap_HCurve2dTool.Hyperbola(*args)

@deprecated
def Contap_HCurve2dTool_Intervals(*args):
	return Contap_HCurve2dTool.Intervals(*args)

@deprecated
def Contap_HCurve2dTool_IsClosed(*args):
	return Contap_HCurve2dTool.IsClosed(*args)

@deprecated
def Contap_HCurve2dTool_IsPeriodic(*args):
	return Contap_HCurve2dTool.IsPeriodic(*args)

@deprecated
def Contap_HCurve2dTool_LastParameter(*args):
	return Contap_HCurve2dTool.LastParameter(*args)

@deprecated
def Contap_HCurve2dTool_Line(*args):
	return Contap_HCurve2dTool.Line(*args)

@deprecated
def Contap_HCurve2dTool_NbIntervals(*args):
	return Contap_HCurve2dTool.NbIntervals(*args)

@deprecated
def Contap_HCurve2dTool_NbSamples(*args):
	return Contap_HCurve2dTool.NbSamples(*args)

@deprecated
def Contap_HCurve2dTool_Parabola(*args):
	return Contap_HCurve2dTool.Parabola(*args)

@deprecated
def Contap_HCurve2dTool_Period(*args):
	return Contap_HCurve2dTool.Period(*args)

@deprecated
def Contap_HCurve2dTool_Resolution(*args):
	return Contap_HCurve2dTool.Resolution(*args)

@deprecated
def Contap_HCurve2dTool_Value(*args):
	return Contap_HCurve2dTool.Value(*args)

@deprecated
def Contap_SurfProps_DerivAndNorm(*args):
	return Contap_SurfProps.DerivAndNorm(*args)

@deprecated
def Contap_SurfProps_NormAndDn(*args):
	return Contap_SurfProps.NormAndDn(*args)

@deprecated
def Contap_SurfProps_Normale(*args):
	return Contap_SurfProps.Normale(*args)

}
