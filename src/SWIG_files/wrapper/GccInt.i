/*
Copyright 2008-2020 Thomas Paviot (tpaviot@gmail.com)

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

%pythoncode {
from OCC.Core.Exception import *
};

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

/* python proy classes for enums */
%pythoncode {

class GccInt_IType:
	GccInt_Lin = 0
	GccInt_Cir = 1
	GccInt_Ell = 2
	GccInt_Par = 3
	GccInt_Hpr = 4
	GccInt_Pnt = 5
};
/* end python proxy for enums */

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
		%feature("autodoc", "Returns the type of bisecting object (line, circle, parabola, hyperbola, ellipse, point).

Returns
-------
GccInt_IType
") ArcType;
		virtual GccInt_IType ArcType();

		/****************** Circle ******************/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "Returns the bisecting line when arctype returns cir. an exception domainerror is raised if arctype is not a cir.

Returns
-------
gp_Circ2d
") Circle;
		virtual gp_Circ2d Circle();

		/****************** Ellipse ******************/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "Returns the bisecting line when arctype returns ell. an exception domainerror is raised if arctype is not an ell.

Returns
-------
gp_Elips2d
") Ellipse;
		virtual gp_Elips2d Ellipse();

		/****************** Hyperbola ******************/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "Returns the bisecting line when arctype returns hpr. an exception domainerror is raised if arctype is not a hpr.

Returns
-------
gp_Hypr2d
") Hyperbola;
		virtual gp_Hypr2d Hyperbola();

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Returns the bisecting line when arctype returns lin. an exception domainerror is raised if arctype is not a lin.

Returns
-------
gp_Lin2d
") Line;
		virtual gp_Lin2d Line();

		/****************** Parabola ******************/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "Returns the bisecting line when arctype returns par. an exception domainerror is raised if arctype is not a par.

Returns
-------
gp_Parab2d
") Parabola;
		virtual gp_Parab2d Parabola();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the bisecting line when arctype returns pnt. an exception domainerror is raised if arctype is not a pnt.

Returns
-------
gp_Pnt2d
") Point;
		virtual gp_Pnt2d Point();

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
		/****************** GccInt_BCirc ******************/
		%feature("compactdefaultargs") GccInt_BCirc;
		%feature("autodoc", "Constructs a bisecting curve whose geometry is the 2d circle circ.

Parameters
----------
Circ: gp_Circ2d

Returns
-------
None
") GccInt_BCirc;
		 GccInt_BCirc(const gp_Circ2d & Circ);

		/****************** ArcType ******************/
		%feature("compactdefaultargs") ArcType;
		%feature("autodoc", "Returns gccint_cir, which is the type of any gccint_bcirc bisecting curve.

Returns
-------
GccInt_IType
") ArcType;
		GccInt_IType ArcType();

		/****************** Circle ******************/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "Returns a 2d circle which is the geometry of this bisecting curve.

Returns
-------
gp_Circ2d
") Circle;
		virtual gp_Circ2d Circle();

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
		/****************** GccInt_BElips ******************/
		%feature("compactdefaultargs") GccInt_BElips;
		%feature("autodoc", "Constructs a bisecting curve whose geometry is the 2d ellipse ellipse.

Parameters
----------
Ellipse: gp_Elips2d

Returns
-------
None
") GccInt_BElips;
		 GccInt_BElips(const gp_Elips2d & Ellipse);

		/****************** ArcType ******************/
		%feature("compactdefaultargs") ArcType;
		%feature("autodoc", "Returns gccint_ell, which is the type of any gccint_belips bisecting curve.

Returns
-------
GccInt_IType
") ArcType;
		GccInt_IType ArcType();

		/****************** Ellipse ******************/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "Returns a 2d ellipse which is the geometry of this bisecting curve.

Returns
-------
gp_Elips2d
") Ellipse;
		virtual gp_Elips2d Ellipse();

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
		/****************** GccInt_BHyper ******************/
		%feature("compactdefaultargs") GccInt_BHyper;
		%feature("autodoc", "Constructs a bisecting curve whose geometry is the 2d hyperbola hyper.

Parameters
----------
Hyper: gp_Hypr2d

Returns
-------
None
") GccInt_BHyper;
		 GccInt_BHyper(const gp_Hypr2d & Hyper);

		/****************** ArcType ******************/
		%feature("compactdefaultargs") ArcType;
		%feature("autodoc", "Returns gccint_hpr, which is the type of any gccint_bhyper bisecting curve.

Returns
-------
GccInt_IType
") ArcType;
		GccInt_IType ArcType();

		/****************** Hyperbola ******************/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "Returns a 2d hyperbola which is the geometry of this bisecting curve.

Returns
-------
gp_Hypr2d
") Hyperbola;
		virtual gp_Hypr2d Hyperbola();

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
		/****************** GccInt_BLine ******************/
		%feature("compactdefaultargs") GccInt_BLine;
		%feature("autodoc", "Constructs a bisecting line whose geometry is the 2d line line.

Parameters
----------
Line: gp_Lin2d

Returns
-------
None
") GccInt_BLine;
		 GccInt_BLine(const gp_Lin2d & Line);

		/****************** ArcType ******************/
		%feature("compactdefaultargs") ArcType;
		%feature("autodoc", "Returns gccint_lin, which is the type of any gccint_bline bisecting line.

Returns
-------
GccInt_IType
") ArcType;
		GccInt_IType ArcType();

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Returns a 2d line which is the geometry of this bisecting line.

Returns
-------
gp_Lin2d
") Line;
		virtual gp_Lin2d Line();

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
		/****************** GccInt_BParab ******************/
		%feature("compactdefaultargs") GccInt_BParab;
		%feature("autodoc", "Constructs a bisecting curve whose geometry is the 2d parabola parab.

Parameters
----------
Parab: gp_Parab2d

Returns
-------
None
") GccInt_BParab;
		 GccInt_BParab(const gp_Parab2d & Parab);

		/****************** ArcType ******************/
		%feature("compactdefaultargs") ArcType;
		%feature("autodoc", "Returns gccint_par, which is the type of any gccint_bparab bisecting curve.

Returns
-------
GccInt_IType
") ArcType;
		GccInt_IType ArcType();

		/****************** Parabola ******************/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "Returns a 2d parabola which is the geometry of this bisecting curve.

Returns
-------
gp_Parab2d
") Parabola;
		virtual gp_Parab2d Parabola();

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
		/****************** GccInt_BPoint ******************/
		%feature("compactdefaultargs") GccInt_BPoint;
		%feature("autodoc", "Constructs a bisecting object whose geometry is the 2d point point.

Parameters
----------
Point: gp_Pnt2d

Returns
-------
None
") GccInt_BPoint;
		 GccInt_BPoint(const gp_Pnt2d & Point);

		/****************** ArcType ******************/
		%feature("compactdefaultargs") ArcType;
		%feature("autodoc", "Returns gccint_pnt, which is the type of any gccint_bpoint bisecting object.

Returns
-------
GccInt_IType
") ArcType;
		GccInt_IType ArcType();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns a 2d point which is the geometry of this bisecting object.

Returns
-------
gp_Pnt2d
") Point;
		virtual gp_Pnt2d Point();

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
