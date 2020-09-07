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
%define INTSURFDOCSTRING
"IntSurf module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_intsurf.html"
%enddef
%module (package="OCC.Core", docstring=INTSURFDOCSTRING) IntSurf


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
#include<IntSurf_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<gp_module.hxx>
#include<Adaptor3d_module.hxx>
#include<GeomAbs_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Geom2d_module.hxx>
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
%import Adaptor3d.i
%import GeomAbs.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum IntSurf_Situation {
	IntSurf_Inside = 0,
	IntSurf_Outside = 1,
	IntSurf_Unknown = 2,
};

enum IntSurf_TypeTrans {
	IntSurf_In = 0,
	IntSurf_Out = 1,
	IntSurf_Touch = 2,
	IntSurf_Undecided = 3,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class IntSurf_Situation(IntEnum):
	IntSurf_Inside = 0
	IntSurf_Outside = 1
	IntSurf_Unknown = 2
IntSurf_Inside = IntSurf_Situation.IntSurf_Inside
IntSurf_Outside = IntSurf_Situation.IntSurf_Outside
IntSurf_Unknown = IntSurf_Situation.IntSurf_Unknown

class IntSurf_TypeTrans(IntEnum):
	IntSurf_In = 0
	IntSurf_Out = 1
	IntSurf_Touch = 2
	IntSurf_Undecided = 3
IntSurf_In = IntSurf_TypeTrans.IntSurf_In
IntSurf_Out = IntSurf_TypeTrans.IntSurf_Out
IntSurf_Touch = IntSurf_TypeTrans.IntSurf_Touch
IntSurf_Undecided = IntSurf_TypeTrans.IntSurf_Undecided
};
/* end python proxy for enums */

/* handles */
%wrap_handle(IntSurf_LineOn2S)
/* end handles declaration */

/* templates */
%template(IntSurf_Allocator) opencascade::handle<NCollection_BaseAllocator>;
%template(IntSurf_ListIteratorOfListOfPntOn2S) NCollection_TListIterator<IntSurf_PntOn2S>;
%template(IntSurf_ListOfPntOn2S) NCollection_List<IntSurf_PntOn2S>;

%extend NCollection_List<IntSurf_PntOn2S> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(IntSurf_SequenceOfCouple) NCollection_Sequence<IntSurf_Couple>;

%extend NCollection_Sequence<IntSurf_Couple> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(IntSurf_SequenceOfInteriorPoint) NCollection_Sequence<IntSurf_InteriorPoint>;

%extend NCollection_Sequence<IntSurf_InteriorPoint> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(IntSurf_SequenceOfPathPoint) NCollection_Sequence<IntSurf_PathPoint>;

%extend NCollection_Sequence<IntSurf_PathPoint> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(IntSurf_SequenceOfPntOn2S) NCollection_Sequence<IntSurf_PntOn2S>;

%extend NCollection_Sequence<IntSurf_PntOn2S> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef opencascade::handle<NCollection_BaseAllocator> IntSurf_Allocator;
typedef NCollection_List<IntSurf_PntOn2S>::Iterator IntSurf_ListIteratorOfListOfPntOn2S;
typedef NCollection_List<IntSurf_PntOn2S> IntSurf_ListOfPntOn2S;
typedef NCollection_Sequence<IntSurf_Couple> IntSurf_SequenceOfCouple;
typedef NCollection_Sequence<IntSurf_InteriorPoint> IntSurf_SequenceOfInteriorPoint;
typedef NCollection_Sequence<IntSurf_PathPoint> IntSurf_SequenceOfPathPoint;
typedef NCollection_Sequence<IntSurf_PntOn2S> IntSurf_SequenceOfPntOn2S;
/* end typedefs declaration */

/****************
* class IntSurf *
****************/
%rename(intsurf) IntSurf;
class IntSurf {
	public:
		/****************** MakeTransition ******************/
		/**** md5 signature: e95492976a37147a3755de5278b25f3e ****/
		%feature("compactdefaultargs") MakeTransition;
		%feature("autodoc", "Computes the transition of the intersection point between the two lines. tgfirst is the tangent vector of the first line. tgsecond is the tangent vector of the second line. normal is the direction used to orientate the cross product tgfirst^tgsecond. tfirst is the transition of the point on the first line. tsecond is the transition of the point on the second line.

Parameters
----------
TgFirst: gp_Vec
TgSecond: gp_Vec
Normal: gp_Dir
TFirst: IntSurf_Transition
TSecond: IntSurf_Transition

Returns
-------
None
") MakeTransition;
		static void MakeTransition(const gp_Vec & TgFirst, const gp_Vec & TgSecond, const gp_Dir & Normal, IntSurf_Transition & TFirst, IntSurf_Transition & TSecond);

		/****************** SetPeriod ******************/
		/**** md5 signature: 16a7ae508b5887130ad1ba538c9ee0ff ****/
		%feature("compactdefaultargs") SetPeriod;
		%feature("autodoc", "Fills thearrofperiod array by the period values of thefirstsurf and thesecondsurf. [0] = u-period of thefirstsurf, [1] = v-period of thefirstsurf, [2] = u-period of thesecondsurf, [3] = v-period of thesecondsurf. //! if surface is not periodic in correspond direction then its period is considered to be equal to 0.

Parameters
----------
theFirstSurf: Adaptor3d_HSurface
theSecondSurf: Adaptor3d_HSurface
theArrOfPeriod: float

Returns
-------
None
") SetPeriod;
		static void SetPeriod(const opencascade::handle<Adaptor3d_HSurface> & theFirstSurf, const opencascade::handle<Adaptor3d_HSurface> & theSecondSurf, Standard_Real theArrOfPeriod[4]);

};


%extend IntSurf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class IntSurf_Couple *
***********************/
class IntSurf_Couple {
	public:
		/****************** IntSurf_Couple ******************/
		/**** md5 signature: ea23add00836d7c02bebc1a9ff4e92ac ****/
		%feature("compactdefaultargs") IntSurf_Couple;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntSurf_Couple;
		 IntSurf_Couple();

		/****************** IntSurf_Couple ******************/
		/**** md5 signature: 1fcbb7aa82d36794f54eb374b8a87f3f ****/
		%feature("compactdefaultargs") IntSurf_Couple;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index1: int
Index2: int

Returns
-------
None
") IntSurf_Couple;
		 IntSurf_Couple(const Standard_Integer Index1, const Standard_Integer Index2);

		/****************** First ******************/
		/**** md5 signature: e9b9b55d0f95896826fc1a7c7b3fdf28 ****/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "Returns the first element.

Returns
-------
int
") First;
		Standard_Integer First();

		/****************** Second ******************/
		/**** md5 signature: c8636c2280cbf925df1986b0518c04aa ****/
		%feature("compactdefaultargs") Second;
		%feature("autodoc", "Returns the second element.

Returns
-------
int
") Second;
		Standard_Integer Second();

};


%extend IntSurf_Couple {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IntSurf_InteriorPoint *
******************************/
class IntSurf_InteriorPoint {
	public:
		/****************** IntSurf_InteriorPoint ******************/
		/**** md5 signature: 9be54db4be2c38cfb1b6e31ec8aa37f9 ****/
		%feature("compactdefaultargs") IntSurf_InteriorPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntSurf_InteriorPoint;
		 IntSurf_InteriorPoint();

		/****************** IntSurf_InteriorPoint ******************/
		/**** md5 signature: d4f2c3329bde0497c3a826ab8fa154b4 ****/
		%feature("compactdefaultargs") IntSurf_InteriorPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
U: float
V: float
Direc: gp_Vec
Direc2d: gp_Vec2d

Returns
-------
None
") IntSurf_InteriorPoint;
		 IntSurf_InteriorPoint(const gp_Pnt & P, const Standard_Real U, const Standard_Real V, const gp_Vec & Direc, const gp_Vec2d & Direc2d);

		/****************** Direction ******************/
		/**** md5 signature: 14d68b48e3c0452be33c63cfd10f248f ****/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Returns the tangent at the intersection in 3d space associated to the interior point.

Returns
-------
gp_Vec
") Direction;
		const gp_Vec Direction();

		/****************** Direction2d ******************/
		/**** md5 signature: d22e536b120fb38c3e40ebd2590dce82 ****/
		%feature("compactdefaultargs") Direction2d;
		%feature("autodoc", "Returns the tangent at the intersection in the parametric space of the parametric surface.

Returns
-------
gp_Vec2d
") Direction2d;
		const gp_Vec2d Direction2d();

		/****************** Parameters ******************/
		/**** md5 signature: 24a2c71191423d4e30ed72f58cb5de87 ****/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "Returns the parameters of the interior point on the parametric surface.

Parameters
----------

Returns
-------
U: float
V: float
") Parameters;
		void Parameters(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** SetValue ******************/
		/**** md5 signature: 0276b9ec05425d8996dbc1333a32d0b3 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
U: float
V: float
Direc: gp_Vec
Direc2d: gp_Vec2d

Returns
-------
None
") SetValue;
		void SetValue(const gp_Pnt & P, const Standard_Real U, const Standard_Real V, const gp_Vec & Direc, const gp_Vec2d & Direc2d);

		/****************** UParameter ******************/
		/**** md5 signature: 5a3c6fef4fc1a6f599cc725a940f8581 ****/
		%feature("compactdefaultargs") UParameter;
		%feature("autodoc", "Returns the first parameter of the interior point on the parametric surface.

Returns
-------
float
") UParameter;
		Standard_Real UParameter();

		/****************** VParameter ******************/
		/**** md5 signature: 5b56cd11dcb65aaedb7fac8351dbfbc8 ****/
		%feature("compactdefaultargs") VParameter;
		%feature("autodoc", "Returns the second parameter of the interior point on the parametric surface.

Returns
-------
float
") VParameter;
		Standard_Real VParameter();

		/****************** Value ******************/
		/**** md5 signature: eddd2908948849b73f6d8aacab318652 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the 3d coordinates of the interior point.

Returns
-------
gp_Pnt
") Value;
		const gp_Pnt Value();

};


%extend IntSurf_InteriorPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class IntSurf_InteriorPointTool *
**********************************/
class IntSurf_InteriorPointTool {
	public:
		/****************** Direction2d ******************/
		/**** md5 signature: a4118c67e53e1fba8a4c33171843104e ****/
		%feature("compactdefaultargs") Direction2d;
		%feature("autodoc", "Returns the tangent at the intersectin in the parametric space of the parametrized surface.this tangent is associated to the value2d.

Parameters
----------
PStart: IntSurf_InteriorPoint

Returns
-------
gp_Dir2d
") Direction2d;
		static gp_Dir2d Direction2d(const IntSurf_InteriorPoint & PStart);

		/****************** Direction3d ******************/
		/**** md5 signature: 638aece9ee10f7279a0f6a68ad6ffc3c ****/
		%feature("compactdefaultargs") Direction3d;
		%feature("autodoc", "Returns the tangent at the intersectin in 3d space associated to <p>.

Parameters
----------
PStart: IntSurf_InteriorPoint

Returns
-------
gp_Vec
") Direction3d;
		static gp_Vec Direction3d(const IntSurf_InteriorPoint & PStart);

		/****************** Value2d ******************/
		/**** md5 signature: 270cf5176c898c99bae6ed28a2f136ba ****/
		%feature("compactdefaultargs") Value2d;
		%feature("autodoc", "Returns the <u,v> parameters which are associated with <p> it's the parameters which start the marching algorithm.

Parameters
----------
PStart: IntSurf_InteriorPoint

Returns
-------
U: float
V: float
") Value2d;
		static void Value2d(const IntSurf_InteriorPoint & PStart, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Value3d ******************/
		/**** md5 signature: 7ab77cefdf161f62c8c2bcdf90633a44 ****/
		%feature("compactdefaultargs") Value3d;
		%feature("autodoc", "Returns the 3d coordinates of the starting point.

Parameters
----------
PStart: IntSurf_InteriorPoint

Returns
-------
gp_Pnt
") Value3d;
		static gp_Pnt Value3d(const IntSurf_InteriorPoint & PStart);

};


%extend IntSurf_InteriorPointTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class IntSurf_LineOn2S *
*************************/
class IntSurf_LineOn2S : public Standard_Transient {
	public:
		/****************** IntSurf_LineOn2S ******************/
		/**** md5 signature: cdd9642f213bfad8fcfaf09cd388b17d ****/
		%feature("compactdefaultargs") IntSurf_LineOn2S;
		%feature("autodoc", "No available documentation.

Parameters
----------
theAllocator: IntSurf_Allocator,optional
	default value is 0

Returns
-------
None
") IntSurf_LineOn2S;
		 IntSurf_LineOn2S(const IntSurf_Allocator & theAllocator = 0);

		/****************** Add ******************/
		/**** md5 signature: 01be3efa9c74c4d8432a102f97f9361d ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds a point in the line.

Parameters
----------
P: IntSurf_PntOn2S

Returns
-------
None
") Add;
		void Add(const IntSurf_PntOn2S & P);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear;
		void Clear();

		/****************** InsertBefore ******************/
		/**** md5 signature: effddb142287d626dad63116f0eb2376 ****/
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int
P: IntSurf_PntOn2S

Returns
-------
None
") InsertBefore;
		void InsertBefore(const Standard_Integer I, const IntSurf_PntOn2S & P);

		/****************** IsOutBox ******************/
		/**** md5 signature: b24ebc49a90678cd3e7783ebeab08fdd ****/
		%feature("compactdefaultargs") IsOutBox;
		%feature("autodoc", "Returns true if thep is out of the box built from 3d-points.

Parameters
----------
theP: gp_Pnt

Returns
-------
bool
") IsOutBox;
		Standard_Boolean IsOutBox(const gp_Pnt & theP);

		/****************** IsOutSurf1Box ******************/
		/**** md5 signature: 035c0dd5684f2bc277113baba0a7ca30 ****/
		%feature("compactdefaultargs") IsOutSurf1Box;
		%feature("autodoc", "Returns true if thep is out of the box built from the points on 1st surface.

Parameters
----------
theP: gp_Pnt2d

Returns
-------
bool
") IsOutSurf1Box;
		Standard_Boolean IsOutSurf1Box(const gp_Pnt2d & theP);

		/****************** IsOutSurf2Box ******************/
		/**** md5 signature: 3fa30fdbec43874787ebf09979847639 ****/
		%feature("compactdefaultargs") IsOutSurf2Box;
		%feature("autodoc", "Returns true if thep is out of the box built from the points on 2nd surface.

Parameters
----------
theP: gp_Pnt2d

Returns
-------
bool
") IsOutSurf2Box;
		Standard_Boolean IsOutSurf2Box(const gp_Pnt2d & theP);

		/****************** NbPoints ******************/
		/**** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of points in the line.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** RemovePoint ******************/
		/**** md5 signature: c7bf0e4af319953519a4144b346ae43d ****/
		%feature("compactdefaultargs") RemovePoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
None
") RemovePoint;
		void RemovePoint(const Standard_Integer I);

		/****************** Reverse ******************/
		/**** md5 signature: b751d6874fc026e19a7a6cb37e9ac1b4 ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Reverses the order of points of the line.

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** SetUV ******************/
		/**** md5 signature: ace9005a01cb7b993999ab66ef8c0659 ****/
		%feature("compactdefaultargs") SetUV;
		%feature("autodoc", "Sets the parametric coordinates on one of the surfaces of the point of range index in the line.

Parameters
----------
Index: int
OnFirst: bool
U: float
V: float

Returns
-------
None
") SetUV;
		void SetUV(const Standard_Integer Index, const Standard_Boolean OnFirst, const Standard_Real U, const Standard_Real V);

		/****************** Split ******************/
		/**** md5 signature: e386e59312767dd5099cad44c29dd524 ****/
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "Keeps in <self> the points 1 to index-1, and returns the items index to the end.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IntSurf_LineOn2S>
") Split;
		opencascade::handle<IntSurf_LineOn2S> Split(const Standard_Integer Index);

		/****************** Value ******************/
		/**** md5 signature: 8dd9e41f579d9d6e26d29bbd4f60e2b9 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the point of range index in the line.

Parameters
----------
Index: int

Returns
-------
IntSurf_PntOn2S
") Value;
		const IntSurf_PntOn2S & Value(const Standard_Integer Index);

		/****************** Value ******************/
		/**** md5 signature: 77cc0e9a473d154fdd211bbf2887bdce ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Replaces the point of range index in the line.

Parameters
----------
Index: int
P: IntSurf_PntOn2S

Returns
-------
None
") Value;
		void Value(const Standard_Integer Index, const IntSurf_PntOn2S & P);

};


%make_alias(IntSurf_LineOn2S)

%extend IntSurf_LineOn2S {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class IntSurf_PathPoint *
**************************/
class IntSurf_PathPoint {
	public:
		/****************** IntSurf_PathPoint ******************/
		/**** md5 signature: e87ef668e2e110a2a14d003a026b551f ****/
		%feature("compactdefaultargs") IntSurf_PathPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntSurf_PathPoint;
		 IntSurf_PathPoint();

		/****************** IntSurf_PathPoint ******************/
		/**** md5 signature: 1f36d1a91564a744627b33e53759eadd ****/
		%feature("compactdefaultargs") IntSurf_PathPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
U: float
V: float

Returns
-------
None
") IntSurf_PathPoint;
		 IntSurf_PathPoint(const gp_Pnt & P, const Standard_Real U, const Standard_Real V);

		/****************** AddUV ******************/
		/**** md5 signature: 5afbd6bdf7099dccb0b01803288a4f26 ****/
		%feature("compactdefaultargs") AddUV;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float

Returns
-------
None
") AddUV;
		void AddUV(const Standard_Real U, const Standard_Real V);

		/****************** Direction2d ******************/
		/**** md5 signature: 7aae5ff2f37e31eadd39774422c0aab4 ****/
		%feature("compactdefaultargs") Direction2d;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Dir2d
") Direction2d;
		const gp_Dir2d Direction2d();

		/****************** Direction3d ******************/
		/**** md5 signature: f385f807d122e2e9ed8491a658ff12e0 ****/
		%feature("compactdefaultargs") Direction3d;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") Direction3d;
		const gp_Vec Direction3d();

		/****************** IsPassingPnt ******************/
		/**** md5 signature: 78834dea556ad36c560313343e4d367d ****/
		%feature("compactdefaultargs") IsPassingPnt;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsPassingPnt;
		Standard_Boolean IsPassingPnt();

		/****************** IsTangent ******************/
		/**** md5 signature: 16a7964bb24e34f80fabc93e5a65aedc ****/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsTangent;
		Standard_Boolean IsTangent();

		/****************** Multiplicity ******************/
		/**** md5 signature: fd18c919ee9c5917e8cf38138b1aed7a ****/
		%feature("compactdefaultargs") Multiplicity;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Multiplicity;
		Standard_Integer Multiplicity();

		/****************** Parameters ******************/
		/**** md5 signature: e9cd1a857a99bf64aba6fcfeffe41477 ****/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
U: float
V: float
") Parameters;
		void Parameters(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** SetDirections ******************/
		/**** md5 signature: a8037b6fa0ec7521b164ff5c1a8b49f9 ****/
		%feature("compactdefaultargs") SetDirections;
		%feature("autodoc", "No available documentation.

Parameters
----------
V: gp_Vec
D: gp_Dir2d

Returns
-------
None
") SetDirections;
		void SetDirections(const gp_Vec & V, const gp_Dir2d & D);

		/****************** SetPassing ******************/
		/**** md5 signature: d787def5875ee889a2b3e3fb778fe111 ****/
		%feature("compactdefaultargs") SetPassing;
		%feature("autodoc", "No available documentation.

Parameters
----------
Pass: bool

Returns
-------
None
") SetPassing;
		void SetPassing(const Standard_Boolean Pass);

		/****************** SetTangency ******************/
		/**** md5 signature: 5a99c919dfb1f6464f235b5fa0685fc1 ****/
		%feature("compactdefaultargs") SetTangency;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tang: bool

Returns
-------
None
") SetTangency;
		void SetTangency(const Standard_Boolean Tang);

		/****************** SetValue ******************/
		/**** md5 signature: f3a20967231d8be807407d6f74d3b449 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
U: float
V: float

Returns
-------
None
") SetValue;
		void SetValue(const gp_Pnt & P, const Standard_Real U, const Standard_Real V);

		/****************** Value ******************/
		/**** md5 signature: eddd2908948849b73f6d8aacab318652 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") Value;
		const gp_Pnt Value();

		/****************** Value2d ******************/
		/**** md5 signature: 0978c71a88cbaef21e300d448937efae ****/
		%feature("compactdefaultargs") Value2d;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
U: float
V: float
") Value2d;
		void Value2d(Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend IntSurf_PathPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IntSurf_PathPointTool *
******************************/
class IntSurf_PathPointTool {
	public:
		/****************** Direction2d ******************/
		/**** md5 signature: 0e2f23b79bd6f39aa13af1ebd0b3991c ****/
		%feature("compactdefaultargs") Direction2d;
		%feature("autodoc", "Returns the tangent at the intersection in the parametric space of the parametrized surface.this tangent is associated to the value2d la tangente a un sens signifiant (indique le sens de chemin ement) an exception is raised if istangent is true.

Parameters
----------
PStart: IntSurf_PathPoint

Returns
-------
gp_Dir2d
") Direction2d;
		static gp_Dir2d Direction2d(const IntSurf_PathPoint & PStart);

		/****************** Direction3d ******************/
		/**** md5 signature: a3d511b1261ebf2f14773af16514eb08 ****/
		%feature("compactdefaultargs") Direction3d;
		%feature("autodoc", "Returns the tangent at the intersection in 3d space associated to <p> an exception is raised if istangent is true.

Parameters
----------
PStart: IntSurf_PathPoint

Returns
-------
gp_Vec
") Direction3d;
		static gp_Vec Direction3d(const IntSurf_PathPoint & PStart);

		/****************** IsPassingPnt ******************/
		/**** md5 signature: fdb1f4f98bd59e0d5db8d65441b38390 ****/
		%feature("compactdefaultargs") IsPassingPnt;
		%feature("autodoc", "Returns true if the point is a point on a non-oriented arc, which means that the intersection line does not stop at such a point but just go through such a point. ispassingpnt is true when isonarc is true.

Parameters
----------
PStart: IntSurf_PathPoint

Returns
-------
bool
") IsPassingPnt;
		static Standard_Boolean IsPassingPnt(const IntSurf_PathPoint & PStart);

		/****************** IsTangent ******************/
		/**** md5 signature: f0ec6f9500ff78bb0ea17a6ec4ff5935 ****/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "Returns true if the surfaces are tangent at this point. istangent can be true when isonarc is true if ispassingpnt is true and istangent is true,this point is a stopped point.

Parameters
----------
PStart: IntSurf_PathPoint

Returns
-------
bool
") IsTangent;
		static Standard_Boolean IsTangent(const IntSurf_PathPoint & PStart);

		/****************** Multiplicity ******************/
		/**** md5 signature: 2c1afac074aae61f8fb0f0d052558a1a ****/
		%feature("compactdefaultargs") Multiplicity;
		%feature("autodoc", "Returns the multiplicity of the point i-e the number of auxillar parameters associated to the point which the principal parameters are given by value2d.

Parameters
----------
PStart: IntSurf_PathPoint

Returns
-------
int
") Multiplicity;
		static Standard_Integer Multiplicity(const IntSurf_PathPoint & PStart);

		/****************** Parameters ******************/
		/**** md5 signature: fefec2e8407d490d511418bc37476824 ****/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "Parametric coordinates associated to the multiplicity. an exception is raised if mult<=0 or mult>multiplicity.

Parameters
----------
PStart: IntSurf_PathPoint
Mult: int

Returns
-------
U: float
V: float
") Parameters;
		static void Parameters(const IntSurf_PathPoint & PStart, const Standard_Integer Mult, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Value2d ******************/
		/**** md5 signature: a7118be60c8b667fbaa8632fa17448da ****/
		%feature("compactdefaultargs") Value2d;
		%feature("autodoc", "Returns the <u, v> parameters which are associated with <p> it's the parameters which start the marching algorithm.

Parameters
----------
PStart: IntSurf_PathPoint

Returns
-------
U: float
V: float
") Value2d;
		static void Value2d(const IntSurf_PathPoint & PStart, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Value3d ******************/
		/**** md5 signature: 1583deb55b7e1f6f4cb96c510b54519d ****/
		%feature("compactdefaultargs") Value3d;
		%feature("autodoc", "Returns the 3d coordinates of the starting point.

Parameters
----------
PStart: IntSurf_PathPoint

Returns
-------
gp_Pnt
") Value3d;
		static gp_Pnt Value3d(const IntSurf_PathPoint & PStart);

};


%extend IntSurf_PathPointTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class IntSurf_PntOn2S *
************************/
class IntSurf_PntOn2S {
	public:
		/****************** IntSurf_PntOn2S ******************/
		/**** md5 signature: 9bc38ce40269e7182252925930872b02 ****/
		%feature("compactdefaultargs") IntSurf_PntOn2S;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IntSurf_PntOn2S;
		 IntSurf_PntOn2S();

		/****************** IsSame ******************/
		/**** md5 signature: aa8cd55cea9a16a16909901ebd6abc45 ****/
		%feature("compactdefaultargs") IsSame;
		%feature("autodoc", "Returns true if 2d- and 3d-coordinates of theoterpoint are equal to corresponding coordinates of me (with given tolerance). if thetol2d < 0.0 we will compare 3d-points only.

Parameters
----------
theOtherPoint: IntSurf_PntOn2S
theTol3D: float,optional
	default value is 0.0
theTol2D: float,optional
	default value is -1.0

Returns
-------
bool
") IsSame;
		Standard_Boolean IsSame(const IntSurf_PntOn2S & theOtherPoint, const Standard_Real theTol3D = 0.0, const Standard_Real theTol2D = -1.0);

		/****************** Parameters ******************/
		/**** md5 signature: 30bdd599088f74dedd5979b152a07fd4 ****/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "Returns the parameters of the point on both surfaces.

Parameters
----------

Returns
-------
U1: float
V1: float
U2: float
V2: float
") Parameters;
		void Parameters(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** ParametersOnS1 ******************/
		/**** md5 signature: 64f6fb4c23b753a8ae110d855799d804 ****/
		%feature("compactdefaultargs") ParametersOnS1;
		%feature("autodoc", "Returns the parameters of the point on the first surface.

Parameters
----------

Returns
-------
U1: float
V1: float
") ParametersOnS1;
		void ParametersOnS1(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** ParametersOnS2 ******************/
		/**** md5 signature: a037f950d5c09fdf632c55b7efba040b ****/
		%feature("compactdefaultargs") ParametersOnS2;
		%feature("autodoc", "Returns the parameters of the point on the second surface.

Parameters
----------

Returns
-------
U2: float
V2: float
") ParametersOnS2;
		void ParametersOnS2(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** ParametersOnSurface ******************/
		/**** md5 signature: abefe2ce382f127f8fe8c5d1bd0971cd ****/
		%feature("compactdefaultargs") ParametersOnSurface;
		%feature("autodoc", "Returns the parameters of the point in the parametric space of one of the surface.

Parameters
----------
OnFirst: bool

Returns
-------
U: float
V: float
") ParametersOnSurface;
		void ParametersOnSurface(const Standard_Boolean OnFirst, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** SetValue ******************/
		/**** md5 signature: 030ac1eb59faa7b90801ff6c52fc9800 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Sets the value of the point in 3d space.

Parameters
----------
Pt: gp_Pnt

Returns
-------
None
") SetValue;
		void SetValue(const gp_Pnt & Pt);

		/****************** SetValue ******************/
		/**** md5 signature: 808312724ee6d7f7429ed945cc18e16a ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Sets the values of the point in 3d space, and in the parametric space of one of the surface.

Parameters
----------
Pt: gp_Pnt
OnFirst: bool
U: float
V: float

Returns
-------
None
") SetValue;
		void SetValue(const gp_Pnt & Pt, const Standard_Boolean OnFirst, const Standard_Real U, const Standard_Real V);

		/****************** SetValue ******************/
		/**** md5 signature: df04f76e4f9af1926a2ae7a2c7b1e580 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Sets the values of the point in 3d space, and in the parametric space of each surface.

Parameters
----------
Pt: gp_Pnt
U1: float
V1: float
U2: float
V2: float

Returns
-------
None
") SetValue;
		void SetValue(const gp_Pnt & Pt, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2);

		/****************** SetValue ******************/
		/**** md5 signature: 659ca05a4ffe0fa78e9950e04b65ad52 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Set the values of the point in the parametric space of one of the surface.

Parameters
----------
OnFirst: bool
U: float
V: float

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Boolean OnFirst, const Standard_Real U, const Standard_Real V);

		/****************** SetValue ******************/
		/**** md5 signature: b0dba33634cfd5f960958e140df57e83 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Set the values of the point in the parametric space of one of the surface.

Parameters
----------
U1: float
V1: float
U2: float
V2: float

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2);

		/****************** Value ******************/
		/**** md5 signature: eddd2908948849b73f6d8aacab318652 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the point in 3d space.

Returns
-------
gp_Pnt
") Value;
		const gp_Pnt Value();

		/****************** ValueOnSurface ******************/
		/**** md5 signature: 7ee65588a5f8d776a208788975827c2c ****/
		%feature("compactdefaultargs") ValueOnSurface;
		%feature("autodoc", "Returns the point in 2d space of one of the surfaces.

Parameters
----------
OnFirst: bool

Returns
-------
gp_Pnt2d
") ValueOnSurface;
		gp_Pnt2d ValueOnSurface(const Standard_Boolean OnFirst);

};


%extend IntSurf_PntOn2S {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class IntSurf_Quadric *
************************/
class IntSurf_Quadric {
	public:
		/****************** IntSurf_Quadric ******************/
		/**** md5 signature: bcc1e6d2d7f2a66ca151f232014b127c ****/
		%feature("compactdefaultargs") IntSurf_Quadric;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntSurf_Quadric;
		 IntSurf_Quadric();

		/****************** IntSurf_Quadric ******************/
		/**** md5 signature: b26451d2363572fb30a1be301e5d1d81 ****/
		%feature("compactdefaultargs") IntSurf_Quadric;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pln

Returns
-------
None
") IntSurf_Quadric;
		 IntSurf_Quadric(const gp_Pln & P);

		/****************** IntSurf_Quadric ******************/
		/**** md5 signature: d42d588fe24687638acf9573ef502fe5 ****/
		%feature("compactdefaultargs") IntSurf_Quadric;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Cylinder

Returns
-------
None
") IntSurf_Quadric;
		 IntSurf_Quadric(const gp_Cylinder & C);

		/****************** IntSurf_Quadric ******************/
		/**** md5 signature: 70a630d70c6befdf753547586f305de3 ****/
		%feature("compactdefaultargs") IntSurf_Quadric;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: gp_Sphere

Returns
-------
None
") IntSurf_Quadric;
		 IntSurf_Quadric(const gp_Sphere & S);

		/****************** IntSurf_Quadric ******************/
		/**** md5 signature: 55bfe8c5c11c107dcd7d37d4c170bd55 ****/
		%feature("compactdefaultargs") IntSurf_Quadric;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Cone

Returns
-------
None
") IntSurf_Quadric;
		 IntSurf_Quadric(const gp_Cone & C);

		/****************** IntSurf_Quadric ******************/
		/**** md5 signature: a4552543f673ee745a2a293b84acf4a7 ****/
		%feature("compactdefaultargs") IntSurf_Quadric;
		%feature("autodoc", "No available documentation.

Parameters
----------
T: gp_Torus

Returns
-------
None
") IntSurf_Quadric;
		 IntSurf_Quadric(const gp_Torus & T);

		/****************** Cone ******************/
		/**** md5 signature: 433ba8697232d6bc7b71708b08d190e5 ****/
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Cone
") Cone;
		gp_Cone Cone();

		/****************** Cylinder ******************/
		/**** md5 signature: 60a8831694e0858ad1a30449c1edb3c9 ****/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Cylinder
") Cylinder;
		gp_Cylinder Cylinder();

		/****************** D1 ******************/
		/**** md5 signature: 9e70ed4843af0bc8bcd7afd9285b482c ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec

Returns
-------
None
") D1;
		void D1(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V);

		/****************** DN ******************/
		/**** md5 signature: 02c249fcb50eab490fed64db9f653acc ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float
Nu: int
Nv: int

Returns
-------
gp_Vec
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Real V, const Standard_Integer Nu, const Standard_Integer Nv);

		/****************** Distance ******************/
		/**** md5 signature: d9ba17ce87a8f8e1c8805850d4d732ba ****/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt

Returns
-------
float
") Distance;
		Standard_Real Distance(const gp_Pnt & P);

		/****************** Gradient ******************/
		/**** md5 signature: 1b4f28024feaa1e1d7062a57d1e2cee5 ****/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt

Returns
-------
gp_Vec
") Gradient;
		gp_Vec Gradient(const gp_Pnt & P);

		/****************** Normale ******************/
		/**** md5 signature: e93b2278bb4f872fd8e274bff7654999 ****/
		%feature("compactdefaultargs") Normale;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float

Returns
-------
gp_Vec
") Normale;
		gp_Vec Normale(const Standard_Real U, const Standard_Real V);

		/****************** Normale ******************/
		/**** md5 signature: 67a8bda6406ee3cc1945baff398a2378 ****/
		%feature("compactdefaultargs") Normale;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt

Returns
-------
gp_Vec
") Normale;
		gp_Vec Normale(const gp_Pnt & P);

		/****************** Parameters ******************/
		/**** md5 signature: d08654902fd64aedbe40aa3454fd0d70 ****/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt

Returns
-------
U: float
V: float
") Parameters;
		void Parameters(const gp_Pnt & P, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Plane ******************/
		/**** md5 signature: 722ec8a1cda087d25cc539584e9de6e6 ****/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pln
") Plane;
		gp_Pln Plane();

		/****************** SetValue ******************/
		/**** md5 signature: 3b0f4850ebf6ccbb6df1c2c1a32c2c6e ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pln

Returns
-------
None
") SetValue;
		void SetValue(const gp_Pln & P);

		/****************** SetValue ******************/
		/**** md5 signature: 847ad4b394b55539e88e78e666c70082 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Cylinder

Returns
-------
None
") SetValue;
		void SetValue(const gp_Cylinder & C);

		/****************** SetValue ******************/
		/**** md5 signature: 8036d4b3e82383d9a92f9dd4ecb36057 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: gp_Sphere

Returns
-------
None
") SetValue;
		void SetValue(const gp_Sphere & S);

		/****************** SetValue ******************/
		/**** md5 signature: c3dc19ae6034dc5d0e44df090bcc9af7 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Cone

Returns
-------
None
") SetValue;
		void SetValue(const gp_Cone & C);

		/****************** SetValue ******************/
		/**** md5 signature: 6c9cb7f465cd6e67dd4365e6609d9a36 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
T: gp_Torus

Returns
-------
None
") SetValue;
		void SetValue(const gp_Torus & T);

		/****************** Sphere ******************/
		/**** md5 signature: e02f27c8c733f0b938d13039e1e73f8c ****/
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Sphere
") Sphere;
		gp_Sphere Sphere();

		/****************** Torus ******************/
		/**** md5 signature: 9bb22d5b92ef11cba62e467d89f58c66 ****/
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Torus
") Torus;
		gp_Torus Torus();

		/****************** TypeQuadric ******************/
		/**** md5 signature: e6d9fc5adcd9d5bf3c73e5fd6797dca3 ****/
		%feature("compactdefaultargs") TypeQuadric;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_SurfaceType
") TypeQuadric;
		GeomAbs_SurfaceType TypeQuadric();

		/****************** ValAndGrad ******************/
		/**** md5 signature: 788803e196dc9d3b7efe528594f539a6 ****/
		%feature("compactdefaultargs") ValAndGrad;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
Grad: gp_Vec

Returns
-------
Dist: float
") ValAndGrad;
		void ValAndGrad(const gp_Pnt & P, Standard_Real &OutValue, gp_Vec & Grad);

		/****************** Value ******************/
		/**** md5 signature: 42959897db65d301eb66b5528ed15f16 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
V: float

Returns
-------
gp_Pnt
") Value;
		gp_Pnt Value(const Standard_Real U, const Standard_Real V);

};


%extend IntSurf_Quadric {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class IntSurf_QuadricTool *
****************************/
class IntSurf_QuadricTool {
	public:
		/****************** Gradient ******************/
		/**** md5 signature: 67f30792fc0abc5df39ecabc22695a85 ****/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "Returns the gradient of the function.

Parameters
----------
Quad: IntSurf_Quadric
X: float
Y: float
Z: float
V: gp_Vec

Returns
-------
None
") Gradient;
		static void Gradient(const IntSurf_Quadric & Quad, const Standard_Real X, const Standard_Real Y, const Standard_Real Z, gp_Vec & V);

		/****************** Tolerance ******************/
		/**** md5 signature: 71006b4e399d2dd853e8202886a30034 ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Returns the tolerance of the zero of the implicit function.

Parameters
----------
Quad: IntSurf_Quadric

Returns
-------
float
") Tolerance;
		static Standard_Real Tolerance(const IntSurf_Quadric & Quad);

		/****************** Value ******************/
		/**** md5 signature: cb055aed0635a23cf3670cafec8be8da ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the value of the function.

Parameters
----------
Quad: IntSurf_Quadric
X: float
Y: float
Z: float

Returns
-------
float
") Value;
		static Standard_Real Value(const IntSurf_Quadric & Quad, const Standard_Real X, const Standard_Real Y, const Standard_Real Z);

		/****************** ValueAndGradient ******************/
		/**** md5 signature: 0ed1171daf6860af1930c61944c58a0a ****/
		%feature("compactdefaultargs") ValueAndGradient;
		%feature("autodoc", "Returns the value and the gradient.

Parameters
----------
Quad: IntSurf_Quadric
X: float
Y: float
Z: float
Grad: gp_Vec

Returns
-------
Val: float
") ValueAndGradient;
		static void ValueAndGradient(const IntSurf_Quadric & Quad, const Standard_Real X, const Standard_Real Y, const Standard_Real Z, Standard_Real &OutValue, gp_Vec & Grad);

};


%extend IntSurf_QuadricTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class IntSurf_Transition *
***************************/
class IntSurf_Transition {
	public:
		/****************** IntSurf_Transition ******************/
		/**** md5 signature: 43d98c3a1b88c2c9b3e98184df8df621 ****/
		%feature("compactdefaultargs") IntSurf_Transition;
		%feature("autodoc", "Empty constructor. creates an undecided transition.

Returns
-------
None
") IntSurf_Transition;
		 IntSurf_Transition();

		/****************** IntSurf_Transition ******************/
		/**** md5 signature: 0cf6241bb678fc95cadd1139dae6449b ****/
		%feature("compactdefaultargs") IntSurf_Transition;
		%feature("autodoc", "Create a in or out transition.

Parameters
----------
Tangent: bool
Type: IntSurf_TypeTrans

Returns
-------
None
") IntSurf_Transition;
		 IntSurf_Transition(const Standard_Boolean Tangent, const IntSurf_TypeTrans Type);

		/****************** IntSurf_Transition ******************/
		/**** md5 signature: f50beef73f541d362ae7cadd36dfeca5 ****/
		%feature("compactdefaultargs") IntSurf_Transition;
		%feature("autodoc", "Create a touch transition.

Parameters
----------
Tangent: bool
Situ: IntSurf_Situation
Oppos: bool

Returns
-------
None
") IntSurf_Transition;
		 IntSurf_Transition(const Standard_Boolean Tangent, const IntSurf_Situation Situ, const Standard_Boolean Oppos);

		/****************** IsOpposite ******************/
		/**** md5 signature: 393aca3277062552b7a8ec8cd414f82d ****/
		%feature("compactdefaultargs") IsOpposite;
		%feature("autodoc", "Returns a significant value if transitiontype returns touch. in this case, the function returns true when the 2 curves locally define two different parts of the space. if transitiontype returns in or out or undecided, an exception is raised.

Returns
-------
bool
") IsOpposite;
		Standard_Boolean IsOpposite();

		/****************** IsTangent ******************/
		/**** md5 signature: 16a7964bb24e34f80fabc93e5a65aedc ****/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "Returns true if the point is tangent to the arc given by value. an exception is raised if transitiontype returns undecided.

Returns
-------
bool
") IsTangent;
		Standard_Boolean IsTangent();

		/****************** SetValue ******************/
		/**** md5 signature: 480a85fbe5c9655129aa9fea0ee77cc9 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Set the values of an in or out transition.

Parameters
----------
Tangent: bool
Type: IntSurf_TypeTrans

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Boolean Tangent, const IntSurf_TypeTrans Type);

		/****************** SetValue ******************/
		/**** md5 signature: 23785efc5a23a4c4a0d956dc57ac0a5e ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Set the values of a touch transition.

Parameters
----------
Tangent: bool
Situ: IntSurf_Situation
Oppos: bool

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Boolean Tangent, const IntSurf_Situation Situ, const Standard_Boolean Oppos);

		/****************** SetValue ******************/
		/**** md5 signature: 8e6ddcc525f3b0b127452029d0eaab09 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Set the values of an undecided transition.

Returns
-------
None
") SetValue;
		void SetValue();

		/****************** Situation ******************/
		/**** md5 signature: a6322eec5c49e75e440e204dfe600fbd ****/
		%feature("compactdefaultargs") Situation;
		%feature("autodoc", "Returns a significant value if transitiontype returns touch. in this case, the function returns : inside when the intersection line remains inside the arc, outside when it remains outside the arc, unknown when the calsulus cannot give results. if transitiontype returns in, or out, or undecided, a exception is raised.

Returns
-------
IntSurf_Situation
") Situation;
		IntSurf_Situation Situation();

		/****************** TransitionType ******************/
		/**** md5 signature: 51d0ad127452bfb2a082c82034278ee5 ****/
		%feature("compactdefaultargs") TransitionType;
		%feature("autodoc", "Returns the type of transition (in/out/touch/undecided) for the arc given by value. this the transition of the intersection line compared to the arc of restriction, i-e when the function returns inside for example, it means that the intersection line goes inside the part of plane limited by the arc of restriction.

Returns
-------
IntSurf_TypeTrans
") TransitionType;
		IntSurf_TypeTrans TransitionType();

};


%extend IntSurf_Transition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
