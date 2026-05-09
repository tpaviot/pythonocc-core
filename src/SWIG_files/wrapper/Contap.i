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
%define CONTAPDOCSTRING
"Contap module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_contap.html"
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
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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
/* end handles declaration */

/* templates */
%template(Contap_SequenceOfIWLineOfTheIWalking) NCollection_Sequence<opencascade::handle<Contap_TheIWLineOfTheIWalking>>;

%extend NCollection_Sequence<opencascade::handle<Contap_TheIWLineOfTheIWalking>> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(Contap_SequenceOfPathPointOfTheSearch) NCollection_Sequence<Contap_ThePathPointOfTheSearch>;

%extend NCollection_Sequence<Contap_ThePathPointOfTheSearch> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(Contap_SequenceOfSegmentOfTheSearch) NCollection_Sequence<Contap_TheSegmentOfTheSearch>;

%extend NCollection_Sequence<Contap_TheSegmentOfTheSearch> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(Contap_TheSequenceOfLine) NCollection_Sequence<Contap_Line>;

%extend NCollection_Sequence<Contap_Line> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(Contap_TheSequenceOfPoint) NCollection_Sequence<Contap_Point>;

%extend NCollection_Sequence<Contap_Point> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
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
typedef NCollection_HSequence<Contap_Point> Contap_TheHSequenceOfPoint;
typedef NCollection_Sequence<Contap_Line> Contap_TheSequenceOfLine;
typedef NCollection_Sequence<Contap_Point> Contap_TheSequenceOfPoint;
/* end typedefs declaration */

/***************************
* class Contap_ArcFunction *
***************************/
class Contap_ArcFunction : public math_FunctionWithDerivative {
	public:
		/****** Contap_ArcFunction::Contap_ArcFunction ******/
		/****** md5 signature: cece6392d8a41c80644c929adb23fb57 ******/
		%feature("compactdefaultargs") Contap_ArcFunction;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Contap_ArcFunction;
		 Contap_ArcFunction();

		/****** Contap_ArcFunction::Derivative ******/
		/****** md5 signature: 5b661e723f14c67a734d7bc68bb6cabf ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
D: double

Description
-----------
No available documentation.
") Derivative;
		bool Derivative(const double X, Standard_Real &OutValue);

		/****** Contap_ArcFunction::GetStateNumber ******/
		/****** md5 signature: 476bd80c2b35cb038599a2aed9b23901 ******/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") GetStateNumber;
		int GetStateNumber();

		/****** Contap_ArcFunction::LastComputedPoint ******/
		/****** md5 signature: 151ab65e948ef31dff9bbbd66f058a30 ******/
		%feature("compactdefaultargs") LastComputedPoint;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the point, which has been computed while the last calling Value() method.
") LastComputedPoint;
		const gp_Pnt LastComputedPoint();

		/****** Contap_ArcFunction::NbSamples ******/
		/****** md5 signature: 2fabaf64e989ab636a03df74249efff3 ******/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSamples;
		int NbSamples();

		/****** Contap_ArcFunction::Quadric ******/
		/****** md5 signature: 412540fe449bd77bf89b8085f1fe1701 ******/
		%feature("compactdefaultargs") Quadric;
		%feature("autodoc", "Return
-------
IntSurf_Quadric

Description
-----------
No available documentation.
") Quadric;
		const IntSurf_Quadric & Quadric();

		/****** Contap_ArcFunction::Set ******/
		/****** md5 signature: fe1f4e54b6d838c88f545f7975616591 ******/
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

		/****** Contap_ArcFunction::Set ******/
		/****** md5 signature: 7b60fb3b1252eb4013a37f792be86766 ******/
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

		/****** Contap_ArcFunction::Set ******/
		/****** md5 signature: 69df0c7212357f8a2474419850c6c89d ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Direction: gp_Dir
Angle: double

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const gp_Dir & Direction, const double Angle);

		/****** Contap_ArcFunction::Set ******/
		/****** md5 signature: 82e61fcbcd023e361c983ac9b10b051a ******/
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

		/****** Contap_ArcFunction::Set ******/
		/****** md5 signature: c7e2cf1c8992bd28326af14f206ae150 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Eye: gp_Pnt
Angle: double

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const gp_Pnt & Eye, const double Angle);

		/****** Contap_ArcFunction::Set ******/
		/****** md5 signature: 70ab888f546bf04b92c8032f862436af ******/
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

		/****** Contap_ArcFunction::Surface ******/
		/****** md5 signature: d36dc8d293d03901e5a1cace2e167115 ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
Returns mySurf field.
") Surface;
		const opencascade::handle<Adaptor3d_Surface> & Surface();

		/****** Contap_ArcFunction::Valpoint ******/
		/****** md5 signature: 99bddfd2a1889564e4bfb796166a1e65 ******/
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
		const gp_Pnt Valpoint(const int Index);

		/****** Contap_ArcFunction::Value ******/
		/****** md5 signature: 2fdd0f48acb4882f76bbbe432a18ac3a ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
F: double

Description
-----------
No available documentation.
") Value;
		bool Value(const double X, Standard_Real &OutValue);

		/****** Contap_ArcFunction::Values ******/
		/****** md5 signature: 44ea1ebbd1c996779e93f28435817e28 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
F: double
D: double

Description
-----------
No available documentation.
") Values;
		bool Values(const double X, Standard_Real &OutValue, Standard_Real &OutValue);

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
		/****** Contap_ContAna::Contap_ContAna ******/
		/****** md5 signature: 34b8def8c8965bff09152db88478f3eb ******/
		%feature("compactdefaultargs") Contap_ContAna;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Contap_ContAna;
		 Contap_ContAna();

		/****** Contap_ContAna::Circle ******/
		/****** md5 signature: cab8b08988d177bd7107adbbccc4ef89 ******/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "Return
-------
gp_Circ

Description
-----------
No available documentation.
") Circle;
		gp_Circ Circle();

		/****** Contap_ContAna::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		bool IsDone();

		/****** Contap_ContAna::Line ******/
		/****** md5 signature: 9c725dfb99f020e8cc40204ef0a64954 ******/
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
		gp_Lin Line(const int Index);

		/****** Contap_ContAna::NbContours ******/
		/****** md5 signature: 11609c642e8b34d8f3517006319efd9a ******/
		%feature("compactdefaultargs") NbContours;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbContours;
		int NbContours();

		/****** Contap_ContAna::Perform ******/
		/****** md5 signature: b9f75b8393c6cd183c564d2cf1768f58 ******/
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

		/****** Contap_ContAna::Perform ******/
		/****** md5 signature: 08063f611e14679dc774bac7369b9713 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S: gp_Sphere
D: gp_Dir
Ang: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Sphere & S, const gp_Dir & D, const double Ang);

		/****** Contap_ContAna::Perform ******/
		/****** md5 signature: 83e5be324f2e2c73bbe8c50fd37f8fc0 ******/
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

		/****** Contap_ContAna::Perform ******/
		/****** md5 signature: a11a7f0b0850419c1c57238048e54f31 ******/
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

		/****** Contap_ContAna::Perform ******/
		/****** md5 signature: 3ef92c02ba5db7aba46f916acfb9c37c ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Cylinder
D: gp_Dir
Ang: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Cylinder & C, const gp_Dir & D, const double Ang);

		/****** Contap_ContAna::Perform ******/
		/****** md5 signature: f7fbe617dc60d1ff7b48291ef8af9b77 ******/
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

		/****** Contap_ContAna::Perform ******/
		/****** md5 signature: 7412caececa5d30e287fc66233cf2264 ******/
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

		/****** Contap_ContAna::Perform ******/
		/****** md5 signature: 5badfb8b070c81e791babd78dd78ee99 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Cone
D: gp_Dir
Ang: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Cone & C, const gp_Dir & D, const double Ang);

		/****** Contap_ContAna::Perform ******/
		/****** md5 signature: 879c7165991c9f0ff7be8883e8f0e98c ******/
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

		/****** Contap_ContAna::TypeContour ******/
		/****** md5 signature: d3534623a7f7cecab5a391d5a853d774 ******/
		%feature("compactdefaultargs") TypeContour;
		%feature("autodoc", "Return
-------
GeomAbs_CurveType

Description
-----------
Returns GeomAbs_Line or GeomAbs_Circle, when IsDone() returns True.
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
		/****** Contap_Contour::Contap_Contour ******/
		/****** md5 signature: 32102b3b6d93dd029f6dde0e589735e0 ******/
		%feature("compactdefaultargs") Contap_Contour;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Contap_Contour;
		 Contap_Contour();

		/****** Contap_Contour::Contap_Contour ******/
		/****** md5 signature: bd91b0d3a8a64bcd82393bb6259770cf ******/
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

		/****** Contap_Contour::Contap_Contour ******/
		/****** md5 signature: b6b3ea85b4a576f4f1f7afea31a064fb ******/
		%feature("compactdefaultargs") Contap_Contour;
		%feature("autodoc", "
Parameters
----------
Direction: gp_Vec
Angle: double

Return
-------
None

Description
-----------
No available documentation.
") Contap_Contour;
		 Contap_Contour(const gp_Vec & Direction, const double Angle);

		/****** Contap_Contour::Contap_Contour ******/
		/****** md5 signature: a1d711354b1cae160e79b4e231bd07b4 ******/
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

		/****** Contap_Contour::Contap_Contour ******/
		/****** md5 signature: 25645dae103420d74f7a669531e03e3a ******/
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

		/****** Contap_Contour::Contap_Contour ******/
		/****** md5 signature: 7df75ba2211d26a5280b9d1d857063b7 ******/
		%feature("compactdefaultargs") Contap_Contour;
		%feature("autodoc", "
Parameters
----------
Surf: Adaptor3d_Surface
Domain: Adaptor3d_TopolTool
Direction: gp_Vec
Angle: double

Return
-------
None

Description
-----------
Creates the contour in a given direction.
") Contap_Contour;
		 Contap_Contour(const opencascade::handle<Adaptor3d_Surface> & Surf, const opencascade::handle<Adaptor3d_TopolTool> & Domain, const gp_Vec & Direction, const double Angle);

		/****** Contap_Contour::Contap_Contour ******/
		/****** md5 signature: 56cac3764cf1b3b815e5af09b9b8027c ******/
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

		/****** Contap_Contour::Init ******/
		/****** md5 signature: deab7f18a5b73dea8633b272c74ec953 ******/
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

		/****** Contap_Contour::Init ******/
		/****** md5 signature: 9a32bd62b7baf2d28105d6d32241ed78 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Direction: gp_Vec
Angle: double

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const gp_Vec & Direction, const double Angle);

		/****** Contap_Contour::Init ******/
		/****** md5 signature: 44a2c71985162287cc60ada71418f1d1 ******/
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

		/****** Contap_Contour::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		bool IsDone();

		/****** Contap_Contour::IsEmpty ******/
		/****** md5 signature: 03c43b1186186edcd7d757f16ac1f505 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the is no line.
") IsEmpty;
		bool IsEmpty();

		/****** Contap_Contour::Line ******/
		/****** md5 signature: 4bc62d88197df62197964787a684cb0a ******/
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
		const Contap_Line & Line(const int Index);

		/****** Contap_Contour::NbLines ******/
		/****** md5 signature: 7c1b53177daa19e8eec95fb1ac3b65c8 ******/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbLines;
		int NbLines();

		/****** Contap_Contour::Perform ******/
		/****** md5 signature: f325c0d93f36bc064924753d683f809a ******/
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

		/****** Contap_Contour::Perform ******/
		/****** md5 signature: 0b4fd3b0fec6772a0904131288cdfdd2 ******/
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

		/****** Contap_Contour::Perform ******/
		/****** md5 signature: 79e4f89d4d2b34f35cbc56e9c90abdda ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Surf: Adaptor3d_Surface
Domain: Adaptor3d_TopolTool
Direction: gp_Vec
Angle: double

Return
-------
None

Description
-----------
Creates the contour in a given direction.
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Surface> & Surf, const opencascade::handle<Adaptor3d_TopolTool> & Domain, const gp_Vec & Direction, const double Angle);

		/****** Contap_Contour::Perform ******/
		/****** md5 signature: 1211ae19df2ef1905fcbbf0375510d47 ******/
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

		/****** Contap_Contour::SurfaceFunction ******/
		/****** md5 signature: 4a38b2f929c85d9d66c55cb5e593a36b ******/
		%feature("compactdefaultargs") SurfaceFunction;
		%feature("autodoc", "Return
-------
Contap_SurfFunction

Description
-----------
Returns a reference on the internal SurfaceFunction. This is used to compute tangents on the lines.
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
		/****** Contap_HContTool::Bounds ******/
		/****** md5 signature: 07986cc0e0af847c43b39e0235c77229 ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
Ufirst: double
Ulast: double

Description
-----------
Returns the parametric limits on the arc C. These limits must be finite: they are either the real limits of the arc, for a finite arc, or a bounding box for an infinite arc.
") Bounds;
		static void Bounds(const opencascade::handle<Adaptor2d_Curve2d> & C, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Contap_HContTool::HasBeenSeen ******/
		/****** md5 signature: 44bbf4fbff6c28b3475ddb0f3449c036 ******/
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
Returns True if all the intersection point and edges are known on the Arc. The intersection point are given as vertices. The intersection edges are given as intervals between two vertices.
") HasBeenSeen;
		static bool HasBeenSeen(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** Contap_HContTool::HasFirstPoint ******/
		/****** md5 signature: 360ca3bc3b2f75f5e2f258b2876ce518 ******/
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
Returns True when the segment of range Index is not open at the left side. In that case, IndFirst is the range in the list intersection points (see NbPoints) of the one which defines the left bound of the segment. Otherwise, the method has to return False, and IndFirst has no meaning.
") HasFirstPoint;
		static bool HasFirstPoint(const opencascade::handle<Adaptor2d_Curve2d> & C, const int Index, Standard_Integer &OutValue);

		/****** Contap_HContTool::HasLastPoint ******/
		/****** md5 signature: 91704bbc1a9ed32af7a65ea023df717b ******/
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
Returns True when the segment of range Index is not open at the right side. In that case, IndLast is the range in the list intersection points (see NbPoints) of the one which defines the right bound of the segment. Otherwise, the method has to return False, and IndLast has no meaning.
") HasLastPoint;
		static bool HasLastPoint(const opencascade::handle<Adaptor2d_Curve2d> & C, const int Index, Standard_Integer &OutValue);

		/****** Contap_HContTool::IsAllSolution ******/
		/****** md5 signature: e7a3425bf7c6c5a502fec8afcc168f27 ******/
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
Returns True when the whole restriction is solution of the intersection problem.
") IsAllSolution;
		static bool IsAllSolution(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** Contap_HContTool::IsVertex ******/
		/****** md5 signature: d6d7896c9b46a0a6b548ec3ad2a4cdcc ******/
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
Returns True if the intersection point of range Index corresponds with a vertex on the arc A.
") IsVertex;
		static bool IsVertex(const opencascade::handle<Adaptor2d_Curve2d> & C, const int Index);

		/****** Contap_HContTool::NbPoints ******/
		/****** md5 signature: c43cb411d56d25ce2289f3e953f120ca ******/
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
Returns the number of intersection points on the arc A.
") NbPoints;
		static int NbPoints(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** Contap_HContTool::NbSamplePoints ******/
		/****** md5 signature: 091738e72d53a2f3368b94c66cc97a04 ******/
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
		static int NbSamplePoints(const opencascade::handle<Adaptor3d_Surface> & S);

		/****** Contap_HContTool::NbSamplesOnArc ******/
		/****** md5 signature: 0b53e931233dc5eb5aa65c4f03845afa ******/
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
returns the number of points which is used to make a sample on the arc. this number is a function of the Surface and the CurveOnSurface complexity.
") NbSamplesOnArc;
		static int NbSamplesOnArc(const opencascade::handle<Adaptor2d_Curve2d> & A);

		/****** Contap_HContTool::NbSamplesU ******/
		/****** md5 signature: 113907439d309bff36ab3cf1a00b7ae6 ******/
		%feature("compactdefaultargs") NbSamplesU;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
u1: double
u2: double

Return
-------
int

Description
-----------
No available documentation.
") NbSamplesU;
		static int NbSamplesU(const opencascade::handle<Adaptor3d_Surface> & S, const double u1, const double u2);

		/****** Contap_HContTool::NbSamplesV ******/
		/****** md5 signature: 42faef83bc52935522b9fdcc450fc180 ******/
		%feature("compactdefaultargs") NbSamplesV;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
v1: double
v2: double

Return
-------
int

Description
-----------
No available documentation.
") NbSamplesV;
		static int NbSamplesV(const opencascade::handle<Adaptor3d_Surface> & S, const double v1, const double v2);

		/****** Contap_HContTool::NbSegments ******/
		/****** md5 signature: 144290e30d5b239e3af183aa76065809 ******/
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
returns the number of part of A solution of the of intersection problem.
") NbSegments;
		static int NbSegments(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** Contap_HContTool::Parameter ******/
		/****** md5 signature: 6593de7f4de76920e836e4d4047f9327 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
V: Adaptor3d_HVertex
C: Adaptor2d_Curve2d

Return
-------
double

Description
-----------
Returns the parameter of the vertex V on the arc A.
") Parameter;
		static double Parameter(const opencascade::handle<Adaptor3d_HVertex> & V, const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** Contap_HContTool::Project ******/
		/****** md5 signature: de37e061758c52b426c6f7fc05237d2b ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
P: gp_Pnt2d
Ptproj: gp_Pnt2d

Return
-------
Paramproj: double

Description
-----------
Projects the point P on the arc C. If the methods returns true, the projection is successful, and Paramproj is the parameter on the arc of the projected point, Ptproj is the projected Point. If the method returns false, Param proj and Ptproj are not significant.
") Project;
		static bool Project(const opencascade::handle<Adaptor2d_Curve2d> & C, const gp_Pnt2d & P, Standard_Real &OutValue, gp_Pnt2d & Ptproj);

		/****** Contap_HContTool::SamplePoint ******/
		/****** md5 signature: c5f658a372c7c8447f6037f006facbdc ******/
		%feature("compactdefaultargs") SamplePoint;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
Index: int

Return
-------
U: double
V: double

Description
-----------
No available documentation.
") SamplePoint;
		static void SamplePoint(const opencascade::handle<Adaptor3d_Surface> & S, const int Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Contap_HContTool::Tolerance ******/
		/****** md5 signature: beb7b43970562219d76d014b4930500a ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "
Parameters
----------
V: Adaptor3d_HVertex
C: Adaptor2d_Curve2d

Return
-------
double

Description
-----------
Returns the parametric tolerance used to consider that the vertex and another point meet, i-e if std::abs(parameter(Vertex) - parameter(OtherPnt))<= Tolerance, the points are 'merged'.
") Tolerance;
		static double Tolerance(const opencascade::handle<Adaptor3d_HVertex> & V, const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** Contap_HContTool::Value ******/
		/****** md5 signature: 72d5dd4b5c066803b5473cc3246c3937 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
Index: int
Pt: gp_Pnt

Return
-------
Tol: double
U: double

Description
-----------
Returns the value (Pt), the tolerance (Tol), and the parameter (U) on the arc A , of the intersection point of range Index.
") Value;
		static void Value(const opencascade::handle<Adaptor2d_Curve2d> & C, const int Index, gp_Pnt & Pt, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Contap_HContTool::Vertex ******/
		/****** md5 signature: a4c82e9cd894b1e9d2cd8b98c44bfb71 ******/
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
When IsVertex returns True, this method returns the vertex on the arc A.
") Vertex;
		static void Vertex(const opencascade::handle<Adaptor2d_Curve2d> & C, const int Index, opencascade::handle<Adaptor3d_HVertex> & V);

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
		/****** Contap_HCurve2dTool::BSpline ******/
		/****** md5 signature: 1151b84776305bc0a5c8aaee6f50252d ******/
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

		/****** Contap_HCurve2dTool::Bezier ******/
		/****** md5 signature: 55afc4c0fc79e07de6077214558af461 ******/
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

		/****** Contap_HCurve2dTool::Circle ******/
		/****** md5 signature: 3e4b216e090c5747e712418f4fa66d2c ******/
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

		/****** Contap_HCurve2dTool::Continuity ******/
		/****** md5 signature: 93cd5f75c1ce867aba7a7f12421275f0 ******/
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

		/****** Contap_HCurve2dTool::D0 ******/
		/****** md5 signature: 647414f13617b3951aae630a40485c89 ******/
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
Computes the point of parameter U on the curve.
") D0;
		static void D0(const opencascade::handle<Adaptor2d_Curve2d> & C, const double U, gp_Pnt2d & P);

		/****** Contap_HCurve2dTool::D1 ******/
		/****** md5 signature: 4cb67a5cf245485839e9a70d333c71a4 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U: double
P: gp_Pnt2d
V: gp_Vec2d

Return
-------
None

Description
-----------
Computes the point of parameter U on the curve with its first derivative. Raised if the continuity of the current interval is not C1.
") D1;
		static void D1(const opencascade::handle<Adaptor2d_Curve2d> & C, const double U, gp_Pnt2d & P, gp_Vec2d & V);

		/****** Contap_HCurve2dTool::D2 ******/
		/****** md5 signature: 7c8af9f7178b95531f0269176827b3b6 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U: double
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Return
-------
None

Description
-----------
Returns the point P of parameter U, the first and second derivatives V1 and V2. Raised if the continuity of the current interval is not C2.
") D2;
		static void D2(const opencascade::handle<Adaptor2d_Curve2d> & C, const double U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****** Contap_HCurve2dTool::D3 ******/
		/****** md5 signature: 0d5beba8194fcecf902b3af0a6115ccc ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U: double
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Return
-------
None

Description
-----------
Returns the point P of parameter U, the first, the second and the third derivative. Raised if the continuity of the current interval is not C3.
") D3;
		static void D3(const opencascade::handle<Adaptor2d_Curve2d> & C, const double U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****** Contap_HCurve2dTool::DN ******/
		/****** md5 signature: c6ea8b27aa6fb1aef473b0dca6417f7f ******/
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
The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.
") DN;
		static gp_Vec2d DN(const opencascade::handle<Adaptor2d_Curve2d> & C, const double U, const int N);

		/****** Contap_HCurve2dTool::Ellipse ******/
		/****** md5 signature: 9ddecf68838c4598b17a43e7ee186e6e ******/
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

		/****** Contap_HCurve2dTool::FirstParameter ******/
		/****** md5 signature: ba7dcc17bbcf3ad13ca428fccb4ee295 ******/
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
		static double FirstParameter(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** Contap_HCurve2dTool::GetType ******/
		/****** md5 signature: 29ec5067d7e913f214c553444ec99b6a ******/
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
		static GeomAbs_CurveType GetType(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** Contap_HCurve2dTool::Hyperbola ******/
		/****** md5 signature: d710d90c07a9bd6c6e8e1ba3fc1c92bf ******/
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

		/****** Contap_HCurve2dTool::Intervals ******/
		/****** md5 signature: f078f296545d3dd38144048dfca10469 ******/
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
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		static void Intervals(const opencascade::handle<Adaptor2d_Curve2d> & C, TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** Contap_HCurve2dTool::IsClosed ******/
		/****** md5 signature: 2e919d2de6d38bdb8500e5fc59dfa301 ******/
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
		static bool IsClosed(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** Contap_HCurve2dTool::IsPeriodic ******/
		/****** md5 signature: 758f5d32a3e81a7d0cac59086cea6b55 ******/
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
		static bool IsPeriodic(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** Contap_HCurve2dTool::LastParameter ******/
		/****** md5 signature: c3783a6df82a0f461b6597f54b9d3b85 ******/
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
		static double LastParameter(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** Contap_HCurve2dTool::Line ******/
		/****** md5 signature: cc50bf5bbcfff1340d1951ad804f481d ******/
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

		/****** Contap_HCurve2dTool::NbIntervals ******/
		/****** md5 signature: f892a17175c7690de7e2ba8d55659419 ******/
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
Returns the number of intervals for continuity <S>. May be one if Continuity(myclass) >= <S>.
") NbIntervals;
		static int NbIntervals(const opencascade::handle<Adaptor2d_Curve2d> & C, const GeomAbs_Shape S);

		/****** Contap_HCurve2dTool::NbSamples ******/
		/****** md5 signature: 1f8960c481dbbc037f35e98ce7810cf6 ******/
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
		static int NbSamples(const opencascade::handle<Adaptor2d_Curve2d> & C, const double U0, const double U1);

		/****** Contap_HCurve2dTool::Parabola ******/
		/****** md5 signature: 638d7ecde6dd9f67180eadf45347f22e ******/
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

		/****** Contap_HCurve2dTool::Period ******/
		/****** md5 signature: d675e32257b292584f21996f45e5f086 ******/
		%feature("compactdefaultargs") Period;
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
") Period;
		static double Period(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** Contap_HCurve2dTool::Resolution ******/
		/****** md5 signature: cc00f63e5558970ed6d6f4b56109c915 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
R3d: double

Return
-------
double

Description
-----------
Returns the parametric resolution corresponding to the real space resolution <R3d>.
") Resolution;
		static double Resolution(const opencascade::handle<Adaptor2d_Curve2d> & C, const double R3d);

		/****** Contap_HCurve2dTool::Value ******/
		/****** md5 signature: 7945b3785f38356578b9cc7bd81af491 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U: double

Return
-------
gp_Pnt2d

Description
-----------
Computes the point of parameter U on the curve.
") Value;
		static gp_Pnt2d Value(const opencascade::handle<Adaptor2d_Curve2d> & C, const double U);

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
		/****** Contap_Line::Contap_Line ******/
		/****** md5 signature: 31a4005b50852e1945ca19d1e047ab86 ******/
		%feature("compactdefaultargs") Contap_Line;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Contap_Line;
		 Contap_Line();

		/****** Contap_Line::Add ******/
		/****** md5 signature: 01be3efa9c74c4d8432a102f97f9361d ******/
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

		/****** Contap_Line::Add ******/
		/****** md5 signature: 056936562dcf77b940ba3130c47afdae ******/
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

		/****** Contap_Line::Arc ******/
		/****** md5 signature: de8e47510fc50811ee5a3e0bc98029e6 ******/
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
No available documentation.
") Arc;
		const opencascade::handle<Adaptor2d_Curve2d> & Arc();

		/****** Contap_Line::Circle ******/
		/****** md5 signature: cab8b08988d177bd7107adbbccc4ef89 ******/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "Return
-------
gp_Circ

Description
-----------
No available documentation.
") Circle;
		gp_Circ Circle();

		/****** Contap_Line::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Clear;
		void Clear();

		/****** Contap_Line::Line ******/
		/****** md5 signature: 63e1fa189ca3bcfdb401241217a93bfb ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Return
-------
gp_Lin

Description
-----------
No available documentation.
") Line;
		gp_Lin Line();

		/****** Contap_Line::LineOn2S ******/
		/****** md5 signature: 31b349cb17d652cab4ad0cf52e88a2aa ******/
		%feature("compactdefaultargs") LineOn2S;
		%feature("autodoc", "Return
-------
opencascade::handle<IntSurf_LineOn2S>

Description
-----------
No available documentation.
") LineOn2S;
		const opencascade::handle<IntSurf_LineOn2S> & LineOn2S();

		/****** Contap_Line::NbPnts ******/
		/****** md5 signature: 62ca8b9c803953d23e1f278d77f7b8f6 ******/
		%feature("compactdefaultargs") NbPnts;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPnts;
		int NbPnts();

		/****** Contap_Line::NbVertex ******/
		/****** md5 signature: ca210f2c673146a756e686a1fba666cd ******/
		%feature("compactdefaultargs") NbVertex;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVertex;
		int NbVertex();

		/****** Contap_Line::Point ******/
		/****** md5 signature: 79474cc503988bcfaa8e9986524c5706 ******/
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
		const IntSurf_PntOn2S & Point(const int Index);

		/****** Contap_Line::ResetSeqOfVertex ******/
		/****** md5 signature: a6c5afb6e069ea40eab99b45a50ab6bd ******/
		%feature("compactdefaultargs") ResetSeqOfVertex;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ResetSeqOfVertex;
		void ResetSeqOfVertex();

		/****** Contap_Line::SetLineOn2S ******/
		/****** md5 signature: 10da8691bc4dbff6817878acc12fd279 ******/
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

		/****** Contap_Line::SetTransitionOnS ******/
		/****** md5 signature: 3e11bbe314ad3435d0d0c939af6c7e0c ******/
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
Set The Transition of the line.
") SetTransitionOnS;
		void SetTransitionOnS(const IntSurf_TypeTrans T);

		/****** Contap_Line::SetValue ******/
		/****** md5 signature: 1ae32c88ce581ccde7cd37fbe879a748 ******/
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

		/****** Contap_Line::SetValue ******/
		/****** md5 signature: df8c025f756bd837345d152a2edc2a47 ******/
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

		/****** Contap_Line::SetValue ******/
		/****** md5 signature: 53ce9238106071febf6db57a0ff8a99c ******/
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

		/****** Contap_Line::TransitionOnS ******/
		/****** md5 signature: ac2f27afdd16ab93ea1f959cb2bf6e33 ******/
		%feature("compactdefaultargs") TransitionOnS;
		%feature("autodoc", "Return
-------
IntSurf_TypeTrans

Description
-----------
returns IN if at the 'left' of the line, the normale of the surface is oriented to the observator.
") TransitionOnS;
		IntSurf_TypeTrans TransitionOnS();

		/****** Contap_Line::TypeContour ******/
		/****** md5 signature: ccb9b7428ffec80adf355a2d32ee6f36 ******/
		%feature("compactdefaultargs") TypeContour;
		%feature("autodoc", "Return
-------
Contap_IType

Description
-----------
Returns Contap_Lin for a line, Contap_Circle for a circle, and Contap_Walking for a Walking line, Contap_Restriction for a part of boundary.
") TypeContour;
		Contap_IType TypeContour();

		/****** Contap_Line::Vertex ******/
		/****** md5 signature: 3fc3876b09a9adb8e4dc14f8b0bae679 ******/
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
		Contap_Point & Vertex(const int Index);

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
		/****** Contap_Point::Contap_Point ******/
		/****** md5 signature: 7f542237bdf60ef9ad56bb116a72608a ******/
		%feature("compactdefaultargs") Contap_Point;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Contap_Point;
		 Contap_Point();

		/****** Contap_Point::Contap_Point ******/
		/****** md5 signature: 4a4d9fd18b473c65d0f458ceb7c3cf91 ******/
		%feature("compactdefaultargs") Contap_Point;
		%feature("autodoc", "
Parameters
----------
Pt: gp_Pnt
U: double
V: double

Return
-------
None

Description
-----------
Creates a point.
") Contap_Point;
		 Contap_Point(const gp_Pnt & Pt, const double U, const double V);

		/****** Contap_Point::Arc ******/
		/****** md5 signature: de8e47510fc50811ee5a3e0bc98029e6 ******/
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
Returns the arc of restriction containing the vertex.
") Arc;
		const opencascade::handle<Adaptor2d_Curve2d> & Arc();

		/****** Contap_Point::IsInternal ******/
		/****** md5 signature: bc99f1e1a5de9a848599ff3c5c3a1099 ******/
		%feature("compactdefaultargs") IsInternal;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the point is an internal one, i.e if the tangent to the line on the point and the eye direction are parallel.
") IsInternal;
		bool IsInternal();

		/****** Contap_Point::IsMultiple ******/
		/****** md5 signature: e6f05b42d0997d2397aa555711ac4e5c ******/
		%feature("compactdefaultargs") IsMultiple;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the point belongs to several lines.
") IsMultiple;
		bool IsMultiple();

		/****** Contap_Point::IsOnArc ******/
		/****** md5 signature: d549c83bc2ccfa2e24e52cc5eee9bdec ******/
		%feature("compactdefaultargs") IsOnArc;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True when the point is an intersection between the contour and a restriction.
") IsOnArc;
		bool IsOnArc();

		/****** Contap_Point::IsVertex ******/
		/****** md5 signature: a2ec0345ec4add7e1d182223d626cf2f ******/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the point is a vertex on the initial restriction facet of the surface.
") IsVertex;
		bool IsVertex();

		/****** Contap_Point::ParameterOnArc ******/
		/****** md5 signature: 325a1d6a3796b5402c690f182eda9fae ******/
		%feature("compactdefaultargs") ParameterOnArc;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the parameter of the point on the arc returned by the method Arc().
") ParameterOnArc;
		double ParameterOnArc();

		/****** Contap_Point::ParameterOnLine ******/
		/****** md5 signature: b224a4c205db840697545a0e986b265c ******/
		%feature("compactdefaultargs") ParameterOnLine;
		%feature("autodoc", "Return
-------
double

Description
-----------
This method returns the parameter of the point on the intersection line. If the points does not belong to an intersection line, the value returned does not have any sens.
") ParameterOnLine;
		double ParameterOnLine();

		/****** Contap_Point::Parameters ******/
		/****** md5 signature: f747ef8500c23030458f6f65df7baedd ******/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "
Parameters
----------

Return
-------
U1: double
V1: double

Description
-----------
Returns the parameters on the surface of the point.
") Parameters;
		void Parameters(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Contap_Point::SetArc ******/
		/****** md5 signature: 5c4699ae69e22b4401b79d28dab15578 ******/
		%feature("compactdefaultargs") SetArc;
		%feature("autodoc", "
Parameters
----------
A: Adaptor2d_Curve2d
Param: double
TLine: IntSurf_Transition
TArc: IntSurf_Transition

Return
-------
None

Description
-----------
Sets the value of the arc and of the parameter on this arc of the point.
") SetArc;
		void SetArc(const opencascade::handle<Adaptor2d_Curve2d> & A, const double Param, const IntSurf_Transition & TLine, const IntSurf_Transition & TArc);

		/****** Contap_Point::SetInternal ******/
		/****** md5 signature: f29227e746cced65920ee7fe48924495 ******/
		%feature("compactdefaultargs") SetInternal;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") SetInternal;
		void SetInternal();

		/****** Contap_Point::SetMultiple ******/
		/****** md5 signature: 1ac6220c2c8c7b2e4c947976b7d1c954 ******/
		%feature("compactdefaultargs") SetMultiple;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") SetMultiple;
		void SetMultiple();

		/****** Contap_Point::SetParameter ******/
		/****** md5 signature: 7b443396772a23e080316b372682c8d1 ******/
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "
Parameters
----------
Para: double

Return
-------
None

Description
-----------
Set the value of the parameter on the intersection line.
") SetParameter;
		void SetParameter(const double Para);

		/****** Contap_Point::SetValue ******/
		/****** md5 signature: 97c37eeba238ad635ca029cf2857190c ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
Pt: gp_Pnt
U: double
V: double

Return
-------
None

Description
-----------
Sets the values for a point.
") SetValue;
		void SetValue(const gp_Pnt & Pt, const double U, const double V);

		/****** Contap_Point::SetVertex ******/
		/****** md5 signature: 1c2d847f9895dadcabe6f5a142550e35 ******/
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

		/****** Contap_Point::TransitionOnArc ******/
		/****** md5 signature: adc9ee508ec8cbe59ce8b05248cd454a ******/
		%feature("compactdefaultargs") TransitionOnArc;
		%feature("autodoc", "Return
-------
IntSurf_Transition

Description
-----------
Returns the transition of the point on the arc.
") TransitionOnArc;
		const IntSurf_Transition & TransitionOnArc();

		/****** Contap_Point::TransitionOnLine ******/
		/****** md5 signature: 1ffbcf064eb110daaac7ceebff0fcde5 ******/
		%feature("compactdefaultargs") TransitionOnLine;
		%feature("autodoc", "Return
-------
IntSurf_Transition

Description
-----------
Returns the transition of the point on the contour.
") TransitionOnLine;
		const IntSurf_Transition & TransitionOnLine();

		/****** Contap_Point::Value ******/
		/****** md5 signature: eddd2908948849b73f6d8aacab318652 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the intersection point (geometric information).
") Value;
		const gp_Pnt Value();

		/****** Contap_Point::Vertex ******/
		/****** md5 signature: 7213fb18dc3be1f48818ab739bb98dfa ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_HVertex>

Description
-----------
Returns the information about the point when it is on the domain of the patch, i-e when the function IsVertex returns True. Otherwise, an exception is raised.
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
		/****** Contap_SurfFunction::Contap_SurfFunction ******/
		/****** md5 signature: 551ec67d4c15a771ab94a5939f31e633 ******/
		%feature("compactdefaultargs") Contap_SurfFunction;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Contap_SurfFunction;
		 Contap_SurfFunction();

		/****** Contap_SurfFunction::Angle ******/
		/****** md5 signature: 2b9c11d59a1231fe171f8d4c440fc397 ******/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Angle;
		double Angle();

		/****** Contap_SurfFunction::Derivatives ******/
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
The dimension of D is (1,2).
") Derivatives;
		bool Derivatives(const math_Vector & X, math_Matrix & D);

		/****** Contap_SurfFunction::Direction ******/
		/****** md5 signature: 6107c9113155a9ae9007c5c8e526a738 ******/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
No available documentation.
") Direction;
		const gp_Dir Direction();

		/****** Contap_SurfFunction::Direction2d ******/
		/****** md5 signature: e46e583c3b745511fb8654831bfa19d7 ******/
		%feature("compactdefaultargs") Direction2d;
		%feature("autodoc", "Return
-------
gp_Dir2d

Description
-----------
No available documentation.
") Direction2d;
		const gp_Dir2d Direction2d();

		/****** Contap_SurfFunction::Direction3d ******/
		/****** md5 signature: ceda05eba57d20f6f3ce262f42faf157 ******/
		%feature("compactdefaultargs") Direction3d;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") Direction3d;
		const gp_Vec Direction3d();

		/****** Contap_SurfFunction::Eye ******/
		/****** md5 signature: aa99970f6e90715f8213e1ab0b8ace3e ******/
		%feature("compactdefaultargs") Eye;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Eye;
		const gp_Pnt Eye();

		/****** Contap_SurfFunction::FunctionType ******/
		/****** md5 signature: be07ad13be6828eeadd86e0c10f87452 ******/
		%feature("compactdefaultargs") FunctionType;
		%feature("autodoc", "Return
-------
Contap_TFunction

Description
-----------
No available documentation.
") FunctionType;
		Contap_TFunction FunctionType();

		/****** Contap_SurfFunction::IsTangent ******/
		/****** md5 signature: 57430bba54a67cd70f0eb7addde8c3c7 ******/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsTangent;
		bool IsTangent();

		/****** Contap_SurfFunction::NbEquations ******/
		/****** md5 signature: d96db90f938251af5669711b5ae9a95b ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
This method has to return 1.
") NbEquations;
		int NbEquations();

		/****** Contap_SurfFunction::NbVariables ******/
		/****** md5 signature: ac9e90c594b52fb2529a5f6212b74800 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
This method has to return 2.
") NbVariables;
		int NbVariables();

		/****** Contap_SurfFunction::PSurface ******/
		/****** md5 signature: e04a186cf5fc0c76577d479297dac08c ******/
		%feature("compactdefaultargs") PSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
Method is entered for compatibility with IntPatch_TheSurfFunction.
") PSurface;
		const opencascade::handle<Adaptor3d_Surface> & PSurface();

		/****** Contap_SurfFunction::Point ******/
		/****** md5 signature: 177e376cc11d1fedb2819bac56591ea8 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the value of the solution point on the surface.
") Point;
		const gp_Pnt Point();

		/****** Contap_SurfFunction::Root ******/
		/****** md5 signature: 4cac472ec2e8bbc115a694c59e4b1b4e ******/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Return
-------
double

Description
-----------
Root is the value of the function at the solution. It is a vector of dimension 1, i-e a real.
") Root;
		double Root();

		/****** Contap_SurfFunction::Set ******/
		/****** md5 signature: fe1f4e54b6d838c88f545f7975616591 ******/
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

		/****** Contap_SurfFunction::Set ******/
		/****** md5 signature: 82e61fcbcd023e361c983ac9b10b051a ******/
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

		/****** Contap_SurfFunction::Set ******/
		/****** md5 signature: 15b1468c79fc4757515151f835f2d3d0 ******/
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

		/****** Contap_SurfFunction::Set ******/
		/****** md5 signature: a5d0b15284323914e4a34193aed591b0 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Dir: gp_Dir
Angle: double

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const gp_Dir & Dir, const double Angle);

		/****** Contap_SurfFunction::Set ******/
		/****** md5 signature: c7e2cf1c8992bd28326af14f206ae150 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Eye: gp_Pnt
Angle: double

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const gp_Pnt & Eye, const double Angle);

		/****** Contap_SurfFunction::Set ******/
		/****** md5 signature: bf508c67cd63b5bb26c659d2af54ab81 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Tolerance: double

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const double Tolerance);

		/****** Contap_SurfFunction::Surface ******/
		/****** md5 signature: d36dc8d293d03901e5a1cace2e167115 ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
No available documentation.
") Surface;
		const opencascade::handle<Adaptor3d_Surface> & Surface();

		/****** Contap_SurfFunction::Tolerance ******/
		/****** md5 signature: a95a606eeb289469358ac00a6b44ad86 ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the value Tol so that if std::abs(Func.Root())<Tol the function is considered null.
") Tolerance;
		double Tolerance();

		/****** Contap_SurfFunction::Value ******/
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
The dimension of F is 1.
") Value;
		bool Value(const math_Vector & X, math_Vector & F);

		/****** Contap_SurfFunction::Values ******/
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
No available documentation.
") Values;
		bool Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

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
		/****** Contap_SurfProps::DerivAndNorm ******/
		/****** md5 signature: 9b2d40a0ebe1a4e816acfb22223f279a ******/
		%feature("compactdefaultargs") DerivAndNorm;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
U: double
V: double
P: gp_Pnt
d1u: gp_Vec
d1v: gp_Vec
N: gp_Vec

Return
-------
None

Description
-----------
Computes the point <P>, and normal vector <N> on <S> at parameters U,V.
") DerivAndNorm;
		static void DerivAndNorm(const opencascade::handle<Adaptor3d_Surface> & S, const double U, const double V, gp_Pnt & P, gp_Vec & d1u, gp_Vec & d1v, gp_Vec & N);

		/****** Contap_SurfProps::NormAndDn ******/
		/****** md5 signature: d05849675aaf0966e7524d6d1aad7896 ******/
		%feature("compactdefaultargs") NormAndDn;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
U: double
V: double
P: gp_Pnt
N: gp_Vec
Dnu: gp_Vec
Dnv: gp_Vec

Return
-------
None

Description
-----------
Computes the point <P>, normal vector <N>, and its derivatives <Dnu> and <Dnv> on <S> at parameters U,V.
") NormAndDn;
		static void NormAndDn(const opencascade::handle<Adaptor3d_Surface> & S, const double U, const double V, gp_Pnt & P, gp_Vec & N, gp_Vec & Dnu, gp_Vec & Dnv);

		/****** Contap_SurfProps::Normale ******/
		/****** md5 signature: 46ce035e50784e9b09aa4867c1454d57 ******/
		%feature("compactdefaultargs") Normale;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
U: double
V: double
P: gp_Pnt
N: gp_Vec

Return
-------
None

Description
-----------
Computes the point <P>, and normal vector <N> on <S> at parameters U,V.
") Normale;
		static void Normale(const opencascade::handle<Adaptor3d_Surface> & S, const double U, const double V, gp_Pnt & P, gp_Vec & N);

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
		/****** Contap_TheIWLineOfTheIWalking::Contap_TheIWLineOfTheIWalking ******/
		/****** md5 signature: f9ed70fa09bf96c9c109b7067342cd89 ******/
		%feature("compactdefaultargs") Contap_TheIWLineOfTheIWalking;
		%feature("autodoc", "
Parameters
----------
theAllocator: IntSurf_Allocator (optional, default to nullptr)

Return
-------
None

Description
-----------
No available documentation.
") Contap_TheIWLineOfTheIWalking;
		 Contap_TheIWLineOfTheIWalking(const IntSurf_Allocator & theAllocator = nullptr);

		/****** Contap_TheIWLineOfTheIWalking::AddIndexPassing ******/
		/****** md5 signature: bde76ddfc9fd3149d5e8a69fba3de18f ******/
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
associate the index of the point on the line with the index of the point passing through the starting iterator.
") AddIndexPassing;
		void AddIndexPassing(const int Index);

		/****** Contap_TheIWLineOfTheIWalking::AddPoint ******/
		/****** md5 signature: 806b6da489848ff70e42ef52b8d76d5c ******/
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

		/****** Contap_TheIWLineOfTheIWalking::AddStatusFirst ******/
		/****** md5 signature: 309da47086c91d4b55ab9322713e46b6 ******/
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
		void AddStatusFirst(const bool Closed, const bool HasFirst);

		/****** Contap_TheIWLineOfTheIWalking::AddStatusFirst ******/
		/****** md5 signature: 6a054410b270f07fdc8f55a488588f7b ******/
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
		void AddStatusFirst(const bool Closed, const bool HasLast, const int Index, const IntSurf_PathPoint & P);

		/****** Contap_TheIWLineOfTheIWalking::AddStatusFirstLast ******/
		/****** md5 signature: fca87ad519cda1e6ce4b2785b71fefb5 ******/
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
		void AddStatusFirstLast(const bool Closed, const bool HasFirst, const bool HasLast);

		/****** Contap_TheIWLineOfTheIWalking::AddStatusLast ******/
		/****** md5 signature: d4dad969f2ee054ae4f95897518310f1 ******/
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
		void AddStatusLast(const bool HasLast);

		/****** Contap_TheIWLineOfTheIWalking::AddStatusLast ******/
		/****** md5 signature: 2a3e07299ee2f37b5b1aba2b4ce3c8f2 ******/
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
		void AddStatusLast(const bool HasLast, const int Index, const IntSurf_PathPoint & P);

		/****** Contap_TheIWLineOfTheIWalking::Cut ******/
		/****** md5 signature: 45deb1b2d88847257c59414f67c20464 ******/
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
Cut the line at the point of rank Index.
") Cut;
		void Cut(const int Index);

		/****** Contap_TheIWLineOfTheIWalking::FirstPoint ******/
		/****** md5 signature: e0c1dbe8c28165db2dbe2ecf721fcc02 ******/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Return
-------
IntSurf_PathPoint

Description
-----------
Returns the first point of the line when it is a marching point. An exception is raised if HasFirstPoint returns False.
") FirstPoint;
		const IntSurf_PathPoint & FirstPoint();

		/****** Contap_TheIWLineOfTheIWalking::FirstPointIndex ******/
		/****** md5 signature: 3211170de320ab60c8ead46058ce918f ******/
		%feature("compactdefaultargs") FirstPointIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the Index of first point of the line when it is a marching point. This index is the index in the PointStartIterator. An exception is raised if HasFirstPoint returns False.
") FirstPointIndex;
		int FirstPointIndex();

		/****** Contap_TheIWLineOfTheIWalking::HasFirstPoint ******/
		/****** md5 signature: 1bdb89cc339a420f24f2f400d73d6b54 ******/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the first point of the line is a marching point. when is HasFirstPoint==False ,the line begins on the natural bound of the surface. The line can be too long.
") HasFirstPoint;
		bool HasFirstPoint();

		/****** Contap_TheIWLineOfTheIWalking::HasLastPoint ******/
		/****** md5 signature: c85dac3d84a6b6ab2854e34ac0e4ffcb ******/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the end point of the line is a marching point (Point from IntWS). when is HasFirstPoint==False the line ends on the natural bound of the surface. The line can be too long.
") HasLastPoint;
		bool HasLastPoint();

		/****** Contap_TheIWLineOfTheIWalking::IsClosed ******/
		/****** md5 signature: 66fc0caa1853d24780b1d28b8296bc6c ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the line is closed.
") IsClosed;
		bool IsClosed();

		/****** Contap_TheIWLineOfTheIWalking::IsTangentAtBegining ******/
		/****** md5 signature: aa1e4a3a81269a17ab62d556ec9ab74c ******/
		%feature("compactdefaultargs") IsTangentAtBegining;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsTangentAtBegining;
		bool IsTangentAtBegining();

		/****** Contap_TheIWLineOfTheIWalking::IsTangentAtEnd ******/
		/****** md5 signature: d693a46306cf177fc338d14663f0a3bb ******/
		%feature("compactdefaultargs") IsTangentAtEnd;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsTangentAtEnd;
		bool IsTangentAtEnd();

		/****** Contap_TheIWLineOfTheIWalking::LastPoint ******/
		/****** md5 signature: 7876841b5cf564c633cdd87a1ac1e722 ******/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "Return
-------
IntSurf_PathPoint

Description
-----------
Returns the last point of the line when it is a marching point. An exception is raised if HasLastPoint returns False.
") LastPoint;
		const IntSurf_PathPoint & LastPoint();

		/****** Contap_TheIWLineOfTheIWalking::LastPointIndex ******/
		/****** md5 signature: dd0232cbaf64f8bd52c0361e20f012bc ******/
		%feature("compactdefaultargs") LastPointIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the index of last point of the line when it is a marching point. This index is the index in the PointStartIterator. An exception is raised if HasLastPoint returns False.
") LastPointIndex;
		int LastPointIndex();

		/****** Contap_TheIWLineOfTheIWalking::Line ******/
		/****** md5 signature: d5c2cd917d9e773fdb8b23c68d6a1fdc ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Return
-------
opencascade::handle<IntSurf_LineOn2S>

Description
-----------
Returns the LineOn2S contained in the walking line.
") Line;
		const opencascade::handle<IntSurf_LineOn2S> & Line();

		/****** Contap_TheIWLineOfTheIWalking::NbPassingPoint ******/
		/****** md5 signature: d2e9c44670b445492d329e73bf77e957 ******/
		%feature("compactdefaultargs") NbPassingPoint;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of points belonging to Pnts1 which are passing point.
") NbPassingPoint;
		int NbPassingPoint();

		/****** Contap_TheIWLineOfTheIWalking::NbPoints ******/
		/****** md5 signature: 0243a6484ef0942dcad871f7c247b5de ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of points of the line (including first point and end point: see HasLastPoint and HasFirstPoint).
") NbPoints;
		int NbPoints();

		/****** Contap_TheIWLineOfTheIWalking::PassingPoint ******/
		/****** md5 signature: 622122aaed0a2c52208ace10effc53a8 ******/
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
returns the index of the point belonging to the line which is associated to the passing point belonging to Pnts1 an exception is raised if Index > NbPassingPoint().
") PassingPoint;
		void PassingPoint(const int Index, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** Contap_TheIWLineOfTheIWalking::Reverse ******/
		/****** md5 signature: b751d6874fc026e19a7a6cb37e9ac1b4 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
reverse the points in the line. Hasfirst, HasLast are kept.
") Reverse;
		void Reverse();

		/****** Contap_TheIWLineOfTheIWalking::SetTangencyAtBegining ******/
		/****** md5 signature: a9c68eae26d6e2820e16af9bf963ea73 ******/
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
		void SetTangencyAtBegining(const bool IsTangent);

		/****** Contap_TheIWLineOfTheIWalking::SetTangencyAtEnd ******/
		/****** md5 signature: 019662b4a1e47ed938c27ea7648bdb82 ******/
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
		void SetTangencyAtEnd(const bool IsTangent);

		/****** Contap_TheIWLineOfTheIWalking::SetTangentVector ******/
		/****** md5 signature: 0e189218da5eed715cfc0089dc919714 ******/
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
		void SetTangentVector(const gp_Vec & V, const int Index);

		/****** Contap_TheIWLineOfTheIWalking::TangentVector ******/
		/****** md5 signature: fd80ff20b3f5a28424944277e711445e ******/
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

		/****** Contap_TheIWLineOfTheIWalking::Value ******/
		/****** md5 signature: 344ab61d440fab1850713aee8091a920 ******/
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
Returns the point of range Index. If index <= 0 or Index > NbPoints, an exception is raised.
") Value;
		const IntSurf_PntOn2S & Value(const int Index);

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
		/****** Contap_TheIWalking::Contap_TheIWalking ******/
		/****** md5 signature: 9f518c2a139dee942b2a9bdcaf3d3ff9 ******/
		%feature("compactdefaultargs") Contap_TheIWalking;
		%feature("autodoc", "
Parameters
----------
Epsilon: double
Deflection: double
Step: double
theToFillHoles: bool (optional, default to false)

Return
-------
None

Description
-----------
Deflection is the maximum deflection admitted between two consecutive points on a resulting polyline. Step is the maximum increment admitted between two consecutive points (in 2d space). Epsilon is the tolerance beyond which 2 points are confused. theToFillHoles is the flag defining whether possible holes between resulting curves are filled or not in case of Contap walking theToFillHoles is True.
") Contap_TheIWalking;
		 Contap_TheIWalking(const double Epsilon, const double Deflection, const double Step, const bool theToFillHoles = false);

		/****** Contap_TheIWalking::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the calculus was successful.
") IsDone;
		bool IsDone();

		/****** Contap_TheIWalking::NbLines ******/
		/****** md5 signature: 7c1b53177daa19e8eec95fb1ac3b65c8 ******/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of resulting polylines. An exception is raised if IsDone returns False.
") NbLines;
		int NbLines();

		/****** Contap_TheIWalking::NbSinglePnts ******/
		/****** md5 signature: f1b67cb30ffc42c2108869640ba5114a ******/
		%feature("compactdefaultargs") NbSinglePnts;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of points belonging to Pnts on which no line starts or ends. An exception is raised if IsDone returns False.
") NbSinglePnts;
		int NbSinglePnts();

		/****** Contap_TheIWalking::Perform ******/
		/****** md5 signature: b329cdf135b2ac0be3476ccc94ce4dcf ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Pnts1: NCollection_Sequence<IntSurf_PathPoint>
Pnts2: NCollection_Sequence<IntSurf_InteriorPoint>
Func: Contap_SurfFunction
S: Adaptor3d_Surface
Reversed: bool (optional, default to false)

Return
-------
None

Description
-----------
Searches a set of polylines starting on a point of Pnts1 or Pnts2. Each point on a resulting polyline verifies F(u,v)=0.
") Perform;
		void Perform(const NCollection_Sequence<IntSurf_PathPoint> & Pnts1, const NCollection_Sequence<IntSurf_InteriorPoint> & Pnts2, Contap_SurfFunction & Func, const opencascade::handle<Adaptor3d_Surface> & S, const bool Reversed = false);

		/****** Contap_TheIWalking::Perform ******/
		/****** md5 signature: 3d97c852be67a139f71f9b8d733df31f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Pnts1: NCollection_Sequence<IntSurf_PathPoint>
Func: Contap_SurfFunction
S: Adaptor3d_Surface
Reversed: bool (optional, default to false)

Return
-------
None

Description
-----------
Searches a set of polylines starting on a point of Pnts1. Each point on a resulting polyline verifies F(u,v)=0.
") Perform;
		void Perform(const NCollection_Sequence<IntSurf_PathPoint> & Pnts1, Contap_SurfFunction & Func, const opencascade::handle<Adaptor3d_Surface> & S, const bool Reversed = false);

		/****** Contap_TheIWalking::SetTolerance ******/
		/****** md5 signature: 3564d886237339d2a77bbae8a62ca5a3 ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
Epsilon: double
Deflection: double
Step: double

Return
-------
None

Description
-----------
Deflection is the maximum deflection admitted between two consecutive points on a resulting polyline. Step is the maximum increment admitted between two consecutive points (in 2d space). Epsilon is the tolerance beyond which 2 points are confused.
") SetTolerance;
		void SetTolerance(const double Epsilon, const double Deflection, const double Step);

		/****** Contap_TheIWalking::SinglePnt ******/
		/****** md5 signature: 0c2543cf594dde763111a0259b3536b6 ******/
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
Returns the point of range Index . An exception is raised if IsDone returns False. An exception is raised if Index<=0 or Index > NbSinglePnts.
") SinglePnt;
		const IntSurf_PathPoint & SinglePnt(const int Index);

		/****** Contap_TheIWalking::Value ******/
		/****** md5 signature: 68256a4a33931ac00e4048786b978244 ******/
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
Returns the polyline of range Index. An exception is raised if IsDone is False. An exception is raised if Index<=0 or Index>NbLines.
") Value;
		const opencascade::handle<Contap_TheIWLineOfTheIWalking> & Value(const int Index);

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
		/****** Contap_ThePathPointOfTheSearch::Contap_ThePathPointOfTheSearch ******/
		/****** md5 signature: 5503b331f6af653d85c09254453a08e7 ******/
		%feature("compactdefaultargs") Contap_ThePathPointOfTheSearch;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Contap_ThePathPointOfTheSearch;
		 Contap_ThePathPointOfTheSearch();

		/****** Contap_ThePathPointOfTheSearch::Contap_ThePathPointOfTheSearch ******/
		/****** md5 signature: ce4ad08c38b464239841a2f7ef4c7383 ******/
		%feature("compactdefaultargs") Contap_ThePathPointOfTheSearch;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
Tol: double
V: Adaptor3d_HVertex
A: Adaptor2d_Curve2d
Parameter: double

Return
-------
None

Description
-----------
No available documentation.
") Contap_ThePathPointOfTheSearch;
		 Contap_ThePathPointOfTheSearch(const gp_Pnt & P, const double Tol, const opencascade::handle<Adaptor3d_HVertex> & V, const opencascade::handle<Adaptor2d_Curve2d> & A, const double Parameter);

		/****** Contap_ThePathPointOfTheSearch::Contap_ThePathPointOfTheSearch ******/
		/****** md5 signature: 3e480864697414020186cb7da9dc520d ******/
		%feature("compactdefaultargs") Contap_ThePathPointOfTheSearch;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
Tol: double
A: Adaptor2d_Curve2d
Parameter: double

Return
-------
None

Description
-----------
No available documentation.
") Contap_ThePathPointOfTheSearch;
		 Contap_ThePathPointOfTheSearch(const gp_Pnt & P, const double Tol, const opencascade::handle<Adaptor2d_Curve2d> & A, const double Parameter);

		/****** Contap_ThePathPointOfTheSearch::Arc ******/
		/****** md5 signature: de8e47510fc50811ee5a3e0bc98029e6 ******/
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
No available documentation.
") Arc;
		const opencascade::handle<Adaptor2d_Curve2d> & Arc();

		/****** Contap_ThePathPointOfTheSearch::IsNew ******/
		/****** md5 signature: 3e8db0e1293344166ca6cbedee1b961d ******/
		%feature("compactdefaultargs") IsNew;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsNew;
		bool IsNew();

		/****** Contap_ThePathPointOfTheSearch::Parameter ******/
		/****** md5 signature: 28e42519a120bf741c23eca7aaca5525 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Parameter;
		double Parameter();

		/****** Contap_ThePathPointOfTheSearch::SetValue ******/
		/****** md5 signature: e66e8a8030b9c4660d70f69ad456de66 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
Tol: double
V: Adaptor3d_HVertex
A: Adaptor2d_Curve2d
Parameter: double

Return
-------
None

Description
-----------
No available documentation.
") SetValue;
		void SetValue(const gp_Pnt & P, const double Tol, const opencascade::handle<Adaptor3d_HVertex> & V, const opencascade::handle<Adaptor2d_Curve2d> & A, const double Parameter);

		/****** Contap_ThePathPointOfTheSearch::SetValue ******/
		/****** md5 signature: c616187800f2bcef8f485c8ee2a3fda1 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
Tol: double
A: Adaptor2d_Curve2d
Parameter: double

Return
-------
None

Description
-----------
No available documentation.
") SetValue;
		void SetValue(const gp_Pnt & P, const double Tol, const opencascade::handle<Adaptor2d_Curve2d> & A, const double Parameter);

		/****** Contap_ThePathPointOfTheSearch::Tolerance ******/
		/****** md5 signature: a95a606eeb289469358ac00a6b44ad86 ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Tolerance;
		double Tolerance();

		/****** Contap_ThePathPointOfTheSearch::Value ******/
		/****** md5 signature: eddd2908948849b73f6d8aacab318652 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Value;
		const gp_Pnt Value();

		/****** Contap_ThePathPointOfTheSearch::Vertex ******/
		/****** md5 signature: 7213fb18dc3be1f48818ab739bb98dfa ******/
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
		/****** Contap_TheSearch::Contap_TheSearch ******/
		/****** md5 signature: a7b004399382c1df1c7a307ba64b5fcc ******/
		%feature("compactdefaultargs") Contap_TheSearch;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Contap_TheSearch;
		 Contap_TheSearch();

		/****** Contap_TheSearch::AllArcSolution ******/
		/****** md5 signature: 773a5663608490a1b934c2a55dfafaa2 ******/
		%feature("compactdefaultargs") AllArcSolution;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if all arc of the Arcs are solution (inside the surface). An exception is raised if IsDone returns False.
") AllArcSolution;
		bool AllArcSolution();

		/****** Contap_TheSearch::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the calculus was successful.
") IsDone;
		bool IsDone();

		/****** Contap_TheSearch::NbPoints ******/
		/****** md5 signature: 0243a6484ef0942dcad871f7c247b5de ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of resulting points. An exception is raised if IsDone returns False (NotDone).
") NbPoints;
		int NbPoints();

		/****** Contap_TheSearch::NbSegments ******/
		/****** md5 signature: 9aee6c2253f8ba296b560fdee30e17ad ******/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of the resulting segments. An exception is raised if IsDone returns False (NotDone).
") NbSegments;
		int NbSegments();

		/****** Contap_TheSearch::Perform ******/
		/****** md5 signature: 321058c1ca8472a57abb1d05cbac0480 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
F: Contap_ArcFunction
Domain: Adaptor3d_TopolTool
TolBoundary: double
TolTangency: double
RecheckOnRegularity: bool (optional, default to false)

Return
-------
None

Description
-----------
Algorithm to find the points and parts of curves of Domain (domain of of restriction of a surface) which verify F = 0. TolBoundary defines if a curve is on Q. TolTangency defines if a point is on Q.
") Perform;
		void Perform(Contap_ArcFunction & F, const opencascade::handle<Adaptor3d_TopolTool> & Domain, const double TolBoundary, const double TolTangency, const bool RecheckOnRegularity = false);

		/****** Contap_TheSearch::Point ******/
		/****** md5 signature: 3c1fd8a9d74a72b5dfdc977dfd469c2d ******/
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
Returns the resulting point of range Index. The exception NotDone is raised if IsDone() returns False. The exception OutOfRange is raised if Index <= 0 or Index > NbPoints.
") Point;
		const Contap_ThePathPointOfTheSearch & Point(const int Index);

		/****** Contap_TheSearch::Segment ******/
		/****** md5 signature: 32fc1b50533f19cee98c7868bf06ec22 ******/
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
Returns the resulting segment of range Index. The exception NotDone is raised if IsDone() returns False. The exception OutOfRange is raised if Index <= 0 or Index > NbPoints.
") Segment;
		const Contap_TheSegmentOfTheSearch & Segment(const int Index);

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
		/****** Contap_TheSearchInside::Contap_TheSearchInside ******/
		/****** md5 signature: 9b83ea07cc6d12c653098cd9fa891ec3 ******/
		%feature("compactdefaultargs") Contap_TheSearchInside;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Contap_TheSearchInside;
		 Contap_TheSearchInside();

		/****** Contap_TheSearchInside::Contap_TheSearchInside ******/
		/****** md5 signature: 245ad533d99d6f5b2568c72d0f422e32 ******/
		%feature("compactdefaultargs") Contap_TheSearchInside;
		%feature("autodoc", "
Parameters
----------
F: Contap_SurfFunction
Surf: Adaptor3d_Surface
T: Adaptor3d_TopolTool
Epsilon: double

Return
-------
None

Description
-----------
No available documentation.
") Contap_TheSearchInside;
		 Contap_TheSearchInside(Contap_SurfFunction & F, const opencascade::handle<Adaptor3d_Surface> & Surf, const opencascade::handle<Adaptor3d_TopolTool> & T, const double Epsilon);

		/****** Contap_TheSearchInside::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		bool IsDone();

		/****** Contap_TheSearchInside::NbPoints ******/
		/****** md5 signature: 0243a6484ef0942dcad871f7c247b5de ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of points. The exception NotDone if raised if IsDone returns False.
") NbPoints;
		int NbPoints();

		/****** Contap_TheSearchInside::Perform ******/
		/****** md5 signature: 0e5f21c47c3ea4fc806f6026792b1230 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
F: Contap_SurfFunction
Surf: Adaptor3d_Surface
T: Adaptor3d_TopolTool
Epsilon: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(Contap_SurfFunction & F, const opencascade::handle<Adaptor3d_Surface> & Surf, const opencascade::handle<Adaptor3d_TopolTool> & T, const double Epsilon);

		/****** Contap_TheSearchInside::Perform ******/
		/****** md5 signature: ed19665e952ddb1941ff6a8d00e6d5ff ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
F: Contap_SurfFunction
Surf: Adaptor3d_Surface
UStart: double
VStart: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(Contap_SurfFunction & F, const opencascade::handle<Adaptor3d_Surface> & Surf, const double UStart, const double VStart);

		/****** Contap_TheSearchInside::Value ******/
		/****** md5 signature: 53957a7cef022ac96aca4f6ccc589f73 ******/
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
Returns the point of range Index. The exception NotDone if raised if IsDone returns False. The exception OutOfRange if raised if Index <= 0 or Index > NbPoints.
") Value;
		const IntSurf_InteriorPoint & Value(const int Index);

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
		/****** Contap_TheSegmentOfTheSearch::Contap_TheSegmentOfTheSearch ******/
		/****** md5 signature: 1d285dd74c990245cf5f590658f7423b ******/
		%feature("compactdefaultargs") Contap_TheSegmentOfTheSearch;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Contap_TheSegmentOfTheSearch;
		 Contap_TheSegmentOfTheSearch();

		/****** Contap_TheSegmentOfTheSearch::Curve ******/
		/****** md5 signature: 7869036a594a0e406162d60b4f92dc85 ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
Returns the geometric curve on the surface 's domain which is solution.
") Curve;
		const opencascade::handle<Adaptor2d_Curve2d> & Curve();

		/****** Contap_TheSegmentOfTheSearch::FirstPoint ******/
		/****** md5 signature: e40c5283a03725d6ebc8922755a1d1ca ******/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Return
-------
Contap_ThePathPointOfTheSearch

Description
-----------
Returns the first point.
") FirstPoint;
		const Contap_ThePathPointOfTheSearch & FirstPoint();

		/****** Contap_TheSegmentOfTheSearch::HasFirstPoint ******/
		/****** md5 signature: 1bdb89cc339a420f24f2f400d73d6b54 ******/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there is a vertex (ThePathPoint) defining the lowest valid parameter on the arc.
") HasFirstPoint;
		bool HasFirstPoint();

		/****** Contap_TheSegmentOfTheSearch::HasLastPoint ******/
		/****** md5 signature: c85dac3d84a6b6ab2854e34ac0e4ffcb ******/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there is a vertex (ThePathPoint) defining the greatest valid parameter on the arc.
") HasLastPoint;
		bool HasLastPoint();

		/****** Contap_TheSegmentOfTheSearch::LastPoint ******/
		/****** md5 signature: 7278121f151ef35144b484648f11d70b ******/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "Return
-------
Contap_ThePathPointOfTheSearch

Description
-----------
Returns the last point.
") LastPoint;
		const Contap_ThePathPointOfTheSearch & LastPoint();

		/****** Contap_TheSegmentOfTheSearch::SetLimitPoint ******/
		/****** md5 signature: 9189ddf8c9fb0d4e5cdadece7094cab3 ******/
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
Defines the first point or the last point, depending on the value of the boolean First.
") SetLimitPoint;
		void SetLimitPoint(const Contap_ThePathPointOfTheSearch & V, const bool First);

		/****** Contap_TheSegmentOfTheSearch::SetValue ******/
		/****** md5 signature: 53ce9238106071febf6db57a0ff8a99c ******/
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
class Contap_TheHSequenceOfPoint : public NCollection_Sequence<Contap_Point>, public Standard_Transient {
  public:
    Contap_TheHSequenceOfPoint();
    Contap_TheHSequenceOfPoint(const NCollection_Sequence<Contap_Point>& theOther);
    const NCollection_Sequence<Contap_Point>& Sequence();
    void Append (const NCollection_Sequence<Contap_Point>::value_type& theItem);
    void Append (NCollection_Sequence<Contap_Point>& theSequence);
    NCollection_Sequence<Contap_Point>& ChangeSequence();
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
