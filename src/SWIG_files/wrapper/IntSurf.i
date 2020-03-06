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

class IntSurf_Situation:
	IntSurf_Inside = 0
	IntSurf_Outside = 1
	IntSurf_Unknown = 2

class IntSurf_TypeTrans:
	IntSurf_In = 0
	IntSurf_Out = 1
	IntSurf_Touch = 2
	IntSurf_Undecided = 3
};
/* end python proxy for enums */

/* handles */
%wrap_handle(IntSurf_LineOn2S)
/* end handles declaration */

/* templates */
%template(IntSurf_Allocator) opencascade::handle<NCollection_BaseAllocator>;
%template(IntSurf_ListIteratorOfListOfPntOn2S) NCollection_TListIterator<IntSurf_PntOn2S>;
%template(IntSurf_ListOfPntOn2S) NCollection_List<IntSurf_PntOn2S>;
%template(IntSurf_SequenceOfCouple) NCollection_Sequence<IntSurf_Couple>;
%template(IntSurf_SequenceOfInteriorPoint) NCollection_Sequence<IntSurf_InteriorPoint>;
%template(IntSurf_SequenceOfPathPoint) NCollection_Sequence<IntSurf_PathPoint>;
%template(IntSurf_SequenceOfPntOn2S) NCollection_Sequence<IntSurf_PntOn2S>;
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
		%feature("compactdefaultargs") IntSurf_Couple;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntSurf_Couple;
		 IntSurf_Couple();

		/****************** IntSurf_Couple ******************/
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
		%feature("compactdefaultargs") First;
		%feature("autodoc", "Returns the first element.

Returns
-------
int
") First;
		Standard_Integer First();

		/****************** Second ******************/
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
		%feature("compactdefaultargs") IntSurf_InteriorPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntSurf_InteriorPoint;
		 IntSurf_InteriorPoint();

		/****************** IntSurf_InteriorPoint ******************/
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
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Returns the tangent at the intersection in 3d space associated to the interior point.

Returns
-------
gp_Vec
") Direction;
		const gp_Vec Direction();

		/****************** Direction2d ******************/
		%feature("compactdefaultargs") Direction2d;
		%feature("autodoc", "Returns the tangent at the intersection in the parametric space of the parametric surface.

Returns
-------
gp_Vec2d
") Direction2d;
		const gp_Vec2d Direction2d();

		/****************** Parameters ******************/
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
		%feature("compactdefaultargs") UParameter;
		%feature("autodoc", "Returns the first parameter of the interior point on the parametric surface.

Returns
-------
float
") UParameter;
		Standard_Real UParameter();

		/****************** VParameter ******************/
		%feature("compactdefaultargs") VParameter;
		%feature("autodoc", "Returns the second parameter of the interior point on the parametric surface.

Returns
-------
float
") VParameter;
		Standard_Real VParameter();

		/****************** Value ******************/
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
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear;
		void Clear();

		/****************** InsertBefore ******************/
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
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of points in the line.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** RemovePoint ******************/
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
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Reverses the order of points of the line.

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** SetUV ******************/
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
		%feature("compactdefaultargs") IntSurf_PathPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntSurf_PathPoint;
		 IntSurf_PathPoint();

		/****************** IntSurf_PathPoint ******************/
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
		%feature("compactdefaultargs") Direction2d;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Dir2d
") Direction2d;
		const gp_Dir2d Direction2d();

		/****************** Direction3d ******************/
		%feature("compactdefaultargs") Direction3d;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") Direction3d;
		const gp_Vec Direction3d();

		/****************** IsPassingPnt ******************/
		%feature("compactdefaultargs") IsPassingPnt;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsPassingPnt;
		Standard_Boolean IsPassingPnt();

		/****************** IsTangent ******************/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsTangent;
		Standard_Boolean IsTangent();

		/****************** Multiplicity ******************/
		%feature("compactdefaultargs") Multiplicity;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Multiplicity;
		Standard_Integer Multiplicity();

		/****************** Parameters ******************/
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
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") Value;
		const gp_Pnt Value();

		/****************** Value2d ******************/
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
		%feature("compactdefaultargs") IntSurf_PntOn2S;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IntSurf_PntOn2S;
		 IntSurf_PntOn2S();

		/****************** IsSame ******************/
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
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the point in 3d space.

Returns
-------
gp_Pnt
") Value;
		const gp_Pnt Value();

		/****************** ValueOnSurface ******************/
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
		%feature("compactdefaultargs") IntSurf_Quadric;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntSurf_Quadric;
		 IntSurf_Quadric();

		/****************** IntSurf_Quadric ******************/
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
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Cone
") Cone;
		gp_Cone Cone();

		/****************** Cylinder ******************/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Cylinder
") Cylinder;
		gp_Cylinder Cylinder();

		/****************** D1 ******************/
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
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pln
") Plane;
		gp_Pln Plane();

		/****************** SetValue ******************/
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
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Sphere
") Sphere;
		gp_Sphere Sphere();

		/****************** Torus ******************/
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Torus
") Torus;
		gp_Torus Torus();

		/****************** TypeQuadric ******************/
		%feature("compactdefaultargs") TypeQuadric;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_SurfaceType
") TypeQuadric;
		GeomAbs_SurfaceType TypeQuadric();

		/****************** ValAndGrad ******************/
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
		%feature("compactdefaultargs") IntSurf_Transition;
		%feature("autodoc", "Empty constructor. creates an undecided transition.

Returns
-------
None
") IntSurf_Transition;
		 IntSurf_Transition();

		/****************** IntSurf_Transition ******************/
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
		%feature("compactdefaultargs") IsOpposite;
		%feature("autodoc", "Returns a significant value if transitiontype returns touch. in this case, the function returns true when the 2 curves locally define two different parts of the space. if transitiontype returns in or out or undecided, an exception is raised.

Returns
-------
bool
") IsOpposite;
		Standard_Boolean IsOpposite();

		/****************** IsTangent ******************/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "Returns true if the point is tangent to the arc given by value. an exception is raised if transitiontype returns undecided.

Returns
-------
bool
") IsTangent;
		Standard_Boolean IsTangent();

		/****************** SetValue ******************/
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
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Set the values of an undecided transition.

Returns
-------
None
") SetValue;
		void SetValue();

		/****************** Situation ******************/
		%feature("compactdefaultargs") Situation;
		%feature("autodoc", "Returns a significant value if transitiontype returns touch. in this case, the function returns : inside when the intersection line remains inside the arc, outside when it remains outside the arc, unknown when the calsulus cannot give results. if transitiontype returns in, or out, or undecided, a exception is raised.

Returns
-------
IntSurf_Situation
") Situation;
		IntSurf_Situation Situation();

		/****************** TransitionType ******************/
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
