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
%module (package="OCC") TColGeom

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

%include TColGeom_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor TColGeom_Array1OfBSplineCurve;
class TColGeom_Array1OfBSplineCurve {
	public:
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") TColGeom_Array1OfBSplineCurve;
		 TColGeom_Array1OfBSplineCurve (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Item:
	:type Item: Handle_Geom_BSplineCurve &
	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") TColGeom_Array1OfBSplineCurve;
		 TColGeom_Array1OfBSplineCurve (const Handle_Geom_BSplineCurve & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param V:
	:type V: Handle_Geom_BSplineCurve &
	:rtype: None
") Init;
		void Init (const Handle_Geom_BSplineCurve & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom_Array1OfBSplineCurve &
	:rtype: TColGeom_Array1OfBSplineCurve
") Assign;
		const TColGeom_Array1OfBSplineCurve & Assign (const TColGeom_Array1OfBSplineCurve & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom_Array1OfBSplineCurve &
	:rtype: TColGeom_Array1OfBSplineCurve
") operator=;
		const TColGeom_Array1OfBSplineCurve & operator = (const TColGeom_Array1OfBSplineCurve & Other);
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Value:
	:type Value: Handle_Geom_BSplineCurve &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom_BSplineCurve & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Geom_BSplineCurve
") Value;
		const Handle_Geom_BSplineCurve & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Geom_BSplineCurve
") ChangeValue;
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
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") TColGeom_Array1OfBezierCurve;
		 TColGeom_Array1OfBezierCurve (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Item:
	:type Item: Handle_Geom_BezierCurve &
	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") TColGeom_Array1OfBezierCurve;
		 TColGeom_Array1OfBezierCurve (const Handle_Geom_BezierCurve & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param V:
	:type V: Handle_Geom_BezierCurve &
	:rtype: None
") Init;
		void Init (const Handle_Geom_BezierCurve & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom_Array1OfBezierCurve &
	:rtype: TColGeom_Array1OfBezierCurve
") Assign;
		const TColGeom_Array1OfBezierCurve & Assign (const TColGeom_Array1OfBezierCurve & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom_Array1OfBezierCurve &
	:rtype: TColGeom_Array1OfBezierCurve
") operator=;
		const TColGeom_Array1OfBezierCurve & operator = (const TColGeom_Array1OfBezierCurve & Other);
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Value:
	:type Value: Handle_Geom_BezierCurve &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom_BezierCurve & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Geom_BezierCurve
") Value;
		const Handle_Geom_BezierCurve & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Geom_BezierCurve
") ChangeValue;
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
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") TColGeom_Array1OfBoundedCurve;
		 TColGeom_Array1OfBoundedCurve (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Item:
	:type Item: Handle_Geom_BoundedCurve &
	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") TColGeom_Array1OfBoundedCurve;
		 TColGeom_Array1OfBoundedCurve (const Handle_Geom_BoundedCurve & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param V:
	:type V: Handle_Geom_BoundedCurve &
	:rtype: None
") Init;
		void Init (const Handle_Geom_BoundedCurve & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom_Array1OfBoundedCurve &
	:rtype: TColGeom_Array1OfBoundedCurve
") Assign;
		const TColGeom_Array1OfBoundedCurve & Assign (const TColGeom_Array1OfBoundedCurve & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom_Array1OfBoundedCurve &
	:rtype: TColGeom_Array1OfBoundedCurve
") operator=;
		const TColGeom_Array1OfBoundedCurve & operator = (const TColGeom_Array1OfBoundedCurve & Other);
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Value:
	:type Value: Handle_Geom_BoundedCurve &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom_BoundedCurve & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Geom_BoundedCurve
") Value;
		const Handle_Geom_BoundedCurve & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Geom_BoundedCurve
") ChangeValue;
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
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") TColGeom_Array1OfBoundedSurface;
		 TColGeom_Array1OfBoundedSurface (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Item:
	:type Item: Handle_Geom_BoundedSurface &
	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") TColGeom_Array1OfBoundedSurface;
		 TColGeom_Array1OfBoundedSurface (const Handle_Geom_BoundedSurface & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param V:
	:type V: Handle_Geom_BoundedSurface &
	:rtype: None
") Init;
		void Init (const Handle_Geom_BoundedSurface & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom_Array1OfBoundedSurface &
	:rtype: TColGeom_Array1OfBoundedSurface
") Assign;
		const TColGeom_Array1OfBoundedSurface & Assign (const TColGeom_Array1OfBoundedSurface & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom_Array1OfBoundedSurface &
	:rtype: TColGeom_Array1OfBoundedSurface
") operator=;
		const TColGeom_Array1OfBoundedSurface & operator = (const TColGeom_Array1OfBoundedSurface & Other);
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Value:
	:type Value: Handle_Geom_BoundedSurface &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom_BoundedSurface & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Geom_BoundedSurface
") Value;
		const Handle_Geom_BoundedSurface & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Geom_BoundedSurface
") ChangeValue;
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
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") TColGeom_Array1OfCurve;
		 TColGeom_Array1OfCurve (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Item:
	:type Item: Handle_Geom_Curve &
	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") TColGeom_Array1OfCurve;
		 TColGeom_Array1OfCurve (const Handle_Geom_Curve & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param V:
	:type V: Handle_Geom_Curve &
	:rtype: None
") Init;
		void Init (const Handle_Geom_Curve & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom_Array1OfCurve &
	:rtype: TColGeom_Array1OfCurve
") Assign;
		const TColGeom_Array1OfCurve & Assign (const TColGeom_Array1OfCurve & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom_Array1OfCurve &
	:rtype: TColGeom_Array1OfCurve
") operator=;
		const TColGeom_Array1OfCurve & operator = (const TColGeom_Array1OfCurve & Other);
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Value:
	:type Value: Handle_Geom_Curve &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom_Curve & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Geom_Curve
") Value;
		const Handle_Geom_Curve & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Geom_Curve
") ChangeValue;
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
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") TColGeom_Array1OfSurface;
		 TColGeom_Array1OfSurface (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Item:
	:type Item: Handle_Geom_Surface &
	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") TColGeom_Array1OfSurface;
		 TColGeom_Array1OfSurface (const Handle_Geom_Surface & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param V:
	:type V: Handle_Geom_Surface &
	:rtype: None
") Init;
		void Init (const Handle_Geom_Surface & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom_Array1OfSurface &
	:rtype: TColGeom_Array1OfSurface
") Assign;
		const TColGeom_Array1OfSurface & Assign (const TColGeom_Array1OfSurface & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom_Array1OfSurface &
	:rtype: TColGeom_Array1OfSurface
") operator=;
		const TColGeom_Array1OfSurface & operator = (const TColGeom_Array1OfSurface & Other);
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Value:
	:type Value: Handle_Geom_Surface &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom_Surface & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Geom_Surface
") Value;
		const Handle_Geom_Surface & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Geom_Surface
") ChangeValue;
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
		%feature("autodoc", "	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:rtype: None
") TColGeom_Array2OfBSplineSurface;
		 TColGeom_Array2OfBSplineSurface (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "	:param Item:
	:type Item: Handle_Geom_BSplineSurface &
	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:rtype: None
") TColGeom_Array2OfBSplineSurface;
		 TColGeom_Array2OfBSplineSurface (const Handle_Geom_BSplineSurface & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "	:param V:
	:type V: Handle_Geom_BSplineSurface &
	:rtype: None
") Init;
		void Init (const Handle_Geom_BSplineSurface & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom_Array2OfBSplineSurface &
	:rtype: TColGeom_Array2OfBSplineSurface
") Assign;
		const TColGeom_Array2OfBSplineSurface & Assign (const TColGeom_Array2OfBSplineSurface & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom_Array2OfBSplineSurface &
	:rtype: TColGeom_Array2OfBSplineSurface
") operator=;
		const TColGeom_Array2OfBSplineSurface & operator = (const TColGeom_Array2OfBSplineSurface & Other);
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:param Value:
	:type Value: Handle_Geom_BSplineSurface &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Handle_Geom_BSplineSurface & Value);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: Handle_Geom_BSplineSurface
") Value;
		const Handle_Geom_BSplineSurface & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: Handle_Geom_BSplineSurface
") ChangeValue;
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
		%feature("autodoc", "	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:rtype: None
") TColGeom_Array2OfBezierSurface;
		 TColGeom_Array2OfBezierSurface (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "	:param Item:
	:type Item: Handle_Geom_BezierSurface &
	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:rtype: None
") TColGeom_Array2OfBezierSurface;
		 TColGeom_Array2OfBezierSurface (const Handle_Geom_BezierSurface & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "	:param V:
	:type V: Handle_Geom_BezierSurface &
	:rtype: None
") Init;
		void Init (const Handle_Geom_BezierSurface & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom_Array2OfBezierSurface &
	:rtype: TColGeom_Array2OfBezierSurface
") Assign;
		const TColGeom_Array2OfBezierSurface & Assign (const TColGeom_Array2OfBezierSurface & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom_Array2OfBezierSurface &
	:rtype: TColGeom_Array2OfBezierSurface
") operator=;
		const TColGeom_Array2OfBezierSurface & operator = (const TColGeom_Array2OfBezierSurface & Other);
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:param Value:
	:type Value: Handle_Geom_BezierSurface &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Handle_Geom_BezierSurface & Value);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: Handle_Geom_BezierSurface
") Value;
		const Handle_Geom_BezierSurface & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: Handle_Geom_BezierSurface
") ChangeValue;
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
		%feature("autodoc", "	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:rtype: None
") TColGeom_Array2OfBoundedSurface;
		 TColGeom_Array2OfBoundedSurface (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "	:param Item:
	:type Item: Handle_Geom_BoundedSurface &
	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:rtype: None
") TColGeom_Array2OfBoundedSurface;
		 TColGeom_Array2OfBoundedSurface (const Handle_Geom_BoundedSurface & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "	:param V:
	:type V: Handle_Geom_BoundedSurface &
	:rtype: None
") Init;
		void Init (const Handle_Geom_BoundedSurface & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom_Array2OfBoundedSurface &
	:rtype: TColGeom_Array2OfBoundedSurface
") Assign;
		const TColGeom_Array2OfBoundedSurface & Assign (const TColGeom_Array2OfBoundedSurface & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom_Array2OfBoundedSurface &
	:rtype: TColGeom_Array2OfBoundedSurface
") operator=;
		const TColGeom_Array2OfBoundedSurface & operator = (const TColGeom_Array2OfBoundedSurface & Other);
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:param Value:
	:type Value: Handle_Geom_BoundedSurface &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Handle_Geom_BoundedSurface & Value);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: Handle_Geom_BoundedSurface
") Value;
		const Handle_Geom_BoundedSurface & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: Handle_Geom_BoundedSurface
") ChangeValue;
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
		%feature("autodoc", "	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:rtype: None
") TColGeom_Array2OfSurface;
		 TColGeom_Array2OfSurface (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "	:param Item:
	:type Item: Handle_Geom_Surface &
	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:rtype: None
") TColGeom_Array2OfSurface;
		 TColGeom_Array2OfSurface (const Handle_Geom_Surface & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "	:param V:
	:type V: Handle_Geom_Surface &
	:rtype: None
") Init;
		void Init (const Handle_Geom_Surface & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom_Array2OfSurface &
	:rtype: TColGeom_Array2OfSurface
") Assign;
		const TColGeom_Array2OfSurface & Assign (const TColGeom_Array2OfSurface & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom_Array2OfSurface &
	:rtype: TColGeom_Array2OfSurface
") operator=;
		const TColGeom_Array2OfSurface & operator = (const TColGeom_Array2OfSurface & Other);
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:param Value:
	:type Value: Handle_Geom_Surface &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Handle_Geom_Surface & Value);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: Handle_Geom_Surface
") Value;
		const Handle_Geom_Surface & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: Handle_Geom_Surface
") ChangeValue;
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
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") TColGeom_HArray1OfBSplineCurve;
		 TColGeom_HArray1OfBSplineCurve (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:param V:
	:type V: Handle_Geom_BSplineCurve &
	:rtype: None
") TColGeom_HArray1OfBSplineCurve;
		 TColGeom_HArray1OfBSplineCurve (const Standard_Integer Low,const Standard_Integer Up,const Handle_Geom_BSplineCurve & V);
		%feature("autodoc", "	:param V:
	:type V: Handle_Geom_BSplineCurve &
	:rtype: None
") Init;
		void Init (const Handle_Geom_BSplineCurve & V);
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Value:
	:type Value: Handle_Geom_BSplineCurve &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom_BSplineCurve & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Geom_BSplineCurve
") Value;
		const Handle_Geom_BSplineCurve & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Geom_BSplineCurve
") ChangeValue;
		Handle_Geom_BSplineCurve & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: TColGeom_Array1OfBSplineCurve
") Array1;
		const TColGeom_Array1OfBSplineCurve & Array1 ();
		%feature("autodoc", "	:rtype: TColGeom_Array1OfBSplineCurve
") ChangeArray1;
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
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") TColGeom_HArray1OfBezierCurve;
		 TColGeom_HArray1OfBezierCurve (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:param V:
	:type V: Handle_Geom_BezierCurve &
	:rtype: None
") TColGeom_HArray1OfBezierCurve;
		 TColGeom_HArray1OfBezierCurve (const Standard_Integer Low,const Standard_Integer Up,const Handle_Geom_BezierCurve & V);
		%feature("autodoc", "	:param V:
	:type V: Handle_Geom_BezierCurve &
	:rtype: None
") Init;
		void Init (const Handle_Geom_BezierCurve & V);
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Value:
	:type Value: Handle_Geom_BezierCurve &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom_BezierCurve & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Geom_BezierCurve
") Value;
		const Handle_Geom_BezierCurve & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Geom_BezierCurve
") ChangeValue;
		Handle_Geom_BezierCurve & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: TColGeom_Array1OfBezierCurve
") Array1;
		const TColGeom_Array1OfBezierCurve & Array1 ();
		%feature("autodoc", "	:rtype: TColGeom_Array1OfBezierCurve
") ChangeArray1;
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
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") TColGeom_HArray1OfBoundedCurve;
		 TColGeom_HArray1OfBoundedCurve (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:param V:
	:type V: Handle_Geom_BoundedCurve &
	:rtype: None
") TColGeom_HArray1OfBoundedCurve;
		 TColGeom_HArray1OfBoundedCurve (const Standard_Integer Low,const Standard_Integer Up,const Handle_Geom_BoundedCurve & V);
		%feature("autodoc", "	:param V:
	:type V: Handle_Geom_BoundedCurve &
	:rtype: None
") Init;
		void Init (const Handle_Geom_BoundedCurve & V);
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Value:
	:type Value: Handle_Geom_BoundedCurve &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom_BoundedCurve & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Geom_BoundedCurve
") Value;
		const Handle_Geom_BoundedCurve & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Geom_BoundedCurve
") ChangeValue;
		Handle_Geom_BoundedCurve & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: TColGeom_Array1OfBoundedCurve
") Array1;
		const TColGeom_Array1OfBoundedCurve & Array1 ();
		%feature("autodoc", "	:rtype: TColGeom_Array1OfBoundedCurve
") ChangeArray1;
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
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") TColGeom_HArray1OfBoundedSurface;
		 TColGeom_HArray1OfBoundedSurface (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:param V:
	:type V: Handle_Geom_BoundedSurface &
	:rtype: None
") TColGeom_HArray1OfBoundedSurface;
		 TColGeom_HArray1OfBoundedSurface (const Standard_Integer Low,const Standard_Integer Up,const Handle_Geom_BoundedSurface & V);
		%feature("autodoc", "	:param V:
	:type V: Handle_Geom_BoundedSurface &
	:rtype: None
") Init;
		void Init (const Handle_Geom_BoundedSurface & V);
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Value:
	:type Value: Handle_Geom_BoundedSurface &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom_BoundedSurface & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Geom_BoundedSurface
") Value;
		const Handle_Geom_BoundedSurface & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Geom_BoundedSurface
") ChangeValue;
		Handle_Geom_BoundedSurface & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: TColGeom_Array1OfBoundedSurface
") Array1;
		const TColGeom_Array1OfBoundedSurface & Array1 ();
		%feature("autodoc", "	:rtype: TColGeom_Array1OfBoundedSurface
") ChangeArray1;
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
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") TColGeom_HArray1OfCurve;
		 TColGeom_HArray1OfCurve (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:param V:
	:type V: Handle_Geom_Curve &
	:rtype: None
") TColGeom_HArray1OfCurve;
		 TColGeom_HArray1OfCurve (const Standard_Integer Low,const Standard_Integer Up,const Handle_Geom_Curve & V);
		%feature("autodoc", "	:param V:
	:type V: Handle_Geom_Curve &
	:rtype: None
") Init;
		void Init (const Handle_Geom_Curve & V);
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Value:
	:type Value: Handle_Geom_Curve &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom_Curve & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Geom_Curve
") Value;
		const Handle_Geom_Curve & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Geom_Curve
") ChangeValue;
		Handle_Geom_Curve & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: TColGeom_Array1OfCurve
") Array1;
		const TColGeom_Array1OfCurve & Array1 ();
		%feature("autodoc", "	:rtype: TColGeom_Array1OfCurve
") ChangeArray1;
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
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") TColGeom_HArray1OfSurface;
		 TColGeom_HArray1OfSurface (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:param V:
	:type V: Handle_Geom_Surface &
	:rtype: None
") TColGeom_HArray1OfSurface;
		 TColGeom_HArray1OfSurface (const Standard_Integer Low,const Standard_Integer Up,const Handle_Geom_Surface & V);
		%feature("autodoc", "	:param V:
	:type V: Handle_Geom_Surface &
	:rtype: None
") Init;
		void Init (const Handle_Geom_Surface & V);
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Value:
	:type Value: Handle_Geom_Surface &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom_Surface & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Geom_Surface
") Value;
		const Handle_Geom_Surface & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Geom_Surface
") ChangeValue;
		Handle_Geom_Surface & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: TColGeom_Array1OfSurface
") Array1;
		const TColGeom_Array1OfSurface & Array1 ();
		%feature("autodoc", "	:rtype: TColGeom_Array1OfSurface
") ChangeArray1;
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
		%feature("autodoc", "	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:rtype: None
") TColGeom_HArray2OfBSplineSurface;
		 TColGeom_HArray2OfBSplineSurface (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:param V:
	:type V: Handle_Geom_BSplineSurface &
	:rtype: None
") TColGeom_HArray2OfBSplineSurface;
		 TColGeom_HArray2OfBSplineSurface (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const Handle_Geom_BSplineSurface & V);
		%feature("autodoc", "	:param V:
	:type V: Handle_Geom_BSplineSurface &
	:rtype: None
") Init;
		void Init (const Handle_Geom_BSplineSurface & V);
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:param Value:
	:type Value: Handle_Geom_BSplineSurface &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Handle_Geom_BSplineSurface & Value);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: Handle_Geom_BSplineSurface
") Value;
		const Handle_Geom_BSplineSurface & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: Handle_Geom_BSplineSurface
") ChangeValue;
		Handle_Geom_BSplineSurface & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "	:rtype: TColGeom_Array2OfBSplineSurface
") Array2;
		const TColGeom_Array2OfBSplineSurface & Array2 ();
		%feature("autodoc", "	:rtype: TColGeom_Array2OfBSplineSurface
") ChangeArray2;
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
		%feature("autodoc", "	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:rtype: None
") TColGeom_HArray2OfBezierSurface;
		 TColGeom_HArray2OfBezierSurface (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:param V:
	:type V: Handle_Geom_BezierSurface &
	:rtype: None
") TColGeom_HArray2OfBezierSurface;
		 TColGeom_HArray2OfBezierSurface (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const Handle_Geom_BezierSurface & V);
		%feature("autodoc", "	:param V:
	:type V: Handle_Geom_BezierSurface &
	:rtype: None
") Init;
		void Init (const Handle_Geom_BezierSurface & V);
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:param Value:
	:type Value: Handle_Geom_BezierSurface &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Handle_Geom_BezierSurface & Value);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: Handle_Geom_BezierSurface
") Value;
		const Handle_Geom_BezierSurface & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: Handle_Geom_BezierSurface
") ChangeValue;
		Handle_Geom_BezierSurface & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "	:rtype: TColGeom_Array2OfBezierSurface
") Array2;
		const TColGeom_Array2OfBezierSurface & Array2 ();
		%feature("autodoc", "	:rtype: TColGeom_Array2OfBezierSurface
") ChangeArray2;
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
		%feature("autodoc", "	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:rtype: None
") TColGeom_HArray2OfBoundedSurface;
		 TColGeom_HArray2OfBoundedSurface (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:param V:
	:type V: Handle_Geom_BoundedSurface &
	:rtype: None
") TColGeom_HArray2OfBoundedSurface;
		 TColGeom_HArray2OfBoundedSurface (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const Handle_Geom_BoundedSurface & V);
		%feature("autodoc", "	:param V:
	:type V: Handle_Geom_BoundedSurface &
	:rtype: None
") Init;
		void Init (const Handle_Geom_BoundedSurface & V);
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:param Value:
	:type Value: Handle_Geom_BoundedSurface &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Handle_Geom_BoundedSurface & Value);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: Handle_Geom_BoundedSurface
") Value;
		const Handle_Geom_BoundedSurface & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: Handle_Geom_BoundedSurface
") ChangeValue;
		Handle_Geom_BoundedSurface & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "	:rtype: TColGeom_Array2OfBoundedSurface
") Array2;
		const TColGeom_Array2OfBoundedSurface & Array2 ();
		%feature("autodoc", "	:rtype: TColGeom_Array2OfBoundedSurface
") ChangeArray2;
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
		%feature("autodoc", "	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:rtype: None
") TColGeom_HArray2OfSurface;
		 TColGeom_HArray2OfSurface (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:param V:
	:type V: Handle_Geom_Surface &
	:rtype: None
") TColGeom_HArray2OfSurface;
		 TColGeom_HArray2OfSurface (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const Handle_Geom_Surface & V);
		%feature("autodoc", "	:param V:
	:type V: Handle_Geom_Surface &
	:rtype: None
") Init;
		void Init (const Handle_Geom_Surface & V);
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:param Value:
	:type Value: Handle_Geom_Surface &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Handle_Geom_Surface & Value);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: Handle_Geom_Surface
") Value;
		const Handle_Geom_Surface & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: Handle_Geom_Surface
") ChangeValue;
		Handle_Geom_Surface & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "	:rtype: TColGeom_Array2OfSurface
") Array2;
		const TColGeom_Array2OfSurface & Array2 ();
		%feature("autodoc", "	:rtype: TColGeom_Array2OfSurface
") ChangeArray2;
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
		%feature("autodoc", "	:rtype: None
") TColGeom_HSequenceOfBoundedCurve;
		 TColGeom_HSequenceOfBoundedCurve ();
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Geom_BoundedCurve &
	:rtype: None
") Append;
		void Append (const Handle_Geom_BoundedCurve & anItem);
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TColGeom_HSequenceOfBoundedCurve &
	:rtype: None
") Append;
		void Append (const Handle_TColGeom_HSequenceOfBoundedCurve & aSequence);
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Geom_BoundedCurve &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Geom_BoundedCurve & anItem);
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TColGeom_HSequenceOfBoundedCurve &
	:rtype: None
") Prepend;
		void Prepend (const Handle_TColGeom_HSequenceOfBoundedCurve & aSequence);
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Geom_BoundedCurve &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Geom_BoundedCurve & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param aSequence:
	:type aSequence: Handle_TColGeom_HSequenceOfBoundedCurve &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TColGeom_HSequenceOfBoundedCurve & aSequence);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Geom_BoundedCurve &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Geom_BoundedCurve & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param aSequence:
	:type aSequence: Handle_TColGeom_HSequenceOfBoundedCurve &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TColGeom_HSequenceOfBoundedCurve & aSequence);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anOtherIndex:
	:type anOtherIndex: Standard_Integer
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_TColGeom_HSequenceOfBoundedCurve
") Split;
		Handle_TColGeom_HSequenceOfBoundedCurve Split (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Geom_BoundedCurve &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Geom_BoundedCurve & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_Geom_BoundedCurve
") Value;
		const Handle_Geom_BoundedCurve & Value (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_Geom_BoundedCurve
") ChangeValue;
		Handle_Geom_BoundedCurve & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: Standard_Integer
	:param toIndex:
	:type toIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "	:rtype: TColGeom_SequenceOfBoundedCurve
") Sequence;
		const TColGeom_SequenceOfBoundedCurve & Sequence ();
		%feature("autodoc", "	:rtype: TColGeom_SequenceOfBoundedCurve
") ChangeSequence;
		TColGeom_SequenceOfBoundedCurve & ChangeSequence ();
		%feature("autodoc", "	:rtype: Handle_TColGeom_HSequenceOfBoundedCurve
") ShallowCopy;
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
		%feature("autodoc", "	:rtype: None
") TColGeom_HSequenceOfBoundedSurface;
		 TColGeom_HSequenceOfBoundedSurface ();
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Geom_BoundedSurface &
	:rtype: None
") Append;
		void Append (const Handle_Geom_BoundedSurface & anItem);
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TColGeom_HSequenceOfBoundedSurface &
	:rtype: None
") Append;
		void Append (const Handle_TColGeom_HSequenceOfBoundedSurface & aSequence);
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Geom_BoundedSurface &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Geom_BoundedSurface & anItem);
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TColGeom_HSequenceOfBoundedSurface &
	:rtype: None
") Prepend;
		void Prepend (const Handle_TColGeom_HSequenceOfBoundedSurface & aSequence);
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Geom_BoundedSurface &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Geom_BoundedSurface & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param aSequence:
	:type aSequence: Handle_TColGeom_HSequenceOfBoundedSurface &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TColGeom_HSequenceOfBoundedSurface & aSequence);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Geom_BoundedSurface &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Geom_BoundedSurface & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param aSequence:
	:type aSequence: Handle_TColGeom_HSequenceOfBoundedSurface &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TColGeom_HSequenceOfBoundedSurface & aSequence);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anOtherIndex:
	:type anOtherIndex: Standard_Integer
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_TColGeom_HSequenceOfBoundedSurface
") Split;
		Handle_TColGeom_HSequenceOfBoundedSurface Split (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Geom_BoundedSurface &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Geom_BoundedSurface & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_Geom_BoundedSurface
") Value;
		const Handle_Geom_BoundedSurface & Value (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_Geom_BoundedSurface
") ChangeValue;
		Handle_Geom_BoundedSurface & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: Standard_Integer
	:param toIndex:
	:type toIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "	:rtype: TColGeom_SequenceOfBoundedSurface
") Sequence;
		const TColGeom_SequenceOfBoundedSurface & Sequence ();
		%feature("autodoc", "	:rtype: TColGeom_SequenceOfBoundedSurface
") ChangeSequence;
		TColGeom_SequenceOfBoundedSurface & ChangeSequence ();
		%feature("autodoc", "	:rtype: Handle_TColGeom_HSequenceOfBoundedSurface
") ShallowCopy;
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
		%feature("autodoc", "	:rtype: None
") TColGeom_HSequenceOfCurve;
		 TColGeom_HSequenceOfCurve ();
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Geom_Curve &
	:rtype: None
") Append;
		void Append (const Handle_Geom_Curve & anItem);
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TColGeom_HSequenceOfCurve &
	:rtype: None
") Append;
		void Append (const Handle_TColGeom_HSequenceOfCurve & aSequence);
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Geom_Curve &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Geom_Curve & anItem);
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TColGeom_HSequenceOfCurve &
	:rtype: None
") Prepend;
		void Prepend (const Handle_TColGeom_HSequenceOfCurve & aSequence);
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Geom_Curve &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Geom_Curve & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param aSequence:
	:type aSequence: Handle_TColGeom_HSequenceOfCurve &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TColGeom_HSequenceOfCurve & aSequence);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Geom_Curve &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Geom_Curve & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param aSequence:
	:type aSequence: Handle_TColGeom_HSequenceOfCurve &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TColGeom_HSequenceOfCurve & aSequence);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anOtherIndex:
	:type anOtherIndex: Standard_Integer
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_TColGeom_HSequenceOfCurve
") Split;
		Handle_TColGeom_HSequenceOfCurve Split (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Geom_Curve &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Geom_Curve & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_Geom_Curve
") Value;
		const Handle_Geom_Curve & Value (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_Geom_Curve
") ChangeValue;
		Handle_Geom_Curve & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: Standard_Integer
	:param toIndex:
	:type toIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "	:rtype: TColGeom_SequenceOfCurve
") Sequence;
		const TColGeom_SequenceOfCurve & Sequence ();
		%feature("autodoc", "	:rtype: TColGeom_SequenceOfCurve
") ChangeSequence;
		TColGeom_SequenceOfCurve & ChangeSequence ();
		%feature("autodoc", "	:rtype: Handle_TColGeom_HSequenceOfCurve
") ShallowCopy;
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
		%feature("autodoc", "	:rtype: None
") TColGeom_HSequenceOfSurface;
		 TColGeom_HSequenceOfSurface ();
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Geom_Surface &
	:rtype: None
") Append;
		void Append (const Handle_Geom_Surface & anItem);
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TColGeom_HSequenceOfSurface &
	:rtype: None
") Append;
		void Append (const Handle_TColGeom_HSequenceOfSurface & aSequence);
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Geom_Surface &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Geom_Surface & anItem);
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_TColGeom_HSequenceOfSurface &
	:rtype: None
") Prepend;
		void Prepend (const Handle_TColGeom_HSequenceOfSurface & aSequence);
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Geom_Surface &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Geom_Surface & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param aSequence:
	:type aSequence: Handle_TColGeom_HSequenceOfSurface &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TColGeom_HSequenceOfSurface & aSequence);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Geom_Surface &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Geom_Surface & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param aSequence:
	:type aSequence: Handle_TColGeom_HSequenceOfSurface &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TColGeom_HSequenceOfSurface & aSequence);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anOtherIndex:
	:type anOtherIndex: Standard_Integer
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_TColGeom_HSequenceOfSurface
") Split;
		Handle_TColGeom_HSequenceOfSurface Split (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:param anItem:
	:type anItem: Handle_Geom_Surface &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Geom_Surface & anItem);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_Geom_Surface
") Value;
		const Handle_Geom_Surface & Value (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: Handle_Geom_Surface
") ChangeValue;
		Handle_Geom_Surface & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: Standard_Integer
	:param toIndex:
	:type toIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "	:rtype: TColGeom_SequenceOfSurface
") Sequence;
		const TColGeom_SequenceOfSurface & Sequence ();
		%feature("autodoc", "	:rtype: TColGeom_SequenceOfSurface
") ChangeSequence;
		TColGeom_SequenceOfSurface & ChangeSequence ();
		%feature("autodoc", "	:rtype: Handle_TColGeom_HSequenceOfSurface
") ShallowCopy;
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
		%feature("autodoc", "	:param I:
	:type I: Handle_Geom_BoundedCurve &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") TColGeom_SequenceNodeOfSequenceOfBoundedCurve;
		 TColGeom_SequenceNodeOfSequenceOfBoundedCurve (const Handle_Geom_BoundedCurve & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Handle_Geom_BoundedCurve
") Value;
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
		%feature("autodoc", "	:param I:
	:type I: Handle_Geom_BoundedSurface &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") TColGeom_SequenceNodeOfSequenceOfBoundedSurface;
		 TColGeom_SequenceNodeOfSequenceOfBoundedSurface (const Handle_Geom_BoundedSurface & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Handle_Geom_BoundedSurface
") Value;
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
		%feature("autodoc", "	:param I:
	:type I: Handle_Geom_Curve &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") TColGeom_SequenceNodeOfSequenceOfCurve;
		 TColGeom_SequenceNodeOfSequenceOfCurve (const Handle_Geom_Curve & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Handle_Geom_Curve
") Value;
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
		%feature("autodoc", "	:param I:
	:type I: Handle_Geom_Surface &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") TColGeom_SequenceNodeOfSequenceOfSurface;
		 TColGeom_SequenceNodeOfSequenceOfSurface (const Handle_Geom_Surface & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Handle_Geom_Surface
") Value;
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
		%feature("autodoc", "	:rtype: None
") TColGeom_SequenceOfBoundedCurve;
		 TColGeom_SequenceOfBoundedCurve ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom_SequenceOfBoundedCurve &
	:rtype: TColGeom_SequenceOfBoundedCurve
") Assign;
		const TColGeom_SequenceOfBoundedCurve & Assign (const TColGeom_SequenceOfBoundedCurve & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom_SequenceOfBoundedCurve &
	:rtype: TColGeom_SequenceOfBoundedCurve
") operator=;
		const TColGeom_SequenceOfBoundedCurve & operator = (const TColGeom_SequenceOfBoundedCurve & Other);
		%feature("autodoc", "	:param T:
	:type T: Handle_Geom_BoundedCurve &
	:rtype: None
") Append;
		void Append (const Handle_Geom_BoundedCurve & T);
		%feature("autodoc", "	:param S:
	:type S: TColGeom_SequenceOfBoundedCurve &
	:rtype: None
") Append;
		void Append (TColGeom_SequenceOfBoundedCurve & S);
		%feature("autodoc", "	:param T:
	:type T: Handle_Geom_BoundedCurve &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Geom_BoundedCurve & T);
		%feature("autodoc", "	:param S:
	:type S: TColGeom_SequenceOfBoundedCurve &
	:rtype: None
") Prepend;
		void Prepend (TColGeom_SequenceOfBoundedCurve & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_Geom_BoundedCurve &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Geom_BoundedCurve & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: TColGeom_SequenceOfBoundedCurve &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TColGeom_SequenceOfBoundedCurve & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_Geom_BoundedCurve &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Geom_BoundedCurve & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: TColGeom_SequenceOfBoundedCurve &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TColGeom_SequenceOfBoundedCurve & S);
		%feature("autodoc", "	:rtype: Handle_Geom_BoundedCurve
") First;
		const Handle_Geom_BoundedCurve & First ();
		%feature("autodoc", "	:rtype: Handle_Geom_BoundedCurve
") Last;
		const Handle_Geom_BoundedCurve & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: TColGeom_SequenceOfBoundedCurve &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,TColGeom_SequenceOfBoundedCurve & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Geom_BoundedCurve
") Value;
		const Handle_Geom_BoundedCurve & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Handle_Geom_BoundedCurve &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom_BoundedCurve & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Geom_BoundedCurve
") ChangeValue;
		Handle_Geom_BoundedCurve & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
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
		%feature("autodoc", "	:rtype: None
") TColGeom_SequenceOfBoundedSurface;
		 TColGeom_SequenceOfBoundedSurface ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom_SequenceOfBoundedSurface &
	:rtype: TColGeom_SequenceOfBoundedSurface
") Assign;
		const TColGeom_SequenceOfBoundedSurface & Assign (const TColGeom_SequenceOfBoundedSurface & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom_SequenceOfBoundedSurface &
	:rtype: TColGeom_SequenceOfBoundedSurface
") operator=;
		const TColGeom_SequenceOfBoundedSurface & operator = (const TColGeom_SequenceOfBoundedSurface & Other);
		%feature("autodoc", "	:param T:
	:type T: Handle_Geom_BoundedSurface &
	:rtype: None
") Append;
		void Append (const Handle_Geom_BoundedSurface & T);
		%feature("autodoc", "	:param S:
	:type S: TColGeom_SequenceOfBoundedSurface &
	:rtype: None
") Append;
		void Append (TColGeom_SequenceOfBoundedSurface & S);
		%feature("autodoc", "	:param T:
	:type T: Handle_Geom_BoundedSurface &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Geom_BoundedSurface & T);
		%feature("autodoc", "	:param S:
	:type S: TColGeom_SequenceOfBoundedSurface &
	:rtype: None
") Prepend;
		void Prepend (TColGeom_SequenceOfBoundedSurface & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_Geom_BoundedSurface &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Geom_BoundedSurface & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: TColGeom_SequenceOfBoundedSurface &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TColGeom_SequenceOfBoundedSurface & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_Geom_BoundedSurface &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Geom_BoundedSurface & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: TColGeom_SequenceOfBoundedSurface &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TColGeom_SequenceOfBoundedSurface & S);
		%feature("autodoc", "	:rtype: Handle_Geom_BoundedSurface
") First;
		const Handle_Geom_BoundedSurface & First ();
		%feature("autodoc", "	:rtype: Handle_Geom_BoundedSurface
") Last;
		const Handle_Geom_BoundedSurface & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: TColGeom_SequenceOfBoundedSurface &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,TColGeom_SequenceOfBoundedSurface & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Geom_BoundedSurface
") Value;
		const Handle_Geom_BoundedSurface & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Handle_Geom_BoundedSurface &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom_BoundedSurface & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Geom_BoundedSurface
") ChangeValue;
		Handle_Geom_BoundedSurface & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
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
		%feature("autodoc", "	:rtype: None
") TColGeom_SequenceOfCurve;
		 TColGeom_SequenceOfCurve ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom_SequenceOfCurve &
	:rtype: TColGeom_SequenceOfCurve
") Assign;
		const TColGeom_SequenceOfCurve & Assign (const TColGeom_SequenceOfCurve & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom_SequenceOfCurve &
	:rtype: TColGeom_SequenceOfCurve
") operator=;
		const TColGeom_SequenceOfCurve & operator = (const TColGeom_SequenceOfCurve & Other);
		%feature("autodoc", "	:param T:
	:type T: Handle_Geom_Curve &
	:rtype: None
") Append;
		void Append (const Handle_Geom_Curve & T);
		%feature("autodoc", "	:param S:
	:type S: TColGeom_SequenceOfCurve &
	:rtype: None
") Append;
		void Append (TColGeom_SequenceOfCurve & S);
		%feature("autodoc", "	:param T:
	:type T: Handle_Geom_Curve &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Geom_Curve & T);
		%feature("autodoc", "	:param S:
	:type S: TColGeom_SequenceOfCurve &
	:rtype: None
") Prepend;
		void Prepend (TColGeom_SequenceOfCurve & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_Geom_Curve &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Geom_Curve & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: TColGeom_SequenceOfCurve &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TColGeom_SequenceOfCurve & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_Geom_Curve &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Geom_Curve & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: TColGeom_SequenceOfCurve &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TColGeom_SequenceOfCurve & S);
		%feature("autodoc", "	:rtype: Handle_Geom_Curve
") First;
		const Handle_Geom_Curve & First ();
		%feature("autodoc", "	:rtype: Handle_Geom_Curve
") Last;
		const Handle_Geom_Curve & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: TColGeom_SequenceOfCurve &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,TColGeom_SequenceOfCurve & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Geom_Curve
") Value;
		const Handle_Geom_Curve & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Handle_Geom_Curve &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom_Curve & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Geom_Curve
") ChangeValue;
		Handle_Geom_Curve & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
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
		%feature("autodoc", "	:rtype: None
") TColGeom_SequenceOfSurface;
		 TColGeom_SequenceOfSurface ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom_SequenceOfSurface &
	:rtype: TColGeom_SequenceOfSurface
") Assign;
		const TColGeom_SequenceOfSurface & Assign (const TColGeom_SequenceOfSurface & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TColGeom_SequenceOfSurface &
	:rtype: TColGeom_SequenceOfSurface
") operator=;
		const TColGeom_SequenceOfSurface & operator = (const TColGeom_SequenceOfSurface & Other);
		%feature("autodoc", "	:param T:
	:type T: Handle_Geom_Surface &
	:rtype: None
") Append;
		void Append (const Handle_Geom_Surface & T);
		%feature("autodoc", "	:param S:
	:type S: TColGeom_SequenceOfSurface &
	:rtype: None
") Append;
		void Append (TColGeom_SequenceOfSurface & S);
		%feature("autodoc", "	:param T:
	:type T: Handle_Geom_Surface &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Geom_Surface & T);
		%feature("autodoc", "	:param S:
	:type S: TColGeom_SequenceOfSurface &
	:rtype: None
") Prepend;
		void Prepend (TColGeom_SequenceOfSurface & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_Geom_Surface &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Geom_Surface & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: TColGeom_SequenceOfSurface &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,TColGeom_SequenceOfSurface & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_Geom_Surface &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Geom_Surface & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: TColGeom_SequenceOfSurface &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,TColGeom_SequenceOfSurface & S);
		%feature("autodoc", "	:rtype: Handle_Geom_Surface
") First;
		const Handle_Geom_Surface & First ();
		%feature("autodoc", "	:rtype: Handle_Geom_Surface
") Last;
		const Handle_Geom_Surface & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: TColGeom_SequenceOfSurface &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,TColGeom_SequenceOfSurface & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Geom_Surface
") Value;
		const Handle_Geom_Surface & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Handle_Geom_Surface &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom_Surface & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Geom_Surface
") ChangeValue;
		Handle_Geom_Surface & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
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
