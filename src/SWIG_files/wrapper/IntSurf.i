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
%define INTSURFDOCSTRING
"IntSurf module, see official documentation at
https://dev.opencascade.org/doc/occt-7.7.0/refman/html/package_intsurf.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i


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

/* python proxy classes for enums */
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
		%feature("autodoc", "
Parameters
----------
TgFirst: gp_Vec
TgSecond: gp_Vec
Normal: gp_Dir
TFirst: IntSurf_Transition
TSecond: IntSurf_Transition

Return
-------
None

Description
-----------
Computes the transition of the intersection point between the two lines. tgfirst is the tangent vector of the first line. tgsecond is the tangent vector of the second line. normal is the direction used to orientate the cross product tgfirst^tgsecond. tfirst is the transition of the point on the first line. tsecond is the transition of the point on the second line.
") MakeTransition;
		static void MakeTransition(const gp_Vec & TgFirst, const gp_Vec & TgSecond, const gp_Dir & Normal, IntSurf_Transition & TFirst, IntSurf_Transition & TSecond);

		/****************** SetPeriod ******************/
		/**** md5 signature: 486891f66d1363af6895d7c681cba2a3 ****/
		%feature("compactdefaultargs") SetPeriod;
		%feature("autodoc", "
Parameters
----------
theFirstSurf: Adaptor3d_Surface
theSecondSurf: Adaptor3d_Surface
theArrOfPeriod: float

Return
-------
None

Description
-----------
Fills thearrofperiod array by the period values of thefirstsurf and thesecondsurf. [0] = u-period of thefirstsurf, [1] = v-period of thefirstsurf, [2] = u-period of thesecondsurf, [3] = v-period of thesecondsurf. //! if surface is not periodic in correspond direction then its period is considered to be equal to 0.
") SetPeriod;
		static void SetPeriod(const opencascade::handle<Adaptor3d_Surface> & theFirstSurf, const opencascade::handle<Adaptor3d_Surface> & theSecondSurf, Standard_Real theArrOfPeriod[4]);

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
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") IntSurf_Couple;
		 IntSurf_Couple();

		/****************** IntSurf_Couple ******************/
		/**** md5 signature: 1fcbb7aa82d36794f54eb374b8a87f3f ****/
		%feature("compactdefaultargs") IntSurf_Couple;
		%feature("autodoc", "
Parameters
----------
Index1: int
Index2: int

Return
-------
None

Description
-----------
No available documentation.
") IntSurf_Couple;
		 IntSurf_Couple(const Standard_Integer Index1, const Standard_Integer Index2);

		/****************** First ******************/
		/**** md5 signature: e9b9b55d0f95896826fc1a7c7b3fdf28 ****/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the first element.
") First;
		Standard_Integer First();

		/****************** Second ******************/
		/**** md5 signature: c8636c2280cbf925df1986b0518c04aa ****/
		%feature("compactdefaultargs") Second;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the second element.
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
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") IntSurf_InteriorPoint;
		 IntSurf_InteriorPoint();

		/****************** IntSurf_InteriorPoint ******************/
		/**** md5 signature: d4f2c3329bde0497c3a826ab8fa154b4 ****/
		%feature("compactdefaultargs") IntSurf_InteriorPoint;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
U: float
V: float
Direc: gp_Vec
Direc2d: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") IntSurf_InteriorPoint;
		 IntSurf_InteriorPoint(const gp_Pnt & P, const Standard_Real U, const Standard_Real V, const gp_Vec & Direc, const gp_Vec2d & Direc2d);

		/****************** Direction ******************/
		/**** md5 signature: 14d68b48e3c0452be33c63cfd10f248f ****/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
Returns the tangent at the intersection in 3d space associated to the interior point.
") Direction;
		const gp_Vec Direction();

		/****************** Direction2d ******************/
		/**** md5 signature: d22e536b120fb38c3e40ebd2590dce82 ****/
		%feature("compactdefaultargs") Direction2d;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
Returns the tangent at the intersection in the parametric space of the parametric surface.
") Direction2d;
		const gp_Vec2d Direction2d();

		/****************** Parameters ******************/
		/**** md5 signature: 24a2c71191423d4e30ed72f58cb5de87 ****/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "
Parameters
----------

Return
-------
U: float
V: float

Description
-----------
Returns the parameters of the interior point on the parametric surface.
") Parameters;
		void Parameters(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** SetValue ******************/
		/**** md5 signature: 0276b9ec05425d8996dbc1333a32d0b3 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
U: float
V: float
Direc: gp_Vec
Direc2d: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") SetValue;
		void SetValue(const gp_Pnt & P, const Standard_Real U, const Standard_Real V, const gp_Vec & Direc, const gp_Vec2d & Direc2d);

		/****************** UParameter ******************/
		/**** md5 signature: 5a3c6fef4fc1a6f599cc725a940f8581 ****/
		%feature("compactdefaultargs") UParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the first parameter of the interior point on the parametric surface.
") UParameter;
		Standard_Real UParameter();

		/****************** VParameter ******************/
		/**** md5 signature: 5b56cd11dcb65aaedb7fac8351dbfbc8 ****/
		%feature("compactdefaultargs") VParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the second parameter of the interior point on the parametric surface.
") VParameter;
		Standard_Real VParameter();

		/****************** Value ******************/
		/**** md5 signature: eddd2908948849b73f6d8aacab318652 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the 3d coordinates of the interior point.
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
		%feature("autodoc", "
Parameters
----------
PStart: IntSurf_InteriorPoint

Return
-------
gp_Dir2d

Description
-----------
Returns the tangent at the intersectin in the parametric space of the parametrized surface.this tangent is associated to the value2d.
") Direction2d;
		static gp_Dir2d Direction2d(const IntSurf_InteriorPoint & PStart);

		/****************** Direction3d ******************/
		/**** md5 signature: 638aece9ee10f7279a0f6a68ad6ffc3c ****/
		%feature("compactdefaultargs") Direction3d;
		%feature("autodoc", "
Parameters
----------
PStart: IntSurf_InteriorPoint

Return
-------
gp_Vec

Description
-----------
Returns the tangent at the intersectin in 3d space associated to <p>.
") Direction3d;
		static gp_Vec Direction3d(const IntSurf_InteriorPoint & PStart);

		/****************** Value2d ******************/
		/**** md5 signature: 270cf5176c898c99bae6ed28a2f136ba ****/
		%feature("compactdefaultargs") Value2d;
		%feature("autodoc", "
Parameters
----------
PStart: IntSurf_InteriorPoint

Return
-------
U: float
V: float

Description
-----------
Returns the <u,v> parameters which are associated with <p> it's the parameters which start the marching algorithm.
") Value2d;
		static void Value2d(const IntSurf_InteriorPoint & PStart, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Value3d ******************/
		/**** md5 signature: 7ab77cefdf161f62c8c2bcdf90633a44 ****/
		%feature("compactdefaultargs") Value3d;
		%feature("autodoc", "
Parameters
----------
PStart: IntSurf_InteriorPoint

Return
-------
gp_Pnt

Description
-----------
Returns the 3d coordinates of the starting point.
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
") IntSurf_LineOn2S;
		 IntSurf_LineOn2S(const IntSurf_Allocator & theAllocator = 0);

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
Adds a point in the line.
") Add;
		void Add(const IntSurf_PntOn2S & P);

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

		/****************** InsertBefore ******************/
		/**** md5 signature: effddb142287d626dad63116f0eb2376 ****/
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "
Parameters
----------
I: int
P: IntSurf_PntOn2S

Return
-------
None

Description
-----------
No available documentation.
") InsertBefore;
		void InsertBefore(const Standard_Integer I, const IntSurf_PntOn2S & P);

		/****************** IsOutBox ******************/
		/**** md5 signature: b24ebc49a90678cd3e7783ebeab08fdd ****/
		%feature("compactdefaultargs") IsOutBox;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
bool

Description
-----------
Returns true if thep is out of the box built from 3d-points.
") IsOutBox;
		Standard_Boolean IsOutBox(const gp_Pnt & theP);

		/****************** IsOutSurf1Box ******************/
		/**** md5 signature: 035c0dd5684f2bc277113baba0a7ca30 ****/
		%feature("compactdefaultargs") IsOutSurf1Box;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
bool

Description
-----------
Returns true if thep is out of the box built from the points on 1st surface.
") IsOutSurf1Box;
		Standard_Boolean IsOutSurf1Box(const gp_Pnt2d & theP);

		/****************** IsOutSurf2Box ******************/
		/**** md5 signature: 3fa30fdbec43874787ebf09979847639 ****/
		%feature("compactdefaultargs") IsOutSurf2Box;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
bool

Description
-----------
Returns true if thep is out of the box built from the points on 2nd surface.
") IsOutSurf2Box;
		Standard_Boolean IsOutSurf2Box(const gp_Pnt2d & theP);

		/****************** NbPoints ******************/
		/**** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of points in the line.
") NbPoints;
		Standard_Integer NbPoints();

		/****************** RemovePoint ******************/
		/**** md5 signature: c7bf0e4af319953519a4144b346ae43d ****/
		%feature("compactdefaultargs") RemovePoint;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
None

Description
-----------
No available documentation.
") RemovePoint;
		void RemovePoint(const Standard_Integer I);

		/****************** Reverse ******************/
		/**** md5 signature: b751d6874fc026e19a7a6cb37e9ac1b4 ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the order of points of the line.
") Reverse;
		void Reverse();

		/****************** SetPoint ******************/
		/**** md5 signature: 3f014f983e4959a8adc3802bc6e127de ****/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "
Parameters
----------
Index: int
thePnt: gp_Pnt

Return
-------
None

Description
-----------
Sets the 3d point of the index-th pnton2s.
") SetPoint;
		void SetPoint(const Standard_Integer Index, const gp_Pnt & thePnt);

		/****************** SetUV ******************/
		/**** md5 signature: ace9005a01cb7b993999ab66ef8c0659 ****/
		%feature("compactdefaultargs") SetUV;
		%feature("autodoc", "
Parameters
----------
Index: int
OnFirst: bool
U: float
V: float

Return
-------
None

Description
-----------
Sets the parametric coordinates on one of the surfaces of the point of range index in the line.
") SetUV;
		void SetUV(const Standard_Integer Index, const Standard_Boolean OnFirst, const Standard_Real U, const Standard_Real V);

		/****************** Split ******************/
		/**** md5 signature: e386e59312767dd5099cad44c29dd524 ****/
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<IntSurf_LineOn2S>

Description
-----------
Keeps in <self> the points 1 to index-1, and returns the items index to the end.
") Split;
		opencascade::handle<IntSurf_LineOn2S> Split(const Standard_Integer Index);

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
Returns the point of range index in the line.
") Value;
		const IntSurf_PntOn2S & Value(const Standard_Integer Index);

		/****************** Value ******************/
		/**** md5 signature: 77cc0e9a473d154fdd211bbf2887bdce ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Index: int
P: IntSurf_PntOn2S

Return
-------
None

Description
-----------
Replaces the point of range index in the line.
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
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") IntSurf_PathPoint;
		 IntSurf_PathPoint();

		/****************** IntSurf_PathPoint ******************/
		/**** md5 signature: 1f36d1a91564a744627b33e53759eadd ****/
		%feature("compactdefaultargs") IntSurf_PathPoint;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
U: float
V: float

Return
-------
None

Description
-----------
No available documentation.
") IntSurf_PathPoint;
		 IntSurf_PathPoint(const gp_Pnt & P, const Standard_Real U, const Standard_Real V);

		/****************** AddUV ******************/
		/**** md5 signature: 5afbd6bdf7099dccb0b01803288a4f26 ****/
		%feature("compactdefaultargs") AddUV;
		%feature("autodoc", "
Parameters
----------
U: float
V: float

Return
-------
None

Description
-----------
No available documentation.
") AddUV;
		void AddUV(const Standard_Real U, const Standard_Real V);

		/****************** Direction2d ******************/
		/**** md5 signature: 7aae5ff2f37e31eadd39774422c0aab4 ****/
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
		/**** md5 signature: f385f807d122e2e9ed8491a658ff12e0 ****/
		%feature("compactdefaultargs") Direction3d;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") Direction3d;
		const gp_Vec Direction3d();

		/****************** IsPassingPnt ******************/
		/**** md5 signature: 78834dea556ad36c560313343e4d367d ****/
		%feature("compactdefaultargs") IsPassingPnt;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsPassingPnt;
		Standard_Boolean IsPassingPnt();

		/****************** IsTangent ******************/
		/**** md5 signature: 16a7964bb24e34f80fabc93e5a65aedc ****/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsTangent;
		Standard_Boolean IsTangent();

		/****************** Multiplicity ******************/
		/**** md5 signature: fd18c919ee9c5917e8cf38138b1aed7a ****/
		%feature("compactdefaultargs") Multiplicity;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Multiplicity;
		Standard_Integer Multiplicity();

		/****************** Parameters ******************/
		/**** md5 signature: e9cd1a857a99bf64aba6fcfeffe41477 ****/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
U: float
V: float

Description
-----------
No available documentation.
") Parameters;
		void Parameters(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** SetDirections ******************/
		/**** md5 signature: a8037b6fa0ec7521b164ff5c1a8b49f9 ****/
		%feature("compactdefaultargs") SetDirections;
		%feature("autodoc", "
Parameters
----------
V: gp_Vec
D: gp_Dir2d

Return
-------
None

Description
-----------
No available documentation.
") SetDirections;
		void SetDirections(const gp_Vec & V, const gp_Dir2d & D);

		/****************** SetPassing ******************/
		/**** md5 signature: d787def5875ee889a2b3e3fb778fe111 ****/
		%feature("compactdefaultargs") SetPassing;
		%feature("autodoc", "
Parameters
----------
Pass: bool

Return
-------
None

Description
-----------
No available documentation.
") SetPassing;
		void SetPassing(const Standard_Boolean Pass);

		/****************** SetTangency ******************/
		/**** md5 signature: 5a99c919dfb1f6464f235b5fa0685fc1 ****/
		%feature("compactdefaultargs") SetTangency;
		%feature("autodoc", "
Parameters
----------
Tang: bool

Return
-------
None

Description
-----------
No available documentation.
") SetTangency;
		void SetTangency(const Standard_Boolean Tang);

		/****************** SetValue ******************/
		/**** md5 signature: f3a20967231d8be807407d6f74d3b449 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
U: float
V: float

Return
-------
None

Description
-----------
No available documentation.
") SetValue;
		void SetValue(const gp_Pnt & P, const Standard_Real U, const Standard_Real V);

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

		/****************** Value2d ******************/
		/**** md5 signature: 0978c71a88cbaef21e300d448937efae ****/
		%feature("compactdefaultargs") Value2d;
		%feature("autodoc", "
Parameters
----------

Return
-------
U: float
V: float

Description
-----------
No available documentation.
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
		%feature("autodoc", "
Parameters
----------
PStart: IntSurf_PathPoint

Return
-------
gp_Dir2d

Description
-----------
Returns the tangent at the intersection in the parametric space of the parametrized surface.this tangent is associated to the value2d la tangente a un sens signifiant (indique le sens de chemin ement) an exception is raised if istangent is true.
") Direction2d;
		static gp_Dir2d Direction2d(const IntSurf_PathPoint & PStart);

		/****************** Direction3d ******************/
		/**** md5 signature: a3d511b1261ebf2f14773af16514eb08 ****/
		%feature("compactdefaultargs") Direction3d;
		%feature("autodoc", "
Parameters
----------
PStart: IntSurf_PathPoint

Return
-------
gp_Vec

Description
-----------
Returns the tangent at the intersection in 3d space associated to <p> an exception is raised if istangent is true.
") Direction3d;
		static gp_Vec Direction3d(const IntSurf_PathPoint & PStart);

		/****************** IsPassingPnt ******************/
		/**** md5 signature: fdb1f4f98bd59e0d5db8d65441b38390 ****/
		%feature("compactdefaultargs") IsPassingPnt;
		%feature("autodoc", "
Parameters
----------
PStart: IntSurf_PathPoint

Return
-------
bool

Description
-----------
Returns true if the point is a point on a non-oriented arc, which means that the intersection line does not stop at such a point but just go through such a point. ispassingpnt is true when isonarc is true.
") IsPassingPnt;
		static Standard_Boolean IsPassingPnt(const IntSurf_PathPoint & PStart);

		/****************** IsTangent ******************/
		/**** md5 signature: f0ec6f9500ff78bb0ea17a6ec4ff5935 ****/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "
Parameters
----------
PStart: IntSurf_PathPoint

Return
-------
bool

Description
-----------
Returns true if the surfaces are tangent at this point. istangent can be true when isonarc is true if ispassingpnt is true and istangent is true,this point is a stopped point.
") IsTangent;
		static Standard_Boolean IsTangent(const IntSurf_PathPoint & PStart);

		/****************** Multiplicity ******************/
		/**** md5 signature: 2c1afac074aae61f8fb0f0d052558a1a ****/
		%feature("compactdefaultargs") Multiplicity;
		%feature("autodoc", "
Parameters
----------
PStart: IntSurf_PathPoint

Return
-------
int

Description
-----------
Returns the multiplicity of the point i-e the number of auxillar parameters associated to the point which the principal parameters are given by value2d.
") Multiplicity;
		static Standard_Integer Multiplicity(const IntSurf_PathPoint & PStart);

		/****************** Parameters ******************/
		/**** md5 signature: fefec2e8407d490d511418bc37476824 ****/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "
Parameters
----------
PStart: IntSurf_PathPoint
Mult: int

Return
-------
U: float
V: float

Description
-----------
Parametric coordinates associated to the multiplicity. an exception is raised if mult<=0 or mult>multiplicity.
") Parameters;
		static void Parameters(const IntSurf_PathPoint & PStart, const Standard_Integer Mult, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Value2d ******************/
		/**** md5 signature: a7118be60c8b667fbaa8632fa17448da ****/
		%feature("compactdefaultargs") Value2d;
		%feature("autodoc", "
Parameters
----------
PStart: IntSurf_PathPoint

Return
-------
U: float
V: float

Description
-----------
Returns the <u, v> parameters which are associated with <p> it's the parameters which start the marching algorithm.
") Value2d;
		static void Value2d(const IntSurf_PathPoint & PStart, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Value3d ******************/
		/**** md5 signature: 1583deb55b7e1f6f4cb96c510b54519d ****/
		%feature("compactdefaultargs") Value3d;
		%feature("autodoc", "
Parameters
----------
PStart: IntSurf_PathPoint

Return
-------
gp_Pnt

Description
-----------
Returns the 3d coordinates of the starting point.
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
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") IntSurf_PntOn2S;
		 IntSurf_PntOn2S();

		/****************** IsSame ******************/
		/**** md5 signature: aa8cd55cea9a16a16909901ebd6abc45 ****/
		%feature("compactdefaultargs") IsSame;
		%feature("autodoc", "
Parameters
----------
theOtherPoint: IntSurf_PntOn2S
theTol3D: float (optional, default to 0.0)
theTol2D: float (optional, default to -1.0)

Return
-------
bool

Description
-----------
Returns true if 2d- and 3d-coordinates of theoterpoint are equal to corresponding coordinates of me (with given tolerance). if thetol2d < 0.0 we will compare 3d-points only.
") IsSame;
		Standard_Boolean IsSame(const IntSurf_PntOn2S & theOtherPoint, const Standard_Real theTol3D = 0.0, const Standard_Real theTol2D = -1.0);

		/****************** Parameters ******************/
		/**** md5 signature: 30bdd599088f74dedd5979b152a07fd4 ****/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "
Parameters
----------

Return
-------
U1: float
V1: float
U2: float
V2: float

Description
-----------
Returns the parameters of the point on both surfaces.
") Parameters;
		void Parameters(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** ParametersOnS1 ******************/
		/**** md5 signature: 64f6fb4c23b753a8ae110d855799d804 ****/
		%feature("compactdefaultargs") ParametersOnS1;
		%feature("autodoc", "
Parameters
----------

Return
-------
U1: float
V1: float

Description
-----------
Returns the parameters of the point on the first surface.
") ParametersOnS1;
		void ParametersOnS1(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** ParametersOnS2 ******************/
		/**** md5 signature: a037f950d5c09fdf632c55b7efba040b ****/
		%feature("compactdefaultargs") ParametersOnS2;
		%feature("autodoc", "
Parameters
----------

Return
-------
U2: float
V2: float

Description
-----------
Returns the parameters of the point on the second surface.
") ParametersOnS2;
		void ParametersOnS2(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** ParametersOnSurface ******************/
		/**** md5 signature: abefe2ce382f127f8fe8c5d1bd0971cd ****/
		%feature("compactdefaultargs") ParametersOnSurface;
		%feature("autodoc", "
Parameters
----------
OnFirst: bool

Return
-------
U: float
V: float

Description
-----------
Returns the parameters of the point in the parametric space of one of the surface.
") ParametersOnSurface;
		void ParametersOnSurface(const Standard_Boolean OnFirst, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** SetValue ******************/
		/**** md5 signature: 030ac1eb59faa7b90801ff6c52fc9800 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
Pt: gp_Pnt

Return
-------
None

Description
-----------
Sets the value of the point in 3d space.
") SetValue;
		void SetValue(const gp_Pnt & Pt);

		/****************** SetValue ******************/
		/**** md5 signature: 808312724ee6d7f7429ed945cc18e16a ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
Pt: gp_Pnt
OnFirst: bool
U: float
V: float

Return
-------
None

Description
-----------
Sets the values of the point in 3d space, and in the parametric space of one of the surface.
") SetValue;
		void SetValue(const gp_Pnt & Pt, const Standard_Boolean OnFirst, const Standard_Real U, const Standard_Real V);

		/****************** SetValue ******************/
		/**** md5 signature: df04f76e4f9af1926a2ae7a2c7b1e580 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
Pt: gp_Pnt
U1: float
V1: float
U2: float
V2: float

Return
-------
None

Description
-----------
Sets the values of the point in 3d space, and in the parametric space of each surface.
") SetValue;
		void SetValue(const gp_Pnt & Pt, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2);

		/****************** SetValue ******************/
		/**** md5 signature: 659ca05a4ffe0fa78e9950e04b65ad52 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
OnFirst: bool
U: float
V: float

Return
-------
None

Description
-----------
Set the values of the point in the parametric space of one of the surface.
") SetValue;
		void SetValue(const Standard_Boolean OnFirst, const Standard_Real U, const Standard_Real V);

		/****************** SetValue ******************/
		/**** md5 signature: b0dba33634cfd5f960958e140df57e83 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
U1: float
V1: float
U2: float
V2: float

Return
-------
None

Description
-----------
Set the values of the point in the parametric space of one of the surface.
") SetValue;
		void SetValue(const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2);

		/****************** Value ******************/
		/**** md5 signature: eddd2908948849b73f6d8aacab318652 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the point in 3d space.
") Value;
		const gp_Pnt Value();

		/****************** ValueOnSurface ******************/
		/**** md5 signature: 7ee65588a5f8d776a208788975827c2c ****/
		%feature("compactdefaultargs") ValueOnSurface;
		%feature("autodoc", "
Parameters
----------
OnFirst: bool

Return
-------
gp_Pnt2d

Description
-----------
Returns the point in 2d space of one of the surfaces.
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
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") IntSurf_Quadric;
		 IntSurf_Quadric();

		/****************** IntSurf_Quadric ******************/
		/**** md5 signature: b26451d2363572fb30a1be301e5d1d81 ****/
		%feature("compactdefaultargs") IntSurf_Quadric;
		%feature("autodoc", "
Parameters
----------
P: gp_Pln

Return
-------
None

Description
-----------
No available documentation.
") IntSurf_Quadric;
		 IntSurf_Quadric(const gp_Pln & P);

		/****************** IntSurf_Quadric ******************/
		/**** md5 signature: d42d588fe24687638acf9573ef502fe5 ****/
		%feature("compactdefaultargs") IntSurf_Quadric;
		%feature("autodoc", "
Parameters
----------
C: gp_Cylinder

Return
-------
None

Description
-----------
No available documentation.
") IntSurf_Quadric;
		 IntSurf_Quadric(const gp_Cylinder & C);

		/****************** IntSurf_Quadric ******************/
		/**** md5 signature: 70a630d70c6befdf753547586f305de3 ****/
		%feature("compactdefaultargs") IntSurf_Quadric;
		%feature("autodoc", "
Parameters
----------
S: gp_Sphere

Return
-------
None

Description
-----------
No available documentation.
") IntSurf_Quadric;
		 IntSurf_Quadric(const gp_Sphere & S);

		/****************** IntSurf_Quadric ******************/
		/**** md5 signature: 55bfe8c5c11c107dcd7d37d4c170bd55 ****/
		%feature("compactdefaultargs") IntSurf_Quadric;
		%feature("autodoc", "
Parameters
----------
C: gp_Cone

Return
-------
None

Description
-----------
No available documentation.
") IntSurf_Quadric;
		 IntSurf_Quadric(const gp_Cone & C);

		/****************** IntSurf_Quadric ******************/
		/**** md5 signature: a4552543f673ee745a2a293b84acf4a7 ****/
		%feature("compactdefaultargs") IntSurf_Quadric;
		%feature("autodoc", "
Parameters
----------
T: gp_Torus

Return
-------
None

Description
-----------
No available documentation.
") IntSurf_Quadric;
		 IntSurf_Quadric(const gp_Torus & T);

		/****************** Cone ******************/
		/**** md5 signature: 433ba8697232d6bc7b71708b08d190e5 ****/
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", "Return
-------
gp_Cone

Description
-----------
No available documentation.
") Cone;
		gp_Cone Cone();

		/****************** Cylinder ******************/
		/**** md5 signature: 60a8831694e0858ad1a30449c1edb3c9 ****/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "Return
-------
gp_Cylinder

Description
-----------
No available documentation.
") Cylinder;
		gp_Cylinder Cylinder();

		/****************** D1 ******************/
		/**** md5 signature: 9e70ed4843af0bc8bcd7afd9285b482c ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D1;
		void D1(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V);

		/****************** DN ******************/
		/**** md5 signature: 02c249fcb50eab490fed64db9f653acc ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
Nu: int
Nv: int

Return
-------
gp_Vec

Description
-----------
No available documentation.
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Real V, const Standard_Integer Nu, const Standard_Integer Nv);

		/****************** Distance ******************/
		/**** md5 signature: d9ba17ce87a8f8e1c8805850d4d732ba ****/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
float

Description
-----------
No available documentation.
") Distance;
		Standard_Real Distance(const gp_Pnt & P);

		/****************** Gradient ******************/
		/**** md5 signature: 1b4f28024feaa1e1d7062a57d1e2cee5 ****/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
gp_Vec

Description
-----------
No available documentation.
") Gradient;
		gp_Vec Gradient(const gp_Pnt & P);

		/****************** Normale ******************/
		/**** md5 signature: e93b2278bb4f872fd8e274bff7654999 ****/
		%feature("compactdefaultargs") Normale;
		%feature("autodoc", "
Parameters
----------
U: float
V: float

Return
-------
gp_Vec

Description
-----------
No available documentation.
") Normale;
		gp_Vec Normale(const Standard_Real U, const Standard_Real V);

		/****************** Normale ******************/
		/**** md5 signature: 67a8bda6406ee3cc1945baff398a2378 ****/
		%feature("compactdefaultargs") Normale;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
gp_Vec

Description
-----------
No available documentation.
") Normale;
		gp_Vec Normale(const gp_Pnt & P);

		/****************** Parameters ******************/
		/**** md5 signature: d08654902fd64aedbe40aa3454fd0d70 ****/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
U: float
V: float

Description
-----------
No available documentation.
") Parameters;
		void Parameters(const gp_Pnt & P, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Plane ******************/
		/**** md5 signature: 722ec8a1cda087d25cc539584e9de6e6 ****/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "Return
-------
gp_Pln

Description
-----------
No available documentation.
") Plane;
		gp_Pln Plane();

		/****************** SetValue ******************/
		/**** md5 signature: 3b0f4850ebf6ccbb6df1c2c1a32c2c6e ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
P: gp_Pln

Return
-------
None

Description
-----------
No available documentation.
") SetValue;
		void SetValue(const gp_Pln & P);

		/****************** SetValue ******************/
		/**** md5 signature: 847ad4b394b55539e88e78e666c70082 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
C: gp_Cylinder

Return
-------
None

Description
-----------
No available documentation.
") SetValue;
		void SetValue(const gp_Cylinder & C);

		/****************** SetValue ******************/
		/**** md5 signature: 8036d4b3e82383d9a92f9dd4ecb36057 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
S: gp_Sphere

Return
-------
None

Description
-----------
No available documentation.
") SetValue;
		void SetValue(const gp_Sphere & S);

		/****************** SetValue ******************/
		/**** md5 signature: c3dc19ae6034dc5d0e44df090bcc9af7 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
C: gp_Cone

Return
-------
None

Description
-----------
No available documentation.
") SetValue;
		void SetValue(const gp_Cone & C);

		/****************** SetValue ******************/
		/**** md5 signature: 6c9cb7f465cd6e67dd4365e6609d9a36 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
T: gp_Torus

Return
-------
None

Description
-----------
No available documentation.
") SetValue;
		void SetValue(const gp_Torus & T);

		/****************** Sphere ******************/
		/**** md5 signature: e02f27c8c733f0b938d13039e1e73f8c ****/
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", "Return
-------
gp_Sphere

Description
-----------
No available documentation.
") Sphere;
		gp_Sphere Sphere();

		/****************** Torus ******************/
		/**** md5 signature: 9bb22d5b92ef11cba62e467d89f58c66 ****/
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", "Return
-------
gp_Torus

Description
-----------
No available documentation.
") Torus;
		gp_Torus Torus();

		/****************** TypeQuadric ******************/
		/**** md5 signature: e6d9fc5adcd9d5bf3c73e5fd6797dca3 ****/
		%feature("compactdefaultargs") TypeQuadric;
		%feature("autodoc", "Return
-------
GeomAbs_SurfaceType

Description
-----------
No available documentation.
") TypeQuadric;
		GeomAbs_SurfaceType TypeQuadric();

		/****************** ValAndGrad ******************/
		/**** md5 signature: 788803e196dc9d3b7efe528594f539a6 ****/
		%feature("compactdefaultargs") ValAndGrad;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
Grad: gp_Vec

Return
-------
Dist: float

Description
-----------
No available documentation.
") ValAndGrad;
		void ValAndGrad(const gp_Pnt & P, Standard_Real &OutValue, gp_Vec & Grad);

		/****************** Value ******************/
		/**** md5 signature: 42959897db65d301eb66b5528ed15f16 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: float
V: float

Return
-------
gp_Pnt

Description
-----------
No available documentation.
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
		%feature("autodoc", "
Parameters
----------
Quad: IntSurf_Quadric
X: float
Y: float
Z: float
V: gp_Vec

Return
-------
None

Description
-----------
Returns the gradient of the function.
") Gradient;
		static void Gradient(const IntSurf_Quadric & Quad, const Standard_Real X, const Standard_Real Y, const Standard_Real Z, gp_Vec & V);

		/****************** Tolerance ******************/
		/**** md5 signature: 71006b4e399d2dd853e8202886a30034 ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "
Parameters
----------
Quad: IntSurf_Quadric

Return
-------
float

Description
-----------
Returns the tolerance of the zero of the implicit function.
") Tolerance;
		static Standard_Real Tolerance(const IntSurf_Quadric & Quad);

		/****************** Value ******************/
		/**** md5 signature: cb055aed0635a23cf3670cafec8be8da ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Quad: IntSurf_Quadric
X: float
Y: float
Z: float

Return
-------
float

Description
-----------
Returns the value of the function.
") Value;
		static Standard_Real Value(const IntSurf_Quadric & Quad, const Standard_Real X, const Standard_Real Y, const Standard_Real Z);

		/****************** ValueAndGradient ******************/
		/**** md5 signature: 0ed1171daf6860af1930c61944c58a0a ****/
		%feature("compactdefaultargs") ValueAndGradient;
		%feature("autodoc", "
Parameters
----------
Quad: IntSurf_Quadric
X: float
Y: float
Z: float
Grad: gp_Vec

Return
-------
Val: float

Description
-----------
Returns the value and the gradient.
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
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor. creates an undecided transition.
") IntSurf_Transition;
		 IntSurf_Transition();

		/****************** IntSurf_Transition ******************/
		/**** md5 signature: 0cf6241bb678fc95cadd1139dae6449b ****/
		%feature("compactdefaultargs") IntSurf_Transition;
		%feature("autodoc", "
Parameters
----------
Tangent: bool
Type: IntSurf_TypeTrans

Return
-------
None

Description
-----------
Create a in or out transition.
") IntSurf_Transition;
		 IntSurf_Transition(const Standard_Boolean Tangent, const IntSurf_TypeTrans Type);

		/****************** IntSurf_Transition ******************/
		/**** md5 signature: f50beef73f541d362ae7cadd36dfeca5 ****/
		%feature("compactdefaultargs") IntSurf_Transition;
		%feature("autodoc", "
Parameters
----------
Tangent: bool
Situ: IntSurf_Situation
Oppos: bool

Return
-------
None

Description
-----------
Create a touch transition.
") IntSurf_Transition;
		 IntSurf_Transition(const Standard_Boolean Tangent, const IntSurf_Situation Situ, const Standard_Boolean Oppos);

		/****************** IsOpposite ******************/
		/**** md5 signature: 393aca3277062552b7a8ec8cd414f82d ****/
		%feature("compactdefaultargs") IsOpposite;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns a significant value if transitiontype returns touch. in this case, the function returns true when the 2 curves locally define two different parts of the space. if transitiontype returns in or out or undecided, an exception is raised.
") IsOpposite;
		Standard_Boolean IsOpposite();

		/****************** IsTangent ******************/
		/**** md5 signature: 16a7964bb24e34f80fabc93e5a65aedc ****/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the point is tangent to the arc given by value. an exception is raised if transitiontype returns undecided.
") IsTangent;
		Standard_Boolean IsTangent();

		/****************** SetValue ******************/
		/**** md5 signature: 480a85fbe5c9655129aa9fea0ee77cc9 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
Tangent: bool
Type: IntSurf_TypeTrans

Return
-------
None

Description
-----------
Set the values of an in or out transition.
") SetValue;
		void SetValue(const Standard_Boolean Tangent, const IntSurf_TypeTrans Type);

		/****************** SetValue ******************/
		/**** md5 signature: 23785efc5a23a4c4a0d956dc57ac0a5e ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
Tangent: bool
Situ: IntSurf_Situation
Oppos: bool

Return
-------
None

Description
-----------
Set the values of a touch transition.
") SetValue;
		void SetValue(const Standard_Boolean Tangent, const IntSurf_Situation Situ, const Standard_Boolean Oppos);

		/****************** SetValue ******************/
		/**** md5 signature: 8e6ddcc525f3b0b127452029d0eaab09 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Return
-------
None

Description
-----------
Set the values of an undecided transition.
") SetValue;
		void SetValue();

		/****************** Situation ******************/
		/**** md5 signature: a6322eec5c49e75e440e204dfe600fbd ****/
		%feature("compactdefaultargs") Situation;
		%feature("autodoc", "Return
-------
IntSurf_Situation

Description
-----------
Returns a significant value if transitiontype returns touch. in this case, the function returns: inside when the intersection line remains inside the arc, outside when it remains outside the arc, unknown when the calsulus cannot give results. if transitiontype returns in, or out, or undecided, a exception is raised.
") Situation;
		IntSurf_Situation Situation();

		/****************** TransitionType ******************/
		/**** md5 signature: 51d0ad127452bfb2a082c82034278ee5 ****/
		%feature("compactdefaultargs") TransitionType;
		%feature("autodoc", "Return
-------
IntSurf_TypeTrans

Description
-----------
Returns the type of transition (in/out/touch/undecided) for the arc given by value. this the transition of the intersection line compared to the arc of restriction, i-e when the function returns inside for example, it means that the intersection line goes inside the part of plane limited by the arc of restriction.
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
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def intsurf_MakeTransition(*args):
	return intsurf.MakeTransition(*args)

@deprecated
def intsurf_SetPeriod(*args):
	return intsurf.SetPeriod(*args)

@deprecated
def IntSurf_InteriorPointTool_Direction2d(*args):
	return IntSurf_InteriorPointTool.Direction2d(*args)

@deprecated
def IntSurf_InteriorPointTool_Direction3d(*args):
	return IntSurf_InteriorPointTool.Direction3d(*args)

@deprecated
def IntSurf_InteriorPointTool_Value2d(*args):
	return IntSurf_InteriorPointTool.Value2d(*args)

@deprecated
def IntSurf_InteriorPointTool_Value3d(*args):
	return IntSurf_InteriorPointTool.Value3d(*args)

@deprecated
def IntSurf_PathPointTool_Direction2d(*args):
	return IntSurf_PathPointTool.Direction2d(*args)

@deprecated
def IntSurf_PathPointTool_Direction3d(*args):
	return IntSurf_PathPointTool.Direction3d(*args)

@deprecated
def IntSurf_PathPointTool_IsPassingPnt(*args):
	return IntSurf_PathPointTool.IsPassingPnt(*args)

@deprecated
def IntSurf_PathPointTool_IsTangent(*args):
	return IntSurf_PathPointTool.IsTangent(*args)

@deprecated
def IntSurf_PathPointTool_Multiplicity(*args):
	return IntSurf_PathPointTool.Multiplicity(*args)

@deprecated
def IntSurf_PathPointTool_Parameters(*args):
	return IntSurf_PathPointTool.Parameters(*args)

@deprecated
def IntSurf_PathPointTool_Value2d(*args):
	return IntSurf_PathPointTool.Value2d(*args)

@deprecated
def IntSurf_PathPointTool_Value3d(*args):
	return IntSurf_PathPointTool.Value3d(*args)

@deprecated
def IntSurf_QuadricTool_Gradient(*args):
	return IntSurf_QuadricTool.Gradient(*args)

@deprecated
def IntSurf_QuadricTool_Tolerance(*args):
	return IntSurf_QuadricTool.Tolerance(*args)

@deprecated
def IntSurf_QuadricTool_Value(*args):
	return IntSurf_QuadricTool.Value(*args)

@deprecated
def IntSurf_QuadricTool_ValueAndGradient(*args):
	return IntSurf_QuadricTool.ValueAndGradient(*args)

}
