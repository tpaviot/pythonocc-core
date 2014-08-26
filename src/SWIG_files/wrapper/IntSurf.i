/*
Copyright 2008-2014 Thomas Paviot (tpaviot@gmail.com)


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
%module IntSurf

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/StandardDefines.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i

%include IntSurf_required_python_modules.i
%include IntSurf_headers.i

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
%nodefaultctor IntSurf;
class IntSurf {
	public:
		%feature("autodoc", "Args:
	TgFirst(gp_Vec)
	TgSecond(gp_Vec)
	Normal(gp_Dir)
	TFirst(IntSurf_Transition)
	TSecond(IntSurf_Transition)

Returns:
	static void

Computes the transition of the intersection point  
         between the two lines.  
         TgFirst is the tangent vector of the first line.  
         TgSecond is the tangent vector of the second line.  
         Normal is the direction used to orientate the cross  
         product TgFirst^TgSecond.  
         TFirst is the transition of the point on the first line.  
         TSecond is the transition of the point on the second line.") MakeTransition;
		static void MakeTransition (const gp_Vec & TgFirst,const gp_Vec & TgSecond,const gp_Dir & Normal,IntSurf_Transition & TFirst,IntSurf_Transition & TSecond);
};


%feature("shadow") IntSurf::~IntSurf %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntSurf {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntSurf_Couple;
class IntSurf_Couple {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntSurf_Couple;
		 IntSurf_Couple ();
		%feature("autodoc", "Args:
	Index1(Standard_Integer)
	Index2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") IntSurf_Couple;
		 IntSurf_Couple (const Standard_Integer Index1,const Standard_Integer Index2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

returns the first element") First;
		Standard_Integer First ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

returns the Second element") Second;
		Standard_Integer Second ();
};


%feature("shadow") IntSurf_Couple::~IntSurf_Couple %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntSurf_Couple {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntSurf_InteriorPoint;
class IntSurf_InteriorPoint {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntSurf_InteriorPoint;
		 IntSurf_InteriorPoint ();
		%feature("autodoc", "Args:
	P(gp_Pnt)
	U(Standard_Real)
	V(Standard_Real)
	Direc(gp_Vec)
	Direc2d(gp_Vec2d)

Returns:
	None

No detailed docstring for this function.") IntSurf_InteriorPoint;
		 IntSurf_InteriorPoint (const gp_Pnt & P,const Standard_Real U,const Standard_Real V,const gp_Vec & Direc,const gp_Vec2d & Direc2d);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	U(Standard_Real)
	V(Standard_Real)
	Direc(gp_Vec)
	Direc2d(gp_Vec2d)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const gp_Pnt & P,const Standard_Real U,const Standard_Real V,const gp_Vec & Direc,const gp_Vec2d & Direc2d);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the 3d coordinates of the interior point.") Value;
		const gp_Pnt & Value ();
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)

Returns:
	None

Returns the parameters of the interior point on the  
         parametric surface.") Parameters;
		void Parameters (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the first parameter of the interior point on the  
         parametric surface.") UParameter;
		Standard_Real UParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the second parameter of the interior point on the  
         parametric surface.") VParameter;
		Standard_Real VParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec

Returns the tangent at the intersection in 3d space  
         associated to the interior point.") Direction;
		const gp_Vec & Direction ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec2d

Returns the tangent at the intersection in the parametric  
         space of the parametric surface.") Direction2d;
		const gp_Vec2d & Direction2d ();
};


%feature("shadow") IntSurf_InteriorPoint::~IntSurf_InteriorPoint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntSurf_InteriorPoint {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntSurf_InteriorPointTool;
class IntSurf_InteriorPointTool {
	public:
		%feature("autodoc", "Args:
	PStart(IntSurf_InteriorPoint)

Returns:
	static gp_Pnt

Returns the 3d coordinates of the starting point.") Value3d;
		static gp_Pnt Value3d (const IntSurf_InteriorPoint & PStart);
		%feature("autodoc", "Args:
	PStart(IntSurf_InteriorPoint)
	U(Standard_Real)
	V(Standard_Real)

Returns:
	static void

Returns the <U,V> parameters which are associated  
         with <P>  
         it's the parameters which start the marching algorithm") Value2d;
		static void Value2d (const IntSurf_InteriorPoint & PStart,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	PStart(IntSurf_InteriorPoint)

Returns:
	static gp_Vec

returns the tangent at the intersectin in 3d space  
         associated to <P>") Direction3d;
		static gp_Vec Direction3d (const IntSurf_InteriorPoint & PStart);
		%feature("autodoc", "Args:
	PStart(IntSurf_InteriorPoint)

Returns:
	static gp_Dir2d

returns the tangent at the intersectin in the  
         parametric space of the parametrized surface.This tangent  
         is associated to the value2d") Direction2d;
		static gp_Dir2d Direction2d (const IntSurf_InteriorPoint & PStart);
};


%feature("shadow") IntSurf_InteriorPointTool::~IntSurf_InteriorPointTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntSurf_InteriorPointTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntSurf_LineOn2S;
class IntSurf_LineOn2S : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	theAllocator(IntSurf_Allocator)=0

Returns:
	None

No detailed docstring for this function.") IntSurf_LineOn2S;
		 IntSurf_LineOn2S (const IntSurf_Allocator & theAllocator = 0);
		%feature("autodoc", "Args:
	P(IntSurf_PntOn2S)

Returns:
	None

Adds a point in the line.") Add;
		void Add (const IntSurf_PntOn2S & P);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of points in the line.") NbPoints;
		Standard_Integer NbPoints ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	IntSurf_PntOn2S

Returns the point of range Index in the line.") Value;
		const IntSurf_PntOn2S & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	None

Reverses the order of points of the line.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_IntSurf_LineOn2S

Keeps in <self> the points 1 to Index-1, and returns  
         the items Index to the end.") Split;
		Handle_IntSurf_LineOn2S Split (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	P(IntSurf_PntOn2S)

Returns:
	None

Replaces the point of range Index in the line.") Value;
		void Value (const Standard_Integer Index,const IntSurf_PntOn2S & P);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	OnFirst(Standard_Boolean)
	U(Standard_Real)
	V(Standard_Real)

Returns:
	None

Sets the parametric coordinates on one of the surfaces  
         of the point of range Index in the line.") SetUV;
		void SetUV (const Standard_Integer Index,const Standard_Boolean OnFirst,const Standard_Real U,const Standard_Real V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	I(Standard_Integer)
	P(IntSurf_PntOn2S)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer I,const IntSurf_PntOn2S & P);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") RemovePoint;
		void RemovePoint (const Standard_Integer I);
};


%feature("shadow") IntSurf_LineOn2S::~IntSurf_LineOn2S %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntSurf_LineOn2S {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IntSurf_LineOn2S {
	Handle_IntSurf_LineOn2S GetHandle() {
	return *(Handle_IntSurf_LineOn2S*) &$self;
	}
};

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
    IntSurf_LineOn2S* GetObject() {
    return (IntSurf_LineOn2S*)$self->Access();
    }
};
%feature("shadow") Handle_IntSurf_LineOn2S::~Handle_IntSurf_LineOn2S %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IntSurf_LineOn2S {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IntSurf_ListIteratorOfListOfPntOn2S;
class IntSurf_ListIteratorOfListOfPntOn2S {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntSurf_ListIteratorOfListOfPntOn2S;
		 IntSurf_ListIteratorOfListOfPntOn2S ();
		%feature("autodoc", "Args:
	L(IntSurf_ListOfPntOn2S)

Returns:
	None

No detailed docstring for this function.") IntSurf_ListIteratorOfListOfPntOn2S;
		 IntSurf_ListIteratorOfListOfPntOn2S (const IntSurf_ListOfPntOn2S & L);
		%feature("autodoc", "Args:
	L(IntSurf_ListOfPntOn2S)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const IntSurf_ListOfPntOn2S & L);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	IntSurf_PntOn2S

No detailed docstring for this function.") Value;
		IntSurf_PntOn2S & Value ();
};


%feature("shadow") IntSurf_ListIteratorOfListOfPntOn2S::~IntSurf_ListIteratorOfListOfPntOn2S %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntSurf_ListIteratorOfListOfPntOn2S {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntSurf_ListNodeOfListOfPntOn2S;
class IntSurf_ListNodeOfListOfPntOn2S : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	I(IntSurf_PntOn2S)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") IntSurf_ListNodeOfListOfPntOn2S;
		 IntSurf_ListNodeOfListOfPntOn2S (const IntSurf_PntOn2S & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	IntSurf_PntOn2S

No detailed docstring for this function.") Value;
		IntSurf_PntOn2S & Value ();
};


%feature("shadow") IntSurf_ListNodeOfListOfPntOn2S::~IntSurf_ListNodeOfListOfPntOn2S %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntSurf_ListNodeOfListOfPntOn2S {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IntSurf_ListNodeOfListOfPntOn2S {
	Handle_IntSurf_ListNodeOfListOfPntOn2S GetHandle() {
	return *(Handle_IntSurf_ListNodeOfListOfPntOn2S*) &$self;
	}
};

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
    IntSurf_ListNodeOfListOfPntOn2S* GetObject() {
    return (IntSurf_ListNodeOfListOfPntOn2S*)$self->Access();
    }
};
%feature("shadow") Handle_IntSurf_ListNodeOfListOfPntOn2S::~Handle_IntSurf_ListNodeOfListOfPntOn2S %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IntSurf_ListNodeOfListOfPntOn2S {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IntSurf_ListOfPntOn2S;
class IntSurf_ListOfPntOn2S {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntSurf_ListOfPntOn2S;
		 IntSurf_ListOfPntOn2S ();
		%feature("autodoc", "Args:
	Other(IntSurf_ListOfPntOn2S)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const IntSurf_ListOfPntOn2S & Other);
		%feature("autodoc", "Args:
	Other(IntSurf_ListOfPntOn2S)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const IntSurf_ListOfPntOn2S & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	I(IntSurf_PntOn2S)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const IntSurf_PntOn2S & I);
		%feature("autodoc", "Args:
	I(IntSurf_PntOn2S)
	theIt(IntSurf_ListIteratorOfListOfPntOn2S)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const IntSurf_PntOn2S & I,IntSurf_ListIteratorOfListOfPntOn2S & theIt);
		%feature("autodoc", "Args:
	Other(IntSurf_ListOfPntOn2S)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (IntSurf_ListOfPntOn2S & Other);
		%feature("autodoc", "Args:
	I(IntSurf_PntOn2S)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const IntSurf_PntOn2S & I);
		%feature("autodoc", "Args:
	I(IntSurf_PntOn2S)
	theIt(IntSurf_ListIteratorOfListOfPntOn2S)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const IntSurf_PntOn2S & I,IntSurf_ListIteratorOfListOfPntOn2S & theIt);
		%feature("autodoc", "Args:
	Other(IntSurf_ListOfPntOn2S)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (IntSurf_ListOfPntOn2S & Other);
		%feature("autodoc", "Args:
	None
Returns:
	IntSurf_PntOn2S

No detailed docstring for this function.") First;
		IntSurf_PntOn2S & First ();
		%feature("autodoc", "Args:
	None
Returns:
	IntSurf_PntOn2S

No detailed docstring for this function.") Last;
		IntSurf_PntOn2S & Last ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(IntSurf_ListIteratorOfListOfPntOn2S)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (IntSurf_ListIteratorOfListOfPntOn2S & It);
		%feature("autodoc", "Args:
	I(IntSurf_PntOn2S)
	It(IntSurf_ListIteratorOfListOfPntOn2S)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const IntSurf_PntOn2S & I,IntSurf_ListIteratorOfListOfPntOn2S & It);
		%feature("autodoc", "Args:
	Other(IntSurf_ListOfPntOn2S)
	It(IntSurf_ListIteratorOfListOfPntOn2S)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (IntSurf_ListOfPntOn2S & Other,IntSurf_ListIteratorOfListOfPntOn2S & It);
		%feature("autodoc", "Args:
	I(IntSurf_PntOn2S)
	It(IntSurf_ListIteratorOfListOfPntOn2S)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const IntSurf_PntOn2S & I,IntSurf_ListIteratorOfListOfPntOn2S & It);
		%feature("autodoc", "Args:
	Other(IntSurf_ListOfPntOn2S)
	It(IntSurf_ListIteratorOfListOfPntOn2S)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (IntSurf_ListOfPntOn2S & Other,IntSurf_ListIteratorOfListOfPntOn2S & It);
};


%feature("shadow") IntSurf_ListOfPntOn2S::~IntSurf_ListOfPntOn2S %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntSurf_ListOfPntOn2S {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntSurf_PathPoint;
class IntSurf_PathPoint {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntSurf_PathPoint;
		 IntSurf_PathPoint ();
		%feature("autodoc", "Args:
	P(gp_Pnt)
	U(Standard_Real)
	V(Standard_Real)

Returns:
	None

No detailed docstring for this function.") IntSurf_PathPoint;
		 IntSurf_PathPoint (const gp_Pnt & P,const Standard_Real U,const Standard_Real V);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	U(Standard_Real)
	V(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const gp_Pnt & P,const Standard_Real U,const Standard_Real V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)

Returns:
	None

No detailed docstring for this function.") AddUV;
		void AddUV (const Standard_Real U,const Standard_Real V);
		%feature("autodoc", "Args:
	V(gp_Vec)
	D(gp_Dir2d)

Returns:
	None

No detailed docstring for this function.") SetDirections;
		void SetDirections (const gp_Vec & V,const gp_Dir2d & D);
		%feature("autodoc", "Args:
	Tang(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetTangency;
		void SetTangency (const Standard_Boolean Tang);
		%feature("autodoc", "Args:
	Pass(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetPassing;
		void SetPassing (const Standard_Boolean Pass);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

No detailed docstring for this function.") Value;
		const gp_Pnt & Value ();
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Value2d;
		void Value2d (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsPassingPnt;
		Standard_Boolean IsPassingPnt ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsTangent;
		Standard_Boolean IsTangent ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec

No detailed docstring for this function.") Direction3d;
		const gp_Vec & Direction3d ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir2d

No detailed docstring for this function.") Direction2d;
		const gp_Dir2d & Direction2d ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Multiplicity;
		Standard_Integer Multiplicity ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	U(Standard_Real)
	V(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Parameters;
		void Parameters (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") IntSurf_PathPoint::~IntSurf_PathPoint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntSurf_PathPoint {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntSurf_PathPointTool;
class IntSurf_PathPointTool {
	public:
		%feature("autodoc", "Args:
	PStart(IntSurf_PathPoint)

Returns:
	static gp_Pnt

Returns the 3d coordinates of the starting point.") Value3d;
		static gp_Pnt Value3d (const IntSurf_PathPoint & PStart);
		%feature("autodoc", "Args:
	PStart(IntSurf_PathPoint)
	U(Standard_Real)
	V(Standard_Real)

Returns:
	static void

Returns the <U, V> parameters which are associated  
         with <P>  
         it's the parameters which start the marching algorithm") Value2d;
		static void Value2d (const IntSurf_PathPoint & PStart,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	PStart(IntSurf_PathPoint)

Returns:
	static Standard_Boolean

Returns True if the point is a point on a non-oriented  
         arc, which means that the intersection line does not  
         stop at such a point but just go through such a point.  
         IsPassingPnt is True when IsOnArc is True") IsPassingPnt;
		static Standard_Boolean IsPassingPnt (const IntSurf_PathPoint & PStart);
		%feature("autodoc", "Args:
	PStart(IntSurf_PathPoint)

Returns:
	static Standard_Boolean

Returns True if the surfaces are tangent at this point.  
         IsTangent can be True when IsOnArc is True  
         if IsPassingPnt is True and IsTangent is True,this point  
         is a stopped point.") IsTangent;
		static Standard_Boolean IsTangent (const IntSurf_PathPoint & PStart);
		%feature("autodoc", "Args:
	PStart(IntSurf_PathPoint)

Returns:
	static gp_Vec

returns the tangent at the intersection in 3d space  
         associated to <P>  
        an exception is raised if IsTangent is true.") Direction3d;
		static gp_Vec Direction3d (const IntSurf_PathPoint & PStart);
		%feature("autodoc", "Args:
	PStart(IntSurf_PathPoint)

Returns:
	static gp_Dir2d

returns the tangent at the intersection in the  
         parametric space of the parametrized surface.This tangent  
         is associated to the value2d  
         la tangente a un sens signifiant (indique le sens de chemin  
         ement)  
         an exception is raised if IsTangent is true.") Direction2d;
		static gp_Dir2d Direction2d (const IntSurf_PathPoint & PStart);
		%feature("autodoc", "Args:
	PStart(IntSurf_PathPoint)

Returns:
	static Standard_Integer

Returns the multiplicity of the point i-e  
         the number of auxillar parameters associated to the  
         point which the principal parameters are given by Value2d") Multiplicity;
		static Standard_Integer Multiplicity (const IntSurf_PathPoint & PStart);
		%feature("autodoc", "Args:
	PStart(IntSurf_PathPoint)
	Mult(Standard_Integer)
	U(Standard_Real)
	V(Standard_Real)

Returns:
	static void

Parametric coordinates associated to the multiplicity.  
         An exception is raised if Mult<=0 or Mult>multiplicity.") Parameters;
		static void Parameters (const IntSurf_PathPoint & PStart,const Standard_Integer Mult,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") IntSurf_PathPointTool::~IntSurf_PathPointTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntSurf_PathPointTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntSurf_PntOn2S;
class IntSurf_PntOn2S {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor.") IntSurf_PntOn2S;
		 IntSurf_PntOn2S ();
		%feature("autodoc", "Args:
	Pt(gp_Pnt)

Returns:
	None

Sets the value of the point in 3d space.") SetValue;
		void SetValue (const gp_Pnt & Pt);
		%feature("autodoc", "Args:
	Pt(gp_Pnt)
	OnFirst(Standard_Boolean)
	U(Standard_Real)
	V(Standard_Real)

Returns:
	None

Sets the values of the point in 3d space, and  
         in the parametric space of one of the surface.") SetValue;
		void SetValue (const gp_Pnt & Pt,const Standard_Boolean OnFirst,const Standard_Real U,const Standard_Real V);
		%feature("autodoc", "Args:
	Pt(gp_Pnt)
	U1(Standard_Real)
	V1(Standard_Real)
	U2(Standard_Real)
	V2(Standard_Real)

Returns:
	None

Sets the values of the point in 3d space, and  
         in the parametric space of each surface.") SetValue;
		void SetValue (const gp_Pnt & Pt,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2);
		%feature("autodoc", "Args:
	OnFirst(Standard_Boolean)
	U(Standard_Real)
	V(Standard_Real)

Returns:
	None

Set the values of the point in the parametric  
         space of one of the surface.") SetValue;
		void SetValue (const Standard_Boolean OnFirst,const Standard_Real U,const Standard_Real V);
		%feature("autodoc", "Args:
	U1(Standard_Real)
	V1(Standard_Real)
	U2(Standard_Real)
	V2(Standard_Real)

Returns:
	None

Set the values of the point in the parametric  
         space of one of the surface.") SetValue;
		void SetValue (const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the point in 3d space.") Value;
		const gp_Pnt & Value ();
		%feature("autodoc", "Args:
	U1(Standard_Real)
	V1(Standard_Real)

Returns:
	None

Returns the parameters of the point on the first surface.") ParametersOnS1;
		void ParametersOnS1 (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	U2(Standard_Real)
	V2(Standard_Real)

Returns:
	None

Returns the parameters of the point on the second surface.") ParametersOnS2;
		void ParametersOnS2 (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	U1(Standard_Real)
	V1(Standard_Real)
	U2(Standard_Real)
	V2(Standard_Real)

Returns:
	None

Returns the parameters of the point on both surfaces.") Parameters;
		void Parameters (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") IntSurf_PntOn2S::~IntSurf_PntOn2S %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntSurf_PntOn2S {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntSurf_Quadric;
class IntSurf_Quadric {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntSurf_Quadric;
		 IntSurf_Quadric ();
		%feature("autodoc", "Args:
	P(gp_Pln)

Returns:
	None

No detailed docstring for this function.") IntSurf_Quadric;
		 IntSurf_Quadric (const gp_Pln & P);
		%feature("autodoc", "Args:
	C(gp_Cylinder)

Returns:
	None

No detailed docstring for this function.") IntSurf_Quadric;
		 IntSurf_Quadric (const gp_Cylinder & C);
		%feature("autodoc", "Args:
	S(gp_Sphere)

Returns:
	None

No detailed docstring for this function.") IntSurf_Quadric;
		 IntSurf_Quadric (const gp_Sphere & S);
		%feature("autodoc", "Args:
	C(gp_Cone)

Returns:
	None

No detailed docstring for this function.") IntSurf_Quadric;
		 IntSurf_Quadric (const gp_Cone & C);
		%feature("autodoc", "Args:
	T(gp_Torus)

Returns:
	None

No detailed docstring for this function.") IntSurf_Quadric;
		 IntSurf_Quadric (const gp_Torus & T);
		%feature("autodoc", "Args:
	P(gp_Pln)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const gp_Pln & P);
		%feature("autodoc", "Args:
	C(gp_Cylinder)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const gp_Cylinder & C);
		%feature("autodoc", "Args:
	S(gp_Sphere)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const gp_Sphere & S);
		%feature("autodoc", "Args:
	C(gp_Cone)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const gp_Cone & C);
		%feature("autodoc", "Args:
	T(gp_Torus)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const gp_Torus & T);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	Standard_Real

No detailed docstring for this function.") Distance;
		Standard_Real Distance (const gp_Pnt & P);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	gp_Vec

No detailed docstring for this function.") Gradient;
		gp_Vec Gradient (const gp_Pnt & P);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	Dist(Standard_Real)
	Grad(gp_Vec)

Returns:
	None

No detailed docstring for this function.") ValAndGrad;
		void ValAndGrad (const gp_Pnt & P,Standard_Real &OutValue,gp_Vec & Grad);
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_SurfaceType

No detailed docstring for this function.") TypeQuadric;
		GeomAbs_SurfaceType TypeQuadric ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pln

No detailed docstring for this function.") Plane;
		gp_Pln Plane ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Sphere

No detailed docstring for this function.") Sphere;
		gp_Sphere Sphere ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Cylinder

No detailed docstring for this function.") Cylinder;
		gp_Cylinder Cylinder ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Cone

No detailed docstring for this function.") Cone;
		gp_Cone Cone ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Torus

No detailed docstring for this function.") Torus;
		gp_Torus Torus ();
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)

Returns:
	gp_Pnt

No detailed docstring for this function.") Value;
		gp_Pnt Value (const Standard_Real U,const Standard_Real V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)

Returns:
	None

No detailed docstring for this function.") D1;
		void D1 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Nu(Standard_Integer)
	Nv(Standard_Integer)

Returns:
	gp_Vec

No detailed docstring for this function.") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Real V,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)

Returns:
	gp_Vec

No detailed docstring for this function.") Normale;
		gp_Vec Normale (const Standard_Real U,const Standard_Real V);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	U(Standard_Real)
	V(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Parameters;
		void Parameters (const gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	gp_Vec

No detailed docstring for this function.") Normale;
		gp_Vec Normale (const gp_Pnt & P);
};


%feature("shadow") IntSurf_Quadric::~IntSurf_Quadric %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntSurf_Quadric {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntSurf_QuadricTool;
class IntSurf_QuadricTool {
	public:
		%feature("autodoc", "Args:
	Quad(IntSurf_Quadric)
	X(Standard_Real)
	Y(Standard_Real)
	Z(Standard_Real)

Returns:
	static Standard_Real

Returns the value of the function.") Value;
		static Standard_Real Value (const IntSurf_Quadric & Quad,const Standard_Real X,const Standard_Real Y,const Standard_Real Z);
		%feature("autodoc", "Args:
	Quad(IntSurf_Quadric)
	X(Standard_Real)
	Y(Standard_Real)
	Z(Standard_Real)
	V(gp_Vec)

Returns:
	static void

Returns the gradient of the function.") Gradient;
		static void Gradient (const IntSurf_Quadric & Quad,const Standard_Real X,const Standard_Real Y,const Standard_Real Z,gp_Vec & V);
		%feature("autodoc", "Args:
	Quad(IntSurf_Quadric)
	X(Standard_Real)
	Y(Standard_Real)
	Z(Standard_Real)
	Val(Standard_Real)
	Grad(gp_Vec)

Returns:
	static void

Returns the value and the gradient.") ValueAndGradient;
		static void ValueAndGradient (const IntSurf_Quadric & Quad,const Standard_Real X,const Standard_Real Y,const Standard_Real Z,Standard_Real &OutValue,gp_Vec & Grad);
		%feature("autodoc", "Args:
	Quad(IntSurf_Quadric)

Returns:
	static Standard_Real

returns the tolerance of the zero of the implicit function") Tolerance;
		static Standard_Real Tolerance (const IntSurf_Quadric & Quad);
};


%feature("shadow") IntSurf_QuadricTool::~IntSurf_QuadricTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntSurf_QuadricTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntSurf_SequenceNodeOfSequenceOfCouple;
class IntSurf_SequenceNodeOfSequenceOfCouple : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(IntSurf_Couple)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") IntSurf_SequenceNodeOfSequenceOfCouple;
		 IntSurf_SequenceNodeOfSequenceOfCouple (const IntSurf_Couple & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	IntSurf_Couple

No detailed docstring for this function.") Value;
		IntSurf_Couple & Value ();
};


%feature("shadow") IntSurf_SequenceNodeOfSequenceOfCouple::~IntSurf_SequenceNodeOfSequenceOfCouple %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntSurf_SequenceNodeOfSequenceOfCouple {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IntSurf_SequenceNodeOfSequenceOfCouple {
	Handle_IntSurf_SequenceNodeOfSequenceOfCouple GetHandle() {
	return *(Handle_IntSurf_SequenceNodeOfSequenceOfCouple*) &$self;
	}
};

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
    IntSurf_SequenceNodeOfSequenceOfCouple* GetObject() {
    return (IntSurf_SequenceNodeOfSequenceOfCouple*)$self->Access();
    }
};
%feature("shadow") Handle_IntSurf_SequenceNodeOfSequenceOfCouple::~Handle_IntSurf_SequenceNodeOfSequenceOfCouple %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IntSurf_SequenceNodeOfSequenceOfCouple {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IntSurf_SequenceNodeOfSequenceOfInteriorPoint;
class IntSurf_SequenceNodeOfSequenceOfInteriorPoint : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(IntSurf_InteriorPoint)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") IntSurf_SequenceNodeOfSequenceOfInteriorPoint;
		 IntSurf_SequenceNodeOfSequenceOfInteriorPoint (const IntSurf_InteriorPoint & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	IntSurf_InteriorPoint

No detailed docstring for this function.") Value;
		IntSurf_InteriorPoint & Value ();
};


%feature("shadow") IntSurf_SequenceNodeOfSequenceOfInteriorPoint::~IntSurf_SequenceNodeOfSequenceOfInteriorPoint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntSurf_SequenceNodeOfSequenceOfInteriorPoint {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IntSurf_SequenceNodeOfSequenceOfInteriorPoint {
	Handle_IntSurf_SequenceNodeOfSequenceOfInteriorPoint GetHandle() {
	return *(Handle_IntSurf_SequenceNodeOfSequenceOfInteriorPoint*) &$self;
	}
};

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
    IntSurf_SequenceNodeOfSequenceOfInteriorPoint* GetObject() {
    return (IntSurf_SequenceNodeOfSequenceOfInteriorPoint*)$self->Access();
    }
};
%feature("shadow") Handle_IntSurf_SequenceNodeOfSequenceOfInteriorPoint::~Handle_IntSurf_SequenceNodeOfSequenceOfInteriorPoint %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IntSurf_SequenceNodeOfSequenceOfInteriorPoint {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IntSurf_SequenceNodeOfSequenceOfPathPoint;
class IntSurf_SequenceNodeOfSequenceOfPathPoint : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(IntSurf_PathPoint)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") IntSurf_SequenceNodeOfSequenceOfPathPoint;
		 IntSurf_SequenceNodeOfSequenceOfPathPoint (const IntSurf_PathPoint & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	IntSurf_PathPoint

No detailed docstring for this function.") Value;
		IntSurf_PathPoint & Value ();
};


%feature("shadow") IntSurf_SequenceNodeOfSequenceOfPathPoint::~IntSurf_SequenceNodeOfSequenceOfPathPoint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntSurf_SequenceNodeOfSequenceOfPathPoint {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IntSurf_SequenceNodeOfSequenceOfPathPoint {
	Handle_IntSurf_SequenceNodeOfSequenceOfPathPoint GetHandle() {
	return *(Handle_IntSurf_SequenceNodeOfSequenceOfPathPoint*) &$self;
	}
};

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
    IntSurf_SequenceNodeOfSequenceOfPathPoint* GetObject() {
    return (IntSurf_SequenceNodeOfSequenceOfPathPoint*)$self->Access();
    }
};
%feature("shadow") Handle_IntSurf_SequenceNodeOfSequenceOfPathPoint::~Handle_IntSurf_SequenceNodeOfSequenceOfPathPoint %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IntSurf_SequenceNodeOfSequenceOfPathPoint {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IntSurf_SequenceOfCouple;
class IntSurf_SequenceOfCouple : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntSurf_SequenceOfCouple;
		 IntSurf_SequenceOfCouple ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(IntSurf_SequenceOfCouple)

Returns:
	IntSurf_SequenceOfCouple

No detailed docstring for this function.") Assign;
		const IntSurf_SequenceOfCouple & Assign (const IntSurf_SequenceOfCouple & Other);
		%feature("autodoc", "Args:
	Other(IntSurf_SequenceOfCouple)

Returns:
	IntSurf_SequenceOfCouple

No detailed docstring for this function.") operator=;
		const IntSurf_SequenceOfCouple & operator = (const IntSurf_SequenceOfCouple & Other);
		%feature("autodoc", "Args:
	T(IntSurf_Couple)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const IntSurf_Couple & T);
		%feature("autodoc", "Args:
	S(IntSurf_SequenceOfCouple)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (IntSurf_SequenceOfCouple & S);
		%feature("autodoc", "Args:
	T(IntSurf_Couple)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const IntSurf_Couple & T);
		%feature("autodoc", "Args:
	S(IntSurf_SequenceOfCouple)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (IntSurf_SequenceOfCouple & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(IntSurf_Couple)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const IntSurf_Couple & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(IntSurf_SequenceOfCouple)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,IntSurf_SequenceOfCouple & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(IntSurf_Couple)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const IntSurf_Couple & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(IntSurf_SequenceOfCouple)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,IntSurf_SequenceOfCouple & S);
		%feature("autodoc", "Args:
	None
Returns:
	IntSurf_Couple

No detailed docstring for this function.") First;
		const IntSurf_Couple & First ();
		%feature("autodoc", "Args:
	None
Returns:
	IntSurf_Couple

No detailed docstring for this function.") Last;
		const IntSurf_Couple & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(IntSurf_SequenceOfCouple)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,IntSurf_SequenceOfCouple & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	IntSurf_Couple

No detailed docstring for this function.") Value;
		const IntSurf_Couple & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(IntSurf_Couple)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const IntSurf_Couple & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	IntSurf_Couple

No detailed docstring for this function.") ChangeValue;
		IntSurf_Couple & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") IntSurf_SequenceOfCouple::~IntSurf_SequenceOfCouple %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntSurf_SequenceOfCouple {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntSurf_SequenceOfInteriorPoint;
class IntSurf_SequenceOfInteriorPoint : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntSurf_SequenceOfInteriorPoint;
		 IntSurf_SequenceOfInteriorPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(IntSurf_SequenceOfInteriorPoint)

Returns:
	IntSurf_SequenceOfInteriorPoint

No detailed docstring for this function.") Assign;
		const IntSurf_SequenceOfInteriorPoint & Assign (const IntSurf_SequenceOfInteriorPoint & Other);
		%feature("autodoc", "Args:
	Other(IntSurf_SequenceOfInteriorPoint)

Returns:
	IntSurf_SequenceOfInteriorPoint

No detailed docstring for this function.") operator=;
		const IntSurf_SequenceOfInteriorPoint & operator = (const IntSurf_SequenceOfInteriorPoint & Other);
		%feature("autodoc", "Args:
	T(IntSurf_InteriorPoint)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const IntSurf_InteriorPoint & T);
		%feature("autodoc", "Args:
	S(IntSurf_SequenceOfInteriorPoint)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (IntSurf_SequenceOfInteriorPoint & S);
		%feature("autodoc", "Args:
	T(IntSurf_InteriorPoint)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const IntSurf_InteriorPoint & T);
		%feature("autodoc", "Args:
	S(IntSurf_SequenceOfInteriorPoint)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (IntSurf_SequenceOfInteriorPoint & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(IntSurf_InteriorPoint)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const IntSurf_InteriorPoint & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(IntSurf_SequenceOfInteriorPoint)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,IntSurf_SequenceOfInteriorPoint & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(IntSurf_InteriorPoint)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const IntSurf_InteriorPoint & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(IntSurf_SequenceOfInteriorPoint)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,IntSurf_SequenceOfInteriorPoint & S);
		%feature("autodoc", "Args:
	None
Returns:
	IntSurf_InteriorPoint

No detailed docstring for this function.") First;
		const IntSurf_InteriorPoint & First ();
		%feature("autodoc", "Args:
	None
Returns:
	IntSurf_InteriorPoint

No detailed docstring for this function.") Last;
		const IntSurf_InteriorPoint & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(IntSurf_SequenceOfInteriorPoint)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,IntSurf_SequenceOfInteriorPoint & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	IntSurf_InteriorPoint

No detailed docstring for this function.") Value;
		const IntSurf_InteriorPoint & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(IntSurf_InteriorPoint)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const IntSurf_InteriorPoint & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	IntSurf_InteriorPoint

No detailed docstring for this function.") ChangeValue;
		IntSurf_InteriorPoint & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") IntSurf_SequenceOfInteriorPoint::~IntSurf_SequenceOfInteriorPoint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntSurf_SequenceOfInteriorPoint {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntSurf_SequenceOfPathPoint;
class IntSurf_SequenceOfPathPoint : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntSurf_SequenceOfPathPoint;
		 IntSurf_SequenceOfPathPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(IntSurf_SequenceOfPathPoint)

Returns:
	IntSurf_SequenceOfPathPoint

No detailed docstring for this function.") Assign;
		const IntSurf_SequenceOfPathPoint & Assign (const IntSurf_SequenceOfPathPoint & Other);
		%feature("autodoc", "Args:
	Other(IntSurf_SequenceOfPathPoint)

Returns:
	IntSurf_SequenceOfPathPoint

No detailed docstring for this function.") operator=;
		const IntSurf_SequenceOfPathPoint & operator = (const IntSurf_SequenceOfPathPoint & Other);
		%feature("autodoc", "Args:
	T(IntSurf_PathPoint)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const IntSurf_PathPoint & T);
		%feature("autodoc", "Args:
	S(IntSurf_SequenceOfPathPoint)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (IntSurf_SequenceOfPathPoint & S);
		%feature("autodoc", "Args:
	T(IntSurf_PathPoint)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const IntSurf_PathPoint & T);
		%feature("autodoc", "Args:
	S(IntSurf_SequenceOfPathPoint)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (IntSurf_SequenceOfPathPoint & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(IntSurf_PathPoint)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const IntSurf_PathPoint & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(IntSurf_SequenceOfPathPoint)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,IntSurf_SequenceOfPathPoint & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(IntSurf_PathPoint)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const IntSurf_PathPoint & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(IntSurf_SequenceOfPathPoint)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,IntSurf_SequenceOfPathPoint & S);
		%feature("autodoc", "Args:
	None
Returns:
	IntSurf_PathPoint

No detailed docstring for this function.") First;
		const IntSurf_PathPoint & First ();
		%feature("autodoc", "Args:
	None
Returns:
	IntSurf_PathPoint

No detailed docstring for this function.") Last;
		const IntSurf_PathPoint & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(IntSurf_SequenceOfPathPoint)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,IntSurf_SequenceOfPathPoint & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	IntSurf_PathPoint

No detailed docstring for this function.") Value;
		const IntSurf_PathPoint & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(IntSurf_PathPoint)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const IntSurf_PathPoint & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	IntSurf_PathPoint

No detailed docstring for this function.") ChangeValue;
		IntSurf_PathPoint & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") IntSurf_SequenceOfPathPoint::~IntSurf_SequenceOfPathPoint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntSurf_SequenceOfPathPoint {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntSurf_Transition;
class IntSurf_Transition {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor. Creates an UNDECIDED transition.") IntSurf_Transition;
		 IntSurf_Transition ();
		%feature("autodoc", "Args:
	Tangent(Standard_Boolean)
	Type(IntSurf_TypeTrans)

Returns:
	None

Create a IN or OUT transition") IntSurf_Transition;
		 IntSurf_Transition (const Standard_Boolean Tangent,const IntSurf_TypeTrans Type);
		%feature("autodoc", "Args:
	Tangent(Standard_Boolean)
	Situ(IntSurf_Situation)
	Oppos(Standard_Boolean)

Returns:
	None

Create a TOUCH transition.") IntSurf_Transition;
		 IntSurf_Transition (const Standard_Boolean Tangent,const IntSurf_Situation Situ,const Standard_Boolean Oppos);
		%feature("autodoc", "Args:
	Tangent(Standard_Boolean)
	Type(IntSurf_TypeTrans)

Returns:
	None

Set the values of an IN or OUT transition.") SetValue;
		void SetValue (const Standard_Boolean Tangent,const IntSurf_TypeTrans Type);
		%feature("autodoc", "Args:
	Tangent(Standard_Boolean)
	Situ(IntSurf_Situation)
	Oppos(Standard_Boolean)

Returns:
	None

Set the values of a TOUCH transition.") SetValue;
		void SetValue (const Standard_Boolean Tangent,const IntSurf_Situation Situ,const Standard_Boolean Oppos);
		%feature("autodoc", "Args:
	None
Returns:
	None

Set the values of an UNDECIDED transition.") SetValue;
		void SetValue ();
		%feature("autodoc", "Args:
	None
Returns:
	IntSurf_TypeTrans

Returns the type of Transition (in/out/touch/undecided)  
         for the arc given by value. This the transition of  
         the intersection line compared to the Arc of restriction,  
         i-e when the function returns INSIDE for example, it  
         means that the intersection line goes inside the  
         part of plane limited by the arc of restriction.") TransitionType;
		IntSurf_TypeTrans TransitionType ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns TRUE if the point is tangent to the arc  
         given by Value.  
         An exception is raised if TransitionType returns UNDECIDED.") IsTangent;
		Standard_Boolean IsTangent ();
		%feature("autodoc", "Args:
	None
Returns:
	IntSurf_Situation

Returns a significant value if TransitionType returns  
         TOUCH. In this case, the function returns :  
         INSIDE when the intersection line remains inside the Arc,  
         OUTSIDE when it remains outside the Arc,  
         UNKNOWN when the calsulus cannot give results.  
         If TransitionType returns IN, or OUT, or UNDECIDED, a  
         exception is raised.") Situation;
		IntSurf_Situation Situation ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns a significant value if TransitionType returns  
         TOUCH.  
         In this case, the function returns true when  
         the 2 curves locally define two different parts of the  
         space.  
         If TransitionType returns IN or OUT or UNDECIDED, an  
         exception is raised.") IsOpposite;
		Standard_Boolean IsOpposite ();
};


%feature("shadow") IntSurf_Transition::~IntSurf_Transition %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntSurf_Transition {
	void _kill_pointed() {
		delete $self;
	}
};
