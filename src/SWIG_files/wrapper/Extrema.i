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
%module (package="OCC") Extrema

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

%include Extrema_headers.i

/* typedefs */
typedef NCollection_UBTree <Standard_Integer , Bnd_Sphere> Extrema_UBTreeOfSphere;
typedef NCollection_UBTreeFiller <Standard_Integer , Bnd_Sphere> Extrema_UBTreeFillerOfSphere;
typedef NCollection_Handle <Extrema_UBTreeOfSphere> Extrema_HUBTreeOfSphere;
/* end typedefs declaration */

/* public enums */
enum Extrema_ElementType {
	Extrema_Node = 0,
	Extrema_UIsoEdge = 1,
	Extrema_VIsoEdge = 2,
	Extrema_Face = 3,
};

enum Extrema_ExtAlgo {
	Extrema_ExtAlgo_Grad = 0,
	Extrema_ExtAlgo_Tree = 1,
};

enum Extrema_ExtFlag {
	Extrema_ExtFlag_MIN = 0,
	Extrema_ExtFlag_MAX = 1,
	Extrema_ExtFlag_MINMAX = 2,
};

/* end public enums declaration */

%nodefaultctor Extrema_Array1OfPOnCurv;
class Extrema_Array1OfPOnCurv {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Extrema_Array1OfPOnCurv;
		 Extrema_Array1OfPOnCurv (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(Extrema_POnCurv)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Extrema_Array1OfPOnCurv;
		 Extrema_Array1OfPOnCurv (const Extrema_POnCurv & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Extrema_POnCurv & V);
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
	Other(Extrema_Array1OfPOnCurv)

Returns:
	Extrema_Array1OfPOnCurv

No detailed docstring for this function.") Assign;
		const Extrema_Array1OfPOnCurv & Assign (const Extrema_Array1OfPOnCurv & Other);
		%feature("autodoc", "Args:
	Other(Extrema_Array1OfPOnCurv)

Returns:
	Extrema_Array1OfPOnCurv

No detailed docstring for this function.") operator=;
		const Extrema_Array1OfPOnCurv & operator = (const Extrema_Array1OfPOnCurv & Other);
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
	Value(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Extrema_POnCurv

No detailed docstring for this function.") Value;
		const Extrema_POnCurv & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Extrema_POnCurv

No detailed docstring for this function.") ChangeValue;
		Extrema_POnCurv & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") Extrema_Array1OfPOnCurv::~Extrema_Array1OfPOnCurv %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_Array1OfPOnCurv {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_Array1OfPOnCurv2d;
class Extrema_Array1OfPOnCurv2d {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Extrema_Array1OfPOnCurv2d;
		 Extrema_Array1OfPOnCurv2d (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(Extrema_POnCurv2d)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Extrema_Array1OfPOnCurv2d;
		 Extrema_Array1OfPOnCurv2d (const Extrema_POnCurv2d & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Extrema_POnCurv2d & V);
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
	Other(Extrema_Array1OfPOnCurv2d)

Returns:
	Extrema_Array1OfPOnCurv2d

No detailed docstring for this function.") Assign;
		const Extrema_Array1OfPOnCurv2d & Assign (const Extrema_Array1OfPOnCurv2d & Other);
		%feature("autodoc", "Args:
	Other(Extrema_Array1OfPOnCurv2d)

Returns:
	Extrema_Array1OfPOnCurv2d

No detailed docstring for this function.") operator=;
		const Extrema_Array1OfPOnCurv2d & operator = (const Extrema_Array1OfPOnCurv2d & Other);
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
	Value(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv2d & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") Value;
		const Extrema_POnCurv2d & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") ChangeValue;
		Extrema_POnCurv2d & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") Extrema_Array1OfPOnCurv2d::~Extrema_Array1OfPOnCurv2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_Array1OfPOnCurv2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_Array1OfPOnSurf;
class Extrema_Array1OfPOnSurf {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Extrema_Array1OfPOnSurf;
		 Extrema_Array1OfPOnSurf (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(Extrema_POnSurf)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Extrema_Array1OfPOnSurf;
		 Extrema_Array1OfPOnSurf (const Extrema_POnSurf & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(Extrema_POnSurf)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Extrema_POnSurf & V);
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
	Other(Extrema_Array1OfPOnSurf)

Returns:
	Extrema_Array1OfPOnSurf

No detailed docstring for this function.") Assign;
		const Extrema_Array1OfPOnSurf & Assign (const Extrema_Array1OfPOnSurf & Other);
		%feature("autodoc", "Args:
	Other(Extrema_Array1OfPOnSurf)

Returns:
	Extrema_Array1OfPOnSurf

No detailed docstring for this function.") operator=;
		const Extrema_Array1OfPOnSurf & operator = (const Extrema_Array1OfPOnSurf & Other);
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
	Value(Extrema_POnSurf)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnSurf & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Extrema_POnSurf

No detailed docstring for this function.") Value;
		const Extrema_POnSurf & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Extrema_POnSurf

No detailed docstring for this function.") ChangeValue;
		Extrema_POnSurf & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") Extrema_Array1OfPOnSurf::~Extrema_Array1OfPOnSurf %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_Array1OfPOnSurf {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_Array2OfPOnCurv;
class Extrema_Array2OfPOnCurv {
	public:
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Extrema_Array2OfPOnCurv;
		 Extrema_Array2OfPOnCurv (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	Item(Extrema_POnCurv)
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Extrema_Array2OfPOnCurv;
		 Extrema_Array2OfPOnCurv (const Extrema_POnCurv & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	V(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Extrema_POnCurv & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	Other(Extrema_Array2OfPOnCurv)

Returns:
	Extrema_Array2OfPOnCurv

No detailed docstring for this function.") Assign;
		const Extrema_Array2OfPOnCurv & Assign (const Extrema_Array2OfPOnCurv & Other);
		%feature("autodoc", "Args:
	Other(Extrema_Array2OfPOnCurv)

Returns:
	Extrema_Array2OfPOnCurv

No detailed docstring for this function.") operator=;
		const Extrema_Array2OfPOnCurv & operator = (const Extrema_Array2OfPOnCurv & Other);
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
	Value(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Extrema_POnCurv & Value);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Extrema_POnCurv

No detailed docstring for this function.") Value;
		const Extrema_POnCurv & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Extrema_POnCurv

No detailed docstring for this function.") ChangeValue;
		Extrema_POnCurv & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%feature("shadow") Extrema_Array2OfPOnCurv::~Extrema_Array2OfPOnCurv %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_Array2OfPOnCurv {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_Array2OfPOnCurv2d;
class Extrema_Array2OfPOnCurv2d {
	public:
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Extrema_Array2OfPOnCurv2d;
		 Extrema_Array2OfPOnCurv2d (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	Item(Extrema_POnCurv2d)
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Extrema_Array2OfPOnCurv2d;
		 Extrema_Array2OfPOnCurv2d (const Extrema_POnCurv2d & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	V(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Extrema_POnCurv2d & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	Other(Extrema_Array2OfPOnCurv2d)

Returns:
	Extrema_Array2OfPOnCurv2d

No detailed docstring for this function.") Assign;
		const Extrema_Array2OfPOnCurv2d & Assign (const Extrema_Array2OfPOnCurv2d & Other);
		%feature("autodoc", "Args:
	Other(Extrema_Array2OfPOnCurv2d)

Returns:
	Extrema_Array2OfPOnCurv2d

No detailed docstring for this function.") operator=;
		const Extrema_Array2OfPOnCurv2d & operator = (const Extrema_Array2OfPOnCurv2d & Other);
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
	Value(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Extrema_POnCurv2d & Value);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") Value;
		const Extrema_POnCurv2d & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") ChangeValue;
		Extrema_POnCurv2d & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%feature("shadow") Extrema_Array2OfPOnCurv2d::~Extrema_Array2OfPOnCurv2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_Array2OfPOnCurv2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_Array2OfPOnSurf;
class Extrema_Array2OfPOnSurf {
	public:
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Extrema_Array2OfPOnSurf;
		 Extrema_Array2OfPOnSurf (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	Item(Extrema_POnSurf)
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Extrema_Array2OfPOnSurf;
		 Extrema_Array2OfPOnSurf (const Extrema_POnSurf & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	V(Extrema_POnSurf)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Extrema_POnSurf & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	Other(Extrema_Array2OfPOnSurf)

Returns:
	Extrema_Array2OfPOnSurf

No detailed docstring for this function.") Assign;
		const Extrema_Array2OfPOnSurf & Assign (const Extrema_Array2OfPOnSurf & Other);
		%feature("autodoc", "Args:
	Other(Extrema_Array2OfPOnSurf)

Returns:
	Extrema_Array2OfPOnSurf

No detailed docstring for this function.") operator=;
		const Extrema_Array2OfPOnSurf & operator = (const Extrema_Array2OfPOnSurf & Other);
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
	Value(Extrema_POnSurf)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Extrema_POnSurf & Value);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Extrema_POnSurf

No detailed docstring for this function.") Value;
		const Extrema_POnSurf & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Extrema_POnSurf

No detailed docstring for this function.") ChangeValue;
		Extrema_POnSurf & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%feature("shadow") Extrema_Array2OfPOnSurf::~Extrema_Array2OfPOnSurf %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_Array2OfPOnSurf {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_Array2OfPOnSurfParams;
class Extrema_Array2OfPOnSurfParams {
	public:
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Extrema_Array2OfPOnSurfParams;
		 Extrema_Array2OfPOnSurfParams (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	Item(Extrema_POnSurfParams)
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Extrema_Array2OfPOnSurfParams;
		 Extrema_Array2OfPOnSurfParams (const Extrema_POnSurfParams & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	V(Extrema_POnSurfParams)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Extrema_POnSurfParams & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	Other(Extrema_Array2OfPOnSurfParams)

Returns:
	Extrema_Array2OfPOnSurfParams

No detailed docstring for this function.") Assign;
		const Extrema_Array2OfPOnSurfParams & Assign (const Extrema_Array2OfPOnSurfParams & Other);
		%feature("autodoc", "Args:
	Other(Extrema_Array2OfPOnSurfParams)

Returns:
	Extrema_Array2OfPOnSurfParams

No detailed docstring for this function.") operator=;
		const Extrema_Array2OfPOnSurfParams & operator = (const Extrema_Array2OfPOnSurfParams & Other);
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
	Value(Extrema_POnSurfParams)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Extrema_POnSurfParams & Value);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Extrema_POnSurfParams

No detailed docstring for this function.") Value;
		const Extrema_POnSurfParams & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Extrema_POnSurfParams

No detailed docstring for this function.") ChangeValue;
		Extrema_POnSurfParams & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%feature("shadow") Extrema_Array2OfPOnSurfParams::~Extrema_Array2OfPOnSurfParams %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_Array2OfPOnSurfParams {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_CCFOfECC2dOfExtCC2d;
class Extrema_CCFOfECC2dOfExtCC2d : public math_FunctionSetWithDerivatives {
	public:
		%feature("autodoc", "Args:
	thetol(Standard_Real)=1.0e-10

Returns:
	None

No detailed docstring for this function.") Extrema_CCFOfECC2dOfExtCC2d;
		 Extrema_CCFOfECC2dOfExtCC2d (const Standard_Real thetol = 1.0e-10);
		%feature("autodoc", "Args:
	C1(Adaptor2d_Curve2d)
	C2(Adaptor2d_Curve2d)
	thetol(Standard_Real)=1.0e-10

Returns:
	None

No detailed docstring for this function.") Extrema_CCFOfECC2dOfExtCC2d;
		 Extrema_CCFOfECC2dOfExtCC2d (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2,const Standard_Real thetol = 1.0e-10);
		%feature("autodoc", "Args:
	theRank(Standard_Integer)
	C1(Adaptor2d_Curve2d)

Returns:
	None

No detailed docstring for this function.") SetCurve;
		void SetCurve (const Standard_Integer theRank,const Adaptor2d_Curve2d & C1);
		%feature("autodoc", "Args:
	theTol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetTolerance;
		void SetTolerance (const Standard_Real theTol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "Args:
	UV(math_Vector)
	F(math_Vector)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") Value;
		virtual Standard_Boolean Value (const math_Vector & UV,math_Vector & F);
		%feature("autodoc", "Args:
	UV(math_Vector)
	DF(math_Matrix)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & UV,math_Matrix & DF);
		%feature("autodoc", "Args:
	UV(math_Vector)
	F(math_Vector)
	DF(math_Matrix)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Values;
		Standard_Boolean Values (const math_Vector & UV,math_Vector & F,math_Matrix & DF);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

No detailed docstring for this function.") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)
	P1(Extrema_POnCurv2d)
	P2(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv2d & P1,Extrema_POnCurv2d & P2);
		%feature("autodoc", "Args:
	theRank(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") CurvePtr;
		Standard_Address CurvePtr (const Standard_Integer theRank);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Tolerance;
		Standard_Real Tolerance ();
		%feature("autodoc", "Args:
	theUfirst(math_Vector)
	theUlast(math_Vector)

Returns:
	None

No detailed docstring for this function.") SubIntervalInitialize;
		void SubIntervalInitialize (const math_Vector & theUfirst,const math_Vector & theUlast);
		%feature("autodoc", "Args:
	C(Standard_Address)

Returns:
	Standard_Real

No detailed docstring for this function.") SearchOfTolerance;
		Standard_Real SearchOfTolerance (const Standard_Address C);
};


%feature("shadow") Extrema_CCFOfECC2dOfExtCC2d::~Extrema_CCFOfECC2dOfExtCC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_CCFOfECC2dOfExtCC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_CCFOfECCOfExtCC;
class Extrema_CCFOfECCOfExtCC : public math_FunctionSetWithDerivatives {
	public:
		%feature("autodoc", "Args:
	thetol(Standard_Real)=1.0e-10

Returns:
	None

No detailed docstring for this function.") Extrema_CCFOfECCOfExtCC;
		 Extrema_CCFOfECCOfExtCC (const Standard_Real thetol = 1.0e-10);
		%feature("autodoc", "Args:
	C1(Adaptor3d_Curve)
	C2(Adaptor3d_Curve)
	thetol(Standard_Real)=1.0e-10

Returns:
	None

No detailed docstring for this function.") Extrema_CCFOfECCOfExtCC;
		 Extrema_CCFOfECCOfExtCC (const Adaptor3d_Curve & C1,const Adaptor3d_Curve & C2,const Standard_Real thetol = 1.0e-10);
		%feature("autodoc", "Args:
	theRank(Standard_Integer)
	C1(Adaptor3d_Curve)

Returns:
	None

No detailed docstring for this function.") SetCurve;
		void SetCurve (const Standard_Integer theRank,const Adaptor3d_Curve & C1);
		%feature("autodoc", "Args:
	theTol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetTolerance;
		void SetTolerance (const Standard_Real theTol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "Args:
	UV(math_Vector)
	F(math_Vector)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") Value;
		virtual Standard_Boolean Value (const math_Vector & UV,math_Vector & F);
		%feature("autodoc", "Args:
	UV(math_Vector)
	DF(math_Matrix)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & UV,math_Matrix & DF);
		%feature("autodoc", "Args:
	UV(math_Vector)
	F(math_Vector)
	DF(math_Matrix)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Values;
		Standard_Boolean Values (const math_Vector & UV,math_Vector & F,math_Matrix & DF);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

No detailed docstring for this function.") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)
	P1(Extrema_POnCurv)
	P2(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv & P1,Extrema_POnCurv & P2);
		%feature("autodoc", "Args:
	theRank(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") CurvePtr;
		Standard_Address CurvePtr (const Standard_Integer theRank);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Tolerance;
		Standard_Real Tolerance ();
		%feature("autodoc", "Args:
	theUfirst(math_Vector)
	theUlast(math_Vector)

Returns:
	None

No detailed docstring for this function.") SubIntervalInitialize;
		void SubIntervalInitialize (const math_Vector & theUfirst,const math_Vector & theUlast);
		%feature("autodoc", "Args:
	C(Standard_Address)

Returns:
	Standard_Real

No detailed docstring for this function.") SearchOfTolerance;
		Standard_Real SearchOfTolerance (const Standard_Address C);
};


%feature("shadow") Extrema_CCFOfECCOfExtCC::~Extrema_CCFOfECCOfExtCC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_CCFOfECCOfExtCC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_CCFOfELCC2dOfLocateExtCC2d;
class Extrema_CCFOfELCC2dOfLocateExtCC2d : public math_FunctionSetWithDerivatives {
	public:
		%feature("autodoc", "Args:
	thetol(Standard_Real)=1.0e-10

Returns:
	None

No detailed docstring for this function.") Extrema_CCFOfELCC2dOfLocateExtCC2d;
		 Extrema_CCFOfELCC2dOfLocateExtCC2d (const Standard_Real thetol = 1.0e-10);
		%feature("autodoc", "Args:
	C1(Adaptor2d_Curve2d)
	C2(Adaptor2d_Curve2d)
	thetol(Standard_Real)=1.0e-10

Returns:
	None

No detailed docstring for this function.") Extrema_CCFOfELCC2dOfLocateExtCC2d;
		 Extrema_CCFOfELCC2dOfLocateExtCC2d (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2,const Standard_Real thetol = 1.0e-10);
		%feature("autodoc", "Args:
	theRank(Standard_Integer)
	C1(Adaptor2d_Curve2d)

Returns:
	None

No detailed docstring for this function.") SetCurve;
		void SetCurve (const Standard_Integer theRank,const Adaptor2d_Curve2d & C1);
		%feature("autodoc", "Args:
	theTol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetTolerance;
		void SetTolerance (const Standard_Real theTol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "Args:
	UV(math_Vector)
	F(math_Vector)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") Value;
		virtual Standard_Boolean Value (const math_Vector & UV,math_Vector & F);
		%feature("autodoc", "Args:
	UV(math_Vector)
	DF(math_Matrix)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & UV,math_Matrix & DF);
		%feature("autodoc", "Args:
	UV(math_Vector)
	F(math_Vector)
	DF(math_Matrix)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Values;
		Standard_Boolean Values (const math_Vector & UV,math_Vector & F,math_Matrix & DF);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

No detailed docstring for this function.") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)
	P1(Extrema_POnCurv2d)
	P2(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv2d & P1,Extrema_POnCurv2d & P2);
		%feature("autodoc", "Args:
	theRank(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") CurvePtr;
		Standard_Address CurvePtr (const Standard_Integer theRank);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Tolerance;
		Standard_Real Tolerance ();
		%feature("autodoc", "Args:
	theUfirst(math_Vector)
	theUlast(math_Vector)

Returns:
	None

No detailed docstring for this function.") SubIntervalInitialize;
		void SubIntervalInitialize (const math_Vector & theUfirst,const math_Vector & theUlast);
		%feature("autodoc", "Args:
	C(Standard_Address)

Returns:
	Standard_Real

No detailed docstring for this function.") SearchOfTolerance;
		Standard_Real SearchOfTolerance (const Standard_Address C);
};


%feature("shadow") Extrema_CCFOfELCC2dOfLocateExtCC2d::~Extrema_CCFOfELCC2dOfLocateExtCC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_CCFOfELCC2dOfLocateExtCC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_CCFOfELCCOfLocateExtCC;
class Extrema_CCFOfELCCOfLocateExtCC : public math_FunctionSetWithDerivatives {
	public:
		%feature("autodoc", "Args:
	thetol(Standard_Real)=1.0e-10

Returns:
	None

No detailed docstring for this function.") Extrema_CCFOfELCCOfLocateExtCC;
		 Extrema_CCFOfELCCOfLocateExtCC (const Standard_Real thetol = 1.0e-10);
		%feature("autodoc", "Args:
	C1(Adaptor3d_Curve)
	C2(Adaptor3d_Curve)
	thetol(Standard_Real)=1.0e-10

Returns:
	None

No detailed docstring for this function.") Extrema_CCFOfELCCOfLocateExtCC;
		 Extrema_CCFOfELCCOfLocateExtCC (const Adaptor3d_Curve & C1,const Adaptor3d_Curve & C2,const Standard_Real thetol = 1.0e-10);
		%feature("autodoc", "Args:
	theRank(Standard_Integer)
	C1(Adaptor3d_Curve)

Returns:
	None

No detailed docstring for this function.") SetCurve;
		void SetCurve (const Standard_Integer theRank,const Adaptor3d_Curve & C1);
		%feature("autodoc", "Args:
	theTol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetTolerance;
		void SetTolerance (const Standard_Real theTol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "Args:
	UV(math_Vector)
	F(math_Vector)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") Value;
		virtual Standard_Boolean Value (const math_Vector & UV,math_Vector & F);
		%feature("autodoc", "Args:
	UV(math_Vector)
	DF(math_Matrix)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & UV,math_Matrix & DF);
		%feature("autodoc", "Args:
	UV(math_Vector)
	F(math_Vector)
	DF(math_Matrix)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Values;
		Standard_Boolean Values (const math_Vector & UV,math_Vector & F,math_Matrix & DF);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

No detailed docstring for this function.") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)
	P1(Extrema_POnCurv)
	P2(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv & P1,Extrema_POnCurv & P2);
		%feature("autodoc", "Args:
	theRank(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") CurvePtr;
		Standard_Address CurvePtr (const Standard_Integer theRank);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Tolerance;
		Standard_Real Tolerance ();
		%feature("autodoc", "Args:
	theUfirst(math_Vector)
	theUlast(math_Vector)

Returns:
	None

No detailed docstring for this function.") SubIntervalInitialize;
		void SubIntervalInitialize (const math_Vector & theUfirst,const math_Vector & theUlast);
		%feature("autodoc", "Args:
	C(Standard_Address)

Returns:
	Standard_Real

No detailed docstring for this function.") SearchOfTolerance;
		Standard_Real SearchOfTolerance (const Standard_Address C);
};


%feature("shadow") Extrema_CCFOfELCCOfLocateExtCC::~Extrema_CCFOfELCCOfLocateExtCC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_CCFOfELCCOfLocateExtCC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_CCLocFOfLocECC2dOfLocateExtCC2d;
class Extrema_CCLocFOfLocECC2dOfLocateExtCC2d : public math_FunctionSetWithDerivatives {
	public:
		%feature("autodoc", "Args:
	thetol(Standard_Real)=1.0e-10

Returns:
	None

No detailed docstring for this function.") Extrema_CCLocFOfLocECC2dOfLocateExtCC2d;
		 Extrema_CCLocFOfLocECC2dOfLocateExtCC2d (const Standard_Real thetol = 1.0e-10);
		%feature("autodoc", "Args:
	C1(Adaptor2d_Curve2d)
	C2(Adaptor2d_Curve2d)
	thetol(Standard_Real)=1.0e-10

Returns:
	None

No detailed docstring for this function.") Extrema_CCLocFOfLocECC2dOfLocateExtCC2d;
		 Extrema_CCLocFOfLocECC2dOfLocateExtCC2d (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2,const Standard_Real thetol = 1.0e-10);
		%feature("autodoc", "Args:
	theRank(Standard_Integer)
	C1(Adaptor2d_Curve2d)

Returns:
	None

No detailed docstring for this function.") SetCurve;
		void SetCurve (const Standard_Integer theRank,const Adaptor2d_Curve2d & C1);
		%feature("autodoc", "Args:
	theTol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetTolerance;
		void SetTolerance (const Standard_Real theTol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "Args:
	UV(math_Vector)
	F(math_Vector)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") Value;
		virtual Standard_Boolean Value (const math_Vector & UV,math_Vector & F);
		%feature("autodoc", "Args:
	UV(math_Vector)
	DF(math_Matrix)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & UV,math_Matrix & DF);
		%feature("autodoc", "Args:
	UV(math_Vector)
	F(math_Vector)
	DF(math_Matrix)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Values;
		Standard_Boolean Values (const math_Vector & UV,math_Vector & F,math_Matrix & DF);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

No detailed docstring for this function.") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)
	P1(Extrema_POnCurv2d)
	P2(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv2d & P1,Extrema_POnCurv2d & P2);
		%feature("autodoc", "Args:
	theRank(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") CurvePtr;
		Standard_Address CurvePtr (const Standard_Integer theRank);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Tolerance;
		Standard_Real Tolerance ();
		%feature("autodoc", "Args:
	theUfirst(math_Vector)
	theUlast(math_Vector)

Returns:
	None

No detailed docstring for this function.") SubIntervalInitialize;
		void SubIntervalInitialize (const math_Vector & theUfirst,const math_Vector & theUlast);
		%feature("autodoc", "Args:
	C(Standard_Address)

Returns:
	Standard_Real

No detailed docstring for this function.") SearchOfTolerance;
		Standard_Real SearchOfTolerance (const Standard_Address C);
};


%feature("shadow") Extrema_CCLocFOfLocECC2dOfLocateExtCC2d::~Extrema_CCLocFOfLocECC2dOfLocateExtCC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_CCLocFOfLocECC2dOfLocateExtCC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_CCLocFOfLocECCOfLocateExtCC;
class Extrema_CCLocFOfLocECCOfLocateExtCC : public math_FunctionSetWithDerivatives {
	public:
		%feature("autodoc", "Args:
	thetol(Standard_Real)=1.0e-10

Returns:
	None

No detailed docstring for this function.") Extrema_CCLocFOfLocECCOfLocateExtCC;
		 Extrema_CCLocFOfLocECCOfLocateExtCC (const Standard_Real thetol = 1.0e-10);
		%feature("autodoc", "Args:
	C1(Adaptor3d_Curve)
	C2(Adaptor3d_Curve)
	thetol(Standard_Real)=1.0e-10

Returns:
	None

No detailed docstring for this function.") Extrema_CCLocFOfLocECCOfLocateExtCC;
		 Extrema_CCLocFOfLocECCOfLocateExtCC (const Adaptor3d_Curve & C1,const Adaptor3d_Curve & C2,const Standard_Real thetol = 1.0e-10);
		%feature("autodoc", "Args:
	theRank(Standard_Integer)
	C1(Adaptor3d_Curve)

Returns:
	None

No detailed docstring for this function.") SetCurve;
		void SetCurve (const Standard_Integer theRank,const Adaptor3d_Curve & C1);
		%feature("autodoc", "Args:
	theTol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetTolerance;
		void SetTolerance (const Standard_Real theTol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "Args:
	UV(math_Vector)
	F(math_Vector)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") Value;
		virtual Standard_Boolean Value (const math_Vector & UV,math_Vector & F);
		%feature("autodoc", "Args:
	UV(math_Vector)
	DF(math_Matrix)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & UV,math_Matrix & DF);
		%feature("autodoc", "Args:
	UV(math_Vector)
	F(math_Vector)
	DF(math_Matrix)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Values;
		Standard_Boolean Values (const math_Vector & UV,math_Vector & F,math_Matrix & DF);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

No detailed docstring for this function.") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)
	P1(Extrema_POnCurv)
	P2(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv & P1,Extrema_POnCurv & P2);
		%feature("autodoc", "Args:
	theRank(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") CurvePtr;
		Standard_Address CurvePtr (const Standard_Integer theRank);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Tolerance;
		Standard_Real Tolerance ();
		%feature("autodoc", "Args:
	theUfirst(math_Vector)
	theUlast(math_Vector)

Returns:
	None

No detailed docstring for this function.") SubIntervalInitialize;
		void SubIntervalInitialize (const math_Vector & theUfirst,const math_Vector & theUlast);
		%feature("autodoc", "Args:
	C(Standard_Address)

Returns:
	Standard_Real

No detailed docstring for this function.") SearchOfTolerance;
		Standard_Real SearchOfTolerance (const Standard_Address C);
};


%feature("shadow") Extrema_CCLocFOfLocECCOfLocateExtCC::~Extrema_CCLocFOfLocECCOfLocateExtCC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_CCLocFOfLocECCOfLocateExtCC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_CCache2dOfExtCC2d;
class Extrema_CCache2dOfExtCC2d : public Standard_Transient {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_CCache2dOfExtCC2d;
		 Extrema_CCache2dOfExtCC2d ();
		%feature("autodoc", "Args:
	theC(Adaptor2d_Curve2d)
	theUFirst(Standard_Real)
	theULast(Standard_Real)
	theNbSamples(Standard_Integer)
	theToCalculate(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Extrema_CCache2dOfExtCC2d;
		 Extrema_CCache2dOfExtCC2d (const Adaptor2d_Curve2d & theC,const Standard_Real theUFirst,const Standard_Real theULast,const Standard_Integer theNbSamples,const Standard_Boolean theToCalculate);
		%feature("autodoc", "Args:
	theC(Adaptor2d_Curve2d)
	theUFirst(Standard_Real)
	theULast(Standard_Real)
	IntervalsCN(TColStd_Array1OfReal)
	StartIndex(Standard_Integer)
	EndIndex(Standard_Integer)
	Coeff(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Extrema_CCache2dOfExtCC2d;
		 Extrema_CCache2dOfExtCC2d (const Adaptor2d_Curve2d & theC,const Standard_Real theUFirst,const Standard_Real theULast,const TColStd_Array1OfReal & IntervalsCN,const Standard_Integer StartIndex,const Standard_Integer EndIndex,const Standard_Real Coeff);
		%feature("autodoc", "Args:
	theC(Adaptor2d_Curve2d)
	theNbSamples(Standard_Integer)
	theToCalculate(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetCurve;
		void SetCurve (const Adaptor2d_Curve2d & theC,const Standard_Integer theNbSamples,const Standard_Boolean theToCalculate);
		%feature("autodoc", "Args:
	theC(Adaptor2d_Curve2d)
	theUFirst(Standard_Real)
	theULast(Standard_Real)
	theNbSamples(Standard_Integer)
	theToCalculate(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetCurve;
		void SetCurve (const Adaptor2d_Curve2d & theC,const Standard_Real theUFirst,const Standard_Real theULast,const Standard_Integer theNbSamples,const Standard_Boolean theToCalculate);
		%feature("autodoc", "Args:
	Uinf(Standard_Real)
	Usup(Standard_Real)
	theToCalculate(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetRange;
		void SetRange (const Standard_Real Uinf,const Standard_Real Usup,const Standard_Boolean theToCalculate);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") CalculatePoints;
		void CalculatePoints ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsValid;
		Standard_Boolean IsValid ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HArray1OfReal

No detailed docstring for this function.") Parameters;
		const Handle_TColStd_HArray1OfReal & Parameters ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColgp_HArray1OfPnt2d

No detailed docstring for this function.") Points;
		const Handle_TColgp_HArray1OfPnt2d & Points ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Address

No detailed docstring for this function.") CurvePtr;
		Standard_Address CurvePtr ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbSamples;
		Standard_Integer NbSamples ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") LastParameter;
		Standard_Real LastParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") TrimFirstParameter;
		Standard_Real TrimFirstParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") TrimLastParameter;
		Standard_Real TrimLastParameter ();
};


%feature("shadow") Extrema_CCache2dOfExtCC2d::~Extrema_CCache2dOfExtCC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_CCache2dOfExtCC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_CCache2dOfExtCC2d {
	Handle_Extrema_CCache2dOfExtCC2d GetHandle() {
	return *(Handle_Extrema_CCache2dOfExtCC2d*) &$self;
	}
};

%nodefaultctor Handle_Extrema_CCache2dOfExtCC2d;
class Handle_Extrema_CCache2dOfExtCC2d : public Handle_Standard_Transient {

    public:
        // constructors
        Handle_Extrema_CCache2dOfExtCC2d();
        Handle_Extrema_CCache2dOfExtCC2d(const Handle_Extrema_CCache2dOfExtCC2d &aHandle);
        Handle_Extrema_CCache2dOfExtCC2d(const Extrema_CCache2dOfExtCC2d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_CCache2dOfExtCC2d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_CCache2dOfExtCC2d {
    Extrema_CCache2dOfExtCC2d* GetObject() {
    return (Extrema_CCache2dOfExtCC2d*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_CCache2dOfExtCC2d::~Handle_Extrema_CCache2dOfExtCC2d %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_CCache2dOfExtCC2d {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_CCacheOfExtCC;
class Extrema_CCacheOfExtCC : public Standard_Transient {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_CCacheOfExtCC;
		 Extrema_CCacheOfExtCC ();
		%feature("autodoc", "Args:
	theC(Adaptor3d_Curve)
	theUFirst(Standard_Real)
	theULast(Standard_Real)
	theNbSamples(Standard_Integer)
	theToCalculate(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Extrema_CCacheOfExtCC;
		 Extrema_CCacheOfExtCC (const Adaptor3d_Curve & theC,const Standard_Real theUFirst,const Standard_Real theULast,const Standard_Integer theNbSamples,const Standard_Boolean theToCalculate);
		%feature("autodoc", "Args:
	theC(Adaptor3d_Curve)
	theUFirst(Standard_Real)
	theULast(Standard_Real)
	IntervalsCN(TColStd_Array1OfReal)
	StartIndex(Standard_Integer)
	EndIndex(Standard_Integer)
	Coeff(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Extrema_CCacheOfExtCC;
		 Extrema_CCacheOfExtCC (const Adaptor3d_Curve & theC,const Standard_Real theUFirst,const Standard_Real theULast,const TColStd_Array1OfReal & IntervalsCN,const Standard_Integer StartIndex,const Standard_Integer EndIndex,const Standard_Real Coeff);
		%feature("autodoc", "Args:
	theC(Adaptor3d_Curve)
	theNbSamples(Standard_Integer)
	theToCalculate(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetCurve;
		void SetCurve (const Adaptor3d_Curve & theC,const Standard_Integer theNbSamples,const Standard_Boolean theToCalculate);
		%feature("autodoc", "Args:
	theC(Adaptor3d_Curve)
	theUFirst(Standard_Real)
	theULast(Standard_Real)
	theNbSamples(Standard_Integer)
	theToCalculate(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetCurve;
		void SetCurve (const Adaptor3d_Curve & theC,const Standard_Real theUFirst,const Standard_Real theULast,const Standard_Integer theNbSamples,const Standard_Boolean theToCalculate);
		%feature("autodoc", "Args:
	Uinf(Standard_Real)
	Usup(Standard_Real)
	theToCalculate(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetRange;
		void SetRange (const Standard_Real Uinf,const Standard_Real Usup,const Standard_Boolean theToCalculate);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") CalculatePoints;
		void CalculatePoints ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsValid;
		Standard_Boolean IsValid ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HArray1OfReal

No detailed docstring for this function.") Parameters;
		const Handle_TColStd_HArray1OfReal & Parameters ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColgp_HArray1OfPnt

No detailed docstring for this function.") Points;
		const Handle_TColgp_HArray1OfPnt & Points ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Address

No detailed docstring for this function.") CurvePtr;
		Standard_Address CurvePtr ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbSamples;
		Standard_Integer NbSamples ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") LastParameter;
		Standard_Real LastParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") TrimFirstParameter;
		Standard_Real TrimFirstParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") TrimLastParameter;
		Standard_Real TrimLastParameter ();
};


%feature("shadow") Extrema_CCacheOfExtCC::~Extrema_CCacheOfExtCC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_CCacheOfExtCC {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_CCacheOfExtCC {
	Handle_Extrema_CCacheOfExtCC GetHandle() {
	return *(Handle_Extrema_CCacheOfExtCC*) &$self;
	}
};

%nodefaultctor Handle_Extrema_CCacheOfExtCC;
class Handle_Extrema_CCacheOfExtCC : public Handle_Standard_Transient {

    public:
        // constructors
        Handle_Extrema_CCacheOfExtCC();
        Handle_Extrema_CCacheOfExtCC(const Handle_Extrema_CCacheOfExtCC &aHandle);
        Handle_Extrema_CCacheOfExtCC(const Extrema_CCacheOfExtCC *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_CCacheOfExtCC DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_CCacheOfExtCC {
    Extrema_CCacheOfExtCC* GetObject() {
    return (Extrema_CCacheOfExtCC*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_CCacheOfExtCC::~Handle_Extrema_CCacheOfExtCC %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_CCacheOfExtCC {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_Curve2dTool;
class Extrema_Curve2dTool {
	public:
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)

Returns:
	static Standard_Real

No detailed docstring for this function.") FirstParameter;
		static Standard_Real FirstParameter (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)

Returns:
	static Standard_Real

No detailed docstring for this function.") LastParameter;
		static Standard_Real LastParameter (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)

Returns:
	static GeomAbs_Shape

No detailed docstring for this function.") Continuity;
		static GeomAbs_Shape Continuity (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	S(GeomAbs_Shape)

Returns:
	static Standard_Integer

If necessary,   breaks the curve  in  intervals of  
         continuity <S>.     And   returns  the  number  of  
         intervals.") NbIntervals;
		static Standard_Integer NbIntervals (const Adaptor2d_Curve2d & C,const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	T(TColStd_Array1OfReal)
	S(GeomAbs_Shape)

Returns:
	static void

Stores in <T> the  parameters bounding the intervals  
         of continuity <S>.") Intervals;
		static void Intervals (const Adaptor2d_Curve2d & C,TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsClosed;
		static Standard_Boolean IsClosed (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsPeriodic;
		static Standard_Boolean IsPeriodic (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)

Returns:
	static Standard_Real

No detailed docstring for this function.") Period;
		static Standard_Real Period (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	U(Standard_Real)

Returns:
	static gp_Pnt2d

Computes the point of parameter U on the curve.") Value;
		static gp_Pnt2d Value (const Adaptor2d_Curve2d & C,const Standard_Real U);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	U(Standard_Real)
	P(gp_Pnt2d)

Returns:
	static void

Computes the point of parameter U on the curve.") D0;
		static void D0 (const Adaptor2d_Curve2d & C,const Standard_Real U,gp_Pnt2d & P);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	U(Standard_Real)
	P(gp_Pnt2d)
	V(gp_Vec2d)

Returns:
	static void

Computes the point of parameter U on the curve with its  
 first derivative.") D1;
		static void D1 (const Adaptor2d_Curve2d & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	U(Standard_Real)
	P(gp_Pnt2d)
	V1(gp_Vec2d)
	V2(gp_Vec2d)

Returns:
	static void

Returns the point P of parameter U, the first and second  
 derivatives V1 and V2.") D2;
		static void D2 (const Adaptor2d_Curve2d & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	U(Standard_Real)
	P(gp_Pnt2d)
	V1(gp_Vec2d)
	V2(gp_Vec2d)
	V3(gp_Vec2d)

Returns:
	static void

Returns the point P of parameter U, the first, the second  
 and the third derivative.") D3;
		static void D3 (const Adaptor2d_Curve2d & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	U(Standard_Real)
	N(Standard_Integer)

Returns:
	static gp_Vec2d

The returned vector gives the value of the derivative for the  
 order of derivation N.") DN;
		static gp_Vec2d DN (const Adaptor2d_Curve2d & C,const Standard_Real U,const Standard_Integer N);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	R3d(Standard_Real)

Returns:
	static Standard_Real

Returns the parametric  resolution corresponding  
        to the real space resolution <R3d>.") Resolution;
		static Standard_Real Resolution (const Adaptor2d_Curve2d & C,const Standard_Real R3d);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)

Returns:
	static GeomAbs_CurveType

Returns  the  type of the   curve  in the  current  
         interval :   Line,   Circle,   Ellipse, Hyperbola,  
         Parabola, BezierCurve, BSplineCurve, OtherCurve.") GetType;
		static GeomAbs_CurveType GetType (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)

Returns:
	static gp_Lin2d

No detailed docstring for this function.") Line;
		static gp_Lin2d Line (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)

Returns:
	static gp_Circ2d

No detailed docstring for this function.") Circle;
		static gp_Circ2d Circle (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)

Returns:
	static gp_Elips2d

No detailed docstring for this function.") Ellipse;
		static gp_Elips2d Ellipse (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)

Returns:
	static gp_Hypr2d

No detailed docstring for this function.") Hyperbola;
		static gp_Hypr2d Hyperbola (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)

Returns:
	static gp_Parab2d

No detailed docstring for this function.") Parabola;
		static gp_Parab2d Parabola (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)

Returns:
	static Standard_Integer

No detailed docstring for this function.") Degree;
		static Standard_Integer Degree (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsRational;
		static Standard_Boolean IsRational (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbPoles;
		static Standard_Integer NbPoles (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbKnots;
		static Standard_Integer NbKnots (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)

Returns:
	static Handle_Geom2d_BezierCurve

No detailed docstring for this function.") Bezier;
		static Handle_Geom2d_BezierCurve Bezier (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)

Returns:
	static Handle_Geom2d_BSplineCurve

No detailed docstring for this function.") BSpline;
		static Handle_Geom2d_BSplineCurve BSpline (const Adaptor2d_Curve2d & C);
};


%feature("shadow") Extrema_Curve2dTool::~Extrema_Curve2dTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_Curve2dTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_CurveTool;
class Extrema_CurveTool {
	public:
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)

Returns:
	static Standard_Real

No detailed docstring for this function.") FirstParameter;
		static Standard_Real FirstParameter (const Adaptor3d_Curve & C);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)

Returns:
	static Standard_Real

No detailed docstring for this function.") LastParameter;
		static Standard_Real LastParameter (const Adaptor3d_Curve & C);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)

Returns:
	static GeomAbs_Shape

No detailed docstring for this function.") Continuity;
		static GeomAbs_Shape Continuity (const Adaptor3d_Curve & C);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	S(GeomAbs_Shape)

Returns:
	static Standard_Integer

Returns  the number  of  intervals for  continuity  
         <S>. May be one if Continuity(me) >= <S>") NbIntervals;
		static Standard_Integer NbIntervals (Adaptor3d_Curve & C,const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	T(TColStd_Array1OfReal)
	S(GeomAbs_Shape)

Returns:
	static void

Stores in <T> the  parameters bounding the intervals  
         of continuity <S>.  
 
         The array must provide  enough room to  accomodate  
         for the parameters. i.e. T.Length() > NbIntervals()") Intervals;
		static void Intervals (Adaptor3d_Curve & C,TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsPeriodic;
		static Standard_Boolean IsPeriodic (const Adaptor3d_Curve & C);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)

Returns:
	static Standard_Real

No detailed docstring for this function.") Period;
		static Standard_Real Period (const Adaptor3d_Curve & C);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	R3d(Standard_Real)

Returns:
	static Standard_Real

No detailed docstring for this function.") Resolution;
		static Standard_Real Resolution (const Adaptor3d_Curve & C,const Standard_Real R3d);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)

Returns:
	static GeomAbs_CurveType

No detailed docstring for this function.") GetType;
		static GeomAbs_CurveType GetType (const Adaptor3d_Curve & C);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	U(Standard_Real)

Returns:
	static gp_Pnt

No detailed docstring for this function.") Value;
		static gp_Pnt Value (const Adaptor3d_Curve & C,const Standard_Real U);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	U(Standard_Real)
	P(gp_Pnt)

Returns:
	static void

No detailed docstring for this function.") D0;
		static void D0 (const Adaptor3d_Curve & C,const Standard_Real U,gp_Pnt & P);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	U(Standard_Real)
	P(gp_Pnt)
	V(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") D1;
		static void D1 (const Adaptor3d_Curve & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") D2;
		static void D2 (const Adaptor3d_Curve & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)
	V3(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") D3;
		static void D3 (const Adaptor3d_Curve & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	U(Standard_Real)
	N(Standard_Integer)

Returns:
	static gp_Vec

No detailed docstring for this function.") DN;
		static gp_Vec DN (const Adaptor3d_Curve & C,const Standard_Real U,const Standard_Integer N);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)

Returns:
	static gp_Lin

No detailed docstring for this function.") Line;
		static gp_Lin Line (const Adaptor3d_Curve & C);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)

Returns:
	static gp_Circ

No detailed docstring for this function.") Circle;
		static gp_Circ Circle (const Adaptor3d_Curve & C);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)

Returns:
	static gp_Elips

No detailed docstring for this function.") Ellipse;
		static gp_Elips Ellipse (const Adaptor3d_Curve & C);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)

Returns:
	static gp_Hypr

No detailed docstring for this function.") Hyperbola;
		static gp_Hypr Hyperbola (const Adaptor3d_Curve & C);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)

Returns:
	static gp_Parab

No detailed docstring for this function.") Parabola;
		static gp_Parab Parabola (const Adaptor3d_Curve & C);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)

Returns:
	static Standard_Integer

No detailed docstring for this function.") Degree;
		static Standard_Integer Degree (const Adaptor3d_Curve & C);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsRational;
		static Standard_Boolean IsRational (const Adaptor3d_Curve & C);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbPoles;
		static Standard_Integer NbPoles (const Adaptor3d_Curve & C);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbKnots;
		static Standard_Integer NbKnots (const Adaptor3d_Curve & C);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)

Returns:
	static Handle_Geom_BezierCurve

No detailed docstring for this function.") Bezier;
		static Handle_Geom_BezierCurve Bezier (const Adaptor3d_Curve & C);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)

Returns:
	static Handle_Geom_BSplineCurve

No detailed docstring for this function.") BSpline;
		static Handle_Geom_BSplineCurve BSpline (const Adaptor3d_Curve & C);
};


%feature("shadow") Extrema_CurveTool::~Extrema_CurveTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_CurveTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_ECC2dOfExtCC2d;
class Extrema_ECC2dOfExtCC2d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_ECC2dOfExtCC2d;
		 Extrema_ECC2dOfExtCC2d ();
		%feature("autodoc", "Args:
	C1(Adaptor2d_Curve2d)
	C2(Adaptor2d_Curve2d)
	NbU(Standard_Integer)
	NbV(Standard_Integer)
	TolU(Standard_Real)
	TolV(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Extrema_ECC2dOfExtCC2d;
		 Extrema_ECC2dOfExtCC2d (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real TolU,const Standard_Real TolV);
		%feature("autodoc", "Args:
	C1(Adaptor2d_Curve2d)
	C2(Adaptor2d_Curve2d)
	Uinf(Standard_Real)
	Usup(Standard_Real)
	Vinf(Standard_Real)
	Vsup(Standard_Real)
	NbU(Standard_Integer)
	NbV(Standard_Integer)
	TolU(Standard_Real)
	TolV(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Extrema_ECC2dOfExtCC2d;
		 Extrema_ECC2dOfExtCC2d (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real Vinf,const Standard_Real Vsup,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real TolU,const Standard_Real TolV);
		%feature("autodoc", "Args:
	theRank(Standard_Integer)
	theCache(Handle_Extrema_CCache2dOfExtCC2d)

Returns:
	None

No detailed docstring for this function.") SetCurveCache;
		void SetCurveCache (const Standard_Integer theRank,const Handle_Extrema_CCache2dOfExtCC2d & theCache);
		%feature("autodoc", "Args:
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetTolerance;
		void SetTolerance (const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)=1

Returns:
	Standard_Real

No detailed docstring for this function.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N = 1);
		%feature("autodoc", "Args:
	N(Standard_Integer)
	P1(Extrema_POnCurv2d)
	P2(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv2d & P1,Extrema_POnCurv2d & P2);
};


%feature("shadow") Extrema_ECC2dOfExtCC2d::~Extrema_ECC2dOfExtCC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_ECC2dOfExtCC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_ECCOfExtCC;
class Extrema_ECCOfExtCC {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_ECCOfExtCC;
		 Extrema_ECCOfExtCC ();
		%feature("autodoc", "Args:
	C1(Adaptor3d_Curve)
	C2(Adaptor3d_Curve)
	NbU(Standard_Integer)
	NbV(Standard_Integer)
	TolU(Standard_Real)
	TolV(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Extrema_ECCOfExtCC;
		 Extrema_ECCOfExtCC (const Adaptor3d_Curve & C1,const Adaptor3d_Curve & C2,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real TolU,const Standard_Real TolV);
		%feature("autodoc", "Args:
	C1(Adaptor3d_Curve)
	C2(Adaptor3d_Curve)
	Uinf(Standard_Real)
	Usup(Standard_Real)
	Vinf(Standard_Real)
	Vsup(Standard_Real)
	NbU(Standard_Integer)
	NbV(Standard_Integer)
	TolU(Standard_Real)
	TolV(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Extrema_ECCOfExtCC;
		 Extrema_ECCOfExtCC (const Adaptor3d_Curve & C1,const Adaptor3d_Curve & C2,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real Vinf,const Standard_Real Vsup,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real TolU,const Standard_Real TolV);
		%feature("autodoc", "Args:
	theRank(Standard_Integer)
	theCache(Handle_Extrema_CCacheOfExtCC)

Returns:
	None

No detailed docstring for this function.") SetCurveCache;
		void SetCurveCache (const Standard_Integer theRank,const Handle_Extrema_CCacheOfExtCC & theCache);
		%feature("autodoc", "Args:
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetTolerance;
		void SetTolerance (const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)=1

Returns:
	Standard_Real

No detailed docstring for this function.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N = 1);
		%feature("autodoc", "Args:
	N(Standard_Integer)
	P1(Extrema_POnCurv)
	P2(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv & P1,Extrema_POnCurv & P2);
};


%feature("shadow") Extrema_ECCOfExtCC::~Extrema_ECCOfExtCC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_ECCOfExtCC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_ELCC2dOfLocateExtCC2d;
class Extrema_ELCC2dOfLocateExtCC2d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_ELCC2dOfLocateExtCC2d;
		 Extrema_ELCC2dOfLocateExtCC2d ();
		%feature("autodoc", "Args:
	C1(Adaptor2d_Curve2d)
	C2(Adaptor2d_Curve2d)
	NbU(Standard_Integer)
	NbV(Standard_Integer)
	TolU(Standard_Real)
	TolV(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Extrema_ELCC2dOfLocateExtCC2d;
		 Extrema_ELCC2dOfLocateExtCC2d (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real TolU,const Standard_Real TolV);
		%feature("autodoc", "Args:
	C1(Adaptor2d_Curve2d)
	C2(Adaptor2d_Curve2d)
	Uinf(Standard_Real)
	Usup(Standard_Real)
	Vinf(Standard_Real)
	Vsup(Standard_Real)
	NbU(Standard_Integer)
	NbV(Standard_Integer)
	TolU(Standard_Real)
	TolV(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Extrema_ELCC2dOfLocateExtCC2d;
		 Extrema_ELCC2dOfLocateExtCC2d (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real Vinf,const Standard_Real Vsup,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real TolU,const Standard_Real TolV);
		%feature("autodoc", "Args:
	theRank(Standard_Integer)
	theCache(Handle_Extrema_LCCache2dOfLocateExtCC2d)

Returns:
	None

No detailed docstring for this function.") SetCurveCache;
		void SetCurveCache (const Standard_Integer theRank,const Handle_Extrema_LCCache2dOfLocateExtCC2d & theCache);
		%feature("autodoc", "Args:
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetTolerance;
		void SetTolerance (const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)=1

Returns:
	Standard_Real

No detailed docstring for this function.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N = 1);
		%feature("autodoc", "Args:
	N(Standard_Integer)
	P1(Extrema_POnCurv2d)
	P2(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv2d & P1,Extrema_POnCurv2d & P2);
};


%feature("shadow") Extrema_ELCC2dOfLocateExtCC2d::~Extrema_ELCC2dOfLocateExtCC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_ELCC2dOfLocateExtCC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_ELCCOfLocateExtCC;
class Extrema_ELCCOfLocateExtCC {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_ELCCOfLocateExtCC;
		 Extrema_ELCCOfLocateExtCC ();
		%feature("autodoc", "Args:
	C1(Adaptor3d_Curve)
	C2(Adaptor3d_Curve)
	NbU(Standard_Integer)
	NbV(Standard_Integer)
	TolU(Standard_Real)
	TolV(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Extrema_ELCCOfLocateExtCC;
		 Extrema_ELCCOfLocateExtCC (const Adaptor3d_Curve & C1,const Adaptor3d_Curve & C2,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real TolU,const Standard_Real TolV);
		%feature("autodoc", "Args:
	C1(Adaptor3d_Curve)
	C2(Adaptor3d_Curve)
	Uinf(Standard_Real)
	Usup(Standard_Real)
	Vinf(Standard_Real)
	Vsup(Standard_Real)
	NbU(Standard_Integer)
	NbV(Standard_Integer)
	TolU(Standard_Real)
	TolV(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Extrema_ELCCOfLocateExtCC;
		 Extrema_ELCCOfLocateExtCC (const Adaptor3d_Curve & C1,const Adaptor3d_Curve & C2,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real Vinf,const Standard_Real Vsup,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real TolU,const Standard_Real TolV);
		%feature("autodoc", "Args:
	theRank(Standard_Integer)
	theCache(Handle_Extrema_LCCacheOfLocateExtCC)

Returns:
	None

No detailed docstring for this function.") SetCurveCache;
		void SetCurveCache (const Standard_Integer theRank,const Handle_Extrema_LCCacheOfLocateExtCC & theCache);
		%feature("autodoc", "Args:
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetTolerance;
		void SetTolerance (const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)=1

Returns:
	Standard_Real

No detailed docstring for this function.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N = 1);
		%feature("autodoc", "Args:
	N(Standard_Integer)
	P1(Extrema_POnCurv)
	P2(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv & P1,Extrema_POnCurv & P2);
};


%feature("shadow") Extrema_ELCCOfLocateExtCC::~Extrema_ELCCOfLocateExtCC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_ELCCOfLocateExtCC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_ELPCOfLocateExtPC;
class Extrema_ELPCOfLocateExtPC {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_ELPCOfLocateExtPC;
		 Extrema_ELPCOfLocateExtPC ();
		%feature("autodoc", "Args:
	P(gp_Pnt)
	C(Adaptor3d_Curve)
	Uinf(Standard_Real)
	Usup(Standard_Real)
	TolF(Standard_Real)=1.0e-10

Returns:
	None

No detailed docstring for this function.") Extrema_ELPCOfLocateExtPC;
		 Extrema_ELPCOfLocateExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real TolF = 1.0e-10);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	C(Adaptor3d_Curve)
	TolF(Standard_Real)=1.0e-10

Returns:
	None

No detailed docstring for this function.") Extrema_ELPCOfLocateExtPC;
		 Extrema_ELPCOfLocateExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C,const Standard_Real TolF = 1.0e-10);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	Uinf(Standard_Real)
	Usup(Standard_Real)
	TolF(Standard_Real)=1.0e-10

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Adaptor3d_Curve & C,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real TolF = 1.0e-10);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Pnt & P);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Extrema_POnCurv

No detailed docstring for this function.") Point;
		const Extrema_POnCurv & Point (const Standard_Integer N);
		%feature("autodoc", "Args:
	dist1(Standard_Real)
	dist2(Standard_Real)
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") TrimmedSquareDistances;
		void TrimmedSquareDistances (Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt & P1,gp_Pnt & P2);
};


%feature("shadow") Extrema_ELPCOfLocateExtPC::~Extrema_ELPCOfLocateExtPC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_ELPCOfLocateExtPC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_ELPCOfLocateExtPC2d;
class Extrema_ELPCOfLocateExtPC2d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_ELPCOfLocateExtPC2d;
		 Extrema_ELPCOfLocateExtPC2d ();
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	C(Adaptor2d_Curve2d)
	Uinf(Standard_Real)
	Usup(Standard_Real)
	TolF(Standard_Real)=1.0e-10

Returns:
	None

No detailed docstring for this function.") Extrema_ELPCOfLocateExtPC2d;
		 Extrema_ELPCOfLocateExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real TolF = 1.0e-10);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	C(Adaptor2d_Curve2d)
	TolF(Standard_Real)=1.0e-10

Returns:
	None

No detailed docstring for this function.") Extrema_ELPCOfLocateExtPC2d;
		 Extrema_ELPCOfLocateExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Real TolF = 1.0e-10);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	Uinf(Standard_Real)
	Usup(Standard_Real)
	TolF(Standard_Real)=1.0e-10

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real TolF = 1.0e-10);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Pnt2d & P);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") Point;
		const Extrema_POnCurv2d & Point (const Standard_Integer N);
		%feature("autodoc", "Args:
	dist1(Standard_Real)
	dist2(Standard_Real)
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") TrimmedSquareDistances;
		void TrimmedSquareDistances (Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & P1,gp_Pnt2d & P2);
};


%feature("shadow") Extrema_ELPCOfLocateExtPC2d::~Extrema_ELPCOfLocateExtPC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_ELPCOfLocateExtPC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_EPCOfELPCOfLocateExtPC;
class Extrema_EPCOfELPCOfLocateExtPC {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_EPCOfELPCOfLocateExtPC;
		 Extrema_EPCOfELPCOfLocateExtPC ();
		%feature("autodoc", "Args:
	P(gp_Pnt)
	C(Adaptor3d_Curve)
	NbU(Standard_Integer)
	TolU(Standard_Real)
	TolF(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Extrema_EPCOfELPCOfLocateExtPC;
		 Extrema_EPCOfELPCOfLocateExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C,const Standard_Integer NbU,const Standard_Real TolU,const Standard_Real TolF);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	C(Adaptor3d_Curve)
	NbU(Standard_Integer)
	Umin(Standard_Real)
	Usup(Standard_Real)
	TolU(Standard_Real)
	TolF(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Extrema_EPCOfELPCOfLocateExtPC;
		 Extrema_EPCOfELPCOfLocateExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C,const Standard_Integer NbU,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU,const Standard_Real TolF);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	NbU(Standard_Integer)
	TolU(Standard_Real)
	TolF(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Adaptor3d_Curve & C,const Standard_Integer NbU,const Standard_Real TolU,const Standard_Real TolF);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	NbU(Standard_Integer)
	Umin(Standard_Real)
	Usup(Standard_Real)
	TolU(Standard_Real)
	TolF(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Adaptor3d_Curve & C,const Standard_Integer NbU,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU,const Standard_Real TolF);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Adaptor3d_Curve & C);
		%feature("autodoc", "Args:
	NbU(Standard_Integer)
	Umin(Standard_Real)
	Usup(Standard_Real)
	TolU(Standard_Real)
	TolF(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Standard_Integer NbU,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU,const Standard_Real TolF);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Pnt & P);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Extrema_POnCurv

No detailed docstring for this function.") Point;
		const Extrema_POnCurv & Point (const Standard_Integer N);
};


%feature("shadow") Extrema_EPCOfELPCOfLocateExtPC::~Extrema_EPCOfELPCOfLocateExtPC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_EPCOfELPCOfLocateExtPC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_EPCOfELPCOfLocateExtPC2d;
class Extrema_EPCOfELPCOfLocateExtPC2d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_EPCOfELPCOfLocateExtPC2d;
		 Extrema_EPCOfELPCOfLocateExtPC2d ();
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	C(Adaptor2d_Curve2d)
	NbU(Standard_Integer)
	TolU(Standard_Real)
	TolF(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Extrema_EPCOfELPCOfLocateExtPC2d;
		 Extrema_EPCOfELPCOfLocateExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Integer NbU,const Standard_Real TolU,const Standard_Real TolF);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	C(Adaptor2d_Curve2d)
	NbU(Standard_Integer)
	Umin(Standard_Real)
	Usup(Standard_Real)
	TolU(Standard_Real)
	TolF(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Extrema_EPCOfELPCOfLocateExtPC2d;
		 Extrema_EPCOfELPCOfLocateExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Integer NbU,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU,const Standard_Real TolF);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	NbU(Standard_Integer)
	TolU(Standard_Real)
	TolF(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C,const Standard_Integer NbU,const Standard_Real TolU,const Standard_Real TolF);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	NbU(Standard_Integer)
	Umin(Standard_Real)
	Usup(Standard_Real)
	TolU(Standard_Real)
	TolF(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C,const Standard_Integer NbU,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU,const Standard_Real TolF);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "Args:
	NbU(Standard_Integer)
	Umin(Standard_Real)
	Usup(Standard_Real)
	TolU(Standard_Real)
	TolF(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Standard_Integer NbU,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU,const Standard_Real TolF);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Pnt2d & P);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") Point;
		const Extrema_POnCurv2d & Point (const Standard_Integer N);
};


%feature("shadow") Extrema_EPCOfELPCOfLocateExtPC2d::~Extrema_EPCOfELPCOfLocateExtPC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_EPCOfELPCOfLocateExtPC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_EPCOfExtPC;
class Extrema_EPCOfExtPC {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_EPCOfExtPC;
		 Extrema_EPCOfExtPC ();
		%feature("autodoc", "Args:
	P(gp_Pnt)
	C(Adaptor3d_Curve)
	NbU(Standard_Integer)
	TolU(Standard_Real)
	TolF(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Extrema_EPCOfExtPC;
		 Extrema_EPCOfExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C,const Standard_Integer NbU,const Standard_Real TolU,const Standard_Real TolF);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	C(Adaptor3d_Curve)
	NbU(Standard_Integer)
	Umin(Standard_Real)
	Usup(Standard_Real)
	TolU(Standard_Real)
	TolF(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Extrema_EPCOfExtPC;
		 Extrema_EPCOfExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C,const Standard_Integer NbU,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU,const Standard_Real TolF);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	NbU(Standard_Integer)
	TolU(Standard_Real)
	TolF(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Adaptor3d_Curve & C,const Standard_Integer NbU,const Standard_Real TolU,const Standard_Real TolF);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	NbU(Standard_Integer)
	Umin(Standard_Real)
	Usup(Standard_Real)
	TolU(Standard_Real)
	TolF(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Adaptor3d_Curve & C,const Standard_Integer NbU,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU,const Standard_Real TolF);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Adaptor3d_Curve & C);
		%feature("autodoc", "Args:
	NbU(Standard_Integer)
	Umin(Standard_Real)
	Usup(Standard_Real)
	TolU(Standard_Real)
	TolF(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Standard_Integer NbU,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU,const Standard_Real TolF);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Pnt & P);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Extrema_POnCurv

No detailed docstring for this function.") Point;
		const Extrema_POnCurv & Point (const Standard_Integer N);
};


%feature("shadow") Extrema_EPCOfExtPC::~Extrema_EPCOfExtPC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_EPCOfExtPC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_EPCOfExtPC2d;
class Extrema_EPCOfExtPC2d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_EPCOfExtPC2d;
		 Extrema_EPCOfExtPC2d ();
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	C(Adaptor2d_Curve2d)
	NbU(Standard_Integer)
	TolU(Standard_Real)
	TolF(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Extrema_EPCOfExtPC2d;
		 Extrema_EPCOfExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Integer NbU,const Standard_Real TolU,const Standard_Real TolF);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	C(Adaptor2d_Curve2d)
	NbU(Standard_Integer)
	Umin(Standard_Real)
	Usup(Standard_Real)
	TolU(Standard_Real)
	TolF(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Extrema_EPCOfExtPC2d;
		 Extrema_EPCOfExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Integer NbU,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU,const Standard_Real TolF);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	NbU(Standard_Integer)
	TolU(Standard_Real)
	TolF(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C,const Standard_Integer NbU,const Standard_Real TolU,const Standard_Real TolF);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	NbU(Standard_Integer)
	Umin(Standard_Real)
	Usup(Standard_Real)
	TolU(Standard_Real)
	TolF(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C,const Standard_Integer NbU,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU,const Standard_Real TolF);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "Args:
	NbU(Standard_Integer)
	Umin(Standard_Real)
	Usup(Standard_Real)
	TolU(Standard_Real)
	TolF(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Standard_Integer NbU,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU,const Standard_Real TolF);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Pnt2d & P);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") Point;
		const Extrema_POnCurv2d & Point (const Standard_Integer N);
};


%feature("shadow") Extrema_EPCOfExtPC2d::~Extrema_EPCOfExtPC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_EPCOfExtPC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_ExtCC;
class Extrema_ExtCC {
	public:
		%feature("autodoc", "Args:
	TolC1(Standard_Real)=1.0e-10
	TolC2(Standard_Real)=1.0e-10

Returns:
	None

No detailed docstring for this function.") Extrema_ExtCC;
		 Extrema_ExtCC (const Standard_Real TolC1 = 1.0e-10,const Standard_Real TolC2 = 1.0e-10);
		%feature("autodoc", "Args:
	C1(Adaptor3d_Curve)
	C2(Adaptor3d_Curve)
	TolC1(Standard_Real)=1.0e-10
	TolC2(Standard_Real)=1.0e-10

Returns:
	None

No detailed docstring for this function.") Extrema_ExtCC;
		 Extrema_ExtCC (const Adaptor3d_Curve & C1,const Adaptor3d_Curve & C2,const Standard_Real TolC1 = 1.0e-10,const Standard_Real TolC2 = 1.0e-10);
		%feature("autodoc", "Args:
	C1(Adaptor3d_Curve)
	C2(Adaptor3d_Curve)
	U1(Standard_Real)
	U2(Standard_Real)
	V1(Standard_Real)
	V2(Standard_Real)
	TolC1(Standard_Real)=1.0e-10
	TolC2(Standard_Real)=1.0e-10

Returns:
	None

No detailed docstring for this function.") Extrema_ExtCC;
		 Extrema_ExtCC (const Adaptor3d_Curve & C1,const Adaptor3d_Curve & C2,const Standard_Real U1,const Standard_Real U2,const Standard_Real V1,const Standard_Real V2,const Standard_Real TolC1 = 1.0e-10,const Standard_Real TolC2 = 1.0e-10);
		%feature("autodoc", "Args:
	theRank(Standard_Integer)
	C(Adaptor3d_Curve)

Returns:
	None

No detailed docstring for this function.") SetCurve;
		void SetCurve (const Standard_Integer theRank,const Adaptor3d_Curve & C);
		%feature("autodoc", "Args:
	theRank(Standard_Integer)
	C(Adaptor3d_Curve)
	Uinf(Standard_Real)
	Usup(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetCurve;
		void SetCurve (const Standard_Integer theRank,const Adaptor3d_Curve & C,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("autodoc", "Args:
	theRank(Standard_Integer)
	Uinf(Standard_Real)
	Usup(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetRange;
		void SetRange (const Standard_Integer theRank,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("autodoc", "Args:
	theRank(Standard_Integer)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetTolerance;
		void SetTolerance (const Standard_Integer theRank,const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("autodoc", "Args:
	N(Standard_Integer)=1

Returns:
	Standard_Real

No detailed docstring for this function.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N = 1);
		%feature("autodoc", "Args:
	N(Standard_Integer)
	P1(Extrema_POnCurv)
	P2(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv & P1,Extrema_POnCurv & P2);
		%feature("autodoc", "Args:
	dist11(Standard_Real)
	distP12(Standard_Real)
	distP21(Standard_Real)
	distP22(Standard_Real)
	P11(gp_Pnt)
	P12(gp_Pnt)
	P21(gp_Pnt)
	P22(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") TrimmedSquareDistances;
		void TrimmedSquareDistances (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt & P11,gp_Pnt & P12,gp_Pnt & P21,gp_Pnt & P22);
};


%feature("shadow") Extrema_ExtCC::~Extrema_ExtCC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_ExtCC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_ExtCC2d;
class Extrema_ExtCC2d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_ExtCC2d;
		 Extrema_ExtCC2d ();
		%feature("autodoc", "Args:
	C1(Adaptor2d_Curve2d)
	C2(Adaptor2d_Curve2d)
	TolC1(Standard_Real)=1.0e-10
	TolC2(Standard_Real)=1.0e-10

Returns:
	None

No detailed docstring for this function.") Extrema_ExtCC2d;
		 Extrema_ExtCC2d (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2,const Standard_Real TolC1 = 1.0e-10,const Standard_Real TolC2 = 1.0e-10);
		%feature("autodoc", "Args:
	C1(Adaptor2d_Curve2d)
	C2(Adaptor2d_Curve2d)
	U1(Standard_Real)
	U2(Standard_Real)
	V1(Standard_Real)
	V2(Standard_Real)
	TolC1(Standard_Real)=1.0e-10
	TolC2(Standard_Real)=1.0e-10

Returns:
	None

No detailed docstring for this function.") Extrema_ExtCC2d;
		 Extrema_ExtCC2d (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2,const Standard_Real U1,const Standard_Real U2,const Standard_Real V1,const Standard_Real V2,const Standard_Real TolC1 = 1.0e-10,const Standard_Real TolC2 = 1.0e-10);
		%feature("autodoc", "Args:
	C2(Adaptor2d_Curve2d)
	V1(Standard_Real)
	V2(Standard_Real)
	TolC1(Standard_Real)=1.0e-10
	TolC2(Standard_Real)=1.0e-10

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C2,const Standard_Real V1,const Standard_Real V2,const Standard_Real TolC1 = 1.0e-10,const Standard_Real TolC2 = 1.0e-10);
		%feature("autodoc", "Args:
	C1(Adaptor2d_Curve2d)
	U1(Standard_Real)
	U2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const Adaptor2d_Curve2d & C1,const Standard_Real U1,const Standard_Real U2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("autodoc", "Args:
	N(Standard_Integer)=1

Returns:
	Standard_Real

No detailed docstring for this function.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N = 1);
		%feature("autodoc", "Args:
	N(Standard_Integer)
	P1(Extrema_POnCurv2d)
	P2(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv2d & P1,Extrema_POnCurv2d & P2);
		%feature("autodoc", "Args:
	dist11(Standard_Real)
	distP12(Standard_Real)
	distP21(Standard_Real)
	distP22(Standard_Real)
	P11(gp_Pnt2d)
	P12(gp_Pnt2d)
	P21(gp_Pnt2d)
	P22(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") TrimmedSquareDistances;
		void TrimmedSquareDistances (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & P11,gp_Pnt2d & P12,gp_Pnt2d & P21,gp_Pnt2d & P22);
};


%feature("shadow") Extrema_ExtCC2d::~Extrema_ExtCC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_ExtCC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_ExtCS;
class Extrema_ExtCS {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_ExtCS;
		 Extrema_ExtCS ();
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	S(Adaptor3d_Surface)
	TolC(Standard_Real)
	TolS(Standard_Real)

Returns:
	None

It calculates all the distances between C and S.") Extrema_ExtCS;
		 Extrema_ExtCS (const Adaptor3d_Curve & C,const Adaptor3d_Surface & S,const Standard_Real TolC,const Standard_Real TolS);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	S(Adaptor3d_Surface)
	UCinf(Standard_Real)
	UCsup(Standard_Real)
	Uinf(Standard_Real)
	Usup(Standard_Real)
	Vinf(Standard_Real)
	Vsup(Standard_Real)
	TolC(Standard_Real)
	TolS(Standard_Real)

Returns:
	None

It calculates all the distances between C and S.  
         UCinf and UCmax are the start and end parameters  
         of the curve.") Extrema_ExtCS;
		 Extrema_ExtCS (const Adaptor3d_Curve & C,const Adaptor3d_Surface & S,const Standard_Real UCinf,const Standard_Real UCsup,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real Vinf,const Standard_Real Vsup,const Standard_Real TolC,const Standard_Real TolS);
		%feature("autodoc", "Args:
	S(Adaptor3d_Surface)
	Uinf(Standard_Real)
	Usup(Standard_Real)
	Vinf(Standard_Real)
	Vsup(Standard_Real)
	TolC(Standard_Real)
	TolS(Standard_Real)

Returns:
	None

Initializes the fields of the algorithm.") Initialize;
		void Initialize (const Adaptor3d_Surface & S,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real Vinf,const Standard_Real Vsup,const Standard_Real TolC,const Standard_Real TolS);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	Uinf(Standard_Real)
	Usup(Standard_Real)

Returns:
	None

Computes the distances.  
         An exception is raised if the fieds have not been  
         initialized.") Perform;
		void Perform (const Adaptor3d_Curve & C,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the distances are found.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the curve is on a parallel surface.") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of extremum distances.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Real

Returns the value of the Nth resulting square distance.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)
	P1(Extrema_POnCurv)
	P2(Extrema_POnSurf)

Returns:
	None

Returns the point of the Nth resulting distance.") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv & P1,Extrema_POnSurf & P2);
};


%feature("shadow") Extrema_ExtCS::~Extrema_ExtCS %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_ExtCS {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_ExtElC;
class Extrema_ExtElC {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_ExtElC;
		 Extrema_ExtElC ();
		%feature("autodoc", "Args:
	C1(gp_Lin)
	C2(gp_Lin)
	AngTol(Standard_Real)

Returns:
	None

Calculates the distance between two lines.  
         AngTol is used to test if the lines are parallel:  
         Angle(C1,C2) < AngTol.") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Lin & C1,const gp_Lin & C2,const Standard_Real AngTol);
		%feature("autodoc", "Args:
	C1(gp_Lin)
	C2(gp_Circ)
	Tol(Standard_Real)

Returns:
	None

Calculates the distance between a line and a  
         circle.") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Lin & C1,const gp_Circ & C2,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C1(gp_Lin)
	C2(gp_Elips)

Returns:
	None

Calculates the distance between a line and an  
         elipse.") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Lin & C1,const gp_Elips & C2);
		%feature("autodoc", "Args:
	C1(gp_Lin)
	C2(gp_Hypr)

Returns:
	None

Calculates the distance between a line and a  
         hyperbola.") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Lin & C1,const gp_Hypr & C2);
		%feature("autodoc", "Args:
	C1(gp_Lin)
	C2(gp_Parab)

Returns:
	None

Calculates the distance between a line and a  
         parabola.") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Lin & C1,const gp_Parab & C2);
		%feature("autodoc", "Args:
	C1(gp_Circ)
	C2(gp_Circ)

Returns:
	None

Calculates the distance between two circles.  
         The circles can be parallel or identical.") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Circ & C1,const gp_Circ & C2);
		%feature("autodoc", "Args:
	C1(gp_Circ)
	C2(gp_Elips)

Returns:
	None

Calculates the distance between a circle and an  
         elipse.") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Circ & C1,const gp_Elips & C2);
		%feature("autodoc", "Args:
	C1(gp_Circ)
	C2(gp_Hypr)

Returns:
	None

Calculates the distance between a circle and a  
         hyperbola.") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Circ & C1,const gp_Hypr & C2);
		%feature("autodoc", "Args:
	C1(gp_Circ)
	C2(gp_Parab)

Returns:
	None

Calculates the distance between a circle and a  
         parabola.") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Circ & C1,const gp_Parab & C2);
		%feature("autodoc", "Args:
	C1(gp_Elips)
	C2(gp_Elips)

Returns:
	None

Calculates the distance between two elipses.  
         The elipses can be parallel or identical.") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Elips & C1,const gp_Elips & C2);
		%feature("autodoc", "Args:
	C1(gp_Elips)
	C2(gp_Hypr)

Returns:
	None

Calculates the distance between an elipse and a  
         hyperbola.") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Elips & C1,const gp_Hypr & C2);
		%feature("autodoc", "Args:
	C1(gp_Elips)
	C2(gp_Parab)

Returns:
	None

Calculates the distance between an elipse and a  
         parabola.") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Elips & C1,const gp_Parab & C2);
		%feature("autodoc", "Args:
	C1(gp_Hypr)
	C2(gp_Hypr)

Returns:
	None

Calculates the distance between two hyperbolas.  
         The hyperbolas can be parallel or identical.") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Hypr & C1,const gp_Hypr & C2);
		%feature("autodoc", "Args:
	C1(gp_Hypr)
	C2(gp_Parab)

Returns:
	None

Calculates the distance between a hyperbola and a  
         parabola.") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Hypr & C1,const gp_Parab & C2);
		%feature("autodoc", "Args:
	C1(gp_Parab)
	C2(gp_Parab)

Returns:
	None

Calculates the distance between two parabolas  
         The parabolas can be parallel or identical.") Extrema_ExtElC;
		 Extrema_ExtElC (const gp_Parab & C1,const gp_Parab & C2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the distances are found.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the two curves are parallel.") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of extremum distances.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)=1

Returns:
	Standard_Real

Returns the value of the Nth extremum square distance.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N = 1);
		%feature("autodoc", "Args:
	N(Standard_Integer)
	P1(Extrema_POnCurv)
	P2(Extrema_POnCurv)

Returns:
	None

Returns the points of the Nth extremum distance.  
         P1 is on the first curve, P2 on the second one.") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv & P1,Extrema_POnCurv & P2);
};


%feature("shadow") Extrema_ExtElC::~Extrema_ExtElC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_ExtElC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_ExtElC2d;
class Extrema_ExtElC2d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_ExtElC2d;
		 Extrema_ExtElC2d ();
		%feature("autodoc", "Args:
	C1(gp_Lin2d)
	C2(gp_Lin2d)
	AngTol(Standard_Real)

Returns:
	None

Calculates the distance between two lines.  
         AngTol is used to test if the lines are parallel:  
         Angle(C1,C2) < AngTol.") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Lin2d & C1,const gp_Lin2d & C2,const Standard_Real AngTol);
		%feature("autodoc", "Args:
	C1(gp_Lin2d)
	C2(gp_Circ2d)
	Tol(Standard_Real)

Returns:
	None

Calculates the distance between a line and a  
         circle.") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Lin2d & C1,const gp_Circ2d & C2,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C1(gp_Lin2d)
	C2(gp_Elips2d)

Returns:
	None

Calculates the distance between a line and an  
         elipse.") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Lin2d & C1,const gp_Elips2d & C2);
		%feature("autodoc", "Args:
	C1(gp_Lin2d)
	C2(gp_Hypr2d)

Returns:
	None

Calculates the distance between a line and a  
         hyperbola.") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Lin2d & C1,const gp_Hypr2d & C2);
		%feature("autodoc", "Args:
	C1(gp_Lin2d)
	C2(gp_Parab2d)

Returns:
	None

Calculates the distance between a line and a  
         parabola.") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Lin2d & C1,const gp_Parab2d & C2);
		%feature("autodoc", "Args:
	C1(gp_Circ2d)
	C2(gp_Circ2d)

Returns:
	None

Calculates the distance between two circles.  
         The circles can be parallel or identical.") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Circ2d & C1,const gp_Circ2d & C2);
		%feature("autodoc", "Args:
	C1(gp_Circ2d)
	C2(gp_Elips2d)

Returns:
	None

Calculates the distance between a circle and an  
         elipse.") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Circ2d & C1,const gp_Elips2d & C2);
		%feature("autodoc", "Args:
	C1(gp_Circ2d)
	C2(gp_Hypr2d)

Returns:
	None

Calculates the distance between a circle and a  
         hyperbola.") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Circ2d & C1,const gp_Hypr2d & C2);
		%feature("autodoc", "Args:
	C1(gp_Circ2d)
	C2(gp_Parab2d)

Returns:
	None

Calculates the distance between a circle and a  
         parabola.") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Circ2d & C1,const gp_Parab2d & C2);
		%feature("autodoc", "Args:
	C1(gp_Elips2d)
	C2(gp_Elips2d)

Returns:
	None

Calculates the distance between two elipses.  
         The elipses can be parallel or identical.") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Elips2d & C1,const gp_Elips2d & C2);
		%feature("autodoc", "Args:
	C1(gp_Elips2d)
	C2(gp_Hypr2d)

Returns:
	None

Calculates the distance between an elipse and a  
         hyperbola.") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Elips2d & C1,const gp_Hypr2d & C2);
		%feature("autodoc", "Args:
	C1(gp_Elips2d)
	C2(gp_Parab2d)

Returns:
	None

Calculates the distance between an elipse and a  
         parabola.") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Elips2d & C1,const gp_Parab2d & C2);
		%feature("autodoc", "Args:
	C1(gp_Hypr2d)
	C2(gp_Hypr2d)

Returns:
	None

Calculates the distance between two hyperbolas.  
         The hyperbolas can be parallel or identical.") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Hypr2d & C1,const gp_Hypr2d & C2);
		%feature("autodoc", "Args:
	C1(gp_Hypr2d)
	C2(gp_Parab2d)

Returns:
	None

Calculates the distance between a hyperbola and a  
         parabola.") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Hypr2d & C1,const gp_Parab2d & C2);
		%feature("autodoc", "Args:
	C1(gp_Parab2d)
	C2(gp_Parab2d)

Returns:
	None

Calculates the distance between two parabolas  
         The parabolas can be parallel or identical.") Extrema_ExtElC2d;
		 Extrema_ExtElC2d (const gp_Parab2d & C1,const gp_Parab2d & C2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the distances are found.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the two curves are parallel.") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of extremum distances.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)=1

Returns:
	Standard_Real

Returns the value of the Nth extremum square distance.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N = 1);
		%feature("autodoc", "Args:
	N(Standard_Integer)
	P1(Extrema_POnCurv2d)
	P2(Extrema_POnCurv2d)

Returns:
	None

Returns the points of the Nth extremum distance.  
         P1 is on the first curve, P2 on the second one.") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv2d & P1,Extrema_POnCurv2d & P2);
};


%feature("shadow") Extrema_ExtElC2d::~Extrema_ExtElC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_ExtElC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_ExtElCS;
class Extrema_ExtElCS {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_ExtElCS;
		 Extrema_ExtElCS ();
		%feature("autodoc", "Args:
	C(gp_Lin)
	S(gp_Pln)

Returns:
	None

Calculates the distances between a line and a  
         plane. The line can be on the plane or on a parallel  
         plane.") Extrema_ExtElCS;
		 Extrema_ExtElCS (const gp_Lin & C,const gp_Pln & S);
		%feature("autodoc", "Args:
	C(gp_Lin)
	S(gp_Pln)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Lin & C,const gp_Pln & S);
		%feature("autodoc", "Args:
	C(gp_Lin)
	S(gp_Cylinder)

Returns:
	None

Calculates the distances between a line and a  
         cylinder.") Extrema_ExtElCS;
		 Extrema_ExtElCS (const gp_Lin & C,const gp_Cylinder & S);
		%feature("autodoc", "Args:
	C(gp_Lin)
	S(gp_Cylinder)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Lin & C,const gp_Cylinder & S);
		%feature("autodoc", "Args:
	C(gp_Lin)
	S(gp_Cone)

Returns:
	None

Calculates the distances between a line and a cone.") Extrema_ExtElCS;
		 Extrema_ExtElCS (const gp_Lin & C,const gp_Cone & S);
		%feature("autodoc", "Args:
	C(gp_Lin)
	S(gp_Cone)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Lin & C,const gp_Cone & S);
		%feature("autodoc", "Args:
	C(gp_Lin)
	S(gp_Sphere)

Returns:
	None

Calculates the distances between a line and a  
         sphere.") Extrema_ExtElCS;
		 Extrema_ExtElCS (const gp_Lin & C,const gp_Sphere & S);
		%feature("autodoc", "Args:
	C(gp_Lin)
	S(gp_Sphere)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Lin & C,const gp_Sphere & S);
		%feature("autodoc", "Args:
	C(gp_Lin)
	S(gp_Torus)

Returns:
	None

Calculates the distances between a line and a  
         torus.") Extrema_ExtElCS;
		 Extrema_ExtElCS (const gp_Lin & C,const gp_Torus & S);
		%feature("autodoc", "Args:
	C(gp_Lin)
	S(gp_Torus)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Lin & C,const gp_Torus & S);
		%feature("autodoc", "Args:
	C(gp_Circ)
	S(gp_Pln)

Returns:
	None

Calculates the distances between a circle and a  
         plane.") Extrema_ExtElCS;
		 Extrema_ExtElCS (const gp_Circ & C,const gp_Pln & S);
		%feature("autodoc", "Args:
	C(gp_Circ)
	S(gp_Pln)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Circ & C,const gp_Pln & S);
		%feature("autodoc", "Args:
	C(gp_Circ)
	S(gp_Cylinder)

Returns:
	None

Calculates the distances between a circle and a  
         cylinder.") Extrema_ExtElCS;
		 Extrema_ExtElCS (const gp_Circ & C,const gp_Cylinder & S);
		%feature("autodoc", "Args:
	C(gp_Circ)
	S(gp_Cylinder)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Circ & C,const gp_Cylinder & S);
		%feature("autodoc", "Args:
	C(gp_Circ)
	S(gp_Cone)

Returns:
	None

Calculates the distances between a circle and a  
         cone.") Extrema_ExtElCS;
		 Extrema_ExtElCS (const gp_Circ & C,const gp_Cone & S);
		%feature("autodoc", "Args:
	C(gp_Circ)
	S(gp_Cone)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Circ & C,const gp_Cone & S);
		%feature("autodoc", "Args:
	C(gp_Circ)
	S(gp_Sphere)

Returns:
	None

Calculates the distances between a circle and a  
         sphere.") Extrema_ExtElCS;
		 Extrema_ExtElCS (const gp_Circ & C,const gp_Sphere & S);
		%feature("autodoc", "Args:
	C(gp_Circ)
	S(gp_Sphere)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Circ & C,const gp_Sphere & S);
		%feature("autodoc", "Args:
	C(gp_Circ)
	S(gp_Torus)

Returns:
	None

Calculates the distances between a circle and a  
         torus.") Extrema_ExtElCS;
		 Extrema_ExtElCS (const gp_Circ & C,const gp_Torus & S);
		%feature("autodoc", "Args:
	C(gp_Circ)
	S(gp_Torus)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Circ & C,const gp_Torus & S);
		%feature("autodoc", "Args:
	C(gp_Hypr)
	S(gp_Pln)

Returns:
	None

Calculates the distances between a hyperbola and a  
         plane.") Extrema_ExtElCS;
		 Extrema_ExtElCS (const gp_Hypr & C,const gp_Pln & S);
		%feature("autodoc", "Args:
	C(gp_Hypr)
	S(gp_Pln)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Hypr & C,const gp_Pln & S);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the distances are found.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the curve is on a parallel surface.") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of extremum distances.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)=1

Returns:
	Standard_Real

Returns the value of the Nth extremum square distance.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N = 1);
		%feature("autodoc", "Args:
	N(Standard_Integer)
	P1(Extrema_POnCurv)
	P2(Extrema_POnSurf)

Returns:
	None

Returns the points of the Nth extremum distance.  
         P1 is on the curve, P2 on the surface.") Points;
		void Points (const Standard_Integer N,Extrema_POnCurv & P1,Extrema_POnSurf & P2);
};


%feature("shadow") Extrema_ExtElCS::~Extrema_ExtElCS %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_ExtElCS {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_ExtElSS;
class Extrema_ExtElSS {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_ExtElSS;
		 Extrema_ExtElSS ();
		%feature("autodoc", "Args:
	S1(gp_Pln)
	S2(gp_Pln)

Returns:
	None

Calculates the distances between 2 planes.  
         These planes can be parallel.") Extrema_ExtElSS;
		 Extrema_ExtElSS (const gp_Pln & S1,const gp_Pln & S2);
		%feature("autodoc", "Args:
	S1(gp_Pln)
	S2(gp_Pln)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Pln & S1,const gp_Pln & S2);
		%feature("autodoc", "Args:
	S1(gp_Pln)
	S2(gp_Sphere)

Returns:
	None

Calculates the distances between a plane  
         and a sphere.") Extrema_ExtElSS;
		 Extrema_ExtElSS (const gp_Pln & S1,const gp_Sphere & S2);
		%feature("autodoc", "Args:
	S1(gp_Pln)
	S2(gp_Sphere)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Pln & S1,const gp_Sphere & S2);
		%feature("autodoc", "Args:
	S1(gp_Sphere)
	S2(gp_Sphere)

Returns:
	None

Calculates the distances between 2 spheres.  
         These spheres can be parallel.") Extrema_ExtElSS;
		 Extrema_ExtElSS (const gp_Sphere & S1,const gp_Sphere & S2);
		%feature("autodoc", "Args:
	S1(gp_Sphere)
	S2(gp_Sphere)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Sphere & S1,const gp_Sphere & S2);
		%feature("autodoc", "Args:
	S1(gp_Sphere)
	S2(gp_Cylinder)

Returns:
	None

Calculates the distances between a sphere  
         and a cylinder.") Extrema_ExtElSS;
		 Extrema_ExtElSS (const gp_Sphere & S1,const gp_Cylinder & S2);
		%feature("autodoc", "Args:
	S1(gp_Sphere)
	S2(gp_Cylinder)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Sphere & S1,const gp_Cylinder & S2);
		%feature("autodoc", "Args:
	S1(gp_Sphere)
	S2(gp_Cone)

Returns:
	None

Calculates the distances between a sphere  
         and a cone.") Extrema_ExtElSS;
		 Extrema_ExtElSS (const gp_Sphere & S1,const gp_Cone & S2);
		%feature("autodoc", "Args:
	S1(gp_Sphere)
	S2(gp_Cone)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Sphere & S1,const gp_Cone & S2);
		%feature("autodoc", "Args:
	S1(gp_Sphere)
	S2(gp_Torus)

Returns:
	None

Calculates the distances between a sphere  
         and a torus.") Extrema_ExtElSS;
		 Extrema_ExtElSS (const gp_Sphere & S1,const gp_Torus & S2);
		%feature("autodoc", "Args:
	S1(gp_Sphere)
	S2(gp_Torus)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Sphere & S1,const gp_Torus & S2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the distances are found.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the two surfaces are parallel.") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of extremum distances.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)=1

Returns:
	Standard_Real

Returns the value of the Nth extremum square distance.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N = 1);
		%feature("autodoc", "Args:
	N(Standard_Integer)
	P1(Extrema_POnSurf)
	P2(Extrema_POnSurf)

Returns:
	None

Returns the points for the Nth resulting distance.  
         P1 is on the first surface, P2 on the second one.") Points;
		void Points (const Standard_Integer N,Extrema_POnSurf & P1,Extrema_POnSurf & P2);
};


%feature("shadow") Extrema_ExtElSS::~Extrema_ExtElSS %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_ExtElSS {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_ExtPC;
class Extrema_ExtPC {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_ExtPC;
		 Extrema_ExtPC ();
		%feature("autodoc", "Args:
	P(gp_Pnt)
	C(Adaptor3d_Curve)
	Uinf(Standard_Real)
	Usup(Standard_Real)
	TolF(Standard_Real)=1.0e-10

Returns:
	None

No detailed docstring for this function.") Extrema_ExtPC;
		 Extrema_ExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real TolF = 1.0e-10);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	C(Adaptor3d_Curve)
	TolF(Standard_Real)=1.0e-10

Returns:
	None

No detailed docstring for this function.") Extrema_ExtPC;
		 Extrema_ExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C,const Standard_Real TolF = 1.0e-10);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	Uinf(Standard_Real)
	Usup(Standard_Real)
	TolF(Standard_Real)=1.0e-10

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Adaptor3d_Curve & C,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real TolF = 1.0e-10);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Pnt & P);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Extrema_POnCurv

No detailed docstring for this function.") Point;
		const Extrema_POnCurv & Point (const Standard_Integer N);
		%feature("autodoc", "Args:
	dist1(Standard_Real)
	dist2(Standard_Real)
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") TrimmedSquareDistances;
		void TrimmedSquareDistances (Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt & P1,gp_Pnt & P2);
};


%feature("shadow") Extrema_ExtPC::~Extrema_ExtPC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_ExtPC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_ExtPC2d;
class Extrema_ExtPC2d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_ExtPC2d;
		 Extrema_ExtPC2d ();
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	C(Adaptor2d_Curve2d)
	Uinf(Standard_Real)
	Usup(Standard_Real)
	TolF(Standard_Real)=1.0e-10

Returns:
	None

No detailed docstring for this function.") Extrema_ExtPC2d;
		 Extrema_ExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real TolF = 1.0e-10);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	C(Adaptor2d_Curve2d)
	TolF(Standard_Real)=1.0e-10

Returns:
	None

No detailed docstring for this function.") Extrema_ExtPC2d;
		 Extrema_ExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Real TolF = 1.0e-10);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	Uinf(Standard_Real)
	Usup(Standard_Real)
	TolF(Standard_Real)=1.0e-10

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real TolF = 1.0e-10);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Pnt2d & P);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") Point;
		const Extrema_POnCurv2d & Point (const Standard_Integer N);
		%feature("autodoc", "Args:
	dist1(Standard_Real)
	dist2(Standard_Real)
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") TrimmedSquareDistances;
		void TrimmedSquareDistances (Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt2d & P1,gp_Pnt2d & P2);
};


%feature("shadow") Extrema_ExtPC2d::~Extrema_ExtPC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_ExtPC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_ExtPElC;
class Extrema_ExtPElC {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_ExtPElC;
		 Extrema_ExtPElC ();
		%feature("autodoc", "Args:
	P(gp_Pnt)
	C(gp_Lin)
	Tol(Standard_Real)
	Uinf(Standard_Real)
	Usup(Standard_Real)

Returns:
	None

Calculates the extremum distance between the  
         point P and the segment [Uinf,Usup] of the line C.") Extrema_ExtPElC;
		 Extrema_ExtPElC (const gp_Pnt & P,const gp_Lin & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	C(gp_Lin)
	Tol(Standard_Real)
	Uinf(Standard_Real)
	Usup(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Pnt & P,const gp_Lin & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	C(gp_Circ)
	Tol(Standard_Real)
	Uinf(Standard_Real)
	Usup(Standard_Real)

Returns:
	None

Calculates the 2 extremum distances between the  
         point P and the segment [Uinf,Usup] of the circle C.  
         Tol is used to determine  
         if P is on the axis of the circle or  
         if an extremum is on an endpoint of the segment.  
         If P is on the axis of the circle,  
         there are infinite solution then IsDone(me)=False.  
         The conditions on the Uinf and Usup are:  
           0. <= Uinf <= 2.*PI and Usup > Uinf.  
         If Usup > Uinf + 2.*PI, then only the solutions in  
         the range [Uinf,Uinf+2.*PI[ are computed.") Extrema_ExtPElC;
		 Extrema_ExtPElC (const gp_Pnt & P,const gp_Circ & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	C(gp_Circ)
	Tol(Standard_Real)
	Uinf(Standard_Real)
	Usup(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Pnt & P,const gp_Circ & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	C(gp_Elips)
	Tol(Standard_Real)
	Uinf(Standard_Real)
	Usup(Standard_Real)

Returns:
	None

Calculates the 4 extremum distances between the  
         point P and the segment [Uinf,Usup] of the elipse C.  
         Tol is used to determine  
         if the point is on the axis of the elipse and  
         if the major radius is equal to the minor radius or  
         if an extremum is on an endpoint of the segment.  
         If P is on the axis of the elipse,  
         there are infinite solution then IsDone(me)=False.  
         The conditions on the Uinf and Usup are:  
           0. <= Uinf <= 2.*PI and Usup > Uinf.  
         If Usup > Uinf + 2.*PI, then only the solutions in  
         the range [Uinf,Uinf+2.*PI[ are computed.") Extrema_ExtPElC;
		 Extrema_ExtPElC (const gp_Pnt & P,const gp_Elips & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	C(gp_Elips)
	Tol(Standard_Real)
	Uinf(Standard_Real)
	Usup(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Pnt & P,const gp_Elips & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	C(gp_Hypr)
	Tol(Standard_Real)
	Uinf(Standard_Real)
	Usup(Standard_Real)

Returns:
	None

Calculates the extremum distances between the  
         point P and the segment [Uinf,Usup] of the hyperbola  
         C.  
         Tol is used to determine if two solutions u and v  
         are identical; the condition is:  
         dist(C(u),C(v)) < Tol.") Extrema_ExtPElC;
		 Extrema_ExtPElC (const gp_Pnt & P,const gp_Hypr & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	C(gp_Hypr)
	Tol(Standard_Real)
	Uinf(Standard_Real)
	Usup(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Pnt & P,const gp_Hypr & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	C(gp_Parab)
	Tol(Standard_Real)
	Uinf(Standard_Real)
	Usup(Standard_Real)

Returns:
	None

Calculates the 4 extremum distances between the  
         point P and the segment [Uinf,Usup] of the parabola  
         C.  
         Tol is used to determine if two solutions u and v  
         are identical; the condition is:  
         dist(C(u),C(v)) < Tol.") Extrema_ExtPElC;
		 Extrema_ExtPElC (const gp_Pnt & P,const gp_Parab & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	C(gp_Parab)
	Tol(Standard_Real)
	Uinf(Standard_Real)
	Usup(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Pnt & P,const gp_Parab & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

True if the distances are found.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of extremum distances.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Real

Returns the value of the Nth extremum square distance.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Boolean

Returns True if the Nth extremum distance is a  
         minimum.") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Extrema_POnCurv

Returns the point of the Nth extremum distance.") Point;
		const Extrema_POnCurv & Point (const Standard_Integer N);
};


%feature("shadow") Extrema_ExtPElC::~Extrema_ExtPElC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_ExtPElC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_ExtPElC2d;
class Extrema_ExtPElC2d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_ExtPElC2d;
		 Extrema_ExtPElC2d ();
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	C(gp_Lin2d)
	Tol(Standard_Real)
	Uinf(Standard_Real)
	Usup(Standard_Real)

Returns:
	None

Calculates the extremum distance between the  
         point P and the segment [Uinf,Usup] of the line L.") Extrema_ExtPElC2d;
		 Extrema_ExtPElC2d (const gp_Pnt2d & P,const gp_Lin2d & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	L(gp_Lin2d)
	Tol(Standard_Real)
	Uinf(Standard_Real)
	Usup(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Pnt2d & P,const gp_Lin2d & L,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	C(gp_Circ2d)
	Tol(Standard_Real)
	Uinf(Standard_Real)
	Usup(Standard_Real)

Returns:
	None

Calculates the 2 extremum distances between the  
         point P and the segment [Uinf,Usup] of the circle C.  
         Tol is used to determine  
         if P is on the axis of the circle or  
         if an extremum is on an endpoint of the segment.  
         If P is on the axis of the circle,  
         there are infinite solution then IsDone(me)=False.  
         The conditions on the Uinf and Usup are:  
           0. <= Uinf <= 2.*PI and Usup > Uinf.  
         If Usup > Uinf + 2.*PI, then only the solutions in  
         the range [Uinf,Uinf+2.*PI[ are computed.") Extrema_ExtPElC2d;
		 Extrema_ExtPElC2d (const gp_Pnt2d & P,const gp_Circ2d & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	C(gp_Circ2d)
	Tol(Standard_Real)
	Uinf(Standard_Real)
	Usup(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Pnt2d & P,const gp_Circ2d & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	C(gp_Elips2d)
	Tol(Standard_Real)
	Uinf(Standard_Real)
	Usup(Standard_Real)

Returns:
	None

Calculates the 4 extremum distances between the  
         point P and the segment [Uinf,Usup] of the elipse C.  
         Tol is used to determine  
         if the point is on the axis of the elipse and  
         if the major radius is equal to the minor radius or  
         if an extremum is on an endpoint of the segment.  
         If P is on the axis of the elipse,  
         there are infinite solution then IsDone(me)=False.  
         The conditions on the Uinf and Usup are:  
           0. <= Uinf <= 2.*PI and Usup > Uinf.  
         If Usup > Uinf + 2.*PI, then only the solutions in  
         the range [Uinf,Uinf+2.*PI[ are computed.") Extrema_ExtPElC2d;
		 Extrema_ExtPElC2d (const gp_Pnt2d & P,const gp_Elips2d & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	C(gp_Elips2d)
	Tol(Standard_Real)
	Uinf(Standard_Real)
	Usup(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Pnt2d & P,const gp_Elips2d & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	C(gp_Hypr2d)
	Tol(Standard_Real)
	Uinf(Standard_Real)
	Usup(Standard_Real)

Returns:
	None

Calculates the extremum distances between the  
         point P and the segment [Uinf,Usup] of the hyperbola  
         C.  
         Tol is used to determine if two solutions u and v  
         are identical; the condition is:  
         dist(C(u),C(v)) < Tol.") Extrema_ExtPElC2d;
		 Extrema_ExtPElC2d (const gp_Pnt2d & P,const gp_Hypr2d & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	C(gp_Hypr2d)
	Tol(Standard_Real)
	Uinf(Standard_Real)
	Usup(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Pnt2d & P,const gp_Hypr2d & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	C(gp_Parab2d)
	Tol(Standard_Real)
	Uinf(Standard_Real)
	Usup(Standard_Real)

Returns:
	None

Calculates the 4 extremum distances between the  
         point P and the segment [Uinf,Usup] of the parabola  
         C.  
         Tol is used to determine if two solutions u and v  
         are identical; the condition is:  
         dist(C(u),C(v)) < Tol.") Extrema_ExtPElC2d;
		 Extrema_ExtPElC2d (const gp_Pnt2d & P,const gp_Parab2d & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	C(gp_Parab2d)
	Tol(Standard_Real)
	Uinf(Standard_Real)
	Usup(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Pnt2d & P,const gp_Parab2d & C,const Standard_Real Tol,const Standard_Real Uinf,const Standard_Real Usup);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

True if the distances are found.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of extremum distances.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Real

Returns the value of the Nth extremum square distance.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Boolean

Returns True if the Nth extremum distance is a  
         minimum.") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Extrema_POnCurv2d

Returns the point of the Nth extremum distance.") Point;
		const Extrema_POnCurv2d & Point (const Standard_Integer N);
};


%feature("shadow") Extrema_ExtPElC2d::~Extrema_ExtPElC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_ExtPElC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_ExtPElS;
class Extrema_ExtPElS {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_ExtPElS;
		 Extrema_ExtPElS ();
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(gp_Cylinder)
	Tol(Standard_Real)

Returns:
	None

It calculates all the distances between a point  
         and a cylinder from gp.  
         Tol is used to test if the point is on the axis.") Extrema_ExtPElS;
		 Extrema_ExtPElS (const gp_Pnt & P,const gp_Cylinder & S,const Standard_Real Tol);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(gp_Cylinder)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Pnt & P,const gp_Cylinder & S,const Standard_Real Tol);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(gp_Pln)
	Tol(Standard_Real)

Returns:
	None

It calculates all the distances between a point  
         and a plane from gp.  
         Tol is used to test if the point is on the plane.") Extrema_ExtPElS;
		 Extrema_ExtPElS (const gp_Pnt & P,const gp_Pln & S,const Standard_Real Tol);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(gp_Pln)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Pnt & P,const gp_Pln & S,const Standard_Real Tol);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(gp_Cone)
	Tol(Standard_Real)

Returns:
	None

It calculates all the distances between a point  
         and a cone from gp.  
         Tol is used to test if the point is at the apex or  
         on the axis.") Extrema_ExtPElS;
		 Extrema_ExtPElS (const gp_Pnt & P,const gp_Cone & S,const Standard_Real Tol);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(gp_Cone)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Pnt & P,const gp_Cone & S,const Standard_Real Tol);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(gp_Torus)
	Tol(Standard_Real)

Returns:
	None

It calculates all the distances between a point  
         and a torus from gp.  
         Tol is used to test if the point is on the axis.") Extrema_ExtPElS;
		 Extrema_ExtPElS (const gp_Pnt & P,const gp_Torus & S,const Standard_Real Tol);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(gp_Torus)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Pnt & P,const gp_Torus & S,const Standard_Real Tol);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(gp_Sphere)
	Tol(Standard_Real)

Returns:
	None

It calculates all the distances between a point  
         and a sphere from gp.  
         Tol is used to test if the point is at the center.") Extrema_ExtPElS;
		 Extrema_ExtPElS (const gp_Pnt & P,const gp_Sphere & S,const Standard_Real Tol);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(gp_Sphere)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Pnt & P,const gp_Sphere & S,const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the distances are found.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of extremum distances.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Real

Returns the value of the Nth resulting square distance.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Extrema_POnSurf

Returns the point of the Nth resulting distance.") Point;
		const Extrema_POnSurf & Point (const Standard_Integer N);
};


%feature("shadow") Extrema_ExtPElS::~Extrema_ExtPElS %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_ExtPElS {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_ExtPExtS;
class Extrema_ExtPExtS {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_ExtPExtS;
		 Extrema_ExtPExtS ();
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(Adaptor3d_SurfaceOfLinearExtrusion)
	Umin(Standard_Real)
	Usup(Standard_Real)
	Vmin(Standard_Real)
	Vsup(Standard_Real)
	TolU(Standard_Real)
	TolV(Standard_Real)

Returns:
	None

It calculates all the distances between a point  
         from gp and a Surface.") Extrema_ExtPExtS;
		 Extrema_ExtPExtS (const gp_Pnt & P,const Adaptor3d_SurfaceOfLinearExtrusion & S,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real Vmin,const Standard_Real Vsup,const Standard_Real TolU,const Standard_Real TolV);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(Adaptor3d_SurfaceOfLinearExtrusion)
	TolU(Standard_Real)
	TolV(Standard_Real)

Returns:
	None

It calculates all the distances between a point  
         from gp and a Surface.") Extrema_ExtPExtS;
		 Extrema_ExtPExtS (const gp_Pnt & P,const Adaptor3d_SurfaceOfLinearExtrusion & S,const Standard_Real TolU,const Standard_Real TolV);
		%feature("autodoc", "Args:
	S(Adaptor3d_SurfaceOfLinearExtrusion)
	Uinf(Standard_Real)
	Usup(Standard_Real)
	Vinf(Standard_Real)
	Vsup(Standard_Real)
	TolU(Standard_Real)
	TolV(Standard_Real)

Returns:
	None

Initializes the fields of the algorithm.") Initialize;
		void Initialize (const Adaptor3d_SurfaceOfLinearExtrusion & S,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real Vinf,const Standard_Real Vsup,const Standard_Real TolU,const Standard_Real TolV);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Pnt & P);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the distances are found.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of extremum distances.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Real

Returns the value of the Nth resulting square distance.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Extrema_POnSurf

Returns the point of the Nth resulting distance.") Point;
		const Extrema_POnSurf & Point (const Standard_Integer N);
};


%feature("shadow") Extrema_ExtPExtS::~Extrema_ExtPExtS %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_ExtPExtS {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_ExtPRevS;
class Extrema_ExtPRevS {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_ExtPRevS;
		 Extrema_ExtPRevS ();
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(Adaptor3d_SurfaceOfRevolution)
	Umin(Standard_Real)
	Usup(Standard_Real)
	Vmin(Standard_Real)
	Vsup(Standard_Real)
	TolU(Standard_Real)
	TolV(Standard_Real)

Returns:
	None

It calculates all the distances between a point  
         from gp and a SurfacePtr from Adaptor3d.") Extrema_ExtPRevS;
		 Extrema_ExtPRevS (const gp_Pnt & P,const Adaptor3d_SurfaceOfRevolution & S,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real Vmin,const Standard_Real Vsup,const Standard_Real TolU,const Standard_Real TolV);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(Adaptor3d_SurfaceOfRevolution)
	TolU(Standard_Real)
	TolV(Standard_Real)

Returns:
	None

It calculates all the distances between a point  
         from gp and a SurfacePtr from Adaptor3d.") Extrema_ExtPRevS;
		 Extrema_ExtPRevS (const gp_Pnt & P,const Adaptor3d_SurfaceOfRevolution & S,const Standard_Real TolU,const Standard_Real TolV);
		%feature("autodoc", "Args:
	S(Adaptor3d_SurfaceOfRevolution)
	Umin(Standard_Real)
	Usup(Standard_Real)
	Vmin(Standard_Real)
	Vsup(Standard_Real)
	TolU(Standard_Real)
	TolV(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Adaptor3d_SurfaceOfRevolution & S,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real Vmin,const Standard_Real Vsup,const Standard_Real TolU,const Standard_Real TolV);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Pnt & P);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the distances are found.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of extremum distances.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Real

Returns the value of the Nth resulting square distance.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Extrema_POnSurf

Returns the point of the Nth resulting distance.") Point;
		const Extrema_POnSurf & Point (const Standard_Integer N);
};


%feature("shadow") Extrema_ExtPRevS::~Extrema_ExtPRevS %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_ExtPRevS {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_ExtPS;
class Extrema_ExtPS {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_ExtPS;
		 Extrema_ExtPS ();
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(Adaptor3d_Surface)
	TolU(Standard_Real)
	TolV(Standard_Real)
	F(Extrema_ExtFlag)=Extrema_ExtFlag_MINMAX
	A(Extrema_ExtAlgo)=Extrema_ExtAlgo_Grad

Returns:
	None

It calculates all the distances.  
         NbU and NbV are used to locate the close points  
         to find the zeros. They must be great enough  
         such that if there is N extrema, there will  
         be N extrema between P and the grid.  
         TolU et TolV are used to determine the conditions  
         to stop the iterations; at the iteration number n:  
          (Un - Un-1) < TolU and (Vn - Vn-1) < TolV .") Extrema_ExtPS;
		 Extrema_ExtPS (const gp_Pnt & P,const Adaptor3d_Surface & S,const Standard_Real TolU,const Standard_Real TolV,const Extrema_ExtFlag F = Extrema_ExtFlag_MINMAX,const Extrema_ExtAlgo A = Extrema_ExtAlgo_Grad);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(Adaptor3d_Surface)
	Uinf(Standard_Real)
	Usup(Standard_Real)
	Vinf(Standard_Real)
	Vsup(Standard_Real)
	TolU(Standard_Real)
	TolV(Standard_Real)
	F(Extrema_ExtFlag)=Extrema_ExtFlag_MINMAX
	A(Extrema_ExtAlgo)=Extrema_ExtAlgo_Grad

Returns:
	None

It calculates all the distances.  
         NbU and NbV are used to locate the close points  
         to find the zeros. They must be great enough  
         such that if there is N extrema, there will  
         be N extrema between P and the grid.  
         TolU et TolV are used to determine the conditions  
         to stop the iterations; at the iteration number n:  
          (Un - Un-1) < TolU and (Vn - Vn-1) < TolV .") Extrema_ExtPS;
		 Extrema_ExtPS (const gp_Pnt & P,const Adaptor3d_Surface & S,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real Vinf,const Standard_Real Vsup,const Standard_Real TolU,const Standard_Real TolV,const Extrema_ExtFlag F = Extrema_ExtFlag_MINMAX,const Extrema_ExtAlgo A = Extrema_ExtAlgo_Grad);
		%feature("autodoc", "Args:
	S(Adaptor3d_Surface)
	Uinf(Standard_Real)
	Usup(Standard_Real)
	Vinf(Standard_Real)
	Vsup(Standard_Real)
	TolU(Standard_Real)
	TolV(Standard_Real)

Returns:
	None

Initializes the fields of the algorithm.") Initialize;
		void Initialize (const Adaptor3d_Surface & S,const Standard_Real Uinf,const Standard_Real Usup,const Standard_Real Vinf,const Standard_Real Vsup,const Standard_Real TolU,const Standard_Real TolV);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

Computes the distances.  
         An exception is raised if the fieds have not been  
         initialized.") Perform;
		void Perform (const gp_Pnt & P);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the distances are found.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of extremum distances.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Real

Returns the value of the Nth resulting square distance.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Extrema_POnSurf

Returns the point of the Nth resulting distance.") Point;
		const Extrema_POnSurf & Point (const Standard_Integer N);
		%feature("autodoc", "Args:
	dUfVf(Standard_Real)
	dUfVl(Standard_Real)
	dUlVf(Standard_Real)
	dUlVl(Standard_Real)
	PUfVf(gp_Pnt)
	PUfVl(gp_Pnt)
	PUlVf(gp_Pnt)
	PUlVl(gp_Pnt)

Returns:
	None

if the surface is a trimmed surface,  
         dUfVf is a square distance between <P> and the point  
         of parameter FirstUParameter and FirstVParameter <PUfVf>.  
         dUfVl is a square distance between <P> and the point  
         of parameter FirstUParameter and LastVParameter <PUfVl>.  
         dUlVf is a square distance between <P> and the point  
         of parameter LastUParameter and FirstVParameter <PUlVf>.  
         dUlVl is a square distance between <P> and the point  
         of parameter LastUParameter and LastVParameter <PUlVl>.") TrimmedSquareDistances;
		void TrimmedSquareDistances (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt & PUfVf,gp_Pnt & PUfVl,gp_Pnt & PUlVf,gp_Pnt & PUlVl);
		%feature("autodoc", "Args:
	F(Extrema_ExtFlag)

Returns:
	None

No detailed docstring for this function.") SetFlag;
		void SetFlag (const Extrema_ExtFlag F);
		%feature("autodoc", "Args:
	A(Extrema_ExtAlgo)

Returns:
	None

No detailed docstring for this function.") SetAlgo;
		void SetAlgo (const Extrema_ExtAlgo A);
};


%feature("shadow") Extrema_ExtPS::~Extrema_ExtPS %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_ExtPS {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_ExtSS;
class Extrema_ExtSS {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_ExtSS;
		 Extrema_ExtSS ();
		%feature("autodoc", "Args:
	S1(Adaptor3d_Surface)
	S2(Adaptor3d_Surface)
	TolS1(Standard_Real)
	TolS2(Standard_Real)

Returns:
	None

It calculates all the distances between S1 and S2.") Extrema_ExtSS;
		 Extrema_ExtSS (const Adaptor3d_Surface & S1,const Adaptor3d_Surface & S2,const Standard_Real TolS1,const Standard_Real TolS2);
		%feature("autodoc", "Args:
	S1(Adaptor3d_Surface)
	S2(Adaptor3d_Surface)
	Uinf1(Standard_Real)
	Usup1(Standard_Real)
	Vinf1(Standard_Real)
	Vsup1(Standard_Real)
	Uinf2(Standard_Real)
	Usup2(Standard_Real)
	Vinf2(Standard_Real)
	Vsup2(Standard_Real)
	TolS1(Standard_Real)
	TolS2(Standard_Real)

Returns:
	None

It calculates all the distances between S1 and S2.") Extrema_ExtSS;
		 Extrema_ExtSS (const Adaptor3d_Surface & S1,const Adaptor3d_Surface & S2,const Standard_Real Uinf1,const Standard_Real Usup1,const Standard_Real Vinf1,const Standard_Real Vsup1,const Standard_Real Uinf2,const Standard_Real Usup2,const Standard_Real Vinf2,const Standard_Real Vsup2,const Standard_Real TolS1,const Standard_Real TolS2);
		%feature("autodoc", "Args:
	S2(Adaptor3d_Surface)
	Uinf2(Standard_Real)
	Usup2(Standard_Real)
	Vinf2(Standard_Real)
	Vsup2(Standard_Real)
	TolS1(Standard_Real)

Returns:
	None

Initializes the fields of the algorithm.") Initialize;
		void Initialize (const Adaptor3d_Surface & S2,const Standard_Real Uinf2,const Standard_Real Usup2,const Standard_Real Vinf2,const Standard_Real Vsup2,const Standard_Real TolS1);
		%feature("autodoc", "Args:
	S1(Adaptor3d_Surface)
	Uinf1(Standard_Real)
	Usup1(Standard_Real)
	Vinf1(Standard_Real)
	Vsup1(Standard_Real)
	TolS1(Standard_Real)

Returns:
	None

Computes the distances.  
         An exception is raised if the fieds have not been  
         initialized.") Perform;
		void Perform (const Adaptor3d_Surface & S1,const Standard_Real Uinf1,const Standard_Real Usup1,const Standard_Real Vinf1,const Standard_Real Vsup1,const Standard_Real TolS1);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the distances are found.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the curve is on a parallel surface.") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of extremum distances.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Real

Returns the value of the Nth resulting square distance.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)
	P1(Extrema_POnSurf)
	P2(Extrema_POnSurf)

Returns:
	None

Returns the point of the Nth resulting distance.") Points;
		void Points (const Standard_Integer N,Extrema_POnSurf & P1,Extrema_POnSurf & P2);
};


%feature("shadow") Extrema_ExtSS::~Extrema_ExtSS %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_ExtSS {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_FuncExtCS;
class Extrema_FuncExtCS : public math_FunctionSetWithDerivatives {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_FuncExtCS;
		 Extrema_FuncExtCS ();
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	S(Adaptor3d_Surface)

Returns:
	None

No detailed docstring for this function.") Extrema_FuncExtCS;
		 Extrema_FuncExtCS (const Adaptor3d_Curve & C,const Adaptor3d_Surface & S);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	S(Adaptor3d_Surface)

Returns:
	None

sets the field mysurf of the function.") Initialize;
		void Initialize (const Adaptor3d_Curve & C,const Adaptor3d_Surface & S);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "Args:
	UV(math_Vector)
	F(math_Vector)

Returns:
	Standard_Boolean

Calculation of Fi(U,V).") Value;
		Standard_Boolean Value (const math_Vector & UV,math_Vector & F);
		%feature("autodoc", "Args:
	UV(math_Vector)
	DF(math_Matrix)

Returns:
	Standard_Boolean

Calculation of Fi'(U,V).") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & UV,math_Matrix & DF);
		%feature("autodoc", "Args:
	UV(math_Vector)
	F(math_Vector)
	DF(math_Matrix)

Returns:
	Standard_Boolean

Calculation of Fi(U,V) and Fi'(U,V).") Values;
		Standard_Boolean Values (const math_Vector & UV,math_Vector & F,math_Matrix & DF);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

Save the found extremum.") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Return the number of found extrema.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Real

Return the value of the Nth distance.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Extrema_POnCurv

Returns the Nth extremum on C.") PointOnCurve;
		const Extrema_POnCurv & PointOnCurve (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Extrema_POnSurf

Return the Nth extremum on S.") PointOnSurface;
		const Extrema_POnSurf & PointOnSurface (const Standard_Integer N);
};


%feature("shadow") Extrema_FuncExtCS::~Extrema_FuncExtCS %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_FuncExtCS {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_FuncExtPS;
class Extrema_FuncExtPS : public math_FunctionSetWithDerivatives {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_FuncExtPS;
		 Extrema_FuncExtPS ();
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(Adaptor3d_Surface)

Returns:
	None

No detailed docstring for this function.") Extrema_FuncExtPS;
		 Extrema_FuncExtPS (const gp_Pnt & P,const Adaptor3d_Surface & S);
		%feature("autodoc", "Args:
	S(Adaptor3d_Surface)

Returns:
	None

sets the field mysurf of the function.") Initialize;
		void Initialize (const Adaptor3d_Surface & S);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

sets the field mysurf of the function.") SetPoint;
		void SetPoint (const gp_Pnt & P);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "Args:
	UV(math_Vector)
	F(math_Vector)

Returns:
	Standard_Boolean

Calculate Fi(U,V).") Value;
		Standard_Boolean Value (const math_Vector & UV,math_Vector & F);
		%feature("autodoc", "Args:
	UV(math_Vector)
	DF(math_Matrix)

Returns:
	Standard_Boolean

Calculate Fi'(U,V).") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & UV,math_Matrix & DF);
		%feature("autodoc", "Args:
	UV(math_Vector)
	F(math_Vector)
	DF(math_Matrix)

Returns:
	Standard_Boolean

Calculate Fi(U,V) and Fi'(U,V).") Values;
		Standard_Boolean Values (const math_Vector & UV,math_Vector & F,math_Matrix & DF);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

Save the found extremum.") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Return the number of found extrema.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Real

Return the value of the Nth distance.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Extrema_POnSurf

Returns the Nth extremum.") Point;
		const Extrema_POnSurf & Point (const Standard_Integer N);
};


%feature("shadow") Extrema_FuncExtPS::~Extrema_FuncExtPS %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_FuncExtPS {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_FuncExtSS;
class Extrema_FuncExtSS : public math_FunctionSetWithDerivatives {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_FuncExtSS;
		 Extrema_FuncExtSS ();
		%feature("autodoc", "Args:
	S1(Adaptor3d_Surface)
	S2(Adaptor3d_Surface)

Returns:
	None

No detailed docstring for this function.") Extrema_FuncExtSS;
		 Extrema_FuncExtSS (const Adaptor3d_Surface & S1,const Adaptor3d_Surface & S2);
		%feature("autodoc", "Args:
	S1(Adaptor3d_Surface)
	S2(Adaptor3d_Surface)

Returns:
	None

sets the field mysurf of the function.") Initialize;
		void Initialize (const Adaptor3d_Surface & S1,const Adaptor3d_Surface & S2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "Args:
	UV(math_Vector)
	F(math_Vector)

Returns:
	Standard_Boolean

Calculate Fi(U,V).") Value;
		Standard_Boolean Value (const math_Vector & UV,math_Vector & F);
		%feature("autodoc", "Args:
	UV(math_Vector)
	DF(math_Matrix)

Returns:
	Standard_Boolean

Calculate Fi'(U,V).") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & UV,math_Matrix & DF);
		%feature("autodoc", "Args:
	UV(math_Vector)
	F(math_Vector)
	DF(math_Matrix)

Returns:
	Standard_Boolean

Calculate Fi(U,V) and Fi'(U,V).") Values;
		Standard_Boolean Values (const math_Vector & UV,math_Vector & F,math_Matrix & DF);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

Save the found extremum.") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Return the number of found extrema.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Real

Return the value of the Nth distance.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Extrema_POnSurf

Return the Nth extremum on S1.") PointOnS1;
		const Extrema_POnSurf & PointOnS1 (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Extrema_POnSurf

Renvoie le Nieme extremum sur S2.") PointOnS2;
		const Extrema_POnSurf & PointOnS2 (const Standard_Integer N);
};


%feature("shadow") Extrema_FuncExtSS::~Extrema_FuncExtSS %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_FuncExtSS {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_GenExtCS;
class Extrema_GenExtCS {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_GenExtCS;
		 Extrema_GenExtCS ();
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	S(Adaptor3d_Surface)
	NbT(Standard_Integer)
	NbU(Standard_Integer)
	NbV(Standard_Integer)
	Tol1(Standard_Real)
	Tol2(Standard_Real)

Returns:
	None

It calculates all the distances.  
         The function F(u,v)=distance(S1(u1,v1),S2(u2,v2)) has an  
         extremum when gradient(F)=0. The algorithm searchs  
         all the zeros inside the definition ranges of the  
         surfaces.  
         NbU and NbV are used to locate the close points on the  
         surface and NbT on the curve to find the zeros.") Extrema_GenExtCS;
		 Extrema_GenExtCS (const Adaptor3d_Curve & C,const Adaptor3d_Surface & S,const Standard_Integer NbT,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real Tol1,const Standard_Real Tol2);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	S(Adaptor3d_Surface)
	NbT(Standard_Integer)
	NbU(Standard_Integer)
	NbV(Standard_Integer)
	tmin(Standard_Real)
	tsup(Standard_Real)
	Umin(Standard_Real)
	Usup(Standard_Real)
	Vmin(Standard_Real)
	Vsup(Standard_Real)
	Tol1(Standard_Real)
	Tol2(Standard_Real)

Returns:
	None

It calculates all the distances.  
         The function F(u,v)=distance(P,S(u,v)) has an  
         extremum when gradient(F)=0. The algorithm searchs  
         all the zeros inside the definition ranges of the  
         surface.  
         NbT,NbU and NbV are used to locate the close points  
         to find the zeros.") Extrema_GenExtCS;
		 Extrema_GenExtCS (const Adaptor3d_Curve & C,const Adaptor3d_Surface & S,const Standard_Integer NbT,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real tmin,const Standard_Real tsup,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real Vmin,const Standard_Real Vsup,const Standard_Real Tol1,const Standard_Real Tol2);
		%feature("autodoc", "Args:
	S(Adaptor3d_Surface)
	NbU(Standard_Integer)
	NbV(Standard_Integer)
	Tol2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Adaptor3d_Surface & S,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real Tol2);
		%feature("autodoc", "Args:
	S(Adaptor3d_Surface)
	NbU(Standard_Integer)
	NbV(Standard_Integer)
	Umin(Standard_Real)
	Usup(Standard_Real)
	Vmin(Standard_Real)
	Vsup(Standard_Real)
	Tol2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Adaptor3d_Surface & S,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real Vmin,const Standard_Real Vsup,const Standard_Real Tol2);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	NbT(Standard_Integer)
	Tol1(Standard_Real)

Returns:
	None

the algorithm is done with S  
         An exception is raised if the fields have not  
         been initialized.") Perform;
		void Perform (const Adaptor3d_Curve & C,const Standard_Integer NbT,const Standard_Real Tol1);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	NbT(Standard_Integer)
	tmin(Standard_Real)
	tsup(Standard_Real)
	Tol1(Standard_Real)

Returns:
	None

the algorithm is done with C  
         An exception is raised if the fields have not  
         been initialized.") Perform;
		void Perform (const Adaptor3d_Curve & C,const Standard_Integer NbT,const Standard_Real tmin,const Standard_Real tsup,const Standard_Real Tol1);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the distances are found.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of extremum distances.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Real

Returns the value of the Nth resulting square distance.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Extrema_POnCurv

Returns the point of the Nth resulting distance.") PointOnCurve;
		const Extrema_POnCurv & PointOnCurve (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Extrema_POnSurf

Returns the point of the Nth resulting distance.") PointOnSurface;
		const Extrema_POnSurf & PointOnSurface (const Standard_Integer N);
};


%feature("shadow") Extrema_GenExtCS::~Extrema_GenExtCS %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_GenExtCS {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_GenExtPS;
class Extrema_GenExtPS {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_GenExtPS;
		 Extrema_GenExtPS ();
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(Adaptor3d_Surface)
	NbU(Standard_Integer)
	NbV(Standard_Integer)
	TolU(Standard_Real)
	TolV(Standard_Real)
	F(Extrema_ExtFlag)=Extrema_ExtFlag_MINMAX
	A(Extrema_ExtAlgo)=Extrema_ExtAlgo_Grad

Returns:
	None

It calculates all the distances.  
         The function F(u,v)=distance(P,S(u,v)) has an  
         extremum when gradient(F)=0. The algorithm searchs  
         all the zeros inside the definition ranges of the  
         surface.  
         NbU and NbV are used to locate the close points  
         to find the zeros. They must be great enough  
         such that if there is N extrema, there will  
         be N extrema between P and the grid.  
         TolU et TolV are used to determine the conditions  
         to stop the iterations; at the iteration number n:  
          (Un - Un-1) < TolU and (Vn - Vn-1) < TolV .") Extrema_GenExtPS;
		 Extrema_GenExtPS (const gp_Pnt & P,const Adaptor3d_Surface & S,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real TolU,const Standard_Real TolV,const Extrema_ExtFlag F = Extrema_ExtFlag_MINMAX,const Extrema_ExtAlgo A = Extrema_ExtAlgo_Grad);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(Adaptor3d_Surface)
	NbU(Standard_Integer)
	NbV(Standard_Integer)
	Umin(Standard_Real)
	Usup(Standard_Real)
	Vmin(Standard_Real)
	Vsup(Standard_Real)
	TolU(Standard_Real)
	TolV(Standard_Real)
	F(Extrema_ExtFlag)=Extrema_ExtFlag_MINMAX
	A(Extrema_ExtAlgo)=Extrema_ExtAlgo_Grad

Returns:
	None

It calculates all the distances.  
         The function F(u,v)=distance(P,S(u,v)) has an  
         extremum when gradient(F)=0. The algorithm searchs  
         all the zeros inside the definition ranges of the  
         surface.  
         NbU and NbV are used to locate the close points  
         to find the zeros. They must be great enough  
         such that if there is N extrema, there will  
         be N extrema between P and the grid.  
         TolU et TolV are used to determine the conditions  
         to stop the iterations; at the iteration number n:  
          (Un - Un-1) < TolU and (Vn - Vn-1) < TolV .") Extrema_GenExtPS;
		 Extrema_GenExtPS (const gp_Pnt & P,const Adaptor3d_Surface & S,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real Vmin,const Standard_Real Vsup,const Standard_Real TolU,const Standard_Real TolV,const Extrema_ExtFlag F = Extrema_ExtFlag_MINMAX,const Extrema_ExtAlgo A = Extrema_ExtAlgo_Grad);
		%feature("autodoc", "Args:
	S(Adaptor3d_Surface)
	NbU(Standard_Integer)
	NbV(Standard_Integer)
	TolU(Standard_Real)
	TolV(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Adaptor3d_Surface & S,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real TolU,const Standard_Real TolV);
		%feature("autodoc", "Args:
	S(Adaptor3d_Surface)
	NbU(Standard_Integer)
	NbV(Standard_Integer)
	Umin(Standard_Real)
	Usup(Standard_Real)
	Vmin(Standard_Real)
	Vsup(Standard_Real)
	TolU(Standard_Real)
	TolV(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Adaptor3d_Surface & S,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real Vmin,const Standard_Real Vsup,const Standard_Real TolU,const Standard_Real TolV);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

the algorithm is done with the point P.  
         An exception is raised if the fields have not  
         been initialized.") Perform;
		void Perform (const gp_Pnt & P);
		%feature("autodoc", "Args:
	F(Extrema_ExtFlag)

Returns:
	None

No detailed docstring for this function.") SetFlag;
		void SetFlag (const Extrema_ExtFlag F);
		%feature("autodoc", "Args:
	A(Extrema_ExtAlgo)

Returns:
	None

No detailed docstring for this function.") SetAlgo;
		void SetAlgo (const Extrema_ExtAlgo A);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the distances are found.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of extremum distances.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Real

Returns the value of the Nth resulting square distance.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Extrema_POnSurf

Returns the point of the Nth resulting distance.") Point;
		const Extrema_POnSurf & Point (const Standard_Integer N);
};


%feature("shadow") Extrema_GenExtPS::~Extrema_GenExtPS %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_GenExtPS {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_GenExtSS;
class Extrema_GenExtSS {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_GenExtSS;
		 Extrema_GenExtSS ();
		%feature("autodoc", "Args:
	S1(Adaptor3d_Surface)
	S2(Adaptor3d_Surface)
	NbU(Standard_Integer)
	NbV(Standard_Integer)
	Tol1(Standard_Real)
	Tol2(Standard_Real)

Returns:
	None

It calculates all the distances.  
         The function F(u,v)=distance(S1(u1,v1),S2(u2,v2)) has an  
         extremum when gradient(F)=0. The algorithm searchs  
         all the zeros inside the definition ranges of the  
         surfaces.  
         NbU and NbV are used to locate the close points  
         to find the zeros.") Extrema_GenExtSS;
		 Extrema_GenExtSS (const Adaptor3d_Surface & S1,const Adaptor3d_Surface & S2,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real Tol1,const Standard_Real Tol2);
		%feature("autodoc", "Args:
	S1(Adaptor3d_Surface)
	S2(Adaptor3d_Surface)
	NbU(Standard_Integer)
	NbV(Standard_Integer)
	U1min(Standard_Real)
	U1sup(Standard_Real)
	V1min(Standard_Real)
	V1sup(Standard_Real)
	U2min(Standard_Real)
	U2sup(Standard_Real)
	V2min(Standard_Real)
	V2sup(Standard_Real)
	Tol1(Standard_Real)
	Tol2(Standard_Real)

Returns:
	None

It calculates all the distances.  
         The function F(u,v)=distance(P,S(u,v)) has an  
         extremum when gradient(F)=0. The algorithm searchs  
         all the zeros inside the definition ranges of the  
         surface.  
         NbU and NbV are used to locate the close points  
         to find the zeros.") Extrema_GenExtSS;
		 Extrema_GenExtSS (const Adaptor3d_Surface & S1,const Adaptor3d_Surface & S2,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real U1min,const Standard_Real U1sup,const Standard_Real V1min,const Standard_Real V1sup,const Standard_Real U2min,const Standard_Real U2sup,const Standard_Real V2min,const Standard_Real V2sup,const Standard_Real Tol1,const Standard_Real Tol2);
		%feature("autodoc", "Args:
	S2(Adaptor3d_Surface)
	NbU(Standard_Integer)
	NbV(Standard_Integer)
	Tol2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Adaptor3d_Surface & S2,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real Tol2);
		%feature("autodoc", "Args:
	S2(Adaptor3d_Surface)
	NbU(Standard_Integer)
	NbV(Standard_Integer)
	U2min(Standard_Real)
	U2sup(Standard_Real)
	V2min(Standard_Real)
	V2sup(Standard_Real)
	Tol2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Adaptor3d_Surface & S2,const Standard_Integer NbU,const Standard_Integer NbV,const Standard_Real U2min,const Standard_Real U2sup,const Standard_Real V2min,const Standard_Real V2sup,const Standard_Real Tol2);
		%feature("autodoc", "Args:
	S1(Adaptor3d_Surface)
	Tol1(Standard_Real)

Returns:
	None

the algorithm is done with S1  
         An exception is raised if the fields have not  
         been initialized.") Perform;
		void Perform (const Adaptor3d_Surface & S1,const Standard_Real Tol1);
		%feature("autodoc", "Args:
	S1(Adaptor3d_Surface)
	U1min(Standard_Real)
	U1sup(Standard_Real)
	V1min(Standard_Real)
	V1sup(Standard_Real)
	Tol1(Standard_Real)

Returns:
	None

the algorithm is done withS1  
         An exception is raised if the fields have not  
         been initialized.") Perform;
		void Perform (const Adaptor3d_Surface & S1,const Standard_Real U1min,const Standard_Real U1sup,const Standard_Real V1min,const Standard_Real V1sup,const Standard_Real Tol1);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the distances are found.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of extremum distances.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Real

Returns the value of the Nth resulting square distance.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Extrema_POnSurf

Returns the point of the Nth resulting distance.") PointOnS1;
		const Extrema_POnSurf & PointOnS1 (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Extrema_POnSurf

Returns the point of the Nth resulting distance.") PointOnS2;
		const Extrema_POnSurf & PointOnS2 (const Standard_Integer N);
};


%feature("shadow") Extrema_GenExtSS::~Extrema_GenExtSS %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_GenExtSS {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_GenLocateExtCS;
class Extrema_GenLocateExtCS {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_GenLocateExtCS;
		 Extrema_GenLocateExtCS ();
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	S(Adaptor3d_Surface)
	T(Standard_Real)
	U(Standard_Real)
	V(Standard_Real)
	Tol1(Standard_Real)
	Tol2(Standard_Real)

Returns:
	None

Calculates the distance with two close points.  
         The close points are defined by the parameter values  
         T for C and (U,V) for S.  
         The function F(t,u,v)=distance(C(t),S(u,v))  
         has an extremun when gradient(F)=0. The algorithm searchs  
         a zero near the close points.") Extrema_GenLocateExtCS;
		 Extrema_GenLocateExtCS (const Adaptor3d_Curve & C,const Adaptor3d_Surface & S,const Standard_Real T,const Standard_Real U,const Standard_Real V,const Standard_Real Tol1,const Standard_Real Tol2);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	S(Adaptor3d_Surface)
	T(Standard_Real)
	U(Standard_Real)
	V(Standard_Real)
	Tol1(Standard_Real)
	Tol2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const Adaptor3d_Curve & C,const Adaptor3d_Surface & S,const Standard_Real T,const Standard_Real U,const Standard_Real V,const Standard_Real Tol1,const Standard_Real Tol2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the distance is found.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the value of the extremum square distance.") SquareDistance;
		Standard_Real SquareDistance ();
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv

Returns the point of the extremum distance on C.") PointOnCurve;
		const Extrema_POnCurv & PointOnCurve ();
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnSurf

Returns the point of the extremum distance on S.") PointOnSurface;
		const Extrema_POnSurf & PointOnSurface ();
};


%feature("shadow") Extrema_GenLocateExtCS::~Extrema_GenLocateExtCS %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_GenLocateExtCS {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_GenLocateExtPS;
class Extrema_GenLocateExtPS {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_GenLocateExtPS;
		 Extrema_GenLocateExtPS ();
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(Adaptor3d_Surface)
	U0(Standard_Real)
	V0(Standard_Real)
	TolU(Standard_Real)
	TolV(Standard_Real)

Returns:
	None

Calculates the distance with a close point.  
         The close point is defined by the parameter values  
         U0 and V0.  
         The function F(u,v)=distance(S(u,v),p) has an  
         extremun when gradient(F)=0. The algorithm searchs  
         a zero near the close point.") Extrema_GenLocateExtPS;
		 Extrema_GenLocateExtPS (const gp_Pnt & P,const Adaptor3d_Surface & S,const Standard_Real U0,const Standard_Real V0,const Standard_Real TolU,const Standard_Real TolV);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the distance is found.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the value of the extremum square distance.") SquareDistance;
		Standard_Real SquareDistance ();
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnSurf

Returns the point of the extremum distance.") Point;
		const Extrema_POnSurf & Point ();
};


%feature("shadow") Extrema_GenLocateExtPS::~Extrema_GenLocateExtPS %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_GenLocateExtPS {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_GenLocateExtSS;
class Extrema_GenLocateExtSS {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_GenLocateExtSS;
		 Extrema_GenLocateExtSS ();
		%feature("autodoc", "Args:
	S1(Adaptor3d_Surface)
	S2(Adaptor3d_Surface)
	U1(Standard_Real)
	V1(Standard_Real)
	U2(Standard_Real)
	V2(Standard_Real)
	Tol1(Standard_Real)
	Tol2(Standard_Real)

Returns:
	None

Calculates the distance with two close points.  
         The close points are defined by the parameter values  
         (U1,V1) for S1 and (U2,V2) for S2.  
         The function F(u1,v1,u2,v2)=distance(S1(u1,v1),S2(u2,v2))  
         has an extremun when gradient(F)=0. The algorithm searchs  
         a zero near the close points.") Extrema_GenLocateExtSS;
		 Extrema_GenLocateExtSS (const Adaptor3d_Surface & S1,const Adaptor3d_Surface & S2,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2,const Standard_Real Tol1,const Standard_Real Tol2);
		%feature("autodoc", "Args:
	S1(Adaptor3d_Surface)
	S2(Adaptor3d_Surface)
	U1(Standard_Real)
	V1(Standard_Real)
	U2(Standard_Real)
	V2(Standard_Real)
	Tol1(Standard_Real)
	Tol2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const Adaptor3d_Surface & S1,const Adaptor3d_Surface & S2,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2,const Standard_Real Tol1,const Standard_Real Tol2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the distance is found.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the value of the extremum square distance.") SquareDistance;
		Standard_Real SquareDistance ();
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnSurf

Returns the point of the extremum distance on S1.") PointOnS1;
		const Extrema_POnSurf & PointOnS1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnSurf

Returns the point of the extremum distance on S2.") PointOnS2;
		const Extrema_POnSurf & PointOnS2 ();
};


%feature("shadow") Extrema_GenLocateExtSS::~Extrema_GenLocateExtSS %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_GenLocateExtSS {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_HArray1OfPOnCurv;
class Extrema_HArray1OfPOnCurv : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Extrema_HArray1OfPOnCurv;
		 Extrema_HArray1OfPOnCurv (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") Extrema_HArray1OfPOnCurv;
		 Extrema_HArray1OfPOnCurv (const Standard_Integer Low,const Standard_Integer Up,const Extrema_POnCurv & V);
		%feature("autodoc", "Args:
	V(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Extrema_POnCurv & V);
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
	Value(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Extrema_POnCurv

No detailed docstring for this function.") Value;
		const Extrema_POnCurv & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Extrema_POnCurv

No detailed docstring for this function.") ChangeValue;
		Extrema_POnCurv & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_Array1OfPOnCurv

No detailed docstring for this function.") Array1;
		const Extrema_Array1OfPOnCurv & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_Array1OfPOnCurv

No detailed docstring for this function.") ChangeArray1;
		Extrema_Array1OfPOnCurv & ChangeArray1 ();
};


%feature("shadow") Extrema_HArray1OfPOnCurv::~Extrema_HArray1OfPOnCurv %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_HArray1OfPOnCurv {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_HArray1OfPOnCurv {
	Handle_Extrema_HArray1OfPOnCurv GetHandle() {
	return *(Handle_Extrema_HArray1OfPOnCurv*) &$self;
	}
};

%nodefaultctor Handle_Extrema_HArray1OfPOnCurv;
class Handle_Extrema_HArray1OfPOnCurv : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Extrema_HArray1OfPOnCurv();
        Handle_Extrema_HArray1OfPOnCurv(const Handle_Extrema_HArray1OfPOnCurv &aHandle);
        Handle_Extrema_HArray1OfPOnCurv(const Extrema_HArray1OfPOnCurv *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_HArray1OfPOnCurv DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_HArray1OfPOnCurv {
    Extrema_HArray1OfPOnCurv* GetObject() {
    return (Extrema_HArray1OfPOnCurv*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_HArray1OfPOnCurv::~Handle_Extrema_HArray1OfPOnCurv %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_HArray1OfPOnCurv {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_HArray1OfPOnCurv2d;
class Extrema_HArray1OfPOnCurv2d : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Extrema_HArray1OfPOnCurv2d;
		 Extrema_HArray1OfPOnCurv2d (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") Extrema_HArray1OfPOnCurv2d;
		 Extrema_HArray1OfPOnCurv2d (const Standard_Integer Low,const Standard_Integer Up,const Extrema_POnCurv2d & V);
		%feature("autodoc", "Args:
	V(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Extrema_POnCurv2d & V);
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
	Value(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv2d & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") Value;
		const Extrema_POnCurv2d & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") ChangeValue;
		Extrema_POnCurv2d & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_Array1OfPOnCurv2d

No detailed docstring for this function.") Array1;
		const Extrema_Array1OfPOnCurv2d & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_Array1OfPOnCurv2d

No detailed docstring for this function.") ChangeArray1;
		Extrema_Array1OfPOnCurv2d & ChangeArray1 ();
};


%feature("shadow") Extrema_HArray1OfPOnCurv2d::~Extrema_HArray1OfPOnCurv2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_HArray1OfPOnCurv2d {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_HArray1OfPOnCurv2d {
	Handle_Extrema_HArray1OfPOnCurv2d GetHandle() {
	return *(Handle_Extrema_HArray1OfPOnCurv2d*) &$self;
	}
};

%nodefaultctor Handle_Extrema_HArray1OfPOnCurv2d;
class Handle_Extrema_HArray1OfPOnCurv2d : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Extrema_HArray1OfPOnCurv2d();
        Handle_Extrema_HArray1OfPOnCurv2d(const Handle_Extrema_HArray1OfPOnCurv2d &aHandle);
        Handle_Extrema_HArray1OfPOnCurv2d(const Extrema_HArray1OfPOnCurv2d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_HArray1OfPOnCurv2d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_HArray1OfPOnCurv2d {
    Extrema_HArray1OfPOnCurv2d* GetObject() {
    return (Extrema_HArray1OfPOnCurv2d*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_HArray1OfPOnCurv2d::~Handle_Extrema_HArray1OfPOnCurv2d %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_HArray1OfPOnCurv2d {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_HArray1OfPOnSurf;
class Extrema_HArray1OfPOnSurf : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Extrema_HArray1OfPOnSurf;
		 Extrema_HArray1OfPOnSurf (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(Extrema_POnSurf)

Returns:
	None

No detailed docstring for this function.") Extrema_HArray1OfPOnSurf;
		 Extrema_HArray1OfPOnSurf (const Standard_Integer Low,const Standard_Integer Up,const Extrema_POnSurf & V);
		%feature("autodoc", "Args:
	V(Extrema_POnSurf)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Extrema_POnSurf & V);
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
	Value(Extrema_POnSurf)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnSurf & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Extrema_POnSurf

No detailed docstring for this function.") Value;
		const Extrema_POnSurf & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Extrema_POnSurf

No detailed docstring for this function.") ChangeValue;
		Extrema_POnSurf & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_Array1OfPOnSurf

No detailed docstring for this function.") Array1;
		const Extrema_Array1OfPOnSurf & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_Array1OfPOnSurf

No detailed docstring for this function.") ChangeArray1;
		Extrema_Array1OfPOnSurf & ChangeArray1 ();
};


%feature("shadow") Extrema_HArray1OfPOnSurf::~Extrema_HArray1OfPOnSurf %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_HArray1OfPOnSurf {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_HArray1OfPOnSurf {
	Handle_Extrema_HArray1OfPOnSurf GetHandle() {
	return *(Handle_Extrema_HArray1OfPOnSurf*) &$self;
	}
};

%nodefaultctor Handle_Extrema_HArray1OfPOnSurf;
class Handle_Extrema_HArray1OfPOnSurf : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Extrema_HArray1OfPOnSurf();
        Handle_Extrema_HArray1OfPOnSurf(const Handle_Extrema_HArray1OfPOnSurf &aHandle);
        Handle_Extrema_HArray1OfPOnSurf(const Extrema_HArray1OfPOnSurf *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_HArray1OfPOnSurf DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_HArray1OfPOnSurf {
    Extrema_HArray1OfPOnSurf* GetObject() {
    return (Extrema_HArray1OfPOnSurf*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_HArray1OfPOnSurf::~Handle_Extrema_HArray1OfPOnSurf %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_HArray1OfPOnSurf {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_HArray2OfPOnCurv;
class Extrema_HArray2OfPOnCurv : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Extrema_HArray2OfPOnCurv;
		 Extrema_HArray2OfPOnCurv (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)
	V(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") Extrema_HArray2OfPOnCurv;
		 Extrema_HArray2OfPOnCurv (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const Extrema_POnCurv & V);
		%feature("autodoc", "Args:
	V(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Extrema_POnCurv & V);
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
	Value(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Extrema_POnCurv & Value);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Extrema_POnCurv

No detailed docstring for this function.") Value;
		const Extrema_POnCurv & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Extrema_POnCurv

No detailed docstring for this function.") ChangeValue;
		Extrema_POnCurv & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_Array2OfPOnCurv

No detailed docstring for this function.") Array2;
		const Extrema_Array2OfPOnCurv & Array2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_Array2OfPOnCurv

No detailed docstring for this function.") ChangeArray2;
		Extrema_Array2OfPOnCurv & ChangeArray2 ();
};


%feature("shadow") Extrema_HArray2OfPOnCurv::~Extrema_HArray2OfPOnCurv %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_HArray2OfPOnCurv {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_HArray2OfPOnCurv {
	Handle_Extrema_HArray2OfPOnCurv GetHandle() {
	return *(Handle_Extrema_HArray2OfPOnCurv*) &$self;
	}
};

%nodefaultctor Handle_Extrema_HArray2OfPOnCurv;
class Handle_Extrema_HArray2OfPOnCurv : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Extrema_HArray2OfPOnCurv();
        Handle_Extrema_HArray2OfPOnCurv(const Handle_Extrema_HArray2OfPOnCurv &aHandle);
        Handle_Extrema_HArray2OfPOnCurv(const Extrema_HArray2OfPOnCurv *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_HArray2OfPOnCurv DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_HArray2OfPOnCurv {
    Extrema_HArray2OfPOnCurv* GetObject() {
    return (Extrema_HArray2OfPOnCurv*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_HArray2OfPOnCurv::~Handle_Extrema_HArray2OfPOnCurv %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_HArray2OfPOnCurv {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_HArray2OfPOnCurv2d;
class Extrema_HArray2OfPOnCurv2d : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Extrema_HArray2OfPOnCurv2d;
		 Extrema_HArray2OfPOnCurv2d (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)
	V(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") Extrema_HArray2OfPOnCurv2d;
		 Extrema_HArray2OfPOnCurv2d (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const Extrema_POnCurv2d & V);
		%feature("autodoc", "Args:
	V(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Extrema_POnCurv2d & V);
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
	Value(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Extrema_POnCurv2d & Value);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") Value;
		const Extrema_POnCurv2d & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") ChangeValue;
		Extrema_POnCurv2d & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_Array2OfPOnCurv2d

No detailed docstring for this function.") Array2;
		const Extrema_Array2OfPOnCurv2d & Array2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_Array2OfPOnCurv2d

No detailed docstring for this function.") ChangeArray2;
		Extrema_Array2OfPOnCurv2d & ChangeArray2 ();
};


%feature("shadow") Extrema_HArray2OfPOnCurv2d::~Extrema_HArray2OfPOnCurv2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_HArray2OfPOnCurv2d {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_HArray2OfPOnCurv2d {
	Handle_Extrema_HArray2OfPOnCurv2d GetHandle() {
	return *(Handle_Extrema_HArray2OfPOnCurv2d*) &$self;
	}
};

%nodefaultctor Handle_Extrema_HArray2OfPOnCurv2d;
class Handle_Extrema_HArray2OfPOnCurv2d : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Extrema_HArray2OfPOnCurv2d();
        Handle_Extrema_HArray2OfPOnCurv2d(const Handle_Extrema_HArray2OfPOnCurv2d &aHandle);
        Handle_Extrema_HArray2OfPOnCurv2d(const Extrema_HArray2OfPOnCurv2d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_HArray2OfPOnCurv2d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_HArray2OfPOnCurv2d {
    Extrema_HArray2OfPOnCurv2d* GetObject() {
    return (Extrema_HArray2OfPOnCurv2d*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_HArray2OfPOnCurv2d::~Handle_Extrema_HArray2OfPOnCurv2d %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_HArray2OfPOnCurv2d {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_HArray2OfPOnSurf;
class Extrema_HArray2OfPOnSurf : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Extrema_HArray2OfPOnSurf;
		 Extrema_HArray2OfPOnSurf (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)
	V(Extrema_POnSurf)

Returns:
	None

No detailed docstring for this function.") Extrema_HArray2OfPOnSurf;
		 Extrema_HArray2OfPOnSurf (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const Extrema_POnSurf & V);
		%feature("autodoc", "Args:
	V(Extrema_POnSurf)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Extrema_POnSurf & V);
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
	Value(Extrema_POnSurf)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Extrema_POnSurf & Value);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Extrema_POnSurf

No detailed docstring for this function.") Value;
		const Extrema_POnSurf & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Extrema_POnSurf

No detailed docstring for this function.") ChangeValue;
		Extrema_POnSurf & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_Array2OfPOnSurf

No detailed docstring for this function.") Array2;
		const Extrema_Array2OfPOnSurf & Array2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_Array2OfPOnSurf

No detailed docstring for this function.") ChangeArray2;
		Extrema_Array2OfPOnSurf & ChangeArray2 ();
};


%feature("shadow") Extrema_HArray2OfPOnSurf::~Extrema_HArray2OfPOnSurf %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_HArray2OfPOnSurf {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_HArray2OfPOnSurf {
	Handle_Extrema_HArray2OfPOnSurf GetHandle() {
	return *(Handle_Extrema_HArray2OfPOnSurf*) &$self;
	}
};

%nodefaultctor Handle_Extrema_HArray2OfPOnSurf;
class Handle_Extrema_HArray2OfPOnSurf : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Extrema_HArray2OfPOnSurf();
        Handle_Extrema_HArray2OfPOnSurf(const Handle_Extrema_HArray2OfPOnSurf &aHandle);
        Handle_Extrema_HArray2OfPOnSurf(const Extrema_HArray2OfPOnSurf *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_HArray2OfPOnSurf DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_HArray2OfPOnSurf {
    Extrema_HArray2OfPOnSurf* GetObject() {
    return (Extrema_HArray2OfPOnSurf*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_HArray2OfPOnSurf::~Handle_Extrema_HArray2OfPOnSurf %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_HArray2OfPOnSurf {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_HArray2OfPOnSurfParams;
class Extrema_HArray2OfPOnSurfParams : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Extrema_HArray2OfPOnSurfParams;
		 Extrema_HArray2OfPOnSurfParams (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)
	V(Extrema_POnSurfParams)

Returns:
	None

No detailed docstring for this function.") Extrema_HArray2OfPOnSurfParams;
		 Extrema_HArray2OfPOnSurfParams (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const Extrema_POnSurfParams & V);
		%feature("autodoc", "Args:
	V(Extrema_POnSurfParams)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Extrema_POnSurfParams & V);
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
	Value(Extrema_POnSurfParams)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Extrema_POnSurfParams & Value);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Extrema_POnSurfParams

No detailed docstring for this function.") Value;
		const Extrema_POnSurfParams & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Extrema_POnSurfParams

No detailed docstring for this function.") ChangeValue;
		Extrema_POnSurfParams & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_Array2OfPOnSurfParams

No detailed docstring for this function.") Array2;
		const Extrema_Array2OfPOnSurfParams & Array2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_Array2OfPOnSurfParams

No detailed docstring for this function.") ChangeArray2;
		Extrema_Array2OfPOnSurfParams & ChangeArray2 ();
};


%feature("shadow") Extrema_HArray2OfPOnSurfParams::~Extrema_HArray2OfPOnSurfParams %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_HArray2OfPOnSurfParams {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_HArray2OfPOnSurfParams {
	Handle_Extrema_HArray2OfPOnSurfParams GetHandle() {
	return *(Handle_Extrema_HArray2OfPOnSurfParams*) &$self;
	}
};

%nodefaultctor Handle_Extrema_HArray2OfPOnSurfParams;
class Handle_Extrema_HArray2OfPOnSurfParams : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Extrema_HArray2OfPOnSurfParams();
        Handle_Extrema_HArray2OfPOnSurfParams(const Handle_Extrema_HArray2OfPOnSurfParams &aHandle);
        Handle_Extrema_HArray2OfPOnSurfParams(const Extrema_HArray2OfPOnSurfParams *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_HArray2OfPOnSurfParams DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_HArray2OfPOnSurfParams {
    Extrema_HArray2OfPOnSurfParams* GetObject() {
    return (Extrema_HArray2OfPOnSurfParams*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_HArray2OfPOnSurfParams::~Handle_Extrema_HArray2OfPOnSurfParams %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_HArray2OfPOnSurfParams {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_LCCache2dOfLocateExtCC2d;
class Extrema_LCCache2dOfLocateExtCC2d : public Standard_Transient {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_LCCache2dOfLocateExtCC2d;
		 Extrema_LCCache2dOfLocateExtCC2d ();
		%feature("autodoc", "Args:
	theC(Adaptor2d_Curve2d)
	theUFirst(Standard_Real)
	theULast(Standard_Real)
	theNbSamples(Standard_Integer)
	theToCalculate(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Extrema_LCCache2dOfLocateExtCC2d;
		 Extrema_LCCache2dOfLocateExtCC2d (const Adaptor2d_Curve2d & theC,const Standard_Real theUFirst,const Standard_Real theULast,const Standard_Integer theNbSamples,const Standard_Boolean theToCalculate);
		%feature("autodoc", "Args:
	theC(Adaptor2d_Curve2d)
	theUFirst(Standard_Real)
	theULast(Standard_Real)
	IntervalsCN(TColStd_Array1OfReal)
	StartIndex(Standard_Integer)
	EndIndex(Standard_Integer)
	Coeff(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Extrema_LCCache2dOfLocateExtCC2d;
		 Extrema_LCCache2dOfLocateExtCC2d (const Adaptor2d_Curve2d & theC,const Standard_Real theUFirst,const Standard_Real theULast,const TColStd_Array1OfReal & IntervalsCN,const Standard_Integer StartIndex,const Standard_Integer EndIndex,const Standard_Real Coeff);
		%feature("autodoc", "Args:
	theC(Adaptor2d_Curve2d)
	theNbSamples(Standard_Integer)
	theToCalculate(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetCurve;
		void SetCurve (const Adaptor2d_Curve2d & theC,const Standard_Integer theNbSamples,const Standard_Boolean theToCalculate);
		%feature("autodoc", "Args:
	theC(Adaptor2d_Curve2d)
	theUFirst(Standard_Real)
	theULast(Standard_Real)
	theNbSamples(Standard_Integer)
	theToCalculate(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetCurve;
		void SetCurve (const Adaptor2d_Curve2d & theC,const Standard_Real theUFirst,const Standard_Real theULast,const Standard_Integer theNbSamples,const Standard_Boolean theToCalculate);
		%feature("autodoc", "Args:
	Uinf(Standard_Real)
	Usup(Standard_Real)
	theToCalculate(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetRange;
		void SetRange (const Standard_Real Uinf,const Standard_Real Usup,const Standard_Boolean theToCalculate);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") CalculatePoints;
		void CalculatePoints ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsValid;
		Standard_Boolean IsValid ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HArray1OfReal

No detailed docstring for this function.") Parameters;
		const Handle_TColStd_HArray1OfReal & Parameters ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColgp_HArray1OfPnt2d

No detailed docstring for this function.") Points;
		const Handle_TColgp_HArray1OfPnt2d & Points ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Address

No detailed docstring for this function.") CurvePtr;
		Standard_Address CurvePtr ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbSamples;
		Standard_Integer NbSamples ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") LastParameter;
		Standard_Real LastParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") TrimFirstParameter;
		Standard_Real TrimFirstParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") TrimLastParameter;
		Standard_Real TrimLastParameter ();
};


%feature("shadow") Extrema_LCCache2dOfLocateExtCC2d::~Extrema_LCCache2dOfLocateExtCC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_LCCache2dOfLocateExtCC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_LCCache2dOfLocateExtCC2d {
	Handle_Extrema_LCCache2dOfLocateExtCC2d GetHandle() {
	return *(Handle_Extrema_LCCache2dOfLocateExtCC2d*) &$self;
	}
};

%nodefaultctor Handle_Extrema_LCCache2dOfLocateExtCC2d;
class Handle_Extrema_LCCache2dOfLocateExtCC2d : public Handle_Standard_Transient {

    public:
        // constructors
        Handle_Extrema_LCCache2dOfLocateExtCC2d();
        Handle_Extrema_LCCache2dOfLocateExtCC2d(const Handle_Extrema_LCCache2dOfLocateExtCC2d &aHandle);
        Handle_Extrema_LCCache2dOfLocateExtCC2d(const Extrema_LCCache2dOfLocateExtCC2d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_LCCache2dOfLocateExtCC2d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_LCCache2dOfLocateExtCC2d {
    Extrema_LCCache2dOfLocateExtCC2d* GetObject() {
    return (Extrema_LCCache2dOfLocateExtCC2d*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_LCCache2dOfLocateExtCC2d::~Handle_Extrema_LCCache2dOfLocateExtCC2d %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_LCCache2dOfLocateExtCC2d {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_LCCacheOfLocateExtCC;
class Extrema_LCCacheOfLocateExtCC : public Standard_Transient {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_LCCacheOfLocateExtCC;
		 Extrema_LCCacheOfLocateExtCC ();
		%feature("autodoc", "Args:
	theC(Adaptor3d_Curve)
	theUFirst(Standard_Real)
	theULast(Standard_Real)
	theNbSamples(Standard_Integer)
	theToCalculate(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Extrema_LCCacheOfLocateExtCC;
		 Extrema_LCCacheOfLocateExtCC (const Adaptor3d_Curve & theC,const Standard_Real theUFirst,const Standard_Real theULast,const Standard_Integer theNbSamples,const Standard_Boolean theToCalculate);
		%feature("autodoc", "Args:
	theC(Adaptor3d_Curve)
	theUFirst(Standard_Real)
	theULast(Standard_Real)
	IntervalsCN(TColStd_Array1OfReal)
	StartIndex(Standard_Integer)
	EndIndex(Standard_Integer)
	Coeff(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Extrema_LCCacheOfLocateExtCC;
		 Extrema_LCCacheOfLocateExtCC (const Adaptor3d_Curve & theC,const Standard_Real theUFirst,const Standard_Real theULast,const TColStd_Array1OfReal & IntervalsCN,const Standard_Integer StartIndex,const Standard_Integer EndIndex,const Standard_Real Coeff);
		%feature("autodoc", "Args:
	theC(Adaptor3d_Curve)
	theNbSamples(Standard_Integer)
	theToCalculate(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetCurve;
		void SetCurve (const Adaptor3d_Curve & theC,const Standard_Integer theNbSamples,const Standard_Boolean theToCalculate);
		%feature("autodoc", "Args:
	theC(Adaptor3d_Curve)
	theUFirst(Standard_Real)
	theULast(Standard_Real)
	theNbSamples(Standard_Integer)
	theToCalculate(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetCurve;
		void SetCurve (const Adaptor3d_Curve & theC,const Standard_Real theUFirst,const Standard_Real theULast,const Standard_Integer theNbSamples,const Standard_Boolean theToCalculate);
		%feature("autodoc", "Args:
	Uinf(Standard_Real)
	Usup(Standard_Real)
	theToCalculate(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetRange;
		void SetRange (const Standard_Real Uinf,const Standard_Real Usup,const Standard_Boolean theToCalculate);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") CalculatePoints;
		void CalculatePoints ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsValid;
		Standard_Boolean IsValid ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HArray1OfReal

No detailed docstring for this function.") Parameters;
		const Handle_TColStd_HArray1OfReal & Parameters ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColgp_HArray1OfPnt

No detailed docstring for this function.") Points;
		const Handle_TColgp_HArray1OfPnt & Points ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Address

No detailed docstring for this function.") CurvePtr;
		Standard_Address CurvePtr ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbSamples;
		Standard_Integer NbSamples ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") LastParameter;
		Standard_Real LastParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") TrimFirstParameter;
		Standard_Real TrimFirstParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") TrimLastParameter;
		Standard_Real TrimLastParameter ();
};


%feature("shadow") Extrema_LCCacheOfLocateExtCC::~Extrema_LCCacheOfLocateExtCC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_LCCacheOfLocateExtCC {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_LCCacheOfLocateExtCC {
	Handle_Extrema_LCCacheOfLocateExtCC GetHandle() {
	return *(Handle_Extrema_LCCacheOfLocateExtCC*) &$self;
	}
};

%nodefaultctor Handle_Extrema_LCCacheOfLocateExtCC;
class Handle_Extrema_LCCacheOfLocateExtCC : public Handle_Standard_Transient {

    public:
        // constructors
        Handle_Extrema_LCCacheOfLocateExtCC();
        Handle_Extrema_LCCacheOfLocateExtCC(const Handle_Extrema_LCCacheOfLocateExtCC &aHandle);
        Handle_Extrema_LCCacheOfLocateExtCC(const Extrema_LCCacheOfLocateExtCC *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_LCCacheOfLocateExtCC DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_LCCacheOfLocateExtCC {
    Extrema_LCCacheOfLocateExtCC* GetObject() {
    return (Extrema_LCCacheOfLocateExtCC*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_LCCacheOfLocateExtCC::~Handle_Extrema_LCCacheOfLocateExtCC %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_LCCacheOfLocateExtCC {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_LocECC2dOfLocateExtCC2d;
class Extrema_LocECC2dOfLocateExtCC2d {
	public:
		%feature("autodoc", "Args:
	C1(Adaptor2d_Curve2d)
	C2(Adaptor2d_Curve2d)
	U0(Standard_Real)
	V0(Standard_Real)
	TolU(Standard_Real)
	TolV(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Extrema_LocECC2dOfLocateExtCC2d;
		 Extrema_LocECC2dOfLocateExtCC2d (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2,const Standard_Real U0,const Standard_Real V0,const Standard_Real TolU,const Standard_Real TolV);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") SquareDistance;
		Standard_Real SquareDistance ();
		%feature("autodoc", "Args:
	P1(Extrema_POnCurv2d)
	P2(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") Point;
		void Point (Extrema_POnCurv2d & P1,Extrema_POnCurv2d & P2);
};


%feature("shadow") Extrema_LocECC2dOfLocateExtCC2d::~Extrema_LocECC2dOfLocateExtCC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_LocECC2dOfLocateExtCC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_LocECCOfLocateExtCC;
class Extrema_LocECCOfLocateExtCC {
	public:
		%feature("autodoc", "Args:
	C1(Adaptor3d_Curve)
	C2(Adaptor3d_Curve)
	U0(Standard_Real)
	V0(Standard_Real)
	TolU(Standard_Real)
	TolV(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Extrema_LocECCOfLocateExtCC;
		 Extrema_LocECCOfLocateExtCC (const Adaptor3d_Curve & C1,const Adaptor3d_Curve & C2,const Standard_Real U0,const Standard_Real V0,const Standard_Real TolU,const Standard_Real TolV);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") SquareDistance;
		Standard_Real SquareDistance ();
		%feature("autodoc", "Args:
	P1(Extrema_POnCurv)
	P2(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") Point;
		void Point (Extrema_POnCurv & P1,Extrema_POnCurv & P2);
};


%feature("shadow") Extrema_LocECCOfLocateExtCC::~Extrema_LocECCOfLocateExtCC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_LocECCOfLocateExtCC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_LocEPCOfLocateExtPC;
class Extrema_LocEPCOfLocateExtPC {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_LocEPCOfLocateExtPC;
		 Extrema_LocEPCOfLocateExtPC ();
		%feature("autodoc", "Args:
	P(gp_Pnt)
	C(Adaptor3d_Curve)
	U0(Standard_Real)
	TolU(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Extrema_LocEPCOfLocateExtPC;
		 Extrema_LocEPCOfLocateExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C,const Standard_Real U0,const Standard_Real TolU);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	C(Adaptor3d_Curve)
	U0(Standard_Real)
	Umin(Standard_Real)
	Usup(Standard_Real)
	TolU(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Extrema_LocEPCOfLocateExtPC;
		 Extrema_LocEPCOfLocateExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C,const Standard_Real U0,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	Umin(Standard_Real)
	Usup(Standard_Real)
	TolU(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Adaptor3d_Curve & C,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	U0(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Pnt & P,const Standard_Real U0);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") SquareDistance;
		Standard_Real SquareDistance ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsMin;
		Standard_Boolean IsMin ();
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv

No detailed docstring for this function.") Point;
		const Extrema_POnCurv & Point ();
};


%feature("shadow") Extrema_LocEPCOfLocateExtPC::~Extrema_LocEPCOfLocateExtPC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_LocEPCOfLocateExtPC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_LocEPCOfLocateExtPC2d;
class Extrema_LocEPCOfLocateExtPC2d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_LocEPCOfLocateExtPC2d;
		 Extrema_LocEPCOfLocateExtPC2d ();
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	C(Adaptor2d_Curve2d)
	U0(Standard_Real)
	TolU(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Extrema_LocEPCOfLocateExtPC2d;
		 Extrema_LocEPCOfLocateExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Real U0,const Standard_Real TolU);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	C(Adaptor2d_Curve2d)
	U0(Standard_Real)
	Umin(Standard_Real)
	Usup(Standard_Real)
	TolU(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Extrema_LocEPCOfLocateExtPC2d;
		 Extrema_LocEPCOfLocateExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Real U0,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	Umin(Standard_Real)
	Usup(Standard_Real)
	TolU(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	U0(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Pnt2d & P,const Standard_Real U0);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") SquareDistance;
		Standard_Real SquareDistance ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsMin;
		Standard_Boolean IsMin ();
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") Point;
		const Extrema_POnCurv2d & Point ();
};


%feature("shadow") Extrema_LocEPCOfLocateExtPC2d::~Extrema_LocEPCOfLocateExtPC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_LocEPCOfLocateExtPC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_LocateExtCC;
class Extrema_LocateExtCC {
	public:
		%feature("autodoc", "Args:
	C1(Adaptor3d_Curve)
	C2(Adaptor3d_Curve)
	U0(Standard_Real)
	V0(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Extrema_LocateExtCC;
		 Extrema_LocateExtCC (const Adaptor3d_Curve & C1,const Adaptor3d_Curve & C2,const Standard_Real U0,const Standard_Real V0);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") SquareDistance;
		Standard_Real SquareDistance ();
		%feature("autodoc", "Args:
	P1(Extrema_POnCurv)
	P2(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") Point;
		void Point (Extrema_POnCurv & P1,Extrema_POnCurv & P2);
};


%feature("shadow") Extrema_LocateExtCC::~Extrema_LocateExtCC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_LocateExtCC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_LocateExtCC2d;
class Extrema_LocateExtCC2d {
	public:
		%feature("autodoc", "Args:
	C1(Adaptor2d_Curve2d)
	C2(Adaptor2d_Curve2d)
	U0(Standard_Real)
	V0(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Extrema_LocateExtCC2d;
		 Extrema_LocateExtCC2d (const Adaptor2d_Curve2d & C1,const Adaptor2d_Curve2d & C2,const Standard_Real U0,const Standard_Real V0);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") SquareDistance;
		Standard_Real SquareDistance ();
		%feature("autodoc", "Args:
	P1(Extrema_POnCurv2d)
	P2(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") Point;
		void Point (Extrema_POnCurv2d & P1,Extrema_POnCurv2d & P2);
};


%feature("shadow") Extrema_LocateExtCC2d::~Extrema_LocateExtCC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_LocateExtCC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_LocateExtPC;
class Extrema_LocateExtPC {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_LocateExtPC;
		 Extrema_LocateExtPC ();
		%feature("autodoc", "Args:
	P(gp_Pnt)
	C(Adaptor3d_Curve)
	U0(Standard_Real)
	TolF(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Extrema_LocateExtPC;
		 Extrema_LocateExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C,const Standard_Real U0,const Standard_Real TolF);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	C(Adaptor3d_Curve)
	U0(Standard_Real)
	Umin(Standard_Real)
	Usup(Standard_Real)
	TolF(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Extrema_LocateExtPC;
		 Extrema_LocateExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C,const Standard_Real U0,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolF);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	Umin(Standard_Real)
	Usup(Standard_Real)
	TolF(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Adaptor3d_Curve & C,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolF);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	U0(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Pnt & P,const Standard_Real U0);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") SquareDistance;
		Standard_Real SquareDistance ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsMin;
		Standard_Boolean IsMin ();
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv

No detailed docstring for this function.") Point;
		const Extrema_POnCurv & Point ();
};


%feature("shadow") Extrema_LocateExtPC::~Extrema_LocateExtPC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_LocateExtPC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_LocateExtPC2d;
class Extrema_LocateExtPC2d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_LocateExtPC2d;
		 Extrema_LocateExtPC2d ();
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	C(Adaptor2d_Curve2d)
	U0(Standard_Real)
	TolF(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Extrema_LocateExtPC2d;
		 Extrema_LocateExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Real U0,const Standard_Real TolF);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	C(Adaptor2d_Curve2d)
	U0(Standard_Real)
	Umin(Standard_Real)
	Usup(Standard_Real)
	TolF(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Extrema_LocateExtPC2d;
		 Extrema_LocateExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C,const Standard_Real U0,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolF);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	Umin(Standard_Real)
	Usup(Standard_Real)
	TolF(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolF);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	U0(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Pnt2d & P,const Standard_Real U0);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") SquareDistance;
		Standard_Real SquareDistance ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsMin;
		Standard_Boolean IsMin ();
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") Point;
		const Extrema_POnCurv2d & Point ();
};


%feature("shadow") Extrema_LocateExtPC2d::~Extrema_LocateExtPC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_LocateExtPC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_PCFOfEPCOfELPCOfLocateExtPC;
class Extrema_PCFOfEPCOfELPCOfLocateExtPC : public math_FunctionWithDerivative {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_PCFOfEPCOfELPCOfLocateExtPC;
		 Extrema_PCFOfEPCOfELPCOfLocateExtPC ();
		%feature("autodoc", "Args:
	P(gp_Pnt)
	C(Adaptor3d_Curve)

Returns:
	None

No detailed docstring for this function.") Extrema_PCFOfEPCOfELPCOfLocateExtPC;
		 Extrema_PCFOfEPCOfELPCOfLocateExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Adaptor3d_Curve & C);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") SetPoint;
		void SetPoint (const gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	F(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Value;
		Standard_Boolean Value (const Standard_Real U,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	DF(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Derivative;
		Standard_Boolean Derivative (const Standard_Real U,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	F(Standard_Real)
	DF(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Values;
		Standard_Boolean Values (const Standard_Real U,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

No detailed docstring for this function.") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Extrema_POnCurv

No detailed docstring for this function.") Point;
		const Extrema_POnCurv & Point (const Standard_Integer N);
		%feature("autodoc", "Args:
	theUfirst(Standard_Real)
	theUlast(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SubIntervalInitialize;
		void SubIntervalInitialize (const Standard_Real theUfirst,const Standard_Real theUlast);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") SearchOfTolerance;
		Standard_Real SearchOfTolerance ();
};


%feature("shadow") Extrema_PCFOfEPCOfELPCOfLocateExtPC::~Extrema_PCFOfEPCOfELPCOfLocateExtPC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_PCFOfEPCOfELPCOfLocateExtPC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_PCFOfEPCOfELPCOfLocateExtPC2d;
class Extrema_PCFOfEPCOfELPCOfLocateExtPC2d : public math_FunctionWithDerivative {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_PCFOfEPCOfELPCOfLocateExtPC2d;
		 Extrema_PCFOfEPCOfELPCOfLocateExtPC2d ();
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	C(Adaptor2d_Curve2d)

Returns:
	None

No detailed docstring for this function.") Extrema_PCFOfEPCOfELPCOfLocateExtPC2d;
		 Extrema_PCFOfEPCOfELPCOfLocateExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") SetPoint;
		void SetPoint (const gp_Pnt2d & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	F(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Value;
		Standard_Boolean Value (const Standard_Real U,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	DF(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Derivative;
		Standard_Boolean Derivative (const Standard_Real U,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	F(Standard_Real)
	DF(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Values;
		Standard_Boolean Values (const Standard_Real U,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

No detailed docstring for this function.") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") Point;
		const Extrema_POnCurv2d & Point (const Standard_Integer N);
		%feature("autodoc", "Args:
	theUfirst(Standard_Real)
	theUlast(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SubIntervalInitialize;
		void SubIntervalInitialize (const Standard_Real theUfirst,const Standard_Real theUlast);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") SearchOfTolerance;
		Standard_Real SearchOfTolerance ();
};


%feature("shadow") Extrema_PCFOfEPCOfELPCOfLocateExtPC2d::~Extrema_PCFOfEPCOfELPCOfLocateExtPC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_PCFOfEPCOfELPCOfLocateExtPC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_PCFOfEPCOfExtPC;
class Extrema_PCFOfEPCOfExtPC : public math_FunctionWithDerivative {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_PCFOfEPCOfExtPC;
		 Extrema_PCFOfEPCOfExtPC ();
		%feature("autodoc", "Args:
	P(gp_Pnt)
	C(Adaptor3d_Curve)

Returns:
	None

No detailed docstring for this function.") Extrema_PCFOfEPCOfExtPC;
		 Extrema_PCFOfEPCOfExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Adaptor3d_Curve & C);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") SetPoint;
		void SetPoint (const gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	F(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Value;
		Standard_Boolean Value (const Standard_Real U,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	DF(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Derivative;
		Standard_Boolean Derivative (const Standard_Real U,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	F(Standard_Real)
	DF(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Values;
		Standard_Boolean Values (const Standard_Real U,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

No detailed docstring for this function.") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Extrema_POnCurv

No detailed docstring for this function.") Point;
		const Extrema_POnCurv & Point (const Standard_Integer N);
		%feature("autodoc", "Args:
	theUfirst(Standard_Real)
	theUlast(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SubIntervalInitialize;
		void SubIntervalInitialize (const Standard_Real theUfirst,const Standard_Real theUlast);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") SearchOfTolerance;
		Standard_Real SearchOfTolerance ();
};


%feature("shadow") Extrema_PCFOfEPCOfExtPC::~Extrema_PCFOfEPCOfExtPC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_PCFOfEPCOfExtPC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_PCFOfEPCOfExtPC2d;
class Extrema_PCFOfEPCOfExtPC2d : public math_FunctionWithDerivative {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_PCFOfEPCOfExtPC2d;
		 Extrema_PCFOfEPCOfExtPC2d ();
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	C(Adaptor2d_Curve2d)

Returns:
	None

No detailed docstring for this function.") Extrema_PCFOfEPCOfExtPC2d;
		 Extrema_PCFOfEPCOfExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") SetPoint;
		void SetPoint (const gp_Pnt2d & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	F(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Value;
		Standard_Boolean Value (const Standard_Real U,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	DF(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Derivative;
		Standard_Boolean Derivative (const Standard_Real U,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	F(Standard_Real)
	DF(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Values;
		Standard_Boolean Values (const Standard_Real U,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

No detailed docstring for this function.") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") Point;
		const Extrema_POnCurv2d & Point (const Standard_Integer N);
		%feature("autodoc", "Args:
	theUfirst(Standard_Real)
	theUlast(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SubIntervalInitialize;
		void SubIntervalInitialize (const Standard_Real theUfirst,const Standard_Real theUlast);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") SearchOfTolerance;
		Standard_Real SearchOfTolerance ();
};


%feature("shadow") Extrema_PCFOfEPCOfExtPC2d::~Extrema_PCFOfEPCOfExtPC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_PCFOfEPCOfExtPC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_PCLocFOfLocEPCOfLocateExtPC;
class Extrema_PCLocFOfLocEPCOfLocateExtPC : public math_FunctionWithDerivative {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_PCLocFOfLocEPCOfLocateExtPC;
		 Extrema_PCLocFOfLocEPCOfLocateExtPC ();
		%feature("autodoc", "Args:
	P(gp_Pnt)
	C(Adaptor3d_Curve)

Returns:
	None

No detailed docstring for this function.") Extrema_PCLocFOfLocEPCOfLocateExtPC;
		 Extrema_PCLocFOfLocEPCOfLocateExtPC (const gp_Pnt & P,const Adaptor3d_Curve & C);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Adaptor3d_Curve & C);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") SetPoint;
		void SetPoint (const gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	F(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Value;
		Standard_Boolean Value (const Standard_Real U,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	DF(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Derivative;
		Standard_Boolean Derivative (const Standard_Real U,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	F(Standard_Real)
	DF(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Values;
		Standard_Boolean Values (const Standard_Real U,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

No detailed docstring for this function.") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Extrema_POnCurv

No detailed docstring for this function.") Point;
		const Extrema_POnCurv & Point (const Standard_Integer N);
		%feature("autodoc", "Args:
	theUfirst(Standard_Real)
	theUlast(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SubIntervalInitialize;
		void SubIntervalInitialize (const Standard_Real theUfirst,const Standard_Real theUlast);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") SearchOfTolerance;
		Standard_Real SearchOfTolerance ();
};


%feature("shadow") Extrema_PCLocFOfLocEPCOfLocateExtPC::~Extrema_PCLocFOfLocEPCOfLocateExtPC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_PCLocFOfLocEPCOfLocateExtPC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_PCLocFOfLocEPCOfLocateExtPC2d;
class Extrema_PCLocFOfLocEPCOfLocateExtPC2d : public math_FunctionWithDerivative {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_PCLocFOfLocEPCOfLocateExtPC2d;
		 Extrema_PCLocFOfLocEPCOfLocateExtPC2d ();
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	C(Adaptor2d_Curve2d)

Returns:
	None

No detailed docstring for this function.") Extrema_PCLocFOfLocEPCOfLocateExtPC2d;
		 Extrema_PCLocFOfLocEPCOfLocateExtPC2d (const gp_Pnt2d & P,const Adaptor2d_Curve2d & C);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") SetPoint;
		void SetPoint (const gp_Pnt2d & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	F(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Value;
		Standard_Boolean Value (const Standard_Real U,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	DF(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Derivative;
		Standard_Boolean Derivative (const Standard_Real U,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	F(Standard_Real)
	DF(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Values;
		Standard_Boolean Values (const Standard_Real U,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

No detailed docstring for this function.") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") Point;
		const Extrema_POnCurv2d & Point (const Standard_Integer N);
		%feature("autodoc", "Args:
	theUfirst(Standard_Real)
	theUlast(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SubIntervalInitialize;
		void SubIntervalInitialize (const Standard_Real theUfirst,const Standard_Real theUlast);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") SearchOfTolerance;
		Standard_Real SearchOfTolerance ();
};


%feature("shadow") Extrema_PCLocFOfLocEPCOfLocateExtPC2d::~Extrema_PCLocFOfLocEPCOfLocateExtPC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_PCLocFOfLocEPCOfLocateExtPC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_POnCurv;
class Extrema_POnCurv {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_POnCurv;
		 Extrema_POnCurv ();
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Extrema_POnCurv;
		 Extrema_POnCurv (const Standard_Real U,const gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") SetValues;
		void SetValues (const Standard_Real U,const gp_Pnt & P);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

No detailed docstring for this function.") Value;
		const gp_Pnt & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Parameter;
		Standard_Real Parameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") _CSFDB_GetExtrema_POnCurvmyU;
		Standard_Real _CSFDB_GetExtrema_POnCurvmyU ();
		%feature("autodoc", "Args:
	p(Standard_Real)

Returns:
	None

No detailed docstring for this function.") _CSFDB_SetExtrema_POnCurvmyU;
		void _CSFDB_SetExtrema_POnCurvmyU (const Standard_Real p);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

No detailed docstring for this function.") _CSFDB_GetExtrema_POnCurvmyP;
		const gp_Pnt & _CSFDB_GetExtrema_POnCurvmyP ();
};


%feature("shadow") Extrema_POnCurv::~Extrema_POnCurv %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_POnCurv {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_POnCurv2d;
class Extrema_POnCurv2d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_POnCurv2d;
		 Extrema_POnCurv2d ();
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") Extrema_POnCurv2d;
		 Extrema_POnCurv2d (const Standard_Real U,const gp_Pnt2d & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") SetValues;
		void SetValues (const Standard_Real U,const gp_Pnt2d & P);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

No detailed docstring for this function.") Value;
		const gp_Pnt2d & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Parameter;
		Standard_Real Parameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") _CSFDB_GetExtrema_POnCurv2dmyU;
		Standard_Real _CSFDB_GetExtrema_POnCurv2dmyU ();
		%feature("autodoc", "Args:
	p(Standard_Real)

Returns:
	None

No detailed docstring for this function.") _CSFDB_SetExtrema_POnCurv2dmyU;
		void _CSFDB_SetExtrema_POnCurv2dmyU (const Standard_Real p);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

No detailed docstring for this function.") _CSFDB_GetExtrema_POnCurv2dmyP;
		const gp_Pnt2d & _CSFDB_GetExtrema_POnCurv2dmyP ();
};


%feature("shadow") Extrema_POnCurv2d::~Extrema_POnCurv2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_POnCurv2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_POnSurf;
class Extrema_POnSurf {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creation of an indefinite point on surface.") Extrema_POnSurf;
		 Extrema_POnSurf ();
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)

Returns:
	None

Creation of a point on surface with parameter  
         values on the surface and a Pnt from gp.") Extrema_POnSurf;
		 Extrema_POnSurf (const Standard_Real U,const Standard_Real V,const gp_Pnt & P);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the 3d point.") Value;
		const gp_Pnt & Value ();
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)

Returns:
	None

Returns the parameter values on the surface.") Parameter;
		void Parameter (Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") Extrema_POnSurf::~Extrema_POnSurf %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_POnSurf {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC;
class Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC;
		 Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC)

Returns:
	Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC

No detailed docstring for this function.") Assign;
		const Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC & Assign (const Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC & Other);
		%feature("autodoc", "Args:
	Other(Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC)

Returns:
	Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC

No detailed docstring for this function.") operator=;
		const Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC & operator = (const Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC & Other);
		%feature("autodoc", "Args:
	T(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Extrema_POnCurv & T);
		%feature("autodoc", "Args:
	S(Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC & S);
		%feature("autodoc", "Args:
	T(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Extrema_POnCurv & T);
		%feature("autodoc", "Args:
	S(Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Extrema_POnCurv & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Extrema_POnCurv & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC & S);
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv

No detailed docstring for this function.") First;
		const Extrema_POnCurv & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv

No detailed docstring for this function.") Last;
		const Extrema_POnCurv & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Extrema_POnCurv

No detailed docstring for this function.") Value;
		const Extrema_POnCurv & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Extrema_POnCurv

No detailed docstring for this function.") ChangeValue;
		Extrema_POnCurv & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC::~Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d;
class Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d;
		 Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d)

Returns:
	Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d

No detailed docstring for this function.") Assign;
		const Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d & Assign (const Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d & Other);
		%feature("autodoc", "Args:
	Other(Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d)

Returns:
	Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d

No detailed docstring for this function.") operator=;
		const Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d & operator = (const Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d & Other);
		%feature("autodoc", "Args:
	T(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Extrema_POnCurv2d & T);
		%feature("autodoc", "Args:
	S(Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d & S);
		%feature("autodoc", "Args:
	T(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Extrema_POnCurv2d & T);
		%feature("autodoc", "Args:
	S(Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Extrema_POnCurv2d & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Extrema_POnCurv2d & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d & S);
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") First;
		const Extrema_POnCurv2d & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") Last;
		const Extrema_POnCurv2d & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") Value;
		const Extrema_POnCurv2d & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv2d & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") ChangeValue;
		Extrema_POnCurv2d & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d::~Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_SeqPCOfPCFOfEPCOfExtPC;
class Extrema_SeqPCOfPCFOfEPCOfExtPC : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_SeqPCOfPCFOfEPCOfExtPC;
		 Extrema_SeqPCOfPCFOfEPCOfExtPC ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Extrema_SeqPCOfPCFOfEPCOfExtPC)

Returns:
	Extrema_SeqPCOfPCFOfEPCOfExtPC

No detailed docstring for this function.") Assign;
		const Extrema_SeqPCOfPCFOfEPCOfExtPC & Assign (const Extrema_SeqPCOfPCFOfEPCOfExtPC & Other);
		%feature("autodoc", "Args:
	Other(Extrema_SeqPCOfPCFOfEPCOfExtPC)

Returns:
	Extrema_SeqPCOfPCFOfEPCOfExtPC

No detailed docstring for this function.") operator=;
		const Extrema_SeqPCOfPCFOfEPCOfExtPC & operator = (const Extrema_SeqPCOfPCFOfEPCOfExtPC & Other);
		%feature("autodoc", "Args:
	T(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Extrema_POnCurv & T);
		%feature("autodoc", "Args:
	S(Extrema_SeqPCOfPCFOfEPCOfExtPC)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Extrema_SeqPCOfPCFOfEPCOfExtPC & S);
		%feature("autodoc", "Args:
	T(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Extrema_POnCurv & T);
		%feature("autodoc", "Args:
	S(Extrema_SeqPCOfPCFOfEPCOfExtPC)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Extrema_SeqPCOfPCFOfEPCOfExtPC & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Extrema_POnCurv & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Extrema_SeqPCOfPCFOfEPCOfExtPC)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Extrema_SeqPCOfPCFOfEPCOfExtPC & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Extrema_POnCurv & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Extrema_SeqPCOfPCFOfEPCOfExtPC)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Extrema_SeqPCOfPCFOfEPCOfExtPC & S);
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv

No detailed docstring for this function.") First;
		const Extrema_POnCurv & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv

No detailed docstring for this function.") Last;
		const Extrema_POnCurv & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Extrema_SeqPCOfPCFOfEPCOfExtPC)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Extrema_SeqPCOfPCFOfEPCOfExtPC & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Extrema_POnCurv

No detailed docstring for this function.") Value;
		const Extrema_POnCurv & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Extrema_POnCurv

No detailed docstring for this function.") ChangeValue;
		Extrema_POnCurv & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") Extrema_SeqPCOfPCFOfEPCOfExtPC::~Extrema_SeqPCOfPCFOfEPCOfExtPC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SeqPCOfPCFOfEPCOfExtPC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_SeqPCOfPCFOfEPCOfExtPC2d;
class Extrema_SeqPCOfPCFOfEPCOfExtPC2d : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_SeqPCOfPCFOfEPCOfExtPC2d;
		 Extrema_SeqPCOfPCFOfEPCOfExtPC2d ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Extrema_SeqPCOfPCFOfEPCOfExtPC2d)

Returns:
	Extrema_SeqPCOfPCFOfEPCOfExtPC2d

No detailed docstring for this function.") Assign;
		const Extrema_SeqPCOfPCFOfEPCOfExtPC2d & Assign (const Extrema_SeqPCOfPCFOfEPCOfExtPC2d & Other);
		%feature("autodoc", "Args:
	Other(Extrema_SeqPCOfPCFOfEPCOfExtPC2d)

Returns:
	Extrema_SeqPCOfPCFOfEPCOfExtPC2d

No detailed docstring for this function.") operator=;
		const Extrema_SeqPCOfPCFOfEPCOfExtPC2d & operator = (const Extrema_SeqPCOfPCFOfEPCOfExtPC2d & Other);
		%feature("autodoc", "Args:
	T(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Extrema_POnCurv2d & T);
		%feature("autodoc", "Args:
	S(Extrema_SeqPCOfPCFOfEPCOfExtPC2d)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Extrema_SeqPCOfPCFOfEPCOfExtPC2d & S);
		%feature("autodoc", "Args:
	T(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Extrema_POnCurv2d & T);
		%feature("autodoc", "Args:
	S(Extrema_SeqPCOfPCFOfEPCOfExtPC2d)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Extrema_SeqPCOfPCFOfEPCOfExtPC2d & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Extrema_POnCurv2d & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Extrema_SeqPCOfPCFOfEPCOfExtPC2d)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Extrema_SeqPCOfPCFOfEPCOfExtPC2d & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Extrema_POnCurv2d & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Extrema_SeqPCOfPCFOfEPCOfExtPC2d)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Extrema_SeqPCOfPCFOfEPCOfExtPC2d & S);
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") First;
		const Extrema_POnCurv2d & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") Last;
		const Extrema_POnCurv2d & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Extrema_SeqPCOfPCFOfEPCOfExtPC2d)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Extrema_SeqPCOfPCFOfEPCOfExtPC2d & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") Value;
		const Extrema_POnCurv2d & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv2d & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") ChangeValue;
		Extrema_POnCurv2d & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") Extrema_SeqPCOfPCFOfEPCOfExtPC2d::~Extrema_SeqPCOfPCFOfEPCOfExtPC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SeqPCOfPCFOfEPCOfExtPC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC;
class Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC;
		 Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC)

Returns:
	Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC

No detailed docstring for this function.") Assign;
		const Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC & Assign (const Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC & Other);
		%feature("autodoc", "Args:
	Other(Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC)

Returns:
	Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC

No detailed docstring for this function.") operator=;
		const Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC & operator = (const Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC & Other);
		%feature("autodoc", "Args:
	T(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Extrema_POnCurv & T);
		%feature("autodoc", "Args:
	S(Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC & S);
		%feature("autodoc", "Args:
	T(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Extrema_POnCurv & T);
		%feature("autodoc", "Args:
	S(Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Extrema_POnCurv & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Extrema_POnCurv & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC & S);
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv

No detailed docstring for this function.") First;
		const Extrema_POnCurv & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv

No detailed docstring for this function.") Last;
		const Extrema_POnCurv & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Extrema_POnCurv

No detailed docstring for this function.") Value;
		const Extrema_POnCurv & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Extrema_POnCurv

No detailed docstring for this function.") ChangeValue;
		Extrema_POnCurv & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC::~Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d;
class Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d;
		 Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d)

Returns:
	Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d

No detailed docstring for this function.") Assign;
		const Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d & Assign (const Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d & Other);
		%feature("autodoc", "Args:
	Other(Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d)

Returns:
	Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d

No detailed docstring for this function.") operator=;
		const Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d & operator = (const Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d & Other);
		%feature("autodoc", "Args:
	T(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Extrema_POnCurv2d & T);
		%feature("autodoc", "Args:
	S(Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d & S);
		%feature("autodoc", "Args:
	T(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Extrema_POnCurv2d & T);
		%feature("autodoc", "Args:
	S(Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Extrema_POnCurv2d & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Extrema_POnCurv2d & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d & S);
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") First;
		const Extrema_POnCurv2d & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") Last;
		const Extrema_POnCurv2d & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") Value;
		const Extrema_POnCurv2d & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv2d & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") ChangeValue;
		Extrema_POnCurv2d & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d::~Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SeqPCOfPCLocFOfLocEPCOfLocateExtPC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d;
class Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d;
		 Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d)

Returns:
	Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d

No detailed docstring for this function.") Assign;
		const Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d & Assign (const Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d & Other);
		%feature("autodoc", "Args:
	Other(Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d)

Returns:
	Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d

No detailed docstring for this function.") operator=;
		const Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d & operator = (const Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d & Other);
		%feature("autodoc", "Args:
	T(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Extrema_POnCurv2d & T);
		%feature("autodoc", "Args:
	S(Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d & S);
		%feature("autodoc", "Args:
	T(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Extrema_POnCurv2d & T);
		%feature("autodoc", "Args:
	S(Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Extrema_POnCurv2d & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Extrema_POnCurv2d & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d & S);
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") First;
		const Extrema_POnCurv2d & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") Last;
		const Extrema_POnCurv2d & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") Value;
		const Extrema_POnCurv2d & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv2d & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") ChangeValue;
		Extrema_POnCurv2d & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d::~Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SeqPOnCOfCCFOfECC2dOfExtCC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_SeqPOnCOfCCFOfECCOfExtCC;
class Extrema_SeqPOnCOfCCFOfECCOfExtCC : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_SeqPOnCOfCCFOfECCOfExtCC;
		 Extrema_SeqPOnCOfCCFOfECCOfExtCC ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Extrema_SeqPOnCOfCCFOfECCOfExtCC)

Returns:
	Extrema_SeqPOnCOfCCFOfECCOfExtCC

No detailed docstring for this function.") Assign;
		const Extrema_SeqPOnCOfCCFOfECCOfExtCC & Assign (const Extrema_SeqPOnCOfCCFOfECCOfExtCC & Other);
		%feature("autodoc", "Args:
	Other(Extrema_SeqPOnCOfCCFOfECCOfExtCC)

Returns:
	Extrema_SeqPOnCOfCCFOfECCOfExtCC

No detailed docstring for this function.") operator=;
		const Extrema_SeqPOnCOfCCFOfECCOfExtCC & operator = (const Extrema_SeqPOnCOfCCFOfECCOfExtCC & Other);
		%feature("autodoc", "Args:
	T(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Extrema_POnCurv & T);
		%feature("autodoc", "Args:
	S(Extrema_SeqPOnCOfCCFOfECCOfExtCC)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Extrema_SeqPOnCOfCCFOfECCOfExtCC & S);
		%feature("autodoc", "Args:
	T(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Extrema_POnCurv & T);
		%feature("autodoc", "Args:
	S(Extrema_SeqPOnCOfCCFOfECCOfExtCC)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Extrema_SeqPOnCOfCCFOfECCOfExtCC & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Extrema_POnCurv & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Extrema_SeqPOnCOfCCFOfECCOfExtCC)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Extrema_SeqPOnCOfCCFOfECCOfExtCC & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Extrema_POnCurv & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Extrema_SeqPOnCOfCCFOfECCOfExtCC)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Extrema_SeqPOnCOfCCFOfECCOfExtCC & S);
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv

No detailed docstring for this function.") First;
		const Extrema_POnCurv & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv

No detailed docstring for this function.") Last;
		const Extrema_POnCurv & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Extrema_SeqPOnCOfCCFOfECCOfExtCC)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Extrema_SeqPOnCOfCCFOfECCOfExtCC & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Extrema_POnCurv

No detailed docstring for this function.") Value;
		const Extrema_POnCurv & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Extrema_POnCurv

No detailed docstring for this function.") ChangeValue;
		Extrema_POnCurv & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") Extrema_SeqPOnCOfCCFOfECCOfExtCC::~Extrema_SeqPOnCOfCCFOfECCOfExtCC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SeqPOnCOfCCFOfECCOfExtCC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d;
class Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d;
		 Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d)

Returns:
	Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d

No detailed docstring for this function.") Assign;
		const Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d & Assign (const Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d & Other);
		%feature("autodoc", "Args:
	Other(Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d)

Returns:
	Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d

No detailed docstring for this function.") operator=;
		const Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d & operator = (const Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d & Other);
		%feature("autodoc", "Args:
	T(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Extrema_POnCurv2d & T);
		%feature("autodoc", "Args:
	S(Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d & S);
		%feature("autodoc", "Args:
	T(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Extrema_POnCurv2d & T);
		%feature("autodoc", "Args:
	S(Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Extrema_POnCurv2d & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Extrema_POnCurv2d & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d & S);
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") First;
		const Extrema_POnCurv2d & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") Last;
		const Extrema_POnCurv2d & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") Value;
		const Extrema_POnCurv2d & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv2d & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") ChangeValue;
		Extrema_POnCurv2d & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d::~Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SeqPOnCOfCCFOfELCC2dOfLocateExtCC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC;
class Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC;
		 Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC)

Returns:
	Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC

No detailed docstring for this function.") Assign;
		const Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC & Assign (const Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC & Other);
		%feature("autodoc", "Args:
	Other(Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC)

Returns:
	Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC

No detailed docstring for this function.") operator=;
		const Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC & operator = (const Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC & Other);
		%feature("autodoc", "Args:
	T(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Extrema_POnCurv & T);
		%feature("autodoc", "Args:
	S(Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC & S);
		%feature("autodoc", "Args:
	T(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Extrema_POnCurv & T);
		%feature("autodoc", "Args:
	S(Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Extrema_POnCurv & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Extrema_POnCurv & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC & S);
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv

No detailed docstring for this function.") First;
		const Extrema_POnCurv & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv

No detailed docstring for this function.") Last;
		const Extrema_POnCurv & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Extrema_POnCurv

No detailed docstring for this function.") Value;
		const Extrema_POnCurv & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Extrema_POnCurv

No detailed docstring for this function.") ChangeValue;
		Extrema_POnCurv & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC::~Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SeqPOnCOfCCFOfELCCOfLocateExtCC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d;
class Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d;
		 Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d)

Returns:
	Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d

No detailed docstring for this function.") Assign;
		const Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d & Assign (const Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d & Other);
		%feature("autodoc", "Args:
	Other(Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d)

Returns:
	Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d

No detailed docstring for this function.") operator=;
		const Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d & operator = (const Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d & Other);
		%feature("autodoc", "Args:
	T(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Extrema_POnCurv2d & T);
		%feature("autodoc", "Args:
	S(Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d & S);
		%feature("autodoc", "Args:
	T(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Extrema_POnCurv2d & T);
		%feature("autodoc", "Args:
	S(Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Extrema_POnCurv2d & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Extrema_POnCurv2d & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d & S);
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") First;
		const Extrema_POnCurv2d & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") Last;
		const Extrema_POnCurv2d & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") Value;
		const Extrema_POnCurv2d & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv2d & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") ChangeValue;
		Extrema_POnCurv2d & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d::~Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC;
class Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC;
		 Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC)

Returns:
	Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC

No detailed docstring for this function.") Assign;
		const Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC & Assign (const Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC & Other);
		%feature("autodoc", "Args:
	Other(Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC)

Returns:
	Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC

No detailed docstring for this function.") operator=;
		const Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC & operator = (const Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC & Other);
		%feature("autodoc", "Args:
	T(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Extrema_POnCurv & T);
		%feature("autodoc", "Args:
	S(Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC & S);
		%feature("autodoc", "Args:
	T(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Extrema_POnCurv & T);
		%feature("autodoc", "Args:
	S(Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Extrema_POnCurv & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Extrema_POnCurv & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC & S);
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv

No detailed docstring for this function.") First;
		const Extrema_POnCurv & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv

No detailed docstring for this function.") Last;
		const Extrema_POnCurv & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Extrema_POnCurv

No detailed docstring for this function.") Value;
		const Extrema_POnCurv & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Extrema_POnCurv

No detailed docstring for this function.") ChangeValue;
		Extrema_POnCurv & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC::~Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SeqPOnCOfCCLocFOfLocECCOfLocateExtCC {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC;
class Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Extrema_POnCurv)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC;
		 Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC (const Extrema_POnCurv & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv

No detailed docstring for this function.") Value;
		Extrema_POnCurv & Value ();
};


%feature("shadow") Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC::~Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC {
	Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC GetHandle() {
	return *(Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC*) &$self;
	}
};

%nodefaultctor Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC;
class Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC();
        Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC(const Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC &aHandle);
        Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC(const Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC {
    Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC* GetObject() {
    return (Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC::~Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d;
class Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Extrema_POnCurv2d)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d;
		 Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d (const Extrema_POnCurv2d & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") Value;
		Extrema_POnCurv2d & Value ();
};


%feature("shadow") Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d::~Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d {
	Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d GetHandle() {
	return *(Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d*) &$self;
	}
};

%nodefaultctor Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d;
class Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d();
        Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d(const Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d &aHandle);
        Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d(const Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d {
    Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d* GetObject() {
    return (Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d::~Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfELPCOfLocateExtPC2d {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC;
class Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Extrema_POnCurv)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC;
		 Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC (const Extrema_POnCurv & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv

No detailed docstring for this function.") Value;
		Extrema_POnCurv & Value ();
};


%feature("shadow") Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC::~Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC {
	Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC GetHandle() {
	return *(Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC*) &$self;
	}
};

%nodefaultctor Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC;
class Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC();
        Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC(const Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC &aHandle);
        Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC(const Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC {
    Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC* GetObject() {
    return (Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC::~Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d;
class Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Extrema_POnCurv2d)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d;
		 Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d (const Extrema_POnCurv2d & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") Value;
		Extrema_POnCurv2d & Value ();
};


%feature("shadow") Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d::~Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d {
	Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d GetHandle() {
	return *(Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d*) &$self;
	}
};

%nodefaultctor Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d;
class Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d();
        Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d(const Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d &aHandle);
        Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d(const Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d {
    Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d* GetObject() {
    return (Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d::~Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_SequenceNodeOfSeqPCOfPCFOfEPCOfExtPC2d {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC;
class Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Extrema_POnCurv)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC;
		 Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC (const Extrema_POnCurv & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv

No detailed docstring for this function.") Value;
		Extrema_POnCurv & Value ();
};


%feature("shadow") Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC::~Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC {
	Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC GetHandle() {
	return *(Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC*) &$self;
	}
};

%nodefaultctor Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC;
class Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC();
        Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC(const Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC &aHandle);
        Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC(const Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC {
    Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC* GetObject() {
    return (Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC::~Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d;
class Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Extrema_POnCurv2d)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d;
		 Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d (const Extrema_POnCurv2d & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") Value;
		Extrema_POnCurv2d & Value ();
};


%feature("shadow") Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d::~Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d {
	Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d GetHandle() {
	return *(Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d*) &$self;
	}
};

%nodefaultctor Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d;
class Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d();
        Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d(const Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d &aHandle);
        Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d(const Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d {
    Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d* GetObject() {
    return (Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d::~Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_SequenceNodeOfSeqPCOfPCLocFOfLocEPCOfLocateExtPC2d {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d;
class Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Extrema_POnCurv2d)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d;
		 Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d (const Extrema_POnCurv2d & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") Value;
		Extrema_POnCurv2d & Value ();
};


%feature("shadow") Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d::~Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d {
	Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d GetHandle() {
	return *(Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d*) &$self;
	}
};

%nodefaultctor Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d;
class Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d();
        Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d(const Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d &aHandle);
        Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d(const Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d {
    Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d* GetObject() {
    return (Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d::~Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECC2dOfExtCC2d {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC;
class Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Extrema_POnCurv)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC;
		 Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC (const Extrema_POnCurv & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv

No detailed docstring for this function.") Value;
		Extrema_POnCurv & Value ();
};


%feature("shadow") Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC::~Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC {
	Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC GetHandle() {
	return *(Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC*) &$self;
	}
};

%nodefaultctor Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC;
class Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC();
        Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC(const Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC &aHandle);
        Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC(const Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC {
    Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC* GetObject() {
    return (Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC::~Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfECCOfExtCC {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d;
class Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Extrema_POnCurv2d)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d;
		 Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d (const Extrema_POnCurv2d & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") Value;
		Extrema_POnCurv2d & Value ();
};


%feature("shadow") Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d::~Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d {
	Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d GetHandle() {
	return *(Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d*) &$self;
	}
};

%nodefaultctor Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d;
class Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d();
        Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d(const Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d &aHandle);
        Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d(const Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d {
    Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d* GetObject() {
    return (Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d::~Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCC2dOfLocateExtCC2d {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC;
class Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Extrema_POnCurv)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC;
		 Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC (const Extrema_POnCurv & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv

No detailed docstring for this function.") Value;
		Extrema_POnCurv & Value ();
};


%feature("shadow") Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC::~Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC {
	Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC GetHandle() {
	return *(Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC*) &$self;
	}
};

%nodefaultctor Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC;
class Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC();
        Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC(const Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC &aHandle);
        Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC(const Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC {
    Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC* GetObject() {
    return (Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC::~Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_SequenceNodeOfSeqPOnCOfCCFOfELCCOfLocateExtCC {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d;
class Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Extrema_POnCurv2d)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d;
		 Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d (const Extrema_POnCurv2d & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") Value;
		Extrema_POnCurv2d & Value ();
};


%feature("shadow") Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d::~Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d {
	Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d GetHandle() {
	return *(Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d*) &$self;
	}
};

%nodefaultctor Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d;
class Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d();
        Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d(const Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d &aHandle);
        Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d(const Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d {
    Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d* GetObject() {
    return (Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d::~Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECC2dOfLocateExtCC2d {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC;
class Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Extrema_POnCurv)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC;
		 Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC (const Extrema_POnCurv & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv

No detailed docstring for this function.") Value;
		Extrema_POnCurv & Value ();
};


%feature("shadow") Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC::~Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC {
	Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC GetHandle() {
	return *(Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC*) &$self;
	}
};

%nodefaultctor Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC;
class Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC();
        Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC(const Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC &aHandle);
        Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC(const Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC {
    Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC* GetObject() {
    return (Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC::~Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_SequenceNodeOfSeqPOnCOfCCLocFOfLocECCOfLocateExtCC {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_SequenceNodeOfSequenceOfPOnCurv;
class Extrema_SequenceNodeOfSequenceOfPOnCurv : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Extrema_POnCurv)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Extrema_SequenceNodeOfSequenceOfPOnCurv;
		 Extrema_SequenceNodeOfSequenceOfPOnCurv (const Extrema_POnCurv & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv

No detailed docstring for this function.") Value;
		Extrema_POnCurv & Value ();
};


%feature("shadow") Extrema_SequenceNodeOfSequenceOfPOnCurv::~Extrema_SequenceNodeOfSequenceOfPOnCurv %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SequenceNodeOfSequenceOfPOnCurv {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_SequenceNodeOfSequenceOfPOnCurv {
	Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv GetHandle() {
	return *(Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv*) &$self;
	}
};

%nodefaultctor Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv;
class Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv();
        Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv(const Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv &aHandle);
        Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv(const Extrema_SequenceNodeOfSequenceOfPOnCurv *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv {
    Extrema_SequenceNodeOfSequenceOfPOnCurv* GetObject() {
    return (Extrema_SequenceNodeOfSequenceOfPOnCurv*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv::~Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_SequenceNodeOfSequenceOfPOnCurv2d;
class Extrema_SequenceNodeOfSequenceOfPOnCurv2d : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Extrema_POnCurv2d)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Extrema_SequenceNodeOfSequenceOfPOnCurv2d;
		 Extrema_SequenceNodeOfSequenceOfPOnCurv2d (const Extrema_POnCurv2d & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") Value;
		Extrema_POnCurv2d & Value ();
};


%feature("shadow") Extrema_SequenceNodeOfSequenceOfPOnCurv2d::~Extrema_SequenceNodeOfSequenceOfPOnCurv2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SequenceNodeOfSequenceOfPOnCurv2d {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_SequenceNodeOfSequenceOfPOnCurv2d {
	Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv2d GetHandle() {
	return *(Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv2d*) &$self;
	}
};

%nodefaultctor Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv2d;
class Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv2d : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv2d();
        Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv2d(const Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv2d &aHandle);
        Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv2d(const Extrema_SequenceNodeOfSequenceOfPOnCurv2d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv2d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv2d {
    Extrema_SequenceNodeOfSequenceOfPOnCurv2d* GetObject() {
    return (Extrema_SequenceNodeOfSequenceOfPOnCurv2d*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv2d::~Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv2d %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_SequenceNodeOfSequenceOfPOnCurv2d {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_SequenceNodeOfSequenceOfPOnSurf;
class Extrema_SequenceNodeOfSequenceOfPOnSurf : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Extrema_POnSurf)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Extrema_SequenceNodeOfSequenceOfPOnSurf;
		 Extrema_SequenceNodeOfSequenceOfPOnSurf (const Extrema_POnSurf & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnSurf

No detailed docstring for this function.") Value;
		Extrema_POnSurf & Value ();
};


%feature("shadow") Extrema_SequenceNodeOfSequenceOfPOnSurf::~Extrema_SequenceNodeOfSequenceOfPOnSurf %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SequenceNodeOfSequenceOfPOnSurf {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Extrema_SequenceNodeOfSequenceOfPOnSurf {
	Handle_Extrema_SequenceNodeOfSequenceOfPOnSurf GetHandle() {
	return *(Handle_Extrema_SequenceNodeOfSequenceOfPOnSurf*) &$self;
	}
};

%nodefaultctor Handle_Extrema_SequenceNodeOfSequenceOfPOnSurf;
class Handle_Extrema_SequenceNodeOfSequenceOfPOnSurf : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Extrema_SequenceNodeOfSequenceOfPOnSurf();
        Handle_Extrema_SequenceNodeOfSequenceOfPOnSurf(const Handle_Extrema_SequenceNodeOfSequenceOfPOnSurf &aHandle);
        Handle_Extrema_SequenceNodeOfSequenceOfPOnSurf(const Extrema_SequenceNodeOfSequenceOfPOnSurf *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Extrema_SequenceNodeOfSequenceOfPOnSurf DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Extrema_SequenceNodeOfSequenceOfPOnSurf {
    Extrema_SequenceNodeOfSequenceOfPOnSurf* GetObject() {
    return (Extrema_SequenceNodeOfSequenceOfPOnSurf*)$self->Access();
    }
};
%feature("shadow") Handle_Extrema_SequenceNodeOfSequenceOfPOnSurf::~Handle_Extrema_SequenceNodeOfSequenceOfPOnSurf %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Extrema_SequenceNodeOfSequenceOfPOnSurf {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Extrema_SequenceOfPOnCurv;
class Extrema_SequenceOfPOnCurv : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_SequenceOfPOnCurv;
		 Extrema_SequenceOfPOnCurv ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Extrema_SequenceOfPOnCurv)

Returns:
	Extrema_SequenceOfPOnCurv

No detailed docstring for this function.") Assign;
		const Extrema_SequenceOfPOnCurv & Assign (const Extrema_SequenceOfPOnCurv & Other);
		%feature("autodoc", "Args:
	Other(Extrema_SequenceOfPOnCurv)

Returns:
	Extrema_SequenceOfPOnCurv

No detailed docstring for this function.") operator=;
		const Extrema_SequenceOfPOnCurv & operator = (const Extrema_SequenceOfPOnCurv & Other);
		%feature("autodoc", "Args:
	T(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Extrema_POnCurv & T);
		%feature("autodoc", "Args:
	S(Extrema_SequenceOfPOnCurv)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Extrema_SequenceOfPOnCurv & S);
		%feature("autodoc", "Args:
	T(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Extrema_POnCurv & T);
		%feature("autodoc", "Args:
	S(Extrema_SequenceOfPOnCurv)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Extrema_SequenceOfPOnCurv & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Extrema_POnCurv & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Extrema_SequenceOfPOnCurv)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Extrema_SequenceOfPOnCurv & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Extrema_POnCurv & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Extrema_SequenceOfPOnCurv)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Extrema_SequenceOfPOnCurv & S);
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv

No detailed docstring for this function.") First;
		const Extrema_POnCurv & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv

No detailed docstring for this function.") Last;
		const Extrema_POnCurv & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Extrema_SequenceOfPOnCurv)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Extrema_SequenceOfPOnCurv & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Extrema_POnCurv

No detailed docstring for this function.") Value;
		const Extrema_POnCurv & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Extrema_POnCurv)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Extrema_POnCurv

No detailed docstring for this function.") ChangeValue;
		Extrema_POnCurv & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") Extrema_SequenceOfPOnCurv::~Extrema_SequenceOfPOnCurv %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SequenceOfPOnCurv {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_SequenceOfPOnCurv2d;
class Extrema_SequenceOfPOnCurv2d : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_SequenceOfPOnCurv2d;
		 Extrema_SequenceOfPOnCurv2d ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Extrema_SequenceOfPOnCurv2d)

Returns:
	Extrema_SequenceOfPOnCurv2d

No detailed docstring for this function.") Assign;
		const Extrema_SequenceOfPOnCurv2d & Assign (const Extrema_SequenceOfPOnCurv2d & Other);
		%feature("autodoc", "Args:
	Other(Extrema_SequenceOfPOnCurv2d)

Returns:
	Extrema_SequenceOfPOnCurv2d

No detailed docstring for this function.") operator=;
		const Extrema_SequenceOfPOnCurv2d & operator = (const Extrema_SequenceOfPOnCurv2d & Other);
		%feature("autodoc", "Args:
	T(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Extrema_POnCurv2d & T);
		%feature("autodoc", "Args:
	S(Extrema_SequenceOfPOnCurv2d)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Extrema_SequenceOfPOnCurv2d & S);
		%feature("autodoc", "Args:
	T(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Extrema_POnCurv2d & T);
		%feature("autodoc", "Args:
	S(Extrema_SequenceOfPOnCurv2d)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Extrema_SequenceOfPOnCurv2d & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Extrema_POnCurv2d & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Extrema_SequenceOfPOnCurv2d)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Extrema_SequenceOfPOnCurv2d & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Extrema_POnCurv2d & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Extrema_SequenceOfPOnCurv2d)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Extrema_SequenceOfPOnCurv2d & S);
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") First;
		const Extrema_POnCurv2d & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") Last;
		const Extrema_POnCurv2d & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Extrema_SequenceOfPOnCurv2d)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Extrema_SequenceOfPOnCurv2d & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") Value;
		const Extrema_POnCurv2d & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv2d & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") ChangeValue;
		Extrema_POnCurv2d & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") Extrema_SequenceOfPOnCurv2d::~Extrema_SequenceOfPOnCurv2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SequenceOfPOnCurv2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_SequenceOfPOnSurf;
class Extrema_SequenceOfPOnSurf : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Extrema_SequenceOfPOnSurf;
		 Extrema_SequenceOfPOnSurf ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Extrema_SequenceOfPOnSurf)

Returns:
	Extrema_SequenceOfPOnSurf

No detailed docstring for this function.") Assign;
		const Extrema_SequenceOfPOnSurf & Assign (const Extrema_SequenceOfPOnSurf & Other);
		%feature("autodoc", "Args:
	Other(Extrema_SequenceOfPOnSurf)

Returns:
	Extrema_SequenceOfPOnSurf

No detailed docstring for this function.") operator=;
		const Extrema_SequenceOfPOnSurf & operator = (const Extrema_SequenceOfPOnSurf & Other);
		%feature("autodoc", "Args:
	T(Extrema_POnSurf)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Extrema_POnSurf & T);
		%feature("autodoc", "Args:
	S(Extrema_SequenceOfPOnSurf)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Extrema_SequenceOfPOnSurf & S);
		%feature("autodoc", "Args:
	T(Extrema_POnSurf)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Extrema_POnSurf & T);
		%feature("autodoc", "Args:
	S(Extrema_SequenceOfPOnSurf)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Extrema_SequenceOfPOnSurf & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Extrema_POnSurf)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Extrema_POnSurf & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Extrema_SequenceOfPOnSurf)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Extrema_SequenceOfPOnSurf & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Extrema_POnSurf)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Extrema_POnSurf & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Extrema_SequenceOfPOnSurf)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Extrema_SequenceOfPOnSurf & S);
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnSurf

No detailed docstring for this function.") First;
		const Extrema_POnSurf & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnSurf

No detailed docstring for this function.") Last;
		const Extrema_POnSurf & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Extrema_SequenceOfPOnSurf)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Extrema_SequenceOfPOnSurf & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Extrema_POnSurf

No detailed docstring for this function.") Value;
		const Extrema_POnSurf & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Extrema_POnSurf)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnSurf & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Extrema_POnSurf

No detailed docstring for this function.") ChangeValue;
		Extrema_POnSurf & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") Extrema_SequenceOfPOnSurf::~Extrema_SequenceOfPOnSurf %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_SequenceOfPOnSurf {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Extrema_POnSurfParams;
class Extrema_POnSurfParams : public Extrema_POnSurf {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

empty constructor") Extrema_POnSurfParams;
		 Extrema_POnSurfParams ();
		%feature("autodoc", "Args:
	theU(Standard_Real)
	theV(Standard_Real)
	thePnt(gp_Pnt)

Returns:
	None

Creation of a point on surface with parameter  
         values on the surface and a Pnt from gp.") Extrema_POnSurfParams;
		 Extrema_POnSurfParams (const Standard_Real theU,const Standard_Real theV,const gp_Pnt & thePnt);
		%feature("autodoc", "Args:
	theSqrDistance(Standard_Real)

Returns:
	None

Sets the square distance from this point to another one  
         (e.g. to the point to be projected).") SetSqrDistance;
		void SetSqrDistance (const Standard_Real theSqrDistance);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Query the square distance from this point to another one.") GetSqrDistance;
		Standard_Real GetSqrDistance ();
		%feature("autodoc", "Args:
	theElementType(Extrema_ElementType)

Returns:
	None

Sets the element type on which this point is situated.") SetElementType;
		void SetElementType (const Extrema_ElementType theElementType);
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_ElementType

Query the element type on which this point is situated.") GetElementType;
		Extrema_ElementType GetElementType ();
		%feature("autodoc", "Args:
	theIndexU(Standard_Integer)
	theIndexV(Standard_Integer)

Returns:
	None

Sets the U and V indices of an element that contains  
         this point.") SetIndices;
		void SetIndices (const Standard_Integer theIndexU,const Standard_Integer theIndexV);
		%feature("autodoc", "Args:
	theIndexU(Standard_Integer)
	theIndexV(Standard_Integer)

Returns:
	None

Query the U and V indices of an element that contains  
         this point.") GetIndices;
		void GetIndices (Standard_Integer &OutValue,Standard_Integer &OutValue);
};


%feature("shadow") Extrema_POnSurfParams::~Extrema_POnSurfParams %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Extrema_POnSurfParams {
	void _kill_pointed() {
		delete $self;
	}
};
