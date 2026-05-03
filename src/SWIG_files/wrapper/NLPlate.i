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
%define NLPLATEDOCSTRING
"NLPlate module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_nlplate.html"
%enddef
%module (package="OCC.Core", docstring=NLPLATEDOCSTRING) NLPlate


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
#include<NLPlate_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<gp_module.hxx>
#include<Plate_module.hxx>
#include<Geom_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import gp.i
%import Plate.i
%import Geom.i

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
%wrap_handle(NLPlate_HGPPConstraint)
%wrap_handle(NLPlate_HPG0Constraint)
%wrap_handle(NLPlate_HPG1Constraint)
%wrap_handle(NLPlate_HPG0G1Constraint)
%wrap_handle(NLPlate_HPG2Constraint)
%wrap_handle(NLPlate_HPG0G2Constraint)
%wrap_handle(NLPlate_HPG3Constraint)
%wrap_handle(NLPlate_HPG0G3Constraint)
/* end handles declaration */

/* templates */
%template(NLPlate_ListIteratorOfStackOfPlate) NCollection_TListIterator<Plate_Plate>;
%template(NLPlate_SequenceOfHGPPConstraint) NCollection_Sequence<opencascade::handle<NLPlate_HGPPConstraint>>;

%extend NCollection_Sequence<opencascade::handle<NLPlate_HGPPConstraint>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(NLPlate_StackOfPlate) NCollection_List<Plate_Plate>;

%extend NCollection_List<Plate_Plate> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_List<Plate_Plate>::Iterator NLPlate_ListIteratorOfStackOfPlate;
typedef NCollection_Sequence<opencascade::handle<NLPlate_HGPPConstraint>> NLPlate_SequenceOfHGPPConstraint;
typedef NCollection_List<Plate_Plate> NLPlate_StackOfPlate;
/* end typedefs declaration */

/*******************************
* class NLPlate_HGPPConstraint *
*******************************/
%nodefaultctor NLPlate_HGPPConstraint;
class NLPlate_HGPPConstraint : public Standard_Transient {
	public:
		/****** NLPlate_HGPPConstraint::ActiveOrder ******/
		/****** md5 signature: 0c5f1ef2150201a94d62ec7c9368e82a ******/
		%feature("compactdefaultargs") ActiveOrder;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") ActiveOrder;
		virtual int ActiveOrder();

		/****** NLPlate_HGPPConstraint::G0Criterion ******/
		/****** md5 signature: 316ceb1cd59b01d89c00459a677f46ee ******/
		%feature("compactdefaultargs") G0Criterion;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") G0Criterion;
		virtual double G0Criterion();

		/****** NLPlate_HGPPConstraint::G0Target ******/
		/****** md5 signature: 45a091f6ac88380af9a7e9cd9013e18b ******/
		%feature("compactdefaultargs") G0Target;
		%feature("autodoc", "Return
-------
gp_XYZ

Description
-----------
No available documentation.
") G0Target;
		virtual const gp_XYZ G0Target();

		/****** NLPlate_HGPPConstraint::G1Criterion ******/
		/****** md5 signature: 8bb8c0748fc0373c5782cab21b25bb37 ******/
		%feature("compactdefaultargs") G1Criterion;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") G1Criterion;
		virtual double G1Criterion();

		/****** NLPlate_HGPPConstraint::G1Target ******/
		/****** md5 signature: 369f87a65440b83b1ee1c3335e2c3883 ******/
		%feature("compactdefaultargs") G1Target;
		%feature("autodoc", "Return
-------
Plate_D1

Description
-----------
No available documentation.
") G1Target;
		virtual const Plate_D1 & G1Target();

		/****** NLPlate_HGPPConstraint::G2Criterion ******/
		/****** md5 signature: 93c53b753e3b614043e7639d3e21d9f4 ******/
		%feature("compactdefaultargs") G2Criterion;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") G2Criterion;
		virtual double G2Criterion();

		/****** NLPlate_HGPPConstraint::G2Target ******/
		/****** md5 signature: a3b5c84a57d4b1f8e190d9162b5d317a ******/
		%feature("compactdefaultargs") G2Target;
		%feature("autodoc", "Return
-------
Plate_D2

Description
-----------
No available documentation.
") G2Target;
		virtual const Plate_D2 & G2Target();

		/****** NLPlate_HGPPConstraint::G3Criterion ******/
		/****** md5 signature: 41a8b3879d6f368a6b988a2551138c4c ******/
		%feature("compactdefaultargs") G3Criterion;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") G3Criterion;
		virtual double G3Criterion();

		/****** NLPlate_HGPPConstraint::G3Target ******/
		/****** md5 signature: e60232ada2a52449bfff96c4ceccfb36 ******/
		%feature("compactdefaultargs") G3Target;
		%feature("autodoc", "Return
-------
Plate_D3

Description
-----------
No available documentation.
") G3Target;
		virtual const Plate_D3 & G3Target();

		/****** NLPlate_HGPPConstraint::IncrementalLoadAllowed ******/
		/****** md5 signature: ac44370c45e3bf6345dbc25a59734f40 ******/
		%feature("compactdefaultargs") IncrementalLoadAllowed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IncrementalLoadAllowed;
		virtual bool IncrementalLoadAllowed();

		/****** NLPlate_HGPPConstraint::IsG0 ******/
		/****** md5 signature: 6af6214d2723396b4c6f1cc08ae97415 ******/
		%feature("compactdefaultargs") IsG0;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsG0;
		virtual bool IsG0();

		/****** NLPlate_HGPPConstraint::Orientation ******/
		/****** md5 signature: 8c1c72e48fe1e82afc8d392dad080aa1 ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Orientation;
		virtual int Orientation();

		/****** NLPlate_HGPPConstraint::SetActiveOrder ******/
		/****** md5 signature: b2806dc38b0b8e03fc72941f4141109f ******/
		%feature("compactdefaultargs") SetActiveOrder;
		%feature("autodoc", "
Parameters
----------
ActiveOrder: int

Return
-------
None

Description
-----------
No available documentation.
") SetActiveOrder;
		virtual void SetActiveOrder(const int ActiveOrder);

		/****** NLPlate_HGPPConstraint::SetG0Criterion ******/
		/****** md5 signature: f17622cd5ba5522bfd17856941d39044 ******/
		%feature("compactdefaultargs") SetG0Criterion;
		%feature("autodoc", "
Parameters
----------
TolDist: double

Return
-------
None

Description
-----------
No available documentation.
") SetG0Criterion;
		virtual void SetG0Criterion(const double TolDist);

		/****** NLPlate_HGPPConstraint::SetG1Criterion ******/
		/****** md5 signature: eb4d49234ee96cc245e581595cfdb262 ******/
		%feature("compactdefaultargs") SetG1Criterion;
		%feature("autodoc", "
Parameters
----------
TolAng: double

Return
-------
None

Description
-----------
No available documentation.
") SetG1Criterion;
		virtual void SetG1Criterion(const double TolAng);

		/****** NLPlate_HGPPConstraint::SetG2Criterion ******/
		/****** md5 signature: b337661219a2d4865ae34e2f0c81039b ******/
		%feature("compactdefaultargs") SetG2Criterion;
		%feature("autodoc", "
Parameters
----------
TolCurv: double

Return
-------
None

Description
-----------
No available documentation.
") SetG2Criterion;
		virtual void SetG2Criterion(const double TolCurv);

		/****** NLPlate_HGPPConstraint::SetG3Criterion ******/
		/****** md5 signature: a60cadddbe3261f9ba84eae88aa56820 ******/
		%feature("compactdefaultargs") SetG3Criterion;
		%feature("autodoc", "
Parameters
----------
TolG3: double

Return
-------
None

Description
-----------
No available documentation.
") SetG3Criterion;
		virtual void SetG3Criterion(const double TolG3);

		/****** NLPlate_HGPPConstraint::SetIncrementalLoadAllowed ******/
		/****** md5 signature: aebc528c81af8f198845dde6f193547c ******/
		%feature("compactdefaultargs") SetIncrementalLoadAllowed;
		%feature("autodoc", "
Parameters
----------
ILA: bool

Return
-------
None

Description
-----------
No available documentation.
") SetIncrementalLoadAllowed;
		virtual void SetIncrementalLoadAllowed(const bool ILA);

		/****** NLPlate_HGPPConstraint::SetOrientation ******/
		/****** md5 signature: ea8472efb6fc344d596e1410c81f40bb ******/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "
Parameters
----------
Orient: int (optional, default to 0)

Return
-------
None

Description
-----------
No available documentation.
") SetOrientation;
		virtual void SetOrientation(const int Orient = 0);

		/****** NLPlate_HGPPConstraint::SetUV ******/
		/****** md5 signature: 420be248beddde77fb3461339c4ac873 ******/
		%feature("compactdefaultargs") SetUV;
		%feature("autodoc", "
Parameters
----------
UV: gp_XY

Return
-------
None

Description
-----------
No available documentation.
") SetUV;
		virtual void SetUV(const gp_XY & UV);

		/****** NLPlate_HGPPConstraint::SetUVFreeSliding ******/
		/****** md5 signature: f6fc3791f262a2de5f106d940f31cde5 ******/
		%feature("compactdefaultargs") SetUVFreeSliding;
		%feature("autodoc", "
Parameters
----------
UVFree: bool

Return
-------
None

Description
-----------
No available documentation.
") SetUVFreeSliding;
		virtual void SetUVFreeSliding(const bool UVFree);

		/****** NLPlate_HGPPConstraint::UV ******/
		/****** md5 signature: b56f9b837cceb3ce9b7ff3e2244aca28 ******/
		%feature("compactdefaultargs") UV;
		%feature("autodoc", "Return
-------
gp_XY

Description
-----------
No available documentation.
") UV;
		virtual const gp_XY UV();

		/****** NLPlate_HGPPConstraint::UVFreeSliding ******/
		/****** md5 signature: 443f055cf6b0e7cf107b8786fc930eea ******/
		%feature("compactdefaultargs") UVFreeSliding;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") UVFreeSliding;
		virtual bool UVFreeSliding();

};


%make_alias(NLPlate_HGPPConstraint)

%extend NLPlate_HGPPConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class NLPlate_NLPlate *
************************/
class NLPlate_NLPlate {
	public:
		/****** NLPlate_NLPlate::NLPlate_NLPlate ******/
		/****** md5 signature: 7af30ab3c4835853ad33edbbf547002d ******/
		%feature("compactdefaultargs") NLPlate_NLPlate;
		%feature("autodoc", "
Parameters
----------
InitialSurface: Geom_Surface

Return
-------
None

Description
-----------
No available documentation.
") NLPlate_NLPlate;
		 NLPlate_NLPlate(const opencascade::handle<Geom_Surface> & InitialSurface);

		/****** NLPlate_NLPlate::ConstraintsSliding ******/
		/****** md5 signature: f9c356b897acc9509d37c98c6c92068f ******/
		%feature("compactdefaultargs") ConstraintsSliding;
		%feature("autodoc", "
Parameters
----------
NbIterations: int (optional, default to 3)

Return
-------
None

Description
-----------
No available documentation.
") ConstraintsSliding;
		void ConstraintsSliding(const int NbIterations = 3);

		/****** NLPlate_NLPlate::Continuity ******/
		/****** md5 signature: 0adef6f18eec5ea0742df74b4e0726ff ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Continuity;
		int Continuity();

		/****** NLPlate_NLPlate::Evaluate ******/
		/****** md5 signature: ea37005a58aaa9db10c00849da660f56 ******/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "
Parameters
----------
point2d: gp_XY

Return
-------
gp_XYZ

Description
-----------
No available documentation.
") Evaluate;
		gp_XYZ Evaluate(const gp_XY & point2d);

		/****** NLPlate_NLPlate::EvaluateDerivative ******/
		/****** md5 signature: 5ac31cfe60561d9e232523d83d2e27cc ******/
		%feature("compactdefaultargs") EvaluateDerivative;
		%feature("autodoc", "
Parameters
----------
point2d: gp_XY
iu: int
iv: int

Return
-------
gp_XYZ

Description
-----------
No available documentation.
") EvaluateDerivative;
		gp_XYZ EvaluateDerivative(const gp_XY & point2d, const int iu, const int iv);

		/****** NLPlate_NLPlate::IncrementalSolve ******/
		/****** md5 signature: a2c981ecd8d66af57b5cd4dc4c68e521 ******/
		%feature("compactdefaultargs") IncrementalSolve;
		%feature("autodoc", "
Parameters
----------
ord: int (optional, default to 2)
InitialConsraintOrder: int (optional, default to 1)
NbIncrements: int (optional, default to 4)
UVSliding: bool (optional, default to false)

Return
-------
None

Description
-----------
No available documentation.
") IncrementalSolve;
		void IncrementalSolve(const int ord = 2, const int InitialConsraintOrder = 1, const int NbIncrements = 4, const bool UVSliding = false);

		/****** NLPlate_NLPlate::Init ******/
		/****** md5 signature: 0de93ef32c53d091768788dca0e281fd ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
reset the Plate in the initial state ( same as after Create((Surface)).
") Init;
		void Init();

		/****** NLPlate_NLPlate::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if all has been correctly done.
") IsDone;
		bool IsDone();

		/****** NLPlate_NLPlate::Load ******/
		/****** md5 signature: 714715458486d91f5574e2a0231a2780 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
GConst: NLPlate_HGPPConstraint

Return
-------
None

Description
-----------
No available documentation.
") Load;
		void Load(const opencascade::handle<NLPlate_HGPPConstraint> & GConst);

		/****** NLPlate_NLPlate::MaxActiveConstraintOrder ******/
		/****** md5 signature: 0642823f305faee0ab639fc706e4d9af ******/
		%feature("compactdefaultargs") MaxActiveConstraintOrder;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") MaxActiveConstraintOrder;
		int MaxActiveConstraintOrder();

		/****** NLPlate_NLPlate::Solve ******/
		/****** md5 signature: ba9df9b94cc987bbe2f57e4501d59dfc ******/
		%feature("compactdefaultargs") Solve;
		%feature("autodoc", "
Parameters
----------
ord: int (optional, default to 2)
InitialConsraintOrder: int (optional, default to 1)

Return
-------
None

Description
-----------
No available documentation.
") Solve;
		void Solve(const int ord = 2, const int InitialConsraintOrder = 1);

		/****** NLPlate_NLPlate::Solve2 ******/
		/****** md5 signature: 40103a2bbeb960794f28a3f618da65e4 ******/
		%feature("compactdefaultargs") Solve2;
		%feature("autodoc", "
Parameters
----------
ord: int (optional, default to 2)
InitialConsraintOrder: int (optional, default to 1)

Return
-------
None

Description
-----------
No available documentation.
") Solve2;
		void Solve2(const int ord = 2, const int InitialConsraintOrder = 1);

		/****** NLPlate_NLPlate::destroy ******/
		/****** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ******/
		%feature("compactdefaultargs") destroy;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") destroy;
		void destroy();

};


%extend NLPlate_NLPlate {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class NLPlate_HPG0Constraint *
*******************************/
class NLPlate_HPG0Constraint : public NLPlate_HGPPConstraint {
	public:
		/****** NLPlate_HPG0Constraint::NLPlate_HPG0Constraint ******/
		/****** md5 signature: a5cd01af20202ed553dd0f8581182db5 ******/
		%feature("compactdefaultargs") NLPlate_HPG0Constraint;
		%feature("autodoc", "
Parameters
----------
UV: gp_XY
Value: gp_XYZ

Return
-------
None

Description
-----------
No available documentation.
") NLPlate_HPG0Constraint;
		 NLPlate_HPG0Constraint(const gp_XY & UV, const gp_XYZ & Value);

		/****** NLPlate_HPG0Constraint::ActiveOrder ******/
		/****** md5 signature: 55e008448046091255f11251f1e137c4 ******/
		%feature("compactdefaultargs") ActiveOrder;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") ActiveOrder;
		int ActiveOrder();

		/****** NLPlate_HPG0Constraint::G0Target ******/
		/****** md5 signature: d65dbe28545631ddad91b8fb2574dd5e ******/
		%feature("compactdefaultargs") G0Target;
		%feature("autodoc", "Return
-------
gp_XYZ

Description
-----------
No available documentation.
") G0Target;
		const gp_XYZ G0Target();

		/****** NLPlate_HPG0Constraint::IncrementalLoadAllowed ******/
		/****** md5 signature: 89f023be946c6385fe7216dc125d79a2 ******/
		%feature("compactdefaultargs") IncrementalLoadAllowed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IncrementalLoadAllowed;
		bool IncrementalLoadAllowed();

		/****** NLPlate_HPG0Constraint::IsG0 ******/
		/****** md5 signature: 16ca3514320a5a31fb7b08ea0fe10920 ******/
		%feature("compactdefaultargs") IsG0;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsG0;
		bool IsG0();

		/****** NLPlate_HPG0Constraint::SetIncrementalLoadAllowed ******/
		/****** md5 signature: 332150d13ca88af92e1571d0a6dd02a4 ******/
		%feature("compactdefaultargs") SetIncrementalLoadAllowed;
		%feature("autodoc", "
Parameters
----------
ILA: bool

Return
-------
None

Description
-----------
No available documentation.
") SetIncrementalLoadAllowed;
		void SetIncrementalLoadAllowed(const bool ILA);

		/****** NLPlate_HPG0Constraint::SetUVFreeSliding ******/
		/****** md5 signature: 268c3ffd779d920712db1ea23980480f ******/
		%feature("compactdefaultargs") SetUVFreeSliding;
		%feature("autodoc", "
Parameters
----------
UVFree: bool

Return
-------
None

Description
-----------
No available documentation.
") SetUVFreeSliding;
		void SetUVFreeSliding(const bool UVFree);

		/****** NLPlate_HPG0Constraint::UVFreeSliding ******/
		/****** md5 signature: a33ffa3faac3e9f7efdcf0ff6a8dbe8d ******/
		%feature("compactdefaultargs") UVFreeSliding;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") UVFreeSliding;
		bool UVFreeSliding();

};


%make_alias(NLPlate_HPG0Constraint)

%extend NLPlate_HPG0Constraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class NLPlate_HPG1Constraint *
*******************************/
class NLPlate_HPG1Constraint : public NLPlate_HGPPConstraint {
	public:
		/****** NLPlate_HPG1Constraint::NLPlate_HPG1Constraint ******/
		/****** md5 signature: a57398b45a7d003005fed66f10e35502 ******/
		%feature("compactdefaultargs") NLPlate_HPG1Constraint;
		%feature("autodoc", "
Parameters
----------
UV: gp_XY
D1T: Plate_D1

Return
-------
None

Description
-----------
No available documentation.
") NLPlate_HPG1Constraint;
		 NLPlate_HPG1Constraint(const gp_XY & UV, const Plate_D1 & D1T);

		/****** NLPlate_HPG1Constraint::ActiveOrder ******/
		/****** md5 signature: 55e008448046091255f11251f1e137c4 ******/
		%feature("compactdefaultargs") ActiveOrder;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") ActiveOrder;
		int ActiveOrder();

		/****** NLPlate_HPG1Constraint::G1Target ******/
		/****** md5 signature: 613d23044b830e66b22f88dc095ae4ee ******/
		%feature("compactdefaultargs") G1Target;
		%feature("autodoc", "Return
-------
Plate_D1

Description
-----------
No available documentation.
") G1Target;
		const Plate_D1 & G1Target();

		/****** NLPlate_HPG1Constraint::IncrementalLoadAllowed ******/
		/****** md5 signature: 89f023be946c6385fe7216dc125d79a2 ******/
		%feature("compactdefaultargs") IncrementalLoadAllowed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IncrementalLoadAllowed;
		bool IncrementalLoadAllowed();

		/****** NLPlate_HPG1Constraint::IsG0 ******/
		/****** md5 signature: 16ca3514320a5a31fb7b08ea0fe10920 ******/
		%feature("compactdefaultargs") IsG0;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsG0;
		bool IsG0();

		/****** NLPlate_HPG1Constraint::Orientation ******/
		/****** md5 signature: 20f8deda1b4e97fe4239787d9f102f1f ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Orientation;
		int Orientation();

		/****** NLPlate_HPG1Constraint::SetIncrementalLoadAllowed ******/
		/****** md5 signature: 332150d13ca88af92e1571d0a6dd02a4 ******/
		%feature("compactdefaultargs") SetIncrementalLoadAllowed;
		%feature("autodoc", "
Parameters
----------
ILA: bool

Return
-------
None

Description
-----------
No available documentation.
") SetIncrementalLoadAllowed;
		void SetIncrementalLoadAllowed(const bool ILA);

		/****** NLPlate_HPG1Constraint::SetOrientation ******/
		/****** md5 signature: 9754ef885cbb8e1249314592fe1e4629 ******/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "
Parameters
----------
Orient: int (optional, default to 0)

Return
-------
None

Description
-----------
No available documentation.
") SetOrientation;
		void SetOrientation(const int Orient = 0);

};


%make_alias(NLPlate_HPG1Constraint)

%extend NLPlate_HPG1Constraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class NLPlate_HPG0G1Constraint *
*********************************/
class NLPlate_HPG0G1Constraint : public NLPlate_HPG0Constraint {
	public:
		/****** NLPlate_HPG0G1Constraint::NLPlate_HPG0G1Constraint ******/
		/****** md5 signature: 850e62706635d523e3efcf744ee33989 ******/
		%feature("compactdefaultargs") NLPlate_HPG0G1Constraint;
		%feature("autodoc", "
Parameters
----------
UV: gp_XY
Value: gp_XYZ
D1T: Plate_D1

Return
-------
None

Description
-----------
No available documentation.
") NLPlate_HPG0G1Constraint;
		 NLPlate_HPG0G1Constraint(const gp_XY & UV, const gp_XYZ & Value, const Plate_D1 & D1T);

		/****** NLPlate_HPG0G1Constraint::ActiveOrder ******/
		/****** md5 signature: 55e008448046091255f11251f1e137c4 ******/
		%feature("compactdefaultargs") ActiveOrder;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") ActiveOrder;
		int ActiveOrder();

		/****** NLPlate_HPG0G1Constraint::G1Target ******/
		/****** md5 signature: 613d23044b830e66b22f88dc095ae4ee ******/
		%feature("compactdefaultargs") G1Target;
		%feature("autodoc", "Return
-------
Plate_D1

Description
-----------
No available documentation.
") G1Target;
		const Plate_D1 & G1Target();

		/****** NLPlate_HPG0G1Constraint::Orientation ******/
		/****** md5 signature: 20f8deda1b4e97fe4239787d9f102f1f ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Orientation;
		int Orientation();

		/****** NLPlate_HPG0G1Constraint::SetOrientation ******/
		/****** md5 signature: 9754ef885cbb8e1249314592fe1e4629 ******/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "
Parameters
----------
Orient: int (optional, default to 0)

Return
-------
None

Description
-----------
No available documentation.
") SetOrientation;
		void SetOrientation(const int Orient = 0);

};


%make_alias(NLPlate_HPG0G1Constraint)

%extend NLPlate_HPG0G1Constraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class NLPlate_HPG2Constraint *
*******************************/
class NLPlate_HPG2Constraint : public NLPlate_HPG1Constraint {
	public:
		/****** NLPlate_HPG2Constraint::NLPlate_HPG2Constraint ******/
		/****** md5 signature: 38627f06254468605aa503c33c697862 ******/
		%feature("compactdefaultargs") NLPlate_HPG2Constraint;
		%feature("autodoc", "
Parameters
----------
UV: gp_XY
D1T: Plate_D1
D2T: Plate_D2

Return
-------
None

Description
-----------
No available documentation.
") NLPlate_HPG2Constraint;
		 NLPlate_HPG2Constraint(const gp_XY & UV, const Plate_D1 & D1T, const Plate_D2 & D2T);

		/****** NLPlate_HPG2Constraint::ActiveOrder ******/
		/****** md5 signature: 55e008448046091255f11251f1e137c4 ******/
		%feature("compactdefaultargs") ActiveOrder;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") ActiveOrder;
		int ActiveOrder();

		/****** NLPlate_HPG2Constraint::G2Target ******/
		/****** md5 signature: fd1ff1d45be133168457d4f43801f036 ******/
		%feature("compactdefaultargs") G2Target;
		%feature("autodoc", "Return
-------
Plate_D2

Description
-----------
No available documentation.
") G2Target;
		const Plate_D2 & G2Target();

};


%make_alias(NLPlate_HPG2Constraint)

%extend NLPlate_HPG2Constraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class NLPlate_HPG0G2Constraint *
*********************************/
class NLPlate_HPG0G2Constraint : public NLPlate_HPG0G1Constraint {
	public:
		/****** NLPlate_HPG0G2Constraint::NLPlate_HPG0G2Constraint ******/
		/****** md5 signature: 81da3e6375d392e63b721e9edf7137b6 ******/
		%feature("compactdefaultargs") NLPlate_HPG0G2Constraint;
		%feature("autodoc", "
Parameters
----------
UV: gp_XY
Value: gp_XYZ
D1T: Plate_D1
D2T: Plate_D2

Return
-------
None

Description
-----------
No available documentation.
") NLPlate_HPG0G2Constraint;
		 NLPlate_HPG0G2Constraint(const gp_XY & UV, const gp_XYZ & Value, const Plate_D1 & D1T, const Plate_D2 & D2T);

		/****** NLPlate_HPG0G2Constraint::ActiveOrder ******/
		/****** md5 signature: 55e008448046091255f11251f1e137c4 ******/
		%feature("compactdefaultargs") ActiveOrder;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") ActiveOrder;
		int ActiveOrder();

		/****** NLPlate_HPG0G2Constraint::G2Target ******/
		/****** md5 signature: fd1ff1d45be133168457d4f43801f036 ******/
		%feature("compactdefaultargs") G2Target;
		%feature("autodoc", "Return
-------
Plate_D2

Description
-----------
No available documentation.
") G2Target;
		const Plate_D2 & G2Target();

};


%make_alias(NLPlate_HPG0G2Constraint)

%extend NLPlate_HPG0G2Constraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class NLPlate_HPG3Constraint *
*******************************/
class NLPlate_HPG3Constraint : public NLPlate_HPG2Constraint {
	public:
		/****** NLPlate_HPG3Constraint::NLPlate_HPG3Constraint ******/
		/****** md5 signature: 5098389758fadfbbbf060920fafb49ee ******/
		%feature("compactdefaultargs") NLPlate_HPG3Constraint;
		%feature("autodoc", "
Parameters
----------
UV: gp_XY
D1T: Plate_D1
D2T: Plate_D2
D3T: Plate_D3

Return
-------
None

Description
-----------
No available documentation.
") NLPlate_HPG3Constraint;
		 NLPlate_HPG3Constraint(const gp_XY & UV, const Plate_D1 & D1T, const Plate_D2 & D2T, const Plate_D3 & D3T);

		/****** NLPlate_HPG3Constraint::ActiveOrder ******/
		/****** md5 signature: 55e008448046091255f11251f1e137c4 ******/
		%feature("compactdefaultargs") ActiveOrder;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") ActiveOrder;
		int ActiveOrder();

		/****** NLPlate_HPG3Constraint::G3Target ******/
		/****** md5 signature: e0b61a98b120b6a2eae150e4e45e1e55 ******/
		%feature("compactdefaultargs") G3Target;
		%feature("autodoc", "Return
-------
Plate_D3

Description
-----------
No available documentation.
") G3Target;
		const Plate_D3 & G3Target();

};


%make_alias(NLPlate_HPG3Constraint)

%extend NLPlate_HPG3Constraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class NLPlate_HPG0G3Constraint *
*********************************/
class NLPlate_HPG0G3Constraint : public NLPlate_HPG0G2Constraint {
	public:
		/****** NLPlate_HPG0G3Constraint::NLPlate_HPG0G3Constraint ******/
		/****** md5 signature: 01d88b86d7691676ce72451074a6e4fc ******/
		%feature("compactdefaultargs") NLPlate_HPG0G3Constraint;
		%feature("autodoc", "
Parameters
----------
UV: gp_XY
Value: gp_XYZ
D1T: Plate_D1
D2T: Plate_D2
D3T: Plate_D3

Return
-------
None

Description
-----------
No available documentation.
") NLPlate_HPG0G3Constraint;
		 NLPlate_HPG0G3Constraint(const gp_XY & UV, const gp_XYZ & Value, const Plate_D1 & D1T, const Plate_D2 & D2T, const Plate_D3 & D3T);

		/****** NLPlate_HPG0G3Constraint::ActiveOrder ******/
		/****** md5 signature: 55e008448046091255f11251f1e137c4 ******/
		%feature("compactdefaultargs") ActiveOrder;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") ActiveOrder;
		int ActiveOrder();

		/****** NLPlate_HPG0G3Constraint::G3Target ******/
		/****** md5 signature: e0b61a98b120b6a2eae150e4e45e1e55 ******/
		%feature("compactdefaultargs") G3Target;
		%feature("autodoc", "Return
-------
Plate_D3

Description
-----------
No available documentation.
") G3Target;
		const Plate_D3 & G3Target();

};


%make_alias(NLPlate_HPG0G3Constraint)

%extend NLPlate_HPG0G3Constraint {
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
