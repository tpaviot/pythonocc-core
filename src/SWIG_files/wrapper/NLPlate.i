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

    def __iter__(self):
        it = NLPlate_ListIteratorOfStackOfPlate(self.this)
        while it.More():
            it.Next()
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
		/****** md5 signature: 207f981136e4bc99c5ca61264358e7b6 ******/
		%feature("compactdefaultargs") ActiveOrder;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") ActiveOrder;
		virtual Standard_Integer ActiveOrder();

		/****** NLPlate_HGPPConstraint::G0Criterion ******/
		/****** md5 signature: ba8941054f3bef1b8586446aef95008a ******/
		%feature("compactdefaultargs") G0Criterion;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") G0Criterion;
		virtual Standard_Real G0Criterion();

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
		/****** md5 signature: 31d11b63407a14d85e9e9aec37b45159 ******/
		%feature("compactdefaultargs") G1Criterion;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") G1Criterion;
		virtual Standard_Real G1Criterion();

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
		/****** md5 signature: 3cf8898f4703729297d25dd47610bd05 ******/
		%feature("compactdefaultargs") G2Criterion;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") G2Criterion;
		virtual Standard_Real G2Criterion();

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
		/****** md5 signature: 99cf500765c267aed9803a3a3f0a7e24 ******/
		%feature("compactdefaultargs") G3Criterion;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") G3Criterion;
		virtual Standard_Real G3Criterion();

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
		/****** md5 signature: 7c7315b54d9a7e147b571212d6803624 ******/
		%feature("compactdefaultargs") IncrementalLoadAllowed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IncrementalLoadAllowed;
		virtual Standard_Boolean IncrementalLoadAllowed();

		/****** NLPlate_HGPPConstraint::IsG0 ******/
		/****** md5 signature: 08fe88465c5215214e5444d30c67d76c ******/
		%feature("compactdefaultargs") IsG0;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsG0;
		virtual Standard_Boolean IsG0();

		/****** NLPlate_HGPPConstraint::Orientation ******/
		/****** md5 signature: 6ffae01230ed6b4d068ed7cf8cbbd010 ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Orientation;
		virtual Standard_Integer Orientation();

		/****** NLPlate_HGPPConstraint::SetActiveOrder ******/
		/****** md5 signature: 6627a648b481434f1002d963b524e3af ******/
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
		virtual void SetActiveOrder(const Standard_Integer ActiveOrder);

		/****** NLPlate_HGPPConstraint::SetG0Criterion ******/
		/****** md5 signature: e5d4f72943d156f9c7f28ac0f1abcdaf ******/
		%feature("compactdefaultargs") SetG0Criterion;
		%feature("autodoc", "
Parameters
----------
TolDist: float

Return
-------
None

Description
-----------
No available documentation.
") SetG0Criterion;
		virtual void SetG0Criterion(const Standard_Real TolDist);

		/****** NLPlate_HGPPConstraint::SetG1Criterion ******/
		/****** md5 signature: 8561aa02e6a3bca55c5cf2251a617031 ******/
		%feature("compactdefaultargs") SetG1Criterion;
		%feature("autodoc", "
Parameters
----------
TolAng: float

Return
-------
None

Description
-----------
No available documentation.
") SetG1Criterion;
		virtual void SetG1Criterion(const Standard_Real TolAng);

		/****** NLPlate_HGPPConstraint::SetG2Criterion ******/
		/****** md5 signature: a5d122722718f3249ba2858c9130d173 ******/
		%feature("compactdefaultargs") SetG2Criterion;
		%feature("autodoc", "
Parameters
----------
TolCurv: float

Return
-------
None

Description
-----------
No available documentation.
") SetG2Criterion;
		virtual void SetG2Criterion(const Standard_Real TolCurv);

		/****** NLPlate_HGPPConstraint::SetG3Criterion ******/
		/****** md5 signature: 462055d65dd5761a7a23baa70e645f0a ******/
		%feature("compactdefaultargs") SetG3Criterion;
		%feature("autodoc", "
Parameters
----------
TolG3: float

Return
-------
None

Description
-----------
No available documentation.
") SetG3Criterion;
		virtual void SetG3Criterion(const Standard_Real TolG3);

		/****** NLPlate_HGPPConstraint::SetIncrementalLoadAllowed ******/
		/****** md5 signature: 7e009556044893c9ae3e1a7a25394afd ******/
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
		virtual void SetIncrementalLoadAllowed(const Standard_Boolean ILA);

		/****** NLPlate_HGPPConstraint::SetOrientation ******/
		/****** md5 signature: 724d8e15895379fb96f93b0fe0397464 ******/
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
		virtual void SetOrientation(const Standard_Integer Orient = 0);

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
		/****** md5 signature: 054df600273171ea2ae36dd4be001662 ******/
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
		virtual void SetUVFreeSliding(const Standard_Boolean UVFree);

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
		/****** md5 signature: 93c1bebffd1d30511fbb15c3c2a58ad0 ******/
		%feature("compactdefaultargs") UVFreeSliding;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") UVFreeSliding;
		virtual Standard_Boolean UVFreeSliding();

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
		/****** md5 signature: d4a48f8fb1eb1520a9a7fb5afa2be1fa ******/
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
		void ConstraintsSliding(const Standard_Integer NbIterations = 3);

		/****** NLPlate_NLPlate::Continuity ******/
		/****** md5 signature: 4419dd4b2da2aca1389c21e00b442ec1 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Continuity;
		Standard_Integer Continuity();

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
		/****** md5 signature: a5aa59fe21be13fd1db05e43decf620a ******/
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
		gp_XYZ EvaluateDerivative(const gp_XY & point2d, const Standard_Integer iu, const Standard_Integer iv);

		/****** NLPlate_NLPlate::IncrementalSolve ******/
		/****** md5 signature: 3c5787eb578a340e102dc86c6605f27a ******/
		%feature("compactdefaultargs") IncrementalSolve;
		%feature("autodoc", "
Parameters
----------
ord: int (optional, default to 2)
InitialConsraintOrder: int (optional, default to 1)
NbIncrements: int (optional, default to 4)
UVSliding: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
No available documentation.
") IncrementalSolve;
		void IncrementalSolve(const Standard_Integer ord = 2, const Standard_Integer InitialConsraintOrder = 1, const Standard_Integer NbIncrements = 4, const Standard_Boolean UVSliding = Standard_False);

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
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if all has been correctly done.
") IsDone;
		Standard_Boolean IsDone();

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
		/****** md5 signature: 57aff8daf8373de430daf5263a89c05d ******/
		%feature("compactdefaultargs") MaxActiveConstraintOrder;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") MaxActiveConstraintOrder;
		Standard_Integer MaxActiveConstraintOrder();

		/****** NLPlate_NLPlate::Solve ******/
		/****** md5 signature: 6c1fbbdbf6d985a1437f905be32fd064 ******/
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
		void Solve(const Standard_Integer ord = 2, const Standard_Integer InitialConsraintOrder = 1);

		/****** NLPlate_NLPlate::Solve2 ******/
		/****** md5 signature: 17043f969e66303a26057adf838fd9bd ******/
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
		void Solve2(const Standard_Integer ord = 2, const Standard_Integer InitialConsraintOrder = 1);

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
		/****** md5 signature: 6b890b04a93d6b95a211597e197dfec3 ******/
		%feature("compactdefaultargs") ActiveOrder;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") ActiveOrder;
		virtual Standard_Integer ActiveOrder();

		/****** NLPlate_HPG0Constraint::G0Target ******/
		/****** md5 signature: b3cc59bdd12fca24d022fc570683c0b3 ******/
		%feature("compactdefaultargs") G0Target;
		%feature("autodoc", "Return
-------
gp_XYZ

Description
-----------
No available documentation.
") G0Target;
		virtual const gp_XYZ G0Target();

		/****** NLPlate_HPG0Constraint::IncrementalLoadAllowed ******/
		/****** md5 signature: 21e2582a7a409a03d8976ae06f48d2d9 ******/
		%feature("compactdefaultargs") IncrementalLoadAllowed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IncrementalLoadAllowed;
		virtual Standard_Boolean IncrementalLoadAllowed();

		/****** NLPlate_HPG0Constraint::IsG0 ******/
		/****** md5 signature: 68f49666422590db1bfac5d2876b7821 ******/
		%feature("compactdefaultargs") IsG0;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsG0;
		virtual Standard_Boolean IsG0();

		/****** NLPlate_HPG0Constraint::SetIncrementalLoadAllowed ******/
		/****** md5 signature: c5a3cf4bde13a3200190dfc3383fca0e ******/
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
		virtual void SetIncrementalLoadAllowed(const Standard_Boolean ILA);

		/****** NLPlate_HPG0Constraint::SetUVFreeSliding ******/
		/****** md5 signature: 1627e60d0aeecbc5345e27692aa6bbbb ******/
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
		virtual void SetUVFreeSliding(const Standard_Boolean UVFree);

		/****** NLPlate_HPG0Constraint::UVFreeSliding ******/
		/****** md5 signature: c571574ce76211546a7c3eaa5a16a836 ******/
		%feature("compactdefaultargs") UVFreeSliding;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") UVFreeSliding;
		virtual Standard_Boolean UVFreeSliding();

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
		/****** md5 signature: 6b890b04a93d6b95a211597e197dfec3 ******/
		%feature("compactdefaultargs") ActiveOrder;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") ActiveOrder;
		virtual Standard_Integer ActiveOrder();

		/****** NLPlate_HPG1Constraint::G1Target ******/
		/****** md5 signature: 38327234597f33776755c3d91c20782f ******/
		%feature("compactdefaultargs") G1Target;
		%feature("autodoc", "Return
-------
Plate_D1

Description
-----------
No available documentation.
") G1Target;
		virtual const Plate_D1 & G1Target();

		/****** NLPlate_HPG1Constraint::IncrementalLoadAllowed ******/
		/****** md5 signature: 21e2582a7a409a03d8976ae06f48d2d9 ******/
		%feature("compactdefaultargs") IncrementalLoadAllowed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IncrementalLoadAllowed;
		virtual Standard_Boolean IncrementalLoadAllowed();

		/****** NLPlate_HPG1Constraint::IsG0 ******/
		/****** md5 signature: 68f49666422590db1bfac5d2876b7821 ******/
		%feature("compactdefaultargs") IsG0;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsG0;
		virtual Standard_Boolean IsG0();

		/****** NLPlate_HPG1Constraint::Orientation ******/
		/****** md5 signature: 8412e37c175a1f9c850f04016f5685b7 ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Orientation;
		virtual Standard_Integer Orientation();

		/****** NLPlate_HPG1Constraint::SetIncrementalLoadAllowed ******/
		/****** md5 signature: c5a3cf4bde13a3200190dfc3383fca0e ******/
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
		virtual void SetIncrementalLoadAllowed(const Standard_Boolean ILA);

		/****** NLPlate_HPG1Constraint::SetOrientation ******/
		/****** md5 signature: 75e698f74ad007f6ce15d59817bdcb28 ******/
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
		virtual void SetOrientation(const Standard_Integer Orient = 0);

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
		/****** md5 signature: 6b890b04a93d6b95a211597e197dfec3 ******/
		%feature("compactdefaultargs") ActiveOrder;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") ActiveOrder;
		virtual Standard_Integer ActiveOrder();

		/****** NLPlate_HPG0G1Constraint::G1Target ******/
		/****** md5 signature: 38327234597f33776755c3d91c20782f ******/
		%feature("compactdefaultargs") G1Target;
		%feature("autodoc", "Return
-------
Plate_D1

Description
-----------
No available documentation.
") G1Target;
		virtual const Plate_D1 & G1Target();

		/****** NLPlate_HPG0G1Constraint::Orientation ******/
		/****** md5 signature: 8412e37c175a1f9c850f04016f5685b7 ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Orientation;
		virtual Standard_Integer Orientation();

		/****** NLPlate_HPG0G1Constraint::SetOrientation ******/
		/****** md5 signature: 75e698f74ad007f6ce15d59817bdcb28 ******/
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
		virtual void SetOrientation(const Standard_Integer Orient = 0);

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
		/****** md5 signature: 6b890b04a93d6b95a211597e197dfec3 ******/
		%feature("compactdefaultargs") ActiveOrder;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") ActiveOrder;
		virtual Standard_Integer ActiveOrder();

		/****** NLPlate_HPG2Constraint::G2Target ******/
		/****** md5 signature: 1b1bf9555e1b6b2f267ff993ec1e6c8f ******/
		%feature("compactdefaultargs") G2Target;
		%feature("autodoc", "Return
-------
Plate_D2

Description
-----------
No available documentation.
") G2Target;
		virtual const Plate_D2 & G2Target();

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
		/****** md5 signature: 6b890b04a93d6b95a211597e197dfec3 ******/
		%feature("compactdefaultargs") ActiveOrder;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") ActiveOrder;
		virtual Standard_Integer ActiveOrder();

		/****** NLPlate_HPG0G2Constraint::G2Target ******/
		/****** md5 signature: 1b1bf9555e1b6b2f267ff993ec1e6c8f ******/
		%feature("compactdefaultargs") G2Target;
		%feature("autodoc", "Return
-------
Plate_D2

Description
-----------
No available documentation.
") G2Target;
		virtual const Plate_D2 & G2Target();

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
		/****** md5 signature: 6b890b04a93d6b95a211597e197dfec3 ******/
		%feature("compactdefaultargs") ActiveOrder;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") ActiveOrder;
		virtual Standard_Integer ActiveOrder();

		/****** NLPlate_HPG3Constraint::G3Target ******/
		/****** md5 signature: 011f821af879ff512d978c49a235e4b5 ******/
		%feature("compactdefaultargs") G3Target;
		%feature("autodoc", "Return
-------
Plate_D3

Description
-----------
No available documentation.
") G3Target;
		virtual const Plate_D3 & G3Target();

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
		/****** md5 signature: 6b890b04a93d6b95a211597e197dfec3 ******/
		%feature("compactdefaultargs") ActiveOrder;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") ActiveOrder;
		virtual Standard_Integer ActiveOrder();

		/****** NLPlate_HPG0G3Constraint::G3Target ******/
		/****** md5 signature: 011f821af879ff512d978c49a235e4b5 ******/
		%feature("compactdefaultargs") G3Target;
		%feature("autodoc", "Return
-------
Plate_D3

Description
-----------
No available documentation.
") G3Target;
		virtual const Plate_D3 & G3Target();

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
