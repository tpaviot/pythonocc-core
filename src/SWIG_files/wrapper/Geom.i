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
%module Geom

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

%include Geom_required_python_modules.i
%include Geom_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor Geom_Geometry;
class Geom_Geometry : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

Performs the symmetrical transformation of a Geometry  
 with respect to the point P which is the center of the  
 symmetry.") Mirror;
		void Mirror (const gp_Pnt & P);
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	None

Performs the symmetrical transformation of a Geometry  
 with respect to an axis placement which is the axis of the  
 symmetry.") Mirror;
		void Mirror (const gp_Ax1 & A1);
		%feature("autodoc", "Args:
	A2(gp_Ax2)

Returns:
	None

Performs the symmetrical transformation of a Geometry  
 with respect to a plane. The axis placement A2 locates  
 the plane of the symmetry : (Location, XDirection, YDirection).") Mirror;
		void Mirror (const gp_Ax2 & A2);
		%feature("autodoc", "Args:
	A1(gp_Ax1)
	Ang(Standard_Real)

Returns:
	None

Rotates a Geometry. A1 is the axis of the rotation.  
 Ang is the angular value of the rotation in radians.") Rotate;
		void Rotate (const gp_Ax1 & A1,const Standard_Real Ang);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(Standard_Real)

Returns:
	None

Scales a Geometry. S is the scaling value.") Scale;
		void Scale (const gp_Pnt & P,const Standard_Real S);
		%feature("autodoc", "Args:
	V(gp_Vec)

Returns:
	None

Translates a Geometry.  V is the vector of the tanslation.") Translate;
		void Translate (const gp_Vec & V);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

Translates a Geometry from the point P1 to the point P2.") Translate;
		void Translate (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	virtual void

Transformation of a geometric object. This tansformation  
 can be a translation, a rotation, a symmetry, a scaling  
 or a complex transformation obtained by combination of  
 the previous elementaries transformations.  
 (see class Transformation of the package Geom).") Transform;
		virtual void Transform (const gp_Trsf & T);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	Handle_Geom_Geometry

No detailed docstring for this function.") Mirrored;
		Handle_Geom_Geometry Mirrored (const gp_Pnt & P);
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	Handle_Geom_Geometry

No detailed docstring for this function.") Mirrored;
		Handle_Geom_Geometry Mirrored (const gp_Ax1 & A1);
		%feature("autodoc", "Args:
	A2(gp_Ax2)

Returns:
	Handle_Geom_Geometry

No detailed docstring for this function.") Mirrored;
		Handle_Geom_Geometry Mirrored (const gp_Ax2 & A2);
		%feature("autodoc", "Args:
	A1(gp_Ax1)
	Ang(Standard_Real)

Returns:
	Handle_Geom_Geometry

No detailed docstring for this function.") Rotated;
		Handle_Geom_Geometry Rotated (const gp_Ax1 & A1,const Standard_Real Ang);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(Standard_Real)

Returns:
	Handle_Geom_Geometry

No detailed docstring for this function.") Scaled;
		Handle_Geom_Geometry Scaled (const gp_Pnt & P,const Standard_Real S);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	Handle_Geom_Geometry

No detailed docstring for this function.") Transformed;
		Handle_Geom_Geometry Transformed (const gp_Trsf & T);
		%feature("autodoc", "Args:
	V(gp_Vec)

Returns:
	Handle_Geom_Geometry

No detailed docstring for this function.") Translated;
		Handle_Geom_Geometry Translated (const gp_Vec & V);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	Handle_Geom_Geometry

No detailed docstring for this function.") Translated;
		Handle_Geom_Geometry Translated (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Geom_Geometry

Creates a new object which is a copy of this geometric object.") Copy;
		virtual Handle_Geom_Geometry Copy ();
};


%feature("shadow") Geom_Geometry::~Geom_Geometry %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom_Geometry {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Geom_Geometry {
	Handle_Geom_Geometry GetHandle() {
	return *(Handle_Geom_Geometry*) &$self;
	}
};

%nodefaultctor Handle_Geom_Geometry;
class Handle_Geom_Geometry : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Geom_Geometry();
        Handle_Geom_Geometry(const Handle_Geom_Geometry &aHandle);
        Handle_Geom_Geometry(const Geom_Geometry *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Geom_Geometry DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Geom_Geometry {
    Geom_Geometry* GetObject() {
    return (Geom_Geometry*)$self->Access();
    }
};
%feature("shadow") Handle_Geom_Geometry::~Handle_Geom_Geometry %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Geom_Geometry {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Geom_HSequenceOfBSplineSurface;
class Geom_HSequenceOfBSplineSurface : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Geom_HSequenceOfBSplineSurface;
		 Geom_HSequenceOfBSplineSurface ();
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
	anItem(Handle_Geom_BSplineSurface)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Geom_BSplineSurface & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_Geom_HSequenceOfBSplineSurface)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Geom_HSequenceOfBSplineSurface & aSequence);
		%feature("autodoc", "Args:
	anItem(Handle_Geom_BSplineSurface)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Geom_BSplineSurface & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_Geom_HSequenceOfBSplineSurface)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Geom_HSequenceOfBSplineSurface & aSequence);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Geom_BSplineSurface)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Geom_BSplineSurface & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_Geom_HSequenceOfBSplineSurface)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Geom_HSequenceOfBSplineSurface & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Geom_BSplineSurface)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Geom_BSplineSurface & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_Geom_HSequenceOfBSplineSurface)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Geom_HSequenceOfBSplineSurface & aSequence);
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
	Handle_Geom_HSequenceOfBSplineSurface

No detailed docstring for this function.") Split;
		Handle_Geom_HSequenceOfBSplineSurface Split (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Geom_BSplineSurface)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Geom_BSplineSurface & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Geom_BSplineSurface

No detailed docstring for this function.") Value;
		const Handle_Geom_BSplineSurface & Value (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_Geom_BSplineSurface

No detailed docstring for this function.") ChangeValue;
		Handle_Geom_BSplineSurface & ChangeValue (const Standard_Integer anIndex);
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
	Geom_SequenceOfBSplineSurface

No detailed docstring for this function.") Sequence;
		const Geom_SequenceOfBSplineSurface & Sequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Geom_SequenceOfBSplineSurface

No detailed docstring for this function.") ChangeSequence;
		Geom_SequenceOfBSplineSurface & ChangeSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_HSequenceOfBSplineSurface

No detailed docstring for this function.") ShallowCopy;
		Handle_Geom_HSequenceOfBSplineSurface ShallowCopy ();
};


%feature("shadow") Geom_HSequenceOfBSplineSurface::~Geom_HSequenceOfBSplineSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom_HSequenceOfBSplineSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Geom_HSequenceOfBSplineSurface {
	Handle_Geom_HSequenceOfBSplineSurface GetHandle() {
	return *(Handle_Geom_HSequenceOfBSplineSurface*) &$self;
	}
};

%nodefaultctor Handle_Geom_HSequenceOfBSplineSurface;
class Handle_Geom_HSequenceOfBSplineSurface : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Geom_HSequenceOfBSplineSurface();
        Handle_Geom_HSequenceOfBSplineSurface(const Handle_Geom_HSequenceOfBSplineSurface &aHandle);
        Handle_Geom_HSequenceOfBSplineSurface(const Geom_HSequenceOfBSplineSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Geom_HSequenceOfBSplineSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Geom_HSequenceOfBSplineSurface {
    Geom_HSequenceOfBSplineSurface* GetObject() {
    return (Geom_HSequenceOfBSplineSurface*)$self->Access();
    }
};
%feature("shadow") Handle_Geom_HSequenceOfBSplineSurface::~Handle_Geom_HSequenceOfBSplineSurface %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Geom_HSequenceOfBSplineSurface {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Geom_HSequenceOfSurface;
class Geom_HSequenceOfSurface : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Geom_HSequenceOfSurface;
		 Geom_HSequenceOfSurface ();
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
	aSequence(Handle_Geom_HSequenceOfSurface)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Geom_HSequenceOfSurface & aSequence);
		%feature("autodoc", "Args:
	anItem(Handle_Geom_Surface)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Geom_Surface & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_Geom_HSequenceOfSurface)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Geom_HSequenceOfSurface & aSequence);
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
	aSequence(Handle_Geom_HSequenceOfSurface)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Geom_HSequenceOfSurface & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_Geom_Surface)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Geom_Surface & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_Geom_HSequenceOfSurface)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Geom_HSequenceOfSurface & aSequence);
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
	Handle_Geom_HSequenceOfSurface

No detailed docstring for this function.") Split;
		Handle_Geom_HSequenceOfSurface Split (const Standard_Integer anIndex);
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
	Geom_SequenceOfSurface

No detailed docstring for this function.") Sequence;
		const Geom_SequenceOfSurface & Sequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Geom_SequenceOfSurface

No detailed docstring for this function.") ChangeSequence;
		Geom_SequenceOfSurface & ChangeSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_HSequenceOfSurface

No detailed docstring for this function.") ShallowCopy;
		Handle_Geom_HSequenceOfSurface ShallowCopy ();
};


%feature("shadow") Geom_HSequenceOfSurface::~Geom_HSequenceOfSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom_HSequenceOfSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Geom_HSequenceOfSurface {
	Handle_Geom_HSequenceOfSurface GetHandle() {
	return *(Handle_Geom_HSequenceOfSurface*) &$self;
	}
};

%nodefaultctor Handle_Geom_HSequenceOfSurface;
class Handle_Geom_HSequenceOfSurface : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Geom_HSequenceOfSurface();
        Handle_Geom_HSequenceOfSurface(const Handle_Geom_HSequenceOfSurface &aHandle);
        Handle_Geom_HSequenceOfSurface(const Geom_HSequenceOfSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Geom_HSequenceOfSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Geom_HSequenceOfSurface {
    Geom_HSequenceOfSurface* GetObject() {
    return (Geom_HSequenceOfSurface*)$self->Access();
    }
};
%feature("shadow") Handle_Geom_HSequenceOfSurface::~Handle_Geom_HSequenceOfSurface %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Geom_HSequenceOfSurface {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Geom_OsculatingSurface;
class Geom_OsculatingSurface {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Geom_OsculatingSurface;
		 Geom_OsculatingSurface ();
		%feature("autodoc", "Args:
	BS(Handle_Geom_Surface)
	Tol(Standard_Real)

Returns:
	None

detects if the  surface has punctual U  or  V  
 isoparametric  curve along on  the bounds of the surface  
 relativly to the tolerance Tol and Builds the corresponding  
 osculating surfaces.") Geom_OsculatingSurface;
		 Geom_OsculatingSurface (const Handle_Geom_Surface & BS,const Standard_Real Tol);
		%feature("autodoc", "Args:
	BS(Handle_Geom_Surface)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom_Surface & BS,const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Surface

No detailed docstring for this function.") BasisSurface;
		Handle_Geom_Surface BasisSurface ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Tolerance;
		Standard_Real Tolerance ();
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	t(Standard_Boolean)
	L(Handle_Geom_BSplineSurface)

Returns:
	Standard_Boolean

if Standard_True, L is the local osculating surface  
         along U at the point U,V.") UOscSurf;
		Standard_Boolean UOscSurf (const Standard_Real U,const Standard_Real V,Standard_Boolean & t,Handle_Geom_BSplineSurface & L);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	t(Standard_Boolean)
	L(Handle_Geom_BSplineSurface)

Returns:
	Standard_Boolean

if Standard_True, L is the local osculating surface  
         along V at the point U,V.") VOscSurf;
		Standard_Boolean VOscSurf (const Standard_Real U,const Standard_Real V,Standard_Boolean & t,Handle_Geom_BSplineSurface & L);
};


%feature("shadow") Geom_OsculatingSurface::~Geom_OsculatingSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom_OsculatingSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom_SequenceNodeOfSequenceOfBSplineSurface;
class Geom_SequenceNodeOfSequenceOfBSplineSurface : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_Geom_BSplineSurface)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Geom_SequenceNodeOfSequenceOfBSplineSurface;
		 Geom_SequenceNodeOfSequenceOfBSplineSurface (const Handle_Geom_BSplineSurface & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_BSplineSurface

No detailed docstring for this function.") Value;
		Handle_Geom_BSplineSurface & Value ();
};


%feature("shadow") Geom_SequenceNodeOfSequenceOfBSplineSurface::~Geom_SequenceNodeOfSequenceOfBSplineSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom_SequenceNodeOfSequenceOfBSplineSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Geom_SequenceNodeOfSequenceOfBSplineSurface {
	Handle_Geom_SequenceNodeOfSequenceOfBSplineSurface GetHandle() {
	return *(Handle_Geom_SequenceNodeOfSequenceOfBSplineSurface*) &$self;
	}
};

%nodefaultctor Handle_Geom_SequenceNodeOfSequenceOfBSplineSurface;
class Handle_Geom_SequenceNodeOfSequenceOfBSplineSurface : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Geom_SequenceNodeOfSequenceOfBSplineSurface();
        Handle_Geom_SequenceNodeOfSequenceOfBSplineSurface(const Handle_Geom_SequenceNodeOfSequenceOfBSplineSurface &aHandle);
        Handle_Geom_SequenceNodeOfSequenceOfBSplineSurface(const Geom_SequenceNodeOfSequenceOfBSplineSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Geom_SequenceNodeOfSequenceOfBSplineSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Geom_SequenceNodeOfSequenceOfBSplineSurface {
    Geom_SequenceNodeOfSequenceOfBSplineSurface* GetObject() {
    return (Geom_SequenceNodeOfSequenceOfBSplineSurface*)$self->Access();
    }
};
%feature("shadow") Handle_Geom_SequenceNodeOfSequenceOfBSplineSurface::~Handle_Geom_SequenceNodeOfSequenceOfBSplineSurface %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Geom_SequenceNodeOfSequenceOfBSplineSurface {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Geom_SequenceNodeOfSequenceOfSurface;
class Geom_SequenceNodeOfSequenceOfSurface : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_Geom_Surface)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Geom_SequenceNodeOfSequenceOfSurface;
		 Geom_SequenceNodeOfSequenceOfSurface (const Handle_Geom_Surface & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Surface

No detailed docstring for this function.") Value;
		Handle_Geom_Surface & Value ();
};


%feature("shadow") Geom_SequenceNodeOfSequenceOfSurface::~Geom_SequenceNodeOfSequenceOfSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom_SequenceNodeOfSequenceOfSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Geom_SequenceNodeOfSequenceOfSurface {
	Handle_Geom_SequenceNodeOfSequenceOfSurface GetHandle() {
	return *(Handle_Geom_SequenceNodeOfSequenceOfSurface*) &$self;
	}
};

%nodefaultctor Handle_Geom_SequenceNodeOfSequenceOfSurface;
class Handle_Geom_SequenceNodeOfSequenceOfSurface : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Geom_SequenceNodeOfSequenceOfSurface();
        Handle_Geom_SequenceNodeOfSequenceOfSurface(const Handle_Geom_SequenceNodeOfSequenceOfSurface &aHandle);
        Handle_Geom_SequenceNodeOfSequenceOfSurface(const Geom_SequenceNodeOfSequenceOfSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Geom_SequenceNodeOfSequenceOfSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Geom_SequenceNodeOfSequenceOfSurface {
    Geom_SequenceNodeOfSequenceOfSurface* GetObject() {
    return (Geom_SequenceNodeOfSequenceOfSurface*)$self->Access();
    }
};
%feature("shadow") Handle_Geom_SequenceNodeOfSequenceOfSurface::~Handle_Geom_SequenceNodeOfSequenceOfSurface %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Geom_SequenceNodeOfSequenceOfSurface {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Geom_SequenceOfBSplineSurface;
class Geom_SequenceOfBSplineSurface : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Geom_SequenceOfBSplineSurface;
		 Geom_SequenceOfBSplineSurface ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Geom_SequenceOfBSplineSurface)

Returns:
	Geom_SequenceOfBSplineSurface

No detailed docstring for this function.") Assign;
		const Geom_SequenceOfBSplineSurface & Assign (const Geom_SequenceOfBSplineSurface & Other);
		%feature("autodoc", "Args:
	Other(Geom_SequenceOfBSplineSurface)

Returns:
	Geom_SequenceOfBSplineSurface

No detailed docstring for this function.") operator=;
		const Geom_SequenceOfBSplineSurface & operator = (const Geom_SequenceOfBSplineSurface & Other);
		%feature("autodoc", "Args:
	T(Handle_Geom_BSplineSurface)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Geom_BSplineSurface & T);
		%feature("autodoc", "Args:
	S(Geom_SequenceOfBSplineSurface)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Geom_SequenceOfBSplineSurface & S);
		%feature("autodoc", "Args:
	T(Handle_Geom_BSplineSurface)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Geom_BSplineSurface & T);
		%feature("autodoc", "Args:
	S(Geom_SequenceOfBSplineSurface)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Geom_SequenceOfBSplineSurface & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Geom_BSplineSurface)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Geom_BSplineSurface & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Geom_SequenceOfBSplineSurface)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Geom_SequenceOfBSplineSurface & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Geom_BSplineSurface)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Geom_BSplineSurface & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Geom_SequenceOfBSplineSurface)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Geom_SequenceOfBSplineSurface & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_BSplineSurface

No detailed docstring for this function.") First;
		const Handle_Geom_BSplineSurface & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_BSplineSurface

No detailed docstring for this function.") Last;
		const Handle_Geom_BSplineSurface & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Geom_SequenceOfBSplineSurface)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Geom_SequenceOfBSplineSurface & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom_BSplineSurface

No detailed docstring for this function.") Value;
		const Handle_Geom_BSplineSurface & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_Geom_BSplineSurface)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Geom_BSplineSurface & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom_BSplineSurface

No detailed docstring for this function.") ChangeValue;
		Handle_Geom_BSplineSurface & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") Geom_SequenceOfBSplineSurface::~Geom_SequenceOfBSplineSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom_SequenceOfBSplineSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom_SequenceOfSurface;
class Geom_SequenceOfSurface : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Geom_SequenceOfSurface;
		 Geom_SequenceOfSurface ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Geom_SequenceOfSurface)

Returns:
	Geom_SequenceOfSurface

No detailed docstring for this function.") Assign;
		const Geom_SequenceOfSurface & Assign (const Geom_SequenceOfSurface & Other);
		%feature("autodoc", "Args:
	Other(Geom_SequenceOfSurface)

Returns:
	Geom_SequenceOfSurface

No detailed docstring for this function.") operator=;
		const Geom_SequenceOfSurface & operator = (const Geom_SequenceOfSurface & Other);
		%feature("autodoc", "Args:
	T(Handle_Geom_Surface)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Geom_Surface & T);
		%feature("autodoc", "Args:
	S(Geom_SequenceOfSurface)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Geom_SequenceOfSurface & S);
		%feature("autodoc", "Args:
	T(Handle_Geom_Surface)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Geom_Surface & T);
		%feature("autodoc", "Args:
	S(Geom_SequenceOfSurface)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Geom_SequenceOfSurface & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Geom_Surface)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Geom_Surface & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Geom_SequenceOfSurface)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Geom_SequenceOfSurface & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Geom_Surface)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Geom_Surface & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Geom_SequenceOfSurface)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Geom_SequenceOfSurface & S);
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
	Sub(Geom_SequenceOfSurface)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Geom_SequenceOfSurface & Sub);
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


%feature("shadow") Geom_SequenceOfSurface::~Geom_SequenceOfSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom_SequenceOfSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom_Transformation;
class Geom_Transformation : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an identity transformation.") Geom_Transformation;
		 Geom_Transformation ();
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

Creates a transient copy of T.") Geom_Transformation;
		 Geom_Transformation (const gp_Trsf & T);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

Makes the transformation into a symmetrical transformation  
 with respect to a point P.  
 P is the center of the symmetry.") SetMirror;
		void SetMirror (const gp_Pnt & P);
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	None

Makes the transformation into a symmetrical transformation  
 with respect to an axis A1.  
 A1 is the center of the axial symmetry.") SetMirror;
		void SetMirror (const gp_Ax1 & A1);
		%feature("autodoc", "Args:
	A2(gp_Ax2)

Returns:
	None

Makes the transformation into a symmetrical transformation  
 with respect to a plane.  The plane of the symmetry is  
 defined with the axis placement A2. It is the plane  
 (Location, XDirection, YDirection).") SetMirror;
		void SetMirror (const gp_Ax2 & A2);
		%feature("autodoc", "Args:
	A1(gp_Ax1)
	Ang(Standard_Real)

Returns:
	None

Makes the transformation into a rotation.  
 A1 is the axis rotation and Ang is the angular value  
 of the rotation in radians.") SetRotation;
		void SetRotation (const gp_Ax1 & A1,const Standard_Real Ang);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	S(Standard_Real)

Returns:
	None

Makes the transformation into a scale. P is the center of  
 the scale and S is the scaling value.") SetScale;
		void SetScale (const gp_Pnt & P,const Standard_Real S);
		%feature("autodoc", "Args:
	FromSystem1(gp_Ax3)
	ToSystem2(gp_Ax3)

Returns:
	None

Makes a transformation allowing passage from the coordinate  
 system 'FromSystem1' to the coordinate system 'ToSystem2'.  
Example :  
 In a C++ implementation :  
 Real x1, y1, z1;  // are the coordinates of a point in the  
                   // local system FromSystem1  
 Real x2, y2, z2;  // are the coordinates of a point in the  
                   // local system ToSystem2  
 gp_Pnt P1 (x1, y1, z1)  
 Geom_Transformation T;  
 T.SetTransformation (FromSystem1, ToSystem2);  
 gp_Pnt P2 = P1.Transformed (T);  
 P2.Coord (x2, y2, z2);") SetTransformation;
		void SetTransformation (const gp_Ax3 & FromSystem1,const gp_Ax3 & ToSystem2);
		%feature("autodoc", "Args:
	ToSystem(gp_Ax3)

Returns:
	None

Makes the transformation allowing passage from the basic  
 coordinate system  
 {P(0.,0.,0.), VX (1.,0.,0.), VY (0.,1.,0.), VZ (0., 0. ,1.) }  
 to the local coordinate system defined with the Ax2 ToSystem.  
 Same utilisation as the previous method. FromSystem1 is  
 defaulted to the absolute coordinate system.") SetTransformation;
		void SetTransformation (const gp_Ax3 & ToSystem);
		%feature("autodoc", "Args:
	V(gp_Vec)

Returns:
	None

Makes the transformation into a translation.  
 V is the vector of the translation.") SetTranslation;
		void SetTranslation (const gp_Vec & V);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

Makes the transformation into a translation from the point  
 P1 to the point P2.") SetTranslation;
		void SetTranslation (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

Converts the gp_Trsf transformation T into this transformation.") SetTrsf;
		void SetTrsf (const gp_Trsf & T);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Checks whether this transformation is an indirect  
transformation: returns true if the determinant of the  
matrix of the vectorial part of the transformation is less than 0.") IsNegative;
		Standard_Boolean IsNegative ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_TrsfForm

Returns the nature of this transformation as a value  
of the gp_TrsfForm enumeration.") Form;
		gp_TrsfForm Form ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the scale value of the transformation.") ScaleFactor;
		Standard_Real ScaleFactor ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Trsf

Returns a non transient copy of <self>.") Trsf;
		const gp_Trsf & Trsf ();
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Standard_Real

Returns the coefficients of the global matrix of tranformation.  
 It is a 3 rows X 4 columns matrix.  
 Raised if  Row < 1 or Row > 3  or  Col < 1 or Col > 4  
 Computes the reverse transformation.") Value;
		Standard_Real Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	None
Returns:
	None

Raised if the the transformation is singular. This means that  
 the ScaleFactor is lower or equal to Resolution from  
 package gp.") Invert;
		void Invert ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Transformation

Raised if the the transformation is singular. This means that  
 the ScaleFactor is lower or equal to Resolution from  
 package gp.") Inverted;
		Handle_Geom_Transformation Inverted ();
		%feature("autodoc", "Args:
	Other(Handle_Geom_Transformation)

Returns:
	Handle_Geom_Transformation

Computes the transformation composed with Other and <self>.  
 <self> * Other.  
 Returns a new transformation") Multiplied;
		Handle_Geom_Transformation Multiplied (const Handle_Geom_Transformation & Other);
		%feature("autodoc", "Args:
	Other(Handle_Geom_Transformation)

Returns:
	None

Computes the transformation composed with Other and <self> .  
 <self> = <self> * Other.") Multiply;
		void Multiply (const Handle_Geom_Transformation & Other);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	None

Computes the following composition of transformations  
 if N > 0  <self> * <self> * .......* <self>.  
 if N = 0  Identity  
 if N < 0  <self>.Invert() * .........* <self>.Invert()  
 Raised if N < 0 and if the transformation is not inversible") Power;
		void Power (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Handle_Geom_Transformation

Raised if N < 0 and if the transformation is not inversible") Powered;
		Handle_Geom_Transformation Powered (const Standard_Integer N);
		%feature("autodoc", "Args:
	Other(Handle_Geom_Transformation)

Returns:
	None

Computes the matrix of the transformation composed with  
 <self> and Other.     <self> = Other * <self>") PreMultiply;
		void PreMultiply (const Handle_Geom_Transformation & Other);
		%feature("autodoc", "Args:
	X(Standard_Real)
	Y(Standard_Real)
	Z(Standard_Real)

Returns:
	None

Applies the transformation <self> to the triplet {X, Y, Z}.") Transforms;
		void Transforms (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Transformation

Creates a new object which is a copy of this transformation.") Copy;
		Handle_Geom_Transformation Copy ();
};


%feature("shadow") Geom_Transformation::~Geom_Transformation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom_Transformation {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Geom_Transformation {
	Handle_Geom_Transformation GetHandle() {
	return *(Handle_Geom_Transformation*) &$self;
	}
};

%nodefaultctor Handle_Geom_Transformation;
class Handle_Geom_Transformation : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Geom_Transformation();
        Handle_Geom_Transformation(const Handle_Geom_Transformation &aHandle);
        Handle_Geom_Transformation(const Geom_Transformation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Geom_Transformation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Geom_Transformation {
    Geom_Transformation* GetObject() {
    return (Geom_Transformation*)$self->Access();
    }
};
%feature("shadow") Handle_Geom_Transformation::~Handle_Geom_Transformation %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Geom_Transformation {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Geom_AxisPlacement;
class Geom_AxisPlacement : public Geom_Geometry {
	public:
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	None

Assigns A1 as the 'main Axis' of this positioning system. This modifies  
- its origin, and  
- its 'main Direction'.  
 If this positioning system is a  
Geom_Axis2Placement, then its 'X Direction' and  
'Y Direction' are recomputed.  
Exceptions  
For a Geom_Axis2Placement:  
Standard_ConstructionError if A1 and the  
previous 'X Direction' of the coordinate system are parallel.") SetAxis;
		void SetAxis (const gp_Ax1 & A1);
		%feature("autodoc", "Args:
	V(gp_Dir)

Returns:
	virtual void

Changes the direction of the axis placement.  
 If <self> is an axis placement two axis the main 'Direction'  
 is modified and the 'XDirection' and 'YDirection' are  
 recomputed.  
   Raises ConstructionError only for an axis placement two axis if V and the  
 previous 'XDirection' are parallel because it is not possible  
 to calculate the new 'XDirection' and the new 'YDirection'.") SetDirection;
		virtual void SetDirection (const gp_Dir & V);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

Assigns the point P as the origin of this positioning  system.") SetLocation;
		void SetLocation (const gp_Pnt & P);
		%feature("autodoc", "Args:
	Other(Handle_Geom_AxisPlacement)

Returns:
	Standard_Real

Computes the angular value, in radians, between the  
'main Direction' of this positioning system and that  
of positioning system Other. The result is a value between 0 and Pi.") Angle;
		Standard_Real Angle (const Handle_Geom_AxisPlacement & Other);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

Returns the main axis of the axis placement.  
 For an 'Axis2placement' it is the main axis (Location, Direction ).  
 For an 'Axis1Placement' this method returns a copy of <self>.") Axis;
		const gp_Ax1 & Axis ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir

Returns the main 'Direction' of an axis placement.") Direction;
		gp_Dir Direction ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the Location point (origin) of the axis placement.") Location;
		gp_Pnt Location ();
};


%feature("shadow") Geom_AxisPlacement::~Geom_AxisPlacement %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom_AxisPlacement {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Geom_AxisPlacement {
	Handle_Geom_AxisPlacement GetHandle() {
	return *(Handle_Geom_AxisPlacement*) &$self;
	}
};

%nodefaultctor Handle_Geom_AxisPlacement;
class Handle_Geom_AxisPlacement : public Handle_Geom_Geometry {

    public:
        // constructors
        Handle_Geom_AxisPlacement();
        Handle_Geom_AxisPlacement(const Handle_Geom_AxisPlacement &aHandle);
        Handle_Geom_AxisPlacement(const Geom_AxisPlacement *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Geom_AxisPlacement DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Geom_AxisPlacement {
    Geom_AxisPlacement* GetObject() {
    return (Geom_AxisPlacement*)$self->Access();
    }
};
%feature("shadow") Handle_Geom_AxisPlacement::~Handle_Geom_AxisPlacement %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Geom_AxisPlacement {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Geom_Curve;
class Geom_Curve : public Geom_Geometry {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Changes the direction of parametrization of <self>.  
 The 'FirstParameter' and the 'LastParameter' are not changed  
 but the orientation  of the curve is modified. If the curve  
 is bounded the StartPoint of the initial curve becomes the  
 EndPoint of the reversed curve  and the EndPoint of the initial  
 curve becomes the StartPoint of the reversed curve.") Reverse;
		virtual void Reverse ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	virtual Standard_Real

Returns the  parameter on the  reversed  curve for  
         the point of parameter U on <self>.  
 
         me->Reversed()->Value(me->ReversedParameter(U))  
 
         is the same point as  
 
         me->Value(U)") ReversedParameter;
		virtual Standard_Real ReversedParameter (const Standard_Real U);
		%feature("autodoc", "Args:
	U(Standard_Real)
	T(gp_Trsf)

Returns:
	virtual Standard_Real

Returns the  parameter on the  transformed  curve for  
         the transform of the point of parameter U on <self>.  
 
         me->Transformed(T)->Value(me->TransformedParameter(U,T))  
 
         is the same point as  
 
         me->Value(U).Transformed(T)  
 
         This methods returns <U>  
 
         It can be redefined. For example on the Line.") TransformedParameter;
		virtual Standard_Real TransformedParameter (const Standard_Real U,const gp_Trsf & T);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	virtual Standard_Real

Returns a  coefficient to compute the parameter on  
         the transformed  curve  for  the transform  of the  
         point on <self>.  
 
         Transformed(T)->Value(U * ParametricTransformation(T))  
 
         is the same point as  
 
         Value(U).Transformed(T)  
 
         This methods returns 1.  
 
         It can be redefined. For example on the Line.") ParametricTransformation;
		virtual Standard_Real ParametricTransformation (const gp_Trsf & T);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Curve

Returns a copy of <self> reversed.") Reversed;
		Handle_Geom_Curve Reversed ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

Returns the value of the first parameter.  
 Warnings :  
 It can be RealFirst from package Standard  
 if the curve is infinite") FirstParameter;
		virtual Standard_Real FirstParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

Returns the value of the last parameter.  
 Warnings :  
 It can be RealLast from package Standard  
 if the curve is infinite") LastParameter;
		virtual Standard_Real LastParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns true if the curve is closed.  
 Some curves such as circle are always closed, others such as line  
 are never closed (by definition).  
 Some Curves such as OffsetCurve can be closed or not. These curves  
 are considered as closed if the distance between the first point  
 and the last point of the curve is lower or equal to the Resolution  
 from package gp wich is a fixed criterion independant of the  
 application.") IsClosed;
		virtual Standard_Boolean IsClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Is the parametrization of the curve periodic ?  
 It is possible only if the curve is closed and if the  
 following relation is satisfied :  
 for each parametric value U the distance between the point  
 P(u) and the point P (u + T) is lower or equal to Resolution  
 from package gp, T is the period and must be a constant.  
 There are three possibilities :  
  . the curve is never periodic by definition (SegmentLine)  
  . the curve is always periodic by definition (Circle)  
  . the curve can be defined as periodic (BSpline). In this case  
    a function SetPeriodic allows you to give the shape of the  
    curve.  The general rule for this case is : if a curve can be  
    periodic or not the default periodicity set is non periodic  
    and you have to turn (explicitly) the curve into a periodic  
    curve  if you want the curve to be periodic.") IsPeriodic;
		virtual Standard_Boolean IsPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

Returns the period of this curve.  
Exceptions Standard_NoSuchObject if this curve is not periodic.") Period;
		virtual Standard_Real Period ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual GeomAbs_Shape

It is the global continuity of the curve  
 C0 : only geometric continuity,  
 C1 : continuity of the first derivative all along the Curve,  
 C2 : continuity of the second derivative all along the Curve,  
 C3 : continuity of the third derivative all along the Curve,  
 G1 : tangency continuity all along the Curve,  
 G2 : curvature continuity all along the Curve,  
 CN : the order of continuity is infinite.") Continuity;
		virtual GeomAbs_Shape Continuity ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	virtual Standard_Boolean

Returns true if the degree of continuity of this curve is at least N.  
Exceptions -  Standard_RangeError if N is less than 0.") IsCN;
		virtual Standard_Boolean IsCN (const Standard_Integer N);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)

Returns:
	virtual void

Returns in P the point of parameter U.  
 If the curve is periodic  then the returned point is P(U) with  
 U = Ustart + (U - Uend)  where Ustart and Uend are the  
 parametric bounds of the curve.  
 Raised only for the 'OffsetCurve' if it is not possible to  
 compute the current point. For example when the first  
 derivative on the basis curve and the offset direction  
 are parallel.") D0;
		virtual void D0 (const Standard_Real U,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)

Returns:
	virtual void

Returns the point P of parameter U and the first derivative V1.  Raised if the continuity of the curve is not C1.") D1;
		virtual void D1 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)

Returns:
	virtual void

Returns the point P of parameter U, the first and second  
 derivatives V1 and V2.  Raised if the continuity of the curve is not C2.") D2;
		virtual void D2 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)
	V3(gp_Vec)

Returns:
	virtual void

Returns the point P of parameter U, the first, the second  
 and the third derivative.  Raised if the continuity of the curve is not C3.") D3;
		virtual void D3 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("autodoc", "Args:
	U(Standard_Real)
	N(Standard_Integer)

Returns:
	virtual gp_Vec

The returned vector gives the value of the derivative for the  
 order of derivation N.  Raised if the continuity of the curve is not CN.  
  Raised if the   derivative  cannot  be  computed  
        easily. e.g. rational bspline and n > 3.  Raised if N < 1.") DN;
		virtual gp_Vec DN (const Standard_Real U,const Standard_Integer N);
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	gp_Pnt

Computes the point of parameter U on <self>.  
 If the curve is periodic  then the returned point is P(U) with  
 U = Ustart + (U - Uend)  where Ustart and Uend are the  
 parametric bounds of the curve.  
 it is implemented with D0.  
 Raised only for the 'OffsetCurve' if it is not possible to  
 compute the current point. For example when the first  
 derivative on the basis curve and the offset direction are parallel.") Value;
		gp_Pnt Value (const Standard_Real U);
};


%feature("shadow") Geom_Curve::~Geom_Curve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom_Curve {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Geom_Curve {
	Handle_Geom_Curve GetHandle() {
	return *(Handle_Geom_Curve*) &$self;
	}
};

%nodefaultctor Handle_Geom_Curve;
class Handle_Geom_Curve : public Handle_Geom_Geometry {

    public:
        // constructors
        Handle_Geom_Curve();
        Handle_Geom_Curve(const Handle_Geom_Curve &aHandle);
        Handle_Geom_Curve(const Geom_Curve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Geom_Curve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Geom_Curve {
    Geom_Curve* GetObject() {
    return (Geom_Curve*)$self->Access();
    }
};
%feature("shadow") Handle_Geom_Curve::~Handle_Geom_Curve %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Geom_Curve {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Geom_Point;
class Geom_Point : public Geom_Geometry {
	public:
		%feature("autodoc", "Args:
	X(Standard_Real)
	Y(Standard_Real)
	Z(Standard_Real)

Returns:
	virtual void

returns the Coordinates of <self>.") Coord;
		virtual void Coord (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	virtual gp_Pnt

returns a non transient copy of <self>") Pnt;
		virtual gp_Pnt Pnt ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

returns the X coordinate of <self>.") X;
		virtual Standard_Real X ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

returns  the Y coordinate of <self>.") Y;
		virtual Standard_Real Y ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

returns the Z coordinate of <self>.") Z;
		virtual Standard_Real Z ();
		%feature("autodoc", "Args:
	Other(Handle_Geom_Point)

Returns:
	Standard_Real

Computes the distance between <self> and <Other>.") Distance;
		Standard_Real Distance (const Handle_Geom_Point & Other);
		%feature("autodoc", "Args:
	Other(Handle_Geom_Point)

Returns:
	Standard_Real

Computes the square distance between <self> and <Other>.") SquareDistance;
		Standard_Real SquareDistance (const Handle_Geom_Point & Other);
};


%feature("shadow") Geom_Point::~Geom_Point %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom_Point {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Geom_Point {
	Handle_Geom_Point GetHandle() {
	return *(Handle_Geom_Point*) &$self;
	}
};

%nodefaultctor Handle_Geom_Point;
class Handle_Geom_Point : public Handle_Geom_Geometry {

    public:
        // constructors
        Handle_Geom_Point();
        Handle_Geom_Point(const Handle_Geom_Point &aHandle);
        Handle_Geom_Point(const Geom_Point *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Geom_Point DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Geom_Point {
    Geom_Point* GetObject() {
    return (Geom_Point*)$self->Access();
    }
};
%feature("shadow") Handle_Geom_Point::~Handle_Geom_Point %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Geom_Point {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Geom_Surface;
class Geom_Surface : public Geom_Geometry {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Reverses the U direction of parametrization of <self>.  
 The bounds of the surface are not modified.") UReverse;
		virtual void UReverse ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Surface

Reverses the U direction of parametrization of <self>.  
 The bounds of the surface are not modified.  
 A copy of <self> is returned.") UReversed;
		Handle_Geom_Surface UReversed ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	virtual Standard_Real

Returns the  parameter on the  Ureversed surface for  
         the point of parameter U on <self>.  
 
         me->UReversed()->Value(me->UReversedParameter(U),V)  
 
         is the same point as  
 
         me->Value(U,V)") UReversedParameter;
		virtual Standard_Real UReversedParameter (const Standard_Real U);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Reverses the V direction of parametrization of <self>.  
 The bounds of the surface are not modified.") VReverse;
		virtual void VReverse ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Surface

Reverses the V direction of parametrization of <self>.  
 The bounds of the surface are not modified.  
 A copy of <self> is returned.") VReversed;
		Handle_Geom_Surface VReversed ();
		%feature("autodoc", "Args:
	V(Standard_Real)

Returns:
	virtual Standard_Real

Returns the  parameter on the  Vreversed surface for  
         the point of parameter V on <self>.  
 
         me->VReversed()->Value(U,me->VReversedParameter(V))  
 
         is the same point as  
 
         me->Value(U,V)") VReversedParameter;
		virtual Standard_Real VReversedParameter (const Standard_Real V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	T(gp_Trsf)

Returns:
	virtual void

Computes the  parameters on the  transformed  surface for  
         the transform of the point of parameters U,V on <self>.  
 
         me->Transformed(T)->Value(U',V')  
 
         is the same point as  
 
         me->Value(U,V).Transformed(T)  
 
         Where U',V' are the new values of U,V after calling  
 
         me->TranformParameters(U,V,T)  
 
         This methods does not change <U> and <V>  
 
         It  can be redefined.  For  example on  the Plane,  
         Cylinder, Cone, Revolved and Extruded surfaces.") TransformParameters;
		virtual void TransformParameters (Standard_Real &OutValue,Standard_Real &OutValue,const gp_Trsf & T);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	virtual gp_GTrsf2d

Returns a 2d transformation  used to find the  new  
         parameters of a point on the transformed surface.  
 
         me->Transformed(T)->Value(U',V')  
 
         is the same point as  
 
         me->Value(U,V).Transformed(T)  
 
         Where U',V' are  obtained by transforming U,V with  
         th 2d transformation returned by  
 
         me->ParametricTransformation(T)  
 
         This methods returns an identity transformation  
 
         It  can be redefined.  For  example on  the Plane,  
         Cylinder, Cone, Revolved and Extruded surfaces.") ParametricTransformation;
		virtual gp_GTrsf2d ParametricTransformation (const gp_Trsf & T);
		%feature("autodoc", "Args:
	U1(Standard_Real)
	U2(Standard_Real)
	V1(Standard_Real)
	V2(Standard_Real)

Returns:
	virtual void

Returns the parametric bounds U1, U2, V1 and V2 of this surface.  
If the surface is infinite, this function can return a value  
equal to Precision::Infinite: instead of Standard_Real::LastReal.") Bounds;
		virtual void Bounds (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Checks whether this surface is closed in the u  
parametric direction.  
Returns true if, in the u parametric direction: taking  
uFirst and uLast as the parametric bounds in  
the u parametric direction, for each parameter v, the  
distance between the points P(uFirst, v) and  
P(uLast, v) is less than or equal to gp::Resolution().") IsUClosed;
		virtual Standard_Boolean IsUClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Checks whether this surface is closed in the u  
parametric direction.  
Returns true if, in the v parametric  
direction: taking vFirst and vLast as the  
parametric bounds in the v parametric direction, for  
each parameter u, the distance between the points  
P(u, vFirst) and P(u, vLast) is less than  
or equal to gp::Resolution().") IsVClosed;
		virtual Standard_Boolean IsVClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Checks if this surface is periodic in the u  
parametric direction. Returns true if:  
- this surface is closed in the u parametric direction, and  
- there is a constant T such that the distance  
  between the points P (u, v) and P (u + T,  
  v) (or the points P (u, v) and P (u, v +  
  T)) is less than or equal to gp::Resolution().  
Note: T is the parametric period in the u parametric direction.") IsUPeriodic;
		virtual Standard_Boolean IsUPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

Returns the period of this surface in the u  
parametric direction.  raises if the surface is not uperiodic.") UPeriod;
		virtual Standard_Real UPeriod ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Checks if this surface is periodic in the v  
parametric direction. Returns true if:  
- this surface is closed in the v parametric direction, and  
- there is a constant T such that the distance  
  between the points P (u, v) and P (u + T,  
  v) (or the points P (u, v) and P (u, v +  
  T)) is less than or equal to gp::Resolution().  
Note: T is the parametric period in the v parametric direction.") IsVPeriodic;
		virtual Standard_Boolean IsVPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

Returns the period of this surface in the v parametric direction.  raises if the surface is not vperiodic.") VPeriod;
		virtual Standard_Real VPeriod ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	virtual Handle_Geom_Curve

Computes the U isoparametric curve.") UIso;
		virtual Handle_Geom_Curve UIso (const Standard_Real U);
		%feature("autodoc", "Args:
	V(Standard_Real)

Returns:
	virtual Handle_Geom_Curve

Computes the V isoparametric curve.") VIso;
		virtual Handle_Geom_Curve VIso (const Standard_Real V);
		%feature("autodoc", "Args:
	None
Returns:
	virtual GeomAbs_Shape

Returns the Global Continuity of the surface in direction U and V :  
 C0 : only geometric continuity,  
 C1 : continuity of the first derivative all along the surface,  
 C2 : continuity of the second derivative all along the surface,  
 C3 : continuity of the third derivative all along the surface,  
 G1 : tangency continuity all along the surface,  
 G2 : curvature continuity all along the surface,  
 CN : the order of continuity is infinite.  
Example :  
 If the surface is C1 in the V parametric direction and C2  
 in the U parametric direction Shape = C1.") Continuity;
		virtual GeomAbs_Shape Continuity ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	virtual Standard_Boolean

Returns the order of continuity of the surface in the  
 U parametric direction.  Raised if N < 0.") IsCNu;
		virtual Standard_Boolean IsCNu (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	virtual Standard_Boolean

Returns the order of continuity of the surface in the  
 V parametric direction.  Raised if N < 0.") IsCNv;
		virtual Standard_Boolean IsCNv (const Standard_Integer N);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)

Returns:
	virtual void

Computes the point of parameter U,V on the surface.  
 Raised only for an 'OffsetSurface' if it is not possible to  
 compute the current point.") D0;
		virtual void D0 (const Standard_Real U,const Standard_Real V,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)

Returns:
	virtual void

Computes the point P and the first derivatives in the  
 directions U and V at this point.  Raised if the continuity of the surface is not C1.") D1;
		virtual void D1 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	D2UV(gp_Vec)

Returns:
	virtual void

Computes the point P, the first and the second derivatives in  
 the directions U and V at this point.  Raised if the continuity of the surface is not C2.") D2;
		virtual void D2 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	D2UV(gp_Vec)
	D3U(gp_Vec)
	D3V(gp_Vec)
	D3UUV(gp_Vec)
	D3UVV(gp_Vec)

Returns:
	virtual void

Computes the point P, the first,the second and the third  
 derivatives in the directions U and V at this point.  Raised if the continuity of the surface is not C2.") D3;
		virtual void D3 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV,gp_Vec & D3U,gp_Vec & D3V,gp_Vec & D3UUV,gp_Vec & D3UVV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Nu(Standard_Integer)
	Nv(Standard_Integer)

Returns:
	virtual gp_Vec

//!---Purpose ;  
 Computes the derivative of order Nu in the direction U and Nv  
 in the direction V at the point P(U, V).  
 Raised if the continuity of the surface is not CNu in the U  
 direction or not CNv in the V direction.  Raised if Nu + Nv < 1 or Nu < 0 or Nv < 0.") DN;
		virtual gp_Vec DN (const Standard_Real U,const Standard_Real V,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)

Returns:
	gp_Pnt

Computes the point of parameter U on the surface.  
 
 It is implemented with D0  
 Raised only for an 'OffsetSurface' if it is not possible to  
 compute the current point.") Value;
		gp_Pnt Value (const Standard_Real U,const Standard_Real V);
};


%feature("shadow") Geom_Surface::~Geom_Surface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom_Surface {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Geom_Surface {
	Handle_Geom_Surface GetHandle() {
	return *(Handle_Geom_Surface*) &$self;
	}
};

%nodefaultctor Handle_Geom_Surface;
class Handle_Geom_Surface : public Handle_Geom_Geometry {

    public:
        // constructors
        Handle_Geom_Surface();
        Handle_Geom_Surface(const Handle_Geom_Surface &aHandle);
        Handle_Geom_Surface(const Geom_Surface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Geom_Surface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Geom_Surface {
    Geom_Surface* GetObject() {
    return (Geom_Surface*)$self->Access();
    }
};
%feature("shadow") Handle_Geom_Surface::~Handle_Geom_Surface %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Geom_Surface {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Geom_Vector;
class Geom_Vector : public Geom_Geometry {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Reverses the vector <self>.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Vector

Returns a copy of <self> reversed.") Reversed;
		Handle_Geom_Vector Reversed ();
		%feature("autodoc", "Args:
	Other(Handle_Geom_Vector)

Returns:
	Standard_Real

Computes the angular value, in radians, between this  
vector and vector Other. The result is a value between 0 and Pi.  
Exceptions  
gp_VectorWithNullMagnitude if:  
- the magnitude of this vector is less than or equal to  
  gp::Resolution(), or  
- the magnitude of vector Other is less than or equal  
  to gp::Resolution().") Angle;
		Standard_Real Angle (const Handle_Geom_Vector & Other);
		%feature("autodoc", "Args:
	Other(Handle_Geom_Vector)
	VRef(Handle_Geom_Vector)

Returns:
	Standard_Real

Computes the angular value, in radians, between this  
vector and vector Other. The result is a value  
between -Pi and Pi. The vector VRef defines the  
positive sense of rotation: the angular value is positive  
if the cross product this ^ Other has the same  
orientation as VRef (in relation to the plane defined  
by this vector and vector Other). Otherwise, it is negative.  
Exceptions  
Standard_DomainError if this vector, vector Other  
and vector VRef are coplanar, except if this vector  
and vector Other are parallel.  
gp_VectorWithNullMagnitude if the magnitude of  
this vector, vector Other or vector VRef is less than  
or equal to gp::Resolution().") AngleWithRef;
		Standard_Real AngleWithRef (const Handle_Geom_Vector & Other,const Handle_Geom_Vector & VRef);
		%feature("autodoc", "Args:
	X(Standard_Real)
	Y(Standard_Real)
	Z(Standard_Real)

Returns:
	None

Returns the coordinates X, Y and Z of this vector.") Coord;
		void Coord (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

Returns the  Magnitude of <self>.") Magnitude;
		virtual Standard_Real Magnitude ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

Returns the square magnitude of <self>.") SquareMagnitude;
		virtual Standard_Real SquareMagnitude ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the X coordinate of <self>.") X;
		Standard_Real X ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the Y coordinate of <self>.") Y;
		Standard_Real Y ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the Z coordinate of <self>.") Z;
		Standard_Real Z ();
		%feature("autodoc", "Args:
	Other(Handle_Geom_Vector)

Returns:
	virtual void

Computes the cross product between <self> and <Other>.  
 Raised if <self> is a 'Direction' and if <self> and <Other>  
 are parallel because it is not possible to build a  
 'Direction' with null length.") Cross;
		virtual void Cross (const Handle_Geom_Vector & Other);
		%feature("autodoc", "Args:
	Other(Handle_Geom_Vector)

Returns:
	virtual Handle_Geom_Vector

Computes the cross product between <self> and <Other>.  
 A new direction is returned.  
 Raised if <self> is a 'Direction' and if the two vectors  
 are parallel because it is not possible to create a  
 'Direction' with null length.") Crossed;
		virtual Handle_Geom_Vector Crossed (const Handle_Geom_Vector & Other);
		%feature("autodoc", "Args:
	V1(Handle_Geom_Vector)
	V2(Handle_Geom_Vector)

Returns:
	virtual void

Computes the triple vector product  <self> ^(V1 ^ V2).  
 Raised if <self> is a 'Direction' and if V1 and V2 are parallel  
 or <self> and (V1 ^ V2) are  parallel") CrossCross;
		virtual void CrossCross (const Handle_Geom_Vector & V1,const Handle_Geom_Vector & V2);
		%feature("autodoc", "Args:
	V1(Handle_Geom_Vector)
	V2(Handle_Geom_Vector)

Returns:
	virtual Handle_Geom_Vector

Computes the triple vector product <self> ^(V1 ^ V2).  
 Raised if <self> is a direction and if V1 and V2 are  
 parallel or <self> and (V1 ^ V2) are parallel") CrossCrossed;
		virtual Handle_Geom_Vector CrossCrossed (const Handle_Geom_Vector & V1,const Handle_Geom_Vector & V2);
		%feature("autodoc", "Args:
	Other(Handle_Geom_Vector)

Returns:
	Standard_Real

Computes the scalar product of this vector and vector Other.") Dot;
		Standard_Real Dot (const Handle_Geom_Vector & Other);
		%feature("autodoc", "Args:
	V1(Handle_Geom_Vector)
	V2(Handle_Geom_Vector)

Returns:
	Standard_Real

Computes the triple scalar product. Returns me . (V1 ^ V2)") DotCross;
		Standard_Real DotCross (const Handle_Geom_Vector & V1,const Handle_Geom_Vector & V2);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec

Converts this vector into a gp_Vec vector.") Vec;
		const gp_Vec & Vec ();
};


%feature("shadow") Geom_Vector::~Geom_Vector %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom_Vector {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Geom_Vector {
	Handle_Geom_Vector GetHandle() {
	return *(Handle_Geom_Vector*) &$self;
	}
};

%nodefaultctor Handle_Geom_Vector;
class Handle_Geom_Vector : public Handle_Geom_Geometry {

    public:
        // constructors
        Handle_Geom_Vector();
        Handle_Geom_Vector(const Handle_Geom_Vector &aHandle);
        Handle_Geom_Vector(const Geom_Vector *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Geom_Vector DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Geom_Vector {
    Geom_Vector* GetObject() {
    return (Geom_Vector*)$self->Access();
    }
};
%feature("shadow") Handle_Geom_Vector::~Handle_Geom_Vector %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Geom_Vector {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Geom_Axis1Placement;
class Geom_Axis1Placement : public Geom_AxisPlacement {
	public:
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	None

Returns a transient copy of A1.") Geom_Axis1Placement;
		 Geom_Axis1Placement (const gp_Ax1 & A1);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	V(gp_Dir)

Returns:
	None

P is the origin of the axis placement and V is the direction  
 of the axis placement.") Geom_Axis1Placement;
		 Geom_Axis1Placement (const gp_Pnt & P,const gp_Dir & V);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

Returns a non transient copy of <self>.") Ax1;
		const gp_Ax1 & Ax1 ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Reverses the direction of the axis placement.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Axis1Placement

Returns a copy of <self> reversed.") Reversed;
		Handle_Geom_Axis1Placement Reversed ();
		%feature("autodoc", "Args:
	V(gp_Dir)

Returns:
	None

Assigns V to the unit vector of this axis.") SetDirection;
		void SetDirection (const gp_Dir & V);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

Applies the transformation T to this axis.") Transform;
		void Transform (const gp_Trsf & T);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Geometry

Creates a new object, which is a copy of this axis.") Copy;
		Handle_Geom_Geometry Copy ();
};


%feature("shadow") Geom_Axis1Placement::~Geom_Axis1Placement %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom_Axis1Placement {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Geom_Axis1Placement {
	Handle_Geom_Axis1Placement GetHandle() {
	return *(Handle_Geom_Axis1Placement*) &$self;
	}
};

%nodefaultctor Handle_Geom_Axis1Placement;
class Handle_Geom_Axis1Placement : public Handle_Geom_AxisPlacement {

    public:
        // constructors
        Handle_Geom_Axis1Placement();
        Handle_Geom_Axis1Placement(const Handle_Geom_Axis1Placement &aHandle);
        Handle_Geom_Axis1Placement(const Geom_Axis1Placement *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Geom_Axis1Placement DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Geom_Axis1Placement {
    Geom_Axis1Placement* GetObject() {
    return (Geom_Axis1Placement*)$self->Access();
    }
};
%feature("shadow") Handle_Geom_Axis1Placement::~Handle_Geom_Axis1Placement %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Geom_Axis1Placement {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Geom_Axis2Placement;
class Geom_Axis2Placement : public Geom_AxisPlacement {
	public:
		%feature("autodoc", "Args:
	A2(gp_Ax2)

Returns:
	None

Returns a transient copy of A2.") Geom_Axis2Placement;
		 Geom_Axis2Placement (const gp_Ax2 & A2);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	N(gp_Dir)
	Vx(gp_Dir)

Returns:
	None

P is the origin of the axis placement, N is the main  
 direction of the axis placement and Vx is the 'XDirection'.  
 If the two directions N and Vx are not orthogonal the  
 'XDirection' is computed as follow :  
 XDirection = N ^ (Vx ^ N).  Raised if N and Vx are parallel.") Geom_Axis2Placement;
		 Geom_Axis2Placement (const gp_Pnt & P,const gp_Dir & N,const gp_Dir & Vx);
		%feature("autodoc", "Args:
	A2(gp_Ax2)

Returns:
	None

Assigns the origin and the three unit vectors of A2 to  
this coordinate system.") SetAx2;
		void SetAx2 (const gp_Ax2 & A2);
		%feature("autodoc", "Args:
	V(gp_Dir)

Returns:
	None

Changes the main direction of the axis placement.  
 The 'Xdirection' is modified :  
 New XDirection = V ^ (Previous_Xdirection ^ V).  
 Raised if V and the previous 'XDirection' are parallel  
 because it is impossible to calculate the new 'XDirection'  
 and the new 'YDirection'.") SetDirection;
		void SetDirection (const gp_Dir & V);
		%feature("autodoc", "Args:
	Vx(gp_Dir)

Returns:
	None

Changes the 'XDirection' of the axis placement, Vx is the  
 new 'XDirection'. If Vx is not normal to the main direction  
 then 'XDirection' is computed as follow :  
 XDirection = Direction ^ ( Vx ^ Direction).  
 The main direction is not modified.   Raised if Vx and 'Direction'  are parallel.") SetXDirection;
		void SetXDirection (const gp_Dir & Vx);
		%feature("autodoc", "Args:
	Vy(gp_Dir)

Returns:
	None

Changes the 'YDirection' of the axis placement, Vy is the  
 new 'YDirection'. If Vy is not normal to the main direction  
 then 'YDirection' is computed as follow :  
 YDirection = Direction ^ ( Vy ^ Direction).  
 The main direction is not modified. The 'XDirection' is  
 modified.  Raised if Vy and the main direction are parallel.") SetYDirection;
		void SetYDirection (const gp_Dir & Vy);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax2

Returns a non transient copy of <self>.") Ax2;
		gp_Ax2 Ax2 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir

Returns the 'XDirection'. This is a unit vector.") XDirection;
		const gp_Dir & XDirection ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir

Returns the 'YDirection'. This is a unit vector.") YDirection;
		const gp_Dir & YDirection ();
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

Transforms an axis placement with a Trsf.  
 The 'Location' point, the 'XDirection' and the  
 'YDirection' are transformed with T.  The resulting  
 main 'Direction' of <self> is the cross product between  
 the 'XDirection' and the 'YDirection' after transformation.") Transform;
		void Transform (const gp_Trsf & T);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Geometry

Creates a new object which is a copy of this coordinate system.") Copy;
		Handle_Geom_Geometry Copy ();
};


%feature("shadow") Geom_Axis2Placement::~Geom_Axis2Placement %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom_Axis2Placement {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Geom_Axis2Placement {
	Handle_Geom_Axis2Placement GetHandle() {
	return *(Handle_Geom_Axis2Placement*) &$self;
	}
};

%nodefaultctor Handle_Geom_Axis2Placement;
class Handle_Geom_Axis2Placement : public Handle_Geom_AxisPlacement {

    public:
        // constructors
        Handle_Geom_Axis2Placement();
        Handle_Geom_Axis2Placement(const Handle_Geom_Axis2Placement &aHandle);
        Handle_Geom_Axis2Placement(const Geom_Axis2Placement *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Geom_Axis2Placement DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Geom_Axis2Placement {
    Geom_Axis2Placement* GetObject() {
    return (Geom_Axis2Placement*)$self->Access();
    }
};
%feature("shadow") Handle_Geom_Axis2Placement::~Handle_Geom_Axis2Placement %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Geom_Axis2Placement {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Geom_BoundedCurve;
class Geom_BoundedCurve : public Geom_Curve {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	virtual gp_Pnt

Returns the end point of the curve.") EndPoint;
		virtual gp_Pnt EndPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual gp_Pnt

Returns the start point of the curve.") StartPoint;
		virtual gp_Pnt StartPoint ();
};


%feature("shadow") Geom_BoundedCurve::~Geom_BoundedCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom_BoundedCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Geom_BoundedCurve {
	Handle_Geom_BoundedCurve GetHandle() {
	return *(Handle_Geom_BoundedCurve*) &$self;
	}
};

%nodefaultctor Handle_Geom_BoundedCurve;
class Handle_Geom_BoundedCurve : public Handle_Geom_Curve {

    public:
        // constructors
        Handle_Geom_BoundedCurve();
        Handle_Geom_BoundedCurve(const Handle_Geom_BoundedCurve &aHandle);
        Handle_Geom_BoundedCurve(const Geom_BoundedCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Geom_BoundedCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Geom_BoundedCurve {
    Geom_BoundedCurve* GetObject() {
    return (Geom_BoundedCurve*)$self->Access();
    }
};
%feature("shadow") Handle_Geom_BoundedCurve::~Handle_Geom_BoundedCurve %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Geom_BoundedCurve {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Geom_BoundedSurface;
class Geom_BoundedSurface : public Geom_Surface {
	public:
};


%feature("shadow") Geom_BoundedSurface::~Geom_BoundedSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom_BoundedSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Geom_BoundedSurface {
	Handle_Geom_BoundedSurface GetHandle() {
	return *(Handle_Geom_BoundedSurface*) &$self;
	}
};

%nodefaultctor Handle_Geom_BoundedSurface;
class Handle_Geom_BoundedSurface : public Handle_Geom_Surface {

    public:
        // constructors
        Handle_Geom_BoundedSurface();
        Handle_Geom_BoundedSurface(const Handle_Geom_BoundedSurface &aHandle);
        Handle_Geom_BoundedSurface(const Geom_BoundedSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Geom_BoundedSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Geom_BoundedSurface {
    Geom_BoundedSurface* GetObject() {
    return (Geom_BoundedSurface*)$self->Access();
    }
};
%feature("shadow") Handle_Geom_BoundedSurface::~Handle_Geom_BoundedSurface %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Geom_BoundedSurface {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Geom_CartesianPoint;
class Geom_CartesianPoint : public Geom_Point {
	public:
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

Returns a transient copy of P.") Geom_CartesianPoint;
		 Geom_CartesianPoint (const gp_Pnt & P);
		%feature("autodoc", "Args:
	X(Standard_Real)
	Y(Standard_Real)
	Z(Standard_Real)

Returns:
	None

Constructs a point defined by its three Cartesian coordinates X, Y and Z.") Geom_CartesianPoint;
		 Geom_CartesianPoint (const Standard_Real X,const Standard_Real Y,const Standard_Real Z);
		%feature("autodoc", "Args:
	X(Standard_Real)
	Y(Standard_Real)
	Z(Standard_Real)

Returns:
	None

Assigns the coordinates X, Y and Z to this point.") SetCoord;
		void SetCoord (const Standard_Real X,const Standard_Real Y,const Standard_Real Z);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

Set <self> to P.X(), P.Y(), P.Z() coordinates.") SetPnt;
		void SetPnt (const gp_Pnt & P);
		%feature("autodoc", "Args:
	X(Standard_Real)

Returns:
	None

Changes the X coordinate of me.") SetX;
		void SetX (const Standard_Real X);
		%feature("autodoc", "Args:
	Y(Standard_Real)

Returns:
	None

Changes the Y coordinate of me.") SetY;
		void SetY (const Standard_Real Y);
		%feature("autodoc", "Args:
	Z(Standard_Real)

Returns:
	None

Changes the Z coordinate of me.") SetZ;
		void SetZ (const Standard_Real Z);
		%feature("autodoc", "Args:
	X(Standard_Real)
	Y(Standard_Real)
	Z(Standard_Real)

Returns:
	None

Returns the coordinates of <self>.") Coord;
		void Coord (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns a non transient cartesian point with  
 the same coordinates as <self>.") Pnt;
		gp_Pnt Pnt ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the X coordinate of <self>.") X;
		Standard_Real X ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the Y coordinate of <self>.") Y;
		Standard_Real Y ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the Z coordinate of <self>.") Z;
		Standard_Real Z ();
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

Applies the transformation T to this point.") Transform;
		void Transform (const gp_Trsf & T);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Geometry

Creates a new object which is a copy of this point.") Copy;
		Handle_Geom_Geometry Copy ();
};


%feature("shadow") Geom_CartesianPoint::~Geom_CartesianPoint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom_CartesianPoint {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Geom_CartesianPoint {
	Handle_Geom_CartesianPoint GetHandle() {
	return *(Handle_Geom_CartesianPoint*) &$self;
	}
};

%nodefaultctor Handle_Geom_CartesianPoint;
class Handle_Geom_CartesianPoint : public Handle_Geom_Point {

    public:
        // constructors
        Handle_Geom_CartesianPoint();
        Handle_Geom_CartesianPoint(const Handle_Geom_CartesianPoint &aHandle);
        Handle_Geom_CartesianPoint(const Geom_CartesianPoint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Geom_CartesianPoint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Geom_CartesianPoint {
    Geom_CartesianPoint* GetObject() {
    return (Geom_CartesianPoint*)$self->Access();
    }
};
%feature("shadow") Handle_Geom_CartesianPoint::~Handle_Geom_CartesianPoint %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Geom_CartesianPoint {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Geom_Conic;
class Geom_Conic : public Geom_Curve {
	public:
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	None

Changes the orientation of the conic's plane. The normal  
 axis to the plane is A1. The XAxis and the YAxis are recomputed.  
 raised if the A1 is parallel to the XAxis of the conic.") SetAxis;
		void SetAxis (const gp_Ax1 & A1);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

changes the location point of the conic.") SetLocation;
		void SetLocation (const gp_Pnt & P);
		%feature("autodoc", "Args:
	A2(gp_Ax2)

Returns:
	None

changes the local coordinate system of the conic.") SetPosition;
		void SetPosition (const gp_Ax2 & A2);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

Returns the 'main Axis' of this conic. This axis is  
normal to the plane of the conic.") Axis;
		gp_Ax1 Axis ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

Returns the eccentricity value of the conic e.  
 e = 0 for a circle  
 0 < e < 1 for an ellipse  (e = 0 if MajorRadius = MinorRadius)  
 e > 1 for a hyperbola  
 e = 1 for a parabola  
 Exceptions  
Standard_DomainError in the case of a hyperbola if  
its major radius is null.") Eccentricity;
		virtual Standard_Real Eccentricity ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the location point of the conic.  
 For the circle, the ellipse and the hyperbola it is the center of  
 the conic. For the parabola it is the Apex of the parabola.") Location;
		gp_Pnt Location ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax2

Returns the local coordinates system of the conic.  
 The main direction of the Axis2Placement is normal to the  
 plane of the conic. The X direction of the Axis2placement  
 is in the plane of the conic and corresponds to the origin  
 for the conic's parametric value u.") Position;
		const gp_Ax2 & Position ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

Returns the XAxis of the conic.  
This axis defines the origin of parametrization of the conic.  
This axis is perpendicular to the Axis of the conic.  
This axis and the Yaxis define the plane of the conic.") XAxis;
		gp_Ax1 XAxis ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

Returns the YAxis of the conic.  
 The YAxis is perpendicular to the Xaxis.  
 This axis and the Xaxis define the plane of the conic.") YAxis;
		gp_Ax1 YAxis ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Reverses the direction of parameterization of <self>.  
 The local coordinate system of the conic is modified.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	virtual Standard_Real

Returns the  parameter on the  reversed  curve for  
         the point of parameter U on <self>.") ReversedParameter;
		virtual Standard_Real ReversedParameter (const Standard_Real U);
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_Shape

The continuity of the conic is Cn.") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Boolean

Returns True.  Raised if N < 0.") IsCN;
		Standard_Boolean IsCN (const Standard_Integer N);
};


%feature("shadow") Geom_Conic::~Geom_Conic %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom_Conic {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Geom_Conic {
	Handle_Geom_Conic GetHandle() {
	return *(Handle_Geom_Conic*) &$self;
	}
};

%nodefaultctor Handle_Geom_Conic;
class Handle_Geom_Conic : public Handle_Geom_Curve {

    public:
        // constructors
        Handle_Geom_Conic();
        Handle_Geom_Conic(const Handle_Geom_Conic &aHandle);
        Handle_Geom_Conic(const Geom_Conic *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Geom_Conic DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Geom_Conic {
    Geom_Conic* GetObject() {
    return (Geom_Conic*)$self->Access();
    }
};
%feature("shadow") Handle_Geom_Conic::~Handle_Geom_Conic %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Geom_Conic {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Geom_Direction;
class Geom_Direction : public Geom_Vector {
	public:
		%feature("autodoc", "Args:
	X(Standard_Real)
	Y(Standard_Real)
	Z(Standard_Real)

Returns:
	None

Creates a unit vector with it 3 cartesian coordinates.  
 Raised if Sqrt( X*X + Y*Y + Z*Z) <= Resolution from gp.") Geom_Direction;
		 Geom_Direction (const Standard_Real X,const Standard_Real Y,const Standard_Real Z);
		%feature("autodoc", "Args:
	V(gp_Dir)

Returns:
	None

Creates a transient copy of <self>.") Geom_Direction;
		 Geom_Direction (const gp_Dir & V);
		%feature("autodoc", "Args:
	X(Standard_Real)
	Y(Standard_Real)
	Z(Standard_Real)

Returns:
	None

Sets <self> to X,Y,Z coordinates.  
 Raised if Sqrt( X*X + Y*Y + Z*Z) <= Resolution from gp.") SetCoord;
		void SetCoord (const Standard_Real X,const Standard_Real Y,const Standard_Real Z);
		%feature("autodoc", "Args:
	V(gp_Dir)

Returns:
	None

Converts the gp_Dir unit vector V into this unit vector.") SetDir;
		void SetDir (const gp_Dir & V);
		%feature("autodoc", "Args:
	X(Standard_Real)

Returns:
	None

Changes the X coordinate of <self>.  
 Raised if Sqrt( X*X + Y*Y + Z*Z) <= Resolution from gp.") SetX;
		void SetX (const Standard_Real X);
		%feature("autodoc", "Args:
	Y(Standard_Real)

Returns:
	None

Changes the Y coordinate of <self>.  
 Raised if Sqrt( X*X + Y*Y + Z*Z) <= Resolution from gp.") SetY;
		void SetY (const Standard_Real Y);
		%feature("autodoc", "Args:
	Z(Standard_Real)

Returns:
	None

Changes the Z coordinate of <self>.  
 Raised if Sqrt( X*X + Y*Y + Z*Z) <= Resolution from gp.") SetZ;
		void SetZ (const Standard_Real Z);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir

Returns the non transient direction with the same  
 coordinates as <self>.") Dir;
		gp_Dir Dir ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

returns 1.0 which is the magnitude of any unit vector.") Magnitude;
		Standard_Real Magnitude ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

returns 1.0 which is the square magnitude of any unit vector.") SquareMagnitude;
		Standard_Real SquareMagnitude ();
		%feature("autodoc", "Args:
	Other(Handle_Geom_Vector)

Returns:
	None

Computes the cross product between <self> and <Other>.  
 Raised if the two vectors are parallel because it is  
 not possible to have a direction with null length.") Cross;
		void Cross (const Handle_Geom_Vector & Other);
		%feature("autodoc", "Args:
	V1(Handle_Geom_Vector)
	V2(Handle_Geom_Vector)

Returns:
	None

Computes the triple vector product  <self> ^(V1 ^ V2).  
 Raised if V1 and V2 are parallel or <self> and (V1 ^ V2) are  
 parallel") CrossCross;
		void CrossCross (const Handle_Geom_Vector & V1,const Handle_Geom_Vector & V2);
		%feature("autodoc", "Args:
	Other(Handle_Geom_Vector)

Returns:
	Handle_Geom_Vector

Computes the cross product between <self> and <Other>.  
 A new direction is returned.  
 Raised if the two vectors are parallel because it is  
 not possible to have a direction with null length.") Crossed;
		Handle_Geom_Vector Crossed (const Handle_Geom_Vector & Other);
		%feature("autodoc", "Args:
	V1(Handle_Geom_Vector)
	V2(Handle_Geom_Vector)

Returns:
	Handle_Geom_Vector

Computes the triple vector product <self> ^(V1 ^ V2).  
 Raised if V1 and V2 are parallel or <self> and (V1 ^ V2) are  
 parallel") CrossCrossed;
		Handle_Geom_Vector CrossCrossed (const Handle_Geom_Vector & V1,const Handle_Geom_Vector & V2);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

Applies the transformation T to this unit vector, then normalizes it.") Transform;
		void Transform (const gp_Trsf & T);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Geometry

Creates a new object which is a copy of this unit vector.") Copy;
		Handle_Geom_Geometry Copy ();
};


%feature("shadow") Geom_Direction::~Geom_Direction %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom_Direction {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Geom_Direction {
	Handle_Geom_Direction GetHandle() {
	return *(Handle_Geom_Direction*) &$self;
	}
};

%nodefaultctor Handle_Geom_Direction;
class Handle_Geom_Direction : public Handle_Geom_Vector {

    public:
        // constructors
        Handle_Geom_Direction();
        Handle_Geom_Direction(const Handle_Geom_Direction &aHandle);
        Handle_Geom_Direction(const Geom_Direction *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Geom_Direction DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Geom_Direction {
    Geom_Direction* GetObject() {
    return (Geom_Direction*)$self->Access();
    }
};
%feature("shadow") Handle_Geom_Direction::~Handle_Geom_Direction %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Geom_Direction {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Geom_ElementarySurface;
class Geom_ElementarySurface : public Geom_Surface {
	public:
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	None

Changes the main axis (ZAxis) of the elementary surface.  
 Raised if the direction of A1 is parallel to the XAxis of the  
 coordinate system of the surface.") SetAxis;
		void SetAxis (const gp_Ax1 & A1);
		%feature("autodoc", "Args:
	Loc(gp_Pnt)

Returns:
	None

Changes the location of the local coordinates system of the  
 surface.") SetLocation;
		void SetLocation (const gp_Pnt & Loc);
		%feature("autodoc", "Args:
	A3(gp_Ax3)

Returns:
	None

Changes the local coordinates system of the surface.") SetPosition;
		void SetPosition (const gp_Ax3 & A3);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

Returns the main axis of the surface (ZAxis).") Axis;
		gp_Ax1 Axis ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the location point of the local coordinate system of the  
 surface.") Location;
		gp_Pnt Location ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax3

Returns the local coordinates system of the surface.") Position;
		const gp_Ax3 & Position ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Reverses the U parametric direction of the surface.") UReverse;
		virtual void UReverse ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	virtual Standard_Real

Return the  parameter on the  Ureversed surface for  
         the point of parameter U on <self>.  
 
         me->UReversed()->Value(me->UReversedParameter(U),V)  
           is the same point as  
         me->Value(U,V)") UReversedParameter;
		virtual Standard_Real UReversedParameter (const Standard_Real U);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Reverses the V parametric direction of the surface.") VReverse;
		virtual void VReverse ();
		%feature("autodoc", "Args:
	V(Standard_Real)

Returns:
	virtual Standard_Real

Return the  parameter on the  Vreversed surface for  
         the point of parameter V on <self>.  
 
         me->VReversed()->Value(U,me->VReversedParameter(V))  
           is the same point as  
         me->Value(U,V)") VReversedParameter;
		virtual Standard_Real VReversedParameter (const Standard_Real V);
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_Shape

Returns GeomAbs_CN, the global continuity of any elementary surface.") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Boolean

Returns True.") IsCNu;
		Standard_Boolean IsCNu (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Boolean

Returns True.") IsCNv;
		Standard_Boolean IsCNv (const Standard_Integer N);
};


%feature("shadow") Geom_ElementarySurface::~Geom_ElementarySurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom_ElementarySurface {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Geom_ElementarySurface {
	Handle_Geom_ElementarySurface GetHandle() {
	return *(Handle_Geom_ElementarySurface*) &$self;
	}
};

%nodefaultctor Handle_Geom_ElementarySurface;
class Handle_Geom_ElementarySurface : public Handle_Geom_Surface {

    public:
        // constructors
        Handle_Geom_ElementarySurface();
        Handle_Geom_ElementarySurface(const Handle_Geom_ElementarySurface &aHandle);
        Handle_Geom_ElementarySurface(const Geom_ElementarySurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Geom_ElementarySurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Geom_ElementarySurface {
    Geom_ElementarySurface* GetObject() {
    return (Geom_ElementarySurface*)$self->Access();
    }
};
%feature("shadow") Handle_Geom_ElementarySurface::~Handle_Geom_ElementarySurface %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Geom_ElementarySurface {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Geom_Line;
class Geom_Line : public Geom_Curve {
	public:
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	None

Creates a line located in 3D space with the axis placement A1.  
 The Location of A1 is the origin of the line.") Geom_Line;
		 Geom_Line (const gp_Ax1 & A1);
		%feature("autodoc", "Args:
	L(gp_Lin)

Returns:
	None

Creates a line from a non transient line from package gp.") Geom_Line;
		 Geom_Line (const gp_Lin & L);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	V(gp_Dir)

Returns:
	None

Constructs a line passing through point P and parallel to vector V  
  (P and V are, respectively, the origin and the unit  
  vector of the positioning axis of the line).") Geom_Line;
		 Geom_Line (const gp_Pnt & P,const gp_Dir & V);
		%feature("autodoc", "Args:
	L(gp_Lin)

Returns:
	None

Set <self> so that <self> has the same geometric properties as L.") SetLin;
		void SetLin (const gp_Lin & L);
		%feature("autodoc", "Args:
	V(gp_Dir)

Returns:
	None

changes the direction of the line.") SetDirection;
		void SetDirection (const gp_Dir & V);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

changes the 'Location' point (origin) of the line.") SetLocation;
		void SetLocation (const gp_Pnt & P);
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	None

changes the 'Location' and a the 'Direction' of <self>.") SetPosition;
		void SetPosition (const gp_Ax1 & A1);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Lin

Returns non transient line from gp with the same geometric  
 properties as <self>") Lin;
		gp_Lin Lin ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

Returns the positioning axis of this line; this is also its local coordinate system.") Position;
		const gp_Ax1 & Position ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Changes the orientation of this line. As a result, the  
unit vector of the positioning axis of this line is reversed.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Standard_Real

Computes the parameter on the reversed line for the  
point of parameter U on this line.  
For a line, the returned value is -U.") ReversedParameter;
		Standard_Real ReversedParameter (const Standard_Real U);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the value of the first parameter of this  
line. This is Standard_Real::RealFirst().") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the value of the last parameter of this  
line. This is  Standard_Real::RealLast().") LastParameter;
		Standard_Real LastParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns False") IsClosed;
		Standard_Boolean IsClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns False") IsPeriodic;
		Standard_Boolean IsPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_Shape

Returns GeomAbs_CN, which is the global continuity of any line.") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Boolean

returns True.  Raised if N < 0.") IsCN;
		Standard_Boolean IsCN (const Standard_Integer N);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)

Returns:
	None

Returns in P the point of parameter U.  
 P (U) = O + U * Dir where O is the 'Location' point of the  
 line and Dir the direction of the line.") D0;
		void D0 (const Standard_Real U,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)

Returns:
	None

Returns the point P of parameter u and the first derivative V1.") D1;
		void D1 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)

Returns:
	None

Returns the point P of parameter U, the first and second  
 derivatives V1 and V2. V2 is a vector with null magnitude  
 for a line.") D2;
		void D2 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)
	V3(gp_Vec)

Returns:
	None

V2 and V3 are vectors with null magnitude for a line.") D3;
		void D3 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("autodoc", "Args:
	U(Standard_Real)
	N(Standard_Integer)

Returns:
	gp_Vec

The returned vector gives the value of the derivative for the  
 order of derivation N.  Raised if N < 1.") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Integer N);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

Applies the transformation T to this line.") Transform;
		void Transform (const gp_Trsf & T);
		%feature("autodoc", "Args:
	U(Standard_Real)
	T(gp_Trsf)

Returns:
	virtual Standard_Real

Returns the  parameter on the  transformed  curve for  
         the transform of the point of parameter U on <self>.  
 
         me->Transformed(T)->Value(me->TransformedParameter(U,T))  
 
         is the same point as  
 
         me->Value(U).Transformed(T)  
 
         This methods returns <U> * T.ScaleFactor()") TransformedParameter;
		virtual Standard_Real TransformedParameter (const Standard_Real U,const gp_Trsf & T);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	virtual Standard_Real

Returns a  coefficient to compute the parameter on  
         the transformed  curve  for  the transform  of the  
         point on <self>.  
 
         Transformed(T)->Value(U * ParametricTransformation(T))  
 
         is the same point as  
 
         Value(U).Transformed(T)  
 
         This methods returns T.ScaleFactor()") ParametricTransformation;
		virtual Standard_Real ParametricTransformation (const gp_Trsf & T);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Geometry

Creates a new object which is a copy of this line.") Copy;
		Handle_Geom_Geometry Copy ();
};


%feature("shadow") Geom_Line::~Geom_Line %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom_Line {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Geom_Line {
	Handle_Geom_Line GetHandle() {
	return *(Handle_Geom_Line*) &$self;
	}
};

%nodefaultctor Handle_Geom_Line;
class Handle_Geom_Line : public Handle_Geom_Curve {

    public:
        // constructors
        Handle_Geom_Line();
        Handle_Geom_Line(const Handle_Geom_Line &aHandle);
        Handle_Geom_Line(const Geom_Line *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Geom_Line DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Geom_Line {
    Geom_Line* GetObject() {
    return (Geom_Line*)$self->Access();
    }
};
%feature("shadow") Handle_Geom_Line::~Handle_Geom_Line %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Geom_Line {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Geom_OffsetCurve;
class Geom_OffsetCurve : public Geom_Curve {
	public:
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)
	Offset(Standard_Real)
	V(gp_Dir)

Returns:
	None

C is the basis curve, Offset is the distance between <self> and  
 the basis curve at any point. V defines the fixed reference  
 direction (offset direction). If P is a point on the basis  
 curve and T the first derivative with non zero length  
 at this point, the corresponding point on the offset curve is  
 in the direction of the vector-product N = V ^ T   where  
 N is a unitary vector.  
 Warnings :  
 In this package the entities are not shared. The OffsetCurve is  
 built with a copy of the curve C. So when C is modified the  
 OffsetCurve is not modified  
 Raised if the basis curve C is not at least C1.  
 Warnings :  
 No check is done to know if ||V^T|| != 0.0 at any point.") Geom_OffsetCurve;
		 Geom_OffsetCurve (const Handle_Geom_Curve & C,const Standard_Real Offset,const gp_Dir & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

Changes the orientation of this offset curve.  
As a result:  
- the basis curve is reversed,  
- the start point of the initial curve becomes the  
  end point of the reversed curve,  
- the end point of the initial curve becomes the  
  start point of the reversed curve, and  
- the first and last parameters are recomputed.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Standard_Real

Computes the parameter on the reversed curve for  
the point of parameter U on this offset curve.") ReversedParameter;
		Standard_Real ReversedParameter (const Standard_Real U);
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)

Returns:
	None

Changes this offset curve by assigning C as the basis curve from which it is built.  
Exceptions  
Standard_ConstructionError if the curve C is not at least 'C1' continuous.") SetBasisCurve;
		void SetBasisCurve (const Handle_Geom_Curve & C);
		%feature("autodoc", "Args:
	V(gp_Dir)

Returns:
	None

Changes this offset curve by assigning V as the  
reference vector used to compute the offset direction.") SetDirection;
		void SetDirection (const gp_Dir & V);
		%feature("autodoc", "Args:
	D(Standard_Real)

Returns:
	None

Changes this offset curve by assigning D as the offset value.") SetOffsetValue;
		void SetOffsetValue (const Standard_Real D);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Curve

Returns the basis curve of this offset curve.  
Note: The basis curve can be an offset curve.") BasisCurve;
		Handle_Geom_Curve BasisCurve ();
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_Shape

Returns the global continuity of this offset curve as a  
value of the GeomAbs_Shape enumeration.  
The degree of continuity of this offset curve is equal  
to the degree of continuity of the basis curve minus 1.  
 Continuity of the Offset curve :  
 C0 : only geometric continuity,  
 C1 : continuity of the first derivative all along the Curve,  
 C2 : continuity of the second derivative all along the Curve,  
 C3 : continuity of the third derivative all along the Curve,  
 G1 : tangency continuity all along the Curve,  
 G2 : curvature continuity all along the Curve,  
 CN : the order of continuity is infinite.  
 Warnings :  
 Returns the continuity of the basis curve - 1.  
 The offset curve must have a unique offset direction defined  
 at any point.") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir

Returns the reference vector of this offset curve.  Value and derivatives  
 Warnings :  
 The exception UndefinedValue or UndefinedDerivative is  
 raised if it is not possible to compute a unique offset  
 direction.  
 If T is the first derivative with not null length and  
 V the offset direction the relation ||T(U) ^ V|| != 0  
 must be satisfied to evaluate the offset curve.  
 No check is done at the creation time and we suppose  
 in this package that the offset curve is well defined.") Direction;
		const gp_Dir & Direction ();
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)

Returns:
	None

Warning! this should not be called  
         if the basis curve is not at least C1. Nevertheless  
         if used on portion where the curve is C1, it is OK") D0;
		void D0 (const Standard_Real U,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)

Returns:
	None

Warning! this should not be called  
          if the continuity of the basis curve is not C2.  
          Nevertheless, it's OK to use it  on portion  
          where the curve is C2") D1;
		void D1 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)

Returns:
	None

Warning! this should not be called  
          if the continuity of the basis curve is not C3.  
          Nevertheless, it's OK to use it  on portion  
          where the curve is C3") D2;
		void D2 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)
	V3(gp_Vec)

Returns:
	None

No detailed docstring for this function.") D3;
		void D3 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("autodoc", "Args:
	U(Standard_Real)
	N(Standard_Integer)

Returns:
	gp_Vec

The returned vector gives the value of the derivative  
 for the order of derivation N.  
 The following functions compute the value and derivatives  
 on the offset curve and returns the derivatives on the  
 basis curve too.  
 The computation of the value and derivatives on the basis  
 curve are used to evaluate the offset curve  
 
 Warning:  
 The exception UndefinedValue or UndefinedDerivative is  
 raised if it is not possible to compute a unique offset  
 direction.  Raised if N < 1.") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Integer N);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	Pbasis(gp_Pnt)
	V1basis(gp_Vec)

Returns:
	None

Warning! this should not be called  
         if the basis curve is not at least C1. Nevertheless  
         if used on portion where the curve is C1, it is OK") Value;
		void Value (const Standard_Real U,gp_Pnt & P,gp_Pnt & Pbasis,gp_Vec & V1basis);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	Pbasis(gp_Pnt)
	V1basis(gp_Vec)

Returns:
	None

Warning! this should not be called  
          if the continuity of the basis curve is not C1.  
          Nevertheless, it's OK to use it  on portion  
          where the curve is C1") D0;
		void D0 (const Standard_Real U,gp_Pnt & P,gp_Pnt & Pbasis,gp_Vec & V1basis);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	Pbasis(gp_Pnt)
	V1(gp_Vec)
	V1basis(gp_Vec)
	V2basis(gp_Vec)

Returns:
	None

Warning! this should not be called  
          if the continuity of the basis curve is not C1.  
          Nevertheless, it's OK to use it  on portion  
          where the curve is C1") D1;
		void D1 (const Standard_Real U,gp_Pnt & P,gp_Pnt & Pbasis,gp_Vec & V1,gp_Vec & V1basis,gp_Vec & V2basis);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	Pbasis(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)
	V1basis(gp_Vec)
	V2basis(gp_Vec)
	V3basis(gp_Vec)

Returns:
	None

Warning!  this should not be called  
          if the continuity of the basis curve is not C3.  
          Nevertheless, it's OK to use it  on portion  
          where the curve is C3") D2;
		void D2 (const Standard_Real U,gp_Pnt & P,gp_Pnt & Pbasis,gp_Vec & V1,gp_Vec & V2,gp_Vec & V1basis,gp_Vec & V2basis,gp_Vec & V3basis);
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

Returns the value of the first or last parameter of this  
offset curve. The first parameter corresponds to the  
start point of the curve. The last parameter  
corresponds to the end point.  
Note: the first and last parameters of this offset curve  
are also the ones of its basis curve.") LastParameter;
		Standard_Real LastParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the offset value of this offset curve.") Offset;
		Standard_Real Offset ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the distance between the start point  
 and the end point of the curve is lower or equal to  
 Resolution from package gp.") IsClosed;
		Standard_Boolean IsClosed ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Boolean

Returns true if the degree of continuity of the basis  
curve of this offset curve is at least N + 1.  
 This method answer True if the continuity of the basis curve  
 is N + 1.  We suppose in this class that a normal direction  
 to the basis curve (used to compute the offset curve) is  
 defined at any point on the basis curve.  Raised if N < 0.") IsCN;
		Standard_Boolean IsCN (const Standard_Integer N);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if this offset curve is periodic, i.e. if the  
basis curve of this offset curve is periodic.") IsPeriodic;
		Standard_Boolean IsPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

Returns the period of this offset curve, i.e. the period  
of the basis curve of this offset curve.  
Exceptions  
Standard_NoSuchObject if the basis curve is not periodic.") Period;
		virtual Standard_Real Period ();
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

Applies the transformation T to this offset curve.  
Note: the basis curve is also modified.") Transform;
		void Transform (const gp_Trsf & T);
		%feature("autodoc", "Args:
	U(Standard_Real)
	T(gp_Trsf)

Returns:
	virtual Standard_Real

Returns the  parameter on the  transformed  curve for  
      the transform of the point of parameter U on <self>.  
     me->Transformed(T)->Value(me->TransformedParameter(U,T))  
         is the same point as  
         me->Value(U).Transformed(T)  
         This methods calls the basis curve method.") TransformedParameter;
		virtual Standard_Real TransformedParameter (const Standard_Real U,const gp_Trsf & T);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	virtual Standard_Real

Returns a  coefficient to compute the parameter on  
         the transformed  curve  for  the transform  of the  
         point on <self>.  
 
         Transformed(T)->Value(U * ParametricTransformation(T))  
         is the same point as  
         Value(U).Transformed(T)  
         This methods calls the basis curve method.") ParametricTransformation;
		virtual Standard_Real ParametricTransformation (const gp_Trsf & T);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Geometry

Creates a new object which is a copy of this offset curve.") Copy;
		Handle_Geom_Geometry Copy ();
};


%feature("shadow") Geom_OffsetCurve::~Geom_OffsetCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom_OffsetCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Geom_OffsetCurve {
	Handle_Geom_OffsetCurve GetHandle() {
	return *(Handle_Geom_OffsetCurve*) &$self;
	}
};

%nodefaultctor Handle_Geom_OffsetCurve;
class Handle_Geom_OffsetCurve : public Handle_Geom_Curve {

    public:
        // constructors
        Handle_Geom_OffsetCurve();
        Handle_Geom_OffsetCurve(const Handle_Geom_OffsetCurve &aHandle);
        Handle_Geom_OffsetCurve(const Geom_OffsetCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Geom_OffsetCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Geom_OffsetCurve {
    Geom_OffsetCurve* GetObject() {
    return (Geom_OffsetCurve*)$self->Access();
    }
};
%feature("shadow") Handle_Geom_OffsetCurve::~Handle_Geom_OffsetCurve %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Geom_OffsetCurve {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Geom_OffsetSurface;
class Geom_OffsetSurface : public Geom_Surface {
	public:
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)
	Offset(Standard_Real)

Returns:
	None

Constructs a surface offset from the basis surface  
S, where Offset is the distance between the offset  
surface and the basis surface at any point.  
A point on the offset surface is built by measuring  
the offset value along a normal vector at a point on  
S. This normal vector is given by the cross product  
D1u^D1v, where D1u and D1v are the vectors  
tangential to the basis surface in the u and v  
parametric directions at this point. The side of S on  
which the offset value is measured is indicated by  
this normal vector if Offset is positive, or is the  
inverse sense if Offset is negative.  
 Warnings :  
- The offset surface is built with a copy of the  
  surface S. Therefore, when S is modified the  
  offset surface is not modified.  
- No check is made at the time of construction to  
  detect points on S with multiple possible normal directions.  Raised if S is not at least C1.  
 Warnings :  
 No check is done to verify that a unique normal direction is  
 defined at any point of the basis surface S.") Geom_OffsetSurface;
		 Geom_OffsetSurface (const Handle_Geom_Surface & S,const Standard_Real Offset);
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)

Returns:
	None

Raised if S is not at least C1.  
 Warnings :  
 No check is done to verify that a unique normal direction is  
 defined at any point of the basis surface S.  
Exceptions  
Standard_ConstructionError if the surface S is not  
at least 'C1' continuous.") SetBasisSurface;
		void SetBasisSurface (const Handle_Geom_Surface & S);
		%feature("autodoc", "Args:
	D(Standard_Real)

Returns:
	None

Changes this offset surface by assigning D as the offset value.") SetOffsetValue;
		void SetOffsetValue (const Standard_Real D);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the offset value of this offset surface.") Offset;
		Standard_Real Offset ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Surface

Returns the basis surface of this offset surface.  
 Note: The basis surface can be an offset surface.") BasisSurface;
		Handle_Geom_Surface BasisSurface ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Changes the orientation of this offset surface in the u  
parametric direction. The bounds of the surface  
are not changed but the given parametric direction is reversed.") UReverse;
		void UReverse ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Standard_Real

Computes the u  parameter on the modified  
surface, produced by reversing the u  
parametric direction of this offset surface, for any  
point of u parameter U  on this offset surface.") UReversedParameter;
		Standard_Real UReversedParameter (const Standard_Real U);
		%feature("autodoc", "Args:
	None
Returns:
	None

Changes the orientation of this offset surface in the v parametric direction. The bounds of the surface  
are not changed but the given parametric direction is reversed.") VReverse;
		void VReverse ();
		%feature("autodoc", "Args:
	V(Standard_Real)

Returns:
	Standard_Real

Computes the  v parameter on the modified  
surface, produced by reversing the or v  
parametric direction of this offset surface, for any  
point of  v parameter V on this offset surface.") VReversedParameter;
		Standard_Real VReversedParameter (const Standard_Real V);
		%feature("autodoc", "Args:
	U1(Standard_Real)
	U2(Standard_Real)
	V1(Standard_Real)
	V2(Standard_Real)

Returns:
	None

Returns the parametric bounds U1, U2, V1 and V2 of  
this offset surface.  
If the surface is infinite, this function can return:  
- Standard_Real::RealFirst(), or  
- Standard_Real::RealLast().") Bounds;
		void Bounds (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_Shape

This method returns the continuity of the basis surface - 1.  
 Continuity of the Offset surface :  
 C0 : only geometric continuity,  
 C1 : continuity of the first derivative all along the Surface,  
 C2 : continuity of the second derivative all along the Surface,  
 C3 : continuity of the third derivative all along the Surface,  
 CN : the order of continuity is infinite.  
Example :  
 If the basis surface is C2 in the V direction and C3 in the U  
 direction Shape = C1.  
Warnings :  
 If the basis surface has a unique normal direction defined at  
 any point this method gives the continuity of the offset  
 surface otherwise the effective continuity can be lower than  
 the continuity of the basis surface - 1.") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Boolean

This method answer True if the continuity of the basis surface  
 is N + 1 in the U parametric direction. We suppose in this  
 class that a unique normal is defined at any point on the basis  
 surface.  Raised if N <0.") IsCNu;
		Standard_Boolean IsCNu (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Boolean

This method answer True if the continuity of the basis surface  
 is N + 1 in the V parametric direction. We suppose in this  
 class that a unique normal is defined at any point on the basis  
 surface.  Raised if N <0.") IsCNv;
		Standard_Boolean IsCNv (const Standard_Integer N);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Checks whether this offset surface is closed in the u  
 parametric direction.  
Returns true if, taking uFirst and uLast as  
  the parametric bounds in the u parametric direction,  
  the distance between the points P(uFirst,v)  
  and P(uLast,v) is less than or equal to  
  gp::Resolution() for each value of the   parameter v.") IsUClosed;
		Standard_Boolean IsUClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Checks whether this offset surface is closed in the u  
or v parametric direction. Returns true if taking vFirst and vLast as the  
  parametric bounds in the v parametric direction, the  
  distance between the points P(u,vFirst) and  
  P(u,vLast) is less than or equal to  
  gp::Resolution() for each value of the parameter u.") IsVClosed;
		Standard_Boolean IsVClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if this offset surface is periodic in the u  
parametric direction, i.e. if the basis  
surface of this offset surface is periodic in this direction.") IsUPeriodic;
		Standard_Boolean IsUPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

Returns the period of this offset surface in the u  
parametric direction respectively, i.e. the period of the  
basis surface of this offset surface in this parametric direction.  raises if the surface is not uperiodic.") UPeriod;
		virtual Standard_Real UPeriod ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if this offset surface is periodic in the v  
parametric direction, i.e. if the basis  
surface of this offset surface is periodic in this direction.") IsVPeriodic;
		Standard_Boolean IsVPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

Returns the period of this offset surface in the v  
parametric direction respectively, i.e. the period of the  
basis surface of this offset surface in this parametric direction.  raises if the surface is not vperiodic.") VPeriod;
		virtual Standard_Real VPeriod ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Handle_Geom_Curve

Computes the U isoparametric curve.") UIso;
		Handle_Geom_Curve UIso (const Standard_Real U);
		%feature("autodoc", "Args:
	V(Standard_Real)

Returns:
	Handle_Geom_Curve

Computes the V isoparametric curve.  
 Te followings methods compute value and derivatives.  
 
Warnings  
 An exception is raised if a unique normal vector is  
 not defined on the basis surface for the parametric  
 value (U,V).  
 No check is done at the creation time and we suppose  
 in this package that the offset surface can be defined  
 at any point.") VIso;
		Handle_Geom_Curve VIso (const Standard_Real V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)

Returns:
	None

P (U, V) = Pbasis + Offset * Ndir   where  
 Ndir = D1Ubasis ^ D1Vbasis / ||D1Ubasis ^ D1Vbasis|| is the  
 normal direction of the basis surface. Pbasis, D1Ubasis,  
 D1Vbasis are the point and the first derivatives on the basis  
 surface.  
 If Ndir is undefined this method computes an approched normal  
 direction using the following limited development :  
 Ndir = N0 + DNdir/DU + DNdir/DV + Eps with Eps->0 which  
 requires to compute the second derivatives on the basis surface.  
 If the normal direction cannot be approximate for this order  
 of derivation the exception UndefinedValue is raised.  
 Raised if the continuity of the basis surface is not C1.  
 Raised if the order of derivation required to compute the  
 normal direction is greater than the second order.") D0;
		void D0 (const Standard_Real U,const Standard_Real V,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)

Returns:
	None

Raised if the continuity of the basis surface is not C2.") D1;
		void D1 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	D2UV(gp_Vec)

Returns:
	None

//!---Purpose ;  
 Raised if the continuity of the basis surface is not C3.") D2;
		void D2 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	D2UV(gp_Vec)
	D3U(gp_Vec)
	D3V(gp_Vec)
	D3UUV(gp_Vec)
	D3UVV(gp_Vec)

Returns:
	None

Raised if the continuity of the basis surface is not C4.") D3;
		void D3 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV,gp_Vec & D3U,gp_Vec & D3V,gp_Vec & D3UUV,gp_Vec & D3UVV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Nu(Standard_Integer)
	Nv(Standard_Integer)

Returns:
	gp_Vec

Computes the derivative of order Nu in the direction u and Nv  
 in the direction v.  //!---Purpose ;  
 Raised if the continuity of the basis surface is not CNu + 1  
 in the U direction and CNv + 1 in the V direction.  Raised if Nu + Nv < 1 or Nu < 0 or Nv < 0.  
 The following methods compute the value and derivatives  
 on the offset surface and returns the derivatives on the  
 basis surface too.  
 The computation of the value and derivatives on the basis  
 surface are used to evaluate the offset surface.  
 
 Warnings :  
 The exception UndefinedValue or UndefinedDerivative is  
 raised if it is not possible to compute a unique offset  
 direction.") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Real V,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	Pbasis(gp_Pnt)
	D1Ubasis(gp_Vec)
	D1Vbasis(gp_Vec)

Returns:
	None

P (U, V) = Pbasis + Offset * Ndir   where  
 Ndir = D1Ubasis ^ D1Vbasis / ||D1Ubasis ^ D1Vbasis|| is  
 the normal direction of the surface.  
 If Ndir is undefined this method computes an approched normal  
 direction using the following limited development :  
 Ndir = N0 + DNdir/DU + DNdir/DV + Eps with Eps->0 which  
 requires to compute the second derivatives on the basis surface.  
 If the normal direction cannot be approximate for this order  
 of derivation the exception UndefinedValue is raised.  
 Raised if the continuity of the basis surface is not C1.  
 Raised if the order of derivation required to compute the normal  
 direction is greater than the second order.") Value;
		void Value (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Pnt & Pbasis,gp_Vec & D1Ubasis,gp_Vec & D1Vbasis);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	Pbasis(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D1Ubasis(gp_Vec)
	D1Vbasis(gp_Vec)
	D2Ubasis(gp_Vec)
	D2Vbasis(gp_Vec)
	D2UVbasis(gp_Vec)

Returns:
	None

Raised if the continuity of the basis surface is not C2.") D1;
		void D1 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Pnt & Pbasis,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D1Ubasis,gp_Vec & D1Vbasis,gp_Vec & D2Ubasis,gp_Vec & D2Vbasis,gp_Vec & D2UVbasis);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	Pbasis(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	D2UV(gp_Vec)
	D1Ubasis(gp_Vec)
	D1Vbasis(gp_Vec)
	D2Ubasis(gp_Vec)
	D2Vbasis(gp_Vec)
	D2UVbasis(gp_Vec)
	D3Ubasis(gp_Vec)
	D3Vbasis(gp_Vec)
	D3UUVbasis(gp_Vec)
	D3UVVbasis(gp_Vec)

Returns:
	None

Raised if the continuity of the basis surface is not C3.   The  following  private  methods  
 includes common part of local  and  global methods  
 of  derivative  evaluations.") D2;
		void D2 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Pnt & Pbasis,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV,gp_Vec & D1Ubasis,gp_Vec & D1Vbasis,gp_Vec & D2Ubasis,gp_Vec & D2Vbasis,gp_Vec & D2UVbasis,gp_Vec & D3Ubasis,gp_Vec & D3Vbasis,gp_Vec & D3UUVbasis,gp_Vec & D3UVVbasis);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	USide(Standard_Integer)
	VSide(Standard_Integer)
	P(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") LocalD0;
		void LocalD0 (const Standard_Real U,const Standard_Real V,const Standard_Integer USide,const Standard_Integer VSide,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	USide(Standard_Integer)
	VSide(Standard_Integer)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)

Returns:
	None

No detailed docstring for this function.") LocalD1;
		void LocalD1 (const Standard_Real U,const Standard_Real V,const Standard_Integer USide,const Standard_Integer VSide,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	USide(Standard_Integer)
	VSide(Standard_Integer)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	D2UV(gp_Vec)

Returns:
	None

No detailed docstring for this function.") LocalD2;
		void LocalD2 (const Standard_Real U,const Standard_Real V,const Standard_Integer USide,const Standard_Integer VSide,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	USide(Standard_Integer)
	VSide(Standard_Integer)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	D2UV(gp_Vec)
	D3U(gp_Vec)
	D3V(gp_Vec)
	D3UUV(gp_Vec)
	D3UVV(gp_Vec)

Returns:
	None

No detailed docstring for this function.") LocalD3;
		void LocalD3 (const Standard_Real U,const Standard_Real V,const Standard_Integer USide,const Standard_Integer VSide,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV,gp_Vec & D3U,gp_Vec & D3V,gp_Vec & D3UUV,gp_Vec & D3UVV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	USide(Standard_Integer)
	VSide(Standard_Integer)
	Nu(Standard_Integer)
	Nv(Standard_Integer)

Returns:
	gp_Vec

No detailed docstring for this function.") LocalDN;
		gp_Vec LocalDN (const Standard_Real U,const Standard_Real V,const Standard_Integer USide,const Standard_Integer VSide,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

Applies the transformation T to this offset surface.  
Note: the basis surface is also modified.") Transform;
		void Transform (const gp_Trsf & T);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	T(gp_Trsf)

Returns:
	virtual void

Computes the  parameters on the  transformed  surface for  
         the transform of the point of parameters U,V on <self>.  
 
         me->Transformed(T)->Value(U',V')  
 
         is the same point as  
 
         me->Value(U,V).Transformed(T)  
 
         Where U',V' are the new values of U,V after calling  
 
         me->TranformParameters(U,V,T)  
         This methods calls the basis surface method.") TransformParameters;
		virtual void TransformParameters (Standard_Real &OutValue,Standard_Real &OutValue,const gp_Trsf & T);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	virtual gp_GTrsf2d

Returns a 2d transformation  used to find the  new  
         parameters of a point on the transformed surface.  
 
         me->Transformed(T)->Value(U',V')  
 
         is the same point as  
 
         me->Value(U,V).Transformed(T)  
 
         Where U',V' are  obtained by transforming U,V with  
         th 2d transformation returned by  
 
         me->ParametricTransformation(T)  
 
         This methods calls the basis surface method.") ParametricTransformation;
		virtual gp_GTrsf2d ParametricTransformation (const gp_Trsf & T);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Geometry

Creates a new object which is a copy of this offset surface.") Copy;
		Handle_Geom_Geometry Copy ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Surface

returns an  equivalent surface of the offset surface  
         when  the basis surface   is a canonic  surface or a  
         rectangular  limited surface on canonic surface or if  
         the offset is null.") Surface;
		Handle_Geom_Surface Surface ();
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	IsOpposite(Standard_Boolean)
	UOsculSurf(Handle_Geom_BSplineSurface)

Returns:
	Standard_Boolean

if Standard_True, L is  the local osculating surface  
         along U at  the point U,V.   It means that  DL/DU is  
         collinear to DS/DU .  If IsOpposite == Standard_True  
         these vectors have opposite direction.") UOsculatingSurface;
		Standard_Boolean UOsculatingSurface (const Standard_Real U,const Standard_Real V,Standard_Boolean & IsOpposite,Handle_Geom_BSplineSurface & UOsculSurf);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	IsOpposite(Standard_Boolean)
	VOsculSurf(Handle_Geom_BSplineSurface)

Returns:
	Standard_Boolean

if Standard_True, L is the local osculating surface  
         along V at the point U,V.  
         It means that  DL/DV is  
         collinear to DS/DV .  If IsOpposite == Standard_True  
         these vectors have opposite direction.") VOsculatingSurface;
		Standard_Boolean VOsculatingSurface (const Standard_Real U,const Standard_Real V,Standard_Boolean & IsOpposite,Handle_Geom_BSplineSurface & VOsculSurf);
};


%feature("shadow") Geom_OffsetSurface::~Geom_OffsetSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom_OffsetSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Geom_OffsetSurface {
	Handle_Geom_OffsetSurface GetHandle() {
	return *(Handle_Geom_OffsetSurface*) &$self;
	}
};

%nodefaultctor Handle_Geom_OffsetSurface;
class Handle_Geom_OffsetSurface : public Handle_Geom_Surface {

    public:
        // constructors
        Handle_Geom_OffsetSurface();
        Handle_Geom_OffsetSurface(const Handle_Geom_OffsetSurface &aHandle);
        Handle_Geom_OffsetSurface(const Geom_OffsetSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Geom_OffsetSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Geom_OffsetSurface {
    Geom_OffsetSurface* GetObject() {
    return (Geom_OffsetSurface*)$self->Access();
    }
};
%feature("shadow") Handle_Geom_OffsetSurface::~Handle_Geom_OffsetSurface %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Geom_OffsetSurface {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Geom_SweptSurface;
class Geom_SweptSurface : public Geom_Surface {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_Shape

returns the continuity of the surface :  
 C0 : only geometric continuity,  
 C1 : continuity of the first derivative all along the surface,  
 C2 : continuity of the second derivative all along the surface,  
 C3 : continuity of the third derivative all along the surface,  
 G1 : tangency continuity all along the surface,  
 G2 : curvature continuity all along the surface,  
 CN : the order of continuity is infinite.") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir

Returns the reference direction of the swept surface.  
 For a surface of revolution it is the direction of the  
 revolution axis, for a surface of linear extrusion it is  
 the direction of extrusion.") Direction;
		const gp_Dir & Direction ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Curve

Returns the referenced curve of the surface.  
 For a surface of revolution it is the revolution curve,  
 for a surface of linear extrusion it is the extruded curve.") BasisCurve;
		Handle_Geom_Curve BasisCurve ();
};


%feature("shadow") Geom_SweptSurface::~Geom_SweptSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom_SweptSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Geom_SweptSurface {
	Handle_Geom_SweptSurface GetHandle() {
	return *(Handle_Geom_SweptSurface*) &$self;
	}
};

%nodefaultctor Handle_Geom_SweptSurface;
class Handle_Geom_SweptSurface : public Handle_Geom_Surface {

    public:
        // constructors
        Handle_Geom_SweptSurface();
        Handle_Geom_SweptSurface(const Handle_Geom_SweptSurface &aHandle);
        Handle_Geom_SweptSurface(const Geom_SweptSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Geom_SweptSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Geom_SweptSurface {
    Geom_SweptSurface* GetObject() {
    return (Geom_SweptSurface*)$self->Access();
    }
};
%feature("shadow") Handle_Geom_SweptSurface::~Handle_Geom_SweptSurface %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Geom_SweptSurface {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Geom_VectorWithMagnitude;
class Geom_VectorWithMagnitude : public Geom_Vector {
	public:
		%feature("autodoc", "Args:
	V(gp_Vec)

Returns:
	None

Creates a transient copy of V.") Geom_VectorWithMagnitude;
		 Geom_VectorWithMagnitude (const gp_Vec & V);
		%feature("autodoc", "Args:
	X(Standard_Real)
	Y(Standard_Real)
	Z(Standard_Real)

Returns:
	None

Creates a vector with three cartesian coordinates.") Geom_VectorWithMagnitude;
		 Geom_VectorWithMagnitude (const Standard_Real X,const Standard_Real Y,const Standard_Real Z);
		%feature("autodoc", "Args:
	P1(gp_Pnt)
	P2(gp_Pnt)

Returns:
	None

Creates a vector from the point P1 to the point P2.  
 The magnitude of the vector is the distance between P1 and P2") Geom_VectorWithMagnitude;
		 Geom_VectorWithMagnitude (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("autodoc", "Args:
	X(Standard_Real)
	Y(Standard_Real)
	Z(Standard_Real)

Returns:
	None

Assigns the values X, Y and Z to the coordinates of this vector.") SetCoord;
		void SetCoord (const Standard_Real X,const Standard_Real Y,const Standard_Real Z);
		%feature("autodoc", "Args:
	V(gp_Vec)

Returns:
	None

Converts the gp_Vec vector V into this vector.") SetVec;
		void SetVec (const gp_Vec & V);
		%feature("autodoc", "Args:
	X(Standard_Real)

Returns:
	None

Changes the X coordinate of <self>.") SetX;
		void SetX (const Standard_Real X);
		%feature("autodoc", "Args:
	Y(Standard_Real)

Returns:
	None

Changes the Y coordinate of <self>") SetY;
		void SetY (const Standard_Real Y);
		%feature("autodoc", "Args:
	Z(Standard_Real)

Returns:
	None

Changes the Z coordinate of <self>.") SetZ;
		void SetZ (const Standard_Real Z);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the magnitude of <self>.") Magnitude;
		Standard_Real Magnitude ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the square magnitude of <self>.") SquareMagnitude;
		Standard_Real SquareMagnitude ();
		%feature("autodoc", "Args:
	Other(Handle_Geom_Vector)

Returns:
	None

Adds the Vector Other to <self>.") Add;
		void Add (const Handle_Geom_Vector & Other);
		%feature("autodoc", "Args:
	Other(Handle_Geom_Vector)

Returns:
	Handle_Geom_VectorWithMagnitude

Adds the vector Other to <self>.") Added;
		Handle_Geom_VectorWithMagnitude Added (const Handle_Geom_Vector & Other);
		%feature("autodoc", "Args:
	Other(Handle_Geom_Vector)

Returns:
	None

Computes the cross product  between <self> and Other  
 <self> ^ Other.") Cross;
		void Cross (const Handle_Geom_Vector & Other);
		%feature("autodoc", "Args:
	Other(Handle_Geom_Vector)

Returns:
	Handle_Geom_Vector

Computes the cross product  between <self> and Other  
 <self> ^ Other. A new vector is returned.") Crossed;
		Handle_Geom_Vector Crossed (const Handle_Geom_Vector & Other);
		%feature("autodoc", "Args:
	V1(Handle_Geom_Vector)
	V2(Handle_Geom_Vector)

Returns:
	None

Computes the triple vector product  <self> ^ (V1 ^ V2).") CrossCross;
		void CrossCross (const Handle_Geom_Vector & V1,const Handle_Geom_Vector & V2);
		%feature("autodoc", "Args:
	V1(Handle_Geom_Vector)
	V2(Handle_Geom_Vector)

Returns:
	Handle_Geom_Vector

Computes the triple vector product  <self> ^ (V1 ^ V2).  
 A new vector is returned.") CrossCrossed;
		Handle_Geom_Vector CrossCrossed (const Handle_Geom_Vector & V1,const Handle_Geom_Vector & V2);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	None

Divides <self> by a scalar.") Divide;
		void Divide (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	Handle_Geom_VectorWithMagnitude

Divides <self> by a scalar. A new vector is returned.") Divided;
		Handle_Geom_VectorWithMagnitude Divided (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	Handle_Geom_VectorWithMagnitude

Computes the product of the vector <self> by a scalar.  
 A new vector is returned.") Multiplied;
		Handle_Geom_VectorWithMagnitude Multiplied (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	Scalar(Standard_Real)

Returns:
	None

Computes the product of the vector <self> by a scalar.") Multiply;
		void Multiply (const Standard_Real Scalar);
		%feature("autodoc", "Args:
	None
Returns:
	None

Normalizes <self>.  
 Raised if the magnitude of the vector is lower or equal to  
 Resolution from package gp.") Normalize;
		void Normalize ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_VectorWithMagnitude

Returns a copy of <self> Normalized.  
 Raised if the magnitude of the vector is lower or equal to  
 Resolution from package gp.") Normalized;
		Handle_Geom_VectorWithMagnitude Normalized ();
		%feature("autodoc", "Args:
	Other(Handle_Geom_Vector)

Returns:
	None

Subtracts the Vector Other to <self>.") Subtract;
		void Subtract (const Handle_Geom_Vector & Other);
		%feature("autodoc", "Args:
	Other(Handle_Geom_Vector)

Returns:
	Handle_Geom_VectorWithMagnitude

Subtracts the vector Other to <self>. A new vector is returned.") Subtracted;
		Handle_Geom_VectorWithMagnitude Subtracted (const Handle_Geom_Vector & Other);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

Applies the transformation T to this vector.") Transform;
		void Transform (const gp_Trsf & T);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Geometry

Creates a new object which is a copy of this vector.") Copy;
		Handle_Geom_Geometry Copy ();
};


%feature("shadow") Geom_VectorWithMagnitude::~Geom_VectorWithMagnitude %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom_VectorWithMagnitude {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Geom_VectorWithMagnitude {
	Handle_Geom_VectorWithMagnitude GetHandle() {
	return *(Handle_Geom_VectorWithMagnitude*) &$self;
	}
};

%nodefaultctor Handle_Geom_VectorWithMagnitude;
class Handle_Geom_VectorWithMagnitude : public Handle_Geom_Vector {

    public:
        // constructors
        Handle_Geom_VectorWithMagnitude();
        Handle_Geom_VectorWithMagnitude(const Handle_Geom_VectorWithMagnitude &aHandle);
        Handle_Geom_VectorWithMagnitude(const Geom_VectorWithMagnitude *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Geom_VectorWithMagnitude DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Geom_VectorWithMagnitude {
    Geom_VectorWithMagnitude* GetObject() {
    return (Geom_VectorWithMagnitude*)$self->Access();
    }
};
%feature("shadow") Handle_Geom_VectorWithMagnitude::~Handle_Geom_VectorWithMagnitude %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Geom_VectorWithMagnitude {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Geom_BSplineCurve;
class Geom_BSplineCurve : public Geom_BoundedCurve {
	public:
		%feature("autodoc", "Args:
	Poles(TColgp_Array1OfPnt)
	Knots(TColStd_Array1OfReal)
	Multiplicities(TColStd_Array1OfInteger)
	Degree(Standard_Integer)
	Periodic(Standard_Boolean)=Standard_False

Returns:
	None

Creates a  non-rational B_spline curve   on  the  
        basis <Knots, Multiplicities> of degree <Degree>.") Geom_BSplineCurve;
		 Geom_BSplineCurve (const TColgp_Array1OfPnt & Poles,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Multiplicities,const Standard_Integer Degree,const Standard_Boolean Periodic = Standard_False);
		%feature("autodoc", "Args:
	Poles(TColgp_Array1OfPnt)
	Weights(TColStd_Array1OfReal)
	Knots(TColStd_Array1OfReal)
	Multiplicities(TColStd_Array1OfInteger)
	Degree(Standard_Integer)
	Periodic(Standard_Boolean)=Standard_False
	CheckRational(Standard_Boolean)=Standard_True

Returns:
	None

Creates  a rational B_spline  curve  on the basis  
        <Knots, Multiplicities> of degree <Degree>.  
 Raises ConstructionError subject to the following conditions  
 0 < Degree <= MaxDegree.  
 
 Weights.Length() == Poles.Length()  
 
 Knots.Length() == Mults.Length() >= 2  
 
 Knots(i) < Knots(i+1) (Knots are increasing)  
 
 1 <= Mults(i) <= Degree  
 
  On a non periodic curve the first and last multiplicities  
  may be Degree+1 (this is even recommanded if you want the  
  curve to start and finish on the first and last pole).  
 
  On a periodic  curve the first  and  the last multicities  
  must be the same.  
 
  on non-periodic curves  
 
    Poles.Length() == Sum(Mults(i)) - Degree - 1 >= 2  
 
  on periodic curves  
 
    Poles.Length() == Sum(Mults(i)) except the first or last") Geom_BSplineCurve;
		 Geom_BSplineCurve (const TColgp_Array1OfPnt & Poles,const TColStd_Array1OfReal & Weights,const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Multiplicities,const Standard_Integer Degree,const Standard_Boolean Periodic = Standard_False,const Standard_Boolean CheckRational = Standard_True);
		%feature("autodoc", "Args:
	Degree(Standard_Integer)

Returns:
	None

Increases the degree of this BSpline curve to  
Degree. As a result, the poles, weights and  
multiplicities tables are modified; the knots table is  
not changed. Nothing is done if Degree is less than  
or equal to the current degree.  
Exceptions  
Standard_ConstructionError if Degree is greater than  
Geom_BSplineCurve::MaxDegree().") IncreaseDegree;
		void IncreaseDegree (const Standard_Integer Degree);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	M(Standard_Integer)

Returns:
	None

//!Increases the multiplicity  of the knot <Index> to  
        <M>.  
 
        If   <M>   is   lower   or  equal   to  the current  
        multiplicity nothing is done. If <M> is higher than  
        the degree the degree is used.  If <Index> is not in [FirstUKnotIndex, LastUKnotIndex]") IncreaseMultiplicity;
		void IncreaseMultiplicity (const Standard_Integer Index,const Standard_Integer M);
		%feature("autodoc", "Args:
	I1(Standard_Integer)
	I2(Standard_Integer)
	M(Standard_Integer)

Returns:
	None

//!Increases  the  multiplicities   of  the knots  in  
        [I1,I2] to <M>.  
 
        For each knot if  <M>  is  lower  or equal  to  the  
        current multiplicity  nothing  is  done. If <M>  is  
        higher than the degree the degree is used.  If <I1,I2> are not in [FirstUKnotIndex, LastUKnotIndex]") IncreaseMultiplicity;
		void IncreaseMultiplicity (const Standard_Integer I1,const Standard_Integer I2,const Standard_Integer M);
		%feature("autodoc", "Args:
	I1(Standard_Integer)
	I2(Standard_Integer)
	M(Standard_Integer)

Returns:
	None

//!Increment  the  multiplicities   of  the knots  in  
        [I1,I2] by <M>.  
 
        If <M> is not positive nithing is done.  
 
        For   each  knot   the resulting   multiplicity  is  
        limited to the Degree.  If <I1,I2> are not in [FirstUKnotIndex, LastUKnotIndex]") IncrementMultiplicity;
		void IncrementMultiplicity (const Standard_Integer I1,const Standard_Integer I2,const Standard_Integer M);
		%feature("autodoc", "Args:
	U(Standard_Real)
	M(Standard_Integer)=1
	ParametricTolerance(Standard_Real)=0.0
	Add(Standard_Boolean)=Standard_True

Returns:
	None

Inserts a knot value in the sequence of knots.  If  
         <U>  is an  existing knot     the multiplicity  is  
         increased by <M>.  
 
         If U  is  not  on the parameter  range  nothing is  
         done.  
 
         If the multiplicity is negative or null nothing is  
         done. The  new   multiplicity  is limited  to  the  
         degree.  
 
         The  tolerance criterion  for  knots  equality  is  
         the max of Epsilon(U) and ParametricTolerance.") InsertKnot;
		void InsertKnot (const Standard_Real U,const Standard_Integer M = 1,const Standard_Real ParametricTolerance = 0.0,const Standard_Boolean Add = Standard_True);
		%feature("autodoc", "Args:
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	ParametricTolerance(Standard_Real)=0.0
	Add(Standard_Boolean)=Standard_False

Returns:
	None

Inserts a set of knots  values in  the sequence of  
         knots.  
 
         For each U = Knots(i), M = Mults(i)  
 
         If <U>  is an existing  knot  the  multiplicity is  
         increased by  <M> if  <Add>  is True, increased to  
         <M> if <Add> is False.  
 
         If U  is  not  on the parameter  range  nothing is  
         done.  
 
         If the multiplicity is negative or null nothing is  
         done. The  new   multiplicity  is limited  to  the  
         degree.  
 
         The  tolerance criterion  for  knots  equality  is  
         the max of Epsilon(U) and ParametricTolerance.") InsertKnots;
		void InsertKnots (const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Real ParametricTolerance = 0.0,const Standard_Boolean Add = Standard_False);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	M(Standard_Integer)
	Tolerance(Standard_Real)

Returns:
	Standard_Boolean

Reduces the multiplicity of the knot of index Index  
to M. If M is equal to 0, the knot is removed.  
With a modification of this type, the array of poles is also modified.  
Two different algorithms are systematically used to  
compute the new poles of the curve. If, for each  
pole, the distance between the pole calculated  
using the first algorithm and the same pole  
calculated using the second algorithm, is less than  
Tolerance, this ensures that the curve is not  
modified by more than Tolerance. Under these  
conditions, true is returned; otherwise, false is returned.  
A low tolerance is used to prevent modification of  
the curve. A high tolerance is used to 'smooth' the curve.  
Exceptions  
Standard_OutOfRange if Index is outside the  
bounds of the knots table.  pole insertion and pole removing  
 this operation is limited to the Uniform or QuasiUniform  
 BSplineCurve. The knot values are modified . If the BSpline is  
 NonUniform or Piecewise Bezier an exception Construction error  
 is raised.") RemoveKnot;
		Standard_Boolean RemoveKnot (const Standard_Integer Index,const Standard_Integer M,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	None
Returns:
	None

Changes the direction of parametrization of <self>. The Knot  
 sequence is modified, the FirstParameter and the  
 LastParameter are not modified. The StartPoint of the  
 initial curve becomes the EndPoint of the reversed curve  
 and the EndPoint of the initial curve becomes the StartPoint  
 of the reversed curve.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Standard_Real

Returns the  parameter on the  reversed  curve for  
         the point of parameter U on <self>.  
 
         returns UFirst + ULast - U") ReversedParameter;
		Standard_Real ReversedParameter (const Standard_Real U);
		%feature("autodoc", "Args:
	U1(Standard_Real)
	U2(Standard_Real)

Returns:
	None

Modifies this BSpline curve by segmenting it between  
U1 and U2. Either of these values can be outside the  
bounds of the curve, but U2 must be greater than U1.  
All data structure tables of this BSpline curve are  
modified, but the knots located between U1 and U2  
are retained. The degree of the curve is not modified.  
 Warnings :  
 Even if <self> is not closed it can become closed after the  
 segmentation for example if U1 or U2 are out of the bounds  
 of the curve <self> or if the curve makes loop.  
 After the segmentation the length of a curve can be null.  raises if U2 < U1.") Segment;
		void Segment (const Standard_Real U1,const Standard_Real U2);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	K(Standard_Real)

Returns:
	None

Modifies this BSpline curve by assigning the value K  
to the knot of index Index in the knots table. This is a  
relatively local modification because K must be such that:  
Knots(Index - 1) < K < Knots(Index + 1)  
The second syntax allows you also to increase the  
multiplicity of the knot to M (but it is not possible to  
decrease the multiplicity of the knot with this function).  
Standard_ConstructionError if:  
- K is not such that:  
Knots(Index - 1) < K < Knots(Index + 1)  
- M is greater than the degree of this BSpline curve  
  or lower than the previous multiplicity of knot of  
  index Index in the knots table.  
 Standard_OutOfRange if Index is outside the bounds of the knots table.") SetKnot;
		void SetKnot (const Standard_Integer Index,const Standard_Real K);
		%feature("autodoc", "Args:
	K(TColStd_Array1OfReal)

Returns:
	None

Modifies this BSpline curve by assigning the array  
K to its knots table. The multiplicity of the knots is not modified.  
Exceptions  
Standard_ConstructionError if the values in the  
array K are not in ascending order.  
Standard_OutOfRange if the bounds of the array  
K are not respectively 1 and the number of knots of this BSpline curve.") SetKnots;
		void SetKnots (const TColStd_Array1OfReal & K);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	K(Standard_Real)
	M(Standard_Integer)

Returns:
	None

Changes the knot of range Index with its multiplicity.  
 You can increase the multiplicity of a knot but it is  
 not allowed to decrease the multiplicity of an existing knot.  
 Raised if K >= Knots(Index+1) or K <= Knots(Index-1).  
 Raised if M is greater than Degree or lower than the previous  
 multiplicity of knot of range Index.  Raised if Index < 1 || Index > NbKnots") SetKnot;
		void SetKnot (const Standard_Integer Index,const Standard_Real K,const Standard_Integer M);
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	None

returns the parameter normalized within  
        the period if the curve is periodic : otherwise  
        does not do anything") PeriodicNormalization;
		void PeriodicNormalization (Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	None

Changes this BSpline curve into a periodic curve.  
To become periodic, the curve must first be closed.  
Next, the knot sequence must be periodic. For this,  
FirstUKnotIndex and LastUKnotIndex are used  
to compute I1 and I2, the indexes in the knots  
array of the knots corresponding to the first and  
last parameters of this BSpline curve.  
The period is therefore: Knots(I2) - Knots(I1).  
Consequently, the knots and poles tables are modified.  
Exceptions  
Standard_ConstructionError if this BSpline curve is not closed.") SetPeriodic;
		void SetPeriodic ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

Assigns the knot of index Index in the knots table as  
the origin of this periodic BSpline curve. As a  
consequence, the knots and poles tables are modified.  
Exceptions  
Standard_NoSuchObject if this curve is not periodic.  
Standard_DomainError if Index is outside the bounds of the knots table.") SetOrigin;
		void SetOrigin (const Standard_Integer Index);
		%feature("autodoc", "Args:
	U(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

Set the origin of a periodic curve at Knot U. If U  
         is  not a  knot  of  the  BSpline  a  new knot  is  
         inseted. KnotVector and poles are modified.  Raised if the curve is not periodic") SetOrigin;
		void SetOrigin (const Standard_Real U,const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	None

Changes this BSpline curve into a non-periodic  
curve. If this curve is already non-periodic, it is not modified.  
Note: the poles and knots tables are modified.  
Warning  
If this curve is periodic, as the multiplicity of the first  
and last knots is not modified, and is not equal to  
Degree + 1, where Degree is the degree of  
this BSpline curve, the start and end points of the  
curve are not its first and last poles.") SetNotPeriodic;
		void SetNotPeriodic ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	P(gp_Pnt)

Returns:
	None

Modifies this BSpline curve by assigning P to the pole  
of index Index in the poles table.  
Exceptions  
Standard_OutOfRange if Index is outside the  
bounds of the poles table.  
Standard_ConstructionError if Weight is negative or null.") SetPole;
		void SetPole (const Standard_Integer Index,const gp_Pnt & P);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	P(gp_Pnt)
	Weight(Standard_Real)

Returns:
	None

Modifies this BSpline curve by assigning P to the pole  
of index Index in the poles table.  
This syntax also allows you to modify the  
weight of the modified pole, which becomes Weight.  
In this case, if this BSpline curve is non-rational, it  
can become rational and vice versa.  
Exceptions  
Standard_OutOfRange if Index is outside the  
bounds of the poles table.  
Standard_ConstructionError if Weight is negative or null.") SetPole;
		void SetPole (const Standard_Integer Index,const gp_Pnt & P,const Standard_Real Weight);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Weight(Standard_Real)

Returns:
	None

Changes the weight for the pole of range Index.  
 If the curve was non rational it can become rational.  
 If the curve was rational it can become non rational.  
 Raised if Index < 1 || Index > NbPoles  Raised if Weight <= 0.0") SetWeight;
		void SetWeight (const Standard_Integer Index,const Standard_Real Weight);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	Index1(Standard_Integer)
	Index2(Standard_Integer)
	FirstModifiedPole(Standard_Integer)
	LastModifiedPole(Standard_Integer)

Returns:
	None

Moves the point of parameter U of this BSpline curve  
to P. Index1 and Index2 are the indexes in the table  
of poles of this BSpline curve of the first and last  
poles designated to be moved.  
FirstModifiedPole and LastModifiedPole are the  
indexes of the first and last poles which are effectively modified.  
In the event of incompatibility between Index1, Index2 and the value U:  
- no change is made to this BSpline curve, and  
- the FirstModifiedPole and LastModifiedPole are returned null.  
  Exceptions  
Standard_OutOfRange if:  
- Index1 is greater than or equal to Index2, or  
- Index1 or Index2 is less than 1 or greater than the  
  number of poles of this BSpline curve.") MovePoint;
		void MovePoint (const Standard_Real U,const gp_Pnt & P,const Standard_Integer Index1,const Standard_Integer Index2,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	Tangent(gp_Vec)
	Tolerance(Standard_Real)
	StartingCondition(Standard_Integer)
	EndingCondition(Standard_Integer)
	ErrorStatus(Standard_Integer)

Returns:
	None

Move a point with parameter U to P.  
and makes it tangent at U be Tangent.  
StartingCondition = -1 means first can move  
EndingCondition   = -1 means last point can move  
StartingCondition = 0 means the first point cannot move  
EndingCondition   = 0 means the last point cannot move  
StartingCondition = 1 means the first point and tangent cannot move  
EndingCondition   = 1 means the last point and tangent cannot move  
and so forth  
ErrorStatus != 0 means that there are not enought degree of freedom  
with the constrain to deform the curve accordingly") MovePointAndTangent;
		void MovePointAndTangent (const Standard_Real U,const gp_Pnt & P,const gp_Vec & Tangent,const Standard_Real Tolerance,const Standard_Integer StartingCondition,const Standard_Integer EndingCondition,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Boolean

Returns the continuity of the curve, the curve is at least C0.  Raised if N < 0.") IsCN;
		Standard_Boolean IsCN (const Standard_Integer N);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the distance between the first point and the  
 last point of the curve is lower or equal to Resolution  
 from package gp.  
Warnings :  
 The first and the last point can be different from the first  
 pole and the last pole of the curve.") IsClosed;
		Standard_Boolean IsClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the curve is periodic.") IsPeriodic;
		Standard_Boolean IsPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the weights are not identical.  
 The tolerance criterion is Epsilon of the class Real.") IsRational;
		Standard_Boolean IsRational ();
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_Shape

Returns the global continuity of the curve :  
 C0 : only geometric continuity,  
 C1 : continuity of the first derivative all along the Curve,  
 C2 : continuity of the second derivative all along the Curve,  
 C3 : continuity of the third derivative all along the Curve,  
 CN : the order of continuity is infinite.  
 For a B-spline curve of degree d if a knot Ui has a  
 multiplicity p the B-spline curve is only Cd-p continuous  
 at Ui. So the global continuity of the curve can't be greater  
 than Cd-p where p is the maximum multiplicity of the interior  
 Knots. In the interior of a knot span the curve is infinitely  
 continuously differentiable.") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the degree of this BSpline curve.  
The degree of a Geom_BSplineCurve curve cannot  
be greater than Geom_BSplineCurve::MaxDegree().  Computation of value and derivatives") Degree;
		Standard_Integer Degree ();
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)

Returns:
	None

Returns in P the point of parameter U.") D0;
		void D0 (const Standard_Real U,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)

Returns:
	None

Raised if the continuity of the curve is not C1.") D1;
		void D1 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)

Returns:
	None

Raised if the continuity of the curve is not C2.") D2;
		void D2 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)
	V3(gp_Vec)

Returns:
	None

Raised if the continuity of the curve is not C3.") D3;
		void D3 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("autodoc", "Args:
	U(Standard_Real)
	N(Standard_Integer)

Returns:
	gp_Vec

For the point of parameter U of this BSpline curve,  
computes the vector corresponding to the Nth derivative.  
Warning  
On a point where the continuity of the curve is not the  
one requested, this function impacts the part defined  
by the parameter with a value greater than U, i.e. the  
part of the curve to the 'right' of the singularity.  
Exceptions  
Standard_RangeError if N is less than 1.  
 The following functions compute the point of parameter U  
 and the derivatives at this point on the B-spline curve  
 arc defined between the knot FromK1 and the knot ToK2.  
 U can be out of bounds [Knot (FromK1),  Knot (ToK2)] but  
 for the computation we only use the definition of the curve  
 between these two knots. This method is useful to compute  
 local derivative, if the order of continuity of the whole  
 curve is not greater enough.    Inside the parametric  
 domain Knot (FromK1), Knot (ToK2) the evaluations are  
 the same as if we consider the whole definition of the  
 curve. Of course the evaluations are different outside  
 this parametric domain.") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Integer N);
		%feature("autodoc", "Args:
	U(Standard_Real)
	FromK1(Standard_Integer)
	ToK2(Standard_Integer)

Returns:
	gp_Pnt

Raised if FromK1 = ToK2.  
 Raised if FromK1 and ToK2 are not in the range  
 [FirstUKnotIndex, LastUKnotIndex].") LocalValue;
		gp_Pnt LocalValue (const Standard_Real U,const Standard_Integer FromK1,const Standard_Integer ToK2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	FromK1(Standard_Integer)
	ToK2(Standard_Integer)
	P(gp_Pnt)

Returns:
	None

Raised if FromK1 = ToK2.  
 Raised if FromK1 and ToK2 are not in the range  
 [FirstUKnotIndex, LastUKnotIndex].") LocalD0;
		void LocalD0 (const Standard_Real U,const Standard_Integer FromK1,const Standard_Integer ToK2,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	FromK1(Standard_Integer)
	ToK2(Standard_Integer)
	P(gp_Pnt)
	V1(gp_Vec)

Returns:
	None

Raised if the local continuity of the curve is not C1  
 between the knot K1 and the knot K2.  Raised if FromK1 = ToK2.  
 Raised if FromK1 and ToK2 are not in the range  
 [FirstUKnotIndex, LastUKnotIndex].") LocalD1;
		void LocalD1 (const Standard_Real U,const Standard_Integer FromK1,const Standard_Integer ToK2,gp_Pnt & P,gp_Vec & V1);
		%feature("autodoc", "Args:
	U(Standard_Real)
	FromK1(Standard_Integer)
	ToK2(Standard_Integer)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)

Returns:
	None

Raised if the local continuity of the curve is not C2  
 between the knot K1 and the knot K2.  Raised if FromK1 = ToK2.  
 Raised if FromK1 and ToK2 are not in the range  
 [FirstUKnotIndex, LastUKnotIndex].") LocalD2;
		void LocalD2 (const Standard_Real U,const Standard_Integer FromK1,const Standard_Integer ToK2,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	FromK1(Standard_Integer)
	ToK2(Standard_Integer)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)
	V3(gp_Vec)

Returns:
	None

Raised if the local continuity of the curve is not C3  
 between the knot K1 and the knot K2.  Raised if FromK1 = ToK2.  
 Raised if FromK1 and ToK2 are not in the range  
 [FirstUKnotIndex, LastUKnotIndex].") LocalD3;
		void LocalD3 (const Standard_Real U,const Standard_Integer FromK1,const Standard_Integer ToK2,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("autodoc", "Args:
	U(Standard_Real)
	FromK1(Standard_Integer)
	ToK2(Standard_Integer)
	N(Standard_Integer)

Returns:
	gp_Vec

Raised if the local continuity of the curve is not CN  
 between the knot K1 and the knot K2.  Raised if FromK1 = ToK2.  Raised if N < 1.  
 Raises if FromK1 and ToK2 are not in the range  
 [FirstUKnotIndex, LastUKnotIndex].") LocalDN;
		gp_Vec LocalDN (const Standard_Real U,const Standard_Integer FromK1,const Standard_Integer ToK2,const Standard_Integer N);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the last point of the curve.  
Warnings :  
 The last point of the curve is different from the last  
 pole of the curve if the multiplicity of the last knot  
 is lower than Degree.") EndPoint;
		gp_Pnt EndPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the index in the knot array of the knot  
corresponding to the first or last parameter of this BSpline curve.  
For a BSpline curve, the first (or last) parameter  
(which gives the start (or end) point of the curve) is a  
knot value. However, if the multiplicity of the first (or  
last) knot is less than Degree + 1, where  
Degree is the degree of the curve, it is not the first  
(or last) knot of the curve.") FirstUKnotIndex;
		Standard_Integer FirstUKnotIndex ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the value of the first parameter of this  
BSpline curve. This is a knot value.  
The first parameter is the one of the start point of the BSpline curve.") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

Returns the knot of range Index. When there is a knot  
 with a multiplicity greater than 1 the knot is not repeated.  
 The method Multiplicity can be used to get the multiplicity  
 of the Knot.  Raised if Index < 1 or Index > NbKnots") Knot;
		Standard_Real Knot (const Standard_Integer Index);
		%feature("autodoc", "Args:
	K(TColStd_Array1OfReal)

Returns:
	None

returns the knot values of the B-spline curve;  
Warning  
A knot with a multiplicity greater than 1 is not  
repeated in the knot table. The Multiplicity function  
can be used to obtain the multiplicity of each knot.  
 Raised if the length of K is not equal to the number of knots.") Knots;
		void Knots (TColStd_Array1OfReal & K);
		%feature("autodoc", "Args:
	K(TColStd_Array1OfReal)

Returns:
	None

Returns K, the knots sequence of this BSpline curve.  
In this sequence, knots with a multiplicity greater than 1 are repeated.  
In the case of a non-periodic curve the length of the  
sequence must be equal to the sum of the NbKnots  
multiplicities of the knots of the curve (where  
NbKnots is the number of knots of this BSpline  
curve). This sum is also equal to : NbPoles + Degree + 1  
where NbPoles is the number of poles and  
Degree the degree of this BSpline curve.  
In the case of a periodic curve, if there are k periodic  
knots, the period is Knot(k+1) - Knot(1).  
The initial sequence is built by writing knots 1 to k+1,  
which are repeated according to their corresponding multiplicities.  
If Degree is the degree of the curve, the degree of  
continuity of the curve at the knot of index 1 (or k+1)  
is equal to c = Degree + 1 - Mult(1). c  
knots are then inserted at the beginning and end of  
the initial sequence:  
- the c values of knots preceding the first item  
  Knot(k+1) in the initial sequence are inserted  
  at the beginning; the period is subtracted from these c values;  
- the c values of knots following the last item  
  Knot(1) in the initial sequence are inserted at  
  the end; the period is added to these c values.  
The length of the sequence must therefore be equal to:  
NbPoles + 2*Degree - Mult(1) + 2.  
Example  
For a non-periodic BSpline curve of degree 2 where:  
- the array of knots is: { k1 k2 k3 k4 },  
- with associated multiplicities: { 3 1 2 3 },  
the knot sequence is:  
K = { k1 k1 k1 k2 k3 k3 k4 k4 k4 }  
For a periodic BSpline curve of degree 4 , which is  
'C1' continuous at the first knot, and where :  
- the periodic knots are: { k1 k2 k3 (k4) }  
  (3 periodic knots: the points of parameter k1 and k4  
  are identical, the period is p = k4 - k1),  
- with associated multiplicities: { 3 1 2 (3) },  
the degree of continuity at knots k1 and k4 is:  
Degree + 1 - Mult(i) = 2.  
2 supplementary knots are added at the beginning  
and end of the sequence:  
- at the beginning: the 2 knots preceding k4 minus  
  the period; in this example, this is k3 - p both times;  
- at the end: the 2 knots following k1 plus the period;  
  in this example, this is k2 + p and k3 + p.  
The knot sequence is therefore:  
K = { k3-p k3-p k1 k1 k1 k2 k3 k3  
k4 k4 k4 k2+p k3+p }  
Exceptions  
Standard_DimensionError if the array K is not of  
the appropriate length.Returns the knots sequence.") KnotSequence;
		void KnotSequence (TColStd_Array1OfReal & K);
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_BSplKnotDistribution

Returns NonUniform or Uniform or QuasiUniform or PiecewiseBezier.  
 If all the knots differ by a positive constant from the  
 preceding knot the BSpline Curve can be :  
 - Uniform if all the knots are of multiplicity 1,  
 - QuasiUniform if all the knots are of multiplicity 1 except for  
   the first and last knot which are of multiplicity Degree + 1,  
 - PiecewiseBezier if the first and last knots have multiplicity  
   Degree + 1 and if interior knots have multiplicity Degree  
   A piecewise Bezier with only two knots is a BezierCurve.  
 else the curve is non uniform.  
 The tolerance criterion is Epsilon from class Real.") KnotDistribution;
		GeomAbs_BSplKnotDistribution KnotDistribution ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

For a BSpline curve the last parameter (which gives the  
 end point of the curve) is a knot value but if the  
 multiplicity of the last knot index is lower than  
 Degree + 1 it is not the last knot of the curve. This  
 method computes the index of the knot corresponding to  
 the last parameter.") LastUKnotIndex;
		Standard_Integer LastUKnotIndex ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Computes the parametric value of the end point of the curve.  
 It is a knot value.") LastParameter;
		Standard_Real LastParameter ();
		%feature("autodoc", "Args:
	U(Standard_Real)
	ParametricTolerance(Standard_Real)
	I1(Standard_Integer)
	I2(Standard_Integer)
	WithKnotRepetition(Standard_Boolean)=Standard_False

Returns:
	None

Locates the parametric value U in the sequence of knots.  
 If 'WithKnotRepetition' is True we consider the knot's  
 representation with repetition of multiple knot value,  
 otherwise  we consider the knot's representation with  
 no repetition of multiple knot values.  
 Knots (I1) <= U <= Knots (I2)  
 . if I1 = I2  U is a knot value (the tolerance criterion  
   ParametricTolerance is used).  
 . if I1 < 1  => U < Knots (1) - Abs(ParametricTolerance)  
 . if I2 > NbKnots => U > Knots (NbKnots) + Abs(ParametricTolerance)") LocateU;
		void LocateU (const Standard_Real U,const Standard_Real ParametricTolerance,Standard_Integer &OutValue,Standard_Integer &OutValue,const Standard_Boolean WithKnotRepetition = Standard_False);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Integer

Returns the multiplicity of the knots of range Index.  Raised if Index < 1 or Index > NbKnots") Multiplicity;
		Standard_Integer Multiplicity (const Standard_Integer Index);
		%feature("autodoc", "Args:
	M(TColStd_Array1OfInteger)

Returns:
	None

Returns the multiplicity of the knots of the curve.  
 Raised if the length of M is not equal to NbKnots.") Multiplicities;
		void Multiplicities (TColStd_Array1OfInteger & M);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of knots. This method returns the number of  
 knot without repetition of multiple knots.") NbKnots;
		Standard_Integer NbKnots ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of poles") NbPoles;
		Standard_Integer NbPoles ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Pnt

Returns the pole of range Index.  Raised if Index < 1 or Index > NbPoles.") Pole;
		gp_Pnt Pole (const Standard_Integer Index);
		%feature("autodoc", "Args:
	P(TColgp_Array1OfPnt)

Returns:
	None

Returns the poles of the B-spline curve;  
 Raised if the length of P is not equal to the number of poles.") Poles;
		void Poles (TColgp_Array1OfPnt & P);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the start point of the curve.  
Warnings :  
 This point is different from the first pole of the curve if the  
 multiplicity of the first knot is lower than Degree.") StartPoint;
		gp_Pnt StartPoint ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

Returns the weight of the pole of range Index .  Raised if Index < 1 or Index > NbPoles.") Weight;
		Standard_Real Weight (const Standard_Integer Index);
		%feature("autodoc", "Args:
	W(TColStd_Array1OfReal)

Returns:
	None

Returns the weights of the B-spline curve;  
 Raised if the length of W is not equal to NbPoles.") Weights;
		void Weights (TColStd_Array1OfReal & W);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

Applies the transformation T to this BSpline curve.") Transform;
		void Transform (const gp_Trsf & T);
		%feature("autodoc", "Args:
	None
Returns:
	static Standard_Integer

Returns the value of the maximum degree of the normalized  
 B-spline basis functions in this package.") MaxDegree;
		static Standard_Integer MaxDegree ();
		%feature("autodoc", "Args:
	Tolerance3D(Standard_Real)
	UTolerance(Standard_Real)

Returns:
	None

Computes for this BSpline curve the parametric  
tolerance UTolerance for a given 3D tolerance Tolerance3D.  
If f(t) is the equation of this BSpline curve,  
UTolerance ensures that:  
          | t1 - t0| < Utolerance ===>  
          |f(t1) - f(t0)| < Tolerance3D") Resolution;
		void Resolution (const Standard_Real Tolerance3D,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Geometry

Creates a new object which is a copy of this BSpline curve.") Copy;
		Handle_Geom_Geometry Copy ();
		%feature("autodoc", "Args:
	theOther(Handle_Geom_BSplineCurve)
	thePreci(Standard_Real)

Returns:
	Standard_Boolean

Comapare two Bspline curve on identity;") IsEqual;
		Standard_Boolean IsEqual (const Handle_Geom_BSplineCurve & theOther,const Standard_Real thePreci);
};


%feature("shadow") Geom_BSplineCurve::~Geom_BSplineCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom_BSplineCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Geom_BSplineCurve {
	Handle_Geom_BSplineCurve GetHandle() {
	return *(Handle_Geom_BSplineCurve*) &$self;
	}
};

%nodefaultctor Handle_Geom_BSplineCurve;
class Handle_Geom_BSplineCurve : public Handle_Geom_BoundedCurve {

    public:
        // constructors
        Handle_Geom_BSplineCurve();
        Handle_Geom_BSplineCurve(const Handle_Geom_BSplineCurve &aHandle);
        Handle_Geom_BSplineCurve(const Geom_BSplineCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Geom_BSplineCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Geom_BSplineCurve {
    Geom_BSplineCurve* GetObject() {
    return (Geom_BSplineCurve*)$self->Access();
    }
};
%feature("shadow") Handle_Geom_BSplineCurve::~Handle_Geom_BSplineCurve %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Geom_BSplineCurve {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Geom_BSplineSurface;
class Geom_BSplineSurface : public Geom_BoundedSurface {
	public:
		%feature("autodoc", "Args:
	Poles(TColgp_Array2OfPnt)
	UKnots(TColStd_Array1OfReal)
	VKnots(TColStd_Array1OfReal)
	UMults(TColStd_Array1OfInteger)
	VMults(TColStd_Array1OfInteger)
	UDegree(Standard_Integer)
	VDegree(Standard_Integer)
	UPeriodic(Standard_Boolean)=Standard_False
	VPeriodic(Standard_Boolean)=Standard_False

Returns:
	None

Creates  a non-rational b-spline surface (weights  
        default value is 1.).  The following conditions must be verified.  
  0 < UDegree <= MaxDegree.  
  UKnots.Length() == UMults.Length() >= 2  
  UKnots(i) < UKnots(i+1) (Knots are increasing)  
  1 <= UMults(i) <= UDegree  
  On a   non  uperiodic   surface    the  first and    last  
  umultiplicities  may  be     UDegree+1  (this   is   even  
  recommanded if you want the curve  to start and finish on  
  the first and last pole).  
  On a uperiodic     surface  the first    and   the   last  
  umultiplicities must be the same.  
  on non-uperiodic surfaces  
    Poles.ColLength() == Sum(UMults(i)) - UDegree - 1 >= 2  
  on uperiodic surfaces  
  Poles.ColLength() == Sum(UMults(i)) except the first or last  
  The previous conditions for U holds  also for V, with the  
  RowLength of the poles.") Geom_BSplineSurface;
		 Geom_BSplineSurface (const TColgp_Array2OfPnt & Poles,const TColStd_Array1OfReal & UKnots,const TColStd_Array1OfReal & VKnots,const TColStd_Array1OfInteger & UMults,const TColStd_Array1OfInteger & VMults,const Standard_Integer UDegree,const Standard_Integer VDegree,const Standard_Boolean UPeriodic = Standard_False,const Standard_Boolean VPeriodic = Standard_False);
		%feature("autodoc", "Args:
	Poles(TColgp_Array2OfPnt)
	Weights(TColStd_Array2OfReal)
	UKnots(TColStd_Array1OfReal)
	VKnots(TColStd_Array1OfReal)
	UMults(TColStd_Array1OfInteger)
	VMults(TColStd_Array1OfInteger)
	UDegree(Standard_Integer)
	VDegree(Standard_Integer)
	UPeriodic(Standard_Boolean)=Standard_False
	VPeriodic(Standard_Boolean)=Standard_False

Returns:
	None

Creates  a non-rational b-spline surface (weights  
        default value is 1.).  
 The following conditions must be verified.  
 0 < UDegree <= MaxDegree.  
 
 UKnots.Length() == UMults.Length() >= 2  
 
 UKnots(i) < UKnots(i+1) (Knots are increasing)  
 1 <= UMults(i) <= UDegree  
 
  On a   non  uperiodic   surface    the  first and    last  
  umultiplicities  may  be     UDegree+1  (this   is   even  
  recommanded if you want the curve  to start and finish on  
  the first and last pole).  
 
  On a uperiodic     surface  the first    and   the   last  
  umultiplicities must be the same.  
 
  on non-uperiodic surfaces  
 
    Poles.ColLength() == Sum(UMults(i)) - UDegree - 1 >= 2  
 
  on uperiodic surfaces  
 
    Poles.ColLength() == Sum(UMults(i)) except the first or  
    last  
 
 
  The previous conditions for U holds  also for V, with the  
  RowLength of the poles.") Geom_BSplineSurface;
		 Geom_BSplineSurface (const TColgp_Array2OfPnt & Poles,const TColStd_Array2OfReal & Weights,const TColStd_Array1OfReal & UKnots,const TColStd_Array1OfReal & VKnots,const TColStd_Array1OfInteger & UMults,const TColStd_Array1OfInteger & VMults,const Standard_Integer UDegree,const Standard_Integer VDegree,const Standard_Boolean UPeriodic = Standard_False,const Standard_Boolean VPeriodic = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	None

Exchanges the u and v parametric directions on  
this BSpline surface.  
As a consequence:  
- the poles and weights tables are transposed,  
- the knots and multiplicities tables are exchanged,  
- degrees of continuity, and rational, periodic and  
  uniform characteristics are exchanged, and  
- the orientation of the surface is inverted.") ExchangeUV;
		void ExchangeUV ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Sets the surface U periodic.") SetUPeriodic;
		void SetUPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Modifies this surface to be periodic in the u (or v)  
parametric direction.  
To become periodic in a given parametric direction a  
surface must be closed in that parametric direction,  
and the knot sequence relative to that direction must be periodic.  
To generate this periodic sequence of knots, the  
functions FirstUKnotIndex and LastUKnotIndex (or  
FirstVKnotIndex and LastVKnotIndex) are used to  
compute I1 and I2. These are the indexes, in the  
knot array associated with the given parametric  
direction, of the knots that correspond to the first and  
last parameters of this BSpline surface in the given  
parametric direction. Hence the period is:  
Knots(I1) - Knots(I2)  
As a result, the knots and poles tables are modified.  
Exceptions  
Standard_ConstructionError if the surface is not  
closed in the given parametric direction.") SetVPeriodic;
		void SetVPeriodic ();
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)

Returns:
	None

returns the parameter normalized within  
        the period if the surface is periodic : otherwise  
        does not do anything") PeriodicNormalization;
		void PeriodicNormalization (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

Assigns the knot of index Index in the knots table in  
the corresponding parametric direction to be the  
origin of this periodic BSpline surface. As a  
consequence, the knots and poles tables are modified.  
Exceptions  
Standard_NoSuchObject if this BSpline surface is  
not periodic in the given parametric direction.  
Standard_DomainError if Index is outside the  
bounds of the knots table in the given parametric direction.") SetUOrigin;
		void SetUOrigin (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

Assigns the knot of index Index in the knots table in  
the corresponding parametric direction to be the  
origin of this periodic BSpline surface. As a  
consequence, the knots and poles tables are modified.  
Exceptions  
Standard_NoSuchObject if this BSpline surface is  
not periodic in the given parametric direction.  
Standard_DomainError if Index is outside the  
bounds of the knots table in the given parametric direction.") SetVOrigin;
		void SetVOrigin (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") SetUNotPeriodic;
		void SetUNotPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Modifies this surface to be periodic in the u (or v) parametric direction.  
To become periodic in a given parametric direction a  
surface must be closed in that parametric direction,  
and the knot sequence relative to that direction must be periodic.  
To generate this periodic sequence of knots, the  
functions FirstUKnotIndex and LastUKnotIndex (or  
FirstVKnotIndex and LastVKnotIndex) are used to  
compute I1 and I2. These are the indexes, in the  
knot array associated with the given parametric  
direction, of the knots that correspond to the first and  
last parameters of this BSpline surface in the given  
parametric direction. Hence the period is:  
Knots(I1) - Knots(I2)  
As a result, the knots and poles tables are modified.  
Exceptions  
Standard_ConstructionError if the surface is not  
closed in the given parametric direction.") SetVNotPeriodic;
		void SetVNotPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") UReverse;
		void UReverse ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Changes the orientation of this BSpline surface in the  
u (or v) parametric direction. The bounds of the  
surface are not changed but the given parametric  
direction is reversed. Hence the orientation of the  
surface is reversed.  
The knots and poles tables are modified.") VReverse;
		void VReverse ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Standard_Real

No detailed docstring for this function.") UReversedParameter;
		Standard_Real UReversedParameter (const Standard_Real U);
		%feature("autodoc", "Args:
	V(Standard_Real)

Returns:
	Standard_Real

Computes the u (or v) parameter on the modified  
surface, produced by reversing its u (or v) parametric  
direction, for the point of u parameter U, (or of v  
parameter V) on this BSpline surface.  
For a BSpline surface, these functions return respectively:  
- UFirst + ULast - U, or  
- VFirst + VLast - V,  
where UFirst, ULast, VFirst and VLast are  
the values of the first and last parameters of this  
BSpline surface, in the u and v parametric directions.") VReversedParameter;
		Standard_Real VReversedParameter (const Standard_Real V);
		%feature("autodoc", "Args:
	UDegree(Standard_Integer)
	VDegree(Standard_Integer)

Returns:
	None

Increases the degrees of this BSpline surface to  
UDegree and VDegree in the u and v parametric  
directions respectively. As a result, the tables of poles,  
weights and multiplicities are modified. The tables of  
knots is not changed.  
Note: Nothing is done if the given degree is less than  
or equal to the current degree in the corresponding  
parametric direction.  
Exceptions  
Standard_ConstructionError if UDegree or  
VDegree is greater than  
Geom_BSplineSurface::MaxDegree().") IncreaseDegree;
		void IncreaseDegree (const Standard_Integer UDegree,const Standard_Integer VDegree);
		%feature("autodoc", "Args:
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	ParametricTolerance(Standard_Real)=0.0
	Add(Standard_Boolean)=Standard_True

Returns:
	None

No detailed docstring for this function.") InsertUKnots;
		void InsertUKnots (const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Real ParametricTolerance = 0.0,const Standard_Boolean Add = Standard_True);
		%feature("autodoc", "Args:
	Knots(TColStd_Array1OfReal)
	Mults(TColStd_Array1OfInteger)
	ParametricTolerance(Standard_Real)=0.0
	Add(Standard_Boolean)=Standard_True

Returns:
	None

Inserts into the knots table for the corresponding  
parametric direction of this BSpline surface:  
- the value U, or V, with the multiplicity M (defaulted to 1), or  
- the values of the array Knots, with their respective  
multiplicities, Mults.  
If the knot value to insert already exists in the table, its multiplicity is:  
- increased by M, if Add is true (the default), or  
- increased to M, if Add is false.  
The tolerance criterion used to check the equality of  
the knots is the larger of the values ParametricTolerance and  
Standard_Real::Epsilon(val), where val is the knot value to be inserted.  
Warning  
- If a given multiplicity coefficient is null, or negative, nothing is done.  
- The new multiplicity of a knot is limited to the degree of this BSpline surface in the  
  corresponding parametric direction.  
Exceptions  
Standard_ConstructionError if a knot value to  
insert is outside the bounds of this BSpline surface in  
the specified parametric direction. The comparison  
uses the precision criterion ParametricTolerance.") InsertVKnots;
		void InsertVKnots (const TColStd_Array1OfReal & Knots,const TColStd_Array1OfInteger & Mults,const Standard_Real ParametricTolerance = 0.0,const Standard_Boolean Add = Standard_True);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	M(Standard_Integer)
	Tolerance(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") RemoveUKnot;
		Standard_Boolean RemoveUKnot (const Standard_Integer Index,const Standard_Integer M,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	M(Standard_Integer)
	Tolerance(Standard_Real)

Returns:
	Standard_Boolean

Reduces to M the multiplicity of the knot of index  
Index in the given parametric direction. If M is 0, the knot is removed.  
With a modification of this type, the table of poles is also modified.  
Two different algorithms are used systematically to  
compute the new poles of the surface. For each  
pole, the distance between the pole calculated  
using the first algorithm and the same pole  
calculated using the second algorithm, is checked. If  
this distance is less than Tolerance it ensures that  
the surface is not modified by more than Tolerance.  
Under these conditions, the function returns true;  
otherwise, it returns false.  
A low tolerance prevents modification of the  
surface. A high tolerance 'smoothes' the surface.  
Exceptions  
Standard_OutOfRange if Index is outside the  
bounds of the knots table of this BSpline surface.") RemoveVKnot;
		Standard_Boolean RemoveVKnot (const Standard_Integer Index,const Standard_Integer M,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	UIndex(Standard_Integer)
	M(Standard_Integer)

Returns:
	None

Increases the multiplicity of the knot of range UIndex  
 in the UKnots sequence.  
 M is the new multiplicity. M must be greater than the  
 previous multiplicity and lower or equal to the degree  
 of the surface in the U parametric direction.  Raised if M is not in the range [1, UDegree]  
 Raised if UIndex is not in the range [FirstUKnotIndex,  
 LastUKnotIndex] given by the methods with the same name.") IncreaseUMultiplicity;
		void IncreaseUMultiplicity (const Standard_Integer UIndex,const Standard_Integer M);
		%feature("autodoc", "Args:
	FromI1(Standard_Integer)
	ToI2(Standard_Integer)
	M(Standard_Integer)

Returns:
	None

Increases until order M the multiplicity of the set of knots  
 FromI1,...., ToI2 in the U direction. This method can be used  
 to make a B_spline surface into a PiecewiseBezier B_spline  
 surface.  
 If <self> was uniform, it can become non uniform.  
 Raised if FromI1 or ToI2 is out of the range [FirstUKnotIndex,  
 LastUKnotIndex].  
 M should be greater than the previous multiplicity of the  
 all the knots FromI1,..., ToI2 and lower or equal to the  
  Degree of the surface in the U parametric direction.") IncreaseUMultiplicity;
		void IncreaseUMultiplicity (const Standard_Integer FromI1,const Standard_Integer ToI2,const Standard_Integer M);
		%feature("autodoc", "Args:
	FromI1(Standard_Integer)
	ToI2(Standard_Integer)
	Step(Standard_Integer)

Returns:
	None

Increments the multiplicity of the consecutives uknots FromI1..ToI2  
 by step.   The multiplicity of each knot FromI1,.....,ToI2 must be  
 lower or equal to the UDegree of the B_spline.  
 Raised if FromI1 or ToI2 is not in the range  
 [FirstUKnotIndex, LastUKnotIndex]  
 Raised if one knot has a multiplicity greater than UDegree.") IncrementUMultiplicity;
		void IncrementUMultiplicity (const Standard_Integer FromI1,const Standard_Integer ToI2,const Standard_Integer Step);
		%feature("autodoc", "Args:
	VIndex(Standard_Integer)
	M(Standard_Integer)

Returns:
	None

Increases the multiplicity of a knot in the V direction.  
 M is the new multiplicity.  
 M should be greater than the previous multiplicity and lower  
 than the degree of the surface in the V parametric direction.  
 Raised if VIndex is not in the range [FirstVKnotIndex,  
 LastVKnotIndex] given by the methods with the same name.") IncreaseVMultiplicity;
		void IncreaseVMultiplicity (const Standard_Integer VIndex,const Standard_Integer M);
		%feature("autodoc", "Args:
	FromI1(Standard_Integer)
	ToI2(Standard_Integer)
	M(Standard_Integer)

Returns:
	None

Increases until order M the multiplicity of the set of knots  
 FromI1,...., ToI2 in the V direction. This method can be used to  
 make a BSplineSurface into a PiecewiseBezier B_spline  
 surface. If <self> was uniform, it can become non-uniform.  
 Raised if FromI1 or ToI2 is out of the range [FirstVKnotIndex,  
 LastVKnotIndex] given by the methods with the same name.  
 M should be greater than the previous multiplicity of the  
 all the knots FromI1,..., ToI2 and lower or equal to the  
 Degree of the surface in the V parametric direction.") IncreaseVMultiplicity;
		void IncreaseVMultiplicity (const Standard_Integer FromI1,const Standard_Integer ToI2,const Standard_Integer M);
		%feature("autodoc", "Args:
	FromI1(Standard_Integer)
	ToI2(Standard_Integer)
	Step(Standard_Integer)

Returns:
	None

Increments the multiplicity of the consecutives vknots FromI1..ToI2  
 by step.  The multiplicity of each knot FromI1,.....,ToI2 must be  
 lower or equal to the VDegree of the B_spline.  
 Raised if FromI1 or ToI2 is not in the range  
 [FirstVKnotIndex, LastVKnotIndex]  
 Raised if one knot has a multiplicity greater than VDegree.") IncrementVMultiplicity;
		void IncrementVMultiplicity (const Standard_Integer FromI1,const Standard_Integer ToI2,const Standard_Integer Step);
		%feature("autodoc", "Args:
	U(Standard_Real)
	M(Standard_Integer)
	ParametricTolerance(Standard_Real)
	Add(Standard_Boolean)=Standard_True

Returns:
	None

Inserts a knot value in the sequence of UKnots. If U is a knot  
 value this method increases the multiplicity of the knot if the  
 previous multiplicity was lower than M else it does nothing. The  
 tolerance criterion is ParametricTolerance. ParametricTolerance  
 should be greater or equal than Resolution from package gp.  
 Raised if U is out of the bounds [U1, U2] given by the methods  
 Bounds, the criterion ParametricTolerance is used.  
 Raised if M is not in the range [1, UDegree].") InsertUKnot;
		void InsertUKnot (const Standard_Real U,const Standard_Integer M,const Standard_Real ParametricTolerance,const Standard_Boolean Add = Standard_True);
		%feature("autodoc", "Args:
	V(Standard_Real)
	M(Standard_Integer)
	ParametricTolerance(Standard_Real)
	Add(Standard_Boolean)=Standard_True

Returns:
	None

Inserts a knot value in the sequence of VKnots. If V is a knot  
 value this method increases the multiplicity of the knot if the  
 previous multiplicity was lower than M otherwise it does nothing.  
 The tolerance criterion is ParametricTolerance.  
 ParametricTolerance should be greater or equal than Resolution  
 from package gp.  
 raises if V is out of the Bounds [V1, V2] given by the methods  
 Bounds, the criterion ParametricTolerance is used.  
 raises if M is not in the range [1, VDegree].") InsertVKnot;
		void InsertVKnot (const Standard_Real V,const Standard_Integer M,const Standard_Real ParametricTolerance,const Standard_Boolean Add = Standard_True);
		%feature("autodoc", "Args:
	U1(Standard_Real)
	U2(Standard_Real)
	V1(Standard_Real)
	V2(Standard_Real)

Returns:
	None

Segments the surface between U1 and U2 in the U-Direction.  
                      between V1 and V2 in the V-Direction.  
 The control points are modified, the first and the last point  
 are not the same.  
Warnings :  
 Even if <self> is not closed it can become closed after the  
 segmentation for example if U1 or U2 are out of the bounds  
 of the surface <self> or if the surface makes loop.  raises if U2 < U1 or V2 < V1") Segment;
		void Segment (const Standard_Real U1,const Standard_Real U2,const Standard_Real V1,const Standard_Real V2);
		%feature("autodoc", "Args:
	U1(Standard_Real)
	U2(Standard_Real)
	V1(Standard_Real)
	V2(Standard_Real)

Returns:
	None

Segments the surface between U1 and U2 in the U-Direction.  
                      between V1 and V2 in the V-Direction.  
 
 same as Segment but do nothing if U1 and U2 (resp. V1 and V2) are  
 equal to the bounds in U (resp. in V) of <self>.  
 For example, if <self> is periodic in V, it will be always periodic  
 in V after the segmentation if the bounds in V are unchanged  
 
Warnings :  
 Even if <self> is not closed it can become closed after the  
 segmentation for example if U1 or U2 are out of the bounds  
 of the surface <self> or if the surface makes loop.  raises if U2 < U1 or V2 < V1") CheckAndSegment;
		void CheckAndSegment (const Standard_Real U1,const Standard_Real U2,const Standard_Real V1,const Standard_Real V2);
		%feature("autodoc", "Args:
	UIndex(Standard_Integer)
	K(Standard_Real)

Returns:
	None

Substitutes the UKnots of range UIndex with K.  
 Raised if UIndex < 1 or UIndex > NbUKnots  
 Raised if K >= UKnots(UIndex+1) or K <= UKnots(UIndex-1)") SetUKnot;
		void SetUKnot (const Standard_Integer UIndex,const Standard_Real K);
		%feature("autodoc", "Args:
	UK(TColStd_Array1OfReal)

Returns:
	None

Changes all the U-knots of the surface.  
 The multiplicity of the knots are not modified.  
 Raised if there is an index such that UK (Index+1) <= UK (Index).  
 Raised if  UK.Lower() < 1 or UK.Upper() > NbUKnots") SetUKnots;
		void SetUKnots (const TColStd_Array1OfReal & UK);
		%feature("autodoc", "Args:
	UIndex(Standard_Integer)
	K(Standard_Real)
	M(Standard_Integer)

Returns:
	None

Changes the value of the UKnots of range UIndex and  
 increases its multiplicity.  
 Raised if UIndex is not in the range [FirstUKnotIndex,  
 LastUKnotIndex] given by the methods with the same name.  
 Raised if K >= UKnots(UIndex+1) or K <= UKnots(UIndex-1)  
 M must be lower than UDegree and greater than the previous  
 multiplicity of the knot of range UIndex.") SetUKnot;
		void SetUKnot (const Standard_Integer UIndex,const Standard_Real K,const Standard_Integer M);
		%feature("autodoc", "Args:
	VIndex(Standard_Integer)
	K(Standard_Real)

Returns:
	None

Substitutes the VKnots of range VIndex with K.  
 Raised if VIndex < 1 or VIndex > NbVKnots  
 Raised if K >= VKnots(VIndex+1) or K <= VKnots(VIndex-1)") SetVKnot;
		void SetVKnot (const Standard_Integer VIndex,const Standard_Real K);
		%feature("autodoc", "Args:
	VK(TColStd_Array1OfReal)

Returns:
	None

Changes all the V-knots of the surface.  
 The multiplicity of the knots are not modified.  
 Raised if there is an index such that VK (Index+1) <= VK (Index).  
 Raised if  VK.Lower() < 1 or VK.Upper() > NbVKnots") SetVKnots;
		void SetVKnots (const TColStd_Array1OfReal & VK);
		%feature("autodoc", "Args:
	VIndex(Standard_Integer)
	K(Standard_Real)
	M(Standard_Integer)

Returns:
	None

Changes the value of the VKnots of range VIndex and increases  
 its multiplicity.  
 Raised if VIndex is not in the range [FirstVKnotIndex,  
 LastVKnotIndex] given by the methods with the same name.  
 Raised if K >= VKnots(VIndex+1) or K <= VKnots(VIndex-1)  
 M must be lower than VDegree and greater than the previous  
 multiplicity of the knot of range VIndex.") SetVKnot;
		void SetVKnot (const Standard_Integer VIndex,const Standard_Real K,const Standard_Integer M);
		%feature("autodoc", "Args:
	U(Standard_Real)
	ParametricTolerance(Standard_Real)
	I1(Standard_Integer)
	I2(Standard_Integer)
	WithKnotRepetition(Standard_Boolean)=Standard_False

Returns:
	None

Locates the parametric value U in the sequence of UKnots.  
 If 'WithKnotRepetition' is True we consider the knot's  
 representation with repetition of multiple knot value,  
 otherwise  we consider the knot's representation with  
 no repetition of multiple knot values.  
 UKnots (I1) <= U <= UKnots (I2)  
 . if I1 = I2  U is a knot value (the tolerance criterion  
   ParametricTolerance is used).  
 . if I1 < 1  => U < UKnots(1) - Abs(ParametricTolerance)  
 . if I2 > NbUKnots => U > UKnots(NbUKnots)+Abs(ParametricTolerance)") LocateU;
		void LocateU (const Standard_Real U,const Standard_Real ParametricTolerance,Standard_Integer &OutValue,Standard_Integer &OutValue,const Standard_Boolean WithKnotRepetition = Standard_False);
		%feature("autodoc", "Args:
	V(Standard_Real)
	ParametricTolerance(Standard_Real)
	I1(Standard_Integer)
	I2(Standard_Integer)
	WithKnotRepetition(Standard_Boolean)=Standard_False

Returns:
	None

Locates the parametric value U in the sequence of knots.  
 If 'WithKnotRepetition' is True we consider the knot's  
 representation with repetition of multiple knot value,  
 otherwise  we consider the knot's representation with  
 no repetition of multiple knot values.  
 VKnots (I1) <= V <= VKnots (I2)  
 . if I1 = I2  V is a knot value (the tolerance criterion  
   ParametricTolerance is used).  
 . if I1 < 1  => V < VKnots(1) - Abs(ParametricTolerance)  
 . if I2 > NbVKnots => V > VKnots(NbVKnots)+Abs(ParametricTolerance)   poles insertion and removing  
 The following methods are available only if the surface  
 is Uniform or QuasiUniform in the considered direction  
 The knot repartition is modified.") LocateV;
		void LocateV (const Standard_Real V,const Standard_Real ParametricTolerance,Standard_Integer &OutValue,Standard_Integer &OutValue,const Standard_Boolean WithKnotRepetition = Standard_False);
		%feature("autodoc", "Args:
	UIndex(Standard_Integer)
	VIndex(Standard_Integer)
	P(gp_Pnt)

Returns:
	None

Substitutes the pole of range (UIndex, VIndex) with P.  
 If the surface is rational the weight of range (UIndex, VIndex)  
 is not modified.  
 Raised if UIndex < 1 or UIndex > NbUPoles or VIndex < 1 or  
 VIndex > NbVPoles.") SetPole;
		void SetPole (const Standard_Integer UIndex,const Standard_Integer VIndex,const gp_Pnt & P);
		%feature("autodoc", "Args:
	UIndex(Standard_Integer)
	VIndex(Standard_Integer)
	P(gp_Pnt)
	Weight(Standard_Real)

Returns:
	None

Substitutes the pole and the weight of range (UIndex, VIndex)  
 with P and W.  
 Raised if UIndex < 1 or UIndex > NbUPoles or VIndex < 1 or  
 VIndex > NbVPoles.  Raised if Weight <= Resolution from package gp.") SetPole;
		void SetPole (const Standard_Integer UIndex,const Standard_Integer VIndex,const gp_Pnt & P,const Standard_Real Weight);
		%feature("autodoc", "Args:
	VIndex(Standard_Integer)
	CPoles(TColgp_Array1OfPnt)

Returns:
	None

Changes a column of poles or a part of this column.  Raised if Vindex < 1 or VIndex > NbVPoles.  
 Raised if CPoles.Lower() < 1 or CPoles.Upper() > NbUPoles.") SetPoleCol;
		void SetPoleCol (const Standard_Integer VIndex,const TColgp_Array1OfPnt & CPoles);
		%feature("autodoc", "Args:
	VIndex(Standard_Integer)
	CPoles(TColgp_Array1OfPnt)
	CPoleWeights(TColStd_Array1OfReal)

Returns:
	None

Changes a column of poles or a part of this column with the  
 corresponding weights. If the surface was rational it can  
 become non rational. If the surface was non rational it can  
 become rational.  Raised if Vindex < 1 or VIndex > NbVPoles.  
 Raised if CPoles.Lower() < 1 or CPoles.Upper() > NbUPoles  
 Raised if the bounds of CPoleWeights are not the same as the  
 bounds of CPoles.  
 Raised if one of the weight value of CPoleWeights is lower or  
 equal to Resolution from package gp.") SetPoleCol;
		void SetPoleCol (const Standard_Integer VIndex,const TColgp_Array1OfPnt & CPoles,const TColStd_Array1OfReal & CPoleWeights);
		%feature("autodoc", "Args:
	UIndex(Standard_Integer)
	CPoles(TColgp_Array1OfPnt)
	CPoleWeights(TColStd_Array1OfReal)

Returns:
	None

Changes a row of poles or a part of this row with the  
 corresponding weights. If the surface was rational it can  
 become non rational. If the surface was non rational it can  
 become rational.  Raised if Uindex < 1 or UIndex > NbUPoles.  
 Raised if CPoles.Lower() < 1 or CPoles.Upper() > NbVPoles  
 raises if the bounds of CPoleWeights are not the same as the  
 bounds of CPoles.  
 Raised if one of the weight value of CPoleWeights is lower or  
 equal to Resolution from package gp.") SetPoleRow;
		void SetPoleRow (const Standard_Integer UIndex,const TColgp_Array1OfPnt & CPoles,const TColStd_Array1OfReal & CPoleWeights);
		%feature("autodoc", "Args:
	UIndex(Standard_Integer)
	CPoles(TColgp_Array1OfPnt)

Returns:
	None

Changes a row of poles or a part of this row.  Raised if Uindex < 1 or UIndex > NbUPoles.  
 Raised if CPoles.Lower() < 1 or CPoles.Upper() > NbVPoles.") SetPoleRow;
		void SetPoleRow (const Standard_Integer UIndex,const TColgp_Array1OfPnt & CPoles);
		%feature("autodoc", "Args:
	UIndex(Standard_Integer)
	VIndex(Standard_Integer)
	Weight(Standard_Real)

Returns:
	None

Changes the weight of the pole of range UIndex, VIndex.  
 If the surface was non rational it can become rational.  
 If the surface was rational it can become non rational.  
 Raised if UIndex < 1 or UIndex > NbUPoles or VIndex < 1 or  
 VIndex > NbVPoles  
 Raised if weight is lower or equal to Resolution from  
 package gp") SetWeight;
		void SetWeight (const Standard_Integer UIndex,const Standard_Integer VIndex,const Standard_Real Weight);
		%feature("autodoc", "Args:
	VIndex(Standard_Integer)
	CPoleWeights(TColStd_Array1OfReal)

Returns:
	None

Changes a column of weights of a part of this column.  
 Raised if VIndex < 1 or VIndex > NbVPoles  
 Raised if CPoleWeights.Lower() < 1 or  
           CPoleWeights.Upper() > NbUPoles.  
 Raised if a weight value is lower or equal to Resolution  
 from package gp.") SetWeightCol;
		void SetWeightCol (const Standard_Integer VIndex,const TColStd_Array1OfReal & CPoleWeights);
		%feature("autodoc", "Args:
	UIndex(Standard_Integer)
	CPoleWeights(TColStd_Array1OfReal)

Returns:
	None

Changes a row of weights or a part of this row.  
 Raised if UIndex < 1 or UIndex > NbUPoles  
 Raised if CPoleWeights.Lower() < 1 or  
           CPoleWeights.Upper() > NbVPoles.  
 Raised  if a weight value is lower or equal to Resolution  
 from package gp.") SetWeightRow;
		void SetWeightRow (const Standard_Integer UIndex,const TColStd_Array1OfReal & CPoleWeights);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	UIndex1(Standard_Integer)
	UIndex2(Standard_Integer)
	VIndex1(Standard_Integer)
	VIndex2(Standard_Integer)
	UFirstIndex(Standard_Integer)
	ULastIndex(Standard_Integer)
	VFirstIndex(Standard_Integer)
	VLastIndex(Standard_Integer)

Returns:
	None

Move a point with parameter U and V to P.  
         given u,v  as parameters)  to  reach a  new position  
         UIndex1, UIndex2, VIndex1, VIndex2:  
                 indicates the poles which can be moved  
         if Problem in BSplineBasis calculation, no change  
         for the curve and  
             UFirstIndex, VLastIndex = 0  
             VFirstIndex, VLastIndex = 0  
 Raised if UIndex1 < UIndex2 or VIndex1 < VIndex2 or  
           UIndex1 < 1 || UIndex1 > NbUPoles or  
           UIndex2 < 1 || UIndex2 > NbUPoles  
           VIndex1 < 1 || VIndex1 > NbVPoles or  
           VIndex2 < 1 || VIndex2 > NbVPoles  characteristics of the surface") MovePoint;
		void MovePoint (const Standard_Real U,const Standard_Real V,const gp_Pnt & P,const Standard_Integer UIndex1,const Standard_Integer UIndex2,const Standard_Integer VIndex1,const Standard_Integer VIndex2,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the first control points row and the last  
 control points row are identical. The tolerance criterion  
 is Resolution from package gp.") IsUClosed;
		Standard_Boolean IsUClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the first control points column and the  
 last last control points column are identical.  
 The tolerance criterion is Resolution from package gp.") IsVClosed;
		Standard_Boolean IsVClosed ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Boolean

Returns True if the order of continuity of the surface in the  
 U direction  is N.  Raised if N < 0.") IsCNu;
		Standard_Boolean IsCNu (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Boolean

Returns True if the order of continuity of the surface  
 in the V direction  is N.  Raised if N < 0.") IsCNv;
		Standard_Boolean IsCNv (const Standard_Integer N);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the surface is closed in the U direction  
 and if the B-spline has been turned into a periodic surface  
 using the function SetUPeriodic.") IsUPeriodic;
		Standard_Boolean IsUPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns False if for each row of weights all the weights  
 are identical.  
 The tolerance criterion is resolution from package gp.  
 Example :  
                |1.0, 1.0, 1.0|  
  if Weights =  |0.5, 0.5, 0.5|   returns False  
                |2.0, 2.0, 2.0|") IsURational;
		Standard_Boolean IsURational ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the surface is closed in the V direction  
 and if the B-spline has been turned into a periodic  
 surface using the function SetVPeriodic.") IsVPeriodic;
		Standard_Boolean IsVPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns False if for each column of weights all the weights  
 are identical.  
 The tolerance criterion is resolution from package gp.  
Examples :  
                |1.0, 2.0, 0.5|  
  if Weights =  |1.0, 2.0, 0.5|   returns False  
                |1.0, 2.0, 0.5|") IsVRational;
		Standard_Boolean IsVRational ();
		%feature("autodoc", "Args:
	UParameter(Standard_Real)
	VParameter(Standard_Real)

Returns:
	Standard_Boolean

Tells whether the Cache is valid for the  
          given parameter  
Warnings : the parameter must be normalized within  
the period if the curve is periodic. Otherwise  
the answer will be false") IsCacheValid;
		Standard_Boolean IsCacheValid (const Standard_Real UParameter,const Standard_Real VParameter);
		%feature("autodoc", "Args:
	U1(Standard_Real)
	U2(Standard_Real)
	V1(Standard_Real)
	V2(Standard_Real)

Returns:
	None

Returns the parametric bounds of the surface.  
Warnings :  
 These parametric values are the bounds of the array of  
 knots UKnots and VKnots only if the first knots and the  
 last knots have a multiplicity equal to UDegree + 1 or  
 VDegree + 1") Bounds;
		void Bounds (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_Shape

Returns the continuity of the surface :  
 C0 : only geometric continuity,  
 C1 : continuity of the first derivative all along the Surface,  
 C2 : continuity of the second derivative all along the Surface,  
 C3 : continuity of the third derivative all along the Surface,  
 CN : the order of continuity is infinite.  
 A B-spline surface is infinitely continuously differentiable  
 for the couple of parameters U, V such thats U != UKnots(i)  
 and V != VKnots(i). The continuity of the surface at a knot  
 value depends on the multiplicity of this knot.  
Example :  
 If the surface is C1 in the V direction and C2 in the U  
 direction this function returns Shape = C1.") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Computes the Index of the UKnots which gives the first  
 parametric value of the surface in the U direction.  
 The UIso curve corresponding to this value is a  
 boundary curve of the surface.") FirstUKnotIndex;
		Standard_Integer FirstUKnotIndex ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Computes the Index of the VKnots which gives the  
 first parametric value of the surface in the V direction.  
 The VIso curve corresponding to this knot is a boundary  
 curve of the surface.") FirstVKnotIndex;
		Standard_Integer FirstVKnotIndex ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Computes the Index of the UKnots which gives the  
 last parametric value of the surface in the U direction.  
 The UIso curve corresponding to this knot is a boundary  
 curve of the surface.") LastUKnotIndex;
		Standard_Integer LastUKnotIndex ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Computes the Index of the VKnots which gives the  
 last parametric value of the surface in the V direction.  
 The VIso curve corresponding to this knot is a  
 boundary curve of the surface.") LastVKnotIndex;
		Standard_Integer LastVKnotIndex ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of knots in the U direction.") NbUKnots;
		Standard_Integer NbUKnots ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns number of poles in the U direction.") NbUPoles;
		Standard_Integer NbUPoles ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of knots in the V direction.") NbVKnots;
		Standard_Integer NbVKnots ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of poles in the V direction.") NbVPoles;
		Standard_Integer NbVPoles ();
		%feature("autodoc", "Args:
	UIndex(Standard_Integer)
	VIndex(Standard_Integer)

Returns:
	gp_Pnt

Returns the pole of range (UIndex, VIndex).  
 Raised if UIndex < 1 or UIndex > NbUPoles or VIndex < 1 or  
 VIndex > NbVPoles.") Pole;
		gp_Pnt Pole (const Standard_Integer UIndex,const Standard_Integer VIndex);
		%feature("autodoc", "Args:
	P(TColgp_Array2OfPnt)

Returns:
	None

Returns the poles of the B-spline surface.  
 Raised if the length of P in the U and V direction  
 is not equal to NbUpoles and NbVPoles.") Poles;
		void Poles (TColgp_Array2OfPnt & P);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the degree of the normalized B-splines Ni,n in the U  
 direction.") UDegree;
		Standard_Integer UDegree ();
		%feature("autodoc", "Args:
	UIndex(Standard_Integer)

Returns:
	Standard_Real

Returns the Knot value of range UIndex.  Raised if UIndex < 1 or UIndex > NbUKnots") UKnot;
		Standard_Real UKnot (const Standard_Integer UIndex);
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_BSplKnotDistribution

Returns NonUniform or Uniform or QuasiUniform or  
 PiecewiseBezier.  If all the knots differ by a  
 positive constant from the preceding knot in the U  
 direction the B-spline surface can be :  
 - Uniform if all the knots are of multiplicity 1,  
 - QuasiUniform if all the knots are of multiplicity 1  
   except for the first and last knot which are of  
   multiplicity Degree + 1,  
 - PiecewiseBezier if the first and last knots have  
   multiplicity Degree + 1 and if interior knots have  
   multiplicity Degree  
 otherwise the surface is non uniform in the U direction  
 The tolerance criterion is Resolution from package gp.") UKnotDistribution;
		GeomAbs_BSplKnotDistribution UKnotDistribution ();
		%feature("autodoc", "Args:
	Ku(TColStd_Array1OfReal)

Returns:
	None

Returns the knots in the U direction.  
 Raised if the length of Ku is not equal to the number of knots  
 in the U direction.") UKnots;
		void UKnots (TColStd_Array1OfReal & Ku);
		%feature("autodoc", "Args:
	Ku(TColStd_Array1OfReal)

Returns:
	None

Returns the uknots sequence.  
 In this sequence the knots with a multiplicity greater than 1  
 are repeated.  
Example :  
 Ku = {k1, k1, k1, k2, k3, k3, k4, k4, k4}  
 Raised if the length of Ku is not equal to NbUPoles + UDegree + 1") UKnotSequence;
		void UKnotSequence (TColStd_Array1OfReal & Ku);
		%feature("autodoc", "Args:
	UIndex(Standard_Integer)

Returns:
	Standard_Integer

Returns the multiplicity value of knot of range UIndex in  
 the u direction.  Raised if UIndex < 1 or UIndex > NbUKnots.") UMultiplicity;
		Standard_Integer UMultiplicity (const Standard_Integer UIndex);
		%feature("autodoc", "Args:
	Mu(TColStd_Array1OfInteger)

Returns:
	None

Returns the multiplicities of the knots in the U direction.  
 Raised if the length of Mu is not equal to the number of  
 knots in the U direction.") UMultiplicities;
		void UMultiplicities (TColStd_Array1OfInteger & Mu);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the degree of the normalized B-splines Ni,d in the  
 V direction.") VDegree;
		Standard_Integer VDegree ();
		%feature("autodoc", "Args:
	VIndex(Standard_Integer)

Returns:
	Standard_Real

Returns the Knot value of range VIndex.") VKnot;
		Standard_Real VKnot (const Standard_Integer VIndex);
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_BSplKnotDistribution

Returns NonUniform or Uniform or QuasiUniform or  
 PiecewiseBezier. If all the knots differ by a positive  
 constant from the preceding knot in the V direction the  
 B-spline surface can be :  
 - Uniform if all the knots are of multiplicity 1,  
 - QuasiUniform if all the knots are of multiplicity 1  
   except for the first and last knot which are of  
   multiplicity Degree + 1,  
 - PiecewiseBezier if the first and last knots have  
   multiplicity  Degree + 1 and if interior knots have  
    multiplicity Degree  
 otherwise the surface is non uniform in the V direction.  
 The tolerance criterion is Resolution from package gp.") VKnotDistribution;
		GeomAbs_BSplKnotDistribution VKnotDistribution ();
		%feature("autodoc", "Args:
	Kv(TColStd_Array1OfReal)

Returns:
	None

Returns the knots in the V direction.  
 Raised if the length of Kv is not equal to the number of  
 knots in the V direction.") VKnots;
		void VKnots (TColStd_Array1OfReal & Kv);
		%feature("autodoc", "Args:
	Kv(TColStd_Array1OfReal)

Returns:
	None

Returns the vknots sequence.  
 In this sequence the knots with a multiplicity greater than 1  
 are repeated.  
Example :  
 Kv = {k1, k1, k1, k2, k3, k3, k4, k4, k4}  
 Raised if the length of Kv is not equal to NbVPoles + VDegree + 1") VKnotSequence;
		void VKnotSequence (TColStd_Array1OfReal & Kv);
		%feature("autodoc", "Args:
	VIndex(Standard_Integer)

Returns:
	Standard_Integer

Returns the multiplicity value of knot of range VIndex in  
 the v direction.  Raised if VIndex < 1 or VIndex > NbVKnots") VMultiplicity;
		Standard_Integer VMultiplicity (const Standard_Integer VIndex);
		%feature("autodoc", "Args:
	Mv(TColStd_Array1OfInteger)

Returns:
	None

Returns the multiplicities of the knots in the V direction.  
 Raised if the length of Mv is not equal to the number of  
 knots in the V direction.") VMultiplicities;
		void VMultiplicities (TColStd_Array1OfInteger & Mv);
		%feature("autodoc", "Args:
	UIndex(Standard_Integer)
	VIndex(Standard_Integer)

Returns:
	Standard_Real

Returns the weight value of range UIndex, VIndex.  
 Raised if UIndex < 1 or UIndex > NbUPoles or VIndex < 1  
 or VIndex > NbVPoles.") Weight;
		Standard_Real Weight (const Standard_Integer UIndex,const Standard_Integer VIndex);
		%feature("autodoc", "Args:
	W(TColStd_Array2OfReal)

Returns:
	None

Returns the weights of the B-spline surface.  
 Raised if the length of W in the U and V direction is  
 not equal to NbUPoles and NbVPoles.  value and derivatives computation") Weights;
		void Weights (TColStd_Array2OfReal & W);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") D0;
		void D0 (const Standard_Real U,const Standard_Real V,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)

Returns:
	None

Raised if the continuity of the surface is not C1.") D1;
		void D1 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	D2UV(gp_Vec)

Returns:
	None

Raised if the continuity of the surface is not C2.") D2;
		void D2 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	D2UV(gp_Vec)
	D3U(gp_Vec)
	D3V(gp_Vec)
	D3UUV(gp_Vec)
	D3UVV(gp_Vec)

Returns:
	None

Raised if the continuity of the surface is not C3.") D3;
		void D3 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV,gp_Vec & D3U,gp_Vec & D3V,gp_Vec & D3UUV,gp_Vec & D3UVV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Nu(Standard_Integer)
	Nv(Standard_Integer)

Returns:
	gp_Vec

Nu is the order of derivation in the U parametric direction and  
 Nv is the order of derivation in the V parametric direction.  
 Raised if the continuity of the surface is not CNu in the U  
 direction and CNv in the V direction.  
 Raised if Nu + Nv < 1 or Nu < 0 or Nv < 0.  
 The following functions computes the point for the  
 parametric values (U, V) and the derivatives at  
 this point on the B-spline surface patch delimited  
 with the knots FromUK1, FromVK1 and the knots ToUK2,  
 ToVK2.  (U, V) can be out of these parametric bounds  
 but for the computation we only use the definition  
 of the surface between these knots. This method is  
 useful to compute local derivative, if the order of  
 continuity of the whole surface is not greater enough.  
 Inside the parametric knot's domain previously defined  
 the evaluations are the same as if we consider the whole  
 definition of the surface. Of course the evaluations are  
 different outside this parametric domain.") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Real V,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	FromUK1(Standard_Integer)
	ToUK2(Standard_Integer)
	FromVK1(Standard_Integer)
	ToVK2(Standard_Integer)
	P(gp_Pnt)

Returns:
	None

Raised if FromUK1 = ToUK2 or FromVK1 = ToVK2.  
 Raised if FromUK1, ToUK2 are not in the range [FirstUKnotIndex,  
 LastUKnotIndex] or if FromVK1, ToVK2 are not in the range  
 [FirstVKnotIndex, LastVKnotIndex]") LocalD0;
		void LocalD0 (const Standard_Real U,const Standard_Real V,const Standard_Integer FromUK1,const Standard_Integer ToUK2,const Standard_Integer FromVK1,const Standard_Integer ToVK2,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	FromUK1(Standard_Integer)
	ToUK2(Standard_Integer)
	FromVK1(Standard_Integer)
	ToVK2(Standard_Integer)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)

Returns:
	None

Raised if the local continuity of the surface is not C1  
 between the knots FromUK1, ToUK2 and FromVK1, ToVK2.  Raised if FromUK1 = ToUK2 or FromVK1 = ToVK2.  
 Raised if FromUK1, ToUK2 are not in the range [FirstUKnotIndex,  
 LastUKnotIndex] or if FromVK1, ToVK2 are not in the range  
 [FirstVKnotIndex, LastVKnotIndex]") LocalD1;
		void LocalD1 (const Standard_Real U,const Standard_Real V,const Standard_Integer FromUK1,const Standard_Integer ToUK2,const Standard_Integer FromVK1,const Standard_Integer ToVK2,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	FromUK1(Standard_Integer)
	ToUK2(Standard_Integer)
	FromVK1(Standard_Integer)
	ToVK2(Standard_Integer)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	D2UV(gp_Vec)

Returns:
	None

Raised if the local continuity of the surface is not C2  
 between the knots FromUK1, ToUK2 and FromVK1, ToVK2.  Raised if FromUK1 = ToUK2 or FromVK1 = ToVK2.  
 Raised if FromUK1, ToUK2 are not in the range [FirstUKnotIndex,  
 LastUKnotIndex] or if FromVK1, ToVK2 are not in the range  
 [FirstVKnotIndex, LastVKnotIndex]") LocalD2;
		void LocalD2 (const Standard_Real U,const Standard_Real V,const Standard_Integer FromUK1,const Standard_Integer ToUK2,const Standard_Integer FromVK1,const Standard_Integer ToVK2,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	FromUK1(Standard_Integer)
	ToUK2(Standard_Integer)
	FromVK1(Standard_Integer)
	ToVK2(Standard_Integer)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	D2UV(gp_Vec)
	D3U(gp_Vec)
	D3V(gp_Vec)
	D3UUV(gp_Vec)
	D3UVV(gp_Vec)

Returns:
	None

Raised if the local continuity of the surface is not C3  
 between the knots FromUK1, ToUK2 and FromVK1, ToVK2.  Raised if FromUK1 = ToUK2 or FromVK1 = ToVK2.  
 Raised if FromUK1, ToUK2 are not in the range [FirstUKnotIndex,  
 LastUKnotIndex] or if FromVK1, ToVK2 are not in the range  
 [FirstVKnotIndex, LastVKnotIndex]") LocalD3;
		void LocalD3 (const Standard_Real U,const Standard_Real V,const Standard_Integer FromUK1,const Standard_Integer ToUK2,const Standard_Integer FromVK1,const Standard_Integer ToVK2,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV,gp_Vec & D3U,gp_Vec & D3V,gp_Vec & D3UUV,gp_Vec & D3UVV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	FromUK1(Standard_Integer)
	ToUK2(Standard_Integer)
	FromVK1(Standard_Integer)
	ToVK2(Standard_Integer)
	Nu(Standard_Integer)
	Nv(Standard_Integer)

Returns:
	gp_Vec

Raised if the local continuity of the surface is not CNu  
 between the knots FromUK1, ToUK2 and CNv between the knots  
 FromVK1, ToVK2.  Raised if FromUK1 = ToUK2 or FromVK1 = ToVK2.  
 Raised if FromUK1, ToUK2 are not in the range [FirstUKnotIndex,  
 LastUKnotIndex] or if FromVK1, ToVK2 are not in the range  
 [FirstVKnotIndex, LastVKnotIndex]") LocalDN;
		gp_Vec LocalDN (const Standard_Real U,const Standard_Real V,const Standard_Integer FromUK1,const Standard_Integer ToUK2,const Standard_Integer FromVK1,const Standard_Integer ToVK2,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	FromUK1(Standard_Integer)
	ToUK2(Standard_Integer)
	FromVK1(Standard_Integer)
	ToVK2(Standard_Integer)

Returns:
	gp_Pnt

Computes the point of parameter U, V on the BSpline surface patch  
 defines between the knots UK1 UK2, VK1, VK2. U can be out of the  
 bounds [Knot UK1, Knot UK2] and V can be outof the bounds  
 [Knot VK1, Knot VK2]  but for the computation we only use the  
 definition of the surface between these knot values.  Raises if FromUK1 = ToUK2 or FromVK1 = ToVK2.  
 Raises if FromUK1, ToUK2 are not in the range [FirstUKnotIndex,  
 LastUKnotIndex] or if FromVK1, ToVK2 are not in the range  
 [FirstVKnotIndex, LastVKnotIndex]") LocalValue;
		gp_Pnt LocalValue (const Standard_Real U,const Standard_Real V,const Standard_Integer FromUK1,const Standard_Integer ToUK2,const Standard_Integer FromVK1,const Standard_Integer ToVK2);
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Handle_Geom_Curve

Computes the U isoparametric curve.  
 A B-spline curve is returned.") UIso;
		Handle_Geom_Curve UIso (const Standard_Real U);
		%feature("autodoc", "Args:
	V(Standard_Real)

Returns:
	Handle_Geom_Curve

Computes the V isoparametric curve.  
 A B-spline curve is returned.") VIso;
		Handle_Geom_Curve VIso (const Standard_Real V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	CheckRational(Standard_Boolean)

Returns:
	Handle_Geom_Curve

Computes the U isoparametric curve.  
 If CheckRational=False, no try to make it non-rational.  
 A B-spline curve is returned.") UIso;
		Handle_Geom_Curve UIso (const Standard_Real U,const Standard_Boolean CheckRational);
		%feature("autodoc", "Args:
	V(Standard_Real)
	CheckRational(Standard_Boolean)

Returns:
	Handle_Geom_Curve

Computes the V isoparametric curve.  
 If CheckRational=False, no try to make it non-rational.  
 A B-spline curve is returned.  transformations") VIso;
		Handle_Geom_Curve VIso (const Standard_Real V,const Standard_Boolean CheckRational);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

Applies the transformation T to this BSpline surface.") Transform;
		void Transform (const gp_Trsf & T);
		%feature("autodoc", "Args:
	None
Returns:
	static Standard_Integer

Returns the value of the maximum degree of the normalized  
 B-spline basis functions in the u and v directions.") MaxDegree;
		static Standard_Integer MaxDegree ();
		%feature("autodoc", "Args:
	Tolerance3D(Standard_Real)
	UTolerance(Standard_Real)
	VTolerance(Standard_Real)

Returns:
	None

Computes two tolerance values for this BSpline  
surface, based on the given tolerance in 3D space  
Tolerance3D. The tolerances computed are:  
- UTolerance in the u parametric direction, and  
- VTolerance in the v parametric direction.  
If f(u,v) is the equation of this BSpline surface,  
UTolerance and VTolerance guarantee that :  
         | u1 - u0 | < UTolerance and  
         | v1 - v0 | < VTolerance  
         ====> |f (u1,v1) - f (u0,v0)| < Tolerance3D") Resolution;
		void Resolution (const Standard_Real Tolerance3D,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Geometry

Creates a new object which is a copy of this BSpline surface.") Copy;
		Handle_Geom_Geometry Copy ();
};


%feature("shadow") Geom_BSplineSurface::~Geom_BSplineSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom_BSplineSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Geom_BSplineSurface {
	Handle_Geom_BSplineSurface GetHandle() {
	return *(Handle_Geom_BSplineSurface*) &$self;
	}
};

%nodefaultctor Handle_Geom_BSplineSurface;
class Handle_Geom_BSplineSurface : public Handle_Geom_BoundedSurface {

    public:
        // constructors
        Handle_Geom_BSplineSurface();
        Handle_Geom_BSplineSurface(const Handle_Geom_BSplineSurface &aHandle);
        Handle_Geom_BSplineSurface(const Geom_BSplineSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Geom_BSplineSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Geom_BSplineSurface {
    Geom_BSplineSurface* GetObject() {
    return (Geom_BSplineSurface*)$self->Access();
    }
};
%feature("shadow") Handle_Geom_BSplineSurface::~Handle_Geom_BSplineSurface %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Geom_BSplineSurface {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Geom_BezierCurve;
class Geom_BezierCurve : public Geom_BoundedCurve {
	public:
		%feature("autodoc", "Args:
	CurvePoles(TColgp_Array1OfPnt)

Returns:
	None

Creates a non rational Bezier curve with a set of poles  
        CurvePoles.  The weights are defaulted to all being 1.  
        Raises ConstructionError if the number of poles is greater than MaxDegree + 1  
        or lower than 2.") Geom_BezierCurve;
		 Geom_BezierCurve (const TColgp_Array1OfPnt & CurvePoles);
		%feature("autodoc", "Args:
	CurvePoles(TColgp_Array1OfPnt)
	PoleWeights(TColStd_Array1OfReal)

Returns:
	None

Creates a rational Bezier curve with the set of poles  
 CurvePoles and the set of weights  PoleWeights .  
 If all the weights are identical the curve is considered  
 as non rational. Raises ConstructionError if  
 the number of poles is greater than  MaxDegree + 1 or lower  
 than 2 or CurvePoles and CurveWeights have not the same length  
 or one weight value is lower or equal to Resolution from package gp.") Geom_BezierCurve;
		 Geom_BezierCurve (const TColgp_Array1OfPnt & CurvePoles,const TColStd_Array1OfReal & PoleWeights);
		%feature("autodoc", "Args:
	Degree(Standard_Integer)

Returns:
	None

Increases the degree of a bezier curve. Degree is the new  
 degree of <self>. Raises ConstructionError  
   if Degree is greater than MaxDegree or lower than 2  
 or lower than the initial degree of <self>.") Increase;
		void Increase (const Standard_Integer Degree);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	P(gp_Pnt)

Returns:
	None

Inserts a pole P after the pole of range Index.  
 If the curve <self> is rational the weight value for the new  
 pole of range Index is 1.0.  raised if Index is not in the range [1, NbPoles]  
 raised if the resulting number of poles is greater than  
 MaxDegree + 1.") InsertPoleAfter;
		void InsertPoleAfter (const Standard_Integer Index,const gp_Pnt & P);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	P(gp_Pnt)
	Weight(Standard_Real)

Returns:
	None

Inserts a pole with its weight in the set of poles after the  
 pole of range Index. If the curve was non rational it can  
 become rational if all the weights are not identical.  Raised if Index is not in the range [1, NbPoles]  
 Raised if the resulting number of poles is greater than  
 MaxDegree + 1.  
 Raised if Weight is lower or equal to Resolution from package gp.") InsertPoleAfter;
		void InsertPoleAfter (const Standard_Integer Index,const gp_Pnt & P,const Standard_Real Weight);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	P(gp_Pnt)

Returns:
	None

Inserts a pole P before the pole of range Index.  
 If the curve <self> is rational the weight value for the new  
 pole of range Index is 1.0.  Raised if Index is not in the range [1, NbPoles]  
 Raised if the resulting number of poles is greater than  
 MaxDegree + 1.") InsertPoleBefore;
		void InsertPoleBefore (const Standard_Integer Index,const gp_Pnt & P);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	P(gp_Pnt)
	Weight(Standard_Real)

Returns:
	None

Inserts a pole with its weight in the set of poles after  
 the pole of range Index. If the curve was non rational it  
 can become rational if all the weights are not identical.  Raised if Index is not in the range [1, NbPoles]  
 Raised if the resulting number of poles is greater than  
 MaxDegree + 1.  
 Raised if Weight is lower or equal to Resolution from  
 package gp.") InsertPoleBefore;
		void InsertPoleBefore (const Standard_Integer Index,const gp_Pnt & P,const Standard_Real Weight);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

Removes the pole of range Index.  
 If the curve was rational it can become non rational.  Raised if Index is not in the range [1, NbPoles]  Raised if Degree is lower than 2.") RemovePole;
		void RemovePole (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	None

Reverses the direction of parametrization of <self>  
 Value (NewU) =  Value (1 - OldU)") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Standard_Real

Returns the  parameter on the  reversed  curve for  
         the point of parameter U on <self>.  
 
         returns 1-U") ReversedParameter;
		Standard_Real ReversedParameter (const Standard_Real U);
		%feature("autodoc", "Args:
	U1(Standard_Real)
	U2(Standard_Real)

Returns:
	None

Segments the curve between U1 and U2 which can be out  
 of the bounds of the curve. The curve is oriented from U1  
 to U2.  
 The control points are modified, the first and the last point  
 are not the same but the parametrization range is [0, 1]  
 else it could not be a Bezier curve.  
 Warnings :  
 Even if <self> is not closed it can become closed after the  
 segmentation for example if U1 or U2 are out of the bounds  
 of the curve <self> or if the curve makes loop.  
 After the segmentation the length of a curve can be null.") Segment;
		void Segment (const Standard_Real U1,const Standard_Real U2);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	P(gp_Pnt)

Returns:
	None

Substitutes the pole of range index with P.  
 If the curve <self> is rational the weight of range Index  
 is not modified.  raiseD if Index is not in the range [1, NbPoles]") SetPole;
		void SetPole (const Standard_Integer Index,const gp_Pnt & P);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	P(gp_Pnt)
	Weight(Standard_Real)

Returns:
	None

Substitutes the pole and the weights of range Index.  
 If the curve <self> is not rational it can become rational  
 if all the weights are not identical.  
 If the curve was rational it can become non rational if  
 all the weights are identical.  Raised if Index is not in the range [1, NbPoles]  Raised if Weight <= Resolution from package gp") SetPole;
		void SetPole (const Standard_Integer Index,const gp_Pnt & P,const Standard_Real Weight);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Weight(Standard_Real)

Returns:
	None

Changes the weight of the pole of range Index.  
 If the curve <self> is not rational it can become rational  
 if all the weights are not identical.  
 If the curve was rational it can become non rational if  
 all the weights are identical.  Raised if Index is not in the range [1, NbPoles]  Raised if Weight <= Resolution from package gp") SetWeight;
		void SetWeight (const Standard_Integer Index,const Standard_Real Weight);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the distance between the first point  
 and the last point of the curve is lower or equal to  
 the Resolution from package gp.") IsClosed;
		Standard_Boolean IsClosed ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Boolean

Continuity of the curve, returns True.") IsCN;
		Standard_Boolean IsCN (const Standard_Integer N);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the parametrization of a curve is periodic.  
 (P(u) = P(u + T) T = constante)") IsPeriodic;
		Standard_Boolean IsPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns false if all the weights are identical. The tolerance  
 criterion is Resolution from package gp.") IsRational;
		Standard_Boolean IsRational ();
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_Shape

a Bezier curve is CN") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the polynomial degree of the curve.  
 it is the number of poles - 1  point P and derivatives (V1, V2, V3) computation  
 The Bezier Curve has a Polynomial representation so the  
 parameter U can be out of the bounds of the curve.") Degree;
		Standard_Integer Degree ();
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") D0;
		void D0 (const Standard_Real U,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)

Returns:
	None

No detailed docstring for this function.") D1;
		void D1 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)

Returns:
	None

No detailed docstring for this function.") D2;
		void D2 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)
	V3(gp_Vec)

Returns:
	None

For this Bezier curve, computes  
- the point P of parameter U, or  
- the point P and one or more of the following values:  
  - V1, the first derivative vector,  
  - V2, the second derivative vector,  
  - V3, the third derivative vector.  
Note: the parameter U can be outside the bounds of the curve.") D3;
		void D3 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("autodoc", "Args:
	U(Standard_Real)
	N(Standard_Integer)

Returns:
	gp_Vec

For the point of parameter U of this Bezier curve,  
computes the vector corresponding to the Nth derivative.  
Note: the parameter U can be outside the bounds of the curve.  
Exceptions Standard_RangeError if N is less than 1.") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Integer N);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns Value (U=0.), it is the first control point of the curve.") StartPoint;
		gp_Pnt StartPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns Value (U=1.), it is the last control point of the Bezier curve.") EndPoint;
		gp_Pnt EndPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the value of the first  parameter of this  
Bezier curve. This is 0.0, which gives the start point of this Bezier curve") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the value of the last parameter of this  
Bezier curve. This is  1.0, which gives the end point of this Bezier curve.") LastParameter;
		Standard_Real LastParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of poles of this Bezier curve.") NbPoles;
		Standard_Integer NbPoles ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Pnt

Returns the pole of range Index.  Raised if Index is not in the range [1, NbPoles]") Pole;
		gp_Pnt Pole (const Standard_Integer Index);
		%feature("autodoc", "Args:
	P(TColgp_Array1OfPnt)

Returns:
	None

Returns all the poles of the curve.  
 Raised if the length of P is not equal to the number of poles.") Poles;
		void Poles (TColgp_Array1OfPnt & P);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

Returns the weight of range Index.  Raised if Index is not in the range [1, NbPoles]") Weight;
		Standard_Real Weight (const Standard_Integer Index);
		%feature("autodoc", "Args:
	W(TColStd_Array1OfReal)

Returns:
	None

Returns all the weights of the curve.  
 Raised if the length of W is not equal to the number of poles.") Weights;
		void Weights (TColStd_Array1OfReal & W);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

Applies the transformation T to this Bezier curve.") Transform;
		void Transform (const gp_Trsf & T);
		%feature("autodoc", "Args:
	None
Returns:
	static Standard_Integer

Returns the value of the maximum polynomial degree  
of any Geom_BezierCurve curve. This value is 25.") MaxDegree;
		static Standard_Integer MaxDegree ();
		%feature("autodoc", "Args:
	Tolerance3D(Standard_Real)
	UTolerance(Standard_Real)

Returns:
	None

Computes for this Bezier curve the parametric  
tolerance UTolerance for a given 3D tolerance Tolerance3D.  
If f(t) is the equation of this Bezier curve,  
UTolerance ensures that:  
|t1-t0| < UTolerance ===> |f(t1)-f(t0)| < Tolerance3D") Resolution;
		void Resolution (const Standard_Real Tolerance3D,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Geometry

Creates a new object which is a copy of this Bezier curve.") Copy;
		Handle_Geom_Geometry Copy ();
};


%feature("shadow") Geom_BezierCurve::~Geom_BezierCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom_BezierCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Geom_BezierCurve {
	Handle_Geom_BezierCurve GetHandle() {
	return *(Handle_Geom_BezierCurve*) &$self;
	}
};

%nodefaultctor Handle_Geom_BezierCurve;
class Handle_Geom_BezierCurve : public Handle_Geom_BoundedCurve {

    public:
        // constructors
        Handle_Geom_BezierCurve();
        Handle_Geom_BezierCurve(const Handle_Geom_BezierCurve &aHandle);
        Handle_Geom_BezierCurve(const Geom_BezierCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Geom_BezierCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Geom_BezierCurve {
    Geom_BezierCurve* GetObject() {
    return (Geom_BezierCurve*)$self->Access();
    }
};
%feature("shadow") Handle_Geom_BezierCurve::~Handle_Geom_BezierCurve %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Geom_BezierCurve {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Geom_BezierSurface;
class Geom_BezierSurface : public Geom_BoundedSurface {
	public:
		%feature("autodoc", "Args:
	SurfacePoles(TColgp_Array2OfPnt)

Returns:
	None

Creates a non-rational Bezier surface with a set of poles.  
 Control points representation :  
    SPoles(Uorigin,Vorigin) ...................SPoles(Uorigin,Vend)  
          .                                     .  
          .                                     .  
    SPoles(Uend, Vorigin) .....................SPoles(Uend, Vend)  
 For the double array the row indice corresponds to the parametric  
 U direction and the columns indice corresponds to the parametric  
 V direction.  
 The weights are defaulted to all being 1.  
 Raised if the number of poles of the surface is lower than 2  
 or greater than MaxDegree + 1 in one of the two directions  
 U or V.") Geom_BezierSurface;
		 Geom_BezierSurface (const TColgp_Array2OfPnt & SurfacePoles);
		%feature("autodoc", "Args:
	SurfacePoles(TColgp_Array2OfPnt)
	PoleWeights(TColStd_Array2OfReal)

Returns:
	None

//!---Purpose  
 Creates a rational Bezier surface with a set of poles and a  
 set of weights.  
 For the double array the row indice corresponds to the parametric  
 U direction and the columns indice corresponds to the parametric  
 V direction.  
 If all the weights are identical the surface is considered as  
 non-rational (the tolerance criterion is Resolution from package  
 gp).  
 Raised if SurfacePoles and PoleWeights have not the same  
 Rowlength or have not the same ColLength.  
 Raised if PoleWeights (i, j) <= Resolution from gp;  
 Raised if the number of poles of the surface is lower than 2  
 or greater than MaxDegree + 1 in one of the two directions U or V.") Geom_BezierSurface;
		 Geom_BezierSurface (const TColgp_Array2OfPnt & SurfacePoles,const TColStd_Array2OfReal & PoleWeights);
		%feature("autodoc", "Args:
	None
Returns:
	None

Exchanges the direction U and V on a Bezier surface  
As a consequence:  
- the poles and weights tables are transposed,  
- degrees, rational characteristics and so on are  
exchanged between the two parametric directions, and  
- the orientation of the surface is reversed.") ExchangeUV;
		void ExchangeUV ();
		%feature("autodoc", "Args:
	UDeg(Standard_Integer)
	VDeg(Standard_Integer)

Returns:
	None

Increases the degree of this Bezier surface in the two parametric directions.  
 Raised if UDegree < UDegree <self>  or VDegree < VDegree <self>  
 Raised if the degree of the surface is greater than MaxDegree  
 in one of the two directions U or V.") Increase;
		void Increase (const Standard_Integer UDeg,const Standard_Integer VDeg);
		%feature("autodoc", "Args:
	VIndex(Standard_Integer)
	CPoles(TColgp_Array1OfPnt)

Returns:
	None

Inserts a column of poles. If the surface is rational the weights  
 values associated with CPoles are equal defaulted to 1.  
 Raised if Vindex < 1 or VIndex > NbVPoles.  
 raises if VDegree is greater than MaxDegree.  
 raises if the Length of CPoles is not equal to NbUPoles") InsertPoleColAfter;
		void InsertPoleColAfter (const Standard_Integer VIndex,const TColgp_Array1OfPnt & CPoles);
		%feature("autodoc", "Args:
	VIndex(Standard_Integer)
	CPoles(TColgp_Array1OfPnt)
	CPoleWeights(TColStd_Array1OfReal)

Returns:
	None

Inserts a column of poles and weights.  
 If the surface was non-rational it can become rational.  
 Raised if Vindex < 1 or VIndex > NbVPoles.   Raised if  
 . VDegree is greater than MaxDegree.  
 . the Length of CPoles is not equal to NbUPoles  
 . a weight value is lower or equal to Resolution from  
   package gp") InsertPoleColAfter;
		void InsertPoleColAfter (const Standard_Integer VIndex,const TColgp_Array1OfPnt & CPoles,const TColStd_Array1OfReal & CPoleWeights);
		%feature("autodoc", "Args:
	VIndex(Standard_Integer)
	CPoles(TColgp_Array1OfPnt)

Returns:
	None

Inserts a column of poles. If the surface is rational the weights  
 values associated with CPoles are equal defaulted to 1.  
 Raised if Vindex < 1 or VIndex > NbVPoles.  
 Raised if VDegree is greater than MaxDegree.  
 Raised if the Length of CPoles is not equal to NbUPoles") InsertPoleColBefore;
		void InsertPoleColBefore (const Standard_Integer VIndex,const TColgp_Array1OfPnt & CPoles);
		%feature("autodoc", "Args:
	VIndex(Standard_Integer)
	CPoles(TColgp_Array1OfPnt)
	CPoleWeights(TColStd_Array1OfReal)

Returns:
	None

Inserts a column of poles and weights.  
 If the surface was non-rational it can become rational.  
 Raised if Vindex < 1 or VIndex > NbVPoles.   Raised if :  
 . VDegree is greater than MaxDegree.  
 . the Length of CPoles is not equal to NbUPoles  
 . a weight value is lower or equal to Resolution from  
   package gp") InsertPoleColBefore;
		void InsertPoleColBefore (const Standard_Integer VIndex,const TColgp_Array1OfPnt & CPoles,const TColStd_Array1OfReal & CPoleWeights);
		%feature("autodoc", "Args:
	UIndex(Standard_Integer)
	CPoles(TColgp_Array1OfPnt)

Returns:
	None

Inserts a row of poles. If the surface is rational the weights  
 values associated with CPoles are equal defaulted to 1.  
 Raised if Uindex < 1 or UIndex > NbUPoles.  
 Raised if UDegree is greater than MaxDegree.  
 Raised if the Length of CPoles is not equal to NbVPoles") InsertPoleRowAfter;
		void InsertPoleRowAfter (const Standard_Integer UIndex,const TColgp_Array1OfPnt & CPoles);
		%feature("autodoc", "Args:
	UIndex(Standard_Integer)
	CPoles(TColgp_Array1OfPnt)
	CPoleWeights(TColStd_Array1OfReal)

Returns:
	None

Inserts a row of poles and weights.  
 If the surface was non-rational it can become rational.  
 Raised if Uindex < 1 or UIndex > NbUPoles.   Raised if :  
 . UDegree is greater than MaxDegree.  
 . the Length of CPoles is not equal to NbVPoles  
 . a weight value is lower or equal to Resolution from  
   package gp") InsertPoleRowAfter;
		void InsertPoleRowAfter (const Standard_Integer UIndex,const TColgp_Array1OfPnt & CPoles,const TColStd_Array1OfReal & CPoleWeights);
		%feature("autodoc", "Args:
	UIndex(Standard_Integer)
	CPoles(TColgp_Array1OfPnt)

Returns:
	None

Inserts a row of poles. If the surface is rational the weights  
 values associated with CPoles are equal defaulted to 1.  
 Raised if Uindex < 1 or UIndex > NbUPoles.  
 Raised if UDegree is greater than MaxDegree.  
 Raised if the Length of CPoles is not equal to NbVPoles") InsertPoleRowBefore;
		void InsertPoleRowBefore (const Standard_Integer UIndex,const TColgp_Array1OfPnt & CPoles);
		%feature("autodoc", "Args:
	UIndex(Standard_Integer)
	CPoles(TColgp_Array1OfPnt)
	CPoleWeights(TColStd_Array1OfReal)

Returns:
	None

Inserts a row of poles and weights.  
 If the surface was non-rational it can become rational.  
 Raised if Uindex < 1 or UIndex > NbUPoles.   Raised if :  
 . UDegree is greater than MaxDegree.  
 . the Length of CPoles is not equal to NbVPoles  
 . a weight value is lower or equal to Resolution from  
   pacakage gp") InsertPoleRowBefore;
		void InsertPoleRowBefore (const Standard_Integer UIndex,const TColgp_Array1OfPnt & CPoles,const TColStd_Array1OfReal & CPoleWeights);
		%feature("autodoc", "Args:
	VIndex(Standard_Integer)

Returns:
	None

Removes a column of poles.  
 If the surface was rational it can become non-rational.  
 Raised if NbVPoles <= 2 after removing, a Bezier surface  
 must have at least two columns of poles.  Raised if Vindex < 1 or VIndex > NbVPoles") RemovePoleCol;
		void RemovePoleCol (const Standard_Integer VIndex);
		%feature("autodoc", "Args:
	UIndex(Standard_Integer)

Returns:
	None

Removes a row of poles.  
 If the surface was rational it can become non-rational.  
 Raised if NbUPoles <= 2 after removing, a Bezier surface  
 must have at least two rows of poles.  Raised if Uindex < 1 or UIndex > NbUPoles") RemovePoleRow;
		void RemovePoleRow (const Standard_Integer UIndex);
		%feature("autodoc", "Args:
	U1(Standard_Real)
	U2(Standard_Real)
	V1(Standard_Real)
	V2(Standard_Real)

Returns:
	None

Modifies this Bezier surface by segmenting it  
between U1 and U2 in the u parametric direction,  
and between V1 and V2 in the v parametric  
direction. U1, U2, V1, and V2 can be outside the  
bounds of this surface.  
- U1 and U2 isoparametric Bezier curves,  
segmented between V1 and V2, become the two  
bounds of the surface in the v parametric  
direction (0. and 1. u isoparametric curves).  
- V1 and V2 isoparametric Bezier curves,  
segmented between U1 and U2, become the two  
bounds of the surface in the u parametric  
direction (0. and 1. v isoparametric curves).  
The poles and weights tables are modified, but the  
degree of this surface in the u and v parametric  
directions does not change.  
U1 can be greater than U2, and V1 can be greater  
than V2. In these cases, the corresponding  
parametric direction is inverted. The orientation of  
the surface is inverted if one (and only one)  
parametric direction is inverted.") Segment;
		void Segment (const Standard_Real U1,const Standard_Real U2,const Standard_Real V1,const Standard_Real V2);
		%feature("autodoc", "Args:
	UIndex(Standard_Integer)
	VIndex(Standard_Integer)
	P(gp_Pnt)

Returns:
	None

Modifies a pole value.  
 If the surface is rational the weight of range (UIndex, VIndex)  
 is not modified.  
 Raised if  UIndex < 1 or UIndex > NbUPoles  or  VIndex < 1  
 or VIndex > NbVPoles.") SetPole;
		void SetPole (const Standard_Integer UIndex,const Standard_Integer VIndex,const gp_Pnt & P);
		%feature("autodoc", "Args:
	UIndex(Standard_Integer)
	VIndex(Standard_Integer)
	P(gp_Pnt)
	Weight(Standard_Real)

Returns:
	None

Substitutes the pole and the weight of range UIndex, VIndex.  
 If the surface <self> is not rational it can become rational.  
 if the surface was rational it can become non-rational.  
 raises if  UIndex < 1 or UIndex > NbUPoles  or  VIndex < 1  
 or VIndex > NbVPoles.  Raised if Weight <= Resolution from package gp.") SetPole;
		void SetPole (const Standard_Integer UIndex,const Standard_Integer VIndex,const gp_Pnt & P,const Standard_Real Weight);
		%feature("autodoc", "Args:
	VIndex(Standard_Integer)
	CPoles(TColgp_Array1OfPnt)

Returns:
	None

Modifies a column of poles.  
 The length of CPoles can be lower but not greater than NbUPoles  
 so you can modify just a part of the column.   Raised if VIndex < 1 or  VIndex > NbVPoles  
 Raised if CPoles.Lower() < 1 or CPoles.Upper() > NbUPoles") SetPoleCol;
		void SetPoleCol (const Standard_Integer VIndex,const TColgp_Array1OfPnt & CPoles);
		%feature("autodoc", "Args:
	VIndex(Standard_Integer)
	CPoles(TColgp_Array1OfPnt)
	CPoleWeights(TColStd_Array1OfReal)

Returns:
	None

Modifies a column of poles.  
 If the surface was rational it can become non-rational  
 If the surface was non-rational it can become rational.  
 The length of CPoles can be lower but not greater than NbUPoles  
 so you can modify just a part of the column.   Raised if VIndex < 1 or  VIndex > NbVPoles  
 Raised if CPoles.Lower() < 1 or CPoles.Upper() > NbUPoles  
 Raised if CPoleWeights and CPoles have not the same bounds.  
 Raised if one of the weight value CPoleWeights (i) is lower  
 or equal to Resolution from package gp.") SetPoleCol;
		void SetPoleCol (const Standard_Integer VIndex,const TColgp_Array1OfPnt & CPoles,const TColStd_Array1OfReal & CPoleWeights);
		%feature("autodoc", "Args:
	UIndex(Standard_Integer)
	CPoles(TColgp_Array1OfPnt)

Returns:
	None

Modifies a row of poles.  
 The length of CPoles can be lower but not greater than NbVPoles  
 so you can modify just a part of the row.   Raised if UIndex < 1 or  UIndex > NbUPoles  
 Raised if CPoles.Lower() < 1 or CPoles.Upper() > NbVPoles") SetPoleRow;
		void SetPoleRow (const Standard_Integer UIndex,const TColgp_Array1OfPnt & CPoles);
		%feature("autodoc", "Args:
	UIndex(Standard_Integer)
	CPoles(TColgp_Array1OfPnt)
	CPoleWeights(TColStd_Array1OfReal)

Returns:
	None

Modifies a row of poles and weights.  
 If the surface was rational it can become non-rational.  
 If the surface was non-rational it can become rational.  
 The length of CPoles can be lower but not greater than NbVPoles  
 so you can modify just a part of the row.   Raised if UIndex < 1 or  UIndex > NbUPoles  
 Raised if CPoles.Lower() < 1 or CPoles.Upper() > NbVPoles  
 Raised if CPoleWeights and CPoles have not the same bounds.  
 Raised if one of the weight value CPoleWeights (i) is lower  
 or equal to Resolution from gp.") SetPoleRow;
		void SetPoleRow (const Standard_Integer UIndex,const TColgp_Array1OfPnt & CPoles,const TColStd_Array1OfReal & CPoleWeights);
		%feature("autodoc", "Args:
	UIndex(Standard_Integer)
	VIndex(Standard_Integer)
	Weight(Standard_Real)

Returns:
	None

Modifies the weight of the pole of range UIndex, VIndex.  
 If the surface was non-rational it can become rational.  
 If the surface was rational it can become non-rational.  
 Raised if UIndex < 1  or  UIndex > NbUPoles or VIndex < 1 or  
 VIndex > NbVPoles.  Raised if Weight <= Resolution from package gp.") SetWeight;
		void SetWeight (const Standard_Integer UIndex,const Standard_Integer VIndex,const Standard_Real Weight);
		%feature("autodoc", "Args:
	VIndex(Standard_Integer)
	CPoleWeights(TColStd_Array1OfReal)

Returns:
	None

Modifies a column of weights.  
 If the surface was rational it can become non-rational.  
 If the surface was non-rational it can become rational.  
 The length of CPoleWeights can be lower but not greater than  
 NbUPoles.   Raised if VIndex < 1 or  VIndex > NbVPoles  
 Raised if CPoleWeights.Lower() < 1 or CPoleWeights.Upper() >  
 NbUPoles  
 Raised if one of the weight value CPoleWeights (i) is lower  
 or equal to Resolution from package gp.") SetWeightCol;
		void SetWeightCol (const Standard_Integer VIndex,const TColStd_Array1OfReal & CPoleWeights);
		%feature("autodoc", "Args:
	UIndex(Standard_Integer)
	CPoleWeights(TColStd_Array1OfReal)

Returns:
	None

Modifies a row of weights.  
 If the surface was rational it can become non-rational.  
 If the surface was non-rational it can become rational.  
 The length of CPoleWeights can be lower but not greater than  
 NbVPoles.   Raised if UIndex < 1 or  UIndex > NbUPoles  
 Raised if CPoleWeights.Lower() < 1 or CPoleWeights.Upper() >  
 NbVPoles  
 Raised if one of the weight value CPoleWeights (i) is lower  
 or equal to Resolution from package gp.") SetWeightRow;
		void SetWeightRow (const Standard_Integer UIndex,const TColStd_Array1OfReal & CPoleWeights);
		%feature("autodoc", "Args:
	None
Returns:
	None

Changes the orientation of this Bezier surface in the  
u  parametric direction. The bounds of the  
surface are not changed, but the given parametric  
direction is reversed. Hence, the orientation of the surface is reversed.") UReverse;
		void UReverse ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Standard_Real

Computes the u (or v) parameter on the modified  
surface, produced by reversing its u (or v) parametric  
direction, for any point of u parameter U (or of v  
parameter V) on this Bezier surface.  
In the case of a Bezier surface, these functions return respectively:  
- 1.-U, or 1.-V.") UReversedParameter;
		Standard_Real UReversedParameter (const Standard_Real U);
		%feature("autodoc", "Args:
	None
Returns:
	None

Changes the orientation of this Bezier surface in the  
v parametric direction. The bounds of the  
surface are not changed, but the given parametric  
direction is reversed. Hence, the orientation of the  
surface is reversed.") VReverse;
		void VReverse ();
		%feature("autodoc", "Args:
	V(Standard_Real)

Returns:
	Standard_Real

Computes the u (or v) parameter on the modified  
surface, produced by reversing its u (or v) parametric  
direction, for any point of u parameter U (or of v  
parameter V) on this Bezier surface.  
In the case of a Bezier surface, these functions return respectively:  
- 1.-U, or 1.-V.") VReversedParameter;
		Standard_Real VReversedParameter (const Standard_Real V);
		%feature("autodoc", "Args:
	U1(Standard_Real)
	U2(Standard_Real)
	V1(Standard_Real)
	V2(Standard_Real)

Returns:
	None

Returns the parametric bounds U1, U2, V1 and V2 of  
this Bezier surface.  
In the case of a Bezier surface, this function returns  
       U1 = 0, V1 = 0, U2 = 1, V2 = 1.") Bounds;
		void Bounds (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_Shape

Returns the continuity of the surface CN : the order of  
 continuity is infinite.") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") D0;
		void D0 (const Standard_Real U,const Standard_Real V,gp_Pnt & P);
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
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	D2UV(gp_Vec)

Returns:
	None

No detailed docstring for this function.") D2;
		void D2 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	D2UV(gp_Vec)
	D3U(gp_Vec)
	D3V(gp_Vec)
	D3UUV(gp_Vec)
	D3UVV(gp_Vec)

Returns:
	None

Computes P, the point of parameters (U, V) of this Bezier surface, and  
- one or more of the following sets of vectors:  
- D1U and D1V, the first derivative vectors at this point,  
  - D2U, D2V and D2UV, the second derivative  
   vectors at this point,  
  - D3U, D3V, D3UUV and D3UVV, the third  
   derivative vectors at this point.  
Note: The parameters U and V can be outside the bounds of the surface.") D3;
		void D3 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV,gp_Vec & D3U,gp_Vec & D3V,gp_Vec & D3UUV,gp_Vec & D3UVV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Nu(Standard_Integer)
	Nv(Standard_Integer)

Returns:
	gp_Vec

Computes the derivative of order Nu in the u  
 parametric direction, and Nv in the v parametric  
direction, at the point of parameters (U, V) of this Bezier surface.  
Note: The parameters U and V can be outside the bounds of the surface.  
Exceptions  
Standard_RangeError if:  
- Nu + Nv is less than 1, or Nu or Nv is negative.") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Real V,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of poles in the U direction.") NbUPoles;
		Standard_Integer NbUPoles ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of poles in the V direction.") NbVPoles;
		Standard_Integer NbVPoles ();
		%feature("autodoc", "Args:
	UIndex(Standard_Integer)
	VIndex(Standard_Integer)

Returns:
	gp_Pnt

Returns the pole of range UIndex, VIndex  Raised if UIndex < 1 or UIndex > NbUPoles, or  
 VIndex < 1 or VIndex > NbVPoles.") Pole;
		gp_Pnt Pole (const Standard_Integer UIndex,const Standard_Integer VIndex);
		%feature("autodoc", "Args:
	P(TColgp_Array2OfPnt)

Returns:
	None

Returns the poles of the Bezier surface.  
 Raised if the length of P in the U an V direction is not equal to  
 NbUPoles and NbVPoles.") Poles;
		void Poles (TColgp_Array2OfPnt & P);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the degree of the surface in the U direction it is  
 NbUPoles - 1") UDegree;
		Standard_Integer UDegree ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Handle_Geom_Curve

Computes the U isoparametric curve. For a Bezier surface the  
 UIso curve is a Bezier curve.") UIso;
		Handle_Geom_Curve UIso (const Standard_Real U);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the degree of the surface in the V direction it is  
 NbVPoles - 1") VDegree;
		Standard_Integer VDegree ();
		%feature("autodoc", "Args:
	V(Standard_Real)

Returns:
	Handle_Geom_Curve

Computes the V isoparametric curve. For a Bezier surface the  
 VIso  curve is a Bezier curve.") VIso;
		Handle_Geom_Curve VIso (const Standard_Real V);
		%feature("autodoc", "Args:
	UIndex(Standard_Integer)
	VIndex(Standard_Integer)

Returns:
	Standard_Real

Returns the weight of range UIndex, VIndex  
 Raised if UIndex < 1 or UIndex > NbUPoles, or  
           VIndex < 1 or VIndex > NbVPoles.") Weight;
		Standard_Real Weight (const Standard_Integer UIndex,const Standard_Integer VIndex);
		%feature("autodoc", "Args:
	W(TColStd_Array2OfReal)

Returns:
	None

Returns the weights of the Bezier surface.  
 Raised if the length of W in the U an V direction is not  
 equal to NbUPoles and NbVPoles.") Weights;
		void Weights (TColStd_Array2OfReal & W);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the first control points row and the  
 last control points row are identical. The tolerance  
 criterion is Resolution from package gp.") IsUClosed;
		Standard_Boolean IsUClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the first control points column  
 and the last control points column are identical.  
 The tolerance criterion is Resolution from package gp.") IsVClosed;
		Standard_Boolean IsVClosed ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Boolean

Returns True, a Bezier surface is always  CN") IsCNu;
		Standard_Boolean IsCNu (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Boolean

Returns True, a BezierSurface is always  CN") IsCNv;
		Standard_Boolean IsCNv (const Standard_Integer N);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns False.") IsUPeriodic;
		Standard_Boolean IsUPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns False.") IsVPeriodic;
		Standard_Boolean IsVPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns False if the weights are identical in the U direction,  
 The tolerance criterion is Resolution from package gp.  
Example :  
                |1.0, 1.0, 1.0|  
  if Weights =  |0.5, 0.5, 0.5|   returns False  
                |2.0, 2.0, 2.0|") IsURational;
		Standard_Boolean IsURational ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns False if the weights are identical in the V direction,  
 The tolerance criterion is Resolution from package gp.  
Example :  
                |1.0, 2.0, 0.5|  
  if Weights =  |1.0, 2.0, 0.5|   returns False  
                |1.0, 2.0, 0.5|") IsVRational;
		Standard_Boolean IsVRational ();
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

Applies the transformation T to this Bezier surface.") Transform;
		void Transform (const gp_Trsf & T);
		%feature("autodoc", "Args:
	None
Returns:
	static Standard_Integer

Returns the value of the maximum polynomial degree of a  
 Bezier surface. This value is 25.") MaxDegree;
		static Standard_Integer MaxDegree ();
		%feature("autodoc", "Args:
	Tolerance3D(Standard_Real)
	UTolerance(Standard_Real)
	VTolerance(Standard_Real)

Returns:
	None

Computes two tolerance values for this Bezier  
surface, based on the given tolerance in 3D space  
Tolerance3D. The tolerances computed are:  
- UTolerance in the u parametric direction, and  
- VTolerance in the v parametric direction.  
If f(u,v) is the equation of this Bezier surface,  
UTolerance and VTolerance guarantee that:  
         | u1 - u0 | < UTolerance and  
         | v1 - v0 | < VTolerance  
         ====> |f (u1,v1) - f (u0,v0)| < Tolerance3D") Resolution;
		void Resolution (const Standard_Real Tolerance3D,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Geometry

Creates a new object which is a copy of this Bezier surface.") Copy;
		Handle_Geom_Geometry Copy ();
};


%feature("shadow") Geom_BezierSurface::~Geom_BezierSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom_BezierSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Geom_BezierSurface {
	Handle_Geom_BezierSurface GetHandle() {
	return *(Handle_Geom_BezierSurface*) &$self;
	}
};

%nodefaultctor Handle_Geom_BezierSurface;
class Handle_Geom_BezierSurface : public Handle_Geom_BoundedSurface {

    public:
        // constructors
        Handle_Geom_BezierSurface();
        Handle_Geom_BezierSurface(const Handle_Geom_BezierSurface &aHandle);
        Handle_Geom_BezierSurface(const Geom_BezierSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Geom_BezierSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Geom_BezierSurface {
    Geom_BezierSurface* GetObject() {
    return (Geom_BezierSurface*)$self->Access();
    }
};
%feature("shadow") Handle_Geom_BezierSurface::~Handle_Geom_BezierSurface %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Geom_BezierSurface {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Geom_Circle;
class Geom_Circle : public Geom_Conic {
	public:
		%feature("autodoc", "Args:
	C(gp_Circ)

Returns:
	None

Constructs a circle by conversion of the gp_Circ circle C.") Geom_Circle;
		 Geom_Circle (const gp_Circ & C);
		%feature("autodoc", "Args:
	A2(gp_Ax2)
	Radius(Standard_Real)

Returns:
	None

Constructs a circle of radius Radius, where A2 locates the circle and  
  defines its orientation in 3D space such that:  
  - the center of the circle is the origin of A2,  
  - the origin, 'X Direction' and 'Y Direction' of A2  
   define the plane of the circle,  
  - A2 is the local coordinate system of the circle.  
 Note: It is possible to create a circle where Radius is equal to 0.0.  raised if Radius < 0.") Geom_Circle;
		 Geom_Circle (const gp_Ax2 & A2,const Standard_Real Radius);
		%feature("autodoc", "Args:
	C(gp_Circ)

Returns:
	None

Set <self> so that <self> has the same geometric properties as C.") SetCirc;
		void SetCirc (const gp_Circ & C);
		%feature("autodoc", "Args:
	R(Standard_Real)

Returns:
	None

Assigns the value R to the radius of this circle.  
Note: it is possible to have a circle with a radius equal to 0.0.  
Exceptions - Standard_ConstructionError if R is negative.") SetRadius;
		void SetRadius (const Standard_Real R);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Circ

returns the non transient circle from gp with the same  
 geometric properties as <self>.") Circ;
		gp_Circ Circ ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the radius of this circle.") Radius;
		Standard_Real Radius ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Standard_Real

Computes the parameter on the reversed circle for  
the point of parameter U on this circle.  
For a circle, the returned value is: 2.*Pi - U.") ReversedParameter;
		Standard_Real ReversedParameter (const Standard_Real U);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the eccentricity  e = 0 for a circle.") Eccentricity;
		Standard_Real Eccentricity ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the value of the first parameter of this  
circle. This is  0.0, which gives the start point of this circle, or  
 The start point and end point of a circle are coincident.") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the value of the last parameter of this  
circle. This is 2.*Pi, which gives the end point of this circle.  
The start point and end point of a circle are coincident.") LastParameter;
		Standard_Real LastParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns True.") IsClosed;
		Standard_Boolean IsClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns True.") IsPeriodic;
		Standard_Boolean IsPeriodic ();
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)

Returns:
	None

Returns in P the point of parameter U.  
 P = C + R * Cos (U) * XDir + R * Sin (U) * YDir  
 where C is the center of the circle , XDir the XDirection and  
 YDir the YDirection of the circle's local coordinate system.") D0;
		void D0 (const Standard_Real U,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)

Returns:
	None

Returns the point P of parameter U and the first derivative V1.") D1;
		void D1 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)

Returns:
	None

Returns the point P of parameter U, the first and second  
 derivatives V1 and V2.") D2;
		void D2 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)
	V3(gp_Vec)

Returns:
	None

Returns the point P of parameter u, the first second and third  
 derivatives V1 V2 and V3.") D3;
		void D3 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("autodoc", "Args:
	U(Standard_Real)
	N(Standard_Integer)

Returns:
	gp_Vec

The returned vector gives the value of the derivative for the  
 order of derivation N.  Raised if N < 1.") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Integer N);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

Applies the transformation T to this circle.") Transform;
		void Transform (const gp_Trsf & T);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Geometry

Creates a new object which is a copy of this circle.") Copy;
		Handle_Geom_Geometry Copy ();
};


%feature("shadow") Geom_Circle::~Geom_Circle %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom_Circle {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Geom_Circle {
	Handle_Geom_Circle GetHandle() {
	return *(Handle_Geom_Circle*) &$self;
	}
};

%nodefaultctor Handle_Geom_Circle;
class Handle_Geom_Circle : public Handle_Geom_Conic {

    public:
        // constructors
        Handle_Geom_Circle();
        Handle_Geom_Circle(const Handle_Geom_Circle &aHandle);
        Handle_Geom_Circle(const Geom_Circle *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Geom_Circle DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Geom_Circle {
    Geom_Circle* GetObject() {
    return (Geom_Circle*)$self->Access();
    }
};
%feature("shadow") Handle_Geom_Circle::~Handle_Geom_Circle %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Geom_Circle {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Geom_ConicalSurface;
class Geom_ConicalSurface : public Geom_ElementarySurface {
	public:
		%feature("autodoc", "Args:
	A3(gp_Ax3)
	Ang(Standard_Real)
	Radius(Standard_Real)

Returns:
	None

A3 defines the local coordinate system of the conical surface.  
 Ang is the conical surface semi-angle ]0, PI/2[.  
 Radius is the radius of the circle Viso in the placement plane  
 of the conical surface defined with 'XAxis' and 'YAxis'.  
 The 'ZDirection' of A3 defines the direction of the surface's  
 axis of symmetry.  
 If the location point of A3 is the apex of the surface  
 Radius = 0 .  
 At the creation the parametrization of the surface is defined  
 such that the normal Vector (N = D1U ^ D1V) is oriented towards  
 the 'outside region' of the surface.  
 Raised if Radius < 0.0 or Ang < Resolution from gp or  
 Ang >= PI/2 - Resolution") Geom_ConicalSurface;
		 Geom_ConicalSurface (const gp_Ax3 & A3,const Standard_Real Ang,const Standard_Real Radius);
		%feature("autodoc", "Args:
	C(gp_Cone)

Returns:
	None

Creates a ConicalSurface from a non transient Cone from  
 package gp.") Geom_ConicalSurface;
		 Geom_ConicalSurface (const gp_Cone & C);
		%feature("autodoc", "Args:
	C(gp_Cone)

Returns:
	None

Set <self> so that <self> has the same geometric properties as C.") SetCone;
		void SetCone (const gp_Cone & C);
		%feature("autodoc", "Args:
	R(Standard_Real)

Returns:
	None

Changes the radius of the conical surface in the placement  
 plane (Z = 0, V = 0).  The local coordinate system is not  
 modified.  Raised if R < 0.0") SetRadius;
		void SetRadius (const Standard_Real R);
		%feature("autodoc", "Args:
	Ang(Standard_Real)

Returns:
	None

Changes the semi angle of the conical surface.  
 Raised if Ang < Resolution or Ang >= PI/2 - Resolution") SetSemiAngle;
		void SetSemiAngle (const Standard_Real Ang);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Cone

returns a non transient cone with the same geometric properties  
 as <self>.") Cone;
		gp_Cone Cone ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Standard_Real

return 2.PI - U.") UReversedParameter;
		Standard_Real UReversedParameter (const Standard_Real U);
		%feature("autodoc", "Args:
	V(Standard_Real)

Returns:
	Standard_Real

Computes the u (or v) parameter on the modified  
surface, when reversing its u (or v) parametric  
direction, for any point of u parameter U (or of v  
parameter V) on this cone.  
In the case of a cone, these functions return respectively:  
- 2.*Pi - U, -V.") VReversedParameter;
		Standard_Real VReversedParameter (const Standard_Real V);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Changes the orientation of this cone in the v  
parametric direction. The bounds of the surface are  
not changed but the v parametric direction is reversed.  
As a consequence, for a cone:  
- the 'main Direction' of the local coordinate system  
  is reversed, and  
- the half-angle at the apex is inverted.") VReverse;
		virtual void VReverse ();
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	T(gp_Trsf)

Returns:
	virtual void

Computes the  parameters on the  transformed  surface for  
         the transform of the point of parameters U,V on <self>.  
 
         me->Transformed(T)->Value(U',V')  
 
         is the same point as  
 
         me->Value(U,V).Transformed(T)  
 
         Where U',V' are the new values of U,V after calling  
 
         me->TranformParameters(U,V,T)  
 
         This methods multiplies V by T.ScaleFactor()") TransformParameters;
		virtual void TransformParameters (Standard_Real &OutValue,Standard_Real &OutValue,const gp_Trsf & T);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	virtual gp_GTrsf2d

Returns a 2d transformation  used to find the  new  
         parameters of a point on the transformed surface.  
 
         me->Transformed(T)->Value(U',V')  
 
         is the same point as  
 
         me->Value(U,V).Transformed(T)  
 
         Where U',V' are  obtained by transforming U,V with  
         th 2d transformation returned by  
 
         me->ParametricTransformation(T)  
 
         This  methods  returns  a scale  centered  on  the  
         U axis with T.ScaleFactor") ParametricTransformation;
		virtual gp_GTrsf2d ParametricTransformation (const gp_Trsf & T);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Computes the apex of this cone. It is on the negative  
side of the axis of revolution of this cone if the  
half-angle at the apex is positive, and on the positive  
side of the 'main Axis' if the half-angle is negative.") Apex;
		gp_Pnt Apex ();
		%feature("autodoc", "Args:
	U1(Standard_Real)
	U2(Standard_Real)
	V1(Standard_Real)
	V2(Standard_Real)

Returns:
	None

The conical surface is infinite in the V direction so  
 V1 = Realfirst from Standard and V2 = RealLast.  
 U1 = 0 and U2 = 2*PI.") Bounds;
		void Bounds (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	A1(Standard_Real)
	A2(Standard_Real)
	A3(Standard_Real)
	B1(Standard_Real)
	B2(Standard_Real)
	B3(Standard_Real)
	C1(Standard_Real)
	C2(Standard_Real)
	C3(Standard_Real)
	D(Standard_Real)

Returns:
	None

Returns the coefficients of the implicit equation of the  
 quadric in the absolute cartesian coordinate system :  
 These coefficients are normalized.  
 A1.X**2 + A2.Y**2 + A3.Z**2 + 2.(B1.X.Y + B2.X.Z + B3.Y.Z) +  
 2.(C1.X + C2.Y + C3.Z) + D = 0.0") Coefficients;
		void Coefficients (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the reference radius of this cone.  
The reference radius is the radius of the circle formed  
by the intersection of this cone and its reference  
plane (i.e. the plane defined by the origin, 'X  
Direction' and 'Y Direction' of the local coordinate  
system of this cone).  
If the apex of this cone is on the origin of the local  
coordinate system of this cone, the returned value is 0.") RefRadius;
		Standard_Real RefRadius ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

returns the semi-angle of the conical surface ]0.0, PI/2[.") SemiAngle;
		Standard_Real SemiAngle ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns True.") IsUClosed;
		Standard_Boolean IsUClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns False.") IsVClosed;
		Standard_Boolean IsVClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True.") IsUPeriodic;
		Standard_Boolean IsUPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns False.") IsVPeriodic;
		Standard_Boolean IsVPeriodic ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Handle_Geom_Curve

Builds the U isoparametric line of this cone. The  
 origin of this line is on the reference plane of this  
 cone (i.e. the plane defined by the origin, 'X Direction'  
 and 'Y Direction' of the local coordinate system of this cone).") UIso;
		Handle_Geom_Curve UIso (const Standard_Real U);
		%feature("autodoc", "Args:
	V(Standard_Real)

Returns:
	Handle_Geom_Curve

Builds the V isoparametric circle of this cone. It is the  
circle on this cone, located in the plane of Z  
coordinate V*cos(Semi-Angle) in the local coordinate system of this  
cone. The 'Axis' of this circle is the axis of revolution  
of this cone. Its starting point is defined by the 'X  
Direction' of this cone.  
Warning  
If the V isoparametric circle is close to the apex of  
this cone, the radius of the circle becomes very small.  
It is possible to have a circle with radius equal to 0.0.") VIso;
		Handle_Geom_Curve VIso (const Standard_Real V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)

Returns:
	None

Computes the  point P (U, V) on the surface.  
 P (U, V) = Loc +  
 (RefRadius + V * sin (Semi-Angle)) * (cos (U) * XDir + sin (U) * YDir) +  
 V * cos (Semi-Angle) * ZDir  
 where Loc is the origin of the placement plane (XAxis, YAxis)  
 XDir is the direction of the XAxis and YDir the direction of  
 the YAxis.") D0;
		void D0 (const Standard_Real U,const Standard_Real V,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)

Returns:
	None

Computes the current point and the first derivatives in the  
 directions U and V.") D1;
		void D1 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	D2UV(gp_Vec)

Returns:
	None

Computes the current point, the first and the second derivatives  
 in the directions U and V.") D2;
		void D2 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	D2UV(gp_Vec)
	D3U(gp_Vec)
	D3V(gp_Vec)
	D3UUV(gp_Vec)
	D3UVV(gp_Vec)

Returns:
	None

Computes the current point, the first,the second and the third  
 derivatives in the directions U and V.") D3;
		void D3 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV,gp_Vec & D3U,gp_Vec & D3V,gp_Vec & D3UUV,gp_Vec & D3UVV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Nu(Standard_Integer)
	Nv(Standard_Integer)

Returns:
	gp_Vec

Computes the derivative of order Nu in the u  
parametric direction, and Nv in the v parametric  
direction at the point of parameters (U, V) of this cone.  
Exceptions  
Standard_RangeError if:  
- Nu + Nv is less than 1,  
- Nu or Nv is negative.") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Real V,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

Applies the transformation T to this cone.") Transform;
		void Transform (const gp_Trsf & T);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Geometry

Creates a new object which is a copy of this cone.") Copy;
		Handle_Geom_Geometry Copy ();
};


%feature("shadow") Geom_ConicalSurface::~Geom_ConicalSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom_ConicalSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Geom_ConicalSurface {
	Handle_Geom_ConicalSurface GetHandle() {
	return *(Handle_Geom_ConicalSurface*) &$self;
	}
};

%nodefaultctor Handle_Geom_ConicalSurface;
class Handle_Geom_ConicalSurface : public Handle_Geom_ElementarySurface {

    public:
        // constructors
        Handle_Geom_ConicalSurface();
        Handle_Geom_ConicalSurface(const Handle_Geom_ConicalSurface &aHandle);
        Handle_Geom_ConicalSurface(const Geom_ConicalSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Geom_ConicalSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Geom_ConicalSurface {
    Geom_ConicalSurface* GetObject() {
    return (Geom_ConicalSurface*)$self->Access();
    }
};
%feature("shadow") Handle_Geom_ConicalSurface::~Handle_Geom_ConicalSurface %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Geom_ConicalSurface {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Geom_CylindricalSurface;
class Geom_CylindricalSurface : public Geom_ElementarySurface {
	public:
		%feature("autodoc", "Args:
	A3(gp_Ax3)
	Radius(Standard_Real)

Returns:
	None

A3 defines the local coordinate system of the cylindrical surface.  
 The 'ZDirection' of A3 defines the direction of the surface's  
 axis of symmetry.  
 At the creation the parametrization of the surface is defined  
 such that the normal Vector (N = D1U ^ D1V) is oriented towards  
 the 'outside region' of the surface.  
Warnings :  
 It is not forbidden to create a cylindrical surface with  
 Radius = 0.0  Raised if Radius < 0.0") Geom_CylindricalSurface;
		 Geom_CylindricalSurface (const gp_Ax3 & A3,const Standard_Real Radius);
		%feature("autodoc", "Args:
	C(gp_Cylinder)

Returns:
	None

Creates a CylindricalSurface from a non transient Cylinder  
 from package gp.") Geom_CylindricalSurface;
		 Geom_CylindricalSurface (const gp_Cylinder & C);
		%feature("autodoc", "Args:
	C(gp_Cylinder)

Returns:
	None

Set <self> so that <self> has the same geometric properties as C.") SetCylinder;
		void SetCylinder (const gp_Cylinder & C);
		%feature("autodoc", "Args:
	R(Standard_Real)

Returns:
	None

Changes the radius of the cylinder.  Raised if R < 0.0") SetRadius;
		void SetRadius (const Standard_Real R);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Cylinder

returns a non transient cylinder with the same geometric  
 properties as <self>.") Cylinder;
		gp_Cylinder Cylinder ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Standard_Real

Return the  parameter on the  Ureversed surface for  
         the point of parameter U on <self>.  
         Return 2.PI - U.") UReversedParameter;
		Standard_Real UReversedParameter (const Standard_Real U);
		%feature("autodoc", "Args:
	V(Standard_Real)

Returns:
	Standard_Real

Return the  parameter on the  Vreversed surface for  
         the point of parameter V on <self>.  
         Return -V") VReversedParameter;
		Standard_Real VReversedParameter (const Standard_Real V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	T(gp_Trsf)

Returns:
	virtual void

Computes the  parameters on the  transformed  surface for  
the transform of the point of parameters U,V on <self>.  
         me->Transformed(T)->Value(U',V')  
         is the same point as  
         me->Value(U,V).Transformed(T)  
  Where U',V' are the new values of U,V after calling  
         me->TranformParameters(U,V,T)  
         This methods multiplies V by T.ScaleFactor()") TransformParameters;
		virtual void TransformParameters (Standard_Real &OutValue,Standard_Real &OutValue,const gp_Trsf & T);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	virtual gp_GTrsf2d

Returns a 2d transformation  used to find the  new  
         parameters of a point on the transformed surface.  
         me->Transformed(T)->Value(U',V')  
         is the same point as  
         me->Value(U,V).Transformed(T)  
 Where U',V' are  obtained by transforming U,V with  
         th 2d transformation returned by  
         me->ParametricTransformation(T)  
   This  methods  returns  a scale  centered  on  the  
         U axis with T.ScaleFactor") ParametricTransformation;
		virtual gp_GTrsf2d ParametricTransformation (const gp_Trsf & T);
		%feature("autodoc", "Args:
	U1(Standard_Real)
	U2(Standard_Real)
	V1(Standard_Real)
	V2(Standard_Real)

Returns:
	None

The CylindricalSurface is infinite in the V direction so  
 V1 = Realfirst, V2 = RealLast from package Standard.  
 U1 = 0 and U2 = 2*PI.") Bounds;
		void Bounds (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	A1(Standard_Real)
	A2(Standard_Real)
	A3(Standard_Real)
	B1(Standard_Real)
	B2(Standard_Real)
	B3(Standard_Real)
	C1(Standard_Real)
	C2(Standard_Real)
	C3(Standard_Real)
	D(Standard_Real)

Returns:
	None

Returns the coefficients of the implicit equation of the quadric  
 in the absolute cartesian coordinate system :  
 These coefficients are normalized.  
 A1.X**2 + A2.Y**2 + A3.Z**2 + 2.(B1.X.Y + B2.X.Z + B3.Y.Z) +  
 2.(C1.X + C2.Y + C3.Z) + D = 0.0") Coefficients;
		void Coefficients (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the radius of this cylinder.") Radius;
		Standard_Real Radius ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True.") IsUClosed;
		Standard_Boolean IsUClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns False.") IsVClosed;
		Standard_Boolean IsVClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True.") IsUPeriodic;
		Standard_Boolean IsUPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns False.") IsVPeriodic;
		Standard_Boolean IsVPeriodic ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Handle_Geom_Curve

The UIso curve is a Line. The location point of this line is  
 on the placement plane (XAxis, YAxis) of the surface.  
 This line is parallel to the axis of symmetry of the surface.") UIso;
		Handle_Geom_Curve UIso (const Standard_Real U);
		%feature("autodoc", "Args:
	V(Standard_Real)

Returns:
	Handle_Geom_Curve

The VIso curve is a circle. The start point of this circle  
 (U = 0) is defined with the 'XAxis' of the surface.  
 The center of the circle is on the symmetry axis.") VIso;
		Handle_Geom_Curve VIso (const Standard_Real V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)

Returns:
	None

Computes the  point P (U, V) on the surface.  
 P (U, V) = Loc + Radius * (cos (U) * XDir + sin (U) * YDir) +  
            V * ZDir  
 where Loc is the origin of the placement plane (XAxis, YAxis)  
 XDir is the direction of the XAxis and YDir the direction of  
 the YAxis.") D0;
		void D0 (const Standard_Real U,const Standard_Real V,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)

Returns:
	None

Computes the current point and the first derivatives in the  
 directions U and V.") D1;
		void D1 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	D2UV(gp_Vec)

Returns:
	None

Computes the current point, the first and the second derivatives  
 in the directions U and V.") D2;
		void D2 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	D2UV(gp_Vec)
	D3U(gp_Vec)
	D3V(gp_Vec)
	D3UUV(gp_Vec)
	D3UVV(gp_Vec)

Returns:
	None

Computes the current point, the first, the second and the  
 third   derivatives in the directions U and V.") D3;
		void D3 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV,gp_Vec & D3U,gp_Vec & D3V,gp_Vec & D3UUV,gp_Vec & D3UVV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Nu(Standard_Integer)
	Nv(Standard_Integer)

Returns:
	gp_Vec

Computes the derivative of order Nu in the direction u and Nv  
 in the direction v.  Raised if Nu + Nv < 1 or Nu < 0 or Nv < 0.") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Real V,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

Applies the transformation T to this cylinder.") Transform;
		void Transform (const gp_Trsf & T);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Geometry

Creates a new object which is a copy of this cylinder.") Copy;
		Handle_Geom_Geometry Copy ();
};


%feature("shadow") Geom_CylindricalSurface::~Geom_CylindricalSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom_CylindricalSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Geom_CylindricalSurface {
	Handle_Geom_CylindricalSurface GetHandle() {
	return *(Handle_Geom_CylindricalSurface*) &$self;
	}
};

%nodefaultctor Handle_Geom_CylindricalSurface;
class Handle_Geom_CylindricalSurface : public Handle_Geom_ElementarySurface {

    public:
        // constructors
        Handle_Geom_CylindricalSurface();
        Handle_Geom_CylindricalSurface(const Handle_Geom_CylindricalSurface &aHandle);
        Handle_Geom_CylindricalSurface(const Geom_CylindricalSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Geom_CylindricalSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Geom_CylindricalSurface {
    Geom_CylindricalSurface* GetObject() {
    return (Geom_CylindricalSurface*)$self->Access();
    }
};
%feature("shadow") Handle_Geom_CylindricalSurface::~Handle_Geom_CylindricalSurface %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Geom_CylindricalSurface {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Geom_Ellipse;
class Geom_Ellipse : public Geom_Conic {
	public:
		%feature("autodoc", "Args:
	E(gp_Elips)

Returns:
	None

Constructs an ellipse by conversion of the gp_Elips ellipse E.") Geom_Ellipse;
		 Geom_Ellipse (const gp_Elips & E);
		%feature("autodoc", "Args:
	A2(gp_Ax2)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)

Returns:
	None

Constructs an ellipse  
//!	defined by its major and minor radii, MajorRadius  
  and MinorRadius, where A2 locates the ellipse  
  and defines its orientation in 3D space such that:  
  - the center of the ellipse is the origin of A2,  
  - the 'X Direction' of A2 defines the major axis  
   of the ellipse, i.e. the major radius  
   MajorRadius is measured along this axis,  
  - the 'Y Direction' of A2 defines the minor axis  
   of the ellipse, i.e. the minor radius  
   MinorRadius is measured along this axis,  
  - A2 is the local coordinate system of the ellipse.  
       Exceptions  
Standard_ConstructionError if:  
- MajorRadius is less than MinorRadius, or  
- MinorRadius is less than 0.  
 Warning The Geom package does not prevent the  
construction of an ellipse where MajorRadius and  
MinorRadius are equal.") Geom_Ellipse;
		 Geom_Ellipse (const gp_Ax2 & A2,const Standard_Real MajorRadius,const Standard_Real MinorRadius);
		%feature("autodoc", "Args:
	E(gp_Elips)

Returns:
	None

Converts the gp_Elips ellipse E into this ellipse.") SetElips;
		void SetElips (const gp_Elips & E);
		%feature("autodoc", "Args:
	MajorRadius(Standard_Real)

Returns:
	None

Assigns a value to the major radius of this ellipse.  
      ConstructionError raised if MajorRadius < MinorRadius.") SetMajorRadius;
		void SetMajorRadius (const Standard_Real MajorRadius);
		%feature("autodoc", "Args:
	MinorRadius(Standard_Real)

Returns:
	None

Assigns a value to the minor radius of this ellipse.  
 ConstructionError raised if MajorRadius < MinorRadius or if MinorRadius < 0.") SetMinorRadius;
		void SetMinorRadius (const Standard_Real MinorRadius);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Elips

returns the non transient ellipse from gp with the same") Elips;
		gp_Elips Elips ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Standard_Real

Computes the parameter on the reversed ellipse for  
 the point of parameter U on this ellipse.  
 For an ellipse, the returned value is: 2.*Pi - U.") ReversedParameter;
		Standard_Real ReversedParameter (const Standard_Real U);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

This directrix is the line normal to the XAxis of the ellipse  
 in the local plane (Z = 0) at a distance d = MajorRadius / e  
 from the center of the ellipse, where e is the eccentricity of  
 the ellipse.  
 This line is parallel to the 'YAxis'. The intersection point  
 between directrix1 and the 'XAxis' is the 'Location' point  
 of the directrix1. This point is on the positive side of  
 the 'XAxis'.  Raised if Eccentricity = 0.0. (The ellipse degenerates  
 into a circle)") Directrix1;
		gp_Ax1 Directrix1 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

This line is obtained by the symmetrical transformation  
 of 'Directrix1' with respect to the 'YAxis' of the ellipse.  
 Raised if Eccentricity = 0.0. (The ellipse degenerates into a  
 circle).") Directrix2;
		gp_Ax1 Directrix2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the eccentricity of the ellipse  between 0.0 and 1.0  
 If f is the distance between the center of the ellipse and  
 the Focus1 then the eccentricity e = f / MajorRadius.  
 Returns 0 if MajorRadius = 0") Eccentricity;
		Standard_Real Eccentricity ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Computes the focal distance. It is the distance between the  
 the two focus of the ellipse.") Focal;
		Standard_Real Focal ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the first focus of the ellipse. This focus is on the  
 positive side of the 'XAxis' of the ellipse.") Focus1;
		gp_Pnt Focus1 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the second focus of the ellipse. This focus is on  
 the negative side of the 'XAxis' of the ellipse.") Focus2;
		gp_Pnt Focus2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the major  radius of this ellipse.") MajorRadius;
		Standard_Real MajorRadius ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the minor radius of this ellipse.") MinorRadius;
		Standard_Real MinorRadius ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns p = (1 - e * e) * MajorRadius where e is the eccentricity  
 of the ellipse.  
 Returns 0 if MajorRadius = 0") Parameter;
		Standard_Real Parameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the value of the first parameter of this  
ellipse. This is respectively:  
- 0.0, which gives the start point of this ellipse, or  
 The start point and end point of an ellipse are coincident.") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the value of the  last parameter of this  
ellipse. This is respectively:  
- 2.*Pi, which gives the end point of this ellipse.  
 The start point and end point of an ellipse are coincident.") LastParameter;
		Standard_Real LastParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

return True.") IsClosed;
		Standard_Boolean IsClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

return True.") IsPeriodic;
		Standard_Boolean IsPeriodic ();
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)

Returns:
	None

Returns in P the point of parameter U.  
 P = C + MajorRadius * Cos (U) * XDir + MinorRadius * Sin (U) * YDir  
 where C is the center of the ellipse , XDir the direction of  
 the 'XAxis' and 'YDir' the 'YAxis' of the ellipse.") D0;
		void D0 (const Standard_Real U,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)

Returns:
	None

No detailed docstring for this function.") D1;
		void D1 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)

Returns:
	None

Returns the point P of parameter U. The vectors V1 and V2  
 are the first and second derivatives at this point.") D2;
		void D2 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)
	V3(gp_Vec)

Returns:
	None

Returns the point P of parameter U, the first second and  
 third derivatives V1 V2 and V3.") D3;
		void D3 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("autodoc", "Args:
	U(Standard_Real)
	N(Standard_Integer)

Returns:
	gp_Vec

For the point of parameter U of this ellipse, computes  
the vector corresponding to the Nth derivative.  
Exceptions Standard_RangeError if N is less than 1.") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Integer N);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

Applies the transformation T to this ellipse.") Transform;
		void Transform (const gp_Trsf & T);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Geometry

Creates a new object which is a copy of this ellipse.") Copy;
		Handle_Geom_Geometry Copy ();
};


%feature("shadow") Geom_Ellipse::~Geom_Ellipse %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom_Ellipse {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Geom_Ellipse {
	Handle_Geom_Ellipse GetHandle() {
	return *(Handle_Geom_Ellipse*) &$self;
	}
};

%nodefaultctor Handle_Geom_Ellipse;
class Handle_Geom_Ellipse : public Handle_Geom_Conic {

    public:
        // constructors
        Handle_Geom_Ellipse();
        Handle_Geom_Ellipse(const Handle_Geom_Ellipse &aHandle);
        Handle_Geom_Ellipse(const Geom_Ellipse *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Geom_Ellipse DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Geom_Ellipse {
    Geom_Ellipse* GetObject() {
    return (Geom_Ellipse*)$self->Access();
    }
};
%feature("shadow") Handle_Geom_Ellipse::~Handle_Geom_Ellipse %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Geom_Ellipse {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Geom_Hyperbola;
class Geom_Hyperbola : public Geom_Conic {
	public:
		%feature("autodoc", "Args:
	H(gp_Hypr)

Returns:
	None

Constructs a hyperbola by conversion of the gp_Hypr hyperbola H.") Geom_Hyperbola;
		 Geom_Hyperbola (const gp_Hypr & H);
		%feature("autodoc", "Args:
	A2(gp_Ax2)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)

Returns:
	None

Constructs a hyperbola defined by its major and  
minor radii, MajorRadius and MinorRadius, where A2 locates the  
  hyperbola and defines its orientation in 3D space such that:  
  - the center of the hyperbola is the origin of A2,  
  - the 'X Direction' of A2 defines the major axis  
   of the hyperbola, i.e. the major radius  
   MajorRadius is measured along this axis,  
  - the 'Y Direction' of A2 defines the minor axis  
   of the hyperbola, i.e. the minor radius  
   MinorRadius is measured along this axis,  
  - A2 is the local coordinate system of the   hyperbola.  
Exceptions  
Standard_ConstructionError if:  
- MajorRadius is less than 0.0,  
- MinorRadius is less than 0.0.") Geom_Hyperbola;
		 Geom_Hyperbola (const gp_Ax2 & A2,const Standard_Real MajorRadius,const Standard_Real MinorRadius);
		%feature("autodoc", "Args:
	H(gp_Hypr)

Returns:
	None

Converts the gp_Hypr hyperbola H into this hyperbola.") SetHypr;
		void SetHypr (const gp_Hypr & H);
		%feature("autodoc", "Args:
	MajorRadius(Standard_Real)

Returns:
	None

Assigns a value to the major radius of this hyperbola.  
Exceptions  
Standard_ConstructionError if:  
- MajorRadius is less than 0.0, or  
- MinorRadius is less than 0.0.Raised if MajorRadius < 0.0") SetMajorRadius;
		void SetMajorRadius (const Standard_Real MajorRadius);
		%feature("autodoc", "Args:
	MinorRadius(Standard_Real)

Returns:
	None

Assigns a value to the minor radius of this hyperbola.  
Exceptions  
Standard_ConstructionError if:  
- MajorRadius is less than 0.0, or  
- MinorRadius is less than 0.0.Raised if MajorRadius < 0.0") SetMinorRadius;
		void SetMinorRadius (const Standard_Real MinorRadius);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Hypr

returns the non transient parabola from gp with the same  
 geometric properties as <self>.") Hypr;
		gp_Hypr Hypr ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Standard_Real

Computes the parameter on the reversed hyperbola,  
for the point of parameter U on this hyperbola.  
For a hyperbola, the returned value is: -U.") ReversedParameter;
		Standard_Real ReversedParameter (const Standard_Real U);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns RealFirst from Standard.") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

returns RealLast from Standard.") LastParameter;
		Standard_Real LastParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns False.") IsClosed;
		Standard_Boolean IsClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

return False for an hyperbola.") IsPeriodic;
		Standard_Boolean IsPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

In the local coordinate system of the hyperbola the equation of  
 the hyperbola is (X*X)/(A*A) - (Y*Y)/(B*B) = 1.0 and the  
 equation of the first asymptote is Y = (B/A)*X.  
 Raises ConstructionError if MajorRadius = 0.0") Asymptote1;
		gp_Ax1 Asymptote1 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

In the local coordinate system of the hyperbola the equation of  
 the hyperbola is (X*X)/(A*A) - (Y*Y)/(B*B) = 1.0 and the  
 equation of the first asymptote is Y = -(B/A)*X.  
Raises ConstructionError if MajorRadius = 0.0") Asymptote2;
		gp_Ax1 Asymptote2 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Hypr

This branch of hyperbola is on the positive side of the  
 YAxis of <self>.") ConjugateBranch1;
		gp_Hypr ConjugateBranch1 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Hypr

This branch of hyperbola is on the negative side of the  
 YAxis of <self>.  
Note: The diagram given under the class purpose  
indicates where these two branches of hyperbola are  
positioned in relation to this branch of hyperbola.") ConjugateBranch2;
		gp_Hypr ConjugateBranch2 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

This directrix is the line normal to the XAxis of the hyperbola  
 in the local plane (Z = 0) at a distance d = MajorRadius / e  
 from the center of the hyperbola, where e is the eccentricity of  
 the hyperbola.  
 This line is parallel to the YAxis. The intersection point between  
 directrix1 and the XAxis is the location point of the directrix1.  
 This point is on the positive side of the XAxis.") Directrix1;
		gp_Ax1 Directrix1 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

This line is obtained by the symmetrical transformation  
 of 'directrix1' with respect to the YAxis of the hyperbola.") Directrix2;
		gp_Ax1 Directrix2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the excentricity of the hyperbola (e > 1).  
 If f is the distance between the location of the hyperbola  
 and the Focus1 then the eccentricity e = f / MajorRadius.  raised if MajorRadius = 0.0") Eccentricity;
		Standard_Real Eccentricity ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Computes the focal distance. It is the distance between the  
 two focus of the hyperbola.") Focal;
		Standard_Real Focal ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the first focus of the hyperbola. This focus is on the  
 positive side of the XAxis of the hyperbola.") Focus1;
		gp_Pnt Focus1 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the second focus of the hyperbola. This focus is on the  
 negative side of the XAxis of the hyperbola.") Focus2;
		gp_Pnt Focus2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the major or minor radius of this hyperbola.  
The major radius is also the distance between the  
center of the hyperbola and the apex of the main  
branch (located on the 'X Axis' of the hyperbola).") MajorRadius;
		Standard_Real MajorRadius ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the major or minor radius of this hyperbola.  
The minor radius is also the distance between the  
center of the hyperbola and the apex of a conjugate  
branch (located on the 'Y Axis' of the hyperbola).") MinorRadius;
		Standard_Real MinorRadius ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Hypr

Computes the 'other' branch of this hyperbola. This  
is the symmetrical branch with respect to the center of this hyperbola.  
Note: The diagram given under the class purpose  
indicates where the 'other' branch is positioned in  
relation to this branch of the hyperbola.") OtherBranch;
		gp_Hypr OtherBranch ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns p = (e * e - 1) * MajorRadius where e is the  
 eccentricity of the hyperbola.  raised if MajorRadius = 0.0") Parameter;
		Standard_Real Parameter ();
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)

Returns:
	None

Returns in P the point of parameter U.  
 P = C + MajorRadius * Cosh (U) * XDir +  
         MinorRadius * Sinh (U) * YDir  
 where C is the center of the hyperbola , XDir the XDirection and  
 YDir the YDirection of the hyperbola's local coordinate system.") D0;
		void D0 (const Standard_Real U,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)

Returns:
	None

Returns the point P of parameter U and the first derivative V1.") D1;
		void D1 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)

Returns:
	None

Returns the point P of parameter U, the first and second  
 derivatives V1 and V2.") D2;
		void D2 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)
	V3(gp_Vec)

Returns:
	None

Returns the point P of parameter U, the first second and  
 third derivatives V1 V2 and V3.") D3;
		void D3 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("autodoc", "Args:
	U(Standard_Real)
	N(Standard_Integer)

Returns:
	gp_Vec

The returned vector gives the value of the derivative for the  
 order of derivation N.  Raised if N < 1.") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Integer N);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

Applies the transformation T to this hyperbola.") Transform;
		void Transform (const gp_Trsf & T);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Geometry

Creates a new object which is a copy of this hyperbola.") Copy;
		Handle_Geom_Geometry Copy ();
};


%feature("shadow") Geom_Hyperbola::~Geom_Hyperbola %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom_Hyperbola {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Geom_Hyperbola {
	Handle_Geom_Hyperbola GetHandle() {
	return *(Handle_Geom_Hyperbola*) &$self;
	}
};

%nodefaultctor Handle_Geom_Hyperbola;
class Handle_Geom_Hyperbola : public Handle_Geom_Conic {

    public:
        // constructors
        Handle_Geom_Hyperbola();
        Handle_Geom_Hyperbola(const Handle_Geom_Hyperbola &aHandle);
        Handle_Geom_Hyperbola(const Geom_Hyperbola *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Geom_Hyperbola DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Geom_Hyperbola {
    Geom_Hyperbola* GetObject() {
    return (Geom_Hyperbola*)$self->Access();
    }
};
%feature("shadow") Handle_Geom_Hyperbola::~Handle_Geom_Hyperbola %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Geom_Hyperbola {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Geom_Parabola;
class Geom_Parabola : public Geom_Conic {
	public:
		%feature("autodoc", "Args:
	Prb(gp_Parab)

Returns:
	None

Creates a parabola from a non transient one.") Geom_Parabola;
		 Geom_Parabola (const gp_Parab & Prb);
		%feature("autodoc", "Args:
	A2(gp_Ax2)
	Focal(Standard_Real)

Returns:
	None

Creates a parabola with its local coordinate system 'A2'  
 and it's focal length 'Focal'.  
 The XDirection of A2 defines the axis of symmetry of the  
 parabola. The YDirection of A2 is parallel to the directrix  
 of the parabola. The Location point of A2 is the vertex of  
 the parabola  Raised if Focal < 0.0") Geom_Parabola;
		 Geom_Parabola (const gp_Ax2 & A2,const Standard_Real Focal);
		%feature("autodoc", "Args:
	D(gp_Ax1)
	F(gp_Pnt)

Returns:
	None

D is the directrix of the parabola and F the focus point.  
 The symmetry axis (XAxis) of the parabola is normal to the  
 directrix and pass through the focus point F, but its  
 location point is the vertex of the parabola.  
 The YAxis of the parabola is parallel to D and its location  
 point is the vertex of the parabola. The normal to the plane  
 of the parabola is the cross product between the XAxis and the  
 YAxis.") Geom_Parabola;
		 Geom_Parabola (const gp_Ax1 & D,const gp_Pnt & F);
		%feature("autodoc", "Args:
	Focal(Standard_Real)

Returns:
	None

Assigns the value Focal to the focal distance of this parabola.  
Exceptions Standard_ConstructionError if Focal is negative.") SetFocal;
		void SetFocal (const Standard_Real Focal);
		%feature("autodoc", "Args:
	Prb(gp_Parab)

Returns:
	None

Converts the gp_Parab parabola Prb into this parabola.") SetParab;
		void SetParab (const gp_Parab & Prb);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Parab

Returns the non transient parabola from gp with the same  
 geometric properties as <self>.") Parab;
		gp_Parab Parab ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Standard_Real

Computes the parameter on the reversed parabola,  
for the point of parameter U on this parabola.  
For a parabola, the returned value is: -U.") ReversedParameter;
		Standard_Real ReversedParameter (const Standard_Real U);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the value of the first or last parameter of this  
parabola. This is, respectively:  
- Standard_Real::RealFirst(), or  
- Standard_Real::RealLast().") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the value of the first or last parameter of this  
parabola. This is, respectively:  
- Standard_Real::RealFirst(), or  
- Standard_Real::RealLast().") LastParameter;
		Standard_Real LastParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns False") IsClosed;
		Standard_Boolean IsClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns False") IsPeriodic;
		Standard_Boolean IsPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

Computes the directrix of this parabola.  
This is a line normal to the axis of symmetry, in the  
plane of this parabola, located on the negative side  
of its axis of symmetry, at a distance from the apex  
equal to the focal length.  
The directrix is returned as an axis (gp_Ax1 object),  
where the origin is located on the 'X Axis' of this parabola.") Directrix;
		gp_Ax1 Directrix ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns 1. (which is the eccentricity of any parabola).") Eccentricity;
		Standard_Real Eccentricity ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Computes the focus of this parabola. The focus is on the  
positive side of the 'X Axis' of the local coordinate  
system of the parabola.") Focus;
		gp_Pnt Focus ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Computes the focal distance of this parabola  
 The focal distance is the distance between the apex  
and the focus of the parabola.") Focal;
		Standard_Real Focal ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Computes the parameter of this parabola which is the  
distance between its focus and its directrix. This  
distance is twice the focal length.  
If P is the parameter of the parabola, the equation of  
the parabola in its local coordinate system is: Y**2 = 2.*P*X.") Parameter;
		Standard_Real Parameter ();
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)

Returns:
	None

Returns in P the point of parameter U.  
 If U = 0 the returned point is the origin of the XAxis and  
 the YAxis of the parabola and it is the vertex of the parabola.  
 P = S + F * (U * U * XDir +  * U * YDir)  
 where S is the vertex of the parabola, XDir the XDirection and  
 YDir the YDirection of the parabola's local coordinate system.") D0;
		void D0 (const Standard_Real U,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)

Returns:
	None

Returns the point P of parameter U and the first derivative V1.") D1;
		void D1 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)

Returns:
	None

Returns the point P of parameter U, the first and second  
 derivatives V1 and V2.") D2;
		void D2 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)
	V3(gp_Vec)

Returns:
	None

Returns the point P of parameter U, the first second and third  
 derivatives V1 V2 and V3.") D3;
		void D3 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("autodoc", "Args:
	U(Standard_Real)
	N(Standard_Integer)

Returns:
	gp_Vec

For the point of parameter U of this parabola,  
computes the vector corresponding to the Nth derivative.  
Exceptions Standard_RangeError if N is less than 1.") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Integer N);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

Applies the transformation T to this parabola.") Transform;
		void Transform (const gp_Trsf & T);
		%feature("autodoc", "Args:
	U(Standard_Real)
	T(gp_Trsf)

Returns:
	Standard_Real

Returns the  parameter on the  transformed  curve for  
         the transform of the point of parameter U on <self>.  
 
         me->Transformed(T)->Value(me->TransformedParameter(U,T))  
 
         is the same point as  
 
         me->Value(U).Transformed(T)  
 
         This methods returns <U> * T.ScaleFactor()") TransformedParameter;
		Standard_Real TransformedParameter (const Standard_Real U,const gp_Trsf & T);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	Standard_Real

Returns a  coefficient to compute the parameter on  
         the transformed  curve  for  the transform  of the  
         point on <self>.  
 
         Transformed(T)->Value(U * ParametricTransformation(T))  
 
         is the same point as  
 
         Value(U).Transformed(T)  
 
         This methods returns T.ScaleFactor()") ParametricTransformation;
		Standard_Real ParametricTransformation (const gp_Trsf & T);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Geometry

Creates a new object which is a copy of this parabola.") Copy;
		Handle_Geom_Geometry Copy ();
};


%feature("shadow") Geom_Parabola::~Geom_Parabola %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom_Parabola {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Geom_Parabola {
	Handle_Geom_Parabola GetHandle() {
	return *(Handle_Geom_Parabola*) &$self;
	}
};

%nodefaultctor Handle_Geom_Parabola;
class Handle_Geom_Parabola : public Handle_Geom_Conic {

    public:
        // constructors
        Handle_Geom_Parabola();
        Handle_Geom_Parabola(const Handle_Geom_Parabola &aHandle);
        Handle_Geom_Parabola(const Geom_Parabola *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Geom_Parabola DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Geom_Parabola {
    Geom_Parabola* GetObject() {
    return (Geom_Parabola*)$self->Access();
    }
};
%feature("shadow") Handle_Geom_Parabola::~Handle_Geom_Parabola %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Geom_Parabola {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Geom_Plane;
class Geom_Plane : public Geom_ElementarySurface {
	public:
		%feature("autodoc", "Args:
	A3(gp_Ax3)

Returns:
	None

Creates a plane located in 3D space with an axis placement  
 three axis.  The 'ZDirection' of 'A3' is the direction normal  
 to the plane.  The 'Location' point of 'A3' is the origin of  
 the plane. The 'XDirection' and 'YDirection' of 'A3' define  
 the directions of the U isoparametric and V isoparametric  
 curves.") Geom_Plane;
		 Geom_Plane (const gp_Ax3 & A3);
		%feature("autodoc", "Args:
	Pl(gp_Pln)

Returns:
	None

Creates a plane from a non transient plane from package gp.") Geom_Plane;
		 Geom_Plane (const gp_Pln & Pl);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	V(gp_Dir)

Returns:
	None

P is the 'Location' point or origin of the plane.  
 V is the direction normal to the plane.") Geom_Plane;
		 Geom_Plane (const gp_Pnt & P,const gp_Dir & V);
		%feature("autodoc", "Args:
	A(Standard_Real)
	B(Standard_Real)
	C(Standard_Real)
	D(Standard_Real)

Returns:
	None

Creates a plane from its cartesian equation :  
 Ax + By + Cz + D = 0.0  
 Raised if Sqrt (A*A + B*B + C*C) <= Resolution from gp") Geom_Plane;
		 Geom_Plane (const Standard_Real A,const Standard_Real B,const Standard_Real C,const Standard_Real D);
		%feature("autodoc", "Args:
	Pl(gp_Pln)

Returns:
	None

Set <self> so that <self> has the same geometric properties as Pl.") SetPln;
		void SetPln (const gp_Pln & Pl);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pln

Converts this plane into a gp_Pln plane.") Pln;
		gp_Pln Pln ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Changes the orientation of this plane in the u (or v)  
parametric direction. The bounds of the plane are not  
changed but the given parametric direction is  
reversed. Hence the orientation of the surface is reversed.") UReverse;
		virtual void UReverse ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Standard_Real

Computes the u  parameter on the modified  
plane, produced when reversing the u  
parametric of this plane, for any point of u parameter U  on this plane.  
In the case of a plane, these methods return - -U.") UReversedParameter;
		Standard_Real UReversedParameter (const Standard_Real U);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Changes the orientation of this plane in the u (or v)  
parametric direction. The bounds of the plane are not  
changed but the given parametric direction is  
reversed. Hence the orientation of the surface is reversed.") VReverse;
		virtual void VReverse ();
		%feature("autodoc", "Args:
	V(Standard_Real)

Returns:
	Standard_Real

Computes the v parameter on the modified  
plane, produced when reversing the  v  
parametric of this plane, for any point of v parameter V on this plane.  
In the case of a plane, these methods return -V.") VReversedParameter;
		Standard_Real VReversedParameter (const Standard_Real V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	T(gp_Trsf)

Returns:
	virtual void

Computes the  parameters on the  transformed  surface for  
         the transform of the point of parameters U,V on <self>.  
         me->Transformed(T)->Value(U',V')  
         is the same point as  
         me->Value(U,V).Transformed(T)  
         Where U',V' are the new values of U,V after calling  
         me->TranformParameters(U,V,T)  
         This methods multiplies U and V by T.ScaleFactor()") TransformParameters;
		virtual void TransformParameters (Standard_Real &OutValue,Standard_Real &OutValue,const gp_Trsf & T);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	virtual gp_GTrsf2d

Returns a 2d transformation  used to find the  new  
         parameters of a point on the transformed surface.  
         me->Transformed(T)->Value(U',V')  
         is the same point as  
         me->Value(U,V).Transformed(T)  
         Where U',V' are  obtained by transforming U,V with  
         th 2d transformation returned by  
         me->ParametricTransformation(T)  
         This  methods  returns  a scale  centered  on  the  
         origin with T.ScaleFactor") ParametricTransformation;
		virtual gp_GTrsf2d ParametricTransformation (const gp_Trsf & T);
		%feature("autodoc", "Args:
	U1(Standard_Real)
	U2(Standard_Real)
	V1(Standard_Real)
	V2(Standard_Real)

Returns:
	None

Returns the parametric bounds U1, U2, V1 and V2 of this plane.  
Because a plane is an infinite surface, the following is always true:  
- U1 = V1 =   Standard_Real::RealFirst()  
- U2 = V2 =   Standard_Real::RealLast().") Bounds;
		void Bounds (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	A(Standard_Real)
	B(Standard_Real)
	C(Standard_Real)
	D(Standard_Real)

Returns:
	None

Computes the normalized coefficients of the plane's  
 cartesian equation : Ax + By + Cz + D = 0.0") Coefficients;
		void Coefficients (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

return False") IsUClosed;
		Standard_Boolean IsUClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

return False") IsVClosed;
		Standard_Boolean IsVClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

return False.") IsUPeriodic;
		Standard_Boolean IsUPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

return False.") IsVPeriodic;
		Standard_Boolean IsVPeriodic ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Handle_Geom_Curve

Computes the U isoparametric curve.  
 This is a Line parallel to the YAxis of the plane.") UIso;
		Handle_Geom_Curve UIso (const Standard_Real U);
		%feature("autodoc", "Args:
	V(Standard_Real)

Returns:
	Handle_Geom_Curve

Computes the V isoparametric curve.  
 This is a Line parallel to the XAxis of the plane.") VIso;
		Handle_Geom_Curve VIso (const Standard_Real V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)

Returns:
	None

Computes the point P (U, V) on <self>.  
 P = O + U * XDir + V * YDir.  
 where O is the 'Location' point of the plane, XDir the  
 'XDirection' and YDir the 'YDirection' of the plane's local  
 coordinate system.") D0;
		void D0 (const Standard_Real U,const Standard_Real V,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)

Returns:
	None

Computes the current point and the first derivatives in the  
 directions U and V.") D1;
		void D1 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	D2UV(gp_Vec)

Returns:
	None

Computes the current point, the first and the second  
 derivatives in the directions U and V.") D2;
		void D2 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	D2UV(gp_Vec)
	D3U(gp_Vec)
	D3V(gp_Vec)
	D3UUV(gp_Vec)
	D3UVV(gp_Vec)

Returns:
	None

Computes the current point, the first,the second and the  
 third derivatives in the directions U and V.") D3;
		void D3 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV,gp_Vec & D3U,gp_Vec & D3V,gp_Vec & D3UUV,gp_Vec & D3UVV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Nu(Standard_Integer)
	Nv(Standard_Integer)

Returns:
	gp_Vec

Computes the derivative of order Nu in the direction u  
 and Nv in the direction v.  Raised if Nu + Nv < 1 or Nu < 0 or Nv < 0.") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Real V,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

Applies the transformation T to this plane.") Transform;
		void Transform (const gp_Trsf & T);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Geometry

Creates a new object which is a copy of this plane.") Copy;
		Handle_Geom_Geometry Copy ();
};


%feature("shadow") Geom_Plane::~Geom_Plane %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom_Plane {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Geom_Plane {
	Handle_Geom_Plane GetHandle() {
	return *(Handle_Geom_Plane*) &$self;
	}
};

%nodefaultctor Handle_Geom_Plane;
class Handle_Geom_Plane : public Handle_Geom_ElementarySurface {

    public:
        // constructors
        Handle_Geom_Plane();
        Handle_Geom_Plane(const Handle_Geom_Plane &aHandle);
        Handle_Geom_Plane(const Geom_Plane *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Geom_Plane DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Geom_Plane {
    Geom_Plane* GetObject() {
    return (Geom_Plane*)$self->Access();
    }
};
%feature("shadow") Handle_Geom_Plane::~Handle_Geom_Plane %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Geom_Plane {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Geom_RectangularTrimmedSurface;
class Geom_RectangularTrimmedSurface : public Geom_BoundedSurface {
	public:
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)
	U1(Standard_Real)
	U2(Standard_Real)
	V1(Standard_Real)
	V2(Standard_Real)
	USense(Standard_Boolean)=Standard_True
	VSense(Standard_Boolean)=Standard_True

Returns:
	None

The U parametric direction of the surface is oriented from U1  
 to U2. The V parametric direction of the surface is oriented  
 from V1 to V2.  
 These two directions define the orientation of the surface  
 (normal). If the surface is not periodic USense and VSense are  
 not used for the construction. If the surface S is periodic in  
 one direction USense and VSense give the available part of the  
 surface. By default in this case the surface has the same  
 orientation as the basis surface S.  
 The returned surface is not closed and not periodic.  
 ConstructionError   Raised if  
 S is not periodic in the UDirection and U1 or U2 are out of the  
 bounds of S.  
 S is not periodic in the VDirection and V1 or V2 are out of the  
 bounds of S.  
 U1 = U2 or V1 = V2") Geom_RectangularTrimmedSurface;
		 Geom_RectangularTrimmedSurface (const Handle_Geom_Surface & S,const Standard_Real U1,const Standard_Real U2,const Standard_Real V1,const Standard_Real V2,const Standard_Boolean USense = Standard_True,const Standard_Boolean VSense = Standard_True);
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)
	Param1(Standard_Real)
	Param2(Standard_Real)
	UTrim(Standard_Boolean)
	Sense(Standard_Boolean)=Standard_True

Returns:
	None

The basis surface S is only trim in one parametric direction.  
 If UTrim = True the surface is trimmed in the U parametric  
 direction else the surface is trimmed in the V parametric  
 direction.  
 In the considered parametric direction the resulting surface is  
 oriented from Param1 to Param2. If S is periodic Sense gives the  
 available part of the surface. By default the trimmed surface has  
 the same orientation as the basis surface S in the considered  
 parametric direction (Sense = True).  
 If the basis surface S is closed or periodic in the parametric  
 direction opposite to the trimming direction the trimmed surface  
 has the same characteristics as the surface S in this direction.  
Warnings :  
 In this package the entities are not shared.  
 The RectangularTrimmedSurface is built with a copy of the  
 surface S. So when S is modified the RectangularTrimmedSurface  
 is not modified  Raised if  
 S is not periodic in the considered parametric direction and  
 Param1 or Param2 are out of the bounds of S.  
 Param1 = Param2") Geom_RectangularTrimmedSurface;
		 Geom_RectangularTrimmedSurface (const Handle_Geom_Surface & S,const Standard_Real Param1,const Standard_Real Param2,const Standard_Boolean UTrim,const Standard_Boolean Sense = Standard_True);
		%feature("autodoc", "Args:
	U1(Standard_Real)
	U2(Standard_Real)
	V1(Standard_Real)
	V2(Standard_Real)
	USense(Standard_Boolean)=Standard_True
	VSense(Standard_Boolean)=Standard_True

Returns:
	None

Modifies this patch by changing the trim values  
applied to the original surface  
       The u parametric direction of  
  this patch is oriented from U1 to U2. The v  
  parametric direction of this patch is oriented  
  from V1 to V2. USense and VSense are used  
  for the construction only if the surface is periodic  
  in the corresponding parametric direction, and  
  define the available part of the surface; by default  
  in this case, this patch has the same orientation  
  as the basis surface.  Raised if  
 The BasisSurface is not periodic in the UDirection and U1 or U2  
   are out of the bounds of the BasisSurface.  
 The BasisSurface is not periodic in the VDirection and V1 or V2  
   are out of the bounds of the BasisSurface.  
 U1 = U2 or V1 = V2") SetTrim;
		void SetTrim (const Standard_Real U1,const Standard_Real U2,const Standard_Real V1,const Standard_Real V2,const Standard_Boolean USense = Standard_True,const Standard_Boolean VSense = Standard_True);
		%feature("autodoc", "Args:
	Param1(Standard_Real)
	Param2(Standard_Real)
	UTrim(Standard_Boolean)
	Sense(Standard_Boolean)=Standard_True

Returns:
	None

Modifies this patch by changing the trim values  
applied to the original surface  
The basis surface is trimmed only in one parametric direction: if UTrim  
  is true, the surface is trimmed in the u parametric  
  direction; if it is false, it is trimmed in the v  
  parametric direction. In the 'trimmed' direction,  
  this patch is oriented from Param1 to Param2. If  
  the basis surface is periodic in the 'trimmed'  
  direction, Sense defines its available part. By  
  default in this case, this patch has the same  
  orientation as the basis surface in this parametric  
  direction. If the basis surface is closed or periodic  
  in the other parametric direction (i.e. not the  
  'trimmed' direction), this patch has the same  
 characteristics as the basis surface in that parametric direction.  Raised if  
 The BasisSurface is not periodic in the considered direction and  
   Param1 or Param2 are out of the bounds of the BasisSurface.  
 Param1 = Param2") SetTrim;
		void SetTrim (const Standard_Real Param1,const Standard_Real Param2,const Standard_Boolean UTrim,const Standard_Boolean Sense = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Surface

Returns the Basis surface of <self>.") BasisSurface;
		Handle_Geom_Surface BasisSurface ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Changes the orientation of this patch in the u  
parametric direction. The bounds of the surface are  
not changed, but the given parametric direction is  
reversed. Hence the orientation of the surface is reversed.") UReverse;
		void UReverse ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Standard_Real

Computes the u  parameter on the modified  
surface, produced by when reversing its u  
parametric direction, for any point of u parameter U on this patch.") UReversedParameter;
		Standard_Real UReversedParameter (const Standard_Real U);
		%feature("autodoc", "Args:
	None
Returns:
	None

Changes the orientation of this patch in the v  
parametric direction. The bounds of the surface are  
not changed, but the given parametric direction is  
reversed. Hence the orientation of the surface is reversed.") VReverse;
		void VReverse ();
		%feature("autodoc", "Args:
	V(Standard_Real)

Returns:
	Standard_Real

Computes the v  parameter on the modified  
surface, produced by when reversing its v  
parametric direction, for any point of v parameter V on this patch.") VReversedParameter;
		Standard_Real VReversedParameter (const Standard_Real V);
		%feature("autodoc", "Args:
	U1(Standard_Real)
	U2(Standard_Real)
	V1(Standard_Real)
	V2(Standard_Real)

Returns:
	None

Returns the parametric bounds U1, U2, V1 and V2 of this patch.") Bounds;
		void Bounds (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_Shape

Returns  the continuity of the surface :  
 C0 : only geometric continuity,  
 C1 : continuity of the first derivative all along the Surface,  
 C2 : continuity of the second derivative all along the Surface,  
 C3 : continuity of the third derivative all along the Surface,  
 CN : the order of continuity is infinite.") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if this patch is closed in the given parametric direction.") IsUClosed;
		Standard_Boolean IsUClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if this patch is closed in the given parametric direction.") IsVClosed;
		Standard_Boolean IsVClosed ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Boolean

Returns true if the order of derivation in the U parametric  
 direction is N.  Raised if N < 0.") IsCNu;
		Standard_Boolean IsCNu (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Boolean

Returns true if the order of derivation in the V parametric  
 direction is N.  Raised if N < 0.") IsCNv;
		Standard_Boolean IsCNv (const Standard_Integer N);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if this patch is periodic in the given  
parametric direction.") IsUPeriodic;
		Standard_Boolean IsUPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

Returns the period of this patch in the u  
parametric direction.  raises if the surface is not uperiodic.") UPeriod;
		virtual Standard_Real UPeriod ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if this patch is periodic in the given  
parametric direction.") IsVPeriodic;
		Standard_Boolean IsVPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

Returns the period of this patch in the v  
parametric direction.  raises if the surface is not vperiodic.  value and derivatives") VPeriod;
		virtual Standard_Real VPeriod ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Handle_Geom_Curve

computes the U isoparametric curve.") UIso;
		Handle_Geom_Curve UIso (const Standard_Real U);
		%feature("autodoc", "Args:
	V(Standard_Real)

Returns:
	Handle_Geom_Curve

Computes the V isoparametric curve.") VIso;
		Handle_Geom_Curve VIso (const Standard_Real V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)

Returns:
	None

Can be raised if the basis surface is an OffsetSurface.") D0;
		void D0 (const Standard_Real U,const Standard_Real V,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)

Returns:
	None

The returned derivatives have the same orientation as the  
 derivatives of the basis surface even if the trimmed surface  
 has not the same parametric orientation.  
 Warning!  UndefinedDerivative  raised if the continuity of the surface is not C1.") D1;
		void D1 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	D2UV(gp_Vec)

Returns:
	None

The returned derivatives have the same orientation as the  
 derivatives of the basis surface even if the trimmed surface  
 has not the same parametric orientation.  
Warning! UndefinedDerivative raised if the continuity of the surface is not C2.") D2;
		void D2 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	D2UV(gp_Vec)
	D3U(gp_Vec)
	D3V(gp_Vec)
	D3UUV(gp_Vec)
	D3UVV(gp_Vec)

Returns:
	None

The returned derivatives have the same orientation as the  
 derivatives of the basis surface even if the trimmed surface  
 has not the same parametric orientation.  
 Warning UndefinedDerivative raised if the continuity of the surface is not C3.") D3;
		void D3 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV,gp_Vec & D3U,gp_Vec & D3V,gp_Vec & D3UUV,gp_Vec & D3UVV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Nu(Standard_Integer)
	Nv(Standard_Integer)

Returns:
	gp_Vec

The returned derivative has the same orientation as the  
 derivative of the basis surface even if the trimmed surface  
 has not the same parametric orientation.  
  Warning!  UndefinedDerivative raised if the continuity of the surface is not CNu in the U  
 parametric direction and CNv in the V parametric direction.  
 RangeError Raised if Nu + Nv < 1 or Nu < 0 or Nv < 0.") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Real V,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

Applies the transformation T to this patch.  
Warning  
As a consequence, the basis surface included in the  
data structure of this patch is also modified.") Transform;
		void Transform (const gp_Trsf & T);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	T(gp_Trsf)

Returns:
	virtual void

Computes the  parameters on the  transformed  surface for  
         the transform of the point of parameters U,V on <self>.  
 
         me->Transformed(T)->Value(U',V')  
 
         is the same point as  
 
         me->Value(U,V).Transformed(T)  
 
         Where U',V' are the new values of U,V after calling  
 
         me->TranformParameters(U,V,T)  
 
         This methods calls the basis surface method.") TransformParameters;
		virtual void TransformParameters (Standard_Real &OutValue,Standard_Real &OutValue,const gp_Trsf & T);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	virtual gp_GTrsf2d

Returns a 2d transformation  used to find the  new  
         parameters of a point on the transformed surface.  
 
         me->Transformed(T)->Value(U',V')  
 
         is the same point as  
 
         me->Value(U,V).Transformed(T)  
 
         Where U',V' are  obtained by transforming U,V with  
         th 2d transformation returned by  
 
         me->ParametricTransformation(T)  
 
         This methods calls the basis surface method.") ParametricTransformation;
		virtual gp_GTrsf2d ParametricTransformation (const gp_Trsf & T);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Geometry

Creates a new object which is a copy of this patch.") Copy;
		Handle_Geom_Geometry Copy ();
};


%feature("shadow") Geom_RectangularTrimmedSurface::~Geom_RectangularTrimmedSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom_RectangularTrimmedSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Geom_RectangularTrimmedSurface {
	Handle_Geom_RectangularTrimmedSurface GetHandle() {
	return *(Handle_Geom_RectangularTrimmedSurface*) &$self;
	}
};

%nodefaultctor Handle_Geom_RectangularTrimmedSurface;
class Handle_Geom_RectangularTrimmedSurface : public Handle_Geom_BoundedSurface {

    public:
        // constructors
        Handle_Geom_RectangularTrimmedSurface();
        Handle_Geom_RectangularTrimmedSurface(const Handle_Geom_RectangularTrimmedSurface &aHandle);
        Handle_Geom_RectangularTrimmedSurface(const Geom_RectangularTrimmedSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Geom_RectangularTrimmedSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Geom_RectangularTrimmedSurface {
    Geom_RectangularTrimmedSurface* GetObject() {
    return (Geom_RectangularTrimmedSurface*)$self->Access();
    }
};
%feature("shadow") Handle_Geom_RectangularTrimmedSurface::~Handle_Geom_RectangularTrimmedSurface %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Geom_RectangularTrimmedSurface {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Geom_SphericalSurface;
class Geom_SphericalSurface : public Geom_ElementarySurface {
	public:
		%feature("autodoc", "Args:
	A3(gp_Ax3)
	Radius(Standard_Real)

Returns:
	None

A3 is the local coordinate system of the surface.  
 At the creation the parametrization of the surface is defined  
 such as the normal Vector (N = D1U ^ D1V) is directed away from  
 the center of the sphere.  
 The direction of increasing parametric value V is defined by the  
 rotation around the 'YDirection' of A2 in the trigonometric sense  
 and the orientation of increasing parametric value U is defined  
 by the rotation around the main direction of A2 in the  
 trigonometric sense.  
 Warnings :  
 It is not forbidden to create a spherical surface with  
 Radius = 0.0  Raised if Radius < 0.0.") Geom_SphericalSurface;
		 Geom_SphericalSurface (const gp_Ax3 & A3,const Standard_Real Radius);
		%feature("autodoc", "Args:
	S(gp_Sphere)

Returns:
	None

Creates a SphericalSurface from a non persistent Sphere from  
 package gp.") Geom_SphericalSurface;
		 Geom_SphericalSurface (const gp_Sphere & S);
		%feature("autodoc", "Args:
	R(Standard_Real)

Returns:
	None

Assigns the value R to the radius of this sphere.  
Exceptions Standard_ConstructionError if R is less than 0.0.") SetRadius;
		void SetRadius (const Standard_Real R);
		%feature("autodoc", "Args:
	S(gp_Sphere)

Returns:
	None

Converts the gp_Sphere S into this sphere.") SetSphere;
		void SetSphere (const gp_Sphere & S);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Sphere

Returns a non persistent sphere with the same geometric  
 properties as <self>.") Sphere;
		gp_Sphere Sphere ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Standard_Real

Computes the u parameter on the modified  
surface, when reversing its u  parametric  
direction, for any point of u parameter U on this sphere.  
In the case of a sphere, these functions returns 2.PI - U.") UReversedParameter;
		Standard_Real UReversedParameter (const Standard_Real U);
		%feature("autodoc", "Args:
	V(Standard_Real)

Returns:
	Standard_Real

Computes the v parameter on the modified  
surface, when reversing its v parametric  
direction, for any point of v parameter V on this sphere.  
In the case of a sphere, these functions returns   -U.") VReversedParameter;
		Standard_Real VReversedParameter (const Standard_Real V);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Computes the aera of the spherical surface.") Area;
		Standard_Real Area ();
		%feature("autodoc", "Args:
	U1(Standard_Real)
	U2(Standard_Real)
	V1(Standard_Real)
	V2(Standard_Real)

Returns:
	None

Returns the parametric bounds U1, U2, V1 and V2 of this sphere.  
For a sphere: U1 = 0, U2 = 2*PI, V1 = -PI/2, V2 = PI/2.") Bounds;
		void Bounds (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	A1(Standard_Real)
	A2(Standard_Real)
	A3(Standard_Real)
	B1(Standard_Real)
	B2(Standard_Real)
	B3(Standard_Real)
	C1(Standard_Real)
	C2(Standard_Real)
	C3(Standard_Real)
	D(Standard_Real)

Returns:
	None

Returns the coefficients of the implicit equation of the  
 quadric in the absolute cartesian coordinates system :  
 These coefficients are normalized.  
 A1.X**2 + A2.Y**2 + A3.Z**2 + 2.(B1.X.Y + B2.X.Z + B3.Y.Z) +  
 2.(C1.X + C2.Y + C3.Z) + D = 0.0") Coefficients;
		void Coefficients (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Computes the coefficients of the implicit equation of  
this quadric in the absolute Cartesian coordinate system:  
A1.X**2 + A2.Y**2 + A3.Z**2 + 2.(B1.X.Y + B2.X.Z + B3.Y.Z) +  
2.(C1.X + C2.Y + C3.Z) + D = 0.0  
An implicit normalization is applied (i.e. A1 = A2 = 1.  
in the local coordinate system of this sphere).") Radius;
		Standard_Real Radius ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Computes the volume of the spherical surface.") Volume;
		Standard_Real Volume ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True.") IsUClosed;
		Standard_Boolean IsUClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns False.") IsVClosed;
		Standard_Boolean IsVClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True.") IsUPeriodic;
		Standard_Boolean IsUPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns False.") IsVPeriodic;
		Standard_Boolean IsVPeriodic ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Handle_Geom_Curve

Computes the U isoparametric curve.  
 The U isoparametric curves of the surface are defined by the  
 section of the spherical surface with plane obtained by rotation  
 of the plane (Location, XAxis, ZAxis) around ZAxis. This plane  
 defines the origin of parametrization u.  
 For a SphericalSurface the UIso curve is a Circle.  
Warnings : The radius of this circle can be zero.") UIso;
		Handle_Geom_Curve UIso (const Standard_Real U);
		%feature("autodoc", "Args:
	V(Standard_Real)

Returns:
	Handle_Geom_Curve

Computes the V isoparametric curve.  
 The V isoparametric curves of the surface  are defined by  
 the section of the spherical surface with plane parallel to the  
 plane (Location, XAxis, YAxis). This plane defines the origin of  
 parametrization V.  
 Be careful if  V is close to PI/2 or 3*PI/2 the radius of the  
 circle becomes tiny. It is not forbidden in this toolkit to  
 create circle with radius = 0.0  
 For a SphericalSurface the VIso curve is a Circle.  
 Warnings : The radius of this circle can be zero.") VIso;
		Handle_Geom_Curve VIso (const Standard_Real V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)

Returns:
	None

Computes the  point P (U, V) on the surface.  
 P (U, V) = Loc + Radius * Sin (V) * Zdir +  
            Radius * Cos (V) * (cos (U) * XDir + sin (U) * YDir)  
 where Loc is the origin of the placement plane (XAxis, YAxis)  
 XDir is the direction of the XAxis and YDir the direction of  
 the YAxis and ZDir the direction of the ZAxis.") D0;
		void D0 (const Standard_Real U,const Standard_Real V,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)

Returns:
	None

Computes the current point and the first derivatives in the  
 directions U and V.") D1;
		void D1 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	D2UV(gp_Vec)

Returns:
	None

Computes the current point, the first and the second derivatives  
 in the directions U and V.") D2;
		void D2 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	D2UV(gp_Vec)
	D3U(gp_Vec)
	D3V(gp_Vec)
	D3UUV(gp_Vec)
	D3UVV(gp_Vec)

Returns:
	None

Computes the current point, the first,the second and the third  
 derivatives in the directions U and V.") D3;
		void D3 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV,gp_Vec & D3U,gp_Vec & D3V,gp_Vec & D3UUV,gp_Vec & D3UVV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Nu(Standard_Integer)
	Nv(Standard_Integer)

Returns:
	gp_Vec

Computes the derivative of order Nu in the direction u  
 and Nv in the direction v.  Raised if Nu + Nv < 1 or Nu < 0 or Nv < 0.") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Real V,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

Applies the transformation T to this sphere.") Transform;
		void Transform (const gp_Trsf & T);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Geometry

Creates a new object which is a copy of this sphere.") Copy;
		Handle_Geom_Geometry Copy ();
};


%feature("shadow") Geom_SphericalSurface::~Geom_SphericalSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom_SphericalSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Geom_SphericalSurface {
	Handle_Geom_SphericalSurface GetHandle() {
	return *(Handle_Geom_SphericalSurface*) &$self;
	}
};

%nodefaultctor Handle_Geom_SphericalSurface;
class Handle_Geom_SphericalSurface : public Handle_Geom_ElementarySurface {

    public:
        // constructors
        Handle_Geom_SphericalSurface();
        Handle_Geom_SphericalSurface(const Handle_Geom_SphericalSurface &aHandle);
        Handle_Geom_SphericalSurface(const Geom_SphericalSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Geom_SphericalSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Geom_SphericalSurface {
    Geom_SphericalSurface* GetObject() {
    return (Geom_SphericalSurface*)$self->Access();
    }
};
%feature("shadow") Handle_Geom_SphericalSurface::~Handle_Geom_SphericalSurface %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Geom_SphericalSurface {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Geom_SurfaceOfLinearExtrusion;
class Geom_SurfaceOfLinearExtrusion : public Geom_SweptSurface {
	public:
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)
	V(gp_Dir)

Returns:
	None

V is the direction of extrusion.  
 C is the extruded curve.  
 The form of a SurfaceOfLinearExtrusion can be :  
 . ruled surface (RuledForm),  
 . a cylindrical surface if the extruded curve is a circle or  
   a trimmed circle (CylindricalForm),  
 . a plane surface if the extruded curve is a Line (PlanarForm).  
 Warnings :  
 Degenerated surface cases are not detected. For example if the  
 curve C is a line and V is parallel to the direction of this  
 line.") Geom_SurfaceOfLinearExtrusion;
		 Geom_SurfaceOfLinearExtrusion (const Handle_Geom_Curve & C,const gp_Dir & V);
		%feature("autodoc", "Args:
	V(gp_Dir)

Returns:
	None

Assigns V as the 'direction of extrusion' for this  
surface of linear extrusion.") SetDirection;
		void SetDirection (const gp_Dir & V);
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)

Returns:
	None

Modifies this surface of linear extrusion by redefining  
its 'basis curve' (the 'extruded curve').") SetBasisCurve;
		void SetBasisCurve (const Handle_Geom_Curve & C);
		%feature("autodoc", "Args:
	None
Returns:
	None

Changes the orientation of this surface of linear  
extrusion in the u  parametric direction. The  
bounds of the surface are not changed, but the given  
parametric direction is reversed. Hence the  
orientation of the surface is reversed.  
In the case of a surface of linear extrusion:  
- UReverse reverses the basis curve, and  
- VReverse reverses the direction of linear extrusion.") UReverse;
		void UReverse ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Standard_Real

Computes the u parameter on the modified  
surface, produced by reversing its u  parametric  
direction, for any point of u parameter U  on this surface of linear extrusion.  
In the case of an extruded surface:  
- UReverseParameter returns the reversed  
  parameter given by the function  
  ReversedParameter called with U on the basis   curve,") UReversedParameter;
		Standard_Real UReversedParameter (const Standard_Real U);
		%feature("autodoc", "Args:
	None
Returns:
	None

Changes the orientation of this surface of linear  
extrusion in the v parametric direction. The  
bounds of the surface are not changed, but the given  
parametric direction is reversed. Hence the  
orientation of the surface is reversed.  
In the case of a surface of linear extrusion:  
- UReverse reverses the basis curve, and  
- VReverse reverses the direction of linear extrusion.") VReverse;
		void VReverse ();
		%feature("autodoc", "Args:
	V(Standard_Real)

Returns:
	Standard_Real

Computes the v parameter on the modified  
surface, produced by reversing its u v parametric  
direction, for any point of v parameter V on this surface of linear extrusion.  
In the case of an extruded surface VReverse returns -V.") VReversedParameter;
		Standard_Real VReversedParameter (const Standard_Real V);
		%feature("autodoc", "Args:
	U1(Standard_Real)
	U2(Standard_Real)
	V1(Standard_Real)
	V2(Standard_Real)

Returns:
	None

Returns the parametric bounds U1, U2, V1 and V2 of  
this surface of linear extrusion.  
A surface of linear extrusion is infinite in the v  
parametric direction, so:  
    - V1 = Standard_Real::RealFirst()  
- V2 = Standard_Real::RealLast().") Bounds;
		void Bounds (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

IsUClosed returns true if the 'basis curve' of this  
surface of linear extrusion is closed.") IsUClosed;
		Standard_Boolean IsUClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

IsVClosed always returns false.") IsVClosed;
		Standard_Boolean IsVClosed ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Boolean

IsCNu returns true if the degree of continuity for the  
'basis curve' of this surface of linear extrusion is at least N.  
 Raises RangeError if N < 0.") IsCNu;
		Standard_Boolean IsCNu (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Boolean

IsCNv always returns true.") IsCNv;
		Standard_Boolean IsCNv (const Standard_Integer N);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

IsUPeriodic returns true if the 'basis curve' of this  
surface of linear extrusion is periodic.") IsUPeriodic;
		Standard_Boolean IsUPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

IsVPeriodic always returns false.") IsVPeriodic;
		Standard_Boolean IsVPeriodic ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Handle_Geom_Curve

Computes the U isoparametric curve of this surface  
of linear extrusion. This is the line parallel to the  
direction of extrusion, passing through the point of  
parameter U of the basis curve.") UIso;
		Handle_Geom_Curve UIso (const Standard_Real U);
		%feature("autodoc", "Args:
	V(Standard_Real)

Returns:
	Handle_Geom_Curve

Computes the V isoparametric curve of this surface  
of linear extrusion. This curve is obtained by  
translating the extruded curve in the direction of  
extrusion, with the magnitude V.") VIso;
		Handle_Geom_Curve VIso (const Standard_Real V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)

Returns:
	None

Computes the  point P (U, V) on the surface.  
 The parameter U is the parameter on the extruded curve.  
 The parametrization V is a linear parametrization, and  
 the direction of parametrization is the direction of  
 extrusion. If the point is on the extruded curve, V = 0.0") D0;
		void D0 (const Standard_Real U,const Standard_Real V,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)

Returns:
	None

Computes the current point and the first derivatives in the  
 directions U and V.  
 Raises UndefinedDerivative if the continuity of the surface is not C1.") D1;
		void D1 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	D2UV(gp_Vec)

Returns:
	None

//!--- Purpose ;  
 Computes the current point, the first and the second derivatives  
 in the directions U and V.  
 Raises UndefinedDerivative if the continuity of the surface is not C2.") D2;
		void D2 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	D2UV(gp_Vec)
	D3U(gp_Vec)
	D3V(gp_Vec)
	D3UUV(gp_Vec)
	D3UVV(gp_Vec)

Returns:
	None

Computes the current point, the first,the second and the third  
 derivatives in the directions U and V.  
 Raises UndefinedDerivative if the continuity of the surface is not C3.") D3;
		void D3 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV,gp_Vec & D3U,gp_Vec & D3V,gp_Vec & D3UUV,gp_Vec & D3UVV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Nu(Standard_Integer)
	Nv(Standard_Integer)

Returns:
	gp_Vec

Computes the derivative of order Nu in the direction u  
 and Nv in the direction v.  
 Raises UndefinedDerivative if the continuity of the surface is not CNu in the u  
 direction and CNv in the v direction.  
Raises RangeError if Nu + Nv < 1 or Nu < 0 or Nv < 0.") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Real V,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	USide(Standard_Integer)
	P(gp_Pnt)

Returns:
	None

The following  functions  evaluates the  local  
derivatives on surface. Useful to manage discontinuities  
on the surface.  
          if    Side  =  1  ->  P  =  S( U+,V )  
          if    Side  = -1  ->  P  =  S( U-,V )  
          else  P  is betveen discontinuities  
          can be evaluated using methods  of  
          global evaluations    P  =  S( U ,V )") LocalD0;
		void LocalD0 (const Standard_Real U,const Standard_Real V,const Standard_Integer USide,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	USide(Standard_Integer)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)

Returns:
	None

No detailed docstring for this function.") LocalD1;
		void LocalD1 (const Standard_Real U,const Standard_Real V,const Standard_Integer USide,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	USide(Standard_Integer)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	D2UV(gp_Vec)

Returns:
	None

No detailed docstring for this function.") LocalD2;
		void LocalD2 (const Standard_Real U,const Standard_Real V,const Standard_Integer USide,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	USide(Standard_Integer)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	D2UV(gp_Vec)
	D3U(gp_Vec)
	D3V(gp_Vec)
	D3UUV(gp_Vec)
	D3UVV(gp_Vec)

Returns:
	None

No detailed docstring for this function.") LocalD3;
		void LocalD3 (const Standard_Real U,const Standard_Real V,const Standard_Integer USide,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV,gp_Vec & D3U,gp_Vec & D3V,gp_Vec & D3UUV,gp_Vec & D3UVV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	USide(Standard_Integer)
	Nu(Standard_Integer)
	Nv(Standard_Integer)

Returns:
	gp_Vec

No detailed docstring for this function.") LocalDN;
		gp_Vec LocalDN (const Standard_Real U,const Standard_Real V,const Standard_Integer USide,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

Applies the transformation T to this surface of linear extrusion.") Transform;
		void Transform (const gp_Trsf & T);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	T(gp_Trsf)

Returns:
	virtual void

Computes the  parameters on the  transformed  surface for  
         the transform of the point of parameters U,V on <self>.  
 
         me->Transformed(T)->Value(U',V')  
 
         is the same point as  
 
         me->Value(U,V).Transformed(T)  
 
         Where U',V' are the new values of U,V after calling  
 
         me->TranformParameters(U,V,T)  
 
         This methods multiplies :  
         U by BasisCurve()->ParametricTransformation(T)  
         V by T.ScaleFactor()") TransformParameters;
		virtual void TransformParameters (Standard_Real &OutValue,Standard_Real &OutValue,const gp_Trsf & T);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	virtual gp_GTrsf2d

Returns a 2d transformation  used to find the  new  
         parameters of a point on the transformed surface.  
 
         me->Transformed(T)->Value(U',V')  
 
         is the same point as  
 
         me->Value(U,V).Transformed(T)  
 
         Where U',V' are  obtained by transforming U,V with  
         th 2d transformation returned by  
 
         me->ParametricTransformation(T)  
 
         This  methods  returns  a scale  
         U by BasisCurve()->ParametricTransformation(T)  
         V by T.ScaleFactor()") ParametricTransformation;
		virtual gp_GTrsf2d ParametricTransformation (const gp_Trsf & T);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Geometry

Creates a new object which is a copy of this surface of linear extrusion.") Copy;
		Handle_Geom_Geometry Copy ();
};


%feature("shadow") Geom_SurfaceOfLinearExtrusion::~Geom_SurfaceOfLinearExtrusion %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom_SurfaceOfLinearExtrusion {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Geom_SurfaceOfLinearExtrusion {
	Handle_Geom_SurfaceOfLinearExtrusion GetHandle() {
	return *(Handle_Geom_SurfaceOfLinearExtrusion*) &$self;
	}
};

%nodefaultctor Handle_Geom_SurfaceOfLinearExtrusion;
class Handle_Geom_SurfaceOfLinearExtrusion : public Handle_Geom_SweptSurface {

    public:
        // constructors
        Handle_Geom_SurfaceOfLinearExtrusion();
        Handle_Geom_SurfaceOfLinearExtrusion(const Handle_Geom_SurfaceOfLinearExtrusion &aHandle);
        Handle_Geom_SurfaceOfLinearExtrusion(const Geom_SurfaceOfLinearExtrusion *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Geom_SurfaceOfLinearExtrusion DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Geom_SurfaceOfLinearExtrusion {
    Geom_SurfaceOfLinearExtrusion* GetObject() {
    return (Geom_SurfaceOfLinearExtrusion*)$self->Access();
    }
};
%feature("shadow") Handle_Geom_SurfaceOfLinearExtrusion::~Handle_Geom_SurfaceOfLinearExtrusion %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Geom_SurfaceOfLinearExtrusion {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Geom_SurfaceOfRevolution;
class Geom_SurfaceOfRevolution : public Geom_SweptSurface {
	public:
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)
	A1(gp_Ax1)

Returns:
	None

C : is the meridian  or the referenced curve.  
 A1 is the axis of revolution.  
 The form of a SurfaceOfRevolution can be :  
 . a general revolution surface (RevolutionForm),  
 . a conical surface if the meridian is a line or a trimmed line  
   (ConicalForm),  
 . a cylindrical surface if the meridian is a line or a trimmed  
   line parallel to the revolution axis (CylindricalForm),  
 . a planar surface if the meridian is a line perpendicular to  
   the revolution axis of the surface (PlanarForm).  
 . a spherical surface,  
 . a toroidal surface,  
 . a quadric surface.  
Warnings :  
 It is not checked that the curve C is planar and that the  
 surface axis is in the plane of the curve.  
 It is not checked that the revolved curve C doesn't  
 self-intersects.") Geom_SurfaceOfRevolution;
		 Geom_SurfaceOfRevolution (const Handle_Geom_Curve & C,const gp_Ax1 & A1);
		%feature("autodoc", "Args:
	A1(gp_Ax1)

Returns:
	None

Changes the axis of revolution.  
Warnings :  
 It is not checked that the axis is in the plane of the  
 revolved curve.") SetAxis;
		void SetAxis (const gp_Ax1 & A1);
		%feature("autodoc", "Args:
	V(gp_Dir)

Returns:
	None

Changes the direction of the revolution axis.  
Warnings :  
 It is not checked that the axis is in the plane of the  
 revolved curve.") SetDirection;
		void SetDirection (const gp_Dir & V);
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)

Returns:
	None

Changes the revolved curve of the surface.  
Warnings :  
 It is not checked that the curve C is planar and that the  
 surface axis is in the plane of the curve.  
 It is not checked that the revolved curve C doesn't  
 self-intersects.") SetBasisCurve;
		void SetBasisCurve (const Handle_Geom_Curve & C);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

Changes the location point of the revolution axis.  
Warnings :  
 It is not checked that the axis is in the plane of the  
 revolved curve.") SetLocation;
		void SetLocation (const gp_Pnt & P);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

Returns the revolution axis of the surface.") Axis;
		gp_Ax1 Axis ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the location point of the axis of revolution.") Location;
		const gp_Pnt & Location ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax2

Computes the position of the reference plane of the surface  
 defined by the basis curve and the symmetry axis.  
 The location point is the location point of the revolution's  
 axis, the XDirection of the plane is given by the revolution's  
 axis and the orientation of the normal to the plane is given  
 by the sense of revolution.  
 Raised if the revolved curve is not planar or if the revolved  
 curve and the symmetry axis are not in the same plane or if  
 the maximum of distance between the axis and the revolved  
 curve is lower or equal to Resolution from gp.") ReferencePlane;
		gp_Ax2 ReferencePlane ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Changes the orientation of this surface of revolution  
in the u  parametric direction. The bounds of the  
surface are not changed but the given parametric  
direction is reversed. Hence the orientation of the  
surface is reversed.  
As a consequence:  
- UReverse reverses the direction of the axis of  
  revolution of this surface,") UReverse;
		void UReverse ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Standard_Real

Computes the u  parameter on the modified  
surface, when reversing its u  parametric  
direction, for any point of u parameter U  on this surface of revolution.  
In the case of a revolved surface:  
- UReversedParameter returns 2.*Pi - U") UReversedParameter;
		Standard_Real UReversedParameter (const Standard_Real U);
		%feature("autodoc", "Args:
	None
Returns:
	None

Changes the orientation of this surface of revolution  
in the v parametric direction. The bounds of the  
surface are not changed but the given parametric  
direction is reversed. Hence the orientation of the  
surface is reversed.  
As a consequence:  
- VReverse reverses the meridian of this surface of revolution.") VReverse;
		void VReverse ();
		%feature("autodoc", "Args:
	V(Standard_Real)

Returns:
	Standard_Real

Computes the  v parameter on the modified  
surface, when reversing its  v parametric  
direction, for any point of v parameter V on this surface of revolution.  
In the case of a revolved surface:  
- VReversedParameter returns the reversed  
  parameter given by the function  
  ReversedParameter called with V on the meridian.") VReversedParameter;
		Standard_Real VReversedParameter (const Standard_Real V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	T(gp_Trsf)

Returns:
	virtual void

Computes the  parameters on the  transformed  surface for  
         the transform of the point of parameters U,V on <self>.  
 
         me->Transformed(T)->Value(U',V')  
 
         is the same point as  
 
         me->Value(U,V).Transformed(T)  
 
         Where U',V' are the new values of U,V after calling  
 
         me->TranformParameters(U,V,T)  
 
         This methods multiplies V by  
         BasisCurve()->ParametricTransformation(T)") TransformParameters;
		virtual void TransformParameters (Standard_Real &OutValue,Standard_Real &OutValue,const gp_Trsf & T);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	virtual gp_GTrsf2d

Returns a 2d transformation  used to find the  new  
         parameters of a point on the transformed surface.  
 
         me->Transformed(T)->Value(U',V')  
 
         is the same point as  
 
         me->Value(U,V).Transformed(T)  
 
         Where U',V' are  obtained by transforming U,V with  
         th 2d transformation returned by  
 
         me->ParametricTransformation(T)  
 
         This  methods  returns  a scale  centered  on  the  
         U axis with BasisCurve()->ParametricTransformation(T)") ParametricTransformation;
		virtual gp_GTrsf2d ParametricTransformation (const gp_Trsf & T);
		%feature("autodoc", "Args:
	U1(Standard_Real)
	U2(Standard_Real)
	V1(Standard_Real)
	V2(Standard_Real)

Returns:
	None

Returns the parametric bounds U1, U2 , V1 and V2 of this surface.  
A surface of revolution is always complete, so U1 = 0, U2 = 2*PI.") Bounds;
		void Bounds (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

IsUClosed always returns true.") IsUClosed;
		Standard_Boolean IsUClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

IsVClosed returns true if the meridian of this  
  surface of revolution is closed.") IsVClosed;
		Standard_Boolean IsVClosed ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Boolean

IsCNu always returns true.") IsCNu;
		Standard_Boolean IsCNu (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Boolean

IsCNv returns true if the degree of continuity of the  
  meridian of this surface of revolution is at least N.  Raised if N < 0.") IsCNv;
		Standard_Boolean IsCNv (const Standard_Integer N);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True.") IsUPeriodic;
		Standard_Boolean IsUPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

IsVPeriodic returns true if the meridian of this  
  surface of revolution is periodic.") IsVPeriodic;
		Standard_Boolean IsVPeriodic ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Handle_Geom_Curve

Computes the U isoparametric curve of this surface  
of revolution. It is the curve obtained by rotating the  
meridian through an angle U about the axis of revolution.") UIso;
		Handle_Geom_Curve UIso (const Standard_Real U);
		%feature("autodoc", "Args:
	V(Standard_Real)

Returns:
	Handle_Geom_Curve

Computes the U isoparametric curve of this surface  
of revolution. It is the curve obtained by rotating the  
meridian through an angle U about the axis of revolution.") VIso;
		Handle_Geom_Curve VIso (const Standard_Real V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)

Returns:
	None

Computes the  point P (U, V) on the surface.  
 U is the angle of the rotation around the revolution axis.  
 The direction of this axis gives the sense of rotation.  
 V is the parameter of the revolved curve.") D0;
		void D0 (const Standard_Real U,const Standard_Real V,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)

Returns:
	None

Computes the current point and the first derivatives  
 in the directions U and V.  Raised if the continuity of the surface is not C1.") D1;
		void D1 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	D2UV(gp_Vec)

Returns:
	None

Computes the current point, the first and the second derivatives  
 in the directions U and V.  Raised if the continuity of the surface is not C2.") D2;
		void D2 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	D2UV(gp_Vec)
	D3U(gp_Vec)
	D3V(gp_Vec)
	D3UUV(gp_Vec)
	D3UVV(gp_Vec)

Returns:
	None

Computes the current point, the first,the second and the third  
 derivatives in the directions U and V.  Raised if the continuity of the surface is not C3.") D3;
		void D3 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV,gp_Vec & D3U,gp_Vec & D3V,gp_Vec & D3UUV,gp_Vec & D3UVV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Nu(Standard_Integer)
	Nv(Standard_Integer)

Returns:
	gp_Vec

Computes the derivative of order Nu in the direction u and  
 Nv in the direction v.  
 Raised if the continuity of the surface is not CNu in the u  
 direction and CNv in the v direction.  Raised if Nu + Nv < 1 or Nu < 0 or Nv < 0.  The following  functions  evaluates the  local  
derivatives on surface. Useful to manage discontinuities  
on the surface.  
          if    Side  =  1  ->  P  =  S( U+,V )  
          if    Side  = -1  ->  P  =  S( U-,V )  
          else  P  is betveen discontinuities  
          can be evaluated using methods  of  
          global evaluations    P  =  S( U ,V )") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Real V,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	USide(Standard_Integer)
	P(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") LocalD0;
		void LocalD0 (const Standard_Real U,const Standard_Real V,const Standard_Integer USide,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	USide(Standard_Integer)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)

Returns:
	None

No detailed docstring for this function.") LocalD1;
		void LocalD1 (const Standard_Real U,const Standard_Real V,const Standard_Integer USide,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	USide(Standard_Integer)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	D2UV(gp_Vec)

Returns:
	None

No detailed docstring for this function.") LocalD2;
		void LocalD2 (const Standard_Real U,const Standard_Real V,const Standard_Integer USide,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	USide(Standard_Integer)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	D2UV(gp_Vec)
	D3U(gp_Vec)
	D3V(gp_Vec)
	D3UUV(gp_Vec)
	D3UVV(gp_Vec)

Returns:
	None

No detailed docstring for this function.") LocalD3;
		void LocalD3 (const Standard_Real U,const Standard_Real V,const Standard_Integer USide,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV,gp_Vec & D3U,gp_Vec & D3V,gp_Vec & D3UUV,gp_Vec & D3UVV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	USide(Standard_Integer)
	Nu(Standard_Integer)
	Nv(Standard_Integer)

Returns:
	gp_Vec

No detailed docstring for this function.") LocalDN;
		gp_Vec LocalDN (const Standard_Real U,const Standard_Real V,const Standard_Integer USide,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

Applies the transformation T to this surface of revolution.") Transform;
		void Transform (const gp_Trsf & T);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Geometry

Creates a new object which is a copy of this surface of revolution.") Copy;
		Handle_Geom_Geometry Copy ();
};


%feature("shadow") Geom_SurfaceOfRevolution::~Geom_SurfaceOfRevolution %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom_SurfaceOfRevolution {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Geom_SurfaceOfRevolution {
	Handle_Geom_SurfaceOfRevolution GetHandle() {
	return *(Handle_Geom_SurfaceOfRevolution*) &$self;
	}
};

%nodefaultctor Handle_Geom_SurfaceOfRevolution;
class Handle_Geom_SurfaceOfRevolution : public Handle_Geom_SweptSurface {

    public:
        // constructors
        Handle_Geom_SurfaceOfRevolution();
        Handle_Geom_SurfaceOfRevolution(const Handle_Geom_SurfaceOfRevolution &aHandle);
        Handle_Geom_SurfaceOfRevolution(const Geom_SurfaceOfRevolution *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Geom_SurfaceOfRevolution DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Geom_SurfaceOfRevolution {
    Geom_SurfaceOfRevolution* GetObject() {
    return (Geom_SurfaceOfRevolution*)$self->Access();
    }
};
%feature("shadow") Handle_Geom_SurfaceOfRevolution::~Handle_Geom_SurfaceOfRevolution %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Geom_SurfaceOfRevolution {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Geom_ToroidalSurface;
class Geom_ToroidalSurface : public Geom_ElementarySurface {
	public:
		%feature("autodoc", "Args:
	A3(gp_Ax3)
	MajorRadius(Standard_Real)
	MinorRadius(Standard_Real)

Returns:
	None

A3 is the local coordinate system of the surface.  
 The orientation of increasing V parametric value is defined  
 by the rotation around the main axis (ZAxis) in the  
 trigonometric sense. The parametrization of the surface in the  
 U direction is defined such as the normal Vector (N = D1U ^ D1V)  
 is oriented towards the 'outside region' of the surface.  
 Warnings :  
 It is not forbidden to create a toroidal surface with  
 MajorRadius = MinorRadius = 0.0  
 Raised if MinorRadius < 0.0 or if MajorRadius < 0.0") Geom_ToroidalSurface;
		 Geom_ToroidalSurface (const gp_Ax3 & A3,const Standard_Real MajorRadius,const Standard_Real MinorRadius);
		%feature("autodoc", "Args:
	T(gp_Torus)

Returns:
	None

Creates a ToroidalSurface from a non transient Torus from  
 package gp.") Geom_ToroidalSurface;
		 Geom_ToroidalSurface (const gp_Torus & T);
		%feature("autodoc", "Args:
	MajorRadius(Standard_Real)

Returns:
	None

Modifies this torus by changing its major radius.  
Exceptions  
Standard_ConstructionError if:  
- MajorRadius is negative, or  
- MajorRadius - r is less than or equal to  
  gp::Resolution(), where r is the minor radius of this torus.") SetMajorRadius;
		void SetMajorRadius (const Standard_Real MajorRadius);
		%feature("autodoc", "Args:
	MinorRadius(Standard_Real)

Returns:
	None

Modifies this torus by changing its minor radius.  
Exceptions  
Standard_ConstructionError if:  
- MinorRadius is negative, or  
- R - MinorRadius is less than or equal to  
  gp::Resolution(), where R is the major radius of this torus.") SetMinorRadius;
		void SetMinorRadius (const Standard_Real MinorRadius);
		%feature("autodoc", "Args:
	T(gp_Torus)

Returns:
	None

Converts the gp_Torus torus T into this torus.") SetTorus;
		void SetTorus (const gp_Torus & T);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Torus

Returns the non transient torus with the same geometric  
 properties as <self>.") Torus;
		gp_Torus Torus ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Standard_Real

Return the  parameter on the  Ureversed surface for  
         the point of parameter U on <self>.  
Return 2.PI - U.") UReversedParameter;
		Standard_Real UReversedParameter (const Standard_Real U);
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Standard_Real

Return the  parameter on the  Ureversed surface for  
         the point of parameter U on <self>.  
Return 2.PI - U.") VReversedParameter;
		Standard_Real VReversedParameter (const Standard_Real U);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Computes the aera of the surface.") Area;
		Standard_Real Area ();
		%feature("autodoc", "Args:
	U1(Standard_Real)
	U2(Standard_Real)
	V1(Standard_Real)
	V2(Standard_Real)

Returns:
	None

Returns the parametric bounds U1, U2, V1 and V2 of this torus.  
 For a torus: U1 = V1 = 0 and V1 = V2 = 2*PI .") Bounds;
		void Bounds (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Coef(TColStd_Array1OfReal)

Returns:
	None

Returns the coefficients of the implicit equation of the surface  
 in the absolute cartesian coordinate system :  
 Coef(1) * X**4 + Coef(2) * Y**4 + Coef(3) * Z**4 +  
 Coef(4) * X**3 * Y + Coef(5) * X**3 * Z + Coef(6) * Y**3 * X +  
 Coef(7) * Y**3 * Z + Coef(8) * Z**3 * X + Coef(9) * Z**3 * Y +  
 Coef(10) * X**2 * Y**2 + Coef(11) * X**2 * Z**2 +  
 Coef(12) * Y**2 * Z**2 + Coef(13) * X**3 + Coef(14) * Y**3 +  
 Coef(15) * Z**3 + Coef(16) * X**2 * Y + Coef(17) * X**2 * Z +  
 Coef(18) * Y**2 * X + Coef(19) * Y**2 * Z + Coef(20) * Z**2 * X +  
 Coef(21) * Z**2 * Y + Coef(22) * X**2 + Coef(23) * Y**2 +  
 Coef(24) * Z**2 + Coef(25) * X * Y + Coef(26) * X * Z +  
 Coef(27) * Y * Z + Coef(28) * X + Coef(29) * Y + Coef(30) *  Z +  
 Coef(31) = 0.0  Raised if the length of Coef is lower than 31.") Coefficients;
		void Coefficients (TColStd_Array1OfReal & Coef);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the major radius, or the minor radius, of this torus.") MajorRadius;
		Standard_Real MajorRadius ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the major radius, or the minor radius, of this torus.") MinorRadius;
		Standard_Real MinorRadius ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Computes the volume.") Volume;
		Standard_Real Volume ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True.") IsUClosed;
		Standard_Boolean IsUClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True.") IsVClosed;
		Standard_Boolean IsVClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True.") IsUPeriodic;
		Standard_Boolean IsUPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True.") IsVPeriodic;
		Standard_Boolean IsVPeriodic ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Handle_Geom_Curve

Computes the U isoparametric curve.  
 
 For a toroidal surface the UIso curve is a circle.  
 The center of the Uiso circle is at the distance MajorRadius  
 from the location point of the toroidal surface.  
 Warnings :  
 The radius of the circle can be zero if for the surface  
 MinorRadius = 0.0") UIso;
		Handle_Geom_Curve UIso (const Standard_Real U);
		%feature("autodoc", "Args:
	V(Standard_Real)

Returns:
	Handle_Geom_Curve

Computes the V isoparametric curve.  
 
 For a ToroidalSurface the VIso curve is a circle.  
 The axis of the circle is the main axis (ZAxis) of the  
 toroidal  surface.  
 Warnings :  
 The radius of the circle can be zero if for the surface  
 MajorRadius = MinorRadius") VIso;
		Handle_Geom_Curve VIso (const Standard_Real V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)

Returns:
	None

Computes the  point P (U, V) on the surface.  
 P (U, V) = Loc + MinorRadius * Sin (V) * Zdir +  
            (MajorRadius + MinorRadius * Cos(V)) *  
            (cos (U) * XDir + sin (U) * YDir)  
 where Loc is the origin of the placement plane (XAxis, YAxis)  
 XDir is the direction of the XAxis and YDir the direction of  
 the YAxis and ZDir the direction of the ZAxis.") D0;
		void D0 (const Standard_Real U,const Standard_Real V,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)

Returns:
	None

Computes the current point and the first derivatives in  
 the directions U and V.") D1;
		void D1 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	D2UV(gp_Vec)

Returns:
	None

Computes the current point, the first and the second derivatives  
 in the directions U and V.") D2;
		void D2 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	D2UV(gp_Vec)
	D3U(gp_Vec)
	D3V(gp_Vec)
	D3UUV(gp_Vec)
	D3UVV(gp_Vec)

Returns:
	None

Computes the current point, the first,the second and the  
 third derivatives in the directions U and V.") D3;
		void D3 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV,gp_Vec & D3U,gp_Vec & D3V,gp_Vec & D3UUV,gp_Vec & D3UVV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Nu(Standard_Integer)
	Nv(Standard_Integer)

Returns:
	gp_Vec

Computes the derivative of order Nu in the direction u and  
 Nv in the direction v.  Raised if Nu + Nv < 1 or Nu < 0 or Nv < 0.") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Real V,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

Applies the transformation T to this torus.") Transform;
		void Transform (const gp_Trsf & T);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Geometry

Creates a new object which is a copy of this torus.") Copy;
		Handle_Geom_Geometry Copy ();
};


%feature("shadow") Geom_ToroidalSurface::~Geom_ToroidalSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom_ToroidalSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Geom_ToroidalSurface {
	Handle_Geom_ToroidalSurface GetHandle() {
	return *(Handle_Geom_ToroidalSurface*) &$self;
	}
};

%nodefaultctor Handle_Geom_ToroidalSurface;
class Handle_Geom_ToroidalSurface : public Handle_Geom_ElementarySurface {

    public:
        // constructors
        Handle_Geom_ToroidalSurface();
        Handle_Geom_ToroidalSurface(const Handle_Geom_ToroidalSurface &aHandle);
        Handle_Geom_ToroidalSurface(const Geom_ToroidalSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Geom_ToroidalSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Geom_ToroidalSurface {
    Geom_ToroidalSurface* GetObject() {
    return (Geom_ToroidalSurface*)$self->Access();
    }
};
%feature("shadow") Handle_Geom_ToroidalSurface::~Handle_Geom_ToroidalSurface %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Geom_ToroidalSurface {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Geom_TrimmedCurve;
class Geom_TrimmedCurve : public Geom_BoundedCurve {
	public:
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)
	U1(Standard_Real)
	U2(Standard_Real)
	Sense(Standard_Boolean)=Standard_True

Returns:
	None

Constructs a trimmed curve from the basis curve C  
which is limited between parameter values U1 and U2.  
Note: - U1 can be greater or less than U2; in both cases,  
  the returned curve is oriented from U1 to U2.  
- If the basis curve C is periodic, there is an  
  ambiguity because two parts are available. In this  
  case, the trimmed curve has the same orientation  
  as the basis curve if Sense is true (default value)  
  or the opposite orientation if Sense is false.  
- If the curve is closed but not periodic, it is not  
  possible to keep the part of the curve which  
  includes the junction point (except if the junction  
  point is at the beginning or at the end of the  
  trimmed curve). If you tried to do this, you could  
  alter the fundamental characteristics of the basis  
  curve, which are used, for example, to compute  
  the derivatives of the trimmed curve. The rules  
  for a closed curve are therefore the same as  
  those for an open curve.  
Warning: The trimmed curve is built from a copy of curve C.  
  Therefore, when C is modified, the trimmed curve  
  is not modified.  
- If the basis curve is periodic, the bounds of the  
  trimmed curve may be different from U1 and U2  
  if the parametric origin of the basis curve is within  
  the arc of the trimmed curve. In this case, the  
  modified parameter will be equal to U1 or U2  
  plus or minus the period.  
  Exceptions  
Standard_ConstructionError if:  
- C is not periodic and U1 or U2 is outside the  
  bounds of C, or  
- U1 is equal to U2.") Geom_TrimmedCurve;
		 Geom_TrimmedCurve (const Handle_Geom_Curve & C,const Standard_Real U1,const Standard_Real U2,const Standard_Boolean Sense = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	None

Changes the orientation of this trimmed curve.  
As a result:  
- the basis curve is reversed,  
- the start point of the initial curve becomes the  
  end point of the reversed curve,  
- the end point of the initial curve becomes the  
  start point of the reversed curve,  
- the first and last parameters are recomputed.  
  If the trimmed curve was defined by:  
- a basis curve whose parameter range is [ 0., 1. ],  
- the two trim values U1 (first parameter) and U2 (last parameter),  
  the reversed trimmed curve is defined by:  
- the reversed basis curve, whose parameter range is still [ 0., 1. ],  
- the two trim values 1. - U2 (first parameter) and 1. - U1 (last parameter).") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Standard_Real

Computes the parameter on the reversed curve for  
the point of parameter U on this trimmed curve.") ReversedParameter;
		Standard_Real ReversedParameter (const Standard_Real U);
		%feature("autodoc", "Args:
	U1(Standard_Real)
	U2(Standard_Real)
	Sense(Standard_Boolean)=Standard_True

Returns:
	None

Changes this trimmed curve, by redefining the  
parameter values U1 and U2 which limit its basis curve.  
Note: If the basis curve is periodic, the trimmed curve  
has the same orientation as the basis curve if Sense  
is true (default value) or the opposite orientation if Sense is false.  
Warning  
If the basis curve is periodic, the bounds of the  
trimmed curve may be different from U1 and U2 if the  
parametric origin of the basis curve is within the arc of  
the trimmed curve. In this case, the modified  
parameter will be equal to U1 or U2 plus or minus the period.  
Exceptions  
Standard_ConstructionError if:  
- the basis curve is not periodic, and either U1 or U2  
  are outside the bounds of the basis curve, or  
- U1 is equal to U2.") SetTrim;
		void SetTrim (const Standard_Real U1,const Standard_Real U2,const Standard_Boolean Sense = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Curve

Returns the basis curve.  
  Warning  
This function does not return a constant reference.  
Consequently, any modification of the returned value  
directly modifies the trimmed curve.") BasisCurve;
		Handle_Geom_Curve BasisCurve ();
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_Shape

Returns the continuity of the curve :  
C0 : only geometric continuity,  
C1 : continuity of the first derivative all along the Curve,  
C2 : continuity of the second derivative all along the Curve,  
C3 : continuity of the third derivative all along the Curve,  
CN : the order of continuity is infinite.") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Boolean

Returns true if the degree of continuity of the basis  
curve of this trimmed curve is at least N. A trimmed  
curve is at least 'C0' continuous.  
 Warnings :  
 The continuity of the trimmed curve can be greater than  
 the continuity of the basis curve because you consider  
 only a part of the basis curve.  Raised if N < 0.") IsCN;
		Standard_Boolean IsCN (const Standard_Integer N);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the end point of <self>. This point is the  
 evaluation of the curve for the 'LastParameter'.") EndPoint;
		gp_Pnt EndPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the value of the first parameter of <self>.  
 The first parameter is the parameter of the 'StartPoint'  
 of the trimmed curve.") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the distance between the StartPoint and  
 the EndPoint is lower or equal to Resolution from package gp.") IsClosed;
		Standard_Boolean IsClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the basis curve of this trimmed curve is periodic.") IsPeriodic;
		Standard_Boolean IsPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

Returns the period of the basis curve of this trimmed curve.  
Exceptions  
Standard_NoSuchObject if the basis curve is not periodic.") Period;
		virtual Standard_Real Period ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the value of the last parameter of <self>.  
 The last parameter is the parameter of the 'EndPoint' of the  
 trimmed curve.") LastParameter;
		Standard_Real LastParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Returns the start point of <self>.  
 This point is the evaluation of the curve from the  
 'FirstParameter'.  value and derivatives  
Warnings :  
 The returned derivatives have the same orientation as the  
 derivatives of the basis curve even if the trimmed curve  
 has not the same orientation as the basis curve.") StartPoint;
		gp_Pnt StartPoint ();
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)

Returns:
	None

Returns in P the point of parameter U.  
 
 If the basis curve is an OffsetCurve sometimes it is not  
 possible to do the evaluation of the curve at the parameter  
 U (see class OffsetCurve).") D0;
		void D0 (const Standard_Real U,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)

Returns:
	None

Raised if the continuity of the curve is not C1.") D1;
		void D1 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)

Returns:
	None

Raised if the continuity of the curve is not C2.") D2;
		void D2 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)
	V3(gp_Vec)

Returns:
	None

Raised if the continuity of the curve is not C3.") D3;
		void D3 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("autodoc", "Args:
	U(Standard_Real)
	N(Standard_Integer)

Returns:
	gp_Vec

N is the order of derivation.  Raised if the continuity of the curve is not CN.  Raised if N < 1.  geometric transformations") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Integer N);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

Applies the transformation T to this trimmed curve.  
Warning The basis curve is also modified.") Transform;
		void Transform (const gp_Trsf & T);
		%feature("autodoc", "Args:
	U(Standard_Real)
	T(gp_Trsf)

Returns:
	virtual Standard_Real

Returns the  parameter on the  transformed  curve for  
         the transform of the point of parameter U on <self>.  
 
         me->Transformed(T)->Value(me->TransformedParameter(U,T))  
 
         is the same point as  
 
         me->Value(U).Transformed(T)  
 
         This methods calls the basis curve method.") TransformedParameter;
		virtual Standard_Real TransformedParameter (const Standard_Real U,const gp_Trsf & T);
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	virtual Standard_Real

Returns a  coefficient to compute the parameter on  
         the transformed  curve  for  the transform  of the  
         point on <self>.  
 
         Transformed(T)->Value(U * ParametricTransformation(T))  
 
         is the same point as  
 
         Value(U).Transformed(T)  
 
         This methods calls the basis curve method.") ParametricTransformation;
		virtual Standard_Real ParametricTransformation (const gp_Trsf & T);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Geometry

Creates a new object which is a copy of this trimmed curve.") Copy;
		Handle_Geom_Geometry Copy ();
};


%feature("shadow") Geom_TrimmedCurve::~Geom_TrimmedCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom_TrimmedCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Geom_TrimmedCurve {
	Handle_Geom_TrimmedCurve GetHandle() {
	return *(Handle_Geom_TrimmedCurve*) &$self;
	}
};

%nodefaultctor Handle_Geom_TrimmedCurve;
class Handle_Geom_TrimmedCurve : public Handle_Geom_BoundedCurve {

    public:
        // constructors
        Handle_Geom_TrimmedCurve();
        Handle_Geom_TrimmedCurve(const Handle_Geom_TrimmedCurve &aHandle);
        Handle_Geom_TrimmedCurve(const Geom_TrimmedCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Geom_TrimmedCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Geom_TrimmedCurve {
    Geom_TrimmedCurve* GetObject() {
    return (Geom_TrimmedCurve*)$self->Access();
    }
};
%feature("shadow") Handle_Geom_TrimmedCurve::~Handle_Geom_TrimmedCurve %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Geom_TrimmedCurve {
    void _kill_pointed() {
        delete $self;
    }
};

