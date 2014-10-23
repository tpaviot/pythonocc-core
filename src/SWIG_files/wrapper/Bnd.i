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
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Bnd_Array1OfBox;
		 Bnd_Array1OfBox (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Item:
	:type Item: Bnd_Box &
	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Bnd_Array1OfBox;
		 Bnd_Array1OfBox (const Bnd_Box & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param V:
	:type V: Bnd_Box &
	:rtype: None
") Init;
		void Init (const Bnd_Box & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "	:param Other:
	:type Other: Bnd_Array1OfBox &
	:rtype: Bnd_Array1OfBox
") Assign;
		const Bnd_Array1OfBox & Assign (const Bnd_Array1OfBox & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Bnd_Array1OfBox &
	:rtype: Bnd_Array1OfBox
") operator=;
		const Bnd_Array1OfBox & operator = (const Bnd_Array1OfBox & Other);
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
	:type Value: Bnd_Box &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Bnd_Box & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Bnd_Box
") Value;
		const Bnd_Box & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Bnd_Box
") ChangeValue;
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
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Bnd_Array1OfBox2d;
		 Bnd_Array1OfBox2d (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Item:
	:type Item: Bnd_Box2d &
	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Bnd_Array1OfBox2d;
		 Bnd_Array1OfBox2d (const Bnd_Box2d & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param V:
	:type V: Bnd_Box2d &
	:rtype: None
") Init;
		void Init (const Bnd_Box2d & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "	:param Other:
	:type Other: Bnd_Array1OfBox2d &
	:rtype: Bnd_Array1OfBox2d
") Assign;
		const Bnd_Array1OfBox2d & Assign (const Bnd_Array1OfBox2d & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Bnd_Array1OfBox2d &
	:rtype: Bnd_Array1OfBox2d
") operator=;
		const Bnd_Array1OfBox2d & operator = (const Bnd_Array1OfBox2d & Other);
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
	:type Value: Bnd_Box2d &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Bnd_Box2d & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Bnd_Box2d
") Value;
		const Bnd_Box2d & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Bnd_Box2d
") ChangeValue;
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
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Bnd_Array1OfSphere;
		 Bnd_Array1OfSphere (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Item:
	:type Item: Bnd_Sphere &
	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Bnd_Array1OfSphere;
		 Bnd_Array1OfSphere (const Bnd_Sphere & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param V:
	:type V: Bnd_Sphere &
	:rtype: None
") Init;
		void Init (const Bnd_Sphere & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "	:param Other:
	:type Other: Bnd_Array1OfSphere &
	:rtype: Bnd_Array1OfSphere
") Assign;
		const Bnd_Array1OfSphere & Assign (const Bnd_Array1OfSphere & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Bnd_Array1OfSphere &
	:rtype: Bnd_Array1OfSphere
") operator=;
		const Bnd_Array1OfSphere & operator = (const Bnd_Array1OfSphere & Other);
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
	:type Value: Bnd_Sphere &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Bnd_Sphere & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Bnd_Sphere
") Value;
		const Bnd_Sphere & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Bnd_Sphere
") ChangeValue;
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
		%feature("autodoc", "	:rtype: None
") Bnd_B2d;
		 Bnd_B2d ();
		%feature("autodoc", "	:param theCenter:
	:type theCenter: gp_XY
	:param theHSize:
	:type theHSize: gp_XY
	:rtype: None
") Bnd_B2d;
		 Bnd_B2d (const gp_XY & theCenter,const gp_XY & theHSize);
		%feature("autodoc", "	:rtype: bool
") IsVoid;
		Standard_Boolean IsVoid ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param thePnt:
	:type thePnt: gp_XY
	:rtype: None
") Add;
		void Add (const gp_XY & thePnt);
		%feature("autodoc", "	:param thePnt:
	:type thePnt: gp_Pnt2d
	:rtype: None
") Add;
		void Add (const gp_Pnt2d & thePnt);
		%feature("autodoc", "	:param theBox:
	:type theBox: Bnd_B2d &
	:rtype: None
") Add;
		void Add (const Bnd_B2d & theBox);
		%feature("autodoc", "	:rtype: gp_XY
") CornerMin;
		gp_XY CornerMin ();
		%feature("autodoc", "	:rtype: gp_XY
") CornerMax;
		gp_XY CornerMax ();
		%feature("autodoc", "	:rtype: float
") SquareExtent;
		Standard_Real SquareExtent ();
		%feature("autodoc", "	:param theDiff:
	:type theDiff: float
	:rtype: None
") Enlarge;
		void Enlarge (const Standard_Real theDiff);
		%feature("autodoc", "	:param theOtherBox:
	:type theOtherBox: Bnd_B2d &
	:rtype: bool
") Limit;
		Standard_Boolean Limit (const Bnd_B2d & theOtherBox);
		%feature("autodoc", "	:param theTrsf:
	:type theTrsf: gp_Trsf2d
	:rtype: Bnd_B2d
") Transformed;
		Bnd_B2d Transformed (const gp_Trsf2d & theTrsf);
		%feature("autodoc", "	:param thePnt:
	:type thePnt: gp_XY
	:rtype: bool
") IsOut;
		Standard_Boolean IsOut (const gp_XY & thePnt);
		%feature("autodoc", "	:param theCenter:
	:type theCenter: gp_XY
	:param theRadius:
	:type theRadius: float
	:param isCircleHollow: default value is Standard_False
	:type isCircleHollow: bool
	:rtype: bool
") IsOut;
		Standard_Boolean IsOut (const gp_XY & theCenter,const Standard_Real theRadius,const Standard_Boolean isCircleHollow = Standard_False);
		%feature("autodoc", "	:param theOtherBox:
	:type theOtherBox: Bnd_B2d &
	:rtype: bool
") IsOut;
		Standard_Boolean IsOut (const Bnd_B2d & theOtherBox);
		%feature("autodoc", "	:param theOtherBox:
	:type theOtherBox: Bnd_B2d &
	:param theTrsf:
	:type theTrsf: gp_Trsf2d
	:rtype: bool
") IsOut;
		Standard_Boolean IsOut (const Bnd_B2d & theOtherBox,const gp_Trsf2d & theTrsf);
		%feature("autodoc", "	:param theLine:
	:type theLine: gp_Ax2d
	:rtype: bool
") IsOut;
		Standard_Boolean IsOut (const gp_Ax2d & theLine);
		%feature("autodoc", "	:param theP0:
	:type theP0: gp_XY
	:param theP1:
	:type theP1: gp_XY
	:rtype: bool
") IsOut;
		Standard_Boolean IsOut (const gp_XY & theP0,const gp_XY & theP1);
		%feature("autodoc", "	:param theBox:
	:type theBox: Bnd_B2d &
	:rtype: bool
") IsIn;
		Standard_Boolean IsIn (const Bnd_B2d & theBox);
		%feature("autodoc", "	:param theBox:
	:type theBox: Bnd_B2d &
	:param theTrsf:
	:type theTrsf: gp_Trsf2d
	:rtype: bool
") IsIn;
		Standard_Boolean IsIn (const Bnd_B2d & theBox,const gp_Trsf2d & theTrsf);
		%feature("autodoc", "	:param theCenter:
	:type theCenter: gp_XY
	:rtype: None
") SetCenter;
		void SetCenter (const gp_XY & theCenter);
		%feature("autodoc", "	:param theHSize:
	:type theHSize: gp_XY
	:rtype: None
") SetHSize;
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
		%feature("autodoc", "	:rtype: None
") Bnd_B2f;
		 Bnd_B2f ();
		%feature("autodoc", "	:param theCenter:
	:type theCenter: gp_XY
	:param theHSize:
	:type theHSize: gp_XY
	:rtype: None
") Bnd_B2f;
		 Bnd_B2f (const gp_XY & theCenter,const gp_XY & theHSize);
		%feature("autodoc", "	:rtype: bool
") IsVoid;
		Standard_Boolean IsVoid ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param thePnt:
	:type thePnt: gp_XY
	:rtype: None
") Add;
		void Add (const gp_XY & thePnt);
		%feature("autodoc", "	:param thePnt:
	:type thePnt: gp_Pnt2d
	:rtype: None
") Add;
		void Add (const gp_Pnt2d & thePnt);
		%feature("autodoc", "	:param theBox:
	:type theBox: Bnd_B2f &
	:rtype: None
") Add;
		void Add (const Bnd_B2f & theBox);
		%feature("autodoc", "	:rtype: gp_XY
") CornerMin;
		gp_XY CornerMin ();
		%feature("autodoc", "	:rtype: gp_XY
") CornerMax;
		gp_XY CornerMax ();
		%feature("autodoc", "	:rtype: float
") SquareExtent;
		Standard_Real SquareExtent ();
		%feature("autodoc", "	:param theDiff:
	:type theDiff: float
	:rtype: None
") Enlarge;
		void Enlarge (const Standard_Real theDiff);
		%feature("autodoc", "	:param theOtherBox:
	:type theOtherBox: Bnd_B2f &
	:rtype: bool
") Limit;
		Standard_Boolean Limit (const Bnd_B2f & theOtherBox);
		%feature("autodoc", "	:param theTrsf:
	:type theTrsf: gp_Trsf2d
	:rtype: Bnd_B2f
") Transformed;
		Bnd_B2f Transformed (const gp_Trsf2d & theTrsf);
		%feature("autodoc", "	:param thePnt:
	:type thePnt: gp_XY
	:rtype: bool
") IsOut;
		Standard_Boolean IsOut (const gp_XY & thePnt);
		%feature("autodoc", "	:param theCenter:
	:type theCenter: gp_XY
	:param theRadius:
	:type theRadius: float
	:param isCircleHollow: default value is Standard_False
	:type isCircleHollow: bool
	:rtype: bool
") IsOut;
		Standard_Boolean IsOut (const gp_XY & theCenter,const Standard_Real theRadius,const Standard_Boolean isCircleHollow = Standard_False);
		%feature("autodoc", "	:param theOtherBox:
	:type theOtherBox: Bnd_B2f &
	:rtype: bool
") IsOut;
		Standard_Boolean IsOut (const Bnd_B2f & theOtherBox);
		%feature("autodoc", "	:param theOtherBox:
	:type theOtherBox: Bnd_B2f &
	:param theTrsf:
	:type theTrsf: gp_Trsf2d
	:rtype: bool
") IsOut;
		Standard_Boolean IsOut (const Bnd_B2f & theOtherBox,const gp_Trsf2d & theTrsf);
		%feature("autodoc", "	:param theLine:
	:type theLine: gp_Ax2d
	:rtype: bool
") IsOut;
		Standard_Boolean IsOut (const gp_Ax2d & theLine);
		%feature("autodoc", "	:param theP0:
	:type theP0: gp_XY
	:param theP1:
	:type theP1: gp_XY
	:rtype: bool
") IsOut;
		Standard_Boolean IsOut (const gp_XY & theP0,const gp_XY & theP1);
		%feature("autodoc", "	:param theBox:
	:type theBox: Bnd_B2f &
	:rtype: bool
") IsIn;
		Standard_Boolean IsIn (const Bnd_B2f & theBox);
		%feature("autodoc", "	:param theBox:
	:type theBox: Bnd_B2f &
	:param theTrsf:
	:type theTrsf: gp_Trsf2d
	:rtype: bool
") IsIn;
		Standard_Boolean IsIn (const Bnd_B2f & theBox,const gp_Trsf2d & theTrsf);
		%feature("autodoc", "	:param theCenter:
	:type theCenter: gp_XY
	:rtype: None
") SetCenter;
		void SetCenter (const gp_XY & theCenter);
		%feature("autodoc", "	:param theHSize:
	:type theHSize: gp_XY
	:rtype: None
") SetHSize;
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
		%feature("autodoc", "	:rtype: None
") Bnd_B3d;
		 Bnd_B3d ();
		%feature("autodoc", "	:param theCenter:
	:type theCenter: gp_XYZ
	:param theHSize:
	:type theHSize: gp_XYZ
	:rtype: None
") Bnd_B3d;
		 Bnd_B3d (const gp_XYZ & theCenter,const gp_XYZ & theHSize);
		%feature("autodoc", "	:rtype: bool
") IsVoid;
		Standard_Boolean IsVoid ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param thePnt:
	:type thePnt: gp_XYZ
	:rtype: None
") Add;
		void Add (const gp_XYZ & thePnt);
		%feature("autodoc", "	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: None
") Add;
		void Add (const gp_Pnt & thePnt);
		%feature("autodoc", "	:param theBox:
	:type theBox: Bnd_B3d &
	:rtype: None
") Add;
		void Add (const Bnd_B3d & theBox);
		%feature("autodoc", "	:rtype: gp_XYZ
") CornerMin;
		gp_XYZ CornerMin ();
		%feature("autodoc", "	:rtype: gp_XYZ
") CornerMax;
		gp_XYZ CornerMax ();
		%feature("autodoc", "	:rtype: float
") SquareExtent;
		Standard_Real SquareExtent ();
		%feature("autodoc", "	:param theDiff:
	:type theDiff: float
	:rtype: None
") Enlarge;
		void Enlarge (const Standard_Real theDiff);
		%feature("autodoc", "	:param theOtherBox:
	:type theOtherBox: Bnd_B3d &
	:rtype: bool
") Limit;
		Standard_Boolean Limit (const Bnd_B3d & theOtherBox);
		%feature("autodoc", "	:param theTrsf:
	:type theTrsf: gp_Trsf
	:rtype: Bnd_B3d
") Transformed;
		Bnd_B3d Transformed (const gp_Trsf & theTrsf);
		%feature("autodoc", "	:param thePnt:
	:type thePnt: gp_XYZ
	:rtype: bool
") IsOut;
		Standard_Boolean IsOut (const gp_XYZ & thePnt);
		%feature("autodoc", "	:param theCenter:
	:type theCenter: gp_XYZ
	:param theRadius:
	:type theRadius: float
	:param isSphereHollow: default value is Standard_False
	:type isSphereHollow: bool
	:rtype: bool
") IsOut;
		Standard_Boolean IsOut (const gp_XYZ & theCenter,const Standard_Real theRadius,const Standard_Boolean isSphereHollow = Standard_False);
		%feature("autodoc", "	:param theOtherBox:
	:type theOtherBox: Bnd_B3d &
	:rtype: bool
") IsOut;
		Standard_Boolean IsOut (const Bnd_B3d & theOtherBox);
		%feature("autodoc", "	:param theOtherBox:
	:type theOtherBox: Bnd_B3d &
	:param theTrsf:
	:type theTrsf: gp_Trsf
	:rtype: bool
") IsOut;
		Standard_Boolean IsOut (const Bnd_B3d & theOtherBox,const gp_Trsf & theTrsf);
		%feature("autodoc", "	:param theLine:
	:type theLine: gp_Ax1
	:param isRay: default value is Standard_False
	:type isRay: bool
	:param theOverthickness: default value is 0.0
	:type theOverthickness: float
	:rtype: bool
") IsOut;
		Standard_Boolean IsOut (const gp_Ax1 & theLine,const Standard_Boolean isRay = Standard_False,const Standard_Real theOverthickness = 0.0);
		%feature("autodoc", "	:param thePlane:
	:type thePlane: gp_Ax3
	:rtype: bool
") IsOut;
		Standard_Boolean IsOut (const gp_Ax3 & thePlane);
		%feature("autodoc", "	:param theBox:
	:type theBox: Bnd_B3d &
	:rtype: bool
") IsIn;
		Standard_Boolean IsIn (const Bnd_B3d & theBox);
		%feature("autodoc", "	:param theBox:
	:type theBox: Bnd_B3d &
	:param theTrsf:
	:type theTrsf: gp_Trsf
	:rtype: bool
") IsIn;
		Standard_Boolean IsIn (const Bnd_B3d & theBox,const gp_Trsf & theTrsf);
		%feature("autodoc", "	:param theCenter:
	:type theCenter: gp_XYZ
	:rtype: None
") SetCenter;
		void SetCenter (const gp_XYZ & theCenter);
		%feature("autodoc", "	:param theHSize:
	:type theHSize: gp_XYZ
	:rtype: None
") SetHSize;
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
		%feature("autodoc", "	:rtype: None
") Bnd_B3f;
		 Bnd_B3f ();
		%feature("autodoc", "	:param theCenter:
	:type theCenter: gp_XYZ
	:param theHSize:
	:type theHSize: gp_XYZ
	:rtype: None
") Bnd_B3f;
		 Bnd_B3f (const gp_XYZ & theCenter,const gp_XYZ & theHSize);
		%feature("autodoc", "	:rtype: bool
") IsVoid;
		Standard_Boolean IsVoid ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param thePnt:
	:type thePnt: gp_XYZ
	:rtype: None
") Add;
		void Add (const gp_XYZ & thePnt);
		%feature("autodoc", "	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: None
") Add;
		void Add (const gp_Pnt & thePnt);
		%feature("autodoc", "	:param theBox:
	:type theBox: Bnd_B3f &
	:rtype: None
") Add;
		void Add (const Bnd_B3f & theBox);
		%feature("autodoc", "	:rtype: gp_XYZ
") CornerMin;
		gp_XYZ CornerMin ();
		%feature("autodoc", "	:rtype: gp_XYZ
") CornerMax;
		gp_XYZ CornerMax ();
		%feature("autodoc", "	:rtype: float
") SquareExtent;
		Standard_Real SquareExtent ();
		%feature("autodoc", "	:param theDiff:
	:type theDiff: float
	:rtype: None
") Enlarge;
		void Enlarge (const Standard_Real theDiff);
		%feature("autodoc", "	:param theOtherBox:
	:type theOtherBox: Bnd_B3f &
	:rtype: bool
") Limit;
		Standard_Boolean Limit (const Bnd_B3f & theOtherBox);
		%feature("autodoc", "	:param theTrsf:
	:type theTrsf: gp_Trsf
	:rtype: Bnd_B3f
") Transformed;
		Bnd_B3f Transformed (const gp_Trsf & theTrsf);
		%feature("autodoc", "	:param thePnt:
	:type thePnt: gp_XYZ
	:rtype: bool
") IsOut;
		Standard_Boolean IsOut (const gp_XYZ & thePnt);
		%feature("autodoc", "	:param theCenter:
	:type theCenter: gp_XYZ
	:param theRadius:
	:type theRadius: float
	:param isSphereHollow: default value is Standard_False
	:type isSphereHollow: bool
	:rtype: bool
") IsOut;
		Standard_Boolean IsOut (const gp_XYZ & theCenter,const Standard_Real theRadius,const Standard_Boolean isSphereHollow = Standard_False);
		%feature("autodoc", "	:param theOtherBox:
	:type theOtherBox: Bnd_B3f &
	:rtype: bool
") IsOut;
		Standard_Boolean IsOut (const Bnd_B3f & theOtherBox);
		%feature("autodoc", "	:param theOtherBox:
	:type theOtherBox: Bnd_B3f &
	:param theTrsf:
	:type theTrsf: gp_Trsf
	:rtype: bool
") IsOut;
		Standard_Boolean IsOut (const Bnd_B3f & theOtherBox,const gp_Trsf & theTrsf);
		%feature("autodoc", "	:param theLine:
	:type theLine: gp_Ax1
	:param isRay: default value is Standard_False
	:type isRay: bool
	:param theOverthickness: default value is 0.0
	:type theOverthickness: float
	:rtype: bool
") IsOut;
		Standard_Boolean IsOut (const gp_Ax1 & theLine,const Standard_Boolean isRay = Standard_False,const Standard_Real theOverthickness = 0.0);
		%feature("autodoc", "	:param thePlane:
	:type thePlane: gp_Ax3
	:rtype: bool
") IsOut;
		Standard_Boolean IsOut (const gp_Ax3 & thePlane);
		%feature("autodoc", "	:param theBox:
	:type theBox: Bnd_B3f &
	:rtype: bool
") IsIn;
		Standard_Boolean IsIn (const Bnd_B3f & theBox);
		%feature("autodoc", "	:param theBox:
	:type theBox: Bnd_B3f &
	:param theTrsf:
	:type theTrsf: gp_Trsf
	:rtype: bool
") IsIn;
		Standard_Boolean IsIn (const Bnd_B3f & theBox,const gp_Trsf & theTrsf);
		%feature("autodoc", "	:param theCenter:
	:type theCenter: gp_XYZ
	:rtype: None
") SetCenter;
		void SetCenter (const gp_XYZ & theCenter);
		%feature("autodoc", "	:param theHSize:
	:type theHSize: gp_XYZ
	:rtype: None
") SetHSize;
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
		%feature("autodoc", "	* Constructs an empty comparison algorithm for bounding boxes. The bounding boxes are then defined using the Initialize function.

	:rtype: None
") Bnd_BoundSortBox;
		 Bnd_BoundSortBox ();
		%feature("autodoc", "	* Initializes this comparison algorithm with - the set of bounding boxes SetOfBox.

	:param CompleteBox:
	:type CompleteBox: Bnd_Box &
	:param SetOfBox:
	:type SetOfBox: Handle_Bnd_HArray1OfBox &
	:rtype: None
") Initialize;
		void Initialize (const Bnd_Box & CompleteBox,const Handle_Bnd_HArray1OfBox & SetOfBox);
		%feature("autodoc", "	* Initializes this comparison algorithm with - the set of bounding boxes SetOfBox, where CompleteBox is given as the global bounding box of SetOfBox.

	:param SetOfBox:
	:type SetOfBox: Handle_Bnd_HArray1OfBox &
	:rtype: None
") Initialize;
		void Initialize (const Handle_Bnd_HArray1OfBox & SetOfBox);
		%feature("autodoc", "	* Initializes this comparison algorithm, giving it only - the maximum number nbComponents of the bounding boxes to be managed. Use the Add function to define the array of bounding boxes to be sorted by this algorithm.

	:param CompleteBox:
	:type CompleteBox: Bnd_Box &
	:param nbComponents:
	:type nbComponents: Standard_Integer
	:rtype: None
") Initialize;
		void Initialize (const Bnd_Box & CompleteBox,const Standard_Integer nbComponents);
		%feature("autodoc", "	* Adds the bounding box theBox at position boxIndex in the array of boxes to be sorted by this comparison algorithm. This function is used only in conjunction with the third syntax described in the synopsis of Initialize. Exceptions: - Standard_OutOfRange if boxIndex is not in the range [ 1,nbComponents ] where nbComponents is the maximum number of bounding boxes declared for this comparison algorithm at initialization. - Standard_MultiplyDefined if a box already exists at position boxIndex in the array of boxes to be sorted by this comparison algorithm.

	:param theBox:
	:type theBox: Bnd_Box &
	:param boxIndex:
	:type boxIndex: Standard_Integer
	:rtype: None
") Add;
		void Add (const Bnd_Box & theBox,const Standard_Integer boxIndex);
		%feature("autodoc", "	* Compares the bounding box theBox, with the set of bounding boxes to be sorted by this comparison algorithm, and returns the list of intersecting bounding boxes as a list of indexes on the array of bounding boxes used by this algorithm.

	:param theBox:
	:type theBox: Bnd_Box &
	:rtype: TColStd_ListOfInteger
") Compare;
		const TColStd_ListOfInteger & Compare (const Bnd_Box & theBox);
		%feature("autodoc", "	* Compares the plane P with the set of bounding boxes to be sorted by this comparison algorithm, and returns the list of intersecting bounding boxes as a list of indexes on the array of bounding boxes used by this algorithm.

	:param P:
	:type P: gp_Pln
	:rtype: TColStd_ListOfInteger
") Compare;
		const TColStd_ListOfInteger & Compare (const gp_Pln & P);
		%feature("autodoc", "	:rtype: None
") Dump;
		void Dump ();
		%feature("autodoc", "	:rtype: None
") Destroy;
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
		%feature("autodoc", "	* Constructs an empty comparison algorithm for 2D bounding boxes. The bounding boxes are then defined using the Initialize function.

	:rtype: None
") Bnd_BoundSortBox2d;
		 Bnd_BoundSortBox2d ();
		%feature("autodoc", "	* Initializes this comparison algorithm with - the set of 2D bounding boxes SetOfBox

	:param CompleteBox:
	:type CompleteBox: Bnd_Box2d &
	:param SetOfBox:
	:type SetOfBox: Handle_Bnd_HArray1OfBox2d &
	:rtype: None
") Initialize;
		void Initialize (const Bnd_Box2d & CompleteBox,const Handle_Bnd_HArray1OfBox2d & SetOfBox);
		%feature("autodoc", "	* Initializes this comparison algorithm with - the set of 2D bounding boxes SetOfBox, where CompleteBox is given as the global bounding box of SetOfBox.

	:param SetOfBox:
	:type SetOfBox: Handle_Bnd_HArray1OfBox2d &
	:rtype: None
") Initialize;
		void Initialize (const Handle_Bnd_HArray1OfBox2d & SetOfBox);
		%feature("autodoc", "	* Initializes this comparison algorithm, giving it only - the maximum number nbComponents, and - the global bounding box CompleteBox, of the 2D bounding boxes to be managed. Use the Add function to define the array of bounding boxes to be sorted by this algorithm.

	:param CompleteBox:
	:type CompleteBox: Bnd_Box2d &
	:param nbComponents:
	:type nbComponents: Standard_Integer
	:rtype: None
") Initialize;
		void Initialize (const Bnd_Box2d & CompleteBox,const Standard_Integer nbComponents);
		%feature("autodoc", "	* Adds the 2D bounding box theBox at position boxIndex in the array of boxes to be sorted by this comparison algorithm. This function is used only in conjunction with the third syntax described in the synopsis of Initialize. Exceptions - Standard_OutOfRange if boxIndex is not in the range [ 1,nbComponents ] where nbComponents is the maximum number of bounding boxes declared for this comparison algorithm at initialization. - Standard_MultiplyDefined if a box still exists at position boxIndex in the array of boxes to be sorted by this comparison algorithm.

	:param theBox:
	:type theBox: Bnd_Box2d &
	:param boxIndex:
	:type boxIndex: Standard_Integer
	:rtype: None
") Add;
		void Add (const Bnd_Box2d & theBox,const Standard_Integer boxIndex);
		%feature("autodoc", "	* Compares the 2D bounding box theBox with the set of bounding boxes to be sorted by this comparison algorithm, and returns the list of intersecting bounding boxes as a list of indexes on the array of bounding boxes used by this algorithm.

	:param theBox:
	:type theBox: Bnd_Box2d &
	:rtype: TColStd_ListOfInteger
") Compare;
		const TColStd_ListOfInteger & Compare (const Bnd_Box2d & theBox);
		%feature("autodoc", "	:rtype: None
") Dump;
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
		%feature("autodoc", "	* Creates an empty Box. The constructed box is qualified Void. Its gap is null.

	:rtype: None
") Bnd_Box;
		 Bnd_Box ();
		%feature("autodoc", "	* Sets this bounding box so that it covers the whole of 3D space. It is infinitely long in all directions.

	:rtype: None
") SetWhole;
		void SetWhole ();
		%feature("autodoc", "	* Sets this bounding box so that it is empty. All points are outside a void box.

	:rtype: None
") SetVoid;
		void SetVoid ();
		%feature("autodoc", "	* Sets this bounding box so that it bounds - the point P. This involves first setting this bounding box to be void and then adding the point P.

	:param P:
	:type P: gp_Pnt
	:rtype: None
") Set;
		void Set (const gp_Pnt & P);
		%feature("autodoc", "	* Sets this bounding box so that it bounds the half-line defined by point P and direction D, i.e. all points M defined by M=P+u*D, where u is greater than or equal to 0, are inside the bounding volume. This involves first setting this box to be void and then adding the half-line.

	:param P:
	:type P: gp_Pnt
	:param D:
	:type D: gp_Dir
	:rtype: None
") Set;
		void Set (const gp_Pnt & P,const gp_Dir & D);
		%feature("autodoc", "	* Enlarges this bounding box, if required, so that it contains at least: - interval [ aXmin,aXmax ] in the 'X Direction', - interval [ aYmin,aYmax ] in the 'Y Direction', - interval [ aZmin,aZmax ] in the 'Z Direction';

	:param aXmin:
	:type aXmin: float
	:param aYmin:
	:type aYmin: float
	:param aZmin:
	:type aZmin: float
	:param aXmax:
	:type aXmax: float
	:param aYmax:
	:type aYmax: float
	:param aZmax:
	:type aZmax: float
	:rtype: None
") Update;
		void Update (const Standard_Real aXmin,const Standard_Real aYmin,const Standard_Real aZmin,const Standard_Real aXmax,const Standard_Real aYmax,const Standard_Real aZmax);
		%feature("autodoc", "	* Adds a point of coordinates (X,Y,Z) to this bounding box.

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:rtype: None
") Update;
		void Update (const Standard_Real X,const Standard_Real Y,const Standard_Real Z);
		%feature("autodoc", "	* Returns the gap of this bounding box.

	:rtype: float
") GetGap;
		Standard_Real GetGap ();
		%feature("autodoc", "	* Set the gap of this bounding box to abs(Tol).

	:param Tol:
	:type Tol: float
	:rtype: None
") SetGap;
		void SetGap (const Standard_Real Tol);
		%feature("autodoc", "	* Enlarges the box with a tolerance value. (minvalues-Abs(<tol>) and maxvalues+Abs(<tol>)) //!	This means that the minimum values of its X, Y and Z intervals of definition, when they are finite, are reduced by the absolute value of Tol, while the maximum values are increased by the same amount.

	:param Tol:
	:type Tol: float
	:rtype: None
") Enlarge;
		void Enlarge (const Standard_Real Tol);
		%feature("autodoc", "	* Returns the bounds of this bounding box. The gap is included. If this bounding box is infinite (i.e. 'open'), returned values may be equal to +/- Precision::Infinite(). if IsVoid()

	:param aXmin:
	:type aXmin: float &
	:param aYmin:
	:type aYmin: float &
	:param aZmin:
	:type aZmin: float &
	:param aXmax:
	:type aXmax: float &
	:param aYmax:
	:type aYmax: float &
	:param aZmax:
	:type aZmax: float &
	:rtype: None
") Get;
		void Get (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	* The Box will be infinitely long in the Xmin direction.

	:rtype: None
") OpenXmin;
		void OpenXmin ();
		%feature("autodoc", "	* The Box will be infinitely long in the Xmax direction.

	:rtype: None
") OpenXmax;
		void OpenXmax ();
		%feature("autodoc", "	* The Box will be infinitely long in the Ymin direction.

	:rtype: None
") OpenYmin;
		void OpenYmin ();
		%feature("autodoc", "	* The Box will be infinitely long in the Ymax direction.

	:rtype: None
") OpenYmax;
		void OpenYmax ();
		%feature("autodoc", "	* The Box will be infinitely long in the Zmin direction.

	:rtype: None
") OpenZmin;
		void OpenZmin ();
		%feature("autodoc", "	* The Box will be infinitely long in the Zmax direction.

	:rtype: None
") OpenZmax;
		void OpenZmax ();
		%feature("autodoc", "	* Returns true if this bounding box is open in the Xmin direction.

	:rtype: bool
") IsOpenXmin;
		Standard_Boolean IsOpenXmin ();
		%feature("autodoc", "	* Returns true if this bounding box is open in the Xmax direction.

	:rtype: bool
") IsOpenXmax;
		Standard_Boolean IsOpenXmax ();
		%feature("autodoc", "	* Returns true if this bounding box is open in the Ymix direction.

	:rtype: bool
") IsOpenYmin;
		Standard_Boolean IsOpenYmin ();
		%feature("autodoc", "	* Returns true if this bounding box is open in the Ymax direction.

	:rtype: bool
") IsOpenYmax;
		Standard_Boolean IsOpenYmax ();
		%feature("autodoc", "	* Returns true if this bounding box is open in the Zmin direction.

	:rtype: bool
") IsOpenZmin;
		Standard_Boolean IsOpenZmin ();
		%feature("autodoc", "	* Returns true if this bounding box is open in the Zmax direction.

	:rtype: bool
") IsOpenZmax;
		Standard_Boolean IsOpenZmax ();
		%feature("autodoc", "	* Returns true if this bounding box is infinite in all 6 directions (WholeSpace flag).

	:rtype: bool
") IsWhole;
		Standard_Boolean IsWhole ();
		%feature("autodoc", "	* Returns true if this bounding box is empty (Void flag).

	:rtype: bool
") IsVoid;
		Standard_Boolean IsVoid ();
		%feature("autodoc", "	* true if xmax-xmin < tol.

	:param tol:
	:type tol: float
	:rtype: bool
") IsXThin;
		Standard_Boolean IsXThin (const Standard_Real tol);
		%feature("autodoc", "	* true if ymax-ymin < tol.

	:param tol:
	:type tol: float
	:rtype: bool
") IsYThin;
		Standard_Boolean IsYThin (const Standard_Real tol);
		%feature("autodoc", "	* true if zmax-zmin < tol.

	:param tol:
	:type tol: float
	:rtype: bool
") IsZThin;
		Standard_Boolean IsZThin (const Standard_Real tol);
		%feature("autodoc", "	* Returns true if IsXThin, IsYThin and IsZThin are all true, i.e. if the box is thin in all three dimensions.

	:param tol:
	:type tol: float
	:rtype: bool
") IsThin;
		Standard_Boolean IsThin (const Standard_Real tol);
		%feature("autodoc", "	* Returns a bounding box which is the result of applying the transformation T to this bounding box. Warning Applying a geometric transformation (for example, a rotation) to a bounding box generally increases its dimensions. This is not optimal for algorithms which use it.

	:param T:
	:type T: gp_Trsf
	:rtype: Bnd_Box
") Transformed;
		Bnd_Box Transformed (const gp_Trsf & T);
		%feature("autodoc", "	* Adds the box <Other> to <self>.

	:param Other:
	:type Other: Bnd_Box &
	:rtype: None
") Add;
		void Add (const Bnd_Box & Other);
		%feature("autodoc", "	* Adds a Pnt to the box.

	:param P:
	:type P: gp_Pnt
	:rtype: None
") Add;
		void Add (const gp_Pnt & P);
		%feature("autodoc", "	* Extends <self> from the Pnt <P> in the direction <D>.

	:param P:
	:type P: gp_Pnt
	:param D:
	:type D: gp_Dir
	:rtype: None
") Add;
		void Add (const gp_Pnt & P,const gp_Dir & D);
		%feature("autodoc", "	* Extends the Box in the given Direction, i.e. adds an half-line. The box may become infinite in 1,2 or 3 directions.

	:param D:
	:type D: gp_Dir
	:rtype: None
") Add;
		void Add (const gp_Dir & D);
		%feature("autodoc", "	* Returns True if the Pnt is out the box.

	:param P:
	:type P: gp_Pnt
	:rtype: bool
") IsOut;
		Standard_Boolean IsOut (const gp_Pnt & P);
		%feature("autodoc", "	* Returns False if the line intersects the box.

	:param L:
	:type L: gp_Lin
	:rtype: bool
") IsOut;
		Standard_Boolean IsOut (const gp_Lin & L);
		%feature("autodoc", "	* Returns False if the plane intersects the box.

	:param P:
	:type P: gp_Pln
	:rtype: bool
") IsOut;
		Standard_Boolean IsOut (const gp_Pln & P);
		%feature("autodoc", "	* Returns False if the <Box> intersects or is inside <self>.

	:param Other:
	:type Other: Bnd_Box &
	:rtype: bool
") IsOut;
		Standard_Boolean IsOut (const Bnd_Box & Other);
		%feature("autodoc", "	* Returns False if the transformed <Box> intersects or is inside <self>.

	:param Other:
	:type Other: Bnd_Box &
	:param T:
	:type T: gp_Trsf
	:rtype: bool
") IsOut;
		Standard_Boolean IsOut (const Bnd_Box & Other,const gp_Trsf & T);
		%feature("autodoc", "	* Returns False if the transformed <Box> intersects or is inside the transformed box <self>.

	:param T1:
	:type T1: gp_Trsf
	:param Other:
	:type Other: Bnd_Box &
	:param T2:
	:type T2: gp_Trsf
	:rtype: bool
") IsOut;
		Standard_Boolean IsOut (const gp_Trsf & T1,const Bnd_Box & Other,const gp_Trsf & T2);
		%feature("autodoc", "	* Returns False if the flat band lying between two parallel 	 lines represented by their reference points <P1>, <P2> and direction <D> intersects the box.

	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param D:
	:type D: gp_Dir
	:rtype: bool
") IsOut;
		Standard_Boolean IsOut (const gp_Pnt & P1,const gp_Pnt & P2,const gp_Dir & D);
		%feature("autodoc", "	* Computes the minimum distance between two boxes.

	:param Other:
	:type Other: Bnd_Box &
	:rtype: float
") Distance;
		Standard_Real Distance (const Bnd_Box & Other);
		%feature("autodoc", "	:rtype: None
") Dump;
		void Dump ();
		%feature("autodoc", "	* Computes the squared diagonal of me.

	:rtype: float
") SquareExtent;
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
		%feature("autodoc", "	* Creates an empty 2D bounding box. The constructed box is qualified Void. Its gap is null.

	:rtype: None
") Bnd_Box2d;
		 Bnd_Box2d ();
		%feature("autodoc", "	* Sets this bounding box so that it covers the whole 2D space, i.e. it is infinite in all directions.

	:rtype: None
") SetWhole;
		void SetWhole ();
		%feature("autodoc", "	* Sets this 2D bounding box so that it is empty. All points are outside a void box.

	:rtype: None
") SetVoid;
		void SetVoid ();
		%feature("autodoc", "	* Sets this 2D bounding box so that it bounds the point P. This involves first setting this bounding box to be void and then adding the point PThe rectangle bounds the point <P>.

	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") Set;
		void Set (const gp_Pnt2d & P);
		%feature("autodoc", "	* Sets this 2D bounding box so that it bounds the half-line defined by point P and direction D, i.e. all points M defined by M=P+u*D, where u is greater than or equal to 0, are inside the bounding area. This involves first setting this 2D box to be void and then adding the half-line.

	:param P:
	:type P: gp_Pnt2d
	:param D:
	:type D: gp_Dir2d
	:rtype: None
") Set;
		void Set (const gp_Pnt2d & P,const gp_Dir2d & D);
		%feature("autodoc", "	* Enlarges this 2D bounding box, if required, so that it contains at least: - interval [ aXmin,aXmax ] in the 'X Direction', - interval [ aYmin,aYmax ] in the 'Y Direction'

	:param aXmin:
	:type aXmin: float
	:param aYmin:
	:type aYmin: float
	:param aXmax:
	:type aXmax: float
	:param aYmax:
	:type aYmax: float
	:rtype: None
") Update;
		void Update (const Standard_Real aXmin,const Standard_Real aYmin,const Standard_Real aXmax,const Standard_Real aYmax);
		%feature("autodoc", "	* Adds a point of coordinates (X,Y) to this bounding box.

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:rtype: None
") Update;
		void Update (const Standard_Real X,const Standard_Real Y);
		%feature("autodoc", "	* Returns the gap of this 2D bounding box.

	:rtype: float
") GetGap;
		Standard_Real GetGap ();
		%feature("autodoc", "	* Set the gap of this 2D bounding box to abs(Tol).

	:param Tol:
	:type Tol: float
	:rtype: None
") SetGap;
		void SetGap (const Standard_Real Tol);
		%feature("autodoc", "	* Enlarges the box with a tolerance value. This means that the minimum values of its X and Y intervals of definition, when they are finite, are reduced by the absolute value of Tol, while the maximum values are increased by the same amount.

	:param Tol:
	:type Tol: float
	:rtype: None
") Enlarge;
		void Enlarge (const Standard_Real Tol);
		%feature("autodoc", "	* Returns the bounds of this 2D bounding box. The gap is included. If this bounding box is infinite (i.e. 'open'), returned values may be equal to +/- Precision::Infinite(). if IsVoid()

	:param aXmin:
	:type aXmin: float &
	:param aYmin:
	:type aYmin: float &
	:param aXmax:
	:type aXmax: float &
	:param aYmax:
	:type aYmax: float &
	:rtype: None
") Get;
		void Get (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	* The Box will be infinitely long in the Xmin direction.

	:rtype: None
") OpenXmin;
		void OpenXmin ();
		%feature("autodoc", "	* The Box will be infinitely long in the Xmax direction.

	:rtype: None
") OpenXmax;
		void OpenXmax ();
		%feature("autodoc", "	* The Box will be infinitely long in the Ymin direction.

	:rtype: None
") OpenYmin;
		void OpenYmin ();
		%feature("autodoc", "	* The Box will be infinitely long in the Ymax direction.

	:rtype: None
") OpenYmax;
		void OpenYmax ();
		%feature("autodoc", "	* Returns true if this bounding box is open in the Xmin direction.

	:rtype: bool
") IsOpenXmin;
		Standard_Boolean IsOpenXmin ();
		%feature("autodoc", "	* Returns true if this bounding box is open in the Xmax direction.

	:rtype: bool
") IsOpenXmax;
		Standard_Boolean IsOpenXmax ();
		%feature("autodoc", "	* Returns true if this bounding box is open in the Ymin direction.

	:rtype: bool
") IsOpenYmin;
		Standard_Boolean IsOpenYmin ();
		%feature("autodoc", "	* Returns true if this bounding box is open in the Ymax direction.

	:rtype: bool
") IsOpenYmax;
		Standard_Boolean IsOpenYmax ();
		%feature("autodoc", "	* Returns true if this bounding box is infinite in all 4 directions (Whole Space flag).

	:rtype: bool
") IsWhole;
		Standard_Boolean IsWhole ();
		%feature("autodoc", "	* Returns true if this 2D bounding box is empty (Void flag).

	:rtype: bool
") IsVoid;
		Standard_Boolean IsVoid ();
		%feature("autodoc", "	* Returns a bounding box which is the result of applying the transformation T to this bounding box. Warning Applying a geometric transformation (for example, a rotation) to a bounding box generally increases its dimensions. This is not optimal for algorithms which use it.

	:param T:
	:type T: gp_Trsf2d
	:rtype: Bnd_Box2d
") Transformed;
		Bnd_Box2d Transformed (const gp_Trsf2d & T);
		%feature("autodoc", "	* Adds the 2d box <Other> to <self>.

	:param Other:
	:type Other: Bnd_Box2d &
	:rtype: None
") Add;
		void Add (const Bnd_Box2d & Other);
		%feature("autodoc", "	* Adds the 2d pnt <P> to <self>.

	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") Add;
		void Add (const gp_Pnt2d & P);
		%feature("autodoc", "	* Extends <self> from the Pnt <P> in the direction <D>.

	:param P:
	:type P: gp_Pnt2d
	:param D:
	:type D: gp_Dir2d
	:rtype: None
") Add;
		void Add (const gp_Pnt2d & P,const gp_Dir2d & D);
		%feature("autodoc", "	* Extends the Box in the given Direction, i.e. adds a half-line. The box may become infinite in 1 or 2 directions.

	:param D:
	:type D: gp_Dir2d
	:rtype: None
") Add;
		void Add (const gp_Dir2d & D);
		%feature("autodoc", "	* Returns True if the 2d pnt <P> is out <self>.

	:param P:
	:type P: gp_Pnt2d
	:rtype: bool
") IsOut;
		Standard_Boolean IsOut (const gp_Pnt2d & P);
		%feature("autodoc", "	* Returns True if <Box2d> is out <self>.

	:param Other:
	:type Other: Bnd_Box2d &
	:rtype: bool
") IsOut;
		Standard_Boolean IsOut (const Bnd_Box2d & Other);
		%feature("autodoc", "	* Returns True if transformed <Box2d> is out <self>.

	:param Other:
	:type Other: Bnd_Box2d &
	:param T:
	:type T: gp_Trsf2d
	:rtype: bool
") IsOut;
		Standard_Boolean IsOut (const Bnd_Box2d & Other,const gp_Trsf2d & T);
		%feature("autodoc", "	* Compares a transformed bounding with a transformed bounding. The default implementation is to make a copy of <self> and <Other>, to transform them and to test.

	:param T1:
	:type T1: gp_Trsf2d
	:param Other:
	:type Other: Bnd_Box2d &
	:param T2:
	:type T2: gp_Trsf2d
	:rtype: bool
") IsOut;
		Standard_Boolean IsOut (const gp_Trsf2d & T1,const Bnd_Box2d & Other,const gp_Trsf2d & T2);
		%feature("autodoc", "	:rtype: None
") Dump;
		void Dump ();
		%feature("autodoc", "	* Computes the squared diagonal of me.

	:rtype: float
") SquareExtent;
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
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Bnd_HArray1OfBox;
		 Bnd_HArray1OfBox (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:param V:
	:type V: Bnd_Box &
	:rtype: None
") Bnd_HArray1OfBox;
		 Bnd_HArray1OfBox (const Standard_Integer Low,const Standard_Integer Up,const Bnd_Box & V);
		%feature("autodoc", "	:param V:
	:type V: Bnd_Box &
	:rtype: None
") Init;
		void Init (const Bnd_Box & V);
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
	:type Value: Bnd_Box &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Bnd_Box & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Bnd_Box
") Value;
		const Bnd_Box & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Bnd_Box
") ChangeValue;
		Bnd_Box & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: Bnd_Array1OfBox
") Array1;
		const Bnd_Array1OfBox & Array1 ();
		%feature("autodoc", "	:rtype: Bnd_Array1OfBox
") ChangeArray1;
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
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Bnd_HArray1OfBox2d;
		 Bnd_HArray1OfBox2d (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:param V:
	:type V: Bnd_Box2d &
	:rtype: None
") Bnd_HArray1OfBox2d;
		 Bnd_HArray1OfBox2d (const Standard_Integer Low,const Standard_Integer Up,const Bnd_Box2d & V);
		%feature("autodoc", "	:param V:
	:type V: Bnd_Box2d &
	:rtype: None
") Init;
		void Init (const Bnd_Box2d & V);
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
	:type Value: Bnd_Box2d &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Bnd_Box2d & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Bnd_Box2d
") Value;
		const Bnd_Box2d & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Bnd_Box2d
") ChangeValue;
		Bnd_Box2d & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: Bnd_Array1OfBox2d
") Array1;
		const Bnd_Array1OfBox2d & Array1 ();
		%feature("autodoc", "	:rtype: Bnd_Array1OfBox2d
") ChangeArray1;
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
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") Bnd_HArray1OfSphere;
		 Bnd_HArray1OfSphere (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:param V:
	:type V: Bnd_Sphere &
	:rtype: None
") Bnd_HArray1OfSphere;
		 Bnd_HArray1OfSphere (const Standard_Integer Low,const Standard_Integer Up,const Bnd_Sphere & V);
		%feature("autodoc", "	:param V:
	:type V: Bnd_Sphere &
	:rtype: None
") Init;
		void Init (const Bnd_Sphere & V);
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
	:type Value: Bnd_Sphere &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Bnd_Sphere & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Bnd_Sphere
") Value;
		const Bnd_Sphere & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Bnd_Sphere
") ChangeValue;
		Bnd_Sphere & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: Bnd_Array1OfSphere
") Array1;
		const Bnd_Array1OfSphere & Array1 ();
		%feature("autodoc", "	:rtype: Bnd_Array1OfSphere
") ChangeArray1;
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
		%feature("autodoc", "	:rtype: None
") Bnd_SeqOfBox;
		 Bnd_SeqOfBox ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Bnd_SeqOfBox &
	:rtype: Bnd_SeqOfBox
") Assign;
		const Bnd_SeqOfBox & Assign (const Bnd_SeqOfBox & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Bnd_SeqOfBox &
	:rtype: Bnd_SeqOfBox
") operator=;
		const Bnd_SeqOfBox & operator = (const Bnd_SeqOfBox & Other);
		%feature("autodoc", "	:param T:
	:type T: Bnd_Box &
	:rtype: None
") Append;
		void Append (const Bnd_Box & T);
		%feature("autodoc", "	:param S:
	:type S: Bnd_SeqOfBox &
	:rtype: None
") Append;
		void Append (Bnd_SeqOfBox & S);
		%feature("autodoc", "	:param T:
	:type T: Bnd_Box &
	:rtype: None
") Prepend;
		void Prepend (const Bnd_Box & T);
		%feature("autodoc", "	:param S:
	:type S: Bnd_SeqOfBox &
	:rtype: None
") Prepend;
		void Prepend (Bnd_SeqOfBox & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Bnd_Box &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Bnd_Box & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Bnd_SeqOfBox &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Bnd_SeqOfBox & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Bnd_Box &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Bnd_Box & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Bnd_SeqOfBox &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Bnd_SeqOfBox & S);
		%feature("autodoc", "	:rtype: Bnd_Box
") First;
		const Bnd_Box & First ();
		%feature("autodoc", "	:rtype: Bnd_Box
") Last;
		const Bnd_Box & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Bnd_SeqOfBox &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Bnd_SeqOfBox & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Bnd_Box
") Value;
		const Bnd_Box & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Bnd_Box &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Bnd_Box & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Bnd_Box
") ChangeValue;
		Bnd_Box & ChangeValue (const Standard_Integer Index);
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
		%feature("autodoc", "	:param I:
	:type I: Bnd_Box &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Bnd_SequenceNodeOfSeqOfBox;
		 Bnd_SequenceNodeOfSeqOfBox (const Bnd_Box & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Bnd_Box
") Value;
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
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") Bnd_Sphere;
		 Bnd_Sphere ();
		%feature("autodoc", "	* Constructor of a definite sphere

	:param theCntr:
	:type theCntr: gp_XYZ
	:param theRad:
	:type theRad: float
	:param theU:
	:type theU: Standard_Integer
	:param theV:
	:type theV: Standard_Integer
	:rtype: None
") Bnd_Sphere;
		 Bnd_Sphere (const gp_XYZ & theCntr,const Standard_Real theRad,const Standard_Integer theU,const Standard_Integer theV);
		%feature("autodoc", "	* Returns the U parameter on shape

	:rtype: int
") U;
		Standard_Integer U ();
		%feature("autodoc", "	* Returns the V parameter on shape

	:rtype: int
") V;
		Standard_Integer V ();
		%feature("autodoc", "	* Returns validity status, indicating that this //!		sphere corresponds to a real entity

	:rtype: bool
") IsValid;
		Standard_Boolean IsValid ();
		%feature("autodoc", "	:param isValid:
	:type isValid: bool
	:rtype: None
") SetValid;
		void SetValid (const Standard_Boolean isValid);
		%feature("autodoc", "	* Returns center of sphere object

	:rtype: gp_XYZ
") Center;
		const gp_XYZ  Center ();
		%feature("autodoc", "	* Returns the radius value

	:rtype: float
") Radius;
		Standard_Real Radius ();
		%feature("autodoc", "	* Calculate and return minimal and maximal distance to sphere. //!		NOTE: This function is tightly optimized; any modifications //!		may affect performance!

	:param theXYZ:
	:type theXYZ: gp_XYZ
	:param theMin:
	:type theMin: float &
	:param theMax:
	:type theMax: float &
	:rtype: None
") Distances;
		void Distances (const gp_XYZ & theXYZ,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	* Calculate and return minimal and maximal distance to sphere. //!		NOTE: This function is tightly optimized; any modifications //!		may affect performance!

	:param theXYZ:
	:type theXYZ: gp_XYZ
	:param theMin:
	:type theMin: float &
	:param theMax:
	:type theMax: float &
	:rtype: None
") SquareDistances;
		void SquareDistances (const gp_XYZ & theXYZ,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	* Projects a point on entity. //!		 Returns true if success

	:param theNode:
	:type theNode: gp_XYZ
	:param theProjNode:
	:type theProjNode: gp_XYZ
	:param theDist:
	:type theDist: float &
	:param theInside:
	:type theInside: bool
	:rtype: bool
") Project;
		Standard_Boolean Project (const gp_XYZ & theNode,gp_XYZ & theProjNode,Standard_Real &OutValue,Standard_Boolean & theInside);
		%feature("autodoc", "	:param theNode:
	:type theNode: gp_XYZ
	:rtype: float
") Distance;
		Standard_Real Distance (const gp_XYZ & theNode);
		%feature("autodoc", "	:param theNode:
	:type theNode: gp_XYZ
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const gp_XYZ & theNode);
		%feature("autodoc", "	:param theOther:
	:type theOther: Bnd_Sphere &
	:rtype: None
") Add;
		void Add (const Bnd_Sphere & theOther);
		%feature("autodoc", "	:param theOther:
	:type theOther: Bnd_Sphere &
	:rtype: bool
") IsOut;
		Standard_Boolean IsOut (const Bnd_Sphere & theOther);
		%feature("autodoc", "	:param thePnt:
	:type thePnt: gp_XYZ
	:param theMaxDist:
	:type theMaxDist: float &
	:rtype: bool
") IsOut;
		Standard_Boolean IsOut (const gp_XYZ & thePnt,Standard_Real &OutValue);
		%feature("autodoc", "	:rtype: float
") SquareExtent;
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
