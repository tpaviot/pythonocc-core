/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)

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
%define GCCINTDOCSTRING
"GccInt module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_gccint.html"
%enddef
%module (package="OCC.Core", docstring=GCCINTDOCSTRING) GccInt


%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<GccInt_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<gp_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import gp.i
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

/* handles */
%wrap_handle(GccInt_Bisec)
%wrap_handle(GccInt_BCirc)
%wrap_handle(GccInt_BElips)
%wrap_handle(GccInt_BHyper)
%wrap_handle(GccInt_BLine)
%wrap_handle(GccInt_BParab)
%wrap_handle(GccInt_BPoint)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*********************
* class GccInt_Bisec *
*********************/
%nodefaultctor GccInt_Bisec;
class GccInt_Bisec : public Standard_Transient {
	public:
		/****************** ArcType ******************/
		%feature("compactdefaultargs") ArcType;
		%feature("autodoc", "* Returns the type of bisecting object (line, circle, parabola, hyperbola, ellipse, point).
	:rtype: GccInt_IType") ArcType;
		virtual GccInt_IType ArcType ();

		/****************** Circle ******************/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "* Returns the bisecting line when ArcType returns Cir. An exception DomainError is raised if ArcType is not a Cir.
	:rtype: gp_Circ2d") Circle;
		virtual gp_Circ2d Circle ();

		/****************** Ellipse ******************/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "* Returns the bisecting line when ArcType returns Ell. An exception DomainError is raised if ArcType is not an Ell.
	:rtype: gp_Elips2d") Ellipse;
		virtual gp_Elips2d Ellipse ();

		/****************** Hyperbola ******************/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "* Returns the bisecting line when ArcType returns Hpr. An exception DomainError is raised if ArcType is not a Hpr.
	:rtype: gp_Hypr2d") Hyperbola;
		virtual gp_Hypr2d Hyperbola ();

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "* Returns the bisecting line when ArcType returns Lin. An exception DomainError is raised if ArcType is not a Lin.
	:rtype: gp_Lin2d") Line;
		virtual gp_Lin2d Line ();

		/****************** Parabola ******************/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "* Returns the bisecting line when ArcType returns Par. An exception DomainError is raised if ArcType is not a Par.
	:rtype: gp_Parab2d") Parabola;
		virtual gp_Parab2d Parabola ();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "* Returns the bisecting line when ArcType returns Pnt. An exception DomainError is raised if ArcType is not a Pnt.
	:rtype: gp_Pnt2d") Point;
		virtual gp_Pnt2d Point ();

};


%make_alias(GccInt_Bisec)

%extend GccInt_Bisec {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class GccInt_BCirc *
*********************/
class GccInt_BCirc : public GccInt_Bisec {
	public:
		/****************** ArcType ******************/
		%feature("compactdefaultargs") ArcType;
		%feature("autodoc", "* Returns GccInt_Cir, which is the type of any GccInt_BCirc bisecting curve.
	:rtype: GccInt_IType") ArcType;
		GccInt_IType ArcType ();

		/****************** Circle ******************/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "* Returns a 2D circle which is the geometry of this bisecting curve.
	:rtype: gp_Circ2d") Circle;
		virtual gp_Circ2d Circle ();

		/****************** GccInt_BCirc ******************/
		%feature("compactdefaultargs") GccInt_BCirc;
		%feature("autodoc", "* Constructs a bisecting curve whose geometry is the 2D circle Circ.
	:param Circ:
	:type Circ: gp_Circ2d
	:rtype: None") GccInt_BCirc;
		 GccInt_BCirc (const gp_Circ2d & Circ);

};


%make_alias(GccInt_BCirc)

%extend GccInt_BCirc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class GccInt_BElips *
**********************/
class GccInt_BElips : public GccInt_Bisec {
	public:
		/****************** ArcType ******************/
		%feature("compactdefaultargs") ArcType;
		%feature("autodoc", "* Returns GccInt_Ell, which is the type of any GccInt_BElips bisecting curve.
	:rtype: GccInt_IType") ArcType;
		GccInt_IType ArcType ();

		/****************** Ellipse ******************/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "* Returns a 2D ellipse which is the geometry of this bisecting curve.
	:rtype: gp_Elips2d") Ellipse;
		virtual gp_Elips2d Ellipse ();

		/****************** GccInt_BElips ******************/
		%feature("compactdefaultargs") GccInt_BElips;
		%feature("autodoc", "* Constructs a bisecting curve whose geometry is the 2D ellipse Ellipse.
	:param Ellipse:
	:type Ellipse: gp_Elips2d
	:rtype: None") GccInt_BElips;
		 GccInt_BElips (const gp_Elips2d & Ellipse);

};


%make_alias(GccInt_BElips)

%extend GccInt_BElips {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class GccInt_BHyper *
**********************/
class GccInt_BHyper : public GccInt_Bisec {
	public:
		/****************** ArcType ******************/
		%feature("compactdefaultargs") ArcType;
		%feature("autodoc", "* Returns GccInt_Hpr, which is the type of any GccInt_BHyper bisecting curve.
	:rtype: GccInt_IType") ArcType;
		GccInt_IType ArcType ();

		/****************** GccInt_BHyper ******************/
		%feature("compactdefaultargs") GccInt_BHyper;
		%feature("autodoc", "* Constructs a bisecting curve whose geometry is the 2D hyperbola Hyper.
	:param Hyper:
	:type Hyper: gp_Hypr2d
	:rtype: None") GccInt_BHyper;
		 GccInt_BHyper (const gp_Hypr2d & Hyper);

		/****************** Hyperbola ******************/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "* Returns a 2D hyperbola which is the geometry of this bisecting curve.
	:rtype: gp_Hypr2d") Hyperbola;
		virtual gp_Hypr2d Hyperbola ();

};


%make_alias(GccInt_BHyper)

%extend GccInt_BHyper {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class GccInt_BLine *
*********************/
class GccInt_BLine : public GccInt_Bisec {
	public:
		/****************** ArcType ******************/
		%feature("compactdefaultargs") ArcType;
		%feature("autodoc", "* Returns GccInt_Lin, which is the type of any GccInt_BLine bisecting line.
	:rtype: GccInt_IType") ArcType;
		GccInt_IType ArcType ();

		/****************** GccInt_BLine ******************/
		%feature("compactdefaultargs") GccInt_BLine;
		%feature("autodoc", "* Constructs a bisecting line whose geometry is the 2D line Line.
	:param Line:
	:type Line: gp_Lin2d
	:rtype: None") GccInt_BLine;
		 GccInt_BLine (const gp_Lin2d & Line);

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "* Returns a 2D line which is the geometry of this bisecting line.
	:rtype: gp_Lin2d") Line;
		virtual gp_Lin2d Line ();

};


%make_alias(GccInt_BLine)

%extend GccInt_BLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class GccInt_BParab *
**********************/
class GccInt_BParab : public GccInt_Bisec {
	public:
		/****************** ArcType ******************/
		%feature("compactdefaultargs") ArcType;
		%feature("autodoc", "* Returns GccInt_Par, which is the type of any GccInt_BParab bisecting curve.
	:rtype: GccInt_IType") ArcType;
		GccInt_IType ArcType ();

		/****************** GccInt_BParab ******************/
		%feature("compactdefaultargs") GccInt_BParab;
		%feature("autodoc", "* Constructs a bisecting curve whose geometry is the 2D parabola Parab.
	:param Parab:
	:type Parab: gp_Parab2d
	:rtype: None") GccInt_BParab;
		 GccInt_BParab (const gp_Parab2d & Parab);

		/****************** Parabola ******************/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "* Returns a 2D parabola which is the geometry of this bisecting curve.
	:rtype: gp_Parab2d") Parabola;
		virtual gp_Parab2d Parabola ();

};


%make_alias(GccInt_BParab)

%extend GccInt_BParab {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class GccInt_BPoint *
**********************/
class GccInt_BPoint : public GccInt_Bisec {
	public:
		/****************** ArcType ******************/
		%feature("compactdefaultargs") ArcType;
		%feature("autodoc", "* Returns GccInt_Pnt, which is the type of any GccInt_BPoint bisecting object.
	:rtype: GccInt_IType") ArcType;
		GccInt_IType ArcType ();

		/****************** GccInt_BPoint ******************/
		%feature("compactdefaultargs") GccInt_BPoint;
		%feature("autodoc", "* Constructs a bisecting object whose geometry is the 2D point Point.
	:param Point:
	:type Point: gp_Pnt2d
	:rtype: None") GccInt_BPoint;
		 GccInt_BPoint (const gp_Pnt2d & Point);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "* Returns a 2D point which is the geometry of this bisecting object.
	:rtype: gp_Pnt2d") Point;
		virtual gp_Pnt2d Point ();

};


%make_alias(GccInt_BPoint)

%extend GccInt_BPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
