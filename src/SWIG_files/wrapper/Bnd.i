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
%module (package="OCC") Bnd

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

%include Bnd_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor Bnd_Array1OfBox;
class Bnd_Array1OfBox {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Bnd_Array1OfBox;
		 Bnd_Array1OfBox (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(Bnd_Box)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Bnd_Array1OfBox;
		 Bnd_Array1OfBox (const Bnd_Box & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(Bnd_Box)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Bnd_Box & V);
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
	Other(Bnd_Array1OfBox)

Returns:
	Bnd_Array1OfBox

No detailed docstring for this function.") Assign;
		const Bnd_Array1OfBox & Assign (const Bnd_Array1OfBox & Other);
		%feature("autodoc", "Args:
	Other(Bnd_Array1OfBox)

Returns:
	Bnd_Array1OfBox

No detailed docstring for this function.") operator=;
		const Bnd_Array1OfBox & operator = (const Bnd_Array1OfBox & Other);
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
	Value(Bnd_Box)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Bnd_Box & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Bnd_Box

No detailed docstring for this function.") Value;
		const Bnd_Box & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Bnd_Box

No detailed docstring for this function.") ChangeValue;
		Bnd_Box & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") Bnd_Array1OfBox::~Bnd_Array1OfBox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Bnd_Array1OfBox {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Bnd_Array1OfBox2d;
class Bnd_Array1OfBox2d {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Bnd_Array1OfBox2d;
		 Bnd_Array1OfBox2d (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(Bnd_Box2d)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Bnd_Array1OfBox2d;
		 Bnd_Array1OfBox2d (const Bnd_Box2d & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(Bnd_Box2d)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Bnd_Box2d & V);
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
	Other(Bnd_Array1OfBox2d)

Returns:
	Bnd_Array1OfBox2d

No detailed docstring for this function.") Assign;
		const Bnd_Array1OfBox2d & Assign (const Bnd_Array1OfBox2d & Other);
		%feature("autodoc", "Args:
	Other(Bnd_Array1OfBox2d)

Returns:
	Bnd_Array1OfBox2d

No detailed docstring for this function.") operator=;
		const Bnd_Array1OfBox2d & operator = (const Bnd_Array1OfBox2d & Other);
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
	Value(Bnd_Box2d)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Bnd_Box2d & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Bnd_Box2d

No detailed docstring for this function.") Value;
		const Bnd_Box2d & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Bnd_Box2d

No detailed docstring for this function.") ChangeValue;
		Bnd_Box2d & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") Bnd_Array1OfBox2d::~Bnd_Array1OfBox2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Bnd_Array1OfBox2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Bnd_Array1OfSphere;
class Bnd_Array1OfSphere {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Bnd_Array1OfSphere;
		 Bnd_Array1OfSphere (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(Bnd_Sphere)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Bnd_Array1OfSphere;
		 Bnd_Array1OfSphere (const Bnd_Sphere & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(Bnd_Sphere)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Bnd_Sphere & V);
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
	Other(Bnd_Array1OfSphere)

Returns:
	Bnd_Array1OfSphere

No detailed docstring for this function.") Assign;
		const Bnd_Array1OfSphere & Assign (const Bnd_Array1OfSphere & Other);
		%feature("autodoc", "Args:
	Other(Bnd_Array1OfSphere)

Returns:
	Bnd_Array1OfSphere

No detailed docstring for this function.") operator=;
		const Bnd_Array1OfSphere & operator = (const Bnd_Array1OfSphere & Other);
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
	Value(Bnd_Sphere)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Bnd_Sphere & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Bnd_Sphere

No detailed docstring for this function.") Value;
		const Bnd_Sphere & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Bnd_Sphere

No detailed docstring for this function.") ChangeValue;
		Bnd_Sphere & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") Bnd_Array1OfSphere::~Bnd_Array1OfSphere %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Bnd_Array1OfSphere {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Bnd_B2d;
class Bnd_B2d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Bnd_B2d;
		 Bnd_B2d ();
		%feature("autodoc", "Args:
	theCenter(gp_XY)
	theHSize(gp_XY)

Returns:
	None

No detailed docstring for this function.") Bnd_B2d;
		 Bnd_B2d (const gp_XY & theCenter,const gp_XY & theHSize);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsVoid;
		Standard_Boolean IsVoid ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	thePnt(gp_XY)

Returns:
	None

No detailed docstring for this function.") Add;
		void Add (const gp_XY & thePnt);
		%feature("autodoc", "Args:
	thePnt(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") Add;
		void Add (const gp_Pnt2d & thePnt);
		%feature("autodoc", "Args:
	theBox(Bnd_B2d)

Returns:
	None

No detailed docstring for this function.") Add;
		void Add (const Bnd_B2d & theBox);
		%feature("autodoc", "Args:
	None
Returns:
	gp_XY

No detailed docstring for this function.") CornerMin;
		gp_XY CornerMin ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_XY

No detailed docstring for this function.") CornerMax;
		gp_XY CornerMax ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") SquareExtent;
		Standard_Real SquareExtent ();
		%feature("autodoc", "Args:
	theDiff(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Enlarge;
		void Enlarge (const Standard_Real theDiff);
		%feature("autodoc", "Args:
	theOtherBox(Bnd_B2d)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Limit;
		Standard_Boolean Limit (const Bnd_B2d & theOtherBox);
		%feature("autodoc", "Args:
	theTrsf(gp_Trsf2d)

Returns:
	Bnd_B2d

No detailed docstring for this function.") Transformed;
		Bnd_B2d Transformed (const gp_Trsf2d & theTrsf);
		%feature("autodoc", "Args:
	thePnt(gp_XY)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsOut;
		Standard_Boolean IsOut (const gp_XY & thePnt);
		%feature("autodoc", "Args:
	theCenter(gp_XY)
	theRadius(Standard_Real)
	isCircleHollow(Standard_Boolean)=Standard_False

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsOut;
		Standard_Boolean IsOut (const gp_XY & theCenter,const Standard_Real theRadius,const Standard_Boolean isCircleHollow = Standard_False);
		%feature("autodoc", "Args:
	theOtherBox(Bnd_B2d)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsOut;
		Standard_Boolean IsOut (const Bnd_B2d & theOtherBox);
		%feature("autodoc", "Args:
	theOtherBox(Bnd_B2d)
	theTrsf(gp_Trsf2d)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsOut;
		Standard_Boolean IsOut (const Bnd_B2d & theOtherBox,const gp_Trsf2d & theTrsf);
		%feature("autodoc", "Args:
	theLine(gp_Ax2d)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsOut;
		Standard_Boolean IsOut (const gp_Ax2d & theLine);
		%feature("autodoc", "Args:
	theP0(gp_XY)
	theP1(gp_XY)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsOut;
		Standard_Boolean IsOut (const gp_XY & theP0,const gp_XY & theP1);
		%feature("autodoc", "Args:
	theBox(Bnd_B2d)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsIn;
		Standard_Boolean IsIn (const Bnd_B2d & theBox);
		%feature("autodoc", "Args:
	theBox(Bnd_B2d)
	theTrsf(gp_Trsf2d)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsIn;
		Standard_Boolean IsIn (const Bnd_B2d & theBox,const gp_Trsf2d & theTrsf);
		%feature("autodoc", "Args:
	theCenter(gp_XY)

Returns:
	None

No detailed docstring for this function.") SetCenter;
		void SetCenter (const gp_XY & theCenter);
		%feature("autodoc", "Args:
	theHSize(gp_XY)

Returns:
	None

No detailed docstring for this function.") SetHSize;
		void SetHSize (const gp_XY & theHSize);
};


%feature("shadow") Bnd_B2d::~Bnd_B2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Bnd_B2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Bnd_B2f;
class Bnd_B2f {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Bnd_B2f;
		 Bnd_B2f ();
		%feature("autodoc", "Args:
	theCenter(gp_XY)
	theHSize(gp_XY)

Returns:
	None

No detailed docstring for this function.") Bnd_B2f;
		 Bnd_B2f (const gp_XY & theCenter,const gp_XY & theHSize);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsVoid;
		Standard_Boolean IsVoid ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	thePnt(gp_XY)

Returns:
	None

No detailed docstring for this function.") Add;
		void Add (const gp_XY & thePnt);
		%feature("autodoc", "Args:
	thePnt(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") Add;
		void Add (const gp_Pnt2d & thePnt);
		%feature("autodoc", "Args:
	theBox(Bnd_B2f)

Returns:
	None

No detailed docstring for this function.") Add;
		void Add (const Bnd_B2f & theBox);
		%feature("autodoc", "Args:
	None
Returns:
	gp_XY

No detailed docstring for this function.") CornerMin;
		gp_XY CornerMin ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_XY

No detailed docstring for this function.") CornerMax;
		gp_XY CornerMax ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") SquareExtent;
		Standard_Real SquareExtent ();
		%feature("autodoc", "Args:
	theDiff(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Enlarge;
		void Enlarge (const Standard_Real theDiff);
		%feature("autodoc", "Args:
	theOtherBox(Bnd_B2f)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Limit;
		Standard_Boolean Limit (const Bnd_B2f & theOtherBox);
		%feature("autodoc", "Args:
	theTrsf(gp_Trsf2d)

Returns:
	Bnd_B2f

No detailed docstring for this function.") Transformed;
		Bnd_B2f Transformed (const gp_Trsf2d & theTrsf);
		%feature("autodoc", "Args:
	thePnt(gp_XY)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsOut;
		Standard_Boolean IsOut (const gp_XY & thePnt);
		%feature("autodoc", "Args:
	theCenter(gp_XY)
	theRadius(Standard_Real)
	isCircleHollow(Standard_Boolean)=Standard_False

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsOut;
		Standard_Boolean IsOut (const gp_XY & theCenter,const Standard_Real theRadius,const Standard_Boolean isCircleHollow = Standard_False);
		%feature("autodoc", "Args:
	theOtherBox(Bnd_B2f)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsOut;
		Standard_Boolean IsOut (const Bnd_B2f & theOtherBox);
		%feature("autodoc", "Args:
	theOtherBox(Bnd_B2f)
	theTrsf(gp_Trsf2d)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsOut;
		Standard_Boolean IsOut (const Bnd_B2f & theOtherBox,const gp_Trsf2d & theTrsf);
		%feature("autodoc", "Args:
	theLine(gp_Ax2d)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsOut;
		Standard_Boolean IsOut (const gp_Ax2d & theLine);
		%feature("autodoc", "Args:
	theP0(gp_XY)
	theP1(gp_XY)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsOut;
		Standard_Boolean IsOut (const gp_XY & theP0,const gp_XY & theP1);
		%feature("autodoc", "Args:
	theBox(Bnd_B2f)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsIn;
		Standard_Boolean IsIn (const Bnd_B2f & theBox);
		%feature("autodoc", "Args:
	theBox(Bnd_B2f)
	theTrsf(gp_Trsf2d)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsIn;
		Standard_Boolean IsIn (const Bnd_B2f & theBox,const gp_Trsf2d & theTrsf);
		%feature("autodoc", "Args:
	theCenter(gp_XY)

Returns:
	None

No detailed docstring for this function.") SetCenter;
		void SetCenter (const gp_XY & theCenter);
		%feature("autodoc", "Args:
	theHSize(gp_XY)

Returns:
	None

No detailed docstring for this function.") SetHSize;
		void SetHSize (const gp_XY & theHSize);
};


%feature("shadow") Bnd_B2f::~Bnd_B2f %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Bnd_B2f {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Bnd_B3d;
class Bnd_B3d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Bnd_B3d;
		 Bnd_B3d ();
		%feature("autodoc", "Args:
	theCenter(gp_XYZ)
	theHSize(gp_XYZ)

Returns:
	None

No detailed docstring for this function.") Bnd_B3d;
		 Bnd_B3d (const gp_XYZ & theCenter,const gp_XYZ & theHSize);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsVoid;
		Standard_Boolean IsVoid ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	thePnt(gp_XYZ)

Returns:
	None

No detailed docstring for this function.") Add;
		void Add (const gp_XYZ & thePnt);
		%feature("autodoc", "Args:
	thePnt(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Add;
		void Add (const gp_Pnt & thePnt);
		%feature("autodoc", "Args:
	theBox(Bnd_B3d)

Returns:
	None

No detailed docstring for this function.") Add;
		void Add (const Bnd_B3d & theBox);
		%feature("autodoc", "Args:
	None
Returns:
	gp_XYZ

No detailed docstring for this function.") CornerMin;
		gp_XYZ CornerMin ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_XYZ

No detailed docstring for this function.") CornerMax;
		gp_XYZ CornerMax ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") SquareExtent;
		Standard_Real SquareExtent ();
		%feature("autodoc", "Args:
	theDiff(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Enlarge;
		void Enlarge (const Standard_Real theDiff);
		%feature("autodoc", "Args:
	theOtherBox(Bnd_B3d)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Limit;
		Standard_Boolean Limit (const Bnd_B3d & theOtherBox);
		%feature("autodoc", "Args:
	theTrsf(gp_Trsf)

Returns:
	Bnd_B3d

No detailed docstring for this function.") Transformed;
		Bnd_B3d Transformed (const gp_Trsf & theTrsf);
		%feature("autodoc", "Args:
	thePnt(gp_XYZ)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsOut;
		Standard_Boolean IsOut (const gp_XYZ & thePnt);
		%feature("autodoc", "Args:
	theCenter(gp_XYZ)
	theRadius(Standard_Real)
	isSphereHollow(Standard_Boolean)=Standard_False

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsOut;
		Standard_Boolean IsOut (const gp_XYZ & theCenter,const Standard_Real theRadius,const Standard_Boolean isSphereHollow = Standard_False);
		%feature("autodoc", "Args:
	theOtherBox(Bnd_B3d)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsOut;
		Standard_Boolean IsOut (const Bnd_B3d & theOtherBox);
		%feature("autodoc", "Args:
	theOtherBox(Bnd_B3d)
	theTrsf(gp_Trsf)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsOut;
		Standard_Boolean IsOut (const Bnd_B3d & theOtherBox,const gp_Trsf & theTrsf);
		%feature("autodoc", "Args:
	theLine(gp_Ax1)
	isRay(Standard_Boolean)=Standard_False
	theOverthickness(Standard_Real)=0.0

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsOut;
		Standard_Boolean IsOut (const gp_Ax1 & theLine,const Standard_Boolean isRay = Standard_False,const Standard_Real theOverthickness = 0.0);
		%feature("autodoc", "Args:
	thePlane(gp_Ax3)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsOut;
		Standard_Boolean IsOut (const gp_Ax3 & thePlane);
		%feature("autodoc", "Args:
	theBox(Bnd_B3d)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsIn;
		Standard_Boolean IsIn (const Bnd_B3d & theBox);
		%feature("autodoc", "Args:
	theBox(Bnd_B3d)
	theTrsf(gp_Trsf)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsIn;
		Standard_Boolean IsIn (const Bnd_B3d & theBox,const gp_Trsf & theTrsf);
		%feature("autodoc", "Args:
	theCenter(gp_XYZ)

Returns:
	None

No detailed docstring for this function.") SetCenter;
		void SetCenter (const gp_XYZ & theCenter);
		%feature("autodoc", "Args:
	theHSize(gp_XYZ)

Returns:
	None

No detailed docstring for this function.") SetHSize;
		void SetHSize (const gp_XYZ & theHSize);
};


%feature("shadow") Bnd_B3d::~Bnd_B3d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Bnd_B3d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Bnd_B3f;
class Bnd_B3f {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Bnd_B3f;
		 Bnd_B3f ();
		%feature("autodoc", "Args:
	theCenter(gp_XYZ)
	theHSize(gp_XYZ)

Returns:
	None

No detailed docstring for this function.") Bnd_B3f;
		 Bnd_B3f (const gp_XYZ & theCenter,const gp_XYZ & theHSize);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsVoid;
		Standard_Boolean IsVoid ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	thePnt(gp_XYZ)

Returns:
	None

No detailed docstring for this function.") Add;
		void Add (const gp_XYZ & thePnt);
		%feature("autodoc", "Args:
	thePnt(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Add;
		void Add (const gp_Pnt & thePnt);
		%feature("autodoc", "Args:
	theBox(Bnd_B3f)

Returns:
	None

No detailed docstring for this function.") Add;
		void Add (const Bnd_B3f & theBox);
		%feature("autodoc", "Args:
	None
Returns:
	gp_XYZ

No detailed docstring for this function.") CornerMin;
		gp_XYZ CornerMin ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_XYZ

No detailed docstring for this function.") CornerMax;
		gp_XYZ CornerMax ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") SquareExtent;
		Standard_Real SquareExtent ();
		%feature("autodoc", "Args:
	theDiff(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Enlarge;
		void Enlarge (const Standard_Real theDiff);
		%feature("autodoc", "Args:
	theOtherBox(Bnd_B3f)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Limit;
		Standard_Boolean Limit (const Bnd_B3f & theOtherBox);
		%feature("autodoc", "Args:
	theTrsf(gp_Trsf)

Returns:
	Bnd_B3f

No detailed docstring for this function.") Transformed;
		Bnd_B3f Transformed (const gp_Trsf & theTrsf);
		%feature("autodoc", "Args:
	thePnt(gp_XYZ)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsOut;
		Standard_Boolean IsOut (const gp_XYZ & thePnt);
		%feature("autodoc", "Args:
	theCenter(gp_XYZ)
	theRadius(Standard_Real)
	isSphereHollow(Standard_Boolean)=Standard_False

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsOut;
		Standard_Boolean IsOut (const gp_XYZ & theCenter,const Standard_Real theRadius,const Standard_Boolean isSphereHollow = Standard_False);
		%feature("autodoc", "Args:
	theOtherBox(Bnd_B3f)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsOut;
		Standard_Boolean IsOut (const Bnd_B3f & theOtherBox);
		%feature("autodoc", "Args:
	theOtherBox(Bnd_B3f)
	theTrsf(gp_Trsf)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsOut;
		Standard_Boolean IsOut (const Bnd_B3f & theOtherBox,const gp_Trsf & theTrsf);
		%feature("autodoc", "Args:
	theLine(gp_Ax1)
	isRay(Standard_Boolean)=Standard_False
	theOverthickness(Standard_Real)=0.0

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsOut;
		Standard_Boolean IsOut (const gp_Ax1 & theLine,const Standard_Boolean isRay = Standard_False,const Standard_Real theOverthickness = 0.0);
		%feature("autodoc", "Args:
	thePlane(gp_Ax3)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsOut;
		Standard_Boolean IsOut (const gp_Ax3 & thePlane);
		%feature("autodoc", "Args:
	theBox(Bnd_B3f)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsIn;
		Standard_Boolean IsIn (const Bnd_B3f & theBox);
		%feature("autodoc", "Args:
	theBox(Bnd_B3f)
	theTrsf(gp_Trsf)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsIn;
		Standard_Boolean IsIn (const Bnd_B3f & theBox,const gp_Trsf & theTrsf);
		%feature("autodoc", "Args:
	theCenter(gp_XYZ)

Returns:
	None

No detailed docstring for this function.") SetCenter;
		void SetCenter (const gp_XYZ & theCenter);
		%feature("autodoc", "Args:
	theHSize(gp_XYZ)

Returns:
	None

No detailed docstring for this function.") SetHSize;
		void SetHSize (const gp_XYZ & theHSize);
};


%feature("shadow") Bnd_B3f::~Bnd_B3f %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Bnd_B3f {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Bnd_BoundSortBox;
class Bnd_BoundSortBox {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Constructs an empty comparison algorithm for bounding boxes.  
The bounding boxes are then defined using the Initialize function.") Bnd_BoundSortBox;
		 Bnd_BoundSortBox ();
		%feature("autodoc", "Args:
	CompleteBox(Bnd_Box)
	SetOfBox(Handle_Bnd_HArray1OfBox)

Returns:
	None

Initializes this comparison algorithm with  
-   the set of bounding boxes SetOfBox.") Initialize;
		void Initialize (const Bnd_Box & CompleteBox,const Handle_Bnd_HArray1OfBox & SetOfBox);
		%feature("autodoc", "Args:
	SetOfBox(Handle_Bnd_HArray1OfBox)

Returns:
	None

Initializes this comparison algorithm with  
-   the set of bounding boxes SetOfBox, where  
  CompleteBox is given as the global bounding box of SetOfBox.") Initialize;
		void Initialize (const Handle_Bnd_HArray1OfBox & SetOfBox);
		%feature("autodoc", "Args:
	CompleteBox(Bnd_Box)
	nbComponents(Standard_Integer)

Returns:
	None

Initializes this comparison algorithm, giving it only  
-   the maximum number nbComponents  
of the bounding boxes to be managed. Use the Add  
function to define the array of bounding boxes to be sorted by this algorithm.") Initialize;
		void Initialize (const Bnd_Box & CompleteBox,const Standard_Integer nbComponents);
		%feature("autodoc", "Args:
	theBox(Bnd_Box)
	boxIndex(Standard_Integer)

Returns:
	None

Adds the bounding box theBox at position boxIndex in  
the array of boxes to be sorted by this comparison algorithm.  
This function is used only in conjunction with the third  
syntax described in the synopsis of Initialize.  
 
Exceptions:  
 
- Standard_OutOfRange if boxIndex is not in the  
  range [ 1,nbComponents ] where  
  nbComponents is the maximum number of bounding  
  boxes declared for this comparison algorithm at  
  initialization.  
 
- Standard_MultiplyDefined if a box already exists at  
  position boxIndex in the array of boxes to be sorted by  
  this comparison algorithm.") Add;
		void Add (const Bnd_Box & theBox,const Standard_Integer boxIndex);
		%feature("autodoc", "Args:
	theBox(Bnd_Box)

Returns:
	TColStd_ListOfInteger

Compares the bounding box theBox,  
with the set of bounding boxes to be sorted by this  
comparison algorithm, and returns the list of intersecting  
bounding boxes as a list of indexes on the array of  
bounding boxes used by this algorithm.") Compare;
		const TColStd_ListOfInteger & Compare (const Bnd_Box & theBox);
		%feature("autodoc", "Args:
	P(gp_Pln)

Returns:
	TColStd_ListOfInteger

Compares the plane P  
with the set of bounding boxes to be sorted by this  
comparison algorithm, and returns the list of intersecting  
bounding boxes as a list of indexes on the array of  
bounding boxes used by this algorithm.") Compare;
		const TColStd_ListOfInteger & Compare (const gp_Pln & P);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dump;
		void Dump ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
};


%feature("shadow") Bnd_BoundSortBox::~Bnd_BoundSortBox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Bnd_BoundSortBox {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Bnd_BoundSortBox2d;
class Bnd_BoundSortBox2d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Constructs an empty comparison algorithm for 2D bounding boxes.  
The bounding boxes are then defined using the Initialize function.") Bnd_BoundSortBox2d;
		 Bnd_BoundSortBox2d ();
		%feature("autodoc", "Args:
	CompleteBox(Bnd_Box2d)
	SetOfBox(Handle_Bnd_HArray1OfBox2d)

Returns:
	None

Initializes this comparison algorithm with  
-   the set of 2D bounding boxes SetOfBox") Initialize;
		void Initialize (const Bnd_Box2d & CompleteBox,const Handle_Bnd_HArray1OfBox2d & SetOfBox);
		%feature("autodoc", "Args:
	SetOfBox(Handle_Bnd_HArray1OfBox2d)

Returns:
	None

Initializes this comparison algorithm with  
-   the set of 2D bounding boxes SetOfBox, where  
 CompleteBox is given as the global bounding box of   SetOfBox.") Initialize;
		void Initialize (const Handle_Bnd_HArray1OfBox2d & SetOfBox);
		%feature("autodoc", "Args:
	CompleteBox(Bnd_Box2d)
	nbComponents(Standard_Integer)

Returns:
	None

Initializes this comparison algorithm, giving it only  
-   the maximum number nbComponents, and  
-   the global bounding box CompleteBox,  
of the 2D bounding boxes to be managed. Use the Add  
function to define the array of bounding boxes to be sorted by this algorithm.") Initialize;
		void Initialize (const Bnd_Box2d & CompleteBox,const Standard_Integer nbComponents);
		%feature("autodoc", "Args:
	theBox(Bnd_Box2d)
	boxIndex(Standard_Integer)

Returns:
	None

Adds the 2D bounding box theBox at position boxIndex in  
the array of boxes to be sorted by this comparison algorithm.  
This function is used only in conjunction with the third  
syntax described in the synopsis of Initialize.  
Exceptions  
-   Standard_OutOfRange if boxIndex is not in the  
  range [ 1,nbComponents ] where  
  nbComponents is the maximum number of bounding  
  boxes declared for this comparison algorithm at  
  initialization.  
-   Standard_MultiplyDefined if a box still exists at  
  position boxIndex in the array of boxes to be sorted by  
  this comparison algorithm.") Add;
		void Add (const Bnd_Box2d & theBox,const Standard_Integer boxIndex);
		%feature("autodoc", "Args:
	theBox(Bnd_Box2d)

Returns:
	TColStd_ListOfInteger

Compares the 2D bounding box theBox with the set of  
bounding boxes to be sorted by this comparison algorithm,  
and returns the list of intersecting bounding boxes as a list  
of indexes on the array of bounding boxes used by this algorithm.") Compare;
		const TColStd_ListOfInteger & Compare (const Bnd_Box2d & theBox);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dump;
		void Dump ();
};


%feature("shadow") Bnd_BoundSortBox2d::~Bnd_BoundSortBox2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Bnd_BoundSortBox2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Bnd_Box;
class Bnd_Box {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an empty Box.  
The constructed box is qualified Void. Its gap is null.") Bnd_Box;
		 Bnd_Box ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Sets this bounding box so that it  covers the whole of 3D space.  
       It is infinitely  long in all directions.") SetWhole;
		void SetWhole ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Sets this bounding box so that it is empty. All points are outside a void box.") SetVoid;
		void SetVoid ();
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

Sets this bounding box so that it bounds  
-   the point P. This involves first setting this bounding box  
  to be void and then adding the point P.") Set;
		void Set (const gp_Pnt & P);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	D(gp_Dir)

Returns:
	None

Sets this bounding box so that it bounds  
  the half-line defined by point P and direction D, i.e. all  
  points M defined by M=P+u*D, where u is greater than  
  or equal to 0, are inside the bounding volume. This  
  involves first setting this box to be void and then adding   the half-line.") Set;
		void Set (const gp_Pnt & P,const gp_Dir & D);
		%feature("autodoc", "Args:
	aXmin(Standard_Real)
	aYmin(Standard_Real)
	aZmin(Standard_Real)
	aXmax(Standard_Real)
	aYmax(Standard_Real)
	aZmax(Standard_Real)

Returns:
	None

Enlarges this bounding box, if required, so that it  
         contains at least:  
  -   interval [ aXmin,aXmax ] in the 'X Direction',  
  -   interval [ aYmin,aYmax ] in the 'Y Direction',  
  -   interval [ aZmin,aZmax ] in the 'Z Direction';") Update;
		void Update (const Standard_Real aXmin,const Standard_Real aYmin,const Standard_Real aZmin,const Standard_Real aXmax,const Standard_Real aYmax,const Standard_Real aZmax);
		%feature("autodoc", "Args:
	X(Standard_Real)
	Y(Standard_Real)
	Z(Standard_Real)

Returns:
	None

Adds a point of coordinates (X,Y,Z) to this bounding box.") Update;
		void Update (const Standard_Real X,const Standard_Real Y,const Standard_Real Z);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the gap of this bounding box.") GetGap;
		Standard_Real GetGap ();
		%feature("autodoc", "Args:
	Tol(Standard_Real)

Returns:
	None

Set the gap of this bounding box to abs(Tol).") SetGap;
		void SetGap (const Standard_Real Tol);
		%feature("autodoc", "Args:
	Tol(Standard_Real)

Returns:
	None

Enlarges the      box    with    a   tolerance   value.  
         (minvalues-Abs(<tol>) and maxvalues+Abs(<tol>))  
//!	This means that the minimum values of its X, Y and Z  
intervals of definition, when they are finite, are reduced by  
the absolute value of Tol, while the maximum values are  
increased by the same amount.") Enlarge;
		void Enlarge (const Standard_Real Tol);
		%feature("autodoc", "Args:
	aXmin(Standard_Real)
	aYmin(Standard_Real)
	aZmin(Standard_Real)
	aXmax(Standard_Real)
	aYmax(Standard_Real)
	aZmax(Standard_Real)

Returns:
	None

Returns the bounds of this bounding box. The gap is included.  
If this bounding box is infinite (i.e. 'open'), returned values  
may be equal to +/- Precision::Infinite().  
if IsVoid()") Get;
		void Get (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	None

The   Box will be   infinitely   long  in the Xmin  
         direction.") OpenXmin;
		void OpenXmin ();
		%feature("autodoc", "Args:
	None
Returns:
	None

The   Box will be   infinitely   long  in the Xmax  
         direction.") OpenXmax;
		void OpenXmax ();
		%feature("autodoc", "Args:
	None
Returns:
	None

The   Box will be   infinitely   long  in the Ymin  
         direction.") OpenYmin;
		void OpenYmin ();
		%feature("autodoc", "Args:
	None
Returns:
	None

The   Box will be   infinitely   long  in the Ymax  
         direction.") OpenYmax;
		void OpenYmax ();
		%feature("autodoc", "Args:
	None
Returns:
	None

The   Box will be   infinitely   long  in the Zmin  
         direction.") OpenZmin;
		void OpenZmin ();
		%feature("autodoc", "Args:
	None
Returns:
	None

The   Box will be   infinitely   long  in the Zmax  
         direction.") OpenZmax;
		void OpenZmax ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if this bounding box is open in the  Xmin direction.") IsOpenXmin;
		Standard_Boolean IsOpenXmin ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if this bounding box is open in the  Xmax direction.") IsOpenXmax;
		Standard_Boolean IsOpenXmax ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if this bounding box is open in the  Ymix direction.") IsOpenYmin;
		Standard_Boolean IsOpenYmin ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if this bounding box is open in the  Ymax direction.") IsOpenYmax;
		Standard_Boolean IsOpenYmax ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if this bounding box is open in the  Zmin direction.") IsOpenZmin;
		Standard_Boolean IsOpenZmin ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if this bounding box is open in the  Zmax  direction.") IsOpenZmax;
		Standard_Boolean IsOpenZmax ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if this bounding box is infinite in all 6 directions (WholeSpace flag).") IsWhole;
		Standard_Boolean IsWhole ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if this bounding box is empty (Void flag).") IsVoid;
		Standard_Boolean IsVoid ();
		%feature("autodoc", "Args:
	tol(Standard_Real)

Returns:
	Standard_Boolean

true if xmax-xmin < tol.") IsXThin;
		Standard_Boolean IsXThin (const Standard_Real tol);
		%feature("autodoc", "Args:
	tol(Standard_Real)

Returns:
	Standard_Boolean

true if ymax-ymin < tol.") IsYThin;
		Standard_Boolean IsYThin (const Standard_Real tol);
		%feature("autodoc", "Args:
	tol(Standard_Real)

Returns:
	Standard_Boolean

true if zmax-zmin < tol.") IsZThin;
		Standard_Boolean IsZThin (const Standard_Real tol);
		%feature("autodoc", "Args:
	tol(Standard_Real)

Returns:
	Standard_Boolean

Returns true if IsXThin, IsYThin and IsZThin are all true,  
i.e. if the box is thin in all three dimensions.") IsThin;
		Standard_Boolean IsThin (const Standard_Real tol);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	Bnd_Box

Returns a bounding box which is the result of applying the  
transformation T to this bounding box.  
Warning  
Applying a geometric transformation (for example, a  
rotation) to a bounding box generally increases its  
dimensions. This is not optimal for algorithms which use it.") Transformed;
		Bnd_Box Transformed (const gp_Trsf & T);
		%feature("autodoc", "Args:
	Other(Bnd_Box)

Returns:
	None

Adds the box <Other> to <self>.") Add;
		void Add (const Bnd_Box & Other);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

Adds a Pnt to the box.") Add;
		void Add (const gp_Pnt & P);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	D(gp_Dir)

Returns:
	None

Extends  <self> from the Pnt <P> in the direction <D>.") Add;
		void Add (const gp_Pnt & P,const gp_Dir & D);
		%feature("autodoc", "Args:
	D(gp_Dir)

Returns:
	None

Extends the Box  in the given Direction, i.e. adds  
         an  half-line. The   box  may become   infinite in  
         1,2 or 3 directions.") Add;
		void Add (const gp_Dir & D);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	Standard_Boolean

Returns True if the Pnt is out the box.") IsOut;
		Standard_Boolean IsOut (const gp_Pnt & P);
		%feature("autodoc", "Args:
	L(gp_Lin)

Returns:
	Standard_Boolean

Returns False if the line intersects the box.") IsOut;
		Standard_Boolean IsOut (const gp_Lin & L);
		%feature("autodoc", "Args:
	P(gp_Pln)

Returns:
	Standard_Boolean

Returns False if the plane intersects the box.") IsOut;
		Standard_Boolean IsOut (const gp_Pln & P);
		%feature("autodoc", "Args:
	Other(Bnd_Box)

Returns:
	Standard_Boolean

Returns False if the <Box> intersects or is inside <self>.") IsOut;
		Standard_Boolean IsOut (const Bnd_Box & Other);
		%feature("autodoc", "Args:
	Other(Bnd_Box)
	T(gp_Trsf)

Returns:
	Standard_Boolean

Returns False if  the transformed <Box> intersects  
         or  is inside <self>.") IsOut;
		Standard_Boolean IsOut (const Bnd_Box & Other,const gp_Trsf & T);
		%feature("autodoc", "Args:
	T1(gp_Trsf)
	Other(Bnd_Box)
	T2(gp_Trsf)

Returns:
	Standard_Boolean

Returns False  if the transformed <Box> intersects  
         or  is inside the transformed box <self>.") IsOut;
		Standard_Boolean IsOut (const gp_Trsf & T1,const Bnd_Box & Other,const gp_Trsf & T2);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)
	D(gp_Dir)

Returns:
	Standard_Boolean

Returns False  if the flat band lying between two parallel  
   	    lines represented by their reference points <P1>, <P2> and  
         direction <D> intersects the box.") IsOut;
		Standard_Boolean IsOut (const gp_Pnt & P1,const gp_Pnt & P2,const gp_Dir & D);
		%feature("autodoc", "Args:
	Other(Bnd_Box)

Returns:
	Standard_Real

Computes the minimum distance between two boxes.") Distance;
		Standard_Real Distance (const Bnd_Box & Other);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dump;
		void Dump ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Computes the squared diagonal of me.") SquareExtent;
		Standard_Real SquareExtent ();
};


%feature("shadow") Bnd_Box::~Bnd_Box %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Bnd_Box {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Bnd_Box2d;
class Bnd_Box2d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an empty 2D bounding box.  
The constructed box is qualified Void. Its gap is null.") Bnd_Box2d;
		 Bnd_Box2d ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Sets this bounding box so that it covers the whole 2D  
space, i.e. it is infinite in all directions.") SetWhole;
		void SetWhole ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Sets this 2D bounding box so that it is empty. All points are outside a void box.") SetVoid;
		void SetVoid ();
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	None

Sets this 2D bounding box so that it bounds  
  the point P. This involves first setting this bounding box  
  to be void and then adding the point PThe rectangle bounds   the  point <P>.") Set;
		void Set (const gp_Pnt2d & P);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	D(gp_Dir2d)

Returns:
	None

Sets this 2D bounding box so that it bounds  
the half-line defined by point P and direction D, i.e. all  
  points M defined by M=P+u*D, where u is greater than  
  or equal to 0, are inside the bounding area. This involves  
  first setting this 2D box to be void and then adding the   half-line.") Set;
		void Set (const gp_Pnt2d & P,const gp_Dir2d & D);
		%feature("autodoc", "Args:
	aXmin(Standard_Real)
	aYmin(Standard_Real)
	aXmax(Standard_Real)
	aYmax(Standard_Real)

Returns:
	None

Enlarges this 2D bounding box, if required, so that it  
         contains at least:  
  -   interval [ aXmin,aXmax ] in the 'X Direction',  
  -   interval [ aYmin,aYmax ] in the 'Y Direction'") Update;
		void Update (const Standard_Real aXmin,const Standard_Real aYmin,const Standard_Real aXmax,const Standard_Real aYmax);
		%feature("autodoc", "Args:
	X(Standard_Real)
	Y(Standard_Real)

Returns:
	None

Adds a point of coordinates (X,Y) to this bounding box.") Update;
		void Update (const Standard_Real X,const Standard_Real Y);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the gap of this 2D bounding box.") GetGap;
		Standard_Real GetGap ();
		%feature("autodoc", "Args:
	Tol(Standard_Real)

Returns:
	None

Set the gap of this 2D bounding box to abs(Tol).") SetGap;
		void SetGap (const Standard_Real Tol);
		%feature("autodoc", "Args:
	Tol(Standard_Real)

Returns:
	None

Enlarges     the  box  with    a  tolerance  value.  
  This means that the minimum values of its X and Y  
intervals of definition, when they are finite, are reduced by  
the absolute value of Tol, while the maximum values are  
increased by the same amount.") Enlarge;
		void Enlarge (const Standard_Real Tol);
		%feature("autodoc", "Args:
	aXmin(Standard_Real)
	aYmin(Standard_Real)
	aXmax(Standard_Real)
	aYmax(Standard_Real)

Returns:
	None

Returns the bounds of this 2D bounding box.  
The gap is included. If this bounding box is infinite (i.e. 'open'), returned values  
may be equal to +/- Precision::Infinite().  
if IsVoid()") Get;
		void Get (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	None

The Box will be infinitely long in the Xmin direction.") OpenXmin;
		void OpenXmin ();
		%feature("autodoc", "Args:
	None
Returns:
	None

The Box will be infinitely long in the Xmax direction.") OpenXmax;
		void OpenXmax ();
		%feature("autodoc", "Args:
	None
Returns:
	None

The Box will be infinitely long in the Ymin direction.") OpenYmin;
		void OpenYmin ();
		%feature("autodoc", "Args:
	None
Returns:
	None

The Box will be infinitely long in the Ymax direction.") OpenYmax;
		void OpenYmax ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if this bounding box is open in the Xmin direction.") IsOpenXmin;
		Standard_Boolean IsOpenXmin ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if this bounding box is open in the Xmax direction.") IsOpenXmax;
		Standard_Boolean IsOpenXmax ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if this bounding box is open in the Ymin direction.") IsOpenYmin;
		Standard_Boolean IsOpenYmin ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if this bounding box is open in the Ymax direction.") IsOpenYmax;
		Standard_Boolean IsOpenYmax ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if this bounding box is infinite in all 4  
directions (Whole Space flag).") IsWhole;
		Standard_Boolean IsWhole ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if this 2D bounding box is empty (Void flag).") IsVoid;
		Standard_Boolean IsVoid ();
		%feature("autodoc", "Args:
	T(gp_Trsf2d)

Returns:
	Bnd_Box2d

Returns a bounding box which is the result of applying the  
transformation T to this bounding box.  
Warning  
Applying a geometric transformation (for example, a  
rotation) to a bounding box generally increases its  
dimensions. This is not optimal for algorithms which use it.") Transformed;
		Bnd_Box2d Transformed (const gp_Trsf2d & T);
		%feature("autodoc", "Args:
	Other(Bnd_Box2d)

Returns:
	None

Adds the 2d box <Other> to <self>.") Add;
		void Add (const Bnd_Box2d & Other);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	None

Adds  the 2d pnt <P> to <self>.") Add;
		void Add (const gp_Pnt2d & P);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	D(gp_Dir2d)

Returns:
	None

Extends <self> from the Pnt <P> in the direction <D>.") Add;
		void Add (const gp_Pnt2d & P,const gp_Dir2d & D);
		%feature("autodoc", "Args:
	D(gp_Dir2d)

Returns:
	None

Extends the Box  in the given Direction, i.e. adds  
         a half-line. The box may become infinite in 1 or 2  
         directions.") Add;
		void Add (const gp_Dir2d & D);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	Standard_Boolean

Returns True if the 2d pnt <P> is out <self>.") IsOut;
		Standard_Boolean IsOut (const gp_Pnt2d & P);
		%feature("autodoc", "Args:
	Other(Bnd_Box2d)

Returns:
	Standard_Boolean

Returns True if <Box2d> is out <self>.") IsOut;
		Standard_Boolean IsOut (const Bnd_Box2d & Other);
		%feature("autodoc", "Args:
	Other(Bnd_Box2d)
	T(gp_Trsf2d)

Returns:
	Standard_Boolean

Returns True if transformed <Box2d> is out <self>.") IsOut;
		Standard_Boolean IsOut (const Bnd_Box2d & Other,const gp_Trsf2d & T);
		%feature("autodoc", "Args:
	T1(gp_Trsf2d)
	Other(Bnd_Box2d)
	T2(gp_Trsf2d)

Returns:
	Standard_Boolean

Compares  a transformed  bounding with  a    transformed  
         bounding. The default implementation is  to make a copy  
         of <self> and <Other>, to transform them and to test.") IsOut;
		Standard_Boolean IsOut (const gp_Trsf2d & T1,const Bnd_Box2d & Other,const gp_Trsf2d & T2);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dump;
		void Dump ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Computes the squared diagonal of me.") SquareExtent;
		Standard_Real SquareExtent ();
};


%feature("shadow") Bnd_Box2d::~Bnd_Box2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Bnd_Box2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Bnd_HArray1OfBox;
class Bnd_HArray1OfBox : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Bnd_HArray1OfBox;
		 Bnd_HArray1OfBox (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(Bnd_Box)

Returns:
	None

No detailed docstring for this function.") Bnd_HArray1OfBox;
		 Bnd_HArray1OfBox (const Standard_Integer Low,const Standard_Integer Up,const Bnd_Box & V);
		%feature("autodoc", "Args:
	V(Bnd_Box)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Bnd_Box & V);
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
	Value(Bnd_Box)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Bnd_Box & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Bnd_Box

No detailed docstring for this function.") Value;
		const Bnd_Box & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Bnd_Box

No detailed docstring for this function.") ChangeValue;
		Bnd_Box & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Bnd_Array1OfBox

No detailed docstring for this function.") Array1;
		const Bnd_Array1OfBox & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Bnd_Array1OfBox

No detailed docstring for this function.") ChangeArray1;
		Bnd_Array1OfBox & ChangeArray1 ();
};


%feature("shadow") Bnd_HArray1OfBox::~Bnd_HArray1OfBox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Bnd_HArray1OfBox {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Bnd_HArray1OfBox {
	Handle_Bnd_HArray1OfBox GetHandle() {
	return *(Handle_Bnd_HArray1OfBox*) &$self;
	}
};

%nodefaultctor Handle_Bnd_HArray1OfBox;
class Handle_Bnd_HArray1OfBox : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Bnd_HArray1OfBox();
        Handle_Bnd_HArray1OfBox(const Handle_Bnd_HArray1OfBox &aHandle);
        Handle_Bnd_HArray1OfBox(const Bnd_HArray1OfBox *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Bnd_HArray1OfBox DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Bnd_HArray1OfBox {
    Bnd_HArray1OfBox* GetObject() {
    return (Bnd_HArray1OfBox*)$self->Access();
    }
};
%feature("shadow") Handle_Bnd_HArray1OfBox::~Handle_Bnd_HArray1OfBox %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Bnd_HArray1OfBox {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Bnd_HArray1OfBox2d;
class Bnd_HArray1OfBox2d : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Bnd_HArray1OfBox2d;
		 Bnd_HArray1OfBox2d (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(Bnd_Box2d)

Returns:
	None

No detailed docstring for this function.") Bnd_HArray1OfBox2d;
		 Bnd_HArray1OfBox2d (const Standard_Integer Low,const Standard_Integer Up,const Bnd_Box2d & V);
		%feature("autodoc", "Args:
	V(Bnd_Box2d)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Bnd_Box2d & V);
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
	Value(Bnd_Box2d)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Bnd_Box2d & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Bnd_Box2d

No detailed docstring for this function.") Value;
		const Bnd_Box2d & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Bnd_Box2d

No detailed docstring for this function.") ChangeValue;
		Bnd_Box2d & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Bnd_Array1OfBox2d

No detailed docstring for this function.") Array1;
		const Bnd_Array1OfBox2d & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Bnd_Array1OfBox2d

No detailed docstring for this function.") ChangeArray1;
		Bnd_Array1OfBox2d & ChangeArray1 ();
};


%feature("shadow") Bnd_HArray1OfBox2d::~Bnd_HArray1OfBox2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Bnd_HArray1OfBox2d {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Bnd_HArray1OfBox2d {
	Handle_Bnd_HArray1OfBox2d GetHandle() {
	return *(Handle_Bnd_HArray1OfBox2d*) &$self;
	}
};

%nodefaultctor Handle_Bnd_HArray1OfBox2d;
class Handle_Bnd_HArray1OfBox2d : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Bnd_HArray1OfBox2d();
        Handle_Bnd_HArray1OfBox2d(const Handle_Bnd_HArray1OfBox2d &aHandle);
        Handle_Bnd_HArray1OfBox2d(const Bnd_HArray1OfBox2d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Bnd_HArray1OfBox2d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Bnd_HArray1OfBox2d {
    Bnd_HArray1OfBox2d* GetObject() {
    return (Bnd_HArray1OfBox2d*)$self->Access();
    }
};
%feature("shadow") Handle_Bnd_HArray1OfBox2d::~Handle_Bnd_HArray1OfBox2d %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Bnd_HArray1OfBox2d {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Bnd_HArray1OfSphere;
class Bnd_HArray1OfSphere : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Bnd_HArray1OfSphere;
		 Bnd_HArray1OfSphere (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(Bnd_Sphere)

Returns:
	None

No detailed docstring for this function.") Bnd_HArray1OfSphere;
		 Bnd_HArray1OfSphere (const Standard_Integer Low,const Standard_Integer Up,const Bnd_Sphere & V);
		%feature("autodoc", "Args:
	V(Bnd_Sphere)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Bnd_Sphere & V);
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
	Value(Bnd_Sphere)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Bnd_Sphere & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Bnd_Sphere

No detailed docstring for this function.") Value;
		const Bnd_Sphere & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Bnd_Sphere

No detailed docstring for this function.") ChangeValue;
		Bnd_Sphere & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Bnd_Array1OfSphere

No detailed docstring for this function.") Array1;
		const Bnd_Array1OfSphere & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Bnd_Array1OfSphere

No detailed docstring for this function.") ChangeArray1;
		Bnd_Array1OfSphere & ChangeArray1 ();
};


%feature("shadow") Bnd_HArray1OfSphere::~Bnd_HArray1OfSphere %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Bnd_HArray1OfSphere {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Bnd_HArray1OfSphere {
	Handle_Bnd_HArray1OfSphere GetHandle() {
	return *(Handle_Bnd_HArray1OfSphere*) &$self;
	}
};

%nodefaultctor Handle_Bnd_HArray1OfSphere;
class Handle_Bnd_HArray1OfSphere : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Bnd_HArray1OfSphere();
        Handle_Bnd_HArray1OfSphere(const Handle_Bnd_HArray1OfSphere &aHandle);
        Handle_Bnd_HArray1OfSphere(const Bnd_HArray1OfSphere *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Bnd_HArray1OfSphere DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Bnd_HArray1OfSphere {
    Bnd_HArray1OfSphere* GetObject() {
    return (Bnd_HArray1OfSphere*)$self->Access();
    }
};
%feature("shadow") Handle_Bnd_HArray1OfSphere::~Handle_Bnd_HArray1OfSphere %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Bnd_HArray1OfSphere {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Bnd_SeqOfBox;
class Bnd_SeqOfBox : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Bnd_SeqOfBox;
		 Bnd_SeqOfBox ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Bnd_SeqOfBox)

Returns:
	Bnd_SeqOfBox

No detailed docstring for this function.") Assign;
		const Bnd_SeqOfBox & Assign (const Bnd_SeqOfBox & Other);
		%feature("autodoc", "Args:
	Other(Bnd_SeqOfBox)

Returns:
	Bnd_SeqOfBox

No detailed docstring for this function.") operator=;
		const Bnd_SeqOfBox & operator = (const Bnd_SeqOfBox & Other);
		%feature("autodoc", "Args:
	T(Bnd_Box)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Bnd_Box & T);
		%feature("autodoc", "Args:
	S(Bnd_SeqOfBox)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Bnd_SeqOfBox & S);
		%feature("autodoc", "Args:
	T(Bnd_Box)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Bnd_Box & T);
		%feature("autodoc", "Args:
	S(Bnd_SeqOfBox)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Bnd_SeqOfBox & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Bnd_Box)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Bnd_Box & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Bnd_SeqOfBox)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Bnd_SeqOfBox & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Bnd_Box)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Bnd_Box & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Bnd_SeqOfBox)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Bnd_SeqOfBox & S);
		%feature("autodoc", "Args:
	None
Returns:
	Bnd_Box

No detailed docstring for this function.") First;
		const Bnd_Box & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Bnd_Box

No detailed docstring for this function.") Last;
		const Bnd_Box & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Bnd_SeqOfBox)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Bnd_SeqOfBox & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Bnd_Box

No detailed docstring for this function.") Value;
		const Bnd_Box & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Bnd_Box)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Bnd_Box & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Bnd_Box

No detailed docstring for this function.") ChangeValue;
		Bnd_Box & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") Bnd_SeqOfBox::~Bnd_SeqOfBox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Bnd_SeqOfBox {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Bnd_SequenceNodeOfSeqOfBox;
class Bnd_SequenceNodeOfSeqOfBox : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Bnd_Box)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Bnd_SequenceNodeOfSeqOfBox;
		 Bnd_SequenceNodeOfSeqOfBox (const Bnd_Box & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Bnd_Box

No detailed docstring for this function.") Value;
		Bnd_Box & Value ();
};


%feature("shadow") Bnd_SequenceNodeOfSeqOfBox::~Bnd_SequenceNodeOfSeqOfBox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Bnd_SequenceNodeOfSeqOfBox {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Bnd_SequenceNodeOfSeqOfBox {
	Handle_Bnd_SequenceNodeOfSeqOfBox GetHandle() {
	return *(Handle_Bnd_SequenceNodeOfSeqOfBox*) &$self;
	}
};

%nodefaultctor Handle_Bnd_SequenceNodeOfSeqOfBox;
class Handle_Bnd_SequenceNodeOfSeqOfBox : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Bnd_SequenceNodeOfSeqOfBox();
        Handle_Bnd_SequenceNodeOfSeqOfBox(const Handle_Bnd_SequenceNodeOfSeqOfBox &aHandle);
        Handle_Bnd_SequenceNodeOfSeqOfBox(const Bnd_SequenceNodeOfSeqOfBox *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Bnd_SequenceNodeOfSeqOfBox DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Bnd_SequenceNodeOfSeqOfBox {
    Bnd_SequenceNodeOfSeqOfBox* GetObject() {
    return (Bnd_SequenceNodeOfSeqOfBox*)$self->Access();
    }
};
%feature("shadow") Handle_Bnd_SequenceNodeOfSeqOfBox::~Handle_Bnd_SequenceNodeOfSeqOfBox %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Bnd_SequenceNodeOfSeqOfBox {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Bnd_Sphere;
class Bnd_Sphere {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor") Bnd_Sphere;
		 Bnd_Sphere ();
		%feature("autodoc", "Args:
	theCntr(gp_XYZ)
	theRad(Standard_Real)
	theU(Standard_Integer)
	theV(Standard_Integer)

Returns:
	None

Constructor of a definite sphere") Bnd_Sphere;
		 Bnd_Sphere (const gp_XYZ & theCntr,const Standard_Real theRad,const Standard_Integer theU,const Standard_Integer theV);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the U parameter on shape") U;
		Standard_Integer U ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the V parameter on shape") V;
		Standard_Integer V ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns validity status, indicating that this  
//!		sphere corresponds to a real entity") IsValid;
		Standard_Boolean IsValid ();
		%feature("autodoc", "Args:
	isValid(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetValid;
		void SetValid (const Standard_Boolean isValid);
		%feature("autodoc", "Args:
	None
Returns:
	gp_XYZ

Returns center of sphere object") Center;
		const gp_XYZ & Center ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the radius value") Radius;
		Standard_Real Radius ();
		%feature("autodoc", "Args:
	theXYZ(gp_XYZ)
	theMin(Standard_Real)
	theMax(Standard_Real)

Returns:
	None

Calculate and return minimal and maximal distance to sphere.  
//!		NOTE: This function is tightly optimized; any modifications  
//!		may affect performance!") Distances;
		void Distances (const gp_XYZ & theXYZ,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	theXYZ(gp_XYZ)
	theMin(Standard_Real)
	theMax(Standard_Real)

Returns:
	None

Calculate and return minimal and maximal distance to sphere.  
//!		NOTE: This function is tightly optimized; any modifications  
//!		may affect performance!") SquareDistances;
		void SquareDistances (const gp_XYZ & theXYZ,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	theNode(gp_XYZ)
	theProjNode(gp_XYZ)
	theDist(Standard_Real)
	theInside(Standard_Boolean)

Returns:
	Standard_Boolean

Projects a point on entity.  
//!		   Returns true if success") Project;
		Standard_Boolean Project (const gp_XYZ & theNode,gp_XYZ & theProjNode,Standard_Real &OutValue,Standard_Boolean & theInside);
		%feature("autodoc", "Args:
	theNode(gp_XYZ)

Returns:
	Standard_Real

No detailed docstring for this function.") Distance;
		Standard_Real Distance (const gp_XYZ & theNode);
		%feature("autodoc", "Args:
	theNode(gp_XYZ)

Returns:
	Standard_Real

No detailed docstring for this function.") SquareDistance;
		Standard_Real SquareDistance (const gp_XYZ & theNode);
		%feature("autodoc", "Args:
	theOther(Bnd_Sphere)

Returns:
	None

No detailed docstring for this function.") Add;
		void Add (const Bnd_Sphere & theOther);
		%feature("autodoc", "Args:
	theOther(Bnd_Sphere)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsOut;
		Standard_Boolean IsOut (const Bnd_Sphere & theOther);
		%feature("autodoc", "Args:
	thePnt(gp_XYZ)
	theMaxDist(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsOut;
		Standard_Boolean IsOut (const gp_XYZ & thePnt,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") SquareExtent;
		Standard_Real SquareExtent ();
};


%feature("shadow") Bnd_Sphere::~Bnd_Sphere %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Bnd_Sphere {
	void _kill_pointed() {
		delete $self;
	}
};
