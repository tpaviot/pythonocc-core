/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)

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

/* handles */
%wrap_handle(IntSurf_LineOn2S)
/* end handles declaration */

/* templates */
%template(IntSurf_SequenceOfPathPoint) NCollection_Sequence <IntSurf_PathPoint>;
%template(IntSurf_SequenceOfInteriorPoint) NCollection_Sequence <IntSurf_InteriorPoint>;
%template(IntSurf_Allocator) opencascade::handle <NCollection_BaseAllocator>;
%template(IntSurf_SequenceOfCouple) NCollection_Sequence <IntSurf_Couple>;
%template(IntSurf_SequenceOfPntOn2S) NCollection_Sequence <IntSurf_PntOn2S>;
%template(IntSurf_ListOfPntOn2S) NCollection_List <IntSurf_PntOn2S>;
%template(IntSurf_ListIteratorOfListOfPntOn2S) NCollection_TListIterator<IntSurf_PntOn2S>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence <IntSurf_PathPoint> IntSurf_SequenceOfPathPoint;
typedef NCollection_Sequence <IntSurf_InteriorPoint> IntSurf_SequenceOfInteriorPoint;
typedef opencascade::handle <NCollection_BaseAllocator> IntSurf_Allocator;
typedef NCollection_Sequence <IntSurf_Couple> IntSurf_SequenceOfCouple;
typedef NCollection_Sequence <IntSurf_PntOn2S> IntSurf_SequenceOfPntOn2S;
typedef NCollection_List <IntSurf_PntOn2S> IntSurf_ListOfPntOn2S;
typedef NCollection_List <IntSurf_PntOn2S>::Iterator IntSurf_ListIteratorOfListOfPntOn2S;
/* end typedefs declaration */

/****************
* class IntSurf *
****************/
%rename(intsurf) IntSurf;
class IntSurf {
	public:
		/****************** MakeTransition ******************/
		%feature("compactdefaultargs") MakeTransition;
		%feature("autodoc", "* Computes the transition of the intersection point between the two lines. TgFirst is the tangent vector of the first line. TgSecond is the tangent vector of the second line. Normal is the direction used to orientate the cross product TgFirst^TgSecond. TFirst is the transition of the point on the first line. TSecond is the transition of the point on the second line.
	:param TgFirst:
	:type TgFirst: gp_Vec
	:param TgSecond:
	:type TgSecond: gp_Vec
	:param Normal:
	:type Normal: gp_Dir
	:param TFirst:
	:type TFirst: IntSurf_Transition
	:param TSecond:
	:type TSecond: IntSurf_Transition
	:rtype: void") MakeTransition;
		static void MakeTransition (const gp_Vec & TgFirst,const gp_Vec & TgSecond,const gp_Dir & Normal,IntSurf_Transition & TFirst,IntSurf_Transition & TSecond);

		/****************** SetPeriod ******************/
		%feature("compactdefaultargs") SetPeriod;
		%feature("autodoc", "* Fills theArrOfPeriod array by the period values of theFirstSurf and theSecondSurf. [0] = U-period of theFirstSurf, [1] = V-period of theFirstSurf, [2] = U-period of theSecondSurf, [3] = V-period of theSecondSurf. //! If surface is not periodic in correspond direction then its period is considered to be equal to 0.
	:param theFirstSurf:
	:type theFirstSurf: Adaptor3d_HSurface
	:param theSecondSurf:
	:type theSecondSurf: Adaptor3d_HSurface
	:param theArrOfPeriod:
	:type theArrOfPeriod: float
	:rtype: void") SetPeriod;
		static void SetPeriod (const opencascade::handle<Adaptor3d_HSurface> & theFirstSurf,const opencascade::handle<Adaptor3d_HSurface> & theSecondSurf,Standard_Real theArrOfPeriod[4]);

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
		/****************** First ******************/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "* returns the first element
	:rtype: int") First;
		Standard_Integer First ();

		/****************** IntSurf_Couple ******************/
		%feature("compactdefaultargs") IntSurf_Couple;
		%feature("autodoc", ":rtype: None") IntSurf_Couple;
		 IntSurf_Couple ();

		/****************** IntSurf_Couple ******************/
		%feature("compactdefaultargs") IntSurf_Couple;
		%feature("autodoc", ":param Index1:
	:type Index1: int
	:param Index2:
	:type Index2: int
	:rtype: None") IntSurf_Couple;
		 IntSurf_Couple (const Standard_Integer Index1,const Standard_Integer Index2);

		/****************** Second ******************/
		%feature("compactdefaultargs") Second;
		%feature("autodoc", "* returns the Second element
	:rtype: int") Second;
		Standard_Integer Second ();

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
		/****************** Direction ******************/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "* Returns the tangent at the intersection in 3d space associated to the interior point.
	:rtype: gp_Vec") Direction;
		const gp_Vec  Direction ();

		/****************** Direction2d ******************/
		%feature("compactdefaultargs") Direction2d;
		%feature("autodoc", "* Returns the tangent at the intersection in the parametric space of the parametric surface.
	:rtype: gp_Vec2d") Direction2d;
		const gp_Vec2d  Direction2d ();

		/****************** IntSurf_InteriorPoint ******************/
		%feature("compactdefaultargs") IntSurf_InteriorPoint;
		%feature("autodoc", ":rtype: None") IntSurf_InteriorPoint;
		 IntSurf_InteriorPoint ();

		/****************** IntSurf_InteriorPoint ******************/
		%feature("compactdefaultargs") IntSurf_InteriorPoint;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Direc:
	:type Direc: gp_Vec
	:param Direc2d:
	:type Direc2d: gp_Vec2d
	:rtype: None") IntSurf_InteriorPoint;
		 IntSurf_InteriorPoint (const gp_Pnt & P,const Standard_Real U,const Standard_Real V,const gp_Vec & Direc,const gp_Vec2d & Direc2d);

		/****************** Parameters ******************/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "* Returns the parameters of the interior point on the parametric surface.
	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: None") Parameters;
		void Parameters (Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Direc:
	:type Direc: gp_Vec
	:param Direc2d:
	:type Direc2d: gp_Vec2d
	:rtype: None") SetValue;
		void SetValue (const gp_Pnt & P,const Standard_Real U,const Standard_Real V,const gp_Vec & Direc,const gp_Vec2d & Direc2d);

		/****************** UParameter ******************/
		%feature("compactdefaultargs") UParameter;
		%feature("autodoc", "* Returns the first parameter of the interior point on the parametric surface.
	:rtype: float") UParameter;
		Standard_Real UParameter ();

		/****************** VParameter ******************/
		%feature("compactdefaultargs") VParameter;
		%feature("autodoc", "* Returns the second parameter of the interior point on the parametric surface.
	:rtype: float") VParameter;
		Standard_Real VParameter ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the 3d coordinates of the interior point.
	:rtype: gp_Pnt") Value;
		const gp_Pnt  Value ();

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
		%feature("autodoc", "* returns the tangent at the intersectin in the parametric space of the parametrized surface.This tangent is associated to the value2d
	:param PStart:
	:type PStart: IntSurf_InteriorPoint
	:rtype: gp_Dir2d") Direction2d;
		static gp_Dir2d Direction2d (const IntSurf_InteriorPoint & PStart);

		/****************** Direction3d ******************/
		%feature("compactdefaultargs") Direction3d;
		%feature("autodoc", "* returns the tangent at the intersectin in 3d space associated to <P>
	:param PStart:
	:type PStart: IntSurf_InteriorPoint
	:rtype: gp_Vec") Direction3d;
		static gp_Vec Direction3d (const IntSurf_InteriorPoint & PStart);

		/****************** Value2d ******************/
		%feature("compactdefaultargs") Value2d;
		%feature("autodoc", "* Returns the <U,V> parameters which are associated with <P> it's the parameters which start the marching algorithm
	:param PStart:
	:type PStart: IntSurf_InteriorPoint
	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: None") Value2d;
		static void Value2d (const IntSurf_InteriorPoint & PStart,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Value3d ******************/
		%feature("compactdefaultargs") Value3d;
		%feature("autodoc", "* Returns the 3d coordinates of the starting point.
	:param PStart:
	:type PStart: IntSurf_InteriorPoint
	:rtype: gp_Pnt") Value3d;
		static gp_Pnt Value3d (const IntSurf_InteriorPoint & PStart);

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
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds a point in the line.
	:param P:
	:type P: IntSurf_PntOn2S
	:rtype: None") Add;
		void Add (const IntSurf_PntOn2S & P);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", ":rtype: None") Clear;
		void Clear ();

		/****************** InsertBefore ******************/
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", ":param I:
	:type I: int
	:param P:
	:type P: IntSurf_PntOn2S
	:rtype: None") InsertBefore;
		void InsertBefore (const Standard_Integer I,const IntSurf_PntOn2S & P);

		/****************** IntSurf_LineOn2S ******************/
		%feature("compactdefaultargs") IntSurf_LineOn2S;
		%feature("autodoc", ":param theAllocator: default value is 0
	:type theAllocator: IntSurf_Allocator
	:rtype: None") IntSurf_LineOn2S;
		 IntSurf_LineOn2S (const IntSurf_Allocator & theAllocator = 0);

		/****************** IsOutBox ******************/
		%feature("compactdefaultargs") IsOutBox;
		%feature("autodoc", "* Returns True if theP is out of the box built from 3D-points.
	:param theP:
	:type theP: gp_Pnt
	:rtype: bool") IsOutBox;
		Standard_Boolean IsOutBox (const gp_Pnt & theP);

		/****************** IsOutSurf1Box ******************/
		%feature("compactdefaultargs") IsOutSurf1Box;
		%feature("autodoc", "* Returns True if theP is out of the box built from the points on 1st surface
	:param theP:
	:type theP: gp_Pnt2d
	:rtype: bool") IsOutSurf1Box;
		Standard_Boolean IsOutSurf1Box (const gp_Pnt2d & theP);

		/****************** IsOutSurf2Box ******************/
		%feature("compactdefaultargs") IsOutSurf2Box;
		%feature("autodoc", "* Returns True if theP is out of the box built from the points on 2nd surface
	:param theP:
	:type theP: gp_Pnt2d
	:rtype: bool") IsOutSurf2Box;
		Standard_Boolean IsOutSurf2Box (const gp_Pnt2d & theP);

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "* Returns the number of points in the line.
	:rtype: int") NbPoints;
		Standard_Integer NbPoints ();

		/****************** RemovePoint ******************/
		%feature("compactdefaultargs") RemovePoint;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: None") RemovePoint;
		void RemovePoint (const Standard_Integer I);

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "* Reverses the order of points of the line.
	:rtype: None") Reverse;
		void Reverse ();

		/****************** SetUV ******************/
		%feature("compactdefaultargs") SetUV;
		%feature("autodoc", "* Sets the parametric coordinates on one of the surfaces of the point of range Index in the line.
	:param Index:
	:type Index: int
	:param OnFirst:
	:type OnFirst: bool
	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: None") SetUV;
		void SetUV (const Standard_Integer Index,const Standard_Boolean OnFirst,const Standard_Real U,const Standard_Real V);

		/****************** Split ******************/
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "* Keeps in <self> the points 1 to Index-1, and returns the items Index to the end.
	:param Index:
	:type Index: int
	:rtype: opencascade::handle<IntSurf_LineOn2S>") Split;
		opencascade::handle<IntSurf_LineOn2S> Split (const Standard_Integer Index);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the point of range Index in the line.
	:param Index:
	:type Index: int
	:rtype: IntSurf_PntOn2S") Value;
		const IntSurf_PntOn2S & Value (const Standard_Integer Index);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Replaces the point of range Index in the line.
	:param Index:
	:type Index: int
	:param P:
	:type P: IntSurf_PntOn2S
	:rtype: None") Value;
		void Value (const Standard_Integer Index,const IntSurf_PntOn2S & P);

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
		/****************** AddUV ******************/
		%feature("compactdefaultargs") AddUV;
		%feature("autodoc", ":param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: None") AddUV;
		void AddUV (const Standard_Real U,const Standard_Real V);

		/****************** Direction2d ******************/
		%feature("compactdefaultargs") Direction2d;
		%feature("autodoc", ":rtype: gp_Dir2d") Direction2d;
		const gp_Dir2d  Direction2d ();

		/****************** Direction3d ******************/
		%feature("compactdefaultargs") Direction3d;
		%feature("autodoc", ":rtype: gp_Vec") Direction3d;
		const gp_Vec  Direction3d ();

		/****************** IntSurf_PathPoint ******************/
		%feature("compactdefaultargs") IntSurf_PathPoint;
		%feature("autodoc", ":rtype: None") IntSurf_PathPoint;
		 IntSurf_PathPoint ();

		/****************** IntSurf_PathPoint ******************/
		%feature("compactdefaultargs") IntSurf_PathPoint;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: None") IntSurf_PathPoint;
		 IntSurf_PathPoint (const gp_Pnt & P,const Standard_Real U,const Standard_Real V);

		/****************** IsPassingPnt ******************/
		%feature("compactdefaultargs") IsPassingPnt;
		%feature("autodoc", ":rtype: bool") IsPassingPnt;
		Standard_Boolean IsPassingPnt ();

		/****************** IsTangent ******************/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", ":rtype: bool") IsTangent;
		Standard_Boolean IsTangent ();

		/****************** Multiplicity ******************/
		%feature("compactdefaultargs") Multiplicity;
		%feature("autodoc", ":rtype: int") Multiplicity;
		Standard_Integer Multiplicity ();

		/****************** Parameters ******************/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", ":param Index:
	:type Index: int
	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: None") Parameters;
		void Parameters (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** SetDirections ******************/
		%feature("compactdefaultargs") SetDirections;
		%feature("autodoc", ":param V:
	:type V: gp_Vec
	:param D:
	:type D: gp_Dir2d
	:rtype: None") SetDirections;
		void SetDirections (const gp_Vec & V,const gp_Dir2d & D);

		/****************** SetPassing ******************/
		%feature("compactdefaultargs") SetPassing;
		%feature("autodoc", ":param Pass:
	:type Pass: bool
	:rtype: None") SetPassing;
		void SetPassing (const Standard_Boolean Pass);

		/****************** SetTangency ******************/
		%feature("compactdefaultargs") SetTangency;
		%feature("autodoc", ":param Tang:
	:type Tang: bool
	:rtype: None") SetTangency;
		void SetTangency (const Standard_Boolean Tang);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: None") SetValue;
		void SetValue (const gp_Pnt & P,const Standard_Real U,const Standard_Real V);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: gp_Pnt") Value;
		const gp_Pnt  Value ();

		/****************** Value2d ******************/
		%feature("compactdefaultargs") Value2d;
		%feature("autodoc", ":param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: None") Value2d;
		void Value2d (Standard_Real &OutValue,Standard_Real &OutValue);

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
		%feature("autodoc", "* returns the tangent at the intersection in the parametric space of the parametrized surface.This tangent is associated to the value2d la tangente a un sens signifiant (indique le sens de chemin ement) an exception is raised if IsTangent is true.
	:param PStart:
	:type PStart: IntSurf_PathPoint
	:rtype: gp_Dir2d") Direction2d;
		static gp_Dir2d Direction2d (const IntSurf_PathPoint & PStart);

		/****************** Direction3d ******************/
		%feature("compactdefaultargs") Direction3d;
		%feature("autodoc", "* returns the tangent at the intersection in 3d space associated to <P> an exception is raised if IsTangent is true.
	:param PStart:
	:type PStart: IntSurf_PathPoint
	:rtype: gp_Vec") Direction3d;
		static gp_Vec Direction3d (const IntSurf_PathPoint & PStart);

		/****************** IsPassingPnt ******************/
		%feature("compactdefaultargs") IsPassingPnt;
		%feature("autodoc", "* Returns True if the point is a point on a non-oriented arc, which means that the intersection line does not stop at such a point but just go through such a point. IsPassingPnt is True when IsOnArc is True
	:param PStart:
	:type PStart: IntSurf_PathPoint
	:rtype: bool") IsPassingPnt;
		static Standard_Boolean IsPassingPnt (const IntSurf_PathPoint & PStart);

		/****************** IsTangent ******************/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "* Returns True if the surfaces are tangent at this point. IsTangent can be True when IsOnArc is True if IsPassingPnt is True and IsTangent is True,this point is a stopped point.
	:param PStart:
	:type PStart: IntSurf_PathPoint
	:rtype: bool") IsTangent;
		static Standard_Boolean IsTangent (const IntSurf_PathPoint & PStart);

		/****************** Multiplicity ******************/
		%feature("compactdefaultargs") Multiplicity;
		%feature("autodoc", "* Returns the multiplicity of the point i-e the number of auxillar parameters associated to the point which the principal parameters are given by Value2d
	:param PStart:
	:type PStart: IntSurf_PathPoint
	:rtype: int") Multiplicity;
		static Standard_Integer Multiplicity (const IntSurf_PathPoint & PStart);

		/****************** Parameters ******************/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "* Parametric coordinates associated to the multiplicity. An exception is raised if Mult<=0 or Mult>multiplicity.
	:param PStart:
	:type PStart: IntSurf_PathPoint
	:param Mult:
	:type Mult: int
	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: None") Parameters;
		static void Parameters (const IntSurf_PathPoint & PStart,const Standard_Integer Mult,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Value2d ******************/
		%feature("compactdefaultargs") Value2d;
		%feature("autodoc", "* Returns the <U, V> parameters which are associated with <P> it's the parameters which start the marching algorithm
	:param PStart:
	:type PStart: IntSurf_PathPoint
	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: None") Value2d;
		static void Value2d (const IntSurf_PathPoint & PStart,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Value3d ******************/
		%feature("compactdefaultargs") Value3d;
		%feature("autodoc", "* Returns the 3d coordinates of the starting point.
	:param PStart:
	:type PStart: IntSurf_PathPoint
	:rtype: gp_Pnt") Value3d;
		static gp_Pnt Value3d (const IntSurf_PathPoint & PStart);

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
		%feature("autodoc", "* Empty constructor.
	:rtype: None") IntSurf_PntOn2S;
		 IntSurf_PntOn2S ();

		/****************** IsSame ******************/
		%feature("compactdefaultargs") IsSame;
		%feature("autodoc", "* Returns True if 2D- and 3D-coordinates of theOterPoint are equal to corresponding coordinates of me (with given tolerance). If theTol2D < 0.0 we will compare 3D-points only.
	:param theOtherPoint:
	:type theOtherPoint: IntSurf_PntOn2S
	:param theTol3D: default value is 0.0
	:type theTol3D: float
	:param theTol2D: default value is -1.0
	:type theTol2D: float
	:rtype: bool") IsSame;
		Standard_Boolean IsSame (const IntSurf_PntOn2S & theOtherPoint,const Standard_Real theTol3D = 0.0,const Standard_Real theTol2D = -1.0);

		/****************** Parameters ******************/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "* Returns the parameters of the point on both surfaces.
	:param U1:
	:type U1: float
	:param V1:
	:type V1: float
	:param U2:
	:type U2: float
	:param V2:
	:type V2: float
	:rtype: None") Parameters;
		void Parameters (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** ParametersOnS1 ******************/
		%feature("compactdefaultargs") ParametersOnS1;
		%feature("autodoc", "* Returns the parameters of the point on the first surface.
	:param U1:
	:type U1: float
	:param V1:
	:type V1: float
	:rtype: None") ParametersOnS1;
		void ParametersOnS1 (Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** ParametersOnS2 ******************/
		%feature("compactdefaultargs") ParametersOnS2;
		%feature("autodoc", "* Returns the parameters of the point on the second surface.
	:param U2:
	:type U2: float
	:param V2:
	:type V2: float
	:rtype: None") ParametersOnS2;
		void ParametersOnS2 (Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** ParametersOnSurface ******************/
		%feature("compactdefaultargs") ParametersOnSurface;
		%feature("autodoc", "* Returns the parameters of the point in the parametric space of one of the surface.
	:param OnFirst:
	:type OnFirst: bool
	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: None") ParametersOnSurface;
		void ParametersOnSurface (const Standard_Boolean OnFirst,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "* Sets the value of the point in 3d space.
	:param Pt:
	:type Pt: gp_Pnt
	:rtype: None") SetValue;
		void SetValue (const gp_Pnt & Pt);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "* Sets the values of the point in 3d space, and in the parametric space of one of the surface.
	:param Pt:
	:type Pt: gp_Pnt
	:param OnFirst:
	:type OnFirst: bool
	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: None") SetValue;
		void SetValue (const gp_Pnt & Pt,const Standard_Boolean OnFirst,const Standard_Real U,const Standard_Real V);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "* Sets the values of the point in 3d space, and in the parametric space of each surface.
	:param Pt:
	:type Pt: gp_Pnt
	:param U1:
	:type U1: float
	:param V1:
	:type V1: float
	:param U2:
	:type U2: float
	:param V2:
	:type V2: float
	:rtype: None") SetValue;
		void SetValue (const gp_Pnt & Pt,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "* Set the values of the point in the parametric space of one of the surface.
	:param OnFirst:
	:type OnFirst: bool
	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: None") SetValue;
		void SetValue (const Standard_Boolean OnFirst,const Standard_Real U,const Standard_Real V);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "* Set the values of the point in the parametric space of one of the surface.
	:param U1:
	:type U1: float
	:param V1:
	:type V1: float
	:param U2:
	:type U2: float
	:param V2:
	:type V2: float
	:rtype: None") SetValue;
		void SetValue (const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the point in 3d space.
	:rtype: gp_Pnt") Value;
		const gp_Pnt  Value ();

		/****************** ValueOnSurface ******************/
		%feature("compactdefaultargs") ValueOnSurface;
		%feature("autodoc", "* Returns the point in 2d space of one of the surfaces.
	:param OnFirst:
	:type OnFirst: bool
	:rtype: gp_Pnt2d") ValueOnSurface;
		gp_Pnt2d ValueOnSurface (const Standard_Boolean OnFirst);

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
		/****************** Cone ******************/
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", ":rtype: gp_Cone") Cone;
		gp_Cone Cone ();

		/****************** Cylinder ******************/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", ":rtype: gp_Cylinder") Cylinder;
		gp_Cylinder Cylinder ();

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", ":param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:param D1U:
	:type D1U: gp_Vec
	:param D1V:
	:type D1V: gp_Vec
	:rtype: None") D1;
		void D1 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", ":param U:
	:type U: float
	:param V:
	:type V: float
	:param Nu:
	:type Nu: int
	:param Nv:
	:type Nv: int
	:rtype: gp_Vec") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Real V,const Standard_Integer Nu,const Standard_Integer Nv);

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:rtype: float") Distance;
		Standard_Real Distance (const gp_Pnt & P);

		/****************** Gradient ******************/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:rtype: gp_Vec") Gradient;
		gp_Vec Gradient (const gp_Pnt & P);

		/****************** IntSurf_Quadric ******************/
		%feature("compactdefaultargs") IntSurf_Quadric;
		%feature("autodoc", ":rtype: None") IntSurf_Quadric;
		 IntSurf_Quadric ();

		/****************** IntSurf_Quadric ******************/
		%feature("compactdefaultargs") IntSurf_Quadric;
		%feature("autodoc", ":param P:
	:type P: gp_Pln
	:rtype: None") IntSurf_Quadric;
		 IntSurf_Quadric (const gp_Pln & P);

		/****************** IntSurf_Quadric ******************/
		%feature("compactdefaultargs") IntSurf_Quadric;
		%feature("autodoc", ":param C:
	:type C: gp_Cylinder
	:rtype: None") IntSurf_Quadric;
		 IntSurf_Quadric (const gp_Cylinder & C);

		/****************** IntSurf_Quadric ******************/
		%feature("compactdefaultargs") IntSurf_Quadric;
		%feature("autodoc", ":param S:
	:type S: gp_Sphere
	:rtype: None") IntSurf_Quadric;
		 IntSurf_Quadric (const gp_Sphere & S);

		/****************** IntSurf_Quadric ******************/
		%feature("compactdefaultargs") IntSurf_Quadric;
		%feature("autodoc", ":param C:
	:type C: gp_Cone
	:rtype: None") IntSurf_Quadric;
		 IntSurf_Quadric (const gp_Cone & C);

		/****************** IntSurf_Quadric ******************/
		%feature("compactdefaultargs") IntSurf_Quadric;
		%feature("autodoc", ":param T:
	:type T: gp_Torus
	:rtype: None") IntSurf_Quadric;
		 IntSurf_Quadric (const gp_Torus & T);

		/****************** Normale ******************/
		%feature("compactdefaultargs") Normale;
		%feature("autodoc", ":param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: gp_Vec") Normale;
		gp_Vec Normale (const Standard_Real U,const Standard_Real V);

		/****************** Normale ******************/
		%feature("compactdefaultargs") Normale;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:rtype: gp_Vec") Normale;
		gp_Vec Normale (const gp_Pnt & P);

		/****************** Parameters ******************/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: None") Parameters;
		void Parameters (const gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Plane ******************/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", ":rtype: gp_Pln") Plane;
		gp_Pln Plane ();

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", ":param P:
	:type P: gp_Pln
	:rtype: None") SetValue;
		void SetValue (const gp_Pln & P);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", ":param C:
	:type C: gp_Cylinder
	:rtype: None") SetValue;
		void SetValue (const gp_Cylinder & C);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", ":param S:
	:type S: gp_Sphere
	:rtype: None") SetValue;
		void SetValue (const gp_Sphere & S);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", ":param C:
	:type C: gp_Cone
	:rtype: None") SetValue;
		void SetValue (const gp_Cone & C);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", ":param T:
	:type T: gp_Torus
	:rtype: None") SetValue;
		void SetValue (const gp_Torus & T);

		/****************** Sphere ******************/
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", ":rtype: gp_Sphere") Sphere;
		gp_Sphere Sphere ();

		/****************** Torus ******************/
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", ":rtype: gp_Torus") Torus;
		gp_Torus Torus ();

		/****************** TypeQuadric ******************/
		%feature("compactdefaultargs") TypeQuadric;
		%feature("autodoc", ":rtype: GeomAbs_SurfaceType") TypeQuadric;
		GeomAbs_SurfaceType TypeQuadric ();

		/****************** ValAndGrad ******************/
		%feature("compactdefaultargs") ValAndGrad;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:param Dist:
	:type Dist: float
	:param Grad:
	:type Grad: gp_Vec
	:rtype: None") ValAndGrad;
		void ValAndGrad (const gp_Pnt & P,Standard_Real &OutValue,gp_Vec & Grad);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: gp_Pnt") Value;
		gp_Pnt Value (const Standard_Real U,const Standard_Real V);

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
		%feature("autodoc", "* Returns the gradient of the function.
	:param Quad:
	:type Quad: IntSurf_Quadric
	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:param V:
	:type V: gp_Vec
	:rtype: None") Gradient;
		static void Gradient (const IntSurf_Quadric & Quad,const Standard_Real X,const Standard_Real Y,const Standard_Real Z,gp_Vec & V);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "* returns the tolerance of the zero of the implicit function
	:param Quad:
	:type Quad: IntSurf_Quadric
	:rtype: float") Tolerance;
		static Standard_Real Tolerance (const IntSurf_Quadric & Quad);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the value of the function.
	:param Quad:
	:type Quad: IntSurf_Quadric
	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:rtype: float") Value;
		static Standard_Real Value (const IntSurf_Quadric & Quad,const Standard_Real X,const Standard_Real Y,const Standard_Real Z);

		/****************** ValueAndGradient ******************/
		%feature("compactdefaultargs") ValueAndGradient;
		%feature("autodoc", "* Returns the value and the gradient.
	:param Quad:
	:type Quad: IntSurf_Quadric
	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:param Val:
	:type Val: float
	:param Grad:
	:type Grad: gp_Vec
	:rtype: None") ValueAndGradient;
		static void ValueAndGradient (const IntSurf_Quadric & Quad,const Standard_Real X,const Standard_Real Y,const Standard_Real Z,Standard_Real &OutValue,gp_Vec & Grad);

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
		%feature("autodoc", "* Empty constructor. Creates an UNDECIDED transition.
	:rtype: None") IntSurf_Transition;
		 IntSurf_Transition ();

		/****************** IntSurf_Transition ******************/
		%feature("compactdefaultargs") IntSurf_Transition;
		%feature("autodoc", "* Create a IN or OUT transition
	:param Tangent:
	:type Tangent: bool
	:param Type:
	:type Type: IntSurf_TypeTrans
	:rtype: None") IntSurf_Transition;
		 IntSurf_Transition (const Standard_Boolean Tangent,const IntSurf_TypeTrans Type);

		/****************** IntSurf_Transition ******************/
		%feature("compactdefaultargs") IntSurf_Transition;
		%feature("autodoc", "* Create a TOUCH transition.
	:param Tangent:
	:type Tangent: bool
	:param Situ:
	:type Situ: IntSurf_Situation
	:param Oppos:
	:type Oppos: bool
	:rtype: None") IntSurf_Transition;
		 IntSurf_Transition (const Standard_Boolean Tangent,const IntSurf_Situation Situ,const Standard_Boolean Oppos);

		/****************** IsOpposite ******************/
		%feature("compactdefaultargs") IsOpposite;
		%feature("autodoc", "* returns a significant value if TransitionType returns TOUCH. In this case, the function returns true when the 2 curves locally define two different parts of the space. If TransitionType returns IN or OUT or UNDECIDED, an exception is raised.
	:rtype: bool") IsOpposite;
		Standard_Boolean IsOpposite ();

		/****************** IsTangent ******************/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "* Returns True if the point is tangent to the arc given by Value. An exception is raised if TransitionType returns UNDECIDED.
	:rtype: bool") IsTangent;
		Standard_Boolean IsTangent ();

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "* Set the values of an IN or OUT transition.
	:param Tangent:
	:type Tangent: bool
	:param Type:
	:type Type: IntSurf_TypeTrans
	:rtype: None") SetValue;
		void SetValue (const Standard_Boolean Tangent,const IntSurf_TypeTrans Type);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "* Set the values of a TOUCH transition.
	:param Tangent:
	:type Tangent: bool
	:param Situ:
	:type Situ: IntSurf_Situation
	:param Oppos:
	:type Oppos: bool
	:rtype: None") SetValue;
		void SetValue (const Standard_Boolean Tangent,const IntSurf_Situation Situ,const Standard_Boolean Oppos);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "* Set the values of an UNDECIDED transition.
	:rtype: None") SetValue;
		void SetValue ();

		/****************** Situation ******************/
		%feature("compactdefaultargs") Situation;
		%feature("autodoc", "* Returns a significant value if TransitionType returns TOUCH. In this case, the function returns : INSIDE when the intersection line remains inside the Arc, OUTSIDE when it remains outside the Arc, UNKNOWN when the calsulus cannot give results. If TransitionType returns IN, or OUT, or UNDECIDED, a exception is raised.
	:rtype: IntSurf_Situation") Situation;
		IntSurf_Situation Situation ();

		/****************** TransitionType ******************/
		%feature("compactdefaultargs") TransitionType;
		%feature("autodoc", "* Returns the type of Transition (in/out/touch/undecided) for the arc given by value. This the transition of the intersection line compared to the Arc of restriction, i-e when the function returns INSIDE for example, it means that the intersection line goes inside the part of plane limited by the arc of restriction.
	:rtype: IntSurf_TypeTrans") TransitionType;
		IntSurf_TypeTrans TransitionType ();

};


%extend IntSurf_Transition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
