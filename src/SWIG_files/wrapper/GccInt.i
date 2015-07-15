/*
Copyright 2008-2015 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") GccInt

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

%include GccInt_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
enum GccInt_IType {
	GccInt_Lin = 0,
	GccInt_Cir = 1,
	GccInt_Ell = 2,
	GccInt_Par = 3,
	GccInt_Hpr = 4,
	GccInt_Pnt = 5,
};

/* end public enums declaration */

%nodefaultctor GccInt_Bisec;
class GccInt_Bisec : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") ArcType;
		%feature("autodoc", "	* Returns the type of bisecting object (line, circle, parabola, hyperbola, ellipse, point).

	:rtype: GccInt_IType
") ArcType;
		virtual GccInt_IType ArcType ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the bisecting line when ArcType returns Pnt. An exception DomainError is raised if ArcType is not a Pnt.

	:rtype: gp_Pnt2d
") Point;
		virtual gp_Pnt2d Point ();
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	* Returns the bisecting line when ArcType returns Lin. An exception DomainError is raised if ArcType is not a Lin.

	:rtype: gp_Lin2d
") Line;
		virtual gp_Lin2d Line ();
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "	* Returns the bisecting line when ArcType returns Cir. An exception DomainError is raised if ArcType is not a Cir.

	:rtype: gp_Circ2d
") Circle;
		virtual gp_Circ2d Circle ();
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "	* Returns the bisecting line when ArcType returns Hpr. An exception DomainError is raised if ArcType is not a Hpr.

	:rtype: gp_Hypr2d
") Hyperbola;
		virtual gp_Hypr2d Hyperbola ();
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "	* Returns the bisecting line when ArcType returns Par. An exception DomainError is raised if ArcType is not a Par.

	:rtype: gp_Parab2d
") Parabola;
		virtual gp_Parab2d Parabola ();
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "	* Returns the bisecting line when ArcType returns Ell. An exception DomainError is raised if ArcType is not an Ell.

	:rtype: gp_Elips2d
") Ellipse;
		virtual gp_Elips2d Ellipse ();
};


%feature("shadow") GccInt_Bisec::~GccInt_Bisec %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GccInt_Bisec {
	void _kill_pointed() {
		delete $self;
	}
};
%extend GccInt_Bisec {
	Handle_GccInt_Bisec GetHandle() {
	return *(Handle_GccInt_Bisec*) &$self;
	}
};

%nodefaultctor Handle_GccInt_Bisec;
class Handle_GccInt_Bisec : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_GccInt_Bisec();
        Handle_GccInt_Bisec(const Handle_GccInt_Bisec &aHandle);
        Handle_GccInt_Bisec(const GccInt_Bisec *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_GccInt_Bisec DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_GccInt_Bisec {
    GccInt_Bisec* GetObject() {
    return (GccInt_Bisec*)$self->Access();
    }
};
%feature("shadow") Handle_GccInt_Bisec::~Handle_GccInt_Bisec %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_GccInt_Bisec {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor GccInt_BCirc;
class GccInt_BCirc : public GccInt_Bisec {
	public:
		%feature("compactdefaultargs") GccInt_BCirc;
		%feature("autodoc", "	* Constructs a bisecting curve whose geometry is the 2D circle Circ.

	:param Circ:
	:type Circ: gp_Circ2d
	:rtype: None
") GccInt_BCirc;
		 GccInt_BCirc (const gp_Circ2d & Circ);
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "	* Returns a 2D circle which is the geometry of this bisecting curve.

	:rtype: gp_Circ2d
") Circle;
		virtual gp_Circ2d Circle ();
		%feature("compactdefaultargs") ArcType;
		%feature("autodoc", "	* Returns GccInt_Cir, which is the type of any GccInt_BCirc bisecting curve.

	:rtype: GccInt_IType
") ArcType;
		GccInt_IType ArcType ();
};


%feature("shadow") GccInt_BCirc::~GccInt_BCirc %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GccInt_BCirc {
	void _kill_pointed() {
		delete $self;
	}
};
%extend GccInt_BCirc {
	Handle_GccInt_BCirc GetHandle() {
	return *(Handle_GccInt_BCirc*) &$self;
	}
};

%nodefaultctor Handle_GccInt_BCirc;
class Handle_GccInt_BCirc : public Handle_GccInt_Bisec {

    public:
        // constructors
        Handle_GccInt_BCirc();
        Handle_GccInt_BCirc(const Handle_GccInt_BCirc &aHandle);
        Handle_GccInt_BCirc(const GccInt_BCirc *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_GccInt_BCirc DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_GccInt_BCirc {
    GccInt_BCirc* GetObject() {
    return (GccInt_BCirc*)$self->Access();
    }
};
%feature("shadow") Handle_GccInt_BCirc::~Handle_GccInt_BCirc %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_GccInt_BCirc {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor GccInt_BElips;
class GccInt_BElips : public GccInt_Bisec {
	public:
		%feature("compactdefaultargs") GccInt_BElips;
		%feature("autodoc", "	* Constructs a bisecting curve whose geometry is the 2D ellipse Ellipse.

	:param Ellipse:
	:type Ellipse: gp_Elips2d
	:rtype: None
") GccInt_BElips;
		 GccInt_BElips (const gp_Elips2d & Ellipse);
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "	* Returns a 2D ellipse which is the geometry of this bisecting curve.

	:rtype: gp_Elips2d
") Ellipse;
		virtual gp_Elips2d Ellipse ();
		%feature("compactdefaultargs") ArcType;
		%feature("autodoc", "	* Returns GccInt_Ell, which is the type of any GccInt_BElips bisecting curve.

	:rtype: GccInt_IType
") ArcType;
		GccInt_IType ArcType ();
};


%feature("shadow") GccInt_BElips::~GccInt_BElips %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GccInt_BElips {
	void _kill_pointed() {
		delete $self;
	}
};
%extend GccInt_BElips {
	Handle_GccInt_BElips GetHandle() {
	return *(Handle_GccInt_BElips*) &$self;
	}
};

%nodefaultctor Handle_GccInt_BElips;
class Handle_GccInt_BElips : public Handle_GccInt_Bisec {

    public:
        // constructors
        Handle_GccInt_BElips();
        Handle_GccInt_BElips(const Handle_GccInt_BElips &aHandle);
        Handle_GccInt_BElips(const GccInt_BElips *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_GccInt_BElips DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_GccInt_BElips {
    GccInt_BElips* GetObject() {
    return (GccInt_BElips*)$self->Access();
    }
};
%feature("shadow") Handle_GccInt_BElips::~Handle_GccInt_BElips %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_GccInt_BElips {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor GccInt_BHyper;
class GccInt_BHyper : public GccInt_Bisec {
	public:
		%feature("compactdefaultargs") GccInt_BHyper;
		%feature("autodoc", "	* Constructs a bisecting curve whose geometry is the 2D hyperbola Hyper.

	:param Hyper:
	:type Hyper: gp_Hypr2d
	:rtype: None
") GccInt_BHyper;
		 GccInt_BHyper (const gp_Hypr2d & Hyper);
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "	* Returns a 2D hyperbola which is the geometry of this bisecting curve.

	:rtype: gp_Hypr2d
") Hyperbola;
		virtual gp_Hypr2d Hyperbola ();
		%feature("compactdefaultargs") ArcType;
		%feature("autodoc", "	* Returns GccInt_Hpr, which is the type of any GccInt_BHyper bisecting curve.

	:rtype: GccInt_IType
") ArcType;
		GccInt_IType ArcType ();
};


%feature("shadow") GccInt_BHyper::~GccInt_BHyper %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GccInt_BHyper {
	void _kill_pointed() {
		delete $self;
	}
};
%extend GccInt_BHyper {
	Handle_GccInt_BHyper GetHandle() {
	return *(Handle_GccInt_BHyper*) &$self;
	}
};

%nodefaultctor Handle_GccInt_BHyper;
class Handle_GccInt_BHyper : public Handle_GccInt_Bisec {

    public:
        // constructors
        Handle_GccInt_BHyper();
        Handle_GccInt_BHyper(const Handle_GccInt_BHyper &aHandle);
        Handle_GccInt_BHyper(const GccInt_BHyper *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_GccInt_BHyper DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_GccInt_BHyper {
    GccInt_BHyper* GetObject() {
    return (GccInt_BHyper*)$self->Access();
    }
};
%feature("shadow") Handle_GccInt_BHyper::~Handle_GccInt_BHyper %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_GccInt_BHyper {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor GccInt_BLine;
class GccInt_BLine : public GccInt_Bisec {
	public:
		%feature("compactdefaultargs") GccInt_BLine;
		%feature("autodoc", "	* Constructs a bisecting line whose geometry is the 2D line Line.

	:param Line:
	:type Line: gp_Lin2d
	:rtype: None
") GccInt_BLine;
		 GccInt_BLine (const gp_Lin2d & Line);
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	* Returns a 2D line which is the geometry of this bisecting line.

	:rtype: gp_Lin2d
") Line;
		virtual gp_Lin2d Line ();
		%feature("compactdefaultargs") ArcType;
		%feature("autodoc", "	* Returns GccInt_Lin, which is the type of any GccInt_BLine bisecting line.

	:rtype: GccInt_IType
") ArcType;
		GccInt_IType ArcType ();
};


%feature("shadow") GccInt_BLine::~GccInt_BLine %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GccInt_BLine {
	void _kill_pointed() {
		delete $self;
	}
};
%extend GccInt_BLine {
	Handle_GccInt_BLine GetHandle() {
	return *(Handle_GccInt_BLine*) &$self;
	}
};

%nodefaultctor Handle_GccInt_BLine;
class Handle_GccInt_BLine : public Handle_GccInt_Bisec {

    public:
        // constructors
        Handle_GccInt_BLine();
        Handle_GccInt_BLine(const Handle_GccInt_BLine &aHandle);
        Handle_GccInt_BLine(const GccInt_BLine *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_GccInt_BLine DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_GccInt_BLine {
    GccInt_BLine* GetObject() {
    return (GccInt_BLine*)$self->Access();
    }
};
%feature("shadow") Handle_GccInt_BLine::~Handle_GccInt_BLine %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_GccInt_BLine {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor GccInt_BParab;
class GccInt_BParab : public GccInt_Bisec {
	public:
		%feature("compactdefaultargs") GccInt_BParab;
		%feature("autodoc", "	* Constructs a bisecting curve whose geometry is the 2D parabola Parab.

	:param Parab:
	:type Parab: gp_Parab2d
	:rtype: None
") GccInt_BParab;
		 GccInt_BParab (const gp_Parab2d & Parab);
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "	* Returns a 2D parabola which is the geometry of this bisecting curve.

	:rtype: gp_Parab2d
") Parabola;
		virtual gp_Parab2d Parabola ();
		%feature("compactdefaultargs") ArcType;
		%feature("autodoc", "	* Returns GccInt_Par, which is the type of any GccInt_BParab bisecting curve.

	:rtype: GccInt_IType
") ArcType;
		GccInt_IType ArcType ();
};


%feature("shadow") GccInt_BParab::~GccInt_BParab %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GccInt_BParab {
	void _kill_pointed() {
		delete $self;
	}
};
%extend GccInt_BParab {
	Handle_GccInt_BParab GetHandle() {
	return *(Handle_GccInt_BParab*) &$self;
	}
};

%nodefaultctor Handle_GccInt_BParab;
class Handle_GccInt_BParab : public Handle_GccInt_Bisec {

    public:
        // constructors
        Handle_GccInt_BParab();
        Handle_GccInt_BParab(const Handle_GccInt_BParab &aHandle);
        Handle_GccInt_BParab(const GccInt_BParab *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_GccInt_BParab DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_GccInt_BParab {
    GccInt_BParab* GetObject() {
    return (GccInt_BParab*)$self->Access();
    }
};
%feature("shadow") Handle_GccInt_BParab::~Handle_GccInt_BParab %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_GccInt_BParab {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor GccInt_BPoint;
class GccInt_BPoint : public GccInt_Bisec {
	public:
		%feature("compactdefaultargs") GccInt_BPoint;
		%feature("autodoc", "	* Constructs a bisecting object whose geometry is the 2D point Point.

	:param Point:
	:type Point: gp_Pnt2d
	:rtype: None
") GccInt_BPoint;
		 GccInt_BPoint (const gp_Pnt2d & Point);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns a 2D point which is the geometry of this bisecting object.

	:rtype: gp_Pnt2d
") Point;
		virtual gp_Pnt2d Point ();
		%feature("compactdefaultargs") ArcType;
		%feature("autodoc", "	* Returns GccInt_Pnt, which is the type of any GccInt_BPoint bisecting object.

	:rtype: GccInt_IType
") ArcType;
		GccInt_IType ArcType ();
};


%feature("shadow") GccInt_BPoint::~GccInt_BPoint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GccInt_BPoint {
	void _kill_pointed() {
		delete $self;
	}
};
%extend GccInt_BPoint {
	Handle_GccInt_BPoint GetHandle() {
	return *(Handle_GccInt_BPoint*) &$self;
	}
};

%nodefaultctor Handle_GccInt_BPoint;
class Handle_GccInt_BPoint : public Handle_GccInt_Bisec {

    public:
        // constructors
        Handle_GccInt_BPoint();
        Handle_GccInt_BPoint(const Handle_GccInt_BPoint &aHandle);
        Handle_GccInt_BPoint(const GccInt_BPoint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_GccInt_BPoint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_GccInt_BPoint {
    GccInt_BPoint* GetObject() {
    return (GccInt_BPoint*)$self->Access();
    }
};
%feature("shadow") Handle_GccInt_BPoint::~Handle_GccInt_BPoint %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_GccInt_BPoint {
    void _kill_pointed() {
        delete $self;
    }
};

