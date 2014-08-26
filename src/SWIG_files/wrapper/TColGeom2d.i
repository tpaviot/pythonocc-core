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
%module TColGeom2d

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

%include TColGeom2d_required_python_modules.i
%include TColGeom2d_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor TColGeom2d_Array1OfBSplineCurve;
class TColGeom2d_Array1OfBSplineCurve {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColGeom2d_Array1OfBSplineCurve;
		 TColGeom2d_Array1OfBSplineCurve (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(Handle_Geom2d_BSplineCurve)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColGeom2d_Array1OfBSplineCurve;
		 TColGeom2d_Array1OfBSplineCurve (const Handle_Geom2d_BSplineCurve & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(Handle_Geom2d_BSplineCurve)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom2d_BSplineCurve & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	Other(TColGeom2d_Array1OfBSplineCurve)

Returns:
	TColGeom2d_Array1OfBSplineCurve

No detailed docstring for this function.") Assign;
		const TColGeom2d_Array1OfBSplineCurve & Assign (const TColGeom2d_Array1OfBSplineCurve & Other);
		%feature("autodoc", "Args:
	Other(TColGeom2d_Array1OfBSplineCurve)

Returns:
	TColGeom2d_Array1OfBSplineCurve

No detailed docstring for this function.") operator=;
		const TColGeom2d_Array1OfBSplineCurve & operator = (const TColGeom2d_Array1OfBSplineCurve & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Handle_Geom2d_BSplineCurve)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom2d_BSplineCurve & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom2d_BSplineCurve

No detailed docstring for this function.") Value;
		const Handle_Geom2d_BSplineCurve & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom2d_BSplineCurve

No detailed docstring for this function.") ChangeValue;
		Handle_Geom2d_BSplineCurve & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") TColGeom2d_Array1OfBSplineCurve::~TColGeom2d_Array1OfBSplineCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom2d_Array1OfBSplineCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColGeom2d_Array1OfBezierCurve;
class TColGeom2d_Array1OfBezierCurve {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColGeom2d_Array1OfBezierCurve;
		 TColGeom2d_Array1OfBezierCurve (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(Handle_Geom2d_BezierCurve)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColGeom2d_Array1OfBezierCurve;
		 TColGeom2d_Array1OfBezierCurve (const Handle_Geom2d_BezierCurve & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(Handle_Geom2d_BezierCurve)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom2d_BezierCurve & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	Other(TColGeom2d_Array1OfBezierCurve)

Returns:
	TColGeom2d_Array1OfBezierCurve

No detailed docstring for this function.") Assign;
		const TColGeom2d_Array1OfBezierCurve & Assign (const TColGeom2d_Array1OfBezierCurve & Other);
		%feature("autodoc", "Args:
	Other(TColGeom2d_Array1OfBezierCurve)

Returns:
	TColGeom2d_Array1OfBezierCurve

No detailed docstring for this function.") operator=;
		const TColGeom2d_Array1OfBezierCurve & operator = (const TColGeom2d_Array1OfBezierCurve & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Handle_Geom2d_BezierCurve)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom2d_BezierCurve & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom2d_BezierCurve

No detailed docstring for this function.") Value;
		const Handle_Geom2d_BezierCurve & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom2d_BezierCurve

No detailed docstring for this function.") ChangeValue;
		Handle_Geom2d_BezierCurve & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") TColGeom2d_Array1OfBezierCurve::~TColGeom2d_Array1OfBezierCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom2d_Array1OfBezierCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColGeom2d_Array1OfBoundedCurve;
class TColGeom2d_Array1OfBoundedCurve {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColGeom2d_Array1OfBoundedCurve;
		 TColGeom2d_Array1OfBoundedCurve (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(Handle_Geom2d_BoundedCurve)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColGeom2d_Array1OfBoundedCurve;
		 TColGeom2d_Array1OfBoundedCurve (const Handle_Geom2d_BoundedCurve & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(Handle_Geom2d_BoundedCurve)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom2d_BoundedCurve & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	Other(TColGeom2d_Array1OfBoundedCurve)

Returns:
	TColGeom2d_Array1OfBoundedCurve

No detailed docstring for this function.") Assign;
		const TColGeom2d_Array1OfBoundedCurve & Assign (const TColGeom2d_Array1OfBoundedCurve & Other);
		%feature("autodoc", "Args:
	Other(TColGeom2d_Array1OfBoundedCurve)

Returns:
	TColGeom2d_Array1OfBoundedCurve

No detailed docstring for this function.") operator=;
		const TColGeom2d_Array1OfBoundedCurve & operator = (const TColGeom2d_Array1OfBoundedCurve & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Handle_Geom2d_BoundedCurve)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom2d_BoundedCurve & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom2d_BoundedCurve

No detailed docstring for this function.") Value;
		const Handle_Geom2d_BoundedCurve & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom2d_BoundedCurve

No detailed docstring for this function.") ChangeValue;
		Handle_Geom2d_BoundedCurve & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") TColGeom2d_Array1OfBoundedCurve::~TColGeom2d_Array1OfBoundedCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom2d_Array1OfBoundedCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColGeom2d_Array1OfCurve;
class TColGeom2d_Array1OfCurve {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColGeom2d_Array1OfCurve;
		 TColGeom2d_Array1OfCurve (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(Handle_Geom2d_Curve)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColGeom2d_Array1OfCurve;
		 TColGeom2d_Array1OfCurve (const Handle_Geom2d_Curve & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(Handle_Geom2d_Curve)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom2d_Curve & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	Other(TColGeom2d_Array1OfCurve)

Returns:
	TColGeom2d_Array1OfCurve

No detailed docstring for this function.") Assign;
		const TColGeom2d_Array1OfCurve & Assign (const TColGeom2d_Array1OfCurve & Other);
		%feature("autodoc", "Args:
	Other(TColGeom2d_Array1OfCurve)

Returns:
	TColGeom2d_Array1OfCurve

No detailed docstring for this function.") operator=;
		const TColGeom2d_Array1OfCurve & operator = (const TColGeom2d_Array1OfCurve & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Handle_Geom2d_Curve)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom2d_Curve & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom2d_Curve

No detailed docstring for this function.") Value;
		const Handle_Geom2d_Curve & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom2d_Curve

No detailed docstring for this function.") ChangeValue;
		Handle_Geom2d_Curve & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") TColGeom2d_Array1OfCurve::~TColGeom2d_Array1OfCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom2d_Array1OfCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColGeom2d_Array1OfGeometry;
class TColGeom2d_Array1OfGeometry {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColGeom2d_Array1OfGeometry;
		 TColGeom2d_Array1OfGeometry (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(Handle_Geom2d_Geometry)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColGeom2d_Array1OfGeometry;
		 TColGeom2d_Array1OfGeometry (const Handle_Geom2d_Geometry & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(Handle_Geom2d_Geometry)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom2d_Geometry & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	Other(TColGeom2d_Array1OfGeometry)

Returns:
	TColGeom2d_Array1OfGeometry

No detailed docstring for this function.") Assign;
		const TColGeom2d_Array1OfGeometry & Assign (const TColGeom2d_Array1OfGeometry & Other);
		%feature("autodoc", "Args:
	Other(TColGeom2d_Array1OfGeometry)

Returns:
	TColGeom2d_Array1OfGeometry

No detailed docstring for this function.") operator=;
		const TColGeom2d_Array1OfGeometry & operator = (const TColGeom2d_Array1OfGeometry & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Handle_Geom2d_Geometry)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom2d_Geometry & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom2d_Geometry

No detailed docstring for this function.") Value;
		const Handle_Geom2d_Geometry & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom2d_Geometry

No detailed docstring for this function.") ChangeValue;
		Handle_Geom2d_Geometry & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") TColGeom2d_Array1OfGeometry::~TColGeom2d_Array1OfGeometry %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom2d_Array1OfGeometry {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColGeom2d_HArray1OfBSplineCurve;
class TColGeom2d_HArray1OfBSplineCurve : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColGeom2d_HArray1OfBSplineCurve;
		 TColGeom2d_HArray1OfBSplineCurve (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(Handle_Geom2d_BSplineCurve)

Returns:
	None

No detailed docstring for this function.") TColGeom2d_HArray1OfBSplineCurve;
		 TColGeom2d_HArray1OfBSplineCurve (const Standard_Integer Low,const Standard_Integer Up,const Handle_Geom2d_BSplineCurve & V);
		%feature("autodoc", "Args:
	V(Handle_Geom2d_BSplineCurve)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom2d_BSplineCurve & V);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Handle_Geom2d_BSplineCurve)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom2d_BSplineCurve & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom2d_BSplineCurve

No detailed docstring for this function.") Value;
		const Handle_Geom2d_BSplineCurve & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom2d_BSplineCurve

No detailed docstring for this function.") ChangeValue;
		Handle_Geom2d_BSplineCurve & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	TColGeom2d_Array1OfBSplineCurve

No detailed docstring for this function.") Array1;
		const TColGeom2d_Array1OfBSplineCurve & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	TColGeom2d_Array1OfBSplineCurve

No detailed docstring for this function.") ChangeArray1;
		TColGeom2d_Array1OfBSplineCurve & ChangeArray1 ();
};


%feature("shadow") TColGeom2d_HArray1OfBSplineCurve::~TColGeom2d_HArray1OfBSplineCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom2d_HArray1OfBSplineCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColGeom2d_HArray1OfBSplineCurve {
	Handle_TColGeom2d_HArray1OfBSplineCurve GetHandle() {
	return *(Handle_TColGeom2d_HArray1OfBSplineCurve*) &$self;
	}
};

%nodefaultctor Handle_TColGeom2d_HArray1OfBSplineCurve;
class Handle_TColGeom2d_HArray1OfBSplineCurve : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColGeom2d_HArray1OfBSplineCurve();
        Handle_TColGeom2d_HArray1OfBSplineCurve(const Handle_TColGeom2d_HArray1OfBSplineCurve &aHandle);
        Handle_TColGeom2d_HArray1OfBSplineCurve(const TColGeom2d_HArray1OfBSplineCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColGeom2d_HArray1OfBSplineCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom2d_HArray1OfBSplineCurve {
    TColGeom2d_HArray1OfBSplineCurve* GetObject() {
    return (TColGeom2d_HArray1OfBSplineCurve*)$self->Access();
    }
};
%feature("shadow") Handle_TColGeom2d_HArray1OfBSplineCurve::~Handle_TColGeom2d_HArray1OfBSplineCurve %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColGeom2d_HArray1OfBSplineCurve {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColGeom2d_HArray1OfBezierCurve;
class TColGeom2d_HArray1OfBezierCurve : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColGeom2d_HArray1OfBezierCurve;
		 TColGeom2d_HArray1OfBezierCurve (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(Handle_Geom2d_BezierCurve)

Returns:
	None

No detailed docstring for this function.") TColGeom2d_HArray1OfBezierCurve;
		 TColGeom2d_HArray1OfBezierCurve (const Standard_Integer Low,const Standard_Integer Up,const Handle_Geom2d_BezierCurve & V);
		%feature("autodoc", "Args:
	V(Handle_Geom2d_BezierCurve)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom2d_BezierCurve & V);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Handle_Geom2d_BezierCurve)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom2d_BezierCurve & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom2d_BezierCurve

No detailed docstring for this function.") Value;
		const Handle_Geom2d_BezierCurve & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom2d_BezierCurve

No detailed docstring for this function.") ChangeValue;
		Handle_Geom2d_BezierCurve & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	TColGeom2d_Array1OfBezierCurve

No detailed docstring for this function.") Array1;
		const TColGeom2d_Array1OfBezierCurve & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	TColGeom2d_Array1OfBezierCurve

No detailed docstring for this function.") ChangeArray1;
		TColGeom2d_Array1OfBezierCurve & ChangeArray1 ();
};


%feature("shadow") TColGeom2d_HArray1OfBezierCurve::~TColGeom2d_HArray1OfBezierCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom2d_HArray1OfBezierCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColGeom2d_HArray1OfBezierCurve {
	Handle_TColGeom2d_HArray1OfBezierCurve GetHandle() {
	return *(Handle_TColGeom2d_HArray1OfBezierCurve*) &$self;
	}
};

%nodefaultctor Handle_TColGeom2d_HArray1OfBezierCurve;
class Handle_TColGeom2d_HArray1OfBezierCurve : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColGeom2d_HArray1OfBezierCurve();
        Handle_TColGeom2d_HArray1OfBezierCurve(const Handle_TColGeom2d_HArray1OfBezierCurve &aHandle);
        Handle_TColGeom2d_HArray1OfBezierCurve(const TColGeom2d_HArray1OfBezierCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColGeom2d_HArray1OfBezierCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom2d_HArray1OfBezierCurve {
    TColGeom2d_HArray1OfBezierCurve* GetObject() {
    return (TColGeom2d_HArray1OfBezierCurve*)$self->Access();
    }
};
%feature("shadow") Handle_TColGeom2d_HArray1OfBezierCurve::~Handle_TColGeom2d_HArray1OfBezierCurve %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColGeom2d_HArray1OfBezierCurve {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColGeom2d_HArray1OfBoundedCurve;
class TColGeom2d_HArray1OfBoundedCurve : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColGeom2d_HArray1OfBoundedCurve;
		 TColGeom2d_HArray1OfBoundedCurve (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(Handle_Geom2d_BoundedCurve)

Returns:
	None

No detailed docstring for this function.") TColGeom2d_HArray1OfBoundedCurve;
		 TColGeom2d_HArray1OfBoundedCurve (const Standard_Integer Low,const Standard_Integer Up,const Handle_Geom2d_BoundedCurve & V);
		%feature("autodoc", "Args:
	V(Handle_Geom2d_BoundedCurve)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom2d_BoundedCurve & V);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Handle_Geom2d_BoundedCurve)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom2d_BoundedCurve & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom2d_BoundedCurve

No detailed docstring for this function.") Value;
		const Handle_Geom2d_BoundedCurve & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom2d_BoundedCurve

No detailed docstring for this function.") ChangeValue;
		Handle_Geom2d_BoundedCurve & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	TColGeom2d_Array1OfBoundedCurve

No detailed docstring for this function.") Array1;
		const TColGeom2d_Array1OfBoundedCurve & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	TColGeom2d_Array1OfBoundedCurve

No detailed docstring for this function.") ChangeArray1;
		TColGeom2d_Array1OfBoundedCurve & ChangeArray1 ();
};


%feature("shadow") TColGeom2d_HArray1OfBoundedCurve::~TColGeom2d_HArray1OfBoundedCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom2d_HArray1OfBoundedCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColGeom2d_HArray1OfBoundedCurve {
	Handle_TColGeom2d_HArray1OfBoundedCurve GetHandle() {
	return *(Handle_TColGeom2d_HArray1OfBoundedCurve*) &$self;
	}
};

%nodefaultctor Handle_TColGeom2d_HArray1OfBoundedCurve;
class Handle_TColGeom2d_HArray1OfBoundedCurve : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColGeom2d_HArray1OfBoundedCurve();
        Handle_TColGeom2d_HArray1OfBoundedCurve(const Handle_TColGeom2d_HArray1OfBoundedCurve &aHandle);
        Handle_TColGeom2d_HArray1OfBoundedCurve(const TColGeom2d_HArray1OfBoundedCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColGeom2d_HArray1OfBoundedCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom2d_HArray1OfBoundedCurve {
    TColGeom2d_HArray1OfBoundedCurve* GetObject() {
    return (TColGeom2d_HArray1OfBoundedCurve*)$self->Access();
    }
};
%feature("shadow") Handle_TColGeom2d_HArray1OfBoundedCurve::~Handle_TColGeom2d_HArray1OfBoundedCurve %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColGeom2d_HArray1OfBoundedCurve {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColGeom2d_HArray1OfCurve;
class TColGeom2d_HArray1OfCurve : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColGeom2d_HArray1OfCurve;
		 TColGeom2d_HArray1OfCurve (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(Handle_Geom2d_Curve)

Returns:
	None

No detailed docstring for this function.") TColGeom2d_HArray1OfCurve;
		 TColGeom2d_HArray1OfCurve (const Standard_Integer Low,const Standard_Integer Up,const Handle_Geom2d_Curve & V);
		%feature("autodoc", "Args:
	V(Handle_Geom2d_Curve)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom2d_Curve & V);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Handle_Geom2d_Curve)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom2d_Curve & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom2d_Curve

No detailed docstring for this function.") Value;
		const Handle_Geom2d_Curve & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom2d_Curve

No detailed docstring for this function.") ChangeValue;
		Handle_Geom2d_Curve & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	TColGeom2d_Array1OfCurve

No detailed docstring for this function.") Array1;
		const TColGeom2d_Array1OfCurve & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	TColGeom2d_Array1OfCurve

No detailed docstring for this function.") ChangeArray1;
		TColGeom2d_Array1OfCurve & ChangeArray1 ();
};


%feature("shadow") TColGeom2d_HArray1OfCurve::~TColGeom2d_HArray1OfCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom2d_HArray1OfCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColGeom2d_HArray1OfCurve {
	Handle_TColGeom2d_HArray1OfCurve GetHandle() {
	return *(Handle_TColGeom2d_HArray1OfCurve*) &$self;
	}
};

%nodefaultctor Handle_TColGeom2d_HArray1OfCurve;
class Handle_TColGeom2d_HArray1OfCurve : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColGeom2d_HArray1OfCurve();
        Handle_TColGeom2d_HArray1OfCurve(const Handle_TColGeom2d_HArray1OfCurve &aHandle);
        Handle_TColGeom2d_HArray1OfCurve(const TColGeom2d_HArray1OfCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColGeom2d_HArray1OfCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom2d_HArray1OfCurve {
    TColGeom2d_HArray1OfCurve* GetObject() {
    return (TColGeom2d_HArray1OfCurve*)$self->Access();
    }
};
%feature("shadow") Handle_TColGeom2d_HArray1OfCurve::~Handle_TColGeom2d_HArray1OfCurve %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColGeom2d_HArray1OfCurve {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColGeom2d_HArray1OfGeometry;
class TColGeom2d_HArray1OfGeometry : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColGeom2d_HArray1OfGeometry;
		 TColGeom2d_HArray1OfGeometry (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(Handle_Geom2d_Geometry)

Returns:
	None

No detailed docstring for this function.") TColGeom2d_HArray1OfGeometry;
		 TColGeom2d_HArray1OfGeometry (const Standard_Integer Low,const Standard_Integer Up,const Handle_Geom2d_Geometry & V);
		%feature("autodoc", "Args:
	V(Handle_Geom2d_Geometry)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom2d_Geometry & V);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Handle_Geom2d_Geometry)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom2d_Geometry & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom2d_Geometry

No detailed docstring for this function.") Value;
		const Handle_Geom2d_Geometry & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom2d_Geometry

No detailed docstring for this function.") ChangeValue;
		Handle_Geom2d_Geometry & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	TColGeom2d_Array1OfGeometry

No detailed docstring for this function.") Array1;
		const TColGeom2d_Array1OfGeometry & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	TColGeom2d_Array1OfGeometry

No detailed docstring for this function.") ChangeArray1;
		TColGeom2d_Array1OfGeometry & ChangeArray1 ();
};


%feature("shadow") TColGeom2d_HArray1OfGeometry::~TColGeom2d_HArray1OfGeometry %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom2d_HArray1OfGeometry {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColGeom2d_HArray1OfGeometry {
	Handle_TColGeom2d_HArray1OfGeometry GetHandle() {
	return *(Handle_TColGeom2d_HArray1OfGeometry*) &$self;
	}
};

%nodefaultctor Handle_TColGeom2d_HArray1OfGeometry;
class Handle_TColGeom2d_HArray1OfGeometry : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColGeom2d_HArray1OfGeometry();
        Handle_TColGeom2d_HArray1OfGeometry(const Handle_TColGeom2d_HArray1OfGeometry &aHandle);
        Handle_TColGeom2d_HArray1OfGeometry(const TColGeom2d_HArray1OfGeometry *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColGeom2d_HArray1OfGeometry DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom2d_HArray1OfGeometry {
    TColGeom2d_HArray1OfGeometry* GetObject() {
    return (TColGeom2d_HArray1OfGeometry*)$self->Access();
    }
};
%feature("shadow") Handle_TColGeom2d_HArray1OfGeometry::~Handle_TColGeom2d_HArray1OfGeometry %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColGeom2d_HArray1OfGeometry {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColGeom2d_HSequenceOfBoundedCurve;
class TColGeom2d_HSequenceOfBoundedCurve : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColGeom2d_HSequenceOfBoundedCurve;
		 TColGeom2d_HSequenceOfBoundedCurve ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	anItem(Handle_Geom2d_BoundedCurve)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Geom2d_BoundedCurve & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_TColGeom2d_HSequenceOfBoundedCurve)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_TColGeom2d_HSequenceOfBoundedCurve & aSequence);
		%feature("autodoc", "Args:
	anItem(Handle_Geom2d_BoundedCurve)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Geom2d_BoundedCurve & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_TColGeom2d_HSequenceOfBoundedCurve)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_TColGeom2d_HSequenceOfBoundedCurve & aSequence);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Geom2d_BoundedCurve)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Geom2d_BoundedCurve & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_TColGeom2d_HSequenceOfBoundedCurve)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TColGeom2d_HSequenceOfBoundedCurve & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Geom2d_BoundedCurve)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Geom2d_BoundedCurve & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_TColGeom2d_HSequenceOfBoundedCurve)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TColGeom2d_HSequenceOfBoundedCurve & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anOtherIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_TColGeom2d_HSequenceOfBoundedCurve

No detailed docstring for this function.") Split;
		Handle_TColGeom2d_HSequenceOfBoundedCurve Split (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Geom2d_BoundedCurve)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Geom2d_BoundedCurve & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Geom2d_BoundedCurve

No detailed docstring for this function.") Value;
		const Handle_Geom2d_BoundedCurve & Value (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Geom2d_BoundedCurve

No detailed docstring for this function.") ChangeValue;
		Handle_Geom2d_BoundedCurve & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	fromIndex(Standard_Integer)
	toIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "Args:
	None
Returns:
	TColGeom2d_SequenceOfBoundedCurve

No detailed docstring for this function.") Sequence;
		const TColGeom2d_SequenceOfBoundedCurve & Sequence ();
		%feature("autodoc", "Args:
	None
Returns:
	TColGeom2d_SequenceOfBoundedCurve

No detailed docstring for this function.") ChangeSequence;
		TColGeom2d_SequenceOfBoundedCurve & ChangeSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColGeom2d_HSequenceOfBoundedCurve

No detailed docstring for this function.") ShallowCopy;
		Handle_TColGeom2d_HSequenceOfBoundedCurve ShallowCopy ();
};


%feature("shadow") TColGeom2d_HSequenceOfBoundedCurve::~TColGeom2d_HSequenceOfBoundedCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom2d_HSequenceOfBoundedCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColGeom2d_HSequenceOfBoundedCurve {
	Handle_TColGeom2d_HSequenceOfBoundedCurve GetHandle() {
	return *(Handle_TColGeom2d_HSequenceOfBoundedCurve*) &$self;
	}
};

%nodefaultctor Handle_TColGeom2d_HSequenceOfBoundedCurve;
class Handle_TColGeom2d_HSequenceOfBoundedCurve : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColGeom2d_HSequenceOfBoundedCurve();
        Handle_TColGeom2d_HSequenceOfBoundedCurve(const Handle_TColGeom2d_HSequenceOfBoundedCurve &aHandle);
        Handle_TColGeom2d_HSequenceOfBoundedCurve(const TColGeom2d_HSequenceOfBoundedCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColGeom2d_HSequenceOfBoundedCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom2d_HSequenceOfBoundedCurve {
    TColGeom2d_HSequenceOfBoundedCurve* GetObject() {
    return (TColGeom2d_HSequenceOfBoundedCurve*)$self->Access();
    }
};
%feature("shadow") Handle_TColGeom2d_HSequenceOfBoundedCurve::~Handle_TColGeom2d_HSequenceOfBoundedCurve %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColGeom2d_HSequenceOfBoundedCurve {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColGeom2d_HSequenceOfCurve;
class TColGeom2d_HSequenceOfCurve : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColGeom2d_HSequenceOfCurve;
		 TColGeom2d_HSequenceOfCurve ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	anItem(Handle_Geom2d_Curve)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Geom2d_Curve & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_TColGeom2d_HSequenceOfCurve)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_TColGeom2d_HSequenceOfCurve & aSequence);
		%feature("autodoc", "Args:
	anItem(Handle_Geom2d_Curve)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Geom2d_Curve & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_TColGeom2d_HSequenceOfCurve)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_TColGeom2d_HSequenceOfCurve & aSequence);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Geom2d_Curve)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Geom2d_Curve & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_TColGeom2d_HSequenceOfCurve)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TColGeom2d_HSequenceOfCurve & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Geom2d_Curve)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Geom2d_Curve & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_TColGeom2d_HSequenceOfCurve)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TColGeom2d_HSequenceOfCurve & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anOtherIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_TColGeom2d_HSequenceOfCurve

No detailed docstring for this function.") Split;
		Handle_TColGeom2d_HSequenceOfCurve Split (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Geom2d_Curve)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Geom2d_Curve & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Geom2d_Curve

No detailed docstring for this function.") Value;
		const Handle_Geom2d_Curve & Value (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Geom2d_Curve

No detailed docstring for this function.") ChangeValue;
		Handle_Geom2d_Curve & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	fromIndex(Standard_Integer)
	toIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "Args:
	None
Returns:
	TColGeom2d_SequenceOfCurve

No detailed docstring for this function.") Sequence;
		const TColGeom2d_SequenceOfCurve & Sequence ();
		%feature("autodoc", "Args:
	None
Returns:
	TColGeom2d_SequenceOfCurve

No detailed docstring for this function.") ChangeSequence;
		TColGeom2d_SequenceOfCurve & ChangeSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColGeom2d_HSequenceOfCurve

No detailed docstring for this function.") ShallowCopy;
		Handle_TColGeom2d_HSequenceOfCurve ShallowCopy ();
};


%feature("shadow") TColGeom2d_HSequenceOfCurve::~TColGeom2d_HSequenceOfCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom2d_HSequenceOfCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColGeom2d_HSequenceOfCurve {
	Handle_TColGeom2d_HSequenceOfCurve GetHandle() {
	return *(Handle_TColGeom2d_HSequenceOfCurve*) &$self;
	}
};

%nodefaultctor Handle_TColGeom2d_HSequenceOfCurve;
class Handle_TColGeom2d_HSequenceOfCurve : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColGeom2d_HSequenceOfCurve();
        Handle_TColGeom2d_HSequenceOfCurve(const Handle_TColGeom2d_HSequenceOfCurve &aHandle);
        Handle_TColGeom2d_HSequenceOfCurve(const TColGeom2d_HSequenceOfCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColGeom2d_HSequenceOfCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom2d_HSequenceOfCurve {
    TColGeom2d_HSequenceOfCurve* GetObject() {
    return (TColGeom2d_HSequenceOfCurve*)$self->Access();
    }
};
%feature("shadow") Handle_TColGeom2d_HSequenceOfCurve::~Handle_TColGeom2d_HSequenceOfCurve %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColGeom2d_HSequenceOfCurve {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColGeom2d_HSequenceOfGeometry;
class TColGeom2d_HSequenceOfGeometry : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColGeom2d_HSequenceOfGeometry;
		 TColGeom2d_HSequenceOfGeometry ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	anItem(Handle_Geom2d_Geometry)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Geom2d_Geometry & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_TColGeom2d_HSequenceOfGeometry)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_TColGeom2d_HSequenceOfGeometry & aSequence);
		%feature("autodoc", "Args:
	anItem(Handle_Geom2d_Geometry)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Geom2d_Geometry & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_TColGeom2d_HSequenceOfGeometry)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_TColGeom2d_HSequenceOfGeometry & aSequence);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Geom2d_Geometry)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Geom2d_Geometry & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_TColGeom2d_HSequenceOfGeometry)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TColGeom2d_HSequenceOfGeometry & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Geom2d_Geometry)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Geom2d_Geometry & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_TColGeom2d_HSequenceOfGeometry)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TColGeom2d_HSequenceOfGeometry & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anOtherIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_TColGeom2d_HSequenceOfGeometry

No detailed docstring for this function.") Split;
		Handle_TColGeom2d_HSequenceOfGeometry Split (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Geom2d_Geometry)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Geom2d_Geometry & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Geom2d_Geometry

No detailed docstring for this function.") Value;
		const Handle_Geom2d_Geometry & Value (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Geom2d_Geometry

No detailed docstring for this function.") ChangeValue;
		Handle_Geom2d_Geometry & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	fromIndex(Standard_Integer)
	toIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "Args:
	None
Returns:
	TColGeom2d_SequenceOfGeometry

No detailed docstring for this function.") Sequence;
		const TColGeom2d_SequenceOfGeometry & Sequence ();
		%feature("autodoc", "Args:
	None
Returns:
	TColGeom2d_SequenceOfGeometry

No detailed docstring for this function.") ChangeSequence;
		TColGeom2d_SequenceOfGeometry & ChangeSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColGeom2d_HSequenceOfGeometry

No detailed docstring for this function.") ShallowCopy;
		Handle_TColGeom2d_HSequenceOfGeometry ShallowCopy ();
};


%feature("shadow") TColGeom2d_HSequenceOfGeometry::~TColGeom2d_HSequenceOfGeometry %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom2d_HSequenceOfGeometry {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColGeom2d_HSequenceOfGeometry {
	Handle_TColGeom2d_HSequenceOfGeometry GetHandle() {
	return *(Handle_TColGeom2d_HSequenceOfGeometry*) &$self;
	}
};

%nodefaultctor Handle_TColGeom2d_HSequenceOfGeometry;
class Handle_TColGeom2d_HSequenceOfGeometry : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColGeom2d_HSequenceOfGeometry();
        Handle_TColGeom2d_HSequenceOfGeometry(const Handle_TColGeom2d_HSequenceOfGeometry &aHandle);
        Handle_TColGeom2d_HSequenceOfGeometry(const TColGeom2d_HSequenceOfGeometry *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColGeom2d_HSequenceOfGeometry DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom2d_HSequenceOfGeometry {
    TColGeom2d_HSequenceOfGeometry* GetObject() {
    return (TColGeom2d_HSequenceOfGeometry*)$self->Access();
    }
};
%feature("shadow") Handle_TColGeom2d_HSequenceOfGeometry::~Handle_TColGeom2d_HSequenceOfGeometry %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColGeom2d_HSequenceOfGeometry {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColGeom2d_SequenceNodeOfSequenceOfBoundedCurve;
class TColGeom2d_SequenceNodeOfSequenceOfBoundedCurve : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_Geom2d_BoundedCurve)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") TColGeom2d_SequenceNodeOfSequenceOfBoundedCurve;
		 TColGeom2d_SequenceNodeOfSequenceOfBoundedCurve (const Handle_Geom2d_BoundedCurve & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_BoundedCurve

No detailed docstring for this function.") Value;
		Handle_Geom2d_BoundedCurve & Value ();
};


%feature("shadow") TColGeom2d_SequenceNodeOfSequenceOfBoundedCurve::~TColGeom2d_SequenceNodeOfSequenceOfBoundedCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom2d_SequenceNodeOfSequenceOfBoundedCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColGeom2d_SequenceNodeOfSequenceOfBoundedCurve {
	Handle_TColGeom2d_SequenceNodeOfSequenceOfBoundedCurve GetHandle() {
	return *(Handle_TColGeom2d_SequenceNodeOfSequenceOfBoundedCurve*) &$self;
	}
};

%nodefaultctor Handle_TColGeom2d_SequenceNodeOfSequenceOfBoundedCurve;
class Handle_TColGeom2d_SequenceNodeOfSequenceOfBoundedCurve : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_TColGeom2d_SequenceNodeOfSequenceOfBoundedCurve();
        Handle_TColGeom2d_SequenceNodeOfSequenceOfBoundedCurve(const Handle_TColGeom2d_SequenceNodeOfSequenceOfBoundedCurve &aHandle);
        Handle_TColGeom2d_SequenceNodeOfSequenceOfBoundedCurve(const TColGeom2d_SequenceNodeOfSequenceOfBoundedCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColGeom2d_SequenceNodeOfSequenceOfBoundedCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom2d_SequenceNodeOfSequenceOfBoundedCurve {
    TColGeom2d_SequenceNodeOfSequenceOfBoundedCurve* GetObject() {
    return (TColGeom2d_SequenceNodeOfSequenceOfBoundedCurve*)$self->Access();
    }
};
%feature("shadow") Handle_TColGeom2d_SequenceNodeOfSequenceOfBoundedCurve::~Handle_TColGeom2d_SequenceNodeOfSequenceOfBoundedCurve %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColGeom2d_SequenceNodeOfSequenceOfBoundedCurve {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColGeom2d_SequenceNodeOfSequenceOfCurve;
class TColGeom2d_SequenceNodeOfSequenceOfCurve : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_Geom2d_Curve)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") TColGeom2d_SequenceNodeOfSequenceOfCurve;
		 TColGeom2d_SequenceNodeOfSequenceOfCurve (const Handle_Geom2d_Curve & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Curve

No detailed docstring for this function.") Value;
		Handle_Geom2d_Curve & Value ();
};


%feature("shadow") TColGeom2d_SequenceNodeOfSequenceOfCurve::~TColGeom2d_SequenceNodeOfSequenceOfCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom2d_SequenceNodeOfSequenceOfCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColGeom2d_SequenceNodeOfSequenceOfCurve {
	Handle_TColGeom2d_SequenceNodeOfSequenceOfCurve GetHandle() {
	return *(Handle_TColGeom2d_SequenceNodeOfSequenceOfCurve*) &$self;
	}
};

%nodefaultctor Handle_TColGeom2d_SequenceNodeOfSequenceOfCurve;
class Handle_TColGeom2d_SequenceNodeOfSequenceOfCurve : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_TColGeom2d_SequenceNodeOfSequenceOfCurve();
        Handle_TColGeom2d_SequenceNodeOfSequenceOfCurve(const Handle_TColGeom2d_SequenceNodeOfSequenceOfCurve &aHandle);
        Handle_TColGeom2d_SequenceNodeOfSequenceOfCurve(const TColGeom2d_SequenceNodeOfSequenceOfCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColGeom2d_SequenceNodeOfSequenceOfCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom2d_SequenceNodeOfSequenceOfCurve {
    TColGeom2d_SequenceNodeOfSequenceOfCurve* GetObject() {
    return (TColGeom2d_SequenceNodeOfSequenceOfCurve*)$self->Access();
    }
};
%feature("shadow") Handle_TColGeom2d_SequenceNodeOfSequenceOfCurve::~Handle_TColGeom2d_SequenceNodeOfSequenceOfCurve %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColGeom2d_SequenceNodeOfSequenceOfCurve {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColGeom2d_SequenceNodeOfSequenceOfGeometry;
class TColGeom2d_SequenceNodeOfSequenceOfGeometry : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_Geom2d_Geometry)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") TColGeom2d_SequenceNodeOfSequenceOfGeometry;
		 TColGeom2d_SequenceNodeOfSequenceOfGeometry (const Handle_Geom2d_Geometry & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Geometry

No detailed docstring for this function.") Value;
		Handle_Geom2d_Geometry & Value ();
};


%feature("shadow") TColGeom2d_SequenceNodeOfSequenceOfGeometry::~TColGeom2d_SequenceNodeOfSequenceOfGeometry %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom2d_SequenceNodeOfSequenceOfGeometry {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColGeom2d_SequenceNodeOfSequenceOfGeometry {
	Handle_TColGeom2d_SequenceNodeOfSequenceOfGeometry GetHandle() {
	return *(Handle_TColGeom2d_SequenceNodeOfSequenceOfGeometry*) &$self;
	}
};

%nodefaultctor Handle_TColGeom2d_SequenceNodeOfSequenceOfGeometry;
class Handle_TColGeom2d_SequenceNodeOfSequenceOfGeometry : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_TColGeom2d_SequenceNodeOfSequenceOfGeometry();
        Handle_TColGeom2d_SequenceNodeOfSequenceOfGeometry(const Handle_TColGeom2d_SequenceNodeOfSequenceOfGeometry &aHandle);
        Handle_TColGeom2d_SequenceNodeOfSequenceOfGeometry(const TColGeom2d_SequenceNodeOfSequenceOfGeometry *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColGeom2d_SequenceNodeOfSequenceOfGeometry DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom2d_SequenceNodeOfSequenceOfGeometry {
    TColGeom2d_SequenceNodeOfSequenceOfGeometry* GetObject() {
    return (TColGeom2d_SequenceNodeOfSequenceOfGeometry*)$self->Access();
    }
};
%feature("shadow") Handle_TColGeom2d_SequenceNodeOfSequenceOfGeometry::~Handle_TColGeom2d_SequenceNodeOfSequenceOfGeometry %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColGeom2d_SequenceNodeOfSequenceOfGeometry {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColGeom2d_SequenceOfBoundedCurve;
class TColGeom2d_SequenceOfBoundedCurve : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColGeom2d_SequenceOfBoundedCurve;
		 TColGeom2d_SequenceOfBoundedCurve ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(TColGeom2d_SequenceOfBoundedCurve)

Returns:
	TColGeom2d_SequenceOfBoundedCurve

No detailed docstring for this function.") Assign;
		const TColGeom2d_SequenceOfBoundedCurve & Assign (const TColGeom2d_SequenceOfBoundedCurve & Other);
		%feature("autodoc", "Args:
	Other(TColGeom2d_SequenceOfBoundedCurve)

Returns:
	TColGeom2d_SequenceOfBoundedCurve

No detailed docstring for this function.") operator=;
		const TColGeom2d_SequenceOfBoundedCurve & operator = (const TColGeom2d_SequenceOfBoundedCurve & Other);
		%feature("autodoc", "Args:
	T(Handle_Geom2d_BoundedCurve)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Geom2d_BoundedCurve & T);
		%feature("autodoc", "Args:
	S(TColGeom2d_SequenceOfBoundedCurve)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (TColGeom2d_SequenceOfBoundedCurve & S);
		%feature("autodoc", "Args:
	T(Handle_Geom2d_BoundedCurve)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Geom2d_BoundedCurve & T);
		%feature("autodoc", "Args:
	S(TColGeom2d_SequenceOfBoundedCurve)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (TColGeom2d_SequenceOfBoundedCurve & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Geom2d_BoundedCurve)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Geom2d_BoundedCurve & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(TColGeom2d_SequenceOfBoundedCurve)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TColGeom2d_SequenceOfBoundedCurve & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Geom2d_BoundedCurve)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Geom2d_BoundedCurve & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(TColGeom2d_SequenceOfBoundedCurve)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TColGeom2d_SequenceOfBoundedCurve & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_BoundedCurve

No detailed docstring for this function.") First;
		const Handle_Geom2d_BoundedCurve & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_BoundedCurve

No detailed docstring for this function.") Last;
		const Handle_Geom2d_BoundedCurve & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(TColGeom2d_SequenceOfBoundedCurve)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,TColGeom2d_SequenceOfBoundedCurve & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom2d_BoundedCurve

No detailed docstring for this function.") Value;
		const Handle_Geom2d_BoundedCurve & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_Geom2d_BoundedCurve)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom2d_BoundedCurve & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom2d_BoundedCurve

No detailed docstring for this function.") ChangeValue;
		Handle_Geom2d_BoundedCurve & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") TColGeom2d_SequenceOfBoundedCurve::~TColGeom2d_SequenceOfBoundedCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom2d_SequenceOfBoundedCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColGeom2d_SequenceOfCurve;
class TColGeom2d_SequenceOfCurve : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColGeom2d_SequenceOfCurve;
		 TColGeom2d_SequenceOfCurve ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(TColGeom2d_SequenceOfCurve)

Returns:
	TColGeom2d_SequenceOfCurve

No detailed docstring for this function.") Assign;
		const TColGeom2d_SequenceOfCurve & Assign (const TColGeom2d_SequenceOfCurve & Other);
		%feature("autodoc", "Args:
	Other(TColGeom2d_SequenceOfCurve)

Returns:
	TColGeom2d_SequenceOfCurve

No detailed docstring for this function.") operator=;
		const TColGeom2d_SequenceOfCurve & operator = (const TColGeom2d_SequenceOfCurve & Other);
		%feature("autodoc", "Args:
	T(Handle_Geom2d_Curve)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Geom2d_Curve & T);
		%feature("autodoc", "Args:
	S(TColGeom2d_SequenceOfCurve)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (TColGeom2d_SequenceOfCurve & S);
		%feature("autodoc", "Args:
	T(Handle_Geom2d_Curve)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Geom2d_Curve & T);
		%feature("autodoc", "Args:
	S(TColGeom2d_SequenceOfCurve)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (TColGeom2d_SequenceOfCurve & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Geom2d_Curve)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Geom2d_Curve & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(TColGeom2d_SequenceOfCurve)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TColGeom2d_SequenceOfCurve & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Geom2d_Curve)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Geom2d_Curve & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(TColGeom2d_SequenceOfCurve)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TColGeom2d_SequenceOfCurve & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Curve

No detailed docstring for this function.") First;
		const Handle_Geom2d_Curve & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Curve

No detailed docstring for this function.") Last;
		const Handle_Geom2d_Curve & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(TColGeom2d_SequenceOfCurve)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,TColGeom2d_SequenceOfCurve & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom2d_Curve

No detailed docstring for this function.") Value;
		const Handle_Geom2d_Curve & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_Geom2d_Curve)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom2d_Curve & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom2d_Curve

No detailed docstring for this function.") ChangeValue;
		Handle_Geom2d_Curve & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") TColGeom2d_SequenceOfCurve::~TColGeom2d_SequenceOfCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom2d_SequenceOfCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColGeom2d_SequenceOfGeometry;
class TColGeom2d_SequenceOfGeometry : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColGeom2d_SequenceOfGeometry;
		 TColGeom2d_SequenceOfGeometry ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(TColGeom2d_SequenceOfGeometry)

Returns:
	TColGeom2d_SequenceOfGeometry

No detailed docstring for this function.") Assign;
		const TColGeom2d_SequenceOfGeometry & Assign (const TColGeom2d_SequenceOfGeometry & Other);
		%feature("autodoc", "Args:
	Other(TColGeom2d_SequenceOfGeometry)

Returns:
	TColGeom2d_SequenceOfGeometry

No detailed docstring for this function.") operator=;
		const TColGeom2d_SequenceOfGeometry & operator = (const TColGeom2d_SequenceOfGeometry & Other);
		%feature("autodoc", "Args:
	T(Handle_Geom2d_Geometry)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Geom2d_Geometry & T);
		%feature("autodoc", "Args:
	S(TColGeom2d_SequenceOfGeometry)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (TColGeom2d_SequenceOfGeometry & S);
		%feature("autodoc", "Args:
	T(Handle_Geom2d_Geometry)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Geom2d_Geometry & T);
		%feature("autodoc", "Args:
	S(TColGeom2d_SequenceOfGeometry)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (TColGeom2d_SequenceOfGeometry & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Geom2d_Geometry)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Geom2d_Geometry & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(TColGeom2d_SequenceOfGeometry)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TColGeom2d_SequenceOfGeometry & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Geom2d_Geometry)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Geom2d_Geometry & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(TColGeom2d_SequenceOfGeometry)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TColGeom2d_SequenceOfGeometry & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Geometry

No detailed docstring for this function.") First;
		const Handle_Geom2d_Geometry & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Geometry

No detailed docstring for this function.") Last;
		const Handle_Geom2d_Geometry & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(TColGeom2d_SequenceOfGeometry)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,TColGeom2d_SequenceOfGeometry & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom2d_Geometry

No detailed docstring for this function.") Value;
		const Handle_Geom2d_Geometry & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_Geom2d_Geometry)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom2d_Geometry & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom2d_Geometry

No detailed docstring for this function.") ChangeValue;
		Handle_Geom2d_Geometry & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") TColGeom2d_SequenceOfGeometry::~TColGeom2d_SequenceOfGeometry %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom2d_SequenceOfGeometry {
	void _kill_pointed() {
		delete $self;
	}
};
