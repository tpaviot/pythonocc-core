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
%define TOPTRANSDOCSTRING
"TopTrans module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_toptrans.html"
%enddef
%module (package="OCC.Core", docstring=TOPTRANSDOCSTRING) TopTrans


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
#include<TopTrans_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<gp_module.hxx>
#include<TopAbs_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import gp.i
%import TopAbs.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
%template(TopTrans_Array2OfOrientation) NCollection_Array2<TopAbs_Orientation>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Array2<TopAbs_Orientation> TopTrans_Array2OfOrientation;
/* end typedefs declaration */

/*********************************
* class TopTrans_CurveTransition *
*********************************/
class TopTrans_CurveTransition {
	public:
		/****************** TopTrans_CurveTransition ******************/
		/**** md5 signature: 239f100627479f6ee75b6b25ce57dfbe ****/
		%feature("compactdefaultargs") TopTrans_CurveTransition;
		%feature("autodoc", "Create an empty curve transition.

Returns
-------
None
") TopTrans_CurveTransition;
		 TopTrans_CurveTransition();

		/****************** Compare ******************/
		/**** md5 signature: 48ade9961a1a3ca5e5ac483912ff1c85 ****/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "Add a curve element to the boundary. if or is reversed the curve is before the intersection, else if or is forward the curv is after the intersection and if or is internal the intersection is in the middle of the curv.

Parameters
----------
Tole: float
Tang: gp_Dir
Norm: gp_Dir
Curv: float
S: TopAbs_Orientation
Or: TopAbs_Orientation

Returns
-------
None
") Compare;
		void Compare(const Standard_Real Tole, const gp_Dir & Tang, const gp_Dir & Norm, const Standard_Real Curv, const TopAbs_Orientation S, const TopAbs_Orientation Or);

		/****************** Reset ******************/
		/**** md5 signature: 41688a7deec782701e541aa14a291d6c ****/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Initialize a transition with the local description of a curve.

Parameters
----------
Tgt: gp_Dir
Norm: gp_Dir
Curv: float

Returns
-------
None
") Reset;
		void Reset(const gp_Dir & Tgt, const gp_Dir & Norm, const Standard_Real Curv);

		/****************** Reset ******************/
		/**** md5 signature: 477dbad6632871c94ebb699631f93444 ****/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Initialize a transition with the local description of a straigth line.

Parameters
----------
Tgt: gp_Dir

Returns
-------
None
") Reset;
		void Reset(const gp_Dir & Tgt);

		/****************** StateAfter ******************/
		/**** md5 signature: 00cc234f23b0e06606bd1ce121c9c7ae ****/
		%feature("compactdefaultargs") StateAfter;
		%feature("autodoc", "Returns the state of the curve after the intersection, this is the position relative to the boundary of a point very close to the intersection on the positive side of the tangent.

Returns
-------
TopAbs_State
") StateAfter;
		TopAbs_State StateAfter();

		/****************** StateBefore ******************/
		/**** md5 signature: 76fbbf983aacdcf0487328d9ca214104 ****/
		%feature("compactdefaultargs") StateBefore;
		%feature("autodoc", "Returns the state of the curve before the intersection, this is the position relative to the boundary of a point very close to the intersection on the negative side of the tangent.

Returns
-------
TopAbs_State
") StateBefore;
		TopAbs_State StateBefore();

};


%extend TopTrans_CurveTransition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class TopTrans_SurfaceTransition *
***********************************/
class TopTrans_SurfaceTransition {
	public:
		/****************** TopTrans_SurfaceTransition ******************/
		/**** md5 signature: 52d5a49be8e3232bc172d57d57b87cd3 ****/
		%feature("compactdefaultargs") TopTrans_SurfaceTransition;
		%feature("autodoc", "Create an empty surface transition.

Returns
-------
None
") TopTrans_SurfaceTransition;
		 TopTrans_SurfaceTransition();

		/****************** Compare ******************/
		/**** md5 signature: 538c5433b55a96d5b594a8b234a032e4 ****/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "Add a face element to the boundary. //! - s defines topological orientation for the face : s forward means: along the intersection curve on the reference surface, transition states while crossing the face are out,in. s reversed means states are in,out. s internal means states are in,in. //! - o defines curve's position on face : o forward means the face is before the intersection o reversed means the face is after o internal means the curve intersection is in the face. prequesitory : norm oriented outside 'geometric matter'.

Parameters
----------
Tole: float
Norm: gp_Dir
MaxD: gp_Dir
MinD: gp_Dir
MaxCurv: float
MinCurv: float
S: TopAbs_Orientation
O: TopAbs_Orientation

Returns
-------
None
") Compare;
		void Compare(const Standard_Real Tole, const gp_Dir & Norm, const gp_Dir & MaxD, const gp_Dir & MinD, const Standard_Real MaxCurv, const Standard_Real MinCurv, const TopAbs_Orientation S, const TopAbs_Orientation O);

		/****************** Compare ******************/
		/**** md5 signature: d313463c87e2df4be0babd6e22aa3746 ****/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "Add a plane or a cylindric face to the boundary.

Parameters
----------
Tole: float
Norm: gp_Dir
S: TopAbs_Orientation
O: TopAbs_Orientation

Returns
-------
None
") Compare;
		void Compare(const Standard_Real Tole, const gp_Dir & Norm, const TopAbs_Orientation S, const TopAbs_Orientation O);

		/****************** GetAfter ******************/
		/**** md5 signature: 58856f1840274abefcc406a5eba5b8fc ****/
		%feature("compactdefaultargs") GetAfter;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tran: TopAbs_Orientation

Returns
-------
TopAbs_State
") GetAfter;
		static TopAbs_State GetAfter(const TopAbs_Orientation Tran);

		/****************** GetBefore ******************/
		/**** md5 signature: c888186ea8e78f6e9253578972d9b665 ****/
		%feature("compactdefaultargs") GetBefore;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tran: TopAbs_Orientation

Returns
-------
TopAbs_State
") GetBefore;
		static TopAbs_State GetBefore(const TopAbs_Orientation Tran);

		/****************** Reset ******************/
		/**** md5 signature: 8bcea749b87bd898ab0d396b7dea65c8 ****/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Initialize a surface transition with the local description of the intersection curve and of the reference surface. prequesitory : norm oriented outside 'geometric matter'.

Parameters
----------
Tgt: gp_Dir
Norm: gp_Dir
MaxD: gp_Dir
MinD: gp_Dir
MaxCurv: float
MinCurv: float

Returns
-------
None
") Reset;
		void Reset(const gp_Dir & Tgt, const gp_Dir & Norm, const gp_Dir & MaxD, const gp_Dir & MinD, const Standard_Real MaxCurv, const Standard_Real MinCurv);

		/****************** Reset ******************/
		/**** md5 signature: 79c0d4553243636cc04f5789b11ef1dc ****/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Initialize a surface transition with the local description of a straight line.

Parameters
----------
Tgt: gp_Dir
Norm: gp_Dir

Returns
-------
None
") Reset;
		void Reset(const gp_Dir & Tgt, const gp_Dir & Norm);

		/****************** StateAfter ******************/
		/**** md5 signature: 00cc234f23b0e06606bd1ce121c9c7ae ****/
		%feature("compactdefaultargs") StateAfter;
		%feature("autodoc", "Returns the state of the reference surface after interference, this is the position relative to the surface of a point very close to the intersection on the positive side of the tangent.

Returns
-------
TopAbs_State
") StateAfter;
		TopAbs_State StateAfter();

		/****************** StateBefore ******************/
		/**** md5 signature: 76fbbf983aacdcf0487328d9ca214104 ****/
		%feature("compactdefaultargs") StateBefore;
		%feature("autodoc", "Returns the state of the reference surface before the interference, this is the position relative to the surface of a point very close to the intersection on the negative side of the tangent.

Returns
-------
TopAbs_State
") StateBefore;
		TopAbs_State StateBefore();

};


%extend TopTrans_SurfaceTransition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
