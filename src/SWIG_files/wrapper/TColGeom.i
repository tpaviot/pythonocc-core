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
%module TColGeom

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

%include TColGeom_required_python_modules.i
%include TColGeom_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor TColGeom_Array1OfBSplineCurve;
class TColGeom_Array1OfBSplineCurve {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColGeom_Array1OfBSplineCurve;
		 TColGeom_Array1OfBSplineCurve (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(Handle_Geom_BSplineCurve)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColGeom_Array1OfBSplineCurve;
		 TColGeom_Array1OfBSplineCurve (const Handle_Geom_BSplineCurve & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(Handle_Geom_BSplineCurve)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom_BSplineCurve & V);
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
	Other(TColGeom_Array1OfBSplineCurve)

Returns:
	TColGeom_Array1OfBSplineCurve

No detailed docstring for this function.") Assign;
		const TColGeom_Array1OfBSplineCurve & Assign (const TColGeom_Array1OfBSplineCurve & Other);
		%feature("autodoc", "Args:
	Other(TColGeom_Array1OfBSplineCurve)

Returns:
	TColGeom_Array1OfBSplineCurve

No detailed docstring for this function.") operator=;
		const TColGeom_Array1OfBSplineCurve & operator = (const TColGeom_Array1OfBSplineCurve & Other);
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
	Value(Handle_Geom_BSplineCurve)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom_BSplineCurve & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom_BSplineCurve

No detailed docstring for this function.") Value;
		const Handle_Geom_BSplineCurve & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom_BSplineCurve

No detailed docstring for this function.") ChangeValue;
		Handle_Geom_BSplineCurve & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") TColGeom_Array1OfBSplineCurve::~TColGeom_Array1OfBSplineCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom_Array1OfBSplineCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColGeom_Array1OfBezierCurve;
class TColGeom_Array1OfBezierCurve {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColGeom_Array1OfBezierCurve;
		 TColGeom_Array1OfBezierCurve (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(Handle_Geom_BezierCurve)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColGeom_Array1OfBezierCurve;
		 TColGeom_Array1OfBezierCurve (const Handle_Geom_BezierCurve & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(Handle_Geom_BezierCurve)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom_BezierCurve & V);
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
	Other(TColGeom_Array1OfBezierCurve)

Returns:
	TColGeom_Array1OfBezierCurve

No detailed docstring for this function.") Assign;
		const TColGeom_Array1OfBezierCurve & Assign (const TColGeom_Array1OfBezierCurve & Other);
		%feature("autodoc", "Args:
	Other(TColGeom_Array1OfBezierCurve)

Returns:
	TColGeom_Array1OfBezierCurve

No detailed docstring for this function.") operator=;
		const TColGeom_Array1OfBezierCurve & operator = (const TColGeom_Array1OfBezierCurve & Other);
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
	Value(Handle_Geom_BezierCurve)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom_BezierCurve & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom_BezierCurve

No detailed docstring for this function.") Value;
		const Handle_Geom_BezierCurve & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom_BezierCurve

No detailed docstring for this function.") ChangeValue;
		Handle_Geom_BezierCurve & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") TColGeom_Array1OfBezierCurve::~TColGeom_Array1OfBezierCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom_Array1OfBezierCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColGeom_Array1OfBoundedCurve;
class TColGeom_Array1OfBoundedCurve {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColGeom_Array1OfBoundedCurve;
		 TColGeom_Array1OfBoundedCurve (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(Handle_Geom_BoundedCurve)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColGeom_Array1OfBoundedCurve;
		 TColGeom_Array1OfBoundedCurve (const Handle_Geom_BoundedCurve & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(Handle_Geom_BoundedCurve)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom_BoundedCurve & V);
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
	Other(TColGeom_Array1OfBoundedCurve)

Returns:
	TColGeom_Array1OfBoundedCurve

No detailed docstring for this function.") Assign;
		const TColGeom_Array1OfBoundedCurve & Assign (const TColGeom_Array1OfBoundedCurve & Other);
		%feature("autodoc", "Args:
	Other(TColGeom_Array1OfBoundedCurve)

Returns:
	TColGeom_Array1OfBoundedCurve

No detailed docstring for this function.") operator=;
		const TColGeom_Array1OfBoundedCurve & operator = (const TColGeom_Array1OfBoundedCurve & Other);
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
	Value(Handle_Geom_BoundedCurve)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom_BoundedCurve & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom_BoundedCurve

No detailed docstring for this function.") Value;
		const Handle_Geom_BoundedCurve & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom_BoundedCurve

No detailed docstring for this function.") ChangeValue;
		Handle_Geom_BoundedCurve & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") TColGeom_Array1OfBoundedCurve::~TColGeom_Array1OfBoundedCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom_Array1OfBoundedCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColGeom_Array1OfBoundedSurface;
class TColGeom_Array1OfBoundedSurface {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColGeom_Array1OfBoundedSurface;
		 TColGeom_Array1OfBoundedSurface (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(Handle_Geom_BoundedSurface)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColGeom_Array1OfBoundedSurface;
		 TColGeom_Array1OfBoundedSurface (const Handle_Geom_BoundedSurface & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(Handle_Geom_BoundedSurface)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom_BoundedSurface & V);
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
	Other(TColGeom_Array1OfBoundedSurface)

Returns:
	TColGeom_Array1OfBoundedSurface

No detailed docstring for this function.") Assign;
		const TColGeom_Array1OfBoundedSurface & Assign (const TColGeom_Array1OfBoundedSurface & Other);
		%feature("autodoc", "Args:
	Other(TColGeom_Array1OfBoundedSurface)

Returns:
	TColGeom_Array1OfBoundedSurface

No detailed docstring for this function.") operator=;
		const TColGeom_Array1OfBoundedSurface & operator = (const TColGeom_Array1OfBoundedSurface & Other);
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
	Value(Handle_Geom_BoundedSurface)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom_BoundedSurface & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom_BoundedSurface

No detailed docstring for this function.") Value;
		const Handle_Geom_BoundedSurface & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom_BoundedSurface

No detailed docstring for this function.") ChangeValue;
		Handle_Geom_BoundedSurface & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") TColGeom_Array1OfBoundedSurface::~TColGeom_Array1OfBoundedSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom_Array1OfBoundedSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColGeom_Array1OfCurve;
class TColGeom_Array1OfCurve {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColGeom_Array1OfCurve;
		 TColGeom_Array1OfCurve (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(Handle_Geom_Curve)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColGeom_Array1OfCurve;
		 TColGeom_Array1OfCurve (const Handle_Geom_Curve & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(Handle_Geom_Curve)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom_Curve & V);
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
	Other(TColGeom_Array1OfCurve)

Returns:
	TColGeom_Array1OfCurve

No detailed docstring for this function.") Assign;
		const TColGeom_Array1OfCurve & Assign (const TColGeom_Array1OfCurve & Other);
		%feature("autodoc", "Args:
	Other(TColGeom_Array1OfCurve)

Returns:
	TColGeom_Array1OfCurve

No detailed docstring for this function.") operator=;
		const TColGeom_Array1OfCurve & operator = (const TColGeom_Array1OfCurve & Other);
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
	Value(Handle_Geom_Curve)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom_Curve & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom_Curve

No detailed docstring for this function.") Value;
		const Handle_Geom_Curve & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom_Curve

No detailed docstring for this function.") ChangeValue;
		Handle_Geom_Curve & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") TColGeom_Array1OfCurve::~TColGeom_Array1OfCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom_Array1OfCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColGeom_Array1OfSurface;
class TColGeom_Array1OfSurface {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColGeom_Array1OfSurface;
		 TColGeom_Array1OfSurface (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(Handle_Geom_Surface)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColGeom_Array1OfSurface;
		 TColGeom_Array1OfSurface (const Handle_Geom_Surface & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(Handle_Geom_Surface)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom_Surface & V);
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
	Other(TColGeom_Array1OfSurface)

Returns:
	TColGeom_Array1OfSurface

No detailed docstring for this function.") Assign;
		const TColGeom_Array1OfSurface & Assign (const TColGeom_Array1OfSurface & Other);
		%feature("autodoc", "Args:
	Other(TColGeom_Array1OfSurface)

Returns:
	TColGeom_Array1OfSurface

No detailed docstring for this function.") operator=;
		const TColGeom_Array1OfSurface & operator = (const TColGeom_Array1OfSurface & Other);
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
	Value(Handle_Geom_Surface)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom_Surface & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom_Surface

No detailed docstring for this function.") Value;
		const Handle_Geom_Surface & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom_Surface

No detailed docstring for this function.") ChangeValue;
		Handle_Geom_Surface & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") TColGeom_Array1OfSurface::~TColGeom_Array1OfSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom_Array1OfSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColGeom_Array2OfBSplineSurface;
class TColGeom_Array2OfBSplineSurface {
	public:
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColGeom_Array2OfBSplineSurface;
		 TColGeom_Array2OfBSplineSurface (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	Item(Handle_Geom_BSplineSurface)
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColGeom_Array2OfBSplineSurface;
		 TColGeom_Array2OfBSplineSurface (const Handle_Geom_BSplineSurface & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	V(Handle_Geom_BSplineSurface)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom_BSplineSurface & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	Other(TColGeom_Array2OfBSplineSurface)

Returns:
	TColGeom_Array2OfBSplineSurface

No detailed docstring for this function.") Assign;
		const TColGeom_Array2OfBSplineSurface & Assign (const TColGeom_Array2OfBSplineSurface & Other);
		%feature("autodoc", "Args:
	Other(TColGeom_Array2OfBSplineSurface)

Returns:
	TColGeom_Array2OfBSplineSurface

No detailed docstring for this function.") operator=;
		const TColGeom_Array2OfBSplineSurface & operator = (const TColGeom_Array2OfBSplineSurface & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") ColLength;
		Standard_Integer ColLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") RowLength;
		Standard_Integer RowLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)
	Value(Handle_Geom_BSplineSurface)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Handle_Geom_BSplineSurface & Value);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Handle_Geom_BSplineSurface

No detailed docstring for this function.") Value;
		const Handle_Geom_BSplineSurface & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Handle_Geom_BSplineSurface

No detailed docstring for this function.") ChangeValue;
		Handle_Geom_BSplineSurface & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%feature("shadow") TColGeom_Array2OfBSplineSurface::~TColGeom_Array2OfBSplineSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom_Array2OfBSplineSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColGeom_Array2OfBezierSurface;
class TColGeom_Array2OfBezierSurface {
	public:
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColGeom_Array2OfBezierSurface;
		 TColGeom_Array2OfBezierSurface (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	Item(Handle_Geom_BezierSurface)
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColGeom_Array2OfBezierSurface;
		 TColGeom_Array2OfBezierSurface (const Handle_Geom_BezierSurface & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	V(Handle_Geom_BezierSurface)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom_BezierSurface & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	Other(TColGeom_Array2OfBezierSurface)

Returns:
	TColGeom_Array2OfBezierSurface

No detailed docstring for this function.") Assign;
		const TColGeom_Array2OfBezierSurface & Assign (const TColGeom_Array2OfBezierSurface & Other);
		%feature("autodoc", "Args:
	Other(TColGeom_Array2OfBezierSurface)

Returns:
	TColGeom_Array2OfBezierSurface

No detailed docstring for this function.") operator=;
		const TColGeom_Array2OfBezierSurface & operator = (const TColGeom_Array2OfBezierSurface & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") ColLength;
		Standard_Integer ColLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") RowLength;
		Standard_Integer RowLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)
	Value(Handle_Geom_BezierSurface)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Handle_Geom_BezierSurface & Value);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Handle_Geom_BezierSurface

No detailed docstring for this function.") Value;
		const Handle_Geom_BezierSurface & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Handle_Geom_BezierSurface

No detailed docstring for this function.") ChangeValue;
		Handle_Geom_BezierSurface & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%feature("shadow") TColGeom_Array2OfBezierSurface::~TColGeom_Array2OfBezierSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom_Array2OfBezierSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColGeom_Array2OfBoundedSurface;
class TColGeom_Array2OfBoundedSurface {
	public:
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColGeom_Array2OfBoundedSurface;
		 TColGeom_Array2OfBoundedSurface (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	Item(Handle_Geom_BoundedSurface)
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColGeom_Array2OfBoundedSurface;
		 TColGeom_Array2OfBoundedSurface (const Handle_Geom_BoundedSurface & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	V(Handle_Geom_BoundedSurface)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom_BoundedSurface & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	Other(TColGeom_Array2OfBoundedSurface)

Returns:
	TColGeom_Array2OfBoundedSurface

No detailed docstring for this function.") Assign;
		const TColGeom_Array2OfBoundedSurface & Assign (const TColGeom_Array2OfBoundedSurface & Other);
		%feature("autodoc", "Args:
	Other(TColGeom_Array2OfBoundedSurface)

Returns:
	TColGeom_Array2OfBoundedSurface

No detailed docstring for this function.") operator=;
		const TColGeom_Array2OfBoundedSurface & operator = (const TColGeom_Array2OfBoundedSurface & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") ColLength;
		Standard_Integer ColLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") RowLength;
		Standard_Integer RowLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)
	Value(Handle_Geom_BoundedSurface)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Handle_Geom_BoundedSurface & Value);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Handle_Geom_BoundedSurface

No detailed docstring for this function.") Value;
		const Handle_Geom_BoundedSurface & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Handle_Geom_BoundedSurface

No detailed docstring for this function.") ChangeValue;
		Handle_Geom_BoundedSurface & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%feature("shadow") TColGeom_Array2OfBoundedSurface::~TColGeom_Array2OfBoundedSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom_Array2OfBoundedSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColGeom_Array2OfSurface;
class TColGeom_Array2OfSurface {
	public:
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColGeom_Array2OfSurface;
		 TColGeom_Array2OfSurface (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	Item(Handle_Geom_Surface)
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColGeom_Array2OfSurface;
		 TColGeom_Array2OfSurface (const Handle_Geom_Surface & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	V(Handle_Geom_Surface)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom_Surface & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	Other(TColGeom_Array2OfSurface)

Returns:
	TColGeom_Array2OfSurface

No detailed docstring for this function.") Assign;
		const TColGeom_Array2OfSurface & Assign (const TColGeom_Array2OfSurface & Other);
		%feature("autodoc", "Args:
	Other(TColGeom_Array2OfSurface)

Returns:
	TColGeom_Array2OfSurface

No detailed docstring for this function.") operator=;
		const TColGeom_Array2OfSurface & operator = (const TColGeom_Array2OfSurface & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") ColLength;
		Standard_Integer ColLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") RowLength;
		Standard_Integer RowLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)
	Value(Handle_Geom_Surface)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Handle_Geom_Surface & Value);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Handle_Geom_Surface

No detailed docstring for this function.") Value;
		const Handle_Geom_Surface & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Handle_Geom_Surface

No detailed docstring for this function.") ChangeValue;
		Handle_Geom_Surface & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%feature("shadow") TColGeom_Array2OfSurface::~TColGeom_Array2OfSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom_Array2OfSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColGeom_HArray1OfBSplineCurve;
class TColGeom_HArray1OfBSplineCurve : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColGeom_HArray1OfBSplineCurve;
		 TColGeom_HArray1OfBSplineCurve (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(Handle_Geom_BSplineCurve)

Returns:
	None

No detailed docstring for this function.") TColGeom_HArray1OfBSplineCurve;
		 TColGeom_HArray1OfBSplineCurve (const Standard_Integer Low,const Standard_Integer Up,const Handle_Geom_BSplineCurve & V);
		%feature("autodoc", "Args:
	V(Handle_Geom_BSplineCurve)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom_BSplineCurve & V);
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
	Value(Handle_Geom_BSplineCurve)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom_BSplineCurve & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom_BSplineCurve

No detailed docstring for this function.") Value;
		const Handle_Geom_BSplineCurve & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom_BSplineCurve

No detailed docstring for this function.") ChangeValue;
		Handle_Geom_BSplineCurve & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	TColGeom_Array1OfBSplineCurve

No detailed docstring for this function.") Array1;
		const TColGeom_Array1OfBSplineCurve & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	TColGeom_Array1OfBSplineCurve

No detailed docstring for this function.") ChangeArray1;
		TColGeom_Array1OfBSplineCurve & ChangeArray1 ();
};


%feature("shadow") TColGeom_HArray1OfBSplineCurve::~TColGeom_HArray1OfBSplineCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom_HArray1OfBSplineCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColGeom_HArray1OfBSplineCurve {
	Handle_TColGeom_HArray1OfBSplineCurve GetHandle() {
	return *(Handle_TColGeom_HArray1OfBSplineCurve*) &$self;
	}
};

%nodefaultctor Handle_TColGeom_HArray1OfBSplineCurve;
class Handle_TColGeom_HArray1OfBSplineCurve : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColGeom_HArray1OfBSplineCurve();
        Handle_TColGeom_HArray1OfBSplineCurve(const Handle_TColGeom_HArray1OfBSplineCurve &aHandle);
        Handle_TColGeom_HArray1OfBSplineCurve(const TColGeom_HArray1OfBSplineCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColGeom_HArray1OfBSplineCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom_HArray1OfBSplineCurve {
    TColGeom_HArray1OfBSplineCurve* GetObject() {
    return (TColGeom_HArray1OfBSplineCurve*)$self->Access();
    }
};
%feature("shadow") Handle_TColGeom_HArray1OfBSplineCurve::~Handle_TColGeom_HArray1OfBSplineCurve %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColGeom_HArray1OfBSplineCurve {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColGeom_HArray1OfBezierCurve;
class TColGeom_HArray1OfBezierCurve : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColGeom_HArray1OfBezierCurve;
		 TColGeom_HArray1OfBezierCurve (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(Handle_Geom_BezierCurve)

Returns:
	None

No detailed docstring for this function.") TColGeom_HArray1OfBezierCurve;
		 TColGeom_HArray1OfBezierCurve (const Standard_Integer Low,const Standard_Integer Up,const Handle_Geom_BezierCurve & V);
		%feature("autodoc", "Args:
	V(Handle_Geom_BezierCurve)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom_BezierCurve & V);
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
	Value(Handle_Geom_BezierCurve)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom_BezierCurve & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom_BezierCurve

No detailed docstring for this function.") Value;
		const Handle_Geom_BezierCurve & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom_BezierCurve

No detailed docstring for this function.") ChangeValue;
		Handle_Geom_BezierCurve & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	TColGeom_Array1OfBezierCurve

No detailed docstring for this function.") Array1;
		const TColGeom_Array1OfBezierCurve & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	TColGeom_Array1OfBezierCurve

No detailed docstring for this function.") ChangeArray1;
		TColGeom_Array1OfBezierCurve & ChangeArray1 ();
};


%feature("shadow") TColGeom_HArray1OfBezierCurve::~TColGeom_HArray1OfBezierCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom_HArray1OfBezierCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColGeom_HArray1OfBezierCurve {
	Handle_TColGeom_HArray1OfBezierCurve GetHandle() {
	return *(Handle_TColGeom_HArray1OfBezierCurve*) &$self;
	}
};

%nodefaultctor Handle_TColGeom_HArray1OfBezierCurve;
class Handle_TColGeom_HArray1OfBezierCurve : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColGeom_HArray1OfBezierCurve();
        Handle_TColGeom_HArray1OfBezierCurve(const Handle_TColGeom_HArray1OfBezierCurve &aHandle);
        Handle_TColGeom_HArray1OfBezierCurve(const TColGeom_HArray1OfBezierCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColGeom_HArray1OfBezierCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom_HArray1OfBezierCurve {
    TColGeom_HArray1OfBezierCurve* GetObject() {
    return (TColGeom_HArray1OfBezierCurve*)$self->Access();
    }
};
%feature("shadow") Handle_TColGeom_HArray1OfBezierCurve::~Handle_TColGeom_HArray1OfBezierCurve %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColGeom_HArray1OfBezierCurve {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColGeom_HArray1OfBoundedCurve;
class TColGeom_HArray1OfBoundedCurve : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColGeom_HArray1OfBoundedCurve;
		 TColGeom_HArray1OfBoundedCurve (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(Handle_Geom_BoundedCurve)

Returns:
	None

No detailed docstring for this function.") TColGeom_HArray1OfBoundedCurve;
		 TColGeom_HArray1OfBoundedCurve (const Standard_Integer Low,const Standard_Integer Up,const Handle_Geom_BoundedCurve & V);
		%feature("autodoc", "Args:
	V(Handle_Geom_BoundedCurve)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom_BoundedCurve & V);
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
	Value(Handle_Geom_BoundedCurve)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom_BoundedCurve & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom_BoundedCurve

No detailed docstring for this function.") Value;
		const Handle_Geom_BoundedCurve & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom_BoundedCurve

No detailed docstring for this function.") ChangeValue;
		Handle_Geom_BoundedCurve & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	TColGeom_Array1OfBoundedCurve

No detailed docstring for this function.") Array1;
		const TColGeom_Array1OfBoundedCurve & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	TColGeom_Array1OfBoundedCurve

No detailed docstring for this function.") ChangeArray1;
		TColGeom_Array1OfBoundedCurve & ChangeArray1 ();
};


%feature("shadow") TColGeom_HArray1OfBoundedCurve::~TColGeom_HArray1OfBoundedCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom_HArray1OfBoundedCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColGeom_HArray1OfBoundedCurve {
	Handle_TColGeom_HArray1OfBoundedCurve GetHandle() {
	return *(Handle_TColGeom_HArray1OfBoundedCurve*) &$self;
	}
};

%nodefaultctor Handle_TColGeom_HArray1OfBoundedCurve;
class Handle_TColGeom_HArray1OfBoundedCurve : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColGeom_HArray1OfBoundedCurve();
        Handle_TColGeom_HArray1OfBoundedCurve(const Handle_TColGeom_HArray1OfBoundedCurve &aHandle);
        Handle_TColGeom_HArray1OfBoundedCurve(const TColGeom_HArray1OfBoundedCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColGeom_HArray1OfBoundedCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom_HArray1OfBoundedCurve {
    TColGeom_HArray1OfBoundedCurve* GetObject() {
    return (TColGeom_HArray1OfBoundedCurve*)$self->Access();
    }
};
%feature("shadow") Handle_TColGeom_HArray1OfBoundedCurve::~Handle_TColGeom_HArray1OfBoundedCurve %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColGeom_HArray1OfBoundedCurve {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColGeom_HArray1OfBoundedSurface;
class TColGeom_HArray1OfBoundedSurface : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColGeom_HArray1OfBoundedSurface;
		 TColGeom_HArray1OfBoundedSurface (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(Handle_Geom_BoundedSurface)

Returns:
	None

No detailed docstring for this function.") TColGeom_HArray1OfBoundedSurface;
		 TColGeom_HArray1OfBoundedSurface (const Standard_Integer Low,const Standard_Integer Up,const Handle_Geom_BoundedSurface & V);
		%feature("autodoc", "Args:
	V(Handle_Geom_BoundedSurface)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom_BoundedSurface & V);
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
	Value(Handle_Geom_BoundedSurface)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom_BoundedSurface & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom_BoundedSurface

No detailed docstring for this function.") Value;
		const Handle_Geom_BoundedSurface & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom_BoundedSurface

No detailed docstring for this function.") ChangeValue;
		Handle_Geom_BoundedSurface & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	TColGeom_Array1OfBoundedSurface

No detailed docstring for this function.") Array1;
		const TColGeom_Array1OfBoundedSurface & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	TColGeom_Array1OfBoundedSurface

No detailed docstring for this function.") ChangeArray1;
		TColGeom_Array1OfBoundedSurface & ChangeArray1 ();
};


%feature("shadow") TColGeom_HArray1OfBoundedSurface::~TColGeom_HArray1OfBoundedSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom_HArray1OfBoundedSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColGeom_HArray1OfBoundedSurface {
	Handle_TColGeom_HArray1OfBoundedSurface GetHandle() {
	return *(Handle_TColGeom_HArray1OfBoundedSurface*) &$self;
	}
};

%nodefaultctor Handle_TColGeom_HArray1OfBoundedSurface;
class Handle_TColGeom_HArray1OfBoundedSurface : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColGeom_HArray1OfBoundedSurface();
        Handle_TColGeom_HArray1OfBoundedSurface(const Handle_TColGeom_HArray1OfBoundedSurface &aHandle);
        Handle_TColGeom_HArray1OfBoundedSurface(const TColGeom_HArray1OfBoundedSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColGeom_HArray1OfBoundedSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom_HArray1OfBoundedSurface {
    TColGeom_HArray1OfBoundedSurface* GetObject() {
    return (TColGeom_HArray1OfBoundedSurface*)$self->Access();
    }
};
%feature("shadow") Handle_TColGeom_HArray1OfBoundedSurface::~Handle_TColGeom_HArray1OfBoundedSurface %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColGeom_HArray1OfBoundedSurface {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColGeom_HArray1OfCurve;
class TColGeom_HArray1OfCurve : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColGeom_HArray1OfCurve;
		 TColGeom_HArray1OfCurve (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(Handle_Geom_Curve)

Returns:
	None

No detailed docstring for this function.") TColGeom_HArray1OfCurve;
		 TColGeom_HArray1OfCurve (const Standard_Integer Low,const Standard_Integer Up,const Handle_Geom_Curve & V);
		%feature("autodoc", "Args:
	V(Handle_Geom_Curve)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom_Curve & V);
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
	Value(Handle_Geom_Curve)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom_Curve & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom_Curve

No detailed docstring for this function.") Value;
		const Handle_Geom_Curve & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom_Curve

No detailed docstring for this function.") ChangeValue;
		Handle_Geom_Curve & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	TColGeom_Array1OfCurve

No detailed docstring for this function.") Array1;
		const TColGeom_Array1OfCurve & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	TColGeom_Array1OfCurve

No detailed docstring for this function.") ChangeArray1;
		TColGeom_Array1OfCurve & ChangeArray1 ();
};


%feature("shadow") TColGeom_HArray1OfCurve::~TColGeom_HArray1OfCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom_HArray1OfCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColGeom_HArray1OfCurve {
	Handle_TColGeom_HArray1OfCurve GetHandle() {
	return *(Handle_TColGeom_HArray1OfCurve*) &$self;
	}
};

%nodefaultctor Handle_TColGeom_HArray1OfCurve;
class Handle_TColGeom_HArray1OfCurve : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColGeom_HArray1OfCurve();
        Handle_TColGeom_HArray1OfCurve(const Handle_TColGeom_HArray1OfCurve &aHandle);
        Handle_TColGeom_HArray1OfCurve(const TColGeom_HArray1OfCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColGeom_HArray1OfCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom_HArray1OfCurve {
    TColGeom_HArray1OfCurve* GetObject() {
    return (TColGeom_HArray1OfCurve*)$self->Access();
    }
};
%feature("shadow") Handle_TColGeom_HArray1OfCurve::~Handle_TColGeom_HArray1OfCurve %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColGeom_HArray1OfCurve {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColGeom_HArray1OfSurface;
class TColGeom_HArray1OfSurface : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColGeom_HArray1OfSurface;
		 TColGeom_HArray1OfSurface (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(Handle_Geom_Surface)

Returns:
	None

No detailed docstring for this function.") TColGeom_HArray1OfSurface;
		 TColGeom_HArray1OfSurface (const Standard_Integer Low,const Standard_Integer Up,const Handle_Geom_Surface & V);
		%feature("autodoc", "Args:
	V(Handle_Geom_Surface)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom_Surface & V);
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
	Value(Handle_Geom_Surface)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom_Surface & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom_Surface

No detailed docstring for this function.") Value;
		const Handle_Geom_Surface & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom_Surface

No detailed docstring for this function.") ChangeValue;
		Handle_Geom_Surface & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	TColGeom_Array1OfSurface

No detailed docstring for this function.") Array1;
		const TColGeom_Array1OfSurface & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	TColGeom_Array1OfSurface

No detailed docstring for this function.") ChangeArray1;
		TColGeom_Array1OfSurface & ChangeArray1 ();
};


%feature("shadow") TColGeom_HArray1OfSurface::~TColGeom_HArray1OfSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom_HArray1OfSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColGeom_HArray1OfSurface {
	Handle_TColGeom_HArray1OfSurface GetHandle() {
	return *(Handle_TColGeom_HArray1OfSurface*) &$self;
	}
};

%nodefaultctor Handle_TColGeom_HArray1OfSurface;
class Handle_TColGeom_HArray1OfSurface : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColGeom_HArray1OfSurface();
        Handle_TColGeom_HArray1OfSurface(const Handle_TColGeom_HArray1OfSurface &aHandle);
        Handle_TColGeom_HArray1OfSurface(const TColGeom_HArray1OfSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColGeom_HArray1OfSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom_HArray1OfSurface {
    TColGeom_HArray1OfSurface* GetObject() {
    return (TColGeom_HArray1OfSurface*)$self->Access();
    }
};
%feature("shadow") Handle_TColGeom_HArray1OfSurface::~Handle_TColGeom_HArray1OfSurface %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColGeom_HArray1OfSurface {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColGeom_HArray2OfBSplineSurface;
class TColGeom_HArray2OfBSplineSurface : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColGeom_HArray2OfBSplineSurface;
		 TColGeom_HArray2OfBSplineSurface (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)
	V(Handle_Geom_BSplineSurface)

Returns:
	None

No detailed docstring for this function.") TColGeom_HArray2OfBSplineSurface;
		 TColGeom_HArray2OfBSplineSurface (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const Handle_Geom_BSplineSurface & V);
		%feature("autodoc", "Args:
	V(Handle_Geom_BSplineSurface)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom_BSplineSurface & V);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") ColLength;
		Standard_Integer ColLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") RowLength;
		Standard_Integer RowLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)
	Value(Handle_Geom_BSplineSurface)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Handle_Geom_BSplineSurface & Value);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Handle_Geom_BSplineSurface

No detailed docstring for this function.") Value;
		const Handle_Geom_BSplineSurface & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Handle_Geom_BSplineSurface

No detailed docstring for this function.") ChangeValue;
		Handle_Geom_BSplineSurface & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	None
Returns:
	TColGeom_Array2OfBSplineSurface

No detailed docstring for this function.") Array2;
		const TColGeom_Array2OfBSplineSurface & Array2 ();
		%feature("autodoc", "Args:
	None
Returns:
	TColGeom_Array2OfBSplineSurface

No detailed docstring for this function.") ChangeArray2;
		TColGeom_Array2OfBSplineSurface & ChangeArray2 ();
};


%feature("shadow") TColGeom_HArray2OfBSplineSurface::~TColGeom_HArray2OfBSplineSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom_HArray2OfBSplineSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColGeom_HArray2OfBSplineSurface {
	Handle_TColGeom_HArray2OfBSplineSurface GetHandle() {
	return *(Handle_TColGeom_HArray2OfBSplineSurface*) &$self;
	}
};

%nodefaultctor Handle_TColGeom_HArray2OfBSplineSurface;
class Handle_TColGeom_HArray2OfBSplineSurface : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColGeom_HArray2OfBSplineSurface();
        Handle_TColGeom_HArray2OfBSplineSurface(const Handle_TColGeom_HArray2OfBSplineSurface &aHandle);
        Handle_TColGeom_HArray2OfBSplineSurface(const TColGeom_HArray2OfBSplineSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColGeom_HArray2OfBSplineSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom_HArray2OfBSplineSurface {
    TColGeom_HArray2OfBSplineSurface* GetObject() {
    return (TColGeom_HArray2OfBSplineSurface*)$self->Access();
    }
};
%feature("shadow") Handle_TColGeom_HArray2OfBSplineSurface::~Handle_TColGeom_HArray2OfBSplineSurface %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColGeom_HArray2OfBSplineSurface {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColGeom_HArray2OfBezierSurface;
class TColGeom_HArray2OfBezierSurface : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColGeom_HArray2OfBezierSurface;
		 TColGeom_HArray2OfBezierSurface (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)
	V(Handle_Geom_BezierSurface)

Returns:
	None

No detailed docstring for this function.") TColGeom_HArray2OfBezierSurface;
		 TColGeom_HArray2OfBezierSurface (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const Handle_Geom_BezierSurface & V);
		%feature("autodoc", "Args:
	V(Handle_Geom_BezierSurface)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom_BezierSurface & V);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") ColLength;
		Standard_Integer ColLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") RowLength;
		Standard_Integer RowLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)
	Value(Handle_Geom_BezierSurface)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Handle_Geom_BezierSurface & Value);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Handle_Geom_BezierSurface

No detailed docstring for this function.") Value;
		const Handle_Geom_BezierSurface & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Handle_Geom_BezierSurface

No detailed docstring for this function.") ChangeValue;
		Handle_Geom_BezierSurface & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	None
Returns:
	TColGeom_Array2OfBezierSurface

No detailed docstring for this function.") Array2;
		const TColGeom_Array2OfBezierSurface & Array2 ();
		%feature("autodoc", "Args:
	None
Returns:
	TColGeom_Array2OfBezierSurface

No detailed docstring for this function.") ChangeArray2;
		TColGeom_Array2OfBezierSurface & ChangeArray2 ();
};


%feature("shadow") TColGeom_HArray2OfBezierSurface::~TColGeom_HArray2OfBezierSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom_HArray2OfBezierSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColGeom_HArray2OfBezierSurface {
	Handle_TColGeom_HArray2OfBezierSurface GetHandle() {
	return *(Handle_TColGeom_HArray2OfBezierSurface*) &$self;
	}
};

%nodefaultctor Handle_TColGeom_HArray2OfBezierSurface;
class Handle_TColGeom_HArray2OfBezierSurface : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColGeom_HArray2OfBezierSurface();
        Handle_TColGeom_HArray2OfBezierSurface(const Handle_TColGeom_HArray2OfBezierSurface &aHandle);
        Handle_TColGeom_HArray2OfBezierSurface(const TColGeom_HArray2OfBezierSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColGeom_HArray2OfBezierSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom_HArray2OfBezierSurface {
    TColGeom_HArray2OfBezierSurface* GetObject() {
    return (TColGeom_HArray2OfBezierSurface*)$self->Access();
    }
};
%feature("shadow") Handle_TColGeom_HArray2OfBezierSurface::~Handle_TColGeom_HArray2OfBezierSurface %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColGeom_HArray2OfBezierSurface {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColGeom_HArray2OfBoundedSurface;
class TColGeom_HArray2OfBoundedSurface : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColGeom_HArray2OfBoundedSurface;
		 TColGeom_HArray2OfBoundedSurface (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)
	V(Handle_Geom_BoundedSurface)

Returns:
	None

No detailed docstring for this function.") TColGeom_HArray2OfBoundedSurface;
		 TColGeom_HArray2OfBoundedSurface (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const Handle_Geom_BoundedSurface & V);
		%feature("autodoc", "Args:
	V(Handle_Geom_BoundedSurface)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom_BoundedSurface & V);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") ColLength;
		Standard_Integer ColLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") RowLength;
		Standard_Integer RowLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)
	Value(Handle_Geom_BoundedSurface)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Handle_Geom_BoundedSurface & Value);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Handle_Geom_BoundedSurface

No detailed docstring for this function.") Value;
		const Handle_Geom_BoundedSurface & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Handle_Geom_BoundedSurface

No detailed docstring for this function.") ChangeValue;
		Handle_Geom_BoundedSurface & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	None
Returns:
	TColGeom_Array2OfBoundedSurface

No detailed docstring for this function.") Array2;
		const TColGeom_Array2OfBoundedSurface & Array2 ();
		%feature("autodoc", "Args:
	None
Returns:
	TColGeom_Array2OfBoundedSurface

No detailed docstring for this function.") ChangeArray2;
		TColGeom_Array2OfBoundedSurface & ChangeArray2 ();
};


%feature("shadow") TColGeom_HArray2OfBoundedSurface::~TColGeom_HArray2OfBoundedSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom_HArray2OfBoundedSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColGeom_HArray2OfBoundedSurface {
	Handle_TColGeom_HArray2OfBoundedSurface GetHandle() {
	return *(Handle_TColGeom_HArray2OfBoundedSurface*) &$self;
	}
};

%nodefaultctor Handle_TColGeom_HArray2OfBoundedSurface;
class Handle_TColGeom_HArray2OfBoundedSurface : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColGeom_HArray2OfBoundedSurface();
        Handle_TColGeom_HArray2OfBoundedSurface(const Handle_TColGeom_HArray2OfBoundedSurface &aHandle);
        Handle_TColGeom_HArray2OfBoundedSurface(const TColGeom_HArray2OfBoundedSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColGeom_HArray2OfBoundedSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom_HArray2OfBoundedSurface {
    TColGeom_HArray2OfBoundedSurface* GetObject() {
    return (TColGeom_HArray2OfBoundedSurface*)$self->Access();
    }
};
%feature("shadow") Handle_TColGeom_HArray2OfBoundedSurface::~Handle_TColGeom_HArray2OfBoundedSurface %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColGeom_HArray2OfBoundedSurface {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColGeom_HArray2OfSurface;
class TColGeom_HArray2OfSurface : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TColGeom_HArray2OfSurface;
		 TColGeom_HArray2OfSurface (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)
	V(Handle_Geom_Surface)

Returns:
	None

No detailed docstring for this function.") TColGeom_HArray2OfSurface;
		 TColGeom_HArray2OfSurface (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const Handle_Geom_Surface & V);
		%feature("autodoc", "Args:
	V(Handle_Geom_Surface)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom_Surface & V);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") ColLength;
		Standard_Integer ColLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") RowLength;
		Standard_Integer RowLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)
	Value(Handle_Geom_Surface)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Handle_Geom_Surface & Value);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Handle_Geom_Surface

No detailed docstring for this function.") Value;
		const Handle_Geom_Surface & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Handle_Geom_Surface

No detailed docstring for this function.") ChangeValue;
		Handle_Geom_Surface & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	None
Returns:
	TColGeom_Array2OfSurface

No detailed docstring for this function.") Array2;
		const TColGeom_Array2OfSurface & Array2 ();
		%feature("autodoc", "Args:
	None
Returns:
	TColGeom_Array2OfSurface

No detailed docstring for this function.") ChangeArray2;
		TColGeom_Array2OfSurface & ChangeArray2 ();
};


%feature("shadow") TColGeom_HArray2OfSurface::~TColGeom_HArray2OfSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom_HArray2OfSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColGeom_HArray2OfSurface {
	Handle_TColGeom_HArray2OfSurface GetHandle() {
	return *(Handle_TColGeom_HArray2OfSurface*) &$self;
	}
};

%nodefaultctor Handle_TColGeom_HArray2OfSurface;
class Handle_TColGeom_HArray2OfSurface : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColGeom_HArray2OfSurface();
        Handle_TColGeom_HArray2OfSurface(const Handle_TColGeom_HArray2OfSurface &aHandle);
        Handle_TColGeom_HArray2OfSurface(const TColGeom_HArray2OfSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColGeom_HArray2OfSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom_HArray2OfSurface {
    TColGeom_HArray2OfSurface* GetObject() {
    return (TColGeom_HArray2OfSurface*)$self->Access();
    }
};
%feature("shadow") Handle_TColGeom_HArray2OfSurface::~Handle_TColGeom_HArray2OfSurface %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColGeom_HArray2OfSurface {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColGeom_HSequenceOfBoundedCurve;
class TColGeom_HSequenceOfBoundedCurve : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColGeom_HSequenceOfBoundedCurve;
		 TColGeom_HSequenceOfBoundedCurve ();
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
	anItem(Handle_Geom_BoundedCurve)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Geom_BoundedCurve & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_TColGeom_HSequenceOfBoundedCurve)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_TColGeom_HSequenceOfBoundedCurve & aSequence);
		%feature("autodoc", "Args:
	anItem(Handle_Geom_BoundedCurve)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Geom_BoundedCurve & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_TColGeom_HSequenceOfBoundedCurve)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_TColGeom_HSequenceOfBoundedCurve & aSequence);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Geom_BoundedCurve)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Geom_BoundedCurve & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_TColGeom_HSequenceOfBoundedCurve)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TColGeom_HSequenceOfBoundedCurve & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Geom_BoundedCurve)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Geom_BoundedCurve & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_TColGeom_HSequenceOfBoundedCurve)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TColGeom_HSequenceOfBoundedCurve & aSequence);
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
	Handle_TColGeom_HSequenceOfBoundedCurve

No detailed docstring for this function.") Split;
		Handle_TColGeom_HSequenceOfBoundedCurve Split (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Geom_BoundedCurve)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Geom_BoundedCurve & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Geom_BoundedCurve

No detailed docstring for this function.") Value;
		const Handle_Geom_BoundedCurve & Value (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Geom_BoundedCurve

No detailed docstring for this function.") ChangeValue;
		Handle_Geom_BoundedCurve & ChangeValue (const Standard_Integer anIndex);
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
	TColGeom_SequenceOfBoundedCurve

No detailed docstring for this function.") Sequence;
		const TColGeom_SequenceOfBoundedCurve & Sequence ();
		%feature("autodoc", "Args:
	None
Returns:
	TColGeom_SequenceOfBoundedCurve

No detailed docstring for this function.") ChangeSequence;
		TColGeom_SequenceOfBoundedCurve & ChangeSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColGeom_HSequenceOfBoundedCurve

No detailed docstring for this function.") ShallowCopy;
		Handle_TColGeom_HSequenceOfBoundedCurve ShallowCopy ();
};


%feature("shadow") TColGeom_HSequenceOfBoundedCurve::~TColGeom_HSequenceOfBoundedCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom_HSequenceOfBoundedCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColGeom_HSequenceOfBoundedCurve {
	Handle_TColGeom_HSequenceOfBoundedCurve GetHandle() {
	return *(Handle_TColGeom_HSequenceOfBoundedCurve*) &$self;
	}
};

%nodefaultctor Handle_TColGeom_HSequenceOfBoundedCurve;
class Handle_TColGeom_HSequenceOfBoundedCurve : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColGeom_HSequenceOfBoundedCurve();
        Handle_TColGeom_HSequenceOfBoundedCurve(const Handle_TColGeom_HSequenceOfBoundedCurve &aHandle);
        Handle_TColGeom_HSequenceOfBoundedCurve(const TColGeom_HSequenceOfBoundedCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColGeom_HSequenceOfBoundedCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom_HSequenceOfBoundedCurve {
    TColGeom_HSequenceOfBoundedCurve* GetObject() {
    return (TColGeom_HSequenceOfBoundedCurve*)$self->Access();
    }
};
%feature("shadow") Handle_TColGeom_HSequenceOfBoundedCurve::~Handle_TColGeom_HSequenceOfBoundedCurve %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColGeom_HSequenceOfBoundedCurve {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColGeom_HSequenceOfBoundedSurface;
class TColGeom_HSequenceOfBoundedSurface : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColGeom_HSequenceOfBoundedSurface;
		 TColGeom_HSequenceOfBoundedSurface ();
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
	anItem(Handle_Geom_BoundedSurface)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Geom_BoundedSurface & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_TColGeom_HSequenceOfBoundedSurface)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_TColGeom_HSequenceOfBoundedSurface & aSequence);
		%feature("autodoc", "Args:
	anItem(Handle_Geom_BoundedSurface)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Geom_BoundedSurface & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_TColGeom_HSequenceOfBoundedSurface)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_TColGeom_HSequenceOfBoundedSurface & aSequence);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Geom_BoundedSurface)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Geom_BoundedSurface & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_TColGeom_HSequenceOfBoundedSurface)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TColGeom_HSequenceOfBoundedSurface & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Geom_BoundedSurface)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Geom_BoundedSurface & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_TColGeom_HSequenceOfBoundedSurface)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TColGeom_HSequenceOfBoundedSurface & aSequence);
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
	Handle_TColGeom_HSequenceOfBoundedSurface

No detailed docstring for this function.") Split;
		Handle_TColGeom_HSequenceOfBoundedSurface Split (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Geom_BoundedSurface)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Geom_BoundedSurface & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Geom_BoundedSurface

No detailed docstring for this function.") Value;
		const Handle_Geom_BoundedSurface & Value (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Geom_BoundedSurface

No detailed docstring for this function.") ChangeValue;
		Handle_Geom_BoundedSurface & ChangeValue (const Standard_Integer anIndex);
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
	TColGeom_SequenceOfBoundedSurface

No detailed docstring for this function.") Sequence;
		const TColGeom_SequenceOfBoundedSurface & Sequence ();
		%feature("autodoc", "Args:
	None
Returns:
	TColGeom_SequenceOfBoundedSurface

No detailed docstring for this function.") ChangeSequence;
		TColGeom_SequenceOfBoundedSurface & ChangeSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColGeom_HSequenceOfBoundedSurface

No detailed docstring for this function.") ShallowCopy;
		Handle_TColGeom_HSequenceOfBoundedSurface ShallowCopy ();
};


%feature("shadow") TColGeom_HSequenceOfBoundedSurface::~TColGeom_HSequenceOfBoundedSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom_HSequenceOfBoundedSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColGeom_HSequenceOfBoundedSurface {
	Handle_TColGeom_HSequenceOfBoundedSurface GetHandle() {
	return *(Handle_TColGeom_HSequenceOfBoundedSurface*) &$self;
	}
};

%nodefaultctor Handle_TColGeom_HSequenceOfBoundedSurface;
class Handle_TColGeom_HSequenceOfBoundedSurface : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColGeom_HSequenceOfBoundedSurface();
        Handle_TColGeom_HSequenceOfBoundedSurface(const Handle_TColGeom_HSequenceOfBoundedSurface &aHandle);
        Handle_TColGeom_HSequenceOfBoundedSurface(const TColGeom_HSequenceOfBoundedSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColGeom_HSequenceOfBoundedSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom_HSequenceOfBoundedSurface {
    TColGeom_HSequenceOfBoundedSurface* GetObject() {
    return (TColGeom_HSequenceOfBoundedSurface*)$self->Access();
    }
};
%feature("shadow") Handle_TColGeom_HSequenceOfBoundedSurface::~Handle_TColGeom_HSequenceOfBoundedSurface %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColGeom_HSequenceOfBoundedSurface {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColGeom_HSequenceOfCurve;
class TColGeom_HSequenceOfCurve : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColGeom_HSequenceOfCurve;
		 TColGeom_HSequenceOfCurve ();
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
	anItem(Handle_Geom_Curve)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Geom_Curve & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_TColGeom_HSequenceOfCurve)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_TColGeom_HSequenceOfCurve & aSequence);
		%feature("autodoc", "Args:
	anItem(Handle_Geom_Curve)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Geom_Curve & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_TColGeom_HSequenceOfCurve)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_TColGeom_HSequenceOfCurve & aSequence);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Geom_Curve)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Geom_Curve & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_TColGeom_HSequenceOfCurve)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TColGeom_HSequenceOfCurve & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Geom_Curve)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Geom_Curve & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_TColGeom_HSequenceOfCurve)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TColGeom_HSequenceOfCurve & aSequence);
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
	Handle_TColGeom_HSequenceOfCurve

No detailed docstring for this function.") Split;
		Handle_TColGeom_HSequenceOfCurve Split (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Geom_Curve)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Geom_Curve & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Geom_Curve

No detailed docstring for this function.") Value;
		const Handle_Geom_Curve & Value (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Geom_Curve

No detailed docstring for this function.") ChangeValue;
		Handle_Geom_Curve & ChangeValue (const Standard_Integer anIndex);
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
	TColGeom_SequenceOfCurve

No detailed docstring for this function.") Sequence;
		const TColGeom_SequenceOfCurve & Sequence ();
		%feature("autodoc", "Args:
	None
Returns:
	TColGeom_SequenceOfCurve

No detailed docstring for this function.") ChangeSequence;
		TColGeom_SequenceOfCurve & ChangeSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColGeom_HSequenceOfCurve

No detailed docstring for this function.") ShallowCopy;
		Handle_TColGeom_HSequenceOfCurve ShallowCopy ();
};


%feature("shadow") TColGeom_HSequenceOfCurve::~TColGeom_HSequenceOfCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom_HSequenceOfCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColGeom_HSequenceOfCurve {
	Handle_TColGeom_HSequenceOfCurve GetHandle() {
	return *(Handle_TColGeom_HSequenceOfCurve*) &$self;
	}
};

%nodefaultctor Handle_TColGeom_HSequenceOfCurve;
class Handle_TColGeom_HSequenceOfCurve : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColGeom_HSequenceOfCurve();
        Handle_TColGeom_HSequenceOfCurve(const Handle_TColGeom_HSequenceOfCurve &aHandle);
        Handle_TColGeom_HSequenceOfCurve(const TColGeom_HSequenceOfCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColGeom_HSequenceOfCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom_HSequenceOfCurve {
    TColGeom_HSequenceOfCurve* GetObject() {
    return (TColGeom_HSequenceOfCurve*)$self->Access();
    }
};
%feature("shadow") Handle_TColGeom_HSequenceOfCurve::~Handle_TColGeom_HSequenceOfCurve %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColGeom_HSequenceOfCurve {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColGeom_HSequenceOfSurface;
class TColGeom_HSequenceOfSurface : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColGeom_HSequenceOfSurface;
		 TColGeom_HSequenceOfSurface ();
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
	anItem(Handle_Geom_Surface)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Geom_Surface & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_TColGeom_HSequenceOfSurface)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_TColGeom_HSequenceOfSurface & aSequence);
		%feature("autodoc", "Args:
	anItem(Handle_Geom_Surface)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Geom_Surface & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_TColGeom_HSequenceOfSurface)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_TColGeom_HSequenceOfSurface & aSequence);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Geom_Surface)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Geom_Surface & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_TColGeom_HSequenceOfSurface)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TColGeom_HSequenceOfSurface & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Geom_Surface)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Geom_Surface & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_TColGeom_HSequenceOfSurface)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TColGeom_HSequenceOfSurface & aSequence);
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
	Handle_TColGeom_HSequenceOfSurface

No detailed docstring for this function.") Split;
		Handle_TColGeom_HSequenceOfSurface Split (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Geom_Surface)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Geom_Surface & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Geom_Surface

No detailed docstring for this function.") Value;
		const Handle_Geom_Surface & Value (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Geom_Surface

No detailed docstring for this function.") ChangeValue;
		Handle_Geom_Surface & ChangeValue (const Standard_Integer anIndex);
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
	TColGeom_SequenceOfSurface

No detailed docstring for this function.") Sequence;
		const TColGeom_SequenceOfSurface & Sequence ();
		%feature("autodoc", "Args:
	None
Returns:
	TColGeom_SequenceOfSurface

No detailed docstring for this function.") ChangeSequence;
		TColGeom_SequenceOfSurface & ChangeSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColGeom_HSequenceOfSurface

No detailed docstring for this function.") ShallowCopy;
		Handle_TColGeom_HSequenceOfSurface ShallowCopy ();
};


%feature("shadow") TColGeom_HSequenceOfSurface::~TColGeom_HSequenceOfSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom_HSequenceOfSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColGeom_HSequenceOfSurface {
	Handle_TColGeom_HSequenceOfSurface GetHandle() {
	return *(Handle_TColGeom_HSequenceOfSurface*) &$self;
	}
};

%nodefaultctor Handle_TColGeom_HSequenceOfSurface;
class Handle_TColGeom_HSequenceOfSurface : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TColGeom_HSequenceOfSurface();
        Handle_TColGeom_HSequenceOfSurface(const Handle_TColGeom_HSequenceOfSurface &aHandle);
        Handle_TColGeom_HSequenceOfSurface(const TColGeom_HSequenceOfSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColGeom_HSequenceOfSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom_HSequenceOfSurface {
    TColGeom_HSequenceOfSurface* GetObject() {
    return (TColGeom_HSequenceOfSurface*)$self->Access();
    }
};
%feature("shadow") Handle_TColGeom_HSequenceOfSurface::~Handle_TColGeom_HSequenceOfSurface %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColGeom_HSequenceOfSurface {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColGeom_SequenceNodeOfSequenceOfBoundedCurve;
class TColGeom_SequenceNodeOfSequenceOfBoundedCurve : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_Geom_BoundedCurve)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") TColGeom_SequenceNodeOfSequenceOfBoundedCurve;
		 TColGeom_SequenceNodeOfSequenceOfBoundedCurve (const Handle_Geom_BoundedCurve & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_BoundedCurve

No detailed docstring for this function.") Value;
		Handle_Geom_BoundedCurve & Value ();
};


%feature("shadow") TColGeom_SequenceNodeOfSequenceOfBoundedCurve::~TColGeom_SequenceNodeOfSequenceOfBoundedCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom_SequenceNodeOfSequenceOfBoundedCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColGeom_SequenceNodeOfSequenceOfBoundedCurve {
	Handle_TColGeom_SequenceNodeOfSequenceOfBoundedCurve GetHandle() {
	return *(Handle_TColGeom_SequenceNodeOfSequenceOfBoundedCurve*) &$self;
	}
};

%nodefaultctor Handle_TColGeom_SequenceNodeOfSequenceOfBoundedCurve;
class Handle_TColGeom_SequenceNodeOfSequenceOfBoundedCurve : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_TColGeom_SequenceNodeOfSequenceOfBoundedCurve();
        Handle_TColGeom_SequenceNodeOfSequenceOfBoundedCurve(const Handle_TColGeom_SequenceNodeOfSequenceOfBoundedCurve &aHandle);
        Handle_TColGeom_SequenceNodeOfSequenceOfBoundedCurve(const TColGeom_SequenceNodeOfSequenceOfBoundedCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColGeom_SequenceNodeOfSequenceOfBoundedCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom_SequenceNodeOfSequenceOfBoundedCurve {
    TColGeom_SequenceNodeOfSequenceOfBoundedCurve* GetObject() {
    return (TColGeom_SequenceNodeOfSequenceOfBoundedCurve*)$self->Access();
    }
};
%feature("shadow") Handle_TColGeom_SequenceNodeOfSequenceOfBoundedCurve::~Handle_TColGeom_SequenceNodeOfSequenceOfBoundedCurve %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColGeom_SequenceNodeOfSequenceOfBoundedCurve {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColGeom_SequenceNodeOfSequenceOfBoundedSurface;
class TColGeom_SequenceNodeOfSequenceOfBoundedSurface : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_Geom_BoundedSurface)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") TColGeom_SequenceNodeOfSequenceOfBoundedSurface;
		 TColGeom_SequenceNodeOfSequenceOfBoundedSurface (const Handle_Geom_BoundedSurface & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_BoundedSurface

No detailed docstring for this function.") Value;
		Handle_Geom_BoundedSurface & Value ();
};


%feature("shadow") TColGeom_SequenceNodeOfSequenceOfBoundedSurface::~TColGeom_SequenceNodeOfSequenceOfBoundedSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom_SequenceNodeOfSequenceOfBoundedSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColGeom_SequenceNodeOfSequenceOfBoundedSurface {
	Handle_TColGeom_SequenceNodeOfSequenceOfBoundedSurface GetHandle() {
	return *(Handle_TColGeom_SequenceNodeOfSequenceOfBoundedSurface*) &$self;
	}
};

%nodefaultctor Handle_TColGeom_SequenceNodeOfSequenceOfBoundedSurface;
class Handle_TColGeom_SequenceNodeOfSequenceOfBoundedSurface : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_TColGeom_SequenceNodeOfSequenceOfBoundedSurface();
        Handle_TColGeom_SequenceNodeOfSequenceOfBoundedSurface(const Handle_TColGeom_SequenceNodeOfSequenceOfBoundedSurface &aHandle);
        Handle_TColGeom_SequenceNodeOfSequenceOfBoundedSurface(const TColGeom_SequenceNodeOfSequenceOfBoundedSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColGeom_SequenceNodeOfSequenceOfBoundedSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom_SequenceNodeOfSequenceOfBoundedSurface {
    TColGeom_SequenceNodeOfSequenceOfBoundedSurface* GetObject() {
    return (TColGeom_SequenceNodeOfSequenceOfBoundedSurface*)$self->Access();
    }
};
%feature("shadow") Handle_TColGeom_SequenceNodeOfSequenceOfBoundedSurface::~Handle_TColGeom_SequenceNodeOfSequenceOfBoundedSurface %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColGeom_SequenceNodeOfSequenceOfBoundedSurface {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColGeom_SequenceNodeOfSequenceOfCurve;
class TColGeom_SequenceNodeOfSequenceOfCurve : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_Geom_Curve)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") TColGeom_SequenceNodeOfSequenceOfCurve;
		 TColGeom_SequenceNodeOfSequenceOfCurve (const Handle_Geom_Curve & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Curve

No detailed docstring for this function.") Value;
		Handle_Geom_Curve & Value ();
};


%feature("shadow") TColGeom_SequenceNodeOfSequenceOfCurve::~TColGeom_SequenceNodeOfSequenceOfCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom_SequenceNodeOfSequenceOfCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColGeom_SequenceNodeOfSequenceOfCurve {
	Handle_TColGeom_SequenceNodeOfSequenceOfCurve GetHandle() {
	return *(Handle_TColGeom_SequenceNodeOfSequenceOfCurve*) &$self;
	}
};

%nodefaultctor Handle_TColGeom_SequenceNodeOfSequenceOfCurve;
class Handle_TColGeom_SequenceNodeOfSequenceOfCurve : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_TColGeom_SequenceNodeOfSequenceOfCurve();
        Handle_TColGeom_SequenceNodeOfSequenceOfCurve(const Handle_TColGeom_SequenceNodeOfSequenceOfCurve &aHandle);
        Handle_TColGeom_SequenceNodeOfSequenceOfCurve(const TColGeom_SequenceNodeOfSequenceOfCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColGeom_SequenceNodeOfSequenceOfCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom_SequenceNodeOfSequenceOfCurve {
    TColGeom_SequenceNodeOfSequenceOfCurve* GetObject() {
    return (TColGeom_SequenceNodeOfSequenceOfCurve*)$self->Access();
    }
};
%feature("shadow") Handle_TColGeom_SequenceNodeOfSequenceOfCurve::~Handle_TColGeom_SequenceNodeOfSequenceOfCurve %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColGeom_SequenceNodeOfSequenceOfCurve {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColGeom_SequenceNodeOfSequenceOfSurface;
class TColGeom_SequenceNodeOfSequenceOfSurface : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_Geom_Surface)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") TColGeom_SequenceNodeOfSequenceOfSurface;
		 TColGeom_SequenceNodeOfSequenceOfSurface (const Handle_Geom_Surface & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Surface

No detailed docstring for this function.") Value;
		Handle_Geom_Surface & Value ();
};


%feature("shadow") TColGeom_SequenceNodeOfSequenceOfSurface::~TColGeom_SequenceNodeOfSequenceOfSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom_SequenceNodeOfSequenceOfSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TColGeom_SequenceNodeOfSequenceOfSurface {
	Handle_TColGeom_SequenceNodeOfSequenceOfSurface GetHandle() {
	return *(Handle_TColGeom_SequenceNodeOfSequenceOfSurface*) &$self;
	}
};

%nodefaultctor Handle_TColGeom_SequenceNodeOfSequenceOfSurface;
class Handle_TColGeom_SequenceNodeOfSequenceOfSurface : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_TColGeom_SequenceNodeOfSequenceOfSurface();
        Handle_TColGeom_SequenceNodeOfSequenceOfSurface(const Handle_TColGeom_SequenceNodeOfSequenceOfSurface &aHandle);
        Handle_TColGeom_SequenceNodeOfSequenceOfSurface(const TColGeom_SequenceNodeOfSequenceOfSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TColGeom_SequenceNodeOfSequenceOfSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom_SequenceNodeOfSequenceOfSurface {
    TColGeom_SequenceNodeOfSequenceOfSurface* GetObject() {
    return (TColGeom_SequenceNodeOfSequenceOfSurface*)$self->Access();
    }
};
%feature("shadow") Handle_TColGeom_SequenceNodeOfSequenceOfSurface::~Handle_TColGeom_SequenceNodeOfSequenceOfSurface %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TColGeom_SequenceNodeOfSequenceOfSurface {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TColGeom_SequenceOfBoundedCurve;
class TColGeom_SequenceOfBoundedCurve : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColGeom_SequenceOfBoundedCurve;
		 TColGeom_SequenceOfBoundedCurve ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(TColGeom_SequenceOfBoundedCurve)

Returns:
	TColGeom_SequenceOfBoundedCurve

No detailed docstring for this function.") Assign;
		const TColGeom_SequenceOfBoundedCurve & Assign (const TColGeom_SequenceOfBoundedCurve & Other);
		%feature("autodoc", "Args:
	Other(TColGeom_SequenceOfBoundedCurve)

Returns:
	TColGeom_SequenceOfBoundedCurve

No detailed docstring for this function.") operator=;
		const TColGeom_SequenceOfBoundedCurve & operator = (const TColGeom_SequenceOfBoundedCurve & Other);
		%feature("autodoc", "Args:
	T(Handle_Geom_BoundedCurve)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Geom_BoundedCurve & T);
		%feature("autodoc", "Args:
	S(TColGeom_SequenceOfBoundedCurve)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (TColGeom_SequenceOfBoundedCurve & S);
		%feature("autodoc", "Args:
	T(Handle_Geom_BoundedCurve)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Geom_BoundedCurve & T);
		%feature("autodoc", "Args:
	S(TColGeom_SequenceOfBoundedCurve)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (TColGeom_SequenceOfBoundedCurve & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Geom_BoundedCurve)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Geom_BoundedCurve & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(TColGeom_SequenceOfBoundedCurve)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TColGeom_SequenceOfBoundedCurve & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Geom_BoundedCurve)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Geom_BoundedCurve & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(TColGeom_SequenceOfBoundedCurve)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TColGeom_SequenceOfBoundedCurve & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_BoundedCurve

No detailed docstring for this function.") First;
		const Handle_Geom_BoundedCurve & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_BoundedCurve

No detailed docstring for this function.") Last;
		const Handle_Geom_BoundedCurve & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(TColGeom_SequenceOfBoundedCurve)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,TColGeom_SequenceOfBoundedCurve & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom_BoundedCurve

No detailed docstring for this function.") Value;
		const Handle_Geom_BoundedCurve & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_Geom_BoundedCurve)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom_BoundedCurve & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom_BoundedCurve

No detailed docstring for this function.") ChangeValue;
		Handle_Geom_BoundedCurve & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") TColGeom_SequenceOfBoundedCurve::~TColGeom_SequenceOfBoundedCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom_SequenceOfBoundedCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColGeom_SequenceOfBoundedSurface;
class TColGeom_SequenceOfBoundedSurface : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColGeom_SequenceOfBoundedSurface;
		 TColGeom_SequenceOfBoundedSurface ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(TColGeom_SequenceOfBoundedSurface)

Returns:
	TColGeom_SequenceOfBoundedSurface

No detailed docstring for this function.") Assign;
		const TColGeom_SequenceOfBoundedSurface & Assign (const TColGeom_SequenceOfBoundedSurface & Other);
		%feature("autodoc", "Args:
	Other(TColGeom_SequenceOfBoundedSurface)

Returns:
	TColGeom_SequenceOfBoundedSurface

No detailed docstring for this function.") operator=;
		const TColGeom_SequenceOfBoundedSurface & operator = (const TColGeom_SequenceOfBoundedSurface & Other);
		%feature("autodoc", "Args:
	T(Handle_Geom_BoundedSurface)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Geom_BoundedSurface & T);
		%feature("autodoc", "Args:
	S(TColGeom_SequenceOfBoundedSurface)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (TColGeom_SequenceOfBoundedSurface & S);
		%feature("autodoc", "Args:
	T(Handle_Geom_BoundedSurface)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Geom_BoundedSurface & T);
		%feature("autodoc", "Args:
	S(TColGeom_SequenceOfBoundedSurface)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (TColGeom_SequenceOfBoundedSurface & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Geom_BoundedSurface)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Geom_BoundedSurface & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(TColGeom_SequenceOfBoundedSurface)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TColGeom_SequenceOfBoundedSurface & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Geom_BoundedSurface)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Geom_BoundedSurface & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(TColGeom_SequenceOfBoundedSurface)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TColGeom_SequenceOfBoundedSurface & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_BoundedSurface

No detailed docstring for this function.") First;
		const Handle_Geom_BoundedSurface & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_BoundedSurface

No detailed docstring for this function.") Last;
		const Handle_Geom_BoundedSurface & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(TColGeom_SequenceOfBoundedSurface)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,TColGeom_SequenceOfBoundedSurface & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom_BoundedSurface

No detailed docstring for this function.") Value;
		const Handle_Geom_BoundedSurface & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_Geom_BoundedSurface)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom_BoundedSurface & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom_BoundedSurface

No detailed docstring for this function.") ChangeValue;
		Handle_Geom_BoundedSurface & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") TColGeom_SequenceOfBoundedSurface::~TColGeom_SequenceOfBoundedSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom_SequenceOfBoundedSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColGeom_SequenceOfCurve;
class TColGeom_SequenceOfCurve : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColGeom_SequenceOfCurve;
		 TColGeom_SequenceOfCurve ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(TColGeom_SequenceOfCurve)

Returns:
	TColGeom_SequenceOfCurve

No detailed docstring for this function.") Assign;
		const TColGeom_SequenceOfCurve & Assign (const TColGeom_SequenceOfCurve & Other);
		%feature("autodoc", "Args:
	Other(TColGeom_SequenceOfCurve)

Returns:
	TColGeom_SequenceOfCurve

No detailed docstring for this function.") operator=;
		const TColGeom_SequenceOfCurve & operator = (const TColGeom_SequenceOfCurve & Other);
		%feature("autodoc", "Args:
	T(Handle_Geom_Curve)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Geom_Curve & T);
		%feature("autodoc", "Args:
	S(TColGeom_SequenceOfCurve)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (TColGeom_SequenceOfCurve & S);
		%feature("autodoc", "Args:
	T(Handle_Geom_Curve)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Geom_Curve & T);
		%feature("autodoc", "Args:
	S(TColGeom_SequenceOfCurve)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (TColGeom_SequenceOfCurve & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Geom_Curve)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Geom_Curve & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(TColGeom_SequenceOfCurve)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TColGeom_SequenceOfCurve & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Geom_Curve)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Geom_Curve & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(TColGeom_SequenceOfCurve)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TColGeom_SequenceOfCurve & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Curve

No detailed docstring for this function.") First;
		const Handle_Geom_Curve & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Curve

No detailed docstring for this function.") Last;
		const Handle_Geom_Curve & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(TColGeom_SequenceOfCurve)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,TColGeom_SequenceOfCurve & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom_Curve

No detailed docstring for this function.") Value;
		const Handle_Geom_Curve & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_Geom_Curve)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom_Curve & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom_Curve

No detailed docstring for this function.") ChangeValue;
		Handle_Geom_Curve & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") TColGeom_SequenceOfCurve::~TColGeom_SequenceOfCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom_SequenceOfCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TColGeom_SequenceOfSurface;
class TColGeom_SequenceOfSurface : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TColGeom_SequenceOfSurface;
		 TColGeom_SequenceOfSurface ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(TColGeom_SequenceOfSurface)

Returns:
	TColGeom_SequenceOfSurface

No detailed docstring for this function.") Assign;
		const TColGeom_SequenceOfSurface & Assign (const TColGeom_SequenceOfSurface & Other);
		%feature("autodoc", "Args:
	Other(TColGeom_SequenceOfSurface)

Returns:
	TColGeom_SequenceOfSurface

No detailed docstring for this function.") operator=;
		const TColGeom_SequenceOfSurface & operator = (const TColGeom_SequenceOfSurface & Other);
		%feature("autodoc", "Args:
	T(Handle_Geom_Surface)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Geom_Surface & T);
		%feature("autodoc", "Args:
	S(TColGeom_SequenceOfSurface)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (TColGeom_SequenceOfSurface & S);
		%feature("autodoc", "Args:
	T(Handle_Geom_Surface)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Geom_Surface & T);
		%feature("autodoc", "Args:
	S(TColGeom_SequenceOfSurface)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (TColGeom_SequenceOfSurface & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Geom_Surface)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Geom_Surface & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(TColGeom_SequenceOfSurface)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TColGeom_SequenceOfSurface & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Geom_Surface)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Geom_Surface & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(TColGeom_SequenceOfSurface)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TColGeom_SequenceOfSurface & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Surface

No detailed docstring for this function.") First;
		const Handle_Geom_Surface & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Surface

No detailed docstring for this function.") Last;
		const Handle_Geom_Surface & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(TColGeom_SequenceOfSurface)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,TColGeom_SequenceOfSurface & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom_Surface

No detailed docstring for this function.") Value;
		const Handle_Geom_Surface & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_Geom_Surface)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom_Surface & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom_Surface

No detailed docstring for this function.") ChangeValue;
		Handle_Geom_Surface & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") TColGeom_SequenceOfSurface::~TColGeom_SequenceOfSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TColGeom_SequenceOfSurface {
	void _kill_pointed() {
		delete $self;
	}
};
