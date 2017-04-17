/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") IntSurf

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include IntSurf_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
typedef Handle_NCollection_BaseAllocator IntSurf_Allocator;
typedef NCollection_Sequence <IntSurf_PntOn2S> IntSurf_SequenceOfPntOn2S;
/* end typedefs declaration */

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

%rename(intsurf) IntSurf;
class IntSurf {
	public:
		%feature("compactdefaultargs") MakeTransition;
		%feature("autodoc", "	* Computes the transition of the intersection point between the two lines. TgFirst is the tangent vector of the first line. TgSecond is the tangent vector of the second line. Normal is the direction used to orientate the cross product TgFirst^TgSecond. TFirst is the transition of the point on the first line. TSecond is the transition of the point on the second line.

	:param TgFirst:
	:type TgFirst: gp_Vec
	:param TgSecond:
	:type TgSecond: gp_Vec
	:param Normal:
	:type Normal: gp_Dir
	:param TFirst:
	:type TFirst: IntSurf_Transition &
	:param TSecond:
	:type TSecond: IntSurf_Transition &
	:rtype: void
") MakeTransition;
		static void MakeTransition (const gp_Vec & TgFirst,const gp_Vec & TgSecond,const gp_Dir & Normal,IntSurf_Transition & TFirst,IntSurf_Transition & TSecond);
};


%extend IntSurf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntSurf_Couple;
class IntSurf_Couple {
	public:
		%feature("compactdefaultargs") IntSurf_Couple;
		%feature("autodoc", "	:rtype: None
") IntSurf_Couple;
		 IntSurf_Couple ();
		%feature("compactdefaultargs") IntSurf_Couple;
		%feature("autodoc", "	:param Index1:
	:type Index1: int
	:param Index2:
	:type Index2: int
	:rtype: None
") IntSurf_Couple;
		 IntSurf_Couple (const Standard_Integer Index1,const Standard_Integer Index2);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	* returns the first element

	:rtype: int
") First;
		Standard_Integer First ();
		%feature("compactdefaultargs") Second;
		%feature("autodoc", "	* returns the Second element

	:rtype: int
") Second;
		Standard_Integer Second ();
};


%extend IntSurf_Couple {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntSurf_InteriorPoint;
class IntSurf_InteriorPoint {
	public:
		%feature("compactdefaultargs") IntSurf_InteriorPoint;
		%feature("autodoc", "	:rtype: None
") IntSurf_InteriorPoint;
		 IntSurf_InteriorPoint ();
		%feature("compactdefaultargs") IntSurf_InteriorPoint;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Direc:
	:type Direc: gp_Vec
	:param Direc2d:
	:type Direc2d: gp_Vec2d
	:rtype: None
") IntSurf_InteriorPoint;
		 IntSurf_InteriorPoint (const gp_Pnt & P,const Standard_Real U,const Standard_Real V,const gp_Vec & Direc,const gp_Vec2d & Direc2d);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Direc:
	:type Direc: gp_Vec
	:param Direc2d:
	:type Direc2d: gp_Vec2d
	:rtype: None
") SetValue;
		void SetValue (const gp_Pnt & P,const Standard_Real U,const Standard_Real V,const gp_Vec & Direc,const gp_Vec2d & Direc2d);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the 3d coordinates of the interior point.

	:rtype: gp_Pnt
") Value;
		const gp_Pnt  Value ();
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "	* Returns the parameters of the interior point on the parametric surface.

	:param U:
	:type U: float &
	:param V:
	:type V: float &
	:rtype: None
") Parameters;
		void Parameters (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") UParameter;
		%feature("autodoc", "	* Returns the first parameter of the interior point on the parametric surface.

	:rtype: float
") UParameter;
		Standard_Real UParameter ();
		%feature("compactdefaultargs") VParameter;
		%feature("autodoc", "	* Returns the second parameter of the interior point on the parametric surface.

	:rtype: float
") VParameter;
		Standard_Real VParameter ();
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "	* Returns the tangent at the intersection in 3d space associated to the interior point.

	:rtype: gp_Vec
") Direction;
		const gp_Vec  Direction ();
		%feature("compactdefaultargs") Direction2d;
		%feature("autodoc", "	* Returns the tangent at the intersection in the parametric space of the parametric surface.

	:rtype: gp_Vec2d
") Direction2d;
		const gp_Vec2d  Direction2d ();
};


%extend IntSurf_InteriorPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class IntSurf_InteriorPointTool {
	public:
		%feature("compactdefaultargs") Value3d;
		%feature("autodoc", "	* Returns the 3d coordinates of the starting point.

	:param PStart:
	:type PStart: IntSurf_InteriorPoint &
	:rtype: gp_Pnt
") Value3d;
		static gp_Pnt Value3d (const IntSurf_InteriorPoint & PStart);
		%feature("compactdefaultargs") Value2d;
		%feature("autodoc", "	* Returns the <U,V> parameters which are associated with <P> it's the parameters which start the marching algorithm

	:param PStart:
	:type PStart: IntSurf_InteriorPoint &
	:param U:
	:type U: float &
	:param V:
	:type V: float &
	:rtype: void
") Value2d;
		static void Value2d (const IntSurf_InteriorPoint & PStart,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Direction3d;
		%feature("autodoc", "	* returns the tangent at the intersectin in 3d space associated to <P>

	:param PStart:
	:type PStart: IntSurf_InteriorPoint &
	:rtype: gp_Vec
") Direction3d;
		static gp_Vec Direction3d (const IntSurf_InteriorPoint & PStart);
		%feature("compactdefaultargs") Direction2d;
		%feature("autodoc", "	* returns the tangent at the intersectin in the parametric space of the parametrized surface.This tangent is associated to the value2d

	:param PStart:
	:type PStart: IntSurf_InteriorPoint &
	:rtype: gp_Dir2d
") Direction2d;
		static gp_Dir2d Direction2d (const IntSurf_InteriorPoint & PStart);
};


%extend IntSurf_InteriorPointTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntSurf_LineOn2S;
class IntSurf_LineOn2S : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") IntSurf_LineOn2S;
		%feature("autodoc", "	:param theAllocator: default value is 0
	:type theAllocator: IntSurf_Allocator &
	:rtype: None
") IntSurf_LineOn2S;
		 IntSurf_LineOn2S (const IntSurf_Allocator & theAllocator = 0);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds a point in the line.

	:param P:
	:type P: IntSurf_PntOn2S &
	:rtype: None
") Add;
		void Add (const IntSurf_PntOn2S & P);
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "	* Returns the number of points in the line.

	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the point of range Index in the line.

	:param Index:
	:type Index: int
	:rtype: IntSurf_PntOn2S
") Value;
		const IntSurf_PntOn2S & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	* Reverses the order of points of the line.

	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	* Keeps in <self> the points 1 to Index-1, and returns the items Index to the end.

	:param Index:
	:type Index: int
	:rtype: Handle_IntSurf_LineOn2S
") Split;
		Handle_IntSurf_LineOn2S Split (const Standard_Integer Index);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Replaces the point of range Index in the line.

	:param Index:
	:type Index: int
	:param P:
	:type P: IntSurf_PntOn2S &
	:rtype: None
") Value;
		void Value (const Standard_Integer Index,const IntSurf_PntOn2S & P);
		%feature("compactdefaultargs") SetUV;
		%feature("autodoc", "	* Sets the parametric coordinates on one of the surfaces of the point of range Index in the line.

	:param Index:
	:type Index: int
	:param OnFirst:
	:type OnFirst: bool
	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: None
") SetUV;
		void SetUV (const Standard_Integer Index,const Standard_Boolean OnFirst,const Standard_Real U,const Standard_Real V);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: int
	:param P:
	:type P: IntSurf_PntOn2S &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer I,const IntSurf_PntOn2S & P);
		%feature("compactdefaultargs") RemovePoint;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: None
") RemovePoint;
		void RemovePoint (const Standard_Integer I);
};


%extend IntSurf_LineOn2S {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IntSurf_LineOn2S(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IntSurf_LineOn2S::Handle_IntSurf_LineOn2S %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IntSurf_LineOn2S;
class Handle_IntSurf_LineOn2S : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_IntSurf_LineOn2S();
        Handle_IntSurf_LineOn2S(const Handle_IntSurf_LineOn2S &aHandle);
        Handle_IntSurf_LineOn2S(const IntSurf_LineOn2S *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntSurf_LineOn2S DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntSurf_LineOn2S {
    IntSurf_LineOn2S* _get_reference() {
    return (IntSurf_LineOn2S*)$self->Access();
    }
};

%extend Handle_IntSurf_LineOn2S {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IntSurf_LineOn2S {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntSurf_ListIteratorOfListOfPntOn2S;
class IntSurf_ListIteratorOfListOfPntOn2S {
	public:
		%feature("compactdefaultargs") IntSurf_ListIteratorOfListOfPntOn2S;
		%feature("autodoc", "	:rtype: None
") IntSurf_ListIteratorOfListOfPntOn2S;
		 IntSurf_ListIteratorOfListOfPntOn2S ();
		%feature("compactdefaultargs") IntSurf_ListIteratorOfListOfPntOn2S;
		%feature("autodoc", "	:param L:
	:type L: IntSurf_ListOfPntOn2S &
	:rtype: None
") IntSurf_ListIteratorOfListOfPntOn2S;
		 IntSurf_ListIteratorOfListOfPntOn2S (const IntSurf_ListOfPntOn2S & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: IntSurf_ListOfPntOn2S &
	:rtype: None
") Initialize;
		void Initialize (const IntSurf_ListOfPntOn2S & L);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: IntSurf_PntOn2S
") Value;
		IntSurf_PntOn2S & Value ();
};


%extend IntSurf_ListIteratorOfListOfPntOn2S {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntSurf_ListNodeOfListOfPntOn2S;
class IntSurf_ListNodeOfListOfPntOn2S : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") IntSurf_ListNodeOfListOfPntOn2S;
		%feature("autodoc", "	:param I:
	:type I: IntSurf_PntOn2S &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") IntSurf_ListNodeOfListOfPntOn2S;
		 IntSurf_ListNodeOfListOfPntOn2S (const IntSurf_PntOn2S & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: IntSurf_PntOn2S
") Value;
		IntSurf_PntOn2S & Value ();
};


%extend IntSurf_ListNodeOfListOfPntOn2S {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IntSurf_ListNodeOfListOfPntOn2S(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IntSurf_ListNodeOfListOfPntOn2S::Handle_IntSurf_ListNodeOfListOfPntOn2S %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IntSurf_ListNodeOfListOfPntOn2S;
class Handle_IntSurf_ListNodeOfListOfPntOn2S : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_IntSurf_ListNodeOfListOfPntOn2S();
        Handle_IntSurf_ListNodeOfListOfPntOn2S(const Handle_IntSurf_ListNodeOfListOfPntOn2S &aHandle);
        Handle_IntSurf_ListNodeOfListOfPntOn2S(const IntSurf_ListNodeOfListOfPntOn2S *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntSurf_ListNodeOfListOfPntOn2S DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntSurf_ListNodeOfListOfPntOn2S {
    IntSurf_ListNodeOfListOfPntOn2S* _get_reference() {
    return (IntSurf_ListNodeOfListOfPntOn2S*)$self->Access();
    }
};

%extend Handle_IntSurf_ListNodeOfListOfPntOn2S {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IntSurf_ListNodeOfListOfPntOn2S {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntSurf_ListOfPntOn2S;
class IntSurf_ListOfPntOn2S {
	public:
		%feature("compactdefaultargs") IntSurf_ListOfPntOn2S;
		%feature("autodoc", "	:rtype: None
") IntSurf_ListOfPntOn2S;
		 IntSurf_ListOfPntOn2S ();
		%feature("compactdefaultargs") IntSurf_ListOfPntOn2S;
		%feature("autodoc", "	:param Other:
	:type Other: IntSurf_ListOfPntOn2S &
	:rtype: None
") IntSurf_ListOfPntOn2S;
		 IntSurf_ListOfPntOn2S (const IntSurf_ListOfPntOn2S & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: IntSurf_ListOfPntOn2S &
	:rtype: None
") Assign;
		void Assign (const IntSurf_ListOfPntOn2S & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: IntSurf_ListOfPntOn2S &
	:rtype: None
") operator =;
		void operator = (const IntSurf_ListOfPntOn2S & Other);
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: IntSurf_PntOn2S &
	:rtype: None
") Prepend;
		void Prepend (const IntSurf_PntOn2S & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: IntSurf_PntOn2S &
	:param theIt:
	:type theIt: IntSurf_ListIteratorOfListOfPntOn2S &
	:rtype: None
") Prepend;
		void Prepend (const IntSurf_PntOn2S & I,IntSurf_ListIteratorOfListOfPntOn2S & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: IntSurf_ListOfPntOn2S &
	:rtype: None
") Prepend;
		void Prepend (IntSurf_ListOfPntOn2S & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: IntSurf_PntOn2S &
	:rtype: None
") Append;
		void Append (const IntSurf_PntOn2S & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: IntSurf_PntOn2S &
	:param theIt:
	:type theIt: IntSurf_ListIteratorOfListOfPntOn2S &
	:rtype: None
") Append;
		void Append (const IntSurf_PntOn2S & I,IntSurf_ListIteratorOfListOfPntOn2S & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: IntSurf_ListOfPntOn2S &
	:rtype: None
") Append;
		void Append (IntSurf_ListOfPntOn2S & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: IntSurf_PntOn2S
") First;
		IntSurf_PntOn2S & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: IntSurf_PntOn2S
") Last;
		IntSurf_PntOn2S & Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: IntSurf_ListIteratorOfListOfPntOn2S &
	:rtype: None
") Remove;
		void Remove (IntSurf_ListIteratorOfListOfPntOn2S & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: IntSurf_PntOn2S &
	:param It:
	:type It: IntSurf_ListIteratorOfListOfPntOn2S &
	:rtype: None
") InsertBefore;
		void InsertBefore (const IntSurf_PntOn2S & I,IntSurf_ListIteratorOfListOfPntOn2S & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: IntSurf_ListOfPntOn2S &
	:param It:
	:type It: IntSurf_ListIteratorOfListOfPntOn2S &
	:rtype: None
") InsertBefore;
		void InsertBefore (IntSurf_ListOfPntOn2S & Other,IntSurf_ListIteratorOfListOfPntOn2S & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: IntSurf_PntOn2S &
	:param It:
	:type It: IntSurf_ListIteratorOfListOfPntOn2S &
	:rtype: None
") InsertAfter;
		void InsertAfter (const IntSurf_PntOn2S & I,IntSurf_ListIteratorOfListOfPntOn2S & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: IntSurf_ListOfPntOn2S &
	:param It:
	:type It: IntSurf_ListIteratorOfListOfPntOn2S &
	:rtype: None
") InsertAfter;
		void InsertAfter (IntSurf_ListOfPntOn2S & Other,IntSurf_ListIteratorOfListOfPntOn2S & It);
};


%extend IntSurf_ListOfPntOn2S {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntSurf_PathPoint;
class IntSurf_PathPoint {
	public:
		%feature("compactdefaultargs") IntSurf_PathPoint;
		%feature("autodoc", "	:rtype: None
") IntSurf_PathPoint;
		 IntSurf_PathPoint ();
		%feature("compactdefaultargs") IntSurf_PathPoint;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: None
") IntSurf_PathPoint;
		 IntSurf_PathPoint (const gp_Pnt & P,const Standard_Real U,const Standard_Real V);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: None
") SetValue;
		void SetValue (const gp_Pnt & P,const Standard_Real U,const Standard_Real V);
		%feature("compactdefaultargs") AddUV;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: None
") AddUV;
		void AddUV (const Standard_Real U,const Standard_Real V);
		%feature("compactdefaultargs") SetDirections;
		%feature("autodoc", "	:param V:
	:type V: gp_Vec
	:param D:
	:type D: gp_Dir2d
	:rtype: None
") SetDirections;
		void SetDirections (const gp_Vec & V,const gp_Dir2d & D);
		%feature("compactdefaultargs") SetTangency;
		%feature("autodoc", "	:param Tang:
	:type Tang: bool
	:rtype: None
") SetTangency;
		void SetTangency (const Standard_Boolean Tang);
		%feature("compactdefaultargs") SetPassing;
		%feature("autodoc", "	:param Pass:
	:type Pass: bool
	:rtype: None
") SetPassing;
		void SetPassing (const Standard_Boolean Pass);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: gp_Pnt
") Value;
		const gp_Pnt  Value ();
		%feature("compactdefaultargs") Value2d;
		%feature("autodoc", "	:param U:
	:type U: float &
	:param V:
	:type V: float &
	:rtype: None
") Value2d;
		void Value2d (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") IsPassingPnt;
		%feature("autodoc", "	:rtype: bool
") IsPassingPnt;
		Standard_Boolean IsPassingPnt ();
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "	:rtype: bool
") IsTangent;
		Standard_Boolean IsTangent ();
		%feature("compactdefaultargs") Direction3d;
		%feature("autodoc", "	:rtype: gp_Vec
") Direction3d;
		const gp_Vec  Direction3d ();
		%feature("compactdefaultargs") Direction2d;
		%feature("autodoc", "	:rtype: gp_Dir2d
") Direction2d;
		const gp_Dir2d  Direction2d ();
		%feature("compactdefaultargs") Multiplicity;
		%feature("autodoc", "	:rtype: int
") Multiplicity;
		Standard_Integer Multiplicity ();
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param U:
	:type U: float &
	:param V:
	:type V: float &
	:rtype: None
") Parameters;
		void Parameters (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend IntSurf_PathPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class IntSurf_PathPointTool {
	public:
		%feature("compactdefaultargs") Value3d;
		%feature("autodoc", "	* Returns the 3d coordinates of the starting point.

	:param PStart:
	:type PStart: IntSurf_PathPoint &
	:rtype: gp_Pnt
") Value3d;
		static gp_Pnt Value3d (const IntSurf_PathPoint & PStart);
		%feature("compactdefaultargs") Value2d;
		%feature("autodoc", "	* Returns the <U, V> parameters which are associated with <P> it's the parameters which start the marching algorithm

	:param PStart:
	:type PStart: IntSurf_PathPoint &
	:param U:
	:type U: float &
	:param V:
	:type V: float &
	:rtype: void
") Value2d;
		static void Value2d (const IntSurf_PathPoint & PStart,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") IsPassingPnt;
		%feature("autodoc", "	* Returns True if the point is a point on a non-oriented arc, which means that the intersection line does not stop at such a point but just go through such a point. IsPassingPnt is True when IsOnArc is True

	:param PStart:
	:type PStart: IntSurf_PathPoint &
	:rtype: bool
") IsPassingPnt;
		static Standard_Boolean IsPassingPnt (const IntSurf_PathPoint & PStart);
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "	* Returns True if the surfaces are tangent at this point. IsTangent can be True when IsOnArc is True if IsPassingPnt is True and IsTangent is True,this point is a stopped point.

	:param PStart:
	:type PStart: IntSurf_PathPoint &
	:rtype: bool
") IsTangent;
		static Standard_Boolean IsTangent (const IntSurf_PathPoint & PStart);
		%feature("compactdefaultargs") Direction3d;
		%feature("autodoc", "	* returns the tangent at the intersection in 3d space associated to <P> an exception is raised if IsTangent is true.

	:param PStart:
	:type PStart: IntSurf_PathPoint &
	:rtype: gp_Vec
") Direction3d;
		static gp_Vec Direction3d (const IntSurf_PathPoint & PStart);
		%feature("compactdefaultargs") Direction2d;
		%feature("autodoc", "	* returns the tangent at the intersection in the parametric space of the parametrized surface.This tangent is associated to the value2d la tangente a un sens signifiant (indique le sens de chemin ement) an exception is raised if IsTangent is true.

	:param PStart:
	:type PStart: IntSurf_PathPoint &
	:rtype: gp_Dir2d
") Direction2d;
		static gp_Dir2d Direction2d (const IntSurf_PathPoint & PStart);
		%feature("compactdefaultargs") Multiplicity;
		%feature("autodoc", "	* Returns the multiplicity of the point i-e the number of auxillar parameters associated to the point which the principal parameters are given by Value2d

	:param PStart:
	:type PStart: IntSurf_PathPoint &
	:rtype: int
") Multiplicity;
		static Standard_Integer Multiplicity (const IntSurf_PathPoint & PStart);
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "	* Parametric coordinates associated to the multiplicity. An exception is raised if Mult<=0 or Mult>multiplicity.

	:param PStart:
	:type PStart: IntSurf_PathPoint &
	:param Mult:
	:type Mult: int
	:param U:
	:type U: float &
	:param V:
	:type V: float &
	:rtype: void
") Parameters;
		static void Parameters (const IntSurf_PathPoint & PStart,const Standard_Integer Mult,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend IntSurf_PathPointTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntSurf_PntOn2S;
class IntSurf_PntOn2S {
	public:
		%feature("compactdefaultargs") IntSurf_PntOn2S;
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") IntSurf_PntOn2S;
		 IntSurf_PntOn2S ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Sets the value of the point in 3d space.

	:param Pt:
	:type Pt: gp_Pnt
	:rtype: None
") SetValue;
		void SetValue (const gp_Pnt & Pt);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Sets the values of the point in 3d space, and in the parametric space of one of the surface.

	:param Pt:
	:type Pt: gp_Pnt
	:param OnFirst:
	:type OnFirst: bool
	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: None
") SetValue;
		void SetValue (const gp_Pnt & Pt,const Standard_Boolean OnFirst,const Standard_Real U,const Standard_Real V);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Sets the values of the point in 3d space, and in the parametric space of each surface.

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
	:rtype: None
") SetValue;
		void SetValue (const gp_Pnt & Pt,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Set the values of the point in the parametric space of one of the surface.

	:param OnFirst:
	:type OnFirst: bool
	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: None
") SetValue;
		void SetValue (const Standard_Boolean OnFirst,const Standard_Real U,const Standard_Real V);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Set the values of the point in the parametric space of one of the surface.

	:param U1:
	:type U1: float
	:param V1:
	:type V1: float
	:param U2:
	:type U2: float
	:param V2:
	:type V2: float
	:rtype: None
") SetValue;
		void SetValue (const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the point in 3d space.

	:rtype: gp_Pnt
") Value;
		const gp_Pnt  Value ();
		%feature("compactdefaultargs") ParametersOnS1;
		%feature("autodoc", "	* Returns the parameters of the point on the first surface.

	:param U1:
	:type U1: float &
	:param V1:
	:type V1: float &
	:rtype: None
") ParametersOnS1;
		void ParametersOnS1 (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") ParametersOnS2;
		%feature("autodoc", "	* Returns the parameters of the point on the second surface.

	:param U2:
	:type U2: float &
	:param V2:
	:type V2: float &
	:rtype: None
") ParametersOnS2;
		void ParametersOnS2 (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "	* Returns the parameters of the point on both surfaces.

	:param U1:
	:type U1: float &
	:param V1:
	:type V1: float &
	:param U2:
	:type U2: float &
	:param V2:
	:type V2: float &
	:rtype: None
") Parameters;
		void Parameters (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") IsSame;
		%feature("autodoc", "	* Returns True if 2D- and 3D-coordinates of theOterPoint are equal to corresponding coordinates of me (with given tolerance). If theTol2D == 0.0 we will compare 3D-points only.

	:param theOterPoint:
	:type theOterPoint: IntSurf_PntOn2S &
	:param theTol3D: default value is 0.0
	:type theTol3D: float
	:param theTol2D: default value is 0.0
	:type theTol2D: float
	:rtype: bool
") IsSame;
		Standard_Boolean IsSame (const IntSurf_PntOn2S & theOterPoint,const Standard_Real theTol3D = 0.0,const Standard_Real theTol2D = 0.0);
};


%extend IntSurf_PntOn2S {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntSurf_Quadric;
class IntSurf_Quadric {
	public:
		%feature("compactdefaultargs") IntSurf_Quadric;
		%feature("autodoc", "	:rtype: None
") IntSurf_Quadric;
		 IntSurf_Quadric ();
		%feature("compactdefaultargs") IntSurf_Quadric;
		%feature("autodoc", "	:param P:
	:type P: gp_Pln
	:rtype: None
") IntSurf_Quadric;
		 IntSurf_Quadric (const gp_Pln & P);
		%feature("compactdefaultargs") IntSurf_Quadric;
		%feature("autodoc", "	:param C:
	:type C: gp_Cylinder
	:rtype: None
") IntSurf_Quadric;
		 IntSurf_Quadric (const gp_Cylinder & C);
		%feature("compactdefaultargs") IntSurf_Quadric;
		%feature("autodoc", "	:param S:
	:type S: gp_Sphere
	:rtype: None
") IntSurf_Quadric;
		 IntSurf_Quadric (const gp_Sphere & S);
		%feature("compactdefaultargs") IntSurf_Quadric;
		%feature("autodoc", "	:param C:
	:type C: gp_Cone
	:rtype: None
") IntSurf_Quadric;
		 IntSurf_Quadric (const gp_Cone & C);
		%feature("compactdefaultargs") IntSurf_Quadric;
		%feature("autodoc", "	:param T:
	:type T: gp_Torus
	:rtype: None
") IntSurf_Quadric;
		 IntSurf_Quadric (const gp_Torus & T);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param P:
	:type P: gp_Pln
	:rtype: None
") SetValue;
		void SetValue (const gp_Pln & P);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param C:
	:type C: gp_Cylinder
	:rtype: None
") SetValue;
		void SetValue (const gp_Cylinder & C);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param S:
	:type S: gp_Sphere
	:rtype: None
") SetValue;
		void SetValue (const gp_Sphere & S);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param C:
	:type C: gp_Cone
	:rtype: None
") SetValue;
		void SetValue (const gp_Cone & C);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param T:
	:type T: gp_Torus
	:rtype: None
") SetValue;
		void SetValue (const gp_Torus & T);
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: float
") Distance;
		Standard_Real Distance (const gp_Pnt & P);
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: gp_Vec
") Gradient;
		gp_Vec Gradient (const gp_Pnt & P);
		%feature("compactdefaultargs") ValAndGrad;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param Dist:
	:type Dist: float &
	:param Grad:
	:type Grad: gp_Vec
	:rtype: None
") ValAndGrad;
		void ValAndGrad (const gp_Pnt & P,Standard_Real &OutValue,gp_Vec & Grad);
		%feature("compactdefaultargs") TypeQuadric;
		%feature("autodoc", "	:rtype: GeomAbs_SurfaceType
") TypeQuadric;
		GeomAbs_SurfaceType TypeQuadric ();
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "	:rtype: gp_Pln
") Plane;
		gp_Pln Plane ();
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", "	:rtype: gp_Sphere
") Sphere;
		gp_Sphere Sphere ();
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "	:rtype: gp_Cylinder
") Cylinder;
		gp_Cylinder Cylinder ();
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", "	:rtype: gp_Cone
") Cone;
		gp_Cone Cone ();
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", "	:rtype: gp_Torus
") Torus;
		gp_Torus Torus ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: gp_Pnt
") Value;
		gp_Pnt Value (const Standard_Real U,const Standard_Real V);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:param D1U:
	:type D1U: gp_Vec
	:param D1V:
	:type D1V: gp_Vec
	:rtype: None
") D1;
		void D1 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V);
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Nu:
	:type Nu: int
	:param Nv:
	:type Nv: int
	:rtype: gp_Vec
") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Real V,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("compactdefaultargs") Normale;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: gp_Vec
") Normale;
		gp_Vec Normale (const Standard_Real U,const Standard_Real V);
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param U:
	:type U: float &
	:param V:
	:type V: float &
	:rtype: None
") Parameters;
		void Parameters (const gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Normale;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: gp_Vec
") Normale;
		gp_Vec Normale (const gp_Pnt & P);
};


%extend IntSurf_Quadric {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class IntSurf_QuadricTool {
	public:
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the value of the function.

	:param Quad:
	:type Quad: IntSurf_Quadric &
	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:rtype: float
") Value;
		static Standard_Real Value (const IntSurf_Quadric & Quad,const Standard_Real X,const Standard_Real Y,const Standard_Real Z);
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "	* Returns the gradient of the function.

	:param Quad:
	:type Quad: IntSurf_Quadric &
	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:param V:
	:type V: gp_Vec
	:rtype: void
") Gradient;
		static void Gradient (const IntSurf_Quadric & Quad,const Standard_Real X,const Standard_Real Y,const Standard_Real Z,gp_Vec & V);
		%feature("compactdefaultargs") ValueAndGradient;
		%feature("autodoc", "	* Returns the value and the gradient.

	:param Quad:
	:type Quad: IntSurf_Quadric &
	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:param Val:
	:type Val: float &
	:param Grad:
	:type Grad: gp_Vec
	:rtype: void
") ValueAndGradient;
		static void ValueAndGradient (const IntSurf_Quadric & Quad,const Standard_Real X,const Standard_Real Y,const Standard_Real Z,Standard_Real &OutValue,gp_Vec & Grad);
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "	* returns the tolerance of the zero of the implicit function

	:param Quad:
	:type Quad: IntSurf_Quadric &
	:rtype: float
") Tolerance;
		static Standard_Real Tolerance (const IntSurf_Quadric & Quad);
};


%extend IntSurf_QuadricTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntSurf_SequenceNodeOfSequenceOfCouple;
class IntSurf_SequenceNodeOfSequenceOfCouple : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") IntSurf_SequenceNodeOfSequenceOfCouple;
		%feature("autodoc", "	:param I:
	:type I: IntSurf_Couple &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") IntSurf_SequenceNodeOfSequenceOfCouple;
		 IntSurf_SequenceNodeOfSequenceOfCouple (const IntSurf_Couple & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: IntSurf_Couple
") Value;
		IntSurf_Couple & Value ();
};


%extend IntSurf_SequenceNodeOfSequenceOfCouple {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IntSurf_SequenceNodeOfSequenceOfCouple(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IntSurf_SequenceNodeOfSequenceOfCouple::Handle_IntSurf_SequenceNodeOfSequenceOfCouple %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IntSurf_SequenceNodeOfSequenceOfCouple;
class Handle_IntSurf_SequenceNodeOfSequenceOfCouple : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_IntSurf_SequenceNodeOfSequenceOfCouple();
        Handle_IntSurf_SequenceNodeOfSequenceOfCouple(const Handle_IntSurf_SequenceNodeOfSequenceOfCouple &aHandle);
        Handle_IntSurf_SequenceNodeOfSequenceOfCouple(const IntSurf_SequenceNodeOfSequenceOfCouple *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntSurf_SequenceNodeOfSequenceOfCouple DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntSurf_SequenceNodeOfSequenceOfCouple {
    IntSurf_SequenceNodeOfSequenceOfCouple* _get_reference() {
    return (IntSurf_SequenceNodeOfSequenceOfCouple*)$self->Access();
    }
};

%extend Handle_IntSurf_SequenceNodeOfSequenceOfCouple {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IntSurf_SequenceNodeOfSequenceOfCouple {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntSurf_SequenceNodeOfSequenceOfInteriorPoint;
class IntSurf_SequenceNodeOfSequenceOfInteriorPoint : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") IntSurf_SequenceNodeOfSequenceOfInteriorPoint;
		%feature("autodoc", "	:param I:
	:type I: IntSurf_InteriorPoint &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") IntSurf_SequenceNodeOfSequenceOfInteriorPoint;
		 IntSurf_SequenceNodeOfSequenceOfInteriorPoint (const IntSurf_InteriorPoint & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: IntSurf_InteriorPoint
") Value;
		IntSurf_InteriorPoint & Value ();
};


%extend IntSurf_SequenceNodeOfSequenceOfInteriorPoint {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IntSurf_SequenceNodeOfSequenceOfInteriorPoint(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IntSurf_SequenceNodeOfSequenceOfInteriorPoint::Handle_IntSurf_SequenceNodeOfSequenceOfInteriorPoint %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IntSurf_SequenceNodeOfSequenceOfInteriorPoint;
class Handle_IntSurf_SequenceNodeOfSequenceOfInteriorPoint : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_IntSurf_SequenceNodeOfSequenceOfInteriorPoint();
        Handle_IntSurf_SequenceNodeOfSequenceOfInteriorPoint(const Handle_IntSurf_SequenceNodeOfSequenceOfInteriorPoint &aHandle);
        Handle_IntSurf_SequenceNodeOfSequenceOfInteriorPoint(const IntSurf_SequenceNodeOfSequenceOfInteriorPoint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntSurf_SequenceNodeOfSequenceOfInteriorPoint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntSurf_SequenceNodeOfSequenceOfInteriorPoint {
    IntSurf_SequenceNodeOfSequenceOfInteriorPoint* _get_reference() {
    return (IntSurf_SequenceNodeOfSequenceOfInteriorPoint*)$self->Access();
    }
};

%extend Handle_IntSurf_SequenceNodeOfSequenceOfInteriorPoint {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IntSurf_SequenceNodeOfSequenceOfInteriorPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntSurf_SequenceNodeOfSequenceOfPathPoint;
class IntSurf_SequenceNodeOfSequenceOfPathPoint : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") IntSurf_SequenceNodeOfSequenceOfPathPoint;
		%feature("autodoc", "	:param I:
	:type I: IntSurf_PathPoint &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") IntSurf_SequenceNodeOfSequenceOfPathPoint;
		 IntSurf_SequenceNodeOfSequenceOfPathPoint (const IntSurf_PathPoint & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: IntSurf_PathPoint
") Value;
		IntSurf_PathPoint & Value ();
};


%extend IntSurf_SequenceNodeOfSequenceOfPathPoint {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IntSurf_SequenceNodeOfSequenceOfPathPoint(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IntSurf_SequenceNodeOfSequenceOfPathPoint::Handle_IntSurf_SequenceNodeOfSequenceOfPathPoint %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IntSurf_SequenceNodeOfSequenceOfPathPoint;
class Handle_IntSurf_SequenceNodeOfSequenceOfPathPoint : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_IntSurf_SequenceNodeOfSequenceOfPathPoint();
        Handle_IntSurf_SequenceNodeOfSequenceOfPathPoint(const Handle_IntSurf_SequenceNodeOfSequenceOfPathPoint &aHandle);
        Handle_IntSurf_SequenceNodeOfSequenceOfPathPoint(const IntSurf_SequenceNodeOfSequenceOfPathPoint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntSurf_SequenceNodeOfSequenceOfPathPoint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntSurf_SequenceNodeOfSequenceOfPathPoint {
    IntSurf_SequenceNodeOfSequenceOfPathPoint* _get_reference() {
    return (IntSurf_SequenceNodeOfSequenceOfPathPoint*)$self->Access();
    }
};

%extend Handle_IntSurf_SequenceNodeOfSequenceOfPathPoint {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IntSurf_SequenceNodeOfSequenceOfPathPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntSurf_SequenceOfCouple;
class IntSurf_SequenceOfCouple : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") IntSurf_SequenceOfCouple;
		%feature("autodoc", "	:rtype: None
") IntSurf_SequenceOfCouple;
		 IntSurf_SequenceOfCouple ();
		%feature("compactdefaultargs") IntSurf_SequenceOfCouple;
		%feature("autodoc", "	:param Other:
	:type Other: IntSurf_SequenceOfCouple &
	:rtype: None
") IntSurf_SequenceOfCouple;
		 IntSurf_SequenceOfCouple (const IntSurf_SequenceOfCouple & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: IntSurf_SequenceOfCouple &
	:rtype: IntSurf_SequenceOfCouple
") Assign;
		const IntSurf_SequenceOfCouple & Assign (const IntSurf_SequenceOfCouple & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: IntSurf_SequenceOfCouple &
	:rtype: IntSurf_SequenceOfCouple
") operator =;
		const IntSurf_SequenceOfCouple & operator = (const IntSurf_SequenceOfCouple & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: IntSurf_Couple &
	:rtype: None
") Append;
		void Append (const IntSurf_Couple & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: IntSurf_SequenceOfCouple &
	:rtype: None
") Append;
		void Append (IntSurf_SequenceOfCouple & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: IntSurf_Couple &
	:rtype: None
") Prepend;
		void Prepend (const IntSurf_Couple & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: IntSurf_SequenceOfCouple &
	:rtype: None
") Prepend;
		void Prepend (IntSurf_SequenceOfCouple & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: IntSurf_Couple &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const IntSurf_Couple & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: IntSurf_SequenceOfCouple &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,IntSurf_SequenceOfCouple & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: IntSurf_Couple &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const IntSurf_Couple & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: IntSurf_SequenceOfCouple &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,IntSurf_SequenceOfCouple & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: IntSurf_Couple
") First;
		const IntSurf_Couple & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: IntSurf_Couple
") Last;
		const IntSurf_Couple & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: IntSurf_SequenceOfCouple &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,IntSurf_SequenceOfCouple & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: IntSurf_Couple
") Value;
		const IntSurf_Couple & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: IntSurf_Couple &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const IntSurf_Couple & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: IntSurf_Couple
") ChangeValue;
		IntSurf_Couple & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend IntSurf_SequenceOfCouple {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntSurf_SequenceOfInteriorPoint;
class IntSurf_SequenceOfInteriorPoint : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") IntSurf_SequenceOfInteriorPoint;
		%feature("autodoc", "	:rtype: None
") IntSurf_SequenceOfInteriorPoint;
		 IntSurf_SequenceOfInteriorPoint ();
		%feature("compactdefaultargs") IntSurf_SequenceOfInteriorPoint;
		%feature("autodoc", "	:param Other:
	:type Other: IntSurf_SequenceOfInteriorPoint &
	:rtype: None
") IntSurf_SequenceOfInteriorPoint;
		 IntSurf_SequenceOfInteriorPoint (const IntSurf_SequenceOfInteriorPoint & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: IntSurf_SequenceOfInteriorPoint &
	:rtype: IntSurf_SequenceOfInteriorPoint
") Assign;
		const IntSurf_SequenceOfInteriorPoint & Assign (const IntSurf_SequenceOfInteriorPoint & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: IntSurf_SequenceOfInteriorPoint &
	:rtype: IntSurf_SequenceOfInteriorPoint
") operator =;
		const IntSurf_SequenceOfInteriorPoint & operator = (const IntSurf_SequenceOfInteriorPoint & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: IntSurf_InteriorPoint &
	:rtype: None
") Append;
		void Append (const IntSurf_InteriorPoint & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: IntSurf_SequenceOfInteriorPoint &
	:rtype: None
") Append;
		void Append (IntSurf_SequenceOfInteriorPoint & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: IntSurf_InteriorPoint &
	:rtype: None
") Prepend;
		void Prepend (const IntSurf_InteriorPoint & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: IntSurf_SequenceOfInteriorPoint &
	:rtype: None
") Prepend;
		void Prepend (IntSurf_SequenceOfInteriorPoint & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: IntSurf_InteriorPoint &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const IntSurf_InteriorPoint & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: IntSurf_SequenceOfInteriorPoint &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,IntSurf_SequenceOfInteriorPoint & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: IntSurf_InteriorPoint &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const IntSurf_InteriorPoint & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: IntSurf_SequenceOfInteriorPoint &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,IntSurf_SequenceOfInteriorPoint & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: IntSurf_InteriorPoint
") First;
		const IntSurf_InteriorPoint & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: IntSurf_InteriorPoint
") Last;
		const IntSurf_InteriorPoint & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: IntSurf_SequenceOfInteriorPoint &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,IntSurf_SequenceOfInteriorPoint & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: IntSurf_InteriorPoint
") Value;
		const IntSurf_InteriorPoint & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: IntSurf_InteriorPoint &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const IntSurf_InteriorPoint & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: IntSurf_InteriorPoint
") ChangeValue;
		IntSurf_InteriorPoint & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend IntSurf_SequenceOfInteriorPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntSurf_SequenceOfPathPoint;
class IntSurf_SequenceOfPathPoint : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") IntSurf_SequenceOfPathPoint;
		%feature("autodoc", "	:rtype: None
") IntSurf_SequenceOfPathPoint;
		 IntSurf_SequenceOfPathPoint ();
		%feature("compactdefaultargs") IntSurf_SequenceOfPathPoint;
		%feature("autodoc", "	:param Other:
	:type Other: IntSurf_SequenceOfPathPoint &
	:rtype: None
") IntSurf_SequenceOfPathPoint;
		 IntSurf_SequenceOfPathPoint (const IntSurf_SequenceOfPathPoint & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: IntSurf_SequenceOfPathPoint &
	:rtype: IntSurf_SequenceOfPathPoint
") Assign;
		const IntSurf_SequenceOfPathPoint & Assign (const IntSurf_SequenceOfPathPoint & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: IntSurf_SequenceOfPathPoint &
	:rtype: IntSurf_SequenceOfPathPoint
") operator =;
		const IntSurf_SequenceOfPathPoint & operator = (const IntSurf_SequenceOfPathPoint & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: IntSurf_PathPoint &
	:rtype: None
") Append;
		void Append (const IntSurf_PathPoint & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: IntSurf_SequenceOfPathPoint &
	:rtype: None
") Append;
		void Append (IntSurf_SequenceOfPathPoint & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: IntSurf_PathPoint &
	:rtype: None
") Prepend;
		void Prepend (const IntSurf_PathPoint & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: IntSurf_SequenceOfPathPoint &
	:rtype: None
") Prepend;
		void Prepend (IntSurf_SequenceOfPathPoint & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: IntSurf_PathPoint &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const IntSurf_PathPoint & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: IntSurf_SequenceOfPathPoint &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,IntSurf_SequenceOfPathPoint & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: IntSurf_PathPoint &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const IntSurf_PathPoint & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: IntSurf_SequenceOfPathPoint &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,IntSurf_SequenceOfPathPoint & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: IntSurf_PathPoint
") First;
		const IntSurf_PathPoint & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: IntSurf_PathPoint
") Last;
		const IntSurf_PathPoint & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: IntSurf_SequenceOfPathPoint &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,IntSurf_SequenceOfPathPoint & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: IntSurf_PathPoint
") Value;
		const IntSurf_PathPoint & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: IntSurf_PathPoint &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const IntSurf_PathPoint & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: IntSurf_PathPoint
") ChangeValue;
		IntSurf_PathPoint & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend IntSurf_SequenceOfPathPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntSurf_Transition;
class IntSurf_Transition {
	public:
		%feature("compactdefaultargs") IntSurf_Transition;
		%feature("autodoc", "	* Empty constructor. Creates an UNDECIDED transition.

	:rtype: None
") IntSurf_Transition;
		 IntSurf_Transition ();
		%feature("compactdefaultargs") IntSurf_Transition;
		%feature("autodoc", "	* Create a IN or OUT transition

	:param Tangent:
	:type Tangent: bool
	:param Type:
	:type Type: IntSurf_TypeTrans
	:rtype: None
") IntSurf_Transition;
		 IntSurf_Transition (const Standard_Boolean Tangent,const IntSurf_TypeTrans Type);
		%feature("compactdefaultargs") IntSurf_Transition;
		%feature("autodoc", "	* Create a TOUCH transition.

	:param Tangent:
	:type Tangent: bool
	:param Situ:
	:type Situ: IntSurf_Situation
	:param Oppos:
	:type Oppos: bool
	:rtype: None
") IntSurf_Transition;
		 IntSurf_Transition (const Standard_Boolean Tangent,const IntSurf_Situation Situ,const Standard_Boolean Oppos);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Set the values of an IN or OUT transition.

	:param Tangent:
	:type Tangent: bool
	:param Type:
	:type Type: IntSurf_TypeTrans
	:rtype: None
") SetValue;
		void SetValue (const Standard_Boolean Tangent,const IntSurf_TypeTrans Type);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Set the values of a TOUCH transition.

	:param Tangent:
	:type Tangent: bool
	:param Situ:
	:type Situ: IntSurf_Situation
	:param Oppos:
	:type Oppos: bool
	:rtype: None
") SetValue;
		void SetValue (const Standard_Boolean Tangent,const IntSurf_Situation Situ,const Standard_Boolean Oppos);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Set the values of an UNDECIDED transition.

	:rtype: None
") SetValue;
		void SetValue ();
		%feature("compactdefaultargs") TransitionType;
		%feature("autodoc", "	* Returns the type of Transition (in/out/touch/undecided) for the arc given by value. This the transition of the intersection line compared to the Arc of restriction, i-e when the function returns INSIDE for example, it means that the intersection line goes inside the part of plane limited by the arc of restriction.

	:rtype: IntSurf_TypeTrans
") TransitionType;
		IntSurf_TypeTrans TransitionType ();
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "	* Returns True if the point is tangent to the arc given by Value. An exception is raised if TransitionType returns UNDECIDED.

	:rtype: bool
") IsTangent;
		Standard_Boolean IsTangent ();
		%feature("compactdefaultargs") Situation;
		%feature("autodoc", "	* Returns a significant value if TransitionType returns TOUCH. In this case, the function returns : INSIDE when the intersection line remains inside the Arc, OUTSIDE when it remains outside the Arc, UNKNOWN when the calsulus cannot give results. If TransitionType returns IN, or OUT, or UNDECIDED, a exception is raised.

	:rtype: IntSurf_Situation
") Situation;
		IntSurf_Situation Situation ();
		%feature("compactdefaultargs") IsOpposite;
		%feature("autodoc", "	* returns a significant value if TransitionType returns TOUCH. In this case, the function returns true when the 2 curves locally define two different parts of the space. If TransitionType returns IN or OUT or UNDECIDED, an exception is raised.

	:rtype: bool
") IsOpposite;
		Standard_Boolean IsOpposite ();
};


%extend IntSurf_Transition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
