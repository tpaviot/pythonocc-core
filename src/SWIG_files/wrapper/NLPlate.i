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
%define NLPLATEDOCSTRING
"NLPlate module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_nlplate.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proy classes for enums */
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
%template(NLPlate_StackOfPlate) NCollection_List<Plate_Plate>;
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
		/****************** ActiveOrder ******************/
		%feature("compactdefaultargs") ActiveOrder;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") ActiveOrder;
		virtual Standard_Integer ActiveOrder();

		/****************** G0Criterion ******************/
		%feature("compactdefaultargs") G0Criterion;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") G0Criterion;
		virtual Standard_Real G0Criterion();

		/****************** G0Target ******************/
		%feature("compactdefaultargs") G0Target;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_XYZ
") G0Target;
		virtual const gp_XYZ G0Target();

		/****************** G1Criterion ******************/
		%feature("compactdefaultargs") G1Criterion;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") G1Criterion;
		virtual Standard_Real G1Criterion();

		/****************** G1Target ******************/
		%feature("compactdefaultargs") G1Target;
		%feature("autodoc", "No available documentation.

Returns
-------
Plate_D1
") G1Target;
		virtual const Plate_D1 & G1Target();

		/****************** G2Criterion ******************/
		%feature("compactdefaultargs") G2Criterion;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") G2Criterion;
		virtual Standard_Real G2Criterion();

		/****************** G2Target ******************/
		%feature("compactdefaultargs") G2Target;
		%feature("autodoc", "No available documentation.

Returns
-------
Plate_D2
") G2Target;
		virtual const Plate_D2 & G2Target();

		/****************** G3Criterion ******************/
		%feature("compactdefaultargs") G3Criterion;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") G3Criterion;
		virtual Standard_Real G3Criterion();

		/****************** G3Target ******************/
		%feature("compactdefaultargs") G3Target;
		%feature("autodoc", "No available documentation.

Returns
-------
Plate_D3
") G3Target;
		virtual const Plate_D3 & G3Target();

		/****************** IncrementalLoadAllowed ******************/
		%feature("compactdefaultargs") IncrementalLoadAllowed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IncrementalLoadAllowed;
		virtual Standard_Boolean IncrementalLoadAllowed();

		/****************** IsG0 ******************/
		%feature("compactdefaultargs") IsG0;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsG0;
		virtual Standard_Boolean IsG0();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Orientation;
		virtual Standard_Integer Orientation();

		/****************** SetActiveOrder ******************/
		%feature("compactdefaultargs") SetActiveOrder;
		%feature("autodoc", "No available documentation.

Parameters
----------
ActiveOrder: int

Returns
-------
None
") SetActiveOrder;
		virtual void SetActiveOrder(const Standard_Integer ActiveOrder);

		/****************** SetG0Criterion ******************/
		%feature("compactdefaultargs") SetG0Criterion;
		%feature("autodoc", "No available documentation.

Parameters
----------
TolDist: float

Returns
-------
None
") SetG0Criterion;
		virtual void SetG0Criterion(const Standard_Real TolDist);

		/****************** SetG1Criterion ******************/
		%feature("compactdefaultargs") SetG1Criterion;
		%feature("autodoc", "No available documentation.

Parameters
----------
TolAng: float

Returns
-------
None
") SetG1Criterion;
		virtual void SetG1Criterion(const Standard_Real TolAng);

		/****************** SetG2Criterion ******************/
		%feature("compactdefaultargs") SetG2Criterion;
		%feature("autodoc", "No available documentation.

Parameters
----------
TolCurv: float

Returns
-------
None
") SetG2Criterion;
		virtual void SetG2Criterion(const Standard_Real TolCurv);

		/****************** SetG3Criterion ******************/
		%feature("compactdefaultargs") SetG3Criterion;
		%feature("autodoc", "No available documentation.

Parameters
----------
TolG3: float

Returns
-------
None
") SetG3Criterion;
		virtual void SetG3Criterion(const Standard_Real TolG3);

		/****************** SetIncrementalLoadAllowed ******************/
		%feature("compactdefaultargs") SetIncrementalLoadAllowed;
		%feature("autodoc", "No available documentation.

Parameters
----------
ILA: bool

Returns
-------
None
") SetIncrementalLoadAllowed;
		virtual void SetIncrementalLoadAllowed(const Standard_Boolean ILA);

		/****************** SetOrientation ******************/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "No available documentation.

Parameters
----------
Orient: int,optional
	default value is 0

Returns
-------
None
") SetOrientation;
		virtual void SetOrientation(const Standard_Integer Orient = 0);

		/****************** SetUV ******************/
		%feature("compactdefaultargs") SetUV;
		%feature("autodoc", "No available documentation.

Parameters
----------
UV: gp_XY

Returns
-------
None
") SetUV;
		virtual void SetUV(const gp_XY & UV);

		/****************** SetUVFreeSliding ******************/
		%feature("compactdefaultargs") SetUVFreeSliding;
		%feature("autodoc", "No available documentation.

Parameters
----------
UVFree: bool

Returns
-------
None
") SetUVFreeSliding;
		virtual void SetUVFreeSliding(const Standard_Boolean UVFree);

		/****************** UV ******************/
		%feature("compactdefaultargs") UV;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_XY
") UV;
		virtual const gp_XY UV();

		/****************** UVFreeSliding ******************/
		%feature("compactdefaultargs") UVFreeSliding;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
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
		/****************** NLPlate_NLPlate ******************/
		%feature("compactdefaultargs") NLPlate_NLPlate;
		%feature("autodoc", "No available documentation.

Parameters
----------
InitialSurface: Geom_Surface

Returns
-------
None
") NLPlate_NLPlate;
		 NLPlate_NLPlate(const opencascade::handle<Geom_Surface> & InitialSurface);

		/****************** ConstraintsSliding ******************/
		%feature("compactdefaultargs") ConstraintsSliding;
		%feature("autodoc", "No available documentation.

Parameters
----------
NbIterations: int,optional
	default value is 3

Returns
-------
None
") ConstraintsSliding;
		void ConstraintsSliding(const Standard_Integer NbIterations = 3);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Continuity;
		Standard_Integer Continuity();

		/****************** Evaluate ******************/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "No available documentation.

Parameters
----------
point2d: gp_XY

Returns
-------
gp_XYZ
") Evaluate;
		gp_XYZ Evaluate(const gp_XY & point2d);

		/****************** EvaluateDerivative ******************/
		%feature("compactdefaultargs") EvaluateDerivative;
		%feature("autodoc", "No available documentation.

Parameters
----------
point2d: gp_XY
iu: int
iv: int

Returns
-------
gp_XYZ
") EvaluateDerivative;
		gp_XYZ EvaluateDerivative(const gp_XY & point2d, const Standard_Integer iu, const Standard_Integer iv);

		/****************** IncrementalSolve ******************/
		%feature("compactdefaultargs") IncrementalSolve;
		%feature("autodoc", "No available documentation.

Parameters
----------
ord: int,optional
	default value is 2
InitialConsraintOrder: int,optional
	default value is 1
NbIncrements: int,optional
	default value is 4
UVSliding: bool,optional
	default value is Standard_False

Returns
-------
None
") IncrementalSolve;
		void IncrementalSolve(const Standard_Integer ord = 2, const Standard_Integer InitialConsraintOrder = 1, const Standard_Integer NbIncrements = 4, const Standard_Boolean UVSliding = Standard_False);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Reset the plate in the initial state ( same as after create((surface)).

Returns
-------
None
") Init;
		void Init();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if all has been correctly done.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "No available documentation.

Parameters
----------
GConst: NLPlate_HGPPConstraint

Returns
-------
None
") Load;
		void Load(const opencascade::handle<NLPlate_HGPPConstraint> & GConst);

		/****************** MaxActiveConstraintOrder ******************/
		%feature("compactdefaultargs") MaxActiveConstraintOrder;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") MaxActiveConstraintOrder;
		Standard_Integer MaxActiveConstraintOrder();

		/****************** Solve ******************/
		%feature("compactdefaultargs") Solve;
		%feature("autodoc", "No available documentation.

Parameters
----------
ord: int,optional
	default value is 2
InitialConsraintOrder: int,optional
	default value is 1

Returns
-------
None
") Solve;
		void Solve(const Standard_Integer ord = 2, const Standard_Integer InitialConsraintOrder = 1);

		/****************** Solve2 ******************/
		%feature("compactdefaultargs") Solve2;
		%feature("autodoc", "No available documentation.

Parameters
----------
ord: int,optional
	default value is 2
InitialConsraintOrder: int,optional
	default value is 1

Returns
-------
None
") Solve2;
		void Solve2(const Standard_Integer ord = 2, const Standard_Integer InitialConsraintOrder = 1);

		/****************** destroy ******************/
		%feature("compactdefaultargs") destroy;
		%feature("autodoc", "No available documentation.

Returns
-------
None
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
		/****************** NLPlate_HPG0Constraint ******************/
		%feature("compactdefaultargs") NLPlate_HPG0Constraint;
		%feature("autodoc", "No available documentation.

Parameters
----------
UV: gp_XY
Value: gp_XYZ

Returns
-------
None
") NLPlate_HPG0Constraint;
		 NLPlate_HPG0Constraint(const gp_XY & UV, const gp_XYZ & Value);

		/****************** ActiveOrder ******************/
		%feature("compactdefaultargs") ActiveOrder;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") ActiveOrder;
		virtual Standard_Integer ActiveOrder();

		/****************** G0Target ******************/
		%feature("compactdefaultargs") G0Target;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_XYZ
") G0Target;
		virtual const gp_XYZ G0Target();

		/****************** IncrementalLoadAllowed ******************/
		%feature("compactdefaultargs") IncrementalLoadAllowed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IncrementalLoadAllowed;
		virtual Standard_Boolean IncrementalLoadAllowed();

		/****************** IsG0 ******************/
		%feature("compactdefaultargs") IsG0;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsG0;
		virtual Standard_Boolean IsG0();

		/****************** SetIncrementalLoadAllowed ******************/
		%feature("compactdefaultargs") SetIncrementalLoadAllowed;
		%feature("autodoc", "No available documentation.

Parameters
----------
ILA: bool

Returns
-------
None
") SetIncrementalLoadAllowed;
		virtual void SetIncrementalLoadAllowed(const Standard_Boolean ILA);

		/****************** SetUVFreeSliding ******************/
		%feature("compactdefaultargs") SetUVFreeSliding;
		%feature("autodoc", "No available documentation.

Parameters
----------
UVFree: bool

Returns
-------
None
") SetUVFreeSliding;
		virtual void SetUVFreeSliding(const Standard_Boolean UVFree);

		/****************** UVFreeSliding ******************/
		%feature("compactdefaultargs") UVFreeSliding;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
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
		/****************** NLPlate_HPG1Constraint ******************/
		%feature("compactdefaultargs") NLPlate_HPG1Constraint;
		%feature("autodoc", "No available documentation.

Parameters
----------
UV: gp_XY
D1T: Plate_D1

Returns
-------
None
") NLPlate_HPG1Constraint;
		 NLPlate_HPG1Constraint(const gp_XY & UV, const Plate_D1 & D1T);

		/****************** ActiveOrder ******************/
		%feature("compactdefaultargs") ActiveOrder;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") ActiveOrder;
		virtual Standard_Integer ActiveOrder();

		/****************** G1Target ******************/
		%feature("compactdefaultargs") G1Target;
		%feature("autodoc", "No available documentation.

Returns
-------
Plate_D1
") G1Target;
		virtual const Plate_D1 & G1Target();

		/****************** IncrementalLoadAllowed ******************/
		%feature("compactdefaultargs") IncrementalLoadAllowed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IncrementalLoadAllowed;
		virtual Standard_Boolean IncrementalLoadAllowed();

		/****************** IsG0 ******************/
		%feature("compactdefaultargs") IsG0;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsG0;
		virtual Standard_Boolean IsG0();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Orientation;
		virtual Standard_Integer Orientation();

		/****************** SetIncrementalLoadAllowed ******************/
		%feature("compactdefaultargs") SetIncrementalLoadAllowed;
		%feature("autodoc", "No available documentation.

Parameters
----------
ILA: bool

Returns
-------
None
") SetIncrementalLoadAllowed;
		virtual void SetIncrementalLoadAllowed(const Standard_Boolean ILA);

		/****************** SetOrientation ******************/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "No available documentation.

Parameters
----------
Orient: int,optional
	default value is 0

Returns
-------
None
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
		/****************** NLPlate_HPG0G1Constraint ******************/
		%feature("compactdefaultargs") NLPlate_HPG0G1Constraint;
		%feature("autodoc", "No available documentation.

Parameters
----------
UV: gp_XY
Value: gp_XYZ
D1T: Plate_D1

Returns
-------
None
") NLPlate_HPG0G1Constraint;
		 NLPlate_HPG0G1Constraint(const gp_XY & UV, const gp_XYZ & Value, const Plate_D1 & D1T);

		/****************** ActiveOrder ******************/
		%feature("compactdefaultargs") ActiveOrder;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") ActiveOrder;
		virtual Standard_Integer ActiveOrder();

		/****************** G1Target ******************/
		%feature("compactdefaultargs") G1Target;
		%feature("autodoc", "No available documentation.

Returns
-------
Plate_D1
") G1Target;
		virtual const Plate_D1 & G1Target();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Orientation;
		virtual Standard_Integer Orientation();

		/****************** SetOrientation ******************/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "No available documentation.

Parameters
----------
Orient: int,optional
	default value is 0

Returns
-------
None
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
		/****************** NLPlate_HPG2Constraint ******************/
		%feature("compactdefaultargs") NLPlate_HPG2Constraint;
		%feature("autodoc", "No available documentation.

Parameters
----------
UV: gp_XY
D1T: Plate_D1
D2T: Plate_D2

Returns
-------
None
") NLPlate_HPG2Constraint;
		 NLPlate_HPG2Constraint(const gp_XY & UV, const Plate_D1 & D1T, const Plate_D2 & D2T);

		/****************** ActiveOrder ******************/
		%feature("compactdefaultargs") ActiveOrder;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") ActiveOrder;
		virtual Standard_Integer ActiveOrder();

		/****************** G2Target ******************/
		%feature("compactdefaultargs") G2Target;
		%feature("autodoc", "No available documentation.

Returns
-------
Plate_D2
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
		/****************** NLPlate_HPG0G2Constraint ******************/
		%feature("compactdefaultargs") NLPlate_HPG0G2Constraint;
		%feature("autodoc", "No available documentation.

Parameters
----------
UV: gp_XY
Value: gp_XYZ
D1T: Plate_D1
D2T: Plate_D2

Returns
-------
None
") NLPlate_HPG0G2Constraint;
		 NLPlate_HPG0G2Constraint(const gp_XY & UV, const gp_XYZ & Value, const Plate_D1 & D1T, const Plate_D2 & D2T);

		/****************** ActiveOrder ******************/
		%feature("compactdefaultargs") ActiveOrder;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") ActiveOrder;
		virtual Standard_Integer ActiveOrder();

		/****************** G2Target ******************/
		%feature("compactdefaultargs") G2Target;
		%feature("autodoc", "No available documentation.

Returns
-------
Plate_D2
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
		/****************** NLPlate_HPG3Constraint ******************/
		%feature("compactdefaultargs") NLPlate_HPG3Constraint;
		%feature("autodoc", "No available documentation.

Parameters
----------
UV: gp_XY
D1T: Plate_D1
D2T: Plate_D2
D3T: Plate_D3

Returns
-------
None
") NLPlate_HPG3Constraint;
		 NLPlate_HPG3Constraint(const gp_XY & UV, const Plate_D1 & D1T, const Plate_D2 & D2T, const Plate_D3 & D3T);

		/****************** ActiveOrder ******************/
		%feature("compactdefaultargs") ActiveOrder;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") ActiveOrder;
		virtual Standard_Integer ActiveOrder();

		/****************** G3Target ******************/
		%feature("compactdefaultargs") G3Target;
		%feature("autodoc", "No available documentation.

Returns
-------
Plate_D3
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
		/****************** NLPlate_HPG0G3Constraint ******************/
		%feature("compactdefaultargs") NLPlate_HPG0G3Constraint;
		%feature("autodoc", "No available documentation.

Parameters
----------
UV: gp_XY
Value: gp_XYZ
D1T: Plate_D1
D2T: Plate_D2
D3T: Plate_D3

Returns
-------
None
") NLPlate_HPG0G3Constraint;
		 NLPlate_HPG0G3Constraint(const gp_XY & UV, const gp_XYZ & Value, const Plate_D1 & D1T, const Plate_D2 & D2T, const Plate_D3 & D3T);

		/****************** ActiveOrder ******************/
		%feature("compactdefaultargs") ActiveOrder;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") ActiveOrder;
		virtual Standard_Integer ActiveOrder();

		/****************** G3Target ******************/
		%feature("compactdefaultargs") G3Target;
		%feature("autodoc", "No available documentation.

Returns
-------
Plate_D3
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
